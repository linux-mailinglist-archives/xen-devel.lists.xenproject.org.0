Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09DF5126D2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 01:03:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315614.534467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqgx-0008SZ-I6; Wed, 27 Apr 2022 23:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315614.534467; Wed, 27 Apr 2022 23:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqgv-0007yl-K8; Wed, 27 Apr 2022 23:03:25 +0000
Received: by outflank-mailman (input) for mailman id 315614;
 Wed, 27 Apr 2022 22:58:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mIOA=VF=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1njqbr-000483-RS
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 22:58:11 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82680692-c67d-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 00:58:11 +0200 (CEST)
Received: from [179.113.53.197] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njqbZ-0002Uv-Ai; Thu, 28 Apr 2022 00:57:53 +0200
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
X-Inumbo-ID: 82680692-c67d-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jupyQNOg8qT8hQfxmdiNJNMjaTUz/u9LiRmSHTNez6Y=; b=p7drin3mWpI9T0ZfMOO6eJj4J8
	Szpgonvq7i/v524yc5jBLpbigKUiUN0wy7/WDOnlytx03+FGgGN1Adqusl4cOO6PJlw+seakKl4N4
	fX95EDE8pbxBc/NNWRr732wIqJtKKX/BphsJRWnwXH/62I6x/BTA0R4L8cWEa/lku3Ma0ky8B2K89
	MQrzxBf2Hm8tnWC5d0fBkJ7uMzqRE/yfr9AAId6oRoN4APimw2mDpSMEi6ZVrVuwLoacCVsSTBNQz
	KQprHSNi9G6RdCXwUMjprlLz6QcEgqvhkAE50juvJF1BOQucBso5epBizOEqf+g5ZQam3KuAFn9x9
	BasVHnnQ==;
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: akpm@linux-foundation.org,
	bhe@redhat.com,
	pmladek@suse.com,
	kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	coresight@lists.linaro.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-xtensa@linux-xtensa.org,
	netdev@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	rcu@vger.kernel.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org,
	kernel-dev@igalia.com,
	gpiccoli@igalia.com,
	kernel@gpiccoli.net,
	halves@canonical.com,
	fabiomirmar@gmail.com,
	alejandro.j.jimenez@oracle.com,
	andriy.shevchenko@linux.intel.com,
	arnd@arndb.de,
	bp@alien8.de,
	corbet@lwn.net,
	d.hatayama@jp.fujitsu.com,
	dave.hansen@linux.intel.com,
	dyoung@redhat.com,
	feng.tang@intel.com,
	gregkh@linuxfoundation.org,
	mikelley@microsoft.com,
	hidehiro.kawai.ez@hitachi.com,
	jgross@suse.com,
	john.ogness@linutronix.de,
	keescook@chromium.org,
	luto@kernel.org,
	mhiramat@kernel.org,
	mingo@redhat.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	stern@rowland.harvard.edu,
	tglx@linutronix.de,
	vgoyal@redhat.com,
	vkuznets@redhat.com,
	will@kernel.org
Subject: [PATCH 28/30] panic: Unexport crash_kexec_post_notifiers
Date: Wed, 27 Apr 2022 19:49:22 -0300
Message-Id: <20220427224924.592546-29-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427224924.592546-1-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no users anymore of this variable that requires
it to be "exported" in the headers; also, it was deprecated
by the kernel parameter "panic_notifiers_level".

Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 include/linux/panic.h          | 2 --
 include/linux/panic_notifier.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/include/linux/panic.h b/include/linux/panic.h
index 34175d0188d0..d301db07a8af 100644
--- a/include/linux/panic.h
+++ b/include/linux/panic.h
@@ -34,8 +34,6 @@ extern int sysctl_panic_on_rcu_stall;
 extern int sysctl_max_rcu_stall_to_panic;
 extern int sysctl_panic_on_stackoverflow;
 
-extern bool crash_kexec_post_notifiers;
-
 /*
  * panic_cpu is used for synchronizing panic() and crash_kexec() execution. It
  * holds a CPU number which is executing panic() currently. A value of
diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
index b5041132321d..8fda7045e2f7 100644
--- a/include/linux/panic_notifier.h
+++ b/include/linux/panic_notifier.h
@@ -11,7 +11,6 @@ extern struct atomic_notifier_head panic_pre_reboot_list;
 extern struct atomic_notifier_head panic_post_reboot_list;
 
 bool panic_notifiers_before_kdump(void);
-extern bool crash_kexec_post_notifiers;
 
 enum panic_notifier_val {
 	PANIC_UNUSED,
-- 
2.36.0


