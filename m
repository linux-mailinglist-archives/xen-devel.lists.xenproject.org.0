Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 547F2506BAE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 14:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308064.523565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngmar-0000WI-9t; Tue, 19 Apr 2022 12:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308064.523565; Tue, 19 Apr 2022 12:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngmar-0000US-6s; Tue, 19 Apr 2022 12:04:29 +0000
Received: by outflank-mailman (input) for mailman id 308064;
 Tue, 19 Apr 2022 12:04:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n3km=U5=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1ngmap-0000UM-O8
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 12:04:27 +0000
Received: from smarthost01c.sbp.mail.zen.net.uk
 (smarthost01c.sbp.mail.zen.net.uk [212.23.1.5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9f18a4a-bfd8-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 14:04:23 +0200 (CEST)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01c.sbp.mail.zen.net.uk with esmtpsa
 (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.90_1)
 (envelope-from <james@dingwall.me.uk>)
 id 1ngmai-0002GT-VS; Tue, 19 Apr 2022 12:04:21 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 4E30A3736E9;
 Tue, 19 Apr 2022 13:04:20 +0100 (BST)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id kOPXFhE8aXnS; Tue, 19 Apr 2022 13:04:20 +0100 (BST)
Received: from behemoth.dingwall.me.uk (behemoth.dingwall.me.uk [192.168.1.5])
 by dingwall.me.uk (Postfix) with ESMTP id 13E3E3736E4;
 Tue, 19 Apr 2022 13:04:20 +0100 (BST)
Received: by behemoth.dingwall.me.uk (Postfix, from userid 1000)
 id D91B2441D96; Tue, 19 Apr 2022 13:04:18 +0100 (BST)
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
X-Inumbo-ID: d9f18a4a-bfd8-11ec-a405-831a346695d4
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Tue, 19 Apr 2022 13:04:18 +0100
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, pdurrant@amazon.com
Subject: Re: [PATCH] fix invalid frontend path for set_mtu
Message-ID: <20220419120418.GA232637@dingwall.me.uk>
References: <20220301093513.GA3187840@dingwall.me.uk>
 <YlV4lXZHz52xPBzt@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <YlV4lXZHz52xPBzt@perard.uk.xensource.com>
X-Originating-smarthost01c-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anthony,

On Tue, Apr 12, 2022 at 02:03:17PM +0100, Anthony PERARD wrote:
> Hi James,
> 
> On Tue, Mar 01, 2022 at 09:35:13AM +0000, James Dingwall wrote:
> > The set_mtu() function of xen-network-common.sh currently has this code:
> > 
> >         if [ ${type_if} = vif ]
> >         then
> >             local dev_=${dev#vif}
> >             local domid=${dev_%.*}
> >             local devid=${dev_#*.}
> > 
> >             local FRONTEND_PATH="/local/domain/$domid/device/vif/$devid"
> > 
> >             xenstore_write "$FRONTEND_PATH/mtu" ${mtu}
> >         fi
> > 
> > This works fine if the device has its default name but if the xen config
> > defines the vifname parameter the FRONTEND_PATH is incorrectly constructed.
> > Learn the frontend path by reading the appropriate value from the backend.
> 
> The patch looks fine, thanks. It is only missing a line
> "Signed-off-by: your_name <your_email>" at the end of the description.
> The meaning of this line is described in the file CONTRIBUTING, section
> "Developer's Certificate of Origin".
> 

Thank you for your feedback.  I've updated the patch as suggested.  I've also
incorporated two other changes, one is a simple style change for consistency,
the other is to change a the test for a valid mtu from > 0 to >= 68.  I can
resubmit the original patch if either of these are a problem.

Thanks,
James

--Qxx1br4bt0+wmkIi
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="xen-network-common-frontend.patch"

commit 03ad5670f8a7402e30b288a55d088e87685cd1a1
Author: James Dingwall <james@dingwall.me.uk>
Date:   Tue Apr 19 12:45:31 2022 +0100

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
    
    Also change use of `...` to $(...) for a consistent style in the script
    and adjust the valid check from `mtu > 0` to `mtu >= 68` per RFC 791.
    
    Signed-off-by: James Dingwall <james@dingwall.me.uk>

diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
index 42fa704e8d..9a382c39f4 100644
--- a/tools/hotplug/Linux/xen-network-common.sh
+++ b/tools/hotplug/Linux/xen-network-common.sh
@@ -171,24 +171,20 @@ set_mtu () {
     local mtu=$(xenstore_read_default "$XENBUS_PATH/mtu" "")
     if [ -z "$mtu" ]
     then
-        mtu="`ip link show dev ${bridge}| awk '/mtu/ { print $5 }'`"
+        mtu="$(ip link show dev ${bridge}| awk '/mtu/ { print $5 }')"
         if [ -n "$mtu" ]
         then
             log debug "$bridge MTU is $mtu"
         fi
     fi
-    if [ -n "$mtu" ] && [ "$mtu" -gt 0 ]
+    if [ -n "$mtu" ] && [ "$mtu" -ge 68 ]
     then
         log debug "setting $dev MTU to $mtu"
         ip link set dev ${dev} mtu ${mtu} || :
 
         if [ ${type_if} = vif ]
         then
-            local dev_=${dev#vif}
-            local domid=${dev_%.*}
-            local devid=${dev_#*.}
-
-            local FRONTEND_PATH="/local/domain/$domid/device/vif/$devid"
+            local FRONTEND_PATH="$(xenstore_read "$XENBUS_PATH/frontend")"
 
             xenstore_write "$FRONTEND_PATH/mtu" ${mtu}
         fi

--Qxx1br4bt0+wmkIi--

