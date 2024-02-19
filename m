Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72D1859EC7
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 09:50:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682711.1061831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbzMG-000393-12; Mon, 19 Feb 2024 08:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682711.1061831; Mon, 19 Feb 2024 08:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbzMF-00036u-Tx; Mon, 19 Feb 2024 08:50:39 +0000
Received: by outflank-mailman (input) for mailman id 682711;
 Mon, 19 Feb 2024 08:50:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rbzMF-00036m-3r
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 08:50:39 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3f49ec0-cf03-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 09:50:38 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4126126f4f4so8019355e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 00:50:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k10-20020a7bc40a000000b004101f27737asm10590519wmi.29.2024.02.19.00.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 00:50:37 -0800 (PST)
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
X-Inumbo-ID: f3f49ec0-cf03-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708332637; x=1708937437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0zywQZWYhohz8TBjhUWm/mnYAf+BD4wOyOCATdZphKw=;
        b=fb3lziAfUqX+SzHhxnpAPG4UK+Lq+VcGrRAdvU8NiQ+DkXvn9abnLpZuyACa8xwBWP
         4mT/fCv4B3dzaMvQ2vT8yoUAzacQwdqmEekQ/mQ4XIBhHQVVXVtJBRtnN8G4Rk8+88si
         +k+abehnaZiT1UBrlS6F4y5NrNJlLWNRHhFFkNPm/iK/k5q14Hi2/kRscb5LuA137GId
         6VLcf0xCfWZ6vYcBXV6Nzq6LdiA+81sAHkR5fK7VqLAzCOdkmNjN+ZkaKn4/FsN6bQmB
         lbRkqzd7p90dKLg3eTkVwynLajSebcbfNTATYqa/qKIpxsKVm7lAk0fQdnozG/tv3q87
         7REA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708332637; x=1708937437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zywQZWYhohz8TBjhUWm/mnYAf+BD4wOyOCATdZphKw=;
        b=WuvIXVkA3FuTjuQfEPKFLjP4+xM372002FWT4mCOcm+A5k3EO91ZptB0LQ2s0N7XXC
         Mka3+9BP/0kDUG8P4jMJeDqb7Hd70ZExlfe7F0j9pbBJVUtrErS2KpxMjXDaljHBSkdQ
         N42i8iMEv3//7tIcAkteHjP+Hfzeyvp5Xt+gYgR7Q18IKvMYHKkea4Hmy3FUXAeOKCtu
         LMzQ73JUPXCtc4idinZeX8/lMj5VyiiP+4a11ZG69vbmMGz5mDkTzzBfxK8qrdHk0xIA
         sCxPfmgwYsxfNqd9n77MAQmAEW0e0JcBhvmjdOvQglR5Lhrvfpqo2J3FvEgAmLpm5KR3
         r41Q==
X-Gm-Message-State: AOJu0YyNpp5Apc1GyMEbEng1bL5ac0uWgU5iSDYIK4ADRh/A4pOYUjCH
	kr3LCX2X5F27FeEgpwPN1HCnmuaLnfsqGhW9qgDspGS8Ay9Lm2To4N7+ZHiupA==
X-Google-Smtp-Source: AGHT+IEmMOeDgwSZj3suCYP5BYaJn1fgNrLyKZwvdcVEUtmPcYKi4Jt8ZKX/mDZ1BamIkXU0xYYoyA==
X-Received: by 2002:a05:600c:4fc3:b0:411:a70e:3d20 with SMTP id o3-20020a05600c4fc300b00411a70e3d20mr8674827wmq.1.1708332637641;
        Mon, 19 Feb 2024 00:50:37 -0800 (PST)
Message-ID: <9710b68e-80e2-4cac-9f6e-d52a777fb9a1@suse.com>
Date: Mon, 19 Feb 2024 09:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] mm: add the __must_check attribute to {gfn,mfn}_add()
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20240214103741.16189-1-roger.pau@citrix.com>
 <20240214103741.16189-6-roger.pau@citrix.com>
 <CA+zSX=ZZBFnsnc+wtrcB3vC3dMHQS=ZG8zjUdiPeCdFZJ12E4w@mail.gmail.com>
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
In-Reply-To: <CA+zSX=ZZBFnsnc+wtrcB3vC3dMHQS=ZG8zjUdiPeCdFZJ12E4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.02.2024 06:07, George Dunlap wrote:
> On Wed, Feb 14, 2024 at 7:42 PM Roger Pau Monne <roger.pau@citrix.com> wrote:
>>
>> It's not obvious from the function itself whether the incremented value will be
>> stored in the parameter, or returned to the caller.  That has leads to bugs in
>> the past as callers assume the incremented value is stored in the parameter.
>>
>> Add the __must_check attribute to the function to easily spot callers that
>> don't consume the returned value, which signals an error in the caller logic.
>>
>> No functional change intended.
> 
> Just thinking out loud here... I wonder if "mfn_plus()" would be less
> likely to be misunderstood.  Catching this during compile is def
> better than catching it w/ Coverity or Eclair, but even better to help
> people not make the mistake in the first place.

To me while mfn_plus() would indeed be somewhat less likely to cause this
kind of confusion, I don't think that naming would entirely eliminate the
risk.

I was actually considering to add mfn_inc() for the common case of
incrementing by 1, yet I can't see an alternative name avoiding the issue
there.

Jan

