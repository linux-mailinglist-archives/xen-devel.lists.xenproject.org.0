Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPVxNqqswmkyggQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 16:24:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0BA317F3F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 16:24:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260980.1554131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w53c8-00029X-U9; Tue, 24 Mar 2026 15:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260980.1554131; Tue, 24 Mar 2026 15:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w53c8-00027R-RZ; Tue, 24 Mar 2026 15:24:16 +0000
Received: by outflank-mailman (input) for mailman id 1260980;
 Tue, 24 Mar 2026 15:24:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w53c7-00027L-ST
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 15:24:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w53c5-009UwA-MT
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:24:15 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2ac89-2eae-0a2a0a5409dd-0a2a4502d91c-48
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 16:24:15 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2ac9f-63bb-0a2a45020019-d155dd36f1d0-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 16:24:15 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43b40fb7f95so1386462f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 08:24:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b6cdfdfa9sm29668237f8f.9.2026.03.24.08.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 08:24:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1774365854; x=1774970654; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uzTsoOoAs6SJqBA438k0E+No03ynwPt+6KYawkFnI4A=;
        b=acZoiajJ990QfpkW1S9Nzue4z9tVNuujlH0W7gIbUplPrkaSzpS4Ugv6+HeQ/uL1nc
         /0S9nLS8XzGbD6u+hqH/jSZAUG4yvOjzPEK+q1uWNgONfYdtV/j6yrP5KSbPT8SMN8A1
         x8VYqjk4sMxHDViHlin5fExvjrYquI41zd0plq7/PCQ00qAEfcMkcb2HpLZ0VlhSS8yg
         l0cLDtIBrs1Yfdp1BcKucNgsg8K5oUv6tfSJGmamAbLl2pC13pjUA7x4jR2Oq1P0eAiX
         kSnfD6K6i+btP+CQD0XjqM9ThCiDquCwvu9PhvyvexXSKsvyPm0EBHgkocDN8gQ1GIWS
         fhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774365854; x=1774970654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzTsoOoAs6SJqBA438k0E+No03ynwPt+6KYawkFnI4A=;
        b=L59Srki/5zffJby+iBqaC+bDkn42KMTyF7oVh0k5Xk9U/DvbSjR1zZjBB2wuWCOdVN
         j569XepBDOT25qQYqco17sW3/PMjA0z5ICjktwfbwysivRrWEgTvz/5yYKKwijZVXT6U
         uhf91D9ApOJLv2wuq7Oe3cOL2sodCg9WYgQzbCQBEnMaNI0G6U+G5lJz4XYhTLcPIFXN
         +9ehBbNWM+afNSDdNMjZPlMEdR3OCpUvNaLk6TYQYVCV+vdXMEKC2VS0tUHXy8PRJJ5L
         WMWqzHrrXVHdcn+wmlaQA38smG6HMoLeSzwO3CXCfuTJKSASkeny3qjME8JE+ajItwI4
         rVrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBJQ9JkuO2le8CTSh3Bbm4aNe/MWs0H50kGNnvOdllpKxdLrx0KjjxUPKnmSZEKVPWM5xS6MfYhsQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzf8CGuLp3a5jsB9hLTrFt5acTefL9pIu77TVodUHiIN6oF01YZ
	ZhN4z6+E68ZXGJJjYUr0jDvjI0p8gywBNxmY/PnlSnAMa6MWBpkJ02BIjh/zVZQ/Eg==
X-Gm-Gg: ATEYQzy49NwV+fqV3XfmsACs/1DHSZRLacgL2LNAUFCm3boXWDHcDiqaLM748GjGo8p
	qGxPhA8qSbPrNWeiQn/hrAG/MBG8DFb9fGAd9hTeUFHMhAtJ0A6rjU2ptUtA2Wb6AZMKa9cj8L3
	EV9llEFxG02iqBMtyV4B4k9DteUOIBicMT4Bbz1Lkh8xvuOxTAU0Cql0CBld97MMcsAWpCXcPP1
	yEypyuXOn2dB/NZV7lxh7N2ZX76UtKmsO0uE1ILvLeIQxITfd8LMitz+nf1sPDR6rYxOPMj9hFu
	Q1dJQlqLg+mPjM8hsEvDjZh4cp0YBUyTMjSLfXBxdUWGCjRQW7qaiaffGcMzNuOlZnDXvdBoI6o
	E3bwKa91jfsMfhMqp/MJ39Mf1DhPgLVx5Jz782afCGdXd5wuFRhmYdFuOZPzeGJflpBzfDKiAGd
	Pl7APfhsy36a9rtM46zjTt9B3Smmw7ovshEQDSdXlUb8XtqQCOUcTNXTH6efUDLkthuzYbEhCW2
	cQC81asVIOY/eI=
X-Received: by 2002:a05:6000:290b:b0:439:c6d9:7fc with SMTP id ffacd0b85a97d-43b64264b1dmr25812145f8f.25.1774365854475;
        Tue, 24 Mar 2026 08:24:14 -0700 (PDT)
Message-ID: <1e2393d1-4744-485d-aca5-1907115a1376@suse.com>
Date: Tue, 24 Mar 2026 16:24:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1774353053.git.mykola_kvach@epam.com>
 <581179709977ce4cebb22597411048dc93b11167.1774353053.git.mykola_kvach@epam.com>
 <3882d56e-def9-4ff5-9014-f72e80c7a1c8@suse.com>
 <CAGeoDV8=ezYesxz7AgdPP4K_vcJZhCTTsQ3UTRC95NiYDgPgZQ@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8=ezYesxz7AgdPP4K_vcJZhCTTsQ3UTRC95NiYDgPgZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1774365855-42E82DB8-B743FCB2/0/0
X-purgate-type: clean
X-purgate-size: 1305
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4E0BA317F3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 15:59, Mykola Kvach wrote:
> On Tue, Mar 24, 2026 at 2:53 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 24.03.2026 13:26, Mykola Kvach wrote:
>>> --- /dev/null
>>> +++ b/xen/include/xen/suspend.h
>>> @@ -0,0 +1,25 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef XEN_SUSPEND_H
>>> +#define XEN_SUSPEND_H
>>> +
>>> +#if __has_include(<asm/suspend.h>)
>>> +#include <asm/suspend.h>
>>> +#else
>>> +static inline void arch_domain_resume(struct domain *d)
>>> +{
>>> +    (void)d;
>>
>> What use is this? None of our stubs does anything like that without a clear
>> need.
> 
> The (void)d was only meant to make it explicit that the parameter is
> intentionally unused in this no-op stub.
> 
> I find this useful as a reminder both for possible compiler
> unused-parameter checks and from a MISRA-style point of view, although it
> has no functional effect. Given how late this is in the series, I would
> prefer to avoid another reroll for this detail alone.
> 
> Happy to send v18 if you think this is a blocker, but I'm also fine if you
> want to strip that line on commit to save us both some time.

Stripping while committing is fine with me, but it's unlikely going to be
me to end up as the committer of this series.

Jan

