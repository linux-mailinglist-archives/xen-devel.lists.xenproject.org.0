Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF47B81AE9C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 07:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658485.1027649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGC9k-0007M1-Br; Thu, 21 Dec 2023 06:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658485.1027649; Thu, 21 Dec 2023 06:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGC9k-0007J2-8u; Thu, 21 Dec 2023 06:03:40 +0000
Received: by outflank-mailman (input) for mailman id 658485;
 Thu, 21 Dec 2023 06:03:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1W3I=IA=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1rGC9i-0007Im-Bc
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 06:03:38 +0000
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [2607:f8b0:4864:20::c2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adffd652-9fc6-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 07:03:37 +0100 (CET)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-58d18c224c7so328365eaf.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 22:03:37 -0800 (PST)
Received: from [157.82.205.15] ([157.82.205.15])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a635310000000b005c200d6486asm792604pgb.72.2023.12.20.22.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 22:03:35 -0800 (PST)
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
X-Inumbo-ID: adffd652-9fc6-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1703138616; x=1703743416; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fHToyja4NOHxEQaCqApSgLT7a7lMQLL0/3uq9tFGO2I=;
        b=WmCws8Vm5PueCymOvacS4/bUGRX8TIUA1oZUGcTltiorbz8GttZTf+PD8PoEa2wz8K
         RCEy1XnJP1R3k1DPfY5cNlubh8sDU1xQXL+clFKqCdoz2nDt8FPELVp3ljVzfuVfpoj5
         xSgZYqen7z3GjRHLysx6PbKLpsmMJlvHLmsjokUL6j2VPJAGcZlEhWOdiWBwcan459r4
         Fw0MNHWdWc2NdpuAo9ZDI8DaWcofYect+D0sarI0ztFBJDEpPdHLo/KivH9Zi+06YiLi
         Euv+S2qIGCqMszoo5FvpB/APlZxL1CYnJBNj7gIW28H9C8r9lLnIIps4kEyl1icVVa77
         YASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703138616; x=1703743416;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fHToyja4NOHxEQaCqApSgLT7a7lMQLL0/3uq9tFGO2I=;
        b=Yip8AP1SYthUyrDR8jo7bMq7b+UCcW5OOUZJxmNBBtgoL2TVs2liFKxPePvK1Jpatz
         1y6i022oZWhcJHcE+XHSBBSk5rJzHj1Aor8uFOJkdbwHnxIHLJparGbvEqAG17YSXba7
         8+kScysKVaoWvV3jXwF15bfxeIa8Ghe16x4Rnn8K4qFaO+fkq2YjRzCOJEl4QON1/PC8
         wDIttVar1aI65pl1UkADtCPS21jxnJwAnhfvvWm7vxDAYfcSPH5auohFsxQKPxKdmnIy
         s1racILMqg4CEpGxe8oH2mjEfB4wPvEDGdWwUgI5so1TN05C6uF9eJ66nV4iTNrQ5lbW
         4QSQ==
X-Gm-Message-State: AOJu0Yy8fCjs5M+Yt/FWvS+lIErBL9rT76mq+8e5z7Y7OLWp/B4Cxtlp
	OeqQ/bfLbPXV8SAb10oZVk8DBA==
X-Google-Smtp-Source: AGHT+IEMQ5PuC83SBrlBqTQNw0uBmtZ5FakIl34HWWckWSPLVEFbAQ9LAiZ5cJX3NGm7MZHHgdpsTw==
X-Received: by 2002:a05:6359:45a1:b0:170:2c94:31c8 with SMTP id no33-20020a05635945a100b001702c9431c8mr666680rwb.47.1703138616039;
        Wed, 20 Dec 2023 22:03:36 -0800 (PST)
Message-ID: <14c9ad8c-512d-4fd4-ae63-5a44d7565a01@daynix.com>
Date: Thu, 21 Dec 2023 15:03:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/11] virtio-gpu: Resource UUID
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, ernunes@redhat.com,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-9-ray.huang@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231219075320.165227-9-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/12/19 16:53, Huang Rui wrote:
> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> 
> Enable resource UUID feature and implement command resource assign UUID.
> This is done by introducing a hash table to map resource IDs to their
> UUIDs.

What about putting QemuUUID in struct virtio_gpu_simple_resource?

