Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E127D0423
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 23:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619588.964923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtamI-0007QM-N6; Thu, 19 Oct 2023 21:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619588.964923; Thu, 19 Oct 2023 21:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtamI-0007Nu-Jf; Thu, 19 Oct 2023 21:42:02 +0000
Received: by outflank-mailman (input) for mailman id 619588;
 Thu, 19 Oct 2023 21:42:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UmqE=GB=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qtamH-0007No-DO
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 21:42:01 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 555c6330-6ec8-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 23:42:00 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40838915cecso1113265e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Oct 2023 14:42:00 -0700 (PDT)
Received: from [192.168.69.115] (176-131-216-177.abo.bbox.fr.
 [176.131.216.177]) by smtp.gmail.com with ESMTPSA id
 n15-20020a7bcbcf000000b004060f0a0fdbsm5331241wmi.41.2023.10.19.14.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 14:41:59 -0700 (PDT)
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
X-Inumbo-ID: 555c6330-6ec8-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697751719; x=1698356519; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJaGa6xJu/JHhh5O53jFh8ALYoJ2QIrqMEDbhV9uQG8=;
        b=NJcqELj9aT2UppnasP1kwejV2qyo7m13Sl4ltg/dwi5wCqfERtaSd7+PtoTC8xRRX4
         Cc1N5iY4wrH6W6wR1MJGe4zzE0j1bvT7dBi5Fd5YoyLrVvUl4Rz6L+O8ij22HDL6UsN3
         0U81jzIXpEgCLrIw95eEqq84vtmrdPqdSCdGKdHjzannrsISd9ZIAdo2r2hkukDi5Lth
         wmFfH4TqkY7EB0Hv/knqLSORAWn0bc32dLLqrVi/x89hokePtYxgFKCf64RgcPXyWhJl
         ISGBIekEPbXii9fOOuQC6uYSTz9HmreD3szImDd/5mbcnYlvMvys053MNaeM4dwIi36V
         t2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697751719; x=1698356519;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJaGa6xJu/JHhh5O53jFh8ALYoJ2QIrqMEDbhV9uQG8=;
        b=Cq4VWMAsAm5VwDPf4qScgOgJkRuGZga+LJ8dCDLpVW5SXyubpMu7d+Ar4bcHo1lnub
         XxqpVUXWEX5xkoizm2pDAdEumRKymQfAzApi+AJPqqHdx1+HV5NEOqVOAa3dG+KOaMiP
         3vptp/f4ix1RublXXOqNd7BtoUWn2nPr8K/9NzB7m2kE4JIXB5xz9rlipTv0WkDDUD7t
         ZQSa1ssz9Gd2acfPM/YJ3lVecNrl8w91V5G2MlTHOtf0h/HduWNNFQrF2REQw3COB93o
         PS9COvJHGZ8YdXWf6X/Jf3Q2gUkA5lcbG3vFTwmdzBm5CkHGQqoAgCFyHzHdEFkj4yCn
         Z+ng==
X-Gm-Message-State: AOJu0YzND37GiSolT3q2zaagueXXRT+XCpX7hSond/2znzukjPlxwQTY
	D+gbKeMV3zmNubBpHBo7r5KHdA==
X-Google-Smtp-Source: AGHT+IHEpSb8qMFYR/UNiwgXEvUWR6SZOmri7Z/lqFEqynWCIvvjYl1tIO0mfDodPRspcpTnTik5Bg==
X-Received: by 2002:a05:600c:1f83:b0:404:fc52:a3c6 with SMTP id je3-20020a05600c1f8300b00404fc52a3c6mr78062wmb.25.1697751719502;
        Thu, 19 Oct 2023 14:41:59 -0700 (PDT)
Message-ID: <1562189c-2aab-993d-2240-304cabe6f62a@linaro.org>
Date: Thu, 19 Oct 2023 23:41:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] ui/input: Constify QemuInputHandler structure
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-ppc@nongnu.org,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20231017131251.43708-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231017131251.43708-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/10/23 15:12, Philippe Mathieu-Daudé wrote:
> Access to QemuInputHandlerState::handler are read-only.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/virtio/virtio-input.h | 2 +-
>   include/ui/input.h               | 2 +-
>   chardev/msmouse.c                | 2 +-
>   chardev/wctablet.c               | 2 +-
>   hw/char/escc.c                   | 2 +-
>   hw/display/xenfb.c               | 6 +++---
>   hw/input/adb-kbd.c               | 2 +-
>   hw/input/hid.c                   | 6 +++---
>   hw/input/ps2.c                   | 4 ++--
>   hw/input/virtio-input-hid.c      | 8 ++++----
>   ui/input-legacy.c                | 2 +-
>   ui/input.c                       | 4 ++--
>   ui/vdagent.c                     | 2 +-
>   13 files changed, 22 insertions(+), 22 deletions(-)

Patch queued to hw-misc.

