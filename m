Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86896397797
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134980.250999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zP-0005kp-Oa; Tue, 01 Jun 2021 16:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134980.250999; Tue, 01 Jun 2021 16:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zP-0005c3-H0; Tue, 01 Jun 2021 16:11:35 +0000
Received: by outflank-mailman (input) for mailman id 134980;
 Tue, 01 Jun 2021 16:11:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zO-0005X1-0o
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:11:34 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4413065c-d112-4774-a33b-349495fd5293;
 Tue, 01 Jun 2021 16:11:32 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBR1BB
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:27 +0200 (CEST)
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
X-Inumbo-ID: 4413065c-d112-4774-a33b-349495fd5293
ARC-Seal: i=1; a=rsa-sha256; t=1622563888; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=DgU87WsRh140kAE9TWo8r3FrWteINAYMMfUBdn8sMf+WLhlYtnUV+9gTzJ2ZhipOFk
    +o7WvTY1KoYyCYNg/mvF09j44xxF034sxcTh8r/Coc51YIcmmJVF8i8/CuOarsNGiPvH
    Ux1To3IUtDs5VAXJ/zrj8S11JEiiJk7Fpe/KNRelscm/lQwXnIwDd2Plpg14qyuW8O6i
    ewxJT4xHE287ykPD8o09R7p4oJ7IDu+okvS3lTrOXNJuBjhM/XKlPckvaf3cwSJW8a0A
    sUvK+gQ/5AA3DgjcIJUkVDpus2wG18Uc9U0XqiK44gjdxs+V0ulLGY+EHXOtkbNOQPaf
    0QSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563888;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=RFOd7y+e4U6vNTZpXSTmtkhWhMZi9HHw/wrHDQUGpSw=;
    b=KV23dBncIbEZihTRJbO4NExxqIwqU+zmmb2U04PlPeViIOHVkHmAXuPMjMetbsB+sA
    50bEcZHMKh+JzeyPG26RPoFoYAzqfLJYCV2uTAyqBwjQ58ohOl4WXvh6gFsYiUrQvM93
    KhDlexcoE06Osg5GCFfnKvqr+8NHWh7ufZU0/E5LvIrEWYlozQGUYu5nU5W82e/DZnum
    tjDNzGlFdkvbrL7hM0G3YaPSWH/UMPReJQ4e+eRP8ozXqOQinhjXeYaVNjJxfpW+Lybn
    BujRGqhEU6cxPfqql9XXrPlqPrutr/2zgdK6Uq7/g/LnhGMqMuvI8QlhIL/VCxENTSmt
    a//w==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563888;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=RFOd7y+e4U6vNTZpXSTmtkhWhMZi9HHw/wrHDQUGpSw=;
    b=PFT2fniDwBrbJmUSN5yaULUvwdA1DzSIoDeSvoQP27u7KyVOPm000P/xpuaoFuNV5X
    fVTeojkZrGthq694NBeSn6WM8g4YR6O6fsyZqkScWHepV4egq/E0Tn8gssGa/kKG9Vgv
    UAh5lL0QbRfWScmkVv75iWzBzhJEosoINZ1CQPOVr+yAYMDfngx8RdcDpmFIIvRAMck/
    qrQ1/6A670/1toUPB8t7xu94HbcYqHB9PDK/qCmajSP7a3NK2u4eQjIGpThdAq70OeaD
    +eb0ZzP8nSnOk/9dIx3DztwVkpptW3jgEEiDjNtsMjhqr7Bv51xjnaEtQ1TraJuJELtf
    WQjg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 06/38] tools: use xc_is_known_page_type
Date: Tue,  1 Jun 2021 18:10:46 +0200
Message-Id: <20210601161118.18986-7-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify pfn type on sending side, also verify incoming batch of pfns.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/restore.c | 3 +--
 tools/libs/saverestore/save.c    | 6 ++++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index be259a1c6b..cccb0dcb71 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -406,8 +406,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         }
 
         type = (pages->pfn[i] & PAGE_DATA_TYPE_MASK) >> 32;
-        if ( ((type >> XEN_DOMCTL_PFINFO_LTAB_SHIFT) >= 5) &&
-             ((type >> XEN_DOMCTL_PFINFO_LTAB_SHIFT) <= 8) )
+        if ( xc_is_known_page_type(type) == false )
         {
             ERROR("Invalid type %#"PRIx32" for pfn %#"PRIpfn" (index %u)",
                   type, pfn, i);
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 92d96b0533..8d449ee0ae 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -147,6 +147,12 @@ static int write_batch(struct xc_sr_context *ctx)
 
     for ( i = 0; i < nr_pfns; ++i )
     {
+        if ( xc_is_known_page_type(types[i]) == false )
+        {
+            ERROR("Wrong type %#"PRIpfn" for pfn %#"PRIpfn, types[i], mfns[i]);
+            goto err;
+        }
+
         switch ( types[i] )
         {
         case XEN_DOMCTL_PFINFO_BROKEN:

