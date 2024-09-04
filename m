Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8FF96BCA3
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 14:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790252.1199992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slpKg-0005f0-Fo; Wed, 04 Sep 2024 12:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790252.1199992; Wed, 04 Sep 2024 12:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slpKg-0005cw-Cr; Wed, 04 Sep 2024 12:41:58 +0000
Received: by outflank-mailman (input) for mailman id 790252;
 Wed, 04 Sep 2024 12:41:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slpKf-0005co-Gn
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 12:41:57 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11e598c2-6abb-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 14:41:56 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f6514f23b6so15258811fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 05:41:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900f079sm804572066b.66.2024.09.04.05.41.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 05:41:55 -0700 (PDT)
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
X-Inumbo-ID: 11e598c2-6abb-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725453716; x=1726058516; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qe5NVqkKyQs8UyeQAjs5lANUk8V5se6/JH8YHAJzKZE=;
        b=ZkFDH45IqkvdZTJO7/mHu2xyaToj2MaSNeAdEAjyCI6yfrxZFMkHA/M+iiWsOuPBSQ
         pzqL4UbrPOo+6Em9z6lzOWi9sfONAZ64dT+lXDFOMvQJ9guxAhigOt6V4Hh4lLEqbFF2
         ncfVyk3Ux1Ga3prhjDw7xKOGsDgTKUeCE6evG4g2KuYFGbSrP+b/tCwZoVXWe/o+rHse
         dAyI/GBxO9h13Q1r3dsncPAeVRFFXFDIFUx5XUA8jWT53Ujh1URocQpi5IodX+NW++3b
         TwPixvBjBaWoxu/UTjp4rA5ZwqKRAPC0RPrAk2BF0eOTHFdMqfEuI+P1PUup7XMds1s/
         3JCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725453716; x=1726058516;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qe5NVqkKyQs8UyeQAjs5lANUk8V5se6/JH8YHAJzKZE=;
        b=EsM3q32FuL6VmQBSZrZVOmi3/zprgfKK8mZU3STcHqydEhgr2hJvWnpT1KJ8kRRFvw
         N/0ahIgaQigc19wNR1Q/62fbRAHYVby2JHpdWILdBUbo0R0EH4fpeL7CUC/wVb+2uVVq
         Yjlf2hRb2lAjgRBqNSVIqi4Aw4xo4Wd35BFp5wON28mBa6sb0MQ3ijYbEsGTHU0Yx8o2
         gGxTAXmvVuH6waQBbD1byeG/xDfjXS0nJlJeZp0On3wPLCTqBQeumXwUBzTmLd2Cyxh4
         VMEtCbrNnJluEqSW6ZkCgpILxYrsmM2+us5sovhLPvP0Jr4XbcbhRuLR110/MkbwDHWm
         +y7w==
X-Forwarded-Encrypted: i=1; AJvYcCUG9qgBPoO++Dw9XUZ6uHH9kaCZqW7GPdZ6evVg6a3NSbV3awNT3ceLQzQVj0/grymLw1MsAiOuU5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfCjhNQru+0LYQbris9uz4DG59mbvDE4V3q5wrwwZn63qQUOw2
	BuTbpDQ6sFa5z5QuYP8QMD77yjjRZVmCLg18a9yvkNoTxXqk7Csb+KshHyVMkg==
X-Google-Smtp-Source: AGHT+IG89PpdDHQ2wfQIod+FSmh8bDGyB3o7wNvMZaUKIIhi/GooTvr9hVk5OuLDHpDXPoQalDlBwg==
X-Received: by 2002:a2e:be03:0:b0:2f4:f253:ec7 with SMTP id 38308e7fff4ca-2f6104270b5mr197869041fa.0.1725453715735;
        Wed, 04 Sep 2024 05:41:55 -0700 (PDT)
Message-ID: <2b11bf7b-d7ee-4792-b2c1-2a3163ca3eb1@suse.com>
Date: Wed, 4 Sep 2024 14:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] x86/time: introduce probing logic for the
 wallclock
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240903130303.71334-1-roger.pau@citrix.com>
 <20240903130303.71334-5-roger.pau@citrix.com>
 <bc1bd23f-edf5-447a-9799-bca0a6cd696e@suse.com>
 <Ztg9VeXxdM2iBLOR@macbook.local>
 <dde7fd70-3273-4569-b412-d276d4974882@suse.com>
 <ZthS7PwABiQiCCWI@macbook.local>
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
In-Reply-To: <ZthS7PwABiQiCCWI@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2024 14:30, Roger Pau Monné wrote:
> On Wed, Sep 04, 2024 at 01:49:36PM +0200, Jan Beulich wrote:
>> On 04.09.2024 12:58, Roger Pau Monné wrote:
>>> I had it that way originally, but then it seemed the extra
>>> indentation made it less readable.  Will see how can I adjust it, my
>>> preference would be for:
>>>
>>>     panic("No usable wallclock found, probed:%s%s%s\n%s",
>>>           !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
>>>           cmos_rtc_probe ? " CMOS" : "",
>>>           efi_enabled(EFI_RS) ? " EFI" : "",
>>>           !cmos_rtc_probe ? "Try with command line option \"cmos-rtc-probe\"\n"
>>>                           : !efi_enabled(EFI_RS) ? "System must be booted from EFI\n"
>>>                                                  : "");
>>>
>>> But that exceeds the 80 columns limit.
>>
>> Right, formally the above would be my preference, too. Here two shorter-
>> lines alternatives:
>>
>>     panic("No usable wallclock found, probed:%s%s%s\n%s",
>>           !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
>>           cmos_rtc_probe ? " CMOS" : "",
>>           efi_enabled(EFI_RS) ? " EFI" : "",
>>           !cmos_rtc_probe
>>           ? "Try with command line option \"cmos-rtc-probe\"\n"
>>           : !efi_enabled(EFI_RS) ? "System must be booted from EFI\n"
>>                                  : "");
>>
>>     panic("No usable wallclock found, probed:%s%s%s\n%s",
>>           !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
>>           cmos_rtc_probe ? " CMOS" : "",
>>           efi_enabled(EFI_RS) ? " EFI" : "",
>>           !cmos_rtc_probe
>>               ? "Try with command line option \"cmos-rtc-probe\"\n"
>>               : !efi_enabled(EFI_RS)
>>                   ? "System must be booted from EFI\n"
>>                   : "");
>>
>> Either of these or anything more or less similar will do imo, just as
>> long as the ? vs : alignment is there.
> 
> I think I prefer the second variant, as indentation is clearer there.
> 
>>
>> One thing I notice only now: The trailing %s will be a little odd if
>> the "" variant is used in the last argument. That'll produce "(XEN) "
>> with nothing following in the log. Which usually is a sign of some
>> strange breakage.
> 
> I've tested this and it doesn't produce an extra newline if the string
> parameter is "".  IOW:
> 
> printk("FOO\n%s", "");
> 
> Results in:
> 
> (XEN) [    2.230603] TSC deadline timer enabled
> (XEN) [    2.235654] FOO
> (XEN) [    2.238682] Wallclock source: EFI

Oh, my mistake. Format string processing of course comes before the
determination of line breaks within what is to be output.

Jan

