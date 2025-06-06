Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B760CACFF18
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 11:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008285.1387553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTEZ-0000We-0U; Fri, 06 Jun 2025 09:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008285.1387553; Fri, 06 Jun 2025 09:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTEY-0000U0-UB; Fri, 06 Jun 2025 09:19:30 +0000
Received: by outflank-mailman (input) for mailman id 1008285;
 Fri, 06 Jun 2025 09:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNTEX-0008QI-Kq
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 09:19:29 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5903e3e7-42b7-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 11:19:29 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ad89ee255easo335448966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 02:19:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1d754235sm86366666b.5.2025.06.06.02.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 02:19:28 -0700 (PDT)
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
X-Inumbo-ID: 5903e3e7-42b7-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749201568; x=1749806368; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KdvN2IHJeL4rJjEJixfXVkFNCRLcPZ8fs39/M63KUfg=;
        b=KYfRCnpQ746QgM/N+sw8iI2eRPgElwp3G5SRWqwCL+dGHthlPlHlM+OUSClFDNL4tA
         qkL3FNBdTcgql/kUvIwpVYYmYYs2sNoaQ12Z+V6eFzc1D/leA6GL4EQ7EUsjO6qkXYf6
         tTzhnAouUrVobCkVXBaJfAaMMKLV8H8G3cSl1qlTOa9AXcix1uUwumBmL8bBbbDlHY24
         ShLXZA0pZMTMNYGqm9Cs+AM8yQRLWcE4+E+FCAucCWTbbhQxayGwJL3jkSTSUA0U3uau
         1guiC2/mDsNTD5H11TzG6+pe2ESkr9vHXzFzOdVncKY8rbNTqrPYG35wwydBAThZA7f+
         TBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749201568; x=1749806368;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdvN2IHJeL4rJjEJixfXVkFNCRLcPZ8fs39/M63KUfg=;
        b=d8bIbdzC23OW0Bu1ZC5Gw2JBWREpLbPKSHTtd5EKbD+7ddmHK4FIF1rPB9lF7h0HGC
         u9/6NpbiOq92ehKY+ofQjrEX0evE3pZ7PTzMoeS+xeUhEFnwBC/akVFwpgKIcGVoyNpc
         1njQf70yrnyBWnXaTDopOpC/pc9hzDAjIj8ARlS0DtnsRWIGcsvCQjsr5ht5TbFLopmn
         qjsrkAbdBVCDuQApHXbkgx7FpRdjYF3qgw7Epf1RqIqoenrsRHn8dAQfE1oZ930AT9Tu
         LDFpkEoKiloNftCRTy//1/3bWxHX/D+mqHdEc0ODXNbIAk/PBQYeKc3McnftukE7Cqr/
         1JIA==
X-Forwarded-Encrypted: i=1; AJvYcCXl0+56sSbCtLrS3wgBnY7+pxZx6R8xMZnO+EeJJgZ4F4Yx/Yg0D/AH8aNM05YzOTS2lZVOCYkgMHY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNyZRPQEEHodbjbLOEWUrfT4De3qEyfCw3A1zVD9XhDBPCJkk+
	vHaSlrW0ypGGH6vC//hP3pWN7CS0g5vlmAl53oq3wo8ztkDYZY9X71M3roWQRRhleQ==
X-Gm-Gg: ASbGncsG/9jj3nkJbOK3Q7a2ntRU3ifmrWzqfuoGleykk367cBXUPnqSzILpkoGes7f
	Zb/AIQd32wM2qXm3TEcB4mAcTFqmIlUtK+z7VFWdfRk9RZCHxMbgT8N/WT8oz6Bcxe7rebMpqrO
	stktJDR/hTLZUGgDAj5BjINWLM3LhylbTEllyvIEHdIe1rwu2yWALcpjeIxWjXjY2/0+jz7kloB
	uOA4Lxu1aKfHZLf1C33ORO9waYUoDP/w2bmyHg/ASnVjo5xrBwbXCbSwUtnxOIYldsFegkpaKVD
	e+1rQvg6nhW8MK0FHg9iBpHPrIugS3CO8nDRHnnLPVGqTEjryW8jZYEhW/5Nhhdfspj9E7cvq3b
	rfVW3uHWtUzwcYzf/EhsSwDiXb7KKKVhgrZKC
X-Google-Smtp-Source: AGHT+IGbqMjZbZmUBJv8ubaBJQnz9w6RlLlu1EPzewPKM8G9q5DQivztGt0QgvxD5w/0Nl03bUPKBQ==
X-Received: by 2002:a17:907:868c:b0:ad2:2d75:d7fb with SMTP id a640c23a62f3a-ade1a9ed821mr241838366b.55.1749201568399;
        Fri, 06 Jun 2025 02:19:28 -0700 (PDT)
Message-ID: <0c9d2432-3c5c-4f93-8c07-99894d7f8606@suse.com>
Date: Fri, 6 Jun 2025 11:19:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] x86: control memset() and memcpy() inlining
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com>
 <f659ba34-a1cc-444b-8727-2ecfbcfb00e3@suse.com>
 <f909c07f-d587-4ce7-9bbc-bdc13f604664@vates.tech>
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
In-Reply-To: <f909c07f-d587-4ce7-9bbc-bdc13f604664@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.06.2025 19:34, Teddy Astie wrote:
> Le 05/06/2025 à 12:28, Jan Beulich a écrit :
>> Stop the compiler from inlining non-trivial memset() and memcpy() (for
>> memset() see e.g. map_vcpu_info() or kimage_load_segments() for
>> examples). This way we even keep the compiler from using REP STOSQ /
>> REP MOVSQ when we'd prefer REP STOSB / REP MOVSB (when ERMS is
>> available).
>>
> 
> If the size is known and constant, and the compiler is able to generate 
> a trivial rep movs/stos (usually with a mov $x, %ecx before). I don't 
> see a reason to prevent it or forcing it to make a function call, as I 
> suppose it is very likely that the plain inline rep movs/stos will 
> perform better than a function call (even if it is not the prefered rep 
> movsb/stosb), eventually also being smaller.
> 
> I wonder if it is possible to only generate inline rep movs/stos for 
> "trivial cases" (i.e preceded with a plain mov $x, %ecx), and rely on 
> either inline movs or function call in other cases (non-trivial ones).

Note how the description starts with "Stop the compiler from inlining
non-trivial ...", which indeed remain unaffected according to my
observations (back at the time).

Jan

