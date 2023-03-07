Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D2D6AE2F3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:44:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507459.780981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYYF-0000dl-Sq; Tue, 07 Mar 2023 14:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507459.780981; Tue, 07 Mar 2023 14:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYYF-0000bV-PY; Tue, 07 Mar 2023 14:44:27 +0000
Received: by outflank-mailman (input) for mailman id 507459;
 Tue, 07 Mar 2023 14:44:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZYYD-0000bN-R8
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:44:25 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d6079ef-bcf6-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 15:44:24 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso10567832wmq.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 06:44:24 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003dc49e0132asm18819877wmo.1.2023.03.07.06.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:44:23 -0800 (PST)
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
X-Inumbo-ID: 8d6079ef-bcf6-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678200263;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1vpSbqsNRdvuEz3fFpUC5AJNPHlYHSh6keWZcRzex34=;
        b=QUJjvrSsP3R/DyVq3RYS8W+EkMZ7KQk1SXtKGOIgzYMaDkNiHvSEoEPURvwLYY545o
         NR62RAi2BLIShZGaR2zfjiEsqDmdSAzAgNxXEup5pRC9whG7dhaum65/0f3F1sFH12wn
         KoEJI1EM8RjybN0GakwSeSMmDQAKFDUJE8H7k7RxCXgrXE/ibyFSh3GZjN8AOUI/RVuf
         GNT9pMpF2xiIVHXDiJTiTayqafpcpY4i/BZ3uqgLEvfGDAQb685LIZ7IKB9BaXNRD/wh
         HZRusZSxork5eOOjtHNrL72AKAZ6lhxg4fVX4rCJnj1d/9wwNLMu/T8Fmp15tmFbzTLM
         gjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678200263;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vpSbqsNRdvuEz3fFpUC5AJNPHlYHSh6keWZcRzex34=;
        b=rRtSEP57K3CKYNr2YJ17IyIAa3v+tOwdxrjkSwlY3UxuerkxeBxnf4u3yMW/8OCTNG
         HES1TRh8SDgUCNtpt3WP8MRlYYKsUPfZvjc1dWvyPnDKTB/400iL1Y9hwN9x0SjWqwK+
         3wX7daXz/uibMVy8QwoR7aC9HGudGlSyIJknTIjtYxT7M4dzP+VwoHsk8yfRd+ilIZaf
         PYO5J7CNIttozCmxtwhGhZXmbeiW/Vq5nv/QKJ6hcyp6Ca+pqoIVHAix5sHLHD7xA6pY
         6RD+JsWvLFdb3hMQBqIUu/XWYJn5fPCoUILKRprtMpGMfC1m5KMsDrDajOhMVTED44m7
         eyaA==
X-Gm-Message-State: AO0yUKUWcbGvjOspkxyfSFnN/pnnoMNZREk2SCApXLoNZTA72VJZ8miX
	IqaMEDQGY2Jbe9WxOFaZMjs=
X-Google-Smtp-Source: AK7set/1x6a2eQiNZ8loKuPP8J1iGUxMdVAbiKgnuFwid8+qGYKokj4HfdyME5UUK8UpvrJC+yYJJg==
X-Received: by 2002:a05:600c:450d:b0:3d9:f769:2115 with SMTP id t13-20020a05600c450d00b003d9f7692115mr13555203wmo.26.1678200263423;
        Tue, 07 Mar 2023 06:44:23 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <71e68af5-1528-f5c3-221a-5166af9396c6@xen.org>
Date: Tue, 7 Mar 2023 14:44:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 13/25] hw/xen: Add xenstore operations to allow
 redirection to internal emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-14-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-14-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   accel/xen/xen-all.c                 |  11 +-
>   hw/char/xen_console.c               |   2 +-
>   hw/i386/kvm/xen_xenstore.c          |   3 -
>   hw/i386/kvm/xenstore_impl.h         |   8 +-
>   hw/xen/xen-bus-helper.c             |  62 +++----
>   hw/xen/xen-bus.c                    | 261 ++++------------------------
>   hw/xen/xen-legacy-backend.c         | 119 +++++++------
>   hw/xen/xen-operations.c             | 198 +++++++++++++++++++++
>   hw/xen/xen_devconfig.c              |   4 +-
>   hw/xen/xen_pt_graphics.c            |   1 -
>   hw/xen/xen_pvdev.c                  |  49 +-----
>   include/hw/xen/xen-bus-helper.h     |  26 +--
>   include/hw/xen/xen-bus.h            |  17 +-
>   include/hw/xen/xen-legacy-backend.h |   6 +-
>   include/hw/xen/xen_backend_ops.h    | 163 +++++++++++++++++
>   include/hw/xen/xen_common.h         |   1 -
>   include/hw/xen/xen_pvdev.h          |   2 +-
>   softmmu/globals.c                   |   1 +
>   18 files changed, 525 insertions(+), 409 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


