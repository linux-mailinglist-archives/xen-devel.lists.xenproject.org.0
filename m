Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898431C6D12
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 11:37:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWGUA-0007aw-Eu; Wed, 06 May 2020 09:37:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cKFb=6U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWGU8-0007aq-Se
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 09:37:00 +0000
X-Inumbo-ID: 2150d66e-8f7d-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2150d66e-8f7d-11ea-b07b-bc764e2007e4;
 Wed, 06 May 2020 09:36:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26DD8AC4A;
 Wed,  6 May 2020 09:37:00 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: fix build with CONFIG_DTB_FILE set
Message-ID: <f4c6b07e-c5de-ba75-c1ce-1475939f10af@suse.com>
Date: Wed, 6 May 2020 11:36:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Recent changes no longer allow modification of AFLAGS. The needed
conversion was apparently missed in 2740d96efdd3 ("xen/build: have the
root Makefile generates the CFLAGS").

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -68,7 +68,7 @@ extra-y += $(TARGET_SUBARCH)/head.o
 
 ifdef CONFIG_DTB_FILE
 obj-y += dtb.o
-AFLAGS += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
+AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
 endif
 
 ALL_OBJS := $(TARGET_SUBARCH)/head.o $(ALL_OBJS)

