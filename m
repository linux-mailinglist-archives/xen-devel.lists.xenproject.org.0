Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210163108BB
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 11:11:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81570.150830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7y4H-0005MC-TC; Fri, 05 Feb 2021 10:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81570.150830; Fri, 05 Feb 2021 10:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7y4H-0005Lp-Po; Fri, 05 Feb 2021 10:10:25 +0000
Received: by outflank-mailman (input) for mailman id 81570;
 Fri, 05 Feb 2021 10:10:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IalI=HH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7y4F-0005Lk-RZ
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 10:10:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5e06275-3b04-4533-871c-f751f6c419d5;
 Fri, 05 Feb 2021 10:10:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D412AB113;
 Fri,  5 Feb 2021 10:10:20 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c5e06275-3b04-4533-871c-f751f6c419d5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612519821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Pxr9R0Ucn7udxBrgJVKqihdfuhAH52HDrtFL4xAcg0=;
	b=VS60mCXqj0LkAay6s4Uf3izCyZmcYq6vzramkHSB4Vu88lRiJ1WBcBsF84FFB9kVPazXck
	eKmSLPRuqQsAm/YInn1hPH2J0FV6exBfwRMMRnrXhIT0gkF9zGL+GiiVx3V/hEzmSilrPy
	TaLB5kAf731W2bWa1nFHTy8jyaOCfkE=
Subject: Ping: [PATCH] x86emul: de-duplicate scatters to the same linear
 address
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <6064996d-943f-1be3-9bfd-e872149da2a1@suse.com>
Message-ID: <a9739f4a-cfc6-673c-f2a7-a21723eda199@suse.com>
Date: Fri, 5 Feb 2021 11:10:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6064996d-943f-1be3-9bfd-e872149da2a1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.11.2020 14:26, Jan Beulich wrote:
> The SDM specifically allows for earlier writes to fully overlapping
> ranges to be dropped. If a guest did so, hvmemul_phys_mmio_access()
> would crash it if varying data was written to the same address. Detect
> overlaps early, as doing so in hvmemul_{linear,phys}_mmio_access() would
> be quite a bit more difficult.
> 
> Note that due to cache slot use being linear address based, there's no
> similar issue with multiple writes to the same physical address (mapped
> through different linear addresses).
> 
> Since this requires an adjustment to the EVEX Disp8 scaling test,
> correct a comment there at the same time.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: The SDM isn't entirely unambiguous about the faulting behavior in
>      this case: If a fault would need delivering on the earlier slot
>      despite the write getting squashed, we'd have to call ops->write()
>      with size set to zero for the earlier write(s). However,
>      hvm/emulate.c's handling of zero-byte accesses extends only to the
>      virtual-to-linear address conversions (and raising of involved
>      faults), so in order to also observe #PF changes to that logic
>      would then also be needed. Can we live with a possible misbehavior
>      here?
> 
> --- a/tools/tests/x86_emulator/evex-disp8.c
> +++ b/tools/tests/x86_emulator/evex-disp8.c
> @@ -647,8 +647,8 @@ static const uint16_t imm0f[16] = {
>  static struct x86_emulate_ops emulops;
>  
>  /*
> - * Access tracking (by granular) is used on the first 64 bytes of address
> - * space. Instructions get encode with a raw Disp8 value of 1, which then
> + * Access tracking (byte granular) is used on the first bytes of address
> + * space. Instructions get encoded with a raw Disp8 value of 1, which then
>   * gets scaled accordingly. Hence accesses below the address <scaling factor>
>   * as well as at or above 2 * <scaling factor> are indications of bugs. To
>   * aid diagnosis / debugging, track all accesses below 3 * <scaling factor>.
> @@ -804,6 +804,31 @@ static void test_one(const struct test *
>  
>      asm volatile ( "kxnorw %k1, %k1, %k1" );
>      asm volatile ( "vxorps %xmm4, %xmm4, %xmm4" );
> +    if ( sg && (test->opc | 3) == 0xa3 )
> +    {
> +        /*
> +         * Non-prefetch scatters need handling specially, due to the
> +         * overlapped write elimination done by the emulator. The order of
> +         * indexes chosen is somewhat arbitrary, within the constraints
> +         * imposed by the various different uses.
> +         */
> +        static const struct {
> +            int32_t _[16];
> +        } off32 = {{ 1, 0, 2, 3, 7, 6, 5, 4, 8, 10, 12, 14, 9, 11, 13, 15 }};
> +
> +        if ( test->opc & 1 )
> +        {
> +            asm volatile ( "vpmovsxdq %0, %%zmm4" :: "m" (off32) );
> +            vsz >>= !evex.w;
> +        }
> +        else
> +            asm volatile ( "vmovdqu32 %0, %%zmm4" :: "m" (off32) );
> +
> +        /* Scale by element size. */
> +        instr[6] |= (evex.w | 2) << 6;
> +
> +        sg = false;
> +    }
>  
>      ctxt->regs->eip = (unsigned long)&instr[0];
>      ctxt->regs->edx = 0;
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -10032,25 +10032,47 @@ x86_emulate(
>  
>          for ( i = 0; op_mask; ++i )
>          {
> -            long idx = b & 1 ? index.qw[i] : index.dw[i];
> +            long idx = (b & 1 ? index.qw[i]
> +                              : index.dw[i]) * (1 << state->sib_scale);
> +            unsigned long offs = truncate_ea(ea.mem.off + idx);
> +            unsigned int j;
>  
>              if ( !(op_mask & (1 << i)) )
>                  continue;
>  
> -            rc = ops->write(ea.mem.seg,
> -                            truncate_ea(ea.mem.off +
> -                                        idx * (1 << state->sib_scale)),
> -                            (void *)mmvalp + i * op_bytes, op_bytes, ctxt);
> -            if ( rc != X86EMUL_OKAY )
> +            /*
> +             * hvmemul_linear_mmio_access() will find a cache slot based on
> +             * linear address. hvmemul_phys_mmio_access() will crash the
> +             * domain if observing varying data getting written to the same
> +             * address within a cache slot. Utilize that squashing earlier
> +             * writes to fully overlapping addresses is permitted by the spec.
> +             */
> +            for ( j = i + 1; j < n; ++j )
>              {
> -                /* See comment in gather emulation. */
> -                if ( rc != X86EMUL_EXCEPTION && done )
> -                    rc = X86EMUL_RETRY;
> -                break;
> +                long idx2 = (b & 1 ? index.qw[j]
> +                                   : index.dw[j]) * (1 << state->sib_scale);
> +
> +                if ( (op_mask & (1 << j)) &&
> +                     truncate_ea(ea.mem.off + idx2) == offs )
> +                    break;
> +            }
> +
> +            if ( j >= n )
> +            {
> +                rc = ops->write(ea.mem.seg, offs,
> +                                (void *)mmvalp + i * op_bytes, op_bytes, ctxt);
> +                if ( rc != X86EMUL_OKAY )
> +                {
> +                    /* See comment in gather emulation. */
> +                    if ( rc != X86EMUL_EXCEPTION && done )
> +                        rc = X86EMUL_RETRY;
> +                    break;
> +                }
> +
> +                done = true;
>              }
>  
>              op_mask &= ~(1 << i);
> -            done = true;
>  
>  #ifdef __XEN__
>              if ( op_mask && local_events_need_delivery() )
> 


