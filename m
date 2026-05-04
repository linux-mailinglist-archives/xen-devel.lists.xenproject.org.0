Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBejLQ+W+GkhwwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:50:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293324BD3B7
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:50:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299887.1574451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJskV-0002WH-S6; Mon, 04 May 2026 12:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299887.1574451; Mon, 04 May 2026 12:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJskV-0002U1-PZ; Mon, 04 May 2026 12:50:11 +0000
Received: by outflank-mailman (input) for mailman id 1299887;
 Mon, 04 May 2026 12:50:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJskU-0002Tt-IO
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:50:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJskT-00G88V-Uk
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:50:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f89601-bab6-0a2a0a5309dd-0a2a4503e5e0-4
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:50:09 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f89601-672d-0a2a45030019-d155dd32cc85-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:50:09 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-44ce78ab5feso1365929f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 05:50:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a981defb3sm34625260f8f.20.2026.05.04.05.50.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 05:50:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1777899009; x=1778503809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=odkks9yDAvJdDgZY2aqAR0zCAOsXe4P4ox0r0pQAHE0=;
        b=FEZvpZqQGsCFee+rKwBkfnNz2+vDfJEPmCBM3FHSjFlGxSZOElTZoE3E45LHnlTOZ0
         mLw9b3NJoIPU2LSsNsfehD840QTuy12mhWNRewdEuFi8eIDYIxmkh6qGwjHRfsGIjJtm
         0H/4DGvkZvUplkO0lDXznN20FSlDhtPuAv7wDzibdc0Ev5p1CrxqK5/KTbjcwCPxzfGS
         x76si2ePsc/SmXw1dUxSCE2QZQGUpwZufmlX4pg2xLvCNk9hHKKhpDbRkv9Ku6h/abAF
         VswwpNZ3v5rPUqeucMMz1XD7gOg/9c6f5ZqcJ/7g+42mRprDRPR22en1YQim4v0QdVIs
         YhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899009; x=1778503809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odkks9yDAvJdDgZY2aqAR0zCAOsXe4P4ox0r0pQAHE0=;
        b=ODr5ZbsmX/WRfsoaIfVm2KepHJlzX+U0zZjmeqQzJB2lREf2RzE1cjwVY7B16ngxkq
         J0lPMT3LB3HZ+SHeP+M3eA8CvG/esMXRXNrOY/oxV0kppxcOGrvabUPrP/WaSvJENinA
         Rxajg6cXPmj+7GPgGdkgiMNmDUdC4toM6hhRusFQZx8o2Zyl0CjvNuryEALPpP3v9Q0X
         NE8mOHWhSWd5UcPwezpgE5oBViEmhkBB4XfcJx56SXGdWkRGPcbfLx5KrA6kcOqqabhR
         JV6FNZFpee/RlexagOvHrSIsi9RWKaDSJcQ8pKnF4LS6ud8ZVBk7NL6qRja4QpeoOY6O
         j9SA==
X-Forwarded-Encrypted: i=1; AFNElJ8TXHm2D/Z5nnXzO+NUDhXKFaBpLKIOV7EVOplYBQdPOq5NmP6TMvV3gzPgN9ewAMaBlcNR8L8+034=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywqt90vkqs1HYlF7uZKifjcNoV+HkJM5v8aoJvd1CajTDK0qHKU
	DGzAL24hHKVxZ59gmxhA2d8gEfYO54Q0zNQj9C7yz2x+31bhGn5HvSsEX8O0OYserA==
X-Gm-Gg: AeBDiestVQ+E7NGtwASVeLJSMLWKIlttjYNj/MqLaEPdN6h3vbA86KcXekcVCNxXI6O
	FuxMAI0d1H0UOq3yr2hoS7O18L55kHCirOPG7ogkWpclSsA8KRSD7VFMxUl4mqVnLOguTD2H1/j
	NvtMsZjk749TKeDCwUmyLxXVceoixYWZvdBVZ95bhToqqDPQHTlzwOMlk2YxOqcLq4GlF7//Rkp
	Xlxyhe6UOxRbjQXh4RhvygY4h+RA9cB5/odWnmrJCj9tcAatWCUKR+5iMBSanQ0nQL07qXurNJO
	Up5s9QqZtcyx0SYcwrTGq5t7heJhsMkV5Xm4f+PyIOIhjrjW4SBdc5ZMIUO5bZ0CMvZgWyzNkFZ
	5kly4Uf69NuadfsUaaTlT5E6CQG0ddP5eGPVIsn1T2NG2OinGrQD+8Mxacx0VCgR5CdqgQxKbas
	5LXVXNwpd1SYQ8cMngkXjNsUcE2HlrD8MhR+3bdRRb8tAieyGeSuEwxmOdUSFDqRpuJMetKMY/f
	963KYWR9TY=
X-Received: by 2002:a05:6000:2001:b0:43f:debd:feb1 with SMTP id ffacd0b85a97d-44bb6e8e001mr16624118f8f.39.1777899008883;
        Mon, 04 May 2026 05:50:08 -0700 (PDT)
Message-ID: <5109e43f-168a-4522-ac24-bd334df129e0@suse.com>
Date: Mon, 4 May 2026 14:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] xen/mm: normalize page count types to unsigned long
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <6fd2be46d934688b19b5c84c53c745230cd345d6.1776871968.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <6fd2be46d934688b19b5c84c53c745230cd345d6.1776871968.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1777899009-2B56F938-CA744A03/0/0
X-purgate-type: clean
X-purgate-size: 1788
X-Rspamd-Queue-Id: 293324BD3B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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

On 22.04.2026 17:33, Bernhard Kaindl wrote:
> The current use of long for total_avail_pages and outstanding_claims
> creates an unnecessary mix of signed and unsigned types during page
> allocation calculations. This necessitates awkward constructs
> like '+ 0UL' to satisfy type matching in macros such as min().
> 
> Address this by normalizing `total_avail_pages` and `outstanding_claims`
> from `long` to `unsigned long`.
> 
> As a direct consequence of making `total_avail_pages` unsigned, the
> post-decrement assertions checking for `>= 0` are no longer logically
> sound. Adjust those assertions to pre-decrement checks.
> 
> No functional change intended.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>

Just to mention - my original comment was quite a bit wider. It was
specifically made in context of a use of d->outstanding_pages. Yet of
course I don't mind this as a 1st step.

> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -484,10 +484,11 @@ static heap_by_zone_and_order_t *_heap[MAX_NUMNODES];
>  static unsigned long node_need_scrub[MAX_NUMNODES];
>  
>  static unsigned long *avail[MAX_NUMNODES];
> -static long total_avail_pages;
> +static unsigned long total_avail_pages;
>  
>  static DEFINE_SPINLOCK(heap_lock);
> -static long outstanding_claims; /* total outstanding claims by all domains */
> +/* total outstanding claims by all domains */
> +static unsigned long outstanding_claims;

Moving the comment is certainly fine, yet while doing so would you mind
also correcting style? (I'll make the adjustment while committing, but
going forward please remember doing so yourself.)

Jan

