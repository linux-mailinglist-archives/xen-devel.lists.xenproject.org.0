Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KPjgNuwaPWpcxAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 14:11:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D586C56E2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 14:11:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=LFejnZkt;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345563.1604401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcivC-0005IE-7b; Thu, 25 Jun 2026 12:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345563.1604401; Thu, 25 Jun 2026 12:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcivC-0005Fs-4u; Thu, 25 Jun 2026 12:11:06 +0000
Received: by outflank-mailman (input) for mailman id 1345563;
 Thu, 25 Jun 2026 12:11:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcivA-0005Fm-Cv
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 12:11:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wciv9-00DP6c-CU
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 14:11:03 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d1ad6-e002-0a2a0a5209dd-0a2a4505b84e-2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 14:11:03 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d1ad7-3cb2-0a2a45050019-d155802fb589-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 14:11:03 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490cf3000f0so22232065e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 05:11:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49265c89253sm30227015e9.0.2026.06.25.05.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 05:11:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1782389463; x=1782994263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0RTohjRGWkZvsbKvM9Em1lITJ+oOC+v0ko+4dMOmK44=;
        b=LFejnZkt3TEUd2Hb0mXbYwtuQkK6FPMb3urMpkLMdtLVuc1j+CDw+PoCi++2bNcGPJ
         qsB6tk99LX24k6vMoaTMn/SBGD2bY6BY4IQbWFPUkUNYqEXJcBCxptE6X0yU0GFjn8BK
         TwGM+sueX+8r0RPK28l0vU7cFuXFtHDh2qincpU9gegeH3qPh83x3e4EUcpjXKxw+u6W
         AG8FUr66XXZ7+MH611iMkYacZf8rJJ348hJ3xucldtaikOwUGingKO9oz48IJMmFpKx+
         29qPCFSf4JSPsUAr8A7olPRkwpdg90z5FTvrJOfYGr/rr1UQAqtFUOIy+WTC26LL0ZP2
         Mlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389463; x=1782994263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RTohjRGWkZvsbKvM9Em1lITJ+oOC+v0ko+4dMOmK44=;
        b=rxEtqnuDTUNmSD95/iM3C+s4F1OWF6fKkkFptYiE99QOd37ssDTvhaPlnqYClw9BMi
         IPznvZPg4A7rxoVt4NYBU1QAFKDJrihhWJJgDy+5og+dpiKSASGOpaoezXK5rd/+GJ0d
         HyHRkEM5myIymmIVvbcKFH/CCIxQez/xPqqPFtjOS5RXYKCOKhIqB+RXhEtp+b3rpxdI
         81nuvHOFPLSkp321JBL1doJK97bLnRmC97kXy8E+a6FYxfvIvEv2mme2kRWNHpFxys7q
         2JivDtjxcwt5TUK7QZGdeAc07yPmSz0pNysk39dckkI6LiNyerajnQm8TFg1fOp6a4Mo
         xMLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ddgiDKGJm3P6loFVr8sBG0KuH8780Rd75KBJRhq7SuM/8sGQIGmW1onLNPvyeGmvzP2hPSvEVLRo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytHqTyDKBJ29CSGT2T0orlxOLeG1natFpY+wkXxJ1At4aBg6aY
	x8auLd4INKXuZUSRWr1Uitw1sUyOpMvzyl05nUxjE4AMqTaf4sv4JA4BvFwh/6JUtg==
X-Gm-Gg: AfdE7clVujny/+mOVVZQQWpXeATO0mfrxpw9kOMc1/loye05nVoDeZ4qRWy2rwxnUk/
	tSap7xNMzVeFgOSPYkP5OEsIenDE+FDFilRKK3b5yem/tAqDBrqruLCly75ClUrhmqIEJs5/HBC
	P3+Epwk4M10qgwWmYpM027xQOQWhOx68NmugctmAqi9GjDyFpl4ObfXUR7EvVV8WvX2r6VjFLBi
	uS6TsDO6VH7J5VfvpNacDnnD7aeo1liV+fSvj/gPNfvt9xycoSD5MBvw+Fw3rDYWprys0n94Dyl
	GvEu8cQeL6w4notI7Kx9E4yhA7UkisXvSD8q6i13qgQHEfKW59OAAEnDTUpwjw3co162RSYzBJs
	OVcrptwPds7YFOYCdFSLivgZZ6bsJbRgKKHPITO39aZtfHaCldldRWsy2J6rw6Bd2qqpmxBgkpr
	g9NGKH3hqyrPwOGqwO/iVPJidFOxZq5khI+sGY5AYTEaPQEPNn7bT8TSbXzBAhXkVf6fnawGioP
	0As
X-Received: by 2002:a05:600c:138b:b0:492:4a50:41fe with SMTP id 5b1f17b1804b1-49266891ffcmr26493055e9.22.1782389462665;
        Thu, 25 Jun 2026 05:11:02 -0700 (PDT)
Message-ID: <1e0fd5bd-8472-4d6c-9df6-0a6d22af51c7@suse.com>
Date: Thu, 25 Jun 2026 14:11:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] nestedsvm: Allow destroying the domain fully
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
 <20260526124027.573412-7-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260526124027.573412-7-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1782389463-171142B8-B0CBC202/0/0
X-purgate-type: clean
X-purgate-size: 703
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
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
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39D586C56E2

On 26.05.2026 14:40, Ross Lagerwall wrote:
> Unmapping the virtual VMCB is performed near the end of the domain
> destroy procedure but the mapped guest frame prevents domain destroy
> from getting to that point. This means guests that call VMRUN cannot
> be fully destroyed.
> 
> Move the unmap of the virtual VMCB earlier to fix the issue.
> 
> Fixes: bcf557675d85 ("x86: properly use map_domain_page() in nested HVM code")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Afaict this is independent of the earlier patches, and hence could go in once
the tree is properly (or at least partly) open again after branching?

Jan

