Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432A5616058
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 11:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435754.689493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqAYs-0002YP-Nv; Wed, 02 Nov 2022 10:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435754.689493; Wed, 02 Nov 2022 10:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqAYs-0002VZ-KX; Wed, 02 Nov 2022 10:01:30 +0000
Received: by outflank-mailman (input) for mailman id 435754;
 Wed, 02 Nov 2022 10:01:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+Qw=3C=redhat.com=javierm@srs-se1.protection.inumbo.net>)
 id 1oqAYr-0002VT-25
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 10:01:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 509e2c6b-5a95-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 11:01:27 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-_in6jKhSNiS1DF-QxevBGQ-1; Wed, 02 Nov 2022 06:01:25 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 f62-20020a1c3841000000b003cf6d9aacbbso3544417wma.8
 for <xen-devel@lists.xenproject.org>; Wed, 02 Nov 2022 03:01:25 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b13-20020a5d550d000000b002366b17ca8bsm14230263wrv.108.2022.11.02.03.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 03:01:23 -0700 (PDT)
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
X-Inumbo-ID: 509e2c6b-5a95-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667383286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QoVTRIE06q1gLaA+FiGPh2NoY5TNtlfidxMdk3t+aTM=;
	b=fuSs/eA4/7vZhV+X35FsnJlEhJ/20+W2k2LZenlQ7FIAvrb5mWjQpHZEEE3G7/vkuBezcY
	ci/Smj7q/Z7hIgWVlQx1F2hNiJZQuFSvdEElWEudDf6CzncUGzYGNXoMcPmOQDpm4N2pDn
	leC3TPAoQgZGNS5Qf5k3LtPYa4n+dVI=
X-MC-Unique: _in6jKhSNiS1DF-QxevBGQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QoVTRIE06q1gLaA+FiGPh2NoY5TNtlfidxMdk3t+aTM=;
        b=D2gfTjVyRjC4thgiFQq1bDQhCawSV54ctNXQQy27F5D+QooPvR0IAeZo72NwHKxhXx
         34KVdvP/CDT6Do1IPiasKv8+MPr43x14hX+wOYU4cVPdIeTaPsa+uOXKDFw84z74ut4T
         XbA3OBuvznA31UVePpA7JlkEeurwiuuVT0QDQLgCYqgscc4YCEU2Noq01UnuyN+6pIJY
         yzYMhEDLGyEibYv+rGecCgAvZuwkK45oDo3e//yiYlPy4kzTCLrpoZxxUra4AuYXUxfs
         Av0d+FXfAL4y7exuRgMYRxYsrKPPKu3cGZe4oHg7kRd5XP216+J5SH5chAXKag9Fpjkc
         /FDg==
X-Gm-Message-State: ACrzQf1RLG/FTNwpYzY5bJzgZx5M+q0qkh6jaXGX76qM/wbD6//IA6A8
	8g3UDJkFRVu14/g5+qCWOWpgdTbBMyVEaD2FXk/31H7+O7J6rH89RcEqxXZ7HLBTD+VVjwESBbu
	bY7hIwIaI/+sTx5O4LxVz3G5NYHg=
X-Received: by 2002:a5d:5505:0:b0:236:582b:7eb0 with SMTP id b5-20020a5d5505000000b00236582b7eb0mr14405755wrv.68.1667383284403;
        Wed, 02 Nov 2022 03:01:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ieiweFPtXW5w3c0VZoUXMoQohTPuy1WtQBfT29g+UzlDhvHMzFOjUUUPFpm0LZwMa5DV8ag==
X-Received: by 2002:a5d:5505:0:b0:236:582b:7eb0 with SMTP id b5-20020a5d5505000000b00236582b7eb0mr14405736wrv.68.1667383284200;
        Wed, 02 Nov 2022 03:01:24 -0700 (PDT)
Message-ID: <1d2b9809-857f-48cc-1177-72e6fc67b8e5@redhat.com>
Date: Wed, 2 Nov 2022 11:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 20/21] drm/fb-helper: Move generic fbdev emulation into
 separate source file
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
 <20221024111953.24307-21-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-21-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Move the generic fbdev implementation into its own source and header
> file. Adapt drivers. No functonal changes, but some of the internal
> helpers have been renamed to fit into the drm_fbdev_ naming scheme.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


