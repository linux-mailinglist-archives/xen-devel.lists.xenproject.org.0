Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602EABDE8E9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 14:56:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143578.1477252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v912b-00046W-Mu; Wed, 15 Oct 2025 12:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143578.1477252; Wed, 15 Oct 2025 12:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v912b-00043n-KC; Wed, 15 Oct 2025 12:55:41 +0000
Received: by outflank-mailman (input) for mailman id 1143578;
 Wed, 15 Oct 2025 12:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oFce=4Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v912a-00043M-2B
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 12:55:40 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3eab9542-a9c6-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 14:55:37 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e37d6c21eso37379205e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Oct 2025 05:55:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47101c23a52sm25828755e9.12.2025.10.15.05.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 05:55:36 -0700 (PDT)
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
X-Inumbo-ID: 3eab9542-a9c6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760532936; x=1761137736; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+tTkmQbguyAZurbfIpXiurrZx7dYHAtj77ye3eCrqgQ=;
        b=cFJQePpIASawzyLz0vY9cHempKkeBrH3doO/E9A4JeByWisimWHSwq6y0nyyMBGiFZ
         RpPGIWApI16S7R9B/hKmGRCWhT4z/tzLwKWtszqFjO7Dsz3AQUNlyU7Zj1A1YI/E99df
         wL38Drkq2hT2+0DijU6zkYf/IERJf3fIc1e/kQmNW2IlUlLxe0YAVxxwDmUKRLAX7kAc
         RfcZi6xZvYAoHOv9wLDHzwQH0jXhS1CkDAeBI9iFPe9i9fbLa8jKKz2sT8+pQf81ujQl
         XGcd+jgPsjv6uHZ2RnWo0u6cP0xGxbBbAW+M8o7u+DB5Tmp+YZ0SdvRuPjQgKJaXBdXi
         /MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760532936; x=1761137736;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tTkmQbguyAZurbfIpXiurrZx7dYHAtj77ye3eCrqgQ=;
        b=PAVhcieedpq32j0nIFn775tQMhRPKo59jRId1ngcLoQn2yqjogHiACx/vxQEo8wftl
         QbdGRH1mI2OZnYdNiHXTTezeyJozhgpoupx48s5j8eOefJ/t1YIH2XvTwBHcJCUjgxIp
         wjeVD4a+Wru9DpdiU9xlZmAMhEHZ8CE/Q/WjP+d0UyrwTE+mnpRJDYYd5ynv7aVgkuhw
         BOtr0bXQ8BP32nn0eD/XESWZA2V55k76PpB64Lh93Q+TFkG+XJzAsCIdd1Ak1lFSQixH
         zdfK/s9LQDmvTSRUpIF08uXWYXSvbXAJN8PpBrfjheLmj6FgA4w49A/SHPDHoQn55NZL
         C3oQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4D4jApYE7qZIJzU16Eim6dtkuBfVUADLPDHpy3B/iKdrXSMaOKxjKxIGFGKAH1ZI84tzpfReOWOI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPZ5NMOC6XZIAdwExW+uMngWV4czcZYdNrneuRKkTJ7xeGzaMP
	ZsaO4BFT3T03jVwQqOtsYEdv4pQmFmOGxZaqsnvqAccYvSwoWhWhUwvmXS11uE8S8Q==
X-Gm-Gg: ASbGncsLtNTlR05SXxAoK9HMaibEZctPYDWz9pU3UjTRWMHO7f/8KbNkEiWXPddNUFn
	fawxsQOLsUcZmfndHtDx7l2+bA1Sgo3btPUxZ5W8HTGkIxiS1KFz8JecEUbH7qpzCWZVHoeoOAP
	HiSMgGJh4wOhmK8v2VsrS36ajIjvicT1CcLmBJKbDpSOp5YMDwFkuHejM5pMQ8kiKzDLYns7c6f
	GW7lV5p8iiVDRsqC7BIU/n2oPXRzrUu0PT9xebh8qJjNJ+voNshsD9YYNtLP3sae/QEARFLY5nL
	I9XeDRmByKs5qblu3E7OJjWOeFsLstrdk6RqseRWDGvSjO+OAWEr52zcRr+tIXt9JGq/+aVXtRy
	9dQj+KLJZ13HTTz/6xCH5UzwRqYfytcCNelpkTg6nMgRiGbuHjix7IzNH6OTdUN8KmmSXmX8Zjl
	k9p3r1FrxSmWB8E/k3Wz5sk4vU1pNSJjmp+kHOkTPcUnzugnw=
X-Google-Smtp-Source: AGHT+IGVf6DSGg82CeXNzzewQ3K/TAB6cUKiz580Z9bst09LLduyMuvWWRQHOFv/m4K+qAWwRw2j9g==
X-Received: by 2002:a05:600c:888d:b0:468:9e79:bee0 with SMTP id 5b1f17b1804b1-46fa9b939e4mr147824395e9.0.1760532936424;
        Wed, 15 Oct 2025 05:55:36 -0700 (PDT)
Message-ID: <7173311d-0afc-4e4f-93e1-b47770b8225e@suse.com>
Date: Wed, 15 Oct 2025 14:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix edd=off to skip mbr
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251013211139.8750-1-jason.andryuk@amd.com>
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
In-Reply-To: <20251013211139.8750-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 23:11, Jason Andryuk wrote:
> When the fixes commit re-arranged the code, it made edd=off jump to the
> mbr code instead of returning from the function.  Previously edd_done
> was immediately before ret and skipped the MBR check.

Hmm, bad me.

> Replace edd_done with .Ledd_mbr_sig for the start of the MBR checking,
> and replace .Ledd_mbr_sig_skip with .Ledd_done to exit from the function.
> 
> edd=off jumps to .Ledd_done to return from the function, and internal
> jumps go to .Ledd_mbr_sig to check edd=skipmbr.
> 
> Fixes: 5ec164fd61bd ("x86/boot: re-arrange how/when we do disk I/O")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


