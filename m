Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A566138B2
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 15:06:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432800.685732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVQg-0001Om-42; Mon, 31 Oct 2022 14:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432800.685732; Mon, 31 Oct 2022 14:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVQf-00011l-7v; Mon, 31 Oct 2022 14:06:17 +0000
Received: by outflank-mailman (input) for mailman id 432800;
 Mon, 31 Oct 2022 12:23:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a9QX=3A=redhat.com=javierm@srs-se1.protection.inumbo.net>)
 id 1opTp7-0008Lw-75
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 12:23:25 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d02cab61-5916-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 13:23:24 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-38-4-D7V0N8Of2X3AI86-dHwA-1; Mon, 31 Oct 2022 08:23:19 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 r6-20020a1c4406000000b003cf4d3b6644so1056185wma.6
 for <xen-devel@lists.xenproject.org>; Mon, 31 Oct 2022 05:23:19 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ci8-20020a5d5d88000000b0023662245d3csm7011927wrb.95.2022.10.31.05.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:23:18 -0700 (PDT)
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
X-Inumbo-ID: d02cab61-5916-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667219003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQCx1YM0kmrgAAcvKhWafunY3KuhCAquKBUmZJVCfV8=;
	b=OXxETfR4g8DTtsYOgeAYKp+EQgjNGaqLLCMi4dhrYZ+lPfcfdS5h5O8mwAFhR877yun0Zf
	nn2XbQOGwj8SjrqEVIoXsAliYDbiWm27JjHNCKViA/plFCtoSisI7Dw8DPfoOt6SWLCrcj
	xhNghWqsLn4MotOmVecD81rNWnwv9F8=
X-MC-Unique: 4-D7V0N8Of2X3AI86-dHwA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQCx1YM0kmrgAAcvKhWafunY3KuhCAquKBUmZJVCfV8=;
        b=v6hcEhgPzw6uJEPtscv7l4FPt8LptZWomXClKWy5a/HQPRtZWjlMnIbXkvs022oklA
         mDhKm9YS2feVYdPSnixsCG3lcTgg4qlcfEiEw1Xz21L+qQquG9Iac1B/VOFbLN30UVex
         QKI0uFo5tGaBjTUUWCia3bLbn8ceyZASwDzl7w3gF3EIYP07VOGYLMFSHM8ctuImHa/L
         AKqBucgtLhsxNPFEnqqiy2W1W2kx8vivJ/P6dpzg2qs6QWMTMDByHL3pUgI/3SR4wRH5
         a6Dan8mzwS19qe+tCXgLQ/FaG8CbjK1lSnWEey9OwRpgv/NDZ7UZkm5nkl1HPVwlwlm2
         yyZg==
X-Gm-Message-State: ACrzQf2UuLWhU5g7fD2zWgbNMQLVtr1Nj7bUyIPAQIXEwBns4MWpL8A+
	DopR2hvjtOB48T2MrxYXv34QSI9nvgBKLBuYyr4GfP2X4ThZ7LE2Bc8SfLaaSKpqXaHlEiawzd0
	iTyZoNQXzn6pvUiW9zq99qYnqfwU=
X-Received: by 2002:adf:aa8d:0:b0:236:588f:71f with SMTP id h13-20020adfaa8d000000b00236588f071fmr7582892wrc.205.1667218998717;
        Mon, 31 Oct 2022 05:23:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7e34dAcxvP3Vi0CwbwP1YeMi235O6q6VyKCYvEf93eDT38FEWiyAv5s+MTc8QNv7Bgz3ny/w==
X-Received: by 2002:adf:aa8d:0:b0:236:588f:71f with SMTP id h13-20020adfaa8d000000b00236588f071fmr7582855wrc.205.1667218998538;
        Mon, 31 Oct 2022 05:23:18 -0700 (PDT)
Message-ID: <63a804b4-ab2c-f5b7-73b5-edefdeff038e@redhat.com>
Date: Mon, 31 Oct 2022 13:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 11/21] drm/fb-helper: Cleanup include statements in
 header file
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-12-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-12-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Only include what we have to.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Nice cleanup.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


