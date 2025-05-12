Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EE4AB34DC
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981151.1367540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQLg-0002Ha-SM; Mon, 12 May 2025 10:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981151.1367540; Mon, 12 May 2025 10:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQLg-0002Fo-PX; Mon, 12 May 2025 10:25:28 +0000
Received: by outflank-mailman (input) for mailman id 981151;
 Mon, 12 May 2025 10:25:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEQLf-0002Fh-Ez
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:25:27 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b6e5e7c-2f1b-11f0-9eb5-5ba50f476ded;
 Mon, 12 May 2025 12:25:26 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5fd1f7f8b25so2506662a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:25:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad24121e992sm327922666b.14.2025.05.12.03.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 03:25:25 -0700 (PDT)
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
X-Inumbo-ID: 6b6e5e7c-2f1b-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747045525; x=1747650325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NM8bzkKpsuFwaLNDR+E7rPkOz8jqY5vVcfgKM8JJMVE=;
        b=NpJKc5IqL6PEF3LePtdHLlKAdk5nhbWFAAah3iYOxFmkTvco5Qo9sIxfH1SF/5tezJ
         lESzS+f9bS20lvcuG9sdla8eNMOwvWNp5xCHSOl1hMRuYEHHCkjsfmfpGoQzquyqpR4u
         VhnyPy7EvFdIAMaQRre82DPFxegStx5Qa2YGlVcTzczurWbHfKrSK7u17+GHbR9cFjeN
         TAi5Y+7X0RKdULV9y1NgoYbSF1zV4oGvN70pEbRFuuxqVi3nYgVQhA7fOkxKw7/qSuCd
         mPPYFJ2v7x6KIJyQdQsY3w9yBHNo8qpZaU+1VbKeMSokzy7z5NTIYUAELjOa6N3u0JXN
         MLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747045525; x=1747650325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NM8bzkKpsuFwaLNDR+E7rPkOz8jqY5vVcfgKM8JJMVE=;
        b=K9gXrVQtFOdvOYSZjtF1QkAnJs7xioJRa9tKny6cji24U9HPTFm3t+yJhWmTdhjpwh
         5+0OxRRRaNf8pjsKUqRrazHqGg9UMndZ0xHC7/ozqK0pJr8XEWLjCAsyZc3dILbKi9Bg
         rzOmgLgbKdG4IeyOA4oJ01uR0Oe0yo5ttOp544fa03C64oHW7V6OuK+HYhF8FR4ad75b
         hCY8+5ECXWFQxezqs9Z/g0o3XkcCo4qiIu8Zma9yot6T9JyKCuR1B++xv/5jXM62rlds
         f6TULOsnVPlr8LPrGTi5SGDNMIPASBUEKkkkUn3HkuE720gMtnDkdiJf3RZwCzjA6hPW
         eFQg==
X-Forwarded-Encrypted: i=1; AJvYcCWqnGrtE664wVnqKuxEnknDkGz8XUtHDeTkxyDkFoKa2HR9JoSBFj44LsVVXzwKpBMEwrJU4ZEzP+c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzhs3+cKOw9dRNL4894tQQDXI9oqDilvhnQEtVnl29Rj4FEmBoA
	qL+xcoa1qj9IRNOaCL3uvpdzlPQAJjZH/mmwPshfOLULZNipAaRpSCRhD2lJag==
X-Gm-Gg: ASbGnctfuSyFbVk1HJEyulY4LsdjelLJKeHUDojOtpU6dV/MbHyDoOfC4g5+zNvkajX
	+gsj3YRpa1KW33wXk+YGOssxbytne5sz7jjVw6QCapWwHVhoMZXAtr/hkz+z9Ui45PYmwtsqW9F
	CgkObsIEU5xdvl1zW8S7y7hiMteTmZk9qbJsO07kQu7ohBVEjFDQLzW4AQ6/YEu2mpAQlMlFvDQ
	+DX+1M4ZFnL/EysIPyhb8n8fpW2cHuO9sfWbHiLPIrkBNZ9DX+7EJCvRYjGHnXWNWwaDCjMgYd9
	LyNKs5HnNTv13CggFOhHYwKU4a9kfYcelQ1KQrfMG8rbBjHpp4ZDXMm4okABiCzIAWc4wAuBzGD
	DZEqh4fWtol2tsPhzzaW9ehdUAS/x8Tm/xgHrsZCOgzGQ17E=
X-Google-Smtp-Source: AGHT+IGIl5DyfL795X/2KS194TiJGhbYkDn1WtNj4eULi/EB+8Grymt7+jF+BaN5mn23qaYaXxHAgw==
X-Received: by 2002:a17:907:6b8e:b0:ac7:cdbb:bf4a with SMTP id a640c23a62f3a-ad218ea82e1mr1248340666b.1.1747045525660;
        Mon, 12 May 2025 03:25:25 -0700 (PDT)
Message-ID: <bbd44566-bf1d-44f5-a0db-5f8aa5a8743c@suse.com>
Date: Mon, 12 May 2025 12:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Allows Secure Boot for Kexec
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250507094253.10395-1-freddy77@gmail.com>
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
In-Reply-To: <20250507094253.10395-1-freddy77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.05.2025 11:42, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> Using EFI Secure Boot all kernel level code should be signed and
> there should be no way to run unchecked code.
> For this reason the Kexec interface needs to be changed in order
> to allows signature checking.
> 
> The purgatory code is included in Xen itself as passing this code
> from userspace it's not secure (see patches 2/4 and 3/4).
> 
> Changes since v1:
> - update copyright lines;
> - better sha2 declarations.
> 
> Ross Lagerwall (4):
>   xen/lib: Export additional sha256 functions
>   kexec: Include purgatory in Xen
>   kexec: Implement new EFI load types
>   kexec: Support non-page-aligned kexec segments

As a general remark: You're sending all of these patches on Ross' behalf, yet
none of them has your own S-o-b. It is my understanding that strictly speaking
we wouldn't be permitted to take such patches.

Jan


