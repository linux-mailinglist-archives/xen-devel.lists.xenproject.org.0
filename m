Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844D773A795
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 19:47:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553898.864744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOOQ-0001Wx-IS; Thu, 22 Jun 2023 17:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553898.864744; Thu, 22 Jun 2023 17:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOOQ-0001UQ-FK; Thu, 22 Jun 2023 17:46:50 +0000
Received: by outflank-mailman (input) for mailman id 553898;
 Thu, 22 Jun 2023 17:46:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3b9O=CK=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1qCOOO-0001UK-Jq
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 17:46:48 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2ad9f80-1124-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 19:46:47 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f7677a94d1so10378786e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 10:46:47 -0700 (PDT)
Received: from [192.168.157.227] ([91.223.100.47])
 by smtp.gmail.com with ESMTPSA id
 h23-20020ac25977000000b004f874e12e72sm1198114lfp.224.2023.06.22.10.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 10:46:46 -0700 (PDT)
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
X-Inumbo-ID: c2ad9f80-1124-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687456007; x=1690048007;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9a7YoYe3T0MbLBO0L7+zRiLRSaGbDua3R68SVuQkUE=;
        b=S3aJfe8OPD1b3iOHso9gShg+orahkCpBFmblOyHZjOMtfsC9rAS4LohByD3rLonWoE
         evq7uhrMz4t/6OGegMF1W2itotOgLRl27ovwraKfI7Ysiyht7S5BcZLMoBYnV/Jw16XA
         RHWoykN+6S8jp3lN6clSZc2jOJeleeQJMv3bbDs/LwzKaddO9YOneCTMKO/FPxwioUlb
         UCTyeKcuQuR9Fn98+Z4JJvz/OGRnUXY32TnqjJNcu8bmZyLxuQxi0IUPExbQx/HsQwkh
         b9CDB45a87awo/swZ8Gz2lkB+qFhv0XGbCPFnTcMsnmzlJD5yWcejihYecJKQ3KSmaRA
         VMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687456007; x=1690048007;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9a7YoYe3T0MbLBO0L7+zRiLRSaGbDua3R68SVuQkUE=;
        b=c2UMjtJj6RWxP94rxlSQzsUg/lZUOZP6mXfVvSI4G/DF8nbO6ZJH7R0E1VvYsQU7CL
         /ZucaM68CIKxK0nzeMuHJ3WNi835v39adtZ2P0tyXn/kd/THOYXUYzqZoNItP/TWpoo/
         FCSP67QLjj9lPpPYnIiEZNP4rPEJWg+EpZYLXwfKqxFIIIIUCZgRUrfTtXA7/H6ukSxQ
         dwoxOSYTWl9pH6KR1gF0WD+NrwMRB6NoqF6XzPb8I1jUP2FBZtGK0cVHkxAnNqZ8HnOD
         +QmgAVRLC1BZwhyV7t20DbabZmAUsOfcz9dWAIoFHuvTZHNw4R0Nnsdqf0KKSl19LtQF
         jRMw==
X-Gm-Message-State: AC+VfDzosx/x5mi0de4Vlk1tFBgcXOd2345af0PNkf4m0Ib8uOJ7iOHr
	/c7ewhDI3S5JuW9YfVBK0eWqlQ==
X-Google-Smtp-Source: ACHHUZ5haGO8m6yiOqgmROBAyNlMVacxQPLIXMYcwaQC+7P/x0bXWpeMMk4iIZ27Jh55lZjOPBtZAQ==
X-Received: by 2002:a05:6512:3b12:b0:4f9:5d2a:e0ee with SMTP id f18-20020a0565123b1200b004f95d2ae0eemr4589292lfv.16.1687456007327;
        Thu, 22 Jun 2023 10:46:47 -0700 (PDT)
Message-ID: <2c0a97af-be7e-6d83-5176-ef9980c2faf0@linaro.org>
Date: Thu, 22 Jun 2023 19:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 07/16] accel: Rename HAX 'struct hax_vcpu_state' ->
 AccelCPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Roman Bolshakov <rbolshakov@ddn.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 xen-devel@lists.xenproject.org, Eduardo Habkost <eduardo@habkost.net>,
 Cameron Esfahani <dirty@apple.com>
References: <20230622160823.71851-1-philmd@linaro.org>
 <20230622160823.71851-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230622160823.71851-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/22/23 18:08, Philippe Mathieu-Daudé wrote:
> |+ struct AccelvCPUState *accel;|
...
> +typedef struct AccelCPUState {
>      hax_fd fd;
>      int vcpu_id;
>      struct hax_tunnel *tunnel;
>      unsigned char *iobuf;
> -};
> +} hax_vcpu_state;


Discussed face to face, but for the record:

Put the typedef in qemu/typedefs.h, so that we can use it immediately in core/cpu.h and 
not need to re-declare it in each accelerator.

Drop hax_vcpu_state typedef and just use AccelCPUState (since you have to change all of 
those lines anyway.  Which will eventually allow

> +++ b/target/i386/whpx/whpx-all.c
> @@ -2258,7 +2258,7 @@ int whpx_init_vcpu(CPUState *cpu)
>  
>      vcpu->interruptable = true;
>      cpu->vcpu_dirty = true;
> -    cpu->accel = (struct hax_vcpu_state *)vcpu;
> +    cpu->accel = (struct AccelCPUState *)vcpu;

this cast to go away.


r~

