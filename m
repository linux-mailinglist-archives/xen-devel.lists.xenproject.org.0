Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A19E8B0870
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 13:40:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711338.1111223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzayb-0007yR-AQ; Wed, 24 Apr 2024 11:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711338.1111223; Wed, 24 Apr 2024 11:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzayb-0007wF-7X; Wed, 24 Apr 2024 11:39:49 +0000
Received: by outflank-mailman (input) for mailman id 711338;
 Wed, 24 Apr 2024 11:39:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzayZ-0007w9-R9
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 11:39:47 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58663daa-022f-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 13:39:44 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41af670185fso6414585e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 04:39:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k41-20020a05600c1ca900b00417e8be070csm23718703wms.9.2024.04.24.04.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 04:39:43 -0700 (PDT)
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
X-Inumbo-ID: 58663daa-022f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713958784; x=1714563584; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7KIuCADTkXcjbasYRUoemsQiJhdGyC9MiTNidz7eh4=;
        b=TPg5dJaSBEC8xQyHqU9eiGFvdRy9D8RE64w1sssuu8lc+7UtzzBCLppflnQ/0Ccsqi
         VZc/nXg8V5GDjQ9ZFwzVmPqf03OBlGM9m5OYA0HvAiB7gb7k7zWz3jeGwnpSdiAKC539
         5lkqr+n/T9FUcGlWLNmkgJSTwuTRromrxtOE9iz3yRgH1kzadmG3FkT47jDPe1Sy+el9
         t7TLfLNmzWOnSWGBE8+vZIbMgJYAlOGjPrrB5CoyW04cjDCc4pGpDAc2a3H2MBoI7NrF
         xP9FeVbSAZZkvqHGwKzDqRo/H0/iA5PKYnsNrFdlrT30vE8U+SdDd2guyzPFt8oBFm9s
         P+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713958784; x=1714563584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b7KIuCADTkXcjbasYRUoemsQiJhdGyC9MiTNidz7eh4=;
        b=Xc7FnZwZo77bq0N4TWf8mBpSl3s31LMdJ5HmuuWdzfPfJJrMyqnWIjijPkHWJGGobz
         Do2nOaKk4YhWYCKuJBBNVBAoR3+er8BBy1y+WWh8+UceEF/frbn/HpIbMun472L7LluI
         h4HaeC6WsCFFN0yn72CnJ5cKmQXihEiDmsDKjOklp3zmapgWBQC1BJO/6P0KgyKfBPgy
         N92DJPDOfczj4qUD95Rac+TlYzYQusqJsZ3FgtcXVDmr7UeB/iGHVncw8E2+tGH7AYTP
         3BioD/cfDxdUhkGjYnO/zmXjX9ULI6N14+1pDIc3J+lQgHkueo7GQKllRwRKcxOuHFit
         BAlg==
X-Gm-Message-State: AOJu0YyOY4GD8Q1PUyevhbwTMPBknxeajaQ5Q5ERJDY4qIWd2usNCLgx
	w6q8Zm+A6JiF3shh4YPDpwTRnkvnduZuFeBF4LoYPic6BYVjoqHVKL3BTRAvdw==
X-Google-Smtp-Source: AGHT+IEJ67o0auzetnAd6o/S6H9AUNUanhe40CAWvEjndw50gD0AOmKwi39HXjBY8k8KbFRyLtS70w==
X-Received: by 2002:a5d:4288:0:b0:34a:b682:7978 with SMTP id k8-20020a5d4288000000b0034ab6827978mr1486676wrq.42.1713958783808;
        Wed, 24 Apr 2024 04:39:43 -0700 (PDT)
Message-ID: <5a1e618d-f149-4dcf-8e50-374c40cb187b@suse.com>
Date: Wed, 24 Apr 2024 13:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/P2M: un-indent write_p2m_entry()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
 <52b4b0d8-1761-45c7-b6e6-91e1c308209c@suse.com> <ZijN9l4crUTi_-LA@macbook>
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
In-Reply-To: <ZijN9l4crUTi_-LA@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.04.2024 11:16, Roger Pau Monné wrote:
> On Tue, Apr 23, 2024 at 04:32:14PM +0200, Jan Beulich wrote:
>> Drop the inner scope that was left from earlier if/else removal. Take
>> the opportunity and make the paging_unlock() invocation common to
>> success and error paths, though.
> 
> TBH I'm not sure I prefer the fact to continue function execution
> after an error is found, I specially dislike that you have to add a
> !rc check to the nestedhvm conditional block, and because anything
> that we further add to the function would also need a !rc check.
> 
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Albeit I do prefer the extra call to paging_unlock() and early return
> from the function in case of error.

Which puts me in the middle of your preference and the one George voiced
in the context of what is now cc950c49ae6a ("x86/PoD: tie together P2M
update and increment of entry count"). Doing the extra adjustment was
merely in the hope of meeting his desires ...

Jan

