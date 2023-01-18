Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62048672B64
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 23:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480810.745378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIH5g-000394-Gn; Wed, 18 Jan 2023 22:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480810.745378; Wed, 18 Jan 2023 22:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIH5g-00036Y-E3; Wed, 18 Jan 2023 22:39:32 +0000
Received: by outflank-mailman (input) for mailman id 480810;
 Wed, 18 Jan 2023 22:39:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tkj8=5P=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pIH5d-00036S-TF
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 22:39:30 +0000
Received: from sonic301-22.consmr.mail.gq1.yahoo.com
 (sonic301-22.consmr.mail.gq1.yahoo.com [98.137.64.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f59a6f94-9780-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 23:39:26 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Wed, 18 Jan 2023 22:39:24 +0000
Received: by hermes--production-bf1-6bb65c4965-5wbr2 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 6f6869fc8bbe8460354ce60f8734b6e9; 
 Wed, 18 Jan 2023 22:39:21 +0000 (UTC)
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
X-Inumbo-ID: f59a6f94-9780-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1674081564; bh=Ac1YPZBizrGTTybEqLxq26/alRlIfe24j06/CF5/aKU=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=cpmAVgbiuEThrA4MQnaozx2Tni65Rjca33n/8nSNH+bOt6b+xJLzCnZCyXRlmk6vMSOwE7zaLB1eoJoKriNfrxeJG//SO0eayGDCP2d0GEmSMvTaJnjwlgxlcG3qsi0Fyb86LTQi0Ol6z4mojA2V2h+0vvmBZUzPXWFLnW6mPgjhdiFcXZMV6ObgU6Ck9ahPjbhZFKrANMMPxTj/6y2rODn3CsumfOVrqJHXtT5fi6Cis24r5evRyTWDfa8felVA0TdTA2PeI7pxFurdRsWg09EuP1KQIbgtQ93/eAGKUW3MxTsfyBOgW9Oks4avXytV5IrrJLMjJ/EVs6Lx1aQxcQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1674081564; bh=xGQeo6E6/tRZl/tXTzl0WN2OawlczZofZAVMa9Tr1zy=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=kjpfhom98ymX1ygCB1kQvhwl/FDoGQEgKC+nm2UiqfYX3Fuk1UK6Wrj94b6Gwuoy44Z76LH+VYNyMprDjdB4eFNtw1sOwtQgbDW/nt7cNp7nb6UyolbHQX/liryWm3dcrSe+m2SB26hcUWweoFrQrOFvel7gM22OhCKl00XO8SsQQVtgTRdg87bhwGl9DKgUb8z+0MCvikUibdVoXvhb7/4rzCg/rLr1hk0QvEvO63nZnHIE9WYl1Zk5xeTv0WgD96mfCz27gjWgSEnW21HI9fRLVz5+HitMoXDQAqAmPqjNqbbYtqK43Z23EPuy6CakD7p8dtiplmDzJ/LVX5614Q==
X-YMail-OSG: 1EvRyH4VM1nHgY6Bvhh1rko7YB1Wv6vqpwDb1nRblHxL8yxhN0mOkO3IsrtxxfC
 Chn0GOP2H2L1Uw1bxAWQR3JSscHPKYX9.iMX8dgsiX8C1gW8.n3AU5ZllEgT0Oj8r63kiOKviQuF
 tSfMRGibKY8HR8crImu8eKBZqc9KKpmXXA0xJwuswmubN1GLldYD2f2LcQfLja7sQ0OchXhZxOEB
 YbnqGk.oBx7nOEKA1sdVXmqXUokI60tkj0psQJo6IgsOdQLJvFtGCuKmvuqcbmhDfvf13D2mhUCN
 8X382vM.nkoByxHmv9g.xSYeIpf3_GjTxWcDoot1HJoV6_RsivBiCeOw37xi726EDvvIsOx9iuUa
 u6vWuqkLY1t2fvDuXzUiuhvwXlqAzL_T45C23gIdSdiU_04gN8PfiJ1eS2hJ0RzeCGl7AKRiY8JS
 XO8OtygiPDPSLjH216J0CLdkT1jzDetBYxqWT37ELserA_t1p0lQ6vis4CKGhxAI6Vge.cWFnQQ0
 n.bAh3j.RysHxWvt3x1RmjX71SRKM3p.Y8MdtjP8sQ4ZUEFIcOZFqD_Tg6.CNUnZfmX9AoMfQUj.
 MvFFtUqXsLx3qjQCzcVNFSc2bmYvQRWYSNxye6NoAEdzfWoEbUFnsT8tzypNm9URim8ZvPfU7HSm
 k_erO.Mq2noxI6IcO0Bvg3rCPR5VXi9.3QKvOSJ_fcn4Di7iU5jjQ5RcRDBqkIEUuDibPCndW1uN
 PBjW8DufYsOix2doW5Do_VfLDkDoXkhBR4EopGjTY7czCR1rN0Td5BpCMINcQs1lOW5dSCuKzQ94
 O5Vb0XteipQvYZ4H4aUJgYqOgFPV4gKvzX34oSBZzBHdU0RPZw98h_fO5An.AnqE3MBtAt5n6GhJ
 5g1xvwTgoj1lGX9r8PKfN9wq6BNJq8JBzTx_9ZQPB0AT0pcwcglJ0o6akBlrbxzUlg9_emBT7Xup
 Y7jJDh2XawDx1Bd1_jmc1LX.D0n9A_VEs2LSnPuUpz_uDolzt20RGs6xsrwrYXEnMNd6wipjwn48
 xigUCeuQibaNTkvfalysjkCkAtzwAQOE5OxmvANfEwDM5we6LuAL5u1XyLoULtE2f.kApiy5Pv_U
 NcvMxbONCck1BUlMz7mgdKtPLoPiDlvrE9VSBZeK.FdbG.WXbsANSlywyblE6zgFLLhyXlkU7aZ2
 JteptTHwsBUvbL3lyxXADul78UqrDZwSdJsP30UzleZqcUOoGF.Oiv0C1MO2HtJre3lVggLcs7Ag
 .zRDVP3qbK4W5SuhaGDwuPd7kuMOzzVcPhwq3KV2OS0v4YVrrdMmIv38oVS6hT9SnKbR0KpSxxSo
 I6EQdulFP.FAEUoSw_o5roF9RwEVScB2yu3xfHDsS0zPa7yyoa_gIvAoOCGUt3mSWBlEqy.OA2MR
 D4Lw6vtnNTs0i9PHOnCgBAjZG3fTMbqQhy0KgtUX8EocPGLb0vwNQJQIUmALFjIhqJp4iBwf5q13
 XXwLZ6mWCPgwK3bG8eiuFyj2T20_zR7veEuIZVNRVSVNAf.JwU12lAatWnhKuonAYEqwBb8Qp_Le
 q00gEbmQ46414xGc9oGJ0krrETieyCESEaURpwsz.OLVBwbzy1fhtXdcjDi9QkwNMF6jvOJAvwJg
 nKWBLvTWYhh.xDcXfngoWlOBkMeQxw.bo68hitfIVQhzObaNDF80I5I8_MaYcix6CSkAlL2cCCPB
 tieMQBA6BstXeB83UoQ5aNFmwQrAxRAQPIBintYsYcat.DhJBDFgc4SIMZ2qkiv8DNJtbt2hE3XN
 yR6fFxvfakVg83OMm6EOibNz6iDwiLAWt050p8vPY40aEe0u6jpBUYmQWbe6dqdqbNBBJ.9c0GOm
 UITxmHOeWoCq0aocGRtIYK4xpVyGqBXWIsS4xwpRCztw96gEQ3QdQ.36S7N7yHrDL870nd7XhNJi
 5vBrrSdA0CbaJ3wejxJ2YvL7c_xAAzQ7jxrjUE7PvDLb3PohvcJPd8DWx5j9oUuTNPy0PJckxA0A
 b5mc_yUHKo2sQioJk97IrQ2cs.vEhGxNxAOENJp0uh.ncd12k0knLQbMRAYyDkIKnJNSVnn3BzTL
 lP8buwwHBmneogPbsO8MVon3vLSRqOvLHjTYB.o05dx0bkJ4qWX1_IHpaZPNdVCcPoWdy51UzwUB
 FiGt5tcA4rOQStlwcjmeWAN731MIyGe2mApuxpvy_TqJqWWmPffxSQy4KaPxqIdFAzi_UbusXgob
 BxYoz6_wskPNIgYpGNj2nOn0B1Kw-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <13fd40d2-4887-fb25-45dd-5f8ee3cd08e6@aol.com>
Date: Wed, 18 Jan 2023 17:39:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
 Chuck Zmudzinski <brchuckz@netscape.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Anthony Perard <anthony.perard@citrix.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Xu <peterx@redhat.com>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>
 <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
 <20230110030331-mutt-send-email-mst@kernel.org>
 <a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
 <D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com>
 <9f63e7a6-e434-64b4-f082-7f5a0ab8d5bf@aol.com>
 <7208A064-2A25-4DBB-BF19-6797E96AB00C@gmail.com>
 <20230112180314-mutt-send-email-mst@kernel.org>
 <128d8ee2-8ee9-0a76-10de-af4c1b364179@aol.com>
 <20230113103310.3da703ab@imammedo.users.ipa.redhat.com>
 <88af50cb-4ebd-7995-70cf-f23ac33c5e45@aol.com>
 <20230116163342.467039a0@imammedo.users.ipa.redhat.com>
 <fce262ea-e0d5-d670-787c-62d91b040739@netscape.net>
 <20230117120416.0aa041d6@imammedo.users.ipa.redhat.com>
 <b6f7d6dd-3b9b-2cc7-32ab-8521802e1fed@aol.com>
 <20230117212700.35b3af18.alex.williamson@redhat.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230117212700.35b3af18.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21062 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/17/2023 11:27 PM, Alex Williamson wrote:
> On Tue, 17 Jan 2023 19:15:57 -0500
> Chuck Zmudzinski <brchuckz@aol.com> wrote:
>
> > On 1/17/2023 6:04 AM, Igor Mammedov wrote:
> > > On Mon, 16 Jan 2023 13:00:53 -0500
> > > Chuck Zmudzinski <brchuckz@netscape.net> wrote:
> > >  
> > > > On 1/16/23 10:33, Igor Mammedov wrote:  
> > > > > On Fri, 13 Jan 2023 16:31:26 -0500
> > > > > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> > > > >     
> > > > >> On 1/13/23 4:33 AM, Igor Mammedov wrote:    
> > > > >> > On Thu, 12 Jan 2023 23:14:26 -0500
> > > > >> > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> > > > >> >       
> > > > >> >> On 1/12/23 6:03 PM, Michael S. Tsirkin wrote:      
> > > > >> >> > On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wrote:        
> > > > >> >> >> I think the change Michael suggests is very minimalistic: Move the if
> > > > >> >> >> condition around xen_igd_reserve_slot() into the function itself and
> > > > >> >> >> always call it there unconditionally -- basically turning three lines
> > > > >> >> >> into one. Since xen_igd_reserve_slot() seems very problem specific,
> > > > >> >> >> Michael further suggests to rename it to something more general. All
> > > > >> >> >> in all no big changes required.        
> > > > >> >> > 
> > > > >> >> > yes, exactly.
> > > > >> >> >         
> > > > >> >> 
> > > > >> >> OK, got it. I can do that along with the other suggestions.      
> > > > >> > 
> > > > >> > have you considered instead of reservation, putting a slot check in device model
> > > > >> > and if it's intel igd being passed through, fail at realize time  if it can't take
> > > > >> > required slot (with a error directing user to fix command line)?      
> > > > >> 
> > > > >> Yes, but the core pci code currently already fails at realize time
> > > > >> with a useful error message if the user tries to use slot 2 for the
> > > > >> igd, because of the xen platform device which has slot 2. The user
> > > > >> can fix this without patching qemu, but having the user fix it on
> > > > >> the command line is not the best way to solve the problem, primarily
> > > > >> because the user would need to hotplug the xen platform device via a
> > > > >> command line option instead of having the xen platform device added by
> > > > >> pc_xen_hvm_init functions almost immediately after creating the pci
> > > > >> bus, and that delay in adding the xen platform device degrades
> > > > >> startup performance of the guest.
> > > > >>     
> > > > >> > That could be less complicated than dealing with slot reservations at the cost of
> > > > >> > being less convenient.      
> > > > >> 
> > > > >> And also a cost of reduced startup performance    
> > > > > 
> > > > > Could you clarify how it affects performance (and how much).
> > > > > (as I see, setup done at board_init time is roughly the same
> > > > > as with '-device foo' CLI options, modulo time needed to parse
> > > > > options which should be negligible. and both ways are done before
> > > > > guest runs)    
> > > > 
> > > > I preface my answer by saying there is a v9, but you don't
> > > > need to look at that. I will answer all your questions here.
> > > > 
> > > > I am going by what I observe on the main HDMI display with the
> > > > different approaches. With the approach of not patching Qemu
> > > > to fix this, which requires adding the Xen platform device a
> > > > little later, the length of time it takes to fully load the
> > > > guest is increased. I also noticed with Linux guests that use
> > > > the grub bootoader, the grub vga driver cannot display the
> > > > grub boot menu at the native resolution of the display, which
> > > > in the tested case is 1920x1080, when the Xen platform device
> > > > is added via a command line option instead of by the
> > > > pc_xen_hvm_init_pci fucntion in pc_piix.c, but with this patch
> > > > to Qemu, the grub menu is displayed at the full, 1920x1080
> > > > native resolution of the display. Once the guest fully loads,
> > > > there is no noticeable difference in performance. It is mainly
> > > > a degradation in startup performance, not performance once
> > > > the guest OS is fully loaded.  
> > >
> > > Looking at igd-assign.txt, it recommends to add IGD using '-device' CLI
> > > option, and actually drop at least graphics defaults explicitly.
> > > So it is expected to work fine even when IGD is constructed with
> > > '-device'.
> > >
> > > Could you provide full CLI current xen starts QEMU with and then
> > > a CLI you used (with explicit -device for IGD) that leads
> > > to reduced performance?
> > >
> > > CCing vfio folks who might have an idea what could be wrong based
> > > on vfio experience.  
> > 
> > Actually, the igd is not added with an explicit -device option using Xen:
> > 
> >    1573 ?        Ssl    0:42 /usr/bin/qemu-system-i386 -xen-domid 1 -no-shutdown -chardev socket,id=libxl-cmd,path=/var/run/xen/qmp-libxl-1,server,nowait -mon chardev=libxl-cmd,mode=control -chardev socket,id=libxenstat-cmd,path=/var/run/xen/qmp-libxenstat-1,server,nowait -mon chardev=libxenstat-cmd,mode=control -nodefaults -no-user-config -name windows -vnc none -display none -serial pty -boot order=c -smp 4,maxcpus=4 -net none -machine xenfv,max-ram-below-4g=3758096384,igd-passthru=on -m 6144 -drive file=/dev/loop0,if=ide,index=0,media=disk,format=raw,cache=writeback -drive file=/dev/disk/by-uuid/A44AA4984AA468AE,if=ide,index=1,media=disk,format=raw,cache=writeback
> > 
> > I think it is added by xl (libxl management tool) when the guest is created
> > using the qmp-libxl socket that appears on the command line, but I am not 100
> > percent sure. So, with libxl, the command line alone does not tell the whole
> > story. The xl.cfg file has a line like this to define the pci devices passed through,
> > and in qemu they are type XEN_PT devices, not VFIO devices:
> > 
> > pci = [ '00:1b.0','00:14.0','00:02.0@02' ]
> > 
> > This means three host pci devices are passed through, the ones on the
> > host at slot 1b.0, 14.0, and 02.0. Of course the device at 02 is the igd.
> > The @02 means libxl is requesting slot 2 in the guest for the igd, the
> > other 2 devices are just auto assigned a slot by Qemu. Qemu cannot
> > assign the igd to slot 2 for xenfv machines without a patch that prevents
> > the Xen platform device from grabbing slot 2. That is what this patch
> > accomplishes. The workaround involves using the Qemu pc machine
> > instead of the Qemu xenfv machine, in which case the code in Qemu
> > that adds the Xen platform device at slot 2 is avoided, and in that case
> > the Xen platform device is added via a command line option instead
> > at slot 3 instead of slot 2.
> > 
> > The differences between vfio and the Xen pci passthrough device
> > might make a difference in Xen vs. kvm for igd-pasthru.
> > 
> > Also, kvm does not use the Xen platform device, and it seems the
> > Xen guests behave better at startup when the Xen platform device
> > is added very early, during the initialization of the emulated devices
> > of the machine, which is based on the i440fx piix3 machine, instead
> > of being added using a command line option. Perhaps the performance
> > at startup could be improved by adding the igd via a command line
> > option using vfio instead of the canonical way that libxl does pci
> > passthrough on Xen, but I have no idea if vfio works on Xen the way it
> > works on kvm. I am willing to investigate and experiment with it, though.
> > 
> > So if any vfio people can shed some light on this, that would help.
>
> ISTR some rumors of Xen thinking about vfio, but AFAIK there is no
> combination of vfio with Xen, nor is there any sharing of device quirks
> to assign IGD.  IGD assignment has various VM platform dependencies, of
> which the bus address is just one.  Vfio support for IGD assignment
> takes a much different approach, the user or management tool is
> responsible for configuring the VM correctly for IGD assignment,
> including assigning the device to the correct bus address and using the
> right VM chipset, with the correct slot free for the LPC controller.  If
> all the user configuration of the VM aligns correctly, we'll activate
> "legacy mode" by inserting the opregion and instantiate the LPC bridge
> with the correct fields to make the BIOS and drivers happy.  Otherwise,
> maybe the user is trying to use the mythical UPT mode, but given
> Intel's lack of follow-through, it probably just won't work.  Or maybe
> it's a vGPU and we don't need the legacy features anyway.
>
> Working with an expectation that QEMU needs to do the heavy lifting to
> make it all work automatically, with no support from the management
> tool for putting devices in the right place, I'm afraid there might not
> be much to leverage from the vfio vesion.  Thanks,
>
> Alex

Thanks for answering my question. I thought vfio's implementation was
distinct and probably incompatible from Xen's implementation.

Chuck

