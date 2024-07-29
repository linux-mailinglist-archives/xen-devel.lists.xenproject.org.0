Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B47493F6E8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 15:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766757.1177273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYQfP-00036X-Ka; Mon, 29 Jul 2024 13:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766757.1177273; Mon, 29 Jul 2024 13:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYQfP-000353-Gr; Mon, 29 Jul 2024 13:43:59 +0000
Received: by outflank-mailman (input) for mailman id 766757;
 Mon, 29 Jul 2024 13:43:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYQfO-00034x-HA
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 13:43:58 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9aa3973d-4db0-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 15:43:57 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52efd530a4eso5440882e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 06:43:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63b59ccdsm5826898a12.46.2024.07.29.06.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 06:43:56 -0700 (PDT)
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
X-Inumbo-ID: 9aa3973d-4db0-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722260637; x=1722865437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MRkVAhArxp3DUVJI2/AIDH/bZvTfg80MLUjQUouVPpM=;
        b=XTjS287LxoLDkbJW3TOS8umdFAgSVrBjIr7W1hqsHzttpSLu77xCx5zmqtlsQAj/sv
         Pjm+1v7Bm7RAWaKwvhFEu+VDq1IB4rsSt6QD4G5z+TNZ1auI5rkfKGDoiJfMQS1ckTO8
         WRkknFHfY7lcsprUqV8oF0ZiSAEFBm/eqFEpuIrKuCQOYxdCj1MwCMt0E00XuNPf1GaX
         NgOlsOBW+q5/iSp2AWnFe7tSUTwlk4ZU58fCOhIZ+k7EhvUNgjDAwrtE2A/us+Saqufh
         etqofAvAcB3AZQ3SFB6qPBO4ruDN4Iagk9ZZjG5VwZjJL3MyilT/IXroYnulZA0yxfx9
         B/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722260637; x=1722865437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRkVAhArxp3DUVJI2/AIDH/bZvTfg80MLUjQUouVPpM=;
        b=il5elzn51QAZAu8wixvLSQHtwzcoiamVq/QtNh8vkuN4oaPD8qaVMJdGJpB+MxfK1x
         +Q6MjsBgZm0Qgr53Oi5Q0HL4L5DN+OZSL7BVNMPOobORXKaX/hjEIEi2jr1iycBJcWMp
         d306ojuPBwBjKJoBD2G0JiAM1t2pwN8eus9qstQdNOqF5newDe9PImtftvgXvVGWPGWm
         7k6KHMy9vnDO4Pc9/AbIHcK5RAbFBNwxAXQtgtaDECPszXhbs5zY9twYR6fZD+gy1XIE
         3HeYJpA/k41vwVL9clPb5N88p1+O/I5hYkxKByeirgbunvLXunCG9E4P5Xx00HyWVjeP
         h3ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCULZGIrJKOmz+yUAIU+W5w5BdKu0rtnXW+GgENIjvSBIgN6AKVMrCc0iP3N1klYAGPKorg6NDCOFMjRC7j6mSZ8qmtgZkzaavKPZtpxBz0=
X-Gm-Message-State: AOJu0YyMb5Js/+9gBhmiYBAyF5F5BNSP/hwtyS8gBdsVnzMVL3voCkNB
	e+IpzmtlFBnlfszzQLVY2keS+HXvf4mh0I8QBl/rErXaPaG/Gb1QFh8qtovLnw==
X-Google-Smtp-Source: AGHT+IGM0R7s+Q/245c1mZHHjvO57VGqdAitknWRXy1VpHANHMGj2aHm9VDPXLm3X8HiI3QwWWOrSg==
X-Received: by 2002:ac2:5690:0:b0:52f:31:c2a3 with SMTP id 2adb3069b0e04-5309b2704d0mr6848030e87.12.1722260636914;
        Mon, 29 Jul 2024 06:43:56 -0700 (PDT)
Message-ID: <2b247ac2-b129-4732-a68a-5d6a20209db2@suse.com>
Date: Mon, 29 Jul 2024 15:43:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/22] x86/mm: avoid passing a domain parameter to L4 init
 function
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-9-roger.pau@citrix.com>
 <D322ACW6M240.2G3UQGXHR0XU0@cloud.com>
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
In-Reply-To: <D322ACW6M240.2G3UQGXHR0XU0@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2024 15:36, Alejandro Vallejo wrote:
> On Fri Jul 26, 2024 at 4:21 PM BST, Roger Pau Monne wrote:
>> --- a/xen/arch/x86/mm/hap/hap.c
>> +++ b/xen/arch/x86/mm/hap/hap.c
>> @@ -402,7 +402,8 @@ static mfn_t hap_make_monitor_table(struct vcpu *v)
>>      m4mfn = page_to_mfn(pg);
>>      l4e = map_domain_page(m4mfn);
>>  
>> -    init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
>> +    init_xen_l4_slots(l4e, m4mfn, INVALID_MFN, d->arch.perdomain_l3_pg,
>> +                      false, true, false);
> 
> Out of ignorance: why is the compat area mapped on HVM monitor PTs? I thought
> those were used exclusively in hypervisor context, and would hence always have
> the 512 slots available.

"compat area" is perhaps a misleading term. If you look at the function itself,
it's PERDOMAIN_ALT_VIRT_START that is mapped in that case. Which underlies the
compat-arg-xlat area, which both 32-bit PV and all HVM guests need, the latter
as they can, at any time, switch to 32-bit mode.

Jan

