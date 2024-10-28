Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2F9B35B4
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 17:04:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826782.1241192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5SDs-0003el-Dr; Mon, 28 Oct 2024 16:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826782.1241192; Mon, 28 Oct 2024 16:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5SDs-0003dF-9Y; Mon, 28 Oct 2024 16:04:04 +0000
Received: by outflank-mailman (input) for mailman id 826782;
 Mon, 28 Oct 2024 16:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5SDr-0003Wd-Jd
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 16:04:03 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 400a5fc6-9546-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 17:04:02 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43155afca99so37759385e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 09:04:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b4000dsm9965307f8f.45.2024.10.28.09.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 09:04:01 -0700 (PDT)
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
X-Inumbo-ID: 400a5fc6-9546-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730131442; x=1730736242; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nn2j0OITmhLXOOGVbpo9h8yYyoUdFTPgEgzh+5EaW34=;
        b=Ju4hT7p4k2LDjL/x71hcKsVrV0Pj1aP9iXwIC9WIQ1mSqinAW+HxJJZG6eyJHl/6+R
         +BBzxx5pX4KDnFnJ3akmeB+lnFaqwMEk66vo/aPid2A77TBQ2faE61z5qKZxCFYZFQ4n
         isqet5+L3d3eNEWC0BeOcBMyF3YDbLuUGM7uHvb7SC4iuDFee9208i6J63VKIZzrTQTx
         jSciRL4G1KutRGZa+9ihN6vJGDq30GM0nR2ilpuqa9eh5kjvO3C/ywxjVoa64stf0Z/p
         dcZx30CFPHMEYYcqzm5Xfm5EMX83owm2EbZWrfVJvysrwGnBqbxNuSpchXHKeyIJ4L4k
         SYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730131442; x=1730736242;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nn2j0OITmhLXOOGVbpo9h8yYyoUdFTPgEgzh+5EaW34=;
        b=iMFayK4RD54q2xMbs3BqCCzOpcyF2FWl8G+6Mnm5i5j9Ch4uW44UGQG1UT7+tu34Dy
         WOAKZOjsFrzcUctZQZEwXDMfolitW9igH2JXZtV2xVQbHea2hp55tHUHaLF4aTa/KdxW
         08SLyjsHwFbCFHPzH9QmTquDFLg+gRMIXaqZSNcF5qm6QUjNzgRg3Go0ubPxSeOb+xHK
         6mXThn4DCVqIdkPFgS8QgRAB8C3scofdOuR/IJ4/YVXMdxsqByk0diZb4jtx/hE5ltM1
         y1kZAH5+DC56Ozsa2F7jW6ktJQTjmQxBKl09sUgqF5UQCixmz2/YPmKkQKxzGO0dw5mF
         kJTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNOubTTKKNXyuGfk9LXIxREbPxuDQPi4uWkoq9TXU7g7JOigiCVI1nXz9F+q5NDALKnABsGdEv1kI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXNUHCyKknPXAaycyV/cewQVH8CRrcKmEattEVd8akdUyJHnKf
	+Fo19Vaa0kioC4kqiwgNLplppPJBrbCnUCNLgCbJchLdSLQLFUOcJbRCRgabqQ==
X-Google-Smtp-Source: AGHT+IFsnSOUuINmXEGU9oG2OR+Nwb92+TavnUvV/srrR91IlGLi5SaceFykm+/2CNhcITd3zu8zSw==
X-Received: by 2002:a05:6000:ed2:b0:37c:cc7c:761c with SMTP id ffacd0b85a97d-380813bc592mr100528f8f.3.1730131442028;
        Mon, 28 Oct 2024 09:04:02 -0700 (PDT)
Message-ID: <f4a7cb7a-2b76-4d97-adbb-430bfcd0d054@suse.com>
Date: Mon, 28 Oct 2024 17:04:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] x86/ucode: Drop ucode_mod and ucode_blob
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-10-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241028091856.2151603-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 10:18, Andrew Cooper wrote:
> @@ -789,23 +734,47 @@ static int __init early_update_cache(const void *data, size_t len)
>      return rc;
>  }
>  
> +/*
> + * Set by early_microcode_load() to indicate where it found microcode, so
> + * microcode_init_cache() can find it again and initalise the cache.  opt_scan
> + * tells us whether we're looking for a raw container or CPIO archive.
> + */
> +static int __initdata early_mod_idx = -1;
> +
>  static int __init cf_check microcode_init_cache(void)
>  {
>      struct boot_info *bi = &xen_boot_info;
> +    void *data;

Afaics the sole reason this isn't const void * and ...

> @@ -819,7 +788,7 @@ presmp_initcall(microcode_init_cache);
>   */
>  static int __init early_microcode_load(struct boot_info *bi)
>  {
> -    const void *data = NULL;
> +    void *data = NULL;

... you're actively dropping const here (which I consider bad) is
find_cpio_data() wrongly taking void * as 2nd parameter. Internally it
copies the parameter to a const char * variable, so the non-const param
is bogus. With the const here retained and const added further up (on
top of a trivial prereq patch adjusting find_cpio_data(), which I've
just sent out):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

