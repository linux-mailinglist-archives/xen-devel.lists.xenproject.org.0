Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1F915FC0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 09:14:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747287.1154656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0Nv-0003g1-0T; Tue, 25 Jun 2024 07:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747287.1154656; Tue, 25 Jun 2024 07:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0Nu-0003eX-Tu; Tue, 25 Jun 2024 07:14:34 +0000
Received: by outflank-mailman (input) for mailman id 747287;
 Tue, 25 Jun 2024 07:14:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOoF=N3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sM0Nt-0003eR-7R
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 07:14:33 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 918b8885-32c2-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 09:14:32 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a724b3a32d2so243078466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 00:14:32 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf56033asm482577666b.157.2024.06.25.00.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 00:14:31 -0700 (PDT)
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
X-Inumbo-ID: 918b8885-32c2-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719299671; x=1719904471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jHvDqZfaOeK7DkLlMhoi5sitZf81YrmoNlCsQytsxiA=;
        b=MwWrpaiBz6mUOoQGBX2+//tbo/IPpjtAtIfL4pVgDXglC8nyivVQ5zJrIgn872sO5N
         O+zSrslhANWsTmz8NH2mjAJ8zRT37qVgMDdegEVgSNo5aGvloBOnQy/GuQp4jhc4XRyF
         R+FmsyWpGpIaqu73i5PvR9hBIP0b4WzNmgfSi7O8r5wRg0fDEhT/2g+i0DmV2pF6BYP0
         aDdWfklnQiF3rhoO5/uDTxrGSq4h3BHqHLtIFWHATbEROfDfMYcfc1AyzIThcMmQ603v
         9eoXb5y9NNnBDt1YkDpm5sPQf5QZVV5UacZwQglbtcpqVeALPJR6tRqGhNVqNsCUpxdC
         3GWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719299671; x=1719904471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jHvDqZfaOeK7DkLlMhoi5sitZf81YrmoNlCsQytsxiA=;
        b=N7VafHHG1q0l+UElxYJE2w79jO0neFl8elg5FIIzEmWKBYw7sielmxWo66bjlkx5dE
         qsXxljSQ5bkMHert5dRrdn3b8a7YT8s+De9XoNqKNbdPlcGVP2R4Ld5Z5evlRp9BwtTM
         IhVPauc9Pho0+BmOLCtDMG4NIkIVNwFtcbIHq27npWQ/rq4meLnzB0nB2sue6Hk2omAL
         3D+hj3jOPe5Q/8FYudSzc9l0QBIxrwqeVWssckSePOOMEFlHD/NoPqtMcujjMDatYCcs
         04HQG/RQW+8pOqFLjuHP8OZGSN1ekHVtWDNYPX8PVf88e6TlXxsDF0ADZgfEJWxaOGQR
         hTDQ==
X-Forwarded-Encrypted: i=1; AJvYcCURn9GU3Ok62pzG3U2KjZf5NBEDX9sRlSI4jWML2fAZpMhrlNmjwTbQgI9Z+EBdcI1S2PmFn5xfdsB/0cJSg7gI1uRxT+YDBBnQPBsU62Q=
X-Gm-Message-State: AOJu0Yy7OdnwFJ/tGZ06tZk+kG/UA5Wj7WydYs7VU//ks2Z0kCaf4NKU
	3zv9nLimwCuuXY3RNi+nPr2Nlgt4RulGK3JNkgk+mr64wmOVpAAXJHCZ4Bwjxx8=
X-Google-Smtp-Source: AGHT+IGIrMtRW38dfQLZCAEMH0RKGznqaaofbgCMDhcrjt9VEBfEFDUZIgFi3gLkUL4L66Z+1zYsLA==
X-Received: by 2002:a17:906:e28c:b0:a72:42f6:ff0f with SMTP id a640c23a62f3a-a7245c70af8mr321721666b.77.1719299671322;
        Tue, 25 Jun 2024 00:14:31 -0700 (PDT)
Message-ID: <3a259a5b-b900-4a31-9b6f-32cddf48e97f@suse.com>
Date: Tue, 25 Jun 2024 09:14:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] common/sched: address a violation of MISRA C Rule
 17.7
To: Jan Beulich <jbeulich@suse.com>, victorm.lira@amd.com
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <a5f00432063ead8d4ae09315c1b09617a12b22f7.1719274203.git.victorm.lira@amd.com>
 <0fe07e0f-fe6d-4722-9f89-a78294a8b3a1@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <0fe07e0f-fe6d-4722-9f89-a78294a8b3a1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.24 08:34, Jan Beulich wrote:
> On 25.06.2024 02:15, victorm.lira@amd.com wrote:
>> From: Victor Lira <victorm.lira@amd.com>
>>
>> Rule 17.7: "The value returned by a function having non-void return type
>> shall be used"
>>
>> This patch fixes this by adding a check to the return value.
>> No functional changes.
>>
>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
>> ---
>> Cc: George Dunlap <george.dunlap@citrix.com>
>> Cc: Dario Faggioli <dfaggioli@suse.com>
>> Cc: Juergen Gross <jgross@suse.com>
>> Cc: xen-devel@lists.xenproject.org
>> ---
>>   xen/common/sched/core.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>> index d84b65f197..e1cd824622 100644
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -2789,7 +2789,10 @@ static int cpu_schedule_up(unsigned int cpu)
>>       BUG_ON(cpu >= NR_CPUS);
>>   
>>       if ( idle_vcpu[cpu] == NULL )
>> -        vcpu_create(idle_vcpu[0]->domain, cpu);
>> +    {
>> +        if ( vcpu_create(idle_vcpu[0]->domain, cpu) == NULL )
>> +            return -ENOMEM;
>> +    }
> 
> First: Two such if()s want folding.
> 
>>       else
>>           idle_vcpu[cpu]->sched_unit->res = sr;
>>   
> 
> Then: Down from here there is
> 
>      if ( idle_vcpu[cpu] == NULL )
>          return -ENOMEM;
> 
> which your change is rendering redundant for at least the vcpu_create()
> path.
> 
> Finally, as we're touching error handling here (and mayby more a question
> to the maintainers than to you): What about sr in the error case? It's
> being allocated earlier in the function, but not freed upon error. Hmm,
> looks like cpu_schedule_down() is assumed to be taking care of the case,
> yet then I wonder how that can assume that get_sched_res() would return
> non-NULL - afaict it may be called without cpu_schedule_up() having run
> first, or with it having bailed early with -ENOMEM.

Yes, you are right.

cpu_schedule_down() should bail out early in case sr is NULL.

I'll write a patch.


Juergen

