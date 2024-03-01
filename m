Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA3486DC7D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 08:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687533.1071126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfxjQ-0002cs-80; Fri, 01 Mar 2024 07:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687533.1071126; Fri, 01 Mar 2024 07:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfxjQ-0002au-5N; Fri, 01 Mar 2024 07:55:00 +0000
Received: by outflank-mailman (input) for mailman id 687533;
 Fri, 01 Mar 2024 07:54:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KgAT=KH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfxjP-0002ao-Cb
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 07:54:59 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff67f1f8-d7a0-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 08:54:58 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a3e85a76fa8so255499966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 23:54:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ps7-20020a170906bf4700b00a3e53eb1dcasm1452980ejb.107.2024.02.29.23.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 23:54:56 -0800 (PST)
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
X-Inumbo-ID: ff67f1f8-d7a0-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709279697; x=1709884497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mpWpo1TlcJ9WH96OHYamwi3lHe6uk74EdSkVgHIpH+Q=;
        b=IwQ51CSULBddrLUedMDHSJtEOm+pQAbmigLI7lw+DIRnTLBjiJjH1RHX5//+T3Fz2X
         hDAQL4858FIJjc+9vL2xlqAnmOAYDpeMak08meXJ9CbFDbCl5tq00kJkn/9RQiqyBij9
         15JZOitPIUr//uGq0JUh1WyxD6vMt1B2X1sSjHxbtU/ppn7nLfKWSgwmfqhlzu0vLOAN
         rE693d+z5D2kBXMkST7Nwbcz+q4aHV9uqXCjaaQT04p5S7fbeDTcktF96OarQEt3qpln
         uadXo8sba9L/fVDlsaN8zsmmy+P/va9K3umfT+APPtEpzZbLYgOIBbJFnvaX8UzK4Ni7
         iFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709279697; x=1709884497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mpWpo1TlcJ9WH96OHYamwi3lHe6uk74EdSkVgHIpH+Q=;
        b=s6E3ChD1fdoFs92bhHvT2zDpqEjrvqLyh8P5pPxSLHqgykobzFeICbvuY+80WqtBso
         XuyZqe7xCjJ1ntvpdweLm/0mlS+GorElCSoPevG0wRUNQTYKD5J8gYyUFpCw8lHTalSN
         DQU1YkaEikEVSyh/Qt0Kxq0IPBpV6vB6cCeHCRdRBZ4vV4tTN1dLh29190N5qCeW8fid
         L2EE80X5A6nelyYHGyJe8hYaBbBIk/4gu907vAIEMVPaF3Ffu7S/yk6rjfMDDEUsMZiq
         Vw0YDIxo43EqWqKR2El+APZ1/RYpdTiSafba37+U903XxtUrRS/usPYoRG2dIc5nRI4r
         qaEA==
X-Forwarded-Encrypted: i=1; AJvYcCUf8Xieu1RaZA3EU60ZGdC3r6A1wyX5J1nIZq9aJXa+DmHp510KkbFlClFiBnETchB4nFFRKblFtmX6QhkbqDtwXbnKsT0/Fst9hoLokTQ=
X-Gm-Message-State: AOJu0Yxi0+Hw++SXvvQ6Z3n3K/nndhI+fO/6yB+vAz4gBjmWR0Dx9lZN
	qClufp2bVgivVdjWEQGzwpr0qzVoFlH9ZucX6+bmgjVrrbP3CuvcuGkfF00DNA==
X-Google-Smtp-Source: AGHT+IFt22qXCM/U892YNnIsIY7ehVU++ZkbWlnv0191Or5xNIGcoWpzBYdFESrOEpssH419yuQ94w==
X-Received: by 2002:a17:906:f812:b0:a44:81f0:6c7f with SMTP id kh18-20020a170906f81200b00a4481f06c7fmr769774ejb.22.1709279697148;
        Thu, 29 Feb 2024 23:54:57 -0800 (PST)
Message-ID: <513e3eb1-d192-4317-afc1-55cb44e4c7c7@suse.com>
Date: Fri, 1 Mar 2024 08:54:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 04/10] xen/public: address violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <0cdc4dc2fcad699a2274277b32de3ee0207d5a2d.1709219010.git.nicola.vetrini@bugseng.com>
 <bd95193c-522a-4c74-98e0-68fa088a5b49@suse.com>
 <82940f688e5a5eee274fa579991ebd15@bugseng.com>
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
In-Reply-To: <82940f688e5a5eee274fa579991ebd15@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 17:49, Nicola Vetrini wrote:
> On 2024-02-29 17:40, Jan Beulich wrote:
>> On 29.02.2024 16:27, Nicola Vetrini wrote:
>>> --- a/xen/include/public/xen.h
>>> +++ b/xen/include/public/xen.h
>>> @@ -988,7 +988,7 @@ typedef struct {
>>>        ((b) >>  8) & 0xFF, ((b) >>  0) & 0xFF,                         
>>>   \
>>>        ((c) >>  8) & 0xFF, ((c) >>  0) & 0xFF,                         
>>>   \
>>>        ((d) >>  8) & 0xFF, ((d) >>  0) & 0xFF,                         
>>>   \
>>> -                e1, e2, e3, e4, e5, e6}}
>>> +                (e1), (e2), (e3), (e4), (e5), (e6)}}
>>
>> Why? Wasn't it agreed already that long macro arguments passed on
>> (no matter whether to a function, a macro, or like used here) don't
>> need parenthesizing?
>>
> 
> That applies to all outermost macro invocations, but not to the 
> innermost one. If you want also aggregate initalizers to be deviated, 
> that could be done (provided that the macro arg is not included in some 
> expression, such as "{..., e1 + 1, ...}"

Sure, this obviously needs to be "{..., (e1) + 1, ...}" then. But yes,
the full scope of the underlying pattern ought to be excluded from
needing (pointless) parentheses added. Even in a plain comma expression
you don't need them - to pass in a comma expression the invocation site
of such a macro would then need to parenthesize the respective operand
(or else it would be two separate operands).

The one case we're leaving aside here anyway is use of odd things like

#define M a, b

and then passing M into another macro.

Jan

