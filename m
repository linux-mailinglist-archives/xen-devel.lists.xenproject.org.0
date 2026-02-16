Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPUxJWZCk2kA3AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:14:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23741145FB9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:14:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234362.1537651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1Es-0001js-8j; Mon, 16 Feb 2026 16:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234362.1537651; Mon, 16 Feb 2026 16:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1Es-0001hk-4e; Mon, 16 Feb 2026 16:14:22 +0000
Received: by outflank-mailman (input) for mailman id 1234362;
 Mon, 16 Feb 2026 16:14:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vs1Ep-0001Xs-T1
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 16:14:19 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 896e6271-0b52-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 17:14:14 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso3622809f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 08:14:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6ba57sm22699464f8f.15.2026.02.16.08.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 08:14:13 -0800 (PST)
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
X-Inumbo-ID: 896e6271-0b52-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771258454; x=1771863254; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=coHgrgY5IkPSqFC6CH6pZyqKY701uCf0QQjaz8AjGTQ=;
        b=aCIvMunfpNwA9gr1aDKQffDyKliWMf1anKxHfy2fXRE4ZJ6aAdXJDhLsa3SJ4ZS/B5
         Wjwd7voyfWZCdzuZINRsNtvaqAVVP1ANAM+y6aMIY2miPETb94aGKiKbGJQD3RfPeYRg
         b6pwFRDS1001BvRNcEmDyfYWuV0AeAg2ySDXv1ANNGtw/shyr2W0xfavdcp8ajoCylQl
         dLQO3TA1+iU9PaZ6Jiw6B2bOHlIgyBU/nTxkNs+q//ts/Ah5wTHEP0Kou1TR3Vg5hdmx
         CJuFONzIqlH5mYbbBGrEKxwdJEPbbPd/xQIpAsQUds2GW2idznwFQLPjt+FHnymoSY0W
         C4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771258454; x=1771863254;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coHgrgY5IkPSqFC6CH6pZyqKY701uCf0QQjaz8AjGTQ=;
        b=AU243lNLY/IR28ubua+M4K8cCkDz3aDVEg+whlOsZ9gF/1iOtJgbklbBq5kM1RvqIC
         OzdE3tBz4LV0lChlFm9yM7nLURIVsUPFi7mt5RfcZ69eVHlP9OfL2Z+U0zZ4XPUMwK16
         5RF9XeoTTpoZ+Tu8APPE7grgml8X7F1tdzRWaenfB0BHObR1/jOE0rjrBXR6iz7dEXuV
         NqYU24BENCZEaRP4ldjnr7gCjjs3s1PYZP7jHhvC/cSAKpxxVJhxTEVFbCoIl0RLqh/d
         ZD8q5aW11u6Ne8jRdRlLd76uizhL9imWJT+kjO6aNUQx9awKAg0mEm9lXBPYwU7kUj8d
         xjjg==
X-Forwarded-Encrypted: i=1; AJvYcCVnu3OlEkxFduNNn35vrB0+ZXs4b2xCBcGxbf7jWpSnl8HJmrrrkonrSID3zIP78yz1snu6hdPET0k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxi4Q3IjC+pD+/1rNoQq6xKg/XQT+b/LJ+nNTDs5cjz1TwKehsP
	7EsbzNhV64iqZ8poAlOH0Du94wpWsNlIbOj9bPlD03sM/EnbzYzFsf6FsZC9tAzynQ==
X-Gm-Gg: AZuq6aIo9s0Hj2BcGmCmi5yTh2+ZcKAxs8+7ttu1WOEG+dLzXWp/j2D+GHgsd+L1b6x
	nJgZLh2EHnAb7OJgeL7M7GbYF/dS8XQi5WJZ1ceyO8y0f3aACy5feGg8cX9ikO35vruzNd5OJg+
	bHZhgH9wYVNTCunUAx7XDdn0mHHLK1cr4amzngGZrm+rskXEQUzA+0kB7oEyJyu4//TzqBPGT6F
	rVZr/ceEtUYoaqRNURxq7q67ZVyZN35VhjJKBTklzQzO+syegthjHEaoC2y0uthscjTJk3pCNHY
	YUOkFE7LLJ/JK0zMAKqCsRfaCoNFtBc3+Bo2Qh81l1jFtUZ6icaUokXMuejp+jJnPDbd/b2J9m2
	yE48cYf502fHkjU3NZh4rQccM3Gm3nw5+VYSj2JO0MCD7n9TgFxjg+/mcJw/nUsj2zmaAOsmU9m
	gyLy+UKxmpxtxDKJ4xpHnSVVVWz66RM+e95g8KMl8uZ96un9pTWrfC+msIXiJ9YsxpSBHjykiyR
	vp4UwmJEjh6FEA00yXlwAAV8A==
X-Received: by 2002:a05:6000:2dc2:b0:435:9538:939b with SMTP id ffacd0b85a97d-4379d5e3c64mr16632491f8f.8.1771258454065;
        Mon, 16 Feb 2026 08:14:14 -0800 (PST)
Message-ID: <2764f432-85eb-44b9-aae9-f1bce410b4b9@suse.com>
Date: Mon, 16 Feb 2026 17:14:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/platform: Consider PTM for exposing package-related
 MSR
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tu Dinh <ngoc-tu.dinh@vates.tech>, xen-devel@lists.xenproject.org
References: <e7b1721097bd7abd975882f60b282cf7900db58d.1771254439.git.teddy.astie@vates.tech>
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
In-Reply-To: <e7b1721097bd7abd975882f60b282cf7900db58d.1771254439.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ngoc-tu.dinh@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 23741145FB9
X-Rspamd-Action: no action

On 16.02.2026 16:09, Teddy Astie wrote:
> Package-related MSR is actually gated behind "PTM" CPUID flag rather than
> "DTS" one. Make sure we check the right CPUID for package-related MSR.
> 
> Check for either DTS or PTM for MSR_TEMPERATURE_TARGET.
> 
> The only visible difference in practice would be that EPERM would now
> be reported instead of EFAULT if we tried accessing the package MSR on
> a platform that doesn't have it.
> 
> Amends: 615c9f3f820 ("x86/platform: Expose DTS sensors MSR")

Imo this really addresses a bug, so wants to be Fixes:.

> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -89,9 +89,12 @@ static bool msr_read_allowed(unsigned int msr)
>          return cpu_has_srbds_ctrl;
>  
>      case MSR_IA32_THERM_STATUS:
> +        return host_cpu_policy.basic.digital_temp_sensor;

As per the SDM this doesn't look right either - it's CPUID.01H:EDX[22]
(acpi) instead. It is the field you're after in xenpm which is tied to
CPUID.06H:EAX[0] (digital_temp_sensor).

>      case MSR_TEMPERATURE_TARGET:
> +        return host_cpu_policy.basic.digital_temp_sensor ||
> +               host_cpu_policy.basic.package_therm_management;

Where in the SDM did you find this connection? (Anything made up wants
commenting upon.)

>      case MSR_PACKAGE_THERM_STATUS:
> -        return host_cpu_policy.basic.digital_temp_sensor;
> +        return host_cpu_policy.basic.package_therm_management;
>      }

And of course with this splitting of cases, blank lines want inserting
between the case blocks.

> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -132,7 +132,7 @@ struct cpu_policy
>                          :1,
>                          :1,
>                          :1,
> -                        :1,
> +                        package_therm_management:1,

The SDM calls this PKG_THERM_MGMT; I think our naming would better match now
that we decided to have everything else here named according to the SDM.

Jan

