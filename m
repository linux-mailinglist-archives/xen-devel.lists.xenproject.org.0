Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 531527EA2B8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 19:19:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631949.985736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bWh-0005iW-8B; Mon, 13 Nov 2023 18:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631949.985736; Mon, 13 Nov 2023 18:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bWh-0005f9-5X; Mon, 13 Nov 2023 18:19:11 +0000
Received: by outflank-mailman (input) for mailman id 631949;
 Mon, 13 Nov 2023 18:19:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZgi=G2=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1r2bWg-0005f3-58
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 18:19:10 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 224fe3a1-8251-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 19:19:08 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1cc68c1fac2so42042205ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 10:19:08 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 ju10-20020a170903428a00b001c59f23a3fesm4142792plb.251.2023.11.13.10.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 10:19:06 -0800 (PST)
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
X-Inumbo-ID: 224fe3a1-8251-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699899547; x=1700504347; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umxmIrkbAOLmL1DmXXbJI6TnuJLS61wFseCU5AQMMlE=;
        b=V9InGtcjSENnhfhpCt4ShKf7O1gX20Ejdv0NSpYlsZ+fDEq2RT7o3vE+KkxZstjMzh
         kLiRkfvqprMLp1BqxM93G2btKeQsSQzYQ23tsOa+FVwqwiqknsjuSImjPc/R4Lx/CH23
         2C76gevqDHaxonu1FdownO/9qWJtd0dutZwey1N2pcGDQBgz1952vK6oAkDIYBO93Rrq
         lmbF7OMIiPpf1gtS7U7iwgYM8eGwxtXpUoyNpFBHGoEfanl2hndMGXoAw+oeLlBryWlA
         omz9AvngFH316SbdYYkFhX5+Olsfxi6XkeO/vzi1yZofw+f7GjX8Du6raeLUWRBYTJRJ
         UXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899547; x=1700504347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umxmIrkbAOLmL1DmXXbJI6TnuJLS61wFseCU5AQMMlE=;
        b=iEAJ7PtmrsYVpDa0GoAfd0OEJex3JUYjBSpmKskfHpvL6R1KPOXrIKJd6Va3GqIgi1
         me9EWsEFXumfAHJKfne2P9OTyRYeqWx4CMJElAtJ9UU52wIgqoCWtJXRJ2JIPQyPNl4z
         Pwe4JkseXz3E/IvH+ZCseCJ109OugT/iU5XQtqVn/beu1f25BePhbSD6iDmQlKoZnuFr
         q9bkW2LFE4+R7AkYhUTUDdycnVzpaMr7lBC1qJ/8TG9Y6qEjHVt5ROcFj2HIUjAtUJgk
         a225SzYV8v3EI17qru+uupVGaM9h0+f93FOOl9Zd2fp1i+lZH3+IRVk0ogsM8iilNbDU
         wiYw==
X-Gm-Message-State: AOJu0YwR0K/RC0e8hL0oHmzxvbmePO4rskLjvLY603aVJcUqPG/XkeBF
	Mv92hLu7SogDIA/5fCOeg1LsUQ==
X-Google-Smtp-Source: AGHT+IGg248TCR5/kb/i5Pi6wxhtajoY/akEWVclfGdoBcuPjMW4q7qpmailfQkpV0PQqKGOfBIpTg==
X-Received: by 2002:a17:902:e88e:b0:1c2:1068:1f4f with SMTP id w14-20020a170902e88e00b001c210681f4fmr423529plg.17.1699899546984;
        Mon, 13 Nov 2023 10:19:06 -0800 (PST)
Message-ID: <a6333482-93f5-4ff6-826a-c1564e89c796@linaro.org>
Date: Mon, 13 Nov 2023 10:19:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 06/10] hw/xen: Reduce inclusion of 'cpu.h' to
 target-specific sources
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
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231113152114.47916-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/23 07:21, Philippe Mathieu-Daudé wrote:
> We rarely need to include "cpu.h" in headers. Including it
> 'taint' headers to be target-specific. Here only the i386/arm
> implementations requires "cpu.h", so include it there and
> remove from the "hw/xen/xen-hvm-common.h" *common* header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/xen/xen-hvm-common.h | 1 -
>   hw/arm/xen_arm.c                | 1 +
>   hw/i386/xen/xen-hvm.c           | 1 +
>   3 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

