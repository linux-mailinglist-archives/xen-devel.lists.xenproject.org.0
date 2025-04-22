Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1D1A96F95
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 16:58:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962722.1353872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7F4w-0005aG-Ny; Tue, 22 Apr 2025 14:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962722.1353872; Tue, 22 Apr 2025 14:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7F4w-0005YB-L0; Tue, 22 Apr 2025 14:58:30 +0000
Received: by outflank-mailman (input) for mailman id 962722;
 Tue, 22 Apr 2025 14:58:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7F4v-0005Y4-MR
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 14:58:29 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fa88908-1f8a-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 16:58:28 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so39099285e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 07:58:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43d03csm15783843f8f.59.2025.04.22.07.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 07:58:27 -0700 (PDT)
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
X-Inumbo-ID: 3fa88908-1f8a-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745333908; x=1745938708; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uImX/fwjwp91REhn3nBIw62d38NWImG2xUXfN5FBn4s=;
        b=cE3jXov2AUxGpevUB3yWDBeCY9sZ6VA2L+y7Rw3Eg5j7lvm1w7OfMG0mzQtU+sEehR
         DqUEX5tOUYuiFWUFekAP6LxQQo457YrN/4OZOql8+D6412KxHBcmVxM3K8uc1I78klB3
         Bg9LjsDx8Qw6bUXEiSYUewJ7N9ay8DEwHeynlzHJXrdrrgVlOqfWLyA8EWjT5MKicImi
         kZ9pmPTdM+PBQ8jQH7FFq09bmj5zAKSOK0NFELU9kP7NuYUYWsOrRMP1CfBqSmdN7OkQ
         8BMxU9txz5N+6dyi4J7/6LA2Qq/qtAhtmgfJwl2AdciDNby4bQENg+A12qRy2+Cfbx6y
         6P6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333908; x=1745938708;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uImX/fwjwp91REhn3nBIw62d38NWImG2xUXfN5FBn4s=;
        b=UwPxbQJd1O1d6MIJmOUb93xvhuEdeC+eeEEmmQDdbXlmnQm+6dMGNdnW6dcOUGYUna
         aj4LxBHBlnFvPcCft5z5kdvmKvFnPLQptLLsbYR6mQ5JD26gcPgd/M4lwhEsxgMPmLaj
         VfMPTlrsqKqQ7yCxjwAO1Bbv9wLFBAU2/ZnruqgTwLvw7d18hEqqB5TGmEazBAtGmonD
         PRt+EUE2W0n61aPhOx4xLlQkNjgaJVd6AtuHSmrfUbKDxj85zXeYkS3T27+v5lYOxL8Y
         AVc7bJTEJCCTsUzboKFWsxZckBiUFHEbcoiYE5ViS5jD5Ti76lyvsFk+Oy2dlR6GZv8w
         LR1g==
X-Forwarded-Encrypted: i=1; AJvYcCXCmE6Ylq9b1Z8PURBPhOVUVdgn14hEGjFnC1lm5+RBJc0gIir/reHpq/OnFctrOUTVT2bYvFS7A8k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0IPFl3Wf5vq7Y2xzVLsDg9MGrHuZp7Aeg2QZVOrBlEBawDj3W
	ozuSn/FyTnX+XdWvrZwKp8kTErIG8DdzNG41PN8lIzmXx0eQprus9fxMZJqGNQ==
X-Gm-Gg: ASbGncvN00YgX+CaGIlQMNAUM0kCEQlrNqcEUZYcl8P9t04mhesrRu8T+UmmTEbzrPH
	6x+RKT9blssjvwtx0UmQ0kkZTFIQduWrAB/tc7vOowkpOzq7DdAj7vslE24cN+BtnwRYcTaWIj4
	2DVYrWgheaZBaxeNdSXHwL4362cWgdjPuHmjFPLjKPprR+GMYc8X3O2JIZ6RQCjzGAjvbOfsxmR
	1PLrKZr6zV8xCzglS7CeHnMBh+Yw/VCavdD9hDHRGmDnNXzy3aAwlb3gTRnyM6lzPwOtlgfb2D2
	WQDSmXls7O5QiKCgfJ6f4dpd7NA/kj2NypPShYLId//K3d5JJoOuXKDoyVON1F19duQP6z71Zsi
	4VPa4YmlBtnXHfxpn0I4GXRHRDw==
X-Google-Smtp-Source: AGHT+IEtXMsBXtiSGz03VudkO+Hi/TSFbA13D0GUkRa6ysXR0O4r+pWp56JTpLmWkpR2EBvjaKyYTA==
X-Received: by 2002:a05:600c:848c:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-440715b5f22mr131147595e9.4.1745333907732;
        Tue, 22 Apr 2025 07:58:27 -0700 (PDT)
Message-ID: <2a5c3937-0539-4e2a-a0cc-556ec20db5f9@suse.com>
Date: Tue, 22 Apr 2025 16:58:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH RESEND] x86/EFI: correct mkreloc header (field) reading
From: Jan Beulich <jbeulich@suse.com>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <49b9d483-824d-4247-a642-f19f5c16fd5d@suse.com>
Content-Language: en-US
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
In-Reply-To: <49b9d483-824d-4247-a642-f19f5c16fd5d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.04.2025 09:45, Jan Beulich wrote:
> With us now reading the full combined optional and NT headers, the
> subsequent reading of (and seeking to) NT header fields is wrong. Since
> PE32 and PE32+ NT headers are different anyway (beyond the image base
> oddity extending across both headers), switch to using a union. This
> allows to fetch the image base more directly then.
> 
> Additionally add checking to map_section(), which would have caught at
> least the wrong (zero) image size that we previously used.
> 
> Fixes: f7f42accbbbb ("x86/efi: Use generic PE/COFF structures")
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

May I ask for an ack (or otherwise) please?

Jan

