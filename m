Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3157E76BE6C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 22:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574503.899848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvrl-0001GH-N7; Tue, 01 Aug 2023 20:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574503.899848; Tue, 01 Aug 2023 20:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvrl-0001EZ-KK; Tue, 01 Aug 2023 20:21:13 +0000
Received: by outflank-mailman (input) for mailman id 574503;
 Tue, 01 Aug 2023 20:21:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Rc=DS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qQvrk-0000Vh-73
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 20:21:12 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3c81379-30a8-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 22:21:11 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1690921222919263.86301750890664;
 Tue, 1 Aug 2023 13:20:22 -0700 (PDT)
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
X-Inumbo-ID: f3c81379-30a8-11ee-b25c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1690921225; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LJWZTW9Bg+L3Q9L21qmOk/5B1b4zY0rfPZxLFiwzTbtB2gaThkYoDLs1Gw8mYQy6W2grTkYZvfTx8zecJeh0hlctmBdjVEmJ0XWJyXQ3Ew4it1mVuTqus6oF9tujOpH0JPW4j5UYXW6VFQhMYOcUPAxSz1jsUEG4dYo5V5PccC4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1690921225; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=kf2Rd6TYnxR8dfigS+pnLDBD8C8lGV2r426kdzFRdWo=; 
	b=SHxaszVus3sPdBwiai8onFiR+mMahjhb+zsdUVdbFpevDmDlXQuShYnIDemHUX6lkVu0C+wYcHebM2YbDDoi2hjisRn2eB/s2lHKcaE82rcWwU/fVtLynCYk4uKnRPEWAr1Xj5U5mh4kake3JFFm8NGoScphuAQ2rlyXUDrWoIk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690921225;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=kf2Rd6TYnxR8dfigS+pnLDBD8C8lGV2r426kdzFRdWo=;
	b=a8Qo8Oav2zQrW8HSf67m7NJOl5msUgbNz0s6kOusuLrAyDHJkLZB2NVXh5pr6cXf
	nCAA2mi2ldd85jpcM8Rxt9y0vtKP1g0PLhHP5QhORLyT/xq6KJxJPfeyWhAKrfo7cfi
	4TOdW0fi7xdhVJKZx4NUs1n6DkdN0+upfuvu7GkU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC 4/6] capabilities: introduce console io as a domain capability
Date: Tue,  1 Aug 2023 16:20:04 -0400
Message-Id: <20230801202006.20322-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230801202006.20322-1-dpsmith@apertussolutions.com>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The field `is_console` suggests that the field represents a state of being or
posession, not that it reflects the privilege to access the console. In this
patch the field is renamed to capabilities to encapsulate the capabilities a
domain has been granted. The first capability being the ability to read/write
the Xen console.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/arm/domain_build.c |  4 +++-
 xen/include/xen/sched.h     | 25 +++++++++++++++++++++++--
 xen/include/xsm/dummy.h     |  2 +-
 3 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 51b4daefe1..ad7432b029 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -4076,7 +4076,9 @@ void __init create_domUs(void)
             panic("Error creating domain %s (rc = %ld)\n",
                   dt_node_name(node), PTR_ERR(d));
 
-        d->is_console = true;
+        if ( ! domain_set_cap(d, CAP_CONSOLE_IO) )
+            printk("failed setting console_io on %pd\n", d);
+
         dt_device_set_used_by(node, d->domain_id);
 
         rc = construct_domU(d, node);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ec0f9baff6..b04fbe0565 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -472,8 +472,8 @@ struct domain
 #define ROLE_HARDWARE_DOMAIN   (1U<<2)
 #define ROLE_XENSTORE_DOMAIN   (1U<<3)
     uint8_t          role;
-    /* Can this guest access the Xen console? */
-    bool             is_console;
+#define CAP_CONSOLE_IO  (1U<<0)
+    uint8_t          capabilities;
     /* Is this guest being debugged by dom0? */
     bool             debugger_attached;
     /*
@@ -1146,6 +1146,27 @@ static always_inline bool is_hvm_vcpu(const struct vcpu *v)
     return is_hvm_domain(v->domain);
 }
 
+static always_inline bool domain_has_cap(
+    const struct domain *d, uint8_t cap)
+{
+    return d->capabilities & cap;
+}
+
+static always_inline bool domain_set_cap(
+    struct domain *d, uint8_t cap)
+{
+    switch ( cap )
+    {
+    case CAP_CONSOLE_IO:
+        d->capabilities |= cap;
+        break;
+    default:
+        return false;
+    }
+
+    return domain_has_cap(d, cap);
+}
+
 static always_inline bool hap_enabled(const struct domain *d)
 {
     /* sanitise_domain_config() rejects HAP && !HVM */
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 18f1ddd127..067ff1d111 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -268,7 +268,7 @@ static XSM_INLINE int cf_check xsm_console_io(
     XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
-    if ( d->is_console )
+    if ( domain_has_cap(d, CAP_CONSOLE_IO) )
         return xsm_default_action(XSM_HOOK, d, NULL);
 #ifdef CONFIG_VERBOSE_DEBUG
     if ( cmd == CONSOLEIO_write )
-- 
2.20.1


