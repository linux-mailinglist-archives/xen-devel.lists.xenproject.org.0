Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61048BAF27
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 16:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716523.1118726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2u6f-0003hi-Lc; Fri, 03 May 2024 14:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716523.1118726; Fri, 03 May 2024 14:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2u6f-0003ej-HF; Fri, 03 May 2024 14:41:49 +0000
Received: by outflank-mailman (input) for mailman id 716523;
 Fri, 03 May 2024 14:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QA1=MG=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s2u6e-0002U8-84
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 14:41:48 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41cc7170-095b-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 16:41:44 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id DF4528009F;
 Fri,  3 May 2024 15:41:41 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id ACED82018B; Fri,  3 May 2024 15:41:41 +0100 (BST)
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
X-Inumbo-ID: 41cc7170-095b-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1714747301;
	bh=t0vnuYLk59oT/1dlHfshijBhS9X5czFtKDiWa/l8Kes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ooJVneUZTiXWaJZJAdl794ELI5sa5+myNhpJEMY/4OrE4hQ2pYvW+sgx/FuPRdLJJ
	 ILZLQRguSOz6HlG5PubvaGkKXAazeNqAnkOJOiiABst7mFGZ8kWMxsnwu/oLLxjlbp
	 xfdffJrTef0+bl/YRyKs2yCjvo4k5QfRs6KuM1NM=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [RFC PATCH 3/5] tools/hotplug/Linux: Add bridge VLAN support
Date: Fri,  3 May 2024 15:41:22 +0100
Message-Id: <20240503144124.12931-4-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503144124.12931-1-leigh@solinno.co.uk>
References: <20240503144124.12931-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update add_to_bridge shell function to read the vid parameter
from xenstore and set the bridge LAN for the VID to the given
value. This only works when using the iproute2 bridge command,
so a warning is issued if using the legacy brctl command and a
vid is set.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 tools/hotplug/Linux/xen-network-common.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
index 42fa704e8d..19a8b3c7e5 100644
--- a/tools/hotplug/Linux/xen-network-common.sh
+++ b/tools/hotplug/Linux/xen-network-common.sh
@@ -125,14 +125,23 @@ create_bridge () {
 add_to_bridge () {
     local bridge=$1
     local dev=$2
+    local vid=$(xenstore_read_default "$XENBUS_PATH/vid" "")
 
     # Don't add $dev to $bridge if it's already on the bridge.
     if [ ! -e "/sys/class/net/${bridge}/brif/${dev}" ]; then
         log debug "adding $dev to bridge $bridge"
         if which brctl >&/dev/null; then
             brctl addif ${bridge} ${dev}
+            if [ -n "${vid}" ] ;then
+                log warning "bridge command not available, ignoring vid"
+            fi
         else
             ip link set ${dev} master ${bridge}
+            if [ -n "${vid}" ] ;then
+                log debug "Assigning $dev to vid $vid"
+                bridge vlan del dev ${dev} vid 1
+                bridge vlan add dev ${dev} vid ${vid} pvid untagged
+            fi
         fi
     else
         log debug "$dev already on bridge $bridge"
-- 
2.39.2


