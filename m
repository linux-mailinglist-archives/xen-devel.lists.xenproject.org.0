Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF17972C9B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 10:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795125.1204279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snweA-0002Mh-Oi; Tue, 10 Sep 2024 08:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795125.1204279; Tue, 10 Sep 2024 08:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snweA-0002IX-Jq; Tue, 10 Sep 2024 08:54:50 +0000
Received: by outflank-mailman (input) for mailman id 795125;
 Tue, 10 Sep 2024 08:54:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snwe8-0002G6-Jh
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 08:54:48 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53fa334c-6f52-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 10:54:46 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso48902266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 01:54:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d657fesm453354166b.221.2024.09.10.01.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 01:54:45 -0700 (PDT)
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
X-Inumbo-ID: 53fa334c-6f52-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725958485; x=1726563285; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jK4l7+/psZ/FR8kOwC806XIhHqjPYte0or/yFucIwHo=;
        b=MKThYK/plnmtevL8kgNF/QS6M5rZAaV0/MTCFZAycAao7NuFpM8upaE8nJnK2sqNP3
         v4qIks9byn2q33+pLvsvZ5UOBS8irB+RPsAksYZw8ei9UHk9/mMyhh+vxz5LAG3IB48l
         yzPSrC48dED8dYlZGJbqFK+QBKQ2+nJiJiEfVqKb3BcQkrIN9IYDNSocOSWdMv1lGvwR
         4KkfJmQafNWsu1jrzEpsZnhyWGfsSxS2MCUJpTsFAP4WGvhYeE4fyjORoEEuxASPnpia
         XDc4uXSIw4gnJosy0YB669ge9wyHYf+yeIzXnlCv8ToGjeQPxiqEm8kmiD8sVEHGF2QZ
         CajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725958485; x=1726563285;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jK4l7+/psZ/FR8kOwC806XIhHqjPYte0or/yFucIwHo=;
        b=cRMo0aIrpebvgHcO7ipvFAbO2pO1V0MPBmtNq3h3dWTLBlhflJ/eIvssmuiXISE6fx
         0eqkJPhfRYKyN5yrV7PPTJrCVFeMUvb2vBMtiREbt2xbfKqyBUZ1L07nPChX48yGZr3j
         +YZuLHjnScEDGEbjJywm9kmZSfTjwbRA1t/EMNFvU2ONzgbvX4J16+kcApyEtuu9etXc
         s+/13fvzrEKZyZZmmrvcxvZvCu/Y3ROLSQi6zG5zjW2l05Ev86gFdcJzTRQ7oVFRkZU/
         D0CFb0x7gFWk60b5uJ9gUFA/IEmvRx3NOK7Di/kN90q45FUj0WD3eQUQrwKrllszWmOk
         k1YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvnsvxagPo0sx83QGClx8JPcXWj99FEsfAH9MZ5xRgzyPDOV8O65uE0SaCZRUbFQgYwAVMI6y8upQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/pzBklXBXCYzf+rkrO6WDNQY5YT/S83F4Gh+dPyHSIWW/7uov
	GMTn8r5/xLp4MADWb/uO+BegIHfGzFdeLQKVVczdiB3l6KLIbVIDh4E97sGrhg==
X-Google-Smtp-Source: AGHT+IEEd+ihVCWZBnnt5aAc5uCsA+5tAGLGmtlMkZK7ODw9RHHnUeBRCZIoSldB213kcHZ0uZgnSw==
X-Received: by 2002:a17:906:c156:b0:a8d:555f:eeda with SMTP id a640c23a62f3a-a8ffaab0a09mr5496566b.8.1725958485323;
        Tue, 10 Sep 2024 01:54:45 -0700 (PDT)
Message-ID: <940fc273-4540-4177-9647-ddf37bd7b8af@suse.com>
Date: Tue, 10 Sep 2024 10:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] xen: allow mapping ACPI data using a different
 physical address
To: Juergen Gross <jgross@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-acpi@vger.kernel.org
References: <20240820082012.31316-1-jgross@suse.com>
 <20240820082012.31316-7-jgross@suse.com>
 <607602c3-5199-4326-8676-d28a8b42b4b5@suse.com>
 <b6bb45ab-23bb-458d-a8db-9619f594e8c7@suse.com>
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
In-Reply-To: <b6bb45ab-23bb-458d-a8db-9619f594e8c7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 10:15, Juergen Gross wrote:
> On 20.08.24 11:56, Jan Beulich wrote:
>> On 20.08.2024 10:20, Juergen Gross wrote:
>>> @@ -838,6 +839,31 @@ void __init xen_do_remap_nonram(void)
>>>   	pr_info("Remapped %u non-RAM page(s)\n", remapped);
>>>   }
>>>   
>>> +/*
>>> + * Xen variant of acpi_os_ioremap() taking potentially remapped non-RAM
>>> + * regions into acount.
>>> + * Any attempt to map an area crossing a remap boundary will produce a
>>> + * WARN() splat.
>>> + */
>>> +static void __iomem *xen_acpi_os_ioremap(acpi_physical_address phys,
>>> +					 acpi_size size)
>>> +{
>>> +	unsigned int i;
>>> +	struct nonram_remap *remap = xen_nonram_remap;
>>
>> const (also in one of the functions in patch 5)?
> 
> Yes.
> 
>>
>>> +	for (i = 0; i < nr_nonram_remap; i++) {
>>> +		if (phys + size > remap->maddr &&
>>> +		    phys < remap->maddr + remap->size) {
>>> +			WARN_ON(phys < remap->maddr ||
>>> +				phys + size > remap->maddr + remap->size);
>>> +			phys = remap->paddr + phys - remap->maddr;
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	return x86_acpi_os_ioremap(phys, size);
>>> +}
>>
>> At least this, perhaps also what patch 5 adds, likely wants to be limited
>> to the XEN_DOM0 case? Or else I wonder whether ...
>>
>>> @@ -850,6 +876,10 @@ void __init xen_add_remap_nonram(phys_addr_t maddr, phys_addr_t paddr,
>>>   		BUG();
>>>   	}
>>>   
>>> +	/* Switch to the Xen acpi_os_ioremap() variant. */
>>> +	if (nr_nonram_remap == 0)
>>> +		acpi_os_ioremap = xen_acpi_os_ioremap;
>>
>> ... this would actually build when XEN_DOM0=n.
>>
>> I'm actually surprised there's no Dom0-only code section in this file,
>> where the new code could then simply be inserted.
> 
> I'd rather make this conditional on CONFIG_ACPI.

Oh, sure.

> Depending on how Xen tools will handle a PV-domain with "e820_host=1" this
> code might be important for domUs, too.

Right, if that's a possibility for PV (I thought that was a HVM-only thing,
yet maybe it really is precisely the other way around), then yes, DomU-s
may too need to cope with unexpected overlaps.

Jan

