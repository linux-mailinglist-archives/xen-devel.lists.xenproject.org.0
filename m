Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9307B9239B0
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 11:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752141.1160258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOZgS-0008Fo-EV; Tue, 02 Jul 2024 09:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752141.1160258; Tue, 02 Jul 2024 09:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOZgS-0008EG-BR; Tue, 02 Jul 2024 09:20:20 +0000
Received: by outflank-mailman (input) for mailman id 752141;
 Tue, 02 Jul 2024 09:20:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H732=OC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sOZgR-0008EA-I0
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 09:20:19 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c18bab8-3854-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 11:20:17 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-58b0beaf703so1107890a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 02:20:17 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58614d50464sm5374524a12.69.2024.07.02.02.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 02:20:17 -0700 (PDT)
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
X-Inumbo-ID: 4c18bab8-3854-11ef-958a-bbd156597b9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719912017; x=1720516817; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Am5AKU5CYVlzXMlBULleGZdt7dqJl3EdYaCR7jwAFu8=;
        b=Nk3Bln95iU6/o3QpAMpZDHl0Ik/7fORguYuWAVj8QX/lL4ZdadBjQtGvaOWpju2K86
         vceSWR7dyzcdEZcBUTeSne9LZJn+18liwSJBG1LBM79NMyx6qZFR6xktvXqGWcuPFp3k
         v2abIWD5rKkdmwo1ErobNHc5NmXUg6hNbiBEiwsfugSQcRZDckTEU+zCEi6+l9z7juhr
         r+da+ga7fQC2axmrH/4Kldk2L7Q1l03H655UwZYZhl3G1X5sWRuol5U8fiwah30PbCy1
         SyFPEn7s2h+mfCccO5GsiWMsGpt5mXHBWOVO6TZGrS7jujTGzNaWN8PDZw2ZovI0GyJZ
         OXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719912017; x=1720516817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Am5AKU5CYVlzXMlBULleGZdt7dqJl3EdYaCR7jwAFu8=;
        b=cLmFBHrFrsKvKcx5kz9OhlZnlIlIF7MqSd34hI6jkzDxB7vYUTYmqis2UTVHkdx8Bq
         5ipSAtgktunFewApEf0XG+wzeZuQ3usDiZjadyLimHpRsyYvfbZps9IFzLhOtgE37FPD
         ezAoaD3OI7dOHQiDr6qgEK2EvRuydQwje1sg6IKa0pByp0NC+/5U1dZsyEIV3CLW0nGL
         AwkCG4HVFGS7lSbmNDmWY5WUlNW3MHikIU4XuXnnK5I02zctxlpSmo3n5YrPjTx63/LE
         ICD+We9WgyD43F9qT4E7VYUrVVs+sbeOV25/KDmYcghboiushf5F9HRybvYA5sWBVg2B
         Tedw==
X-Gm-Message-State: AOJu0YzvI4aMm3nwbOJDora+7CmJzb9jpmM4GnTM4TAVLtWrWnDlLJeb
	YUE6fzud4zBHq0C7ojXNaQVDGPb6/NaGMIeQYXIy1CljWFePDmiXXVvnm7JXlcc=
X-Google-Smtp-Source: AGHT+IEoCb87+tFLwRVVwSSbEyVxUK6Qfov0xOk39+vIaDdYOByLb4JEhPWggGYmh2GtQFsbWQdvgw==
X-Received: by 2002:a05:6402:2786:b0:582:7e6d:6816 with SMTP id 4fb4d7f45d1cf-5879f0c6348mr5915930a12.8.1719912017377;
        Tue, 02 Jul 2024 02:20:17 -0700 (PDT)
Message-ID: <e31d626f-d806-41ad-bc5a-82eb5fe68ea1@suse.com>
Date: Tue, 2 Jul 2024 11:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240611-md-drivers-xen-v1-1-1eb677364ca6@quicinc.com>
 <2ecfd10e-c8f2-458c-bf07-e4472d22bcfe@quicinc.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <2ecfd10e-c8f2-458c-bf07-e4472d22bcfe@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.06.24 18:46, Jeff Johnson wrote:
> On 6/11/2024 4:54 PM, Jeff Johnson wrote:
>> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xen-pciback/xen-pciback.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xen-evtchn.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xen-privcmd.o
>>
>> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>> Corrections to these descriptions are welcomed. I'm not an expert in
>> this code so in most cases I've taken these descriptions directly from
>> code comments, Kconfig descriptions, or git logs.  History has shown
>> that in some cases these are originally wrong due to cut-n-paste
>> errors, and in other cases the drivers have evolved such that the
>> original information is no longer accurate.
>> ---
>>   drivers/xen/evtchn.c               | 1 +
>>   drivers/xen/privcmd-buf.c          | 1 +
>>   drivers/xen/privcmd.c              | 1 +
>>   drivers/xen/xen-pciback/pci_stub.c | 1 +
>>   4 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
>> index f6a2216c2c87..9b7fcc7dbb38 100644
>> --- a/drivers/xen/evtchn.c
>> +++ b/drivers/xen/evtchn.c
>> @@ -729,4 +729,5 @@ static void __exit evtchn_cleanup(void)
>>   module_init(evtchn_init);
>>   module_exit(evtchn_cleanup);
>>   
>> +MODULE_DESCRIPTION("Xen /dev/xen/evtchn device driver");
>>   MODULE_LICENSE("GPL");
>> diff --git a/drivers/xen/privcmd-buf.c b/drivers/xen/privcmd-buf.c
>> index 2fa10ca5be14..0f0dad427d7e 100644
>> --- a/drivers/xen/privcmd-buf.c
>> +++ b/drivers/xen/privcmd-buf.c
>> @@ -19,6 +19,7 @@
>>   
>>   #include "privcmd.h"
>>   
>> +MODULE_DESCRIPTION("Xen Mmap of hypercall buffers");
>>   MODULE_LICENSE("GPL");
>>   
>>   struct privcmd_buf_private {
>> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
>> index 67dfa4778864..b9b784633c01 100644
>> --- a/drivers/xen/privcmd.c
>> +++ b/drivers/xen/privcmd.c
>> @@ -48,6 +48,7 @@
>>   
>>   #include "privcmd.h"
>>   
>> +MODULE_DESCRIPTION("Xen hypercall passthrough driver");
>>   MODULE_LICENSE("GPL");
>>   
>>   #define PRIV_VMA_LOCKED ((void *)1)
>> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
>> index e34b623e4b41..4faebbb84999 100644
>> --- a/drivers/xen/xen-pciback/pci_stub.c
>> +++ b/drivers/xen/xen-pciback/pci_stub.c
>> @@ -1708,5 +1708,6 @@ static void __exit xen_pcibk_cleanup(void)
>>   module_init(xen_pcibk_init);
>>   module_exit(xen_pcibk_cleanup);
>>   
>> +MODULE_DESCRIPTION("Xen PCI-device stub driver");
>>   MODULE_LICENSE("Dual BSD/GPL");
>>   MODULE_ALIAS("xen-backend:pci");
>>
>> ---
>> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
>> change-id: 20240611-md-drivers-xen-522fc8e7ef08
>>
> 
> Following up to see if anything else is needed from me. Hoping to see this in
> linux-next so I can remove it from my tracking spreadsheet :)

I've pushed the patch to the xen/tip.git for-next branch.


Juergen

