Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B64EA21558
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 00:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878815.1289008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcvTO-0001nJ-BS; Tue, 28 Jan 2025 23:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878815.1289008; Tue, 28 Jan 2025 23:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcvTO-0001l4-8J; Tue, 28 Jan 2025 23:58:26 +0000
Received: by outflank-mailman (input) for mailman id 878815;
 Tue, 28 Jan 2025 23:58:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hG5x=UU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tcvTN-0001ky-HD
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 23:58:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c15f592f-ddd3-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 00:58:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 90AA85C61F3;
 Tue, 28 Jan 2025 23:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE92C4CED3;
 Tue, 28 Jan 2025 23:58:19 +0000 (UTC)
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
X-Inumbo-ID: c15f592f-ddd3-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738108701;
	bh=WDIVgVXSZ73AxmTdh3o1mK6CERItzEu65S4Nz9OpFa4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T/d4+n1QaAdHRw4QQ5sRgj/vhtBhy4T6EUP4Wq2AVzgPlmLy7jXTf+UP8hfNHni6p
	 A3jVKyutIKqBmDg36X7jNZtIn2Et4Wb+c99yEDGLDcasTJhspUomwMt0EOOwrJx/Vl
	 Qu/8pGMceoM9DmmHsGpDVerUd8eoUfZ/O/cxy9VSUyTD2lOF6mK2C4aDwYvaR8+Pk/
	 yK3zfeA7qyysrjBa4sM6XQhfuR69ER1xXASGVHdn5ZoG5qQXXhkK3MEQgp9ujLf3++
	 0LTDTukJBkH08EHB8iV4QtdQxdbdVJ5T9sub9N9NL7wKzZq+NJ8kXtGOSeZVeNGkFb
	 Y0U0gjLczRDeg==
Date: Tue, 28 Jan 2025 15:58:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
cc: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org, jgross@suse.com, 
    Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
    jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com
Subject: Re: slow start of Pod HVM domU with qemu 9.1
In-Reply-To: <Z5j-bkdFZ7riavv7@zapote>
Message-ID: <alpine.DEB.2.22.394.2501281543580.3264561@ubuntu-linux-20-04-desktop>
References: <20250128151544.26fc827d.olaf@aepfle.de> <Z5j-bkdFZ7riavv7@zapote>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Jan 2025, Edgar E. Iglesias wrote:
> On Tue, Jan 28, 2025 at 03:15:44PM +0100, Olaf Hering wrote:
> > Hello,
> > 
> > starting with qemu 9.1 a PoD HVM domU takes a long time to start.
> > Depending on the domU kernel, it may trigger a warning, which prompted me
> > to notice this change in behavior:
> > 
> > [    0.000000] Linux version 4.12.14-120-default (geeko@buildhost) (gcc version 4.8.5 (SUSE Linux) ) #1 SMP Thu Nov 7 16:39:09 UTC 2019 (fd9dc36)
> > ...
> > [    1.096432] HPET: 3 timers in total, 0 timers will be used for per-cpu timer
> > [    1.101636] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
> > [    1.104051] hpet0: 3 comparators, 64-bit 62.500000 MHz counter
> > [   16.136086] random: crng init done
> > [   31.712052] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 30s!
> > [   31.716029] Showing busy workqueues and worker pools:
> > [   31.721164] workqueue events: flags=0x0
> > [   31.724054]   pwq 2: cpus=1 node=0 flags=0x0 nice=0 active=2/256
> > [   31.728000]     in-flight: 17:balloon_process
> > [   31.728000]     pending: hpet_work
> > [   31.728023] workqueue mm_percpu_wq: flags=0x8
> > [   31.732987]   pwq 2: cpus=1 node=0 flags=0x0 nice=0 active=1/256
> > [   31.736000]     pending: vmstat_update
> > [   31.736024] pool 2: cpus=1 node=0 flags=0x0 nice=0 hung=30s workers=2 idle: 34
> > [   50.400102] clocksource: Switched to clocksource xen
> > [   50.441153] VFS: Disk quotas dquot_6.6.0
> > ...
> > 
> > With qemu 9.0 and older, this domU will start the /init task after 8 seconds.
> > 
> > The change which caused this commit is qemu.git commit 9ecdd4bf08dfe4a37e16b8a8b228575aff641468
> > Author:     Edgar E. Iglesias <edgar.iglesias@amd.com>
> > AuthorDate: Tue Apr 30 10:26:45 2024 +0200
> > Commit:     Edgar E. Iglesias <edgar.iglesias@amd.com>
> > CommitDate: Sun Jun 9 20:16:14 2024 +0200
> > 
> >     xen: mapcache: Add support for grant mappings
> > 
> > As you can see, v4 instead of v5 was apparently applied.
> > This was probably unintentional, but would probably not change the result.
> 
> Hi Olaf,
> 
> It looks like v8 was applied, or am I missing something?
> 
> 
> > 
> > With this change the domU starts fast again:
> > 
> > --- a/hw/xen/xen-mapcache.c
> > +++ b/hw/xen/xen-mapcache.c
> > @@ -522,6 +522,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
> >      ram_addr_t addr;
> >  
> >      addr = xen_ram_addr_from_mapcache_single(mapcache, ptr);
> > +    if (1)
> >      if (addr == RAM_ADDR_INVALID) {
> >          addr = xen_ram_addr_from_mapcache_single(mapcache_grants, ptr);
> >      }
> > @@ -626,6 +627,7 @@ static void xen_invalidate_map_cache_entry_single(MapCache *mc, uint8_t *buffer)
> >  static void xen_invalidate_map_cache_entry_all(uint8_t *buffer)
> >  {
> >      xen_invalidate_map_cache_entry_single(mapcache, buffer);
> > +    if (1)
> >      xen_invalidate_map_cache_entry_single(mapcache_grants, buffer);
> >  }
> >  
> > @@ -700,6 +702,7 @@ void xen_invalidate_map_cache(void)
> >      bdrv_drain_all();
> >  
> >      xen_invalidate_map_cache_single(mapcache);
> > +    if (0)
> >      xen_invalidate_map_cache_single(mapcache_grants);
> >  }
> >  
> > I did the testing with libvirt, the domU.cfg equivalent looks like this:
> > maxmem = 4096
> > memory = 2048
> > maxvcpus = 4
> > vcpus = 2
> > pae = 1
> > acpi = 1
> > apic = 1
> > viridian = 0
> > rtc_timeoffset = 0
> > localtime = 0
> > on_poweroff = "destroy"
> > on_reboot = "destroy"
> > on_crash = "destroy"
> > device_model_override = "/usr/lib64/qemu-9.1/bin/qemu-system-i386"
> > sdl = 0
> > vnc = 1
> > vncunused = 1
> > vnclisten = "127.0.0.1"
> > vif = [ "mac=52:54:01:23:63:29,bridge=br0,script=vif-bridge" ]
> > parallel = "none"
> > serial = "pty"
> > builder = "hvm"
> > kernel = "/bug1236329/linux"
> > ramdisk = "/bug1236329/initrd"
> > cmdline = "console=ttyS0,115200n8 quiet ignore_loglevel""
> > boot = "c" 
> > disk = [ "format=qcow2,vdev=hda,access=rw,backendtype=qdisk,target=/bug1236329/sles12sp5.qcow2" ]
> > usb = 1
> > usbdevice = "tablet"
> > 
> > Any idea what can be done to restore boot times?
> 
> 
> A guess is that it's taking a long time to walk the grants mapcache
> when invalidating (in QEMU). Despite it being unused and empty. We
> could try to find a way to keep track of usage and do nothing when
> invalidating an empty/unused cache.

If mapcache_grants is unused and empty, the call to
xen_invalidate_map_cache_single(mapcache_grants) should be really fast?

I think probably it might be the opposite: mapcache_grants is utilized,
so going through all the mappings in xen_invalidate_map_cache_single
takes time.

However, I wonder if it is really needed. At least in the PoD case, the
reason for the IOREQ_TYPE_INVALIDATE request is that the underlying DomU
memory has changed. But that doesn't affect the grant mappings, because
those are mappings of other domains' memory.

So I am thinking whether we should remove the call to
xen_invalidate_map_cache_single(mapcache_grants) ?

Adding x86 maintainers: do we need to flush grant table mappings for the
PV backends running in QEMU when Xen issues a IOREQ_TYPE_INVALIDATE
request to QEMU?

