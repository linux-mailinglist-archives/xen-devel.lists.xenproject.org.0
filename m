Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B37C1874EAC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:13:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689850.1075216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCcd-0003IX-5Y; Thu, 07 Mar 2024 12:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689850.1075216; Thu, 07 Mar 2024 12:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCcd-0003GE-2S; Thu, 07 Mar 2024 12:13:15 +0000
Received: by outflank-mailman (input) for mailman id 689850;
 Thu, 07 Mar 2024 12:13:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPn=KN=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1riCcb-0003DH-VX
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:13:13 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11d6f9cf-dc7c-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 13:13:13 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33e162b1b71so739944f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 04:13:13 -0800 (PST)
Received: from meli.delivery (adsl-101.37.6.0.tellas.gr. [37.6.0.101])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a5d59c7000000b0033e475940fasm7826319wry.66.2024.03.07.04.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 04:13:12 -0800 (PST)
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
X-Inumbo-ID: 11d6f9cf-dc7c-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709813592; x=1710418392; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9jKcNU8mtddf0xD96048JENdNgxkV5RZUTuB2JvZ3Dk=;
        b=mtBeJ2gwxTs0RibJDQAgXBAdt/WjVGPAxSAElc6Kx0S96Zi2KkmewX5388FNMQSWJG
         zolYazeJEUqKgFcVdwq1guhbJJmIfX3j8dHtonpgFnBI0IE0aDYKIRO9d5mOuizvGROX
         pu/bUWfWd1kIJ2nn2eWEMhBtzXacoAwajz7wtBQBYHfT9KJOwmgz79Oz4FA5krChOSzA
         292tSNYMEoCq8r6ZTGEOA0r1rKTTkNWI6AwPggSb2X3ZVIiyWhQBwerlE+iJPXNPiZkt
         6aNJYgWENqWWbdNn2g16WZ8fht+MjYYAW1qlMIRRegNPXc76UgL56WuO2W+kIU2jdcxH
         RUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709813592; x=1710418392;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9jKcNU8mtddf0xD96048JENdNgxkV5RZUTuB2JvZ3Dk=;
        b=LpjsnU8PtA7yD12/lH4MfW9RyXwrJy4pLihZaMaAPbrrq/Bt7jqfevKb7v5KnABaf/
         YCPyS3xKNxUaMq1fS4gEZ7LX1KGbNg1fx2h8Fl0WVPJxJhjMPaBojMFZKTIgiJzTNhmf
         aTm7wXDfvYwifwAmc7yAd9h0sAUxdG0u2QM3gVfzhGu6fK4A8t1rvoJjdA3pYBcfs6CG
         X60LDJR4sSFYcj8JV9ik+quFgcG6BeSBIC4gkKzGUfQCzwXihf/xn4ek+0v70JbcyOMc
         62XuqnzU0al04cmFRcwJqbL+gOa0mRt/oGy6r79VjbZIhHFLtkFACQaug6GzPIfBBM+d
         VhsA==
X-Forwarded-Encrypted: i=1; AJvYcCXVzLe+D0VhVb8DO5dEQP3AcCyXDDk0qKrDPF8p3odeZcBhyjLdXg68ojB5aEYYF/Upv0+fmXtDLD7liIuUEoJmugSiMcp+XYBEM8QPk9M=
X-Gm-Message-State: AOJu0YxgkVu5FADTSvoAdBKf9wn2cWx4Mlj0ZOXMjW9t8oi250HR0/VB
	pmBt394ZybeMY2sGxmvamspgrJ1WXmW2+wAUaNM0BzgaxQPBgtr/SjIViTrW6Ko=
X-Google-Smtp-Source: AGHT+IEZSbHZqEkiGm8ptHFul1KfAi5rGSBCKI8+od071N4EROSygV23LA7LHPIPhTI5uqeuF0rSog==
X-Received: by 2002:a5d:64af:0:b0:33e:5310:820f with SMTP id m15-20020a5d64af000000b0033e5310820fmr5236522wrp.67.1709813592443;
        Thu, 07 Mar 2024 04:13:12 -0800 (PST)
Date: Thu, 07 Mar 2024 14:11:03 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Subject: Re: [PATCH-for-9.0 9/9] hw/xen/hvm: Inline xen_arch_set_memory()
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-10-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-10-philmd@linaro.org>
Message-ID: <9z8lx.2kzq0em3zqbp@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>xen_arch_set_memory() is not arch-specific anymore. Being
>called once, inline it in xen_set_memory().
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> include/hw/xen/xen-hvm-common.h |   3 -
> hw/xen/xen-hvm-common.c         | 104 ++++++++++++++++----------------
> 2 files changed, 51 insertions(+), 56 deletions(-)
>
>diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
>index 536712dc83..a1b8a2783b 100644
>--- a/include/hw/xen/xen-hvm-common.h
>+++ b/include/hw/xen/xen-hvm-common.h
>@@ -99,8 +99,5 @@ void cpu_ioreq_pio(ioreq_t *req);
> 
> void xen_read_physmap(XenIOState *state);
> void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
>-void xen_arch_set_memory(XenIOState *state,
>-                         MemoryRegionSection *section,
>-                         bool add);
> 
> #endif /* HW_XEN_HVM_COMMON_H */
>diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
>index 50ce45effc..789c6b4b7a 100644
>--- a/hw/xen/xen-hvm-common.c
>+++ b/hw/xen/xen-hvm-common.c
>@@ -426,50 +426,6 @@ void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
>     }
> }
> 
>-void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
>-                         bool add)
>-{
>-    unsigned target_page_bits = qemu_target_page_bits();
>-    int page_size = qemu_target_page_size();
>-    int page_mask = -page_size;
>-    hwaddr start_addr = section->offset_within_address_space;
>-    ram_addr_t size = int128_get64(section->size);
>-    bool log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
>-    hvmmem_type_t mem_type;
>-
>-    if (!memory_region_is_ram(section->mr)) {
>-        return;
>-    }
>-
>-    if (log_dirty != add) {
>-        return;
>-    }
>-
>-    trace_xen_client_set_memory(start_addr, size, log_dirty);
>-
>-    start_addr &= page_mask;
>-    size = ROUND_UP(size, page_size);
>-
>-    if (add) {
>-        if (!memory_region_is_rom(section->mr)) {
>-            xen_add_to_physmap(state, start_addr, size,
>-                               section->mr, section->offset_within_region);
>-        } else {
>-            mem_type = HVMMEM_ram_ro;
>-            if (xen_set_mem_type(xen_domid, mem_type,
>-                                 start_addr >> target_page_bits,
>-                                 size >> target_page_bits)) {
>-                DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
>-                        start_addr);
>-            }
>-        }
>-    } else {
>-        if (xen_remove_from_physmap(state, start_addr, size) < 0) {
>-            DPRINTF("physmapping does not exist at "HWADDR_FMT_plx"\n", start_addr);
>-        }
>-    }
>-}
>-
> void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
>                    Error **errp)
> {
>@@ -512,20 +468,62 @@ static void xen_set_memory(struct MemoryListener *listener,
>                            bool add)
> {
>     XenIOState *state = container_of(listener, XenIOState, memory_listener);
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+    hwaddr start_addr;
>+    ram_addr_t size;
>+    bool log_dirty;
>+    hvmmem_type_t mem_type;
>+
> 
>     if (section->mr == &xen_memory) {
>         return;
>-    } else {
>-        if (add) {
>-            xen_map_memory_section(xen_domid, state->ioservid,
>-                                   section);
>-        } else {
>-            xen_unmap_memory_section(xen_domid, state->ioservid,
>-                                     section);
>-        }
>     }
> 
>-    xen_arch_set_memory(state, section, add);
>+    if (add) {
>+        xen_map_memory_section(xen_domid, state->ioservid,
>+                               section);
>+    } else {
>+        xen_unmap_memory_section(xen_domid, state->ioservid,
>+                                 section);
>+    }
>+
>+    if (!memory_region_is_ram(section->mr)) {
>+        return;
>+    }
>+
>+    log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
>+
>+    if (log_dirty != add) {
>+        return;
>+    }
>+
>+    start_addr = section->offset_within_address_space;
>+    size = int128_get64(section->size);
>+    trace_xen_client_set_memory(start_addr, size, log_dirty);
>+
>+    start_addr &= page_mask;
>+    size = ROUND_UP(size, page_size);
>+
>+    if (add) {
>+        if (!memory_region_is_rom(section->mr)) {
>+            xen_add_to_physmap(state, start_addr, size,
>+                               section->mr, section->offset_within_region);
>+        } else {
>+            mem_type = HVMMEM_ram_ro;
>+            if (xen_set_mem_type(xen_domid, mem_type,
>+                                 start_addr >> target_page_bits,
>+                                 size >> target_page_bits)) {
>+                DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
>+                        start_addr);
>+            }
>+        }
>+    } else {
>+        if (xen_remove_from_physmap(state, start_addr, size) < 0) {
>+            DPRINTF("physmapping does not exist at "HWADDR_FMT_plx"\n", start_addr);
>+        }
>+    }
> }
> 
> void xen_region_add(MemoryListener *listener,
>-- 
>2.41.0
>
>


Same observation as in previous patch, in Arm xen, qemu doesn't handle 
memory, it is only responsible for devices and their memory.

