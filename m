Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077579B784B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 11:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828564.1243493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6S0g-0004Hi-2t; Thu, 31 Oct 2024 10:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828564.1243493; Thu, 31 Oct 2024 10:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6S0g-0004Fo-0N; Thu, 31 Oct 2024 10:02:34 +0000
Received: by outflank-mailman (input) for mailman id 828564;
 Thu, 31 Oct 2024 10:02:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6S0e-0004FG-HJ
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 10:02:32 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cfe3116-976f-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 11:02:29 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43163667f0eso6158255e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 03:02:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e734csm1622111f8f.60.2024.10.31.03.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 03:02:28 -0700 (PDT)
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
X-Inumbo-ID: 3cfe3116-976f-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNjZmUzMTE2LTk3NmYtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzY4OTQ5LjQxODQxOCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730368949; x=1730973749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0SWslnV9luPAdTz71bVyVI7Tj1sZxXCCqRyOQgNEpD4=;
        b=aewqf/y1P5etVAOOt9LFKYsigpu8WBC2AxGHuMl+QvEWinGPGaPikDoEZoApikNqLK
         j1x7JV65JyB6BFcnFoX+n4mfTl3b3eguq+1qPqq1IiqVl8s+R5cFa3f797cOP86K2IHj
         /+h74jJUFXa4e8KmFUn7P1LcpBx9alu9dHiJa8BbYzSK89lSRSB1mk1pnwqRm7SPu1OJ
         iURK2Qy+b86uEH2I3feWeNQGPj0AGQCvXeew4KlbBRuSsK+rQqfwdL3B+rOxLoueUfGj
         3Mk3lmfZ+XOzlaXKhegvDRsoegX1rZWSrNKFJZjjW/19DX7x7KDvFWf1QRp+dPyWhzz3
         yYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730368949; x=1730973749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SWslnV9luPAdTz71bVyVI7Tj1sZxXCCqRyOQgNEpD4=;
        b=mBgNMbPozI66RVwkKHHdxGLRZvPoduMAfFXVwhwMalydEShcI4lQUBiUjNijGDq0+T
         6Ie3dOUp9QaxiG1cOJwtWUg0gLijppYkwqZ4nKvioaSKdMAjaxpGJeZlYX0RHzFG7TMD
         AVOHq5NR+Fglr3lXUW6XXnw+0nAi6Y/Il2sxlw0qXOArQo4r/ilzGhcC4cpoCaXQPucQ
         dl6SyFOddZzCp42FjONH1DJ98t8eKrjdd6VoNK2uQmrCPF2+TLqAp1MlUmtykT7Tli4J
         cGZa5yTwGAP1d22hvbtYwbxH0Yb+okXDW2fPnd28TwlYYvZ6CyivixIbzhKzpDgwyRjK
         W2hg==
X-Forwarded-Encrypted: i=1; AJvYcCWOwWkzJbqgGM5l+NpWiMIg0m7ut4MnqWpZVCSaPtoVgV+1lEPisspCN05Zj9T4+Ne0mzjP4IAfOKo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzX49FWjEbjGJJJNhqfGPbYbu5Cye3RIF4OeNjjb2eI4SJySiaM
	oB1LOjPr7fd1mnlnXiFUZt4Ym3Stai+3VFjQkIPUdowU9+W3QpxLj9DWHfzYXw==
X-Google-Smtp-Source: AGHT+IEuVytajJr/S/oOcEqAToZ6eKdRU5tuO7rNZuaU6t0xJeHUeZg4cF0UILJzkokz4L/65ez3kw==
X-Received: by 2002:a05:600c:3488:b0:431:5ce5:4864 with SMTP id 5b1f17b1804b1-4319ad36982mr136371965e9.35.1730368948859;
        Thu, 31 Oct 2024 03:02:28 -0700 (PDT)
Message-ID: <701da657-a709-4c2b-908f-2bfe193948ca@suse.com>
Date: Thu, 31 Oct 2024 11:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] Config: Update MiniOS revision
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20241030180332.2726909-1-andrew.cooper3@citrix.com>
 <a76d84a3-d150-4836-8ad2-ee0eeabe557b@suse.com>
 <c84ef564-98de-451d-af4e-04e824231ea6@citrix.com>
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
In-Reply-To: <c84ef564-98de-451d-af4e-04e824231ea6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.10.2024 10:46, Andrew Cooper wrote:
> On 31/10/2024 9:25 am, Jan Beulich wrote:
>> On 30.10.2024 19:03, Andrew Cooper wrote:
>>> A new branch from xen-RELEASE-4.19.0, for now containing commit
>>> a400dd517068 ("Add missing symbol exports for grub-pv").
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Juergen Gross <jgross@suse.com>
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Julien Grall <julien@xen.org>
>>> ---
>>>  Config.mk | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Config.mk b/Config.mk
>>> index 03a89624c77f..aa3d5843f1ed 100644
>>> --- a/Config.mk
>>> +++ b/Config.mk
>>> @@ -224,7 +224,7 @@ QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
>>>  QEMU_UPSTREAM_REVISION ?= qemu-xen-4.19.0
>>>  
>>>  MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
>>> -MINIOS_UPSTREAM_REVISION ?= xen-RELEASE-4.19.0
>>> +MINIOS_UPSTREAM_REVISION ?= xen-stable-4.19
>> Wouldn't we better use a hash here, like we do on staging? There had been
>> cases where it wasn't safe for the used commit to move "automatically", and
>> the same could occur on a stable branch. The hash would then be replaced by
>> a release tag when a release is being prepared (again like on staging).
> 
> It will only be getting build fixes, not new content.  So it will be
> stable-enough in that regard.

Hmm, can we really expect it to only ever be build fixes, not fixes of any
other kind (which then may have dependencies)? Jürgen, Samuel, what's your
take?

Jan

> Otherwise, its hedging my bets as to whether other changes will be
> needed before we cut releases.  All of this comes from the fact that
> we've got a couple of rolling distros which end up up-to-date even on
> the oldest trees.
> 
> ~Andrew


