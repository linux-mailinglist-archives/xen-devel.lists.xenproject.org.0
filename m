Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AoZMsG1eGlzsQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 13:55:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299F2948A8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 13:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214631.1524848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkiaw-0004f6-1B; Tue, 27 Jan 2026 12:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214631.1524848; Tue, 27 Jan 2026 12:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkiav-0004cp-Ui; Tue, 27 Jan 2026 12:54:57 +0000
Received: by outflank-mailman (input) for mailman id 1214631;
 Tue, 27 Jan 2026 12:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkiav-0004cj-CY
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 12:54:57 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 609ca686-fb7f-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 13:54:55 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48068ed1eccso6231725e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 04:54:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066be7404sm64991775e9.1.2026.01.27.04.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 04:54:54 -0800 (PST)
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
X-Inumbo-ID: 609ca686-fb7f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769518494; x=1770123294; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VjfiHNnrpGC8CDoMxoZHu7UqDDcLfDorH4rBeA6qkuA=;
        b=Ye/iiUkoejGW96Ivr2UwJ8YwHkcrquwM3EM0tnVQUQ81ZWdAqUo+Zb94otRcJgFR/y
         l5/IhRedIOmdCWmYGK/0r7y4vc2Fm+n8IEhouzkeKop/tJ6eR9wgzuDxodd2UUu21jNA
         /3qWZu0UscioD+Vx3wt+3zX7uQ8dLGjMA1kRK0MJ6kQeytWvIsN5YUqJx+y22VHRKvqz
         HZUGedajWGnZaHdbzm4xtQe03BVng2AxW6ejJ78ja9cSJyvmiCfBQHLhBKn48G0y2baf
         scxkbbiuq2SxQVraM42Dod6sO1XX03UkNI1eRxSET+3FMxnxodkHxVI4KwW7ITPE+6kD
         xI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518494; x=1770123294;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjfiHNnrpGC8CDoMxoZHu7UqDDcLfDorH4rBeA6qkuA=;
        b=V2bpPizU6ltFRgZavcNhhvMCy96TC/NC4NTP2+YbESWtnV0HeKRJA/8U63fU1f3hzh
         ey/LBaRQOA5EGplHjby1mXIeaJfI23TYHxmMtCyPsgHpiXFXVXYv578zSUf7P+gpZ9mK
         cUEvISxg4YpY0lgN156XJIqZMucWJW4JoUEiETPYBcxygsWqwonpEPp25O4d4t/3QE8M
         PDvy245TACzkNDiKu8A2Ra/kViPfhUh48hDIWApUpCpusxKoTrTDBLeIiqiltCuQfBme
         TyAjys78Ah2051xRcNM3TRIw5Ukz0q252Qzt5E6JIKVp41hK1u/6Bq7Hv/vYc9HtTKEY
         TNzw==
X-Forwarded-Encrypted: i=1; AJvYcCX5kFJ+4g6LTnOCWm2MTidZBRBwPnfK3QyWbh9e5b+KiTfcYzy2tyrM6TMSXCr1pyA5wn4sUU6h5NQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXux/NSysqY2W2N8lwRzFngsPWuB+XlSHZxrIJ9sQ8IgIruLxu
	ucLTvP3Kev1BN6JxTCfkWK0P3aS732WHAsfsi2jx/OfrLiyv3rzkf7Prtk3qEtCrVw==
X-Gm-Gg: AZuq6aKRbkcNBlS+H8tY/3LRFOIMXYnt8s3IWkNTjF1lgM1x+M7bx8zD43idez0XBxG
	BI6U4EDRKt3CyMscxxkuPCBVnFJlFTJY19yzHMhpg5YP5s0XOBuM+tNtgughamwsiLpVA3Z/n2C
	zuOTsRQny52AmSEaElk/2pYcsFoBHPYh60m0WATE6JMeb6WgQB7STTxpDV/ogaFZ06/Qcv1RDuN
	NN0cAcg8N9Q7Xoq7KgTDTmyiFjyUvkLJ5tZrxVgSk9VCZRqZzXFmgAVMYjDmcOQAlR+dlggN/7o
	wxwHWjOiTtxA1byK3eiC8xLGxt79feHDJP6di5bS91DPD4snknKpbFfXEvOGiXVP50b3yEEvJ76
	Nbi+IS1e2G6o+ruWOLNKOAYMVc47cgGdJwyFYPgBmmWD9U0El7n7fjX00OQWvzWyMbEVfeUJMJ2
	ObtgTxzhVXjBkVscN2Qc0/mfOY/QwEP2kVoVQ2JjKzo644b00uR1uLwEinHYjPYCqQ6d+TrFwqb
	Bc=
X-Received: by 2002:a05:600c:4689:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-48069c55610mr19414875e9.19.1769518494283;
        Tue, 27 Jan 2026 04:54:54 -0800 (PST)
Message-ID: <98758ea8-8add-4879-a28c-bd8d6d898bba@suse.com>
Date: Tue, 27 Jan 2026 13:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] x86/cpu: Cleanup for NX adjustments
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <92bff6a4-8fb0-4992-8305-8386f480de74@vates.tech>
 <658c0167-c3df-4acd-92f8-8c3f022ae453@citrix.com>
 <e5f02207-4f9f-467a-8c25-0af42bf81551@vates.tech>
 <08d9aeaa-d503-4e75-863b-dee3b46c42a0@citrix.com>
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
In-Reply-To: <08d9aeaa-d503-4e75-863b-dee3b46c42a0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,gitlab.com:url];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 299F2948A8
X-Rspamd-Action: no action

On 27.01.2026 13:29, Andrew Cooper wrote:
> On 27/01/2026 12:09 pm, Teddy Astie wrote:
>> Le 27/01/2026 à 12:39, Andrew Cooper a écrit :
>>> On 27/01/2026 11:23 am, Teddy Astie wrote:
>>>> Le 26/01/2026 à 18:56, Andrew Cooper a écrit :
>>>>> I was hoping this to be a patch or two, but it got out of hand...
>>>>>
>>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2287078891
>>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/nx
>>>>>
>>>>> The branch has one extra patch to fake up the firmware settings being set to
>>>>> Gitlab CI, not included in this series.
>>>>>
>>>>> Julien: This ought to suitable to rebase your cleanup on to.  In the end, I
>>>>> did the AMD adjustment mostly because I needed it to test the correctness of
>>>>> the prior cleanup.
>>>>>
>>>>> The final 4 patches are tangential cleanup which I've kept out of the prior
>>>>> work in case we wish to backport it.  Everything prior is relevant to
>>>>> untangling, and mostly for the benefit of the AMD side.
>>>>>
>>>>> The early patches are hopefully non-controvertial.  Later patches are a little
>>>>> more RFC, and in need of further testing.
>>>>>
>>>>> <snip>
>>>>>
>>>> Tested on a Intel machine with "DEP" disabled, and "Require NX support"
>>>> disabled, I get a pagefault in hpet code
>>>  From above:
>>>
>>>> Julien: This ought to suitable to rebase your cleanup on to.
>>> This is cleanup only.  I've not got the bugfixes for EFI boot yet, so
>>> the behaviour you see is still expected for now.
>>>
>>> Although, thinking about it, it might be better if I try to merge the
>>> two series, so everyone can test the end result.
>>>
>>> Thoughts?
>>>
>> +1
>>
>>>>> (XEN) Xen version 4.22-unstable (tsnake41@(none)) (gcc (Alpine 15.2.0) 15.2.0) debug=y Tue Jan 27 12:06:46 CET 2026
>>>>> (XEN) Latest ChangeSet: Mon Jan 26 17:53:45 2026 +0000 git:6491616ddd
>>>>> (XEN) build-id: 035024497a4cadebf9e5a2ded61f63ac
>>>>> (XEN) re-enabled NX (Execute Disable) protection
>>>>> (XEN) CPU Vendor: Intel, Family 6 (0x6), Model 60 (0x3c), Stepping 3 (raw 000306c3)
>>>>> (XEN) BSP microcode revision: 0x0000001a
>>>>> (XEN) microcode: Bad data in container
>>>>> (XEN) Microcode: Parse error -22
>>> As a tangent, what's going on here?
>>>
>>> This is the first time I've seen the error outside of my own testing.
>>> Is it a container you expect to be good, or some leftovers on a test
>>> machine?
>>>
>> I'm trying to load a Intel ucode (taken from Alpine Linux intel-ucode 
>> package) using `ucode=intel-ucode.img` in xen.cfg (UEFI direct boot).
>>
>> Many distros ship microcode in a single CPIO image with e.g 
>> "kernel/x86/microcode/GenuineIntel.bin" in it.
> 
> Ah, that's a known thing that doesn't work and has never been
> addressed.  People have been complaining for years, but not on xen-devel.
> 
> It's also the subject of a documentation fix that is still pending (and
> now needs yet another rebase). 
> https://lore.kernel.org/xen-devel/20251215153245.2675388-1-andrew.cooper3@citrix.com
> 
> Now that the ucode boot module handling is clean, we can probably try
> both a CPIO and raw probe when given a fixed module.

What does "raw probe" here mean? "ucode=" with a proper ucode blob specified
has always been working for me ... (In fact I don't think I ever really tried
the "scan" approach.)

Jan

