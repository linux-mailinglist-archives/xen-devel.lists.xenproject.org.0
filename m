Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE697811A54
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 18:01:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654131.1020848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDSbW-0003Xp-U1; Wed, 13 Dec 2023 17:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654131.1020848; Wed, 13 Dec 2023 17:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDSbW-0003VN-Qv; Wed, 13 Dec 2023 17:01:02 +0000
Received: by outflank-mailman (input) for mailman id 654131;
 Wed, 13 Dec 2023 17:01:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8RNx=HY=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rDSbV-0003VH-4p
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 17:01:01 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30b056f8-99d9-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 18:01:00 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a1c7d8f89a5so952320766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 09:01:00 -0800 (PST)
Received: from [192.168.79.175] ([93.23.251.22])
 by smtp.gmail.com with ESMTPSA id
 ty6-20020a170907c70600b00a1d71c57cb1sm8132013ejc.68.2023.12.13.09.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 09:00:59 -0800 (PST)
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
X-Inumbo-ID: 30b056f8-99d9-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702486859; x=1703091659; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nPqK7GrcYmtiH3v3w3JzWW1DxNdjq8IQMp3DUklVk6o=;
        b=yfhEzuCHX0W9klquQR6TD75HOF3GroHEqEUtUlM+oTrA2ggJnhrBEuGxK0bIGi3jgI
         l8BGGGKMajgwTpXbXzoWVOStNgbjXac6pwBzCQ69TwaLxjNTXDWHuzcGDK6EArbZ81Q+
         Qb/SnwqEctxPvDQW/K5IO4dPBpHQZDax9TuqWr+ZSubPd53lVEIVU42e3dzkKVCCKtjw
         06H3BaZX+UDBkEDml7QD23jfLYRbJOyvLVa+d6Qy/MVBc2xhywGEhC/rdj/H4FNB3rhq
         Qm1qoPyO7VecYExq9txHpCFFrf8Dq4jReneCE/ydc35jcbXh7RXXz7T/LtDbUIXAg/yZ
         /edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702486859; x=1703091659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPqK7GrcYmtiH3v3w3JzWW1DxNdjq8IQMp3DUklVk6o=;
        b=C1JQOU5uoE1c/JGgSvBifrOl2fm5pY08UsPqBA7B/oG8ZNzL+AAD/M0XxYn/OlFU0o
         vwH/qTrDTAAjv7XsxzYB9Xpjv0eNrOkUTx3WZYKq5l6PfsEKk2jBgAYyqKo0OelYcg+s
         tgJye4AYHFpN+4bQ4Pt8iXV1qSaHiY7wK3MG5CF4SvxbjNMkyYBqbLaDvGkxGcYLmTyN
         zYQkRwUXu0k0OQ8AzT15055TLFND5cj1Cmusu7NBWFKZcdFohr7/NrvNQK9Pr8myzhlC
         Nvzyas8fwKG4I5lRaDDifR7DIMevchygRLOzq6w3ZKYh+uEMwKBq0ZDRXDjVSsYFCYeK
         dKtQ==
X-Gm-Message-State: AOJu0YxDUFSEC0DzNUzfFRBaB7vpJhCRHhLBDxefpCz/XM/0vqa9CaEC
	9I/6Z/I/Y0MkGC9mzzcj3Qv93A==
X-Google-Smtp-Source: AGHT+IGj0/KfsnmAFEqNG09uIgYWHMOTbaAWPiuoDfWlwAc+xnbcj8ZLgR9m5a7rGgg3UbFVjYS2Og==
X-Received: by 2002:a17:907:20b4:b0:a1d:f19c:ab1e with SMTP id pw20-20020a17090720b400b00a1df19cab1emr5069227ejb.100.1702486859552;
        Wed, 13 Dec 2023 09:00:59 -0800 (PST)
Message-ID: <0064f684-793e-4954-90cf-d39c21385a43@linaro.org>
Date: Wed, 13 Dec 2023 18:00:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.0 0/9] hw/xen: Have ARM targets use common
 xen_memory_listener
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231114163123.74888-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

ping?

On 14/11/23 17:31, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> While looking at Xen target-specific code, I noticed some
> generic code used by x86 which is not implemented for ARM.
> 
> Maybe ARM machines don't need it, I don't know. But I
> wanted to see if I can get this common code target agnostic
> and build it once, possibly bringing smth useful to ARM.
> 
> The changes don't break CI testing and Avocado local tests.
> If this xen_memory_listener feature isn't required for ARM,
> I'll send follow up patch that keep this series with common
> xen_memory_listener but with a runtime flag to disable.
> 
> Patches do the usual "change target-specific API to a
> target-agnostic one", in particular using "exec/target_page.h"
> at runtime. Then non-x86 code is extracted, then merged to
> the generic xen/xen-hvm-common.c.
> 
> Thoughts?
> 
> Regards,
> 
> Phil.
> 
> Based-on: <20231114143816.71079-1-philmd@linaro.org>


