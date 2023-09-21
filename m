Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D149B7A941C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 14:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606346.944227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIYf-0006lU-57; Thu, 21 Sep 2023 12:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606346.944227; Thu, 21 Sep 2023 12:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIYe-0006h0-TH; Thu, 21 Sep 2023 12:13:24 +0000
Received: by outflank-mailman (input) for mailman id 606346;
 Thu, 21 Sep 2023 12:13:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x4Y2=FF=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qjIYc-0005zm-PY
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 12:13:22 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fdba246-5878-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 14:13:19 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-NyX3vEfCOqSYhFypna-S0Q-1; Thu, 21 Sep 2023 08:13:16 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB08880D09A;
 Thu, 21 Sep 2023 12:13:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78A4571128D;
 Thu, 21 Sep 2023 12:13:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A38121E6900; Thu, 21 Sep 2023 14:13:12 +0200 (CEST)
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
X-Inumbo-ID: 3fdba246-5878-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695298398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LHmiermdl6RPWlPPPWfGL90MXuUtrZGZhe9H8fs+5EQ=;
	b=gAKSFL3MB2UnkKjWIllSMNM7yx0q00egv6wn0b8Ia/aFuMooFmO4DMfpqAppWnYXkn6D9m
	+RsyXGRjV496w6047PWWzVoksUbDTMgXdBgmqipSic0HAQ2l9t2tzHYgAPrbMLtNteiTh7
	xrjWpyHstdZVFCIYlYYwDG48JeMtmt4=
X-MC-Unique: NyX3vEfCOqSYhFypna-S0Q-1
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	hreitz@redhat.com,
	eblake@redhat.com,
	vsementsov@yandex-team.ru,
	jsnow@redhat.com,
	idryomov@gmail.com,
	pl@kamp.de,
	sw@weilnetz.de,
	sstabellini@kernel.org,
	anthony.perard@citrix.com,
	paul@xen.org,
	pbonzini@redhat.com,
	marcandre.lureau@redhat.com,
	berrange@redhat.com,
	thuth@redhat.com,
	philmd@linaro.org,
	stefanha@redhat.com,
	fam@euphon.net,
	quintela@redhat.com,
	peterx@redhat.com,
	leobras@redhat.com,
	kraxel@redhat.com,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 0/7] Steps towards enabling -Wshadow=local
Date: Thu, 21 Sep 2023 14:13:05 +0200
Message-ID: <20230921121312.1301864-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

Local variables shadowing other local variables or parameters make the
code needlessly hard to understand.  Bugs love to hide in such code.
Evidence: PATCH 1.

Enabling -Wshadow would prevent bugs like this one.  But we'd have to
clean up all the offenders first.  We got a lot of them.

Enabling -Wshadow=local should be less work for almost as much gain.
I took a stab at it.  There's a small, exciting part, and a large,
boring part.

The exciting part is dark preprocessor sorcery to let us nest macro
calls without shadowing: PATCH 7.

The boring part is cleaning up all the other warnings.  I did some
[PATCH 2-6], but ran out of steam long before finishing the job.  Some
160 unique warnings remain.

To see them, enable -Wshadow=local like so:

diff --git a/meson.build b/meson.build
index 98e68ef0b1..9fc4c7ac9d 100644
--- a/meson.build
+++ b/meson.build
@@ -466,6 +466,9 @@ warn_flags = [
   '-Wno-tautological-type-limit-compare',
   '-Wno-psabi',
   '-Wno-gnu-variable-sized-type-not-at-end',
+  '-Wshadow=local',
+  '-Wno-error=shadow=local',
+  '-Wno-error=shadow=compatible-local',
 ]
 
 if targetos != 'darwin'

You may want to drop the -Wno-error lines.

v3:
* PATCH 7: Comment typo [Eric], peel off a pair of parenthesis [Eric],
  revert accidental line breaks [Kevin]

v2:
* PATCH 3+6: Mollify checkpatch
* PATCH 4: Redo for clearer code, R-bys dropped [Kevin]
* PATCH 5: Rename tweaked [Kevin]
* PATCH 6: Rename local @tran instead of the parameter [Kevin]
* PATCH 7: Drop PASTE(), use glue() instead [Richard]; pass
  identifiers instead of __COUNTER__ for readability [Eric]; add
  comments

Markus Armbruster (7):
  migration/rdma: Fix save_page method to fail on polling error
  migration: Clean up local variable shadowing
  ui: Clean up local variable shadowing
  block/dirty-bitmap: Clean up local variable shadowing
  block/vdi: Clean up local variable shadowing
  block: Clean up local variable shadowing
  qobject atomics osdep: Make a few macros more hygienic

 include/qapi/qmp/qobject.h      | 10 ++++++++--
 include/qemu/atomic.h           | 17 +++++++++++-----
 include/qemu/compiler.h         |  3 +++
 include/qemu/osdep.h            | 27 ++++++++++++++++++-------
 block.c                         |  9 +++++----
 block/monitor/bitmap-qmp-cmds.c | 19 +++++++++---------
 block/qcow2-bitmap.c            |  3 +--
 block/rbd.c                     |  2 +-
 block/stream.c                  |  1 -
 block/vdi.c                     |  7 +++----
 block/vvfat.c                   | 35 +++++++++++++++++----------------
 hw/block/xen-block.c            |  6 +++---
 migration/block.c               |  4 ++--
 migration/ram.c                 |  8 +++-----
 migration/rdma.c                | 14 ++++++++-----
 migration/vmstate.c             |  2 +-
 ui/gtk.c                        | 14 ++++++-------
 ui/spice-display.c              |  9 +++++----
 ui/vnc-palette.c                |  2 --
 ui/vnc.c                        | 12 +++++------
 ui/vnc-enc-zrle.c.inc           |  9 ++++-----
 21 files changed, 121 insertions(+), 92 deletions(-)

-- 
2.41.0


