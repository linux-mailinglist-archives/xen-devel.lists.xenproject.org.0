Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C9B86C9A1
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 14:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687066.1069859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfg26-0003WN-7Y; Thu, 29 Feb 2024 13:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687066.1069859; Thu, 29 Feb 2024 13:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfg26-0003Te-4N; Thu, 29 Feb 2024 13:01:06 +0000
Received: by outflank-mailman (input) for mailman id 687066;
 Thu, 29 Feb 2024 13:01:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfg25-0003TY-1Z
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 13:01:05 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9824c9f9-d702-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 14:01:03 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a3d484a58f6so146069466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 05:01:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gg20-20020a170906e29400b00a4426352d8asm659377ejb.193.2024.02.29.05.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 05:01:03 -0800 (PST)
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
X-Inumbo-ID: 9824c9f9-d702-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709211663; x=1709816463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRP+weW0GjLngKlURrimZf/CrgVi3wASdZaM9BCrpwQ=;
        b=Kh87GuLkC7m9JeF3LwiSKBs7ZE23MpcPNgCIwqFkye5vAXd5HXk7BGLMGrpv56IDPf
         vmhA7Gm9jujcUi8K9Fl1zpoBW/k8fu6syPtcasW738e86K88/roICzvDY3oML+oQh4VQ
         Cy5MBtCvyG90AClywgBHQiCrpVvSKXPCA2lVKy7k51tAjTod5S+vT8/B6ZvH6d00rPyU
         i8i86tJT/gzCzQhPtSSR9/WiG+Y6I39H+Y9RkTUHAbHY1AtiqL8FVxGOARV5PKqr8C6F
         ujXuPhnfIrrXRhjlYPW/XIUle2TvEN4yPZmLK+Oi1PBn7k/3LptCCTw6UcouclgAYakJ
         d90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709211663; x=1709816463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRP+weW0GjLngKlURrimZf/CrgVi3wASdZaM9BCrpwQ=;
        b=rGZqmoWWN5jJN0N2oylEiJKVnrdLn2MMR7/Ds+flC0fYWO1IgLKxOd+qpMAOJXsrei
         ShCfRnzjZ6vtXqD7KxGNYSnwzGDBwaqFpe0S7hrql2oFEblhLfJlsB8dol5OjrgusOVC
         mDOjnshhHO5uK3DDp9km3SOQheB61LZjKiqF3QNxsL89FdFjg/I9Rw/qV5O0ApMmcJ6O
         NMhPnGCIqavVvXREL/KEx76z1PdXaSn7W3rPBrSvaEel0r44f4DXmU61WU/HIzhb6twS
         coqY7B1cWA/dPJv4cx/b1xHgDrK9bYZVZpR7XmBI4sVDaq3El7wVAYF2w/jBDpBQnNWe
         n4Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWG3B1nFM97GAYxRSa0OrARXxS6makhNm5OMerRb2+lofG9/FZ8R48prZryRkkZQwJqQAv+KdTLciZ6VpgeWJmG4HoJVJsHp0Vw4YaLpV8=
X-Gm-Message-State: AOJu0Ywa+TJTbQyTVUZCmCwPDygN+r5Lb8pJ+HRcuulf3TKjdeKdRUcK
	J8rVu9H+QX4NXrTJoBojOBAtWr5VLlBFj9pSW3nxtD3HYOXuecVLbJo6ZrzcPXuCz+ydLSprMNw
	=
X-Google-Smtp-Source: AGHT+IHd80tWvIKGtqBK92bIcwTFX+EBeB7krGTS4Vfhu1Yndi22o1yNYWgVYSDWQTCZkscnYH4pvg==
X-Received: by 2002:a17:906:3414:b0:a44:311a:3ec9 with SMTP id c20-20020a170906341400b00a44311a3ec9mr1404569ejb.51.1709211663378;
        Thu, 29 Feb 2024 05:01:03 -0800 (PST)
Message-ID: <78032daf-9052-4ab8-ba05-456fa4aee17b@suse.com>
Date: Thu, 29 Feb 2024 14:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] README: bump minimum required clang/llvm version
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <20240229095529.17723-1-roger.pau@citrix.com>
 <20240229095529.17723-2-roger.pau@citrix.com>
 <780ec3ab-08e3-4fd8-a85f-0e89ea75dcc8@suse.com> <ZeB7S6i7pIwzkUNE@macbook>
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
In-Reply-To: <ZeB7S6i7pIwzkUNE@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.02.2024 13:40, Roger Pau Monné wrote:
> On Thu, Feb 29, 2024 at 01:11:55PM +0100, Jan Beulich wrote:
>> On 29.02.2024 10:55, Roger Pau Monne wrote:
>>> --- a/README
>>> +++ b/README
>>> @@ -41,7 +41,7 @@ provided by your OS distributor:
>>>          - GCC 4.1.2_20070115 or later
>>>          - GNU Binutils 2.16.91.0.5 or later
>>>          or
>>> -        - Clang/LLVM 3.5 or later
>>> +        - Clang/LLVM 14.0.0 or later
>>
>> Wow, that's a big step. I'm build-testing with Clang7 on one system and
>> with Clang5 on another (and the latter more frequently than the former).
>> If any real dependency on this new a version (about 3 years old?) was
>> introduced, I would then no longer be able to locally test any Clang
>> builds (and hence the risk would again increase that I introduce issues
>> that affect just Clang builds).
> 
> Would it be possible for you to update to a newer version?  I see both
> the OpenSUSE containers in Gitlab have newer versions of Clang.

No. These are SLES versions which I'm not intending to touch. See

https://lists.xen.org/archives/html/xen-devel/2024-02/msg01793.html

and

https://lists.xen.org/archives/html/xen-devel/2024-02/msg01795.html

for why. The most recent piece of hardware I've installed a fresh (but
not exactly new, yet still fully supported) SLES version on would
apparently offer Clang7 only, either.

If anything I could see about building a newer Clang version myself;
no idea how involved that is compared to the building of gcc (which I
consider pretty straightforward, but that's biased by me being used to
doing so).

Jan

