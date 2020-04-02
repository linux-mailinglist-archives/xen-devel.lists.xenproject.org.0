Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E266119BD0C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 09:50:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJuYs-00048J-9x; Thu, 02 Apr 2020 07:46:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJuYq-00047D-VB
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 07:46:48 +0000
X-Inumbo-ID: 1ac6ebe4-74b6-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ac6ebe4-74b6-11ea-9e09-bc764e2007e4;
 Thu, 02 Apr 2020 07:46:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44937AE39;
 Thu,  2 Apr 2020 07:46:46 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: expose VM assist hypercall
Message-ID: <cb4a6f8f-eda8-f17c-54e5-af1353d6358c@suse.com>
Date: Thu, 2 Apr 2020 09:46:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In preparation for the addition of VMASST_TYPE_runstate_update_flag
commit 72c538cca957 ("arm: add support for vm_assist hypercall") enabled
the hypercall for Arm. I consider it not logical that it then isn't also
exposed to x86 HVM guests (with the same single feature permitted to be
enabled as Arm has); Linux actually tries to use it afaict.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -78,6 +78,11 @@ static long hvm_grant_table_op(
 }
 #endif
 
+static long hvm_vm_assist(unsigned int cmd, unsigned int type)
+{
+    return vm_assist(current->domain, cmd, type, HVM_VM_ASSIST_VALID);
+}
+
 static long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     const struct vcpu *curr = current;
@@ -128,6 +133,7 @@ static const hypercall_table_t hvm_hyper
 #ifdef CONFIG_GRANT_TABLE
     HVM_CALL(grant_table_op),
 #endif
+    HVM_CALL(vm_assist),
     COMPAT_CALL(vcpu_op),
     HVM_CALL(physdev_op),
     COMPAT_CALL(xen_version),
--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -319,6 +319,7 @@ extern unsigned long xen_phys_start;
 #define VM_ASSIST_VALID          NATIVE_VM_ASSIST_VALID
 #define COMPAT_VM_ASSIST_VALID   (NATIVE_VM_ASSIST_VALID & \
                                   ((1UL << COMPAT_BITS_PER_LONG) - 1))
+#define HVM_VM_ASSIST_VALID      (1UL << VMASST_TYPE_runstate_update_flag)
 
 #define ELFSIZE 64
 

