Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE63192F908
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 12:36:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757859.1167000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSDd2-0002vR-3B; Fri, 12 Jul 2024 10:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757859.1167000; Fri, 12 Jul 2024 10:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSDd1-0002sQ-Vz; Fri, 12 Jul 2024 10:35:51 +0000
Received: by outflank-mailman (input) for mailman id 757859;
 Fri, 12 Jul 2024 10:35:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U2Du=OM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sSDd0-0002sK-N3
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 10:35:50 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 809ae62b-403a-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 12:35:48 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4266ea6a412so12877775e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 03:35:48 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2ba622sm19056845e9.33.2024.07.12.03.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 03:35:47 -0700 (PDT)
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
X-Inumbo-ID: 809ae62b-403a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720780548; x=1721385348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fp/VQOGRdKtZxKhrSp9PTcyDWPUKfnkwIFrsYwCJygk=;
        b=AqOYMTDFW5zkyI3sT9Fr6KAGF0bioH5gk6lzrLqWnAnzvn3+8yYn7lZMUtky41yQfb
         nJoZhXnBXdy/V7A41Xzh0tN3EmX4EGBkwzrmBTHES3zv9wbf4TOR2nWab6sU3vv5CMyf
         cg0SHZ2KPlhZEnJy9Jdcw6Cu+ifyiaNrEGHCA54sFnA1OXnYXo0i2WIaFwYB5tFeBKG8
         Bh/J4QAeS1KyTsrpeOM0s8kV6XsrgEg/zGeF8S6FhTErQ6JAgwZteBpZePytVIakqA8y
         rPMfp7zsYvj4o+/zLwxe7Wfa3JLTd7ZYSSfrz3w1X1ydP/1g27pGnJy/fnUXAV67tHws
         ieuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720780548; x=1721385348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fp/VQOGRdKtZxKhrSp9PTcyDWPUKfnkwIFrsYwCJygk=;
        b=sSmL21hz5Z4XaEF9b9FsQtBkNF2g1yMh+c+R3yITIcVolRyKsHmGC+nDnVhEEA0WAf
         ymG+KjJB3W+3BwS/jGHTAS9eXXKbA26AdCzRgF14b5+LnK9zWcUwMaCNZSsHnaDQdR81
         5bR0uWpusjnT1ShulOuMWj2fTJ4v4X9EmZ0siTyQKwyK4MmZvl7da5yCcTjrWY1BXAzD
         fzXbQz+CrZjnbUpXr2bwKt8GAtWxVaGGgGgMDivZO2LZNexPXbFLH7ohocNNad4qKSJb
         NcHD1bUN8AJGbgAwVbjfdvaQFRNbh5t8MWlhdmebtMS30Z9tefjc5VJOq4OmFgYzVz3i
         Qmpg==
X-Gm-Message-State: AOJu0Yz75qKTUabGxAXBBbUIFHkU29FGQ99bVKcYRYuvbGFngkcciHGq
	mLrCMU2rw80g//OJDSER1zk0gE4dv05jxQCAd41jW9750XW4t560yf2nOD+lvZg=
X-Google-Smtp-Source: AGHT+IF9QlHyjzahBATkQ7UJODUW5Tsqz8xrZNs5BJG/zFcEmrecoYH8vEaarBH1nEY6IOgmc9YLyQ==
X-Received: by 2002:a05:600c:4c19:b0:426:67dd:e9e9 with SMTP id 5b1f17b1804b1-426705d1571mr68714865e9.3.1720780547806;
        Fri, 12 Jul 2024 03:35:47 -0700 (PDT)
Message-ID: <a6144f89-449a-4d2f-927b-a9bbdfbed56b@suse.com>
Date: Fri, 12 Jul 2024 12:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems in PV dom0 on recent x86 hardware
To: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <3d6d35ea-5044-4249-a277-0e5aa31ed888@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.07.24 15:08, Jason Andryuk wrote:
> On 2024-07-09 06:56, Jürgen Groß wrote:
>> On 09.07.24 09:01, Jan Beulich wrote:
>>> On 09.07.2024 08:36, Jürgen Groß wrote:
>>>> On 09.07.24 08:24, Jan Beulich wrote:
>>>>> On 08.07.2024 23:30, Jason Andryuk wrote:
>>>>>>    From the backtrace, it looks like the immediate case is just trying to
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
> dsdt.dsl:   OperationRegion (ECMM, SystemMemory, 0xFEEC2000, 0x0100)
> ssdt16.dsl: OperationRegion (SUSC, SystemMemory, 0xFEEC2100, 0x30)
> 
> 
> from the DSDT:
>      Scope (\_SB.PCI0.LPC0.EC0)
>      {
>          OperationRegion (ECMM, SystemMemory, 0xFEEC2000, 0x0100)
>          Field (ECMM, AnyAcc, Lock, Preserve)
>          {
>              TWBT,   2048
>          }
> 
>          Name (BTBF, Buffer (0x0100)
>          {
>               0x00                                             // .
>          })
>          Method (BTIF, 0, NotSerialized)
>          {
>              BTBF = TWBT /* \_SB_.PCI0.LPC0.EC0_.TWBT */
>              Return (BTBF) /* \_SB_.PCI0.LPC0.EC0_.BTBF */
>          }
>      }
> 
>  From SSDT16:
> DefinitionBlock ("", "SSDT", 2, "LENOVO", "UsbCTabl", 0x00000001)
> {
>      External (_SB_.PCI0.LPC0.EC0_, DeviceObj)
> 
>      Scope (\_SB)
>      {
>          OperationRegion (SUSC, SystemMemory, 0xFEEC2100, 0x30)
>          Field (SUSC, ByteAcc, Lock, Preserve)
>          {
> 
> 
> This embedded controller (?) seems to live at 0xfeec2xxx.

What is the takeaway from that?

Is this a firmware bug (if yes, pointers to a specification saying that
this is an illegal configuration would be nice), or do we need a way to
map this page from dom0?


Juergen

