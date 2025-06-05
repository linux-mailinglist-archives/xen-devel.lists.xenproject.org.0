Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF98ACEEE2
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 14:05:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006741.1385973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9Ld-0005S1-L6; Thu, 05 Jun 2025 12:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006741.1385973; Thu, 05 Jun 2025 12:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9Ld-0005PP-I8; Thu, 05 Jun 2025 12:05:29 +0000
Received: by outflank-mailman (input) for mailman id 1006741;
 Thu, 05 Jun 2025 12:05:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN9Lc-0005PJ-Up
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 12:05:28 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e1453f9-4205-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 14:05:27 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6020ff8d54bso1587266a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 05:05:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60613d1d2bbsm6095670a12.29.2025.06.05.05.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 05:05:26 -0700 (PDT)
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
X-Inumbo-ID: 5e1453f9-4205-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749125126; x=1749729926; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bul8HJ0oDED2VX4ejxYmDzsT6CruB+NmT5eUiFzIuAs=;
        b=dacVdM8l/qMJFn55NHGY28IpjexZIBePL0iCBLoJg8M9GaoaklUVeylNV2gTdjY3Fe
         6r9BBLjiB0vOuswQBVEKZlapkjvYG2KYdcB/Pn2ZRNsdJu+52Bkd/xz7D8JuW04Qbp9L
         FHRdGKfNa1oGxHE89a2QrGqKw3fRLeTC2P/TGBxI9nCh3bMJ2UIXPusENEYC8AyF7RaZ
         /3bEa9mhted9n7lsxoRRHJlUOJ9F2RhKHn+mXNeYDWl9epdKJ9ZRSEy33DHAIEMV9bHJ
         N+n+GiGtgaNFAvd4j6VoUWx08XYqDKGk9VINJxPq+gYyXwregRrMSvybjECmiu7VeRLt
         oEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749125126; x=1749729926;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bul8HJ0oDED2VX4ejxYmDzsT6CruB+NmT5eUiFzIuAs=;
        b=Jjj0NxLpHA686PMIDD9ZojrU28LTtHlLeaElSySBhKkB9DUhFiMi61nkTN8sC6cjAx
         YE6CQ8ux5PWflI2va+WC8av8uRf3TpTQcuD4B3IAsqEnffRH2WAXtqFB9Fv1kiANN8Fq
         GG94FbUYT7UBMfJGP/rhO/EKHpuoPms34QjuCGc/1xAHA8MSvniWYTpZIuj/oR3ydi0q
         nW6McxNygSI1GzmLZ5YcdnhrsnrxP1/0gPQsnCYpE6zUo9tGB9C1jzSup2kc8FM5Lkd5
         Iaxn13zLExgulqag/JL9vzB8zvAF5K09t9YgWL8Z77xwizRo3pB4S0yJOdAVTpZ2PhX5
         EOWg==
X-Forwarded-Encrypted: i=1; AJvYcCX2LzYJIhx2z4fuQQDE59RjZn2OJoO3NqrUWGSZylhrRb3GcTKr4XyZTi5p3W7OZ+8oQWLMV3rQVNo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQ4pj7HTTsuSpa+dMLNiEdW4wqchpMjHCFE1geSOIRNBs+t4On
	7FPDbWDd9WqP6lfZiK8FL0IvRKWVdVZQkThgCAvxiRcg6onIZ7RRB1qw23UC2WhtaQ==
X-Gm-Gg: ASbGncsCl5NPT81hZa0QqvQSUIx4aB4y5+ly5oHsVsszuaUORyFeLEXu1lNUBvlA38L
	vkKHsDfeoUMneLIE32rWvmHylHOxRBLvrF5oUTfND/2jyj/FFwBxsmJp0lpL6L0K+p5yVVMJhV5
	PdFB+SEuMw7++DnAvRZ/awKPKIRvJboztg/Ed3bQQj3hgNBRIdtoHSupSFv/kHwGpEaw1GZLqC5
	mxqkiS65Nd//pQe8HWTv80Ep7Z4gzVSUIfbH/T8ALHFk/kC/7u3VrRdsNOaj6F6lQG6l3WKjztJ
	LFkfss5R2iQCCcd4ej20OVyMHygL6jaBE6kR4Ea3/BUgY7q8bWv5/RHIxK6kb66FaiVMpXHNUxZ
	VeeuH74pbH+8h3vwwq5SwelXE6Jeq5JptW98F
X-Google-Smtp-Source: AGHT+IFQlRW2lPERjsboE5pfQyLD0sXGO34bs74s8CYSRWk5NziSFFPBH03+43clS6mUX7c7nLxSpg==
X-Received: by 2002:aa7:c70f:0:b0:604:e6fb:e2e1 with SMTP id 4fb4d7f45d1cf-606ea39c57bmr5129222a12.33.1749125126487;
        Thu, 05 Jun 2025 05:05:26 -0700 (PDT)
Message-ID: <4819eff1-2e5b-40d4-825b-025f92d73d1f@suse.com>
Date: Thu, 5 Jun 2025 14:05:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/EFI: Drop __ASSEMBLY__ ifdefary in efi.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250605111638.2869914-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 13:16, Andrew Cooper wrote:
> There's already C outside of the ifdefary, proving that it's not included in
> any assembly files.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


