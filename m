Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4bjoOY5FOmpz5AcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 10:36:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9346B54F0
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 10:36:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=SFYvXDfW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344162.1603290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbwcD-0002AT-9E; Tue, 23 Jun 2026 08:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344162.1603290; Tue, 23 Jun 2026 08:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbwcD-00028t-5t; Tue, 23 Jun 2026 08:36:17 +0000
Received: by outflank-mailman (input) for mailman id 1344162;
 Tue, 23 Jun 2026 08:36:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbwcB-00027f-J7
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 08:36:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbwcA-00DOsq-W5
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 10:36:15 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a457e-2eae-0a2a0a5409dd-0a2a450a8cca-0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 10:36:14 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a457e-93a5-0a2a450a0019-d155dd2fc9f7-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 10:36:14 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-46255b269c2so4026516f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 01:36:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46666788282sm49669824f8f.17.2026.06.23.01.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 01:36:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1782203773; x=1782808573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZbghzMQ6lHln4QSrv516FSMzVtW4LwpSMC2+YgztWo=;
        b=SFYvXDfWlFjCixKuGcCh/UgpeNk/YYAvt1O0q7d840HKEzk3yRoBZdKCWtFHmLL9l2
         5D9RN4uiC6fZtlhMolRnoCvzCwP4f6nPeBOG2OiROvgKeiIqWpIaUCWmha4SRDydvDYa
         WlAtt4wHE1dKjGCGE7C4rvCSDUGK2r6OoupwqN6VCfTgpIVsIvMu/CPZFAqO0ZWZICmJ
         aPVw7nxZ7l5G0qkIjMyiG4VJmG/FZj5jKdqzARws6Y2ACT8FG85pacLTpxd6gyDsp4U8
         kK/VwZ8tmRs4+BlzQ/alo8vT4rAmhdCrmYs6I61O6IeZ8ACTJRLHHHj4/o+kdjZGKaQ/
         XiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782203773; x=1782808573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZbghzMQ6lHln4QSrv516FSMzVtW4LwpSMC2+YgztWo=;
        b=qDIhRRlDTG8HCVHUuhHUloj/JT87i+vu4/UrJDGQwwRSI2yKIu5M3BFJEohIoCjcqA
         IK9trJLbSj63SY4d8zzVU7TWAHyfikZKfX+DMPWwVel3tlAw5EK9eQwG6NA6jVslsXfg
         cvfnt7TO0Zy/VY8lLTTN7I8b+5WaLqMY0uD3dUBzV7lRx29m2h6M1OfSS/f+0PbIFeb3
         74MdP4k77ln6gsoj5yK/MF0tlCY3mxzi0AoJjd7BimF9OYG9HmNM80fxWRB9MC9bU/VA
         hsWQbFtf7JxqYOS9voxr+3n+vmUh5kjGuXvSVtpMvi7LhknvyCxYB2oqSJsbgu4Dr3tI
         rgJA==
X-Forwarded-Encrypted: i=1; AHgh+Roo/90PmRm5AG8R/YM4HcSJ8844jm+p+YcHBWn72SrpT/t+ANGwB5nGkRXyi/tXtkFtEMuBpdmdzxU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyv4nlfrLYSOAzFEmH5goSwLrRemz7nHHLsDg+O94ZEHo1J9pZU
	0UImANh5tDA7qovIRY6x6s4iylL4T36QDXPw+krCeO5RNCozu69o1z+DFBikeCbRjg==
X-Gm-Gg: AfdE7cnCTK/2jbyxEpmdTCbPFNSON8+oiBokXc7qJx0YscJlGap9nE1DfcFl5sy49kf
	6PggdGi18UdQfCcpgdmEmjJLdtUNq5usq2OgTQlvQgrHUPqEZW7rg7XGW5XP83Nb2GgNpoEAqVc
	J+1aeR4Ie1YlcJFkSUaXK+mcbfzPfZhaMFmWSPg+veT7DJIqsrKO7XB5M65izJt7sDm8zfCR/f6
	+bktJF9oe9r0IKqBwH9SJBdYwOwEjRkHRg5VKxzTSPgyB7uc6VVl071ezghyZ0tU3J+OJpMq1pm
	vur8JxaOCGa2jT7xBrgVmvo8MC+BeaA61vesm4/l5djReobcHLoDGk1DFeReBZMo/sJiKIpUeaf
	xPk4ET2TijpDbHcc22Q5FmnUTjJoqYkbYG6asnpRWwY3S4GBboaAJ4jUpHPdk+KVM85ounCPkX9
	/SiUysOM2pmkUrr594xOHbV6jDQJMlIKpzL10SWpswopaVQQJihn5wFHqDgfARkpnXCXLc/KV34
	TeL
X-Received: by 2002:a05:6000:4303:b0:469:3bd0:fa8e with SMTP id ffacd0b85a97d-46adb4912e1mr2436507f8f.12.1782203773549;
        Tue, 23 Jun 2026 01:36:13 -0700 (PDT)
Message-ID: <74d47657-2fa2-4f8f-93f6-cdd96c99ce11@suse.com>
Date: Tue, 23 Jun 2026 10:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/23] xen/riscv: add initial dom0less infrastructure
 support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <781214e3cb87a0fe38e210e9b0cefed49d623d52.1781693963.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <781214e3cb87a0fe38e210e9b0cefed49d623d52.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1782203774-B31EEDB8-953B67F7/0/0
X-purgate-type: clean
X-purgate-size: 3002
X-Rspamd-Action: no action
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E9346B54F0

On 17.06.2026 13:17, Oleksii Kurochko wrote:
> Enable dom0less support for RISC-V by selecting HAS_DOM0LESS and
> providing the minimal architecture hooks required by the common
> dom0less infrastructure.
> 
> Add stub implementations for architecture-specific helpers used when
> building domains from the device tree. These currently perform no
> additional work but allow the generic dom0less code to build and run
> on RISC-V.
> 
> Introduce max_init_domid as a runtime variable rather than a constant
> so that it can be updated during dom0less domain creation.
> 
> Provide missing helpers and definitions required by the domain
> construction code, including domain bitness helpers and the
> p2m_set_allocation() prototype.
> 
> Additionally define the guest magic memory region in the public
> RISC-V interface. GUEST_MAGIC_BASE is placed at 0x79000000 to avoid
> overlapping with the QEMU RISC-V virt machine address space.

No qemu comes into play so far (and likely such also isn't planned).
Then why would such an overlap be problematic? Plus as before, the
constraints on such arbitrarily chosen numbers want putting down in
a code comment next to the respective #define-s.

> --- a/xen/arch/riscv/domain-build.c
> +++ b/xen/arch/riscv/domain-build.c
> @@ -156,9 +156,22 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
>      return fdt_end_node(fdt);
>  }
>  
> +int __init construct_hwdom(struct kernel_info *kinfo,
> +                           const struct dt_device_node *node)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
>  int __init make_timer_node(const struct kernel_info *kinfo)
>  {
>      /* There is no need for timer node for RISC-V. */
>  
>      return 0;
>  }
> +
> +int __init make_hypervisor_node(struct domain *d,
> +                                const struct kernel_info *kinfo,
> +                                int addrcells, int sizecells)
> +{
> +    return -EOPNOTSUPP;
> +}

In the description you say "to build and run". How come "run" is actually
true when these two new stubs return an error? For construct_hwdom() this
may be explained by you not aiming at supporting Dom0 / hwdom (but that
then still is a limitation to mention, perhaps in a TODO comment), but
with DOM0LESS_ENHANCED_NO_XS set make_hypervisor_node() failing is going
to break DomU building as well, afaics.

> --- a/xen/arch/riscv/include/asm/setup.h
> +++ b/xen/arch/riscv/include/asm/setup.h
> @@ -5,7 +5,9 @@
>  
>  #include <xen/types.h>
>  
> -#define max_init_domid (0)
> +#include <public/xen.h>
> +
> +extern domid_t max_init_domid;

Shouldn't this be generalized, seeing that dom0less code requires it this
way on every arch? Same ...

> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -33,6 +33,8 @@
>  #include <asm/traps.h>
>  #include <asm/vsbi.h>
>  
> +domid_t __initdata max_init_domid;

... for the placement of this then, obviously.

Jan

