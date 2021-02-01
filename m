Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4F130A437
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 10:19:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79625.144983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6VMB-0004Ob-MY; Mon, 01 Feb 2021 09:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79625.144983; Mon, 01 Feb 2021 09:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6VMB-0004OC-J9; Mon, 01 Feb 2021 09:18:51 +0000
Received: by outflank-mailman (input) for mailman id 79625;
 Mon, 01 Feb 2021 09:18:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUbX=HD=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6VMA-0004O7-GT
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 09:18:50 +0000
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61ed6e5d-6894-4dc1-b083-adeca233c333;
 Mon, 01 Feb 2021 09:18:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id m2so11948467wmm.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 01:18:49 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id l1sm25560510wrp.40.2021.02.01.01.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 01:18:47 -0800 (PST)
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
X-Inumbo-ID: 61ed6e5d-6894-4dc1-b083-adeca233c333
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zwJvXpxzD86IAB50OcEa1h9dCfmRan0v54n4k0R9nDk=;
        b=knZRjue7XA5Kbq0aQZ+f07ZV+LMkatnkgFgqf4pIl5o+gF6rmJWc+DIIkwVkmTFWT+
         8xYuw6VaixRCi3wiMJeBsiPqMY1pbZU85mLtKu3Rv+s36GTJ/X+saX5IHZj6KJdMkl7Z
         8tdsLEG3T+fvN6P/0dz0DIWpXyuA7SelLR3Mf2ocBxE05OT8ro4VD7Ekm2BvSrK0hhf7
         4RZR+OWZR+d9XwWxybSx0ipb0sn3a90f7BW5d5EkjXHw6DXnQbC3Fuv6QFoxp3Jc1d2R
         w/7CB3j3sWZX9hMvovVcnBxG6Hv/ZRCl0gRpUOUh1knPdNT9yO6oaXtTgsIsANhTwPEJ
         OMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zwJvXpxzD86IAB50OcEa1h9dCfmRan0v54n4k0R9nDk=;
        b=UPuhzWbhASzm94dTXdUjbjhxiqHCjq+V7TRQX1r89bcmioUxSfZCAuClsSY1fPl+qL
         Ng65ePtFTwY1F11IWSt7RXhKWEq1KjgJP0Wv3XO5KkkJqDSuMtZbaFmOeocahuiPJOo+
         eENjk/2ZitBb4D1aSxswh6JJQVgDkHtkVFVLCH9M2I8dSJT1Yxm1dJ5+SCzZaB0T+UUe
         lm3RuYsFvgBciVNIoYeTvAzHd3dNf9Ta/ogoPel/sWhteIEL/IXPdTxOj5LxN8d7QqUf
         csyC8qRWvTdIoD8nSiZV3O2qxEksFfEQT4vMMxurHuOj7EefmBvClri0hgRSNopkgy5q
         MBRQ==
X-Gm-Message-State: AOAM531qa5SRBi9Wa9e5d5P5mGxX8tPWu2IQmTFEzZjYnUv86FJuwuEg
	iMcjrD7NvchEMDK1u9zTyRVsAlI5Jww=
X-Google-Smtp-Source: ABdhPJwXmLsSklCtG+dQ9zYlkzFgHSP0m68NDId7xXtpz/vVqTTQ8m6tLaZPeP9G1mutPM0o8rwOwA==
X-Received: by 2002:a1c:8181:: with SMTP id c123mr14636704wmd.23.1612171128109;
        Mon, 01 Feb 2021 01:18:48 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 4/4] hw/xen: Have Xen machines select 9pfs
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-5-f4bug@amsat.org>
 <565bf0dd-a5de-352e-eec7-68b862ed09e4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f6e1917a-f9cf-9ae3-50b1-9dc0ee4f65f3@amsat.org>
Date: Mon, 1 Feb 2021 10:18:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <565bf0dd-a5de-352e-eec7-68b862ed09e4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/1/21 9:34 AM, Paolo Bonzini wrote:
> On 31/01/21 15:18, Philippe Mathieu-Daudé wrote:
>> 9pfs is not an accelerator feature but a machine one,
>> move the selection on the machine Kconfig (in hw/).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   accel/Kconfig       | 1 -
>>   hw/i386/xen/Kconfig | 1 +
>>   hw/xen/Kconfig      | 1 +
>>   3 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/accel/Kconfig b/accel/Kconfig
>> index 461104c7715..b9e9a2d35b0 100644
>> --- a/accel/Kconfig
>> +++ b/accel/Kconfig
>> @@ -15,4 +15,3 @@ config KVM
>>     config XEN
>>       bool
>> -    select FSDEV_9P if VIRTFS
>> diff --git a/hw/i386/xen/Kconfig b/hw/i386/xen/Kconfig
>> index ad9d774b9ea..4affd842f28 100644
>> --- a/hw/i386/xen/Kconfig
>> +++ b/hw/i386/xen/Kconfig
>> @@ -3,3 +3,4 @@ config XEN_FV
>>       default y if XEN
>>       depends on XEN
>>       select I440FX
>> +    select FSDEV_9P if VIRTFS
>> diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
>> index 0b8427d6bd1..825277969fa 100644
>> --- a/hw/xen/Kconfig
>> +++ b/hw/xen/Kconfig
>> @@ -5,3 +5,4 @@ config XEN_PV
>>       select PCI
>>       select USB
>>       select IDE_PIIX
>> +    select FSDEV_9P if VIRTFS
>>
> 
> I think you can compile without FSDEV_9P selected?  If so, this should
> be "imply".
> 
> If on the other hand you cannot, and that is because of some other file
> brought in by CONFIG_XEN, this patch shouldn't be there.

FYI using 'imply FSDEV_9P' instead I get:

/usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function
`xen_be_register_common':
hw/xen/xen-legacy-backend.c:754: undefined reference to `xen_9pfs_ops'

The function is:

  void xen_be_register_common(void)
  {
      xen_set_dynamic_sysbus();

      xen_be_register("console", &xen_console_ops);
      xen_be_register("vkbd", &xen_kbdmouse_ops);
  #ifdef CONFIG_VIRTFS
      xen_be_register("9pfs", &xen_9pfs_ops);
  #endif
  #ifdef CONFIG_USB_LIBUSB
      xen_be_register("qusb", &xen_usb_ops);
  #endif
  }

The object is compiled using:

-- >8 --
-#ifdef CONFIG_VIRTFS
+#ifdef CONFIG_FSDEV_9P
     xen_be_register("9pfs", &xen_9pfs_ops);
 #endif
---

Respin planned.

Thanks,

Phil.

