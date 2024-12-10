Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CA89EB44F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 16:05:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852687.1266420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1nm-00063u-VX; Tue, 10 Dec 2024 15:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852687.1266420; Tue, 10 Dec 2024 15:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1nm-000622-St; Tue, 10 Dec 2024 15:05:30 +0000
Received: by outflank-mailman (input) for mailman id 852687;
 Tue, 10 Dec 2024 15:05:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL1nl-00061W-5F
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 15:05:29 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30879482-b708-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 16:05:27 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3862b364538so2427579f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 07:05:27 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861f4a859esm15966484f8f.23.2024.12.10.07.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 07:05:26 -0800 (PST)
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
X-Inumbo-ID: 30879482-b708-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733843127; x=1734447927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=abNTXu84lOkHxjOFMdNsvofnXqxH/OgUrvNNoWc4Bco=;
        b=PPFBdkr2p3eupcsQgLqrdJtAW5XV0sG5jMWqZPQc5rvk5e4s2Lc2B88/luXXl2Cd6z
         SuBoz+POf0Wh89G1PTZtPO5pSfz9AG0d3xqbz35VA0zaomwO8ONHnwYYKRMVKIhz8bAw
         Lx/8pM9pA7qEseZusEp5233+el8DxGNAGU7AtYcAWLNibW9akCEE9FI2KoOjgnPHZPVB
         v6DAAtMaYVrx8ISBmEgum64azNm0tPU1e1P1zjWvBk4Hom3nPG0zuLnVfHGe1RKtB46H
         a057lnJuSwSmUXNcZptBd01GBKsIh8mLfaqWOK3HR3PJTui9KyR9Cm/7WX08UBqsFuS8
         0/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733843127; x=1734447927;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abNTXu84lOkHxjOFMdNsvofnXqxH/OgUrvNNoWc4Bco=;
        b=wPz/78gX5uG8M4DYdvhVTjaOmkOC8eBHnUZMNZNdBw2xr34eYTPevJRumwf5Yh34M/
         5n5npFYmuYQZjzZgisgUD7KyxpiG8YkBR1YVz0MCDyPPYrwOt3U+xwx/eER0M9fBtk3V
         F3cPXOvvNkycaEC4iGtq91lcXX4tBKaBXEwetY/Gy9F6HoNcA8+MSjj0RU4mMfDNEoBK
         sRDDr7uLpJ/P6A6j9srboos5tTFGKLExJmxZlm2b3UFTpXRcf/TbJujiCHDMnxlS1Uau
         ZxwaIsLCZHYDjpo+FsZ+4jw8gUqFpsUBDvVGAhTklWzVAB0rpTi+diVrPnyeEVe3GWMG
         6jwA==
X-Forwarded-Encrypted: i=1; AJvYcCWqSclbJ+NxCsgYtra334/g4wjGC+Yg1LlbUqycPybi6oKcaClzV3/UXX+nZ33qS9XhmpVzzqJTz+U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4uQSstBRtAWgLjyFCZ5zDDK7zXOSn9EKihG+YblMQpHlnZkfV
	6C1W5tOg8DsWbGyI2ZIjNS5krplxy9fCEqqYkz2NWcf3lpIp1amLMLRo/UJg3w==
X-Gm-Gg: ASbGncvjKErk9s1vjIm7/EDPYlfL5gNpNNuF2fcraM/SUPa8TjLlHtfERYlljSoQYii
	PfNYlIrsz7vRVUUMMknfpGbzaTwA73i0PoqEFU8i8EmB00PfMIbLn8e5KNGmG0YZU4keOXOzLSc
	m+/jzMPpkO+WKXXSimgvpqWnQrv43Yt9F2K4NzXuj8LA09JISuM8DBQcVNR3F14v3zkIAirpUex
	32Wq7zjBpnbMB0rQvC6DTzrph0ZkAp5roM1rwly6rXRmQvBWA55T7bNZIV0aLbpujEW5H0rnpUC
	M29AEQnryefeOUAUqCROgPmhnBkxGVdMM174VQmo7uYfV8aXlGyv6kajWOI8oCQMwON59nTi1hG
	8nG52tJNcDw==
X-Google-Smtp-Source: AGHT+IH3ObJYbSJ1fFbKHM8kXFe3iKy7E43Qc5t6RHVHD62Ri4kPRvCoMmAzFFaij7pUPVRoxYU+Pw==
X-Received: by 2002:a5d:6c6d:0:b0:385:df17:2148 with SMTP id ffacd0b85a97d-386469d513bmr2905347f8f.20.1733843126650;
        Tue, 10 Dec 2024 07:05:26 -0800 (PST)
Message-ID: <492bd49b-a0a1-4d86-b5c2-304a7deac755@suse.com>
Date: Tue, 10 Dec 2024 16:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] x86/boot: Move some settings to C
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
 <20241122093358.478774-4-frediano.ziglio@cloud.com>
 <d5b856b5-ba0d-489b-9107-7c16b4042c55@suse.com>
 <CACHz=ZhQiETp-=wO1XgcJ2BqLSMq79c=0W34ZBrAMSu3epSVAQ@mail.gmail.com>
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
In-Reply-To: <CACHz=ZhQiETp-=wO1XgcJ2BqLSMq79c=0W34ZBrAMSu3epSVAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2024 15:45, Frediano Ziglio wrote:
> On Tue, Dec 10, 2024 at 10:38 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 22.11.2024 10:33, Frediano Ziglio wrote:
>>>      switch ( magic )
>>>      {
>>>      case MULTIBOOT_BOOTLOADER_MAGIC:
>>> -        return mbi_reloc(in, &ctx);
>>> +        res = mbi_reloc(in, &ctx);
>>> +        break;
>>>
>>>      case MULTIBOOT2_BOOTLOADER_MAGIC:
>>> -        return mbi2_reloc(in, &ctx);
>>> +        res = mbi2_reloc(in, &ctx);
>>> +        break;
>>>
>>>      case XEN_HVM_START_MAGIC_VALUE:
>>>          if ( IS_ENABLED(CONFIG_PVH_GUEST) )
>>> -            return pvh_info_reloc(in, &ctx);
>>> +        {
>>> +            res = pvh_info_reloc(in, &ctx);
>>> +            break;
>>> +        }
>>>          /* Fallthrough */
>>>
>>>      default:
>>>          /* Nothing we can do */
>>> -        return NULL;
>>> +        res = NULL;
>>
>> Simply keep returning here? No need to write the NULL when the variables
>> start out zeroed?
>>
> 
> Yes, considering pvh_start_info_pa and multiboot_ptr should be already
> NULL it makes sense
> 
>>>      }
>>> +
>>> +#ifdef CONFIG_PVH_GUEST
>>> +    if ( pvh_boot )
>>> +        pvh_start_info_pa = (unsigned long)res;
>>> +#endif
>>> +
>>> +    multiboot_ptr = (unsigned long)res;
>>
>> In the assembly original this is an "else" to the if().
>>
> 
> I suppose the return change above would solve also this.

I'm not convinced of this.

Jan

