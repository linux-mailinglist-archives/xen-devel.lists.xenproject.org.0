Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AE992D19F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 14:31:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756931.1165663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRWSW-0003eH-Oc; Wed, 10 Jul 2024 12:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756931.1165663; Wed, 10 Jul 2024 12:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRWSW-0003bx-M3; Wed, 10 Jul 2024 12:30:08 +0000
Received: by outflank-mailman (input) for mailman id 756931;
 Wed, 10 Jul 2024 12:30:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRWSV-0003aV-G7
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 12:30:07 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 234e922b-3eb8-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 14:30:06 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ee91d9cb71so60571911fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 05:30:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ad00edsm32449045ad.273.2024.07.10.05.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 05:30:04 -0700 (PDT)
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
X-Inumbo-ID: 234e922b-3eb8-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720614605; x=1721219405; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LsvXS+XTwUZXgqIh4eU9rCb8aC5tRjW3JD3+6HlholI=;
        b=IbaDO9gulb1dpKhvjb1R5hS8RTGmeQ/NBY/qF9sOwQ3BowiFb1Rd6J8u7RhtBOID6L
         fVeyc/K8d+8qVTG7y1YC6MUjjCNMaSRfZWdfzdRXaZY8UwD9TdqAm7CCM1Ny8btXe7jg
         Pbgo6C71YEahTvTyrhdK949EppcsUvBMDXJyA/isNis1xwdtzEzY3eZFpipDMDIFD7bD
         OqZyOVqnZ5RWhCHJ8HeW3v4sDVyewZ56afUPCoJNl5JhxyjPhMuHSE+vcpfouv3io4IF
         080Jk59BOAawrjXBzi5PvB2WXbFP9K1cdEXGARA2UAiiM1KFNgdnaoa+jUrPQLsykhRy
         76AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720614605; x=1721219405;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsvXS+XTwUZXgqIh4eU9rCb8aC5tRjW3JD3+6HlholI=;
        b=CATQAcrImVtrpvLMv1REYCYOCcmmQpdd/tp37CQ9db6DQFPUculhgWctKFg74x4ETT
         mC93h7V0S/14oT0RlZmmyWcxNce6bqvmS4/G0cxL3ceTzbQtphSd7SEfWbbGnlzk4Rss
         ljyzFn5Ohln9XkGT2+MrdSpfxwtyBafQ0CQcEIo7qxIAP/YMY7S142bc0XrUUI2aURx8
         Oni6W9a/JA1amHCvH3VeVY3JXB7oNbvtTTAadlK8g11Vo+mT1zJ+3mDCngCSQzURGY1R
         bHLXDMwS5ak1xksHyKprnAD3Nfm4MqUv2BOJ8A5MR2+sxqb+5cgvU/WH3pUBrQ+7ugvB
         foBA==
X-Forwarded-Encrypted: i=1; AJvYcCUAlCP4VR2AycA2e0ATZ9l27/YtE3cisDsydASlH3bsqhPtrG1vDH6OUOycdBfLaT2kEmbzcNnVe4gRNEAjGNJ/zoC+ULlnQYQT5Of622c=
X-Gm-Message-State: AOJu0YwaFipQV6MWPd9iKadWkgp4mxZVpFJLOKMqQesu29CQP1GPzGYK
	d95LOn37750GkQ3kOSStminqxkMPElYJ1XoUFZn+8h8W6MCaHNTSSaZEZw+7lA==
X-Google-Smtp-Source: AGHT+IG6sJlrHjSzxXiw15ln+pyrjeRCOFuCrHkYGHzW3D/pibAc6BPG/PpJtqINrP+j142zdZCUCw==
X-Received: by 2002:a2e:834b:0:b0:2ec:f68:51de with SMTP id 38308e7fff4ca-2eeb318aaffmr32852281fa.47.1720614605447;
        Wed, 10 Jul 2024 05:30:05 -0700 (PDT)
Message-ID: <e111c338-b45b-45a0-89c9-45efd016e352@suse.com>
Date: Wed, 10 Jul 2024 14:29:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 01/14] x86: introduce AMD-V and Intel VT-x Kconfig
 options
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <f6bfed3cd9e9fff25cbe0c5e16d8d88541be212f.1720501197.git.Sergiy_Kibrik@epam.com>
 <1d3476db-019f-4e5e-ad5f-381fe1e5b1c6@suse.com>
 <7051c9cd-4db5-4f99-91f2-eebe480ec4b4@epam.com>
 <02e9e65c-0fa0-467f-aa60-159524dafaaa@suse.com>
 <fa9644fe-ae7e-482b-b83b-537c947e3cab@epam.com>
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
In-Reply-To: <fa9644fe-ae7e-482b-b83b-537c947e3cab@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.07.2024 12:52, Sergiy Kibrik wrote:
> 10.07.24 13:28, Jan Beulich:
>> On 10.07.2024 12:21, Sergiy Kibrik wrote:
>>> 09.07.24 10:11, Jan Beulich:
>>>> On 09.07.2024 07:45, Sergiy Kibrik wrote:
>>>>> From: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>>>
>>>>> Introduce two new Kconfig options, SVM and VMX, to allow code
>>>>> specific to each virtualization technology to be separated and, when not
>>>>> required, stripped.
>>>>> CONFIG_SVM will be used to enable virtual machine extensions on platforms that
>>>>> implement the AMD Virtualization Technology (AMD-V).
>>>>> CONFIG_VMX will be used to enable virtual machine extensions on platforms that
>>>>> implement the Intel Virtualization Technology (Intel VT-x).
>>>>>
>>>>> Both features depend on HVM support.
>>>>>
>>>>> Since, at this point, disabling any of them would cause Xen to not compile,
>>>>> the options are enabled by default if HVM and are not selectable by the user.
>>>>>
>>>>> No functional change intended.
>>>>>
>>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>>>> ---
>>>>> changes in v3:
>>>>>    - tag added
>>>>
>>>> And then removed again in v4? My prior ack stands, but - as before - conditional
>>>> upon us being certain that we want to go with the ambiguous ...
>>>>
>>>>> changes in v2:
>>>>>    - simplify kconfig expression to def_bool HVM
>>>>>    - keep file list in Makefile in alphabetical order
>>>>> changes in v1:
>>>>>    - change kconfig option name AMD_SVM/INTEL_VMX -> SVM/VMX
>>>>
>>>> ... result of this change (firmly ambiguous for SVM, latently for VMX).
>>>
>>> I've put my thoughts about naming in the series' cover letter, however
>>> I'm not strongly preferring current naming and if it finds no advocates
>>> I'll rename it in next series.
>>
>> Just to clarify: Did anyone ask for the name change done in v1? If so,
>> maybe that request cam with some justification?
> 
> yes, that request came from you:
> 
> https://lore.kernel.org/xen-devel/e29e375f-3d30-0eb1-7e28-b93f2d831b43@suse.com/

Hmm, how unfortunate. I definitely want to take back that comment, for the
reason given (in context) above. I'm sorry for the back and forth then, also
to you, Xenia.

Jan

