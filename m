Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGRXNv/TzGlFWwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:14:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251BF3768F8
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:14:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269870.1558741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7qiJ-0004kr-1R; Wed, 01 Apr 2026 08:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269870.1558741; Wed, 01 Apr 2026 08:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7qiI-0004iG-UA; Wed, 01 Apr 2026 08:14:10 +0000
Received: by outflank-mailman (input) for mailman id 1269870;
 Wed, 01 Apr 2026 08:14:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7qiI-0004iA-8l
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:14:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7qiH-001xmy-Kn
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 10:14:09 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ccd3cb-2eae-0a2a0a5409dd-0a2a4505adaa-20
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 10:14:09 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ccd3d1-3760-0a2a45050019-d1558035d5a1-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 10:14:09 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488879b2e6aso1600495e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:14:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf330872asm31379856f8f.17.2026.04.01.01.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 01:14:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1775031249; x=1775636049; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i9xSBchp0EQkC31IJ7rHy+sCf5eE/J+x0FI8uOxAYJs=;
        b=dGCcEFL4bsuSNF04Ucmj9xd88A++5RHJlJq2vNRL4a5DQJeWD519+xDnJHAOqqWVES
         1a1M8gmKTcf9BBQb1sBSmRcQnRSQBSuf5EqZE7PX+bYZqjRMTGdNQbrxuVK+S0i63Ez2
         e1SoqDzoa4h7uGgh+FrDRi8qflMk7M1jc3INupgXjAFbdhm/JSvM6OcHrg3nFurlyU/T
         jztJkyDhNwpy6gmpMLYN+Q/uKHtRIAS7TKXmRhJDAhBJYWgzC4EItEzD2ZhJDg0Bws1/
         5rG/pRfqetS4ElCBFNxqmU0Fqw8j15qV/N9jJjThuoT1IXnomKWbMHIytFEI5XYeOydS
         6fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775031249; x=1775636049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9xSBchp0EQkC31IJ7rHy+sCf5eE/J+x0FI8uOxAYJs=;
        b=cz2pa8M1vfefoKR/uYiFORLR5rLtBWyNUxtrP9reAclHFuivk+MVi3D5hED15IwiC6
         4GvNuvFQSfUmiZPfvaY2K+4fVzu17phvjDpntqz/MS5RZ81dfXEp/nj2PEJqFgkiA+dH
         ZmSCCE9gMTo8rj3+HgvXZ0nt0mSLLwXJXorrMUqU+CmISCI9lqBaH9fjmsd1spmcwCSS
         aKt3Rr3s1ngRUUFKsiZOzGFwSxCmGZ/3h5wjT6P5yBpYzBD9w8k/ge/QBUpJvDJ/1PeX
         vrHjRqzSILLeYszWupy3To4dSxYC6J8nnpdd2HwtkrYEv4ScguCuXr3AOmrPbGSQgDu4
         1bBg==
X-Forwarded-Encrypted: i=1; AJvYcCWP6KTtj99FtdLICyo788MR5S5df/0HN47i88202KgskyPbjZi74oLZ8/RpzAnzq+AU0thz+/Y4ULk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJzzimEu4hU/TEH9PwZVWruEMuIzfCOSf1OhSQEXjzHxbVdyfk
	LJOD/644CRiXvizTfjpBCagXyKvzwpiRBscah12WFJwqUtdqHSYCdTB1uT0XuF7gbA==
X-Gm-Gg: ATEYQzyQPcQgKLYrTN6X7GYgGAU5umOhVxQRDNMNc4Gl05rWRnAl8W97oauXZsonKcU
	gxFDzJmci4i6nHrP6vA5BRkhbmpUCNWvQMpmwmaEcy3R3aOW2wLE2Qocd/xXDtcDNtAjKfFGOpU
	lSFsXKIyJO24GD6GTaBg/8ZntFOP6NKQOCnq/67RM1EwM52+dCDYNVSrYXV8md7enZMNKTtDm7I
	mCstrlrhHHnojJhMTCnN/ObmPSCssP1ZvQI/D7x86eHLJtp4lILcQ42vGQ0Q/7IIkzzdpAJ5+FM
	zcYNVUuwA8ggIdngEcRUikAtktCPCEYiZ/iXdn9nD+895OqCQdKIvZFShoRlksvZON/uuCKa/Yx
	dsvGBFweWvpLziMsOyD8KFRQHZcimJ5BdciiJNqJnGuRNMN2B6dgUUIJZY+Gh/U/aM9uUkBL3ES
	ZeCtPJgTNPausnS66U0U7IBvoD5Z0UdRoObqxaTS7oqX7NT2+CeTROtDHvERTj4XyGX3lFz7UGn
	RCGOIvW0pspTG6kGjObspM/hQ==
X-Received: by 2002:a05:600c:c107:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-48883595d96mr28079995e9.22.1775031248865;
        Wed, 01 Apr 2026 01:14:08 -0700 (PDT)
Message-ID: <5b16e00e-9a4d-4a18-8a5e-dde10b42a043@suse.com>
Date: Wed, 1 Apr 2026 10:14:07 +0200
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
In-Reply-To: <CAGeoDV-ffZsOW+Cu0-oPA1obBOv_1nWU8_PAdaqaoy6=YUHGig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1775031249-3332496F-66B8F4DB/0/0
X-purgate-type: clean
X-purgate-size: 3783
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 251BF3768F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 09:13, Mykola Kvach wrote:
> Hi Jan,
> 
> On Wed, Apr 1, 2026 at 9:29 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 31.03.2026 20:31, Mykola Kvach wrote:
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> SMCCC DEN0028G, section 3.1, states that for AArch64 SMC/HVC calls
>>> using Wn, only the least significant 32 bits are significant and the
>>> upper 32 bits must be ignored by the implementation.
>>>
>>> So for SMC32 PSCI calls, Xen must not treat non-zero upper bits in the
>>> argument registers as an error. Instead, they should be discarded when
>>> decoding the arguments.
>>>
>>> Arm ARM DDI 0487J.a (D1-5406) also notes that the upper 32 bits may be
>>> implementation defined when entering from AArch32. Xen zeros them on
>>> entry, but that guarantee is only relevant for 32-bit domains.
>>>
>>> Update PSCI v0.2+ CPU_ON, CPU_SUSPEND, AFFINITY_INFO and SYSTEM_SUSPEND
>>> to read SMC32 arguments via PSCI_ARG32(), while keeping the SMC64
>>> handling unchanged.
>>>
>>> No functional change is intended for PSCI 0.1.
>>>
>>> Suggested-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> I thought I might as well include this in my next commit sweep, but isn't
>> this R-b being invalidated by ...
>>
>>> ---
>>> v3:
>>>  - use PSCI_ARG_CONV for SYSTEM_SUSPEND
>>
>> ... this change. That's ...
>>
>>> @@ -422,14 +427,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
>>>      case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>>>      case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>>>      {
>>> -        register_t epoint = PSCI_ARG(regs, 1);
>>> -        register_t cid = PSCI_ARG(regs, 2);
>>> -
>>> -        if ( fid == PSCI_1_0_FN32_SYSTEM_SUSPEND )
>>> -        {
>>> -            epoint &= GENMASK(31, 0);
>>> -            cid &= GENMASK(31, 0);
>>> -        }
>>> +        register_t epoint = PSCI_ARG_CONV(regs, 1, is_conv_64);
>>> +        register_t cid = PSCI_ARG_CONV(regs, 2, is_conv_64);
>>>
>>>          perfc_incr(vpsci_system_suspend);
>>>          PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
>>
>> ... this hunk aiui, which is far from merely cosmetic imo. While
> 
> Nobody said that the change had to be purely cosmetic in order to keep
> the tag. I understood it differently from the official Xen
> documentation pages.
> 
>> behavior looks to remain the same for PSCI_1_0_FN32_SYSTEM_SUSPEND, it
> 
> Exactly. If the changes are not substantial, I do not see a reason to
> drop the tag ...
> 
>> clearly changes for PSCI_1_0_FN64_SYSTEM_SUSPEND. That may be intended
>> and for the better, but the change clearly wasn't reviewed by Bertrand,
>> nor - when offering the R-b - did he ask for this extra change.
> 
> ... and this is also how I understood the Xen patch submission
> guidelines [1], which say:
> 
> "Note that if there are several revisions of a patch, you ought to
> copy tags that have accumulated during the review. For example, if
> person A and person B added a Reviewed-by: tag to v1 of your patch,
> include it into v2 of your patch. If you make substantial changes
> after certain tags were already applied, you will want to consider
> which ones are no longer applicable (and may require re-providing)."
> 
> So my understanding was that tags should normally be kept across
> revisions, unless the changes are substantial enough to make them no
> longer applicable.

Maybe our understanding of "substantial" differs. To me that's anything
changing functionality. Style adjustments, typo corrections, and alike
generally aren't substantial (albeit even then there may be exceptions).

Jan

