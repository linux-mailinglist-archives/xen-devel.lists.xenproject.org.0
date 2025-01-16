Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60896A1414B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 18:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873681.1284695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU34-0007qz-Lq; Thu, 16 Jan 2025 17:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873681.1284695; Thu, 16 Jan 2025 17:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU34-0007pI-DL; Thu, 16 Jan 2025 17:52:54 +0000
Received: by outflank-mailman (input) for mailman id 873681;
 Thu, 16 Jan 2025 17:52:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV9y=UI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYU33-0007CP-JR
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 17:52:53 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b57a67f7-d432-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 18:52:53 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso243480166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 09:52:53 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384c5c470sm27605266b.26.2025.01.16.09.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 09:52:51 -0800 (PST)
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
X-Inumbo-ID: b57a67f7-d432-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737049972; x=1737654772; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkduoX8PBg5wURJov3JoF6FhqdQ9jnRnJkykFwuVuZg=;
        b=bIroicPcLT3DNyLvc4AZ/eKYdI9emjI4M5k3XSAPUWXVECVvxQmL7aora6M8qke4ok
         RzE/bMEAfA8vpXnVCPc75FBRUuVlkRf1V1i63ZTHJc0ybnIPZ4BTszQX3DhqYZDvrSDP
         3sqnrIkS0pTBaCF4D+628nB3IhmFVBDZkB4AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049972; x=1737654772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkduoX8PBg5wURJov3JoF6FhqdQ9jnRnJkykFwuVuZg=;
        b=qAk5s5bGTidyCGc8/SBLLQt5iLDFmPPWrxkNhsLCj2hekJ1WCKjLt0YwEn+YpmTBVS
         gmBNA4gJ1Wr47O9nTrlHABlDyk8rCaZ+fABDZdYRQGsuNeKvZOLoKubKe6PadRnNTu3I
         QeVcbl8yVRECWEQp5U4LbK0p4TOzYg0sCayd6CSEKdSozUolCzjiiRlCsun7W2eJ6+8C
         KUH7BVqefZZ5XqdB1GpSl+YTc2BMXZAF5v+9sa5FHpLdN49M1ihcVux3dNqUVRrdkXwW
         iYLyM4ATj8Th6X8Xv+BCy+amwgKplvdK8fiXHs227WdSdjz4UPOETFeI1usdYoJ0Ezx9
         fUbA==
X-Gm-Message-State: AOJu0YwWE7d6W2o+kHjqkakH9YEzx0lwGTw62x/ziQ+0WWk6jT+1lgxp
	MxRjvxII3HpczGeeUCDwsn5jMKyfCgwSzaEz2W8VsVa9GbuHt1p56quyougFuC/oc7DQ7u4Lo4k
	U
X-Gm-Gg: ASbGncvq+ooqL8x1emWSgj8786xfHM12s9/Hv9a8n2uR3mdG8rxAOR1DJfdRQTh/ap6
	qQciALZgcYDvcbcwthFJxrdvDB1Sm01PYKD/cydS7J6+5U7XoxKlk+9+3i50BLFThkmp5jSRt7W
	ASDSjLMr2MRGBHr67iVmn4pmAbbnaiIKmcK8mwM65nvyk3M/4bwuc0JZ3DZFo7zB/5ekn9Y3Pqi
	7d/sh6epDuaHm8Di5OeDdsycRss3XpMSb8E41LTRSm6/6OjzoWiSE9zqThtsQ==
X-Google-Smtp-Source: AGHT+IGIWKNJ4OtuhG7/i0Y2/9mANngRo5I7/u9pGjriJtCtSVzLJB4+kk7wHWPjSwVBWTH8QmM9wg==
X-Received: by 2002:a17:907:9997:b0:ab2:c0ba:519e with SMTP id a640c23a62f3a-ab2c0ba708fmr3082553166b.35.1737049972304;
        Thu, 16 Jan 2025 09:52:52 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Artem Savkov <asavkov@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/7] create-diff-object: allow changing subsections
Date: Thu, 16 Jan 2025 18:52:11 +0100
Message-ID: <20250116175214.83742-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250116175214.83742-1-roger.pau@citrix.com>
References: <20250116175214.83742-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Artem Savkov <asavkov@redhat.com>

gcc8 can place functions to .text.unlikely and .text.hot subsections
during optimizations. Allow symbols to change subsections instead of
failing.

Signed-off-by: Artem Savkov <asavkov@redhat.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 create-diff-object.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/create-diff-object.c b/create-diff-object.c
index dd5466bff6ce..3189d3e8451c 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -55,6 +55,13 @@
 #include "common.h"
 
 char *childobj;
+
+enum subsection {
+       SUBSECTION_NORMAL,
+       SUBSECTION_HOT,
+       SUBSECTION_UNLIKELY
+};
+
 enum loglevel loglevel = NORMAL;
 
 static void kpatch_compare_elf_headers(Elf *elf1, Elf *elf2)
@@ -833,6 +840,22 @@ static void kpatch_compare_sections(struct list_head *seclist)
 	}
 }
 
+static enum subsection kpatch_subsection_type(struct section *sec)
+{
+	if (!strncmp(sec->name, ".text.unlikely.", 15))
+		return SUBSECTION_UNLIKELY;
+
+	if (!strncmp(sec->name, ".text.hot.", 10))
+		return SUBSECTION_HOT;
+
+	return SUBSECTION_NORMAL;
+}
+
+static int kpatch_subsection_changed(struct section *sec1, struct section *sec2)
+{
+	return kpatch_subsection_type(sec1) != kpatch_subsection_type(sec2);
+}
+
 static void kpatch_compare_correlated_symbol(struct symbol *sym)
 {
 	struct symbol *sym1 = sym, *sym2 = sym->twin;
@@ -846,10 +869,12 @@ static void kpatch_compare_correlated_symbol(struct symbol *sym)
 	/*
 	 * If two symbols are correlated but their sections are not, then the
 	 * symbol has changed sections.  This is only allowed if the symbol is
-	 * moving out of an ignored section.
+	 * moving out of an ignored section, or moving between normal/hot/unlikely
+	 * subsections.
 	 */
 	if (sym1->sec && sym2->sec && sym1->sec->twin != sym2->sec) {
-		if (sym2->sec->twin && sym2->sec->twin->ignore)
+		if ((sym2->sec->twin && sym2->sec->twin->ignore) ||
+		    kpatch_subsection_changed(sym1->sec, sym2->sec))
 			sym->status = CHANGED;
 		else
 			DIFF_FATAL("symbol changed sections: %s, %s, %s, %s", sym1->name, sym2->name, sym1->sec->name, sym2->sec->name);
-- 
2.46.0


