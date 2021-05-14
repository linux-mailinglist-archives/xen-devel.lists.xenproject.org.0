Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218683811F5
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 22:46:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127523.239686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhehn-0007JX-BO; Fri, 14 May 2021 20:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127523.239686; Fri, 14 May 2021 20:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhehn-0007HH-7E; Fri, 14 May 2021 20:46:43 +0000
Received: by outflank-mailman (input) for mailman id 127523;
 Fri, 14 May 2021 20:46:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2R2=KJ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lhehm-0007Gy-6V
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 20:46:42 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e4a224a-d718-485e-886a-cb1fda1194a5;
 Fri, 14 May 2021 20:46:41 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1621025158511259.7346088384993;
 Fri, 14 May 2021 13:45:58 -0700 (PDT)
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
X-Inumbo-ID: 4e4a224a-d718-485e-886a-cb1fda1194a5
ARC-Seal: i=1; a=rsa-sha256; t=1621025160; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U7/ezs2SLRUXirSIGHz96sNUGoDN4smUP3Do/O6Sd6zqoWt5zE/QZPJ8G6rwxWkwMART86OK1ssNB7HwrV8O8W32p+VPqN/O9+Q0Joa+WSHqhp8at8+tCuRSv3KnT/Hpz8Qg/cx7FkIy42f0lVXWBILARQooolJzROuCXtqqfxQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1621025160; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=TEHXWnGRgz+Mdn2AlmOOOGtjzZhVm4N8sw0QqTaoWeQ=; 
	b=QpfyjjF1aLfywbcLwS2aD3lcuNEzK4jxdKwxR3bhtOCeyUXjVztVuSXWJFbOHebEGoGtAkiwxKdqpSm65e3/KJbAbRoYPgSg3XIRDhKWan7ucXpi2HMFWELwwB+pJFhORhfaiY6bj+MMvz/mX02du2ECyRJ6kfGY6BsoGZyrIUk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1621025160;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=TEHXWnGRgz+Mdn2AlmOOOGtjzZhVm4N8sw0QqTaoWeQ=;
	b=EDFm+B95+jfimlSNaZ87WFX17Yl3Dn1YwDN87NbF03ZAdGJ9tQhci0nhAghYO4E7
	XduczyeaGNias9+ugjmgRqTvgfDVxs8qih6AIXsgMGl+jWWrRo0KkZrC033I8tBALEr
	F7AkZ7l8jIR9cF2StCr3Eq6gW+FBHCPmlUKnyCsk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	wl@xen.org,
	roger.pau@citrix.com,
	tamas@tklengyel.com,
	tim@xen.org,
	jgross@suse.com,
	aisaila@bitdefender.com,
	ppircalabu@bitdefender.com,
	dfaggioli@suse.com,
	paul@xen.org,
	kevin.tian@intel.com,
	dgdegra@tycho.nsa.gov,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io
Subject: [RFC PATCH 01/10] headers: introduce new default privilege model
Date: Fri, 14 May 2021 16:54:28 -0400
Message-Id: <20210514205437.13661-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210514205437.13661-1-dpsmith@apertussolutions.com>
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This defines the new privilege roles that a domain may be assigned.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xen/sched.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index cc633fdc07..9b2c277ede 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -457,6 +457,24 @@ struct domain
      */
     bool             creation_finished;
 
+    /* When SILO or Flask are not in use, a domain may have one or more roles
+     * that are desired for it to fulfill. To accomplish these role a set of
+     * privilege is required. A break down of the basic privilege is mapped
+     * to a bit field for assignment and verification.
+     */
+#define XSM_NONE      (1U<<0)  /* No role required to make the call */
+#define XSM_SELF      (1U<<1)  /* Allowed to make the call on self */
+#define XSM_TARGET    (1U<<2)  /* Allowed to make the call on a domain's target */
+#define XSM_PLAT_CTRL (1U<<3)  /* Platform Control: domain that control the overall platform */
+#define XSM_DOM_BUILD (1U<<4)  /* Domain Builder: domain that does domain construction and destruction */
+#define XSM_DOM_SUPER (1U<<5)  /* Domain Supervisor: domain that control the lifecycle, of all domains */
+#define XSM_DEV_EMUL  (1U<<6)  /* Device Emulator: domain that provides its target domain's device emulator */
+#define XSM_DEV_BACK  (1U<<7)  /* Device Backend: domain that provides a device backend */
+#define XSM_HW_CTRL   (1U<<8)  /* Hardware Control: domain with physical hardware access and its allocation for domain usage */
+#define XSM_HW_SUPER  (1U<<9)  /* Hardware Supervisor: domain that control allocated physical hardware */
+#define XSM_XENSTORE  (1U<<31) /* Xenstore: domain that can do privileged operations on xenstore */
+    uint32_t         xsm_roles;
+
     /* Which guest this guest has privileges on */
     struct domain   *target;
 
-- 
2.20.1


