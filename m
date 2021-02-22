Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E2F321E6D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 18:46:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88312.165972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFHv-0007au-78; Mon, 22 Feb 2021 17:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88312.165972; Mon, 22 Feb 2021 17:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFHv-0007aV-3d; Mon, 22 Feb 2021 17:46:27 +0000
Received: by outflank-mailman (input) for mailman id 88312;
 Mon, 22 Feb 2021 17:46:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V+0I=HY=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lEFHt-0007aP-GI
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 17:46:25 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 63f9116a-6948-45f5-965d-1fbaf19a8a6a;
 Mon, 22 Feb 2021 17:46:24 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-W2kS_EfeOFe0_XbI0Xr19A-1; Mon, 22 Feb 2021 12:46:21 -0500
Received: by mail-ed1-f72.google.com with SMTP id ch30so3589727edb.14
 for <xen-devel@lists.xenproject.org>; Mon, 22 Feb 2021 09:46:19 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s2sm8446265edt.35.2021.02.22.09.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 09:46:18 -0800 (PST)
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
X-Inumbo-ID: 63f9116a-6948-45f5-965d-1fbaf19a8a6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614015984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3xauJaR66hfM3jitPOYh7RFO07zXJKYLcWPgDvmEWs=;
	b=abfOmxhQRXxloIPo1wlXbGWMGcPQ4MzBmK5SyQIwNnQ6BL1oYwj5pzD072tQTIRsg5TnSr
	cj9Yx69C4NWmzyGjbwjC6FKUFMUYd+vDSIZJwYZ9O3aFzLBtnJcNa7C86WK9tAf/pGOC8o
	w/b42ObNg6l6y0Fx+M70U4IQPqdn8m0=
X-MC-Unique: W2kS_EfeOFe0_XbI0Xr19A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a3xauJaR66hfM3jitPOYh7RFO07zXJKYLcWPgDvmEWs=;
        b=sAWDWygKiPRi+qRs6UbRDAzrBDOVq39vKZj6FErNQuFYmdYYQSgW5mtMuLdO9tJJ7z
         9tWV+Rj2ciunUPgLJIHsSoTLjy2GUJSwtJeviR1Ro8Yx4ZWXmEEKzjaGt6HBWhsyla2d
         H9oZmSnGIeEZeaJ2gzGM6p61QcfD0D+4f6aStzRFg39OpsR6MwSDYOQoWLrNRvr1OOHg
         JvJSc+qHA6TgpaUO6tZ9W+/+49ExrzTxiUV5hfgj+WNX5pZBwPXfL0urgzalCcAIxuH6
         cwuZysVW/Ffn9QgWlp5We8J+ViYMeT4vrXSEdd47h7Luaj+M3AKy2BGEQohXvvyfw/ek
         X6Zg==
X-Gm-Message-State: AOAM531q5fsb7I3ilsTIGYTQQCvEmffep0xX3l3cORx3iF5cyulsuSCC
	yA32U5q4BfvstufFJyd93A/zAGCdaEaJyvGWyNMhYIXmI2K/iep0kcqZ0SeazjKsKEhbVuX9Zan
	sAwbWD5o7br9E8grhTWV8xCNCmLU=
X-Received: by 2002:a05:6402:17b6:: with SMTP id j22mr23112097edy.325.1614015978954;
        Mon, 22 Feb 2021 09:46:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDAve+ys1o3Ix/SlRK4csT4W1S2Ma59p+Xf1UMouPtJ1ZRfjAz9b8cjfXQB2d67f6WzKBREw==
X-Received: by 2002:a05:6402:17b6:: with SMTP id j22mr23112063edy.325.1614015978791;
        Mon, 22 Feb 2021 09:46:18 -0800 (PST)
Subject: Re: [PATCH v2 02/11] hw/boards: Introduce
 machine_class_valid_for_accelerator()
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, xen-devel@lists.xenproject.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Leif Lindholm <leif@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Greg Kurz <groug@kaod.org>, Christian Borntraeger <borntraeger@de.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-3-philmd@redhat.com>
 <20210222183400.0c151d46.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6ceff55c-6da4-e773-7809-de3be2f566ab@redhat.com>
Date: Mon, 22 Feb 2021 18:46:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222183400.0c151d46.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/22/21 6:34 PM, Cornelia Huck wrote:
> On Fri, 19 Feb 2021 18:38:38 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> Introduce the valid_accelerators[] field to express the list
>> of valid accelators a machine can use, and add the
>> machine_class_valid_for_current_accelerator() and
>> machine_class_valid_for_accelerator() methods.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/hw/boards.h | 24 ++++++++++++++++++++++++
>>  hw/core/machine.c   | 26 ++++++++++++++++++++++++++
>>  2 files changed, 50 insertions(+)
>>
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 68d3d10f6b0..4d08bc12093 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -36,6 +36,24 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>                                 const CpuInstanceProperties *props,
>>                                 Error **errp);
>>  
>> +/**
>> + * machine_class_valid_for_accelerator:
>> + * @mc: the machine class
>> + * @acc_name: accelerator name
>> + *
>> + * Returns %true if the accelerator is valid for the machine, %false
>> + * otherwise. See #MachineClass.valid_accelerators.
> 
> Naming confusion: is the machine class valid for the accelerator, or
> the accelerator valid for the machine class? Or either? :)

"the accelerator valid for the machine class".

Is this clearer?

"Returns %true if the current accelerator is valid for the
 selected machine, %false otherwise.

Or...

"Returns %true if the selected accelerator is valid for the
 current machine, %false otherwise.

How would look "either"?

The machine is already selected, and the accelerator too...

> 
>> + */
>> +bool machine_class_valid_for_accelerator(MachineClass *mc, const char *acc_name);
>> +/**
>> + * machine_class_valid_for_current_accelerator:
>> + * @mc: the machine class
>> + *
>> + * Returns %true if the accelerator is valid for the current machine,
>> + * %false otherwise. See #MachineClass.valid_accelerators.
> 
> Same here: current accelerator vs. current machine.
> 
>> + */
>> +bool machine_class_valid_for_current_accelerator(MachineClass *mc);
>> +
>>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
>>  /*
>>   * Checks that backend isn't used, preps it for exclusive usage and
>> @@ -125,6 +143,11 @@ typedef struct {
>>   *    should instead use "unimplemented-device" for all memory ranges where
>>   *    the guest will attempt to probe for a device that QEMU doesn't
>>   *    implement and a stub device is required.
>> + * @valid_accelerators:
>> + *    If this machine supports a specific set of virtualization accelerators,
>> + *    this contains a NULL-terminated list of the accelerators that can be
>> + *    used. If this field is not set, any accelerator is valid. The QTest
>> + *    accelerator is always valid.
>>   * @kvm_type:
>>   *    Return the type of KVM corresponding to the kvm-type string option or
>>   *    computed based on other criteria such as the host kernel capabilities
>> @@ -166,6 +189,7 @@ struct MachineClass {
>>      const char *alias;
>>      const char *desc;
>>      const char *deprecation_reason;
>> +    const char *const *valid_accelerators;
>>  
>>      void (*init)(MachineState *state);
>>      void (*reset)(MachineState *state);
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 970046f4388..c42d8e382b1 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -518,6 +518,32 @@ static void machine_set_nvdimm_persistence(Object *obj, const char *value,
>>      nvdimms_state->persistence_string = g_strdup(value);
>>  }
>>  
>> +bool machine_class_valid_for_accelerator(MachineClass *mc, const char *acc_name)
>> +{
>> +    const char *const *name = mc->valid_accelerators;
>> +
>> +    if (!name) {
>> +        return true;
>> +    }
>> +    if (strcmp(acc_name, "qtest") == 0) {
>> +        return true;
>> +    }
>> +
>> +    for (unsigned i = 0; name[i]; i++) {
>> +        if (strcasecmp(acc_name, name[i]) == 0) {
>> +            return true;
>> +        }
>> +    }
>> +    return false;
>> +}
>> +
>> +bool machine_class_valid_for_current_accelerator(MachineClass *mc)
>> +{
>> +    AccelClass *ac = ACCEL_GET_CLASS(current_accel());
>> +
>> +    return machine_class_valid_for_accelerator(mc, ac->name);
>> +}
> 
> The implementation of the function tests for the current accelerator,
> so I think you need to tweak the description above?
> 
>> +
>>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
>>  {
>>      QAPI_LIST_PREPEND(mc->allowed_dynamic_sysbus_devices, g_strdup(type));
> 


