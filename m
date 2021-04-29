Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AA936E26B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 02:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119616.226198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKQ-00078Z-Tf; Thu, 29 Apr 2021 00:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119616.226198; Thu, 29 Apr 2021 00:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKQ-00077z-PE; Thu, 29 Apr 2021 00:14:50 +0000
Received: by outflank-mailman (input) for mailman id 119616;
 Thu, 29 Apr 2021 00:14:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S48z=J2=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lbuKO-00072A-Tq
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 00:14:48 +0000
Received: from mail-qk1-x736.google.com (unknown [2607:f8b0:4864:20::736])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 436ed0b2-c47d-45a4-a919-3f92849f675e;
 Thu, 29 Apr 2021 00:14:40 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id o5so65593653qkb.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 17:14:40 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id r185sm1021694qkf.78.2021.04.28.17.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 17:14:39 -0700 (PDT)
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
X-Inumbo-ID: 436ed0b2-c47d-45a4-a919-3f92849f675e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=0XtO/J2QIxV3EsCnIwGPbPpW2RCXziWsO8eq8KNOMcc=;
        b=brDXVwtZ9DOU5zpYvrl7RNpKNGJxeMznujlMSHAqojenCtF9ZFdDnle8brORshOy7M
         42qo8z82cPE5wzfyb+2yYp6twrd4mnfILFLsVK+77Pracr3i9pZ6ztpMC99BTMdm1ClA
         cYKE9wUNf+ykjqnyoqoZIny5xYvuAEi8abL9Bv6/zuc4ztmY6Hr9rK4KeSXqKyojuI83
         mC2dAy3kzNXxXwIn1B96GCBBQrpOeBaemjL7aIDEppDSR1t5BREoVz1lQv0cDq0HJchR
         zI+iRFU2g+no3aAw/asUTOlJ6M7kTf9Jj4nMTw85NAm9DZ8GlLSZFOWPqn0NFfea4Ana
         CFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=0XtO/J2QIxV3EsCnIwGPbPpW2RCXziWsO8eq8KNOMcc=;
        b=rS38t0/Fq5TYiC1cNCFXxkcJwdO32E5vGvGW6xZ2REZ0awie+FmlMl799UV8j9pf+J
         t7gZqydtFbGaCDOrsMNJH+x0iy/FhumylDnIBTuV/Yh1lSSoTxvVHS9dnMEqG30QdJeW
         r90Xn0bY5XhailyT4m9OgwbJGLV0Tz0YBthKn3R5BL3bHXIyRWzPr83Jpx5p4+kQtkEP
         S6diJ9ZYztqGX5B3XpcJsaWtEWOendMgLu8eCi3djim0EY/U7V88bpsQU7QIsh6kQcit
         CMT6ZIMWhMykaKfKOUkLy1hP87FmFwdzpTZjW8pq+gsd70OZA9wHMkFgLcJ+Ym2urW/R
         EVXw==
X-Gm-Message-State: AOAM5339gN5Vw3hmG8X+/HIXMfyLFRJLeYxkFJC/aVvAcVbhQo6qNFI2
	3SA0hVwwgMxa9DHAO9hVwsuzes8LzSk=
X-Google-Smtp-Source: ABdhPJzvTftEET+PZK17rrlsHnVK9BhzZX5bMB8KQl6sVY3DdiswQ0xNZIi3w0WOnBBdguaMxlnOJQ==
X-Received: by 2002:a37:5a46:: with SMTP id o67mr31675105qkb.240.1619655279544;
        Wed, 28 Apr 2021 17:14:39 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 02/12] golang/xenlight: fix StringList toC conversion
Date: Wed, 28 Apr 2021 20:14:24 -0400
Message-Id: <0a15ed9eb6cd70416995f5d9805c98572eb6bd50.1619655104.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619650820.git.rosbrookn@ainfosec.com>
References: <cover.1619650820.git.rosbrookn@ainfosec.com>
In-Reply-To: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>
References: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>

The current implementation of StringList.toC does not correctly account
for how libxl_string_list is expected to be laid out in C, which is clear
when one looks at libxl_string_list_length in libxl.c. In particular,
StringList.toC does not account for the extra memory that should be
allocated for the "sentinel" entry. And, when using the "slice trick" to
create a slice that can address C memory, the unsafe.Pointer conversion
should be on a C.libxl_string_list, not *C.libxl_string_list.

Fix these problems by (1) allocating an extra slot in the slice used to
address the C memory, and explicity set the last entry to nil so the C
memory will be zeroed out, and (2) dereferencing csl in the
unsafe.Pointer conversion.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index b9189dec5c..13171d0ad1 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -491,13 +491,14 @@ func (sl *StringList) fromC(csl *C.libxl_string_list) error {
 
 func (sl StringList) toC(csl *C.libxl_string_list) error {
 	var char *C.char
-	size := len(sl)
+	size := len(sl) + 1
 	*csl = (C.libxl_string_list)(C.malloc(C.ulong(size) * C.ulong(unsafe.Sizeof(char))))
-	clist := (*[1 << 30]*C.char)(unsafe.Pointer(csl))[:size:size]
+	clist := (*[1 << 30]*C.char)(unsafe.Pointer(*csl))[:size:size]
 
 	for i, v := range sl {
 		clist[i] = C.CString(v)
 	}
+	clist[len(clist)-1] = nil
 
 	return nil
 }
-- 
2.17.1


