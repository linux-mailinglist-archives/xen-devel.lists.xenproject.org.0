Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8173C64E34F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 22:38:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463892.722180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5vvr-0001VH-5e; Thu, 15 Dec 2022 21:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463892.722180; Thu, 15 Dec 2022 21:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5vvr-0001TJ-2Z; Thu, 15 Dec 2022 21:38:23 +0000
Received: by outflank-mailman (input) for mailman id 463892;
 Thu, 15 Dec 2022 21:38:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fpb=4N=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p5vvp-0001TA-Dy
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 21:38:21 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cadb3f15-7cc0-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 22:38:20 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6370AB81CAE;
 Thu, 15 Dec 2022 21:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27268C433D2;
 Thu, 15 Dec 2022 21:38:17 +0000 (UTC)
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
X-Inumbo-ID: cadb3f15-7cc0-11ed-8fd3-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671140298;
	bh=4PjhiSJ0cTwANbh+MCsiUb8qAu4KCIKTWftPX7NTVL8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O6GQ8o/fI+BhdQLaOZf7AArzGInr5nd96cGQiowoCgnZ6eW3PqNNfmz5haKQVDtAL
	 9TMacXa4IA5+diwnwdX4yc6Hq2zo+DoxDIewecF4LzspGITS8nXJsU3nz0PgPk8TCJ
	 8EWv3n0B7WFY8P+YaWMPhMJ/FC9SWOPqsVB/IysyH5covTTsubYnA+Vu1gOBV/TDRc
	 DVpKoZ2eHH1mRTsB2Pfj/W0MW19b9z27ZFAbDtdrpLtlriOGco+pzyX6e2OHKm2CXA
	 OMLHO43JzNS/JnVmksFWZfKkZtZ32YwGO1wHmLjv/NFxL493CzI8wJoKiVKdjyThKm
	 Uxvc1We7oKtiw==
Date: Thu, 15 Dec 2022 13:38:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Allow to set grant table related limits for
 dom0less domUs
In-Reply-To: <20221214130833.543-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2212151335020.315094@ubuntu-linux-20-04-desktop>
References: <20221214130833.543-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Dec 2022, Michal Orzel wrote:
> At the moment, for dom0less domUs, we do not have a way to specify
> per domain grant table related limits (unlike when using xl), namely
> max version, max number of grant frames, max number of maptrack frames.
> This means that such domains always use the values specified by the Xen
> command line parameters or their default values if unspecified.
> 
> In order to have more control over dom0less domUs, introduce the
> following device-tree properties that can be set under domUs nodes:
>  - max_grant_version to set the maximum grant table version the domain
>    is allowed to use,
>  - max_grant_frames to set the maximum number of grant frames the domain
>    is allowed to have,
>  - max_maptrack_frames to set the maximum number of grant maptrack frames
>    the domain is allowed to have.
> 
> Update documentation accordingly.
> 
> Note that the sanity checks regarding the passed values are already
> there in grant_table_init() resulting in panic in case of errors,
> therefore no need to repeat them in create_domUs().
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  docs/misc/arm/device-tree/booting.txt | 21 +++++++++++++++++++++
>  xen/arch/arm/domain_build.c           | 11 ++++++++++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 87eaa3e25491..3879340b5e0a 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -223,6 +223,27 @@ with the following properties:
>      the default size of domain P2M pool, i.e. 1MB per guest vCPU plus 4KB
>      per MB of guest RAM plus 512KB for guest extended regions.
>  
> +- max_grant_version
> +
> +    Optional. A 32-bit integer specifying the maximum grant table version
> +    the domain is allowed to use (valid values are 1 or 2). If this property
> +    is missing, the value specified by Xen command line parameter gnttab=max-ver
> +    (or its default value if unspecified, i.e. 1) is used.
> +
> +- max_grant_frames
> +
> +    Optional. A 32-bit integer specifying the maximum number of grant frames
> +    the domain is allowed to have. If this property is missing, the value
> +    specified by Xen command line parameter gnttab_max_frames (or its default
> +    value if unspecified, i.e. 64) is used.
> +
> +- max_maptrack_frames
> +
> +    Optional. A 32-bit integer specifying the maximum number of grant maptrack
> +    frames the domain is allowed to have. If this property is missing, the
> +    value specified by Xen command line parameter gnttab_max_maptrack_frames
> +    (or its default value if unspecified, i.e. 1024) is used.
> +
>  Under the "xen,domain" compatible node, one or more sub-nodes are present
>  for the DomU kernel and ramdisk.
>  
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index bef5e905a73c..29b2f3e1faa2 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3871,7 +3871,7 @@ void __init create_domUs(void)
>              .max_maptrack_frames = -1,
>              .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>          };
> -        unsigned int flags = 0U;
> +        unsigned int flags = 0U, val;

val should be uint32_t


>          if ( !dt_device_is_compatible(node, "xen,domain") )
>              continue;
> @@ -3940,6 +3940,15 @@ void __init create_domUs(void)
>              d_cfg.cpupool_id = pool_id;
>          }
>  
> +        if ( dt_property_read_u32(node, "max_grant_version", &val) )
> +            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
> +
> +        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
> +            d_cfg.max_grant_frames = val;
> +
> +        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
> +            d_cfg.max_maptrack_frames = val;

We need to be careful here because max_grant_frames and
max_maptrack_frames are defined as int32_t (signed):

    int32_t max_grant_frames;
    int32_t max_maptrack_frames;

I think we should have a check to make sure we don't cause an overflow.
For instance:

if ( val >= INT32_MAX ) {
    error;
}
d_cfg.max_grant_frames = val;

