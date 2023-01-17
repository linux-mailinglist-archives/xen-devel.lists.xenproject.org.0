Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824C566E11E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 15:44:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479538.743449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHnC4-00073o-7b; Tue, 17 Jan 2023 14:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479538.743449; Tue, 17 Jan 2023 14:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHnC4-00071V-4B; Tue, 17 Jan 2023 14:44:08 +0000
Received: by outflank-mailman (input) for mailman id 479538;
 Tue, 17 Jan 2023 14:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p+P9=5O=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pHnC2-00071P-5q
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 14:44:07 +0000
Received: from sonic309-20.consmr.mail.gq1.yahoo.com
 (sonic309-20.consmr.mail.gq1.yahoo.com [98.137.65.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f2c546c-9675-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 15:43:58 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Tue, 17 Jan 2023 14:44:01 +0000
Received: by hermes--production-ne1-5648bd7666-6sqtt (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 1d9b16749e1e59c9a71991ed05e6bc3c; 
 Tue, 17 Jan 2023 14:43:55 +0000 (UTC)
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
X-Inumbo-ID: 5f2c546c-9675-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673966641; bh=xGBV8fjshiR7XRyMDkAYvY70ELJ31pbSDB+YMPRpZu4=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=SQxuMaJRY96JgGtBx+QFRKz5xwa+0WpmWbfPbt6tkELS2aP9jiE+Jwoz0e2XJ/lyQDKmEC8N52hjhGkUwEKdI+v7hpv43RBhsuGd3+lrRe1MnacNtbO9mIAI6EqdNMKRU0AkIipuAM3TWd4krjtLB5qclLzYipNrGbGMPVsUIZPXDUk8TmktPFZI12MmpHZD+Mt4bIqceBu9ovExJSKTTgEBEbzhFVezLAs2GYoEdcIxAqAXACuU4AiUzGbYQEgYliRtA37n02wNFvaXd9l4eODIlMPB0Ftc02ZNZIh8YxnjU3gDncDLQiwDDH01b1XYufyi9Z4Mx+9vP21X35oOqQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673966641; bh=LX2yVf0u5xwlznpUNcW5V/isVG4g9tUVRmMm+0QFY6Q=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=jRyqCombVSDgqmTMV+6/MPiPGTdVbs1R5CFp0Un2PlMovVehfWlRL/RByh2hkQQCPQ/lbzgS2BbC4+fmKH6TPbJBOhf6nIYY2myb2zoPWSwWdb6KE+KavaoAQxsAaZ6AWP+y2y0Wl4COyPEPceOqAxCQb51C5NWniK/4OZ8V1GeF+Ms2slZc2Yz09yxdgH5sgEoMA+YmVccOPpWEIYVsqnSbk1i8Xw9nDRd5ENuh4la5cWMv6TxxodtK1iVdVUanCpNdzP8/19U/kqUTyux1+xFXpgTodxamtGksgmgjGl+8bt55pXZrLomRsfQN+x15wE1JjudrWnTSTzGUUoZuIw==
X-YMail-OSG: PqPIgf4VM1lDM9MKddB8B6mogUcazQI3DXLf.srBfccWT8ITgndli_BvJtH.L5x
 23vwZQfdgwQ4psBuv4UXsbGFZIUo3kW4aMwK9E4MzswYnGLEXjuHvtRrM2GUQTV8D830oc1lOVsL
 5Intg.XmPuk8z2YplCJkieLl4QibfWaEShXI7hgWZESD899XlZIVuUUVcW291NZjS_TWdVB3atvV
 QYHArad_yoxybH1roiLCLdMLBAIj2wPmgZeyhiMDwVgfDib9I5gBwBSLG1RuFNX7gU3T4bl0i9Xh
 XKuEQ1qWPIv540H5UastdfX4NVkQoxNqTWiwn8iLpajY9ILiSQat3YUhd6M1mLqWyEmiSN_qTxtm
 kRXc32z.9L0oYQ7Ls6AEXqmjm96ziI2WUoIdY2SWUSwpeQW6VCZEVAwWAc1up5h87NSkx2lpOhWF
 reAC6rGr5s_04at8axpnbAPELtnj6G2J1ssKw.nugIhvqVbG2ZQrlhd4.QfmH4ZgUQJOjN0tnFFD
 CkmJF0APonnVCbOIj8FGU5BL07G5AxzOvr.Lf71kEZL2h40qjJnDpskWYFf0ktvLpNe4kmZAvLJO
 3RAbawfmJyCTWqiYP1._8JYb37YIyw6e0HUN6iSk67DCxklcQpopFU_6nWCvIxBb6re0P2q1tO8d
 4b9VMSPg8w66VZ63oaJEKXhHvUaMNnspJvbVsfgfSU5xV.OSGHMFJyMfo_mdfRBi0qZWW6JRiafk
 7CvhmEwwLy7dP0tYV5iRh4AfOlJ.AUdWezTIMyEguFcWF9NuqFtyuZgTslt9twbANHiUB_eV.ZmX
 DnVVCmYGeH8lPFFbJOfUwsCwQRIkEBEshn_qBUVIV_Pu3xCE5BEDxgQqGg1m9SdatA.xzF2r4ihC
 fvsb1TnU9OLCwNJVnHVpo5JkqI7EraOkiCldMv3P2T2OYChjKQ0M2gCNlYL63fmE6MjRTW5B.9E5
 C_5i7R7VkQRO5GOL0OnS29e6z34ZBD7SRu6OybeBv92nTPWv.ssLPi8DYTpkx3A1Dms5pg5PbO4y
 TcubZUrtIPp265pOIbYkPaS3m1mcqGC_Cma32cmsxYIj69JTbg.WQITpgk.qIgNeiP6aZdMtnSP9
 y7w8_c3L1jnoDFVF1DvqrB4Q1T0CcnvVWNyWNT3Y1uPtH7c8HKI1WlXoU2NpoXXORXtDGYEDGlEj
 ieXujLnRAPakppE.Lc3w8dINty.i3CN.3vCf0nInnfy4d65dWrCbi4p2Pb6AIU75Iifd0f2YFCZR
 e4uTSUcyZaQfm0S3MM2dphQh1cEZYu.JX7A.JJ0cA67hPLRGnm.d.FXMvfbuEm_Ti7whrS5p6lyq
 kpQx.HY7ariN9ydc.gRnCh4OxxepfYrA1ioC9LnmkcPlg3NrXw4nB_3qdywWBEvPurX_VSK2XeKt
 a_byXJp9OP1_zo_PsgEXh_0VWKTewbgkil7KyKtWTP0pPonC55fWEU5iMvvUQdyKhIvNVR6z37SQ
 JhFw5H2Am_6G597N.2FbffoQvdWzBLYOf3zvC7l8CeyFpesp2NSbcj9cF6W08BtTYDXG.n2DCRGd
 kPdM2Nhk4NFaEZWm_aVl9IaagknHTf03X2wDXF6j5BxKSCLwQLTKbevv6v7yxpZXlK0k6kmDCiE4
 ff6DEEqtoE0Ah_KGMsge4NNT6PrKH75BPgGdAKfVM3IMTt.l4pnpltDbcMD_1dOAgLYwjY7YLXXH
 3hmhPYDZNAhb0Wl3VsiDT4CtenT.vB8YKDS_42nDRr2G.7wCr5V5S9eDzzcMv2JmVyswN_BRNkgB
 OBIqh1ZsMMn6.U0CRtKqfTXioWHupzXTt8uMLfZUBnO9Ja2f3abCKTCCZO09xajbIsNFgb6LGVub
 2z4D._HgrjexYq3cw2ikpvPFTaBrL4plMttyE59VgVtuTwtAny_rPXrG3gL9mhUBnwi2asCnB4wJ
 NccfTYydVEuHxcI5TuRZ81zy0C0s5SsfpXpFDCDRodxPdq2mbo0SC3RoY7QuLjIeOsE0WD_VZ9EB
 UpoJIiKkIKr5OYf6BRCRZ6.UskIISMjvCiSODz_XDV7kuQzPaXWgRKwp3234NO.gJxF1IKXgrrql
 aLNzOicnHU55hgXveGFARIC7j9yCRbXbsBLy7oryrVsJNHIVk8S8jyvxJqWqpYjUIVxSsxT6KIWH
 e1oEF5srqHFdtB3cj050C1aonR7s34wb5CgrtsZXr2kJ3H.0fbwC1Jn3HrB3Ut_vOE2p0MkKl38r
 Df.RhSoi1GpZvQScQakbutXfW4qTH
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <a3aed167-74f7-aa4c-1bc6-84f116feb702@aol.com>
Date: Tue, 17 Jan 2023 09:43:52 -0500
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
Content-Language: en-US
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

Why did you delete the rest of my answers to your other observations and
not respond to them?

