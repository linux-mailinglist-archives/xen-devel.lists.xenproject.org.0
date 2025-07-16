Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EAFB07B33
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 18:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045499.1415615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc52M-0001kU-S2; Wed, 16 Jul 2025 16:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045499.1415615; Wed, 16 Jul 2025 16:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc52M-0001h4-PK; Wed, 16 Jul 2025 16:31:18 +0000
Received: by outflank-mailman (input) for mailman id 1045499;
 Wed, 16 Jul 2025 16:31:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc52L-0001fl-0U
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 16:31:17 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b4f4b0e-6262-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 18:31:16 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so31878f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 09:31:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de42aef84sm132671935ad.71.2025.07.16.09.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 09:31:13 -0700 (PDT)
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
X-Inumbo-ID: 4b4f4b0e-6262-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752683475; x=1753288275; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dcEuRD8WIRPZp7REvSMahrWK8EZHyEQDAtE3THa+Hww=;
        b=BMWE22Ah4g7QySq5o7q9DfoC68bCsdrmRa3UyFA4OzQwdBAVJabYCT8O1pVf/dmhk3
         1vWwfJxR1ce56UuarVIwGO9vuk0/SdbWK397lDsygzHLLOws56T9ItByVLmXHZDOIDbY
         H90crVE8WC6628Pl2m58nCftCfLb3vjNLYvSLZdCZSB7vkUyeWURM5VMOu6VT2nwxuUr
         /o98AWVpEm/qNGIiWllkLZsP1hrqpOCPfQepjGT6uySlOAZ27SKi+mAQkII4uqexrB3r
         BNonIfm7CAOZdR7T/EVNlNdVpcOcdXOuTz7EeN2jfOb11vMxbjvi3b+DDN7YWi6SYpur
         KQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752683475; x=1753288275;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcEuRD8WIRPZp7REvSMahrWK8EZHyEQDAtE3THa+Hww=;
        b=XaDAckX/PGJNvZdlYvzJz8ochNNz/Zc121fU3YtP8UqRmPwCkuScQVMvvhVLrUuPOw
         EzUNJ538qISER7I4OgNoTioWFckrM/LMu00jTg0t6swxbZd7pDY4p0pZ4KJAsSDOm/oB
         CLorPtrjlcpWkr8xnCKVG/RltjLOtj49/4kMsaeTWYJgp0pln7vhaovtpKx7jzVr3UQ/
         HORa7Z4/AGwg7p4up4qQo9uKgkjRd/Pl/cvy1T3dzMHfAY3/xvlM8zg+D4B6xxHZ1lWV
         cBkKCAwZmWswCRyQNMyHtgi5dy5tmNd7gsvOA83sinztUnJ3vd4I6lPmCw755269QWRu
         /nug==
X-Forwarded-Encrypted: i=1; AJvYcCXPk/VxDcZgf9fbEajI/eEez/jEqWhZQsp2C7hdb3LVPITAGo6oXpgyoGi9pm3tT4hqXyB+JEu86ek=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUOK93MNDcFk4mu/O29SJuVeZ7KsFtUASAQH2464sTzSKlhtrD
	3D5+BSwIT7Fekwq0Zfo+Stg/LuMLh2boUwPbi4rYUVY3yy0zEVtSQYXBsNAO/sP5eQ==
X-Gm-Gg: ASbGncsTKppIARoLOHEwG6U1TjYql/EmB+sDliY9ff7OYg6kp32SUXRp9HtgyshCAHs
	r6/u/NWgxlVBmXoK2OKXwGXVb8MWMvTdL9EOK0c2ypSikK8zMKeu0SvXiY3fvdPmQ0QePGi85bu
	bwm9czK+AMG6FC10+KDt4LL47W+kEddJSqbz0H+X54UWjENM9WSHl6rrj1RVjiJBSKMKZ0nWbzh
	opoz3mUARVwyO/FNf42XzuKRwKtg0A65oWq+XJr2Ymsz0X07Dlwp23SAy6+BI9+i2sGET88vGpH
	wbzHO3jtkA8ddx+A3x8l+jMFudneTMku2Zfc1Ht97/P/SXe1SdGUoORPYf62gFWHCF3/5JgCEZ8
	uWFe7UrL4u6bYIfPpNq+pPJzYsDSK5h3u4eotL8iCJyqGpVamM27EK8KiHcpqre5Qdy2wArv5gI
	ldPlFeVww=
X-Google-Smtp-Source: AGHT+IFd5TQjKBytrnhM8J5fLNGXSXDg3aMHQAPNYpHPH8alAIHlA3ZOa4PHigcNogwe4vZsSZoeRw==
X-Received: by 2002:a05:6000:658:b0:3a4:eeb5:58c0 with SMTP id ffacd0b85a97d-3b60dd4f752mr3831575f8f.20.1752683475337;
        Wed, 16 Jul 2025 09:31:15 -0700 (PDT)
Message-ID: <4bffb6b1-ebe7-444f-905d-092e69a2d8ef@suse.com>
Date: Wed, 16 Jul 2025 18:31:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/livepatch: fixup relocations to replaced symbols
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250716160007.92461-1-roger.pau@citrix.com>
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
In-Reply-To: <20250716160007.92461-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 18:00, Roger Pau Monne wrote:
> In a livepatch payload relocations will refer to included functions.  If
> that function happens to be a replacement for an existing Xen function, the
> relocations on the livepatch payload will use the newly introduced symbol,
> rather than the old one.  This is usually fine, but if the result of the
> relocation is stored for later use (for example in the domain struct),
> usages of this address will lead to a page-fault once the livepatch is
> reverted.
> 
> Implement a second pass over relocations once the list of replaced
> functions has been loaded, and fixup any references to replaced functions
> to use the old symbol address instead of the new one.  There are some
> sections that must be special cased to continue using the new symbol
> address, as those instances must reference the newly added livepatch
> content (for example the alternative patch sites).

This is what I was fearing, when you first mentioned the problem (and the
plan) to me. What I don't see is why you do your fixing up regardless of
relocation type. Relative relocations within the payload ought to be fine
to not override? At which point some of the special casing may already no
longer be necessary.

(Later) Except that if code uses PC-relative addressing to determine a
pointer to store into some struct, that'll appear as a relative relocation
type, too. But then you may have a bigger problem: When referencing and
referenced code are in the same section and in the same translation unit,
the assembler could avoid emitting a relocation altogether. You would see
nothing to fix up ...

Jan

