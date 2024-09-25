Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A691985603
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 11:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803647.1214341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNx3-0006As-4d; Wed, 25 Sep 2024 09:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803647.1214341; Wed, 25 Sep 2024 09:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNx3-00069M-22; Wed, 25 Sep 2024 09:04:49 +0000
Received: by outflank-mailman (input) for mailman id 803647;
 Wed, 25 Sep 2024 09:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stNx1-00069B-Sb
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 09:04:47 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3673de85-7b1d-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 11:04:47 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso1339380a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 02:04:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f79ddsm187080466b.158.2024.09.25.02.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 02:04:46 -0700 (PDT)
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
X-Inumbo-ID: 3673de85-7b1d-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727255086; x=1727859886; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bshcQMb8fburC5dvu4hzJ9rZCJfcB2KXQQKXfUak3fA=;
        b=IDLTXjVfNycz6Q5Ec9TTRbWaGjbOybbzWqk1E+i8JG4CuSdotGzXP8ynxid0OsJwXc
         5fh5OYL8ysPco92q3wpEjXpTNanQ2Mim3QxJR3/rwk3e1MWYj2gWNdNdCjIWF85XzIak
         X0vriBZQE6LsZGAzPQT9W+gAhODTY5NU55V02E+iO4c7hq1JvczaLAFlKJGWNVv4Opun
         k8B6EYOnvEHajUtDMbeHdI0k7ssveeGmFFjGJgcz3WlpsdljBNxXEwyIqn4IraOvh9PV
         rJbbLhqiKXhb27MerOxOUrEjFJDB7rTKLnUeXhfVlL9jPsDaXOWiyBtJYt1NTFgGcB7C
         5Wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727255086; x=1727859886;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bshcQMb8fburC5dvu4hzJ9rZCJfcB2KXQQKXfUak3fA=;
        b=WVcHkPbRr24Y+LP8YptaY0y9XBNuJMLDDnt/xhjZeOvUXNOMQEJDZ/XG5rpW1Ii6z5
         vnAl9D2daAlDZgAsbMCPGD3IiPHyz/tdVzwXz1DtF8O3OhwfufHGHjJlSOEUAKsS/lXh
         5MAKgmn6jIqmCeArk6YRW+H+hYT2i9JO+X2hHGZ+eN2NqsYrTnCCnYsSJCwU7DTmQvYy
         YaGEKd1zg6hclCoOVZFuHk0eNbDc/Gdx0vfl6ExLCJo4a78mEhYG3rDBQCd06iGTiXwY
         JUrVHs3TvOuzlynmNgZmNboSInn3Hq7o4VFV4W3Nc9c2z642zopSRWi8MLHTfVttwzVC
         iuew==
X-Forwarded-Encrypted: i=1; AJvYcCXhQj7W+u8cHjEYPqWj71GjaAgtxRQQnHL92p2ezcpMjbO7AOMf25TfnRy7N81k25CuD0ANPJyYe/0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1g1MKLZ3qLPBhvaPNjxrPfmeHqPDzoCjpA76rhmXizVH5vRf4
	iRE41B0pgdqX8HTl5NJHjkh/U02L+aFa+wrrE3BXQxILTmaOWWr86okphwS6YO5EtzZbTkqywvs
	=
X-Google-Smtp-Source: AGHT+IGo14aKbRMA2iS5x+q0dHt4Wt2/lEwkyAJmMK2TLqtIj0jtBr2JaIV3pMQ+SJRxi/6CXfhSiA==
X-Received: by 2002:a17:906:d7dd:b0:a7a:acae:340b with SMTP id a640c23a62f3a-a93a187744bmr188701166b.31.1727255086487;
        Wed, 25 Sep 2024 02:04:46 -0700 (PDT)
Message-ID: <b34e0580-e5e1-48cd-94b3-f685562447fd@suse.com>
Date: Wed, 25 Sep 2024 11:04:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] x86/alternative: build time check feature is in
 range
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-7-roger.pau@citrix.com>
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
In-Reply-To: <20240925084239.85649-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2024 10:42, Roger Pau Monne wrote:
> Ensure at build time the feature(s) used for the alternative blocks are in
> range of the featureset.
> 
> No functional change intended, as all current usages are correct.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I'm struggling with what this is meant to guard against. All validly usable
constants are within range. Any unsuitable constant can of course have any
value, yet you'd then refuse only those which are out of bounds.

Jan

