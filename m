Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ED2ACFD29
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 08:56:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007941.1387123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNR09-00006a-3u; Fri, 06 Jun 2025 06:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007941.1387123; Fri, 06 Jun 2025 06:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNR09-0008V2-1B; Fri, 06 Jun 2025 06:56:29 +0000
Received: by outflank-mailman (input) for mailman id 1007941;
 Fri, 06 Jun 2025 06:56:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNR08-00081f-7Y
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 06:56:28 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d8a954b-42a3-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 08:56:26 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-450cf0120cdso16931965e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 23:56:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3134b13ba47sm635844a91.40.2025.06.05.23.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 23:56:25 -0700 (PDT)
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
X-Inumbo-ID: 5d8a954b-42a3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749192986; x=1749797786; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=42e5ZGOtOGSOXXptCVVuYFxeFbUysynhGiyilV+BZkE=;
        b=ZtGJSRHQMdhRAbQSlp4Uf8XXxLPbf4qZjB+aLxTG/BAxaZh1QTIQRi4oo01QB7/NiX
         Iuk51VTqQjXzN0DxR4KR+gAo0ZLJcd0Twjruov19A/X9OOV0glkrdNAd6JA1nG1F+qUi
         uQl9e68WHYD1LwncTlMiVRkM1SWAKtvWR/Fa05LpvnOeqjqXQmHOCc+9gfKajkgMmd0e
         j7oH4N79FQnat5njdfpxbe+xhB16G1d/U+sdm2EA4InX86Zq47kbx44bFKHrQMJX9gtz
         ey6ZQ6sjh95gg0pvgBxbcmZA1BKVkdBK22tAvHCYZWKGC89QDlaLcIPV0Ruc3TH/gEB8
         R3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749192986; x=1749797786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42e5ZGOtOGSOXXptCVVuYFxeFbUysynhGiyilV+BZkE=;
        b=QdDEcB7B4f3vfKdavdlIZzeafPD9J7q1G8aATklf6nvtJlzvo0q8Wl8I4gzenXZLlJ
         Meyj0YTXvgrQcG2ZrsmR4frktWlhpJtcVhpa4tKKIYaOLYc3jieerk0j0iPypMnHx3+0
         lso3oENbd6MvZNcqX54Ahx+ayAq7SdS8Wour3yhNVHOJvfrJNFw4JBqxlwazvGRE9sQy
         xGFBXKMqNblBi1JLI98OyIT3Q3jmeTaWG4bjH+Sb6ilr4XD7/Mqrr0qjcaLICsy5M4/i
         qCcqyvxGB2c4psbuvl6uH7hMbAuel6+C/7p2Ar/Ryyz1c53xqE2zPiU8MGY6FFezNoTm
         ZjqA==
X-Forwarded-Encrypted: i=1; AJvYcCXG+57eFg1Ly0jrPNmj8MZ40lOs1qzAk4scbHj/wcuKUH9PCLuK1uxMTUf4XOEt3XwA9TcM5fiF7d8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhB60hI62LxgbT2D8MjpeOX+ey+hC8MrWfRToY0mxbaaWxvivZ
	29HkhLQJewJfGMkh8k688mYY+Dsf+efiomnPHxHtjhL8mTVecPMOKrDtP8MJUAkzuQ==
X-Gm-Gg: ASbGncsc9COim2Xx/dJH4odMHZ24s+Z6PRkjc0H69HT3bN4Ml0wcfpS3iqSRUjuCM2v
	CGoELSgtidtp8K+G2jsWrKFujEUJ1zB+w+C3NalXwUgg8QVH/yygIUiFXmK6RF2mPdM//7PPxJE
	Vo6y6ZjxsOb94LjtRZYC7kGJNsVN0t6rtJS2e7NTkED935g2QeeSxSX5pVlBdo1aLveZWnh5e+s
	/TspaYFPf26fwyvMGrlUjA5Il5+hP64NeVZWFsy1bH5DvsAkE7LbRVhQhT9lIc6hF16J6b3KFkc
	5tzeTgQGaUccx+s6lV0EUKP0VTmDiCffWl7iJKPp51Qa6qUmjdsMEj5v60FMcVcbcWdvHbUjGRG
	N8c0EEC0/bsqVQz6xBr+CP7NE0Q52+igPTE6K1IKdIGHO/vs=
X-Google-Smtp-Source: AGHT+IECLLRbhY8X5pS6svFkV7sqMOJz0VhKRUuItsE4WO2h+iCgE37iGHnpx9c55uXmZHPuPcuqcQ==
X-Received: by 2002:a5d:5f4f:0:b0:3a4:f41d:696e with SMTP id ffacd0b85a97d-3a531cb3b6amr1926884f8f.27.1749192986042;
        Thu, 05 Jun 2025 23:56:26 -0700 (PDT)
Message-ID: <6490abdd-ac7c-4178-a174-25d13065ae04@suse.com>
Date: Fri, 6 Jun 2025 08:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/19] x86: Replace boot_module with bootmodule
To: Alejandro Vallejo <agarciav@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-11-agarciav@amd.com>
 <214c8863-5cd4-4be9-948e-e44b67f541bd@citrix.com>
 <DAERYXX8M48M.2X249UHMKARPF@amd.com> <DAES85NYFTFG.1VQE6GFHLL4GY@amd.com>
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
In-Reply-To: <DAES85NYFTFG.1VQE6GFHLL4GY@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 19:40, Alejandro Vallejo wrote:
> On Thu Jun 5, 2025 at 7:28 PM CEST, Alejandro Vallejo wrote:
>> On Mon Jun 2, 2025 at 7:00 PM CEST, Andrew Cooper wrote:
>>> On 30/05/2025 1:02 pm, Alejandro Vallejo wrote:
>>>> These types resemble each other very closely in layout and intent, and
>>>> with "struct bootmodule" already in common code it makes perfect sense
>>>> to merge them. In order to do so, add an arch-specific area for
>>>> x86-specific tidbits.
>>>>
>>>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>>>
>>> Yet this is a distinct backwards step in terms of legibility.
>>>
>>> How about modifying the common code to be more legible, rather than
>>> regressing the x86 code.
>>>
>>> ~Andrew
>>
>> I meant to ifdef out the fields unused on x86, but after some massaging I
>> think I got it lookin much nicer. It's essentially using the common parts of
>> kernel_info and boot_domain as a header to kernel_info.
>>
>> That way, x86 keeps using a substantially smaller (yet common) data structure
>> while the rest of dom0less can keep using the original as-is.
>>
>> Refactoring kernel_info to rationalise its contents is somewhere in my TODO
>> list, but I have much more urgent fish to fry first.
>>
>> Cheers,
>> Alejandro
> 
> ... I misread the comment and thought it was in the following patch rather than this one.
> 
> If it was indeed intended here, I'm at a loss as to what you'd rather do.
> Common bindings need a common ground. This is such ground. The data structures
> are virtually identical and used for identical purposes.
> 
> What's the legibility step you're talking about?

The loss of the underscore (separating the words) in the struct tag, aiui.

Jan

