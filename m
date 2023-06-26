Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8167A73DC0B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 12:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555423.867174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDjAl-0006Lt-9B; Mon, 26 Jun 2023 10:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555423.867174; Mon, 26 Jun 2023 10:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDjAl-0006J5-6C; Mon, 26 Jun 2023 10:10:15 +0000
Received: by outflank-mailman (input) for mailman id 555423;
 Mon, 26 Jun 2023 10:10:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pguY=CO=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1qDjAj-0005SQ-H3
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 10:10:13 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3218cc5-1409-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 12:10:11 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f867700f36so4010414e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 03:10:12 -0700 (PDT)
Received: from [192.168.157.227] (141.pool92-176-132.dynamic.orange.es.
 [92.176.132.141]) by smtp.gmail.com with ESMTPSA id
 j19-20020a5d4533000000b0030fafcbbd33sm6833820wra.50.2023.06.26.03.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 03:10:10 -0700 (PDT)
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
X-Inumbo-ID: a3218cc5-1409-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687774211; x=1690366211;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=74FM579RKOmTf3FtTjRf/xU5EA/KuNtZjlzUaBEQ9kQ=;
        b=S8VAOmGaHb+ynWL6PZdVTf20DDVl7Z0It/rfFFEA3rSrWW+j7oWDON4RLsGfkPpCqg
         5K6cTpsgQ/ww7o9lKt0rscznpi0y3ON8sIMjAotM5fWDSWqhA2sWG/QGwe6xuOPyTbgu
         TYNlDvI/QyqlbLGhnBaJ/x1CdnyNNWscnSzCSnH3cVi1dvHW9i/qn8ytvt5RZg2BcSxY
         JAqOG8lDnR76XNPVCf8bQuQBr0C1oux9e3zeBHuaJ35patRNb5yVtEzDD4NinVJuEZ09
         w5m4X5x6pIzlQvYSzuUAYIMRreEMGvvUVLY1IEIXa36eyW8RjH0UxtomgZPp9sG1XXId
         Bm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687774211; x=1690366211;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=74FM579RKOmTf3FtTjRf/xU5EA/KuNtZjlzUaBEQ9kQ=;
        b=bS/ushDLHULNYqoIBRrBoBbmSCtUZ+WyWvzvs6+8IMQpvNKtQbCOVrTK0nWOLEQrPs
         6gV6YQeMtZNf8flfVra0ucpzC4cNhNPIW+ZUUBUOq4xDKC8Fq2+8w4BwI6V+jU1Y4ZcI
         wp3OORh5ZuA9hZ35DNYIqph9QWcOmDwsEAqFf0vgq38UzTJiOYb797G/jCadkvCweN1Z
         IQW5FhNH9ffrQjk2FaOQY1vVHkukBYFWSFQy1gXmxDsHgdZY6OZb6iWaLZvChlwu2xqi
         ZVBfICvWOEyvH38nwJOlE/zdf/iL1dkc059axMzTayphEL9mIQaSAgws74TMpwfIdx6l
         5SOA==
X-Gm-Message-State: AC+VfDz7SiHO5Thd+I4ghly92YcQXV19WzObSEiavd2C5G92y1rKmNs6
	TJFm06Guehvicd6R65Sc1Oasqw==
X-Google-Smtp-Source: ACHHUZ6vqORSRxMfrjz7CD/A/+w802FrwEYPSRxttM5nM7zy+gOj9GIQg8wRk+pyySrD350QiwEj1A==
X-Received: by 2002:a19:7108:0:b0:4ef:f11c:f5b0 with SMTP id m8-20020a197108000000b004eff11cf5b0mr15203630lfc.54.1687774210741;
        Mon, 26 Jun 2023 03:10:10 -0700 (PDT)
Message-ID: <93dda239-00cb-3c5a-c7c2-6ade248e147b@linaro.org>
Date: Mon, 26 Jun 2023 12:10:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 07/16] accel: Rename HAX 'struct hax_vcpu_state' ->
 AccelCPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, xen-devel@lists.xenproject.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paul Durrant <paul@xen.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230624174121.11508-1-philmd@linaro.org>
 <20230624174121.11508-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230624174121.11508-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/24/23 19:41, Philippe Mathieu-Daudé wrote:
> We want all accelerators to share the same opaque pointer in
> CPUState. Start with the HAX context, renaming its forward
> declarated structure 'hax_vcpu_state' as 'AccelCPUState'.
> Document the CPUState field. Directly use the typedef.
> 
> Remove the amusing but now unnecessary casts in NVMM / WHPX.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/cpu.h         |  5 ++---
>   include/qemu/typedefs.h       |  1 +
>   target/i386/hax/hax-i386.h    |  9 +++++----
>   target/i386/hax/hax-all.c     | 16 ++++++++--------
>   target/i386/hax/hax-posix.c   |  4 ++--
>   target/i386/hax/hax-windows.c |  4 ++--
>   target/i386/nvmm/nvmm-all.c   |  2 +-
>   target/i386/whpx/whpx-all.c   |  2 +-
>   8 files changed, 22 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

