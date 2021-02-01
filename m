Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CC330A642
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 12:12:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79758.145240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6X7d-000134-CP; Mon, 01 Feb 2021 11:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79758.145240; Mon, 01 Feb 2021 11:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6X7d-00012d-8k; Mon, 01 Feb 2021 11:11:57 +0000
Received: by outflank-mailman (input) for mailman id 79758;
 Mon, 01 Feb 2021 11:11:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDK9=HD=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1l6X7b-00011S-Ls
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 11:11:55 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 29c569bc-7002-45c7-b23a-3f4aadd62203;
 Mon, 01 Feb 2021 11:11:54 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-mZlFu0BdM_CV-adiXS1Fuw-1; Mon, 01 Feb 2021 06:11:52 -0500
Received: by mail-wm1-f69.google.com with SMTP id s10so4410581wme.8
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 03:11:52 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w25sm21241436wmc.42.2021.02.01.03.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 03:11:50 -0800 (PST)
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
X-Inumbo-ID: 29c569bc-7002-45c7-b23a-3f4aadd62203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612177914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FY6TXrDOk+o3c9tXEy/tXPHIpJwXmfVgAUDZqtQralI=;
	b=eZJelNpXp1A+uUYQU8VCGEnHgqYV1BnWoa1dwtF67TqywH8zjEttX3VK9Wmg4DNEMj9ZlQ
	rdnIJqybHaNgxtAQ03pYgk1m8NL+ELlk+2xMgFYx3EUanTKQVQQh/QbW8ShbTuauhDjmHQ
	h4b9MDTi81meYA8n6ZZqYWn+LjEJcJg=
X-MC-Unique: mZlFu0BdM_CV-adiXS1Fuw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FY6TXrDOk+o3c9tXEy/tXPHIpJwXmfVgAUDZqtQralI=;
        b=JUfYQNrUWybZWQIhppyhIqq1O7ktIJfFdqw9mn99LFwaKlXmYqO4syJ8lVGiFRH/ut
         mZ171phlpaASKIihPjsYmosiG2kZE1N/JV3TPBwyAfiwrq0coUQ5UcCKWYs6oZvg7xao
         NfIIhnCUutWsnVAxwa+4MbQMH7ZRqwuWi9LtYLogC/2RYOGfVxrXcCQvyl1JzvrPRhlP
         H8LkUxA7dvlD8XOiYZoVP4Gte9HQgv6rmuHQeKBGKylSmiwY7OVshy0LIWXWiVrZApXF
         CeHiWsD8lIwnfLh9vsO5FRatSdYPHA0WkQD9I+/hyDpk62SwajHsoZi3aEUrjN0hQsd4
         2cOg==
X-Gm-Message-State: AOAM530176epNQqrd4g+H0XwNTx0066vMjFm7QUnM9PyZYHAL6XAgNyv
	UW13e/6PJRcAIsKEY336zWHh1GCfo9vxqYpcirbSWitIa2JQnApo9v0xyhx5NBLhQPbZy/h5W9v
	cFwyucDfUdqDeOSemiAdVbNO/dMs=
X-Received: by 2002:a05:6000:11c5:: with SMTP id i5mr17767753wrx.302.1612177911452;
        Mon, 01 Feb 2021 03:11:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSQMfyeFF+3atrjOWr///Dt99h3yMiGXmn5Z/I940huc+9DXK1zFUmdjSOWwmL+4h1fUpRQA==
X-Received: by 2002:a05:6000:11c5:: with SMTP id i5mr17767722wrx.302.1612177911186;
        Mon, 01 Feb 2021 03:11:51 -0800 (PST)
Subject: Re: [PATCH v2 3/4] hw/xen/Kconfig: Introduce XEN_PV config
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-4-f4bug@amsat.org>
 <d3ad42eb-42bd-2e63-4c99-8eed91216fc5@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2931aaa6-3850-ca59-73ea-252a524bd63d@redhat.com>
Date: Mon, 1 Feb 2021 12:11:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d3ad42eb-42bd-2e63-4c99-8eed91216fc5@amsat.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/02/21 11:59, Philippe Mathieu-Daudé wrote:
> On 1/31/21 3:18 PM, Philippe Mathieu-Daudé wrote:
>> xenpv machine requires USB, IDE_PIIX and PCI:
>>
>>    /usr/bin/ld:
>>    libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
>>    hw/xen/xen-legacy-backend.c:757: undefined reference to `xen_usb_ops'
>>    libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `unplug_disks':
>>    hw/i386/xen/xen_platform.c:153: undefined reference to `pci_piix3_xen_ide_unplug'
>>    libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `pci_unplug_nics':
>>    hw/i386/xen/xen_platform.c:137: undefined reference to `pci_for_each_device'
>>    libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `xen_platform_realize':
>>    hw/i386/xen/xen_platform.c:483: undefined reference to `pci_register_bar'
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/Kconfig     | 1 +
>>   hw/xen/Kconfig | 7 +++++++
>>   2 files changed, 8 insertions(+)
>>   create mode 100644 hw/xen/Kconfig
>>
>> diff --git a/hw/Kconfig b/hw/Kconfig
>> index 5ad3c6b5a4b..f2a95591d94 100644
>> --- a/hw/Kconfig
>> +++ b/hw/Kconfig
>> @@ -39,6 +39,7 @@ source usb/Kconfig
>>   source virtio/Kconfig
>>   source vfio/Kconfig
>>   source watchdog/Kconfig
>> +source xen/Kconfig
>>   
>>   # arch Kconfig
>>   source arm/Kconfig
>> diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
>> new file mode 100644
>> index 00000000000..0b8427d6bd1
>> --- /dev/null
>> +++ b/hw/xen/Kconfig
>> @@ -0,0 +1,7 @@
>> +config XEN_PV
>> +    bool
>> +    default y if XEN
>> +    depends on XEN
>> +    select PCI
>> +    select USB
>> +    select IDE_PIIX
> 
> Well this is not enough, --without-default-devices fails:
> 
> /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
> function `cpu_physical_memory_set_dirty_range':
> include/exec/ram_addr.h:333: undefined reference to
> `xen_hvm_modified_memory'
> /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
> function `ram_block_add':
> softmmu/physmem.c:1873: undefined reference to `xen_ram_alloc'
> /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
> function `cpu_physical_memory_set_dirty_range':
> include/exec/ram_addr.h:333: undefined reference to
> `xen_hvm_modified_memory'
> /usr/bin/ld: include/exec/ram_addr.h:333: undefined reference to
> `xen_hvm_modified_memory'
> /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_memory.c.o: in function
> `cpu_physical_memory_set_dirty_range':
> include/exec/ram_addr.h:333: undefined reference to
> `xen_hvm_modified_memory'
> collect2: error: ld returned 1 exit status
> ninja: build stopped: subcommand failed.

I think you can modify xen_hvm_modified_memory to become a virtual 
function in AccelClass.

Paolo


