Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006FE44DB64
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 18:58:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224831.388364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlEKy-0006Ls-4F; Thu, 11 Nov 2021 17:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224831.388364; Thu, 11 Nov 2021 17:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlEKy-0006IK-0y; Thu, 11 Nov 2021 17:58:12 +0000
Received: by outflank-mailman (input) for mailman id 224831;
 Thu, 11 Nov 2021 17:58:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOKj=P6=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mlEKw-00061G-5V
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 17:58:10 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec2a8953-4318-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 18:58:07 +0100 (CET)
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
X-Inumbo-ID: ec2a8953-4318-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636653488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q5M5rcMoU8akU3ihfSLxmIL46Dy+ECH9/kCBIHplY3E=;
  b=OytE1qHlpiMydDCtFeFan2b8VzRr61p/mBCjNT0biynru1hjh1zvxM9R
   K8XCLa5rugzds5qxpWkje4D40jwUzQENPBaCx7ANYy8p2PE2lZJ0DsA3t
   +UebRuun1rUBRrxR8Ug9bcivW2mfj2r04wZLz6Kt3MzYx254ORxLuP2nd
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: /5QAJWGpTY9N2d1Jfoqx3UvI3Cet8f1whoEibQWWfYDm67MA1UMg64e+4MkGlCqrn6vWd/9pam
 ldTQ20c2VokFHPSaQl3Bmz77sHhsCuT9WeaxDQM3xEjppJ3ypymo5I7SQA6H9oU94SA0p0saDF
 zYoIcU8Fbq0/XLsmzupyIsJLbhQqOkDitY9UOdq5DHRQbmPyB5GJRfOZ5U8EbJktjrDGLNmJ8a
 +7WtKaAvVmIY0bc6H2/tAzQ/niJ+aFsh1hZ6SHf0aw19KE8YFVnXBdgxfZlgACKoyI1NOtg/gi
 SCyrsaeT3AUiP78TGfeJ/gW6
X-SBRS: 5.1
X-MesageID: 59593529
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RqOhU6ymMp+2Qn49mhB6t+eUwSrEfRIJ4+MujC+fZmUNrF6WrkVVz
 2IaW2HSM/yOamSnfNt1Yduz9EwFv5PXx4NjTgdt+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrdg2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8Iqm
 N5Lk5aRdSYsLpPtoLw9VhB4HQgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25ETTK2DP
 ZtxhTxHSRDyZRZdMF0tNNEUsuS5r2PgegNHpwfAzUYwyzeKl1EguFT3C/LXZ9iLSMN9jkue4
 GXc8AzRPBYeM9COzCufxViljOTPgCDTVZobEfuz8fsCqFee3HAJARsaE16yu+Cki1WWUshab
 UcT/0IGsqwa5EGtCN7nUHWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcUbzE30
 l6Cn/vyGCdi9raSTBq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kOYgnnF4g5VvTv15usRG+2k
 2viQDUCa6s7n5Vb3KOd93H7oje8mLnxFi4w7yXZdzfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8B5r2zFxpK1QWxHDNiSzm9NO91MRzLma
 VS7Veh5tM4KZyvCgUOajuuM5yUWIUrISYuNuhP8NIMmjn1NmOmvpXAGiam4hTCFraTUuftjU
 ap3iO71ZZrgNYxpzSCtW8AW2qIxyyY1yAv7HM6gkUn5gOXOOSHKFt/p1WdiiMhgvctoRy2Po
 75i2zaikU0DAIUSnAGLmWLsEbz6BSdiXs2nwyCmXuWCPhBnCAkc5wz5mtscl3het/0NzI/gp
 yjlMmcBkQaXrSCXeG2iNyE4AJuyDMkXkJ7OFXF1Vbpe8yN4OtjHAWZ2X8ZfQITLA8Q/l6MpF
 KdcJJ3bahmNIxyekwkggVDGhNQKXHyWacimZEJJuRAzIMxtQRLn4Njhcle9/SUCFHPv58A/v
 6ehxkXQRp9aH1ZuC8PfafSOyVKtvCdCxLIuDhWQetQDKl/x9IVKKjDqiqNlKc87NhielCCR0
 BybAElEqLCV8ZM16tTAmYuNs5ytT7llBkNfEmSCteS2OCDW83CN24hFVOrULznRWHmtoPepZ
 PlPzuG6O/oCxQ4Yv415Grdt7KQ/+9qw+OMKklU6RC3GNg35BKlhL3+K2dh0mpdMnrIJ6xGrX
 k+v+8VBPenbMs3SD1NMdhEuaf6O1K9Il2CKv+g1Okjz+AR+4KGDDRdJJxCJhSFQcOl1PYciz
 btzscIa8VXi2B8jM9LAhSFI7WWcaHcHVvx/5J0dBYbqjCsty01DPsOAWnOnvsnXZoUeKFQuL
 x+VmLHG1uZVyUf1enYuEWTAgLhGjpMUtREWlFIPKjxlQDYeaiPbCPGJzQkKcw==
IronPort-HdrOrdr: A9a23:UZfBy6tgzqn1yTZt2rYmbeu67skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,226,1631592000"; 
   d="scan'208";a="59593529"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 2/5] xen/domain: Improve pirq handling
Date: Thu, 11 Nov 2021 17:57:37 +0000
Message-ID: <20211111175740.23480-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211111175740.23480-1-andrew.cooper3@citrix.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

free_pirq_struct() has no external users, so shouldn't be exposed.  Making it
static necessitates moving the function as domain_destroy() uses it.

Rework pirq_get_info() to have easier-to-follow logic.  The one functional
change is to the insertion failure path; we should not be using a full
call_rcu() chain to free an otherwise local structure we failed to insert into
the radix tree to begin with.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/common/domain.c      | 62 ++++++++++++++++++++++++++----------------------
 xen/include/xen/domain.h |  1 -
 2 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 562872cdf87a..a53dd114d5ba 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -365,6 +365,39 @@ static int __init parse_extra_guest_irqs(const char *s)
 }
 custom_param("extra_guest_irqs", parse_extra_guest_irqs);
 
+static void _free_pirq_struct(struct rcu_head *head)
+{
+    xfree(container_of(head, struct pirq, rcu_head));
+}
+
+static void free_pirq_struct(void *ptr)
+{
+    struct pirq *pirq = ptr;
+
+    call_rcu(&pirq->rcu_head, _free_pirq_struct);
+}
+
+struct pirq *pirq_get_info(struct domain *d, int pirq)
+{
+    struct pirq *info = pirq_info(d, pirq);
+
+    if ( likely(info) )
+        return info;
+
+    info = alloc_pirq_struct(d);
+    if ( unlikely(!info) )
+        return NULL;
+
+    info->pirq = pirq;
+    if ( likely(radix_tree_insert(&d->pirq_tree, pirq, info) == 0) )
+        return info; /* Success. */
+
+    /* Don't use call_rcu() to free a struct we failed to insert. */
+    _free_pirq_struct(&info->rcu_head);
+
+    return NULL;
+}
+
 /*
  * Release resources held by a domain.  There may or may not be live
  * references to the domain, and it may or may not be fully constructed.
@@ -1789,35 +1822,6 @@ long do_vm_assist(unsigned int cmd, unsigned int type)
 }
 #endif
 
-struct pirq *pirq_get_info(struct domain *d, int pirq)
-{
-    struct pirq *info = pirq_info(d, pirq);
-
-    if ( !info && (info = alloc_pirq_struct(d)) != NULL )
-    {
-        info->pirq = pirq;
-        if ( radix_tree_insert(&d->pirq_tree, pirq, info) )
-        {
-            free_pirq_struct(info);
-            info = NULL;
-        }
-    }
-
-    return info;
-}
-
-static void _free_pirq_struct(struct rcu_head *head)
-{
-    xfree(container_of(head, struct pirq, rcu_head));
-}
-
-void free_pirq_struct(void *ptr)
-{
-    struct pirq *pirq = ptr;
-
-    call_rcu(&pirq->rcu_head, _free_pirq_struct);
-}
-
 struct migrate_info {
     long (*func)(void *data);
     void *data;
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 160c8dbdab33..b4d202fda9fd 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -44,7 +44,6 @@ void free_vcpu_struct(struct vcpu *v);
 #ifndef alloc_pirq_struct
 struct pirq *alloc_pirq_struct(struct domain *);
 #endif
-void free_pirq_struct(void *);
 
 /*
  * Initialise/destroy arch-specific details of a VCPU.
-- 
2.11.0


