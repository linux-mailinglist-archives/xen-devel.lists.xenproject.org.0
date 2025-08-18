Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D11B29CEA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:59:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085728.1444036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvhy-0001xG-AL; Mon, 18 Aug 2025 08:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085728.1444036; Mon, 18 Aug 2025 08:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvhy-0001uN-6u; Mon, 18 Aug 2025 08:59:14 +0000
Received: by outflank-mailman (input) for mailman id 1085728;
 Mon, 18 Aug 2025 08:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unvhw-0001uG-My
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:59:12 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b13b2c4-7c11-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 10:59:10 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb7a2befdso537863166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:59:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdd010e1bsm746978466b.93.2025.08.18.01.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 01:59:09 -0700 (PDT)
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
X-Inumbo-ID: 9b13b2c4-7c11-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755507550; x=1756112350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ESvtTKqs9XTV0Z7+EGDQllbc1lEaYKmH66i2SmFq+4Y=;
        b=bG6DGFOmnZvQevB7cLWtAUrdE8bp/Lnnx0XLFH28Uu18pSZjsXVm9nN09MJvbj6ct7
         DYC1KVocL3mrAGhGm/+iFpkY6HWmaW+tNPL4Bntmdn7fw69iR0PHLb9qVgFqy4J/xPjZ
         rIBR4B+JHddpXKb2ORHtSmCUzLhTPxZJHWyCGDyFOKKqExiMjvpi9qKkaGUtDVO2dLCj
         uszjMPcVCasfZxEplHbZT7o63xgXcxWaUc6t26TZgMQTOj1AGN2wkcRiJJa/J/X2U7il
         PZN0IRKRZmtv0o6oupk5LHW7bDDeco+lSMUfWYPkNSaj31Pf6LRoHtwJB6aymJ7rV6vP
         J7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507550; x=1756112350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESvtTKqs9XTV0Z7+EGDQllbc1lEaYKmH66i2SmFq+4Y=;
        b=XQvruuUxK0YUGV3z8kXJHqj7R9Dm/rviK3Nr+ijTmlHEauHpCK9Jnb1I42grx5ZMZy
         ot9Vpedapko78kFys+gaELCV9UNYKWDIcaHDN4bMQVRq5dmUWFOtli/pYWSwhxLatv3o
         SFxNcruNUcavXIOXziKntYRedFM3VEsHv8smAFB9epm2bq3gEt/bUW3J4Zl2rQVsUgoC
         hKFEVaXwGe0TNL0k3fsZXYjUkCpM1VHZJMQviZZojhmTMQ5i8q4FX2sfEYS5KuS8C16N
         kPc2AI7wUG91eTa5P9wQSsq6OUtYtlIy8KB3TSO34SY8L6SV7Jpb3nQZgs+R7vNsZBMT
         ir6g==
X-Forwarded-Encrypted: i=1; AJvYcCUl4UFFDOPet/hScEIV9Dx+0JLxzQOen2cB1xWpSrh/BbJq77B7eJjeXyD9hlGTXutIJLeuRR/kpxM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzqn7F4elHJtf4kEH19SYfT6MnirUbpzgO1argTCol2kAgsDq1Z
	bFw1Fw1cuQ2dfy3vy7sCK6BN+2bpbCDfc9Xxn9SC7nqgLBqj2tVhxxJ1T2g7huu1aw==
X-Gm-Gg: ASbGncs6RLOn1kl2Uw5im5AHSvaVVXFuAMRadbGNoYDso42OjLUy1hdbPZh7BeEwBIM
	WeRWKk3UPkMitp2FW8L2a7nwJv0aeCk8edj2x0q+WHMKnCx3tlyuUlQUv34BJd9ir8b/qvc4SAm
	55eXTxrtJl+VopSjjETZXuosmOXklq9MZKp+RZ9z/J6FWBiChHoRHu2WX7g/KrOGZlzi5uKy266
	1LsgUHWD5ay7hOB/gGMyQEy4qJylUHngv6D0EEQSd/He6K79COoSP1WpDszXjglI/PoLIc2fC4L
	qgF3dvP0dN3sUPLCUHDmbVuObsazyE5upSIK3PujP3siM2ukFwsJqLuMZYQQ3bReO0myCRvS57J
	bpkSCgnO7COq55aTGwuMs9kz0jN0LkApMPGobbjH9hiT0HV6l3eJ+TiOowqm1X4Q1fXamLHlaV3
	LxfDawOXeENuhwz07OdQ==
X-Google-Smtp-Source: AGHT+IHz5aGhbXgBuCyqpfVtSBeKGhJyL/Mk5qQ8GDHnUm0mSN/kJrQRhKq/YEnPH56o6HI+qI1Agw==
X-Received: by 2002:a17:906:f59f:b0:af1:8be4:768 with SMTP id a640c23a62f3a-afceaca84cbmr765357466b.5.1755507550102;
        Mon, 18 Aug 2025 01:59:10 -0700 (PDT)
Message-ID: <2c767cac-ce62-4e31-9a5b-224cfb2a9492@suse.com>
Date: Mon, 18 Aug 2025 10:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/22] x86/traps: Introduce FRED entrypoints
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-22-andrew.cooper3@citrix.com>
 <53028a31-e07d-43f1-b320-2775c5560a09@suse.com>
 <37cb95df-520e-45b3-9003-b638296d1001@citrix.com>
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
In-Reply-To: <37cb95df-520e-45b3-9003-b638296d1001@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 22:40, Andrew Cooper wrote:
> On 14/08/2025 4:57 pm, Jan Beulich wrote:
>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/x86_64/entry-fred.S
>>> @@ -0,0 +1,35 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +        .file "x86_64/entry-fred.S"
>>> +
>>> +#include <asm/asm_defns.h>
>>> +#include <asm/page.h>
>>> +
>>> +        .section .text.entry, "ax", @progbits
>>> +
>>> +        /* The Ring3 entry point is required to be 4k aligned. */
>>> +
>>> +FUNC(entry_FRED_R3, 4096)
>> ... doesn't this 4k-alignment requirement suggest we want to put
>> entry-fred.o first?
> 
> Perhaps, but that is quite subtle.  I did also consider a
> .text.entry.page_aligned section, but .text.entry only matters for XPTI
> which (as agreed), I'm not intending to implement in FRED mode unless it
> proves to be necessary.
> 
> Also IIRC there's still a symbol bug where _sentrytext takes priority
> over entry_FRED_R3, so the backtrace is effectively wrong.
> 
> (These are all bad excuses, but some parts of this series are rather old.)
> 
>>  Also, might it be more natural to use PAGE_SIZE
>> here?
> 
> I did debate that, but the spec uses 0xfff, not pages, even if the
> pipline surely does have an optimisation for chopping 12 metadata bits
> off the bottom of a pointer.

I found this, though:

"Bits 63:12 contain the upper bits of the linear address of a page in memory
 containing event handlers. FRED event delivery will load RIP to refer to an
 entry point on this page. See Section 5.1.1."

Jan

