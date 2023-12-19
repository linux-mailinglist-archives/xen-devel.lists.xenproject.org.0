Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBB5818749
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 13:21:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656763.1025184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFZ5P-0004ig-6a; Tue, 19 Dec 2023 12:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656763.1025184; Tue, 19 Dec 2023 12:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFZ5P-0004gr-3V; Tue, 19 Dec 2023 12:20:35 +0000
Received: by outflank-mailman (input) for mailman id 656763;
 Tue, 19 Dec 2023 12:20:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16KD=H6=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1rFZ5N-0004gl-3h
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 12:20:33 +0000
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [2607:f8b0:4864:20::d2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff95efef-9e68-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 13:20:30 +0100 (CET)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7b7f93eb935so6894039f.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 04:20:30 -0800 (PST)
Received: from [157.82.205.15] ([157.82.205.15])
 by smtp.gmail.com with ESMTPSA id
 b31-20020a631b5f000000b005bdf59618f9sm19014375pgm.69.2023.12.19.04.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 04:20:28 -0800 (PST)
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
X-Inumbo-ID: ff95efef-9e68-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702988429; x=1703593229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wQA0RlwSqqyN9Wcw543mwNNgu5OHdx84OKgHRedGrS8=;
        b=zqK/lBI0KgkiafLqyR/09cKqkMQb7xP65rEv5wpGHIlxTk2xqHPa+ZTdsZ+2B39Eze
         DHD09JBZ2FjhC1NXRRaqrN0OB9S6q1RLBiH34ZPQd2qvPTMK68IVEfFUDO3xkAZpt2Lq
         vopUmc6MBYR19KtIbked7bbx9yR8vjqERH8diCArzKf2L+pga+yr9qmCi+sbBKeoxm51
         MSU9/ONTZSey4jYLNki9GD6M+QlYAVoVK3A8Elz3x4qiF0zvhKLX5Nci8UARqNsuYmvA
         Ig7AacS2PmXrR77jlIVfvXDdmeHw8CW9y8CpWMCJu/DEEDUPrxmSl0Huur85Lq4Mms06
         gbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702988429; x=1703593229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQA0RlwSqqyN9Wcw543mwNNgu5OHdx84OKgHRedGrS8=;
        b=UpLQwW6F5niOr38xceYaHIXXcmXa2hhOfBWY1zLoLqdwqw579T66brzhAd6kXYc1DK
         7EoFJLiDoptcspieGf0MOFFHlMRw/yh9WNhpQMT2+wWdkr+Mm/gIbE3e5pZ/bRQ7U9z7
         9gw6IMdflp0TezdXrAJGdCzYiCCVzq1sgalWiYkL14mCyqnTR6LX+RuolC8Ti8CHQqUS
         5KjYlCaTb4EEqqjQTk+ox8m3rlggPbGYHl61lergAiMINqOoKhsmu5irNi0kAwsNLXE0
         fhoyV6uPQ53sqkySh8OefgJ2uXZkOqbePyQh1ndtfzXqMkP7FodiEXK7NcuaNWtvUchT
         cCeQ==
X-Gm-Message-State: AOJu0YxDLGeBGtHeOJpFnCcQsOc0pJgzEO2srIyKaDOROIFLxEpF8NgT
	D3mow0MRHj66CHNCowqdt9jePg==
X-Google-Smtp-Source: AGHT+IFKfEaAOkSPqk6IsZ6SDxRqyf21egeIRYzz8LW68SmNcxq3Kf4hF2brQKO78npgJtIpDnKX/Q==
X-Received: by 2002:a6b:6105:0:b0:7b6:fc48:46d1 with SMTP id v5-20020a6b6105000000b007b6fc4846d1mr21755028iob.12.1702988429230;
        Tue, 19 Dec 2023 04:20:29 -0800 (PST)
Message-ID: <6adff6d2-7c58-4c78-93a5-5a4594a60d27@daynix.com>
Date: Tue, 19 Dec 2023 21:20:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] linux-headers: Update to kernel headers to add
 venus capset
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
 <20231219075320.165227-2-ray.huang@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231219075320.165227-2-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/12/19 16:53, Huang Rui wrote:
> Sync up kernel headers to update venus macro till they are merged into
> mainline.

Thanks for sorting things out with the kernel and spec.

> 
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
> 
> Changes in v6:
> - Venus capset is applied in kernel, so update it in qemu for future use.
> 
> https://lore.kernel.org/lkml/b79dcf75-c9e8-490e-644f-3b97d95f7397@collabora.com/
> https://cgit.freedesktop.org/drm-misc/commit/?id=216d86b9a430f3280e5b631c51e6fd1a7774cfa0
Please include the link to the upstream commit in the commit message.

