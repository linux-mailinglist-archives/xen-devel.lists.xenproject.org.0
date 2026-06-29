Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f37kFqtsQmqP6wkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 15:01:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A106DAAE7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 15:01:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=GtcXcr9F;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347512.1605350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weBax-0001Sr-Bd; Mon, 29 Jun 2026 13:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347512.1605350; Mon, 29 Jun 2026 13:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weBax-0001Q9-8D; Mon, 29 Jun 2026 13:00:15 +0000
Received: by outflank-mailman (input) for mailman id 1347512;
 Mon, 29 Jun 2026 13:00:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weBav-0001Q3-TB
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 13:00:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weBav-003g4j-1T
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 15:00:13 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a426c56-bab6-0a2a0a5309dd-0a2a450bd41a-34
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 15:00:12 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a426c58-ac48-0a2a450b0019-d155dd36ddd8-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 15:00:09 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4720d22c94aso1336250f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 06:00:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46fccca2781sm24762609f8f.6.2026.06.29.06.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 06:00:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1782738008; x=1783342808; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SnpMQtnJjEY6i4sEtyaRv2FflshskOYxVbpLwnFwv4E=;
        b=GtcXcr9FLXu1U2idGUhMd5j0//sA7jD01p9mVW3DGWISm3aCZr5EY3cNuPAx0LbGmn
         YNJl18WqBgyluBlHMBIH1vo1xZLvyO8MFVJfxlGXygvNKRRTJ2tT9GZd3i66v1F35/Mj
         NYt2ArQ1Dn9KeUgwt4FUJY6+WBcxzh0ZOHaAFTB9sYkWnPp9LqBUqkzuEPFUCV6svsVQ
         vEh9prrZW13X3TSrmbPHX6yd7TgnPw4lofMBpPFQUB9aHAc/sCTRSCO9pX8PL6CmTLR4
         vVjYBYwj1Y0H3X4Qzv/OeYIFqBNSqv94cP3ZF4cc1sy+A+uvHEQPxcBywWWxN+vk4GZn
         afFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782738008; x=1783342808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnpMQtnJjEY6i4sEtyaRv2FflshskOYxVbpLwnFwv4E=;
        b=B25BdVHJhrODLME1VRxOzO+30+SmF4a3X8F7IQp7biOuO5uEdwe3jwdUAVC1X1wf8i
         abJP2GNz2siwjMS3dj33s/M3Cu2Ogxlzam1H4qGFh8BnxTQkBC/nyXgLOu28H4kPCQA/
         8pU7/0zdQt+45G3X2Ns7HDUI87AMx49YJFdi64kZc2+nYgdN4Zb57Z0gnNklm28Dktnw
         x9751saZHMSIrwgnbZWojGpd+XN5+UyKqRpkjNo1rMk1wTunXF2s7LN+MsNhe7UnqnYT
         1zFP7FZORDra+fxLVmKzoTrkAjWd9pJeARi/7RsSfgUY0LIATl0Z7uCuAohAraGIpFyx
         8AZA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9gvT1r1qB8KlP6hv7gpVSm+wTQOhk2mILgqZybxsC7eKqIARJqt2lfC7wtl7G6YFOvu3gyk8bAAM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzcvirgl6o1fmNpWCffG3cAe+pK9a68Z86iU+Z0xRmmMDTCGBhr
	wHl8V2l6kEZ6ZZ8N4vf09SF+MYgeJvKgsWTS+HkmmPzJXqjM1P/njBx8eMVMD9d1Jw==
X-Gm-Gg: AfdE7ck+K73cK5ccmFncj4B6H402XqlLuSfWxL/kOIi1ldrU1ZGeY6XcV+Xpm+AJyD6
	TveT/DK1u24xKYgoldsvCuTTLXgwG6QlFwxdlaB6WZVQj8csN8L2UAg4fgzCejCRpXeF3I7zZnC
	sSn1OXGXz2rS+WNGzM8+bOGlNjFbjqCFJ4QjIzcoA0okUBS5GtH6IZ5d7n3V504n/exJYmGcmah
	CQ4LMDjSTwmAVzJEnEYrSewSDGHjmY+tIu8HxHo6VBd8q8uiHplDP6e3hNnk1CITB4mT5xTHwZN
	H/tPbilCa5onnm+XQjFMJui7l3qdSAAy+JVAuHjWK4PTNslh0+rYmQ/8LOxqgYiTuYz8u4mFQsw
	NpWUF4Fp4vwJpz2uCvJ+INDPoXMrTU6Ligz3iAo0UhO8zEL6K9NTNWddjLAljqS91T+PJVkDxjF
	RW9Lb8jyijgbu7/Kdoo5VT6v8tlPqqlxr5iCwq7t0INpxQ+DeOzfwbWE0otHm++PgihM5i0Box1
	/Gh
X-Received: by 2002:a05:6000:3102:b0:46d:315d:e7b6 with SMTP id ffacd0b85a97d-46dc18a4ff3mr27293164f8f.35.1782738008214;
        Mon, 29 Jun 2026 06:00:08 -0700 (PDT)
Message-ID: <4243f54c-8dff-4a37-8bb3-1990a03157f4@suse.com>
Date: Mon, 29 Jun 2026 15:00:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] x86/efi: discard multiboot and PVH support for PE
 binary
To: Frediano Ziglio <freddy77@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <20260626123645.229375-1-frediano.ziglio@citrix.com>
 <20260626123645.229375-3-frediano.ziglio@citrix.com>
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
In-Reply-To: <20260626123645.229375-3-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1782738009-A713D220-F986787C/0/0
X-purgate-type: clean
X-purgate-size: 1630
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[xen-devel-bounces@lists.xenproject.org:query timed out];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10A106DAAE7

On 26.06.2026 14:36, Frediano Ziglio wrote:
> Changes since v4:
> - more clear subject;
> - removed more code/data from EFI output;

I can see that you excluded a few data items in the assembly file. But is
there actually any more code excluded? In particular the functions I
mentioned in the v4 comments are still going to remain unreachable in the
image. And addressing that doesn't look difficult at all:
tools/combine_two_binaries.py would need to have .init.text replaced just
like you do it in the assembly source.

Another thing is that with it now being crystal clear that the PVH entry
point goes away, code reachable only when it's present (first and foremost
guest/xen/pvh-boot.c) is then also unreachable. Perhaps the objcopy
involved in the .o -> .init.o conversion could be customized to rename
sections in our favor.

> @@ -135,8 +135,7 @@ multiboot2_header:
>  .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
>  .Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
>  
> -        .section .init.data, "aw", @progbits
> -        .subsection 1 /* Put data here after the page tables (in x86_64.S). */
> +        .section .init.data.multiboot, "aw", @progbits
>          .align 4

Turns out the comment must have been stale for a while.

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -57,6 +57,12 @@ SECTIONS
>    __image_base__ = .;
>  #else
>    . = __image_base__;
> +  /DISCARD/ : {
> +    *(.text.header)
> +    *(.init.multiboot)
> +    *(.init.data.multiboot)
> +    *(.init.rodata.multiboot)

Simply *(.init.*multiboot)?

Jan

