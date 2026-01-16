Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4E2D2B73D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 05:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206122.1519880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgbYG-0006AO-9V; Fri, 16 Jan 2026 04:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206122.1519880; Fri, 16 Jan 2026 04:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgbYG-00067m-5O; Fri, 16 Jan 2026 04:35:12 +0000
Received: by outflank-mailman (input) for mailman id 1206122;
 Fri, 16 Jan 2026 04:35:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vgbYF-00065r-M6
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 04:35:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vgbYD-006D19-2T;
 Fri, 16 Jan 2026 04:35:09 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vgbYD-005RCF-0d;
 Fri, 16 Jan 2026 04:35:09 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=cGX7QRPQV6chtt4Q4JiEAoLE9EjWPAngRkAOki5ArhA=; b=MTGsgyktOaUhTGAEmFmeY3oPtO
	v3DoCqpYE/umcFF5b65tq+71/Er3rsdyOQ8vOO8rO6JyU55vax5sq2ysCadb+fL7SQQ2xtuUd9lf+
	tp2JatXcsb3ogvFK2j3ixrXHnKMgtZzq6yFGsS6xlP3zEVSlzyD2qNZQ5E3LM6gQQ1vw=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v1 4/4] scripts/config: hook to automation build script
Date: Thu, 15 Jan 2026 20:34:58 -0800
Message-ID: <20260116043458.730728-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116043458.730728-1-dmukhin@ford.com>
References: <20260116043458.730728-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Use the new .config manipulation tool to toggle CONFIG_DEBUG in the
Xen automation build script.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/scripts/build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 7a81d229decd..ee1127c53dc5 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -27,7 +27,7 @@ else
     # Start off with arch's defconfig
     make -C xen defconfig
 
-    echo "CONFIG_DEBUG=${debug}" >> xen/.config
+    xen/scripts/config --file xen/.config -${debug} DEBUG
 
     if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
         echo "${EXTRA_XEN_CONFIG}" >> xen/.config
-- 
2.52.0


