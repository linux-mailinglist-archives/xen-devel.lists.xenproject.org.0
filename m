Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A923B4D9DEF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 15:42:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290846.493400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU8ND-0007NT-Gv; Tue, 15 Mar 2022 14:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290846.493400; Tue, 15 Mar 2022 14:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU8ND-0007IP-B6; Tue, 15 Mar 2022 14:42:07 +0000
Received: by outflank-mailman (input) for mailman id 290846;
 Tue, 15 Mar 2022 14:42:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1u5x=T2=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1nU8NB-0007Fw-L8
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 14:42:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13e8aac8-a46e-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 15:42:03 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-B7jc6o2xM2CidF8CYWCU4w-1; Tue, 15 Mar 2022 10:42:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA65E10184A3;
 Tue, 15 Mar 2022 14:41:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E64E540FF40A;
 Tue, 15 Mar 2022 14:41:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C792F21D1F57; Tue, 15 Mar 2022 15:41:56 +0100 (CET)
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
X-Inumbo-ID: 13e8aac8-a46e-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647355322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLfyluImzysLOPkiTvJo2zm+5FjLUH+6CI5H86s0TvU=;
	b=ERV5yuTHo16lD/0D4SgrNWtldjf+jt812GLaWHU/5niI+mLkOMbmWZ9Ydyont0SSJtrM4c
	98rOoKKGnuOshBMY8lz668lmZDjZMTh5S6v6J/h1g951n0DI49wtvk+4YCpcU5gJB7wcGD
	C4UYt09PSfdnlRxswQBG6MSkOzEKLho=
X-MC-Unique: B7jc6o2xM2CidF8CYWCU4w-1
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <ani@anisinha.ca>,
	Laurent Vivier <lvivier@redhat.com>,
	Amit Shah <amit@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Corey Minyard <cminyard@mvista.com>,
	Patrick Venture <venture@google.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Keith Busch <kbusch@kernel.org>,
	Klaus Jensen <its@irrelevant.dk>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Wenchao Wang <wenchao.wang@intel.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	John Snow <jsnow@redhat.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	haxm-team@intel.com,
	qemu-s390x@nongnu.org
Subject: [PATCH v2 2/3] 9pfs: Use g_new() & friends where that makes obvious sense
Date: Tue, 15 Mar 2022 15:41:55 +0100
Message-Id: <20220315144156.1595462-3-armbru@redhat.com>
In-Reply-To: <20220315144156.1595462-1-armbru@redhat.com>
References: <20220315144156.1595462-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).

Initial patch created mechanically with:

    $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
	     --macro-file scripts/cocci-macro-file.h FILES...

This uncovers a typing error:

    ../hw/9pfs/9p.c: In function ‘qid_path_fullmap’:
    ../hw/9pfs/9p.c:855:13: error: assignment to ‘QpfEntry *’ from incompatible pointer type ‘QppEntry *’ [-Werror=incompatible-pointer-types]
      855 |         val = g_new0(QppEntry, 1);
	  |             ^

Harmless, because QppEntry is larger than QpfEntry.  Manually fixed to
allocate a QpfEntry instead.

Cc: Greg Kurz <groug@kaod.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/9pfs/9p-proxy.c           | 2 +-
 hw/9pfs/9p-synth.c           | 4 ++--
 hw/9pfs/9p.c                 | 8 ++++----
 hw/9pfs/codir.c              | 6 +++---
 tests/qtest/virtio-9p-test.c | 4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
index 8b4b5cf7dc..4c5e0fc217 100644
--- a/hw/9pfs/9p-proxy.c
+++ b/hw/9pfs/9p-proxy.c
@@ -1187,7 +1187,7 @@ static int proxy_parse_opts(QemuOpts *opts, FsDriverEntry *fs, Error **errp)
 
 static int proxy_init(FsContext *ctx, Error **errp)
 {
-    V9fsProxy *proxy = g_malloc(sizeof(V9fsProxy));
+    V9fsProxy *proxy = g_new(V9fsProxy, 1);
     int sock_id;
 
     if (ctx->export_flags & V9FS_PROXY_SOCK_NAME) {
diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index b3080e415b..d99d263985 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -49,7 +49,7 @@ static V9fsSynthNode *v9fs_add_dir_node(V9fsSynthNode *parent, int mode,
 
     /* Add directory type and remove write bits */
     mode = ((mode & 0777) | S_IFDIR) & ~(S_IWUSR | S_IWGRP | S_IWOTH);
-    node = g_malloc0(sizeof(V9fsSynthNode));
+    node = g_new0(V9fsSynthNode, 1);
     if (attr) {
         /* We are adding .. or . entries */
         node->attr = attr;
@@ -128,7 +128,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
     }
     /* Add file type and remove write bits */
     mode = ((mode & 0777) | S_IFREG);
-    node = g_malloc0(sizeof(V9fsSynthNode));
+    node = g_new0(V9fsSynthNode, 1);
     node->attr         = &node->actual_attr;
     node->attr->inode  = synth_node_count++;
     node->attr->nlink  = 1;
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index a6d6b3f835..8e9d4aea73 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -324,7 +324,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t fid)
             return NULL;
         }
     }
-    f = g_malloc0(sizeof(V9fsFidState));
+    f = g_new0(V9fsFidState, 1);
     f->fid = fid;
     f->fid_type = P9_FID_NONE;
     f->ref = 1;
@@ -804,7 +804,7 @@ static int qid_inode_prefix_hash_bits(V9fsPDU *pdu, dev_t dev)
 
     val = qht_lookup(&pdu->s->qpd_table, &lookup, hash);
     if (!val) {
-        val = g_malloc0(sizeof(QpdEntry));
+        val = g_new0(QpdEntry, 1);
         *val = lookup;
         affix = affixForIndex(pdu->s->qp_affix_next);
         val->prefix_bits = affix.bits;
@@ -852,7 +852,7 @@ static int qid_path_fullmap(V9fsPDU *pdu, const struct stat *stbuf,
             return -ENFILE;
         }
 
-        val = g_malloc0(sizeof(QppEntry));
+        val = g_new0(QpfEntry, 1);
         *val = lookup;
 
         /* new unique inode and device combo */
@@ -928,7 +928,7 @@ static int qid_path_suffixmap(V9fsPDU *pdu, const struct stat *stbuf,
             return -ENFILE;
         }
 
-        val = g_malloc0(sizeof(QppEntry));
+        val = g_new0(QppEntry, 1);
         *val = lookup;
 
         /* new unique inode affix and device combo */
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 75148bc985..93ba44fb75 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -141,9 +141,9 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
 
         /* append next node to result chain */
         if (!e) {
-            *entries = e = g_malloc0(sizeof(V9fsDirEnt));
+            *entries = e = g_new0(V9fsDirEnt, 1);
         } else {
-            e = e->next = g_malloc0(sizeof(V9fsDirEnt));
+            e = e->next = g_new0(V9fsDirEnt, 1);
         }
         e->dent = qemu_dirent_dup(dent);
 
@@ -163,7 +163,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
                 break;
             }
 
-            e->st = g_malloc0(sizeof(struct stat));
+            e->st = g_new0(struct stat, 1);
             memcpy(e->st, &stbuf, sizeof(struct stat));
         }
 
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 01ca076afe..e28c71bd8f 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -468,12 +468,12 @@ static void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
          togo -= 13 + 8 + 1 + 2 + slen, ++n)
     {
         if (!e) {
-            e = g_malloc(sizeof(struct V9fsDirent));
+            e = g_new(struct V9fsDirent, 1);
             if (entries) {
                 *entries = e;
             }
         } else {
-            e = e->next = g_malloc(sizeof(struct V9fsDirent));
+            e = e->next = g_new(struct V9fsDirent, 1);
         }
         e->next = NULL;
         /* qid[13] offset[8] type[1] name[s] */
-- 
2.35.1


