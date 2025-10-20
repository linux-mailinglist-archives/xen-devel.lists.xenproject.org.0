Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8496ABF1901
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 15:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146368.1478805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAq4f-0005Wa-AN; Mon, 20 Oct 2025 13:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146368.1478805; Mon, 20 Oct 2025 13:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAq4f-0005Tc-6p; Mon, 20 Oct 2025 13:37:21 +0000
Received: by outflank-mailman (input) for mailman id 1146368;
 Mon, 20 Oct 2025 13:37:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAq4e-0005TW-Er
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 13:37:20 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e57a746e-adb9-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 15:37:18 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so2466837f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 06:37:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4283e7804f4sm13317032f8f.10.2025.10.20.06.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 06:37:17 -0700 (PDT)
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
X-Inumbo-ID: e57a746e-adb9-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760967437; x=1761572237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D07EKDgYPATrS3ktcZ7kxH7F/Zwjg08YyjFuYG4DB1w=;
        b=EZhYtoyzoS/nNltQ5BPbjPyqOI6NEDEOnH9F7jPZZ+P+mMMq7sQXfNO9hWD6dEEgRF
         J2jebGYLj+9kOozf3r5ojIeDzQ0CvCTNFfqlfmL9dOl+7lzpFsNY9EyzmiADS1QzvNQK
         oQ8SG0faVhSKWLpnKp+yo8iJg8IFKGEpZu5d2RYHPjlvKExWTrEUmSb7SxBD/YvGEdg+
         gX0JGQ/Gm70KmJnXeGSH6611Adh6aly8YfhEwgCGsfLSbUqxQQjJ9mGGiJSC9KFH4ukp
         wYThRI4wEtM0nDQWb9l/yCfhiQhQ3TN9uSgVMoXTDTOwDus/MhGP3RVZcBOVNFJXlge4
         Em9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760967437; x=1761572237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D07EKDgYPATrS3ktcZ7kxH7F/Zwjg08YyjFuYG4DB1w=;
        b=aHt70rwDiAjAObQJ3lbGlN601M/jbXquWWmTPGGmigR0o821TXsuRcbyqHi/HNT0KW
         OwIOY9QE5fpK824o3pvsEHAQDM0bQimgba5yT2QZOd8sMwkMMtUV820dEF/1+JzmS3z5
         x9Jnvy9GvVnEg++NEJQ1z9eguQN9mttL+du41Rq4WqEMCGKal7n7FZNch9EHHsqCSWYF
         4BMjhIl+t2YFEXwrZfAl7Ho+X2IDQH0x1RD2KNyi9w58Hz0C/ZgGc2rZgZ4MfIHngXjc
         MJGDR4NuFS793psesIR326h9v2c6gw3hT57vY8JY3SX0gecuG2scPzyHx5tgy/nBeM1O
         ieZw==
X-Forwarded-Encrypted: i=1; AJvYcCW5xp76XZn/+Y1tBMSYDGTYZtc1R8NQmonOOPjdc2ekH944YX5dFurSLSryj5SeV1geopi6i15whgM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzbly+i2QrAFWzsp1lUTJlH4kNvHJCW7oIiFUzjmfSwnDFzicN3
	RDx+HxQaw8ttHk+pw+IJU7HfcMQLerIVXRfw2GhVQ/6uWOTBYUtTfxvgIffdhGjahA==
X-Gm-Gg: ASbGncvKa13ils4dXRjoIrZWUwoUdTVLdPE9lI3KmrrXvqXA0Bj1nV9ONODfzoQEoH8
	8AsYmNEyQ6c4PHxPJQykidCNE0mKZrmlOwLywyn+DlHGdOp4Sy60b3QDc2pFktd1BD+jdQTDJvE
	YPOiZCzqORUxhkYKlSXuHrCagbloZOgk4eUg8x7NdcMEP8Fw8N/716CpN4u6HlxSsIL64YsbrsK
	HFtW+MMu1+JNLoU+PYOwnnIYrKH1nwc28qbZ1+ZDzTQEFNrJlSnzuSOcn7EAQLKGh5x9mmlVF/B
	qHoeYDADSmsPldiIvPpauBYfTSjZz9/+pUUnug8r0f/Y4Ym68y4wDdcOU2NJGJz+kQ3NuVxUwq3
	rcRw/XWOILo/cMf6zP/geeEQxx39/ruVpH6l4CJEz+zO0WmHz6sS4sdUDcWquy2daJOgU9tnssS
	gC1Atm6C9bSgcqiTqqgzTTfRewxqbi/bpL51XdYQ95u8kI11PlG8fqcqfZBKAPQEIZn8ZH8v8aI
	BNCpz1BkA==
X-Google-Smtp-Source: AGHT+IG0/3iL2V7M7pUEwtvbW23HlI3P69FTQCPorkzKy8RQyYjA9uQtB/2DysJOrL8FG3f0pxdDbw==
X-Received: by 2002:a05:6000:4604:b0:427:6eb:8499 with SMTP id ffacd0b85a97d-42706eb84acmr7907319f8f.24.1760967437494;
        Mon, 20 Oct 2025 06:37:17 -0700 (PDT)
Message-ID: <7c387055-0bb4-486a-997a-25fe0a5f68e1@suse.com>
Date: Mon, 20 Oct 2025 15:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/ucode: Fix missing printk() newline in
 ucode_probe_amd()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251020131955.2928261-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.10.2025 15:19, Andrew Cooper wrote:
> Fixes: 630e8875ab36 ("x86/ucode: Perform extra SHA2 checks on AMD Fam17h/19h microcode")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Looks like you got an ack and r-ack for this already, but you have lost them?

Jan

