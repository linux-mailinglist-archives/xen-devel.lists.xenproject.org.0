Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e63EJsrtMGpwYwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 08:31:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 022C368C882
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 08:31:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=CCQU7jDp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338671.1599706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNKc-00067O-9u; Tue, 16 Jun 2026 06:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338671.1599706; Tue, 16 Jun 2026 06:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNKc-00065G-6V; Tue, 16 Jun 2026 06:31:30 +0000
Received: by outflank-mailman (input) for mailman id 1338671;
 Tue, 16 Jun 2026 06:31:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZNKb-000658-0r
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 06:31:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZNKa-004IHF-Dg
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 08:31:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30edb3-2eae-0a2a0a5409dd-0a2a4509de04-36
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:31:28 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30edc0-2497-0a2a45090019-d155802cad8a-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:31:28 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso30742295e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 23:31:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa97227sm52927065e9.13.2026.06.15.23.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 23:31:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1781591487; x=1782196287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y10XFG+2FXIPHRwy8fqM6pUjca/EM4vhaqsauDGPwYI=;
        b=CCQU7jDp1q65kdkMRIhJkDToInmB2o7hOmvY78dklRunniwe/ZLuA31fQKDQPdvnLW
         NfogbRXm1dJQB6GzWQc1zbRrHnvcbPz/y8nS5eXp5Lyrt/T47FkKLQb0aOEGgtN16mMt
         e0Oiw7NCudmkzB4Ho1jp14zVV5llb9wYjjPD9h7u6+nqGd0+p/QHGgWZ3EbqZCTWB1Aq
         DUIoh+PPsX3jz6DHFnUClqqnvoyTSE6jR8bXVWr8eYZCYClj3fjRVHI4vGDmxnHA/G6V
         ZfrIgb6MwZErrtw6UFyZ/Z+lL57NQrynFp0FxvreBtofMFjodoh75A6NMt7+AGkjIb6T
         oHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591487; x=1782196287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y10XFG+2FXIPHRwy8fqM6pUjca/EM4vhaqsauDGPwYI=;
        b=ZuunrOHYy0H4ZoiC5ehBi2/UOSuqofeo/3hloDbYrh2uCghDf+e4KoDt78NM15qbUp
         eyiJr2tUH2gZl14A2asW9TW9Vuj6/GvSmwnKDZaTD5h6hKzNW7WspP4Nif+aPNZsnYNs
         6IvLoh7rLpTmDHr/SWNXm121ZqyGoHbsAS1K7HTWCNocjbxdKvulNL6Xos44sPt/zT+4
         sOmY3/LsHYhrnCLfgIjKLtRbp12MT69ayPRcnEaxGB0A2amI/XBKk+wXb56YaaEAJMqv
         AWxI4Wmc34FS5GIu2TJlkMYel0X7lgBonBgV6G6RfeX7oH/hCPyOY8IYBxTrRLoV5eFj
         48+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8cdyCJdHVmr3BCmy/Hs0KIgwEtBQQlbepwUI8Gr0R9erO9CAv7n25TQ1kH5SP1I/npIXy/l7+WPaY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyhw34FjOrQArikD6KpYG6wjL7YQG+8OEo8xKYuQtuyxzvOWrhe
	KGA35IV95P+u+O631xkUCinQKXD0q9lHR4g0BiGb1T44fEcUoFlCqyF7Pnj5tY9emw==
X-Gm-Gg: Acq92OGwZtgxIafHS82cIfd2IOHgmZAAbvCTXbkEnC1KCf6mVJOM/ZUhGK1EcO54tA6
	uzK31Ex0IF9UOwym6/yzkUlr6RW71V3YdNyCV26jHNtiNh+xbVaKVXqawbg41NMqZ6budL97yPG
	pCvwXelZjPk6DcHlGkktROp9prgQso07FfSd0U0DzvF401SJi1QZ4H3Ff5Seuij7fUVOoL6E4m5
	z27f0olv2cq/T8+BatpGzhX+Fi/hsUuRI8PAsQ2UoJmoQ85iQfw7k0GdSA4bHfdjgLc26RIio5H
	FfZtTnCITVK6+hy5s81HbfgKesmDbcXwz1Q67eRkuICgc05UvMSm1rXIEqnfYtN9d3SyZawxXju
	zrAn2+VY29ENzqQgOmHL+PbYg6MlMWcK2Kwski5SrUPmhFlPiLMRCz4DsZ7e9tgHkh8tWKR3M6m
	Oi/SYiwLnCwciD/NoGok7X4Sy/hl9RHb4O47FmE087VspQCd4GxeJ1Q0vgdrXjwSkk9KPjMyQU4
	AuBX6wQBaWMDxs=
X-Received: by 2002:a05:600c:3151:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-4922ffb823bmr32257245e9.25.1781591487492;
        Mon, 15 Jun 2026 23:31:27 -0700 (PDT)
Message-ID: <ae26a645-7842-434f-b67e-88587380dc3b@suse.com>
Date: Tue, 16 Jun 2026 08:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "xen/cpufreq: fix usages of align_timer() in the
 on-demand governor"
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260615193944.19392-1-jason.andryuk@amd.com>
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
In-Reply-To: <20260615193944.19392-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1781591488-37979A53-CC912D5A/0/0
X-purgate-type: clean
X-purgate-size: 863
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 022C368C882

On 15.06.2026 21:39, Jason Andryuk wrote:
> The original commit showed a ~6% regression in a benchmark.  The call to
> align_timer(firsttick, period) rounds firsttick up to the next mutiple
> of the period, if firsttick % period != 0:
> 
> align_timer(0, period)          -> 0
> align_timer(1, period)          -> period
> align_timer(period, period)     -> period
> align_timer(period + 1, period) -> 2 * period
> 
> So adding the period (sampling_rate) before calling align_timer() will
> in most cases incease the expiration to 2 * period (sampling_rate) (the
> exception being firsttick % period == 0).  This longer timer slows the
> reaction time of the algorithm.
> 
> This reverts commit a0ed5bcfbeee81c91c574ad484faa057054eaf09.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Oh, also Cc: Oleksii for a release-ack.

Jan

