Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808BF1CA2B2
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 07:35:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWvez-0007fL-Py; Fri, 08 May 2020 05:34:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EkJI=6W=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jWvex-0007fG-Os
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 05:34:55 +0000
X-Inumbo-ID: a57e6b92-90ed-11ea-b07b-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a57e6b92-90ed-11ea-b07b-bc764e2007e4;
 Fri, 08 May 2020 05:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588916094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j9cIxYZ4M6GBlMag/rjs0c76h4zJpAwA0JgCL0kqyZo=;
 b=DnBg/zKtiJLM8rB2xAKVzSKB1Z8eFZ/EXEV836lEpDf3FaZP5WTQimxmS4KgG9f79dENrf
 LKgj/Ks00BFZxH3c8gbGXevG+KX++Q4k3DbfRTaCaExdLoU0wnJcjGzCz6rcYLkUeXBFiL
 0q7HhgQ/xyoqsk9HoBWYf9f9f2K3vtc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-FufhlvFyOYyQVXkNUc9kSg-1; Fri, 08 May 2020 01:34:52 -0400
X-MC-Unique: FufhlvFyOYyQVXkNUc9kSg-1
Received: by mail-wr1-f72.google.com with SMTP id e14so344350wrv.11
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2020 22:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gUS4ClGn6G8XqFXHNiGlmCwk06xms6ktvah597TE/uY=;
 b=XIyo1iMPAI5+ZiFbvEKWN4IOBeguv3XFYhyIz67ej4sCk2nq3gwm2tv3V7kHsYJcjT
 A6v1zoM/SXDWihppY1TYjXU+xzgwm8oKgWhTrYA5brURpOsOoFc3hdxuiwqARQyx0ulG
 Kd+OICwlE9d011wAWanZF81V+THP2AKWEt3SHdXeqyHrZiZthcBODAhSRSA4lOAcSbnA
 E8VWHQQxitWmtEpvpmZWUS9xi+F6rZtEOJKYA8T7GA9gHR6LTeJ8z5fagcMxl8rhJA8x
 wMD1cPGbus6CnL+kqjJ7WSjYIlunnE9T0lb/Jzti71/lKarTdpqLTajuw2VyHFk+ETdr
 GncA==
X-Gm-Message-State: AGi0PuYauyuoo3HIG5itEObCzj0XS54LihwaaL8M9l5Z64HIiOy8P2NZ
 L6EgQG/av0sB/tLm/ElHVd4ElGdceObl+SbE5Z2/himxg1AwE/yOP/D1+u7sw1zacAjK37mBNOK
 6fLSy0k1ajPGa4ZE5B+lgqieJfpM=
X-Received: by 2002:a1c:4e15:: with SMTP id g21mr13547747wmh.29.1588916091366; 
 Thu, 07 May 2020 22:34:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypI61Fm7WBN/SXhfhIYSOo0bFejh0pT6oDtMsWaGpFR+cCbdXjuMM/JbC85hgfYNOcJ8QGT+TQ==
X-Received: by 2002:a1c:4e15:: with SMTP id g21mr13547723wmh.29.1588916091120; 
 Thu, 07 May 2020 22:34:51 -0700 (PDT)
Received: from [192.168.1.39] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id a67sm12158464wmc.30.2020.05.07.22.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 22:34:50 -0700 (PDT)
Subject: Re: [PATCH] accel: Move Xen accelerator code under accel/xen/
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200507155813.16169-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d84e5541-da7a-4ead-6277-3b144744f58b@redhat.com>
Date: Fri, 8 May 2020 07:34:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200507155813.16169-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 5/7/20 5:58 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> This code is not related to hardware emulation.
> Move it under accel/ with the other hypervisors.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> We could also move the memory management functions from
> hw/i386/xen/xen-hvm.c but it is not trivial.
>=20
> Necessary step to remove "exec/ram_addr.h" in the next series.
> ---
>   include/exec/ram_addr.h                    |  2 +-
>   include/hw/xen/xen.h                       | 11 ------
>   include/sysemu/xen.h                       | 40 ++++++++++++++++++++++
>   hw/xen/xen-common.c =3D> accel/xen/xen-all.c |  3 ++
>   hw/acpi/piix4.c                            |  2 +-
>   hw/i386/pc.c                               |  1 +
>   hw/i386/pc_piix.c                          |  1 +
>   hw/i386/pc_q35.c                           |  1 +
>   hw/i386/xen/xen-hvm.c                      |  1 +
>   hw/i386/xen/xen_platform.c                 |  1 +
>   hw/isa/piix3.c                             |  1 +
>   hw/pci/msix.c                              |  1 +
>   migration/savevm.c                         |  2 +-
>   softmmu/vl.c                               |  2 +-
>   stubs/xen-hvm.c                            |  9 -----
>   target/i386/cpu.c                          |  2 +-
>   MAINTAINERS                                |  2 ++
>   accel/Makefile.objs                        |  1 +
>   accel/xen/Makefile.objs                    |  1 +
>   hw/xen/Makefile.objs                       |  2 +-
>   20 files changed, 60 insertions(+), 26 deletions(-)
>   create mode 100644 include/sysemu/xen.h
>   rename hw/xen/xen-common.c =3D> accel/xen/xen-all.c (99%)
>   create mode 100644 accel/xen/Makefile.objs
>=20
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 5e59a3d8d7..4e05292f91 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -21,7 +21,7 @@
>  =20
>   #ifndef CONFIG_USER_ONLY
>   #include "cpu.h"
> -#include "hw/xen/xen.h"
> +#include "sysemu/xen.h"
>   #include "sysemu/tcg.h"
>   #include "exec/ramlist.h"
>   #include "exec/ramblock.h"
> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> index 5ac1c6dc55..771dd447f2 100644
> --- a/include/hw/xen/xen.h
> +++ b/include/hw/xen/xen.h
> @@ -20,13 +20,6 @@ extern uint32_t xen_domid;
>   extern enum xen_mode xen_mode;
>   extern bool xen_domid_restrict;
>  =20
> -extern bool xen_allowed;
> -
> -static inline bool xen_enabled(void)
> -{
> -    return xen_allowed;
> -}
> -
>   int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
>   void xen_piix3_set_irq(void *opaque, int irq_num, int level);
>   void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, i=
nt len);
> @@ -39,10 +32,6 @@ void xenstore_store_pv_console_info(int i, struct Char=
dev *chr);
>  =20
>   void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory);
>  =20
> -void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
> -                   struct MemoryRegion *mr, Error **errp);
> -void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
> -
>   void xen_register_framebuffer(struct MemoryRegion *mr);
>  =20
>   #endif /* QEMU_HW_XEN_H */
> diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
> new file mode 100644
> index 0000000000..609d2d4184
> --- /dev/null
> +++ b/include/sysemu/xen.h
> @@ -0,0 +1,40 @@
> +/*
> + * QEMU Xen support
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef SYSEMU_XEN_H
> +#define SYSEMU_XEN_H
> +
> +#ifdef CONFIG_XEN
> +
> +extern bool xen_allowed;
> +
> +#define xen_enabled() (xen_allowed)
> +
> +#ifndef CONFIG_USER_ONLY
> +void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
> +void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
> +                   struct MemoryRegion *mr, Error **errp);
> +#endif
> +
> +#else /* !CONFIG_XEN */
> +
> +#define xen_enabled() 0
> +#ifndef CONFIG_USER_ONLY
> +static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t =
length)
> +{
> +    abort();
> +}
> +static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
> +                                 MemoryRegion *mr, Error **errp)
> +{
> +    abort();
> +}
> +#endif

Unfortunately this triggers:

#1  0x00007fca778a5895 abort (libc.so.6)
#2  0x000055f51ebd3e12 xen_hvm_modified_memory (qemu-system-aarch64)
#3  0x000055f51ebd44c9 cpu_physical_memory_set_dirty_range=20
(qemu-system-aarch64)
#4  0x000055f51ebd9de4 ram_block_add (qemu-system-aarch64)
#5  0x000055f51ebda2e3 qemu_ram_alloc_internal (qemu-system-aarch64)
#6  0x000055f51ebda3be qemu_ram_alloc (qemu-system-aarch64)
#7  0x000055f51ec3db9b memory_region_init_ram_shared_nomigrate=20
(qemu-system-aarch64)
#8  0x000055f51ef089e6 ram_backend_memory_alloc (qemu-system-aarch64)
#9  0x000055f51ef081ae host_memory_backend_memory_complete=20
(qemu-system-aarch64)
#10 0x000055f51f2b624b user_creatable_complete (qemu-system-aarch64)
#11 0x000055f51ed93382 create_default_memdev (qemu-system-aarch64)
#12 0x000055f51ed96d1a qemu_init (qemu-system-aarch64)
#13 0x000055f51f3b14bb main (qemu-system-aarch64)
#14 0x00007fca778a6f43 __libc_start_main (libc.so.6)
#15 0x000055f51ebd27de _start (qemu-system-aarch64)

I'll resend adding the following patch checking for xen_enabled() before=20
calling, as we do with other accelerators:

-- >8 --
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
@@ -330,7 +330,9 @@ static inline void=20
cpu_physical_memory_set_dirty_range(ram_addr_t start,
          }
      }

-    xen_hvm_modified_memory(start, length);
+    if (xen_enabled()) {
+        xen_hvm_modified_memory(start, length);
+    }
  }

  #if !defined(_WIN32)
@@ -388,7 +390,9 @@ static inline void=20
cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
              }
          }

-        xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        if (xen_enabled()) {
+            xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        }
      } else {
          uint8_t clients =3D tcg_enabled() ? DIRTY_CLIENTS_ALL :=20
DIRTY_CLIENTS_NOCODE;
---


