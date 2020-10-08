Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAD0287BED
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 20:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4566.12029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb7C-00060I-EE; Thu, 08 Oct 2020 18:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4566.12029; Thu, 08 Oct 2020 18:58:10 +0000
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
	id 1kQb7C-0005zU-6U; Thu, 08 Oct 2020 18:58:10 +0000
Received: by outflank-mailman (input) for mailman id 4566;
 Thu, 08 Oct 2020 18:58:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kQb7A-0005RO-PI
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:58:08 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebdf290f-2615-4289-be82-5b3bb9be3c6f;
 Thu, 08 Oct 2020 18:57:52 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6t-00042S-7Y; Thu, 08 Oct 2020 18:57:51 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6t-0002P9-03; Thu, 08 Oct 2020 18:57:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kQb7A-0005RO-PI
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:58:08 +0000
X-Inumbo-ID: ebdf290f-2615-4289-be82-5b3bb9be3c6f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ebdf290f-2615-4289-be82-5b3bb9be3c6f;
	Thu, 08 Oct 2020 18:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=D58UTgHV8FlNHLsedxEWdVpeTR0XSu26cm7AoQLQNpU=; b=Hi+X0PIXwE3MkDPPVg7LgaUgIy
	1IT8qkoisipVVxs5J/J4D+7PangVK3a9UXTSWQucdbxGtyCTx8gRu9OcvjDB3VPqFHmU+ti3VZyN5
	FaR26E7S5UZdCNP/drdWiJ7MeGKil7Hu1PmEhpBjbxgscOZeTVqU8ufWNGe7kpH3cC0E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6t-00042S-7Y; Thu, 08 Oct 2020 18:57:51 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6t-0002P9-03; Thu, 08 Oct 2020 18:57:51 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v10 09/11] tools/python: modify libxc.py to verify v4 stream
Date: Thu,  8 Oct 2020 19:57:33 +0100
Message-Id: <20201008185735.29875-10-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008185735.29875-1-paul@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

This patch adds code to verify the presence of a REC_TYPE_domain_context
record in a v4 stream, as well as absence of REC_TYPE_shared_info and
REC_TYPE_tsc_info records.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Marek Marczykowski-Górecki" <marmarek@invisiblethingslab.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>

v10:
 - New in v10
---
 tools/python/xen/migration/libxc.py | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tools/python/xen/migration/libxc.py b/tools/python/xen/migration/libxc.py
index 9881f5ced4..24fb50cbda 100644
--- a/tools/python/xen/migration/libxc.py
+++ b/tools/python/xen/migration/libxc.py
@@ -59,6 +59,7 @@ REC_TYPE_checkpoint_dirty_pfn_list  = 0x0000000f
 REC_TYPE_static_data_end            = 0x00000010
 REC_TYPE_x86_cpuid_policy           = 0x00000011
 REC_TYPE_x86_msr_policy             = 0x00000012
+REC_TYPE_domain_context             = 0x00000013
 
 rec_type_to_str = {
     REC_TYPE_end                        : "End",
@@ -80,6 +81,7 @@ rec_type_to_str = {
     REC_TYPE_static_data_end            : "Static data end",
     REC_TYPE_x86_cpuid_policy           : "x86 CPUID policy",
     REC_TYPE_x86_msr_policy             : "x86 MSR policy",
+    REC_TYPE_domain_context             : "Domain context",
 }
 
 # page_data
@@ -156,9 +158,9 @@ class VerifyLibxc(VerifyBase):
             raise StreamError("Bad image id: Expected 0x%x, got 0x%x" %
                               (IHDR_IDENT, ident))
 
-        if not (2 <= version <= 3):
+        if not (2 <= version <= 4):
             raise StreamError(
-                "Unknown image version: Expected 2 <= ver <= 3, got %d" %
+                "Unknown image version: Expected 2 <= ver <= 4, got %d" %
                 (version, ))
 
         self.version = version
@@ -362,6 +364,9 @@ class VerifyLibxc(VerifyBase):
     def verify_record_shared_info(self, content):
         """ shared info record """
 
+        if self.version >= 4:
+            raise RecordError("Shared info record found in v4 stream")
+
         contentsz = len(content)
         if contentsz != 4096:
             raise RecordError("Length expected to be 4906 bytes, not %d" %
@@ -371,6 +376,9 @@ class VerifyLibxc(VerifyBase):
     def verify_record_tsc_info(self, content):
         """ tsc info record """
 
+        if self.version >= 4:
+            raise RecordError("TSC info record found in v4 stream")
+
         sz = calcsize(X86_TSC_INFO_FORMAT)
 
         if len(content) != sz:
@@ -476,6 +484,14 @@ class VerifyLibxc(VerifyBase):
             raise RecordError("Record length %u, expected multiple of %u" %
                               (contentsz, sz))
 
+    def verify_record_domain_context(self, content):
+        """ domain context record """
+
+        if self.version < 4:
+            raise RecordError("Domain context record found in v3 stream")
+
+        if len(content) == 0:
+            raise RecordError("Zero length domain context")
 
 record_verifiers = {
     REC_TYPE_end:
@@ -526,4 +542,6 @@ record_verifiers = {
         VerifyLibxc.verify_record_x86_cpuid_policy,
     REC_TYPE_x86_msr_policy:
         VerifyLibxc.verify_record_x86_msr_policy,
+    REC_TYPE_domain_context:
+        VerifyLibxc.verify_record_domain_context,
     }
-- 
2.20.1


