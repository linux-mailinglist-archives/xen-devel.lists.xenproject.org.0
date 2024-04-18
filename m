Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB51D8A9843
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 13:10:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708218.1106901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxPeJ-0005QB-6J; Thu, 18 Apr 2024 11:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708218.1106901; Thu, 18 Apr 2024 11:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxPeJ-0005O0-1y; Thu, 18 Apr 2024 11:09:51 +0000
Received: by outflank-mailman (input) for mailman id 708218;
 Thu, 18 Apr 2024 11:09:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxPeH-0005Nu-Ti
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 11:09:49 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ba36f13-fd74-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 13:09:48 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34388753650so331805f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 04:09:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y18-20020a056000109200b00343300a4eb8sm630506wrw.49.2024.04.18.04.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 04:09:47 -0700 (PDT)
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
X-Inumbo-ID: 2ba36f13-fd74-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713438588; x=1714043388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZlChCvj/M8OawAmjv/Qjcp6V1xQnjZVmsinFhTGb7Bw=;
        b=AIHIqak0l27sG8/XX+ivFApINpGgH7ABl7U7TG4qreTgE9Ntv+UJbr3nnezM6qmBJw
         CKIswEdMYcHwC+tFn1YSFKqhXDGVQ+QlmkU9Cw5z5OQTm6n3+cwiSWbiBosCk332Hd19
         vA5ZCBgNzxAp+S5lj3zJxMi8NEeqAH1wKz765/uX/Noz7B59d87KQTd6zIM/ZZGlqunC
         znPZbBOPhxcoG+AqDpzJOhjEjdjj0dclGOj7yGSbZTaaado+aE8ojMmk6ie9NjycYEoI
         E3VS3JKpSLCI6o1C79X7ripB/u6yqN+gybBNZz7alGL7wjZvADFDK+q6GRXR2PigKBrJ
         Rvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713438588; x=1714043388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlChCvj/M8OawAmjv/Qjcp6V1xQnjZVmsinFhTGb7Bw=;
        b=Stprc5siQFNOmGgy+LFOG9W9xGQUyeeAGCDAc1JprRnMepgT2JM0uvV1nORNYGk3O2
         6G8bqXS9e+aZReyCbC6P1LcGggkpwmhtecoaoXSdplhSODZ0KNaK61IXLW8cnU09Sxa0
         k1ebBP9X+f/TS/tF4l+hVegNUkZyBycFZ2QA6e3kDuyGRTrCGBq9/fb4ol3NPy3jyVKv
         4wiiIOmRhPEiEE6mPNjDz82fCNS0w+Pxv2pN2VjZdRKWZFA5qqQlYvLFLvBUP/rAOAm1
         I3EcQXXNCdX293YlXPc6VE936hxqRaWldQUw3ckJNs3t4qVtMTpWHF5xOIbwe53KYIrF
         0Ibw==
X-Forwarded-Encrypted: i=1; AJvYcCVF7s0EUHLbEH0CJDIA8uch1LAfr+d5hdvMGq25iKfbwuPtQbxEHbXRDEq902A0i/cIdBCd/DlZ3Dcz+ScIJmFW++BepmFX33rhHr1CCzs=
X-Gm-Message-State: AOJu0Yxy5h0FqcbfpvoHmbfMmp4iK8+vUmER/0Vj4yF9d579MiX+TkAh
	+SIJAtz1BTnKaZAsJgxEf/UKCY1v8O3O0i/jiyfuc6Ayz0GhAOtZMIVZs1kubg==
X-Google-Smtp-Source: AGHT+IE+S5+24sx2PK+0VhS5RdpQoSG5QMBKsteqKwDnTFCsZHfOJSjroplxbGcv+MV7fYYQDI57bA==
X-Received: by 2002:adf:f2d1:0:b0:349:8ae9:b01f with SMTP id d17-20020adff2d1000000b003498ae9b01fmr1638082wrp.1.1713438588148;
        Thu, 18 Apr 2024 04:09:48 -0700 (PDT)
Message-ID: <e494f047-d2be-4467-87c3-7908d98767bf@suse.com>
Date: Thu, 18 Apr 2024 13:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Rewrite DOS/PE magic checking without memcmp()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240416155251.2942504-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240416155251.2942504-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2024 17:52, Andrew Cooper wrote:
> Misra Rule 21.16 doesn't like the use of memcmp() between a string literal and
> a UINT8 array.  Rewrite using plain compares.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
after having realized that sadly gcc13 instantiates the compound literals
(that I had thought of using) in .rodata (or one of its variants), rather
than leveraging them being as constant as string literals.

Jan

