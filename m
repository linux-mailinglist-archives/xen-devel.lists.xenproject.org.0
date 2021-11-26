Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA28045EEAF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232830.403938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawt-0002E4-VI; Fri, 26 Nov 2021 13:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232830.403938; Fri, 26 Nov 2021 13:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawt-00029P-F1; Fri, 26 Nov 2021 13:07:31 +0000
Received: by outflank-mailman (input) for mailman id 232830;
 Fri, 26 Nov 2021 13:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavC-0003W9-8c
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8feca44d-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:44 +0100 (CET)
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
X-Inumbo-ID: 8feca44d-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C0fvCAztg5DLCbQmwvTpZ/liPDfc2zf7QofwX/rYxoo=;
  b=bjn59gQxhJe8w4b+m4YTxSafCP7WAd4gOy3PsT/hXn9UUtyCcw7YIiGE
   2VGu3g+jajlIngtnfsVAjjY021P+g+e+aVRmAAdGIT3VNVII3qQjKayoS
   WpZr0uxQiT5C1Bxdx9ipHG3yzkPVSrN8MW7Rq5wo8ZXaVqX+Klz6aLjm0
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: V0Oea6tppHveq4nfNZk7eroUZtBeGaTarmOZyoexrR76Bav50ggoXIfYVJumk9K/qs3x0d3+Zn
 bIk5q/V+btfaFNnBV7cmdY4cswEVEajmn0d7tpgzhVYVVra1bUa6cQzG5Bppfo4QpW69KA6Pn2
 lkW2g9oh3tFFOZMH12w81qCrsjdoun8b0V2KEwzdWpnQUlunKiQXbvRbg4QChL2yWCSgS0NMl0
 A4lz2wyKND4r0tNxcTZsixLebwA3Y6ZZ2VceFEMkizf+SNEKFgAHDsqBrz7QZXQH55buRW4Pu5
 FnGwQvpaWumc8fpT4U1PPtb6
X-SBRS: 5.1
X-MesageID: 60695296
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DNub8qwT/vDpn5CjxYJ6t+fCwSrEfRIJ4+MujC+fZmUNrF6WrkVSz
 TFMWDvXPvbYYTagKNt1YNzl9B9QvJPUyN5mSAVv/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRn2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt4Bg4
 9tdkqWBcCEKZIzSs/4aehZfDggraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JgQTKuEN
 pRxhTxHVFPPSixDOAkuAtEQu+Git2LPYhBDpwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krE4mD4DxcyJNGZjz2f/RqEnfTTlCn2XIYTEryQ9fNwhlCXgGsJB3U+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJH4Ky+R2K6z4atixDoGDY+N2graigZZF5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdjv9tlsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbGK0bb1HRcBJG9GRF5iLJts4DNZWfhoBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66PMYoQP8cgKFHbp0mCgHJ8OUi2yyDAdollZ
 P+mnTuEVy5GWcyLMhLqLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwJzLqVp
 S/kBRcDoLc97FWeQTi3hrlYQOuHdf5CQbgTZ0TA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:8e4WbqwjbRshkAfMsrBPKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="60695296"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 17/65] xen/evtchn: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:33:58 +0000
Message-ID: <20211126123446.32324-18-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
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
index 67ac4dd15dcf..e26904e7508f 100644
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


