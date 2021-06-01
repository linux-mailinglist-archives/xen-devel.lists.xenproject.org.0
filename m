Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248A239779F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134986.251056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zd-0007iz-Qo; Tue, 01 Jun 2021 16:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134986.251056; Tue, 01 Jun 2021 16:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zd-0007eD-J3; Tue, 01 Jun 2021 16:11:49 +0000
Received: by outflank-mailman (input) for mailman id 134986;
 Tue, 01 Jun 2021 16:11:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zc-0005Ec-17
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:11:48 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f02d3d3-25dd-40bb-a90b-7a56cafa0d5f;
 Tue, 01 Jun 2021 16:11:32 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBP1B7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:25 +0200 (CEST)
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
X-Inumbo-ID: 5f02d3d3-25dd-40bb-a90b-7a56cafa0d5f
ARC-Seal: i=1; a=rsa-sha256; t=1622563886; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rTKxOAkKqYFJL5L7GOducmz8OOO1xHg+Am9DHOVEIThR2y71qgA8qMEqUn3HXCS82l
    6D6ABoIHBvhSlR9CZMALQWBO+AfyINY4HR6duXnGenx9CtJEfzShCwFm6yeAQTZvQn2c
    g+kU9Gd2Yvx4s6lt3K0Cg2PceL4O3nnXhARYRiW0JakF/zr3sGvZONAbwr4IWo9INVep
    UBs6HD/ro0SeILfjKpBfJdGDqMLRUtJoJ0qXaQOhK4HxVL+VqROjRRzZ7lDuIB3lg6Ba
    tidqqlXoVMIF1oBi+ICHtlm7C+mDBVv66gCBcaFLpiqMiVZYtAJ1hI22grtrmkBy/UVv
    EVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563886;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=q97eEfHeTtV0cDWNiuGMRdoBkuW+It3JWF9KWqcO/JA=;
    b=SSyySTzshn8kEOHxegJbOF9NyOmyCNKBOlv8OwbvTSmrL+/cA5XWYwmuo5fGxKGULN
    rfFzd/kXuhwqoHjpEkAEd2d1VG4g5Rhp4lZx7EtSRfe6kvzXwKmSZd4km4fv7KfaN7DD
    sEWrakTta9mRArnZMZ1GKZHfIzwzYi9sUhfK3dQiJOUfrmlXrpkcKquTDEsuFiYvOwEl
    muPbLDjBxJtEco8io+KVCxTni03X2HTkMCrRrZokvuuVuVskoIQiVULyxTKIsWDO/a38
    ft7okdV922U0qqWng/27ihvkB/cIgRqrX9VZScwkYFft4FXxAKwo+COLidPZkCOesZ/w
    lSQQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563886;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=q97eEfHeTtV0cDWNiuGMRdoBkuW+It3JWF9KWqcO/JA=;
    b=lM4O7DGKUfc+l8/uC42qfSOM6h4+DtCfrOtiBAKTdo5MgUSCOy26LhszcdSjhS7kjF
    0jCv7eJ3E4IitkJzIJWSv7EjpM29Be1TfA3BPehj8QsuqYXOWS0w+gEYRdHDpNiWQb3P
    AUTFySO+n0cEo7ORuucXWnkfv9BUSGHmcG2RqcGdrkF2wjcZWcthPVTL5PXEQnjLq6c+
    lvu3OXIJ3UIVXLO3Y6Jyrd/xqhW5JSFDGYHZq7xTZ+zUbZa7StjvIqbtr6rCcSWxmqB3
    QsEzp7laZa4pu9KbOkU9YcE/ck6oVtv7MGHGf4VNQaNFIesv5b8opTH+l9wjnsCFAOfI
    finA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210601 02/38] xl: fix description of migrate --debug
Date: Tue,  1 Jun 2021 18:10:42 +0200
Message-Id: <20210601161118.18986-3-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xl migrate --debug used to track every pfn in every batch of pages.
But these times are gone. Adjust the help text to tell what --debug
is supposed to do today.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 docs/man/xl.1.pod.in          | 4 +++-
 tools/libs/guest/xg_sr_save.c | 2 +-
 tools/xl/xl_cmdtable.c        | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index e2176bd696..ed3f4dee1e 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -481,7 +481,9 @@ domain.
 
 =item B<--debug>
 
-Display huge (!) amount of debug information during the migration process.
+Verify transferred domU page data. All memory will be transferred one more
+time to the destination host while the domU is paused, and compared with
+the result of the inital transfer while the domU was still running.
 
 =item B<-p>
 
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 2ba7c3200c..51542a98c8 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -752,7 +752,7 @@ static int send_domain_memory_live(struct xc_sr_context *ctx)
     if ( rc )
         goto out;
 
-    if ( ctx->save.debug && ctx->stream_type != XC_STREAM_PLAIN )
+    if ( ctx->save.debug )
     {
         rc = verify_frames(ctx);
         if ( rc )
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 661323d488..6fd18856c0 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -172,7 +172,7 @@ const struct cmd_spec cmd_table[] = {
       "                migrate-receive [-d -e]\n"
       "-e              Do not wait in the background (on <host>) for the death\n"
       "                of the domain.\n"
-      "--debug         Print huge (!) amount of debug during the migration process.\n"
+      "--debug         Verify transferred domU page data.\n"
       "-p              Do not unpause domain after migrating it.\n"
       "-D              Preserve the domain id"
     },

