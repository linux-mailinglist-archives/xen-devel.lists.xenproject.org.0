Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFjbBe4tzWn7aQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:38:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A9237C42C
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270464.1559131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wi8-0005cE-GO; Wed, 01 Apr 2026 14:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270464.1559131; Wed, 01 Apr 2026 14:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wi8-0005ZR-DX; Wed, 01 Apr 2026 14:38:24 +0000
Received: by outflank-mailman (input) for mailman id 1270464;
 Wed, 01 Apr 2026 14:38:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7wi6-0005VK-A3
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:38:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7wi5-003JFB-M3
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:38:21 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cd2dd3-2eae-0a2a0a5409dd-0a2a4505e82c-18
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:38:21 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cd2ddd-3760-0a2a45050019-d155802be4d8-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:38:21 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-487012ce896so43148355e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:38:21 -0700 (PDT)
Received: from ?IPV6:2a01:cb15:80df:da00:6d45:ff60:3ad6:d7fa?
 ([2a01:cb15:80df:da00:6d45:ff60:3ad6:d7fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d2738sm265409f8f.24.2026.04.01.07.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 07:38:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775054301; x=1775659101; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+hEvzJdrLJVqVL+TYBqfIkN3Vk1B0Kgzr0IsMW38Lc8=;
        b=pshbf/To+3vJvzPkjrNVLMbUlgzrMb4831ydXBmjeQ2zcBWYFp4E9VjkB6T4YOGfRu
         +lRPZCvsB6mQDUin4Mya4vvoyZN9E4KaWMSPB9gZ8gPq+MghxRyqbgeezULPGEd+GP69
         mQULjqhD3FIfXt+MNMv1+HS2luitosZN0cM1regpv4GSmrFN8poiQ3anjN1YmFjnNE8H
         eB51QLyXd5o1kgk8MFMl3juY9nv+q1nvXiygK4CShcYEiN/55lkAHaa+/i18RcKYZ1TA
         1P0AiqHHmTA2202l2hhzvmyYUpXj05NMrKs/eZfS8+f9sW9dMTbS47hrdXTWIdnFydc8
         gKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775054301; x=1775659101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hEvzJdrLJVqVL+TYBqfIkN3Vk1B0Kgzr0IsMW38Lc8=;
        b=qQZhD/V5wwj/gQdQEw7sMG3SMSO30OoGFxLBuWk9FYdGN8TzHAsJxJtKJ9FhlhUBc/
         bXwjctVMqtl8iP3lYKu4hILiLEqcjalMUld/MuqMufNPDBfUYkswDYfy9Xr+o8GfZAK5
         uBzZPB6j60GCgfZlBefyJrGI/RQdpbNu+IU55Uu0LcmmJ30MrBRmppOBMy9kAzsGNYj7
         8Gew/SJ7Gibzwn9XnvjZPu3yyhEcaBepmVGskUSqjKpO9q3RNJ+O9xNY6sS5vHH+kRnW
         1b98ah4jvWfplebi2WoqkTJKKR8PpovFcrlX8iSOq9dV/fbcApisCY/KlzjAGCn0WWSq
         VwUA==
X-Forwarded-Encrypted: i=1; AJvYcCWk4P2CEFmGRq1ENE8iKwxevXutUqtjlOCGYVIlJtb/zP3y9yluOnqrVYEyMWv+spuUHx5yqQzQbXQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMrht/+Fcg4IKx+2bVFqfaES6zSVCGepAOrLbKmrith8CChzzz
	PqzBlMxQxRPuP1PPcc7FMuSO8kh5HHG8U+FPb0/cvAB6lHt38+jeTwIR
X-Gm-Gg: ATEYQzxf5V7gLiVMVZA5UwRQgCjruwEtFPFifae6KQY/Oxkpu1qhFHX6AQRrmAbswAl
	RIu+asPiWvCqw/RDomE+P6jWJiUJpgAPumL8vr7Rs1eBPnjQfWNL/LxcDOcMA5ZK5eiv+P7K7vQ
	LLz57JInEyIZpMZy5yefT4pIm12djCZd0FeXuh5Yy82u9FETUiiZgWMDkGS01bSP7NJjNny9sHK
	DAyRiGRWRFLk8V8AmTD65ldiM0HYpCMZehyBXv/+TXm1DlKABntNyuxjcuqFJU8KcC2N0A6v1n3
	BxhAl6aab/b8SaXMG1/nM5VkZlG/+UsM6D8LQC+PW6irXcDLRuG1CyeDVJEmgg+CDvSZzw0F26V
	sVQnEmcWwfA00mqdgqK4KmRwk1o/Pj7sB0lBBbuGgIWOErn2ebPSsQIuB0runi8OTHH66+7fhrK
	1FuDjreGF7bvsumHc1col5grh4LZQtupo2vYKzTonA3IKnf9+Ufq03Ktpbgqy3KMAS5az+VrJp5
	Fcbj+nQAiU6
X-Received: by 2002:a05:600c:630f:b0:487:288:1198 with SMTP id 5b1f17b1804b1-4888359da58mr55474125e9.22.1775054300710;
        Wed, 01 Apr 2026 07:38:20 -0700 (PDT)
Message-ID: <600b1b66-fd85-4b7f-8bdc-793667bccfec@gmail.com>
Date: Wed, 1 Apr 2026 16:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] xen: move domain_use_host_layout() to common
 code
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <533d01db2b36b8357cd87e99a64a6e66dbdd1db4.1774281309.git.oleksii.kurochko@gmail.com>
 <6df9470e-4969-48d1-bf0c-c6569a5e5577@suse.com>
 <57581b7d-cb9f-444c-9321-63b2fc3d09f0@gmail.com>
 <d1288db4-2001-4914-919f-b613fd607bcc@suse.com>
 <d67b2856-bf93-4254-afa1-745dc37e0623@gmail.com>
 <cdacc6a8-cd49-4327-a98c-636545e8579b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cdacc6a8-cd49-4327-a98c-636545e8579b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1775054301-33B2896F-568A8917/10/73395122804
X-purgate-type: spam
X-purgate-size: 3484
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 94A9237C42C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 7:58 AM, Jan Beulich wrote:
> On 31.03.2026 18:32, Oleksii Kurochko wrote:
>> On 3/31/26 5:53 PM, Jan Beulich wrote:
>>> On 31.03.2026 17:20, Oleksii Kurochko wrote:
>>>> On 3/30/26 5:13 PM, Jan Beulich wrote:
>>>>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>>>>> domain_use_host_layout() is not really architecture-specific, so move it
>>>>>> from the Arm header to the common header xen/domain.h and provide a common
>>>>>> implementation in xen/common/domain.c. domain_use_host_layout() potentially
>>>>>> is needed for x86 [1].
>>>>> No matter that this may indeed be true, ...
>>>>>
>>>>>> Turn the macro into a function to avoid header dependency issues.
>>>>> ... this introduces unreachable code on x86, i.e. a Misra rule 2.1 violation.
>>>> Do we have some deviation tag for such cases when the code temporary
>>>> isn't used?
>>> I'm sorry, but it'll take me about as long as you to find out.
>> Sure, I will take a look. I just thought that maybe you have a solution
>> already just in your head.
> Well, I do: Don't make this an out-of-line function.
> 
>>    I wonder
>>> about "temporary" though: Do you have a clear understanding as to when
>>> that will change?
>> No, I don't. As Stefano mentioned they will need this function one day.
>> Another option we could use ifndef x86 or ifdef DOM0_LESS and then when
>> someone will really need it on x86, this ifdef will be dropped. I don't
>> know if it is better solution.
>>
>> It seems like the best one solution will still make a try to make
>> declare this function as macro.
> Or an inline function. There's nothing ...
> 
>>>>>> @@ -2544,6 +2544,12 @@ void thaw_domains(void)
>>>>>>     
>>>>>>     #endif /* CONFIG_SYSTEM_SUSPEND */
>>>>>>     
>>>>>> +bool domain_use_host_layout(struct domain *d)
>>>>>> +{
>>>>>> +    return is_domain_direct_mapped(d) ||
>>>>>> +           (paging_mode_translate(d) && is_hardware_domain(d));
>>>>>> +}
>>>>> The placement of paging_mode_translate() doesn't match ...
>>>>>
>>>>>> --- a/xen/include/xen/domain.h
>>>>>> +++ b/xen/include/xen/domain.h
>>>>>> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
>>>>>>     #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>>>>>>     #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>>>>>     
>>>>>> +/*
>>>>>> + * Is the auto-translated domain using the host memory layout?
>>>>>> + *
>>>>>> + * domain_use_host_layout() is always False for PV guests.
>>>>> ... the description of the function.
>>>> But why the placement should be different?
>>> If you focus on auto-translated, then imo paging_mode_translate()
>>> better would guard everything.
>> Then it make sense to do in the following way:
>>    bool domain_use_host_layout(struct domain *d)
>>    {
>> -    return is_domain_direct_mapped(d) ||
>> -           (paging_mode_translate(d) && is_hardware_domain(d));
>> +    return paging_mode_translate(d) &&
>> +           (is_domain_direct_mapped(d) || is_hardware_domain(d));
>>    }
> ... in here which clearly speaks against doing so. And yes, this is what I
> was asking for (with the function parameter also suitably constified).

I expect that with an inline function in xen/domain.h compiler will want 
have paging_mode_translate() be explicitly defined, so an inclusion of 
xen/paging.h will be needed, but likely I am wrong that it will be 
needed it the case of inline function.

~ Oleksii

