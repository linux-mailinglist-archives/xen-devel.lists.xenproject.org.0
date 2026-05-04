Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLK7KhIs+Gm/rAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:18:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B18C4B8797
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299434.1573965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJlgs-0003wb-QX; Mon, 04 May 2026 05:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299434.1573965; Mon, 04 May 2026 05:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJlgs-0003uV-Np; Mon, 04 May 2026 05:17:58 +0000
Received: by outflank-mailman (input) for mailman id 1299434;
 Mon, 04 May 2026 05:17:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJlgr-0003uN-2m
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 05:17:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJlgq-00ETi1-Ez
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 07:17:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f82be6-5cb7-0a2a0a5109dd-0a2a4503b72c-48
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:17:56 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f82c04-672d-0a2a45030019-d1558029b1b2-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:17:56 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4893940bb5eso18379465e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 22:17:56 -0700 (PDT)
Received: from ?IPV6:2003:ca:b72b:870a:8d83:125f:d0c4:4383?
 (p200300cab72b870a8d83125fd0c44383.dip0.t-ipconnect.de.
 [2003:ca:b72b:870a:8d83:125f:d0c4:4383])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a82301ad1sm463374825e9.9.2026.05.03.22.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 May 2026 22:17:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1777871876; x=1778476676; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Llu90yKy3gS4BzO/309sV4bIWAV1PcDaqAAryX6doug=;
        b=MdSI1Cmgr5KzL+YyJJRZ1XKSSh9FIM3cU6XwHg8z7fXdQ1XhX5BOZBtMH8DisvxcsV
         k76Bhin3v6jtXzPM5va4na7QI+kg1Pqjy7s5zIalM0jQpyZvfAvB0/FqUS0IpAscXxJb
         ueWnZiWFkdwyw2wszs00cSZH1iBS5nxLD+H+5wXG4b6Mhsbwoy/XGmDNzh/QakWQSS73
         U5XO0iYLg7ji3HeXZmkv3xfWIs1tePyETELqhvKTCAOX2jU5T9JoQ7j2ENYfphL3qwQ1
         nJdgdJZ4OEZbl+kHqf9SZDF6RXrJ+iIDoPJR/sezk64wHw4KV98BE029alQph0AA/gTg
         rq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777871876; x=1778476676;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Llu90yKy3gS4BzO/309sV4bIWAV1PcDaqAAryX6doug=;
        b=So72yv/f1FYbJx+DXGLV+93Yai6RnDe0vD37mskaI6W16rR/FPKLOwinw0ICMhp/rD
         LjjSO7jrRcyoNr8Ou8thOCnxDVdKBC0vpXsZXHy8PQw0ws5ofIHFUx18OXaOduoJtltK
         8LQ91NuglHQTOgM74VD3LGX4MIl8VMZ2kHGc/hcvhOZjTe9Z66miIT4tZzpRfdKvmmRQ
         eQnBp9ar1+urZ6n5eTg/JSLVbaUkzFfpbcx15alzzoh8gIoU1wmxekvsx2lrciZ37I+k
         V/QNcLDhpUPjRrjC5Z/L7SA8iQ2HbDVBZwEKkgWbU4/V7suVf09zjRWSzzyEytxXrvQa
         /BdA==
X-Forwarded-Encrypted: i=1; AFNElJ+qgGA275qnVNAipxWrAv85hUG0m4Ln7Q7/dXqL94VxyUzAF+OtcSSK6hzKkMx22acVY2AlUTjBQEU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yys8vnoBlbnMINZLl1D6McbQd3NfgzMgY1su8lp0e4d7ffAcXoD
	WiFTk4YVzZiGebvFaaHWFOVqENu5KyPgLe4XRwcPHRnBxOW5REVTpV7sDSOsYvd94Q==
X-Gm-Gg: AeBDietClT4AqPevPxPg/cb8a+WfK2vT0OGRf/j32YOmr/f2XD9ubDDu+JJfLOJ96iR
	dPiDHYZquIZJmk3NFmWkCP2I2S5U8v8+ZNeLIl/TSzUyJq5SAEw3Y/8ecqWK4YofUL76eFSA06P
	gpZ5nNg81y78VmzhXisOTlmKFEn0bf5S7lNOWBHNTjjQnHcZexbvyu0l6l8atEh7r479OSrM7Th
	ALUowwO7u56/9t19Nplu4l0Q/nKUDvnUIxJX4YEjccItBWzT+kBs0IQMPYD1SHZcip+daedQ/Q7
	UkFmSLhuZdDjLV2tp4jgQjRsm3rRPEI+4KH/M2l1UJe/rTPktoLaWnZ6LWArcGJTZIMDKdBL+2w
	HW0Xmx5KnR8ChmhJSe0ZYUdtGUDbIfck409+3XtHM/L99NbU211FY2nbzKV7G/YFVt32PUbUQd6
	PehBaIBOdeaFzU51ueRW2bHZNgHVZ4GyfpTp2R2EtKU/beY+Pq+yxOr+latoJ++n8dbf0C+JYoy
	SrfvB7YmjBYV/A9ekcpf9JSIthQdRKIWVmswsbLjJeUdOYFmLUO2YufALtggouQvE0lhRc=
X-Received: by 2002:a05:600c:4342:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-48c6d455f69mr64308955e9.2.1777871875897;
        Sun, 03 May 2026 22:17:55 -0700 (PDT)
Message-ID: <e17cd134-a214-4f37-a03b-c71a54098d38@suse.com>
Date: Mon, 4 May 2026 07:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hypfs: add ASSERT_UNREACHABLE() in
 hypfs_get_entry_rel()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6db49190e85a30c0129f251ce718d50923baba8d.1777387070.git.dmytro_prokopchuk1@epam.com>
 <83b1e26a-cd17-4f64-ae82-dbf56f95b4ad@citrix.com>
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
In-Reply-To: <83b1e26a-cd17-4f64-ae82-dbf56f95b4ad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1777871876-2BD6B938-9EF1472B/0/0
X-purgate-type: clean
X-purgate-size: 2095
X-Rspamd-Queue-Id: 1B18C4B8797
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,patchew.org:url,epam.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 29.04.2026 11:44, Andrew Cooper wrote:
> On 28/04/2026 7:19 pm, Dmytro Prokopchuk1 wrote:
>> The statement 'return ERR_PTR(-ENOENT);' on the final line of the
>> function 'hypfs_get_entry_rel()' is unreachable because the logic within
>> the infinite loop 'for (;;)' provides all possible exit paths for the
>> function. So there is no execution path to exit the loop and reach the
>> final that statement.
>>
>> This unreachable code violates MISRA C Rule 2.1 which states: "A project
>> shall not contain unreachable code".
>>
>> To fix that and potential compilers "control reaches end of non-void
>> function" warning, mark the code path as unreachable using macro
>> 'ASSERT_UNREACHABLE()'.
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> ---
>> Changes in v2:
>> - add ASSERT_UNREACHABLE() before the final return statement instead of removing it
>> Test CI pipeline:
>> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2485661910
>> Link to v1:
>> https://patchew.org/Xen/341811ced2943fb79d0235c27781c564c7bdaf02.1775749146.git.dmytro._5Fprokopchuk1@epam.com/
>> ---
>>  xen/common/hypfs.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
>> index cdf4ee0171..02fb234568 100644
>> --- a/xen/common/hypfs.c
>> +++ b/xen/common/hypfs.c
>> @@ -348,6 +348,7 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
>>          dir = container_of(entry, struct hypfs_entry_dir, e);
>>      }
>>  
>> +    ASSERT_UNREACHABLE();
>>      return ERR_PTR(-ENOENT);
>>  }
>>  
> 
> No.  This is absurd.

Why?

> Not to mention that you are *definitely* not fixing the stated MISRA rule.

Correct. It is instead deviating that rule for this code instance. I'm pretty
sure we have a few other similar pieces of code elsewhere.

In any event - your reply isn't really actionable. If you want things done
differently, then please make a concrete suggestion. Otherwise, in a couple
of days, I'll commit this with Jürgen's R-b.

Jan

