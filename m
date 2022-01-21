Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D63495FD8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 14:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259348.447566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAu4E-0004Hg-Rh; Fri, 21 Jan 2022 13:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259348.447566; Fri, 21 Jan 2022 13:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAu4E-0004Em-NT; Fri, 21 Jan 2022 13:35:02 +0000
Received: by outflank-mailman (input) for mailman id 259348;
 Fri, 21 Jan 2022 13:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ksCP=SF=dingwall.me.uk=james-xen@srs-se1.protection.inumbo.net>)
 id 1nAu4D-0004Ee-Ev
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 13:35:01 +0000
Received: from smarthost01b.ixn.mail.zen.net.uk
 (smarthost01b.ixn.mail.zen.net.uk [212.23.1.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecf02537-7abe-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 14:34:58 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01b.ixn.mail.zen.net.uk with esmtpsa
 (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.90_1)
 (envelope-from <james-xen@dingwall.me.uk>)
 id 1nAu49-0000zV-4n; Fri, 21 Jan 2022 13:34:57 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 19D58294836;
 Fri, 21 Jan 2022 13:34:56 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UMs7Ds1NWumz; Fri, 21 Jan 2022 13:34:56 +0000 (GMT)
Received: from webmail.private.dingwall.me.uk (apache0.xen.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:123])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTPSA id 02601294832;
 Fri, 21 Jan 2022 13:34:56 +0000 (GMT)
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
X-Inumbo-ID: ecf02537-7abe-11ec-bc18-3156f6d857e4
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 21 Jan 2022 13:34:54 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: possible kernel/libxl race with xl network-attach
In-Reply-To: <YeBPG+8D00xG4h0j@Air-de-Roger>
References: <20220113111946.GA4133739@dingwall.me.uk>
 <YeBPG+8D00xG4h0j@Air-de-Roger>
Message-ID: <1671ad485c35fb86d758951889cfa05d@dingwall.me.uk>
X-Sender: james-xen@dingwall.me.uk
X-Originating-smarthost01b-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

On 2022-01-13 16:11, Roger Pau Monné wrote:
> On Thu, Jan 13, 2022 at 11:19:46AM +0000, James Dingwall wrote:
>> 
>> I have been trying to debug a problem where a vif with the backend in 
>> a
>> driver domain is added to dom0.  Intermittently the hotplug script is
>> not invoked by libxl (running as xl devd) in the driver domain.  By
>> enabling some debug for the driver domain kernel and libxl I have 
>> these
>> messages:
>> 
>> driver domain kernel (Ubuntu 5.4.0-92-generic):
>> 
>> [Thu Jan 13 01:39:31 2022] [1408] 564: vif vif-0-0 vif0.0: 
>> Successfully created xenvif
>> [Thu Jan 13 01:39:31 2022] [26] 583: xen_netback:frontend_changed: 
>> /local/domain/0/device/vif/0 -> Initialising
>> [Thu Jan 13 01:39:31 2022] [26] 470: xen_netback:backend_switch_state: 
>> backend/vif/0/0 -> InitWait
>> [Thu Jan 13 01:39:31 2022] [26] 583: xen_netback:frontend_changed: 
>> /local/domain/0/device/vif/0 -> Connected
>> [Thu Jan 13 01:39:31 2022] vif vif-0-0 vif0.0: Guest Rx ready
>> [Thu Jan 13 01:39:31 2022] [26] 470: xen_netback:backend_switch_state: 
>> backend/vif/0/0 -> Connected
>> 
>> xl devd (Xen 4.14.3):
>> 
>> 2022-01-13 01:39:31 UTC libxl: debug: 
>> libxl_event.c:750:watchfd_callback: watch w=0x7ffd416b0528 
>> wpath=/local/domain/2/backend token=3/0: event 
>> epath=/local/domain/2/backend/vif/0/0/state
>> 2022-01-13 01:39:31 UTC libxl: debug: 
>> libxl_event.c:2445:libxl__nested_ao_create: ao 0x5633ac569700: nested 
>> ao, parent 0x5633ac567f90
>> 2022-01-13 01:39:31 UTC libxl: debug: 
>> libxl_event.c:750:watchfd_callback: watch w=0x5633ac569180 
>> wpath=/local/domain/2/backend/vif/0/0/state token=2/1: event 
>> epath=/local/domain/2/backend/vif/0/0/state
>> 2022-01-13 01:39:31 UTC libxl: debug: 
>> libxl_event.c:1055:devstate_callback: backend 
>> /local/domain/2/backend/vif/0/0/state wanted state 2 still waiting 
>> state 4
>> 2022-01-13 01:39:31 UTC libxl: debug: 
>> libxl_event.c:750:watchfd_callback: watch w=0x7ffd416b0528 
>> wpath=/local/domain/2/backend token=3/0: event 
>> epath=/local/domain/2/backend/vif/0/0/state
>> 2022-01-13 01:39:31 UTC libxl: debug: 
>> libxl_event.c:2445:libxl__nested_ao_create: ao 0x5633ac56a220: nested 
>> ao, parent 0x5633ac567f90
>> 2022-01-13 01:39:31 UTC libxl: debug: 
>> libxl_event.c:750:watchfd_callback: watch w=0x5633ac569180 
>> wpath=/local/domain/2/backend/vif/0/0/state token=2/1: event 
>> epath=/local/domain/2/backend/vif/0/0/state
>> 2022-01-13 01:39:31 UTC libxl: debug: 
>> libxl_event.c:1055:devstate_callback: backend 
>> /local/domain/2/backend/vif/0/0/state wanted state 2 still waiting 
>> state 4
>> 2022-01-13 01:39:51 UTC libxl: debug: 
>> libxl_aoutils.c:88:xswait_timeout_callback: backend 
>> /local/domain/2/backend/vif/0/0/state (hoping for state change to 2): 
>> xswait timeout (path=/local/domain/2/backend/vif/0/0/state)
>> 2022-01-13 01:39:51 UTC libxl: debug: 
>> libxl_event.c:850:libxl__ev_xswatch_deregister: watch w=0x5633ac569180 
>> wpath=/local/domain/2/backend/vif/0/0/state token=2/1: deregister 
>> slotnum=2
>> 2022-01-13 01:39:51 UTC libxl: debug: 
>> libxl_event.c:1039:devstate_callback: backend 
>> /local/domain/2/backend/vif/0/0/state wanted state 2  timed out
>> 2022-01-13 01:39:51 UTC libxl: debug: 
>> libxl_event.c:864:libxl__ev_xswatch_deregister: watch 
>> w=0x5633ac569180: deregister unregistered
>> 2022-01-13 01:39:51 UTC libxl: debug: 
>> libxl_device.c:1092:device_backend_callback: calling 
>> device_backend_cleanup
>> 2022-01-13 01:39:51 UTC libxl: debug: 
>> libxl_event.c:864:libxl__ev_xswatch_deregister: watch 
>> w=0x5633ac569180: deregister unregistered
>> 2022-01-13 01:39:51 UTC libxl: error: 
>> libxl_device.c:1105:device_backend_callback: unable to add device with 
>> path /local/domain/2/backend/vif/0/0
>> 2022-01-13 01:39:51 UTC libxl: debug: 
>> libxl_event.c:864:libxl__ev_xswatch_deregister: watch 
>> w=0x5633ac569280: deregister unregistered
>> 2022-01-13 01:39:51 UTC libxl: debug: 
>> libxl_device.c:1470:device_complete: device 
>> /local/domain/2/backend/vif/0/0 add failed
>> 2022-01-13 01:39:51 UTC libxl: debug: 
>> libxl_event.c:2035:libxl__ao__destroy: ao 0x5633ac568f30: destroy
>> 
>> the xenstore content for the backend:
>> 
>> # xenstore-ls /local/domain/2/backend/vif/0
>> 0 = ""
>>  frontend = "/local/domain/0/device/vif/0"
>>  frontend-id = "0"
>>  online = "1"
>>  state = "4"
>>  script = "/etc/xen/scripts/vif-zynstra"
>>  vifname = "dom0.0"
>>  mac = "00:16:3e:6c:de:82"
>>  bridge = "cluster"
>>  handle = "0"
>>  type = "vif"
>>  feature-sg = "1"
>>  feature-gso-tcpv4 = "1"
>>  feature-gso-tcpv6 = "1"
>>  feature-ipv6-csum-offload = "1"
>>  feature-rx-copy = "1"
>>  feature-rx-flip = "0"
>>  feature-multicast-control = "1"
>>  feature-dynamic-multicast-control = "1"
>>  feature-split-event-channels = "1"
>>  multi-queue-max-queues = "2"
>>  feature-ctrl-ring = "1"
>>  hotplug-status = "connected"
>> 
>> My guess is that the libxl callback is started waiting for the backend
>> state key to be set to XenbusStateInitWait (2) but the frontend in 
>> dom0
>> has already triggered the backend to transition to 
>> XenbusStateConnected
>> (4) and therefore it does not successfully complete.
> 
> I think your analysis is correct. The question is who sets
> hotplug-status to "connected" in xenstore if the hotplug script in the
> driver domain hasn't been launched by `xl devd`.
> 
> It would seem to me some other entity is launching the hotplug
> scripts, do you have some udev rules in the driver domain that do that
> and race with `xl devd` maybe?

No, there are no udev rules for xen network devices.  What it looks like 
is that the in linux/drivers/net/xen-netback/xenbus.c that the backend 
state is changed to XenbusStateConnected in response to 
frontend_changed() being called and the frontend state is 
XenbusStateConnected.  The xen-frontend.c driver has:

         case XenbusStateInitWait:
                 if (dev->state != XenbusStateInitialising)
                         break;
                 if (xennet_connect(netdev) != 0)
                         break;
                 xenbus_switch_state(dev, XenbusStateConnected);
                 break;

so it seems that if this completes in the domain with the frontend then 
the backend can process this state change before `xl devd` is launched 
and it completely misses the window where the backend state was 
XenbusStateInitWait.

This is the patch I have come up with as a workaround:

diff --git a/tools/libxl/libxl_event.c b/tools/libxl/libxl_event.c
index 7c5387e94f..408afa6ee6 100644
--- a/tools/libxl/libxl_event.c
+++ b/tools/libxl/libxl_event.c
@@ -1052,6 +1052,12 @@ static void devstate_callback(libxl__egc *egc, 
libxl__xswait_state *xsw,
          LOG(DEBUG, "backend %s wanted state %d ok", ds->w.path, 
ds->wanted);
          rc = 0;
      } else {
+        if (ds->wanted == XenbusStateInitWait && got == 
XenbusStateConnected) {
+            LOG(DEBUG, "backend %s wanted state %d interpreting"
+                " state %d as success", ds->w.path, ds->wanted, got);
+            rc = 0;
+            goto out;
+        }
          LOG(DEBUG, "backend %s wanted state %d"" still waiting state 
%d",
              ds->w.path, ds->wanted, got);
          return;

Thanks,
James

