Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E0C97E821
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 11:06:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801743.1211733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssf1I-0000W4-BU; Mon, 23 Sep 2024 09:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801743.1211733; Mon, 23 Sep 2024 09:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssf1I-0000Td-8y; Mon, 23 Sep 2024 09:06:12 +0000
Received: by outflank-mailman (input) for mailman id 801743;
 Mon, 23 Sep 2024 09:06:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssf1G-0000TX-Qb
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 09:06:10 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10d10960-798b-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 11:06:06 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8a7cdfdd80so587188366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 02:06:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610967b0sm1176443566b.42.2024.09.23.02.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 02:06:04 -0700 (PDT)
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
X-Inumbo-ID: 10d10960-798b-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727082366; x=1727687166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DuGN3xEHQvV1v7OTWvmiC6+o4NGaCkN/N1nrtqU0Ct4=;
        b=AtoiLFTE+4taSoHu/r6BI5OWOvXa0i6BssOpSUdhSqUWlXKE1KmyuWsKn/ilOjbT6t
         CQlf6+tNpJfuF4linOd8bVug6VO0/OYuHTYlaMFKWXzJGE2yuzkkkgJYbwGlN6+aeDK+
         hqVTzVNCtRFZSqpoJjKGnZyuElTmQ8fA0rmbJ0JLuaeJBhqz3yA1ZBe5IMgiOjypvvOo
         QfMkR75GyvmJsdxj/kUeqIEYexQl33pyf8JpjHIAS+TTi/xLDX5DG2ztWhSjjvsSauAW
         xdQH836WigfCcQdTL5B87idI9CPwB1cF9J2y6Vfz4JLi5Drt2tY0IQku/P6FsxcZFTbE
         c1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082366; x=1727687166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuGN3xEHQvV1v7OTWvmiC6+o4NGaCkN/N1nrtqU0Ct4=;
        b=XJprgle9Ge/GZ0EMMLRAVANsYgaM338tUp28fLDvcqGOo4FTFEQuV+ws2HyGzCXj/Z
         ao13/4OWA30ruDuG6iXkzzUc14Yq2yd1P91176pxhs+8m2Uo5V8poG2ngRJbO10g0YLr
         q6KuIP+72h3jQOelNFHEEaMv7urL+MFznEaO43sniTwv21alOOl9rmrUYie3yCuFxafX
         0mEHis8Z5r4sr1jEP3EustKuhrJiQdgratjX8W09hHZhZajPJe9KIkalIkyBFTTMBFYj
         WCQshaPXeB+VAlsKv5CoWwrFf8c94errL7ZhHgtXvGJacOMW0xGIAg2LxXiGDQEbIbk7
         BCGg==
X-Forwarded-Encrypted: i=1; AJvYcCVW61V1CgJvRnwhxDAOHerPsePKTINr+LguQFoH82bWqeB8miavqciohoPuenGQgWyCYO8c4f3AWEw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxtv/T+gQdl1jo5O+QT8uxTgIFhrOP80LseC/6ofTwxJoTq9SlN
	ympXN+jR8O8qgCe+/U0iIhKVVv6iM3p3AoWtSg+xT5SMnulX5F0Crc/LWKvflA==
X-Google-Smtp-Source: AGHT+IHUwqHthUFiA8MyFYtUCHqMgDCkY1pe5dAdhQhk7FodbIvOfD03b0LAHZfQ8V1KrbXpPHU2VQ==
X-Received: by 2002:a17:907:e24a:b0:a8d:2c3e:7ece with SMTP id a640c23a62f3a-a90d5033dcemr1207736166b.31.1727082365355;
        Mon, 23 Sep 2024 02:06:05 -0700 (PDT)
Message-ID: <5bef20db-7a26-4478-8d66-1392fac0d665@suse.com>
Date: Mon, 23 Sep 2024 11:06:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/common: move device initialization code to
 common code
To: oleksii.kurochko@gmail.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1726048521.git.oleksii.kurochko@gmail.com>
 <128d17f3625807a26875b7a419fb56610424b18c.1726048521.git.oleksii.kurochko@gmail.com>
 <9764051a-c4a7-4c3d-9760-1f80d5faa559@suse.com>
 <f3a16db18f98a4fff3a4b59f144d4a2fee815465.camel@gmail.com>
 <f324c131-9446-4444-b5f7-65d851b2be3b@suse.com>
 <4b3e6a39732bd674fcd4498cc5900f11b99044b3.camel@gmail.com>
 <45d0c472-8e9a-4e07-9aa1-1b2990c41f75@suse.com>
 <0c236a05ca8525d3277f14a8520cebbfa4b34a4d.camel@gmail.com>
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
In-Reply-To: <0c236a05ca8525d3277f14a8520cebbfa4b34a4d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.09.2024 10:51, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-09-23 at 09:20 +0200, Jan Beulich wrote:
>> On 16.09.2024 17:51, oleksii.kurochko@gmail.com wrote:
>>> On Fri, 2024-09-13 at 19:45 +0200, Jan Beulich wrote:
>>>> On 13.09.2024 16:35, oleksii.kurochko@gmail.com wrote:
>>>>> On Thu, 2024-09-12 at 17:28 +0200, Jan Beulich wrote:
>>>>>> On 11.09.2024 12:04, Oleksii Kurochko wrote:
>>>>>>> --- a/xen/common/Makefile
>>>>>>> +++ b/xen/common/Makefile
>>>>>>> @@ -6,6 +6,7 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>>>>>>>  obj-$(CONFIG_CORE_PARKING) += core_parking.o
>>>>>>>  obj-y += cpu.o
>>>>>>>  obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>>>>>>> +obj-$(call
>>>>>>> or,$(CONFIG_HAS_DEVICE_TREE),$(CONFIG_HAS_ACPI)) +=
>>>>>>> device.o
>>>>>>
>>>>>> I can't spot any HAS_ACPI in the tree. And if this was
>>>>>> switched
>>>>>> to
>>>>>> CONFIG_ACPI
>>>>>> I'd further ask why the file needs building on x86.
>>>>> Oh, there is no need for building this on x86. With what you
>>>>> suggested
>>>>> here ...
>>>>>
>>>>>>
>>>>>> Also I think I'd prefer to avoid the of the "or" macro here:
>>>>>>
>>>>>> obj-$(CONFIG_ACPI) += device.o
>>>>>> obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
>>>>> ... IIUC it will fix the issue with building this file for x86
>>>>> as
>>>>> CONFIG_ACPI depends on (ARM_64 && ARM_EFI).
>>>>
>>>> Except that "depends on" is itself Arm-only, so won't affect x86.
>>>> Or else x86 would end up without ACPI support, which would mean
>>>> full breakage on about every system.
>>> There is another CONFIG_ACPI in xen/drivers/acpi which is equal to
>>> 'y'
>>> for x86 so it seems to me that it is needed another config (
>>> GENERIC_DEVICE_INIT ? ) which will be disabled for x86 by default
>>> so
>>> device.o won't be compiled for x86.
>>>
>>> Have I overlooked something or better option exist? Probably it
>>> would
>>> be better to use "and" macro?
>>
>> I'm afraid I don't understand your response. There are two seemingly
>> separate ACPI in distinct Kconfig files, yes. They combine when both
>> are
>> visible to kconfig (as is the case for Arm64). Can you try to re-
>> express
>> your question with this aspect in mind?
> 
> I wanted to say that we can't simply rely on CONFIG_ACPI and
> CONFIG_HAS_DEVICE_TREE to determine if device.o should be compiled
> because, in the case of x86, CONFIG_ACPI=y, device.o will be compiled
> and result in compilation errors.

Ah, I see. Of course. Ideally to be addressed without introducing yet
another (new) Kconfig setting.

Jan

