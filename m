Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80678B3086
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 08:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712449.1113165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0FBl-0003WL-Jy; Fri, 26 Apr 2024 06:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712449.1113165; Fri, 26 Apr 2024 06:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0FBl-0003UY-H8; Fri, 26 Apr 2024 06:36:05 +0000
Received: by outflank-mailman (input) for mailman id 712449;
 Fri, 26 Apr 2024 06:36:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s0FBk-0003Ns-9k
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 06:36:04 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40436189-0397-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 08:36:02 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56e47843cc7so1721603a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 23:36:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jr13-20020a170906a98d00b00a4e03823107sm10200684ejb.210.2024.04.25.23.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 23:36:01 -0700 (PDT)
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
X-Inumbo-ID: 40436189-0397-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714113362; x=1714718162; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YCwEPCERGG4Frs5nMa9Jh5ILE6LpCZzTYHywnuhBxI0=;
        b=R18eAEcEbGVH8ZsARLamAfmYXsyjwpqAYxRrO85yrsJ2sLsy2hzcrkKNCtW5Yahqae
         aiDNNrGqQlEoOdnrWaQ19HXa2XXnTSl/0Wy2qoqPJlQdPXuhJ4hfQ/fFsHpfPZ4Uyk8/
         DW7iGwKFtEjClK9kEsRWfWUBbIpz1jKkqRhPPVYY/L3qkN6UpyGOW/nQ10svNGIvq7Ox
         7ticvcHEGZH5YgBBmZ1U7hXzI9HA8na0DqAg0AzW0/2YzMZc8OPcYCCw2DG/uzzyqTYb
         lki8dHxcvpRHuy79PmEJ9BPPZJW6U6KA3sTlvUaWDhmvb1KtWyG41E8hesEaNVbj7EyR
         1r5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714113362; x=1714718162;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCwEPCERGG4Frs5nMa9Jh5ILE6LpCZzTYHywnuhBxI0=;
        b=FpP9pqpbpadIS+6AzcNrRRdyZZzs+812caZ4lP63a8PxTkaY1pTj8F0qvirHgi/cpB
         QnQwpg+9TRAEq942r3Nx7dDkhGpIDX1e1sSJM8l1fIFpkpug3JRxQB9fO3P2kIPYAnnR
         nTtnWA6Otl01W3JMaCFSu4FFp7+fSyOarYrMRoH5sq0i8gvMrjhQbntw3etPxYy2X8RK
         x8dLGAM7uY7+aRzQARqVBevTDpvXS6pG5HMdsy2i5p4QXAgR9JwTQnPvti7xCkp3qOci
         7aurM3UHT/bzFl4HdnXyxmxrHOQkMpunVGTzocj6WCScRTNn6xBOXLWkYRE2UvZ7BceM
         VOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSGvXfq3DrdpHlSjVFbY8SOdlggxGL8FIepEBxyCkSoIb2mmeC222wxxtq+KmhBz72I19J1XkkpbLi9GNZ7C4v6DnsT1Hboto2kwQbXJU=
X-Gm-Message-State: AOJu0Yyevv0qv7DghslHZN79eR1ch527tbtKjc0lt3P0Ps/PqRpwRhqc
	9YB+lQdmjAw0DxG2Ku6RrPH+wAEmunBeo7EXbtROygXLY7TLbdMdZh68wi6tVg==
X-Google-Smtp-Source: AGHT+IFis5TbV8iPTbh7l4z8qTEspC8r4L3w7mGWGd02/zc3fhBfVH+Q6NG1mRXMAEnbsFqsT7gF4Q==
X-Received: by 2002:a17:907:7d8d:b0:a51:ae39:d385 with SMTP id oz13-20020a1709077d8d00b00a51ae39d385mr1435585ejc.1.1714113362052;
        Thu, 25 Apr 2024 23:36:02 -0700 (PDT)
Message-ID: <354e207d-e18e-409c-89ae-df2c5502a9a6@suse.com>
Date: Fri, 26 Apr 2024 08:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: Drop glibc-i386 from the build containers
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240425174737.414327-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240425174737.414327-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.04.2024 19:47, Andrew Cooper wrote:
> Xen 4.14 no longer runs in Gitlab CI.  Drop the dependency to shrink the build
> containers a little.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is probably okay seeing that 4.15 shouldn't need to be tested anymore
either, for having gone out of support. Otherwise I would have asked whether
this isn't premature, as at some point there will want to be N-1 ==> N
migration tests, like osstest has them. Extending the description a little
to this effect may be desirable.

Jan

