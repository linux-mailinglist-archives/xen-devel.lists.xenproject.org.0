Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC037885534
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 08:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696223.1086933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnDHI-0006vI-4X; Thu, 21 Mar 2024 07:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696223.1086933; Thu, 21 Mar 2024 07:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnDHI-0006sX-0z; Thu, 21 Mar 2024 07:55:56 +0000
Received: by outflank-mailman (input) for mailman id 696223;
 Thu, 21 Mar 2024 07:55:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnDHG-0006sR-9I
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 07:55:54 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70421db6-e758-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 08:55:52 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a467d8efe78so73849766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 00:55:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f23-20020a170906049700b00a3efa4e033asm8181644eja.151.2024.03.21.00.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 00:55:51 -0700 (PDT)
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
X-Inumbo-ID: 70421db6-e758-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711007752; x=1711612552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xFsfq2XdiK5U+JJvorNeH0Tn+9BirOXb7xnhq0Zatxk=;
        b=USt0OaiyzTQ+8OhLVNx0zcRtJSMsrRY6NbvnzVKVMOK3221YJmVGuPHQsQJ2ST6Stp
         DCK1B/JCCyLqt8A2sec2w4hu3XTx2j6uAFtSuWEcY07EOZJbRygTdE2mRBMno0ROzhQU
         W8t3bqq7F2BTp5gZRdKnXhvrS3MH+QcUVHsnsBwkxbVzx6awRN+ag5ZeOpdhpkFLTUIm
         ltLfdApWiR6sPhJDJX+wf3fR/yBqyaXRXBzwVLLuiDzthd3GFjU1VaOZPOnOLuiVZ9U5
         inVWBv4SNttEfx1uteWHq3dVqKtJjumPkOrVAnk+BJ1DjkCrNZp6BKvpXcamHEqFDpX4
         BfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711007752; x=1711612552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xFsfq2XdiK5U+JJvorNeH0Tn+9BirOXb7xnhq0Zatxk=;
        b=SJ1e94GkBcFndPgUeg+i62rn52lF+C7Xnt+JWUngW1yjnqRW/+Kw2nZk1rJPHuYHmz
         Dow3BdJEqv2EH0bfOwchm4pVQybDQy/1JJVlcn+2OLwE6vsDZf/eflY/XM1A9DlGVHsK
         VuQe/S7k/WgdDQOn5Rq4B9/yIPqfKvmZ3me9Ts8CgvalOcE4mCOZay8WT2ExLlyN54Fa
         VXwB/qtZ9VxRMMPvjyNd/35DkvrkmxpwOSDROLR52lDx63iy3ww8GU9plbdXO2odN9SX
         GpM7nzNcUOUtoiEpzzXd6brqVoeCAdYISkB4FmcT21n309ye1D+26EkCOaLh3Ll6/0oV
         3c8A==
X-Forwarded-Encrypted: i=1; AJvYcCU0/LNGdSt7Ee13gLY5edmrHht/VZKC/pGe+11ZfFt1+yJfFqW7y2XREOhlWt7mBDzjYY4eHk8mQCEqjJg8IHfGlre6u5pVOMe0EQX2cz4=
X-Gm-Message-State: AOJu0Yx870YIP3MusiDsyobLojMvTilsxZkhA/9XsYQ7v1Ib/g5you2C
	F8tGOai/jPFThYlrwPrQh84BQBBjJBv4Klim58md1DoVPkC0ECRRWz8r2gNkMA==
X-Google-Smtp-Source: AGHT+IG8IfST3nyvYoCRvu1RFNryBOvD6Ec4YJrORE4tPz0VspLqSPsClCE0/QoVMDG9t5ZZF20FHQ==
X-Received: by 2002:a17:906:349a:b0:a46:dd30:7cb5 with SMTP id g26-20020a170906349a00b00a46dd307cb5mr5379016ejb.76.1711007751629;
        Thu, 21 Mar 2024 00:55:51 -0700 (PDT)
Message-ID: <68a00864-3bd3-445a-aa79-eb0511b4bea9@suse.com>
Date: Thu, 21 Mar 2024 08:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20240320135720.68894-1-roger.pau@citrix.com>
 <73314dc5-0145-4aa7-a3cd-23c943235392@suse.com>
 <aec3917b-cda8-40ec-97d5-fe4ffb73c90d@citrix.com>
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
In-Reply-To: <aec3917b-cda8-40ec-97d5-fe4ffb73c90d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2024 16:20, Andrew Cooper wrote:
> On 20/03/2024 3:09 pm, Jan Beulich wrote:
>> On 20.03.2024 14:57, Roger Pau Monne wrote:
>>> There's no reason to force HVM guests to have a valid vcpu_info area when
>>> initializing a vCPU, as the vCPU can also be brought online using the local
>>> APIC, and on that path there's no requirement for vcpu_info to be setup ahead
>>> of the bring up.  Note an HVM vCPU can operate normally without making use of
>>> vcpu_info.
>> While I'd agree if you started with "There's no real need to force ...", I
>> still think there is a reason: If one wants to use paravirt interfaces (i.e.
>> hypercalls), they would better do so consistently. After all there's also
>> no need to use VCPUOP_initialise, yet you're not disabling its use.
> 
> I firmly disagree.
> 
> There are good reasons to use VCPUOP_initialise over INIT-SIPI-SIPI
> (like avoiding 16bit mode - in the case we want it here, to fix APIC_ID
> enumeration in a way that doesn't involve putting more complexity into
> HVMLoader), and forcing us to set up a useless structure before we can
> boot vCPU number 32 is just wrong.

Just to mention it: I can certainly accept this as one possible valid
viewpoint, and my looking at it differently is not an objection to the
patch. It's just that the other aspect mentioned needs sorting (perhaps
by just extending the patch description).

> It was dumb to design a hypercall like this in the first place for PV
> guests, and it definitely isn't OK to keep guests broken because of it.

And again just to mention it: Originally, with a vCPU limit of 32, all
vCPU-s would reliably have had vcpu_info (by way of that being embedded
in shared_info). When raising the limit, the goal was to not chance
overlooking any vcpu_info access in Xen. Hence why, instead of putting
a NULL pointer there (or perhaps some non-canonical sentinel), the
dummy approach was chosen. It then seemed quite desirable to prevent
vCPU-s coming online without them first being detached from that dummy
structure. And I think this firmly needs to continue to hold for PV.

Jan

