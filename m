Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8A589898A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 16:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700915.1094734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNkZ-0000F3-VQ; Thu, 04 Apr 2024 14:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700915.1094734; Thu, 04 Apr 2024 14:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNkZ-0000CW-S9; Thu, 04 Apr 2024 14:07:31 +0000
Received: by outflank-mailman (input) for mailman id 700915;
 Thu, 04 Apr 2024 14:07:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsNkY-0000CL-4b
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 14:07:30 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac25b23f-f28c-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 16:07:29 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d71765d3e1so12984741fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 07:07:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c4f0e00b0041478393b8fsm2786886wmq.42.2024.04.04.07.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 07:07:28 -0700 (PDT)
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
X-Inumbo-ID: ac25b23f-f28c-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712239649; x=1712844449; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vzn26KUKmzuTxT995RwhKRhPkPF7fTNILzjrzR8aaMw=;
        b=JrkRTNZE5Fq63SgNIzyzAhssnrVhEhlZvFhxanCQErs57lxK+aBeKfInspOUXuR1j4
         PgofXe5ybYGXJnqLwHPhAa80k97hkZkjnw72/AJvrrcmfiK9AuGVXiiCC/m1a5GltBOZ
         Gi/NFkKjmswkkFxguzIb3ZUqh5ApZ5DJiTcMYF8QRsHn8zO+8yNKwTvAyw9iDJx6PU8J
         Bwz5I+ctgaz4RVoCTsZKePv/DZn7jDR/fRqAwfFodYc+yv3QPkBP+PRpyspuFVZKOBRs
         P4P+v4PovQ3kLlcD1GCx1P1/4TX+WJE+huL0GYDjJcf9Z+8gbt31Z0NrIxZJCywEMhle
         14Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712239649; x=1712844449;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vzn26KUKmzuTxT995RwhKRhPkPF7fTNILzjrzR8aaMw=;
        b=qni9iIcIjr3/9cuS+XvF5cOqBDloOAlHt9F+4h7AiVAqvV6D9ND4nB50U4V9DgKplE
         EVcGYppsSqNP5jf8jRZ7oEkSfEBVUiqf7JJVIfmu8xUzJEbJjn8b5hIPcjSXN5Ez0msx
         fP84MjD0knFoXUTljtSBryC9BJmr/fy62Q6HymsP3hOpHE+fzLw1orT3EumM7g54CZO4
         Q2zOPXB0F4yvMwa0F+zdctra8JTa/tMVXl8vZH81md1H9qQT/yZDZ+2g6bTB9RRa7iXS
         xCT1VQkFfomoiS5CtXFfJQQRAHbKtmh5iHxY6abqE2IPzKSxcsK0bf1Wxzuyy5vK2Rvn
         dzwg==
X-Forwarded-Encrypted: i=1; AJvYcCVF4uZEd3okcIBnlUQzXVe5EitZGm2OkBVP2SdSFZ3j560PqGEEqF7sF2ZRQQ4BjkHzkrQtH5VRCOEOrETub7g4O28pbYsnb1fvlZJDvPw=
X-Gm-Message-State: AOJu0YyqEEEo12jr/143L00Rx7xnDk0c1LHVhGReASf35YWbG/cFlGZn
	SMPiVOINkDa8HabHJwm7snfCy85KFLapN9pca2fi516wUNGVpd4JUAPt9bHZ3g==
X-Google-Smtp-Source: AGHT+IFmvs0C4TJwa2obghNT5jC2qRUhK+J6Lks4B9j5SHKQippdo64Lx3hjlKXF0zeZ0idzXLSAFg==
X-Received: by 2002:a2e:9c1a:0:b0:2d5:9bd4:4496 with SMTP id s26-20020a2e9c1a000000b002d59bd44496mr2068938lji.50.1712239648795;
        Thu, 04 Apr 2024 07:07:28 -0700 (PDT)
Message-ID: <cfd41259-fc1d-48e7-b766-5c8c70d51706@suse.com>
Date: Thu, 4 Apr 2024 16:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/19] automation: introduce fixed randconfig for
 RISC-V
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <6e604205e4b815f4f66574d9680f5effb86fa673.1712137031.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6e604205e4b815f4f66574d9680f5effb86fa673.1712137031.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 12:19, Oleksii Kurochko wrote:
> This patch introduces the anchor riscv-fixed-randconfig,
> which includes all configurations that should be disabled for
> randconfig builds.

Oh, one thing I noticed while committing (and I think I said so before):
Can you please avoid phrases like "this patch" in descriptions? Just
say what is being done; before being committed it's a patch, yes, while
once committed it's no longer a patch, but a commit. In the case here
you'd simply have started "Introduce ...".

Jan

