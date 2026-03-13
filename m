Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EI1IBiq5s2nbaAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:13:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A625527E9FD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:13:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253287.1549570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0wiH-00054b-BM; Fri, 13 Mar 2026 07:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253287.1549570; Fri, 13 Mar 2026 07:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0wiH-000526-7S; Fri, 13 Mar 2026 07:13:37 +0000
Received: by outflank-mailman (input) for mailman id 1253287;
 Fri, 13 Mar 2026 07:13:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0wiG-0004nn-4s
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:13:36 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03ff099f-1eac-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 08:12:37 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439aa2f8ebaso1168176f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 00:12:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe19abbasm13926207f8f.6.2026.03.13.00.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 00:12:36 -0700 (PDT)
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
X-Inumbo-ID: 03ff099f-1eac-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773385957; x=1773990757; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GGhBrb7u1rRYduAazJAX011huIjgs2Tgg7Xm7GSHAKM=;
        b=XfrCi9jyW/QTNdiIoR3HDZO5Agk8uYHPtZ1Uh+JY5rKnqY+r0Kfk3qvg7m73iO99m8
         Wwgk5asu+kN+SxKGeIp3HD8gV47f3aoluvTjlK66tKEJ6YmLbYDL8IYXaoZkLoukiYZv
         BquzUTZIIeGLA4rFLQfS6KjWrpm6MLd70b1EjsUq4hczRpCAI7aXkEsL1NjAFk2Sq85U
         zHRZDfstijB5IBp/SKw02Tkt5+P1g7G1mRBfoxQRdX0XMeMkGSm+FZSwrxI0jzxAldn0
         w1HBBYRWRk9vBdVtuOfoh+fTIWg16MVCnbFdhJ7EERXdM/IV5NAwsELfRdZbffaoPElv
         9+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385957; x=1773990757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGhBrb7u1rRYduAazJAX011huIjgs2Tgg7Xm7GSHAKM=;
        b=EHKmaGAbh4U2t4/sivg0B/6duYw0VAKJ7+R2h1J4dNTV2LExBs80dg1ecxiizq+qNp
         40MD5BZPPa3oxYH1lYhFHM76u1kpy8OSyONsEBbyxybdCfLEpzv/hw7Q1/N11AEMQtQu
         ZWL344qlBbtCxz+LD12+VWmw6NscuFt9gB4LfB2t7TImKu12rYHDC05fmpYZAATRQeZ/
         jd7ekRCAH/KYin4Cczz/FpDjbUkDU23qu5wa3NscN9amHRKoi8dB2OTCBsABFSnSpnaL
         +hrq5ejcPk3kcCxEv4J0+9v07Evaoao+8HS8glEbiS+gV001jklxaNw8xcK6C+1BdbgU
         9CeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEPl+RGVNyEvhF9wVpjte8xxBoxivSVlYNmYCeh2U6bdrHCUCk3m6BlhqHdP6yrbnVLEVfGet7N5s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyV1hjwfLvfjJ9t6XdZ0XJugm1oYlYSHnn44mfmAvOqi3HaosYp
	2Hr7UDiMEOYvgjA560iY2Xl5GQQsiHLrhgYVINoMkFyIlJURNB+dkcSke+Vn7twzKg==
X-Gm-Gg: ATEYQzwKsCeFjd70B5+lFstf0LcrnsfOYMDWRlROmpV9jEHhvWhqXs7fgw5XdYFqUxS
	kbzUJUSQLC0f151c0JbAx4FauPJgQjqxPun34PDvVGAzQtQLV+g+ePGADq6UAru+DGnOUakwvL7
	HOh/m227Q9rLXIXaZE9TJZpW8wZfAvTngcJoUwp3GD3NbpjrPHsLihqyupVStySuACmFhKxpurb
	d/Lobv9gxH/skg11ztCgpuJg105BL7tMF8yoFKaU7t3uSrhDqLGBlVWzpSMCOe1Mx420UiZiExX
	bT4AoYkC34dxCAnxktGmoyO43jY3UygZBPe7D1fjkzvAQdpditNts7qMII53SQ5h8EJWloG3phx
	MlQc6zzUfAuZ1j0WmSeMNwsjcvabnX0R9FX8BZcCKaTVxlzoqd73ApyVp3QZRwkfPN9sPYPlXIe
	EHtHvctnovTXL+HUtPtwVMEzEn0ZPeUXQpjv3f0/Nllg1Z7dRbQJ6wg/HhbUOalc7BGpkNGPYkE
	B+JUfHaDrWYsts=
X-Received: by 2002:a05:6000:381:b0:439:afc1:ec64 with SMTP id ffacd0b85a97d-43a04dc8ab0mr3945842f8f.53.1773385957113;
        Fri, 13 Mar 2026 00:12:37 -0700 (PDT)
Message-ID: <01bc5b3e-52c2-40b7-8639-0c42c21ded12@suse.com>
Date: Fri, 13 Mar 2026 08:12:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v v2 4/7] x86: Remove x86 prefixed names from hvm code
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
 <20260312204339.740403-5-kevin.lampis@citrix.com>
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
In-Reply-To: <20260312204339.740403-5-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A625527E9FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12.03.2026 21:43, Kevin Lampis wrote:
> struct cpuinfo_x86
>   .x86        => .family
>   .x86_vendor => .vendor
>   .x86_model  => .model
>   .x86_mask   => .stepping
> 
> No functional change.
> 
> This work is part of making Xen safe for Intel family 18/19.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


