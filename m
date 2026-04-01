Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC88KFkvzWn7aQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:44:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E808237C5B4
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270497.1559150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wnw-0007nV-G2; Wed, 01 Apr 2026 14:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270497.1559150; Wed, 01 Apr 2026 14:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wnw-0007kl-DL; Wed, 01 Apr 2026 14:44:24 +0000
Received: by outflank-mailman (input) for mailman id 1270497;
 Wed, 01 Apr 2026 14:44:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7wnv-0007kf-KB
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:44:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7wnt-001y0G-B6
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:44:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cd2f29-bab6-0a2a0a5309dd-0a2a450786ee-44
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:44:22 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cd2f46-ba2d-0a2a45070019-d155dd2ac8e5-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:44:22 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-43cfb723793so2297343f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:44:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb15:80df:da00:6d45:ff60:3ad6:d7fa?
 ([2a01:cb15:80df:da00:6d45:ff60:3ad6:d7fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e1fe0b0sm420081f8f.0.2026.04.01.07.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 07:44:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775054662; x=1775659462; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpiVB9dBVzghSP8aA3dpY/N1hXuz4Q4Khlfyme9aK48=;
        b=nhVh6e+mAWTE74hW4ZLkGfxwOpjo4nRrrDraMFSCjAQEDwvtHTSq6aIK+5/Fm39InB
         LaLz29WWbYy1FPgCe23C0TGj9xocT0aRalcdT82NAI/Rp49asbZnmxFnLlQqUP+DE8EM
         9U0q0c4pci30/57Va7ZpHuySsuC6J3xHcEnKuZRFeCsEN8T7a2rHDaiFOn2rbgXvigPA
         VPN2eiAycitVfAGt5lIyc9wGzyl5Aap+NwhE6Hi+Nl1w2+sQT0MTu2zOZss6q6fCHsPa
         lLcc9xBeOHovniF4LvEIc9fh6s94ct9hXAPbp7TsJE7aYcMjdG+gMT+5lEKEExO3j8B5
         rqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775054662; x=1775659462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpiVB9dBVzghSP8aA3dpY/N1hXuz4Q4Khlfyme9aK48=;
        b=kzPHLkQVP/lW0djHoIG+SwjokvyS5rgZHS9ztz/YM+19mvikMaKU5OIiNV+lxmTWas
         CjJhSBW95rmEph1x3WPM24SsxUabcyOYy/GUHvY7Dkw2FIGAEoQFNeqTfVy/SN8yzbrC
         BN2Y7C/+10P0NFac9LTIJcY2sZnxDCSinGht6CQLC7BDHP5GItXfyYJ12JsjfYFqdGCT
         oGgiIJbG9cX7ZAQgx79Bs1yzSvbnNTsxQkO0hj5TdkEPcNWswteFk45mZf9nZoWpP8Nc
         te2TIHxPMT0p0DQ/YlWrEzx5tnVNpi6F+CalpB3FptUi+eSSwbdf2K+H84qTJFyO/qIH
         ishg==
X-Forwarded-Encrypted: i=1; AJvYcCXOOINzR0lEpCsjH4BbkZjxzkqIN02Ci5BazFxJdzz6jafUHchdg9KEKFOqola3mgXT64uA4lT3ph0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywy9SDAg1EIUQTJN8BubtA4MInyB6snIEkhQkOB/KJcG6MoQuJw
	4Gmkp9GwUuqs0gK165Wqu1VCutVckbjYswkAubjaR5SYaZV1Hg9bDV/t
X-Gm-Gg: ATEYQzzVVq5sWbZiQaMS4awSnzY8H0G/MM6tW3Wx0cGqyTmooGOVBWBi/cRsC9U/fuO
	HkKeafRoTonOvYUWb3IEy0ULuDT4oAu/QJBOyRqWnZXPoOroT2J9IUPc69ihLt1OcgpiNaf9IRM
	fDgtHLzB0ggH+QtxY7xktN7ssBOMRu1iTS+JIs/McyFipirZC7XyK8cyfXGEhOv84jNSHSydGRl
	sQN6uGMxngbxkfmJQFXr6U3CtORIMuxdEX1+BvxgiNIGMn6BLql5Uc76GsI8y3e0ngQL2a9tLeR
	Kob0MD2Ixbk0cks21BFg2XArqpBA6HSnq5SyffqYEYhH9B+RCiwfU0GbF/bLtRJ32lQhSO/pYNo
	w1iHz4jGkEhJNy5ZZVW2Yd90hCQeS0YmfsnidmbwxfyOq5dOJi79Ft132HWdKb1xC6WINEDrs/e
	MeA8vqbndMggeqSZcKdOK9tid9V4f0EYH6Zom8oKCfB9gbhEYjA+EuAdCAKPWOfFb3Ar31sqjlB
	ol0Q/f0AAQ=
X-Received: by 2002:a05:6000:40ce:b0:43b:3cdc:9429 with SMTP id ffacd0b85a97d-43d15047f05mr7676711f8f.1.1775054662005;
        Wed, 01 Apr 2026 07:44:22 -0700 (PDT)
Message-ID: <7fd90eb0-1fe3-4985-83a1-1d0830ccbd6f@gmail.com>
Date: Wed, 1 Apr 2026 16:44:20 +0200
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
 <38d93a26-dfce-4d4e-a1d2-c4e8d13c4ead@gmail.com>
 <a57b4cee-e230-4fc5-a7a6-a62635b54a76@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a57b4cee-e230-4fc5-a7a6-a62635b54a76@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1775054662-1175241E-4E53ADC2/10/73395122804
X-purgate-type: spam
X-purgate-size: 2015
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: E808237C5B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 7:59 AM, Jan Beulich wrote:
> On 31.03.2026 21:49, Oleksii Kurochko wrote:
>> On 3/31/26 6:32 PM, Oleksii Kurochko wrote:
>>>>>>> @@ -2544,6 +2544,12 @@ void thaw_domains(void)
>>>>>>>     #endif /* CONFIG_SYSTEM_SUSPEND */
>>>>>>> +bool domain_use_host_layout(struct domain *d)
>>>>>>> +{
>>>>>>> +    return is_domain_direct_mapped(d) ||
>>>>>>> +           (paging_mode_translate(d) && is_hardware_domain(d));
>>>>>>> +}
>>>>>>
>>>>>> The placement of paging_mode_translate() doesn't match ...
>>>>>>
>>>>>>> --- a/xen/include/xen/domain.h
>>>>>>> +++ b/xen/include/xen/domain.h
>>>>>>> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
>>>>>>>     #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>>>>>>>     #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>>>>>> +/*
>>>>>>> + * Is the auto-translated domain using the host memory layout?
>>>>>>> + *
>>>>>>> + * domain_use_host_layout() is always False for PV guests.
>>>>>>
>>>>>> ... the description of the function.
>>>>>
>>>>> But why the placement should be different?
>>>>
>>>> If you focus on auto-translated, then imo paging_mode_translate()
>>>> better would guard everything.
>>>
>>> Then it make sense to do in the following way:
>>>    bool domain_use_host_layout(struct domain *d)
>>>    {
>>> -    return is_domain_direct_mapped(d) ||
>>> -           (paging_mode_translate(d) && is_hardware_domain(d));
>>> +    return paging_mode_translate(d) &&
>>> +           (is_domain_direct_mapped(d) || is_hardware_domain(d));
>>>    }
>>
>> This is not really correct.
> 
> ... because of ... ? (After all, then the comment isn't correct either.)

I thought it could break what Arm had before when 
paging_mode_translate() is false, but it is always true for Arm, so with 
paging_mode_translate() being true, the new definition is equivalent to 
what it had before. So looks goods.

~ Oleksii


> 
> Jan


