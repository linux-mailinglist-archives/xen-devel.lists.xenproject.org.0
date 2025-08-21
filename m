Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37149B2FCB2
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 16:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088769.1446493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up6Ku-0005Bu-KR; Thu, 21 Aug 2025 14:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088769.1446493; Thu, 21 Aug 2025 14:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up6Ku-00058u-Hk; Thu, 21 Aug 2025 14:32:16 +0000
Received: by outflank-mailman (input) for mailman id 1088769;
 Thu, 21 Aug 2025 14:32:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up6Kt-00058k-5S
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 14:32:15 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0c332e5-7e9b-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 16:32:13 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afca3e71009so334242866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 07:32:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded478b13sm409393866b.71.2025.08.21.07.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 07:32:12 -0700 (PDT)
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
X-Inumbo-ID: a0c332e5-7e9b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755786733; x=1756391533; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L1aQiAv6L7gk6NAB/mBd9+LZh2X/xSMhulIbkSbaQWQ=;
        b=fM06pikGC879tPCg4z1ifvrxwU3UfSDJmMdp5pgSYS8VG/CLjqJAIwAbmpeug9/aiC
         oisY1xxCjIInJYOC/p+pT3z0SxLUxybgyPIAreDRJLUUm08JqzjoeAqWtnZV0GqU/D5w
         j3Yh8Vl4agSI59PZH3t2xoPLJKcpkwJopmBM5OO+cpDMJ2LRwalT1dgBYiGnRixOWA5B
         rkVaQN2VN5Y7k7NICHmfcCQz6pIuh5BGSZ0cmplNDAvr7Dmlf/FChszYUctQRmfDrWu3
         RDGSdd1Eow2p+uIItSo2s44oaEkkYqu/ibbOhfCk6accoVzPKVkqrrY2NabEMuJQOOn6
         zEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755786733; x=1756391533;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1aQiAv6L7gk6NAB/mBd9+LZh2X/xSMhulIbkSbaQWQ=;
        b=OKWyhiuRZQ7jrhY0fqE0AroSSCIK8KRYxHIUTmZYdT7aNRNDJR0e2zV6I5aVh3t/n4
         jsldpHdaX9tb+qoW3tOr7/y9vEMAgyeyKNON/4MLjm5kSOzlr42EfBMy4QaqBNYR8KPo
         PqnTYZfL7FAbn20RmqdgNZdFhF7HNrjjAlJFeyG/tYJdnle2s4glwDebtnwx7VjTktfI
         ln3MN6uLqVOGwPyjKzddeLaEeRh8sPIAwyVNmdXdqMeTZ4HuGyVBvOHv5U7mFIWQProi
         axnU37tf7PhVVL17f7eOr62zQdYj1VsVvM27u/SuIUdHDB2gXfd9xMiyHrQhDbmkLl42
         NpUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMl3547/KW0/rvinJqsPJ66TEC0jtMp35g4P0D6arMkN40XcfLTLmA7PijnDUJuQmYsXsSfVmP+J0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzC5GSaFOEtZM/tNiAcUsYfp8Pz/ajqWb/WWAFgjttHrY7N7zIJ
	SOU+WJjY7utYjo8gj8ubwZaH7pIrie0YSldzj745AQkAWLrZHZWN7OVarIJip3NTww==
X-Gm-Gg: ASbGncshRS9u7Gg6xRzc2LCTaBmNW83xbcwfXsH5vwE2rTjwSDbia2cfrZQaCkWL9B7
	ch6BH+cy541uB+f870j2RKQCk3FjLOFoaGH8U1jMl2jBeOH9WmhXZ7kG1VBT73I7rCXVQqtRmsu
	nLL9z8xQNY193CcJ3Up5bCzpmUMhqLk2jgiWPxv+QqWsadVfVDrbNCJPXc3WNFBb04iJg5MAmfp
	o1/cA7Tk0DfSmkMxfD3phxazhT3Fzb6Ygn8eW/GDhIslWz42BDVHY6dvMcrN13ikhzDWrx/Ntye
	N55PFygasmjVuiZgvFogvYG2uo07QQbG1ZJyvdEnz1sabuPUhfzYG05rOFUhxGxvNMM+xP+ffIs
	gwG2vcgeEgKAwHGTXKl4Mb5+YJL9cL92jBnhCCi1dxh66h1lvLY45YvGHRdLubrdOY4KvylbYQq
	RzAaA04/ljLKC6pNiQgA==
X-Google-Smtp-Source: AGHT+IHjQE22rDQtV/bbG7Y6M5UFua2e6t8Cd/o/DsOHpq5/BUVhpUimmTMSLddO+zJwb5zSV3G+Mg==
X-Received: by 2002:a17:907:7210:b0:ae3:ee3a:56ee with SMTP id a640c23a62f3a-afe0b970284mr244507266b.3.1755786732599;
        Thu, 21 Aug 2025 07:32:12 -0700 (PDT)
Message-ID: <ad40448c-499a-4d85-920b-a95bdeb67d9d@suse.com>
Date: Thu, 21 Aug 2025 16:32:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviation for MISRA C Rule 11.3
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d6a8682c98880d66ea99f882520b3defda0e3fe0.1755672275.git.dmytro_prokopchuk1@epam.com>
 <5199396a-685c-4839-b7cb-d32e3f4a0b48@suse.com>
 <159de776-d0bf-4f77-a6b6-670246eca85e@epam.com>
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
In-Reply-To: <159de776-d0bf-4f77-a6b6-670246eca85e@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 16:13, Dmytro Prokopchuk1 wrote:
> On 8/21/25 12:18, Jan Beulich wrote:
>> On 20.08.2025 09:17, Dmytro Prokopchuk1 wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
>>> @@ -45,6 +45,7 @@
>>>   -enable=MC3A2.R10.2
>>>   -enable=MC3A2.R11.1
>>>   -enable=MC3A2.R11.2
>>> +-enable=MC3A2.R11.3
>>
>> While the description mentions this change, it doesn't say why (e.g. "no
>> violations left" or "only this and that violation left" or some such).
> ARM:  813V ->   16V
> X86: 1422V -> 1035V
> 
> Looks OK for ARM (to be added in the monitoring list), but X86...
> Anyway the number of reported errors has no side effect.

Does it not, i.e. not even on the time it takes Eclair to do a full run?

> Jan, decision up to you (include into monitored.ecl or not).

For x86 I think the count is still too high. And no, it's not solely my
decision.

Jan

