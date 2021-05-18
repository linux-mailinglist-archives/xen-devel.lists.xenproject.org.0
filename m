Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE738786A
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 14:04:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129126.242404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liySJ-0006NT-Sa; Tue, 18 May 2021 12:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129126.242404; Tue, 18 May 2021 12:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liySJ-0006KS-PC; Tue, 18 May 2021 12:04:11 +0000
Received: by outflank-mailman (input) for mailman id 129126;
 Tue, 18 May 2021 12:04:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4/q=KN=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1liySH-00061r-Th
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 12:04:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2bf2292-acc3-4494-8e46-f23a1392c8d4;
 Tue, 18 May 2021 12:04:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D168AE4D;
 Tue, 18 May 2021 12:04:08 +0000 (UTC)
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
X-Inumbo-ID: e2bf2292-acc3-4494-8e46-f23a1392c8d4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621339448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ShVArUyOIEVD2D6Itz0h2kIqNU7o0HPqwOJHjk14MSo=;
	b=cBfB0klVUc0lnpdiDqIF2AlRDRju4JYcXjkVCwdwexwjHvWWjW/nQqUoBtEcQOqdCOB928
	KYG9P+k+5oO3fI5DEYtE9YQp0Wxu9CNQp8Zy5L2XG07GkTcsOSc5NBBIIMZiuUmKvWHvE5
	HnkA+qAbwWkGZTSHhFEMpal6L0z04hk=
Subject: [PATCH 1/2] automation: use DOCKER_CMD for building containers too
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Date: Tue, 18 May 2021 14:04:07 +0200
Message-ID: <162133944760.25010.12549941575201320853.stgit@Wayrath>
In-Reply-To: <162133919718.25010.4197057069904956422.stgit@Wayrath>
References: <162133919718.25010.4197057069904956422.stgit@Wayrath>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Dario Faggioli <dario@Solace.fritz.box>

Use DOCKER_CMD from the environment (if defined) in the containers'
makefile too, so that, e.g., when doing `export DOCKED_CMD=podman`
podman is used for building the containers too.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
---
 automation/build/Makefile |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/automation/build/Makefile b/automation/build/Makefile
index 7c7612b1d9..a4b2b85178 100644
--- a/automation/build/Makefile
+++ b/automation/build/Makefile
@@ -2,6 +2,7 @@
 # the base of where these containers will appear
 REGISTRY := registry.gitlab.com/xen-project/xen
 CONTAINERS = $(subst .dockerfile,,$(wildcard */*.dockerfile))
+DOCKER_CMD ?= docker
 
 help:
 	@echo "Builds containers for building Xen based on different distros"
@@ -10,9 +11,9 @@ help:
 	@echo "To push container builds, set the env var PUSH"
 
 %: %.dockerfile ## Builds containers
-	docker build -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
+	$(DOCKER_CMD) build -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
 	@if [ ! -z $${PUSH+x} ]; then \
-		docker push $(REGISTRY)/$(@D):$(@F); \
+		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
 	fi
 
 .PHONY: all



