Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MAhLrkOzWnhZgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 14:25:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1840237A683
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 14:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270175.1558915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ud4-0008HP-M6; Wed, 01 Apr 2026 12:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270175.1558915; Wed, 01 Apr 2026 12:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ud4-0008Fy-JQ; Wed, 01 Apr 2026 12:25:02 +0000
Received: by outflank-mailman (input) for mailman id 1270175;
 Wed, 01 Apr 2026 12:25:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7ud3-0008Fs-3K
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 12:25:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7ud2-00FvJp-FN
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:25:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd0e98-2eae-0a2a0a5409dd-0a2a4508d5bc-16
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:25:00 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd0e9c-fab6-0a2a45080019-d1558036c9e2-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:25:00 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-48558d6ef83so68468665e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 05:25:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887c8d3684sm39777325e9.29.2026.04.01.05.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 05:24:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1775046300; x=1775651100; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s7MQ0xAq1xuMEk8BAn5zv6LzYyLL0WqnQCl5ZROUK08=;
        b=e8q++qem7pIFK510Ft9E92gOzxDX47fEryGi2iit4zee3z0s+hxuIlml2LHgl7g86N
         jmiVdGQD5o1kM4v7o8NdJIDbx2o0jx+0C6sXVDPxKZUwdWa4hmC8kHzf7s7AnSpe0B6O
         MXbYEwrFauai5gbcHKHj9WlTcKO/dAkqjeUP9RrVzkrsslFpP6E42n+AKDEjTCulal+x
         BJiNDY3daLoqU/k2A02zWtI91IAyCkEndqscoFQg/jQ6nRoLn4G6i4q7jKdLWVv6y/49
         GwXK7lnVBPt/jZDffwJrifThpJfEdkVGOeVzt89n1ESmPDe5PErsrPiXRo8tfd2bFA3q
         1KcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775046300; x=1775651100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7MQ0xAq1xuMEk8BAn5zv6LzYyLL0WqnQCl5ZROUK08=;
        b=eTShQl647VZ0G67F0VaHGIfA8OEihUYzUo9gKuQHATxvnPJfGlgTzX/4QjkfuWMr8l
         gSjrW8qlig8/LYskiVL/KD+VYoja0OXHCe/NxuFCz2psSzefwetrRihMTwJQeeQ310Ud
         x2txNcmZL8F4FgAcfmQbeHzrSr3LLPNv8ipsAsvBC7rxLZyRYnlxN2dvE1orbsGCzJ0V
         lFdwZuLNdVmif6ZtlChXZ22vxaTZjT2uZnjtmqEQh65elpEJSX9eLmccuQByBoiOr4m/
         2FVNk1aUYADAMOlwpbwg+zkKxHofDxFTUR+F4yDIE6xFdyA4dO4pMhazIzbxuc7EpHKh
         wffQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDsNMikbaodBDEby3fcQX9B7wo2vUzB2bKUicLqDRJ8MfQGqtRXq3UMTzM2gcKFnSzkLmqEOWQ3+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3NCo3FkhmypVpdfMwr79PKMWmrVKL2w3zWsnqaYn1AU3OG4rw
	HG0dDNAyg9Id4O1a3RAYxl9ZGILIGgW1MJZxMNE/pRat09HZ/rB3QvQkBTZVmSOB3g==
X-Gm-Gg: ATEYQzxCsQekvZxVHPIcj1ZL/scm2Y+lHQSmvL6Hlf+8RBTLY4+IuPGgsdOG/zliIUh
	6SXBfeiVtX5M3ExmCXZYRgD3hbIb/c0/JFbbASoCE9hnmpgpv2C9aAehhZshY1jIS21RIFC5Eou
	MJXkOF/rr/npiX9GKXG/4ap3A3UmaY4BmtI9yxsxYi9R+IO6C7n+WD/bYjq/CNWSgz9dwxSmHL4
	jwrQ0UpLKMqhY7EFYv2VEDKzYVj+ggLsDqNaZ1+O+/aJHgHF6kXA2/vuo+sfNU5hoWKMb5N+KR/
	VDhzVVcIkritcNDJDnkLTCheNhN9BD6DWBBbMUvc1H9CadRlGQ8XmXd9SCZ0TZ+i9tOlj5Y1HtT
	2N7ob60fmqsw/oXX5VTq6nPcrqOuD98PW/3VUG7VLU2WuGFInRthoDMzSI5L5QOZYQlCwkHPOgd
	pAqvL6/nGPWhjcG/JZSf9DQmsKUQKCrrB7eB13JV04Br+jd1ZsImzQF/IIlZSdVBgAMdIEzBmfz
	uUJcG19R5TrE9g=
X-Received: by 2002:a05:600c:c056:b0:485:3a86:6392 with SMTP id 5b1f17b1804b1-488835b75c4mr38932165e9.20.1775046299658;
        Wed, 01 Apr 2026 05:24:59 -0700 (PDT)
Message-ID: <425cdc68-5e25-4e01-b5d9-6469e2d08abb@suse.com>
Date: Wed, 1 Apr 2026 14:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI
 arguments
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <e1d18d55557ebe232fd62174f186b1cf228e48e5.1774981189.git.mykola_kvach@epam.com>
 <dc5550d7-5a2d-4ca1-85de-5a17c24aeac4@suse.com>
 <CAGeoDV-ffZsOW+Cu0-oPA1obBOv_1nWU8_PAdaqaoy6=YUHGig@mail.gmail.com>
 <5b16e00e-9a4d-4a18-8a5e-dde10b42a043@suse.com>
 <CAGeoDV_Cdpa6beFemKaVcCguwmo95x0g0rsRYbS1x5dAUxFPLQ@mail.gmail.com>
 <5fb9b5ee-ee71-49ec-b545-62c8ec27fc15@suse.com>
 <CAGeoDV-HCKUXZ-CZBASLik=xkR02w-n=5+HVsYGwfDf4zD-3zA@mail.gmail.com>
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
In-Reply-To: <CAGeoDV-HCKUXZ-CZBASLik=xkR02w-n=5+HVsYGwfDf4zD-3zA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1775046300-F4F5A497-C9044C30/0/0
X-purgate-type: clean
X-purgate-size: 6421
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,suse.com:dkim,suse.com:email,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1840237A683
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 11:51, Mykola Kvach wrote:
> On Wed, Apr 1, 2026 at 12:22 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 01.04.2026 10:49, Mykola Kvach wrote:
>>> On Wed, Apr 1, 2026 at 11:14 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 01.04.2026 09:13, Mykola Kvach wrote:
>>>>> On Wed, Apr 1, 2026 at 9:29 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 31.03.2026 20:31, Mykola Kvach wrote:
>>>>>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>>>>>
>>>>>>> SMCCC DEN0028G, section 3.1, states that for AArch64 SMC/HVC calls
>>>>>>> using Wn, only the least significant 32 bits are significant and the
>>>>>>> upper 32 bits must be ignored by the implementation.
>>>>>>>
>>>>>>> So for SMC32 PSCI calls, Xen must not treat non-zero upper bits in the
>>>>>>> argument registers as an error. Instead, they should be discarded when
>>>>>>> decoding the arguments.
>>>>>>>
>>>>>>> Arm ARM DDI 0487J.a (D1-5406) also notes that the upper 32 bits may be
>>>>>>> implementation defined when entering from AArch32. Xen zeros them on
>>>>>>> entry, but that guarantee is only relevant for 32-bit domains.
>>>>>>>
>>>>>>> Update PSCI v0.2+ CPU_ON, CPU_SUSPEND, AFFINITY_INFO and SYSTEM_SUSPEND
>>>>>>> to read SMC32 arguments via PSCI_ARG32(), while keeping the SMC64
>>>>>>> handling unchanged.
>>>>>>>
>>>>>>> No functional change is intended for PSCI 0.1.
>>>>>>>
>>>>>>> Suggested-by: Julien Grall <julien@xen.org>
>>>>>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>>>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>>>
>>>>>> I thought I might as well include this in my next commit sweep, but isn't
>>>>>> this R-b being invalidated by ...
>>>>>>
>>>>>>> ---
>>>>>>> v3:
>>>>>>>  - use PSCI_ARG_CONV for SYSTEM_SUSPEND
>>>>>>
>>>>>> ... this change. That's ...
>>>>>>
>>>>>>> @@ -422,14 +427,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
>>>>>>>      case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>>>>>>>      case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>>>>>>>      {
>>>>>>> -        register_t epoint = PSCI_ARG(regs, 1);
>>>>>>> -        register_t cid = PSCI_ARG(regs, 2);
>>>>>>> -
>>>>>>> -        if ( fid == PSCI_1_0_FN32_SYSTEM_SUSPEND )
>>>>>>> -        {
>>>>>>> -            epoint &= GENMASK(31, 0);
>>>>>>> -            cid &= GENMASK(31, 0);
>>>>>>> -        }
>>>>>>> +        register_t epoint = PSCI_ARG_CONV(regs, 1, is_conv_64);
>>>>>>> +        register_t cid = PSCI_ARG_CONV(regs, 2, is_conv_64);
>>>>>>>
>>>>>>>          perfc_incr(vpsci_system_suspend);
>>>>>>>          PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
>>>>>>
>>>>>> ... this hunk aiui, which is far from merely cosmetic imo. While
>>>>>
>>>>> Nobody said that the change had to be purely cosmetic in order to keep
>>>>> the tag. I understood it differently from the official Xen
>>>>> documentation pages.
>>>>>
>>>>>> behavior looks to remain the same for PSCI_1_0_FN32_SYSTEM_SUSPEND, it
>>>>>
>>>>> Exactly. If the changes are not substantial, I do not see a reason to
>>>>> drop the tag ...
>>>>>
>>>>>> clearly changes for PSCI_1_0_FN64_SYSTEM_SUSPEND. That may be intended
>>>>>> and for the better, but the change clearly wasn't reviewed by Bertrand,
>>>>>> nor - when offering the R-b - did he ask for this extra change.
>>>>>
>>>>> ... and this is also how I understood the Xen patch submission
>>>>> guidelines [1], which say:
>>>>>
>>>>> "Note that if there are several revisions of a patch, you ought to
>>>>> copy tags that have accumulated during the review. For example, if
>>>>> person A and person B added a Reviewed-by: tag to v1 of your patch,
>>>>> include it into v2 of your patch. If you make substantial changes
>>>>> after certain tags were already applied, you will want to consider
>>>>> which ones are no longer applicable (and may require re-providing)."
>>>>>
>>>>> So my understanding was that tags should normally be kept across
>>>>> revisions, unless the changes are substantial enough to make them no
>>>>> longer applicable.
>>>>
>>>> Maybe our understanding of "substantial" differs. To me that's anything
>>>> changing functionality. Style adjustments, typo corrections, and alike
>>>> generally aren't substantial (albeit even then there may be exceptions).
>>>
>>> Thanks for clarifying what you consider substantial.
>>>
>>> Even under that interpretation, I do not see a functionality change
>>> here. "Refactoring" seems like the more accurate term in this case:
>>> the internal form changes, but the intended external behavior does
>>> not.
>>>
>>> It may be that we are using "functional change" in slightly different
>>> senses here.
>>>
>>> For v3, the switch to PSCI_ARG_CONV() in SYSTEM_SUSPEND was meant to
>>> make this case consistent with the helper-based argument decoding used
>>> elsewhere, not to change behavior.
>>>
>>> In particular, I do not see a functional change for
>>> PSCI_1_0_FN64_SYSTEM_SUSPEND: v2 used PSCI_ARG(regs, 1/2), and in v3
>>> PSCI_ARG_CONV(regs, 1/2, is_conv_64) should resolve to the same thing
>>> when is_conv_64 is true.
>>
>> Isn't the whole point of the patch to alter behavior when is_conv_64 is
>> false? For that case PSCI_1_0_FN64_SYSTEM_SUSPEND behavior looks to
>> change in v3, when it didn't in v2. Whereas for
>> PSCI_1_0_FN32_SYSTEM_SUSPEND the v3 change indeed only eliminates open-
>> coding, which one may or may not regard as "substantial".
> 
> I think the point I was trying to make is slightly narrower: in this
> code path, is_conv_64 is derived directly from fid via
> smccc_is_conv_64(fid) before the switch (fid).
> 
> So for PSCI_1_0_FN64_SYSTEM_SUSPEND, I do not see how
> is_conv_64 == false could arise here: if we are in the FN64 case,
> the function ID already encodes the 64-bit convention.
> 
> Conversely, if is_conv_64 is false here, then this cannot be the
> FN64 case.

Ah, I see. To figure that out, I would have had to do a proper review. I
was after committing only, which ought to be an entirely mechanical step.

> On that basis, I do not see a behavioral change for the FN64
> SYSTEM_SUSPEND case in v3.

I agree (now). I'm still not going to pick up that patch, but rather
leave it to the Arm maintainers. While not as clear cut as it first
seemed to me, I still consider it within the grey area.

Jan

