Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C9891441B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 10:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746198.1153182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLedo-0007wv-5O; Mon, 24 Jun 2024 08:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746198.1153182; Mon, 24 Jun 2024 08:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLedo-0007uy-2n; Mon, 24 Jun 2024 08:01:32 +0000
Received: by outflank-mailman (input) for mailman id 746198;
 Mon, 24 Jun 2024 08:01:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLedn-0007uk-6T
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 08:01:31 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f687c70a-31ff-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 10:01:29 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so46868771fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 01:01:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c819a8ef90sm6028890a91.33.2024.06.24.01.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 01:01:28 -0700 (PDT)
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
X-Inumbo-ID: f687c70a-31ff-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719216089; x=1719820889; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K2giALUKLzTt8KuTE56gEE0BkU395f+bNN+zD8v16Z0=;
        b=Ojlc8Ksl64gKL6xsvvPIFElUu2oWJe9F0BfSWpSPYTHm0ivzZhIw4khnz2kPbt/bgp
         YeNHd0j2mZEYrNCfKxdxhQrfUMJbM2BcuebhcXKl/rYxri+I6oB3YeP9aSGHC2WRJEtd
         P52SxSbEJ63jGdugKSq6M69J/8wWcsbC7IewDKI3ZCUSsZ7650tymUUgFDekqrXvIK1/
         ujSaRHGVUHsaO/+h1xOh5wS39iJM2V1ZoPZ10hH9vqqub0h6KUygoqumqhUqMNcyrtk9
         dCbrbCn8tEXR5UIpeYWMjLr0c9fm8mD9fEnGAXl56tYvNDRy1IhX96GFNug9Cn2RSBQO
         /32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216089; x=1719820889;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2giALUKLzTt8KuTE56gEE0BkU395f+bNN+zD8v16Z0=;
        b=mSuLtIih5NNa/c7fnc61ZQYs72sZnACDB2qFXP+9hwZuaco11+l8XjykDf9D3fM8YX
         0jrcFen3jDGrQYRYfBaoCK3LKx3lJhaRtfWT/PS2INJiBmiIr2JMJBNUYvPoOOvmjKCq
         VHaDUew71IMSpfViRmokzO2K4NzqeJqyMre4+NEHMMqXaixGUuwEG1rlpbNlWGIX11cU
         DWvy4e62AtXN1k9COdvPthc+daYQ17OlwDPKuc8B8q8xk5goy4qOsBUjIbx8W9Y+/vD3
         OjptUn7C1sZH9vS7oqzB5JiDG5xjgv3CaF3YD5dMEPaRvPkFzGn5zG7xwuOg3DtmV/ex
         EEtA==
X-Forwarded-Encrypted: i=1; AJvYcCU39t7bOnxB/FH7a7+dH/AYFZUZ5cUZoB+3PdMocRrYAjvaFafz76ExTJn7stFBsrQj+/NlLiquJK+aqtv+3OS30hwFIu/el+OG2fLf/sE=
X-Gm-Message-State: AOJu0YwCZQZgcQW0aa1lTqbi1hKlNsmkUIRSwgeDgzJ6GX+nmUBZxO5c
	Q3/F2Y++T/b95Ljtnf+sIOEYScfNixQCbRR4wT4qHh/ExepKw987peTq7i4LtA==
X-Google-Smtp-Source: AGHT+IHAsTukawoXywCLA54AzVWWZ+qUo8azIxi2TbGFSzfawk/fR4NHuTPZf6T+CrGC9BWhOzpr6A==
X-Received: by 2002:a2e:9e82:0:b0:2ec:52da:606e with SMTP id 38308e7fff4ca-2ec579c7702mr29904581fa.40.1719216088971;
        Mon, 24 Jun 2024 01:01:28 -0700 (PDT)
Message-ID: <71f97e26-cbb5-4e6b-860a-8c3de1e7e8df@suse.com>
Date: Mon, 24 Jun 2024 10:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/ppc: Avoid using the legacy
 __read_mostly/__ro_after_init definitions
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240621201928.319293-1-andrew.cooper3@citrix.com>
 <20240621201928.319293-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240621201928.319293-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2024 22:19, Andrew Cooper wrote:
> RISC-V wants to introduce a full build of Xen without using the legacy
> definitions.  PPC64 has the most minimal full build of Xen right now, so make
> it compile without the legacy definitions.
> 
> Mostly this is just including xen/sections.h in a variety of common files.  In
> a couple of cases, we can drop an inclusion of {xen,asm}/cache.h, but almost
> all files get the definitions transitively.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



