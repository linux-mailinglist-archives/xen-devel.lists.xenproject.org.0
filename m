Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 989354E5744
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:18:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293991.499651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4cj-00050n-RC; Wed, 23 Mar 2022 17:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293991.499651; Wed, 23 Mar 2022 17:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4cj-0004yt-Na; Wed, 23 Mar 2022 17:18:17 +0000
Received: by outflank-mailman (input) for mailman id 293991;
 Wed, 23 Mar 2022 17:18:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX4ch-0004wT-QS
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:18:15 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38bbd616-aacd-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 18:18:14 +0100 (CET)
Received: by mail-pj1-x1036.google.com with SMTP id m22so2398981pja.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:18:14 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 l20-20020a056a00141400b004f65cedfb09sm498798pfu.48.2022.03.23.10.18.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:18:12 -0700 (PDT)
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
X-Inumbo-ID: 38bbd616-aacd-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RdGe7OSna0pa6P1DCbP+tWeGpoxvWEJQjOuJ7sjX7ZM=;
        b=LfJoFD5fOViBkuqfE0KI6EMWLe6oYelEsiQii6kQMJ+pxD0zqcY9STqOMnDFSlW73M
         92ZYIUVnSjAEyM+0RN1XniYK9pmWDuGBo+SVmGf4sOHKTxRnTx7RfBfiXxSWznfHXIkq
         0ct06cT/vEr1W7QFb/EO+MjqCSN9t4/1zOTBHtezxjV3AkxnCTB6PF9fzrALv+p62nuR
         RTbDk67z0FYbVHfgSJqkxdDjD0ZVlUCIoQNiEBHCeZ0g3oW9bGRNmiBQyv4PmC07JGLY
         6pTUzjjLplNCGttiMQwTUmcJa0rxUNYiG8FiTe/ZrvXei+d0TJRUFxqUTgIUFjRYdCGL
         ZQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RdGe7OSna0pa6P1DCbP+tWeGpoxvWEJQjOuJ7sjX7ZM=;
        b=vJ9bBhoiwUWPSm1Ymhqpd7TvsUkbCy+jWMNDlnrxvaT9Q1wqLIq7a3nwoD3q4IUJxg
         9Pwv3cG6tPkcneNc1uPxg03wTW3C0xuUanHoAHScPBVWdglHZk7PEO90iWbljFXK5zbr
         UFPfZxTYN8PO7NIGplaoU78WRf9U8dSdqIygvgJirSiVuKMvPvzZqhHXp56kfqc45gCx
         15IgKi4RjF8Af9zelcDE+/ecMVYKsG9QyCNBtF55AvHqZlJUeU5Nl9HMVhMyTdmf84T6
         8rDnVS4Dh8zZELC3fn7jD2WqOTtKQ3UJn8oheOrKoAo1ooWtO1BkBYcTdFVG694B1UZZ
         8vpw==
X-Gm-Message-State: AOAM531KJBV0Iz3XDwI2qD4WWNfY9qghurxs1WWkPFFgGts9DQKsC7ym
	xTZo+SQPofPM6cfCSbXmzfg=
X-Google-Smtp-Source: ABdhPJw8FuyQ7wLlVvP9x+Z8gtO3cPHdbxET9VHqz4Un8qAadu86lw/vl8rV1uYpDaorpMWUtuAyqg==
X-Received: by 2002:a17:90b:1c07:b0:1c7:5324:c68e with SMTP id oc7-20020a17090b1c0700b001c75324c68emr802630pjb.202.1648055893334;
        Wed, 23 Mar 2022 10:18:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Wenchao Wang <wenchao.wang@intel.com>,
	Laurent Vivier <lvivier@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cameron Esfahani <dirty@apple.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	haxm-team@intel.com,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Colin Xu <colin.xu@intel.com>,
	Mark Kanda <mark.kanda@oracle.com>
Subject: [PATCH v4 01/13] cpu: Free cpu->cpu_ases in cpu_address_space_destroy()
Date: Wed, 23 Mar 2022 18:17:39 +0100
Message-Id: <20220323171751.78612-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mark Kanda <mark.kanda@oracle.com>

Create cpu_address_space_destroy() to free a CPU's cpu_ases list.

vCPU hotunplug related leak reported by Valgrind:

==132362== 216 bytes in 1 blocks are definitely lost in loss record 7,119 of 8,549
==132362==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
==132362==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
==132362==    by 0x7E34AF: cpu_address_space_init (physmem.c:751)
==132362==    by 0x45053E: qemu_init_vcpu (cpus.c:635)
==132362==    by 0x76B4A7: x86_cpu_realizefn (cpu.c:6520)
==132362==    by 0x9343ED: device_set_realized (qdev.c:531)
==132362==    by 0x93E26F: property_set_bool (object.c:2273)
==132362==    by 0x93C23E: object_property_set (object.c:1408)
==132362==    by 0x9406DC: object_property_set_qobject (qom-qobject.c:28)
==132362==    by 0x93C5A9: object_property_set_bool (object.c:1477)
==132362==    by 0x933C81: qdev_realize (qdev.c:333)
==132362==    by 0x455E9A: qdev_device_add_from_qdict (qdev-monitor.c:713)

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220321141409.3112932-5-mark.kanda@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 cpu.c                     | 1 +
 include/exec/cpu-common.h | 7 +++++++
 softmmu/physmem.c         | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/cpu.c b/cpu.c
index be1f8b074c..59352a1487 100644
--- a/cpu.c
+++ b/cpu.c
@@ -174,6 +174,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
         tcg_exec_unrealizefn(cpu);
     }
 
+    cpu_address_space_destroy(cpu);
     cpu_list_remove(cpu);
 }
 
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 50a7d2912e..b17ad61ae4 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -111,6 +111,13 @@ size_t qemu_ram_pagesize_largest(void);
  */
 void cpu_address_space_init(CPUState *cpu, int asidx,
                             const char *prefix, MemoryRegion *mr);
+/**
+ * cpu_address_space_destroy:
+ * @cpu: CPU for this address space
+ *
+ * Cleanup CPU's cpu_ases list.
+ */
+void cpu_address_space_destroy(CPUState *cpu);
 
 void cpu_physical_memory_rw(hwaddr addr, void *buf,
                             hwaddr len, bool is_write);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 43ae70fbe2..aec61ca07a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -762,6 +762,11 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
     }
 }
 
+void cpu_address_space_destroy(CPUState *cpu)
+{
+    g_free(cpu->cpu_ases);
+}
+
 AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
 {
     /* Return the AddressSpace corresponding to the specified index */
-- 
2.35.1


