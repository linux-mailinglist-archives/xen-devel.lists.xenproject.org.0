Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D54B3DE6F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 11:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104270.1455362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut0ph-00005G-HE; Mon, 01 Sep 2025 09:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104270.1455362; Mon, 01 Sep 2025 09:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut0ph-0008Vf-Dj; Mon, 01 Sep 2025 09:28:13 +0000
Received: by outflank-mailman (input) for mailman id 1104270;
 Mon, 01 Sep 2025 09:28:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut0pf-0008VV-M7
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 09:28:11 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa153280-8715-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 11:28:10 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b042eb09948so113555366b.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 02:28:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b040f1cf4b9sm421247666b.29.2025.09.01.02.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 02:28:09 -0700 (PDT)
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
X-Inumbo-ID: fa153280-8715-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756718890; x=1757323690; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+OjBGQlc7KunvXiwW1dw+QKH2gYgV2aEjow/wpDnEig=;
        b=MVtek3W00XLpx7Ey/IrcJLmAlz3mYTVjEM0uT5hW6N+bdPo8dOvh8wqRUJWvE3LFZM
         eVXqlc/Y1ymbDV6H3cVHVdCGqnAppE3J3Zh0D1gzg4Kx9uU7n7C/gb3NbJA9742sGlbU
         erWT664P13nJ6lYORZLTTTwT6cVoPWC65hjMNMBYsPBX2JPJi+oO/Wg9LUJoSCAMTR3g
         GSPJjhDsJAfrt596nijiq+sJbquoPo7rsn+4IZHzQ2IOHOug3H+NrPUknSCHAr19HHc6
         QsJyRR0vFWTk66lVJzapS0mzCwRjNcA/ov3R33chFEJGn8LNt5maXtHpmg6t5dZ1mmco
         Gp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756718890; x=1757323690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OjBGQlc7KunvXiwW1dw+QKH2gYgV2aEjow/wpDnEig=;
        b=JFmGYwk0AIAKPsB+DufN2O1v+GMFYPL537COf2fYL/lCIJo76xnvJCgkJ1Z5iB8zLo
         o11X5Pg6ZFouke0PDsfCoq25ASnq6yabPzXLxTsQwyEZwG+9R/Rpr3zZb/EuRAS1N3UC
         TqX1MytmyQDvDNPoQcO3PsRnJuuJ7K4BmQvvbzcICc7LC47TFIyV4obV82qod+NH7ywU
         Fr2Tof9oSLjL7pkhuFcE+AH0F6R8qzDlcJ4k/3BDB5zws9u62ZRWjdq3mMw8oRFQxvQm
         D4ER/FHq9bti5nrFZFZ3Dq8MVks/jphj4qKHBlmeOqh5Sg9jCDhhWBm6ImWE+zmkMI+x
         vr4w==
X-Forwarded-Encrypted: i=1; AJvYcCWMLRy4fVTrrEwE3p4QxQ9PswQ1mBTaCZj0Iq43xz1KphF6hQyy0jMh3zrkmJFx6JBNaywvy7CCLdA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpQzQoYTemyUlRa/PioYcqfz4nmZluuifn1wW8rixPxgsgVluW
	Jo4Lz1ajG3aM0SBgabEO3kOxYPbJd7UoSWiIiR3peYh99D3Jd6/8ON4n8OLNM6QWlA==
X-Gm-Gg: ASbGncsFU4+kQuuuSlm0nYzIJd5trU4NgMI+tbsBBgZ5iYPoSkadn8NzdX9cvdUfHJx
	hxPh9eQ0hmgeQLfVe6m1+ck/W2doA480zUZ3/HQamjt+hp/VY3Wj5EcqRWZJEL6rDDB+nk6n8HR
	jyoHf12fqTHKl8vZySZWzcPsXfnSsEXUXr/Z7O/BESCxot1qVFw4lYkorYx/s+t2JUc9p98ebC2
	KxRvckj5c4x/5XC7qFzK5XPK52HdDkrC1HI76ARqXbSg2+Fpu7zSB6a4CHJIJ5y6rCh/cZSI+4A
	g+Gb9doazY0//Fd8QYOaMnCiHKA/fsVRovrg7OS9Qboci99jEpareBGiSRmuokj7lrhK+vSIrPn
	TyLR8iseHTI6m79Ab9yubEHvRolJFEnTa+plfAn+ytTfRRxouFAQk0iWI5mIkZEVdBziWzrFL9D
	uB0kvIf1I=
X-Google-Smtp-Source: AGHT+IHiQ/0Lm+im6vjpmQ9jvZnfAn6DrtVUTVGU4Mr+trbWHg/8R4sAx/dhKeJSvsfWmZnDCd2veA==
X-Received: by 2002:a17:907:9724:b0:b04:2727:1658 with SMTP id a640c23a62f3a-b0427273a1dmr363276766b.58.1756718890350;
        Mon, 01 Sep 2025 02:28:10 -0700 (PDT)
Message-ID: <9322056d-9f09-4f5b-801b-6f0fdad5ead9@suse.com>
Date: Mon, 1 Sep 2025 11:28:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/23] x86/boot: Use RSTORSSP to establish SSP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:03, Andrew Cooper wrote:
> @@ -908,7 +909,29 @@ static void __init noreturn reinit_bsp_stack(void)
>      if ( cpu_has_xen_shstk )
>      {
>          wrmsrl(MSR_S_CET, xen_msr_s_cet_value());
> -        asm volatile ("setssbsy" ::: "memory");
> +
> +        /*
> +         * IDT and FRED differ by a Supervisor Token on the shadow stack, and
> +         * therefore by the value in MSR_PL0_SSP.

Beside not being overly relevant here afaict, is this last part of the sentence
actually correct? Patch 06 doesn't write different values into the MSR.

Jan

