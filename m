Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK94LbcX1Wm30AcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 16:41:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CEA3B0393
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 16:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275048.1561027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA799-0003X5-JY; Tue, 07 Apr 2026 14:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275048.1561027; Tue, 07 Apr 2026 14:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA799-0003Uk-G4; Tue, 07 Apr 2026 14:11:15 +0000
Received: by outflank-mailman (input) for mailman id 1275048;
 Tue, 07 Apr 2026 14:11:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wA798-0003SF-4J
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 14:11:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA797-0022M9-GM
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 16:11:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d5107c-5cb7-0a2a0a5109dd-0a2a4502a0ea-14
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 16:11:13 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d51081-42fa-0a2a45020019-d155dd2fb559-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 16:11:13 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43b8e8e7432so4153722f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 07:11:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a71f7sm52784821f8f.1.2026.04.07.07.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 07:11:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1775571073; x=1776175873; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bf7hJHbgNRm6EA4s/SPWOyvDHd8fJ/4ii5mYvLbdZgs=;
        b=F7e0E1sMIC6HkvCwPd53QplZYprcBEousdxAQOXdJ7gIfi0803LAqFFxJyt0N7Y6ef
         dTWWqXFlFDxIKgDEKhASfTf1RCIJM7p0ObBP5aGJb9Xb+hlHBlzp/+r3ZfyL7tFt6g2K
         1RM6u6b0QrKEpjVcesbuIgrYpmou0FsFMjIJ5v682K0Kt5A433AK2WpUSqsKb6QEKRc+
         YxMSFHsHgwSJduSfA0Vpkr1aNrCeu3wBaadhkV3uK1k5TRblArB/YQfoj0NINpmPIlx1
         8dDyLPUCm/HwMRKIlDTYIKkDxzc5BfK0HhLWrtWFlyYfKPaZWc5vmGRR3HxqR1MaRBda
         0J7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775571073; x=1776175873;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bf7hJHbgNRm6EA4s/SPWOyvDHd8fJ/4ii5mYvLbdZgs=;
        b=mBJoCS+2rMtlgBtFWIqP7S/uF6kv0ePzLurWM7SP+PaT7KfVL082hRnvAtXcZEfrlD
         dN28gBtjtjbuc/M3DGG3RI3Qkqou53RwmBSrpTJyrdvRbzcHa0ScAoCLxhkJOHq7B1J5
         xJsIQwopCrbnMB/r1ZLWJM8sQYDEF3Fe5iFJOH2ipV++vAmqwFXYXipDcdu07SMP6iBB
         q6JHkX/RResODUE01RJNSd2OLD6LOwHoylYAXSqvWEpqEl+uaQdmf6ep1HSvxXclQ0WF
         UBBytqxeensyCnxijOAjVoamaFZ+V+iyxEjT7t+v/dzRhi1pgY/8gfNmBQ+2Vo3D5sgV
         VWZg==
X-Forwarded-Encrypted: i=1; AJvYcCV4EtAXMYitQ3G5UJY3wldZxALMlmpU1J7id3KmCEDSPsLHpmSCdbCZvgAQDPJ61Adgri7B8U3soW4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy72Pnyv6jH8qxotfslrzEX2Gl+O2SNksfgOqqcOIyQbIvMxDJD
	bQbWh+sod6UJz8jOEwoxzOED/ZpE8As3/tQJuAyhxhLM3rx2hLEIkHDevbSlqWlDrA==
X-Gm-Gg: AeBDieuOZaKJEWNaO6S8qtoz9thy25gO8sAzVj2zG4iKFl+kdyJwLdDdwLI+9+Xdiqk
	N3km/diGp1sa+fVHJOUydjkECgs4HMsmvjKFp19FpT5+tLHXEVqAeiwgR+Y7i43Hi7EWCT7LnG9
	5BsYbK6ZfesoMWP1KjTHYH+3Q8oVkFBSbpl1JYqbkMlVD4M1IAadO1TDxQXYZog3iEJhNfOLWp/
	xmzsT9ifC8PbuWYYTE941B65pLeZCYlgUwbIjE7glZiY0oJCSgEp34xpCtm0ONdOagQRPErdUtX
	v4NvGpiF804gLBdghiE3hzEKubZMCT3qYbxB+43q8FGIeySodwMTVnRWIcqakxn1lNcKK7t9qyA
	VH2A2eqFoOBaOvH/9Z4Aguj5TOXxhQVjO7GivioyUYOlrQ1ku8w78MPtsH6hKw050RTd1C7Qj/+
	KsNYZ2EzSyI8gfOE25IJD3RjlqC2+0o8ZEMzV0cTQUJ8IIPfxTwYs+DWnMZZ96A6liwjgr4RLb3
	jZ3ZAvU690Pjek=
X-Received: by 2002:a05:6000:61e:b0:43d:1bf6:927 with SMTP id ffacd0b85a97d-43d29295ffdmr24659486f8f.14.1775571072623;
        Tue, 07 Apr 2026 07:11:12 -0700 (PDT)
Message-ID: <79c69067-4771-40df-a52b-8b552cd92a00@suse.com>
Date: Tue, 7 Apr 2026 16:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 27/27] xen/riscv: add initial dom0less infrastructure
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
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <a66c727d0b99b9de41f516e1304b1a70192c9392.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a66c727d0b99b9de41f516e1304b1a70192c9392.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1775571073-AD53CCD1-2F6E46A4/10/73395122804
X-purgate-type: spam
X-purgate-size: 4000
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
	NEURAL_HAM(-0.00)[-0.998];
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
X-Rspamd-Queue-Id: 25CEA3B0393
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:09, Oleksii Kurochko wrote:
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
> construction code,

I'm wondering about the splitting among patches: There's half a dozen
(effectively stub) functions which are added here, and then there is
the single init_vuart() which was split out into the earlier patch.
What's the pattern behind this, i.e. why isn't init_vuart() also
being added here?

> including domain bitness helpers and the
> p2m_set_allocation() prototype.
> 
> Additionally define the guest magic memory region in the public
> RISC-V interface.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Open questions:
>  - Move declaration of p2m_set_allocation() to xen/fdt-domain-build.h or
>    xen/dom0less-build.h as it is used in common code of Dom0less and
>    there is not too much sense in declaration of it for each arch which
>    supports Dom0less. It could be ifdef-ed in common header as, at the
>    momemnt, it is used only for Dom0less.

Having a common declaration of p2m_set_allocation() is certainly a
sensible thing to do, but not in DT or dom0less headers. p2m-common.h
is, going from file names, the only plausible place for it to go.
Whether that (a) works and (b) makes sense are separate questions.

>  - Shouldn't declaration/defintion of max_init_domid move to common code
>    instead of having it for each architecture separately? If yes, then what
>    would be the best place.

What would you use to decide whether the declaration or #define is
needed? (Plausible headers to put it can surely be found: console.h,
domain.h, and perhaps more.)

> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -20,6 +20,14 @@ struct hvm_domain
>      uint64_t              params[HVM_NR_PARAMS];
>  };
>  
> +#ifdef CONFIG_RISCV_64
> +#define is_32bit_domain(d) (0)
> +#define is_64bit_domain(d) (1)
> +#else
> +#define is_32bit_domain(d) (1)
> +#define is_64bit_domain(d) (0)
> +#endif

First, please use true/false. Then, while I agree with the RV32 part, 32-bit
guests surely will need to be an option on a 64-bit hypervisor. Imo you'd
better introduced a field in struct arch_domain to carry that information
(or to derive it from) right away. That wouldn't be set to non-zero for the
time being, i.e. that same constant-true/false would still result.

Otherwise I don't see why you use #ifdef; you could then have things
simpler as

#define is_32bit_domain(d) IS_ENABLED(CONFIG_RISCV_32)
#define is_64bit_domain(d) IS_ENABLED(CONFIG_RISCV_64)

(but I specifically don't recommend going this route).

> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -32,6 +32,8 @@
>  #include <asm/traps.h>
>  #include <asm/vsbi.h>
>  
> +domid_t max_init_domid = 0;

The initializer isn't of much use, is it? Instead add __read_mostly, like
Arm has it?

> --- a/xen/include/public/arch-riscv.h
> +++ b/xen/include/public/arch-riscv.h
> @@ -58,6 +58,9 @@ typedef uint64_t xen_ulong_t;
>  #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
>  #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }
>  
> +#define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
> +#define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)

What is this, and why does it need putting in the public interface? Plus
how come the numbers are exactly the same as what Arm uses?

Jan

