Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D984C8815
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 10:35:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281047.479214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOyub-00088T-A4; Tue, 01 Mar 2022 09:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281047.479214; Tue, 01 Mar 2022 09:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOyub-00085v-62; Tue, 01 Mar 2022 09:35:17 +0000
Received: by outflank-mailman (input) for mailman id 281047;
 Tue, 01 Mar 2022 09:35:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qMbA=TM=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1nOyuZ-00085p-PA
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 09:35:15 +0000
Received: from smarthost01a.sbp.mail.zen.net.uk
 (smarthost01a.sbp.mail.zen.net.uk [212.23.1.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5d286bd-9942-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 10:35:14 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01a.sbp.mail.zen.net.uk with esmtpsa
 (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.90_1)
 (envelope-from <james@dingwall.me.uk>)
 id 1nOyuY-00071n-54; Tue, 01 Mar 2022 09:35:14 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 93F462EE67F;
 Tue,  1 Mar 2022 09:35:13 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zaf6TsOvbNxP; Tue,  1 Mar 2022 09:35:13 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:1c8])
 by dingwall.me.uk (Postfix) with ESMTP id 739732EE67C;
 Tue,  1 Mar 2022 09:35:13 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 5FCF42E; Tue,  1 Mar 2022 09:35:13 +0000 (GMT)
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
X-Inumbo-ID: e5d286bd-9942-11ec-8539-5f4723681683
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Tue, 1 Mar 2022 09:35:13 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Cc: pdurrant@amazon.com
Subject: [PATCH] fix invalid frontend path for set_mtu
Message-ID: <20220301093513.GA3187840@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01a-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

Hi,

The set_mtu() function of xen-network-common.sh currently has this code:

        if [ ${type_if} = vif ]
        then
            local dev_=${dev#vif}
            local domid=${dev_%.*}
            local devid=${dev_#*.}

            local FRONTEND_PATH="/local/domain/$domid/device/vif/$devid"

            xenstore_write "$FRONTEND_PATH/mtu" ${mtu}
        fi

This works fine if the device has its default name but if the xen config
defines the vifname parameter the FRONTEND_PATH is incorrectly constructed.
Learn the frontend path by reading the appropriate value from the backend.

diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
index 02e2388600..cd98f0d486 100644
--- a/tools/hotplug/Linux/xen-network-common.sh
+++ b/tools/hotplug/Linux/xen-network-common.sh
@@ -163,11 +163,7 @@ set_mtu () {
 
         if [ ${type_if} = vif ]
         then
-            local dev_=${dev#vif}
-            local domid=${dev_%.*}
-            local devid=${dev_#*.}
-
-            local FRONTEND_PATH="/local/domain/$domid/device/vif/$devid"
+            local FRONTEND_PATH=$(xenstore_read "$XENBUS_PATH/frontend")
 
             xenstore_write "$FRONTEND_PATH/mtu" ${mtu}
         fi



Thanks,
James

