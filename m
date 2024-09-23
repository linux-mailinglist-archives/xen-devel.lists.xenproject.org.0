Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E9097E66F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 09:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801676.1211644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssdN5-0000Sl-U7; Mon, 23 Sep 2024 07:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801676.1211644; Mon, 23 Sep 2024 07:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssdN5-0000Q3-Qm; Mon, 23 Sep 2024 07:20:35 +0000
Received: by outflank-mailman (input) for mailman id 801676;
 Mon, 23 Sep 2024 07:20:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssdN3-0000Pw-Md
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 07:20:33 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ff81e97-797c-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 09:20:29 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso51552605e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 00:20:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e7c72sm1166500366b.187.2024.09.23.00.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 00:20:28 -0700 (PDT)
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
X-Inumbo-ID: 4ff81e97-797c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727076029; x=1727680829; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XkAp67ZiWckX1M7hqEvrJLAFzF+di+yBMHHlnIgUql0=;
        b=LEPmxI2nZXZ4Ovq8WDmIMokHkBec8szv0yI85POcAM6Epx/GP6Ur78eW7qBVBElUnf
         aZNmybRhjJCoqbaIDDazbapQY0dvWjVx/HXSy3OvSgqlKIL2b3TzN3yNwasd/AclpDPe
         tkI7xK5XeZoTXd7eWaGJwUaJ17A58La2GtoYFvvRI31P3LMr46bB8YGGRNk/9oRMmU4O
         tYkovA90tpWhm13pGT7m1dZp4fPOT6bMaqWZDT+xpvLGmvE4t4wSg/f6TKurUBLZicfT
         z41XophZsfp+QZsVGrVc/GZoAvSHQtUzIDThxE7gocAXLvqXaJPo0IeUE2w7JzcotCKg
         hzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727076029; x=1727680829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkAp67ZiWckX1M7hqEvrJLAFzF+di+yBMHHlnIgUql0=;
        b=pzcHlJDRIeAFdO72B2UVO9Hy12P6ARKkW3iOzBZhTs9COfYrptC5RaQBSolzxWEDOA
         rwFR1J566c7iQAgisghksb/uj9CvNz8sh6fDPGfAdyatqERd+dqr2opaM07C4yE1GCIi
         kCwjPkfLtUb+ebwfq8wp/FZgkUIC2YbMJ6g8Fabidhokq3bqiurfMQUZEsHy4zBXBrLn
         i8A4DF3H8qBshACiWmw9i2tG+uffQNa76rRG6AYescbYMPxrBmK4lj4K33V8aM28q6Ry
         doGYH055FmzZsQ+gTvxW1QijMu3jDhO3qn4sxTeuNvJ8rzT87RU7LlRADov/A27mUtbN
         3/xg==
X-Forwarded-Encrypted: i=1; AJvYcCUSqZGhIOpfQQEzM9pd02xvoGSnNMGQRQzRB2CEDsczJrZ36XDVFhDQGHErtHFezMr6+75rHqlebW0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkjcNhFn/PwwvVQER8QqNVnz9T2XRVke6J0lbS9uOUIwF482YD
	wZGpPSTS4pxWzaUWpQl5Da/PyZ64pI9mMEommxqzI3Mak1xc7bmUGJGnrF3tsQ==
X-Google-Smtp-Source: AGHT+IFhB74llan0iph1dIbawiHZxRUa+o+9O1jFvLSdumZzlwj6yguCsXexC38sItLFirUjqd9NpA==
X-Received: by 2002:a05:6000:1543:b0:374:c7d2:4d76 with SMTP id ffacd0b85a97d-37a4238c3f4mr12115279f8f.50.1727076029151;
        Mon, 23 Sep 2024 00:20:29 -0700 (PDT)
Message-ID: <45d0c472-8e9a-4e07-9aa1-1b2990c41f75@suse.com>
Date: Mon, 23 Sep 2024 09:20:36 +0200
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
In-Reply-To: <4b3e6a39732bd674fcd4498cc5900f11b99044b3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.09.2024 17:51, oleksii.kurochko@gmail.com wrote:
> On Fri, 2024-09-13 at 19:45 +0200, Jan Beulich wrote:
>> On 13.09.2024 16:35, oleksii.kurochko@gmail.com wrote:
>>> On Thu, 2024-09-12 at 17:28 +0200, Jan Beulich wrote:
>>>> On 11.09.2024 12:04, Oleksii Kurochko wrote:
>>>>> --- a/xen/common/Makefile
>>>>> +++ b/xen/common/Makefile
>>>>> @@ -6,6 +6,7 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>>>>>  obj-$(CONFIG_CORE_PARKING) += core_parking.o
>>>>>  obj-y += cpu.o
>>>>>  obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>>>>> +obj-$(call or,$(CONFIG_HAS_DEVICE_TREE),$(CONFIG_HAS_ACPI)) +=
>>>>> device.o
>>>>
>>>> I can't spot any HAS_ACPI in the tree. And if this was switched
>>>> to
>>>> CONFIG_ACPI
>>>> I'd further ask why the file needs building on x86.
>>> Oh, there is no need for building this on x86. With what you
>>> suggested
>>> here ...
>>>
>>>>
>>>> Also I think I'd prefer to avoid the of the "or" macro here:
>>>>
>>>> obj-$(CONFIG_ACPI) += device.o
>>>> obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
>>> ... IIUC it will fix the issue with building this file for x86 as
>>> CONFIG_ACPI depends on (ARM_64 && ARM_EFI).
>>
>> Except that "depends on" is itself Arm-only, so won't affect x86.
>> Or else x86 would end up without ACPI support, which would mean
>> full breakage on about every system.
> There is another CONFIG_ACPI in xen/drivers/acpi which is equal to 'y'
> for x86 so it seems to me that it is needed another config (
> GENERIC_DEVICE_INIT ? ) which will be disabled for x86 by default so
> device.o won't be compiled for x86.
> 
> Have I overlooked something or better option exist? Probably it would
> be better to use "and" macro?

I'm afraid I don't understand your response. There are two seemingly
separate ACPI in distinct Kconfig files, yes. They combine when both are
visible to kconfig (as is the case for Arm64). Can you try to re-express
your question with this aspect in mind?

Jan

