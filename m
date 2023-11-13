Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F627EA29C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 19:13:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631939.985705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bRB-0002GW-5g; Mon, 13 Nov 2023 18:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631939.985705; Mon, 13 Nov 2023 18:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bRB-0002E3-2P; Mon, 13 Nov 2023 18:13:29 +0000
Received: by outflank-mailman (input) for mailman id 631939;
 Mon, 13 Nov 2023 18:13:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZgi=G2=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1r2bR9-0001gT-Am
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 18:13:27 +0000
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [2607:f8b0:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56d74d25-8250-11ee-98db-6d05b1d4d9a1;
 Mon, 13 Nov 2023 19:13:26 +0100 (CET)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6ce2de8da87so2960380a34.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 10:13:26 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 it13-20020a056a00458d00b006b58af8aae3sm4092255pfb.77.2023.11.13.10.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 10:13:25 -0800 (PST)
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
X-Inumbo-ID: 56d74d25-8250-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699899205; x=1700504005; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47qdXCf7H17vKwnfJuoR9ApbQrhsQSNwWFz2iDtLcKY=;
        b=lDICJsTj9DE/GdAGdD7Y4OkWlax1+8XdAk+0RV53WsdFsCB1sBayNitmwsvJNfPlkL
         hRxyaXO633bogEkhon15tzAF2Os2LyIK9WvhXiXb9Gw2bmzv51CYxyVcv7cKloTsmKHA
         DHPJ7DOdN55WAFuNgYshZEmmuQ+dZMcVBt0wywZQvVoAE5jauT5BEQI1/qkmFt4T3RyD
         I4XGnazk00HIIjKaCyJTZFnS19dk6yWCiixHPB27YHJvYVOTcsnOE3IE6nzYB/ZgdDfW
         GAWaSp/VQqvuXuphx90pem1rUtegXBIdhGqHO8f9hIZBxMAlKcovL+ZqRM2fj3ywJdfp
         UfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899205; x=1700504005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47qdXCf7H17vKwnfJuoR9ApbQrhsQSNwWFz2iDtLcKY=;
        b=QLyYbi/oiHmz2mqAEuLkS9Pnxohl0sA4fWQwuFW/J2Ce+k1Gcdom3lgeOc5HVSm3Ir
         /Gy+STgZo0vTrPnZkOYJqrnSWy+7aMH2Ceru5Y9yBMLMLO5C7SLheqxdadLRURpeI4/B
         pG8L9UchYnQSUu6E1DN6t4jHhZObsIoqNNXj3P+MDjQgyWXx7MDjr6IDzNmyzJ4zQpbL
         ewhfO/k1oTbSIotWommYIan3ErXPBHswRJ/VhAbwm2MPer4GbEBKVcUTI0aA/FFtJToY
         rR+weROtJme/RlF7MSA3EmMDZq7BgLpEMHXfigOsfM7wnpc+ICYYJS4HdspxLko2RAdB
         QMRQ==
X-Gm-Message-State: AOJu0YzeB8dAzy0kMYqit7miI2B3NbEyDODJ3wGy9NhclZu5ocTYl0VL
	h2byOgf3nUeJwCCKvFadfMy4Rw==
X-Google-Smtp-Source: AGHT+IEMW24hoP1qxVuHtBZTWwzdY1wJIRvBdCxR4pcag8Dcp4IYaLDv8RiEja604eSuwTfs9vPIQA==
X-Received: by 2002:a05:6870:e40b:b0:1ef:f127:34fa with SMTP id n11-20020a056870e40b00b001eff12734famr8873450oag.57.1699899205660;
        Mon, 13 Nov 2023 10:13:25 -0800 (PST)
Message-ID: <b7d29ae2-2064-4e4d-8fd7-1a75af4cb4ad@linaro.org>
Date: Mon, 13 Nov 2023 10:13:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 03/10] hw/xen: Merge 'hw/xen/arch_hvm.h' in
 'hw/xen/xen-hvm-common.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231113152114.47916-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/23 07:21, Philippe Mathieu-Daudé wrote:
> We don't need a target-specific header for common target-specific
> prototypes. Declare xen_arch_handle_ioreq() and xen_arch_set_memory()
> in "hw/xen/xen-hvm-common.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/xen_arch_hvm.h   |  9 ---------
>   include/hw/i386/xen_arch_hvm.h  | 11 -----------
>   include/hw/xen/arch_hvm.h       |  5 -----
>   include/hw/xen/xen-hvm-common.h |  6 ++++++
>   hw/arm/xen_arm.c                |  1 -
>   hw/i386/xen/xen-hvm.c           |  1 -
>   hw/xen/xen-hvm-common.c         |  1 -
>   7 files changed, 6 insertions(+), 28 deletions(-)
>   delete mode 100644 include/hw/arm/xen_arch_hvm.h
>   delete mode 100644 include/hw/i386/xen_arch_hvm.h
>   delete mode 100644 include/hw/xen/arch_hvm.h
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

