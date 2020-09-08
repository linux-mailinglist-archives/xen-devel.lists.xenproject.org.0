Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDDB2612C5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 16:34:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFehJ-0005yg-21; Tue, 08 Sep 2020 14:34:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV5b=CR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kFehH-0005yb-1L
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 14:34:11 +0000
X-Inumbo-ID: 91f1c0ab-1f08-4bff-9fee-3dd8e5ebdcc1
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 91f1c0ab-1f08-4bff-9fee-3dd8e5ebdcc1;
 Tue, 08 Sep 2020 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599575648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iO88A+JSSW1s6Uv/2ZYrnBj0Eoi8puH9CuEdf/TY9b8=;
 b=buJH4HWV8nribUhhzCLCx5LVhbL1p1vurJS/NA/B3Fqi/UlIn41HZEagTffSdRtL7tkV+t
 sVLP3xFI9/CisGzovMpoNKY5zvEnBIClItm+xsfjdArVR3xUV4z13WfpQjJgPrB+K8bGo8
 VtfXahXNSjuZJyEVJEICSeVKzhVogcE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-ZAjX21ZyMB-bZ6IXLBtH8w-1; Tue, 08 Sep 2020 10:34:07 -0400
X-MC-Unique: ZAjX21ZyMB-bZ6IXLBtH8w-1
Received: by mail-wm1-f70.google.com with SMTP id g79so5819268wmg.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 07:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iO88A+JSSW1s6Uv/2ZYrnBj0Eoi8puH9CuEdf/TY9b8=;
 b=fCHH4w6ydS1i3PSXmn0yLMzpUGY3y999pWQ3Sw6WoL/5TBzXKYkHVxKmsbHlhgHGyg
 qXnhk4A5X6JNRyZb1xMiYjHQrbrWpU4srDqLWutM/PR+P6isJQKBxK3ExV5iY1wWYlDj
 /8A8CJryEOqqbEgu72S+PcexMcruUxkm4K5v8SwDrcuQpTpxPzFwiVcgrLjwa22gBEhm
 bQvdXb+nmTnG4RUmMs21ma1WKkzxjnnoe3zbKAssKTCJRFqeW1T0gnuTsAvVdZXNQ+Gd
 wZBul1fLXA8pPQadPHL664kYfcQrse5C3kkLyBA4vaNXjCx/fNWR7T1AgRbTJe0ysEuH
 Qlpg==
X-Gm-Message-State: AOAM532T3k6cV+Ysik7ZYn930Eb9s8+29Bu18JbCASoKVCpuZNPftsUu
 XNi/4oCvdiMFX0OP90y6/HHVKpNbCsoDqKMO9LYSo8MswpN685UXyF4m6dT6bELqHofn1prsBKl
 6DyPnVZhj3nKG1isR2D6ekt5Fpy8=
X-Received: by 2002:a1c:5641:: with SMTP id k62mr5053279wmb.13.1599575645178; 
 Tue, 08 Sep 2020 07:34:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgOQazp9i+mEl/fwg+6r3b/jhQKo4unGPP4zrO5e2G+NrYVky8R+6hOEU/XzaA5FvcssD/Rg==
X-Received: by 2002:a1c:5641:: with SMTP id k62mr5053258wmb.13.1599575644996; 
 Tue, 08 Sep 2020 07:34:04 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id t203sm34655314wmg.43.2020.09.08.07.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 07:34:04 -0700 (PDT)
Subject: Re: [PATCH 4/5] hw/xen: Split x86-specific declaration from generic
 hardware ones
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org
References: <20200908142559.192945-1-philmd@redhat.com>
 <20200908142559.192945-5-philmd@redhat.com>
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
Message-ID: <82346995-4084-606d-719a-68bb556ec80a@redhat.com>
Date: Tue, 8 Sep 2020 16:34:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908142559.192945-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 9/8/20 4:25 PM, Philippe Mathieu-Daudé wrote:
> xen_hvm_init() is restricted to the X86 architecture.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/xen/xen-x86.h | 15 +++++++++++++++
>  include/hw/xen/xen.h     |  2 --
>  hw/i386/pc_piix.c        |  2 +-
>  hw/i386/xen/xen-hvm.c    |  1 +
>  4 files changed, 17 insertions(+), 3 deletions(-)
>  create mode 100644 include/hw/xen/xen-x86.h
> 
> diff --git a/include/hw/xen/xen-x86.h b/include/hw/xen/xen-x86.h
> new file mode 100644
> index 00000000000..85e3db1b8de
> --- /dev/null
> +++ b/include/hw/xen/xen-x86.h
> @@ -0,0 +1,15 @@
> +/*
> + * Xen X86-specific
> + *
> + * Copyright 2020 Red Hat, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef QEMU_HW_XEN_X86_H
> +#define QEMU_HW_XEN_X86_H
> +
> +#include "hw/i386/pc.h"
> +
> +void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory);
> +
> +#endif /* QEMU_HW_XEN_X86_H */
> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> index b2b459964cb..1406648ca58 100644
> --- a/include/hw/xen/xen.h
> +++ b/include/hw/xen/xen.h
> @@ -30,8 +30,6 @@ qemu_irq *xen_interrupt_controller_init(void);
>  
>  void xenstore_store_pv_console_info(int i, struct Chardev *chr);
>  
> -void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory);
> -
>  void xen_register_framebuffer(struct MemoryRegion *mr);
>  
>  #endif /* QEMU_HW_XEN_H */
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 3e008bb0b1a..43205f48188 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -46,7 +46,7 @@
>  #include "hw/sysbus.h"
>  #include "sysemu/arch_init.h"
>  #include "hw/i2c/smbus_eeprom.h"
> -#include "hw/xen/xen.h"
> +#include "hw/xen/xen-x86.h"
>  #include "exec/memory.h"
>  #include "exec/address-spaces.h"
>  #include "hw/acpi/acpi.h"
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 49748cda3fb..e03c59e53da 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -22,6 +22,7 @@
>  #include "hw/xen/xen_common.h"
>  #include "hw/xen/xen-legacy-backend.h"
>  #include "hw/xen/xen-bus.h"
> +#include "hw/xen/xen-x86.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-misc.h"
>  #include "qemu/error-report.h"
> 

I forgot to commit this hunk:

---
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index d14efef49e9..2ea81909217 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -8,6 +8,7 @@

 #include "qemu/osdep.h"
 #include "hw/xen/xen.h"
+#include "hw/xen/xen-x86.h"

 void xenstore_store_pv_console_info(int i, Chardev *chr)
 {
---


