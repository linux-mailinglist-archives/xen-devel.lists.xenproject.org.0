Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A107DAD2E11
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 08:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010504.1388608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOsk0-0006mt-HB; Tue, 10 Jun 2025 06:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010504.1388608; Tue, 10 Jun 2025 06:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOsk0-0006lP-EK; Tue, 10 Jun 2025 06:45:48 +0000
Received: by outflank-mailman (input) for mailman id 1010504;
 Tue, 10 Jun 2025 06:45:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOsjy-0006kt-Ir
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 06:45:46 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 895d3f00-45c6-11f0-a305-13f23c93f187;
 Tue, 10 Jun 2025 08:45:46 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45310223677so15469205e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jun 2025 23:45:46 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244d66dsm11309471f8f.70.2025.06.09.23.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 23:45:45 -0700 (PDT)
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
X-Inumbo-ID: 895d3f00-45c6-11f0-a305-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749537945; x=1750142745; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rPqqmChlsscHEQwEsLxtyHC0WCfJon+msaoELp0p7pI=;
        b=OomnDXjnwWGAjLhdqZf7SHKEoHTqIVX8+XiJ5EKP2En6a2p8iInWUboI7xcYTFHebM
         yYdi7p/lKkiltlCjiqkbfKgTIvGdvWLjSAvH4Ef9WYbtd5XoaVXtsi5u3mlyJ/y1p6M+
         tmGSGzUTtxN6egFQUwULfn9WovxEUMSX/bfSi6e2JRQ2JXYBce0N2gJTncDIoY+fICU8
         upsFIXTvR5gM9kgacl/RbScNa87csbtdfksDEllbHyoZP0IhoGDFjq6KHEwsN+EaPQxg
         D8e+fWu3R2s3TpcTMnWAatgEeBDIQ4a10Nm7zb1BIkB5OV6HhycMiAr+N8RlM537t2Hd
         0jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749537945; x=1750142745;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPqqmChlsscHEQwEsLxtyHC0WCfJon+msaoELp0p7pI=;
        b=fnXZsc0hcSA7hh/W3wdmwQNbQ80L+0QnNmt54vrUeWvrRUy09wfVGO9DMHb0q8dj0y
         aGu3bFSXHzebbNi9y0qX3unFZED+/t1jVBPuh/uKaHjwasiup6MLHD+AB3B5ZZgH/spR
         AHetT2OHOjnfcXTrFFLSErXZv3IH4FhQ4NKrdHNmlqSYXhXFPMKaYfksFv/H1lljXBYW
         wQ5HVEW0S3MD6F0OknysXK6mjk7flAck3POMHGxdCuyqMfvaCoTNNSbU/AsZiX9YTdKF
         kgwp2xSwIGSuQRWTBP9IV08O7cWg9XEb8O0q2D52JT3qfFLYwu+ImReL6IVlYrEQQ34b
         A0Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXjOrHb3F4+aGASCtSN0H4+N8Kk4ypkW1EiCgp6kRhn4hFOKxmRxFrM1VQNLXHAVyB8ppiHH99eF/o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJzT3SIooIJiWB07oNR6bAIe0pJiNh58tu9r4xhVd5sKj2Qq33
	edNCGGpaLClG6tsSzQpoYJArAJqYtddNwgBDKxva8k5h88YPXuFVW7caQnV/ZMg4DA==
X-Gm-Gg: ASbGncu6EbFQyovU+1o01mf2n//FEnwMoqoKV+U7RcbvZkUjrY1N2R/qnQVnjMYjGyH
	3Qkmrc2K3euKH1d7NvicIqJsWklpypT2BEizksIJ1qr7jCReVHf33GUUWRSp/ty7pYagnxkwDuO
	hB1xQgx/xxzx20IuJICDVxsD4r84shRvKd0HJJYr0lDgM2s2Y2k1lGyPdVUZFPQ5mFU8Z2pD2Fc
	CUIu6IclupTqyL/eFFSOCmGTP/LG95v5JEiceKcLW3SpMA8lDyKIWLvAFPJOUSossLbTVDzayn6
	prGV/v+peFq/PD5pVxQLLXQ5/5GbX1OE/f2Nj5rHpfFntn6Sg8BTnSsI/9sfObAjjG5IhbvzEm6
	AzsGMm1C0qJFvHJUdtYBv2aLwblbCscdIzrlFuQY9w0KYcsWoTlBVxRoGa6jIAPad1XZ5jL7uoH
	O/ghnGSKeoij5v774ZL6nW
X-Google-Smtp-Source: AGHT+IFDQ80SIxCcpCujF8xngt+sFTFE4Mll8+iFFyOmrlVzQ8Zs20zDC8WcyZDsHfGhEm2lactEEw==
X-Received: by 2002:a05:600c:a44:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-4520140470fmr127167715e9.25.1749537945407;
        Mon, 09 Jun 2025 23:45:45 -0700 (PDT)
Message-ID: <315e605d-2da6-4df5-b791-b3f59e0ff6d4@suse.com>
Date: Tue, 10 Jun 2025 08:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: remove memcmp calls non-compliant with Rule 21.16.
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 xen-devel@lists.xenproject.org, federico.serafini@bugseng.com
References: <20250604233537.2892206-1-stefano.stabellini@amd.com>
 <c252a43a-4e00-4584-bbb1-05347aa9b49f@suse.com>
 <alpine.DEB.2.22.394.2506051624050.2495561@ubuntu-linux-20-04-desktop>
 <13ad335c1868bcc02e2dc0a8da521f6d@bugseng.com>
 <alpine.DEB.2.22.394.2506061347230.2495561@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506061347230.2495561@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2025 22:49, Stefano Stabellini wrote:
> On Fri, 6 Jun 2025, Nicola Vetrini wrote:
>>>>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>>>>
>>>> Missing your own S-o-b.
>>>>
>>>> Also (nit) may I ask that you drop the full stop from the patch subject?
>>>
>>> I'll add the S-o-B and fix the subject
>>>
>>>
>>>>> --- a/xen/arch/x86/dmi_scan.c
>>>>> +++ b/xen/arch/x86/dmi_scan.c
>>>>> @@ -233,7 +233,7 @@ void __init dmi_efi_get_table(const void *smbios,
>>>> const void *smbios3)
>>>>>  	const struct smbios_eps *eps = smbios;
>>>>>  	const struct smbios3_eps *eps3 = smbios3;
>>>>>
>>>>> -	if (eps3 && memcmp(eps3->anchor, "_SM3_", 5) == 0 &&
>>>>> +	if (eps3 && strncmp(eps3->anchor, "_SM3_", 5) == 0 &&
>>>>
>>>> Unlike the last example given in the doc, this does not pose the risk of
>>>> false "not equal" returns. Considering there's no example there exactly
>>>> matching this situation, I'm not convinced a change is actually needed.
>>>> (Applies to all other changes here, too.)
>>>
>>> If we consider string literals "pointer types", then I think you are
>>> right that this would fall under what is permitted by 21.16. Nicola,
>>> what do you think?
>>>
>>
>> While I agree that the result of the comparison is correct either way in these
>> cases, the rule is written to be simple to apply (i.e., not limited only to
>> those cases that may differ), and in particular in the rationale it is
>> indicated that using memcmp to compare string *may* indicate a mistake. As
>> written above, deviating the string literal comparisons is an option, which
>> can be justified with efficiency concerns, but it goes a bit against the
>> rationale of the rule itself.
> 
> Also looking at Andrew's reply, it seems that the preference is to
> deviate string literals. The change to docs/misra/rules.rst is easy
> enough, but I am not sure how to make the corresponding change to
> analysis.ecl.
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index e1c26030e8..56b6e351df 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -813,7 +813,7 @@ maintainers if you want to suggest a change.
>         shall point to either a pointer type, an essentially signed type,
>         an essentially unsigned type, an essentially Boolean type or an
>         essentially enum type
> -     - void* arguments are allowed
> +     - void* and string literals arguments are allowed

Yet as per my earlier reply: This would go too far, wouldn't it?

Jan

