Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA191A375D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 17:43:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMZKN-0003A7-GH; Thu, 09 Apr 2020 15:42:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VOqT=5Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jMZKL-0003A2-Kn
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 15:42:49 +0000
X-Inumbo-ID: c3697290-7a78-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3697290-7a78-11ea-83d8-bc764e2007e4;
 Thu, 09 Apr 2020 15:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=Io9Mqkd/hAbqiWh1sT0gO8kc42yU9ideP2Ttfj3rUbY=; b=lzuEGzps/ZZHg7Ds+/Pesk0/7G
 20lY9Wf8fyIff3/PEHPZWZmhLyTU4WL9iynY2Q9lkBkHEEDWlo5OvgmIol3hMtbgoRFKV8hVmGV0U
 svKo5aM/MeCgNdz3cs3/e5DI1gUb89zHttYO/EVwx6Fpq+MrtgEVSxaQ9wRgq4YEiSZg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMZKI-0000DP-IP; Thu, 09 Apr 2020 15:42:46 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMZKI-00018f-8s; Thu, 09 Apr 2020 15:42:46 +0000
Date: Thu, 9 Apr 2020 16:42:43 +0100
From: Wei Liu <wl@xen.org>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH v14 3/3] xen/tools: VM forking toolstack side
Message-ID: <20200409154243.6ouh7r37fwm32mjg@debian>
References: <cover.1586186121.git.tamas.lengyel@intel.com>
 <6d63f89124c7445be3185ab6722992b707dab72b.1586186121.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d63f89124c7445be3185ab6722992b707dab72b.1586186121.git.tamas.lengyel@intel.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 06, 2020 at 08:20:05AM -0700, Tamas K Lengyel wrote:
> Add necessary bits to implement "xl fork-vm" commands. The command allows the
> user to specify how to launch the device model allowing for a late-launch model
> in which the user can execute the fork without the device model and decide to
> only later launch it.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
[...]
>  
> +int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
> +                       libxl__domain_build_state *state,
> +                       uint32_t *domid, bool soft_reset)

It would have been nice if you could split the refactoring out to a
separate patch.

>  static int store_libxl_entry(libxl__gc *gc, uint32_t domid,
>                               libxl_domain_build_info *b_info)
>  {
> @@ -1191,16 +1207,32 @@ static void initiate_domain_create(libxl__egc *egc,
>      ret = libxl__domain_config_setdefault(gc,d_config,domid);
>      if (ret) goto error_out;
>  
> -    ret = libxl__domain_make(gc, d_config, &dcs->build_state, &domid,
> -                             dcs->soft_reset);
> -    if (ret) {
> -        LOGD(ERROR, domid, "cannot make domain: %d", ret);
> +    if ( !d_config->dm_restore_file )
> +    {
> +        ret = libxl__domain_make(gc, d_config, &dcs->build_state, &domid,
> +                                 dcs->soft_reset);
>          dcs->guest_domid = domid;
> +
> +        if (ret) {
> +            LOGD(ERROR, domid, "cannot make domain: %d", ret);
> +            ret = ERROR_FAIL;
> +            goto error_out;
> +        }
> +    } else if ( dcs->guest_domid != INVALID_DOMID ) {

Coding style issue here.

There are quite a few of them.  I won't point them out one by one
though. Let's focus on the interface first.

>  
> +/*
> + * The parent domain is expected to be created with default settings for
> + * - max_evtch_port
> + * - max_grant_frames
> + * - max_maptrack_frames
> + */
> +int libxl_domain_fork_vm(libxl_ctx *ctx, uint32_t pdomid, uint32_t max_vcpus, uint32_t *domid)
> +{
> +    int rc;
> +    struct xen_domctl_createdomain create = {0};
> +    create.flags |= XEN_DOMCTL_CDF_hvm;
> +    create.flags |= XEN_DOMCTL_CDF_hap;
> +    create.flags |= XEN_DOMCTL_CDF_oos_off;
> +    create.arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> +    create.ssidref = SECINITSID_DOMU;
> +    create.max_vcpus = max_vcpus;


Some questions:

Why does the caller need to specify the number of vcpus?

Since the parent (source) domain is around, can you retrieve its domain
configuration such that you know its max_vcpus and other information
including max_evtchn_port and maptrack frames?

Wei.

