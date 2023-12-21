Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFAB81AE7B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 06:44:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658470.1027618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGBqW-0002jh-9c; Thu, 21 Dec 2023 05:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658470.1027618; Thu, 21 Dec 2023 05:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGBqW-0002hO-74; Thu, 21 Dec 2023 05:43:48 +0000
Received: by outflank-mailman (input) for mailman id 658470;
 Thu, 21 Dec 2023 05:43:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1W3I=IA=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1rGBqU-0002hI-N4
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 05:43:46 +0000
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e71add7d-9fc3-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 06:43:44 +0100 (CET)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5ca29c131ebso349263a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 21:43:44 -0800 (PST)
Received: from [157.82.205.15] ([157.82.205.15])
 by smtp.gmail.com with ESMTPSA id
 p14-20020aa7860e000000b006d7051f1fa4sm692309pfn.102.2023.12.20.21.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 21:43:43 -0800 (PST)
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
X-Inumbo-ID: e71add7d-9fc3-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1703137423; x=1703742223; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Sg4XTORipdMJilZwtaZ1foO2eUm0Kr7Yfx7emFr720=;
        b=MUiU9/ItlykUUoUMo7KbYF7vm+h94R1LQOD1gCzBlRQZmRTqyhpBa9uoI/wsEe4dIf
         yDnheg7INJLyfLBP7MrWXhwvfdqwg9G2nWFu7Gfm6HYv/h3zGQrGMIrqsZRXNa9/ia0i
         hvbm0L8JFX3cJB8TBZ4wzQC+pxjysZihlkA5a0mu9vmZAflfP+yUiQIicpFqCBSxQys6
         mZrQcOh6KoOZ2wylpStk7XaKPQjx4NcHL53Cdj7uu44XENnBLAwrdw29lGEYbOFTDw7U
         9zvX2xaAesIWMXVvo6EYToDxy/+JDpGdWKRUrE78YK5RqeVkh3C2x3cNvUIUYE/iluzU
         sHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703137423; x=1703742223;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Sg4XTORipdMJilZwtaZ1foO2eUm0Kr7Yfx7emFr720=;
        b=t8ZT1UrRR7fWDf+vLJZPI7eQwkL1htrm03cWe3/vs3oTB2j8T7BH/KTgXe1JOIgnme
         ok37SOIV8YA3lkqzXprHs8yMIaNQrLsCpoRzUooMSdaePrQQ8kktFD8KKJ4qCvj42cxp
         MurKtNZYZ8ntjv9Jv3C6Mt/+3oL5IAWHdp8KfIbTDMS4duhj5CBpdUt99EsGxAoGAHy9
         M0CCY2HtHjMMBLZhFE+cYuEtDXhus5sQGsVGVxs32mT1N16mY/zztSei1qsRIYtcZkEL
         rlTvbsSy7dwmCuE38YS+2ZqjodNiYYDNgWW3OFHo0WjfV3ijQl5ObgZgLlLkfYdXWB+A
         3/HQ==
X-Gm-Message-State: AOJu0YxYZnv1VeCy9qBBpN5d9dDa3bkOr+y5bTdEHrNmXhlyH4ltWtcd
	nvxD2EfK35m1JE1cBTCb0E5Gvg==
X-Google-Smtp-Source: AGHT+IEIyTgUa9cBQ6ZLv2LyJbVU+SrLut2YfLaDggNwHO+ruZ5n7whxbib9TSEle6uK/7uxaE7klQ==
X-Received: by 2002:a05:6a20:2452:b0:194:cf29:1ca0 with SMTP id t18-20020a056a20245200b00194cf291ca0mr1050217pzc.93.1703137423445;
        Wed, 20 Dec 2023 21:43:43 -0800 (PST)
Message-ID: <c5d9e074-de7c-4056-becc-8fd1ce24f3e4@daynix.com>
Date: Thu, 21 Dec 2023 14:43:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] virtio-gpu: Introduce virgl_gpu_resource
 structure
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 "ernunes@redhat.com" <ernunes@redhat.com>, Alyssa Ross <hi@alyssa.is>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-6-ray.huang@amd.com>
 <3105531c-bfc4-4421-a197-4ab8ddb9f4a5@daynix.com> <ZYGaWs6OmZpaMH46@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <ZYGaWs6OmZpaMH46@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/12/19 22:27, Huang Rui wrote:
> On Tue, Dec 19, 2023 at 08:35:27PM +0800, Akihiko Odaki wrote:
>> On 2023/12/19 16:53, Huang Rui wrote:
>>> Introduce a new virgl_gpu_resource data structure and helper functions
>>> for virgl. It's used to add new member which is specific for virgl in
>>> following patches of blob memory support.
>>
>> The name is ambigious. It should tell that it's specific for virgl.
> 
> How about "virgl_resource" which inherits virtio_gpu_simple_resource? But
> this name is exactly same with the name in virglrenderer.

You can prefix it with virtio_gpu_virgl as virtio_gpu_virgl_init() and 
other functions do.

Regards,
Akihiko Odaki

