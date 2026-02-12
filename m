Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILX7OC+/jWlF6gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:53:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADDB12D314
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:53:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228829.1534919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqVFF-0007uM-3v; Thu, 12 Feb 2026 11:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228829.1534919; Thu, 12 Feb 2026 11:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqVFF-0007sY-0L; Thu, 12 Feb 2026 11:52:29 +0000
Received: by outflank-mailman (input) for mailman id 1228829;
 Thu, 12 Feb 2026 11:52:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqVFE-0007sS-24
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 11:52:28 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cf5b5a0-0809-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 12:52:26 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-480706554beso69248085e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 03:52:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835a5c7c4csm145257255e9.0.2026.02.12.03.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 03:52:25 -0800 (PST)
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
X-Inumbo-ID: 4cf5b5a0-0809-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770897146; x=1771501946; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I8axo7fTHnUIbKoSLf+JOuNTZoT3vuiGKJ61JVxoPqM=;
        b=dK2y8VcQxAzvkjJqr/39A+Ebr3R0s75N3iQWsZtvBJMFcYrEVRWGMHXjYhVaWA0x4u
         M8YxXvewEZPDYxpKUfL3XySapTAw2kFheJd3dczRvQ74RwRYR+rKmoaIq7v4RYaEpgKG
         lMxztUyc1iAJ1UNlNDEPn4YTvLCH8OAjbCOudvOn7Y6QJRAm8ilo5djtIM1zadbC+hbi
         0SvPj9juik+z7f9q8Q6qkE9wyTX8PxW12J3sJQ3vGiL3zBGmq8U8TS1RJbD9EbskN0Dj
         XlIDlTDgyD2Ma4fAESkZRvlN7X0Xpt2rZ2ahtpF20oB3X+wR+YX5sjNGMdWSD+if5WZq
         WmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770897146; x=1771501946;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8axo7fTHnUIbKoSLf+JOuNTZoT3vuiGKJ61JVxoPqM=;
        b=HRNewdMjSDHKNdl+TkiXjyhY10DQ77SEENcPpyQKcqHA9Pnql++sOd6sQGqkO3gbbC
         NWvz0rTj7SBvrbxiEcIoufMZhGiUIGbRyl907/UZ+vBNw5eXnacUEKZfqL1OckQ3K+1l
         9TBOpkCFTGzBHI7HOEdhj0scnigGJsg39pTg0Frpc1hLFWNwkowV7pDs0K6xNGq4Tp/u
         WLwiRy9w2dlXQ25vkX0NjBZXo718iivvcU22nql0nHJ2wO6L/DrycfiXT3tdMoXCjugn
         6aKZQqz9ujHOwvqRCwLv4SBp7MRHYe72Pj2Rvw/tpchs+GzxSupyYrAp35ROsDx4Tqdk
         H4Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVYu48CSGXR6O0sIvY8/YahmctYA1l3C2Ys25F/rQIa/+diseahvWa6jdgD3Ilundje1SKJwhPnRAQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywkst46aVM+2bwEl7MwwgmD0Lht2itB9c2lge/oACSIs1BcKtC3
	lXj6Ipve2qUcX68EH4Ir8v79LF4b+pf2RolKfKSlqMIeO8OTcUEsI/K1RhShrIDkDQ==
X-Gm-Gg: AZuq6aIbG4y8LAHnFm/MuwSjdUkhLRsagOa81WsAyX+CuWnB/l2qSyszwToQCLmPOPb
	2ybl3L4meLb+dZJkI183vxo0XThyH5Sfy6ryWytgbFXnvBC3lXAW1WFJ0ZpNoKtAoY0dadCpDbn
	8JWFn8pVs7iQK59ybRo7sCIa3VN/26LssJ8lapWYOg5sJUCv9rSrX1DWicB1YnJLpmwCWXO962L
	GJM3LWJPFbyKZ3jlVXfRLAQftQnhikk7LUdpv+kG9E/bih0zx0usj3tpa9GDuehZd0bg3jSJgG4
	mgkepo+U+4YZvwDbG0kNwes6uqUfE+8mcHZ0NXBHen76gCwHSza36QidMVenvXH7LkF2PIReKds
	PZF+0oisK/RcWi+j7cm/U50akQ4qDyiho7phyWSmiX8w/ZdnQ4Q7e+LzEyTYtOGlUijFddzFiKQ
	4Kp31MuleHlEz9RmxBBlvNFLZK2GBJyuVZek6SpyxB1vOkob8FT0QeG+yEhPjn05qx0i1hlniW1
	l2xSYBj197wj98=
X-Received: by 2002:a05:600c:6095:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-4836570e7ddmr35302695e9.21.1770897145878;
        Thu, 12 Feb 2026 03:52:25 -0800 (PST)
Message-ID: <3504e0eb-973c-427f-98ac-27801819e175@suse.com>
Date: Thu, 12 Feb 2026 12:52:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] x86/acpi: Migrate vendor checks to cpu_vendor()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-10-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260206161539.209922-10-alejandro.garciavallejo@amd.com>
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
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 4ADDB12D314
X-Rspamd-Action: no action

On 06.02.2026 17:15, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -178,7 +178,7 @@ static void cf_check do_get_hw_residencies(void *arg)
>      struct cpuinfo_x86 *c = &current_cpu_data;
>      struct hw_residencies *hw_res = arg;
>  
> -    if ( c->x86_vendor != X86_VENDOR_INTEL || c->x86 != 6 )
> +    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || c->x86 != 6 )
>          return;
>  
>      switch ( c->x86_model )
> @@ -915,8 +915,7 @@ void cf_check acpi_dead_idle(void)
>              mwait(cx->address, 0);
>          }
>      }
> -    else if ( (current_cpu_data.x86_vendor &
> -               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
> +    else if ( cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON) &&

While we certainly make that assumption, shouldn't you add explicit checks
that APs' vendors match the BSP's, in order to be able to also replace
current_cpu_data uses? Or do we have such a check, and I'm merely overlooking
it?

Jan

