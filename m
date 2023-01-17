Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55A66E14A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 15:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479545.743459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHnIJ-0008VD-TO; Tue, 17 Jan 2023 14:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479545.743459; Tue, 17 Jan 2023 14:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHnIJ-0008SF-QR; Tue, 17 Jan 2023 14:50:35 +0000
Received: by outflank-mailman (input) for mailman id 479545;
 Tue, 17 Jan 2023 14:50:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p+P9=5O=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pHnIH-0008S9-Fr
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 14:50:33 +0000
Received: from sonic314-19.consmr.mail.gq1.yahoo.com
 (sonic314-19.consmr.mail.gq1.yahoo.com [98.137.69.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 462d71de-9676-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 15:50:26 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Tue, 17 Jan 2023 14:50:28 +0000
Received: by hermes--production-ne1-5648bd7666-2l5qw (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 85422408e56590c9cc34f8e4190b8259; 
 Tue, 17 Jan 2023 14:50:26 +0000 (UTC)
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
X-Inumbo-ID: 462d71de-9676-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673967028; bh=zbbQi8zwre/KEVh6Oq0xkk76DAYGxuRn4Lq8OgN4AUU=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=S11dkoYSkTTwAjYYB6vAkxeRy90Ulcap8q4/fqnkZWd7gWBIUHBHh1mtbVBW9ATFphg25rUWhyIACNS5vc4n8tNP3hvyopGsEPDbI5v6zuHkW8Rz7g4fjPXEyxRQS/NUTZB5nbsTMnrDW+yijejc4752Me/aPuLKQLvNUXfRZUHg3dRIXwjHE/gBdJrcmfdUmJ6wufdxZqRNYclDH0LXRXjBPt2oEVLfPPmq3KcPVO/wl9cj6XittwTmdCAHKFCRlFXLWWIJ5ikxDrAuuU6tmyyTRb/ZBq8AgCk2Uyhdrwfg0VusDEAVbIT6slh/mTPiQPVhOb3U/bKsFCbb8X+jxg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673967028; bh=27WRokyUQs+tw9svfWRP67Tcu91NE30GKn+kWklBwsj=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=ILKd+oNiO5xObPwycnPwx4PxkXq1WkLtpcmLSm64jd5OGt7gJJka5se5fGDArDHXdw6/XzNuLwsrXPWKCUtF5CXNjKMRNEnf/VdvowpPKiewWYl/Wq74S4P7MxFzAEz2JyLP5fK3hEbdKo/8JoX4DIDz2BJgCVX34tGYYnaboc34sap2ZUzKjcE9YsvA5lVVmElFLTK+IX4wgTr964U3TWziZQlz5UigJAd9LAdKbml5g4lq6CILTiOxyUxm6qJuiIG83aEZfXhFl5eQY/7V2/628UEXEzoTMJf/xAM8rcLKL+MybuyLvIho36QIoaFdtdJcZG6HCtv0hxQOh++Y1Q==
X-YMail-OSG: 8RXPhAUVM1lKMuKNZgnxuEZyfja_vPAjQyEBtkRqdvcce_eWZDOX4xoZq6aEkXi
 B1zsCAAZZRLlAb0AdyZYo1Stlq.07.Y0vD6oqZfPTazGd245cUAPC8rdwhHmiYSirlm3u5LRZ_ME
 B2U1sE1bRtIqvmpDEtGSSGlAYaqHY5_gJg.n2agNvU1AKj9ViYiJGIvSSp.ryk5CbHn6JZIl.ln5
 d5tzxAPB6KmdK64nENtArK0cAWRS5vp_M4shsDuGBJCII3gRleHOJK.5vQufyjgR08LUoT1Rm8B5
 0oowqDPuZmLGVU4S311o4wRQ6XDMStTA2WM76l3.RduuL2aYuqv6wFas.r88oZglwndPQNlo1Eo0
 9SCjxEctObPBEqxMT8n3rfIvNbI2iSKKwAFTa19r7pktFRdT6PZzlQjMLDXCFzFTMWIf8YfWxAz8
 JCj11s3figHwZ7QlSegdxanSk6ens7QwDqeXhVXWV6WU2.ILLmFuJhd61yMK4_2.mEQtuKWbrAcC
 bSspGp6M_BWaLH4nP5I4E1QooFvl6QgVLVjwE4_waq.eRu7GXA9dBC0MeNDa85PFrb_lSiNDd9gd
 ghqYUhPlRfSi12Lv7VJYE9JEp1rIiWosq0bszPnVfnR3ga9ApO2rqpyEAGoMK.iSYedqr9tOdLEE
 4GtLKOyu5dGwc8Tq5XDwJ9KzrIKTLo6c0a8zl0OoFXmGTj6sl3h4mHSfBMM7kj01wZiFW.3osc_F
 FwBHaYNJq5EQ4dIHcubOy5PvhFWaFJsbDK5JmyB3m846SEiah1gq6hu1t3Pg02h1Wn4JubTtXvE.
 mlh6PDT2TNVaa4HLx6Grt368QN6f4nbtU.GTW9tLlkFfSU3cUFhjB8YDNWYth7nHaWbN9TlQkwT0
 4pY4Qm8orvW6nYv0f5Qv7Wq9jhN1XxotJABQQYCMfXxyEA9DWqKVyFjuaFIcLQeg_jDRTnUF2ZS8
 kGkTXtqK6BDYieaxzRe.vqj96Z9OYA.6WzUX19oeC5a28pBUb8UlunrNomw.jGHedEYS8is7FlSA
 94Z.6SClDAySeiUkV_lX7k3dt3CXg4NiFryely0LRJogwTidc8d05Ab28nUzS2Of7Q9MlGJTBRHd
 8oKO57uDzFBDkg8N.k_j9xgq6KDlDrSd3sxyDhpjFOzGVjeNQhj8SOgq_JI8jD9AkHJkbHrQY5n7
 aQcDNR.gtD8w1R03iv7lYM5Dz4t9Y_NEEyYoHwxiQeh.u5G0poSJw7TBbTPGSRsZZaG8fz.jbXUN
 VFnmCvzFK3xPWy8p98DDjU34A0fxGsSS4BRgOBW8QBnCpR_MGhY.stuanbSEk8mYD08MOGY.DcTj
 MmHPdFISruierd9U7tBlYLlT2hjVAZCo.Tu1MlCjFC2MkBssMKGPa4YdDjlyhuJ2iPIn4PRlzOEE
 o8sddjyX4lP9hMSPNW1KgA_5qVVm_FVWhkEEFaCYd0PgjPVhJwTSMSrpmWg0_a50jXZOqHw8DV.A
 FcEvRLh1RvqVjP1WPq3qfVc37gCuCqJ7yfJbcoZeTAOPQFk9k5tdh5K5K_tm7Qmxx0L.CQQfNcKT
 lQSwzFyY0abDYkua0N8Pukmi0kknZfvq7BYfzUk7etIAxrnfc2zdb81TnU_V6LZvTH7eOZeUe2PE
 L1KrT6LcX7047paHCNidKsPxZl7cIlyz7Yvnl5CUZ.QXzWuWSQUbEIqmDQQ.Hco6dwVfitb0rCRV
 A5GKvbGvd0B.PSEqhKtMRhs_PGXF3gQ6dlzlVDavE2LCwzH5_UpCj3iZ.cJb1mn543rKTpXBaTmu
 G8EzDnI6SNDfjtGebnWDdE6Q.UsoczrDUSSmsqz6wTD05G2i32E3rGBYM6IFsFP5Jjjzrco7Ek3c
 1LS5_PCVxBC0M_z5hcsDuyaArQUw6RSfX6eD143w_Sn5mzxIKlSPgR.x0Yw4xZ_waN3_il956gMH
 zgN_1ipVFh8wrPil6Np5UzaI_CHWLh3wBfYpNla9eT91xh88oERjD.D3kEVGDlCayVzNvOnmYu2S
 BQ41QobJyn2bhDUE479lbwIZjCkw5XfV1pwj1wMxzxJ5QaVs_M.x9cSDkf.opBhGMPOtkZHTsyEi
 srHW4ZencRlkjGP5.yS_gu4DBaXvdAa0RK_6ydZAh4G0rDae8jhBlJFz8vRi7repc8kpVzECjuDM
 k9nwA83I400wjFnI0U_a6n2jsClSpeT1UdMp0LM.voP0koSsW3f.Za0zj9Tk76ye__osZTTSbW_f
 rIMqF1p0rFSF913J5
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <1c7d1fd7-d29b-1ae1-a7f4-0fea811b56c5@aol.com>
Date: Tue, 17 Jan 2023 09:50:23 -0500
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
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230117113513.4e692539@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21062 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/17/2023 5:35 AM, Igor Mammedov wrote:
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
> above hints on presence of bug[s] in igd-passthru implementation,
> and this patch effectively hides problem instead of trying to figure
> out what's wrong and fixing it.
>

I agree that the with the current Qemu there is a bug in the igd-passthru
implementation. My proposed patch fixes it. So why not support the
proposed patch with a Reviewed-by tag?

