Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCE9803A91
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 17:41:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647178.1009965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAC0F-0001mT-C4; Mon, 04 Dec 2023 16:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647178.1009965; Mon, 04 Dec 2023 16:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAC0F-0001jc-8O; Mon, 04 Dec 2023 16:41:03 +0000
Received: by outflank-mailman (input) for mailman id 647178;
 Mon, 04 Dec 2023 16:41:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAC0D-0001jW-ML
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 16:41:01 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7df6095-92c3-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 17:41:00 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c09fcfa9fso15132665e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 08:41:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p36-20020a05600c1da400b0040b478da760sm15732961wms.48.2023.12.04.08.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 08:40:59 -0800 (PST)
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
X-Inumbo-ID: e7df6095-92c3-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701708060; x=1702312860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NIMtUuTQIhSPd9127Q5A27fFAL47NR7g+c/kyNr6Q94=;
        b=EKnT81YRZ476vcoHAZVTxi5MhFKCJQ2mp3RH9iG9/qaJv/pCNgBOHZhkd6zD3zpQpe
         P5P+P1FjWpYSwXDl7yXCFFxx/Akkpv3FvSAtwAwpZ34X2OZ9EVSwccdQnirxveurura0
         K6GZcoKY6Kp5GBijgQg0lJvMCWfp4/zABbgbQQ53YqVfz75ETDT+yv3hXvyiQcZUHE5W
         wUq8y3TIc4eGhlxL3OY6jxKYv2cSO5pnkUOd7SK3YLbh4oMxJqRyLghk4ObrgTC9cisy
         C9JCPFrnGxSB4TYssv+NpwtWNPnbotcyxGsm9DHyEYoMRVtnUfBBMfLG/UJdZtzvPYAO
         26hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701708060; x=1702312860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIMtUuTQIhSPd9127Q5A27fFAL47NR7g+c/kyNr6Q94=;
        b=kAzAPbDfTgBmj217kP1/wkHXTnz0A+VlCmCwEqlF/pNeRDEyl1Ls6FM8JwXW/P1BCO
         38gucawmXR+d9qTYPH4dH/egZb9y4e8UdWLb0NOKBxZxN4Hj/iLfA0LPuyywHuN0r0/l
         4J/VuQHkU7xZ73jpGvkgrzWJ8hsJzVEl78swYPmUTL87I0yfQWUKVvr1L6civG2hQoGM
         +7smcDvy2x3GbL4+qFKfAZC2Y4k+A2ltL496pBQLbydAByIP3JBH5Z9rfMvlYDv3hguG
         BudJMBRtpOLWtG++OUSp7OtLM0eyJmIwnljfrjBy/EnMwHIDL09jx+Fu/MvdIzdEBfFq
         JIJQ==
X-Gm-Message-State: AOJu0YzrPNX4LyvccFIuRufriMzivDMUBp83oJRUK0DKDeFYZ/gbcQi7
	yUW1COqSaX/5pcrfmX1S3JnK
X-Google-Smtp-Source: AGHT+IHtufL+DiWDYI6HeTUI/PGm5rG9xQhggheS4VxidZa3OxOPF2wB+78VVmZw9NVNoyTb1qktWA==
X-Received: by 2002:a7b:ce0e:0:b0:40b:5e59:f73c with SMTP id m14-20020a7bce0e000000b0040b5e59f73cmr1451476wmc.174.1701708059676;
        Mon, 04 Dec 2023 08:40:59 -0800 (PST)
Message-ID: <fa2971c0-10fc-48b8-9031-53e56ae08319@suse.com>
Date: Mon, 4 Dec 2023 17:40:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 6/7] xen/x86: remove stale comment
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
 <d06ee9f139392045fb8d927ff3a0c38fdc5080c6.1701270983.git.nicola.vetrini@bugseng.com>
 <48f44ee5-95c5-4656-97f1-7fa6d0fdc53c@suse.com>
 <528ef7334c091ad9acb0316cf4b5558b@bugseng.com>
 <5b48da47a91a8e339b202a78bc5fd1eb@bugseng.com>
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
In-Reply-To: <5b48da47a91a8e339b202a78bc5fd1eb@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2023 17:26, Nicola Vetrini wrote:
> On 2023-12-01 17:57, Nicola Vetrini wrote:
>> On 2023-11-30 17:41, Jan Beulich wrote:
>>> On 29.11.2023 16:24, Nicola Vetrini wrote:
>>>> The comment referred to the declaration for do_mca, which
>>>> now is part of hypercall-defs.h, therefore the comment is stale.
>>>
>>> If the comments were stale, the #include-s should also be able to
>>> disappear?
> 
>>>> --- a/xen/arch/x86/include/asm/hypercall.h
>>>> +++ b/xen/arch/x86/include/asm/hypercall.h
>>>> @@ -12,7 +12,7 @@
>>>>  #include <xen/types.h>
>>>>  #include <public/physdev.h>
>>>>  #include <public/event_channel.h>
>>>> -#include <public/arch-x86/xen-mca.h> /* for do_mca */
>>>> +#include <public/arch-x86/xen-mca.h>
>>>>  #include <asm/paging.h>
>>>
>>> Here otoh I'm not even sure this public header (or the others) is 
>>> (are)
>>> really needed.
>>>
>>
>> I confirm this. It build even without this header.
> 
> It does appear to be needed after all. I did two differential pipeline 
> runs, and some jobs fail to compile when I remove the header (e.g., 
> [1]). Looking trough the build log, it's not entirely clear what is the 
> relationship, but it seems related to some use of this struct defined in 
> xen-mca.h:
> 
> typedef struct xen_mc xen_mc_t;
> DEFINE_XEN_GUEST_HANDLE(xen_mc_t);

That do_mca()'s parameter type, so in a way the comment is still correct
then.

Jan

