Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0PvACbbLHmrlVAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:25:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7375B62E01C
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:25:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="e/aEq1jn";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324901.1590403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOBD-0000tV-HF; Tue, 02 Jun 2026 12:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324901.1590403; Tue, 02 Jun 2026 12:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOBD-0000s7-EF; Tue, 02 Jun 2026 12:25:11 +0000
Received: by outflank-mailman (input) for mailman id 1324901;
 Tue, 02 Jun 2026 12:25:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUOBB-0000s1-9a
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:25:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUOBA-00EQ92-MD
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:25:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ecb96-2eae-0a2a0a5409dd-0a2a4509b4aa-36
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:25:08 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ecba4-2497-0a2a45090019-d155802bed27-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:25:08 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so19535105e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:25:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b444f4fesm5703295e9.12.2026.06.02.05.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 05:25:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1780403108; x=1781007908; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F1jhGW4wdZRy0RrVq/4Ld1tFeIze3VOV2SJUrx8Dh4I=;
        b=e/aEq1jn4yK5DZVGBkLoRXtOneCeZuEkhl1eQqhP5DTZzLBGh4+/j25nbWxJr04Vc7
         urrzbExOA8b4xub6qBz08b3R84jaLsYRdBzxxmbyIpNqcobAwdnRNm8lSFf/PiR5Oo/f
         Gjz/z6ko4pVqFBs/uZ7JMB+PiO1HXisO9O6MaTUtbsntx7R3hHxlr9zMvYIC5m1FcNFU
         UmgEnzt1/ev7VgtI7tnbQbCbdiSHoaAg8oXaXjqD8eiJFfc5MwOmMZj4iwN7iYYs9N4e
         +rgjhLzDraTwETY0+kCcEpYOgVVgBeDiEqM33OroHS/P8Rj108rVd+26SunhKMM9YpFq
         R2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780403108; x=1781007908;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1jhGW4wdZRy0RrVq/4Ld1tFeIze3VOV2SJUrx8Dh4I=;
        b=TbbWT/3OaYgDLbMUNZH2tYlKuyTlI8RcA2eqQGDLaX7VFm3eGX/+8sjmh3fGj6P68V
         vZfIokhcWJ5zTPAthDDi24SXNQxwnxbTGL5W1ZJeWUvTgC50SLuGj6Sf4qd2D9PXUpi5
         2pBuqGWiqEajR22rEstVVZ7p6Yq3MKGJdSaXX9YlGsWxcis53xOak0r4bQQsWcR1ictJ
         vAA7WlNXwWV66Y3IJzsLU6h8LLXnKibI4RZwnrL5qEUGJXdCL/hpD4e2m7OBIngUw5Ja
         U3J6Q7BOLLz1Jbh6n6ku67FQZsN0dRpPd60FPJQhI0pJJNyyVXbdcgWPNYiUPuS5EPqP
         FVmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2RiE9hNN1Bo75YpjvCSLWFA1kzNdkA8p7ZKOdze9cKPH3T3fazqUVyXOgAknJYIM4WZ1VoWvxabM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQIrXMXksN3KmVxQraeP4NOeeaYqSzw36oixNubQoVkTYS5GDn
	872Flj0l/e2VOzo3dZrXgIUQeTEuQrYUibBfLZciC5gyGJEdbONVl++L2zh0au3KzQ==
X-Gm-Gg: Acq92OGhcogCFfQgPE0MiwkJhDlK0XEnuBzrrImae74vS8WRGlz1gH4+gmgOwLR05Hy
	8QyzSefjs1BbvIm762fvW32vS5hmzSyq0+CTIWY6cEZL1pTdp7a67sua75Lx+2Tbj3VFBHB8k7b
	+a29AvTWnj6z35oEJ/BLE6xcwKnUP8I4f8gyhZu5e7LQc5rA4zhIVIsnZMI/sAOGKC0Wvbj8cGJ
	FPYyTN/Ni67+YBv0R6Bkyo8F4jhOdjRvfvAJmRMlF/zlNAHerR3Ag6LcliGEDfy2q8WBA1EkRwo
	AMCnWLJpugCylZAPeyBBPTfBkO5ZVknMwV67PageIaDELIQoWDXvtsIJNwWSs53mCbVw7kuLRsT
	Je81NLqi/9OwyZNvVMay1Z6CMiqDdqKSlDaAX2Obcn9yJaQQyV4j8v6AHkcCNwGEfyG+8w4TVGf
	6xSAYv3MJNMArqe8RJLkOi/PqXBd1gxZFQzr4EmBGz7E0XiHHMJEwSQPy+qcpkajvs/ne07qTgN
	PU3vkMRFcnfTDRqsSWhG2+F3si0hjSRDDgl
X-Received: by 2002:a05:600c:8508:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490a2952644mr250021575e9.27.1780403107957;
        Tue, 02 Jun 2026 05:25:07 -0700 (PDT)
Message-ID: <da68aa25-1372-4a16-bfe5-67c943950cea@suse.com>
Date: Tue, 2 Jun 2026 14:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86: Split .init section to satisfy UEFI CA memory
 mitigation
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-7-frediano.ziglio@cloud.com>
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
In-Reply-To: <20260529153531.1341542-7-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1780403108-43175A53-B755FDC2/0/0
X-purgate-type: clean
X-purgate-size: 1255
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
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7375B62E01C

On 29.05.2026 17:35, Frediano Ziglio wrote:
> Currently .init section is both writeable and executable, split data and code
> to have 2 sections satisfying W^X rule.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Like for the earlier patch: Reference please to where this requirement is
stated.

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -193,11 +193,7 @@ SECTIONS
>    __2M_init_start = .;         /* Start of 2M superpages, mapped RWX (boot only). */
>    . = ALIGN(PAGE_SIZE);             /* Init code and data */
>    __init_begin = .;
> -#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
> -  DECL_SECTION(.init) {
> -#else
>    DECL_SECTION(.init.text) {
> -#endif
>         _sinittext = .;
>         *(.init.text)
>         *(.text.startup)
> @@ -210,12 +206,12 @@ SECTIONS
>          */
>         *(.altinstr_replacement)
>  
> -#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
> -       . = ALIGN(SMP_CACHE_BYTES);
> -#else
>    } PHDR(text)
> -  DECL_SECTION(.init.data) {
> +#ifdef EFI
> +  /* align to satisfy UEFI CA memory mitigation */
> +  . = ALIGN(SECTION_ALIGN);

Nit (also for the earlier patch iirc): Comment style.

Jan

