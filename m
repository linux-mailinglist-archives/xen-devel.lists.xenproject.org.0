Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMCbDJWq1GmKwQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 08:56:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AEF3AA86D
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 08:56:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274496.1560598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA0Ly-0002Cl-CR; Tue, 07 Apr 2026 06:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274496.1560598; Tue, 07 Apr 2026 06:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA0Ly-00029j-8Z; Tue, 07 Apr 2026 06:56:02 +0000
Received: by outflank-mailman (input) for mailman id 1274496;
 Tue, 07 Apr 2026 06:56:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA0Lw-00029d-MF
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 06:56:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA0Lv-001B38-Uh
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 08:55:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d4aa72-e002-0a2a0a5209dd-0a2a450bc6a2-42
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:55:59 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d4aa7f-bca8-0a2a450b0019-d155802be888-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:55:59 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso45880115e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 23:55:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e83682fsm551174805e9.7.2026.04.06.23.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 23:55:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1775544959; x=1776149759; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VM89pN3Op8hTShomCouAPnLw0wOqZDe2nhtt/VA+h0c=;
        b=BT9IM/Ul5BDVaC6mDD1s1lzp9ZLsW+mSEUhRKyjvbLVE6drR4w1l9TQIzuN8azEYry
         tIRTv5jLDx0ylRVx16KEdD3i/UCgc9LdDsU+sRzSmlqTmB9x65lHZb/WaEBpuaC5A0dd
         8QinMCOqP+QbEMRsduqMsOvHlMPdECQ2wBWkQls/GvlELCajBGyy1E1Am+lRoEr/1uil
         +nPPnCG2BYMQ5XOMVt/2N/XxiZ+2A8Bl6qzt17QAgcFy7rdhLUEgXFISNIhT3VQn9y95
         Yq9JYM80wCCBTXw2+28TjjyFUj9c1kUiWcj24TJn2PR6nunJAIVEdfOExVB2TYeL2Hsu
         mCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775544959; x=1776149759;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VM89pN3Op8hTShomCouAPnLw0wOqZDe2nhtt/VA+h0c=;
        b=qmvXkle8Vtvfq1afiE3zu+qvN58D70UuGjrnzXnq5hKde+t0rsduBUzATttvhr34OZ
         H1i2u84n3WT9hNOaSBCA7gBL+0bHCtMtuGnBaic9RMTyjfaWLkeNqHWCOSN/qaGrL5/s
         P38KsB13eaG1tIRBFp69v8FadhInBGMFsFWQHdGmYSJVi+0aBMYrUk5OckOQYqqPLYlh
         hpxmJWef0zgZmCgkpKlNOcC5x/fD6LOq9rbpyiO5mELxfk07WfRzTlhn+6AI1vzcvW0E
         JZWeHYXbeMj9SxQ1sc3dsCJRmnMc2b52xYqDCNjUm7eVs03A32Xvwu/UzdcklabOwrKu
         Me6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLsOMb7QyKwi8ec/blfV+Kiu9mcW52bqlmDkX7q6cACh5jBUduYYuVzTMxyG6pWpoB/5uBvjlT/Go=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQZ+ZB5UODAYdOD9jwienGwruDP8YKpSNLvhnKPrGOgkiZVbWM
	OcuIOwX/cuo8LKjRw63BW2GsJXhbunVJ7q6XEQ4kup9Lp3Eh9ExS8yKQalzGGKRodQ==
X-Gm-Gg: AeBDiesRE31LYPcjVEqI7W/ZiHdGJfdtwG38+h7SSebzL/k3EowiMuFK+xAZ4jAJ8OA
	lnTNiCdx9AT3kuu6IoklcL3UnrS4IYQSIJKOgV1IgCO4zdk/IdvZj1IxryPQR2iDF3RZnX4txWr
	y2fgXxslC+WflL0XFRzsKi7ohLuV+Ob/wmdC/HnK5Uc/1zWNuSeoqqkV2JuvqezPknIgLnxuP3e
	U8qVefIhMSAT/CydSV3cwG5FLRwT/tbh0l32Uo2NV/5ZB5CRLgeVDkDFGA8L3BSBTirdh8Jkw1W
	tx/uJ/8HCnv0/i741YdAUBifdxuvyZgYZtMJZprlPrey82qxv2kLc96J2cYltFk8SzRXFW6MB5t
	trrWIZ/4Zls+ivaAEXdc4xyO78dBrq6Bl53r6mHAuypAspLB8ZDBo5ohITEqJDxGY11CPAdTIE7
	TmaCWo0Y2mdEC0ZpYkHXw8LIFiRcGq416EBv/aweUa04yyc578/S50orrC86FXIYD1+DWb9W/1/
	P1Q0/Ohe5FFuoM=
X-Received: by 2002:a05:600c:3549:b0:471:700:f281 with SMTP id 5b1f17b1804b1-488997d5e5bmr206387665e9.25.1775544959221;
        Mon, 06 Apr 2026 23:55:59 -0700 (PDT)
Message-ID: <eb6e0314-423b-412e-af29-c423463d78dd@suse.com>
Date: Tue, 7 Apr 2026 08:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: Check supported features even for PVH dom0
To: Frediano Ziglio <freddy77@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20260402155512.80170-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20260402155512.80170-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1775544959-EEB482A1-4A929AB7/0/0
X-purgate-type: clean
X-purgate-size: 811
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,citrix.com];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:roger.pau@citrix.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 95AEF3AA86D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02.04.2026 17:55, Frediano Ziglio wrote:
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -320,6 +320,20 @@ unsigned long __init dom0_paging_pages(const struct domain *d,
>      return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
>  }
>  
> +int __init dom0_check_parms(

I understand the "dom0" in the name is owing to the filename and perhaps
adjacent other similar functions, yet ...

> +    struct domain *d, const struct elf_dom_parms *parms)
> +{
> +    if ( parms->elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type == XEN_ENT_NONE )
> +        return 0;
> +
> +    if ( is_hardware_domain(d) && !test_bit(XENFEAT_dom0, parms->f_supported) )

... if this was about solely Dom0, no is_hardware_domain() should be present
here. Maybe s/dom0/initdom/ ?

Jan

