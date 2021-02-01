Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FB330A616
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 12:04:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79751.145217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Wzt-0008PI-2V; Mon, 01 Feb 2021 11:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79751.145217; Mon, 01 Feb 2021 11:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Wzs-0008Ot-VN; Mon, 01 Feb 2021 11:03:56 +0000
Received: by outflank-mailman (input) for mailman id 79751;
 Mon, 01 Feb 2021 11:03:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUbX=HD=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6Wzr-0008Oo-Dg
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 11:03:55 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7eaa0002-a232-4e54-8c0f-93fafda32891;
 Mon, 01 Feb 2021 11:03:54 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id 6so16079553wri.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 03:03:54 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id y24sm20162170wmi.47.2021.02.01.03.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 03:03:52 -0800 (PST)
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
X-Inumbo-ID: 7eaa0002-a232-4e54-8c0f-93fafda32891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QXz33jfF5o0HFplOhpdqHclk9wrcsV6HW630elwNatQ=;
        b=uHaXw4TeOEO12kl+fnN0tUpC/LRsruyO4yk0HDjYL4Yv9dETsyq6wxTzk0WgoGZNj1
         CtiTU3CxtCl5kqqOpCGgCP91x76CwFj1xYR2CgeaTSgpMI4GCcaisRg3eQHEH5jRTc8J
         PrqVpIOzZWusI1BWVlvpAZ2t2OSlb632AsiI/rZM/XjY0N1XrACtobf8HH9iB/kf49Uf
         L8MCkTGa2waSCkbgEYybsg91FFiSdouJFNXmZ1ZgIu4JQRBNRTpaYmav5I6QczuPJzyQ
         txdg9t1drhSVcGzHsd5uy92C+zWleQvFXI/rCca5Oid+8jLWA2yOlWp2fJzTB2k/t9q5
         CpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QXz33jfF5o0HFplOhpdqHclk9wrcsV6HW630elwNatQ=;
        b=Ycq4J1Xgo8BAoS1N+F/mBxqO7A6pgE7sSbCLGsJEFfBagU0gx1HlRpISVAKJJm3qOQ
         mQzZtMSAxtAsUnnVY3quRG9ADBuSV8ZC0Y2XH+2ux5OQRRraxFf0nbptJ2bRGduM05rN
         Vtmu0qvOYfjWVaBNzRL86ufGoBCrgOBIXWPlrOniwDTB9335mN8p1Btd/ev4/uxB3j3g
         vOmbz9eASWjwS0xHUZoCQRuDUOOooLsxzbGUzEF8PsnImnkt0YgncHrvuCjWE+UY5Tp4
         TmnGFtGi/bcpjCDRrr2hOzQ/MR0Q3kqtrn6IUB9cruV2368+y0ZyOJQSjVTx+6fHs4Bx
         WRhw==
X-Gm-Message-State: AOAM5311rZU6zGMrJ/7JiSAOWbw6G6srXucEk0ubFY1TGQaNJQoxSoIp
	4Mj40wCnCKJv4Plw0dvAyIO/t3xaBfA=
X-Google-Smtp-Source: ABdhPJzITrIsCsiDN2VerxM6locxuBFFl/nz7JvgM8MlpL6o8XoP6uVy6xOEqzLJkVu4SwmLgPLOEA==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr2705174wrl.344.1612177433516;
        Mon, 01 Feb 2021 03:03:53 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 4/4] hw/xen: Have Xen machines select 9pfs
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-5-f4bug@amsat.org>
 <565bf0dd-a5de-352e-eec7-68b862ed09e4@redhat.com>
 <f6e1917a-f9cf-9ae3-50b1-9dc0ee4f65f3@amsat.org>
 <50306fbf-c6f0-e281-248f-de1bc984b113@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <83a785a5-6050-a24b-c796-d427c3873a07@amsat.org>
Date: Mon, 1 Feb 2021 12:03:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <50306fbf-c6f0-e281-248f-de1bc984b113@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/1/21 11:23 AM, Paolo Bonzini wrote:
> On 01/02/21 10:18, Philippe Mathieu-Daudé wrote:
>> FYI using 'imply FSDEV_9P' instead I get:
>>
>> /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function
>> `xen_be_register_common':
>> hw/xen/xen-legacy-backend.c:754: undefined reference to `xen_9pfs_ops'
> 
> Ok, so then we have the case of a file (hw/xen/xen-legacy-backend.c)
> brought in by CONFIG_XEN.  In that case this patch is incorrect...
> 
>> The function is:
>>
>>    void xen_be_register_common(void)
>>    {
>>        xen_set_dynamic_sysbus();
>>
>>        xen_be_register("console", &xen_console_ops);
>>        xen_be_register("vkbd", &xen_kbdmouse_ops);
>>    #ifdef CONFIG_VIRTFS
>>        xen_be_register("9pfs", &xen_9pfs_ops);
>>    #endif
>>    #ifdef CONFIG_USB_LIBUSB
>>        xen_be_register("qusb", &xen_usb_ops);
>>    #endif
>>    }
>>
>> The object is compiled using:
>>
>> -- >8 --
>> -#ifdef CONFIG_VIRTFS
>> +#ifdef CONFIG_FSDEV_9P
>>       xen_be_register("9pfs", &xen_9pfs_ops);
>>   #endif
>> ---
> 
> ... and this is the best fix, together with:
> 
> - a "#include CONFIG_DEVICES" at the top (to get CONFIG_FSDEV_9P)
> 
> - moving xen-legacy-backend.c from softmmu_ss to specific_ss (to get
> CONFIG_DEVICES)
> 
> - changing "select" to "imply" in accel/Kconfig (otherwise the patch has
> no effect)

OK.

> 
> But really, doing nothing and just dropping this patch is perfectly fine.

Yes, I'll respin what I have so far and continue when I find the
time and motivation another week-end.

