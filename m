Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOs/Lo2gwmm3fQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:32:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F7730A34A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260903.1554068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w52nv-0007fm-Q8; Tue, 24 Mar 2026 14:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260903.1554068; Tue, 24 Mar 2026 14:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w52nv-0007ci-NE; Tue, 24 Mar 2026 14:32:23 +0000
Received: by outflank-mailman (input) for mailman id 1260903;
 Tue, 24 Mar 2026 14:32:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w52nt-0007cb-L3
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 14:32:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w52nt-001STp-0o
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 15:32:21 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2a072-e002-0a2a0a5209dd-0a2a45038fac-18
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:32:20 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2a074-1947-0a2a45030019-d155dd2bac26-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:32:20 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43b7ff8fe92so855630f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 07:32:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b644ae132sm37699620f8f.6.2026.03.24.07.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 07:32:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1774362740; x=1774967540; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nmh9WHtm3B322i6CtLgpy7cSEOxRnqsBz6LlETDYWVY=;
        b=NGW+/B98JGMbei/OnxRUnK8Zt9GDEPyknTUSqpG4VtBPmXdfuXBE2vxNMzZtQU5fyC
         adHqsFNSoL8ygBGLQgo5OGq8nrYkqjfySjTb+QYUb8Qk3lGCumhHRiKGFEqvrDy3qRKK
         VlemnqRYdFN2r3z26KjAOXmPZNjJvT6idrAHrab0TjT9EwqJCcCLoh1T74U/dJTQfQnx
         npfch2XZDOgn68oqLwIhHdE6z397TU2b/9/xjofvhSUU2JN36nodZ/BATAGWuSMqmRac
         nTBC1cfTu4oHEz5u1bkOlNdvPKKsoMvWkpgYkUBZlf7vpVhAaxzVIpcgA81g72ZeoRyy
         CIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774362740; x=1774967540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmh9WHtm3B322i6CtLgpy7cSEOxRnqsBz6LlETDYWVY=;
        b=T6j51shX64oI9BjwEmYyT7UjMMdx8YwgFgDrc7Wq0y50rlbhb9eAJTgvF1pDsFrc2y
         rrP6dsd4tSLfuuzkAMJsoznI67kCt0GvfTc/N/acW42kSzw/mEYy3Toua5samIozZ6g8
         6vfx8hfUiVq2ZW26mPjrctvmNCG3jMad5a9pFULwxLb6Ps9i6N7Rcp4HT50BxJww+WhN
         vVIbP5B/0AsqjJofdB+iOTuWyDw49ZoCTRhodUyflGLHeZiM4nu2L51c3e5DbnFMfhEa
         l+kEhSOaa1kkr+cf8wW0FGkUHUcmN98ytpKNPJsRwCjSstajbsC5XxMQaZ8++hfNNU4T
         0EeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWChZRwYTbgM0SJcMlCW278ClMQ3U8up6xMCAj4/IQJmbebQLN7qL7XF6M9y3t5ZcP/PpiDqgkoqB8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTC1Ob17BXaQEcStKBDW0dd1QA9JzP30YhCcl17MWNx43EgTm5
	3w23f3HnoDlpzBbS4gV7kZvwyY90CpFcTBG/e3MFugsYmjE2bz2dHMFkvdD6+wLqsw==
X-Gm-Gg: ATEYQzxphBeFQGxOwUxz3xib+/Knim2gtXEUbuTsGs11PTwvJL1mzuTRM6pnRJC7jWp
	J7JrlputxYsZ9U80i9HbIYaBZdt8Bk9iiMcsI5ECJBZ2ctygqgfMJ+0S4egAeiBczGUvaJoTSGH
	NAshW01Jy+xa87GgFEGvNlsgOC3vWj4ZASe/yL9oA2X53qSx7UZD7GNfK0N5XXseQMgMMqcgCQx
	53bgjeCS1Hp+QVn8fNIlu0wYpFULz1FV3wviroRSClUEOWOZTGtyCA03aW2cHYQdMIRgjnDgy67
	sJY9MbU0PolVEdBpCnyXch4Birh6StlHtrTetnWELj4xzDz1agcAY4a1mSw3tHWr1sPAZ3aGhnP
	N7SVTirW6x6xMmMvoRQxtiPLjFsp6EPg1mUgT6Brh3lTMqX7FamiKtVEliN8bJyCu2BFgzvM1GX
	H+O475JPCpTWB5Qft9/6W3lMzXX6xWI8GRqo6r5xvzkhlnYsO76XnvCtLRxYK9o/Cw7ARzNA9AV
	8+fr6N9gurUEMs=
X-Received: by 2002:a05:6000:2f84:b0:43b:4312:2ca9 with SMTP id ffacd0b85a97d-43b642402c0mr23138756f8f.6.1774362739509;
        Tue, 24 Mar 2026 07:32:19 -0700 (PDT)
Message-ID: <4ebe7434-ce4a-421d-b027-f8c110b7b2dc@suse.com>
Date: Tue, 24 Mar 2026 15:32:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] xen/riscv: allow Xen to use SSTC while hiding it
 from guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773419622.git.oleksii.kurochko@gmail.com>
 <0f0849b53625f9f9f939000f29579e264e522fd2.1773419622.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0f0849b53625f9f9f939000f29579e264e522fd2.1773419622.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1774362740-EA29F72C-8AF049F8/0/0
X-purgate-type: clean
X-purgate-size: 5619
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 25F7730A34A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 17:44, Oleksii Kurochko wrote:
> OpenSBI currently does not advertise the SSTC extension via the device
> tree. Additionally, SSTC can no longer be reliably disabled by removing
> the "sstc" string from riscv,isa, as OpenSBI probes support by attempting
> to access CSR_STIMECMP.

Still don't yopu need to remove that string from what guests get to see, ...

> Introduce a runtime probe in Xen to determine whether SSTC is available.
> The probe attempts to read CSR_STIMECMP using csr_allowed_read(). If the
> access succeeds, SSTC is considered available; if a trap occurs, it is
> treated as unsupported.
> 
> When SSTC is detected, Xen may use it internally to program timers.
> However, the extension is not exposed to guests because the required
> context switch handling for the SSTC CSRs is not yet implemented.
> 
> To prevent guests from using SSTC, RISCV_ISA_EXT_sstc is cleared from the
> riscv_isa bitmap. As a result, the corresponding HENVCFG bit is not set
> and guests fall back to the SBI timer interface. Timer requests are then
> handled by Xen via the usual SBI interception path.

... alongside the riscv_isa adjustment?

> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -17,6 +17,7 @@
>  #include <xen/sections.h>
>  
>  #include <asm/cpufeature.h>
> +#include <asm/csr.h>
>  
>  #ifdef CONFIG_ACPI
>  # error "cpufeature.c functions should be updated to support ACPI"
> @@ -139,6 +140,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
>      RISCV_ISA_EXT_DATA(smaia),
>      RISCV_ISA_EXT_DATA(smstateen),
>      RISCV_ISA_EXT_DATA(ssaia),
> +    RISCV_ISA_EXT_DATA(sstc),
>      RISCV_ISA_EXT_DATA(svade),
>      RISCV_ISA_EXT_DATA(svpbmt),
>  };
> @@ -483,6 +485,7 @@ void __init riscv_fill_hwcap(void)
>      unsigned int i;
>      const size_t req_extns_amount = ARRAY_SIZE(required_extensions);
>      bool all_extns_available = true;
> +    unsigned long tmp;
>  
>      riscv_fill_hwcap_from_isa_string();
>  
> @@ -495,6 +498,36 @@ void __init riscv_fill_hwcap(void)
>          panic("HW capabilities parsing failed: %s\n", failure_msg);
>      }
>  
> +    if ( csr_allowed_read(CSR_STIMECMP, &tmp) )
> +    {
> +        printk("SSTC is detected but is supported only for Xen usage not for "
> +               "a guest.\n");

No full stops please in log messages.

> +        /*
> +         * As SSTC for guest isn't supported it is needed temprorary to:
> +         *
> +         * 1. Clear bit RISCV_ISA_EXT_sstc in riscv_isa as theoretuically it
> +         *    could be that OpenSBI (it doesn't pass it now) or whatever ran
> +         *    before Xen will add SSTC to riscv,isa string. This bit  clear

Nit: Stray double blanks.

> +         *    willn't allow guest to use SSTC extension as vtimer context

Nit: won't

> +         *    switch and restore isn't ready for that.
> +         */
> +        __clear_bit(RISCV_ISA_EXT_sstc, riscv_isa);
> +
> +        /*
> +         * 2. A VS-timer interrupt becomes pending whenever the value of
> +         *    (time + htimedelta) is greater than or equal to vstimecmp CSR.
> +         *    Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
> +         *    -1.

-1 is misleading here, as any unsigned value is greater than -1. You mean
UINT64_MAX or e.g. ~0U here.

> +         * It should be dropped when SSTC for guests will be supported.
> +         */
> +        csr_write(CSR_VSTIMECMP, ULONG_MAX);
> +#ifdef CONFIG_RISCV_32
> +        csr_write(CSR_VSTIMECMPH, ULONG_MAX);
> +#endif
> +    }
> +
>      for ( i = 0; i < req_extns_amount; i++ )
>      {
>          const struct riscv_isa_ext_data ext = required_extensions[i];
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -99,6 +99,9 @@ static void vcpu_csr_init(struct vcpu *v)
>      if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
>          v->arch.henvcfg = ENVCFG_PBMTE & csr_masks.henvcfg;
>  
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_sstc) )
> +        v->arch.henvcfg |= ENVCFG_STCE & csr_masks.henvcfg;

Wouldn't this better be part of the (future) patch enabling SSTC for guests?

> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -396,6 +396,8 @@
>  #define CSR_VSTVAL			0x243
>  #define CSR_VSIP			0x244
>  #define CSR_VSATP			0x280
> +#define CSR_VSTIMECMP		0x24D
> +#define CSR_VSTIMECMPH		0x25D

I think it would be nice if throughout the CSR definitions you settled on
using upper case hex digits uniformly, or all lower case ones (personally
I'd prefer the latter).

> --- a/xen/arch/riscv/time.c
> +++ b/xen/arch/riscv/time.c
> @@ -13,6 +13,20 @@
>  unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
>  uint64_t __ro_after_init boot_clock_cycles;
>  
> +static int cf_check sstc_set_xen_timer(uint64_t deadline)
> +{
> +#ifdef CONFIG_RISCV_32
> +    csr_write(CSR_STIMECMP, deadline & 0xFFFFFFFF);

The "& 0x..." isn't needed here, is it? I.e. the whole function could be ...

> +    csr_write(CSR_STIMECMPH, deadline >> 32);
> +#else
> +    csr_write(CSR_STIMECMP, deadline);
> +#endif
> +
> +    return 0;
> +}

static int cf_check sstc_set_xen_timer(uint64_t deadline)
{
    csr_write(CSR_STIMECMP, deadline);
#ifdef CONFIG_RISCV_32
    csr_write(CSR_STIMECMPH, deadline >> 32);
#endif

    return 0;
}

> +int (* __ro_after_init set_xen_timer)(uint64_t deadline);

static?

Jan

