Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NCQFDVTlGl3CgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:38:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE0F14B7BA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234883.1537989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsJOz-0001d5-VV; Tue, 17 Feb 2026 11:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234883.1537989; Tue, 17 Feb 2026 11:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsJOz-0001ax-RX; Tue, 17 Feb 2026 11:38:01 +0000
Received: by outflank-mailman (input) for mailman id 1234883;
 Tue, 17 Feb 2026 11:38:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsJOy-0001ar-8W
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 11:38:00 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b262cd6-0bf5-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 12:37:57 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43770c94dfaso4864237f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 03:37:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8d46sm34879477f8f.32.2026.02.17.03.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 03:37:56 -0800 (PST)
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
X-Inumbo-ID: 1b262cd6-0bf5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771328277; x=1771933077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WsO1/V8R3c9W1n0vXsS94k5xMKTxELyxFyxyU320pro=;
        b=FqgxvkihjUo/X6J76ZcdgpRbpSWhE/X/zbw0dWACRHyqbTsasdEglOKUFYgrSlvvbb
         tnTZjSGfTFAggVYCDBloq2B8saQlYpSlfg2i3czsMoIz8Dd8lc1EtDpjzU6Ib7nj/4yP
         uTB10XrZxkWz+007qLA4qtde8opGJvW/IwZdCq4SW+IpXQNXYq+wQmEgOdUCyHsfMoCC
         4nmMn1N5SDPX2fulqBAL2hlY/b5g8meL7tpSvZnt3FqpUYzWOaT634ic8MKg1BS4R2ZH
         pPKlaiTHRrbo6vCnou9ArR2VHhvtmYK2OWY5mW2rcFR+FwkNA3G63W18wyuZAtW2Opuv
         HwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771328277; x=1771933077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsO1/V8R3c9W1n0vXsS94k5xMKTxELyxFyxyU320pro=;
        b=cHTzk/KxKYuVbpXh8/OSC2g+1tiyggiXWwJgiOZTjVnBHo2hrEikHVUWds2J/razrb
         syy3DzxobNAG6ISRUVvGerY1i8FC9zfDScBOErWBUAKAzAP9BogJIKwzxyWs8//u01FD
         obKvXuFuKlasZGRX4Jddzc89ba6vONwWd0abUfKAyrwr+ORvSRjdv2a77LBVS+jQwS1O
         YYug+dPJmPL5+mFpB0da6r8UB575rG1IJlrKmKLO0Xuq1MbPt/+REAbA4QXBelapxe1Q
         h/8UX7aVkKe+nJTMrxg4rY5ET+4y7MjY7iSeRLylh1Z8p4mwrAD+OFXBSOsiq3CN1f6t
         A6Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWjDnoGaiFfLGwxlKrtAZ/2+27QZbYSq8aixVnunvH9x7AEbwNow0OKkXPWVhnoC6d7rc9FRRRW23s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylAXOtJmqBwzyvD5fc8pkznbpG+XqkWFu6Osjn9YE6n9CuU0Mh
	b7vwW2T57HOvXhCcY3ePbxGxs2/ATRBBHPZLPvOG+H7G0eEnHFJIfvnhfeHejbqwIw==
X-Gm-Gg: AZuq6aICNsz598EwW5A9GBU8XwU7AVkiIaUDP/4SBTBWZ6y4V+nvTD3aKm2iwxfpnAo
	ToQo8lhBLtbNNf5f0NF2dQpVKE28F13F+7iDoFEmSCwhg/YGAConpNnAfN91+xHpZjXP5XBsNnh
	Dw/h2YHENytYMUXMyHlO6C3EzOY+QAFIyWi6++bLgp7qAUZpQ9c300TAIBMc4ebemKSA1YDSgIv
	Gn50x5wVnr0WelhJ9UswfN60yNOWDg4mRPQHosKVbz/S4ff8M9QBBvS6Dv/oRcARM+COgj1P+e5
	hocjG9WKGDrOPOIoEmqu0k+GVMNiR0OO9msD5UmqZ0YybXG89sOnTWluLTNdPh6fz21JD4Sh/Nd
	IaIwhFxTauSjlacJ66jUL8x80lJY6Ui6qlh0mSBYHSs7ApX2rQuubeTVj+PnBAcNR9gj9KmABbr
	ZT0+mKF7x/WRXEyNFPA7afHoHlKcPzKd5c5kqj1K93Pue3tuWR9wLadDuGDqnhtHU0f0x0AXWN8
	VrdwiPsV01W9Zg=
X-Received: by 2002:a05:6000:1a8f:b0:435:a9c9:159 with SMTP id ffacd0b85a97d-437978d11d0mr21645095f8f.18.1771328276930;
        Tue, 17 Feb 2026 03:37:56 -0800 (PST)
Message-ID: <fd7c8adf-d8cf-482e-8c8b-55187ea6dabf@suse.com>
Date: Tue, 17 Feb 2026 12:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/16] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
 <06c3b8f88803039a3d900c8cb2f1fd9d05f44e3e.1770999383.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <06c3b8f88803039a3d900c8cb2f1fd9d05f44e3e.1770999383.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9FE0F14B7BA
X-Rspamd-Action: no action

On 13.02.2026 17:28, Oleksii Kurochko wrote:
> Some hypervisor CSRs expose optional functionality and may not implement
> all architectural bits. Writing unsupported bits can either be ignored
> or raise an exception depending on the platform.
> 
> Detect the set of writable bits for selected hypervisor CSRs at boot and
> store the resulting masks for later use. This allows safely programming
> these CSRs during vCPU context switching and avoids relying on hardcoded
> architectural assumptions.
> 
> Note that csr_set() is used instead of csr_write() to write all ones to
> the mask, as the CSRRS instruction, according to the RISC-V specification,
> sets only those bits that are writable (note that the quote consider only
> non-read-only CSRs as writing to read-only CSRs according to the spec.
> will raise an exception):
>     Any bit that is high in rs1 will cause the corresponding bit to be set
>     in the CSR, if that CSR bit is writable.
> In contrast, the CSRRW instruction does not take CSR bit writability into
> account, which could lead to unintended side effects when writing all ones
> to a CSR.
> 
> Masks are calculated at the moment only for hedeleg, henvcfg, hideleg,
> hstateen0 registers as only them are going to be used in the follow up
> patch.
> 
> If the Smstateen extension is not implemented, hstateen0 cannot be read
> because the register is considered non-existent. Instructions that attempt
> to access a CSR that is not implemented or not visible in the current mode
> are reserved and will raise an illegal-instruction exception.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>  - Move csr_masks defintion to domain.c. Make it static as at the moment
>    it is going to be used only in domain.c.

Except that ...

> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -2,9 +2,14 @@
>  
>  #include <xen/init.h>
>  #include <xen/mm.h>
> +#include <xen/sections.h>
>  #include <xen/sched.h>
>  #include <xen/vmap.h>
>  
> +#include <asm/setup.h>
> +
> +struct csr_masks __ro_after_init csr_masks;

... it's not static here and even has ...

> --- a/xen/arch/riscv/include/asm/setup.h
> +++ b/xen/arch/riscv/include/asm/setup.h
> @@ -5,6 +5,15 @@
>  
>  #include <xen/types.h>
>  
> +struct csr_masks {
> +    register_t hedeleg;
> +    register_t henvcfg;
> +    register_t hideleg;
> +    register_t hstateen0;
> +};
> +
> +extern struct csr_masks csr_masks;

... a declaration here. If you want to keep it non-static, it (and the struct
decl) likely wants moving elsewhere. Whereas if you truly want it to be static,
the struct decl would want moving to domain.c as well.

> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -70,6 +70,25 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
>      return fdt;
>  }
>  
> +void __init init_csr_masks(void)
> +{
> +    register_t old;

As indicated before, this would better be ...

> +#define INIT_CSR_MASK(csr, field) do { \
> +        old = csr_read(CSR_##csr); \
> +        csr_set(CSR_##csr, ULONG_MAX); \
> +        csr_masks.field = csr_read(CSR_##csr); \
> +        csr_write(CSR_##csr, old); \
> +} while (0)

... local to the scope the macro introduces. IOW with both this and the
earlier remark, let's try to strive to have scope and exposure of variables
as narrow as possible (unless of course there are clear reasons not to).

And btw, wouldn't you again better use csr_swap() here?

Jan

