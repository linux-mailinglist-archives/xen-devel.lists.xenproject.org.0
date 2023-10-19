Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B557CFE53
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 17:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619428.964563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtV90-00023H-V2; Thu, 19 Oct 2023 15:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619428.964563; Thu, 19 Oct 2023 15:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtV90-0001nr-EB; Thu, 19 Oct 2023 15:41:06 +0000
Received: by outflank-mailman (input) for mailman id 619428;
 Thu, 19 Oct 2023 15:41:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+UH=GB=desiato.srs.infradead.org=BATV+298c059cf2aa39b7dc34+7361+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qtV8w-0006dc-6k
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 15:41:02 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6311328-6e95-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 17:40:58 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qtV8M-009yCm-2X; Thu, 19 Oct 2023 15:40:27 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qtV8M-000Pu2-04; Thu, 19 Oct 2023 16:40:26 +0100
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
X-Inumbo-ID: e6311328-6e95-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=I94165DVF5UqmBmDscBFuMqRd0gjhG/yUz/GC+u3DZo=; b=b27pRvnBGhO8GBTyfkDGo1zlxb
	TSesogQRQ2g+1BMqrLQKVS9a1UqGgeO/k1J331Y59qHD6EVut4zvVV0M1qgLrVRf/A+ir9G1MTQIF
	+0LXsZFDA3t1dM3upyUzwFNy8/FI5lxM+jDPhgc6FHQ22juT+DVHJ5pgPyGW8jgeW4rYxJpx3mDrp
	tUF1mVG428hFe9nSdcOJQqPLzDalaf0abHj0KqsdEIjy9c4f5HO701r8YI3m544Pe0l7kkTTLJf/o
	E74nIaxdkPhY7DJpjUTycGAcq0iMv+uHDvW6J9oEfLAz0orGmRTHzAcAbZuMvJ1c2hkl8UCHuriwd
	2+mw3Qig==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Bernhard Beschow <shentey@gmail.com>,
	Joel Upham <jupham125@gmail.com>
Subject: [PATCH v2 06/24] i386/xen: Ignore VCPU_SSHOTTMR_future flag in set_singleshot_timer()
Date: Thu, 19 Oct 2023 16:40:02 +0100
Message-Id: <20231019154020.99080-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019154020.99080-1-dwmw2@infradead.org>
References: <20231019154020.99080-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Upstream Xen now ignores this flag¹, since the only guest kernel ever to
use it was buggy.

¹ https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=19c6cbd909

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 3ba636b09a..477e93cd92 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -1076,17 +1076,13 @@ static int vcpuop_stop_periodic_timer(CPUState *target)
  * Must always be called with xen_timers_lock held.
  */
 static int do_set_singleshot_timer(CPUState *cs, uint64_t timeout_abs,
-                                   bool future, bool linux_wa)
+                                   bool linux_wa)
 {
     CPUX86State *env = &X86_CPU(cs)->env;
     int64_t now = kvm_get_current_ns();
     int64_t qemu_now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     int64_t delta = timeout_abs - now;
 
-    if (future && timeout_abs < now) {
-        return -ETIME;
-    }
-
     if (linux_wa && unlikely((int64_t)timeout_abs < 0 ||
                              (delta > 0 && (uint32_t)(delta >> 50) != 0))) {
         /*
@@ -1128,9 +1124,13 @@ static int vcpuop_set_singleshot_timer(CPUState *cs, uint64_t arg)
     }
 
     QEMU_LOCK_GUARD(&X86_CPU(cs)->env.xen_timers_lock);
-    return do_set_singleshot_timer(cs, sst.timeout_abs_ns,
-                                   !!(sst.flags & VCPU_SSHOTTMR_future),
-                                   false);
+
+    /*
+     * We ignore the VCPU_SSHOTTMR_future flag, just as Xen now does.
+     * The only guest that ever used it, got it wrong.
+     * https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=19c6cbd909
+     */
+    return do_set_singleshot_timer(cs, sst.timeout_abs_ns, false);
 }
 
 static int vcpuop_stop_singleshot_timer(CPUState *cs)
@@ -1155,7 +1155,7 @@ static bool kvm_xen_hcall_set_timer_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         err = vcpuop_stop_singleshot_timer(CPU(cpu));
     } else {
         QEMU_LOCK_GUARD(&X86_CPU(cpu)->env.xen_timers_lock);
-        err = do_set_singleshot_timer(CPU(cpu), timeout, false, true);
+        err = do_set_singleshot_timer(CPU(cpu), timeout, true);
     }
     exit->u.hcall.result = err;
     return true;
@@ -1843,7 +1843,7 @@ int kvm_put_xen_state(CPUState *cs)
         QEMU_LOCK_GUARD(&env->xen_timers_lock);
         if (env->xen_singleshot_timer_ns) {
             ret = do_set_singleshot_timer(cs, env->xen_singleshot_timer_ns,
-                                    false, false);
+                                          false);
             if (ret < 0) {
                 return ret;
             }
-- 
2.40.1


