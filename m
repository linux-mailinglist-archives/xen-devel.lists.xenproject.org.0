Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29067258C70
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 12:11:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD3FW-0002zm-JO; Tue, 01 Sep 2020 10:10:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kD3FU-0002zh-Nq
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 10:10:44 +0000
X-Inumbo-ID: 76c46fd0-df93-4048-b148-7bc53e5f7dcb
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76c46fd0-df93-4048-b148-7bc53e5f7dcb;
 Tue, 01 Sep 2020 10:10:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA951B05D;
 Tue,  1 Sep 2020 10:10:42 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tools/hotplug/Linux: don't needlessly use non-standard
 features in vif-bridge
Message-ID: <4b71b1e6-c6a9-b4b8-76a0-01417d10ffb4@suse.com>
Date: Tue, 1 Sep 2020 12:10:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We're not after any "fall-through" behavior here. Replace the constructs
with ones understood by all conforming shells, including older bash
(problem observed with 3.1.51(1)).

Fixes: b51715f02bf9 ("tools/hotplug/Linux: remove code duplication in vif-bridge")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/hotplug/Linux/vif-bridge
+++ b/tools/hotplug/Linux/vif-bridge
@@ -77,16 +77,12 @@ then
 fi
 
 case "$command" in
-    add)
-        ;&
-    online)
+    add|online)
         setup_virtual_bridge_port "$dev"
         set_mtu "$bridge" "$dev" "$type_if"
         add_to_bridge "$bridge" "$dev"
         ;;
-    remove)
-        ;&
-    offline)
+    remove|offline)
         remove_from_bridge "$bridge" "$dev"
         ;;
 esac

