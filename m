Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AF8A9C9C5
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 15:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968049.1357758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Ijw-0008OM-IT; Fri, 25 Apr 2025 13:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968049.1357758; Fri, 25 Apr 2025 13:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Ijw-0008M4-F2; Fri, 25 Apr 2025 13:05:12 +0000
Received: by outflank-mailman (input) for mailman id 968049;
 Fri, 25 Apr 2025 13:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c45=XL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u8Ijv-0008Ly-EP
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 13:05:11 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb26a439-21d5-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 15:05:10 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39efc1365e4so1103125f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 06:05:10 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8ca99sm2321197f8f.20.2025.04.25.06.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 06:05:09 -0700 (PDT)
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
X-Inumbo-ID: eb26a439-21d5-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745586310; x=1746191110; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a8XTFW5MXdZ2AJnFdq28UM8hkzvg+RToqPjVE71pa8I=;
        b=LEQu7B7UlOHt8Cr3j6yV6dd3yuBXO3cY8aEN8uRzjoQA8rSOYU4BR/JxQPuRs6n1OA
         RAsqT2ZKHCLqR+lG/Hx0wwTP6bxCP4/X45z8FAe7gnrKsjOAinn2oOqHCtUDCrKxjo9r
         ratsva+U0/OT4e37iw3IVwuFxXA6gkRq2wQtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745586310; x=1746191110;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8XTFW5MXdZ2AJnFdq28UM8hkzvg+RToqPjVE71pa8I=;
        b=BkVFYbAQQ5aWlRyfE3A5Zi7orDEO5B1b+QucWteNxpdThsdpTOd97IawkGWUfNPVcl
         sNWI7BmUfr0HCAViehmGPEChdV6G0dF/muRouOW62UhK65WnMOKVs2iRPF9r0Bo2poQc
         KaVBFxsDXYPgSmPxy2G7UzSq/kTR+SzEBZpEES419G0/a1fze4EB1Wj59gA1lmKzWR0B
         ZeQCSo9FAXP0z7sXq7ykTW3m6b9BxkZptfUAnXxCvDOBGRSC8DP7qRDYUvXLVRypgUel
         QKME4eNHwcCB/DHrvmovbOoAWbKFRhqipGwxoS/9C4HfKgpFfMgZXftarP/IMt613MFl
         EePw==
X-Forwarded-Encrypted: i=1; AJvYcCWHAwHXNyffVhEMmQ6bf3j6XDLM60r+1of3jbJzjJyaAj02R2mbnuS1npusfEbQeHHU3osOzR2Z0X8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJIBpg1LfkDYkXfpcCO/A7TrRgK9Ncr/gXDJx3pHakWC65tDvs
	g0n0bUTaUT4RWO8f6L4p9mBVbGSezxVE9eG34bdd5u/FjwW5rcGZX1lKairNVlQ=
X-Gm-Gg: ASbGnct6PHFXljMQNTvL9eZ8xhwgRS/JB3TdT58yB4gKCeclddG0kUM9aPxVXdee+QI
	UyISvqX4BuIf2MvqAFfGgOo4sE++LSun2zl96PfE0LO7dYllP4YEnpZLCfiMLcw4HNuDtdOIWv+
	A6tl/LLLsOotQ+blVo4mDugNizmRHqyu8MbEjxjMv0tmYmMULRwOygWpE4hLtfBgZ4nBZ0AyUWS
	HXLBDMb5lsYZyrxtbTdeetqhkFrWEvRwZOKHfJUb8LjGlmC284nfQwGjTtomU890NRvtWlQdc02
	23QhJ5xujD38GHRgK7N3NsdF0swo2oAHfzhWf/X3ssKDjwBgI2SzwuN4Xhu1wB8pLnTUbL6P9uM
	P16OxnK9+1e0HjR4y
X-Google-Smtp-Source: AGHT+IGIcqnZC4vsTLJCXRMwfhQApfMc5iLpXDbGB/Z6h3rl3hGWl4GuKmcUz9FQakmMN+fEXKz0vQ==
X-Received: by 2002:a05:6000:2287:b0:391:4873:7940 with SMTP id ffacd0b85a97d-3a074f84b97mr1740244f8f.54.1745586309958;
        Fri, 25 Apr 2025 06:05:09 -0700 (PDT)
Message-ID: <74bf3a58-6c90-4123-80e3-b72ba67ea46d@citrix.com>
Date: Fri, 25 Apr 2025 14:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/mm: Introduce mm-types.h
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250425112415.245585-1-andrew.cooper3@citrix.com>
 <20250425112415.245585-2-andrew.cooper3@citrix.com>
 <e5c6b448-945c-4c93-a3d6-e6e598102c2b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e5c6b448-945c-4c93-a3d6-e6e598102c2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2025 1:48 pm, Jan Beulich wrote:
> On 25.04.2025 13:24, Andrew Cooper wrote:
>> The type used for pagetable attributes/permissions is currently unsigned int,
>> but needs to become architecture dependent as PPC needs unsigned long.
>>
>> Introduce mm-types.h to house pte_attr_t.
>>
>> Given the new toolchain baseline, we can use __has_include() now to remove the
>> need for boilerplate on most architectures.
> That's true now, when it's just pte_attr_t that's there. Memory management,
> however, is pretty different between architectures, so I wonder if in the
> longer run any one will remain that actually can use the common header.

Anything in xen/mm.h is common and needs architectures to provide (or
use the defaults) the bits required.

asm/mm{,-types.h} still exist (when necessary) to provide the
arch-specific extensions.

~Andrew

