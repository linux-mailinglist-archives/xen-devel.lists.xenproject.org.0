Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296538CE43B
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 12:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729293.1134400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASDV-0001KT-63; Fri, 24 May 2024 10:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729293.1134400; Fri, 24 May 2024 10:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASDV-0001Iv-2S; Fri, 24 May 2024 10:32:05 +0000
Received: by outflank-mailman (input) for mailman id 729293;
 Fri, 24 May 2024 10:32:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=di0w=M3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sASDT-0001HK-HJ
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 10:32:03 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db168bd8-19b8-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 12:32:01 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-355080e6ff9so497269f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 03:32:01 -0700 (PDT)
Received: from [192.168.0.16] (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a08aba8sm1269932f8f.42.2024.05.24.03.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 May 2024 03:32:00 -0700 (PDT)
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
X-Inumbo-ID: db168bd8-19b8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716546721; x=1717151521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/j1AH2CW1D72ZHr3W8o3rzzMsGfMwZCkPJJE+Ii7QK8=;
        b=AlTZbcRy8yjW4YWNh41T4CVLrToPhFXsqosbyE4W3cfu0Cg8VXVbqdfCXIPRUK9ZHH
         2UTkHUtTATUcbfcM97Y6xIwrL9Emph6DCCd4NNR1iqbrgqOyswWW/fDt8wa4jWAbzt6P
         RhnwyoeViOb0sRSuq1DU4LYb4qW/hcX++WVG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716546721; x=1717151521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/j1AH2CW1D72ZHr3W8o3rzzMsGfMwZCkPJJE+Ii7QK8=;
        b=uDM8Sgu8rlbgAFpRPOgQYa07cSlm9UEv7IPS3DbtnFvoTt7I8ZTCc5QKnXgB3zp/+k
         RGHBc10Q2wyZR149Mg8u0swrwOu6N4q+AWsizG30Bs9ydFyYA4t9P3ieVZXkDg7pq+tz
         bgXpTCrnnxBa3I33089bOuRIrzject8YqpVEfdjdc9aSH6p13bKphl2xJO4coep6lLnc
         e4NALfZUS3GEPDEdmr1EGHZxeL+15sLUTCxuz77gEx00Iu7h0FSkW6VpJub7jJ7BNpDk
         mDNKMW1RtuSTMiSOiPKvUE5MfCzxMPbN1K2FDmqCNHpL2My4MxPlWKu0z0tAqfBubX2k
         ZsPA==
X-Gm-Message-State: AOJu0Yy1oLBRJugl49CDNFY5u4KEiIB4R1kf5iiLBKA3hwa+s48nKu5W
	jS3w7/qbc3saQtw2VLSc5GGBjfST1BEUVXLFZhSmIaMLwNJHkDrOCoNPvDfHfEc=
X-Google-Smtp-Source: AGHT+IFAdmBE26nT1NqSf+apueplaOS+4Wh9gEgmrQZMeYVdmDMTDYFFSGA4t30yjSDOwCshjNFq3A==
X-Received: by 2002:adf:e402:0:b0:34a:2852:f119 with SMTP id ffacd0b85a97d-3552fda1cffmr1100385f8f.36.1716546720766;
        Fri, 24 May 2024 03:32:00 -0700 (PDT)
Message-ID: <cb48ebac-3406-47e3-9323-ad75f487265a@cloud.com>
Date: Fri, 24 May 2024 11:31:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] tools/xg: Clean up xend-style overrides for CPU
 policies
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <cover.1716457040.git.alejandro.vallejo@cloud.com>
 <ae180fd606cb9a6aa0108080fe8cf7a6496a4ce3.1716457040.git.alejandro.vallejo@cloud.com>
 <Zk8e1RabTi0YXCgW@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <Zk8e1RabTi0YXCgW@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2024 11:47, Roger Pau Monné wrote:
>> -static xen_cpuid_leaf_t *find_leaf(
>> -    xen_cpuid_leaf_t *leaves, unsigned int nr_leaves,
>> -    const struct xc_xend_cpuid *xend)
>> +static xen_cpuid_leaf_t *find_leaf(xc_cpu_policy_t *p,
>> +                                   const struct xc_xend_cpuid *xend)
>>  {
>>      const xen_cpuid_leaf_t key = { xend->leaf, xend->subleaf };
>>  
>> -    return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
>> +    return bsearch(&key, p->leaves, ARRAY_SIZE(p->leaves),
> 
> Don't you need to use p->nr_leaves here, as otherwise we could check
> against possibly uninitialized leaves (or leaves with stale data)?

Indeed. Good catch (same on the MSR side).

>> -        switch ( p->policy.x86_vendor )
>> +        switch ( cur->policy.x86_vendor )
>>          {
>>          case X86_VENDOR_INTEL:
>> -            for ( i = 0; (p->policy.cache.subleaf[i].type &&
>> -                          i < ARRAY_SIZE(p->policy.cache.raw)); ++i )
>> +            for ( i = 0; (cur->policy.cache.subleaf[i].type &&
>> +                                i < ARRAY_SIZE(cur->policy.cache.raw)); ++i )
> 
> Nit: indentation is weird here.  I would use:
> 
>             for ( i = 0; cur->policy.cache.subleaf[i].type &&
>                          i < ARRAY_SIZE(cur->policy.cache.raw); ++i )
> 
> Thanks, Roger.

Sure. Leftover from removing the size_t in v2.

Cheers,
Alejandro

