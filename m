Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A85F86C9E2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 14:12:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687076.1069889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgD9-0007Ro-Ja; Thu, 29 Feb 2024 13:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687076.1069889; Thu, 29 Feb 2024 13:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgD9-0007Q3-GH; Thu, 29 Feb 2024 13:12:31 +0000
Received: by outflank-mailman (input) for mailman id 687076;
 Thu, 29 Feb 2024 13:12:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfgD7-0007Pv-RI
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 13:12:29 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 304cccf5-d704-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 14:12:28 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a26fa294e56so169988866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 05:12:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qw16-20020a1709066a1000b00a3edb758561sm669721ejc.129.2024.02.29.05.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 05:12:27 -0800 (PST)
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
X-Inumbo-ID: 304cccf5-d704-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709212348; x=1709817148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qIc5HKpjtJ58Pd/LBVD3zNyzRmZRR7kT8YdzWRqMUAs=;
        b=TiGvaPBirO4LZ1294IxpLbDnNvoyo+9ATS/6NacaoLv4gyJ1NekvLgZtNIJWFoaeI6
         OBsce8bdVoQAlXTZQeO3dICiXiREcdWRb/5oi3a59VsaVLf+73OdkbYeGt+W+ULiW/iS
         y2ToBdEkPpjoJmS0txnwzTJimkzT5gLrhv+g4D09DMYH5j4xFXhMgAhdFf/LHF2rjS+w
         AL2XsCKiuaG0mnm1z6VgEL4qF3WcpoaNgAl1o85IobMQDOQNvMsIjVCmkGVhn24Sqa91
         RO5KmxbMHQQ02zQoyEWjMNnVqKQKU3csW5iH2gBjWZyuR9m4zhmZrHpUfbZ67bSZTzds
         +AmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709212348; x=1709817148;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIc5HKpjtJ58Pd/LBVD3zNyzRmZRR7kT8YdzWRqMUAs=;
        b=HOXJmPxa523INWJs49Ds696uiGEeYkDvv/F7We0sZFAsBr82Az4t94a+6wgQxRedla
         AabHeNMgVvrBjDji/212kzal0bWVf+/6eU2YfPC1rsK9FIFecEybO2hFvhDIH2QGEXly
         ziTGBIO8GQzvjuGHPOPCshdapZdNW0M28kUn0tNKwtQZn1X3RynNiqnUbK8nmIZ1cWSv
         F5jUZ0i2y9ittz+XfFDsgicsTc4cDrk2uFmNzx9jNjidwsoRT8DJcSxQLfBx1lKosdGn
         3C1krmnAzZvEj7dc4u9E4TxtDB5SsBzaSNAz+XJJguEHCZgyyKd7c9U6AALWAPVuBf72
         Y1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcUuIjsdEY2wMW6uL8RcMSnSqVW621kH23IE+ZqSLCOJm2MRTjxHeLa8FYtWWoQ6bK+oMYYXvq04SSrzO2HjLZ2J1DWhye5iVlxzsiIOo=
X-Gm-Message-State: AOJu0Ywr+oDwm19oNUxWo4z1QCxZ1TBUfdPix7/Toy5jpKRY6dy1RPeG
	YtoJ9cY8hb3jQ8k322uIy7Gp3VKxGWsPjzkJRHCYzaAuNwXLE+doCMeujh3v7A==
X-Google-Smtp-Source: AGHT+IHaiXUCa1XkIsS2y9ZR9e7FKOW/OtGQChhqAjmIarvSs5TUnSBA4Qo8Z2Awor/GtNhZs11e1A==
X-Received: by 2002:a17:907:11cb:b0:a43:af0b:c1c0 with SMTP id va11-20020a17090711cb00b00a43af0bc1c0mr1551603ejb.16.1709212348150;
        Thu, 29 Feb 2024 05:12:28 -0800 (PST)
Message-ID: <132dde96-d7d3-4823-8a0e-7b4a62526f2e@suse.com>
Date: Thu, 29 Feb 2024 14:12:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] README: bump minimum required clang/llvm version
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <20240229095529.17723-1-roger.pau@citrix.com>
 <20240229095529.17723-2-roger.pau@citrix.com>
 <780ec3ab-08e3-4fd8-a85f-0e89ea75dcc8@suse.com> <ZeB7S6i7pIwzkUNE@macbook>
 <78032daf-9052-4ab8-ba05-456fa4aee17b@suse.com>
Content-Language: en-US
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
In-Reply-To: <78032daf-9052-4ab8-ba05-456fa4aee17b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.02.2024 14:01, Jan Beulich wrote:
> On 29.02.2024 13:40, Roger Pau Monné wrote:
>> On Thu, Feb 29, 2024 at 01:11:55PM +0100, Jan Beulich wrote:
>>> On 29.02.2024 10:55, Roger Pau Monne wrote:
>>>> --- a/README
>>>> +++ b/README
>>>> @@ -41,7 +41,7 @@ provided by your OS distributor:
>>>>          - GCC 4.1.2_20070115 or later
>>>>          - GNU Binutils 2.16.91.0.5 or later
>>>>          or
>>>> -        - Clang/LLVM 3.5 or later
>>>> +        - Clang/LLVM 14.0.0 or later
>>>
>>> Wow, that's a big step. I'm build-testing with Clang7 on one system and
>>> with Clang5 on another (and the latter more frequently than the former).
>>> If any real dependency on this new a version (about 3 years old?) was
>>> introduced, I would then no longer be able to locally test any Clang
>>> builds (and hence the risk would again increase that I introduce issues
>>> that affect just Clang builds).
>>
>> Would it be possible for you to update to a newer version?  I see both
>> the OpenSUSE containers in Gitlab have newer versions of Clang.
> 
> No. These are SLES versions which I'm not intending to touch. See
> 
> https://lists.xen.org/archives/html/xen-devel/2024-02/msg01793.html
> 
> and
> 
> https://lists.xen.org/archives/html/xen-devel/2024-02/msg01795.html
> 
> for why. The most recent piece of hardware I've installed a fresh (but
> not exactly new, yet still fully supported) SLES version on would
> apparently offer Clang7 only, either.

Bah, that's not even Clang, only LLVM.

Jan

