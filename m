Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE4C7DDB27
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 03:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626061.975988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy1Jd-0002mH-A0; Wed, 01 Nov 2023 02:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626061.975988; Wed, 01 Nov 2023 02:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy1Jd-0002kK-56; Wed, 01 Nov 2023 02:50:45 +0000
Received: by outflank-mailman (input) for mailman id 626061;
 Wed, 01 Nov 2023 02:50:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HZ0A=GO=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1qy1Jb-0002kE-2M
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 02:50:43 +0000
Received: from sonic312-25.consmr.mail.gq1.yahoo.com
 (sonic312-25.consmr.mail.gq1.yahoo.com [98.137.69.206])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f575419-7861-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 03:50:38 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Wed, 1 Nov 2023 02:50:36 +0000
Received: by hermes--production-ne1-56df75844-r9tmt (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 013fa52567108109ef0e6cc6ef79cd9f; 
 Wed, 01 Nov 2023 02:50:32 +0000 (UTC)
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
X-Inumbo-ID: 6f575419-7861-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1698807036; bh=A4kfhwIUJkyFCf/M/+KoSTmAJsJ6d9+Z7HofM+HJNOg=; h=Date:Subject:To:References:From:Cc:In-Reply-To:From:Subject:Reply-To; b=APSVPC2IkCim0+Mm8Bl8sBkT+V+7cNFyiQFTd9kLKVFBjzTEKATQqM6nVPkAF5ES2lQicv2cuFGSUqGuIjOavsdhu7Ak2748TAYs/i8wc7x7DxyXQizCSPpvDm4imnOxJOB3Rln3YOiNgqyuzAcei3+FJcjlzAYDBeDHU/ZOC1hA6/xcSYci+OI9NUiAyLek+ScdxQR1QaN/u0Yj6o11/hns1UL498+y35kw5rvLfKiS2lNa8dTwx3iMl9G8rkS0O736vu6rNZXHSumS/bzzphg9U/8kcRnGnjj0wy+zvWJ4Wd5iVEPqJXVNybPfvNHbwbX+4XfKOTe19ydpr9gHXQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1698807036; bh=pgiJyujpGhL1AtVW1FLFtgcKLcPsXYyh/IHbWMw6rmq=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=LNEonZYh0wL5r66x5TFaTxJafwabJAr/u55CLAWWIdgO2mI5Kposc/vhXyNXzksqj6d2ZRZzJ3a0T7vQwTIUWr55LRP489K4IV4QXdjkmCcaPlYQdMyRIecv08sA9PVXWJ2PRbL7geNvnF8FZPGlcM+xcpHoIX3IoMx5vRztDngKPzFfebaeW3Tv9irT9Iw5BSZLd1G2xfsvNbqdVaBAFkIZ4gFumqCJ6OL275V9ZbTxNmtzJYHFKtBy1Isg+gSFbw4h8p+5O81Fwrnb21c3Ph/Z+sn3bccrfKanBZehARCvqvAyTkncPp4treqkDEzq4NSRwmy7HZtQ6X2+emDP/g==
X-YMail-OSG: 9yY1KuMVM1kFujj0V2YOGTb1LAQGlWOnO5Y6pkH0fG.lGyVTJGVOFAW34sHmWtg
 uWLcBoiz9FOJa5ssUQPgeEOsDtv57Urd5YcfjGW.3hz1CU9Mx_9ZGtdMjAjXcy7.UauxZiPzVZzA
 2g3_bNabX0AXxKdsfamAxo9HmghoGhA4ZPME7_.1Wmy5NyGLpHxDrAoDLQSOZ5BaeUJTGrPXlDmQ
 OoKqpnWi.l96HY3FElL.V5zA0jJTctjLrE0A.SoFjRiuc4W04nKiGxujVMj2uZCYYjpmnKZes0Y2
 1sxzrQn5RpDgSfmHiaPPjxnsAbgMgN7YWL1yHI5PQwDoCQ9buMOO0MWWCAtxIQNvheZXGY6cpEPI
 UiZ0S2ueV83Zem8coq0YvEPsgd7BpP7ryPwBwtPqLG_r_F0znfQfRCnSfe4CCBH6BkFmk8kk2Ws5
 hM1WlWVTKwNkiVSxTsSOJny20jK12um44EbW8dopwgYkEIEDk6BAfbmUsT6RH.yR0mb1439rP3vg
 Xa0TA2QO0R_mAvBoleUVphig.t_mjoA2F6KE1w169cZqeJbTp9erD.BDdyMks6CtQjgmRHbjyuJP
 ZKrTz8gaMnF4qFqT.7.GGMJtj3VDgvC1L5FM.fP8Vknzu4Zkj8xu4K0uCqXKSZDIZp2IMAohWr1_
 fCKvmWJ8Jtlnld8QmpcxeFEQcblDC0cwu15.lnhu2rlcjYHDAmE3HoLwXPu.0F32TsZY89RORJBP
 A.4phfCO2UPzl3KVfMIAdFk1wmgmZtZWt8iNYuy8flxkUbOkwPjS36C8onD5NoGVuicZ4mxfPbma
 EI1jlNJyNdHfyZuTUb5nlWDK2xwOMBTWZO4yXN4i7b9Nz6TlYMkgDF.pHFM105OYmGKwAA3A0P6N
 so3FI.FXToVu8vwKrNZSxDKt4xm9QDuid6_XyHfXS3..S0v19ALZ_0mfS1P.bUf2UrynKVRJzvu7
 B.b8ErnSmG10gaHtfOSNTB0btUFckYfxJ0Ii6YwOKvE4SyAM4V8nv9ynpUmpWFgjKxz6Kcx1atV.
 URHr1BuiV_9xQaG4JDtemed6djKhh1kRGEtuoOzuTeuYb5RZRdNY9nasnYSdVYQ.wlNjcznJHwof
 8m6958z_AVr2AtkTlxBzzuL51sDus_lOOM9cX_KK3ZEolTuPcdy5E5crhe545CRZf7jq4xUK6jfq
 U9GASefEHgqqbeyfiqIWM0.hlCq4PaGpq6QBal29pFSytXrz_rN.0oWAnFLtqu3zkZZ3jMLEsvuv
 hDgA_WbKuXpLRFU.X3H0fqHR6f0IVbEQOdCXEg5BFtF0hEbBhS43v5IVUDi2UCDw_.SePIht4oL.
 w5c9Q8g0N7tnsPNcIlsVS.ZlTlRM6q3CJmryIuZkx9tPXIfznbP9zOA4ZD.OBJ3OQ2dbcgMZ6kij
 T4YI0oBuoREyqKAk4ulG7gkSFLH_Wljk9Fx8SmJ7QTBI4BCeKtqFuKG4bTi9SstJ2Qv1FR_EBb7W
 2Vw.YPDSa_8j6S8QQp46GuBKfHXQF6SGyz6XRfzXGylKmlZJrPNzt0HuUqk.oAt.j75vuwFD.Ecs
 QD1IV3jMraMHdtHBGL4jda8sGmM9gtM5V.9u0bDLwm8krYOssfnwICR4KLzw__zJSNBA4MrvuJrE
 gQ5Nh6ihoWMA3Sz244BluqbnCS620CaVl.pp67YDaaVz44vfd66qrCi1kFvYUZyweEVKYgaGGkNb
 B6W4G11qv7_6GuOo6SVIHzOsXDEgm4L2_TpM.hq9_PFp5C0PZrdX79K0qqxE206zrKv7PUTjte_N
 VTX0fS7qUppJZst3Qrv6lCPV0kW.TVQqmYaGkkwueRnY.Clzk_HxmCF5Myn4mCA7P1ALoAw95ngD
 GvME4aewLS7JLpM0u1MP8gvVT4gHzZZmtWmNkdaD_b8EcO5EOIhtAtT4GtErs0lBd9RRvdoNjbii
 Ujm_1ViLKDg9hGkH2HAoDEsYyHkUfKs72M7_ycwiulsUwtCocSJoRiPzz.nmC9LF7nr5cMTzgmgJ
 iivCtiDBp9_HifoXTjJpbnq9J.wb8xXJxHVcV0RR_ZoBB4Jv.T4S321ajxACr_MXYLuAGcz.XWYb
 KmUkVpiWraKV0Yne2JXYwYo__x40OTUrz1LNi.5iVQYm.ZZ.gpUuWl_2O4qq7m8N52Vc6QnaDwPV
 ug2zlqIDJM9RPr7gnMQCIHK_ctVfoQI6qCxosj.S4o10niwMnoKmWPkZAVc2pUdAZwljHnej.edJ
 ku9TTPL0riOD1nfsYow--
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 6798214f-177d-43a2-8ef3-89c3414a7b0d
Message-ID: <d7d353b6-8d98-4bfa-8f45-1cb56fcea1f8@netscape.net>
Date: Tue, 31 Oct 2023 22:50:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma]
 *ERROR* Device 14450000.mixer lacks support for IOMMU
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
References: <CA+1FSiip1U0_EskJNgV3pSZPTCNOiTbpHosRLsy-6t1QQGd8Dw@mail.gmail.com>
 <alpine.DEB.2.22.394.2310311557520.1795129@ubuntu-linux-20-04-desktop>
 <CA+1FSih0hORYZf6Hfmf=nY4jkHPvFSgGfc1tJfzN6smnKxcsxA@mail.gmail.com>
 <alpine.DEB.2.22.394.2310311625260.1795129@ubuntu-linux-20-04-desktop>
From: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Mario Marietto <marietto2008@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <alpine.DEB.2.22.394.2310311625260.1795129@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21890 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 10/31/2023 7:45 PM, Stefano Stabellini wrote:
> Unfortunately there is no easy solution.
> 
> Do you know the version of the SMMU available on the platform? 

I am trying to discern, but I doubt we have v3 because we are
working on a very old chromebook from 2012, and I am finding
patches for smmv3 in Linux not starting until 2015. It is good to
know about this option, though, for future work we might do on newer
devices.

> If it is a SMMUv3 you can try to use the nested SMMU patch series to
> enable a virtual SMMU in Dom0: https://marc.info/?l=xen-devel&m=166991020831005
> That way, Xen can use the SMMU to protect VMs, and Dom0 can also use the
> SMMU for its own purposes at the same time.
> 
> Alternatively, you can dig into the details of the exynos-drm driver to
> see what exactly is the dependency on the IOMMU framework in Linux and
> remove the dependency. Unfortunately none of us in this thread are
> expert on exynos-drm so it would be difficult to advise on how to do
> that. For example, I don't know how you could debug the x11 problem you
> described because I don't typically work with x11 or with the exynos. If
> there is an open source mailing list for exynos-drm development they
> might be able to advise on how to remove the IOMMU dependency there.

We have received this message from Marek Szyprowski of Samsung:

https://lore.kernel.org/lkml/7a71e348-f892-4fd4-8857-b72f35ab5134@samsung.com/

Marek recommends this patch to possibly help with this issue:

https://github.com/torvalds/linux/commit/bbc4d205d93f52ee18dfa7858d51489c0506547f

and also these kernel config settings:

On 10/31/2023 8:08 AM, Marek Szyprowski wrote:
> If not, then as a temporary workaround please disable 
> CONFIG_DRM_EXYNOS_MIXER and CONFIG_DRM_EXYNOS_HDMI in your kernel config 
> and check what will happen (You will lose the HDMI output, but maybe 
> this won't a big issue).

Mario and I have preliminary evidence that applying both of Marek's
recommendations to the 6.1.59 kernel have improved the situation to
the point where now the Chromebook can run X.org on Xen. We are doing
further tests to see how Marek's patch and/or the kernel config settings
to disable the mixer and the HDMI affect the behavior of the GPU in dom0
on Xen.

> 
> The final option, which is a gross hack, would be to let Dom0 use the
> IOMMU for its own gain. Xen doesn't use the IOMMU. If you do that you
> lose freedom from interference between the VMs and you cannot run driver
> domains or directly assign devices to DomUs. But if you are running a
> research project you might be OK with that. To get it to work, you need
> to hack Xen so that it remaps the IOMMU to Dom0 to let Dom0 program it
> directly. The attached patch (untested) would be a place to start. You
> also need to pass iommu=false to the Xen command line to prevent Xen
> from using the iommu itself.

I am interested to investigate if only the mixer and the HDMI is causing
the trouble. Based on what you are telling me about Xen not exposing the
IOMMU to dom0, I don't fully understand the original log messages I was
getting when I followed Julien's suggestion to find the symbols associated
with each address in the original message, and those seemed to indicate that
the exynos_drm device was using the IOMMU in dom0, but the mixer was not,
and the fact that they both were not using the IOMMU is what caused the
test to fail and Linux refuse to initialize the GPU on dom0, whereas on
bare metal, the logs indicated both the exynos mixer, which I think is a
sub device of the exynos_drm, and the exynos_drm, use the IOMMU on bare
metal.

I also found this patch which suggests if we can get the devices to work
we will be compromising the security and isolation between guests:

https://patchwork.kernel.org/project/linux-arm-kernel/patch/20190301192017.39770-1-dianders@chromium.org/

There are plenty of unanswered questions here in my mind,

Cheers,

Chuck

> 
> Cheers,
> 
> Stefano
> 
> 
> On Wed, 1 Nov 2023, Mario Marietto wrote:
>> I'm aware of the presence of that post. I'm working on the same
>> project with the guy who explained the problem. Unfortunately,the
>> solution proposed does not work well. Xen is working,but the screen is
>> still black.
>> 
>> On Wed, Nov 1, 2023 at 12:04 AM Stefano Stabellini
>> <sstabellini@kernel.org> wrote:
>> >
>> > Hi Mario,
>> >
>> > I am adding xen-devel and a couple of other Xen maintainers that might
>> > know how to help make progress on this issues.
>> >
>> > Replies inline below.
>> >
>> >
>> > On Tue, 31 Oct 2023, Mario Marietto wrote:
>> > > Hello,
>> > >
>> > > We are a team of linux enthusiasts who are trying to boot Xen on a
>> > > Samsung XE303C12 Chromebook aka "snow"
>> > > following the suggestions in the slide show presentation here:
>> > >
>> > > https://www.slideshare.net/xen_com_mgr/xpds16-porting-xen-on-arm-to-a-new-soc-julien-grall-arm
>> > >
>> > > This device uses an exynos5250 SOC dual core 1.7 GHz with 2 MB RAM, it is
>> > > a Samsung armv7 chip with virtualization extensions.
>> > >
>> > > In particular, we have it working fairly well both on the bare metal with
>> > > a recent 6.1.59 Linux LTS kernel and also with a recent 5.4.257 LTS
>> > > kernel with KVM, the older LTS kernel version is used to test KVM because
>> > > support for KVM on arm v7 was removed from Linux around kernel version
>> > > 5.7. So we know we have the hypervisor mode enabled because we were able
>> > > to use it with KVM.
>> > >
>> > > For Xen, we are using the latest Debian build of Xen 4.17 for the Debian
>> > > armhf architecture:
>> > >
>> > > (XEN) Xen version 4.17.2-pre (Debian 4.17.1+2-gb773c48e36-1)
>> > > (pkg-xen-devel@xxxxxxxxxxxxxxx
>> > > xxxxxxxx) (arm-linux-gnueabihf-gcc (Debian
>> > > 12.2.0-14) 12.2.0) debug=n Thu May 18 19:26:30 UTC 2023
>> > >
>> > > The Linux kernel is a custom build that adds the Xen config kernel
>> > > options (CONFIG_XEN_DOM0, etc) on top of a kernel that works well on the
>> > > same Chromebook model on the bare metal. I can provide the config options
>> > > of the kernel that was used if that is helpful.
>> > >
>> > > Our method of booting is to have u-boot boot the Xen hypervisor and load
>> > > the device tree after adding the dom0 to the otherwise unaltered device
>> > > tree from the Linux kernel using u-boot fdt commands to add a /chosen
>> > > node, as described on the Xen wiki and in the pages linked from there. We
>> > > have also tried adding and loading an initrd.img using the device tree
>> > > /chosen node but that made no difference in our tests.
>> > >
>> > > We actually have the Linux LTS kernel version 6.1.59 working as dom0 with
>> > > Xen using the same version of u-boot that we used for KVM, but with a big
>> > > problem.
>> > >
>> > > The problem we see is that when booting the 6.1.59 kernel version as dom0
>> > > with Xen, the screen is totally dark and the only way to access the
>> > > system is remotely through ssh. Logs indicate most everything else is
>> > > working, such as the wifi card so we can access it remotely via ssh and a
>> > > USB optical mouse lights up when connected so USB is also working.
>> > > Obviously, the disk is also working. The Chromebook is configured to boot
>> > > from the device's SD card slot by turning on Chrome OS developer mode
>> > > options to enable booting from the SD card slot.
>> > >
>> > > The mystery is that when booting the exact same 6.1.59 kernel on the bare
>> > > metal instead of booting it as dom0 on Xen, it boots up with full access
>> > > to the screen and we can interact with the system using the X.org windows
>> > > system. But booting as dom0 with Xen, the screen is totally dark and the
>> > > only access we have to the system is through the network via ssh. Also,
>> > > when booting the 5.4.257 kernel with KVM in hypervisor mode, the screen
>> > > works and we can interact with the system through the X.org windows
>> > > system.
>> > >
>> > > Exploring the log file,we have seen the errors below :
>> > >
>> > >
>> > > With Xen (or in bare metal):
>> > >
>> > > devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for
>> > > DMA mapping operations
>> > > devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops
>> > > 0xc0d96354)
>> > > devuan-bunsen kernel: exynos-drm exynos-drm: bound 14450000.mixer (ops
>> > > 0xc0d97554)
>> > > devuan-bunsen kernel: exynos-drm exynos-drm: bound
>> > > 145b0000.dp-controller (ops 0xc0d97278)
>> > > devuan-bunsen kernel: exynos-drm exynos-drm: bound 14530000.hdmi (ops
>> > > 0xc0d97bd0)
>> > > ...
>> > > devuan-bunsen kernel: Console: switching to colour frame buffer device 170x48
>> > > devuan-bunsen kernel: exynos-drm exynos-drm: [drm] fb0: exynosdrmfb
>> > > frame buffer device
>> > > devuan-bunsen kernel: [drm] Initialized exynos 1.1.0 20180330 for
>> > > exynos-drm on minor 0
>> > >
>> > > In this case,the kernel is able to use the exynos-drm kernel to start
>> > > the fb0 device. But with Xen we get this error with exynos-drm:
>> > >
>> > > devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for
>> > > DMA mapping operations
>> > > devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops
>> > > 0xc0d96354)
>> > > devuan-bunsen kernel: exynos-mixer 14450000.mixer:
>> > > [drm:exynos_drm_register_dma] *ERROR* Device 14450000.mixer lacks
>> > > support for IOMMU
>> > > devuan-bunsen kernel: exynos-drm exynos-drm: failed to bind
>> > > 14450000.mixer (ops 0xc0d97554): -22
>> > > devuan-bunsen kernel: exynos-drm exynos-drm: adev bind failed: -22
>> > > devuan-bunsen kernel: exynos-dp: probe of 145b0000.dp-controller
>> > > failed with error -22
>> > >
>> > >
>> > > Any ideas why booting the same Linux kernel that results in a working
>> > > X.org display on the bare metal instead as dom0 on Xen would cause the
>> > > display to remain dark, but most other basic functions would work, such
>> > > as network, disk, and USB ? thanks.
>> >
>> > I think the issue is that Linux 6.1.59 is using the IOMMU to get the GPU
>> > to work. When running on top of Xen, the IOMMU is not available to
>> > Linux. That's because the IOMMU is used by Xen to enforce protection
>> > between VMs.
>> >
>> > It might help to rebuild Linux without IOMMU support (remove the driver
>> > from the kconfig) so that Linux cannot attempt to use the IOMMU.
>> >
>> > Also see
>> > https://marc.info/?l=xen-users&m=169844593525492


