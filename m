Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676B464F120
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 19:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464941.723544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FcP-0005ym-PU; Fri, 16 Dec 2022 18:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464941.723544; Fri, 16 Dec 2022 18:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FcP-0005vX-Kr; Fri, 16 Dec 2022 18:39:37 +0000
Received: by outflank-mailman (input) for mailman id 464941;
 Fri, 16 Dec 2022 18:35:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdjE=4O=citrix.com=prvs=342889366=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p6FPa-0008JE-Dy
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 18:26:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fb14ebb-7d6f-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 19:26:14 +0100 (CET)
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
X-Inumbo-ID: 1fb14ebb-7d6f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671215174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=43htUyT5zJNBMNd/O6puhdKDrPp+z/Z8IQ7WLLLsTDY=;
  b=Ufi/BM55imJJEYzEJWzPfskGKD3tOYu3UK0YZejdLzeVXwNTQcG2zTp/
   Tz8x2WrfapuHMUmlkuWhNwS1CDsKc4iy+O30c1m6h6brLuiVYKnLNp/tD
   4MLHb1ar43u4Tum6aGV4ljrPb7Di4gNjiGfjfI5L2YVS+cbrQlRaqg90S
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87767483
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oJP66aJB43n9sLCIFE+R2JUlxSXFcZb7ZxGr2PjKsXjdYENS3mYFy
 2sZW2rTP/mMNmWmLtglbozl9htX7JPRmoNlQFNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5AVgPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5XUF5v+
 eA8DAoxUVOOmLuWh5X8EOlz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLozkPmpgD/jdCdfq3qepLYt4niVxwt0uFToGIqKJYLVGZUO9qqej
 n/r1nbzKUoaD42C0H2u8VHziuTDljyuDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWV9tBJ
 mQO9yEprKx081akJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3pfFkhK+JQwxF1M9JiIbFCtCxJ65oJ5m23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3Y1R/HNFBz3oRZPmLy8BxkgTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27CamNNIsXM8gpKFHvEMRSiam4hjCFraTRuftnZ
 cfznTiEUx729piLPBLpHrxAgNfHNwg1xH/JRICT8vhU+eP2WZJhcp9caAHmRrlgvMu5TPD9r
 4432z2il08OD4UTo0D/reYuELz9BSRjVM2r95EJKb7rz8gPMDhJNsI9CIgJI+RN95m5XM+Sp
 hlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:LoPF4KvWK6BUV07yWu/FK3tc7skDTNV00zEX/kB9WHVpmszxra
 GTdZMgpGfJYVcqKQgdcL+7Scq9qB/nmqKdpLNhWYtKPzOW3ldATrsSj7cKqgeIc0aVm4JgPO
 VbAs9D4bXLfCNHZK3BgDVQfexP/DD+ytHMudvj
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="87767483"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 04/11] tools/ocaml: run "make format"
Date: Fri, 16 Dec 2022 18:25:13 +0000
Message-ID: <4b3dd5f56f1ffb329594d3f6729b57a4431a31b6.1671214525.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671214525.git.edwin.torok@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edwin.torok@cloud.com>

`git log -p -1 -w` proves the change here is only whitespace.

No functional change.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
Changes since v3
* split into its own commit to make it easier to refresh when rebasing
---
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c |  194 +-
 tools/ocaml/libs/mmap/mmap_stubs.h            |    4 +-
 tools/ocaml/libs/mmap/xenmmap.ml              |    2 +-
 tools/ocaml/libs/mmap/xenmmap.mli             |    4 +-
 tools/ocaml/libs/mmap/xenmmap_stubs.c         |  112 +-
 tools/ocaml/libs/xb/op.ml                     |   76 +-
 tools/ocaml/libs/xb/packet.ml                 |   30 +-
 tools/ocaml/libs/xb/partial.ml                |   48 +-
 tools/ocaml/libs/xb/xb.ml                     |  416 ++--
 tools/ocaml/libs/xb/xb.mli                    |  106 +-
 tools/ocaml/libs/xb/xenbus_stubs.c            |   50 +-
 tools/ocaml/libs/xb/xs_ring.ml                |   28 +-
 tools/ocaml/libs/xb/xs_ring_stubs.c           |  214 +-
 tools/ocaml/libs/xc/xenctrl.ml                |  326 +--
 tools/ocaml/libs/xc/xenctrl.mli               |   12 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c           | 1556 ++++++-------
 tools/ocaml/libs/xentoollog/caml_xentoollog.h |    6 +-
 .../ocaml/libs/xentoollog/xentoollog_stubs.c  |  196 +-
 tools/ocaml/libs/xl/xenlight_stubs.c          | 2022 ++++++++---------
 tools/ocaml/libs/xs/queueop.ml                |   48 +-
 tools/ocaml/libs/xs/xs.ml                     |  220 +-
 tools/ocaml/libs/xs/xs.mli                    |   46 +-
 tools/ocaml/libs/xs/xsraw.ml                  |  300 +--
 tools/ocaml/libs/xs/xst.ml                    |   76 +-
 tools/ocaml/libs/xs/xst.mli                   |   20 +-
 tools/ocaml/test/dmesg.ml                     |   26 +-
 tools/ocaml/test/list_domains.ml              |    4 +-
 tools/ocaml/test/raise_exception.ml           |    4 +-
 tools/ocaml/test/xtl.ml                       |   28 +-
 tools/ocaml/xenstored/config.ml               |  156 +-
 tools/ocaml/xenstored/connection.ml           |  578 ++---
 tools/ocaml/xenstored/connections.ml          |  294 +--
 tools/ocaml/xenstored/disk.ml                 |  218 +-
 tools/ocaml/xenstored/domain.ml               |  116 +-
 tools/ocaml/xenstored/domains.ml              |  298 +--
 tools/ocaml/xenstored/event.ml                |   28 +-
 tools/ocaml/xenstored/history.ml              |   62 +-
 tools/ocaml/xenstored/logging.ml              |  478 ++--
 tools/ocaml/xenstored/packet.ml               |   20 +-
 tools/ocaml/xenstored/parse_arg.ml            |  106 +-
 tools/ocaml/xenstored/perms.ml                |  216 +-
 tools/ocaml/xenstored/poll.ml                 |   68 +-
 tools/ocaml/xenstored/poll.mli                |    4 +-
 tools/ocaml/xenstored/process.ml              | 1210 +++++-----
 tools/ocaml/xenstored/quota.ml                |   74 +-
 tools/ocaml/xenstored/select_stubs.c          |   62 +-
 tools/ocaml/xenstored/stdext.ml               |  190 +-
 tools/ocaml/xenstored/store.ml                |  752 +++---
 tools/ocaml/xenstored/symbol.ml               |    2 +-
 tools/ocaml/xenstored/syslog.ml               |   48 +-
 tools/ocaml/xenstored/syslog_stubs.c          |   68 +-
 tools/ocaml/xenstored/systemd_stubs.c         |   10 +-
 tools/ocaml/xenstored/transaction.ml          |  352 +--
 tools/ocaml/xenstored/trie.ml                 |  222 +-
 tools/ocaml/xenstored/trie.mli                |   22 +-
 tools/ocaml/xenstored/utils.ml                |  146 +-
 tools/ocaml/xenstored/xenstored.ml            |  978 ++++----
 57 files changed, 6476 insertions(+), 6476 deletions(-)

diff --git a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
index aa8a69cc1e..707406cbd1 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
+++ b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
@@ -37,171 +37,171 @@
 
 static void stub_evtchn_finalize(value v)
 {
-	xenevtchn_close(_H(v));
+    xenevtchn_close(_H(v));
 }
 
 static struct custom_operations xenevtchn_ops = {
-	.identifier  = "xenevtchn",
-	.finalize    = stub_evtchn_finalize,
-	.compare     = custom_compare_default,     /* Can't compare     */
-	.hash        = custom_hash_default,        /* Can't hash        */
-	.serialize   = custom_serialize_default,   /* Can't serialize   */
-	.deserialize = custom_deserialize_default, /* Can't deserialize */
-	.compare_ext = custom_compare_ext_default, /* Can't compare     */
+    .identifier  = "xenevtchn",
+    .finalize    = stub_evtchn_finalize,
+    .compare     = custom_compare_default,     /* Can't compare     */
+    .hash        = custom_hash_default,        /* Can't hash        */
+    .serialize   = custom_serialize_default,   /* Can't serialize   */
+    .deserialize = custom_deserialize_default, /* Can't deserialize */
+    .compare_ext = custom_compare_ext_default, /* Can't compare     */
 };
 
 CAMLprim value stub_eventchn_init(value cloexec)
 {
-	CAMLparam1(cloexec);
-	CAMLlocal1(result);
-	xenevtchn_handle *xce;
-	unsigned int flags = 0;
+    CAMLparam1(cloexec);
+    CAMLlocal1(result);
+    xenevtchn_handle *xce;
+    unsigned int flags = 0;
 
-	if ( !Bool_val(cloexec) )
-		flags |= XENEVTCHN_NO_CLOEXEC;
+    if ( !Bool_val(cloexec) )
+        flags |= XENEVTCHN_NO_CLOEXEC;
 
-	caml_enter_blocking_section();
-	xce = xenevtchn_open(NULL, flags);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    xce = xenevtchn_open(NULL, flags);
+    caml_leave_blocking_section();
 
-	if (xce == NULL)
-		caml_failwith("open failed");
+    if (xce == NULL)
+        caml_failwith("open failed");
 
-	result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 0, 1);
-	_H(result) = xce;
+    result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 0, 1);
+    _H(result) = xce;
 
-	CAMLreturn(result);
+    CAMLreturn(result);
 }
 
 CAMLprim value stub_eventchn_fdopen(value fdval)
 {
-	CAMLparam1(fdval);
-	CAMLlocal1(result);
-	xenevtchn_handle *xce;
+    CAMLparam1(fdval);
+    CAMLlocal1(result);
+    xenevtchn_handle *xce;
 
-	caml_enter_blocking_section();
-	xce = xenevtchn_fdopen(NULL, Int_val(fdval), 0);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    xce = xenevtchn_fdopen(NULL, Int_val(fdval), 0);
+    caml_leave_blocking_section();
 
-	if (xce == NULL)
-		caml_failwith("evtchn fdopen failed");
+    if (xce == NULL)
+        caml_failwith("evtchn fdopen failed");
 
-	result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 0, 1);
-	_H(result) = xce;
+    result = caml_alloc_custom(&xenevtchn_ops, sizeof(xce), 0, 1);
+    _H(result) = xce;
 
-	CAMLreturn(result);
+    CAMLreturn(result);
 }
 
 CAMLprim value stub_eventchn_fd(value xce)
 {
-	CAMLparam1(xce);
-	CAMLlocal1(result);
-	int fd;
+    CAMLparam1(xce);
+    CAMLlocal1(result);
+    int fd;
 
-	fd = xenevtchn_fd(_H(xce));
-	if (fd == -1)
-		caml_failwith("evtchn fd failed");
+    fd = xenevtchn_fd(_H(xce));
+    if (fd == -1)
+        caml_failwith("evtchn fd failed");
 
-	result = Val_int(fd);
+    result = Val_int(fd);
 
-	CAMLreturn(result);
+    CAMLreturn(result);
 }
 
 CAMLprim value stub_eventchn_notify(value xce, value port)
 {
-	CAMLparam2(xce, port);
-	int rc;
+    CAMLparam2(xce, port);
+    int rc;
 
-	caml_enter_blocking_section();
-	rc = xenevtchn_notify(_H(xce), Int_val(port));
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    rc = xenevtchn_notify(_H(xce), Int_val(port));
+    caml_leave_blocking_section();
 
-	if (rc == -1)
-		caml_failwith("evtchn notify failed");
+    if (rc == -1)
+        caml_failwith("evtchn notify failed");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_eventchn_bind_interdomain(value xce, value domid,
                                               value remote_port)
 {
-	CAMLparam3(xce, domid, remote_port);
-	CAMLlocal1(port);
-	xenevtchn_port_or_error_t rc;
+    CAMLparam3(xce, domid, remote_port);
+    CAMLlocal1(port);
+    xenevtchn_port_or_error_t rc;
 
-	caml_enter_blocking_section();
-	rc = xenevtchn_bind_interdomain(_H(xce), Int_val(domid), Int_val(remote_port));
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    rc = xenevtchn_bind_interdomain(_H(xce), Int_val(domid), Int_val(remote_port));
+    caml_leave_blocking_section();
 
-	if (rc == -1)
-		caml_failwith("evtchn bind_interdomain failed");
-	port = Val_int(rc);
+    if (rc == -1)
+        caml_failwith("evtchn bind_interdomain failed");
+    port = Val_int(rc);
 
-	CAMLreturn(port);
+    CAMLreturn(port);
 }
 
 CAMLprim value stub_eventchn_bind_virq(value xce, value virq_type)
 {
-	CAMLparam2(xce, virq_type);
-	CAMLlocal1(port);
-	xenevtchn_port_or_error_t rc;
+    CAMLparam2(xce, virq_type);
+    CAMLlocal1(port);
+    xenevtchn_port_or_error_t rc;
 
-	caml_enter_blocking_section();
-	rc = xenevtchn_bind_virq(_H(xce), Int_val(virq_type));
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    rc = xenevtchn_bind_virq(_H(xce), Int_val(virq_type));
+    caml_leave_blocking_section();
 
-	if (rc == -1)
-		caml_failwith("evtchn bind_virq failed");
-	port = Val_int(rc);
+    if (rc == -1)
+        caml_failwith("evtchn bind_virq failed");
+    port = Val_int(rc);
 
-	CAMLreturn(port);
+    CAMLreturn(port);
 }
 
 CAMLprim value stub_eventchn_unbind(value xce, value port)
 {
-	CAMLparam2(xce, port);
-	int rc;
+    CAMLparam2(xce, port);
+    int rc;
 
-	caml_enter_blocking_section();
-	rc = xenevtchn_unbind(_H(xce), Int_val(port));
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    rc = xenevtchn_unbind(_H(xce), Int_val(port));
+    caml_leave_blocking_section();
 
-	if (rc == -1)
-		caml_failwith("evtchn unbind failed");
+    if (rc == -1)
+        caml_failwith("evtchn unbind failed");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_eventchn_pending(value xce)
 {
-	CAMLparam1(xce);
-	CAMLlocal1(result);
-	xenevtchn_port_or_error_t port;
+    CAMLparam1(xce);
+    CAMLlocal1(result);
+    xenevtchn_port_or_error_t port;
 
-	caml_enter_blocking_section();
-	port = xenevtchn_pending(_H(xce));
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    port = xenevtchn_pending(_H(xce));
+    caml_leave_blocking_section();
 
-	if (port == -1)
-		caml_failwith("evtchn pending failed");
-	result = Val_int(port);
+    if (port == -1)
+        caml_failwith("evtchn pending failed");
+    result = Val_int(port);
 
-	CAMLreturn(result);
+    CAMLreturn(result);
 }
 
 CAMLprim value stub_eventchn_unmask(value xce, value _port)
 {
-	CAMLparam2(xce, _port);
-	evtchn_port_t port;
-	int rc;
+    CAMLparam2(xce, _port);
+    evtchn_port_t port;
+    int rc;
 
-	port = Int_val(_port);
+    port = Int_val(_port);
 
-	caml_enter_blocking_section();
-	rc = xenevtchn_unmask(_H(xce), port);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    rc = xenevtchn_unmask(_H(xce), port);
+    caml_leave_blocking_section();
 
-	if (rc)
-		caml_failwith("evtchn unmask failed");
-	CAMLreturn(Val_unit);
+    if (rc)
+        caml_failwith("evtchn unmask failed");
+    CAMLreturn(Val_unit);
 }
diff --git a/tools/ocaml/libs/mmap/mmap_stubs.h b/tools/ocaml/libs/mmap/mmap_stubs.h
index 66f18d4406..df22631c72 100644
--- a/tools/ocaml/libs/mmap/mmap_stubs.h
+++ b/tools/ocaml/libs/mmap/mmap_stubs.h
@@ -26,8 +26,8 @@
 
 struct mmap_interface
 {
-	void *addr;
-	int len;
+    void *addr;
+    int len;
 };
 
 #ifndef Data_abstract_val
diff --git a/tools/ocaml/libs/mmap/xenmmap.ml b/tools/ocaml/libs/mmap/xenmmap.ml
index 44b67c89d2..fd6735649f 100644
--- a/tools/ocaml/libs/mmap/xenmmap.ml
+++ b/tools/ocaml/libs/mmap/xenmmap.ml
@@ -21,7 +21,7 @@ type mmap_map_flag = SHARED | PRIVATE
 
 (* mmap: fd -> prot_flag -> map_flag -> length -> offset -> interface *)
 external mmap: Unix.file_descr -> mmap_prot_flag -> mmap_map_flag
-		-> int -> int -> mmap_interface = "stub_mmap_init"
+  -> int -> int -> mmap_interface = "stub_mmap_init"
 external unmap: mmap_interface -> unit = "stub_mmap_final"
 (* read: interface -> start -> length -> data *)
 external read: mmap_interface -> int -> int -> string = "stub_mmap_read"
diff --git a/tools/ocaml/libs/mmap/xenmmap.mli b/tools/ocaml/libs/mmap/xenmmap.mli
index 8f92ed6310..d097b68a8f 100644
--- a/tools/ocaml/libs/mmap/xenmmap.mli
+++ b/tools/ocaml/libs/mmap/xenmmap.mli
@@ -19,10 +19,10 @@ type mmap_prot_flag = RDONLY | WRONLY | RDWR
 type mmap_map_flag = SHARED | PRIVATE
 
 external mmap : Unix.file_descr -> mmap_prot_flag -> mmap_map_flag -> int -> int
-             -> mmap_interface = "stub_mmap_init"
+  -> mmap_interface = "stub_mmap_init"
 external unmap : mmap_interface -> unit = "stub_mmap_final"
 external read : mmap_interface -> int -> int -> string = "stub_mmap_read"
 external write : mmap_interface -> string -> int -> int -> unit
-               = "stub_mmap_write"
+  = "stub_mmap_write"
 
 external getpagesize : unit -> int = "stub_mmap_getpagesize"
diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index 141dedb78c..bf864a7c32 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -34,97 +34,97 @@ static int mmap_interface_init(struct mmap_interface *intf,
                                int fd, int pflag, int mflag,
                                int len, int offset)
 {
-	intf->len = len;
-	intf->addr = mmap(NULL, len, pflag, mflag, fd, offset);
-	return (intf->addr == MAP_FAILED) ? errno : 0;
+    intf->len = len;
+    intf->addr = mmap(NULL, len, pflag, mflag, fd, offset);
+    return (intf->addr == MAP_FAILED) ? errno : 0;
 }
 
 CAMLprim value stub_mmap_init(value fd, value pflag, value mflag,
                               value len, value offset)
 {
-	CAMLparam5(fd, pflag, mflag, len, offset);
-	CAMLlocal1(result);
-	int c_pflag, c_mflag;
+    CAMLparam5(fd, pflag, mflag, len, offset);
+    CAMLlocal1(result);
+    int c_pflag, c_mflag;
 
-	switch (Int_val(pflag)) {
-	case 0: c_pflag = PROT_READ; break;
-	case 1: c_pflag = PROT_WRITE; break;
-	case 2: c_pflag = PROT_READ|PROT_WRITE; break;
-	default: caml_invalid_argument("protectiontype");
-	}
+    switch (Int_val(pflag)) {
+    case 0: c_pflag = PROT_READ; break;
+    case 1: c_pflag = PROT_WRITE; break;
+    case 2: c_pflag = PROT_READ|PROT_WRITE; break;
+    default: caml_invalid_argument("protectiontype");
+    }
 
-	switch (Int_val(mflag)) {
-	case 0: c_mflag = MAP_SHARED; break;
-	case 1: c_mflag = MAP_PRIVATE; break;
-	default: caml_invalid_argument("maptype");
-	}
+    switch (Int_val(mflag)) {
+    case 0: c_mflag = MAP_SHARED; break;
+    case 1: c_mflag = MAP_PRIVATE; break;
+    default: caml_invalid_argument("maptype");
+    }
 
-	result = caml_alloc(sizeof(struct mmap_interface), Abstract_tag);
+    result = caml_alloc(sizeof(struct mmap_interface), Abstract_tag);
 
-	if (mmap_interface_init(Intf_val(result), Int_val(fd),
-	                        c_pflag, c_mflag,
-	                        Int_val(len), Int_val(offset)))
-		caml_failwith("mmap");
-	CAMLreturn(result);
+    if (mmap_interface_init(Intf_val(result), Int_val(fd),
+                            c_pflag, c_mflag,
+                            Int_val(len), Int_val(offset)))
+        caml_failwith("mmap");
+    CAMLreturn(result);
 }
 
 CAMLprim value stub_mmap_final(value intf)
 {
-	CAMLparam1(intf);
+    CAMLparam1(intf);
 
-	if (Intf_val(intf)->addr != MAP_FAILED)
-		munmap(Intf_val(intf)->addr, Intf_val(intf)->len);
-	Intf_val(intf)->addr = MAP_FAILED;
+    if (Intf_val(intf)->addr != MAP_FAILED)
+        munmap(Intf_val(intf)->addr, Intf_val(intf)->len);
+    Intf_val(intf)->addr = MAP_FAILED;
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_mmap_read(value intf, value start, value len)
 {
-	CAMLparam3(intf, start, len);
-	CAMLlocal1(data);
-	int c_start;
-	int c_len;
+    CAMLparam3(intf, start, len);
+    CAMLlocal1(data);
+    int c_start;
+    int c_len;
 
-	c_start = Int_val(start);
-	c_len = Int_val(len);
+    c_start = Int_val(start);
+    c_len = Int_val(len);
 
-	if (c_start > Intf_val(intf)->len)
-		caml_invalid_argument("start invalid");
-	if (c_start + c_len > Intf_val(intf)->len)
-		caml_invalid_argument("len invalid");
+    if (c_start > Intf_val(intf)->len)
+        caml_invalid_argument("start invalid");
+    if (c_start + c_len > Intf_val(intf)->len)
+        caml_invalid_argument("len invalid");
 
-	data = caml_alloc_string(c_len);
-	memcpy((char *) data, Intf_val(intf)->addr + c_start, c_len);
+    data = caml_alloc_string(c_len);
+    memcpy((char *) data, Intf_val(intf)->addr + c_start, c_len);
 
-	CAMLreturn(data);
+    CAMLreturn(data);
 }
 
 CAMLprim value stub_mmap_write(value intf, value data,
                                value start, value len)
 {
-	CAMLparam4(intf, data, start, len);
-	int c_start;
-	int c_len;
+    CAMLparam4(intf, data, start, len);
+    int c_start;
+    int c_len;
 
-	c_start = Int_val(start);
-	c_len = Int_val(len);
+    c_start = Int_val(start);
+    c_len = Int_val(len);
 
-	if (c_start > Intf_val(intf)->len)
-		caml_invalid_argument("start invalid");
-	if (c_start + c_len > Intf_val(intf)->len)
-		caml_invalid_argument("len invalid");
+    if (c_start > Intf_val(intf)->len)
+        caml_invalid_argument("start invalid");
+    if (c_start + c_len > Intf_val(intf)->len)
+        caml_invalid_argument("len invalid");
 
-	memcpy(Intf_val(intf)->addr + c_start, (char *) data, c_len);
+    memcpy(Intf_val(intf)->addr + c_start, (char *) data, c_len);
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_mmap_getpagesize(value unit)
 {
-	CAMLparam1(unit);
-	CAMLlocal1(data);
+    CAMLparam1(unit);
+    CAMLlocal1(data);
 
-	data = Val_int(getpagesize());
-	CAMLreturn(data);
+    data = Val_int(getpagesize());
+    CAMLreturn(data);
 }
diff --git a/tools/ocaml/libs/xb/op.ml b/tools/ocaml/libs/xb/op.ml
index 9bcab0f38c..77cf04a752 100644
--- a/tools/ocaml/libs/xb/op.ml
+++ b/tools/ocaml/libs/xb/op.ml
@@ -23,50 +23,50 @@ type operation = Debug | Directory | Read | Getperms |
                  Invalid
 
 let operation_c_mapping =
-	[| Debug; Directory; Read; Getperms;
-           Watch; Unwatch; Transaction_start;
-           Transaction_end; Introduce; Release;
-           Getdomainpath; Write; Mkdir; Rm;
-           Setperms; Watchevent; Error; Isintroduced;
-           Resume; Set_target; Invalid; Reset_watches |]
+  [| Debug; Directory; Read; Getperms;
+     Watch; Unwatch; Transaction_start;
+     Transaction_end; Introduce; Release;
+     Getdomainpath; Write; Mkdir; Rm;
+     Setperms; Watchevent; Error; Isintroduced;
+     Resume; Set_target; Invalid; Reset_watches |]
 let size = Array.length operation_c_mapping
 
 let array_search el a =
-	let len = Array.length a in
-	let rec search i =
-		if i > len then raise Not_found;
-		if a.(i) = el then i else search (i + 1) in
-	search 0
+  let len = Array.length a in
+  let rec search i =
+    if i > len then raise Not_found;
+    if a.(i) = el then i else search (i + 1) in
+  search 0
 
 let of_cval i =
-	if i >= 0 && i < size
-	then operation_c_mapping.(i)
-	else Invalid
+  if i >= 0 && i < size
+  then operation_c_mapping.(i)
+  else Invalid
 
 let to_cval op =
-	array_search op operation_c_mapping
+  array_search op operation_c_mapping
 
 let to_string ty =
-	match ty with
-	| Debug			-> "DEBUG"
-	| Directory		-> "DIRECTORY"
-	| Read			-> "READ"
-	| Getperms		-> "GET_PERMS"
-	| Watch			-> "WATCH"
-	| Unwatch		-> "UNWATCH"
-	| Transaction_start	-> "TRANSACTION_START"
-	| Transaction_end	-> "TRANSACTION_END"
-	| Introduce		-> "INTRODUCE"
-	| Release		-> "RELEASE"
-	| Getdomainpath		-> "GET_DOMAIN_PATH"
-	| Write			-> "WRITE"
-	| Mkdir			-> "MKDIR"
-	| Rm			-> "RM"
-	| Setperms		-> "SET_PERMS"
-	| Watchevent		-> "WATCH_EVENT"
-	| Error			-> "ERROR"
-	| Isintroduced		-> "IS_INTRODUCED"
-	| Resume		-> "RESUME"
-	| Set_target		-> "SET_TARGET"
-	| Reset_watches         -> "RESET_WATCHES"
-	| Invalid		-> "INVALID"
+  match ty with
+  | Debug			-> "DEBUG"
+  | Directory		-> "DIRECTORY"
+  | Read			-> "READ"
+  | Getperms		-> "GET_PERMS"
+  | Watch			-> "WATCH"
+  | Unwatch		-> "UNWATCH"
+  | Transaction_start	-> "TRANSACTION_START"
+  | Transaction_end	-> "TRANSACTION_END"
+  | Introduce		-> "INTRODUCE"
+  | Release		-> "RELEASE"
+  | Getdomainpath		-> "GET_DOMAIN_PATH"
+  | Write			-> "WRITE"
+  | Mkdir			-> "MKDIR"
+  | Rm			-> "RM"
+  | Setperms		-> "SET_PERMS"
+  | Watchevent		-> "WATCH_EVENT"
+  | Error			-> "ERROR"
+  | Isintroduced		-> "IS_INTRODUCED"
+  | Resume		-> "RESUME"
+  | Set_target		-> "SET_TARGET"
+  | Reset_watches         -> "RESET_WATCHES"
+  | Invalid		-> "INVALID"
diff --git a/tools/ocaml/libs/xb/packet.ml b/tools/ocaml/libs/xb/packet.ml
index 74c04bb7ae..cd169c066b 100644
--- a/tools/ocaml/libs/xb/packet.ml
+++ b/tools/ocaml/libs/xb/packet.ml
@@ -15,12 +15,12 @@
  *)
 
 type t =
-{
-	tid: int;
-	rid: int;
-	ty: Op.operation;
-	data: string;
-}
+  {
+    tid: int;
+    rid: int;
+    ty: Op.operation;
+    data: string;
+  }
 
 exception Error of string
 exception DataError of string
@@ -30,21 +30,21 @@ external string_of_header: int -> int -> int -> int -> string = "stub_string_of_
 let create tid rid ty data = { tid = tid; rid = rid; ty = ty; data = data; }
 
 let of_partialpkt ppkt =
-	create ppkt.Partial.tid ppkt.Partial.rid ppkt.Partial.ty (Buffer.contents ppkt.Partial.buf)
+  create ppkt.Partial.tid ppkt.Partial.rid ppkt.Partial.ty (Buffer.contents ppkt.Partial.buf)
 
 let to_string pkt =
-	let header = string_of_header pkt.tid pkt.rid (Op.to_cval pkt.ty) (String.length pkt.data) in
-	header ^ pkt.data
+  let header = string_of_header pkt.tid pkt.rid (Op.to_cval pkt.ty) (String.length pkt.data) in
+  header ^ pkt.data
 
 let unpack pkt =
-	pkt.tid, pkt.rid, pkt.ty, pkt.data
+  pkt.tid, pkt.rid, pkt.ty, pkt.data
 
 let get_tid pkt = pkt.tid
 let get_ty pkt = pkt.ty
 let get_data pkt =
-	let l = String.length pkt.data in
-	if l > 0 && pkt.data.[l - 1] = '\000' then
-		String.sub pkt.data 0 (l - 1)
-	else
-		pkt.data
+  let l = String.length pkt.data in
+  if l > 0 && pkt.data.[l - 1] = '\000' then
+    String.sub pkt.data 0 (l - 1)
+  else
+    pkt.data
 let get_rid pkt = pkt.rid
\ No newline at end of file
diff --git a/tools/ocaml/libs/xb/partial.ml b/tools/ocaml/libs/xb/partial.ml
index 3aa8927eb7..0e6532807d 100644
--- a/tools/ocaml/libs/xb/partial.ml
+++ b/tools/ocaml/libs/xb/partial.ml
@@ -15,39 +15,39 @@
  *)
 
 type pkt =
-{
-	tid: int;
-	rid: int;
-	ty: Op.operation;
-	len: int;
-	buf: Buffer.t;
-}
+  {
+    tid: int;
+    rid: int;
+    ty: Op.operation;
+    len: int;
+    buf: Buffer.t;
+  }
 
 external header_size: unit -> int = "stub_header_size"
 external header_of_string_internal: string -> int * int * int * int
-         = "stub_header_of_string"
+  = "stub_header_of_string"
 
 let xenstore_payload_max = 4096 (* xen/include/public/io/xs_wire.h *)
 let xenstore_rel_path_max = 2048 (* xen/include/public/io/xs_wire.h *)
 
 let of_string s =
-	let tid, rid, opint, dlen = header_of_string_internal s in
-	(* A packet which is bigger than xenstore_payload_max is illegal.
-	   This will leave the guest connection is a bad state and will
-	   be hard to recover from without restarting the connection
-	   (ie rebooting the guest) *)
-	let dlen = max 0 (min xenstore_payload_max dlen) in
-	{
-		tid = tid;
-		rid = rid;
-		ty = (Op.of_cval opint);
-		len = dlen;
-		buf = Buffer.create dlen;
-	}
+  let tid, rid, opint, dlen = header_of_string_internal s in
+  (* A packet which is bigger than xenstore_payload_max is illegal.
+     	   This will leave the guest connection is a bad state and will
+     	   be hard to recover from without restarting the connection
+     	   (ie rebooting the guest) *)
+  let dlen = max 0 (min xenstore_payload_max dlen) in
+  {
+    tid = tid;
+    rid = rid;
+    ty = (Op.of_cval opint);
+    len = dlen;
+    buf = Buffer.create dlen;
+  }
 
 let append pkt s sz =
-	if Buffer.length pkt.buf + sz > xenstore_payload_max then failwith "Buffer.add: cannot grow buffer";
-	Buffer.add_substring pkt.buf s 0 sz
+  if Buffer.length pkt.buf + sz > xenstore_payload_max then failwith "Buffer.add: cannot grow buffer";
+  Buffer.add_substring pkt.buf s 0 sz
 
 let to_complete pkt =
-	pkt.len - (Buffer.length pkt.buf)
+  pkt.len - (Buffer.length pkt.buf)
diff --git a/tools/ocaml/libs/xb/xb.ml b/tools/ocaml/libs/xb/xb.ml
index b292ed7a87..3e3ef2b29d 100644
--- a/tools/ocaml/libs/xb/xb.ml
+++ b/tools/ocaml/libs/xb/xb.ml
@@ -18,94 +18,94 @@ module Op = struct include Op end
 module Packet = struct include Packet end
 
 module BoundedQueue : sig
-	type ('a, 'b) t
+  type ('a, 'b) t
 
-	(** [create ~capacity ~classify ~limit] creates a queue with maximum [capacity] elements.
-	    This is burst capacity, each element is further classified according to [classify],
-	    and each class can have its own [limit].
-	    [capacity] is enforced as an overall limit.
-	    The [limit] can be dynamic, and can be smaller than the number of elements already queued of that class,
-	    in which case those elements are considered to use "burst capacity".
-	  *)
-	val create: capacity:int -> classify:('a -> 'b) -> limit:('b -> int) -> ('a, 'b) t
+  (** [create ~capacity ~classify ~limit] creates a queue with maximum [capacity] elements.
+      	    This is burst capacity, each element is further classified according to [classify],
+      	    and each class can have its own [limit].
+      	    [capacity] is enforced as an overall limit.
+      	    The [limit] can be dynamic, and can be smaller than the number of elements already queued of that class,
+      	    in which case those elements are considered to use "burst capacity".
+      	  *)
+  val create: capacity:int -> classify:('a -> 'b) -> limit:('b -> int) -> ('a, 'b) t
 
-	(** [clear q] discards all elements from [q] *)
-	val clear: ('a, 'b) t -> unit
+  (** [clear q] discards all elements from [q] *)
+  val clear: ('a, 'b) t -> unit
 
-	(** [can_push q] when [length q < capacity].	*)
-	val can_push: ('a, 'b) t -> 'b -> bool
+  (** [can_push q] when [length q < capacity].	*)
+  val can_push: ('a, 'b) t -> 'b -> bool
 
-	(** [push e q] adds [e] at the end of queue [q] if [can_push q], or returns [None]. *)
-	val push: 'a -> ('a, 'b) t -> unit option
+  (** [push e q] adds [e] at the end of queue [q] if [can_push q], or returns [None]. *)
+  val push: 'a -> ('a, 'b) t -> unit option
 
-	(** [pop q] removes and returns first element in [q], or raises [Queue.Empty]. *)
-	val pop: ('a, 'b) t -> 'a
+  (** [pop q] removes and returns first element in [q], or raises [Queue.Empty]. *)
+  val pop: ('a, 'b) t -> 'a
 
-	(** [peek q] returns the first element in [q], or raises [Queue.Empty].  *)
-	val peek : ('a, 'b) t -> 'a
+  (** [peek q] returns the first element in [q], or raises [Queue.Empty].  *)
+  val peek : ('a, 'b) t -> 'a
 
-	(** [length q] returns the current number of elements in [q] *)
-	val length: ('a, 'b) t -> int
+  (** [length q] returns the current number of elements in [q] *)
+  val length: ('a, 'b) t -> int
 
-	(** [debug string_of_class q] prints queue usage statistics in an unspecified internal format. *)
-	val debug: ('b -> string) -> (_, 'b) t -> string
+  (** [debug string_of_class q] prints queue usage statistics in an unspecified internal format. *)
+  val debug: ('b -> string) -> (_, 'b) t -> string
 end = struct
-	type ('a, 'b) t =
-		{ q: 'a Queue.t
-		; capacity: int
-		; classify: 'a -> 'b
-		; limit: 'b -> int
-		; class_count: ('b, int) Hashtbl.t
-		}
+  type ('a, 'b) t =
+    { q: 'a Queue.t
+    ; capacity: int
+    ; classify: 'a -> 'b
+    ; limit: 'b -> int
+    ; class_count: ('b, int) Hashtbl.t
+    }
 
-	let create ~capacity ~classify ~limit =
-		{ capacity; q = Queue.create (); classify; limit; class_count = Hashtbl.create 3 }
+  let create ~capacity ~classify ~limit =
+    { capacity; q = Queue.create (); classify; limit; class_count = Hashtbl.create 3 }
 
-	let get_count t classification = try Hashtbl.find t.class_count classification with Not_found -> 0
+  let get_count t classification = try Hashtbl.find t.class_count classification with Not_found -> 0
 
-	let can_push_internal t classification class_count =
-		Queue.length t.q < t.capacity && class_count < t.limit classification
+  let can_push_internal t classification class_count =
+    Queue.length t.q < t.capacity && class_count < t.limit classification
 
-	let ok = Some ()
+  let ok = Some ()
 
-	let push e t =
-		let classification = t.classify e in
-		let class_count = get_count t classification in
-		if can_push_internal t classification class_count then begin
-			Queue.push e t.q;
-			Hashtbl.replace t.class_count classification (class_count + 1);
-			ok
-		end
-		else
-			None
+  let push e t =
+    let classification = t.classify e in
+    let class_count = get_count t classification in
+    if can_push_internal t classification class_count then begin
+      Queue.push e t.q;
+      Hashtbl.replace t.class_count classification (class_count + 1);
+      ok
+    end
+    else
+      None
 
-	let can_push t classification =
-		can_push_internal t classification @@ get_count t classification
+  let can_push t classification =
+    can_push_internal t classification @@ get_count t classification
 
-	let clear t =
-		Queue.clear t.q;
-		Hashtbl.reset t.class_count
+  let clear t =
+    Queue.clear t.q;
+    Hashtbl.reset t.class_count
 
-	let pop t =
-		let e = Queue.pop t.q in
-		let classification = t.classify e in
-		let () = match get_count t classification - 1 with
-		| 0 -> Hashtbl.remove t.class_count classification (* reduces memusage *)
-		| n -> Hashtbl.replace t.class_count classification n
-		in
-		e
+  let pop t =
+    let e = Queue.pop t.q in
+    let classification = t.classify e in
+    let () = match get_count t classification - 1 with
+      | 0 -> Hashtbl.remove t.class_count classification (* reduces memusage *)
+      | n -> Hashtbl.replace t.class_count classification n
+    in
+    e
 
-	let peek t = Queue.peek t.q
-	let length t = Queue.length t.q
+  let peek t = Queue.peek t.q
+  let length t = Queue.length t.q
 
-	let debug string_of_class t =
-		let b = Buffer.create 128 in
-		Printf.bprintf b "BoundedQueue capacity: %d, used: {" t.capacity;
-		Hashtbl.iter (fun packet_class count ->
-			Printf.bprintf b "	%s: %d" (string_of_class packet_class) count
-		) t.class_count;
-		Printf.bprintf b "}";
-		Buffer.contents b
+  let debug string_of_class t =
+    let b = Buffer.create 128 in
+    Printf.bprintf b "BoundedQueue capacity: %d, used: {" t.capacity;
+    Hashtbl.iter (fun packet_class count ->
+        Printf.bprintf b "	%s: %d" (string_of_class packet_class) count
+      ) t.class_count;
+    Printf.bprintf b "}";
+    Buffer.contents b
 end
 
 
@@ -119,16 +119,16 @@ let _ =
   Callback.register_exception "Xb.Reconnect" Reconnect
 
 type backend_mmap =
-{
-	mmap: Xenmmap.mmap_interface;     (* mmaped interface = xs_ring *)
-	eventchn_notify: unit -> unit; (* function to notify through eventchn *)
-	mutable work_again: bool;
-}
+  {
+    mmap: Xenmmap.mmap_interface;     (* mmaped interface = xs_ring *)
+    eventchn_notify: unit -> unit; (* function to notify through eventchn *)
+    mutable work_again: bool;
+  }
 
 type backend_fd =
-{
-	fd: Unix.file_descr;
-}
+  {
+    fd: Unix.file_descr;
+  }
 
 type backend = Fd of backend_fd | Xenmmap of backend_mmap
 
@@ -144,104 +144,104 @@ type capacity = { maxoutstanding: int; maxwatchevents: int }
 module Queue = BoundedQueue
 
 type packet_class =
-	| CommandReply
-	| Watchevent
+  | CommandReply
+  | Watchevent
 
 let string_of_packet_class = function
-	| CommandReply -> "command_reply"
-	| Watchevent -> "watch_event"
+  | CommandReply -> "command_reply"
+  | Watchevent -> "watch_event"
 
 type t =
-{
-	backend: backend;
-	pkt_out: (Packet.t, packet_class) Queue.t;
-	mutable partial_in: partial_buf;
-	mutable partial_out: string;
-	capacity: capacity
-}
+  {
+    backend: backend;
+    pkt_out: (Packet.t, packet_class) Queue.t;
+    mutable partial_in: partial_buf;
+    mutable partial_out: string;
+    capacity: capacity
+  }
 
 let to_read con =
-	match con.partial_in with
-		| HaveHdr partial_pkt -> Partial.to_complete partial_pkt
-		| NoHdr   (i, _)    -> i
+  match con.partial_in with
+  | HaveHdr partial_pkt -> Partial.to_complete partial_pkt
+  | NoHdr   (i, _)    -> i
 
 let debug t =
-	Printf.sprintf "XenBus state: partial_in: %d needed, partial_out: %d bytes, pkt_out: %d packets, %s"
-		(to_read t)
-		(String.length t.partial_out)
-		(Queue.length t.pkt_out)
-		(BoundedQueue.debug string_of_packet_class t.pkt_out)
+  Printf.sprintf "XenBus state: partial_in: %d needed, partial_out: %d bytes, pkt_out: %d packets, %s"
+    (to_read t)
+    (String.length t.partial_out)
+    (Queue.length t.pkt_out)
+    (BoundedQueue.debug string_of_packet_class t.pkt_out)
 
 let init_partial_in () = NoHdr
-	(Partial.header_size (), Bytes.make (Partial.header_size()) '\000')
+    (Partial.header_size (), Bytes.make (Partial.header_size()) '\000')
 
 let reconnect t = match t.backend with
-	| Fd _ ->
-		(* should never happen, so close the connection *)
-		raise End_of_file
-	| Xenmmap backend ->
-		Xs_ring.close backend.mmap;
-		backend.eventchn_notify ();
-		(* Clear our old connection state *)
-		Queue.clear t.pkt_out;
-		t.partial_in <- init_partial_in ();
-		t.partial_out <- ""
+  | Fd _ ->
+    (* should never happen, so close the connection *)
+    raise End_of_file
+  | Xenmmap backend ->
+    Xs_ring.close backend.mmap;
+    backend.eventchn_notify ();
+    (* Clear our old connection state *)
+    Queue.clear t.pkt_out;
+    t.partial_in <- init_partial_in ();
+    t.partial_out <- ""
 
 let queue con pkt = Queue.push pkt con.pkt_out
 
 let read_fd back _con b len =
-	let rd = Unix.read back.fd b 0 len in
-	if rd = 0 then
-		raise End_of_file;
-	rd
+  let rd = Unix.read back.fd b 0 len in
+  if rd = 0 then
+    raise End_of_file;
+  rd
 
 let read_mmap back _con b len =
-	let s = Bytes.make len '\000' in
-	let rd = Xs_ring.read back.mmap s len in
-	Bytes.blit s 0 b 0 rd;
-	back.work_again <- (rd > 0);
-	if rd > 0 then
-		back.eventchn_notify ();
-	rd
+  let s = Bytes.make len '\000' in
+  let rd = Xs_ring.read back.mmap s len in
+  Bytes.blit s 0 b 0 rd;
+  back.work_again <- (rd > 0);
+  if rd > 0 then
+    back.eventchn_notify ();
+  rd
 
 let read con b len =
-	match con.backend with
-	| Fd backfd     -> read_fd backfd con b len
-	| Xenmmap backmmap -> read_mmap backmmap con b len
+  match con.backend with
+  | Fd backfd     -> read_fd backfd con b len
+  | Xenmmap backmmap -> read_mmap backmmap con b len
 
 let write_fd back _con b len =
-	Unix.write_substring back.fd b 0 len
+  Unix.write_substring back.fd b 0 len
 
 let write_mmap back _con s len =
-	let ws = Xs_ring.write_substring back.mmap s len in
-	if ws > 0 then
-		back.eventchn_notify ();
-	ws
+  let ws = Xs_ring.write_substring back.mmap s len in
+  if ws > 0 then
+    back.eventchn_notify ();
+  ws
 
 let write con s len =
-	match con.backend with
-	| Fd backfd     -> write_fd backfd con s len
-	| Xenmmap backmmap -> write_mmap backmmap con s len
+  match con.backend with
+  | Fd backfd     -> write_fd backfd con s len
+  | Xenmmap backmmap -> write_mmap backmmap con s len
 
 (* NB: can throw Reconnect *)
 let output con =
-	(* get the output string from a string_of(packet) or partial_out *)
-	let s = if String.length con.partial_out > 0 then
-			con.partial_out
-		else if Queue.length con.pkt_out > 0 then
-			let pkt = Queue.pop con.pkt_out in
-			Packet.to_string pkt
-		else
-			"" in
-	(* send data from s, and save the unsent data to partial_out *)
-	if s <> "" then (
-		let len = String.length s in
-		let sz = write con s len in
-		let left = String.sub s sz (len - sz) in
-		con.partial_out <- left
-	);
-	(* after sending one packet, partial is empty *)
-	con.partial_out = ""
+  (* get the output string from a string_of(packet) or partial_out *)
+  let s = if String.length con.partial_out > 0 then
+      con.partial_out
+    else if Queue.length con.pkt_out > 0 then
+      let pkt = Queue.pop con.pkt_out in
+      Packet.to_string pkt
+    else
+      "" in
+  (* send data from s, and save the unsent data to partial_out *)
+  if s <> "" then (
+    let len = String.length s in
+    let sz = write con s len in
+    let left = String.sub s sz (len - sz) in
+    con.partial_out <- left
+  );
+  (* after sending one packet, partial is empty *)
+  con.partial_out = ""
 
 (* we can only process an input packet if we're guaranteed to have room
    to store the response packet *)
@@ -249,71 +249,71 @@ let can_input con = Queue.can_push con.pkt_out CommandReply
 
 (* NB: can throw Reconnect *)
 let input con =
-	if not (can_input con) then None
-	else
-	let to_read = to_read con in
+  if not (can_input con) then None
+  else
+    let to_read = to_read con in
 
-	(* try to get more data from input stream *)
-	let b = Bytes.make to_read '\000' in
-	let sz = if to_read > 0 then read con b to_read else 0 in
+    (* try to get more data from input stream *)
+    let b = Bytes.make to_read '\000' in
+    let sz = if to_read > 0 then read con b to_read else 0 in
 
-	(
-	match con.partial_in with
-	| HaveHdr partial_pkt ->
-		(* we complete the data *)
-		if sz > 0 then
-			Partial.append partial_pkt (Bytes.to_string b) sz;
-		if Partial.to_complete partial_pkt = 0 then (
-			let pkt = Packet.of_partialpkt partial_pkt in
-			con.partial_in <- init_partial_in ();
-			Some pkt
-		) else None
-	| NoHdr (i, buf)      ->
-		(* we complete the partial header *)
-		if sz > 0 then
-			Bytes.blit b 0 buf (Partial.header_size () - i) sz;
-		con.partial_in <- if sz = i then
-			HaveHdr (Partial.of_string (Bytes.to_string buf)) else NoHdr (i - sz, buf);
-		None
-	)
+    (
+      match con.partial_in with
+      | HaveHdr partial_pkt ->
+        (* we complete the data *)
+        if sz > 0 then
+          Partial.append partial_pkt (Bytes.to_string b) sz;
+        if Partial.to_complete partial_pkt = 0 then (
+          let pkt = Packet.of_partialpkt partial_pkt in
+          con.partial_in <- init_partial_in ();
+          Some pkt
+        ) else None
+      | NoHdr (i, buf)      ->
+        (* we complete the partial header *)
+        if sz > 0 then
+          Bytes.blit b 0 buf (Partial.header_size () - i) sz;
+        con.partial_in <- if sz = i then
+            HaveHdr (Partial.of_string (Bytes.to_string buf)) else NoHdr (i - sz, buf);
+        None
+    )
 
 let classify t =
-	match t.Packet.ty with
-	| Op.Watchevent -> Watchevent
-	| _ -> CommandReply
+  match t.Packet.ty with
+  | Op.Watchevent -> Watchevent
+  | _ -> CommandReply
 
 let newcon ~capacity backend =
-	let limit = function
-		| CommandReply -> capacity.maxoutstanding
-		| Watchevent -> capacity.maxwatchevents
-	in
-	{
-	backend = backend;
-	pkt_out = Queue.create ~capacity:(capacity.maxoutstanding + capacity.maxwatchevents) ~classify ~limit;
-	partial_in = init_partial_in ();
-	partial_out = "";
-	capacity = capacity;
-	}
+  let limit = function
+    | CommandReply -> capacity.maxoutstanding
+    | Watchevent -> capacity.maxwatchevents
+  in
+  {
+    backend = backend;
+    pkt_out = Queue.create ~capacity:(capacity.maxoutstanding + capacity.maxwatchevents) ~classify ~limit;
+    partial_in = init_partial_in ();
+    partial_out = "";
+    capacity = capacity;
+  }
 
 let open_fd fd = newcon (Fd { fd = fd; })
 
 let open_mmap mmap notifyfct =
-	(* Advertise XENSTORE_SERVER_FEATURE_RECONNECTION *)
-	Xs_ring.set_server_features mmap (Xs_ring.Server_features.singleton Xs_ring.Server_feature.Reconnection);
-	newcon (Xenmmap {
-		mmap = mmap;
-		eventchn_notify = notifyfct;
-		work_again = false; })
+  (* Advertise XENSTORE_SERVER_FEATURE_RECONNECTION *)
+  Xs_ring.set_server_features mmap (Xs_ring.Server_features.singleton Xs_ring.Server_feature.Reconnection);
+  newcon (Xenmmap {
+      mmap = mmap;
+      eventchn_notify = notifyfct;
+      work_again = false; })
 
 let close con =
-	match con.backend with
-	| Fd backend   -> Unix.close backend.fd
-	| Xenmmap backend -> Xenmmap.unmap backend.mmap
+  match con.backend with
+  | Fd backend   -> Unix.close backend.fd
+  | Xenmmap backend -> Xenmmap.unmap backend.mmap
 
 let is_fd con =
-	match con.backend with
-	| Fd _   -> true
-	| Xenmmap _ -> false
+  match con.backend with
+  | Fd _   -> true
+  | Xenmmap _ -> false
 
 let is_mmap con = not (is_fd con)
 
@@ -326,19 +326,19 @@ let has_output con = has_new_output con || has_old_output con
 let peek_output con = Queue.peek con.pkt_out
 
 let has_partial_input con = match con.partial_in with
-	| HaveHdr _ -> true
-	| NoHdr (n, _) -> n < Partial.header_size ()
+  | HaveHdr _ -> true
+  | NoHdr (n, _) -> n < Partial.header_size ()
 let has_more_input con =
-	match con.backend with
-	| Fd _         -> false
-	| Xenmmap backend -> backend.work_again
+  match con.backend with
+  | Fd _         -> false
+  | Xenmmap backend -> backend.work_again
 
 let is_selectable con =
-	match con.backend with
-	| Fd _   -> true
-	| Xenmmap _ -> false
+  match con.backend with
+  | Fd _   -> true
+  | Xenmmap _ -> false
 
 let get_fd con =
-	match con.backend with
-	| Fd backend -> backend.fd
-	| Xenmmap _     -> raise (Failure "get_fd")
+  match con.backend with
+  | Fd backend -> backend.fd
+  | Xenmmap _     -> raise (Failure "get_fd")
diff --git a/tools/ocaml/libs/xb/xb.mli b/tools/ocaml/libs/xb/xb.mli
index 71b2754ca7..e6bb3809dc 100644
--- a/tools/ocaml/libs/xb/xb.mli
+++ b/tools/ocaml/libs/xb/xb.mli
@@ -1,58 +1,58 @@
 module Op :
-  sig
-    type operation =
-      Op.operation =
-        Debug
-      | Directory
-      | Read
-      | Getperms
-      | Watch
-      | Unwatch
-      | Transaction_start
-      | Transaction_end
-      | Introduce
-      | Release
-      | Getdomainpath
-      | Write
-      | Mkdir
-      | Rm
-      | Setperms
-      | Watchevent
-      | Error
-      | Isintroduced
-      | Resume
-      | Set_target
-      | Reset_watches
-      | Invalid
-    val operation_c_mapping : operation array
-    val size : int
-    val array_search : 'a -> 'a array -> int
-    val of_cval : int -> operation
-    val to_cval : operation -> int
-    val to_string : operation -> string
-  end
+sig
+  type operation =
+    Op.operation =
+      Debug
+    | Directory
+    | Read
+    | Getperms
+    | Watch
+    | Unwatch
+    | Transaction_start
+    | Transaction_end
+    | Introduce
+    | Release
+    | Getdomainpath
+    | Write
+    | Mkdir
+    | Rm
+    | Setperms
+    | Watchevent
+    | Error
+    | Isintroduced
+    | Resume
+    | Set_target
+    | Reset_watches
+    | Invalid
+  val operation_c_mapping : operation array
+  val size : int
+  val array_search : 'a -> 'a array -> int
+  val of_cval : int -> operation
+  val to_cval : operation -> int
+  val to_string : operation -> string
+end
 module Packet :
-  sig
-    type t =
-      Packet.t = {
-      tid : int;
-      rid : int;
-      ty : Op.operation;
-      data : string;
-    }
-    exception Error of string
-    exception DataError of string
-    external string_of_header : int -> int -> int -> int -> string
-      = "stub_string_of_header"
-    val create : int -> int -> Op.operation -> string -> t
-    val of_partialpkt : Partial.pkt -> t
-    val to_string : t -> string
-    val unpack : t -> int * int * Op.operation * string
-    val get_tid : t -> int
-    val get_ty : t -> Op.operation
-    val get_data : t -> string
-    val get_rid : t -> int
-  end
+sig
+  type t =
+    Packet.t = {
+    tid : int;
+    rid : int;
+    ty : Op.operation;
+    data : string;
+  }
+  exception Error of string
+  exception DataError of string
+  external string_of_header : int -> int -> int -> int -> string
+    = "stub_string_of_header"
+  val create : int -> int -> Op.operation -> string -> t
+  val of_partialpkt : Partial.pkt -> t
+  val to_string : t -> string
+  val unpack : t -> int * int * Op.operation * string
+  val get_tid : t -> int
+  val get_ty : t -> Op.operation
+  val get_data : t -> string
+  val get_rid : t -> int
+end
 exception End_of_file
 exception Eagain
 exception Noent
diff --git a/tools/ocaml/libs/xb/xenbus_stubs.c b/tools/ocaml/libs/xb/xenbus_stubs.c
index 3065181a55..e5206f64d4 100644
--- a/tools/ocaml/libs/xb/xenbus_stubs.c
+++ b/tools/ocaml/libs/xb/xenbus_stubs.c
@@ -32,40 +32,40 @@
 
 CAMLprim value stub_header_size(void)
 {
-	CAMLparam0();
-	CAMLreturn(Val_int(sizeof(struct xsd_sockmsg)));
+    CAMLparam0();
+    CAMLreturn(Val_int(sizeof(struct xsd_sockmsg)));
 }
 
 CAMLprim value stub_header_of_string(value s)
 {
-	CAMLparam1(s);
-	CAMLlocal1(ret);
-	const struct xsd_sockmsg *hdr;
+    CAMLparam1(s);
+    CAMLlocal1(ret);
+    const struct xsd_sockmsg *hdr;
 
-	if (caml_string_length(s) != sizeof(struct xsd_sockmsg))
-		caml_failwith("xb header incomplete");
-	ret = caml_alloc_tuple(4);
-	hdr = (const struct xsd_sockmsg *) String_val(s);
-	Store_field(ret, 0, Val_int(hdr->tx_id));
-	Store_field(ret, 1, Val_int(hdr->req_id));
-	Store_field(ret, 2, Val_int(hdr->type));
-	Store_field(ret, 3, Val_int(hdr->len));
-	CAMLreturn(ret);
+    if (caml_string_length(s) != sizeof(struct xsd_sockmsg))
+        caml_failwith("xb header incomplete");
+    ret = caml_alloc_tuple(4);
+    hdr = (const struct xsd_sockmsg *) String_val(s);
+    Store_field(ret, 0, Val_int(hdr->tx_id));
+    Store_field(ret, 1, Val_int(hdr->req_id));
+    Store_field(ret, 2, Val_int(hdr->type));
+    Store_field(ret, 3, Val_int(hdr->len));
+    CAMLreturn(ret);
 }
 
 CAMLprim value stub_string_of_header(value tid, value rid, value ty, value len)
 {
-	CAMLparam4(tid, rid, ty, len);
-	CAMLlocal1(ret);
-	struct xsd_sockmsg xsd = {
-		.type = Int_val(ty),
-		.tx_id = Int_val(tid),
-		.req_id = Int_val(rid),
-		.len = Int_val(len),
-	};
+    CAMLparam4(tid, rid, ty, len);
+    CAMLlocal1(ret);
+    struct xsd_sockmsg xsd = {
+        .type = Int_val(ty),
+        .tx_id = Int_val(tid),
+        .req_id = Int_val(rid),
+        .len = Int_val(len),
+    };
 
-	ret = caml_alloc_string(sizeof(struct xsd_sockmsg));
-	memcpy((char *) String_val(ret), &xsd, sizeof(struct xsd_sockmsg));
+    ret = caml_alloc_string(sizeof(struct xsd_sockmsg));
+    memcpy((char *) String_val(ret), &xsd, sizeof(struct xsd_sockmsg));
 
-	CAMLreturn(ret);
+    CAMLreturn(ret);
 }
diff --git a/tools/ocaml/libs/xb/xs_ring.ml b/tools/ocaml/libs/xb/xs_ring.ml
index db7f86bd27..2a27aa56c2 100644
--- a/tools/ocaml/libs/xb/xs_ring.ml
+++ b/tools/ocaml/libs/xb/xs_ring.ml
@@ -15,14 +15,14 @@
  *)
 
 module Server_feature = struct
-	type t =
-	| Reconnection
+  type t =
+    | Reconnection
 end
 
 module Server_features = Set.Make(struct
-	type t = Server_feature.t
-	let compare = compare
-end)
+    type t = Server_feature.t
+    let compare = compare
+  end)
 
 external read: Xenmmap.mmap_interface -> bytes -> int -> int = "ml_interface_read"
 external write: Xenmmap.mmap_interface -> bytes -> int -> int = "ml_interface_write"
@@ -31,18 +31,18 @@ external _internal_set_server_features: Xenmmap.mmap_interface -> int -> unit =
 external _internal_get_server_features: Xenmmap.mmap_interface -> int = "ml_interface_get_server_features" [@@noalloc]
 
 let write_substring mmap buff len =
-	write mmap (Bytes.unsafe_of_string buff) len
+  write mmap (Bytes.unsafe_of_string buff) len
 
 let get_server_features mmap =
-	(* NB only one feature currently defined above *)
-	let x = _internal_get_server_features mmap in
-	if x = 0
-	then Server_features.empty
-	else Server_features.singleton Server_feature.Reconnection
+  (* NB only one feature currently defined above *)
+  let x = _internal_get_server_features mmap in
+  if x = 0
+  then Server_features.empty
+  else Server_features.singleton Server_feature.Reconnection
 
 let set_server_features mmap set =
-	(* NB only one feature currently defined above *)
-	let x = if set = Server_features.empty then 0 else 1 in
-	_internal_set_server_features mmap x
+  (* NB only one feature currently defined above *)
+  let x = if set = Server_features.empty then 0 else 1 in
+  _internal_set_server_features mmap x
 
 external close: Xenmmap.mmap_interface -> unit = "ml_interface_close" [@@noalloc]
diff --git a/tools/ocaml/libs/xb/xs_ring_stubs.c b/tools/ocaml/libs/xb/xs_ring_stubs.c
index cc9114029f..1e472d0bbf 100644
--- a/tools/ocaml/libs/xb/xs_ring_stubs.c
+++ b/tools/ocaml/libs/xb/xs_ring_stubs.c
@@ -49,153 +49,153 @@ CAMLprim value ml_interface_read(value ml_interface,
                                  value ml_buffer,
                                  value ml_len)
 {
-	CAMLparam3(ml_interface, ml_buffer, ml_len);
-	CAMLlocal1(ml_result);
+    CAMLparam3(ml_interface, ml_buffer, ml_len);
+    CAMLlocal1(ml_result);
 
-	struct mmap_interface *interface = GET_C_STRUCT(ml_interface);
-	unsigned char *buffer = Bytes_val(ml_buffer);
-	int len = Int_val(ml_len);
-	int result;
+    struct mmap_interface *interface = GET_C_STRUCT(ml_interface);
+    unsigned char *buffer = Bytes_val(ml_buffer);
+    int len = Int_val(ml_len);
+    int result;
 
-	struct xenstore_domain_interface *intf = interface->addr;
-	XENSTORE_RING_IDX cons, prod; /* offsets only */
-	int total_data, data;
-	uint32_t connection;
+    struct xenstore_domain_interface *intf = interface->addr;
+    XENSTORE_RING_IDX cons, prod; /* offsets only */
+    int total_data, data;
+    uint32_t connection;
 
-	cons = *(volatile uint32_t*)&intf->req_cons;
-	prod = *(volatile uint32_t*)&intf->req_prod;
-	connection = *(volatile uint32_t*)&intf->connection;
+    cons = *(volatile uint32_t*)&intf->req_cons;
+    prod = *(volatile uint32_t*)&intf->req_prod;
+    connection = *(volatile uint32_t*)&intf->connection;
 
-	if (connection != XENSTORE_CONNECTED)
-		caml_raise_constant(*caml_named_value("Xb.Reconnect"));
+    if (connection != XENSTORE_CONNECTED)
+        caml_raise_constant(*caml_named_value("Xb.Reconnect"));
 
-	xen_mb();
+    xen_mb();
 
-	if ((prod - cons) > XENSTORE_RING_SIZE)
-		caml_failwith("bad connection");
+    if ((prod - cons) > XENSTORE_RING_SIZE)
+        caml_failwith("bad connection");
 
-	/* Check for any pending data at all. */
-	total_data = prod - cons;
-	if (total_data == 0) {
-		/* No pending data at all. */
-		result = 0;
-		goto exit;
-	}
-	else if (total_data < len)
-		/* Some data - make a partial read. */
-		len = total_data;
+    /* Check for any pending data at all. */
+    total_data = prod - cons;
+    if (total_data == 0) {
+        /* No pending data at all. */
+        result = 0;
+        goto exit;
+    }
+    else if (total_data < len)
+        /* Some data - make a partial read. */
+        len = total_data;
 
-	/* Check whether data crosses the end of the ring. */
-	data = XENSTORE_RING_SIZE - MASK_XENSTORE_IDX(cons);
-	if (len < data)
-		/* Data within the remaining part of the ring. */
-		memcpy(buffer, intf->req + MASK_XENSTORE_IDX(cons), len);
-	else {
-		/* Data crosses the ring boundary. Read both halves. */
-		memcpy(buffer, intf->req + MASK_XENSTORE_IDX(cons), data);
-		memcpy(buffer + data, intf->req, len - data);
-	}
+    /* Check whether data crosses the end of the ring. */
+    data = XENSTORE_RING_SIZE - MASK_XENSTORE_IDX(cons);
+    if (len < data)
+        /* Data within the remaining part of the ring. */
+        memcpy(buffer, intf->req + MASK_XENSTORE_IDX(cons), len);
+    else {
+        /* Data crosses the ring boundary. Read both halves. */
+        memcpy(buffer, intf->req + MASK_XENSTORE_IDX(cons), data);
+        memcpy(buffer + data, intf->req, len - data);
+    }
 
-	xen_mb();
-	intf->req_cons += len;
-	result = len;
+    xen_mb();
+    intf->req_cons += len;
+    result = len;
 exit:
-	ml_result = Val_int(result);
-	CAMLreturn(ml_result);
+    ml_result = Val_int(result);
+    CAMLreturn(ml_result);
 }
 
 CAMLprim value ml_interface_write(value ml_interface,
                                   value ml_buffer,
                                   value ml_len)
 {
-	CAMLparam3(ml_interface, ml_buffer, ml_len);
-	CAMLlocal1(ml_result);
+    CAMLparam3(ml_interface, ml_buffer, ml_len);
+    CAMLlocal1(ml_result);
 
-	struct mmap_interface *interface = GET_C_STRUCT(ml_interface);
-	const unsigned char *buffer = Bytes_val(ml_buffer);
-	int len = Int_val(ml_len);
-	int result;
+    struct mmap_interface *interface = GET_C_STRUCT(ml_interface);
+    const unsigned char *buffer = Bytes_val(ml_buffer);
+    int len = Int_val(ml_len);
+    int result;
 
-	struct xenstore_domain_interface *intf = interface->addr;
-	XENSTORE_RING_IDX cons, prod;
-	int total_space, space;
-	uint32_t connection;
+    struct xenstore_domain_interface *intf = interface->addr;
+    XENSTORE_RING_IDX cons, prod;
+    int total_space, space;
+    uint32_t connection;
 
-	cons = *(volatile uint32_t*)&intf->rsp_cons;
-	prod = *(volatile uint32_t*)&intf->rsp_prod;
-	connection = *(volatile uint32_t*)&intf->connection;
+    cons = *(volatile uint32_t*)&intf->rsp_cons;
+    prod = *(volatile uint32_t*)&intf->rsp_prod;
+    connection = *(volatile uint32_t*)&intf->connection;
 
-	if (connection != XENSTORE_CONNECTED)
-		caml_raise_constant(*caml_named_value("Xb.Reconnect"));
+    if (connection != XENSTORE_CONNECTED)
+        caml_raise_constant(*caml_named_value("Xb.Reconnect"));
 
-	xen_mb();
+    xen_mb();
 
-	if ((prod - cons) > XENSTORE_RING_SIZE)
-		caml_failwith("bad connection");
+    if ((prod - cons) > XENSTORE_RING_SIZE)
+        caml_failwith("bad connection");
 
-	/* Check for space to write the full message. */
-	total_space = XENSTORE_RING_SIZE - (prod - cons);
-	if (total_space == 0) {
-		/* No space at all - exit having done nothing. */
-		result = 0;
-		goto exit;
-	}
-	else if (total_space < len)
-		/* Some space - make a partial write. */
-		len = total_space;
+    /* Check for space to write the full message. */
+    total_space = XENSTORE_RING_SIZE - (prod - cons);
+    if (total_space == 0) {
+        /* No space at all - exit having done nothing. */
+        result = 0;
+        goto exit;
+    }
+    else if (total_space < len)
+        /* Some space - make a partial write. */
+        len = total_space;
 
-	/* Check for space until the ring wraps. */
-	space = XENSTORE_RING_SIZE - MASK_XENSTORE_IDX(prod);
-	if (len < space)
-		/* Message fits inside the remaining part of the ring. */
-		memcpy(intf->rsp + MASK_XENSTORE_IDX(prod), buffer, len);
-	else {
-		/* Message wraps around the end of the ring. Write both halves. */
-		memcpy(intf->rsp + MASK_XENSTORE_IDX(prod), buffer, space);
-		memcpy(intf->rsp, buffer + space, len - space);
-	}
+    /* Check for space until the ring wraps. */
+    space = XENSTORE_RING_SIZE - MASK_XENSTORE_IDX(prod);
+    if (len < space)
+        /* Message fits inside the remaining part of the ring. */
+        memcpy(intf->rsp + MASK_XENSTORE_IDX(prod), buffer, len);
+    else {
+        /* Message wraps around the end of the ring. Write both halves. */
+        memcpy(intf->rsp + MASK_XENSTORE_IDX(prod), buffer, space);
+        memcpy(intf->rsp, buffer + space, len - space);
+    }
 
-	xen_mb();
-	intf->rsp_prod += len;
-	result = len;
+    xen_mb();
+    intf->rsp_prod += len;
+    result = len;
 exit:
-	ml_result = Val_int(result);
-	CAMLreturn(ml_result);
+    ml_result = Val_int(result);
+    CAMLreturn(ml_result);
 }
 
 CAMLprim value ml_interface_set_server_features(value interface, value v)
 {
-	CAMLparam2(interface, v);
-	struct xenstore_domain_interface *intf = GET_C_STRUCT(interface)->addr;
-	if (intf == (void*)MAP_FAILED)
-		caml_failwith("Interface closed");
+    CAMLparam2(interface, v);
+    struct xenstore_domain_interface *intf = GET_C_STRUCT(interface)->addr;
+    if (intf == (void*)MAP_FAILED)
+        caml_failwith("Interface closed");
 
-	intf->server_features = Int_val(v);
+    intf->server_features = Int_val(v);
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value ml_interface_get_server_features(value interface)
 {
-	CAMLparam1(interface);
-	struct xenstore_domain_interface *intf = GET_C_STRUCT(interface)->addr;
+    CAMLparam1(interface);
+    struct xenstore_domain_interface *intf = GET_C_STRUCT(interface)->addr;
 
-	CAMLreturn(Val_int (intf->server_features));
+    CAMLreturn(Val_int (intf->server_features));
 }
 
 CAMLprim value ml_interface_close(value interface)
 {
-	CAMLparam1(interface);
-	struct xenstore_domain_interface *intf = GET_C_STRUCT(interface)->addr;
-	int i;
+    CAMLparam1(interface);
+    struct xenstore_domain_interface *intf = GET_C_STRUCT(interface)->addr;
+    int i;
 
-	intf->req_cons = intf->req_prod = intf->rsp_cons = intf->rsp_prod = 0;
-	/* Ensure the unused space is full of invalid xenstore packets. */
-	for (i = 0; i < XENSTORE_RING_SIZE; i++) {
-		intf->req[i] = 0xff; /* XS_INVALID = 0xffff */
-		intf->rsp[i] = 0xff;
-	}
-	xen_mb ();
-	intf->connection = XENSTORE_CONNECTED;
-	CAMLreturn(Val_unit);
+    intf->req_cons = intf->req_prod = intf->rsp_cons = intf->rsp_prod = 0;
+    /* Ensure the unused space is full of invalid xenstore packets. */
+    for (i = 0; i < XENSTORE_RING_SIZE; i++) {
+        intf->req[i] = 0xff; /* XS_INVALID = 0xffff */
+        intf->rsp[i] = 0xff;
+    }
+    xen_mb ();
+    intf->connection = XENSTORE_CONNECTED;
+    CAMLreturn(Val_unit);
 }
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 9a80ae5e28..b02be07429 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -20,153 +20,153 @@ type domid = int
 (* ** xenctrl.h ** *)
 
 type vcpuinfo =
-{
-	online: bool;
-	blocked: bool;
-	running: bool;
-	cputime: int64;
-	cpumap: int32;
-}
+  {
+    online: bool;
+    blocked: bool;
+    running: bool;
+    cputime: int64;
+    cpumap: int32;
+  }
 
 type xen_arm_arch_domainconfig =
-{
-	gic_version: int;
-	nr_spis: int;
-	clock_frequency: int32;
-}
+  {
+    gic_version: int;
+    nr_spis: int;
+    clock_frequency: int32;
+  }
 
 type x86_arch_emulation_flags =
-	| X86_EMU_LAPIC
-	| X86_EMU_HPET
-	| X86_EMU_PM
-	| X86_EMU_RTC
-	| X86_EMU_IOAPIC
-	| X86_EMU_PIC
-	| X86_EMU_VGA
-	| X86_EMU_IOMMU
-	| X86_EMU_PIT
-	| X86_EMU_USE_PIRQ
-	| X86_EMU_VPCI
+  | X86_EMU_LAPIC
+  | X86_EMU_HPET
+  | X86_EMU_PM
+  | X86_EMU_RTC
+  | X86_EMU_IOAPIC
+  | X86_EMU_PIC
+  | X86_EMU_VGA
+  | X86_EMU_IOMMU
+  | X86_EMU_PIT
+  | X86_EMU_USE_PIRQ
+  | X86_EMU_VPCI
 
 type x86_arch_misc_flags =
-	| X86_MSR_RELAXED
+  | X86_MSR_RELAXED
 
 type xen_x86_arch_domainconfig =
-{
-	emulation_flags: x86_arch_emulation_flags list;
-	misc_flags: x86_arch_misc_flags list;
-}
+  {
+    emulation_flags: x86_arch_emulation_flags list;
+    misc_flags: x86_arch_misc_flags list;
+  }
 
 type arch_domainconfig =
-	| ARM of xen_arm_arch_domainconfig
-	| X86 of xen_x86_arch_domainconfig
+  | ARM of xen_arm_arch_domainconfig
+  | X86 of xen_x86_arch_domainconfig
 
 type domain_create_flag =
-	| CDF_HVM
-	| CDF_HAP
-	| CDF_S3_INTEGRITY
-	| CDF_OOS_OFF
-	| CDF_XS_DOMAIN
-	| CDF_IOMMU
-	| CDF_NESTED_VIRT
-	| CDF_VPMU
+  | CDF_HVM
+  | CDF_HAP
+  | CDF_S3_INTEGRITY
+  | CDF_OOS_OFF
+  | CDF_XS_DOMAIN
+  | CDF_IOMMU
+  | CDF_NESTED_VIRT
+  | CDF_VPMU
 
 type domain_create_iommu_opts =
-	| IOMMU_NO_SHAREPT
+  | IOMMU_NO_SHAREPT
 
 type domctl_create_config =
-{
-	ssidref: int32;
-	handle: string;
-	flags: domain_create_flag list;
-	iommu_opts: domain_create_iommu_opts list;
-	max_vcpus: int;
-	max_evtchn_port: int;
-	max_grant_frames: int;
-	max_maptrack_frames: int;
-	max_grant_version: int;
-	cpupool_id: int32;
-	arch: arch_domainconfig;
-}
+  {
+    ssidref: int32;
+    handle: string;
+    flags: domain_create_flag list;
+    iommu_opts: domain_create_iommu_opts list;
+    max_vcpus: int;
+    max_evtchn_port: int;
+    max_grant_frames: int;
+    max_maptrack_frames: int;
+    max_grant_version: int;
+    cpupool_id: int32;
+    arch: arch_domainconfig;
+  }
 
 type domaininfo =
-{
-	domid             : domid;
-	dying             : bool;
-	shutdown          : bool;
-	paused            : bool;
-	blocked           : bool;
-	running           : bool;
-	hvm_guest         : bool;
-	shutdown_code     : int;
-	total_memory_pages: nativeint;
-	max_memory_pages  : nativeint;
-	shared_info_frame : int64;
-	cpu_time          : int64;
-	nr_online_vcpus   : int;
-	max_vcpu_id       : int;
-	ssidref           : int32;
-	handle            : int array;
-	arch_config       : arch_domainconfig;
-}
+  {
+    domid             : domid;
+    dying             : bool;
+    shutdown          : bool;
+    paused            : bool;
+    blocked           : bool;
+    running           : bool;
+    hvm_guest         : bool;
+    shutdown_code     : int;
+    total_memory_pages: nativeint;
+    max_memory_pages  : nativeint;
+    shared_info_frame : int64;
+    cpu_time          : int64;
+    nr_online_vcpus   : int;
+    max_vcpu_id       : int;
+    ssidref           : int32;
+    handle            : int array;
+    arch_config       : arch_domainconfig;
+  }
 
 type sched_control =
-{
-	weight : int;
-	cap    : int;
-}
+  {
+    weight : int;
+    cap    : int;
+  }
 
 type physinfo_cap_flag =
-	| CAP_HVM
-	| CAP_PV
-	| CAP_DirectIO
-	| CAP_HAP
-	| CAP_Shadow
-	| CAP_IOMMU_HAP_PT_SHARE
-	| CAP_Vmtrace
-	| CAP_Vpmu
-	| CAP_Gnttab_v1
-	| CAP_Gnttab_v2
+  | CAP_HVM
+  | CAP_PV
+  | CAP_DirectIO
+  | CAP_HAP
+  | CAP_Shadow
+  | CAP_IOMMU_HAP_PT_SHARE
+  | CAP_Vmtrace
+  | CAP_Vpmu
+  | CAP_Gnttab_v1
+  | CAP_Gnttab_v2
 
 type arm_physinfo_cap_flag
 
 type x86_physinfo_cap_flag
 
 type arch_physinfo_cap_flags =
-	| ARM of arm_physinfo_cap_flag list
-	| X86 of x86_physinfo_cap_flag list
+  | ARM of arm_physinfo_cap_flag list
+  | X86 of x86_physinfo_cap_flag list
 
 type physinfo =
-{
-	threads_per_core : int;
-	cores_per_socket : int;
-	nr_cpus          : int;
-	max_node_id      : int;
-	cpu_khz          : int;
-	total_pages      : nativeint;
-	free_pages       : nativeint;
-	scrub_pages      : nativeint;
-	(* XXX hw_cap *)
-	capabilities     : physinfo_cap_flag list;
-	max_nr_cpus      : int;
-	arch_capabilities : arch_physinfo_cap_flags;
-}
+  {
+    threads_per_core : int;
+    cores_per_socket : int;
+    nr_cpus          : int;
+    max_node_id      : int;
+    cpu_khz          : int;
+    total_pages      : nativeint;
+    free_pages       : nativeint;
+    scrub_pages      : nativeint;
+    (* XXX hw_cap *)
+    capabilities     : physinfo_cap_flag list;
+    max_nr_cpus      : int;
+    arch_capabilities : arch_physinfo_cap_flags;
+  }
 
 type version =
-{
-	major : int;
-	minor : int;
-	extra : string;
-}
+  {
+    major : int;
+    minor : int;
+    extra : string;
+  }
 
 
 type compile_info =
-{
-	compiler : string;
-	compile_by : string;
-	compile_domain : string;
-	compile_date : string;
-}
+  {
+    compiler : string;
+    compile_by : string;
+    compile_domain : string;
+    compile_date : string;
+  }
 
 type shutdown_reason = Poweroff | Reboot | Suspend | Crash | Watchdog | Soft_reset
 
@@ -181,34 +181,34 @@ let handle = ref None
 let get_handle () = !handle
 
 let close_handle () =
-	match !handle with
-	| Some h -> handle := None
-	| None -> ()
+  match !handle with
+  | Some h -> handle := None
+  | None -> ()
 
 let with_intf f =
-	match !handle with
-	| Some h -> f h
-	| None ->
-		let h =
-			try interface_open () with
-			| e ->
-				let msg = Printexc.to_string e in
-				failwith ("failed to open xenctrl: "^msg)
-		in
-		handle := Some h;
-		f h
+  match !handle with
+  | Some h -> f h
+  | None ->
+    let h =
+      try interface_open () with
+      | e ->
+        let msg = Printexc.to_string e in
+        failwith ("failed to open xenctrl: "^msg)
+    in
+    handle := Some h;
+    f h
 
 external domain_create_stub: handle -> domid -> domctl_create_config -> domid
-       = "stub_xc_domain_create"
+  = "stub_xc_domain_create"
 
 let domain_create handle ?(domid=0) config =
-	domain_create_stub handle domid config
+  domain_create_stub handle domid config
 
 external domain_sethandle: handle -> domid -> string -> unit
-       = "stub_xc_domain_sethandle"
+  = "stub_xc_domain_sethandle"
 
 external domain_max_vcpus: handle -> domid -> int -> unit
-       = "stub_xc_domain_max_vcpus"
+  = "stub_xc_domain_max_vcpus"
 
 external domain_pause: handle -> domid -> unit = "stub_xc_domain_pause"
 external domain_unpause: handle -> domid -> unit = "stub_xc_domain_unpause"
@@ -216,10 +216,10 @@ external domain_resume_fast: handle -> domid -> unit = "stub_xc_domain_resume_fa
 external domain_destroy: handle -> domid -> unit = "stub_xc_domain_destroy"
 
 external domain_shutdown: handle -> domid -> shutdown_reason -> unit
-       = "stub_xc_domain_shutdown"
+  = "stub_xc_domain_shutdown"
 
 external _domain_getinfolist: handle -> domid -> int -> domaininfo list
-       = "stub_xc_domain_getinfolist"
+  = "stub_xc_domain_getinfolist"
 
 let rev_append_fold acc e = List.rev_append e acc
 
@@ -228,53 +228,53 @@ let rev_append_fold acc e = List.rev_append e acc
  * except it is tail recursive, whereas [List.concat] isn't.
  * Example:
  * rev_concat [[10;9;8];[7;6];[5]]] = [5; 6; 7; 8; 9; 10]
- *)
+*)
 let rev_concat lst = List.fold_left rev_append_fold [] lst
 
 let domain_getinfolist handle first_domain =
-	let nb = 1024 in
-	let rec __getlist lst from =
-		(* _domain_getinfolist returns domains in reverse order, largest first *)
-		match _domain_getinfolist handle from nb with
-		| [] -> rev_concat lst
-		| (hd :: _) as l -> __getlist (l :: lst) (hd.domid + 1)
-	in
-	__getlist [] first_domain
+  let nb = 1024 in
+  let rec __getlist lst from =
+    (* _domain_getinfolist returns domains in reverse order, largest first *)
+    match _domain_getinfolist handle from nb with
+    | [] -> rev_concat lst
+    | (hd :: _) as l -> __getlist (l :: lst) (hd.domid + 1)
+  in
+  __getlist [] first_domain
 
 external domain_getinfo: handle -> domid -> domaininfo= "stub_xc_domain_getinfo"
 
 external domain_get_vcpuinfo: handle -> int -> int -> vcpuinfo
-       = "stub_xc_vcpu_getinfo"
+  = "stub_xc_vcpu_getinfo"
 
 external domain_ioport_permission: handle -> domid -> int -> int -> bool -> unit
-       = "stub_xc_domain_ioport_permission"
+  = "stub_xc_domain_ioport_permission"
 external domain_iomem_permission: handle -> domid -> nativeint -> nativeint -> bool -> unit
-       = "stub_xc_domain_iomem_permission"
+  = "stub_xc_domain_iomem_permission"
 external domain_irq_permission: handle -> domid -> int -> bool -> unit
-       = "stub_xc_domain_irq_permission"
+  = "stub_xc_domain_irq_permission"
 
 external vcpu_affinity_set: handle -> domid -> int -> bool array -> unit
-       = "stub_xc_vcpu_setaffinity"
+  = "stub_xc_vcpu_setaffinity"
 external vcpu_affinity_get: handle -> domid -> int -> bool array
-       = "stub_xc_vcpu_getaffinity"
+  = "stub_xc_vcpu_getaffinity"
 
 external vcpu_context_get: handle -> domid -> int -> string
-       = "stub_xc_vcpu_context_get"
+  = "stub_xc_vcpu_context_get"
 
 external sched_id: handle -> int = "stub_xc_sched_id"
 
 external sched_credit_domain_set: handle -> domid -> sched_control -> unit
-       = "stub_sched_credit_domain_set"
+  = "stub_sched_credit_domain_set"
 external sched_credit_domain_get: handle -> domid -> sched_control
-       = "stub_sched_credit_domain_get"
+  = "stub_sched_credit_domain_get"
 
 external shadow_allocation_set: handle -> domid -> int -> unit
-       = "stub_shadow_allocation_set"
+  = "stub_shadow_allocation_set"
 external shadow_allocation_get: handle -> domid -> int
-       = "stub_shadow_allocation_get"
+  = "stub_shadow_allocation_get"
 
 external evtchn_alloc_unbound: handle -> domid -> domid -> int
-       = "stub_xc_evtchn_alloc_unbound"
+  = "stub_xc_evtchn_alloc_unbound"
 external evtchn_reset: handle -> domid -> unit = "stub_xc_evtchn_reset"
 
 (* FIFO has theoretical maximum of 2^28 ports, fits in an int *)
@@ -299,15 +299,15 @@ external physinfo: handle -> physinfo = "stub_xc_physinfo"
 external pcpu_info: handle -> int -> int64 array = "stub_xc_pcpu_info"
 
 external domain_setmaxmem: handle -> domid -> int64 -> unit
-       = "stub_xc_domain_setmaxmem"
+  = "stub_xc_domain_setmaxmem"
 external domain_set_memmap_limit: handle -> domid -> int64 -> unit
-       = "stub_xc_domain_set_memmap_limit"
+  = "stub_xc_domain_set_memmap_limit"
 external domain_memory_increase_reservation: handle -> domid -> int64 -> unit
-       = "stub_xc_domain_memory_increase_reservation"
+  = "stub_xc_domain_memory_increase_reservation"
 
 external map_foreign_range: handle -> domid -> int
-                         -> nativeint -> Xenmmap.mmap_interface
-       = "stub_map_foreign_range"
+  -> nativeint -> Xenmmap.mmap_interface
+  = "stub_map_foreign_range"
 
 type hvm_param =
   | HVM_PARAM_CALLBACK_IRQ
@@ -357,15 +357,15 @@ external hvm_param_set: handle -> domid -> hvm_param -> int64 -> unit
   = "stub_xc_hvm_param_set"
 
 external domain_assign_device: handle -> domid -> (int * int * int * int) -> unit
-       = "stub_xc_domain_assign_device"
+  = "stub_xc_domain_assign_device"
 external domain_deassign_device: handle -> domid -> (int * int * int * int) -> unit
-       = "stub_xc_domain_deassign_device"
+  = "stub_xc_domain_deassign_device"
 external domain_test_assign_device: handle -> domid -> (int * int * int * int) -> bool
-       = "stub_xc_domain_test_assign_device"
+  = "stub_xc_domain_test_assign_device"
 
 external version: handle -> version = "stub_xc_version_version"
 external version_compile_info: handle -> compile_info
-       = "stub_xc_version_compile_info"
+  = "stub_xc_version_compile_info"
 external version_changeset: handle -> string = "stub_xc_version_changeset"
 external version_capabilities: handle -> string =
   "stub_xc_version_capabilities"
@@ -380,7 +380,7 @@ external watchdog : handle -> int -> int32 -> int
 
 (**
    Convert the given number of pages to an amount in KiB, rounded up.
- *)
+*)
 external pages_to_kib : int64 -> int64 = "stub_pages_to_kib"
 let pages_to_mib pages = Int64.div (pages_to_kib pages) 1024L
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 82def5a17c..3154e90f4f 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -182,11 +182,11 @@ external domain_getinfo : handle -> domid -> domaininfo
 external domain_get_vcpuinfo : handle -> int -> int -> vcpuinfo
   = "stub_xc_vcpu_getinfo"
 external domain_ioport_permission: handle -> domid -> int -> int -> bool -> unit
-       = "stub_xc_domain_ioport_permission"
+  = "stub_xc_domain_ioport_permission"
 external domain_iomem_permission: handle -> domid -> nativeint -> nativeint -> bool -> unit
-       = "stub_xc_domain_iomem_permission"
+  = "stub_xc_domain_iomem_permission"
 external domain_irq_permission: handle -> domid -> int -> bool -> unit
-       = "stub_xc_domain_irq_permission"
+  = "stub_xc_domain_irq_permission"
 external vcpu_affinity_set : handle -> domid -> int -> bool array -> unit
   = "stub_xc_vcpu_setaffinity"
 external vcpu_affinity_get : handle -> domid -> int -> bool array
@@ -284,11 +284,11 @@ external hvm_param_set: handle -> domid -> hvm_param -> int64 -> unit
   = "stub_xc_hvm_param_set"
 
 external domain_assign_device: handle -> domid -> (int * int * int * int) -> unit
-       = "stub_xc_domain_assign_device"
+  = "stub_xc_domain_assign_device"
 external domain_deassign_device: handle -> domid -> (int * int * int * int) -> unit
-       = "stub_xc_domain_deassign_device"
+  = "stub_xc_domain_deassign_device"
 external domain_test_assign_device: handle -> domid -> (int * int * int * int) -> bool
-       = "stub_xc_domain_test_assign_device"
+  = "stub_xc_domain_test_assign_device"
 
 external version : handle -> version = "stub_xc_version_version"
 external version_compile_info : handle -> compile_info
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 2fba9c5e94..fe2ff60795 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -50,78 +50,78 @@
 
 static void stub_xenctrl_finalize(value v)
 {
-	xc_interface_close(_H(v));
+    xc_interface_close(_H(v));
 }
 
 static struct custom_operations xenctrl_ops = {
-	.identifier  = "xenctrl",
-	.finalize    = stub_xenctrl_finalize,
-	.compare     = custom_compare_default,     /* Can't compare     */
-	.hash        = custom_hash_default,        /* Can't hash        */
-	.serialize   = custom_serialize_default,   /* Can't serialize   */
-	.deserialize = custom_deserialize_default, /* Can't deserialize */
-	.compare_ext = custom_compare_ext_default, /* Can't compare     */
+    .identifier  = "xenctrl",
+    .finalize    = stub_xenctrl_finalize,
+    .compare     = custom_compare_default,     /* Can't compare     */
+    .hash        = custom_hash_default,        /* Can't hash        */
+    .serialize   = custom_serialize_default,   /* Can't serialize   */
+    .deserialize = custom_deserialize_default, /* Can't deserialize */
+    .compare_ext = custom_compare_ext_default, /* Can't compare     */
 };
 
 #define string_of_option_array(array, index) \
-	((Field(array, index) == Val_none) ? NULL : String_val(Field(Field(array, index), 0)))
+    ((Field(array, index) == Val_none) ? NULL : String_val(Field(Field(array, index), 0)))
 
 static void Noreturn failwith_xc(xc_interface *xch)
 {
-	char error_str[XC_MAX_ERROR_MSG_LEN + 6];
-	if (xch) {
-		const xc_error *error = xc_get_last_error(xch);
-		if (error->code == XC_ERROR_NONE)
-			snprintf(error_str, sizeof(error_str),
-				 "%d: %s", errno, strerror(errno));
-		else
-			snprintf(error_str, sizeof(error_str),
-				 "%d: %s: %s", error->code,
-				 xc_error_code_to_desc(error->code),
-				 error->message);
-	} else {
-		snprintf(error_str, sizeof(error_str),
-			 "Unable to open XC interface");
-	}
-	caml_raise_with_string(*caml_named_value("xc.error"), error_str);
+    char error_str[XC_MAX_ERROR_MSG_LEN + 6];
+    if (xch) {
+        const xc_error *error = xc_get_last_error(xch);
+        if (error->code == XC_ERROR_NONE)
+            snprintf(error_str, sizeof(error_str),
+                 "%d: %s", errno, strerror(errno));
+        else
+            snprintf(error_str, sizeof(error_str),
+                 "%d: %s: %s", error->code,
+                 xc_error_code_to_desc(error->code),
+                 error->message);
+    } else {
+        snprintf(error_str, sizeof(error_str),
+             "Unable to open XC interface");
+    }
+    caml_raise_with_string(*caml_named_value("xc.error"), error_str);
 }
 
 CAMLprim value stub_xc_interface_open(void)
 {
-	CAMLparam0();
-	CAMLlocal1(result);
-	xc_interface *xch;
+    CAMLparam0();
+    CAMLlocal1(result);
+    xc_interface *xch;
 
-	caml_enter_blocking_section();
-	xch = xc_interface_open(NULL, NULL, 0);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    xch = xc_interface_open(NULL, NULL, 0);
+    caml_leave_blocking_section();
 
-	if ( !xch )
-		failwith_xc(xch);
+    if ( !xch )
+        failwith_xc(xch);
 
-	result = caml_alloc_custom(&xenctrl_ops, sizeof(xch), 0, 1);
-	_H(result) = xch;
+    result = caml_alloc_custom(&xenctrl_ops, sizeof(xch), 0, 1);
+    _H(result) = xch;
 
-	CAMLreturn(result);
+    CAMLreturn(result);
 }
 
 static void domain_handle_of_uuid_string(xen_domain_handle_t h,
-					 const char *uuid)
+                     const char *uuid)
 {
 #define X "%02"SCNx8
 #define UUID_FMT (X X X X "-" X X "-" X X "-" X X "-" X X X X X X)
 
-	if ( sscanf(uuid, UUID_FMT, &h[0], &h[1], &h[2], &h[3], &h[4],
-		    &h[5], &h[6], &h[7], &h[8], &h[9], &h[10], &h[11],
-		    &h[12], &h[13], &h[14], &h[15]) != 16 )
-	{
-		char buf[128];
+    if ( sscanf(uuid, UUID_FMT, &h[0], &h[1], &h[2], &h[3], &h[4],
+            &h[5], &h[6], &h[7], &h[8], &h[9], &h[10], &h[11],
+            &h[12], &h[13], &h[14], &h[15]) != 16 )
+    {
+        char buf[128];
 
-		snprintf(buf, sizeof(buf),
-			 "Xc.int_array_of_uuid_string: %s", uuid);
+        snprintf(buf, sizeof(buf),
+             "Xc.int_array_of_uuid_string: %s", uuid);
 
-		caml_invalid_argument(buf);
-	}
+        caml_invalid_argument(buf);
+    }
 
 #undef X
 }
@@ -133,13 +133,13 @@ static void domain_handle_of_uuid_string(xen_domain_handle_t h,
 static value c_bitmap_to_ocaml_list
              /* ! */
              /*
-	      * All calls to this function must be in a form suitable
-	      * for xenctrl_abi_check.  The parsing there is ad-hoc.
-	      */
+          * All calls to this function must be in a form suitable
+          * for xenctrl_abi_check.  The parsing there is ad-hoc.
+          */
              (unsigned int bitmap)
 {
-	CAMLparam0();
-	CAMLlocal2(list, tmp);
+    CAMLparam0();
+    CAMLlocal2(list, tmp);
 
 #if defined(__i386__) || defined(__x86_64__)
 /*
@@ -156,43 +156,43 @@ static value c_bitmap_to_ocaml_list
 #include "xenctrl_abi_check.h"
 #endif
 
-	list = tmp = Val_emptylist;
+    list = tmp = Val_emptylist;
 
-	for ( unsigned int i = 0; bitmap; i++, bitmap >>= 1 )
-	{
-		if ( !(bitmap & 1) )
-			continue;
+    for ( unsigned int i = 0; bitmap; i++, bitmap >>= 1 )
+    {
+        if ( !(bitmap & 1) )
+            continue;
 
-		tmp = caml_alloc_small(2, Tag_cons);
-		Field(tmp, 0) = Val_int(i);
-		Field(tmp, 1) = list;
-		list = tmp;
-	}
+        tmp = caml_alloc_small(2, Tag_cons);
+        Field(tmp, 0) = Val_int(i);
+        Field(tmp, 1) = list;
+        list = tmp;
+    }
 
-	CAMLreturn(list);
+    CAMLreturn(list);
 }
 
 static unsigned int ocaml_list_to_c_bitmap(value l)
              /* ! */
              /*
-	      * All calls to this function must be in a form suitable
-	      * for xenctrl_abi_check.  The parsing there is ad-hoc.
-	      */
+          * All calls to this function must be in a form suitable
+          * for xenctrl_abi_check.  The parsing there is ad-hoc.
+          */
 {
-	unsigned int val = 0;
+    unsigned int val = 0;
 
-	for ( ; l != Val_none; l = Field(l, 1) )
-		val |= 1u << Int_val(Field(l, 0));
+    for ( ; l != Val_none; l = Field(l, 1) )
+        val |= 1u << Int_val(Field(l, 0));
 
-	return val;
+    return val;
 }
 
 CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config)
 {
-	CAMLparam3(xch, wanted_domid, config);
-	CAMLlocal2(l, arch_domconfig);
+    CAMLparam3(xch, wanted_domid, config);
+    CAMLlocal2(l, arch_domconfig);
 
-	/* Mnemonics for the named fields inside domctl_create_config */
+    /* Mnemonics for the named fields inside domctl_create_config */
 #define VAL_SSIDREF             Field(config, 0)
 #define VAL_HANDLE              Field(config, 1)
 #define VAL_FLAGS               Field(config, 2)
@@ -205,69 +205,69 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 #define VAL_CPUPOOL_ID          Field(config, 9)
 #define VAL_ARCH                Field(config, 10)
 
-	uint32_t domid = Int_val(wanted_domid);
-	int result;
-	struct xen_domctl_createdomain cfg = {
-		.ssidref = Int32_val(VAL_SSIDREF),
-		.max_vcpus = Int_val(VAL_MAX_VCPUS),
-		.max_evtchn_port = Int_val(VAL_MAX_EVTCHN_PORT),
-		.max_grant_frames = Int_val(VAL_MAX_GRANT_FRAMES),
-		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
-		.grant_opts =
-		    XEN_DOMCTL_GRANT_version(Int_val(VAL_MAX_GRANT_VERSION)),
-		.cpupool_id = Int32_val(VAL_CPUPOOL_ID),
-	};
+    uint32_t domid = Int_val(wanted_domid);
+    int result;
+    struct xen_domctl_createdomain cfg = {
+        .ssidref = Int32_val(VAL_SSIDREF),
+        .max_vcpus = Int_val(VAL_MAX_VCPUS),
+        .max_evtchn_port = Int_val(VAL_MAX_EVTCHN_PORT),
+        .max_grant_frames = Int_val(VAL_MAX_GRANT_FRAMES),
+        .max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
+        .grant_opts =
+            XEN_DOMCTL_GRANT_version(Int_val(VAL_MAX_GRANT_VERSION)),
+        .cpupool_id = Int32_val(VAL_CPUPOOL_ID),
+    };
 
-	domain_handle_of_uuid_string(cfg.handle, String_val(VAL_HANDLE));
+    domain_handle_of_uuid_string(cfg.handle, String_val(VAL_HANDLE));
 
-	cfg.flags = ocaml_list_to_c_bitmap
-		/* ! domain_create_flag CDF_ lc */
-		/* ! XEN_DOMCTL_CDF_ XEN_DOMCTL_CDF_MAX max */
-		(VAL_FLAGS);
+    cfg.flags = ocaml_list_to_c_bitmap
+        /* ! domain_create_flag CDF_ lc */
+        /* ! XEN_DOMCTL_CDF_ XEN_DOMCTL_CDF_MAX max */
+        (VAL_FLAGS);
 
-	cfg.iommu_opts = ocaml_list_to_c_bitmap
-		/* ! domain_create_iommu_opts IOMMU_ lc */
-		/* ! XEN_DOMCTL_IOMMU_ XEN_DOMCTL_IOMMU_MAX max */
-		(VAL_IOMMU_OPTS);
+    cfg.iommu_opts = ocaml_list_to_c_bitmap
+        /* ! domain_create_iommu_opts IOMMU_ lc */
+        /* ! XEN_DOMCTL_IOMMU_ XEN_DOMCTL_IOMMU_MAX max */
+        (VAL_IOMMU_OPTS);
 
-	arch_domconfig = Field(VAL_ARCH, 0);
-	switch ( Tag_val(VAL_ARCH) )
-	{
-	case 0: /* ARM - nothing to do */
-		caml_failwith("Unhandled: ARM");
-		break;
+    arch_domconfig = Field(VAL_ARCH, 0);
+    switch ( Tag_val(VAL_ARCH) )
+    {
+    case 0: /* ARM - nothing to do */
+        caml_failwith("Unhandled: ARM");
+        break;
 
-	case 1: /* X86 - emulation flags in the block */
+    case 1: /* X86 - emulation flags in the block */
 #if defined(__i386__) || defined(__x86_64__)
 
-		/* Quick & dirty check for ABI changes. */
-		BUILD_BUG_ON(sizeof(cfg) != 64);
+        /* Quick & dirty check for ABI changes. */
+        BUILD_BUG_ON(sizeof(cfg) != 64);
 
         /* Mnemonics for the named fields inside xen_x86_arch_domainconfig */
 #define VAL_EMUL_FLAGS          Field(arch_domconfig, 0)
 #define VAL_MISC_FLAGS          Field(arch_domconfig, 1)
 
-		cfg.arch.emulation_flags = ocaml_list_to_c_bitmap
-			/* ! x86_arch_emulation_flags X86_EMU_ none */
-			/* ! XEN_X86_EMU_ XEN_X86_EMU_ALL all */
-			(VAL_EMUL_FLAGS);
+        cfg.arch.emulation_flags = ocaml_list_to_c_bitmap
+            /* ! x86_arch_emulation_flags X86_EMU_ none */
+            /* ! XEN_X86_EMU_ XEN_X86_EMU_ALL all */
+            (VAL_EMUL_FLAGS);
 
-		cfg.arch.misc_flags = ocaml_list_to_c_bitmap
-			/* ! x86_arch_misc_flags X86_ none */
-			/* ! XEN_X86_ XEN_X86_MSR_RELAXED all */
-			(VAL_MISC_FLAGS);
+        cfg.arch.misc_flags = ocaml_list_to_c_bitmap
+            /* ! x86_arch_misc_flags X86_ none */
+            /* ! XEN_X86_ XEN_X86_MSR_RELAXED all */
+            (VAL_MISC_FLAGS);
 
 #undef VAL_MISC_FLAGS
 #undef VAL_EMUL_FLAGS
 
 #else
-		caml_failwith("Unhandled: x86");
+        caml_failwith("Unhandled: x86");
 #endif
-		break;
+        break;
 
-	default:
-		caml_failwith("Unhandled domconfig type");
-	}
+    default:
+        caml_failwith("Unhandled domconfig type");
+    }
 
 #undef VAL_ARCH
 #undef VAL_CPUPOOL_ID
@@ -281,965 +281,965 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 #undef VAL_HANDLE
 #undef VAL_SSIDREF
 
-	caml_enter_blocking_section();
-	result = xc_domain_create(_H(xch), &domid, &cfg);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    result = xc_domain_create(_H(xch), &domid, &cfg);
+    caml_leave_blocking_section();
 
-	if (result < 0)
-		failwith_xc(_H(xch));
+    if (result < 0)
+        failwith_xc(_H(xch));
 
-	CAMLreturn(Val_int(domid));
+    CAMLreturn(Val_int(domid));
 }
 
 CAMLprim value stub_xc_domain_max_vcpus(value xch, value domid,
                                         value max_vcpus)
 {
-	CAMLparam3(xch, domid, max_vcpus);
-	int r;
+    CAMLparam3(xch, domid, max_vcpus);
+    int r;
 
-	r = xc_domain_max_vcpus(_H(xch), _D(domid), Int_val(max_vcpus));
-	if (r)
-		failwith_xc(_H(xch));
+    r = xc_domain_max_vcpus(_H(xch), _D(domid), Int_val(max_vcpus));
+    if (r)
+        failwith_xc(_H(xch));
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 
 value stub_xc_domain_sethandle(value xch, value domid, value handle)
 {
-	CAMLparam3(xch, domid, handle);
-	xen_domain_handle_t h;
-	int i;
+    CAMLparam3(xch, domid, handle);
+    xen_domain_handle_t h;
+    int i;
 
-	domain_handle_of_uuid_string(h, String_val(handle));
+    domain_handle_of_uuid_string(h, String_val(handle));
 
-	i = xc_domain_sethandle(_H(xch), _D(domid), h);
-	if (i)
-		failwith_xc(_H(xch));
+    i = xc_domain_sethandle(_H(xch), _D(domid), h);
+    if (i)
+        failwith_xc(_H(xch));
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 static value dom_op(value xch, value domid, int (*fn)(xc_interface *, uint32_t))
 {
-	CAMLparam2(xch, domid);
-	int result;
+    CAMLparam2(xch, domid);
+    int result;
 
-	uint32_t c_domid = _D(domid);
+    uint32_t c_domid = _D(domid);
 
-	caml_enter_blocking_section();
-	result = fn(_H(xch), c_domid);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    result = fn(_H(xch), c_domid);
+    caml_leave_blocking_section();
         if (result)
-		failwith_xc(_H(xch));
-	CAMLreturn(Val_unit);
+        failwith_xc(_H(xch));
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_xc_domain_pause(value xch, value domid)
 {
-	return dom_op(xch, domid, xc_domain_pause);
+    return dom_op(xch, domid, xc_domain_pause);
 }
 
 
 CAMLprim value stub_xc_domain_unpause(value xch, value domid)
 {
-	return dom_op(xch, domid, xc_domain_unpause);
+    return dom_op(xch, domid, xc_domain_unpause);
 }
 
 CAMLprim value stub_xc_domain_destroy(value xch, value domid)
 {
-	return dom_op(xch, domid, xc_domain_destroy);
+    return dom_op(xch, domid, xc_domain_destroy);
 }
 
 CAMLprim value stub_xc_domain_resume_fast(value xch, value domid)
 {
-	CAMLparam2(xch, domid);
-	int result;
+    CAMLparam2(xch, domid);
+    int result;
 
-	uint32_t c_domid = _D(domid);
+    uint32_t c_domid = _D(domid);
 
-	caml_enter_blocking_section();
-	result = xc_domain_resume(_H(xch), c_domid, 1);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    result = xc_domain_resume(_H(xch), c_domid, 1);
+    caml_leave_blocking_section();
         if (result)
-		failwith_xc(_H(xch));
-	CAMLreturn(Val_unit);
+        failwith_xc(_H(xch));
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_xc_domain_shutdown(value xch, value domid, value reason)
 {
-	CAMLparam3(xch, domid, reason);
-	int ret;
+    CAMLparam3(xch, domid, reason);
+    int ret;
 
-	ret = xc_domain_shutdown(_H(xch), _D(domid), Int_val(reason));
-	if (ret < 0)
-		failwith_xc(_H(xch));
+    ret = xc_domain_shutdown(_H(xch), _D(domid), Int_val(reason));
+    if (ret < 0)
+        failwith_xc(_H(xch));
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 static value alloc_domaininfo(xc_domaininfo_t * info)
 {
-	CAMLparam0();
-	CAMLlocal5(result, tmp, arch_config, x86_arch_config, emul_list);
-	int i;
+    CAMLparam0();
+    CAMLlocal5(result, tmp, arch_config, x86_arch_config, emul_list);
+    int i;
 
-	result = caml_alloc_tuple(17);
+    result = caml_alloc_tuple(17);
 
-	Store_field(result,  0, Val_int(info->domain));
-	Store_field(result,  1, Val_bool(info->flags & XEN_DOMINF_dying));
-	Store_field(result,  2, Val_bool(info->flags & XEN_DOMINF_shutdown));
-	Store_field(result,  3, Val_bool(info->flags & XEN_DOMINF_paused));
-	Store_field(result,  4, Val_bool(info->flags & XEN_DOMINF_blocked));
-	Store_field(result,  5, Val_bool(info->flags & XEN_DOMINF_running));
-	Store_field(result,  6, Val_bool(info->flags & XEN_DOMINF_hvm_guest));
-	Store_field(result,  7, Val_int((info->flags >> XEN_DOMINF_shutdownshift)
-	                                 & XEN_DOMINF_shutdownmask));
-	Store_field(result,  8, caml_copy_nativeint(info->tot_pages));
-	Store_field(result,  9, caml_copy_nativeint(info->max_pages));
-	Store_field(result, 10, caml_copy_int64(info->shared_info_frame));
-	Store_field(result, 11, caml_copy_int64(info->cpu_time));
-	Store_field(result, 12, Val_int(info->nr_online_vcpus));
-	Store_field(result, 13, Val_int(info->max_vcpu_id));
-	Store_field(result, 14, caml_copy_int32(info->ssidref));
+    Store_field(result,  0, Val_int(info->domain));
+    Store_field(result,  1, Val_bool(info->flags & XEN_DOMINF_dying));
+    Store_field(result,  2, Val_bool(info->flags & XEN_DOMINF_shutdown));
+    Store_field(result,  3, Val_bool(info->flags & XEN_DOMINF_paused));
+    Store_field(result,  4, Val_bool(info->flags & XEN_DOMINF_blocked));
+    Store_field(result,  5, Val_bool(info->flags & XEN_DOMINF_running));
+    Store_field(result,  6, Val_bool(info->flags & XEN_DOMINF_hvm_guest));
+    Store_field(result,  7, Val_int((info->flags >> XEN_DOMINF_shutdownshift)
+                                     & XEN_DOMINF_shutdownmask));
+    Store_field(result,  8, caml_copy_nativeint(info->tot_pages));
+    Store_field(result,  9, caml_copy_nativeint(info->max_pages));
+    Store_field(result, 10, caml_copy_int64(info->shared_info_frame));
+    Store_field(result, 11, caml_copy_int64(info->cpu_time));
+    Store_field(result, 12, Val_int(info->nr_online_vcpus));
+    Store_field(result, 13, Val_int(info->max_vcpu_id));
+    Store_field(result, 14, caml_copy_int32(info->ssidref));
 
         tmp = caml_alloc_small(16, 0);
-	for (i = 0; i < 16; i++) {
-		Field(tmp, i) = Val_int(info->handle[i]);
-	}
+    for (i = 0; i < 16; i++) {
+        Field(tmp, i) = Val_int(info->handle[i]);
+    }
 
-	Store_field(result, 15, tmp);
+    Store_field(result, 15, tmp);
 
 #if defined(__i386__) || defined(__x86_64__)
-	/*
-	 * emulation_flags: x86_arch_emulation_flags list;
-	 */
-	emul_list = c_bitmap_to_ocaml_list
-		/* ! x86_arch_emulation_flags */
-		(info->arch_config.emulation_flags);
+    /*
+     * emulation_flags: x86_arch_emulation_flags list;
+     */
+    emul_list = c_bitmap_to_ocaml_list
+        /* ! x86_arch_emulation_flags */
+        (info->arch_config.emulation_flags);
 
-	/* xen_x86_arch_domainconfig */
-	x86_arch_config = caml_alloc_tuple(1);
-	Store_field(x86_arch_config, 0, emul_list);
+    /* xen_x86_arch_domainconfig */
+    x86_arch_config = caml_alloc_tuple(1);
+    Store_field(x86_arch_config, 0, emul_list);
 
-	/* arch_config: arch_domainconfig */
-	arch_config = caml_alloc_small(1, 1);
+    /* arch_config: arch_domainconfig */
+    arch_config = caml_alloc_small(1, 1);
 
-	Store_field(arch_config, 0, x86_arch_config);
+    Store_field(arch_config, 0, x86_arch_config);
 
-	Store_field(result, 16, arch_config);
+    Store_field(result, 16, arch_config);
 #endif
 
-	CAMLreturn(result);
+    CAMLreturn(result);
 }
 
 CAMLprim value stub_xc_domain_getinfolist(value xch, value first_domain, value nb)
 {
-	CAMLparam3(xch, first_domain, nb);
-	CAMLlocal2(result, temp);
-	xc_domaininfo_t * info;
-	int i, ret, toalloc, retval;
-	unsigned int c_max_domains;
-	uint32_t c_first_domain;
+    CAMLparam3(xch, first_domain, nb);
+    CAMLlocal2(result, temp);
+    xc_domaininfo_t * info;
+    int i, ret, toalloc, retval;
+    unsigned int c_max_domains;
+    uint32_t c_first_domain;
 
-	/* get the minimum number of allocate byte we need and bump it up to page boundary */
-	toalloc = (sizeof(xc_domaininfo_t) * Int_val(nb)) | 0xfff;
-	ret = posix_memalign((void **) ((void *) &info), 4096, toalloc);
-	if (ret)
-		caml_raise_out_of_memory();
+    /* get the minimum number of allocate byte we need and bump it up to page boundary */
+    toalloc = (sizeof(xc_domaininfo_t) * Int_val(nb)) | 0xfff;
+    ret = posix_memalign((void **) ((void *) &info), 4096, toalloc);
+    if (ret)
+        caml_raise_out_of_memory();
 
-	result = temp = Val_emptylist;
+    result = temp = Val_emptylist;
 
-	c_first_domain = _D(first_domain);
-	c_max_domains = Int_val(nb);
-	caml_enter_blocking_section();
-	retval = xc_domain_getinfolist(_H(xch), c_first_domain,
-				       c_max_domains, info);
-	caml_leave_blocking_section();
+    c_first_domain = _D(first_domain);
+    c_max_domains = Int_val(nb);
+    caml_enter_blocking_section();
+    retval = xc_domain_getinfolist(_H(xch), c_first_domain,
+                       c_max_domains, info);
+    caml_leave_blocking_section();
 
-	if (retval < 0) {
-		free(info);
-		failwith_xc(_H(xch));
-	}
-	for (i = 0; i < retval; i++) {
-		result = caml_alloc_small(2, Tag_cons);
-		Field(result, 0) = Val_int(0);
-		Field(result, 1) = temp;
-		temp = result;
+    if (retval < 0) {
+        free(info);
+        failwith_xc(_H(xch));
+    }
+    for (i = 0; i < retval; i++) {
+        result = caml_alloc_small(2, Tag_cons);
+        Field(result, 0) = Val_int(0);
+        Field(result, 1) = temp;
+        temp = result;
 
-		Store_field(result, 0, alloc_domaininfo(info + i));
-	}
+        Store_field(result, 0, alloc_domaininfo(info + i));
+    }
 
-	free(info);
-	CAMLreturn(result);
+    free(info);
+    CAMLreturn(result);
 }
 
 CAMLprim value stub_xc_domain_getinfo(value xch, value domid)
 {
-	CAMLparam2(xch, domid);
-	CAMLlocal1(result);
-	xc_domaininfo_t info;
-	int ret;
+    CAMLparam2(xch, domid);
+    CAMLlocal1(result);
+    xc_domaininfo_t info;
+    int ret;
 
-	ret = xc_domain_getinfolist(_H(xch), _D(domid), 1, &info);
-	if (ret != 1)
-		failwith_xc(_H(xch));
-	if (info.domain != _D(domid))
-		failwith_xc(_H(xch));
+    ret = xc_domain_getinfolist(_H(xch), _D(domid), 1, &info);
+    if (ret != 1)
+        failwith_xc(_H(xch));
+    if (info.domain != _D(domid))
+        failwith_xc(_H(xch));
 
-	result = alloc_domaininfo(&info);
-	CAMLreturn(result);
+    result = alloc_domaininfo(&info);
+    CAMLreturn(result);
 }
 
 CAMLprim value stub_xc_vcpu_getinfo(value xch, value domid, value vcpu)
 {
-	CAMLparam3(xch, domid, vcpu);
-	CAMLlocal1(result);
-	xc_vcpuinfo_t info;
-	int retval;
+    CAMLparam3(xch, domid, vcpu);
+    CAMLlocal1(result);
+    xc_vcpuinfo_t info;
+    int retval;
 
-	uint32_t c_domid = _D(domid);
-	uint32_t c_vcpu = Int_val(vcpu);
-	caml_enter_blocking_section();
-	retval = xc_vcpu_getinfo(_H(xch), c_domid,
-	                         c_vcpu, &info);
-	caml_leave_blocking_section();
-	if (retval < 0)
-		failwith_xc(_H(xch));
+    uint32_t c_domid = _D(domid);
+    uint32_t c_vcpu = Int_val(vcpu);
+    caml_enter_blocking_section();
+    retval = xc_vcpu_getinfo(_H(xch), c_domid,
+                             c_vcpu, &info);
+    caml_leave_blocking_section();
+    if (retval < 0)
+        failwith_xc(_H(xch));
 
-	result = caml_alloc_tuple(5);
-	Store_field(result, 0, Val_bool(info.online));
-	Store_field(result, 1, Val_bool(info.blocked));
-	Store_field(result, 2, Val_bool(info.running));
-	Store_field(result, 3, caml_copy_int64(info.cpu_time));
-	Store_field(result, 4, caml_copy_int32(info.cpu));
+    result = caml_alloc_tuple(5);
+    Store_field(result, 0, Val_bool(info.online));
+    Store_field(result, 1, Val_bool(info.blocked));
+    Store_field(result, 2, Val_bool(info.running));
+    Store_field(result, 3, caml_copy_int64(info.cpu_time));
+    Store_field(result, 4, caml_copy_int32(info.cpu));
 
-	CAMLreturn(result);
+    CAMLreturn(result);
 }
 
 CAMLprim value stub_xc_vcpu_context_get(value xch, value domid,
                                         value cpu)
 {
-	CAMLparam3(xch, domid, cpu);
-	CAMLlocal1(context);
-	int ret;
-	vcpu_guest_context_any_t ctxt;
+    CAMLparam3(xch, domid, cpu);
+    CAMLlocal1(context);
+    int ret;
+    vcpu_guest_context_any_t ctxt;
 
-	ret = xc_vcpu_getcontext(_H(xch), _D(domid), Int_val(cpu), &ctxt);
-	if ( ret < 0 )
-		failwith_xc(_H(xch));
+    ret = xc_vcpu_getcontext(_H(xch), _D(domid), Int_val(cpu), &ctxt);
+    if ( ret < 0 )
+        failwith_xc(_H(xch));
 
-	context = caml_alloc_string(sizeof(ctxt));
-	memcpy((char *) String_val(context), &ctxt.c, sizeof(ctxt.c));
+    context = caml_alloc_string(sizeof(ctxt));
+    memcpy((char *) String_val(context), &ctxt.c, sizeof(ctxt.c));
 
-	CAMLreturn(context);
+    CAMLreturn(context);
 }
 
 static int get_cpumap_len(value xch, value cpumap)
 {
-	int ml_len = Wosize_val(cpumap);
-	int xc_len = xc_get_max_cpus(_H(xch));
+    int ml_len = Wosize_val(cpumap);
+    int xc_len = xc_get_max_cpus(_H(xch));
 
-	if (ml_len < xc_len)
-		return ml_len;
-	else
-		return xc_len;
+    if (ml_len < xc_len)
+        return ml_len;
+    else
+        return xc_len;
 }
 
 CAMLprim value stub_xc_vcpu_setaffinity(value xch, value domid,
                                         value vcpu, value cpumap)
 {
-	CAMLparam4(xch, domid, vcpu, cpumap);
-	int i, len = get_cpumap_len(xch, cpumap);
-	xc_cpumap_t c_cpumap;
-	int retval;
+    CAMLparam4(xch, domid, vcpu, cpumap);
+    int i, len = get_cpumap_len(xch, cpumap);
+    xc_cpumap_t c_cpumap;
+    int retval;
 
-	c_cpumap = xc_cpumap_alloc(_H(xch));
-	if (c_cpumap == NULL)
-		failwith_xc(_H(xch));
+    c_cpumap = xc_cpumap_alloc(_H(xch));
+    if (c_cpumap == NULL)
+        failwith_xc(_H(xch));
 
-	for (i=0; i<len; i++) {
-		if (Bool_val(Field(cpumap, i)))
-			c_cpumap[i/8] |= 1 << (i&7);
-	}
-	retval = xc_vcpu_setaffinity(_H(xch), _D(domid),
-				     Int_val(vcpu),
-				     c_cpumap, NULL,
-				     XEN_VCPUAFFINITY_HARD);
-	free(c_cpumap);
+    for (i=0; i<len; i++) {
+        if (Bool_val(Field(cpumap, i)))
+            c_cpumap[i/8] |= 1 << (i&7);
+    }
+    retval = xc_vcpu_setaffinity(_H(xch), _D(domid),
+                     Int_val(vcpu),
+                     c_cpumap, NULL,
+                     XEN_VCPUAFFINITY_HARD);
+    free(c_cpumap);
 
-	if (retval < 0)
-		failwith_xc(_H(xch));
-	CAMLreturn(Val_unit);
+    if (retval < 0)
+        failwith_xc(_H(xch));
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_xc_vcpu_getaffinity(value xch, value domid,
                                         value vcpu)
 {
-	CAMLparam3(xch, domid, vcpu);
-	CAMLlocal1(ret);
-	xc_cpumap_t c_cpumap;
-	int i, len = xc_get_max_cpus(_H(xch));
-	int retval;
+    CAMLparam3(xch, domid, vcpu);
+    CAMLlocal1(ret);
+    xc_cpumap_t c_cpumap;
+    int i, len = xc_get_max_cpus(_H(xch));
+    int retval;
 
-	if (len < 1)
-		failwith_xc(_H(xch));
+    if (len < 1)
+        failwith_xc(_H(xch));
 
-	c_cpumap = xc_cpumap_alloc(_H(xch));
-	if (c_cpumap == NULL)
-		failwith_xc(_H(xch));
+    c_cpumap = xc_cpumap_alloc(_H(xch));
+    if (c_cpumap == NULL)
+        failwith_xc(_H(xch));
 
-	retval = xc_vcpu_getaffinity(_H(xch), _D(domid),
-				     Int_val(vcpu),
-				     c_cpumap, NULL,
-				     XEN_VCPUAFFINITY_HARD);
-	if (retval < 0) {
-		free(c_cpumap);
-		failwith_xc(_H(xch));
-	}
+    retval = xc_vcpu_getaffinity(_H(xch), _D(domid),
+                     Int_val(vcpu),
+                     c_cpumap, NULL,
+                     XEN_VCPUAFFINITY_HARD);
+    if (retval < 0) {
+        free(c_cpumap);
+        failwith_xc(_H(xch));
+    }
 
-	ret = caml_alloc(len, 0);
+    ret = caml_alloc(len, 0);
 
-	for (i=0; i<len; i++) {
-		if (c_cpumap[i/8] & 1 << (i&7))
-			Store_field(ret, i, Val_true);
-		else
-			Store_field(ret, i, Val_false);
-	}
+    for (i=0; i<len; i++) {
+        if (c_cpumap[i/8] & 1 << (i&7))
+            Store_field(ret, i, Val_true);
+        else
+            Store_field(ret, i, Val_false);
+    }
 
-	free(c_cpumap);
+    free(c_cpumap);
 
-	CAMLreturn(ret);
+    CAMLreturn(ret);
 }
 
 CAMLprim value stub_xc_sched_id(value xch)
 {
-	CAMLparam1(xch);
-	int sched_id;
+    CAMLparam1(xch);
+    int sched_id;
 
-	if (xc_sched_id(_H(xch), &sched_id))
-		failwith_xc(_H(xch));
-	CAMLreturn(Val_int(sched_id));
+    if (xc_sched_id(_H(xch), &sched_id))
+        failwith_xc(_H(xch));
+    CAMLreturn(Val_int(sched_id));
 }
 
 CAMLprim value stub_xc_evtchn_alloc_unbound(value xch,
                                             value local_domid,
                                             value remote_domid)
 {
-	CAMLparam3(xch, local_domid, remote_domid);
-	int result;
+    CAMLparam3(xch, local_domid, remote_domid);
+    int result;
 
-	uint32_t c_local_domid = _D(local_domid);
-	uint32_t c_remote_domid = _D(remote_domid);
+    uint32_t c_local_domid = _D(local_domid);
+    uint32_t c_remote_domid = _D(remote_domid);
 
-	caml_enter_blocking_section();
-	result = xc_evtchn_alloc_unbound(_H(xch), c_local_domid,
-	                                     c_remote_domid);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    result = xc_evtchn_alloc_unbound(_H(xch), c_local_domid,
+                                         c_remote_domid);
+    caml_leave_blocking_section();
 
-	if (result < 0)
-		failwith_xc(_H(xch));
-	CAMLreturn(Val_int(result));
+    if (result < 0)
+        failwith_xc(_H(xch));
+    CAMLreturn(Val_int(result));
 }
 
 CAMLprim value stub_xc_evtchn_reset(value xch, value domid)
 {
-	CAMLparam2(xch, domid);
-	int r;
+    CAMLparam2(xch, domid);
+    int r;
 
-	r = xc_evtchn_reset(_H(xch), _D(domid));
-	if (r < 0)
-		failwith_xc(_H(xch));
-	CAMLreturn(Val_unit);
+    r = xc_evtchn_reset(_H(xch), _D(domid));
+    if (r < 0)
+        failwith_xc(_H(xch));
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_xc_evtchn_status(value xch, value domid, value port)
 {
-	CAMLparam3(xch, domid, port);
-	CAMLlocal4(result, result_status, stat, interdomain);
-	xc_evtchn_status_t status = {
-		.dom = _D(domid),
-		.port = Int_val(port),
-	};
-	int rc;
+    CAMLparam3(xch, domid, port);
+    CAMLlocal4(result, result_status, stat, interdomain);
+    xc_evtchn_status_t status = {
+        .dom = _D(domid),
+        .port = Int_val(port),
+    };
+    int rc;
 
-	caml_enter_blocking_section();
-	rc = xc_evtchn_status(_H(xch), &status);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    rc = xc_evtchn_status(_H(xch), &status);
+    caml_leave_blocking_section();
 
-	if ( rc < 0 )
-		failwith_xc(_H(xch));
+    if ( rc < 0 )
+        failwith_xc(_H(xch));
 
-	switch ( status.status )
-	{
-	case EVTCHNSTAT_closed:
-		CAMLreturn(Val_none); /* Early exit, no allocations needed */
+    switch ( status.status )
+    {
+    case EVTCHNSTAT_closed:
+        CAMLreturn(Val_none); /* Early exit, no allocations needed */
 
-	case EVTCHNSTAT_unbound:
-		stat = caml_alloc(1, 0); /* 1st non-constant constructor */
-		Store_field(stat, 0, Val_int(status.u.unbound.dom));
-		break;
+    case EVTCHNSTAT_unbound:
+        stat = caml_alloc(1, 0); /* 1st non-constant constructor */
+        Store_field(stat, 0, Val_int(status.u.unbound.dom));
+        break;
 
-	case EVTCHNSTAT_interdomain:
-		interdomain = caml_alloc_tuple(2);
-		Store_field(interdomain, 0, Val_int(status.u.interdomain.dom));
-		Store_field(interdomain, 1, Val_int(status.u.interdomain.port));
-		stat = caml_alloc(1, 1); /*  2nd non-constant constructor */
-		Store_field(stat, 0, interdomain);
-		break;
+    case EVTCHNSTAT_interdomain:
+        interdomain = caml_alloc_tuple(2);
+        Store_field(interdomain, 0, Val_int(status.u.interdomain.dom));
+        Store_field(interdomain, 1, Val_int(status.u.interdomain.port));
+        stat = caml_alloc(1, 1); /*  2nd non-constant constructor */
+        Store_field(stat, 0, interdomain);
+        break;
 
-	case EVTCHNSTAT_pirq:
-		stat = caml_alloc(1, 2); /* 3rd non-constant constructor */
-		Store_field(stat, 0, Val_int(status.u.pirq));
-		break;
+    case EVTCHNSTAT_pirq:
+        stat = caml_alloc(1, 2); /* 3rd non-constant constructor */
+        Store_field(stat, 0, Val_int(status.u.pirq));
+        break;
 
-	case EVTCHNSTAT_virq:
-		stat = caml_alloc(1, 3); /* 4th non-constant constructor */
-		Store_field(stat, 0, Val_int(status.u.virq));
-		break;
+    case EVTCHNSTAT_virq:
+        stat = caml_alloc(1, 3); /* 4th non-constant constructor */
+        Store_field(stat, 0, Val_int(status.u.virq));
+        break;
 
-	case EVTCHNSTAT_ipi:
-		stat = Val_int(0); /* 1st constant constructor */
-		break;
+    case EVTCHNSTAT_ipi:
+        stat = Val_int(0); /* 1st constant constructor */
+        break;
 
-	default:
-		caml_failwith("Unknown evtchn status");
-	}
+    default:
+        caml_failwith("Unknown evtchn status");
+    }
 
-	result_status = caml_alloc_tuple(2);
-	Store_field(result_status, 0, Val_int(status.vcpu));
-	Store_field(result_status, 1, stat);
+    result_status = caml_alloc_tuple(2);
+    Store_field(result_status, 0, Val_int(status.vcpu));
+    Store_field(result_status, 1, stat);
 
-	result = caml_alloc_small(1, Tag_some);
-	Store_field(result, 0, result_status);
+    result = caml_alloc_small(1, Tag_some);
+    Store_field(result, 0, result_status);
 
-	CAMLreturn(result);
+    CAMLreturn(result);
 }
 
 CAMLprim value stub_xc_readconsolering(value xch)
 {
-	/* Safe to use outside of blocking sections because of Ocaml GC lock. */
-	static unsigned int conring_size = 16384 + 1;
+    /* Safe to use outside of blocking sections because of Ocaml GC lock. */
+    static unsigned int conring_size = 16384 + 1;
 
-	unsigned int count = conring_size, size = count, index = 0;
-	char *str = NULL, *ptr;
-	int ret;
+    unsigned int count = conring_size, size = count, index = 0;
+    char *str = NULL, *ptr;
+    int ret;
 
-	CAMLparam1(xch);
-	CAMLlocal1(ring);
+    CAMLparam1(xch);
+    CAMLlocal1(ring);
 
-	str = malloc(size);
-	if (!str)
-		caml_raise_out_of_memory();
+    str = malloc(size);
+    if (!str)
+        caml_raise_out_of_memory();
 
-	/* Hopefully our conring_size guess is sufficient */
-	caml_enter_blocking_section();
-	ret = xc_readconsolering(_H(xch), str, &count, 0, 0, &index);
-	caml_leave_blocking_section();
+    /* Hopefully our conring_size guess is sufficient */
+    caml_enter_blocking_section();
+    ret = xc_readconsolering(_H(xch), str, &count, 0, 0, &index);
+    caml_leave_blocking_section();
 
-	if (ret < 0) {
-		free(str);
-		failwith_xc(_H(xch));
-	}
+    if (ret < 0) {
+        free(str);
+        failwith_xc(_H(xch));
+    }
 
-	while (count == size && ret >= 0) {
-		size += count - 1;
-		if (size < count)
-			break;
+    while (count == size && ret >= 0) {
+        size += count - 1;
+        if (size < count)
+            break;
 
-		ptr = realloc(str, size);
-		if (!ptr)
-			break;
+        ptr = realloc(str, size);
+        if (!ptr)
+            break;
 
-		str = ptr + count;
-		count = size - count;
+        str = ptr + count;
+        count = size - count;
 
-		caml_enter_blocking_section();
-		ret = xc_readconsolering(_H(xch), str, &count, 0, 1, &index);
-		caml_leave_blocking_section();
+        caml_enter_blocking_section();
+        ret = xc_readconsolering(_H(xch), str, &count, 0, 1, &index);
+        caml_leave_blocking_section();
 
-		count += str - ptr;
-		str = ptr;
-	}
+        count += str - ptr;
+        str = ptr;
+    }
 
-	/*
-	 * If we didn't break because of an overflow with size, and we have
-	 * needed to realloc() ourself more space, update our tracking of the
-	 * real console ring size.
-	 */
-	if (size > conring_size)
-		conring_size = size;
+    /*
+     * If we didn't break because of an overflow with size, and we have
+     * needed to realloc() ourself more space, update our tracking of the
+     * real console ring size.
+     */
+    if (size > conring_size)
+        conring_size = size;
 
-	ring = caml_alloc_string(count);
-	memcpy((char *) String_val(ring), str, count);
-	free(str);
+    ring = caml_alloc_string(count);
+    memcpy((char *) String_val(ring), str, count);
+    free(str);
 
-	CAMLreturn(ring);
+    CAMLreturn(ring);
 }
 
 CAMLprim value stub_xc_send_debug_keys(value xch, value keys)
 {
-	CAMLparam2(xch, keys);
-	int r;
+    CAMLparam2(xch, keys);
+    int r;
 
-	r = xc_send_debug_keys(_H(xch), String_val(keys));
-	if (r)
-		failwith_xc(_H(xch));
-	CAMLreturn(Val_unit);
+    r = xc_send_debug_keys(_H(xch), String_val(keys));
+    if (r)
+        failwith_xc(_H(xch));
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_xc_physinfo(value xch)
 {
-	CAMLparam1(xch);
-	CAMLlocal4(physinfo, cap_list, arch_cap_flags, arch_cap_list);
-	xc_physinfo_t c_physinfo;
-	int r, arch_cap_flags_tag;
+    CAMLparam1(xch);
+    CAMLlocal4(physinfo, cap_list, arch_cap_flags, arch_cap_list);
+    xc_physinfo_t c_physinfo;
+    int r, arch_cap_flags_tag;
 
-	caml_enter_blocking_section();
-	r = xc_physinfo(_H(xch), &c_physinfo);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    r = xc_physinfo(_H(xch), &c_physinfo);
+    caml_leave_blocking_section();
 
-	if (r)
-		failwith_xc(_H(xch));
+    if (r)
+        failwith_xc(_H(xch));
 
-	/*
-	 * capabilities: physinfo_cap_flag list;
-	 */
-	cap_list = c_bitmap_to_ocaml_list
-		/* ! physinfo_cap_flag CAP_ lc */
-		/* ! XEN_SYSCTL_PHYSCAP_ XEN_SYSCTL_PHYSCAP_MAX max */
-		(c_physinfo.capabilities);
+    /*
+     * capabilities: physinfo_cap_flag list;
+     */
+    cap_list = c_bitmap_to_ocaml_list
+        /* ! physinfo_cap_flag CAP_ lc */
+        /* ! XEN_SYSCTL_PHYSCAP_ XEN_SYSCTL_PHYSCAP_MAX max */
+        (c_physinfo.capabilities);
 
-	physinfo = caml_alloc_tuple(11);
-	Store_field(physinfo, 0, Val_int(c_physinfo.threads_per_core));
-	Store_field(physinfo, 1, Val_int(c_physinfo.cores_per_socket));
-	Store_field(physinfo, 2, Val_int(c_physinfo.nr_cpus));
-	Store_field(physinfo, 3, Val_int(c_physinfo.max_node_id));
-	Store_field(physinfo, 4, Val_int(c_physinfo.cpu_khz));
-	Store_field(physinfo, 5, caml_copy_nativeint(c_physinfo.total_pages));
-	Store_field(physinfo, 6, caml_copy_nativeint(c_physinfo.free_pages));
-	Store_field(physinfo, 7, caml_copy_nativeint(c_physinfo.scrub_pages));
-	Store_field(physinfo, 8, cap_list);
-	Store_field(physinfo, 9, Val_int(c_physinfo.max_cpu_id + 1));
+    physinfo = caml_alloc_tuple(11);
+    Store_field(physinfo, 0, Val_int(c_physinfo.threads_per_core));
+    Store_field(physinfo, 1, Val_int(c_physinfo.cores_per_socket));
+    Store_field(physinfo, 2, Val_int(c_physinfo.nr_cpus));
+    Store_field(physinfo, 3, Val_int(c_physinfo.max_node_id));
+    Store_field(physinfo, 4, Val_int(c_physinfo.cpu_khz));
+    Store_field(physinfo, 5, caml_copy_nativeint(c_physinfo.total_pages));
+    Store_field(physinfo, 6, caml_copy_nativeint(c_physinfo.free_pages));
+    Store_field(physinfo, 7, caml_copy_nativeint(c_physinfo.scrub_pages));
+    Store_field(physinfo, 8, cap_list);
+    Store_field(physinfo, 9, Val_int(c_physinfo.max_cpu_id + 1));
 
 #if defined(__i386__) || defined(__x86_64__)
-	arch_cap_list = Tag_cons;
+    arch_cap_list = Tag_cons;
 
-	arch_cap_flags_tag = 1; /* tag x86 */
+    arch_cap_flags_tag = 1; /* tag x86 */
 #else
-	caml_failwith("Unhandled architecture");
+    caml_failwith("Unhandled architecture");
 #endif
 
-	arch_cap_flags = caml_alloc_small(1, arch_cap_flags_tag);
-	Store_field(arch_cap_flags, 0, arch_cap_list);
-	Store_field(physinfo, 10, arch_cap_flags);
+    arch_cap_flags = caml_alloc_small(1, arch_cap_flags_tag);
+    Store_field(arch_cap_flags, 0, arch_cap_list);
+    Store_field(physinfo, 10, arch_cap_flags);
 
-	CAMLreturn(physinfo);
+    CAMLreturn(physinfo);
 }
 
 CAMLprim value stub_xc_pcpu_info(value xch, value nr_cpus)
 {
-	CAMLparam2(xch, nr_cpus);
-	CAMLlocal2(pcpus, v);
-	xc_cpuinfo_t *info;
-	int r, size;
+    CAMLparam2(xch, nr_cpus);
+    CAMLlocal2(pcpus, v);
+    xc_cpuinfo_t *info;
+    int r, size;
 
-	if (Int_val(nr_cpus) < 1)
-		caml_invalid_argument("nr_cpus");
+    if (Int_val(nr_cpus) < 1)
+        caml_invalid_argument("nr_cpus");
 
-	info = calloc(Int_val(nr_cpus) + 1, sizeof(*info));
-	if (!info)
-		caml_raise_out_of_memory();
+    info = calloc(Int_val(nr_cpus) + 1, sizeof(*info));
+    if (!info)
+        caml_raise_out_of_memory();
 
-	caml_enter_blocking_section();
-	r = xc_getcpuinfo(_H(xch), Int_val(nr_cpus), info, &size);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    r = xc_getcpuinfo(_H(xch), Int_val(nr_cpus), info, &size);
+    caml_leave_blocking_section();
 
-	if (r) {
-		free(info);
-		failwith_xc(_H(xch));
-	}
+    if (r) {
+        free(info);
+        failwith_xc(_H(xch));
+    }
 
-	if (size > 0) {
-		int i;
-		pcpus = caml_alloc(size, 0);
-		for (i = 0; i < size; i++) {
-			v = caml_copy_int64(info[i].idletime);
-			caml_modify(&Field(pcpus, i), v);
-		}
-	} else
-		pcpus = Atom(0);
-	free(info);
-	CAMLreturn(pcpus);
+    if (size > 0) {
+        int i;
+        pcpus = caml_alloc(size, 0);
+        for (i = 0; i < size; i++) {
+            v = caml_copy_int64(info[i].idletime);
+            caml_modify(&Field(pcpus, i), v);
+        }
+    } else
+        pcpus = Atom(0);
+    free(info);
+    CAMLreturn(pcpus);
 }
 
 CAMLprim value stub_xc_domain_setmaxmem(value xch, value domid,
                                         value max_memkb)
 {
-	CAMLparam3(xch, domid, max_memkb);
-	int retval;
+    CAMLparam3(xch, domid, max_memkb);
+    int retval;
 
-	uint32_t c_domid = _D(domid);
-	unsigned int c_max_memkb = Int64_val(max_memkb);
-	caml_enter_blocking_section();
-	retval = xc_domain_setmaxmem(_H(xch), c_domid,
-	                                 c_max_memkb);
-	caml_leave_blocking_section();
-	if (retval)
-		failwith_xc(_H(xch));
-	CAMLreturn(Val_unit);
+    uint32_t c_domid = _D(domid);
+    unsigned int c_max_memkb = Int64_val(max_memkb);
+    caml_enter_blocking_section();
+    retval = xc_domain_setmaxmem(_H(xch), c_domid,
+                                     c_max_memkb);
+    caml_leave_blocking_section();
+    if (retval)
+        failwith_xc(_H(xch));
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_xc_domain_set_memmap_limit(value xch, value domid,
                                                value map_limitkb)
 {
-	CAMLparam3(xch, domid, map_limitkb);
-	unsigned long v;
-	int retval;
+    CAMLparam3(xch, domid, map_limitkb);
+    unsigned long v;
+    int retval;
 
-	v = Int64_val(map_limitkb);
-	retval = xc_domain_set_memmap_limit(_H(xch), _D(domid), v);
-	if (retval)
-		failwith_xc(_H(xch));
+    v = Int64_val(map_limitkb);
+    retval = xc_domain_set_memmap_limit(_H(xch), _D(domid), v);
+    if (retval)
+        failwith_xc(_H(xch));
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_xc_domain_memory_increase_reservation(value xch,
                                                           value domid,
                                                           value mem_kb)
 {
-	CAMLparam3(xch, domid, mem_kb);
-	int retval;
+    CAMLparam3(xch, domid, mem_kb);
+    int retval;
 
-	unsigned long nr_extents = ((unsigned long)(Int64_val(mem_kb))) >> (XC_PAGE_SHIFT - 10);
+    unsigned long nr_extents = ((unsigned long)(Int64_val(mem_kb))) >> (XC_PAGE_SHIFT - 10);
 
-	uint32_t c_domid = _D(domid);
-	caml_enter_blocking_section();
-	retval = xc_domain_increase_reservation_exact(_H(xch), c_domid,
-							  nr_extents, 0, 0, NULL);
-	caml_leave_blocking_section();
+    uint32_t c_domid = _D(domid);
+    caml_enter_blocking_section();
+    retval = xc_domain_increase_reservation_exact(_H(xch), c_domid,
+                              nr_extents, 0, 0, NULL);
+    caml_leave_blocking_section();
 
-	if (retval)
-		failwith_xc(_H(xch));
-	CAMLreturn(Val_unit);
+    if (retval)
+        failwith_xc(_H(xch));
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_xc_version_version(value xch)
 {
-	CAMLparam1(xch);
-	CAMLlocal1(result);
-	xen_extraversion_t extra;
-	long packed;
-	int retval;
+    CAMLparam1(xch);
+    CAMLlocal1(result);
+    xen_extraversion_t extra;
+    long packed;
+    int retval;
 
-	caml_enter_blocking_section();
-	packed = xc_version(_H(xch), XENVER_version, NULL);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    packed = xc_version(_H(xch), XENVER_version, NULL);
+    caml_leave_blocking_section();
 
-	if (packed < 0)
-		failwith_xc(_H(xch));
+    if (packed < 0)
+        failwith_xc(_H(xch));
 
-	caml_enter_blocking_section();
-	retval = xc_version(_H(xch), XENVER_extraversion, &extra);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    retval = xc_version(_H(xch), XENVER_extraversion, &extra);
+    caml_leave_blocking_section();
 
-	if (retval)
-		failwith_xc(_H(xch));
+    if (retval)
+        failwith_xc(_H(xch));
 
-	result = caml_alloc_tuple(3);
+    result = caml_alloc_tuple(3);
 
-	Store_field(result, 0, Val_int(packed >> 16));
-	Store_field(result, 1, Val_int(packed & 0xffff));
-	Store_field(result, 2, caml_copy_string(extra));
+    Store_field(result, 0, Val_int(packed >> 16));
+    Store_field(result, 1, Val_int(packed & 0xffff));
+    Store_field(result, 2, caml_copy_string(extra));
 
-	CAMLreturn(result);
+    CAMLreturn(result);
 }
 
 
 CAMLprim value stub_xc_version_compile_info(value xch)
 {
-	CAMLparam1(xch);
-	CAMLlocal1(result);
-	xen_compile_info_t ci;
-	int retval;
+    CAMLparam1(xch);
+    CAMLlocal1(result);
+    xen_compile_info_t ci;
+    int retval;
 
-	caml_enter_blocking_section();
-	retval = xc_version(_H(xch), XENVER_compile_info, &ci);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    retval = xc_version(_H(xch), XENVER_compile_info, &ci);
+    caml_leave_blocking_section();
 
-	if (retval)
-		failwith_xc(_H(xch));
+    if (retval)
+        failwith_xc(_H(xch));
 
-	result = caml_alloc_tuple(4);
+    result = caml_alloc_tuple(4);
 
-	Store_field(result, 0, caml_copy_string(ci.compiler));
-	Store_field(result, 1, caml_copy_string(ci.compile_by));
-	Store_field(result, 2, caml_copy_string(ci.compile_domain));
-	Store_field(result, 3, caml_copy_string(ci.compile_date));
+    Store_field(result, 0, caml_copy_string(ci.compiler));
+    Store_field(result, 1, caml_copy_string(ci.compile_by));
+    Store_field(result, 2, caml_copy_string(ci.compile_domain));
+    Store_field(result, 3, caml_copy_string(ci.compile_date));
 
-	CAMLreturn(result);
+    CAMLreturn(result);
 }
 
 
 static value xc_version_single_string(value xch, int code, void *info)
 {
-	CAMLparam1(xch);
-	int retval;
+    CAMLparam1(xch);
+    int retval;
 
-	caml_enter_blocking_section();
-	retval = xc_version(_H(xch), code, info);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    retval = xc_version(_H(xch), code, info);
+    caml_leave_blocking_section();
 
-	if (retval)
-		failwith_xc(_H(xch));
+    if (retval)
+        failwith_xc(_H(xch));
 
-	CAMLreturn(caml_copy_string((char *)info));
+    CAMLreturn(caml_copy_string((char *)info));
 }
 
 
 CAMLprim value stub_xc_version_changeset(value xch)
 {
-	xen_changeset_info_t ci;
+    xen_changeset_info_t ci;
 
-	return xc_version_single_string(xch, XENVER_changeset, &ci);
+    return xc_version_single_string(xch, XENVER_changeset, &ci);
 }
 
 
 CAMLprim value stub_xc_version_capabilities(value xch)
 {
-	xen_capabilities_info_t ci;
+    xen_capabilities_info_t ci;
 
-	return xc_version_single_string(xch, XENVER_capabilities, &ci);
+    return xc_version_single_string(xch, XENVER_capabilities, &ci);
 }
 
 
 CAMLprim value stub_pages_to_kib(value pages)
 {
-	CAMLparam1(pages);
+    CAMLparam1(pages);
 
-	CAMLreturn(caml_copy_int64(Int64_val(pages) << (XC_PAGE_SHIFT - 10)));
+    CAMLreturn(caml_copy_int64(Int64_val(pages) << (XC_PAGE_SHIFT - 10)));
 }
 
 
 CAMLprim value stub_map_foreign_range(value xch, value dom,
                                       value size, value mfn)
 {
-	CAMLparam4(xch, dom, size, mfn);
-	CAMLlocal1(result);
-	struct mmap_interface *intf;
-	uint32_t c_dom;
-	unsigned long c_mfn;
+    CAMLparam4(xch, dom, size, mfn);
+    CAMLlocal1(result);
+    struct mmap_interface *intf;
+    uint32_t c_dom;
+    unsigned long c_mfn;
 
-	result = caml_alloc(sizeof(struct mmap_interface), Abstract_tag);
-	intf = (struct mmap_interface *) result;
+    result = caml_alloc(sizeof(struct mmap_interface), Abstract_tag);
+    intf = (struct mmap_interface *) result;
 
-	intf->len = Int_val(size);
+    intf->len = Int_val(size);
 
-	c_dom = _D(dom);
-	c_mfn = Nativeint_val(mfn);
-	caml_enter_blocking_section();
-	intf->addr = xc_map_foreign_range(_H(xch), c_dom,
-	                                  intf->len, PROT_READ|PROT_WRITE,
-	                                  c_mfn);
-	caml_leave_blocking_section();
-	if (!intf->addr)
-		caml_failwith("xc_map_foreign_range error");
-	CAMLreturn(result);
+    c_dom = _D(dom);
+    c_mfn = Nativeint_val(mfn);
+    caml_enter_blocking_section();
+    intf->addr = xc_map_foreign_range(_H(xch), c_dom,
+                                      intf->len, PROT_READ|PROT_WRITE,
+                                      c_mfn);
+    caml_leave_blocking_section();
+    if (!intf->addr)
+        caml_failwith("xc_map_foreign_range error");
+    CAMLreturn(result);
 }
 
 CAMLprim value stub_sched_credit_domain_get(value xch, value domid)
 {
-	CAMLparam2(xch, domid);
-	CAMLlocal1(sdom);
-	struct xen_domctl_sched_credit c_sdom;
-	int ret;
+    CAMLparam2(xch, domid);
+    CAMLlocal1(sdom);
+    struct xen_domctl_sched_credit c_sdom;
+    int ret;
 
-	caml_enter_blocking_section();
-	ret = xc_sched_credit_domain_get(_H(xch), _D(domid), &c_sdom);
-	caml_leave_blocking_section();
-	if (ret != 0)
-		failwith_xc(_H(xch));
+    caml_enter_blocking_section();
+    ret = xc_sched_credit_domain_get(_H(xch), _D(domid), &c_sdom);
+    caml_leave_blocking_section();
+    if (ret != 0)
+        failwith_xc(_H(xch));
 
-	sdom = caml_alloc_tuple(2);
-	Store_field(sdom, 0, Val_int(c_sdom.weight));
-	Store_field(sdom, 1, Val_int(c_sdom.cap));
+    sdom = caml_alloc_tuple(2);
+    Store_field(sdom, 0, Val_int(c_sdom.weight));
+    Store_field(sdom, 1, Val_int(c_sdom.cap));
 
-	CAMLreturn(sdom);
+    CAMLreturn(sdom);
 }
 
 CAMLprim value stub_sched_credit_domain_set(value xch, value domid,
                                             value sdom)
 {
-	CAMLparam3(xch, domid, sdom);
-	struct xen_domctl_sched_credit c_sdom;
-	int ret;
+    CAMLparam3(xch, domid, sdom);
+    struct xen_domctl_sched_credit c_sdom;
+    int ret;
 
-	c_sdom.weight = Int_val(Field(sdom, 0));
-	c_sdom.cap = Int_val(Field(sdom, 1));
-	caml_enter_blocking_section();
-	ret = xc_sched_credit_domain_set(_H(xch), _D(domid), &c_sdom);
-	caml_leave_blocking_section();
-	if (ret != 0)
-		failwith_xc(_H(xch));
+    c_sdom.weight = Int_val(Field(sdom, 0));
+    c_sdom.cap = Int_val(Field(sdom, 1));
+    caml_enter_blocking_section();
+    ret = xc_sched_credit_domain_set(_H(xch), _D(domid), &c_sdom);
+    caml_leave_blocking_section();
+    if (ret != 0)
+        failwith_xc(_H(xch));
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_shadow_allocation_get(value xch, value domid)
 {
-	CAMLparam2(xch, domid);
-	CAMLlocal1(mb);
-	unsigned int c_mb;
-	int ret;
+    CAMLparam2(xch, domid);
+    CAMLlocal1(mb);
+    unsigned int c_mb;
+    int ret;
 
-	caml_enter_blocking_section();
-	ret = xc_shadow_control(_H(xch), _D(domid),
-				XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION,
-				&c_mb, 0);
-	caml_leave_blocking_section();
-	if (ret != 0)
-		failwith_xc(_H(xch));
+    caml_enter_blocking_section();
+    ret = xc_shadow_control(_H(xch), _D(domid),
+                XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION,
+                &c_mb, 0);
+    caml_leave_blocking_section();
+    if (ret != 0)
+        failwith_xc(_H(xch));
 
-	mb = Val_int(c_mb);
-	CAMLreturn(mb);
+    mb = Val_int(c_mb);
+    CAMLreturn(mb);
 }
 
 CAMLprim value stub_shadow_allocation_set(value xch, value domid,
-					  value mb)
+                      value mb)
 {
-	CAMLparam3(xch, domid, mb);
-	unsigned int c_mb;
-	int ret;
+    CAMLparam3(xch, domid, mb);
+    unsigned int c_mb;
+    int ret;
 
-	c_mb = Int_val(mb);
-	caml_enter_blocking_section();
-	ret = xc_shadow_control(_H(xch), _D(domid),
-				XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
-				&c_mb, 0);
-	caml_leave_blocking_section();
-	if (ret != 0)
-		failwith_xc(_H(xch));
+    c_mb = Int_val(mb);
+    caml_enter_blocking_section();
+    ret = xc_shadow_control(_H(xch), _D(domid),
+                XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
+                &c_mb, 0);
+    caml_leave_blocking_section();
+    if (ret != 0)
+        failwith_xc(_H(xch));
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_xc_domain_ioport_permission(value xch, value domid,
-					       value start_port, value nr_ports,
-					       value allow)
+                           value start_port, value nr_ports,
+                           value allow)
 {
-	CAMLparam5(xch, domid, start_port, nr_ports, allow);
-	uint32_t c_start_port, c_nr_ports;
-	uint8_t c_allow;
-	int ret;
+    CAMLparam5(xch, domid, start_port, nr_ports, allow);
+    uint32_t c_start_port, c_nr_ports;
+    uint8_t c_allow;
+    int ret;
 
-	c_start_port = Int_val(start_port);
-	c_nr_ports = Int_val(nr_ports);
-	c_allow = Bool_val(allow);
+    c_start_port = Int_val(start_port);
+    c_nr_ports = Int_val(nr_ports);
+    c_allow = Bool_val(allow);
 
-	ret = xc_domain_ioport_permission(_H(xch), _D(domid),
-					 c_start_port, c_nr_ports, c_allow);
-	if (ret < 0)
-		failwith_xc(_H(xch));
+    ret = xc_domain_ioport_permission(_H(xch), _D(domid),
+                     c_start_port, c_nr_ports, c_allow);
+    if (ret < 0)
+        failwith_xc(_H(xch));
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_xc_domain_iomem_permission(value xch, value domid,
-					       value start_pfn, value nr_pfns,
-					       value allow)
+                           value start_pfn, value nr_pfns,
+                           value allow)
 {
-	CAMLparam5(xch, domid, start_pfn, nr_pfns, allow);
-	unsigned long c_start_pfn, c_nr_pfns;
-	uint8_t c_allow;
-	int ret;
+    CAMLparam5(xch, domid, start_pfn, nr_pfns, allow);
+    unsigned long c_start_pfn, c_nr_pfns;
+    uint8_t c_allow;
+    int ret;
 
-	c_start_pfn = Nativeint_val(start_pfn);
-	c_nr_pfns = Nativeint_val(nr_pfns);
-	c_allow = Bool_val(allow);
+    c_start_pfn = Nativeint_val(start_pfn);
+    c_nr_pfns = Nativeint_val(nr_pfns);
+    c_allow = Bool_val(allow);
 
-	ret = xc_domain_iomem_permission(_H(xch), _D(domid),
-					 c_start_pfn, c_nr_pfns, c_allow);
-	if (ret < 0)
-		failwith_xc(_H(xch));
+    ret = xc_domain_iomem_permission(_H(xch), _D(domid),
+                     c_start_pfn, c_nr_pfns, c_allow);
+    if (ret < 0)
+        failwith_xc(_H(xch));
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_xc_domain_irq_permission(value xch, value domid,
-					     value pirq, value allow)
+                         value pirq, value allow)
 {
-	CAMLparam4(xch, domid, pirq, allow);
-	uint32_t c_pirq;
-	bool c_allow;
-	int ret;
+    CAMLparam4(xch, domid, pirq, allow);
+    uint32_t c_pirq;
+    bool c_allow;
+    int ret;
 
-	c_pirq = Int_val(pirq);
-	c_allow = Bool_val(allow);
+    c_pirq = Int_val(pirq);
+    c_allow = Bool_val(allow);
 
-	ret = xc_domain_irq_permission(_H(xch), _D(domid),
-				       c_pirq, c_allow);
-	if (ret < 0)
-		failwith_xc(_H(xch));
+    ret = xc_domain_irq_permission(_H(xch), _D(domid),
+                       c_pirq, c_allow);
+    if (ret < 0)
+        failwith_xc(_H(xch));
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_xc_hvm_param_get(value xch, value domid, value param)
 {
-	CAMLparam3(xch, domid, param);
-	uint64_t val;
-	int ret;
+    CAMLparam3(xch, domid, param);
+    uint64_t val;
+    int ret;
 
-	caml_enter_blocking_section();
-	ret = xc_hvm_param_get(_H(xch), _D(domid), Int_val(param), &val);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = xc_hvm_param_get(_H(xch), _D(domid), Int_val(param), &val);
+    caml_leave_blocking_section();
 
-	if ( ret )
-		failwith_xc(_H(xch));
+    if ( ret )
+        failwith_xc(_H(xch));
 
-	CAMLreturn(caml_copy_int64(val));
+    CAMLreturn(caml_copy_int64(val));
 }
 
 CAMLprim value stub_xc_hvm_param_set(value xch, value domid, value param, value val)
 {
-	CAMLparam4(xch, domid, param, val);
-	int ret;
+    CAMLparam4(xch, domid, param, val);
+    int ret;
 
-	caml_enter_blocking_section();
-	ret = xc_hvm_param_set(_H(xch), _D(domid), Int_val(param), Int64_val(val));
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = xc_hvm_param_set(_H(xch), _D(domid), Int_val(param), Int64_val(val));
+    caml_leave_blocking_section();
 
-	if ( ret )
-		failwith_xc(_H(xch));
+    if ( ret )
+        failwith_xc(_H(xch));
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 static uint32_t encode_sbdf(int domain, int bus, int dev, int func)
 {
-	return  ((uint32_t)domain & 0xffff) << 16 |
-		((uint32_t)bus    &   0xff) << 8  |
-		((uint32_t)dev    &   0x1f) << 3  |
-		((uint32_t)func   &    0x7);
+    return  ((uint32_t)domain & 0xffff) << 16 |
+        ((uint32_t)bus    &   0xff) << 8  |
+        ((uint32_t)dev    &   0x1f) << 3  |
+        ((uint32_t)func   &    0x7);
 }
 
 CAMLprim value stub_xc_domain_test_assign_device(value xch, value domid, value desc)
 {
-	CAMLparam3(xch, domid, desc);
-	int ret;
-	int domain, bus, dev, func;
-	uint32_t sbdf;
+    CAMLparam3(xch, domid, desc);
+    int ret;
+    int domain, bus, dev, func;
+    uint32_t sbdf;
 
-	domain = Int_val(Field(desc, 0));
-	bus = Int_val(Field(desc, 1));
-	dev = Int_val(Field(desc, 2));
-	func = Int_val(Field(desc, 3));
-	sbdf = encode_sbdf(domain, bus, dev, func);
+    domain = Int_val(Field(desc, 0));
+    bus = Int_val(Field(desc, 1));
+    dev = Int_val(Field(desc, 2));
+    func = Int_val(Field(desc, 3));
+    sbdf = encode_sbdf(domain, bus, dev, func);
 
-	ret = xc_test_assign_device(_H(xch), _D(domid), sbdf);
+    ret = xc_test_assign_device(_H(xch), _D(domid), sbdf);
 
-	CAMLreturn(Val_bool(ret == 0));
+    CAMLreturn(Val_bool(ret == 0));
 }
 
 static int domain_assign_device_rdm_flag_table[] = {
@@ -1249,96 +1249,96 @@ static int domain_assign_device_rdm_flag_table[] = {
 CAMLprim value stub_xc_domain_assign_device(value xch, value domid, value desc,
                                             value rflag)
 {
-	CAMLparam4(xch, domid, desc, rflag);
-	int ret;
-	int domain, bus, dev, func;
-	uint32_t sbdf, flag;
+    CAMLparam4(xch, domid, desc, rflag);
+    int ret;
+    int domain, bus, dev, func;
+    uint32_t sbdf, flag;
 
-	domain = Int_val(Field(desc, 0));
-	bus = Int_val(Field(desc, 1));
-	dev = Int_val(Field(desc, 2));
-	func = Int_val(Field(desc, 3));
-	sbdf = encode_sbdf(domain, bus, dev, func);
+    domain = Int_val(Field(desc, 0));
+    bus = Int_val(Field(desc, 1));
+    dev = Int_val(Field(desc, 2));
+    func = Int_val(Field(desc, 3));
+    sbdf = encode_sbdf(domain, bus, dev, func);
 
-	ret = Int_val(Field(rflag, 0));
-	flag = domain_assign_device_rdm_flag_table[ret];
+    ret = Int_val(Field(rflag, 0));
+    flag = domain_assign_device_rdm_flag_table[ret];
 
-	ret = xc_assign_device(_H(xch), _D(domid), sbdf, flag);
+    ret = xc_assign_device(_H(xch), _D(domid), sbdf, flag);
 
-	if (ret < 0)
-		failwith_xc(_H(xch));
-	CAMLreturn(Val_unit);
+    if (ret < 0)
+        failwith_xc(_H(xch));
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_xc_domain_deassign_device(value xch, value domid, value desc)
 {
-	CAMLparam3(xch, domid, desc);
-	int ret;
-	int domain, bus, dev, func;
-	uint32_t sbdf;
+    CAMLparam3(xch, domid, desc);
+    int ret;
+    int domain, bus, dev, func;
+    uint32_t sbdf;
 
-	domain = Int_val(Field(desc, 0));
-	bus = Int_val(Field(desc, 1));
-	dev = Int_val(Field(desc, 2));
-	func = Int_val(Field(desc, 3));
-	sbdf = encode_sbdf(domain, bus, dev, func);
+    domain = Int_val(Field(desc, 0));
+    bus = Int_val(Field(desc, 1));
+    dev = Int_val(Field(desc, 2));
+    func = Int_val(Field(desc, 3));
+    sbdf = encode_sbdf(domain, bus, dev, func);
 
-	ret = xc_deassign_device(_H(xch), _D(domid), sbdf);
+    ret = xc_deassign_device(_H(xch), _D(domid), sbdf);
 
-	if (ret < 0)
-		failwith_xc(_H(xch));
-	CAMLreturn(Val_unit);
+    if (ret < 0)
+        failwith_xc(_H(xch));
+    CAMLreturn(Val_unit);
 }
 
 CAMLprim value stub_xc_get_cpu_featureset(value xch, value idx)
 {
-	CAMLparam2(xch, idx);
-	CAMLlocal1(bitmap_val);
+    CAMLparam2(xch, idx);
+    CAMLlocal1(bitmap_val);
 #if defined(__i386__) || defined(__x86_64__)
 
-	/* Safe, because of the global ocaml lock. */
-	static uint32_t fs_len;
+    /* Safe, because of the global ocaml lock. */
+    static uint32_t fs_len;
 
-	if (fs_len == 0)
-	{
-		int ret = xc_get_cpu_featureset(_H(xch), 0, &fs_len, NULL);
+    if (fs_len == 0)
+    {
+        int ret = xc_get_cpu_featureset(_H(xch), 0, &fs_len, NULL);
 
-		if (ret || (fs_len == 0))
-			failwith_xc(_H(xch));
-	}
+        if (ret || (fs_len == 0))
+            failwith_xc(_H(xch));
+    }
 
-	{
-		/* To/from hypervisor to retrieve actual featureset */
-		uint32_t fs[fs_len], len = fs_len;
-		unsigned int i;
+    {
+        /* To/from hypervisor to retrieve actual featureset */
+        uint32_t fs[fs_len], len = fs_len;
+        unsigned int i;
 
-		int ret = xc_get_cpu_featureset(_H(xch), Int_val(idx), &len, fs);
+        int ret = xc_get_cpu_featureset(_H(xch), Int_val(idx), &len, fs);
 
-		if (ret)
-			failwith_xc(_H(xch));
+        if (ret)
+            failwith_xc(_H(xch));
 
-		bitmap_val = caml_alloc(len, 0);
+        bitmap_val = caml_alloc(len, 0);
 
-		for (i = 0; i < len; ++i)
-			Store_field(bitmap_val, i, caml_copy_int64(fs[i]));
-	}
+        for (i = 0; i < len; ++i)
+            Store_field(bitmap_val, i, caml_copy_int64(fs[i]));
+    }
 #else
-	caml_failwith("xc_get_cpu_featureset: not implemented");
+    caml_failwith("xc_get_cpu_featureset: not implemented");
 #endif
-	CAMLreturn(bitmap_val);
+    CAMLreturn(bitmap_val);
 }
 
 CAMLprim value stub_xc_watchdog(value xch, value domid, value timeout)
 {
-	CAMLparam3(xch, domid, timeout);
-	int ret;
-	unsigned int c_timeout = Int32_val(timeout);
+    CAMLparam3(xch, domid, timeout);
+    int ret;
+    unsigned int c_timeout = Int32_val(timeout);
 
-	ret = xc_watchdog(_H(xch), _D(domid), c_timeout);
-	if (ret < 0)
-		failwith_xc(_H(xch));
+    ret = xc_watchdog(_H(xch), _D(domid), c_timeout);
+    if (ret < 0)
+        failwith_xc(_H(xch));
 
-	CAMLreturn(Val_int(ret));
+    CAMLreturn(Val_int(ret));
 }
 
 /*
diff --git a/tools/ocaml/libs/xentoollog/caml_xentoollog.h b/tools/ocaml/libs/xentoollog/caml_xentoollog.h
index 0eb7618512..5ad4a4d5b2 100644
--- a/tools/ocaml/libs/xentoollog/caml_xentoollog.h
+++ b/tools/ocaml/libs/xentoollog/caml_xentoollog.h
@@ -15,9 +15,9 @@
  */
 
 struct caml_xtl {
-	xentoollog_logger vtable;
-	char *vmessage_cb;
-	char *progress_cb;
+    xentoollog_logger vtable;
+    char *vmessage_cb;
+    char *progress_cb;
 };
 
 #define Xtl_val(x)(*((struct caml_xtl **) Data_custom_val(x)))
diff --git a/tools/ocaml/libs/xentoollog/xentoollog_stubs.c b/tools/ocaml/libs/xentoollog/xentoollog_stubs.c
index e4306a0c2f..8f1ced1fa0 100644
--- a/tools/ocaml/libs/xentoollog/xentoollog_stubs.c
+++ b/tools/ocaml/libs/xentoollog/xentoollog_stubs.c
@@ -40,14 +40,14 @@ caml_local_roots = caml__frame; \
 
 static char * dup_String_val(value s)
 {
-	int len;
-	char *c;
-	len = caml_string_length(s);
-	c = calloc(len + 1, sizeof(char));
-	if (!c)
-		caml_raise_out_of_memory();
-	memcpy(c, String_val(s), len);
-	return c;
+    int len;
+    char *c;
+    len = caml_string_length(s);
+    c = calloc(len + 1, sizeof(char));
+    if (!c)
+        caml_raise_out_of_memory();
+    memcpy(c, String_val(s), len);
+    return c;
 }
 
 #include "_xtl_levels.inc"
@@ -62,144 +62,144 @@ static char * dup_String_val(value s)
 
 static value Val_some(value v)
 {
-	CAMLparam1(v);
-	CAMLlocal1(some);
-	some = caml_alloc(1, 0);
-	Store_field(some, 0, v);
-	CAMLreturn(some);
+    CAMLparam1(v);
+    CAMLlocal1(some);
+    some = caml_alloc(1, 0);
+    Store_field(some, 0, v);
+    CAMLreturn(some);
 }
 
 static value Val_errno(int errnoval)
 {
-	if (errnoval == -1)
-		return Val_none;
-	return Val_some(Val_int(errnoval));
+    if (errnoval == -1)
+        return Val_none;
+    return Val_some(Val_int(errnoval));
 }
 
 static value Val_context(const char *context)
 {
-	if (context == NULL)
-		return Val_none;
-	return Val_some(caml_copy_string(context));
+    if (context == NULL)
+        return Val_none;
+    return Val_some(caml_copy_string(context));
 }
 
 static void stub_xtl_ocaml_vmessage(struct xentoollog_logger *logger,
-	xentoollog_level level,
-	int errnoval,
-	const char *context,
-	const char *format,
-	va_list al)
+    xentoollog_level level,
+    int errnoval,
+    const char *context,
+    const char *format,
+    va_list al)
 {
-	caml_leave_blocking_section();
-	CAMLparam0();
-	CAMLlocalN(args, 4);
-	struct caml_xtl *xtl = (struct caml_xtl*)logger;
-	const value *func = caml_named_value(xtl->vmessage_cb);
-	char *msg;
+    caml_leave_blocking_section();
+    CAMLparam0();
+    CAMLlocalN(args, 4);
+    struct caml_xtl *xtl = (struct caml_xtl*)logger;
+    const value *func = caml_named_value(xtl->vmessage_cb);
+    char *msg;
 
-	if (func == NULL)
-		caml_raise_sys_error(caml_copy_string("Unable to find callback"));
-	if (vasprintf(&msg, format, al) < 0)
-		caml_raise_out_of_memory();
+    if (func == NULL)
+        caml_raise_sys_error(caml_copy_string("Unable to find callback"));
+    if (vasprintf(&msg, format, al) < 0)
+        caml_raise_out_of_memory();
 
-	/* vmessage : level -> int option -> string option -> string -> unit; */
-	args[0] = Val_level(level);
-	args[1] = Val_errno(errnoval);
-	args[2] = Val_context(context);
-	args[3] = caml_copy_string(msg);
+    /* vmessage : level -> int option -> string option -> string -> unit; */
+    args[0] = Val_level(level);
+    args[1] = Val_errno(errnoval);
+    args[2] = Val_context(context);
+    args[3] = caml_copy_string(msg);
 
-	free(msg);
+    free(msg);
 
-	caml_callbackN(*func, 4, args);
-	CAMLdone;
-	caml_enter_blocking_section();
+    caml_callbackN(*func, 4, args);
+    CAMLdone;
+    caml_enter_blocking_section();
 }
 
 static void stub_xtl_ocaml_progress(struct xentoollog_logger *logger,
-	const char *context,
-	const char *doing_what /* no \r,\n */,
-	int percent, unsigned long done, unsigned long total)
+    const char *context,
+    const char *doing_what /* no \r,\n */,
+    int percent, unsigned long done, unsigned long total)
 {
-	caml_leave_blocking_section();
-	CAMLparam0();
-	CAMLlocalN(args, 5);
-	struct caml_xtl *xtl = (struct caml_xtl*)logger;
-	const value *func = caml_named_value(xtl->progress_cb);
+    caml_leave_blocking_section();
+    CAMLparam0();
+    CAMLlocalN(args, 5);
+    struct caml_xtl *xtl = (struct caml_xtl*)logger;
+    const value *func = caml_named_value(xtl->progress_cb);
 
-	if (func == NULL)
-		caml_raise_sys_error(caml_copy_string("Unable to find callback"));
+    if (func == NULL)
+        caml_raise_sys_error(caml_copy_string("Unable to find callback"));
 
-	/* progress : string option -> string -> int -> int64 -> int64 -> unit; */
-	args[0] = Val_context(context);
-	args[1] = caml_copy_string(doing_what);
-	args[2] = Val_int(percent);
-	args[3] = caml_copy_int64(done);
-	args[4] = caml_copy_int64(total);
+    /* progress : string option -> string -> int -> int64 -> int64 -> unit; */
+    args[0] = Val_context(context);
+    args[1] = caml_copy_string(doing_what);
+    args[2] = Val_int(percent);
+    args[3] = caml_copy_int64(done);
+    args[4] = caml_copy_int64(total);
 
-	caml_callbackN(*func, 5, args);
-	CAMLdone;
-	caml_enter_blocking_section();
+    caml_callbackN(*func, 5, args);
+    CAMLdone;
+    caml_enter_blocking_section();
 }
 
 static void xtl_destroy(struct xentoollog_logger *logger)
 {
-	struct caml_xtl *xtl = (struct caml_xtl*)logger;
-	free(xtl->vmessage_cb);
-	free(xtl->progress_cb);
-	free(xtl);
+    struct caml_xtl *xtl = (struct caml_xtl*)logger;
+    free(xtl->vmessage_cb);
+    free(xtl->progress_cb);
+    free(xtl);
 }
 
 void xtl_finalize(value handle)
 {
-	xtl_destroy(XTL);
+    xtl_destroy(XTL);
 }
 
 static struct custom_operations xentoollogger_custom_operations = {
-	"xentoollogger_custom_operations",
-	xtl_finalize /* custom_finalize_default */,
-	custom_compare_default,
-	custom_hash_default,
-	custom_serialize_default,
-	custom_deserialize_default
+    "xentoollogger_custom_operations",
+    xtl_finalize /* custom_finalize_default */,
+    custom_compare_default,
+    custom_hash_default,
+    custom_serialize_default,
+    custom_deserialize_default
 };
 
 /* external _create_logger: (string * string) -> handle = "stub_xtl_create_logger" */
 CAMLprim value stub_xtl_create_logger(value cbs)
 {
-	CAMLparam1(cbs);
-	CAMLlocal1(handle);
-	struct caml_xtl *xtl = malloc(sizeof(*xtl));
-	if (xtl == NULL)
-		caml_raise_out_of_memory();
+    CAMLparam1(cbs);
+    CAMLlocal1(handle);
+    struct caml_xtl *xtl = malloc(sizeof(*xtl));
+    if (xtl == NULL)
+        caml_raise_out_of_memory();
 
-	memset(xtl, 0, sizeof(*xtl));
+    memset(xtl, 0, sizeof(*xtl));
 
-	xtl->vtable.vmessage = &stub_xtl_ocaml_vmessage;
-	xtl->vtable.progress = &stub_xtl_ocaml_progress;
-	xtl->vtable.destroy = &xtl_destroy;
+    xtl->vtable.vmessage = &stub_xtl_ocaml_vmessage;
+    xtl->vtable.progress = &stub_xtl_ocaml_progress;
+    xtl->vtable.destroy = &xtl_destroy;
 
-	xtl->vmessage_cb = dup_String_val(Field(cbs, 0));
-	xtl->progress_cb = dup_String_val(Field(cbs, 1));
+    xtl->vmessage_cb = dup_String_val(Field(cbs, 0));
+    xtl->progress_cb = dup_String_val(Field(cbs, 1));
 
-	handle = caml_alloc_custom(&xentoollogger_custom_operations, sizeof(xtl), 0, 1);
-	Xtl_val(handle) = xtl;
+    handle = caml_alloc_custom(&xentoollogger_custom_operations, sizeof(xtl), 0, 1);
+    Xtl_val(handle) = xtl;
 
-	CAMLreturn(handle);
+    CAMLreturn(handle);
 }
 
 /* external test: handle -> unit = "stub_xtl_test" */
 CAMLprim value stub_xtl_test(value handle)
 {
-	unsigned long l;
-	CAMLparam1(handle);
-	xtl_log(XTL, XTL_DEBUG, -1, "debug", "%s -- debug", __func__);
-	xtl_log(XTL, XTL_INFO, -1, "test", "%s -- test 1", __func__);
-	xtl_log(XTL, XTL_INFO, ENOSYS, "test errno", "%s -- test 2", __func__);
-	xtl_log(XTL, XTL_CRITICAL, -1, "critical", "%s -- critical", __func__);
-	for (l = 0UL; l<=100UL; l += 10UL) {
-		xtl_progress(XTL, "progress", "testing", l, 100UL);
-		usleep(10000);
-	}
-	CAMLreturn(Val_unit);
+    unsigned long l;
+    CAMLparam1(handle);
+    xtl_log(XTL, XTL_DEBUG, -1, "debug", "%s -- debug", __func__);
+    xtl_log(XTL, XTL_INFO, -1, "test", "%s -- test 1", __func__);
+    xtl_log(XTL, XTL_INFO, ENOSYS, "test errno", "%s -- test 2", __func__);
+    xtl_log(XTL, XTL_CRITICAL, -1, "critical", "%s -- critical", __func__);
+    for (l = 0UL; l<=100UL; l += 10UL) {
+        xtl_progress(XTL, "progress", "testing", l, 100UL);
+        usleep(10000);
+    }
+    CAMLreturn(Val_unit);
 }
 
diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
index 45b8af61c7..9dbf5e9660 100644
--- a/tools/ocaml/libs/xl/xenlight_stubs.c
+++ b/tools/ocaml/libs/xl/xenlight_stubs.c
@@ -58,14 +58,14 @@ caml_local_roots = caml__frame; \
 
 static char * dup_String_val(value s)
 {
-	int len;
-	char *c;
-	len = caml_string_length(s);
-	c = calloc(len + 1, sizeof(char));
-	if (!c)
-		caml_raise_out_of_memory();
-	memcpy(c, String_val(s), len);
-	return c;
+    int len;
+    char *c;
+    len = caml_string_length(s);
+    c = calloc(len + 1, sizeof(char));
+    if (!c)
+        caml_raise_out_of_memory();
+    memcpy(c, String_val(s), len);
+    return c;
 }
 
 /* Forward reference: this is defined in the auto-generated include file below. */
@@ -73,157 +73,157 @@ static value Val_error (libxl_error error_c);
 
 static void failwith_xl(int error, char *fname)
 {
-	CAMLparam0();
-	CAMLlocal1(arg);
-	static const value *exc = NULL;
+    CAMLparam0();
+    CAMLlocal1(arg);
+    static const value *exc = NULL;
 
-	/* First time around, lookup by name */
-	if (!exc)
-		exc = caml_named_value("Xenlight.Error");
+    /* First time around, lookup by name */
+    if (!exc)
+        exc = caml_named_value("Xenlight.Error");
 
-	if (!exc)
-		caml_invalid_argument("Exception Xenlight.Error not initialized, please link xenlight.cma");
+    if (!exc)
+        caml_invalid_argument("Exception Xenlight.Error not initialized, please link xenlight.cma");
 
-	arg = caml_alloc(2, 0);
+    arg = caml_alloc(2, 0);
 
-	Store_field(arg, 0, Val_error(error));
-	Store_field(arg, 1, caml_copy_string(fname));
+    Store_field(arg, 0, Val_error(error));
+    Store_field(arg, 1, caml_copy_string(fname));
 
-	caml_raise_with_arg(*exc, arg);
-	CAMLreturn0;
+    caml_raise_with_arg(*exc, arg);
+    CAMLreturn0;
 }
 
 CAMLprim value stub_raise_exception(value unit)
 {
-	CAMLparam1(unit);
-	failwith_xl(ERROR_FAIL, "test exception");
-	CAMLreturn(Val_unit);
+    CAMLparam1(unit);
+    failwith_xl(ERROR_FAIL, "test exception");
+    CAMLreturn(Val_unit);
 }
 
 void ctx_finalize(value ctx)
 {
-	libxl_ctx_free(CTX);
+    libxl_ctx_free(CTX);
 }
 
 static struct custom_operations libxl_ctx_custom_operations = {
-	"libxl_ctx_custom_operations",
-	ctx_finalize /* custom_finalize_default */,
-	custom_compare_default,
-	custom_hash_default,
-	custom_serialize_default,
-	custom_deserialize_default
+    "libxl_ctx_custom_operations",
+    ctx_finalize /* custom_finalize_default */,
+    custom_compare_default,
+    custom_hash_default,
+    custom_serialize_default,
+    custom_deserialize_default
 };
 
 CAMLprim value stub_libxl_ctx_alloc(value logger)
 {
-	CAMLparam1(logger);
-	CAMLlocal1(handle);
-	libxl_ctx *ctx;
-	int ret;
+    CAMLparam1(logger);
+    CAMLlocal1(handle);
+    libxl_ctx *ctx;
+    int ret;
 
-	ret = libxl_ctx_alloc(&ctx, LIBXL_VERSION, 0, (xentoollog_logger *) Xtl_val(logger));
-	if (ret != 0) \
-		failwith_xl(ERROR_FAIL, "cannot init context");
+    ret = libxl_ctx_alloc(&ctx, LIBXL_VERSION, 0, (xentoollog_logger *) Xtl_val(logger));
+    if (ret != 0) \
+        failwith_xl(ERROR_FAIL, "cannot init context");
 
-	handle = caml_alloc_custom(&libxl_ctx_custom_operations, sizeof(ctx), 0, 1);
-	Ctx_val(handle) = ctx;
+    handle = caml_alloc_custom(&libxl_ctx_custom_operations, sizeof(ctx), 0, 1);
+    Ctx_val(handle) = ctx;
 
-	CAMLreturn(handle);
+    CAMLreturn(handle);
 }
 
 static int list_len(value v)
 {
-	int len = 0;
-	while ( v != Val_emptylist ) {
-		len++;
-		v = Field(v, 1);
-	}
-	return len;
+    int len = 0;
+    while ( v != Val_emptylist ) {
+        len++;
+        v = Field(v, 1);
+    }
+    return len;
 }
 
 static int libxl_key_value_list_val(libxl_key_value_list *c_val,
-	value v)
+    value v)
 {
-	CAMLparam1(v);
-	CAMLlocal1(elem);
-	int nr, i;
-	libxl_key_value_list array;
+    CAMLparam1(v);
+    CAMLlocal1(elem);
+    int nr, i;
+    libxl_key_value_list array;
 
-	nr = list_len(v);
+    nr = list_len(v);
 
-	array = calloc((nr + 1) * 2, sizeof(char *));
-	if (!array)
-		caml_raise_out_of_memory();
+    array = calloc((nr + 1) * 2, sizeof(char *));
+    if (!array)
+        caml_raise_out_of_memory();
 
-	for (i=0; v != Val_emptylist; i++, v = Field(v, 1) ) {
-		elem = Field(v, 0);
+    for (i=0; v != Val_emptylist; i++, v = Field(v, 1) ) {
+        elem = Field(v, 0);
 
-		array[i * 2] = dup_String_val(Field(elem, 0));
-		array[i * 2 + 1] = dup_String_val(Field(elem, 1));
-	}
+        array[i * 2] = dup_String_val(Field(elem, 0));
+        array[i * 2 + 1] = dup_String_val(Field(elem, 1));
+    }
 
-	*c_val = array;
-	CAMLreturn(0);
+    *c_val = array;
+    CAMLreturn(0);
 }
 
 static value Val_key_value_list(libxl_key_value_list *c_val)
 {
-	CAMLparam0();
-	CAMLlocal5(list, cons, key, val, kv);
-	int i;
+    CAMLparam0();
+    CAMLlocal5(list, cons, key, val, kv);
+    int i;
 
-	list = Val_emptylist;
-	for (i = libxl_string_list_length((libxl_string_list *) c_val) - 1; i >= 0; i -= 2) {
-		val = caml_copy_string((*c_val)[i]);
-		key = caml_copy_string((*c_val)[i - 1]);
-		kv = caml_alloc_tuple(2);
-		Store_field(kv, 0, key);
-		Store_field(kv, 1, val);
+    list = Val_emptylist;
+    for (i = libxl_string_list_length((libxl_string_list *) c_val) - 1; i >= 0; i -= 2) {
+        val = caml_copy_string((*c_val)[i]);
+        key = caml_copy_string((*c_val)[i - 1]);
+        kv = caml_alloc_tuple(2);
+        Store_field(kv, 0, key);
+        Store_field(kv, 1, val);
 
-		cons = caml_alloc(2, 0);
-		Store_field(cons, 0, kv);   // head
-		Store_field(cons, 1, list);   // tail
-		list = cons;
-	}
+        cons = caml_alloc(2, 0);
+        Store_field(cons, 0, kv);   // head
+        Store_field(cons, 1, list);   // tail
+        list = cons;
+    }
 
-	CAMLreturn(list);
+    CAMLreturn(list);
 }
 
 static int libxl_string_list_val(libxl_string_list *c_val, value v)
 {
-	CAMLparam1(v);
-	int nr, i;
-	libxl_string_list array;
+    CAMLparam1(v);
+    int nr, i;
+    libxl_string_list array;
 
-	nr = list_len(v);
+    nr = list_len(v);
 
-	array = calloc(nr + 1, sizeof(char *));
-	if (!array)
-		caml_raise_out_of_memory();
+    array = calloc(nr + 1, sizeof(char *));
+    if (!array)
+        caml_raise_out_of_memory();
 
-	for (i=0; v != Val_emptylist; i++, v = Field(v, 1) )
-		array[i] = dup_String_val(Field(v, 0));
+    for (i=0; v != Val_emptylist; i++, v = Field(v, 1) )
+        array[i] = dup_String_val(Field(v, 0));
 
-	*c_val = array;
-	CAMLreturn(0);
+    *c_val = array;
+    CAMLreturn(0);
 }
 
 static value Val_string_list(libxl_string_list *c_val)
 {
-	CAMLparam0();
-	CAMLlocal3(list, cons, string);
-	int i;
+    CAMLparam0();
+    CAMLlocal3(list, cons, string);
+    int i;
 
-	list = Val_emptylist;
-	for (i = libxl_string_list_length(c_val) - 1; i >= 0; i--) {
-		string = caml_copy_string((*c_val)[i]);
-		cons = caml_alloc(2, 0);
-		Store_field(cons, 0, string);   // head
-		Store_field(cons, 1, list);     // tail
-		list = cons;
-	}
+    list = Val_emptylist;
+    for (i = libxl_string_list_length(c_val) - 1; i >= 0; i--) {
+        string = caml_copy_string((*c_val)[i]);
+        cons = caml_alloc(2, 0);
+        Store_field(cons, 0, string);   // head
+        Store_field(cons, 1, list);     // tail
+        list = cons;
+    }
 
-	CAMLreturn(list);
+    CAMLreturn(list);
 }
 
 /* Option type support as per http://www.linux-nantes.org/~fmonnier/ocaml/ocaml-wrapping-c.php */
@@ -236,472 +236,472 @@ static value Val_string_list(libxl_string_list *c_val)
 
 static value Val_some(value v)
 {
-	CAMLparam1(v);
-	CAMLlocal1(some);
-	some = caml_alloc(1, 0);
-	Store_field(some, 0, v);
-	CAMLreturn(some);
+    CAMLparam1(v);
+    CAMLlocal1(some);
+    some = caml_alloc(1, 0);
+    Store_field(some, 0, v);
+    CAMLreturn(some);
 }
 
 static value Val_mac (libxl_mac *c_val)
 {
-	CAMLparam0();
-	CAMLlocal1(v);
-	int i;
+    CAMLparam0();
+    CAMLlocal1(v);
+    int i;
 
-	v = caml_alloc_tuple(6);
+    v = caml_alloc_tuple(6);
 
-	for(i=0; i<6; i++)
-		Store_field(v, i, Val_int((*c_val)[i]));
+    for(i=0; i<6; i++)
+        Store_field(v, i, Val_int((*c_val)[i]));
 
-	CAMLreturn(v);
+    CAMLreturn(v);
 }
 
 static int Mac_val(libxl_mac *c_val, value v)
 {
-	CAMLparam1(v);
-	int i;
+    CAMLparam1(v);
+    int i;
 
-	for(i=0; i<6; i++)
-		(*c_val)[i] = Int_val(Field(v, i));
+    for(i=0; i<6; i++)
+        (*c_val)[i] = Int_val(Field(v, i));
 
-	CAMLreturn(0);
+    CAMLreturn(0);
 }
 
 static value Val_bitmap (libxl_bitmap *c_val)
 {
-	CAMLparam0();
-	CAMLlocal1(v);
-	int i;
+    CAMLparam0();
+    CAMLlocal1(v);
+    int i;
 
-	if (c_val->size == 0)
-		v = Atom(0);
-	else {
-	    v = caml_alloc(8 * (c_val->size), 0);
-	    libxl_for_each_bit(i, *c_val) {
-		    if (libxl_bitmap_test(c_val, i))
-			    Store_field(v, i, Val_true);
-		    else
-			    Store_field(v, i, Val_false);
-	    }
-	}
-	CAMLreturn(v);
+    if (c_val->size == 0)
+        v = Atom(0);
+    else {
+        v = caml_alloc(8 * (c_val->size), 0);
+        libxl_for_each_bit(i, *c_val) {
+            if (libxl_bitmap_test(c_val, i))
+                Store_field(v, i, Val_true);
+            else
+                Store_field(v, i, Val_false);
+        }
+    }
+    CAMLreturn(v);
 }
 
 static int Bitmap_val(libxl_ctx *ctx, libxl_bitmap *c_val, value v)
 {
-	CAMLparam1(v);
-	int i, len = Wosize_val(v);
+    CAMLparam1(v);
+    int i, len = Wosize_val(v);
 
-	c_val->size = 0;
-	if (len > 0 && libxl_bitmap_alloc(ctx, c_val, len))
-		failwith_xl(ERROR_NOMEM, "cannot allocate bitmap");
-	for (i=0; i<len; i++) {
-		if (Int_val(Field(v, i)))
-			libxl_bitmap_set(c_val, i);
-		else
-			libxl_bitmap_reset(c_val, i);
-	}
-	CAMLreturn(0);
+    c_val->size = 0;
+    if (len > 0 && libxl_bitmap_alloc(ctx, c_val, len))
+        failwith_xl(ERROR_NOMEM, "cannot allocate bitmap");
+    for (i=0; i<len; i++) {
+        if (Int_val(Field(v, i)))
+            libxl_bitmap_set(c_val, i);
+        else
+            libxl_bitmap_reset(c_val, i);
+    }
+    CAMLreturn(0);
 }
 
 static value Val_uuid (libxl_uuid *c_val)
 {
-	CAMLparam0();
-	CAMLlocal1(v);
-	uint8_t *uuid = libxl_uuid_bytearray(c_val);
-	int i;
+    CAMLparam0();
+    CAMLlocal1(v);
+    uint8_t *uuid = libxl_uuid_bytearray(c_val);
+    int i;
 
-	v = caml_alloc_tuple(16);
+    v = caml_alloc_tuple(16);
 
-	for(i=0; i<16; i++)
-		Store_field(v, i, Val_int(uuid[i]));
+    for(i=0; i<16; i++)
+        Store_field(v, i, Val_int(uuid[i]));
 
-	CAMLreturn(v);
+    CAMLreturn(v);
 }
 
 static int Uuid_val(libxl_uuid *c_val, value v)
 {
-	CAMLparam1(v);
-	int i;
-	uint8_t *uuid = libxl_uuid_bytearray(c_val);
+    CAMLparam1(v);
+    int i;
+    uint8_t *uuid = libxl_uuid_bytearray(c_val);
 
-	for(i=0; i<16; i++)
-		uuid[i] = Int_val(Field(v, i));
+    for(i=0; i<16; i++)
+        uuid[i] = Int_val(Field(v, i));
 
-	CAMLreturn(0);
+    CAMLreturn(0);
 }
 
 static value Val_defbool(libxl_defbool c_val)
 {
-	CAMLparam0();
-	CAMLlocal2(v1, v2);
-	bool b;
+    CAMLparam0();
+    CAMLlocal2(v1, v2);
+    bool b;
 
-	if (libxl_defbool_is_default(c_val))
-		v2 = Val_none;
-	else {
-		b = libxl_defbool_val(c_val);
-		v1 = b ? Val_bool(true) : Val_bool(false);
-		v2 = Val_some(v1);
-	}
-	CAMLreturn(v2);
+    if (libxl_defbool_is_default(c_val))
+        v2 = Val_none;
+    else {
+        b = libxl_defbool_val(c_val);
+        v1 = b ? Val_bool(true) : Val_bool(false);
+        v2 = Val_some(v1);
+    }
+    CAMLreturn(v2);
 }
 
 static libxl_defbool Defbool_val(value v)
 {
-	CAMLparam1(v);
-	libxl_defbool db;
-	if (v == Val_none)
-		libxl_defbool_unset(&db);
-	else {
-		bool b = Bool_val(Some_val(v));
-		libxl_defbool_set(&db, b);
-	}
-	CAMLreturnT(libxl_defbool, db);
+    CAMLparam1(v);
+    libxl_defbool db;
+    if (v == Val_none)
+        libxl_defbool_unset(&db);
+    else {
+        bool b = Bool_val(Some_val(v));
+        libxl_defbool_set(&db, b);
+    }
+    CAMLreturnT(libxl_defbool, db);
 }
 
 static value Val_hwcap(libxl_hwcap *c_val)
 {
-	CAMLparam0();
-	CAMLlocal1(hwcap);
-	int i;
+    CAMLparam0();
+    CAMLlocal1(hwcap);
+    int i;
 
-	hwcap = caml_alloc_tuple(8);
-	for (i = 0; i < 8; i++)
-		Store_field(hwcap, i, caml_copy_int32((*c_val)[i]));
+    hwcap = caml_alloc_tuple(8);
+    for (i = 0; i < 8; i++)
+        Store_field(hwcap, i, caml_copy_int32((*c_val)[i]));
 
-	CAMLreturn(hwcap);
+    CAMLreturn(hwcap);
 }
 
 static value Val_ms_vm_genid (libxl_ms_vm_genid *c_val)
 {
-	CAMLparam0();
-	CAMLlocal1(v);
-	int i;
+    CAMLparam0();
+    CAMLlocal1(v);
+    int i;
 
-	v = caml_alloc_tuple(LIBXL_MS_VM_GENID_LEN);
+    v = caml_alloc_tuple(LIBXL_MS_VM_GENID_LEN);
 
-	for(i=0; i<LIBXL_MS_VM_GENID_LEN; i++)
-		Store_field(v, i, Val_int(c_val->bytes[i]));
+    for(i=0; i<LIBXL_MS_VM_GENID_LEN; i++)
+        Store_field(v, i, Val_int(c_val->bytes[i]));
 
-	CAMLreturn(v);
+    CAMLreturn(v);
 }
 
 static int Ms_vm_genid_val(libxl_ms_vm_genid *c_val, value v)
 {
-	CAMLparam1(v);
-	int i;
+    CAMLparam1(v);
+    int i;
 
-	for(i=0; i<LIBXL_MS_VM_GENID_LEN; i++)
-		c_val->bytes[i] = Int_val(Field(v, i));
+    for(i=0; i<LIBXL_MS_VM_GENID_LEN; i++)
+        c_val->bytes[i] = Int_val(Field(v, i));
 
-	CAMLreturn(0);
+    CAMLreturn(0);
 }
 
 static value Val_string_option(const char *c_val)
 {
-	CAMLparam0();
-	CAMLlocal2(tmp1, tmp2);
-	if (c_val) {
-		tmp1 = caml_copy_string(c_val);
-		tmp2 = Val_some(tmp1);
-		CAMLreturn(tmp2);
-	}
-	else
-		CAMLreturn(Val_none);
+    CAMLparam0();
+    CAMLlocal2(tmp1, tmp2);
+    if (c_val) {
+        tmp1 = caml_copy_string(c_val);
+        tmp2 = Val_some(tmp1);
+        CAMLreturn(tmp2);
+    }
+    else
+        CAMLreturn(Val_none);
 }
 
 static char *String_option_val(value v)
 {
-	CAMLparam1(v);
-	char *s = NULL;
-	if (v != Val_none)
-		s = dup_String_val(Some_val(v));
-	CAMLreturnT(char *, s);
+    CAMLparam1(v);
+    char *s = NULL;
+    if (v != Val_none)
+        s = dup_String_val(Some_val(v));
+    CAMLreturnT(char *, s);
 }
 
 #include "_libxl_types.inc"
 
 void async_callback(libxl_ctx *ctx, int rc, void *for_callback)
 {
-	caml_leave_blocking_section();
-	CAMLparam0();
-	CAMLlocal2(error, tmp);
-	static const value *func = NULL;
-	value *p = (value *) for_callback;
+    caml_leave_blocking_section();
+    CAMLparam0();
+    CAMLlocal2(error, tmp);
+    static const value *func = NULL;
+    value *p = (value *) for_callback;
 
-	if (func == NULL) {
-		/* First time around, lookup by name */
-		func = caml_named_value("libxl_async_callback");
-	}
+    if (func == NULL) {
+        /* First time around, lookup by name */
+        func = caml_named_value("libxl_async_callback");
+    }
 
-	if (rc == 0)
-		error = Val_none;
-	else {
-		tmp = Val_error(rc);
-		error = Val_some(tmp);
-	}
+    if (rc == 0)
+        error = Val_none;
+    else {
+        tmp = Val_error(rc);
+        error = Val_some(tmp);
+    }
 
-	/* for_callback is a pointer to a "value" that was malloc'ed and
-	 * registered with the OCaml GC. The value is handed back to OCaml
-	 * in the following callback, after which the pointer is unregistered
-	 * and freed. */
-	caml_callback2(*func, error, *p);
+    /* for_callback is a pointer to a "value" that was malloc'ed and
+     * registered with the OCaml GC. The value is handed back to OCaml
+     * in the following callback, after which the pointer is unregistered
+     * and freed. */
+    caml_callback2(*func, error, *p);
 
-	caml_remove_global_root(p);
-	free(p);
+    caml_remove_global_root(p);
+    free(p);
 
-	CAMLdone;
-	caml_enter_blocking_section();
+    CAMLdone;
+    caml_enter_blocking_section();
 }
 
 static libxl_asyncop_how *aohow_val(value async)
 {
-	CAMLparam1(async);
-	libxl_asyncop_how *ao_how = NULL;
-	value *p;
+    CAMLparam1(async);
+    libxl_asyncop_how *ao_how = NULL;
+    value *p;
 
-	if (async != Val_none) {
-		/* for_callback must be a pointer to a "value" that is malloc'ed and
-		 * registered with the OCaml GC. This ensures that the GC does not remove
-		 * the corresponding OCaml heap blocks, and allows the GC to update the value
-		 * when blocks are moved around, while libxl is free to copy the pointer if
-		 * it needs to.
-		 * The for_callback pointer must always be non-NULL. */
-		p = malloc(sizeof(value));
-		if (!p)
-			failwith_xl(ERROR_NOMEM, "cannot allocate value");
-		*p = Some_val(async);
-		caml_register_global_root(p);
-		ao_how = malloc(sizeof(*ao_how));
-		ao_how->callback = async_callback;
-		ao_how->u.for_callback = (void *) p;
-	}
+    if (async != Val_none) {
+        /* for_callback must be a pointer to a "value" that is malloc'ed and
+         * registered with the OCaml GC. This ensures that the GC does not remove
+         * the corresponding OCaml heap blocks, and allows the GC to update the value
+         * when blocks are moved around, while libxl is free to copy the pointer if
+         * it needs to.
+         * The for_callback pointer must always be non-NULL. */
+        p = malloc(sizeof(value));
+        if (!p)
+            failwith_xl(ERROR_NOMEM, "cannot allocate value");
+        *p = Some_val(async);
+        caml_register_global_root(p);
+        ao_how = malloc(sizeof(*ao_how));
+        ao_how->callback = async_callback;
+        ao_how->u.for_callback = (void *) p;
+    }
 
-	CAMLreturnT(libxl_asyncop_how *, ao_how);
+    CAMLreturnT(libxl_asyncop_how *, ao_how);
 }
 
 value stub_libxl_domain_create_new(value ctx, value domain_config, value async, value unit)
 {
-	CAMLparam4(ctx, async, domain_config, unit);
-	int ret;
-	libxl_domain_config c_dconfig;
-	uint32_t c_domid;
-	libxl_asyncop_how *ao_how;
+    CAMLparam4(ctx, async, domain_config, unit);
+    int ret;
+    libxl_domain_config c_dconfig;
+    uint32_t c_domid;
+    libxl_asyncop_how *ao_how;
 
-	libxl_domain_config_init(&c_dconfig);
-	ret = domain_config_val(CTX, &c_dconfig, domain_config);
-	if (ret != 0) {
-		libxl_domain_config_dispose(&c_dconfig);
-		failwith_xl(ret, "domain_create_new");
-	}
+    libxl_domain_config_init(&c_dconfig);
+    ret = domain_config_val(CTX, &c_dconfig, domain_config);
+    if (ret != 0) {
+        libxl_domain_config_dispose(&c_dconfig);
+        failwith_xl(ret, "domain_create_new");
+    }
 
-	ao_how = aohow_val(async);
+    ao_how = aohow_val(async);
 
-	caml_enter_blocking_section();
-	ret = libxl_domain_create_new(CTX, &c_dconfig, &c_domid, ao_how, NULL);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_domain_create_new(CTX, &c_dconfig, &c_domid, ao_how, NULL);
+    caml_leave_blocking_section();
 
-	free(ao_how);
-	libxl_domain_config_dispose(&c_dconfig);
+    free(ao_how);
+    libxl_domain_config_dispose(&c_dconfig);
 
-	if (ret != 0)
-		failwith_xl(ret, "domain_create_new");
+    if (ret != 0)
+        failwith_xl(ret, "domain_create_new");
 
-	CAMLreturn(Val_int(c_domid));
+    CAMLreturn(Val_int(c_domid));
 }
 
 value stub_libxl_domain_create_restore(value ctx, value domain_config, value params,
-	value async, value unit)
+    value async, value unit)
 {
-	CAMLparam5(ctx, domain_config, params, async, unit);
-	int ret;
-	libxl_domain_config c_dconfig;
-	libxl_domain_restore_params c_params;
-	uint32_t c_domid;
-	libxl_asyncop_how *ao_how;
-	int restore_fd;
+    CAMLparam5(ctx, domain_config, params, async, unit);
+    int ret;
+    libxl_domain_config c_dconfig;
+    libxl_domain_restore_params c_params;
+    uint32_t c_domid;
+    libxl_asyncop_how *ao_how;
+    int restore_fd;
 
-	libxl_domain_config_init(&c_dconfig);
-	ret = domain_config_val(CTX, &c_dconfig, domain_config);
-	if (ret != 0) {
-		libxl_domain_config_dispose(&c_dconfig);
-		failwith_xl(ret, "domain_create_restore");
-	}
+    libxl_domain_config_init(&c_dconfig);
+    ret = domain_config_val(CTX, &c_dconfig, domain_config);
+    if (ret != 0) {
+        libxl_domain_config_dispose(&c_dconfig);
+        failwith_xl(ret, "domain_create_restore");
+    }
 
-	libxl_domain_restore_params_init(&c_params);
-	ret = domain_restore_params_val(CTX, &c_params, Field(params, 1));
-	if (ret != 0) {
-		libxl_domain_restore_params_dispose(&c_params);
-		failwith_xl(ret, "domain_create_restore");
-	}
+    libxl_domain_restore_params_init(&c_params);
+    ret = domain_restore_params_val(CTX, &c_params, Field(params, 1));
+    if (ret != 0) {
+        libxl_domain_restore_params_dispose(&c_params);
+        failwith_xl(ret, "domain_create_restore");
+    }
 
-	ao_how = aohow_val(async);
-	restore_fd = Int_val(Field(params, 0));
+    ao_how = aohow_val(async);
+    restore_fd = Int_val(Field(params, 0));
 
-	caml_enter_blocking_section();
-	ret = libxl_domain_create_restore(CTX, &c_dconfig, &c_domid, restore_fd,
-		-1, &c_params, ao_how, NULL);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_domain_create_restore(CTX, &c_dconfig, &c_domid, restore_fd,
+        -1, &c_params, ao_how, NULL);
+    caml_leave_blocking_section();
 
-	free(ao_how);
-	libxl_domain_config_dispose(&c_dconfig);
-	libxl_domain_restore_params_dispose(&c_params);
+    free(ao_how);
+    libxl_domain_config_dispose(&c_dconfig);
+    libxl_domain_restore_params_dispose(&c_params);
 
-	if (ret != 0)
-		failwith_xl(ret, "domain_create_restore");
+    if (ret != 0)
+        failwith_xl(ret, "domain_create_restore");
 
-	CAMLreturn(Val_int(c_domid));
+    CAMLreturn(Val_int(c_domid));
 }
 
 value stub_libxl_domain_shutdown(value ctx, value domid, value async, value unit)
 {
-	CAMLparam4(ctx, domid, async, unit);
-	int ret;
-	uint32_t c_domid = Int_val(domid);
-	libxl_asyncop_how *ao_how = aohow_val(async);
+    CAMLparam4(ctx, domid, async, unit);
+    int ret;
+    uint32_t c_domid = Int_val(domid);
+    libxl_asyncop_how *ao_how = aohow_val(async);
 
-	caml_enter_blocking_section();
-	ret = libxl_domain_shutdown(CTX, c_domid, ao_how);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_domain_shutdown(CTX, c_domid, ao_how);
+    caml_leave_blocking_section();
 
-	free(ao_how);
+    free(ao_how);
 
-	if (ret != 0)
-		failwith_xl(ret, "domain_shutdown");
+    if (ret != 0)
+        failwith_xl(ret, "domain_shutdown");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 value stub_libxl_domain_reboot(value ctx, value domid, value async, value unit)
 {
-	CAMLparam4(ctx, domid, async, unit);
-	int ret;
-	uint32_t c_domid = Int_val(domid);
-	libxl_asyncop_how *ao_how = aohow_val(async);
+    CAMLparam4(ctx, domid, async, unit);
+    int ret;
+    uint32_t c_domid = Int_val(domid);
+    libxl_asyncop_how *ao_how = aohow_val(async);
 
-	caml_enter_blocking_section();
-	ret = libxl_domain_reboot(CTX, c_domid, ao_how);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_domain_reboot(CTX, c_domid, ao_how);
+    caml_leave_blocking_section();
 
-	free(ao_how);
+    free(ao_how);
 
-	if (ret != 0)
-		failwith_xl(ret, "domain_reboot");
+    if (ret != 0)
+        failwith_xl(ret, "domain_reboot");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 value stub_libxl_domain_destroy(value ctx, value domid, value async, value unit)
 {
-	CAMLparam4(ctx, domid, async, unit);
-	int ret;
-	uint32_t c_domid = Int_val(domid);
-	libxl_asyncop_how *ao_how = aohow_val(async);
+    CAMLparam4(ctx, domid, async, unit);
+    int ret;
+    uint32_t c_domid = Int_val(domid);
+    libxl_asyncop_how *ao_how = aohow_val(async);
 
-	caml_enter_blocking_section();
-	ret = libxl_domain_destroy(CTX, c_domid, ao_how);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_domain_destroy(CTX, c_domid, ao_how);
+    caml_leave_blocking_section();
 
-	free(ao_how);
+    free(ao_how);
 
-	if (ret != 0)
-		failwith_xl(ret, "domain_destroy");
+    if (ret != 0)
+        failwith_xl(ret, "domain_destroy");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 value stub_libxl_domain_suspend(value ctx, value domid, value fd, value async, value unit)
 {
-	CAMLparam5(ctx, domid, fd, async, unit);
-	int ret;
-	uint32_t c_domid = Int_val(domid);
-	int c_fd = Int_val(fd);
-	libxl_asyncop_how *ao_how = aohow_val(async);
+    CAMLparam5(ctx, domid, fd, async, unit);
+    int ret;
+    uint32_t c_domid = Int_val(domid);
+    int c_fd = Int_val(fd);
+    libxl_asyncop_how *ao_how = aohow_val(async);
 
-	caml_enter_blocking_section();
-	ret = libxl_domain_suspend(CTX, c_domid, c_fd, 0, ao_how);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_domain_suspend(CTX, c_domid, c_fd, 0, ao_how);
+    caml_leave_blocking_section();
 
-	free(ao_how);
+    free(ao_how);
 
-	if (ret != 0)
-		failwith_xl(ret, "domain_suspend");
+    if (ret != 0)
+        failwith_xl(ret, "domain_suspend");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 value stub_libxl_domain_pause(value ctx, value domid, value async)
 {
-	CAMLparam3(ctx, domid, async);
-	int ret;
-	uint32_t c_domid = Int_val(domid);
-	libxl_asyncop_how *ao_how = aohow_val(async);
+    CAMLparam3(ctx, domid, async);
+    int ret;
+    uint32_t c_domid = Int_val(domid);
+    libxl_asyncop_how *ao_how = aohow_val(async);
 
-	caml_enter_blocking_section();
-	ret = libxl_domain_pause(CTX, c_domid, ao_how);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_domain_pause(CTX, c_domid, ao_how);
+    caml_leave_blocking_section();
 
-	free(ao_how);
+    free(ao_how);
 
-	if (ret != 0)
-		failwith_xl(ret, "domain_pause");
+    if (ret != 0)
+        failwith_xl(ret, "domain_pause");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 value stub_libxl_domain_unpause(value ctx, value domid, value async)
 {
-	CAMLparam3(ctx, domid, async);
-	int ret;
-	uint32_t c_domid = Int_val(domid);
-	libxl_asyncop_how *ao_how = aohow_val(async);
+    CAMLparam3(ctx, domid, async);
+    int ret;
+    uint32_t c_domid = Int_val(domid);
+    libxl_asyncop_how *ao_how = aohow_val(async);
 
-	caml_enter_blocking_section();
-	ret = libxl_domain_unpause(CTX, c_domid, ao_how);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_domain_unpause(CTX, c_domid, ao_how);
+    caml_leave_blocking_section();
 
-	free(ao_how);
+    free(ao_how);
 
-	if (ret != 0)
-		failwith_xl(ret, "domain_unpause");
+    if (ret != 0)
+        failwith_xl(ret, "domain_unpause");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 #define _STRINGIFY(x) #x
 #define STRINGIFY(x) _STRINGIFY(x)
 
-#define _DEVICE_ADDREMOVE(type,fn,op)					\
-value stub_xl_device_##type##_##op(value ctx, value info, value domid,	\
-	value async, value unit)					\
-{									\
-	CAMLparam5(ctx, info, domid, async, unit);			\
-	libxl_device_##type c_info;					\
-	int ret, marker_var;						\
-	uint32_t c_domid = Int_val(domid);				\
-	libxl_asyncop_how *ao_how = aohow_val(async);			\
-									\
-	device_##type##_val(CTX, &c_info, info);			\
-									\
-	caml_enter_blocking_section();					\
-	ret = libxl_##fn##_##op(CTX, c_domid, &c_info, ao_how);		\
-	caml_leave_blocking_section();					\
-									\
-	free(ao_how);							\
-	libxl_device_##type##_dispose(&c_info);				\
-									\
-	if (ret != 0)							\
-		failwith_xl(ret, STRINGIFY(type) "_" STRINGIFY(op));	\
-									\
-	CAMLreturn(Val_unit);						\
+#define _DEVICE_ADDREMOVE(type,fn,op)                    \
+value stub_xl_device_##type##_##op(value ctx, value info, value domid,    \
+    value async, value unit)                    \
+{                                    \
+    CAMLparam5(ctx, info, domid, async, unit);            \
+    libxl_device_##type c_info;                    \
+    int ret, marker_var;                        \
+    uint32_t c_domid = Int_val(domid);                \
+    libxl_asyncop_how *ao_how = aohow_val(async);            \
+                                    \
+    device_##type##_val(CTX, &c_info, info);            \
+                                    \
+    caml_enter_blocking_section();                    \
+    ret = libxl_##fn##_##op(CTX, c_domid, &c_info, ao_how);        \
+    caml_leave_blocking_section();                    \
+                                    \
+    free(ao_how);                            \
+    libxl_device_##type##_dispose(&c_info);                \
+                                    \
+    if (ret != 0)                            \
+        failwith_xl(ret, STRINGIFY(type) "_" STRINGIFY(op));    \
+                                    \
+    CAMLreturn(Val_unit);                        \
 }
 
 #define DEVICE_ADDREMOVE(type) \
-	_DEVICE_ADDREMOVE(type, device_##type, add) \
-	_DEVICE_ADDREMOVE(type, device_##type, remove) \
-	_DEVICE_ADDREMOVE(type, device_##type, destroy)
+    _DEVICE_ADDREMOVE(type, device_##type, add) \
+    _DEVICE_ADDREMOVE(type, device_##type, remove) \
+    _DEVICE_ADDREMOVE(type, device_##type, destroy)
 
 DEVICE_ADDREMOVE(disk)
 DEVICE_ADDREMOVE(nic)
@@ -712,558 +712,558 @@ _DEVICE_ADDREMOVE(disk, cdrom, insert)
 
 value stub_xl_device_nic_of_devid(value ctx, value domid, value devid)
 {
-	CAMLparam3(ctx, domid, devid);
-	CAMLlocal1(nic);
-	libxl_device_nic c_nic;
-	uint32_t c_domid = Int_val(domid);
-	int c_devid = Int_val(devid);
+    CAMLparam3(ctx, domid, devid);
+    CAMLlocal1(nic);
+    libxl_device_nic c_nic;
+    uint32_t c_domid = Int_val(domid);
+    int c_devid = Int_val(devid);
 
-	caml_enter_blocking_section();
-	libxl_devid_to_device_nic(CTX, c_domid, c_devid, &c_nic);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    libxl_devid_to_device_nic(CTX, c_domid, c_devid, &c_nic);
+    caml_leave_blocking_section();
 
-	nic = Val_device_nic(&c_nic);
-	libxl_device_nic_dispose(&c_nic);
+    nic = Val_device_nic(&c_nic);
+    libxl_device_nic_dispose(&c_nic);
 
-	CAMLreturn(nic);
+    CAMLreturn(nic);
 }
 
 value stub_xl_device_nic_list(value ctx, value domid)
 {
-	CAMLparam2(ctx, domid);
-	CAMLlocal2(list, temp);
-	libxl_device_nic *c_list;
-	int i, nb;
-	uint32_t c_domid = Int_val(domid);
+    CAMLparam2(ctx, domid);
+    CAMLlocal2(list, temp);
+    libxl_device_nic *c_list;
+    int i, nb;
+    uint32_t c_domid = Int_val(domid);
 
-	caml_enter_blocking_section();
-	c_list = libxl_device_nic_list(CTX, c_domid, &nb);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    c_list = libxl_device_nic_list(CTX, c_domid, &nb);
+    caml_leave_blocking_section();
 
-	if (!c_list)
-		failwith_xl(ERROR_FAIL, "nic_list");
+    if (!c_list)
+        failwith_xl(ERROR_FAIL, "nic_list");
 
-	list = temp = Val_emptylist;
-	for (i = 0; i < nb; i++) {
-		list = caml_alloc_small(2, Tag_cons);
-		Field(list, 0) = Val_int(0);
-		Field(list, 1) = temp;
-		temp = list;
-		Store_field(list, 0, Val_device_nic(&c_list[i]));
-	}
-	libxl_device_nic_list_free(c_list, nb);
+    list = temp = Val_emptylist;
+    for (i = 0; i < nb; i++) {
+        list = caml_alloc_small(2, Tag_cons);
+        Field(list, 0) = Val_int(0);
+        Field(list, 1) = temp;
+        temp = list;
+        Store_field(list, 0, Val_device_nic(&c_list[i]));
+    }
+    libxl_device_nic_list_free(c_list, nb);
 
-	CAMLreturn(list);
+    CAMLreturn(list);
 }
 
 value stub_xl_device_disk_list(value ctx, value domid)
 {
-	CAMLparam2(ctx, domid);
-	CAMLlocal2(list, temp);
-	libxl_device_disk *c_list;
-	int i, nb;
-	uint32_t c_domid = Int_val(domid);
+    CAMLparam2(ctx, domid);
+    CAMLlocal2(list, temp);
+    libxl_device_disk *c_list;
+    int i, nb;
+    uint32_t c_domid = Int_val(domid);
 
-	caml_enter_blocking_section();
-	c_list = libxl_device_disk_list(CTX, c_domid, &nb);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    c_list = libxl_device_disk_list(CTX, c_domid, &nb);
+    caml_leave_blocking_section();
 
-	if (!c_list)
-		failwith_xl(ERROR_FAIL, "disk_list");
+    if (!c_list)
+        failwith_xl(ERROR_FAIL, "disk_list");
 
-	list = temp = Val_emptylist;
-	for (i = 0; i < nb; i++) {
-		list = caml_alloc_small(2, Tag_cons);
-		Field(list, 0) = Val_int(0);
-		Field(list, 1) = temp;
-		temp = list;
-		Store_field(list, 0, Val_device_disk(&c_list[i]));
-	}
-	libxl_device_disk_list_free(c_list, nb);
+    list = temp = Val_emptylist;
+    for (i = 0; i < nb; i++) {
+        list = caml_alloc_small(2, Tag_cons);
+        Field(list, 0) = Val_int(0);
+        Field(list, 1) = temp;
+        temp = list;
+        Store_field(list, 0, Val_device_disk(&c_list[i]));
+    }
+    libxl_device_disk_list_free(c_list, nb);
 
-	CAMLreturn(list);
+    CAMLreturn(list);
 }
 
 value stub_xl_device_disk_of_vdev(value ctx, value domid, value vdev)
 {
-	CAMLparam3(ctx, domid, vdev);
-	CAMLlocal1(disk);
-	libxl_device_disk c_disk;
-	char *c_vdev;
-	uint32_t c_domid = Int_val(domid);
+    CAMLparam3(ctx, domid, vdev);
+    CAMLlocal1(disk);
+    libxl_device_disk c_disk;
+    char *c_vdev;
+    uint32_t c_domid = Int_val(domid);
 
-	c_vdev = strdup(String_val(vdev));
+    c_vdev = strdup(String_val(vdev));
 
-	caml_enter_blocking_section();
-	libxl_vdev_to_device_disk(CTX, c_domid, c_vdev, &c_disk);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    libxl_vdev_to_device_disk(CTX, c_domid, c_vdev, &c_disk);
+    caml_leave_blocking_section();
 
-	disk = Val_device_disk(&c_disk);
-	libxl_device_disk_dispose(&c_disk);
-	free(c_vdev);
+    disk = Val_device_disk(&c_disk);
+    libxl_device_disk_dispose(&c_disk);
+    free(c_vdev);
 
-	CAMLreturn(disk);
+    CAMLreturn(disk);
 }
 
 value stub_xl_device_pci_list(value ctx, value domid)
 {
-	CAMLparam2(ctx, domid);
-	CAMLlocal2(list, temp);
-	libxl_device_pci *c_list;
-	int i, nb;
-	uint32_t c_domid = Int_val(domid);
+    CAMLparam2(ctx, domid);
+    CAMLlocal2(list, temp);
+    libxl_device_pci *c_list;
+    int i, nb;
+    uint32_t c_domid = Int_val(domid);
 
-	caml_enter_blocking_section();
-	c_list = libxl_device_pci_list(CTX, c_domid, &nb);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    c_list = libxl_device_pci_list(CTX, c_domid, &nb);
+    caml_leave_blocking_section();
 
-	if (!c_list)
-		failwith_xl(ERROR_FAIL, "pci_list");
+    if (!c_list)
+        failwith_xl(ERROR_FAIL, "pci_list");
 
-	list = temp = Val_emptylist;
-	for (i = 0; i < nb; i++) {
-		list = caml_alloc_small(2, Tag_cons);
-		Field(list, 0) = Val_int(0);
-		Field(list, 1) = temp;
-		temp = list;
-		Store_field(list, 0, Val_device_pci(&c_list[i]));
-		libxl_device_pci_dispose(&c_list[i]);
-	}
-	free(c_list);
+    list = temp = Val_emptylist;
+    for (i = 0; i < nb; i++) {
+        list = caml_alloc_small(2, Tag_cons);
+        Field(list, 0) = Val_int(0);
+        Field(list, 1) = temp;
+        temp = list;
+        Store_field(list, 0, Val_device_pci(&c_list[i]));
+        libxl_device_pci_dispose(&c_list[i]);
+    }
+    free(c_list);
 
-	CAMLreturn(list);
+    CAMLreturn(list);
 }
 
 value stub_xl_device_pci_assignable_add(value ctx, value info, value rebind)
 {
-	CAMLparam3(ctx, info, rebind);
-	libxl_device_pci c_info;
-	int ret, marker_var;
-	int c_rebind = (int) Bool_val(rebind);
+    CAMLparam3(ctx, info, rebind);
+    libxl_device_pci c_info;
+    int ret, marker_var;
+    int c_rebind = (int) Bool_val(rebind);
 
-	device_pci_val(CTX, &c_info, info);
+    device_pci_val(CTX, &c_info, info);
 
-	caml_enter_blocking_section();
-	ret = libxl_device_pci_assignable_add(CTX, &c_info, c_rebind);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_device_pci_assignable_add(CTX, &c_info, c_rebind);
+    caml_leave_blocking_section();
 
-	libxl_device_pci_dispose(&c_info);
+    libxl_device_pci_dispose(&c_info);
 
-	if (ret != 0)
-		failwith_xl(ret, "pci_assignable_add");
+    if (ret != 0)
+        failwith_xl(ret, "pci_assignable_add");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 value stub_xl_device_pci_assignable_remove(value ctx, value info, value rebind)
 {
-	CAMLparam3(ctx, info, rebind);
-	libxl_device_pci c_info;
-	int ret, marker_var;
-	int c_rebind = (int) Bool_val(rebind);
+    CAMLparam3(ctx, info, rebind);
+    libxl_device_pci c_info;
+    int ret, marker_var;
+    int c_rebind = (int) Bool_val(rebind);
 
-	device_pci_val(CTX, &c_info, info);
+    device_pci_val(CTX, &c_info, info);
 
-	caml_enter_blocking_section();
-	ret = libxl_device_pci_assignable_remove(CTX, &c_info, c_rebind);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_device_pci_assignable_remove(CTX, &c_info, c_rebind);
+    caml_leave_blocking_section();
 
-	libxl_device_pci_dispose(&c_info);
+    libxl_device_pci_dispose(&c_info);
 
-	if (ret != 0)
-		failwith_xl(ret, "pci_assignable_remove");
+    if (ret != 0)
+        failwith_xl(ret, "pci_assignable_remove");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 value stub_xl_device_pci_assignable_list(value ctx)
 {
-	CAMLparam1(ctx);
-	CAMLlocal2(list, temp);
-	libxl_device_pci *c_list;
-	int i, nb;
-	uint32_t c_domid;
+    CAMLparam1(ctx);
+    CAMLlocal2(list, temp);
+    libxl_device_pci *c_list;
+    int i, nb;
+    uint32_t c_domid;
 
-	caml_enter_blocking_section();
-	c_list = libxl_device_pci_assignable_list(CTX, &nb);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    c_list = libxl_device_pci_assignable_list(CTX, &nb);
+    caml_leave_blocking_section();
 
-	if (!c_list)
-		failwith_xl(ERROR_FAIL, "pci_assignable_list");
+    if (!c_list)
+        failwith_xl(ERROR_FAIL, "pci_assignable_list");
 
-	list = temp = Val_emptylist;
-	for (i = 0; i < nb; i++) {
-		list = caml_alloc_small(2, Tag_cons);
-		Field(list, 0) = Val_int(0);
-		Field(list, 1) = temp;
-		temp = list;
-		Store_field(list, 0, Val_device_pci(&c_list[i]));
-	}
-	libxl_device_pci_assignable_list_free(c_list, nb);
+    list = temp = Val_emptylist;
+    for (i = 0; i < nb; i++) {
+        list = caml_alloc_small(2, Tag_cons);
+        Field(list, 0) = Val_int(0);
+        Field(list, 1) = temp;
+        temp = list;
+        Store_field(list, 0, Val_device_pci(&c_list[i]));
+    }
+    libxl_device_pci_assignable_list_free(c_list, nb);
 
-	CAMLreturn(list);
+    CAMLreturn(list);
 }
 
 value stub_xl_physinfo_get(value ctx)
 {
-	CAMLparam1(ctx);
-	CAMLlocal1(physinfo);
-	libxl_physinfo c_physinfo;
-	int ret;
+    CAMLparam1(ctx);
+    CAMLlocal1(physinfo);
+    libxl_physinfo c_physinfo;
+    int ret;
 
-	caml_enter_blocking_section();
-	ret = libxl_get_physinfo(CTX, &c_physinfo);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_get_physinfo(CTX, &c_physinfo);
+    caml_leave_blocking_section();
 
-	if (ret != 0)
-		failwith_xl(ret, "get_physinfo");
+    if (ret != 0)
+        failwith_xl(ret, "get_physinfo");
 
-	physinfo = Val_physinfo(&c_physinfo);
+    physinfo = Val_physinfo(&c_physinfo);
 
-	libxl_physinfo_dispose(&c_physinfo);
+    libxl_physinfo_dispose(&c_physinfo);
 
-	CAMLreturn(physinfo);
+    CAMLreturn(physinfo);
 }
 
 value stub_xl_cputopology_get(value ctx)
 {
-	CAMLparam1(ctx);
-	CAMLlocal3(topology, v, v0);
-	libxl_cputopology *c_topology;
-	int i, nr;
+    CAMLparam1(ctx);
+    CAMLlocal3(topology, v, v0);
+    libxl_cputopology *c_topology;
+    int i, nr;
 
-	caml_enter_blocking_section();
-	c_topology = libxl_get_cpu_topology(CTX, &nr);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    c_topology = libxl_get_cpu_topology(CTX, &nr);
+    caml_leave_blocking_section();
 
-	if (!c_topology)
-		failwith_xl(ERROR_FAIL, "get_cpu_topologyinfo");
+    if (!c_topology)
+        failwith_xl(ERROR_FAIL, "get_cpu_topologyinfo");
 
-	topology = caml_alloc_tuple(nr);
-	for (i = 0; i < nr; i++) {
-		if (c_topology[i].core != LIBXL_CPUTOPOLOGY_INVALID_ENTRY) {
-			v0 = Val_cputopology(&c_topology[i]);
-			v = Val_some(v0);
-		}
-		else
-			v = Val_none;
-		Store_field(topology, i, v);
-	}
+    topology = caml_alloc_tuple(nr);
+    for (i = 0; i < nr; i++) {
+        if (c_topology[i].core != LIBXL_CPUTOPOLOGY_INVALID_ENTRY) {
+            v0 = Val_cputopology(&c_topology[i]);
+            v = Val_some(v0);
+        }
+        else
+            v = Val_none;
+        Store_field(topology, i, v);
+    }
 
-	libxl_cputopology_list_free(c_topology, nr);
+    libxl_cputopology_list_free(c_topology, nr);
 
-	CAMLreturn(topology);
+    CAMLreturn(topology);
 }
 
 value stub_xl_dominfo_list(value ctx)
 {
-	CAMLparam1(ctx);
-	CAMLlocal2(domlist, temp);
-	libxl_dominfo *c_domlist;
-	int i, nb;
+    CAMLparam1(ctx);
+    CAMLlocal2(domlist, temp);
+    libxl_dominfo *c_domlist;
+    int i, nb;
 
-	caml_enter_blocking_section();
-	c_domlist = libxl_list_domain(CTX, &nb);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    c_domlist = libxl_list_domain(CTX, &nb);
+    caml_leave_blocking_section();
 
-	if (!c_domlist)
-		failwith_xl(ERROR_FAIL, "dominfo_list");
+    if (!c_domlist)
+        failwith_xl(ERROR_FAIL, "dominfo_list");
 
-	domlist = temp = Val_emptylist;
-	for (i = nb - 1; i >= 0; i--) {
-		domlist = caml_alloc_small(2, Tag_cons);
-		Field(domlist, 0) = Val_int(0);
-		Field(domlist, 1) = temp;
-		temp = domlist;
+    domlist = temp = Val_emptylist;
+    for (i = nb - 1; i >= 0; i--) {
+        domlist = caml_alloc_small(2, Tag_cons);
+        Field(domlist, 0) = Val_int(0);
+        Field(domlist, 1) = temp;
+        temp = domlist;
 
-		Store_field(domlist, 0, Val_dominfo(&c_domlist[i]));
-	}
+        Store_field(domlist, 0, Val_dominfo(&c_domlist[i]));
+    }
 
-	libxl_dominfo_list_free(c_domlist, nb);
+    libxl_dominfo_list_free(c_domlist, nb);
 
-	CAMLreturn(domlist);
+    CAMLreturn(domlist);
 }
 
 value stub_xl_dominfo_get(value ctx, value domid)
 {
-	CAMLparam2(ctx, domid);
-	CAMLlocal1(dominfo);
-	libxl_dominfo c_dominfo;
-	int ret;
-	uint32_t c_domid = Int_val(domid);
+    CAMLparam2(ctx, domid);
+    CAMLlocal1(dominfo);
+    libxl_dominfo c_dominfo;
+    int ret;
+    uint32_t c_domid = Int_val(domid);
 
-	caml_enter_blocking_section();
-	ret = libxl_domain_info(CTX, &c_dominfo, c_domid);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_domain_info(CTX, &c_dominfo, c_domid);
+    caml_leave_blocking_section();
 
-	if (ret != 0)
-		failwith_xl(ERROR_FAIL, "domain_info");
-	dominfo = Val_dominfo(&c_dominfo);
+    if (ret != 0)
+        failwith_xl(ERROR_FAIL, "domain_info");
+    dominfo = Val_dominfo(&c_dominfo);
 
-	CAMLreturn(dominfo);
+    CAMLreturn(dominfo);
 }
 
 value stub_xl_domain_sched_params_get(value ctx, value domid)
 {
-	CAMLparam2(ctx, domid);
-	CAMLlocal1(scinfo);
-	libxl_domain_sched_params c_scinfo;
-	int ret;
-	uint32_t c_domid = Int_val(domid);
+    CAMLparam2(ctx, domid);
+    CAMLlocal1(scinfo);
+    libxl_domain_sched_params c_scinfo;
+    int ret;
+    uint32_t c_domid = Int_val(domid);
 
-	caml_enter_blocking_section();
-	ret = libxl_domain_sched_params_get(CTX, c_domid, &c_scinfo);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_domain_sched_params_get(CTX, c_domid, &c_scinfo);
+    caml_leave_blocking_section();
 
-	if (ret != 0)
-		failwith_xl(ret, "domain_sched_params_get");
+    if (ret != 0)
+        failwith_xl(ret, "domain_sched_params_get");
 
-	scinfo = Val_domain_sched_params(&c_scinfo);
+    scinfo = Val_domain_sched_params(&c_scinfo);
 
-	libxl_domain_sched_params_dispose(&c_scinfo);
+    libxl_domain_sched_params_dispose(&c_scinfo);
 
-	CAMLreturn(scinfo);
+    CAMLreturn(scinfo);
 }
 
 value stub_xl_domain_sched_params_set(value ctx, value domid, value scinfo)
 {
-	CAMLparam3(ctx, domid, scinfo);
-	libxl_domain_sched_params c_scinfo;
-	int ret;
-	uint32_t c_domid = Int_val(domid);
+    CAMLparam3(ctx, domid, scinfo);
+    libxl_domain_sched_params c_scinfo;
+    int ret;
+    uint32_t c_domid = Int_val(domid);
 
-	domain_sched_params_val(CTX, &c_scinfo, scinfo);
+    domain_sched_params_val(CTX, &c_scinfo, scinfo);
 
-	caml_enter_blocking_section();
-	ret = libxl_domain_sched_params_set(CTX, c_domid, &c_scinfo);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_domain_sched_params_set(CTX, c_domid, &c_scinfo);
+    caml_leave_blocking_section();
 
-	libxl_domain_sched_params_dispose(&c_scinfo);
+    libxl_domain_sched_params_dispose(&c_scinfo);
 
-	if (ret != 0)
-		failwith_xl(ret, "domain_sched_params_set");
+    if (ret != 0)
+        failwith_xl(ret, "domain_sched_params_set");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 value stub_xl_send_trigger(value ctx, value domid, value trigger, value vcpuid, value async)
 {
-	CAMLparam5(ctx, domid, trigger, vcpuid, async);
-	int ret;
-	uint32_t c_domid = Int_val(domid);
-	libxl_trigger c_trigger = LIBXL_TRIGGER_UNKNOWN;
-	int c_vcpuid = Int_val(vcpuid);
-	libxl_asyncop_how *ao_how = aohow_val(async);
+    CAMLparam5(ctx, domid, trigger, vcpuid, async);
+    int ret;
+    uint32_t c_domid = Int_val(domid);
+    libxl_trigger c_trigger = LIBXL_TRIGGER_UNKNOWN;
+    int c_vcpuid = Int_val(vcpuid);
+    libxl_asyncop_how *ao_how = aohow_val(async);
 
-	trigger_val(CTX, &c_trigger, trigger);
+    trigger_val(CTX, &c_trigger, trigger);
 
-	caml_enter_blocking_section();
-	ret = libxl_send_trigger(CTX, c_domid, c_trigger, c_vcpuid, ao_how);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_send_trigger(CTX, c_domid, c_trigger, c_vcpuid, ao_how);
+    caml_leave_blocking_section();
 
-	free(ao_how);
+    free(ao_how);
 
-	if (ret != 0)
-		failwith_xl(ret, "send_trigger");
+    if (ret != 0)
+        failwith_xl(ret, "send_trigger");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 value stub_xl_send_sysrq(value ctx, value domid, value sysrq)
 {
-	CAMLparam3(ctx, domid, sysrq);
-	int ret;
-	uint32_t c_domid = Int_val(domid);
-	int c_sysrq = Int_val(sysrq);
+    CAMLparam3(ctx, domid, sysrq);
+    int ret;
+    uint32_t c_domid = Int_val(domid);
+    int c_sysrq = Int_val(sysrq);
 
-	caml_enter_blocking_section();
-	ret = libxl_send_sysrq(CTX, c_domid, c_sysrq);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_send_sysrq(CTX, c_domid, c_sysrq);
+    caml_leave_blocking_section();
 
-	if (ret != 0)
-		failwith_xl(ret, "send_sysrq");
+    if (ret != 0)
+        failwith_xl(ret, "send_sysrq");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 value stub_xl_send_debug_keys(value ctx, value keys)
 {
-	CAMLparam2(ctx, keys);
-	int ret;
-	char *c_keys;
+    CAMLparam2(ctx, keys);
+    int ret;
+    char *c_keys;
 
-	c_keys = dup_String_val(keys);
+    c_keys = dup_String_val(keys);
 
-	caml_enter_blocking_section();
-	ret = libxl_send_debug_keys(CTX, c_keys);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_send_debug_keys(CTX, c_keys);
+    caml_leave_blocking_section();
 
-	free(c_keys);
+    free(c_keys);
 
-	if (ret != 0)
-		failwith_xl(ret, "send_debug_keys");
+    if (ret != 0)
+        failwith_xl(ret, "send_debug_keys");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 static struct custom_operations libxl_console_reader_custom_operations = {
-	"libxl_console_reader_custom_operations",
-	custom_finalize_default,
-	custom_compare_default,
-	custom_hash_default,
-	custom_serialize_default,
-	custom_deserialize_default
+    "libxl_console_reader_custom_operations",
+    custom_finalize_default,
+    custom_compare_default,
+    custom_hash_default,
+    custom_serialize_default,
+    custom_deserialize_default
 };
 
 #define Console_reader_val(x)(*((libxl_xen_console_reader **) Data_custom_val(x)))
 
 value stub_libxl_xen_console_read_start(value ctx, value clear)
 {
-	CAMLparam2(ctx, clear);
-	CAMLlocal1(handle);
-	int c_clear = Int_val(clear);
-	libxl_xen_console_reader *cr;
+    CAMLparam2(ctx, clear);
+    CAMLlocal1(handle);
+    int c_clear = Int_val(clear);
+    libxl_xen_console_reader *cr;
 
-	caml_enter_blocking_section();
-	cr = libxl_xen_console_read_start(CTX, c_clear);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    cr = libxl_xen_console_read_start(CTX, c_clear);
+    caml_leave_blocking_section();
 
-	handle = caml_alloc_custom(&libxl_console_reader_custom_operations, sizeof(cr), 0, 1);
-	Console_reader_val(handle) = cr;
+    handle = caml_alloc_custom(&libxl_console_reader_custom_operations, sizeof(cr), 0, 1);
+    Console_reader_val(handle) = cr;
 
-	CAMLreturn(handle);
+    CAMLreturn(handle);
 }
 
 static void raise_eof(void)
 {
-	static const value *exc = NULL;
+    static const value *exc = NULL;
 
-	/* First time around, lookup by name */
-	if (!exc)
-		exc = caml_named_value("Xenlight.Host.End_of_file");
+    /* First time around, lookup by name */
+    if (!exc)
+        exc = caml_named_value("Xenlight.Host.End_of_file");
 
-	if (!exc)
-		caml_invalid_argument("Exception Xenlight.Host.End_of_file not initialized, please link xenlight.cma");
+    if (!exc)
+        caml_invalid_argument("Exception Xenlight.Host.End_of_file not initialized, please link xenlight.cma");
 
-	caml_raise_constant(*exc);
+    caml_raise_constant(*exc);
 }
 
 value stub_libxl_xen_console_read_line(value ctx, value reader)
 {
-	CAMLparam2(ctx, reader);
-	CAMLlocal1(line);
-	int ret;
-	char *c_line;
-	libxl_xen_console_reader *cr = (libxl_xen_console_reader *) Console_reader_val(reader);
+    CAMLparam2(ctx, reader);
+    CAMLlocal1(line);
+    int ret;
+    char *c_line;
+    libxl_xen_console_reader *cr = (libxl_xen_console_reader *) Console_reader_val(reader);
 
-	caml_enter_blocking_section();
-	ret = libxl_xen_console_read_line(CTX, cr, &c_line);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    ret = libxl_xen_console_read_line(CTX, cr, &c_line);
+    caml_leave_blocking_section();
 
-	if (ret < 0)
-		failwith_xl(ret, "xen_console_read_line");
-	if (ret == 0)
-		raise_eof();
+    if (ret < 0)
+        failwith_xl(ret, "xen_console_read_line");
+    if (ret == 0)
+        raise_eof();
 
-	line = caml_copy_string(c_line);
+    line = caml_copy_string(c_line);
 
-	CAMLreturn(line);
+    CAMLreturn(line);
 }
 
 value stub_libxl_xen_console_read_finish(value ctx, value reader)
 {
-	CAMLparam2(ctx, reader);
-	libxl_xen_console_reader *cr = (libxl_xen_console_reader *) Console_reader_val(reader);
+    CAMLparam2(ctx, reader);
+    libxl_xen_console_reader *cr = (libxl_xen_console_reader *) Console_reader_val(reader);
 
-	caml_enter_blocking_section();
-	libxl_xen_console_read_finish(CTX, cr);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    libxl_xen_console_read_finish(CTX, cr);
+    caml_leave_blocking_section();
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 /* Event handling */
 
 short Poll_val(value event)
 {
-	CAMLparam1(event);
-	short res = -1;
+    CAMLparam1(event);
+    short res = -1;
 
-	switch (Int_val(event)) {
-		case 0: res = POLLIN; break;
-		case 1: res = POLLPRI; break;
-		case 2: res = POLLOUT; break;
-		case 3: res = POLLERR; break;
-		case 4: res = POLLHUP; break;
-		case 5: res = POLLNVAL; break;
-	}
+    switch (Int_val(event)) {
+        case 0: res = POLLIN; break;
+        case 1: res = POLLPRI; break;
+        case 2: res = POLLOUT; break;
+        case 3: res = POLLERR; break;
+        case 4: res = POLLHUP; break;
+        case 5: res = POLLNVAL; break;
+    }
 
-	CAMLreturn(res);
+    CAMLreturn(res);
 }
 
 short Poll_events_val(value event_list)
 {
-	CAMLparam1(event_list);
-	short events = 0;
+    CAMLparam1(event_list);
+    short events = 0;
 
-	while (event_list != Val_emptylist) {
-		events |= Poll_val(Field(event_list, 0));
-		event_list = Field(event_list, 1);
-	}
+    while (event_list != Val_emptylist) {
+        events |= Poll_val(Field(event_list, 0));
+        event_list = Field(event_list, 1);
+    }
 
-	CAMLreturn(events);
+    CAMLreturn(events);
 }
 
 value Val_poll(short event)
 {
-	CAMLparam0();
-	CAMLlocal1(res);
+    CAMLparam0();
+    CAMLlocal1(res);
 
-	switch (event) {
-		case POLLIN: res = Val_int(0); break;
-		case POLLPRI: res = Val_int(1); break;
-		case POLLOUT: res = Val_int(2); break;
-		case POLLERR: res = Val_int(3); break;
-		case POLLHUP: res = Val_int(4); break;
-		case POLLNVAL: res = Val_int(5); break;
-		default: failwith_xl(ERROR_FAIL, "cannot convert poll event value"); break;
-	}
+    switch (event) {
+        case POLLIN: res = Val_int(0); break;
+        case POLLPRI: res = Val_int(1); break;
+        case POLLOUT: res = Val_int(2); break;
+        case POLLERR: res = Val_int(3); break;
+        case POLLHUP: res = Val_int(4); break;
+        case POLLNVAL: res = Val_int(5); break;
+        default: failwith_xl(ERROR_FAIL, "cannot convert poll event value"); break;
+    }
 
-	CAMLreturn(res);
+    CAMLreturn(res);
 }
 
 value add_event(value event_list, short event)
 {
-	CAMLparam1(event_list);
-	CAMLlocal1(new_list);
+    CAMLparam1(event_list);
+    CAMLlocal1(new_list);
 
-	new_list = caml_alloc(2, 0);
-	Store_field(new_list, 0, Val_poll(event));
-	Store_field(new_list, 1, event_list);
+    new_list = caml_alloc(2, 0);
+    Store_field(new_list, 0, Val_poll(event));
+    Store_field(new_list, 1, event_list);
 
-	CAMLreturn(new_list);
+    CAMLreturn(new_list);
 }
 
 value Val_poll_events(short events)
 {
-	CAMLparam0();
-	CAMLlocal1(event_list);
+    CAMLparam0();
+    CAMLlocal1(event_list);
 
-	event_list = Val_emptylist;
-	if (events & POLLIN)
-		event_list = add_event(event_list, POLLIN);
-	if (events & POLLPRI)
-		event_list = add_event(event_list, POLLPRI);
-	if (events & POLLOUT)
-		event_list = add_event(event_list, POLLOUT);
-	if (events & POLLERR)
-		event_list = add_event(event_list, POLLERR);
-	if (events & POLLHUP)
-		event_list = add_event(event_list, POLLHUP);
-	if (events & POLLNVAL)
-		event_list = add_event(event_list, POLLNVAL);
+    event_list = Val_emptylist;
+    if (events & POLLIN)
+        event_list = add_event(event_list, POLLIN);
+    if (events & POLLPRI)
+        event_list = add_event(event_list, POLLPRI);
+    if (events & POLLOUT)
+        event_list = add_event(event_list, POLLOUT);
+    if (events & POLLERR)
+        event_list = add_event(event_list, POLLERR);
+    if (events & POLLHUP)
+        event_list = add_event(event_list, POLLHUP);
+    if (events & POLLNVAL)
+        event_list = add_event(event_list, POLLNVAL);
 
-	CAMLreturn(event_list);
+    CAMLreturn(event_list);
 }
 
 /* The process for dealing with the for_app_registration_  values in the
@@ -1273,385 +1273,385 @@ value Val_poll_events(short events)
 int fd_register(void *user, int fd, void **for_app_registration_out,
                      short events, void *for_libxl)
 {
-	caml_leave_blocking_section();
-	CAMLparam0();
-	CAMLlocalN(args, 4);
-	int ret = 0;
-	static const value *func = NULL;
-	value *p = (value *) user;
-	value *for_app;
+    caml_leave_blocking_section();
+    CAMLparam0();
+    CAMLlocalN(args, 4);
+    int ret = 0;
+    static const value *func = NULL;
+    value *p = (value *) user;
+    value *for_app;
 
-	if (func == NULL) {
-		/* First time around, lookup by name */
-		func = caml_named_value("libxl_fd_register");
-	}
+    if (func == NULL) {
+        /* First time around, lookup by name */
+        func = caml_named_value("libxl_fd_register");
+    }
 
-	args[0] = *p;
-	args[1] = Val_int(fd);
-	args[2] = Val_poll_events(events);
-	args[3] = (value) for_libxl;
+    args[0] = *p;
+    args[1] = Val_int(fd);
+    args[2] = Val_poll_events(events);
+    args[3] = (value) for_libxl;
 
-	for_app = malloc(sizeof(value));
-	if (!for_app) {
-		ret = ERROR_OSEVENT_REG_FAIL;
-		goto err;
-	}
+    for_app = malloc(sizeof(value));
+    if (!for_app) {
+        ret = ERROR_OSEVENT_REG_FAIL;
+        goto err;
+    }
 
-	*for_app = caml_callbackN_exn(*func, 4, args);
-	if (Is_exception_result(*for_app)) {
-		ret = ERROR_OSEVENT_REG_FAIL;
-		free(for_app);
-		goto err;
-	}
+    *for_app = caml_callbackN_exn(*func, 4, args);
+    if (Is_exception_result(*for_app)) {
+        ret = ERROR_OSEVENT_REG_FAIL;
+        free(for_app);
+        goto err;
+    }
 
-	caml_register_global_root(for_app);
-	*for_app_registration_out = for_app;
+    caml_register_global_root(for_app);
+    *for_app_registration_out = for_app;
 
 err:
-	CAMLdone;
-	caml_enter_blocking_section();
-	return ret;
+    CAMLdone;
+    caml_enter_blocking_section();
+    return ret;
 }
 
 int fd_modify(void *user, int fd, void **for_app_registration_update,
                    short events)
 {
-	caml_leave_blocking_section();
-	CAMLparam0();
-	CAMLlocalN(args, 4);
-	int ret = 0;
-	static const value *func = NULL;
-	value *p = (value *) user;
-	value *for_app = *for_app_registration_update;
+    caml_leave_blocking_section();
+    CAMLparam0();
+    CAMLlocalN(args, 4);
+    int ret = 0;
+    static const value *func = NULL;
+    value *p = (value *) user;
+    value *for_app = *for_app_registration_update;
 
-	/* If for_app == NULL, then something is very wrong */
-	assert(for_app);
+    /* If for_app == NULL, then something is very wrong */
+    assert(for_app);
 
-	if (func == NULL) {
-		/* First time around, lookup by name */
-		func = caml_named_value("libxl_fd_modify");
-	}
+    if (func == NULL) {
+        /* First time around, lookup by name */
+        func = caml_named_value("libxl_fd_modify");
+    }
 
-	args[0] = *p;
-	args[1] = Val_int(fd);
-	args[2] = *for_app;
-	args[3] = Val_poll_events(events);
+    args[0] = *p;
+    args[1] = Val_int(fd);
+    args[2] = *for_app;
+    args[3] = Val_poll_events(events);
 
-	*for_app = caml_callbackN_exn(*func, 4, args);
-	if (Is_exception_result(*for_app)) {
-		/* If an exception is caught, *for_app_registration_update is not
-		 * changed. It remains a valid pointer to a value that is registered
-		 * with the GC. */
-		ret = ERROR_OSEVENT_REG_FAIL;
-		goto err;
-	}
+    *for_app = caml_callbackN_exn(*func, 4, args);
+    if (Is_exception_result(*for_app)) {
+        /* If an exception is caught, *for_app_registration_update is not
+         * changed. It remains a valid pointer to a value that is registered
+         * with the GC. */
+        ret = ERROR_OSEVENT_REG_FAIL;
+        goto err;
+    }
 
-	*for_app_registration_update = for_app;
+    *for_app_registration_update = for_app;
 
 err:
-	CAMLdone;
-	caml_enter_blocking_section();
-	return ret;
+    CAMLdone;
+    caml_enter_blocking_section();
+    return ret;
 }
 
 void fd_deregister(void *user, int fd, void *for_app_registration)
 {
-	caml_leave_blocking_section();
-	CAMLparam0();
-	CAMLlocalN(args, 3);
-	static const value *func = NULL;
-	value *p = (value *) user;
-	value *for_app = for_app_registration;
+    caml_leave_blocking_section();
+    CAMLparam0();
+    CAMLlocalN(args, 3);
+    static const value *func = NULL;
+    value *p = (value *) user;
+    value *for_app = for_app_registration;
 
-	/* If for_app == NULL, then something is very wrong */
-	assert(for_app);
+    /* If for_app == NULL, then something is very wrong */
+    assert(for_app);
 
-	if (func == NULL) {
-		/* First time around, lookup by name */
-		func = caml_named_value("libxl_fd_deregister");
-	}
+    if (func == NULL) {
+        /* First time around, lookup by name */
+        func = caml_named_value("libxl_fd_deregister");
+    }
 
-	args[0] = *p;
-	args[1] = Val_int(fd);
-	args[2] = *for_app;
+    args[0] = *p;
+    args[1] = Val_int(fd);
+    args[2] = *for_app;
 
-	caml_callbackN_exn(*func, 3, args);
-	/* This hook does not return error codes, so the best thing we can do
-	 * to avoid trouble, if we catch an exception from the app, is abort. */
-	if (Is_exception_result(*for_app))
-		abort();
+    caml_callbackN_exn(*func, 3, args);
+    /* This hook does not return error codes, so the best thing we can do
+     * to avoid trouble, if we catch an exception from the app, is abort. */
+    if (Is_exception_result(*for_app))
+        abort();
 
-	caml_remove_global_root(for_app);
-	free(for_app);
+    caml_remove_global_root(for_app);
+    free(for_app);
 
-	CAMLdone;
-	caml_enter_blocking_section();
+    CAMLdone;
+    caml_enter_blocking_section();
 }
 
 struct timeout_handles {
-	void *for_libxl;
-	value for_app;
+    void *for_libxl;
+    value for_app;
 };
 
 int timeout_register(void *user, void **for_app_registration_out,
                           struct timeval abs, void *for_libxl)
 {
-	caml_leave_blocking_section();
-	CAMLparam0();
-	CAMLlocal2(sec, usec);
-	CAMLlocalN(args, 4);
-	int ret = 0;
-	static const value *func = NULL;
-	value *p = (value *) user;
-	struct timeout_handles *handles;
+    caml_leave_blocking_section();
+    CAMLparam0();
+    CAMLlocal2(sec, usec);
+    CAMLlocalN(args, 4);
+    int ret = 0;
+    static const value *func = NULL;
+    value *p = (value *) user;
+    struct timeout_handles *handles;
 
-	if (func == NULL) {
-		/* First time around, lookup by name */
-		func = caml_named_value("libxl_timeout_register");
-	}
+    if (func == NULL) {
+        /* First time around, lookup by name */
+        func = caml_named_value("libxl_timeout_register");
+    }
 
-	sec = caml_copy_int64(abs.tv_sec);
-	usec = caml_copy_int64(abs.tv_usec);
+    sec = caml_copy_int64(abs.tv_sec);
+    usec = caml_copy_int64(abs.tv_usec);
 
-	/* This struct of "handles" will contain "for_libxl" as well as "for_app".
-	 * We'll give a pointer to the struct to the app, and get it back in
-	 * occurred_timeout, where we can clean it all up. */
-	handles = malloc(sizeof(*handles));
-	if (!handles) {
-		ret = ERROR_OSEVENT_REG_FAIL;
-		goto err;
-	}
+    /* This struct of "handles" will contain "for_libxl" as well as "for_app".
+     * We'll give a pointer to the struct to the app, and get it back in
+     * occurred_timeout, where we can clean it all up. */
+    handles = malloc(sizeof(*handles));
+    if (!handles) {
+        ret = ERROR_OSEVENT_REG_FAIL;
+        goto err;
+    }
 
-	handles->for_libxl = for_libxl;
+    handles->for_libxl = for_libxl;
 
-	args[0] = *p;
-	args[1] = sec;
-	args[2] = usec;
-	args[3] = (value) handles;
+    args[0] = *p;
+    args[1] = sec;
+    args[2] = usec;
+    args[3] = (value) handles;
 
-	handles->for_app = caml_callbackN_exn(*func, 4, args);
-	if (Is_exception_result(handles->for_app)) {
-		ret = ERROR_OSEVENT_REG_FAIL;
-		free(handles);
-		goto err;
-	}
+    handles->for_app = caml_callbackN_exn(*func, 4, args);
+    if (Is_exception_result(handles->for_app)) {
+        ret = ERROR_OSEVENT_REG_FAIL;
+        free(handles);
+        goto err;
+    }
 
-	caml_register_global_root(&handles->for_app);
-	*for_app_registration_out = handles;
+    caml_register_global_root(&handles->for_app);
+    *for_app_registration_out = handles;
 
 err:
-	CAMLdone;
-	caml_enter_blocking_section();
-	return ret;
+    CAMLdone;
+    caml_enter_blocking_section();
+    return ret;
 }
 
 int timeout_modify(void *user, void **for_app_registration_update,
                          struct timeval abs)
 {
-	caml_leave_blocking_section();
-	CAMLparam0();
-	CAMLlocal1(for_app_update);
-	CAMLlocalN(args, 2);
-	int ret = 0;
-	static const value *func = NULL;
-	value *p = (value *) user;
-	struct timeout_handles *handles = *for_app_registration_update;
+    caml_leave_blocking_section();
+    CAMLparam0();
+    CAMLlocal1(for_app_update);
+    CAMLlocalN(args, 2);
+    int ret = 0;
+    static const value *func = NULL;
+    value *p = (value *) user;
+    struct timeout_handles *handles = *for_app_registration_update;
 
-	/* If for_app == NULL, then something is very wrong */
-	assert(handles->for_app);
+    /* If for_app == NULL, then something is very wrong */
+    assert(handles->for_app);
 
-	/* Libxl currently promises that timeout_modify is only ever called with
-	 * abs={0,0}, meaning "right away". We cannot deal with other values. */
-	assert(abs.tv_sec == 0 && abs.tv_usec == 0);
+    /* Libxl currently promises that timeout_modify is only ever called with
+     * abs={0,0}, meaning "right away". We cannot deal with other values. */
+    assert(abs.tv_sec == 0 && abs.tv_usec == 0);
 
-	if (func == NULL) {
-		/* First time around, lookup by name */
-		func = caml_named_value("libxl_timeout_fire_now");
-	}
+    if (func == NULL) {
+        /* First time around, lookup by name */
+        func = caml_named_value("libxl_timeout_fire_now");
+    }
 
-	args[0] = *p;
-	args[1] = handles->for_app;
+    args[0] = *p;
+    args[1] = handles->for_app;
 
-	for_app_update = caml_callbackN_exn(*func, 2, args);
-	if (Is_exception_result(for_app_update)) {
-		/* If an exception is caught, *for_app_registration_update is not
-		 * changed. It remains a valid pointer to a value that is registered
-		 * with the GC. */
-		ret = ERROR_OSEVENT_REG_FAIL;
-		goto err;
-	}
+    for_app_update = caml_callbackN_exn(*func, 2, args);
+    if (Is_exception_result(for_app_update)) {
+        /* If an exception is caught, *for_app_registration_update is not
+         * changed. It remains a valid pointer to a value that is registered
+         * with the GC. */
+        ret = ERROR_OSEVENT_REG_FAIL;
+        goto err;
+    }
 
-	handles->for_app = for_app_update;
+    handles->for_app = for_app_update;
 
 err:
-	CAMLdone;
-	caml_enter_blocking_section();
-	return ret;
+    CAMLdone;
+    caml_enter_blocking_section();
+    return ret;
 }
 
 void timeout_deregister(void *user, void *for_app_registration)
 {
-	/* This hook will never be called by libxl. */
-	abort();
+    /* This hook will never be called by libxl. */
+    abort();
 }
 
 value stub_libxl_osevent_register_hooks(value ctx, value user)
 {
-	CAMLparam2(ctx, user);
-	CAMLlocal1(result);
-	libxl_osevent_hooks *hooks;
-	value *p;
+    CAMLparam2(ctx, user);
+    CAMLlocal1(result);
+    libxl_osevent_hooks *hooks;
+    value *p;
 
-	hooks = malloc(sizeof(*hooks));
-	if (!hooks)
-		failwith_xl(ERROR_NOMEM, "cannot allocate osevent hooks");
-	hooks->fd_register = fd_register;
-	hooks->fd_modify = fd_modify;
-	hooks->fd_deregister = fd_deregister;
-	hooks->timeout_register = timeout_register;
-	hooks->timeout_modify = timeout_modify;
-	hooks->timeout_deregister = timeout_deregister;
+    hooks = malloc(sizeof(*hooks));
+    if (!hooks)
+        failwith_xl(ERROR_NOMEM, "cannot allocate osevent hooks");
+    hooks->fd_register = fd_register;
+    hooks->fd_modify = fd_modify;
+    hooks->fd_deregister = fd_deregister;
+    hooks->timeout_register = timeout_register;
+    hooks->timeout_modify = timeout_modify;
+    hooks->timeout_deregister = timeout_deregister;
 
-	p = malloc(sizeof(value));
-	if (!p)
-		failwith_xl(ERROR_NOMEM, "cannot allocate value");
-	*p = user;
-	caml_register_global_root(p);
+    p = malloc(sizeof(value));
+    if (!p)
+        failwith_xl(ERROR_NOMEM, "cannot allocate value");
+    *p = user;
+    caml_register_global_root(p);
 
-	caml_enter_blocking_section();
-	libxl_osevent_register_hooks(CTX, hooks, (void *) p);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    libxl_osevent_register_hooks(CTX, hooks, (void *) p);
+    caml_leave_blocking_section();
 
-	result = caml_alloc(1, Abstract_tag);
-	*((libxl_osevent_hooks **) result) = hooks;
+    result = caml_alloc(1, Abstract_tag);
+    *((libxl_osevent_hooks **) result) = hooks;
 
-	CAMLreturn(result);
+    CAMLreturn(result);
 }
 
 value stub_libxl_osevent_occurred_fd(value ctx, value for_libxl, value fd,
-	value events, value revents)
+    value events, value revents)
 {
-	CAMLparam5(ctx, for_libxl, fd, events, revents);
-	int c_fd = Int_val(fd);
-	short c_events = Poll_events_val(events);
-	short c_revents = Poll_events_val(revents);
+    CAMLparam5(ctx, for_libxl, fd, events, revents);
+    int c_fd = Int_val(fd);
+    short c_events = Poll_events_val(events);
+    short c_revents = Poll_events_val(revents);
 
-	caml_enter_blocking_section();
-	libxl_osevent_occurred_fd(CTX, (void *) for_libxl, c_fd, c_events, c_revents);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    libxl_osevent_occurred_fd(CTX, (void *) for_libxl, c_fd, c_events, c_revents);
+    caml_leave_blocking_section();
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 value stub_libxl_osevent_occurred_timeout(value ctx, value handles)
 {
-	CAMLparam1(ctx);
-	struct timeout_handles *c_handles = (struct timeout_handles *) handles;
+    CAMLparam1(ctx);
+    struct timeout_handles *c_handles = (struct timeout_handles *) handles;
 
-	caml_enter_blocking_section();
-	libxl_osevent_occurred_timeout(CTX, (void *) c_handles->for_libxl);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    libxl_osevent_occurred_timeout(CTX, (void *) c_handles->for_libxl);
+    caml_leave_blocking_section();
 
-	caml_remove_global_root(&c_handles->for_app);
-	free(c_handles);
+    caml_remove_global_root(&c_handles->for_app);
+    free(c_handles);
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 struct user_with_ctx {
-	libxl_ctx *ctx;
-	value user;
+    libxl_ctx *ctx;
+    value user;
 };
 
 void event_occurs(void *user, libxl_event *event)
 {
-	caml_leave_blocking_section();
-	CAMLparam0();
-	CAMLlocalN(args, 2);
-	struct user_with_ctx *c_user = (struct user_with_ctx *) user;
-	static const value *func = NULL;
+    caml_leave_blocking_section();
+    CAMLparam0();
+    CAMLlocalN(args, 2);
+    struct user_with_ctx *c_user = (struct user_with_ctx *) user;
+    static const value *func = NULL;
 
-	if (func == NULL) {
-		/* First time around, lookup by name */
-		func = caml_named_value("libxl_event_occurs_callback");
-	}
+    if (func == NULL) {
+        /* First time around, lookup by name */
+        func = caml_named_value("libxl_event_occurs_callback");
+    }
 
-	args[0] = c_user->user;
-	args[1] = Val_event(event);
-	libxl_event_free(c_user->ctx, event);
+    args[0] = c_user->user;
+    args[1] = Val_event(event);
+    libxl_event_free(c_user->ctx, event);
 
-	caml_callbackN(*func, 2, args);
-	CAMLdone;
-	caml_enter_blocking_section();
+    caml_callbackN(*func, 2, args);
+    CAMLdone;
+    caml_enter_blocking_section();
 }
 
 void disaster(void *user, libxl_event_type type,
                      const char *msg, int errnoval)
 {
-	caml_leave_blocking_section();
-	CAMLparam0();
-	CAMLlocalN(args, 4);
-	struct user_with_ctx *c_user = (struct user_with_ctx *) user;
-	static const value *func = NULL;
+    caml_leave_blocking_section();
+    CAMLparam0();
+    CAMLlocalN(args, 4);
+    struct user_with_ctx *c_user = (struct user_with_ctx *) user;
+    static const value *func = NULL;
 
-	if (func == NULL) {
-		/* First time around, lookup by name */
-		func = caml_named_value("libxl_event_disaster_callback");
-	}
+    if (func == NULL) {
+        /* First time around, lookup by name */
+        func = caml_named_value("libxl_event_disaster_callback");
+    }
 
-	args[0] = c_user->user;
-	args[1] = Val_event_type(type);
-	args[2] = caml_copy_string(msg);
-	args[3] = Val_int(errnoval);
+    args[0] = c_user->user;
+    args[1] = Val_event_type(type);
+    args[2] = caml_copy_string(msg);
+    args[3] = Val_int(errnoval);
 
-	caml_callbackN(*func, 4, args);
-	CAMLdone;
-	caml_enter_blocking_section();
+    caml_callbackN(*func, 4, args);
+    CAMLdone;
+    caml_enter_blocking_section();
 }
 
 value stub_libxl_event_register_callbacks(value ctx, value user)
 {
-	CAMLparam2(ctx, user);
-	CAMLlocal1(result);
-	struct user_with_ctx *c_user = NULL;
-	libxl_event_hooks *hooks;
+    CAMLparam2(ctx, user);
+    CAMLlocal1(result);
+    struct user_with_ctx *c_user = NULL;
+    libxl_event_hooks *hooks;
 
-	c_user = malloc(sizeof(*c_user));
-	if (!c_user)
-		failwith_xl(ERROR_NOMEM, "cannot allocate user value");
-	c_user->user = user;
-	c_user->ctx = CTX;
-	caml_register_global_root(&c_user->user);
+    c_user = malloc(sizeof(*c_user));
+    if (!c_user)
+        failwith_xl(ERROR_NOMEM, "cannot allocate user value");
+    c_user->user = user;
+    c_user->ctx = CTX;
+    caml_register_global_root(&c_user->user);
 
-	hooks = malloc(sizeof(*hooks));
-	if (!hooks)
-		failwith_xl(ERROR_NOMEM, "cannot allocate event hooks");
-	hooks->event_occurs_mask = LIBXL_EVENTMASK_ALL;
-	hooks->event_occurs = event_occurs;
-	hooks->disaster = disaster;
+    hooks = malloc(sizeof(*hooks));
+    if (!hooks)
+        failwith_xl(ERROR_NOMEM, "cannot allocate event hooks");
+    hooks->event_occurs_mask = LIBXL_EVENTMASK_ALL;
+    hooks->event_occurs = event_occurs;
+    hooks->disaster = disaster;
 
-	caml_enter_blocking_section();
-	libxl_event_register_callbacks(CTX, hooks, (void *) c_user);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    libxl_event_register_callbacks(CTX, hooks, (void *) c_user);
+    caml_leave_blocking_section();
 
-	result = caml_alloc(1, Abstract_tag);
-	*((libxl_event_hooks **) result) = hooks;
+    result = caml_alloc(1, Abstract_tag);
+    *((libxl_event_hooks **) result) = hooks;
 
-	CAMLreturn(result);
+    CAMLreturn(result);
 }
 
 value stub_libxl_evenable_domain_death(value ctx, value domid, value user)
 {
-	CAMLparam3(ctx, domid, user);
-	uint32_t c_domid = Int_val(domid);
-	int c_user = Int_val(user);
-	libxl_evgen_domain_death *evgen_out;
+    CAMLparam3(ctx, domid, user);
+    uint32_t c_domid = Int_val(domid);
+    int c_user = Int_val(user);
+    libxl_evgen_domain_death *evgen_out;
 
-	caml_enter_blocking_section();
-	libxl_evenable_domain_death(CTX, c_domid, c_user, &evgen_out);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    libxl_evenable_domain_death(CTX, c_domid, c_user, &evgen_out);
+    caml_leave_blocking_section();
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 /*
diff --git a/tools/ocaml/libs/xs/queueop.ml b/tools/ocaml/libs/xs/queueop.ml
index 4e532cdaea..e069ab7a9c 100644
--- a/tools/ocaml/libs/xs/queueop.ml
+++ b/tools/ocaml/libs/xs/queueop.ml
@@ -18,8 +18,8 @@ open Xenbus
 let data_concat ls = (String.concat "\000" ls) ^ "\000"
 let queue con pkt = let r = Xb.queue con pkt in assert (r <> None)
 let queue_path ty (tid: int) (path: string) con =
-	let data = data_concat [ path; ] in
-	queue con (Xb.Packet.create tid 0 ty data)
+  let data = data_concat [ path; ] in
+  queue con (Xb.Packet.create tid 0 ty data)
 
 (* operations *)
 let directory tid path con = queue_path Xb.Op.Directory tid path con
@@ -28,48 +28,48 @@ let read tid path con = queue_path Xb.Op.Read tid path con
 let getperms tid path con = queue_path Xb.Op.Getperms tid path con
 
 let debug commands con =
-	queue con (Xb.Packet.create 0 0 Xb.Op.Debug (data_concat commands))
+  queue con (Xb.Packet.create 0 0 Xb.Op.Debug (data_concat commands))
 
 let watch path data con =
-	let data = data_concat [ path; data; ] in
-	queue con (Xb.Packet.create 0 0 Xb.Op.Watch data)
+  let data = data_concat [ path; data; ] in
+  queue con (Xb.Packet.create 0 0 Xb.Op.Watch data)
 
 let unwatch path data con =
-	let data = data_concat [ path; data; ] in
-	queue con (Xb.Packet.create 0 0 Xb.Op.Unwatch data)
+  let data = data_concat [ path; data; ] in
+  queue con (Xb.Packet.create 0 0 Xb.Op.Unwatch data)
 
 let transaction_start con =
-	queue con (Xb.Packet.create 0 0 Xb.Op.Transaction_start (data_concat []))
+  queue con (Xb.Packet.create 0 0 Xb.Op.Transaction_start (data_concat []))
 
 let transaction_end tid commit con =
-	let data = data_concat [ (if commit then "T" else "F"); ] in
-	queue con (Xb.Packet.create tid 0 Xb.Op.Transaction_end data)
+  let data = data_concat [ (if commit then "T" else "F"); ] in
+  queue con (Xb.Packet.create tid 0 Xb.Op.Transaction_end data)
 
 let introduce domid mfn port con =
-	let data = data_concat [ Printf.sprintf "%u" domid;
-	                         Printf.sprintf "%nu" mfn;
-	                         string_of_int port; ] in
-	queue con (Xb.Packet.create 0 0 Xb.Op.Introduce data)
+  let data = data_concat [ Printf.sprintf "%u" domid;
+                           Printf.sprintf "%nu" mfn;
+                           string_of_int port; ] in
+  queue con (Xb.Packet.create 0 0 Xb.Op.Introduce data)
 
 let release domid con =
-	let data = data_concat [ Printf.sprintf "%u" domid; ] in
-	queue con (Xb.Packet.create 0 0 Xb.Op.Release data)
+  let data = data_concat [ Printf.sprintf "%u" domid; ] in
+  queue con (Xb.Packet.create 0 0 Xb.Op.Release data)
 
 let resume domid con =
-	let data = data_concat [ Printf.sprintf "%u" domid; ] in
-	queue con (Xb.Packet.create 0 0 Xb.Op.Resume data)
+  let data = data_concat [ Printf.sprintf "%u" domid; ] in
+  queue con (Xb.Packet.create 0 0 Xb.Op.Resume data)
 
 let getdomainpath domid con =
-	let data = data_concat [ Printf.sprintf "%u" domid; ] in
-	queue con (Xb.Packet.create 0 0 Xb.Op.Getdomainpath data)
+  let data = data_concat [ Printf.sprintf "%u" domid; ] in
+  queue con (Xb.Packet.create 0 0 Xb.Op.Getdomainpath data)
 
 let write tid path value con =
-	let data = path ^ "\000" ^ value (* no NULL at the end *) in
-	queue con (Xb.Packet.create tid 0 Xb.Op.Write data)
+  let data = path ^ "\000" ^ value (* no NULL at the end *) in
+  queue con (Xb.Packet.create tid 0 Xb.Op.Write data)
 
 let mkdir tid path con = queue_path Xb.Op.Mkdir tid path con
 let rm tid path con = queue_path Xb.Op.Rm tid path con
 
 let setperms tid path perms con =
-	let data = data_concat [ path; perms ] in
-	queue con (Xb.Packet.create tid 0 Xb.Op.Setperms data)
+  let data = data_concat [ path; perms ] in
+  queue con (Xb.Packet.create tid 0 Xb.Op.Setperms data)
diff --git a/tools/ocaml/libs/xs/xs.ml b/tools/ocaml/libs/xs/xs.ml
index 90bd68d73d..addccc8009 100644
--- a/tools/ocaml/libs/xs/xs.ml
+++ b/tools/ocaml/libs/xs/xs.ml
@@ -19,46 +19,46 @@ type con = Xsraw.con
 type domid = int
 
 type xsh =
-{
-	con: con;
-	debug: string list -> string;
-	directory: string -> string list;
-	read: string -> string;
-	readv: string -> string list -> string list;
-	write: string -> string -> unit;
-	writev: string -> (string * string) list -> unit;
-	mkdir: string -> unit;
-	rm: string -> unit;
-	getperms: string -> perms;
-	setperms: string -> perms -> unit;
-	setpermsv: string -> string list -> perms -> unit;
-	introduce: domid -> nativeint -> int -> unit;
-	release: domid -> unit;
-	resume: domid -> unit;
-	getdomainpath: domid -> string;
-	watch: string -> string -> unit;
-	unwatch: string -> string -> unit;
-}
+  {
+    con: con;
+    debug: string list -> string;
+    directory: string -> string list;
+    read: string -> string;
+    readv: string -> string list -> string list;
+    write: string -> string -> unit;
+    writev: string -> (string * string) list -> unit;
+    mkdir: string -> unit;
+    rm: string -> unit;
+    getperms: string -> perms;
+    setperms: string -> perms -> unit;
+    setpermsv: string -> string list -> perms -> unit;
+    introduce: domid -> nativeint -> int -> unit;
+    release: domid -> unit;
+    resume: domid -> unit;
+    getdomainpath: domid -> string;
+    watch: string -> string -> unit;
+    unwatch: string -> string -> unit;
+  }
 
 let get_operations con = {
-	con = con;
-	debug = (fun commands -> Xsraw.debug commands con);
-	directory = (fun path -> Xsraw.directory 0 path con);
-	read = (fun path -> Xsraw.read 0 path con);
-	readv = (fun dir vec -> Xsraw.readv 0 dir vec con);
-	write = (fun path value -> Xsraw.write 0 path value con);
-	writev = (fun dir vec -> Xsraw.writev 0 dir vec con);
-	mkdir = (fun path -> Xsraw.mkdir 0 path con);
-	rm = (fun path -> Xsraw.rm 0 path con);
-	getperms = (fun path -> Xsraw.getperms 0 path con);
-	setperms = (fun path perms -> Xsraw.setperms 0 path perms con);
-	setpermsv = (fun dir vec perms -> Xsraw.setpermsv 0 dir vec perms con);
-	introduce = (fun id mfn port -> Xsraw.introduce id mfn port con);
-	release = (fun id -> Xsraw.release id con);
-	resume = (fun id -> Xsraw.resume id con);
-	getdomainpath = (fun id -> Xsraw.getdomainpath id con);
-	watch = (fun path data -> Xsraw.watch path data con);
-	unwatch = (fun path data -> Xsraw.unwatch path data con);
+  con = con;
+  debug = (fun commands -> Xsraw.debug commands con);
+  directory = (fun path -> Xsraw.directory 0 path con);
+  read = (fun path -> Xsraw.read 0 path con);
+  readv = (fun dir vec -> Xsraw.readv 0 dir vec con);
+  write = (fun path value -> Xsraw.write 0 path value con);
+  writev = (fun dir vec -> Xsraw.writev 0 dir vec con);
+  mkdir = (fun path -> Xsraw.mkdir 0 path con);
+  rm = (fun path -> Xsraw.rm 0 path con);
+  getperms = (fun path -> Xsraw.getperms 0 path con);
+  setperms = (fun path perms -> Xsraw.setperms 0 path perms con);
+  setpermsv = (fun dir vec perms -> Xsraw.setpermsv 0 dir vec perms con);
+  introduce = (fun id mfn port -> Xsraw.introduce id mfn port con);
+  release = (fun id -> Xsraw.release id con);
+  resume = (fun id -> Xsraw.resume id con);
+  getdomainpath = (fun id -> Xsraw.getdomainpath id con);
+  watch = (fun path data -> Xsraw.watch path data con);
+  unwatch = (fun path data -> Xsraw.unwatch path data con);
 }
 
 let transaction xsh = Xst.transaction xsh.con
@@ -81,71 +81,71 @@ exception Timeout_with_nonempty_queue
 let max_blocking_time = 5. (* seconds *)
 
 let read_watchevent_timeout xsh timeout callback =
-	let start_time = Unix.gettimeofday () in
-	let end_time = start_time +. timeout in
+  let start_time = Unix.gettimeofday () in
+  let end_time = start_time +. timeout in
 
-	let left = ref timeout in
+  let left = ref timeout in
 
-	(* Returns true if a watch event in the queue satisfied us *)
-	let process_queued_events () =
-		let success = ref false in
-		while Xsraw.has_watchevents xsh.con && not(!success)
-		do
-			success := callback (Xsraw.get_watchevent xsh.con)
-		done;
-		!success in
-	(* Returns true if a watch event read from the socket satisfied us *)
-	let process_incoming_event () =
-		let fd = get_fd xsh in
-		let r, _, _ = Unix.select [ fd ] [] [] (min max_blocking_time !left) in
+  (* Returns true if a watch event in the queue satisfied us *)
+  let process_queued_events () =
+    let success = ref false in
+    while Xsraw.has_watchevents xsh.con && not(!success)
+    do
+      success := callback (Xsraw.get_watchevent xsh.con)
+    done;
+    !success in
+  (* Returns true if a watch event read from the socket satisfied us *)
+  let process_incoming_event () =
+    let fd = get_fd xsh in
+    let r, _, _ = Unix.select [ fd ] [] [] (min max_blocking_time !left) in
 
-		(* If data is available for reading then read it *)
-		if r = []
-		then false (* timeout, either a max_blocking_time or global *)
-		else callback (Xsraw.read_watchevent xsh.con) in
+    (* If data is available for reading then read it *)
+    if r = []
+    then false (* timeout, either a max_blocking_time or global *)
+    else callback (Xsraw.read_watchevent xsh.con) in
 
-	let success = ref false in
-	while !left > 0. && not(!success)
-	do
-		(* NB the 'callback' might call back into Xs functions
-		   and as a side-effect, watches might be queued. Hence
-		   we must process the queue on every loop iteration *)
+  let success = ref false in
+  while !left > 0. && not(!success)
+  do
+    (* NB the 'callback' might call back into Xs functions
+       		   and as a side-effect, watches might be queued. Hence
+       		   we must process the queue on every loop iteration *)
 
-		(* First process all queued watch events *)
-		if not(!success)
-		then success := process_queued_events ();
-		(* Then block for one more watch event *)
-		if not(!success)
-		then success := process_incoming_event ();
-		(* Just in case our callback caused events to be queued
-		   and this is our last time round the loop: this prevents
-		   us throwing the Timeout_with_nonempty_queue spuriously *)
-		if not(!success)
-		then success := process_queued_events ();
+    (* First process all queued watch events *)
+    if not(!success)
+    then success := process_queued_events ();
+    (* Then block for one more watch event *)
+    if not(!success)
+    then success := process_incoming_event ();
+    (* Just in case our callback caused events to be queued
+       		   and this is our last time round the loop: this prevents
+       		   us throwing the Timeout_with_nonempty_queue spuriously *)
+    if not(!success)
+    then success := process_queued_events ();
 
-		(* Update the time left *)
-		let current_time = Unix.gettimeofday () in
-		left := end_time -. current_time
-	done;
-	if not(!success) then begin
-		(* Sanity check: it should be impossible for any
-		   events to be queued here *)
-		if Xsraw.has_watchevents xsh.con
-		then raise Timeout_with_nonempty_queue
-		else raise Timeout
-	end
+    (* Update the time left *)
+    let current_time = Unix.gettimeofday () in
+    left := end_time -. current_time
+  done;
+  if not(!success) then begin
+    (* Sanity check: it should be impossible for any
+       		   events to be queued here *)
+    if Xsraw.has_watchevents xsh.con
+    then raise Timeout_with_nonempty_queue
+    else raise Timeout
+  end
 
 
 let monitor_paths xsh l time callback =
-	let unwatch () =
-		List.iter (fun (w,v) -> try xsh.unwatch w v with _ -> ()) l in
-	List.iter (fun (w,v) -> xsh.watch w v) l;
-	begin try
-		read_watchevent_timeout xsh time callback;
-	with
-		exn -> unwatch (); raise exn;
-	end;
-	unwatch ()
+  let unwatch () =
+    List.iter (fun (w,v) -> try xsh.unwatch w v with _ -> ()) l in
+  List.iter (fun (w,v) -> xsh.watch w v) l;
+  begin try
+      read_watchevent_timeout xsh time callback;
+    with
+      exn -> unwatch (); raise exn;
+  end;
+  unwatch ()
 
 let daemon_socket = Paths.xen_run_stored ^ "/socket"
 
@@ -153,24 +153,24 @@ let daemon_socket = Paths.xen_run_stored ^ "/socket"
 exception Failed_to_connect
 
 let daemon_open () =
-	try
-		let sockaddr = Unix.ADDR_UNIX(daemon_socket) in
-		let sock = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in
-		Unix.connect sock sockaddr;
-		Unix.set_close_on_exec sock;
-		make sock
-	with _ -> raise Failed_to_connect
+  try
+    let sockaddr = Unix.ADDR_UNIX(daemon_socket) in
+    let sock = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in
+    Unix.connect sock sockaddr;
+    Unix.set_close_on_exec sock;
+    make sock
+  with _ -> raise Failed_to_connect
 
 let domain_open () =
-	let path = try
-		let devpath = "/dev/xen/xenbus" in
-		Unix.access devpath [ Unix.F_OK ];
-		devpath
-	with Unix.Unix_error(_, _, _) ->
-		"/proc/xen/xenbus" in
+  let path = try
+      let devpath = "/dev/xen/xenbus" in
+      Unix.access devpath [ Unix.F_OK ];
+      devpath
+    with Unix.Unix_error(_, _, _) ->
+      "/proc/xen/xenbus" in
 
-	let fd = Unix.openfile path [ Unix.O_RDWR ] 0o550 in
-	Unix.set_close_on_exec fd;
-	make fd
+  let fd = Unix.openfile path [ Unix.O_RDWR ] 0o550 in
+  Unix.set_close_on_exec fd;
+  make fd
 
 let close xsh = Xsraw.close xsh.con
diff --git a/tools/ocaml/libs/xs/xs.mli b/tools/ocaml/libs/xs/xs.mli
index ce505b659b..cf8855c7d8 100644
--- a/tools/ocaml/libs/xs/xs.mli
+++ b/tools/ocaml/libs/xs/xs.mli
@@ -23,31 +23,31 @@ exception Failed_to_connect
     - owner domid.
     - other perm: applied to domain that is not owner or in ACL.
     - ACL: list of per-domain permission
-  *)
+*)
 type perms = Xsraw.perms
 
 type domid = int
 type con
 
 type xsh = {
-	con : con;
-	debug: string list -> string;
-	directory : string -> string list;
-	read : string -> string;
-	readv : string -> string list -> string list;
-	write : string -> string -> unit;
-	writev : string -> (string * string) list -> unit;
-	mkdir : string -> unit;
-	rm : string -> unit;
-	getperms : string -> perms;
-	setperms : string -> perms -> unit;
-	setpermsv : string -> string list -> perms -> unit;
-	introduce : domid -> nativeint -> int -> unit;
-	release : domid -> unit;
-	resume : domid -> unit;
-	getdomainpath : domid -> string;
-	watch : string -> string -> unit;
-	unwatch : string -> string -> unit;
+  con : con;
+  debug: string list -> string;
+  directory : string -> string list;
+  read : string -> string;
+  readv : string -> string list -> string list;
+  write : string -> string -> unit;
+  writev : string -> (string * string) list -> unit;
+  mkdir : string -> unit;
+  rm : string -> unit;
+  getperms : string -> perms;
+  setperms : string -> perms -> unit;
+  setpermsv : string -> string list -> perms -> unit;
+  introduce : domid -> nativeint -> int -> unit;
+  release : domid -> unit;
+  resume : domid -> unit;
+  getdomainpath : domid -> string;
+  watch : string -> string -> unit;
+  unwatch : string -> string -> unit;
 }
 
 (** get operations provide a vector of xenstore function that apply to one
@@ -75,10 +75,10 @@ val read_watchevent_timeout : xsh -> float -> (string * string -> bool) -> unit
 (** register a set of watches, then wait for watchevent.
     remove all watches previously set before giving back the hand. *)
 val monitor_paths : xsh
-                 -> (string * string) list
-                 -> float
-                 -> (string * string -> bool)
-                 -> unit
+  -> (string * string) list
+  -> float
+  -> (string * string -> bool)
+  -> unit
 
 (** open a socket-based xenstored connection *)
 val daemon_open : unit -> xsh
diff --git a/tools/ocaml/libs/xs/xsraw.ml b/tools/ocaml/libs/xs/xsraw.ml
index cbd1728060..d51e40eed3 100644
--- a/tools/ocaml/libs/xs/xsraw.ml
+++ b/tools/ocaml/libs/xs/xsraw.ml
@@ -23,239 +23,239 @@ exception Unexpected_packet of string
 exception Invalid_path of string
 
 let unexpected_packet expected received =
-	let s = Printf.sprintf "expecting %s received %s"
-	                       (Xb.Op.to_string expected)
-	                       (Xb.Op.to_string received) in
-	raise (Unexpected_packet s)
+  let s = Printf.sprintf "expecting %s received %s"
+      (Xb.Op.to_string expected)
+      (Xb.Op.to_string received) in
+  raise (Unexpected_packet s)
 
 type con = {
-	xb: Xenbus.Xb.t;
-	watchevents: (string * string) Queue.t;
+  xb: Xenbus.Xb.t;
+  watchevents: (string * string) Queue.t;
 }
 
 let close con =
-	Xb.close con.xb
+  Xb.close con.xb
 
 let capacity = { Xb.maxoutstanding = 1; maxwatchevents = 0; }
 
 let open_fd fd = {
-	xb = Xb.open_fd ~capacity fd;
-	watchevents = Queue.create ();
+  xb = Xb.open_fd ~capacity fd;
+  watchevents = Queue.create ();
 }
 
 let rec split_string ?limit:(limit=(-1)) c s =
-	let i = try String.index s c with Not_found -> -1 in
-	let nlimit = if limit = -1 || limit = 0 then limit else limit - 1 in
-	if i = -1 || nlimit = 0 then
-		[ s ]
-	else
-		let a = String.sub s 0 i
-		and b = String.sub s (i + 1) (String.length s - i - 1) in
-		a :: (split_string ~limit: nlimit c b)
+  let i = try String.index s c with Not_found -> -1 in
+  let nlimit = if limit = -1 || limit = 0 then limit else limit - 1 in
+  if i = -1 || nlimit = 0 then
+    [ s ]
+  else
+    let a = String.sub s 0 i
+    and b = String.sub s (i + 1) (String.length s - i - 1) in
+    a :: (split_string ~limit: nlimit c b)
 
 type perm = PERM_NONE | PERM_READ | PERM_WRITE | PERM_RDWR
 
 type perms = int * perm * (int * perm) list
 
 let string_of_perms perms =
-	let owner, other, acl = perms in
-	let char_of_perm perm =
-		match perm with PERM_NONE -> 'n' | PERM_READ -> 'r'
-			      | PERM_WRITE -> 'w' | PERM_RDWR -> 'b' in
-	let string_of_perm (id, perm) = Printf.sprintf "%c%u" (char_of_perm perm) id in
-	String.concat "\000" (List.map string_of_perm ((owner,other) :: acl))
+  let owner, other, acl = perms in
+  let char_of_perm perm =
+    match perm with PERM_NONE -> 'n' | PERM_READ -> 'r'
+                  | PERM_WRITE -> 'w' | PERM_RDWR -> 'b' in
+  let string_of_perm (id, perm) = Printf.sprintf "%c%u" (char_of_perm perm) id in
+  String.concat "\000" (List.map string_of_perm ((owner,other) :: acl))
 
 let perms_of_string s =
-	let perm_of_char c =
-		match c with 'n' -> PERM_NONE | 'r' -> PERM_READ
-		           | 'w' -> PERM_WRITE | 'b' -> PERM_RDWR
-		           | c -> invalid_arg (Printf.sprintf "unknown permission type: %c" c) in
-	let perm_of_string s =
-		if String.length s < 2
-		then invalid_arg (Printf.sprintf "perm of string: length = %d; contents=\"%s\"" (String.length s) s)
-		else
-		begin
-			int_of_string (String.sub s 1 (String.length s - 1)),
-			perm_of_char s.[0]
-		end in
-	let rec split s =
-		try let i = String.index s '\000' in
-		String.sub s 0 i :: split (String.sub s (i + 1) (String.length s - 1 - i))
-		with Not_found -> if s = "" then [] else [ s ] in
-	let l = List.map perm_of_string (split s) in
-	match l with h :: l -> (fst h, snd h, l) | [] -> (0, PERM_NONE, [])
+  let perm_of_char c =
+    match c with 'n' -> PERM_NONE | 'r' -> PERM_READ
+                                  | 'w' -> PERM_WRITE | 'b' -> PERM_RDWR
+                                  | c -> invalid_arg (Printf.sprintf "unknown permission type: %c" c) in
+  let perm_of_string s =
+    if String.length s < 2
+    then invalid_arg (Printf.sprintf "perm of string: length = %d; contents=\"%s\"" (String.length s) s)
+    else
+      begin
+        int_of_string (String.sub s 1 (String.length s - 1)),
+        perm_of_char s.[0]
+      end in
+  let rec split s =
+    try let i = String.index s '\000' in
+      String.sub s 0 i :: split (String.sub s (i + 1) (String.length s - 1 - i))
+    with Not_found -> if s = "" then [] else [ s ] in
+  let l = List.map perm_of_string (split s) in
+  match l with h :: l -> (fst h, snd h, l) | [] -> (0, PERM_NONE, [])
 
 (* send one packet - can sleep *)
 let pkt_send con =
-	if Xb.has_old_output con.xb then
-		raise Partial_not_empty;
-	let workdone = ref false in
-	while not !workdone
-	do
-		workdone := Xb.output con.xb
-	done
+  if Xb.has_old_output con.xb then
+    raise Partial_not_empty;
+  let workdone = ref false in
+  while not !workdone
+  do
+    workdone := Xb.output con.xb
+  done
 
 (* receive one packet - can sleep *)
 let rec pkt_recv con =
-	match Xb.input con.xb with
-	| Some packet -> packet
-	| None -> pkt_recv con
+  match Xb.input con.xb with
+  | Some packet -> packet
+  | None -> pkt_recv con
 
 let pkt_recv_timeout con timeout =
-	let fd = Xb.get_fd con.xb in
-	let r, _, _ = Unix.select [ fd ] [] [] timeout in
-	if r = [] then
-		true, None
-	else
-		false, Xb.input con.xb
+  let fd = Xb.get_fd con.xb in
+  let r, _, _ = Unix.select [ fd ] [] [] timeout in
+  if r = [] then
+    true, None
+  else
+    false, Xb.input con.xb
 
 let queue_watchevent con data =
-	let ls = split_string ~limit:2 '\000' data in
-	if List.length ls != 2 then
-		raise (Xb.Packet.DataError "arguments number mismatch");
-	let event = List.nth ls 0
-	and event_data = List.nth ls 1 in
-	Queue.push (event, event_data) con.watchevents
+  let ls = split_string ~limit:2 '\000' data in
+  if List.length ls != 2 then
+    raise (Xb.Packet.DataError "arguments number mismatch");
+  let event = List.nth ls 0
+  and event_data = List.nth ls 1 in
+  Queue.push (event, event_data) con.watchevents
 
 let has_watchevents con = Queue.length con.watchevents > 0
 let get_watchevent con = Queue.pop con.watchevents
 
 let read_watchevent con =
-	let pkt = pkt_recv con in
-	match Xb.Packet.get_ty pkt with
-	| Xb.Op.Watchevent ->
-		queue_watchevent con (Xb.Packet.get_data pkt);
-		Queue.pop con.watchevents
-	| ty               -> unexpected_packet Xb.Op.Watchevent ty
+  let pkt = pkt_recv con in
+  match Xb.Packet.get_ty pkt with
+  | Xb.Op.Watchevent ->
+    queue_watchevent con (Xb.Packet.get_data pkt);
+    Queue.pop con.watchevents
+  | ty               -> unexpected_packet Xb.Op.Watchevent ty
 
 (* send one packet in the queue, and wait for reply *)
 let rec sync_recv ty con =
-	let pkt = pkt_recv con in
-	match Xb.Packet.get_ty pkt with
-	| Xb.Op.Error       -> (
-		match Xb.Packet.get_data pkt with
-		| "ENOENT" -> raise Xb.Noent
-		| "EAGAIN" -> raise Xb.Eagain
-		| "EINVAL" -> raise Xb.Invalid
-		| s        -> raise (Xb.Packet.Error s))
-	| Xb.Op.Watchevent  ->
-		queue_watchevent con (Xb.Packet.get_data pkt);
-		sync_recv ty con
-	| rty when rty = ty -> Xb.Packet.get_data pkt
-	| rty               -> unexpected_packet ty rty
+  let pkt = pkt_recv con in
+  match Xb.Packet.get_ty pkt with
+  | Xb.Op.Error       -> (
+      match Xb.Packet.get_data pkt with
+      | "ENOENT" -> raise Xb.Noent
+      | "EAGAIN" -> raise Xb.Eagain
+      | "EINVAL" -> raise Xb.Invalid
+      | s        -> raise (Xb.Packet.Error s))
+  | Xb.Op.Watchevent  ->
+    queue_watchevent con (Xb.Packet.get_data pkt);
+    sync_recv ty con
+  | rty when rty = ty -> Xb.Packet.get_data pkt
+  | rty               -> unexpected_packet ty rty
 
 let sync f con =
-	(* queue a query using function f *)
-	f con.xb;
-	if Xb.output_len con.xb = 0 then
-		Printf.printf "output len = 0\n%!";
-	let ty = Xb.Packet.get_ty (Xb.peek_output con.xb) in
-	pkt_send con;
-	sync_recv ty con
+  (* queue a query using function f *)
+  f con.xb;
+  if Xb.output_len con.xb = 0 then
+    Printf.printf "output len = 0\n%!";
+  let ty = Xb.Packet.get_ty (Xb.peek_output con.xb) in
+  pkt_send con;
+  sync_recv ty con
 
 let ack s =
-	if s = "OK" then () else raise (Xb.Packet.DataError s)
+  if s = "OK" then () else raise (Xb.Packet.DataError s)
 
 (** Check paths are suitable for read/write/mkdir/rm/directory etc (NOT watches) *)
 let validate_path path =
-	(* Paths shouldn't have a "//" in the middle *)
-	let bad = "//" in
-	for offset = 0 to String.length path - (String.length bad) do
-		if String.sub path offset (String.length bad) = bad then
-			raise (Invalid_path path)
-	done;
-	(* Paths shouldn't have a "/" at the end, except for the root *)
-	if path <> "/" && path <> "" && path.[String.length path - 1] = '/' then
-		raise (Invalid_path path)
+  (* Paths shouldn't have a "//" in the middle *)
+  let bad = "//" in
+  for offset = 0 to String.length path - (String.length bad) do
+    if String.sub path offset (String.length bad) = bad then
+      raise (Invalid_path path)
+  done;
+  (* Paths shouldn't have a "/" at the end, except for the root *)
+  if path <> "/" && path <> "" && path.[String.length path - 1] = '/' then
+    raise (Invalid_path path)
 
 (** Check to see if a path is suitable for watches *)
 let validate_watch_path path =
-	(* Check for stuff like @releaseDomain etc first *)
-	if path <> "" && path.[0] = '@' then ()
-	else validate_path path
+  (* Check for stuff like @releaseDomain etc first *)
+  if path <> "" && path.[0] = '@' then ()
+  else validate_path path
 
 let debug command con =
-	sync (Queueop.debug command) con
+  sync (Queueop.debug command) con
 
 let directory tid path con =
-	validate_path path;
-	let data = sync (Queueop.directory tid path) con in
-	split_string '\000' data
+  validate_path path;
+  let data = sync (Queueop.directory tid path) con in
+  split_string '\000' data
 
 let read tid path con =
-	validate_path path;
-	sync (Queueop.read tid path) con
+  validate_path path;
+  sync (Queueop.read tid path) con
 
 let readv tid dir vec con =
-	List.map (fun path -> validate_path path; read tid path con)
-		(if dir <> "" then
-			(List.map (fun v -> dir ^ "/" ^ v) vec) else vec)
+  List.map (fun path -> validate_path path; read tid path con)
+    (if dir <> "" then
+       (List.map (fun v -> dir ^ "/" ^ v) vec) else vec)
 
 let getperms tid path con =
-	validate_path path;
-	perms_of_string (sync (Queueop.getperms tid path) con)
+  validate_path path;
+  perms_of_string (sync (Queueop.getperms tid path) con)
 
 let watch path data con =
-	validate_watch_path path;
-	ack (sync (Queueop.watch path data) con)
+  validate_watch_path path;
+  ack (sync (Queueop.watch path data) con)
 
 let unwatch path data con =
-	validate_watch_path path;
-	ack (sync (Queueop.unwatch path data) con)
+  validate_watch_path path;
+  ack (sync (Queueop.unwatch path data) con)
 
 let transaction_start con =
-	let data = sync (Queueop.transaction_start) con in
-	try
-		int_of_string data
-	with
-		_ -> raise (Packet.DataError (Printf.sprintf "int expected; got '%s'" data))
+  let data = sync (Queueop.transaction_start) con in
+  try
+    int_of_string data
+  with
+    _ -> raise (Packet.DataError (Printf.sprintf "int expected; got '%s'" data))
 
 let transaction_end tid commit con =
-	try
-		ack (sync (Queueop.transaction_end tid commit) con);
-		true
-	with
-		Xb.Eagain -> false
+  try
+    ack (sync (Queueop.transaction_end tid commit) con);
+    true
+  with
+    Xb.Eagain -> false
 
 let introduce domid mfn port con =
-	ack (sync (Queueop.introduce domid mfn port) con)
+  ack (sync (Queueop.introduce domid mfn port) con)
 
 let release domid con =
-	ack (sync (Queueop.release domid) con)
+  ack (sync (Queueop.release domid) con)
 
 let resume domid con =
-	ack (sync (Queueop.resume domid) con)
+  ack (sync (Queueop.resume domid) con)
 
 let getdomainpath domid con =
-	sync (Queueop.getdomainpath domid) con
+  sync (Queueop.getdomainpath domid) con
 
 let write tid path value con =
-	validate_path path;
-	ack (sync (Queueop.write tid path value) con)
+  validate_path path;
+  ack (sync (Queueop.write tid path value) con)
 
 let writev tid dir vec con =
-	List.iter (fun (entry, value) ->
-		let path = (if dir <> "" then dir ^ "/" ^ entry else entry) in
-                validate_path path;
-		write tid path value con) vec
+  List.iter (fun (entry, value) ->
+      let path = (if dir <> "" then dir ^ "/" ^ entry else entry) in
+      validate_path path;
+      write tid path value con) vec
 
 let mkdir tid path con =
-	validate_path path;
-	ack (sync (Queueop.mkdir tid path) con)
+  validate_path path;
+  ack (sync (Queueop.mkdir tid path) con)
 
 let rm tid path con =
-        validate_path path;
-	try
-		ack (sync (Queueop.rm tid path) con)
-	with
-		Xb.Noent -> ()
+  validate_path path;
+  try
+    ack (sync (Queueop.rm tid path) con)
+  with
+    Xb.Noent -> ()
 
 let setperms tid path perms con =
-	validate_path path;
-	ack (sync (Queueop.setperms tid path (string_of_perms perms)) con)
+  validate_path path;
+  ack (sync (Queueop.setperms tid path (string_of_perms perms)) con)
 
 let setpermsv tid dir vec perms con =
-	List.iter (fun entry ->
-		let path = (if dir <> "" then dir ^ "/" ^ entry else entry) in
-		validate_path path;
-		setperms tid path perms con) vec
+  List.iter (fun entry ->
+      let path = (if dir <> "" then dir ^ "/" ^ entry else entry) in
+      validate_path path;
+      setperms tid path perms con) vec
diff --git a/tools/ocaml/libs/xs/xst.ml b/tools/ocaml/libs/xs/xst.ml
index 16affd2e07..50a980b915 100644
--- a/tools/ocaml/libs/xs/xst.ml
+++ b/tools/ocaml/libs/xs/xst.ml
@@ -15,47 +15,47 @@
  *)
 
 type ops =
-{
-	directory: string -> string list;
-	read: string -> string;
-	readv: string -> string list -> string list;
-	write: string -> string -> unit;
-	writev: string -> (string * string) list -> unit;
-	mkdir: string -> unit;
-	rm: string -> unit;
-	getperms: string -> Xsraw.perms;
-	setperms: string -> Xsraw.perms -> unit;
-	setpermsv: string -> string list -> Xsraw.perms -> unit;
-}
+  {
+    directory: string -> string list;
+    read: string -> string;
+    readv: string -> string list -> string list;
+    write: string -> string -> unit;
+    writev: string -> (string * string) list -> unit;
+    mkdir: string -> unit;
+    rm: string -> unit;
+    getperms: string -> Xsraw.perms;
+    setperms: string -> Xsraw.perms -> unit;
+    setpermsv: string -> string list -> Xsraw.perms -> unit;
+  }
 
 let get_operations tid xsh = {
-	directory = (fun path -> Xsraw.directory tid path xsh);
-	read = (fun path -> Xsraw.read tid path xsh);
-	readv = (fun dir vec -> Xsraw.readv tid dir vec xsh);
-	write = (fun path value -> Xsraw.write tid path value xsh);
-	writev = (fun dir vec -> Xsraw.writev tid dir vec xsh);
-	mkdir = (fun path -> Xsraw.mkdir tid path xsh);
-	rm = (fun path -> Xsraw.rm tid path xsh);
-	getperms = (fun path -> Xsraw.getperms tid path xsh);
-	setperms = (fun path perms -> Xsraw.setperms tid path perms xsh);
-	setpermsv = (fun dir vec perms -> Xsraw.setpermsv tid dir vec perms xsh);
+  directory = (fun path -> Xsraw.directory tid path xsh);
+  read = (fun path -> Xsraw.read tid path xsh);
+  readv = (fun dir vec -> Xsraw.readv tid dir vec xsh);
+  write = (fun path value -> Xsraw.write tid path value xsh);
+  writev = (fun dir vec -> Xsraw.writev tid dir vec xsh);
+  mkdir = (fun path -> Xsraw.mkdir tid path xsh);
+  rm = (fun path -> Xsraw.rm tid path xsh);
+  getperms = (fun path -> Xsraw.getperms tid path xsh);
+  setperms = (fun path perms -> Xsraw.setperms tid path perms xsh);
+  setpermsv = (fun dir vec perms -> Xsraw.setpermsv tid dir vec perms xsh);
 }
 
 let transaction xsh (f: ops -> 'a) : 'a =
-	let commited = ref false and result = ref None in
-	while not !commited
-	do
-		let tid = Xsraw.transaction_start xsh in
-		let t = get_operations tid xsh in
+  let commited = ref false and result = ref None in
+  while not !commited
+  do
+    let tid = Xsraw.transaction_start xsh in
+    let t = get_operations tid xsh in
 
-		begin try
-			result := Some (f t)
-		with exn ->
-			ignore (Xsraw.transaction_end tid false xsh);
-			raise exn
-		end;
-		commited := Xsraw.transaction_end tid true xsh
-	done;
-	match !result with
-	| None        -> failwith "internal error in transaction"
-	| Some result -> result
+    begin try
+        result := Some (f t)
+      with exn ->
+        ignore (Xsraw.transaction_end tid false xsh);
+        raise exn
+    end;
+    commited := Xsraw.transaction_end tid true xsh
+  done;
+  match !result with
+  | None        -> failwith "internal error in transaction"
+  | Some result -> result
diff --git a/tools/ocaml/libs/xs/xst.mli b/tools/ocaml/libs/xs/xst.mli
index 5ae560424c..08d737bc36 100644
--- a/tools/ocaml/libs/xs/xst.mli
+++ b/tools/ocaml/libs/xs/xst.mli
@@ -14,16 +14,16 @@
  * GNU Lesser General Public License for more details.
  *)
 type ops = {
-	directory : string -> string list;
-	read : string -> string;
-	readv : string -> string list -> string list;
-	write : string -> string -> unit;
-	writev : string -> (string * string) list -> unit;
-	mkdir : string -> unit;
-	rm : string -> unit;
-	getperms : string -> Xsraw.perms;
-	setperms : string -> Xsraw.perms -> unit;
-	setpermsv : string -> string list -> Xsraw.perms -> unit;
+  directory : string -> string list;
+  read : string -> string;
+  readv : string -> string list -> string list;
+  write : string -> string -> unit;
+  writev : string -> (string * string) list -> unit;
+  mkdir : string -> unit;
+  rm : string -> unit;
+  getperms : string -> Xsraw.perms;
+  setperms : string -> Xsraw.perms -> unit;
+  setpermsv : string -> string list -> Xsraw.perms -> unit;
 }
 
 val get_operations : int -> Xsraw.con -> ops
diff --git a/tools/ocaml/test/dmesg.ml b/tools/ocaml/test/dmesg.ml
index c868024c52..f9efe5dc30 100644
--- a/tools/ocaml/test/dmesg.ml
+++ b/tools/ocaml/test/dmesg.ml
@@ -1,17 +1,17 @@
 
 let _ =
-	Xenlight.register_exceptions ();
-	let logger = Xtl.create_stdio_logger ~level:Xentoollog.Debug () in
-	let ctx = Xenlight.ctx_alloc logger in
+  Xenlight.register_exceptions ();
+  let logger = Xtl.create_stdio_logger ~level:Xentoollog.Debug () in
+  let ctx = Xenlight.ctx_alloc logger in
 
-	let open Xenlight.Host in
-	let reader = xen_console_read_start ctx 0 in
-	(try
-		while true do
-			let line = xen_console_read_line ctx reader in
-			print_string line
-		done
-	with End_of_file -> ());
-	let _ = xen_console_read_finish ctx reader in
-	()
+  let open Xenlight.Host in
+  let reader = xen_console_read_start ctx 0 in
+  (try
+     while true do
+       let line = xen_console_read_line ctx reader in
+       print_string line
+     done
+   with End_of_file -> ());
+  let _ = xen_console_read_finish ctx reader in
+  ()
 
diff --git a/tools/ocaml/test/list_domains.ml b/tools/ocaml/test/list_domains.ml
index c8974957fd..94f1cec050 100644
--- a/tools/ocaml/test/list_domains.ml
+++ b/tools/ocaml/test/list_domains.ml
@@ -20,7 +20,7 @@ let _ =
     let domains = Xenlight.Dominfo.list ctx in
     List.iter (fun d -> print_dominfo d) domains
   with Xenlight.Error(err, fn) -> begin
-    printf "Caught Exception: %s: %s\n" (Xenlight.string_of_error err) fn;
-  end
+      printf "Caught Exception: %s: %s\n" (Xenlight.string_of_error err) fn;
+    end
 
 
diff --git a/tools/ocaml/test/raise_exception.ml b/tools/ocaml/test/raise_exception.ml
index 5ef7fc0f13..8c24c3555b 100644
--- a/tools/ocaml/test/raise_exception.ml
+++ b/tools/ocaml/test/raise_exception.ml
@@ -4,6 +4,6 @@ let _ =
   try
     Xenlight.test_raise_exception ()
   with Xenlight.Error(err, fn) -> begin
-    printf "Caught Exception: %s: %s\n" (Xenlight.string_of_error err) fn;
-  end
+      printf "Caught Exception: %s: %s\n" (Xenlight.string_of_error err) fn;
+    end
 
diff --git a/tools/ocaml/test/xtl.ml b/tools/ocaml/test/xtl.ml
index 5f94a76a82..458b11bbaa 100644
--- a/tools/ocaml/test/xtl.ml
+++ b/tools/ocaml/test/xtl.ml
@@ -2,24 +2,24 @@ open Printf
 open Xentoollog
 
 let stdio_vmessage min_level level errno ctx msg =
-	let level_str = level_to_string level
-	and errno_str = match errno with None -> "" | Some s -> sprintf ": errno=%d" s
-	and ctx_str = match ctx with None -> "" | Some s -> sprintf ": %s" s in
-	if compare min_level level <= 0 then begin
-		printf "%s%s%s: %s\n" level_str ctx_str errno_str msg;
-		flush stdout;
-	end
+  let level_str = level_to_string level
+  and errno_str = match errno with None -> "" | Some s -> sprintf ": errno=%d" s
+  and ctx_str = match ctx with None -> "" | Some s -> sprintf ": %s" s in
+  if compare min_level level <= 0 then begin
+    printf "%s%s%s: %s\n" level_str ctx_str errno_str msg;
+    flush stdout;
+  end
 
 let stdio_progress _ctx what percent dne total =
-	let nl = if dne = total then "\n" else "" in
-	printf "\rProgress %s %d%% (%Ld/%Ld)%s" what percent dne total nl;
-	flush stdout
+  let nl = if dne = total then "\n" else "" in
+  printf "\rProgress %s %d%% (%Ld/%Ld)%s" what percent dne total nl;
+  flush stdout
 
 let create_stdio_logger ?(level=Info) () =
-	let cbs = {
-		vmessage = stdio_vmessage level;
-		progress = stdio_progress; } in
-	create "Xentoollog.stdio_logger" cbs
+  let cbs = {
+    vmessage = stdio_vmessage level;
+    progress = stdio_progress; } in
+  create "Xentoollog.stdio_logger" cbs
 
 let do_test level =
   let lgr = create_stdio_logger ~level:level () in
diff --git a/tools/ocaml/xenstored/config.ml b/tools/ocaml/xenstored/config.ml
index 0ee7bc32ff..95ef745a54 100644
--- a/tools/ocaml/xenstored/config.ml
+++ b/tools/ocaml/xenstored/config.ml
@@ -15,98 +15,98 @@
  *)
 
 type ty =
-	| Set_bool of bool ref
-	| Set_int of int ref
-	| Set_string of string ref
-	| Set_float of float ref
-	| Unit of (unit -> unit)
-	| Bool of (bool -> unit)
-	| Int of (int -> unit)
-	| String of (string -> unit)
-	| Float of (float -> unit)
+  | Set_bool of bool ref
+  | Set_int of int ref
+  | Set_string of string ref
+  | Set_float of float ref
+  | Unit of (unit -> unit)
+  | Bool of (bool -> unit)
+  | Int of (int -> unit)
+  | String of (string -> unit)
+  | Float of (float -> unit)
 
 exception Error of (string * string) list
 
 let trim_start lc s =
-	let len = String.length s and i = ref 0 in
-	while !i < len && (List.mem s.[!i] lc)
-	do
-		incr i
-	done;
-	if !i < len then String.sub s !i (len - !i) else ""
+  let len = String.length s and i = ref 0 in
+  while !i < len && (List.mem s.[!i] lc)
+  do
+    incr i
+  done;
+  if !i < len then String.sub s !i (len - !i) else ""
 
 let trim_end lc s =
-	let i = ref (String.length s - 1) in
-	while !i > 0 && (List.mem s.[!i] lc)
-	do
-		decr i
-	done;
-	if !i >= 0 then String.sub s 0 (!i + 1) else ""
+  let i = ref (String.length s - 1) in
+  while !i > 0 && (List.mem s.[!i] lc)
+  do
+    decr i
+  done;
+  if !i >= 0 then String.sub s 0 (!i + 1) else ""
 
 let rec split ?limit:(limit=(-1)) c s =
-	let i = try String.index s c with Not_found -> -1 in
-	let nlimit = if limit = -1 || limit = 0 then limit else limit - 1 in
-	if i = -1 || nlimit = 0 then
-		[ s ]
-	else
-		let a = String.sub s 0 i
-		and b = String.sub s (i + 1) (String.length s - i - 1) in
-		a :: (split ~limit: nlimit c b)
+  let i = try String.index s c with Not_found -> -1 in
+  let nlimit = if limit = -1 || limit = 0 then limit else limit - 1 in
+  if i = -1 || nlimit = 0 then
+    [ s ]
+  else
+    let a = String.sub s 0 i
+    and b = String.sub s (i + 1) (String.length s - i - 1) in
+    a :: (split ~limit: nlimit c b)
 
 let parse_line stream =
-	let lc = [ ' '; '\t' ] in
-	let trim_spaces s = trim_end lc (trim_start lc s) in
-	let to_config s =
-		match split ~limit:2 '=' s with
-		| k :: v :: [] -> Some (trim_end lc k, trim_start lc v)
-		| _            -> None in
-	let rec read_filter_line () =
-		try
-			let line = trim_spaces (input_line stream) in
-			if String.length line > 0 && line.[0] <> '#' then
-				match to_config line with
-				| None   -> read_filter_line ()
-				| Some x -> x :: read_filter_line ()
-			else
-				read_filter_line ()
-		with
-			End_of_file -> [] in
-	read_filter_line ()
+  let lc = [ ' '; '\t' ] in
+  let trim_spaces s = trim_end lc (trim_start lc s) in
+  let to_config s =
+    match split ~limit:2 '=' s with
+    | k :: v :: [] -> Some (trim_end lc k, trim_start lc v)
+    | _            -> None in
+  let rec read_filter_line () =
+    try
+      let line = trim_spaces (input_line stream) in
+      if String.length line > 0 && line.[0] <> '#' then
+        match to_config line with
+        | None   -> read_filter_line ()
+        | Some x -> x :: read_filter_line ()
+      else
+        read_filter_line ()
+    with
+      End_of_file -> [] in
+  read_filter_line ()
 
 let parse filename =
-	let stream = open_in filename in
-	let cf = parse_line stream in
-	close_in stream;
-	cf
+  let stream = open_in filename in
+  let cf = parse_line stream in
+  close_in stream;
+  cf
 
 let validate cf expected other =
-	let err = ref [] in
-	let append x = err := x :: !err in
-	List.iter (fun (k, v) ->
-		try
-			if not (List.mem_assoc k expected) then
-				other k v
-			else let ty = List.assoc k expected in
-			match ty with
-			| Unit f       -> f ()
-			| Bool f       -> f (bool_of_string v)
-			| String f     -> f v
-			| Int f        -> f (int_of_string v)
-			| Float f      -> f (float_of_string v)
-			| Set_bool r   -> r := (bool_of_string v)
-			| Set_string r -> r := v
-			| Set_int r    -> r := int_of_string v
-			| Set_float r  -> r := (float_of_string v)
-		with
-		| Not_found                 -> append (k, "unknown key")
-		| Failure "int_of_string"   -> append (k, "expect int arg")
-		| Failure "bool_of_string"  -> append (k, "expect bool arg")
-		| Failure "float_of_string" -> append (k, "expect float arg")
-		| exn                       -> append (k, Printexc.to_string exn)
-		) cf;
-	if !err != [] then raise (Error !err)
+  let err = ref [] in
+  let append x = err := x :: !err in
+  List.iter (fun (k, v) ->
+      try
+        if not (List.mem_assoc k expected) then
+          other k v
+        else let ty = List.assoc k expected in
+          match ty with
+          | Unit f       -> f ()
+          | Bool f       -> f (bool_of_string v)
+          | String f     -> f v
+          | Int f        -> f (int_of_string v)
+          | Float f      -> f (float_of_string v)
+          | Set_bool r   -> r := (bool_of_string v)
+          | Set_string r -> r := v
+          | Set_int r    -> r := int_of_string v
+          | Set_float r  -> r := (float_of_string v)
+      with
+      | Not_found                 -> append (k, "unknown key")
+      | Failure "int_of_string"   -> append (k, "expect int arg")
+      | Failure "bool_of_string"  -> append (k, "expect bool arg")
+      | Failure "float_of_string" -> append (k, "expect float arg")
+      | exn                       -> append (k, Printexc.to_string exn)
+    ) cf;
+  if !err != [] then raise (Error !err)
 
 (** read a filename, parse and validate, and return the errors if any *)
 let read filename expected other =
-	let cf = parse filename in
-	validate cf expected other
+  let cf = parse filename in
+  validate cf expected other
diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/connection.ml
index 54f7f76516..d11011e164 100644
--- a/tools/ocaml/xenstored/connection.ml
+++ b/tools/ocaml/xenstored/connection.ml
@@ -24,281 +24,281 @@ type 'a bounded_sender = 'a -> unit option
 (** a bounded sender accepts an ['a] item and returns:
     None - if there is no room to accept the item
     Some () -  if it has successfully accepted/sent the item
- *)
+*)
 
 module BoundedPipe : sig
-	type 'a t
+  type 'a t
 
-	(** [create ~capacity ~destination] creates a bounded pipe with a
-	    local buffer holding at most [capacity] items.  Once the buffer is
-	    full it will not accept further items.  items from the pipe are
-	    flushed into [destination] as long as it accepts items.  The
-	    destination could be another pipe.
-	 *)
-	val create: capacity:int -> destination:'a bounded_sender -> 'a t
+  (** [create ~capacity ~destination] creates a bounded pipe with a
+      	    local buffer holding at most [capacity] items.  Once the buffer is
+      	    full it will not accept further items.  items from the pipe are
+      	    flushed into [destination] as long as it accepts items.  The
+      	    destination could be another pipe.
+      	 *)
+  val create: capacity:int -> destination:'a bounded_sender -> 'a t
 
-	(** [is_empty t] returns whether the local buffer of [t] is empty. *)
-	val is_empty : _ t -> bool
+  (** [is_empty t] returns whether the local buffer of [t] is empty. *)
+  val is_empty : _ t -> bool
 
-	(** [length t] the number of items in the internal buffer *)
-	val length: _ t -> int
+  (** [length t] the number of items in the internal buffer *)
+  val length: _ t -> int
 
-	(** [flush_pipe t] sends as many items from the local buffer as possible,
-			which could be none. *)
-	val flush_pipe: _ t -> unit
+  (** [flush_pipe t] sends as many items from the local buffer as possible,
+      			which could be none. *)
+  val flush_pipe: _ t -> unit
 
-	(** [push t item] tries to [flush_pipe] and then push [item]
-	    into the pipe if its [capacity] allows.
-	    Returns [None] if there is no more room
-	 *)
-	val push : 'a t -> 'a bounded_sender
+  (** [push t item] tries to [flush_pipe] and then push [item]
+      	    into the pipe if its [capacity] allows.
+      	    Returns [None] if there is no more room
+      	 *)
+  val push : 'a t -> 'a bounded_sender
 end = struct
-	(* items are enqueued in [q], and then flushed to [connect_to] *)
-	type 'a t =
-		{ q: 'a Queue.t
-		; destination: 'a bounded_sender
-		; capacity: int
-		}
+  (* items are enqueued in [q], and then flushed to [connect_to] *)
+  type 'a t =
+    { q: 'a Queue.t
+    ; destination: 'a bounded_sender
+    ; capacity: int
+    }
 
-	let create ~capacity ~destination =
-		{ q = Queue.create (); capacity; destination }
+  let create ~capacity ~destination =
+    { q = Queue.create (); capacity; destination }
 
-	let rec flush_pipe t =
-		if not Queue.(is_empty t.q) then
-			let item = Queue.peek t.q in
-			match t.destination item with
-			| None -> () (* no room *)
-			| Some () ->
-				(* successfully sent item to next stage *)
-				let _ = Queue.pop t.q in
-				(* continue trying to send more items *)
-				flush_pipe t
+  let rec flush_pipe t =
+    if not Queue.(is_empty t.q) then
+      let item = Queue.peek t.q in
+      match t.destination item with
+      | None -> () (* no room *)
+      | Some () ->
+        (* successfully sent item to next stage *)
+        let _ = Queue.pop t.q in
+        (* continue trying to send more items *)
+        flush_pipe t
 
-	let push t item =
-		(* first try to flush as many items from this pipe as possible to make room,
-		   it is important to do this first to preserve the order of the items
-		 *)
-		flush_pipe t;
-		if Queue.length t.q < t.capacity then begin
-			(* enqueue, instead of sending directly.
-			   this ensures that [out] sees the items in the same order as we receive them
-			 *)
-			Queue.push item t.q;
-			Some (flush_pipe t)
-		end else None
+  let push t item =
+    (* first try to flush as many items from this pipe as possible to make room,
+       		   it is important to do this first to preserve the order of the items
+       		 *)
+    flush_pipe t;
+    if Queue.length t.q < t.capacity then begin
+      (* enqueue, instead of sending directly.
+         			   this ensures that [out] sees the items in the same order as we receive them
+         			 *)
+      Queue.push item t.q;
+      Some (flush_pipe t)
+    end else None
 
-	let is_empty t = Queue.is_empty t.q
-	let length t = Queue.length t.q
+  let is_empty t = Queue.is_empty t.q
+  let length t = Queue.length t.q
 end
 
 type watch = {
-	con: t;
-	token: string;
-	path: string;
-	base: string;
-	is_relative: bool;
-	pending_watchevents: Xenbus.Xb.Packet.t BoundedPipe.t;
+  con: t;
+  token: string;
+  path: string;
+  base: string;
+  is_relative: bool;
+  pending_watchevents: Xenbus.Xb.Packet.t BoundedPipe.t;
 }
 
 and t = {
-	xb: Xenbus.Xb.t;
-	dom: Domain.t option;
-	transactions: (int, Transaction.t) Hashtbl.t;
-	mutable next_tid: int;
-	watches: (string, watch list) Hashtbl.t;
-	mutable nb_watches: int;
-	anonid: int;
-	mutable stat_nb_ops: int;
-	mutable perm: Perms.Connection.t;
-	pending_source_watchevents: (watch * Xenbus.Xb.Packet.t) BoundedPipe.t
+  xb: Xenbus.Xb.t;
+  dom: Domain.t option;
+  transactions: (int, Transaction.t) Hashtbl.t;
+  mutable next_tid: int;
+  watches: (string, watch list) Hashtbl.t;
+  mutable nb_watches: int;
+  anonid: int;
+  mutable stat_nb_ops: int;
+  mutable perm: Perms.Connection.t;
+  pending_source_watchevents: (watch * Xenbus.Xb.Packet.t) BoundedPipe.t
 }
 
 module Watch = struct
-	module T = struct
-		type t = watch
+  module T = struct
+    type t = watch
 
-		let compare w1 w2 =
-			(* cannot compare watches from different connections *)
-			assert (w1.con == w2.con);
-			match String.compare w1.token w2.token with
-			| 0 -> String.compare w1.path w2.path
-			| n -> n
-	end
-	module Set = Set.Make(T)
+    let compare w1 w2 =
+      (* cannot compare watches from different connections *)
+      assert (w1.con == w2.con);
+      match String.compare w1.token w2.token with
+      | 0 -> String.compare w1.path w2.path
+      | n -> n
+  end
+  module Set = Set.Make(T)
 
-	let flush_events t =
-		BoundedPipe.flush_pipe t.pending_watchevents;
-		not (BoundedPipe.is_empty t.pending_watchevents)
+  let flush_events t =
+    BoundedPipe.flush_pipe t.pending_watchevents;
+    not (BoundedPipe.is_empty t.pending_watchevents)
 
-	let pending_watchevents t =
-		BoundedPipe.length t.pending_watchevents
+  let pending_watchevents t =
+    BoundedPipe.length t.pending_watchevents
 end
 
 let source_flush_watchevents t =
-	BoundedPipe.flush_pipe t.pending_source_watchevents
+  BoundedPipe.flush_pipe t.pending_source_watchevents
 
 let source_pending_watchevents t =
-	BoundedPipe.length t.pending_source_watchevents
+  BoundedPipe.length t.pending_source_watchevents
 
 let mark_as_bad con =
-	match con.dom with
-	|None -> ()
-	| Some domain -> Domain.mark_as_bad domain
+  match con.dom with
+  |None -> ()
+  | Some domain -> Domain.mark_as_bad domain
 
 let initial_next_tid = 1
 
 let do_reconnect con =
-	Xenbus.Xb.reconnect con.xb;
-	(* dom is the same *)
-	Hashtbl.clear con.transactions;
-	con.next_tid <- initial_next_tid;
-	Hashtbl.clear con.watches;
-	(* anonid is the same *)
-	con.nb_watches <- 0;
-	con.stat_nb_ops <- 0;
-	(* perm is the same *)
-	()
+  Xenbus.Xb.reconnect con.xb;
+  (* dom is the same *)
+  Hashtbl.clear con.transactions;
+  con.next_tid <- initial_next_tid;
+  Hashtbl.clear con.watches;
+  (* anonid is the same *)
+  con.nb_watches <- 0;
+  con.stat_nb_ops <- 0;
+  (* perm is the same *)
+  ()
 
 let get_path con =
-Printf.sprintf "/local/domain/%i/" (match con.dom with None -> 0 | Some d -> Domain.get_id d)
+  Printf.sprintf "/local/domain/%i/" (match con.dom with None -> 0 | Some d -> Domain.get_id d)
 
 let watch_create ~con ~path ~token = {
-	con = con;
-	token = token;
-	path = path;
-	base = get_path con;
-	is_relative = path.[0] <> '/' && path.[0] <> '@';
-	pending_watchevents = BoundedPipe.create ~capacity:!Define.maxwatchevents ~destination:(Xenbus.Xb.queue con.xb)
+  con = con;
+  token = token;
+  path = path;
+  base = get_path con;
+  is_relative = path.[0] <> '/' && path.[0] <> '@';
+  pending_watchevents = BoundedPipe.create ~capacity:!Define.maxwatchevents ~destination:(Xenbus.Xb.queue con.xb)
 }
 
 let get_con w = w.con
 
 let number_of_transactions con =
-	Hashtbl.length con.transactions
+  Hashtbl.length con.transactions
 
 let get_domain con = con.dom
 
 let anon_id_next = ref 1
 
 let get_domstr con =
-	match con.dom with
-	| None     -> "A" ^ (string_of_int con.anonid)
-	| Some dom -> "D" ^ (string_of_int (Domain.get_id dom))
+  match con.dom with
+  | None     -> "A" ^ (string_of_int con.anonid)
+  | Some dom -> "D" ^ (string_of_int (Domain.get_id dom))
 
 let make_perm dom =
-	let domid =
-		match dom with
-		| None   -> 0
-		| Some d -> Domain.get_id d
-	in
-	Perms.Connection.create ~perms:[Perms.READ; Perms.WRITE] domid
+  let domid =
+    match dom with
+    | None   -> 0
+    | Some d -> Domain.get_id d
+  in
+  Perms.Connection.create ~perms:[Perms.READ; Perms.WRITE] domid
 
 let create xbcon dom =
-	let destination (watch, pkt) =
-		BoundedPipe.push watch.pending_watchevents pkt
-	in
-	let id =
-		match dom with
-		| None -> let old = !anon_id_next in incr anon_id_next; old
-		| Some _ -> 0
-		in
-	let con =
-	{
-	xb = xbcon;
-	dom = dom;
-	transactions = Hashtbl.create 5;
-	next_tid = initial_next_tid;
-	watches = Hashtbl.create 8;
-	nb_watches = 0;
-	anonid = id;
-	stat_nb_ops = 0;
-	perm = make_perm dom;
+  let destination (watch, pkt) =
+    BoundedPipe.push watch.pending_watchevents pkt
+  in
+  let id =
+    match dom with
+    | None -> let old = !anon_id_next in incr anon_id_next; old
+    | Some _ -> 0
+  in
+  let con =
+    {
+      xb = xbcon;
+      dom = dom;
+      transactions = Hashtbl.create 5;
+      next_tid = initial_next_tid;
+      watches = Hashtbl.create 8;
+      nb_watches = 0;
+      anonid = id;
+      stat_nb_ops = 0;
+      perm = make_perm dom;
 
-	(* the actual capacity will be lower, this is used as an overflow
-	   buffer: anything that doesn't fit elsewhere gets put here, only
-	   limited by the amount of watches that you can generate with a
-	   single xenstore command (which is finite, although possibly very
-	   large in theory for Dom0).  Once the pipe here has any contents the
-	   domain is blocked from sending more commands until it is empty
-	   again though.
-	 *)
-	pending_source_watchevents = BoundedPipe.create ~capacity:Sys.max_array_length ~destination
-	}
-	in
-	Logging.new_connection ~tid:Transaction.none ~con:(get_domstr con);
-	con
+      (* the actual capacity will be lower, this is used as an overflow
+         	   buffer: anything that doesn't fit elsewhere gets put here, only
+         	   limited by the amount of watches that you can generate with a
+         	   single xenstore command (which is finite, although possibly very
+         	   large in theory for Dom0).  Once the pipe here has any contents the
+         	   domain is blocked from sending more commands until it is empty
+         	   again though.
+         	 *)
+      pending_source_watchevents = BoundedPipe.create ~capacity:Sys.max_array_length ~destination
+    }
+  in
+  Logging.new_connection ~tid:Transaction.none ~con:(get_domstr con);
+  con
 
 let get_fd con = Xenbus.Xb.get_fd con.xb
 let close con =
-	Logging.end_connection ~tid:Transaction.none ~con:(get_domstr con);
-	Xenbus.Xb.close con.xb
+  Logging.end_connection ~tid:Transaction.none ~con:(get_domstr con);
+  Xenbus.Xb.close con.xb
 
 let get_perm con =
-	con.perm
+  con.perm
 
 let set_target con target_domid =
-	con.perm <- Perms.Connection.set_target (get_perm con) ~perms:[Perms.READ; Perms.WRITE] target_domid
+  con.perm <- Perms.Connection.set_target (get_perm con) ~perms:[Perms.READ; Perms.WRITE] target_domid
 
 let is_backend_mmap con = Xenbus.Xb.is_mmap con.xb
 
 let packet_of con tid rid ty data =
-	if (String.length data) > xenstore_payload_max && (is_backend_mmap con) then
-		Xenbus.Xb.Packet.create tid rid Xenbus.Xb.Op.Error "E2BIG\000"
-	else
-		Xenbus.Xb.Packet.create tid rid ty data
+  if (String.length data) > xenstore_payload_max && (is_backend_mmap con) then
+    Xenbus.Xb.Packet.create tid rid Xenbus.Xb.Op.Error "E2BIG\000"
+  else
+    Xenbus.Xb.Packet.create tid rid ty data
 
 let send_reply con tid rid ty data =
-	let result = Xenbus.Xb.queue con.xb (packet_of con tid rid ty data) in
-	(* should never happen: we only process an input packet when there is room for an output packet *)
-	(* and the limit for replies is different from the limit for watch events *)
-	assert (result <> None)
+  let result = Xenbus.Xb.queue con.xb (packet_of con tid rid ty data) in
+  (* should never happen: we only process an input packet when there is room for an output packet *)
+  (* and the limit for replies is different from the limit for watch events *)
+  assert (result <> None)
 
 let send_error con tid rid err = send_reply con tid rid Xenbus.Xb.Op.Error (err ^ "\000")
 let send_ack con tid rid ty = send_reply con tid rid ty "OK\000"
 
 let get_watch_path con path =
-	if path.[0] = '@' || path.[0] = '/' then
-		path
-	else
-		let rpath = get_path con in
-		rpath ^ path
+  if path.[0] = '@' || path.[0] = '/' then
+    path
+  else
+    let rpath = get_path con in
+    rpath ^ path
 
 let get_watches (con: t) path =
-	if Hashtbl.mem con.watches path
-	then Hashtbl.find con.watches path
-	else []
+  if Hashtbl.mem con.watches path
+  then Hashtbl.find con.watches path
+  else []
 
 let get_children_watches con path =
-	let path = path ^ "/" in
-	List.concat (Hashtbl.fold (fun p w l ->
-		if String.startswith path p then w :: l else l) con.watches [])
+  let path = path ^ "/" in
+  List.concat (Hashtbl.fold (fun p w l ->
+      if String.startswith path p then w :: l else l) con.watches [])
 
 let is_dom0 con =
-	Perms.Connection.is_dom0 (get_perm con)
+  Perms.Connection.is_dom0 (get_perm con)
 
 let add_watch con (path, apath) token =
-	if !Quota.activate && !Define.maxwatch > 0 &&
-	   not (is_dom0 con) && con.nb_watches > !Define.maxwatch then
-		raise Quota.Limit_reached;
-	let l = get_watches con apath in
-	if List.exists (fun w -> w.token = token) l then
-		raise Define.Already_exist;
-	let watch = watch_create ~con ~token ~path in
-	Hashtbl.replace con.watches apath (watch :: l);
-	con.nb_watches <- con.nb_watches + 1;
-	watch
+  if !Quota.activate && !Define.maxwatch > 0 &&
+     not (is_dom0 con) && con.nb_watches > !Define.maxwatch then
+    raise Quota.Limit_reached;
+  let l = get_watches con apath in
+  if List.exists (fun w -> w.token = token) l then
+    raise Define.Already_exist;
+  let watch = watch_create ~con ~token ~path in
+  Hashtbl.replace con.watches apath (watch :: l);
+  con.nb_watches <- con.nb_watches + 1;
+  watch
 
 let del_watch con path token =
-	let apath = get_watch_path con path in
-	let ws = Hashtbl.find con.watches apath in
-	let w = List.find (fun w -> w.token = token) ws in
-	let filtered = Utils.list_remove w ws in
-	if List.length filtered > 0 then
-		Hashtbl.replace con.watches apath filtered
-	else
-		Hashtbl.remove con.watches apath;
-	con.nb_watches <- con.nb_watches - 1;
-	apath, w
+  let apath = get_watch_path con path in
+  let ws = Hashtbl.find con.watches apath in
+  let w = List.find (fun w -> w.token = token) ws in
+  let filtered = Utils.list_remove w ws in
+  if List.length filtered > 0 then
+    Hashtbl.replace con.watches apath filtered
+  else
+    Hashtbl.remove con.watches apath;
+  con.nb_watches <- con.nb_watches - 1;
+  apath, w
 
 let del_watches con =
   Hashtbl.reset con.watches;
@@ -308,63 +308,63 @@ let del_transactions con =
   Hashtbl.reset con.transactions
 
 let list_watches con =
-	let ll = Hashtbl.fold
-		(fun _ watches acc -> List.map (fun watch -> watch.path, watch.token) watches :: acc)
-		con.watches [] in
-	List.concat ll
+  let ll = Hashtbl.fold
+      (fun _ watches acc -> List.map (fun watch -> watch.path, watch.token) watches :: acc)
+      con.watches [] in
+  List.concat ll
 
 let dbg fmt = Logging.debug "connection" fmt
 let info fmt = Logging.info "connection" fmt
 
 let lookup_watch_perm path = function
-| None -> []
-| Some root ->
-	try Store.Path.apply root path @@ fun parent name ->
-		Store.Node.get_perms parent ::
-		try [Store.Node.get_perms (Store.Node.find parent name)]
-		with Not_found -> []
-	with Define.Invalid_path | Not_found -> []
+  | None -> []
+  | Some root ->
+    try Store.Path.apply root path @@ fun parent name ->
+      Store.Node.get_perms parent ::
+      try [Store.Node.get_perms (Store.Node.find parent name)]
+      with Not_found -> []
+    with Define.Invalid_path | Not_found -> []
 
 let lookup_watch_perms oldroot root path =
-	lookup_watch_perm path oldroot @ lookup_watch_perm path (Some root)
+  lookup_watch_perm path oldroot @ lookup_watch_perm path (Some root)
 
 let fire_single_watch_unchecked source watch =
-	let data = Utils.join_by_null [watch.path; watch.token; ""] in
-	let pkt = packet_of watch.con Transaction.none 0 Xenbus.Xb.Op.Watchevent data in
+  let data = Utils.join_by_null [watch.path; watch.token; ""] in
+  let pkt = packet_of watch.con Transaction.none 0 Xenbus.Xb.Op.Watchevent data in
 
-	match BoundedPipe.push source.pending_source_watchevents (watch, pkt) with
-	| Some () -> () (* packet queued *)
-	| None ->
-			(* a well behaved Dom0 shouldn't be able to trigger this,
-			   if it happens it is likely a Dom0 bug causing runaway memory usage
-			 *)
-			failwith "watch event overflow, cannot happen"
+  match BoundedPipe.push source.pending_source_watchevents (watch, pkt) with
+  | Some () -> () (* packet queued *)
+  | None ->
+    (* a well behaved Dom0 shouldn't be able to trigger this,
+       			   if it happens it is likely a Dom0 bug causing runaway memory usage
+       			 *)
+    failwith "watch event overflow, cannot happen"
 
 let fire_single_watch source (oldroot, root) watch =
-	let abspath = get_watch_path watch.con watch.path |> Store.Path.of_string in
-	let perms = lookup_watch_perms oldroot root abspath in
-	if Perms.can_fire_watch watch.con.perm perms then
-		fire_single_watch_unchecked source watch
-	else
-		let perms = perms |> List.map (Perms.Node.to_string ~sep:" ") |> String.concat ", " in
-		let con = get_domstr watch.con in
-		Logging.watch_not_fired ~con perms (Store.Path.to_string abspath)
+  let abspath = get_watch_path watch.con watch.path |> Store.Path.of_string in
+  let perms = lookup_watch_perms oldroot root abspath in
+  if Perms.can_fire_watch watch.con.perm perms then
+    fire_single_watch_unchecked source watch
+  else
+    let perms = perms |> List.map (Perms.Node.to_string ~sep:" ") |> String.concat ", " in
+    let con = get_domstr watch.con in
+    Logging.watch_not_fired ~con perms (Store.Path.to_string abspath)
 
 let fire_watch source roots watch path =
-	let new_path =
-		if watch.is_relative && path.[0] = '/'
-		then begin
-			let n = String.length watch.base
-		 	and m = String.length path in
-			String.sub path n (m - n)
-		end else
-			path
-	in
-	fire_single_watch source roots { watch with path = new_path }
+  let new_path =
+    if watch.is_relative && path.[0] = '/'
+    then begin
+      let n = String.length watch.base
+      and m = String.length path in
+      String.sub path n (m - n)
+    end else
+      path
+  in
+  fire_single_watch source roots { watch with path = new_path }
 
 (* Search for a valid unused transaction id. *)
 let rec valid_transaction_id con proposed_id =
-	(*
+ (*
 	 * Clip proposed_id to the range [1, 0x3ffffffe]
 	 *
 	 * The chosen id must not trucate when written into the uint32_t tx_id
@@ -373,36 +373,36 @@ let rec valid_transaction_id con proposed_id =
 	 *
 	 * Oxenstored therefore supports only 1 billion open transactions.
 	 *)
-	let id = if proposed_id <= 0 || proposed_id >= 0x3fffffff then 1 else proposed_id in
+  let id = if proposed_id <= 0 || proposed_id >= 0x3fffffff then 1 else proposed_id in
 
-	if Hashtbl.mem con.transactions id then (
-		(* Outstanding transaction with this id.  Try the next. *)
-		valid_transaction_id con (id + 1)
-	) else
-		id
+  if Hashtbl.mem con.transactions id then (
+    (* Outstanding transaction with this id.  Try the next. *)
+    valid_transaction_id con (id + 1)
+  ) else
+    id
 
 let start_transaction con store =
-	if !Define.maxtransaction > 0 && not (is_dom0 con)
-	&& Hashtbl.length con.transactions > !Define.maxtransaction then
-		raise Quota.Transaction_opened;
-	let id = valid_transaction_id con con.next_tid in
-	con.next_tid <- id + 1;
-	let ntrans = Transaction.make id store in
-	Hashtbl.add con.transactions id ntrans;
-	Logging.start_transaction ~tid:id ~con:(get_domstr con);
-	id
+  if !Define.maxtransaction > 0 && not (is_dom0 con)
+     && Hashtbl.length con.transactions > !Define.maxtransaction then
+    raise Quota.Transaction_opened;
+  let id = valid_transaction_id con con.next_tid in
+  con.next_tid <- id + 1;
+  let ntrans = Transaction.make id store in
+  Hashtbl.add con.transactions id ntrans;
+  Logging.start_transaction ~tid:id ~con:(get_domstr con);
+  id
 
 let end_transaction con tid commit =
-	let trans = Hashtbl.find con.transactions tid in
-	Hashtbl.remove con.transactions tid;
-	Logging.end_transaction ~tid ~con:(get_domstr con);
-	match commit with
-	| None -> true
-	| Some transaction_replay_f ->
-		Transaction.commit ~con:(get_domstr con) trans || transaction_replay_f con trans
+  let trans = Hashtbl.find con.transactions tid in
+  Hashtbl.remove con.transactions tid;
+  Logging.end_transaction ~tid ~con:(get_domstr con);
+  match commit with
+  | None -> true
+  | Some transaction_replay_f ->
+    Transaction.commit ~con:(get_domstr con) trans || transaction_replay_f con trans
 
 let get_transaction con tid =
-	Hashtbl.find con.transactions tid
+  Hashtbl.find con.transactions tid
 
 let do_input con = Xenbus.Xb.input con.xb
 let has_partial_input con = Xenbus.Xb.has_partial_input con.xb
@@ -434,53 +434,53 @@ let is_bad con = match con.dom with None -> false | Some dom -> Domain.is_bad_do
    Restrictions below can be relaxed once xenstored learns to dump more
    of its live state in a safe way *)
 let has_extra_connection_data con =
-	let has_in = has_partial_input con in
-	let has_out = has_output con in
-	let has_nondefault_perms = make_perm con.dom <> con.perm in
-	has_in || has_out
-	(* TODO: what about SIGTERM, should use systemd to store FDS
-	|| has_socket (* dom0 sockets not * dumped yet *) *)
-	|| has_nondefault_perms (* set_target not dumped yet *)
+  let has_in = has_partial_input con in
+  let has_out = has_output con in
+  let has_nondefault_perms = make_perm con.dom <> con.perm in
+  has_in || has_out
+  (* TODO: what about SIGTERM, should use systemd to store FDS
+     	|| has_socket (* dom0 sockets not * dumped yet *) *)
+  || has_nondefault_perms (* set_target not dumped yet *)
 
 let has_transaction_data con =
-	let n = number_of_transactions con in
-	dbg "%s: number of transactions = %d" (get_domstr con) n;
-	n > 0
+  let n = number_of_transactions con in
+  dbg "%s: number of transactions = %d" (get_domstr con) n;
+  n > 0
 
 let prevents_live_update con = not (is_bad con)
-	&& (has_extra_connection_data con || has_transaction_data con)
+                               && (has_extra_connection_data con || has_transaction_data con)
 
 let has_more_work con =
-	(has_more_input con && can_input con) || not (has_old_output con) && has_new_output con
+  (has_more_input con && can_input con) || not (has_old_output con) && has_new_output con
 
 let incr_ops con = con.stat_nb_ops <- con.stat_nb_ops + 1
 
 let stats con =
-	Hashtbl.length con.watches, con.stat_nb_ops
+  Hashtbl.length con.watches, con.stat_nb_ops
 
 let dump con chan =
-	let id = match con.dom with
-	| Some dom ->
-		let domid = Domain.get_id dom in
-		(* dump domain *)
-		Domain.dump dom chan;
-		domid
-	| None ->
-		let fd = con |> get_fd |> Utils.FD.to_int in
-		Printf.fprintf chan "socket,%d\n" fd;
-		-fd
-	in
-	(* dump watches *)
-	List.iter (fun (path, token) ->
-		Printf.fprintf chan "watch,%d,%s,%s\n" id (Utils.hexify path) (Utils.hexify token)
-		) (list_watches con)
+  let id = match con.dom with
+    | Some dom ->
+      let domid = Domain.get_id dom in
+      (* dump domain *)
+      Domain.dump dom chan;
+      domid
+    | None ->
+      let fd = con |> get_fd |> Utils.FD.to_int in
+      Printf.fprintf chan "socket,%d\n" fd;
+      -fd
+  in
+  (* dump watches *)
+  List.iter (fun (path, token) ->
+      Printf.fprintf chan "watch,%d,%s,%s\n" id (Utils.hexify path) (Utils.hexify token)
+    ) (list_watches con)
 
 let debug con =
-	let domid = get_domstr con in
-	let watches = List.map (fun (path, token) -> Printf.sprintf "watch %s: %s %s\n" domid path token) (list_watches con) in
-	String.concat "" watches
+  let domid = get_domstr con in
+  let watches = List.map (fun (path, token) -> Printf.sprintf "watch %s: %s %s\n" domid path token) (list_watches con) in
+  String.concat "" watches
 
 let decr_conflict_credit doms con =
-	match con.dom with
-	| None -> () (* It's a socket connection. We don't know which domain we're in, so treat it as if it's free to conflict *)
-	| Some dom -> Domains.decr_conflict_credit doms dom
+  match con.dom with
+  | None -> () (* It's a socket connection. We don't know which domain we're in, so treat it as if it's free to conflict *)
+  | Some dom -> Domains.decr_conflict_credit doms dom
diff --git a/tools/ocaml/xenstored/connections.ml b/tools/ocaml/xenstored/connections.ml
index a80ae0bed2..7601ccdfea 100644
--- a/tools/ocaml/xenstored/connections.ml
+++ b/tools/ocaml/xenstored/connections.ml
@@ -18,213 +18,213 @@
 let debug fmt = Logging.debug "connections" fmt
 
 type t = {
-	anonymous: (Unix.file_descr, Connection.t) Hashtbl.t;
-	domains: (int, Connection.t) Hashtbl.t;
-	ports: (Xeneventchn.t, Connection.t) Hashtbl.t;
-	mutable watches: Connection.watch list Trie.t;
-	mutable has_pending_watchevents: Connection.Watch.Set.t
+  anonymous: (Unix.file_descr, Connection.t) Hashtbl.t;
+  domains: (int, Connection.t) Hashtbl.t;
+  ports: (Xeneventchn.t, Connection.t) Hashtbl.t;
+  mutable watches: Connection.watch list Trie.t;
+  mutable has_pending_watchevents: Connection.Watch.Set.t
 }
 
 let create () = {
-	anonymous = Hashtbl.create 37;
-	domains = Hashtbl.create 37;
-	ports = Hashtbl.create 37;
-	watches = Trie.create ();
-	has_pending_watchevents = Connection.Watch.Set.empty;
+  anonymous = Hashtbl.create 37;
+  domains = Hashtbl.create 37;
+  ports = Hashtbl.create 37;
+  watches = Trie.create ();
+  has_pending_watchevents = Connection.Watch.Set.empty;
 }
 
 let get_capacity () =
-	(* not multiplied by maxwatch on purpose: 2nd queue in watch itself! *)
-	{ Xenbus.Xb.maxoutstanding = !Define.maxoutstanding; maxwatchevents = !Define.maxwatchevents }
+  (* not multiplied by maxwatch on purpose: 2nd queue in watch itself! *)
+  { Xenbus.Xb.maxoutstanding = !Define.maxoutstanding; maxwatchevents = !Define.maxwatchevents }
 
 let add_anonymous cons fd =
-	let capacity = get_capacity () in
-	let xbcon = Xenbus.Xb.open_fd fd ~capacity in
-	let con = Connection.create xbcon None in
-	Hashtbl.add cons.anonymous (Xenbus.Xb.get_fd xbcon) con
+  let capacity = get_capacity () in
+  let xbcon = Xenbus.Xb.open_fd fd ~capacity in
+  let con = Connection.create xbcon None in
+  Hashtbl.add cons.anonymous (Xenbus.Xb.get_fd xbcon) con
 
 let add_domain cons dom =
-	let capacity = get_capacity () in
-	let xbcon = Xenbus.Xb.open_mmap ~capacity (Domain.get_interface dom) (fun () -> Domain.notify dom) in
-	let con = Connection.create xbcon (Some dom) in
-	Hashtbl.add cons.domains (Domain.get_id dom) con;
-	Hashtbl.add cons.ports (Domain.get_local_port dom) con
+  let capacity = get_capacity () in
+  let xbcon = Xenbus.Xb.open_mmap ~capacity (Domain.get_interface dom) (fun () -> Domain.notify dom) in
+  let con = Connection.create xbcon (Some dom) in
+  Hashtbl.add cons.domains (Domain.get_id dom) con;
+  Hashtbl.add cons.ports (Domain.get_local_port dom) con
 
 let select ?(only_if = (fun _ -> true)) cons =
-	Hashtbl.fold (fun _ con (ins, outs) ->
-		if (only_if con) then (
-			let fd = Connection.get_fd con in
-			let in_fds = if Connection.can_input con then fd :: ins else ins in
-			let out_fds = if Connection.has_output con then fd :: outs else outs in
-			in_fds, out_fds
-		) else (ins, outs)
-	)
-	cons.anonymous ([], [])
+  Hashtbl.fold (fun _ con (ins, outs) ->
+      if (only_if con) then (
+        let fd = Connection.get_fd con in
+        let in_fds = if Connection.can_input con then fd :: ins else ins in
+        let out_fds = if Connection.has_output con then fd :: outs else outs in
+        in_fds, out_fds
+      ) else (ins, outs)
+    )
+    cons.anonymous ([], [])
 
 let find cons =
-	Hashtbl.find cons.anonymous
+  Hashtbl.find cons.anonymous
 
 let find_domain cons =
-	Hashtbl.find cons.domains
+  Hashtbl.find cons.domains
 
 let find_domain_by_port cons port =
-	Hashtbl.find cons.ports port
+  Hashtbl.find cons.ports port
 
 let del_watches_of_con con watches =
-	match List.filter (fun w -> Connection.get_con w != con) watches with
-	| [] -> None
-	| ws -> Some ws
+  match List.filter (fun w -> Connection.get_con w != con) watches with
+  | [] -> None
+  | ws -> Some ws
 
 let del_watches cons con =
-	Connection.del_watches con;
-	cons.watches <- Trie.map (del_watches_of_con con) cons.watches;
-	cons.has_pending_watchevents <-
-		cons.has_pending_watchevents |> Connection.Watch.Set.filter @@ fun w ->
-		Connection.get_con w != con
+  Connection.del_watches con;
+  cons.watches <- Trie.map (del_watches_of_con con) cons.watches;
+  cons.has_pending_watchevents <-
+    cons.has_pending_watchevents |> Connection.Watch.Set.filter @@ fun w ->
+    Connection.get_con w != con
 
 let del_anonymous cons con =
-	try
-		Hashtbl.remove cons.anonymous (Connection.get_fd con);
-		del_watches cons con;
-		Connection.close con
-	with exn ->
-		debug "del anonymous %s" (Printexc.to_string exn)
+  try
+    Hashtbl.remove cons.anonymous (Connection.get_fd con);
+    del_watches cons con;
+    Connection.close con
+  with exn ->
+    debug "del anonymous %s" (Printexc.to_string exn)
 
 let del_domain cons id =
-	try
-		let con = find_domain cons id in
-		Hashtbl.remove cons.domains id;
-		(match Connection.get_domain con with
-		 | Some d -> Hashtbl.remove cons.ports (Domain.get_local_port d)
-		 | None -> ());
-		del_watches cons con;
-		Connection.close con
-	with exn ->
-		debug "del domain %u: %s" id (Printexc.to_string exn)
+  try
+    let con = find_domain cons id in
+    Hashtbl.remove cons.domains id;
+    (match Connection.get_domain con with
+     | Some d -> Hashtbl.remove cons.ports (Domain.get_local_port d)
+     | None -> ());
+    del_watches cons con;
+    Connection.close con
+  with exn ->
+    debug "del domain %u: %s" id (Printexc.to_string exn)
 
 let iter_domains cons fct =
-	Hashtbl.iter (fun _ c -> fct c) cons.domains
+  Hashtbl.iter (fun _ c -> fct c) cons.domains
 
 let iter_anonymous cons fct =
-	Hashtbl.iter (fun _ c -> fct c) cons.anonymous
+  Hashtbl.iter (fun _ c -> fct c) cons.anonymous
 
 let iter cons fct =
-	iter_domains cons fct; iter_anonymous cons fct
+  iter_domains cons fct; iter_anonymous cons fct
 
 let has_more_work cons =
-	Hashtbl.fold
-		(fun _id con acc ->
-		 if Connection.has_more_work con then con :: acc else acc)
-		cons.domains []
+  Hashtbl.fold
+    (fun _id con acc ->
+       if Connection.has_more_work con then con :: acc else acc)
+    cons.domains []
 
 let key_of_str path =
-	if path.[0] = '@'
-	then [path]
-	else "" :: Store.Path.to_string_list (Store.Path.of_string path)
+  if path.[0] = '@'
+  then [path]
+  else "" :: Store.Path.to_string_list (Store.Path.of_string path)
 
 let key_of_path path =
-	"" :: Store.Path.to_string_list path
+  "" :: Store.Path.to_string_list path
 
 let add_watch cons con path token =
-	let apath = Connection.get_watch_path con path in
-	(* fail on invalid paths early by calling key_of_str before adding watch *)
-	let key = key_of_str apath in
-	let watch = Connection.add_watch con (path, apath) token in
-	let watches =
- 		if Trie.mem cons.watches key
- 		then Trie.find cons.watches key
- 		else []
-	in
- 	cons.watches <- Trie.set cons.watches key (watch :: watches);
-	watch
+  let apath = Connection.get_watch_path con path in
+  (* fail on invalid paths early by calling key_of_str before adding watch *)
+  let key = key_of_str apath in
+  let watch = Connection.add_watch con (path, apath) token in
+  let watches =
+    if Trie.mem cons.watches key
+    then Trie.find cons.watches key
+    else []
+  in
+  cons.watches <- Trie.set cons.watches key (watch :: watches);
+  watch
 
 let del_watch cons con path token =
- 	let apath, watch = Connection.del_watch con path token in
- 	let key = key_of_str apath in
- 	let watches = Utils.list_remove watch (Trie.find cons.watches key) in
- 	if watches = [] then
-		cons.watches <- Trie.unset cons.watches key
- 	else
-		cons.watches <- Trie.set cons.watches key watches;
- 	watch
+  let apath, watch = Connection.del_watch con path token in
+  let key = key_of_str apath in
+  let watches = Utils.list_remove watch (Trie.find cons.watches key) in
+  if watches = [] then
+    cons.watches <- Trie.unset cons.watches key
+  else
+    cons.watches <- Trie.set cons.watches key watches;
+  watch
 
 (* path is absolute *)
 let fire_watches ?oldroot source root cons path recurse =
-	let key = key_of_path path in
-	let path = Store.Path.to_string path in
-	let roots = oldroot, root in
-	let fire_watch _ = function
-		| None         -> ()
-		| Some watches -> List.iter (fun w -> Connection.fire_watch source roots w path) watches
-	in
-	let fire_rec _x = function
-		| None         -> ()
-		| Some watches ->
-			List.iter (Connection.fire_single_watch source roots) watches
-	in
-	Trie.iter_path fire_watch cons.watches key;
-	if recurse then
-		Trie.iter fire_rec (Trie.sub cons.watches key)
+  let key = key_of_path path in
+  let path = Store.Path.to_string path in
+  let roots = oldroot, root in
+  let fire_watch _ = function
+    | None         -> ()
+    | Some watches -> List.iter (fun w -> Connection.fire_watch source roots w path) watches
+  in
+  let fire_rec _x = function
+    | None         -> ()
+    | Some watches ->
+      List.iter (Connection.fire_single_watch source roots) watches
+  in
+  Trie.iter_path fire_watch cons.watches key;
+  if recurse then
+    Trie.iter fire_rec (Trie.sub cons.watches key)
 
 let send_watchevents cons con =
-	cons.has_pending_watchevents <-
-		cons.has_pending_watchevents |> Connection.Watch.Set.filter Connection.Watch.flush_events;
-	Connection.source_flush_watchevents con
+  cons.has_pending_watchevents <-
+    cons.has_pending_watchevents |> Connection.Watch.Set.filter Connection.Watch.flush_events;
+  Connection.source_flush_watchevents con
 
 let fire_spec_watches root cons specpath =
-	let source = find_domain cons 0 in
-	iter cons (fun con ->
-		List.iter (Connection.fire_single_watch source (None, root)) (Connection.get_watches con specpath))
+  let source = find_domain cons 0 in
+  iter cons (fun con ->
+      List.iter (Connection.fire_single_watch source (None, root)) (Connection.get_watches con specpath))
 
 let set_target cons domain target_domain =
-	let con = find_domain cons domain in
-	Connection.set_target con target_domain
+  let con = find_domain cons domain in
+  Connection.set_target con target_domain
 
 let number_of_transactions cons =
-	let res = ref 0 in
-	let aux con =
-		res := Connection.number_of_transactions con + !res
-	in
-	iter cons aux;
-	!res
+  let res = ref 0 in
+  let aux con =
+    res := Connection.number_of_transactions con + !res
+  in
+  iter cons aux;
+  !res
 
 let stats cons =
-	let nb_ops_anon = ref 0
-	and nb_watchs_anon = ref 0
-	and nb_ops_dom = ref 0
-	and nb_watchs_dom = ref 0 in
-	iter_anonymous cons (fun con ->
-		let con_watchs, con_ops = Connection.stats con in
-		nb_ops_anon := !nb_ops_anon + con_ops;
-		nb_watchs_anon := !nb_watchs_anon + con_watchs;
-	);
-	iter_domains cons (fun con ->
-		let con_watchs, con_ops = Connection.stats con in
-		nb_ops_dom := !nb_ops_dom + con_ops;
-		nb_watchs_dom := !nb_watchs_dom + con_watchs;
-	);
-	(Hashtbl.length cons.anonymous, !nb_ops_anon, !nb_watchs_anon,
-	 Hashtbl.length cons.domains, !nb_ops_dom, !nb_watchs_dom)
+  let nb_ops_anon = ref 0
+  and nb_watchs_anon = ref 0
+  and nb_ops_dom = ref 0
+  and nb_watchs_dom = ref 0 in
+  iter_anonymous cons (fun con ->
+      let con_watchs, con_ops = Connection.stats con in
+      nb_ops_anon := !nb_ops_anon + con_ops;
+      nb_watchs_anon := !nb_watchs_anon + con_watchs;
+    );
+  iter_domains cons (fun con ->
+      let con_watchs, con_ops = Connection.stats con in
+      nb_ops_dom := !nb_ops_dom + con_ops;
+      nb_watchs_dom := !nb_watchs_dom + con_watchs;
+    );
+  (Hashtbl.length cons.anonymous, !nb_ops_anon, !nb_watchs_anon,
+   Hashtbl.length cons.domains, !nb_ops_dom, !nb_watchs_dom)
 
 let debug cons =
-	let anonymous = Hashtbl.fold (fun _ con accu -> Connection.debug con :: accu) cons.anonymous [] in
-	let domains = Hashtbl.fold (fun _ con accu -> Connection.debug con :: accu) cons.domains [] in
-	String.concat "" (domains @ anonymous)
+  let anonymous = Hashtbl.fold (fun _ con accu -> Connection.debug con :: accu) cons.anonymous [] in
+  let domains = Hashtbl.fold (fun _ con accu -> Connection.debug con :: accu) cons.domains [] in
+  String.concat "" (domains @ anonymous)
 
 let debug_watchevents cons con =
-	(* == (physical equality)
-	   has to be used here because w.con.xb.backend might contain a [unit->unit] value causing regular
-	   comparison to fail due to having a 'functional value' which cannot be compared.
-	 *)
-	let s = cons.has_pending_watchevents |> Connection.Watch.Set.filter (fun w -> w.con == con) in
-	let pending = s |> Connection.Watch.Set.elements
-		|> List.map (fun w -> Connection.Watch.pending_watchevents w) |> List.fold_left (+) 0 in
-	Printf.sprintf "Watches with pending events: %d, pending events total: %d" (Connection.Watch.Set.cardinal s) pending
+  (* == (physical equality)
+     	   has to be used here because w.con.xb.backend might contain a [unit->unit] value causing regular
+     	   comparison to fail due to having a 'functional value' which cannot be compared.
+     	 *)
+  let s = cons.has_pending_watchevents |> Connection.Watch.Set.filter (fun w -> w.con == con) in
+  let pending = s |> Connection.Watch.Set.elements
+                |> List.map (fun w -> Connection.Watch.pending_watchevents w) |> List.fold_left (+) 0 in
+  Printf.sprintf "Watches with pending events: %d, pending events total: %d" (Connection.Watch.Set.cardinal s) pending
 
 let filter ~f cons =
-	let fold _ v acc = if f v then v :: acc else acc in
-	[]
-	|> Hashtbl.fold fold cons.anonymous
-	|> Hashtbl.fold fold cons.domains
+  let fold _ v acc = if f v then v :: acc else acc in
+  []
+  |> Hashtbl.fold fold cons.anonymous
+  |> Hashtbl.fold fold cons.domains
 
 let prevents_quit cons = filter ~f:Connection.prevents_live_update cons
diff --git a/tools/ocaml/xenstored/disk.ml b/tools/ocaml/xenstored/disk.ml
index 4739967b61..91f945f2bd 100644
--- a/tools/ocaml/xenstored/disk.ml
+++ b/tools/ocaml/xenstored/disk.ml
@@ -25,133 +25,133 @@ exception Bad_escape
 let is_digit c = match c with '0' .. '9' -> true | _ -> false
 
 let undec c =
-	match c with
-	| '0' .. '9' -> (Char.code c) - (Char.code '0')
-	| _          -> raise (Failure "undecify")
+  match c with
+  | '0' .. '9' -> (Char.code c) - (Char.code '0')
+  | _          -> raise (Failure "undecify")
 
 let unhex c =
-	let c = Char.lowercase c in
-	match c with
-	| '0' .. '9' -> (Char.code c) - (Char.code '0')
-	| 'a' .. 'f' -> (Char.code c) - (Char.code 'a') + 10
-	| _          -> raise (Failure "unhexify")
+  let c = Char.lowercase c in
+  match c with
+  | '0' .. '9' -> (Char.code c) - (Char.code '0')
+  | 'a' .. 'f' -> (Char.code c) - (Char.code 'a') + 10
+  | _          -> raise (Failure "unhexify")
 
 let string_unescaped s =
-	let len = String.length s
-	and i = ref 0 in
-	let d = Buffer.create len in
+  let len = String.length s
+  and i = ref 0 in
+  let d = Buffer.create len in
 
-	let read_escape () =
-		incr i;
-		match s.[!i] with
-		| 'n'  -> '\n'
-		| 'r'  -> '\r'
-		| '\\' -> '\\'
-		| '\'' -> '\''
-		| '"'  -> '"'
-		| 't'  -> '\t'
-		| 'b'  -> '\b'
-		| 'x'  ->
-			let v = (unhex s.[!i + 1] * 16) + unhex s.[!i + 2] in
-			i := !i + 2;
-			Char.chr v
-		| c    ->
-			if is_digit c then (
-				let v = (undec s.[!i]) * 100 +
-					(undec s.[!i + 1]) * 10 +
-					(undec s.[!i + 2]) in
-				i := !i + 2;
-				Char.chr v
-			) else
-				raise Bad_escape
-	in
+  let read_escape () =
+    incr i;
+    match s.[!i] with
+    | 'n'  -> '\n'
+    | 'r'  -> '\r'
+    | '\\' -> '\\'
+    | '\'' -> '\''
+    | '"'  -> '"'
+    | 't'  -> '\t'
+    | 'b'  -> '\b'
+    | 'x'  ->
+      let v = (unhex s.[!i + 1] * 16) + unhex s.[!i + 2] in
+      i := !i + 2;
+      Char.chr v
+    | c    ->
+      if is_digit c then (
+        let v = (undec s.[!i]) * 100 +
+                (undec s.[!i + 1]) * 10 +
+                (undec s.[!i + 2]) in
+        i := !i + 2;
+        Char.chr v
+      ) else
+        raise Bad_escape
+  in
 
-	while !i < len
-	do
-		let c = match s.[!i] with
-		| '\\' -> read_escape ()
-		| c    -> c in
-		Buffer.add_char d c;
-		incr i
-	done;
-	Buffer.contents d
+  while !i < len
+  do
+    let c = match s.[!i] with
+      | '\\' -> read_escape ()
+      | c    -> c in
+    Buffer.add_char d c;
+    incr i
+  done;
+  Buffer.contents d
 
 (* file -> lines_of_file *)
 let file_readlines file =
-	let channel = open_in file in
-	let rec input_line_list channel =
-		let line = try input_line channel with End_of_file -> "" in
-		if String.length line > 0 then
-			line :: input_line_list channel
-		else (
-			close_in channel;
-			[]
-		) in
-	input_line_list channel
+  let channel = open_in file in
+  let rec input_line_list channel =
+    let line = try input_line channel with End_of_file -> "" in
+    if String.length line > 0 then
+      line :: input_line_list channel
+    else (
+      close_in channel;
+      []
+    ) in
+  input_line_list channel
 
 let rec map_string_list_range l s =
-	match l with
-	| [] -> []
-	| (a,b) :: l -> String.sub s a (b - a) :: map_string_list_range l s
+  match l with
+  | [] -> []
+  | (a,b) :: l -> String.sub s a (b - a) :: map_string_list_range l s
 
 let is_digit c =
-	try ignore (int_of_char c); true with _ -> false
+  try ignore (int_of_char c); true with _ -> false
 
 let rec parse_perm s =
-	let len = String.length s in
-	if len = 0 then
-		[]
-	else
-		let i = ref 1 in
-		while !i < len && is_digit s.[!i] do incr i done;
-		let x = String.sub s 0 !i
-		and lx = String.sub s !i len in
-		x :: parse_perm lx
+  let len = String.length s in
+  if len = 0 then
+    []
+  else
+    let i = ref 1 in
+    while !i < len && is_digit s.[!i] do incr i done;
+    let x = String.sub s 0 !i
+    and lx = String.sub s !i len in
+    x :: parse_perm lx
 
 let read store =
-	(* don't let the permission get on our way, full perm ! *)
-	let v = Store.get_ops store Perms.Connection.full_rights in
+  (* don't let the permission get on our way, full perm ! *)
+  let v = Store.get_ops store Perms.Connection.full_rights in
 
-	(* a line is : path{perm} or path{perm} = value *)
-	let parse_line s =
-		let path, perm, value =
-			let len = String.length s in
-			let si = if String.contains s '=' then
-					String.index s '='
-				else
-					len - 1 in
-			let pi = String.rindex_from s si '{' in
-			let epi = String.index_from s pi '}' in
+  (* a line is : path{perm} or path{perm} = value *)
+  let parse_line s =
+    let path, perm, value =
+      let len = String.length s in
+      let si = if String.contains s '=' then
+          String.index s '='
+        else
+          len - 1 in
+      let pi = String.rindex_from s si '{' in
+      let epi = String.index_from s pi '}' in
 
-			if String.contains s '=' then
-				let ss = map_string_list_range [ (0, pi);
-				                                 (pi + 1, epi);
-				                                 (si + 2, len); ] s in
-				(List.nth ss 0, List.nth ss 1, List.nth ss 2)
-			else
-				let ss = map_string_list_range [ (0, pi);
-				                                 (pi + 1, epi);
-				                               ] s in
-				(List.nth ss 0, List.nth ss 1, "")
-			in
-		let path = Store.Path.of_string path in
-		v.Store.write path (string_unescaped value);
-		v.Store.setperms path (Perms.Node.of_strings (parse_perm perm)) in
-	try
-		let lines = file_readlines xs_daemon_database in
-		List.iter (fun s -> parse_line s) lines
-	with exc ->
-		error "caught exn %s" (Printexc.to_string exc)
+      if String.contains s '=' then
+        let ss = map_string_list_range [ (0, pi);
+                                         (pi + 1, epi);
+                                         (si + 2, len); ] s in
+        (List.nth ss 0, List.nth ss 1, List.nth ss 2)
+      else
+        let ss = map_string_list_range [ (0, pi);
+                                         (pi + 1, epi);
+                                       ] s in
+        (List.nth ss 0, List.nth ss 1, "")
+    in
+    let path = Store.Path.of_string path in
+    v.Store.write path (string_unescaped value);
+    v.Store.setperms path (Perms.Node.of_strings (parse_perm perm)) in
+  try
+    let lines = file_readlines xs_daemon_database in
+    List.iter (fun s -> parse_line s) lines
+  with exc ->
+    error "caught exn %s" (Printexc.to_string exc)
 
 let write store =
-	if !enable then
-	try
-		let tfile = Printf.sprintf "%s#" xs_daemon_database in
-		let channel = open_out_gen [ Open_wronly; Open_creat; Open_trunc; ]
-		                           0o600 tfile in
-		Store.dump store channel;
-		flush channel;
-		close_out channel;
-		Unix.rename tfile xs_daemon_database
-	with exc ->
-		error "caught exn %s" (Printexc.to_string exc)
+  if !enable then
+    try
+      let tfile = Printf.sprintf "%s#" xs_daemon_database in
+      let channel = open_out_gen [ Open_wronly; Open_creat; Open_trunc; ]
+          0o600 tfile in
+      Store.dump store channel;
+      flush channel;
+      close_out channel;
+      Unix.rename tfile xs_daemon_database
+    with exc ->
+      error "caught exn %s" (Printexc.to_string exc)
diff --git a/tools/ocaml/xenstored/domain.ml b/tools/ocaml/xenstored/domain.ml
index 5c15752a37..9a47888728 100644
--- a/tools/ocaml/xenstored/domain.ml
+++ b/tools/ocaml/xenstored/domain.ml
@@ -22,37 +22,37 @@ let warn  fmt = Logging.warn  "domain" fmt
 (* A bound inter-domain event channel port pair.  The remote port, and the
    local port it is bound to. *)
 type port_pair =
-{
-	local: Xeneventchn.t;
-	remote: int;
-}
+  {
+    local: Xeneventchn.t;
+    remote: int;
+  }
 
 (* Sentinal port_pair with both set to EVTCHN_INVALID *)
 let invalid_ports =
-{
-	local = Xeneventchn.of_int 0;
-	remote = 0
-}
+  {
+    local = Xeneventchn.of_int 0;
+    remote = 0
+  }
 
 let string_of_port_pair p =
-	sprintf "(l %d, r %d)" (Xeneventchn.to_int p.local) p.remote
+  sprintf "(l %d, r %d)" (Xeneventchn.to_int p.local) p.remote
 
 type t =
-{
-	id: Xenctrl.domid;
-	mfn: nativeint;
-	interface: Xenmmap.mmap_interface;
-	eventchn: Event.t;
-	mutable ports: port_pair;
-	mutable bad_client: bool;
-	mutable io_credit: int; (* the rounds of ring process left to do, default is 0,
-	                           usually set to 1 when there is work detected, could
-	                           also set to n to give "lazy" clients extra credit *)
-	mutable conflict_credit: float; (* Must be positive to perform writes; a commit
-	                                   that later causes conflict with another
-	                                   domain's transaction costs credit. *)
-	mutable caused_conflicts: int64;
-}
+  {
+    id: Xenctrl.domid;
+    mfn: nativeint;
+    interface: Xenmmap.mmap_interface;
+    eventchn: Event.t;
+    mutable ports: port_pair;
+    mutable bad_client: bool;
+    mutable io_credit: int; (* the rounds of ring process left to do, default is 0,
+                               	                           usually set to 1 when there is work detected, could
+                               	                           also set to n to give "lazy" clients extra credit *)
+    mutable conflict_credit: float; (* Must be positive to perform writes; a commit
+                                       	                                   that later causes conflict with another
+                                       	                                   domain's transaction costs credit. *)
+    mutable caused_conflicts: int64;
+  }
 
 let is_dom0 d = d.id = 0
 let get_id domain = domain.id
@@ -74,50 +74,50 @@ let is_paused_for_conflict dom = dom.conflict_credit <= 0.0
 let is_free_to_conflict = is_dom0
 
 let dump d chan =
-	fprintf chan "dom,%d,%nd,%d,%d\n"
-		d.id d.mfn d.ports.remote (Xeneventchn.to_int d.ports.local)
+  fprintf chan "dom,%d,%nd,%d,%d\n"
+    d.id d.mfn d.ports.remote (Xeneventchn.to_int d.ports.local)
 
 let rebind_evtchn d remote_port =
-	Event.unbind d.eventchn d.ports.local;
-	let local = Event.bind_interdomain d.eventchn d.id remote_port in
-	let new_ports = { local; remote = remote_port } in
-	debug "domain %d rebind %s => %s"
-	      d.id (string_of_port_pair d.ports) (string_of_port_pair new_ports);
-	d.ports <- new_ports
+  Event.unbind d.eventchn d.ports.local;
+  let local = Event.bind_interdomain d.eventchn d.id remote_port in
+  let new_ports = { local; remote = remote_port } in
+  debug "domain %d rebind %s => %s"
+    d.id (string_of_port_pair d.ports) (string_of_port_pair new_ports);
+  d.ports <- new_ports
 
 let notify dom =
-	Event.notify dom.eventchn dom.ports.local
+  Event.notify dom.eventchn dom.ports.local
 
 let close dom =
-	debug "domain %d unbind %s" dom.id (string_of_port_pair dom.ports);
-	Event.unbind dom.eventchn dom.ports.local;
-	dom.ports <- invalid_ports;
-	Xenmmap.unmap dom.interface
+  debug "domain %d unbind %s" dom.id (string_of_port_pair dom.ports);
+  Event.unbind dom.eventchn dom.ports.local;
+  dom.ports <- invalid_ports;
+  Xenmmap.unmap dom.interface
 
 (* On clean start, local_port will be None, and we must bind the remote port
    given.  On Live Update, the event channel is already bound, and both the
    local and remote port numbers come from the transfer record. *)
 let make ?local_port ~remote_port id mfn interface eventchn =
-	let local = match local_port with
-		| None -> Event.bind_interdomain eventchn id remote_port
-		| Some p -> Xeneventchn.of_int p
-	in
-	let ports = { local; remote = remote_port } in
-	debug "domain %d bind %s" id (string_of_port_pair ports);
-{
-	id = id;
-	mfn = mfn;
-	ports;
-	interface = interface;
-	eventchn = eventchn;
-	bad_client = false;
-	io_credit = 0;
-	conflict_credit = !Define.conflict_burst_limit;
-	caused_conflicts = 0L;
-}
+  let local = match local_port with
+    | None -> Event.bind_interdomain eventchn id remote_port
+    | Some p -> Xeneventchn.of_int p
+  in
+  let ports = { local; remote = remote_port } in
+  debug "domain %d bind %s" id (string_of_port_pair ports);
+  {
+    id = id;
+    mfn = mfn;
+    ports;
+    interface = interface;
+    eventchn = eventchn;
+    bad_client = false;
+    io_credit = 0;
+    conflict_credit = !Define.conflict_burst_limit;
+    caused_conflicts = 0L;
+  }
 
 let log_and_reset_conflict_stats logfn dom =
-	if dom.caused_conflicts > 0L then (
-		logfn dom.id dom.caused_conflicts;
-		dom.caused_conflicts <- 0L
-	)
+  if dom.caused_conflicts > 0L then (
+    logfn dom.id dom.caused_conflicts;
+    dom.caused_conflicts <- 0L
+  )
diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/domains.ml
index b6c075c838..7a3056c364 100644
--- a/tools/ocaml/xenstored/domains.ml
+++ b/tools/ocaml/xenstored/domains.ml
@@ -21,35 +21,35 @@ let warn fmt  = Logging.warn  "domains" fmt
 let xc = Xenctrl.interface_open ()
 
 type domains = {
-	eventchn: Event.t;
-	table: (Xenctrl.domid, Domain.t) Hashtbl.t;
+  eventchn: Event.t;
+  table: (Xenctrl.domid, Domain.t) Hashtbl.t;
 
-	(* N.B. the Queue module is not thread-safe but oxenstored is single-threaded. *)
-	(* Domains queue up to regain conflict-credit; we have a queue for
-	   domains that are carrying some penalty and so are below the
-	   maximum credit, and another queue for domains that have run out of
-	   credit and so have had their access paused. *)
-	doms_conflict_paused: (Domain.t option ref) Queue.t;
-	doms_with_conflict_penalty: (Domain.t option ref) Queue.t;
+  (* N.B. the Queue module is not thread-safe but oxenstored is single-threaded. *)
+  (* Domains queue up to regain conflict-credit; we have a queue for
+     	   domains that are carrying some penalty and so are below the
+     	   maximum credit, and another queue for domains that have run out of
+     	   credit and so have had their access paused. *)
+  doms_conflict_paused: (Domain.t option ref) Queue.t;
+  doms_with_conflict_penalty: (Domain.t option ref) Queue.t;
 
-	(* A callback function to be called when we go from zero to one paused domain.
-	   This will be to reset the countdown until the next unit of credit is issued. *)
-	on_first_conflict_pause: unit -> unit;
+  (* A callback function to be called when we go from zero to one paused domain.
+     	   This will be to reset the countdown until the next unit of credit is issued. *)
+  on_first_conflict_pause: unit -> unit;
 
-	(* If config is set to use individual instead of aggregate conflict-rate-limiting,
-	   we use these counts instead of the queues. The second one includes the first. *)
-	mutable n_paused: int;    (* Number of domains with zero or negative credit *)
-	mutable n_penalised: int; (* Number of domains with less than maximum credit *)
+  (* If config is set to use individual instead of aggregate conflict-rate-limiting,
+     	   we use these counts instead of the queues. The second one includes the first. *)
+  mutable n_paused: int;    (* Number of domains with zero or negative credit *)
+  mutable n_penalised: int; (* Number of domains with less than maximum credit *)
 }
 
 let init eventchn on_first_conflict_pause = {
-	eventchn = eventchn;
-	table = Hashtbl.create 10;
-	doms_conflict_paused = Queue.create ();
-	doms_with_conflict_penalty = Queue.create ();
-	on_first_conflict_pause = on_first_conflict_pause;
-	n_paused = 0;
-	n_penalised = 0;
+  eventchn = eventchn;
+  table = Hashtbl.create 10;
+  doms_conflict_paused = Queue.create ();
+  doms_with_conflict_penalty = Queue.create ();
+  on_first_conflict_pause = on_first_conflict_pause;
+  n_paused = 0;
+  n_penalised = 0;
 }
 let del doms id = Hashtbl.remove doms.table id
 let exist doms id = Hashtbl.mem doms.table id
@@ -59,161 +59,161 @@ let iter doms fct = Hashtbl.iter (fun _ b -> fct b) doms.table
 let eventchn doms = doms.eventchn
 
 let rec is_empty_queue q =
-	Queue.is_empty q ||
-		if !(Queue.peek q) = None
-		then (
-			ignore (Queue.pop q);
-			is_empty_queue q
-		) else false
+  Queue.is_empty q ||
+  if !(Queue.peek q) = None
+  then (
+    ignore (Queue.pop q);
+    is_empty_queue q
+  ) else false
 
 let all_at_max_credit doms =
-	if !Define.conflict_rate_limit_is_aggregate
-	then
-		(* Check both becuase if burst limit is 1.0 then a domain can go straight
-		 * from max-credit to paused without getting into the penalty queue. *)
-		is_empty_queue doms.doms_with_conflict_penalty
-		&& is_empty_queue doms.doms_conflict_paused
-	else doms.n_penalised = 0
+  if !Define.conflict_rate_limit_is_aggregate
+  then
+    (* Check both becuase if burst limit is 1.0 then a domain can go straight
+       		 * from max-credit to paused without getting into the penalty queue. *)
+    is_empty_queue doms.doms_with_conflict_penalty
+    && is_empty_queue doms.doms_conflict_paused
+  else doms.n_penalised = 0
 
 (* Functions to handle queues of domains given that the domain might be deleted while in a queue. *)
 let push dom queue =
-	Queue.push (ref (Some dom)) queue
+  Queue.push (ref (Some dom)) queue
 
 let rec pop queue =
-	match !(Queue.pop queue) with
-	| None -> pop queue
-	| Some x -> x
+  match !(Queue.pop queue) with
+  | None -> pop queue
+  | Some x -> x
 
 let remove_from_queue dom queue =
-	Queue.iter (fun d -> match !d with
-		| None -> ()
-		| Some x -> if x=dom then d := None) queue
+  Queue.iter (fun d -> match !d with
+      | None -> ()
+      | Some x -> if x=dom then d := None) queue
 
 let cleanup doms =
-	let notify = ref false in
-	let dead_dom = ref [] in
+  let notify = ref false in
+  let dead_dom = ref [] in
 
-	Hashtbl.iter (fun id _ -> if id <> 0 then
-		try
-			let info = Xenctrl.domain_getinfo xc id in
-			if info.Xenctrl.shutdown || info.Xenctrl.dying then (
-				debug "Domain %u died (dying=%b, shutdown %b -- code %d)"
-				                    id info.Xenctrl.dying info.Xenctrl.shutdown info.Xenctrl.shutdown_code;
-				if info.Xenctrl.dying then
-					dead_dom := id :: !dead_dom
-				else
-					notify := true;
-			)
-		with Xenctrl.Error _ ->
-			debug "Domain %u died -- no domain info" id;
-			dead_dom := id :: !dead_dom;
-		) doms.table;
-	List.iter (fun id ->
-		let dom = Hashtbl.find doms.table id in
-		Domain.close dom;
-		Hashtbl.remove doms.table id;
-		if dom.Domain.conflict_credit <= !Define.conflict_burst_limit
-		then (
-			remove_from_queue dom doms.doms_with_conflict_penalty;
-			if (dom.Domain.conflict_credit <= 0.) then remove_from_queue dom doms.doms_conflict_paused
-		)
-	) !dead_dom;
-	!notify, !dead_dom
+  Hashtbl.iter (fun id _ -> if id <> 0 then
+                   try
+                     let info = Xenctrl.domain_getinfo xc id in
+                     if info.Xenctrl.shutdown || info.Xenctrl.dying then (
+                       debug "Domain %u died (dying=%b, shutdown %b -- code %d)"
+                         id info.Xenctrl.dying info.Xenctrl.shutdown info.Xenctrl.shutdown_code;
+                       if info.Xenctrl.dying then
+                         dead_dom := id :: !dead_dom
+                       else
+                         notify := true;
+                     )
+                   with Xenctrl.Error _ ->
+                     debug "Domain %u died -- no domain info" id;
+                     dead_dom := id :: !dead_dom;
+               ) doms.table;
+  List.iter (fun id ->
+      let dom = Hashtbl.find doms.table id in
+      Domain.close dom;
+      Hashtbl.remove doms.table id;
+      if dom.Domain.conflict_credit <= !Define.conflict_burst_limit
+      then (
+        remove_from_queue dom doms.doms_with_conflict_penalty;
+        if (dom.Domain.conflict_credit <= 0.) then remove_from_queue dom doms.doms_conflict_paused
+      )
+    ) !dead_dom;
+  !notify, !dead_dom
 
 let resume _doms _domid =
-	()
+  ()
 
 let create doms ?local_port ~remote_port domid mfn =
-	let interface = Xenctrl.map_foreign_range xc domid (Xenmmap.getpagesize()) mfn in
-	let dom = Domain.make ?local_port ~remote_port domid mfn interface doms.eventchn in
-	Hashtbl.add doms.table domid dom;
-	dom
+  let interface = Xenctrl.map_foreign_range xc domid (Xenmmap.getpagesize()) mfn in
+  let dom = Domain.make ?local_port ~remote_port domid mfn interface doms.eventchn in
+  Hashtbl.add doms.table domid dom;
+  dom
 
 let xenstored_kva = ref ""
 let xenstored_port = ref ""
 
 let create0 ?local_port doms =
-	let remote_port = Utils.read_file_single_integer !xenstored_port in
+  let remote_port = Utils.read_file_single_integer !xenstored_port in
 
-	let interface =
-		let fd = Unix.openfile !xenstored_kva [ Unix.O_RDWR ] 0o600 in
-		let interface = Xenmmap.mmap fd Xenmmap.RDWR Xenmmap.SHARED (Xenmmap.getpagesize()) 0 in
-		Unix.close fd;
-		interface
-	in
+  let interface =
+    let fd = Unix.openfile !xenstored_kva [ Unix.O_RDWR ] 0o600 in
+    let interface = Xenmmap.mmap fd Xenmmap.RDWR Xenmmap.SHARED (Xenmmap.getpagesize()) 0 in
+    Unix.close fd;
+    interface
+  in
 
-	let dom = Domain.make ?local_port ~remote_port 0 Nativeint.zero interface doms.eventchn in
-	Hashtbl.add doms.table 0 dom;
-	Domain.notify dom;
-	dom
+  let dom = Domain.make ?local_port ~remote_port 0 Nativeint.zero interface doms.eventchn in
+  Hashtbl.add doms.table 0 dom;
+  Domain.notify dom;
+  dom
 
 let decr_conflict_credit doms dom =
-	dom.Domain.caused_conflicts <- Int64.add 1L dom.Domain.caused_conflicts;
-	let before = dom.Domain.conflict_credit in
-	let after = max (-1.0) (before -. 1.0) in
-	debug "decr_conflict_credit dom%d %F -> %F" (Domain.get_id dom) before after;
-	dom.Domain.conflict_credit <- after;
-	let newly_penalised =
-		before >= !Define.conflict_burst_limit
-		&& after < !Define.conflict_burst_limit in
-	let newly_paused = before > 0.0 && after <= 0.0 in
-	if !Define.conflict_rate_limit_is_aggregate then (
-		if newly_penalised
-		&& after > 0.0
-		then (
-			push dom doms.doms_with_conflict_penalty
-		) else if newly_paused
-		then (
-			let first_pause = Queue.is_empty doms.doms_conflict_paused in
-			push dom doms.doms_conflict_paused;
-			if first_pause then doms.on_first_conflict_pause ()
-		) else (
-			(* The queues are correct already: no further action needed. *)
-		)
-	) else (
-		if newly_penalised then doms.n_penalised <- doms.n_penalised + 1;
-		if newly_paused then (
-			doms.n_paused <- doms.n_paused + 1;
-			if doms.n_paused = 1 then doms.on_first_conflict_pause ()
-		)
-	)
+  dom.Domain.caused_conflicts <- Int64.add 1L dom.Domain.caused_conflicts;
+  let before = dom.Domain.conflict_credit in
+  let after = max (-1.0) (before -. 1.0) in
+  debug "decr_conflict_credit dom%d %F -> %F" (Domain.get_id dom) before after;
+  dom.Domain.conflict_credit <- after;
+  let newly_penalised =
+    before >= !Define.conflict_burst_limit
+    && after < !Define.conflict_burst_limit in
+  let newly_paused = before > 0.0 && after <= 0.0 in
+  if !Define.conflict_rate_limit_is_aggregate then (
+    if newly_penalised
+    && after > 0.0
+    then (
+      push dom doms.doms_with_conflict_penalty
+    ) else if newly_paused
+    then (
+      let first_pause = Queue.is_empty doms.doms_conflict_paused in
+      push dom doms.doms_conflict_paused;
+      if first_pause then doms.on_first_conflict_pause ()
+    ) else (
+      (* The queues are correct already: no further action needed. *)
+    )
+  ) else (
+    if newly_penalised then doms.n_penalised <- doms.n_penalised + 1;
+    if newly_paused then (
+      doms.n_paused <- doms.n_paused + 1;
+      if doms.n_paused = 1 then doms.on_first_conflict_pause ()
+    )
+  )
 
 (* Give one point of credit to one domain, and update the queues appropriately. *)
 let incr_conflict_credit_from_queue doms =
-	let process_queue q requeue_test =
-		let d = pop q in
-		let before = d.Domain.conflict_credit in (* just for debug-logging *)
-		d.Domain.conflict_credit <- min (d.Domain.conflict_credit +. 1.0) !Define.conflict_burst_limit;
-		debug "incr_conflict_credit_from_queue: dom%d: %F -> %F" (Domain.get_id d) before d.Domain.conflict_credit;
-		if requeue_test d.Domain.conflict_credit then (
-			push d q (* Make it queue up again for its next point of credit. *)
-		)
-	in
-	let paused_queue_test cred = cred <= 0.0 in
-	let penalty_queue_test cred = cred < !Define.conflict_burst_limit in
-	try process_queue doms.doms_conflict_paused paused_queue_test
-	with Queue.Empty -> (
-		try process_queue doms.doms_with_conflict_penalty penalty_queue_test
-		with Queue.Empty -> () (* Both queues are empty: nothing to do here. *)
-	)
+  let process_queue q requeue_test =
+    let d = pop q in
+    let before = d.Domain.conflict_credit in (* just for debug-logging *)
+    d.Domain.conflict_credit <- min (d.Domain.conflict_credit +. 1.0) !Define.conflict_burst_limit;
+    debug "incr_conflict_credit_from_queue: dom%d: %F -> %F" (Domain.get_id d) before d.Domain.conflict_credit;
+    if requeue_test d.Domain.conflict_credit then (
+      push d q (* Make it queue up again for its next point of credit. *)
+    )
+  in
+  let paused_queue_test cred = cred <= 0.0 in
+  let penalty_queue_test cred = cred < !Define.conflict_burst_limit in
+  try process_queue doms.doms_conflict_paused paused_queue_test
+  with Queue.Empty -> (
+      try process_queue doms.doms_with_conflict_penalty penalty_queue_test
+      with Queue.Empty -> () (* Both queues are empty: nothing to do here. *)
+    )
 
 let incr_conflict_credit doms =
-	if !Define.conflict_rate_limit_is_aggregate
-	then incr_conflict_credit_from_queue doms
-	else (
-		(* Give a point of credit to every domain, subject only to the cap. *)
-		let inc dom =
-			let before = dom.Domain.conflict_credit in
-			let after = min (before +. 1.0) !Define.conflict_burst_limit in
-			dom.Domain.conflict_credit <- after;
-			debug "incr_conflict_credit dom%d: %F -> %F" (Domain.get_id dom) before after;
+  if !Define.conflict_rate_limit_is_aggregate
+  then incr_conflict_credit_from_queue doms
+  else (
+    (* Give a point of credit to every domain, subject only to the cap. *)
+    let inc dom =
+      let before = dom.Domain.conflict_credit in
+      let after = min (before +. 1.0) !Define.conflict_burst_limit in
+      dom.Domain.conflict_credit <- after;
+      debug "incr_conflict_credit dom%d: %F -> %F" (Domain.get_id dom) before after;
 
-			if before <= 0.0 && after > 0.0
-			then doms.n_paused <- doms.n_paused - 1;
+      if before <= 0.0 && after > 0.0
+      then doms.n_paused <- doms.n_paused - 1;
 
-			if before < !Define.conflict_burst_limit
-			&& after >= !Define.conflict_burst_limit
-			then doms.n_penalised <- doms.n_penalised - 1
-		in
-		if doms.n_penalised > 0 then iter doms inc
-	)
+      if before < !Define.conflict_burst_limit
+      && after >= !Define.conflict_burst_limit
+      then doms.n_penalised <- doms.n_penalised - 1
+    in
+    if doms.n_penalised > 0 then iter doms inc
+  )
diff --git a/tools/ocaml/xenstored/event.ml b/tools/ocaml/xenstored/event.ml
index 629dc6041b..3523c397f4 100644
--- a/tools/ocaml/xenstored/event.ml
+++ b/tools/ocaml/xenstored/event.ml
@@ -16,23 +16,23 @@
 
 (**************** high level binding ****************)
 type t = {
-	handle: Xeneventchn.handle;
-	domexc: Xeneventchn.t;
+  handle: Xeneventchn.handle;
+  domexc: Xeneventchn.t;
 }
 
 (* On clean start, both parameters will be None, and we must open the evtchn
    handle and bind the DOM_EXC VIRQ.  On Live Update, the fd is preserved
    across exec(), and the DOM_EXC VIRQ still bound. *)
 let init ?fd ?domexc_port () =
-	let handle = match fd with
-		| None -> Xeneventchn.init ~cloexec:false ()
-		| Some fd -> fd |> Utils.FD.of_int |> Xeneventchn.fdopen
-	in
-	let domexc = match domexc_port with
-		| None -> Xeneventchn.bind_dom_exc_virq handle
-		| Some p -> Xeneventchn.of_int p
-	in
-	{ handle; domexc }
+  let handle = match fd with
+    | None -> Xeneventchn.init ~cloexec:false ()
+    | Some fd -> fd |> Utils.FD.of_int |> Xeneventchn.fdopen
+  in
+  let domexc = match domexc_port with
+    | None -> Xeneventchn.bind_dom_exc_virq handle
+    | Some p -> Xeneventchn.of_int p
+  in
+  { handle; domexc }
 
 let fd eventchn = Xeneventchn.fd eventchn.handle
 let bind_interdomain eventchn domid port = Xeneventchn.bind_interdomain eventchn.handle domid port
@@ -42,6 +42,6 @@ let pending eventchn = Xeneventchn.pending eventchn.handle
 let unmask eventchn port = Xeneventchn.unmask eventchn.handle port
 
 let dump e chan =
-	Printf.fprintf chan "evtchn-dev,%d,%d\n"
-		       (Utils.FD.to_int @@ Xeneventchn.fd e.handle)
-		       (Xeneventchn.to_int e.domexc)
+  Printf.fprintf chan "evtchn-dev,%d,%d\n"
+    (Utils.FD.to_int @@ Xeneventchn.fd e.handle)
+    (Xeneventchn.to_int e.domexc)
diff --git a/tools/ocaml/xenstored/history.ml b/tools/ocaml/xenstored/history.ml
index ba5c9cb571..f03fb18329 100644
--- a/tools/ocaml/xenstored/history.ml
+++ b/tools/ocaml/xenstored/history.ml
@@ -13,11 +13,11 @@
  *)
 
 type history_record = {
-	con: Connection.t;   (* connection that made a change *)
-	tid: int;            (* transaction id of the change (may be Transaction.none) *)
-	before: Store.t;     (* the store before the change *)
-	after: Store.t;      (* the store after the change *)
-	finish_count: int64; (* the commit-count at which the transaction finished *)
+  con: Connection.t;   (* connection that made a change *)
+  tid: int;            (* transaction id of the change (may be Transaction.none) *)
+  before: Store.t;     (* the store before the change *)
+  after: Store.t;      (* the store after the change *)
+  finish_count: int64; (* the commit-count at which the transaction finished *)
 }
 
 let history : history_record list ref = ref []
@@ -26,38 +26,38 @@ let history : history_record list ref = ref []
 (* There is scope for optimisation here, replacing List.filter with something more efficient,
  * probably on a different list-like structure. *)
 let trim ?txn () =
-	Transaction.trim_short_running_transactions txn;
-	history := match Transaction.oldest_short_running_transaction () with
-	| None -> [] (* We have no open transaction, so no history is needed *)
-	| Some (_, txn) -> (
-		(* keep records with finish_count recent enough to be relevant *)
-		List.filter (fun r -> r.finish_count > txn.Transaction.start_count) !history
-	)
+  Transaction.trim_short_running_transactions txn;
+  history := match Transaction.oldest_short_running_transaction () with
+    | None -> [] (* We have no open transaction, so no history is needed *)
+    | Some (_, txn) -> (
+        (* keep records with finish_count recent enough to be relevant *)
+        List.filter (fun r -> r.finish_count > txn.Transaction.start_count) !history
+      )
 
 let end_transaction txn con tid commit =
-	let success = Connection.end_transaction con tid commit in
-	trim ~txn ();
-	success
+  let success = Connection.end_transaction con tid commit in
+  trim ~txn ();
+  success
 
 let reconnect con =
-	trim ();
-	Connection.do_reconnect con
+  trim ();
+  Connection.do_reconnect con
 
 let push (x: history_record) =
-	let dom = x.con.Connection.dom in
-	match dom with
-	| None -> () (* treat socket connections as always free to conflict *)
-	| Some d -> if not (Domain.is_free_to_conflict d) then history := x :: !history
+  let dom = x.con.Connection.dom in
+  match dom with
+  | None -> () (* treat socket connections as always free to conflict *)
+  | Some d -> if not (Domain.is_free_to_conflict d) then history := x :: !history
 
 (* Find the connections from records since commit-count [since] for which [f record] returns [true] *)
 let filter_connections ~ignore ~since ~f =
-	(* The "mem" call is an optimisation, to avoid calling f if we have picked con already. *)
-	(* Using a hash table rather than a list is to optimise the "mem" call. *)
-	List.fold_left (fun acc hist_rec ->
-		if hist_rec.finish_count > since
-		&& not (hist_rec.con == ignore)
-		&& not (Hashtbl.mem acc hist_rec.con)
-		&& f hist_rec
-		then Hashtbl.replace acc hist_rec.con ();
-		acc
-	) (Hashtbl.create 1023) !history
+  (* The "mem" call is an optimisation, to avoid calling f if we have picked con already. *)
+  (* Using a hash table rather than a list is to optimise the "mem" call. *)
+  List.fold_left (fun acc hist_rec ->
+      if hist_rec.finish_count > since
+      && not (hist_rec.con == ignore)
+      && not (Hashtbl.mem acc hist_rec.con)
+      && f hist_rec
+      then Hashtbl.replace acc hist_rec.con ();
+      acc
+    ) (Hashtbl.create 1023) !history
diff --git a/tools/ocaml/xenstored/logging.ml b/tools/ocaml/xenstored/logging.ml
index f233bc9a39..0c525d6ff7 100644
--- a/tools/ocaml/xenstored/logging.ml
+++ b/tools/ocaml/xenstored/logging.ml
@@ -21,138 +21,138 @@ open Printf
 (* Logger common *)
 
 type log_destination =
-	| File of string
-	| Syslog of Syslog.facility
+  | File of string
+  | Syslog of Syslog.facility
 
 let log_destination_of_string s =
-	let prefix = "syslog:" in
-	let len_prefix = String.length prefix in
-	let len = String.length s in
-	if String.startswith prefix s
-	then Syslog(Syslog.facility_of_string (String.sub s len_prefix (len - len_prefix)))
-	else File s
+  let prefix = "syslog:" in
+  let len_prefix = String.length prefix in
+  let len = String.length s in
+  if String.startswith prefix s
+  then Syslog(Syslog.facility_of_string (String.sub s len_prefix (len - len_prefix)))
+  else File s
 
 (* The prefix of a log line depends on the log destination *)
 let prefix log_destination ?level ?key date = match log_destination with
-	| File _ ->
-		let level = match level with
-			| Some x -> Printf.sprintf "|%5s" x
-			| None -> "" in
-		let key = match key with
-			| Some x -> "|" ^ x
-			| None -> "" in
-		Printf.sprintf "[%s%s%s] " date level key
-	| Syslog _ ->
-		let key = match key with
-			| Some x -> "[" ^ x ^ "] "
-			| None -> "" in
-		(* Syslog handles the date and level internally *)
-		key
+  | File _ ->
+    let level = match level with
+      | Some x -> Printf.sprintf "|%5s" x
+      | None -> "" in
+    let key = match key with
+      | Some x -> "|" ^ x
+      | None -> "" in
+    Printf.sprintf "[%s%s%s] " date level key
+  | Syslog _ ->
+    let key = match key with
+      | Some x -> "[" ^ x ^ "] "
+      | None -> "" in
+    (* Syslog handles the date and level internally *)
+    key
 
 type level = Debug | Info | Warn | Error | Null
 
 type logger =
-		{ stop: unit -> unit;
-		  restart: unit -> unit;
-		  rotate: unit -> unit;
-		  write: ?level:level -> string -> unit }
+  { stop: unit -> unit;
+    restart: unit -> unit;
+    rotate: unit -> unit;
+    write: ?level:level -> string -> unit }
 
 let truncate_line nb_chars line =
-	if String.length line > nb_chars - 1 then
-		let len = max (nb_chars - 1) 2 in
-		let dst_line = Bytes.create len in
-		Bytes.blit_string line 0 dst_line 0 (len - 2);
-		Bytes.set dst_line (len-2) '.';
-		Bytes.set dst_line (len-1) '.';
-		Bytes.unsafe_to_string dst_line
-	else line
+  if String.length line > nb_chars - 1 then
+    let len = max (nb_chars - 1) 2 in
+    let dst_line = Bytes.create len in
+    Bytes.blit_string line 0 dst_line 0 (len - 2);
+    Bytes.set dst_line (len-2) '.';
+    Bytes.set dst_line (len-1) '.';
+    Bytes.unsafe_to_string dst_line
+  else line
 
 let log_rotate ref_ch log_file log_nb_files =
-	let file n = sprintf "%s.%i" log_file n in
-	let log_files =
-		let rec aux accu n =
-			if n >= log_nb_files then accu
-			else
-				if n = 1 && Sys.file_exists log_file
-				then aux [log_file,1] 2
-				else
-					let file = file (n-1) in
-					if Sys.file_exists file then
-						aux ((file, n) :: accu) (n+1)
-					else accu in
-		aux [] 1 in
-	List.iter (fun (f, n) -> Unix.rename f (file n)) log_files;
-	close_out !ref_ch;
-	ref_ch := open_out log_file
+  let file n = sprintf "%s.%i" log_file n in
+  let log_files =
+    let rec aux accu n =
+      if n >= log_nb_files then accu
+      else
+      if n = 1 && Sys.file_exists log_file
+      then aux [log_file,1] 2
+      else
+        let file = file (n-1) in
+        if Sys.file_exists file then
+          aux ((file, n) :: accu) (n+1)
+        else accu in
+    aux [] 1 in
+  List.iter (fun (f, n) -> Unix.rename f (file n)) log_files;
+  close_out !ref_ch;
+  ref_ch := open_out log_file
 
 let make_file_logger log_file log_nb_files log_nb_lines log_nb_chars post_rotate =
-	let channel = ref (open_out_gen [Open_append; Open_creat] 0o644 log_file) in
-	let counter = ref 0 in
-	let stop() =
-		try flush !channel; close_out !channel
-		with _ -> () in
-	let restart() =
-		stop();
-		channel := open_out_gen [Open_append; Open_creat] 0o644 log_file in
-	let rotate() =
-		log_rotate channel log_file log_nb_files;
-		(post_rotate (): unit);
-		counter := 0 in
-	let write ?level:_ s =
-		let s = if log_nb_chars > 0 then truncate_line log_nb_chars s else s in
-		let s = s ^ "\n" in
-		output_string !channel s;
-		flush !channel;
-		incr counter;
-		if !counter > log_nb_lines then rotate() in
-	{ stop=stop; restart=restart; rotate=rotate; write=write }
+  let channel = ref (open_out_gen [Open_append; Open_creat] 0o644 log_file) in
+  let counter = ref 0 in
+  let stop() =
+    try flush !channel; close_out !channel
+    with _ -> () in
+  let restart() =
+    stop();
+    channel := open_out_gen [Open_append; Open_creat] 0o644 log_file in
+  let rotate() =
+    log_rotate channel log_file log_nb_files;
+    (post_rotate (): unit);
+    counter := 0 in
+  let write ?level:_ s =
+    let s = if log_nb_chars > 0 then truncate_line log_nb_chars s else s in
+    let s = s ^ "\n" in
+    output_string !channel s;
+    flush !channel;
+    incr counter;
+    if !counter > log_nb_lines then rotate() in
+  { stop=stop; restart=restart; rotate=rotate; write=write }
 
 exception Unknown_level of string
 
 let int_of_level = function
-	| Debug -> 0 | Info -> 1 | Warn -> 2
-	| Error -> 3 | Null -> max_int
+  | Debug -> 0 | Info -> 1 | Warn -> 2
+  | Error -> 3 | Null -> max_int
 
 let string_of_level = function
-	| Debug -> "debug" | Info -> "info" | Warn -> "warn"
-	| Error -> "error" | Null -> "null"
+  | Debug -> "debug" | Info -> "info" | Warn -> "warn"
+  | Error -> "error" | Null -> "null"
 
 let level_of_string = function
-	| "debug" -> Debug | "info"  -> Info | "warn"  -> Warn
-	| "error" -> Error | "null"  -> Null | s  -> raise (Unknown_level s)
+  | "debug" -> Debug | "info"  -> Info | "warn"  -> Warn
+  | "error" -> Error | "null"  -> Null | s  -> raise (Unknown_level s)
 
 let string_of_date () =
-	let time = Unix.gettimeofday () in
-	let tm = Unix.gmtime time in
-	let msec = time -. (floor time) in
-	sprintf "%d%.2d%.2dT%.2d:%.2d:%.2d.%.3dZ"
-		(1900 + tm.Unix.tm_year) (tm.Unix.tm_mon + 1) tm.Unix.tm_mday
-		tm.Unix.tm_hour tm.Unix.tm_min tm.Unix.tm_sec
-		(int_of_float (1000.0 *. msec))
+  let time = Unix.gettimeofday () in
+  let tm = Unix.gmtime time in
+  let msec = time -. (floor time) in
+  sprintf "%d%.2d%.2dT%.2d:%.2d:%.2d.%.3dZ"
+    (1900 + tm.Unix.tm_year) (tm.Unix.tm_mon + 1) tm.Unix.tm_mday
+    tm.Unix.tm_hour tm.Unix.tm_min tm.Unix.tm_sec
+    (int_of_float (1000.0 *. msec))
 
 (* We can defer to syslog for log management *)
 let make_syslog_logger facility =
-	(* When TZ is unset in the environment, each syslog call will stat the
-	   /etc/localtime file at least three times during the process. We'd like to
-	   avoid this cost given that we are not a mobile environment and we log
-	   almost every xenstore entry update/watch. *)
-	let () =
-		let tz_is_set =
-			try String.length (Unix.getenv "TZ") > 0
-			with Not_found -> false in
-		if not tz_is_set then Unix.putenv "TZ" "/etc/localtime" in
-	let nothing () = () in
-	let write ?level s =
-		let level = match level with
-			| Some Error -> Syslog.Err
-			| Some Warn -> Syslog.Warning
-			| Some Info -> Syslog.Info
-			| Some Debug -> Syslog.Debug
-			| Some Null -> Syslog.Debug
-			| None -> Syslog.Debug in
-		(* Syslog handles the date and level internally *)
-		Syslog.log facility level s in
-	{ stop = nothing; restart = nothing; rotate = nothing; write=write }
+  (* When TZ is unset in the environment, each syslog call will stat the
+     	   /etc/localtime file at least three times during the process. We'd like to
+     	   avoid this cost given that we are not a mobile environment and we log
+     	   almost every xenstore entry update/watch. *)
+  let () =
+    let tz_is_set =
+      try String.length (Unix.getenv "TZ") > 0
+      with Not_found -> false in
+    if not tz_is_set then Unix.putenv "TZ" "/etc/localtime" in
+  let nothing () = () in
+  let write ?level s =
+    let level = match level with
+      | Some Error -> Syslog.Err
+      | Some Warn -> Syslog.Warning
+      | Some Info -> Syslog.Info
+      | Some Debug -> Syslog.Debug
+      | Some Null -> Syslog.Debug
+      | None -> Syslog.Debug in
+    (* Syslog handles the date and level internally *)
+    Syslog.log facility level s in
+  { stop = nothing; restart = nothing; rotate = nothing; write=write }
 
 let xenstored_log_destination = ref (File (Paths.xen_log_dir ^ "/xenstored.log"))
 let xenstored_log_level = ref Warn
@@ -164,34 +164,34 @@ let xenstored_logger = ref (None: logger option)
 let debug_enabled () = !xenstored_log_level = Debug
 
 let set_xenstored_log_destination s =
-	xenstored_log_destination := log_destination_of_string s
+  xenstored_log_destination := log_destination_of_string s
 
 let set_xenstored_logger logger =
-	xenstored_logger := Some logger;
-	logger.write ~level:Info (Printf.sprintf "Xen Storage Daemon, version %d.%d"
-	Define.xenstored_major Define.xenstored_minor)
+  xenstored_logger := Some logger;
+  logger.write ~level:Info (Printf.sprintf "Xen Storage Daemon, version %d.%d"
+                              Define.xenstored_major Define.xenstored_minor)
 
 
 let init_xenstored_log () = match !xenstored_log_destination with
-	| File file ->
-		if !xenstored_log_level <> Null && !xenstored_log_nb_files > 0 then
-			let logger =
-				make_file_logger
-					file !xenstored_log_nb_files !xenstored_log_nb_lines
-					!xenstored_log_nb_chars ignore in
-			set_xenstored_logger logger
-	| Syslog facility ->
-		set_xenstored_logger (make_syslog_logger facility)
+  | File file ->
+    if !xenstored_log_level <> Null && !xenstored_log_nb_files > 0 then
+      let logger =
+        make_file_logger
+          file !xenstored_log_nb_files !xenstored_log_nb_lines
+          !xenstored_log_nb_chars ignore in
+      set_xenstored_logger logger
+  | Syslog facility ->
+    set_xenstored_logger (make_syslog_logger facility)
 
 
 let xenstored_logging level key (fmt: (_,_,_,_) format4) =
-	match !xenstored_logger with
-	| Some logger when int_of_level level >= int_of_level !xenstored_log_level ->
-			let date = string_of_date() in
-			let level' = string_of_level level in
-			let prefix = prefix !xenstored_log_destination ~level:level' ~key date in
-			Printf.ksprintf (fun s -> logger.write ~level (prefix ^ s)) fmt
-	| _ -> Printf.ksprintf ignore fmt
+  match !xenstored_logger with
+  | Some logger when int_of_level level >= int_of_level !xenstored_log_level ->
+    let date = string_of_date() in
+    let level' = string_of_level level in
+    let prefix = prefix !xenstored_log_destination ~level:level' ~key date in
+    Printf.ksprintf (fun s -> logger.write ~level (prefix ^ s)) fmt
+  | _ -> Printf.ksprintf ignore fmt
 
 let debug key = xenstored_logging Debug key
 let info key = xenstored_logging Info key
@@ -201,66 +201,66 @@ let error key = xenstored_logging Error key
 (* Access logger *)
 
 type access_type =
-	| Coalesce
-	| Conflict
-	| Commit
-	| Newconn
-	| Endconn
-	| Watch_not_fired
-	| XbOp of Xenbus.Xb.Op.operation
+  | Coalesce
+  | Conflict
+  | Commit
+  | Newconn
+  | Endconn
+  | Watch_not_fired
+  | XbOp of Xenbus.Xb.Op.operation
 
 let string_of_tid ~con tid =
-	if tid = 0
-	then sprintf "%-12s" con
-	else sprintf "%-12s" (sprintf "%s.%i" con tid)
+  if tid = 0
+  then sprintf "%-12s" con
+  else sprintf "%-12s" (sprintf "%s.%i" con tid)
 
 let string_of_access_type = function
-	| Coalesce                -> "coalesce "
-	| Conflict                -> "conflict "
-	| Commit                  -> "commit   "
-	| Newconn                 -> "newconn  "
-	| Endconn                 -> "endconn  "
-	| Watch_not_fired         -> "w notfired"
+  | Coalesce                -> "coalesce "
+  | Conflict                -> "conflict "
+  | Commit                  -> "commit   "
+  | Newconn                 -> "newconn  "
+  | Endconn                 -> "endconn  "
+  | Watch_not_fired         -> "w notfired"
 
-	| XbOp op -> match op with
-	| Xenbus.Xb.Op.Debug             -> "debug    "
+  | XbOp op -> match op with
+    | Xenbus.Xb.Op.Debug             -> "debug    "
 
-	| Xenbus.Xb.Op.Directory         -> "directory"
-	| Xenbus.Xb.Op.Read              -> "read     "
-	| Xenbus.Xb.Op.Getperms          -> "getperms "
+    | Xenbus.Xb.Op.Directory         -> "directory"
+    | Xenbus.Xb.Op.Read              -> "read     "
+    | Xenbus.Xb.Op.Getperms          -> "getperms "
 
-	| Xenbus.Xb.Op.Watch             -> "watch    "
-	| Xenbus.Xb.Op.Unwatch           -> "unwatch  "
+    | Xenbus.Xb.Op.Watch             -> "watch    "
+    | Xenbus.Xb.Op.Unwatch           -> "unwatch  "
 
-	| Xenbus.Xb.Op.Transaction_start -> "t start  "
-	| Xenbus.Xb.Op.Transaction_end   -> "t end    "
+    | Xenbus.Xb.Op.Transaction_start -> "t start  "
+    | Xenbus.Xb.Op.Transaction_end   -> "t end    "
 
-	| Xenbus.Xb.Op.Introduce         -> "introduce"
-	| Xenbus.Xb.Op.Release           -> "release  "
-	| Xenbus.Xb.Op.Getdomainpath     -> "getdomain"
-	| Xenbus.Xb.Op.Isintroduced      -> "is introduced"
-	| Xenbus.Xb.Op.Resume            -> "resume   "
+    | Xenbus.Xb.Op.Introduce         -> "introduce"
+    | Xenbus.Xb.Op.Release           -> "release  "
+    | Xenbus.Xb.Op.Getdomainpath     -> "getdomain"
+    | Xenbus.Xb.Op.Isintroduced      -> "is introduced"
+    | Xenbus.Xb.Op.Resume            -> "resume   "
 
-	| Xenbus.Xb.Op.Write             -> "write    "
-	| Xenbus.Xb.Op.Mkdir             -> "mkdir    "
-	| Xenbus.Xb.Op.Rm                -> "rm       "
-	| Xenbus.Xb.Op.Setperms          -> "setperms "
-	| Xenbus.Xb.Op.Reset_watches     -> "reset watches"
-	| Xenbus.Xb.Op.Set_target        -> "settarget"
+    | Xenbus.Xb.Op.Write             -> "write    "
+    | Xenbus.Xb.Op.Mkdir             -> "mkdir    "
+    | Xenbus.Xb.Op.Rm                -> "rm       "
+    | Xenbus.Xb.Op.Setperms          -> "setperms "
+    | Xenbus.Xb.Op.Reset_watches     -> "reset watches"
+    | Xenbus.Xb.Op.Set_target        -> "settarget"
 
-	| Xenbus.Xb.Op.Error             -> "error    "
-	| Xenbus.Xb.Op.Watchevent        -> "w event  "
-	| Xenbus.Xb.Op.Invalid           -> "invalid  "
-	(*
+    | Xenbus.Xb.Op.Error             -> "error    "
+    | Xenbus.Xb.Op.Watchevent        -> "w event  "
+    | Xenbus.Xb.Op.Invalid           -> "invalid  "
+ (*
 	| x                       -> Xenbus.Xb.Op.to_string x
 	*)
 
 let sanitize_data data =
-	let data = String.init
-		(String.length data)
-		(fun i -> let c = data.[i] in if c = '\000' then ' ' else c)
-	in
-	String.escaped data
+  let data = String.init
+      (String.length data)
+      (fun i -> let c = data.[i] in if c = '\000' then ' ' else c)
+  in
+  String.escaped data
 
 let activate_access_log = ref true
 let access_log_destination = ref (File (Paths.xen_log_dir ^ "/xenstored-access.log"))
@@ -273,101 +273,101 @@ let access_log_special_ops = ref false
 let access_logger = ref None
 
 let set_access_log_destination s =
-	access_log_destination := log_destination_of_string s
+  access_log_destination := log_destination_of_string s
 
 let init_access_log post_rotate = match !access_log_destination with
-	| File file ->
-		if !access_log_nb_files > 0 then
-			let logger =
-				make_file_logger
-					file !access_log_nb_files !access_log_nb_lines
-					!access_log_nb_chars post_rotate in
-			access_logger := Some logger
-	| Syslog facility ->
-		access_logger := Some (make_syslog_logger facility)
+  | File file ->
+    if !access_log_nb_files > 0 then
+      let logger =
+        make_file_logger
+          file !access_log_nb_files !access_log_nb_lines
+          !access_log_nb_chars post_rotate in
+      access_logger := Some logger
+  | Syslog facility ->
+    access_logger := Some (make_syslog_logger facility)
 
 let access_logging ~con ~tid ?(data="") ~level access_type =
-        try
-		maybe
-			(fun logger ->
-				let date = string_of_date() in
-				let tid = string_of_tid ~con tid in
-				let access_type = string_of_access_type access_type in
-				let data = sanitize_data data in
-				let prefix = prefix !access_log_destination date in
-				let msg = Printf.sprintf "%s %s %s %s" prefix tid access_type data in
-				logger.write ~level msg)
-			!access_logger
-	with _ -> ()
+  try
+    maybe
+      (fun logger ->
+         let date = string_of_date() in
+         let tid = string_of_tid ~con tid in
+         let access_type = string_of_access_type access_type in
+         let data = sanitize_data data in
+         let prefix = prefix !access_log_destination date in
+         let msg = Printf.sprintf "%s %s %s %s" prefix tid access_type data in
+         logger.write ~level msg)
+      !access_logger
+  with _ -> ()
 
 let new_connection = access_logging ~level:Debug Newconn
 let end_connection = access_logging ~level:Debug Endconn
 let read_coalesce ~tid ~con data =
-	if !access_log_read_ops
-        then access_logging Coalesce ~tid ~con ~data:("read "^data) ~level:Debug
+  if !access_log_read_ops
+  then access_logging Coalesce ~tid ~con ~data:("read "^data) ~level:Debug
 let write_coalesce data = access_logging Coalesce ~data:("write "^data) ~level:Debug
 let conflict = access_logging Conflict ~level:Debug
 let commit = access_logging Commit ~level:Debug
 
 let xb_op ~tid ~con ~ty data =
-	let print = match ty with
-		| Xenbus.Xb.Op.Read | Xenbus.Xb.Op.Directory | Xenbus.Xb.Op.Getperms -> !access_log_read_ops
-		| Xenbus.Xb.Op.Transaction_start | Xenbus.Xb.Op.Transaction_end ->
-			false (* transactions are managed below *)
-		| Xenbus.Xb.Op.Introduce | Xenbus.Xb.Op.Release | Xenbus.Xb.Op.Getdomainpath | Xenbus.Xb.Op.Isintroduced | Xenbus.Xb.Op.Resume ->
-			!access_log_special_ops
-		| _ -> true in
-	if print then access_logging ~tid ~con ~data (XbOp ty) ~level:Info
+  let print = match ty with
+    | Xenbus.Xb.Op.Read | Xenbus.Xb.Op.Directory | Xenbus.Xb.Op.Getperms -> !access_log_read_ops
+    | Xenbus.Xb.Op.Transaction_start | Xenbus.Xb.Op.Transaction_end ->
+      false (* transactions are managed below *)
+    | Xenbus.Xb.Op.Introduce | Xenbus.Xb.Op.Release | Xenbus.Xb.Op.Getdomainpath | Xenbus.Xb.Op.Isintroduced | Xenbus.Xb.Op.Resume ->
+      !access_log_special_ops
+    | _ -> true in
+  if print then access_logging ~tid ~con ~data (XbOp ty) ~level:Info
 
 let start_transaction ~tid ~con =
-	if !access_log_transaction_ops && tid <> 0
-	then access_logging ~tid ~con (XbOp Xenbus.Xb.Op.Transaction_start) ~level:Debug
+  if !access_log_transaction_ops && tid <> 0
+  then access_logging ~tid ~con (XbOp Xenbus.Xb.Op.Transaction_start) ~level:Debug
 
 let end_transaction ~tid ~con =
-	if !access_log_transaction_ops && tid <> 0
-	then access_logging ~tid ~con (XbOp Xenbus.Xb.Op.Transaction_end) ~level:Debug
+  if !access_log_transaction_ops && tid <> 0
+  then access_logging ~tid ~con (XbOp Xenbus.Xb.Op.Transaction_end) ~level:Debug
 
 let live_update () =
-	xb_op ~tid:0 ~con:"" ~ty:Xenbus.Xb.Op.Debug "Live update begin"
+  xb_op ~tid:0 ~con:"" ~ty:Xenbus.Xb.Op.Debug "Live update begin"
 
 let xb_answer ~tid ~con ~ty data =
-	let print, level = match ty with
-		| Xenbus.Xb.Op.Error when String.startswith "ENOENT" data -> !access_log_read_ops , Warn
-		| Xenbus.Xb.Op.Error -> true , Warn
-		| Xenbus.Xb.Op.Watchevent -> true , Info
-		| _ -> false, Debug
-	in
-	if print then access_logging ~tid ~con ~data (XbOp ty) ~level
+  let print, level = match ty with
+    | Xenbus.Xb.Op.Error when String.startswith "ENOENT" data -> !access_log_read_ops , Warn
+    | Xenbus.Xb.Op.Error -> true , Warn
+    | Xenbus.Xb.Op.Watchevent -> true , Info
+    | _ -> false, Debug
+  in
+  if print then access_logging ~tid ~con ~data (XbOp ty) ~level
 
 let watch_not_fired ~con perms path =
-	let data = Printf.sprintf "EPERM perms=[%s] path=%s" perms path in
-	access_logging ~tid:0 ~con ~data Watch_not_fired ~level:Info
+  let data = Printf.sprintf "EPERM perms=[%s] path=%s" perms path in
+  access_logging ~tid:0 ~con ~data Watch_not_fired ~level:Info
 
 let msg_of exn bt =
-	Printf.sprintf "Fatal exception: %s\n%s" (Printexc.to_string exn)
-		(Printexc.raw_backtrace_to_string bt)
+  Printf.sprintf "Fatal exception: %s\n%s" (Printexc.to_string exn)
+    (Printexc.raw_backtrace_to_string bt)
 
 let fallback_exception_handler exn bt =
-	(* stderr goes to /dev/null, so use the logger where possible,
-	   but always print to stderr too, in case everything else fails,
-	   e.g. this can be used to debug with --no-fork
+  (* stderr goes to /dev/null, so use the logger where possible,
+     	   but always print to stderr too, in case everything else fails,
+     	   e.g. this can be used to debug with --no-fork
 
-	   this function should try not to raise exceptions, but if it does
-	   the ocaml runtime should still print the exception, both the original,
-	   and the one from this function, but to stderr this time
-	 *)
-	let msg = msg_of exn bt in
-	prerr_endline msg;
-	(* See Printexc.set_uncaught_exception_handler, need to flush,
-	   so has to call stop and flush *)
-	match !xenstored_logger with
-	| Some l -> error "xenstored-fallback" "%s" msg; l.stop ()
-	| None ->
-		(* Too early, no logger set yet.
-		   We normally try to use the configured logger so we don't flood syslog
-		   during development for example, or if the user has a file set
-		 *)
-		try Syslog.log Syslog.Daemon Syslog.Err msg
-		with e ->
-			let bt = Printexc.get_raw_backtrace () in
-			prerr_endline @@ msg_of e bt
+     	   this function should try not to raise exceptions, but if it does
+     	   the ocaml runtime should still print the exception, both the original,
+     	   and the one from this function, but to stderr this time
+     	 *)
+  let msg = msg_of exn bt in
+  prerr_endline msg;
+  (* See Printexc.set_uncaught_exception_handler, need to flush,
+     	   so has to call stop and flush *)
+  match !xenstored_logger with
+  | Some l -> error "xenstored-fallback" "%s" msg; l.stop ()
+  | None ->
+    (* Too early, no logger set yet.
+       		   We normally try to use the configured logger so we don't flood syslog
+       		   during development for example, or if the user has a file set
+       		 *)
+    try Syslog.log Syslog.Daemon Syslog.Err msg
+    with e ->
+      let bt = Printexc.get_raw_backtrace () in
+      prerr_endline @@ msg_of e bt
diff --git a/tools/ocaml/xenstored/packet.ml b/tools/ocaml/xenstored/packet.ml
index aeae0a4f57..7c25117937 100644
--- a/tools/ocaml/xenstored/packet.ml
+++ b/tools/ocaml/xenstored/packet.ml
@@ -1,16 +1,16 @@
 type request = {
-	tid: int;
-	rid: int;
-	ty: Xenbus.Xb.Op.operation;
-	data: string;
+  tid: int;
+  rid: int;
+  ty: Xenbus.Xb.Op.operation;
+  data: string;
 }
 
 type response =
-	| Ack of (unit -> unit)  (* function is the action to execute after sending the ack *)
-	| Reply of string
-	| Error of string
+  | Ack of (unit -> unit)  (* function is the action to execute after sending the ack *)
+  | Reply of string
+  | Error of string
 
 let response_equal a b =
-	match (a, b) with
-	| (Ack _, Ack _) -> true (* just consider the response, not the post-response action *)
-	| (x, y) -> x = y
+  match (a, b) with
+  | (Ack _, Ack _) -> true (* just consider the response, not the post-response action *)
+  | (x, y) -> x = y
diff --git a/tools/ocaml/xenstored/parse_arg.ml b/tools/ocaml/xenstored/parse_arg.ml
index 7c0478e76a..1a85b14ef5 100644
--- a/tools/ocaml/xenstored/parse_arg.ml
+++ b/tools/ocaml/xenstored/parse_arg.ml
@@ -15,59 +15,59 @@
  *)
 
 type config =
-{
-	domain_init: bool;
-	activate_access_log: bool;
-	daemonize: bool;
-	reraise_top_level: bool;
-	config_file: string option;
-	pidfile: string option; (* old xenstored compatibility *)
-	tracefile: string option; (* old xenstored compatibility *)
-	restart: bool;
-	live_reload: bool;
-	disable_socket: bool;
-}
+  {
+    domain_init: bool;
+    activate_access_log: bool;
+    daemonize: bool;
+    reraise_top_level: bool;
+    config_file: string option;
+    pidfile: string option; (* old xenstored compatibility *)
+    tracefile: string option; (* old xenstored compatibility *)
+    restart: bool;
+    live_reload: bool;
+    disable_socket: bool;
+  }
 
 let do_argv =
-	let pidfile = ref "" and tracefile = ref "" (* old xenstored compatibility *)
-	and domain_init = ref true
-	and activate_access_log = ref true
-	and daemonize = ref true
-	and reraise_top_level = ref false
-	and config_file = ref ""
-	and restart = ref false
-	and live_reload = ref false
-	and disable_socket = ref false
-	in
+  let pidfile = ref "" and tracefile = ref "" (* old xenstored compatibility *)
+  and domain_init = ref true
+  and activate_access_log = ref true
+  and daemonize = ref true
+  and reraise_top_level = ref false
+  and config_file = ref ""
+  and restart = ref false
+  and live_reload = ref false
+  and disable_socket = ref false
+  in
 
-	let speclist =
-		[ ("--no-domain-init", Arg.Unit (fun () -> domain_init := false),
-		   "to state that xenstored should not initialise dom0");
-		  ("--config-file", Arg.Set_string config_file,
-		   "set an alternative location for the configuration file");
-		  ("--no-fork", Arg.Unit (fun () -> daemonize := false),
-		   "to request that the daemon does not fork");
-		  ("--reraise-top-level", Arg.Unit (fun () -> reraise_top_level := true),
-		   "reraise exceptions caught at the top level");
-		  ("--no-access-log", Arg.Unit (fun () -> activate_access_log := false),
-		  "do not create a xenstore-access.log file");
-		  ("--pid-file", Arg.Set_string pidfile, ""); (* for compatibility *)
-		  ("-T", Arg.Set_string tracefile, ""); (* for compatibility *)
-		  ("--restart", Arg.Set restart, "Read database on starting");
-		  ("--live", Arg.Set live_reload, "Read live dump on startup");
-		  ("--disable-socket", Arg.Unit (fun () -> disable_socket := true), "Disable socket");
-		] in
-	let usage_msg = "usage : xenstored [--config-file <filename>] [--no-domain-init] [--help] [--no-fork] [--reraise-top-level] [--restart] [--disable-socket]" in
-	Arg.parse speclist (fun _ -> ()) usage_msg;
-	{
-		domain_init = !domain_init;
-		activate_access_log = !activate_access_log;
-		daemonize = !daemonize;
-		reraise_top_level = !reraise_top_level;
-		config_file = if !config_file <> "" then Some !config_file else None;
-		pidfile = if !pidfile <> "" then Some !pidfile else None;
-		tracefile = if !tracefile <> "" then Some !tracefile else None;
-		restart = !restart;
-		live_reload = !live_reload;
-		disable_socket = !disable_socket;
-	}
+  let speclist =
+    [ ("--no-domain-init", Arg.Unit (fun () -> domain_init := false),
+       "to state that xenstored should not initialise dom0");
+      ("--config-file", Arg.Set_string config_file,
+       "set an alternative location for the configuration file");
+      ("--no-fork", Arg.Unit (fun () -> daemonize := false),
+       "to request that the daemon does not fork");
+      ("--reraise-top-level", Arg.Unit (fun () -> reraise_top_level := true),
+       "reraise exceptions caught at the top level");
+      ("--no-access-log", Arg.Unit (fun () -> activate_access_log := false),
+       "do not create a xenstore-access.log file");
+      ("--pid-file", Arg.Set_string pidfile, ""); (* for compatibility *)
+      ("-T", Arg.Set_string tracefile, ""); (* for compatibility *)
+      ("--restart", Arg.Set restart, "Read database on starting");
+      ("--live", Arg.Set live_reload, "Read live dump on startup");
+      ("--disable-socket", Arg.Unit (fun () -> disable_socket := true), "Disable socket");
+    ] in
+  let usage_msg = "usage : xenstored [--config-file <filename>] [--no-domain-init] [--help] [--no-fork] [--reraise-top-level] [--restart] [--disable-socket]" in
+  Arg.parse speclist (fun _ -> ()) usage_msg;
+  {
+    domain_init = !domain_init;
+    activate_access_log = !activate_access_log;
+    daemonize = !daemonize;
+    reraise_top_level = !reraise_top_level;
+    config_file = if !config_file <> "" then Some !config_file else None;
+    pidfile = if !pidfile <> "" then Some !pidfile else None;
+    tracefile = if !tracefile <> "" then Some !tracefile else None;
+    restart = !restart;
+    live_reload = !live_reload;
+    disable_socket = !disable_socket;
+  }
diff --git a/tools/ocaml/xenstored/perms.ml b/tools/ocaml/xenstored/perms.ml
index 84f2503e8e..14f8e334fe 100644
--- a/tools/ocaml/xenstored/perms.ml
+++ b/tools/ocaml/xenstored/perms.ml
@@ -25,72 +25,72 @@ let watch_activate = ref true
 type permty = READ | WRITE | RDWR | NONE
 
 let char_of_permty perm =
-	match perm with
-	| READ -> 'r'
-	| WRITE -> 'w'
-	| RDWR -> 'b'
-	| NONE -> 'n'
+  match perm with
+  | READ -> 'r'
+  | WRITE -> 'w'
+  | RDWR -> 'b'
+  | NONE -> 'n'
 
 let permty_of_char c =
-	match c with
-	| 'r' -> READ
-	| 'w' -> WRITE
-	| 'b' -> RDWR
-	| 'n' -> NONE
-	| _ -> invalid_arg "unknown permission type"
+  match c with
+  | 'r' -> READ
+  | 'w' -> WRITE
+  | 'b' -> RDWR
+  | 'n' -> NONE
+  | _ -> invalid_arg "unknown permission type"
 
 
 (* node permissions *)
 module Node =
 struct
 
-type t =
-{
-	owner: Xenctrl.domid;
-	other: permty;
-	acl: (Xenctrl.domid * permty) list;
-}
+  type t =
+    {
+      owner: Xenctrl.domid;
+      other: permty;
+      acl: (Xenctrl.domid * permty) list;
+    }
 
-let create owner other acl =
-	{ owner = owner; other = other; acl = acl }
+  let create owner other acl =
+    { owner = owner; other = other; acl = acl }
 
-let get_other perms = perms.other
-let get_acl perms = perms.acl
-let get_owner perm = perm.owner
+  let get_other perms = perms.other
+  let get_acl perms = perms.acl
+  let get_owner perm = perm.owner
 
-(** [remote_domid ~domid perm] removes all ACLs for [domid] from perm.
-* If [domid] was the owner then it is changed to Dom0.
-* This is used for cleaning up after dead domains.
-* *)
-let remove_domid ~domid perm =
-	let acl = List.filter (fun (acl_domid, _) -> acl_domid <> domid) perm.acl in
-	if perm.owner = domid then None else Some { perm with acl; owner = perm.owner }
+  (** [remote_domid ~domid perm] removes all ACLs for [domid] from perm.
+   * If [domid] was the owner then it is changed to Dom0.
+   * This is used for cleaning up after dead domains.
+   * *)
+  let remove_domid ~domid perm =
+    let acl = List.filter (fun (acl_domid, _) -> acl_domid <> domid) perm.acl in
+    if perm.owner = domid then None else Some { perm with acl; owner = perm.owner }
 
-let default0 = create 0 NONE []
+  let default0 = create 0 NONE []
 
-let perm_of_string s =
-	let ty = permty_of_char s.[0]
-	and id = int_of_string (String.sub s 1 (String.length s - 1)) in
-	(id, ty)
+  let perm_of_string s =
+    let ty = permty_of_char s.[0]
+    and id = int_of_string (String.sub s 1 (String.length s - 1)) in
+    (id, ty)
 
-let of_strings ls =
-	let vect = List.map (perm_of_string) ls in
-	match vect with
-	| [] -> invalid_arg "permvec empty"
-	| h :: l -> create (fst h) (snd h) l
+  let of_strings ls =
+    let vect = List.map (perm_of_string) ls in
+    match vect with
+    | [] -> invalid_arg "permvec empty"
+    | h :: l -> create (fst h) (snd h) l
 
-(* [s] must end with '\000' *)
-let of_string s =
-	let ls = String.split '\000' s in
-	let ls = if ls = [] then ls else List.rev (List.tl (List.rev ls)) in
-	of_strings ls
+  (* [s] must end with '\000' *)
+  let of_string s =
+    let ls = String.split '\000' s in
+    let ls = if ls = [] then ls else List.rev (List.tl (List.rev ls)) in
+    of_strings ls
 
-let string_of_perm perm =
-	Printf.sprintf "%c%u" (char_of_permty (snd perm)) (fst perm)
+  let string_of_perm perm =
+    Printf.sprintf "%c%u" (char_of_permty (snd perm)) (fst perm)
 
-let to_string ?(sep="\000") permvec =
-	let l = ((permvec.owner, permvec.other) :: permvec.acl) in
-	String.concat sep (List.map string_of_perm l)
+  let to_string ?(sep="\000") permvec =
+    let l = ((permvec.owner, permvec.other) :: permvec.acl) in
+    String.concat sep (List.map string_of_perm l)
 
 end
 
@@ -99,87 +99,87 @@ end
 module Connection =
 struct
 
-type elt = Xenctrl.domid * (permty list)
-type t =
-	{ main: elt;
-	  target: elt option; }
+  type elt = Xenctrl.domid * (permty list)
+  type t =
+    { main: elt;
+      target: elt option; }
 
-let full_rights : t =
-	{ main = 0, [READ; WRITE];
-	  target = None }
+  let full_rights : t =
+    { main = 0, [READ; WRITE];
+      target = None }
 
-let create ?(perms=[NONE]) domid : t =
-	{ main = (domid, perms);
-	  target = None }
+  let create ?(perms=[NONE]) domid : t =
+    { main = (domid, perms);
+      target = None }
 
-let set_target (connection:t) ?(perms=[NONE]) domid =
-	{ connection with target = Some (domid, perms) }
+  let set_target (connection:t) ?(perms=[NONE]) domid =
+    { connection with target = Some (domid, perms) }
 
-let get_owners (connection:t) =
-	match connection.main, connection.target with
-	| c1, Some c2 -> [ fst c1; fst c2 ]
-	| c1, None    -> [ fst c1 ]
+  let get_owners (connection:t) =
+    match connection.main, connection.target with
+    | c1, Some c2 -> [ fst c1; fst c2 ]
+    | c1, None    -> [ fst c1 ]
 
-let is_owner (connection:t) id =
-	match connection.target with
-	| Some target -> fst connection.main = id || fst target = id
-	| None        -> fst connection.main = id
+  let is_owner (connection:t) id =
+    match connection.target with
+    | Some target -> fst connection.main = id || fst target = id
+    | None        -> fst connection.main = id
 
-let is_dom0 (connection:t) =
-	is_owner connection 0
+  let is_dom0 (connection:t) =
+    is_owner connection 0
 
-let elt_to_string (i,p) =
-	Printf.sprintf "%i%S" i (String.concat "" (List.map String.of_char (List.map char_of_permty p)))
+  let elt_to_string (i,p) =
+    Printf.sprintf "%i%S" i (String.concat "" (List.map String.of_char (List.map char_of_permty p)))
 
-let to_string connection =
-	Printf.sprintf "%s%s" (elt_to_string connection.main) (default "" (may elt_to_string connection.target))
+  let to_string connection =
+    Printf.sprintf "%s%s" (elt_to_string connection.main) (default "" (may elt_to_string connection.target))
 end
 
 (* check if owner of the current connection and of the current node are the same *)
 let check_owner (connection:Connection.t) (node:Node.t) =
-	if !activate && not (Connection.is_dom0 connection)
-	then Connection.is_owner connection (Node.get_owner node)
-	else true
+  if !activate && not (Connection.is_dom0 connection)
+  then Connection.is_owner connection (Node.get_owner node)
+  else true
 
 (* check if the current connection lacks the requested perm on the current node *)
 let lacks (connection:Connection.t) request (node:Node.t) =
-	let check_acl domainid =
-		let perm =
-			if List.mem_assoc domainid (Node.get_acl node)
-			then List.assoc domainid (Node.get_acl node)
-			else Node.get_other node
-		in
-		match perm, request with
-		| NONE, _ ->
-			info "Permission denied: Domain %d has no permission" domainid;
-			false
-		| RDWR, _ -> true
-		| READ, READ -> true
-		| WRITE, WRITE -> true
-		| READ, _ ->
-			info "Permission denied: Domain %d has read only access" domainid;
-			false
-		| WRITE, _ ->
-			info "Permission denied: Domain %d has write only access" domainid;
-			false
-	in
-	!activate
-	&& not (Connection.is_dom0 connection)
-	&& not (check_owner connection node)
-	&& not (List.exists check_acl (Connection.get_owners connection))
+  let check_acl domainid =
+    let perm =
+      if List.mem_assoc domainid (Node.get_acl node)
+      then List.assoc domainid (Node.get_acl node)
+      else Node.get_other node
+    in
+    match perm, request with
+    | NONE, _ ->
+      info "Permission denied: Domain %d has no permission" domainid;
+      false
+    | RDWR, _ -> true
+    | READ, READ -> true
+    | WRITE, WRITE -> true
+    | READ, _ ->
+      info "Permission denied: Domain %d has read only access" domainid;
+      false
+    | WRITE, _ ->
+      info "Permission denied: Domain %d has write only access" domainid;
+      false
+  in
+  !activate
+  && not (Connection.is_dom0 connection)
+  && not (check_owner connection node)
+  && not (List.exists check_acl (Connection.get_owners connection))
 
 (* check if the current connection has the requested perm on the current node.
-*  Raises an exception if it doesn't. *)
+ *  Raises an exception if it doesn't. *)
 let check connection request node =
-	if lacks connection request node
-	then raise Define.Permission_denied
+  if lacks connection request node
+  then raise Define.Permission_denied
 
 (* check if the current connection has the requested perm on the current node *)
 let has connection request node = not (lacks connection request node)
 
 let can_fire_watch connection perms =
-	not !watch_activate
-	|| List.exists (has connection READ) perms
+  not !watch_activate
+  || List.exists (has connection READ) perms
 
 let equiv perm1 perm2 =
-	(Node.to_string perm1) = (Node.to_string perm2)
+  (Node.to_string perm1) = (Node.to_string perm2)
diff --git a/tools/ocaml/xenstored/poll.ml b/tools/ocaml/xenstored/poll.ml
index 26f8620dfc..fefaa6e74c 100644
--- a/tools/ocaml/xenstored/poll.ml
+++ b/tools/ocaml/xenstored/poll.ml
@@ -17,9 +17,9 @@
    subscription flags used by poll, which have a correspondence to the
    readfds, writefds, exceptfds concept as in select. *)
 type event = {
-	mutable read: bool;
-	mutable write: bool;
-	mutable except: bool;
+  mutable read: bool;
+  mutable write: bool;
+  mutable except: bool;
 }
 
 external select_on_poll: (Unix.file_descr * event) array -> int -> int = "stub_select_on_poll"
@@ -28,40 +28,40 @@ external set_fd_limit: int -> unit = "stub_set_fd_limit"
 (* The rlim_max given to setrlimit must not go above the system level nr_open,
    which we can read from /proc/sys. *)
 let get_sys_fs_nr_open () =
-	try
-		let ch = open_in "/proc/sys/fs/nr_open" in
-		let v = int_of_string (input_line ch) in
-		close_in_noerr ch; v
-	with _ -> 1024 * 1024
+  try
+    let ch = open_in "/proc/sys/fs/nr_open" in
+    let v = int_of_string (input_line ch) in
+    close_in_noerr ch; v
+  with _ -> 1024 * 1024
 
 let init_event () = {read = false; write = false; except = false}
 
 let poll_select in_fds out_fds exc_fds timeout =
-	let h = Hashtbl.create 57 in
-	let add_event event_set fd =
-		let e =
-			try Hashtbl.find h fd
-			with Not_found ->
-				let e = init_event () in
-				Hashtbl.add h fd e; e in
-		event_set e in
-	List.iter (add_event (fun x -> x.read <- true)) in_fds;
-	List.iter (add_event (fun x -> x.write <- true)) out_fds;
-	List.iter (add_event (fun x -> x.except <- true)) exc_fds;
-	(* Unix.stdin and init_event are dummy input as stubs, which will
-           always be overwritten later on.  *)
-	let a = Array.make (Hashtbl.length h) (Unix.stdin, init_event ()) in
-	let i = ref (-1) in
-	Hashtbl.iter (fun fd event -> incr i; Array.set a !i (fd, event)) h;
-	let n = select_on_poll a (int_of_float (timeout *. 1000.)) in
-	let r = [], [], [] in
-	if n = 0 then r else
-		Array.fold_right
-			(fun (fd, event) (r, w, x) ->
-			 (if event.read then fd :: r else r),
-			 (if event.write then fd :: w else w),
-			 (if event.except then fd :: x else x))
-			a r
+  let h = Hashtbl.create 57 in
+  let add_event event_set fd =
+    let e =
+      try Hashtbl.find h fd
+      with Not_found ->
+        let e = init_event () in
+        Hashtbl.add h fd e; e in
+    event_set e in
+  List.iter (add_event (fun x -> x.read <- true)) in_fds;
+  List.iter (add_event (fun x -> x.write <- true)) out_fds;
+  List.iter (add_event (fun x -> x.except <- true)) exc_fds;
+  (* Unix.stdin and init_event are dummy input as stubs, which will
+            always be overwritten later on.  *)
+  let a = Array.make (Hashtbl.length h) (Unix.stdin, init_event ()) in
+  let i = ref (-1) in
+  Hashtbl.iter (fun fd event -> incr i; Array.set a !i (fd, event)) h;
+  let n = select_on_poll a (int_of_float (timeout *. 1000.)) in
+  let r = [], [], [] in
+  if n = 0 then r else
+    Array.fold_right
+      (fun (fd, event) (r, w, x) ->
+         (if event.read then fd :: r else r),
+         (if event.write then fd :: w else w),
+         (if event.except then fd :: x else x))
+      a r
 
 let () =
-        set_fd_limit (get_sys_fs_nr_open ())
+  set_fd_limit (get_sys_fs_nr_open ())
diff --git a/tools/ocaml/xenstored/poll.mli b/tools/ocaml/xenstored/poll.mli
index f73465b99f..e759608b1a 100644
--- a/tools/ocaml/xenstored/poll.mli
+++ b/tools/ocaml/xenstored/poll.mli
@@ -15,5 +15,5 @@
 
 (** Same interface and semantics as [Unix.select], implemented using poll(3). *)
 val poll_select:
-	Unix.file_descr list -> Unix.file_descr list -> Unix.file_descr list -> float
-	-> Unix.file_descr list * Unix.file_descr list * Unix.file_descr list
+  Unix.file_descr list -> Unix.file_descr list -> Unix.file_descr list -> float
+  -> Unix.file_descr list * Unix.file_descr list * Unix.file_descr list
diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/process.ml
index 02bd0f7d80..2e62c7a10e 100644
--- a/tools/ocaml/xenstored/process.ml
+++ b/tools/ocaml/xenstored/process.ml
@@ -31,302 +31,302 @@ exception Invalid_Cmd_Args
 let allow_debug = ref false
 
 let c_int_of_string s =
-	let v = ref 0 in
-	let is_digit c = c >= '0' && c <= '9' in
-	let len = String.length s in
-	let i = ref 0 in
-	while !i < len && not (is_digit s.[!i]) do incr i done;
-	while !i < len && is_digit s.[!i]
-	do
-		let x = (Char.code s.[!i]) - (Char.code '0') in
-		v := !v * 10 + x;
-		incr i
-	done;
-	!v
+  let v = ref 0 in
+  let is_digit c = c >= '0' && c <= '9' in
+  let len = String.length s in
+  let i = ref 0 in
+  while !i < len && not (is_digit s.[!i]) do incr i done;
+  while !i < len && is_digit s.[!i]
+  do
+    let x = (Char.code s.[!i]) - (Char.code '0') in
+    v := !v * 10 + x;
+    incr i
+  done;
+  !v
 
 (* when we don't want a limit, apply a max limit of 8 arguments.
    no arguments take more than 3 currently, which is pointless to split
    more than needed. *)
 let split limit c s =
-	let limit = match limit with None -> 8 | Some x -> x in
-	String.split ~limit c s
+  let limit = match limit with None -> 8 | Some x -> x in
+  String.split ~limit c s
 
 let split_one_path data con =
-	let args = split (Some 2) '\000' data in
-	match args with
-	| path :: "" :: [] -> Store.Path.create path (Connection.get_path con)
-	| _                -> raise Invalid_Cmd_Args
+  let args = split (Some 2) '\000' data in
+  match args with
+  | path :: "" :: [] -> Store.Path.create path (Connection.get_path con)
+  | _                -> raise Invalid_Cmd_Args
 
 let process_watch source t cons =
-	let oldroot = t.Transaction.oldroot in
-	let newroot = Store.get_root t.Transaction.store in
-	let ops = Transaction.get_paths t |> List.rev in
-	let do_op_watch op cons =
-		let recurse, oldroot, root = match (fst op) with
-		| Xenbus.Xb.Op.Write|Xenbus.Xb.Op.Mkdir -> false, None, newroot
-		| Xenbus.Xb.Op.Rm       -> true, None, oldroot
-		| Xenbus.Xb.Op.Setperms -> false, Some oldroot, newroot
-		| _              -> raise (Failure "huh ?") in
-		Connections.fire_watches ?oldroot source root cons (snd op) recurse in
-	List.iter (fun op -> do_op_watch op cons) ops;
-	Connections.send_watchevents cons source
+  let oldroot = t.Transaction.oldroot in
+  let newroot = Store.get_root t.Transaction.store in
+  let ops = Transaction.get_paths t |> List.rev in
+  let do_op_watch op cons =
+    let recurse, oldroot, root = match (fst op) with
+      | Xenbus.Xb.Op.Write|Xenbus.Xb.Op.Mkdir -> false, None, newroot
+      | Xenbus.Xb.Op.Rm       -> true, None, oldroot
+      | Xenbus.Xb.Op.Setperms -> false, Some oldroot, newroot
+      | _              -> raise (Failure "huh ?") in
+    Connections.fire_watches ?oldroot source root cons (snd op) recurse in
+  List.iter (fun op -> do_op_watch op cons) ops;
+  Connections.send_watchevents cons source
 
 let create_implicit_path t perm path =
-	let dirname = Store.Path.get_parent path in
-	if not (Transaction.path_exists t dirname) then (
-		let rec check_path p =
-			match p with
-			| []      -> []
-			| h :: l  ->
-				if Transaction.path_exists t h then
-					check_path l
-				else
-					p in
-		let ret = check_path (List.tl (Store.Path.get_hierarchy dirname)) in
-		List.iter (fun s -> Transaction.mkdir ~with_watch:false t perm s) ret
-	)
+  let dirname = Store.Path.get_parent path in
+  if not (Transaction.path_exists t dirname) then (
+    let rec check_path p =
+      match p with
+      | []      -> []
+      | h :: l  ->
+        if Transaction.path_exists t h then
+          check_path l
+        else
+          p in
+    let ret = check_path (List.tl (Store.Path.get_hierarchy dirname)) in
+    List.iter (fun s -> Transaction.mkdir ~with_watch:false t perm s) ret
+  )
 
 module LiveUpdate = struct
-type t =
-	{ binary: string
-	; cmdline: string list
-	; deadline: float
-	; force: bool
-	; result: string list
-	; pending: bool }
+  type t =
+    { binary: string
+    ; cmdline: string list
+    ; deadline: float
+    ; force: bool
+    ; result: string list
+    ; pending: bool }
 
-let state = ref
-	{ binary= Sys.executable_name
-	; cmdline= (Sys.argv |> Array.to_list |> List.tl)
-	; deadline= 0.
-	; force= false
-	; result = []
-	; pending= false }
+  let state = ref
+      { binary= Sys.executable_name
+      ; cmdline= (Sys.argv |> Array.to_list |> List.tl)
+      ; deadline= 0.
+      ; force= false
+      ; result = []
+      ; pending= false }
 
-let debug = Printf.eprintf
+  let debug = Printf.eprintf
 
-let forced_args = ["--live"; "--restart"]
-let args_of_t t =
-	let filtered = List.filter (fun x -> not @@ List.mem x forced_args) t.cmdline in
-	(t.binary, forced_args @ filtered)
+  let forced_args = ["--live"; "--restart"]
+  let args_of_t t =
+    let filtered = List.filter (fun x -> not @@ List.mem x forced_args) t.cmdline in
+    (t.binary, forced_args @ filtered)
 
-let string_of_t t =
-	let executable, rest = args_of_t t in
-	Filename.quote_command executable rest
+  let string_of_t t =
+    let executable, rest = args_of_t t in
+    Filename.quote_command executable rest
 
-let launch_exn t =
-	let executable, rest = args_of_t t in
-	let args = Array.of_list (executable :: rest) in
-	info "Launching %s, args: %s" executable (String.concat " " rest);
-	Unix.execv args.(0) args
+  let launch_exn t =
+    let executable, rest = args_of_t t in
+    let args = Array.of_list (executable :: rest) in
+    info "Launching %s, args: %s" executable (String.concat " " rest);
+    Unix.execv args.(0) args
 
-let validate_exn t =
-	(* --help must be last to check validity of earlier arguments *)
-	let t' = {t with cmdline= t.cmdline @ ["--help"]} in
-	let cmd = string_of_t t' in
-	debug "Executing %s" cmd ;
-	match Unix.fork () with
-	| 0 ->   ( try launch_exn t' with _ -> exit 2 )
-	| pid -> (
-		match Unix.waitpid [] pid with
-			| _, Unix.WEXITED 0 ->
-				debug "Live update validated cmdline %s" cmd;
-			t
-			| _, Unix.WEXITED n ->
-				invalid_arg (Printf.sprintf "Command %s exited with code %d" cmd n)
-			| _, Unix.WSIGNALED n ->
-				invalid_arg (Printf.sprintf "Command %s killed by ocaml signal number %d" cmd n)
-			| _, Unix.WSTOPPED n ->
-				invalid_arg (Printf.sprintf "Command %s stopped by ocaml signal number %d" cmd n)
-	)
+  let validate_exn t =
+    (* --help must be last to check validity of earlier arguments *)
+    let t' = {t with cmdline= t.cmdline @ ["--help"]} in
+    let cmd = string_of_t t' in
+    debug "Executing %s" cmd ;
+    match Unix.fork () with
+    | 0 ->   ( try launch_exn t' with _ -> exit 2 )
+    | pid -> (
+        match Unix.waitpid [] pid with
+        | _, Unix.WEXITED 0 ->
+          debug "Live update validated cmdline %s" cmd;
+          t
+        | _, Unix.WEXITED n ->
+          invalid_arg (Printf.sprintf "Command %s exited with code %d" cmd n)
+        | _, Unix.WSIGNALED n ->
+          invalid_arg (Printf.sprintf "Command %s killed by ocaml signal number %d" cmd n)
+        | _, Unix.WSTOPPED n ->
+          invalid_arg (Printf.sprintf "Command %s stopped by ocaml signal number %d" cmd n)
+      )
 
-let parse_live_update args =
-	try
-	(state :=
-		match args with
-		| ["-f"; file] ->
-			validate_exn {!state with binary= file}
-		| ["-a"] ->
-			debug "Live update aborted" ;
-			{!state with pending= false; result = []}
-		| "-c" :: cmdline ->
-			validate_exn {!state with cmdline = !state.cmdline @ cmdline}
-		| "-s" :: _ ->
-			(match !state.pending, !state.result with
-			| true, _ -> !state (* no change to state, avoid resetting timeout *)
-			| false, _ :: _ -> !state (* we got a pending result to deliver *)
-			| false, [] ->
-			let timeout = ref 60 in
-			let force = ref false in
-			Arg.parse_argv ~current:(ref 0) (Array.of_list args)
-				[ ( "-t"
-				  , Arg.Set_int timeout
-				  , "timeout in seconds to wait for active transactions to finish"
-				  )
-				; ( "-F"
-				  , Arg.Set force
-				  , "force live update to happen even with running transactions after timeout elapsed"
-				  )
-				]
-			(fun x -> raise (Arg.Bad x))
-			"live-update -s" ;
-			debug "Live update process queued" ;
-				{!state with deadline = Unix.gettimeofday () +. float !timeout
-				; force= !force; pending= true})
-		| _ ->
-			invalid_arg ("Unknown arguments: " ^ String.concat "," args)) ;
-		match !state.pending, !state.result with
-		| true, _ -> Some "BUSY"
-		| false, (_ :: _ as result) ->
-			(* xenstore-control has read the result, clear it *)
-			state := { !state with result = [] };
-			Some (String.concat "\n" result)
-		| false, [] -> None
-	with
-	| Arg.Bad s | Arg.Help s | Invalid_argument s ->
-		Some s
-	| Unix.Unix_error (e, fn, args) ->
-		Some (Printf.sprintf "%s(%s): %s" fn args (Unix.error_message e))
+  let parse_live_update args =
+    try
+      (state :=
+         match args with
+         | ["-f"; file] ->
+           validate_exn {!state with binary= file}
+         | ["-a"] ->
+           debug "Live update aborted" ;
+           {!state with pending= false; result = []}
+         | "-c" :: cmdline ->
+           validate_exn {!state with cmdline = !state.cmdline @ cmdline}
+         | "-s" :: _ ->
+           (match !state.pending, !state.result with
+            | true, _ -> !state (* no change to state, avoid resetting timeout *)
+            | false, _ :: _ -> !state (* we got a pending result to deliver *)
+            | false, [] ->
+              let timeout = ref 60 in
+              let force = ref false in
+              Arg.parse_argv ~current:(ref 0) (Array.of_list args)
+                [ ( "-t"
+                  , Arg.Set_int timeout
+                  , "timeout in seconds to wait for active transactions to finish"
+                  )
+                ; ( "-F"
+                  , Arg.Set force
+                  , "force live update to happen even with running transactions after timeout elapsed"
+                  )
+                ]
+                (fun x -> raise (Arg.Bad x))
+                "live-update -s" ;
+              debug "Live update process queued" ;
+              {!state with deadline = Unix.gettimeofday () +. float !timeout
+                         ; force= !force; pending= true})
+         | _ ->
+           invalid_arg ("Unknown arguments: " ^ String.concat "," args)) ;
+      match !state.pending, !state.result with
+      | true, _ -> Some "BUSY"
+      | false, (_ :: _ as result) ->
+        (* xenstore-control has read the result, clear it *)
+        state := { !state with result = [] };
+        Some (String.concat "\n" result)
+      | false, [] -> None
+    with
+    | Arg.Bad s | Arg.Help s | Invalid_argument s ->
+      Some s
+    | Unix.Unix_error (e, fn, args) ->
+      Some (Printf.sprintf "%s(%s): %s" fn args (Unix.error_message e))
 
-	let should_run cons =
-		let t = !state in
-		if t.pending then begin
-			match Connections.prevents_quit cons with
-			| [] -> true
-			| _ when Unix.gettimeofday () < t.deadline -> false
-			| l ->
-				warn "timeout reached: have to wait, migrate or shutdown %d domains:" (List.length l);
-				let msgs = List.rev_map (fun con -> Printf.sprintf "%s: %d tx, out: %b, perm: %s"
-					(Connection.get_domstr con)
-					(Connection.number_of_transactions con)
-					(Connection.has_output con)
-					(Connection.get_perm con |> Perms.Connection.to_string)
-					) l in
-				List.iter (warn "Live-update: %s") msgs;
-				if t.force then begin
-					warn "Live update forced, some domain connections may break!";
-					true
-				end else begin
-					warn "Live update aborted (see above for domains preventing it)";
-					state := { t with pending = false; result = msgs};
-					false
-				end
-		end else false
+  let should_run cons =
+    let t = !state in
+    if t.pending then begin
+      match Connections.prevents_quit cons with
+      | [] -> true
+      | _ when Unix.gettimeofday () < t.deadline -> false
+      | l ->
+        warn "timeout reached: have to wait, migrate or shutdown %d domains:" (List.length l);
+        let msgs = List.rev_map (fun con -> Printf.sprintf "%s: %d tx, out: %b, perm: %s"
+                                    (Connection.get_domstr con)
+                                    (Connection.number_of_transactions con)
+                                    (Connection.has_output con)
+                                    (Connection.get_perm con |> Perms.Connection.to_string)
+                                ) l in
+        List.iter (warn "Live-update: %s") msgs;
+        if t.force then begin
+          warn "Live update forced, some domain connections may break!";
+          true
+        end else begin
+          warn "Live update aborted (see above for domains preventing it)";
+          state := { t with pending = false; result = msgs};
+          false
+        end
+    end else false
 
-	let completed () =
-		state := { !state with result = ["OK"] }
+  let completed () =
+    state := { !state with result = ["OK"] }
 end
 
 (* packets *)
 let do_debug con t _domains cons data =
-	if not (Connection.is_dom0 con) && not !allow_debug
-	then None
-	else try match split None '\000' data with
-	| "live-update" :: params ->
-		let dropped_trailing_nul = params |> List.rev |> List.tl |> List.rev in
-		LiveUpdate.parse_live_update dropped_trailing_nul
-	| "print" :: msg :: _ ->
-		Logging.xb_op ~tid:0 ~ty:Xenbus.Xb.Op.Debug ~con:"=======>" msg;
-		None
-	| "quota" :: domid :: _ ->
-		let domid = int_of_string domid in
-		let quota = (Store.get_quota t.Transaction.store) in
-		Some (Quota.to_string quota domid ^ "\000")
-	| "watches" :: _ ->
-		let watches = Connections.debug cons in
-		Some (watches ^ "\000")
-	| "xenbus" :: domid :: _ ->
-		let domid = int_of_string domid in
-		let con = Connections.find_domain cons domid in
-		let s = Printf.sprintf "xenbus: %s; overflow queue length: %d, can_input: %b, has_more_input: %b, has_old_output: %b, has_new_output: %b, has_more_work: %b. pending: %s"
-			(Xenbus.Xb.debug con.xb)
-			(Connection.source_pending_watchevents con)
-			(Connection.can_input con)
-			(Connection.has_more_input con)
-			(Connection.has_old_output con)
-			(Connection.has_new_output con)
-			(Connection.has_more_work con)
-			(Connections.debug_watchevents cons con)
-		in
-		Some s
-	| "mfn" :: domid :: _ ->
-		let domid = int_of_string domid in
-		let con = Connections.find_domain cons domid in
-		may (fun dom -> Printf.sprintf "%nd\000" (Domain.get_mfn dom)) (Connection.get_domain con)
-	| _ -> None
-	with _ -> None
+  if not (Connection.is_dom0 con) && not !allow_debug
+  then None
+  else try match split None '\000' data with
+    | "live-update" :: params ->
+      let dropped_trailing_nul = params |> List.rev |> List.tl |> List.rev in
+      LiveUpdate.parse_live_update dropped_trailing_nul
+    | "print" :: msg :: _ ->
+      Logging.xb_op ~tid:0 ~ty:Xenbus.Xb.Op.Debug ~con:"=======>" msg;
+      None
+    | "quota" :: domid :: _ ->
+      let domid = int_of_string domid in
+      let quota = (Store.get_quota t.Transaction.store) in
+      Some (Quota.to_string quota domid ^ "\000")
+    | "watches" :: _ ->
+      let watches = Connections.debug cons in
+      Some (watches ^ "\000")
+    | "xenbus" :: domid :: _ ->
+      let domid = int_of_string domid in
+      let con = Connections.find_domain cons domid in
+      let s = Printf.sprintf "xenbus: %s; overflow queue length: %d, can_input: %b, has_more_input: %b, has_old_output: %b, has_new_output: %b, has_more_work: %b. pending: %s"
+          (Xenbus.Xb.debug con.xb)
+          (Connection.source_pending_watchevents con)
+          (Connection.can_input con)
+          (Connection.has_more_input con)
+          (Connection.has_old_output con)
+          (Connection.has_new_output con)
+          (Connection.has_more_work con)
+          (Connections.debug_watchevents cons con)
+      in
+      Some s
+    | "mfn" :: domid :: _ ->
+      let domid = int_of_string domid in
+      let con = Connections.find_domain cons domid in
+      may (fun dom -> Printf.sprintf "%nd\000" (Domain.get_mfn dom)) (Connection.get_domain con)
+    | _ -> None
+    with _ -> None
 
 let do_directory con t _domains _cons data =
-	let path = split_one_path data con in
-	let entries = Transaction.ls t (Connection.get_perm con) path in
-	if List.length entries > 0 then
-		(Utils.join_by_null entries) ^ "\000"
-	else
-		""
+  let path = split_one_path data con in
+  let entries = Transaction.ls t (Connection.get_perm con) path in
+  if List.length entries > 0 then
+    (Utils.join_by_null entries) ^ "\000"
+  else
+    ""
 
 let do_read con t _domains _cons data =
-	let path = split_one_path data con in
-	Transaction.read t (Connection.get_perm con) path
+  let path = split_one_path data con in
+  Transaction.read t (Connection.get_perm con) path
 
 let do_getperms con t _domains _cons data =
-	let path = split_one_path data con in
-	let perms = Transaction.getperms t (Connection.get_perm con) path in
-	Perms.Node.to_string perms ^ "\000"
+  let path = split_one_path data con in
+  let perms = Transaction.getperms t (Connection.get_perm con) path in
+  Perms.Node.to_string perms ^ "\000"
 
 let do_getdomainpath _con _t _domains _cons data =
-	let domid =
-		match (split None '\000' data) with
-		| domid :: "" :: [] -> c_int_of_string domid
-		| _                 -> raise Invalid_Cmd_Args
-		in
-	sprintf "/local/domain/%u\000" domid
+  let domid =
+    match (split None '\000' data) with
+    | domid :: "" :: [] -> c_int_of_string domid
+    | _                 -> raise Invalid_Cmd_Args
+  in
+  sprintf "/local/domain/%u\000" domid
 
 let do_write con t _domains _cons data =
-	let path, value =
-		match (split (Some 2) '\000' data) with
-		| path :: value :: [] -> Store.Path.create path (Connection.get_path con), value
-		| _                   -> raise Invalid_Cmd_Args
-		in
-	create_implicit_path t (Connection.get_perm con) path;
-	Transaction.write t (Connection.get_perm con) path value
+  let path, value =
+    match (split (Some 2) '\000' data) with
+    | path :: value :: [] -> Store.Path.create path (Connection.get_path con), value
+    | _                   -> raise Invalid_Cmd_Args
+  in
+  create_implicit_path t (Connection.get_perm con) path;
+  Transaction.write t (Connection.get_perm con) path value
 
 let do_mkdir con t _domains _cons data =
-	let path = split_one_path data con in
-	create_implicit_path t (Connection.get_perm con) path;
-	try
-		Transaction.mkdir t (Connection.get_perm con) path
-	with
-		Define.Already_exist -> ()
+  let path = split_one_path data con in
+  create_implicit_path t (Connection.get_perm con) path;
+  try
+    Transaction.mkdir t (Connection.get_perm con) path
+  with
+    Define.Already_exist -> ()
 
 let do_rm con t _domains _cons data =
-	let path = split_one_path data con in
-	try
-		Transaction.rm t (Connection.get_perm con) path
-	with
-		Define.Doesnt_exist -> ()
+  let path = split_one_path data con in
+  try
+    Transaction.rm t (Connection.get_perm con) path
+  with
+    Define.Doesnt_exist -> ()
 
 let do_setperms con t _domains _cons data =
-	let path, perms =
-		match (split (Some 2) '\000' data) with
-		| path :: perms :: _ ->
-			Store.Path.create path (Connection.get_path con),
-			(Perms.Node.of_string perms)
-		| _                   -> raise Invalid_Cmd_Args
-		in
-	Transaction.setperms t (Connection.get_perm con) path perms
+  let path, perms =
+    match (split (Some 2) '\000' data) with
+    | path :: perms :: _ ->
+      Store.Path.create path (Connection.get_path con),
+      (Perms.Node.of_string perms)
+    | _                   -> raise Invalid_Cmd_Args
+  in
+  Transaction.setperms t (Connection.get_perm con) path perms
 
 let do_error _con _t _domains _cons _data =
-	raise Define.Unknown_operation
+  raise Define.Unknown_operation
 
 let do_isintroduced con _t domains _cons data =
-	if not (Connection.is_dom0 con)
-	then raise Define.Permission_denied;
-	let domid =
-		match (split None '\000' data) with
-		| domid :: _ -> int_of_string domid
-		| _          -> raise Invalid_Cmd_Args
-		in
-	if domid = Define.domid_self || Domains.exist domains domid then "T\000" else "F\000"
+  if not (Connection.is_dom0 con)
+  then raise Define.Permission_denied;
+  let domid =
+    match (split None '\000' data) with
+    | domid :: _ -> int_of_string domid
+    | _          -> raise Invalid_Cmd_Args
+  in
+  if domid = Define.domid_self || Domains.exist domains domid then "T\000" else "F\000"
 
 (* only in xen >= 4.2 *)
 let do_reset_watches con _t _domains cons _data =
@@ -335,431 +335,431 @@ let do_reset_watches con _t _domains cons _data =
 
 (* only in >= xen3.3                                                                                    *)
 let do_set_target con _t _domains cons data =
-	if not (Connection.is_dom0 con)
-	then raise Define.Permission_denied;
-	match split None '\000' data with
-		| [ domid; target_domid; "" ] -> Connections.set_target cons (c_int_of_string domid) (c_int_of_string target_domid)
-		| _                           -> raise Invalid_Cmd_Args
+  if not (Connection.is_dom0 con)
+  then raise Define.Permission_denied;
+  match split None '\000' data with
+  | [ domid; target_domid; "" ] -> Connections.set_target cons (c_int_of_string domid) (c_int_of_string target_domid)
+  | _                           -> raise Invalid_Cmd_Args
 
 (*------------- Generic handling of ty ------------------*)
 let send_response ty con t rid response =
-	match response with
-	| Packet.Ack f ->
-		Connection.send_ack con (Transaction.get_id t) rid ty;
-		(* Now do any necessary follow-up actions *)
-		f ()
-	| Packet.Reply ret ->
-		Connection.send_reply con (Transaction.get_id t) rid ty ret
-	| Packet.Error e ->
-		Connection.send_error con (Transaction.get_id t) rid e
+  match response with
+  | Packet.Ack f ->
+    Connection.send_ack con (Transaction.get_id t) rid ty;
+    (* Now do any necessary follow-up actions *)
+    f ()
+  | Packet.Reply ret ->
+    Connection.send_reply con (Transaction.get_id t) rid ty ret
+  | Packet.Error e ->
+    Connection.send_error con (Transaction.get_id t) rid e
 
 let reply_ack fct con t doms cons data =
-	fct con t doms cons data;
-	Packet.Ack (fun () ->
-		if Transaction.get_id t = Transaction.none then
-			process_watch con t cons
-	)
+  fct con t doms cons data;
+  Packet.Ack (fun () ->
+      if Transaction.get_id t = Transaction.none then
+        process_watch con t cons
+    )
 
 let reply_data fct con t doms cons data =
-	let ret = fct con t doms cons data in
-	Packet.Reply ret
+  let ret = fct con t doms cons data in
+  Packet.Reply ret
 
 let reply_data_or_ack fct con t doms cons data =
-	match fct con t doms cons data with
-		| Some ret -> Packet.Reply ret
-		| None -> Packet.Ack (fun () -> ())
+  match fct con t doms cons data with
+  | Some ret -> Packet.Reply ret
+  | None -> Packet.Ack (fun () -> ())
 
 let reply_none fct con t doms cons data =
-	(* let the function reply *)
-	fct con t doms cons data
+  (* let the function reply *)
+  fct con t doms cons data
 
 (* Functions for 'simple' operations that cannot be part of a transaction *)
 let function_of_type_simple_op ty =
-	match ty with
-	| Xenbus.Xb.Op.Debug
-	| Xenbus.Xb.Op.Watch
-	| Xenbus.Xb.Op.Unwatch
-	| Xenbus.Xb.Op.Transaction_start
-	| Xenbus.Xb.Op.Transaction_end
-	| Xenbus.Xb.Op.Introduce
-	| Xenbus.Xb.Op.Release
-	| Xenbus.Xb.Op.Isintroduced
-	| Xenbus.Xb.Op.Resume
-	| Xenbus.Xb.Op.Set_target
-	| Xenbus.Xb.Op.Reset_watches
-	| Xenbus.Xb.Op.Invalid           -> error "called function_of_type_simple_op on operation %s" (Xenbus.Xb.Op.to_string ty);
-	                                    raise (Invalid_argument (Xenbus.Xb.Op.to_string ty))
-	| Xenbus.Xb.Op.Directory         -> reply_data do_directory
-	| Xenbus.Xb.Op.Read              -> reply_data do_read
-	| Xenbus.Xb.Op.Getperms          -> reply_data do_getperms
-	| Xenbus.Xb.Op.Getdomainpath     -> reply_data do_getdomainpath
-	| Xenbus.Xb.Op.Write             -> reply_ack do_write
-	| Xenbus.Xb.Op.Mkdir             -> reply_ack do_mkdir
-	| Xenbus.Xb.Op.Rm                -> reply_ack do_rm
-	| Xenbus.Xb.Op.Setperms          -> reply_ack do_setperms
-	| _                              -> reply_ack do_error
+  match ty with
+  | Xenbus.Xb.Op.Debug
+  | Xenbus.Xb.Op.Watch
+  | Xenbus.Xb.Op.Unwatch
+  | Xenbus.Xb.Op.Transaction_start
+  | Xenbus.Xb.Op.Transaction_end
+  | Xenbus.Xb.Op.Introduce
+  | Xenbus.Xb.Op.Release
+  | Xenbus.Xb.Op.Isintroduced
+  | Xenbus.Xb.Op.Resume
+  | Xenbus.Xb.Op.Set_target
+  | Xenbus.Xb.Op.Reset_watches
+  | Xenbus.Xb.Op.Invalid           -> error "called function_of_type_simple_op on operation %s" (Xenbus.Xb.Op.to_string ty);
+    raise (Invalid_argument (Xenbus.Xb.Op.to_string ty))
+  | Xenbus.Xb.Op.Directory         -> reply_data do_directory
+  | Xenbus.Xb.Op.Read              -> reply_data do_read
+  | Xenbus.Xb.Op.Getperms          -> reply_data do_getperms
+  | Xenbus.Xb.Op.Getdomainpath     -> reply_data do_getdomainpath
+  | Xenbus.Xb.Op.Write             -> reply_ack do_write
+  | Xenbus.Xb.Op.Mkdir             -> reply_ack do_mkdir
+  | Xenbus.Xb.Op.Rm                -> reply_ack do_rm
+  | Xenbus.Xb.Op.Setperms          -> reply_ack do_setperms
+  | _                              -> reply_ack do_error
 
 let input_handle_error ~cons ~doms ~fct ~con ~t ~req =
-	let reply_error e =
-		Packet.Error e in
-	try
-		Transaction.check_quota_exn ~perm:(Connection.get_perm con) t;
-		fct con t doms cons req.Packet.data
-	with
-	| Define.Invalid_path          -> reply_error "EINVAL"
-	| Define.Already_exist         -> reply_error "EEXIST"
-	| Define.Doesnt_exist          -> reply_error "ENOENT"
-	| Define.Lookup_Doesnt_exist _ -> reply_error "ENOENT"
-	| Define.Permission_denied     -> reply_error "EACCES"
-	| Not_found                    -> reply_error "ENOENT"
-	| Invalid_Cmd_Args             -> reply_error "EINVAL"
-	| Invalid_argument _           -> reply_error "EINVAL"
-	| Transaction_again            -> reply_error "EAGAIN"
-	| Transaction_nested           -> reply_error "EBUSY"
-	| Domain_not_match             -> reply_error "EINVAL"
-	| Quota.Limit_reached          -> reply_error "EQUOTA"
-	| Quota.Data_too_big           -> reply_error "E2BIG"
-	| Quota.Transaction_opened     -> reply_error "EQUOTA"
-	| (Failure "int_of_string")    -> reply_error "EINVAL"
-	| Define.Unknown_operation     -> reply_error "ENOSYS"
+  let reply_error e =
+    Packet.Error e in
+  try
+    Transaction.check_quota_exn ~perm:(Connection.get_perm con) t;
+    fct con t doms cons req.Packet.data
+  with
+  | Define.Invalid_path          -> reply_error "EINVAL"
+  | Define.Already_exist         -> reply_error "EEXIST"
+  | Define.Doesnt_exist          -> reply_error "ENOENT"
+  | Define.Lookup_Doesnt_exist _ -> reply_error "ENOENT"
+  | Define.Permission_denied     -> reply_error "EACCES"
+  | Not_found                    -> reply_error "ENOENT"
+  | Invalid_Cmd_Args             -> reply_error "EINVAL"
+  | Invalid_argument _           -> reply_error "EINVAL"
+  | Transaction_again            -> reply_error "EAGAIN"
+  | Transaction_nested           -> reply_error "EBUSY"
+  | Domain_not_match             -> reply_error "EINVAL"
+  | Quota.Limit_reached          -> reply_error "EQUOTA"
+  | Quota.Data_too_big           -> reply_error "E2BIG"
+  | Quota.Transaction_opened     -> reply_error "EQUOTA"
+  | (Failure "int_of_string")    -> reply_error "EINVAL"
+  | Define.Unknown_operation     -> reply_error "ENOSYS"
 
 let write_access_log ~ty ~tid ~con ~data =
-	Logging.xb_op ~ty ~tid ~con data
+  Logging.xb_op ~ty ~tid ~con data
 
 let write_answer_log ~ty ~tid ~con ~data =
-	Logging.xb_answer ~ty ~tid ~con data
+  Logging.xb_answer ~ty ~tid ~con data
 
 let write_response_log ~ty ~tid ~con ~response =
-	match response with
-	| Packet.Ack _   -> write_answer_log ~ty ~tid ~con ~data:""
-	| Packet.Reply x -> write_answer_log ~ty ~tid ~con ~data:x
-	| Packet.Error e -> write_answer_log ~ty:(Xenbus.Xb.Op.Error) ~tid ~con ~data:e
+  match response with
+  | Packet.Ack _   -> write_answer_log ~ty ~tid ~con ~data:""
+  | Packet.Reply x -> write_answer_log ~ty ~tid ~con ~data:x
+  | Packet.Error e -> write_answer_log ~ty:(Xenbus.Xb.Op.Error) ~tid ~con ~data:e
 
 let record_commit ~con ~tid ~before ~after =
-	let inc r = r := Int64.add 1L !r in
-	let finish_count = inc Transaction.counter; !Transaction.counter in
-	History.push {History.con=con; tid=tid; before=before; after=after; finish_count=finish_count}
+  let inc r = r := Int64.add 1L !r in
+  let finish_count = inc Transaction.counter; !Transaction.counter in
+  History.push {History.con=con; tid=tid; before=before; after=after; finish_count=finish_count}
 
 (* Replay a stored transaction against a fresh store, check the responses are
    all equivalent: if so, commit the transaction. Otherwise send the abort to
    the client. *)
 let transaction_replay c t doms cons =
-	match t.Transaction.ty with
-	| Transaction.No ->
-		error "attempted to replay a non-full transaction";
-		false
-	| Transaction.Full(id, _oldstore, cstore) ->
-		let tid = Connection.start_transaction c cstore in
-		let replay_t = Transaction.make ~internal:true tid cstore in
-		let con = sprintf "r(%d):%s" id (Connection.get_domstr c) in
+  match t.Transaction.ty with
+  | Transaction.No ->
+    error "attempted to replay a non-full transaction";
+    false
+  | Transaction.Full(id, _oldstore, cstore) ->
+    let tid = Connection.start_transaction c cstore in
+    let replay_t = Transaction.make ~internal:true tid cstore in
+    let con = sprintf "r(%d):%s" id (Connection.get_domstr c) in
 
-		let perform_exn ~wlog txn (request, response) =
-			if wlog then write_access_log ~ty:request.Packet.ty ~tid ~con ~data:request.Packet.data;
-			let fct = function_of_type_simple_op request.Packet.ty in
-			let response' = input_handle_error ~cons ~doms ~fct ~con:c ~t:txn ~req:request in
-			if wlog then write_response_log ~ty:request.Packet.ty ~tid ~con ~response:response';
-			if not(Packet.response_equal response response') then raise Transaction_again
-		in
-		finally
-		(fun () ->
-			try
-				Logging.start_transaction ~con ~tid;
-				List.iter (perform_exn ~wlog:true replay_t) (Transaction.get_operations t); (* May throw EAGAIN *)
+    let perform_exn ~wlog txn (request, response) =
+      if wlog then write_access_log ~ty:request.Packet.ty ~tid ~con ~data:request.Packet.data;
+      let fct = function_of_type_simple_op request.Packet.ty in
+      let response' = input_handle_error ~cons ~doms ~fct ~con:c ~t:txn ~req:request in
+      if wlog then write_response_log ~ty:request.Packet.ty ~tid ~con ~response:response';
+      if not(Packet.response_equal response response') then raise Transaction_again
+    in
+    finally
+      (fun () ->
+         try
+           Logging.start_transaction ~con ~tid;
+           List.iter (perform_exn ~wlog:true replay_t) (Transaction.get_operations t); (* May throw EAGAIN *)
 
-				Logging.end_transaction ~con ~tid;
-				Transaction.commit ~con replay_t
-			with
-			| Transaction_again -> (
-				Transaction.failed_commits := Int64.add !Transaction.failed_commits 1L;
-				let victim_domstr = Connection.get_domstr c in
-				debug "Apportioning blame for EAGAIN in txn %d, domain=%s" id victim_domstr;
-				let punish guilty_con =
-					debug "Blaming domain %s for conflict with domain %s txn %d"
-						(Connection.get_domstr guilty_con) victim_domstr id;
-					Connection.decr_conflict_credit doms guilty_con
-				in
-				let judge_and_sentence hist_rec = (
-					let can_apply_on store = (
-						let store = Store.copy store in
-						let trial_t = Transaction.make ~internal:true Transaction.none store in
-						try List.iter (perform_exn ~wlog:false trial_t) (Transaction.get_operations t);
-							true
-						with Transaction_again -> false
-					) in
-					if can_apply_on hist_rec.History.before
-					&& not (can_apply_on hist_rec.History.after)
-					then (punish hist_rec.History.con; true)
-					else false
-				) in
-				let guilty_cons = History.filter_connections ~ignore:c ~since:t.Transaction.start_count ~f:judge_and_sentence in
-				if Hashtbl.length guilty_cons = 0 then (
-					debug "Found no culprit for conflict in %s: must be self or not in history." con;
-					Transaction.failed_commits_no_culprit := Int64.add !Transaction.failed_commits_no_culprit 1L
-				);
-				false
-			)
-			| e ->
-				info "transaction_replay %d caught: %s" tid (Printexc.to_string e);
-				false
-			)
-		(fun () ->
-			ignore @@ Connection.end_transaction c tid None
-		)
+           Logging.end_transaction ~con ~tid;
+           Transaction.commit ~con replay_t
+         with
+         | Transaction_again -> (
+             Transaction.failed_commits := Int64.add !Transaction.failed_commits 1L;
+             let victim_domstr = Connection.get_domstr c in
+             debug "Apportioning blame for EAGAIN in txn %d, domain=%s" id victim_domstr;
+             let punish guilty_con =
+               debug "Blaming domain %s for conflict with domain %s txn %d"
+                 (Connection.get_domstr guilty_con) victim_domstr id;
+               Connection.decr_conflict_credit doms guilty_con
+             in
+             let judge_and_sentence hist_rec = (
+               let can_apply_on store = (
+                 let store = Store.copy store in
+                 let trial_t = Transaction.make ~internal:true Transaction.none store in
+                 try List.iter (perform_exn ~wlog:false trial_t) (Transaction.get_operations t);
+                   true
+                 with Transaction_again -> false
+               ) in
+               if can_apply_on hist_rec.History.before
+               && not (can_apply_on hist_rec.History.after)
+               then (punish hist_rec.History.con; true)
+               else false
+             ) in
+             let guilty_cons = History.filter_connections ~ignore:c ~since:t.Transaction.start_count ~f:judge_and_sentence in
+             if Hashtbl.length guilty_cons = 0 then (
+               debug "Found no culprit for conflict in %s: must be self or not in history." con;
+               Transaction.failed_commits_no_culprit := Int64.add !Transaction.failed_commits_no_culprit 1L
+             );
+             false
+           )
+         | e ->
+           info "transaction_replay %d caught: %s" tid (Printexc.to_string e);
+           false
+      )
+      (fun () ->
+         ignore @@ Connection.end_transaction c tid None
+      )
 
 let do_watch con _t _domains cons data =
-	let (node, token) =
-		match (split None '\000' data) with
-		| [node; token; ""]   -> node, token
-		| _                   -> raise Invalid_Cmd_Args
-		in
-	let watch = Connections.add_watch cons con node token in
-	Packet.Ack (fun () ->
-		(* xenstore.txt says this watch is fired immediately,
-		   implying even if path doesn't exist or is unreadable *)
-		Connection.fire_single_watch_unchecked con watch)
+  let (node, token) =
+    match (split None '\000' data) with
+    | [node; token; ""]   -> node, token
+    | _                   -> raise Invalid_Cmd_Args
+  in
+  let watch = Connections.add_watch cons con node token in
+  Packet.Ack (fun () ->
+      (* xenstore.txt says this watch is fired immediately,
+         		   implying even if path doesn't exist or is unreadable *)
+      Connection.fire_single_watch_unchecked con watch)
 
 let do_unwatch con _t _domains cons data =
-	let (node, token) =
-		match (split None '\000' data) with
-		| [node; token; ""]   -> node, token
-		| _                   -> raise Invalid_Cmd_Args
-		in
-	ignore @@ Connections.del_watch cons con node token
+  let (node, token) =
+    match (split None '\000' data) with
+    | [node; token; ""]   -> node, token
+    | _                   -> raise Invalid_Cmd_Args
+  in
+  ignore @@ Connections.del_watch cons con node token
 
 let do_transaction_start con t _domains _cons _data =
-	if Transaction.get_id t <> Transaction.none then
-		raise Transaction_nested;
-	let store = Transaction.get_store t in
-	string_of_int (Connection.start_transaction con store) ^ "\000"
+  if Transaction.get_id t <> Transaction.none then
+    raise Transaction_nested;
+  let store = Transaction.get_store t in
+  string_of_int (Connection.start_transaction con store) ^ "\000"
 
 let do_transaction_end con t domains cons data =
-	let commit =
-		match (split None '\000' data) with
-		| "T" :: _ -> true
-		| "F" :: _ -> false
-		| x :: _   -> raise (Invalid_argument x)
-		| _        -> raise Invalid_Cmd_Args
-		in
-	let commit = commit && not (Transaction.is_read_only t) in
-	let success =
-		let commit = if commit then Some (fun con trans -> transaction_replay con trans domains cons) else None in
-		History.end_transaction t con (Transaction.get_id t) commit in
-	if not success then
-		raise Transaction_again;
-	if commit then begin
-		process_watch con t cons;
-		match t.Transaction.ty with
-		| Transaction.No ->
-			() (* no need to record anything *)
-		| Transaction.Full(id, oldstore, cstore) ->
-			record_commit ~con ~tid:id ~before:oldstore ~after:cstore
-	end
+  let commit =
+    match (split None '\000' data) with
+    | "T" :: _ -> true
+    | "F" :: _ -> false
+    | x :: _   -> raise (Invalid_argument x)
+    | _        -> raise Invalid_Cmd_Args
+  in
+  let commit = commit && not (Transaction.is_read_only t) in
+  let success =
+    let commit = if commit then Some (fun con trans -> transaction_replay con trans domains cons) else None in
+    History.end_transaction t con (Transaction.get_id t) commit in
+  if not success then
+    raise Transaction_again;
+  if commit then begin
+    process_watch con t cons;
+    match t.Transaction.ty with
+    | Transaction.No ->
+      () (* no need to record anything *)
+    | Transaction.Full(id, oldstore, cstore) ->
+      record_commit ~con ~tid:id ~before:oldstore ~after:cstore
+  end
 
 let do_introduce con t domains cons data =
-	if not (Connection.is_dom0 con)
-	then raise Define.Permission_denied;
-	let (domid, mfn, remote_port) =
-		match (split None '\000' data) with
-		| domid :: mfn :: remote_port :: _ ->
-			int_of_string domid, Nativeint.of_string mfn, int_of_string remote_port
-		| _                         -> raise Invalid_Cmd_Args;
-		in
-	let dom =
-		if Domains.exist domains domid then
-			let edom = Domains.find domains domid in
-			if (Domain.get_mfn edom) = mfn && (Connections.find_domain cons domid) != con then begin
-				(* Use XS_INTRODUCE for recreating the xenbus event-channel. *)
-				Domain.rebind_evtchn edom remote_port;
-			end;
-			edom
-		else try
-			let ndom = Domains.create ~remote_port domains domid mfn in
-			Connections.add_domain cons ndom;
-			Connections.fire_spec_watches (Transaction.get_root t) cons Store.Path.introduce_domain;
-			ndom
-		with _ -> raise Invalid_Cmd_Args
-	in
-	if (Domain.get_remote_port dom) <> remote_port || (Domain.get_mfn dom) <> mfn then
-		raise Domain_not_match
+  if not (Connection.is_dom0 con)
+  then raise Define.Permission_denied;
+  let (domid, mfn, remote_port) =
+    match (split None '\000' data) with
+    | domid :: mfn :: remote_port :: _ ->
+      int_of_string domid, Nativeint.of_string mfn, int_of_string remote_port
+    | _                         -> raise Invalid_Cmd_Args;
+  in
+  let dom =
+    if Domains.exist domains domid then
+      let edom = Domains.find domains domid in
+      if (Domain.get_mfn edom) = mfn && (Connections.find_domain cons domid) != con then begin
+        (* Use XS_INTRODUCE for recreating the xenbus event-channel. *)
+        Domain.rebind_evtchn edom remote_port;
+      end;
+      edom
+    else try
+        let ndom = Domains.create ~remote_port domains domid mfn in
+        Connections.add_domain cons ndom;
+        Connections.fire_spec_watches (Transaction.get_root t) cons Store.Path.introduce_domain;
+        ndom
+      with _ -> raise Invalid_Cmd_Args
+  in
+  if (Domain.get_remote_port dom) <> remote_port || (Domain.get_mfn dom) <> mfn then
+    raise Domain_not_match
 
 let do_release con t domains cons data =
-	if not (Connection.is_dom0 con)
-	then raise Define.Permission_denied;
-	let domid =
-		match (split None '\000' data) with
-		| [domid;""] -> int_of_string domid
-		| _          -> raise Invalid_Cmd_Args
-		in
-	let fire_spec_watches = Domains.exist domains domid in
-	Domains.del domains domid;
-	Connections.del_domain cons domid;
-	Store.reset_permissions (Transaction.get_store t) domid;
-	if fire_spec_watches
-	then Connections.fire_spec_watches (Transaction.get_root t) cons Store.Path.release_domain
-	else raise Invalid_Cmd_Args
+  if not (Connection.is_dom0 con)
+  then raise Define.Permission_denied;
+  let domid =
+    match (split None '\000' data) with
+    | [domid;""] -> int_of_string domid
+    | _          -> raise Invalid_Cmd_Args
+  in
+  let fire_spec_watches = Domains.exist domains domid in
+  Domains.del domains domid;
+  Connections.del_domain cons domid;
+  Store.reset_permissions (Transaction.get_store t) domid;
+  if fire_spec_watches
+  then Connections.fire_spec_watches (Transaction.get_root t) cons Store.Path.release_domain
+  else raise Invalid_Cmd_Args
 
 let do_resume con _t domains _cons data =
-	if not (Connection.is_dom0 con)
-	then raise Define.Permission_denied;
-	let domid =
-		match (split None '\000' data) with
-		| domid :: _ -> int_of_string domid
-		| _          -> raise Invalid_Cmd_Args
-		in
-	if Domains.exist domains domid
-	then Domains.resume domains domid
-	else raise Invalid_Cmd_Args
+  if not (Connection.is_dom0 con)
+  then raise Define.Permission_denied;
+  let domid =
+    match (split None '\000' data) with
+    | domid :: _ -> int_of_string domid
+    | _          -> raise Invalid_Cmd_Args
+  in
+  if Domains.exist domains domid
+  then Domains.resume domains domid
+  else raise Invalid_Cmd_Args
 
 let function_of_type ty =
-	match ty with
-	| Xenbus.Xb.Op.Debug             -> reply_data_or_ack do_debug
-	| Xenbus.Xb.Op.Watch             -> reply_none do_watch
-	| Xenbus.Xb.Op.Unwatch           -> reply_ack do_unwatch
-	| Xenbus.Xb.Op.Transaction_start -> reply_data do_transaction_start
-	| Xenbus.Xb.Op.Transaction_end   -> reply_ack do_transaction_end
-	| Xenbus.Xb.Op.Introduce         -> reply_ack do_introduce
-	| Xenbus.Xb.Op.Release           -> reply_ack do_release
-	| Xenbus.Xb.Op.Isintroduced      -> reply_data do_isintroduced
-	| Xenbus.Xb.Op.Resume            -> reply_ack do_resume
-	| Xenbus.Xb.Op.Set_target        -> reply_ack do_set_target
-	| Xenbus.Xb.Op.Reset_watches     -> reply_ack do_reset_watches
-	| Xenbus.Xb.Op.Invalid           -> reply_ack do_error
-	| _                              -> function_of_type_simple_op ty
+  match ty with
+  | Xenbus.Xb.Op.Debug             -> reply_data_or_ack do_debug
+  | Xenbus.Xb.Op.Watch             -> reply_none do_watch
+  | Xenbus.Xb.Op.Unwatch           -> reply_ack do_unwatch
+  | Xenbus.Xb.Op.Transaction_start -> reply_data do_transaction_start
+  | Xenbus.Xb.Op.Transaction_end   -> reply_ack do_transaction_end
+  | Xenbus.Xb.Op.Introduce         -> reply_ack do_introduce
+  | Xenbus.Xb.Op.Release           -> reply_ack do_release
+  | Xenbus.Xb.Op.Isintroduced      -> reply_data do_isintroduced
+  | Xenbus.Xb.Op.Resume            -> reply_ack do_resume
+  | Xenbus.Xb.Op.Set_target        -> reply_ack do_set_target
+  | Xenbus.Xb.Op.Reset_watches     -> reply_ack do_reset_watches
+  | Xenbus.Xb.Op.Invalid           -> reply_ack do_error
+  | _                              -> function_of_type_simple_op ty
 
 (**
  * Determines which individual (non-transactional) operations we want to retain.
  * We only want to retain operations that have side-effects in the store since
  * these can be the cause of transactions failing.
- *)
+*)
 let retain_op_in_history ty =
-	match ty with
-	| Xenbus.Xb.Op.Write
-	| Xenbus.Xb.Op.Mkdir
-	| Xenbus.Xb.Op.Rm
-	| Xenbus.Xb.Op.Setperms          -> true
-	| Xenbus.Xb.Op.Debug
-	| Xenbus.Xb.Op.Directory
-	| Xenbus.Xb.Op.Read
-	| Xenbus.Xb.Op.Getperms
-	| Xenbus.Xb.Op.Watch
-	| Xenbus.Xb.Op.Unwatch
-	| Xenbus.Xb.Op.Transaction_start
-	| Xenbus.Xb.Op.Transaction_end
-	| Xenbus.Xb.Op.Introduce
-	| Xenbus.Xb.Op.Release
-	| Xenbus.Xb.Op.Getdomainpath
-	| Xenbus.Xb.Op.Watchevent
-	| Xenbus.Xb.Op.Error
-	| Xenbus.Xb.Op.Isintroduced
-	| Xenbus.Xb.Op.Resume
-	| Xenbus.Xb.Op.Set_target
-	| Xenbus.Xb.Op.Reset_watches
-	| Xenbus.Xb.Op.Invalid           -> false
+  match ty with
+  | Xenbus.Xb.Op.Write
+  | Xenbus.Xb.Op.Mkdir
+  | Xenbus.Xb.Op.Rm
+  | Xenbus.Xb.Op.Setperms          -> true
+  | Xenbus.Xb.Op.Debug
+  | Xenbus.Xb.Op.Directory
+  | Xenbus.Xb.Op.Read
+  | Xenbus.Xb.Op.Getperms
+  | Xenbus.Xb.Op.Watch
+  | Xenbus.Xb.Op.Unwatch
+  | Xenbus.Xb.Op.Transaction_start
+  | Xenbus.Xb.Op.Transaction_end
+  | Xenbus.Xb.Op.Introduce
+  | Xenbus.Xb.Op.Release
+  | Xenbus.Xb.Op.Getdomainpath
+  | Xenbus.Xb.Op.Watchevent
+  | Xenbus.Xb.Op.Error
+  | Xenbus.Xb.Op.Isintroduced
+  | Xenbus.Xb.Op.Resume
+  | Xenbus.Xb.Op.Set_target
+  | Xenbus.Xb.Op.Reset_watches
+  | Xenbus.Xb.Op.Invalid           -> false
 
 let maybe_ignore_transaction = function
-	| Xenbus.Xb.Op.Watch | Xenbus.Xb.Op.Unwatch -> fun tid ->
-		if tid <> Transaction.none then
-			debug "Ignoring transaction ID %d for watch/unwatch" tid;
-		Transaction.none
-	| _ -> fun x -> x
+  | Xenbus.Xb.Op.Watch | Xenbus.Xb.Op.Unwatch -> fun tid ->
+    if tid <> Transaction.none then
+      debug "Ignoring transaction ID %d for watch/unwatch" tid;
+    Transaction.none
+  | _ -> fun x -> x
 
 
 let () = Printexc.record_backtrace true
 
 (**
  * Nothrow guarantee.
- *)
+*)
 let process_packet ~store ~cons ~doms ~con ~req =
-	let ty = req.Packet.ty in
-	let tid = maybe_ignore_transaction ty req.Packet.tid in
-	let rid = req.Packet.rid in
-	try
-		let fct = function_of_type ty in
-		let t =
-			if tid = Transaction.none then
-				Transaction.make tid store
-			else
-				Connection.get_transaction con tid
-			in
+  let ty = req.Packet.ty in
+  let tid = maybe_ignore_transaction ty req.Packet.tid in
+  let rid = req.Packet.rid in
+  try
+    let fct = function_of_type ty in
+    let t =
+      if tid = Transaction.none then
+        Transaction.make tid store
+      else
+        Connection.get_transaction con tid
+    in
 
-		let execute () = input_handle_error ~cons ~doms ~fct ~con ~t ~req in
+    let execute () = input_handle_error ~cons ~doms ~fct ~con ~t ~req in
 
-		let response =
-			(* Note that transactions are recorded in history separately. *)
-			if tid = Transaction.none && retain_op_in_history ty then begin
-				let before = Store.copy store in
-				let response = execute () in
-				let after = Store.copy store in
-				record_commit ~con ~tid ~before ~after;
-				response
-			end else execute ()
-		in
+    let response =
+      (* Note that transactions are recorded in history separately. *)
+      if tid = Transaction.none && retain_op_in_history ty then begin
+        let before = Store.copy store in
+        let response = execute () in
+        let after = Store.copy store in
+        record_commit ~con ~tid ~before ~after;
+        response
+      end else execute ()
+    in
 
-		let response = try
-			Transaction.check_quota_exn ~perm:(Connection.get_perm con) t;
-			if tid <> Transaction.none then
-				(* Remember the request and response for this operation in case we need to replay the transaction *)
-				Transaction.add_operation t req response;
-			response
-		with Quota.Limit_reached ->
-			Packet.Error "EQUOTA"
-		in
+    let response = try
+        Transaction.check_quota_exn ~perm:(Connection.get_perm con) t;
+        if tid <> Transaction.none then
+          (* Remember the request and response for this operation in case we need to replay the transaction *)
+          Transaction.add_operation t req response;
+        response
+      with Quota.Limit_reached ->
+        Packet.Error "EQUOTA"
+    in
 
-		(* Put the response on the wire *)
-		send_response ty con t rid response
-	with exn ->
-		let bt = Printexc.get_backtrace () in
-		error "process packet: %s. %s" (Printexc.to_string exn) bt;
-		Connection.send_error con tid rid "EIO"
+    (* Put the response on the wire *)
+    send_response ty con t rid response
+  with exn ->
+    let bt = Printexc.get_backtrace () in
+    error "process packet: %s. %s" (Printexc.to_string exn) bt;
+    Connection.send_error con tid rid "EIO"
 
 let do_input store cons doms con =
-	let newpacket =
-		try
-			if Connection.can_input con then Connection.do_input con
-			else None
-		with Xenbus.Xb.Reconnect ->
-			info "%s requests a reconnect" (Connection.get_domstr con);
-			History.reconnect con;
-			info "%s reconnection complete" (Connection.get_domstr con);
-			None
-		| Invalid_argument exp | Failure exp ->
-			error "caught exception %s" exp;
-			error "got a bad client %s" (sprintf "%-8s" (Connection.get_domstr con));
-			Connection.mark_as_bad con;
-			None
-	in
+  let newpacket =
+    try
+      if Connection.can_input con then Connection.do_input con
+      else None
+    with Xenbus.Xb.Reconnect ->
+      info "%s requests a reconnect" (Connection.get_domstr con);
+      History.reconnect con;
+      info "%s reconnection complete" (Connection.get_domstr con);
+      None
+       | Invalid_argument exp | Failure exp ->
+         error "caught exception %s" exp;
+         error "got a bad client %s" (sprintf "%-8s" (Connection.get_domstr con));
+         Connection.mark_as_bad con;
+         None
+  in
 
-	match newpacket with
-	| None -> ()
-	| Some packet ->
-		let tid, rid, ty, data = Xenbus.Xb.Packet.unpack packet in
-		let req = {Packet.tid=tid; Packet.rid=rid; Packet.ty=ty; Packet.data=data} in
+  match newpacket with
+  | None -> ()
+  | Some packet ->
+    let tid, rid, ty, data = Xenbus.Xb.Packet.unpack packet in
+    let req = {Packet.tid=tid; Packet.rid=rid; Packet.ty=ty; Packet.data=data} in
 
-		(* As we don't log IO, do not call an unnecessary sanitize_data
-		   info "[%s] -> [%d] %s \"%s\""
-		         (Connection.get_domstr con) tid
-		         (Xenbus.Xb.Op.to_string ty) (sanitize_data data); *)
-		process_packet ~store ~cons ~doms ~con ~req;
-		write_access_log ~ty ~tid ~con:(Connection.get_domstr con) ~data;
-		Connection.incr_ops con
+    (* As we don't log IO, do not call an unnecessary sanitize_data
+       		   info "[%s] -> [%d] %s \"%s\""
+       		         (Connection.get_domstr con) tid
+       		         (Xenbus.Xb.Op.to_string ty) (sanitize_data data); *)
+    process_packet ~store ~cons ~doms ~con ~req;
+    write_access_log ~ty ~tid ~con:(Connection.get_domstr con) ~data;
+    Connection.incr_ops con
 
 let do_output _store _cons _doms con =
-	Connection.source_flush_watchevents con;
-	if Connection.has_output con then (
-		if Connection.has_new_output con then (
-			let packet = Connection.peek_output con in
-			let tid, _rid, ty, data = Xenbus.Xb.Packet.unpack packet in
-			(* As we don't log IO, do not call an unnecessary sanitize_data
-			   info "[%s] <- %s \"%s\""
-			         (Connection.get_domstr con)
-			         (Xenbus.Xb.Op.to_string ty) (sanitize_data data);*)
-			write_answer_log ~ty ~tid ~con:(Connection.get_domstr con) ~data;
-		);
-		try
-			ignore (Connection.do_output con)
-		with Xenbus.Xb.Reconnect ->
-			info "%s requests a reconnect" (Connection.get_domstr con);
-			History.reconnect con;
-			info "%s reconnection complete" (Connection.get_domstr con)
-	)
+  Connection.source_flush_watchevents con;
+  if Connection.has_output con then (
+    if Connection.has_new_output con then (
+      let packet = Connection.peek_output con in
+      let tid, _rid, ty, data = Xenbus.Xb.Packet.unpack packet in
+      (* As we don't log IO, do not call an unnecessary sanitize_data
+         			   info "[%s] <- %s \"%s\""
+         			         (Connection.get_domstr con)
+         			         (Xenbus.Xb.Op.to_string ty) (sanitize_data data);*)
+      write_answer_log ~ty ~tid ~con:(Connection.get_domstr con) ~data;
+    );
+    try
+      ignore (Connection.do_output con)
+    with Xenbus.Xb.Reconnect ->
+      info "%s requests a reconnect" (Connection.get_domstr con);
+      History.reconnect con;
+      info "%s reconnection complete" (Connection.get_domstr con)
+  )
 
diff --git a/tools/ocaml/xenstored/quota.ml b/tools/ocaml/xenstored/quota.ml
index 6e3d6401ae..300d78a50b 100644
--- a/tools/ocaml/xenstored/quota.ml
+++ b/tools/ocaml/xenstored/quota.ml
@@ -24,65 +24,65 @@ let maxent = ref (1000)
 let maxsize = ref (2048)
 
 type t = {
-	maxent: int;               (* max entities per domU *)
-	maxsize: int;              (* max size of data store in one node *)
-	cur: (Xenctrl.domid, int) Hashtbl.t; (* current domains quota *)
+  maxent: int;               (* max entities per domU *)
+  maxsize: int;              (* max size of data store in one node *)
+  cur: (Xenctrl.domid, int) Hashtbl.t; (* current domains quota *)
 }
 
 let to_string quota domid =
-	if Hashtbl.mem quota.cur domid
-	then Printf.sprintf "dom%i quota: %i/%i" domid (Hashtbl.find quota.cur domid) quota.maxent
-	else Printf.sprintf "dom%i quota: not set" domid
+  if Hashtbl.mem quota.cur domid
+  then Printf.sprintf "dom%i quota: %i/%i" domid (Hashtbl.find quota.cur domid) quota.maxent
+  else Printf.sprintf "dom%i quota: not set" domid
 
 let create () =
-	{ maxent = !maxent; maxsize = !maxsize; cur = Hashtbl.create 100; }
+  { maxent = !maxent; maxsize = !maxsize; cur = Hashtbl.create 100; }
 
 let copy quota = { quota with cur = (Hashtbl.copy quota.cur) }
 
 let del quota id = Hashtbl.remove quota.cur id
 
 let _check quota id size =
-	if size > quota.maxsize then (
-		warn "domain %u err create entry: data too big %d" id size;
-		raise Data_too_big
-	);
-	if id > 0 && Hashtbl.mem quota.cur id then
-		let entry = Hashtbl.find quota.cur id in
-		if entry >= quota.maxent then (
-			warn "domain %u cannot create entry: quota reached" id;
-			raise Limit_reached
-		)
+  if size > quota.maxsize then (
+    warn "domain %u err create entry: data too big %d" id size;
+    raise Data_too_big
+  );
+  if id > 0 && Hashtbl.mem quota.cur id then
+    let entry = Hashtbl.find quota.cur id in
+    if entry >= quota.maxent then (
+      warn "domain %u cannot create entry: quota reached" id;
+      raise Limit_reached
+    )
 
 let check quota id size =
-	if !activate then
-		_check quota id size
+  if !activate then
+    _check quota id size
 
 let get_entry quota id = Hashtbl.find quota.cur id
 
 let set_entry quota id nb =
-	if nb = 0
-	then Hashtbl.remove quota.cur id
-	else begin
-	if Hashtbl.mem quota.cur id then
-		Hashtbl.replace quota.cur id nb
-	else
-		Hashtbl.add quota.cur id nb
-	end
+  if nb = 0
+  then Hashtbl.remove quota.cur id
+  else begin
+    if Hashtbl.mem quota.cur id then
+      Hashtbl.replace quota.cur id nb
+    else
+      Hashtbl.add quota.cur id nb
+  end
 
 let del_entry quota id =
-	try
-		let nb = get_entry quota id in
-		set_entry quota id (nb - 1)
-	with Not_found -> ()
+  try
+    let nb = get_entry quota id in
+    set_entry quota id (nb - 1)
+  with Not_found -> ()
 
 let add_entry quota id =
-	let nb = try get_entry quota id with Not_found -> 0 in
-	set_entry quota id (nb + 1)
+  let nb = try get_entry quota id with Not_found -> 0 in
+  set_entry quota id (nb + 1)
 
 let add quota diff =
-	Hashtbl.iter (fun id nb -> set_entry quota id (get_entry quota id + nb)) diff.cur
+  Hashtbl.iter (fun id nb -> set_entry quota id (get_entry quota id + nb)) diff.cur
 
 let merge orig_quota mod_quota dest_quota =
-	  Hashtbl.iter (fun id nb -> let diff = nb - (try get_entry orig_quota id with Not_found -> 0) in
-				if diff <> 0 then
-					set_entry dest_quota id ((try get_entry dest_quota id with Not_found -> 0) + diff)) mod_quota.cur
+  Hashtbl.iter (fun id nb -> let diff = nb - (try get_entry orig_quota id with Not_found -> 0) in
+      if diff <> 0 then
+        set_entry dest_quota id ((try get_entry dest_quota id with Not_found -> 0) + diff)) mod_quota.cur
diff --git a/tools/ocaml/xenstored/select_stubs.c b/tools/ocaml/xenstored/select_stubs.c
index af72b84fa2..f2ef1ec3de 100644
--- a/tools/ocaml/xenstored/select_stubs.c
+++ b/tools/ocaml/xenstored/select_stubs.c
@@ -25,56 +25,56 @@
 
 CAMLprim value stub_select_on_poll(value fd_events, value timeo) {
 
-	CAMLparam2(fd_events, timeo);
-	CAMLlocal1(events);
-	int i, rc, c_len = Wosize_val(fd_events), c_timeo = Int_val(timeo);
-	struct pollfd c_fds[c_len];
+    CAMLparam2(fd_events, timeo);
+    CAMLlocal1(events);
+    int i, rc, c_len = Wosize_val(fd_events), c_timeo = Int_val(timeo);
+    struct pollfd c_fds[c_len];
 
 
-	for (i = 0; i < c_len; i++) {
+    for (i = 0; i < c_len; i++) {
 
-		events = Field(Field(fd_events, i), 1);
+        events = Field(Field(fd_events, i), 1);
 
-		c_fds[i].fd = Int_val(Field(Field(fd_events, i), 0));
-		c_fds[i].events = c_fds[i].revents = 0;
-		c_fds[i].events |= Bool_val(Field(events, 0)) ? POLLIN : 0;
-		c_fds[i].events |= Bool_val(Field(events, 1)) ? POLLOUT: 0;
-		c_fds[i].events |= Bool_val(Field(events, 2)) ? POLLPRI: 0;
+        c_fds[i].fd = Int_val(Field(Field(fd_events, i), 0));
+        c_fds[i].events = c_fds[i].revents = 0;
+        c_fds[i].events |= Bool_val(Field(events, 0)) ? POLLIN : 0;
+        c_fds[i].events |= Bool_val(Field(events, 1)) ? POLLOUT: 0;
+        c_fds[i].events |= Bool_val(Field(events, 2)) ? POLLPRI: 0;
 
-	};
+    };
 
-	caml_enter_blocking_section();
-	rc = poll(c_fds, c_len, c_timeo);
-	caml_leave_blocking_section();
+    caml_enter_blocking_section();
+    rc = poll(c_fds, c_len, c_timeo);
+    caml_leave_blocking_section();
 
-	if (rc < 0) uerror("poll", Nothing);
+    if (rc < 0) uerror("poll", Nothing);
 
-	if (rc > 0) {
+    if (rc > 0) {
 
-		for (i = 0; i < c_len; i++) {
+        for (i = 0; i < c_len; i++) {
 
-			events = Field(Field(fd_events, i), 1);
+            events = Field(Field(fd_events, i), 1);
 
-			if (c_fds[i].revents & POLLNVAL) unix_error(EBADF, "select", Nothing);
-			Field(events, 0) = Val_bool(c_fds[i].events & POLLIN  && c_fds[i].revents & (POLLIN |POLLHUP|POLLERR));
-			Field(events, 1) = Val_bool(c_fds[i].events & POLLOUT && c_fds[i].revents & (POLLOUT|POLLHUP|POLLERR));
-			Field(events, 2) = Val_bool(c_fds[i].revents & POLLPRI);
+            if (c_fds[i].revents & POLLNVAL) unix_error(EBADF, "select", Nothing);
+            Field(events, 0) = Val_bool(c_fds[i].events & POLLIN  && c_fds[i].revents & (POLLIN |POLLHUP|POLLERR));
+            Field(events, 1) = Val_bool(c_fds[i].events & POLLOUT && c_fds[i].revents & (POLLOUT|POLLHUP|POLLERR));
+            Field(events, 2) = Val_bool(c_fds[i].revents & POLLPRI);
 
-		}
+        }
 
-	}
+    }
 
-	CAMLreturn(Val_int(rc));
+    CAMLreturn(Val_int(rc));
 }
 
 
 CAMLprim value stub_set_fd_limit(value limit) {
 
-	CAMLparam1(limit);
-	struct rlimit rl;
+    CAMLparam1(limit);
+    struct rlimit rl;
 
-	rl.rlim_cur = rl.rlim_max = Int_val(limit);
-	if (setrlimit(RLIMIT_NOFILE, &rl) != 0) uerror("setrlimit", Nothing);
-	CAMLreturn(Val_unit);
+    rl.rlim_cur = rl.rlim_max = Int_val(limit);
+    if (setrlimit(RLIMIT_NOFILE, &rl) != 0) uerror("setrlimit", Nothing);
+    CAMLreturn(Val_unit);
 
 }
diff --git a/tools/ocaml/xenstored/stdext.ml b/tools/ocaml/xenstored/stdext.ml
index 116920917a..0ee4a5ab9c 100644
--- a/tools/ocaml/xenstored/stdext.ml
+++ b/tools/ocaml/xenstored/stdext.ml
@@ -19,137 +19,137 @@ type ('a, 'b) either = Right of 'a | Left of 'b
 
 (** apply the clean_f function after fct function has been called.
  * Even if fct raises an exception, clean_f is applied
- *)
+*)
 let exnhook = ref None
 
 let finally fct clean_f =
-	let result = try
-		fct ();
-	with
-		exn ->
-		  (match !exnhook with None -> () | Some f -> f exn);
-		  clean_f (); raise exn in
-	clean_f ();
-	result
+  let result = try
+      fct ();
+    with
+      exn ->
+      (match !exnhook with None -> () | Some f -> f exn);
+      clean_f (); raise exn in
+  clean_f ();
+  result
 
 (** if v is not none, apply f on it and return some value else return none. *)
 let may f v =
-	match v with Some x -> Some (f x) | None -> None
+  match v with Some x -> Some (f x) | None -> None
 
 (** default value to d if v is none. *)
 let default d v =
-	match v with Some x -> x | None -> d
+  match v with Some x -> x | None -> d
 
 (** apply f on v if not none *)
 let maybe f v =
-	match v with None -> () | Some x -> f x
+  match v with None -> () | Some x -> f x
 
 module Filename = struct
-	include Filename
-	let quote_command cmd args =
-		cmd :: args |> List.map quote |> String.concat " "
+  include Filename
+  let quote_command cmd args =
+    cmd :: args |> List.map quote |> String.concat " "
 end
 
 module Map = struct
-	module Make(Ord: Map.OrderedType) = struct
+  module Make(Ord: Map.OrderedType) = struct
 
-	include Map.Make(Ord)
+    include Map.Make(Ord)
 
-	let find_opt k t = try Some (find k t) with Not_found -> None
+    let find_opt k t = try Some (find k t) with Not_found -> None
 
-	let update k f t =
-		let r = find_opt k t in
-		let r' = f r in
-		match r, r' with
-		| None, None -> t
-		| Some _, None -> remove k t
-		| Some r, Some r' when r == r' -> t
-		| _, Some r' -> add k r' t
+    let update k f t =
+      let r = find_opt k t in
+      let r' = f r in
+      match r, r' with
+      | None, None -> t
+      | Some _, None -> remove k t
+      | Some r, Some r' when r == r' -> t
+      | _, Some r' -> add k r' t
 
-	end
+  end
 end
 
 module String = struct include String
 
-let of_char c = String.make 1 c
+  let of_char c = String.make 1 c
 
-let rec split ?limit:(limit=(-1)) c s =
-	let i = try String.index s c with Not_found -> -1 in
-	let nlimit = if limit = -1 || limit = 0 then limit else limit - 1 in
-	if i = -1 || nlimit = 0 then
-		[ s ]
-	else
-		let a = String.sub s 0 i
-		and b = String.sub s (i + 1) (String.length s - i - 1) in
-		a :: (split ~limit: nlimit c b)
+  let rec split ?limit:(limit=(-1)) c s =
+    let i = try String.index s c with Not_found -> -1 in
+    let nlimit = if limit = -1 || limit = 0 then limit else limit - 1 in
+    if i = -1 || nlimit = 0 then
+      [ s ]
+    else
+      let a = String.sub s 0 i
+      and b = String.sub s (i + 1) (String.length s - i - 1) in
+      a :: (split ~limit: nlimit c b)
 
-let fold_left f accu string =
-	let accu = ref accu in
-	for i = 0 to length string - 1 do
-		accu := f !accu string.[i]
-	done;
-	!accu
+  let fold_left f accu string =
+    let accu = ref accu in
+    for i = 0 to length string - 1 do
+      accu := f !accu string.[i]
+    done;
+    !accu
 
-(** True if string 'x' starts with prefix 'prefix' *)
-let startswith prefix x =
-	let x_l = String.length x and prefix_l = String.length prefix in
-	prefix_l <= x_l && String.sub x 0 prefix_l  = prefix
+  (** True if string 'x' starts with prefix 'prefix' *)
+  let startswith prefix x =
+    let x_l = String.length x and prefix_l = String.length prefix in
+    prefix_l <= x_l && String.sub x 0 prefix_l  = prefix
 end
 
 module Unixext = struct
 
-(** remove a file, but doesn't raise an exception if the file is already removed *)
-let unlink_safe file =
-	try Unix.unlink file with (* Unix.Unix_error (Unix.ENOENT, _ , _)*) _ -> ()
+  (** remove a file, but doesn't raise an exception if the file is already removed *)
+  let unlink_safe file =
+    try Unix.unlink file with (* Unix.Unix_error (Unix.ENOENT, _ , _)*) _ -> ()
 
-(** create a directory but doesn't raise an exception if the directory already exist *)
-let mkdir_safe dir perm =
-	try Unix.mkdir dir perm with Unix.Unix_error (Unix.EEXIST, _, _) -> ()
+  (** create a directory but doesn't raise an exception if the directory already exist *)
+  let mkdir_safe dir perm =
+    try Unix.mkdir dir perm with Unix.Unix_error (Unix.EEXIST, _, _) -> ()
 
-(** create a directory, and create parent if doesn't exist *)
-let mkdir_rec dir perm =
-	let rec p_mkdir dir =
-		let p_name = Filename.dirname dir in
-		if p_name <> "/" && p_name <> "."
-		then p_mkdir p_name;
-		mkdir_safe dir perm in
-	p_mkdir dir
+  (** create a directory, and create parent if doesn't exist *)
+  let mkdir_rec dir perm =
+    let rec p_mkdir dir =
+      let p_name = Filename.dirname dir in
+      if p_name <> "/" && p_name <> "."
+      then p_mkdir p_name;
+      mkdir_safe dir perm in
+    p_mkdir dir
 
-(** daemonize a process *)
-(* !! Must call this before spawning any threads !! *)
-let daemonize () =
-	match Unix.fork () with
-	| 0 ->
-		if Unix.setsid () == -1 then
-			failwith "Unix.setsid failed";
+  (** daemonize a process *)
+  (* !! Must call this before spawning any threads !! *)
+  let daemonize () =
+    match Unix.fork () with
+    | 0 ->
+      if Unix.setsid () == -1 then
+        failwith "Unix.setsid failed";
 
-		begin match Unix.fork () with
-		| 0 ->
-			let nullfd = Unix.openfile "/dev/null" [ Unix.O_RDWR ] 0 in
-			begin try
-				Unix.dup2 nullfd Unix.stdin;
-				Unix.dup2 nullfd Unix.stdout;
-				Unix.dup2 nullfd Unix.stderr;
-			with exn -> Unix.close nullfd; raise exn
-			end;
-			Unix.close nullfd
-		| _ -> exit 0
-		end
-	| _ -> exit 0
+      begin match Unix.fork () with
+        | 0 ->
+          let nullfd = Unix.openfile "/dev/null" [ Unix.O_RDWR ] 0 in
+          begin try
+              Unix.dup2 nullfd Unix.stdin;
+              Unix.dup2 nullfd Unix.stdout;
+              Unix.dup2 nullfd Unix.stderr;
+            with exn -> Unix.close nullfd; raise exn
+          end;
+          Unix.close nullfd
+        | _ -> exit 0
+      end
+    | _ -> exit 0
 
-(** write a pidfile file *)
-let pidfile_write filename =
-	let fd = Unix.openfile filename
-	                       [ Unix.O_WRONLY; Unix.O_CREAT; Unix.O_TRUNC; ]
-			       0o640 in
-	finally
-	(fun () ->
-		let pid = Unix.getpid () in
-		let buf = string_of_int pid ^ "\n" in
-		let len = String.length buf in
-		if Unix.write_substring fd buf 0 len <> len
-		then failwith "pidfile_write failed";
-	)
-	(fun () -> Unix.close fd)
+  (** write a pidfile file *)
+  let pidfile_write filename =
+    let fd = Unix.openfile filename
+        [ Unix.O_WRONLY; Unix.O_CREAT; Unix.O_TRUNC; ]
+        0o640 in
+    finally
+      (fun () ->
+         let pid = Unix.getpid () in
+         let buf = string_of_int pid ^ "\n" in
+         let len = String.length buf in
+         if Unix.write_substring fd buf 0 len <> len
+         then failwith "pidfile_write failed";
+      )
+      (fun () -> Unix.close fd)
 
 end
diff --git a/tools/ocaml/xenstored/store.ml b/tools/ocaml/xenstored/store.ml
index c94dbf3a62..38a4945372 100644
--- a/tools/ocaml/xenstored/store.ml
+++ b/tools/ocaml/xenstored/store.ml
@@ -20,231 +20,231 @@ module SymbolMap = Map.Make(Symbol)
 
 module Node = struct
 
-type t = {
-	name: Symbol.t;
-	perms: Perms.Node.t;
-	value: string;
-	children: t SymbolMap.t;
-}
+  type t = {
+    name: Symbol.t;
+    perms: Perms.Node.t;
+    value: string;
+    children: t SymbolMap.t;
+  }
 
-let create _name _perms _value =
-	{ name = Symbol.of_string _name; perms = _perms; value = _value; children = SymbolMap.empty; }
+  let create _name _perms _value =
+    { name = Symbol.of_string _name; perms = _perms; value = _value; children = SymbolMap.empty; }
 
-let get_owner node = Perms.Node.get_owner node.perms
-let get_children node = node.children
-let get_value node = node.value
-let get_perms node = node.perms
-let get_name node = Symbol.to_string node.name
+  let get_owner node = Perms.Node.get_owner node.perms
+  let get_children node = node.children
+  let get_value node = node.value
+  let get_perms node = node.perms
+  let get_name node = Symbol.to_string node.name
 
-let set_value node nvalue =
-	if node.value = nvalue
-	then node
-	else { node with value = nvalue }
+  let set_value node nvalue =
+    if node.value = nvalue
+    then node
+    else { node with value = nvalue }
 
-let set_perms node nperms = { node with perms = nperms }
+  let set_perms node nperms = { node with perms = nperms }
 
-let add_child node child =
-	let children = SymbolMap.add child.name child node.children in
-	{ node with children }
+  let add_child node child =
+    let children = SymbolMap.add child.name child node.children in
+    { node with children }
 
-let exists node childname =
-	let childname = Symbol.of_string childname in
-	SymbolMap.mem childname node.children
+  let exists node childname =
+    let childname = Symbol.of_string childname in
+    SymbolMap.mem childname node.children
 
-let find node childname =
-	let childname = Symbol.of_string childname in
-	SymbolMap.find childname node.children
+  let find node childname =
+    let childname = Symbol.of_string childname in
+    SymbolMap.find childname node.children
 
-let replace_child node child nchild =
-	{ node with
-	  children = SymbolMap.update child.name
-			(function None -> None | Some _ -> Some nchild)
-			node.children
-	}
+  let replace_child node child nchild =
+    { node with
+      children = SymbolMap.update child.name
+          (function None -> None | Some _ -> Some nchild)
+          node.children
+    }
 
-let del_childname node childname =
-	let sym = Symbol.of_string childname in
-	{ node with children =
-		SymbolMap.update sym
-			(function None -> raise Not_found | Some _ -> None)
-			node.children
-	}
+  let del_childname node childname =
+    let sym = Symbol.of_string childname in
+    { node with children =
+                  SymbolMap.update sym
+                    (function None -> raise Not_found | Some _ -> None)
+                    node.children
+    }
 
-let del_all_children node =
-	{ node with children = SymbolMap.empty }
+  let del_all_children node =
+    { node with children = SymbolMap.empty }
 
-(* check if the current node can be accessed by the current connection with rperm permissions *)
-let check_perm node connection request =
-	Perms.check connection request node.perms
+  (* check if the current node can be accessed by the current connection with rperm permissions *)
+  let check_perm node connection request =
+    Perms.check connection request node.perms
 
-(* check if the current node is owned by the current connection *)
-let check_owner node connection =
-	if not (Perms.check_owner connection node.perms)
-	then begin
-		Logging.info "store|node" "Permission denied: Domain %d not owner" (get_owner node);
-		raise Define.Permission_denied;
-	end
+  (* check if the current node is owned by the current connection *)
+  let check_owner node connection =
+    if not (Perms.check_owner connection node.perms)
+    then begin
+      Logging.info "store|node" "Permission denied: Domain %d not owner" (get_owner node);
+      raise Define.Permission_denied;
+    end
 
-let rec recurse fct node = fct node; SymbolMap.iter (fun _ -> recurse fct) node.children
+  let rec recurse fct node = fct node; SymbolMap.iter (fun _ -> recurse fct) node.children
 
-(** [recurse_filter_map f tree] applies [f] on each node in the tree recursively,
-    possibly removing some nodes.
-    Note that the nodes removed this way won't generate watch events.
-*)
-let recurse_filter_map f =
-	let invalid = -1 in
-	let is_valid _ node = node.perms.owner <> invalid in
-	let rec walk node =
-		(* Map.filter_map is Ocaml 4.11+ only *)
-		let node =
-		{ node with children =
-			SymbolMap.map walk node.children |> SymbolMap.filter is_valid } in
-		match f node with
-		| Some keep -> keep
-		| None -> { node with perms = {node.perms with owner = invalid } }
-	in
-	walk
+  (** [recurse_filter_map f tree] applies [f] on each node in the tree recursively,
+      possibly removing some nodes.
+      Note that the nodes removed this way won't generate watch events.
+  *)
+  let recurse_filter_map f =
+    let invalid = -1 in
+    let is_valid _ node = node.perms.owner <> invalid in
+    let rec walk node =
+      (* Map.filter_map is Ocaml 4.11+ only *)
+      let node =
+        { node with children =
+                      SymbolMap.map walk node.children |> SymbolMap.filter is_valid } in
+      match f node with
+      | Some keep -> keep
+      | None -> { node with perms = {node.perms with owner = invalid } }
+    in
+    walk
 
-let unpack node = (Symbol.to_string node.name, node.perms, node.value)
+  let unpack node = (Symbol.to_string node.name, node.perms, node.value)
 
 end
 
 module Path = struct
 
-(* represent a path in a store.
- * [] -> "/"
- * [ "local"; "domain"; "1" ] -> "/local/domain/1"
- *)
-type t = string list
+  (* represent a path in a store.
+   * [] -> "/"
+   * [ "local"; "domain"; "1" ] -> "/local/domain/1"
+  *)
+  type t = string list
 
-let char_is_valid c =
-	(c >= 'a' && c <= 'z') ||
-	(c >= 'A' && c <= 'Z') ||
-	(c >= '0' && c <= '9') ||
-	c = '_' || c = '-' || c = '@'
+  let char_is_valid c =
+    (c >= 'a' && c <= 'z') ||
+    (c >= 'A' && c <= 'Z') ||
+    (c >= '0' && c <= '9') ||
+    c = '_' || c = '-' || c = '@'
 
-let name_is_valid name =
-	name <> "" && String.fold_left (fun accu c -> accu && char_is_valid c) true name
+  let name_is_valid name =
+    name <> "" && String.fold_left (fun accu c -> accu && char_is_valid c) true name
 
-let is_valid path =
-	List.for_all name_is_valid path
+  let is_valid path =
+    List.for_all name_is_valid path
 
-let of_string s =
-	if s.[0] = '@'
-	then [s]
-	else if s = "/"
-	then []
-	else match String.split '/' s with
-		| "" :: path when is_valid path -> path
-		| _ -> raise Define.Invalid_path
+  let of_string s =
+    if s.[0] = '@'
+    then [s]
+    else if s = "/"
+    then []
+    else match String.split '/' s with
+      | "" :: path when is_valid path -> path
+      | _ -> raise Define.Invalid_path
 
-let of_path_and_name path name =
-	match path, name with
-	| [], "" -> []
-	| _ -> path @ [name]
+  let of_path_and_name path name =
+    match path, name with
+    | [], "" -> []
+    | _ -> path @ [name]
 
-let create path connection_path =
-	of_string (Utils.path_validate path connection_path)
+  let create path connection_path =
+    of_string (Utils.path_validate path connection_path)
 
-let to_string t =
-	"/" ^ (String.concat "/" t)
+  let to_string t =
+    "/" ^ (String.concat "/" t)
 
-let to_string_list x = x
+  let to_string_list x = x
 
-let get_parent t =
-	if t = [] then [] else List.rev (List.tl (List.rev t))
+  let get_parent t =
+    if t = [] then [] else List.rev (List.tl (List.rev t))
 
-let get_hierarchy path =
-	Utils.get_hierarchy path
+  let get_hierarchy path =
+    Utils.get_hierarchy path
 
-let get_common_prefix p1 p2 =
-	let rec compare l1 l2 =
-		match l1, l2 with
-		| h1 :: tl1, h2 :: tl2 ->
-			if h1 = h2 then h1 :: (compare tl1 tl2) else []
-		| _, [] | [], _ ->
-			(* if l1 or l2 is empty, we found the equal part already *)
-			[]
-		in
-	compare p1 p2
+  let get_common_prefix p1 p2 =
+    let rec compare l1 l2 =
+      match l1, l2 with
+      | h1 :: tl1, h2 :: tl2 ->
+        if h1 = h2 then h1 :: (compare tl1 tl2) else []
+      | _, [] | [], _ ->
+        (* if l1 or l2 is empty, we found the equal part already *)
+        []
+    in
+    compare p1 p2
 
-let rec lookup_modify node path fct =
-	match path with
-	| []      -> raise (Define.Invalid_path)
-	| h :: [] -> fct node h
-	| h :: l  ->
-		let (n, c) =
-			if not (Node.exists node h) then
-				raise (Define.Lookup_Doesnt_exist h)
-			else
-				(node, Node.find node h) in
-		let nc = lookup_modify c l fct in
-		Node.replace_child n c nc
+  let rec lookup_modify node path fct =
+    match path with
+    | []      -> raise (Define.Invalid_path)
+    | h :: [] -> fct node h
+    | h :: l  ->
+      let (n, c) =
+        if not (Node.exists node h) then
+          raise (Define.Lookup_Doesnt_exist h)
+        else
+          (node, Node.find node h) in
+      let nc = lookup_modify c l fct in
+      Node.replace_child n c nc
 
-let apply_modify rnode path fct =
-	lookup_modify rnode path fct
+  let apply_modify rnode path fct =
+    lookup_modify rnode path fct
 
-let rec lookup_get node path =
-	match path with
-	| []      -> raise (Define.Invalid_path)
-	| h :: [] ->
-		(try
-			Node.find node h
-		with Not_found ->
-			raise Define.Doesnt_exist)
-	| h :: l  -> let cnode = Node.find node h in lookup_get cnode l
+  let rec lookup_get node path =
+    match path with
+    | []      -> raise (Define.Invalid_path)
+    | h :: [] ->
+      (try
+         Node.find node h
+       with Not_found ->
+         raise Define.Doesnt_exist)
+    | h :: l  -> let cnode = Node.find node h in lookup_get cnode l
 
-let get_node rnode path =
-	if path = [] then
-		Some rnode
-	else (
-		try Some (lookup_get rnode path) with Define.Doesnt_exist -> None
-	)
+  let get_node rnode path =
+    if path = [] then
+      Some rnode
+    else (
+      try Some (lookup_get rnode path) with Define.Doesnt_exist -> None
+    )
 
-(* get the deepest existing node for this path, return the node and a flag on the existence of the full path *)
-let rec get_deepest_existing_node node = function
-	| [] -> node, true
-	| h :: t ->
-		try get_deepest_existing_node (Node.find node h) t
-		with Not_found -> node, false
+  (* get the deepest existing node for this path, return the node and a flag on the existence of the full path *)
+  let rec get_deepest_existing_node node = function
+    | [] -> node, true
+    | h :: t ->
+      try get_deepest_existing_node (Node.find node h) t
+      with Not_found -> node, false
 
-let set_node rnode path nnode =
-	if path = [] then
-		nnode
-	else
-		let set_node node name =
-			try
-				let ent = Node.find node name in
-				Node.replace_child node ent nnode
-			with Not_found ->
-				Node.add_child node nnode
-			in
-		apply_modify rnode path set_node
+  let set_node rnode path nnode =
+    if path = [] then
+      nnode
+    else
+      let set_node node name =
+        try
+          let ent = Node.find node name in
+          Node.replace_child node ent nnode
+        with Not_found ->
+          Node.add_child node nnode
+      in
+      apply_modify rnode path set_node
 
-(* read | ls | getperms use this *)
-let rec lookup node path fct =
-	match path with
-	| []      -> raise (Define.Invalid_path)
-	| h :: [] -> fct node h
-	| h :: l  -> let cnode = Node.find node h in lookup cnode l fct
+  (* read | ls | getperms use this *)
+  let rec lookup node path fct =
+    match path with
+    | []      -> raise (Define.Invalid_path)
+    | h :: [] -> fct node h
+    | h :: l  -> let cnode = Node.find node h in lookup cnode l fct
 
-let apply rnode path fct =
-	lookup rnode path fct
+  let apply rnode path fct =
+    lookup rnode path fct
 
-let introduce_domain = "@introduceDomain"
-let release_domain = "@releaseDomain"
-let specials = List.map of_string [ introduce_domain; release_domain ]
+  let introduce_domain = "@introduceDomain"
+  let release_domain = "@releaseDomain"
+  let specials = List.map of_string [ introduce_domain; release_domain ]
 
 end
 
 (* The Store.t type *)
 type t =
-{
-	mutable stat_transaction_coalesce: int;
-	mutable stat_transaction_abort: int;
-	mutable root: Node.t;
-	mutable quota: Quota.t;
-}
+  {
+    mutable stat_transaction_coalesce: int;
+    mutable stat_transaction_abort: int;
+    mutable root: Node.t;
+    mutable quota: Quota.t;
+  }
 
 let get_root store = store.root
 let set_root store root = store.root <- root
@@ -254,149 +254,149 @@ let set_quota store quota = store.quota <- quota
 
 (* modifying functions *)
 let path_mkdir store perm path =
-	let do_mkdir node name =
-		try
-			let ent = Node.find node name in
-			Node.check_perm ent perm Perms.WRITE;
-			raise Define.Already_exist
-		with Not_found ->
-			Node.check_perm node perm Perms.WRITE;
-			Node.add_child node (Node.create name node.Node.perms "") in
-	if path = [] then
-		store.root
-	else
-		Path.apply_modify store.root path do_mkdir
+  let do_mkdir node name =
+    try
+      let ent = Node.find node name in
+      Node.check_perm ent perm Perms.WRITE;
+      raise Define.Already_exist
+    with Not_found ->
+      Node.check_perm node perm Perms.WRITE;
+      Node.add_child node (Node.create name node.Node.perms "") in
+  if path = [] then
+    store.root
+  else
+    Path.apply_modify store.root path do_mkdir
 
 let path_write store perm path value =
-	let node_created = ref false in
-	let do_write node name =
-		try
-			let ent = Node.find node name in
-			Node.check_perm ent perm Perms.WRITE;
-			let nent = Node.set_value ent value in
-			Node.replace_child node ent nent
-		with Not_found ->
-			node_created := true;
-			Node.check_perm node perm Perms.WRITE;
-			Node.add_child node (Node.create name node.Node.perms value) in
-	if path = [] then (
-		Node.check_perm store.root perm Perms.WRITE;
-		Node.set_value store.root value, false
-	) else
-		let root = Path.apply_modify store.root path do_write in
-		root, !node_created
+  let node_created = ref false in
+  let do_write node name =
+    try
+      let ent = Node.find node name in
+      Node.check_perm ent perm Perms.WRITE;
+      let nent = Node.set_value ent value in
+      Node.replace_child node ent nent
+    with Not_found ->
+      node_created := true;
+      Node.check_perm node perm Perms.WRITE;
+      Node.add_child node (Node.create name node.Node.perms value) in
+  if path = [] then (
+    Node.check_perm store.root perm Perms.WRITE;
+    Node.set_value store.root value, false
+  ) else
+    let root = Path.apply_modify store.root path do_write in
+    root, !node_created
 
 let path_rm store perm path =
-	let do_rm node name =
-		try
-			let ent = Node.find node name in
-			Node.check_perm ent perm Perms.WRITE;
-			Node.del_childname node name
-		with Not_found ->
-			raise Define.Doesnt_exist in
-	if path = [] then (
-		Node.check_perm store.root perm Perms.WRITE;
-		Node.del_all_children store.root
-	) else
-		Path.apply_modify store.root path do_rm
+  let do_rm node name =
+    try
+      let ent = Node.find node name in
+      Node.check_perm ent perm Perms.WRITE;
+      Node.del_childname node name
+    with Not_found ->
+      raise Define.Doesnt_exist in
+  if path = [] then (
+    Node.check_perm store.root perm Perms.WRITE;
+    Node.del_all_children store.root
+  ) else
+    Path.apply_modify store.root path do_rm
 
 let path_setperms store perm path perms =
-	if path = [] then (
-		Node.check_perm store.root perm Perms.WRITE;
-		Node.set_perms store.root perms
-	) else
-		let do_setperms node name =
-			let c = Node.find node name in
-			Node.check_owner c perm;
-			Node.check_perm c perm Perms.WRITE;
-			let nc = Node.set_perms c perms in
-			Node.replace_child node c nc
-		in
-		Path.apply_modify store.root path do_setperms
+  if path = [] then (
+    Node.check_perm store.root perm Perms.WRITE;
+    Node.set_perms store.root perms
+  ) else
+    let do_setperms node name =
+      let c = Node.find node name in
+      Node.check_owner c perm;
+      Node.check_perm c perm Perms.WRITE;
+      let nc = Node.set_perms c perms in
+      Node.replace_child node c nc
+    in
+    Path.apply_modify store.root path do_setperms
 
 (* accessing functions *)
 let get_node store path =
-	Path.get_node store.root path
+  Path.get_node store.root path
 
 let get_deepest_existing_node store path =
-	Path.get_deepest_existing_node store.root path
+  Path.get_deepest_existing_node store.root path
 
 let read store perm path =
-	let do_read node name =
-		let ent = Node.find node name in
-		Node.check_perm ent perm Perms.READ;
-		ent.Node.value
-	in
-	if path = [] then (
-		let ent = store.root in
-		Node.check_perm ent perm Perms.READ;
-		ent.Node.value
-	) else
-		Path.apply store.root path do_read
+  let do_read node name =
+    let ent = Node.find node name in
+    Node.check_perm ent perm Perms.READ;
+    ent.Node.value
+  in
+  if path = [] then (
+    let ent = store.root in
+    Node.check_perm ent perm Perms.READ;
+    ent.Node.value
+  ) else
+    Path.apply store.root path do_read
 
 let ls store perm path =
-	let children =
-		if path = [] then (
-			Node.check_perm store.root perm Perms.READ;
-			Node.get_children store.root
-		) else
-			let do_ls node name =
-				let cnode = Node.find node name in
-				Node.check_perm cnode perm Perms.READ;
-				cnode.Node.children in
-			Path.apply store.root path do_ls in
-	SymbolMap.fold (fun k _ accu -> Symbol.to_string k :: accu) children []
+  let children =
+    if path = [] then (
+      Node.check_perm store.root perm Perms.READ;
+      Node.get_children store.root
+    ) else
+      let do_ls node name =
+        let cnode = Node.find node name in
+        Node.check_perm cnode perm Perms.READ;
+        cnode.Node.children in
+      Path.apply store.root path do_ls in
+  SymbolMap.fold (fun k _ accu -> Symbol.to_string k :: accu) children []
 
 let getperms store perm path =
-	if path = [] then (
-		Node.check_perm store.root perm Perms.READ;
-		Node.get_perms store.root
-	) else
-		let fct n name =
-			let c = Node.find n name in
-			Node.check_perm c perm Perms.READ;
-			c.Node.perms in
-		Path.apply store.root path fct
+  if path = [] then (
+    Node.check_perm store.root perm Perms.READ;
+    Node.get_perms store.root
+  ) else
+    let fct n name =
+      let c = Node.find n name in
+      Node.check_perm c perm Perms.READ;
+      c.Node.perms in
+    Path.apply store.root path fct
 
 let path_exists store path =
-	if path = [] then
-		true
-	else
-		try
-			let check_exist node name =
-				ignore(Node.find node name);
-				true in
-			Path.apply store.root path check_exist
-		with Not_found -> false
+  if path = [] then
+    true
+  else
+    try
+      let check_exist node name =
+        ignore(Node.find node name);
+        true in
+      Path.apply store.root path check_exist
+    with Not_found -> false
 
 
 (* others utils *)
 let traversal root_node f =
-	let rec _traversal path node =
-		f path node;
-		let node_path = Path.of_path_and_name path (Symbol.to_string node.Node.name) in
-		SymbolMap.iter (fun _ -> _traversal node_path) node.Node.children
-		in
-	_traversal [] root_node
+  let rec _traversal path node =
+    f path node;
+    let node_path = Path.of_path_and_name path (Symbol.to_string node.Node.name) in
+    SymbolMap.iter (fun _ -> _traversal node_path) node.Node.children
+  in
+  _traversal [] root_node
 
 let dump_store_buf root_node =
-	let buf = Buffer.create 8192 in
-	let dump_node path node =
-		let pathstr = String.concat "/" path in
-		Printf.bprintf buf "%s/%s{%s}" pathstr (Symbol.to_string node.Node.name)
-		               (String.escaped (Perms.Node.to_string (Node.get_perms node)));
-		if String.length node.Node.value > 0 then
-			Printf.bprintf buf " = %s\n" (String.escaped node.Node.value)
-		else
-			Printf.bprintf buf "\n";
-		in
-	traversal root_node dump_node;
-	buf
+  let buf = Buffer.create 8192 in
+  let dump_node path node =
+    let pathstr = String.concat "/" path in
+    Printf.bprintf buf "%s/%s{%s}" pathstr (Symbol.to_string node.Node.name)
+      (String.escaped (Perms.Node.to_string (Node.get_perms node)));
+    if String.length node.Node.value > 0 then
+      Printf.bprintf buf " = %s\n" (String.escaped node.Node.value)
+    else
+      Printf.bprintf buf "\n";
+  in
+  traversal root_node dump_node;
+  buf
 
 let dump_store chan root_node =
-	let buf = dump_store_buf root_node in
-	output_string chan (Buffer.contents buf);
-	Buffer.reset buf
+  let buf = dump_store_buf root_node in
+  output_string chan (Buffer.contents buf);
+  Buffer.reset buf
 
 let dump_fct store f = traversal store.root f
 let dump store out_chan = dump_store out_chan store.root
@@ -406,109 +406,109 @@ let dump_buffer store = dump_store_buf store.root
 
 (* modifying functions with quota udpate *)
 let set_node store path node orig_quota mod_quota =
-	let root = Path.set_node store.root path node in
-	store.root <- root;
-	Quota.merge orig_quota mod_quota store.quota
+  let root = Path.set_node store.root path node in
+  store.root <- root;
+  Quota.merge orig_quota mod_quota store.quota
 
 let write store perm path value =
-	let node, existing = get_deepest_existing_node store path in
-	let owner = Node.get_owner node in
-	if existing || (Perms.Connection.is_dom0 perm) then
-		(* Only check the string length limit *)
-		Quota.check store.quota (-1) (String.length value)
-	else
-		(* Check the domain entries limit too *)
-		Quota.check store.quota owner (String.length value);
-	let root, node_created = path_write store perm path value in
-	store.root <- root;
-	if node_created
-	then Quota.add_entry store.quota owner
+  let node, existing = get_deepest_existing_node store path in
+  let owner = Node.get_owner node in
+  if existing || (Perms.Connection.is_dom0 perm) then
+    (* Only check the string length limit *)
+    Quota.check store.quota (-1) (String.length value)
+  else
+    (* Check the domain entries limit too *)
+    Quota.check store.quota owner (String.length value);
+  let root, node_created = path_write store perm path value in
+  store.root <- root;
+  if node_created
+  then Quota.add_entry store.quota owner
 
 let mkdir store perm path =
-	let node, existing = get_deepest_existing_node store path in
-	let owner = Node.get_owner node in
-	(* It's upt to the mkdir logic to decide what to do with existing path *)
-	if not (existing || (Perms.Connection.is_dom0 perm)) then Quota.check store.quota owner 0;
-	store.root <- path_mkdir store perm path;
-	if not existing then
-	Quota.add_entry store.quota owner
+  let node, existing = get_deepest_existing_node store path in
+  let owner = Node.get_owner node in
+  (* It's upt to the mkdir logic to decide what to do with existing path *)
+  if not (existing || (Perms.Connection.is_dom0 perm)) then Quota.check store.quota owner 0;
+  store.root <- path_mkdir store perm path;
+  if not existing then
+    Quota.add_entry store.quota owner
 
 let rm store perm path =
-	let rmed_node = Path.get_node store.root path in
-	match rmed_node with
-	| None -> raise Define.Doesnt_exist
-	| Some rmed_node ->
-		store.root <- path_rm store perm path;
-		Node.recurse (fun node -> Quota.del_entry store.quota (Node.get_owner node)) rmed_node
+  let rmed_node = Path.get_node store.root path in
+  match rmed_node with
+  | None -> raise Define.Doesnt_exist
+  | Some rmed_node ->
+    store.root <- path_rm store perm path;
+    Node.recurse (fun node -> Quota.del_entry store.quota (Node.get_owner node)) rmed_node
 
 let setperms store perm path nperms =
-	match Path.get_node store.root path with
-	| None -> raise Define.Doesnt_exist
-	| Some node ->
-		let old_owner = Node.get_owner node in
-		let new_owner = Perms.Node.get_owner nperms in
-		if not ((old_owner = new_owner) || (Perms.Connection.is_dom0 perm)) then
-			raise Define.Permission_denied;
-		store.root <- path_setperms store perm path nperms;
-		Quota.del_entry store.quota old_owner;
-		Quota.add_entry store.quota new_owner
+  match Path.get_node store.root path with
+  | None -> raise Define.Doesnt_exist
+  | Some node ->
+    let old_owner = Node.get_owner node in
+    let new_owner = Perms.Node.get_owner nperms in
+    if not ((old_owner = new_owner) || (Perms.Connection.is_dom0 perm)) then
+      raise Define.Permission_denied;
+    store.root <- path_setperms store perm path nperms;
+    Quota.del_entry store.quota old_owner;
+    Quota.add_entry store.quota new_owner
 
 let reset_permissions store domid =
-	Logging.info "store|node" "Cleaning up xenstore ACLs for domid %d" domid;
-	store.root <- Node.recurse_filter_map (fun node ->
-		match Perms.Node.remove_domid ~domid node.perms with
-		| None -> None
-		| Some perms ->
-			if perms <> node.perms then
-				Logging.debug "store|node" "Changed permissions for node %s" (Node.get_name node);
-			Some { node with Node.perms }
-	) store.root
+  Logging.info "store|node" "Cleaning up xenstore ACLs for domid %d" domid;
+  store.root <- Node.recurse_filter_map (fun node ->
+      match Perms.Node.remove_domid ~domid node.perms with
+      | None -> None
+      | Some perms ->
+        if perms <> node.perms then
+          Logging.debug "store|node" "Changed permissions for node %s" (Node.get_name node);
+        Some { node with Node.perms }
+    ) store.root
 
 type ops = {
-	store: t;
-	write: Path.t -> string -> unit;
-	mkdir: Path.t -> unit;
-	rm: Path.t -> unit;
-	setperms: Path.t -> Perms.Node.t -> unit;
-	ls: Path.t -> string list;
-	read: Path.t -> string;
-	getperms: Path.t -> Perms.Node.t;
-	path_exists: Path.t -> bool;
+  store: t;
+  write: Path.t -> string -> unit;
+  mkdir: Path.t -> unit;
+  rm: Path.t -> unit;
+  setperms: Path.t -> Perms.Node.t -> unit;
+  ls: Path.t -> string list;
+  read: Path.t -> string;
+  getperms: Path.t -> Perms.Node.t;
+  path_exists: Path.t -> bool;
 }
 
 let get_ops store perms = {
-	store = store;
-	write = write store perms;
-	mkdir = mkdir store perms;
-	rm = rm store perms;
-	setperms = setperms store perms;
-	ls = ls store perms;
-	read = read store perms;
-	getperms = getperms store perms;
-	path_exists = path_exists store;
+  store = store;
+  write = write store perms;
+  mkdir = mkdir store perms;
+  rm = rm store perms;
+  setperms = setperms store perms;
+  ls = ls store perms;
+  read = read store perms;
+  getperms = getperms store perms;
+  path_exists = path_exists store;
 }
 
 let create () = {
-	stat_transaction_coalesce = 0;
-	stat_transaction_abort = 0;
-	root = Node.create "" Perms.Node.default0 "";
-	quota = Quota.create ();
+  stat_transaction_coalesce = 0;
+  stat_transaction_abort = 0;
+  root = Node.create "" Perms.Node.default0 "";
+  quota = Quota.create ();
 }
 let copy store = {
-	stat_transaction_coalesce = store.stat_transaction_coalesce;
-	stat_transaction_abort = store.stat_transaction_abort;
-	root = store.root;
-	quota = Quota.copy store.quota;
+  stat_transaction_coalesce = store.stat_transaction_coalesce;
+  stat_transaction_abort = store.stat_transaction_abort;
+  root = store.root;
+  quota = Quota.copy store.quota;
 }
 
 let incr_transaction_coalesce store =
-	store.stat_transaction_coalesce <- store.stat_transaction_coalesce + 1
+  store.stat_transaction_coalesce <- store.stat_transaction_coalesce + 1
 let incr_transaction_abort store =
-	store.stat_transaction_abort <- store.stat_transaction_abort + 1
+  store.stat_transaction_abort <- store.stat_transaction_abort + 1
 
 let stats store =
-	let nb_nodes = ref 0 in
-	traversal store.root (fun _path _node ->
-		incr nb_nodes
-	);
-	!nb_nodes, store.stat_transaction_abort, store.stat_transaction_coalesce
+  let nb_nodes = ref 0 in
+  traversal store.root (fun _path _node ->
+      incr nb_nodes
+    );
+  !nb_nodes, store.stat_transaction_abort, store.stat_transaction_coalesce
diff --git a/tools/ocaml/xenstored/symbol.ml b/tools/ocaml/xenstored/symbol.ml
index 72a84ebf80..02298a04ca 100644
--- a/tools/ocaml/xenstored/symbol.ml
+++ b/tools/ocaml/xenstored/symbol.ml
@@ -18,7 +18,7 @@ module WeakTable = Weak.Make(struct
     type t = string
     let equal (x:string) (y:string) = (x = y)
     let hash = Hashtbl.hash
-end)
+  end)
 
 type t = string
 
diff --git a/tools/ocaml/xenstored/syslog.ml b/tools/ocaml/xenstored/syslog.ml
index a95da2fd7b..cc5816a868 100644
--- a/tools/ocaml/xenstored/syslog.ml
+++ b/tools/ocaml/xenstored/syslog.ml
@@ -15,32 +15,32 @@
 type level = Emerg | Alert | Crit | Err | Warning | Notice | Info | Debug
 type facility = Auth | Authpriv | Cron | Daemon | Ftp | Kern
               | Local0 | Local1 | Local2 | Local3
-	      | Local4 | Local5 | Local6 | Local7
-	      | Lpr | Mail | News | Syslog | User | Uucp
+              | Local4 | Local5 | Local6 | Local7
+              | Lpr | Mail | News | Syslog | User | Uucp
 
 external log : facility -> level -> string -> unit = "stub_syslog"
 
 exception Unknown_facility of string
 let facility_of_string s =
-	match s with
-    |"auth"->Auth
-    |"authpriv"->Authpriv
-    |"cron"->Cron
-    |"daemon"->Daemon
-    |"ftp"->Ftp
-    |"kern"->Kern
-    |"local0"->Local0
-    |"local1"->Local1
-    |"local2"->Local2
-    |"local3"->Local3
-    |"local4"->Local4
-    |"local5"->Local5
-    |"local6"->Local6
-    |"local7"->Local7
-    |"lpr"->Lpr
-    |"mail"->Mail
-    |"news"->News
-    |"syslog"->Syslog
-    |"user"->User
-    |"uucp"->Uucp
-		|_-> raise (Unknown_facility s)
+  match s with
+  |"auth"->Auth
+  |"authpriv"->Authpriv
+  |"cron"->Cron
+  |"daemon"->Daemon
+  |"ftp"->Ftp
+  |"kern"->Kern
+  |"local0"->Local0
+  |"local1"->Local1
+  |"local2"->Local2
+  |"local3"->Local3
+  |"local4"->Local4
+  |"local5"->Local5
+  |"local6"->Local6
+  |"local7"->Local7
+  |"lpr"->Lpr
+  |"mail"->Mail
+  |"news"->News
+  |"syslog"->Syslog
+  |"user"->User
+  |"uucp"->Uucp
+  |_-> raise (Unknown_facility s)
diff --git a/tools/ocaml/xenstored/syslog_stubs.c b/tools/ocaml/xenstored/syslog_stubs.c
index 760e78ff73..7fac237c2b 100644
--- a/tools/ocaml/xenstored/syslog_stubs.c
+++ b/tools/ocaml/xenstored/syslog_stubs.c
@@ -22,50 +22,50 @@
 #include <caml/signals.h>
 
 static int __syslog_level_table[] = {
-	LOG_EMERG, LOG_ALERT, LOG_CRIT, LOG_ERR, LOG_WARNING,
-	LOG_NOTICE, LOG_INFO, LOG_DEBUG
+    LOG_EMERG, LOG_ALERT, LOG_CRIT, LOG_ERR, LOG_WARNING,
+    LOG_NOTICE, LOG_INFO, LOG_DEBUG
 };
 
 static int __syslog_facility_table[] = {
-	LOG_AUTH, LOG_AUTHPRIV, LOG_CRON, LOG_DAEMON, LOG_FTP, LOG_KERN,
-	LOG_LOCAL0, LOG_LOCAL1, LOG_LOCAL2, LOG_LOCAL3,
-	LOG_LOCAL4, LOG_LOCAL5, LOG_LOCAL6, LOG_LOCAL7,
-	LOG_LPR | LOG_MAIL | LOG_NEWS | LOG_SYSLOG | LOG_USER | LOG_UUCP
+    LOG_AUTH, LOG_AUTHPRIV, LOG_CRON, LOG_DAEMON, LOG_FTP, LOG_KERN,
+    LOG_LOCAL0, LOG_LOCAL1, LOG_LOCAL2, LOG_LOCAL3,
+    LOG_LOCAL4, LOG_LOCAL5, LOG_LOCAL6, LOG_LOCAL7,
+    LOG_LPR | LOG_MAIL | LOG_NEWS | LOG_SYSLOG | LOG_USER | LOG_UUCP
 };
 
 value stub_syslog(value facility, value level, value msg)
 {
-	CAMLparam3(facility, level, msg);
-	char *c_msg = strdup(String_val(msg));
-	char *s = c_msg, *ss;
-	int c_facility = __syslog_facility_table[Int_val(facility)]
-	               | __syslog_level_table[Int_val(level)];
+    CAMLparam3(facility, level, msg);
+    char *c_msg = strdup(String_val(msg));
+    char *s = c_msg, *ss;
+    int c_facility = __syslog_facility_table[Int_val(facility)]
+                   | __syslog_level_table[Int_val(level)];
 
-	if ( !c_msg )
-		caml_raise_out_of_memory();
+    if ( !c_msg )
+        caml_raise_out_of_memory();
 
-	/*
-	 * syslog() doesn't like embedded newlines, and c_msg generally
-	 * contains them.
-	 *
-	 * Split the message in place by converting \n to \0, and issue one
-	 * syslog() call per line, skipping the final iteration if c_msg ends
-	 * with a newline anyway.
-	 */
-	do {
-		ss = strchr(s, '\n');
-		if ( ss )
-			*ss = '\0';
-		else if ( *s == '\0' )
-			break;
+    /*
+     * syslog() doesn't like embedded newlines, and c_msg generally
+     * contains them.
+     *
+     * Split the message in place by converting \n to \0, and issue one
+     * syslog() call per line, skipping the final iteration if c_msg ends
+     * with a newline anyway.
+     */
+    do {
+        ss = strchr(s, '\n');
+        if ( ss )
+            *ss = '\0';
+        else if ( *s == '\0' )
+            break;
 
-		caml_enter_blocking_section();
-		syslog(c_facility, "%s", s);
-		caml_leave_blocking_section();
+        caml_enter_blocking_section();
+        syslog(c_facility, "%s", s);
+        caml_leave_blocking_section();
 
-		s = ss + 1;
-	} while ( ss );
+        s = ss + 1;
+    } while ( ss );
 
-	free(c_msg);
-	CAMLreturn(Val_unit);
+    free(c_msg);
+    CAMLreturn(Val_unit);
 }
diff --git a/tools/ocaml/xenstored/systemd_stubs.c b/tools/ocaml/xenstored/systemd_stubs.c
index f4c875075a..f36f7300cf 100644
--- a/tools/ocaml/xenstored/systemd_stubs.c
+++ b/tools/ocaml/xenstored/systemd_stubs.c
@@ -29,19 +29,19 @@
 
 CAMLprim value ocaml_sd_notify_ready(value ignore)
 {
-	CAMLparam1(ignore);
+    CAMLparam1(ignore);
 
-	sd_notify(1, "READY=1");
+    sd_notify(1, "READY=1");
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 
 #else
 
 CAMLprim value ocaml_sd_notify_ready(value ignore)
 {
-	CAMLparam1(ignore);
+    CAMLparam1(ignore);
 
-	CAMLreturn(Val_unit);
+    CAMLreturn(Val_unit);
 }
 #endif
diff --git a/tools/ocaml/xenstored/transaction.ml b/tools/ocaml/xenstored/transaction.ml
index 294143e233..d33054a623 100644
--- a/tools/ocaml/xenstored/transaction.ml
+++ b/tools/ocaml/xenstored/transaction.ml
@@ -23,71 +23,71 @@ let test_eagain = ref false
 let do_coalesce = ref true
 
 let check_parents_perms_identical root1 root2 path =
-	let hierarch = Store.Path.get_hierarchy path in
-	let permdiff = List.fold_left (fun acc path ->
-		let n1 = Store.Path.get_node root1 path
-		and n2 = Store.Path.get_node root2 path in
-		match n1, n2 with
-		| Some n1, Some n2 ->
-			not (Perms.equiv (Store.Node.get_perms n1) (Store.Node.get_perms n2)) || acc
-		| _ ->
-			true || acc
-	) false hierarch in
-	(not permdiff)
+  let hierarch = Store.Path.get_hierarchy path in
+  let permdiff = List.fold_left (fun acc path ->
+      let n1 = Store.Path.get_node root1 path
+      and n2 = Store.Path.get_node root2 path in
+      match n1, n2 with
+      | Some n1, Some n2 ->
+        not (Perms.equiv (Store.Node.get_perms n1) (Store.Node.get_perms n2)) || acc
+      | _ ->
+        true || acc
+    ) false hierarch in
+  (not permdiff)
 
 let get_lowest path1 path2 =
-	match path2 with
-	| None       -> Some path1
-	| Some path2 -> Some (Store.Path.get_common_prefix path1 path2)
+  match path2 with
+  | None       -> Some path1
+  | Some path2 -> Some (Store.Path.get_common_prefix path1 path2)
 
 let test_coalesce oldroot currentroot optpath =
-	match optpath with
-	| None      -> true
-	| Some path ->
-		let oldnode = Store.Path.get_node oldroot path
-		and currentnode = Store.Path.get_node currentroot path in
+  match optpath with
+  | None      -> true
+  | Some path ->
+    let oldnode = Store.Path.get_node oldroot path
+    and currentnode = Store.Path.get_node currentroot path in
 
-		match oldnode, currentnode with
-		| (Some oldnode), (Some currentnode) ->
-			if oldnode == currentnode then (
-				check_parents_perms_identical oldroot currentroot path
-			) else (
-				false
-			)
-		| None, None -> (
-			(* ok then it doesn't exists in the old version and the current version,
-			   just sneak it in as a child of the parent node if it exists, or else fail *)
-			let pnode = Store.Path.get_node currentroot (Store.Path.get_parent path) in
-			match pnode with
-			| None       -> false (* ok it doesn't exists, just bail out. *)
-			| Some _     -> true
-			)
-		| _ ->
-			false
+    match oldnode, currentnode with
+    | (Some oldnode), (Some currentnode) ->
+      if oldnode == currentnode then (
+        check_parents_perms_identical oldroot currentroot path
+      ) else (
+        false
+      )
+    | None, None -> (
+        (* ok then it doesn't exists in the old version and the current version,
+           			   just sneak it in as a child of the parent node if it exists, or else fail *)
+        let pnode = Store.Path.get_node currentroot (Store.Path.get_parent path) in
+        match pnode with
+        | None       -> false (* ok it doesn't exists, just bail out. *)
+        | Some _     -> true
+      )
+    | _ ->
+      false
 
 let can_coalesce oldroot currentroot path =
-	if !do_coalesce then
-		try test_coalesce oldroot currentroot path with _ -> false
-	else
-		false
+  if !do_coalesce then
+    try test_coalesce oldroot currentroot path with _ -> false
+  else
+    false
 
 type ty = No | Full of (
-	int *          (* Transaction id *)
-	Store.t *      (* Original store *)
-	Store.t        (* A pointer to the canonical store: its root changes on each transaction-commit *)
-)
+    int *          (* Transaction id *)
+    Store.t *      (* Original store *)
+    Store.t        (* A pointer to the canonical store: its root changes on each transaction-commit *)
+  )
 
 type t = {
-	ty: ty;
-	start_count: int64;
-	store: Store.t; (* This is the store that we change in write operations. *)
-	quota: Quota.t;
-	oldroot: Store.Node.t;
-	mutable paths: (Xenbus.Xb.Op.operation * Store.Path.t) list;
-	mutable operations: (Packet.request * Packet.response) list;
-	mutable quota_reached: bool;
-	mutable read_lowpath: Store.Path.t option;
-	mutable write_lowpath: Store.Path.t option;
+  ty: ty;
+  start_count: int64;
+  store: Store.t; (* This is the store that we change in write operations. *)
+  quota: Quota.t;
+  oldroot: Store.Node.t;
+  mutable paths: (Xenbus.Xb.Op.operation * Store.Path.t) list;
+  mutable operations: (Packet.request * Packet.response) list;
+  mutable quota_reached: bool;
+  mutable read_lowpath: Store.Path.t option;
+  mutable write_lowpath: Store.Path.t option;
 }
 let get_id t = match t.ty with No -> none | Full (id, _, _) -> id
 
@@ -95,48 +95,48 @@ let counter = ref 0L
 let failed_commits = ref 0L
 let failed_commits_no_culprit = ref 0L
 let reset_conflict_stats () =
-	failed_commits := 0L;
-	failed_commits_no_culprit := 0L
+  failed_commits := 0L;
+  failed_commits_no_culprit := 0L
 
 (* Scope for optimisation: different data-structure and functions to search/filter it *)
 let short_running_txns = ref []
 
 let oldest_short_running_transaction () =
-	let rec last = function
-		| [] -> None
-		| [x] -> Some x
-		| _ :: xs -> last xs
-	in last !short_running_txns
+  let rec last = function
+    | [] -> None
+    | [x] -> Some x
+    | _ :: xs -> last xs
+  in last !short_running_txns
 
 let trim_short_running_transactions txn =
-	let cutoff = Unix.gettimeofday () -. !Define.conflict_max_history_seconds in
-	let keep = match txn with
-		| None -> (function (start_time, _) -> start_time >= cutoff)
-		| Some t -> (function (start_time, tx) -> start_time >= cutoff && tx != t)
-	in
-	short_running_txns := List.filter
-		keep
-		!short_running_txns
+  let cutoff = Unix.gettimeofday () -. !Define.conflict_max_history_seconds in
+  let keep = match txn with
+    | None -> (function (start_time, _) -> start_time >= cutoff)
+    | Some t -> (function (start_time, tx) -> start_time >= cutoff && tx != t)
+  in
+  short_running_txns := List.filter
+      keep
+      !short_running_txns
 
 let make ?(internal=false) id store =
-	let ty = if id = none then No else Full(id, Store.copy store, store) in
-	let txn = {
-		ty = ty;
-		start_count = !counter;
-		store = if id = none then store else Store.copy store;
-		quota = Quota.copy store.Store.quota;
-		oldroot = Store.get_root store;
-		paths = [];
-		operations = [];
-		quota_reached = false;
-		read_lowpath = None;
-		write_lowpath = None;
-	} in
-	if id <> none && not internal then (
-		let now = Unix.gettimeofday () in
-		short_running_txns := (now, txn) :: !short_running_txns
-	);
-	txn
+  let ty = if id = none then No else Full(id, Store.copy store, store) in
+  let txn = {
+    ty = ty;
+    start_count = !counter;
+    store = if id = none then store else Store.copy store;
+    quota = Quota.copy store.Store.quota;
+    oldroot = Store.get_root store;
+    paths = [];
+    operations = [];
+    quota_reached = false;
+    read_lowpath = None;
+    write_lowpath = None;
+  } in
+  if id <> none && not internal then (
+    let now = Unix.gettimeofday () in
+    short_running_txns := (now, txn) :: !short_running_txns
+  );
+  txn
 
 let get_store t = t.store
 let get_paths t = t.paths
@@ -148,115 +148,115 @@ let add_wop t ty path = t.paths <- (ty, path) :: t.paths
 let get_operations t = List.rev t.operations
 
 let check_quota_exn ~perm t =
-	if !Define.maxrequests >= 0
-		&& not (Perms.Connection.is_dom0 perm)
-		&& (t.quota_reached || List.length t.operations >= !Define.maxrequests)
-		then begin
-			t.quota_reached <- true;
-			raise Quota.Limit_reached;
-		end
+  if !Define.maxrequests >= 0
+  && not (Perms.Connection.is_dom0 perm)
+  && (t.quota_reached || List.length t.operations >= !Define.maxrequests)
+  then begin
+    t.quota_reached <- true;
+    raise Quota.Limit_reached;
+  end
 
 let add_operation t request response =
-	t.operations <- (request, response) :: t.operations
+  t.operations <- (request, response) :: t.operations
 let set_read_lowpath t path = t.read_lowpath <- get_lowest path t.read_lowpath
 let set_write_lowpath t path = t.write_lowpath <- get_lowest path t.write_lowpath
 
 let path_exists t path = Store.path_exists t.store path
 
 let write t perm path value =
-	let path_exists = path_exists t path in
-	Store.write t.store perm path value;
-	if path_exists
-	then set_write_lowpath t path
-	else set_write_lowpath t (Store.Path.get_parent path);
-	add_wop t Xenbus.Xb.Op.Write path
+  let path_exists = path_exists t path in
+  Store.write t.store perm path value;
+  if path_exists
+  then set_write_lowpath t path
+  else set_write_lowpath t (Store.Path.get_parent path);
+  add_wop t Xenbus.Xb.Op.Write path
 
 let mkdir ?(with_watch=true) t perm path =
-	Store.mkdir t.store perm path;
-	set_write_lowpath t (Store.Path.get_parent path);
-	if with_watch then
-		add_wop t Xenbus.Xb.Op.Mkdir path
+  Store.mkdir t.store perm path;
+  set_write_lowpath t (Store.Path.get_parent path);
+  if with_watch then
+    add_wop t Xenbus.Xb.Op.Mkdir path
 
 let setperms t perm path perms =
-	Store.setperms t.store perm path perms;
-	set_write_lowpath t path;
-	add_wop t Xenbus.Xb.Op.Setperms path
+  Store.setperms t.store perm path perms;
+  set_write_lowpath t path;
+  add_wop t Xenbus.Xb.Op.Setperms path
 
 let rm t perm path =
-	Store.rm t.store perm path;
-	set_write_lowpath t (Store.Path.get_parent path);
-	add_wop t Xenbus.Xb.Op.Rm path
+  Store.rm t.store perm path;
+  set_write_lowpath t (Store.Path.get_parent path);
+  add_wop t Xenbus.Xb.Op.Rm path
 
 let ls t perm path =
-	let r = Store.ls t.store perm path in
-	set_read_lowpath t path;
-	r
+  let r = Store.ls t.store perm path in
+  set_read_lowpath t path;
+  r
 
 let read t perm path =
-	let r = Store.read t.store perm path in
-	set_read_lowpath t path;
-	r
+  let r = Store.read t.store perm path in
+  set_read_lowpath t path;
+  r
 
 let getperms t perm path =
-	let r = Store.getperms t.store perm path in
-	set_read_lowpath t path;
-	r
+  let r = Store.getperms t.store perm path in
+  set_read_lowpath t path;
+  r
 
 let commit ~con t =
-	let has_write_ops = List.length t.paths > 0 in
-	let has_coalesced = ref false in
-	let has_commited =
-	match t.ty with
-	| No                         -> true
-	| Full (_id, oldstore, cstore) ->       (* "cstore" meaning current canonical store *)
-		let commit_partial oldroot cstore store =
-			(* get the lowest path of the query and verify that it hasn't
-			   been modified by others transactions. *)
-			if can_coalesce oldroot (Store.get_root cstore) t.read_lowpath
-			&& can_coalesce oldroot (Store.get_root cstore) t.write_lowpath then (
-				maybe (fun p ->
-					let n = Store.get_node store p in
+  let has_write_ops = List.length t.paths > 0 in
+  let has_coalesced = ref false in
+  let has_commited =
+    match t.ty with
+    | No                         -> true
+    | Full (_id, oldstore, cstore) ->       (* "cstore" meaning current canonical store *)
+      let commit_partial oldroot cstore store =
+        (* get the lowest path of the query and verify that it hasn't
+           			   been modified by others transactions. *)
+        if can_coalesce oldroot (Store.get_root cstore) t.read_lowpath
+        && can_coalesce oldroot (Store.get_root cstore) t.write_lowpath then (
+          maybe (fun p ->
+              let n = Store.get_node store p in
 
-					(* it has to be in the store, otherwise it means bugs
-					   in the lowpath registration. we don't need to handle none. *)
-					maybe (fun n -> Store.set_node cstore p n t.quota store.Store.quota) n;
-					Logging.write_coalesce ~tid:(get_id t) ~con (Store.Path.to_string p);
-				) t.write_lowpath;
-				maybe (fun p ->
-					Logging.read_coalesce ~tid:(get_id t) ~con (Store.Path.to_string p)
-					) t.read_lowpath;
-				has_coalesced := true;
-				Store.incr_transaction_coalesce cstore;
-				true
-			) else (
-				(* cannot do anything simple, just discard the queries,
-				   and the client need to redo it later *)
-				Store.incr_transaction_abort cstore;
-				false
-			)
-			in
-		let try_commit oldroot cstore store =
-			if oldroot == Store.get_root cstore then (
-				(* move the new root to the current store, if the oldroot
-				   has not been modified *)
-				if has_write_ops then (
-					Store.set_root cstore (Store.get_root store);
-					Store.set_quota cstore (Store.get_quota store)
-				);
-				true
-			) else
-				(* we try a partial commit if possible *)
-				commit_partial oldroot cstore store
-			in
-		if !test_eagain && Random.int 3 = 0 then
-			false
-		else
-			try_commit (Store.get_root oldstore) cstore t.store
-		in
-	if has_commited && has_write_ops then
-		Disk.write t.store;
-	if not has_commited
-	then Logging.conflict ~tid:(get_id t) ~con
-	else if not !has_coalesced
-	then Logging.commit ~tid:(get_id t) ~con;
-	has_commited
+              (* it has to be in the store, otherwise it means bugs
+                 					   in the lowpath registration. we don't need to handle none. *)
+              maybe (fun n -> Store.set_node cstore p n t.quota store.Store.quota) n;
+              Logging.write_coalesce ~tid:(get_id t) ~con (Store.Path.to_string p);
+            ) t.write_lowpath;
+          maybe (fun p ->
+              Logging.read_coalesce ~tid:(get_id t) ~con (Store.Path.to_string p)
+            ) t.read_lowpath;
+          has_coalesced := true;
+          Store.incr_transaction_coalesce cstore;
+          true
+        ) else (
+          (* cannot do anything simple, just discard the queries,
+             				   and the client need to redo it later *)
+          Store.incr_transaction_abort cstore;
+          false
+        )
+      in
+      let try_commit oldroot cstore store =
+        if oldroot == Store.get_root cstore then (
+          (* move the new root to the current store, if the oldroot
+             				   has not been modified *)
+          if has_write_ops then (
+            Store.set_root cstore (Store.get_root store);
+            Store.set_quota cstore (Store.get_quota store)
+          );
+          true
+        ) else
+          (* we try a partial commit if possible *)
+          commit_partial oldroot cstore store
+      in
+      if !test_eagain && Random.int 3 = 0 then
+        false
+      else
+        try_commit (Store.get_root oldstore) cstore t.store
+  in
+  if has_commited && has_write_ops then
+    Disk.write t.store;
+  if not has_commited
+  then Logging.conflict ~tid:(get_id t) ~con
+  else if not !has_coalesced
+  then Logging.commit ~tid:(get_id t) ~con;
+  has_commited
diff --git a/tools/ocaml/xenstored/trie.ml b/tools/ocaml/xenstored/trie.ml
index ca38b26632..bef97cdbdb 100644
--- a/tools/ocaml/xenstored/trie.ml
+++ b/tools/ocaml/xenstored/trie.ml
@@ -19,159 +19,159 @@ module StringMap = Map.Make(String)
 
 module Node =
 struct
-	type 'a t =  {
-		key: string;
-		value: 'a option;
-		children: 'a t StringMap.t;
-	}
+  type 'a t =  {
+    key: string;
+    value: 'a option;
+    children: 'a t StringMap.t;
+  }
 
-	let _create key value = {
-		key = key;
-		value = Some value;
-		children = StringMap.empty;
-	}
+  let _create key value = {
+    key = key;
+    value = Some value;
+    children = StringMap.empty;
+  }
 
-	let empty key = {
-		key = key;
-		value = None;
-		children = StringMap.empty;
-	}
+  let empty key = {
+    key = key;
+    value = None;
+    children = StringMap.empty;
+  }
 
-	let _get_key node = node.key
-	let get_value node =
-		match node.value with
-		| None       -> raise Not_found
-		| Some value -> value
+  let _get_key node = node.key
+  let get_value node =
+    match node.value with
+    | None       -> raise Not_found
+    | Some value -> value
 
-	let _get_children node = node.children
+  let _get_children node = node.children
 
-	let set_value node value =
-		{ node with value = Some value }
-	let set_children node children =
-		{ node with children = children }
+  let set_value node value =
+    { node with value = Some value }
+  let set_children node children =
+    { node with children = children }
 
-	let _add_child node child =
-		{ node with children = StringMap.add child.key child node.children }
+  let _add_child node child =
+    { node with children = StringMap.add child.key child node.children }
 end
 
 type 'a t = 'a Node.t StringMap.t
 
 let mem_node nodes key =
-	StringMap.mem key nodes
+  StringMap.mem key nodes
 
 let find_node nodes key =
-	StringMap.find key nodes
+  StringMap.find key nodes
 
 let replace_node nodes key node =
-	StringMap.update key (function None -> None | Some _ -> Some node) nodes
+  StringMap.update key (function None -> None | Some _ -> Some node) nodes
 
 let remove_node nodes key =
-	StringMap.update key (function None -> raise Not_found | Some _ -> None) nodes
+  StringMap.update key (function None -> raise Not_found | Some _ -> None) nodes
 
 let create () = StringMap.empty
 
 let rec iter f tree =
-	let aux key node =
-		f key node.Node.value;
-		iter f node.Node.children
-	in
-	StringMap.iter aux tree
+  let aux key node =
+    f key node.Node.value;
+    iter f node.Node.children
+  in
+  StringMap.iter aux tree
 
 let rec map f tree =
-	let aux node =
-		let value =
-			match node.Node.value with
-			| None       -> None
-			| Some value -> f value
-		in
-		{ node with Node.value = value; Node.children = map f node.Node.children }
-	in
-	tree |> StringMap.map aux
-	|> StringMap.filter (fun _ n -> n.Node.value <> None || not (StringMap.is_empty n.Node.children))
+  let aux node =
+    let value =
+      match node.Node.value with
+      | None       -> None
+      | Some value -> f value
+    in
+    { node with Node.value = value; Node.children = map f node.Node.children }
+  in
+  tree |> StringMap.map aux
+  |> StringMap.filter (fun _ n -> n.Node.value <> None || not (StringMap.is_empty n.Node.children))
 
 let rec fold f tree acc =
-	let aux key node accu =
-		fold f node.Node.children (f key node.Node.value accu)
-	in
-	StringMap.fold aux tree acc
+  let aux key node accu =
+    fold f node.Node.children (f key node.Node.value accu)
+  in
+  StringMap.fold aux tree acc
 
 (* return a sub-trie *)
 let rec sub_node tree = function
-	| []   -> raise Not_found
-	| h::t ->
-		  if mem_node tree h
-		  then begin
-			  let node = find_node tree h in
-			  if t = []
-			  then node
-			  else sub_node node.Node.children t
-		  end else
-			  raise Not_found
+  | []   -> raise Not_found
+  | h::t ->
+    if mem_node tree h
+    then begin
+      let node = find_node tree h in
+      if t = []
+      then node
+      else sub_node node.Node.children t
+    end else
+      raise Not_found
 
 let sub tree path =
-	try (sub_node tree path).Node.children
-	with Not_found -> StringMap.empty
+  try (sub_node tree path).Node.children
+  with Not_found -> StringMap.empty
 
 let find tree path =
-	Node.get_value (sub_node tree path)
+  Node.get_value (sub_node tree path)
 
 (* return false if the node doesn't exists or if it is not associated to any value *)
 let rec mem tree = function
-	| []   -> false
-	| h::t ->
-		  mem_node tree h
-		  && (let node = find_node tree h in
-			  if t = []
-			  then node.Node.value <> None
-			  else mem node.Node.children t)
+  | []   -> false
+  | h::t ->
+    mem_node tree h
+    && (let node = find_node tree h in
+        if t = []
+        then node.Node.value <> None
+        else mem node.Node.children t)
 
 (* Iterate over the longest valid prefix *)
 let rec iter_path f tree = function
-	| []   -> ()
-	| h::l ->
-		  if mem_node tree h
-		  then begin
-			  let node = find_node tree h in
-			  f node.Node.key node.Node.value;
-			  iter_path f node.Node.children l
-		  end
+  | []   -> ()
+  | h::l ->
+    if mem_node tree h
+    then begin
+      let node = find_node tree h in
+      f node.Node.key node.Node.value;
+      iter_path f node.Node.children l
+    end
 
 let rec set_node node path value =
-	if path = []
-	then Node.set_value node value
-	else begin
-		let children = set node.Node.children path value in
-		Node.set_children node children
-	end
+  if path = []
+  then Node.set_value node value
+  else begin
+    let children = set node.Node.children path value in
+    Node.set_children node children
+  end
 
 and set tree path value =
-	match path with
-		| []   -> raise Not_found
-		| h::t ->
-			  if mem_node tree h
-			  then begin
-				  let node = find_node tree h in
-				  replace_node tree h (set_node node t value)
-			  end else begin
-				  let node = Node.empty h in
-				  StringMap.add node.Node.key (set_node node t value) tree
-			  end
+  match path with
+  | []   -> raise Not_found
+  | h::t ->
+    if mem_node tree h
+    then begin
+      let node = find_node tree h in
+      replace_node tree h (set_node node t value)
+    end else begin
+      let node = Node.empty h in
+      StringMap.add node.Node.key (set_node node t value) tree
+    end
 
 let rec unset tree = function
-	| []   -> tree
-	| h::t ->
-		  if mem_node tree h
-		  then begin
-			  let node = find_node tree h in
-			  let children = unset node.Node.children t in
-			  let new_node =
-				  if t = []
-				  then Node.set_children (Node.empty h) children
-				  else Node.set_children node children
-			  in
-			  if StringMap.is_empty children && new_node.Node.value = None
-			  then remove_node tree h
-			  else replace_node tree h new_node
-		  end else
-			  raise Not_found
+  | []   -> tree
+  | h::t ->
+    if mem_node tree h
+    then begin
+      let node = find_node tree h in
+      let children = unset node.Node.children t in
+      let new_node =
+        if t = []
+        then Node.set_children (Node.empty h) children
+        else Node.set_children node children
+      in
+      if StringMap.is_empty children && new_node.Node.value = None
+      then remove_node tree h
+      else replace_node tree h new_node
+    end else
+      raise Not_found
 
diff --git a/tools/ocaml/xenstored/trie.mli b/tools/ocaml/xenstored/trie.mli
index 27785154f5..2f1b364b6a 100644
--- a/tools/ocaml/xenstored/trie.mli
+++ b/tools/ocaml/xenstored/trie.mli
@@ -17,44 +17,44 @@
 
 type 'a t
 (** The type of tries. ['a] the type of values.
-	Internally, a trie is represented as a labeled tree, where node contains values
-	of type [string * 'a option]. *)
+    	Internally, a trie is represented as a labeled tree, where node contains values
+    	of type [string * 'a option]. *)
 
 val create : unit -> 'a t
 (** Creates an empty trie. *)
 
 val mem : 'a t -> string list -> bool
 (** [mem t k] returns true if a value is associated with the key [k] in the trie [t].
-	Otherwise, it returns false. *)
+    	Otherwise, it returns false. *)
 
 val find : 'a t -> string list -> 'a
 (** [find t k] returns the value associated with the key [k] in the trie [t].
-	Returns [Not_found] if no values are associated with [k] in [t]. *)
+    	Returns [Not_found] if no values are associated with [k] in [t]. *)
 
 val set : 'a t -> string list -> 'a -> 'a t
 (** [set t k v] associates the value [v] with the key [k] in the trie [t]. *)
 
 val unset : 'a t -> string list -> 'a t
 (** [unset k v] removes the association of value [v] with the key [k] in the trie [t].
-	Moreover, it automatically clean the trie, ie. it removes recursively
-	every nodes of [t] containing no values and having no chil. *)
+    	Moreover, it automatically clean the trie, ie. it removes recursively
+    	every nodes of [t] containing no values and having no chil. *)
 
 val iter : (string -> 'a option -> unit) -> 'a t -> unit
 (** [iter f t] applies the function [f] to every node of the trie [t].
-	As nodes of the trie [t] do not necessary contains a value, the second argument of
-	[f] is an option type. *)
+    	As nodes of the trie [t] do not necessary contains a value, the second argument of
+    	[f] is an option type. *)
 
 val iter_path : (string -> 'a option -> unit) -> 'a t -> string list -> unit
 (** [iter_path f t p] iterates [f] over nodes associated with the path [p] in the trie [t].
-	If [p] is not a valid path of [t], it iterates on the longest valid prefix of [p]. *)
+    	If [p] is not a valid path of [t], it iterates on the longest valid prefix of [p]. *)
 
 val fold : (string -> 'a option -> 'c -> 'c) -> 'a t -> 'c -> 'c
 (** [fold f t x] fold [f] over every nodes of [t], with [x] as initial value. *)
 
 val map : ('a -> 'b option) -> 'a t -> 'b t
 (** [map f t] maps [f] over every values stored in [t]. The return value of [f] is of type 'c option
-	as one may wants to remove value associated to a key. This function is not tail-recursive. *)
+    	as one may wants to remove value associated to a key. This function is not tail-recursive. *)
 
 val sub : 'a t -> string list -> 'a t
 (** [sub t p] returns the sub-trie associated with the path [p] in the trie [t].
-	If [p] is not a valid path of [t], it returns an empty trie. *)
+    	If [p] is not a valid path of [t], it returns an empty trie. *)
diff --git a/tools/ocaml/xenstored/utils.ml b/tools/ocaml/xenstored/utils.ml
index dd03b2b5bc..48d84ef7d3 100644
--- a/tools/ocaml/xenstored/utils.ml
+++ b/tools/ocaml/xenstored/utils.ml
@@ -19,111 +19,111 @@ open Stdext
 
 (* lists utils *)
 let filter_out filter l =
-	List.filter (fun x -> not (List.mem x filter)) l
+  List.filter (fun x -> not (List.mem x filter)) l
 
 let filter_in filter l =
-	List.filter (fun x -> List.mem x filter) l
+  List.filter (fun x -> List.mem x filter) l
 
 let list_remove element l =
-	List.filter (fun e -> e != element) l
+  List.filter (fun e -> e != element) l
 
 let list_tl_multi n l =
-	let rec do_tl i x =
-		if i = 0 then x else do_tl (i - 1) (List.tl x)
-		in
-	do_tl n l
+  let rec do_tl i x =
+    if i = 0 then x else do_tl (i - 1) (List.tl x)
+  in
+  do_tl n l
 
 (* string utils *)
 let get_hierarchy path =
-	let l = List.length path in
-	let revpath = List.rev path in
-	let rec sub i =
-		let x = List.rev (list_tl_multi (l - i) revpath) in
-		if i = l then [ x ] else x :: sub (i + 1)
-		in
-	sub 0
+  let l = List.length path in
+  let revpath = List.rev path in
+  let rec sub i =
+    let x = List.rev (list_tl_multi (l - i) revpath) in
+    if i = l then [ x ] else x :: sub (i + 1)
+  in
+  sub 0
 
 let hexify s =
-	let hexseq_of_char c = sprintf "%02x" (Char.code c) in
-	let hs = Bytes.create (String.length s * 2) in
-	String.iteri (fun i c ->
-		let seq = hexseq_of_char c in
-		Bytes.set hs (i * 2) seq.[0];
-		Bytes.set hs (i * 2 + 1) seq.[1];
-	) s;
-	Bytes.unsafe_to_string hs
+  let hexseq_of_char c = sprintf "%02x" (Char.code c) in
+  let hs = Bytes.create (String.length s * 2) in
+  String.iteri (fun i c ->
+      let seq = hexseq_of_char c in
+      Bytes.set hs (i * 2) seq.[0];
+      Bytes.set hs (i * 2 + 1) seq.[1];
+    ) s;
+  Bytes.unsafe_to_string hs
 
 let unhexify hs =
-	let char_of_hexseq seq0 seq1 = Char.chr (int_of_string (sprintf "0x%c%c" seq0 seq1)) in
-	let b = Bytes.create (String.length hs / 2) in
-	for i = 0 to Bytes.length b - 1
-	do
-		Bytes.set b i (char_of_hexseq hs.[i * 2] hs.[i * 2 + 1])
-	done;
-	Bytes.unsafe_to_string b
+  let char_of_hexseq seq0 seq1 = Char.chr (int_of_string (sprintf "0x%c%c" seq0 seq1)) in
+  let b = Bytes.create (String.length hs / 2) in
+  for i = 0 to Bytes.length b - 1
+  do
+    Bytes.set b i (char_of_hexseq hs.[i * 2] hs.[i * 2 + 1])
+  done;
+  Bytes.unsafe_to_string b
 
 let trim_path path =
-	try
-		let rindex = String.rindex path '/' in
-		String.sub path 0 rindex
-	with
-		Not_found -> ""
+  try
+    let rindex = String.rindex path '/' in
+    String.sub path 0 rindex
+  with
+    Not_found -> ""
 
 let join_by_null ls = String.concat "\000" ls
 
 (* unix utils *)
 let create_unix_socket name =
-        Unixext.unlink_safe name;
-        Unixext.mkdir_rec (Filename.dirname name) 0o700;
-        let sockaddr = Unix.ADDR_UNIX(name) in
-        let sock = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in
-        Unix.bind sock sockaddr;
-        Unix.listen sock 1;
-        sock
+  Unixext.unlink_safe name;
+  Unixext.mkdir_rec (Filename.dirname name) 0o700;
+  let sockaddr = Unix.ADDR_UNIX(name) in
+  let sock = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in
+  Unix.bind sock sockaddr;
+  Unix.listen sock 1;
+  sock
 
 let read_file_single_integer filename =
-	let fd = Unix.openfile filename [ Unix.O_RDONLY ] 0o640 in
-	let buf = Bytes.make 20 '\000' in
-	let sz = Unix.read fd buf 0 20 in
-	Unix.close fd;
-	int_of_string (Bytes.sub_string buf 0 sz)
+  let fd = Unix.openfile filename [ Unix.O_RDONLY ] 0o640 in
+  let buf = Bytes.make 20 '\000' in
+  let sz = Unix.read fd buf 0 20 in
+  Unix.close fd;
+  int_of_string (Bytes.sub_string buf 0 sz)
 
 (* @path may be guest data and needs its length validating.  @connection_path
  * is generated locally in xenstored and always of the form "/local/domain/$N/" *)
 let path_validate path connection_path =
-	let len = String.length path in
+  let len = String.length path in
 
-	if len = 0 then raise Define.Invalid_path;
+  if len = 0 then raise Define.Invalid_path;
 
-	let abs_path =
-		match String.get path 0 with
-		| '/' | '@' -> path
-		| _   -> connection_path ^ path
-	in
+  let abs_path =
+    match String.get path 0 with
+    | '/' | '@' -> path
+    | _   -> connection_path ^ path
+  in
 
-	(* Regardless whether client specified absolute or relative path,
-	   canonicalize it (above) and, for domain-relative paths, check the
-	   length of the relative part.
+  (* Regardless whether client specified absolute or relative path,
+     	   canonicalize it (above) and, for domain-relative paths, check the
+     	   length of the relative part.
 
-	   This prevents paths becoming invalid across migrate when the length
-	   of the domid changes in @param connection_path.
-	 *)
-	let len = String.length abs_path in
-	let on_absolute _ _ = len in
-	let on_relative _ offset = len - offset in
-	let len = Scanf.ksscanf abs_path on_absolute "/local/domain/%d/%n" on_relative in
-	if len > !Define.path_max then raise Define.Invalid_path;
+     	   This prevents paths becoming invalid across migrate when the length
+     	   of the domid changes in @param connection_path.
+     	 *)
+  let len = String.length abs_path in
+  let on_absolute _ _ = len in
+  let on_relative _ offset = len - offset in
+  let len = Scanf.ksscanf abs_path on_absolute "/local/domain/%d/%n" on_relative in
+  if len > !Define.path_max then raise Define.Invalid_path;
 
-	abs_path
+  abs_path
 
 module FD : sig
-	type t = Unix.file_descr
-	val of_int: int -> t
-	val to_int : t -> int
+  type t = Unix.file_descr
+  val of_int: int -> t
+  val to_int : t -> int
 end = struct
-	type t = Unix.file_descr
-	(* This is like Obj.magic but just for these types,
-	   and relies on Unix.file_descr = int *)
-	external to_int : t -> int = "%identity"
-	external of_int : int -> t = "%identity"
+  type t = Unix.file_descr
+  (* This is like Obj.magic but just for these types,
+     	   and relies on Unix.file_descr = int *)
+  external to_int : t -> int = "%identity"
+  external of_int : int -> t = "%identity"
 end
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 4d5851c5cb..366437b396 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -26,272 +26,272 @@ let info fmt = Logging.info "xenstored" fmt
 
 (*------------ event klass processors --------------*)
 let process_connection_fds store cons domains rset wset =
-	let try_fct fct c =
-		try
-			fct store cons domains c
-		with
-		| Unix.Unix_error(err, "write", _) ->
-			Connections.del_anonymous cons c;
-			error "closing socket connection: write error: %s"
-			      (Unix.error_message err)
-		| Unix.Unix_error(err, "read", _) ->
-			Connections.del_anonymous cons c;
-			if err <> Unix.ECONNRESET then
-			error "closing socket connection: read error: %s"
-			      (Unix.error_message err)
-		| Xenbus.Xb.End_of_file ->
-			Connections.del_anonymous cons c;
-			debug "closing socket connection"
-		in
-	let process_fdset_with fds fct =
-		List.iter
-			(fun fd ->
-			 try try_fct fct (Connections.find cons fd)
-			 with Not_found -> ()
-			) fds in
-	process_fdset_with rset Process.do_input;
-	process_fdset_with wset Process.do_output
+  let try_fct fct c =
+    try
+      fct store cons domains c
+    with
+    | Unix.Unix_error(err, "write", _) ->
+      Connections.del_anonymous cons c;
+      error "closing socket connection: write error: %s"
+        (Unix.error_message err)
+    | Unix.Unix_error(err, "read", _) ->
+      Connections.del_anonymous cons c;
+      if err <> Unix.ECONNRESET then
+        error "closing socket connection: read error: %s"
+          (Unix.error_message err)
+    | Xenbus.Xb.End_of_file ->
+      Connections.del_anonymous cons c;
+      debug "closing socket connection"
+  in
+  let process_fdset_with fds fct =
+    List.iter
+      (fun fd ->
+         try try_fct fct (Connections.find cons fd)
+         with Not_found -> ()
+      ) fds in
+  process_fdset_with rset Process.do_input;
+  process_fdset_with wset Process.do_output
 
 let process_domains store cons domains =
-	let do_io_domain domain =
-		if Domain.is_bad_domain domain
-		|| Domain.get_io_credit domain <= 0
-		|| Domain.is_paused_for_conflict domain
-		then () (* nothing to do *)
-		else (
-			let con = Connections.find_domain cons (Domain.get_id domain) in
-			Process.do_input store cons domains con;
-			Process.do_output store cons domains con;
-			Domain.decr_io_credit domain
-		) in
-	Domains.iter domains do_io_domain
+  let do_io_domain domain =
+    if Domain.is_bad_domain domain
+    || Domain.get_io_credit domain <= 0
+    || Domain.is_paused_for_conflict domain
+    then () (* nothing to do *)
+    else (
+      let con = Connections.find_domain cons (Domain.get_id domain) in
+      Process.do_input store cons domains con;
+      Process.do_output store cons domains con;
+      Domain.decr_io_credit domain
+    ) in
+  Domains.iter domains do_io_domain
 
 let sigusr1_handler store =
-	try
-		let channel = open_out_gen [ Open_wronly; Open_creat; Open_trunc; ]
-		                           0o600 (Paths.xen_run_stored ^ "/db.debug") in
-		finally (fun () -> Store.dump store channel)
-			(fun () -> close_out channel)
-	with _ ->
-		()
+  try
+    let channel = open_out_gen [ Open_wronly; Open_creat; Open_trunc; ]
+        0o600 (Paths.xen_run_stored ^ "/db.debug") in
+    finally (fun () -> Store.dump store channel)
+      (fun () -> close_out channel)
+  with _ ->
+    ()
 
 let sighup_handler _ =
-	maybe (fun logger -> logger.Logging.restart()) !Logging.xenstored_logger;
-	maybe (fun logger -> logger.Logging.restart()) !Logging.access_logger
+  maybe (fun logger -> logger.Logging.restart()) !Logging.xenstored_logger;
+  maybe (fun logger -> logger.Logging.restart()) !Logging.access_logger
 
 let config_filename cf =
-	match cf.config_file with
-	| Some name -> name
-	| None      -> Define.default_config_dir ^ "/oxenstored.conf"
+  match cf.config_file with
+  | Some name -> name
+  | None      -> Define.default_config_dir ^ "/oxenstored.conf"
 
 let default_pidfile = Paths.xen_run_dir ^ "/xenstored.pid"
 
 let ring_scan_interval = ref 20
 
 let parse_config filename =
-	let pidfile = ref default_pidfile in
-	let options = [
-		("merge-activate", Config.Set_bool Transaction.do_coalesce);
-		("conflict-burst-limit", Config.Set_float Define.conflict_burst_limit);
-		("conflict-max-history-seconds", Config.Set_float Define.conflict_max_history_seconds);
-		("conflict-rate-limit-is-aggregate", Config.Set_bool Define.conflict_rate_limit_is_aggregate);
-		("perms-activate", Config.Set_bool Perms.activate);
-		("perms-watch-activate", Config.Set_bool Perms.watch_activate);
-		("quota-activate", Config.Set_bool Quota.activate);
-		("quota-maxwatch", Config.Set_int Define.maxwatch);
-		("quota-transaction", Config.Set_int Define.maxtransaction);
-		("quota-maxentity", Config.Set_int Quota.maxent);
-		("quota-maxsize", Config.Set_int Quota.maxsize);
-		("quota-maxrequests", Config.Set_int Define.maxrequests);
-		("quota-maxoutstanding", Config.Set_int Define.maxoutstanding);
-		("quota-maxwatchevents", Config.Set_int Define.maxwatchevents);
-		("quota-path-max", Config.Set_int Define.path_max);
-		("gc-max-overhead", Config.Set_int Define.gc_max_overhead);
-		("test-eagain", Config.Set_bool Transaction.test_eagain);
-		("persistent", Config.Set_bool Disk.enable);
-		("xenstored-log-file", Config.String Logging.set_xenstored_log_destination);
-		("xenstored-log-level", Config.String
-			(fun s -> Logging.xenstored_log_level := Logging.level_of_string s));
-		("xenstored-log-nb-files", Config.Set_int Logging.xenstored_log_nb_files);
-		("xenstored-log-nb-lines", Config.Set_int Logging.xenstored_log_nb_lines);
-		("xenstored-log-nb-chars", Config.Set_int Logging.xenstored_log_nb_chars);
-		("access-log-file", Config.String Logging.set_access_log_destination);
-		("access-log-nb-files", Config.Set_int Logging.access_log_nb_files);
-		("access-log-nb-lines", Config.Set_int Logging.access_log_nb_lines);
-		("access-log-nb-chars", Config.Set_int Logging.access_log_nb_chars);
-		("access-log-read-ops", Config.Set_bool Logging.access_log_read_ops);
-		("access-log-transactions-ops", Config.Set_bool Logging.access_log_transaction_ops);
-		("access-log-special-ops", Config.Set_bool Logging.access_log_special_ops);
-		("allow-debug", Config.Set_bool Process.allow_debug);
-		("ring-scan-interval", Config.Set_int ring_scan_interval);
-		("pid-file", Config.Set_string pidfile);
-		("xenstored-kva", Config.Set_string Domains.xenstored_kva);
-		("xenstored-port", Config.Set_string Domains.xenstored_port); ] in
-	begin try Config.read filename options (fun _ _ -> raise Not_found)
-	with
-	| Config.Error err -> List.iter (fun (k, e) ->
-		match e with
-		| "unknown key" -> eprintf "config: unknown key %s\n" k
-		| _             -> eprintf "config: %s: %s\n" k e
-		) err;
-	| Sys_error m -> eprintf "error: config: %s\n" m;
-	end;
-	!pidfile
+  let pidfile = ref default_pidfile in
+  let options = [
+    ("merge-activate", Config.Set_bool Transaction.do_coalesce);
+    ("conflict-burst-limit", Config.Set_float Define.conflict_burst_limit);
+    ("conflict-max-history-seconds", Config.Set_float Define.conflict_max_history_seconds);
+    ("conflict-rate-limit-is-aggregate", Config.Set_bool Define.conflict_rate_limit_is_aggregate);
+    ("perms-activate", Config.Set_bool Perms.activate);
+    ("perms-watch-activate", Config.Set_bool Perms.watch_activate);
+    ("quota-activate", Config.Set_bool Quota.activate);
+    ("quota-maxwatch", Config.Set_int Define.maxwatch);
+    ("quota-transaction", Config.Set_int Define.maxtransaction);
+    ("quota-maxentity", Config.Set_int Quota.maxent);
+    ("quota-maxsize", Config.Set_int Quota.maxsize);
+    ("quota-maxrequests", Config.Set_int Define.maxrequests);
+    ("quota-maxoutstanding", Config.Set_int Define.maxoutstanding);
+    ("quota-maxwatchevents", Config.Set_int Define.maxwatchevents);
+    ("quota-path-max", Config.Set_int Define.path_max);
+    ("gc-max-overhead", Config.Set_int Define.gc_max_overhead);
+    ("test-eagain", Config.Set_bool Transaction.test_eagain);
+    ("persistent", Config.Set_bool Disk.enable);
+    ("xenstored-log-file", Config.String Logging.set_xenstored_log_destination);
+    ("xenstored-log-level", Config.String
+       (fun s -> Logging.xenstored_log_level := Logging.level_of_string s));
+    ("xenstored-log-nb-files", Config.Set_int Logging.xenstored_log_nb_files);
+    ("xenstored-log-nb-lines", Config.Set_int Logging.xenstored_log_nb_lines);
+    ("xenstored-log-nb-chars", Config.Set_int Logging.xenstored_log_nb_chars);
+    ("access-log-file", Config.String Logging.set_access_log_destination);
+    ("access-log-nb-files", Config.Set_int Logging.access_log_nb_files);
+    ("access-log-nb-lines", Config.Set_int Logging.access_log_nb_lines);
+    ("access-log-nb-chars", Config.Set_int Logging.access_log_nb_chars);
+    ("access-log-read-ops", Config.Set_bool Logging.access_log_read_ops);
+    ("access-log-transactions-ops", Config.Set_bool Logging.access_log_transaction_ops);
+    ("access-log-special-ops", Config.Set_bool Logging.access_log_special_ops);
+    ("allow-debug", Config.Set_bool Process.allow_debug);
+    ("ring-scan-interval", Config.Set_int ring_scan_interval);
+    ("pid-file", Config.Set_string pidfile);
+    ("xenstored-kva", Config.Set_string Domains.xenstored_kva);
+    ("xenstored-port", Config.Set_string Domains.xenstored_port); ] in
+  begin try Config.read filename options (fun _ _ -> raise Not_found)
+    with
+    | Config.Error err -> List.iter (fun (k, e) ->
+        match e with
+        | "unknown key" -> eprintf "config: unknown key %s\n" k
+        | _             -> eprintf "config: %s: %s\n" k e
+      ) err;
+    | Sys_error m -> eprintf "error: config: %s\n" m;
+  end;
+  !pidfile
 
 module DB = struct
 
-exception Bad_format of string
+  exception Bad_format of string
 
-let dump_format_header = "$xenstored-dump-format"
+  let dump_format_header = "$xenstored-dump-format"
 
-let from_channel_f chan global_f evtchn_f socket_f domain_f watch_f store_f =
-	let unhexify s = Utils.unhexify s in
-	let getpath s =
-		let u = Utils.unhexify s in
-		debug "Path: %s" u;
-		Store.Path.of_string u in
-	let header = input_line chan in
-	if header <> dump_format_header then
-		raise (Bad_format "header");
-	let quit = ref false in
-	while not !quit
-	do
-		try
-			let line = input_line chan in
-			let l = String.split ',' line in
-			try
-				match l with
-				| "global" :: rw :: _ ->
-					(* there might be more parameters here,
-					   e.g. a RO socket from a previous version: ignore it *)
-					global_f ~rw
-				| "evtchn-dev" :: fd :: domexc_port :: [] ->
-					evtchn_f ~fd:(int_of_string fd)
-						 ~domexc_port:(int_of_string domexc_port)
-				| "socket" :: fd :: [] ->
-					socket_f ~fd:(int_of_string fd)
-				| "dom" :: domid :: mfn :: remote_port :: rest ->
-					let local_port = match rest with
-						  | [] -> None (* backward compat: old version didn't have it *)
-						  | local_port :: _ -> Some (int_of_string local_port) in
-					domain_f ?local_port
-						 ~remote_port:(int_of_string remote_port)
-						 (int_of_string domid)
-						 (Nativeint.of_string mfn)
-				| "watch" :: domid :: path :: token :: [] ->
-					watch_f (int_of_string domid)
-					        (unhexify path) (unhexify token)
-				| "store" :: path :: perms :: value :: [] ->
-					store_f (getpath path)
-					        (Perms.Node.of_string (unhexify perms ^ "\000"))
-					        (unhexify value)
-				| _ ->
-					warn "restoring: ignoring unknown line: %s" line
-			with exn ->
-				warn "restoring: ignoring unknown line: %s (exception: %s)"
-				     line (Printexc.to_string exn);
-				()
-		with End_of_file ->
-			quit := true
-	done;
-	info "Completed loading xenstore dump"
+  let from_channel_f chan global_f evtchn_f socket_f domain_f watch_f store_f =
+    let unhexify s = Utils.unhexify s in
+    let getpath s =
+      let u = Utils.unhexify s in
+      debug "Path: %s" u;
+      Store.Path.of_string u in
+    let header = input_line chan in
+    if header <> dump_format_header then
+      raise (Bad_format "header");
+    let quit = ref false in
+    while not !quit
+    do
+      try
+        let line = input_line chan in
+        let l = String.split ',' line in
+        try
+          match l with
+          | "global" :: rw :: _ ->
+            (* there might be more parameters here,
+               					   e.g. a RO socket from a previous version: ignore it *)
+            global_f ~rw
+          | "evtchn-dev" :: fd :: domexc_port :: [] ->
+            evtchn_f ~fd:(int_of_string fd)
+              ~domexc_port:(int_of_string domexc_port)
+          | "socket" :: fd :: [] ->
+            socket_f ~fd:(int_of_string fd)
+          | "dom" :: domid :: mfn :: remote_port :: rest ->
+            let local_port = match rest with
+              | [] -> None (* backward compat: old version didn't have it *)
+              | local_port :: _ -> Some (int_of_string local_port) in
+            domain_f ?local_port
+              ~remote_port:(int_of_string remote_port)
+              (int_of_string domid)
+              (Nativeint.of_string mfn)
+          | "watch" :: domid :: path :: token :: [] ->
+            watch_f (int_of_string domid)
+              (unhexify path) (unhexify token)
+          | "store" :: path :: perms :: value :: [] ->
+            store_f (getpath path)
+              (Perms.Node.of_string (unhexify perms ^ "\000"))
+              (unhexify value)
+          | _ ->
+            warn "restoring: ignoring unknown line: %s" line
+        with exn ->
+          warn "restoring: ignoring unknown line: %s (exception: %s)"
+            line (Printexc.to_string exn);
+          ()
+      with End_of_file ->
+        quit := true
+    done;
+    info "Completed loading xenstore dump"
 
-let from_channel store cons domains_init chan =
-	(* don't let the permission get on our way, full perm ! *)
-	let op = Store.get_ops store Perms.Connection.full_rights in
-	let rwro = ref (None) in
-	let doms = ref (None) in
+  let from_channel store cons domains_init chan =
+    (* don't let the permission get on our way, full perm ! *)
+    let op = Store.get_ops store Perms.Connection.full_rights in
+    let rwro = ref (None) in
+    let doms = ref (None) in
 
-	let require_doms () =
-		match !doms with
-		| None ->
-			warn "No event channel file descriptor available in dump!";
-		        let domains = domains_init @@ Event.init () in
-		        doms := Some domains;
-		        domains
-		| Some d -> d
-	in
-	let global_f ~rw =
-		let get_listen_sock sockfd =
-			let fd = sockfd |> int_of_string |> Utils.FD.of_int in
-			Unix.listen fd 1;
-			Some fd
-		in
-		rwro := get_listen_sock rw
-	in
-	let evtchn_f ~fd ~domexc_port =
-		let evtchn = Event.init ~fd ~domexc_port () in
-		doms := Some(domains_init evtchn)
-	in
-	let socket_f ~fd =
-		let ufd = Utils.FD.of_int fd in
-		let is_valid = try (Unix.fstat ufd).Unix.st_kind = Unix.S_SOCK with _ -> false in
-		if is_valid then
-			Connections.add_anonymous cons ufd
-		else
-			warn "Ignoring invalid socket FD %d" fd
-	in
-	let domain_f ?local_port ~remote_port domid mfn =
-		let doms = require_doms () in
-		let ndom =
-			if domid > 0 then
-				Domains.create ?local_port ~remote_port doms domid mfn
-			else
-				Domains.create0 ?local_port doms
-			in
-		Connections.add_domain cons ndom;
-		in
-	let get_con id =
-		if id < 0 then Connections.find cons (Utils.FD.of_int (-id))
-		else Connections.find_domain cons id
-	in
-	let watch_f id path token =
-		ignore (Connections.add_watch cons (get_con id) path token)
-		in
-	let store_f path perms value =
-		op.Store.write path value;
-		op.Store.setperms path perms
-		in
-	from_channel_f chan global_f evtchn_f socket_f domain_f watch_f store_f;
-	!rwro, require_doms ()
+    let require_doms () =
+      match !doms with
+      | None ->
+        warn "No event channel file descriptor available in dump!";
+        let domains = domains_init @@ Event.init () in
+        doms := Some domains;
+        domains
+      | Some d -> d
+    in
+    let global_f ~rw =
+      let get_listen_sock sockfd =
+        let fd = sockfd |> int_of_string |> Utils.FD.of_int in
+        Unix.listen fd 1;
+        Some fd
+      in
+      rwro := get_listen_sock rw
+    in
+    let evtchn_f ~fd ~domexc_port =
+      let evtchn = Event.init ~fd ~domexc_port () in
+      doms := Some(domains_init evtchn)
+    in
+    let socket_f ~fd =
+      let ufd = Utils.FD.of_int fd in
+      let is_valid = try (Unix.fstat ufd).Unix.st_kind = Unix.S_SOCK with _ -> false in
+      if is_valid then
+        Connections.add_anonymous cons ufd
+      else
+        warn "Ignoring invalid socket FD %d" fd
+    in
+    let domain_f ?local_port ~remote_port domid mfn =
+      let doms = require_doms () in
+      let ndom =
+        if domid > 0 then
+          Domains.create ?local_port ~remote_port doms domid mfn
+        else
+          Domains.create0 ?local_port doms
+      in
+      Connections.add_domain cons ndom;
+    in
+    let get_con id =
+      if id < 0 then Connections.find cons (Utils.FD.of_int (-id))
+      else Connections.find_domain cons id
+    in
+    let watch_f id path token =
+      ignore (Connections.add_watch cons (get_con id) path token)
+    in
+    let store_f path perms value =
+      op.Store.write path value;
+      op.Store.setperms path perms
+    in
+    from_channel_f chan global_f evtchn_f socket_f domain_f watch_f store_f;
+    !rwro, require_doms ()
 
-let from_file store cons doms file =
-	info "Loading xenstore dump from %s" file;
-	let channel = open_in file in
-	finally (fun () -> from_channel store doms cons channel)
-	        (fun () -> close_in channel)
+  let from_file store cons doms file =
+    info "Loading xenstore dump from %s" file;
+    let channel = open_in file in
+    finally (fun () -> from_channel store doms cons channel)
+      (fun () -> close_in channel)
 
-let to_channel store cons (rw, evtchn) chan =
-	let hexify s = Utils.hexify s in
+  let to_channel store cons (rw, evtchn) chan =
+    let hexify s = Utils.hexify s in
 
-	fprintf chan "%s\n" dump_format_header;
-	let fdopt = function None -> -1 | Some fd ->
-		(* systemd and utils.ml sets it close on exec *)
-		Unix.clear_close_on_exec fd;
-		Utils.FD.to_int fd in
-	fprintf chan "global,%d\n" (fdopt rw);
+    fprintf chan "%s\n" dump_format_header;
+    let fdopt = function None -> -1 | Some fd ->
+      (* systemd and utils.ml sets it close on exec *)
+      Unix.clear_close_on_exec fd;
+      Utils.FD.to_int fd in
+    fprintf chan "global,%d\n" (fdopt rw);
 
-	(* dump evtchn device info *)
-	Event.dump evtchn chan;
+    (* dump evtchn device info *)
+    Event.dump evtchn chan;
 
-	(* dump connections related to domains: domid, mfn, eventchn port/ sockets, and watches *)
-	Connections.iter cons (fun con -> Connection.dump con chan);
+    (* dump connections related to domains: domid, mfn, eventchn port/ sockets, and watches *)
+    Connections.iter cons (fun con -> Connection.dump con chan);
 
-	(* dump the store *)
-	Store.dump_fct store (fun path node ->
-		let name, perms, value = Store.Node.unpack node in
-		let fullpath = Store.Path.to_string (Store.Path.of_path_and_name path name) in
-		let permstr = Perms.Node.to_string perms in
-		fprintf chan "store,%s,%s,%s\n" (hexify fullpath) (hexify permstr) (hexify value)
-	);
-	flush chan;
-	()
+    (* dump the store *)
+    Store.dump_fct store (fun path node ->
+        let name, perms, value = Store.Node.unpack node in
+        let fullpath = Store.Path.to_string (Store.Path.of_path_and_name path name) in
+        let permstr = Perms.Node.to_string perms in
+        fprintf chan "store,%s,%s,%s\n" (hexify fullpath) (hexify permstr) (hexify value)
+      );
+    flush chan;
+    ()
 
 
-let to_file store cons fds file =
-	let channel = open_out_gen [ Open_wronly; Open_creat; Open_trunc; ] 0o600 file in
-	finally (fun () -> to_channel store cons fds channel)
-	        (fun () -> close_out channel)
+  let to_file store cons fds file =
+    let channel = open_out_gen [ Open_wronly; Open_creat; Open_trunc; ] 0o600 file in
+    finally (fun () -> to_channel store cons fds channel)
+      (fun () -> close_out channel)
 end
 
 (*
@@ -352,292 +352,292 @@ end
 *)
 
 let tweak_gc () =
-	Gc.set { (Gc.get ()) with Gc.max_overhead = !Define.gc_max_overhead }
+  Gc.set { (Gc.get ()) with Gc.max_overhead = !Define.gc_max_overhead }
 
 
 let () =
-	Printexc.set_uncaught_exception_handler Logging.fallback_exception_handler;
-	let cf = do_argv in
-	let pidfile =
-		if Sys.file_exists (config_filename cf) then
-			parse_config (config_filename cf)
-		else
-			default_pidfile
-		in
+  Printexc.set_uncaught_exception_handler Logging.fallback_exception_handler;
+  let cf = do_argv in
+  let pidfile =
+    if Sys.file_exists (config_filename cf) then
+      parse_config (config_filename cf)
+    else
+      default_pidfile
+  in
 
-	tweak_gc ();
+  tweak_gc ();
 
-	(try
-		Unixext.mkdir_rec (Filename.dirname pidfile) 0o755
-	with _ ->
-		()
-	);
+  (try
+     Unixext.mkdir_rec (Filename.dirname pidfile) 0o755
+   with _ ->
+     ()
+  );
 
-	let rw_sock =
-		if cf.disable_socket || cf.live_reload then
-			None
-		else
-			Some (Unix.handle_unix_error Utils.create_unix_socket Define.xs_daemon_socket)
-		in
+  let rw_sock =
+    if cf.disable_socket || cf.live_reload then
+      None
+    else
+      Some (Unix.handle_unix_error Utils.create_unix_socket Define.xs_daemon_socket)
+  in
 
-	if cf.daemonize && not cf.live_reload then
-		Unixext.daemonize ()
-	else
-		printf "Xen Storage Daemon, version %d.%d\n%!"
-			Define.xenstored_major Define.xenstored_minor;
+  if cf.daemonize && not cf.live_reload then
+    Unixext.daemonize ()
+  else
+    printf "Xen Storage Daemon, version %d.%d\n%!"
+      Define.xenstored_major Define.xenstored_minor;
 
-	(try Unixext.pidfile_write pidfile with _ -> ());
+  (try Unixext.pidfile_write pidfile with _ -> ());
 
-	(* for compatilibity with old xenstored *)
-	begin match cf.pidfile with
-	| Some pidfile -> Unixext.pidfile_write pidfile
-	| None         -> () end;
+  (* for compatilibity with old xenstored *)
+  begin match cf.pidfile with
+    | Some pidfile -> Unixext.pidfile_write pidfile
+    | None         -> () end;
 
-	let store = Store.create () in
-	let next_frequent_ops = ref 0. in
-	let advance_next_frequent_ops () =
-		next_frequent_ops := (Unix.gettimeofday () +. !Define.conflict_max_history_seconds)
-	in
-	let delay_next_frequent_ops_by duration =
-		next_frequent_ops := !next_frequent_ops +. duration
-	in
-	let domains_init eventchn = Domains.init eventchn advance_next_frequent_ops in
+  let store = Store.create () in
+  let next_frequent_ops = ref 0. in
+  let advance_next_frequent_ops () =
+    next_frequent_ops := (Unix.gettimeofday () +. !Define.conflict_max_history_seconds)
+  in
+  let delay_next_frequent_ops_by duration =
+    next_frequent_ops := !next_frequent_ops +. duration
+  in
+  let domains_init eventchn = Domains.init eventchn advance_next_frequent_ops in
 
-	let cons = Connections.create () in
+  let cons = Connections.create () in
 
-	let quit = ref false in
+  let quit = ref false in
 
-	Logging.init_xenstored_log();
-	List.iter (fun path ->
-		Store.write store Perms.Connection.full_rights path "") Store.Path.specials;
+  Logging.init_xenstored_log();
+  List.iter (fun path ->
+      Store.write store Perms.Connection.full_rights path "") Store.Path.specials;
 
-	let rw_sock, domains =
-	if cf.restart && Sys.file_exists Disk.xs_daemon_database then (
-		let rw, domains = DB.from_file store domains_init cons Disk.xs_daemon_database in
-		info "Live reload: database loaded";
-		Process.LiveUpdate.completed ();
-		rw, domains
-	) else (
-		info "No live reload: regular startup";
-		let domains = domains_init @@ Event.init () in
-		if !Disk.enable then (
-			info "reading store from disk";
-			Disk.read store
-		);
+  let rw_sock, domains =
+    if cf.restart && Sys.file_exists Disk.xs_daemon_database then (
+      let rw, domains = DB.from_file store domains_init cons Disk.xs_daemon_database in
+      info "Live reload: database loaded";
+      Process.LiveUpdate.completed ();
+      rw, domains
+    ) else (
+      info "No live reload: regular startup";
+      let domains = domains_init @@ Event.init () in
+      if !Disk.enable then (
+        info "reading store from disk";
+        Disk.read store
+      );
 
-		let localpath = Store.Path.of_string "/local" in
-		if not (Store.path_exists store localpath) then
-			Store.mkdir store (Perms.Connection.create 0) localpath;
+      let localpath = Store.Path.of_string "/local" in
+      if not (Store.path_exists store localpath) then
+        Store.mkdir store (Perms.Connection.create 0) localpath;
 
-		if cf.domain_init then (
-			Connections.add_domain cons (Domains.create0 domains);
-		);
-		rw_sock, domains
-	) in
+      if cf.domain_init then (
+        Connections.add_domain cons (Domains.create0 domains);
+      );
+      rw_sock, domains
+    ) in
 
-	(* For things that need to be done periodically but more often
-	 * than the periodic_ops function *)
-	let frequent_ops () =
-		if Unix.gettimeofday () > !next_frequent_ops then (
-			History.trim ();
-			Domains.incr_conflict_credit domains;
-			advance_next_frequent_ops ()
-		) in
+  (* For things that need to be done periodically but more often
+     	 * than the periodic_ops function *)
+  let frequent_ops () =
+    if Unix.gettimeofday () > !next_frequent_ops then (
+      History.trim ();
+      Domains.incr_conflict_credit domains;
+      advance_next_frequent_ops ()
+    ) in
 
-	(* required for xenstore-control to detect availability of live-update *)
-	let tool_path = Store.Path.of_string "/tool" in
-	if not (Store.path_exists store tool_path) then
-		Store.mkdir store Perms.Connection.full_rights tool_path;
-	Store.write store Perms.Connection.full_rights
-		(Store.Path.of_string "/tool/xenstored") Sys.executable_name;
+  (* required for xenstore-control to detect availability of live-update *)
+  let tool_path = Store.Path.of_string "/tool" in
+  if not (Store.path_exists store tool_path) then
+    Store.mkdir store Perms.Connection.full_rights tool_path;
+  Store.write store Perms.Connection.full_rights
+    (Store.Path.of_string "/tool/xenstored") Sys.executable_name;
 
-	Sys.set_signal Sys.sighup (Sys.Signal_handle sighup_handler);
-	Sys.set_signal Sys.sigterm (Sys.Signal_handle (fun _ ->
-		info "Received SIGTERM";
-		quit := true));
-	Sys.set_signal Sys.sigusr1 (Sys.Signal_handle (fun _ -> sigusr1_handler store));
-	Sys.set_signal Sys.sigpipe Sys.Signal_ignore;
+  Sys.set_signal Sys.sighup (Sys.Signal_handle sighup_handler);
+  Sys.set_signal Sys.sigterm (Sys.Signal_handle (fun _ ->
+      info "Received SIGTERM";
+      quit := true));
+  Sys.set_signal Sys.sigusr1 (Sys.Signal_handle (fun _ -> sigusr1_handler store));
+  Sys.set_signal Sys.sigpipe Sys.Signal_ignore;
 
-	let eventchn = Domains.eventchn domains in
+  let eventchn = Domains.eventchn domains in
 
-	if cf.activate_access_log then begin
-		let post_rotate () = DB.to_file store cons (None, eventchn) Disk.xs_daemon_database in
-		Logging.init_access_log post_rotate
-	end;
+  if cf.activate_access_log then begin
+    let post_rotate () = DB.to_file store cons (None, eventchn) Disk.xs_daemon_database in
+    Logging.init_access_log post_rotate
+  end;
 
-	let spec_fds =
-		(match rw_sock with None -> [] | Some x -> [ x ]) @
-		(if cf.domain_init then [ Event.fd eventchn ] else [])
-		in
+  let spec_fds =
+    (match rw_sock with None -> [] | Some x -> [ x ]) @
+    (if cf.domain_init then [ Event.fd eventchn ] else [])
+  in
 
-	let process_special_fds rset =
-		let accept_connection fd =
-			let (cfd, _addr) = Unix.accept fd in
-			debug "new connection through socket";
-			Connections.add_anonymous cons cfd
-		and handle_eventchn _fd =
-			let port = Event.pending eventchn in
-			debug "pending port %d" (Xeneventchn.to_int port);
-			finally (fun () ->
-				if port = eventchn.Event.domexc then (
-					let (notify, deaddom) = Domains.cleanup domains in
-					List.iter (Store.reset_permissions store) deaddom;
-					List.iter (Connections.del_domain cons) deaddom;
-					if deaddom <> [] || notify then
-						Connections.fire_spec_watches
-							(Store.get_root store)
-							cons Store.Path.release_domain
-				)
-				else
-					let c = Connections.find_domain_by_port cons port in
-					match Connection.get_domain c with
-					| Some dom -> Domain.incr_io_credit dom | None -> ()
-				) (fun () -> Event.unmask eventchn port)
-		and do_if_set fd set fct =
-			if List.mem fd set then
-				fct fd in
+  let process_special_fds rset =
+    let accept_connection fd =
+      let (cfd, _addr) = Unix.accept fd in
+      debug "new connection through socket";
+      Connections.add_anonymous cons cfd
+    and handle_eventchn _fd =
+      let port = Event.pending eventchn in
+      debug "pending port %d" (Xeneventchn.to_int port);
+      finally (fun () ->
+          if port = eventchn.Event.domexc then (
+            let (notify, deaddom) = Domains.cleanup domains in
+            List.iter (Store.reset_permissions store) deaddom;
+            List.iter (Connections.del_domain cons) deaddom;
+            if deaddom <> [] || notify then
+              Connections.fire_spec_watches
+                (Store.get_root store)
+                cons Store.Path.release_domain
+          )
+          else
+            let c = Connections.find_domain_by_port cons port in
+            match Connection.get_domain c with
+            | Some dom -> Domain.incr_io_credit dom | None -> ()
+        ) (fun () -> Event.unmask eventchn port)
+    and do_if_set fd set fct =
+      if List.mem fd set then
+        fct fd in
 
-		maybe (fun fd -> do_if_set fd rset accept_connection) rw_sock;
-		do_if_set (Event.fd eventchn) rset (handle_eventchn)
-	in
+    maybe (fun fd -> do_if_set fd rset accept_connection) rw_sock;
+    do_if_set (Event.fd eventchn) rset (handle_eventchn)
+  in
 
-	let ring_scan_checker dom =
-		(* no need to scan domains already marked as for processing *)
-		if not (Domain.get_io_credit dom > 0) then (
-			debug "Looking up domid %d" (Domain.get_id dom);
-			let con = Connections.find_domain cons (Domain.get_id dom) in
-			if not (Connection.has_more_work con) then (
-				Process.do_output store cons domains con;
-				Process.do_input store cons domains con;
-				if Connection.has_more_work con then
-					(* Previously thought as no work, but detect some after scan (as
-					   processing a new message involves multiple steps.) It's very
-					   likely to be a "lazy" client, bump its credit. It could be false
-					   positive though (due to time window), but it's no harm to give a
-					   domain extra credit. *)
-					let n = 32 + 2 * (Domains.number domains) in
-					info "found lazy domain %d, credit %d" (Domain.get_id dom) n;
-					Domain.set_io_credit ~n dom
-			)
-		) in
+  let ring_scan_checker dom =
+    (* no need to scan domains already marked as for processing *)
+    if not (Domain.get_io_credit dom > 0) then (
+      debug "Looking up domid %d" (Domain.get_id dom);
+      let con = Connections.find_domain cons (Domain.get_id dom) in
+      if not (Connection.has_more_work con) then (
+        Process.do_output store cons domains con;
+        Process.do_input store cons domains con;
+        if Connection.has_more_work con then
+          (* Previously thought as no work, but detect some after scan (as
+             					   processing a new message involves multiple steps.) It's very
+             					   likely to be a "lazy" client, bump its credit. It could be false
+             					   positive though (due to time window), but it's no harm to give a
+             					   domain extra credit. *)
+          let n = 32 + 2 * (Domains.number domains) in
+          info "found lazy domain %d, credit %d" (Domain.get_id dom) n;
+          Domain.set_io_credit ~n dom
+      )
+    ) in
 
-	let last_stat_time = ref 0. in
-	let last_scan_time = ref 0. in
+  let last_stat_time = ref 0. in
+  let last_scan_time = ref 0. in
 
-	let periodic_ops now =
-		debug "periodic_ops starting";
+  let periodic_ops now =
+    debug "periodic_ops starting";
 
-		(* scan all the xs rings as a safenet for ill-behaved clients *)
-		if !ring_scan_interval >= 0 && now > (!last_scan_time +. float !ring_scan_interval) then
-			(last_scan_time := now; Domains.iter domains ring_scan_checker);
+    (* scan all the xs rings as a safenet for ill-behaved clients *)
+    if !ring_scan_interval >= 0 && now > (!last_scan_time +. float !ring_scan_interval) then
+      (last_scan_time := now; Domains.iter domains ring_scan_checker);
 
-		(* make sure we don't print general stats faster than 2 min *)
-		if now > (!last_stat_time +. 120.) then (
-			info "Transaction conflict statistics for last %F seconds:" (now -. !last_stat_time);
-			last_stat_time := now;
-			Domains.iter domains (Domain.log_and_reset_conflict_stats (info "Dom%d caused %Ld conflicts"));
-			info "%Ld failed transactions; of these no culprit was found for %Ld" !Transaction.failed_commits !Transaction.failed_commits_no_culprit;
-			Transaction.reset_conflict_stats ();
+    (* make sure we don't print general stats faster than 2 min *)
+    if now > (!last_stat_time +. 120.) then (
+      info "Transaction conflict statistics for last %F seconds:" (now -. !last_stat_time);
+      last_stat_time := now;
+      Domains.iter domains (Domain.log_and_reset_conflict_stats (info "Dom%d caused %Ld conflicts"));
+      info "%Ld failed transactions; of these no culprit was found for %Ld" !Transaction.failed_commits !Transaction.failed_commits_no_culprit;
+      Transaction.reset_conflict_stats ();
 
-			let gc = Gc.stat () in
-			let (lanon, lanon_ops, lanon_watchs,
-			     ldom, ldom_ops, ldom_watchs) = Connections.stats cons in
-			let store_nodes, store_abort, store_coalesce = Store.stats store in
-			let symtbl_len, symtbl_entries = Symbol.stats () in
+      let gc = Gc.stat () in
+      let (lanon, lanon_ops, lanon_watchs,
+           ldom, ldom_ops, ldom_watchs) = Connections.stats cons in
+      let store_nodes, store_abort, store_coalesce = Store.stats store in
+      let symtbl_len, symtbl_entries = Symbol.stats () in
 
-			info "store stat: nodes(%d) t-abort(%d) t-coalesce(%d)"
-			     store_nodes store_abort store_coalesce;
-			info "sytbl stat: length(%d) entries(%d)" symtbl_len symtbl_entries;
-			info "  con stat: anonymous(%d, %d o, %d w) domains(%d, %d o, %d w)"
-			     lanon lanon_ops lanon_watchs ldom ldom_ops ldom_watchs;
-			info "  mem stat: minor(%.0f) promoted(%.0f) major(%.0f) heap(%d w, %d c) live(%d w, %d b) free(%d w, %d b)"
-			     gc.Gc.minor_words gc.Gc.promoted_words gc.Gc.major_words
-			     gc.Gc.heap_words gc.Gc.heap_chunks
-			     gc.Gc.live_words gc.Gc.live_blocks
-			     gc.Gc.free_words gc.Gc.free_blocks
-		);
-		let elapsed = Unix.gettimeofday () -. now in
-		debug "periodic_ops took %F seconds." elapsed;
-		if !quit then (
-			match Connections.prevents_quit cons with
-			| [] -> ()
-			| domains -> List.iter (fun con -> warn "%s prevents live update"
-								(Connection.get_domstr con)) domains
-		);
-		delay_next_frequent_ops_by elapsed
-	in
+      info "store stat: nodes(%d) t-abort(%d) t-coalesce(%d)"
+        store_nodes store_abort store_coalesce;
+      info "sytbl stat: length(%d) entries(%d)" symtbl_len symtbl_entries;
+      info "  con stat: anonymous(%d, %d o, %d w) domains(%d, %d o, %d w)"
+        lanon lanon_ops lanon_watchs ldom ldom_ops ldom_watchs;
+      info "  mem stat: minor(%.0f) promoted(%.0f) major(%.0f) heap(%d w, %d c) live(%d w, %d b) free(%d w, %d b)"
+        gc.Gc.minor_words gc.Gc.promoted_words gc.Gc.major_words
+        gc.Gc.heap_words gc.Gc.heap_chunks
+        gc.Gc.live_words gc.Gc.live_blocks
+        gc.Gc.free_words gc.Gc.free_blocks
+    );
+    let elapsed = Unix.gettimeofday () -. now in
+    debug "periodic_ops took %F seconds." elapsed;
+    if !quit then (
+      match Connections.prevents_quit cons with
+      | [] -> ()
+      | domains -> List.iter (fun con -> warn "%s prevents live update"
+                                 (Connection.get_domstr con)) domains
+    );
+    delay_next_frequent_ops_by elapsed
+  in
 
-	let period_ops_interval = 15. in
-	let period_start = ref 0. in
+  let period_ops_interval = 15. in
+  let period_start = ref 0. in
 
-	let main_loop () =
-		let is_peaceful c =
-			match Connection.get_domain c with
-			| None -> true (* Treat socket-connections as exempt, and free to conflict. *)
-			| Some dom -> not (Domain.is_paused_for_conflict dom)
-		in
-		frequent_ops ();
-		let mw = Connections.has_more_work cons in
-		let peaceful_mw = List.filter is_peaceful mw in
-		List.iter
-			(fun c ->
-			 match Connection.get_domain c with
-			 | None -> () | Some d -> Domain.incr_io_credit d)
-			peaceful_mw;
-		let start_time = Unix.gettimeofday () in
-		let timeout =
-			let until_next_activity =
-				if Domains.all_at_max_credit domains
-				then period_ops_interval
-				else min (max 0. (!next_frequent_ops -. start_time)) period_ops_interval in
-			if peaceful_mw <> [] then 0. else until_next_activity
-		in
-		let inset, outset = Connections.select ~only_if:is_peaceful cons in
-		let rset, wset, _ =
-		try
-			Poll.poll_select (spec_fds @ inset) outset [] timeout
-		with Unix.Unix_error(Unix.EINTR, _, _) ->
-			[], [], [] in
-		let sfds, cfds =
-			List.partition (fun fd -> List.mem fd spec_fds) rset in
-		if List.length sfds > 0 then
-			process_special_fds sfds;
+  let main_loop () =
+    let is_peaceful c =
+      match Connection.get_domain c with
+      | None -> true (* Treat socket-connections as exempt, and free to conflict. *)
+      | Some dom -> not (Domain.is_paused_for_conflict dom)
+    in
+    frequent_ops ();
+    let mw = Connections.has_more_work cons in
+    let peaceful_mw = List.filter is_peaceful mw in
+    List.iter
+      (fun c ->
+         match Connection.get_domain c with
+         | None -> () | Some d -> Domain.incr_io_credit d)
+      peaceful_mw;
+    let start_time = Unix.gettimeofday () in
+    let timeout =
+      let until_next_activity =
+        if Domains.all_at_max_credit domains
+        then period_ops_interval
+        else min (max 0. (!next_frequent_ops -. start_time)) period_ops_interval in
+      if peaceful_mw <> [] then 0. else until_next_activity
+    in
+    let inset, outset = Connections.select ~only_if:is_peaceful cons in
+    let rset, wset, _ =
+      try
+        Poll.poll_select (spec_fds @ inset) outset [] timeout
+      with Unix.Unix_error(Unix.EINTR, _, _) ->
+        [], [], [] in
+    let sfds, cfds =
+      List.partition (fun fd -> List.mem fd spec_fds) rset in
+    if List.length sfds > 0 then
+      process_special_fds sfds;
 
-		if List.length cfds > 0 || List.length wset > 0 then
-			process_connection_fds store cons domains cfds wset;
-		if timeout <> 0. then (
-			let now = Unix.gettimeofday () in
-			if now > !period_start +. period_ops_interval then
-				(period_start := now; periodic_ops now)
-		);
+    if List.length cfds > 0 || List.length wset > 0 then
+      process_connection_fds store cons domains cfds wset;
+    if timeout <> 0. then (
+      let now = Unix.gettimeofday () in
+      if now > !period_start +. period_ops_interval then
+        (period_start := now; periodic_ops now)
+    );
 
-		process_domains store cons domains
-		in
+    process_domains store cons domains
+  in
 
-	Systemd.sd_notify_ready ();
-	let live_update = ref false in
-	while not (!quit && Connections.prevents_quit cons = [])
-	do
-		try
-			main_loop ();
-			live_update := Process.LiveUpdate.should_run cons;
-			if !live_update || !quit then begin
-				(* don't initiate live update if saving state fails *)
-				DB.to_file store cons (rw_sock, eventchn) Disk.xs_daemon_database;
-				quit := true;
-			end
-		with exc ->
-			let bt = Printexc.get_backtrace () in
-			error "caught exception %s: %s" (Printexc.to_string exc) bt;
-			if cf.reraise_top_level then
-				raise exc
-	done;
-	info "stopping xenstored";
-	(* unlink pidfile so that launch-xenstore works again *)
-	Unixext.unlink_safe pidfile;
-	(match cf.pidfile with Some pidfile -> Unixext.unlink_safe pidfile | None -> ());
+  Systemd.sd_notify_ready ();
+  let live_update = ref false in
+  while not (!quit && Connections.prevents_quit cons = [])
+  do
+    try
+      main_loop ();
+      live_update := Process.LiveUpdate.should_run cons;
+      if !live_update || !quit then begin
+        (* don't initiate live update if saving state fails *)
+        DB.to_file store cons (rw_sock, eventchn) Disk.xs_daemon_database;
+        quit := true;
+      end
+    with exc ->
+      let bt = Printexc.get_backtrace () in
+      error "caught exception %s: %s" (Printexc.to_string exc) bt;
+      if cf.reraise_top_level then
+        raise exc
+  done;
+  info "stopping xenstored";
+  (* unlink pidfile so that launch-xenstore works again *)
+  Unixext.unlink_safe pidfile;
+  (match cf.pidfile with Some pidfile -> Unixext.unlink_safe pidfile | None -> ());
 
-	if !live_update then begin
-		Logging.live_update ();
-		Process.LiveUpdate.launch_exn !Process.LiveUpdate.state
-	end
+  if !live_update then begin
+    Logging.live_update ();
+    Process.LiveUpdate.launch_exn !Process.LiveUpdate.state
+  end
-- 
2.34.1


