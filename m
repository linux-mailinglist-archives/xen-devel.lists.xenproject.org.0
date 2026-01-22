Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO/vMUpJcmkJiQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 16:59:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39587695CB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 16:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211277.1522796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vix5C-0006Aw-MN; Thu, 22 Jan 2026 15:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211277.1522796; Thu, 22 Jan 2026 15:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vix5C-00067o-JY; Thu, 22 Jan 2026 15:58:54 +0000
Received: by outflank-mailman (input) for mailman id 1211277;
 Thu, 22 Jan 2026 15:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vix5B-00067i-9G
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 15:58:53 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ee9b0f8-f7ab-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 16:58:51 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso12499185e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 07:58:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804703b59esm77178195e9.4.2026.01.22.07.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 07:58:50 -0800 (PST)
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
X-Inumbo-ID: 3ee9b0f8-f7ab-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769097531; x=1769702331; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8K/rAlcKVeT/EVpgXAT2xI8jG/2oag+MCKdQk5/VHMw=;
        b=Efym1oPrsXPWpnT1ih92WXnTVI722vCig4WDmQF17xssY/PRygZFwmio+jSQWo9DId
         kqJ0Hf5Q6kUSRWuJghA4L7eglgbssJp4IOIlWwAiuvokj+aLdA/8BJZqXkb/+ERGIS6E
         3EXxXHKpgIkBt2FSJ3JodU5LqDIh7p4u4jWfOfQpzrM2nSjRAqr1B8UAU+EbJUG9V/0H
         NkYT2x5W6MWKJU0a+c5WKTxoZh1PcODjfowzaPmok/aPuZp/p9XqV6KV9y++x6+F3RBx
         EZWv3iUHocdhILV90r8iCXwwq+sCkuznSEuJ4LOlkP3Mdmdn1UFtjwj0gs11XpwyF4Ka
         6/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097531; x=1769702331;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8K/rAlcKVeT/EVpgXAT2xI8jG/2oag+MCKdQk5/VHMw=;
        b=ZVHtrAvLqfm21G/z5Wj5661GJ/NAR04Sp3WPmW4vgprsdbPyI1cOhCOrj7MgYMcCJY
         Tcuw81HuJU3TEVhQ2qlXODj8yS9NNXe0zDOGXsuOvD0SduOfa6nzKbzzbNubI5hA+55B
         weHmrz7j2C/vfvCE+0YD8pQjX30Z5pd7iMUYlj4BQAD43m0Kd/qjRMyBeUISgeguTlQ9
         b+ieq7TVK6bsIaseXxqz8zWdVpCHDm4sW1kMaQnZuMMZgIERO8nj5AuXt/zMh6S1KcJF
         /b3W5eNwOtR/vD1GjwVPou4p3nFlpOsIw+OQeOcHsDukpu+Oojp2YBdVdlLa2SL8lpE0
         t9cg==
X-Forwarded-Encrypted: i=1; AJvYcCXuZ4KVQmIrLFKtTsp6Efrr0PvxO9EeuhZW78yktvQLQOfRas5CSYSETIX94mEUsbvZtISI3i8z1/g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdFKL1zjWtuHDgYymKKBeyqc3InKmU2hY0RdLw33NdZzoqxXnE
	464AEHhUX0dg95Z6ditvI5PewtTyXeojUw8yhaLbe3ByHMCdYDyBCiD7oq8ORk8/Yw==
X-Gm-Gg: AZuq6aKl8TBwA8e+SAm72SotO2HbtKiuQcU2yTZvjVFfk2u5oDtIhUgswjQNlmi+DmQ
	U2d8rJHGm4LIglO0Ec6Cn9QEKwUNSXnPwqmvoo4keM7zqN2zdy+F5kDT5RVEvnotpxfWSbk7vV2
	bdokjrvrz1XOULAjO9HHfqGNh+v+nre+6aZlkYarogt/dZF/MEa53TIzVOEjPlJJowSipVbqTln
	9kRwYKC3Kaoje87UDHuLsdKuqnsvHSSMegpDY2/5EH3OqU2sPDO7simAzZBtOjN0gH3zxVpeyor
	r7C30LzsNY6ymGKkQss1eazK+jZL3f/b63QgZbQ7ctBrOLO/F+TKtxrC6PutKVKtwBQNyJi16Aa
	9buIXOjcmyUklGRKyPJQJrATn2Y+EF/1ens2wL3Cv97F+nOApq0kaHvktxjiLjiLfTaZxJC1KYK
	+mFBlVzBWCajAoGJxWSxrQiNbSP2h4CioE1zHzRyTLGrmGDdoUL+YbS9pyH6R7Ui+WgXAxJ9/Nr
	1o=
X-Received: by 2002:a05:600c:528e:b0:47e:e78a:c833 with SMTP id 5b1f17b1804b1-4804c9cf320mr1190195e9.32.1769097531087;
        Thu, 22 Jan 2026 07:58:51 -0800 (PST)
Message-ID: <ee91de9d-f62f-49fb-9cb7-8b0689ad11c3@suse.com>
Date: Thu, 22 Jan 2026 16:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/22] x86/cpu: report SMX, TXT and SKINIT capabilities
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <6fb0f217027fc323d3c23e94bb99bc56e06f9763.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <6fb0f217027fc323d3c23e94bb99bc56e06f9763.1748611041.git.sergii.dmytruk@3mdeb.com>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sergii.dmytruk@3mdeb.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:ross.philipson@oracle.com,m:trenchboot-devel@googlegroups.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 39587695CB
X-Rspamd-Action: no action

On 30.05.2025 15:18, Sergii Dmytruk wrote:
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -688,6 +688,21 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
>  #undef FREQ
>  }
>  
> +void amd_log_skinit(const struct cpuinfo_x86 *c)
> +{
> +    /*
> +     * Run only on BSP and not during resume to report the capability only once.
> +     */
> +    if ( system_state != SYS_STATE_resume && smp_processor_id() )
> +        return;

Comment and code look to not fit together. DYM

    if ( system_state == SYS_STATE_resume || smp_processor_id() )
        return;

?

> @@ -633,6 +634,49 @@ static void init_intel_perf(struct cpuinfo_x86 *c)
>      }
>  }
>  
> +/*
> + * Print out the SMX and TXT capabilties, so that dom0 can determine if the
> + * system is DRTM-capable.
> + */
> +static void intel_log_smx_txt(void)
> +{
> +    unsigned long cr4_val, getsec_caps;
> +
> +    /*
> +     * Run only on BSP and not during resume to report the capability only once.
> +     */
> +    if ( system_state != SYS_STATE_resume && smp_processor_id() )
> +        return;

Same here?

> +    printk("CPU: SMX capability ");
> +    if ( !test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) )
> +    {
> +        printk("not supported\n");
> +        return;
> +    }
> +    printk("supported\n");
> +
> +    /* Can't run GETSEC without VMX and SMX */
> +    if ( !test_bit(X86_FEATURE_VMX, &boot_cpu_data.x86_capability) )
> +        return;
> +
> +    cr4_val = read_cr4();
> +    if ( !(cr4_val & X86_CR4_SMXE) )
> +        write_cr4(cr4_val | X86_CR4_SMXE);
> +
> +    asm volatile ("getsec\n"
> +        : "=a" (getsec_caps)
> +        : "a" (GETSEC_CAPABILITIES), "b" (0) :);
> +
> +    if ( getsec_caps & GETSEC_CAP_TXT_CHIPSET )
> +        printk("Chipset supports TXT\n");
> +    else
> +        printk("Chipset does not support TXT\n");
> +
> +    if ( !(cr4_val & X86_CR4_SMXE) )
> +        write_cr4(cr4_val & ~X86_CR4_SMXE);

Move this ahead of the printk()s?

Jan

