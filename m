Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159FC2611AA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 14:53:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFd80-0003eL-VR; Tue, 08 Sep 2020 12:53:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFd80-0003eG-5H
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 12:53:40 +0000
X-Inumbo-ID: ddc4bc27-f836-49e9-af12-4f63d1fb8455
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddc4bc27-f836-49e9-af12-4f63d1fb8455;
 Tue, 08 Sep 2020 12:53:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 669B3AC8B;
 Tue,  8 Sep 2020 12:53:39 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm64: fix build with gcc 10
Message-ID: <4c3c3f21-29bf-268c-039e-5adecff05f3a@suse.com>
Date: Tue, 8 Sep 2020 14:53:38 +0200
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

With gcc10 inlining is (no longer?) the default for certain atomics.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -12,6 +12,7 @@ CFLAGS-$(CONFIG_ARM_32) += -mcpu=cortex-
 
 CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
 CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
+$(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
 
 ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
     $(error You must use 'make menuconfig' to enable/disable early printk now)

