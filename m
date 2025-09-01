Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDB3B3E222
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 14:02:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104587.1455612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut3Ez-0000CZ-Ov; Mon, 01 Sep 2025 12:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104587.1455612; Mon, 01 Sep 2025 12:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut3Ez-00009D-MK; Mon, 01 Sep 2025 12:02:29 +0000
Received: by outflank-mailman (input) for mailman id 1104587;
 Mon, 01 Sep 2025 12:02:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut3Ey-000096-34
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 12:02:28 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87100700-872b-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 14:02:27 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-61ce4c32a36so6688253a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 05:02:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4e50fbsm6863232a12.38.2025.09.01.05.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 05:02:25 -0700 (PDT)
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
X-Inumbo-ID: 87100700-872b-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756728146; x=1757332946; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vjx+MKORnvHcLe3MJL0fXFwxrVK0y8ZaI+76AKe8Daw=;
        b=ZD4qgCTTgNYiRf8pigfVHryKh2GE5IP0bmB1LFQD9OlX5JbuujqfvGJdxKhtk+DTGO
         KgH7J+5iWW8LmTK9jYPd+tiLG0s8UFiKCGI/4mH/qvgKqMgSvmQOLC6ZBOiL5j9Ik/Dn
         CepkLNkOrAtCqmtcVpqyhEW7OqXcYNsOrze81w0NgtqtuGUtZnC7yYPUIOZetoCS7OqJ
         1sOLhCvkcrlaAoS+dMkWsoMQ950Jr1CvYqgLJ+Z22iTmCuWQIuyehQL/ISgR16RdYBSA
         oSdJvLJwePxXvXTTmRhGbSTCU6MoAZoHrdPmATgsVKop02vHmNOH+8lbMNE5Hmz6BGQp
         Xbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756728146; x=1757332946;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjx+MKORnvHcLe3MJL0fXFwxrVK0y8ZaI+76AKe8Daw=;
        b=pbj9wgAc1/I92arom7L/AaRVKsnT0DB4rcIfn0w1wWGWkZmDgA5EfeXM+93OmkDUrO
         Prp+g9k39amV/BnKHNY9UGWHUeZBHtdgwaXEx1bd+GmrWJng1Vg3I+1GOmxaR5GoOSba
         L0nuGkxkLFLVrKI5+zNIzWqby//80fXIpesIeDQ5g5mzdJdzVqEaV4Y5/q4WbHUaYmoi
         LVQoL9SQpYP486CyeEHCU3uJ3hA2aToXWLqjHHgK1WE7DHbplMgup13oZlsUYO1i/Cdk
         3EdvICw8W1GTkchgp1Qs0sL1REcXDk7D6GKqThk5B2EJ7G2F/CbO8oecewaulBOLMB1p
         9C0A==
X-Forwarded-Encrypted: i=1; AJvYcCUSmkw/tomqKQso0zvw3uDrjeKD9wEHh25kRNYqUs2n0/5JqDTA/03cnD51rQdMwZUr4owhZ8JnUb8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysDs8jj+5DmCS/LTlMXj2slaI+oSDXymhy+P4Bg8Hn+YbcwByM
	xmLt/fNp0KNr6lWWn09OxuOB2ig1dr7XFAA33eQYZrnfOW2WYd9VNcsohuoTdXRXYQ3AJXWSIBP
	tW60=
X-Gm-Gg: ASbGnctiiV7n6UI6GlD5vjxYADOdVoh9lvzmkAOCx9igNFW+NnG+zL4+PB0BbAVrt1X
	cNCsCE6biHS2vYbRVv0V/yP5MIdeYYtmyqzEhl7/5CT3d1iWOkdxWWY616h3JJNtbtqXmP7yQpj
	9IFDSbFUHUsGT5/IClpUdz+aXr1XIcOONM8MdpmhGPU4A+3TnyC2TzXsVW4lQTU50O7hNniQhRw
	7i55X0gzXlR6q25q5OzpCz47h3yBniTqfw6zuqaKuXj7PU7qPH6Je7X/k6rem7cV2YXKS6gH0wH
	5Jt0ZAyD0k3eN2/KtYRiPFqsqWXuXn6ulTz3NomvsKkn9IICWFNVkS6GYmokmZKyrlJtMfR8Bx5
	eoqH2dACwyriFJI8+PbN1pSZlygGpW47IyJoLxgpj6kZwOqR2CGM/1Yzlt5lKhs3+zc42+DKoHP
	lyyANFvcY=
X-Google-Smtp-Source: AGHT+IHUHCCzy05tioZ0/lis6yrJgnt6U0BBsb+xKQs7Foxnrw4rImjDUOxm/zP8VgIdTU2P7PLv4A==
X-Received: by 2002:a05:6402:26c3:b0:61e:ae59:5f02 with SMTP id 4fb4d7f45d1cf-61eae59726emr411767a12.31.1756728146203;
        Mon, 01 Sep 2025 05:02:26 -0700 (PDT)
Message-ID: <12aa8c7f-30e4-423d-9c9b-222435f91760@suse.com>
Date: Mon, 1 Sep 2025 14:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/23] x86/pv: Adjust GS handling for FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-20-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-20-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2025 17:04, Andrew Cooper wrote:
> When FRED is active, hardware automatically swaps GS when changing privilege,
> and the SWAPGS instruction is disallowed.
> 
> For native OSes using GS as the thread local pointer this is a massive
> improvement on the pre-FRED architecture, but under Xen it makes handling PV
> guests more complicated.  Specifically, it means that GS_BASE and GS_SHADOW
> are the opposite way around in FRED mode, as opposed to IDT mode.
> 
> This leads to the following changes:
> 
>   * In load_segments(), we have to load both GSes.  Account for this in the
>     SWAP() condition and avoid the path with SWAGS.
> 
>   * In save_segments(), we need to read GS_KERN rather than GS_BASE.

GS_SHADOW in our terminology, that is. (Also again in code comments,
and there's also a variable named gs_kern.)

>   * In toggle_guest_mode(), we need to emulate SWAPGS.
> 
>   * In do_set_segment_base(), merge the SEGBASE_GS_{USER,KERNEL} cases and
>     take FRED into account when choosing which base to update.
> 
>     SEGBASE_GS_USER_SEL was already an LKGS invocation (decades before FRED)
>     so under FRED needs to be a simple MOV %gs.  Simply skip the SWAPGSes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> v2:
>  * New
> 
> I think this functions, but it's not ideal.  The conditions are asymmetric and
> awkward.

It's not as bad as I expect it to be after reading this remark.

Preferably with the naming adjusted:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

