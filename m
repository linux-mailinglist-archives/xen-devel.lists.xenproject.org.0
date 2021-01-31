Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B698309C85
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 15:05:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79284.144348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6DL9-00089N-Td; Sun, 31 Jan 2021 14:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79284.144348; Sun, 31 Jan 2021 14:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6DL9-00088y-QK; Sun, 31 Jan 2021 14:04:35 +0000
Received: by outflank-mailman (input) for mailman id 79284;
 Sun, 31 Jan 2021 14:04:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jslU=HC=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6DL8-00088t-LI
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 14:04:34 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 393df834-1457-481c-b5cf-3dd71da8d765;
 Sun, 31 Jan 2021 14:04:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s7so10737283wru.5
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 06:04:33 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id 9sm13768746wra.80.2021.01.31.06.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 06:04:31 -0800 (PST)
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
X-Inumbo-ID: 393df834-1457-481c-b5cf-3dd71da8d765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cJX72J3UvuKiu8Ak5/uZvAAJ3jzijZdbCsTVEmJPwmc=;
        b=OPDaQdcJ8UcTsiozKw+qoKX4BwChfhcngEiVLS0NRQcUmlWu6WnvSfSQmKRNsyK4jb
         pTvxU1kcrvxSlaE8cV5GdPCDAo7bOoe+1oAAgPo97OtQ6T5eI1/t2VxMEo+76k+v7Bkt
         eANX7FpSbCic/9DVZOncq5dqol3gQrlhDtghRKx5c4lV/QtBnDmt9WhhvYKj99704JvZ
         aXcBwmwdFetF8Ob6sdDEdUu84J6+u3ReYQAMnbuqGXX36X6rXUEbdcuhhRowsKbkQrsI
         akhYbk+G04YkF+YYz4S2EgdZu5qatfl0FvvfFyO86P9PijxuP+pPaDcarCvO3T+aiIQw
         P8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cJX72J3UvuKiu8Ak5/uZvAAJ3jzijZdbCsTVEmJPwmc=;
        b=FTdZ20j5QG4UAmr36xsNaFGYGbCcFwcyUbgXyjiVFBlouplzs0Tt3rO5jSf4LflJZ1
         jWLG/XjLJ6zIbjKm/9dSY9Q1V+wP0dD+D6VN5PQ0a7eH9pk1BwmRsHJwubvafEuese/5
         +XlHzNdhgueJkoZcGMbrEqRu2YR2BZfmzFq2Av6UDJGqNaGiZ5CIPpwNr0PirDUXix4T
         sbT30HcYtg/k//LD4BBI+o+m0253rAC5O0GynK6yk/X2RlSMNkmANvcoaLVHY2rxdoI9
         fduvCQr4LZsts0y/7qz69speVmbHRaBx+N9odbWC4BL4COVfohjWkLjzjAyhbT5RuPcA
         3IyA==
X-Gm-Message-State: AOAM530ThBcAc6hVmWzF65ckOVPmHXUboqN8Y5MwLHI+LkpJKRQZKn+M
	glVf1tFT/XFZFKbj4XbhlaI=
X-Google-Smtp-Source: ABdhPJxh3NHwQNS16/DxuqYzgsc99/H14QfN1Z7x2Fe/ZOiHOcS38/15IGemcneXbJ9eDWfs6+UVvw==
X-Received: by 2002:a05:6000:1565:: with SMTP id 5mr14038383wrz.109.1612101872430;
        Sun, 31 Jan 2021 06:04:32 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [RFC PATCH 1/4] hw/ide/Kconfig: IDE_ISA requires ISA_BUS
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>
References: <20210129194415.3925153-1-f4bug@amsat.org>
 <20210129194415.3925153-2-f4bug@amsat.org>
 <39ac2417-c4ee-49ca-0bc0-347981ec6fb3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f0653cf8-bf1a-48d4-7242-aaec4b31f6c5@amsat.org>
Date: Sun, 31 Jan 2021 15:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <39ac2417-c4ee-49ca-0bc0-347981ec6fb3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/29/21 8:59 PM, Paolo Bonzini wrote:
> On 29/01/21 20:44, Philippe Mathieu-Daudé wrote:
>> hw/ide/ioport.c has a strong dependency on hw/isa/isa-bus.c:
>>
>>    /usr/bin/ld: libcommon.fa.p/hw_ide_ioport.c.o: in function
>> `ide_init_ioport':
>>    /usr/bin/ld: hw/ide/ioport.c:61: undefined reference to
>> `isa_register_portio_list'
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/ide/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
>> index 5d9106b1ac2..41cdd9cbe03 100644
>> --- a/hw/ide/Kconfig
>> +++ b/hw/ide/Kconfig
>> @@ -12,7 +12,7 @@ config IDE_PCI
>>     config IDE_ISA
>>       bool
>> -    depends on ISA_BUS
>> +    select ISA_BUS
>>       select IDE_QDEV
>>     config IDE_PIIX
> 
> This is incorrect.  Buses are "depended on", not selected, and this is
> documented in docs/devel/kconfig.rst.

This is a kludge to deal with the current state of hw/i386/Kconfig.

I tried to clean it twice (mostly because unused things are pulled
in the MIPS targets), but I eventually gave up after accepting the
PC machines are Frankenstein ones built for virtualization, and I've
been told "if it ain't broke, don't fix it".

