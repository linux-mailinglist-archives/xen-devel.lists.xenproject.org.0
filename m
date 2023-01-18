Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964A1670E7A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 01:16:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480028.744187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHw7g-0008O8-55; Wed, 18 Jan 2023 00:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480028.744187; Wed, 18 Jan 2023 00:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHw7g-0008Ko-2G; Wed, 18 Jan 2023 00:16:12 +0000
Received: by outflank-mailman (input) for mailman id 480028;
 Wed, 18 Jan 2023 00:16:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tkj8=5P=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pHw7e-0008Ki-0J
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 00:16:10 +0000
Received: from sonic308-8.consmr.mail.gq1.yahoo.com
 (sonic308-8.consmr.mail.gq1.yahoo.com [98.137.68.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c956998-96c5-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 01:16:07 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Wed, 18 Jan 2023 00:16:04 +0000
Received: by hermes--production-bf1-6cb45cc684-6j92l (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 5c5588657972730fa997ec088c335621; 
 Wed, 18 Jan 2023 00:15:59 +0000 (UTC)
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
X-Inumbo-ID: 4c956998-96c5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1674000964; bh=FsNUYVheK9SNhgasrb7Z3K9xbBwe59sDSdfgIEzKAKM=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=dKGNnX6425loTlpvJ22iQhmtOCFECTn5h94r+IzZc+ZsjHwwODyKgIlSDWgzmJyvFRfLGM7PpEDgTQ1/B3nfphp89I+1rjXJu9peYD+g+RZTTUGvWDlOFooPwQqWig8bpoPx+WoadWXJ0MZaTnBSP6BbzacOlQ76A+l6mZeQE7iVjQLjo2/vt1SlEOAkWf8rDWlEFV8cL/ZE466GBIu7lky3uWv5U3bJnJyq2W6UkmxrnTKxzj50JYvVLbk0+NV/CRAGUAjGWtQygNUpWLixLqroLslTZ5Yq5wDW1AE9YbcMnbaTNWwIumnbJqCPU+XoqzJCbsHQvXXXnS5LYsKtwQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1674000964; bh=/aBAx7bj4zhE1lab1K5iEdXwfitrxNRN9McRZ4V7x3Y=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=fcV9lD7rzg0aV/sGZschySI3CS92qOIBAsM8iw3tku5fChRq17XxtDiObV1IDSIlEJaEuNqFyFGuAeiTbRDk0gq1xsDKW00TCjMHl9SL6pazSC0nDiETW8Vvx4n4wxxdJuxAw1q6qiOPc+AOQTMou7mQKUD+u29NMUX8AO2RnE2r9QD/oDeWAaNGcrFIl54OJjl05/sn/ruN/Nrf2BjI8ldYHlWCtWhSnTtQNyvDO3tC+Q1AyLimlWXWdvJUxwvRZglc9JRqIbqkedwyeXiV/71WhnbiQ5y7kkxdhKTIxdo+6LD75faT+ZfTvB35299i9iIyDkp612wiR1GSsXOf4Q==
X-YMail-OSG: 8uuzW6AVM1lMXDruRMp6vrSiGYE7mx6fVVVccM.psboPnb9uz_1yIHJ9CbZTcH5
 0JJPX0pCn529ZDJaRppJRbePfvB2jMj5TIKCTZcIsLOu4Lk3lVibpjKkPr7kzs3v3EPDjVXzo936
 7GEweKS9prTTWubsL6ioMtuEZp8JwZe3p3rDor9OU1Xxwyf0hB2peu.Q6HJSXkb9U_60GhdXowEd
 uA7M7K01xNHe8MKm9A7ZUxOpZyZk0s_gnY6ENR_3.dNFBdf1bWU6RR2dDS8ttRHVGpKFHbuXp4dT
 ieMGIND48uI6Y.d45rWFHs1CfU6tGkOSdyAOXk_6r43N4ec.kugE8HhW.uPljT8IUyfCaRkg1cMY
 2eilLouoyE54T9NcugrX505nPyl8LojBSfbZHkNhkf8oCFCL7CVPWNUAQMNDVXAnCFThPQJKeo6U
 QXeKjOMcF6EYI5857T8L4qnvIx8zRfW.bHOVQVn5I3t5cryXISTdBk2mY8_KBfSLa15SkDTNtUiJ
 6QQniABWD2adg1PCRLnXUeve6qSkGSpsgPWShT1rK4XD.JABoWsnX.jaxv8ULZr_8b80C1.NzdkI
 v_uuNHM5KTw4kfTYUTzjhwkU_sgXO9TZk8W6OztQ2A6b3XhMScoou8TTNY4jyKZMz4EzJnscziZc
 XaQiLlqGdEkCg0yWMK.qbK.auh_seCSoqPQ4zWZstzmsAhP7df3fyU6OGQGDGb6wLbQX7p697JcV
 FQrpttIH0S2UxS740QQUOYUoS6AhmcpJ_LyNBSWLEkG1f2UqtUTrl4cIK8KfIsMYjDkvxRp6jWlG
 M4HHjiaKmli5HjxxS0wqal8WWFp8Fcv3pSKD0ep2o9efZzRNR3.NbemEuAWkmQfQZoDDZyfPIi3i
 4SqWj1Ll.faNJLnZglZ1rWBxHABIBT6WUgnCAIyPF63VHVWW819YPNj_2zFevNI1EVejOhcas9iM
 se5TGXv0kXDDRJewI8UT8bPZhRrW7ByhEeOlyGX3SPCNM6SXaf0BeY976EWgmBx4.DLo0KuyOe.r
 KKMyl7xWsJ_kKt5jpMRECHEBSVPQJ3tXi.XbxSBlWUl1YxA3_FSBbnbqL64pMqBrskMtLvXI3jvm
 MWzd6T98PegOfWZM3HN56qVzq7nswp_8vkBcpZ_lNZ71VgFFnJUl079.T94.83LJfFETMjQVZJeU
 ctB.TvgApbdk60jORA7aWtXsEF4o8.WRr80_RhE0if7ljnamFN3UbhYkBwff98pUPUPnxfr_VEuA
 fJnE_Tw5vMKPxaViNBt7cnMCFo7GQVBkTbM9Jdu5pP5V6Nptr2R.9lX_nHZqPTZjCC3dWz7fZ3aC
 MrU6sMso2QfBDH4wGzDKWtYBa6Ebxy5V2UwR3rXFZk_snrdgPpkImEJj.M_JAK2AT_YaAILeoobj
 2Is2NDxcNYUY0qVt3_GFzCJ.zMPogupIs3DuacGEHKy6XX4YWE8KuNAcZ0Dka_wPXGnwJAnjh2lw
 0OPsiEPtCxh9JZz28aCdpl7Y5Xcp29m.zdtIhHwAd6ux6FjVVp4Q_fpCOrpl2Lhnx7HLJLknVJAv
 V1tw17qO04.bHwln7Q1uddWatcycGvbxfL0PhjVL9scNg84ZFFoy12frc.1jNADj.qWa8FZE8tjO
 b12_k1LCMPjQ4x_8.qU8V.9l7NOZRuadi3XZ79KJz8SwrkEiCtlb7pviG916PUtJDTr8OaxnjM8C
 j7yxQfheQHndgZ8g9Ey6UA4i0vKRt2f0EsibQdu3lVDAckBJF5WVbCEjdvNKXc_amB8F8KGzUWLZ
 xbmuJhHqWzKCE.vGgjNDUo2JzhjwvgDSVxbJoDb1FWY5fPdGhm6OHrKM68v_72K_80JOpBVpIRyU
 b2ypXS85vd4wyZ2s87XF66OX8eoSMgL.MESwyigl21Rw9j6_QFwbIEd8Ck7TbIvHYqjlsAvtyNET
 _3_yomSSQb4..BjxuNhp14X5GpyKyPUSLNLSnl7qjH2ZAw4ChDnEXULroXzzBSictVbrKkgE0wBZ
 ekdgBA.AiBpptow1qj0n.rgtCKVrqKS.4plf1PxIAHjIghixzMQelDKd.LQrQhf28t1xXDC1HI7_
 kVrYO7HixJsLQ104trD8Pw8KM5TlOI7m45ksh9laqdKow8u1QOCTlPo4kMyy8K2GhybbdTNo2E2k
 .pbNJLdIS8Duk7lXhktihdq5gtv7YXrIm.vmhcNu8jz37CNpUUE33rInhsrwKwiSyqGC0zU2goI3
 r3UEniOeCMJuNxT5ALx9sG.5jwlZQizmS5trK
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <b6f7d6dd-3b9b-2cc7-32ab-8521802e1fed@aol.com>
Date: Tue, 17 Jan 2023 19:15:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
To: Igor Mammedov <imammedo@redhat.com>,
 Chuck Zmudzinski <brchuckz@netscape.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Anthony Perard <anthony.perard@citrix.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>
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
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230117120416.0aa041d6@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21062 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/17/2023 6:04 AM, Igor Mammedov wrote:
> On Mon, 16 Jan 2023 13:00:53 -0500
> Chuck Zmudzinski <brchuckz@netscape.net> wrote:
>
> > On 1/16/23 10:33, Igor Mammedov wrote:
> > > On Fri, 13 Jan 2023 16:31:26 -0500
> > > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> > >   
> > >> On 1/13/23 4:33 AM, Igor Mammedov wrote:  
> > >> > On Thu, 12 Jan 2023 23:14:26 -0500
> > >> > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> > >> >     
> > >> >> On 1/12/23 6:03 PM, Michael S. Tsirkin wrote:    
> > >> >> > On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wrote:      
> > >> >> >> I think the change Michael suggests is very minimalistic: Move the if
> > >> >> >> condition around xen_igd_reserve_slot() into the function itself and
> > >> >> >> always call it there unconditionally -- basically turning three lines
> > >> >> >> into one. Since xen_igd_reserve_slot() seems very problem specific,
> > >> >> >> Michael further suggests to rename it to something more general. All
> > >> >> >> in all no big changes required.      
> > >> >> > 
> > >> >> > yes, exactly.
> > >> >> >       
> > >> >> 
> > >> >> OK, got it. I can do that along with the other suggestions.    
> > >> > 
> > >> > have you considered instead of reservation, putting a slot check in device model
> > >> > and if it's intel igd being passed through, fail at realize time  if it can't take
> > >> > required slot (with a error directing user to fix command line)?    
> > >> 
> > >> Yes, but the core pci code currently already fails at realize time
> > >> with a useful error message if the user tries to use slot 2 for the
> > >> igd, because of the xen platform device which has slot 2. The user
> > >> can fix this without patching qemu, but having the user fix it on
> > >> the command line is not the best way to solve the problem, primarily
> > >> because the user would need to hotplug the xen platform device via a
> > >> command line option instead of having the xen platform device added by
> > >> pc_xen_hvm_init functions almost immediately after creating the pci
> > >> bus, and that delay in adding the xen platform device degrades
> > >> startup performance of the guest.
> > >>   
> > >> > That could be less complicated than dealing with slot reservations at the cost of
> > >> > being less convenient.    
> > >> 
> > >> And also a cost of reduced startup performance  
> > > 
> > > Could you clarify how it affects performance (and how much).
> > > (as I see, setup done at board_init time is roughly the same
> > > as with '-device foo' CLI options, modulo time needed to parse
> > > options which should be negligible. and both ways are done before
> > > guest runs)  
> > 
> > I preface my answer by saying there is a v9, but you don't
> > need to look at that. I will answer all your questions here.
> > 
> > I am going by what I observe on the main HDMI display with the
> > different approaches. With the approach of not patching Qemu
> > to fix this, which requires adding the Xen platform device a
> > little later, the length of time it takes to fully load the
> > guest is increased. I also noticed with Linux guests that use
> > the grub bootoader, the grub vga driver cannot display the
> > grub boot menu at the native resolution of the display, which
> > in the tested case is 1920x1080, when the Xen platform device
> > is added via a command line option instead of by the
> > pc_xen_hvm_init_pci fucntion in pc_piix.c, but with this patch
> > to Qemu, the grub menu is displayed at the full, 1920x1080
> > native resolution of the display. Once the guest fully loads,
> > there is no noticeable difference in performance. It is mainly
> > a degradation in startup performance, not performance once
> > the guest OS is fully loaded.
>
> Looking at igd-assign.txt, it recommends to add IGD using '-device' CLI
> option, and actually drop at least graphics defaults explicitly.
> So it is expected to work fine even when IGD is constructed with
> '-device'.
>
> Could you provide full CLI current xen starts QEMU with and then
> a CLI you used (with explicit -device for IGD) that leads
> to reduced performance?
>
> CCing vfio folks who might have an idea what could be wrong based
> on vfio experience.

Actually, the igd is not added with an explicit -device option using Xen:

   1573 ?        Ssl    0:42 /usr/bin/qemu-system-i386 -xen-domid 1 -no-shutdown -chardev socket,id=libxl-cmd,path=/var/run/xen/qmp-libxl-1,server,nowait -mon chardev=libxl-cmd,mode=control -chardev socket,id=libxenstat-cmd,path=/var/run/xen/qmp-libxenstat-1,server,nowait -mon chardev=libxenstat-cmd,mode=control -nodefaults -no-user-config -name windows -vnc none -display none -serial pty -boot order=c -smp 4,maxcpus=4 -net none -machine xenfv,max-ram-below-4g=3758096384,igd-passthru=on -m 6144 -drive file=/dev/loop0,if=ide,index=0,media=disk,format=raw,cache=writeback -drive file=/dev/disk/by-uuid/A44AA4984AA468AE,if=ide,index=1,media=disk,format=raw,cache=writeback

I think it is added by xl (libxl management tool) when the guest is created
using the qmp-libxl socket that appears on the command line, but I am not 100
percent sure. So, with libxl, the command line alone does not tell the whole
story. The xl.cfg file has a line like this to define the pci devices passed through,
and in qemu they are type XEN_PT devices, not VFIO devices:

pci = [ '00:1b.0','00:14.0','00:02.0@02' ]

This means three host pci devices are passed through, the ones on the
host at slot 1b.0, 14.0, and 02.0. Of course the device at 02 is the igd.
The @02 means libxl is requesting slot 2 in the guest for the igd, the
other 2 devices are just auto assigned a slot by Qemu. Qemu cannot
assign the igd to slot 2 for xenfv machines without a patch that prevents
the Xen platform device from grabbing slot 2. That is what this patch
accomplishes. The workaround involves using the Qemu pc machine
instead of the Qemu xenfv machine, in which case the code in Qemu
that adds the Xen platform device at slot 2 is avoided, and in that case
the Xen platform device is added via a command line option instead
at slot 3 instead of slot 2.

The differences between vfio and the Xen pci passthrough device
might make a difference in Xen vs. kvm for igd-pasthru.

Also, kvm does not use the Xen platform device, and it seems the
Xen guests behave better at startup when the Xen platform device
is added very early, during the initialization of the emulated devices
of the machine, which is based on the i440fx piix3 machine, instead
of being added using a command line option. Perhaps the performance
at startup could be improved by adding the igd via a command line
option using vfio instead of the canonical way that libxl does pci
passthrough on Xen, but I have no idea if vfio works on Xen the way it
works on kvm. I am willing to investigate and experiment with it, though.

So if any vfio people can shed some light on this, that would help.

Thanks,

Chuck

