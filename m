Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC843007E5
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 16:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72902.131436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynI-0004g8-FJ; Fri, 22 Jan 2021 15:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72902.131436; Fri, 22 Jan 2021 15:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynI-0004ey-0Q; Fri, 22 Jan 2021 15:56:16 +0000
Received: by outflank-mailman (input) for mailman id 72902;
 Fri, 22 Jan 2021 15:56:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynF-0004bJ-MZ
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynF-0002OY-Kz
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynF-0000Rz-Jw
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:13 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l2ynD-0004Ar-T2; Fri, 22 Jan 2021 15:56:12 +0000
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
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Du2uJm4oHuTzZSLlTawEiTsabsoS+t2X1zlx4gXyhUs=; b=E9G81hP+oAym6MuTYGG2cJTuTp
	7fxw9LpolCWtEnrinBOYlOlzPkLJVuOtaXZkKsZloTGy56RnFcBWKhcPXZ7nBSrFbzJ/bJeXQUS7E
	fn/Le3aZfXcsfs2JRP4JLxulSqFF3IUPdjeJSSdVUIHfpANzAQXmI07J/IrTtzPHYcI4=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 6/7] mfi-common: Provide stripy_rand
Date: Fri, 22 Jan 2021 15:56:02 +0000
Message-Id: <20210122155603.23402-6-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122155603.23402-1-iwj@xenproject.org>
References: <20210122155603.23402-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We will use this in a moment.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mfi-common | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mfi-common b/mfi-common
index 34b0c116..35efd233 100644
--- a/mfi-common
+++ b/mfi-common
@@ -31,6 +31,18 @@ stripy () {
   eval "$out_vn=\"\$out_$out_val\""
 }
 
+stripy_rand () {
+  # feel free to pass not-real values for $job
+  # if desired to perturb the hash, etc.
+  local job="$1"; shift
+  local out_vn="$1"; shift
+  local hash="$( echo "$job $out_vn" | sha256sum )"
+  hash="${hash:0:7}"
+  local ix=$(( (0x$hash * $#) / 0x10000000 + 1 ))
+  out_val="${@:$ix:1}"
+  eval "$out_vn=\"\$out_val\""
+}
+
 branch_wants_migrupgrade_tests () {
   case "$branch" in
     xen-3.*-testing) return 1 ;;
-- 
2.20.1


