Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850B88B5C3C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:01:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714132.1115225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SV2-0008Uw-9a; Mon, 29 Apr 2024 15:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714132.1115225; Mon, 29 Apr 2024 15:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SV2-0008QM-5O; Mon, 29 Apr 2024 15:01:00 +0000
Received: by outflank-mailman (input) for mailman id 714132;
 Mon, 29 Apr 2024 15:00:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXAa=MC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1SUz-00061u-Nc
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:00:57 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48213e23-0639-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:00:57 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-4365c1451d4so31256561cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:00:57 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 h5-20020ac85485000000b00439cccb91b2sm6612689qtq.73.2024.04.29.08.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:00:55 -0700 (PDT)
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
X-Inumbo-ID: 48213e23-0639-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714402856; x=1715007656; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJJy5gubMnJaNx3BJ2gbPZ/DdC5mFYTQDBpTvDsIrfk=;
        b=Z5H15jZQky0Gux1WB9koyK6gFqtIZrc3cBNDrPvCxDPatbZ1tF+NviCWuR0KNTuWsM
         xPEujhloHRLDG47Xq5GxZD6McfeE7B5tdGMSxJRJZcInL9buc5/4Z6dKLg6SJrhyAPZO
         Yf0WWvlZIMC+3XGWumULngAuzs4fFiPAB1hBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714402856; x=1715007656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJJy5gubMnJaNx3BJ2gbPZ/DdC5mFYTQDBpTvDsIrfk=;
        b=Q47uPIBq/q3RqzaHIiswayxKbcoDeQmk/6pPY9aU+C2XPm63HD1Hm0pi2hnutthFsR
         j/U7N7gMaufsoSqQxv/kW6nJ6TrnQtjMOPmzb8EzmxOhxaPep2nAmQz4qrfZPg+W5pIf
         JLtweLXwt9wKnSYZD3VncrRmkXmpouuoGm4hfnL6/Zb8yeSqJDFzOh+U1yW24kyNsta0
         dPydjG5hwtv7vm28esJUfOxTqmQIeyCNZokLclHX2eu27j1JWvFKhmnTkDWF4lQwVQXV
         hs/V30AYyjmTUXugyw0O6xr5o3EfhTXeUX8JUNvHDM1cc2FkoNqYNcNYrtZFuR7DCRNC
         rNNQ==
X-Gm-Message-State: AOJu0YwmGO87wRKrgVeziJby6JxPfOSS/ZD8cU3Ah0UhSjt0SxerAVpg
	qP+LxJP8Nx6mXXOFGdURlOmRnvEHDn9Mmo8DPvP/Xn3PfYOv1Ce8FmVDrtbxrNK3q065Ksn5OnB
	o
X-Google-Smtp-Source: AGHT+IF7Kt4rVMpOZTBkwfNyqexlYmDJuCJB7gQOo9oZubbbFgketoMH7REOTY+yQPwhgpfUnURAkw==
X-Received: by 2002:a05:622a:298d:b0:43a:bd5b:2c33 with SMTP id hd13-20020a05622a298d00b0043abd5b2c33mr7519212qtb.3.1714402855678;
        Mon, 29 Apr 2024 08:00:55 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 8/9] create-diff-object: account for changes in the special section itself
Date: Mon, 29 Apr 2024 16:56:53 +0200
Message-ID: <20240429145654.71669-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429145654.71669-1-roger.pau@citrix.com>
References: <20240429145654.71669-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes to special sections are not accounted for right now.  For example a
change that only affects .altinstructions or .ex_table won't be included in the
livepatch payload, if none of the symbols referenced by those sections have
also changed.

Since it's not possible to know which elements in the special group have
changed if we detect a change in the special section the whole group (minus
elements that have references to init section symbols) must be included.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 create-diff-object.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/create-diff-object.c b/create-diff-object.c
index d1b1477be1cd..8bfb6bf92a1b 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1170,13 +1170,32 @@ static int should_keep_rela_group(struct section *sec, int start, int size)
 	 */
 	list_for_each_entry(rela, &sec->relas, list) {
 		if (rela->offset >= start &&
-		    rela->offset < start + size &&
-		    (rela->sym->type == STT_FUNC ||
-		     rela->sym->type == STT_SECTION) &&
-		    rela->sym->sec->include) {
-			found = 1;
-			log_debug("new/changed symbol %s found in special section %s\n",
-				  rela->sym->name, sec->name);
+		    rela->offset < start + size)
+		{
+			/*
+			 * Avoid including groups with relocations against
+			 * symbols living in init sections, those are never
+			 * included in livepatches.
+			 */
+			if (is_init_section(rela->sym->sec))
+				return 0;
+
+			/*
+			 * If the base section has changed, always include all
+			 * groups (except those pointing to .init section
+			 * symbols), as we have no way to differentiate which
+			 * groups have changed.
+			 */
+			if (sec->status != SAME || sec->base->status != SAME)
+				found = 1;
+			else if ((rela->sym->type == STT_FUNC ||
+			          rela->sym->type == STT_SECTION) &&
+			         rela->sym->sec->include) {
+				found = 1;
+				log_debug(
+		"new/changed symbol %s found in special section %s\n",
+				          rela->sym->name, sec->name);
+			}
 		}
 	}
 
-- 
2.44.0


