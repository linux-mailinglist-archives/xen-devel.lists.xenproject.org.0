Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343161BA7C2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 17:19:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT5Wr-0004nv-1W; Mon, 27 Apr 2020 15:18:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jrem=6L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jT5Wq-0004np-1E
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 15:18:40 +0000
X-Inumbo-ID: 5dc71430-889a-11ea-97a9-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5dc71430-889a-11ea-97a9-12813bfff9fa;
 Mon, 27 Apr 2020 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588000717;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Pj8UqhKWdd240jsKB4Zxj2hveO4Nbw1TsD2WG40rUXo=;
 b=N5g7/tAndb0wtu1WzgxWm9+gIpQeDle5C0yl81tW3/2dg380ZISSQhTU
 F0f3uiOaC9zoog6GDkDONz9V03elnjHfPHrRN1LtLLVmiMVQwwc16NaBE
 yOpRAGHyiR/3MNbm3ngB7f5s1+vwiPwA8kHH7xJEN2PrYUtSeRjvK9KMi 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: S5u8J53EIvOwZQtoIW0tIhGFZ+3WaDHa3MRP8r/u1V+VErkXbN69jfBwJocQvkpHaZQalb6K4G
 8denFvGrP72Vw7RM4lWnKHf4donrBWqX//9IYgENINCKbQKM9jZh9mAl3EyXm7XgOXCW5oSNy7
 E942denuJ6RAJ0qtulE94i4A7e3jdlTJkL+Ec3lLwB4UA1S5XyHL+c6/P2hVgMgBmAfd8TdE03
 CrM9lz9t/odBDUtRhlup3Kh6tnNdyQEeFVauaZYHDaeEqI5Ha4X32paBY1K38xXNwHiEvIJMKJ
 IMs=
X-SBRS: 2.7
X-MesageID: 16997998
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16997998"
Date: Mon, 27 Apr 2020 17:18:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/ioemul: Rewrite stub generation
Message-ID: <20200427151829.GP28601@Air-de-Roger>
References: <20200427122041.7162-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200427122041.7162-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 27, 2020 at 01:20:41PM +0100, Andrew Cooper wrote:
> The logic is completely undocumented and almost impossible to follow.  It
> actually uses return oriented programming.  Rewrite it to conform to more
> normal call mechanics, and leave a big comment explaining thing.  As well as
> the code being easier to follow, it will execute faster as it isn't fighting
> the branch predictor.
> 
> Move the ioemul_handle_quirk() function pointer from traps.c to
> ioport_emulate.c.

Seeing as the newest quirk was added in 2008, I wonder if such quirks
are still relevant?

Maybe they are also used by newer boxes, I really have no idea.

> There is no reason for it to be in neither of the two
> translation units which use it.  Alter the behaviour to return the number of
> bytes written into the stub.
> 
> Access the addresses of the host/guest helpers with extern const char arrays.
> Nothing good will come of C thinking they are regular functions.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> --
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/ioport_emulate.c  | 11 ++---
>  xen/arch/x86/pv/emul-priv-op.c | 91 +++++++++++++++++++++++++++++++-----------
>  xen/arch/x86/pv/gpr_switch.S   | 37 +++++------------
>  xen/arch/x86/traps.c           |  3 --
>  xen/include/asm-x86/io.h       |  3 +-
>  5 files changed, 85 insertions(+), 60 deletions(-)
> 
> diff --git a/xen/arch/x86/ioport_emulate.c b/xen/arch/x86/ioport_emulate.c
> index 499c1f6056..f7511a9c49 100644
> --- a/xen/arch/x86/ioport_emulate.c
> +++ b/xen/arch/x86/ioport_emulate.c
> @@ -8,7 +8,10 @@
>  #include <xen/sched.h>
>  #include <xen/dmi.h>
>  
> -static bool ioemul_handle_proliant_quirk(
> +unsigned int (*ioemul_handle_quirk)(
> +    u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs);

uint8_t for opcode and also I think regs can be made const?

(at least looking at the only implementation from
ioemul_handle_proliant_quirk). I'm not familiar with this area
however.

> +
> +static unsigned int ioemul_handle_proliant_quirk(
>      u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs)
>  {
>      static const char stub[] = {
> @@ -19,18 +22,16 @@ static bool ioemul_handle_proliant_quirk(
>          0xa8, 0x80, /*    test $0x80, %al */
>          0x75, 0xfb, /*    jnz 1b          */
>          0x9d,       /*    popf            */
> -        0xc3,       /*    ret             */
>      };
>      uint16_t port = regs->dx;
>      uint8_t value = regs->al;
>  
>      if ( (opcode != 0xee) || (port != 0xcd4) || !(value & 0x80) )
> -        return false;
> +        return 0;
>  
>      memcpy(io_emul_stub, stub, sizeof(stub));
> -    BUILD_BUG_ON(IOEMUL_QUIRK_STUB_BYTES < sizeof(stub));
>  
> -    return true;
> +    return sizeof(stub);
>  }
>  
>  /* This table is the set of system-specific I/O emulation hooks. */
> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> index e24b84f46a..f150886711 100644
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -54,51 +54,96 @@ struct priv_op_ctxt {
>      unsigned int bpmatch;
>  };
>  
> -/* I/O emulation support. Helper routines for, and type of, the stack stub. */
> -void host_to_guest_gpr_switch(struct cpu_user_regs *);
> -unsigned long guest_to_host_gpr_switch(unsigned long);
> +/* I/O emulation helpers.  Use non-standard calling conventions. */
> +extern const char load_guest_gprs[], save_guest_gprs[];
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
> +     * helpers (abnormal calling conventions), and one of several possible
> +     * stubs performing the real I/O.
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

I'm not sure I get the point of using signed integers instead of
unsigned ones, AFAICT you just want to check that the displacement is
< 4GB so that a relative call can be used?

Thanks, Roger.

