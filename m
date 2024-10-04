Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D4998FC54
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 04:30:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809930.1222501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swY4y-0005aR-KC; Fri, 04 Oct 2024 02:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809930.1222501; Fri, 04 Oct 2024 02:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swY4y-0005UC-Ex; Fri, 04 Oct 2024 02:30:04 +0000
Received: by outflank-mailman (input) for mailman id 809930;
 Fri, 04 Oct 2024 02:30:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+dN=RA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1swY4w-0004wg-Mn
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 02:30:02 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c202c97-81f8-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 04:29:58 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 1CBD611400EA;
 Thu,  3 Oct 2024 22:29:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 03 Oct 2024 22:29:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Oct 2024 22:29:55 -0400 (EDT)
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
X-Inumbo-ID: 8c202c97-81f8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1728008996; x=1728095396; bh=OizhH49JgJ
	MFP9tqWTb7RhW7NtKKGQLwUXUgz3F/Jk0=; b=a+RsE5TuUBVpblgTjhOFnFpQPf
	HAEMuUoC0AvyugD6xkKJeqgl9d38NA97xjgihZdBBZv4yJCVXgaIpybky5T/0mDd
	oNSipYanV8lYZUO9OvuCAW3oaT/OM8xqtFmkx8SpADVH/stIGoK6oZOwikAEVwsg
	MHSy8vi3vqvF1ehlREL8bX9iCxBC/kaZJQfmjh38u/1oPPR9S3kK2xhllfxzcEsB
	s151sNcgY2polqRhSCZGc5UcstQXaMXgJT5KqDmv+194ebJVJAL8P1QQsfcSJHhU
	9R9RsM3rFrYgGBvzEkoiZ+rVDWFjim8x7jieqodEzYYppet4IiwSR2RHTVuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728008996; x=
	1728095396; bh=OizhH49JgJMFP9tqWTb7RhW7NtKKGQLwUXUgz3F/Jk0=; b=e
	nBczmOrNoucJM4nK8yIwL0Rh6DsRVmeKwmE0TI91NaKISOImMj0uXVB8ge6lfpMU
	o4jqxDHUvVLlQtDIihiqqLADbfy16hLqWlWFKtzLZHeyy4V84De7qnE2dt+6Nx7u
	Q0I6ViFFU4Eze9iDScSZC2/vP/oIyMWxPY3qYkuc6kSUWPt92YO1Xp+538wS1q+0
	zoVKW1Gm4B6+AcxBZjxaKDVhZx/I/iEXVLA+Ck+D3Dt4f1IU8/rJC1wQCGeZQYfx
	92MBgdzfjX7lAexAYA+oCRbIeFS/3Y86FbehxlUk+D/9tusvYrGrA5EalETDbs30
	fZ8kIdouy4frKoExf6yMg==
X-ME-Sender: <xms:JFP_Zrqguw7PlYjFu2aU55InBPAJDAnv1Ory7DeJvmbOGExj4-tK2w>
    <xme:JFP_ZlqnuJe5Zm1Fy0Rt6lTFjr40nJLRT3QvR9XAVIGmUgGvzyWaooLDzjyC7wKY-
    GgghUM8aYuXvA>
X-ME-Received: <xmr:JFP_ZoN1UsrTqCozW-36N1JuUeu1e8-Oq9zPgM2IlgKon_10iN6Dk3GPlKtc8RcBkD8kAAhgNQ1L3pfdXGNWKxU5wYRjDDeG5rN0U6VJxZ0Ghb-vOn0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvvddgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegvedute
    euiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghn
    qdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhope
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghp
    thhtoheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvg
    hllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:JFP_Zu4mV25Y96hniHjRiHWqBPyXnACq3DN8BNpMWZlAFA7ZmBum9w>
    <xmx:JFP_Zq4rwcsfvPfCGq4w4EngK61w-nh_rB7aOowIZY664xXau-nZmg>
    <xmx:JFP_ZmiJzPeAb8yxhT08RxTte5KnGwDmwLmg9fg9laB0hh0rXIRzOA>
    <xmx:JFP_Zs6CB5R5yk0rmBo0HDM5KWK8xJsnz0o5mzUp2eOesS3RMcc_xA>
    <xmx:JFP_Zgm0ZVSbsfV7kT6O99qfwQesS5pgI7ZzLudmR_ii3umkqHl7XdJ4>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/3] automation: preserve built xen.efi
Date: Fri,  4 Oct 2024 04:29:37 +0200
Message-ID: <ef79d2ffd9b2bad03094b5f08d7e994764d63208.1728008940.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1bb6f2ab5669356ea3ff954b7c324d2f31c19399.1728008940.git-series.marmarek@invisiblethingslab.com>
References: <cover.1bb6f2ab5669356ea3ff954b7c324d2f31c19399.1728008940.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It will be useful for further tests.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
- deduplicate via collect_xen_artifacts function
---
 automation/scripts/build | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index b3c71fb6fb60..302feeed2eea 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -41,19 +41,29 @@ cp xen/.config xen-config
 # Directory for the artefacts to be dumped into
 mkdir -p binaries
 
+collect_xen_artifacts()
+{
+    local f
+    for f in xen/xen xen/xen.efi; do
+        if [[ -f $f ]]; then
+            cp $f binaries/
+        fi
+    done
+}
+
 if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     # Cppcheck analysis invokes Xen-only build
     xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j$(nproc)
 
     # Preserve artefacts
-    cp xen/xen binaries/xen
+    collect_xen_artifacts
     cp xen/cppcheck-report/xen-cppcheck.txt xen-cppcheck.txt
 elif [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     # Xen-only build
     make -j$(nproc) xen
 
     # Preserve artefacts
-    cp xen/xen binaries/xen
+    collect_xen_artifacts
 else
     # Full build.  Figure out our ./configure options
     cfgargs=()
@@ -101,5 +111,5 @@ else
     # even though dist/ contains everything, while some containers don't even
     # build Xen
     cp -r dist binaries/
-    if [[ -f xen/xen ]] ; then cp xen/xen binaries/xen; fi
+    collect_xen_artifacts
 fi
-- 
git-series 0.9.1

