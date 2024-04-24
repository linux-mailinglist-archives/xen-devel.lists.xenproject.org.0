Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3C8B0327
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 09:25:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711174.1110947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzX0C-0002dU-Ub; Wed, 24 Apr 2024 07:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711174.1110947; Wed, 24 Apr 2024 07:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzX0C-0002b0-Rg; Wed, 24 Apr 2024 07:25:12 +0000
Received: by outflank-mailman (input) for mailman id 711174;
 Wed, 24 Apr 2024 07:25:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzX0C-0002au-Af
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 07:25:12 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c86ead1e-020b-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 09:25:11 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41b0be62a8fso1226815e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 00:25:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b00418a6d62ad0sm26604454wmq.34.2024.04.24.00.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 00:25:09 -0700 (PDT)
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
X-Inumbo-ID: c86ead1e-020b-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713943510; x=1714548310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5X0Zdmp/5vAXHNnlark0kMUOgAR7ijjsaVoa8nppOY=;
        b=F9aC9z2p99IUn2XlX0yS7YSHrm6e2xIgrWXB+PI72NpBNuhlDq6NH1C1dmJ5POJZlX
         gkZl1RvLF/EI6SgWpgaa3m/d+NINSygirgZfqTOjQjqBjma3zwKcpMtBIW5xsPFva71J
         jKeioxeWYyJdNLNVLyKKh0Bv8UEh7A78b0EljTOw3DtwGXtD9V8POdb82+yGNnhCOuFw
         aCGrXX9EtpP3oblDEBAr+OXoIFcwMA9I3oz/jUAv5HCJoUgccYplnM0iI9rlRqQE/PiC
         tGzPDT8h38UMCxcrXvewq2jLniDgPdGleZYQIslGMoQ5RTZv9CuifaplfS4BH753wUyv
         Rc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713943510; x=1714548310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5X0Zdmp/5vAXHNnlark0kMUOgAR7ijjsaVoa8nppOY=;
        b=JsERwJ5jT0pljuAsHgAMKC4LDAJKA1mH1VWiL6Bl0RHRQbh8VmPlYZw6Speias+iqT
         QU+yBPEbdmXXEnO4xPXG3cGboqlqwjWaqZlopyIBlNOx9nYo2AxYlk5aH1ZPF1RSdexj
         KOowIguHJXusuZnqdPnSt40CgLrQbrdrxfdj8wA6uwj9nMOcTZ/ejcxFm7FgDzPQCqHY
         j+CyVf+ifkltXnu/7km89zFF8J774TjPlVlpFZhUMUhJkCJa1yerP2KqlBiA9qrZJGTI
         MhR1rpV3VbRDqUHUlV6kETGlsMV/BL6rGJwjt+B4dCKQruwhXKsgeaZPppV6ZOooUunt
         B99g==
X-Forwarded-Encrypted: i=1; AJvYcCVTcNTGAkqv0wgNRaT4aeifcubTkN/q9WEPtdbW+rbyMGjy016a2cckgGlgDgXuKWZ1sO61pGv76Tb4c45OOs7q6uVs4mY8ASDA/P8Q0JI=
X-Gm-Message-State: AOJu0YwvoALXpfavZWzxwyO859GpEG9BoGys5ny8DK1/wQYQAfsXMYaM
	o+QFzG5+wnikS2JWIXEc7Czu5FOmabuspx8G2aKW3uQFhwhGhZPD6sgRIF/p3A==
X-Google-Smtp-Source: AGHT+IHKe4yoNxKGhXCC8mnnplNkKP3mN8m+EidPhBFT2Sqfw7uwvL0gfoU9tfQJQqzV8kAIUnCmbw==
X-Received: by 2002:a5d:5644:0:b0:34b:b50:3689 with SMTP id j4-20020a5d5644000000b0034b0b503689mr1318802wrw.10.1713943509868;
        Wed, 24 Apr 2024 00:25:09 -0700 (PDT)
Message-ID: <a8507fce-fdb5-43ed-8d02-2d0651ddaee9@suse.com>
Date: Wed, 24 Apr 2024 09:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 05/10] xen/spinlock: address violations of MISRA C
 Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
 <620466b08df1efb706e757aee05a8d7f7e6e8f4a.1713885065.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <620466b08df1efb706e757aee05a8d7f7e6e8f4a.1713885065.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 17:12, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



