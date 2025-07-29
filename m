Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CB4B14D04
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 13:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062532.1428238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugiTK-00042g-Nb; Tue, 29 Jul 2025 11:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062532.1428238; Tue, 29 Jul 2025 11:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugiTK-00040b-Kp; Tue, 29 Jul 2025 11:26:18 +0000
Received: by outflank-mailman (input) for mailman id 1062532;
 Tue, 29 Jul 2025 11:26:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xsxe=2K=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1ugiTJ-00040V-ES
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 11:26:17 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d00cae95-6c6e-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 13:26:04 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-454f428038eso47399075e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 04:26:04 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78d45d010sm3310098f8f.8.2025.07.29.04.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 04:26:03 -0700 (PDT)
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
X-Inumbo-ID: d00cae95-6c6e-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753788364; x=1754393164; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bamcpu4ZxaiiMEq1WdGInn9RkfGT1cDZci0aMm9WFWU=;
        b=fg7djMTQV9pO73s2ZR0sIIXtw4B4hyroKtEK2rQCRCo6fmCUK/l4KPVzMSUSjgjwXk
         Tv3VxEd8kNGrqWJBQlco63iOA3nFNqGB0TmmycNAo3LBLPncBIK+Gb6HnuYyYPHIge1n
         TMrTI8B0DmNBj18d4EDCIMbx9gXEp7YLuJ5pltWnV6ZFqfUKCnXCGf864Yql5MU4N/x/
         AHZ98v8fEc0epPEWyj4cHz8DqF5nqo3fDaIHGhSF6GKJSg1QahbvcrE2tDXuYxCgetO5
         rNs83zS/Hy7q9Mgnfpt9XhzD4RnoumYTm7E1mSpCj1MlFMSPy/6KVQQInXioLQ/YibLD
         l8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753788364; x=1754393164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bamcpu4ZxaiiMEq1WdGInn9RkfGT1cDZci0aMm9WFWU=;
        b=PAL+WM5fPzeaf1v5PnmGerWLC1vSrlBG7q3/wxdDykMQtNH2tdfDna8Ap5MPCi98pi
         0NKlRw98T3URIO/y7fH3KDNL8Mmo+GbX9tNY+cyeHfkO+D7phEZ9Ef1tm4xi6mUI6en+
         CR4SzZwPSlITgyaY5wBtQzd5lKsTpu8eXPXJz840XhhVhOmrbSLv84mUh/K815ovrA+V
         Z+PlmWPgfK4k0GermTeEpky7pRH/VwIEroguys9YbLRMXQR1YXcmuvTVgNBz1wdYAAAM
         uAbehLRncWFjLVBsVTxtZ60/2Sy0eL0iUnMBWiI4hM4+f0j2wUtWm1rEFCXAgiF2MHKB
         ncxw==
X-Forwarded-Encrypted: i=1; AJvYcCUXRzK44qOTBE2RVf5yw8mey0woq/DYiew6zT0MRxPakKEPSpZEincg5OanNCoAp1FTlZBaOy7pK8Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwE0mbfmDjhiJCI+kDfpxAkT8011EM+sETsmlscOIYnGeunIEeK
	YUShEj+flgb58YozKUh10P6HLoPuQNdPLiPUXWXyJQZ4wn4IwxI0UbLhgXDMw5XgXSE=
X-Gm-Gg: ASbGncvtd92tAMruLuMVrMU4o2tIkYi1g2eF9KLSlXgmADt+briUuOJSKQ94yHK8bO4
	VOItdOkz7lu3Z3KPwhysK7omTeFeQNHJxQB6lPTDUrXWQeqYjOXkzcI/k9+Dnuds2IyPTO3MiGC
	EpgihmKHyXqM/AEj6tX/DYDJ4B5BhL4vijAN4350NY1x5SFvvFwXDSg6vZVfeXRJQarTNNtqkY5
	J80EoaeBLXY8RkguPAdrskvZEkLKV6TFTqQ+jIZyk49cODVFQRJkJr3xVUg/K+PiwHG+sgYZoIS
	BLQojGjxouG0ocLr64iaYLJSLs521xTeq7GmgBFKpN40Yr615/zKuPpEe65zG0LS2QSqPcD0FfQ
	v83TIdognYGhlhi+bNZtB2c/pDWldJcc2Yw8FkZajYxU1GbEsgoCkO+nEv1mymMf34w==
X-Google-Smtp-Source: AGHT+IFsGQgT3nWmOCzVxTZbl/bJv6N+J6axhFXup1a5if02Esb7AvBb5wMQiuZlrbRSMG067C0NVA==
X-Received: by 2002:a05:6000:258a:b0:3a3:6e85:a529 with SMTP id ffacd0b85a97d-3b77679866emr11233434f8f.51.1753788363594;
        Tue, 29 Jul 2025 04:26:03 -0700 (PDT)
Message-ID: <14fff91b-7434-4d90-adb1-ebbe3f51d605@linaro.org>
Date: Tue, 29 Jul 2025 13:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org
References: <20250729111226.3627499-1-armbru@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250729111226.3627499-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/7/25 13:12, Markus Armbruster wrote:
> xenfb_mouse_event() has a switch statement whose controlling
> expression move->axis is an enum InputAxis.  The enum values are
> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
> case for both axes.  In addition, it has an unreachable default label.
> This convinces Coverity that move->axis can be greater than 1.  It
> duly reports a buffer overrun when it is used to subscript an array
> with two elements.
> 
> Replace the unreachable code by abort().
> 
> Resolves: Coverity CID 1613906
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/display/xenfb.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
> index 22822fecea..5e6c691779 100644
> --- a/hw/display/xenfb.c
> +++ b/hw/display/xenfb.c
> @@ -283,8 +283,7 @@ static void xenfb_mouse_event(DeviceState *dev, QemuConsole *src,
>                   scale = surface_height(surface) - 1;
>                   break;
>               default:
> -                scale = 0x8000;
> -                break;
> +                abort();

We prefer GLib g_assert_not_reached() over abort() because it displays
the file, line number & function before aborting.

>               }
>               xenfb->axis[move->axis] = move->value * scale / 0x7fff;
>           }


