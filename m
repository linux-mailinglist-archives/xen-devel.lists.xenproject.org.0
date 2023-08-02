Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613CB76D2C0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 17:48:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575068.900810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRE4A-0006nd-QE; Wed, 02 Aug 2023 15:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575068.900810; Wed, 02 Aug 2023 15:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRE4A-0006lz-NI; Wed, 02 Aug 2023 15:47:14 +0000
Received: by outflank-mailman (input) for mailman id 575068;
 Wed, 02 Aug 2023 15:47:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRE48-0006lt-KO
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 15:47:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRE48-0005Xa-DM; Wed, 02 Aug 2023 15:47:12 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRE48-0005q5-55; Wed, 02 Aug 2023 15:47:12 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=JcRcT5GsB9W1AnjvjW1VWtnJX4Dzo7/Z8y9C0RNk4CA=; b=GqoNAt
	m7w1BaISQjHmf1TIoeMOiIiF4hfOF2XzJYsoBcPgnxEjZ+fUhpyHtUtL/ZQ5/wLZpNPGX/BEFvPZf
	WgdL2eHskh7xkTZ4lF+v0dwGHIK/NIkCwXPi2suzx6iKDdusnK7lX0vedQKcjzmYZTnqORxTHd/lf
	eR/1yYS4CsE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/x86: Constify the vCPU parameter for expand_xsave_states()
Date: Wed,  2 Aug 2023 16:47:05 +0100
Message-Id: <20230802154705.84530-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

expand_xsave_states() is not meant to modify the vCPU. So the parameter
can be const.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/x86/include/asm/xstate.h | 2 +-
 xen/arch/x86/xstate.c             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 7ab0bdde89cf..c08c267884f0 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -100,7 +100,7 @@ int __must_check validate_xstate(const struct domain *d,
                                  uint64_t xcr0, uint64_t xcr0_accum,
                                  const struct xsave_hdr *hdr);
 int __must_check handle_xsetbv(u32 index, u64 new_bv);
-void expand_xsave_states(struct vcpu *v, void *dest, unsigned int size);
+void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size);
 void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size);
 
 /* extended state init and cleanup functions */
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 92496f379546..3d566252eaa2 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -172,7 +172,7 @@ static void setup_xstate_comp(uint16_t *comp_offsets,
  * It is the callers responsibility to ensure that there is xsave state to
  * serialise, and that the provided buffer is exactly the right size.
  */
-void expand_xsave_states(struct vcpu *v, void *dest, unsigned int size)
+void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
 {
     const struct xsave_struct *xsave = v->arch.xsave_area;
     const void *src;
-- 
2.40.1


