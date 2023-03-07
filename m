Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA8C6AE198
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:05:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507424.780892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXw5-00085c-Rz; Tue, 07 Mar 2023 14:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507424.780892; Tue, 07 Mar 2023 14:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXw5-00083s-OW; Tue, 07 Mar 2023 14:05:01 +0000
Received: by outflank-mailman (input) for mailman id 507424;
 Tue, 07 Mar 2023 14:05:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZXw4-0007z2-7v
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:05:00 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c267c3c-bcf1-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 15:04:59 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso10467809wmi.4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 06:04:59 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c359000b003e209b45f6bsm18816506wmq.29.2023.03.07.06.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:04:58 -0800 (PST)
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
X-Inumbo-ID: 0c267c3c-bcf1-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678197899;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zCR+/N3JyI+Rqvibb9E6aDk11EXgY7qQNvMvTlCWGys=;
        b=ZT1+yqNLKF4tCXDwhfbe6ei5KUOCnCYN6paoXOyafFTh/s98Usj8fCHKAiTBHWRL0U
         HAOkYv5emKWiAF/l0JdSuhg8/oR+35GjDNG/edIWC6ub/G1ei1+p6UbamjLvkW2CES3L
         TbSKnHA5R/hX/ErtxLj//ZLblQVyGZJCpOX2fdCEt9W46lPShQO7EvX4XWtclVlfVIrx
         n/2uC1tD/g+mQaXEw8bNgX7MdOjend3MWNmFjiiLGOgS8j4MH4QQ3QrfBXLfgCIiuWa0
         MU78kOiwKm3UYnATJd9WOatuMaLfgEDu4is4PiZm9SMet+Q/uqAO8eWKkklvdFHah+RF
         sCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678197899;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCR+/N3JyI+Rqvibb9E6aDk11EXgY7qQNvMvTlCWGys=;
        b=bKS/Jmk9pvqaR8u40w8KpcbYDcn8ZYQ2wBdQj27jy4tRfGiYR85h1HjZp6BaCLliLZ
         NE2al1m8Xjnue/ERy89gzT4SaCV+PUPpmMNKpFXC9ku33i+nK1U061BOxBuA4+DVfKZk
         VKHouNXp84NR9Ibyrlznn3xzVjMGZ3o+OSlp/lJJ2cfJV4bA9+we6jtHq1+kjJhvFzmn
         59JLymHdgetyqIIDS64U6/K8RsARtbl3m8+tQFY1rRk/mpdCNMLYqcPrRzCs5Sx5al6r
         W8rsNGb8VUeyu7dsO+yoY/zXSv4X4kQkZHnMv10R4luG+fQ8mM/RpY1ySOvT9sUVFX4w
         Ti2g==
X-Gm-Message-State: AO0yUKV4K5G64S11HZpeznZ7mbyRlBYB3kTAUcBGncmYuLSQ2N79N4id
	5+BGCSI1T6YLfSRMFovtgu0=
X-Google-Smtp-Source: AK7set+JQIL0mryS1clp30PdlBA8ugHIKdAQwBeb8lXItjElggkk+mBYVgbh9t3cvK566shmRyn1mw==
X-Received: by 2002:a05:600c:4997:b0:3eb:9822:28f7 with SMTP id h23-20020a05600c499700b003eb982228f7mr9878373wmp.9.1678197899227;
        Tue, 07 Mar 2023 06:04:59 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <abd65d3c-0b2d-7f90-b5f1-3a26d56bc6c4@xen.org>
Date: Tue, 7 Mar 2023 14:04:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 09/25] hw/xen: Add evtchn operations to allow
 redirection to internal emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-10-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-10-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The existing implementation calling into the real libxenevtchn moves to
> a new file hw/xen/xen-operations.c, and is called via a function table
> which in a subsequent commit will also be able to invoke the emulated
> event channel support.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
>   hw/9pfs/xen-9p-backend.c            |  24 +++---
>   hw/i386/xen/xen-hvm.c               |  27 ++++---
>   hw/xen/meson.build                  |   1 +
>   hw/xen/xen-bus.c                    |  22 +++---
>   hw/xen/xen-legacy-backend.c         |   8 +-
>   hw/xen/xen-operations.c             |  71 +++++++++++++++++
>   hw/xen/xen_pvdev.c                  |  12 +--
>   include/hw/xen/xen-bus.h            |   1 +
>   include/hw/xen/xen-legacy-backend.h |   1 +
>   include/hw/xen/xen_backend_ops.h    | 118 ++++++++++++++++++++++++++++
>   include/hw/xen/xen_common.h         |  12 ---
>   include/hw/xen/xen_pvdev.h          |   1 +
>   softmmu/globals.c                   |   1 +
>   13 files changed, 242 insertions(+), 57 deletions(-)
>   create mode 100644 hw/xen/xen-operations.c
>   create mode 100644 include/hw/xen/xen_backend_ops.h
> 

Reviewed-by: Paul Durrant <paul@xen.org>


