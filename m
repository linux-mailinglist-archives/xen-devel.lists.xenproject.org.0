Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF2C8D2E0E
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:24:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731488.1137000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDfb-0002TX-Rs; Wed, 29 May 2024 07:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731488.1137000; Wed, 29 May 2024 07:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDfb-0002Rp-OY; Wed, 29 May 2024 07:24:23 +0000
Received: by outflank-mailman (input) for mailman id 731488;
 Wed, 29 May 2024 07:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCDfZ-0002Rj-Qd
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:24:21 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 772d9ea7-1d8c-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 09:24:20 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a635a74e0deso114407166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:24:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc4fedesm678741166b.118.2024.05.29.00.24.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 00:24:19 -0700 (PDT)
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
X-Inumbo-ID: 772d9ea7-1d8c-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716967460; x=1717572260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iUTtgt2aFMpSmMUgR5accW4qs9bkbOHGw/CHMkfJ1Q8=;
        b=QVajw/zxfxohsxJo3pJbeNKXtSTg5k67F6TpB509qpb1ci0pS4tcGG2BDjbxqu8nzy
         prmCjl+02Dxrr0FglN0mEdZCxli8xY5rQmTq9q4ilTCf2UQmb+xC1UqllY7NpbFFWVpv
         W2HnVVovwCS7cg+z2QNrzkaIFYOWG2HBNO021guj/jz9/3y5U803ggWtYS6hgYp5QoN+
         fFWdIEx57p8qpsyBsmDlk8gOzOjG97uh9QgnZtPNIzAt1+oQyT2LlaZfQgoa9jQwaKP8
         BW5+Dnhn9Zz45gZiCu8fGcCRlwjUPfNoASIwKn8PyRUlnGw1NIu1gRjHxAL81CgfOzYD
         v0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716967460; x=1717572260;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUTtgt2aFMpSmMUgR5accW4qs9bkbOHGw/CHMkfJ1Q8=;
        b=M1lg2a/P9v8AthjsmHYAUrrrJU0kfOwAKoMX04FYn+t8Fx2QvLQpmGgunMPvZboMLm
         pOXEq344AxCS56YOdXsXa4svhzuoPHqF2XZUMdQyJa2Nl/5ofnNJ7S/tDrNJUGJ5ocbI
         /sP1S/6N62zi7ERGvGI9fXZoPUrh4YWOUf52LGZ0r3upsS9N8hg66AsShU+JxfYfvOQZ
         9zGQX0G3PYPulckxZe5K5eIj/u1P38ABQxCx/oxPAPT1pDgT4cBnL+pqAAEqiwzqcZ50
         LkeCStMIgh9qWo6f22YMhZyZ/IWbVFTIMB769+y0qvZM1tjX46XpYDbiWFf5f/BJmaOa
         lmCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7GXMGUGv/zJ//3VWq+Pz2nr8fNiXkwLs7i5vB0Pina4aA1pVT0SudxQ7XtenpWbLdyQz2k2YVexuP49CpCHH79hOO/1lOmOHmD6rgF7c=
X-Gm-Message-State: AOJu0YxGJ5CXgA2cXepC1skUEQAszlkJPuZTw8NHIkpBA8atS+0ksIE4
	OurBCxUau2xg1Mo0EaUh5unD0PndoznjN4X8si+YAdHlER3vs9M7g+p/8W1HIA==
X-Google-Smtp-Source: AGHT+IE0PWBhT7K0kCY7fbVzU19w3zq5nP7KvA65nBv7Rm8vBSqhEzwIRqR+ukse2WvnVt07ycwKZw==
X-Received: by 2002:a17:906:e84:b0:a62:404a:d0d0 with SMTP id a640c23a62f3a-a62643e458cmr923721266b.42.1716967459948;
        Wed, 29 May 2024 00:24:19 -0700 (PDT)
Message-ID: <0c4a9a00-b8de-4472-afb4-0a8d70c7aada@suse.com>
Date: Wed, 29 May 2024 09:24:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v3 0/3] xen/x86: support foreign mappings for
 HVM/PVH
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Community Manager <community.manager@xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240517133352.94347-1-roger.pau@citrix.com>
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
In-Reply-To: <20240517133352.94347-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.2024 15:33, Roger Pau Monne wrote:
> Hello,
> 
> The following series attempts to solve a shortcoming of HVM/PVH guests
> with the lack of support for foreign mappings.  Such lack of support
> prevents using PVH based guests as stubdomains for example.
> 
> Add support in a way similar to how it's done on Arm, by iterating over
> the p2m based on the maximum gfn.
> 
> Patch 2 is not strictly needed.  Moving the enablement of altp2m from an
> HVM param to a create domctl flag avoids any possible race with the HVM
> param changing after it's been evaluated.  Note the param can only be
> set by the control domain, and libxl currently sets it at domain
> create.  Also altp2m enablement is different from activation, as
> activation does happen during runtime of the domain.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (3):
>   xen/x86: account number of foreign mappings in the p2m
>   xen/x86: enable altp2m at create domain domctl
>   xen/x86: remove foreign mappings from the p2m on teardown

Here, too, I'd like to ask whether to keep this as a candidate for 4.19, or
whether to postpone. Afaict what's still missing are Arm and tool chain acks
on patch 2.

Jan

>  CHANGELOG.md                        |  1 +
>  tools/libs/light/libxl_create.c     | 23 +++++++++-
>  tools/libs/light/libxl_x86.c        | 26 +++++------
>  tools/ocaml/libs/xc/xenctrl_stubs.c |  2 +-
>  xen/arch/arm/domain.c               |  6 +++
>  xen/arch/x86/domain.c               | 28 ++++++++++++
>  xen/arch/x86/hvm/hvm.c              | 23 +++++++++-
>  xen/arch/x86/include/asm/p2m.h      | 32 +++++++++-----
>  xen/arch/x86/mm/p2m-basic.c         | 18 ++++++++
>  xen/arch/x86/mm/p2m.c               | 68 +++++++++++++++++++++++++++--
>  xen/include/public/domctl.h         | 20 ++++++++-
>  xen/include/public/hvm/params.h     |  9 +---
>  12 files changed, 215 insertions(+), 41 deletions(-)
> 


