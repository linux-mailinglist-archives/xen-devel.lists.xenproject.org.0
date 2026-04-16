Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PibpG2ed4GlKkQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:27:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0951140B851
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283106.1565398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDI40-00011O-RM; Thu, 16 Apr 2026 08:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283106.1565398; Thu, 16 Apr 2026 08:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDI40-0000z8-O0; Thu, 16 Apr 2026 08:27:04 +0000
Received: by outflank-mailman (input) for mailman id 1283106;
 Thu, 16 Apr 2026 08:27:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDI3y-0000z2-Lr
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 08:27:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDI3x-0005GT-Fn
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 10:27:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e09d4b-e002-0a2a0a5209dd-0a2a450bdfbc-36
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:27:01 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e09d55-212f-0a2a450b0019-d155dd2ed1db-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:27:01 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43cfde3c3f3so7810373f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 01:27:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3553d7sm11551918f8f.9.2026.04.16.01.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 01:26:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776328021; x=1776932821; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmVIp6XqRe6y+f5rJqSDXLrfB6PgQu705IW4tDYaN5s=;
        b=bVSQBjf8EmTlvJRsFWBaJ7sN9ClyYMo3HtPFXo2NG7AHE+4gEi44U4EvNjsjtX1Sgj
         kSBZ/LdrQKy3Khs8odQDq1tZuvZi9yCsV5E1bqvvzkw8TWjywRm1UOWmLbWo9SjGICEH
         ACAjbHwJWZayMW1SVFD5k1ogYdJ0RVtmRJxHC3MTK2ELcry5FhvS0wmNQatHvQrwlsQs
         Y7D0DfkXxTdrzlngyn1GU8HAF+bdIhsjBGi7m4kBpiabkEkZeXCqaSjdf+2PC3VEKn/n
         E8hkoLG683PBIIS5ZN+kg7ZjA5TMh37RFwwE9E8aKsM2NnemJmLYF56fdhaZV/FQbS2r
         TXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776328021; x=1776932821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmVIp6XqRe6y+f5rJqSDXLrfB6PgQu705IW4tDYaN5s=;
        b=WNy9YAnEf/OrhFL9VWjnTYzNbNgr7e7mKMCM/CtF7VGKR9bEhgEw3ERt7REi2wn27a
         9y3K0X/aAJtDVt0NHJJcE/WlGy9vvBPJKJb1Xn+C/6PbA/jJiYlv3Q1YMpU+bOMRurXo
         xROmmsTVCZ+6RNHNZlMcDt6TumtWgvXNos91JW8NZNtB5AA2HCYBK7DIv9phaelsnusp
         W6KkEhjjaWxlTTLD9LeJSetw2IAHhAyW1R4SMVD7gZEGVtsxxZMkFBJrnehHsN+CuNKX
         bRvsw1171J9Xri4XLxx9aSLpyoPdmy/I/iwnW4npeQvD836gU+BexpGib33KxX/fwnic
         2mAw==
X-Forwarded-Encrypted: i=1; AFNElJ/6Juqeqcc7t33CbRTnWkcRcDdDSwkaO7/cj07mUgKMF+yUMLU/JbGNGBcrt7tM1vxVl8Y3mHv/4wU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx57F0aBjCZCCx0errXxDUQn28mg9ok9DrLvNcy6BxOV4ekdhOa
	Zld5BYpbjAyXx3PNFGm8vxSGMaA6DtQDEyY5h4jFbq8uTpo2LHn9r0u6hCSqLloAxQ==
X-Gm-Gg: AeBDieuN7FXFZzXtAl9pzucBWjbOfoJV91BPyrst5h3Gp5MRpU+3m1Pu8VA2KEjpS7l
	pm3y5IAkCGp5KkEMcKhIva6cpbjbZeQtC4b5VTkL8atmkD/oeXg8MP6GUIJGueai48lz1VNsTTq
	JVqP7jGs9reEpuI0mg/gFhhvxEPfiso/9VLvfHqsaCKlB7S6LCNI23lIZKYLGO6gTE3gPZiWKoT
	2//ozXs1c8Q3YTnez8IucPAYYdzeE5nU1GPyVxciG9QjCPR97Z81+euNertluftO22nK68CFrcK
	mJSJ6MeKexsTSWovtnJxIpPHc5XKckUdWJ1h0z7muUak7QeSiCZnvnnsr6+rJKqiPxGaGpbgy2j
	m7uSIMhVJZcWDmL8MDP63EMf/otysUKGoTWY/gUSbtfmnuHuFH8V18mU7albLrPmAZortEGh5r3
	MP5ua6bslMFMZvXko2NvLXzyr571rU7Yw28Gz4pnA1422pp8Zt//0PxE9RSP6L55RPVjtCCWSHX
	89/1M1Lih6a0MbdM07/KgLS3A==
X-Received: by 2002:a05:6000:1ac5:b0:43b:3d02:7806 with SMTP id ffacd0b85a97d-43d642c852cmr37530036f8f.28.1776328019996;
        Thu, 16 Apr 2026 01:26:59 -0700 (PDT)
Message-ID: <776afc8f-20ab-4014-97c1-0b9491c29aea@suse.com>
Date: Thu, 16 Apr 2026 10:27:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <73db845e6617130966a565cdca6274db4cb46428.1774871881.git.mykyta_poturai@epam.com>
 <58cfab3b-7cf2-4e38-9968-1248e665f985@suse.com>
 <f4a1cfa1-f3ea-4fa0-bffd-1f6346e07d39@epam.com>
 <28900826-5a96-4bf0-8d5b-11fd1be8386a@suse.com>
 <96829f0b-faac-4100-8c30-c93ac9459600@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <96829f0b-faac-4100-8c30-c93ac9459600@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1776328021-0576AF3B-5A7CBCDD/0/0
X-purgate-type: clean
X-purgate-size: 3293
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[10];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 0951140B851
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.04.2026 10:22, Mykyta Poturai wrote:
> On 4/16/26 09:49, Jan Beulich wrote:
>> On 15.04.2026 16:51, Mykyta Poturai wrote:
>>> On 3/30/26 15:32, Jan Beulich wrote:
>>>> On 30.03.2026 13:59, Mykyta Poturai wrote:
>>>>> With CPU hotplug sysctls implemented on Arm it becomes useful to have a
>>>>> tool for calling them.
>>>>>
>>>>> According to the commit history it seems that putting hptool under
>>>>> config MIGRATE was a measure to fix IA64 build. As IA64 is no longer
>>>>> supported it can now be brought back. So build it unconditionally.
>>>>>
>>>>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>>>>> ---
>>>>> v6->v7:
>>>>> * no changes
>>>>>
>>>>> v5->v6:
>>>>> * don't change order in Makefile
>>>>>
>>>>> v4->v5:
>>>>> * make hptool always build
>>>>>
>>>>> v3->v4:
>>>>> * no changes
>>>>>
>>>>> v2->v3:
>>>>> * no changes
>>>>>
>>>>> v1->v2:
>>>>> * switch to configure from legacy config
>>>>> ---
>>>>>    tools/libs/guest/Makefile.common | 2 +-
>>>>>    tools/misc/Makefile              | 2 +-
>>>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.common
>>>>> index b928a4a246..03dfcee7fa 100644
>>>>> --- a/tools/libs/guest/Makefile.common
>>>>> +++ b/tools/libs/guest/Makefile.common
>>>>> @@ -7,6 +7,7 @@ OBJS-y += xg_private.o
>>>>>    OBJS-y += xg_domain.o
>>>>>    OBJS-y += xg_suspend.o
>>>>>    OBJS-y += xg_resume.o
>>>>> +OBJS-y += xg_offline_page.o
>>>>>    ifeq ($(CONFIG_MIGRATE),y)
>>>>>    OBJS-y += xg_sr_common.o
>>>>>    OBJS-$(CONFIG_X86) += xg_sr_common_x86.o
>>>>> @@ -17,7 +18,6 @@ OBJS-$(CONFIG_X86) += xg_sr_save_x86_pv.o
>>>>>    OBJS-$(CONFIG_X86) += xg_sr_save_x86_hvm.o
>>>>>    OBJS-y += xg_sr_restore.o
>>>>>    OBJS-y += xg_sr_save.o
>>>>> -OBJS-y += xg_offline_page.o
>>>>>    else
>>>>>    OBJS-y += xg_nomigrate.o
>>>>>    endif
>>>>
>>>> This looks wrong to me. There are x86-specifics in that file, which shouldn't
>>>> be built on Arm. And the name of the file also doesn't indicate any relation
>>>> to CPU management.
>>>
>>> xen-hptool requires xg_offline_page as it has both CPU and memory
>>> hotplug commands. Without building xg_offline_page it fails with
>>>
>>> xen-hptool: symbol lookup error: xen-hptool: undefined symbol:
>>> xc_mark_page_offline, version libxenguest_4.22.0
>>>
>>> when trying to do memory ops.
>>>
>>> Is it an acceptable behavior?
>>
>> I don't think so, no. The tool wouldn't, aiui, load at all then if built with
>> "bindnow" enabled.
>>
>>> If so I guess we can build xg_offline page only on x86.
>>
>> We still need to, imo. But the tool still needs to be usable no matter how
>> specifically it is built. It should avoid referencing xg_offline_page.c
>> functions when built for non-x86.
> 
> As I understand, the usage of arch-specific compile time checks is 
> heavily discouraged in tools. So I don’t think it would be approved by 
> tools maintainers. Do we really need to omit this file if memory ops are 
> already getting blocked by Xen on Arm anyway?

Nothing I can answer in a way that's definitive for your purpose. As you
say, the final word here is with Anthony. I've voiced my opinion.

Jan

