Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD666138AB
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 15:06:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432775.685660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVQZ-00083Z-TO; Mon, 31 Oct 2022 14:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432775.685660; Mon, 31 Oct 2022 14:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVQZ-0007vQ-9M; Mon, 31 Oct 2022 14:06:11 +0000
Received: by outflank-mailman (input) for mailman id 432775;
 Mon, 31 Oct 2022 12:13:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a9QX=3A=redhat.com=javierm@srs-se1.protection.inumbo.net>)
 id 1opTfn-00064X-9N
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 12:13:47 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77a02b38-5915-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 13:13:46 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-19-ty7L1GAdO6mkRXNXxC619Q-1; Mon, 31 Oct 2022 08:13:42 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 p14-20020a05600c204e00b003cf4cce4da5so2548430wmg.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Oct 2022 05:13:41 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 az29-20020a05600c601d00b003cdf141f363sm7207444wmb.11.2022.10.31.05.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:13:40 -0700 (PDT)
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
X-Inumbo-ID: 77a02b38-5915-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667218425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2H8Fq04+XbNugdc6Ty/YSDXQIs5WWNt9cW9u1MIkjOA=;
	b=Fyinmr+Q0n1IVSrn1/exfVMuahFI1GnKDLxSO9gZGMd5IxN240qNx53yJ9b8Xz6pqMid2b
	CEI3LOrG0zsDnl738U59edgRRo+QqiKnBUmP449C4+uKDWKqe0ZDPz5nEbUAotsDijRKNC
	OqQAZMk1+J6bQq5CGLVsSuBJCkLyXMI=
X-MC-Unique: ty7L1GAdO6mkRXNXxC619Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2H8Fq04+XbNugdc6Ty/YSDXQIs5WWNt9cW9u1MIkjOA=;
        b=7JOvEnKaBl49ljtmZsFoPXkhtRGzKBRFKPSB9jL1pJpgtmiEE+4XOZmJqRcrUsB3fY
         Vf49lISQcgR/rprKN1NExcgnqhgHa81EFDkVeIldJ+HkmsopnSgDjetusDiKEsiSWmTM
         Zn7EYRlBriEsepLmYycfUqBjg0QtsCuKFkhBbbCaONXoKtKWv9xZgJfhzFf9PEf/j9xL
         EaVZfxW9OB3VAkDCNB+pve11E3FaQW3KtfJ6ID3fr3iv70twy1dFnU7jHqLIYCqoQxd3
         DEUqDIXQVvg2ytQYlzjIVL85uxJFLqojDTOxQcyKiS7s3Pmn5k/x5CjQe35aSxUjE1rx
         OaMA==
X-Gm-Message-State: ACrzQf2glnlK1fC0JL/lSRTDyS+rnL0rOGv6mtq3c9XcE+IguCyKMj8v
	Zd1sI6tMhOFkEg6y4nL/SwSfe/sfmf31uBnFA6zZrvCVbJhwCY5it+YrqNmTB36nhKw265UaiSq
	JBTOyGt80b74Nvp5XFCTMnCn9CsM=
X-Received: by 2002:a5d:64cd:0:b0:236:6d1c:c1a2 with SMTP id f13-20020a5d64cd000000b002366d1cc1a2mr8196703wri.360.1667218420935;
        Mon, 31 Oct 2022 05:13:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+QX10ZDmjvc1IfL0XXmvBimtEQHEjFBrrHb50hNQes1zzurNnpW//og1SN1o9c/o5tX548g==
X-Received: by 2002:a5d:64cd:0:b0:236:6d1c:c1a2 with SMTP id f13-20020a5d64cd000000b002366d1cc1a2mr8196664wri.360.1667218420692;
        Mon, 31 Oct 2022 05:13:40 -0700 (PDT)
Message-ID: <231be619-96b7-b725-0735-0275e07477d8@redhat.com>
Date: Mon, 31 Oct 2022 13:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 04/21] drm/amdgpu: Don't set struct
 drm_driver.output_poll_changed
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
 <20221024111953.24307-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.output_poll_changed. It's used to restore
> the fbdev console. But as amdgpu uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See the
> functions drm_kms_helper_hotplug_event() and
> drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.
> 
> v2:
> 	* fix commit description (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


