Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278DD405B36
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 18:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183406.331573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONCm-0005TI-18; Thu, 09 Sep 2021 16:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183406.331573; Thu, 09 Sep 2021 16:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONCl-0005FZ-Nd; Thu, 09 Sep 2021 16:47:15 +0000
Received: by outflank-mailman (input) for mailman id 183406;
 Thu, 09 Sep 2021 16:47:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCk-00059k-7I
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCk-0002Mr-6V
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCk-0001RU-4n
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:14 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mONCi-0006u8-9f; Thu, 09 Sep 2021 17:47:12 +0100
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
	bh=x/Z6JtsWJCPSlEmR+qVnOar1lbZPIk02VCEiJE0/kp8=; b=fOTlz14qWOZosaesslU/xfdF+g
	jVBn/DhAxoHPnIFg/NgkuHwKAnWldO4IMWsX+YKzuCDfhfEsrSi3pbggGc/n74F1jLvDDzAiaoexu
	2FxZyJdrl+N/1BU1rHYHfxdjibWL7usSt5Q4X9FkBSjdPJBYnVTZX3AkuIYy+lO3zuEI=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 3/4] fmtarches: Use dom0arches, not hardcoded arch list
Date: Thu,  9 Sep 2021 17:47:02 +0100
Message-Id: <20210909164703.19426-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210909164703.19426-1-iwj@xenproject.org>
References: <20210909164703.19426-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will make us reallocate fmt tests when the arch list changes.
It's not ideal because it means tests jumping about across arches and
might let regressions go through but it's better than just dropping
them, and doing a better approach is complex.

This changes some jobs and adds others, roughly:

  +               test-amd64-i386-libvirt-fraw
  -               test-amd64-i386-xl-raw
  +               test-amd64-i386-xl-vhd
  +               test-arm64-arm64-libvirt-raw
  +               test-arm64-arm64-xl-vhd
  +               test-armhf-armhf-libvirt-qcow2

(as reported by standalone-generate-dump-flight-runvars)

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 make-flight | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/make-flight b/make-flight
index e0d11c80..ecbb195b 100755
--- a/make-flight
+++ b/make-flight
@@ -652,7 +652,7 @@ do_pv_debian_tests () {
   # Within each fmt we rotate through the list of arches
   # The starting list rotates once per ts, so that we try to
   # exercise each fmt on each arch family.
-  local fmtarches_outer="i386 armhf amd64 arm64"
+  local fmtarches_outer="$dom0arches"
   local endfmt="do_pv_debian_tests-missing-ts-fmt-for-dom0arch="
 
   for ts in xl libvirt ; do
-- 
2.20.1


