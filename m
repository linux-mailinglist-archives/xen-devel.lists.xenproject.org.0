Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMq/Mju0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8383C48298
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209165.1521278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDpV-0002QO-Do; Tue, 20 Jan 2026 15:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209165.1521278; Tue, 20 Jan 2026 15:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDpV-0002O2-B0; Tue, 20 Jan 2026 15:39:41 +0000
Received: by outflank-mailman (input) for mailman id 1209165;
 Tue, 20 Jan 2026 15:39:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viDpT-0002Nt-7V
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 15:39:39 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a7ae049-f616-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 16:39:38 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4801c731d0aso33059795e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 07:39:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe44b37sm104253375e9.12.2026.01.20.07.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 07:39:36 -0800 (PST)
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
X-Inumbo-ID: 3a7ae049-f616-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768923577; x=1769528377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YgF1C7fHVhgUxnxy9+cYOJzNcc1oO4I1//7mzKOZDqE=;
        b=I7OesFj2C9JREeLcDDB3OWkCZgEhu/+cvEUEvb675PR7pbUHreLrNg1Dsiu5jyVoJ6
         QkeG2k6FkNTMUu+dxPDTuwrQEPpFRaNegU/vkr9ik+cXa5vXjpRFYmyDcnKLa8PgHspQ
         7GocnWcu0kz9rRWItKVTbs1LRbQf7Y4+1FaaVsWWX5GnSlRxXxhxLkuoqs8a5kVth8Np
         IYEzyNigmSQw+zjbMY441BdnHtHXbENvHwAhbsv2LoYNB2WolrA0jRxLI+E/k9tQs+TG
         cRFSnQFM+xJ+3/6yQWiutgwsmVf1WBpwqHerrcgHiOJ2flRNmDX6ktY+VBIDlAOrXiYa
         irQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768923577; x=1769528377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgF1C7fHVhgUxnxy9+cYOJzNcc1oO4I1//7mzKOZDqE=;
        b=GP7470CI5Iv8zgvDo+UKtQXNxJrelyu4LF7xWnx4mdA3dCrp5GyaOxboUZoQ4Bqhov
         r8YMVMQqXILS4Eosd2peq6YG8XePysptni0B1iaVOV0/owHQbndI9XPrGD2c5J56mUyP
         JMwfxpTlkwP/ZdDaGMdGFgIBjEJ1H/MtKcgQcQt+7ja8etm1FiA8QcHuX8T30aadok0n
         9qZ46pr28mU1QttI79BENwhrupFNiSMEowJ9X+eq4tUzFL230kZrJJlq/PLO6QzD4NHx
         l4SPFQL27QONgyZ2RJiuv6TG2i6fL7Zzu8jthEuABzqF3GRzt6zm6GP0GZxOgT+dqBip
         oOVg==
X-Forwarded-Encrypted: i=1; AJvYcCV4E19nFi/mxsK2e+s7clWlOi6IpWpPgqCCPbP2yJ9CRclJuJ9atUbZ/nrCFbXSXiAkNaOCFFedrMc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdFE4PpVxgwKOWnv6HqO/yaW5+LqLh39tFAGHeCU5PJwHeaEeu
	q2vE2qR4I3PL0IqVlfU98TZ8SY78tuRBwEtxgsZNM5cTlU7hBvDgmF/YH3vLPZS5Cg==
X-Gm-Gg: AY/fxX7aU7RO4G7E0kF3AdZ6ezuR5Uzo8QMn4ZlhQ3cGbqe4tmU56BniFwjxpIf6ZTz
	eJGvb3nhL99zuQiO1fiI9V4q7ERvDj32/INC9QSJascY3vyiWGgk/fKPEDMlBfa6j6n5IY7qRh3
	OF2rZGAMeX8Ggw2rnLqGfLHNwpC/+8Wo6qRMsp6yxqRKpbmcPlsi4kpD1a+1+WguEPqQk6pB8yD
	qO1fHEMHcCXkOKdPVzys08iqIpDJZ9ORIzGPgBr/K9ydNv8rOvo1bu1BCIaN5Pcxpxrfi8STW7l
	CBeJ0Xo0fSpoLHnV02COr8Efnk7XgOhKGm1YFlVE8owS3byFrXwnnaJHQK5wmINGyQECoWAfeIi
	rTulWDloVrpPRNGFL+EMpgNc+0/axaolHUi9JLa2fWAQXyRg2g7iJCoRqB5JBwFTtY6oSkV9V/M
	gCDMnhKF2PAhu3RNdV2JNdkUmwgOzRp5wluf4LFEDNH/s8g4iOMDkab/ZNdeRPO7qt9AbpIsY9a
	uY=
X-Received: by 2002:a05:600c:64c3:b0:47d:92bb:2723 with SMTP id 5b1f17b1804b1-4801e30a168mr167775515e9.3.1768923577246;
        Tue, 20 Jan 2026 07:39:37 -0800 (PST)
Message-ID: <da3811f5-d5cb-4a53-87ad-e29b2cdaadf6@suse.com>
Date: Tue, 20 Jan 2026 16:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Expose time_offset in struct arch_shared_info
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260120095657.237-1-ngoc-tu.dinh@vates.tech>
 <3213454a-38cd-4e5d-8a30-853e37f70c18@suse.com>
 <cff32c5b-a085-468a-be26-a858244b228d@vates.tech>
 <7a61a16c-93d7-4cc2-bc47-11e236cf83fb@suse.com>
 <9df8cf47-d3ec-474e-b1c8-7978e55627d6@vates.tech>
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
In-Reply-To: <9df8cf47-d3ec-474e-b1c8-7978e55627d6@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ngoc-tu.dinh@vates.tech,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
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
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8383C48298
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.01.2026 16:27, Tu Dinh wrote:
> On 20/01/2026 13:42, Jan Beulich wrote:
>> On 20.01.2026 13:12, Tu Dinh wrote:
>>> On 20/01/2026 11:35, Jan Beulich wrote:
>>>> On 20.01.2026 10:57, Tu Dinh wrote:
>>>>> time_offset is currently always added to wc_sec. This means that without
>>>>> the actual value of time_offset, guests have no way of knowing what's
>>>>> the actual host clock. Once the guest clock drifts beyond 1 second,
>>>>> updates to the guest RTC would themselves change time_offset and make it
>>>>> impossible to resync guest time to host time.
>>>>
>>>> Despite my earlier comments this part of the description looks unchanged.
>>>> I still don't see why host time (or in fact about any host property) should
>>>> be exposed to guests.
>>>
>>> I've answered this question in a followup reply from November, which
>>> I'll reproduce here:
>>
>> I did read your reply, yet nothing of it appeared here as additional
>> justification.
> 
> Is the new description OK for you?

Which new description? So far I only saw your responses to my questions, not
an updated patch description.

>> Plus I fear I don't view any of this a basis to suggest
>> to expose some host property to guests.
> 
> The only host property being exposed would be the UTC wallclock as kept 
> track by the host (as is specified by XENPF_settime). This information 
> (wallclock from an external reference) is necessary for guest timesync, 
> whereas an RTC which guests can update by themselves simply cannot be 
> used for this purpose.

What the guest can do to its (virtual) RTC is no different from what an OS
running bare metal can do to the real RTC. Running on bare metal, you also
don't have any other reference (without using e.g. NTP).

>>>>> Since there's no way to add more fields to struct shared_info, the
>>>>> addition has to be done through struct arch_shared_info instead. Add two
>>>>> fields in arch_shared_info representing time_offset's low and high
>>>>> 32-bit halves.
>>>>
>>>> Again, despite my earlier question, reasoning of why two halves rather than
>>>> a (signed) 64-bit value isn't supplied here.
>>>
>>> This was also in my last email:
>>>
>>> Both are just for easy consumption of the time offset on 32-bit guests.
>>
>> I don't buy this. I should probably have replied to this effect when
>> you first wrote it. {,u}int64_t is hardly a hurdle anymore there. Nor
>> would I expect any halfway up-to-date 32-bit guest to manage time as
>> a 32-bit quantity anymore.
>>
>>> Unsigned is particularly because these are only parts of an int64_t (and
>>> therefore have no signedness themselves) and I prefer to let the
>>> conversion happen after reading the two fields.
>>
>> There may be benefits to this, yes, but imo they want to be spelled out,
>> rather than left vague.
>>
>>> (Follow up: Also, the alignment of int64_t differs between GCC and MSVC
>>> compilers. Using int64_t here would change the alignment of struct
>>> arch_shared_info)
>>
>> Does it? For which target and in which way? This would, after all, render
>> other uses of {,u}int64_t in the public headers problematic as well.
> 
> For the x86 32-bit target, the Windows ABI uses 8-byte alignment for 
> (u)int64_t as opposed to 4-byte for the System V ABI [1].

Oh, right, I should have recalled this. Iirc there was an unwritten assumption
that for Windows the public headers may need some massaging.

> Most of the 
> other uses of 64-bit integers look to be manually aligned and/or using 
> (u)int64_aligned_t (I haven't looked at them all). I can switch 
> time_offset to int64_aligned_t and avoid the issues above.

Except that int64_aligned_t can be used in __XEN_TOOLS__ guarded areas only,
for not being possible to make available with plain C89 / C99. So here we're
working out a reason why the field may indeed better be split. Albeit as
said, other areas of the public headers use {,u}int64_t as well, so maybe
this still would only be a pretty weak reason (and you could make sure the
field is properly padded for the x86-32 case).

Jan

