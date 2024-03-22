Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16486886E43
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 15:14:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696905.1088128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnfen-0004C8-8z; Fri, 22 Mar 2024 14:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696905.1088128; Fri, 22 Mar 2024 14:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnfen-0004Ab-66; Fri, 22 Mar 2024 14:14:05 +0000
Received: by outflank-mailman (input) for mailman id 696905;
 Fri, 22 Mar 2024 14:14:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHXv=K4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnfem-0004AV-JV
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 14:14:04 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fce26c3-e856-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 15:14:03 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-563bb51c36eso2625771a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 07:14:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z9-20020a05640235c900b00568a08a9aacsm1056209edc.22.2024.03.22.07.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 07:14:02 -0700 (PDT)
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
X-Inumbo-ID: 6fce26c3-e856-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711116843; x=1711721643; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tnOpRaRqYBEmpnvnxAAq6nYWwg9+xBBIuuGXIZdTkEo=;
        b=LpU5VtAamr79ecicGep3xJcMSD7B0fox+kz+TvOoB9g2X+faoz+AjZL99uDA31tdpl
         Z9iAmlxN7BmDxmOlNwm1pIM2ZQ7LVCV7afVNUQgfrlPTxWIZg/4W342i2g7FfqKtikZ8
         HUjbHS8/GW23Q8j59P9yFCTh5QChZyZT+bJ4xnErAntSYyqrKXoSR2PBRxpHWej9Erql
         iSjkEknxRgNhkvXOFxqi5NZ7cTOUklJgDpUxwJDzKjhaCk2I9u2DW4wc4e1/sp8/Mnc/
         +Oo6tGwH4j2UR+BBJhVipQ9HCUOd3BGu9M31idzn0BV0uoTryiOuAOEXgnBw9hK4Owe2
         H/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711116843; x=1711721643;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tnOpRaRqYBEmpnvnxAAq6nYWwg9+xBBIuuGXIZdTkEo=;
        b=anhSpM9moprUucqS6elyEp3HTU71t+od4CEaEYB3Xg0o3ZLjCaNP/IOOwE+QIDoFbQ
         /eOIMsNwi/kwn6tOxdW7pSXq8zTaIsenqpuYDnQmDelwGxy/hlclBLHhM5lmv82ls321
         B3Mg2LnoWU+k0SGWKBHsF26TkcIYfE8pLYyXXXrva4AsDgIz+Hzls4WGQtHSQp/MUuik
         ZobHkMrng7OvKQxK+lMyAa/H62qQxIzOsnNCDhK1yA3dbx4VFl0A6TZyFbODnE+d3ps9
         0txJMOQE7aeUIR+khSihHCMeUd7lG8/UuIMbbcUXIW5A5IS0XMjYl5r2v5bdSITJZ+YU
         bs5g==
X-Forwarded-Encrypted: i=1; AJvYcCXLahoiMU9WVAViOEs4BqpJVq3SfGKxdTitdanGOUQByW5Aosaduei/v9pD3DW560FjhE9r8eu7+2Kv7ZP2mN5J964U+jXjkUFG0PmS9zQ=
X-Gm-Message-State: AOJu0YzgVzpwtNPWjFWQccZdpaPnQ3jDLsRoI3beONsrlo8Fc5LpSbxg
	rOIHlqZdk/HrANcoiLPNBbr7MyfFjF0+uCSD4zn02Yh+SElgkp6R8Zc9O3tFo6nWefKKSrdTWgU
	=
X-Google-Smtp-Source: AGHT+IGtYfF+mctzASnH9u1/iYx7gVuei5hL0v8Abfy7mwDA8L58pNUy32B9BapD2H5/hkAR0WvLSg==
X-Received: by 2002:a50:a6d0:0:b0:56b:9162:8e6 with SMTP id f16-20020a50a6d0000000b0056b916208e6mr1763283edc.18.1711116843165;
        Fri, 22 Mar 2024 07:14:03 -0700 (PDT)
Message-ID: <15da6d51-ea4e-4459-8558-a6566091e3e7@suse.com>
Date: Fri, 22 Mar 2024 15:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] avoid UB in guest handle arithmetic
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <227fbeda-1690-4158-8404-53b4236c0235@suse.com>
 <9060e4b9-93d1-45c2-9785-ccb4b3c3e4e2@amd.com>
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
In-Reply-To: <9060e4b9-93d1-45c2-9785-ccb4b3c3e4e2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 14:39, Stewart Hildebrand wrote:
> On 3/19/24 09:26, Jan Beulich wrote:
>> At least XENMEM_memory_exchange can have huge values passed in the
>> nr_extents and nr_exchanged fields. Adding such values to pointers can
>> overflow, resulting in UB. Cast respective pointers to "unsigned long"
> 
> Why not uintptr_t?

Because, like Linux, so far we've been using unsigned long in preference.
That might change ...

Jan

