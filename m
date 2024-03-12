Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69FB8797D8
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 16:43:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691922.1078523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4HI-0002PD-2k; Tue, 12 Mar 2024 15:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691922.1078523; Tue, 12 Mar 2024 15:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4HI-0002Md-01; Tue, 12 Mar 2024 15:42:56 +0000
Received: by outflank-mailman (input) for mailman id 691922;
 Tue, 12 Mar 2024 15:42:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk4HG-0002MX-P0
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 15:42:54 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30126b19-e087-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 16:42:52 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso6960036a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 08:42:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e3-20020a170906314300b00a4558314ea0sm4025767eje.15.2024.03.12.08.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 08:42:52 -0700 (PDT)
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
X-Inumbo-ID: 30126b19-e087-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710258172; x=1710862972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3bmYaFDpLFhm5Cgf4OSH5gVC6zXWCPjmzWGkAA68ISs=;
        b=JfLv+MkKN/ZlPc/u74aTrP/LbNc8axN5joB8f3QqONsWbEx9Pq5EXIRJojT5PzeuP/
         sq1AKfWboyzD8n9EfGCmdTwZ5QyJ9Ii7ElHMITbeqnNMZ4MTAiwhrs9/XbnL5BD2PA72
         VDG25y+IshyBtuvCNLO1afByXAtyzgkWFfxL/LiyMfpcB79jbHwQ51gP1Pv4WaGi1J8j
         TWJwVVtN8U4SGgY23GW5WCI+lCr3/ufEimWpUGlKKls4cuCkaosb7DkVrRCkQFXjvMBA
         /H9uFCKZW46LyaXEsLpk9HxDKkHtw5PcNqIf8A7WaGXBknVPJxY8VLAtH7EDQl5NAz++
         FhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710258172; x=1710862972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3bmYaFDpLFhm5Cgf4OSH5gVC6zXWCPjmzWGkAA68ISs=;
        b=sq97VsF2e98UlWvUPnH+xiR3OsF1B1JR2v9l+25q+6ePwK75mvBxEkGm9ncvNPCbJ0
         Lr9vQxqAFEF6RGDPQlA4rGkf1g8e89AXXpFTAFOgMiPBkAaAx7jCTMsjHXLnzbHyaVOB
         L9n7UMSodAZYLMbzQcGFDYKxulvup02JOwfNgaoV/tQ3BifMY4lhE/MRIDV3zOs6Vh/T
         hxEzuvwt3I28h5IN8lkk28TDjRh2AJWyexcwGLYZiVEU2kDYQ3tgpLUgmZKIYZxl7rTD
         GqpX1fAm2YuRAQz9eXarISEK4MQPe0963a0GL+apKagTqsmeqI5EmOxTdUgDyXv+MjO5
         nvJA==
X-Forwarded-Encrypted: i=1; AJvYcCVxRlkDikdwibF/PSEIwkuSGN+Fkx9nNyZi+urQI9eswRL8msUy81u1xa+3m744pqV0YRlULvZz9KzxKpUURwdRjlgvdw6zSBoAr7j37wo=
X-Gm-Message-State: AOJu0YxhrlaawGKbnN88yXK+BAYJBODxPyyDYNlxIPhMfu9yXewXpGIs
	jVDLvkhMNBFrhBnYiRPBmbQVcDlfWL3H/+FL19sl6FtGe5ooOolHD8I1DYfPLw==
X-Google-Smtp-Source: AGHT+IHUmKEpJBilIByF+OT6BofcD8ZtLvUIdOznrpzaCoYzusFFI1UckbHqFe0/vzS/Pn3oXMUZGQ==
X-Received: by 2002:a17:906:7d8:b0:a3f:5ad2:1ff0 with SMTP id m24-20020a17090607d800b00a3f5ad21ff0mr2603917ejc.46.1710258172303;
        Tue, 12 Mar 2024 08:42:52 -0700 (PDT)
Message-ID: <c84047ae-4c6d-47a4-9ce4-44427e571e1c@suse.com>
Date: Tue, 12 Mar 2024 16:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/9] x86: don't access x86_cpu_to_apicid[] directly,
 use cpu_physical_id(cpu)
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <705574ddb7f18bae9ed3f60ddf2e4bda02c70388.1699982111.git.krystian.hebel@3mdeb.com>
 <904f358b-c535-4de2-b31d-e593687af11b@suse.com>
 <e5c7199b-bacb-4a81-964f-802c260ce75c@3mdeb.com>
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
In-Reply-To: <e5c7199b-bacb-4a81-964f-802c260ce75c@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2024 16:18, Krystian Hebel wrote:
> On 7.02.2024 17:28, Jan Beulich wrote:
>> On 14.11.2023 18:49, Krystian Hebel wrote:
>>> --- a/xen/arch/x86/apic.c
>>> +++ b/xen/arch/x86/apic.c
>>> @@ -950,7 +950,7 @@ __next:
>>>        */
>>>       if (boot_cpu_physical_apicid == -1U)
>>>           boot_cpu_physical_apicid = get_apic_id();
>>> -    x86_cpu_to_apicid[0] = get_apic_id();
>>> +    cpu_physical_id(0) = get_apic_id();
>> While personally I don't mind as much, I expect Andrew would not like
>> this: Something that looks like a function call on the lhs is against
>> what normal language structure would be.
> This made me cringe as well, but I've seen something like this used in
> other places (per_cpu() mostly) so I thought it was OK. I can change it.

Please try to get in touch with Andrew, to see what he thinks (especially
with your pointing of per_cpu()'s similarity).

Jan

