Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPkVIBy6BmpAnQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:15:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E821C549E71
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309569.1580611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNlpi-0007jC-Vj; Fri, 15 May 2026 06:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309569.1580611; Fri, 15 May 2026 06:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNlpi-0007gg-T5; Fri, 15 May 2026 06:15:38 +0000
Received: by outflank-mailman (input) for mailman id 1309569;
 Fri, 15 May 2026 06:15:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNlph-0007ga-CX
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:15:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNlpg-00CAhQ-Op
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 08:15:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06b9ff-e002-0a2a0a5209dd-0a2a4504cb6c-12
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:15:36 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06ba08-1dec-0a2a45040019-d1558034e8b7-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:15:36 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so76404275e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 23:15:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5694fbfsm69374945e9.6.2026.05.14.23.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 23:15:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1778825736; x=1779430536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tOeh1BXSFT2Bx9CaWNfhtLzbxajWynEKrk+eP+GdN9w=;
        b=ZscDR5CbPeNsiNLCweWJy9mHQWXfXFhqEUZI2O4xbNud0/pMn7rstTu3P6r/Xg7SjE
         2beLsA9t3zOB5RhdcilLn8Yfx7pAVQv2gemcrtoKi1JWt7ej/7johiYD3mnigA83fjWT
         T503SPCUOgZ8VnjATS+QWKDm8JkMFr6FIIpyYYslb8koKgTRZzp+KU1Hyaw6u4/F0uFf
         4DTK4HnxSHS+6WlaztyY0yE+xZGCOricCE/1cqpMuZ30xkquqxkSGd633tL7anGN7O1P
         1+IUkjoP76cYSbE+6QN3qZmqPtQjUyXST+qT7sUE/0CAH5aGQf/wbTOZUK/KXxBJA5pP
         +nDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778825736; x=1779430536;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOeh1BXSFT2Bx9CaWNfhtLzbxajWynEKrk+eP+GdN9w=;
        b=jV0c077K1aoTBw76GmB0gLBUNtWWbMAEc6wkD79LGzBIhnqdc9Khjsz5hNlZR1l0G9
         1Zvc6h4UiY7ghzfSE01tmc/crJuWGMK4qst7X6K6kTpFWawuB3Ob9Xt+gvWYZsSG5h6X
         nMkXQQ+zox/xB19c3EqR8FfdQu+KJKp6zDpINacNIxoSxiWoXksAbuuIgPyRj1OJh9vn
         kBVOnlMpgOds58ypB7CtXJyM8DUFPXyEDV3ykvp53168QtL4Rwur28WpWd7GMR99xDws
         qIWlIlIF84H67374dZEE6YUzPiMp2MjO/lEQPUl/dMU+HpNokof/av/cFv0nHLIUcuKd
         0Drw==
X-Gm-Message-State: AOJu0Yy8utwLUie8QOJPvQaoDySngXR0QCQubLS05OnbYO/DYyR6vojQ
	wvbbnA7AmhpVQrv+j8ZxQq5S+Fb6ca3jRpvwW6JOdM4Hmc/XG8dG6K020LtM1WiG8w==
X-Gm-Gg: Acq92OETyxgQr1meEW6pcFzJs+JlOQ0Svs8BX7L8cRbvJYA40+l9oDqnLXk+HxTRXb3
	/jet/bvVg5+8FNtAxMGUO/mBcDqmCfiiEghD1Whocg2bL2Tw+7Uq4sZNPvNevATQRWDuUAaWyvY
	aGb+vhaDchUvx9Qq5Hur08PHilr2ok8MqFUEquynONNSYbjNy8zlBii3TaGg09cxJWAKP490/5y
	KYNJEH2XCHCOveOzFPaNJ/Hfm39A+/za4GXq6cd+jHuKMukPOV21w01ySrXmQ3tL7wHikTaeFfm
	Mv0Qo6fHuJ5jruAseLrOTmR/oe1FxcWjtDqrDpOTUFHX6/uRhzLUfMbiiIsILCr/K5C7pmsLuXM
	RpUx714YpKKgPiYBa1+7y8UFyXiYt8WPMUDpGVkL6qBDblU0TkbYcjn8wfU0N+5CW71Hd2piC5D
	LzpfZ003Iu2Dv1WMiPF61T3PrBu0d4C4g+D5wOP2zyuPli7Uv9kQgxceLvPP4yi3hoo9UjHLonG
	s2gBwoRObmgkBU=
X-Received: by 2002:a05:600c:37ca:b0:489:1b10:d896 with SMTP id 5b1f17b1804b1-48fe59af198mr35543645e9.0.1778825736127;
        Thu, 14 May 2026 23:15:36 -0700 (PDT)
Message-ID: <0ae5ac5e-49e5-48f6-9966-b77aef8596f4@suse.com>
Date: Fri, 15 May 2026 08:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/shadow: split a nested max() invocation
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
 <146d214c-e766-4b3f-bc50-0b9beee50473@suse.com>
 <337dd83065dae7555dfecb2163241ead@bugseng.com>
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
In-Reply-To: <337dd83065dae7555dfecb2163241ead@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1778825736-437693FF-6C0E48A2/0/0
X-purgate-type: clean
X-purgate-size: 1975
X-Rspamd-Queue-Id: E821C549E71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Action: no action

On 14.05.2026 07:08, Nicola Vetrini wrote:
> On 2026-05-13 13:46, Jan Beulich wrote:
>> Such nesting causes the inner instance to shadow the outer instance's
>> macro-local variables, thus violating Misra C:2012 rule 5.3 ("An
>> identifier declared in an inner scope shall not hide an identifier
>> declared in an outer scope"). Use an intermediate variable for the
>> inner invocation. No difference in generated code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Supposedly this case is deviated (rules.rst). Does that deviation not 
>> work
>> quite right? Actually, am I mis-reading deviations.ecl or is the
>> respective setting only covering the combination of min() and max(), 
>> but
>> not multiple use of the same macro? Furthermore, why would e.g.
>> min(max_t(), ...) need a deviation? Even more generally, aren't those
>> expressions too permissive?
> 
> Yeah, it does cover only mixing max(_t)?/min(_t)? because that was the 
> only pattern that emerged in the safety scope originally. the _t is not 
> there for mixing e.g. min(max_t(...), ...) but rather for 
> min_t(max_t(...), ...) and viceversa; could be split if you think it's 
> worth it.

Yes, I think they would better be split. We shouldn't deviate
max(min_t(), ...) and alike.

> These expressions are a tad broad, because it's way more 
> complicated to express the condition: "ignore overlapping only beetween 
> identifiers defined in the expansion of max/min when used together". 

I understand the "more complicated" aspect, but from an assessor's pov
being too broad (lax) in deviations might easily be a negative point.

> Perhaps it could be done, but then if you are already implicitly using 
> shadowing in those instances maybe that's not as serious a concern?
> 
> In any case, the patch looks ok to me, so
> 
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thanks, also for all the other reviews you did.

Jan

