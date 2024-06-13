Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8E906ABA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 13:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739818.1146761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHiJc-0003Ai-Az; Thu, 13 Jun 2024 11:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739818.1146761; Thu, 13 Jun 2024 11:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHiJc-00037c-81; Thu, 13 Jun 2024 11:08:24 +0000
Received: by outflank-mailman (input) for mailman id 739818;
 Thu, 13 Jun 2024 11:08:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8X4E=NP=gmail.com=anshulmakkar@srs-se1.protection.inumbo.net>)
 id 1sHiJb-00037W-DA
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 11:08:23 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3760da0f-2975-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 13:08:09 +0200 (CEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2c2e31d319eso674769a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 04:08:09 -0700 (PDT)
Received: from [192.168.0.112] ([203.92.56.82])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c4c45f68e4sm1358862a91.28.2024.06.13.04.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 04:08:07 -0700 (PDT)
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
X-Inumbo-ID: 3760da0f-2975-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718276888; x=1718881688; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8b3HjmUdCtnogQCYfsgu2iuWm6pk2Lq6e9hKd+Na3VI=;
        b=Q4jBvU3Xw3n+3fs1m+Zx6fm5v6FDjWswttQVyRZbVGiQorqzn/B8hUvVB9C4myTf3q
         YbFxfwml9AoqT8EHGU4NNKvdE4ouVNwHRCk8ozKnm7/VKW21eEqpWR2SIUwlPPLs7ayj
         /Jp5ZtRVJ/KSHvbftkJZUIvYcL0ZJ81b5SBJPD3CvBK3tlyk6KKIPRZ4UEypaavSV1hW
         tKC8DGj6GUu5ZsyrAoPVgPTRa1pY5bt0nLQU46GVorqckCGsc9xfoRZzTU15Es82kqOM
         VX1x4yYD7xMFYndeeGPFl9YNmwFY1zaIOf4qNuNF6KHCxsOSShI5bS/CMSvGdI5wC8x2
         YSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718276888; x=1718881688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8b3HjmUdCtnogQCYfsgu2iuWm6pk2Lq6e9hKd+Na3VI=;
        b=PWG1or6ui8lHfxQlTDyjt0xFREykZxuBJUXyAQsy6vbj2G22uEHyg+3ETUHLra5Aqj
         R3+P2f/BL1NoDJi+7pZ3FddNWmTtljN8c4ahC8XWilnZjBBbN0zxPPmV2LCJOcaPMVs3
         PQ/4IRB6g4zyMA0pZ0xhR63MkFA9WiBGy43FcPtuacPM6oIslf7Z4Zp0gN7X71RPcyzq
         eodK1ncRkNiewbIpvIWbYMI4pCXcsJOYXAtiW/0YGR6SJfpRrnURmj0qts4BJcFmAxj1
         kpthpRd5kwXHrIKZMbf2Ny1e7ekVCI+EHkA3iTwpbXEnvhYbfRre9XeadOAm07QJyzQO
         kZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCV6SltQOhDuJBL6/yiID/FAxl0cRze+xdHM5dH6126ptRKDg7uHTzflM6ApIh+vFWx6ZLf6OE2F3F/Jift+2CUbXDe11YvxyTFWG8iC64c=
X-Gm-Message-State: AOJu0Yz2p7Dxg63rSVKPf1eSsOScD6NFtSls1CSThI1HCtA2YBv1wmlL
	s60s86KlqPzGPQD5WNfh5UoyB8ZRr5X0C0dgDf0956cdNFWwG6AD
X-Google-Smtp-Source: AGHT+IFT3YpFvtCt/hHSXRxsqxC5hnjPujuLXSplVeyKDZ6WbW4gF4L8a93hdm6bGpPgS5Re9XhMdg==
X-Received: by 2002:a17:90a:2dcb:b0:2c2:da02:a2c7 with SMTP id 98e67ed59e1d1-2c4a76fa971mr4056110a91.44.1718276888097;
        Thu, 13 Jun 2024 04:08:08 -0700 (PDT)
Message-ID: <7b0d8c58-c1f7-453c-bec4-76d383880bc1@gmail.com>
Date: Thu, 13 Jun 2024 16:38:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN v1] docs/designs: Introduce IOMMU context management
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <1cdd746f1af79970f8c7151d23854d33416772e0.1713876394.git.teddy.astie@vates.tech>
 <5c7c76f29726d377e3ff8a22ba2e3eb01dfa4c3b.1713876394.git.teddy.astie@vates.tech>
 <bc39fe10-68a4-47c3-aa70-c2a8865ea8cd@suse.com>
Content-Language: en-GB
From: anshul makkar <anshulmakkar@gmail.com>
In-Reply-To: <bc39fe10-68a4-47c3-aa70-c2a8865ea8cd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/13/2024 3:49 PM, Jan Beulich wrote:
> On 23.04.2024 14:59, Teddy Astie wrote:
>> --- /dev/null
>> +++ b/docs/designs/iommu-contexts.md
>> @@ -0,0 +1,373 @@
>> +# IOMMU context management in Xen
>> +
>> +Status: Experimental
>> +Revision: 0
>> +
>> +# Background
>> +
>> +The design for *IOMMU paravirtualization for Dom0* [1] explains that some guests may
>> +want to access to IOMMU features. In order to implement this in Xen, several adjustments
>> +needs to be made to the IOMMU subsystem.
>> +
>> +This "hardware IOMMU domain"
> One very basic question up front, before I can even think of properly reading this
> doc: Here you refer to terminology used in that other doc, yet ...
>
>> +[1] See pv-iommu.md
> ... it's not clear what this actually refers to. There's no such doc in our tree,
> afaics.
>
> Jan

Went through the RFC. Please can you share whats the use case you are 
trying to solve here.

Anshul

>

