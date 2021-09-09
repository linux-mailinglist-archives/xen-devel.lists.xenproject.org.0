Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4B2405B34
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 18:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183404.331558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONCl-0005DA-4h; Thu, 09 Sep 2021 16:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183404.331558; Thu, 09 Sep 2021 16:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONCl-00059x-0m; Thu, 09 Sep 2021 16:47:15 +0000
Received: by outflank-mailman (input) for mailman id 183404;
 Thu, 09 Sep 2021 16:47:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCj-00059V-8J
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCj-0002Mj-5m
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCj-0001R1-4j
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:13 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mONCh-0006u8-6X; Thu, 09 Sep 2021 17:47:11 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=UMqWVNP+rUg/q7PFg9vaAE7KX7sL7PFJCgDLmgRZxek=; b=TH7E17IQMBWN8yFdiE0k0D+UWL
	20iBRjJS7okhuFzAAqJkILp7G5PQ+m1CZ0rxz45y17RqHqZcP6dXwAw9WvDZt5ULureYHKJolKxyy
	Wzn6icPaJjIMp8yvgH9ADplCW2+pPr6i2/6YOa3ha45EXq30QolnhvbzDenjyFnvXtxU=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/4] mfi-common: break out dom0arches variable (nfc)
Date: Thu,  9 Sep 2021 17:47:00 +0100
Message-Id: <20210909164703.19426-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will allow test choices to depend on the actual rather than
entire dom0arches.

No change to output from standalone-generate-dump-flight-runvars.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mfi-common | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mfi-common b/mfi-common
index 2834411f..70e17f7a 100644
--- a/mfi-common
+++ b/mfi-common
@@ -643,6 +643,7 @@ test_matrix_iterate () {
       *)          echo >&2 "kernbuild ?  $kern"; exit 1 ;;
       esac
 
+      dom0arches=''
       for dom0arch in i386 amd64 armhf arm64; do
 
         case ${xenarch}_${dom0arch} in
@@ -654,6 +655,11 @@ test_matrix_iterate () {
             *) continue ;;
         esac
 
+        dom0arches+=" $dom0arch"
+      done
+
+      for dom0arch in $dom0arches; do
+
         eval "
             arch_runvars=\"\$ARCH_RUNVARS_$dom0arch\"
         "
-- 
2.20.1


