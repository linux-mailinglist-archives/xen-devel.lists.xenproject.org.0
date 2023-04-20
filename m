Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806D76E8C88
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 10:18:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523941.814378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppPU3-0002be-Qa; Thu, 20 Apr 2023 08:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523941.814378; Thu, 20 Apr 2023 08:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppPU3-0002Yh-Mk; Thu, 20 Apr 2023 08:17:39 +0000
Received: by outflank-mailman (input) for mailman id 523941;
 Thu, 20 Apr 2023 08:17:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wBYt=AL=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1ppPU1-0002Yb-Ih
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 08:17:37 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce078657-df53-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 10:17:35 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 eo4-20020a05600c82c400b003f05a99a841so690851wmb.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Apr 2023 01:17:35 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b002fe87e0706bsm1247834wrc.97.2023.04.20.01.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 01:17:33 -0700 (PDT)
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
X-Inumbo-ID: ce078657-df53-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681978654; x=1684570654;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f13MQ93ddq/Nd75N1ll36Z5zAz1KfuOg0cGpRV2ear0=;
        b=Dctjjv3Her1C+F0+KW0Qt046ZCEeDgZkO8003lMWpMr0cRK2zh6yCL6RYOmwdiFB6B
         zmVyNkKHCVk8PWYN3iSJuDcg/Hz/2pl7O56QaaORZ062381fPJidzo9qZzw2LJo4+PWS
         yU+r2fu7RH06XYw+XmjTlXFB3H5PlhyY4vJRDzWOIcLPu6vIoNpwcPWZDMmpOjjGIrrP
         Zx2XXZBP/gitGY/tqxUfd5jSGImn2wm+RiPX2kUPGke3B0mUvaeCM1+R6PUZNgtS1js4
         kDoD9FFhmx9jmoJroTu5BK21cqrW4TfUQjOAIvDyUfNtZJk3wnMEwpE+HJreU0YNXdnO
         e14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681978654; x=1684570654;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f13MQ93ddq/Nd75N1ll36Z5zAz1KfuOg0cGpRV2ear0=;
        b=VoSB5KnM6TShHth9xURHkuFgPQDtej8vvkXsFHYuCUcL86WtlbpGAhg49S9Qr04IYs
         DPxgUgadFX2XidRAOg9DsBNlk+Usq33SFeazhmJrlq4ZCMe/xSRbioM+oNI0adKLyJtY
         Enar0kVAEDq7pgH6ag0a1HfrFUlOfcL80aVIhZBnOJ8or0tMP3czFHq0RJJfh1mudqj9
         26feM1nngZgfOfmqc0B8IB73/Oy+wZ6rCTj/jCcGN0o0/Ee2OZqXOj0iNvPS3vR082Dh
         7+NV1VLaatzFNtfleGs0ZZnJ69FW+S0jGciIvMATOMq0tiCoIxuwXkqOeRo0OkyNsazp
         NsGQ==
X-Gm-Message-State: AAQBX9eMZfsGWJYpQDZFiXHX0v3wGbEOKjPwZT0GF0z2Nm3uDtDjfK+P
	8Lj7LqLcpafTeji4aakSO+r5Ww==
X-Google-Smtp-Source: AKy350a+S7Bo5cgeIITonHrFz17ZzQ14J39mXHJXktyn9+4RrBlds2+14MAKJinCJiahV/R/tP2QIA==
X-Received: by 2002:a05:600c:2183:b0:3f1:7848:6740 with SMTP id e3-20020a05600c218300b003f178486740mr647559wme.8.1681978654594;
        Thu, 20 Apr 2023 01:17:34 -0700 (PDT)
Message-ID: <cd8bb8f9-5d4f-76ba-1783-aebabb66a896@linaro.org>
Date: Thu, 20 Apr 2023 10:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 01/16] hw/qdev: introduce qdev_is_realized() helper
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Fam Zheng <fam@euphon.net>,
 Julia Suvorova <jusual@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Paul Durrant <paul@xen.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Lieven <pl@kamp.de>,
 eesposit@redhat.com, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <20230419172817.272758-1-stefanha@redhat.com>
 <20230419172817.272758-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419172817.272758-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/4/23 19:28, Stefan Hajnoczi wrote:
> Add a helper function to check whether the device is realized without
> requiring the Big QEMU Lock. The next patch adds a second caller. The
> goal is to avoid spreading DeviceState field accesses throughout the
> code.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/hw/qdev-core.h | 17 ++++++++++++++---
>   hw/scsi/scsi-bus.c     |  3 +--
>   2 files changed, 15 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thank you!


