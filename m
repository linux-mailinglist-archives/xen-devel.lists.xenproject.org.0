Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4787A65312
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:23:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917006.1322005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBMv-0003GB-38; Mon, 17 Mar 2025 14:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917006.1322005; Mon, 17 Mar 2025 14:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBMu-0003Do-WD; Mon, 17 Mar 2025 14:23:05 +0000
Received: by outflank-mailman (input) for mailman id 917006;
 Mon, 17 Mar 2025 14:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuBMt-0003Di-Bj
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:23:03 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55112326-033b-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 15:23:01 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-390fdaf2897so4223826f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 07:23:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffb62ccsm106600045e9.7.2025.03.17.07.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 07:23:00 -0700 (PDT)
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
X-Inumbo-ID: 55112326-033b-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742221381; x=1742826181; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I9/Rz+weY/K0X3yiZ1gUR15q0/WiuVboyJSphJbw3Uk=;
        b=QHfgj5eK6JD1/NT2AZ/kw1UxzaNVeqMZvEs894xjvdWZ3NbRth5XmrB/Dige6toWtE
         5niQ/m3RKA0MyRyTJ5K192xhQZCYr7SfmM3T6BeRoNM+7QV4DyWICHOOu6pZmAEPMl+/
         Hz8BOPepQ2KlDkxR2R3rZKMylk3BppVZobY3ZhiW62GQlXcBG+W3kZ5KpD2+LCXwdZDF
         7Q8bf4985wtYe8BE9Q9tulDzTsyYpZwxn89iD1GEj39uQFG42iGuh4Vsgo3yQkgbN+DX
         g5uZlywiOzkpKlyqEosG7J3n9y1uGR5FlUwQpUzhIzE6YbfLjPSRnxXMwaksj2hufpic
         aTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742221381; x=1742826181;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9/Rz+weY/K0X3yiZ1gUR15q0/WiuVboyJSphJbw3Uk=;
        b=rtpAbiXOUl7n1Vl0C7KUF3T3ygmB9xKuflUcFhbuRjiTA7N/zia0qAOiT7iFIhx8f6
         R/a0PQSrI0guXclVz8X0N5LDqHqKi366S/8/9Xlsy0Hc8in6APBQksNzxj3KES1OLeOx
         bCF5aO02HTj8lYPw+B+M+XzIwfYVdo69DCM8vQkleCJjHJtLPR1VZNZjUgg7ADMyp4pl
         9+Azljd3fWkYzQ5AJMH2mMEsr2190V9vqiKvWEHj8mlhyhcMc85jxnvPEZbG+vTtq8SU
         NsZEBOIITtt2jMiZrH8yMjDeH7qbDwm/4zdB5udQroslcabHrmkp6hw/L+o21RUFrxiO
         FP7w==
X-Forwarded-Encrypted: i=1; AJvYcCXKTxuebU7jgse9xBWiYo267Z2R0YytVv6V3sWCv7ak3F6bS5OwTpuwfdGNyZOCmKax1rSQwAlCc7Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywdlk4MKMJe3Y7Abae7M9hQuQDCgZ5n18wGumhgNFLYZds3V21v
	DyMt4FIs7COXzxUHPRQLkS9gLFmNFLrie0PPUsnncOrab7FbZsixRJBJzOIR6g==
X-Gm-Gg: ASbGncs8zZ9d+Q8B2/i8/M6zWdxyHHUFs2bncTXpL8TAQAhOdAY6UO8RrnuSf6+ppn4
	BCQOVrbNamwpT6RRzgrWbHa5iyEaSe3DpJ2TDHcEa7xcqPUSaY49+ll/OUVtXzKPdu0VrKBRHva
	HzsKQTHrtyilKMl5KRlZT6YJ6GcxBexg/sKIBB8XDhlJWaYIQcrjKlFRw5bM9Sum6zOzlw1DMwL
	+9IMx1kW4dKMy4Nwi4noE/YevV88RaG7MEQ2kkLzLwJmBrEadr7ZfsOIj9be0d27pnU++qXrrvQ
	20J0lsT7C+SDZ+GAWEAHR70ohNiIAVREfqmf3vypujFCIpcqMwzTKeblB4QUngLPl82i5yFJ+DV
	yvITAGRprgD2EWdrVZghbxksiaBz77g==
X-Google-Smtp-Source: AGHT+IEKnoDCra9T0KjJovbSeWmjL48MOmYVomu85UxLY8KxVwv/SenGEUj00K9I5txpbg5RcNxWAA==
X-Received: by 2002:a5d:6d8a:0:b0:391:255a:748b with SMTP id ffacd0b85a97d-397202a1884mr16999400f8f.39.1742221380967;
        Mon, 17 Mar 2025 07:23:00 -0700 (PDT)
Message-ID: <095042a0-94c1-4f86-b6df-836a7107efa2@suse.com>
Date: Mon, 17 Mar 2025 15:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/23] xen/xsm: Add XSM_HW_PRIV
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-16-jason.andryuk@amd.com>
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
In-Reply-To: <20250306220343.203047-16-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 23:03, Jason Andryuk wrote:
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -95,7 +95,11 @@ static always_inline int xsm_default_action(
>              return 0;
>          fallthrough;
>      case XSM_PRIV:
> -        if ( is_control_domain(src) )
> +    case XSM_HW_PRIV:
> +        if ( is_control_domain(src) && action != XSM_HW_PRIV )
> +            return 0;
> +        if ( is_hardware_domain(src) &&
> +             (action == XSM_HW_PRIV || action == XSM_DM_PRIV) )
>              return 0;
>          return -EPERM;

Hmm. Isn't DM_PRIV a property applying to the control domain (besides
any stub domains), but not the hardware one?

Jan

