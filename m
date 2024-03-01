Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB3686E0A9
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 12:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687620.1071304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg1Oh-0000BG-V3; Fri, 01 Mar 2024 11:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687620.1071304; Fri, 01 Mar 2024 11:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg1Oh-00008B-S2; Fri, 01 Mar 2024 11:49:51 +0000
Received: by outflank-mailman (input) for mailman id 687620;
 Fri, 01 Mar 2024 11:49:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jGsc=KH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rg1Og-000085-So
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 11:49:50 +0000
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [2607:f8b0:4864:20::f2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ceca50c1-d7c1-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 12:49:49 +0100 (CET)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-68fe8e20259so10041526d6.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 03:49:49 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 em19-20020ad44f93000000b0068fdb03a3a3sm1781231qvb.95.2024.03.01.03.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 03:49:48 -0800 (PST)
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
X-Inumbo-ID: ceca50c1-d7c1-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709293789; x=1709898589; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FNBpkR65MTOl8/GCeLBTKCHJTdEnwJffWZmpG66n6cc=;
        b=VF19pbGCv6tpHngxxst0x/dkiNEVt3zUVx5Q6o9gfT5/kwEG+oxxrdlfksP5ctBNB9
         3v0kvd1JnMVcwe1n1XX1icGXSsmhPnVVwUHzaF0e8OFUarOklXorX5SE7uAQ2IG+z/Z5
         xaBBmuFWGdeeO2g44a+/NF/4rXHAWetpWPGJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709293789; x=1709898589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNBpkR65MTOl8/GCeLBTKCHJTdEnwJffWZmpG66n6cc=;
        b=aaBmc4vtLNfxRE1QZbupr9JOI+YA30Nf9pZBfiEZcv5fmtViKP9B1b298HZgONQddx
         js42K85bjsHgC0Pu3xFAs0ipLq7/1ZP4KcBFy9Uh4r9j6/xhFO36bOMnWlDgDdnc8YMI
         Owh7QulasE39k1I4x5w5RfMQMMdivJ0P0gYW5qirEluT8LUZPUbX1eQYrVKaE3pXuZsc
         l0o2kZPmX1gvo2sa6CUOpxAXN1oTdXnvTMYZFIN7+Hcybh/yGfCwPKNP6zVaO4TxeYBT
         vwXFqFe4en6nnU/IX3CYCnE5LSX961B/Pwr1/jpiFr8HESasR6gKwxneOpfzPs/eN7zm
         D+9Q==
X-Gm-Message-State: AOJu0YzzZnX62sh/CuRgCU//U73tG1tyeA7tqohyHYk4UBL9D4mZsQpB
	QMAZPsSZF+FWAb+L25bkoC2DxBa1L6sB22WT4Bt2UnprQtJxg/YUlKq8OsFqr+Q=
X-Google-Smtp-Source: AGHT+IGbx7vWnNS/Isdsv654Vl3DbaT+eJ6GtoTm9x/oJ+T4BcOQVOTFEEVhx+w02sXY22HkKFyRHA==
X-Received: by 2002:a0c:f892:0:b0:68f:b5b3:c417 with SMTP id u18-20020a0cf892000000b0068fb5b3c417mr1439989qvn.11.1709293788882;
        Fri, 01 Mar 2024 03:49:48 -0800 (PST)
Date: Fri, 1 Mar 2024 12:49:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tests/resource: Fix HVM guest in !SHADOW builds
Message-ID: <ZeHA2usyM2aOISxq@macbook>
References: <20240229205354.2574207-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229205354.2574207-1-andrew.cooper3@citrix.com>

On Thu, Feb 29, 2024 at 08:53:54PM +0000, Andrew Cooper wrote:
> Right now, test-resource always creates HVM Shadow guests.  But if Xen has
> SHADOW compiled out, running the test yields:
> 
>   $./test-resource
>   XENMEM_acquire_resource tests
>   Test x86 PV
>     Created d1
>     Test grant table
>   Test x86 PVH
>     Skip: 95 - Operation not supported
> 
> and doesn't really test HVM guests, but doesn't fail either.
> 
> There's nothing paging-mode-specific about this test, so default to HAP if
> possible and provide a more specific message if neither HAP or Shadow are
> available.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One comment below.

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  tools/tests/resource/test-resource.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
> index 7ae88ea34807..2796053588d3 100644
> --- a/tools/tests/resource/test-resource.c
> +++ b/tools/tests/resource/test-resource.c
> @@ -20,6 +20,8 @@ static xc_interface *xch;
>  static xenforeignmemory_handle *fh;
>  static xengnttab_handle *gh;
>  
> +static xc_physinfo_t physinfo;
> +
>  static void test_gnttab(uint32_t domid, unsigned int nr_frames,
>                          unsigned long gfn)
>  {
> @@ -172,6 +174,23 @@ static void test_domain_configurations(void)
>  
>          printf("Test %s\n", t->name);
>  
> +#if defined(__x86_64__) || defined(__i386__)
> +        /*
> +         * On x86, use HAP guests if possible, but skip if neither HAP nor
> +         * SHADOW is available.
> +         */
> +        if ( t->create.flags & XEN_DOMCTL_CDF_hvm )
> +        {
> +            if ( physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hap )
> +                t->create.flags |= XEN_DOMCTL_CDF_hap;
> +            else if ( !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_shadow) )
> +            {
> +                printf("  Skip: Neither HAP or SHADOW available\n");
> +                continue;
> +            }
> +        }

Provided that you are already checking, might also be worth to keep in
mind that at some point we might want to also check for
XEN_SYSCTL_PHYSCAP_{hvm,pv} and skip those tests if the requested domain
type is not available.

Thanks, Roger.

