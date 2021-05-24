Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9780F38F478
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 22:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131879.246284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHKi-0002J6-Iw; Mon, 24 May 2021 20:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131879.246284; Mon, 24 May 2021 20:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHKi-0002Fp-F1; Mon, 24 May 2021 20:37:52 +0000
Received: by outflank-mailman (input) for mailman id 131879;
 Mon, 24 May 2021 20:37:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+P1=KT=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1llHKg-0001ey-Rc
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 20:37:50 +0000
Received: from mail-qt1-x835.google.com (unknown [2607:f8b0:4864:20::835])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db339771-0a00-45f4-9b4f-5e086dfa79f1;
 Mon, 24 May 2021 20:37:41 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id h24so10195544qtm.12
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 13:37:41 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id t25sm5142847qkt.62.2021.05.24.13.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:37:41 -0700 (PDT)
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
X-Inumbo-ID: db339771-0a00-45f4-9b4f-5e086dfa79f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=0XtO/J2QIxV3EsCnIwGPbPpW2RCXziWsO8eq8KNOMcc=;
        b=Hvl2vFOayH56YKy5obvsAuag1njomXqDiheFKyp9suXVMya6CfU1vIIcDgxSbeGqKZ
         hDTA2FokoUEKrbZBfyV/UcRQ7DIpiJl/SnQ2VXK7odOPqEEctLtBM/WvESVNC/zZqLds
         R57CiItNr6Tw4+Fyf2SUDt88MOyTxefYA+nvhVrhHPsR8zOKQ14cgdXrfMBaTSxWaLTh
         Z0rYUoIKTZJISuBAab/zdur3h19pYHsdRcFLa+NoG7EZg7J/G3zl42xQObC3BUnzp9CU
         ASckTwNXeAzxHPVFj3oLQaw548kRELz5HrTdpmazg4HrL3peXoQwiIOBiTpcTlX4YP40
         X6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=0XtO/J2QIxV3EsCnIwGPbPpW2RCXziWsO8eq8KNOMcc=;
        b=h2/gAf2l74Zfa9zmYEHuPt0DehstjdSRifs36O/W3pUlgmGh58sNcq3pl3iA4WQhB2
         0hRn/AbOzwUaeYVbvswJiyJRwYAfv6h8EdWVHN5Gf3LnFXundc2XelnFSoUA/BxR2kct
         0WNxohYj5bRK4BGk1SVyQbYq/CJPy2d23XeE8XjNVNQVm8ULq6EyfsSD6xu+7MAP6IvT
         WdyGRYOt0p2K668O+98x1PZcTQfeaBnZ8nXOMuNTHs17hqGqSV3io5pmlbXLyW+1zbt1
         WWt47t2fXWHrPH6A+Qi+SD52OHY3kMzRCNl6U2Wof5qG397yBocx17yvGpHK/hr1gCY2
         jU8A==
X-Gm-Message-State: AOAM533SLExVLaD83D+dfcV5RnQNn7sA25KNbTgtEaZSpJf9v5WCkBUb
	w1jVRkM3mORVbRKok21kCHI=
X-Google-Smtp-Source: ABdhPJxb5DHlvWYjgRG4R6V8CZ2jfRLtIuFZLXonuizng5Z/UYV3nC/if1BuceqgJ23zy5XWKI+m8w==
X-Received: by 2002:ac8:7ed2:: with SMTP id x18mr27764289qtj.26.1621888661428;
        Mon, 24 May 2021 13:37:41 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.prg,
	xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RESEND PATCH 02/12] golang/xenlight: fix StringList toC conversion
Date: Mon, 24 May 2021 16:36:43 -0400
Message-Id: <0a15ed9eb6cd70416995f5d9805c98572eb6bd50.1621887506.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>

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


