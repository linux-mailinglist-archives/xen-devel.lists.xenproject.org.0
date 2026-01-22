Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG8KKhBIcmnpfAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 16:53:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EAF6946C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 16:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211254.1522774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viwzC-0004ky-QQ; Thu, 22 Jan 2026 15:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211254.1522774; Thu, 22 Jan 2026 15:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viwzC-0004iY-NU; Thu, 22 Jan 2026 15:52:42 +0000
Received: by outflank-mailman (input) for mailman id 1211254;
 Thu, 22 Jan 2026 15:52:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viwzB-0004iS-E0
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 15:52:41 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 612cf647-f7aa-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 16:52:39 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48049955f7fso8007575e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 07:52:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48048b49880sm62345445e9.11.2026.01.22.07.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 07:52:38 -0800 (PST)
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
X-Inumbo-ID: 612cf647-f7aa-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769097159; x=1769701959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nZIawYq0A2BmElPcAHp1yYp0QcDuY8+KPx7RCo74AlU=;
        b=GRrzPPnL33fszIZPUqpBSuLIaStCzcN8ePKva0Sbp6eG9Ld3N8cdltG3KcRoSWP8om
         b7RcQ4WD/yxNN2/HQGjmQWAsEeYKLCdTXpBp2ZvC5GhIU0UaY8BLCwNed6ZHv2QkSeyH
         yeVhry0D/dmKno3ddZe8RmEJ+6wJKOBsi7jZEDDGpgkA9f6GtpmuYnJYGI3IYiFJX3GE
         chciJuFUOX75+WLoUlLHhrqBuVSMzDN/WjA9846nTzB5Bj/rlBO5A2S1oBd9Ba24wpqf
         1A8WlQaAFtfWyT9dOJpRAEurx/W/8ASZ7JIH/y8XbfSyWsOghpj34TziHqijHgZXdQIf
         C9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097159; x=1769701959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZIawYq0A2BmElPcAHp1yYp0QcDuY8+KPx7RCo74AlU=;
        b=ebt5miR99OCZ5ydC2ZkOJygivLNaFicNWaPkUfL4bwAzXRRFQW2UcdnmTZBTKwups2
         kfxHU4HO8FoIDVZvm9YSR4ssMf8s3jQtQpp8d1O3argNhlO+PqWD7yjxpoCrbA3HSS02
         GHyAg51ABCX41CAXk5lqNjIAih9lt0IvKbnEMwNOYlRUpg1BQzVr12Ys6p/MY1dcPcyo
         Qt07IjYjb1bZVg3bYugNpqsMwJpwBbHg/o0ImJdbg/lPHFq6KfW3aLcWCmNt6Sh5jVBQ
         hUnhwRk+pnSe1rtAklz06CdY7dbx4VIJOPVal9jSCH7Dz0WSSyLVgYFAyQjiVd6qLbKb
         Xp8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWANIur0FfzTwmR1/YCcMA018r9vWn94oduz8Xn1WxcEKUunLGC/T7DkY9yz0isVGh4RAr3A/YVFB0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDiNAFueYpNWcs9Xbo13VUSV/7IARL8SkBOaRwgHpl/2G6bBpV
	lKTGh5GlmbFoPSBgK1EaDaTcj0uYMJW863jzrvMhJpZGeMExQmy0yGjhVqY4Lt7RcA==
X-Gm-Gg: AZuq6aLaeyH++boGqFfdRmYSxtZOySpXrgO4vqhcp+oof8/k77wiHWM0aJkWqRVibVt
	n+NMVyZMFxG1GNf2pbz1Mt4XFqS5ii3dqWLUFpKQoJyLbkevitp1DeV4dS9uiamXxDXSxuq3qVH
	TQ4A7HhtJbih72q2chTNBy0mFfi0F1UDcnard2zZbP9OjJ98tCiIhhcz7oTZD3rOS8slA3b7izM
	a+Bdhf0pNgEnBBhrxXnWcSkoA7Non3N+VRhkXs7KgL6+PcVi93qGtwlfzW9BnQoD/4t2fsqO+/S
	htl8iTE6rqSI5wwBGm1ZUJc/1404tzh9w5S0uiR6N/ec10KFsJsJ8zWceU5zZFveVm/t2XEFC0H
	YQWoKHDB4Yz8bvfJ/ZIZFtRN1t79QfNJ/2sbFGKuDzOfdM0Uc0E1yfmSNCIJEpKlWYDupfD3gZK
	1wU6N0IRrEroT3OqRhW4Sq4lbDYWRIVCUQbiQjTsf9E6TEfM4vMn3per5QfcAxJVQRb3XKMdv71
	rI=
X-Received: by 2002:a05:600c:8b86:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-4804c96110bmr1269925e9.13.1769097159037;
        Thu, 22 Jan 2026 07:52:39 -0800 (PST)
Message-ID: <1483a375-9662-48b8-8bf2-8cc83386b068@suse.com>
Date: Thu, 22 Jan 2026 16:52:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/22] x86/boot: choose AP stack based on APIC ID
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, trenchboot-devel@googlegroups.com
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <16a5438f73a026d4db1a5340f599d4839c74fcc6.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <16a5438f73a026d4db1a5340f599d4839c74fcc6.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sergii.dmytruk@3mdeb.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:trenchboot-devel@googlegroups.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 10EAF6946C
X-Rspamd-Action: no action

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> --- a/xen/arch/x86/boot/trampoline.S
> +++ b/xen/arch/x86/boot/trampoline.S
> @@ -71,6 +71,27 @@ trampoline_protmode_entry:
>          mov     $X86_CR4_PAE,%ecx
>          mov     %ecx,%cr4
>  
> +        /*
> +         * Get APIC ID while we're in non-paged mode. Start by checking if
> +         * x2APIC is enabled.
> +         */
> +        mov     $MSR_APIC_BASE, %ecx
> +        rdmsr
> +        test    $APIC_BASE_EXTD, %eax
> +        jnz     .Lx2apic
> +
> +        /* Not x2APIC, read from MMIO */
> +        and     $APIC_BASE_ADDR_MASK, %eax
> +        mov     APIC_ID(%eax), %esp
> +        shr     $24, %esp

I have to admit that I'm rather hesitant towards seeing %esp used like this.

> --- a/xen/arch/x86/boot/x86_64.S
> +++ b/xen/arch/x86/boot/x86_64.S
> @@ -15,7 +15,33 @@ ENTRY(__high_start)
>          mov     $XEN_MINIMAL_CR4,%rcx
>          mov     %rcx,%cr4
>  
> -        mov     stack_start(%rip),%rsp
> +        test    %ebx,%ebx
> +        cmovz   stack_start(%rip), %rsp
> +        jz      .L_stack_set
> +
> +        /* APs only: get stack base from APIC ID saved in %esp. */
> +        mov     $-1, %rax

Here and below 32-bit insn would do fine. However, ...

> +        lea     x86_cpu_to_apicid(%rip), %rcx
> +1:
> +        add     $1, %rax
> +        cmp     $NR_CPUS, %eax
> +        jb      2f
> +        hlt
> +2:
> +        cmp     %esp, (%rcx, %rax, 4)
> +        jne     1b

... can't all of this be a simple REPNE SCASL?

As to the upper bound of NR_CPUS, do we really need to look this far?

> +        /* %eax is now Xen CPU index. */
> +        lea     stack_base(%rip), %rcx
> +        mov     (%rcx, %rax, 8), %rsp
> +
> +        test    %rsp,%rsp

Nit: Blank after comma please.

Jan

