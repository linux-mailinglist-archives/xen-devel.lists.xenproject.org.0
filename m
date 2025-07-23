Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C7CB0E7B0
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 02:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053178.1421943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueNcj-0002LD-5T; Wed, 23 Jul 2025 00:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053178.1421943; Wed, 23 Jul 2025 00:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueNcj-0002IZ-2g; Wed, 23 Jul 2025 00:46:21 +0000
Received: by outflank-mailman (input) for mailman id 1053178;
 Wed, 23 Jul 2025 00:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KKGU=2E=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ueNch-0002IT-F7
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 00:46:19 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 701e8dfc-675e-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 02:46:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C7F8E668B9;
 Wed, 23 Jul 2025 00:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5BCC4CEEB;
 Wed, 23 Jul 2025 00:46:12 +0000 (UTC)
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
X-Inumbo-ID: 701e8dfc-675e-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753231574;
	bh=KpyaXLrM6zMFp5C5I7wPHm8mmL9NnfSqZH9zDiZnGxc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ADWc+zdoMvaQoxTB3YUVkyd2aWcgxGFUavJJaclZhkFNC2GSKvZ3dtrnTubDEnC6Q
	 X9TQzxMWgpIgGrY4jjUaSIrh/sgvvK5nlOMIB3mYWvY0I/EpjG9rKunpLkAYY8erjO
	 HHUIRccRANyxg7hRfH8RUnUtL2juhJyqhKpsrjUfwIHFBPbBprdUAbXcTGzyDpU5vH
	 65hGpNKPaodzjozf1Qt+C4FAGfwjQhe3c4MXuYOWiRMeBW5PBAvfgYEbCqmr4dsH7o
	 E5of4pqJOA53Amdg3OchvGf1uIstlLVS5hKXhPYVSHukHnaMt3w/GZ9LrjtFV+PtNU
	 9/iEvT62LP1ig==
Date: Tue, 22 Jul 2025 17:46:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] xen: move getdomaininfo() to domain.c
In-Reply-To: <0939219f-1c06-4d0d-a427-6b95b5943513@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507221738090.7043@ubuntu-linux-20-04-desktop>
References: <20250722050410.853783-1-Penny.Zheng@amd.com> <0939219f-1c06-4d0d-a427-6b95b5943513@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Jul 2025, Jan Beulich wrote:
> On 22.07.2025 07:04, Penny Zheng wrote:
> > Function getdomaininfo() is not only invoked by domctl-op, but also sysctl-op,
> > so it shall better live in domain.c, rather than domctl.c. Which is also
> > applied for arch_get_domain_info(). Style corrections shall be applied at
> > the same time while moving these functions, such as converting u64 to
> > uint64_t.
> > 
> > The movement could also fix CI error of a randconfig picking both SYSCTL=y
> > and PV_SHIM_EXCLUSIVE=y results in sysctl.c being built, but domctl.c not
> > being built, which leaves getdomaininfo() undefined, causing linking to fail.
> > 
> > Fixes: 34317c508294 ("xen/sysctl: wrap around sysctl hypercall")
> > Reported-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> 
> I'm not convinced of this approach. In the longer run this would mean wrapping
> everything you move in "#if defined(CONFIG_SYSCTL) || defined(CONFIG_DOMCTL)",
> which I consider undesirable. Without DOMCTL, the usefulness of
> XEN_SYSCTL_getdomaininfolist is at least questionable. Therefore adding more
> isolated "#ifdef CONFIG_DOMCTL" just there may be an option. Similarly, as
> mentioned on the other thread, having SYSCTL depend on DOMCTL is an approach
> which imo wants at least considering. And there surely are further options.
> 
> As indicated elsewhere, my preference goes towards reverting the final one or
> two patches of that series. They can be re-applied once the dependencies were
> properly sorted, which may (as per above) involve properly introducing a
> DOMCTL Kconfig setting first.

I don't think this is a good idea. The patch that Penny wrote addresses
this specific issue effectively and allows us to move forward. It also
helps us continue identifying problems in GitLab CI and prevents
regressions with CONFIG_SYSCTL.

I am also aware that Penny has already more patches to send, including
the DOMCTL Kconfig you are asking. 

I think this patch is fine as is:
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


