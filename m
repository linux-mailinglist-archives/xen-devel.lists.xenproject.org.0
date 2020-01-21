Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24103143608
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 04:47:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itkSt-0004ro-L5; Tue, 21 Jan 2020 03:44:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O4ZA=3K=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1itkSr-0004rj-PD
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 03:44:29 +0000
X-Inumbo-ID: 50ab00e1-3c00-11ea-ba1f-12813bfff9fa
Received: from huawei.com (unknown [45.249.212.35])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50ab00e1-3c00-11ea-ba1f-12813bfff9fa;
 Tue, 21 Jan 2020 03:44:25 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 37C552A93CCD793DA4D3;
 Tue, 21 Jan 2020 11:44:23 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Tue, 21 Jan 2020
 11:44:13 +0800
From: Wei Xu <xuwei5@hisilicon.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <5E26738C.1060605@hisilicon.com>
Date: Tue, 21 Jan 2020 11:44:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: [Xen-devel]  [PATCH v2] ns16550: Add ACPI support for ARM only
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
 Shameerali
 Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, xuwei5@hisilicon.com,
 Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============4290590840298353892=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4290590840298353892==
Content-Type: multipart/alternative;
	boundary="------------010008020809060707020606"

--------------010008020809060707020606
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Parse the ACPI SPCR table and initialize the 16550 compatible serial port
for ARM only. Currently we only support one UART on ARM. Some fields like
PCI, flow control and so on we do not care yet on ARM are ignored.

Signed-off-by: Wei Xu<xuwei5@hisilicon.com>

---
Changes in v2:
- improve commit message
- remove the spcr initialization
- add comments for the uart initialization and configuration
- adjust the code style issue
- limit the code only built on ACPI and ARM
---
  xen/drivers/char/ns16550.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 60 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index aa87c57..a193f74 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1620,6 +1620,66 @@ DT_DEVICE_START(ns16550, "NS16550 UART", DEVICE_SERIAL)
  DT_DEVICE_END
  
  #endif /* HAS_DEVICE_TREE */
+#if defined(CONFIG_ACPI) && defined(CONFIG_ARM)
+#include <xen/acpi.h>
+
+static int __init ns16550_acpi_uart_init(const void *data)
+{
+    struct acpi_table_spcr *spcr;
+    acpi_status status;
+
+    /* Same as the DT part.
+     * Only support one UART on ARM which happen to be ns16550_com[0].
+     */
+    struct ns16550 *uart = &ns16550_com[0];
+
+    status = acpi_get_table(ACPI_SIG_SPCR, 0,
+                            (struct acpi_table_header **)&spcr);
+
+    if ( ACPI_FAILURE(status) )
+    {
+        printk("ns16550: Failed to get SPCR table\n");
+        return -EINVAL;
+    }
+
+    ns16550_init_common(uart);
+
+    /* The baud rate is pre-configured by the firmware.
+     * And currently the ACPI part is only targeting ARM so some fields
+     * like PCI, flow control and so on we do not care yet are ignored.
+     */
+    uart->baud = BAUD_AUTO;
+    uart->data_bits = 8;
+    uart->parity = spcr->parity;
+    uart->stop_bits = spcr->stop_bits;
+    uart->io_base = spcr->serial_port.address;
+    uart->io_size = 8;
+    uart->reg_shift = spcr->serial_port.bit_offset;
+    uart->reg_width = 1;
+
+    /* The trigger/polarity information is not available in spcr. */
+    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
+    uart->irq = spcr->interrupt;
+
+    uart->vuart.base_addr = uart->io_base;
+    uart->vuart.size = uart->io_size;
+    uart->vuart.data_off = UART_THR << uart->reg_shift;
+    uart->vuart.status_off = UART_LSR << uart->reg_shift;
+    uart->vuart.status = UART_LSR_THRE | UART_LSR_TEMT;
+
+    /*  Register with generic serial driver. */
+    serial_register_uart(uart - ns16550_com, &ns16550_driver, uart);
+
+    return 0;
+}
+
+ACPI_DEVICE_START(ans16550, "NS16550 UART", DEVICE_SERIAL)
+    .class_type = ACPI_DBG2_16550_COMPATIBLE,
+    .init = ns16550_acpi_uart_init,
+ACPI_DEVICE_END
+
+#endif /* CONFIG_ACPI && CONFIG_ARM */
+
  /*
   * Local variables:
   * mode: C
-- 2.8.1 .


--------------010008020809060707020606
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-text-plain" wrap="true" graphical-quote="true"
      style="font-family: -moz-fixed; font-size: 14px;" lang="x-western">
      <pre wrap="">Parse the ACPI SPCR table and initialize the 16550 compatible serial port
for ARM only. Currently we only support one UART on ARM. Some fields like
PCI, flow control and so on we do not care yet on ARM are ignored.

Signed-off-by: Wei Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuwei5@hisilicon.com">&lt;xuwei5@hisilicon.com&gt;</a>

---
Changes in v2:
- improve commit message
- remove the spcr initialization 
- add comments for the uart initialization and configuration
- adjust the code style issue
- limit the code only built on ACPI and ARM
---
 xen/drivers/char/ns16550.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index aa87c57..a193f74 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1620,6 +1620,66 @@ DT_DEVICE_START(ns16550, "NS16550 UART", DEVICE_SERIAL)
 DT_DEVICE_END
 
 #endif /* HAS_DEVICE_TREE */
+#if defined(CONFIG_ACPI) &amp;&amp; defined(CONFIG_ARM)
+#include &lt;xen/acpi.h&gt;
+
+static int __init ns16550_acpi_uart_init(const void *data)
+{
+    struct acpi_table_spcr *spcr;
+    acpi_status status;
+
+    /* Same as the DT part.
+     * Only support one UART on ARM which happen to be ns16550_com[0].
+     */
+    struct ns16550 *uart = &amp;ns16550_com[0];
+
+    status = acpi_get_table(ACPI_SIG_SPCR, 0,
+                            (struct acpi_table_header **)&amp;spcr);
+
+    if ( ACPI_FAILURE(status) )
+    {
+        printk("ns16550: Failed to get SPCR table\n");
+        return -EINVAL;
+    }
+
+    ns16550_init_common(uart);
+
+    /* The baud rate is pre-configured by the firmware.
+     * And currently the ACPI part is only targeting ARM so some fields
+     * like PCI, flow control and so on we do not care yet are ignored.
+     */
+    uart-&gt;baud = BAUD_AUTO;
+    uart-&gt;data_bits = 8;
+    uart-&gt;parity = spcr-&gt;parity;
+    uart-&gt;stop_bits = spcr-&gt;stop_bits;
+    uart-&gt;io_base = spcr-&gt;serial_port.address;
+    uart-&gt;io_size = 8;
+    uart-&gt;reg_shift = spcr-&gt;serial_port.bit_offset;
+    uart-&gt;reg_width = 1;
+
+    /* The trigger/polarity information is not available in spcr. */
+    irq_set_type(spcr-&gt;interrupt, IRQ_TYPE_LEVEL_HIGH);
+    uart-&gt;irq = spcr-&gt;interrupt;
+
+    uart-&gt;vuart.base_addr = uart-&gt;io_base;
+    uart-&gt;vuart.size = uart-&gt;io_size;
+    uart-&gt;vuart.data_off = UART_THR &lt;&lt; uart-&gt;reg_shift;
+    uart-&gt;vuart.status_off = UART_LSR &lt;&lt; uart-&gt;reg_shift;
+    uart-&gt;vuart.status = UART_LSR_THRE | UART_LSR_TEMT;
+
+    /*  Register with generic serial driver. */
+    serial_register_uart(uart - ns16550_com, &amp;ns16550_driver, uart);
+
+    return 0;
+}
+
+ACPI_DEVICE_START(ans16550, "NS16550 UART", DEVICE_SERIAL)
+    .class_type = ACPI_DBG2_16550_COMPATIBLE,
+    .init = ns16550_acpi_uart_init,
+ACPI_DEVICE_END
+
+#endif /* CONFIG_ACPI &amp;&amp; CONFIG_ARM */
+
 /*
  * Local variables:
  * mode: C
<div class="moz-txt-sig">-- 
2.8.1


.

</div></pre>
    </div>
  </body>
</html>

--------------010008020809060707020606--


--===============4290590840298353892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4290590840298353892==--

