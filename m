Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D229C8550
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 09:53:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836087.1251962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBVbi-0001X7-FH; Thu, 14 Nov 2024 08:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836087.1251962; Thu, 14 Nov 2024 08:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBVbi-0001Uw-C7; Thu, 14 Nov 2024 08:53:42 +0000
Received: by outflank-mailman (input) for mailman id 836087;
 Thu, 14 Nov 2024 08:53:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Deeb=SJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tBVbh-0001Um-Kt
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 08:53:41 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f05bf705-a265-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 09:53:38 +0100 (CET)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-718078c7f53so144502a34.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 00:53:38 -0800 (PST)
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
X-Inumbo-ID: f05bf705-a265-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC1vdDEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYwNWJmNzA1LWEyNjUtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTc0NDE4LjgyMTc5NCwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731574417; x=1732179217; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zXyvrAQAAMPEylwu5zr8e1VGZBnx70oFNdJ3TYfH98=;
        b=ZRb8UTPvJclDEYKg4RTwnIZT6BQQ8yBQZDUYugLWJz+hFDXSkljCCRc1FOGNRF2uHm
         hGEXjk6UmRcz20bZG5EJJUgUBnG2ztai3eWZDQCb91tJD25oLbdH6ZEOLuEEUgV3XwcD
         NbUR5omul01i/hxixbS+feUt7z3+rLZsDE6LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731574417; x=1732179217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zXyvrAQAAMPEylwu5zr8e1VGZBnx70oFNdJ3TYfH98=;
        b=DnxCfBC2qJf5RqwaBGRYN3SLqqqMWbeL58+ihEY5reL4VX8CxoQ136/r5cUS0xIkbb
         Gw25zu3lFXrdIR3BtfEBa7N+cnpT/Cx+oiCwDnSH9tos8R7LWjvwDmuz2dUgS8dT0Tdw
         M+dkFYU3ow78jJSjSpHYvZHbMqJ6xz/3BZL1UoMWaifAdVEgE+ha9+sJh/lVSqiSKbZj
         xMObVka7x8Wp6bi2O2djie8vICrhhoN8Kzr4F+zxsYGu2PCOPQoS1+rKsFvxu2hGBzEA
         VoAOd9FiXx6gXdy0l9QBbQrztOCYUeebMJIRnIwd1xLhacEnTqLTk8rTMIXpHtSQ7yRB
         smIA==
X-Gm-Message-State: AOJu0YwxA1H+yWxGf8zaylqMaNyv15ceL3YaZv991E/ut4IwacO89FTe
	n8L803cDhHis/b3fZgmG6Oun2ZiZrqeZxiL0YoZIeHcGtprFhABO59MOT7gTEnuOnPtkoBHiEam
	otvpV4hkE+Oq/ImXsKi87NdJ/rE3elYys82I7VQ==
X-Google-Smtp-Source: AGHT+IGz+4f4KCsDL0Zchbq6KKm8CMMkjUyObB7rY1NmLW4bZUlHR5PrCshlnlXboaZCHWsrr9THY+3Ea5+nrkZqRjM=
X-Received: by 2002:a05:6830:6f41:b0:717:fbfe:52bc with SMTP id
 46e09a7af769-71a6aeb3310mr1452003a34.12.1731574417408; Thu, 14 Nov 2024
 00:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20241113185118.1786703-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241113185118.1786703-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 14 Nov 2024 08:53:26 +0000
Message-ID: <CACHz=ZgnikqJwEiw95BWtdua6YrHgaMuUZqP-PMkhHPH3q6j4g@mail.gmail.com>
Subject: Re: [PATCH] xen/multiboot: Make headers be standalone
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 6:51=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> Both require xen/types.h.
>
> Change multiboot.h to include const.h by it's more normal path, and swap =
u32
> for uint32_t.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/include/xen/multiboot.h  | 68 +++++++++++++++++++-----------------
>  xen/include/xen/multiboot2.h |  3 ++
>  2 files changed, 38 insertions(+), 33 deletions(-)
>
> diff --git a/xen/include/xen/multiboot.h b/xen/include/xen/multiboot.h
> index 80a1761d9ee7..7ba86aab73d8 100644
> --- a/xen/include/xen/multiboot.h
> +++ b/xen/include/xen/multiboot.h
> @@ -17,7 +17,7 @@
>  #ifndef __MULTIBOOT_H__
>  #define __MULTIBOOT_H__
>
> -#include "const.h"
> +#include <xen/const.h>
>
>  /*
>   * Multiboot header structure.
> @@ -45,41 +45,43 @@
>
>  #ifndef __ASSEMBLY__
>
> +#include <xen/types.h>
> +
>  /* The symbol table for a.out.  */
>  struct aout_symbol_table {
> -    u32 tabsize;
> -    u32 strsize;
> -    u32 addr;
> -    u32 reserved;
> +    uint32_t tabsize;
> +    uint32_t strsize;
> +    uint32_t addr;
> +    uint32_t reserved;
>  };
>  typedef struct aout_symbol_table aout_symbol_table_t;
>
>  /* The section header table for ELF.  */
>  struct elf_section_header_table {
> -    u32 num;
> -    u32 size;
> -    u32 addr;
> -    u32 shndx;
> +    uint32_t num;
> +    uint32_t size;
> +    uint32_t addr;
> +    uint32_t shndx;
>  };
>  typedef struct elf_section_header_table elf_section_header_table_t;
>
>  /* The Multiboot information.  */
>  struct multiboot_info {
> -    u32 flags;
> +    uint32_t flags;
>
>      /* Valid if flags sets MBI_MEMLIMITS */
> -    u32 mem_lower;
> -    u32 mem_upper;
> +    uint32_t mem_lower;
> +    uint32_t mem_upper;
>
>      /* Valid if flags sets MBI_BOOTDEV */
> -    u32 boot_device;
> +    uint32_t boot_device;
>
>      /* Valid if flags sets MBI_CMDLINE */
> -    u32 cmdline;
> +    uint32_t cmdline;
>
>      /* Valid if flags sets MBI_MODULES */
> -    u32 mods_count;
> -    u32 mods_addr;
> +    uint32_t mods_count;
> +    uint32_t mods_addr;
>
>      /* Valid if flags sets ... */
>      union {
> @@ -88,42 +90,42 @@ struct multiboot_info {
>      } u;
>
>      /* Valid if flags sets MBI_MEMMAP */
> -    u32 mmap_length;
> -    u32 mmap_addr;
> +    uint32_t mmap_length;
> +    uint32_t mmap_addr;
>
>      /* Valid if flags sets MBI_DRIVES */
> -    u32 drives_length;
> -    u32 drives_addr;
> +    uint32_t drives_length;
> +    uint32_t drives_addr;
>
>      /* Valid if flags sets MBI_BIOSCONFIG */
> -    u32 config_table;
> +    uint32_t config_table;
>
>      /* Valid if flags sets MBI_LOADERNAME */
> -    u32 boot_loader_name;
> +    uint32_t boot_loader_name;
>
>      /* Valid if flags sets MBI_APM */
> -    u32 apm_table;
> +    uint32_t apm_table;
>  };
>  typedef struct multiboot_info multiboot_info_t;
>
>  /* The module structure.  */
>  struct module {
> -    u32 mod_start;
> -    u32 mod_end;
> -    u32 string;
> -    u32 reserved;
> +    uint32_t mod_start;
> +    uint32_t mod_end;
> +    uint32_t string;
> +    uint32_t reserved;
>  };
>  typedef struct module module_t;
>
>  /* The memory map. Be careful that the offset 0 is base_addr_low
>     but no size.  */
>  struct memory_map {
> -    u32 size;
> -    u32 base_addr_low;
> -    u32 base_addr_high;
> -    u32 length_low;
> -    u32 length_high;
> -    u32 type;
> +    uint32_t size;
> +    uint32_t base_addr_low;
> +    uint32_t base_addr_high;
> +    uint32_t length_low;
> +    uint32_t length_high;
> +    uint32_t type;
>  };
>  typedef struct memory_map memory_map_t;
>
> diff --git a/xen/include/xen/multiboot2.h b/xen/include/xen/multiboot2.h
> index 7cda620eec8a..f96f5d4c3169 100644
> --- a/xen/include/xen/multiboot2.h
> +++ b/xen/include/xen/multiboot2.h
> @@ -114,6 +114,9 @@
>  #define MULTIBOOT2_FRAMEBUFFER_TYPE_EGA_TEXT            2
>
>  #ifndef __ASSEMBLY__
> +
> +#include <xen/types.h>
> +
>  typedef struct {
>      uint32_t total_size;
>      uint32_t reserved;

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

