Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA90938EFA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 14:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761813.1171862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVryN-0006Jy-MF; Mon, 22 Jul 2024 12:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761813.1171862; Mon, 22 Jul 2024 12:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVryN-0006H4-Hz; Mon, 22 Jul 2024 12:16:59 +0000
Received: by outflank-mailman (input) for mailman id 761813;
 Mon, 22 Jul 2024 12:16:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JAiy=OW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sVryM-0006Ev-35
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 12:16:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 483712e1-4824-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 14:16:54 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C4D9A1FB6A;
 Mon, 22 Jul 2024 12:16:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9448D138A7;
 Mon, 22 Jul 2024 12:16:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id w1nCIrRNnmYbIQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 22 Jul 2024 12:16:52 +0000
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
X-Inumbo-ID: 483712e1-4824-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721650613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azTkaup4SqcuXAb/LgH2nIaT96hnmtfLlbNKG39T8n0=;
	b=cHfLAaeM5m/6kHQ2AmUVH+jezHClRl/cCzVQWAl41We+/EprJ5CeoNMLPh5H8EVV9KyYjE
	618MfpFdd9a1qo5tmpBGV7Ivd/8aZpQ6pPAvGo1cAsjf7EgMvYiQtWD7fQMUpsk2/OjOmy
	pfQPYACWnH7P3h0+1IgxiLzu2LxG2EQ=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721650612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azTkaup4SqcuXAb/LgH2nIaT96hnmtfLlbNKG39T8n0=;
	b=hk4wFdMEhXUdpgb1W2B1qYVV0hPthXHmjmw7AaZsDZFIUUXCmPbGrKHrQ3JIuvI3YoLsA3
	MTgEl+E+3m8JTKW9jhYnYrywH8cq5KCbDWsqCWmrko233GhM9pnFoVaMTu9NDSj3dan9eU
	ZVRVY7BvBJPRDR1RDSWznm/cCK52o80=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/3] mini-os: apply coding style to arch/x86/time.c
Date: Mon, 22 Jul 2024 14:16:41 +0200
Message-ID: <20240722121643.18116-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722121643.18116-1-jgross@suse.com>
References: <20240722121643.18116-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.60
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO

Apply the preferred coding style to arch/x86/time.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/time.c | 194 +++++++++++++++++++++++-------------------------
 1 file changed, 93 insertions(+), 101 deletions(-)

diff --git a/arch/x86/time.c b/arch/x86/time.c
index 332c0260..a473a9e1 100644
--- a/arch/x86/time.c
+++ b/arch/x86/time.c
@@ -1,7 +1,7 @@
 /* -*-  Mode:C; c-basic-offset:4; tab-width:4 -*-
  ****************************************************************************
  * (C) 2003 - Rolf Neugebauer - Intel Research Cambridge
- * (C) 2002-2003 - Keir Fraser - University of Cambridge 
+ * (C) 2002-2003 - Keir Fraser - University of Cambridge
  * (C) 2005 - Grzegorz Milos - Intel Research Cambridge
  * (C) 2006 - Robert Kaiser - FH Wiesbaden
  ****************************************************************************
@@ -18,20 +18,19 @@
  * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
  * sell copies of the Software, and to permit persons to whom the Software is
  * furnished to do so, subject to the following conditions:
- * 
+ *
  * The above copyright notice and this permission notice shall be included in
  * all copies or substantial portions of the Software.
- * 
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  * DEALINGS IN THE SOFTWARE.
  */
 
-
 #include <mini-os/os.h>
 #include <mini-os/traps.h>
 #include <mini-os/types.h>
@@ -46,44 +45,43 @@
 
 /* These are peridically updated in shared_info, and then copied here. */
 struct shadow_time_info {
-	uint64_t tsc_timestamp;     /* TSC at last update of time vals.  */
-	uint64_t system_timestamp;  /* Time, in nanosecs, since boot.    */
-	uint32_t tsc_to_nsec_mul;
-	uint32_t tsc_to_usec_mul;
-	int tsc_shift;
-	uint32_t version;
+    uint64_t tsc_timestamp;     /* TSC at last update of time vals.  */
+    uint64_t system_timestamp;  /* Time, in nanosecs, since boot.    */
+    uint32_t tsc_to_nsec_mul;
+    uint32_t tsc_to_usec_mul;
+    int tsc_shift;
+    uint32_t version;
 };
 static struct timespec shadow_ts;
 static uint32_t shadow_ts_version;
 
 static struct shadow_time_info shadow;
 
-
 #ifndef rmb
-#define rmb()  __asm__ __volatile__ ("lock; addl $0,0(%%esp)": : :"memory")
+#define rmb()  __asm__ __volatile__ ("lock; addl $0,0(%%esp)" : : : "memory")
 #endif
 
-#define HANDLE_USEC_OVERFLOW(_tv)          \
-    do {                                   \
+#define HANDLE_USEC_OVERFLOW(_tv)           \
+    do {                                    \
         while ( (_tv)->tv_usec >= 1000000 ) \
-        {                                  \
+        {                                   \
             (_tv)->tv_usec -= 1000000;      \
             (_tv)->tv_sec++;                \
-        }                                  \
+        }                                   \
     } while ( 0 )
 
 static inline int time_values_up_to_date(void)
 {
-	struct vcpu_time_info *src = &HYPERVISOR_shared_info->vcpu_info[0].time; 
+    struct vcpu_time_info *src = &HYPERVISOR_shared_info->vcpu_info[0].time;
 
-	return (shadow.version == src->version);
+    return shadow.version == src->version;
 }
 
 static inline int wc_values_up_to_date(void)
 {
-	shared_info_t *s= HYPERVISOR_shared_info;
+    shared_info_t *s = HYPERVISOR_shared_info;
 
-	return (shadow_ts_version == s->wc_version);
+    return shadow_ts_version == s->wc_version;
 }
 
 /*
@@ -92,109 +90,104 @@ static inline int wc_values_up_to_date(void)
  */
 static inline uint64_t scale_delta(uint64_t delta, uint32_t mul_frac, int shift)
 {
-	uint64_t product;
+    uint64_t product;
 #ifdef __i386__
-	uint32_t tmp1, tmp2;
+    uint32_t tmp1, tmp2;
 #endif
 
-	if ( shift < 0 )
-		delta >>= -shift;
-	else
-		delta <<= shift;
+    if ( shift < 0 )
+        delta >>= -shift;
+    else
+        delta <<= shift;
 
 #ifdef __i386__
-	__asm__ (
-		"mul  %5       ; "
-		"mov  %4,%%eax ; "
-		"mov  %%edx,%4 ; "
-		"mul  %5       ; "
-		"add  %4,%%eax ; "
-		"xor  %5,%5    ; "
-		"adc  %5,%%edx ; "
-		: "=A" (product), "=r" (tmp1), "=r" (tmp2)
-		: "a" ((uint32_t)delta), "1" ((uint32_t)(delta >> 32)), "2" (mul_frac) );
+    __asm__ (
+        "mul  %5       ; "
+        "mov  %4,%%eax ; "
+        "mov  %%edx,%4 ; "
+        "mul  %5       ; "
+        "add  %4,%%eax ; "
+        "xor  %5,%5    ; "
+        "adc  %5,%%edx ; "
+        : "=A" (product), "=r" (tmp1), "=r" (tmp2)
+        : "a" ((uint32_t)delta), "1" ((uint32_t)(delta >> 32)), "2" (mul_frac) );
 #else
-	__asm__ (
-		"mul %%rdx ; shrd $32,%%rdx,%%rax"
-		: "=a" (product) : "0" (delta), "d" ((uint64_t)mul_frac) );
+    __asm__ (
+        "mul %%rdx ; shrd $32,%%rdx,%%rax"
+        : "=a" (product) : "0" (delta), "d" ((uint64_t)mul_frac) );
 #endif
 
-	return product;
+    return product;
 }
 
-
 static unsigned long get_nsec_offset(void)
 {
-	uint64_t now, delta;
-	rdtscll(now);
-	delta = now - shadow.tsc_timestamp;
-	return scale_delta(delta, shadow.tsc_to_nsec_mul, shadow.tsc_shift);
-}
+    uint64_t now, delta;
 
+    rdtscll(now);
+    delta = now - shadow.tsc_timestamp;
+
+    return scale_delta(delta, shadow.tsc_to_nsec_mul, shadow.tsc_shift);
+}
 
 static void get_time_values_from_xen(void)
 {
-	struct vcpu_time_info    *src = &HYPERVISOR_shared_info->vcpu_info[0].time;
-
- 	do {
-		shadow.version = src->version;
-		rmb();
-		shadow.tsc_timestamp     = src->tsc_timestamp;
-		shadow.system_timestamp  = src->system_time;
-		shadow.tsc_to_nsec_mul   = src->tsc_to_system_mul;
-		shadow.tsc_shift         = src->tsc_shift;
-		rmb();
-	}
-	while ((src->version & 1) | (shadow.version ^ src->version));
-
-	shadow.tsc_to_usec_mul = shadow.tsc_to_nsec_mul / 1000;
+    struct vcpu_time_info *src = &HYPERVISOR_shared_info->vcpu_info[0].time;
+
+    do {
+        shadow.version = src->version;
+        rmb();
+        shadow.tsc_timestamp     = src->tsc_timestamp;
+        shadow.system_timestamp  = src->system_time;
+        shadow.tsc_to_nsec_mul   = src->tsc_to_system_mul;
+        shadow.tsc_shift         = src->tsc_shift;
+        rmb();
+    } while ( (src->version & 1) | (shadow.version ^ src->version) );
+
+    shadow.tsc_to_usec_mul = shadow.tsc_to_nsec_mul / 1000;
 }
 
-
-
-
-/* monotonic_clock(): returns # of nanoseconds passed since time_init()
- *		Note: This function is required to return accurate
- *		time even in the absence of multiple timer ticks.
+/*
+ * monotonic_clock(): returns # of nanoseconds passed since time_init()
+ *        Note: This function is required to return accurate
+ *        time even in the absence of multiple timer ticks.
  */
 uint64_t monotonic_clock(void)
 {
-	uint64_t time;
-	uint32_t local_time_version;
-
-	do {
-		local_time_version = shadow.version;
-		rmb();
-		time = shadow.system_timestamp + get_nsec_offset();
-		if (!time_values_up_to_date())
-			get_time_values_from_xen();
-		rmb();
-	} while (local_time_version != shadow.version);
-
-	return time;
+    uint64_t time;
+    uint32_t local_time_version;
+
+    do {
+        local_time_version = shadow.version;
+        rmb();
+        time = shadow.system_timestamp + get_nsec_offset();
+        if ( !time_values_up_to_date() )
+            get_time_values_from_xen();
+        rmb();
+    } while ( local_time_version != shadow.version );
+
+    return time;
 }
 
 static void update_wallclock(void)
 {
-	shared_info_t *s = HYPERVISOR_shared_info;
-
-	do {
-		shadow_ts_version = s->wc_version;
-		rmb();
-		shadow_ts.tv_sec  = s->wc_sec;
-		shadow_ts.tv_nsec = s->wc_nsec;
-		rmb();
-	}
-	while ((s->wc_version & 1) | (shadow_ts_version ^ s->wc_version));
+    shared_info_t *s = HYPERVISOR_shared_info;
+
+    do {
+        shadow_ts_version = s->wc_version;
+        rmb();
+        shadow_ts.tv_sec  = s->wc_sec;
+        shadow_ts.tv_nsec = s->wc_nsec;
+        rmb();
+    } while ( (s->wc_version & 1) | (shadow_ts_version ^ s->wc_version) );
 }
 
-
 int gettimeofday(struct timeval *tv, void *tz)
 {
     uint64_t nsec = monotonic_clock();
 
-    if (!wc_values_up_to_date())
-	update_wallclock();
+    if ( !wc_values_up_to_date() )
+        update_wallclock();
 
     nsec += shadow_ts.tv_nsec;
 
@@ -209,7 +202,7 @@ EXPORT_SYMBOL(gettimeofday);
 void block_domain(s_time_t until)
 {
     ASSERT(irqs_disabled());
-    if(monotonic_clock() < until)
+    if ( monotonic_clock() < until )
     {
         HYPERVISOR_set_timer_op(until);
 #ifdef CONFIG_PARAVIRT
@@ -228,9 +221,8 @@ static void timer_handler(evtchn_port_t ev, struct pt_regs *regs, void *ign)
     HYPERVISOR_set_timer_op(monotonic_clock() + MILLISECS(1));
 }
 
-
-
 static evtchn_port_t port;
+
 void init_time(void)
 {
     port = bind_virq(VIRQ_TIMER, &timer_handler, NULL);
-- 
2.43.0


