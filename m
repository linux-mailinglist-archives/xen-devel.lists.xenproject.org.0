Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D839C09D9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:15:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831989.1247394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94Ed-0004dN-3w; Thu, 07 Nov 2024 15:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831989.1247394; Thu, 07 Nov 2024 15:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94Ec-0004aU-VG; Thu, 07 Nov 2024 15:15:46 +0000
Received: by outflank-mailman (input) for mailman id 831989;
 Thu, 07 Nov 2024 15:15:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t94Eb-0003oI-Ct
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:15:45 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27b7f558-9d1b-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 16:15:43 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5cedf5fe237so1288439a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 07:15:43 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a17678sm105578466b.10.2024.11.07.07.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 07:15:41 -0800 (PST)
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
X-Inumbo-ID: 27b7f558-9d1b-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzQiLCJoZWxvIjoibWFpbC1lZDEteDUzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI3YjdmNTU4LTlkMWItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTkyNTQzLjA3NTE0Miwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730992542; x=1731597342; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoiNjgms/M7CWzojeRA9q51b8yyw2BKqNf2L0rfvMh8=;
        b=NWUGG7m/RIDce28t98IW3bFqSGLgsKfgFkLmRB4Yrmp2zU8MvlDWVIZD61m0+xyCZ6
         NRhWTHO3KgKOx4xT30zkdfAMax4+cTYbUcxkSwK1BnPG7TVSlDOABZd28VrTA04Qn3jD
         0933BNToepSfojI4uUDP2lYljrqVafeYPnSig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730992542; x=1731597342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoiNjgms/M7CWzojeRA9q51b8yyw2BKqNf2L0rfvMh8=;
        b=tYeOf6Xyvu6ZTB7x6hm1D0/AWRD+L62yE4N0zn9awV1FvxyNkC2DM9htdOwEOvL7tL
         VXGs8I3bvHW3ZAL+zbGp9VXq9XCPNrRis2qpOz/SeEg9FVhhI05dy5CTx1/Atx13rcm0
         jJXQFDWR2qLLNcK8rERk5MiyaTucDxYpUOr2q/p6g0yRNzDwouZOXN0qLjPW07KiQVEo
         4waI4ncyDfVNUfrYt6zIFAm2/qwS8gZ5gmIKuvscZvw34WPDiQBPqGpuX4wl2xFDUPwX
         AnLxEoS2xK5mPkgNftZVppSXNJsoTokPA4eTLm9A/jqHnJnDq+t/30Vh6vIyEB8kZxPj
         CMmw==
X-Gm-Message-State: AOJu0Yw5CLqiyGOviJN88JJO7v+bNhVV+rFLaILApgc+pKQGXLP958Ab
	9XhRlh/iaGp7rO3MvrAHAYmFlxPQiEShNjYdroPw3nTMUIUIsy5CXk3SvxfyuKhRTa/C0wG6IbS
	p
X-Google-Smtp-Source: AGHT+IEnh9Qz4SbUeRjvVHrxBsM7u1e/LqXNY5W2RAoK1Lmokyfoh+I1mSpvdEeZOf1+y0Jdl2IJdA==
X-Received: by 2002:a17:907:97d6:b0:a9a:673f:4dcc with SMTP id a640c23a62f3a-a9e6557d76amr2279855066b.22.1730992542131;
        Thu, 07 Nov 2024 07:15:42 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 4/4] create-diff-object: also include relas that point to changed sections
Date: Thu,  7 Nov 2024 16:15:09 +0100
Message-ID: <20241107151509.73621-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241107151509.73621-1-roger.pau@citrix.com>
References: <20241107151509.73621-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

create-diff-object has a special handling for some specific sections, like
.altinstructions or .livepatch.hooks.*.  The contents of those sections are in
the form of array elements, where each element can be processed independently
of the rest.  For example an element in .altinstructions is a set of
replacement coordinates, with the layout specified by the alt_instr struct.  In
the case of .livepatch.hooks.* each element is a pointer to a hook function to
call.

The contents of this array is processed element wise, so that
create-diff-object can decide whether the element relates to the content in the
livepatch and thus needs keeping.  Such relation is driven based on the
contents of the relocations for the special sections.  If a relocation to be
applied to a special section element depends on any symbol to be included in
the livepatch then the special element is also considered required and thus
added to the livepatch contents.

However relocations don't always reference function type symbols, they can also
reference sections type symbols, and that's usually the case with hook symbols
that have relocations based on section symbols, as an example:

RELOCATION RECORDS FOR [.livepatch.hooks.load]:
OFFSET           TYPE              VALUE
0000000000000000 R_X86_64_64       .text.foobar

Symbol information for .text.foobar:

0000000000000000 l    d  .text.foobar      0000000000000000 .text.foobar

As seen above, the .livepatch.hooks.load relocation uses a non-function symbol,
which given the current code in should_keep_rela_group() would mean it's not
considered for inclusion in the livepatch.

Fix this by allowing should_keep_rela_group() to also keep relocations if they
either point to function or section symbols.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 create-diff-object.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/create-diff-object.c b/create-diff-object.c
index 924059a1842b..c21cc576052a 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1158,11 +1158,17 @@ static int should_keep_rela_group(struct section *sec, int start, int size)
 	struct rela *rela;
 	int found = 0;
 
-	/* check if any relas in the group reference any changed functions */
+	/*
+	 * Check if any relas in the group reference any changed functions or
+	 * sections.  As seen by hook related relocations (.livepatch.hooks.*),
+	 * it's possible they use the section symbol as a reference rather than
+	 * the function symbol.
+	 */
 	list_for_each_entry(rela, &sec->relas, list) {
 		if (rela->offset >= start &&
 		    rela->offset < start + size &&
-		    rela->sym->type == STT_FUNC &&
+		    (rela->sym->type == STT_FUNC ||
+		     rela->sym->type == STT_SECTION) &&
 		    rela->sym->sec->include) {
 			found = 1;
 			log_debug("new/changed symbol %s found in special section %s\n",
-- 
2.46.0


