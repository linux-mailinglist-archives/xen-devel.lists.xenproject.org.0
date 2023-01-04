Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E711C65D3E5
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 14:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471182.730921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD3YI-0005Zi-KL; Wed, 04 Jan 2023 13:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471182.730921; Wed, 04 Jan 2023 13:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD3YI-0005XL-HN; Wed, 04 Jan 2023 13:11:30 +0000
Received: by outflank-mailman (input) for mailman id 471182;
 Wed, 04 Jan 2023 13:11:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aavW=5B=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pD3YG-0005XF-BX
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 13:11:29 +0000
Received: from sonic316-54.consmr.mail.gq1.yahoo.com
 (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 499b7c2f-8c31-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 14:11:25 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Wed, 4 Jan 2023 13:11:22 +0000
Received: by hermes--production-ne1-7b69748c4d-dzr9v (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 5f71576bf612bcab338a616d92656601; 
 Wed, 04 Jan 2023 13:11:19 +0000 (UTC)
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
X-Inumbo-ID: 499b7c2f-8c31-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672837882; bh=9KFOB9JL9CLZbbSE/mPnz5kluCg2oPK3oquc5XsZ7fw=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=Z4wUGpXg9lLdhSQCcDPDA6OZ6NhRx03NFdWfYG03mAK0xqRfXLOB/hOM2hjF0xe8yd0LQH9mYzWFlxdnLpMHS4PjBYlq0kaFUUbuBVMgrmUn8Nyt08HVsX96Szk+VLgiI71X2Qq9bUCHimXdXWK+C07g1apX8DCE2pVcrzEFb8yAyPhE41HiXctuV7ec4ENvvbe0rBnRb48rv8ZzK8BCxQm7C+xdvDXk8idqsHJQnKeTz2Dy/a6enTZCuLo5Pt/zASfVtfU7tKqQg5erj2sxiQfKBL7SEXpANc9IwPejBZ9t63cgvAmvaD5fkuJMeS4IzB70yVeK+5ZlJopYCQ184w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672837882; bh=NiaQdQUKSXqj+/3FoQox87OgVYUchmxnGWiebKNaBbT=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=ij+iOgayTlmgInCanbFFrLJKs8XttBMJo7nZNtVgxapvaicNQ+WmRicwxdnaTJfcZdbKfRIy1ORkkoVDR17X1iurZwKzIZgBcupGw6DgNfNNyhdMlAUgLd3eUWqPdeljEvqZ6r8qmGA/Y6pmTGsW2fP7+XdXKqcAQM83hkLMNGPaPxMYk3R0u6KkaI4IWDTsBGb7+SWsz7aAvgSajI1HpwkLFjWk3Am/ZDp34YdohzMrHG22j2bEVeAnGlKGn6FBVepLjUgyaD9waIrMlYmlnLhKzmby03fWz7v/xchBFgc7e8OvlbXeaHPXATvhNr/lsPYnSRp+o6Sj+WcqF7NvHQ==
X-YMail-OSG: n1H3IGsVM1loDdT7ZhBKWbz4cuAZ.SQTUKrfCLV3b66hcka0Wr5vXQs0K7G2O4a
 Pv3SQUoN110Ab4muX1TA0xNP0vjRa.a5ncz89pv5MU5JZwATM6urstOsUHcchhqRYh0P8M4oPZeQ
 XUodIbreLkjgp3nATolbTgX_9IQX6ZKeDnv5f9zUCXEQyoqYUoC4uwLYz9JgoTTWAwMOeiqsrU2P
 O8FHKEvXm6ezl7mJjUHZ5DNaABq1tsla1IxTYH3_4FX2er5vRhpYpjq6kopMyvTJGt5g.b_2EKfx
 Z56Qe1D40a_IPjqKfRLPwddcidkHlFHU0OF4EfpG7h1PvNYJECSEwawqCwkQ_Bwzf6fJNTeLfv2x
 FgvVJA6_y9yXhS6AuK6KS_AwelVo2YSr2MItKQGHl39gj8lSYg7v8gC2yPxIPHtucvnOZ5mO9ewX
 ztXJLxo2WUkFg3xTA7F4Pa2fAZ8rFeVW63ACln1X_x98Jy4NZLcmsTDX8KrS85D.Adr3964bcolZ
 0uH9mT6LHItN_Qb3vKlhRds5bYwgbfMvrx78QCKHT5IbnIV57ncmN1h4YKqpL.LkjCBUVJxdeLJq
 Vqx9bZv0BQl74Y_M9KKH0B7EQdhX54LcC.ESRtZHuC0nK44sSqK.BLWPnPYVo.lM5hZIgwZjd234
 NExT6Mt1kQ4C.WEWvkhV2c8fOVg9qMItdZuzfoaT0tCPh8ZVZur6ESsKYruP3dqEEPy8iRTETLiC
 5CoQ9oweZhpPoclg4OejckehtSeK6r5iVYy70XVcNgHLsNgmdBwhtSG8ldRdCdGLpiheUPf3IhXP
 EpJOoTkNTwfGaH2Gpng.hQ1JITaCyv906CZlGLttyCddtgku4UD9UbD97VNEp4Eaols6O84xgyB7
 GMSGFqjr3xzFGw.ADJn1NnHXB4_8a.rMv.6C.YkjaAbN4u34qr7ZStcrO0QdKV9Aya0w4GMRuVJ4
 BPHFB5nITpreOTrezrOzxNKIAvlk_smur7OtMPr263JDsl.EayZBcedMsQTF5ulux6maH8EZeGBo
 xcqX_qhaEsVZeVHtrk5W1SPzIOzyWqOU9PdtTxxXUbsyTyTIqPQZLfkvUq5lROtP3dcO87I5Vlvz
 IowI3ZEgl5e90cwl1mpsXSfLzYsd7M6S0yR3rl6OTLNkx8f0opeOy84_aZnx1k.qtPE9vikA8v3E
 Y2l6Fx927_OcOC1GVG.XhG3jJLq2hjBbxVAO.zLwhOZHEKbmIZl6E.QISDMxyjxFL6535NPJ9yzU
 UE80GzbJ3pbjnHRK0OMlxDyFdi9yX.5zpKrz1RZyvwzWFlBNY5dXIP91RR1jxgGGFx9JRPF3G5.B
 atmfH3u7DY2DxlyqeAjUCHuZUfo34g3Ts64wCBOdAnVuNRzjTiSFgkKkoatEmZEc1_2NTKd3Fp20
 6v70bJPDB_GwzrsycSug6wQrtVCnDmjNmoEiKaQcXk88KQBVO1UkerMbNun2iHwi5C_RTBzjtj8b
 FLZaHCX6Dgua19BJvvFWXlgI2w.LWZU4Ru533E703a8z3okxeCkh_KTVnsmBAeN0CZYIpOxDEACw
 CKkJ0LAfJWA.yJCdMDkXklm82Wm_luHu7MPGZ04Fvmgd4tRx3mvHsAOV5FQfwPjiFCIcXajc0Xbf
 xF9r20rVlbZaIo6lDNzRb8cyjntoucLuVMrtg7Ncy1J1QzYW0nEoXlIoQ2U2vWZ3mVx2PxxGqgwY
 Ogdm0A100uX1R4hwVSxj2jmC.gDBp6ekwxAzCCf5hbCqKwYOpc1zCLf0Ksd6QuvQrnuu8R4DMvxY
 55.fuzprOyNLCaxO5vj4WHmQr6HMA3fqGvZgOILONvBSBVN3P1B2dx1ZkRwJXrWIldV4h29WV3HG
 NbSVjhaueaHiAN3OB2_.JIqa_0J7tGFnbQVWOPfXJtOcSmuaHuQHTzda3He1oCmttJ5abz6u8qxQ
 NGWCc1jOhS6PU6Js55BS7VtJKR0KpNjBLBUYeBNUOX18OPiV_jfg1aln8DNIAzVanXikm.P5ORLC
 wyO0gpzGYTgFjwLFhg2UodfOHX9WDGLEIy6Sy53euhHfP4bRqTKiXfWIuEtKobIhf67npHixRiQ_
 5xBoIW4GJ6fQLCMPqnminlF0ALGUSqSwiMubqRfJV9wCIMhRGoRBxxHY2tKpcxCGeHrKGTFq5FBw
 uoQERC7qiyAiKFFarQc6tbRDes5jQv_2lxPn58JdHVgp1N8ObbmRfdwLHceQllHgYw8prmUHOFgb
 gfMHBTfGjIPcouIdEkUbefA--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <00094755-ca61-372d-0bcf-540fe2798f5c@aol.com>
Date: Wed, 4 Jan 2023 08:11:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
To: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost
 <eduardo@habkost.net>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230102213504.14646-1-shentey@gmail.com>
 <bd4daee7-09df-4bfa-3b96-713690be9f4e@aol.com>
 <0de699a7-98b8-e320-da4d-678d0f594213@linaro.org>
 <CAG4p6K7hcJ-47GvsEvmuBmdwP2LsEC4WLkw_t6ZfwhqakYUEyQ@mail.gmail.com>
 <aed4f2c1-83f7-163a-fb44-f284376668dc@aol.com>
 <AB058B2A-406E-487B-A1BA-74416C310B7A@gmail.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <AB058B2A-406E-487B-A1BA-74416C310B7A@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/4/2023 7:13 AM, Bernhard Beschow wrote:
> Am 4. Januar 2023 08:18:59 UTC schrieb Chuck Zmudzinski <brchuckz@aol.com>:
> >On 1/3/2023 8:38 AM, Bernhard Beschow wrote:
> >>
> >>
> >> On Tue, Jan 3, 2023 at 2:17 PM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> >>
> >>     Hi Chuck,
> >>
> >>     On 3/1/23 04:15, Chuck Zmudzinski wrote:
> >>     > On 1/2/23 4:34 PM, Bernhard Beschow wrote:
> >>     >> This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally removes
> >>     >> it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen in the PC
> >>     >> machine agnostic to the precise southbridge being used. 2/ will become
> >>     >> particularily interesting once PIIX4 becomes usable in the PC machine, avoiding
> >>     >> the "Frankenstein" use of PIIX4_ACPI in PIIX3.
> >>     >>
> >>     >> Testing done:
> >>     >> None, because I don't know how to conduct this properly :(
> >>     >>
> >>     >> Based-on: <20221221170003.2929-1-shentey@gmail.com>
> >>     >>            "[PATCH v4 00/30] Consolidate PIIX south bridges"
> >>
> >>     This series is based on a previous series:
> >>     https://lore.kernel.org/qemu-devel/20221221170003.2929-1-shentey@gmail.com/
> >>     (which itself also is).
> >>
> >>     >> Bernhard Beschow (6):
> >>     >>    include/hw/xen/xen: Make xen_piix3_set_irq() generic and rename it
> >>     >>    hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()
> >>     >>    hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3
> >>     >>    hw/isa/piix: Avoid Xen-specific variant of piix_write_config()
> >>     >>    hw/isa/piix: Resolve redundant k->config_write assignments
> >>     >>    hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE
> >>     >>
> >>     >>   hw/i386/pc_piix.c             | 34 ++++++++++++++++--
> >>     >>   hw/i386/xen/xen-hvm.c         |  9 +++--
> >>     >>   hw/isa/piix.c                 | 66 +----------------------------------
> >>     >
> >>     > This file does not exist on the Qemu master branch.
> >>     > But hw/isa/piix3.c and hw/isa/piix4.c do exist.
> >>     >
> >>     > I tried renaming it from piix.c to piix3.c in the patch, but
> >>     > the patch set still does not apply cleanly on my tree.
> >>     >
> >>     > Is this patch set re-based against something other than
> >>     > the current master Qemu branch?
> >>     >
> >>     > I have a system that is suitable for testing this patch set, but
> >>     > I need guidance on how to apply it to the Qemu source tree.
> >>
> >>     You can ask Bernhard to publish a branch with the full work,
> >>
> >>
> >> Hi Chuck,
> >>
> >> ... or just visit https://patchew.org/QEMU/20230102213504.14646-1-shentey@gmail.com/ . There you'll find a git tag with a complete history and all instructions!
> >>
> >> Thanks for giving my series a test ride!
> >>
> >> Best regards,
> >> Bernhard
> >>
> >>     or apply each series locally. I use the b4 tool for that:
> >>     https://b4.docs.kernel.org/en/latest/installing.html
> >>
> >>     i.e.:
> >>
> >>     $ git checkout -b shentey_work
> >>     $ b4 am 20221120150550.63059-1-shentey@gmail.com
> >>     $ git am
> >>     ./v2_20221120_shentey_decouple_intx_to_lnkx_routing_from_south_bridges.mbx
> >>     $ b4 am 20221221170003.2929-1-shentey@gmail.com
> >>     $ git am
> >>     ./v4_20221221_shentey_this_series_consolidates_the_implementations_of_the_piix3_and_piix4_south.mbx
> >>     $ b4 am 20230102213504.14646-1-shentey@gmail.com
> >>     $ git am ./20230102_shentey_resolve_type_piix3_xen_device.mbx
> >>
> >>     Now the branch 'shentey_work' contains all the patches and you can test.
> >>
> >>     Regards,
> >>
> >>     Phil.
> >>
> >
> >Hi Phil and Bernard,
> >
> >I tried applying these 3 patch series on top of the current qemu
> >master branch.
> >
> >Unfortunately, I saw a regression, so I can't give a tested-by tag yet.
>
> Hi Chuck,
>
> Thanks for your valuable test report! I think the culprit may be commit https://lists.nongnu.org/archive/html/qemu-devel/2023-01/msg00102.html where now 128 PIRQs are considered rather than four. I'll revisit my series and will prepare a v2 in the next days. I think there is no need for further testing v1.
>
> Thanks,
> Bernhard

Hi Bernhard,

Thanks for letting me know I do not need to test v1 further. I agree the
symptoms are that it is an IRQ problem - it looks like IRQs associated with
the emulated usb tablet device are not making it to the guest with the
patched v1 piix device on xen.

I will be looking for your v2 in coming days and try it out also!

Best regards,

Chuck

>
> >
> >Here are the details of the testing I did so far:
> >
> >Xen only needs one target, the i386-softmmu target which creates
> >the qemu-system-i386 binary that Xen uses for its device model.
> >That target compiled and linked with no problems with these 3
> >patch series applied on top of qemu master. I didn't try building
> >any other targets.
> >
> >My tests used the xenfv machine type with the xen platform
> >pci device, which is ordinarily called a xen hvm guest with xen
> >paravirtualized network and block device drivers. It is based on the
> >i440fx machine type and so emulates piix3. I tested the xen
> >hvm guests with two different configurations as described below.
> >
> >I tested both Linux and Windows guests, with mixed results. With the
> >current Qemu master (commit 222059a0fccf4 without the 3 patch
> >series applied), all tested guest configurations work normally for both
> >Linux and Windows guests.
> >
> >With these 3 patch series applied on top of the qemu master branch,
> >which tries to consolidate piix3 and piix4 and resolve the xen piix3
> >device that my guests use, I unfortunately got a regression.
> >
> >The regression occurred with a configuration that uses the qemu
> >bochs stdvga graphics device with a vnc display, and the qemu
> >usb-tablet device to emulate the mouse and keyboard. After applying
> >the 3 patch series, the emulated mouse is not working at all for Linux
> >guests. It works for Windows guests, but the mouse pointer in the
> >guest does not follow the mouse pointer in the vnc window as closely
> >as it does without the 3 patch series. So this is the bad news of a
> >regression introduced somewhere in these 3 patch series.
> >
> >The good news is that by using guests in a configuration that does
> >not use the qemu usb-tablet device or the bochs stdvga device but
> >instead uses a real passed through usb3 controller with a real usb
> >mouse and a real usb keyboard connected, and also the real sound
> >card and vga device passed through and a 1920x1080 HDMI monitor,
> >there is no regression introduced by the 3 patch series and both Linux
> >and Windows guests in that configuration work perfectly.
> >
> >My next test will be to test Bernhard's published git tag without
> >trying to merge the 3 patch series into master and see if that also
> >has the regression. I also will double check that I didn't make
> >any mistakes in merging the 3 patch series by creating the shentey_work
> >branch with b4 and git as Phil described and compare that to my
> >working tree.
> >
> >I also will try testing only the first series, then the first series and the
> >second series, to try to determine in which of the 3 series the regression
> >is introduced.
> >
> >Best regards,
> >
> >Chuck


