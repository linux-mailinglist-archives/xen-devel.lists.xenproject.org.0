Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A3C73A79A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 19:48:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553903.864754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOPQ-00023h-S7; Thu, 22 Jun 2023 17:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553903.864754; Thu, 22 Jun 2023 17:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOPQ-00021D-Og; Thu, 22 Jun 2023 17:47:52 +0000
Received: by outflank-mailman (input) for mailman id 553903;
 Thu, 22 Jun 2023 17:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3b9O=CK=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1qCOPO-0001wI-OQ
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 17:47:50 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e740fefc-1124-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 19:47:49 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f86d8a8fd4so7685084e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 10:47:49 -0700 (PDT)
Received: from [192.168.157.227] ([91.223.100.47])
 by smtp.gmail.com with ESMTPSA id
 x24-20020ac25dd8000000b004f84b36a24fsm1179173lfq.51.2023.06.22.10.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 10:47:48 -0700 (PDT)
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
X-Inumbo-ID: e740fefc-1124-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687456069; x=1690048069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CA2JjQ8/OleI6z0qNtxgxu5zyvvw1MZeyIYD2fCQD3I=;
        b=Woxpb7WYR4FvOn5NOxMo42gcotnVmBXbNOaTEK784GMQg+He54w6TFwrLdYPT0bEdn
         9ZKkMM/hG3Mk2TOVQrKcTvXUZu5ZgixwDMwBHwNiAydolumiVmFo2RKYOYR1Dx1A90lt
         Xce7H9QAz1xzbY+ZlchmtggODp6W3O9g4x5uk6/NbI7Vc/iJfcRXuBttmX2lBQSmWNrX
         adAR2Z1B2IFRfGtQiK7ZGG6nBAT7WiP58lyLTxjV/BZ3g4+SEowVSx6RepdoKm7jjbw9
         x2OQNQXlO+iv3T303ZMBmKGi/QaLOYNaHfOC3vRTynsIoXC2E9njPdaJcZ4CY+ZvB1Se
         s8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687456069; x=1690048069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CA2JjQ8/OleI6z0qNtxgxu5zyvvw1MZeyIYD2fCQD3I=;
        b=ZUy5RRj+6lCFxQKAIC+oV23dpRN+h611pAcYzLqy+n4pZ2S2CL4ITXjw6yJnXRsEc5
         p9GSgDUvytwZx4Y21jy1Jzz1FIRy3yfnc37mUz0aV9olxC+hCyuJ/dgVcAvJreP5W2F2
         FmfuvV0RlAz7rfTWfey5jmudScMjBuVCYmh2sg6YGdLP49i+DQ5XlynFqKJOWMypWwfl
         iTXw+zSo77+Q9868Oq40AzL4MUXWDWfbu476RBUYZ8pLDJEDMDhGg/1i+3q5ZpsuhYYA
         4r3f41eQpHnEzLOW/C/5xD5vzpsNGgY+kQS1hf/cRDAY+SqBKxgbK0x7Udoo3yYQZj2z
         dg3g==
X-Gm-Message-State: AC+VfDzjsk2xzSGee7xwtN7gHAWRDPeZOueQ73EzHQSfAwxL8Z1rLNFd
	pc3HEiifAlpC85lp6wv5LJg1Tw==
X-Google-Smtp-Source: ACHHUZ70krz16gmVF54iWhD+K94iRIEs8ZK4yutx0YkjOW53miT7yXbm7wIhwHFKhqthG2rHfxqvaA==
X-Received: by 2002:a05:6512:3ba7:b0:4f9:6221:8fb7 with SMTP id g39-20020a0565123ba700b004f962218fb7mr2907515lfv.11.1687456068808;
        Thu, 22 Jun 2023 10:47:48 -0700 (PDT)
Message-ID: <32335eb2-a766-dc4e-afd0-09ce62cf7fb2@linaro.org>
Date: Thu, 22 Jun 2023 19:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 09/16] accel: Remove NVMM unreachable error path
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
 <20230622160823.71851-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230622160823.71851-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/22/23 18:08, Philippe Mathieu-Daudé wrote:
> g_malloc0() can not fail. Remove the unreachable error path.
> 
> https://developer-old.gnome.org/glib/stable/glib-Memory-Allocation.html#glib-Memory-Allocation.description
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/nvmm/nvmm-all.c | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

