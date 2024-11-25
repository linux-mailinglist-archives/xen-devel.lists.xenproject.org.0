Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1B99D852F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 13:14:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842465.1257995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFXyV-0004o7-M9; Mon, 25 Nov 2024 12:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842465.1257995; Mon, 25 Nov 2024 12:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFXyV-0004ky-IR; Mon, 25 Nov 2024 12:13:55 +0000
Received: by outflank-mailman (input) for mailman id 842465;
 Mon, 25 Nov 2024 12:13:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFXyT-0004kq-Kf
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 12:13:53 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba809aaf-ab26-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 13:13:49 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-434a10588f3so4352005e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 04:13:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45bdb61sm189603145e9.16.2024.11.25.04.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 04:13:49 -0800 (PST)
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
X-Inumbo-ID: ba809aaf-ab26-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMjkiLCJoZWxvIjoibWFpbC13bTEteDMyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJhODA5YWFmLWFiMjYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTM2ODI5Ljk5MzI5OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732536829; x=1733141629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NQhSxktwgLf/mF+cm3iPw2kTeMDMDzF9G4E7pBu8hCU=;
        b=RrKhoRggGWdCRb1BfcO/VVKiIOgCZ2tudBOa+CmNubviivRK1ceo3Fp4aXQzIzCBJN
         lDhKapYS2QAXkB4l/d+43BEBpAhK4QwAPyChUMhDodPVt/uVFsFTX+xFXMtFp1VXWeCz
         iEOjLQvoWg0S9mHJT5wJg0XMNtvdSlL/pSHuFG1rQyFBI3TxmEsgJJ78IgXEgFOLHEqZ
         l9KKzHjL5eUwKcFsth5lSvxIky73WpSsMWAv2CIBDa0txVKKWl6434fYZVjtazXv+Kn2
         PprNkHexGPLy7zoOdmYThfGgeqDNe4j/n19L1nT+HaeMpPArJ6X/oGkoe0DdTOVhYvVu
         4gAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536829; x=1733141629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQhSxktwgLf/mF+cm3iPw2kTeMDMDzF9G4E7pBu8hCU=;
        b=LeV0GpkDMPiQuS/Ria0HySKgid6xeb4i9xfK3/Z0VDDz8Bt9aM2ehN//ShKyO96gps
         cXhZWwv0CN/PrIyTHESo+BALFfgag5wRR0OB+wUn/6MDTNlEK2QU+Ve6JhiqNknuLF+I
         /SNXwq4IZB5mhi8f5b2KuRr75RWztHWFpXZ1wwvqpqb3o2g0IJTwwHajim4sqf2wf/Bb
         edWSMZYYe/e/qTCKbuGNDaA32oJCf/wdGv9QrbtG7y/Td4DrW6Wvl3PdJFXNxtx+/6rO
         1OUdpit/iY9X1ja1FpJm0vV8rl1VPdkGTXVVMJe7ET/5yaOvYaHSG6TK7js2ZKb/4mMQ
         iKMg==
X-Forwarded-Encrypted: i=1; AJvYcCWXxmygs8+NCMotSRk6Znf0jOfdtZrpiBOAeF1RwlL0yKH1mFS/CVc+RXdOPdD8lbVR9UhWe2ZZrnI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz78Kze1D+DSDMeOeAvPxgUr9+O3NOI4Nv/w0cB9XQoAtQCJNx2
	b8/qLH4BvjA366Ck9tb5hVN8w+h/TYCiyxc1D3ktv2jYLeSKiM/jScfbjAVrVg==
X-Gm-Gg: ASbGncvG9DVI4Ok24X/oD8G29e/Cwct0EWVevvYrv6eBXMQb6N3FQzqAkNtnFahGZv9
	cAvIvX/68c8e1F+fNhqOMVVXKQBWmevBcpTemOgolkSSWIl+XqMg3jWi61+oa0Veeph1jNq1CAY
	rk/n3rS7vZcz0VhP20BtNc+pAN1gaFuBfjvtqF+ZAgtPtOqkEGm2gZyZ2D9hvwIe75S9jYWpfNU
	luFz0wmesjXFDx+pW+wQTyOMAwPRIPSdKbkEmyGGAvL1QB61ZKg2ii4qH2DxjQESsjURQOTrbET
	CdZCjxzHq0AnDD/2HdTCvPRkZFQx1BQX97Q=
X-Google-Smtp-Source: AGHT+IFG0jUXbdTb6NZ/gooqb2ScnBYXT8pJfopxzP3WnIfn1f0XWixSmRttl/8kd8AD4zLRadj7oA==
X-Received: by 2002:a05:600c:34cb:b0:431:6060:8b22 with SMTP id 5b1f17b1804b1-433ce4256cemr123934555e9.10.1732536829378;
        Mon, 25 Nov 2024 04:13:49 -0800 (PST)
Message-ID: <48ea9f3f-952a-4b9f-802d-63ab35036e24@suse.com>
Date: Mon, 25 Nov 2024 13:13:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build: Remove -fno-stack-protector-all from
 EMBEDDED_EXTRA_CFLAGS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241125120406.3258813-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241125120406.3258813-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2024 13:04, Andrew Cooper wrote:
> This seems to have been introduced in commit f8beb54e2455 ("Disable PIE/SSP
> features when building Xen, if GCC supports them.") in 2004.
> 
> However, neither GCC nor Clang appear to have ever supported taking the
> negated form of -fstack-protector-all, meaning this been useless ever since
> its introduction.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



