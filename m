Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F91A80E83F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652888.1019019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzSS-0007ZV-5Y; Tue, 12 Dec 2023 09:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652888.1019019; Tue, 12 Dec 2023 09:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzSS-0007X5-2m; Tue, 12 Dec 2023 09:53:44 +0000
Received: by outflank-mailman (input) for mailman id 652888;
 Tue, 12 Dec 2023 09:53:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/PU=HX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCzSQ-000715-2v
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:53:42 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53e2d840-98d4-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 10:53:40 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3332e351670so4926243f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 01:53:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4ed400b0040c31bb66dcsm15672783wmq.20.2023.12.12.01.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 01:53:39 -0800 (PST)
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
X-Inumbo-ID: 53e2d840-98d4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702374820; x=1702979620; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F1SydZvsbopBu/icAPKPoVlc7p/qggaakBqwEkAJFIE=;
        b=GQ8Quv6NUrePjNe2fsGDWj1crjZBG7RyTCoXWp7DHCdiQIQ9Ykbu+SM+jUuHe+96hk
         gmN10J6MxyUgC1TtBHhll1musFRHvwZD6zQFcYoOSR6MLNBthZtJM/7HyFl5oOuyYjoR
         9jGt/Dt7Fm3r/5T/WuQrjwuLHMLWKYOO7S2Gc6H8qG3MGVaJ68Sn0YXBx8p+IayBDZ6J
         SHdNAlY3XyHzFQiaieUvZfWORisLYBzg6cxf9iomQnkgW9+gVbmn7RKVVe9pICZqG/iM
         csD+mYTKUOkkUOpSw1CYypVafgc1rzYVKYjRoBQzAzLRTar3k/mx82idMTn2OTdBeNlc
         XyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702374820; x=1702979620;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1SydZvsbopBu/icAPKPoVlc7p/qggaakBqwEkAJFIE=;
        b=lwA8FYxXocMQU1pNVvYhVIcLOKLp66Ou9+anLHG5BKOc8hvTydxlx82KVr3VC/2njV
         eJmJfpMQ5YNjW3wCjorjExRd1a9ZBb3Quqe9Bfhc/YY67o/cCQ9UHOb1GJi1KZeyTOGA
         RKT7uzuAvrWj/6LUNl0Hhf1M1o1UON9gXve0GNr3FeX75o+8eOm+YnA56fD8YI3bnO0E
         7nUS+1t6e4eJJ9f9lHlRhEEmBqfYB/si9NH6bsaRunLf+aOkpJc/HyZzH7rIIuoRIHM9
         Jm9mR+2T+dEG8w89YlvXqQ3vAhpb7DaAXTyc+VFsBGZni5x/7Y6JCSwuBmhMZIQA0ytH
         rRYg==
X-Gm-Message-State: AOJu0Yx/fdc6o4l45ja67NwYs/BS4Lzsska6LHfxuKkfCcj3xprzTTbT
	butT4Zr8TDnH2gYcoRttbjun
X-Google-Smtp-Source: AGHT+IEmIo8c17Nv0bbU7s5adbxEAJhFfxsp6msh+pdzQ1DeUcasDrgNlT6NfMJD5y26KNoqCYt1mQ==
X-Received: by 2002:a05:600c:44e:b0:40b:5e22:2e0 with SMTP id s14-20020a05600c044e00b0040b5e2202e0mr1532334wmb.76.1702374819894;
        Tue, 12 Dec 2023 01:53:39 -0800 (PST)
Message-ID: <0ad1d3f5-2a23-4ee9-a6e7-ebb824d2b7d7@suse.com>
Date: Tue, 12 Dec 2023 10:53:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/7] x86/mm: address MISRA C:2012 Rule 2.1
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <5913d8871ff6c4f320c521e50e550a64e58d4351.1702283415.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2312111741390.1703076@ubuntu-linux-20-04-desktop>
 <ff95c65f53ab8acfd577ec132009cd7b@bugseng.com>
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
In-Reply-To: <ff95c65f53ab8acfd577ec132009cd7b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2023 10:12, Nicola Vetrini wrote:
> On 2023-12-12 02:42, Stefano Stabellini wrote:
>> On Mon, 11 Dec 2023, Nicola Vetrini wrote:
>>> The "return 0" after the swich statement in 'xen/arch/x86/mm.c'
>>> is unreachable because all switch clauses end with returns.
>>> However, some of them can be substituted with "break"s to allow
>>> the "return 0" outside the switch to be reachable.
>>>
>>> No functional changes.
>>
>> This is correct but makes the code inconsistent. I would either remove
>> the return 0; at the end of arch_memory_op, or do the following:
>>
>> - initialize rc to 0 at the beginning: int rc = 0;
>> - all switch clauses break instead of return;
>> - at the end: return rc;
> 
> Given the feedback on the Arm side, the first solution is likely to be 
> preferred.

I wouldn't mind either option, with
- the former ensured to be okay with all compiler versions we (still)
  support,
- the latter having the initialize rc to 0 part dropped; imo it's better
  if every case block makes sure to set the intended value explicitly.

Jan

