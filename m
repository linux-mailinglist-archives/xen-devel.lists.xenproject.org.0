Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9505490EA36
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 13:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743723.1150683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtx0-0007SV-Hl; Wed, 19 Jun 2024 11:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743723.1150683; Wed, 19 Jun 2024 11:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtx0-0007Qy-Ee; Wed, 19 Jun 2024 11:58:06 +0000
Received: by outflank-mailman (input) for mailman id 743723;
 Wed, 19 Jun 2024 11:58:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJtwz-0007Qs-4Y
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 11:58:05 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e7670d8-2e33-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 13:58:03 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so64178201fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 04:58:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f0b705sm115017995ad.213.2024.06.19.04.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 04:58:01 -0700 (PDT)
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
X-Inumbo-ID: 2e7670d8-2e33-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718798282; x=1719403082; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7js8CSmtozYgUq5gAEvDke0ZuNKLOKBar2LduVigS+U=;
        b=Z6wWpu1MP1YZaRC5uAhEBfAaK5kff84jzIrppT9GmSS9+dfPd+4BjAqsLL1tU9eZxq
         PY0GVbbe+UqEwmBoFmrL/BwHd56oiwVUMWYQDvc8N5PfZr1Ssy4FLNlB3L2sgi9VacFD
         zJTFbVVO5DEX9/lztPuSgYk9OVN9707vzpB9u0bNfOmEyXsVa9gPw+/bC7Ug9paUEZkT
         tZ7rBzwyv6da+Gz2esJ0yUYpDS5okk7FITJxgsC7wtbA0s/9Pa96aQ71UxQLZxR+CfY0
         VwpxSyQvB19xNCfgKzgIHabiKFFYy/4bFm4JnMwrvW/aSyUojJLkHNd6L3Z9ukVKQNvA
         7x2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718798282; x=1719403082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7js8CSmtozYgUq5gAEvDke0ZuNKLOKBar2LduVigS+U=;
        b=Wzp+qNyLn4TlBVmjK94vF5g1ZFBn4zhfeWPYXDY4a02NFliE0ezMEd6hjyvxcSyILb
         N/YMqlei4nG+D9wTuodxndJJGBvNCGOm05OJCaRzrXTd5pHrkIGFMRx7cwhkGrCiFS2V
         Ia1pMyikYa8k31wZ7ZoAB8j7mvrF6xCHf9Syg6FV1J6EhO8VOJ8LirUoncbp2wsuxKFC
         /2FwK0PMIRbohT8sdUqtSzBy82COkFV2KNG5hSCjJqIO4jbz71gDdPfCTltFzrvGWgX8
         MZKD1Z55fIunxKQVCpLGCCahrbW/JAfRXvjTjIQky9H9Mrv4w1T2HIAe3GSMPZVCRaxp
         SABA==
X-Forwarded-Encrypted: i=1; AJvYcCUJJk7EJvaRYyU9kh46r5g426kkLGdNHmVTJzVVZK7ep1UaK5d2L/97ZkGByCBHEnvew6k8tO4u9soig5jL7oPWlZuq9M7G0cxwBe8Dyvo=
X-Gm-Message-State: AOJu0Yy/rh5estDdE1yBmEJBRUFrPen35108fhJOgYQd11VvpaMZX3I+
	zdAy+LFdpJl2Un4uBEDTbelJgJSiAMqEQE7t9LK9SNmlr+XOWxaG2WLvLtqOyw==
X-Google-Smtp-Source: AGHT+IFheFwHv0oYp3HK6+0nVL6YynBxO2mgnmhLzvHXscUefps3jvp3qNsqzpxsnidtjOjL2GHGAw==
X-Received: by 2002:a2e:b1c2:0:b0:2eb:e47c:6d2a with SMTP id 38308e7fff4ca-2ec3cecc2abmr14668881fa.28.1718798282354;
        Wed, 19 Jun 2024 04:58:02 -0700 (PDT)
Message-ID: <a8fd0504-23b7-473a-9056-6b51c20e6468@suse.com>
Date: Wed, 19 Jun 2024 13:57:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19?] tools/libs/light: Fix nic->vlan memory
 allocation
To: Leigh Brown <leigh@solinno.co.uk>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony Perard <anthony@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
References: <20240520164400.15740-1-leigh@solinno.co.uk>
 <c600e5e8-d169-417c-bc02-d33e84dca0fb@amd.com>
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
In-Reply-To: <c600e5e8-d169-417c-bc02-d33e84dca0fb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.05.2024 19:08, Jason Andryuk wrote:
> On 2024-05-20 12:44, Leigh Brown wrote:
>> After the following commit:
>> 3bc14e4fa4b9 ("tools/libs/light: Add vlan field to libxl_device_nic")
>> xl list -l aborts with a double free error if a domain has at least
>> one vif defined:
>>
>>    $ sudo xl list -l
>>    free(): double free detected in tcache 2
>>    Aborted
>>
>> Orginally, the vlan field was called vid and was defined as an integer.
>> It was appropriate to call libxl__xs_read_checked() with gc passed as
>> the string data was copied to a different variable.  However, the final
>> version uses a string data type and the call should have been changed
>> to use NOGC instead of gc to allow that data to live past the gc
>> controlled lifetime, in line with the other string fields.
>>
>> This patch makes the change to pass NOGC instead of gc and moves the
>> new code to be next to the other string fields (fixing a couple of
>> errant tabs along the way), as recommended by Jason.
>>
>> Fixes: 3bc14e4fa4b9 ("tools/libs/light: Add vlan field to libxl_device_nic")
>> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

I notice this wasn't Cc-ed to the maintainer, which likely is the reason
for there not having been an ack yet. Anthony, any thoughts?

Further at this point, bug fix or not, it would likely also need a release
ack. Oleksii, thoughts?

Jan

