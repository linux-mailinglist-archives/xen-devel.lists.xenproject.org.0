Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E466230D020
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 01:05:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80754.147890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l75eu-0005Lf-Kt; Wed, 03 Feb 2021 00:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80754.147890; Wed, 03 Feb 2021 00:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l75eu-0005LG-Ho; Wed, 03 Feb 2021 00:04:36 +0000
Received: by outflank-mailman (input) for mailman id 80754;
 Wed, 03 Feb 2021 00:04:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qRRE=HF=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1l75et-0005LB-6g
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 00:04:35 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 542bc3b4-139e-467d-9b18-7e8b3d4304bf;
 Wed, 03 Feb 2021 00:04:33 +0000 (UTC)
Received: from sisyou.hme. (c-73-129-147-140.hsd1.md.comcast.net
 [73.129.147.140]) by mx.zohomail.com
 with SMTPS id 1612310661678893.5908610764848;
 Tue, 2 Feb 2021 16:04:21 -0800 (PST)
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
X-Inumbo-ID: 542bc3b4-139e-467d-9b18-7e8b3d4304bf
ARC-Seal: i=1; a=rsa-sha256; t=1612310664; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JCSq1DGmhMj0Djic194oFkeMu9Jl4qOQc02x+VBPH8o8Ov/nR/yK0VszGXhFbO28KqmOcQkmLe+jCS5axWqlFvQER6yiPn0J9HSSM0HXYtUJ5EcrgH9pel/b/0VO6Fk+tuSEAWOhJUcAqtAc8zWz9v9aahO3SYy4KWyq8DHauT4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1612310664; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=Ia2V4e6myGKZ7WbhSc4tiAaaHWQaNTe8d6gesk3Qs+Q=; 
	b=RlMccXACklaUR0l9Wo/tkQyEgJxu14oxRB9ZUzge0oevR2L98PKCh7w0f+qwFi21JdWWPb+fxh8L9B180Q3kBN9lKxqRueo07fmi8mKKyW1PobX3/8sKqBpBmSPjED5tUL2qEZsbhgaJMN3YQIPjkEV6Mx0Ja78QQ3oAUDk0FqY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1612310664;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Ia2V4e6myGKZ7WbhSc4tiAaaHWQaNTe8d6gesk3Qs+Q=;
	b=lf2ecu0SKg+ZJPiz9KEjdsq15PX9IFEhJQDUg/S1VjJH8jGvchEPDIYku6VtYHpV
	LNrLcy5x51Ta/WgQuKnAJIHiak6FQVCTnIKCVCicUzrUU32oDkSibX+yPqhLmy4JUEG
	Rk516tAKi1w7TksP84Qxq34xbFnRi/hT+qlDIOvU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com,
	andrew.cooper3@citrix.com,
	stefano.stabellini@xilinx.com,
	jgrall@amazon.com,
	iwj@xenproject.org,
	wl@xen.org,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	persaur@gmail.com,
	adam.schwalm@starlab.io
Message-ID: <20210203000952.31695-1-dpsmith@apertussolutions.com>
Subject: [RFC PATCH v2] docs/design: boot domain device tree design
Date: Tue,  2 Feb 2021 19:09:52 -0500
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

This is a Request For Comments on the adoption of Device Tree as the
format for the Launch Control Module as described in the previously
posted DomB RFC.

For RFC purposes, a rendered of this file can be found here:
ihttps://drive.google.com/file/d/1l3fo4FylvZCQs1V00DcwifyLjl5Jw3W8/view?usp=
=3Dsharing

Details on the DomB boot domain can be found on Xen wiki:
https://wiki.xenproject.org/wiki/DomB_mode_of_dom0less

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Christopher Clark <christopher.clark@starlab.io>

Version 2
---------

 - cleaned up wording
 - updated example to reflect a real configuration
 - add explanation of mb2 modules that would be loaded
 - add the config node
---
 docs/designs/boot-domain-device-tree.rst | 235 +++++++++++++++++++++++++++=
++++
 1 file changed, 235 insertions(+)
 create mode 100644 docs/designs/boot-domain-device-tree.rst

diff --git a/docs/designs/boot-domain-device-tree.rst b/docs/designs/boot-d=
omain-device-tree.rst
new file mode 100644
index 0000000000..558d75a796
--- /dev/null
+++ b/docs/designs/boot-domain-device-tree.rst
@@ -0,0 +1,235 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Xen Boot Domain Device Tree Bindings
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The Xen Boot Domain device tree adopts the dom0less device tree structure =
and
+extends it to meet the requirements for the Boot Domain capability. The pr=
imary
+difference is the introduction of the ``xen`` node that is under the ``/ch=
osen``
+node. The move to a dedicated node was driven by:
+
+1. Reduces the need to walk over nodes that are not of interest, e.g. only
+nodes of interest should be in ``/chosen/xen``
+
+2. Enables the use of the ``#address-cells`` and ``#size-cells`` fields on=
 the
+xen node.
+
+3. Allows for the domain construction information to easily be sanitized b=
y
+simple removing the ``/chosen/xen`` node.
+
+Below is an example device tree definition for a xen node followed by an
+explanation of each section and field:
+::
+    xen {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        // Configuration container
+        config@0 {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+            compatible =3D "xen,config";
+
+            // reg is required but ignored for "xen,config" node
+            reg =3D <0>;
+
+            module@1 {
+                compatible =3D "multiboot,microcode", "multiboot,module";
+                reg =3D <1>;
+            };
+
+            module@2 {
+                compatible =3D "multiboot,xsm-policy", "multiboot,module";
+                reg =3D <2>;
+            };
+        };
+
+        // Boot Domain definition
+        domain@0x7FF5 {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+            compatible =3D "xen,domain";
+
+            reg =3D <0x7FF5>;
+            memory =3D <0x0 0x20000>;
+            cpus =3D <1>;
+            module@3 {
+                compatible =3D "multiboot,kernel", "multiboot,module";
+                reg =3D <3>;
+            };
+
+            module@4 {
+                compatible =3D "multiboot,ramdisk", "multiboot,module";
+                reg =3D <4>;
+            };
+            module@5 {
+                compatible =3D "multiboot,config", "multiboot,module";
+                reg =3D <5>;
+            };
+
+        // Classic Dom0 definition
+        domain@0 {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+            compatible =3D "xen,domain";
+
+            reg =3D <0>;
+
+            // PERMISSION_NONE          (0)
+            // PERMISSION_CONTROL       (1 << 0)
+            // PERMISSION_HARDWARE      (1 << 1)
+            permissions =3D <3>;
+
+            // FUNCTION_NONE            (0)
+            // FUNCTION_BOOT            (1 << 1)
+            // FUNCTION_CRASH           (1 << 2)
+            // FUNCTION_CONSOLE         (1 << 3)
+            // FUNCTION_XENSTORE        (1 << 30)
+            // FUNCTION_LEGACY_DOM0     (1 << 31)
+            functions =3D <0xFFFFFFFF>;
+
+            // MODE_PARAVIRTUALIZED     (1 << 0) /* PV | PVH/HVM */
+            // MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM | PVH */
+            // MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT */
+            mode =3D <5>; /* 64 BIT, PV */
+
+            // UUID
+            domain-handle =3D [B3 FB 98 FB 8F 9F 67 A3];
+
+            cpus =3D <1>;
+            memory =3D <0x0 0x20000>;
+            security-id =3D <0>;
+
+            module@6 {
+                compatible =3D "multiboot,kernel", "multiboot,module";
+                reg =3D <6>;
+                bootargs =3D "console=3Dhvc0";
+            };
+            module@7 {
+                compatible =3D "multiboot,ramdisk", "multiboot,module";
+                reg =3D <7>;
+            };
+    };
+
+The multiboot modules that would be supplied when using the above config w=
ould
+be, in order:
+ - (the above config, compiled)
+ - CPU microcode
+ - XSM policy
+ - kernel for boot domain
+ - ramdisk for boot domain
+ - boot domain configuration file
+ - kernel for the classic dom0 domain
+ - ramdisk for the classic dom0 domain
+
+The Xen node
+------------
+The xen node is a top level container for the domains that will be built b=
y
+hypervisor on start up. On the ``xen`` node the ``#address-cells`` is set =
to one
+and the ``#size-cells`` is set to zero. This is done to enforce that each =
domain
+node must define a reg property and the hypervisor will use it to determin=
e the
+``domid`` for the domain.
+
+The Config node
+---------------
+
+A config node is for detailing any multiboot modules that are of interest =
to Xen
+itself. For example this would be where Xen would be informed of microcode=
 or
+XSM policy locations. For locating the multiboot modules, the #address-cel=
ls and
+#size-cells are set according to how the multiboot modules are identified =
and
+located. If the multiboot modules will be located by index within the modu=
le
+chain, the values should be =E2=80=9C1=E2=80=9D and =E2=80=9C0=E2=80=9D re=
spectively. If the multiboot module
+will be located by physical memory address, then the values should be =E2=
=80=9C1=E2=80=9D and
+=E2=80=9C1=E2=80=9D respectively.
+
+
+\#address-cells
+  Identifies number of fields for address. Required.
+
+\#size-cells
+  Identifies number of fields for size. Required.
+
+compatible
+  Identifies the type of node. Required.
+
+reg
+  Unused. Required.
+
+The Domain node
+---------------
+A domain node is for describing the construction of a domain. It is free t=
o set
+the #address-cells and #size-cells depending on how the multiboot modules
+identified and located. If the multiboot modules will be located by index =
within
+the module chain, the values should be =E2=80=9C1=E2=80=9D and =E2=80=9C0=
=E2=80=9D respectively. If the
+multiboot module will be located by physical memory address, then the valu=
es
+should be =E2=80=9C1=E2=80=9D and =E2=80=9C1=E2=80=9D respectively.
+
+As previously mentioned a domain node must have a reg property which will =
be
+used as the requested domain id for the domain with a value of =E2=80=9C0=
=E2=80=9D signifying to
+use the next available domain id. A domain configuration is not able to re=
quest
+a domid of =E2=80=9C0=E2=80=9D. After that a domain node may have any of t=
he following
+parameters,
+
+\#address-cells
+  Identifies number of fields for address. Required.
+
+\#size-cells
+  Identifies number of fields for size. Required.
+
+compatible
+  Identifies the type of node. Required.
+
+reg
+  Identifies the domid requested to assign to the domain. Required.
+
+permissions
+  This sets what Discretionary Access Control permissions
+  a domain is assigned. Optional, default is none.
+
+functions
+  This identifies what system functions a domain will fulfill.
+  Optional, the default is none.
+
+.. note::  The `functions` bits that have been selected to indicate ``FUNC=
TION_XENSTORE`` and ``FUNCTION_LEGACY_DOM0`` are the last two bits (30, 31)=
 such that should these features ever be fully retired, the flags may be dr=
opped without leaving a gap in the flag set.
+
+mode
+  The mode the domain will be executed under. Required.
+
+domain-handle
+  A globally unique identifier for the domain. Optional,
+  the default is NULL.
+
+cpus
+  The number of vCPUs to be assigned to the domain. Optional,
+  the default is =E2=80=9C1=E2=80=9D.
+
+memory
+  The amount of memory to assign to the domain, in KBs.
+  Required.
+
+security-id
+  The security identity to be assigned to the domain when XSM
+  is the access control mechanism being used. Optional,
+  the default is =E2=80=9Cdomu=E2=80=9D.
+
+The Module node
+---------------
+This node describes a multiboot module loaded by the boot loader. The requ=
ired
+compatible property follows the format: multiboot,<type> where type can be
+=E2=80=9Cmodule=E2=80=9D, =E2=80=9Ckernel=E2=80=9D, =E2=80=9Cramdisk=E2=80=
=9D, =E2=80=9Cdevice-tree=E2=80=9D, =E2=80=9Cmicrocode=E2=80=9D, =E2=80=9Cx=
sm-policy=E2=80=9D or
+=E2=80=9Cconfig=E2=80=9D. The reg property is required and identifies how =
to locate the
+multiboot module.
+
+compatible
+  This identifies what the module is and thus what the hypervisor
+  should use the module for during domain construction. Required.
+
+reg
+  This identifies where this module is located within the multiboot
+  module chain. Required.
+
+bootargs
+  This is used to override the boot params carried with the
+  multiboot module.
+
+.. note::  The bootargs property is intended for situations where the same=
 kernel multiboot module is used for more than one domain.
+
--=20
2.11.0



