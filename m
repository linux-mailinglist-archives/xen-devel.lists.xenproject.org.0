Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ABB6DFE00
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 20:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520316.807809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfZ0-0003EH-Hs; Wed, 12 Apr 2023 18:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520316.807809; Wed, 12 Apr 2023 18:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfZ0-00039k-DP; Wed, 12 Apr 2023 18:51:26 +0000
Received: by outflank-mailman (input) for mailman id 520316;
 Wed, 12 Apr 2023 18:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ni7i=AD=desiato.srs.infradead.org=BATV+dd6f636cd48703d0a954+7171+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pmfYy-0001qS-Ki
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 18:51:24 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04a6bb6f-d963-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 20:51:22 +0200 (CEST)
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pmfYg-00E0VM-03; Wed, 12 Apr 2023 18:51:06 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pmfYe-001r1N-2D; Wed, 12 Apr 2023 19:51:04 +0100
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
X-Inumbo-ID: 04a6bb6f-d963-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=r0KrVFy8wO5hkkGDmOWYariQi9uMlzauvQswU3PX06g=; b=ksJ5J0ZCaGPS+w9bWo3qQ38f/f
	5dx1E09HdQlfCQ7zAQv5t2wDpola+fKSQIlh1VljOSAovETc/RoDS2hP3KrOuLWG9duJ5tX9z9DaW
	taNp+hP4l9lhhhObZc8K4m8DgnbwxhK9vx6czSEsBsDqOXqeXUDOEh28woBd+9HCM1BEPGXEaYzoV
	l8v2T/LFJWOzVC1kPWOvBjP7dR8xE41+HAp7IxxgMcgQzxkCQXqYiF9Rx2XJqYn6KM1GSM3i8zmw9
	2DVadTK32LRFcm29UdnVR0tSfHTiHb1bXNHb8L4WHF7YnzgGmkL7bxff29Izie8M7mcFw9H83AOyG
	9x+LnoVg==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/5] xen: Drop support for Xen versions below 4.7.1
Date: Wed, 12 Apr 2023 19:51:00 +0100
Message-Id: <20230412185102.441523-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412185102.441523-1-dwmw2@infradead.org>
References: <20230412185102.441523-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

In restructuring to allow for internal emulation of Xen functionality,
I broke compatibility for Xen 4.6 and earlier. Fix this by explicitly
removing support for anything older than 4.7.1, which is also ancient
but it does still build, and the compatibility support for it is fairly
unintrusive.

Fixes: 15e283c5b684 ("hw/xen: Add foreignmem operations to allow redirection to internal emulation")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xen/xen-operations.c     |  57 +------------------
 include/hw/xen/xen_native.h | 107 +-----------------------------------
 meson.build                 |   5 +-
 scripts/xen-detect.c        |  60 --------------------
 4 files changed, 3 insertions(+), 226 deletions(-)

diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
index 3d213d28df..e00983ec44 100644
--- a/hw/xen/xen-operations.c
+++ b/hw/xen/xen-operations.c
@@ -28,46 +28,13 @@
 #include <xenctrl.h>
 
 /*
- * We don't support Xen prior to 4.2.0.
+ * We don't support Xen prior to 4.7.1.
  */
 
-/* Xen 4.2 through 4.6 */
-#if CONFIG_XEN_CTRL_INTERFACE_VERSION < 40701
-
-typedef xc_evtchn xenevtchn_handle;
-typedef evtchn_port_or_error_t xenevtchn_port_or_error_t;
-
-#define xenevtchn_open(l, f) xc_evtchn_open(l, f);
-#define xenevtchn_close(h) xc_evtchn_close(h)
-#define xenevtchn_fd(h) xc_evtchn_fd(h)
-#define xenevtchn_pending(h) xc_evtchn_pending(h)
-#define xenevtchn_notify(h, p) xc_evtchn_notify(h, p)
-#define xenevtchn_bind_interdomain(h, d, p) xc_evtchn_bind_interdomain(h, d, p)
-#define xenevtchn_unmask(h, p) xc_evtchn_unmask(h, p)
-#define xenevtchn_unbind(h, p) xc_evtchn_unbind(h, p)
-
-typedef xc_gnttab xengnttab_handle;
-
-#define xengnttab_open(l, f) xc_gnttab_open(l, f)
-#define xengnttab_close(h) xc_gnttab_close(h)
-#define xengnttab_set_max_grants(h, n) xc_gnttab_set_max_grants(h, n)
-#define xengnttab_map_grant_ref(h, d, r, p) xc_gnttab_map_grant_ref(h, d, r, p)
-#define xengnttab_unmap(h, a, n) xc_gnttab_munmap(h, a, n)
-#define xengnttab_map_grant_refs(h, c, d, r, p) \
-    xc_gnttab_map_grant_refs(h, c, d, r, p)
-#define xengnttab_map_domain_grant_refs(h, c, d, r, p) \
-    xc_gnttab_map_domain_grant_refs(h, c, d, r, p)
-
-typedef xc_interface xenforeignmemory_handle;
-
-#else /* CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40701 */
-
 #include <xenevtchn.h>
 #include <xengnttab.h>
 #include <xenforeignmemory.h>
 
-#endif
-
 /* Xen before 4.8 */
 
 static int libxengnttab_fallback_grant_copy(xengnttab_handle *xgt,
@@ -223,26 +190,6 @@ static struct gnttab_backend_ops libxengnttab_backend_ops = {
     .unmap = libxengnttab_backend_unmap,
 };
 
-#if CONFIG_XEN_CTRL_INTERFACE_VERSION < 40701
-
-static void *libxenforeignmem_backend_map(uint32_t dom, void *addr, int prot,
-                                          size_t pages, xfn_pfn_t *pfns,
-                                          int *errs)
-{
-    if (errs) {
-        return xc_map_foreign_bulk(xen_xc, dom, prot, pfns, errs, pages);
-    } else {
-        return xc_map_foreign_pages(xen_xc, dom, prot, pfns, pages);
-    }
-}
-
-static int libxenforeignmem_backend_unmap(void *addr, size_t pages)
-{
-    return munmap(addr, pages * XC_PAGE_SIZE);
-}
-
-#else /* CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40701 */
-
 static void *libxenforeignmem_backend_map(uint32_t dom, void *addr, int prot,
                                           size_t pages, xen_pfn_t *pfns,
                                           int *errs)
@@ -256,8 +203,6 @@ static int libxenforeignmem_backend_unmap(void *addr, size_t pages)
     return xenforeignmemory_unmap(xen_fmem, addr, pages);
 }
 
-#endif
-
 struct foreignmem_backend_ops libxenforeignmem_backend_ops = {
     .map = libxenforeignmem_backend_map,
     .unmap = libxenforeignmem_backend_unmap,
diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
index 6bcc83baf9..f11eb423e3 100644
--- a/include/hw/xen/xen_native.h
+++ b/include/hw/xen/xen_native.h
@@ -24,23 +24,11 @@
 extern xc_interface *xen_xc;
 
 /*
- * We don't support Xen prior to 4.2.0.
+ * We don't support Xen prior to 4.7.1.
  */
 
-/* Xen 4.2 through 4.6 */
-#if CONFIG_XEN_CTRL_INTERFACE_VERSION < 40701
-
-typedef xc_interface xenforeignmemory_handle;
-
-#define xenforeignmemory_open(l, f) xen_xc
-#define xenforeignmemory_close(h)
-
-#else /* CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40701 */
-
 #include <xenforeignmemory.h>
 
-#endif
-
 extern xenforeignmemory_handle *xen_fmem;
 
 #if CONFIG_XEN_CTRL_INTERFACE_VERSION < 40900
@@ -148,8 +136,6 @@ static inline xendevicemodel_handle *xendevicemodel_open(
     return xen_xc;
 }
 
-#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40500
-
 static inline int xendevicemodel_create_ioreq_server(
     xendevicemodel_handle *dmod, domid_t domid, int handle_bufioreq,
     ioservid_t *id)
@@ -211,8 +197,6 @@ static inline int xendevicemodel_set_ioreq_server_state(
     return xc_hvm_set_ioreq_server_state(dmod, domid, id, enabled);
 }
 
-#endif /* CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40500 */
-
 static inline int xendevicemodel_set_pci_intx_level(
     xendevicemodel_handle *dmod, domid_t domid, uint16_t segment,
     uint8_t bus, uint8_t device, uint8_t intx, unsigned int level)
@@ -340,15 +324,6 @@ static inline int xen_get_vmport_regs_pfn(xc_interface *xc, domid_t dom,
 }
 #endif
 
-/* Xen before 4.6 */
-#if CONFIG_XEN_CTRL_INTERFACE_VERSION < 40600
-
-#ifndef HVM_IOREQSRV_BUFIOREQ_ATOMIC
-#define HVM_IOREQSRV_BUFIOREQ_ATOMIC 2
-#endif
-
-#endif
-
 static inline int xen_get_default_ioreq_server_info(domid_t dom,
                                                     xen_pfn_t *ioreq_pfn,
                                                     xen_pfn_t *bufioreq_pfn,
@@ -386,84 +361,6 @@ static inline int xen_get_default_ioreq_server_info(domid_t dom,
     return 0;
 }
 
-/* Xen before 4.5 */
-#if CONFIG_XEN_CTRL_INTERFACE_VERSION < 40500
-
-#ifndef HVM_PARAM_BUFIOREQ_EVTCHN
-#define HVM_PARAM_BUFIOREQ_EVTCHN 26
-#endif
-
-#define IOREQ_TYPE_PCI_CONFIG 2
-
-typedef uint16_t ioservid_t;
-
-static inline void xen_map_memory_section(domid_t dom,
-                                          ioservid_t ioservid,
-                                          MemoryRegionSection *section)
-{
-}
-
-static inline void xen_unmap_memory_section(domid_t dom,
-                                            ioservid_t ioservid,
-                                            MemoryRegionSection *section)
-{
-}
-
-static inline void xen_map_io_section(domid_t dom,
-                                      ioservid_t ioservid,
-                                      MemoryRegionSection *section)
-{
-}
-
-static inline void xen_unmap_io_section(domid_t dom,
-                                        ioservid_t ioservid,
-                                        MemoryRegionSection *section)
-{
-}
-
-static inline void xen_map_pcidev(domid_t dom,
-                                  ioservid_t ioservid,
-                                  PCIDevice *pci_dev)
-{
-}
-
-static inline void xen_unmap_pcidev(domid_t dom,
-                                    ioservid_t ioservid,
-                                    PCIDevice *pci_dev)
-{
-}
-
-static inline void xen_create_ioreq_server(domid_t dom,
-                                           ioservid_t *ioservid)
-{
-}
-
-static inline void xen_destroy_ioreq_server(domid_t dom,
-                                            ioservid_t ioservid)
-{
-}
-
-static inline int xen_get_ioreq_server_info(domid_t dom,
-                                            ioservid_t ioservid,
-                                            xen_pfn_t *ioreq_pfn,
-                                            xen_pfn_t *bufioreq_pfn,
-                                            evtchn_port_t *bufioreq_evtchn)
-{
-    return xen_get_default_ioreq_server_info(dom, ioreq_pfn,
-                                             bufioreq_pfn,
-                                             bufioreq_evtchn);
-}
-
-static inline int xen_set_ioreq_server_state(domid_t dom,
-                                             ioservid_t ioservid,
-                                             bool enable)
-{
-    return 0;
-}
-
-/* Xen 4.5 */
-#else
-
 static bool use_default_ioreq_server;
 
 static inline void xen_map_memory_section(domid_t dom,
@@ -624,6 +521,4 @@ static inline int xen_set_ioreq_server_state(domid_t dom,
                                                  enable);
 }
 
-#endif
-
 #endif /* QEMU_HW_XEN_NATIVE_H */
diff --git a/meson.build b/meson.build
index c44d05a13f..1f223ae7fc 100644
--- a/meson.build
+++ b/meson.build
@@ -1425,16 +1425,13 @@ if get_option('xen').enabled() or (get_option('xen').auto() and have_system)
     endif
   endif
   if not xen.found()
-    xen_tests = [ '4.11.0', '4.10.0', '4.9.0', '4.8.0', '4.7.1', '4.6.0', '4.5.0', '4.2.0' ]
+    xen_tests = [ '4.11.0', '4.10.0', '4.9.0', '4.8.0', '4.7.1' ]
     xen_libs = {
       '4.11.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 'xenforeignmemory', 'xengnttab', 'xenevtchn', 'xentoolcore' ],
       '4.10.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 'xenforeignmemory', 'xengnttab', 'xenevtchn', 'xentoolcore' ],
       '4.9.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 'xenforeignmemory', 'xengnttab', 'xenevtchn' ],
       '4.8.0': [ 'xenstore', 'xenctrl', 'xenforeignmemory', 'xengnttab', 'xenevtchn' ],
       '4.7.1': [ 'xenstore', 'xenctrl', 'xenforeignmemory', 'xengnttab', 'xenevtchn' ],
-      '4.6.0': [ 'xenstore', 'xenctrl' ],
-      '4.5.0': [ 'xenstore', 'xenctrl' ],
-      '4.2.0': [ 'xenstore', 'xenctrl' ],
     }
     xen_deps = {}
     foreach ver: xen_tests
diff --git a/scripts/xen-detect.c b/scripts/xen-detect.c
index 85e8206490..db049e605c 100644
--- a/scripts/xen-detect.c
+++ b/scripts/xen-detect.c
@@ -138,66 +138,6 @@
     return 0;
   }
 
-#elif CONFIG_XEN_CTRL_INTERFACE_VERSION == 40600
-  #include <xenctrl.h>
-  #include <xenstore.h>
-  #include <stdint.h>
-  #include <xen/hvm/hvm_info_table.h>
-  #if !defined(HVM_MAX_VCPUS)
-  # error HVM_MAX_VCPUS not defined
-  #endif
-  int main(void) {
-    xc_interface *xc;
-    xs_daemon_open();
-    xc = xc_interface_open(0, 0, 0);
-    xc_hvm_set_mem_type(0, 0, HVMMEM_ram_ro, 0, 0);
-    xc_gnttab_open(NULL, 0);
-    xc_domain_add_to_physmap(0, 0, XENMAPSPACE_gmfn, 0, 0);
-    xc_hvm_inject_msi(xc, 0, 0xf0000000, 0x00000000);
-    xc_hvm_create_ioreq_server(xc, 0, HVM_IOREQSRV_BUFIOREQ_ATOMIC, NULL);
-    xc_reserved_device_memory_map(xc, 0, 0, 0, 0, NULL, 0);
-    return 0;
-  }
-
-#elif CONFIG_XEN_CTRL_INTERFACE_VERSION == 40500
-  #include <xenctrl.h>
-  #include <xenstore.h>
-  #include <stdint.h>
-  #include <xen/hvm/hvm_info_table.h>
-  #if !defined(HVM_MAX_VCPUS)
-  # error HVM_MAX_VCPUS not defined
-  #endif
-  int main(void) {
-    xc_interface *xc;
-    xs_daemon_open();
-    xc = xc_interface_open(0, 0, 0);
-    xc_hvm_set_mem_type(0, 0, HVMMEM_ram_ro, 0, 0);
-    xc_gnttab_open(NULL, 0);
-    xc_domain_add_to_physmap(0, 0, XENMAPSPACE_gmfn, 0, 0);
-    xc_hvm_inject_msi(xc, 0, 0xf0000000, 0x00000000);
-    xc_hvm_create_ioreq_server(xc, 0, 0, NULL);
-    return 0;
-  }
-
-#elif CONFIG_XEN_CTRL_INTERFACE_VERSION == 40200
-  #include <xenctrl.h>
-  #include <xenstore.h>
-  #include <stdint.h>
-  #include <xen/hvm/hvm_info_table.h>
-  #if !defined(HVM_MAX_VCPUS)
-  # error HVM_MAX_VCPUS not defined
-  #endif
-  int main(void) {
-    xc_interface *xc;
-    xs_daemon_open();
-    xc = xc_interface_open(0, 0, 0);
-    xc_hvm_set_mem_type(0, 0, HVMMEM_ram_ro, 0, 0);
-    xc_gnttab_open(NULL, 0);
-    xc_domain_add_to_physmap(0, 0, XENMAPSPACE_gmfn, 0, 0);
-    xc_hvm_inject_msi(xc, 0, 0xf0000000, 0x00000000);
-    return 0;
-  }
-
 #else
 #error invalid CONFIG_XEN_CTRL_INTERFACE_VERSION
 #endif
-- 
2.39.2


