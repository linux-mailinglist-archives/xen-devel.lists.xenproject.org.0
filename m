Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C004B511A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271717.466397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3f-00015X-W6; Mon, 14 Feb 2022 13:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271717.466397; Mon, 14 Feb 2022 13:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3f-0000p2-AA; Mon, 14 Feb 2022 13:06:23 +0000
Received: by outflank-mailman (input) for mailman id 271717;
 Mon, 14 Feb 2022 13:06:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb33-00023t-JR
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfb2082c-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:05:42 +0100 (CET)
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
X-Inumbo-ID: cfb2082c-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=OwW5YsR6GfHfWjF2g/4V1G5fiXx9eC4JGeYTntB+Biw=;
  b=bTkovZwz0Ou8CuafAXR06gA2ldSCoXJ7P2ovFY6JiukylJGk8iU7PJ1M
   fcGarIre1D9Hnj4rMc1yFIr575ysQCGf0l6G81wc1dP0W6fc5L/iJdORy
   idbaUD3VAtlui4N0zGY2dSOqH4xOmDHs+0Z8UMoPRyMcxgeeqUIhiCWCq
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ppeC++WIrsfEBI6t2hLmZt8vYMV2tXZwuCwCNIS6FvQexE0ACL5AgRKNGXFZagJAiT1tiRA6nG
 MV6l7keBqlOIzYfy4HMBhzVhrTYAAPtlUwiuvYBtZPFGZNZIvf/jgUcPJnha7aw2szDUo42rWD
 L4eaFgopv1hTxgKnsGxwX4BY5n71ui/+ZAYRebdCZcK1gobk1vZDDERUN+YJzcsuzQ/FdP10VW
 4lhy+NcDDoRuGRpkVZqtJQy4c/SQFYLI0eBiQvkpKm9yFs5H+wzLxxh5ZbhyB4KnIkIlmAf18B
 sJPbuhNWIj2prJHymCwq9o4V
X-SBRS: 5.1
X-MesageID: 64149826
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4PPMqKn/87z9ojq+Ckpc0m3o5gyfIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNCmHSaK2JZWSgctFxPNi/9kID78fXyNJkHAZkqSo0EiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NYThbGoby4gB6fvovszcwBaVAZuH7ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6qHO
 5tJM2QHgBLoTkNkPVo9GIsHh+aomDrubD5h6w2pnP9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTZW4JPOTmrLgw2gTVnzFNTk1NPbemnRWnok3ga/9HD
 WUdwyANl7cc1FWpCf7tfQLt9RZooSUgc9ZXFuQ77iSExazV/xuVCwA4c9JRVDA1nJRoHGJ3j
 zdli/usXGUy6+PNFRpx45/J9WvaBMQDEYMVicbopyMh6sKrnow8hwmnoj1LQP/s1Y2d9d0dL
 lm3QMkCa1c70JRjO0aTpwmvb9eQSn/hFFBd2+kvdjj5hj6Vnab8D2BS1XDV7OxbMKGSRUSbs
 X4PlqC2tb5SUc7dxHHQGLxWRtlFAspp1xWG3zZS82QJrWzxqxZPg6gMiN2BGKuZGpldImK4C
 KMikQhQ+IVSLBOXgVxfOOqM5zAR5fG4T7zND6mMBvIXO8QZXFLXrUlGOB/Lt0iwwRdErE3KE
 crCGSpaJS1BUvoPIfvfb7p17ILHMQhgmTKNFcijlUzPPHj3TCf9dIrp+WCmNogRhJ5oai2Mm
 zqGH8fVmRhZTsPkZSzbrdwaIVwQdCBpDpHqsc1HMOWEJ1M+Sm0mDvbQx5InepBkwPsJxruZo
 CnlVx8K0kf7iF3GNR6ONiJpZoTwUMsttnk8JyEtYwqlgiBxfYa14a4DXJIrZr17pvd7xPt5Q
 qBdKcWNC/hCUBrd/DEZYcWvpYBubk3z1wmPIzCkcH40eJs5H17F/drtfw3O8igSD3Xo6Zti8
 uP4jg6CGMgNXQVvCsrSecmD9VLpsChPgv92UmvJPsJXJBfm/r91JnGjlfQwOcwNd0nOn2PIy
 waMDB4EjuDRuItposLRjKWJoor1QetzGk1WQzvS4bqsbHSI+2OixclLUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozt4n1urtX7gV4B3GaPV2kB4RpLmSCwcQS5LZGwaVUuFfuV
 0+CkjWA1W5l5C8x/IYtGTcY
IronPort-HdrOrdr: A9a23:TUokqq7Qv1JBWj7L5QPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149826"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 33/70] x86/hvm: CFI hardening for device emulation
Date: Mon, 14 Feb 2022 12:50:50 +0000
Message-ID: <20220214125127.17985-34-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/emul-i8254.c                 |  8 +++----
 xen/arch/x86/hvm/emulate.c                | 21 ++++++++---------
 xen/arch/x86/hvm/hpet.c                   |  6 ++---
 xen/arch/x86/hvm/hvm.c                    |  2 +-
 xen/arch/x86/hvm/intercept.c              | 28 +++++++++++++----------
 xen/arch/x86/hvm/io.c                     | 38 +++++++++++++++++--------------
 xen/arch/x86/hvm/ioreq.c                  |  2 +-
 xen/arch/x86/hvm/pmtimer.c                |  4 ++--
 xen/arch/x86/hvm/rtc.c                    |  6 ++---
 xen/arch/x86/hvm/stdvga.c                 | 19 ++++++++--------
 xen/arch/x86/hvm/svm/svm.c                |  4 ++--
 xen/arch/x86/hvm/vioapic.c                |  8 +++----
 xen/arch/x86/hvm/vlapic.c                 | 11 +++++----
 xen/arch/x86/hvm/vmsi.c                   | 14 +++++++-----
 xen/arch/x86/hvm/vpic.c                   |  4 ++--
 xen/arch/x86/include/asm/hvm/vioapic.h    |  2 +-
 xen/drivers/passthrough/amd/iommu_guest.c | 10 ++++----
 17 files changed, 98 insertions(+), 89 deletions(-)

diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 050c784702af..0e09a173187f 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -48,9 +48,9 @@
 #define RW_STATE_WORD0 3
 #define RW_STATE_WORD1 4
 
-static int handle_pit_io(
+static int cf_check handle_pit_io(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val);
-static int handle_speaker_io(
+static int cf_check handle_speaker_io(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val);
 
 #define get_guest_time(v) \
@@ -505,7 +505,7 @@ void pit_deinit(struct domain *d)
 }
 
 /* the intercept action for PIT DM retval:0--not handled; 1--handled */  
-static int handle_pit_io(
+static int cf_check handle_pit_io(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
     struct PITState *vpit = vcpu_vpit(current);
@@ -548,7 +548,7 @@ static uint32_t speaker_ioport_read(
             (pit_get_out(pit, 2) << 5) | (refresh_clock << 4));
 }
 
-static int handle_speaker_io(
+static int cf_check handle_speaker_io(
     int dir, unsigned int port, uint32_t bytes, uint32_t *val)
 {
     struct PITState *vpit = vcpu_vpit(current);
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 2b3fb4d6ba05..39dac7fd9d6d 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -71,19 +71,17 @@ static void hvmtrace_io_assist(const ioreq_t *p)
     trace_var(event, 0/*!cycles*/, size, buffer);
 }
 
-static int null_read(const struct hvm_io_handler *io_handler,
-                     uint64_t addr,
-                     uint32_t size,
-                     uint64_t *data)
+static int cf_check null_read(
+    const struct hvm_io_handler *io_handler, uint64_t addr, uint32_t size,
+    uint64_t *data)
 {
     *data = ~0ul;
     return X86EMUL_OKAY;
 }
 
-static int null_write(const struct hvm_io_handler *handler,
-                      uint64_t addr,
-                      uint32_t size,
-                      uint64_t data)
+static int cf_check null_write(
+    const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
+    uint64_t data)
 {
     return X86EMUL_OKAY;
 }
@@ -114,10 +112,9 @@ static const struct hvm_io_handler null_handler = {
     .ops = &null_ops
 };
 
-static int ioreq_server_read(const struct hvm_io_handler *io_handler,
-                    uint64_t addr,
-                    uint32_t size,
-                    uint64_t *data)
+static int cf_check ioreq_server_read(
+    const struct hvm_io_handler *io_handler, uint64_t addr, uint32_t size,
+    uint64_t *data)
 {
     if ( hvm_copy_from_guest_phys(data, addr, size) != HVMTRANS_okay )
         return X86EMUL_UNHANDLEABLE;
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index 8267f0b8a278..7bdb51cfa1c4 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -162,7 +162,7 @@ static inline int hpet_check_access_length(
     return 0;
 }
 
-static int hpet_read(
+static int cf_check hpet_read(
     struct vcpu *v, unsigned long addr, unsigned int length,
     unsigned long *pval)
 {
@@ -351,7 +351,7 @@ static void timer_sanitize_int_route(HPETState *h, unsigned int tn)
                   HPET_TN_ROUTE);
 }
 
-static int hpet_write(
+static int cf_check hpet_write(
     struct vcpu *v, unsigned long addr,
     unsigned int length, unsigned long val)
 {
@@ -569,7 +569,7 @@ static int hpet_write(
     return X86EMUL_OKAY;
 }
 
-static int hpet_range(struct vcpu *v, unsigned long addr)
+static int cf_check hpet_range(struct vcpu *v, unsigned long addr)
 {
     return ( (addr >= HPET_BASE_ADDRESS) &&
              (addr < (HPET_BASE_ADDRESS + HPET_MMAP_SIZE)) );
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5ec10f30803e..9e4924649077 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -543,7 +543,7 @@ void hvm_do_resume(struct vcpu *v)
     }
 }
 
-static int hvm_print_line(
+static int cf_check hvm_print_line(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
     struct domain *cd = current->domain;
diff --git a/xen/arch/x86/hvm/intercept.c b/xen/arch/x86/hvm/intercept.c
index 02ca3b05b05a..ffa31b746716 100644
--- a/xen/arch/x86/hvm/intercept.c
+++ b/xen/arch/x86/hvm/intercept.c
@@ -32,8 +32,8 @@
 #include <xen/event.h>
 #include <xen/iommu.h>
 
-static bool_t hvm_mmio_accept(const struct hvm_io_handler *handler,
-                              const ioreq_t *p)
+static bool cf_check hvm_mmio_accept(
+    const struct hvm_io_handler *handler, const ioreq_t *p)
 {
     paddr_t first = ioreq_mmio_first_byte(p), last;
 
@@ -51,16 +51,18 @@ static bool_t hvm_mmio_accept(const struct hvm_io_handler *handler,
     return 1;
 }
 
-static int hvm_mmio_read(const struct hvm_io_handler *handler,
-                         uint64_t addr, uint32_t size, uint64_t *data)
+static int cf_check hvm_mmio_read(
+    const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
+    uint64_t *data)
 {
     BUG_ON(handler->type != IOREQ_TYPE_COPY);
 
     return handler->mmio.ops->read(current, addr, size, data);
 }
 
-static int hvm_mmio_write(const struct hvm_io_handler *handler,
-                          uint64_t addr, uint32_t size, uint64_t data)
+static int cf_check hvm_mmio_write(
+    const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
+    uint64_t data)
 {
     BUG_ON(handler->type != IOREQ_TYPE_COPY);
 
@@ -73,8 +75,8 @@ static const struct hvm_io_ops mmio_ops = {
     .write = hvm_mmio_write
 };
 
-static bool_t hvm_portio_accept(const struct hvm_io_handler *handler,
-                                const ioreq_t *p)
+static bool cf_check hvm_portio_accept(
+    const struct hvm_io_handler *handler, const ioreq_t *p)
 {
     unsigned int start = handler->portio.port;
     unsigned int end = start + handler->portio.size;
@@ -84,8 +86,9 @@ static bool_t hvm_portio_accept(const struct hvm_io_handler *handler,
     return (p->addr >= start) && ((p->addr + p->size) <= end);
 }
 
-static int hvm_portio_read(const struct hvm_io_handler *handler,
-                           uint64_t addr, uint32_t size, uint64_t *data)
+static int cf_check hvm_portio_read(
+    const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
+    uint64_t *data)
 {
     uint32_t val = ~0u;
     int rc;
@@ -98,8 +101,9 @@ static int hvm_portio_read(const struct hvm_io_handler *handler,
     return rc;
 }
 
-static int hvm_portio_write(const struct hvm_io_handler *handler,
-                            uint64_t addr, uint32_t size, uint64_t data)
+static int cf_check hvm_portio_write(
+    const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
+    uint64_t data)
 {
     uint32_t val = data;
 
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 93f1d1503fa6..f70bfde90143 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -156,8 +156,8 @@ bool handle_pio(uint16_t port, unsigned int size, int dir)
     return true;
 }
 
-static bool_t g2m_portio_accept(const struct hvm_io_handler *handler,
-                                const ioreq_t *p)
+static bool cf_check g2m_portio_accept(
+    const struct hvm_io_handler *handler, const ioreq_t *p)
 {
     struct vcpu *curr = current;
     const struct hvm_domain *hvm = &curr->domain->arch.hvm;
@@ -179,8 +179,9 @@ static bool_t g2m_portio_accept(const struct hvm_io_handler *handler,
     return 0;
 }
 
-static int g2m_portio_read(const struct hvm_io_handler *handler,
-                           uint64_t addr, uint32_t size, uint64_t *data)
+static int cf_check g2m_portio_read(
+    const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
+    uint64_t *data)
 {
     struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
     const struct g2m_ioport *g2m_ioport = hvio->g2m_ioport;
@@ -204,8 +205,9 @@ static int g2m_portio_read(const struct hvm_io_handler *handler,
     return X86EMUL_OKAY;
 }
 
-static int g2m_portio_write(const struct hvm_io_handler *handler,
-                            uint64_t addr, uint32_t size, uint64_t data)
+static int cf_check g2m_portio_write(
+    const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
+    uint64_t data)
 {
     struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
     const struct g2m_ioport *g2m_ioport = hvio->g2m_ioport;
@@ -261,14 +263,15 @@ unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
 }
 
 /* vPCI config space IO ports handlers (0xcf8/0xcfc). */
-static bool vpci_portio_accept(const struct hvm_io_handler *handler,
-                               const ioreq_t *p)
+static bool cf_check vpci_portio_accept(
+    const struct hvm_io_handler *handler, const ioreq_t *p)
 {
     return (p->addr == 0xcf8 && p->size == 4) || (p->addr & ~3) == 0xcfc;
 }
 
-static int vpci_portio_read(const struct hvm_io_handler *handler,
-                            uint64_t addr, uint32_t size, uint64_t *data)
+static int cf_check vpci_portio_read(
+    const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
+    uint64_t *data)
 {
     const struct domain *d = current->domain;
     unsigned int reg;
@@ -299,8 +302,9 @@ static int vpci_portio_read(const struct hvm_io_handler *handler,
     return X86EMUL_OKAY;
 }
 
-static int vpci_portio_write(const struct hvm_io_handler *handler,
-                             uint64_t addr, uint32_t size, uint64_t data)
+static int cf_check vpci_portio_write(
+    const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
+    uint64_t data)
 {
     struct domain *d = current->domain;
     unsigned int reg;
@@ -387,7 +391,7 @@ static unsigned int vpci_mmcfg_decode_addr(const struct hvm_mmcfg *mmcfg,
     return addr & (PCI_CFG_SPACE_EXP_SIZE - 1);
 }
 
-static int vpci_mmcfg_accept(struct vcpu *v, unsigned long addr)
+static int cf_check vpci_mmcfg_accept(struct vcpu *v, unsigned long addr)
 {
     struct domain *d = v->domain;
     bool found;
@@ -399,8 +403,8 @@ static int vpci_mmcfg_accept(struct vcpu *v, unsigned long addr)
     return found;
 }
 
-static int vpci_mmcfg_read(struct vcpu *v, unsigned long addr,
-                           unsigned int len, unsigned long *data)
+static int cf_check vpci_mmcfg_read(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
 {
     struct domain *d = v->domain;
     const struct hvm_mmcfg *mmcfg;
@@ -426,8 +430,8 @@ static int vpci_mmcfg_read(struct vcpu *v, unsigned long addr,
     return X86EMUL_OKAY;
 }
 
-static int vpci_mmcfg_write(struct vcpu *v, unsigned long addr,
-                            unsigned int len, unsigned long data)
+static int cf_check vpci_mmcfg_write(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
 {
     struct domain *d = v->domain;
     const struct hvm_mmcfg *mmcfg;
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 02ad9db56523..8409d910d689 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -319,7 +319,7 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
     return true;
 }
 
-static int hvm_access_cf8(
+static int cf_check hvm_access_cf8(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
     struct domain *d = current->domain;
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 808819d1de91..60e3c8de4c6b 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -152,7 +152,7 @@ static void cf_check pmt_timer_callback(void *opaque)
 }
 
 /* Handle port I/O to the PM1a_STS and PM1a_EN registers */
-static int handle_evt_io(
+static int cf_check handle_evt_io(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
     struct vcpu *v = current;
@@ -216,7 +216,7 @@ static int handle_evt_io(
 
 
 /* Handle port I/O to the TMR_VAL register */
-static int handle_pmt_io(
+static int cf_check handle_pmt_io(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
     struct vcpu *v = current;
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 09d3501276bc..bdc647e433e9 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -696,7 +696,7 @@ static uint32_t rtc_ioport_read(RTCState *s, uint32_t addr)
     return ret;
 }
 
-static int handle_rtc_io(
+static int cf_check handle_rtc_io(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
     struct RTCState *vrtc = vcpu_vrtc(current);
@@ -809,8 +809,8 @@ void rtc_reset(struct domain *d)
 }
 
 /* RTC mediator for HVM hardware domain. */
-static int hw_rtc_io(int dir, unsigned int port, unsigned int size,
-                     uint32_t *val)
+static int cf_check hw_rtc_io(
+    int dir, unsigned int port, unsigned int size, uint32_t *val)
 {
     if ( dir == IOREQ_READ )
         *val = ~0;
diff --git a/xen/arch/x86/hvm/stdvga.c b/xen/arch/x86/hvm/stdvga.c
index ab9781d82a55..be8200c8d072 100644
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -199,7 +199,7 @@ static void stdvga_out(uint32_t port, uint32_t bytes, uint32_t val)
     }
 }
 
-static int stdvga_intercept_pio(
+static int cf_check stdvga_intercept_pio(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
     struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
@@ -302,8 +302,9 @@ static uint8_t stdvga_mem_readb(uint64_t addr)
     return ret;
 }
 
-static int stdvga_mem_read(const struct hvm_io_handler *handler,
-                           uint64_t addr, uint32_t size, uint64_t *p_data)
+static int cf_check stdvga_mem_read(
+    const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
+    uint64_t *p_data)
 {
     uint64_t data = ~0ul;
 
@@ -453,9 +454,9 @@ static void stdvga_mem_writeb(uint64_t addr, uint32_t val)
     }
 }
 
-static int stdvga_mem_write(const struct hvm_io_handler *handler,
-                            uint64_t addr, uint32_t size,
-                            uint64_t data)
+static int cf_check stdvga_mem_write(
+    const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
+    uint64_t data)
 {
     struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
     ioreq_t p = {
@@ -514,8 +515,8 @@ static int stdvga_mem_write(const struct hvm_io_handler *handler,
     return ioreq_send(srv, &p, 1);
 }
 
-static bool_t stdvga_mem_accept(const struct hvm_io_handler *handler,
-                                const ioreq_t *p)
+static bool cf_check stdvga_mem_accept(
+    const struct hvm_io_handler *handler, const ioreq_t *p)
 {
     struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
 
@@ -558,7 +559,7 @@ static bool_t stdvga_mem_accept(const struct hvm_io_handler *handler,
     return 0;
 }
 
-static void stdvga_mem_complete(const struct hvm_io_handler *handler)
+static void cf_check stdvga_mem_complete(const struct hvm_io_handler *handler)
 {
     struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index de6166241bf1..4c4ebda5e6e4 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1133,8 +1133,8 @@ static void svm_host_osvw_init(void)
     spin_unlock(&osvw_lock);
 }
 
-static int acpi_c1e_quirk(int dir, unsigned int port, unsigned int bytes,
-                          uint32_t *val)
+static int cf_check acpi_c1e_quirk(
+    int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
     ASSERT(bytes == 1 && port == acpi_smi_cmd);
 
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 553c0f76eff8..b56549aa22d1 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -135,7 +135,7 @@ static uint32_t vioapic_read_indirect(const struct hvm_vioapic *vioapic)
     return result;
 }
 
-static int vioapic_read(
+static int cf_check vioapic_read(
     struct vcpu *v, unsigned long addr,
     unsigned int length, unsigned long *pval)
 {
@@ -351,7 +351,7 @@ static void vioapic_write_indirect(
     }
 }
 
-static int vioapic_write(
+static int cf_check vioapic_write(
     struct vcpu *v, unsigned long addr,
     unsigned int length, unsigned long val)
 {
@@ -383,7 +383,7 @@ static int vioapic_write(
     return X86EMUL_OKAY;
 }
 
-static int vioapic_range(struct vcpu *v, unsigned long addr)
+static int cf_check vioapic_range(struct vcpu *v, unsigned long addr)
 {
     return !!addr_vioapic(v->domain, addr);
 }
@@ -568,7 +568,7 @@ int vioapic_get_mask(const struct domain *d, unsigned int gsi)
     return vioapic->redirtbl[pin].fields.mask;
 }
 
-int vioapic_get_vector(const struct domain *d, unsigned int gsi)
+int cf_check vioapic_get_vector(const struct domain *d, unsigned int gsi)
 {
     unsigned int pin = 0; /* See gsi_vioapic */
     const struct hvm_vioapic *vioapic = gsi_vioapic(d, gsi, &pin);
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index fe375912bef1..652e3cb87f12 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -615,8 +615,9 @@ static uint32_t vlapic_read_aligned(const struct vlapic *vlapic,
     return 0;
 }
 
-static int vlapic_mmio_read(struct vcpu *v, unsigned long address,
-                            unsigned int len, unsigned long *pval)
+static int cf_check vlapic_mmio_read(
+    struct vcpu *v, unsigned long address, unsigned int len,
+    unsigned long *pval)
 {
     struct vlapic *vlapic = vcpu_vlapic(v);
     unsigned int offset = address - vlapic_base_address(vlapic);
@@ -898,8 +899,8 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
     }
 }
 
-static int vlapic_mmio_write(struct vcpu *v, unsigned long address,
-                             unsigned int len, unsigned long val)
+static int cf_check vlapic_mmio_write(
+    struct vcpu *v, unsigned long address, unsigned int len, unsigned long val)
 {
     struct vlapic *vlapic = vcpu_vlapic(v);
     unsigned int offset = address - vlapic_base_address(vlapic);
@@ -1052,7 +1053,7 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t msr_content)
     return X86EMUL_OKAY;
 }
 
-static int vlapic_range(struct vcpu *v, unsigned long addr)
+static int cf_check vlapic_range(struct vcpu *v, unsigned long addr)
 {
     struct vlapic *vlapic = vcpu_vlapic(v);
     unsigned long offset  = addr - vlapic_base_address(vlapic);
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 2889575a2035..d4a8c953e23f 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -211,8 +211,9 @@ static struct msi_desc *msixtbl_addr_to_desc(
     return NULL;
 }
 
-static int msixtbl_read(const struct hvm_io_handler *handler,
-                        uint64_t address, uint32_t len, uint64_t *pval)
+static int cf_check msixtbl_read(
+    const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
+    uint64_t *pval)
 {
     unsigned long offset;
     struct msixtbl_entry *entry;
@@ -350,14 +351,15 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
     return r;
 }
 
-static int _msixtbl_write(const struct hvm_io_handler *handler,
-                          uint64_t address, uint32_t len, uint64_t val)
+static int cf_check _msixtbl_write(
+    const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
+    uint64_t val)
 {
     return msixtbl_write(current, address, len, val);
 }
 
-static bool_t msixtbl_range(const struct hvm_io_handler *handler,
-                            const ioreq_t *r)
+static bool cf_check msixtbl_range(
+    const struct hvm_io_handler *handler, const ioreq_t *r)
 {
     struct vcpu *curr = current;
     unsigned long addr = r->addr;
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 91c2c6983393..5d8ef259b710 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -351,7 +351,7 @@ static uint32_t vpic_ioport_read(struct hvm_hw_vpic *vpic, uint32_t addr)
     return vpic->imr;
 }
 
-static int vpic_intercept_pic_io(
+static int cf_check vpic_intercept_pic_io(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
     struct hvm_hw_vpic *vpic;
@@ -373,7 +373,7 @@ static int vpic_intercept_pic_io(
     return X86EMUL_OKAY;
 }
 
-static int vpic_intercept_elcr_io(
+static int cf_check vpic_intercept_elcr_io(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
     struct hvm_hw_vpic *vpic;
diff --git a/xen/arch/x86/include/asm/hvm/vioapic.h b/xen/arch/x86/include/asm/hvm/vioapic.h
index 36b64d20d60c..2944ec20dd53 100644
--- a/xen/arch/x86/include/asm/hvm/vioapic.h
+++ b/xen/arch/x86/include/asm/hvm/vioapic.h
@@ -66,7 +66,7 @@ void vioapic_irq_positive_edge(struct domain *d, unsigned int irq);
 void vioapic_update_EOI(struct domain *d, u8 vector);
 
 int vioapic_get_mask(const struct domain *d, unsigned int gsi);
-int vioapic_get_vector(const struct domain *d, unsigned int gsi);
+int cf_check vioapic_get_vector(const struct domain *d, unsigned int gsi);
 int vioapic_get_trigger_mode(const struct domain *d, unsigned int gsi);
 
 #endif /* __ASM_X86_HVM_VIOAPIC_H__ */
diff --git a/xen/drivers/passthrough/amd/iommu_guest.c b/xen/drivers/passthrough/amd/iommu_guest.c
index 361ff864d846..80a331f546ed 100644
--- a/xen/drivers/passthrough/amd/iommu_guest.c
+++ b/xen/drivers/passthrough/amd/iommu_guest.c
@@ -645,8 +645,8 @@ static uint64_t iommu_mmio_read64(struct guest_iommu *iommu,
     return val;
 }
 
-static int guest_iommu_mmio_read(struct vcpu *v, unsigned long addr,
-                                 unsigned int len, unsigned long *pval)
+static int cf_check guest_iommu_mmio_read(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *pval)
 {
     struct guest_iommu *iommu = vcpu_iommu(v);
     unsigned long offset;
@@ -735,8 +735,8 @@ static void guest_iommu_mmio_write64(struct guest_iommu *iommu,
     }
 }
 
-static int guest_iommu_mmio_write(struct vcpu *v, unsigned long addr,
-                                  unsigned int len, unsigned long val)
+static int cf_check guest_iommu_mmio_write(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long val)
 {
     struct guest_iommu *iommu = vcpu_iommu(v);
     unsigned long offset;
@@ -819,7 +819,7 @@ static void guest_iommu_reg_init(struct guest_iommu *iommu)
     iommu->reg_ext_feature = ef;
 }
 
-static int guest_iommu_mmio_range(struct vcpu *v, unsigned long addr)
+static int cf_check guest_iommu_mmio_range(struct vcpu *v, unsigned long addr)
 {
     struct guest_iommu *iommu = vcpu_iommu(v);
 
-- 
2.11.0


