Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FC5A07107
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 10:10:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867897.1279436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVoYa-0003LJ-IB; Thu, 09 Jan 2025 09:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867897.1279436; Thu, 09 Jan 2025 09:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVoYa-0003JW-FQ; Thu, 09 Jan 2025 09:10:24 +0000
Received: by outflank-mailman (input) for mailman id 867897;
 Thu, 09 Jan 2025 09:10:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVoYZ-0003JQ-Ky
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 09:10:23 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e293693-ce69-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 10:10:22 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385e3621518so354710f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 01:10:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e385026sm1234186f8f.42.2025.01.09.01.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 01:10:21 -0800 (PST)
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
X-Inumbo-ID: 8e293693-ce69-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736413822; x=1737018622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ReTD5UTlkgVXDxMMw9RuSPCkrgf4x0dJZIfb4+8JxpQ=;
        b=Qgm4HqpLU5AZ+SAer/ncVI0yCqSiaEQZ8hGT9AYndOYXGJCZ0ONI8YprVjIQm5MQAD
         5A1ING/s/HY7oqZpHE2+wki/p5lX+jJqu75r8HOqb3IXKYvr8GudC+3KV+JsXipKDA2c
         +d9Lhl4um4ns3plqtAZ85btgVCdzZdoMoQgALCCTXa5A71lNWuJj7UaeuJWQm7cJLx0E
         neEUGyowIjhbo8P3G5RgA0kpHBbpKaIqPoukV5o4m18Ie4+xHx7mxKkd4tGSc1i1rp5e
         nfGkxa+1E0GaUKr8X6VJdtnrcvoHzK2jeyG/y35GWYaIbQDzqPmPXmIhWkt7ZF/9fWaO
         oVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413822; x=1737018622;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReTD5UTlkgVXDxMMw9RuSPCkrgf4x0dJZIfb4+8JxpQ=;
        b=DutEdAuQMyTWvXfhfkksZuTA/xc+91JvEh5g1m4YQ0tRHC/40y+YsOCyKcExEfRAwk
         E2dLc7gTa+2y/mV8Ry+UM/Ff02JIMOgU6cxGtpJttTx2ksM2FRMMne2ySsofEbELp66c
         b0a7LXk5pjzPB6DuBnugb27s17pigmu7qXQzHIZWumXodp3wsc73NaPQygozF/A2AQBd
         Fcs4aW64WzaDKWDtz7E0/dhIRcluF70A4QPIFviP7sKbGeggROspzovjh6Ua1uvrUWyH
         lx1MLi6R3keRRFGiY57ZNSi4vMJ7u4CDyGFt3G9cZ8ol1A1m/Km/vl0H+8a3KBfy3Z7T
         r22A==
X-Forwarded-Encrypted: i=1; AJvYcCWtOZxK0bORmGg3iOBA9Y4Ao+OVVU2MSLKypyMwtDinJyU4atoAo4I8kvO4kgEkNgVnBRWdTWql61w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBNjE3c9xg9n/0r5k439kIzFVWuXWmkynGI8gFB5ywS+Un8aWI
	xtKwmDAzZx2WoyLfOupHWkbGjJJgCC0PKJJRNbiwiYxDd3MkOC4sNtCuRAI59g==
X-Gm-Gg: ASbGnctk+/5ORP6YYHj5aQaxretYMk9bDF4QGT/UQrH/y68JNkjjbHgZ17Z3+nczRiq
	RtWNUJOQtLCLIQNyi3PmJbrxdZbnAVuiZyR7iL5hBF8PoMVgIP1MlV+EIlOWvodJrfQ61by1wx3
	D5SRcIQBdrGynC7EgQjT03zw8Q8HvGNZd8FXdnrOmqCpX+oyIlRA5XZGRxmh6AFJHOL2rnAKAgY
	JWD9+/58fUnXaRQsVdq8C84mU6vQmL9r19GU9sjCIUh9QJhLeVtuhR3wtyUGKzVYQRivQiDLCaY
	VjOi6WobhKNJFLFgvNLGwC2HDTeezrA6wuH4JtjHhg==
X-Google-Smtp-Source: AGHT+IHyGw4RMavwxdWRx/ukFdOnAnfYQU2xYOUVEgyUWZtTnWVVX+f7ajmZDmcQhNQ59otFcKVbEw==
X-Received: by 2002:a05:6000:4026:b0:385:e328:890a with SMTP id ffacd0b85a97d-38a8735576fmr4900425f8f.49.1736413821857;
        Thu, 09 Jan 2025 01:10:21 -0800 (PST)
Message-ID: <031ce31b-0ab5-4964-96eb-642fbea67bfb@suse.com>
Date: Thu, 9 Jan 2025 10:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/18] x86/pv: introduce function to populate perdomain
 area and use it to map Xen GDT
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-5-roger.pau@citrix.com>
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
In-Reply-To: <20250108142659.99490-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2025 15:26, Roger Pau Monne wrote:
> The current code to update the Xen part of the GDT when running a PV guest
> relies on caching the direct map address of all the L1 tables used to map the
> GDT and LDT, so that entries can be modified.
> 
> Introduce a new function that populates the per-domain region, either using the
> recursive linear mappings when the target vCPU is the current one, or by
> directly modifying the L1 table of the per-domain region.
> 
> Using such function to populate per-domain addresses drops the need to keep a
> reference to per-domain L1 tables previously used to change the per-domain
> mappings.

Well, yes. You now record MFNs instead. And you do so at the expense of about
100 lines of new code. I'm afraid I'm lacking justification for this price to
be paid.

> @@ -2219,11 +2219,9 @@ void __init trap_init(void)
>      init_ler();
>  
>      /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
> -    this_cpu(gdt_l1e) =
> -        l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
> +    this_cpu(gdt_mfn) = _mfn(virt_to_mfn(boot_gdt));
>      if ( IS_ENABLED(CONFIG_PV32) )
> -        this_cpu(compat_gdt_l1e) =
> -            l1e_from_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR_RW);
> +        this_cpu(compat_gdt_mfn) = _mfn(virt_to_mfn(boot_compat_gdt));

The comment's going stale this way.

Jan

