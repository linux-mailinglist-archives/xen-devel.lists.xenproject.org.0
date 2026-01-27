Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFMWN126eGmasgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:15:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA2194BA5
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:15:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214664.1524888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkiu2-0008N6-3W; Tue, 27 Jan 2026 13:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214664.1524888; Tue, 27 Jan 2026 13:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkiu2-0008LA-0D; Tue, 27 Jan 2026 13:14:42 +0000
Received: by outflank-mailman (input) for mailman id 1214664;
 Tue, 27 Jan 2026 13:14:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkiu0-0008L1-7Z
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 13:14:40 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2231d552-fb82-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 14:14:38 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so3665862f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 05:14:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1e7156dsm38662355f8f.20.2026.01.27.05.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 05:14:37 -0800 (PST)
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
X-Inumbo-ID: 2231d552-fb82-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769519678; x=1770124478; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xDAArseA7Vjx9JvMf1vXBGecAWo4qLCwFtM/BqRgQkc=;
        b=IKYR/CBjQMPuAoLLZJVyz+rskbPm6sY0+eIvLyfW+XiA4OCA9JpFhw1+m9w1+2FOwp
         urvr4reCtWzfCCOQwcujb+cxLxgNUlMtykSlFbOp5jvDoJ1XTYipfHNGYxAbb0KOgfSt
         RF8GY/FGuaR8j5yQgCul6Ed+5+3xC4VKnwnea2oLR9hl94uLGZFGRJ6V0Lp6KWUSzk3Y
         swVCCorJ6BBmx642MvNkjswsBjJwMYsDCTRdMPTy23kIZNkfPitMmXKab3zdDvWLeIa+
         l0vXFe7mx0QwCDaXRa+dwtSAvU3kj7u7ZwglbJNzkjyLYrYG0e5xa7qqy5c87PsIPJXJ
         CxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769519678; x=1770124478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDAArseA7Vjx9JvMf1vXBGecAWo4qLCwFtM/BqRgQkc=;
        b=vfGnJshozQ+y3p0eVv/o8f8OjUGpSSSk/jpYincqOzsf9oWNLTuI3PoNGHUZ8fY9Ep
         xSRb8PsEFDVOZzHb/acM7JiuMdDt5fzxbRywEz8N2DWi6vssqYehZeRn+yjZ+M/0h1sW
         2vKs5LOLBnpAbdRG0cHfmcYzemjRyTTM/01fJ2JMUUIpadrwPs8M+zdXu/crVA6ke2B3
         0taYGKkU/zGOLKVKu7clgDbbIWfOZuUVhpm2mo2vhUP5DlupCeto6PXkYfnQIEzhJrmP
         D+Cf1ZknelrujUULUwkUFv0IlykViolTJLefXN++t+WpGYV1KsAbve1bgj9+p9Wp1Sgz
         f+RA==
X-Forwarded-Encrypted: i=1; AJvYcCVKQ23o5PAmNyOxbyGTRKRAXuQkIo5Df+0MUMY1IYpfi7ya/pCssFcb+oNJ+IotqkSUcxnJB0CNqlU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+8vhbVdTRC6ZeKXX70UICZKiJJOCf+vnAZVIvkXdPGQZFiLUu
	SfE8ZI8GpHt/vBZEbsoKACW+EDGxfaVYUNWx5+lJ8uxWWCkxDzVsWWNF4MN9UMQEPg==
X-Gm-Gg: AZuq6aJoJ38Tv5insZcq0BHftS7jzYTXR5xjFHiELTMkU7FML2X8geX9XZDCmpW9/FU
	6qO/b69PRcVdnAqOO80oedNcSXLm9F/riXPZu1YyVeylRMuXZBxNX1qC21teWlG47Oo593wR632
	iZf896bdMKRmJsakE8OYvkESGLbNmiQaaeZtBH97N7o2z1RUGYA9Ix6TMrZQ2UEuNyG/Gw9VncG
	K1L2Ycz/6mlbFzzoyfwkFuH2xS7rYH91EZIz2jL9nexXGKY57xkgZf5h3bqVRavHMR+bntGqX5F
	nOfqiJJLRXJLeNpgXHG9OrlqMP9uoNJ2QHdyrzO5XdwMmBLFUsVM6nOGlpKYLJMCcoe6+YvCjMc
	iilvzSU93MLaPnYsLPBl4myOwkFNx/73BqVnXM2lrI04CZSRsG+PC5byLrCHqKq6b6peU/74jJB
	Ta+kgVVta2qDMD+0y9kd4o0qB5JjO/XyDVd5HHOiA8CyHGgCi3ths99HxOmdbNqiE4tQcPfmHjr
	D4=
X-Received: by 2002:a05:6000:2404:b0:435:9653:e154 with SMTP id ffacd0b85a97d-435dd074b2bmr2571803f8f.27.1769519678044;
        Tue, 27 Jan 2026 05:14:38 -0800 (PST)
Message-ID: <668a0e95-733c-49ef-8e59-bdfc94ddc5e0@suse.com>
Date: Tue, 27 Jan 2026 14:14:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] x86/cpu: Cleanup for NX adjustments
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <92bff6a4-8fb0-4992-8305-8386f480de74@vates.tech>
 <658c0167-c3df-4acd-92f8-8c3f022ae453@citrix.com>
 <e5f02207-4f9f-467a-8c25-0af42bf81551@vates.tech>
 <08d9aeaa-d503-4e75-863b-dee3b46c42a0@citrix.com>
 <98758ea8-8add-4879-a28c-bd8d6d898bba@suse.com>
 <4e084768-1fe2-491b-a029-a07d648071c1@citrix.com>
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
In-Reply-To: <4e084768-1fe2-491b-a029-a07d648071c1@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 4FA2194BA5
X-Rspamd-Action: no action

On 27.01.2026 14:02, Andrew Cooper wrote:
> On 27/01/2026 12:54 pm, Jan Beulich wrote:
>> On 27.01.2026 13:29, Andrew Cooper wrote:
>>> On 27/01/2026 12:09 pm, Teddy Astie wrote:
>>>> Le 27/01/2026 à 12:39, Andrew Cooper a écrit :
>>>>> On 27/01/2026 11:23 am, Teddy Astie wrote:
>>>>>> Le 26/01/2026 à 18:56, Andrew Cooper a écrit :
>>>>>>> I was hoping this to be a patch or two, but it got out of hand...
>>>>>>>
>>>>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2287078891
>>>>>>> https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/nx
>>>>>>>
>>>>>>> The branch has one extra patch to fake up the firmware settings being set to
>>>>>>> Gitlab CI, not included in this series.
>>>>>>>
>>>>>>> Julien: This ought to suitable to rebase your cleanup on to.  In the end, I
>>>>>>> did the AMD adjustment mostly because I needed it to test the correctness of
>>>>>>> the prior cleanup.
>>>>>>>
>>>>>>> The final 4 patches are tangential cleanup which I've kept out of the prior
>>>>>>> work in case we wish to backport it.  Everything prior is relevant to
>>>>>>> untangling, and mostly for the benefit of the AMD side.
>>>>>>>
>>>>>>> The early patches are hopefully non-controvertial.  Later patches are a little
>>>>>>> more RFC, and in need of further testing.
>>>>>>>
>>>>>>> <snip>
>>>>>>>
>>>>>> Tested on a Intel machine with "DEP" disabled, and "Require NX support"
>>>>>> disabled, I get a pagefault in hpet code
>>>>>  From above:
>>>>>
>>>>>> Julien: This ought to suitable to rebase your cleanup on to.
>>>>> This is cleanup only.  I've not got the bugfixes for EFI boot yet, so
>>>>> the behaviour you see is still expected for now.
>>>>>
>>>>> Although, thinking about it, it might be better if I try to merge the
>>>>> two series, so everyone can test the end result.
>>>>>
>>>>> Thoughts?
>>>>>
>>>> +1
>>>>
>>>>>>> (XEN) Xen version 4.22-unstable (tsnake41@(none)) (gcc (Alpine 15.2.0) 15.2.0) debug=y Tue Jan 27 12:06:46 CET 2026
>>>>>>> (XEN) Latest ChangeSet: Mon Jan 26 17:53:45 2026 +0000 git:6491616ddd
>>>>>>> (XEN) build-id: 035024497a4cadebf9e5a2ded61f63ac
>>>>>>> (XEN) re-enabled NX (Execute Disable) protection
>>>>>>> (XEN) CPU Vendor: Intel, Family 6 (0x6), Model 60 (0x3c), Stepping 3 (raw 000306c3)
>>>>>>> (XEN) BSP microcode revision: 0x0000001a
>>>>>>> (XEN) microcode: Bad data in container
>>>>>>> (XEN) Microcode: Parse error -22
>>>>> As a tangent, what's going on here?
>>>>>
>>>>> This is the first time I've seen the error outside of my own testing.
>>>>> Is it a container you expect to be good, or some leftovers on a test
>>>>> machine?
>>>>>
>>>> I'm trying to load a Intel ucode (taken from Alpine Linux intel-ucode 
>>>> package) using `ucode=intel-ucode.img` in xen.cfg (UEFI direct boot).
>>>>
>>>> Many distros ship microcode in a single CPIO image with e.g 
>>>> "kernel/x86/microcode/GenuineIntel.bin" in it.
>>> Ah, that's a known thing that doesn't work and has never been
>>> addressed.  People have been complaining for years, but not on xen-devel.
>>>
>>> It's also the subject of a documentation fix that is still pending (and
>>> now needs yet another rebase). 
>>> https://lore.kernel.org/xen-devel/20251215153245.2675388-1-andrew.cooper3@citrix.com
>>>
>>> Now that the ucode boot module handling is clean, we can probably try
>>> both a CPIO and raw probe when given a fixed module.
>> What does "raw probe" here mean? "ucode=" with a proper ucode blob specified
>> has always been working for me ... (In fact I don't think I ever really tried
>> the "scan" approach.)
> 
> This isn't (really) about scan.
> 
> What both Arch (where I noticed this complaint first) and Alpine do is pass:
> 
> ucode=CPIO(GenuineIntel.bin, AuthenticAMD.bin)
> 
> as would otherwise be prepended to the initrd, and Xen rejects this
> because it's not a valid vendor blob.
> 
> What I'm thinking of is something like this:
> 
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index 9e055b6f9805..82ddb5e9a6d2 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -847,6 +847,11 @@ static int __init early_microcode_load(struct boot_info *bi)
>                     idx, size);
>              return -ENODEV;
>          }
> +
> +        if ( is_cpio(data) &&
> +             find_cpio_data(ucode_ops.cpio_path, data, size) )
> +            ...;
> +
>          goto found;
>      }
> 
>  
> 
> where we'd accept both raw and CPIO-wrapped blobs any time we nominate
> an explicit module (whether via Grub, or implicitly via EFI).

Ah, I see.

Jan

