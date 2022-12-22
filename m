Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A73C653A49
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 02:23:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468157.727222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8AIF-0001qw-EO; Thu, 22 Dec 2022 01:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468157.727222; Thu, 22 Dec 2022 01:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8AIF-0001nw-BB; Thu, 22 Dec 2022 01:22:43 +0000
Received: by outflank-mailman (input) for mailman id 468157;
 Thu, 22 Dec 2022 01:22:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpfT=4U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p8AIE-0001mX-BD
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 01:22:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2098cf06-8197-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 02:22:41 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41A2AB81B9C;
 Thu, 22 Dec 2022 01:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BE2C433EF;
 Thu, 22 Dec 2022 01:22:37 +0000 (UTC)
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
X-Inumbo-ID: 2098cf06-8197-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671672158;
	bh=pdt1O14ihPJlnEuTj68EwR9IlyEBRW+E4apYypBPXmI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rbHV55jhf5Rvn8wO39P1dLBWnf364U45FePLwCvs8XDpnc7r0a7WOQ/3kj0O8TRdw
	 UxITgoIK9Md+onnIWxCbpcLnLBlJuEHrw/p1ND2i1p2n6yl3XOWzlAdzW93OnvExKD
	 KTjRraPQesyjSpbT+rPKF+wj6MjHceLBSAFrakrCr5+wqvWhGoMEYyLYKvI07+ktfM
	 ZUKlNfXHwbjjW6gGaKuX1Gs4TTXHhk5ufSm+vzxqFD/wvhR6iSQTlLKdRws+y5QzJK
	 Hb/mk6NY0gbces71ASsdDP05IBgw9l28FmqT23RiO95uf6Ui6aD+F2xTOOcSam6bkN
	 dcpnH5rmBm4CA==
Date: Wed, 21 Dec 2022 17:22:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: Allow to set grant table related limits for
 dom0less domUs
In-Reply-To: <20221219085908.13479-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2212211722290.4079@ubuntu-linux-20-04-desktop>
References: <20221219085908.13479-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Dec 2022, Michal Orzel wrote:
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
> Note that the values obtained from device tree are of type uint32_t,
> whereas the d_cfg.max_{grant_frames,maptrack_frames} are of type int32_t.
> Call panic in case of overflow. Other sanity checks are already there in
> grant_table_init() resulting in panic in case of errors, therefore no
> need to repeat them in create_domUs().
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>  - call panic in case of int32_t overflow
> ---
>  docs/misc/arm/device-tree/booting.txt | 21 +++++++++++++++++++++
>  xen/arch/arm/domain_build.c           | 18 ++++++++++++++++++
>  2 files changed, 39 insertions(+)
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
> index bef5e905a73c..829cea8de84f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3872,6 +3872,7 @@ void __init create_domUs(void)
>              .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>          };
>          unsigned int flags = 0U;
> +        uint32_t val;
>  
>          if ( !dt_device_is_compatible(node, "xen,domain") )
>              continue;
> @@ -3940,6 +3941,23 @@ void __init create_domUs(void)
>              d_cfg.cpupool_id = pool_id;
>          }
>  
> +        if ( dt_property_read_u32(node, "max_grant_version", &val) )
> +            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
> +
> +        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
> +        {
> +            if ( val > INT32_MAX )
> +                panic("max_grant_frames (%"PRIu32") overflow\n", val);
> +            d_cfg.max_grant_frames = val;
> +        }
> +
> +        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
> +        {
> +            if ( val > INT32_MAX )
> +                panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
> +            d_cfg.max_maptrack_frames = val;
> +        }
> +
>          /*
>           * The variable max_init_domid is initialized with zero, so here it's
>           * very important to use the pre-increment operator to call
> -- 
> 2.25.1
> 

