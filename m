Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAb2J4YDsGnOeQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 12:41:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAA724B572
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 12:41:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250031.1547433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzvT7-0008K0-4J; Tue, 10 Mar 2026 11:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250031.1547433; Tue, 10 Mar 2026 11:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzvT7-0008HT-1e; Tue, 10 Mar 2026 11:41:45 +0000
Received: by outflank-mailman (input) for mailman id 1250031;
 Tue, 10 Mar 2026 11:41:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzvT6-0008HN-FR
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 11:41:44 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bbdaf51-1c76-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 12:41:42 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439b9b190easo6310984f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 04:41:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2ba5bsm33679643f8f.22.2026.03.10.04.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 04:41:41 -0700 (PDT)
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
X-Inumbo-ID: 1bbdaf51-1c76-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773142902; x=1773747702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0r05h2blS+gYEN1+6JRpyqm3ySQPHfmFxeqRQ6IxccM=;
        b=dJWHuGX7uATfmk07gjjZyTfhGPcdQlGCN7OaoG3nl/qf1gfhvNKeGFNbfyjulv38si
         Edj9KNPHBNabGcBUiEg9J6dglGKAr+lVA5ZiyYwj/FSpOTc+S9in/cvIpQqiK3BESYOs
         3tr3/HJ67ElW8tRLqk25cfVOTooNeaHwqV2rj7OswC9O7lHRYf5Cjwm4GihibsHWuOKR
         +E5d5Gk9c7RPQc/keZMqzobn4PRNfdftjJ9GtepyVYNBOstwLxR1LSQyNZgDe4Urfimf
         pyQuwOzKgffTy4SaxkOUGPuLpKALCLK//dUbdAYtu9f1G8ITh+eMJKuYJRinNZeQx+2J
         ReIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773142902; x=1773747702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0r05h2blS+gYEN1+6JRpyqm3ySQPHfmFxeqRQ6IxccM=;
        b=YcysgiWu42EsPQI2ZkpDfAOcd4zGyUVHxF5Cg8LpZ+URTF9xdj4L+A7du4XMxgDrht
         BJqXu3sGMASbAQmwMFuS7F8TVubT1A/iJEbKfMuQzxDO/cH4E7PeX3HHui036pmx1+p+
         XqtYBCtpu4VeI9dycjtc20+a3xpoH3auYVuaVyVzhRdAbo//T8eiNWW6BMx2YdN0FJdG
         w0AATnFYg3TM8VAed+9Sjk3HiwdalMP/XMy+vJCeJOCHbTsRyujdusC0FRDGO5enWrMv
         d8QdT8Ft8OIAvF0dqC3M57utDvKwWTom1JzYvSMuQD5mbr2E7Q0RjaTuQunk42qEqUOH
         17zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKVBtSX/w6snpbvTFuTFHEHO9AKzOByE/gZ4MTLoPAckHh9pjsV05aVkUVShZrnKDuHYovNb7bF+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJ1tAnU+luJJ2qlySGBuEmATOw21dFL9MUM86jgK3K9/SGV77x
	XiNEUqJ+QeWBjUBtPZQnKdq50mU24yyHhpC2HCHyCAY3tTnvYlJwwdi8w375sD/S+A==
X-Gm-Gg: ATEYQzwQ8+8Di9YzFnS1EJx+ImVwtcxFQG0+lqRxLFZW3diNJM4dZextBFVlK722Hs4
	BCCac54bpblh1dgBP8hsQNOseZdalJweqgppdrNXEx99+aZdmmx82YdNlAIJfYUt+kLZXmLNd6p
	X7G4WYCerC5KzhRCR+Zsct7AwtBJ5SKxn28VIk1Kgpnz7T1FBOPZvFF1tQMqESpv9WqPS6Epogl
	34YtZecAyLx7U/YeM3JdmPDql70DF7rNa4goTrOHiIayQk5pogNF1R7ymjLEhQbEh8Nw1eI96jm
	5fWZ/RMrQaF2BIMZXyTFYmZEPa6jIp+QIko+0iK+Dqxw3o8eEeU2rSgUdBAFxtyh67b9fYPmHCJ
	k8y0BRmIuEqNuVSjhgCRkVWoVN7cORR2mLFqNHKpZkh/cT/ejRsuYAOxIcr/glXCrzZK2KFJKU5
	Pjm0JEOTBEGy1/XsXIU9/N/AuIHTulU9r4l7gZWrOPUcmnF/agNGdabsUoHv4l6TycNekT1/1aN
	wBQWrPaZdvScfDcMbWjETzMCQ==
X-Received: by 2002:a05:6000:400e:b0:439:b0ed:2afe with SMTP id ffacd0b85a97d-439da348192mr23599490f8f.11.1773142901645;
        Tue, 10 Mar 2026 04:41:41 -0700 (PDT)
Message-ID: <bce96393-9790-44fb-9958-0adeeafb78b9@suse.com>
Date: Tue, 10 Mar 2026 12:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/efi: Add opt-out mechanism for BGRT
 preservation
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 sarkarsoumyajyoti23@gmail.com
References: <20260306132935.13727-1-soumyajyotisarkar23@gmail.com>
 <20260306132935.13727-4-soumyajyotisarkar23@gmail.com>
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
In-Reply-To: <20260306132935.13727-4-soumyajyotisarkar23@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0CAA724B572
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[apertussolutions.com,citrix.com,invisiblethingslab.com,lists.xenproject.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:soumyajyotisarkar23@gmail.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 06.03.2026 14:29, Soumyajyotii Ssarkar wrote:
> As described in the task, BGRT preservation is now enabled by default to fix ACPI corruption
> for desktop/workstation systems (similar to ESRT).

What's "the task"?

> Add an opt-out parameter 'efi=no-bgrt' to allow disabling BGRT
> preservation on systems where the ~1MB memory overhead is not
> desired.

This looks to contradict ...

> The parameter is parsed during normal Xen boot (not during EFI
> phase), so it only affects diagnostic logging.

... this. For xen.efi you want to add code to the command line parsing
near the top of efi_start(). What to do for the MB2 boot path perhaps
the only thing there is to peek into the command line (see
arch/x86/boot/cmdline.c).

> @@ -1873,6 +1877,10 @@ static int __init cf_check parse_efi_param(const char *s)
>              else
>                  __clear_bit(EFI_RS, &efi_flags);
>          }
> +        else if ( (ss - s) == 7 && !memcmp(s, "no-bgrt", 7) )

No "no-" prefixes please; you want to use parse_boolean().

> @@ -1968,7 +1976,11 @@ void __init efi_init_memory(void)
>      if ( !efi_enabled(EFI_BOOT) )
>          return;
> 
> -    if ( bgrt_debug_info.preserved )
> +    if ( opt_bgrt_disabled )
> +    {
> +        printk(XENLOG_INFO "EFI: BGRT preservation disabled\n");
> +    }

No need for figure braces here.

Jan

