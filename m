Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1EAA25A4E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 14:03:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880577.1290661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tew6j-00022l-2E; Mon, 03 Feb 2025 13:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880577.1290661; Mon, 03 Feb 2025 13:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tew6i-00020l-Tm; Mon, 03 Feb 2025 13:03:20 +0000
Received: by outflank-mailman (input) for mailman id 880577;
 Mon, 03 Feb 2025 13:03:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tew6h-00020M-5s
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 13:03:19 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c11144f-e22f-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 14:03:17 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d0ac27b412so5457338a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 05:03:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc723d0043sm7699139a12.12.2025.02.03.05.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 05:03:14 -0800 (PST)
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
X-Inumbo-ID: 3c11144f-e22f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738587797; x=1739192597; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pvYdXkWl0kf7Ow0vEK4DkXQ2cuSP6jE69rN4lFI9YzA=;
        b=T9YOmZTyH15gZr7CKOdGXQaCQOZxqA1bEGeK2oSYvcKVO277YNrsyE/VIgMLsEeUc8
         p+tZ/j7nfO8XqEcDtEf9TQB+dGlP8FnbKOPzKHIW6mG8gjhcGJbxJEHMOFI3/nbDSUeB
         A5RkQmVuYATHrNXZuIOVPYpqITwF7TuEAMT+lZmD+Pro0uEO6dDhIHp/FJKonrHY33Ys
         13lbzwX7MLfwuRw926Yd9UvPI0/8vWZyG/01KdFIQnwVTAE39m/Ehp29R2OX55Nxolv/
         IX+AyesnUZI/g9i4U3NtQlRhP3WDMsnlsskgheNS56XUMA1RJ0hnphOSaWdAVilER7np
         rPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738587797; x=1739192597;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvYdXkWl0kf7Ow0vEK4DkXQ2cuSP6jE69rN4lFI9YzA=;
        b=SBbfEPHSZemcg+m8wrNZOmYhVw8R5TDZ5GRI+KsrBHSajWcxbYJy7zibAoijLZ87Bs
         jMzjgUhhCUtLfMyjcHEOglN7wrv8G5gm5vvHUKDhiU5awwOiDBW86aiSLzTz3gizBtb9
         LViazoXEyJLjVfExjSGEZFWd6QcnZCiyjZsS6ajVgwWvQIbcdwaLlJFLFtHCSfOfZxps
         fzhNJ+V91oSn70L2FJd7G0FfwPsYkzi1v2TF7YRENZtG4EjPnmqxyfYaSdMpN/Yub+i2
         pcK2ZsscGYLIT/2uBw95h5Iv5fm6g3/iC5ZJ0Em2RPWxFMbCL2sYp3E4m4IWpmQyEDbY
         n1LQ==
X-Gm-Message-State: AOJu0YxnGyxHczWjrtYK/llWnAxZsczNU+Oja1Cz5AEIE5kQdrMG7UMb
	2QUIqQ1P1ZPqz2yG6gPKdfFmpCEpj0EK6X2CwSSRw9/jUrXuX05iZEhWZSLeuw==
X-Gm-Gg: ASbGncu9IpitggGJSCkGF3Af54LFUTUy3YwpAAC757vSDSP5OPhnNsAifb1PoHgGMQ9
	PudR4XvJQacnhtvjiP3DblfX8y6bUU0v6eLUsan1tPDAlCojSs07MvK4KiCIrpLhfdNUIRUWTzC
	aFt9hwWBN90yqtHjB0cfjOk5NGSdayIsLLCLky+xOYYN+vpLPDzS+F2G6MfJgP+oJ1lbAQ++X+c
	F55C0yDFwWOjY0gIqxKMFoBHa/VMRNMoDe6KboRPLKmDtxt+hhn8J14EQtX1LGDrC5vVMw46tug
	WMqM9pyA1AODgv9jGALmNlL7G2x3jmMYU/TBNBIu4BchDsDHlbpgfMflbDpGTUAe+KUf5tivlKY
	z
X-Google-Smtp-Source: AGHT+IGI60kyjYubouWXyPBVkBI4zBRHAgBhyP90rjO2+h+GarflrSrKjEVNPmw+ttLbJJjbeXkJJg==
X-Received: by 2002:a05:6402:5255:b0:5dc:560:853 with SMTP id 4fb4d7f45d1cf-5dc5efc5b68mr23763671a12.15.1738587794971;
        Mon, 03 Feb 2025 05:03:14 -0800 (PST)
Message-ID: <37df8931-c9f4-4af2-a099-b2bb4539bffe@suse.com>
Date: Mon, 3 Feb 2025 14:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 2/3] x86/PCI: init segments earlier
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <940ccd1b-9ad8-4b68-a035-36f45326872b@suse.com>
 <Z6C6fUeB4mFfGfJc@macbook.local>
 <e7eff762-ff80-440e-8a92-e5a5e09a97ce@suse.com>
Content-Language: en-US
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
In-Reply-To: <e7eff762-ff80-440e-8a92-e5a5e09a97ce@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.02.2025 14:00, Jan Beulich wrote:
> On 03.02.2025 13:45, Roger Pau Monné wrote:
>> On Thu, Jan 30, 2025 at 12:12:31PM +0100, Jan Beulich wrote:
>>> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
>>> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
>>> @@ -402,8 +402,6 @@ void __init acpi_mmcfg_init(void)
>>>  {
>>>      bool valid = true;
>>>  
>>> -    pci_segments_init();
>>> -
>>>      /* MMCONFIG disabled */
>>>      if ((pci_probe & PCI_PROBE_MMCONF) == 0)
>>>          return;
>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>> @@ -55,6 +55,8 @@ void __init acpi_iommu_init(void)
>>>  {
>>>      int ret = -ENODEV;
>>>  
>>> +    pci_segments_init();
>>
>> My preference might be to just place the pci_segments_init() call in
>> __start_xen(),
> 
> As said in reply to Andrew - I was considering doing so as an alternative
> to the moving done here. I can certainly do so, in case some non-negative
> reply comes back from him.

Oh, and: With further adjustments following from what Andrew had outlined,
I'm actually moving the invocation of what was pci_segments_init() back to
where it's now. (Which doesn't mean that couldn't be done from
__start_xen(); just mentioning it.)

Jan

