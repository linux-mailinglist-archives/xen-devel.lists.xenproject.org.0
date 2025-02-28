Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C02AA49E3C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 17:04:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898939.1307392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to2qD-0000Za-7w; Fri, 28 Feb 2025 16:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898939.1307392; Fri, 28 Feb 2025 16:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to2qD-0000XY-3p; Fri, 28 Feb 2025 16:03:57 +0000
Received: by outflank-mailman (input) for mailman id 898939;
 Fri, 28 Feb 2025 16:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kAP=VT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1to2qB-0000XS-GF
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 16:03:55 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b37a7e7-f5ed-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 17:03:53 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e4b410e48bso3414178a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 08:03:53 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0db46esm306693966b.38.2025.02.28.08.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 08:03:51 -0800 (PST)
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
X-Inumbo-ID: 9b37a7e7-f5ed-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740758633; x=1741363433; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjcN+HOhk6SkaCoRmcTPcUWbdaYyYRbzHEHNDfXRqcE=;
        b=JdvLNegjxbEXl2GYeRUzkDT1eEJMAMafA0JQcfXjKhCGUdZgAtxw7BzQrvo96DqmvW
         sYJkIIce0CeY7jJMv29e0o4Za5rNg2GOYzmeu+dO+txbB04ublsJWx0XZAAFWun+GHP8
         sQxOjLA+RRkdByIqYXfUiQeUzHnFsVnBFlGBoLTp1Yynn2VdWcnVrKHwjatPN2Pwj8Bm
         /+pgnMnEhMzsqg4AH1Jhn5gp8h8Hw6HSHbjay2x1UjhSI5S6bDVC9H+KH0vTYoixIwv1
         3oyl+cmZpMc/x8mXXev6n/N3NhtMxqNSqD3JQyKwpYWdFr3Uf/itFUA4AalzlLg+r4ZR
         a8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740758633; x=1741363433;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HjcN+HOhk6SkaCoRmcTPcUWbdaYyYRbzHEHNDfXRqcE=;
        b=GkiPQKyZqjBhhRh0BRdOuDJQPpDB9Ad3TZuILZe2rFicO6W8MF1CF65+NSqYIANoq3
         imcvOnj+InHnir927LM0oG1fHS5qVaE0Wjqce1RXzkCfVtKyGYDRYfndv1Tfa+W/OLFf
         aqZ4vM7/ucpbhVvXGUVP7b35l6/Sg/mJWU+lHQngri+IH0fKHkTIE5naxgdS3ziREChK
         M8RMgN2UsOt2y1Ii+v9FN/0p+c/W9FRffvcay56mZezK8ifEDSp1LsbL/aNbh6IZRh4n
         TIj9y2LsFf9DgZtGaBvF1k71Q231Rzz6rbQ996W6tFjp9vRehglMHtO92CqHsMT35MZk
         S/iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVHXlFz6I5eOO+jBZWAHZ6Md95ePwOUqMNUM8Xrr32MTmcvK4bi3afy9ATk70etT5brEYQ6+d1ExA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJsL7HW7qH3DOnVaus8g4rbuE51Or2t8IXVFe0PhIjFXK5cArd
	jYKj1jCNOw9ZPpileEOwImsun6oKhc02A3+oqTR36KpXlqQjV8QR
X-Gm-Gg: ASbGncsLunUxDgT1qjEhnuUOPChS1IBR4z8CMsuyWbo566+PT31ZlR36jDfQNgpzqGB
	OrE/HNH6e5hn4MRgZNY7dMgCNqh5peIYau4hn+dCcKE86Ay7O69qbu+LiK9zucGZMbbgsP44RSq
	OTAy4vColU+Gv0ZTrCwr8s7vzEGsgJaOHcF/z+hA95BpPVu9Rfr9cQBSdyJbo/Tql+F8NrfVaHC
	pO2bFOECcS3dLp+maQqaQo0atIVzGa/xgJXxAR0GiRW6QIbQ8nzIwZyaSkjbybI8hk1qGCaQFpY
	97lalnNM/ztpQT660CW8+eTZnLPYt4tgPVQ=
X-Google-Smtp-Source: AGHT+IGr63WfeAiteZdrsNlDtYHruMX3os8Uluh/PcqCWdnMY4e+dBDSo730WAJwGKBeyIaZfWMCEg==
X-Received: by 2002:a17:907:6e8f:b0:aac:619:e914 with SMTP id a640c23a62f3a-abf2642b7eamr357075566b.16.1740758632035;
        Fri, 28 Feb 2025 08:03:52 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------dOkTnH2RF3z0MM8nSaLOQn03"
Message-ID: <1b71b063-1f1d-4cd0-be06-0ba3908027e6@gmail.com>
Date: Fri, 28 Feb 2025 17:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: copy_to_guest/copy_from_guest functionality.
To: Milan Djokic <milandjokic1995@gmail.com>, xen-devel@lists.xenproject.org
Cc: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Milan Djokic <Milan.Djokic@rt-rk.com>
References: <dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com>

This is a multi-part message in MIME format.
--------------dOkTnH2RF3z0MM8nSaLOQn03
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/28/25 3:59 PM, Milan Djokic wrote:
> From: Slavisa Petrovic<Slavisa.Petrovic@rt-rk.com>
>
> This patch implements copy_to_guest/copy_from_guest functions for RISC-V.
> These functions are designed to facilitate data exchange between guest and hypervisor.
>
> Signed-off-by: Milan Djokic<Milan.Djokic@rt-rk.com>
> Signed-off-by: Slavisa Petrovic<Slavisa.Petrovic@rt-rk.com>
> ---
> Tested on qemu with xcp-ng latest branchhttps://gitlab.com/xen-project/people/olkur/xen/-/merge_requests/6
> Full description on how to setup test environment can be found in attached PR link (Linux kernel patching to support copy_from_guest/copy_to_guest for RISC-V).
> Linux kernel patch shall be upstreamed after these changes are merged.
> ---
>   xen/arch/riscv/Makefile                   |  1 +
>   xen/arch/riscv/addr_translation.S         | 63 +++++++++++++++++++++++
>   xen/arch/riscv/arch.mk                    |  6 ++-
>   xen/arch/riscv/guestcopy.c                | 43 ++++++++++++++++
>   xen/arch/riscv/include/asm/guest_access.h |  5 ++
>   5 files changed, 117 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/riscv/addr_translation.S
>   create mode 100644 xen/arch/riscv/guestcopy.c
>
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index a5eb2aed4b..1bd61cc993 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -10,6 +10,7 @@ obj-y += smp.o
>   obj-y += stubs.o
>   obj-y += traps.o
>   obj-y += vm_event.o
> +obj-y += addr_translation.o

It should be sorted in alphabetical order.

>   
>   $(TARGET): $(TARGET)-syms
>   	$(OBJCOPY) -O binary -S $< $@
> diff --git a/xen/arch/riscv/addr_translation.S b/xen/arch/riscv/addr_translation.S
> new file mode 100644
> index 0000000000..7e94774b47
> --- /dev/null
> +++ b/xen/arch/riscv/addr_translation.S
> @@ -0,0 +1,63 @@
> +#include <asm/riscv_encoding.h>
> +#include <asm/asm.h>
> +
> +.macro add_extable lbl
> +.pushsection .extable, "a"     /* Start .extable section */
> +.balign      8                 /* Align to 8 bytes */
> +.quad        \lbl              /* Add label address to extable */
> +.popsection                    /* End section */
> +.endm
> +
> +.section .text
> +
> +/*
> + * size_t _copy_to(uint64_t dest, const void *src, size_t len)
> + *
> + * a0 - dest
> + * a1 - src
> + * a2 - len
> + *
> + */
> +
> +.global _copy_to
> +_copy_to:
> +    la    t0, copy_done             /* Load address of return label */
> +    mv    t2, zero                  /* Initialize counter to zero */
> +loop_check:
> +    beq   t2, a2, copy_done         /* Check if all bytes are copied */
> +    lb    t3, (a1)                  /* Load byte from source (guest address) */
> +store_byte:
> +    hsv.b t3, (a0)                  /* Store byte to destination (host address) */
> +    add_extable store_byte          /* Add exception table for this location */
> +    addi  a0, a0, 1                 /* Increment destination pointer */
> +    addi  a1, a1, 1                 /* Increment source pointer */
> +    addi  t2, t2, 1                 /* Increment byte counter */
> +    j     loop_check                /* Loop back if not done */
> +
> +/*
> + * size_t _copy_from(void *dest, uint64_t src, size_t len)
> + *
> + * a0 - dest
> + * a1 - src
> + * a2 - len
> + *
> + */
> +
> +.global _copy_from
> +_copy_from:
> +    la    t0, copy_done
> +    mv    t2, zero
> +loop_check_from:
> +    beq   t2, a2, copy_done
> +load_byte:
> +    hlv.b t3, (a1)                  /* Load byte from guest address */
> +    add_extable load_byte
> +    sb    t3, (a0)
> +    addi  a0, a0, 1
> +    addi  a1, a1, 1
> +    addi  t2, t2, 1
> +    j     loop_check_from
> +
> +copy_done:
> +    mv    a0, t2                    /* Return number of bytes copied */
> +    ret

Can't we done this functions fully in C? (it doesn't something mandatory)

> diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> index 17827c302c..f4098f5b5e 100644
> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -23,13 +23,17 @@ $(eval $(1) := \
>   	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
>   endef
>   
> +h-extension-name := $(call cc-ifversion,-lt,1301, hh, h)
> +$(h-extension-name)-insn := "hfence.gvma"
> +$(call check-extension,$(h-extension-name))
> +
>   zbb-insn := "andn t0$(comma)t0$(comma)t0"
>   $(call check-extension,zbb)
>   
>   zihintpause-insn := "pause"
>   $(call check-extension,zihintpause)
>   
> -extensions := $(zbb) $(zihintpause)
> +extensions := $(value $(h-extension-name)) $(zbb) $(zihintpause)
>   
>   extensions := $(subst $(space),,$(extensions))

This patch should take into account another one patch series (https://lore.kernel.org/xen-devel/cover.1740071755.git.oleksii.kurochko@gmail.com/T/#t)
update for which I am going to sent today.

Also, these changes would be better to move into separate commit with explanation why what is so specific with 1301 and why it is needed to introduce
'hh'.

I believe that these changes were taken based on my patch:https://gitlab.com/xen-project/people/olkur/xen/-/commit/154f75e943f1668dbf2c7be0f0fdff5b30132e89
Probably it will make sense just to get it and rebase on top of mentioned above patch series.

>   
> diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
> new file mode 100644
> index 0000000000..0325956845
> --- /dev/null
> +++ b/xen/arch/riscv/guestcopy.c
> @@ -0,0 +1,43 @@
> +#include <xen/bug.h>
> +#include <xen/domain_page.h>
> +#include <xen/errno.h>
> +#include <xen/sched.h>
> +
> +#include <asm/csr.h>
> +#include <asm/guest_access.h>
> +#include <asm/system.h>
> +#include <asm/traps.h>
> +
> +unsigned long copy_to(uint64_t dest, void* src, size_t len)
> +{
> +    size_t bytes;
> +
> +    bytes = _copy_to(dest, src, len);
> +
> +    if (bytes == len)
> +        return 0;
> +    else
> +        return -ENOSYS;
> +}

Why do we have a different prototypes with copy_from() below? If we will have
void *dest then ...

> +
> +unsigned long copy_from(void *dest, uint64_t src, size_t len)
> +{
> +    size_t bytes;
> +
> +    bytes = _copy_from(dest, src, len);
> +
> +    if (bytes == len)
> +        return 0;
> +    else
> +        return -ENOSYS;
> +}
> +
> +unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len)
> +{
> +    return copy_to((vaddr_t)to, (void *)from, len);

... we won't need cast for `to` and wo we really need cast for copy_to()? Why `const` is
dropped when passed to copy_to()?

~ Oleksii

> +}
> +
> +unsigned long raw_copy_from_guest(void *to, const void __user *from, unsigned len)
> +{
> +    return copy_from((void *)to, (vaddr_t)from, len);
> +}
> diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
> index 7cd51fbbde..4fcf3fbf68 100644
> --- a/xen/arch/riscv/include/asm/guest_access.h
> +++ b/xen/arch/riscv/include/asm/guest_access.h
> @@ -2,6 +2,11 @@
>   #ifndef ASM__RISCV__GUEST_ACCESS_H
>   #define ASM__RISCV__GUEST_ACCESS_H
>   
> +#include <xen/types.h>
> +
> +extern size_t _copy_to(uint64_t dest, const void *src, size_t len);
> +extern size_t _copy_from(void *dest, uint64_t src, size_t len);
> +
>   unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
>   unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
>   unsigned long raw_clear_guest(void *to, unsigned int len);
--------------dOkTnH2RF3z0MM8nSaLOQn03
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/28/25 3:59 PM, Milan Djokic wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com">
      <pre wrap="" class="moz-quote-pre">From: Slavisa Petrovic <a class="moz-txt-link-rfc2396E" href="mailto:Slavisa.Petrovic@rt-rk.com">&lt;Slavisa.Petrovic@rt-rk.com&gt;</a>

This patch implements copy_to_guest/copy_from_guest functions for RISC-V.
These functions are designed to facilitate data exchange between guest and hypervisor.

Signed-off-by: Milan Djokic <a class="moz-txt-link-rfc2396E" href="mailto:Milan.Djokic@rt-rk.com">&lt;Milan.Djokic@rt-rk.com&gt;</a>
Signed-off-by: Slavisa Petrovic <a class="moz-txt-link-rfc2396E" href="mailto:Slavisa.Petrovic@rt-rk.com">&lt;Slavisa.Petrovic@rt-rk.com&gt;</a>
---
Tested on qemu with xcp-ng latest branch <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/merge_requests/6">https://gitlab.com/xen-project/people/olkur/xen/-/merge_requests/6</a>
Full description on how to setup test environment can be found in attached PR link (Linux kernel patching to support copy_from_guest/copy_to_guest for RISC-V).
Linux kernel patch shall be upstreamed after these changes are merged.
---
 xen/arch/riscv/Makefile                   |  1 +
 xen/arch/riscv/addr_translation.S         | 63 +++++++++++++++++++++++
 xen/arch/riscv/arch.mk                    |  6 ++-
 xen/arch/riscv/guestcopy.c                | 43 ++++++++++++++++
 xen/arch/riscv/include/asm/guest_access.h |  5 ++
 5 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/addr_translation.S
 create mode 100644 xen/arch/riscv/guestcopy.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index a5eb2aed4b..1bd61cc993 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -10,6 +10,7 @@ obj-y += smp.o
 obj-y += stubs.o
 obj-y += traps.o
 obj-y += vm_event.o
+obj-y += addr_translation.o</pre>
    </blockquote>
    <pre>It should be sorted in alphabetical order.

</pre>
    <blockquote type="cite"
cite="mid:dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com">
      <pre wrap="" class="moz-quote-pre">
 
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $&lt; $@
diff --git a/xen/arch/riscv/addr_translation.S b/xen/arch/riscv/addr_translation.S
new file mode 100644
index 0000000000..7e94774b47
--- /dev/null
+++ b/xen/arch/riscv/addr_translation.S
@@ -0,0 +1,63 @@
+#include &lt;asm/riscv_encoding.h&gt;
+#include &lt;asm/asm.h&gt;
+
+.macro add_extable lbl
+.pushsection .extable, "a"     /* Start .extable section */
+.balign      8                 /* Align to 8 bytes */
+.quad        \lbl              /* Add label address to extable */
+.popsection                    /* End section */
+.endm
+
+.section .text
+
+/*
+ * size_t _copy_to(uint64_t dest, const void *src, size_t len)
+ *
+ * a0 - dest
+ * a1 - src
+ * a2 - len
+ *
+ */
+
+.global _copy_to
+_copy_to:
+    la    t0, copy_done             /* Load address of return label */
+    mv    t2, zero                  /* Initialize counter to zero */
+loop_check:
+    beq   t2, a2, copy_done         /* Check if all bytes are copied */
+    lb    t3, (a1)                  /* Load byte from source (guest address) */
+store_byte:
+    hsv.b t3, (a0)                  /* Store byte to destination (host address) */
+    add_extable store_byte          /* Add exception table for this location */
+    addi  a0, a0, 1                 /* Increment destination pointer */
+    addi  a1, a1, 1                 /* Increment source pointer */
+    addi  t2, t2, 1                 /* Increment byte counter */
+    j     loop_check                /* Loop back if not done */
+
+/*
+ * size_t _copy_from(void *dest, uint64_t src, size_t len)
+ *
+ * a0 - dest
+ * a1 - src
+ * a2 - len
+ *
+ */
+
+.global _copy_from
+_copy_from:
+    la    t0, copy_done
+    mv    t2, zero
+loop_check_from:
+    beq   t2, a2, copy_done
+load_byte:
+    hlv.b t3, (a1)                  /* Load byte from guest address */
+    add_extable load_byte
+    sb    t3, (a0)
+    addi  a0, a0, 1
+    addi  a1, a1, 1
+    addi  t2, t2, 1
+    j     loop_check_from
+
+copy_done:
+    mv    a0, t2                    /* Return number of bytes copied */
+    ret</pre>
    </blockquote>
    <pre>Can't we done this functions fully in C? (it doesn't something mandatory)

</pre>
    <blockquote type="cite"
cite="mid:dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com">
      <pre wrap="" class="moz-quote-pre">
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 17827c302c..f4098f5b5e 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -23,13 +23,17 @@ $(eval $(1) := \
 	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
 endef
 
+h-extension-name := $(call cc-ifversion,-lt,1301, hh, h)
+$(h-extension-name)-insn := "hfence.gvma"
+$(call check-extension,$(h-extension-name))
+
 zbb-insn := "andn t0$(comma)t0$(comma)t0"
 $(call check-extension,zbb)
 
 zihintpause-insn := "pause"
 $(call check-extension,zihintpause)
 
-extensions := $(zbb) $(zihintpause)
+extensions := $(value $(h-extension-name)) $(zbb) $(zihintpause)
 
 extensions := $(subst $(space),,$(extensions))</pre>
    </blockquote>
    <pre>This patch should take into account another one patch series ( <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1740071755.git.oleksii.kurochko@gmail.com/T/#t">https://lore.kernel.org/xen-devel/cover.1740071755.git.oleksii.kurochko@gmail.com/T/#t</a>)
update for which I am going to sent today.

Also, these changes would be better to move into separate commit with explanation why what is so specific with 1301 and why it is needed to introduce
'hh'.

I believe that these changes were taken based on my patch: <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/commit/154f75e943f1668dbf2c7be0f0fdff5b30132e89">https://gitlab.com/xen-project/people/olkur/xen/-/commit/154f75e943f1668dbf2c7be0f0fdff5b30132e89</a>
Probably it will make sense just to get it and rebase on top of mentioned above patch series.
</pre>
    <blockquote type="cite"
cite="mid:dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com">
      <pre wrap="" class="moz-quote-pre">
 
diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
new file mode 100644
index 0000000000..0325956845
--- /dev/null
+++ b/xen/arch/riscv/guestcopy.c
@@ -0,0 +1,43 @@
+#include &lt;xen/bug.h&gt;
+#include &lt;xen/domain_page.h&gt;
+#include &lt;xen/errno.h&gt;
+#include &lt;xen/sched.h&gt;
+
+#include &lt;asm/csr.h&gt;
+#include &lt;asm/guest_access.h&gt;
+#include &lt;asm/system.h&gt;
+#include &lt;asm/traps.h&gt;
+
+unsigned long copy_to(uint64_t dest, void* src, size_t len)
+{
+    size_t bytes;
+
+    bytes = _copy_to(dest, src, len);
+
+    if (bytes == len)
+        return 0;
+    else
+        return -ENOSYS;
+}</pre>
    </blockquote>
    <pre>Why do we have a different prototypes with copy_from() below? If we will have
void *dest then ...
</pre>
    <blockquote type="cite"
cite="mid:dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com">
      <pre wrap="" class="moz-quote-pre">
+
+unsigned long copy_from(void *dest, uint64_t src, size_t len)
+{
+    size_t bytes;
+
+    bytes = _copy_from(dest, src, len);
+
+    if (bytes == len)
+        return 0;
+    else
+        return -ENOSYS;
+}
+
+unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len)
+{
+    return copy_to((vaddr_t)to, (void *)from, len);</pre>
    </blockquote>
    <pre>... we won't need cast for `to` and wo we really need cast for copy_to()? Why `const` is
dropped when passed to copy_to()?

~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com">
      <pre wrap="" class="moz-quote-pre">
+}
+
+unsigned long raw_copy_from_guest(void *to, const void __user *from, unsigned len)
+{
+    return copy_from((void *)to, (vaddr_t)from, len);
+}
diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
index 7cd51fbbde..4fcf3fbf68 100644
--- a/xen/arch/riscv/include/asm/guest_access.h
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -2,6 +2,11 @@
 #ifndef ASM__RISCV__GUEST_ACCESS_H
 #define ASM__RISCV__GUEST_ACCESS_H
 
+#include &lt;xen/types.h&gt;
+
+extern size_t _copy_to(uint64_t dest, const void *src, size_t len);
+extern size_t _copy_from(void *dest, uint64_t src, size_t len);
+
 unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
 unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
 unsigned long raw_clear_guest(void *to, unsigned int len);
</pre>
    </blockquote>
  </body>
</html>

--------------dOkTnH2RF3z0MM8nSaLOQn03--

