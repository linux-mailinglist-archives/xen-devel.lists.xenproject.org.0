Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9B77BDCDF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 14:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614361.955389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qppjj-0007ea-0H; Mon, 09 Oct 2023 12:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614361.955389; Mon, 09 Oct 2023 12:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qppji-0007cc-Tm; Mon, 09 Oct 2023 12:51:50 +0000
Received: by outflank-mailman (input) for mailman id 614361;
 Mon, 09 Oct 2023 12:51:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTJG=FX=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qppjh-00078l-Ol
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 12:51:49 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c74c572-66a2-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 14:51:49 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso4066747f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Oct 2023 05:51:49 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b00324ae863ac1sm9589576wru.35.2023.10.09.05.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 05:51:48 -0700 (PDT)
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
X-Inumbo-ID: 9c74c572-66a2-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1696855908; x=1697460708; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THzNB7D3yfsNIFN3S2Q+YKzkNqwGb3jd/DGHxsmTa/0=;
        b=UQ+qzgUsGoEMX6kMisYTtrX9leU2grjl0fmR+3Wl1h4Kwd8Low9YPfEWzjUINfXq6X
         sTcJzPVWzNx3cH+DuU4AEGu/Y/LtZQbU99bjmZ7RcodQTKkwmBYfaOdZvRUsPgXQTN+D
         WMoqRjuMYdemuq/kfs4h1lJGso0TyqrcorOrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696855908; x=1697460708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THzNB7D3yfsNIFN3S2Q+YKzkNqwGb3jd/DGHxsmTa/0=;
        b=mA5g8XUIjnJXHxjGCBmOpB3J9NcjrPS+tN6Pg9pQD/UcuEnc8NkxcO9I3m4mQWFNyj
         TmCfBI+WWFmgOBEAjOsM4+Vh7kSw1d11OkzCLb0PulGHzFl3eIa0ArVvOn6YEXMu2YkZ
         KyU6OCPz/q4IBARGr3Q6+XG93vCOIpGN0QA5mf1ILnLfzfJXKJQNk9Bvn7EOFbSNUcuy
         mDEsQYa1vyt6kxDg+xkCWEGQxXrP+XAq+iR4aDle9vrA/g4eLQNhdmi9ufsbNMRf2b1A
         wZP5HdgHaX0bVzFQhSe2Yn+qvGRYIWmXfcAVfuyQDNHjLumDWYuNexmfDsiaNTyfFfh3
         cmLg==
X-Gm-Message-State: AOJu0YyK+YQtMuDAWh7CBy5uSamnoXzAxMJ0+yQkfErWAZkoFeQrHBza
	nwN5WSBmAXs7Lv7L7dSBEa1TfAxcoGrD9sKzWK0=
X-Google-Smtp-Source: AGHT+IE0KzyEMxN/4/m/o1Fbe6ulKEZNjItfXCB2hJEiVHe7D+kt9WF0YiVDc6JrIceOeblEGvckvA==
X-Received: by 2002:adf:f20c:0:b0:320:77f:a982 with SMTP id p12-20020adff20c000000b00320077fa982mr14105036wro.45.1696855908547;
        Mon, 09 Oct 2023 05:51:48 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Henry Wang <Henry.Wang@arm.com>,
	George Dunlap <george.dunlap@cloud.com>,
	Anthony Perard <anthony.perard@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiodakou <xenia.ragiadakou@amd.com>
Subject: [PATCH for-4.18 5/5] xenalyze: Reduce warnings about leaving a vcpu in INIT
Date: Mon,  9 Oct 2023 13:51:37 +0100
Message-Id: <20231009125137.1329146-6-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231009125137.1329146-1-george.dunlap@cloud.com>
References: <20231009125137.1329146-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We warn when we see data for a vcpu moving into a non-RUNNING state,
just so that people know why we're ignoring it.  On full traces, this
happens only once.  However, if the trace was limited to a subset of
pcpus, then this will happen every time the domain in question is
woken on that pcpu.

Add a 'delayed_init' flag to the vcpu struct to indicate when a vcpu
has experienced a delayed init.  Print a warning message once when
entering the state, and once when leaving it.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
Release justification: By removing extraneous output which makes the
tool annoying to use, this could be considered a bug fix; a minor one,
but also in a non-critical part of the code.

CC: Anthony Perard <anthony.perard@cloud.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Xenia Ragiodakou <xenia.ragiadakou@amd.com>
---
 tools/xentrace/xenalyze.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 4b6db59d87..ce6a85d50b 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -1625,7 +1625,7 @@ struct vlapic_struct {
 struct vcpu_data {
     int vid;
     struct domain_data *d; /* up-pointer */
-    unsigned activated:1;
+    unsigned activated:1, delayed_init:1;
 
     int guest_paging_levels;
 
@@ -6979,10 +6979,17 @@ void vcpu_start(struct pcpu_info *p, struct vcpu_data *v,
      * bring a vcpu out of INIT until it's seen to be actually
      * running somewhere. */
     if ( new_runstate != RUNSTATE_RUNNING ) {
-        fprintf(warn, "First schedule for d%dv%d doesn't take us into a running state; leaving INIT\n",
-                v->d->did, v->vid);
+        if ( !v->delayed_init ) {
+            fprintf(warn, "First schedule for d%dv%d doesn't take us into a running state; leaving in INIT\n",
+                    v->d->did, v->vid);
+            v->delayed_init = 1;
+        }
 
         return;
+    } else if ( v->delayed_init ) {
+        fprintf(warn, "d%dv%d RUNSTATE_RUNNING detected, leaving INIT",
+                v->d->did, v->vid);
+        v->delayed_init = 0;
     }
 
     tsc = ri_tsc;
-- 
2.25.1


