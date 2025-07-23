Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5666EB0FB78
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 22:30:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054712.1423397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueg6h-0002Ba-W6; Wed, 23 Jul 2025 20:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054712.1423397; Wed, 23 Jul 2025 20:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueg6h-00029e-TS; Wed, 23 Jul 2025 20:30:31 +0000
Received: by outflank-mailman (input) for mailman id 1054712;
 Wed, 23 Jul 2025 20:30:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KKGU=2E=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ueg6g-00029Y-Ii
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 20:30:30 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de532b3e-6803-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 22:30:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 96A5243E80;
 Wed, 23 Jul 2025 20:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65CEC4CEE7;
 Wed, 23 Jul 2025 20:30:24 +0000 (UTC)
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
X-Inumbo-ID: de532b3e-6803-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753302626;
	bh=CR7WbSFur7J9z2rLZvpD3dPZTuA/ZTxtGZw61k47icg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rwMG7Yxt9ZMDBac+kMWb/hVbidPzHuSMkpsbiGNacT731d34xEtJXAoZzaxUzPfxw
	 MVyVAM/0E8bkVG2uvRv21HELtzj+WeySKAATqz6dK6qH2MykHZikQr9LN1y//6c402
	 n8nDI42yMC/Yf9SAssFzg7S7YlucxN7IkcU+O/rVsWUVmfu1prf60+DcLoTHGWNUtI
	 4j6VJIzvPgj990uDMSi/v3loXymxFAe2l3sS/QRuRnHVyQ4uTPhnQLJxtA4wrZQiDU
	 HMP0/5KJLgRm8P6d7yFFAiTBLa9N+IKGmqMeoXPYzNNSQlwbflMmsZ0zN1KL+6ldb4
	 j6T9sOWBXn6LA==
Date: Wed, 23 Jul 2025 13:30:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] xen: move getdomaininfo() to domain.c
In-Reply-To: <f75df6d6-ede6-41a6-9412-1a9b073902b5@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507231327280.7043@ubuntu-linux-20-04-desktop>
References: <20250722050410.853783-1-Penny.Zheng@amd.com> <0939219f-1c06-4d0d-a427-6b95b5943513@suse.com> <alpine.DEB.2.22.394.2507221738090.7043@ubuntu-linux-20-04-desktop> <f75df6d6-ede6-41a6-9412-1a9b073902b5@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Jul 2025, Jan Beulich wrote:
> On 23.07.2025 02:46, Stefano Stabellini wrote:
> > On Tue, 22 Jul 2025, Jan Beulich wrote:
> >> On 22.07.2025 07:04, Penny Zheng wrote:
> >>> Function getdomaininfo() is not only invoked by domctl-op, but also sysctl-op,
> >>> so it shall better live in domain.c, rather than domctl.c. Which is also
> >>> applied for arch_get_domain_info(). Style corrections shall be applied at
> >>> the same time while moving these functions, such as converting u64 to
> >>> uint64_t.
> >>>
> >>> The movement could also fix CI error of a randconfig picking both SYSCTL=y
> >>> and PV_SHIM_EXCLUSIVE=y results in sysctl.c being built, but domctl.c not
> >>> being built, which leaves getdomaininfo() undefined, causing linking to fail.
> >>>
> >>> Fixes: 34317c508294 ("xen/sysctl: wrap around sysctl hypercall")
> >>> Reported-by: Jan Beulich <jbeulich@suse.com>
> >>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> >>
> >> I'm not convinced of this approach. In the longer run this would mean wrapping
> >> everything you move in "#if defined(CONFIG_SYSCTL) || defined(CONFIG_DOMCTL)",
> >> which I consider undesirable. Without DOMCTL, the usefulness of
> >> XEN_SYSCTL_getdomaininfolist is at least questionable. Therefore adding more
> >> isolated "#ifdef CONFIG_DOMCTL" just there may be an option. Similarly, as
> >> mentioned on the other thread, having SYSCTL depend on DOMCTL is an approach
> >> which imo wants at least considering. And there surely are further options.
> >>
> >> As indicated elsewhere, my preference goes towards reverting the final one or
> >> two patches of that series. They can be re-applied once the dependencies were
> >> properly sorted, which may (as per above) involve properly introducing a
> >> DOMCTL Kconfig setting first.
> > 
> > I don't think this is a good idea.
> 
> And implicitly you say that what I put under question in the first paragraph
> is a good way forward?

I think it is OK.

I also think "having SYSCTL depend on DOMCTL" is certainly worth
thinking about. In terms of privilege and potential for interference
with other domains sysctl and domctl don't seem different so it is
unlikely one would want to disable one but not the other.

Another idea is to have a single kconfig for both SYSCTL and DOMCTL: we
don't necessarily need to offer individual kconfig for every feature.
From a safety point of view, we want to disable them both.

