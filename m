Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A0CA24E64
	for <lists+xen-devel@lfdr.de>; Sun,  2 Feb 2025 14:50:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880354.1290428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teaMz-0002v2-JZ; Sun, 02 Feb 2025 13:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880354.1290428; Sun, 02 Feb 2025 13:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teaMz-0002tE-Go; Sun, 02 Feb 2025 13:50:41 +0000
Received: by outflank-mailman (input) for mailman id 880354;
 Sun, 02 Feb 2025 13:50:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=okHa=UZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1teaMx-0002t6-KS
 for xen-devel@lists.xenproject.org; Sun, 02 Feb 2025 13:50:39 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aecdd78e-e16c-11ef-99a4-01e77a169b0f;
 Sun, 02 Feb 2025 14:50:37 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa684b6d9c7so574255966b.2
 for <xen-devel@lists.xenproject.org>; Sun, 02 Feb 2025 05:50:37 -0800 (PST)
Received: from [10.101.4.108] ([89.207.171.161])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7b1asm583900866b.31.2025.02.02.05.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2025 05:50:36 -0800 (PST)
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
X-Inumbo-ID: aecdd78e-e16c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738504237; x=1739109037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdZjnAMbZPhGbyBa31/qXbMjW6hGCGvM/GX3JBWsh8k=;
        b=Fr51eJlFEXzXDibjnp4dcGvYaXja4qoP956Y/WxCFBsnFfWfYSRKjuk1qBS7S32+ww
         vlYhddCKcZoVu2xnfbHJ9Ip8lv49cUHjN31TmCqNX2dhJH1TIO+Mv2xIdq5x6n/Dp8Lo
         NnnTnACQtLJobvCvQBQKMtMnq6N8FbZ0ODW5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738504237; x=1739109037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdZjnAMbZPhGbyBa31/qXbMjW6hGCGvM/GX3JBWsh8k=;
        b=JZ656O2sr69PSrgN4eRqP7pYjuJn6XuOxHqhnQaRuQgjdtUDlyxpqffgkWlnVosGqc
         LH0yinza/58oswvUbqmMiPKzlCQECCQvaSDRFP6jTGuf+gMEYFwKn+kNwEdzgfUCrati
         LuAW4C5Z2cf1qmnR2zoaHU89nKETexwpN/JGnFSQwfjTjdZJ5x7wp0hAOBfIZla7o/iC
         gaAJ0C16eIi1VNBZVl4MhBgG8g0JxejXqjHrmyb4QLmppkSS5R8SuV7ZpzaMNo9+939X
         Kshf3stlraxyiR6Gyj2ygSuPLamB0B3ODRcg6xLobGD8/2n5rEW1khVo7gPWJx4FlXAA
         U3nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ1mWw0iXlCcwULpsKFkUS6npn7r4fCdhZadry/93TdYgzVvpXkjWRVylev8pCWzAVzfo0Y9Lhhyw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAL2+b2d1SqzSV8/505iO0sB7EUMMmWURXz1Q2jsTcIUD9y5pv
	hZ4UUx0O6LeM+0eRYY7/4sE6++3FzGpoeAqosF84UC5/I9/ZoM+v9xcyRlevgvBUB+eDqC7/pon
	D1i8=
X-Gm-Gg: ASbGncvlTrp+k/XUM7WgbNT1OaAXaF91x22SnflpEXUsSK9BXfhpxQtQRX5n/F1w85A
	9T2rzji9PK6Cav7M72hofEh46RcXyrx+yiJC8jKKrYaqEBV9yfyjlgGEN3L4vV4Z6JS4G/lN4Us
	kTN1BbHzSkUF46OkYr+UdQnsp+JnVDGgXH04jqf+9PacrVT82ZzUZZZJekBQvvurz/bHsYrh8c5
	hp++1DguAnFcuZWc28VtBGABZzbGtjtLY2f7qlSrY/QyqdrfQQCAHC2Ti8dkFdwMPycGyU4bcuU
	ZpDh3slwmNnSi4Qo69Dx+n99BPQ=
X-Google-Smtp-Source: AGHT+IF6fdWst2By1eClMdbyx8B3rsQWK/xFGe95ibXcfINCsjyekVjBe4s4bpBblSC0KZld6e5iNw==
X-Received: by 2002:a17:907:3e8f:b0:ab7:ac0:24ea with SMTP id a640c23a62f3a-ab70ac0291dmr675027566b.3.1738504237292;
        Sun, 02 Feb 2025 05:50:37 -0800 (PST)
Message-ID: <cf5ae390-fb9d-4839-9423-d1ead9bd34bf@citrix.com>
Date: Sun, 2 Feb 2025 13:50:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? 1/3] AMD/IOMMU: drop stray MSI enabling
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <ea0fea03-6002-4fc6-86ac-19598c9d9ef6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ea0fea03-6002-4fc6-86ac-19598c9d9ef6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2025 11:11 am, Jan Beulich wrote:
> While the 2nd of the commits referenced below should have moved the call
> to amd_iommu_msi_enable() instead of adding another one, the situation
> wasn't quite right even before: It can't have done any good to enable
> MSI when no IRQ was allocated for it, yet.
>
> Fixes: 5f569f1ac50e ("AMD/IOMMU: allow enabling with IRQ not yet set up")
> Fixes: d9e49d1afe2e ("AMD/IOMMU: adjust setup of internal interrupt for x2APIC mode")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -902,8 +902,6 @@ static void enable_iommu(struct amd_iomm

There's a call to amd_iommu_msi_enable() just out of context here which
was added by the 2nd referenced commit.

Given that it's asymmetric in an if() condition regarding xt_en, and the
calls are only set_affinity() calls, why is this retained?

(I think I know, and if it is the reason I suspect, then you're missing
a very critical detail from the commit message.)

~Andrew


>          }
>      }
>  
> -    amd_iommu_msi_enable(iommu, IOMMU_CONTROL_ENABLED);
> -
>      set_iommu_ht_flags(iommu);
>      set_iommu_command_buffer_control(iommu, IOMMU_CONTROL_ENABLED);
>  
>


