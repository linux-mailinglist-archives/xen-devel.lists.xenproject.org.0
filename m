Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFEE99255B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 09:04:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811656.1224339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxhmA-0003Zl-Jc; Mon, 07 Oct 2024 07:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811656.1224339; Mon, 07 Oct 2024 07:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxhmA-0003XO-GO; Mon, 07 Oct 2024 07:03:26 +0000
Received: by outflank-mailman (input) for mailman id 811656;
 Mon, 07 Oct 2024 07:03:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mBo3=RD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sxhm9-0003XI-J2
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 07:03:25 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e10b45a-847a-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 09:03:23 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9957588566so73924266b.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 00:03:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5bbda0sm341411866b.27.2024.10.07.00.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 00:03:22 -0700 (PDT)
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
X-Inumbo-ID: 3e10b45a-847a-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728284603; x=1728889403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EbrTWmQGNrVuRTm0iS5Kxl5J0pmLTTgfvczD5zPth3A=;
        b=PPGuaroY0Pcull3m6fhU9Fg/DR4lLkr4v/4zG8ktag+a4UHRgXVeEKT+FhUpa8IhqF
         FzbuVAVj+tVgUQaMXmZXRUVdQx/gy8jgkikAS0zPbTGorG9jPkIDkd9CQTFfYg2Q/pJp
         non+8Df0ljnLZiK9DEGB2pnzaZA5cHWhUyfm2tVul7jO16fjZp52B73uwi9YFeDhGlls
         loLJqJnmwVqnnoNPkds4vH9PtvOGtV5Lp/98SsnbiDm21QzLjczgIjwvLouNgLv2R/CR
         PKw26SfDsZHGhZwLKmM+ao101HLENUXyRVoI5nxlUpURooPeYlUTERxzYwETbC9NIaxg
         xi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284603; x=1728889403;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbrTWmQGNrVuRTm0iS5Kxl5J0pmLTTgfvczD5zPth3A=;
        b=Uv8d9MCloPawaAbPUDXViebYbafChhc7fkXjw56tlnObz2f+BaEFiJ6eS9hOSW12ew
         Cu3ChMGch3MA5PsuO0A2GIm/RAxaF51FuYWFmwxkzcOttHzAY4X5oUqj8a7nQ7Qy/UT8
         2BsBzEfACoOu5DxsypbkYvK53X2fkJYBidAabsOSgHGK/35gJUBV+/dV+N6flXdA1z/X
         4k83wSXIi+zlWq7jjJFPAWrRUmKrrMrQxe+pztLztXa19dV+jPP5R/0kcxCkmkQuy8C6
         XYjjaQwAwUPglIdkmEiVAmXW/eIUdx0zDt/76nFFFdQim4W9eNemL9YVX82TlGEbFylH
         9ajw==
X-Forwarded-Encrypted: i=1; AJvYcCUgYTYibh3asKVpz6kVGMSbU2DNNJh2NE3AVCn09+s/eXab/+IPNQ8mOf3qG1YhPhes4UZZuhp8BpY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDAdPFELUD+UACRrtdfVgUiSNuOM/e4tRyTyf8OHr21RR/aY5C
	d+LOPEStVlTa5nnfTjtt2iMbtGke8r7acSJhdRmCvq/Rys3wOJZv9gHNGlVnEg==
X-Google-Smtp-Source: AGHT+IHaLJADnJCa9h7F5hjdgGyuMNn2fNLZtpz4IF4FfvMRjb0vcuKOLgY4cBXdsHLxuQI56mjMXQ==
X-Received: by 2002:a17:907:2d8a:b0:a99:53f5:3f33 with SMTP id a640c23a62f3a-a9953f5429cmr300316666b.33.1728284602909;
        Mon, 07 Oct 2024 00:03:22 -0700 (PDT)
Message-ID: <0bfcd06d-cc3a-4048-bab4-0d5cd794fa1a@suse.com>
Date: Mon, 7 Oct 2024 09:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/boot: Reuse code to relocate trampoline
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>, xen-devel@lists.xenproject.org
References: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
 <20241005080233.1248850-3-frediano.ziglio@cloud.com>
 <e7e5200e-4577-4f67-bb3e-6f71086fc663@citrix.com>
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
In-Reply-To: <e7e5200e-4577-4f67-bb3e-6f71086fc663@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.10.2024 15:21, Andrew Cooper wrote:
> On 05/10/2024 9:02 am, Frediano Ziglio wrote:
>> --- a/xen/arch/x86/boot/Makefile
>> +++ b/xen/arch/x86/boot/Makefile
>> @@ -1,6 +1,6 @@
>> -obj-bin-y += head.o cbundle.o
>> +obj-bin-y += head.o cbundle.o reloc-trampoline.x64.o
> 
> Ah.  I think the $(obj)/%.x64.o rule you had in the previous patch wants
> introducing here.
> 
> That said, x64 is the one name for 64bit that we reliably don't use. 
> Also...
> 
>> -head-bin-objs := cmdline.o reloc.o
>> +head-bin-objs := cmdline.o reloc.o reloc-trampoline.o
> 
> ... head-bin-objs isn't really correct now seeing as they're not
> binaries in head.S.  Also ...
> 
>>  nocov-y   += $(head-bin-objs)
>>  noubsan-y += $(head-bin-objs)
> 
> The no$(foo)'s needs extending to the 64bit objects too.  They're also
> used early enough to explode.
> 
> In Xen, 64bit objects are the norm, and it's 32bit ones which are the
> exception, so how about we special case *.i386.o instead.  Then
> 
> obj32 := cmdline.i386.o
> obj32 += reloc.i386.o
> obj32 += reloc-trampoline.i386.o

I'd like to advocate for ix86 or i686. i386 gives a wrong impression imo.

Jan

