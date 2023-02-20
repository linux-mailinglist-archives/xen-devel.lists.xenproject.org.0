Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D969D361
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 19:54:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498334.769181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUBIm-0003Jk-0R; Mon, 20 Feb 2023 18:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498334.769181; Mon, 20 Feb 2023 18:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUBIl-0003Gt-TQ; Mon, 20 Feb 2023 18:54:15 +0000
Received: by outflank-mailman (input) for mailman id 498334;
 Mon, 20 Feb 2023 18:54:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H4/G=6Q=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pUBIj-0003Gn-7L
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 18:54:14 +0000
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
 (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f330b2d0-b14f-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 19:54:08 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Mon, 20 Feb 2023 18:54:05 +0000
Received: by hermes--production-ne1-746bc6c6c4-z5xkm (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 709e109f7eba8bdeb4f598a7ae93bd2d; 
 Mon, 20 Feb 2023 18:54:01 +0000 (UTC)
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
X-Inumbo-ID: f330b2d0-b14f-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1676919245; bh=NF//yOvPaFCVVecx7YqcRH4ZXNK0YgLwjwhziF0CEH8=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=s4Hk9FJoHUZddrgpcO0mPLfAsZJx77/t6acqta9sONof40uZdAvJ3ANPwRDYB5YZrMjAIdJHURZe7orO89lAltseeXjwWA4zj7iBZTA9DZGbHECG367c6mROLh6O0nRm9MFu1sBDA0LgsCdXfjhboy+3V/UI1pfx2Rsn1R26ElL/eDsw1cf+Y9dNNM8XyCEOvr1y9FEWZ3cgfjI4zE5WVhjhwilMCXJlwn7mVq2zo4i5cAvdfmHF+eoWZtBK8LErlquPRHRvh9F8DF9ErI2Rz+ohCSBHAn5TQQ8mROUl0DWERSLReXgdovaVRj3RF2/XGjAgmdqtGPUx+Koj14YrvQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1676919245; bh=+Q9u8MrfUSTcN3A+R9yrY5VGpInvxolcKsSA/Q1+dU/=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Rf8dKu8Oy1UjBfc4r/HGgdPoLhkNta9skX17ETHf6TmnxCnsAGS/pIClYunaFVDAld986Ff20+sE8jsBuMAMg7Lcwb70OcEKWpcoN4NbixdkUze79k9yZqQViAHnKqtKYG8jK2MDFwULD80Q3DEQfYxBMdMEQY+ilQcaSAnRI9+8NFPZBNfvk+C4Q3fyCgeDfPwGnZkvDKQgSagQ8mpR/nPpnuUKT+XlRYnQw7RaAZ7fT3GZYg8DGWh/9rM7m9/OXEnNuzPpmstrOHqStKWcoD11Sw1PrAuP/YfXQN+SxvPD2oGHU1WYQNMWHKDW8MFnW9vW/0TCoV6vt7MwDujVVw==
X-YMail-OSG: UM8bUVEVM1nIIoIvSsGDIAh30tj.HfTIugrcVUw9H6wXlACjvNzfpfjyweVR2e7
 rkshUUAC60LNVNDCm2i6QN2H71z7BquDwevzzKZRYGkSDQFrMDFxzM5FNM9u4J5bo9GD8m6vQxi5
 UFVlvtWF5nx9ZRaR8oeAjHUNSdewD2dnhGPi4M5kj5xC9a4pI5hmEebf9Sjmu.EsYRUGEijNiANm
 I14HSncUTa52S0bRtGXGb7lzGEXZt6IBo2p0Cmh4zslZlvElOblQW7bVO88kAlGZciKIaHWwXfNV
 xD1UAyJ..ftxMARiV0cPGAVsuG0B9_zkVe5ze127SmgFc9FYDwSFyf8FZOmqJKSJLjr5BmP1eP6X
 QD3gF.sDKqMFS3XbL06CqX51Do8A1_LcOUOYttt2NFj0u2hxCsd7MucxUKreayF0MgIBCfRUhXW8
 zbYMn2uUj5MGq9PZv_n6lGUyDEkM3ThMC1sl1e0xxAEnjjp3mYLP_mGjP2HmedYZPa1hMsRZHDmr
 flY4pVkm6EF5HLxWY1fSH1xfEZ4j8JaK8qhWDIbkWO46Jdb9OBplz8c1bRkZMWjfkXzeI9GXlI.u
 KVfpMu8la5l9Ys1DbIH4F1VKtntMJqW_D2eNYyzPgyGI7TiC6u7tpYxuc_bICNn4FawlnF1rccoz
 yg1mGDPgOCzGBfo6RZax40jmcu_q5JqG7zCIhMA8qjOIp9MRTCeMaN5wC3VPiqo9lyC2Xp7FEfaC
 wgFu_zPuV_rVHy30keYBs3gUwEUlCx4kDfCCrHRDM5cMsWuo6juF071xT.JTiF71vs5mDfRgzcGs
 Avk.XHilayscWLuPGLCxrVe0aYcNIa55tRv3iopNDLAphSJZDtBG0q7QLtQHn.3ROH33awGmivGT
 Fc4FaTkAFkd18.KFmrMnXWI4d5QQeTlusL2Dg1vr.6B1L0oO1ke3B7MB_uLWoNZJzpOoObJttrur
 TJ2zB69oIv.bROxGBX32d_hij9CWanyXGVmelbb7Oi9SJuUXeOuEQsIjCqhGy6h1RxPz.CbuHmMa
 syzFCVNl4RQ7445UHqIIfXZfWMsmAv6peytJ_GdUJJYu18a4Ma9f3sI65tkBBdLsRPMSG.Od8q9F
 qWSLa690XTmDqRysqr77wjFRyX7doLEnSYo1Df3ohmFggs72OkMzcMXzddRwczZ28wKrpHmV29DB
 56q2ImN2dCULQAcFFIzktEnCyZYlf2GdibN.U9vFlXSxTPfJil_W4neks.ZeR4vdNvN05tPwfdkl
 WwC2k9cK7eVsBkGd4w5F3e7916DkuYh.dmI9yTIbGmXJojreLKYOPtlvZ1tImLjaAACumOPj69K2
 ggPEFD1AbLRnYx6kJDSKzKJW1gwCaP_lVDYn7XdS0zd7TtyKoWyeUAYheFQAKGU7c3hrNOTEnx11
 FS5cbIYIwHtVze2v6wcBP3TZnD.6G5ia68xtXikK3gf5I7.x_0C9LdNJQPnDzrtI3rusrMfmMVht
 X3RwK.LKwGf5bn.GXY09ZrRQ45ZM2Qzrpdfa6NxumUmP5L9K_OXt0YSyt5EXowM2VZU1D5_W0eHb
 sJMPb.xMgPMwXtCq1ZXrLSpy3CangT.yOHhMPYP17qoCxhpjaU08lic9MNzCc0gqRLpUz9GFsCIo
 HsscjpMjnyzg6KWV8XAojRnj3n4LWLTvUxgbmr3guodlDj_VFQTcpfYAohKRcVzGDd_VAV3216TT
 .dTIqPL6iRjfQbZ1VgGcgpfV41sqtiAz0rOuHrebhYOopwOPktf_ETwWBuYZe_T57a70ytPO9I9O
 UwWGMC6oeXc6irO01HsqpQaNC7hW4eFnCpSbw4Q091N6gpoM1dIBKwmfkAV9Fy9xKr_r6hMx8qvX
 QU4GzGEfHV1aEwLiqCszT9wNMg.ADpBQmNggr9SZDfkbJjvrrQC4H5DZzxmbY2u49vfswvwObwuv
 eo2Lezq5W43lFl63ltWgcjBBn3k5jY3bbx8rdUjWbu5g.WMfOCydG3vJSLE3qY4hKuI4PFZ5BR8F
 IrUQ2tYMbDPoWo0gg2bZ62lPQpzsNvSQR8TYI8TS2dQgqhvNcEGlV38lip_bDvX6PGWIpm5CyhUj
 Yg0VdHD6cCRx_6VcdYRCpzx0yCYo9gPxWdXRSGH8z9.ShmVDozcufBGHCyGQkqgmGb6.XXAzNH7v
 lEl0EFvySK1yk_sydiUuzjqPNorFKxbNcpavV_nG8DHP_WICpJbjzO7yzAJnA_NXVRAt_3E5QTon
 _
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH] libxl/dm: Stop using "xenfv" machine in the Qemu upstream device model
Date: Mon, 20 Feb 2023 13:53:53 -0500
Message-Id: <c2cb963b24db11a87f1899ce53fe32d0cda91261.1676917444.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <c2cb963b24db11a87f1899ce53fe32d0cda91261.1676917444.git.brchuckz.ref@aol.com>

The "xenfv" machine is almost a clone of the "pc" machine with accel=xen
in Qemu upstream and is mostly redundant, so with this patch libxl
stops using the "xenfv" machine type in favor of the "pc" machine type
with accel=xen.

Looking at the Qemu upstream code in hw/i386/pc_piix.c, the obvious
differences between the "xenfv" machine and the "pc" machine are:
  - The "xenfv" machine unconditionally adds the xen-platform pci device.
  - The "xenfv" machine uses the igd-passthrough-i440FX host pci device
    instead of the i440FX pci device when the guest is configured with
    igd-passthru=on.

This patch adds the xen-platform pci device using a command line option
with the "pc" machine type instead of relying on upstream Qemu to add
it as part of the process of building the "xenfv" machine if the
administrator has not explicitly disabled the xen-platform pci device
in the domain configuration file. Therefore, the current behavior of
adding the xen-platform pci device unless the administrator configures
the guest with the xen_platform_pci option set to 0 is retained.

So this patch does not affect guest behavior except as follows:

  - If the guest is configured for Intel igd passthrough, the guest will
    no longer be configured with the igd-passthrough-i440FX host pci
    device. For this reason, Qemu upstream should be patched so the
    igd-passthrough-i440FX host pci device will be used when the guest
    is configured for igd-passthru.

  - Live migrations of guests configured to use the "xenfv" machine
    when they were created to a host that configures the device model
    to use the "pc" machine instead might be affected. For this reason,
    it might be appropriate to deprecate the "xenfv" machine in upstream
    Qemu and it might be necessary patch upstream Qemu to properly
    handle these live migrations.

  - Testing reveals the display resolution can be affected in some
    guests by the change from the "xenfv" machine to the "pc" machine
    but there is no degredation in performance, just a possible need
    to reset the display resolution to the desired value.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Sorry about how long this discussion is, but it is helpful to again
bring together all the considerations about this patch and its
alternatives in one place.

I submit this as an RFC patch because some caveats might make this patch
more trouble than it is worth.

The first caveat is complications that might be involved for existing
guests that currently use the "xenfv" machine and are migrated to a host
with this patch that uses the "pc" machine instead.

The second caveat is the effect of the patch on display resolution in
the guest. Details of tests that reveal the display resolution can be
affected by this patch:

Testing existing guests that previously used the "xenfv" machine reveals
a subtle difference that is not obvious from reading the Qemu upstream
code in hw/i386/ppc_piix.c. The tested guests were configured to use the
Qemu stdvga (bochs) emulated video device with a vnc display. When the
guest is started using the "xenfv" machine, the resolution of the
display manager (either gdm3 or lightdm) is 1024x768, but when using
the "pc" machine with the xen accelerator, the resolution of the display
manager (either gdm3 or lightdm) is 1280x800. Also, the display
resolution of a user's graphical login session might be reset to a
default value when changing from the "xenfv" to "pc" machine type, but
the user can easily correct this by resetting the display resolution to
the desired value in the first graphical login session after changing
from the "xenfv" to the "pc" machine type.

On a more positive note, this patch will not introduce much of a
regression for users of the upstream Qemu igd-passthru feature because
that feature is already currently broken in upstream Qemu because
upstream Qemu currently fails to reserve pci slot 2 for the Intel IGD
and, in fact, with this patch, it is actually easier to patch upstream
Qemu to properly support the igd passthrough feature than it is
without this patch because, in that case, a more complicated alternative
patch to upstream Qemu that reserves pci slot 2 for the igd is required
to properly support the igd passthrough feature if we continue to use
the "xenfv" machine type:

http://patchew.org/QEMU/b1b4a21fe9a600b1322742dda55a40e9961daa57.1674346505.git.brchuckz@aol.com/

This alternative patch, however, has been reviewed and could be merged
into Qemu anytime at the discretion of the Qemu Xen maintainers. Some of
the "pc" machine maintainers might want an additional patch to Qemu
upstream to be applied to change how upstream Qemu's slot_reserved_mask
works if this alternative patch is merged into upstream Qemu.

A much simpler patch to Qemu upstream is available to fix support for
the igd passthrough feature in upstream Qemu for the "pc" machine type:

https://patchew.org/QEMU/a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz@aol.com/

This patch has not been fully reviewed yet, but it does have an Acked-by
and this is the patch that would be applied to upstream Qemu in
coordination with this patch to libxl to ensure the guest uses the
igd-passthrough-i440FX pci host device when igd-passthru=on. Also, to
better support the intel igd, additional patches to libxl could be
applied to more easily configure the guest properly for the igd.

So, do we want to completely stop using the "xenfv" machine as suggested
here:

https://lore.kernel.org/xen-devel/Y9EUarVVWr223API@perard.uk.xensource.com/

or, do we want to continue to use the "xenfv" machine and fix the
igd passthrough feature in Qemu with the more complicated patch to
Qemu that has been reviewed and, since it continues to use the "xenfv"
machine type, it also avoids the problem of how the fix might affect
existing guests that currently use the "xenfv" machine type?

And finally, there is a third option, which is to use this previously
proposed alternative patch series to libxl to fix igd passthrough support
by only changing guests configured for igd passthrough from the "xenfv"
to the "pc" machine type and leaving other existing guests unchanged:

https://lore.kernel.org/xen-devel/20230110073201.mdUvSjy1vKtxPriqMQuWAxIjQzf1eAqIlZgal1u3GBI@z/

which would avoid the complications of migrating other existing guests
to the "pc" machine type and also allow use of the simpler patch to Qemu
to fix support for igd passthrough in upstream Qemu.

This alternative patch series also has not been fully reviewed yet but
it might actually be the best approach overall after considering the
complications of stopping use of the "xenfv" machine type in all cases
instead of stopping its use only in the case of guests configured for
igd passthrough.

 tools/libs/light/libxl_dm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index fc264a3a13..9a3c27ae9c 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1373,6 +1373,15 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         if (b_info->cmdline)
             flexarray_vappend(dm_args, "-append", b_info->cmdline, NULL);
 
+        /*
+         * Since we are no longer using the "xenfv" machine, we don't
+         * rely on Qemu upstream to add the xen platform pci device
+         * and instead add it here as a command line argument.
+         */
+        if (libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
+            flexarray_append_pair(dm_args, "-device", "xen-platform");
+        }
+
         /* Find out early if one of the disk is on the scsi bus and add a scsi
          * controller. This is done ahead to keep the same behavior as previous
          * version of QEMU (have the controller on the same PCI slot). */
@@ -1809,14 +1818,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             flexarray_append(dm_args, b_info->extra_pv[i]);
         break;
     case LIBXL_DOMAIN_TYPE_HVM:
-        if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
-            /* Switching here to the machine "pc" which does not add
-             * the xen-platform device instead of the default "xenfv" machine.
-             */
-            machinearg = libxl__strdup(gc, "pc,accel=xen,suppress-vmdesc=on");
-        } else {
-            machinearg = libxl__strdup(gc, "xenfv,suppress-vmdesc=on");
-        }
+        machinearg = libxl__strdup(gc, "pc,accel=xen,suppress-vmdesc=on");
         if (b_info->u.hvm.mmio_hole_memkb) {
             uint64_t max_ram_below_4g = (1ULL << 32) -
                 (b_info->u.hvm.mmio_hole_memkb << 10);
-- 
2.39.2


