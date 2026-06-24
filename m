Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hJOcG+jpO2oPfQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 16:30:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB146BF1EA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 16:29:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=TtNexbVq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345041.1604050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcObs-0002iw-1d; Wed, 24 Jun 2026 14:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345041.1604050; Wed, 24 Jun 2026 14:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcObr-0002g7-UA; Wed, 24 Jun 2026 14:29:47 +0000
Received: by outflank-mailman (input) for mailman id 1345041;
 Wed, 24 Jun 2026 14:29:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcObp-0002fz-KC
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 14:29:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcObo-00ArEc-PH
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 16:29:44 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3be9cd-bab6-0a2a0a5309dd-0a2a4504e024-20
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 16:29:44 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3be9d8-a01d-0a2a45040019-d1558031d854-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 16:29:44 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490b9318997so5904255e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 07:29:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c2279b83fsm6701870f8f.29.2026.06.24.07.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 07:29:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1782311384; x=1782916184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lV89mf99KR8TSDhpFmq/nOnmaCTz+Mt2NzDR2DCjNEI=;
        b=TtNexbVquhnWnNL681snkU1Im1N310+ij1BqYSOXy6gjQwzO2pcXevyZYz9gMUwda6
         ruwJe9w7zKhxo8MDcvLS6X1w6eeTEsfmZ32a0A5iQapmwA8+hz+qYbk2IOFIUCChHuMW
         1v0b1i6Xwi4NMPK9OTDkksFxrLIDTgPzas5JWEn5hb7XYQgrCvoWDcxLKTWrQx6CYPk/
         NELxJOlLdn/GppzKSKlpNNS5VJcVSH3ujeD+bhZ4hMFpWgXRG480W1xYvJXYmeIQWPfF
         3pAPoFnC9L4UNvRRBrBs5xQrhb7buuqJmuMgPJrCrKr/ql710Pva/47450o3x2hjZA66
         7Yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311384; x=1782916184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lV89mf99KR8TSDhpFmq/nOnmaCTz+Mt2NzDR2DCjNEI=;
        b=cuid+ZYoEylbFqsTm/lSzbsPHANqET8Rb14fZfDsEsJGp+agVcKUbAeeeeymMmDWgU
         lWOoIV/GXHoYx+cTrC3UdAAJF/nBuPxlR10aw18yugrGrubfMKz9UxulKMZ+HG5nVIIE
         yfUZvTdY7zgoKMAWMyIq/x2uWluKFTwf9aRAESe0qAkagqUO31UTvt+KD3+o74IoPh74
         SP9UK3V5mmh9sqJF+hXawYtmhmh58ULv97wXruq8THHRSil1JDeCMJe/sXtZ6RurZhb0
         VlP0h6G63EK7MJz+zX0vVlKBzV1mog8KBHnf0fmNtj4HaXPqTl1AAr8lWSEoa0JQ20Mw
         myaw==
X-Forwarded-Encrypted: i=1; AFNElJ8covJ7SWu46McRWcwImUr7bx6oUOstw3FuKsFCgm2fhnarLdKoAUZYcn6REPM0omBIl2122SCuAMw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCUBUnccV+aOorvzMM+0vgpErNPpX5GazT6pp/G0sK7yqx5L3e
	gIMacaX6/fKX9YJX7MYdwYsnLjrpYW7iIm2Mv3Bi44oqtaEX0Xc4ZWSH4qnIAiTCmg==
X-Gm-Gg: AfdE7ckD/RwjGqp1LaamCiy56iTZeTn99BRaSxNrtfecrmItz0pPDVePTJ60mBFb4L4
	alWVTjncMrtwDypBRI1I9bB6Ec3zfloBzgsdVbPUEK4TvibCJ0CC076YCT5mtjdWPdB+FvZy/2/
	EN50YxLZoOZnWRWd+RpwoONd2TD1lz0C1L5bsFWakCn/DhQOdBasUR82cFGCIGU4ETsg8mye9/R
	J83EMUxCYVnq50JWdI6rfeZPZ7/GaN/5jt7zsWaoRzVWWFavemL/ye7FMV0x1gQAryWM/UwDk+9
	Ss+E6xF6HjYBql/TjP6KdSAOoF4B7TxhSDNQDWfXvNxg0wUge7eNjbGkg+rythoCQ/+ad9jhG+U
	m56DXXPYTZUHHTI+n8s/2p5VErTxWWPVBp2/JhullxHmpPE8/p89rh/w1+6VtB5D5+yRza2qdaT
	wDjx+aotej/emY6xU/aP7j2RQRMBGGr5mfoBWImnaqbeha6aNr4/8tmLYCqIlH/swB1HucdLcPg
	rBvniCMVEqkQ/A=
X-Received: by 2002:a05:600c:524c:b0:490:9804:afdc with SMTP id 5b1f17b1804b1-4926087273amr51718245e9.23.1782311384200;
        Wed, 24 Jun 2026 07:29:44 -0700 (PDT)
Message-ID: <650e5e54-6118-4de8-b6e9-dc09acddd4bf@suse.com>
Date: Wed, 24 Jun 2026 16:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] Align relevant sections to 4KB
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <20260616172830.111393-1-frediano.ziglio@citrix.com>
 <20260616172830.111393-2-frediano.ziglio@citrix.com>
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
In-Reply-To: <20260616172830.111393-2-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1782311384-2E1A71CC-26999438/0/0
X-purgate-type: clean
X-purgate-size: 1768
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
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:email,invisiblethingslab.com:email,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BAB146BF1EA

On 16.06.2026 19:28, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> Required by UEFI CA memory mitigation.
> 
> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
> in the pagetables.
> 
> NX_COMPAT is a requirement from shim-review,
> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
> 
> Sections with different permissions must be in separate pages.
> In the case of debug sections they are contiguous and have the same
> permissions, including the immediately preceding .reloc section, so it's
> not an issue if they are not aligned to the page.
> Before the .debug sections you could have the .reloc or the SBAT section,
> either are permission-compatible.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

As per the reply to patch 4:
Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -162,8 +162,8 @@ SECTIONS
>         __note_gnu_build_id_end = .;
>    } PHDR(note) PHDR(text)
>  #elif defined(BUILD_ID_EFI)
> -  /* Workaround bug in binutils < 2.36 */
> -  . = ALIGN(32);
> +  /* Align to satisfy UEFI CA memory mitigation. */
> +  . = ALIGN(PAGE_SIZE);
>    DECL_SECTION(.buildid) {
>         __note_gnu_build_id_start = .;
>         *(.buildid)
> @@ -330,6 +330,7 @@ SECTIONS
>    __2M_rwdata_end = ALIGN(SECTION_ALIGN);
>  
>  #ifdef EFI
> +  . = ALIGN(PAGE_SIZE);

... the same comment added here as well. Can do while committing, as long
as you agree.

Jan

