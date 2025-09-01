Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884C5B3E0AA
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 12:52:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104414.1455472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut29W-0008Vx-QE; Mon, 01 Sep 2025 10:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104414.1455472; Mon, 01 Sep 2025 10:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut29W-0008Td-NY; Mon, 01 Sep 2025 10:52:46 +0000
Received: by outflank-mailman (input) for mailman id 1104414;
 Mon, 01 Sep 2025 10:52:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nAK7=3M=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1ut29U-0008TR-KQ
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 10:52:44 +0000
Received: from fforwardh-b2-smtp.messagingengine.com
 (fforwardh-b2-smtp.messagingengine.com [202.12.124.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6761398-8721-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 12:52:39 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 7AA4B840142;
 Mon,  1 Sep 2025 06:52:37 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-06.internal (MEProxy); Mon, 01 Sep 2025 06:52:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Sep 2025 06:52:35 -0400 (EDT)
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
X-Inumbo-ID: c6761398-8721-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756723957; x=1756810357; bh=ZTcXzXlcyIMXC6e8cE1gniYmaVssyBubXl2
	kVFtTX1g=; b=E2NrmMRF4mi9KNTH1hz7s5aHpyZPqFZNZUvOihH0215fbrmK+eO
	qM8wqzKEykbmvOU/oDRor/kSf9ToXxHbtQVkTwJjvCPxD0hjQiezm40MQOirbyKx
	Rc3HzqNpn60foMP/sts8AuNfZbex5shY9hhTgOSuK+HZVHNhdPUDbDORQqX3zU/y
	KEVRAK0Ckeb632/zoLVkGR0Vxqixx/ekhVfTkViScu4rsZmKRG4iggkeWkVt6chu
	ah/neyjqKRbt0osHrZc20InHAqkpafE9b6/MMU3FrRDnfUFixzy6+lVahHzsaquz
	hKxinM7P048f1/r2TmMc2bepo3d+ReK9xIA==
X-ME-Sender: <xms:9Hq1aGqJqQPxVBd0CpH5jvq79B2APNcI68N4PK7h53iiCzqV3BeSUQ>
    <xme:9Hq1aAX3Au47zSIlfb0HCl1DsqBgkZ3SnG_u4b6ZsuWF1YjmlcV8HzvLzVRc_JS5X
    4rh2qyi5XGzc1C8D3g>
X-ME-Received: <xmr:9Hq1aHqsQkBbhG15QrdAA34t2P8Qw2glp5cvyzzAab6lVlhsCKSmZSBD3j9l>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleduleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgvrhhgihihucfm
    ihgsrhhikhcuoefuvghrghhihigpmfhisghrihhksegvphgrmhdrtghomheqnecuggftrf
    grthhtvghrnhepgedvfeefhfduvdetkeegleeggfelheekveeiuddufeehtdehleelhfek
    iedvvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghkihgssegurghrkhhsthgrrhdr
    shhithgvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhr
    tghpthhtohepshgvrhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtoh
    eprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegr
    nhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitg
    hhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghn
    rdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtg
    hpthhtohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhr
    tghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:9Hq1aPDj7ms0eXZNAEKbNdi9n4cKo_XfozCYWSgnCjBI6IT9g7qVtQ>
    <xmx:9Hq1aLgkw69iHUPY6or9qoQaIw1TWjSchWSzA1fptxz66McIX_EmQw>
    <xmx:9Hq1aFZbdCaxOB2fHpewT5tdXr5AZRkB6S6fquiY00P928Ynz0jOIA>
    <xmx:9Hq1aEk4VHPabt1hvlzYS6PB64saYR-Rd8n7LodhrZixsx40EGb2Nw>
    <xmx:9Hq1aDhPNIARStH_lerfcMA78yvd3WD_Qb6DvlBJ5mIvWtwBegQiZQ>
    <xmx:9Xq1aJOLKaTeP3gIdhbF9nH59_Fj1kmbiVFrodnT2CUsPhl7XVwL6nMku74m>
Feedback-ID: ife053c87:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2] xen/flask: limit sidtable size
Date: Mon,  1 Sep 2025 13:52:31 +0300
Message-Id: <20250901105231.1570041-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Xen lacks a defined largest number of security IDs it can potentially
use. The number of SIDs are naturally limited by number of security contexts
provided by a given security policy, i.e. how many combination of user, role
and type there can be, and is dependant on the policy being used.
Since the policy is generally not known in advance the size of sidtable in Xen
has a rather high limit of UINT_MAX entries.

However in the embedded environment configured for safety it is desirable to
avoid guest-triggered dynamic memory allocations at runtime, or at least limit
them to some decent and predictable amounts. This patch provides a configuration
option to impose such a limit.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
  - use one config option instead of 2
  - use base 2 exponent

patch v1 here:
   https://lore.kernel.org/xen-devel/20250822095123.998313-1-Sergiy_Kibrik@epam.com/

 -Sergiy
---
 xen/common/Kconfig        | 11 +++++++++++
 xen/xsm/flask/ss/sidtab.c |  4 +++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 76f9ce705f..83bc9870dc 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -418,6 +418,17 @@ config XSM_FLASK_AVC_STATS
 
 	  If unsure, say Y.
 
+config XSM_FLASK_SIDTABLE_ORDER
+	int "Maximum number of security identifiers (base-2 exponent)" if EXPERT
+	range 4 32
+	default 32
+	depends on XSM_FLASK
+	help
+	  Limit the number of security identifiers allocated and operated by Xen.
+	  The value is a base-2 exponent. This will set the max number of SIDs
+	  and hence the max number of security contexts and heap memory
+	  allocated for SID table entries.
+
 config XSM_FLASK_POLICY
 	bool "Compile Xen with a built-in FLASK security policy"
 	default y if "$(XEN_HAS_CHECKPOLICY)" = "y"
diff --git a/xen/xsm/flask/ss/sidtab.c b/xen/xsm/flask/ss/sidtab.c
index 69fc3389b3..0081abdc86 100644
--- a/xen/xsm/flask/ss/sidtab.c
+++ b/xen/xsm/flask/ss/sidtab.c
@@ -14,6 +14,8 @@
 #include "security.h"
 #include "sidtab.h"
 
+#define SID_LIMIT ((1UL << CONFIG_XSM_FLASK_SIDTABLE_ORDER) - 1)
+
 #define SIDTAB_HASH(sid) ((sid) & SIDTAB_HASH_MASK)
 
 #define INIT_SIDTAB_LOCK(s) spin_lock_init(&(s)->lock)
@@ -228,7 +230,7 @@ int sidtab_context_to_sid(struct sidtab *s, struct context *context,
         if ( sid )
             goto unlock_out;
         /* No SID exists for the context.  Allocate a new one. */
-        if ( s->next_sid == UINT_MAX || s->shutdown )
+        if ( s->next_sid == SID_LIMIT || s->shutdown )
         {
             ret = -ENOMEM;
             goto unlock_out;
-- 
2.25.1


