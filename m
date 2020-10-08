Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B954C287BEF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 20:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4562.11982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb6y-0005dm-Jp; Thu, 08 Oct 2020 18:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4562.11982; Thu, 08 Oct 2020 18:57:56 +0000
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
	id 1kQb6y-0005cp-Fm; Thu, 08 Oct 2020 18:57:56 +0000
Received: by outflank-mailman (input) for mailman id 4562;
 Thu, 08 Oct 2020 18:57:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kQb6w-0005Rd-H6
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:57:54 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27f7fc65-d96f-4489-8d37-a62f4a7d1169;
 Thu, 08 Oct 2020 18:57:50 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6q-000424-JJ; Thu, 08 Oct 2020 18:57:48 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6q-0002P9-BJ; Thu, 08 Oct 2020 18:57:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kQb6w-0005Rd-H6
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:57:54 +0000
X-Inumbo-ID: 27f7fc65-d96f-4489-8d37-a62f4a7d1169
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 27f7fc65-d96f-4489-8d37-a62f4a7d1169;
	Thu, 08 Oct 2020 18:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=oKO5AKNeTUrG7AZllhuh/I6ylTG0M0k1GwLjYqlJpq8=; b=0VgqTqfgE6iFtnmo7tyTIVdPMt
	QuH44fAxOfGUDZ2JqYkrCJWtWWT6vj4yDx8LsTfBjGgb8bjzH29jAuYNqvMPy39i/BhA/eiF8aMkp
	SjnpjqBdbXSOjti8kq4F7ckpIQHWOEygmmaDs/MMwHw9JH0C1u3r2rWY+DUVEIGJlM00=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6q-000424-JJ; Thu, 08 Oct 2020 18:57:48 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6q-0002P9-BJ; Thu, 08 Oct 2020 18:57:48 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 07/11] docs/specs: add missing definitions to libxc-migration-stream
Date: Thu,  8 Oct 2020 19:57:31 +0100
Message-Id: <20201008185735.29875-8-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008185735.29875-1-paul@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

The STATIC_DATA_END, X86_CPUID_POLICY and X86_MSR_POLICY record types have
sections explaining what they are but their values are not defined. Indeed
their values are defined as "Reserved for future mandatory records."

Also, the spec revision is adjusted to match the migration stream version
and an END record is added to the description of a 'typical save record for
and x86 HVM guest.'

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Fixes: 6f71b5b1506 ("docs/migration Specify migration v3 and STATIC_DATA_END")
Fixes: ddd273d8863 ("docs/migration: Specify X86_{CPUID,MSR}_POLICY records")
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>

v7:
 - New in v7
---
 docs/specs/libxc-migration-stream.pandoc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/docs/specs/libxc-migration-stream.pandoc b/docs/specs/libxc-migration-stream.pandoc
index 6b0c49e97a..8aeab3b11b 100644
--- a/docs/specs/libxc-migration-stream.pandoc
+++ b/docs/specs/libxc-migration-stream.pandoc
@@ -3,7 +3,7 @@
   Andrew Cooper <<andrew.cooper3@citrix.com>>
   Wen Congyang <<wency@cn.fujitsu.com>>
   Yang Hongyang <<hongyang.yang@easystack.cn>>
-% Revision 2
+% Revision 3
 
 Introduction
 ============
@@ -227,7 +227,13 @@ type         0x00000000: END
 
              0x0000000F: CHECKPOINT_DIRTY_PFN_LIST (Secondary -> Primary)
 
-             0x00000010 - 0x7FFFFFFF: Reserved for future _mandatory_
+             0x00000010: STATIC_DATA_END
+
+             0x00000011: X86_CPUID_POLICY
+
+             0x00000012: X86_MSR_POLICY
+
+             0x00000013 - 0x7FFFFFFF: Reserved for future _mandatory_
              records.
 
              0x80000000 - 0xFFFFFFFF: Reserved for future _optional_
@@ -732,6 +738,7 @@ A typical save record for an x86 HVM guest image would look like:
 * X86_TSC_INFO
 * HVM_PARAMS
 * HVM_CONTEXT
+* END record
 
 HVM_PARAMS must precede HVM_CONTEXT, as certain parameters can affect
 the validity of architectural state in the context.
-- 
2.20.1


