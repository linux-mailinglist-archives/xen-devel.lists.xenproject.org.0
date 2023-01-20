Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59305675E03
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 20:27:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482093.747432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIx2L-0004bj-7r; Fri, 20 Jan 2023 19:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482093.747432; Fri, 20 Jan 2023 19:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIx2L-0004Z0-4u; Fri, 20 Jan 2023 19:26:53 +0000
Received: by outflank-mailman (input) for mailman id 482093;
 Fri, 20 Jan 2023 19:26:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Xek=5R=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pIx2I-0004Yu-Pg
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 19:26:51 +0000
Received: from sonic312-24.consmr.mail.gq1.yahoo.com
 (sonic312-24.consmr.mail.gq1.yahoo.com [98.137.69.205])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 603735d8-98f8-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 20:26:46 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Fri, 20 Jan 2023 19:26:44 +0000
Received: by hermes--production-bf1-6bb65c4965-lwg94 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID b91055a077e70f722712dffc6046fa22; 
 Fri, 20 Jan 2023 19:26:42 +0000 (UTC)
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
X-Inumbo-ID: 603735d8-98f8-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1674242804; bh=Yn4KGPZXDuvS4Bf0u52UWsMUa8+cfIZGayqP+lGXJSg=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=o84QnXgTczeuGnY2fpvxTYUKg7IZIXtrRc2vB0jRWVeVZPFdJ7lCe0Awdvow/HYOs06c1O2d9Pc7pF+Kk88sG7EPBNxkTg/03XQXVbuaSUgj62Nn9USfNOCBzFut9QHGqCO35J/BW79E2cpYQzikhPW3IO+1QKfIgqarVsbbDo8PpWr7TS0LYOVunVrLNW9EQvWOxeOltW0+TpemX8bATVJOlEMbLK6+XXxcyZbfOS3OiuWrEDoFUcswrlJZTLaENWAPJaVbMOtWg7o2m0R24KY6IduBBtHnaoZAgWIVWAg7gVQkgX6fhsixFncCcLnJ8Qi+T5pO5avs1EQDau+SSw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1674242804; bh=aOgE+fNrxPyiCFcakFMAoN38bhQ7RnYAHqqTDk/pR9P=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=YRmzCYrq4Vpvt0qbjg9JzXAcFaDqX7V3RT3/yMrMC2WN3q4x1Duw3J52ZLFEYQ000rdsegK0HbPUMAXiyub/NpuF/AXOecE8xbW6bWkahel/QaBPT18Rbid4RZxY3A5wuxDiYhHAxxItcYlxBj5Zno2sgY5UUDAeiAEwTr7hyRlllrkF8c/mvetgHKrDStlVS13ge+wKkp/0UcXr8vSLUzlg4UQMh46mHnIfxMX+TR1RgIVbRDRkCqwyPHa6WF3E5hGeIRwIgU0QllNQQfor2rKM7ZiizgNc2lGcsDXkuTo7vEfBKpa57RvGuJPfxse+7ZnswOjSDLt+qHuWKOixAw==
X-YMail-OSG: lF13aSgVM1lexDeo9q.8drvnYtu6y2xfrsqrH_TchSNXN0qntER8n76YmvzZv5t
 NwVjC5g6yw0FdcVFCg7criHd47pa5Vz.5NTTTTIJZeoxVgA5Ee8YWGW9ymqQd4OJAakwnP1y5GpH
 .i9pGVyvqL5s83U70sS_AqH2fFpatUl7bTAiEdWde8ybTvqfu3qVpnkCyz0xaw9rdoNOmjocRNrr
 gWzV6WpZs3wfam1SLozCWCKx_rhJRjiy9L.ynYgcIAsihk5cseDa.TvmoENn22Nio4C_BbVqrTuO
 PTzJukYFWP1SD3qw.w9izwLGiiQAVH8TU07jSv8WZ_R5AoDF5D4CLKgo21nugp.RKq4gywBzk0Xw
 sT7AZ6QxfI0okTkXXkePo9xaE8EUgbAlpEsP.ojW0pFzukFZntQxvi0gNlGpt6aKcwLXhYPgQDyg
 PgRqglMCZ7l7eaWSawROq1SsFdNwhuxIFd_h69M3k7YQpsmWN21BU6kB.iW3oFars3_NhZtYRvTu
 H5HiD.fCmDnZWeZRCOgarLGkNBIqr1XRo6SfjddRyUpV5oynMRHPmozJCfFSGvUm.gi2aYvk8Lul
 HSKH1Ccei67H_mdW30ksqA_n5HYH3vAHu.PtHXI876Y4050_IF_oJmFfbs_e.tMddllGkHKfJAAs
 GpOJHBoJNZ0oRMT3k.wpy5SiA7DaMsRLeVOF7dywNrAuM2oNvOwPNfQQF8r449kZDE180vnhHjkP
 RY1.tZF7aNYN1OYv8VIluX46nZvbJDQYEcAvVkx16GjxJ_t9CksnuQ8plgp5UBhVIlcPBItvQ5gZ
 HjiNVduk0OTsiMlAqsEvRvaA4rBWJGSanzNdmwhWYLIpBZ8iuQqgyH5mJyhOCUWY2ZicHt23SUfw
 bBjxZKQvP5oEy.mg6dPVfXp4W8lvUxaP8WuTRfd_L9jBYFmQO_DzO0IDwSG9J1jjyA_U6F2gAP.4
 XVnU9R0hGvQkm54EKmruHvO.Xvwikn4MlzwbfE7P4cEO5sFCdgtQsbGjiuPAAZvMO4q6xsAqiIxV
 V9JrxMROqJAB8dREmyacO_QA17BfjLGrvwKwVETbdPmnA9byG81zlXqFdRvlKw9vll6tf9zwuV_e
 CE0s6JhSAXvSGhOXGM9yn9ea4uJjYPoUlWwApbtNlxSmNGl37_01lgH5R4ibmdbIyjyHEGOKD7vj
 MvwteO4WuJpdC2kN6c.3unz8dQ3.G7xn6u3PPlN_iggSKqbfhCb1lEohQkpwjRHJ9M0gtHa3QNk9
 M8NxQMRYPwop8jsqW_8uvas2bpct6b85kUy2l2mM_ZF3ToPWDZ.QkqHqf3RgrnCzPTf62.er3n1s
 L0x0p70QarG6PqY9HNqMFIRNzI1BSt0Hc4rFXp6cnQxAb5ILfUj7NtPJsnlvU8CF7YYuQtTHOz7_
 RTx9tB7xIDQAO1sAoXAVBxYG45VuoSADXNCMfa4Vtj8t40um9NfBDh9g88wtpzqEYejTzXlhMbX8
 oe1avd3Hi8k5R0yaaMJ2rjbvhsRomL_f4dXjAv.dxmSiLarDndiBFqw195OJYn_9CRcOnFYXKrYq
 MVsPNnaYJ_6_2otIeb9cGYIRyMueXBcMcIL0YGkjwFGXBcoCby0i9lO.jU0FlgNwSVR.0cRDp5.t
 2oGqprDfVLjvWAVHmqaWZQMU3zO3C.k.zjutmPQqVQw04aYi6ix5lW7AcwzR.3smpTz9OKizGGf5
 Yn8CoWGwI6gv1nXM.5_74MmqfovjanzWwwqvtREw3jOaOzblyebrEajlh4qXPdwyPFDrN1xRMBmD
 vtleAWlFZDQEs.junMX_Y4AneCMZu2ZX7J5Isvpwf0EbFuIU3xSUkMdxDrazj3y5ITLdx_xSmm.p
 wqee6.0pdZ7Td_9_HtE5TSbc3VrRah4q7FLWFuN6Cw4z3wNh0D_ojHMVsBvobJ4w1d9YNa0R6qCT
 Cp5IO7q018hlWpKt1fhFGTyKucknh_HCb1FcOtpTssw7ZTYZIzpXxEIDYLhR3JAW_hfNXNppyvEg
 .TLVgfWfwcSzawrjo_MIvXJ5ZEgNtrzrcmicoxL0SFXVZA78FKLYf7myQj_keSGHIlFzhCE2B04M
 86PWZ6KC6K61Pk5qygU8O0CreHCL2E_dk7C._kNWKOdfnWrdeavxUm8wWzAfrMCLzvyNdweNmofR
 OsThDCUhJ67CNKf_Grv17jd2MqvnzMWu4ytaDK1dcI4N3G5UUK080vQEHFSqCqLAx2SnazTvOkNr
 vkg5YaGwxOX_4bw0-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <0a536399-f1b8-d30a-f288-8ed6b719f15c@aol.com>
Date: Fri, 20 Jan 2023 14:26:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
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
 <b6f7d6dd-3b9b-2cc7-32ab-8521802e1fed@aol.com>
 <alpine.DEB.2.22.394.2301200855390.731018@ubuntu-linux-20-04-desktop>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <alpine.DEB.2.22.394.2301200855390.731018@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21062 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/20/2023 11:57 AM, Stefano Stabellini wrote:
> On Tue, 17 Jan 2023, Chuck Zmudzinski wrote:
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
> > accomplishes.
>
> In principle I think this change is OK. Apologies that this patch is at
> v9 and none of the Xen/QEMU maintainers took a look at it yet. I'll try
> to look at it today.

Thanks!

