Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9CE9508C7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 17:19:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776411.1186570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdtIf-00028x-93; Tue, 13 Aug 2024 15:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776411.1186570; Tue, 13 Aug 2024 15:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdtIf-00027C-6P; Tue, 13 Aug 2024 15:19:05 +0000
Received: by outflank-mailman (input) for mailman id 776411;
 Tue, 13 Aug 2024 15:19:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdtIe-000276-I7
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 15:19:04 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f250aff-5987-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 17:19:02 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5b9d48d1456so2364492a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 08:19:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd190ad278sm2979959a12.25.2024.08.13.08.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 08:19:01 -0700 (PDT)
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
X-Inumbo-ID: 5f250aff-5987-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723562342; x=1724167142; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eZ/5L892y3kunmVjf8Ugby3F+fwY654SOA/cA+W8thY=;
        b=AIHIbwkD4nfQvnozxmevoilZmHKrSxBmRmsK9PljIB2N+tuxoOTljUc4ZzgCw0DwbM
         iNtTrf4lIZB2CFN6eva6SqMfRHl2nXOGlZWK9Zt6BnOSLrZM4j8mc7qhfWk6YFwCYD/S
         f4OwDEc9dcmNDyMYCwT7CMHRY/YmpQpavxyMzwcbYNR3Lihe+3eRE5VEn74mRuXavXmM
         JJDuyo0gkg+w3NUDjj+mzt1uSpXrv5sVHTPQcI5zQGR7ziaHCy662CXT21nO+qyIkzOB
         iTczaHn7ljCGn2Er0zX6EyQeUFuavlE/xrHO5EUEDBC7LfQrWXllnYWpanyGK8nQvIqR
         BjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723562342; x=1724167142;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZ/5L892y3kunmVjf8Ugby3F+fwY654SOA/cA+W8thY=;
        b=o0XTAR76b/1oCGhcKcvj/O5BfTdNSaF524/YR4J7i55imkIub/N2qI2IxYLKM0Ul7S
         c8I0gDFS9eD2WuS9PjepWgr6PV7HocoEf+8g5e53irlD0KYkXutUPCxYYK8ikqo0AcPm
         jT5xylT42uMPwvF37xVqGDXy7K+QVM3UJqGQUd/ACI/HER8R9+qx6N+tG06bsGERr1fg
         LnrLWoeP4R3i2UJOh3daRp5e5rNVyYtqL6mTlVeMHKpRJ+lYM0ppcsbef1ewkYRo3B7F
         ypjB576mhHhCcVhErvQXFbcZeuGKRFbxd0vwY+pC6LfSOQVmuprURwocLyVCh7OoHTcC
         jOQA==
X-Forwarded-Encrypted: i=1; AJvYcCUVTB83/s8T37sJ787xRfAwD3BcYAkTyXP6B/zH9YEEJAueypZ3bXMVpzHCH19+CZ4vcGMRUHXsvzZRkahaN1YtqcWDDrc35e9Em5rrMuQ=
X-Gm-Message-State: AOJu0Yz4Lkt2iAduwjUQnTjJufGPdSfVp+YTj72scxZUkYTw4V32qRl5
	1VZX8E20sSaNvV3q1SvpTLX43Iwx/yNeDNbF4FrhIlf3ZV7vAttDWl5g2/HUlw==
X-Google-Smtp-Source: AGHT+IF1tA5UubjX5AWzIoy8z2Yk3PqurQgRzJTY9GD/pe3Ei9t0E7T8dZr0hScfDEfCZQUueMewZQ==
X-Received: by 2002:a05:6402:354a:b0:5a1:4ca9:c667 with SMTP id 4fb4d7f45d1cf-5bea1467722mr39589a12.11.1723562341857;
        Tue, 13 Aug 2024 08:19:01 -0700 (PDT)
Message-ID: <4be03d64-ad6b-4367-b1b7-d54c3ac5ca37@suse.com>
Date: Tue, 13 Aug 2024 17:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: fix UB multiplications in S/G handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7c4cb0ee-cddf-434a-95d9-58cec0efd976@suse.com>
 <56e05b29-0fad-426b-bfec-60080e83b3ca@citrix.com>
 <e4f923c9-5b30-4876-bcf1-7a229b59fb21@citrix.com>
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
In-Reply-To: <e4f923c9-5b30-4876-bcf1-7a229b59fb21@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.08.2024 17:16, Andrew Cooper wrote:
> On 13/08/2024 2:19 pm, Andrew Cooper wrote:
>> On 13/08/2024 1:43 pm, Jan Beulich wrote:
>>> The conversion of the shifts to multiplications by the commits tagged
>>> below still wasn't quite right: The multiplications (of signed values)
>>> can overflow, too. As of 298556c7b5f8 ("x86emul: correct 32-bit address
>>> handling for AVX2 gathers") signed multiplication wasn't necessary
>>> anymore, though: The necessary sign-extension (if any) will happen as
>>> well when using intermediate variables of unsigned long types, and
>>> excess address bits are chopped off by truncate_ea().
>>>
>>> Fixes: b6a907f8c83d ("x86emul: replace UB shifts")
>>> Fixes: 21de9680eb59 ("x86emul: replace further UB shifts")
>>> Oss-fuzz: 71138
> 
> It's too late on this one, but it occurs to me that we probably want
> 
> Link: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=71138
> 
> rather than an abstract Oss-fuzz number.  The bugtracker entry becomes
> public after 90d or when ClusterFuzz thinks we've fixed the bug, and the
> full link will be more useful to anyone interested.

I can try to remember doing so going forward. Let me adjust the one that's
still pending right away.

Jan

