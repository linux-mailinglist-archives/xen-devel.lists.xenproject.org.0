Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07296411E13
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 19:26:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191053.340974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN3F-00065j-Eu; Mon, 20 Sep 2021 17:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191053.340974; Mon, 20 Sep 2021 17:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN3F-0005vR-7R; Mon, 20 Sep 2021 17:25:57 +0000
Received: by outflank-mailman (input) for mailman id 191053;
 Mon, 20 Sep 2021 17:25:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSN3D-0003cq-D3
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 17:25:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7499935-1a37-11ec-b87a-12813bfff9fa;
 Mon, 20 Sep 2021 17:25:41 +0000 (UTC)
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
X-Inumbo-ID: c7499935-1a37-11ec-b87a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632158741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=kRgS+FI6cDfW+xtWOVJXQyBa4B8IEHbmPbHmbF/E9Yc=;
  b=goB6YPScwF17n/KBWnnCeAhyLpaWQr0oIcaoT0mpQnWQOXGQNz6ifBsS
   dmNKUEgYxK/VtTgE4wc81skxqocZj2oBp83TUX8Oa9olACGILUytbzva5
   mnkiUMQ4zrCz9lfY1HAr80ppczjdJLb+3NSwv4OdRrViIRHl7TXdoYO7J
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2aliCzhyOh0fDvZKu3MysIljbnxpZikxNlp9VbAgcwK44GiRR5MeWVrVLox707BH4fnTulyh8/
 JSK7rvRSftpOVrrVXRjqRZEnjgZN4X0GyzaO2aKiy1sAiYBbf2tBRglWrhYmorWnLIU77L407n
 5h7PUo0cLpAhZfFuKe9Psq3dwaNr3wAIujY4FxWMmpIE+5pHIEMTEd+eHlwNasE5E1y2VtWg6y
 otcHW0jFmKCrr1VQLkkTr8SoU5zjF13jCx6B9n893QksObBgkG6fQ7rZ+k/bODaCwlyK3E5kXo
 W7MCoiG+qFuZnboTg41p3mle
X-SBRS: 5.1
X-MesageID: 53560996
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KkDS6aBM/cbTDRVW/8Hkw5YqxClBgxIJ4kV8jS/XYbTApGxw32MBx
 2YWUDuDP/yCNjSnKt5yPIy3oUhQ6MSBzYJrQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w00o7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/izGNtPF9z
 493hbutalpzEoHzw/YjTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFh2pu3pEfQ54yY
 eIDU2R0N0zMfyRBYAknOdV5tbuPuHzwJmgwRFW9+vNsvjm7IBZK+LrwNNvYfPSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnkS3yV40TE7m53uV3m1DVzWsWYDUJUXOrrP//jVSxM/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwACSyILE7gCBHG8GQzVdLts8u6ceXic23
 1WEm9foAz1Hs7CPT3+ZsLCOoluP1TM9dDFYI3VeFE1cvoel8NpbYg/zoshLEKqxpfz5HmvK8
 xeXj3Vkq5ks1tw1yPDulbzYuA5AtqQlXyZsuF6ODjn0v1sjDGK2T9f3sgmAtJ6sOK7cFwPY7
 SZew6By+chTVcnlqcCbfAka8FhFDd6+OTvAiBZEG5A7/lxBEFbyINgNvFmSyKpvW/vomAMFg
 meI4mu9B7cJZRNGiJObhKrrUKwXIVDIT4iNaxwtRoMmjmJNmOq7EMZGPhT44owQuBJ0zfFX1
 WmzKJ7xZZrlNUiX5GXvHLpMuVPa7gs/2XnSVfjGI+ePiOHFDEN5vYwtaQPUBshgtfvsiFyMr
 753apvboz0CAbaWSnSGruYuwaUicCFT6Wbe8JcMKIZu42NORQkcNhMm6elwI9A6x/sFyLigE
 7PUchYw9WcTTEbvcW2iAk2Popu2NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:d53ceKqbkf5TLc2PlQ0NeR0aV5oXeYIsimQD101hICG9Ffbo8/
 xG/c5rsCMc5wxhO03I9ergBEDiex3hHPxOkO4s1N6ZNWGN1VdARLsSi7cKqAeQeREWmNQ86U
 5ISdkGNDWuZmIQsS+B2maF+nwbsaG6GduT6dvj8w==
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="53560996"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: [PATCH v2 03/12] xen/credit2: Remove tail padding from TRC_CSCHED2_* records
Date: Mon, 20 Sep 2021 18:25:20 +0100
Message-ID: <20210920172529.24932-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

All three of these records have tail padding, leaking stack rubble into the
trace buffer.  Introduce an explicit _pad field and have the compiler zero the
padding automatically.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Dario Faggioli <dfaggioli@suse.com>
---
 xen/common/sched/credit2.c | 47 +++++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 6396b38e044c..41312158ec63 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -1106,12 +1106,14 @@ _runq_assign(struct csched2_unit *svc, struct csched2_runqueue_data *rqd)
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned unit:16, dom:16;
-            unsigned rqi:16;
-        } d;
-        d.dom = svc->unit->domain->domain_id;
-        d.unit = svc->unit->unit_id;
-        d.rqi=rqd->id;
+            uint16_t unit, dom;
+            uint16_t rqi, _pad;
+        } d = {
+            .unit = svc->unit->unit_id,
+            .dom  = svc->unit->domain->domain_id,
+            .rqi  = rqd->id,
+        };
+
         __trace_var(TRC_CSCHED2_RUNQ_ASSIGN, 1,
                     sizeof(d),
                     (unsigned char *)&d);
@@ -1336,13 +1338,17 @@ update_runq_load(const struct scheduler *ops,
     {
         struct {
             uint64_t rq_avgload, b_avgload;
-            unsigned rq_load:16, rq_id:8, shift:8;
-        } d;
-        d.rq_id = rqd->id;
-        d.rq_load = rqd->load;
-        d.rq_avgload = rqd->avgload;
-        d.b_avgload = rqd->b_avgload;
-        d.shift = P;
+            uint16_t rq_load;
+            uint8_t  rq_id, shift;
+            uint32_t _pad;
+        } d = {
+            .rq_avgload  = rqd->avgload,
+            .b_avgload   = rqd->b_avgload,
+            .rq_load     = rqd->load,
+            .rq_id       = rqd->id,
+            .shift       = P,
+        };
+
         __trace_var(TRC_CSCHED2_UPDATE_RUNQ_LOAD, 1,
                     sizeof(d),
                     (unsigned char *)&d);
@@ -2799,12 +2805,15 @@ static void balance_load(const struct scheduler *ops, int cpu, s_time_t now)
     {
         struct {
             uint64_t lb_avgload, ob_avgload;
-            unsigned lrq_id:16, orq_id:16;
-        } d;
-        d.lrq_id = st.lrqd->id;
-        d.lb_avgload = st.lrqd->b_avgload;
-        d.orq_id = st.orqd->id;
-        d.ob_avgload = st.orqd->b_avgload;
+            uint16_t lrq_id, orq_id;
+            uint32_t _pad;
+        } d = {
+            .lb_avgload  = st.lrqd->b_avgload,
+            .ob_avgload  = st.orqd->b_avgload,
+            .lrq_id      = st.lrqd->id,
+            .orq_id      = st.orqd->id,
+        };
+
         __trace_var(TRC_CSCHED2_LOAD_BALANCE, 1,
                     sizeof(d),
                     (unsigned char *)&d);
-- 
2.11.0


