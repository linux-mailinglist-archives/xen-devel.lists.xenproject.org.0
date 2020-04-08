Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4921A1B48
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 07:06:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM2ua-0003Eg-QW; Wed, 08 Apr 2020 05:06:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sdaI=5Y=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1jM2uZ-0003Cn-53
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 05:06:03 +0000
X-Inumbo-ID: 94cf9aae-7956-11ea-81bb-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94cf9aae-7956-11ea-81bb-12813bfff9fa;
 Wed, 08 Apr 2020 05:05:36 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 038553d4013457;
 Wed, 8 Apr 2020 05:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=RT2DLUiFIblGAhj2vsdXWMs47UzEg77Wx4rwQqNvIys=;
 b=vt9sy4IT0ona61EF6lrQB6+fOd4n1UUP16sabHo45o2Fj3qC6LzIzwKRjy/UGHKp6UtX
 qFSd5YSVzautGXeCr2eAJwfIK/iGXCJNeAxcoDO3I7m5gSP91p4n0pb5kTTgdsi0yjOx
 qo22FkosRIApaeM6Fz6ilxR/dtoXxhOalPa8lPluAeNfJBYl4kG5bLmjOE/87zZNyJBJ
 gyT8RCVnfUfcfVutEDgu5tGajHjyK4ZwDhUOdnggz0MB/ArZELsxKKhJSr8EvqA/iPGM
 LytegfsDsU5SPuZ1H7lB9GSPk4DwMfVvQ5OLU8BwvFvA+C8d07oHuaLcCOsQnaN6BFRD jw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 3091m390y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Apr 2020 05:05:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03853M4I159232;
 Wed, 8 Apr 2020 05:05:28 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 3091m01g4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Apr 2020 05:05:27 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03855QOv007470;
 Wed, 8 Apr 2020 05:05:26 GMT
Received: from monad.ca.oracle.com (/10.156.75.81)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 07 Apr 2020 22:05:26 -0700
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [RFC PATCH 20/26] x86/paravirt: Enable pv-spinlocks in runtime_patch()
Date: Tue,  7 Apr 2020 22:03:17 -0700
Message-Id: <20200408050323.4237-21-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408050323.4237-1-ankur.a.arora@oracle.com>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9584
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080037
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9584
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080037
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 peterz@infradead.org, hpa@zytor.com, Ankur Arora <ankur.a.arora@oracle.com>,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 namit@vmware.com, mhiramat@kernel.org, jpoimboe@redhat.com,
 mihai.carabas@oracle.com, bp@alien8.de, vkuznets@redhat.com,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Enable runtime patching of paravirt spinlocks. These can be trivially
enabled because pv_lock_ops are never preemptible -- preemption is
disabled at entry to spin_lock*().

Note that a particular CPU instance might get preempted in the host but
because runtime_patching() is called via stop_machine(), the migration
thread would flush out any kernel threads preempted in the host.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/x86/include/asm/paravirt.h  | 10 +++++-----
 arch/x86/kernel/paravirt_patch.c | 12 ++++++++++++
 kernel/locking/lock_events.c     |  2 +-
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 694d8daf4983..cb3d0a91c060 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -642,27 +642,27 @@ static inline void __set_fixmap(unsigned /* enum fixed_addresses */ idx,
 static __always_inline void pv_queued_spin_lock_slowpath(struct qspinlock *lock,
 							u32 val)
 {
-	PVOP_VCALL2(lock.queued_spin_lock_slowpath, lock, val);
+	PVRTOP_VCALL2(lock.queued_spin_lock_slowpath, lock, val);
 }
 
 static __always_inline void pv_queued_spin_unlock(struct qspinlock *lock)
 {
-	PVOP_VCALLEE1(lock.queued_spin_unlock, lock);
+	PVRTOP_VCALLEE1(lock.queued_spin_unlock, lock);
 }
 
 static __always_inline void pv_wait(u8 *ptr, u8 val)
 {
-	PVOP_VCALL2(lock.wait, ptr, val);
+	PVRTOP_VCALL2(lock.wait, ptr, val);
 }
 
 static __always_inline void pv_kick(int cpu)
 {
-	PVOP_VCALL1(lock.kick, cpu);
+	PVRTOP_VCALL1(lock.kick, cpu);
 }
 
 static __always_inline bool pv_vcpu_is_preempted(long cpu)
 {
-	return PVOP_CALLEE1(bool, lock.vcpu_is_preempted, cpu);
+	return PVRTOP_CALLEE1(bool, lock.vcpu_is_preempted, cpu);
 }
 
 void __raw_callee_save___native_queued_spin_unlock(struct qspinlock *lock);
diff --git a/arch/x86/kernel/paravirt_patch.c b/arch/x86/kernel/paravirt_patch.c
index 3eb8c0e720b4..3f8606f2811c 100644
--- a/arch/x86/kernel/paravirt_patch.c
+++ b/arch/x86/kernel/paravirt_patch.c
@@ -152,6 +152,18 @@ int runtime_patch(u8 type, void *insn_buff, void *op,
 
 	/* Nothing whitelisted for now. */
 	switch (type) {
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+	/*
+	 * Preemption is always disabled in the lifetime of a spinlock
+	 * (whether held or while waiting to acquire.)
+	 */
+	case PARAVIRT_PATCH(lock.queued_spin_lock_slowpath):
+	case PARAVIRT_PATCH(lock.queued_spin_unlock):
+	case PARAVIRT_PATCH(lock.wait):
+	case PARAVIRT_PATCH(lock.kick):
+	case PARAVIRT_PATCH(lock.vcpu_is_preempted):
+		break;
+#endif
 	default:
 		pr_warn("type=%d unsuitable for runtime-patching\n", type);
 		return -EINVAL;
diff --git a/kernel/locking/lock_events.c b/kernel/locking/lock_events.c
index fa2c2f951c6b..c3057e82e6f9 100644
--- a/kernel/locking/lock_events.c
+++ b/kernel/locking/lock_events.c
@@ -115,7 +115,7 @@ static const struct file_operations fops_lockevent = {
 	.llseek = default_llseek,
 };
 
-#ifdef CONFIG_PARAVIRT_SPINLOCKS
+#if defined(CONFIG_PARAVIRT_SPINLOCKS) && !defined(CONFIG_PARAVIRT_RUNTIME)
 #include <asm/paravirt.h>
 
 static bool __init skip_lockevent(const char *name)
-- 
2.20.1


