Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ABA932969
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 16:44:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759641.1169309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTjPR-00048C-5c; Tue, 16 Jul 2024 14:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759641.1169309; Tue, 16 Jul 2024 14:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTjPR-000462-33; Tue, 16 Jul 2024 14:44:05 +0000
Received: by outflank-mailman (input) for mailman id 759641;
 Tue, 16 Jul 2024 14:44:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTjPP-00045w-Cz
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 14:44:03 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d74fe2fd-4381-11ef-bbfb-fd08da9f4363;
 Tue, 16 Jul 2024 16:44:01 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2eeb1ba040aso74641561fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2024 07:44:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ebc40c5sm6383095b3a.87.2024.07.16.07.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 07:44:00 -0700 (PDT)
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
X-Inumbo-ID: d74fe2fd-4381-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721141041; x=1721745841; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vaRkMqurbE0hQZizbSqP5YDubh1/Bzj4BZmfgG6mD4k=;
        b=CHjYuj1qDd2ryNKsLueERT09VFnJ/BOKo6s3VM2K3kF0WDXQT3fymcGbk3n0n69KcQ
         Kp0OO44lE8qWp+Jd+n6MzTfF97slvua9WSlaAqHBQ852QLX5j4m1DPg4eQb65J+0dKHo
         AA8naaEw+MWLRgNWR3k+yz6qQ1uDEPzur7T3ASZWrnQ8lK5hRwISJ8bhV9h3hd70mMih
         sS3zB1DnAfthZ6KZ8flRZekEGMEJHhxGBIkcu3iWmo5QIysO30OFzex4aDAECxg5mORZ
         4pB7XtGQY//MHcTT5TB+oRHOBYPvxtqG4/vUKLJ1evWZZFcQsDN9/Jp4BVTBrPd8nNbv
         PfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721141041; x=1721745841;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaRkMqurbE0hQZizbSqP5YDubh1/Bzj4BZmfgG6mD4k=;
        b=B4+p+LEC1GKGeP4Uo7E5r+B7boxJUwx4I+lyB6M3QRaJJsV6fLHOHxiv8HRKJfhPtZ
         7lWKXocUxPapwh5dF8hNBaSSWscEZtj0rkGo8XZiWc2hvLzmEUQgnSQaINwrZHr+yi6g
         f1pWWJcKQaeGCQtTGq/za49FX0XSZZlcqvVb24QQWjBlzxOS+Y7b7SWfFf+myn1giOLe
         e+ntJ04nRo1uFZ85su+yTaAJffoUH65JBHCU94knh4YIaEWqD31t1CXBMMIir3HqhOAy
         pJP4twdEXMU+2il7sg58a7toWyhPWcWvPR6Ys4uHHsurWXIjYRDjrr0eBRQsajiKYLIR
         2PRA==
X-Gm-Message-State: AOJu0Yz7JFkc2vqHfbtV4jq2z7Vp+3QdKkG4yFIT5NimUhe2wzZ12Lov
	fMGjotK4Of4mYFmaRpPPOv1+wqwehRDoSbLlNb7RoidHeKAY0gBPyXwPvqg8yw==
X-Google-Smtp-Source: AGHT+IHgUICZPBCrmoIukJVsXmQS26b3EIaSdeG6jjXp/Yhc6xo+JlcUZixf2kebTXvZxjr37FBK8w==
X-Received: by 2002:a2e:83c3:0:b0:2ee:db2c:5753 with SMTP id 38308e7fff4ca-2eef41ec98cmr16189451fa.42.1721141040887;
        Tue, 16 Jul 2024 07:44:00 -0700 (PDT)
Message-ID: <ef2f726e-2339-4606-9668-8fe0da524933@suse.com>
Date: Tue, 16 Jul 2024 16:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems in PV dom0 on recent x86 hardware
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>
 <ZousjqOAFJgO6681@macbook.local>
 <6101999a-6f88-46cb-b850-af43b364f299@suse.com>
 <7a0a8b1c-69e0-435d-b4f4-7a9d784eab29@amd.com>
 <1f96a355-b0d2-4cc9-a2ae-6d3ab750136d@suse.com>
 <89d7b5a6-e971-4cd0-85df-0dd599d0ba1b@suse.com>
 <7d207d6c-d025-4fbb-8649-9c42224097f5@suse.com>
 <88db3cb6-2b7e-48b2-9bf4-d871067325a0@suse.com>
 <3d6d35ea-5044-4249-a277-0e5aa31ed888@amd.com>
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
In-Reply-To: <3d6d35ea-5044-4249-a277-0e5aa31ed888@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.07.2024 15:08, Jason Andryuk wrote:
> On 2024-07-09 06:56, Jürgen Groß wrote:
>> On 09.07.24 09:01, Jan Beulich wrote:
>>> On 09.07.2024 08:36, Jürgen Groß wrote:
>>>> On 09.07.24 08:24, Jan Beulich wrote:
>>>>> On 08.07.2024 23:30, Jason Andryuk wrote:
>>>>>>    From the backtrace, it looks like the immediate case is just 
>>>>>> trying to
>>>>>> read a 4-byte version:
>>>>>>
>>>>>>    >>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
>>>>>>    >>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
>>>>>>    >>>> [   44.575550]  ucsi_register+0x24/0xa0
>>>>>>    >>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
>>>>>>
>>>>>> int ucsi_register(struct ucsi *ucsi)
>>>>>> {
>>>>>>            int ret;
>>>>>>
>>>>>>            ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
>>>>>>                                  sizeof(ucsi->version));
>>>>>>
>>>>>> ->read being ucsi_acpi_read()
>>>>>>
>>>>>> However, the driver also appears write to adjacent addresses.
>>>>>
>>>>> There are also corresponding write functions in the driver, yes, but
>>>>> ucsi_acpi_async_write() (used directly or indirectly) similarly calls
>>>>> ucsi_acpi_dsm(), which wires through to acpi_evaluate_dsm(). That's
>>>>> ACPI object evaluation, which isn't obvious without seeing the
>>>>> involved AML whether it might write said memory region.
>>>>
>>>> I guess an ACPI dump would help here?
>>>
>>> Perhaps, yes.
>>
>> It is available in the bug report:
>>
>> https://bugzilla.opensuse.org/show_bug.cgi?id=1227301
> 
> After acpixtract & iasl:
> 
> $ grep -ir FEEC *
> dsdt.dsl:   OperationRegion (ECMM, SystemMemory, 0xFEEC2000, 0x0100)
> ssdt16.dsl: OperationRegion (SUSC, SystemMemory, 0xFEEC2100, 0x30)

As I look to have only flawed variants of acpixtract to hand, any chance
you could supply me with dsdt.dsl and all ssdt*.dsl that you successfully
extracted / disassembled?

Thanks, Jan

> from the DSDT:
>      Scope (\_SB.PCI0.LPC0.EC0)
>      {
>          OperationRegion (ECMM, SystemMemory, 0xFEEC2000, 0x0100)
>          Field (ECMM, AnyAcc, Lock, Preserve)
>          {
>              TWBT,   2048
>          }
> 
>          Name (BTBF, Buffer (0x0100)
>          {
>               0x00                                             // .
>          })
>          Method (BTIF, 0, NotSerialized)
>          {
>              BTBF = TWBT /* \_SB_.PCI0.LPC0.EC0_.TWBT */
>              Return (BTBF) /* \_SB_.PCI0.LPC0.EC0_.BTBF */
>          }
>      }
> 
>  From SSDT16:
> DefinitionBlock ("", "SSDT", 2, "LENOVO", "UsbCTabl", 0x00000001)
> {
>      External (_SB_.PCI0.LPC0.EC0_, DeviceObj)
> 
>      Scope (\_SB)
>      {
>          OperationRegion (SUSC, SystemMemory, 0xFEEC2100, 0x30)
>          Field (SUSC, ByteAcc, Lock, Preserve)
>          {
> 
> 
> This embedded controller (?) seems to live at 0xfeec2xxx.
> 
> Regards,
> Jason


