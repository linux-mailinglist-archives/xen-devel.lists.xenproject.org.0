Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0263CB56975
	for <lists+xen-devel@lfdr.de>; Sun, 14 Sep 2025 15:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123889.1466582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxn6k-0004ts-09; Sun, 14 Sep 2025 13:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123889.1466582; Sun, 14 Sep 2025 13:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxn6j-0004sO-Tr; Sun, 14 Sep 2025 13:49:33 +0000
Received: by outflank-mailman (input) for mailman id 1123889;
 Sun, 14 Sep 2025 13:49:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uxn6j-0004sI-Bi
 for xen-devel@lists.xenproject.org; Sun, 14 Sep 2025 13:49:33 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3b28e5e-9171-11f0-9809-7dc792cee155;
 Sun, 14 Sep 2025 15:49:31 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ea3d3ae48fso189476f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 14 Sep 2025 06:49:31 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd620a64dsm12239775a91.8.2025.09.14.06.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Sep 2025 06:49:30 -0700 (PDT)
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
X-Inumbo-ID: a3b28e5e-9171-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757857771; x=1758462571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pW/+k4+KI0qELuCUefA1eTNn6dv6V3ftKzgsVCCt42A=;
        b=WRe9B5+3mMkMcDka12dO2a9MAnpYJNwwVUyuYGhlstfiqKlbHKG/FN1FBaJLoqj00o
         1KvZn2vJLoXF98Lb9pKeNgcO6+WyfW/d2+roLtu/Kxed2UVp3a0BtESQp5EwgznGoyBd
         hqtRDfz1/RJpgEHeKAjJ6PcRtX7K71X4FumI7QIFnmQHBBYCDrZ1A40lnBzivLYl8erZ
         QIVFRU8hC0hCjZZIrqAKRDuKYl/mue9QfTznO0yzk8oveKSkSEgEnUqRKf6AgQVgBH0d
         fWYOMtxwuZhSFOoH0jzafM6d4FY9VmNwmXe7wqmOBTFB9HHIJWIcNlA/b5aPsHEjInev
         A4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757857771; x=1758462571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pW/+k4+KI0qELuCUefA1eTNn6dv6V3ftKzgsVCCt42A=;
        b=qO/nitg96KEZkXh9WdWFCww168uKQhdIWvsLjI0Hh69cX7v1RMCtbIOFjKu2BL80+z
         UmYgoIN1bKeh2T72wjhJ6OAT0fek29Hu6OgPrC5YILQidaLo/Xz4wBC2704Yf575cmDJ
         BnfFmHh1NdzgzaaWPd28JRayYAemiIwNfjJtY0UBkjro87hwJqN0qCVINvsH85S27bS+
         HQRSsi+E+YkyNdpOnYof0iu7ppINWablHiaANXyFKdbiU5i3ce4SKGDGJ2SqP4DwR2Vx
         kMAuMTMRa2U6rz20Hug2tniOVjnZ7DWQ3e+5b0P2ydWK8vsk8PzHHQLnzuZ4fODHFt/5
         K8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUGFFvr2ZvyezcvJZL64fsqMATxY32KGm68vJlkT4hraOzKe9v8egB5wo6359nHry8BaeWyppGDu4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOdb3UMVgnl5Xhr3NtdWzadaDRVd6CbXqL9/cPEpiURDqkqUmJ
	tpfyytAm/6e8fbuXjQT8juNCMW+bIaUZPUJPrK/MxtbRFmWlfwc2r1ahSTGzcOtGUw==
X-Gm-Gg: ASbGncvLHeKYYaGVLo/NQshLtcviqsr2TkEzqom1OPfNMMTSWlvg9tO0/Fx8XLN7MNw
	4qR0dTpPoMH78MRgk2xX5Fm/vLCWLs5O0jdsjrozlyS2Sk/1BtgZM400KE1ETg23YaqQvzZSdR7
	gOOWTE52yOb+rjZBRlQ3QchFmVjRTbVYLLQzT1U+oEp6Tpk+e8293j5gyG6tn6ZbrjRRYCRNIG3
	MBapk57gYFv5M14rOuLKjlRnIF3Jo8lrvDoTckm4C3/GQJU69P2lIMeMO41aWSSWELCeOAy5QTP
	+UOxGMka7DKiqRBLsyraofb321Q8c1axZ8qAlf7Sexd5lUzEQ+TnpkZ/s1U2aHPAgxjGAP97lcm
	NSUrNQQTdafF4o+jk7ewKKvqD3WT1F3iw0DgUfQYk/Q==
X-Google-Smtp-Source: AGHT+IGtn/M0UGs7OVW81zJaWqH1M8LU5Y33+XeEc0V8f3hfQAi1pRjgrEQTVtAo+bQmX77TWJPeBQ==
X-Received: by 2002:a5d:64e9:0:b0:3e2:3717:cce5 with SMTP id ffacd0b85a97d-3e75e16b341mr11002810f8f.30.1757857770818;
        Sun, 14 Sep 2025 06:49:30 -0700 (PDT)
Message-ID: <2a818f1b-4326-4335-8ca5-4301632b1f33@suse.com>
Date: Sun, 14 Sep 2025 15:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vm_event: introduce vm_event_is_enabled()
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250912045254.3731398-1-Penny.Zheng@amd.com>
 <e29930b6-2f13-483b-a8ce-62a93550199d@suse.com>
 <CABfawhmB_WxfR0aL3F6kgo-jgVBJh8M6PLRZikboZPkPTF+hPA@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhmB_WxfR0aL3F6kgo-jgVBJh8M6PLRZikboZPkPTF+hPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.09.2025 01:24, Tamas K Lengyel wrote:
>>> +static inline bool vm_event_is_enabled(struct vcpu *v)
>>> +{
>>> +#ifdef CONFIG_VM_EVENT
>>> +    return v->arch.vm_event != NULL;
>>
>> Is "enabled" (in the function name) a good description of this condition, Tamas?
> 
> Sure, sounds fine to me.

That is the pointer alone being non-NULL identifies "enabled"? And not
just e.g. "active" or "available" (can be enabled with further things
set up)?

Jan

