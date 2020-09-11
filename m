Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E61C0265E54
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 12:45:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGgYe-00049F-RA; Fri, 11 Sep 2020 10:45:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eh3a=CU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGgYd-00049A-Jd
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 10:45:31 +0000
X-Inumbo-ID: f0976dea-adb7-424f-9d27-864a10b891f7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0976dea-adb7-424f-9d27-864a10b891f7;
 Fri, 11 Sep 2020 10:45:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA0E5B32E;
 Fri, 11 Sep 2020 10:45:45 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] Arm64: force gcc 10+ to always inline generic atomics
 helpers
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <0ad3619d-8be9-99bc-552f-675156c47dfe@suse.com>
Date: Fri, 11 Sep 2020 12:45:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Recent versions of gcc (at least 10.x) will not inline generic atomics 
helpers by default. Instead they will expect the software to either link
with libatomic.so or implement the helpers, which would result in

undefined reference to `__aarch64_ldadd4_acq_rel'

for us (not having any local implementation).

To keep the previous behavior, force gcc to always inline the generic
atomics helpers.

Long term we probably want to avoid relying on gcc atomics helpers as
this doesn't allow us to switch between LSE and LL/SC atomics.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Title and description redone.

--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -12,6 +12,7 @@ CFLAGS-$(CONFIG_ARM_32) += -mcpu=cortex-
 
 CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
 CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
+$(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
 
 ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
     $(error You must use 'make menuconfig' to enable/disable early printk now)

