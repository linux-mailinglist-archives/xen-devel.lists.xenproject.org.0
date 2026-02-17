Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEZPMeV5lGkfFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 15:23:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7FE14D1C5
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 15:23:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235074.1538114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsLyq-0002zC-MK; Tue, 17 Feb 2026 14:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235074.1538114; Tue, 17 Feb 2026 14:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsLyq-0002ws-Jj; Tue, 17 Feb 2026 14:23:12 +0000
Received: by outflank-mailman (input) for mailman id 1235074;
 Tue, 17 Feb 2026 14:23:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsLyo-0002wm-ML
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 14:23:10 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ee4e7c4-0c0c-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 15:23:09 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4837634de51so14457725e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 06:23:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6b563sm34536390f8f.12.2026.02.17.06.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 06:23:08 -0800 (PST)
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
X-Inumbo-ID: 2ee4e7c4-0c0c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771338189; x=1771942989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xAlLxLBYl2fP0NKoNXaN7SOK3yZ5y7XiomzqMv8uFq8=;
        b=KiKpeEFtuLOvLQhs7i32zYubvLqlwsm7hg3tKD5qOqj7zo6nl0KPaSHrsajwc6hr3K
         buCqJ0UxFiP7NUB+CksMQJ+ybBVZzOlx5/L8Ckoj1Yz4W1WzJa6m53vxkSAoLT4WNkkL
         VY/0080PnFpaY59mJ5XMaWfR/TnbwiY3Sp2pb/eQ/87QzcVUuQpH08bs525itGYXWkzE
         GmeVxg9YbzOIgrEfPvuqI2w2icJEOVMDXBRaA+c3+RYj21NY3NutsgBSn1OB68BSU9+i
         YYZlKu+m8Q6LAAGzSeiceAXXcro1LGoEGydFBtDeeRs4mm8AETOCjZCK8kBJsZWvnBBM
         pkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771338189; x=1771942989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAlLxLBYl2fP0NKoNXaN7SOK3yZ5y7XiomzqMv8uFq8=;
        b=cnftq4BFcOPYSB8oXV2tI172JiVuOnTlPfI/fVXaATbPUMlEtbWnBiJDL+Ldi+Y7tE
         emQe+rlhrWgub08j2ogp+crMHzZa2AGllDxrJRO6ME+CFnrKbzrvcm09gGNkizKk5sQ1
         cYI9WRj+uC395jhOnAULzLW5xa1A11TsKdbpMkWwDHZusVYJVk8WaqOvhaTqQAcHCF7L
         uWWon1RxXl6Z4fO1QVYWbLxrx9udD/fiJPp+aSCwWZYfeS7VqKDpNf7vescecXrs0hXA
         WiBEbxFIFSoGS77LxAVNLjRFcA6EA4LZ4zYCI3K18vzN8D3a9XhwaFFkJudvd1q8ntBe
         AkLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSu4Qe/Gi0SVkyY+2jI9q1qWInD5fwoMCrvSGjYjwOAzrH12TZvZPBBGXVjaoyGBm30HMaq/Yr5S0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy26qQ0RQgyQQw+aSpCTjAxqt7+mwSglAVg0S3NlfdQEH43mZuA
	TRmxT7Nou6n5caShf0RtaufmmdjSFom4c+n/CXKRZyNI6DXk74nxLjeat2RHjrmD1Q==
X-Gm-Gg: AZuq6aIpXqOHE2QjdlYLELRPk5NZtVauZyaJrICCawL1XmrvpsDjDUBdTLiYgn1iEbe
	bklf/s48t1J8QWGXvkdHp26WCLTA5CGnxQpWMX+SkXluQxLJXlEnK2sDZVqY+3JMH2o6f9WMJp0
	rCETWQV/bBfXB5E7tnsdjy40tchgvOZybTZ7lTBeFooFoJtxHsd4D7q1w9ATzUT4BP/NyhDPQti
	J8JYDf9dggwIdWhnr0DdUtzWFFrKTHGxhrCZyEEo+2X6B15SPGew2HbuWSRBXaYwIvZz5uK/V08
	s/YYcDj2we/UwBDLIrYtv2xygNhC3IwmqcEFoE1HgC6chtCD2vMt1FAo9vOzBfmCzYZpe6QGTua
	+uYMEQqXSCLFJGQcTgP9YYEh/5LxY62PgK8Y6Ff/2giTh12iAl7hVOFu3Hj8eWGlSIfkVwrmbQG
	zffmUZYB7rOqJ4WC2MhnOyKxCQdsxbjLDECf7gV+2lFcDdjHDGpIWYcr0679Ifx+kNJwQPUkglF
	j4GVzzDYGxzBDI=
X-Received: by 2002:a05:600c:c0ca:b0:483:78c5:d743 with SMTP id 5b1f17b1804b1-48378c5d9fcmr164471015e9.28.1771338188641;
        Tue, 17 Feb 2026 06:23:08 -0800 (PST)
Message-ID: <07e6d8a4-c825-4d65-ab27-60ced2f25e79@suse.com>
Date: Tue, 17 Feb 2026 15:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/16] xen/riscv: implement vcpu_csr_init()
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
 <7c58dfbac99694811e4276858b48baa211331229.1770999383.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7c58dfbac99694811e4276858b48baa211331229.1770999383.git.oleksii.kurochko@gmail.com>
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
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3C7FE14D1C5
X-Rspamd-Action: no action

On 13.02.2026 17:28, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -6,10 +6,74 @@
>  #include <xen/sched.h>
>  #include <xen/vmap.h>
>  
> +#include <asm/cpufeature.h>
> +#include <asm/csr.h>
> +#include <asm/riscv_encoding.h>
>  #include <asm/setup.h>
>  
>  struct csr_masks __ro_after_init csr_masks;
>  
> +#define HEDELEG_DEFAULT (BIT(CAUSE_MISALIGNED_FETCH, U) | \
> +                         BIT(CAUSE_FETCH_ACCESS, U) | \
> +                         BIT(CAUSE_ILLEGAL_INSTRUCTION, U) | \
> +                         BIT(CAUSE_BREAKPOINT, U) | \
> +                         BIT(CAUSE_MISALIGNED_LOAD, U) | \
> +                         BIT(CAUSE_LOAD_ACCESS, U) | \
> +                         BIT(CAUSE_MISALIGNED_STORE, U) | \
> +                         BIT(CAUSE_STORE_ACCESS, U) | \
> +                         BIT(CAUSE_USER_ECALL, U) | \
> +                         BIT(CAUSE_FETCH_PAGE_FAULT, U) | \
> +                         BIT(CAUSE_LOAD_PAGE_FAULT, U) | \
> +                         BIT(CAUSE_STORE_PAGE_FAULT, U))
> +
> +#define HIDELEG_DEFAULT (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
> +
> +static void vcpu_csr_init(struct vcpu *v)
> +{
> +    v->arch.hedeleg = HEDELEG_DEFAULT & csr_masks.hedeleg;
> +
> +    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
> +
> +    v->arch.hideleg = HIDELEG_DEFAULT & csr_masks.hideleg;
> +
> +    /*
> +     * VS should access only the time counter directly.
> +     * Everything else should trap.
> +     */
> +    v->arch.hcounteren = HCOUNTEREN_TM;
> +
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
> +        v->arch.henvcfg = ENVCFG_PBMTE & csr_masks.henvcfg;
> +
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +    {
> +        register_t hstateen0 = 0;
> +
> +        if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
> +            /*
> +             * If the hypervisor extension is implemented, the same three
> +             * bits are defined also in hypervisor CSR hstateen0 but concern
> +             * only the state potentially accessible to a virtual machine
> +             * executing in privilege modes VS and VU:
> +             *      bit 60 CSRs siselect and sireg (really vsiselect and
> +             *             vsireg)
> +             *      bit 59 CSRs siph and sieh (RV32 only) and stopi (really
> +             *             vsiph, vsieh, and vstopi)
> +             *      bit 58 all state of IMSIC guest interrupt files, including
> +             *             CSR stopei (really vstopei)
> +             * If one of these bits is zero in hstateen0, and the same bit is
> +             * one in mstateen0, then an attempt to access the corresponding
> +             * state from VS or VU-mode raises a virtual instruction exception.
> +             */
> +            hstateen0 = SMSTATEEN0_AIA | SMSTATEEN0_IMSIC | SMSTATEEN0_SVSLCT;
> +
> +        /* Allow guest to access CSR_ENVCFG */
> +        hstateen0 |= SMSTATEEN0_HSENVCFG;

I continue to be puzzled by the use of = vs |=. If you use |=, best do so
uniformly. Then inserting new code ahead of the one you have now is not a
problem. I wonder anyway why you don't do (omitting commentary):

        register_t hstateen0 = SMSTATEEN0_HSENVCFG;

        if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
            hstateen0 |= SMSTATEEN0_AIA | SMSTATEEN0_IMSIC | SMSTATEEN0_SVSLCT;

As to CSR_ENVCFG - what's that referring to? I'm aware of menvcfg, henvcfg,
and senvcfg. But I'm unaware of plain envcfg, and there's also no CSR_ENVCFG
constant in riscv_encoding.h afaics. I assume it's senvcfg that you mean
here. And then - is this CSR unconditionally available? The "Supervisor ISA"
isn't called an extension, yet at the same time it's also part of the
separate "privileged" specification, not the general one.

> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -48,6 +48,12 @@ struct arch_vcpu {
>      } xen_saved_context;
>  
>      struct cpu_info *cpu_info;
> +
> +    register_t hcounteren;
> +    register_t hedeleg;
> +    register_t henvcfg;
> +    register_t hideleg;
> +    register_t hstateen0;
>  };

One question about the ordering here: It looks to be alphabetically sorted
right now, yet I wonder whether that's optimal. Some CSRs might typically
be used together, in which case they may best live close together (for
chances to be good that they end up in the same cache line).

Jan

