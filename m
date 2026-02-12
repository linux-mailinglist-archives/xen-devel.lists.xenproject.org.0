Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFaNIoawjWmz5wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 11:50:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE54512CB41
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 11:50:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228685.1534808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUGa-0001w7-9W; Thu, 12 Feb 2026 10:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228685.1534808; Thu, 12 Feb 2026 10:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUGa-0001tu-6R; Thu, 12 Feb 2026 10:49:48 +0000
Received: by outflank-mailman (input) for mailman id 1228685;
 Thu, 12 Feb 2026 10:49:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqUGY-0001to-KX
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 10:49:46 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b1f4ff4-0800-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 11:49:45 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4358fb60802so1323388f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 02:49:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4378e72c203sm4608456f8f.2.2026.02.12.02.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 02:49:44 -0800 (PST)
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
X-Inumbo-ID: 8b1f4ff4-0800-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770893385; x=1771498185; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aTCFlvMSW0aAhCcRWoGU8lmHxXHbSnVMK6eqpmXtma0=;
        b=YHNQITdzh563KBdCPqRPHJgmlMKOh1d/J8d7UvvWJk/0xDTfA3H/qg2+axwygD3KyN
         p7eAKIL/b1xmVpVUTp8zm6OIEmWkhZFrwE5KDeBy+nlJNsIWpavVTpiDtMmB21pDRDFM
         ugMA+0FRL82uX0dBdvvC3z7H3E2K7IisZQT/cYAd0mzEBDTaTwlibJjJJcIXGe6L4Wug
         cc+/JAr+/EIYZ+l7K8XtuTRlPb9PKyLqv1NSntj98z5lGHafeyX0dkkXhK4+m/pxu6TY
         lQEuCU51p0zxZCcDF8y0hibdCcB0A2OjbNxDcDPC7wJ8TxqkIQ1fB1nJdSC13od6y/KN
         k0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770893385; x=1771498185;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTCFlvMSW0aAhCcRWoGU8lmHxXHbSnVMK6eqpmXtma0=;
        b=RyXH4g2b7PldKR4eL9XiN9NPMWJHDVhvNwGQWKK6Iyl6rpR+fqYFgHDTMWJ27zm4rl
         uORLRXIj0WfzgBk4V4Rd9kQNvpIDlsCHcIHkZYKPBeh9DfPmSv5I7l6e6gu+YAjdpIs0
         onJ/ql1pwu+84iaHZUvRwgMY+uxSam0VOz+QZf8oNTWMECGta84WoInfbekNlpwMOe5/
         UYAgxtt9E4XadCHwIK+kRkQkAoG0IYfYlPCsw8IqvZa5hNaHeTsWlZ0K2ycFJO70y1l1
         MU1EqJ1orfaMWslwXwOGShsqD/kSxWoBAy47Uu4IDHQHqxzybWNpjgnJnc1TE03Zo57u
         4FwA==
X-Forwarded-Encrypted: i=1; AJvYcCWdiYpOq742+srA1kfe2SU0qL0Pl9hZkWLSBXpN1U+L5PHnkcAFCUVKVYvkprokQTtQpDCNvQV/0VQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuJweVWYN6JezDZju1wHPNLEJcUeH4VHHH27/4vhu3FiHr2xVl
	9e9SQfZc/xMM5P0aoHboEpypz30ksYJYv6n8aBH0KJp6fzmxDY2p9XwCyZO0jKL7PQ==
X-Gm-Gg: AZuq6aLqZ24vmjhTR4bFggOuHUC1+0O8bysUAI44yFqCXnVQ6r4N8TaafINfb0fAq5b
	rybF+9uE60Qp3zDX2zVGrdsWaEwJdnsi8kKQRBOIrgzK8LmV4P9eDGNjofB85tOYRtc9Qk4DF2f
	YMOgJqaquMamt15jNsNIZuXbXmnSYWFGA/KZfye7sHa+AXfXZqj1/FIewZ+2cS2Ziu+CVuBTDQx
	EndcudHD0yWbd8L//aVKT4PE41uRpKNLVB1L+KvciSOIvyhQti/4L5yPKwLOnlOwV/NGY/PpyzW
	pWMGd/XbEUUlqV1dSzBc4xcJRik1ZSPBH4YjpQKGeuCkC8BPUodzojKR4l+A8cZLCQ4kneTE7W3
	HUv6+iOnpB/m9NCyAW/JfmEYSSq3GBJ9OpoaKg7BW/lb9v9kfys9nH7P0pOaDMBRS+4h22iKlFV
	fnY2iEE3W1UzCMb95gsRayN8wkehjwimTqBsBOg8FkIrgG6HsyJ09BC8Uj5Rj0wql0quREIRZNi
	cWxsorZaNnGkOU=
X-Received: by 2002:a05:6000:2c08:b0:435:924e:3d6d with SMTP id ffacd0b85a97d-4378e72a239mr2748911f8f.26.1770893384638;
        Thu, 12 Feb 2026 02:49:44 -0800 (PST)
Message-ID: <109c3379-7066-4ad9-93aa-57e87deba81f@suse.com>
Date: Thu, 12 Feb 2026 11:49:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] x86: Migrate spec_ctrl vendor checks to
 cpu_vendor()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-6-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260206161539.209922-6-alejandro.garciavallejo@amd.com>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: EE54512CB41
X-Rspamd-Action: no action

On 06.02.2026 17:15, Alejandro Vallejo wrote:
> @@ -738,11 +738,10 @@ static bool __init retpoline_calculations(void)
>      unsigned int ucode_rev = this_cpu(cpu_sig).rev;
>      bool safe = false;
>  
> -    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
> +    if ( cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
>          return true;
>  
> -    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
> -         boot_cpu_data.family != 6 )
> +    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || boot_cpu_data.family != 6 )
>          return false;

At the example of this (applies throughout this patch): With the panic() in
patch 03 the transformation looks correct. Without that panic(), or without
being explicitly aware of it, this gives the impression of explicitly doing
an unsafe thing: Even though by way of boot_cpu_data.vendor we know what
vendor's CPU we're on, we're acting as if we didn't know. I'm really
uncertain whether such changes are worth it with the mere goal of reducing
code size. Even beyond the concern raised, this feels like it might be
increasing the risk of introducing subtle bugs.

I wonder what Andrew and Roger think in this regard.

Jan

