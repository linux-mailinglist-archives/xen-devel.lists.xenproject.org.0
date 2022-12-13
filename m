Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D8264BD93
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 20:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461118.719157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5BI9-0002Of-0q; Tue, 13 Dec 2022 19:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461118.719157; Tue, 13 Dec 2022 19:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5BI8-0002M6-U9; Tue, 13 Dec 2022 19:50:16 +0000
Received: by outflank-mailman (input) for mailman id 461118;
 Tue, 13 Dec 2022 19:50:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsqc=4L=riversideresearch.org=rsmith@srs-se1.protection.inumbo.net>)
 id 1p5BI7-0002M0-55
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 19:50:15 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0095.outbound.protection.office365.us [23.103.208.95])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b8422b5-7b1f-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 20:50:13 +0100 (CET)
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::22)
 by BN0P110MB1548.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:186::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 19:50:11 +0000
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::81df:6431:7a2d:4610]) by BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::81df:6431:7a2d:4610%5]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 19:50:11 +0000
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
X-Inumbo-ID: 5b8422b5-7b1f-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=sEwwqX+hQl3R+O9CVk4C7NL5UrlDq8/TOqaN1DCpWwtJfs47mA8gEgGJVRtrRA1Z2ARSCpIf+OFVwAIGokrNFrjw0sVQ84lU2W3ora0hc1+J4YfUdQ2HjIrdzXE3Izuku2VbtLeITic+hsG0Ngprr9eRc0QvwxyhbGj+SPSyBzAN6sGR+riEksPhUTcltG6egt8dBrXtnMpoSugsGs+qGYjwlXvrUEBaZQBZ/jrU2/RZ2hcUdofNzProAaYzAC9JtJvvSY5+QaJ7PHgem1qrf6fMixPN0xc7C89Am0EevHLLAj39iwqg+MpR9s2k9Dw9dGDdZ4JlZErvjDNY3s+zfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0PsUDkmjU8ZqrhC77SP7qB92xlR9kM72Qt2ugNECpA=;
 b=dpX60XY5mfugGZGnAFw7EdWakLrRNnLT+uS/E3fhfKzBC5iux2OoGsjP5y4FKHCHsKirDtOG7FgYSVwFMyB/YaIxvNufnQcSLqJfV9FdxHRTfMFQSQKCJ3rzDm0dU+pcWSXZ9Q7TskrscW4FZFbTHlHth0T9YMY019JFI8veHqSxXJsHHvX9XP2CUyZlI/ft2yUUehFTDVFm750f048aFvxA66NSEJg+YWjMG2f5QwEgEBiavUWjfqOoH5neC0biCGxlYVCa4Fd+oyRvWVg21LjU7kGqS6zKqtBexOZYD5BNHmYCFYDvjxSO+wSTE54XY3tsL50qEwIGNW8CNIWwZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=riversideresearch.org; dmarc=pass action=none
 header.from=riversideresearch.org; dkim=pass header.d=riversideresearch.org;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riversideresearch.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0PsUDkmjU8ZqrhC77SP7qB92xlR9kM72Qt2ugNECpA=;
 b=qE8asZl9Igx8921sStM9BDszW1nVghv9Oog12oBcuYk9xbu7QgPAJXHXsz/HGqRDkE8iRt1Lp54Y5THp0OsvtSfaC+BzEROXev5Yp+A25Y2qgWseRwvvDHGn7Kw3tJvErSNQq3/qW4RTAbBrTR+fMQUhpRfrx8V0fpdeep8XBlzIlkx2EH4N3w28yCgnS9lJE73ZxL4bhtCVBoQ6cvrbRy5JAXie3506a2d0ww6EyzG1ADsZm9XIwcw12hK6meg+LTNZvPNKKPycWu7QVU+AjTZDuvqSRuRKJejx+LyaMXf2ujYJsitHNsdrHqGxWBWUaTbvK0vT5Cw6pNv3SBJGzQ==
From: "Smith, Jackson" <rsmith@RiversideResearch.org>
To: "Smith, Jackson" <rsmith@RiversideResearch.org>
CC: "Brookes, Scott" <sbrookes@RiversideResearch.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, "demi@invisiblethingslab.com"
	<demi@invisiblethingslab.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>
Subject: [RFC 1/4] Add VMF Hypercall
Thread-Topic: [RFC 1/4] Add VMF Hypercall
Thread-Index: AQHZDywch81VanlmwUKrsDP9tDkwnQ==
Date: Tue, 13 Dec 2022 19:50:11 +0000
Message-ID:
 <BN0P110MB16428FBE352C8FC0E76E6C75CFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
References:
 <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To:
 <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 0f26b3df-fdae-edcd-dd64-bdcb516094da
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=RiversideResearch.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1642:EE_|BN0P110MB1548:EE_
x-ms-office365-filtering-correlation-id: 23a5c9e5-4aae-4066-b453-08dadd433ef9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0xT7MpEoVqmChA2wI5osg3VqrI8nKc7Wkw5gP2mrbLrtaEDEdAYfmrterikgwteL5JAMyfvJkZUjMSPTBRmGY1ymGZkx4ICDfPl9bDwPhqELfb05Z1kKcBlpx10yZVHs0UTxnXwL9xY4VUjJhp1AWlrQBi6cr3JpTiq/+pnXZ36F/d42u0F8Z0lXtOV3Wb4Ap6yPLpCn85mhHNJhVMaYeebvLbpMVDW9L3nawwT4hUbhR3d+34NbAda1N7tdsPpPYOzrgRj3Sug8j8bshRCQYabMr1TyRKIF+gVqhMZ8JN8uBghETaLsfMYNVjoTrZK1MR/GhoDIuctqeRiypHuU9Y7W0cgvs56jiiweoD4aWhUw3u8FYjHzyYKdbvVWiuRzfxwCZJ2Yu7F/qxyZf/jc+oUWceyddq1u+FFc73IPwYjJKeR6v1C3hyg9Y5+qDudMEL0pjqcz5B29bou5LSAssgYWFGl1PzEcjN3gqxUp6v6GoROZoQvnwnt9cCkMYylzIJfYZvUwYGegTbPWqLZnSaIwfgYvlY3xfq+2T/q7+7UmwSt54nWys4nZZTkDaK1vWA1v+MsiNyi7wShJoD+LVMYEj9PYbhKCfd4mwzoBz/nWHgXjClMGVyMK9FgjJWkd3oQ3Ag3bg+Vz2flZa0Hpgg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(451199015)(64756008)(6200100001)(38070700005)(2906002)(38100700002)(5660300002)(7416002)(8936002)(33656002)(83380400001)(52536014)(6862004)(76116006)(66556008)(71200400001)(86362001)(8676002)(54906003)(4326008)(6506007)(55016003)(7696005)(122000001)(82960400001)(66946007)(508600001)(66446008)(9686003)(66476007)(26005)(186003)(2940100002)(85282002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 Q4JICLo5CJNYi0RHdrzPVdK62sw73Ux7/KlpJWGMn2o4rlqJ1i1qOXVwoT6g+nBvIvAlTgz207/Qwd+9Jopz5NMFnSyuD4CVH/XmaTs66/31OHbhg9NZlk3EuvkthpFp61KUuphFALZdIOK/LsP3x6iuKY3J7Mk5yMdf04YBgj7q3mRfwkiz6OtM+PC1mpcQQjPZ0HNXO+OVvusIemoDILXicWwYio08PLdncNx0k4p5pNPDeeweTwNP4hWWQs1mFppX+edkxWS5R5LBy7zExYeGD+iP8HgqPqqbvfxH+V1Ey7HqpvvB1OCZryakDYGAuKb8OUGY0fkMKobUyafEK0Q+4YiTL4DVQTPVtn9dOsHPE38UDxQam/syXwZ0oPWgAoixljoZUI6EmMGSsdDYGGfbs0JGGfOvL3nE4UnOJ9c=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: riversideresearch.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a5c9e5-4aae-4066-b453-08dadd433ef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 19:50:11.5289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc64a8d-9064-4c64-91c3-9d10b44c1cb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1548

This commit introduces a new vmf_op hypercall. If desired, could be merged=
=0A=
into an exisiting hypercall.=0A=
=0A=
Also, introduce a VMF Kconfig option and xen/vmf.h, defining the arch speci=
fic=0A=
functions that must be implmented to support vmf.=0A=
---=0A=
 tools/include/xenctrl.h                 |   2 +=0A=
 tools/libs/ctrl/xc_private.c            |   5 ++=0A=
 tools/libs/ctrl/xc_private.h            |   5 ++=0A=
 xen/arch/x86/guest/xen/hypercall_page.S |   2 +=0A=
 xen/common/Kconfig                      |   3 +=0A=
 xen/common/Makefile                     |   1 +=0A=
 xen/common/vmf.c                        | 111 ++++++++++++++++++++++++++++=
++++=0A=
 xen/include/hypercall-defs.c            |   6 ++=0A=
 xen/include/public/vmf.h                |  24 +++++++=0A=
 xen/include/public/xen.h                |   3 +=0A=
 xen/include/xen/vmf.h                   |  20 ++++++=0A=
 11 files changed, 182 insertions(+)=0A=
 create mode 100644 xen/common/vmf.c=0A=
 create mode 100644 xen/include/public/vmf.h=0A=
 create mode 100644 xen/include/xen/vmf.h=0A=
=0A=
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h=0A=
index 2303787..804ddba 100644=0A=
--- a/tools/include/xenctrl.h=0A=
+++ b/tools/include/xenctrl.h=0A=
@@ -1604,6 +1604,8 @@ long xc_memory_op(xc_interface *xch, unsigned int cmd=
, void *arg, size_t len);=0A=
 =0A=
 int xc_version(xc_interface *xch, int cmd, void *arg);=0A=
 =0A=
+int xc_vmf_op(xc_interface *xch, unsigned int cmd, uint32_t domid);=0A=
+=0A=
 int xc_flask_op(xc_interface *xch, xen_flask_op_t *op);=0A=
 =0A=
 /*=0A=
diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c=0A=
index 2f99a7d..44fe9ba 100644=0A=
--- a/tools/libs/ctrl/xc_private.c=0A=
+++ b/tools/libs/ctrl/xc_private.c=0A=
@@ -555,6 +555,11 @@ int xc_version(xc_interface *xch, int cmd, void *arg)=
=0A=
     return rc;=0A=
 }=0A=
 =0A=
+int xc_vmf_op(xc_interface *xch, unsigned int cmd, uint32_t domid)=0A=
+{=0A=
+    return do_vmf_op(xch, cmd, domid);=0A=
+}=0A=
+=0A=
 unsigned long xc_make_page_below_4G(=0A=
     xc_interface *xch, uint32_t domid, unsigned long mfn)=0A=
 {=0A=
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h=0A=
index ed960c6..fb72cb4 100644=0A=
--- a/tools/libs/ctrl/xc_private.h=0A=
+++ b/tools/libs/ctrl/xc_private.h=0A=
@@ -222,6 +222,11 @@ static inline int do_xen_version(xc_interface *xch, in=
t cmd, xc_hypercall_buffer=0A=
                     cmd, HYPERCALL_BUFFER_AS_ARG(dest));=0A=
 }=0A=
 =0A=
+static inline int do_vmf_op(xc_interface *xch, unsigned int cmd, uint32_t =
domid)=0A=
+{=0A=
+    return xencall2(xch->xcall, __HYPERVISOR_vmf_op, cmd, domid);=0A=
+}=0A=
+=0A=
 static inline int do_physdev_op(xc_interface *xch, int cmd, void *op, size=
_t len)=0A=
 {=0A=
     int ret =3D -1;=0A=
diff --git a/xen/arch/x86/guest/xen/hypercall_page.S b/xen/arch/x86/guest/x=
en/hypercall_page.S=0A=
index 9958d02..2efdd58 100644=0A=
--- a/xen/arch/x86/guest/xen/hypercall_page.S=0A=
+++ b/xen/arch/x86/guest/xen/hypercall_page.S=0A=
@@ -70,6 +70,8 @@ DECLARE_HYPERCALL(arch_5)=0A=
 DECLARE_HYPERCALL(arch_6)=0A=
 DECLARE_HYPERCALL(arch_7)=0A=
 =0A=
+DECLARE_HYPERCALL(vmf_op)=0A=
+=0A=
 /*=0A=
  * Local variables:=0A=
  * tab-width: 8=0A=
diff --git a/xen/common/Kconfig b/xen/common/Kconfig=0A=
index f1ea319..3bf92b8 100644=0A=
--- a/xen/common/Kconfig=0A=
+++ b/xen/common/Kconfig=0A=
@@ -92,6 +92,9 @@ config STATIC_MEMORY=0A=
 =0A=
 	  If unsure, say N.=0A=
 =0A=
+config VMF=0A=
+	bool "Virtual Memory Fuse Support"=0A=
+=0A=
 menu "Speculative hardening"=0A=
 =0A=
 config INDIRECT_THUNK=0A=
diff --git a/xen/common/Makefile b/xen/common/Makefile=0A=
index 3baf83d..fb9118d 100644=0A=
--- a/xen/common/Makefile=0A=
+++ b/xen/common/Makefile=0A=
@@ -48,6 +48,7 @@ obj-y +=3D timer.o=0A=
 obj-$(CONFIG_TRACEBUFFER) +=3D trace.o=0A=
 obj-y +=3D version.o=0A=
 obj-y +=3D virtual_region.o=0A=
+obj-$(CONFIG_VMF) +=3D vmf.o=0A=
 obj-y +=3D vm_event.o=0A=
 obj-y +=3D vmap.o=0A=
 obj-y +=3D vsprintf.o=0A=
diff --git a/xen/common/vmf.c b/xen/common/vmf.c=0A=
new file mode 100644=0A=
index 0000000..20c61d1=0A=
--- /dev/null=0A=
+++ b/xen/common/vmf.c=0A=
@@ -0,0 +1,111 @@=0A=
+/*************************************************************************=
*****=0A=
+ * vmf.c=0A=
+ * =0A=
+ * Common implementation of the VMF hypercall=0A=
+ */=0A=
+=0A=
+#include <xen/lib.h>=0A=
+#include <xen/sched.h>=0A=
+=0A=
+#include <public/vmf.h>=0A=
+#include <xen/vmf.h>=0A=
+=0A=
+static void dump_domain_vcpus(struct domain *d)=0A=
+{=0A=
+    struct vcpu *v;=0A=
+    int i;=0A=
+=0A=
+    if (d =3D=3D NULL) {=0A=
+        printk("NULL\n");=0A=
+        return;=0A=
+    }=0A=
+=0A=
+    printk("Domain: %d (%d vcpus)\n", d->domain_id, d->max_vcpus);=0A=
+#if defined(CONFIG_ARM_64)=0A=
+    printk("  vttbr: 0x%lx\n", d->arch.p2m.vttbr);=0A=
+#endif=0A=
+=0A=
+    i =3D 0;=0A=
+    for_each_vcpu(d, v)=0A=
+    {=0A=
+        printk("  vcpu [%d: id=3D%d, proc=3D%d]: \n", i++, v->vcpu_id, v->=
processor);=0A=
+        /* archvcpu for arm has: */=0A=
+#if defined(CONFIG_ARM_64)=0A=
+        printk("    .ttbr0     is 0x%lx\n", v->arch.ttbr0);=0A=
+        printk("    .ttbr1     is 0x%lx\n", v->arch.ttbr1);=0A=
+#endif=0A=
+    }=0A=
+}=0A=
+=0A=
+static void dump_domains(void)=0A=
+{=0A=
+    struct domain *d;=0A=
+=0A=
+    for_each_domain(d)=0A=
+        dump_domain_vcpus(d);=0A=
+=0A=
+    /* Dump system domains */=0A=
+    printk("IDLE DOMAIN:\n");=0A=
+    dump_domain_vcpus(idle_vcpu[0]->domain);=0A=
+    printk("HARDWARE DOMAIN:\n");=0A=
+    dump_domain_vcpus(hardware_domain);=0A=
+    printk("XEN DOMAIN:\n");=0A=
+    dump_domain_vcpus(dom_xen);=0A=
+    printk("IO DOMAIN:\n");=0A=
+    dump_domain_vcpus(dom_io);=0A=
+}=0A=
+=0A=
+long do_vmf_op(unsigned int cmd, domid_t domid)=0A=
+{=0A=
+    int ret =3D 0;=0A=
+    struct domain *d =3D NULL;=0A=
+=0A=
+    printk("VMF hypercall: ");=0A=
+=0A=
+    if (domid =3D=3D DOMID_IDLE) {=0A=
+        printk("Xen\n");=0A=
+    } else if ((domid < DOMID_FIRST_RESERVED) && (d =3D get_domain_by_id(d=
omid))) {=0A=
+        printk("Domain(%d)\n", domid);=0A=
+    } else {=0A=
+        printk("Invalid domain id (%d)\n", domid);=0A=
+        ret =3D -1;=0A=
+        goto out;=0A=
+    }=0A=
+=0A=
+    switch (cmd) {=0A=
+    case XENVMF_dump_info:=0A=
+        if (d) {=0A=
+            vmf_dump_domain_info(d);=0A=
+        } else {=0A=
+            dump_domains();=0A=
+            vmf_dump_xen_info();=0A=
+        }=0A=
+        break;=0A=
+=0A=
+    case XENVMF_dump_tables:=0A=
+        if (d)=0A=
+            vmf_dump_domain_tables(d);=0A=
+        else=0A=
+            vmf_dump_xen_tables();=0A=
+        break;=0A=
+=0A=
+    case XENVMF_unmap:=0A=
+        printk("BLOW VIRTUAL MEMORY FUSE:\n");=0A=
+        if (d) {=0A=
+            printk("Unmapping Domain(%d)\n", d->domain_id);=0A=
+            vmf_unmap_guest(d);=0A=
+        } else {=0A=
+            printk("Locking Virtual Memory Configuration\n");=0A=
+            vmf_lock_xen_pgtables();=0A=
+        }=0A=
+        break;=0A=
+=0A=
+    default:=0A=
+        printk("Not Implemented\n");=0A=
+        break;=0A=
+    }=0A=
+=0A=
+out:=0A=
+    printk("Done!\n");=0A=
+    return ret;=0A=
+}=0A=
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c=0A=
index 1896121..fb61bc6 100644=0A=
--- a/xen/include/hypercall-defs.c=0A=
+++ b/xen/include/hypercall-defs.c=0A=
@@ -166,6 +166,9 @@ vm_assist(unsigned int cmd, unsigned int type)=0A=
 event_channel_op(int cmd, void *arg)=0A=
 mmuext_op(mmuext_op_t *uops, unsigned int count, unsigned int *pdone, unsi=
gned int foreigndom)=0A=
 multicall(multicall_entry_t *call_list, unsigned int nr_calls)=0A=
+#if defined(CONFIG_VMF)=0A=
+vmf_op(unsigned int cmd, domid_t domid)=0A=
+#endif=0A=
 #ifdef CONFIG_PV=0A=
 mmu_update(mmu_update_t *ureqs, unsigned int count, unsigned int *pdone, u=
nsigned int foreigndom)=0A=
 stack_switch(unsigned long ss, unsigned long esp)=0A=
@@ -239,6 +242,9 @@ update_va_mapping                  compat   do       - =
       -        -=0A=
 set_timer_op                       compat   do       compat   do       -=
=0A=
 event_channel_op_compat            do       do       -        -        dep=
=0A=
 xen_version                        compat   do       compat   do       do=
=0A=
+#if defined(CONFIG_VMF)=0A=
+vmf_op                             do       do       do       do       do=
=0A=
+#endif=0A=
 console_io                         do       do       do       do       do=
=0A=
 physdev_op_compat                  compat   do       -        -        dep=
=0A=
 #if defined(CONFIG_GRANT_TABLE)=0A=
diff --git a/xen/include/public/vmf.h b/xen/include/public/vmf.h=0A=
new file mode 100644=0A=
index 0000000..a5ec004=0A=
--- /dev/null=0A=
+++ b/xen/include/public/vmf.h=0A=
@@ -0,0 +1,24 @@=0A=
+/* SPDX-License-Identifier: MIT */=0A=
+/*************************************************************************=
*****=0A=
+ * vmf.h=0A=
+ *=0A=
+ */=0A=
+=0A=
+#ifndef __XEN_PUBLIC_VMF_H__=0A=
+#define __XEN_PUBLIC_VMF_H__=0A=
+=0A=
+#define XENVMF_dump_info 1=0A=
+#define XENVMF_dump_tables 2=0A=
+#define XENVMF_unmap 11=0A=
+=0A=
+#endif /* __XEN_PUBLIC_VMF_H__ */=0A=
+=0A=
+/*=0A=
+ * Local variables:=0A=
+ * mode: C=0A=
+ * c-file-style: "BSD"=0A=
+ * c-basic-offset: 4=0A=
+ * tab-width: 4=0A=
+ * indent-tabs-mode: nil=0A=
+ * End:=0A=
+ */=0A=
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h=0A=
index 920567e..077000c 100644=0A=
--- a/xen/include/public/xen.h=0A=
+++ b/xen/include/public/xen.h=0A=
@@ -125,6 +125,9 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);=0A=
 #define __HYPERVISOR_arch_6               54=0A=
 #define __HYPERVISOR_arch_7               55=0A=
 =0A=
+/* custom vmf hypercall */=0A=
+#define __HYPERVISOR_vmf_op               56=0A=
+=0A=
 /* ` } */=0A=
 =0A=
 /*=0A=
diff --git a/xen/include/xen/vmf.h b/xen/include/xen/vmf.h=0A=
new file mode 100644=0A=
index 0000000..f4b350c=0A=
--- /dev/null=0A=
+++ b/xen/include/xen/vmf.h=0A=
@@ -0,0 +1,20 @@=0A=
+/*************************************************************************=
*****=0A=
+ * vmf.h=0A=
+ * =0A=
+ * Public VMF interface to be implemented in arch specific code=0A=
+ */=0A=
+=0A=
+#ifndef __XEN_VMF_H__=0A=
+#define __XEN_VMF_H__=0A=
+=0A=
+struct domain;=0A=
+=0A=
+void vmf_dump_xen_info(void);=0A=
+void vmf_dump_domain_info(struct domain *d);=0A=
+void vmf_dump_xen_tables(void);=0A=
+void vmf_dump_domain_tables(struct domain *d);=0A=
+=0A=
+void vmf_unmap_guest(struct domain *d);=0A=
+void vmf_lock_xen_pgtables(void);=0A=
+=0A=
+#endif /* __XEN_VMF_H__ */=0A=
-- =0A=
2.7.4=0A=
=0A=

