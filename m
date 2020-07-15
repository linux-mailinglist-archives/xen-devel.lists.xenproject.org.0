Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23969220A36
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:39:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveoe-0001CJ-A4; Wed, 15 Jul 2020 10:39:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jveoc-0001CA-Eb
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:39:06 +0000
X-Inumbo-ID: 67d5a574-c687-11ea-93b5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67d5a574-c687-11ea-93b5-12813bfff9fa;
 Wed, 15 Jul 2020 10:39:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 322B1B1F7;
 Wed, 15 Jul 2020 10:39:08 +0000 (UTC)
Subject: [PATCH 4/8] Arm: prune #include-s needed by domain.h
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
Message-ID: <150525bb-1c48-c331-3212-eff18bc4c13d@suse.com>
Date: Wed, 15 Jul 2020 12:39:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
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
Cc: Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

asm/domain.h is a dependency of xen/sched.h, and hence should not itself
include xen/sched.h. Nor should any of the other #include-s used by it.
While at it, also drop two other #include-s that aren't needed by this
particular header.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -2,7 +2,7 @@
 #define __ASM_DOMAIN_H__
 
 #include <xen/cache.h>
-#include <xen/sched.h>
+#include <xen/timer.h>
 #include <asm/page.h>
 #include <asm/p2m.h>
 #include <asm/vfp.h>
@@ -11,8 +11,6 @@
 #include <asm/vgic.h>
 #include <asm/vpl011.h>
 #include <public/hvm/params.h>
-#include <xen/serial.h>
-#include <xen/rbtree.h>
 
 struct hvm_domain
 {
--- a/xen/include/asm-arm/vfp.h
+++ b/xen/include/asm-arm/vfp.h
@@ -1,7 +1,7 @@
 #ifndef _ASM_VFP_H
 #define _ASM_VFP_H
 
-#include <xen/sched.h>
+struct vcpu;
 
 #if defined(CONFIG_ARM_32)
 # include <asm/arm32/vfp.h>


