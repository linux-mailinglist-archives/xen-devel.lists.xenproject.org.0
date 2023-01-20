Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F98675A96
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 17:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482014.747303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIuiE-0008Hw-4j; Fri, 20 Jan 2023 16:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482014.747303; Fri, 20 Jan 2023 16:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIuiE-0008FI-17; Fri, 20 Jan 2023 16:57:58 +0000
Received: by outflank-mailman (input) for mailman id 482014;
 Fri, 20 Jan 2023 16:57:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wqBo=5R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pIuiC-0008F9-L1
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 16:57:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 949c208d-98e3-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 17:57:55 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 536BC61FF6;
 Fri, 20 Jan 2023 16:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA198C43443;
 Fri, 20 Jan 2023 16:57:49 +0000 (UTC)
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
X-Inumbo-ID: 949c208d-98e3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674233872;
	bh=rshliT6W9whYI/W69MejgSTc2GK1+IatbbNou9Lkc/w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZVvZqRbh0sVcOy9/szyduSEGhMEDY1c+or4Jkmy8//rYqawYtnIO+M/pD+D0xL4Se
	 p/LAKRUs93sic37Jo8Ga2xdzpmzu2F//+kQXO3Vy4wadC1UJH1b3R6Tr2CeRqvSEDV
	 zeylM+BMirmOWDbM3a/V/6o+8+fJoWqiEdiIzD5Lr4STtvBHpL7BOvNlxi8FCcnWJ/
	 uYraWnuC1HCHq4UhE3YW1DvqExyGKW4OiYb5Z5cTyOFbkUomvoURrMsb4xTlmTWotg
	 VT0Zir0duBQy4zLzNjbWNrKf6ztyRKKP+PvGV6VfzQ92+t7TakJDrHOsgynz1nNmfN
	 YbbfvPAwcJXVA==
Date: Fri, 20 Jan 2023 08:57:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Chuck Zmudzinski <brchuckz@aol.com>
cc: Igor Mammedov <imammedo@redhat.com>, 
    Chuck Zmudzinski <brchuckz@netscape.net>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>, 
    Eric Auger <eric.auger@redhat.com>, 
    Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
In-Reply-To: <b6f7d6dd-3b9b-2cc7-32ab-8521802e1fed@aol.com>
Message-ID: <alpine.DEB.2.22.394.2301200855390.731018@ubuntu-linux-20-04-desktop>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com> <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com> <20230110030331-mutt-send-email-mst@kernel.org> <a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
 <D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com> <9f63e7a6-e434-64b4-f082-7f5a0ab8d5bf@aol.com> <7208A064-2A25-4DBB-BF19-6797E96AB00C@gmail.com> <20230112180314-mutt-send-email-mst@kernel.org> <128d8ee2-8ee9-0a76-10de-af4c1b364179@aol.com>
 <20230113103310.3da703ab@imammedo.users.ipa.redhat.com> <88af50cb-4ebd-7995-70cf-f23ac33c5e45@aol.com> <20230116163342.467039a0@imammedo.users.ipa.redhat.com> <fce262ea-e0d5-d670-787c-62d91b040739@netscape.net> <20230117120416.0aa041d6@imammedo.users.ipa.redhat.com>
 <b6f7d6dd-3b9b-2cc7-32ab-8521802e1fed@aol.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1193688626-1674233782=:731018"
Content-ID: <alpine.DEB.2.22.394.2301200857030.731018@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1193688626-1674233782=:731018
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2301200857031.731018@ubuntu-linux-20-04-desktop>

On Tue, 17 Jan 2023, Chuck Zmudzinski wrote:
> On 1/17/2023 6:04 AM, Igor Mammedov wrote:
> > On Mon, 16 Jan 2023 13:00:53 -0500
> > Chuck Zmudzinski <brchuckz@netscape.net> wrote:
> >
> > > On 1/16/23 10:33, Igor Mammedov wrote:
> > > > On Fri, 13 Jan 2023 16:31:26 -0500
> > > > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> > > >   
> > > >> On 1/13/23 4:33 AM, Igor Mammedov wrote:  
> > > >> > On Thu, 12 Jan 2023 23:14:26 -0500
> > > >> > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> > > >> >     
> > > >> >> On 1/12/23 6:03 PM, Michael S. Tsirkin wrote:    
> > > >> >> > On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wrote:      
> > > >> >> >> I think the change Michael suggests is very minimalistic: Move the if
> > > >> >> >> condition around xen_igd_reserve_slot() into the function itself and
> > > >> >> >> always call it there unconditionally -- basically turning three lines
> > > >> >> >> into one. Since xen_igd_reserve_slot() seems very problem specific,
> > > >> >> >> Michael further suggests to rename it to something more general. All
> > > >> >> >> in all no big changes required.      
> > > >> >> > 
> > > >> >> > yes, exactly.
> > > >> >> >       
> > > >> >> 
> > > >> >> OK, got it. I can do that along with the other suggestions.    
> > > >> > 
> > > >> > have you considered instead of reservation, putting a slot check in device model
> > > >> > and if it's intel igd being passed through, fail at realize time  if it can't take
> > > >> > required slot (with a error directing user to fix command line)?    
> > > >> 
> > > >> Yes, but the core pci code currently already fails at realize time
> > > >> with a useful error message if the user tries to use slot 2 for the
> > > >> igd, because of the xen platform device which has slot 2. The user
> > > >> can fix this without patching qemu, but having the user fix it on
> > > >> the command line is not the best way to solve the problem, primarily
> > > >> because the user would need to hotplug the xen platform device via a
> > > >> command line option instead of having the xen platform device added by
> > > >> pc_xen_hvm_init functions almost immediately after creating the pci
> > > >> bus, and that delay in adding the xen platform device degrades
> > > >> startup performance of the guest.
> > > >>   
> > > >> > That could be less complicated than dealing with slot reservations at the cost of
> > > >> > being less convenient.    
> > > >> 
> > > >> And also a cost of reduced startup performance  
> > > > 
> > > > Could you clarify how it affects performance (and how much).
> > > > (as I see, setup done at board_init time is roughly the same
> > > > as with '-device foo' CLI options, modulo time needed to parse
> > > > options which should be negligible. and both ways are done before
> > > > guest runs)  
> > > 
> > > I preface my answer by saying there is a v9, but you don't
> > > need to look at that. I will answer all your questions here.
> > > 
> > > I am going by what I observe on the main HDMI display with the
> > > different approaches. With the approach of not patching Qemu
> > > to fix this, which requires adding the Xen platform device a
> > > little later, the length of time it takes to fully load the
> > > guest is increased. I also noticed with Linux guests that use
> > > the grub bootoader, the grub vga driver cannot display the
> > > grub boot menu at the native resolution of the display, which
> > > in the tested case is 1920x1080, when the Xen platform device
> > > is added via a command line option instead of by the
> > > pc_xen_hvm_init_pci fucntion in pc_piix.c, but with this patch
> > > to Qemu, the grub menu is displayed at the full, 1920x1080
> > > native resolution of the display. Once the guest fully loads,
> > > there is no noticeable difference in performance. It is mainly
> > > a degradation in startup performance, not performance once
> > > the guest OS is fully loaded.
> >
> > Looking at igd-assign.txt, it recommends to add IGD using '-device' CLI
> > option, and actually drop at least graphics defaults explicitly.
> > So it is expected to work fine even when IGD is constructed with
> > '-device'.
> >
> > Could you provide full CLI current xen starts QEMU with and then
> > a CLI you used (with explicit -device for IGD) that leads
> > to reduced performance?
> >
> > CCing vfio folks who might have an idea what could be wrong based
> > on vfio experience.
> 
> Actually, the igd is not added with an explicit -device option using Xen:
> 
>    1573 ?        Ssl    0:42 /usr/bin/qemu-system-i386 -xen-domid 1 -no-shutdown -chardev socket,id=libxl-cmd,path=/var/run/xen/qmp-libxl-1,server,nowait -mon chardev=libxl-cmd,mode=control -chardev socket,id=libxenstat-cmd,path=/var/run/xen/qmp-libxenstat-1,server,nowait -mon chardev=libxenstat-cmd,mode=control -nodefaults -no-user-config -name windows -vnc none -display none -serial pty -boot order=c -smp 4,maxcpus=4 -net none -machine xenfv,max-ram-below-4g=3758096384,igd-passthru=on -m 6144 -drive file=/dev/loop0,if=ide,index=0,media=disk,format=raw,cache=writeback -drive file=/dev/disk/by-uuid/A44AA4984AA468AE,if=ide,index=1,media=disk,format=raw,cache=writeback
> 
> I think it is added by xl (libxl management tool) when the guest is created
> using the qmp-libxl socket that appears on the command line, but I am not 100
> percent sure. So, with libxl, the command line alone does not tell the whole
> story. The xl.cfg file has a line like this to define the pci devices passed through,
> and in qemu they are type XEN_PT devices, not VFIO devices:
> 
> pci = [ '00:1b.0','00:14.0','00:02.0@02' ]
> 
> This means three host pci devices are passed through, the ones on the
> host at slot 1b.0, 14.0, and 02.0. Of course the device at 02 is the igd.
> The @02 means libxl is requesting slot 2 in the guest for the igd, the
> other 2 devices are just auto assigned a slot by Qemu. Qemu cannot
> assign the igd to slot 2 for xenfv machines without a patch that prevents
> the Xen platform device from grabbing slot 2. That is what this patch
> accomplishes.

In principle I think this change is OK. Apologies that this patch is at
v9 and none of the Xen/QEMU maintainers took a look at it yet. I'll try
to look at it today.
--8323329-1193688626-1674233782=:731018--

