Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDC1Ng5RlGktCQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:29:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD2314B5A3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:29:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234868.1537979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsJGE-0008Mf-0x; Tue, 17 Feb 2026 11:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234868.1537979; Tue, 17 Feb 2026 11:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsJGD-0008K4-Ty; Tue, 17 Feb 2026 11:28:57 +0000
Received: by outflank-mailman (input) for mailman id 1234868;
 Tue, 17 Feb 2026 11:28:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsJGD-0008Jy-CI
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 11:28:57 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d84d4777-0bf3-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 12:28:56 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43767807da6so2909325f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 03:28:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a10cacsm176333415e9.4.2026.02.17.03.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 03:28:54 -0800 (PST)
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
X-Inumbo-ID: d84d4777-0bf3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771327735; x=1771932535; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AZwUkpipSK3w4UtqHK19BjXJ6/3zF0qpUaX3liVbzlk=;
        b=Oi8HSOP2NcTqtX8b4YBRyZVTAWQaOPoSvk1A/leZ9tJnB/GH4CxMmIsX0Dm8KpjUBR
         hdWuTtSm/anuoShh8PwkKgvZRpjVkv521nl8vhow/9FgHqVhvjHDm9P/qWBrkcDw9IxL
         SuuWq9lOuSpI+44CGRBDNMDFZWQabZskqcfEwGwf8hn/Af0brfrFCELwS2Mij6+qiDbd
         XZZBzQ9i6YAdNeoax9VQ09W5xLRWmvP6LwjmHZo0cMfFFiTtn4365CrWDHPwhwoLpbq4
         3A+m9VHWMy/i045JTFmFydDzcoiBUP9jYhYYoTzsIkL5g0xG0NWlB45io+E2WJ86tyCp
         Eesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327735; x=1771932535;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZwUkpipSK3w4UtqHK19BjXJ6/3zF0qpUaX3liVbzlk=;
        b=N/HbqLf1ppoQvnDGNry7aPqJByqgME7qwe9t+k/bDDNEGarDGEQPHTV6bzvbTT+XZg
         2l9uLHtK7xWpoD/p/V5aBQQY08DjbGZ1C4lYSdsjBu330eovn6dvEmTt2MrGVX285ZsL
         fTi6w/EI1FDyCbMOKt4j9Anjy6NEB0qmkyeA0KDFoSdN8rIVLyGS992KwB+G0E/kJ8Z+
         pxKm55jtEPtJnjWo2hRt6nAdY7raOBzGUbFTRlGgcR+/UfZtF0zXPn0ToPbVVDHgnBkP
         YrICLySN5RolJNvYB9o6MG9yX8C4J/vAeeEGN3zueh/n5a4xm5GPAbONe4SHiFfy4CgH
         Gqrg==
X-Forwarded-Encrypted: i=1; AJvYcCUoycEf2Q0kWDinrUR97+gT/AtYWjJOMgEfstl2Ts/2fAjt0ydrfJHtw/j6w5wP3K+37oMfubaJPdg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgLvIO/RGGlhffel+0yVT7ycQ9VSsI+IAZUAGfhserTgVtaROz
	3PrsJp+JfMVE6nV2T4MqJNHg0LQ3f1cu1dEOk+mvzMRiyNdwFx9XNBkW6zs4l/ODMQ==
X-Gm-Gg: AZuq6aIyrITuz0neVlLfxBaqMfHDwDq+QOn2VhK0Nataszrnfn+2bNP/iQNqOdHQPYK
	UB0zOzBl/bpgc+Lik5Zax8bUwZfjpRc6PeNCH/JF+TMiBKhTKxAXRTyzQmogHV+vceRXKQZX8d0
	BPSKK7ui7LCPMAb3765snflGlnWehqZ/ADxv/8LjogfnqcgF3+BwhnsXRaUjvcCcItN6ZVUcgQ9
	XtQmNReZ7KAd5yOjB36sWJV+Qkb+krDWK3XEdv9+eQQ0+AlbIARS7vrndftJ2iLMqsM1qUiflNe
	aFmeIOfDSxThyaYtqttb9ZT+rg5sM0LGjIAxEzzv5YEnoKJ2GKHhIiV7FgX37jakFRH39Q62dHt
	++y6qSQ2xOrIoWIXHtol8utZiAlRC7PmL6Lu01ROBEJLLb2cgHHn9B+OSDM85/NcD5U9BdgA2vW
	d/efmtUnmTNynHFksxPWjYfbndrtxWzibL8YkVFRN6luuwt3WHWUHO4xCCTPgjqWtKDWSwliLMT
	BFK7KQRVFP8B3k=
X-Received: by 2002:a05:600c:1907:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-48373a79afbmr244401975e9.35.1771327735226;
        Tue, 17 Feb 2026 03:28:55 -0800 (PST)
Message-ID: <06208b1b-9107-4ae6-acbf-c69659354da4@suse.com>
Date: Tue, 17 Feb 2026 12:28:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/16] xen/riscv: implement
 arch_vcpu_{create,destroy}()
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
 <42534cb6aabf25cf551a13ae1288045e1ac08f9e.1770999383.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <42534cb6aabf25cf551a13ae1288045e1ac08f9e.1770999383.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: 4CD2314B5A3
X-Rspamd-Action: no action

On 13.02.2026 17:28, Oleksii Kurochko wrote:
> Introduce architecture-specific functions to create and destroy VCPUs.
> Note that arch_vcpu_create() currently returns -EOPNOTSUPP, as the virtual
> timer and interrupt controller are not yet implemented.
> 
> Add calle-saved registers to struct arch_vcpu which are  used to preserve
> Xen’s own execution context when switching between vCPU stacks.
> It is going to be used in the following way (pseudocode):
>   context_switch(prev_vcpu, next_vcpu):
>     ...
> 
>     /* Switch from previous stack to the next stack. */
>     __context_switch(prev_vcpu, next_vcpu);
> 
>     ...
>     schedule_tail(prev_vcpu):
>         Save and restore vCPU's CSRs.
> The Xen-saved context allows __context_switch() to switch execution
> from the previous vCPU’s stack to the next vCPU’s stack and later resume
> execution on the original stack when switching back.
> 
> During vCPU creation, the Xen-saved context is going to be initialized
> with:
>   - SP pointing to the newly allocated vCPU stack.
>   - RA pointing to a helper that performs final vCPU setup before
>     transferring control to the guest.
> 
> As part of this change, add continue_new_vcpu(), which will be used after
> the first context_switch() of a new vCPU. Since this functionality is not
> yet implemented, continue_new_vcpu() is currently provided as a stub.
> The prev argument is going to be set by RISC-V ABI (prev will be stored in
> a0) when __context_swtich() will be introduced and called from
> context_switch().
> 
> Update the STACK_SIZE definition and introduce STACK_ORDER (to align with
> other architectures) for allocating the vCPU stack.

Yet you don't really need STACK_ORDER, as you use vzalloc() (unlike in
particular Arm, but also x86). If there's no expected other use of the
constant, I'd suggest to omit it, to avoid the false impression that
RISC-V is like (again in particular) Arm in regards to how the stack is
being allocated.

> --- /dev/null
> +++ b/xen/arch/riscv/domain.c
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/init.h>
> +#include <xen/mm.h>
> +#include <xen/sched.h>
> +#include <xen/vmap.h>
> +
> +static void continue_new_vcpu(struct vcpu *prev)
> +{
> +    BUG_ON("unimplemented\n");
> +}
> +
> +static void __init __maybe_unused build_assertions(void)
> +{
> +    /*
> +     * Enforce the requirement documented in struct cpu_info that
> +     * guest_cpu_user_regs must be the first field.
> +     */
> +    BUILD_BUG_ON(offsetof(struct cpu_info, guest_cpu_user_regs) != 0);
> +}

Nit: Generally we have this kind of function at the bottom of source files.

> +int arch_vcpu_create(struct vcpu *v)
> +{
> +    int rc = 0;
> +    void *stack = vzalloc(STACK_SIZE);
> +
> +    if ( !stack )
> +        return -ENOMEM;
> +
> +    v->arch.cpu_info = stack + STACK_SIZE - sizeof(struct cpu_info);

Perhaps better sizeof(*v->arch.cpu_info), to connect lhs and rhs?

> +    v->arch.xen_saved_context.sp = (register_t)v->arch.cpu_info;
> +    v->arch.xen_saved_context.ra = (register_t)continue_new_vcpu;
> +
> +    /* Idle VCPUs don't need the rest of this setup */
> +    if ( is_idle_vcpu(v) )
> +        return rc;

I'd suggest "return 0" here to make clear it's a success path. Then
possible uses of "rc" earlier in the function also won't affect this.

With all of the adjustments (happy to carry out while committing, as long
as you agree)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

