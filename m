Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /GZ/CjLTHmoaVgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:57:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F69262E35D
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:57:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=OA9WqgB9;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324969.1590476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOg9-0001B2-LE; Tue, 02 Jun 2026 12:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324969.1590476; Tue, 02 Jun 2026 12:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOg9-00018g-IC; Tue, 02 Jun 2026 12:57:09 +0000
Received: by outflank-mailman (input) for mailman id 1324969;
 Tue, 02 Jun 2026 12:57:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUOg7-00018a-Sv
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:57:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUOg7-00CALA-9E
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:57:07 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ed30a-bab6-0a2a0a5309dd-0a2a4505d622-26
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:57:07 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ed2e6-aaa8-0a2a45050019-d1558034d1b1-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:56:06 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso22073065e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:56:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e88fdesm68826855e9.14.2026.06.02.05.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 05:56:06 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780404966; x=1781009766; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qpW6keh8y4Q24+avBj4YTH27Oi2yu0Poy9+KGMgY73s=;
        b=OA9WqgB9ru3mXA1reKak6nFwb9t8453w+8Pzp0aNlXlJ1842QIh5Rj414hz8rHqY3x
         GvwetD3zmT/rGVJNAmSdWLRrLrlR4wCKGMbLXvetrp085pISAlhIUUZQKx4UeBHZjBJo
         sLO2Ll3e74B44hWOleVVtkFeJal8uHWZuIpABkCCbXTJAmIBzqqz7l5vwS8N7T8Xv58D
         FkeJRiH3O6nSZh3ugxzxdcq7WkiDVwRuni1ffrwwH16+iQjo32/AkcfqvvIDC9tvReg4
         rab1/uBsAE9Pss5H5idSY9Ez8DyYC5NxURx511U05CUEFoMXYHgPWphH+Kt/uiEFqhlk
         /Ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780404966; x=1781009766;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpW6keh8y4Q24+avBj4YTH27Oi2yu0Poy9+KGMgY73s=;
        b=nupB+xXCTqKMfHn0wcGHgzX+WZAai4ZLz/SlG242FYbPl+PunMv0+IJtQQOmj++91h
         9w0mNmtD4giPRKJT4Le0gjeoPyogLXmnLhCSPIO53GKgmQ2DRT92QaQtX4hjnMu1GHyo
         BWNVKVLAts2HBj6xzPD24++kLf4cXPJTBZI7zg9vQ0xAnQ2ydmDkbKj1qOsox5GEW4Bi
         dma75VUNQuxliaMz7PTJCxnmlf71GqCZ7w6Mk62FjkALej65X9gacG4kOjzzBnb75+8v
         xUHAqgDT73e1W8VwKhwwu0yeWXE4kXMdxT+Fsa8ywMYOwCSsuUayeV4QbBkK4qzBrvdH
         fOpw==
X-Forwarded-Encrypted: i=1; AFNElJ/iyEXv4sPJ8gG0AJyfdwQKivbc45zUdRLPgk2HcKZAJj6gk3NuSsEvNAu5Mtib6mIrrUxzsMp4VLw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yww4xPzacBlhgZLbluQzlqGavPKsGJhnN5WhfeuZuPAPyyDxE+6
	YHJA7BDOKhwm/aGDqPUa76GXutFyaJz07UrMLQuMN5Y67Ib10hNyIZ5tWj55wEhtow==
X-Gm-Gg: Acq92OFwZ8AQqBuhvV9ZYvtQC19N8KgXcT6aE9FzzenXJdQn3tUATWt2kYvfIsqpoTH
	2gA4/U/T2wfULp7Ivvv9NKUR4PRrLKXYpmebk5pSFmyP3wlYGz/eW6XHIG3wEoJU8ZYGd7jzxEd
	ePpCoPv9nyFCD0IrjUVWnQNq2r+6Dvt9JXrRdtJQSfEIYBGFOEAjaHaOwsjh3MW0Dn/h7zrlyG/
	d9wr2CXpdeBz1WNgsF3AM375/jVRAK7a2cCZnyxMeIBsLMW+WPYleAa7cdD721Yhyo5rPSm4zLO
	SMqgihbqLg2/Xt9sZzsm2pra/JyRdnVMd1ExWsRnQmWWi42cwVGj4qVaT2BN1mzp8iNuLB7pPwB
	1PtL9f3rNsv8oFJAtL4yYwsFMalBaeMQ1et3rbNxgah9lA7OQuW5npClq14BmazygKV0k0v10Yh
	x4fYODpgv4RIErZfaHWLrMydL93jPVaD/E4GdFO1P/69E+heqskbskS9N0PQhfKfA1X4gIsle+t
	1Jceb/k/V06lFd28o53IWWpEg==
X-Received: by 2002:a05:600c:4fc4:b0:490:3890:605b with SMTP id 5b1f17b1804b1-490a29637dfmr272118165e9.31.1780404966418;
        Tue, 02 Jun 2026 05:56:06 -0700 (PDT)
Message-ID: <6705dd90-ce04-4d91-9759-0d68efcb7db6@suse.com>
Date: Tue, 2 Jun 2026 14:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] xen/arch/x86/dom0_build.c: Extend the upper limit for
 Dom0's max_pages
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1780058608.git.bernhard.kaindl@citrix.com>
 <ca5e61de283a1dee1b679c5aa27b3c6432b0ffce.1780058608.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <ca5e61de283a1dee1b679c5aa27b3c6432b0ffce.1780058608.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1780404966-DB563443-9BC2DEE9/13/0
X-purgate-type: clean
X-purgate-size: 1002
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
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
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F69262E35D

On 29.05.2026 14:44, Bernhard Kaindl wrote:
> dom0_compute_nr_pages(): Update the upper limit for Dom0's max_pages
> in dom0_compute_nr_pages() to limit from UINT_MAX to ULONG_MAX.
> 
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> ----
> Creating a Dom0 of > 16TB isn't a useful thing,

How do you know?

> but could be for testing.
> ---
>  xen/arch/x86/dom0_build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 80308ca9af46..2ebb8308fbaf 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -440,7 +440,7 @@ unsigned long __init dom0_compute_nr_pages(
>          }
>      }
>  
> -    d->max_pages = min_t(unsigned long, max_pages, UINT_MAX);
> +    d->max_pages = min_t(unsigned long, max_pages, ULONG_MAX);

With this there's no need to use the (type-unsafe) min_t() anymore.
Wherever possible we want to use (type-safe) min().

Jan

