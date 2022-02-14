Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76354B5176
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272051.466855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEs-0003WF-Am; Mon, 14 Feb 2022 13:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272051.466855; Mon, 14 Feb 2022 13:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEs-0003UY-5r; Mon, 14 Feb 2022 13:17:58 +0000
Received: by outflank-mailman (input) for mailman id 272051;
 Mon, 14 Feb 2022 13:17:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb4m-00023t-9Y
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:07:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f868522-8d97-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:07:30 +0100 (CET)
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
X-Inumbo-ID: 0f868522-8d97-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=s+Jt3kVFT6FeqRAFMyblKx1FZnX0D4ErdxbQ4UUEYAQ=;
  b=VHarnlgKoEuz+T/DcNbffAC3R15cP7vxCHcVh7ZMZzg9D1UNXKbnYH2Z
   DMPp3d4KVFy7W+nCbPf/kl1k5p2qmF5tq5Z0zQrXIvrLrwu4z2lExFH9R
   RyFz497djkvC/QkT44p/z+M1JsJ2MBxvBesfvZhBqmL3mXF77BF7LGO2h
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sOXmjbQ9kP//HyRdi956wfUOuNX9Kjm/Wd+sZjKDp0SuqOAg0z0HsOt9ixom5wnyM8vkYkojxm
 bg1bRlH/iLWZwTl44lZzjUIM6HaSSyZtddniFaqScqOJ9q+pS0zonjOqRsxGmGyOOy/aNSFPgP
 vkIB70wKB6zyczGx+P3uqUU9k7EqyhxP16qRJ8HTuNYx7Rvp5TEgL0YWP4vl0PpalA09LiA4Lo
 eLtdmwn/rHgPR2gbceQ3xtzVZUEwAGn9ydpe/7O2873JfJRWjA+1r7aBT04ziTi8XziETD20BK
 E4+Fl/YUTZEBoeFHBoN22mqm
X-SBRS: 5.1
X-MesageID: 64554519
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:758jf61bnZxSwly59/bD5cp2kn2cJEfYwER7XKvMYLTBsI5bpzdSz
 mBJXTzVbP6JYWOhc951OYvjoUwC6pHTnNBjSAU6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhktBD7
 vlHt5OJGAIQMP3939Y/CyBzHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u2p0TQauHN
 qL1bxJrYjXlYhB1fW1PBY8Ykd6xt36nfi9h/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfycTjTAdxIUufir7gz3QPVljd75AAquUWTrPmLrGK0Wd1me
 kkt9Hof6poQrHWAQYyoN/Gnm0KsshkZUttWNuQ17gCR16bZizqk6ng4oi1pM4J/6pJvLdA+/
 hrQxo6yW2Qz2FGAYS/Frt+pQSWO1T/5xIPoTQsNVkM77tbqu+nfZTqfH484QMZZYjAYcAwcI
 gxmTgBj3d3/buZRjs1XGGwrZBr2+PD0ovYdvFm/Y45cxloRiHSZT4Kp80PHyv1LMZyUSFKM1
 FBdxZTCs7BeUMzVzXfXKAnoIF1Oz6zbWAAwfHY1R8Vxn9hT0yLLkX9sDMFWex4yb5dslc7Ba
 07PowJBjKK/z1PxBZKbl7mZUpxwpYC5TIyNfqmNMrJmP8ggHCfarXoGTRPBgAjQfL0EzPhX1
 WGzKp33Ux73yM1PkVKLegvq+eF3mH5unz6PLX05pjz+uYejiLeuYe9tGDOzgioRtfvYyOkM2
 9oAZcaM1TtFV+jyPnve/YIJdAhYJnknH5Hm7cdQc7fbcAZhHWggDd7XwK8gJNM5z/gEyL+Q8
 yHvQFJcxXr+mWbDdVeAZEd8Ze69Rp14t386Y3AhZA76x3g5bI+zx64DbJ9rL6I//eluwKcsH
 fkIcsmNGNpVTTHD92hPZJXxttU6Jh+qmRiPL2yuZz1mJ8xsQAnA+9nFeArz9XZRUnrr5JVm+
 7D5j1HVW5sOQQhmHf36UvP3wgPjp2UZlcJzQ1DMfotZdnLz/dU4MCf2lPI2fZ0BcE2R2juA2
 g+KKh4Evu2R8ZQt+dzEiK3Y/YekF+xyQhhTE2XBtOvkMCDb+iyowJNaUfbOdjfYDTum9KKnb
 ORT7vf9LPxYwwoa79siS+5mnfAk+t/ih75G1QA1TnzEYmOiBq5kPnTbj9JEsbdAx+MBtAa7M
 q5VFgK25Vld1BvZLWMs
IronPort-HdrOrdr: A9a23:y/CNiai7vN8Zi7SlCLHi2MtuB3BQXtgji2hC6mlwRA09TySZ//
 rBoB17726MtN9/YhEdcLy7VJVoBEmskKKdgrNhW4tKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QFJSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64554519"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 21/70] xen/evtchn: CFI hardening
Date: Mon, 14 Feb 2022 12:50:38 +0000
Message-ID: <20220214125127.17985-22-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/event_2l.c      | 21 ++++++++++++---------
 xen/common/event_channel.c |  3 ++-
 xen/common/event_fifo.c    | 30 ++++++++++++++++--------------
 3 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/xen/common/event_2l.c b/xen/common/event_2l.c
index 7424320e525a..d40dd51ab555 100644
--- a/xen/common/event_2l.c
+++ b/xen/common/event_2l.c
@@ -16,7 +16,8 @@
 
 #include <asm/guest_atomics.h>
 
-static void evtchn_2l_set_pending(struct vcpu *v, struct evtchn *evtchn)
+static void cf_check evtchn_2l_set_pending(
+    struct vcpu *v, struct evtchn *evtchn)
 {
     struct domain *d = v->domain;
     unsigned int port = evtchn->port;
@@ -41,12 +42,14 @@ static void evtchn_2l_set_pending(struct vcpu *v, struct evtchn *evtchn)
     evtchn_check_pollers(d, port);
 }
 
-static void evtchn_2l_clear_pending(struct domain *d, struct evtchn *evtchn)
+static void cf_check evtchn_2l_clear_pending(
+    struct domain *d, struct evtchn *evtchn)
 {
     guest_clear_bit(d, evtchn->port, &shared_info(d, evtchn_pending));
 }
 
-static void evtchn_2l_unmask(struct domain *d, struct evtchn *evtchn)
+static void cf_check evtchn_2l_unmask(
+    struct domain *d, struct evtchn *evtchn)
 {
     struct vcpu *v = d->vcpu[evtchn->notify_vcpu_id];
     unsigned int port = evtchn->port;
@@ -64,8 +67,8 @@ static void evtchn_2l_unmask(struct domain *d, struct evtchn *evtchn)
     }
 }
 
-static bool evtchn_2l_is_pending(const struct domain *d,
-                                 const struct evtchn *evtchn)
+static bool cf_check evtchn_2l_is_pending(
+    const struct domain *d, const struct evtchn *evtchn)
 {
     evtchn_port_t port = evtchn->port;
     unsigned int max_ports = BITS_PER_EVTCHN_WORD(d) * BITS_PER_EVTCHN_WORD(d);
@@ -75,8 +78,8 @@ static bool evtchn_2l_is_pending(const struct domain *d,
             guest_test_bit(d, port, &shared_info(d, evtchn_pending)));
 }
 
-static bool evtchn_2l_is_masked(const struct domain *d,
-                                const struct evtchn *evtchn)
+static bool cf_check evtchn_2l_is_masked(
+    const struct domain *d, const struct evtchn *evtchn)
 {
     evtchn_port_t port = evtchn->port;
     unsigned int max_ports = BITS_PER_EVTCHN_WORD(d) * BITS_PER_EVTCHN_WORD(d);
@@ -86,8 +89,8 @@ static bool evtchn_2l_is_masked(const struct domain *d,
             guest_test_bit(d, port, &shared_info(d, evtchn_mask)));
 }
 
-static void evtchn_2l_print_state(struct domain *d,
-                                  const struct evtchn *evtchn)
+static void cf_check evtchn_2l_print_state(
+    struct domain *d, const struct evtchn *evtchn)
 {
     struct vcpu *v = d->vcpu[evtchn->notify_vcpu_id];
 
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 2026bc30dc95..183e78ac17f1 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -99,7 +99,8 @@ static xen_event_channel_notification_t __read_mostly
     xen_consumers[NR_XEN_CONSUMERS];
 
 /* Default notification action: wake up from wait_on_xen_event_channel(). */
-static void default_xen_notification_fn(struct vcpu *v, unsigned int port)
+static void cf_check default_xen_notification_fn(
+    struct vcpu *v, unsigned int port)
 {
     /* Consumer needs notification only if blocked. */
     if ( test_and_clear_bit(_VPF_blocked_in_xen, &v->pause_flags) )
diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index 2fb01b82db84..ed4d3beb10f3 100644
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -78,7 +78,7 @@ static inline event_word_t *evtchn_fifo_word_from_port(const struct domain *d,
     return d->evtchn_fifo->event_array[p] + w;
 }
 
-static void evtchn_fifo_init(struct domain *d, struct evtchn *evtchn)
+static void cf_check evtchn_fifo_init(struct domain *d, struct evtchn *evtchn)
 {
     event_word_t *word;
 
@@ -158,7 +158,8 @@ static bool_t evtchn_fifo_set_link(struct domain *d, event_word_t *word,
     return 1;
 }
 
-static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
+static void cf_check evtchn_fifo_set_pending(
+    struct vcpu *v, struct evtchn *evtchn)
 {
     struct domain *d = v->domain;
     unsigned int port;
@@ -317,7 +318,8 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
         evtchn_check_pollers(d, port);
 }
 
-static void evtchn_fifo_clear_pending(struct domain *d, struct evtchn *evtchn)
+static void cf_check evtchn_fifo_clear_pending(
+    struct domain *d, struct evtchn *evtchn)
 {
     event_word_t *word;
 
@@ -334,7 +336,7 @@ static void evtchn_fifo_clear_pending(struct domain *d, struct evtchn *evtchn)
     guest_clear_bit(d, EVTCHN_FIFO_PENDING, word);
 }
 
-static void evtchn_fifo_unmask(struct domain *d, struct evtchn *evtchn)
+static void cf_check evtchn_fifo_unmask(struct domain *d, struct evtchn *evtchn)
 {
     struct vcpu *v = d->vcpu[evtchn->notify_vcpu_id];
     event_word_t *word;
@@ -350,32 +352,32 @@ static void evtchn_fifo_unmask(struct domain *d, struct evtchn *evtchn)
         evtchn_fifo_set_pending(v, evtchn);
 }
 
-static bool evtchn_fifo_is_pending(const struct domain *d,
-                                   const struct evtchn *evtchn)
+static bool cf_check evtchn_fifo_is_pending(
+    const struct domain *d, const struct evtchn *evtchn)
 {
     const event_word_t *word = evtchn_fifo_word_from_port(d, evtchn->port);
 
     return word && guest_test_bit(d, EVTCHN_FIFO_PENDING, word);
 }
 
-static bool_t evtchn_fifo_is_masked(const struct domain *d,
-                                    const struct evtchn *evtchn)
+static bool cf_check evtchn_fifo_is_masked(
+    const struct domain *d, const struct evtchn *evtchn)
 {
     const event_word_t *word = evtchn_fifo_word_from_port(d, evtchn->port);
 
     return !word || guest_test_bit(d, EVTCHN_FIFO_MASKED, word);
 }
 
-static bool_t evtchn_fifo_is_busy(const struct domain *d,
-                                  const struct evtchn *evtchn)
+static bool cf_check evtchn_fifo_is_busy(
+    const struct domain *d, const struct evtchn *evtchn)
 {
     const event_word_t *word = evtchn_fifo_word_from_port(d, evtchn->port);
 
     return word && guest_test_bit(d, EVTCHN_FIFO_LINKED, word);
 }
 
-static int evtchn_fifo_set_priority(struct domain *d, struct evtchn *evtchn,
-                                    unsigned int priority)
+static int cf_check evtchn_fifo_set_priority(
+    struct domain *d, struct evtchn *evtchn, unsigned int priority)
 {
     if ( priority > EVTCHN_FIFO_PRIORITY_MIN )
         return -EINVAL;
@@ -390,8 +392,8 @@ static int evtchn_fifo_set_priority(struct domain *d, struct evtchn *evtchn,
     return 0;
 }
 
-static void evtchn_fifo_print_state(struct domain *d,
-                                    const struct evtchn *evtchn)
+static void cf_check evtchn_fifo_print_state(
+    struct domain *d, const struct evtchn *evtchn)
 {
     event_word_t *word;
 
-- 
2.11.0


