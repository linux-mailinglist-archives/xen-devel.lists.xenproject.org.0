Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0329883A3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 13:59:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806245.1217587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su9cv-0002GT-Kp; Fri, 27 Sep 2024 11:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806245.1217587; Fri, 27 Sep 2024 11:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su9cv-0002Eu-I7; Fri, 27 Sep 2024 11:59:13 +0000
Received: by outflank-mailman (input) for mailman id 806245;
 Fri, 27 Sep 2024 11:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1su9cu-0002Eo-6A
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 11:59:12 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7a70173-7cc7-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 13:59:10 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c4146c7b28so2326101a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 04:59:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248af26sm1113600a12.63.2024.09.27.04.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2024 04:59:08 -0700 (PDT)
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
X-Inumbo-ID: e7a70173-7cc7-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727438349; x=1728043149; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sSBmQwORV2aDa0yYoX0xUI0DcRm86/rhOSiWBpISbms=;
        b=eHrekxzjwoykEWXZ7ZYn7D/uf0mwNWFDdx9snC1dg1swFyduliEpgV5JTKm2JSyG+6
         rSPr64PSQ68YpvwZD2Lhtx2YoLiMVMp5CkUzhLIXDKBeIkUC14oL61zfJ4GtV41wgXdh
         n2IePR40ib+NC7aPrI8+RBlpc6RrNsxXs0wN7KGLjNfby+v91oUizTIvP3nGSIGmsTaZ
         J9iAleuHpy0rROkGzWRxFX8qS2fTpCqJWBkpHIv1QyTiVAenmIuGM1NV688BQdeHK7eT
         7jfLf5/v0jGaOaadPnwi/VVJasyOem2UCh9E4iSv0D4t3fbE6gcMirp2yDm2L82k7eqi
         YuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727438349; x=1728043149;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSBmQwORV2aDa0yYoX0xUI0DcRm86/rhOSiWBpISbms=;
        b=Bl+QidAq4gJ1bARu3qETSFwhs6f42PwRJtwZpHiB54ET46da6uHCBpRoTXXdN7hFLm
         gau189Iiwcgj8grDZQvklhI2aiWV6NYkD/fq5AO3iaMRJZSB6doSNSABmUk3lbws+FDB
         5w68h5ITfpy/8KILnAEGfdLn2ay0hQXF0iv2ssoOSJJ6K2yiZF5r81KU/Skbn4SBUypn
         enuMpNlDVHwCEb599OwrYf6m3+HpVxAGwkEDs76K3TMjKqBCrt73CZrUq0saIDL54ZmX
         oIXk6NTSwDMcCLE3DlFOAbvcKAAAi97GG2LsZqSnIeszmaD67d0osOovVaGwIYcpOj4b
         Hp4A==
X-Gm-Message-State: AOJu0Ywrg8uiubGyTNACtx9ISU/hpHPN0TMPoX6XVl26NI6ySPzZF5Lf
	MlV43MsiIvaZLNbibzysWscYory4sRrEbXeblkS7cObLHxd0ZOHe52GF+f80ag==
X-Google-Smtp-Source: AGHT+IFgUjA9iS+RSAIOMQTBo+kciWiB3qLW/3MV10IsCsRDhf1vqY9oFOlwtyTt/7MxEi9Dy4xmNw==
X-Received: by 2002:a05:6402:5003:b0:5c7:227f:3735 with SMTP id 4fb4d7f45d1cf-5c882608447mr2662395a12.34.1727438349277;
        Fri, 27 Sep 2024 04:59:09 -0700 (PDT)
Message-ID: <ea96c191-5f3b-445c-a8bd-f4da56eed5aa@suse.com>
Date: Fri, 27 Sep 2024 13:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] xen: introduce SIMPLE_DECL_SECTION
To: oleksii.kurochko@gmail.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
 <413dfb16280c3ec541df8775d31902a4b12a64fe.1727365854.git.oleksii.kurochko@gmail.com>
 <ZvZlqy4Y57ewtcq9@macbook.local>
 <05958c4be241866a5698a1396416b2d6317acc17.camel@gmail.com>
 <ZvZ9zkCme0r8bqmC@macbook.local>
 <d06c89fed69930f03db078d3d9d633026d5a604a.camel@gmail.com>
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
In-Reply-To: <d06c89fed69930f03db078d3d9d633026d5a604a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.09.2024 12:42, oleksii.kurochko@gmail.com wrote:
> On Fri, 2024-09-27 at 11:41 +0200, Roger Pau Monné wrote:
>> On Fri, Sep 27, 2024 at 11:07:58AM +0200,
>> oleksii.kurochko@gmail.com wrote:
>>> On Fri, 2024-09-27 at 09:58 +0200, Roger Pau Monné wrote:
>>>> On Thu, Sep 26, 2024 at 06:54:20PM +0200, Oleksii Kurochko wrote:
>>>>> Introduce SIMPLE_DECL_SECTION to cover the case when
>>>>> an architecture wants to declare a section without specifying
>>>>> of load address for the section.
>>>>>
>>>>> Update x86/xen.lds.S to use SIMPLE_DECL_SECTION.
>>>>
>>>> No strong opinion, but I feel SIMPLE is not very descriptive.  It
>>>> might be better to do it the other way around: introduce a define
>>>> for
>>>> when the DECL_SECTION macro should specify a load address:
>>>> DECL_SECTION_WITH_LADDR for example.
>>> In the next patch, two sections are introduced: dt_dev_info and
>>> acpi_dev_info. The definition of these sections has been made
>>> common
>>> and moved to xen.lds.h, and it looks like this:
>>>    +#define DT_DEV_INFO(secname)    \
>>>    +  . = ALIGN(POINTER_ALIGN);     \
>>>    +  DECL_SECTION(secname) {       \
>>>    +       _sdevice = .;           \
>>>    +       *(secname)              \
>>>    +       _edevice = .;           \
>>>    +  } :text
>>> (A similar approach is used for ACPI, please refer to the next
>>> patch in
>>> this series.)
>>>
>>> For PPC, DECL_SECTION should specify a load address, whereas for
>>> Arm
>>> and RISC-V, it should not.
>>>
>>> With this generalization, the name of DECL_SECTION should have the
>>> same
>>> name in both cases, whether a load address needs to be specified or
>>> not
>>
>> Oh, sorry, I think you misunderstood my suggestion.
>>
>> I'm not suggesting to introduce a new macro named
>> DECL_SECTION_WITH_LADDR(), but rather to use DECL_SECTION_WITH_LADDR
>> instead of SIMPLE_DECL_SECTION in order to signal whether
>> DECL_SECTION() should specify a load address or not, iow:
>>
>> #ifdef DECL_SECTION_WITH_LADDR
>> # define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
>> #else
>> # define DECL_SECTION(x) x :
>> #endif
> Thanks for the clarification, I really misunderstood your initial
> suggestion.
> 
> I'm okay with the renaming; perhaps it will indeed make things a bit
> clearer.
> 
> If Jan doesn’t mind (since he gave the Ack), I'll rename the define in
> the next patch version.
> Jan, do you mind if I proceed with the renaming?

I'm not overly fussed, so fee free to go ahead and retain my ack.

Jan

