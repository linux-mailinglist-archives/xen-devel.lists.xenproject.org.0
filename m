Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A188888140F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 16:04:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695976.1086390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxTX-0003Go-4c; Wed, 20 Mar 2024 15:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695976.1086390; Wed, 20 Mar 2024 15:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxTX-0003EP-1n; Wed, 20 Mar 2024 15:03:31 +0000
Received: by outflank-mailman (input) for mailman id 695976;
 Wed, 20 Mar 2024 15:03:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmxTV-0003EJ-Nb
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 15:03:29 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 018470b4-e6cb-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 16:03:27 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a46dd7b4bcbso272054766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 08:03:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q21-20020a1709066b1500b00a461e206c00sm7274324ejr.20.2024.03.20.08.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 08:03:26 -0700 (PDT)
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
X-Inumbo-ID: 018470b4-e6cb-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710947007; x=1711551807; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQNVHZFsncPCPSiSxSLqtqmJ6Rqxjlg24dSv9FA1u2o=;
        b=K18i2MDfc6cMfeAY79oIyFebmvblQXQsLPOjSVIJpLNhYXpJN82GdUbq6vNn3+KcVk
         0LzCxQZYJcmOHRuC+XgMAVElPvoRmmV218/7R6rK+nnV/+qFA3b7D/P/TMh7njMo8rar
         SPyBVI4BNQ5YAkicLL3cPYm5rQZUhreytjrnCHR2DxKmv1chP1PcEn+v5DmzqBADzAEB
         PuaRizVvgn2f5b3SXhvSnZGU2amGYm1pMCgsvyMt/UiRRfCJ6jrF8+vgpLSlWjsQ6AQj
         KFhYX2Z1Sgh7boSR6pqh2uZ+7205yCsJlQECWNho3fnNZAvGkn32VNVCG2BHD7y+hTnS
         ZX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710947007; x=1711551807;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQNVHZFsncPCPSiSxSLqtqmJ6Rqxjlg24dSv9FA1u2o=;
        b=OJsZNJNwLtLsivhHm5aXyDvEZTF32sDZ43wwsxUmSDP7Qk87z8mPd5mFj70QKVNIsp
         ipuajiJt2oIXwLF0jqxrlordNdN64lvxMnAzJQVlxYvdlSD04DCVZwnAzsMwJ486k1XM
         RKLp+W8n+5y9qakCJLKGyiuU1Ka1xWv4YWCiWPU9XBqPnj4yjB0TQ46meqJE1KItdwtK
         WCzsqljhTuXH9gsugt2IDUbj0hkwOLjLkkhUoL0ZXmIrrUozOdblZn/aT2oH8KG3SlKM
         VYfneSDWUm4XSzZg9dr2/XuaIRRHxUFn30QnuhQQRe5c0TNK0rwgr0OzCf39hUs1uExi
         oYsw==
X-Forwarded-Encrypted: i=1; AJvYcCWjDcac4c8NRrVv7AiQBkFIjwNVSe/EKPHRHmEffo7quu2dp0zyIiMXaXcm82nrJCBZEXSlCcszOE+H9US5e8Pj67/ppWwdIvHrUwoMxYU=
X-Gm-Message-State: AOJu0YwaHycQ+0unbk4TJlW/K7mKXGX86vhSvxiqI40jOBMtJqnFLfAS
	OjuGqLCoVkEU982gAA1iC8fs4WHzpBRu9857SiO3eEfECtfGJXxJEfHMXaDbpw==
X-Google-Smtp-Source: AGHT+IHK5jJxCTXHqo9EqsI06I/eeu8pdPC7SV2UQayJbYLECbFfgziQNe+HhqVzG5VLOQKSh9dhYg==
X-Received: by 2002:a17:907:7f87:b0:a46:a9db:1471 with SMTP id qk7-20020a1709077f8700b00a46a9db1471mr9172150ejc.16.1710947006822;
        Wed, 20 Mar 2024 08:03:26 -0700 (PDT)
Message-ID: <a352bf4f-6280-41e6-b089-2acc09646a76@suse.com>
Date: Wed, 20 Mar 2024 16:03:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240320135720.68894-1-roger.pau@citrix.com>
 <1304a0d2-ff17-4823-9d31-c32eb7b79f30@citrix.com>
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
In-Reply-To: <1304a0d2-ff17-4823-9d31-c32eb7b79f30@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2024 15:06, Andrew Cooper wrote:
> On 20/03/2024 1:57 pm, Roger Pau Monne wrote:
>> There's no reason to force HVM guests to have a valid vcpu_info area when
>> initializing a vCPU, as the vCPU can also be brought online using the local
>> APIC, and on that path there's no requirement for vcpu_info to be setup ahead
>> of the bring up.  Note an HVM vCPU can operate normally without making use of
>> vcpu_info.
>>
>> Restrict the check against dummy_vcpu_info to only apply to PV guests.
>>
>> Fixes: 192df6f9122d ('x86: allow HVM guests to use hypercalls to bring up vCPUs')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks for looking into this.  But, do we actually need to force this on
> PV either?
> 
> The only interesting user of dummy_vcpu_info now is vcpu_info_populate()
> which can cope with any arbitrary vCPU.

Why would that be the only interesting user? If we were to ...

> I have a suspicion that we can (now) delete these two checks, delete the
> dummy_vcpu_info object, and use a regular NULL pointer in
> vcpu_info_{populate,reset}(), and in doing so, remove one of the bigger
> pieces of PV-absurdity from Xen.

... use NULL pointers instead, we'd need to audit all Xen's vcpu_info
accesses for properly avoiding to de-reference that NULL. The dummy
struct instance was really meant as a safety belt (besides also acting
as a sentinel).

> I can entirely believe that this is only safe to do with Jan's physical
> registration changes in place.

Which nobody uses just yet, afaik.

Jan

