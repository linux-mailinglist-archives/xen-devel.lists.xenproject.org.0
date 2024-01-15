Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5369B82D874
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 12:38:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667328.1038483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPLHj-00043I-MP; Mon, 15 Jan 2024 11:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667328.1038483; Mon, 15 Jan 2024 11:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPLHj-00041m-JL; Mon, 15 Jan 2024 11:37:43 +0000
Received: by outflank-mailman (input) for mailman id 667328;
 Mon, 15 Jan 2024 11:37:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPLHi-00041g-66
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 11:37:42 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cfc396a-b39a-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 12:37:39 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50e67e37661so11776889e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 03:37:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d1-20020a6b6e01000000b007bc47488033sm2218542ioh.1.2024.01.15.03.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 03:37:39 -0800 (PST)
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
X-Inumbo-ID: 7cfc396a-b39a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705318659; x=1705923459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eb8W0WyrxdsCOcLv2saulZtSn7fUcurs+4+Usg8qA7o=;
        b=Ir0oK1/6FeXlZ3CPs2j9ivDB6uUkwT9rkgwGO2lYXNJPN9wgx4swefA2HtK05ViVrE
         9uFH1y6K1rHtObuVD9/3aLCnP/QTD2LIac9zpHyupE2CwiTe5QYjxhXUf9qiISuB2Maz
         DdC35frDOVqve7Yg+Jf2hYJVIJ401ehJgLvCYq24GBUdWSd95kOGmdYt3lm1R1FnWSqs
         Jo+FKiXgsK+dAkJXzUd4+vQsdZZW/hXtg4kmeiMrs+OISB/p8MukCBaf0TJcBQ32vMZ7
         OmuyzVrG5um0abjpct6TQlPLiSTN9UWHpRfcofKbE0e2RMyqkkRCR3WMEu0OTGoH9tTB
         KjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705318659; x=1705923459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eb8W0WyrxdsCOcLv2saulZtSn7fUcurs+4+Usg8qA7o=;
        b=BZ5otinKPv3wSPemWQNp7L/Z00Jk7YFLMpfgbwmLrMGg+Tqo+tDKdaLKOOSLBMajKI
         AqUyijNf2sgMxzIXsHtt/j2dDhg3qvDznQ6N2A1m11BepTEPCKJvx6vVgIqTpHXOm4OG
         1NPq75kDpJyZrbOfagTCpskChluRriG3uIhQZrjJkVe2HLG05WECGgll9ieuW6mpfpnq
         46wrlyTZlHkZtFpLRlvOhCiBxHm0KO/HEJPln+9mhvdKHRhxQVLR+AEPWYV2JWcro+ib
         JLlOeJrQWud/NtdpJCVKy6YwCH3vnCdioCgnFbNTjiLaHDbGnjL21zyvJG/W08n0NAcG
         1POw==
X-Gm-Message-State: AOJu0YxtF94FKYT4BR3dcCPnZUL3c+AcnTpFxFY+EPF7mPyB4e1kgGKB
	ME+YJjbi6JywvzBggB8vmOdBGDm2URKO
X-Google-Smtp-Source: AGHT+IGnfiHTw3c/Hydr9kuU7B7aKFCZjTkDJDxGjvC+w7hNYtjnwwDaXE1lwCfpxgOEgsWphMmpig==
X-Received: by 2002:ac2:5635:0:b0:50e:75f8:ac9f with SMTP id b21-20020ac25635000000b0050e75f8ac9fmr2275388lff.28.1705318659456;
        Mon, 15 Jan 2024 03:37:39 -0800 (PST)
Message-ID: <6528658a-5cb7-4f9b-a92d-a4ca43f6352b@suse.com>
Date: Mon, 15 Jan 2024 12:37:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CirrusCI: drop FreeBSD 12
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20240115102718.81294-1-roger.pau@citrix.com>
 <854db64e-a3c1-4c2f-8a68-8557f7f5a5d1@citrix.com> <ZaUU_qqqOs_F4qe0@macbook>
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
In-Reply-To: <ZaUU_qqqOs_F4qe0@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.01.2024 12:20, Roger Pau Monné wrote:
> On Mon, Jan 15, 2024 at 11:01:54AM +0000, Andrew Cooper wrote:
>> On 15/01/2024 10:27 am, Roger Pau Monne wrote:
>>> Went EOL by the end of December 2023, and the pkg repos have been shut down.
>>>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> We'll need to backport this, I guess ?
> 
> Yup, but it might not apply cleanly without the rest of the changes to
> the file backported also.

Looks to apply fine to .18 and .17, which it what I'll queue it for.
If and when we need it on .16 and/or .15 as well, adjusting the patch
rather then taking further (not really) prereqs may be preferable.

Jan

