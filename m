Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBB78C613F
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 09:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721945.1125669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s78rJ-0000rp-Rw; Wed, 15 May 2024 07:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721945.1125669; Wed, 15 May 2024 07:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s78rJ-0000pj-OJ; Wed, 15 May 2024 07:15:29 +0000
Received: by outflank-mailman (input) for mailman id 721945;
 Wed, 15 May 2024 07:15:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s78rI-0000pU-5N
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 07:15:28 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e70f3dfd-128a-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 09:15:26 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a5a4bc9578cso109833366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 00:15:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17808sm818515166b.217.2024.05.15.00.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 00:15:25 -0700 (PDT)
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
X-Inumbo-ID: e70f3dfd-128a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715757326; x=1716362126; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AqjT/Vw8JQwJFf9t9q08Z/+6wDrjcT15ZWT0eOsy1mo=;
        b=G4i4KkFqiWblnLXVi02IM3KAdpxITAVz7Y+3RupL3+OMqtDSeYz63brdfJhRyKUC7C
         zN3MdiqNwpMF8jdnsvYSUwEsk9cIphjDFQ6svU+o0BQqSFMPrUV91MpcOkSlQyFlYt/M
         UDl++t/qPuncto7osgnzUdNpNH4ajXcsh2jQndmyKRk4KLW82LClTvbtyIfsoXAb/5YM
         VtaAkO8nsYopsnqe6iNjWYF1hZdbv2V8PjihqVuHMDStxv8KX68YGnQJtcaG0qyXbZ7/
         LOmJF1xfY4JqBYEwBpOCZYwDk46ORssYQFt5vciS2TWg1/FVy5amLf8eNUq3bjyX5PSX
         CF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715757326; x=1716362126;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AqjT/Vw8JQwJFf9t9q08Z/+6wDrjcT15ZWT0eOsy1mo=;
        b=WDmM5GocyViDt9bDsqxu+c63VgRZrfQ/5CUGNxH0cv/Qxf3jAwZJ61oJ3A00RiTsn4
         7Yzfn7FVW0BR118+M4nBfxAi30zrikCstJ+iEPPDZkZhfd291jh4qSTMi1PVo8pAtwU3
         EgXcY22dEBFSFqA4q2rVxe3TdySQVb6LVsQg5uQV3dvaVHCRlAQy6nWgmwXqbl+ziK41
         YUk/vB9mfpGhfh4Y2rFgj1Tso6/UgIM3KY75O8xW/BunCzo0CYgqAYRSozzuTARfPtbx
         T2/AjaDSPrLV2qeBlifOQpHG+xVxpHlhkH5Pdr8aPgFBZ3LHQlsNM7K9kDattCvb5tM9
         ypPQ==
X-Gm-Message-State: AOJu0YyE0b1h9EBKNqNp0mXaRd6+vQtZM/U2x0aaSDCejCe+APBOjmYN
	hh4ct8pn5TlgHVpa9OPV8io4a2v7yPonmKP3VqALUTVrD8DkduR921cHCRD4Dw==
X-Google-Smtp-Source: AGHT+IEyyzYPWsBBdsqni4ZFE6NQulhlTyQ+K1YyQOV6qel+KJkKT4WcqGxPntiFKZgXI61UeVP+og==
X-Received: by 2002:a17:906:b346:b0:a5a:2d0d:2aef with SMTP id a640c23a62f3a-a5a2d55ef25mr1473080466b.21.1715757325782;
        Wed, 15 May 2024 00:15:25 -0700 (PDT)
Message-ID: <93b11c7f-a422-473e-ae0e-3f0a53ea0190@suse.com>
Date: Wed, 15 May 2024 09:15:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 03/10] automation/eclair_analysis: deviate macro
 count_args_ for MISRA Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 bertrand.marquis@arm.com, julien@xen.org,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
 <7de407c218f0911e28b7c3f609a55636165166a8.1713885065.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2404241727520.3940@ubuntu-linux-20-04-desktop>
 <5b675fcdf688723bc6d4ea260d10004e@bugseng.com>
 <alpine.DEB.2.22.394.2405011254290.497719@ubuntu-linux-20-04-desktop>
 <006e9d571de6383679ab7fdb84dfcdd7@bugseng.com>
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
In-Reply-To: <006e9d571de6383679ab7fdb84dfcdd7@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2024 09:09, Nicola Vetrini wrote:
> On 2024-05-01 21:54, Stefano Stabellini wrote:
>> On Mon, 29 Apr 2024, Nicola Vetrini wrote:
>>> On 2024-04-25 02:28, Stefano Stabellini wrote:
>>>> On Tue, 23 Apr 2024, Nicola Vetrini wrote:
>>>>> The count_args_ macro violates Rule 20.7, but it can't be made
>>>>> compliant with Rule 20.7 without breaking its functionality. Since
>>>>> it's very unlikely for this macro to be misused, it is deviated.
>>>>
>>>> That is OK but can't we use the SAF- framework to do it, given that it
>>>> is just one macro?
>>>>
>>>> If not, this is also OK.
>>>>
>>>>
>>>
>>> It would be more fragile, for no substantial gain
>>
>> OK
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I think this patch slipped through the cracks. I see it only has 
> Stefano's R-by, so perhaps it needs a further ack?

I don't think it does. All it needs is putting in. I guess I assumed
Stefano would be taking care of that, with your discussion (quickly)
settled.

Jan

