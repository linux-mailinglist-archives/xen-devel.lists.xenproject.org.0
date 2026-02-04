Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO2hFyopg2kxigMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 12:10:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4606E4EEE
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 12:10:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220424.1529132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnalJ-0008PA-AC; Wed, 04 Feb 2026 11:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220424.1529132; Wed, 04 Feb 2026 11:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnalJ-0008MV-6n; Wed, 04 Feb 2026 11:09:33 +0000
Received: by outflank-mailman (input) for mailman id 1220424;
 Wed, 04 Feb 2026 11:09:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnalH-0008MP-Me
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 11:09:31 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9a99649-01b9-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 12:09:29 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so66776735e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 03:09:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830ec4fe2fsm17266825e9.3.2026.02.04.03.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 03:09:28 -0800 (PST)
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
X-Inumbo-ID: f9a99649-01b9-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770203369; x=1770808169; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yl7iypKDSWXx9zpbiDlFIyuzKF5x0vu15IEtwWIvLD4=;
        b=YS1Xit15mI3g+BgJ1RvRrfFHzAYBsMzIsEUxaPtte0b4Lunu7zdoCUz/oGh9gxvNBx
         wYVsl+k90I9F1iVJxJrjYk6mO8W+lRIP0COZRbzDQEnpjO2ppG9Q/uPSTzx8rldpKsM4
         125jmyDSj93HUCH09R9gZCkI4dYBn6oyvxqxOF1u8IhCbMB2IY3vZ7T+m7zb2RqngPS7
         4cFvN7g7rtEqF5V1DvZp5u5O7QLUjs+PO5kK2PhcHRV3JF0LgJ9DuwA8FxGcRppVJeFb
         NmEi52JFzwrrPYS1TyUX14r+mAOo+R7KH3KVsuec2R8g58PfXOp6C/Jb0UAC0SpMTBPT
         74uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770203369; x=1770808169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yl7iypKDSWXx9zpbiDlFIyuzKF5x0vu15IEtwWIvLD4=;
        b=kO218hhxMKhvsTpJtd58VAI8Az8ypSVDBFGULc2RB75oBtzzgVA7z26zvm69otXrmP
         kx1IoudemJkoF4Mp7a36B64lqR3WMCmrkhxvYc5rUszPHhd0vDmkRsfhCTfpngU81FbA
         65UpYq8BOysMFa0rBS5/qpOK8ACxom6cZ/2rZzh/JSnARwb1LdTZWZWMdzqtxvn25WJo
         S4MoPcMcb1BHzrLE/x2BjZaTVCFVjxXuPVLynwW0mSFVdkGpqWMnI68TtD39jY0zPDDo
         FEqHzDzqtGwMmLaY+awxROjJSaezu35VWrIr8XL/aJqpP5x0Nr+dQzShJ+xb9ZwgyJyU
         WM0w==
X-Forwarded-Encrypted: i=1; AJvYcCUQr8xLGwSlZjiHurOtXE055zoX7VU6t38cCjnS5FNb/JQS2M3JRrrF5x1f8x4EsPI1hi2WYT2NqPw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyf3BsmfwPZKWemkAdZ8RMenHjtDsxgBwDpwBL88DrjKJPwnZMu
	7ZeAeqhhgx9Os8+jTj986DYHhF6nAlIVN+7FuWrH7GC3ldbdbGDZy9QUKZEnNBslvQ==
X-Gm-Gg: AZuq6aLiPTm/F3ztVmK/dxeVb5SOWszJFX3p6xYsm4h1gLqItl4t9bZXZNNzT21bQDo
	JXzuXKrT/c7I5MowtxPWSVHqHt59Kp5OHQ1z6YpTsuS4gtAzAJYRafj16s2pNi2uGz4GKQVuQcz
	20HEDo5DArvYD73HwaGk0ZSIXjF7x55ukplUpwgOGcOFNyQOZzJipv8h73TYF5tzzJrto2hqy3U
	QL6cdOOOXr2MT8tNJwPRusjXMyh8mWLRJA90XARMbtjYufNhB680Nlr5MkDq8/Q0FwTNoXJf1E3
	jLwdeJ84TeESirZciu1JVch442oDWIif0yiD2+dZYfXDm+gQvSBRYfC2zwtnYSUgLUuCX7gST74
	/oP3pbDFp5d181QLw6rBOBEqB51hWSkYsdk1EoHAlOu6RcH0DJ1KbBAMP+PQaCt7JFIzsqDBi9i
	dSLHqRy3ueU8PTwiVRDsDo1NwOisoAQzs8j6dEKiUZMKTR8aBNUOQXZLiZojY7oawcUCiYm5RUi
	Fo=
X-Received: by 2002:a05:600c:4684:b0:480:6fbc:695f with SMTP id 5b1f17b1804b1-4830e9a5491mr34750495e9.32.1770203368943;
        Wed, 04 Feb 2026 03:09:28 -0800 (PST)
Message-ID: <309e4e0d-c2a3-4f56-ab6f-f648da313bb6@suse.com>
Date: Wed, 4 Feb 2026 12:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/riscv: add support for local guest TLB flush
 using HFENCE.VVMA
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770036584.git.oleksii.kurochko@gmail.com>
 <89f50ab2c1a1c79abea4db3a53393f974bb9a473.1770036584.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <89f50ab2c1a1c79abea4db3a53393f974bb9a473.1770036584.git.oleksii.kurochko@gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A4606E4EEE
X-Rspamd-Action: no action

On 02.02.2026 13:57, Oleksii Kurochko wrote:
> @@ -14,6 +15,12 @@ static inline void local_hfence_gvma_all(void)
>      asm volatile ( "hfence.gvma zero, zero" ::: "memory" );
>  }
>  
> +/* Flush VS-stage TLB for current hart. */
> +static inline void flush_tlb_guest_local(void)
> +{
> +    HFENCE_VVMA(0, 0);

For this use, ...

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/insn-defs.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef ASM_RISCV_INSN_DEFS_H
> +#define ASM_RISCV_INSN_DEFS_H
> +
> +#define HFENCE_VVMA(vaddr, asid) \
> +    asm volatile ("hfence.vvma %0, %1" \
> +                  :: "r"(vaddr), "r"(asid) : "memory")

... don't you want to use "rJ" as the constraints here?

It's further not quite clear to me whether the memory clobber is really
needed. Pretty certainly not for the use in context switch, but perhaps
for other future uses it's better to be there, even if only to be on the
safe side.

Also, style nit: There are a number of blanks missing in this asm().

Jan

