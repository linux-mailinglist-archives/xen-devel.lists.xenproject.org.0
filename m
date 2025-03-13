Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67355A5F941
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912434.1318686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskB8-00066b-CX; Thu, 13 Mar 2025 15:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912434.1318686; Thu, 13 Mar 2025 15:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskB8-000655-85; Thu, 13 Mar 2025 15:08:58 +0000
Received: by outflank-mailman (input) for mailman id 912434;
 Thu, 13 Mar 2025 15:08:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tskB7-00064z-FT
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:08:57 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 153010b6-001d-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:08:56 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so7511615e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:08:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df35ecsm2441432f8f.16.2025.03.13.08.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:08:54 -0700 (PDT)
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
X-Inumbo-ID: 153010b6-001d-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741878535; x=1742483335; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CqC++5E1NnbwneFvgKXFyaeCWRdrqITIm3BQyjo9+Do=;
        b=ErQV/LqFqir7AIy2u5qpOlnzLUBrOgLN4G/CM/tIe/4Gc6U7RwQBNOlWh8eiZKIzS6
         oxrDGXTcD10r5WrIa92iS9g+vWGWxKWfafpeoaUhxnriSex4X53ChXaKdFCSfqYTkmde
         mUBaIOsQuiixzSwQ08ZfH49DvRQCHblyzVLHReDkxxX0Sx6iljosmd3B1KoejzWsuSgo
         dNFmA6fL2jfYz1D8TM04JCQRQI8TEjPFwAHX0Zw//psV+UJ5H274XezD4qyD3ZucM5AM
         7jOkaAQgtpCt3NcivLc40EGzewogGw58HUvxkfRvA2fLHcaNAFZVuCQ0fSwV57xieiBf
         g11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741878535; x=1742483335;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqC++5E1NnbwneFvgKXFyaeCWRdrqITIm3BQyjo9+Do=;
        b=Q7tCSsWACUQxj+U5rswq6Z7LUNoq0E1YaZbOKisSOXUIXpj7oTxzkm+wKfFOtTP2FJ
         nwOvxiy0N8D3+MM2LewYleRWzc2yfSGAYp6FijGFQa8UhviJ/G1YCTP3FjZu7DmIcIFM
         bTJqe8OdYrMT04M9y2mM5W62ioThsZ5hOre5WQ9zAHEVyz+l2ijUU/REJHDM9dk5WzK+
         0nUObXJf3Ts0EYydbXt+9sbxrGqOOuStzgNzTJIoqPrskB9z9lOcTJ7WuREM1bppfdTe
         8CusxvI5LdxN8IT4RBZYBc5ET3IzNYjPHeFSZLJiMSUbDymJiN9Cgh3nr6tZ2DjSrlov
         Hpcg==
X-Forwarded-Encrypted: i=1; AJvYcCU7Rp/HUGCxvbop0yPZ9e0kV5WYGdSoEAMju7ZwlEjN9LMlFMVC22LkvjkOG4QfJDVsBJMoCwQ0KME=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+B48eKYrr8PZH60wCpDAGmKldkXuDLQO2PNsLji2eBD4RKVhe
	lNjKIAD5sBWGBMaLNRZnWIs4oYzvQ8r/+EtrFdJXxi6QyzWsP1/PUgybIBJNbA==
X-Gm-Gg: ASbGnctmHRn4W5caLUga0oKUmSU7eoIsIjZKjDbDhN19CanZpunY5dspPSpPxQj3bMU
	F5s1T8fnsawRpJ70P7VyneL6Le5BhjzOGoYLJIebVVYnuyR5zgzTwNfA+t4pyhLVl/NAfkxoh8V
	htj+9XCO3FbzK7WMUXvCKR3LGIbWqHYebyqoncnTU61yvPaojaUYkbaVYwKdEqvabbJK8v4tqzh
	CPf9qDwV/z6IUKC/upBPcGYYhijHSmcAewzO32pFYCNhgLbRcVG+uj15G8kFeedOaefqNXMr7c4
	J51cRPPV6HLr4r9/pQs7+7i3ivsOe1tG4KYgxyGEUNfWSv81hVbR5aXUBtnKCa91DJNUHzvlJJU
	zwB7QzDXkSPQJJZNQeIKeEWaxMPvpMg==
X-Google-Smtp-Source: AGHT+IFhvemZnNmEm9hAUbTfbZP3CEDRtEz5vKmfHw0R0SJMuLgu0SRJSVa8ONSAhn/KFjOItk2SLg==
X-Received: by 2002:a05:6000:186d:b0:390:df75:ddc4 with SMTP id ffacd0b85a97d-39132db1113mr22697077f8f.44.1741878535185;
        Thu, 13 Mar 2025 08:08:55 -0700 (PDT)
Message-ID: <98225afe-7bb6-4403-bd91-7410b5cb31fe@suse.com>
Date: Thu, 13 Mar 2025 16:08:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] VT-d: have set_msi_source_id() return a success
 indicator
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8b610dba-0ce9-47ed-808d-035dc48f4f04@suse.com>
 <6468c44a-772e-45a6-b712-0732c9017234@suse.com>
 <f64ca308-d3e4-4097-9a60-886ba4592644@citrix.com>
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
In-Reply-To: <f64ca308-d3e4-4097-9a60-886ba4592644@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 16:01, Andrew Cooper wrote:
> On 13/03/2025 1:34 pm, Jan Beulich wrote:
>> Handling possible internal errors by just emitting a (debug-build-only)
>> log message can't be quite enough. Return error codes in those cases,
>> and have the caller propagate those up.
>>
>> Drop a pointless return path, rather than "inventing" an error code for
>> it.
>>
>> While touching the function declarator anyway also constify its first
>> parameter.
>>
>> Fixes: 476bbccc811c ("VT-d: fix MSI source-id of interrupt remapping")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>,

Thanks.

> although...
> 
>> --- a/xen/drivers/passthrough/vtd/intremap.c
>> +++ b/xen/drivers/passthrough/vtd/intremap.c
>> @@ -436,15 +436,13 @@ void cf_check io_apic_write_remap_rte(
>>      __ioapic_write_entry(apic, pin, true, old_rte);
>>  }
>>  
>> -static void set_msi_source_id(struct pci_dev *pdev, struct iremap_entry *ire)
>> +static int set_msi_source_id(const struct pci_dev *pdev,
>> +                             struct iremap_entry *ire)
>>  {
>>      u16 seg;
>>      u8 bus, devfn, secbus;
>>      int ret;
>>  
>> -    if ( !pdev || !ire )
>> -        return;
>> -
>>      seg = pdev->seg;
>>      bus = pdev->bus;
>>      devfn = pdev->devfn;
>> @@ -485,16 +483,21 @@ static void set_msi_source_id(struct pci
>>                              PCI_BDF(bus, devfn));
>>          }
>>          else
>> +        {
>>              dprintk(XENLOG_WARNING VTDPREFIX,
>>                      "d%d: no upstream bridge for %pp\n",
>>                      pdev->domain->domain_id, &pdev->sbdf);
> 
> as you're doing cleanup, %pd here?  Given DOM_IO for quarantine, I think
> it's more likely now than it used to be.
> 
>> +            return -ENXIO;
>> +        }
>>          break;
>>  
>>      default:
>>          dprintk(XENLOG_WARNING VTDPREFIX, "d%d: unknown(%u): %pp\n",
>>                  pdev->domain->domain_id, pdev->type, &pdev->sbdf);
> 
> Here too.  Also, the "unknown(%u)" is less than ideal.  "%pd: %pp
> unknown type %u\n" would be better.

To be honest this feels like going too far with unrelated cleanup here,
even if it's all in patch context. It would be different if at least I
touched those dprintk() invocations.

Jan

