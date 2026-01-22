Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECnPFUZTcmnpfAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:41:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A745F6A2AD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:41:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211332.1522869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixkH-0006cb-Cz; Thu, 22 Jan 2026 16:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211332.1522869; Thu, 22 Jan 2026 16:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixkH-0006aW-A4; Thu, 22 Jan 2026 16:41:21 +0000
Received: by outflank-mailman (input) for mailman id 1211332;
 Thu, 22 Jan 2026 16:41:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vixkG-0006aP-5S
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:41:20 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29ccbf42-f7b1-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 17:41:13 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47ee2715254so6691285e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:41:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804ce3274csm506665e9.0.2026.01.22.08.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 08:41:12 -0800 (PST)
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
X-Inumbo-ID: 29ccbf42-f7b1-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769100073; x=1769704873; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fXdUIoK+UHr9m/hbfvjoIUCGRpiigaqs5cY9PvbeFq8=;
        b=TMOfgNlGORiPLV7HgIfO3O1GozQ6ht9X4RoGc01e0tuBSucIPazDEvrvf6bmCI6s1H
         3B+MM8/Rj/hBVnS6QEZaIc+rXBgCVMcXgQBk2hmEiXGKD3SnPyEL2dCoklC9vIk7PVN2
         /dtxyqYMh028W7IVhU1RXddXDe/b0Y6mYzuTfW4BwYqLMlHMauvOKgJecFRAh6k1+qje
         OTN71QxvYgfcrnhlbrwnrpY3qYm4xXIVMCwtpt0kYq83wl9MaH2o9Qh2S69czsop0ZXn
         KrQF362VJ1sH3rIuVNc+tTraeAnc/NBWol7L9/WfnzX3ZXHbzGPRZJfENiWV/0mRbMh5
         g3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100073; x=1769704873;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXdUIoK+UHr9m/hbfvjoIUCGRpiigaqs5cY9PvbeFq8=;
        b=DZnLYvNV8tcGCZ3PRUGrmV2+dL9qXud2BXFK3edfPiCo7qU5NHPr1KQ/tcBh6U7xav
         LcbLQR8vysCWMzI0XlTBqfzqyQ8i63aByh3SloF5TI4IGm22bBPzYJkfxKXVOdXGIyae
         G1dTlywLKooZYEvp/NxS0Uprnzs2hTEiTA8HyKP81xNKqbdQkkmhdvE0evtqEQy3Ph2w
         hn1awwkf20hSVmSD3sk37H+KAhzVAENjaHhhmP2FtNBEoKZ4Q/kJ1t1AGk3XBnhyp8/R
         eUNBvl5m4O4i1yJrG8NBPuZgDjxVcR7Ho0/PtkTMTwqSEbOuWKdHISdcdrbbt8fmI6el
         Qxvg==
X-Forwarded-Encrypted: i=1; AJvYcCXJFDSMaNqFaRYCE92EEEr9GV0WYYROUMULggXhwDlX4rfxcuSm4JRsqaOtfVuo9vzF9MY4VUpYrRY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRC9lELUzmhLwfd67SfAyuY9tPPU6SO6TknjNoZgWh75104up2
	KQPWX05IWifurO79g9MDomFQHsb5ZeQto4Ykryy0/iBupUAXTw/kf0XtCHC/c7YQnw==
X-Gm-Gg: AZuq6aITDAYPTxG6kIXCU1MSfSAmyl5gHWlsQWIM+uVpbxytvqsjNFpdZwxxxQpSaPX
	9FyBBytj33xm8wpIaHh5G+CF803iEhkfr0XO3XM1RmTF9bA2RqH3ZspxTgSXPFRdNzBQYPWq7EB
	Fj1vaqU+moAJdQXrKtQmBL1m2teyFvgkO7Du9saVnLtbYXK9v0r8q4s+yOZaoUAtd3F+WR6ETo2
	FdRVcLQ9wvtKIMrOytDW6OS36mDmHdVPlVDh1aMWJM7sOBPmep00h4lkftyM8OrkFc9bG47aRCR
	tb00xicZkBEThRVix9z8vUv5GHxYCcXbb0Q7D4twtxRCAXdcdZfjlhs2jQ8LEFpRqrD8XrJP2Tn
	cYcR6OLMx0eEA8DOgxoXnE04Kc6hJwoaPLz9gB6wUxfSir/Ov8C85d8NC4SGAxOPAjJJ69WwbOf
	FZWCSD8QuBkkSAjkrRhwT29dva59i3IyACPzaSUSjbLQ7QOChP+LGug4IkUFSAgDRPHobqqMUle
	0g=
X-Received: by 2002:a05:600c:3e10:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-4804c947a33mr3966605e9.5.1769100072666;
        Thu, 22 Jan 2026 08:41:12 -0800 (PST)
Message-ID: <e88825f2-2055-4dae-a15f-d0b94cec51c4@suse.com>
Date: Thu, 22 Jan 2026 17:41:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/22] x86/smpboot.c: TXT AP bringup
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <bca9943d4ffb37531ec8facac09e85996bc2acb7.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <bca9943d4ffb37531ec8facac09e85996bc2acb7.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sergii.dmytruk@3mdeb.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:ross.philipson@oracle.com,m:trenchboot-devel@googlegroups.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A745F6A2AD
X-Rspamd-Action: no action

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> @@ -154,6 +164,13 @@ gdt_48:
>          .quad   0x00cf93000000ffff /* 0x0018: ring 0 data */
>          .quad   0x00009b000000ffff /* 0x0020: real-mode code @ BOOT_TRAMPOLINE */
>          .quad   0x000093000000ffff /* 0x0028: real-mode data @ BOOT_TRAMPOLINE */
> +        /*
> +         * Intel TXT requires these two in exact order. This isn't compatible
> +         * with order required by syscall, so we have duplicated entries...
> +         * If order ever changes, update selector numbers in asm/intel-txt.h.
> +         */
> +        .quad   0x00cf9b000000ffff /* 0x0030: ring 0 code, 32-bit mode */
> +        .quad   0x00cf93000000ffff /* 0x0038: ring 0 data */

Especially since the corresponding #define-s sit ...

> --- a/xen/arch/x86/include/asm/intel-txt.h
> +++ b/xen/arch/x86/include/asm/intel-txt.h
> @@ -91,6 +91,9 @@
>  
>  #define SLAUNCH_BOOTLOADER_MAGIC             0x4c534254
>  
> +#define TXT_AP_BOOT_CS                  0x0030
> +#define TXT_AP_BOOT_DS                  0x0038

... entirely elsewhere, I think at least the comments above want to mention
these names. (Even better would be to not hard-code these numbers, or to
use the numbers to establish the offsets in trampoline_gdt.)

> @@ -321,6 +323,29 @@ void asmlinkage start_secondary(void)
>      struct cpu_info *info = get_cpu_info();
>      unsigned int cpu = smp_processor_id();
>  
> +    if ( ap_boot_method == AP_BOOT_TXT ) {

Style nit (also again later): Brace on its own line please.

> +        uint64_t misc_enable;
> +        uint32_t my_apicid;
> +        struct txt_sinit_mle_data *sinit_mle =
> +              txt_sinit_mle_data_start(__va(txt_read(TXTCR_HEAP_BASE)));
> +
> +        /* TXT released us with MONITOR disabled in IA32_MISC_ENABLE. */
> +        rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> +        wrmsrl(MSR_IA32_MISC_ENABLE,
> +               misc_enable | MSR_IA32_MISC_ENABLE_MONITOR_ENABLE);
> +
> +        /* get_apic_id() reads from x2APIC if it thinks it is enabled. */
> +        x2apic_ap_setup();
> +        my_apicid = get_apic_id();

Despite the comment putting the call to x2apic_ap_setup() here looks rather
arbitrary. Also you do nothing about the other call from smp_callin(). Surely
the function better wouldn't be called twice?

> +        while ( my_apicid != x86_cpu_to_apicid[cpu] ) {
> +            asm volatile ("monitor; xor %0,%0; mwait"
> +                          :: "a"(__va(sinit_mle->rlp_wakeup_addr)), "c"(0),

You alter %0, so it can't be just an input.

> +                          "d"(0) : "memory");
> +            cpu = smp_processor_id();

What purpose does this serve?

Jan

