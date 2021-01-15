Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993482F894F
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 00:22:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68855.123396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0YPn-0007Vb-Fe; Fri, 15 Jan 2021 23:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68855.123396; Fri, 15 Jan 2021 23:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0YPn-0007VC-C2; Fri, 15 Jan 2021 23:21:59 +0000
Received: by outflank-mailman (input) for mailman id 68855;
 Fri, 15 Jan 2021 23:21:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pe1r=GS=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1l0YPl-0007V7-OK
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 23:21:57 +0000
Received: from sender4-of-o55.zoho.com (unknown [136.143.188.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d47023c0-0d36-4df8-9eb9-bca296fdadf5;
 Fri, 15 Jan 2021 23:21:56 +0000 (UTC)
Received: from sisyou.hme. (c-73-129-147-140.hsd1.md.comcast.net
 [73.129.147.140]) by mx.zohomail.com
 with SMTPS id 1610752906091309.8992089910213;
 Fri, 15 Jan 2021 15:21:46 -0800 (PST)
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
X-Inumbo-ID: d47023c0-0d36-4df8-9eb9-bca296fdadf5
ARC-Seal: i=1; a=rsa-sha256; t=1610752907; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mzFLeHNlmmT2Qbd6Czw9kKqPipDVRt4D2d6va1Sv5teIjSx6TtZYo/If2Si/iSE42zDrNFw/mM8OVEsl/hzLY579VSm0HCnVIe+mjfSFy4D9VT8DUtu1j8uXxs/QjCFwG4fDGVb6PTAQ/+HiqYOd6WLbq78PXRVR2pCrIMJwrS0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1610752907; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=alDRxZp308/Rv9UjQcGZXAQtngvfbniwv5+q48yMpt0=; 
	b=NQ1gfm6LnnGzGFDraxkEsPW/TblRqeyYHK3Oh0L4Bu6f+hzdLjVAFEWOs0uRPO6ot1JQ3aV00AJFbvM0GiRdjANYkn3UokYMHFcHhlimMtDHRQlFYeFMynGRvis9gbiV0cBV2X+QMUiiY6TxB/MY5e5P4VNqzvOsBJcdxN9l09M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1610752907;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=alDRxZp308/Rv9UjQcGZXAQtngvfbniwv5+q48yMpt0=;
	b=INHxgQ7WPsYIuav7q0lQc+ZdGyLi/kovCAD1MawTRVROLGokL/GUHWT7u7S5M2dF
	+e8sNMYFrIAoED/cdsVJfo7OiyU3pt3WeDStL/4IvwGfo1MrK9nDHqEoGAs5uSRLyAF
	WrY2J/tp98Kk5vQVQHh/fk9xWhXCcYgvWElJTnDI=
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
Message-ID: <20210115232749.7964-1-dpsmith@apertussolutions.com>
Subject: [PATCH] docs/design: boot domain device tree design
Date: Fri, 15 Jan 2021 18:27:49 -0500
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

This is a Request For Comments on the adoption of Device Tree as the
format for the Launch Control Module as described in the previously
posted DomB RFC.

For RFC purposes, a rendered of this file can be found here:
https://drive.google.com/file/d/1FUv3U-KSB0H2X2tmBdv5Lt-6_BJm4nF1/view?usp=
=3Dsharing

Details on the DomB boot domain can be found on Xen wiki:
https://wiki.xenproject.org/wiki/DomB_mode_of_dom0less

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
---
 docs/designs/boot-domain-device-tree.rst | 163 +++++++++++++++++++++++++++=
++++
 1 file changed, 163 insertions(+)
 create mode 100644 docs/designs/boot-domain-device-tree.rst

diff --git a/docs/designs/boot-domain-device-tree.rst b/docs/designs/boot-d=
omain-device-tree.rst
new file mode 100644
index 0000000000..fc3b8b30bf
--- /dev/null
+++ b/docs/designs/boot-domain-device-tree.rst
@@ -0,0 +1,163 @@
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
+1. Reduces the need to walk over nodes that are not of interest, e.g.  onl=
y
+nodes of interest should be in ``/chosen/xen``
+
+2. Enables the use of the ``#address-cells`` and ``#size-cells`` fields on=
 the
+xen node.
+
+Below is an example device tree definition for a xen node followed by an
+explanation of each section and field:
+::
+    xen {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        // Boot Domain definition
+        domain@0 {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+            compatible =3D "xen,domain";
+
+            reg =3D <0x7FF5>;
+            memory =3D <0x0 0x20000>;
+            cpus =3D <1>;
+            module@0 {
+                compatible =3D "multiboot,kernel", "multiboot,module";
+                reg =3D <1>;
+            };
+
+            module@1 {
+                compatible =3D "multiboot,ramdisk", "multiboot,module";
+                reg =3D <2>;
+            };
+            module@3 {
+                compatible =3D "multiboot,config", "multiboot,module";
+                reg =3D <3>;
+            };
+
+        // Classic Dom0 definition
+        domain@1 {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
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
+            // MODE_ENABLE_DEVICE_MODEL (1 << 1) /* PVH | HVM */
+            mode =3D <1>;
+
+            // UUID
+            domain-handle =3D [B3 FB 98 FB 8F 9F 67 A3 8A 6E 62 5A 09 13 F=
0 8C];
+
+            cpus =3D <1>;
+            memory =3D <0x0 0x20000>;
+            security-id =3D <0>;
+
+            module@0 {
+                compatible =3D "multiboot,kernel", "multiboot,module";
+                reg =3D <4>;
+                bootargs =3D "console=3Dhv0";
+            };
+            module@1 {
+                compatible =3D "multiboot,ramdisk", "multiboot,module";
+                reg =3D <5>;
+            };
+    };
+
+The Xen node
+------------
+
+The xen node is a top level container for the domains that will be built b=
y
+hypervisor on start up. On the ``xen`` node the ``#address-cells`` is set =
to one
+and the ``#size-cells`` is set to zero. This is done to enforce that each =
domain
+node must define a ``reg`` property and the hypervisor will use it to dete=
rmine
+the ``domid`` for the domain.
+
+The Domain node
+----------------
+
+A domain node is for describing the construction of a domain. It is free t=
o set
+the ``#address-cells`` and ``#size-cells`` depending on how the multiboot
+modules identified and located. If the multiboot modules will be located b=
y
+index within the module chain, the values should be =E2=80=9C1=E2=80=9D an=
d =E2=80=9C0=E2=80=9D respectively. If
+the multiboot module will be located by address, then the values should be=
 =E2=80=9C1=E2=80=9D
+and =E2=80=9C1=E2=80=9D respectively.
+
+As previously mentioned a domain node must have a reg property which will =
be
+used as the requested domain id for the domain with a value of =E2=80=9C0=
=E2=80=9D signifying to
+use the next available domain id. After that a domain node may have any of=
 the
+following parameters,
+
+reg
+  Identifies the domid to use for the domain. Required.
+
+permissions
+  This sets what Discretionary Access Control permissions a domain is assi=
gned.
+  Optional, default is none.
+
+functions
+  This identifies what system functions a domain will fulfill.  Optional, =
the
+  default is none.
+
+.. note::  The last two ``functions`` bits are used for ``FUNCTION_XENSTOR=
E`` and ``FUNCTION_LEGACY_DOM0`` such that should these features ever be fu=
lly retired, the flags may be dropped without leaving a gap in the flag set=
.
+
+mode
+  The mode the domain will be executed under. Required.
+
+domain-handle
+  A globally unique identifier for the domain. Optional, the default is NU=
LL.
+
+cpus
+  The number of vCPUs to be assigned to the domain. Optional, the default =
is
+  =E2=80=9C1=E2=80=9D.
+
+memory
+  The amount of memory to assign to the domain, in KBs. Required.
+
+security-id
+  The security identity to be assigned to the domain when XSM is the acces=
s
+  control mechanism being used. Optional, the default is =E2=80=9Cdomu=E2=
=80=9D.
+
+The Module node
+---------------
+
+This node describes a multiboot module loaded by the boot loader. The requ=
ired
+``compatible`` property follows the format: ``multiboot, <type>`` where ty=
pe can
+be =E2=80=9Cmodule=E2=80=9D, =E2=80=9Ckernel=E2=80=9D, =E2=80=9Cramdisk=E2=
=80=9D, =E2=80=9Cmemory-map=E2=80=9D, lcm, or =E2=80=9Cconfig=E2=80=9D. The=
 ``reg``
+property is required and identifies how to locate the multiboot module.
+
+compatible
+  This identifies what the module is and thus what the hypervisor should u=
se the
+  module for during domain construction. Required.
+
+reg
+  This identifies where this module is located within the multiboot module
+  chain. Required.
+
+bootargs
+  This is used to override the boot params carried in multiboot module.
+  Optional.
+
+.. note::  The bootargs property is intended for situations where the same=
 kernel multiboot module is used for more than one domain.
+
--=20
2.11.0



