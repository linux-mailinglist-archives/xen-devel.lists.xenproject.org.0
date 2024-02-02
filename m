Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD3E8471C0
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 15:19:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675061.1050224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVuNJ-0004vQ-14; Fri, 02 Feb 2024 14:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675061.1050224; Fri, 02 Feb 2024 14:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVuNI-0004sB-Tj; Fri, 02 Feb 2024 14:18:36 +0000
Received: by outflank-mailman (input) for mailman id 675061;
 Fri, 02 Feb 2024 14:18:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVuNH-0004s5-Gc
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 14:18:35 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2acb06e-c1d5-11ee-8a43-1f161083a0e0;
 Fri, 02 Feb 2024 15:18:34 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e7065b7bdso17761715e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Feb 2024 06:18:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d15-20020adfe88f000000b0033ae50e2c6asm2045835wrm.83.2024.02.02.06.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 06:18:33 -0800 (PST)
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
X-Inumbo-ID: f2acb06e-c1d5-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706883513; x=1707488313; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SOILyzCW1Wg5HSXpticJgJax4Ap7ionOOLE6NJI3tck=;
        b=BE8dHpiNHjUhF3lT9B7CdDemcftqcJ7neOLLdG2JaMm4WzKELOTpwOahTOL3fM/Jm0
         Umtkw+ObJ9hqhZRby/Y5xI0zLsBLG32zffeZfonLEkM2sVoNoIJWiQB4YwOdu0wUOGys
         H1ArdDJ6z0Dq7GaYt5vWgBw4DomJ6fUybMj/9iyJV+9QBvI2QhSvQzfZE9MUE+HMUchg
         AQ4S+b6JlinU+z+ZbgHXVpAObnJywAg6TeF4tpNpyK8PpZkYYacgit1FqvqmMwyCJLgz
         yoBSaWdfxG0J8TBYwmaX8hK1iWhxmbOp6N3tb/iS1ezm6nGLZOPXNeXVf5ZlojKIYBnb
         JswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706883513; x=1707488313;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SOILyzCW1Wg5HSXpticJgJax4Ap7ionOOLE6NJI3tck=;
        b=p4xtMHrOyBKeUygOMXwPepGjmQd0gXgDoAFmIT3eVHxQqywJaA0o3PC/mcH6eGpUBb
         sGPL0MLrPvLCow+oycvrIsx+N9v2feCn29lgJzdjhOkG1AHd7Y4PuK7j2yHtTBauJseT
         ICUZz/oFj0/zchS5yEPy82OpdlP2EOjTm3aNSlG+2dUGIea0noCLfzVREY1uI7f9ILu9
         jcms4YKHXvemXkcnDwO9pN6tEYd0sH0iSzAEVdosEqUEPCgLjXvViSbN9/I5zAL/WSWB
         j1jE2VsvFCym3dbpXh3lN2d0dVAQcUAJj4gCdD4gOJYkCi+cbnu/vP2kyPG3B9Dlxbki
         5Jgg==
X-Gm-Message-State: AOJu0YzTX24fXKrIQPFP1/bQCYp20oEGKCf5LLRqjt6nIxyLj4fkOz/e
	L7AXgnZFCLIZSw05CiF5AJcoL1hEdrr4tWIN5cQcXjKc7aQYPnQq2kz1nOjG2g==
X-Google-Smtp-Source: AGHT+IERUYrnNY+7x/uaQU/FjXIWwena/40Nz5zy3aYEgQfSfbvY55Nu8dH0/4K0k8oJrqxlgoSWPQ==
X-Received: by 2002:adf:9b94:0:b0:337:c39a:1fbd with SMTP id d20-20020adf9b94000000b00337c39a1fbdmr3977032wrc.42.1706883513446;
        Fri, 02 Feb 2024 06:18:33 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCURzqLoDH8bBm8y8bF9oEdOWHtoDVuxjuXmCCIRAtFhafGqp64T2Z68kbmbghUCW7tNnrPSQPPRVCZUBGi78XvqzY8eIoBTyl+KfOmN2kDjRdPUPRNYG+gtUruJ0/TM7f25Xigf
Message-ID: <9eeb91f9-c33a-4d2c-ace6-55cc035470d6@suse.com>
Date: Fri, 2 Feb 2024 15:18:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/CPU: convert vendor hook invocations to altcall
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <27d828d2-fb4b-41fe-82e8-90720bd9ff8f@suse.com>
 <ac612937-bb9b-4838-a69a-0a6b5967889e@citrix.com>
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
In-Reply-To: <ac612937-bb9b-4838-a69a-0a6b5967889e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.02.2024 13:13, Andrew Cooper wrote:
> On 23/01/2024 11:00 am, Jan Beulich wrote:
>> While not performance critical, these hook invocations still want
>> converting: This way all pre-filled struct cpu_dev instances can become
>> __initconst_cf_clobber, thus allowing to eliminate further 8 ENDBR
>> during the 2nd phase of alternatives patching (besides moving previously
>> resident data to .init.*).
>>
>> Since all use sites need touching anyway, take the opportunity and also
>> address a Misra C:2012 Rule 5.5 violation: Rename the this_cpu static
>> variable.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> ---
>> With LTO it might end up necessary to tag as __used more than just
>> "default_cpu".
> 
> Why is it even needed here?
> 
> LTO can't rid early_cpu_init() of the default clause, so can't make
> default_cpu unreferenced, I don't think.

Even without LTO I've actually seen gcc eliminate default_cpu. The
use in early_cpu_init() simply was expanded to assignments, rather
then something memcpy()-like.

>> Perhaps __used would better be integrated into __initconst_cf_clobber,
>> to be independent of the compiler potentially eliding structure
>> instances.
> 
> Maybe.  I guess the issue here is that the tools really can't see the
> connection between being in the clobber section, and alternatives going
> and making a modification.

The const-ness is the issue, I expect. From that the compiler can
infer that it may transform use of the variable into something which
in the end doesn't require the variable anymore. And it can't know
that we use all contributions to that section for a second purpose.

Jan

