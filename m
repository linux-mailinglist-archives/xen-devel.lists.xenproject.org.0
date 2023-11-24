Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A3D7F7C30
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 19:12:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640893.999678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6af0-0007T8-OB; Fri, 24 Nov 2023 18:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640893.999678; Fri, 24 Nov 2023 18:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6af0-0007QW-LV; Fri, 24 Nov 2023 18:12:14 +0000
Received: by outflank-mailman (input) for mailman id 640893;
 Fri, 24 Nov 2023 18:12:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AaTM=HF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r6aez-0007QQ-E9
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 18:12:13 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd33efc4-8af4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 19:12:12 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40b34563987so12890125e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 10:12:12 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b0040b3632e993sm5800002wmq.46.2023.11.24.10.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 10:12:11 -0800 (PST)
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
X-Inumbo-ID: fd33efc4-8af4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700849531; x=1701454331; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o+/f84opKH9lWCplODjnO9oWR+dC+5Qdntt28d/NUXM=;
        b=WaLvWBM61mXULYdfOrN3B2poR3HMbMoBra5rUbh6OQWkbSFxH1MppqQuY3ZdbCmVGG
         bBaY0T+PmDLscSN697bN6BUTg4OG9LHrVfIWrEPc4/vS9Rgge7ki6UUHq/AvhdqrWGok
         Udbpy2psg5CJg49aCqcg4MGVllKos5gy6Y/PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700849531; x=1701454331;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o+/f84opKH9lWCplODjnO9oWR+dC+5Qdntt28d/NUXM=;
        b=jK9VQF+Y9QOsyMkL2TjCeXKQnUnnie1PujksjRi0WJnPADEQ2wrA4EaiADOAH7EJye
         FdEXgW6EoQq5O6BH4gC9ERztZcFhxgGqRxt97QJFIUv2GFhP8dFtgi0sBtTK9Xgvpq3L
         +hGPVZx2Uk0BN5jJBAxkBkjEBxDdx0y/RrULASXhDX6hlTNF9lAYbxrA8j6WqoV7T7Be
         9wxy5E583pS+NKhME1snQpCTqelZH5S/uk0qgIQ9ZKSxd0frQLNhqkeWcymIzFrR0qDp
         J2KeRsxaHGDhVOea5zRuEFTx3hlNbxNzwKjO/sM49WNsZSiK0YnezgMCPAMIsL7Ep4Vj
         IBUg==
X-Gm-Message-State: AOJu0Yxgc9P5RUQ+FHyLky+zFjTNr2+9Gl3fKswgZAWH1rfAlCKbeBHM
	AFQkJaZqQoz/oh6kUt5ln0rYzw==
X-Google-Smtp-Source: AGHT+IGSwOU0zBEYtx1nxsjqfZOVrGVE2NBsptutiYIhQCZqnLWi5wgm36nRaS29+aIcCU6cU3wAoQ==
X-Received: by 2002:a05:600c:274e:b0:406:5a14:5c1e with SMTP id 14-20020a05600c274e00b004065a145c1emr6986007wmw.1.1700849531560;
        Fri, 24 Nov 2023 10:12:11 -0800 (PST)
Message-ID: <e52a4b10-c0c9-40fa-bd39-65e804b9605d@cloud.com>
Date: Fri, 24 Nov 2023 18:12:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] xen/spinlock: reduce lock profile ifdefs
Content-Language: en-US
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20231120113842.5897-1-jgross@suse.com>
 <20231120113842.5897-3-jgross@suse.com>
 <1d575e42-9b85-40da-8d96-0932ce98424f@cloud.com>
In-Reply-To: <1d575e42-9b85-40da-8d96-0932ce98424f@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/11/2023 17:59, Alejandro Vallejo wrote:
> Hi,
> 
> On 20/11/2023 11:38, Juergen Gross wrote:> With some small adjustments 
> to the LOCK_PROFILE_* macros some #ifdefs
>> can be dropped from spinlock.c.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - new patch
>> V3:
>> - add variable name to macros parameter (Jan Beulich)
>> ---
>>   xen/common/spinlock.c | 49 +++++++++++++++++++------------------------
>>   1 file changed, 21 insertions(+), 28 deletions(-)
>>
>> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
>> index d7194e518c..ce18fbdd8a 100644
>> --- a/xen/common/spinlock.c
>> +++ b/xen/common/spinlock.c
>> @@ -267,25 +267,28 @@ void spin_debug_disable(void)
>>           lock->profile->time_hold += NOW() - 
>> lock->profile->time_locked;      \
>>           
>> lock->profile->lock_cnt++;                                           \
>>       }
>> -#define LOCK_PROFILE_VAR    s_time_t block = 0
>> -#define LOCK_PROFILE_BLOCK  block = block ? : NOW();
>> -#define 
>> LOCK_PROFILE_GOT                                                     \
>> +#define LOCK_PROFILE_VAR(var, val)    s_time_t var = (val)
>> +#define LOCK_PROFILE_BLOCK(var     )  var = var ? : NOW()nit: spaces 
>> before the closing parenthesis

Ugh, I'm changing email clients and formatting seems have gone haywire.
The first line of each comment is inlined with the quote they refer to.

Cheers,
Alejandro

