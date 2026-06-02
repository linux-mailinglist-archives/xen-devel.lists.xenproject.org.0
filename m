Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z58sJATNHmosVQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:31:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D4362E0A1
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:30:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=VCgEAdNG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324916.1590422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOGH-0003VA-DJ; Tue, 02 Jun 2026 12:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324916.1590422; Tue, 02 Jun 2026 12:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOGH-0003SS-AZ; Tue, 02 Jun 2026 12:30:25 +0000
Received: by outflank-mailman (input) for mailman id 1324916;
 Tue, 02 Jun 2026 12:30:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUOGF-0003SM-HN
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:30:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUOGE-00857q-Tl
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:30:22 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1eccdb-e002-0a2a0a5209dd-0a2a4505c6e6-26
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:30:22 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1eccde-aaa8-0a2a45050019-d155802cc541-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:30:22 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso14457575e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:30:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e88fdesm67332375e9.14.2026.06.02.05.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 05:30:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1780403422; x=1781008222; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2KBv5uO2ztxtyUJM6aKgCnkl3X/WD9NrViNsDXoc/cM=;
        b=VCgEAdNGENWTBBsImmAMQUkqOZWvyNi08J/xMZSzhclGwOxnxmKIA/sXI++Uf7TAnp
         rDQjQ97Ii71jooXQFTpg7phLT08zc+A7dwNAyGvLTF3H7Ky7OlPbQC4+n+ABaZNgVhvw
         i0ffrLh6CGaSblxcjFhmxTs95v1N4T7IwRfUNUonhbEr0MIq6SIvz6KaRkiVtXKzJWzv
         duJta1mjPGDDUJSSh4xe5+VApy9XLNH3FHwFVRBg1rCkbBwJxpGwwnhdLpbHQ+F3XkO3
         SLeNimX+Qo8pKXyok9iIpl4wcsL+FU8fdOJ8oIwvA1iERdKUsV6NxMjRsOOTzLHF/u6Q
         7Gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780403422; x=1781008222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KBv5uO2ztxtyUJM6aKgCnkl3X/WD9NrViNsDXoc/cM=;
        b=EBddj+adlzGVfCMSZdFb4SnN2BPmBCFtSM4vzfAPNt34s4qU1sbqQ1scqPj9M6jiLk
         lTKVSsRgRHA4ZvmaYhH1dvXc6qDkBL0BXpSiBkoxYVzxEEdEZ27cuy3qbY1QPb4Sd6oM
         Aim1Qzmln04QxkNWuX1ETJ1uvbE8B2mY48AJL7eDk/7nNZek+nGURGdXoGq4H4aMRn4W
         qnaRLA3Y9LfeVzKPriymZJmmD44GndYLjJveBn17W2Y/kG+KqFT7/JqgVWPOY73PD9gI
         kS1GsTj9AJ6eDytdBokdbz8J6bM7So0JW9ecNjDazOukg2CaYmonkKmF92+bFUXoAUTB
         CfLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Nd7JfBN5Hq5aw4X75XOj01cqSGm6Am8rZF2b3ScGoPQP6NT65B5w/ZdbLVU5RuLnIb0EXzaojBjQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx56zz3nVo3tVBrzSeEG8bWNVXjLdTxN7W5xH1njLsHVuFymYvL
	Tg1zoUOrlYm4cCYQljiKOsNX6DWbrXUmX0MaM7hZqMOdDpeQ0O7TvvGXFS8P1kyBHQ==
X-Gm-Gg: Acq92OEd0dzezsd5puB06yri4ZNGHbFuxmCm0jPVGoCf/3XexevALvXc5zkgdIuQI1h
	2mQlgZKyFcNz4srEaW44ExXE/ZWH6YF1XmyJsiYG42do1moUuoS9Kka5/V8pHa6rFOpXPdcSW9D
	ijvNgiRzeMlLaAzhXktQdIiKA+U93d5FBfhF3wYsLo2MYN9AOBGgaTmKG30Rw7xbfBcbBocStOP
	DsuP/afX19T0HUmJDTXEZdJ3DX95APH9rMfRFYSlE7hSne7z2MztjKCK6y8el2aH4nbZE5eR7sO
	mC6w4RoXCyoDuWXjMmNNr2eTDF8fuXJ4RmPAdvVocEXZWvpBu6s52AG6miZx2rzFC3n6Gb2+GTM
	Dr5HjZp4LYB2bWKPVJQzitQUUHKqDULAtwN/szrSTaOHq1rag56Qi+IgQ6OcdagAbXGjSAk64m1
	/BxiTfyiSqhjoNFyKKjAu8FNLjdBNS7SvM/fCy1CnftCiURyHDfCZHI4o6TyIv3eY+c0hDqXdvJ
	IIr/dNMj6iCxxyhNVcq57pdjA==
X-Received: by 2002:a05:600c:870c:b0:490:b2a6:8c2b with SMTP id 5b1f17b1804b1-490b2a68d7cmr38688625e9.10.1780403422013;
        Tue, 02 Jun 2026 05:30:22 -0700 (PDT)
Message-ID: <4cdee2ea-8673-4280-8b62-c95485cbcc35@suse.com>
Date: Tue, 2 Jun 2026 14:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] xen/mm: Normalize per-domain page counters, >16 TiB
 per domain
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1780058608.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <cover.1780058608.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1780403422-D8145443-01E39937/0/0
X-purgate-type: clean
X-purgate-size: 1996
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1D4362E0A1

On 29.05.2026 14:43, Bernhard Kaindl wrote:
> Summary of a comment by Jan Beulich motivating this submission:
>> Considering that systems (and hence guests) only ever get larger, we
>> should consider to normalize per-domain page counters to unsigned long.
> 
> This series enables supporting guests >16 TiB in the future
> once the system support for machines >16 TiB is implemented.
> 
> 1. xen/mm: Normalize common per-domain page counters to unsigned long
> 2. x86/mm: Normalize X86 per-domain page counters to unsigned long
> 3. xen/mm: Static memory: Widen assign_pages(nr) to unsigned long
> 4. xen/mm: Static memory: Widen domstatic plumbing to unsigned long
> 5. xen/mm: device-tree: Widen static page counts to unsigned long
> 6. xen/arch/x86/dom0_build.c: Extend the upper limit for Dom0's max_pages
> 7. tools/libs/stat/xenstat.c: Extend the "no maximum" sentinel for max_pages
> 
> This series is based on the NUMA claim sets v7 series:
> https://lists.xen.org/archives/html/xen-devel/2026-05/msg00363.html
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> 
> Bernhard Kaindl (7):
>   xen/mm: Normalize common per-domain page counters to unsigned long
>   x86/mm: Normalize X86 per-domain page counters to unsigned long
>   xen/mm: Static memory: Widen assign_pages(nr) to unsigned long
>   xen/mm: Static memory: Widen domstatic plumbing to unsigned long
>   xen/mm: device-tree: Widen static page counts to unsigned long
>   xen/arch/x86/dom0_build.c: Extend the upper limit for Dom0's max_pages
>   tools/libs/stat/xenstat.c: Extend the "no maximum" sentinel for
>     max_pages

Btw, I have no copy of this last patch in may mailbox. Going from the
list archive, imo using ULONG_MAX is as bad as UINT_MAX: There'll be the
same issue again when the field type changes another time. This really
needs abstracting properly, imo. Yet then I'm not a toolstack
maintainer ...

Jan

