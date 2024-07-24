Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8203C93AD91
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 09:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763842.1174181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWWsF-0003Hj-L0; Wed, 24 Jul 2024 07:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763842.1174181; Wed, 24 Jul 2024 07:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWWsF-0003Em-H7; Wed, 24 Jul 2024 07:57:23 +0000
Received: by outflank-mailman (input) for mailman id 763842;
 Wed, 24 Jul 2024 07:57:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWWsE-0002dO-Dg
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 07:57:22 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5abad9b7-4992-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 09:57:20 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-595856e2336so1083774a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 00:57:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30a4d7127sm8647432a12.3.2024.07.24.00.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 00:57:20 -0700 (PDT)
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
X-Inumbo-ID: 5abad9b7-4992-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721807840; x=1722412640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c2f4P9QdyyPTeUIlYdGXbyUGoQGCVV0wq54e53flh5A=;
        b=DLj+6sfVRPTbrH4CWppblUPTyOVoVsFnwTqUfUBsW9E06ZzkClnBmFkvWqxUzUafZe
         eCWzGJZhi5DPWqQdxlpwOZU/IxBJo+KXB96TbdOBAdSarQvxttoM/A0+j//8oyeYINQM
         8CX8zsKLMLM4o0SDw3B6XEib0YnvxhIFLl+aL1AN7tRL3DZBjnyhuTNKsjSuPNOscXjn
         xWO5AcfIDF/I1t9y7OPhIbZRE30S/mPu1nmoMtfEtMtreEp1zSw+KqyRYSMbblTEj1Ct
         cYgbDhiUStTZrhZMpFUakV0DWGU/mMWF9Qqm8VqXCHXsi/MSDNQ6MHbaLsIUyg1ZkaYl
         OpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721807840; x=1722412640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2f4P9QdyyPTeUIlYdGXbyUGoQGCVV0wq54e53flh5A=;
        b=KlhTU3/7+KWV6rZRhPTri3AnyV/u6O64iiET/BRGAgmGJWPv/xhhcGbzetVF/Hp7lM
         j9CHoTC1vdIYEPNX9qPZXCGFG5dlV7f1UHptbGC/gcNtIFcit2Z1TmRHBrIp8s2sNi8o
         781PTwDf3F3Pv0nT4cV81QV/aIusUiZenrMoZWcPT3oVyservti5wC7/ZdfosJG3YKrW
         NtCK+pyxqqjoyse8aXfM7J/xibAfPjjV5nh8CKlTEf67VorYZCKN+3xfmmm1DYhUWq6G
         FaBjJ/L9B9SEHaxhO8S9J24z/cURRF8+UnGsfn0/0H6pWGNgLAorrwNA8UN3hr2gJEb0
         z3fg==
X-Forwarded-Encrypted: i=1; AJvYcCWuLoSx5kYRKlf298u2XT7Yv1qB0hSJvOBmHVOfxZ3fOwyw2788Y7eGfo/tJWfnrG14U4hj7WpKOO2NZwRznuY0KkM1ekbbdLT/F0bMLs4=
X-Gm-Message-State: AOJu0Yy5mx5x9vZ+XXwwNH3jJd7+mSWc15FPAYS202JiC0xDBVYbyWUK
	Y5kYDxBkbelZ6+TizfTqEtyQWJ2cNdoHWtWavvbyeeI9Arm+3KTMs1LVmuU4sSwMYOr6pNew99E
	=
X-Google-Smtp-Source: AGHT+IG9wbvZyw14p9ccoNq5OAXVIuwe+NW6POFgu1pfiPdtSK/sYsgiZmLKLuB/PkYE8PFkZNs4sw==
X-Received: by 2002:a05:6402:2483:b0:585:412f:ff8f with SMTP id 4fb4d7f45d1cf-5ab19dccf09mr1240583a12.4.1721807840360;
        Wed, 24 Jul 2024 00:57:20 -0700 (PDT)
Message-ID: <68b1f03e-505f-43b1-8203-272508bae52b@suse.com>
Date: Wed, 24 Jul 2024 09:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Rewrite apic_isr_read() to match
 apic_{tmr,irr}_read()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240723211202.267212-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240723211202.267212-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 23:12, Andrew Cooper wrote:
> This allows for marginally better code generation including the use of BT
> rather than SHR/TEST.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



