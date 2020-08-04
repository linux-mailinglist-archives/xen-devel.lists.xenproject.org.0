Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7581323B6D5
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 10:35:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2sPK-0005r9-Or; Tue, 04 Aug 2020 08:34:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bOER=BO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1k2sPK-0005r4-0C
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 08:34:50 +0000
X-Inumbo-ID: 5b3f0d22-d62d-11ea-b01c-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5b3f0d22-d62d-11ea-b01c-12813bfff9fa;
 Tue, 04 Aug 2020 08:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596530088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qD/CeeZrbqIkgE83qE1EJDNBaCSUEFE64uJULaVnxnU=;
 b=OJAl3Y7jV6p0X6XOvu17rjqQvaNZ/Aou5oD1blX+8QOXMJqBHYkIQhozY0ILfkUyFZAVIF
 6sXP1mXe2EC6AlXqNSouIqidllDxWCDumF0Q0sPESxQp5p/dbw1Podac7YslbnRW5Qx/dx
 nniGrHX8/jVtPbmI9B4tmDskXWTi3no=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-SJuPsT4uOx6Kh8aahEsxAA-1; Tue, 04 Aug 2020 04:34:46 -0400
X-MC-Unique: SJuPsT4uOx6Kh8aahEsxAA-1
Received: by mail-ej1-f72.google.com with SMTP id lg2so10542758ejb.23
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 01:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qD/CeeZrbqIkgE83qE1EJDNBaCSUEFE64uJULaVnxnU=;
 b=C8tUC3pKsXWWmNekQe1VxKFwbKMNCEOALrCCWreMwa6Q0Q1y8iDiqa4sL5l75e856b
 BxINx2hyAzBiNyWrHQooFclmGROZqeSNl5nYwYgDUDdQJ1tQ93YVHWYrJ8fx6ReWqYh/
 XRe553YC+J5toxhq3y8PSgcNUOCIiRyi6gMEh/44jMWyxs6iivGA9eEjEqDsGdazzaqJ
 MrB78eLWdcPL154msEKTK6WaPCUhXY4d1bvAa/UID8w6q6Wfandr84DrHoiskrBMMRK+
 d6qaimlbCy44YXCVcjzj6Db2kq3IUt6KmApcROhtMmJu5Qy0LGBB3JMCPk7KmCcY7WM3
 Jn4Q==
X-Gm-Message-State: AOAM532WTijbXbJJDYt4eNkKeAJFkEzB2aiG2FMcvgb/SWOAHEB8wG9K
 CC2E47o3sIh+Ir/+x7LU15b0Er8kmQz+o0Xl6h+CP9syY4pJsLCgo9Vos34x7y3dtfFVDqTUfWL
 X/HbFBeNtvt6FWgL8wtDYaOVFI3U=
X-Received: by 2002:a05:6402:1a54:: with SMTP id
 bf20mr19573314edb.217.1596530085186; 
 Tue, 04 Aug 2020 01:34:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcPFG6nWYYGYKd1IYh4XRaBTvM1zmuSGq2bzNjsP1QuA5gXXRyHlNYGm5sTx/gM2BJ1aCXoA==
X-Received: by 2002:a05:6402:1a54:: with SMTP id
 bf20mr19573296edb.217.1596530084967; 
 Tue, 04 Aug 2020 01:34:44 -0700 (PDT)
Received: from [192.168.1.43] (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id dk28sm18329770edb.90.2020.08.04.01.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 01:34:44 -0700 (PDT)
Subject: Re: [PATCH-for-5.1 v2 1/1] accel/xen: Fix xen_enabled() behavior on
 target-agnostic objects
To: paul@xen.org, qemu-devel@nongnu.org
References: <20200804074930.13104-1-philmd@redhat.com>
 <20200804074930.13104-2-philmd@redhat.com>
 <001201d66a34$e82ec070$b88c4150$@xen.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <56c70b44-2d5f-44fc-5d9a-535c3c5fca71@redhat.com>
Date: Tue, 4 Aug 2020 10:34:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <001201d66a34$e82ec070$b88c4150$@xen.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Peter Maydell' <peter.maydell@linaro.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Paul Durrant' <pdurrant@amazon.com>, 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Anthony Perard' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 8/4/20 9:57 AM, Paul Durrant wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Sent: 04 August 2020 08:50
>> To: qemu-devel@nongnu.org
>> Cc: Peter Maydell <peter.maydell@linaro.org>; Anthony Perard <anthony.perard@citrix.com>; Paolo
>> Bonzini <pbonzini@redhat.com>; Stefano Stabellini <sstabellini@kernel.org>; xen-
>> devel@lists.xenproject.org; Paul Durrant <paul@xen.org>; Philippe Mathieu-Daudé <philmd@redhat.com>;
>> Paul Durrant <pdurrant@amazon.com>
>> Subject: [PATCH-for-5.1 v2 1/1] accel/xen: Fix xen_enabled() behavior on target-agnostic objects
>>
>> CONFIG_XEN is generated by configure and stored in "config-target.h",
>> which is (obviously) only include for target-specific objects.
>> This is a problem for target-agnostic objects as CONFIG_XEN is never
>> defined and xen_enabled() is always inlined as 'false'.
>>
>> Fix by following the KVM schema, defining CONFIG_XEN_IS_POSSIBLE
>> when we don't know to force the call of the non-inlined function,
>> returning the xen_allowed boolean.
>>
>> Fixes: da278d58a092 ("accel: Move Xen accelerator code under accel/xen/")
>> Reported-by: Paul Durrant <pdurrant@amazon.com>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/sysemu/xen.h   | 18 ++++++++++++++----
>>  accel/stubs/xen-stub.c |  2 ++
>>  accel/xen/xen-all.c    |  7 +------
>>  3 files changed, 17 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
>> index 1ca292715e..2c2c429ea8 100644
>> --- a/include/sysemu/xen.h
>> +++ b/include/sysemu/xen.h
>> @@ -8,9 +8,19 @@
>>  #ifndef SYSEMU_XEN_H
>>  #define SYSEMU_XEN_H
>>
>> -#ifdef CONFIG_XEN
>> +#ifdef NEED_CPU_H
>> +# ifdef CONFIG_XEN
>> +#  define CONFIG_XEN_IS_POSSIBLE
>> +# endif
>> +#else
>> +# define CONFIG_XEN_IS_POSSIBLE
>> +#endif
>>
>> -bool xen_enabled(void);
>> +#ifdef CONFIG_XEN_IS_POSSIBLE
>> +
>> +extern bool xen_allowed;
>> +
>> +#define xen_enabled()           (xen_allowed)
> 
> Can this not move ahead of the #ifdef now (since xen_allowed is present in both xen-stub and xen-all)? I think this is what Peter was saying in his option '(2)'.

I think I respected Peter's option '(2)', following how KVM does, this
is the case with stub,

> 
>   Paul
> 
>>
>>  #ifndef CONFIG_USER_ONLY
>>  void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
>> @@ -18,7 +28,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
>>                     struct MemoryRegion *mr, Error **errp);
>>  #endif
>>
>> -#else /* !CONFIG_XEN */
>> +#else /* !CONFIG_XEN_IS_POSSIBLE */
>>
>>  #define xen_enabled() 0

    ^^^ here is the other case,

>>  #ifndef CONFIG_USER_ONLY
>> @@ -33,6 +43,6 @@ static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
>>  }
>>  #endif
>>
>> -#endif /* CONFIG_XEN */
>> +#endif /* CONFIG_XEN_IS_POSSIBLE */
>>
>>  #endif
>> diff --git a/accel/stubs/xen-stub.c b/accel/stubs/xen-stub.c
>> index dcca4e678a..8ae658acff 100644
>> --- a/accel/stubs/xen-stub.c
>> +++ b/accel/stubs/xen-stub.c
>> @@ -9,6 +9,8 @@
>>  #include "hw/xen/xen.h"
>>  #include "qapi/qapi-commands-misc.h"
>>
>> +bool xen_allowed;

here is the stub,

>> +
>>  void xenstore_store_pv_console_info(int i, Chardev *chr)
>>  {
>>  }
>> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
>> index 0c24d4b191..60b971d0a8 100644
>> --- a/accel/xen/xen-all.c
>> +++ b/accel/xen/xen-all.c
>> @@ -32,12 +32,7 @@
>>      do { } while (0)
>>  #endif
>>
>> -static bool xen_allowed;
>> -
>> -bool xen_enabled(void)
>> -{
>> -    return xen_allowed;
>> -}
>> +bool xen_allowed;

here is the real variable.

>>
>>  xc_interface *xen_xc;
>>  xenforeignmemory_handle *xen_fmem;
>> --
>> 2.21.3
> 
> 


