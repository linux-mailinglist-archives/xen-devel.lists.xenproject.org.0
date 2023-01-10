Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FC9663A02
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 08:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474309.735413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF97Z-0005PF-J7; Tue, 10 Jan 2023 07:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474309.735413; Tue, 10 Jan 2023 07:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF97Z-0005ME-Fi; Tue, 10 Jan 2023 07:32:33 +0000
Received: by outflank-mailman (input) for mailman id 474309;
 Tue, 10 Jan 2023 07:32:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tiyo=5H=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pF97Y-0005Lu-5D
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 07:32:32 +0000
Received: from sonic308-54.consmr.mail.gq1.yahoo.com
 (sonic308-54.consmr.mail.gq1.yahoo.com [98.137.68.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef4ba9c2-90b8-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 08:32:29 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Tue, 10 Jan 2023 07:32:27 +0000
Received: by hermes--production-ne1-7b69748c4d-bxfkx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 00995f78f0d4fd001b9b8f1699ee7ed7; 
 Tue, 10 Jan 2023 07:32:21 +0000 (UTC)
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
X-Inumbo-ID: ef4ba9c2-90b8-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673335947; bh=06K19SzqcQMh+hYhDSeIvS+A1/F0qrYWujU3+eUpzVU=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=P4bfXUJ/Oj1sE4kdQK8QT7e6pQLcH4DLBCs17Yh/tS3Ez3cmciomWmb4LuLRhJP1HfsHObKGh6HOOeS8Xe1evZLESy46Ke0IIZOfyvR5TaowAotPqoqW6K8HwPOz6F6+d9Zkq41rYMNbI7t3I16CFg+6oiLVrAxCDtgX5cRXYol54on/6QCG/l/56UPQEQV7Zs8WuItBQ4W/BkHZGfwLeMuEnYAWq90yTqwhHgvIZ33idYcDJAMv8V82mJtyyygNeXnbde2mkOhR/l0OD3iJ6I2lQrOTQFIjl/1K9AQHNTODe0mRxaIO+FZqH5Y3V2mOWRgfJRigw1damskw5/JFGw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673335947; bh=qiEct4R8jT0mwdX7UpFLVNjLYCi7GJda04po0C6cY4K=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=dxATIrmQpuS93tvMUICVaqOLCSFREPVzQm4SQQugtK1YPeVS2q9ps0WdrqXcNA8JnZS14CuT5D3lf2bkSjPAiF2AI5xHeCRjMg76cBu9DT/26QyKjNCKe9oqKduMHlne1lVSzDriGhPOL7edrRGwo6a0SaSAUFW/PgDguRFaBrzLE3nd6L5IN79QIBKK7Le/RcC4nEFjBBA+WcuupHF4ahPLaVmENgVLfiC1kdL/YdHkwSYVkmp94whzGeKAaY4P+gd+5GeTj7G4GicfViEaRlpFNaW62hOrDky620gTBUi6UYJTHfhsnY5oDssexMHQWe5b/Ol5NlzjhGmwiR4kaQ==
X-YMail-OSG: zDrCPGAVM1nKO6q4JEwQd0TLn_dx5z3NGvb.UsTIFqQDWW2_QU9Eu2G7qEfPxvn
 XkCvt4XXYgZtyeSQWLmALXZwrgXq95f3.TgppA__RxHl2_GQTuNqOntSLARx7z16_SZOC405wb5P
 dmzs_SLzVX_qv_XAe1e_6SyqumXPBj6g5GY5vJ32bommQhqlbh3CGW6MD.fVzKl9NgGDN3HrNgSQ
 uAqOsLTA6yprOwHUOp.jPAXpcTvCi9d324aATxwhzSvleqjnwVkZn7.qn0qv7hkItw6WyBsQrxW9
 GkGE44Ly9UU7y5vUQJkskGkygQhAgs9AHjhRT7nJwtN__Pvcksfu_wlX8yqABQ7_G9iqculoxG4y
 3N76GrDm4ukxhPx_WZhnzWpNyRzz80UhhRKJHmfr2SDpWhQyPbl_CKpFXgKNHmvYrAb.9_0WV8LG
 sfGzj5axvp6izZZcH8i9jRrLGhbeXoO3ntqGWtVmSG8h_H87yu779IndHgls17iUGtFSMaQQaren
 wCXzNwj8Mbr4CgzwbasQQNRRKLivGLBw0c_I1mnFBjK475kVyMxgQ_DQP2oeB5s5jAspyM7QUfbH
 Shsn6NMbJotgQEYehpNI7sI6b6hHan.fcaD9pZanWen2QJQ89bYCqEyrIZigK_pUUS0.WfhsD_lZ
 I.uembUWw4jBGrAeesqFtmiyr6Ww7CeQqsdhWtbuk3FQZZQffz5nznf0rql2k0YcWpsAteOzHDTJ
 FwSYM3hZPqRbZQ9WMON8xK9a.MMPp87IIDpufxohXIgG4MUocFZrK7jblRzdpVZibGJt6IDf2kPe
 LgZI24cRTUnet.inN02WTYM8RAOG_6P4CYRbbnWiCKnHE3Qx2R7yr4WPETBJCOVUlA2jODAoovrw
 fe0vpIdUqJONkeZGwY29p4dDU4c3NsMsDrh_9KUDZJBq78vq6_5dOHXMf3VC8MOP3dhqXLPK.gX7
 pzIIJ2l0CzzWntdcoP0Q87sdfoLzjX3VyrxNW4foh07rf0Yaa0KWDpNRWhvNozVVaGInDjlbM.cA
 oKZiuwxYjtAz0ODQWXWcV0rAKZeLpaMoMY2z6vennE2mZ45bnr7m8II3joniWnTraAQPmpQNUSn.
 qggbLLzSlv3UZTl_F.0EXeo6egH.Pj8QT_2xomUopIk707Fk9iKnf17dOicMfMA6fBFKQTmdjx1L
 .fNEoRI86hN1VZQeWgLNOYr4xdXY.R7gTT5En8.yX8HynE62Z9gNja16xDbj4vzgnwJ0KX3oqKNN
 Jik3xHuCy7j7pKO_iJCnAHxOB5v4MWP6v9oIozpMARdeUxxQ83_gBcT6XOvQLJ0oH9ScGCwqgTGr
 OzOXeWZ7XMTcamXOkKlxaF01ZaMBVLtJulpLcbV2pPN0wrDCPBG5cVf1xavIlH87eQmkif_junML
 9.0qn0OePyv06EnHlmaWnGTtQoL.zk56j0DYmI0ib2L3CBN5mDL.eSuW0X4b4HGbQVvtOgstUX5y
 XmAJ9Sp6UPd0rdKwidP5cjPkhLo6Sr6xInsgVBJ_EvRNI1JMEojo9yED6ekX_tSyRvjETuPSRLVb
 sdtAdswCL3FueL6z0nVCay0k92c_neQjcW0jXN8R935uG_oQzaZwtjEpxD2lxN7jrn9zD0ursLDO
 6TVFTGaih3SthGsIFisrTjLbPrbaltMDqAcMLbV9gtHNSnlnZVzCnbZETFA021MCzqIwNZ.evpmB
 IqSEl0LWxCUt2aq5MTQ7nHxG3b7vFLRuMbLiNPTIMOOui8SRv34t2hJ3zyjuTBuh5OvuBBnCS820
 z7H6ZgNdO.Q_.S7YUny5YRmfs1V7GIherasBf_Q8rceMnWouTuYeZyhkIIjmCNdGeHvTq9bFUPaZ
 4N7zIVUNH8RGLjLS4EaE8RZNJcG.nY2MikLlUaWkuqD6yOJtIvAEMfzKCaCRaPVZUPREFB_in47z
 kCICh4y3IQ0euEB8rs.nhin7kauvYXZUUKfQeeciiRXauvgOmVYavlYsHCBCVJMLVzKFQ9tnT0XX
 MRCnKbyhcI.VwF36AOBqf2gpGWxikKtYCqVADkDFLWh3Bs5zgBn7xtkk3TU8W_e8Gu8435nZShSM
 dEuZiEJ4mNfNwSbbIW9ZgD7duiaGPWXC92mTj.gih4ivW7mIlqPGFuAx4ycrvLpyjAIjpJFEysoF
 7ieCCClAAdBj.mrJ1DBCuQ7LxIHICbkPjXE04JWObdFgFypR1OhTpAyHTnxk1g23nynNljo4aAU8
 -
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	qemu-devel@nongnu.org
Subject: [XEN PATCH v2 0/3] Configure qemu upstream correctly by default for igd-passthru
Date: Tue, 10 Jan 2023 02:32:01 -0500
Message-Id: <cover.1673300848.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <cover.1673300848.git.brchuckz.ref@aol.com>

Sorry for the length of this cover letter but it is helpful to put all
the pros and cons of the two different approaches to solving the problem
of configuring the Intel IGD with qemu upstream and libxl in one place,
which I attempt to do here. Of course the other approach involves a
patch to qemu [1] instead of using this patch series for libxl.

The quick answer:

I think the other patch to qemu is the better option, but I would be OK
if you use this patch series instead.

Details with my reasons for preferring the other patch to qemu over this
patch series to libxl: 

I call attention to the commit message of the first patch which points
out that using the "pc" machine and adding the xen platform device on
the qemu upstream command line is not functionally equivalent to using
the "xenfv" machine which automatically adds the xen platform device
earlier in the guest creation process. As a result, there is a noticeable
reduction in the performance of the guest during startup with the "pc"
machne type even if the xen platform device is added via the qemu
command line options, although eventually both Linux and Windows guests
perform equally well once the guest operating system is fully loaded.

Specifically, startup time is longer and neither the grub vga drivers
nor the windows vga drivers in early startup perform as well when the
xen platform device is added via the qemu command line instead of being
added immediately after the other emulated i440fx pci devices when the
"xenfv" machine type is used.

For example, when using the "pc" machine, which adds the xen platform
device using a command line option, the Linux guest could not display
the grub boot menu at the native resolution of the monitor, but with the
"xenfv" machine, the grub menu is displayed at the full 1920x1080
native resolution of the monitor for testing. So improved startup
performance is an advantage for the patch for qemu.

I also call attention to the last point of the commit message of the
second patch and the comments for reviewers section of the second patch.
This approach, as opposed to fixing this in qemu upstream, makes
maintaining the code in libxl__build_device_model_args_new more
difficult and therefore increases the chances of problems caused by
coding errors and typos for users of libxl. So that is another advantage
of the patch for qemu.

OTOH, fixing this in qemu causes newer qemu versions to behave
differently than previous versions of qemu, which the qemu community
does not like, although they seem OK with the other patch since it only
affects qemu "xenfv" machine types, but they do not want the patch to
affect toolstacks like libvirt that do not use qemu upstream's
autoconfiguration options as much as libxl does, and, of course, libvirt
can manage qemu "xenfv" machines so exising "xenfv" guests configured
manually by libvirt could be adversely affected by the patch to qemu,
but only if those same guests are also configured for igd-passthrough,
which is likely a very small number of possibly affected libvirt users
of qemu.

A year or two ago I tried to configure guests for pci passthrough on xen
using libvirt's tool to convert a libxl xl.cfg file to libvirt xml. It
could not convert an xl.cfg file with a configuration item
pci = [ "PCI_SPEC_STRING", "PCI_SPEC_STRING", ...] for pci passthrough.
So it is unlikely there are any users out there using libvirt to
configure xen hvm guests for igd passthrough on xen, and those are the
only users that could be adversely affected by the simpler patch to qemu
to fix this.

The only advantage of this patch series over the qemu patch is that
this patch series does not need any patches to qemu to make Intel IGD
configuration easier with libxl so the risk of affecting other qemu
users is entirely eliminated if we use this patch instead of patching
qemu. The cost of patching libxl instead of qemu is reduced startup
performance compared to what could be achieved by patching qemu instead
and an increased risk that the tedious process of manually managing the
slot addresses of all the emulated devices will make it more difficult
to keep the libxl code free of bugs.

I will leave it to the maintainer of the code in both qemu and libxl
(Anthony) to decide which, if any, of the patches to apply. I am OK with
either this patch series to libxl or the proposed patch to qemu to fix
this problem, but I do recommend the other patch to qemu over this patch
series because of the improved performance during startup with that
patch and the relatively low risk that any libvirt users will be
adversely affected by that patch.

Brief statement of the problem this patch series solves:

Currently only the qemu traditional device model reserves slot 2 for the
Intel Integrated Graphics Device (IGD) with default settings. Assigning
the Intel IGD to slot 2 is necessary for the device to operate properly
when passed through as the primary graphics adapter. The qemu
traditional device model takes care of this by reserving slot 2 for the
Intel IGD, but the upstream qemu device model currently does not reserve
slot 2 for the Intel IGD.

This patch series modifies libxl so the upstream qemu device model will
also, with default settings, assign slot 2 for the Intel IGD.

There are three reasons why it is difficult to configure the guest
so the Intel IGD is assigned to slot 2 in the guest using libxl and the
upstream device model, so the patch series is logically organized in
three separate patches; each patch resolves one of the three reasons
that cause problems:

The description of what each of the three libxl patches do:

1. With the default "xenfv" machine type, qemu upstream is hard-coded
   to assign the xen platform device to slot 2. The first patch fixes
   that by using the "pc" machine instead when gfx_passthru type is igd
   and, if xen_platform_pci is set in the guest config, libxl now assigns
   the xen platform device to slot 3, making it possible to assign the
   IGD to slot 2. The patch only affects guests with the gfx_passthru
   option enabled. The default behavior (xen_platform_pci is enabled
   but gfx_passthru option is disabled) of using the "xenfv" machine
   type is preserved. Another way to describe what the patch does is
   to say that it adds a second exception to the default choice of the
   "xenfv" machine type, with the first exception being that the "pc"
   machine type is also used instead of "xenfv" if the xen platform pci
   device is disabled in the guest xl.cfg file.

2. Currently, with libxl and qemu upstream, most emulated pci devices
   are by default automatically assigned a pci slot, and the emulated
   ones are assigned before the passed through ones, which means that
   even if libxl is patched so the xen platform device will not be
   assigned to slot 2, any other emulated device will be assigned slot 2
   unless libxl explicitly assigns the slot address of each emulated pci
   device in such a way that the IGD will be assigned slot 2. The second
   patch fixes this by hard coding the slot assignment for the emulated
   devices instead of deferring to qemu upstream's auto-assignment which
   does not do what is necessary to configure the Intel IGD correctly.
   With the second patch applied, it is possible to configure the Intel
   IGD correctly by using the @VSLOT parameter in xl.cfg to specify the
   slot address of each passed through pci device in the guest. The
   second patch is also designed to not change the default behavior of
   letting qemu autoconfigure the pci slot addresses when igd
   gfx_pasthru is disabled in xl.cfg.  

3. For convenience, the third patch automatically assigns slot 2 to the
   Intel IGD when the gfx_passthru type is igd so with the third patch
   appled it is not necessary to set the @VSLOT parameter to configure
   the Intel IGD correctly.

Testing:

I tested a system with Intel IGD passthrough and two other pci devices
passed through, with and without the xen platform device. I also did
tests on guests without any pci passthrough configured. In all cases
tested, libxl behaved as expected. For example, the device model
arguments are only changed if gfx_passthru is set for the IGD, libxl
respected administrator settings such as @VSLOT and xen_platform_pci
with the patch series applied, and not adding the xen platform device to
the guest caused reduced performance because in that case the guest
could not take advantage of the improvements offered by the Xen PV
drivers in the guest. I tested the following emulated devices on my
setup: xen-platform, e1000, and VGA. I also verified the device that is
added by the "hdtype = 'ahci'" xl.cfg option is configured correctly
with the patch applied. I did not test all 12 devices that could be
affected by patch 2 of the series. These include the intel-hda high
definition audio device, a virtio-serial, device, etc. Once can look
at the second patch for the full list of qemu emulated devices whose
behavior is affected by the second patch of the series when the guest
is configured for igd gfx_passthru. These devices are also subject
to mistakes in the patch not discovered by the compiler, as mentioned
in the comments for reviewers section of the second patch. 

[1] https://lore.kernel.org/qemu-devel/a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com/

v2: correct the link to the qemu patch - the link in v1 was to an
    incorrect version of the patch

Chuck Zmudzinski (3):
  libxl/dm: Use "pc" machine type for Intel IGD passthrough
  libxl/dm: Manage pci slot assignment for Intel IGD passthrough
  libxl/dm: Assign slot 2 by default for Intel IGD passthrough

 tools/libs/light/libxl_dm.c | 227 +++++++++++++++++++++++++++++-------
 1 file changed, 183 insertions(+), 44 deletions(-)

-- 
2.39.0


