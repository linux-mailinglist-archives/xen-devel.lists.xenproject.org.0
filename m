Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB1F8B8E47
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 18:36:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715353.1116913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Cw4-0003Nv-9D; Wed, 01 May 2024 16:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715353.1116913; Wed, 01 May 2024 16:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Cw4-0003L9-5I; Wed, 01 May 2024 16:36:00 +0000
Received: by outflank-mailman (input) for mailman id 715353;
 Wed, 01 May 2024 16:35:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PNhw=ME=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s2Cw2-0003L0-Fy
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 16:35:58 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1f1e913-07d8-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 18:35:56 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a58fc650f8fso424601166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 09:35:56 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r20-20020a170906705400b00a555ef55ab5sm16480723ejj.218.2024.05.01.09.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 09:35:54 -0700 (PDT)
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
X-Inumbo-ID: e1f1e913-07d8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714581355; x=1715186155; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j0cOQGeawFsj/qDO2oxPiX5pTKzMxIMJ9PgXl4/JbDc=;
        b=cUNgFlzTYFkxNg71AgFEGuylJWbjg5fuwt9Gg0DJmk38zH0JbTXF8ENuqG4RbJl+sh
         5vYgt6GzuaHbMDKyxzFMhjkXDM6r6juAf9Twh6aZgxty6nESbjy2XWb96zL8ZyCfXVuQ
         RoJVEZSuLtI4s5dC06/SyGKG5ei2XUHIwBQWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714581355; x=1715186155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0cOQGeawFsj/qDO2oxPiX5pTKzMxIMJ9PgXl4/JbDc=;
        b=iDyBnbfiajO/koB55C3uGj5lrWVMaOA6RADsRqgAOgm64NnN9w7W0OQnqy6DPyicDf
         92nsXdWSYeSS8McUncSrXNpn2Q5EC6ZfeLRbtPhNGAu01zzPLvRVBjKDD/IZeylY0P+T
         JSie/oVsULZRcCOuiRFzH1oQaQVx2YC4KNCDUlTConyJpvKO67mmEr9HAI5+FWbheEaT
         gXWRfTH7ololQycoN7NOA8Ip+pGXxwrJzRYwU+B+RnRP3TrNj1rwYsOCBhlZUBFGR108
         kls3ovaiVzM1FYO1PHNvS2V5fsU2MI6n+pS3Qt9PlsDSUwZXIbhLNRWIY3cgIWBaQ3lE
         Rbmg==
X-Forwarded-Encrypted: i=1; AJvYcCUaOlrYqC7zuRUz4fb7nxP8c6v65cnNCHIvB2wSN1kQE6uKaq/H6iv/qNhgwJILe0ZUo+CHwgXEE+f1c+QERQZT5cHGHkavMNhWDqs9UGw=
X-Gm-Message-State: AOJu0YyRDe+iG0LiQvDo3adHfQQmQJ4JdSI7dJ5G3gmpSn5QJ6PLuICi
	jDq56aAJiIJsZRqN5zUiYMS1mfmmVsQWialLD3CxA60krnERmGT2OV1O46DJDUo=
X-Google-Smtp-Source: AGHT+IFRqeHjZmL01dM2T7B8D53tVViIXN/SqzUr/06Z8uK0aGxJky7964qbn84g8OyJb4/K4KHuMg==
X-Received: by 2002:a17:906:da04:b0:a52:62a2:d727 with SMTP id fi4-20020a170906da0400b00a5262a2d727mr2345857ejb.52.1714581355277;
        Wed, 01 May 2024 09:35:55 -0700 (PDT)
Message-ID: <e0963ddd-c3b7-44dd-a3b7-67811f3e9d7a@cloud.com>
Date: Wed, 1 May 2024 17:35:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] xen/x86: Derive topologically correct x2APIC IDs from
 the policy
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-6-alejandro.vallejo@cloud.com>
 <14891d02-e9e9-4650-b572-e6f071f1506c@suse.com>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <14891d02-e9e9-4650-b572-e6f071f1506c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26/03/2024 16:41, Jan Beulich wrote:
> On 09.01.2024 16:38, Alejandro Vallejo wrote:
>> --- a/xen/lib/x86/policy.c
>> +++ b/xen/lib/x86/policy.c
>> @@ -2,15 +2,78 @@
>>  
>>  #include <xen/lib/x86/cpu-policy.h>
>>  
>> -uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t vcpu_id)
>> +static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p, size_t lvl)
>>  {
>>      /*
>> -     * TODO: Derive x2APIC ID from the topology information inside `p`
>> -     *       rather than from vCPU ID. This bodge is a temporary measure
>> -     *       until all infra is in place to retrieve or derive the initial
>> -     *       x2APIC ID from migrated domains.
>> +     * `nr_logical` reported by Intel is the number of THREADS contained in
>> +     * the next topological scope. For example, assuming a system with 2
>> +     * threads/core and 3 cores/module in a fully symmetric topology,
>> +     * `nr_logical` at the core level will report 6. Because it's reporting
>> +     * the number of threads in a module.
>> +     *
>> +     * On AMD/Hygon, nr_logical is already normalized by the higher scoped
>> +     * level (cores/complex, etc) so we can return it as-is.
>>       */
>> -    return vcpu_id * 2;
>> +    if ( p->x86_vendor != X86_VENDOR_INTEL || !lvl )
>> +        return p->topo.subleaf[lvl].nr_logical;
> 
> Is "!= Intel" really appropriate here? I'd rather see this being "AMD || Hygon".

Sure, I don't particularly mind, but why? As far as we know only Intel
has this interpretation for the part counts. I definitely haven't seen
any non-Intel CPUID dump in which the part count is the total number of
threads (Centaur/Zhaoxin are not multithreaded, and don't expose leaves
1f or e26, as far as I could see).

Cheers,
Alejandro

