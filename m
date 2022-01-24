Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D31C498143
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 14:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259871.448589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBzYi-00065c-9C; Mon, 24 Jan 2022 13:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259871.448589; Mon, 24 Jan 2022 13:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBzYi-00062Z-5t; Mon, 24 Jan 2022 13:39:00 +0000
Received: by outflank-mailman (input) for mailman id 259871;
 Mon, 24 Jan 2022 13:38:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ovR=SI=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1nBzYg-00062T-7g
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 13:38:58 +0000
Received: from smarthost01b.sbp.mail.zen.net.uk
 (smarthost01b.sbp.mail.zen.net.uk [212.23.1.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f915b38d-7d1a-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 14:38:54 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01b.sbp.mail.zen.net.uk with esmtpsa
 (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.90_1)
 (envelope-from <james@dingwall.me.uk>)
 id 1nBzYY-00007p-Fk; Mon, 24 Jan 2022 13:38:50 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 2761529956E;
 Mon, 24 Jan 2022 13:38:50 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1v-A-duL4c7; Mon, 24 Jan 2022 13:38:50 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk [192.168.1.200])
 by dingwall.me.uk (Postfix) with ESMTP id 065CC29956B;
 Mon, 24 Jan 2022 13:38:50 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 005FD230; Mon, 24 Jan 2022 13:38:49 +0000 (GMT)
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
X-Inumbo-ID: f915b38d-7d1a-11ec-8fa7-f31e035a9116
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Mon, 24 Jan 2022 13:38:49 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: possible kernel/libxl race with xl network-attach
Message-ID: <20220124133849.GA1775507@dingwall.me.uk>
References: <20220113111946.GA4133739@dingwall.me.uk>
 <YeBPG+8D00xG4h0j@Air-de-Roger>
 <1671ad485c35fb86d758951889cfa05d@dingwall.me.uk>
 <Yeq8fdOWLngcjDH8@Air-de-Roger>
 <20220121150507.GA954743@dingwall.me.uk>
 <Ye5sarMTn23g6eGi@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ye5sarMTn23g6eGi@Air-de-Roger>
X-Originating-smarthost01b-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

On Mon, Jan 24, 2022 at 10:07:54AM +0100, Roger Pau Monné wrote:
> On Fri, Jan 21, 2022 at 03:05:07PM +0000, James Dingwall wrote:
> > On Fri, Jan 21, 2022 at 03:00:29PM +0100, Roger Pau Monné wrote:
> > > On Fri, Jan 21, 2022 at 01:34:54PM +0000, James Dingwall wrote:
> > > > On 2022-01-13 16:11, Roger Pau Monné wrote:
> > > > > On Thu, Jan 13, 2022 at 11:19:46AM +0000, James Dingwall wrote:
> > > > > > 
> > > > > > I have been trying to debug a problem where a vif with the backend
> > > > > > in a
> > > > > > driver domain is added to dom0.  Intermittently the hotplug script is
> > > > > > not invoked by libxl (running as xl devd) in the driver domain.  By
> > > > > > enabling some debug for the driver domain kernel and libxl I have
> > > > > > these
> > > > > > messages:
> > > > > > 
> > > > > > driver domain kernel (Ubuntu 5.4.0-92-generic):
> > > > > > 
> > > > > > [Thu Jan 13 01:39:31 2022] [1408] 564: vif vif-0-0 vif0.0:
> > > > > > Successfully created xenvif
> > > > > > [Thu Jan 13 01:39:31 2022] [26] 583: xen_netback:frontend_changed:
> > > > > > /local/domain/0/device/vif/0 -> Initialising
> > > > > > [Thu Jan 13 01:39:31 2022] [26] 470:
> > > > > > xen_netback:backend_switch_state: backend/vif/0/0 -> InitWait
> > > > > > [Thu Jan 13 01:39:31 2022] [26] 583: xen_netback:frontend_changed:
> > > > > > /local/domain/0/device/vif/0 -> Connected
> > > > > > [Thu Jan 13 01:39:31 2022] vif vif-0-0 vif0.0: Guest Rx ready
> > > > > > [Thu Jan 13 01:39:31 2022] [26] 470:
> > > > > > xen_netback:backend_switch_state: backend/vif/0/0 -> Connected
> > > > > > 
> > > > > > xl devd (Xen 4.14.3):
> > > > > > 
> > > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > > libxl_event.c:750:watchfd_callback: watch w=0x7ffd416b0528
> > > > > > wpath=/local/domain/2/backend token=3/0: event
> > > > > > epath=/local/domain/2/backend/vif/0/0/state
> > > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > > libxl_event.c:2445:libxl__nested_ao_create: ao 0x5633ac569700:
> > > > > > nested ao, parent 0x5633ac567f90
> > > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > > libxl_event.c:750:watchfd_callback: watch w=0x5633ac569180
> > > > > > wpath=/local/domain/2/backend/vif/0/0/state token=2/1: event
> > > > > > epath=/local/domain/2/backend/vif/0/0/state
> > > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > > libxl_event.c:1055:devstate_callback: backend
> > > > > > /local/domain/2/backend/vif/0/0/state wanted state 2 still waiting
> > > > > > state 4
> > > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > > libxl_event.c:750:watchfd_callback: watch w=0x7ffd416b0528
> > > > > > wpath=/local/domain/2/backend token=3/0: event
> > > > > > epath=/local/domain/2/backend/vif/0/0/state
> > > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > > libxl_event.c:2445:libxl__nested_ao_create: ao 0x5633ac56a220:
> > > > > > nested ao, parent 0x5633ac567f90
> > > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > > libxl_event.c:750:watchfd_callback: watch w=0x5633ac569180
> > > > > > wpath=/local/domain/2/backend/vif/0/0/state token=2/1: event
> > > > > > epath=/local/domain/2/backend/vif/0/0/state
> > > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > > libxl_event.c:1055:devstate_callback: backend
> > > > > > /local/domain/2/backend/vif/0/0/state wanted state 2 still waiting
> > > > > > state 4
> > > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > > libxl_aoutils.c:88:xswait_timeout_callback: backend
> > > > > > /local/domain/2/backend/vif/0/0/state (hoping for state change to
> > > > > > 2): xswait timeout (path=/local/domain/2/backend/vif/0/0/state)
> > > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > > libxl_event.c:850:libxl__ev_xswatch_deregister: watch
> > > > > > w=0x5633ac569180 wpath=/local/domain/2/backend/vif/0/0/state
> > > > > > token=2/1: deregister slotnum=2
> > > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > > libxl_event.c:1039:devstate_callback: backend
> > > > > > /local/domain/2/backend/vif/0/0/state wanted state 2  timed out
> > > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > > libxl_event.c:864:libxl__ev_xswatch_deregister: watch
> > > > > > w=0x5633ac569180: deregister unregistered
> > > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > > libxl_device.c:1092:device_backend_callback: calling
> > > > > > device_backend_cleanup
> > > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > > libxl_event.c:864:libxl__ev_xswatch_deregister: watch
> > > > > > w=0x5633ac569180: deregister unregistered
> > > > > > 2022-01-13 01:39:51 UTC libxl: error:
> > > > > > libxl_device.c:1105:device_backend_callback: unable to add device
> > > > > > with path /local/domain/2/backend/vif/0/0
> > > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > > libxl_event.c:864:libxl__ev_xswatch_deregister: watch
> > > > > > w=0x5633ac569280: deregister unregistered
> > > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > > libxl_device.c:1470:device_complete: device
> > > > > > /local/domain/2/backend/vif/0/0 add failed
> > > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > > libxl_event.c:2035:libxl__ao__destroy: ao 0x5633ac568f30: destroy
> > > > > > 
> > > > > > the xenstore content for the backend:
> > > > > > 
> > > > > > # xenstore-ls /local/domain/2/backend/vif/0
> > > > > > 0 = ""
> > > > > >  frontend = "/local/domain/0/device/vif/0"
> > > > > >  frontend-id = "0"
> > > > > >  online = "1"
> > > > > >  state = "4"
> > > > > >  script = "/etc/xen/scripts/vif-zynstra"
> > > > > >  vifname = "dom0.0"
> > > > > >  mac = "00:16:3e:6c:de:82"
> > > > > >  bridge = "cluster"
> > > > > >  handle = "0"
> > > > > >  type = "vif"
> > > > > >  feature-sg = "1"
> > > > > >  feature-gso-tcpv4 = "1"
> > > > > >  feature-gso-tcpv6 = "1"
> > > > > >  feature-ipv6-csum-offload = "1"
> > > > > >  feature-rx-copy = "1"
> > > > > >  feature-rx-flip = "0"
> > > > > >  feature-multicast-control = "1"
> > > > > >  feature-dynamic-multicast-control = "1"
> > > > > >  feature-split-event-channels = "1"
> > > > > >  multi-queue-max-queues = "2"
> > > > > >  feature-ctrl-ring = "1"
> > > > > >  hotplug-status = "connected"
> > > 
> > > The relevant point here is that `hotplug-status = "connected"` in the
> > > backend xenstore nodes, and that's set by the hotplug script.
> > > 
> > > Having hotplug-status == "connected" will allow the backend to proceed
> > > to the connected state, so there's some component in your system that
> > > sets this xenstore node before `xl devd` get a change to run the
> > > hotplug script, hence me asking for any udev rules in the previous
> > > email.
> > > 
> > > If it's not an udev rule then I'm lost. Do you have any modifications
> > > to the Xen tools that could set this xenstore node?
> > 
> > I am wondering if that xenstore content was captured after the environment
> > had been manually fixed.  I have been able to reproduce it by hotplugging
> > an interface where libxl isn't patched:
> > 
> > 
> > dom0# xl network-attach 0 backend=netdd script=vif-zynstra vifname=dom0.2 bridge=abridge
> > netdd# xenstore-ls /local/domain/2/backend/vif/0/2
> > frontend = "/local/domain/0/device/vif/2"
> > frontend-id = "0"
> > online = "1"
> > state = "4"
> > script = "/etc/xen/scripts/vif-zynstra"
> > vifname = "dom0.2"
> > mac = "00:16:3e:5f:fc:51"
> > bridge = "abridge"
> > handle = "2"
> > type = "vif"
> > feature-sg = "1"
> > feature-gso-tcpv4 = "1"
> > feature-gso-tcpv6 = "1"
> > feature-ipv6-csum-offload = "1"
> > feature-rx-copy = "1"
> > feature-rx-flip = "0"
> > feature-multicast-control = "1"
> > feature-dynamic-multicast-control = "1"
> > feature-split-event-channels = "1"
> > multi-queue-max-queues = "2"
> > feature-ctrl-ring = "1"
> > 
> > If I have understood the backend kernel code it only waits for the
> > hotplug-status == "connected" if they key exists which it doesn't
> > appear to by default.
> 
> Indeed. I have to admit this is quite weird. I have the following
> completely untested patch, could you give it a try?
> 
> Adding netback maintainers for feedback on whether it's fine for libxl
> to force netback to wait for hotplug script execution. Not sure the
> reason why netback doesn't do that by default, but it seems it's been
> like that since the module was imported into Linux in 2011.
> 
> Thanks, Roger.
> ---
> diff --git a/tools/libs/light/libxl_nic.c b/tools/libs/light/libxl_nic.c
> index 0b45469dca..0b9e70c9d1 100644
> --- a/tools/libs/light/libxl_nic.c
> +++ b/tools/libs/light/libxl_nic.c
> @@ -248,6 +248,13 @@ static int libxl__set_xenstore_nic(libxl__gc *gc, uint32_t domid,
>      flexarray_append(ro_front, "mtu");
>      flexarray_append(ro_front, GCSPRINTF("%u", nic->mtu));
>  
> +    /*
> +     * Force backend to wait for hotplug script execution before switching to
> +     * connected state.
> +     */
> +    flexarray_append(back, "hotplug-status");
> +    flexarray_append(back, "");
> +
>      return 0;
>  }
>  

I rebuilt libxl with this patch and installed it (without reboot) on the
dom0 of the system I was testing with last week.  With a 'for' loop to
add 15 interfaces I didn't see the same problem so initialising xenstore
with the empty hotplug-status key fixes this problem.  I'll add it to
some more of our systems to give it some wider testing.

Thanks,
James

