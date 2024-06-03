Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E29A8D818A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734906.1141040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE6BW-0006Lu-7m; Mon, 03 Jun 2024 11:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734906.1141040; Mon, 03 Jun 2024 11:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE6BW-0006K7-53; Mon, 03 Jun 2024 11:49:06 +0000
Received: by outflank-mailman (input) for mailman id 734906;
 Mon, 03 Jun 2024 11:49:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YA0q=NF=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1sE6BV-0006K1-07
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:49:05 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4594fb0a-219f-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 13:49:02 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-35dc0472b7eso3590727f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 04:49:02 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.177.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04ca9bbsm8651496f8f.31.2024.06.03.04.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 04:49:01 -0700 (PDT)
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
X-Inumbo-ID: 4594fb0a-219f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717415342; x=1718020142; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YwQ/Pdf4Y3EmNBto/siemVD2L186u3Gcst2+RqrCCHU=;
        b=rGtYI2F0eoBR2FW8Hia03AA2mIU5SC1HBBo6o7UJPn8RtepFrVMTuP9kms00XeBPSn
         DXkNLL/GIfpF/36I1gFN/avPVENI1CuVU3T6kFxY/XtRD/ON1Y3BhUsMkFsyaBN8+iaj
         TTEE98VEgZHb1PjtUnCow79Trzz3eUElpiwRzm+UgAOPBDVTmu2kMwBjSMjYCKkBdvDU
         8Z22fc4AFXtbjcQmkj6vlnEAV8y1l8MmTe3zevJ5aChXWpJEXtSCR7q8FixD9+cjapk2
         SBQvmH6kbNT7aXzgX06c4o8nKFFXXDXst+8URsiFpAN/kT8wsBzYXTGTMw6dES6jJOk5
         w+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717415342; x=1718020142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YwQ/Pdf4Y3EmNBto/siemVD2L186u3Gcst2+RqrCCHU=;
        b=PCdMgo9/Hb62rg6Pl++b1FGMr+5MSiqBZshOvu38BzPWgEooyYqUd3Ll0aO051dPsv
         UeUAvrRlBRXrOWvlPVzqtti8Xk5Q5Go5m9pvA+7Jvoc8vpj6DrdJAKFAYRXQz0hFBPXc
         EGqnP2S+9ag94vnLmEtQ+yDqOWQLNF22zg8CTmdrZ7NMkJFb4wJd2HXYS1dgnM+2lqLv
         ZG+bDqVV5wSTgp8XDp2teMctVY7HyfR79dU7jCMDdgLrJLMVU+lYiHpMZd0tXkS/rQFI
         ra1SrTOHU+4fAgOH8QnXYIsyDkzT4Ej9DtyaT3S6G1AsPVJamj753lJp9JGYKPYBY9Vt
         wr9g==
X-Forwarded-Encrypted: i=1; AJvYcCUo1LrNmtc/i4hl0/0YKnAV206TVdBt1gKaBFS48PTpVgZA4eH6l9f9NX9/73EijoHE+aMSRWFJkhi2xR8xv5USJZLZut7ivloSvxee+wo=
X-Gm-Message-State: AOJu0Yyd//pngB1XOuYMHdjLBDGEIjEhUhy1soPFflPzPHid2Uc5w8u8
	jvFM3k+rTKjms7nNL6KQGpPk/9xml5kGikBErzPtEttEvzoEITqRrVyWCsioO/s=
X-Google-Smtp-Source: AGHT+IEFOw08szT4GXwub1/2CwBP2HURKztzGBZQBQKhd0OivMVk9XKNPsjeqx+sYrMmKpqVgkG8sQ==
X-Received: by 2002:adf:f852:0:b0:355:25d:a5b0 with SMTP id ffacd0b85a97d-35e0f273304mr6089349f8f.15.1717415341805;
        Mon, 03 Jun 2024 04:49:01 -0700 (PDT)
Message-ID: <ba6a62b7-46a6-4e2a-a4c0-ee42a5e63fbb@linaro.org>
Date: Mon, 3 Jun 2024 13:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] hw/xen: Simplify legacy backends handling
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20240510104908.76908-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240510104908.76908-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/5/24 12:49, Philippe Mathieu-Daudé wrote:
> Respin of Paolo's Xen patches from
> https://lore.kernel.org/qemu-devel/20240509170044.190795-1-pbonzini@redhat.com/
> rebased on one of my cleanup branches making backend
> structures const. Treat xenfb as other backends.
> 
> Paolo Bonzini (2):
>    hw/xen: initialize legacy backends from xen_bus_init()
>    hw/xen: register legacy backends via xen_backend_init
> 
> Philippe Mathieu-Daudé (5):
>    hw/xen: Remove declarations left over in 'xen-legacy-backend.h'
>    hw/xen: Constify XenLegacyDevice::XenDevOps
>    hw/xen: Constify xenstore_be::XenDevOps
>    hw/xen: Make XenDevOps structures const
>    hw/xen: Register framebuffer backend via xen_backend_init()

Thanks Paul for the review, unfortunately Paulo missed this and
merged v1 as single commit 88f5ed7017 ("xen: register legacy
backends via xen_backend_init") :(

Regards,

Phil.


