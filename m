Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A54B25A562
	for <lists+xen-devel@lfdr.de>; Wed,  2 Sep 2020 08:10:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDLxX-0004Ek-7y; Wed, 02 Sep 2020 06:09:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kDLxV-0004Ef-MO
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2020 06:09:25 +0000
X-Inumbo-ID: e1487897-703d-44b6-b049-51f21d4df20c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1487897-703d-44b6-b049-51f21d4df20c;
 Wed, 02 Sep 2020 06:09:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98177AC24;
 Wed,  2 Sep 2020 06:09:24 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] tools/hotplug/Linux: don't needlessly use non-standard
 features in vif-{bridge,route}
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Message-ID: <a417690e-539c-b1b0-a372-3aea54d5dabd@suse.com>
Date: Wed, 2 Sep 2020 08:09:28 +0200
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
Fixes: 3683290fc0b0 ("tools/hotplug: only attempt to call 'ip route' if there is valid command")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Also adjust vif-route.

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
--- a/tools/hotplug/Linux/vif-route
+++ b/tools/hotplug/Linux/vif-route
@@ -22,17 +22,13 @@ dir=$(dirname "$0")
 main_ip=$(dom0_ip)
 
 case "${command}" in
-    add)
-        ;&
-    online)
+    add|online)
         ifconfig ${dev} ${main_ip} netmask 255.255.255.255 up
         echo 1 >/proc/sys/net/ipv4/conf/${dev}/proxy_arp
         ipcmd='add'
         cmdprefix=''
         ;;
-    remove)
-        ;&
-    offline)
+    remove|offline)
         do_without_error ifdown ${dev}
         ipcmd='del'
         cmdprefix='do_without_error'

