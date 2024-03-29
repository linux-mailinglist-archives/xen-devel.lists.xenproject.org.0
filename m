Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130DE8916B4
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 11:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699323.1092084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq9OM-0006aE-Hu; Fri, 29 Mar 2024 10:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699323.1092084; Fri, 29 Mar 2024 10:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq9OM-0006Yh-EJ; Fri, 29 Mar 2024 10:23:22 +0000
Received: by outflank-mailman (input) for mailman id 699323;
 Fri, 29 Mar 2024 10:23:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hz23=LD=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rq9OK-0006Yb-Fx
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 10:23:20 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cf6459a-edb6-11ee-afe3-a90da7624cb6;
 Fri, 29 Mar 2024 11:23:19 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56bc5a3aeb9so2326064a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Mar 2024 03:23:19 -0700 (PDT)
Received: from [192.168.69.100] (uni14-h01-176-184-39-242.dsl.sta.abo.bbox.fr.
 [176.184.39.242]) by smtp.gmail.com with ESMTPSA id
 eb16-20020a170907281000b00a4e0df9e793sm1755345ejc.136.2024.03.29.03.23.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Mar 2024 03:23:18 -0700 (PDT)
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
X-Inumbo-ID: 5cf6459a-edb6-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711707799; x=1712312599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QvRGWxIoYWPA4KC1nOtZccSOj22WfXQKUeWCwr9CcAM=;
        b=Hvu8QFtN0GVPpgh3tR6KZfIKfN4286SfwD8Y2TWzrY1bkB07rPqpvoOsnJj5hqE2I1
         wvZxTyLP7f1Tgc4TImOG3Ta+j6PYS1lsxxZDffDlGAMQj1lTJ+JIaWPYhXx29frG6vBB
         NfhY10oCX9xZRGRb0Wq7oB6CVEY8sogvsBPnvtu24fNhd4ULPmFkHwzgmlsgjnyNM0PJ
         z7d+ICQzNzO0NuSuqHSIX4suRdDGBIIYz/9kmCB2G/IY7MoBxfGEpUtlIKHwKHsxC4z5
         VvG4BMG1AQzidkL+uqa0KS4Y25ATSud6TD9orWMWkfYu9ZoJefUcKwERKByQT6Q0iPE5
         2pkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711707799; x=1712312599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QvRGWxIoYWPA4KC1nOtZccSOj22WfXQKUeWCwr9CcAM=;
        b=OBiTPD+cj5lxJQFv1whBHBxWaWnUF61wS64XbCFD0G9S2qwV7U/QF0nNAwGqpbqSNT
         /8i2j7yA8gwb8HttW4Si5AN9fAhC90Tcx5gIcaTYKbsnT7pT7Ri6eeI47W8MKbUjE1vi
         P0EL4lB3pxprJj0cG4909r8ao/Fi2yAsO0B8hGnq+brydNVwaKdRMqDku/ewwQXpTvEd
         nWCXfNzyFslnEc7EEnzJ4mSLVdzfMNrJOh/dDWxJi+2UTqZ2cESBIru4VEm1efBc+wAf
         NoJBnoF2o+C1IgQo6xfCM450LXYPt8vhZdJn3dKyuPntFKgJwGWyTZf9cRsBemnXN/Hk
         BKyg==
X-Forwarded-Encrypted: i=1; AJvYcCXvdJZCrhPS+KHtyaW8NGwokV7uvvp91wqjko4vHwTreaSV1taQ/cD4x37GfNfuMdUWGRYJOqirurYKoA4uT/V/Qg3zkMVY3+R5yqezm68=
X-Gm-Message-State: AOJu0YxxV6JX2DNLIN8toHvHmMIy+5lWBTc3DUD8AA5wgJm0KM/EmLN7
	ASnxDDI4czPGur70UHF5vyg48d5iNtTJeNkUvRbgzyUZQR7Fe4TU5UqbxAilr2E=
X-Google-Smtp-Source: AGHT+IEKykYMFB4yOfD5Bb+oTfKqzLhkwLQOT38cufTeCOj/ARkv/rLphGMkH+ejBZNcAvqU5uV/CA==
X-Received: by 2002:a17:906:6981:b0:a4e:2570:ff56 with SMTP id i1-20020a170906698100b00a4e2570ff56mr1237049ejr.0.1711707798986;
        Fri, 29 Mar 2024 03:23:18 -0700 (PDT)
Message-ID: <ba3a0226-4aae-4cbb-bf88-c45a5dbdbff7@linaro.org>
Date: Fri, 29 Mar 2024 11:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.1 09/29] hw/i386/pc: Pass PCMachineState
 argument to acpi_setup()
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bernhard Beschow <shentey@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Ani Sinha <anisinha@redhat.com>
References: <20240328155439.58719-1-philmd@linaro.org>
 <20240328155439.58719-10-philmd@linaro.org>
 <04b9fcde-31f1-dfa8-8c4e-a666d0d873d8@eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <04b9fcde-31f1-dfa8-8c4e-a666d0d873d8@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/3/24 19:45, BALATON Zoltan wrote:
> On Thu, 28 Mar 2024, Philippe Mathieu-Daudé wrote:
>> acpi_setup() caller knows about the machine state, so pass
>> it as argument to avoid a qdev_get_machine() call.
>>
>> We already resolved X86_MACHINE(pcms) as 'x86ms' so use the
>> latter.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/i386/acpi-build.h | 3 ++-
>> hw/i386/acpi-build.c | 5 ++---
>> hw/i386/pc.c         | 2 +-
>> 3 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
>> index 0dce155c8c..31de5bddbd 100644
>> --- a/hw/i386/acpi-build.h
>> +++ b/hw/i386/acpi-build.h
>> @@ -2,6 +2,7 @@
>> #ifndef HW_I386_ACPI_BUILD_H
>> #define HW_I386_ACPI_BUILD_H
>> #include "hw/acpi/acpi-defs.h"
>> +#include "hw/i386/pc.h"
>>
>> extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
>>
>> @@ -9,7 +10,7 @@ extern const struct AcpiGenericAddress 
>> x86_nvdimm_acpi_dsmio;
>> #define ACPI_PCIHP_SEJ_BASE 0x8
>> #define ACPI_PCIHP_BNMR_BASE 0x10
>>
>> -void acpi_setup(void);
>> +void acpi_setup(PCMachineState *pcms);
> 
> This is changed to PcPciMachineState * in a following patch so can't you 
> already introduce it here to avoid some churn?

Unfortunately not, because we'd need to use:

   PcPciMachineState *ppms = PC_PCI_MACHINE(pcms);

which would trigger an assertion at this point.

> 
> Regards,
> BALATON Zoltan


