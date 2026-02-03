Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA4UMfUlgmnPPgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:44:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3578CDC2B7
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219398.1528275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJVe-0003Sk-U6; Tue, 03 Feb 2026 16:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219398.1528275; Tue, 03 Feb 2026 16:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJVe-0003R0-RN; Tue, 03 Feb 2026 16:44:14 +0000
Received: by outflank-mailman (input) for mailman id 1219398;
 Tue, 03 Feb 2026 16:44:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnJVd-0003Qu-BM
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 16:44:13 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bdec120-011f-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 17:44:02 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so47879035e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 08:44:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48305153842sm79051905e9.10.2026.02.03.08.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 08:44:01 -0800 (PST)
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
X-Inumbo-ID: 8bdec120-011f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770137042; x=1770741842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bml9PQWT3UKNU13sLLg9qwRA7I2J4jarwMbx6mfF4YA=;
        b=HQoVzSCjZotEE8Y4QD7pmtw/WY8Ue1qsZupQSkail/O5gESn47cvlbKspMXqfmYDx+
         dEpHoQkIQquxlyi0igwo7NdLcefNBXLPfFe23FoimbBJEJYukMriQxJCyjGQwl2GlLBl
         cpe50s02EY0d+B8dspopsoWTH+T4EqJj8aZdwQ9dOtlaxuw2hruvSDoyKwcYavAWsqaz
         8zFCBYBC8CKohl43LXjI3GZqAO8KtNunV3HMOojv0RXoEgWXFcxLbRFYTGxNe6D7JXrF
         Tkf/uBI7EJAenLk+eUlPCxIH2sVXYgqdlEfIYkjZNiurFgKHN77tdBVqq2ACYG6hq4kM
         YyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770137042; x=1770741842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bml9PQWT3UKNU13sLLg9qwRA7I2J4jarwMbx6mfF4YA=;
        b=ToYiotB5KSbgxX1R/9XtCq/NMT0NX/R9Ay8RJCmvY/TpHxfNL7Iybfw1BSgRiDo+WQ
         tM4+Hst74Lb8G9DTJC26gv06RvlTlwni92HjdU+0o8xKr1a5I/C0mmScrrMnMlJd991I
         6AeZaKqMSMi7W80Wpo+agdafY6/Cey2kNEXh1RMgMesPsN3m4K/egt72ifzXroypD3SZ
         lXKK3avA1OL5sOQKjOd4YLcimmaXOwTVw985eSyFYASmKBWg/LFui8wS9mZROM3Vt/QD
         V+8QRK7bRVAbTQ+SQc55DdtOYCPde7gf49PjBhSzCrdUuSsMAe1R35Lx/PU01aXTb4PF
         szjg==
X-Forwarded-Encrypted: i=1; AJvYcCXAf74J6Ycw+xJuGuHwlZOgU/X5EuRKgBUeeackNyQnO+DcmkK/ZrPTTNx9VlarGKmrrA7aIBJGmtI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyxRD0Egfrt13ez0hcpTA0xJPe4RBfcVAJsytHNrT5Ui9KH7d/
	ZI4q6JNYAZYaUDHED5NBBTAu23UWhiCB59/PjnsTsDy4HBbvcHRT5KQUwIipiPUh/g==
X-Gm-Gg: AZuq6aJCYW6o7PTpGU2pkOY8FLRapX5foU3O1glORFWWWFuJM0Gzy6TwSzfMOf7qeYV
	xoKIU8P2lHnw39WlXLm8m0NJoASQvzK3B+DLMRe16oNnU/4hkylTyZqWuparLBcf96OOXUgXsNd
	e0xBNLmIwGTe/AecaeAX/4lIKKI2tWGa7QAcQ8bBpjPpQaO137eo/O+Tzgs6Qn5SGcnJykBV20P
	Z/1lqCZIeic6Sp17X8NiSW67h3GVsKx/42hragx43inZhmY70NvF8+/2HVD+DsCcuF6stTzWrkc
	mtphWd3uE2Gv7baB3hwMjU6nzIjNniyseFpS2z87kJrziJDVpfAgSSRSNhpw31HEx7Lrkm3romu
	p8+xfnoArZEkaFqF6OdyFeZ97zIFCqFEVG0uPxJwq7/q7lxNZRfSDi6qFVFGmDf9nxDZ5hRulpg
	hdb+bHlCE5LyBP10cevSs7wfRPPQosfGrHhe6E1n9ZLYRO+vz2/A7sOdmiLh6IPWOmeNS4akrfD
	4sQb+pCOuSWBg==
X-Received: by 2002:a05:600c:3488:b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-4830e971353mr3164855e9.28.1770137042272;
        Tue, 03 Feb 2026 08:44:02 -0800 (PST)
Message-ID: <cce29bc5-ae3c-452b-a373-d76323d5f062@suse.com>
Date: Tue, 3 Feb 2026 17:43:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] xen/riscv: add vtimer context switch helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <fb6be3d3f576f7b362af69e57d2dfd1da3554439.1769099885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <fb6be3d3f576f7b362af69e57d2dfd1da3554439.1769099885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3578CDC2B7
X-Rspamd-Action: no action

On 22.01.2026 17:47, Oleksii Kurochko wrote:
> Introduce vtimer_ctx_switch_from() and vtimer_ctx_switch_to() to handle
> virtual timer state across vCPU context switches.
> 
> At present, vtimer_ctx_switch_from() is a no-op because the RISC-V SSTC
> extension, which provides a virtualization-aware timer, is not yet
> supported. Xen therefore relies the virtual (SBI-based) timer.
> 
> The virtual timer uses Xen's internal timer infrastructure and must be
> associated with the pCPU on which the vCPU is currently running so that
> timer events can be delivered efficiently. As a result, vtimer_ctx_switch_to()
> migrates the timer to the target pCPU when a vCPU is scheduled in.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

However, ...

> --- a/xen/arch/riscv/include/asm/vtimer.h
> +++ b/xen/arch/riscv/include/asm/vtimer.h
> @@ -17,4 +17,7 @@ void vcpu_timer_destroy(struct vcpu *v);
>  
>  void vtimer_set_timer(struct vtimer *t, uint64_t ticks);
>  
> +void vtimer_ctx_switch_from(struct vcpu *p);
> +void vtimer_ctx_switch_to(struct vcpu *n);

... may I ask that you reconsider naming here? Both Arm and x86 have functions
where the prefix / infix is "ctxt", not just "ctx". Being able to find all by
grep-ing for e.g. ctxt_switch_from might be quite nice.

Jan

