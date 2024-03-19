Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B822880100
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 16:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695458.1085231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbgA-0004aE-03; Tue, 19 Mar 2024 15:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695458.1085231; Tue, 19 Mar 2024 15:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbg9-0004XY-T4; Tue, 19 Mar 2024 15:47:05 +0000
Received: by outflank-mailman (input) for mailman id 695458;
 Tue, 19 Mar 2024 15:47:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmbg9-0004X0-8N
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 15:47:05 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef25eecb-e607-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 16:47:04 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-563bb51c36eso6677625a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 08:47:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n8-20020aa7c788000000b00568d7b0a21csm2658326eds.61.2024.03.19.08.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 08:47:04 -0700 (PDT)
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
X-Inumbo-ID: ef25eecb-e607-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710863224; x=1711468024; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dmu57qOCURrF2Or+9P0KP0qRJFn8qN3UEakHtXqfjX4=;
        b=UFgz2+Pot8ETF8V++FmJJu9TIq1Bh380KoHx4pOjsc7lZHKDvGJOiQ4rg8Fuzi94Yu
         iG6516sxUeI8FJBGGcHzULt0u2cJbXHukjGOZ9KC+K0bcDpyLpm2ujgdZPl7JuZ56KrG
         CTlbHXkv6CtbuhljQB4oN92pc4NyGNlMoTM0KjfKIMcopRVk+OvW0q0Cr0SFDZwD+DTl
         GGFfU6oglKyh5wvsikv6yPsShM43/tW7m2VIxz9+OyeUS7JBXT/tsF6nHmfjdOOs+cHJ
         8tUY4Y5FyswarWDT7SHdvRdiHL81lsZub3LQu4Rmlm2R055v2ENPQ/SiFXqNZNnzbI53
         g/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710863224; x=1711468024;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dmu57qOCURrF2Or+9P0KP0qRJFn8qN3UEakHtXqfjX4=;
        b=fS5TK605CUBlS036zTT3ppFcLCOJuym3BkC4OJ7AFYH+476ZV2WHgFQuAXwB2/cgMS
         T/EkJV5RvWMaEDSttqg03UJNGmEOtc7N7w44Rh4+/cbGJU8qybqMFJlNeFbed6cNJUjW
         mkn49WMPiOcEjNeaq7SMlg9dOR3+XWgUFKFoZ3ZvHknManw1aYo1qUJUqBg2GuBgzA71
         aGK09ZdmDM1G6H9wrsp9K2EF1n0QXencSfnhaiS42GMyx0DfX07f2t/tAmDDWsSixxjd
         2/56tijy/frpmaBmghYG8ULHM6s3kVM85ozEKaYQPj+b2jjhUg8PjnzKwgA6/pxMUA1d
         kveA==
X-Forwarded-Encrypted: i=1; AJvYcCUH62UkSLGvdQFObZBCuWgRUFjWxy/TtgqjkNGyO2+BJoGsOdat52iWzpKf9LCjcDgnM0tLT6J/GIRP1YH3bl2VHBemKMNOvKQf4H5e1GA=
X-Gm-Message-State: AOJu0YzVOMhYI2HQYJ1gY4SZhUI/uKYgL0oLf1FCcmHs968Lha7iHDP5
	DRjW+gSAjnn3NcTIgkJ9O78oXEdfVNRpfOMFMXxHnKNpb+8dQhHZAcTMCeZ2Jw==
X-Google-Smtp-Source: AGHT+IF10x037VIX4G5h3iEg38RKQHYLQdOZp4Ud8Af+KnYgkYpnN/Ew+iEa0FVFyfuMmco9NeSn2Q==
X-Received: by 2002:a05:6402:28cf:b0:568:cdd8:cf60 with SMTP id ef15-20020a05640228cf00b00568cdd8cf60mr2478291edb.8.1710863224278;
        Tue, 19 Mar 2024 08:47:04 -0700 (PDT)
Message-ID: <601540e3-c3c1-4dfc-98f5-aac846ab5d59@suse.com>
Date: Tue, 19 Mar 2024 16:47:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/14] xen/page_alloc: introduce preserved page flags
 macro
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-9-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240315105902.160047-9-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 11:58, Carlo Nonato wrote:
> PGC_static and PGC_extra needs to be preserved when assigning a page.
> Define a new macro that groups those flags and use it instead of or'ing
> every time.
> 
> To make preserved flags even more meaningful, they are kept also when
> switching state in mark_page_free().
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



