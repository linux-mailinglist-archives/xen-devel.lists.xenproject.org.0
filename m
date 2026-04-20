Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMgUACzl5WlkpAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 10:34:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3442834B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 10:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285521.1566526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEk5U-000148-Qn; Mon, 20 Apr 2026 08:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285521.1566526; Mon, 20 Apr 2026 08:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEk5U-00011x-OF; Mon, 20 Apr 2026 08:34:36 +0000
Received: by outflank-mailman (input) for mailman id 1285521;
 Mon, 20 Apr 2026 08:34:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wEk5T-00011r-CS
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 08:34:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEk5S-00CMgu-L5
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 10:34:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e5e518-2eae-0a2a0a5409dd-0a2a45019586-8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 10:34:34 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e5e51a-c1f2-0a2a45010019-d1558032cd3f-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 10:34:34 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso29369925e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 01:34:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f82bbsm439133405e9.3.2026.04.20.01.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 01:34:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1776674074; x=1777278874; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xFJ3uqps6uq7tfvbkd5g4KC06QaWSPLaScIgAffoNoI=;
        b=SXDuHkoohGhvwCuLf2+Ak36BMHRqh9I/B1Hl0jCaw0Gw17N9NVH6vVGNDkzjSK+zSi
         G4l2U8kuSqFsJHsqL9l059tbT8ndP9aXEG8w7D3rADNiMwxvBLXNGtnvbxquplEvi2Rw
         Zgpib77BZbnQp2j0KJcAjtmrnS5fINlnStEL+aVWiMxzOGQuUuG/DJEx6oNMm38nVKtK
         AROiMu1EPUPcD0wqCBGwiILNIJg+I7rIZgT5qgjng2t+QOdeyBJcFiFtVYFjEUiS72nk
         hMevH4qGdzDfHzz6AbadJo38DS4LikSAWiLi0AP4VAJ7TyyxrmIM/ElWtHIiOItF1Ege
         5TDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674074; x=1777278874;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFJ3uqps6uq7tfvbkd5g4KC06QaWSPLaScIgAffoNoI=;
        b=AF2AQmA+P/CG+GBVQhM5q37ySjDdHQMaln8Y6voZ0tAw5Cekhmi7T1dITR4pduttBc
         BlLvn6cqgaRroKZY5yz6GxFHYXTwVlY7gGBnEUjFWbxUKxuIgiD8Wlb7LbUbne29JWTr
         VESWAMVZt2xjohycxjOOcjjLQvfg88EOdL1sIJMsBq0XNC+QbWgSdDCSTmt5SC3B6rmr
         K5VUWQICY1fpO73+yoD/8Z9kAlAmW9IfgodTM/7MTWhBflb4VRLgH+KOPSiCZCLaTneR
         8yF4RC6VaLKPusDa7EkvZqhXzjIRLfKJTcYu+1wjc+P2BD9reqqDQ9H7MlxQIkiwHzfu
         QS9A==
X-Forwarded-Encrypted: i=1; AFNElJ/qeA99wh52e6hPg8Oj3nGucQqtQXaVEG/TySK2jcpc1HHp2I54nyeUQyiPw3IwSOLCo5QUlwUUCsk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzS/Z8zsUieg8WOpOhZdBudZFReqACSefUeg7GDI5JKAKdv41Um
	cC3T08a+GBm1o1OH9Rhy2PLG9v5wOwXxlKc6tr+U1r6dMBzD6S9iYx4BjpZTaIIyuMtOxzs+Ypt
	/PZtjgQ==
X-Gm-Gg: AeBDievy3EccG/oWRR8WhV/ceG7WTQsM275MxO45DBP9aXDZZ9bkByO2AJt+uNLLDhf
	2kQOwQyOmxCO7CiXjWIdJy5wwg3XXhufBeLPM6wcQiZLfoXJ1wqniJOKRZlpCwO3av79jBLYq9I
	lTaY9yfCS4E/ktY9SxKpKyQbsTB6wJUZcH0bYkk0cDBoMymDeRxkWWn6q7yQNRNHUXIiqFnVB9L
	eodyyd622wLkz3bWEQZji9azGrnz9G8Rxe/aB/OJinfsKjtsNOr8TsFX+ovF6/LUacGXBfs+xl4
	ZaG+VrYbIP7bmgmU/s7Hc+dAue7AlTDVac+CRWcR8LlVTPHP9DHiR2KZROJ3mJjlRPIsng6Rr15
	jsB7AWyRN0/dw5CDJYc7X7tymUhmJX+qKbYy4SuOoHd8DKB0nK2Q2SZ20tEHTIf6CpQctfxNwLM
	9PGct3J6NkVHgnGj+5VB6hc7ON3fiv+3zEerkBsT/MDeszd3C3+aTFZtw65KJqKogeax5z6ZF3u
	FWi5pktsPVA+i6iyr99a87ypw==
X-Received: by 2002:a05:600c:a416:b0:488:e7e4:8425 with SMTP id 5b1f17b1804b1-488fb787674mr141488105e9.23.1776674073920;
        Mon, 20 Apr 2026 01:34:33 -0700 (PDT)
Message-ID: <4d58f375-b422-4c2c-8416-1eba3725a776@suse.com>
Date: Mon, 20 Apr 2026 10:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Force error checking for reserve_e820_ram()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260417160828.526063-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260417160828.526063-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776674074-BDC64FF4-DDF4E661/0/0
X-purgate-type: clean
X-purgate-size: 634
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:ross.lagerwall@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 61F3442834B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17.04.2026 18:08, Andrew Cooper wrote:
> --- a/xen/arch/x86/include/asm/e820.h
> +++ b/xen/arch/x86/include/asm/e820.h
> @@ -25,7 +25,7 @@ struct e820map {
>  
>  extern int sanitize_e820_map(struct e820entry *biosmap, unsigned int *pnr_map);
>  extern int e820_all_mapped(u64 start, u64 end, unsigned type);
> -extern int reserve_e820_ram(struct e820map *map, uint64_t s, uint64_t e);
> +extern int __must_check reserve_e820_ram(struct e820map *map, uint64_t s, uint64_t e);

Nit: This line has grown too long now. With this and the adjustments Ross
has asked for:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

