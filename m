Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 606502147D5
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 19:49:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrmHm-00053J-6C; Sat, 04 Jul 2020 17:49:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRhY=AP=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jrmHk-00053E-Jb
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 17:49:08 +0000
X-Inumbo-ID: a8d19afe-be1e-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8d19afe-be1e-11ea-bb8b-bc764e2007e4;
 Sat, 04 Jul 2020 17:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UzsOzfJWtA+DZlEQDZ036u2bU+tFHOKDcq7PpqV4rE0=; b=s/sbkpY1XwZetchIZSoaYyUKlk
 ni90jcz6wwv6vh3evGWS6xNicuR2Lu13Sa9HHQ+dnsSNoljt2fvduLkkb0/NNAarHMIsBK1qhpUqY
 uGdHD/ZA304xRAt/BKp24hTBHdOprkrKCfuriuoWAJY63h5JTLQJC6TiOgamSHrV1feI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jrmHd-0001T4-06; Sat, 04 Jul 2020 17:49:01 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jrmHc-0007SJ-M9; Sat, 04 Jul 2020 17:49:00 +0000
Subject: Re: [PATCH v4 03/10] tools/libxl: add vmtrace_pt_size parameter
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 xen-devel@lists.xenproject.org
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <5f4f4b1afa432258daff43f2dc8119b6a441fff4.1593519420.git.michal.leszczynski@cert.pl>
From: Julien Grall <julien@xen.org>
Message-ID: <d427a0da-b178-3db1-ccf7-6cdc64480e84@xen.org>
Date: Sat, 4 Jul 2020 18:48:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5f4f4b1afa432258daff43f2dc8119b6a441fff4.1593519420.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, luwei.kang@intel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 30/06/2020 13:33, Michał Leszczyński wrote:
> diff --git a/tools/libxl/libxl.h b/tools/libxl/libxl.h
> index 71709dc585..891e8e28d6 100644
> --- a/tools/libxl/libxl.h
> +++ b/tools/libxl/libxl.h
> @@ -438,6 +438,14 @@
>    */
>   #define LIBXL_HAVE_CREATEINFO_PASSTHROUGH 1
>   
> +/*
> + * LIBXL_HAVE_VMTRACE_PT_ORDER indicates that
> + * libxl_domain_create_info has a vmtrace_pt_order parameter, which
> + * allows to enable pre-allocation of processor tracing buffers
> + * with the given order of size.
> + */
> +#define LIBXL_HAVE_VMTRACE_PT_ORDER 1
> +
>   /*
>    * libxl ABI compatibility
>    *
> diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
> index 75862dc6ed..651d1f4c0f 100644
> --- a/tools/libxl/libxl_create.c
> +++ b/tools/libxl/libxl_create.c
> @@ -608,6 +608,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>               .max_evtchn_port = b_info->event_channels,
>               .max_grant_frames = b_info->max_grant_frames,
>               .max_maptrack_frames = b_info->max_maptrack_frames,
> +            .vmtrace_pt_order = b_info->vmtrace_pt_order,
>           };
>   
>           if (info->type != LIBXL_DOMAIN_TYPE_PV) {
> diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
> index 9d3f05f399..1c5dd43e4d 100644
> --- a/tools/libxl/libxl_types.idl
> +++ b/tools/libxl/libxl_types.idl
> @@ -645,6 +645,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
>       # supported by x86 HVM and ARM support is planned.
>       ("altp2m", libxl_altp2m_mode),
>   
> +    ("vmtrace_pt_order", integer),

libxl can be used by external projects (such libvirt) for implementing 
their own toolstack.

While on x86 you always have the same granularity, on Arm the hypervisor 
and each guest may have a different page granularity (e.g 4KB, 16KB, 
64KB). So it is unclear what order one would have to use.

I think it would be best if the external user only specify the number of 
bytes. You can then sanity check the value and convert to an order (or 
number of pages) in libxl before passing the value to the hypervisor.

Cheers,

-- 
Julien Grall

