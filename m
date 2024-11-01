Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD699B92B5
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 14:58:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829155.1244245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6s9w-00029N-VW; Fri, 01 Nov 2024 13:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829155.1244245; Fri, 01 Nov 2024 13:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6s9w-00027s-Sb; Fri, 01 Nov 2024 13:57:52 +0000
Received: by outflank-mailman (input) for mailman id 829155;
 Fri, 01 Nov 2024 13:57:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nn37=R4=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1t6s9v-00027k-J2
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 13:57:51 +0000
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 477540fb-9859-11ef-a0c5-8be0dac302b0;
 Fri, 01 Nov 2024 14:57:49 +0100 (CET)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4315839a7c9so17108095e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Nov 2024 06:57:49 -0700 (PDT)
Received: from ?IPV6:2a02:8012:3a1:0:4ddd:1dd:c52d:25b6?
 ([2a02:8012:3a1:0:4ddd:1dd:c52d:25b6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9aa09fsm92310195e9.37.2024.11.01.06.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Nov 2024 06:57:47 -0700 (PDT)
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
X-Inumbo-ID: 477540fb-9859-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwOS44NS4xMjguNDciLCJoZWxvIjoibWFpbC13bTEtZjQ3Lmdvb2dsZS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjQ3NzU0MGZiLTk4NTktMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDY5NDY5LjIxODIzMiwic2VuZGVyIjoianVsaWVuLmdyYWxsLm9zc0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730469468; x=1731074268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bu4D4Mv8/fDajNy9rbBLpwDtTLzs9+MlnSIZlS6TxrA=;
        b=AsA6sfmPnw1UBmy6kHb01YwVZ/uEBMReXhdpzzIcD//Fgz2pjhY9meDa92XhuOiq95
         FTmG1T3YiLkEIBQm3I8G2oacjjn/TcaPx7ZUOyKmZX6iCcUeS1Naz8/iQD4N157ucG7+
         Ys9i7Fd1GdPOCgdoF2bHROcbW553/3ogrMiOyx3qqPs7u8FEI9nnQKtEBqrQtf5e+RIw
         VHwjHjDUJuWcaLlO/u9+aaWJBjDQ3289ga29XnI+0hDAYMc04MrMdKJQxa1DVXzyHCK+
         gWRBYfh5gCiGw4KvouuDtoDd79u1niR5pkBQlQm2l1b1AoLGirX4X5MehDeUwHo40Ga4
         Aubg==
X-Forwarded-Encrypted: i=1; AJvYcCUa8rnJELhmMmT2LLLm603gHrAzkVIZHL7frKhGzNFKRiZd9WARDPU8gVpgr4NUc2cn9lv8tXnIStU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzddBl6DFh9AvxnDSqimN6GGxnMkFoLHKw5WEUSTNUxsi2zJqle
	iAsyWU5vpPR8YhSCttYy6QJmBBTO7MueV33ESzpioTUN0lsEoIpZ
X-Google-Smtp-Source: AGHT+IEfgSh2V1apmjvg49kmHL3nXMl3FRi63WoX2vTit9SuQ1NZJANTSH4xHFTuBVZGe+beuH06sA==
X-Received: by 2002:a05:6000:104a:b0:37e:f4ae:987d with SMTP id ffacd0b85a97d-38061159141mr15324472f8f.29.1730469468308;
        Fri, 01 Nov 2024 06:57:48 -0700 (PDT)
Message-ID: <e34cb7ef-89ad-4470-969d-dee44ea1e6dd@xen.org>
Date: Fri, 1 Nov 2024 13:57:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-4-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241028124547.1371867-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 28/10/2024 12:45, Ayan Kumar Halder wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> On Armv8-A, Xen has a fixed virtual start address (link address too) for all
> Armv8-A platforms. In an MMU based system, Xen can map its loaded address to
> this virtual start address. So, on Armv8-A platforms, the Xen start address does
> not need to be configurable. But on Armv8-R platforms, there is no MMU to map
> loaded address to a fixed virtual address and different platforms will have very
> different address space layout. So Xen cannot use a fixed physical address on
> MPU based system and need to have it configurable.
> 
> So, we introduce a Kconfig option for users to set the start address. The start
> address needs to be aligned to 4KB. We have a check for this alignment.
> 
> MPU allows us to define regions which are 64 bits aligned. This restriction
> comes from the bitfields of PRBAR, PRLAR (the lower 6 bits are 0 extended to
> provide the base and limit address of a region). This means that the start
> address of Xen needs to be at least 64 bits aligned (as it will correspond to
> the start address of memory protection region).
> 
> As for now Xen on MPU tries to use the same memory alignment restrictions as it
> has been for MMU. We have added a build assertion to ensure that the page size
> is 4KB. Unlike MMU where the starting virtual address is 2MB, Xen on MPU needs
> the start address to be 4KB (ie page size) aligned.
> 
> In case if the user forgets to set the start address, then 0xffffffff is used
> as default. This is to trigger the error (on alignment check) and thereby prompt
> user to set the start address.
> 
> Also updated config.h so that it includes mpu/layout.h when CONFIG_MPU is
> defined.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


