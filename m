Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955A2AF159
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 13:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24734.52120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcpi8-0007Cl-4a; Wed, 11 Nov 2020 12:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24734.52120; Wed, 11 Nov 2020 12:58:52 +0000
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
	id 1kcpi8-0007CP-1a; Wed, 11 Nov 2020 12:58:52 +0000
Received: by outflank-mailman (input) for mailman id 24734;
 Wed, 11 Nov 2020 12:58:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcpi6-0007CK-LN
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 12:58:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7dfe74a-8d03-4c8a-b641-e807418b4eee;
 Wed, 11 Nov 2020 12:58:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2B587ABDE;
 Wed, 11 Nov 2020 12:58:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcpi6-0007CK-LN
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 12:58:50 +0000
X-Inumbo-ID: c7dfe74a-8d03-4c8a-b641-e807418b4eee
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c7dfe74a-8d03-4c8a-b641-e807418b4eee;
	Wed, 11 Nov 2020 12:58:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605099529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zkk+pbEE53vnjmjtTGwel4X8ilqn/4qeogMt4MuCuV4=;
	b=i/VxFAHF4orPHRuLpY3tFUSidkNTj2DAdUHpwki28CmkWJyw6dTHeH5+SIwASZnPY5XVCW
	zsrnxLaizh0vzPftzTKTwdV3WXGdcUh+0Lj+HhQTweeP8TbVpDxPidvw3Fy9Xj8O5oQ7FF
	k1ks5iwwdpvuiq+I2AZ4uoFZ1mZnC4Q=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2B587ABDE;
	Wed, 11 Nov 2020 12:58:49 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/vpt: fix build with old gcc
Message-ID: <b345a4ed-dd6d-42a2-f114-6e6393640be5@suse.com>
Date: Wed, 11 Nov 2020 13:58:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I believe it was the XSA-336 fix (42fcdd42328f "x86/vpt: fix race when
migrating timers between vCPUs") which has unmasked a bogus
uninitialized variable warning. This is observable with gcc 4.3.4, but
only on 4.13 and older; it's hidden on newer versions apparently due to
the addition to _read_unlock() done by 12509bbeb9e3 ("rwlocks: call
preempt_disable() when taking a rwlock").

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course we could decide to only work around this on the older
branches. But I think it's better to have the fix everywhere (as long as
we still support such old gcc), as further changes may - effectively
randomly - unhide the warning again.

--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -401,7 +401,7 @@ int pt_update_irq(struct vcpu *v)
                  * associated with the timer.
                  */
                 time_cb *cb = NULL;
-                void *cb_priv;
+                void *cb_priv = NULL;
 
                 pt_vcpu_lock(v);
                 /* Make sure the timer is still on the list. */

