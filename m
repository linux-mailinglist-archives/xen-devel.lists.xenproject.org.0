Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31F281B002
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 09:09:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658559.1027778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGE7I-0002U0-W2; Thu, 21 Dec 2023 08:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658559.1027778; Thu, 21 Dec 2023 08:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGE7I-0002SI-T8; Thu, 21 Dec 2023 08:09:16 +0000
Received: by outflank-mailman (input) for mailman id 658559;
 Thu, 21 Dec 2023 08:09:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1W3I=IA=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1rGE7H-00023w-Hk
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 08:09:15 +0000
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [2607:f8b0:4864:20::d2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39fd1d09-9fd8-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 09:09:14 +0100 (CET)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7b7d65d4eecso22089839f.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 00:09:13 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932?
 ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a634d19000000b005c6617b52e6sm1004679pgb.5.2023.12.21.00.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 00:09:12 -0800 (PST)
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
X-Inumbo-ID: 39fd1d09-9fd8-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1703146152; x=1703750952; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DFHtdbRBuHxh3sdDGxLPtxB6dXV5w1hZThhsj1oHuv8=;
        b=YHd4c1nerak3mZjRQAjqPmma5ZlQlq7NmC0aAeZrNfeyXHVS/3AkTT4DAFI6HGUvCC
         fup8WwQS44dMLGI1wcQL0O3uyyNr27Wl22tixI1GBv5FWtrgUBtN5sQ05fe4QmuJw0Ui
         g4VVyckRJZXLxLkwit6aY9t8wfeoK4s+flO9PfpB5qfD7gUheXmoB77+O0+TsJ9Yv07/
         Yttqgkdaxp5FjVVSXG49wkwJoEM8FzbGwoXiRzfvnZuqmos99r+9Or+5oxUL9fE22WHO
         9vqSV0EH52yqKUwp1H7UGgNE4wE+A0xLcTyW8mY3Ks7be9NZNBRiNCNaUM85vSNyV4E6
         sO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703146152; x=1703750952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFHtdbRBuHxh3sdDGxLPtxB6dXV5w1hZThhsj1oHuv8=;
        b=AG8V5ZeESY5QZpB0Wr+zIKcbHTwDXKsbYOAwk4UKCtgj2XfPdSeNbvGQkZ5ir4xszu
         U6J+KF+97W8SG6rtOOwTwtNJcPcvxO2Nk2vN7PeeE6MyF9kRWdPCEPm1VNsHGiK1uap5
         k7oQHcVgNuNDKxUYnyXqAHaeg34WExeYjU87+SXNBcKNaIwn5rnMhzUBIYXhg0nJHqP6
         mg6Bn5G0LwYINoZ8KQ+5dlvtbdkQQ8TwKBY72jcMAD6WtnZe3YqJ4b71a6S9TSl/SbuN
         cRg4Ri/ehkUracMnF4RMPTPAVV8hkXdVHpFYp+7IgMv4WDTVucdcuvL6a7yjyl+4Wcld
         sKSw==
X-Gm-Message-State: AOJu0YyuxpFXCisJ/NnDJZzWdy9jQCbEbaHAT6neXGlj8zlQegg6/E7X
	r2Nr6ZUX/iBpu/m7bNwTQMJ8xQ==
X-Google-Smtp-Source: AGHT+IH9uE0kFetV0w0R6EKXS4SOYT/kfgC5SWiE3cSPeQAb9GdRshpM1twXSmGc4zg3gIC8XAqDeQ==
X-Received: by 2002:a05:6602:24c9:b0:7b7:5eeb:615e with SMTP id h9-20020a05660224c900b007b75eeb615emr19879747ioe.6.1703146152450;
        Thu, 21 Dec 2023 00:09:12 -0800 (PST)
Message-ID: <0d08a014-cdf5-4b4f-a683-171ae4c8b6e0@daynix.com>
Date: Thu, 21 Dec 2023 17:09:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/11] virtio-gpu: Handle resource blob commands
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
 <20231219075320.165227-8-ray.huang@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231219075320.165227-8-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/12/19 16:53, Huang Rui wrote:
> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> 
> Support BLOB resources creation, mapping and unmapping by calling the
> new stable virglrenderer 0.10 interface. Only enabled when available and
> via the blob config. E.g. -device virtio-vga-gl,blob=true

I have another concern about delaying virgl_renderer_resource_unref() 
until the resource gets unmapped; the guest will expect the resource ID 
will be available for a new resource immediately after 
VIRTIO_GPU_CMD_RESOURCE_UNREF, but it will break the assumption and may 
corrupt things.

