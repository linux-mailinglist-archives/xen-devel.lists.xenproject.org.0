Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447DC20CDB6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 11:57:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpqWw-0004iG-ET; Mon, 29 Jun 2020 09:56:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lswg=AK=tttech.com=prvs=442971002=jan.ruh@srs-us1.protection.inumbo.net>)
 id 1jpqWv-0004iA-30
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 09:56:49 +0000
X-Inumbo-ID: d6ac513c-b9ee-11ea-854b-12813bfff9fa
Received: from mail.tttech.com (unknown [217.19.35.52])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6ac513c-b9ee-11ea-854b-12813bfff9fa;
 Mon, 29 Jun 2020 09:56:45 +0000 (UTC)
IronPort-SDR: 8jW9NScFxqx3q9NYF46JfkCa2W12ZRogXHWjHoTGxN5/f0RUMbst2Gq2dMf2PF5lTNuW07dpSV
 6+J201Dp43Kz1ij9SwR4YpNztK883DnFNzC8UMEz+snGrrfpNM/ohTBrT3vhFbM3f9HOrB9+Zb
 5PYdRNQWkXyyICn/ldWr0+4iR6m7eNyuQUDlCkoC50pdULKEYiPl4AC8/phASsxYmYQw9YbeJ+
 ED/BIqGT5sge/UTxtUR/cx50PQPkAQOCdUevW2xeEFHIHde0FKLUmVOkImopVznGLY8LClqvqg
 9go=
X-IronPort-AV: E=Sophos;i="5.75,294,1589234400"; 
   d="scan'208";a="9449211"
Received: from unknown (HELO mail.tttech.com) ([10.108.0.226])
 by mail-int.tttech.com with ESMTP; 29 Jun 2020 11:56:44 +0200
Received: from EXVIE02.ds1.internal (10.108.0.226) by EXVIE02.ds1.internal
 (10.108.0.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 29 Jun
 2020 11:56:43 +0200
Received: from EXVIE02.ds1.internal ([fe80::4ccf:d313:b2a8:c054]) by
 EXVIE02.ds1.internal ([fe80::4ccf:d313:b2a8:c054%6]) with mapi id
 15.01.1913.007; Mon, 29 Jun 2020 11:56:43 +0200
From: Jan Ruh <jan.ruh@tttech.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: AW: Kernel requires x86-64 CPU, after modifying arch_shared_info
 struct
Thread-Topic: Kernel requires x86-64 CPU, after modifying arch_shared_info
 struct
Thread-Index: AQHWTehUS5L/6eMJQEyE2773H88H5KjvLyGAgAAjyHY=
Sensitivity: personal
Date: Mon, 29 Jun 2020 09:56:43 +0000
Message-ID: <af1c2ea2298a4115baf50b580caa0017@tttech.com>
References: <6f88fc3e2795436fa1f30dd026dd8eda@tttech.com>,
 <20200629091823.GF735@Air-de-Roger>
In-Reply-To: <20200629091823.GF735@Air-de-Roger>
Accept-Language: de-DE, en-GB, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.102.6.20]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> Did you try backing up your changes and seeing if the same happens?

If backing up my changes everything works as expected.

> Did you rebuild both the Xen hypervisor and the tools?

Yes, I rebuild both Xen hypervisor and the tools.

> Pasting your xl config file would be helpful in order to help debug.

As requested my xl config:
    type=3D"hvm"; extra=3D"console=3Dhvc0 earlyprintk=3Dxen";
    kernel=3D"/usr/lib/kernel/vmlinuz-domu";
    ramdisk=3D"/usr/lib/kernel/initrd.img-domu";
    root=3D"/dev/xvda2 ro";
    memory=3D1024;
    autoballoon=3D"off";
    xen_platform_pci=3D1;
    pae=3D1; acpi=3D1; apic=3D1; vcpus=3D1;
    name=3D"vm1";
    disk=3D["file:domu.img,hda,w"];
    vif=3D["bridge=3Dxenbr0"];
    vfb=3D["type=3Dvnc,keymap=3Dde"];
    vnclisten=3D"192.168.2.4:0";
    boot=3D"c";'

> Posting your changes might also help spot something wonky.

diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x8=
6/xen.h
index 629cb2ba40..61c46504a5 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -265,6 +265,14 @@ struct arch_shared_info {
     /* There's no room for this field in the generic structure. */
     uint32_t wc_sec_hi;
 #endif
+
+    uint32_t st_version;
+    uint64_t time_sec;
+    uint64_t time_nsec;
+    uint64_t cycle_last;
+    uint32_t mult;
+    uint32_t shift;
+
 };
 typedef struct arch_shared_info arch_shared_info_t;

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index c39fbe50a0..2782cb5127 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1254,15 +1254,15 @@ void update_domain_synctime(struct domain *d)
 {
     uint32_t *st_version;

+    st_version =3D &shared_info(d, arch.st_version);
     *st_version =3D version_update_begin(*st_version);
     smp_wmb();

+    shared_info(d, arch.mult)        =3D global_time.mult;
+    shared_info(d, arch.shift)       =3D global_time.shift;
+    shared_info(d, arch.cycle_last)  =3D global_time.cycle_last;
+    shared_info(d, arch.time_sec)    =3D global_time.time_sec;
+    shared_info(d, arch.time_nsec)   =3D global_time.time_nsec;

     smp_wmb();
     *st_version =3D version_update_end(*st_version);

diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 72e7d33708..4b9ad0261b 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -503,22 +503,22 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u=
_sysctl)
     }
     case XEN_SYSCTL_adjust_gtime:
     {
+        struct adjust_gtime *adjust_gtime =3D (struct adjust_gtime*) &op->=
u.adjust_gtime;

+        ret =3D do_adj_gtime(adjust_gtime);
+
         copyback =3D 1;

         break;

diff --git a/tools/include/xen-foreign/reference.size b/tools/include/xen-f=
oreign/reference.size
index bb2ada32fb..9afd11e5fa 100644
--- a/tools/include/xen-foreign/reference.size
+++ b/tools/include/xen-foreign/reference.size
@@ -9,6 +9,6 @@ vcpu_guest_context        |     344     344    2800    5168
 arch_vcpu_info            |       0       0      24      16
 vcpu_time_info            |      32      32      32      32
 vcpu_info                 |      48      48      64      64
-arch_shared_info          |       0       0      28      48
+arch_shared_info          |       0       0      64      88


global_time is a static struct in time.c, no existing Xen code is changed, =
just functions added that are being called from the sysctl adjust_gtime.

Further tests show that in /tools/libxc/xc_dom_binloader.c: xc_dom_parse_bi=
n_kernel xc sets the dom->guest_type to "xen-3.0-x86_32" instead of "xen-3.=
0-x86_64". I also cannot see though how it can be connected to my change to=
 arch_shared_info.

Sorry for the banner, I always forget that the mail client adds that thing,=
 I hope it doesn't do it again.

Jan



CONFIDENTIALITY: The contents of this e-mail are confidential and intended =
only for the above addressee(s). If you are not the intended recipient, or =
the person responsible for delivering it to the intended recipient, copying=
 or delivering it to anyone else or using it in any unauthorized manner is =
prohibited and may be unlawful. If you receive this e-mail by mistake, plea=
se notify the sender and the systems administrator at straymail@tttech.com =
immediately.

