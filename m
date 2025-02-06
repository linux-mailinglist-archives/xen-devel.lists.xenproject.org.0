Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5D9A2A881
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 13:30:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882805.1292891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg10u-0002D7-DU; Thu, 06 Feb 2025 12:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882805.1292891; Thu, 06 Feb 2025 12:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg10u-0002AT-A9; Thu, 06 Feb 2025 12:29:48 +0000
Received: by outflank-mailman (input) for mailman id 882805;
 Thu, 06 Feb 2025 12:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tg10t-0002AN-29
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 12:29:47 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bf84560-e486-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 13:29:45 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5dcef821092so945073a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 04:29:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf6c9f90fsm798061a12.60.2025.02.06.04.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 04:29:44 -0800 (PST)
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
X-Inumbo-ID: 0bf84560-e486-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738844984; x=1739449784; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oAv6lFsgTD8C8dc1JeSJoRAejqssYWcHKVN9ChyLyVo=;
        b=I3mkxXzuVdY8L9K2ofwqdPp5tzfzb0QrNWyyLGJ/q0PWVoirn8WEg0R9VY+TdviqCR
         cRThWY24dNv3VjYfdO0TeVHnapsbeHmZp/pDBzVu6EmMYUkFG7TxHCQQ6YA1hMnlKN0m
         tuWIJZIeUYfKdAxsmX2rE14eDj6ZfAJg6IW65tmsRO/OiwXHJHeyTXskmJCJq3XKEigm
         Md76WnG0CVZdRG3PESAPLu7Ify3+PGv7i24d80pYe81TFt5eBr5iZw2icl2gohww2YK1
         cFPs++rkNMtE0Mh9tgEvEYlz3BWMzxCJiqhieYOBOSWOPT9YwC0Kl/DMl6az76weYeak
         1YJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844984; x=1739449784;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAv6lFsgTD8C8dc1JeSJoRAejqssYWcHKVN9ChyLyVo=;
        b=QSZcJJkb1NRC6LrlcGNn34lPgsGanpt8VsX+euAhCcPKR8tWY3aeRSINnsFbkKbMl9
         auKfItMscv0mCnUoYbc0dOCEo0fOoX3Hbw/Efl1NEDk7BS64fZYTFDmr1AbA5h+098sT
         MHA6hF/LZHw7MW50lShfrVR290mGwAh6mhWvwrT6MLOoZD8GT15Kz+GIDV+/19kjpo1i
         EuIGcIhDIqrT5TVSzZ0Uq3V1OdjgNZfXP4HBgCGecSbnrtx354gmKKSxDRhcJVmZ0HaD
         vBMVoi/ZnJFNfLrLucM/o6K9K1VaLC8Q2fkHbF+/zNGbxZyEuDuN5TJL2uRs7SE4Eecb
         ub9g==
X-Forwarded-Encrypted: i=1; AJvYcCWxKa5T38VMWUSwAVPKUnraR8Aikytx2EGNHiPjPpfbq/9Ym+Ld6ok8wOYnRf8tIeZIwgC32bsyWXw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKoOgkoAh5Gx5Am+WxM3p+bd0ad5cFnb5AjYpmzWp2qIaQeiJs
	S6luSvWQjfxV07ABpLqRAbl6VUmZNUivMEbYQYxS+mbYR8p2cYjwd45Z1o13aQ==
X-Gm-Gg: ASbGncsIkpzlE0PxulLiuZxk64fOxWkioryznPPaDCkigYGLGDSwqzWf8TOiv0r7YjZ
	5cIl32IgWb+PYjUl96OO/a54ZUjRDeghMDMdWqbrYnvm1DETydRgGU/Vb4Xds0k0kg+yqtt1iVR
	Opr0w/JWbaHhX+LR+eo50l3cSo1/g6bHSROgkJP4n2Uh3UYEyAwseC3jCrUv+nz/ZgJy76iUZZN
	MoO/v8QNUAVxvk79ywJSzYNBgQnYdfE9PiNyh7MFS6kybD/wMpvBM9ELP5BPocsiw22A6oKIeYv
	qHDHVljUwEK50jyER9lC+z26FulfOBn28LW8v83NVLJUbV1EIe/lty2rcQFrRXQDYPcWyH8h9a9
	T
X-Google-Smtp-Source: AGHT+IGVRdTZbP2w/Tnmc+8j87rcHTS68hqrh/HUFO0IwqQXV4DRZYX/Z74Iq0gOxhnOKxRxZiP+EA==
X-Received: by 2002:a05:6402:26c8:b0:5dc:7fbe:7313 with SMTP id 4fb4d7f45d1cf-5dcdb6fa014mr7624433a12.6.1738844984527;
        Thu, 06 Feb 2025 04:29:44 -0800 (PST)
Message-ID: <5a0e26ff-21fa-44c8-a1b2-3775e3ba00d9@suse.com>
Date: Thu, 6 Feb 2025 13:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/mm: Introduce per-arch pte_attr_t type for PTE
 flags
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <2b7f3e29fc1790978e2f615ee634f3a84bc340c9.1738789214.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <2b7f3e29fc1790978e2f615ee634f3a84bc340c9.1738789214.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2025 22:02, Shawn Anastasio wrote:
> Xen's memory management APIs map_pages_to_xen, modify_xen_mappings,
> set_fixmap, ioremap_attr, and __vmap all use an unsigned int to
> represent architecture-dependent page table entry flags. This assumption
> is not well-suited for PPC/radix where some flags go past 32-bits, so
> introduce the pte_attr_t type to allow architectures to opt in to larger
> types to store PTE flags.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
> Changes in v2:
>   - Drop Kconfig option and use `#define pte_attr_t pte_attr_t` for arches to
>   opt-in to defining the type.
>   - Move default pte_attr_definition to xen/types.h

I'm unconvinced of types.h being an appropriate place for something mm-
related. mm-types.h maybe?

>   - Update commit message to reflect that this change isn't strictly
>   necessary for arches w/ >32bit pte flags

I can't seem to be able to associate this with anything in the commit
message. The comment here to me reads as if this was optional (but then
for arches with <=32-bit PTE flags), yet in the description I can't spot
anything to the same effect. Recall that it was said before that on x86
we also have flags extending beyond bit 31, just that we pass them
around in a compacted manner (which, as Andrew has been suggesting, may
be undue extra overhead).

Jan

