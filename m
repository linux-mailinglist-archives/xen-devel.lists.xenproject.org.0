Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB68B224B7
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 12:38:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078603.1439632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmOf-00079q-0I; Tue, 12 Aug 2025 10:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078603.1439632; Tue, 12 Aug 2025 10:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmOe-000772-TT; Tue, 12 Aug 2025 10:38:24 +0000
Received: by outflank-mailman (input) for mailman id 1078603;
 Tue, 12 Aug 2025 10:38:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulmOd-00076w-7R
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 10:38:23 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77c37344-7768-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 12:38:21 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6180ce2197cso5777829a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 03:38:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6177dc4b209sm12763104a12.28.2025.08.12.03.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 03:38:20 -0700 (PDT)
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
X-Inumbo-ID: 77c37344-7768-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754995101; x=1755599901; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sU/Y9KC5Ar6PrBckMrVYpj/8STrLN8Lg/BHdA+REi6M=;
        b=TRimmO3c5smuTyImtZclxPAUr+XS+oja145mW8PTE5resEL8xUg28FmiKe2mDe7gps
         xcI3w37sXtQjgDoywZ5OR5iVVNW0fK9wfpg21AFLNAEkXTLo4EiaSZPkF+C6X/u7YBQK
         uIri+zX8fJOwIKPmSth3IMy+UBoL6iB8Hdx7PiH8dReFIV+1qxlk4hK6pYp+oPwIf2sy
         Km+gPQ5N+fTaWDL7I8v6Vc0m4UKmIxt3ZHne6eQu155VSM6wK8kF20e/yfCZcllL3zZc
         xGOYD9VtH3NSCwfurn0S43VT9D8VS1pYylfAzSOwXgEfNwZ+d/mCcvM+9w3z0sHO/bP4
         I7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754995101; x=1755599901;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sU/Y9KC5Ar6PrBckMrVYpj/8STrLN8Lg/BHdA+REi6M=;
        b=XqAbmCocRv01u1waH419AbfJZvj6EY3wLyQjfb1vbawDVVOf9ODq7Q1UzHy6xQU36v
         vXB1O6j03UVrHjYAd05Mw5E1wzojKrBdZbnMHinjJSDvgC7YjAC3unDJhhU0/Q8dJ2H2
         sSMK1fHJrJXA08wTqPy0LLDcGdKKfRGkW6eX3qF5h37JiB9dgpm3kkUaqWeiufILuYnF
         3zZv2YLSkhrgctrXvg4tyb2NMSExI1bZ4mveBmyK8IsaEeYUuXQVJQc9l8fsyki+4Pqk
         RMd9NHHV6zUsAoiJfbeAMwHAcSmIjSPfJvwmxtBtQ3IZ1ov6KTk1FpI/unsRye/0zu/G
         rtzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSSY7oGyKTFITbrxPuZ33AunRGDKLFkmwQ19oUhBLdRBjDQSYYpkVH7XH6x5htUTa3O97lgGxokyM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuwD53H5CtIi5LePw0Bafy2wNZILIgJuj9OTBcwLTgdFlGy61F
	wlGWffTawDqn3aK4tnJ0ythGcIYglkjafcG910mme4wNIqm4ODaU/Sv8LEPWp4PYwA==
X-Gm-Gg: ASbGncvPzkQOW/cn6hlythAnEMpWgzaneNfFvOtEQo8eJs640ofg597FeEoEZLjmuP1
	3FjZtjlQKWEGzlZKALVkVdaUm73PgaTgTt/aBpuHa4nMfLXnUOTDBGFGkf2KpwdKPzyX2wlO5FI
	HrNOHx1mE1TI7KYcglB+kYmtjMEnATeD+RbT9u+Ph9EMj+JgdjX8y2zve0++cKpdHMPb6iLXD0D
	1VCkXqs3NPXrTrYb2THP2vIxmqEK+nDJ1kA9hltsAngH9x+iJfxDdbBbAhU4p6/D6l3ZMlqYqXJ
	ruNFZKZ/bkwpjPzbSlrxv4ZCvevx0hy/0z8eLH/kxT69y/5z/LY6ltLLh3cOkxDwoDh5wB0ddaH
	azcBhjvMo4TSA7Bar7YWraUIMk0u/Z6ANYehsqgQ98qMHPXKxP29/5Gp5YU2T8r3YmtZYtIPcFc
	cL2kvNk/w=
X-Google-Smtp-Source: AGHT+IEN+Y9cdm8MAlhBsDoi1c4aep+CMJBRxFw7utZii7Klmi5Jm6we45T8/kJc9Qp4JVEpkhbPCw==
X-Received: by 2002:aa7:c68e:0:b0:617:9797:5e8a with SMTP id 4fb4d7f45d1cf-6184eca47b3mr1729056a12.33.1754995101261;
        Tue, 12 Aug 2025 03:38:21 -0700 (PDT)
Message-ID: <40eb359e-9c67-44c0-b19f-56d0ae49e9b8@suse.com>
Date: Tue, 12 Aug 2025 12:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/current: Annotate get_cpu_info() as attr_const
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250812103040.1765666-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250812103040.1765666-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.08.2025 12:30, Andrew Cooper wrote:
> The result of this calculation will always be identical, even across context
> switch in x86.  Tell the compiler.

Or if it ended up different (e.g. due to stack pointer corruption) we're
hosed anyway.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


