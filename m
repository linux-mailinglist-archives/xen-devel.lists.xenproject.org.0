Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E64298123
	for <lists+xen-devel@lfdr.de>; Sun, 25 Oct 2020 11:12:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.11801.31166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWczv-0004CN-S1; Sun, 25 Oct 2020 10:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11801.31166; Sun, 25 Oct 2020 10:11:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWczv-0004C1-Ov; Sun, 25 Oct 2020 10:11:35 +0000
Received: by outflank-mailman (input) for mailman id 11801;
 Sun, 25 Oct 2020 10:11:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hByA=EA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWczu-0004Bw-5U
 for xen-devel@lists.xenproject.org; Sun, 25 Oct 2020 10:11:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29e5e7ec-1e6b-4c76-ad3c-9c99d5d5a695;
 Sun, 25 Oct 2020 10:11:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 116C6B919;
 Sun, 25 Oct 2020 10:11:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hByA=EA=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWczu-0004Bw-5U
	for xen-devel@lists.xenproject.org; Sun, 25 Oct 2020 10:11:34 +0000
X-Inumbo-ID: 29e5e7ec-1e6b-4c76-ad3c-9c99d5d5a695
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 29e5e7ec-1e6b-4c76-ad3c-9c99d5d5a695;
	Sun, 25 Oct 2020 10:11:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603620692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=raNB0yYuAFJJIBaE4EtGmLT9bOORIVRZjUCtlK/P0+o=;
	b=GnGdjSc9xiqh7P1KQxF+XPTCoKY2UUQthboVD3tGA3Y3LfsN1ldW9P6hWtsiJsTkNderJW
	DXnVS665P4jX0xi21Z5XJyb1EU5uIgyWPDgz7nt/WrE8IPFIkeM5Mn2/Saf5JlbAqoFwpf
	sz02Cna1LaTL1m1KRYqEzpo2TdYU4NY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 116C6B919;
	Sun, 25 Oct 2020 10:11:32 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/libs: let build depend on official headers
Date: Sun, 25 Oct 2020 11:11:29 +0100
Message-Id: <20201025101129.19685-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The build target of a library should depend on the official headers
of that library, too, as those might be required for building other
tools.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/libs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 959ff91a56..b0e785b380 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -57,7 +57,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 all: build
 
 .PHONY: build
-build: libs libxen$(LIBNAME).map
+build: libs libxen$(LIBNAME).map $(LIBHEADERS)
 
 .PHONY: libs
 libs: headers.chk $(LIB) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
-- 
2.26.2


