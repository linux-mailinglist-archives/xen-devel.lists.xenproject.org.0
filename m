Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B4690C6AC
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 12:24:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742968.1149860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJW0j-0004Yg-7n; Tue, 18 Jun 2024 10:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742968.1149860; Tue, 18 Jun 2024 10:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJW0j-0004Wi-4A; Tue, 18 Jun 2024 10:24:21 +0000
Received: by outflank-mailman (input) for mailman id 742968;
 Tue, 18 Jun 2024 10:24:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJW0h-0004WX-8A
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 10:24:19 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb6cb674-2d5c-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 12:24:18 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57cc7e85b4bso1921413a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 03:24:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb741e725sm7470119a12.69.2024.06.18.03.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 03:24:17 -0700 (PDT)
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
X-Inumbo-ID: eb6cb674-2d5c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718706258; x=1719311058; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jhKvdBHeU4NEIyccg9DwoIAuB5VXN7v/wbrCReFFQak=;
        b=Hc5A0fBom70Ac3L+uft3hIm81ge176z7l65Z4eTICxBAnfrFumKRmpm3MkePHxoPkr
         lR8eZ7j5AoB/QJwKK9Qwrc9jRpov43xsWvX8bCyKZ2bh4ZHB1W3qlxm3cIfs4nWI+Zhg
         +Iz8v4aTIrwhB162b7Pih/mTSKqOZiFHumpbrVY54qwgyM1cj8ohnmPJBB/irefmSuS0
         RNo5T6brFx9NlOtU9InKtkR5rjkX2HZair7bKEPsvhXy6WkX7EHHnQYViklVTaBJ9of3
         45C0yzP5gddrS0XRGD1BAGsjfLQaLRFL8r0zHUt9O0Nh28Edw2nh7rOXXaNiVWDuQIFB
         XyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718706258; x=1719311058;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhKvdBHeU4NEIyccg9DwoIAuB5VXN7v/wbrCReFFQak=;
        b=C9i4sjMsBzxVH26r0B5HYXhBOyNTkE0MR3CI4mamYbYliPOGeCMgCd4jRj304Y+RTW
         9Qu/317j/nS03dgF0nFkPWyPEk49SihfqAx0T8nydtb4+qeQEQZSFyGWsTiOQc8N0LVB
         BjZIKG5u9DF28Yfvl0NRBzZKRAdyfcyadySmgj2cpNPuOIeiPbGtCga46H05yXcbZFDk
         jbXIntpNPiJiiX3BZSjdQWrGjZ+zpoVEWT+nuoASPIOog+cq08Fh7v1jHe3jI5VnQyFG
         4bXdSOV3Rh33E9TGodTKEuVRg97S4CVchle1h+xf9Y1xvKZJKpx71bs0nWkCzamKn72A
         As0g==
X-Forwarded-Encrypted: i=1; AJvYcCXEeP8a+zCbQtLMINY80CoIk4V9YFvLAdoaejcWEYbJao4Rtf08awObV9/21VxirhyXNJ3L5v9bB0e0xZNR9LsxbVbjmvhq33Q4FnnWZeY=
X-Gm-Message-State: AOJu0YxRAhHuc6d6MHC0BY0026pNt8jo42jxJ6kuXKUWvFtUVGns4Ebe
	3dtPDjNHI1pW1lGNqLrJ1wVCQXGvNKNOzSTL/xcW2jwSwTdDYLiZegbacb/jsA4Nud/xwTfhVOE
	=
X-Google-Smtp-Source: AGHT+IFoWqcvbozpXxvQNqxhIE1z1TSZsg7NwPsNrrU5fsLyspLnzRNQT0koo4krqHA8yioj2dFYrw==
X-Received: by 2002:a05:6402:890:b0:57c:fb41:eba2 with SMTP id 4fb4d7f45d1cf-57cfb41ed0fmr948248a12.1.1718706257726;
        Tue, 18 Jun 2024 03:24:17 -0700 (PDT)
Message-ID: <2b0b993d-5b8c-4a02-b2a2-1a7aa69a41c0@suse.com>
Date: Tue, 18 Jun 2024 12:24:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] x86/xstate: Rework xstate_ctxt_size() as
 xstate_uncompressed_size()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
 <20240617173921.1755439-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240617173921.1755439-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2024 19:39, Andrew Cooper wrote:
> We're soon going to need a compressed helper of the same form.
> 
> The size of the uncompressed image depends on the single element with the
> largest offset + size.  Sadly this isn't always the element with the largest
> index.
> 
> Name the per-xstate-component cpu_policy struture, for legibility of the logic
> in xstate_uncompressed_size().  Cross-check with hardware during boot, and
> remove hw_uncompressed_size().
> 
> This means that the migration paths don't need to mess with XCR0 just to
> sanity check the buffer size.  It also means we can drop the "fastpath" check
> against xfeature_mask (there to skip some XCR0 writes); this path is going to
> be dead logic the moment Xen starts using supervisor states itself.
> 
> The users of hw_uncompressed_size() in xstate_init() can (and indeed need) to
> be replaced with CPUID instructions.  They run with feature_mask in XCR0, and
> prior to setup_xstate_features() on the BSP.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Albeit possibly also subject to use of XSTATE_CPUID, as per the question on
the earlier patch.

Jan

