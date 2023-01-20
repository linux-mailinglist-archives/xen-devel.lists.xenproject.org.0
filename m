Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353F4675E69
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 20:50:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482124.747503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxP6-0002sq-Vl; Fri, 20 Jan 2023 19:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482124.747503; Fri, 20 Jan 2023 19:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxP6-0002pS-TD; Fri, 20 Jan 2023 19:50:24 +0000
Received: by outflank-mailman (input) for mailman id 482124;
 Fri, 20 Jan 2023 19:50:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Xek=5R=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pIxP5-0002pM-JM
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 19:50:23 +0000
Received: from sonic306-20.consmr.mail.gq1.yahoo.com
 (sonic306-20.consmr.mail.gq1.yahoo.com [98.137.68.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa604e2c-98fb-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 20:50:19 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Fri, 20 Jan 2023 19:50:17 +0000
Received: by hermes--production-bf1-6bb65c4965-5wbr2 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 8fc9638bc0257b7883f21f7dd4d66667; 
 Fri, 20 Jan 2023 19:50:13 +0000 (UTC)
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
X-Inumbo-ID: aa604e2c-98fb-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1674244217; bh=SCHuvnfr1DQTZbv8fhW3Qs+S+h+rzzwnUhhfLPF/T9o=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=G3jnl+Pyb8+niUB5VXEYWSwchyd6LhAil8OdwnxzqF/P6rzUZQTDGV9csY9EjB8Yo83A4XRsRx3XQFrv7vHcoji1ZfH7wzWBJgJH2HHnePnXMADmeGCjlJtq5K1GghxRpIDb7XO/Deo9IOX1ZQhTCo4j94ECTtZKxRnk670ZWp6Qkd7npSEs5DKPjGuii8kCuTDHF9fFz/hdOm0BIFD8WzdaR7HcYl/tTn5DwjqvRX30kI2PhJ6QOX1jY5fpVvjBpxjIIvdTnAEuk41XW3v91C4Og5Fg3f6vaS4SqV3bMV8R/Qvu3BhqEz3xfZG+FBXQq/cLJyYsBqAUQGQABnx3Vg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1674244217; bh=wi+hWtfbphqrS3C5+SASxj+pJcKsFAAo7ruRUgzoYGe=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=hhStvQ992O28uIO9Bm0HRF8B8PTXXvCfn0a7RCD9eaLaTVqkvtP2cNWPyztiuoeRc5woNhrBFkJ4Gxvp8Wq+Mlg/iw0DVwvFR6OyM8usmPt+J2EM171PnNunAMU9eKkchNI49zpDaoT/nv7z3OEaziBPy1ZPkpHJvEN3S9WN1gyQViNAH3xnrWTd8KiKylfUBiHA0Gv8hFm/OQdzP7uYTPuhtESFKM7tKJUJxANKR2Ov6P5WBKgA8qSpBffyT0FXASD05P4X20mIaxv8zHr9xufZcW95C9uFQ1nU6Qzc6lNRVtzDSpzM7G3l5OAhlxUSHl5LhLyQBOUuM2u98E7+YA==
X-YMail-OSG: g4sjqrAVM1lmEVyXoJ8oNN.3tfk42gY.seZiSTAsqkUO.FApDMPzbjTXlyrdyg4
 t1nUMrJrNVyCYM5pS5xxYYzvqmk3FSOmurNnf.a_WXqx8UdGlPGn3zxDJ9i15fm5L0VYVLH9FtDG
 DLLtNv0e5XYMArf8VkxrC._seV9Q.FLWil4_kkFff8npWEfgSLLOihIG5iJQ88fz64wF2zS9kT4_
 Yd3fRJJw6hPbjk8DkKPszmk6ONkcHPqlnLisMdQlw97ANX2MJuKwaNAM5OXLrSaOORdl37Futd41
 Cir_ZGM7aNfKa4OTeUcnIvEeLJEyJcpQ95rzZJ3ye4YJ.iQgnSIt4xCj.A.VsegCXJzY28f_l.xs
 uqwnVvuHCRNzDnxarPpwB2nBh0klG.behh1cV1cQ785OfTtNGy_cTJAD9MIUboj0ETxNFhDPD_JS
 YSEo.UTORzQrC8YeXZ59_lIN_djeZKpB5xZeNyh6.sQ6HzeBAv90mFk8WoeZlPL6NYKmPF6NuFCm
 .HGHcXjrcCkVJuz2HmX38grzWXryxvh8ov.yfoKax5UIIaDP8UWxDH7wm1EnD3lFyjfArzBkkR14
 .F6XqnV5PpdXm95lYgr0kp_MUzXYOBwSnsTX1vOz1RIStm.OBcFjFjCfool_FaS9nWZmFHef.OSp
 GZhXzh2m2jxE_Xloo2Bgm_hsaH0ANFd5fDZg5MqTSci30NgnTH9QXAmTGSc3X_IZaKy7PhBY80hM
 dqZylPiM0A.YYIiWaiiGqzKxHRRpjVwvEkBgQMSr.7qstLesfro8R6CC1cxS5ZVUlhUTrCJ2dgb4
 pukFrh5R3jbyyPwSUprLy5WZEOGxPQcOpsrEe5bcp0uttfvQnWWJ3XvC.kGDShDwzYoBLy.UZi8W
 MvhOQxM.3C8vl4qQpnma5porFf.oAhPT6cK.8pPxhzQGXlH8MHvhyDUb5uhC4oGN10QXkS3Y1_0v
 KJFTiqZs9atzWYz86IaqgHW5B242SR8rHu834ms4nXr5p4E4FbDguTx_3loubsPAXHNdLJJd9raZ
 tdvWIZGENgkfbZL_shUaZxzbD3pvG6Tiu2KtYMeefBSQ5AoSleXT_1XHjnoZcBU8lsLHU5PI.ESa
 L6FcdXLCB0PFkJHGnM5dZVTmqoj6C.EufFd92HftOfeguZwCtJyADbqNT0wu8.v4WJHDlHE6fj85
 MdRdlhL4uGiyVaOKZpc6KM2j_wT92MCEfYCBqrVLbJ2jne6dLs8P4WTOMdygRt96geV34NV03bmj
 1Y50xn2Gi5IvQ9B1yJg9ppZUJwVXCJ3OA8WYWA7V7B1vYLUdGkEsMyvQPKUohqy5n6tlYRcefjeX
 Aa7aYwzp.rMkpaZfuxyKWHcOeRztEMxw2a6orvlgJp6PJa.FFIipNbJ6eE9pJ1yamACkB5f6xGTW
 TbIHk.XdZGQfK5En5nuGqMZFnOw5_UYXEI6cECbuhILePZI48JZBqoRcvNY.FjYp7wte0oo5VZQK
 A6VJU48ie_WaAQm5LUcAjpHehfY.Tdk2NKd4o4LYT_zzZFv8aMmUqpBCGD7a9mbJR..P61xBM3Kb
 bddh5gjPzcyJiE.YgTM3.BjI9K4Dcg3QOTULUlZ76UgTTzU5UyyLluUsjLxFjCvGaaoVVGpJErYu
 u4R5LG7BCUNyBCy7hHKUV7Q.JxTtREvJcV68iKNwXizu37eucyykGd5YPDzCEdisGw10qF3E2d8.
 5.D9RB00OOF.f7_CRImdODlgHrpRGEgUzj396aG8daOmNGTva979YjxPlTgR78QxvG9fMntjtnGH
 9KhoHiDOgHN.JEdIDmXV98FrWVmpET1D6ekerzljLPp1hESnX99sl_2ShxGNFE4fT1QLxYuo4KCY
 sL4MOC9SHGTv3kCWaNUzYl7at66XNkGQpDklKCWcitsbbyOaj4IugIALCiATUC_nsT4x2pdNFIq2
 Cd.DUvmwswpOiXITbKdvskDcz9_vig6OoOPhCj3ynZHCQIPyDRi0U_w5OjoTOxe.QovGTY_t5Z4v
 SrGa9qY5vm4guXhFN9FicUhlhb_i14.8iz_A8Aujqc3PZKYuvzXzNRziPOockhvxaop0rNv9XyaF
 JWdc0LnSzCXVkxw86MqwddSwek3HDR40iHTfMS8coYDEmkOWbMFz7rQnOIZ21bOfYtWZMODXOdxD
 UajKeB3JQUD6S.JWbFN4BWJq8Ue5rbw2zn4v1gZEg5eo79UcsKrYo7W.ugYCxIT50bUmD9_gmDFi
 q2ThgDozqtlnJkUqDJWaoERtKN_hp
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <29ee7fb7-4357-b06a-0ea4-65699211f874@aol.com>
Date: Fri, 20 Jan 2023 14:50:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Anthony Perard <anthony.perard@citrix.com>
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
 <20230117113513.4e692539@imammedo.users.ipa.redhat.com>
 <1c7d1fd7-d29b-1ae1-a7f4-0fea811b56c5@aol.com>
 <20230120170147.4f3bbda6@imammedo.users.ipa.redhat.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230120170147.4f3bbda6@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21062 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/20/2023 11:01 AM, Igor Mammedov wrote:
> On Tue, 17 Jan 2023 09:50:23 -0500
> Chuck Zmudzinski <brchuckz@aol.com> wrote:
>
> > On 1/17/2023 5:35 AM, Igor Mammedov wrote:
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
> > > above hints on presence of bug[s] in igd-passthru implementation,
> > > and this patch effectively hides problem instead of trying to figure
> > > out what's wrong and fixing it.
> > >  
> > 
> > I agree that the with the current Qemu there is a bug in the igd-passthru
> > implementation. My proposed patch fixes it. So why not support the
> > proposed patch with a Reviewed-by tag?
> I see the patch as workaround (it might be a reasonable one) and
> it's upto xen maintainers to give Reviewed-by/accept it.
>
> Though I'd add to commit message something about performance issues
> you are experiencing when trying to passthrough IGD manually

No, the device that needs to be passed through manually with the
workaround is the Xen platform device, and the workaround (as I
understand it) is the patch to libxl, not this patch to Qemu. The igd
is passed through the same way whether or not Qemu or libxl is
patched, with these patches I have proposed, and IIUC that is by
using QMP and the Qemu device listener.

> as one of justifications for workaround (it might push Xen folks
> to investigate the issue and it won't be lost/forgotten on mail-list).
>

I could add that on the next iteration.

As far as Xen folks investigating further, that would be welcome.
I think the best way would be for the pc_xen_hvm_init functions
to add the igd at slot 2 and the xen platform device at slot 3
when igd-passthru=on is set on the command line. But I don't
know if it is possible for the pc_xen_hvm_init functions to
attach a type XEN_PT, which is the device type of the igd when
using xen, without changing the interface between libxl and
Qemu. My patches fix this without changing that interface,
but the Qemu patch does it in a way that achieves better
startup performance that the patch to libxl because of the
fact that the xen platform device can be added sooner
during guest creation by patching Qemu than by patching
libxl.

Currently, IIUC, the XEN_PT devices are added through QMP
and the Qemu device listener. If there was a way for Qemu
(the pc_xen_hvm_init_pci function) to actively attach the igd
instead of having libxl add it via QMP and the Qemu device
listener, that would also work and might improve performance
more because then both the igd and the xen platform device
would be added early during the creation of the guest.

Thanks.

