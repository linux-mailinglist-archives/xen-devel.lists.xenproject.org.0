Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD51AFBE02
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 00:00:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035864.1408255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtt6-0007KY-PC; Mon, 07 Jul 2025 22:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035864.1408255; Mon, 07 Jul 2025 22:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtt6-0007I2-MK; Mon, 07 Jul 2025 22:00:36 +0000
Received: by outflank-mailman (input) for mailman id 1035864;
 Mon, 07 Jul 2025 22:00:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uYtt5-0007Hw-Cx
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 22:00:35 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd5e509d-5b7d-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 00:00:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9BD4961120;
 Mon,  7 Jul 2025 22:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E24C4CEE3;
 Mon,  7 Jul 2025 22:00:29 +0000 (UTC)
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
X-Inumbo-ID: cd5e509d-5b7d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751925631;
	bh=CCSXkrnqUS3TAJwJ2ZAuz6hP/wy4/5GYwJTC6It1MEs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UoJqeTKKVeIv0BLVYHtJPj/NYRCtwC7VpD3FjjJkyIXQVYfEbRaLgPWilhFnH3JKY
	 wUae2Hdw9WVtgSz/L8EAmibeBQWZfUG+wQc9e9zmCdvw7eXJRgOeMrFbqDJfywbuWK
	 kvqQ4vCc1BgLJQxq8xvWZC7b77SIPNXP1FsyjPgHfvgLOi/FaPOX9WDzqAjzOuNsI5
	 Q45ZmuDZQQStg6rZ5FLsVUbW+SOsmgFwRGR1Qv8k6CJ1KIRuFa6hzT3ykq1NySc1u3
	 EZL9X+3C0aye/tSvl4OH6Or1H6oeWLaF90mO5zrYgOKGCx9yyEuJLCZ4ELtFTBd7SZ
	 S6CzcCM132H9g==
Date: Mon, 7 Jul 2025 15:00:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=83=C2=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen/x86: address violations of Rule 11.3
In-Reply-To: <b31da849-283e-4f84-854a-50da2d0878d7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507071453370.605088@ubuntu-linux-20-04-desktop>
References: <20250624002018.4121819-1-victorm.lira@amd.com> <20250624002018.4121819-2-victorm.lira@amd.com> <b31da849-283e-4f84-854a-50da2d0878d7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Jun 2025, Jan Beulich wrote:
> On 24.06.2025 02:20, victorm.lira@amd.com wrote:
> > From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > 
> > Use {get,put}_unaligned_t to ensure that reads and writes are
> > safe to perform even on potentially misaligned pointers.
> 
> Also applicable to the Arm patch: Please can such patches mention the
> main subject of the rule, not just the number?

+1


> Overall I'm unconvinced we really want or need this on x86; I'm curious
> what Andrew and Roger think.

To be honest, I had a similar reaction to you, which is why I suggested
on Matrix to:

- deviate the rule in its entirety on x86
- deviate the rule for all mappings except for devmem mappings on ARM

Leaving aside ARM for a second (this is exactly the kind of very
arch-specific behavior that is OK to device differently per
architecture), would you be OK with deviating the rule in its entirety on
x86?

Or do you prefer to continue with this patch?


> Further, even beyond the respective remark
> below, I'd be pretty surprised if these were all of the places that
> would need fiddling with. Mind me asking how the places to touch were
> identified? (This may actually be a good thing to mention in the
> description.)

The patch is simply based on the violations reported by the ECLAIR scan.


> > @@ -388,7 +392,7 @@ static int init_or_livepatch apply_alt_calls(
> >              return -EINVAL;
> >          }
> > 
> > -        disp = *(int32_t *)(orig + 2);
> > +        disp = get_unaligned_t(int32_t, orig + 2);
> >          dest = *(const void **)(orig + 6 + disp);
> 
> Why is this latter line not also adjusted? The field is expected to be
> aligned, yes, but for the code here there's no guarantee. Imo if this
> was left alone along with applying the suggested change, a code comment
> would need adding.
> 
> > --- a/xen/arch/x86/include/asm/hvm/vlapic.h
> > +++ b/xen/arch/x86/include/asm/hvm/vlapic.h
> > @@ -10,6 +10,7 @@
> >  #define __ASM_X86_HVM_VLAPIC_H__
> > 
> >  #include <xen/tasklet.h>
> > +#include <xen/unaligned.h>
> >  #include <asm/hvm/vpt.h>
> > 
> >  #define vcpu_vlapic(x)   (&(x)->arch.hvm.vlapic)
> > @@ -85,13 +86,13 @@ struct vlapic {
> >  static inline uint32_t vlapic_get_reg(const struct vlapic *vlapic,
> >                                        uint32_t reg)
> >  {
> > -    return *((uint32_t *)(&vlapic->regs->data[reg]));
> > +    return get_unaligned_t(uint32_t, &vlapic->regs->data[reg]);
> 
> This, aiui (or should I say "I hope"), also addresses another violation
> (casting away of const). Such will want mentioning in the description,
> imo.
> 
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -1249,7 +1249,7 @@ void asmlinkage __init noreturn __start_xen(void)
> >                 (caps & 2) ? " V2" : "",
> >                 !(caps & 3) ? " none" : "");
> >          printk("EDID transfer time: %d seconds\n", caps >> 8);
> > -        if ( *(u32 *)bootsym(boot_edid_info) == 0x13131313 )
> > +        if ( get_unaligned_t(u32, bootsym(boot_edid_info)) == 0x13131313 )
> 
> When touching such, please can you also convert to uint<N>_t?
> 
> Jan
> 

