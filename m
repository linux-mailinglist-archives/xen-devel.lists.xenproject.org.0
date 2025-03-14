Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5860CA60D53
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 10:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914239.1320022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt1NU-0003gp-4h; Fri, 14 Mar 2025 09:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914239.1320022; Fri, 14 Mar 2025 09:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt1NU-0003f9-1U; Fri, 14 Mar 2025 09:30:52 +0000
Received: by outflank-mailman (input) for mailman id 914239;
 Fri, 14 Mar 2025 09:30:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tt1NS-0003f3-UT
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 09:30:50 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01aabb13-00b7-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 10:30:45 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso12371665e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 02:30:45 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe2a2c8sm11601775e9.23.2025.03.14.02.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 02:30:44 -0700 (PDT)
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
X-Inumbo-ID: 01aabb13-00b7-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741944645; x=1742549445; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1PJpvMlv4emFf9eDUt+dWMPA6ujtAlfg5Q6aRe5apD0=;
        b=hiycaBLdY2W/k+GHcg7x1w7bEL7W0dmp0gryGXNl7jNyjQbf51ymAzmxPoNX9C9pLc
         qTYX8umNz5yjyC6iIfuU/Y3pHKWzhSff2a+/TcGNZc39P4gjSZ5eb9d5N8GCgVfLKLAq
         XplcUTMa97kYdN5Phgw2PBfQttOmqhQh1ha6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741944645; x=1742549445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PJpvMlv4emFf9eDUt+dWMPA6ujtAlfg5Q6aRe5apD0=;
        b=dR5n3XqKa5qmPuYSEt557xBdJRqusRyaSvTzxuPlH1NhydLWNUEza3b1cP9WGE8EaP
         YppabY8jBZaBTWHCsBP/e2waZcjmpVueByZI3H4pDGAQa3ypFG6p1yT62+ogoXfJgwrw
         95xRq2p9kxKKxmbKpQLrla+DuYx0UG68Oswb4C3YqBBJ97Sh569pNQUKcQZmSSkkHolv
         3fYL8HEiFSTvDYwpwc1shxaHufRlmDLUheo840mQhQFHwO4RfUF7fXuGSzOTqLpMyRag
         PdvfTJDWT4S3NYoeIBNrnWOK8jELQwNMYhxV6Kfkb2gd+gP5puX2iNg5toR7h0m86Qa/
         yMCQ==
X-Gm-Message-State: AOJu0Yy+6oUeEXrGtK4AKxTqjmfj3R1MqYkg2K/YSzUiXAeXvd00jq7g
	OY7blnLTTLJuGFAWaAiXq3DCfcxNcZu/y0XCctVjRg+ZZfLcpDUdeuxyFIe+OX8=
X-Gm-Gg: ASbGncvGzUDSxdxL5x15J5P5vNTQtBT6lK+jZ4b8UYkl0cARDvm8mytc2tDDjCXW6KM
	DgwXXU0Wy1oh8h4UWu+SFIu0ePmYRr9zEf0AZ4px1JSBu/3A4Zfh6Sf/3tFECMyrUfr2LVgDMNK
	qdwhIvfzCxTEjEdVmwOCm0mFuIgN3XHnbUYmFTE7x/hE0/2J20U44vUFfywJ64LNAYxNN945JXl
	qforNAe8ZxBl6mj2bisDoccnYZpSw80oZcDhVprzAuQ1AivYsF6V6Wd7drnLZwxWFlTN20kv8c9
	/C6s0iotTF95Pf2HogGLKgX2b70okhTiOKKhL3l5+Dt6hB6ct+tPrHpzEq1iJlX0tQb+XaYkqmN
	39FNdrRp4
X-Google-Smtp-Source: AGHT+IGFTsIR6S7baPPpGlU7gVcNLASocNVLlQ0Hv/YjfeSs5O0pAQnGE1BcMKL8fAkxQ8t+fQqNRA==
X-Received: by 2002:a05:600c:1c9f:b0:43c:f8fc:f686 with SMTP id 5b1f17b1804b1-43d1ec62883mr24168515e9.3.1741944645128;
        Fri, 14 Mar 2025 02:30:45 -0700 (PDT)
Message-ID: <23d2b793-42a8-45cc-9314-750b84526aaa@citrix.com>
Date: Fri, 14 Mar 2025 09:30:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drivers: Change amd_iommu struct to contain
 pci_sbdf_t, simplify code
To: Jan Beulich <jbeulich@suse.com>,
 Andriy Sultanov <sultanovandriy@gmail.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <7e5a37e51303ba17dab8e6a92830257f670f3355.1741891599.git.sultanovandriy@gmail.com>
 <f308cbf6-0d2d-4843-982a-a59ea70c7ad1@amd.com>
 <CAHPYgaXc8X5tBYN6BL2w2PVSNLwaTPP=zWhATBbjYRN-2dmE-g@mail.gmail.com>
 <1e36cec6-c02c-47b9-b957-087e8eb62328@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1e36cec6-c02c-47b9-b957-087e8eb62328@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/03/2025 8:56 am, Jan Beulich wrote:
> On 14.03.2025 09:07, Andriy Sultanov wrote:
>> On Thu, 13 Mar 2025 at 19:59, Jason Andryuk <jason.andryuk@amd.com> wrote:
>>> On 2025-03-13 14:57, Andrii Sultanov wrote:
>>>> --- a/xen/drivers/passthrough/amd/iommu.h
>>>> +++ b/xen/drivers/passthrough/amd/iommu.h
>>>> @@ -77,8 +77,14 @@ struct amd_iommu {
>>>>       struct list_head list;
>>>>       spinlock_t lock; /* protect iommu */
>>>>
>>>> -    u16 seg;
>>>> -    u16 bdf;
>>>> +    union {
>>>> +        struct {
>>>> +            uint16_t bdf;
>>>> +            uint16_t seg;
>>> Are these still needed by the end of this patch?
>> Yes - otherwise the patch would be larger as bdf and seg would be one
>> namespace deeper - /iommu->seg/iommu->sbdf.seg/
> This kind of union is fragile. Hence we want to avoid it, even if this means
> an overall larger diff.

This is my suggestion, and it's the pattern used in struct pci_dev.

pci_sbdf_t is nice for code generation, but it's not great for source
verbosity.

~Andrew


