Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1712F1DE875
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 16:03:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc8Gd-0001BQ-CY; Fri, 22 May 2020 14:03:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=knsM=7E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jc8Gc-0001BL-FC
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 14:03:18 +0000
X-Inumbo-ID: fbce02d2-9c34-11ea-abe0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbce02d2-9c34-11ea-abe0-12813bfff9fa;
 Fri, 22 May 2020 14:03:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8336FB114;
 Fri, 22 May 2020 14:03:18 +0000 (UTC)
Subject: Re: [PATCH v2] x86/ioemul: Rewrite stub generation to be shadow stack
 compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200522102435.14329-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <502e32d2-5e4c-7c84-417e-7b1e44a0d8b4@suse.com>
Date: Fri, 22 May 2020 16:03:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522102435.14329-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.05.2020 12:24, Andrew Cooper wrote:
> --- a/xen/arch/x86/ioport_emulate.c
> +++ b/xen/arch/x86/ioport_emulate.c
> @@ -8,7 +8,10 @@
>  #include <xen/sched.h>
>  #include <xen/dmi.h>
>  
> -static bool ioemul_handle_proliant_quirk(
> +unsigned int __read_mostly (*ioemul_handle_quirk)(

I guess the more correct (and long term supported) placement is

unsigned int (*__read_mostly ioemul_handle_quirk)(

as you mean to modify the variable, not its type.

> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -47,51 +47,97 @@ struct priv_op_ctxt {
>      unsigned int bpmatch;
>  };
>  
> -/* I/O emulation support. Helper routines for, and type of, the stack stub. */
> -void host_to_guest_gpr_switch(struct cpu_user_regs *);
> -unsigned long guest_to_host_gpr_switch(unsigned long);
> +/* I/O emulation helpers.  Use non-standard calling conventions. */
> +void nocall load_guest_gprs(struct cpu_user_regs *);
> +void nocall save_guest_gprs(void);
>  
>  typedef void io_emul_stub_t(struct cpu_user_regs *);
>  
>  static io_emul_stub_t *io_emul_stub_setup(struct priv_op_ctxt *ctxt, u8 opcode,
>                                            unsigned int port, unsigned int bytes)
>  {
> +    /*
> +     * Construct a stub for IN/OUT emulation.
> +     *
> +     * Some platform drivers communicate with the SMM handler using GPRs as a
> +     * mailbox.  Therefore, we must perform the emulation with the hardware
> +     * domain's registers in view.
> +     *
> +     * We write a stub of the following form, using the guest load/save
> +     * helpers (non-standard ABI), and one of several possible stubs
> +     * performing the real I/O.
> +     */
> +    static const char prologue[] = {
> +        0x53,       /* push %rbx */
> +        0x55,       /* push %rbp */
> +        0x41, 0x54, /* push %r12 */
> +        0x41, 0x55, /* push %r13 */
> +        0x41, 0x56, /* push %r14 */
> +        0x41, 0x57, /* push %r15 */
> +        0x57,       /* push %rdi (param for save_guest_gprs) */
> +    };              /* call load_guest_gprs */
> +                    /* <I/O stub> */
> +                    /* call save_guest_gprs */
> +    static const char epilogue[] = {
> +        0x5f,       /* pop %rdi  */
> +        0x41, 0x5f, /* pop %r15  */
> +        0x41, 0x5e, /* pop %r14  */
> +        0x41, 0x5d, /* pop %r13  */
> +        0x41, 0x5c, /* pop %r12  */
> +        0x5d,       /* pop %rbp  */
> +        0x5b,       /* pop %rbx  */
> +        0xc3,       /* ret       */
> +    };
> +
>      struct stubs *this_stubs = &this_cpu(stubs);
>      unsigned long stub_va = this_stubs->addr + STUB_BUF_SIZE / 2;
> -    long disp;
> -    bool use_quirk_stub = false;
> +    unsigned int quirk_bytes = 0;
> +    char *p;
> +
> +    /* Helpers - Read outer scope but only modify p. */
> +#define APPEND_BUFF(b) ({ memcpy(p, b, sizeof(b)); p += sizeof(b); })
> +#define APPEND_CALL(f)                                                  \
> +    ({                                                                  \
> +        long disp = (long)(f) - (stub_va + p - ctxt->io_emul_stub + 5); \
> +        BUG_ON((int32_t)disp != disp);                                  \
> +        *p++ = 0xe8;                                                    \
> +        *(int32_t *)p = disp; p += 4;                                   \
> +    })
>  
>      if ( !ctxt->io_emul_stub )
>          ctxt->io_emul_stub =
>              map_domain_page(_mfn(this_stubs->mfn)) + (stub_va & ~PAGE_MASK);
>  
> -    /* call host_to_guest_gpr_switch */
> -    ctxt->io_emul_stub[0] = 0xe8;
> -    disp = (long)host_to_guest_gpr_switch - (stub_va + 5);
> -    BUG_ON((int32_t)disp != disp);
> -    *(int32_t *)&ctxt->io_emul_stub[1] = disp;
> +    p = ctxt->io_emul_stub;
> +
> +    APPEND_BUFF(prologue);
> +    APPEND_CALL(load_guest_gprs);
>  
> +    /* Some platforms might need to quirk the stub for specific inputs. */
>      if ( unlikely(ioemul_handle_quirk) )
> -        use_quirk_stub = ioemul_handle_quirk(opcode, &ctxt->io_emul_stub[5],
> -                                             ctxt->ctxt.regs);
> +    {
> +        quirk_bytes = ioemul_handle_quirk(opcode, p, ctxt->ctxt.regs);
> +        p += quirk_bytes;
> +    }
>  
> -    if ( !use_quirk_stub )
> +    /* Default I/O stub. */
> +    if ( likely(!quirk_bytes) )
>      {
> -        /* data16 or nop */
> -        ctxt->io_emul_stub[5] = (bytes != 2) ? 0x90 : 0x66;
> -        /* <io-access opcode> */
> -        ctxt->io_emul_stub[6] = opcode;
> -        /* imm8 or nop */
> -        ctxt->io_emul_stub[7] = !(opcode & 8) ? port : 0x90;
> -        /* ret (jumps to guest_to_host_gpr_switch) */
> -        ctxt->io_emul_stub[8] = 0xc3;
> +        *p++ = (bytes != 2) ? 0x90 : 0x66;  /* data16 or nop */
> +        *p++ = opcode;                      /* <opcode>      */
> +        *p++ = !(opcode & 8) ? port : 0x90; /* imm8 or nop   */
>      }
>  
> -    BUILD_BUG_ON(STUB_BUF_SIZE / 2 < MAX(9, /* Default emul stub */
> -                                         5 + IOEMUL_QUIRK_STUB_BYTES));
> +    APPEND_CALL(save_guest_gprs);
> +    APPEND_BUFF(epilogue);
> +
> +    BUG_ON(STUB_BUF_SIZE / 2 < (p - ctxt->io_emul_stub));

I continue to view this as a dis-improvement, because a bug here
may go unnoticed for a very long time, until someone runs Xen
on one of the affected Proliants _and_ invokes an action
triggering the quirk code. I don't see any better alternative
than what I think I had already described. Hence preferably with
the remark further up addressed
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

