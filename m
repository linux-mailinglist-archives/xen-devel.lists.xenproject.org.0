Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8461BF606
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 13:01:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU6w6-0001SY-Si; Thu, 30 Apr 2020 11:00:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ng0l=6O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jU6w4-0001ST-OK
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 11:00:56 +0000
X-Inumbo-ID: dd608c24-8ad1-11ea-9a22-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd608c24-8ad1-11ea-9a22-12813bfff9fa;
 Thu, 30 Apr 2020 11:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/JuMaoQK3/yKKWTgd5NYymon2SfOLFfbIdK1YvAE+to=; b=eSbXiFiq9/lU7eQee3VMboUyF1
 KH5BVzNaUwdCRQglwrjq3AsZ9XXhO8BW6CEwcE7lriPfoS3HrGwtu+5AQulIEtD0cChP7tJ8yvuGs
 qoS3tEc+v8dV7aSeLGDsxbCNXBS3R2qb0Hp1lReCvAbpkZlx9jBorvvGeEA4FKQceMHk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jU6w3-0000ut-4c; Thu, 30 Apr 2020 11:00:55 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jU6w2-0002r0-On; Thu, 30 Apr 2020 11:00:54 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] tools/xl: vcpu-pin: Skip global affinity when the hard
 affinity is not changed
Date: Thu, 30 Apr 2020 12:00:51 +0100
Message-Id: <20200430110051.8965-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

After XSA-273, it is not possible to modify the vCPU soft affinity using
xl vcpu-pin without modifying the hard affinity. Instead the command
will crash.

42sh> gdb /usr/local/sbin/xl
(gdb) r vcpu-pin 0 0 - 10
[...]
Program received signal SIGSEGV, Segmentation fault.
[...]
(gdb) bt

This is happening because 'xl' will use NULL when an affinity doesn't
need to be modified. However, we will still try to apply the global
affinity in the this case.

As the hard affinity is not changed, then we don't need to apply the
global affinity. So skip it when hard is NULL.

Backport: 4.6+ # Any release with XSA-273
Fixes: aa67b97ed342 ("xl.conf: Add global affinity masks")
Reported-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xl/xl_vcpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xl/xl_vcpu.c b/tools/xl/xl_vcpu.c
index 9ff5354f749b..66877a57dee4 100644
--- a/tools/xl/xl_vcpu.c
+++ b/tools/xl/xl_vcpu.c
@@ -283,7 +283,7 @@ int main_vcpupin(int argc, char **argv)
     }
 
     /* Only hard affinity matters here */
-    if (!ignore_masks) {
+    if (!ignore_masks && hard) {
         libxl_dominfo dominfo;
 
         if (libxl_domain_info(ctx, &dominfo, domid)) {
-- 
2.17.1


