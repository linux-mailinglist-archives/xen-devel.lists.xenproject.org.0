Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNSIKBcJ+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:25:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E7A4D8932
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:25:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301382.1575664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYVW-0003Wr-Dv; Wed, 06 May 2026 09:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301382.1575664; Wed, 06 May 2026 09:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYVW-0003Tt-B9; Wed, 06 May 2026 09:25:30 +0000
Received: by outflank-mailman (input) for mailman id 1301382;
 Wed, 06 May 2026 09:25:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKYVV-0003Tn-2R
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:25:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYVU-0093iS-F9
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:25:28 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb0903-5cb7-0a2a0a5109dd-0a2a450692ee-14
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:25:28 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb0727-7371-0a2a45060019-d155802fd510-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:17:27 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488ba840146so54179675e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 02:17:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e538acbfcsm31135355e9.8.2026.05.06.02.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 02:17:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1778059047; x=1778663847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yERqk4GU8fz5BMwqwtQXTIg+5GfnuBBDmlZ21MAHYxs=;
        b=WHqzj2Ep6u9F0ex/K3oKWSvlInCfV0ixOE9vSco4LKJih59rxUj1YhtJsVN9q8TLS6
         zxbKMqWDotr9JGEH6e3S+JN28R6VTs4WiKDe83HNNdX7mCMvm1OxoXfkIbt3Ci4mF8xl
         0C9LiaU8dPVTQFYZeOaTWJZLz1+b79dhbhcDDOhYPkajeJjf47u+SMTYbvbFNwtylojT
         ifiE0NHoFiVIvvWgZ1CTQ3uLJ+2IXopd41ZtG8LaANQSnrE5GmJHgTLCO2TXTqUpSqHe
         5V3SnlcR/z7d+dDreaqvBtSboTRDO2LmOw+FTV0U+kFclPBdQzoBySl3uuenKcJQaAaq
         kR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059047; x=1778663847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yERqk4GU8fz5BMwqwtQXTIg+5GfnuBBDmlZ21MAHYxs=;
        b=EsAhtNtOwGa+Q04nFxzhwPNTruCFMdZKdoEyLskYqESzKBhhzcLosMzwhL6JgqmzBi
         8EbT9OUJli160zoXBbGy++eA7A2qoUTzhpFAKYxkgGaCFedQHUL+yxNuan5TGwJlY5M/
         4QJG5kNB6jt4oVkoMFV4fOloKi1OaR39m9rOw85KIpQ9OBNcqX6bALxkcB2BvYdINcXZ
         dT4qsHjbP8Uv/ijd8hnaz9fJmLFgGHMlxkHi9fKwtkT+WPyu3QEfoe3w3/eL13h9TqE9
         9759cqxj2SreebjtCYOeCbeBU72jZEojavcNAHtwI60LqpcQmCizmZo1j1XvTKahuE2u
         5xUw==
X-Forwarded-Encrypted: i=1; AFNElJ83fpQtyb4S6dHVx7DY++ZdH52lwgZQsudCnriWbtFb1bzuNnZzX1nYV1DQrHMieVJ+z2/1/r9epWg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKQHR4n6GZTD5eU34+S0Q/dASKbQ7LANlyNGjsZ5226cMCrBg4
	oAS+2FjD02Zbo5b8E40jGEyDusQoiVAyYC3mcUqIpClXeJFFlDfJW7AArP/5+JT+vA==
X-Gm-Gg: AeBDieuw+6agEn+e+jVCnPP/BvY+j5w9CXTqQ7KoaIzMSw+Cd/KisIX+kpkHtKOrFYp
	3iyMzs2t1xH7XmRcVJDjCbjU0v6ovVUVnmA0a5cbGMThfpEdGkI4HTQ2hm+o9kePobAViZV16nO
	0gzy5x3PUyOMZlS12N1Wstx/8oU+ZYqslScV6aAPhm8Zb6cxGHNdLG26ni+uGSOGv6hMWPVjkxv
	fPtVszsrz6IojUoZncjHKD22jg1/xIWk3D3ErIWGpNxA01k54LtIE3RZyontS+0vPYKZFkDxG50
	S4jPro/j2Je0tt7C/cWd4GHoN7wxluXfVa74TmtqzdTTJtsgfsqyk9MT3bNkB8IZsASkPs8fd7z
	YKzHxPi4sOcm0J7lgF4WMnFSKBA5ko4GQL7bVi2rnFVvPo+9g0Ruth3QR0XlRUZeF8R+XONvqqu
	WRwrbw3BypUZZN5k9x+kYQ57/zNUVNkSbEotY1dl3pz+4lxg5juKL6USCIQJOTMcEedYkWajXzN
	r8KbkeJlQGeNb5jPrM7xCJ9Yg==
X-Received: by 2002:a05:600c:3548:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-48e51e0a6a2mr43618615e9.4.1778059047336;
        Wed, 06 May 2026 02:17:27 -0700 (PDT)
Message-ID: <4dc2025e-0eb3-41e4-8bb3-a28b0dc560c7@suse.com>
Date: Wed, 6 May 2026 11:17:25 +0200
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
In-Reply-To: <afr_RYYMyJEGkNgP@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1778059047-87F7BD75-ED28DE7F/0/0
X-purgate-type: clean
X-purgate-size: 1615
X-Rspamd-Queue-Id: 09E7A4D8932
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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

On 06.05.2026 10:43, Roger Pau Monné wrote:
> On Wed, May 06, 2026 at 10:28:52AM +0200, Jan Beulich wrote:
>> On 06.05.2026 09:37, Roger Pau Monne wrote:
>>> @@ -1381,6 +1372,11 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>>>      if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
>>>          return -ERANGE;
>>>  
>>> +    /* Read current control register and forcefully disable the IOMMU. */
>>> +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
>>> +    disable_iommu(iommu, true);
>>
>> Don't you also need to pre-fill iommu->features?
> 
> Indeed, that's done just ahead of this chunk, in the
> get_iommu_features() call.
> 
>> And with that field's use in
>> disable_iommu(), won't we be at risk of leaving stuff enabled which we are
>> entirely unaware of?
> 
> Possibly, yes, that's always a risk.
> 
>> Even if we fully cleared the control register (which
>> would eliminate the need to fetch features), down the road a 2nd control
>> register could appear.
> 
> We do clear the control register, it's indirectly done by us setting
> iommu->ctrl.raw = 0 after the disable_iommu() call.
> 
> I did wonder about just doing a write of 0 to the control register,
> but I think it's best if we try to gracefully disable the features (as
> done in disable_iommu()), and then reset the cached control state to
> 0.  Future writes to the control register will clear any bits not
> directly set by Xen.

Maybe better to explicitly write out that 0 right away, even if you want
to keep using disable_iommu()?

Jan

