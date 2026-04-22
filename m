Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKZsGniJ6Gk6LgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 10:40:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8944443928
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 10:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290009.1569685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFT7n-0006JO-KW; Wed, 22 Apr 2026 08:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290009.1569685; Wed, 22 Apr 2026 08:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFT7n-0006Ht-Hh; Wed, 22 Apr 2026 08:39:59 +0000
Received: by outflank-mailman (input) for mailman id 1290009;
 Wed, 22 Apr 2026 08:39:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFT7l-0006Hn-Fd
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 08:39:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFT7k-002Ots-SQ
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 10:39:56 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e88954-bab6-0a2a0a5309dd-0a2a450ab3ee-30
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 10:39:56 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8895c-56b3-0a2a450a0019-d1558036e1f0-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 10:39:56 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso70622115e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 01:39:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a55dc9f58sm253482405e9.6.2026.04.22.01.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 01:39:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1776847196; x=1777451996; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pG42mQeGdhgDwTtyHozzxy32oJ8iDpDNOgLgEi8D3UY=;
        b=c3e8x2jjJCq22gWxqJCjpwX0+vnsi219LojZ7O9Eq8VeUwfK3ap8MW+DIBMdCx3kFO
         LUWcIs+8kJpF1wifaRCK2bVeJB0c3xR0iMNhA2yZFNONUYEpbf61kccEz1lB5rXTwegN
         bAOob6H0LTzRQtvwFAFwB2oy1JRX+pP/Xu89njXyVMcVPqeZreONltsFe1xb/BmbCAEC
         O1+PTLAh67i4cpgpDhW8sPFoP3JA9TBHe4JiPS7ikkvyqyJpw5zrvYaMUbRmNtOmjyQ7
         87lFeqWLtXvOJW3jmZN84Apy3yodvX+gOLx8obzpS5A5oZ74kDbI6IUVZYKP3N2l0fsy
         NHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776847196; x=1777451996;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG42mQeGdhgDwTtyHozzxy32oJ8iDpDNOgLgEi8D3UY=;
        b=fyFHqxgv7HpwzSNZRXQpWrt8Bkjexc0dxCxbF7S1LdZXYnqRK98MlUTdaoH9o2tn5C
         FJlcNISk+h7Jfa8053RjI0aVyZ83Mja1Epm44FWHqO6hkJuv9Bm2k1EwIQGzQc+LFvnN
         fZzlyl2hDxyzA12qxp0o2bb9wppe6H0tU1BigtDRQN5pMr5k12tmINyCnMGHFpU+Em46
         8nvy8HhwHJtO4TfdI0rLVvw0UVAF17fPOUfi7/hRuitVf+s2elecceshxSqIyS7iFFyM
         aIPdltttEd7+Q2SPi7yH0fLEk6fTMd1l6tsGUWKDbFrMaV8sUOBKxk1NhSd1PkMWCRZ1
         /Elw==
X-Forwarded-Encrypted: i=1; AFNElJ9G+K7kgHLD0r1suAmtOE39q+vch56X0fN17SMcLnQES5SlpRDFAlOW3sV9ln6qfOGkS4Nw9gAKW34=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzaMbxF9Dyle7irki8CDF/6Pfr076/N6N+cOneppO9ciuJ0MTA
	HSnE0NR/8oLJRZVkGOS7e7vQILF3JMG4TcXEwlwrHSJeQi7gjSpRL/xv3rXPrWEvW6UyfORS+4o
	a7Z6PJg==
X-Gm-Gg: AeBDieshn5q3hA4a5CioYaGtmaY4dS9H+GzD4guyoye/vcUOvc93aTMI5KueLYT7KeF
	MWKmmlpOMfMGE5l6nVG+ePaDXPYT/JbfAVgTL3gAgA/CPcDcSUIJNE8KnZ22nA4Dx+nK9YQltLh
	XivPRvf7TFdSI2IRxsAl3gEl1XjR7S/zy1x6ErEO720xPQ60voDlTdQEIfqRZgZ8jwXNCz43JKk
	f7OpcJWwH+CML6iGZiLzowifm3kYJSaT8FseFx9EkVxN04L9FNeqwyKFzPhZjrieeFygbK0dQVW
	E3saKX2hXER6aeO5yN9c3owY3Upu5YET/kWGAWEshJ1sAO008D+lu22JQaDEB+eUrAKANFLlhQk
	QKijxtqG5d7Mo8CFnWIaopwXQXdjW0279/tVitmEUDBI4XohZ6voz+olRJLju9OqKaWQGKvWHXu
	waDHzMwIbB78VVYtcb7UWin+j+EWdyGJJ/FpUrqvWtzXoJkj5lNl4cX3oWKTnaHarQN/Haj4Huu
	TagNDyupWDMVjz47qYBKbD5Vg==
X-Received: by 2002:a05:600c:1da1:b0:488:f453:b976 with SMTP id 5b1f17b1804b1-488fb7844c5mr340575075e9.27.1776847195842;
        Wed, 22 Apr 2026 01:39:55 -0700 (PDT)
Message-ID: <3df7352b-7502-4c2a-bc3f-0cb4fa7014cf@suse.com>
Date: Wed, 22 Apr 2026 10:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] xen/mm: Refactor claim deduction for later
 functional changes
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1776172526.git.bernhard.kaindl@citrix.com>
 <5302d33e7e896347acc7a8212df4f28ea098e28e.1776172526.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <5302d33e7e896347acc7a8212df4f28ea098e28e.1776172526.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776847196-4616A8B7-46D3BF0D/0/0
X-purgate-type: clean
X-purgate-size: 2427
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C8944443928
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14.04.2026 15:22, Bernhard Kaindl wrote:
> Refactor claim deduction to make the claims accounting model easier to
> follow ahead of later functional changes.
> 
> Three new callers will need to deduct claims, and two of them will also
> need the number of pages deducted to be returned.
> 
> No functional change.
> 
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> ---
> History:
> 
> Functionally unchanged since v4, only minor cleanups have been applied and:
> - Updated the function name deduct_global_claims() to follow standard naming.
> - Moved the other function into another commit as it had no users here.

Is this true? In v4 ...

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -518,6 +518,19 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>      return d->tot_pages;
>  }
>  
> +/* Deduct up to the given amount of pages from the global claims of a domain */
> +static unsigned long deduct_global_claims(struct domain *d,
> +                                          unsigned long reduction)
> +{
> +    reduction = min(reduction, d->outstanding_pages + 0UL);
> +    ASSERT(reduction <= outstanding_claims);

... this was still BUG_ON(), matching ...

> @@ -1067,11 +1079,7 @@ static struct page_info *alloc_heap_pages(
>           * the domain being destroyed before creation is finished.  Losing part
>           * of the claim makes no difference.
>           */
> -        unsigned long outstanding = min(d->outstanding_pages + 0UL, request);
> -
> -        BUG_ON(outstanding > outstanding_claims);

... the original code. Changing this may be okay (albeit I'm unconvinced),
but it would want justifying in the description then.

As to the rename to deduct_global_claims(): With that, wouldn't its 2nd
parameter then better also change to "deduction"? Furthermore, "global" in
the name is ambiguous: It may mean "not per-node", but it may also mean
"not per-domain". The v4 name didn't have such an issue.

One other, wider aspect (which I may or may not have mentioned before):
The mix of unsigned long vs unsigned int for page counts is concerning. It
is why the not overly nice "+ 0UL" is needed. I wonder if we wouldn't do
ourselves a favor if we first normalized all that. Considering that
systems (and hence guests) only ever get larger, it likely should all be
unsigned long.

Jan

