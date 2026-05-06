Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAoOMt8J+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:29:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309114D89D6
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301407.1575691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYYl-0005LX-DS; Wed, 06 May 2026 09:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301407.1575691; Wed, 06 May 2026 09:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYYl-0005IZ-Ab; Wed, 06 May 2026 09:28:51 +0000
Received: by outflank-mailman (input) for mailman id 1301407;
 Wed, 06 May 2026 09:28:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKYYj-0005IR-KI
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:28:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYYi-00H8Pc-Te
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:28:48 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb09cf-2eae-0a2a0a5409dd-0a2a4504d74e-2
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:28:48 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb09d0-1dec-0a2a45040019-d155802abdd2-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:28:48 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-488b0046078so54061365e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 02:28:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e5312de76sm12355285e9.21.2026.05.06.02.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 02:28:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1778059728; x=1778664528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sRKvRoh/wBspl5jeFTSO1nMsWuXd1oDw5oWMaPZp3V4=;
        b=FV/PpVOwx970c3DugWfkP7EJM6vmbKLYdgFiH5ulQo5KASJ2GwfHLNgoSzEiezfO7N
         urbWAh+ibEnxGD7UYxK0omarlovXbWgHlTx11EKw7Gwy9G44H6Rd0xcDc0DBzuOMaQ1X
         /5ZopeSmDvN7aV+7L/zSTUBuH8qb6ca1YscgTmjtUB02SBphM+wst5V4QsKQFhFOOPhJ
         qjXpAjo5Sckr2EMORgHta5ivfMm1u2L60gZeSGJy2hRaOb+xST5Bj3YHP/p9CsrZEtO5
         8L1LTXCVCafa+/CXRN43mB/i4J3+0rRwFK2jXgGt7t/FNmBZFDe1VC2p49JjzRsiwzjy
         VdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059728; x=1778664528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRKvRoh/wBspl5jeFTSO1nMsWuXd1oDw5oWMaPZp3V4=;
        b=bYcYw2XSMC/PX1a560EMy2ED2An00Stb0tbgeb33px2YzVTyXd64LiO05oxwYKqUPP
         hNXE+9vWi+V1uiW5NYMmnFl3ADACna8iqQxn5BctPNXT9zqc2C8UteH6iOpte2w7sIHb
         9L3IHsZc//zJyMk4wqjbqKmT5hdG4dEatV/fwyBSezSTLnqqJ5s3euEjVrF7o6yQTM0E
         hADyKtgS/uPzH06JMUKAOoCiMDyN8kam7b5X14y3S3LQjUiR6IF4FmE5hbrwrCL+QCL4
         Op74xYZH476V9/f155XdyDPiqkyYfhaofGND6H93mdsrW88ghhi1JGjDEnxNXsE4X5tM
         fT1g==
X-Forwarded-Encrypted: i=1; AFNElJ8itAd99kLqA6QwtLEUOV9Qu2lZaOkXuB8DIW/sQC+GibjuqN7vjUmOiQnmiAWiQ0uf/v5Rc/nLX3w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6m7vv1i25dSUeo5VT6EPUkuM84PPyUHKkuLrsuJP99Qnha6t4
	dO20cVXayi07LWYENK/vtCVbAuaQPWOcge2i145L7z/zc80ZDtuaPLgTspJl2/cOuA==
X-Gm-Gg: AeBDiesavsLgXGJCvdmHldhYSTB0WxPaGaVzOpSGEZiraPUV6F2Co2ktDDghHZoQopV
	Opr5XwcWML2F7w+GR4ioWZrhNWidMdjA//hVkRtOZ86XKzll7532JHmkORtxkF1y3OvhgIfUEH2
	zsIRP5hPjDp7BgGkvBrmwM82ex+cMUqV4qcuHStfbbTXs6/tSDUBNnhKAaeYnY1wSbCOr9nEzV0
	9nV9Sr8ww4x7SitGYYFzFJmpUR5+AuutfPUnnYeZ/Y4ojWJAkAmdw1TfkgupdkmIyB01DVqiFyI
	mgzzMpMpKA5MJn2MWGZtRnj0wpJz6wpMa9l8PBk5S4RZu99QMHRh4GUYNBpJWjuUk3UQer892Wh
	r6oyNR93PivUJ2qcsdKId3Krw5nlGZw6RvPPSfgscWCdiPiRI2m3dIOUpitISVG2EZms1is9pU+
	bTJWvqXCCbZ0l5iZmnSe3w17k7CIWfmJWoAgTqgwE+RI3YmWSdo5lykFVDR12aofrLaxf/cdIkc
	6dXFvxP/74Ynrnk/O/fILgx+Q==
X-Received: by 2002:a05:600c:a30a:b0:48a:58ae:9938 with SMTP id 5b1f17b1804b1-48e51f37f28mr31294835e9.19.1778059728239;
        Wed, 06 May 2026 02:28:48 -0700 (PDT)
Message-ID: <37e3f81b-927b-4e58-9f8d-83086e35fe39@suse.com>
Date: Wed, 6 May 2026 11:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu/amd-vi: do not zero IOMMU MMIO region
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260506073719.40075-1-roger.pau@citrix.com>
 <20260506073719.40075-3-roger.pau@citrix.com>
 <0035d666-2ad3-44d8-a2a8-e612dfd10503@suse.com>
 <afr_RYYMyJEGkNgP@macbook.local>
 <4dc2025e-0eb3-41e4-8bb3-a28b0dc560c7@suse.com>
 <afsH6bwxikesmNOk@macbook.local>
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
In-Reply-To: <afsH6bwxikesmNOk@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1778059728-2A9623FF-4246A0B2/0/0
X-purgate-type: clean
X-purgate-size: 2130
X-Rspamd-Queue-Id: 309114D89D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 06.05.2026 11:20, Roger Pau Monné wrote:
> On Wed, May 06, 2026 at 11:17:25AM +0200, Jan Beulich wrote:
>> On 06.05.2026 10:43, Roger Pau Monné wrote:
>>> On Wed, May 06, 2026 at 10:28:52AM +0200, Jan Beulich wrote:
>>>> On 06.05.2026 09:37, Roger Pau Monne wrote:
>>>>> @@ -1381,6 +1372,11 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>>>>>      if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
>>>>>          return -ERANGE;
>>>>>  
>>>>> +    /* Read current control register and forcefully disable the IOMMU. */
>>>>> +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
>>>>> +    disable_iommu(iommu, true);
>>>>
>>>> Don't you also need to pre-fill iommu->features?
>>>
>>> Indeed, that's done just ahead of this chunk, in the
>>> get_iommu_features() call.
>>>
>>>> And with that field's use in
>>>> disable_iommu(), won't we be at risk of leaving stuff enabled which we are
>>>> entirely unaware of?
>>>
>>> Possibly, yes, that's always a risk.
>>>
>>>> Even if we fully cleared the control register (which
>>>> would eliminate the need to fetch features), down the road a 2nd control
>>>> register could appear.
>>>
>>> We do clear the control register, it's indirectly done by us setting
>>> iommu->ctrl.raw = 0 after the disable_iommu() call.
>>>
>>> I did wonder about just doing a write of 0 to the control register,
>>> but I think it's best if we try to gracefully disable the features (as
>>> done in disable_iommu()), and then reset the cached control state to
>>> 0.  Future writes to the control register will clear any bits not
>>> directly set by Xen.
>>
>> Maybe better to explicitly write out that 0 right away, even if you want
>> to keep using disable_iommu()?
> 
> Yeah, I also considered that.  So after disable_iommu() set the cached
> control state to 0 and also zero the control register right there.
> Can do in the next version, unless there are further objections.

Well, as said - I'm wary of fully dropping the memset(). It may help now,
but it could easily cause issues later.

Jan

