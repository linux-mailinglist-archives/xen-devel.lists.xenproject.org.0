Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UALTOU7Sr2kfcgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 09:11:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6060E2470D2
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 09:11:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249850.1547231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzsBx-0000ij-N0; Tue, 10 Mar 2026 08:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249850.1547231; Tue, 10 Mar 2026 08:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzsBx-0000gC-K9; Tue, 10 Mar 2026 08:11:49 +0000
Received: by outflank-mailman (input) for mailman id 1249850;
 Tue, 10 Mar 2026 08:11:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzsBw-0000fn-Rr
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 08:11:48 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c84a2640-1c58-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 09:11:47 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso126083895e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 01:11:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b6f708sm74400015e9.11.2026.03.10.01.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 01:11:45 -0700 (PDT)
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
X-Inumbo-ID: c84a2640-1c58-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773130306; x=1773735106; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bYPN/tGDDB2gNXEumQ56ibMZof+RWYgUy2Nmn53+I3Y=;
        b=JY3zyUpPT/i6XUnjvkKfp4VbzxnW+lJdJX3sDPEcxOo4KlaGQzqN2GIlkihyO8bGXo
         SyLgUmPCGA0JQGnGOKkemUfZVNNBNdu3aMj5kVPzzPG6DzW12yzgdwhTuOVZUMggeFeS
         Biw0Xlgkc6sSvqhylVC93t8gYp9BtKLRnr4jFA1UHPC10c/YdPuEuEQ1P6QJ9FGm7Lzb
         G6hbfOlyEuc8QvY8YjmlF7QYj3Ek4j6LDQp2BCsgjgH49mlba7O6darV7R+AfgWlLQqy
         jjqtZMZOwDtJfTBey/Iic7dyqTDddFN7NlOPg6BWFh6e3TgT/ipHacF26sVQn5mbMd10
         n+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130306; x=1773735106;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYPN/tGDDB2gNXEumQ56ibMZof+RWYgUy2Nmn53+I3Y=;
        b=HfcyesLBKJEizqCebhjNM0SXddv9QZjrfCZDE9LKdYVGeTZFjPvYYxURskBgQ8e1bZ
         VbOw994RzmsdvrkBq6LWXtdKO4omoSmXoDVFwf+kha8hE2MDm5zYI3wmRC25f53P+Qfc
         BRJM29vvRfuHmIfqKw7q0RkongABAbD393CL5oujkU/9sXv5Hry5SnCowm0JxKKjTTLu
         tYJY/9OkZTxBz8JZoZcIXmf9hOwfFH8lp0+Xbbhf9zDJulsoXMGYadHtIdEIECKxFndb
         5urqF/CX3OAaj47TLMVSin6TGj9S6r3/LmRioGC+TLI9iAONSbr64ApyOKmynxbKYgF1
         umyg==
X-Forwarded-Encrypted: i=1; AJvYcCUc7ebjQOVUMlmbijtaC6buuipJD+12EqjN38CahVS4I4R2swDBv86feg1iJ83zSLF6NxfGq+3b1yU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZUxtIh9bR1DqsRws0z3H0efKSFzyifHRCwUYXz+KtQzEEnmwt
	oR1BZXOi6/kXyYxSx/GItMWb4EfBUYLWAfYK20U2mPqyxMaLlJ2OqPf9xMcOZE343w==
X-Gm-Gg: ATEYQzxC3/sezy1HONkoAfj4ntJ4S/QQJgxAOt16ePSBoFuvAqNVfpPJ/SIG4az7U2U
	KJuIkNPTpDyMhRmXCxSNaeYEqtWaDyAf6qzDSqb1OXCNaEcu4p5wpc9DTJyUUdr2LtGMZLUrccE
	GQeQwe/PeyduaocRY1eGIB0/jk4lqE7t+0uS+7fcmlGDOFDjfDP0trRFWMJUNGeI/wUXQfX0ip/
	60ps2q1mds/In8AsYX9d5SvQOYsWpTmsgBEedi2lbSC0REygrZROKpefQZyE3E7JKC/7nZKRw+l
	Yt+yLhhh3py0b2zw9/oDArajtvGD1Tl2kDpTgUJAh8ki0MYL5HPt9B+ptJ9BbMBLr/iG3qVZEVe
	lzLO7O6FPxQJRbieTRacPd5WtQIuBZhAfePWtADfEkruMN/NQWwvPTztrabQAznulx4Q8MeXAA7
	Mr/SyKmEbnwXWowfZsSNFvdF4Bj+77hG01UpZ7TcM97OVEZ+Vas+YhmI0+zw/2C4NzoMr45Y3UG
	J2KygwSWtKCL2M=
X-Received: by 2002:a05:600c:1d89:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-485419a2774mr35770765e9.2.1773130306204;
        Tue, 10 Mar 2026 01:11:46 -0700 (PDT)
Message-ID: <2de7f459-00b3-4968-aaa2-9067cb0c4aa4@suse.com>
Date: Tue, 10 Mar 2026 09:11:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/14] xen/riscv: detect and store supported hypervisor
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
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
 <3201951150104f17593e16c7ba00ada51ac1e10f.1772814110.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3201951150104f17593e16c7ba00ada51ac1e10f.1772814110.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6060E2470D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
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
X-Rspamd-Action: no action

On 06.03.2026 17:33, Oleksii Kurochko wrote:
> Some hypervisor CSRs expose optional functionality and may not implement
> all architectural bits. Writing unsupported bits can either be ignored
> or raise an exception depending on the platform.
> 
> Detect the set of writable bits for selected hypervisor CSRs at boot and
> store the resulting masks for later use. This allows safely programming
> these CSRs during vCPU context switching and avoids relying on hardcoded
> architectural assumptions.
> 
> Use csr_read()&csr_write() instead of csr_swap()+all ones mask as some
> CSR registers have WPRI fields which should be preserved during write
> operation.
> 
> Also, ro_one struct is introduced to cover the cases when a bit in CSR
> register (at the momemnt, it is only hstateen0) may be r/o-one to have
> hypervisor view of register seen by guest correct.
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

Acked-by: Jan Beulich <jbeulich@suse.com>

I'll commit as-is, yet still a couple of remarks:

> ---
> Changes in V7:
>  - Use csr_read_set() in INIT_CSR_MASK() instead of csr_read()+csr_write().
>  - Add undef of INIT_CSR_MASK().
>  - Move local variable old above INIT_CSR_MASK().

This contradicts ...

>  - Introduce INIT_RO_ONE_MASK() to init csr_masks.ro_one.* fields.
>  - Introduce defines for masks intead of constants.
>  - Move old variable inside macros INIT_CSR_MASK() and INIT_RO_ONE_MASK().

... this. You may want to prune revlog entries when making incremental
changes within one revision.

> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -2,9 +2,66 @@
>  
>  #include <xen/init.h>
>  #include <xen/mm.h>
> +#include <xen/sections.h>
>  #include <xen/sched.h>
>  #include <xen/vmap.h>
>  
> +#include <asm/cpufeature.h>
> +#include <asm/csr.h>
> +
> +struct csr_masks {
> +    register_t hedeleg;
> +    register_t henvcfg;
> +    register_t hideleg;
> +    register_t hstateen0;
> +
> +    struct {
> +        register_t hstateen0;
> +    } ro_one;
> +};
> +
> +static struct csr_masks __ro_after_init csr_masks;
> +
> +#define HEDELEG_AVAIL_MASK ULONG_MAX
> +#define HIDELEG_AVAIL_MASK ULONG_MAX
> +#define HENVCFG_AVAIL_MASK _UL(0xE0000003000000FF)
> +#define HSTATEEN0_AVAIL_MASK _UL(0xDE00000000000007)

It's not quite clear to me what AVAIL in here is to signal. It's also not
quite clear to me why you would use _UL() in #define-s sitting in a C file
(and hence not possibly being used in assembly code; even for asm() I'd
expect constants to be properly passed in as C operands).

> +void __init init_csr_masks(void)
> +{
> +    /*
> +     * The mask specifies the bits that may be safely modified without
> +     * causing side effects.
> +     *
> +     * For example, registers such as henvcfg or hstateen0 contain WPRI
> +     * fields that must be preserved. Any write to the full register must
> +     * therefore retain the original values of those fields.
> +     */
> +#define INIT_CSR_MASK(csr, field, mask) do { \
> +        register_t old = csr_read_set(CSR_##csr, mask); \
> +        csr_masks.field = csr_swap(CSR_##csr, old); \
> +    } while (0)
> +
> +#define INIT_RO_ONE_MASK(csr, field, mask) do { \
> +        register_t old = csr_read_clear(CSR_HSTATEEN0, mask); \
> +        csr_masks.ro_one.field = csr_swap(CSR_##csr, old) & mask; \
> +    } while (0)
> +
> +    INIT_CSR_MASK(HEDELEG, hedeleg, HEDELEG_AVAIL_MASK);
> +    INIT_CSR_MASK(HIDELEG, hideleg, HIDELEG_AVAIL_MASK);
> +
> +    INIT_CSR_MASK(HENVCFG, henvcfg, HENVCFG_AVAIL_MASK);
> +
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +    {
> +        INIT_CSR_MASK(HSTATEEN0, hstateen0, HSTATEEN0_AVAIL_MASK);
> +        INIT_RO_ONE_MASK(HSTATEEN0, hstateen0, HSTATEEN0_AVAIL_MASK);
> +    }

The 3rd macro parameters are now redundant. At the example of INIT_CSR_MASK(),
you could now have

#define INIT_CSR_MASK(csr, field) do { \
        register_t old = csr_read_set(CSR_ ## csr, csr ## _AVAIL_MASK); \
        csr_masks.field = csr_swap(CSR_ ## csr, old); \
    } while (0)

This would reduce the risk of incomplete editing after copy-and-paste, or
other typo-ing.

Note also that ## being a binary operator, ./CODING_STYLE wants us to put
blanks around it just like for non-pre-processor binary operators. I'll
try to remember to make that adjustment when committing.

Jan

