Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODEuOwt452lZ9QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 15:13:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5051A43B2EB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 15:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288960.1569191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFAuK-0005k9-6u; Tue, 21 Apr 2026 13:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288960.1569191; Tue, 21 Apr 2026 13:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFAuK-0005iW-4D; Tue, 21 Apr 2026 13:12:52 +0000
Received: by outflank-mailman (input) for mailman id 1288960;
 Tue, 21 Apr 2026 13:12:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFAuI-0005iP-MW
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 13:12:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFAuG-003qkM-Od
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 15:12:48 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e777c7-2eae-0a2a0a5409dd-0a2a4509a164-14
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 15:12:48 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e777d0-2497-0a2a45090019-d155dd36bc1d-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 15:12:48 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso2741571f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 06:12:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a18csm42361798f8f.20.2026.04.21.06.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 06:12:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1776777168; x=1777381968; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XBEaOXB90p+Nyqc8OrsnYrTPK6OTDL0dszBzT2+YWEo=;
        b=PvhU9gT35uJPMMHeYZ2neMAiZ35PnX7CfTpO0vnHmZ820xlTRqqgcCYHFYolFFgrtR
         TV4NCRJvBByt1IbD3MqPwDyj4fuscjtjlLtNDSwfqj3xyEuGaYgJLh8g6H6//i5dwvLY
         HjwY+loJHhDCpvvJsjWGdNNEvJERncCesGm8095o598H9rzuKqiEJF2XeX5ibuK7KSnU
         ho1n8kjpJOjJ41DJ2REfvPN2HoWwiMzDYiwJLyXZWKyAEVD4fjitgT8BmEeF0I0ycpqj
         WCe4Q5sRfEWtQ5xYm5KyR5lp1mX5I3WKxCHfqlTVMZ5dkny1X30kqlH61bfkj3sNaR6k
         wv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776777168; x=1777381968;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBEaOXB90p+Nyqc8OrsnYrTPK6OTDL0dszBzT2+YWEo=;
        b=QNgxNQtq1dM1F+N5KXrTcFm4iUlsdpxRdsdVPifqpaz8yAQ6oy02WvheY93FOym0Hv
         j02JWZMUwV4K81KQNVyIQqq3uo0/hHqmO/bQofA5d5GkgCvu5k1txqUxOsALat/xndyv
         T1V+8xixGDhTMPNG27lovbl2IHrt4dyxzkP+j2558mAoMcPUXAZn4b4RZxZNNpRG0FmI
         eRXcD3LPS1h2mckKhkWTQMkj8T+1fwVshx5aJ8UdVG9vulCNo9a+TWifjMNR2bjIvsPS
         9Q408saDbip0R6G4VBnKGaXpun7d/zcI96zorpBImd/QmdT+Qpq0aTUItyCG+qI/F2QB
         Jztg==
X-Forwarded-Encrypted: i=1; AFNElJ/5bqMO/SZi/FLPB67nZNmScXqngyDYyOZKHwgkLqpgJ9flODFvRo2sgetXMZ4/GMebDWNuF6RjwUY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwI6wUC9d/gJBg4HfybUSZOAt+2uR253VilzD+s3UT7q3A+OVXk
	8wJdsiztaz13BgULapOeYdBXDvLs/VIWToCs6KbKf0/htn6yHnArZXcSIcMvjR2bZA==
X-Gm-Gg: AeBDieuVOXS6vLdZ9HuHSOywjcLxHJu4k5xCDVBNDT4H2T4aqIAx7gyKpDbR6YxWyC8
	Vf3BK3Zr0vCAORzJwgob7Fm/LMSz7j8z3T2HOdRq6lQRsZPsTOhKK3Sg+Ji2hJxxjKDG6Ea0B04
	vV8ZPK1TZKb++45Aeiz4+AHgEZ5ItgVJNF6lWbgt65t80z0kbPXOR3KH92n4BDlCADzF7RoeLZu
	moheM0KyIcr+y1TLUlan57IsQz0TP35K60xnCtdyiW8GBYoFpiaSQO/n8WHKf2PpAKT6AP7YDkV
	+55/TrwktygBR/ZK68SVGP+TrymUGWpjxqcAAptYIeQy3z4ijz+vM8x/AjOje/yqUzHvPCv4Dj+
	8kxWGxb0xB/Jxsf1QjpaDVhHWDiti0bOgVlXzzhhbHF+/v5uF3lIf3b0QlpLw13EHfAlXYD72xs
	jKWDzG3F0Zcz59h5pUqDe7cThO86F/6iUZE28DL5sQ5Z8ZRFd0a4xHB849fw5qtYrYqjhLkq7h3
	i/Ry39Nwtk0kZZi9y/VN5WZCg==
X-Received: by 2002:a05:6000:144d:b0:43d:60e:6aff with SMTP id ffacd0b85a97d-43fe3dc63ebmr26754410f8f.15.1776777167957;
        Tue, 21 Apr 2026 06:12:47 -0700 (PDT)
Message-ID: <807ef6ce-5115-402f-81f9-26674ad5dfe0@suse.com>
Date: Tue, 21 Apr 2026 15:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1776340422.git.oleksii.kurochko@gmail.com>
 <e5ffcdecb0ca3c87b46965449601ff20116fecc0.1776340422.git.oleksii.kurochko@gmail.com>
 <f5c7006d-a6ed-4c92-962b-d5f4b27a5c6d@suse.com>
 <62fe5597-4230-48d1-8b3d-35715fc824c8@gmail.com>
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
In-Reply-To: <62fe5597-4230-48d1-8b3d-35715fc824c8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1776777168-93374A53-164CFC87/0/0
X-purgate-type: clean
X-purgate-size: 3182
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5051A43B2EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.04.2026 13:53, Oleksii Kurochko wrote:
> On 4/20/26 10:22 AM, Jan Beulich wrote:
>> On 16.04.2026 16:21, Oleksii Kurochko wrote:
>>> --- a/xen/arch/Kconfig
>>> +++ b/xen/arch/Kconfig
>>> @@ -1,6 +1,9 @@
>>>   config 64BIT
>>>   	bool
>>>   
>>> +config HAS_DOMAIN_TYPE
>>> +	bool
>>> +
>>>   config PHYS_ADDR_T_32
>>>   	bool
>>
>> Why here rather than where the bulk of the other HAS_* are?
> 
> Because it is a little arch-specific now as not all arch-s support it.

Most HAS_* are there to deal with per-arch differences.

> I can move it to xen/common/Kconfig.

Please do.

>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -1178,7 +1178,7 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
>>>       /* Keep the compiler happy with -Og */
>>>       bool clock_valid = false;
>>>       uint64_t mpidr_aff;
>>> -    void *fdt = kinfo;
>>> +    void *fdt = kinfo->fdt;
>>>   
>>>       dt_dprintk("Create cpus node\n");
>>>   
>>> @@ -1774,13 +1774,13 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>>   
>>>   #ifdef CONFIG_ARM_64
>>>       /* if aarch32 mode is not supported at EL1 do not allow 32-bit domain */
>>> -    if ( !(cpu_has_el1_32) && kinfo->arch.type == DOMAIN_32BIT )
>>> +    if ( !(cpu_has_el1_32) && kinfo->type == DOMAIN_32BIT )
>>
>> I'm not an Arm maintainer; if I was, I'd ask for the stray parentheses to be
>> dropped on this occasion.
> 
> They could be dropped. Should be then it mentioned in commit message?

For something this small I wouldn't insist. But recall that I'm not the one
to ack this part of the change.

>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -668,6 +668,10 @@ struct domain
>>>       struct page_info *pending_scrub;
>>>       unsigned int pending_scrub_order;
>>>       unsigned int pending_scrub_index;
>>> +
>>> +#ifdef CONFIG_HAS_DOMAIN_TYPE
>>> +    enum domain_type type;
>>> +#endif
>>>   } __aligned(PAGE_SIZE);
>>
>> I'm not quite happy with all new fields getting put at the bottom, when
>> better options may exist. If the enum was a packed one, it could go next
>> to domain_id (where 16 bits of padding presently exist). The five *_pages
>> fields also have a padding field following them (unless MEM_SHARING !=
>> MEM_PAGING).
> 
> Just to be sure that I understand correctly what you meant:
> 
> enum __attribute__((packed)) domain_type {
>      DOMAIN_32BIT,
>      DOMAIN_64BIT,
> };
> 
> struct domain
> {
>      domid_t          domain_id;
> 
> #ifdef CONFIG_HAS_DOMAIN_TYPE
>      enum domain_type type;
> #endif
>   ....
> 
> It is what you suggested?

Yes, just without open-coding of __packed.

> I thought that it make sense only for struct and unions to remove 
> padding between members.

That's the attribute's effect on struct / union, yes. The effect is
different for enum.

> Maybe do you mean just declare type member as uint16_t or even uint8_t, 
> place it after domain_id and and keep the enum as symbolic constants?

Preferably use the real type for the field.

Jan

