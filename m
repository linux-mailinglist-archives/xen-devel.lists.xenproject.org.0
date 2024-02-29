Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC6986CF12
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:28:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687294.1070550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjGN-0001Ld-Ni; Thu, 29 Feb 2024 16:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687294.1070550; Thu, 29 Feb 2024 16:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjGN-0001JY-LC; Thu, 29 Feb 2024 16:28:03 +0000
Received: by outflank-mailman (input) for mailman id 687294;
 Thu, 29 Feb 2024 16:28:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfjGL-0001JM-Ga
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:28:01 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 811e2fdd-d71f-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 17:28:00 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a3d5e77cfbeso207059066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:28:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d25-20020a17090648d900b00a4339b8b1bbsm825064ejt.212.2024.02.29.08.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:27:59 -0800 (PST)
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
X-Inumbo-ID: 811e2fdd-d71f-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709224080; x=1709828880; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/gpsXEOg1wVyzd7WtANsuYmOpKxJtCLX7vfBXtObqbA=;
        b=ALm2q60QEwGw0TBrlrvnxafqAP0AR3bk1mwIuIBf+pJhpz5YXesy/+ON96qVFAKiuA
         E2WgcYc/3ThuUNkX78nktBlJ69ro4Upf4OWJmUyT2SDiMA6ct7fgo3UGLrNblMNATruh
         DyKebWj0xZ+quOSnRe8nmLS/2Q0YTA4N2DSPt+4iP2d0eIllDunNIgpQcDDfWH/2LBQv
         fuJ/HEMORjZr0Ytevn+ZTTtGfmSON12x/TZODMHWmCNbSblZtdx12ghZrLx5Z7CfItbJ
         Y9ZTldNvNBD1o+mk9iO4V7G3jj6jGs5M4kfZrw135qG80SpiZKz+rXi5yuvEzkt+tC/Q
         6AXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709224080; x=1709828880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gpsXEOg1wVyzd7WtANsuYmOpKxJtCLX7vfBXtObqbA=;
        b=tilc3T40SOebv4xMYvGJv6uoKTaTMaq1Cm62xUbvp0z51W1voWWV9x2QXAUzIynp+1
         N4/mauAHjQarWMm0eSgbVYbL+eSSzzF/J6UukE/CW7Lz0QTwq2zLOOrVC4hzXmg0N+f3
         hJYBIuwJPbJZ9GLwclFApDhqrEG4fSY1WCN+T18zpJFL4GuqgIgg324gsZXuRwM0CnTT
         DZ69gDEPNdlOQchQbLGOUo0gffhrfMnK7d8RncDpjC0LGqmiua6vjhizs8cSwmjv0wbm
         b5PK/hheCm/Lk4kpT5LV596W2rKcsmaGPP8smWGunEaHFgz6rAs22cvko1sWvvz/R1gM
         OilQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0wcQolo5sw/3SLGA3SnuJLfVrCW1BXMgl5ZZHyi59mpVp276xNm+9u8yZr03LZjfgua2IFezIHXggt9N9teikFqkC8ru3tVyfcLukFAA=
X-Gm-Message-State: AOJu0YxwQymIquPE5vqZHQygmLy61kYqnH50djSFImbRejPZvkEmLJMi
	Oeg+cosL9x/nFALVK/mzNB5cGU1vels3DbrO0UBCvd9pm2bSgghOkOdFbss9UA==
X-Google-Smtp-Source: AGHT+IFsiKEkfrYuyIrR0wHTeBE5tIhC7xBIJeyqGrSnNonDwVwfvSYtclrBhEuQmN6IKOBVl88qoA==
X-Received: by 2002:a17:906:eb10:b0:a44:4e64:d12c with SMTP id mb16-20020a170906eb1000b00a444e64d12cmr1273591ejb.35.1709224080061;
        Thu, 29 Feb 2024 08:28:00 -0800 (PST)
Message-ID: <48fe3e5b-13a4-40cf-8c4a-37f2d0eaddc9@suse.com>
Date: Thu, 29 Feb 2024 17:27:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/23] xen/riscv: introduce nospec.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <16370492de5344ae8e1aab688261600491868f4e.1708962629.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <16370492de5344ae8e1aab688261600491868f4e.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 18:38, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/nospec.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2024 Vates */
> +
> +#ifndef _ASM_GENERIC_NOSPEC_H
> +#define _ASM_GENERIC_NOSPEC_H

Btw, at the very last second I noticed the GENERIC in here, which I
took the liberty to replace. But please be more careful when moving
files around in the tree.

Jan

