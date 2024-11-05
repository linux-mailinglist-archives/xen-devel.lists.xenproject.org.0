Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05639BD065
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 16:33:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830406.1245397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8LXv-0000kR-Ey; Tue, 05 Nov 2024 15:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830406.1245397; Tue, 05 Nov 2024 15:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8LXv-0000iD-Be; Tue, 05 Nov 2024 15:32:43 +0000
Received: by outflank-mailman (input) for mailman id 830406;
 Tue, 05 Nov 2024 15:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8LXt-0000i7-Ia
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 15:32:41 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3056052a-9b8b-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 16:32:38 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so743933266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 07:32:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16a2dbcsm147203766b.40.2024.11.05.07.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 07:32:37 -0800 (PST)
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
X-Inumbo-ID: 3056052a-9b8b-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmEiLCJoZWxvIjoibWFpbC1lajEteDYyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMwNTYwNTJhLTliOGItMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODIwNzU4LjcxMTIwOCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730820758; x=1731425558; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DbFBNr94KpBgAdMWjszCv+ehE3q1k7Xm8TPwu+nmF2k=;
        b=Co4gFc0t6zqQ+LzA/uwP8pw1zY6ZSdxsAiR19HD7gs8MLVg5rl69bfnXZsy2QOzCiT
         wolxeiNlZR3Id4mOpZ39fT1cvfody9pPgG2v6qo8OHcyYrW3GMo7b9zKZNy590/ZaQ3G
         Tra2GkMsVUYyS+frwWDaOXIzIVXUKpIKGT3j6+07IPExkE65Z7EsL6QwtD7oFbDU2eTT
         Y+GETJdRcLMLBo1CxToyCfmWbQOHH6UK+10TzigryJ7T2CsQc6u9oFZSLnkviQ0PS+hc
         +jd+IbKSafGvVgxKBZw0Y7HMGoEFaJ8VPWqeZ3pHHAa5TSbp9QVtdf2+5zAq6q6HzAfL
         ljBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730820758; x=1731425558;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbFBNr94KpBgAdMWjszCv+ehE3q1k7Xm8TPwu+nmF2k=;
        b=ZWWXpoJ+fuoyGNE/VOBo/BlexmDJQoItLSjRTzVYs+v7poDhuXHRtMqVjwswq8LIR7
         aFOijX4qLAJsPvYbJWh4JLivtMFbuNWB7lYGr8PEbMqJ6OoaQpu/NWGT/g0Y8N2SmYW6
         0oGJcjnDJFnicKM9iuD1r3LwOiiXu2WRbGW1NbS6t2JI457rEpAlrH2XgU2Rme9ou+A9
         J8hiQI4FjGvg1+eR50FCEONbAuu4AdHn7Zu1AC41AeSHNINPO1UPBdGIuHhI5DxAg+Ts
         FCcQnerhMlnPVaTFlXBPmXpGf4h/ZqeyqEStgIOpFqxf0eOuH8OmKZ3J3w8wNsYPhzsr
         l0Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUkOSrW2Fv4VTva90+6emBOjddu2Pk36LlupZLiMbdVU0KA7N9Lv/JjgUN6HX4ohtbDWHeHwQpTPoQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yza+mLf5I1orQbb8mARihYuAVmlAjI73bzdqW7tbNFhQKEEUei+
	q3E+b3fkt9FUBLuceQuUPp5zWJZDxEhxwD5zWw8OmitBVwkZUW2bxBQ20D7XEg==
X-Google-Smtp-Source: AGHT+IEY56QW0thHuq0rW7F1O84eYaUuHNnzTD/vIij2Vh4qhALBuqpRbxmPYoD8BeVoUkNHSsnFvQ==
X-Received: by 2002:a17:907:e285:b0:a9e:b281:a212 with SMTP id a640c23a62f3a-a9eb281a37amr265256066b.51.1730820758047;
        Tue, 05 Nov 2024 07:32:38 -0800 (PST)
Message-ID: <48a22295-f3ac-496b-bdfb-ee17b0ada994@suse.com>
Date: Tue, 5 Nov 2024 16:32:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix build with LLVM toolchain
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241105145507.613981-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241105145507.613981-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2024 15:55, Frediano Ziglio wrote:
> This toolchain generates different object and map files.
> Account for these changes.

At least briefly mentioning what exactly the differences are would be
quite nice, imo.

> --- a/xen/tools/combine_two_binaries.py
> +++ b/xen/tools/combine_two_binaries.py
> @@ -67,13 +67,22 @@ if args.exports is not None:
>  
>  # Parse mapfile, look for ther symbols we want to export.
>  if args.mapfile is not None:
> -    symbol_re = re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
> +    symbol_re_clang = \

Is "clang" really appropriate to use here? Even without the alternative
being named "gnu", I'd expect "llvm" to be more to the point, as at
the linking stage the original language (encoded in "clang") shouldn't
matter much anymore.

> +        re.compile(r'\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s{15,}(\S+)\n')

Just wondering:
- How stable is their map file format?
- Do they not have an option to write GNU-compatible map files?
- Why do you declare 5 groups, when you're only after the 1st and last,
which would then allow to ...

> +    symbol_re_gnu = re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
>      for line in open(args.mapfile):
> -        m = symbol_re.match(line)
> -        if not m or m.group(2) not in exports:
> +        name = None
> +        m = symbol_re_clang.match(line)
> +        if m:
> +            name = m.group(5)
> +        else:
> +            m = symbol_re_gnu.match(line)
> +            if m:
> +                name = m.group(2)

... uniformly use m.group(2) here (outside of the conditional)?

Jan

> +        if name is None or name not in exports:
>              continue
>          addr = int(m.group(1), 16)
> -        exports[m.group(2)] = addr
> +        exports[name] = addr
>  for (name, addr) in exports.items():
>      if addr is None:
>          raise Exception("Required export symbols %s not found" % name)


