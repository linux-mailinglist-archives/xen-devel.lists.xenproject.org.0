Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA522CEA3C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 09:53:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44154.79183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6pn-0006PM-NF; Fri, 04 Dec 2020 08:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44154.79183; Fri, 04 Dec 2020 08:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6pn-0006OX-Hp; Fri, 04 Dec 2020 08:52:59 +0000
Received: by outflank-mailman (input) for mailman id 44154;
 Fri, 04 Dec 2020 08:52:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kl6pm-0006O4-M1
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 08:52:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kl6pm-00048r-7N; Fri, 04 Dec 2020 08:52:58 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kl6pl-00081O-VI; Fri, 04 Dec 2020 08:52:58 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=yaMWoBKVxWVw7Z8qM/NkeD5nD3ZYv/c7zC/niSnkkOE=; b=KshhxBEgHpzYHBUii9lBAMJfY+
	uN9Nd35uC5ZdIID9uZDKOL4oZgKvwqYteu6Y8J/99Ivr3tFqgAlVyXiXORzhYbSE19+4UEm03FbU8
	vomxFx4HeyWLe7ocO1mnaeUBwj8YP9aFC/0FsZxuKKgbAnyoXZp7yGSOpKmGT0a/+qcM=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 01/11] viridian: don't blindly write to 32-bit registers if 'mode' is invalid
Date: Fri,  4 Dec 2020 08:52:45 +0000
Message-Id: <20201204085255.26216-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201204085255.26216-1-paul@xen.org>
References: <20201204085255.26216-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

If hvm_guest_x86_mode() returns something other than 8 or 4 then
viridian_hypercall() will return immediately but, on the way out, will write
back status as if 'mode' was 4. This patch simply makes it leave the registers
alone.

NOTE: The formatting of the 'out' label and the switch statement are also
      adjusted as per CODING_STYLE.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v5:
 - Fixed yet another CODING_STYLE violation.

v4:
 - Fixed another CODING_STYLE violation.

v2:
 - New in v2
---
 xen/arch/x86/hvm/viridian/viridian.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index dc7183a54627..3dbb5c2d4cc1 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -692,13 +692,15 @@ int viridian_hypercall(struct cpu_user_regs *regs)
         break;
     }
 
-out:
+ out:
     output.result = status;
-    switch (mode) {
+    switch ( mode )
+    {
     case 8:
         regs->rax = output.raw;
         break;
-    default:
+
+    case 4:
         regs->rdx = output.raw >> 32;
         regs->rax = (uint32_t)output.raw;
         break;
-- 
2.20.1


