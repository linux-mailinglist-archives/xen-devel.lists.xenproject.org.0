Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431CF74109E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 14:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556462.869020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qETpF-0007Ir-ND; Wed, 28 Jun 2023 11:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556462.869020; Wed, 28 Jun 2023 11:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qETpF-0007G5-KL; Wed, 28 Jun 2023 11:59:09 +0000
Received: by outflank-mailman (input) for mailman id 556462;
 Wed, 28 Jun 2023 11:59:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEAO=CQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qETpD-0007Fx-Ay
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 11:59:07 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c835b76-15ab-11ee-8611-37d641c3527e;
 Wed, 28 Jun 2023 13:59:02 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-313f58d6652so3120155f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jun 2023 04:59:03 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.207.229])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm6513263wrx.59.2023.06.28.04.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jun 2023 04:59:01 -0700 (PDT)
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
X-Inumbo-ID: 2c835b76-15ab-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687953542; x=1690545542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XAnNOBqj7/aZOLa/iEWVdgiwRfPn+uBhlnTFYDZDHtw=;
        b=XE7Vi2wrCeeILyk3U/eN0QEw2vyalWxVrmJf4lD0tUb7oMCiVJf8wS7IHVCfWF1ljm
         UcYgRcV+vj/TBd9upybrGu2ZGnWQcYk115AdgEaWs35KGlrLBhcqG0BEhTcU7YjZck4e
         hZnPymWrPJt5bpB6buQ8HEi1nwHGrrdsvvsmSmYanpPr8vBk4Iw+l38CFXHwaRUuBcEw
         oO5si+rS6KwqffIjHKgUWwn6ziExQo+Lxfh6bCrhbutF0UwXkHqNHNbT49sTTF/BwM5b
         xVXU+6JUZHdDPEpQFm8vio/70Zk337UqTeAm/3QQDEKOChBQNaN3tDnqXgvim7JECTXh
         ovwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687953542; x=1690545542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAnNOBqj7/aZOLa/iEWVdgiwRfPn+uBhlnTFYDZDHtw=;
        b=ceGpitmQWmV6lMTsGNaKIsAMF+sZtIZzlFx+iAaX84rEM47C4WX0w0p+7HYKmvx9Ph
         CDUjb6YKn6Vft2pSDn82sVsMfwG5oLxTc3jBlCoegrDWqXYtq1vB/nimBGC42MwPLJr8
         wNUE9qGREB5sOa/TSyZE0PQQackXzokcBHK9koaFlZ3/KQeeHhHJvurtTOovGyx2dVzz
         UtX0XuHosLjHVP1oAvCSir9XY/bcfGLsm0YolhbCNBr37IrtfKz5YucGp5RpnzTk0ZmO
         iFlH9xAn1mq72Gy7Au2ZOeiNn1LUL9ol4PM/R7Xf0RhM2OmkMuIAYvp3EWFmKcGzEyaQ
         V1ng==
X-Gm-Message-State: AC+VfDxKaXPuxhsgpkKIVU12z4DtfJGQAiIBwMgsCwUCkxBYVzYvMnCB
	4pcMPyFGttSIKOiXX9ueCGGhLQ==
X-Google-Smtp-Source: ACHHUZ5EJieVTJ0ylfA8kzbRNwsOjUJqO0iacg3Gk1TjS5ordwDft3hLui2kj4QeSRA9jXw9Lp4yWQ==
X-Received: by 2002:a05:6000:1b81:b0:313:f957:fc0c with SMTP id r1-20020a0560001b8100b00313f957fc0cmr5011317wru.47.1687953542430;
        Wed, 28 Jun 2023 04:59:02 -0700 (PDT)
Message-ID: <19821e47-0ea0-ca79-2c1c-3f663c9921f7@linaro.org>
Date: Wed, 28 Jun 2023 13:58:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 00/16] accel: Share CPUState accel context
 (HAX/NVMM/WHPX/HVF)
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, xen-devel@lists.xenproject.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paul Durrant <paul@xen.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230624174121.11508-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230624174121.11508-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/6/23 19:41, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (16):
>    MAINTAINERS: Update Roman Bolshakov email address
>    accel: Document generic accelerator headers
>    accel: Remove unused hThread variable on TCG/WHPX
>    accel: Fix a leak on Windows HAX
>    accel: Destroy HAX vCPU threads once done
>    accel: Rename 'hax_vcpu' as 'accel' in CPUState
>    accel: Rename HAX 'struct hax_vcpu_state' -> AccelCPUState
>    accel: Move HAX hThread to accelerator context
>    accel: Remove NVMM unreachable error path
>    accel: Rename NVMM 'struct qemu_vcpu' -> AccelCPUState
>    accel: Inline NVMM get_qemu_vcpu()
>    accel: Remove WHPX unreachable error path
>    accel: Rename WHPX 'struct whpx_vcpu' -> AccelCPUState
>    accel: Inline WHPX get_whpx_vcpu()
>    accel: Rename 'cpu_state' -> 'cs'
>    accel: Rename HVF 'struct hvf_vcpu_state' -> AccelCPUState

Series queued.

