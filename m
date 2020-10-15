Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EF228F822
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 20:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7713.20317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT7dY-0007Pg-QK; Thu, 15 Oct 2020 18:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7713.20317; Thu, 15 Oct 2020 18:06:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT7dY-0007PH-NM; Thu, 15 Oct 2020 18:06:00 +0000
Received: by outflank-mailman (input) for mailman id 7713;
 Thu, 15 Oct 2020 18:05:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LXD=DW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kT7dX-0007PB-6z
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 18:05:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a32abb7-50cb-4704-8e62-86c9f1e33be4;
 Thu, 15 Oct 2020 18:05:58 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9E6122240;
 Thu, 15 Oct 2020 18:05:56 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+LXD=DW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kT7dX-0007PB-6z
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 18:05:59 +0000
X-Inumbo-ID: 5a32abb7-50cb-4704-8e62-86c9f1e33be4
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5a32abb7-50cb-4704-8e62-86c9f1e33be4;
	Thu, 15 Oct 2020 18:05:58 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E9E6122240;
	Thu, 15 Oct 2020 18:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602785157;
	bh=3ZXv7TN0z+XQ/IBIv2+pK/DMCeCBVLy6j6t4P2cgPb8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UAkE7RG2/Lw3W0U77KJ+MiS7QPDkkmS1KZHE8aAd/L2DyhCG6jJQCdlQlwKzVihM6
	 TzfEhVH3emuCjvhfSJjAZeicPIIb+UphtYfAppTmNuryX7MGHW3B0m16n5qZYW+BUg
	 BeQOqstIJMT2HqhfKCKB1uigejew3NIkbsMJjdPU=
Date: Thu, 15 Oct 2020 11:05:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    "open list:X86" <xen-devel@lists.xenproject.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Warn user on cpu errata 832075
In-Reply-To: <C07DA84A-6527-4480-99CC-F6B26553E3FE@arm.com>
Message-ID: <alpine.DEB.2.21.2010151104200.10386@sstabellini-ThinkPad-T480s>
References: <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com> <26742825-25fc-0f82-2b20-d536e8380b2a@citrix.com> <90BC5355-EB52-469F-B0A6-ACAAB9AD9EF5@arm.com> <f49d478f-4efe-955e-c378-f2fa5fbc6a71@xen.org>
 <alpine.DEB.2.21.2010141350170.10386@sstabellini-ThinkPad-T480s> <C07DA84A-6527-4480-99CC-F6B26553E3FE@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-574996916-1602785115=:10386"
Content-ID: <alpine.DEB.2.21.2010151105400.10386@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-574996916-1602785115=:10386
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2010151105401.10386@sstabellini-ThinkPad-T480s>

On Thu, 15 Oct 2020, Bertrand Marquis wrote:
> > On 14 Oct 2020, at 22:15, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Wed, 14 Oct 2020, Julien Grall wrote:
> >> On 14/10/2020 17:03, Bertrand Marquis wrote:
> >>>> On 14 Oct 2020, at 12:35, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >>>> 
> >>>> On 14/10/2020 11:41, Bertrand Marquis wrote:
> >>>>> When a Cortex A57 processor is affected by CPU errata 832075, a guest
> >>>>> not implementing the workaround for it could deadlock the system.
> >>>>> Add a warning during boot informing the user that only trusted guests
> >>>>> should be executed on the system.
> >>>>> An equivalent warning is already given to the user by KVM on cores
> >>>>> affected by this errata.
> >>>>> 
> >>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>>> ---
> >>>>> xen/arch/arm/cpuerrata.c | 21 +++++++++++++++++++++
> >>>>> 1 file changed, 21 insertions(+)
> >>>>> 
> >>>>> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> >>>>> index 6c09017515..8f9ab6dde1 100644
> >>>>> --- a/xen/arch/arm/cpuerrata.c
> >>>>> +++ b/xen/arch/arm/cpuerrata.c
> >>>>> @@ -240,6 +240,26 @@ static int enable_ic_inv_hardening(void *data)
> >>>>> 
> >>>>> #endif
> >>>>> 
> >>>>> +#ifdef CONFIG_ARM64_ERRATUM_832075
> >>>>> +
> >>>>> +static int warn_device_load_acquire_errata(void *data)
> >>>>> +{
> >>>>> +    static bool warned = false;
> >>>>> +
> >>>>> +    if ( !warned )
> >>>>> +    {
> >>>>> +        warning_add("This CPU is affected by the errata 832075.\n"
> >>>>> +                    "Guests without required CPU erratum workarounds\n"
> >>>>> +                    "can deadlock the system!\n"
> >>>>> +                    "Only trusted guests should be used on this
> >>>>> system.\n");
> >>>>> +        warned = true;
> >>>> 
> >>>> This is an antipattern, which probably wants fixing elsewhere as well.
> >>>> 
> >>>> warning_add() is __init.  It's not legitimate to call from a non-init
> >>>> function, and a less useless build system would have modpost to object.
> >>>> 
> >>>> The ARM_SMCCC_ARCH_WORKAROUND_1 instance asserts based on system state,
> >>>> but this provides no safety at all.
> >>>> 
> >>>> 
> >>>> What warning_add() actually does is queue messages for some point near
> >>>> the end of boot.  It's not clear that this is even a clever thing to do.
> >>>> 
> >>>> I'm very tempted to suggest a blanket change to printk_once().
> >>> 
> >>> If this is needed then this could be done in an other serie ?
> >> 
> >> The callback ->enable() will be called when a CPU is onlined/offlined. So this
> >> is going to require if you plan to support CPU hotplugs or suspend resume.
> >> 
> >>> Would be good to keep this patch as purely handling the errata.
> > 
> > My preference would be to keep this patch small with just the errata,
> > maybe using a simple printk_once as Andrew and Julien discussed.
> > 
> > There is another instance of warning_add potentially being called
> > outside __init in xen/arch/arm/cpuerrata.c:
> > enable_smccc_arch_workaround_1. So if you are up for it, it would be
> > good to produce a patch to fix that too.
> > 
> > 
> >> In the case of this patch, how about moving the warning_add() in
> >> enable_errata_workarounds()?
> >> 
> >> By then we should now all the errata present on your platform. All CPUs
> >> onlined afterwards (i.e. runtime) should always abide to the set discover
> >> during boot.
> > 
> > If I understand your suggestion correctly, it would work for
> > warn_device_load_acquire_errata, because it is just a warning, but it
> > would not work for enable_smccc_arch_workaround_1, because there is
> > actually a call to be made there.
> > 
> > Maybe it would be simpler to use printk_once in both cases? I don't have
> > a strong preference either way.
> 
> I could do the following (in a serie of 2 patches):
> - modify enable_smccc_arch_workaround_1 to use printk_once with a 
>   prefix/suffix “****” on each line printed (and maybe adapting print to fit a 
>   line length of 80)
> - modify my patch to do the print in enable_errata_workarounds using also
>   the prefix/suffix and printk_once
> 
> Please confirm that this strategy would fit everyone.

I think it is OK but if you are going to use printk_once in your patch
you might as well leave it in the .enable implementation.

Julien, what do you think?
--8323329-574996916-1602785115=:10386--

