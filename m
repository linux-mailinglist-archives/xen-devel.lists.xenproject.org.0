Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4182E24EC91
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:46:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9maA-00087o-Dx; Sun, 23 Aug 2020 09:46:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mQP-0004sy-Go
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:36:29 +0000
X-Inumbo-ID: 8a1f53b2-e71a-4aee-bc0b-62ee9be74759
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a1f53b2-e71a-4aee-bc0b-62ee9be74759;
 Sun, 23 Aug 2020 09:35:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C170AB725;
 Sun, 23 Aug 2020 09:35:55 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v3 25/38] tools/xenpaging: remove libxc internals
Date: Sun, 23 Aug 2020 11:35:06 +0200
Message-Id: <20200823093519.18386-26-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
References: <20200823093519.18386-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

xenpaging is using libxc internals. Fix that.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenpaging/Makefile         |  3 +-
 tools/xenpaging/file_ops.c       |  8 ++--
 tools/xenpaging/pagein.c         |  2 +-
 tools/xenpaging/policy_default.c |  2 +-
 tools/xenpaging/xenpaging.c      | 32 +++++++--------
 tools/xenpaging/xenpaging.h      | 70 +++++++++++++++++++++++++++++++-
 6 files changed, 92 insertions(+), 25 deletions(-)

diff --git a/tools/xenpaging/Makefile b/tools/xenpaging/Makefile
index 968678c4e8..04743b335c 100644
--- a/tools/xenpaging/Makefile
+++ b/tools/xenpaging/Makefile
@@ -1,8 +1,7 @@
 XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-# xenpaging.c and file_ops.c incorrectly use libxc internals
-CFLAGS += $(CFLAGS_libxentoollog) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenctrl) $(CFLAGS_libxenstore) $(PTHREAD_CFLAGS) -I$(XEN_ROOT)/tools/libxc $(CFLAGS_libxencall)
+CFLAGS += $(CFLAGS_libxentoollog) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenctrl) $(CFLAGS_libxenstore) $(PTHREAD_CFLAGS) $(CFLAGS_libxencall)
 LDLIBS += $(LDLIBS_libxentoollog) $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenstore) $(PTHREAD_LIBS)
 LDFLAGS += $(PTHREAD_LDFLAGS)
 
diff --git a/tools/xenpaging/file_ops.c b/tools/xenpaging/file_ops.c
index 8210f426df..301fb3427c 100644
--- a/tools/xenpaging/file_ops.c
+++ b/tools/xenpaging/file_ops.c
@@ -20,7 +20,7 @@
 
 
 #include <unistd.h>
-#include <xc_private.h>
+#include <xenctrl.h>
 
 static int file_op(int fd, void *page, int i,
                    ssize_t (*fn)(int, void *, size_t))
@@ -29,13 +29,13 @@ static int file_op(int fd, void *page, int i,
     int total = 0;
     int bytes;
 
-    offset = lseek(fd, offset << PAGE_SHIFT, SEEK_SET);
+    offset = lseek(fd, offset << XC_PAGE_SHIFT, SEEK_SET);
     if ( offset == (off_t)-1 )
         return -1;
 
-    while ( total < PAGE_SIZE )
+    while ( total < XC_PAGE_SIZE )
     {
-        bytes = fn(fd, page + total, PAGE_SIZE - total);
+        bytes = fn(fd, page + total, XC_PAGE_SIZE - total);
         if ( bytes <= 0 )
             return -1;
 
diff --git a/tools/xenpaging/pagein.c b/tools/xenpaging/pagein.c
index 2a298b436c..1c8a7d983d 100644
--- a/tools/xenpaging/pagein.c
+++ b/tools/xenpaging/pagein.c
@@ -43,7 +43,7 @@ static void *page_in(void *arg)
         /* Ignore errors */
         page = xc_map_foreign_pages(pia->xch, pia->dom, PROT_READ, gfns, num);
         if (page)
-            munmap(page, PAGE_SIZE * num);
+            munmap(page, XC_PAGE_SIZE * num);
     }
     page_in_possible = 0;
     pthread_exit(NULL);
diff --git a/tools/xenpaging/policy_default.c b/tools/xenpaging/policy_default.c
index 3324835957..979d251230 100644
--- a/tools/xenpaging/policy_default.c
+++ b/tools/xenpaging/policy_default.c
@@ -18,8 +18,8 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <errno.h>
 
-#include "xc_bitops.h"
 #include "policy.h"
 
 
diff --git a/tools/xenpaging/xenpaging.c b/tools/xenpaging/xenpaging.c
index d0571cabac..33098046c2 100644
--- a/tools/xenpaging/xenpaging.c
+++ b/tools/xenpaging/xenpaging.c
@@ -30,7 +30,6 @@
 #include <xenstore.h>
 #include <getopt.h>
 
-#include "xc_bitops.h"
 #include "file_ops.h"
 #include "policy.h"
 #include "xenpaging.h"
@@ -183,12 +182,12 @@ static void *init_page(void)
     void *buffer;
 
     /* Allocated page memory */
-    errno = posix_memalign(&buffer, PAGE_SIZE, PAGE_SIZE);
+    errno = posix_memalign(&buffer, XC_PAGE_SIZE, XC_PAGE_SIZE);
     if ( errno != 0 )
         return NULL;
 
     /* Lock buffer in memory so it can't be paged out */
-    if ( mlock(buffer, PAGE_SIZE) < 0 )
+    if ( mlock(buffer, XC_PAGE_SIZE) < 0 )
     {
         free(buffer);
         buffer = NULL;
@@ -277,7 +276,6 @@ static struct xenpaging *xenpaging_init(int argc, char *argv[])
     struct xenpaging *paging;
     xc_domaininfo_t domain_info;
     xc_interface *xch = NULL;
-    xentoollog_logger *dbg = NULL;
     char *p;
     int rc;
     unsigned long ring_pfn, mmap_pfn;
@@ -291,12 +289,11 @@ static struct xenpaging *xenpaging_init(int argc, char *argv[])
     if ( xenpaging_getopts(paging, argc, argv) )
         goto err;
 
-    /* Enable debug output */
-    if ( paging->debug )
-        dbg = (xentoollog_logger *)xtl_createlogger_stdiostream(stderr, XTL_DEBUG, 0);
+    paging->logger = (xentoollog_logger *)xtl_createlogger_stdiostream(stderr,
+                         paging->debug ? XTL_DEBUG : XTL_PROGRESS, 0);
 
     /* Open connection to xen */
-    paging->xc_handle = xch = xc_interface_open(dbg, NULL, 0);
+    paging->xc_handle = xch = xc_interface_open(paging->logger, NULL, 0);
     if ( !xch )
         goto err;
 
@@ -416,7 +413,7 @@ static struct xenpaging *xenpaging_init(int argc, char *argv[])
     SHARED_RING_INIT((vm_event_sring_t *)paging->vm_event.ring_page);
     BACK_RING_INIT(&paging->vm_event.back_ring,
                    (vm_event_sring_t *)paging->vm_event.ring_page,
-                   PAGE_SIZE);
+                   XC_PAGE_SIZE);
 
     /* Now that the ring is set, remove it from the guest's physmap */
     if ( xc_domain_decrease_reservation_exact(xch, 
@@ -490,15 +487,17 @@ static struct xenpaging *xenpaging_init(int argc, char *argv[])
             xs_close(paging->xs_handle);
         if ( xch )
             xc_interface_close(xch);
+        if ( paging->logger )
+            xtl_logger_destroy(paging->logger);
         if ( paging->paging_buffer )
         {
-            munlock(paging->paging_buffer, PAGE_SIZE);
+            munlock(paging->paging_buffer, XC_PAGE_SIZE);
             free(paging->paging_buffer);
         }
 
         if ( paging->vm_event.ring_page )
         {
-            munmap(paging->vm_event.ring_page, PAGE_SIZE);
+            munmap(paging->vm_event.ring_page, XC_PAGE_SIZE);
         }
 
         free(dom_path);
@@ -523,7 +522,7 @@ static void xenpaging_teardown(struct xenpaging *paging)
 
     paging->xc_handle = NULL;
     /* Tear down domain paging in Xen */
-    munmap(paging->vm_event.ring_page, PAGE_SIZE);
+    munmap(paging->vm_event.ring_page, XC_PAGE_SIZE);
     rc = xc_mem_paging_disable(xch, paging->vm_event.domain_id);
     if ( rc != 0 )
     {
@@ -551,6 +550,8 @@ static void xenpaging_teardown(struct xenpaging *paging)
 
     /* Close connection to Xen */
     xc_interface_close(xch);
+
+    xtl_logger_destroy(paging->logger);
 }
 
 static void get_request(struct vm_event *vm_event, vm_event_request_t *req)
@@ -598,8 +599,7 @@ static int xenpaging_evict_page(struct xenpaging *paging, unsigned long gfn, int
     void *page;
     xen_pfn_t victim = gfn;
     int ret;
-
-    DECLARE_DOMCTL;
+    struct xen_domctl domctl;
 
     /* Nominate page */
     ret = xc_mem_paging_nominate(xch, paging->vm_event.domain_id, gfn);
@@ -627,13 +627,13 @@ static int xenpaging_evict_page(struct xenpaging *paging, unsigned long gfn, int
     if ( ret < 0 )
     {
         PERROR("Error copying page %lx", gfn);
-        munmap(page, PAGE_SIZE);
+        munmap(page, XC_PAGE_SIZE);
         ret = -1;
         goto out;
     }
 
     /* Release page */
-    munmap(page, PAGE_SIZE);
+    munmap(page, XC_PAGE_SIZE);
 
     /* Tell Xen to evict page */
     ret = xc_mem_paging_evict(xch, paging->vm_event.domain_id, gfn);
diff --git a/tools/xenpaging/xenpaging.h b/tools/xenpaging/xenpaging.h
index d6c8ee5221..e0fc7b31b8 100644
--- a/tools/xenpaging/xenpaging.h
+++ b/tools/xenpaging/xenpaging.h
@@ -23,11 +23,17 @@
 #ifndef __XEN_PAGING2_H__
 #define __XEN_PAGING2_H__
 
+#include <malloc.h>
+#include <string.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <sys/mman.h>
 
 #include <xenevtchn.h>
 #define XC_WANT_COMPAT_MAP_FOREIGN_API
 #include <xenctrl.h>
-#include <xc_private.h>
+// #include <xc_private.h>
 #include <xen/event_channel.h>
 #include <xen/vm_event.h>
 
@@ -44,6 +50,7 @@ struct vm_event {
 
 struct xenpaging {
     xc_interface *xc_handle;
+    xentoollog_logger *logger;
     struct xs_handle *xs_handle;
 
     unsigned long *bitmap;
@@ -67,9 +74,70 @@ struct xenpaging {
     unsigned long pagein_queue[XENPAGING_PAGEIN_QUEUE_SIZE];
 };
 
+#define DPRINTF(msg, args...) xtl_log(paging->logger, XTL_DETAIL, 0,      \
+                                      "paging", msg, ## args)
+#define ERROR(msg, args...)   xtl_log(paging->logger, XTL_ERROR, -1,      \
+                                      "paging", msg, ## args)
+#define PERROR(msg, args...)  xtl_log(paging->logger, XTL_ERROR, -1,      \
+                                      "paging", msg "(%d = %s)", ## args, \
+                                      errno, strerror(errno))
+
 extern void create_page_in_thread(struct xenpaging *paging);
 extern void page_in_trigger(void);
 
+#define BITS_PER_LONG (sizeof(unsigned long) * 8)
+#define ORDER_LONG (sizeof(unsigned long) == 4 ? 5 : 6)
+
+#define BITMAP_ENTRY(_nr,_bmap) ((_bmap))[(_nr) / 8]
+#define BITMAP_SHIFT(_nr) ((_nr) % 8)
+
+static inline int bitmap_size(int nr_bits)
+{
+    return (nr_bits + 7) / 8;
+}
+
+static inline void *bitmap_alloc(int nr_bits)
+{
+    return calloc(1, bitmap_size(nr_bits));
+}
+
+static inline void bitmap_clear(void *addr, int nr_bits)
+{
+    memset(addr, 0, bitmap_size(nr_bits));
+}
+
+static inline int test_bit(int nr, const void *_addr)
+{
+    const char *addr = _addr;
+    return (BITMAP_ENTRY(nr, addr) >> BITMAP_SHIFT(nr)) & 1;
+}
+
+static inline void clear_bit(int nr, void *_addr)
+{
+    char *addr = _addr;
+    BITMAP_ENTRY(nr, addr) &= ~(1UL << BITMAP_SHIFT(nr));
+}
+
+static inline void set_bit(int nr, void *_addr)
+{
+    char *addr = _addr;
+    BITMAP_ENTRY(nr, addr) |= (1UL << BITMAP_SHIFT(nr));
+}
+
+static inline int test_and_clear_bit(int nr, void *addr)
+{
+    int oldbit = test_bit(nr, addr);
+    clear_bit(nr, addr);
+    return oldbit;
+}
+
+static inline int test_and_set_bit(int nr, void *addr)
+{
+    int oldbit = test_bit(nr, addr);
+    set_bit(nr, addr);
+    return oldbit;
+}
+
 #endif // __XEN_PAGING_H__
 
 
-- 
2.26.2


