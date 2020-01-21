Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A521439DB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 10:52:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itqAh-0002ZE-BG; Tue, 21 Jan 2020 09:50:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O4ZA=3K=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1itqAf-0002Pq-KH
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 09:50:05 +0000
X-Inumbo-ID: 5f0c5336-3c33-11ea-9fd7-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.35])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f0c5336-3c33-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 09:49:53 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 76F659D12634EFFEEB6F;
 Tue, 21 Jan 2020 17:49:51 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Tue, 21 Jan 2020
 17:49:42 +0800
To: <xen-devel@lists.xenproject.org>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E26C935.9080107@hisilicon.com>
Date: Tue, 21 Jan 2020 17:49:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: [Xen-devel] [PATCH] arm/acpi: Add __acpi_unmap_table function for
 ARM
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 xuwei5@hisilicon.com, Jan Beulich <jbeulich@suse.com>,
 Volodymyr_Babchuk@epam.com
Content-Type: multipart/mixed; boundary="===============8822540550065934821=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8822540550065934821==
Content-Type: multipart/alternative;
	boundary="------------030604060806010707090406"

--------------030604060806010707090406
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Add __acpi_unmap_table function for ARM and invoke it at acpi_os_unmap_memory
to make sure the related fixmap has been cleared before using it for a
different mapping.

Signed-off-by: Wei Xu<xuwei5@hisilicon.com>
---
  xen/arch/arm/acpi/lib.c | 25 +++++++++++++++++++++++++
  xen/drivers/acpi/osl.c  |  2 ++
  xen/include/xen/acpi.h  |  1 +
  3 files changed, 28 insertions(+)

diff --git a/xen/arch/arm/acpi/lib.c b/xen/arch/arm/acpi/lib.c
index 4fc6e17..69e87ec 100644
--- a/xen/arch/arm/acpi/lib.c
+++ b/xen/arch/arm/acpi/lib.c
@@ -49,6 +49,31 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
      return ((char *) base + offset);
  }
  
+void __acpi_unmap_table(void __iomem * virt, unsigned long size)
+{
+    unsigned long base, end;
+    int idx;
+
+    base = FIXMAP_ADDR(FIXMAP_ACPI_BEGIN);
+    end = FIXMAP_ADDR(FIXMAP_ACPI_END);
+
+    if ( (unsigned long)virt < base || (unsigned long)virt > end )
+    {
+        return;
+    }
+
+    idx = FIXMAP_ACPI_BEGIN + ((unsigned long)virt - base) / PAGE_SIZE;
+    clear_fixmap(idx);
+
+    while ( size > PAGE_SIZE )
+    {
+        if ( ++idx > FIXMAP_ACPI_END )
+            return;
+        clear_fixmap(idx);
+        size -= PAGE_SIZE;
+    }
+}
+
  /* True to indicate PSCI 0.2+ is implemented */
  bool __init acpi_psci_present(void)
  {
diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
index 4c8bb78..18666c7 100644
--- a/xen/drivers/acpi/osl.c
+++ b/xen/drivers/acpi/osl.c
@@ -114,6 +114,8 @@ void acpi_os_unmap_memory(void __iomem * virt, acpi_size size)
  		return;
  	}
  
+	__acpi_unmap_table(virt, size);
+
  	if (system_state >= SYS_STATE_boot)
  		vunmap((void *)((unsigned long)virt & PAGE_MASK));
  }
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 5cfa060..acb00a2 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -68,6 +68,7 @@ typedef int (*acpi_table_entry_handler) (struct acpi_subtable_header *header, co
  
  unsigned int acpi_get_processor_id (unsigned int cpu);
  char * __acpi_map_table (paddr_t phys_addr, unsigned long size);
+void __acpi_unmap_table(void __iomem * virt, unsigned long size);
  int acpi_boot_init (void);
  int acpi_boot_table_init (void);
  int acpi_numa_init (void);
-- 2.8.1 .


--------------030604060806010707090406
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-text-plain" wrap="true" graphical-quote="true"
      style="font-family: -moz-fixed; font-size: 14px;" lang="x-western">
      <pre wrap="">Add __acpi_unmap_table function for ARM and invoke it at acpi_os_unmap_memory
to make sure the related fixmap has been cleared before using it for a
different mapping.

Signed-off-by: Wei Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuwei5@hisilicon.com">&lt;xuwei5@hisilicon.com&gt;</a>
---
 xen/arch/arm/acpi/lib.c | 25 +++++++++++++++++++++++++
 xen/drivers/acpi/osl.c  |  2 ++
 xen/include/xen/acpi.h  |  1 +
 3 files changed, 28 insertions(+)

diff --git a/xen/arch/arm/acpi/lib.c b/xen/arch/arm/acpi/lib.c
index 4fc6e17..69e87ec 100644
--- a/xen/arch/arm/acpi/lib.c
+++ b/xen/arch/arm/acpi/lib.c
@@ -49,6 +49,31 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
     return ((char *) base + offset);
 }
 
+void __acpi_unmap_table(void __iomem * virt, unsigned long size)
+{
+    unsigned long base, end;
+    int idx;
+
+    base = FIXMAP_ADDR(FIXMAP_ACPI_BEGIN);
+    end = FIXMAP_ADDR(FIXMAP_ACPI_END);
+
+    if ( (unsigned long)virt &lt; base || (unsigned long)virt &gt; end )
+    {
+        return;
+    }
+
+    idx = FIXMAP_ACPI_BEGIN + ((unsigned long)virt - base) / PAGE_SIZE;
+    clear_fixmap(idx);
+
+    while ( size &gt; PAGE_SIZE )
+    {
+        if ( ++idx &gt; FIXMAP_ACPI_END )
+            return;
+        clear_fixmap(idx);
+        size -= PAGE_SIZE;
+    }
+}
+
 /* True to indicate PSCI 0.2+ is implemented */
 bool __init acpi_psci_present(void)
 {
diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
index 4c8bb78..18666c7 100644
--- a/xen/drivers/acpi/osl.c
+++ b/xen/drivers/acpi/osl.c
@@ -114,6 +114,8 @@ void acpi_os_unmap_memory(void __iomem * virt, acpi_size size)
 		return;
 	}
 
+	__acpi_unmap_table(virt, size);
+
 	if (system_state &gt;= SYS_STATE_boot)
 		vunmap((void *)((unsigned long)virt &amp; PAGE_MASK));
 }
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 5cfa060..acb00a2 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -68,6 +68,7 @@ typedef int (*acpi_table_entry_handler) (struct acpi_subtable_header *header, co
 
 unsigned int acpi_get_processor_id (unsigned int cpu);
 char * __acpi_map_table (paddr_t phys_addr, unsigned long size);
+void __acpi_unmap_table(void __iomem * virt, unsigned long size);
 int acpi_boot_init (void);
 int acpi_boot_table_init (void);
 int acpi_numa_init (void);
<div class="moz-txt-sig">-- 
2.8.1


.

</div></pre>
    </div>
  </body>
</html>

--------------030604060806010707090406--


--===============8822540550065934821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8822540550065934821==--

