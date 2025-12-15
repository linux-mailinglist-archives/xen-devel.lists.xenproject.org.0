Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7318ACBD553
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 11:15:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186742.1508172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV5c1-000168-Ru; Mon, 15 Dec 2025 10:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186742.1508172; Mon, 15 Dec 2025 10:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV5c1-000130-OY; Mon, 15 Dec 2025 10:15:29 +0000
Received: by outflank-mailman (input) for mailman id 1186742;
 Mon, 15 Dec 2025 10:15:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV5c0-00012u-Mg
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 10:15:28 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f973e9b9-d99e-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 11:15:26 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-430f57cd471so637420f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 02:15:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f280cf05sm13999882f8f.7.2025.12.15.02.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 02:15:25 -0800 (PST)
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
X-Inumbo-ID: f973e9b9-d99e-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765793726; x=1766398526; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pQjvX/81CH6ZZnSTvWZRPbFFMm1X0PFLak+jNLSdFyY=;
        b=Y8R2PNoDhPmH3E+hTcqOz9i+tCw4UYsul6rcyOuv/q/vOLzIPLkwa3Wtln6z4af3G7
         QkJMgCiXh7aF9tdnkFimueUcAlOBxS7Jq41OtMUetpA+n/88mbycd88zv/EFo1YP/lLx
         /xLe/vkVwPgiJEXtUqrQRnv5HZf6ckR0ixbjC2YUoVVQ16AqdYLHOVHaXVygzDGNKlEe
         lWNTlql1wqN76cGVbqBs7v2uT6fusw4lpm8QE47GatbV88on1AMsjoW5a9/03E+jntc5
         044dntiD5OxPWNAS+sVFZg2Qqx6otk+Ko2kyZ7UgJeaiuwhmzjCekalm3/jPqVQ9kb+4
         xU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765793726; x=1766398526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQjvX/81CH6ZZnSTvWZRPbFFMm1X0PFLak+jNLSdFyY=;
        b=rlh5ZqRRCxQ60BCMgZbdlVx+4wwyBrWI1YAZtVCT+WLpsRgfABTfk4ZdboYBLGh6KU
         Qs5wCEQGCNXYzPHlNt3aTTZSqvf6MqFsk6197NXlurwXzDF2nd4ah+7fOq1XCTziJ3p+
         AQ8mBd7naf6aU6OwKxP52EthMLEAf0R+11k19QTPAto8a0hkqUPvchji6tbcgSfkkrq3
         XJkIRN9RCzZRTtT9DOy4IYlCzhBjpfXwrShXrjtx4qK31XrQ48V/nOHHKBqXAKn7kuzd
         tB6YhDBQsNS6Jy7wQuSTKLxukAxt6hwi5doCeH+2pIZT6SDUPpDBM7AReGHNQQeeJOsN
         wyrA==
X-Forwarded-Encrypted: i=1; AJvYcCWLU3clJj2/6gEsrAS3eJfCc0W6G97pBBRspRDuqFrf6hMK1WcwKyWrceg6dSLvyvZtyDwXTWNoxPQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAhBiP6g/a1dS2SEvY/JsPsj3Jb+DxU9MKPHC7wuqnGeNncSX0
	gMR85GvqgY6p0MjnBAhqyjucY7Pr6k4MHJaTaciDEKSf2JwKB5XFN5YDZRzd1FFN2g==
X-Gm-Gg: AY/fxX6ZRdMqa+4yJFJxDM7EZn0PCeESCRQd6toEVP4SyLSLZG4DAVZwLIHA7u4l6nb
	S6amiRTBt2IJ9Il2bKxgKHKcYzXUwjeUeVQ1DDPOuWry94mfHxPCV4xZuln1Vq5j5jaHWqgxNJ+
	lFhkcrQx/cf9knvPXN8yXxsM2NaW/lw27PzZwkiZqSZKG9T4rD0WBEzePRQhs3R5DXV2a7nf22/
	LfRb0snfjWQ4FlVwgOFSpTu7i4BLeFrhJ/g63lM/DtHxOubkWG7XtaLncPheqOQY2g7PnN2YMTe
	bIG8o4GyoOy5lYpsRebfMh1tVjop1Sube2HzBcTndevoJtJR8//aN6/x0RVJdqTac/FyQaHfd7Y
	t0NuoqqgkQMpLH1lSfqgbRKUgi8vEMhBn/p4dejHcolDvHPHMJlVVoNaugdT9BZVN9wUmUmqZw8
	6r1ZXFXpQYd6wyU/FyhUWW13UHKgPJguYtEkKBHDTbaeT2SclE0lCCAsq2+/vvZ4uqeD6+G3qJx
	WQ=
X-Google-Smtp-Source: AGHT+IHXJsC1EWtpqMaqNYFrKONJpF3BkaEpTZKV0YT+tlJDGaA2LeTm8reGVNJyjRQXxFx+E4WBYw==
X-Received: by 2002:a05:6000:2207:b0:430:f255:14a2 with SMTP id ffacd0b85a97d-430f255183fmr7043939f8f.54.1765793725629;
        Mon, 15 Dec 2025 02:15:25 -0800 (PST)
Message-ID: <73cbf642-aa89-49a9-a3e4-61ed08c9bc99@suse.com>
Date: Mon, 15 Dec 2025 11:15:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] x86: More misc MISRA fixes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2025 23:20, Andrew Cooper wrote:
> Andrew Cooper (5):
>   x86/pv: Address MISRA C:2012 Rule 4.1
>   x86/pv: Change type of do_update_descriptor()'s desc parameter
>   x86: Address MIRSA R8.3 (declaration/definition mismatch) issues
>   x86: Address MIRSA R8.4 (declaration visibility) issues

Acked-by: Jan Beulich <jbeulich@suse.com>
(with the title typos taken care of, preferably)

Jan

