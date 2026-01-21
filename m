Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBiHFGjPcGkOaAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 14:06:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B613757503
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 14:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209719.1521643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viXuv-0000f3-MQ; Wed, 21 Jan 2026 13:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209719.1521643; Wed, 21 Jan 2026 13:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viXuv-0000ct-JD; Wed, 21 Jan 2026 13:06:37 +0000
Received: by outflank-mailman (input) for mailman id 1209719;
 Wed, 21 Jan 2026 13:06:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viXuu-0000cn-Kp
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 13:06:36 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 012f1942-f6ca-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 14:06:31 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so62638845e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 05:06:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e8caceesm308018595e9.13.2026.01.21.05.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 05:06:30 -0800 (PST)
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
X-Inumbo-ID: 012f1942-f6ca-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769000791; x=1769605591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uwKgYVO7Zu6VftyCo1VUWHNj5/MR7CPIRmVZ475YIwY=;
        b=LlUae3S3PTjBqFM2B6ggVv0FncOwlamWXkIg0sKfBb6OmATLHy6/ruj7dDL+TvZ2R2
         DqT5R4bKuCWZ5uWwACFlz6+KLM1Ip23M6KtxrpgGpZVC1WUCJdbaDOEmbEi520xdhfqS
         J5sECN3HXVu12x/N+gCBmX9msjAnicKVU7rWvoyZhWqO8x6wp730/9CS6ODp4pQ4iSXy
         fXM2OzKwpfEHd1SSkf+kO9o3jF5AMvVyENHzgLM5o8kOzSvVjklSVBEEm0X/jYlLU/db
         Slt4SIzGLL5EXzEhBYFguar5m1GpNJ2ou8+wn1v9OfjGv5jG80EbyT1cSFTkTxY6HcBA
         SILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769000791; x=1769605591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwKgYVO7Zu6VftyCo1VUWHNj5/MR7CPIRmVZ475YIwY=;
        b=QuRGGrAGsjk3+pF0LKbVG9NY7Q6YkADTV+R30k6V8JArlfZLSUP4UXyYzThzHWQ4Id
         kQbfAUjgkTFFkORYyTvLncd1nDRbZ0014KGqNsVKtoFqHfOcDfWSjDa4whjGZRKsDv5N
         GZ30B/pma5EFOHeY2PW+f/5vQvdSEm8BswSEiWlJKYKT7lV6YpzXMyeaSZ7iBY7OdcV2
         DbOR6BVhmR89WQKcFO88CeeI/bkQf6sBufMMea+u8d8CJQlIHac5sioTjrJHk8LiuLw9
         DTPV+Qr7sAy2Z/BFy598YYqpBF/7qRPSfILLDAqi3u6mSsvLISzm0cMCL5yp7HLBVKwr
         XjdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtO+Eq6CRYZliATpU3BCwY7LUDnOFiykpaVTINndBMAQY+aOjrF3reuzyN45w8r1ZLZPX0M1I7Abw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzl/Ezj/v6lMQqJOVpJHwKIOBRPTpYoHl9kkkbdMeh2/1zpkaf+
	wLnMh8gRYKVLgBpxJBqkWdpknF3DyIdu51OFiYzaB0tefnIqSVSeGKKVV3RuYzseyA==
X-Gm-Gg: AZuq6aIrjfpNxP46shOkpFeLxDoUHGiuGpPOOPopfXsmZSGCFg3eJ8goyeuZamwTqPb
	mBZxXhaNuEbV6wgPgPKTM/KlB4kpC2n5aHq2/bhJ5cfutAIj4xs4vPObzzvtGqtyuKhm7+N8kt5
	/6jvYyVyhK01vKfMLlDZBTIpvSqxd1pqVGviSot5DvAvXfRSOwGUSfcs5fMqpyIynv+7cFb08is
	FHLhGHUNqiQrdK/2+Atd0h+1XBzzwiVyCw6jr9GMMn8F6X5azbLV5gVbmn8cq9NTvH49r5AkOnc
	lT8eGUt+kgWVSi64nzO47icVU4UkfezNlOuqjllyNX6sXQPlzRdPMJ1Fzu7z9OjbvpGZNw9XfqM
	4wQbN/s4Uka+KoFGFqhI7GugzW1uGe7YLoCMfv7G792fOSKNOf4ep28nJaKw7RjrMlBZPtAvr+T
	AMZ0VLnyHNLwF4n5im3RkqvmUE/eMsjK/1w5XIFQV2MFTpUhu8aCy2Q62bA7cSvA3RgizQJRZHK
	wY=
X-Received: by 2002:a05:600c:458c:b0:47d:6856:9bd9 with SMTP id 5b1f17b1804b1-4801e3342bamr187365965e9.23.1769000790611;
        Wed, 21 Jan 2026 05:06:30 -0800 (PST)
Message-ID: <169c3509-b2fe-4a5f-8184-0aa9c089ccce@suse.com>
Date: Wed, 21 Jan 2026 14:06:28 +0100
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
 <da3811f5-d5cb-4a53-87ad-e29b2cdaadf6@suse.com>
 <a13594d1-17df-4f45-aebc-b9978f898d8a@vates.tech>
 <637ad4a0-bc8f-4e75-8906-643f28f94a2b@suse.com>
 <3bde98b0-5563-4e17-bcc5-c622863d3b07@vates.tech>
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
In-Reply-To: <3bde98b0-5563-4e17-bcc5-c622863d3b07@vates.tech>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: B613757503
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.01.2026 14:02, Tu Dinh wrote:
> Hello,
> 
> On 21/01/2026 10:17, Jan Beulich wrote:
>> On 20.01.2026 17:06, Tu Dinh wrote:
>>> On 20/01/2026 16:39, Jan Beulich wrote:
>>>> On 20.01.2026 16:27, Tu Dinh wrote:
>>>>> On 20/01/2026 13:42, Jan Beulich wrote:
>>>>>> On 20.01.2026 13:12, Tu Dinh wrote:
>>>>>>> On 20/01/2026 11:35, Jan Beulich wrote:
>>>>>>>> On 20.01.2026 10:57, Tu Dinh wrote:
>>>>>>>>> time_offset is currently always added to wc_sec. This means that without
>>>>>>>>> the actual value of time_offset, guests have no way of knowing what's
>>>>>>>>> the actual host clock. Once the guest clock drifts beyond 1 second,
>>>>>>>>> updates to the guest RTC would themselves change time_offset and make it
>>>>>>>>> impossible to resync guest time to host time.
>>>>>>>>
>>>>>>>> Despite my earlier comments this part of the description looks unchanged.
>>>>>>>> I still don't see why host time (or in fact about any host property) should
>>>>>>>> be exposed to guests.
>>>>>>>
>>>>>>> I've answered this question in a followup reply from November, which
>>>>>>> I'll reproduce here:
>>>>>>
>>>>>> I did read your reply, yet nothing of it appeared here as additional
>>>>>> justification.
>>>>>
>>>>> Is the new description OK for you?
>>>>
>>>> Which new description? So far I only saw your responses to my questions, not
>>>> an updated patch description.
>>>>
>>>
>>> Maybe my last email wasn't clear, it was in the part marked "Follow up",
>>> reproduced below:
>>>
>>> Xen currently does not expose the host's wall clock time in shared_info.
>>> This means while shared_info can be used as an alternative to the
>>> emulated RTC, it can't be used to keep the virtual wall clock in sync.
>>> Expose the time_offset value in struct shared_info in order to allow
>>> guests to synchronize their own wall clock to that of the host.
>>>
>>> This is needed because on Windows guests, the PV drivers don't control
>>> the timing of RTC updates, as this is done by the kernel itself
>>> periodically. If the guest's internal clock deviates from the RTC (e.g.
>>> after resuming from suspend), a RTC write would cause time_offset to
>>> deviate from the supposed value (timezone offset) and thus cause the RTC
>>> to become incorrect.
>>
>> What I still can't extract from this is why Windows running bare-metal is
>> fine but Windows running on Xen's vRTC isn't. If there's a problem with
>> our vRTC, shouldn't that be addressed there?
>>
> 
> In this case, it's not because the vRTC emulation was wrong, but rather 
> because Windows's internal wallclock is not Xen-aware

And it shouldn't need to be.

> and needs to be 
> synchronized after some Xen-specific events. So it's more of an 
> accommodation for Windows guests.
> 
> Also, Windows timekeeping integrates closely with its internal time 
> service, which assumes a NTP-like interface (and thus an external time 
> reference). The current way of time synchronization in the Windows PV 
> drivers doesn't work well in this model, which is why I'm looking for a 
> way to get the external time reference from Xen.

Are you suggesting then that plain Windows is fine, but Windows with the
PV drivers isn't? That would look to be an issue with the PV drivers then,
wouldn't it?

Jan

