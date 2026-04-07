Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJpqLeqi1GmAwAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 08:23:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC393AA386
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 08:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274458.1560562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9zqP-0004s8-AO; Tue, 07 Apr 2026 06:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274458.1560562; Tue, 07 Apr 2026 06:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9zqP-0004q0-7W; Tue, 07 Apr 2026 06:23:25 +0000
Received: by outflank-mailman (input) for mailman id 1274458;
 Tue, 07 Apr 2026 06:23:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w9zqN-0004pu-17
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 06:23:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9zqM-00Enko-9R
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 08:23:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d4a2c5-2eae-0a2a0a5409dd-0a2a4508dbbc-46
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:23:22 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d4a2d9-fab6-0a2a45080019-d155dd32bd34-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:23:22 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43cfd96354aso2750385f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 23:23:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f5016sm50659184f8f.33.2026.04.06.23.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 23:23:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1775543001; x=1776147801; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NgWmYvzi0YbSz0p3AjXF31b3cTUVzBHVKyfc4bMxKIo=;
        b=DLNWMdCMJkhZ/XO7zy+vifh4BIYtlI+TlTMfXqW32smU4qiMoyb+1PD3F/kxZr1OLq
         gznV8tL/GG49CVGRMC0EkQuBtNSGC5rAJkXNnNlR2Bo6zWp8yH00DlrFm9Ao2Rzq3UI8
         C1ryiVakK5c71bm5OnEYZSYeuA84+899q115npTqOBAL+BYmPb2WHhdWUJmA3Km4iPM5
         ghi3chHVja1F40CGeFc4pRCJ9HrcDrbHzeDe1+0/B2Xn6uxM9rofF00+mHNWTXCfFBhm
         YgT8ITqGR4E1DI73R2IHZLlFzSPdgLOdFmqaeDoRJltrWsKIoEmRVZHe1v5oGlOb6Q9x
         Trig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775543001; x=1776147801;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgWmYvzi0YbSz0p3AjXF31b3cTUVzBHVKyfc4bMxKIo=;
        b=TA/f3jDJYpDYhpzen4WGJ7jUK0NZTjWTt4WAFVXf5OryqqTtJ7FY25JY91idOKhdAg
         8LJ9J/xoFd0bUb2+q5eH2WeAdACa4MRUJj+eK9MiolEAQoE+ePYPEuGiJzti85ZHgk/2
         h1dprcZcrlip2aY/Zp7kixVr6ATf1QYf3OIFD6iNhrgr2jXVnPj9dA/0dHk4UIRRGc8b
         pVNBnYEvf6BSNnHvf5GqOVUQ8ePwN0f+IScdGbNaE0Dltghziv8JCo+ddiEFq51EWlt7
         3CfIjaiB9nyTQz7bst45SeJMZzYM7BQunrGnyfGYOyq5F7ZBHtuxFbngsgbHl9WppjAv
         VSqA==
X-Forwarded-Encrypted: i=1; AJvYcCXt/szULc55F66b2FUD3w6VWSHm9bIcGIa42gI+efFj7pwxFdMXwId/I22ktVHqe8lc+JEI5k29dfc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwShp5+Pm/LFFH8G09A2ujOYb6nu9Q8S9XXScISI10dBWPAyInW
	ZzQ1mPmqtBhhwI6b0FvGlozt2piE5B3fUqMCv7JHp+WA550z8vkAA85EhSc1YKaeWQ==
X-Gm-Gg: AeBDiev3IZF56xQWUuKbq8Qb85veWUnNhpmz/3vM5IOu4LTOoLapTPhwATfNxitCGEU
	v/SfaBIRuexWWbX0tqo5o/eaIumRbeo83MsQ+HQP3bqSH7xFLluOZsBDdRIIDdp19iY939f+AF3
	UEli7bzZ/ICKrQMyFmvayVCOQdqiZIqakhQPBQUc7Qsio69d7cvO7aE34joqbL9d+7FcpU1zdxo
	qZ5dlpo4X40o4a4xY/O9wzm7dw9ZC6/+NI+t4FY5YTjteWnzI3VB4vU87r66/2mFGSFlQpSwTuV
	NivC8MD7HWjBhoRa51rzuRYotYBLGMfSv6GtW4j+H55j/EWbIS/FGLCNB3mMXTY+IP/959iYIA9
	v0uNEj63FXfY2wJkSWtIomaUJ1gMVnkf2qvUGXtw5AGzMz2mdMDxTGqhhPIqy+XQrSpIgpQMPdp
	5+m9Zdsa/2tM7igAsg5HfR7xAiY1Qma1tKfm5jafmIYbt5Rf1DHcRxxVx/qdPG5He2DV/Co+wZk
	UNQG/yg4lVQTakiuaRYGQT/Pw==
X-Received: by 2002:a05:6000:26c7:b0:43c:f793:f1c5 with SMTP id ffacd0b85a97d-43d292e1b17mr22651651f8f.34.1775543001562;
        Mon, 06 Apr 2026 23:23:21 -0700 (PDT)
Message-ID: <4a1f7cfb-df74-4083-a681-f79911da10e1@suse.com>
Date: Tue, 7 Apr 2026 08:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] xen/riscv: add definition of guest RAM banks
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <8278256f3d270b456d19cb9891b89b88a46548a5.1774281309.git.oleksii.kurochko@gmail.com>
 <1a3a316e-f0ea-4514-95d6-9813d6d5ca76@suse.com>
 <691be850-9145-4bbf-a897-d10a0193b730@gmail.com>
 <dfd2a666-f3a5-4d88-b034-438f8fbb85ba@suse.com>
 <2bae9e12-8f71-4ff0-b077-bfb4215e5e14@gmail.com>
 <ffd3a7cd-8c47-4a9b-864a-26a053b5b7d2@suse.com>
 <bc5a9826-c1ff-43b2-a3d1-1a4862301aea@gmail.com>
 <0e37083a-42ab-4c99-83fc-b77f519394b9@suse.com>
 <912263a2-8dff-414e-bea4-64428ce2ec36@gmail.com>
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
In-Reply-To: <912263a2-8dff-414e-bea4-64428ce2ec36@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1775543002-94365497-10DC61EB/0/0
X-purgate-type: clean
X-purgate-size: 2822
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1CC393AA386
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 06.04.2026 17:43, Oleksii Kurochko wrote:
> 
> 
> On 4/1/26 5:10 PM, Jan Beulich wrote:
>> On 01.04.2026 16:53, Oleksii Kurochko wrote:
>>>
>>>
>>> On 4/1/26 4:22 PM, Jan Beulich wrote:
>>>> On 01.04.2026 15:57, Oleksii Kurochko wrote:
>>>>> On 4/1/26 8:17 AM, Jan Beulich wrote:
>>>>>> On 31.03.2026 18:14, Oleksii Kurochko wrote:
>>>>>>> On 3/30/26 5:51 PM, Jan Beulich wrote:
>>>>>>>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>>>>>>>> The dom0less solution uses defined RAM banks as compile-time constants,
>>>>>>>>> so introduce macros to describe guest RAM banks.
>>>>>>>>>
>>>>>>>>> The reason for 2 banks is that there is typically always a use case for
>>>>>>>>> low memory under 4 GB, but the bank under 4 GB ends up being small because
>>>>>>>>> there are other things under 4 GB it can conflict with (interrupt
>>>>>>>>> controller, PCI BARs, etc.).
>>>>>>>> Fixed layouts like the one you suggest come with (potentially severe)
>>>>>>>> downsides. For example, what if more than 2Gb of MMIO space are needed
>>>>>>>> for non-64-bit BARs?
>>>>>>> It looks where usually RAM on RISC-V boards start, so I expect that 2gb
>>>>>>> before RAM start is enough for MMIO space.
>>>>>> Likely in the common case. Board designers aren't constrained by this,
>>>>>> though (aiui). Whereas you set in stone a single, fixed layout.
>>>>>>
>>>>>> Arm maintainers - since a similar fixed layout is used there iirc,
>>>>>> could you chime in here, please?
>>>>>>
>>>>>>> Answering your question it will be an issue or it will also use some
>>>>>>> space before banks, no?
>>>>>> I fear I don't understand what you're trying to tell me.
>>>>> I meant that there is also some space between banks and pretty big which
>>>>> could be used for MMIO which could be used for non-64-bit BARs.
>>>> I don't follow: Bank 0 extends to 4G. There's no space above it, below
>>>> bank 1, which could be use for non-64-bit BARs.
>>>
>>> So we have two banks:
>>> bank[0] -> [0x80000000, 0x100000000)
>>> bank[1] -> [0x0200000000, 10000000000)
>>>
>>> So i think we have some space between them [0x100000000, 0x0200000000)
>>> -> 4gb to be used for non-64-bit BARs.
>>
>> But a non-64-bit BAR need to be assigned an address below 0x100000000?
> 
> Right, I had in mind that RV32 uses for guest Sv32x4 which could 
> translate 34-bit GPA into 34-bit MPA and automatically applied that to 
> 32-bit BAR...
> 
> I can keep first 4gb for MMIO purpose and start bank[0] at 4gb as 34 MPA 
> address space is more then enough to cover reserved 2gb of bank[0] after 
> 4gb.

Yet having no memory below 4G won't work for guests wanting to run in bare
mode? Don't guests even start up in bare mode (and hence 32-bit ones need
to have some of their memory below 4G in all cases)?

Jan

