Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7A0230700
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 11:51:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0MGP-00056I-M1; Tue, 28 Jul 2020 09:51:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YMeI=BH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1k0MGN-00056D-KN
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 09:51:11 +0000
X-Inumbo-ID: db5416b9-d0b7-11ea-a888-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id db5416b9-d0b7-11ea-a888-12813bfff9fa;
 Tue, 28 Jul 2020 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595929866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TDDW6Vmqlcc/jdTvWAQk+vQDf4pMTloVpXra5sEPZ1M=;
 b=hPrOqu9LO2+0e/SywpQQbnovURRCQFvL7juDF9xcWezL6B/g1NWlI1VboFCnkHI/q8hUJd
 DLt/yjDQ7q6IbYPsthlZNtAuy6dMrDg/dJDN5FIZ8WelHtVsf/KbWYsxTYAij6PoWMuaWk
 kICMnpqnAXY5gj7kk35eixS08/9mqfY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-DE6agHEcNVyQ8lpCCsZj1Q-1; Tue, 28 Jul 2020 05:51:04 -0400
X-MC-Unique: DE6agHEcNVyQ8lpCCsZj1Q-1
Received: by mail-wr1-f71.google.com with SMTP id d6so3544878wrv.23
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2020 02:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TDDW6Vmqlcc/jdTvWAQk+vQDf4pMTloVpXra5sEPZ1M=;
 b=KM+KDIaHWPTZRzmKG7Jm1QkgL9DpJrhsaqnhFxpUQaAC4HPNDmsMHiS34w97M4BpXX
 TJzdtqTlWrzXZljeIiFHRMrxmeEg668jeAagbI8v1APRdxTYZr566aR2z20xeB3XPRmQ
 Yc+VMjcRIOGNYQzt7bb0RJAlYSXw/OPt3JyZCtyqEOaHQLJ5cFyEgCNPCWkY9HudiKs2
 IGtLrdnVOt+2jq7PuaYDRBnDv8pkY8XzPpZ2qhkFbCDULZcVwGy/pqGj71Ai3w2La1KF
 B1My/gkIM+W0g+AQsUVoVWnWQ45Vv4R527ohX8FbdFYw1dPftxnEELfeGPQn+vmo9Y/D
 jaMA==
X-Gm-Message-State: AOAM533N3BcnOtC8jybcWc2+k0zAK0chY3Wsst7VFBJPAV09xjVmNk+d
 uf4uzN+fjrsOXNC5v3ijt5AK1+cCXxmKUG74S42IVZw3c0mhKeO8OwXnYMpz74xrvaAw5O6XmJy
 4+xjXM9rBIIKhhKJnnlvMbcnUcI8=
X-Received: by 2002:adf:de07:: with SMTP id b7mr26233016wrm.302.1595929863670; 
 Tue, 28 Jul 2020 02:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO4h2FddLw3k4T2cWIwjScSzLKkXiGx9EEQhnWLPDvoMFerDSIOHcrpY3xpuJiRQ5Sq0g6tg==
X-Received: by 2002:adf:de07:: with SMTP id b7mr26232994wrm.302.1595929863478; 
 Tue, 28 Jul 2020 02:51:03 -0700 (PDT)
Received: from [192.168.1.39] (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id h11sm17616910wrb.68.2020.07.28.02.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 02:51:02 -0700 (PDT)
Subject: Re: [PATCH] configure: define CONFIG_XEN when Xen is enabled
To: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200728091828.21702-1-paul@xen.org>
 <CAFEAcA_wKTFWk9Uk5HMabqfa6QkkTAdzBotmnrA_EH1BR4XjYg@mail.gmail.com>
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
Message-ID: <32ad0742-bff2-1fbc-2f7a-d078980eb171@redhat.com>
Date: Tue, 28 Jul 2020 11:51:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_wKTFWk9Uk5HMabqfa6QkkTAdzBotmnrA_EH1BR4XjYg@mail.gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <pdurrant@amazon.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 7/28/20 11:27 AM, Peter Maydell wrote:
> On Tue, 28 Jul 2020 at 10:19, Paul Durrant <paul@xen.org> wrote:
>>
>> From: Paul Durrant <pdurrant@amazon.com>
>>
>> The recent commit da278d58a092 "accel: Move Xen accelerator code under
>> accel/xen/" introduced a subtle semantic change, making xen_enabled() always
>> return false unless CONFIG_XEN is defined prior to inclusion of sysemu/xen.h,
>> which appears to be the normal case. This causes various use-cases of QEMU
>> with Xen to break.
>>
>> This patch makes sure that CONFIG_XEN is defined if --enable-xen is passed
>> to configure.
>>
>> Fixes: da278d58a092 ("accel: Move Xen accelerator code under accel/xen/")
>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>> ---
>> Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
>> Cc: Laurent Vivier <laurent@vivier.eu>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Anthony Perard <anthony.perard@citrix.com>
>> ---
>>  configure | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/configure b/configure
>> index 2acc4d1465..f1b9d129fd 100755
>> --- a/configure
>> +++ b/configure
>> @@ -7434,6 +7434,7 @@ if test "$virglrenderer" = "yes" ; then
>>    echo "VIRGL_LIBS=$virgl_libs" >> $config_host_mak
>>  fi
>>  if test "$xen" = "yes" ; then
>> +  echo "CONFIG_XEN=y" >> $config_host_mak
>>    echo "CONFIG_XEN_BACKEND=y" >> $config_host_mak
>>    echo "CONFIG_XEN_CTRL_INTERFACE_VERSION=$xen_ctrl_version" >> $config_host_mak
>>  fi
> 
> Configure already defines CONFIG_XEN as a target-specific
> config define in config-target.mak for the specific targets
> that Xen will work for (ie if you build --enable-xen for
> x86_64-softmmu and ppc64-softmmu then CONFIG_XEN is set for
> the former and not the latter). This patch makes it a
> build-wide config setting by putting it in config-host.mak.
> 
> We should figure out which of those two is correct and do
> just one of them, not do both at the same time.
> 
> Since CONFIG_HAX, CONFIG_KVM and other accelerator-type
> config defines are also per-target, I suspect that the
> correct fix for this bug is not in configure but elsewhere.

This might come from this change:

-#include "hw/xen/xen.h"
+#include "sysemu/xen.h"

Before Xen was target-specific, now it is a target-agnostic accelerator.

However in include/qemu/osdep.h we have:

 30 #include "config-host.h"
 31 #ifdef NEED_CPU_H
 32 #include "config-target.h"
 33 #else
 34 #include "exec/poison.h"
 35 #endif

CONFIG_XEN is generated in "config-target.h" (target-specific),
so target-agnostic code always has it undefined.

I'd rather uninline xen_enabled() but I'm not sure this has perf
penalties. Paolo is that OK to uninline it?

Phil.


