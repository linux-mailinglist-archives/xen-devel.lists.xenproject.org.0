Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2FFACFA0C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 01:40:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007698.1386963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNKBj-0005Wj-BC; Thu, 05 Jun 2025 23:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007698.1386963; Thu, 05 Jun 2025 23:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNKBj-0005Ur-8Q; Thu, 05 Jun 2025 23:39:59 +0000
Received: by outflank-mailman (input) for mailman id 1007698;
 Thu, 05 Jun 2025 23:39:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBp0=YU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNKBh-0005Ul-Gd
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 23:39:57 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60166b1b-4266-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 01:39:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A01FD629FB;
 Thu,  5 Jun 2025 23:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C01EC4CEF4;
 Thu,  5 Jun 2025 23:39:49 +0000 (UTC)
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
X-Inumbo-ID: 60166b1b-4266-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749166790;
	bh=/7eTanIN2cOphn116VXxlxBPs/r6D0Mt5hQpzOL7zcY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mU4/8KiParUT1mmYlNUpRhhO0PTB1zE7nN/GhE6R5tIc3YK2OpxVmE3fBPKWru0E8
	 TyTt33jfwXb0H9Bf4AsUEI2Z2BO9UAljvqOOfR9MGCrV5tlins5ecNNcczHmz/M2Av
	 xAAOKvpqlMonsX/5Hhtd50eO3rTQVFarA3MMe+K8eR4f55GLMCfkNbIVlV1wbtwGCN
	 gIbnroZbG8Q7Tu3MrEGV+Y+ITRBLQrpT7dfYpvABPZ2zVfS8re+1bmQ+/qxpo7M8wx
	 0puKkj6heKROsXpTAduHLqAJjoBerLo6IoyGkijE85vMQw2Fttr70l48/NboKf5CsW
	 ZwOLVBUBDYwLA==
Date: Thu, 5 Jun 2025 16:39:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    xen-devel@lists.xenproject.org, nicola.vetrini@bugseng.com, 
    federico.serafini@bugseng.com
Subject: Re: [PATCH] x86: remove memcmp calls non-compliant with Rule
 21.16.
In-Reply-To: <c252a43a-4e00-4584-bbb1-05347aa9b49f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506051624050.2495561@ubuntu-linux-20-04-desktop>
References: <20250604233537.2892206-1-stefano.stabellini@amd.com> <c252a43a-4e00-4584-bbb1-05347aa9b49f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Jan Beulich wrote:
> On 05.06.2025 01:35, Stefano Stabellini wrote:
> > From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> > 
> > MISRA C Rule 21.16 states the following: "The pointer arguments to
> > the Standard Library function `memcmp' shall point to either a pointer
> > type, an essentially signed type, an essentially unsigned type, an
> > essentially Boolean type or an essentially enum type".
> > 
> > Comparing string literals with char arrays is more appropriately
> > done via strncmp.
> 
> More appropriately - maybe. Yet less efficiently. IOW I view ...
> 
> > No functional change.
> 
> ... this as at the edge of not being true.
> 
> > Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> 
> Missing your own S-o-b.
>
> Also (nit) may I ask that you drop the full stop from the patch subject?

I'll add the S-o-B and fix the subject


> > --- a/xen/arch/x86/dmi_scan.c
> > +++ b/xen/arch/x86/dmi_scan.c
> > @@ -233,7 +233,7 @@ void __init dmi_efi_get_table(const void *smbios, const void *smbios3)
> >  	const struct smbios_eps *eps = smbios;
> >  	const struct smbios3_eps *eps3 = smbios3;
> >  
> > -	if (eps3 && memcmp(eps3->anchor, "_SM3_", 5) == 0 &&
> > +	if (eps3 && strncmp(eps3->anchor, "_SM3_", 5) == 0 &&
> 
> Unlike the last example given in the doc, this does not pose the risk of
> false "not equal" returns. Considering there's no example there exactly
> matching this situation, I'm not convinced a change is actually needed.
> (Applies to all other changes here, too.)

If we consider string literals "pointer types", then I think you are
right that this would fall under what is permitted by 21.16. Nicola,
what do you think?


> > @@ -302,7 +302,7 @@ const char *__init dmi_get_table(paddr_t *base, u32 *len)
> >  				continue;
> >  			memcpy_fromio(&eps.dmi + 1, q + sizeof(eps.dmi),
> >  			              sizeof(eps.smbios3) - sizeof(eps.dmi));
> > -			if (!memcmp(eps.smbios3.anchor, "_SM3_", 5) &&
> > +			if (strncmp(eps.smbios3.anchor, "_SM3_", 5) == 0 &&
> 
> Here and below there's a further (style) change, moving from ! to "== 0"
> (or from implicit boolean to "!= 0"). As we use the original style in many
> other places, some justification for this extra change would be needed in
> the description (or these extra adjustments be dropped).
 
The adjustments can be dropped


> > @@ -720,10 +720,10 @@ static void __init efi_check_config(void)
> >  	__set_fixmap(FIX_EFI_MPF, PFN_DOWN(efi.mps), __PAGE_HYPERVISOR);
> >  	mpf = fix_to_virt(FIX_EFI_MPF) + ((long)efi.mps & (PAGE_SIZE-1));
> >  
> > -	if (memcmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
> > -	    mpf->mpf_length == 1 &&
> > -	    mpf_checksum((void *)mpf, 16) &&
> > -	    (mpf->mpf_specification == 1 || mpf->mpf_specification == 4)) {
> > +	if (strncmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
> > +            mpf->mpf_length == 1 &&
> > +            mpf_checksum((void *)mpf, 16) &&
> > +            (mpf->mpf_specification == 1 || mpf->mpf_specification == 4)) {
> >  		smp_found_config = true;
> >  		printk(KERN_INFO "SMP MP-table at %08lx\n", efi.mps);
> >  		mpf_found = mpf;
> 
> There are extra (indentation) changes here which ought to be dropped.

Yes 

