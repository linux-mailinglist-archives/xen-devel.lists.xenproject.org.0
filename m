Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113D2896F0A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 14:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700528.1093818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrzvO-000056-0D; Wed, 03 Apr 2024 12:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700528.1093818; Wed, 03 Apr 2024 12:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrzvN-0008UM-To; Wed, 03 Apr 2024 12:41:05 +0000
Received: by outflank-mailman (input) for mailman id 700528;
 Wed, 03 Apr 2024 12:41:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPGy=LI=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rrzvM-0008SY-MN
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 12:41:04 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eda7261-f1b7-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 14:41:03 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41620ab6e9fso5986665e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 05:41:03 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j29-20020a05600c1c1d00b0041493a93cc5sm21706096wms.2.2024.04.03.05.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 05:41:02 -0700 (PDT)
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
X-Inumbo-ID: 6eda7261-f1b7-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712148063; x=1712752863; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XB9Bi6zqrGLagRa51p6+Okgp7583Foa2ndDAHSzcb9E=;
        b=fKEfg/HGsxBKG1DSSMKGEbSwYdf0+mTscGS/YKD29EmgfCZ7YXFVh5BnTyfpnw7ndP
         b0KNWjMjt15YAg1mk5Kdb9eMunQk33Q+poaxVO4+I213fpyKANprFbhB59ejS7QElfcf
         ErhplMg7w67brjVFv6vBMs8aU7uxGUFOicogk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712148063; x=1712752863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XB9Bi6zqrGLagRa51p6+Okgp7583Foa2ndDAHSzcb9E=;
        b=D9Js/Zoy3LUR8Q5lwpjAA1aq135SBoHMvdryaozlZE4J1c0oU/6GfCHh6XWWIOwuvX
         aCHpQ8Sljbqg/6CX7j/AoEJAUTb4A+E3acwsbrxuMQh0Jb5d7cHoE1fUu1+qzN+vHZQ4
         mExp1BKICjehiaoeQ3p6bG8WLy3DCC23Idl5H/GlOynqqjuF9jjC2ZfF4/VGYXpiNUf0
         4l24aYjlgb3abYtQ7dIquEgokxrQ/Zu/HN95y5kILx2dKTzelA0JrrQYCWeBELBC5IE7
         2NT55VN5vtfTzgKhe05l02rPj9UhUVMarfIdpXL5tvQ8xWCWxqKJjmitQFCs98oF7plc
         F0IA==
X-Gm-Message-State: AOJu0YxHnBDbBAyd+OFTTWiCC/pCxyiQMg9euku1KbibwvE4NRdBh1Rh
	CM5hyq0sGmXweHHc9WZbgnlgvd6yBMCfJFyIUq/fQW2NESNhvO9GVP2ioCHhCaQ=
X-Google-Smtp-Source: AGHT+IE+QPwvZaIH9MZVNSgexM8KZidKS/YDUibZ+e8zr/cK8PXlzPSueU7emiPaUgP7AdUnRD11lg==
X-Received: by 2002:a05:600c:35d6:b0:415:46be:6239 with SMTP id r22-20020a05600c35d600b0041546be6239mr10622011wmq.36.1712148063138;
        Wed, 03 Apr 2024 05:41:03 -0700 (PDT)
Date: Wed, 3 Apr 2024 13:41:01 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH v6 1/4] tools/init-xenstore-domain: Replace variable MB()
 usage
Message-ID: <3bcdb957-717e-4505-951e-711c87744f6c@perard>
References: <20240327215102.136001-1-jason.andryuk@amd.com>
 <20240327215102.136001-2-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327215102.136001-2-jason.andryuk@amd.com>

On Wed, Mar 27, 2024 at 05:50:59PM -0400, Jason Andryuk wrote:
> The local MB() & GB() macros will be replaced with a common
> implementation, but those only work with constant values.  Introduce a

By the way, this is not true, the macro introduce in the following patch
("tools: Move MB/GB() to common-macros.h") works (compiler doesn't
complain) if you do something like MB(maxmem+0) ;-).

> static inline mb_to_bytes() in place of the MB() macro to convert the
> variable values.
> 
> diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
> index 1683438c5c..5405842dfe 100644
> --- a/tools/helpers/init-xenstore-domain.c
> +++ b/tools/helpers/init-xenstore-domain.c
> @@ -20,7 +20,6 @@
>  #include "init-dom-json.h"
>  
>  #define LAPIC_BASE_ADDRESS  0xfee00000UL
> -#define MB(x)               ((uint64_t)x << 20)
>  #define GB(x)               ((uint64_t)x << 30)
>  
>  static uint32_t domid = ~0;
> @@ -36,6 +35,11 @@ static xc_evtchn_port_or_error_t console_evtchn;
>  static xentoollog_level minmsglevel = XTL_PROGRESS;
>  static void *logger;
>  
> +static inline uint64_t mb_to_bytes(int mem)
> +{
> +	return (uint64_t)mem << 20;
> +}
> +
>  static struct option options[] = {
>      { "kernel", 1, NULL, 'k' },
>      { "memory", 1, NULL, 'm' },
> @@ -76,8 +80,8 @@ static int build(xc_interface *xch)
>      int rv, xs_fd;
>      struct xc_dom_image *dom = NULL;
>      int limit_kb = (maxmem ? : memory) * 1024 + X86_HVM_NR_SPECIAL_PAGES * 4;
> -    uint64_t mem_size = MB(memory);
> -    uint64_t max_size = MB(maxmem ? : memory);
> +    uint64_t mem_size = mb_to_bytes(memory);
> +    uint64_t max_size = mb_to_bytes(maxmem ? : memory);
>      struct e820entry e820[3];
>      struct xen_domctl_createdomain config = {
>          .ssidref = SECINITSID_DOMU,
 
Sorry, just notice they were more versions of the series, so repeating
here:

Looks like this change actually fix a bug. When `maxmem` is set, we
would have "max_size = maxmem", otherwise, it would be
"max_size = memory << 20"

The macro should have been written as
 #define MB(x)               ((uint64_t)(x) << 20)

This patch could be backported to 4.17 and later, with:
    Fixes: 134d53f57707 ("tools/init-xenstore-domain: fix memory map for PVH stubdom")

Anyway, this patch on it's own looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>



-- 
Anthony PERARD

