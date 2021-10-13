Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8233042B11D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 02:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207800.363736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maSSf-0007HN-72; Wed, 13 Oct 2021 00:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207800.363736; Wed, 13 Oct 2021 00:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maSSf-0007Ev-2y; Wed, 13 Oct 2021 00:49:37 +0000
Received: by outflank-mailman (input) for mailman id 207800;
 Wed, 13 Oct 2021 00:49:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJnr=PB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1maSSd-0007Df-GD
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 00:49:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9b7b038-96a2-40d5-9215-0f7840559761;
 Wed, 13 Oct 2021 00:49:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2FAE60EBB;
 Wed, 13 Oct 2021 00:49:33 +0000 (UTC)
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
X-Inumbo-ID: c9b7b038-96a2-40d5-9215-0f7840559761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634086174;
	bh=CO9TOBs1Oi47qCKKj5aVUPjZ/naSRD5F3CJr8EVo1oQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G+qm9ZDczwZ+OkMS/bRtvMCTNaQtrdV+J5gzL5aL8Owr9cII34b0idiCULX624Vrv
	 Jx0xWGAY3ieWMbR6tfP4PCQz+T4h3SmAqk5TbTXlYVkf+uHiCkTrocugxaNiivls9f
	 WxmjDaRxg6nvcFtPQFoikE8NYbBYddD4swVwgJ5qIHprz5Uc77byQrby7/c5qek2JF
	 1CsBdA6qpuhZDj07xhqjZ/ENKKjf1Q4p7ZoLZkWJ/Y7ZI0S3HxD5gVji3z1epkcvfc
	 lyb/2PkSng6kBzqB8K2tFmWBnwQB3jw56698DERXqkRtXErW3xW3xvZEx6noOzDGfl
	 3HKujN1l4WqGw==
Date: Tue, 12 Oct 2021 17:49:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
Subject: Re: [PATCH v5 2/3] xen/arm: Check for PMU platform support
In-Reply-To: <6ea907cc-0e85-6d86-9219-837c2e98ec3d@xen.org>
Message-ID: <alpine.DEB.2.21.2110121527090.9408@sstabellini-ThinkPad-T480s>
References: <20211012081323.14141-1-michal.orzel@arm.com> <20211012081323.14141-3-michal.orzel@arm.com> <6ea907cc-0e85-6d86-9219-837c2e98ec3d@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Oct 2021, Julien Grall wrote:
> Hi Michal,
> 
> On 12/10/2021 09:13, Michal Orzel wrote:
> > ID_AA64DFR0_EL1/ID_DFR0_EL1 registers provide
> > information about PMU support. Replace structure
> > dbg64/dbg32 with a union and fill in all the
> > register fields according to document:
> > ARM Architecture Registers(DDI 0595, 2021-06).
> > 
> > Add macros boot_dbg_feature64/boot_dbg_feature32
> > to check for a debug feature. Add macro
> > cpu_has_pmu to check for PMU support.
> > Any value higher than 0 and less than 15 means
> > that PMU is supported (we do not care about its
> > version for now).
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> > Changes since v4:
> > -improve checks for PMU
> > Changes since v3:
> > -none
> > Changes since v2:
> > -none
> > Changes since v1:
> > -new in v2
> > ---
> >   xen/include/asm-arm/cpufeature.h | 51 ++++++++++++++++++++++++++++++--
> >   1 file changed, 49 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/include/asm-arm/cpufeature.h
> > b/xen/include/asm-arm/cpufeature.h
> > index 5ca09b0bff..0ddf38858a 100644
> > --- a/xen/include/asm-arm/cpufeature.h
> > +++ b/xen/include/asm-arm/cpufeature.h
> > @@ -4,6 +4,7 @@
> >   #ifdef CONFIG_ARM_64
> >   #define cpu_feature64(c, feat)         ((c)->pfr64.feat)
> >   #define boot_cpu_feature64(feat)       (system_cpuinfo.pfr64.feat)
> > +#define boot_dbg_feature64(feat)       (system_cpuinfo.dbg64.feat)
> >     #define cpu_feature64_has_el0_32(c)    (cpu_feature64(c, el0) == 2)
> >   @@ -22,6 +23,7 @@
> >     #define cpu_feature32(c, feat)         ((c)->pfr32.feat)
> >   #define boot_cpu_feature32(feat)       (system_cpuinfo.pfr32.feat)
> > +#define boot_dbg_feature32(feat)       (system_cpuinfo.dbg32.feat)
> >     #define cpu_has_arm       (boot_cpu_feature32(arm) == 1)
> >   #define cpu_has_thumb     (boot_cpu_feature32(thumb) >= 1)
> > @@ -32,8 +34,12 @@
> >     #ifdef CONFIG_ARM_32
> >   #define cpu_has_gentimer  (boot_cpu_feature32(gentimer) == 1)
> > +#define cpu_has_pmu       ((boot_dbg_feature32(perfmon) >= 1) && \
> > +                           (boot_dbg_feature32(perfmon) < 15))
> 
> So I am happy with this check for arm32. But I would still like to have a
> comment explaining the fact that on Armv7 perfmon == 0 may mean PMUv1 is may
> be used. Something like:
> 
> "On Armv7, the value 0 is used to indicate that PMUv2 is not supported. IOW
> this doesn't tell us whether the PMU is not supported (a processor may
> implement PMUv1).
> 
> For convenience, we treat 0 as not supported which this match the meaning on
> Armv8".
> 
> The rest of the code looks fine to me.

I made the change on commit

