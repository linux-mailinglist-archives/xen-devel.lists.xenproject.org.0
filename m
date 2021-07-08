Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2835F3C155A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 16:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153177.282999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1VCm-0001o4-8B; Thu, 08 Jul 2021 14:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153177.282999; Thu, 08 Jul 2021 14:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1VCm-0001kR-4h; Thu, 08 Jul 2021 14:40:44 +0000
Received: by outflank-mailman (input) for mailman id 153177;
 Thu, 08 Jul 2021 14:40:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sNSP=MA=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m1VCk-0001kH-3h
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 14:40:42 +0000
Received: from mail-pg1-x530.google.com (unknown [2607:f8b0:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 703edd62-5722-46bd-b49b-278a95260bed;
 Thu, 08 Jul 2021 14:40:41 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id s18so6171343pgg.8
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jul 2021 07:40:41 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:18:efec::4b1])
 by smtp.gmail.com with ESMTPSA id
 h20sm3216729pfn.173.2021.07.08.07.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 07:40:39 -0700 (PDT)
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
X-Inumbo-ID: 703edd62-5722-46bd-b49b-278a95260bed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YXjZj7OhvPZJaAtT6Qwq7/8ZjjZCmfNtMSr8qDj8MRU=;
        b=ayW8QQM2efuvpdH0iOtsj9sDatgzjNkhl4+y/ouwe04BZcpt7tSpZSztZE1HcOshdP
         QXaUNAf/1sngsBP+5ZL0dubNDykY4vKK6b9Wmf6V3NS5iLDuzZvWuWys1GP5fH3k/OTC
         tYDRBkngjXQYqPF3DQewzYEvp4aC50Y/xFZW27B7I7FoSeruMrEakyjTyq4nU9lq5OXG
         9pEOEVcjBjM/2JuAGoOCNl8yharry3mPga7LZqh8ptcnsE3cQjXBDpSs+J18TjrzoZin
         UJfMRAaQiH9cX09/xDZhBpWcjIM9jra7EdcFVO0s5QSQNR3e2+qLq6ocQLn3NXgEDy83
         /jFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YXjZj7OhvPZJaAtT6Qwq7/8ZjjZCmfNtMSr8qDj8MRU=;
        b=oODMI4ts+D+0Q1/PxZWfwQh7CM14Q9dTPS0p3/y0GrnQV7cn4Ud1oTETLhwBrLnBzn
         t075nLR/ZYJlPzgV/zh/FMnSunILH146pTqnc2z4DApabjS77yqZvYcQQwc9LPinTiwv
         johVf70ncw63EIdnwqi5zDghaPcvQFmZL/tY6IdDWOpAMys7TrJSN8fcdFfQM9FjXRjw
         cqyjzTzVnreaCRD950/evT5SYAJNU9fIgoZZ7Y7+cldDkmhn9rgax+K3k61/P37d8/Fh
         fnbrzHbe3VlnRZQcFdScw8WVQYXVeTgkE8LQC8W+cUMMlbXRnPv5ux+IlzIuTGK6n69f
         /7sg==
X-Gm-Message-State: AOAM533T4zpPcjWQKMhFlHzR7xeffCzMb8NgwDkIzpPhLSeEexpOBrfX
	+gOJn10TyV9qvsL+MdASaME=
X-Google-Smtp-Source: ABdhPJwsdOgUCGltloBXaOdJeRrQgvHkqG47NpBLcd9gNcAJ5PSk2V3aVVR6tD13omBoKJiA4S0mBQ==
X-Received: by 2002:aa7:818a:0:b029:309:a073:51cb with SMTP id g10-20020aa7818a0000b0290309a07351cbmr31830476pfi.40.1625755240540;
        Thu, 08 Jul 2021 07:40:40 -0700 (PDT)
Subject: Re: [RFC PATCH V4 01/12] x86/HV: Initialize shared memory boundary in
 the Isolation VM.
To: Olaf Hering <olaf@aepfle.de>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, rppt@kernel.org,
 akpm@linux-foundation.org, kirill.shutemov@linux.intel.com,
 Tianyu.Lan@microsoft.com, thomas.lendacky@amd.com, ardb@kernel.org,
 nramas@linux.microsoft.com, robh@kernel.org, keescook@chromium.org,
 rientjes@google.com, pgonda@google.com, martin.b.radev@gmail.com,
 hannes@cmpxchg.org, saravanand@fb.com, krish.sadhukhan@oracle.com,
 xen-devel@lists.xenproject.org, tj@kernel.org,
 michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
 linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, vkuznets@redhat.com, brijesh.singh@amd.com,
 anparri@microsoft.com
References: <20210707153456.3976348-1-ltykernel@gmail.com>
 <20210707153456.3976348-2-ltykernel@gmail.com>
 <20210708073400.GA28528@aepfle.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <9b5d6843-67c5-066e-0997-995ec77e06b2@gmail.com>
Date: Thu, 8 Jul 2021 22:40:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708073400.GA28528@aepfle.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Olaf:

On 7/8/2021 3:34 PM, Olaf Hering wrote:
> On Wed, Jul 07, Tianyu Lan wrote:
> 
>> +++ b/include/asm-generic/mshyperv.h
>> @@ -34,8 +34,18 @@ struct ms_hyperv_info {
> 
>>   	void  __percpu **ghcb_base;
> 
> It would be cool if the cover letter states which commit id this series is based on.

Thanks for your reminder. I will add this in the later version.
This patchset is rebased on Hyper-V next branch with Swiotlb 
“Restricted DMA“ patches from Claire Chang <tientzu@chromium.org>
 
https://lore.kernel.org/lkml/20210624155526.2775863-1-tientzu@chromium.org/

