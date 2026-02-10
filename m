Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK0qAOZbi2mOUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:25:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6200C11D1B4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226660.1533172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqXo-0006uh-NI; Tue, 10 Feb 2026 16:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226660.1533172; Tue, 10 Feb 2026 16:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqXo-0006tF-Je; Tue, 10 Feb 2026 16:24:56 +0000
Received: by outflank-mailman (input) for mailman id 1226660;
 Tue, 10 Feb 2026 16:24:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpqXn-0006t2-OR
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:24:55 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07e0bbe1-069d-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 17:24:53 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-483337aa225so13995735e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 08:24:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483203e37f9sm149826185e9.3.2026.02.10.08.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 08:24:52 -0800 (PST)
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
X-Inumbo-ID: 07e0bbe1-069d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770740693; x=1771345493; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SaL0+o9g4/Tn85XvXalyK25IBZZ9P8myUXYH28ORna8=;
        b=RLOeO52x/DHADaNIGqq/VMkWEwS6UgfFOUu1Y/7/V3TOZGNvIiIHvI8pG1g75Faafc
         vDWh2uPb6DPhVzV4KC7SUcPJu30aZCbZDbgjz236czFMqx4wAnGrXHhyYy6osk9Vt385
         FXjNsQjq1EKsB1pDPU1QFmqugf/krzsFpomHCXpzGT9UhDuHkrC4OriA54iE91PVB8TF
         wxpOrHS8DYqd2mRaqlta40gv4gqqfPowBDmSITl0/2RXCmtF88TNAk7qv/pycCmQgTDp
         XxVf7FP7OPacE9E6S8izIkU7WreDCOSjX9ecpOh4uDRu8/cvOocOBic8ZJ9uO/nI+oPH
         MNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770740693; x=1771345493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaL0+o9g4/Tn85XvXalyK25IBZZ9P8myUXYH28ORna8=;
        b=u7wQGkndVJEzkKErf7l2i8GLd10SauILqMCa8jsCQN5tiJE09hF+0gsyns7kQyXdqP
         6ci1HVVvmkSayw++86E0SBD8dVmdipIJlKSowgnMZ3YxZy33RjgTzrX0AYBVo8YR7F56
         rDfjnPgbLi9DS9R99+QuZW9JH+rujuvR4BR87KoOMMEtTz7OczB57GdDBv4snaVArNXa
         MfpcEj5+yxVWxJdakZSHj0cAYkCQNlD7f8nNKXyMlg8TR8bTNOeEwO3ASSKzBSsxW4p7
         wd4AhCrvALznYxJPLAGu9D5GyAconqHkigo/nZk090+PRtu2w9I8N19MAEmWAbGujmFF
         r+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUJnMdSz6PR+PgtuPnz4vr5ADEFzUvVc5vdoRFgZ3IXbLk5kgrou7hUXG1vnvlhtZgrlOY6tnO3jzw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmtHbn/Ncbc16L/sZsUP0pbh/yRxMJ2hT87yxlCrV+uUOKm/h9
	C3BArVw2cLlK7exJNZMXmbps0mzL2+LJcqnT/tz+i2F+iZhn+gr3OwB1/ZjLnRK3lw==
X-Gm-Gg: AZuq6aIBaIgadm8M6ayfccTPUvkRwn/BJAuXvN1UlDL0349VJh6yV9Pb+Q+Qi/wxhDA
	JPQtH1GLbFrKyhrcGIN6uScVLWmoOzSPlY9J8ZWJAF4Q+/LJVCkK+MYNrG8OTF5KXUQ1edNHR6A
	J6vER6eMq7a3E4Eu5xpOMTM/Kiv2bj7lrTuEUlAPAGXskMgQMVHLzJbRzl79lWNv+lozOpQZNY0
	yuLi7/wgQxgG1ERpWeJ2RZXtNIP+XfGjDFQMGTE5ZmbjZtGxJpzxwpKjo0TdHK8sS6NzeDy8/61
	DU7fi4pi8i61LQJ/rIcapcTVbAW7HnmBSWyvbno7RDY2hWYpTnWGT1CHDOv1CrAb0KGXwhGW8yT
	Z2OPofNxY2s7EfuZPISvllS8omvwt0QJ5nuXJbDwFSamA9TT7t+cRan6zKiKfdZ7JzRmM2I1MUc
	GCA+0kUz2QmC4K9BhDZPNm3C2U0Hif9Qpjtu9JzNXtWr2S5VlXKXf9fItrB6kNDHcIfDMSpxsyl
	WZd1rzj3+H3Dwc=
X-Received: by 2002:a05:600c:4e8c:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-48320212d56mr247175255e9.24.1770740693152;
        Tue, 10 Feb 2026 08:24:53 -0800 (PST)
Message-ID: <ac77999a-397a-42c4-8f45-7facbd42b8ba@suse.com>
Date: Tue, 10 Feb 2026 17:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] xen/riscv: implement
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
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <d385b802054e0d55129da4cbba60d34b658992c2.1770650552.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d385b802054e0d55129da4cbba60d34b658992c2.1770650552.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: 6200C11D1B4
X-Rspamd-Action: no action

On 09.02.2026 17:52, Oleksii Kurochko wrote:
> Introduce architecture-specific functions to create and destroy VCPUs.
> Note that arch_vcpu_create() currently returns -EOPNOTSUPP, as the virtual
> timer and interrupt controller are not yet implemented.
> 
> Add calle-saved registers used to preserve Xen’s own execution context
> when switching between vCPU stacks.

"Add" is lacking context here: You don't add those to arch_vcpu_create(),
which is the context left from the earlier paragraph.

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
>   - SP pointing to the newly allocated vCPU stack
>   - RA pointing to a helper that performs final vCPU setup before
>     transferring control to the guest
> After the first execution of __context_switch(), RA naturally points to
> the instruction following the call site, and the remaining callee-saved
> registers contain the Xen register state at the time of the switch.

RA doesn't "naturally" point anywhere until you actually implement more
pieces. Please, again, can descriptions be written such that they make
sense at the point where the patch being described applies?

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
> +
> +int arch_vcpu_create(struct vcpu *v)
> +{
> +    int rc = 0;
> +    void *stack = vzalloc(STACK_SIZE);

Much like you use void * here, ...

> +    if ( !stack )
> +        return -ENOMEM;
> +
> +    v->arch.cpu_info = stack + STACK_SIZE - sizeof(struct cpu_info);
> +
> +    v->arch.xen_saved_context.sp = (register_t)v->arch.cpu_info;
> +    v->arch.xen_saved_context.ra = (register_t)continue_new_vcpu;
> +
> +    /* Idle VCPUs don't need the rest of this setup */
> +    if ( is_idle_vcpu(v) )
> +        return rc;
> +
> +    /*
> +     * As the vtimer and interrupt controller (IC) are not yet implemented,
> +     * return an error.
> +     *
> +     * TODO: Drop this once the vtimer and IC are implemented.
> +     */
> +    rc = -EOPNOTSUPP;
> +    goto fail;
> +
> +    return rc;
> +
> + fail:
> +    arch_vcpu_destroy(v);
> +    return rc;
> +}
> +
> +void arch_vcpu_destroy(struct vcpu *v)
> +{
> +    vfree((char *)v->arch.cpu_info + sizeof(struct cpu_info) - STACK_SIZE);

... you probably want to do so here as well. And btw, this can be shortened:

    vfree((void *)&v->arch.cpu_info[1] - STACK_SIZE);

Jan

