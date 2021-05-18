Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DA8387DD6
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 18:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129457.242993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2nq-0005PR-Er; Tue, 18 May 2021 16:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129457.242993; Tue, 18 May 2021 16:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2nq-0005Mj-Aa; Tue, 18 May 2021 16:42:42 +0000
Received: by outflank-mailman (input) for mailman id 129457;
 Tue, 18 May 2021 16:42:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4/q=KN=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lj2np-0005MN-H6
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 16:42:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85f1c055-f329-43d9-81f6-06d9b7c2226a;
 Tue, 18 May 2021 16:42:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 244E8AEA8;
 Tue, 18 May 2021 16:42:40 +0000 (UTC)
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
X-Inumbo-ID: 85f1c055-f329-43d9-81f6-06d9b7c2226a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621356160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yoL84o6smbYpcuGm8W7AhLmby+UbYQ66wf/eTVj8DXo=;
	b=IjHtJqvEmLTSax8FqNaEk2E5FA38npg4/KtL8yqaSTXffAivemIpLb701s0pHjbASHZIAh
	J4m3t8HowHBRl5eoB1k+88XOhitvrBR9vNypHFimZRI5M/2sbpwnHqxYPwr8JWLc9aJrSO
	aJQk7OO55aXuiNO6POtWCdOj08BmCXM=
Subject: [PATCH v2 1/2] automation: use DOCKER_CMD for building containers too
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Date: Tue, 18 May 2021 18:42:39 +0200
Message-ID: <162135615931.20014.4296434793748937843.stgit@Wayrath>
In-Reply-To: <162135593827.20014.14959979363028895972.stgit@Wayrath>
References: <162135593827.20014.14959979363028895972.stgit@Wayrath>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Use DOCKER_CMD from the environment (if defined) in the containers'
makefile too, so that, e.g., when doing `export DOCKED_CMD=podman`
podman is used for building the containers too.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes from v1:
- fix my email address in From:
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



