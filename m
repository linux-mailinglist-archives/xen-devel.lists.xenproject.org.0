Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B221D44DB60
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 18:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224834.388398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlEL0-00076z-Lw; Thu, 11 Nov 2021 17:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224834.388398; Thu, 11 Nov 2021 17:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlEL0-00072m-FV; Thu, 11 Nov 2021 17:58:14 +0000
Received: by outflank-mailman (input) for mailman id 224834;
 Thu, 11 Nov 2021 17:58:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOKj=P6=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mlEKx-00061G-Ut
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 17:58:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec20702c-4318-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 18:58:08 +0100 (CET)
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
X-Inumbo-ID: ec20702c-4318-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636653488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UseM21AlpwIdIYpcz0wWiPK9lJhAurz+UGmlCCgsSLI=;
  b=CiAIqznbOa0vgEDcQkNmkoDvyWKtpt7VCklZbsRTfzpan02CwbqrHgJP
   iQL+1b7hf4wSOh/HV5nqxM+vK3oJmoAeCPUQDzwoMTQfcygTS2/bLkuA1
   TiPS262EuSu0ppAP1dvJHSFGBfkTWAgxpaI1i6+MfXL4g1Saf969KbdOc
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: O5cljdHxD0EbVogHANza/oxZjDbxM4fy7LfQCYIAaijg10mYW5GmwoYevNWdMP4Lb5NlAmTh5v
 +BoL8Vl0CGrmcXuEx2/KbJXMYStmkkklS8FsWP/ytfi04rOl/o1wSpV+Ome5ihoG78RsMTtwsK
 nn8EOceEvF0+v7aS+noc+r/WQkh32KcMqgDMV6oaAPhTiW7KKCqB78kMDfkxMeea9JOMIDInh9
 zSGgczuzv+N1x1MdaAGSEprP6Kq/AEKcnGKBEDvQorhbn7fcqcmI3Yszq/Lb00nON0VfPm9KeW
 N5bkThVJcw8uNxMzNC84hyPT
X-SBRS: 5.1
X-MesageID: 57591434
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jD3AhaNdOhXLNBfvrR0GkMFynXyQoLVcMsEvi/4bfWQNrUoghTdRx
 mUeWWGOMvuJMGKhfY8lb462oR4PvsWBzNI2HAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Es6w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozuSpI5Jz
 t5IjsO9FwJ3LpLFsbtDWQYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWht15kSRqq2i
 8wxOB1vTCieekF1HFIyOdEuv/+KoXTwfGgNwL6SjfVuuDWCpOBr65DvLd7Ud9qiVchT2EGCq
 QruwWP9BR0LMc2F/hCM+Hmsm+znkDvyXcQZE7jQ3vRnmkGJz2ofThgfT0KmoOKRg1S7HdlYL
 iQ85S4GvaU0skuxQbHVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQEnsIrQT0h1
 neSgsjkQzdotdW9UmmB/72ZqTezPyk9LmIYYyIACwwf7LHeTJob10yVCIw5Sejs04OzSWqYL
 y22QDYWia4o0/YN3KCAol2Zhmy8mZHgEVA/+VCCNo661T9RaImgbo2uzFHU6/dcMYqUJmW8U
 Gg4d9u2t75XU8zU/MCZaKBURezyua7ZWNHJqQc3R8FJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5yYCkfeI+TfNDKm8gj9yjn5ZLV7vEMZGPx744owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2IG82lnkv3jOXBOxZ5rIvp1nPXP4jVC4ve8G3oH
 yt3bZPWm32zrsWiCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJb9JIJUJfsLUcaU9U9xcx9z76Ql
 lnkAxMw4Aev1BXvdFTRAlg+OeyHYHqKhS9iVcDaFQ3zgCZLjEfGxPp3SqbbipF7rrE+lqAtE
 KFeEyhCa9wWIgn6F/0mRcGVhORfmN6D3Gpi5gKpP2oyeYBOXQvM9oO2dwfj7nBWXCG2qdE/s
 /ur0QaCGcgPQAFrDcD3bvOzzgzu4ShBybwqB0aYcMNOfEjM8ZRxL3CjhPEAPMxRew7IwSGX1
 ljKDE5A9/XNuYI87PLAmbuA89WyC+J7E0cDRzvb4L+6ODP05G2mxYMcAu+EcSqEDDH/+bm4Z
 PUTxPb5aaVVkFFPuot6MrBq0aNhuIe/++4EllxpRSyZYU6qB7VsJmi98fNO7qAdlKVEvQaWW
 16U/oUIM7u+J864QkUaIxAob7rf2KhMyCXS9/k8PG7z+DRzoOicSUxXMhSB1H5dIb9yPN93y
 OstopdLuQm2ix5sOdealCFEsW+LKyVYAakgs5gbBq7tixYqlQ4eMcCNVHeu7cHdcchIP2krP
 iSQ1fjLiLlrz0bfd2Y+SCrW1u1HiJVS4B1HwTfu/bhSdgYpUhPv4CBszA==
IronPort-HdrOrdr: A9a23:aaT6HqA0WIiTD+blHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.87,226,1631592000"; 
   d="scan'208";a="57591434"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 1/5] xen/domain: Remove function pointers from domain pause helpers
Date: Thu, 11 Nov 2021 17:57:36 +0000
Message-ID: <20211111175740.23480-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211111175740.23480-1-andrew.cooper3@citrix.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Retpolines are expensive, and all these do are select between the sync and
nosync helpers.  Pass a boolean instead, and use direct calls everywhere.

Pause/unpause operations on behalf of dom0 are not fastpaths, so avoid
exposing the __domain_pause_by_systemcontroller() internal.

This actually compiles smaller than before:

  $ ../scripts/bloat-o-meter xen-syms-before xen-syms-after
  add/remove: 3/1 grow/shrink: 0/5 up/down: 250/-273 (-23)
  Function                                     old     new   delta
  _domain_pause                                  -     115    +115
  domain_pause_by_systemcontroller               -      69     +69
  domain_pause_by_systemcontroller_nosync        -      66     +66
  domain_kill                                  426     398     -28
  domain_resume                                246     214     -32
  domain_pause_except_self                     189     141     -48
  domain_pause                                  59      10     -49
  domain_pause_nosync                           59       7     -52
  __domain_pause_by_systemcontroller            64       -     -64

despite GCC's best efforts.  The new _domain_pause_by_systemcontroller()
really should not be inlined, considering that the difference is only the
setup of the sync boolean to pass to _domain_pause(), and there are plenty of
registers to spare.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/common/domain.c     | 31 ++++++++++++++++++++++---------
 xen/include/xen/sched.h | 15 +++++----------
 2 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 56d47dd66478..562872cdf87a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1234,15 +1234,18 @@ int vcpu_unpause_by_systemcontroller(struct vcpu *v)
     return 0;
 }
 
-static void do_domain_pause(struct domain *d,
-                            void (*sleep_fn)(struct vcpu *v))
+static void _domain_pause(struct domain *d, bool sync /* or nosync */)
 {
     struct vcpu *v;
 
     atomic_inc(&d->pause_count);
 
-    for_each_vcpu( d, v )
-        sleep_fn(v);
+    if ( sync )
+        for_each_vcpu ( d, v )
+            vcpu_sleep_sync(v);
+    else
+        for_each_vcpu ( d, v )
+            vcpu_sleep_nosync(v);
 
     arch_domain_pause(d);
 }
@@ -1250,12 +1253,12 @@ static void do_domain_pause(struct domain *d,
 void domain_pause(struct domain *d)
 {
     ASSERT(d != current->domain);
-    do_domain_pause(d, vcpu_sleep_sync);
+    _domain_pause(d, true /* sync */);
 }
 
 void domain_pause_nosync(struct domain *d)
 {
-    do_domain_pause(d, vcpu_sleep_nosync);
+    _domain_pause(d, false /* nosync */);
 }
 
 void domain_unpause(struct domain *d)
@@ -1269,8 +1272,8 @@ void domain_unpause(struct domain *d)
             vcpu_wake(v);
 }
 
-int __domain_pause_by_systemcontroller(struct domain *d,
-                                       void (*pause_fn)(struct domain *d))
+static int _domain_pause_by_systemcontroller(
+    struct domain *d, bool sync /* or nosync */)
 {
     int old, new, prev = d->controller_pause_count;
 
@@ -1289,11 +1292,21 @@ int __domain_pause_by_systemcontroller(struct domain *d,
         prev = cmpxchg(&d->controller_pause_count, old, new);
     } while ( prev != old );
 
-    pause_fn(d);
+    _domain_pause(d, sync);
 
     return 0;
 }
 
+int domain_pause_by_systemcontroller(struct domain *d)
+{
+    return _domain_pause_by_systemcontroller(d, true /* sync */);
+}
+
+int domain_pause_by_systemcontroller_nosync(struct domain *d)
+{
+    return _domain_pause_by_systemcontroller(d, false /* nosync */);
+}
+
 int domain_unpause_by_systemcontroller(struct domain *d)
 {
     int old, new, prev = d->controller_pause_count;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 28146ee404e6..37f78cc4c4c9 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -920,26 +920,21 @@ static inline bool vcpu_cpu_dirty(const struct vcpu *v)
 
 void vcpu_block(void);
 void vcpu_unblock(struct vcpu *v);
+
 void vcpu_pause(struct vcpu *v);
 void vcpu_pause_nosync(struct vcpu *v);
 void vcpu_unpause(struct vcpu *v);
+
 int vcpu_pause_by_systemcontroller(struct vcpu *v);
 int vcpu_unpause_by_systemcontroller(struct vcpu *v);
 
 void domain_pause(struct domain *d);
 void domain_pause_nosync(struct domain *d);
 void domain_unpause(struct domain *d);
+
+int domain_pause_by_systemcontroller(struct domain *d);
+int domain_pause_by_systemcontroller_nosync(struct domain *d);
 int domain_unpause_by_systemcontroller(struct domain *d);
-int __domain_pause_by_systemcontroller(struct domain *d,
-                                       void (*pause_fn)(struct domain *d));
-static inline int domain_pause_by_systemcontroller(struct domain *d)
-{
-    return __domain_pause_by_systemcontroller(d, domain_pause);
-}
-static inline int domain_pause_by_systemcontroller_nosync(struct domain *d)
-{
-    return __domain_pause_by_systemcontroller(d, domain_pause_nosync);
-}
 
 /* domain_pause() but safe against trying to pause current. */
 int __must_check domain_pause_except_self(struct domain *d);
-- 
2.11.0


