Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2ENAH1+PVGpKnQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 09:10:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82D7747D12
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 09:10:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=J8AFcAKW;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1361430.1613661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAnh-0006NL-CI; Mon, 13 Jul 2026 07:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361430.1613661; Mon, 13 Jul 2026 07:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAnh-0006Lx-9H; Mon, 13 Jul 2026 07:10:01 +0000
Received: by outflank-mailman (input) for mailman id 1361430;
 Mon, 13 Jul 2026 07:10:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wjAng-0006Lr-PI
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 07:10:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjAng-00E4eB-5i
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 09:10:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a548f45-2eae-0a2a0a5409dd-0a2a450ccdce-12
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:10:00 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a548f47-e897-0a2a450c0019-d1558031a9fb-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:10:00 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-493f45e206dso12856345e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 00:10:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d6e4csm78272145f8f.10.2026.07.13.00.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 00:09:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1783926599; x=1784531399; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAHepH4FRM377gQ4xVF+3y1T3jLg4xP7zxZIY6dX+AE=;
        b=J8AFcAKW5Dq4o/RoGAA3J/JEu3S21DZJd7qGRO+qR6MEA1ygC5SIns8hxMagi2wuM0
         ol1K1mynre4VGUYcb69vMBzK72CFQ0wwImGEuvu38QkJrOPcMOI/KnBbYg3KiuwW+y3z
         cdfX8b+X8q6xW3Skxp/OIxIWde2vDggu3NVUxsTcE20QX9N5Q58e/Gcybud9t9dAU1sl
         Kv6NN33y8umDZHzapODCOCn8Ej3mu0xqwsRjQRxwkP8XWgLmRgA5KCcnBPdscsYEayZ3
         ejTi6CqVw+izSMSzW8c2xS7OzJypwXetbyNS/7qoNb3H2J15mNX1HEQdObWoMAJld4Fm
         wIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926599; x=1784531399;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FAHepH4FRM377gQ4xVF+3y1T3jLg4xP7zxZIY6dX+AE=;
        b=IGCElcWhkQLLs39/GpIV7w1eo7hRRyq/lPCYwp9Otcc4OQ7p7UZSt7ujrpQEUMlsb+
         R2xpYcLtUBl+H9QrK0ZmyZ33NAr+ocISh8T3TOTq5fKsnNTpRpMJIzh4IOcF4Ezu/yCV
         zH9QEYiFlZvTam998t/e2ICvo4H7Qgx3I++PL1Q3hec8em2r2zOft8W/zY1qeI5Ec3V1
         EbUgauXaneFy4oDo2jUMSEJUb5/k5/o/kKKzoUH76Pk2EjE+VL2yX/1rTYnPXDhB8NVI
         MKP9voVUxVMgwHi1+iN66uHyccttVPC25W708jMVl0d/M1Cy2zzlBmYDQQ+a2c5FjFgL
         CpvA==
X-Forwarded-Encrypted: i=1; AHgh+Rq13v5oQPgZUSRiT/bdFGsm9E/DcvU3P5qUubJMuRdQQWl0C7I/pct8TBZEgiQ1LaISiil02bNlBf8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygqwbxaAPYS65mp1HSrF7U9NzRtKPbxrdMHVdvpFaI/9W2FWxd
	KUPrzS/aZBGgjxXxiv/BqHMaA/o4DzLJOz9aM7h30Xbd5rRHYRrw6ZHKsnpl9PtKsw==
X-Gm-Gg: AfdE7cmEh2FVDOKbGUj8ctxXAx6IovYA6QYd2AC2ZQW/l7Hll6g33ElwEfgU3KoqPJS
	mPqEATlhGjxh5HnzjP+G910yxcdvj7ka9rRXXroZbIRZvJ9HpGAfXX+EGOy5gZDQT1X/gZFHisa
	Xc9/SH7+2/z/OBUmh6elgzrdHhKTokmJF9TOFJnqnOhtJc5l66hIT6JdHO8jOmVE55+aHvDtiPl
	lkiosUMnGHqbpwEcCSXy2yd+kgYt2pEQfKk/fXUGjnq5qw8WFzGXH5r76VQm27MSh1AlHcs2Gm/
	irSNt63o0pe92EzdEyDvcPRV18ce101mNYpESlaVrvW3rwwfgOA0CTsyBZQOQqdXIQY7dY6hK+G
	pGXGCbDz12Iq+p5P49lm3ccAkPrGlcR4Wzm/wiXdv+KZPy4WdHK0z+u5nXxTh0QVQnICacdnYDW
	KAfuJciKNZRMvPRIcVu+699kBRs3YDdpvLlPn5urTM5EJaocISaYxmOmovxKHAectwYKctfRhXF
	Un5
X-Received: by 2002:a05:600c:3222:b0:493:b36b:4933 with SMTP id 5b1f17b1804b1-493f2a85bdfmr88999965e9.3.1783926599577;
        Mon, 13 Jul 2026 00:09:59 -0700 (PDT)
Message-ID: <3fe4008c-3338-4830-b200-fe7d0f582303@suse.com>
Date: Mon, 13 Jul 2026 09:09:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misra: deviate MISRA C Rule 5.5 for
 'request_irq()'
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1783864426.git.dmytro_prokopchuk1@epam.com>
 <db38c988b728a52bd7a921201e44558e43c7ed2c.1783864426.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <db38c988b728a52bd7a921201e44558e43c7ed2c.1783864426.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1783926600-46AEE6B2-6B51F500/0/0
X-purgate-type: clean
X-purgate-size: 1991
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B82D7747D12

On 12.07.2026 16:04, Dmytro Prokopchuk1 wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -136,6 +136,10 @@ These macros address differences in argument count during compile-time, effectiv
>  -config=MC3A2.R5.5,ignored_macros+="name(hypfs_alloc_dyndata)&&loc(file(^xen/include/xen/hypfs\\.h$))"
>  -doc_end
>  
> +-doc_begin="Clash between 'request_irq()' function and macro name in 'xen/drivers/passthrough/arm/smmu.c' is deliberate."
> +-config=MC3A2.R5.5,ignored_macros+="name(request_irq)&&loc(file(^xen/drivers/passthrough/arm/smmu\\.c$))"
> +-doc_end

This suitably constrains things to a single file.

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -185,6 +185,13 @@ Deviations related to MISRA C:2012 Rules:
>         function, so the name clash is controlled.
>       - ECLAIR has been configured to ignore this macro.
>  
> +   * - R5.5
> +     - Clash between the 'request_irq()' function and macro name is deliberate.

This doesn't, and ...

> +       The function uses the Xen 'request_irq()' argument order, while the macro
> +       is a compatibility wrapper for the ARM SMMU driver that adapts calls by
> +       reordering the handler and flags arguments.
> +     - ECLAIR has been configured to ignore this macro.

... there's then not even a mention of the file name later (ftaod: even if
there was, to me at least this would come too late).

> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -226,6 +226,10 @@ maintainers if you want to suggest a change.
>         because the macro is a typed convenience wrapper around the size-based
>         allocation function.
>  
> +       Clash between request_irq() function and macro names is allowed because
> +       the macro is a local compatibility wrapper that adapts ARM SMMU driver
> +       call to Xen's request_irq() argument order.

Similarly here.

Jan

