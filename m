Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F4CE6FB8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 15:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194045.1512542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaDzw-00086V-LG; Mon, 29 Dec 2025 14:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194045.1512542; Mon, 29 Dec 2025 14:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaDzw-00084g-If; Mon, 29 Dec 2025 14:13:24 +0000
Received: by outflank-mailman (input) for mailman id 1194045;
 Mon, 29 Dec 2025 14:13:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PeLl=7D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vaDzu-00084Y-Rj
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 14:13:22 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87597977-e4c0-11f0-b15c-2bf370ae4941;
 Mon, 29 Dec 2025 15:13:20 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso72628955e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Dec 2025 06:13:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d1936d220sm588588865e9.8.2025.12.29.06.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 06:13:19 -0800 (PST)
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
X-Inumbo-ID: 87597977-e4c0-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767017600; x=1767622400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s25DVCqfHmQafw1ohr4pMsnXszddCek/2CFl1b0qNFI=;
        b=Qye6y1MQLaNGm6VNSPZ1568eI95JQgS4X7sd/3S4p9+MzL4+U90QVBXCIqVyF9hIfa
         Lm2VxG2Mb9sXh4csKQbUAzER8xXtbhuij/ByXaNUxb8X77+xqLensrGfxcRfR1NcvkQZ
         2JTOWB2QsFRn7dr81O7n+eFmz/Vi7i6rgirq+6uAiLDp79AxsszwVHxnfyeXcpUQoZg2
         cZD1A/n/AJC/dRv++6SP7VVDMXvrtRmXlVNG5sQhnNn+PCpnRtQU9EOZ4MvHIjLo6Xga
         O96YH778u6JqM2svf+J4OXj7egcTJaAPY5DqlBsGd4NUyJFDJwByprR34hHvZAvy7Igo
         5AhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767017600; x=1767622400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s25DVCqfHmQafw1ohr4pMsnXszddCek/2CFl1b0qNFI=;
        b=akve6/eWgs5tv5pV7cW1Dd+WFJHpuha5I5b7tpN6OnUXL+Enr23OBYl8YDJ0TiQivQ
         i+tpjRYcGezhDcjc+63QhoCQK1blrAvpiF/qktbrfJ/cEqucbowPzNSZgYN8/W9etCnn
         EvqCY5ImY61GCdrPeEm+j3WflUb/+FjHkTbGBiHz4KsfbVLG0BUTcd/BOnzwfXeOix17
         JhVc+n63kDL+3wopMYhD5jz9QUVL7f0PNg/CE0rfLLe1pnFK3RLiuU3KU7Lv+Mq8orey
         JIC9UaT6fSvTf5avGSAmwzM6Arg7GxCO3C2KdfePSizyCkD42tWe/W0ZqKlpds03cHKu
         jimA==
X-Forwarded-Encrypted: i=1; AJvYcCWUJAS9tz/YsHisANbzb6OdcYyf5MxzgDRi+UjcARUz/5VmJPcWMrRtJ+EhMrryezuGO/6v8ZftQUk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4AGoUdFKQsB3tZPt7evftOE9L8EXEUO8BHbxKDzeF2ANBmqAe
	WzXxV9YTlxJOprOfMRjZoP5b4RRI6/3VrJNCUWmOxgsN/aFQbwaQgjV2D2AGqqBI4f6mAZF3Wmn
	RYvA=
X-Gm-Gg: AY/fxX7604iOQjDwEYE+2a0HLS/DN7nA5PGml78k7BSFZzdR3oIYnNpZ3qckj5RmCMD
	k2lHEiDK/YYiBlN+XFMYcyfhv5AXQAsZSJjSXOv45NbpXh7QzpKJUOkE4g3r0dQ3f65ioeYYwcl
	R1wAoQYAxBeOMGwpvPUbKfBGN+i8xrAImMguRjVsateOTjCwLpS1VnBHLppAa2e8zqMdh1wQcZD
	7BJy44MN3uVrV7OfSzHDhSy9zmV6aElcEsQ4+Nby+3SWBxERpCS79BIguCUl+m5dRav/U5eGfG2
	P3g2b+9VYG0SRoOG+2odUX/irVB80IZ00PshECzeMxMe0KblkNzF/1PrA4XOx8a0qf5oea4Hrcv
	6wsJ2Cgf0aXpDjQwdKs2wJhVD9WdC3dqGQ/Cz7E9MHJT03xqoYZFVjrT25Vp0sEgB69+33xoYhc
	hgCuW7sn8ANO7hbWmoHacfAq9K7LZJsRxJPR0D4UY9xbPQIiCSyF2tKc8hFMwYOJ+si9JJgLaLo
	To=
X-Google-Smtp-Source: AGHT+IF/RFWARPMdGLaHmnK3YtOHppclyuwVkHp60M5uoWSk96CEn+pNRkZaw05fJ0m17BFyJlz7GQ==
X-Received: by 2002:a05:600c:5489:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-47d18bd5651mr361111165e9.11.1767017599784;
        Mon, 29 Dec 2025 06:13:19 -0800 (PST)
Message-ID: <b7a31f50-4fa7-4b53-ad92-3df6c4ff624c@suse.com>
Date: Mon, 29 Dec 2025 15:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] pvh: Introduce SIF_HVM_GHCB for SEV-ES/SNP guests
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3b6f5146287d3402a09836b7cf876d4f8dc9eee1.1766889890.git.teddy.astie@vates.tech>
 <7d439b75-801b-406d-98e0-29c207e1c1ba@suse.com>
 <7bbd6560-c988-44d9-a2e8-448cceb455e2@vates.tech>
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
In-Reply-To: <7bbd6560-c988-44d9-a2e8-448cceb455e2@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.12.2025 13:39, Teddy Astie wrote:
> Le 29/12/2025 à 09:24, Jan Beulich a écrit :
>> On 28.12.2025 13:49, Teddy Astie wrote:
>>> --- a/xen/include/public/xen.h
>>> +++ b/xen/include/public/xen.h
>>> @@ -890,6 +890,8 @@ typedef struct start_info start_info_t;
>>>   #define SIF_MOD_START_PFN (1<<3)  /* Is mod_start a PFN? */
>>>   #define SIF_VIRT_P2M_4TOOLS (1<<4) /* Do Xen tools understand a virt. mapped */
>>>                                      /* P->M making the 3 level tree obsolete? */
>>> +#define SIF_HVM_GHCB      (1<<5)   /* Domain is SEV-ES/SNP guest that requires */
>>> +                                   /* use of GHCB. */
>>
>> Naming-wise, do we really want to tie this to AMD (and hence exclude other
>> vendors, or require yet another bit to be allocated later)?
> 
> This is SEV-ES/SNP only, I don't think the same bit can be reused for 
> another technology (unless it also uses the GHCB MSR). As the guest 
> can't even check if it is Intel or AMD CPU at this point (if running 
> under SEV-ES or SEV-SNP).

If it was just telling AMD from Intel, that would be possible. There are
a few well-known differences in how certain instructions behave [1]. But
here you aren't after telling apart the vendors; you want to know whether
you're (fundamentally) on SVM or VT-x.

Of course I have to admit that I find it quite irritating that in order
to execute CPUID one has to have a #VC handler properly set up. This
inverses the typical flow of events. Did they really not think of some
replacement for at least the most basic information?

Jan

[1] Of course, such details can change going forward. Vendors did alter
the behavior of certain insns in the past.

