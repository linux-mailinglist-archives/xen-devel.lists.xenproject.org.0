Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76842A9013
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 08:13:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20419.46334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kavvm-0003i5-Uk; Fri, 06 Nov 2020 07:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20419.46334; Fri, 06 Nov 2020 07:13:06 +0000
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
	id 1kavvm-0003he-R8; Fri, 06 Nov 2020 07:13:06 +0000
Received: by outflank-mailman (input) for mailman id 20419;
 Fri, 06 Nov 2020 07:13:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kavvm-0003hX-4y
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 07:13:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80ae3e2c-ba3c-49af-8f54-8a979441a74d;
 Fri, 06 Nov 2020 07:13:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1478FAB8F;
 Fri,  6 Nov 2020 07:13:04 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kavvm-0003hX-4y
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 07:13:06 +0000
X-Inumbo-ID: 80ae3e2c-ba3c-49af-8f54-8a979441a74d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 80ae3e2c-ba3c-49af-8f54-8a979441a74d;
	Fri, 06 Nov 2020 07:13:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604646784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CX7ycSIbHLxk9/beplw9uWXkdYfiG5DPYy83G5AM4JE=;
	b=iRU34nysslf1hYkQBtScKr6egff/SrZ4L7JDeamifCy9dju6eJ2RFuprHn9Xq1hsIfQCPE
	wIVLXZECJYfMgJfTqeKXyUF4KSWdBCHQmoGopXBoM9mRtN66XtB2wmBKHfG5stXPzQKg7M
	E9VF4tBdLe5eM2K3wYo+evZZCbzxPPU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1478FAB8F;
	Fri,  6 Nov 2020 07:13:04 +0000 (UTC)
Subject: [PATCH 2/3] x86/xstate: use xvzalloc() for save area allocation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e0364274-f123-82bd-ec85-bea519a34049@suse.com>
Message-ID: <c2aabb49-23a8-fe87-058d-d5e802ea7ba2@suse.com>
Date: Fri, 6 Nov 2020 08:13:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e0364274-f123-82bd-ec85-bea519a34049@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is in preparation for the area size exceeding a page's worth of
space, as will happen with AMX as well as Architectural LBR.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -8,6 +8,7 @@
 #include <xen/param.h>
 #include <xen/percpu.h>
 #include <xen/sched.h>
+#include <xen/xvmalloc.h>
 #include <asm/current.h>
 #include <asm/processor.h>
 #include <asm/hvm/support.h>
@@ -522,7 +523,7 @@ int xstate_alloc_save_area(struct vcpu *
 
     /* XSAVE/XRSTOR requires the save area be 64-byte-boundary aligned. */
     BUILD_BUG_ON(__alignof(*save_area) < 64);
-    save_area = _xzalloc(size, __alignof(*save_area));
+    save_area = _xvzalloc(size, __alignof(*save_area));
     if ( save_area == NULL )
         return -ENOMEM;
 
@@ -543,8 +544,7 @@ int xstate_alloc_save_area(struct vcpu *
 
 void xstate_free_save_area(struct vcpu *v)
 {
-    xfree(v->arch.xsave_area);
-    v->arch.xsave_area = NULL;
+    XVFREE(v->arch.xsave_area);
 }
 
 static unsigned int _xstate_ctxt_size(u64 xcr0)

