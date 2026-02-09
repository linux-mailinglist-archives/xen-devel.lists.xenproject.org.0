Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMbaGSeniWk0AQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:21:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5F110D7E9
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:21:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225049.1531500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNSP-0003tC-I2; Mon, 09 Feb 2026 09:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225049.1531500; Mon, 09 Feb 2026 09:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNSP-0003rU-FI; Mon, 09 Feb 2026 09:21:25 +0000
Received: by outflank-mailman (input) for mailman id 1225049;
 Mon, 09 Feb 2026 09:21:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpNSO-0003rM-2a
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 09:21:24 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3452d4d-0598-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 10:21:22 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so624985e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 01:21:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48320736953sm260747655e9.15.2026.02.09.01.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 01:21:21 -0800 (PST)
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
X-Inumbo-ID: b3452d4d-0598-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770628882; x=1771233682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F/Y9jpBxvzXfVRY7kJLj76I5Zd+1EiTWos4eVX9KGIs=;
        b=PlmCFI4Q0lvjcOdphjCWjpofr5w7LDO9fc1LQVTk2IU3ViW58pNJrU0reXRchdSIUG
         8UE1E3x9m68z5k4QQ997tdIN+yUpiaPUKpsC3bn3Teucbc6H0lMQwWY/KHZOux8at2kL
         e+r3Z/u43+1KMznwnArPpU8MukAEAjmR+ocNyypNacza9qNeVl45CA7CyJ7b8G9K2WnT
         u/KCHS2bbpZG8N9ltKl45xmwkRLLjJpxuVaenYLE0B6b8eUXlRk+qLw5c8QN1EFmClAl
         5xShsB/P329hA1zOn6x8nVxFU69M4MVvUR6MF47uuAibTmsVKPSNZnFZDs7MpS/Ag5Mq
         mE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770628882; x=1771233682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/Y9jpBxvzXfVRY7kJLj76I5Zd+1EiTWos4eVX9KGIs=;
        b=UF9UIbHQgSz8ujEaK6g+X9tHshq7+MH0ELzJ5g4ytQESXSJX9rZlxwC0muKxwRnRWx
         HzcA5xq8Na2EO77RY5WaCpev/0lKKebn3qO5Cn9n3z6r0HorgkxWX6+5G6x3biLa1mj1
         B56POH14+4ONkXQdO2T7qNBgpffgnfIVkY2O3qomAyq3OS0r4Mvve4zRoxk/t+sG+CYP
         /VB2RprTYTubqaOAr1ShSdfF0sxLqeJwRgYuzQEim4maXY2p/QEHuo5auK2qyFrVdfCU
         TCFhlQis1j9t4z8zRRYOqZBr/gbEY88kkvJbQ+pGAJHNdKMY2od2+2/Vz2z2rMF579oQ
         LUuw==
X-Forwarded-Encrypted: i=1; AJvYcCWXPReOZjabi+1Xh2w+0iVpWA6VJO+chyPi4nsX6uixifCA5WaWRhkQc6vCdsC6FpmNhE0Z2ZgYTPg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaE1FvCn2g08j+OzRkAwtM90XlS+Oej77GHHwHMgElIAbCdXKB
	YJ+UIHsRLQgWmMpDv2GfZV0yCJnzaJTfDzt9zYpMEHD7bdsGNzl3YO54k/at12UBSh5/p7DFeg3
	YI4g=
X-Gm-Gg: AZuq6aKsnFR+2KewKPQl6+zBOmzFb1NHQu4RM4HBFg/LOdQgowxzq7jWPs2iw4z3ms8
	7w8bEd5DDbYU+wgtKzBTHObKAtMkCh65O18uN2LnMxqaECv1mdKp/u0u6847bDmYNJDkeKJ8dKc
	5LI7a0Ms6DYGo+o3u9tR4COpsHvtX0Wf3vlVqcqVAeok5ygOcoTOI/lapVs7k3FhGnIAyPE8MJf
	MP3yv+zlyqqS8YvB1RVDK1y8drLgdf6Mhxt4o3xaRKsq9lhFuniNfsg8HW2te9i487DPY3AJ9Xl
	3l7HSGDLQppXrSc1f9+6NfuGxJd+34cLza1Ea9SHRsN3CFxqryJ3iGVDQ83YrcxRxfEnrW6dVW4
	Z6ci+u0LoXQpjJG7wjxl4/UtYzwFWrnvRIcBgJiF/0ygFgOiwUi8svLRozS+nR/w/1tz4rxTJvZ
	wpT+hhLhkvYV8UfHKLmnS7bwndEUoE7f+qAvhMKQjpj+75KxAv4fbK6DwszxqjqJ+OQO4yggGpm
	jA=
X-Received: by 2002:a05:600c:3145:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-483201e7793mr127986865e9.11.1770628882019;
        Mon, 09 Feb 2026 01:21:22 -0800 (PST)
Message-ID: <608472d0-517c-4bc5-b5c1-c278c4f6620b@suse.com>
Date: Mon, 9 Feb 2026 10:21:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] const-ify vendor checks
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
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
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CD5F110D7E9
X-Rspamd-Action: no action

On 06.02.2026 17:15, Alejandro Vallejo wrote:
> Hi,
> 
> This series is a big revamp of vendor-checking to enable it to perform DCE.
> It improves all configurations useful in practice at minimal cost in the full
> build, and at a massive advantage for the single-vendor case. Many ifdefs can
> go away as a side effect of the series.
> 
> This series depends on cross-vendor removal:
>   https://lore.kernel.org/xen-devel/20260205170923.38425-1-alejandro.garciavallejo@amd.com/T/#m4c3d318f37e4f24d0f8c62b104221aa5d428cebc
> 
> Patch 1 in this series matches that of cross-vendor removal. It's logically
> required, but that's the single requirement.
> 
> High level description
> ======================
> 
> When compared to the RFC this makes a different approach The series introduces
> cpu_vendor() which maps to a constant in the single vendor case and to
> (boot_cpu_data.vendor & X86_ENABLED_VENDORS), where X86_ENABLED_VENDORS is a
> mask of the compile-time chosen vendors. This enables the compiler to detect
> dead-code at the uses and remove all unreachable branches, including in
> switches.
> 
> When compared to the x86_vendor_is() macro introduced in the RFC, this is
> simpler. It achieves MOST of what the older macro did without touching the
> switches, with a few caveats:
> 
>   1. Compiled-out vendors cause a panic, they don't fallback onto the unknown
>      vendor case. In retrospect, this is a much saner thing to do.

I'm unconvinced here. Especially our Centaur and Shanghai support is at best
rudimentary. Treating those worse when configured-out than when configured-in
feels questionable.

>   2. equalities and inequalities have been replaced by equivalent (cpu_vendor() & ...)
>      forms. This isn't stylistic preference. This form allows the compiler
>      to merge the compared-against constant with X86_ENABLED_VENDORS, yielding
>      much better codegen throughout the tree.
> 
> The effect of (2) triples the delta in the full build below.
> 
> Some differences might be attributable to the change from policy vendor checks
> to boot_cpu_data. In the case of the emulator it caused a 400 bytes increase
> due to the way it checks using LOTS of macro invocations, so I left that one
> piece using the policy vendor except for the single vendor case.

For the emulator I'd like to point out this question that I raised in the
AVX10 series:

"Since it'll be reducing code size, we may want to further convert
 host_and_vcpu_must_have() to just vcpu_must_have() where appropriate
 (should be [almost?] everywhere)."

Sadly there was no feedback an that (or really on almost all of that work) at
all so far.

Jan

