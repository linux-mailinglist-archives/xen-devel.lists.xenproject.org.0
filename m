Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86524818790
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 13:36:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656774.1025204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFZJy-0000mp-Si; Tue, 19 Dec 2023 12:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656774.1025204; Tue, 19 Dec 2023 12:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFZJy-0000k2-PD; Tue, 19 Dec 2023 12:35:38 +0000
Received: by outflank-mailman (input) for mailman id 656774;
 Tue, 19 Dec 2023 12:35:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16KD=H6=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1rFZJx-0000hL-1m
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 12:35:37 +0000
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [2607:f8b0:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ab44b4a-9e6b-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 13:35:35 +0100 (CET)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5bcfc508d14so3451761a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 04:35:35 -0800 (PST)
Received: from [157.82.205.15] ([157.82.205.15])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902a70d00b001c726147a46sm20886137plq.234.2023.12.19.04.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 04:35:33 -0800 (PST)
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
X-Inumbo-ID: 1ab44b4a-9e6b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702989333; x=1703594133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F9Gwzcym5HWFUBbV1xeReg3XbhM69FpFbd3YyCmCWDg=;
        b=xDoDBH7J0Pm//zAv1hhPn2+CzWFKu9Cl4vlSfoiP7Yx6Z/u+4NnhmLWCdSfX3b0Mys
         6ucCUq/ZNu7brbVlW9WSgdk0/m/mS5F8tzZb+hvc4nhAG8EfyxblzCOO5wsvZNq1jIGT
         BtBqBhPrjHktOR5ofj0OHVELH+Ka10xP5SuDiXwQgv55zs1ydR/LIJO/YYpDCOftuhCd
         AjA207GZJD0fOrPIKwYLvDjlMtwuwJSrQU8q/9nAlsEv/sH85JhYpVKyLq5JyvR6Wfl6
         YrvsZFOdyIsImu2qYgSfVUj/dntQwPpZ830Vyfd2VORDA+37Ymc9oxR/tERXc2Lpzx+Z
         hXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702989333; x=1703594133;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F9Gwzcym5HWFUBbV1xeReg3XbhM69FpFbd3YyCmCWDg=;
        b=Jp9eJruy99NY9TGAnG/VuZpe2DG1725DKkla4f3s5/d7iV/ieAqC2b0A9IbhCEdRyH
         dr8FY+NpvF6pqmfI//CJBKZhFQn05HvK3kDA6ESaQLNUZ3KS42h6H3upZD45vl8YU3TB
         Fmjr8G8sNqL2+RTQzeUQsUK3oKL0U0rZCo701k6QRA9gBwIZUV0vk1CIrU51EryKKL6L
         HC5n2OXl1lbBSvPHtnKs5py/9jZu7TOB0ADL8nz+u7ZNqYvCLzPwwnxPoN5Gs8o8bA5h
         7wmp9SOBOJubXLnTK7R9Oytstj1/0rK0I9PG00bJF/p+yZ+MmV6QyHkEhntoHWT9eFUj
         Ak3g==
X-Gm-Message-State: AOJu0YxtJ+CMy3V9HeJG3YXBQgUUNhAy0wVPSra5Me8y/g8J7Ew4o3In
	0cNl6etmNjFpSab4gDmqOMM+0g==
X-Google-Smtp-Source: AGHT+IHN7Cl1wf8+157FVO5wvi6ZF4ur84TuS3bmZwf9yzuEaKx9Eu+LO6bRYmp+TqjQ1Ol0YKDzIg==
X-Received: by 2002:a05:6a20:3d85:b0:191:bc5f:e803 with SMTP id s5-20020a056a203d8500b00191bc5fe803mr13369989pzi.72.1702989333634;
        Tue, 19 Dec 2023 04:35:33 -0800 (PST)
Message-ID: <3105531c-bfc4-4421-a197-4ab8ddb9f4a5@daynix.com>
Date: Tue, 19 Dec 2023 21:35:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] virtio-gpu: Introduce virgl_gpu_resource
 structure
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
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-6-ray.huang@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231219075320.165227-6-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/12/19 16:53, Huang Rui wrote:
> Introduce a new virgl_gpu_resource data structure and helper functions
> for virgl. It's used to add new member which is specific for virgl in
> following patches of blob memory support.

The name is ambigious. It should tell that it's specific for virgl.

