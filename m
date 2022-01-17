Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C304908C2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 13:36:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258166.444296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9REc-0005pK-Va; Mon, 17 Jan 2022 12:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258166.444296; Mon, 17 Jan 2022 12:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9REc-0005me-SO; Mon, 17 Jan 2022 12:35:42 +0000
Received: by outflank-mailman (input) for mailman id 258166;
 Mon, 17 Jan 2022 12:35:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wP1e=SB=gmail.com=wei.liu.xen@srs-se1.protection.inumbo.net>)
 id 1n9REb-0005mY-68
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 12:35:41 +0000
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa7fd987-7791-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 13:35:40 +0100 (CET)
Received: by mail-wm1-f51.google.com with SMTP id
 o7-20020a05600c510700b00347e10f66d1so7956506wms.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jan 2022 04:35:40 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id l25sm13042297wmh.18.2022.01.17.04.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 04:35:39 -0800 (PST)
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
X-Inumbo-ID: fa7fd987-7791-11ec-9bbc-9dff3e4ee8c5
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RV944q9qNTRUozn2SpcJn/8J4Zu/QpZpYR8MQlWa96w=;
        b=PeZEt73mIGDlsvCREJpML3w+zxbwqUSTpa/VM5fIt16Slo3za71Z/f+XU6OUW/SeiO
         f7JN9HvcfC7fcAeV/6mGj7WCWJkTBFqaheLUDrWY2l7TY6JFvs4MElU7Wo7HBoT00eFr
         Z91KosK4khrsaAHbThIfd8Z2W+J1NKxjNbm3octHoUjrPE7gTAH7t7vKkuHN+2Tz500b
         vvCMfHD+P8aad4E/E7JzKgjRPxzlQzUrq9YA+G7iURuhiBZ+0B451D910jPx1DxbuoPP
         WSqJY/kz3M2FL72UlF4zNGFTlV7t7fKTcj5xZydCXwQFnU60VX7Szia2q3caGXcV2/1y
         wDoA==
X-Gm-Message-State: AOAM530D05lUK06ONxzrrFuZqj4urdFxNBAR5bitB+gIUDfhOwFgFdK5
	QkJbWBUxMbvUABdlmsaluxk=
X-Google-Smtp-Source: ABdhPJxhEy1oce1tH7PUh5zOeqRy+eklR12RSqA8QBSP82Aonsz81baPSTIj19rANrn0/TTL0RFZuQ==
X-Received: by 2002:a05:6000:50b:: with SMTP id a11mr18922252wrf.387.1642422939448;
        Mon, 17 Jan 2022 04:35:39 -0800 (PST)
Date: Mon, 17 Jan 2022 12:35:37 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/APIC: mark wait_tick_pvh() __init
Message-ID: <20220117123537.odchl4syrw5n2oh2@liuwe-devbox-debian-v2>
References: <476e1c65-8883-16a2-996e-53d7c42638ed@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <476e1c65-8883-16a2-996e-53d7c42638ed@suse.com>

On Mon, Jan 17, 2022 at 11:34:20AM +0100, Jan Beulich wrote:
> It should have been that way right from its introduction by 02e0de011555
> ("x86: APIC timer calibration when running as a guest").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

> 
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -1190,7 +1190,7 @@ static void __init check_deadline_errata
>             "please update microcode to version %#x (or later)\n", rev);
>  }
>  
> -static void wait_tick_pvh(void)
> +static void __init wait_tick_pvh(void)
>  {
>      u64 lapse_ns = 1000000000ULL / HZ;
>      s_time_t start, curr_time;
> 

