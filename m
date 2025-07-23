Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1147B0F60A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054315.1423077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueapo-0001KI-6l; Wed, 23 Jul 2025 14:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054315.1423077; Wed, 23 Jul 2025 14:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueapo-0001HB-3r; Wed, 23 Jul 2025 14:52:44 +0000
Received: by outflank-mailman (input) for mailman id 1054315;
 Wed, 23 Jul 2025 14:52:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueapm-0001H5-VH
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:52:42 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeb34bb0-67d4-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 16:52:41 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so5114102f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 07:52:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e519e16c2sm1849054a91.11.2025.07.23.07.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 07:52:40 -0700 (PDT)
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
X-Inumbo-ID: aeb34bb0-67d4-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753282360; x=1753887160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SjhofkNe5aXCdXo/iFQ72PeLEtL9GrsxkMceFYmIxnY=;
        b=Sg76MJu6lfIeIV2XUQ/aMxyP8n7L9UgJWWkLBn324tkDwJReEm3JpyTPkWN1qSXEtE
         2HgjLSG7zKZozWC005MfnROyd+rqKfmHBnPkJqgFFJbkxOYwfritGL3vZp9zSz15E+Tg
         kfbnoOBy6tByz1sQDnu+KLK08/6ch+h0DoZtZshuw/ePXuGlVvO42YQeWi/sNSu8vlOI
         ZzYVW1lKDgHRSZGlM8OLzszf70BME06aUjNIoILQtm7Rok9601mRhAlcc1jPrpcoQbyq
         at8TNc+q4E7wLlYIOk2lYbp+uHxaLX9ZA2MmKOTVAgN5WZqsc8JMoX6NfHWWT9QMhzFu
         z22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753282360; x=1753887160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjhofkNe5aXCdXo/iFQ72PeLEtL9GrsxkMceFYmIxnY=;
        b=sOje5osVMDCAvlxfNGLurP1z9tEDk9zpdbby4asywajVtNJ1PoJw65Fc076vdaSTGE
         R2L2vpdeDM28snL+Be5yw+fRhqQb35+plC3by02/xFtZkyyZgdMCP0UrS15RJiD0emQE
         o8AvQ9Sb/wAm9iv9Jb3ByOEuDD4tyQagfeEaD6q0usWjm4x1Pr7PBDnZwYwXMWDqBll1
         sc//M83+eGLaUH2kvMsrYepCg4tFGZusjhbL+S08407bvtOO8LTeWf6KNLpleQm9IUmK
         T7kF58eXqbIWWWhJ0V9GFR6uHM8NxDj/JIBQvVWYZMA0JjbS6+lF0bKFRAvUswWN25Dw
         KU3w==
X-Gm-Message-State: AOJu0YwudvtZcbNFHRw18OgRUuUEzbQE/OWaHuJVQyWi13lhY5l8h/AG
	Qv8DZW+YMyh5c/vCMCS+eNgNdTBDJgsDoD3amwYdEC5BgN+LWTc6ZO0dJYhfGPsekw==
X-Gm-Gg: ASbGncvMdQd7Q1x4fGkX0e5nB28++r69cUG6wJwa65D7i1il1NnRbLDegmAQ7oL03O2
	jtphgyyyDuGL8/sGgnOMmKR39ibcoKCSmH/6/StzEGuC/0MSTCDq+VKBBeW5PjVSURrfxY3pIY/
	ZB/egMh5Bm+kM9fEWJJRwXVjG1OZVcJeLUI/nDSS6A8PvYpoztps3fxsh1TT66ndzaggrIbxqK9
	X7MjCjGwXuYgUiEBPuwCiUhAjqwrnA0fV8bXlhlXFxmlZbwQPCFeGn+Q420/XVAiPMHL9bvI+Mz
	pOlYwkVH71E6Okv/WfE9eJ3l+o6PX2m8kh/3lObQJ6Qid1zAJMRLbJPMF2fdBOINtFCOxHcXboA
	FMRPCrGUClRFssiLOuES3nOV01MeBQigjm5/98WRm9GweG38PPuVCQsViQtj3NHDUpqiqsA4TcD
	SwuqknsRkwqmbnlBOcMg==
X-Google-Smtp-Source: AGHT+IHTCqBVw9JVSmqG4qJrg4OopKXPfCD/SkhOP10gc4T4Rstd5PK3oPClaE9tFtGZtwEkf5O9WQ==
X-Received: by 2002:a05:6000:24c5:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3b768f00df9mr3346793f8f.48.1753282360537;
        Wed, 23 Jul 2025 07:52:40 -0700 (PDT)
Message-ID: <cc8416df-f37a-4178-a4d4-2a8be0019ca4@suse.com>
Date: Wed, 23 Jul 2025 16:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: correct scrub_page_{hot,cold}() prototypes
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <161f9018-7746-4f74-82cb-d3921a9be4e2@suse.com>
 <f0538799c8e18950b80efa939b43c8dc@bugseng.com>
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
In-Reply-To: <f0538799c8e18950b80efa939b43c8dc@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 16:47, Nicola Vetrini wrote:
> On 2025-07-23 16:37, Jan Beulich wrote:
>> ... to be in line with Misra rule 8.2 requirements.
>>
>> Fixes: 6ff0cfbfd4f7 ("mm: allow page scrubbing routine(s) to be arch 
>> controlled")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thanks.

>> ---
>> The offending patch had been pending for far longer than we care about
>> Misra, and hence at the time of writing I didn't pay attention. And 
>> then
>> I never looked again. I'm sorry.
> 
> Ah, sorry, I didn't notice your patch, I just sent basically an 
> identical one, feel free to disregard it.

I've seen it, but indeed I prefer to put in mine. "pg" is what we more
commonly use for struct page_info * type variables / parameters.

Jan

