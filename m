Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A0A6AE7BA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 18:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507644.781421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZafw-0007KP-Lj; Tue, 07 Mar 2023 17:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507644.781421; Tue, 07 Mar 2023 17:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZafw-0007Hw-Ic; Tue, 07 Mar 2023 17:00:32 +0000
Received: by outflank-mailman (input) for mailman id 507644;
 Tue, 07 Mar 2023 17:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZafu-0007Ho-TK
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 17:00:30 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90be248c-bd09-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 18:00:30 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso10858649wmi.4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 09:00:30 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 o33-20020a05600c512100b003e209186c07sm20143602wms.19.2023.03.07.09.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 09:00:29 -0800 (PST)
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
X-Inumbo-ID: 90be248c-bd09-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678208429;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GUDIygacfCGVR8fGo1IJ3EdUPNHwyAGo+roo8APTsNk=;
        b=ph1sfvMxY+XZesLpU7cO7ml/bRJUJG2DNJ7+XYzCof2Z2t+1m3vq5apYJFeYV7Aice
         zfSv7AUvd+MEntffGDYCodsF89eozNPxKdE5O/3ShJU/Fzsb7Cjs7sRdVxhfNb/eT1rX
         mOK2EcUqV6oBobYdaqtKv7z1VtoVpokXETVoOQvlhI75I8/DLXAcGlNz3ZypvOcfAcNs
         PJ/wyx/Y7Agnp3QZHEUuD0wojqHtujpfhaWhd7tGgCc6wVWvWA/gHKTSTZ+5ErvcIVRK
         skFzghgn8xvfJaC9naklym9POMszOYVbhrQwjFxOaIy0GuO/NytKp+xJN76mz/pWdKkL
         i02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678208429;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUDIygacfCGVR8fGo1IJ3EdUPNHwyAGo+roo8APTsNk=;
        b=iyzoD4k55CZCR9qFw0aUdnNPUfdlzq0Ane5GcC9JqGqnBFSTXNIQ3c6MqRoemT99+m
         23qTmN+Q/C5y7qLyDiCK8CjhTT/pxcq8sTXOT7yrjk/TIcKrrsGkQRy0QCfTLKWaKiE+
         9HnVxjAuMco5vxPRfmlS2uVu7pa6pmYITBRkcrfMh6qalPf/znqu1umBxi0TRPwGTeiR
         r6DmM+ejOnOWx+TYZa5dydcWo6C14BqKhkp59zQ0q9nrS2av3ysqSU9X/x7hmzfGh9nJ
         GZtHmwml38TKDsMjUZjOCcy0x1rK/KJH5ET7BjCb4DqogPa9McUgPVDUQcnmp6JPPMjZ
         OCLw==
X-Gm-Message-State: AO0yUKUsPdpsvvw55GEV0u9B2Ca2HDvGdwT15wSQ6NBQMVwNc3EANC59
	5ocNRZpImrVROQixChqfa78=
X-Google-Smtp-Source: AK7set88xSK51uoh3VVvDUs/jOF+Gr5Ee1CiOxaq5zxqImeG9T02U2YrY4P93URvNhWTORPq7ylJaw==
X-Received: by 2002:a05:600c:4751:b0:3eb:578d:decb with SMTP id w17-20020a05600c475100b003eb578ddecbmr12283511wmo.28.1678208429602;
        Tue, 07 Mar 2023 09:00:29 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c97bd1cd-5540-bfb0-0fda-68d2cb6254d0@xen.org>
Date: Tue, 7 Mar 2023 17:00:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 07/25] hw/xen: Implement core serialize/deserialize
 methods for xenstore_impl
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-8-dwmw2@infradead.org>
 <5f03307a80c33b62380128bf3f638d47eca74357.camel@infradead.org>
 <e1e4f027-25bc-2e1c-4451-b4d304493f16@xen.org>
 <1ab939956031328a9a16fb4e76417e23f292e6ba.camel@infradead.org>
 <335a946a-6eae-00e6-b30f-142522cc4c26@xen.org>
Organization: Xen Project
In-Reply-To: <335a946a-6eae-00e6-b30f-142522cc4c26@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/03/2023 16:59, Paul Durrant wrote:
> On 07/03/2023 16:52, David Woodhouse wrote:
>> On Tue, 2023-03-07 at 16:39 +0000, Paul Durrant wrote:
>>> On 07/03/2023 16:33, David Woodhouse wrote:
>>>> On Thu, 2023-03-02 at 15:34 +0000, David Woodhouse wrote:
>>>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>>>
>>>>> In fact I think we want to only serialize the contents of the domain's
>>>>> path in /local/domain/${domid} and leave the rest to be recreated? 
>>>>> Will
>>>>> defer to Paul for that.
>>>>>
>>>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>>>
>>>> Paul, your Reviewed-by: on this one is conspicuous in its absence. I
>>>> mentioned migration in the cover letter — this much is working fine,
>>>> but it's the PV back ends that don't yet work.
>>>>
>>>> I'd quite like to merge the basic serialization/deserialization of
>>>> XenStore itself, with the unit tests.
>>>
>>> The patch is basically ok, I just think the serialization should be
>>> limited to the guest nodes... filtering out those not owned by xen_domid
>>> would probably work for that.
>>
>> Yeah, so let's just do this (as part of this patch #7) for now:
>>
>> --- a/hw/i386/kvm/xen_xenstore.c
>> +++ b/hw/i386/kvm/xen_xenstore.c
>> @@ -235,6 +235,7 @@ static int xen_xenstore_post_load(void *opaque, int
>> ver)
>>   static const VMStateDescription xen_xenstore_vmstate = {
>>       .name = "xen_xenstore",
>> +    .unmigratable = 1, /* The PV back ends don't migrate yet */
>>       .version_id = 1,
>>       .minimum_version_id = 1,
>>       .needed = xen_xenstore_is_needed,
>>
>>
>> It means we can't migrate guests even if they're only using fully
>> emulated devices... but I think that's a reasonable limitation until we
>> implement it fully.
>>
> 
> Ok. With that added...
> 
> Revieweed-by: Paul Durrant <paul@xen.org>

Typoed, sorry...

Reviewed-by: Paul Durrant <paul@xen.org>

> 


