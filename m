Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPzmHKUfwWmTQwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:10:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3B72F0EB5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:10:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259191.1552500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dAA-000574-Bp; Mon, 23 Mar 2026 11:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259191.1552500; Mon, 23 Mar 2026 11:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dAA-00055e-8t; Mon, 23 Mar 2026 11:09:38 +0000
Received: by outflank-mailman (input) for mailman id 1259191;
 Mon, 23 Mar 2026 11:09:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w4dA8-000555-42
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 11:09:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4dA6-00Emu6-U6
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 12:09:34 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c11f6b-2eae-0a2a0a5409dd-0a2a4505aff4-24
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 12:09:34 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c11f6e-5aeb-0a2a45050019-d155dd30e5bb-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 12:09:34 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-43b3f91a7abso25401f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 04:09:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b646b0b0csm27371468f8f.15.2026.03.23.04.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2026 04:09:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1774264174; x=1774868974; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PdlyT9UcJOh3tpxG2oyEQb9yFmwXI+XnbU5QuELQG+o=;
        b=JxIGVw7AZBX6ZtXPiRzg72NvZtA+DLEQ7XgopaBJ+CjtyUB9TQB6qFpCA8rCD9x/WF
         /ITn8/iGuuevSaaVyX4hLgPKefsy8Q2lTWpmAUMC8l8+CC9UUawvbuupvM9ubg4YQ0xf
         fW/djwLQKpwQhDA1Di85XchF4dO6Ukdqm6/R5Yj3lOqxhty9WzC/Zkypp3W6lQ5hDUvA
         MWik99Am0jDDWPZ4TxFjWVlW287NNSFUSS/5Mo8B9Vyh0ZCBEPXl0GJGyp/xXSWclGNP
         J7xm4SRccFRLfEcAd5nZEqvDYI8uuOyf2qFN1h0Xw+U5TmW6hGSuZfavSdGsBbuDbdDs
         dphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774264174; x=1774868974;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdlyT9UcJOh3tpxG2oyEQb9yFmwXI+XnbU5QuELQG+o=;
        b=bgYO2lw1So0RiGAVPj6ngtqt/q/DvO0hjbkeaJJTQ4tBvoN6KPonmeuFjX4tmjfOw0
         tX/8NaJc0rBp1ivngHwDgNEq4aSc24yHibQpCHdOOybPqOigKwUZjGuYCuKfW1UgGc/v
         yKO48eDqxnlOl2mv7dhxXHSs8b745hhvMIJrlTq/1MDCAIIlYl8J0YYVtKYxFzWyRaIl
         ZnYpccjkLwsYQ4l9N6EVSQ7KUCMXuOywerJYpFVJOwFnp1bOUaCkvcd0YUa1coF6rkpi
         wlXM4LXYuFswtVro00tYA9vzZDWVXEkApw5loMLZ8lpfJvJRcEv+o/j4IDOgfvLPowLH
         F8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmLio4go2pL0J2lAM11svNl3fDckFfq3Kb2lcCRwt5Rs84e8pFz0CAjDXUTZEXeO2ofnOU4zNJz5E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwN4VxZbRjbpvkzj5vRX30f5WrU7fcZDdoY6HiveVObscrWfVRQ
	nIzTdqsQMxImmlJfo1EWtJXbG6hluK0RwNfGCMfCyLVaz/MV+Mhgr0HJmkIEv3MJnA==
X-Gm-Gg: ATEYQzyFJZcr0jpTaYPfOAkvENcljHvrNQKF0n8TTtqfWPCacHiiX7HUBGxjTVOg8Cr
	dVhHSop64lTGaF3g/Z8LIsFAaAZfOphzSCtLHZRhICGxQJhpGaTRJKzfbaGWxVOIyv+YIlcRDsu
	1UBo9nfmApepy+rnocrRz0TP1aO78YLpJ/GirB5BeLOK5mUv+gnUPMSoP6spc6gggnzvcFBBoXd
	P+WyQljwk4EzNw17pIHe8Uwq4rbq64HvnLBnMnSA00PG/Fl5TOMt2jGgrgKo6Icl48zh/FEAMGa
	aIAlTAxSHe5RkUt5mUzL2dEaB4ESXOTHLHgN/kT4CH8qWhT6ErN+AN5tWB5AZ2FQIBg+1wXE0i6
	JU0REdVzvGAI2qBnjrQhgRLqNU+h22HDazsRGHLKDo9FjUPaCO3EiIC2UIETXuWFrmThgOdScvu
	mKG+1xV2+GnFo5NtHEnsmhbhU3OTwSoEU3UG9u4gAWAyfbg0rsob/H9jmlaxUDw+F84eszbQ1Gc
	A/nDZDXFwdpdtc=
X-Received: by 2002:a05:6000:2086:b0:43b:48e3:fbee with SMTP id ffacd0b85a97d-43b64286faemr20828148f8f.37.1774264173894;
        Mon, 23 Mar 2026 04:09:33 -0700 (PDT)
Message-ID: <be38f4ce-48f8-459c-9bfc-caa60794a652@suse.com>
Date: Mon, 23 Mar 2026 12:09:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm/sysctl: Implement cpu hotplug ops
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1773307749.git.mykyta_poturai@epam.com>
 <206261ba0b60ebcff25e083c22d9e9b885645199.1773307749.git.mykyta_poturai@epam.com>
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
In-Reply-To: <206261ba0b60ebcff25e083c22d9e9b885645199.1773307749.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1774264174-80568488-91BF6857/0/0
X-purgate-type: clean
X-purgate-size: 7824
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[support.md:url,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AC3B72F0EB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12.03.2026 10:39, Mykyta Poturai wrote:
> --- a/xen/arch/arm/smp.c
> +++ b/xen/arch/arm/smp.c
> @@ -44,6 +44,15 @@ void smp_send_call_function_mask(const cpumask_t *mask)
>      }
>  }
>  
> +/*
> + * We currently don't support SMT on ARM so we don't need any special logic for
> + * CPU disabling
> + */
> +bool arch_cpu_can_stay_online(unsigned int cpu)
> +{
> +    return true;
> +}

Something as simple as this would be nice to be an inline function (or, less
desirably, a macro).

> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -735,6 +735,12 @@ ret_t do_platform_op(
>      {
>          int cpu = op->u.cpu_ol.cpuid;
>  
> +        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
> +        {
> +            ret = -EOPNOTSUPP;
> +            break;
> +        }
> +
>          ret = xsm_resource_plug_core(XSM_HOOK);
>          if ( ret )
>              break;
> @@ -761,6 +767,12 @@ ret_t do_platform_op(
>      {
>          int cpu = op->u.cpu_ol.cpuid;
>  
> +        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
> +        {
> +            ret = -EOPNOTSUPP;
> +            break;
> +        }
> +
>          ret = xsm_resource_unplug_core(XSM_HOOK);
>          if ( ret )
>              break;

I wonder whether on x86 this really should become an optional thing (and
if so, whether that wouldn't better be a separate change with proper
justification). See also the comment on common/Kconfig further down - by
the name of the option, and given the support status the change above may
be legitimate, but not some of the similar restrictions added elsewhere.

> --- a/xen/arch/x86/smp.c
> +++ b/xen/arch/x86/smp.c
> @@ -418,35 +418,8 @@ void cf_check call_function_interrupt(void)
>      smp_call_function_interrupt();
>  }
>  
> -long cf_check cpu_up_helper(void *data)
> +bool arch_cpu_can_stay_online(unsigned int cpu)
>  {
> -    unsigned int cpu = (unsigned long)data;
> -    int ret = cpu_up(cpu);
> -
> -    /* Have one more go on EBUSY. */
> -    if ( ret == -EBUSY )
> -        ret = cpu_up(cpu);
> -
> -    if ( !ret && !opt_smt &&
> -         cpu_data[cpu].compute_unit_id == INVALID_CUID &&
> -         cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1 )
> -    {
> -        ret = cpu_down_helper(data);
> -        if ( ret )
> -            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
> -        else
> -            ret = -EPERM;
> -    }
> -
> -    return ret;
> -}
> -
> -long cf_check cpu_down_helper(void *data)
> -{
> -    int cpu = (unsigned long)data;
> -    int ret = cpu_down(cpu);
> -    /* Have one more go on EBUSY. */
> -    if ( ret == -EBUSY )
> -        ret = cpu_down(cpu);
> -    return ret;
> +    return opt_smt || cpu_data[cpu].compute_unit_id != INVALID_CUID ||
> +           cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) <= 1;
>  }

Unlike for Arm, this may indeed better be an out-of-line function.

> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -49,6 +49,7 @@ static void cf_check l3_cache_get(void *arg)
>  
>  static long cf_check smt_up_down_helper(void *data)
>  {
> +    #ifdef CONFIG_CPU_HOTPLUG
>      bool up = (bool)data;
>      unsigned int cpu, sibling_mask = boot_cpu_data.x86_num_siblings - 1;
>      int ret = 0;
> @@ -89,6 +90,8 @@ static long cf_check smt_up_down_helper(void *data)
>                 up ? "enabled" : "disabled", CPUMASK_PR(&cpu_online_map));
>  
>      return ret;
> +    #endif /* CONFIG_CPU_HOTPLUG */
> +    return 0;
>  }

The #-es or pre-processor directives want to be in the very first column.

Sharing "return ret" would also be nice, imo. Would require ret's decl to
move ahead of the #ifdef. Actually - is there anything preventing

    if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
        return 0;

at the top of the function? Perhaps even with ASSERT_UNREACHABLE() added
in?

> @@ -115,24 +118,24 @@ long arch_do_sysctl(
>  
>      case XEN_SYSCTL_cpu_hotplug:
>      {
> -        unsigned int cpu = sysctl->u.cpu_hotplug.cpu;
>          unsigned int op  = sysctl->u.cpu_hotplug.op;
>          bool plug;
>          long (*fn)(void *data);
>          void *hcpu;
>  
> -        switch ( op )
> +        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
>          {
> -        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
> -            plug = true;
> -            fn = cpu_up_helper;
> -            hcpu = _p(cpu);
> +            ret = -EOPNOTSUPP;
>              break;

ASSERT_UNREACHABLE() looks to also be valid to be added here, seeing how
do_sysctl() now works.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -637,6 +637,12 @@ config SYSTEM_SUSPEND
>  
>  	  If unsure, say N.
>  
> +config CPU_HOTPLUG
> +	bool "Enable CPU hotplug"

I'm not happy with this prompt. For x86 SUPPORT.md declares (ACPI) CPU
hotplug as experimental. That's physical hotplug. The code you're
fiddling with, however, is also used for soft-{off,on}lining. Which,
e.g. to disable SMT on x86, may need to be used for security purposes.

> +	depends on (X86 || ARM_64) && !FFA && !TEE && !HAS_ITS

What if on x86 FFA, TEE, or ITS gain a meaning?

> +	default y
> +
> +

Nit: No double blank lines please.

> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -483,6 +483,52 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>              copyback = 1;
>          break;
>  
> +    case XEN_SYSCTL_cpu_hotplug:
> +    {
> +        unsigned int cpu = op->u.cpu_hotplug.cpu;

I don't think this variable is very useful to keep. Instead use ...

> +        unsigned int hp_op = op->u.cpu_hotplug.op;
> +        bool plug;
> +        long (*fn)(void *data);
> +        void *hcpu;

        void *hcpu = _p(op->u.cpu_hotplug.op);

right here, dropping the assignments further down.

> +        ret = -EOPNOTSUPP;
> +        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
> +            break;
> +
> +        switch ( hp_op )
> +        {
> +        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
> +            plug = true;
> +            fn = cpu_up_helper;
> +            hcpu = _p(cpu);
> +            break;
> +
> +        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
> +            plug = false;
> +            fn = cpu_down_helper;
> +            hcpu = _p(cpu);
> +            break;
> +
> +        default:
> +            fn = NULL;
> +            break;
> +        }
> +
> +        if ( fn )
> +        {
> +            ret = plug ? xsm_resource_plug_core(XSM_HOOK)
> +                       : xsm_resource_unplug_core(XSM_HOOK);
> +
> +            if ( !ret )
> +                ret = continue_hypercall_on_cpu(0, fn, hcpu);
> +
> +            break;
> +        }
> +
> +        /* Use the arch handler for cases not handled here */
> +        fallthrough;
> +    }
> +
>      default:
>          ret = arch_do_sysctl(op, u_sysctl);
>          copyback = 0;

This form of falling through may be a little risky, towards someone not
looking closely enough and inserting another case label immediately ahead
of the default one. While I don't think there's a really good solution to
this, please consider

    }
        /* Use the arch handler for cases not handled above */
        fallthrough;
    default:

instead.

> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -835,7 +835,7 @@ static int cf_check flask_sysctl(int cmd)
>      case XEN_SYSCTL_getdomaininfolist:
>      case XEN_SYSCTL_page_offline_op:
>      case XEN_SYSCTL_scheduler_op:
> -#ifdef CONFIG_X86
> +#ifdef CONFIG_CPU_HOTPLUG
>      case XEN_SYSCTL_cpu_hotplug:
>  #endif
>          return 0;

Is there a reason the #ifdef can't simply be dropped?

Jan

