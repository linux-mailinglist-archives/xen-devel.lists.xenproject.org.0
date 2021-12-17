Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720734794DD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 20:33:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248849.429268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIys-0001a9-En; Fri, 17 Dec 2021 19:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248849.429268; Fri, 17 Dec 2021 19:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIys-0001XG-BU; Fri, 17 Dec 2021 19:33:26 +0000
Received: by outflank-mailman (input) for mailman id 248849;
 Fri, 17 Dec 2021 19:33:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1myIyq-0008Bq-GY
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 19:33:24 +0000
Received: from sender3-of-o51.zoho.com (sender3-of-o51.zoho.com
 [136.143.184.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 312618c5-5f70-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 20:33:22 +0100 (CET)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1639769531248290.15386002298237;
 Fri, 17 Dec 2021 11:32:11 -0800 (PST)
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
X-Inumbo-ID: 312618c5-5f70-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; t=1639769533; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S1WP2VhZWvhzFP6tk+Q1Z5DrHfDScNEbww9/HIlXTa5CjAeb6PNtM4J+00V0ci7PqedGQMgvIV/+YqNB5otjQ7kzQMvJ0TzPDfr2rVFVirsjirjjd/37j2f1xDE+805Rr16YHxtr8u4X69Z6sJYBaAWrL1Fb+anCP/E7q3+TJ3Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1639769533; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=dgVuUxEl8OumX6DLPxWMvtc2xvBs3iAgOedwV7CzitI=; 
	b=bcnGg3v25vmjbRwpoBU1bBaNh/G5WUtdbl875fx43lAfjx1o1qYGDHf+TPQgM0CkKXaeUcKpRXQr7nWh1wJCgd7Wf/SLcuSpqimrBfBhNROO3Dl+w/mOooSy2l0XkyBaRMHa0mLiznVuTvPXnsI8SuJ5YYhy+8QGQCrLqI38JPI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1639769533;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dgVuUxEl8OumX6DLPxWMvtc2xvBs3iAgOedwV7CzitI=;
	b=TBb79mk266UzrVZPm2hGWQiyNemQDWE9QLbBiLcbbXO4UY2VfHHSd9kUak/tI6ED
	A+1vNL7D1lu2Z68eqvSjZBqLilOuATlWuNtF+wItR4fnItpCtmN5DnYZuDZA/E8RLEC
	vjOOxLPEfecmnKNedRuOhhpi8+uvUy1HzFRmbEtc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.clark@starlab.io>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC 05/10] hyperlaunch: update device tree documentation
Date: Fri, 17 Dec 2021 18:34:31 -0500
Message-Id: <20211217233437.13791-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211217233437.13791-1-dpsmith@apertussolutions.com>
References: <20211217233437.13791-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit is to update the hyperlaunch device tree documentation to align
with the DTB parsing implementation.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 .../designs/launch/hyperlaunch-devicetree.rst | 448 +++++++++++-------
 1 file changed, 278 insertions(+), 170 deletions(-)

diff --git a/docs/designs/launch/hyperlaunch-devicetree.rst b/docs/designs/launch/hyperlaunch-devicetree.rst
index b49c98cfbd..7be23b9e71 100644
--- a/docs/designs/launch/hyperlaunch-devicetree.rst
+++ b/docs/designs/launch/hyperlaunch-devicetree.rst
@@ -13,12 +13,263 @@ difference is the introduction of the ``hypervisor`` node that is under the
 2. Allows for the domain construction information to easily be sanitized by
    simple removing the ``/chosen/hypervisor`` node.
 
+
+The Hypervisor node
+-------------------
+
+The ``hypervisor`` node is a top level container for the domains that will be built
+by hypervisor on start up. The node will be named ``hypervisor``  with a ``compatible``
+property to identify which hypervisors the configuration is intended. The hypervisor
+node will consist of one or more config nodes and one or more domain nodes.
+
+Properties
+""""""""""
+
+compatible
+  Identifies which hypervisors the configuration is compatible. Required.
+
+  Format: "hypervisor,<hypervisor name>", e.g "hypervisor,xen"
+
+Child Nodes
+"""""""""""
+
+* config
+* domain
+
+Config Node
+-----------
+
+A ``config`` node is for passing configuration data and identifying any boot
+modules that is of interest to the hypervisor.  For example this would be where
+Xen would be informed of microcode or XSM policy locations. Each ``config``
+node will require a unique device-tree compliant name as there may be one or
+more ``config`` nodes present in a single dtb file. To identify which
+hypervisor the configuration is intended, the required ``compatible`` property
+must be present.
+
+While the config node is not meant to replace the hypervisor commandline, there
+may be cases where it is better suited for passing configuration details at
+boot time.  This additional information may be carried in properties assigned
+to a ``config`` node. If there are any boot modules that are intended for the
+hypervisor, then a ``module`` child node should be provided to identify the
+boot module.
+
+Properties
+""""""""""
+
+compatible
+  Identifies the hypervisor the confiugration is intended. Required.
+
+  Format: "<hypervisor name>,config", e.g "xen,config"
+
+Child Nodes
+"""""""""""
+
+* module
+
+Domain Node
+-----------
+
+A ``domain`` node is for describing the construction of a domain. Since there
+may be one or more domain nodes, each one requires a unique, DTB compliant name
+and a ``compatible`` property to identify as a domain node.
+
+A ``domain`` node  may provide a ``domid`` property which will be used as the
+requested domain id for the domain with a value of “0” signifying to use the
+next available domain id, which is the default behavior if omitted. It should
+be noted that a domain configuration is not able to request a domid of “0”.
+Beyond that a domain node may have any of the following optional properties.
+
+Properties
+""""""""""
+
+compatible
+  Identifies the node as a domain node and for which hypervisor. Required.
+
+  Format: "<hypervisor name>,domain", e.g "xen,domain"
+
+domid
+  Identifies the domid requested to assign to the domain.
+
+  Format: Integer, e.g <0>
+
+permissions
+  This sets what Discretionary Access Control permissions
+  a domain is assigned. Optional, default is none.
+
+  Format: Bitfield, e.g <3> or <0x00000003>
+
+          PERMISSION_NONE          (0)
+          PERMISSION_CONTROL       (1 << 0)
+          PERMISSION_HARDWARE      (1 << 1)
+
+functions
+  This identifies what system functions a domain will fulfill.
+  Optional, the default is none.
+
+  Format: Bitfield, e.g <3221225487> or <0xC0000007>
+
+          FUNCTION_NONE            (0)
+          FUNCTION_BOOT            (1 << 0)
+          FUNCTION_CRASH           (1 << 1)
+          FUNCTION_CONSOLE         (1 << 2)
+          FUNCTION_XENSTORE        (1 << 30)
+          FUNCTION_LEGACY_DOM0     (1 << 31)
+
+.. note::  The `functions` bits that have been selected to indicate
+   ``FUNCTION_XENSTORE`` and ``FUNCTION_LEGACY_DOM0`` are the last two bits
+   (30, 31) such that should these features ever be fully replaced or retired,
+   the flags may be dropped without leaving a gap in the flag set.
+
+mode
+  The mode the domain will be executed under. Required.
+
+  Format: Bitfield, e.g <5> or <0x00000005>
+
+          MODE_PARAVIRTUALIZED     (1 << 0) PV | PVH/HVM
+          MODE_ENABLE_DEVICE_MODEL (1 << 1) HVM | PVH
+          MODE_LONG                (1 << 2) 64 BIT | 32 BIT
+
+domain-uuid
+  A globally unique identifier for the domain. Optional,
+  the default is NULL.
+
+  Format: Byte Array, e.g [B3 FB 98 FB 8F 9F 67 A3]
+
+cpus
+  The number of vCPUs to be assigned to the domain. Optional,
+  the default is “1”.
+
+  Format: Integer, e.g <0>
+
+memory
+  The amount of memory to assign to the domain, in KBs. This field uses a DTB
+  Reg which contains a start and size. For memory allocation start may or may
+  not have significance but size will always be used for the amount of memory
+  Required.
+
+  Format: DTB Reg <min:start size>, [<max: start size>], e.g. <0x0 0x20000>
+
+security-id
+  The security identity to be assigned to the domain when XSM
+  is the access control mechanism being used. Optional,
+  the default is “system_u:system_r:domU_t”.
+
+  Format: string, e.g. "system_u:system_r:domU_t"
+
+Child Nodes
+"""""""""""
+
+* module
+
+Module node
+-----------
+
+This node describes a boot module loaded by the boot loader. A ``module`` node
+will often appear repeatedly and will require a unique and DTB compliant name
+for each instance. The compatible property is required to identify that the
+node is a ``module`` node, the type of boot module, and what it represents.
+
+Depending on the type of boot module, the ``module`` node will require either a
+``mb-index`` or ``module-addr`` property must be present. They provide the boot
+module specific way of locating the boot module in memory.
+
+Properties
+""""""""""
+
+compatible
+  This identifies what the module is and thus what the hypervisor
+  should use the module for during domain construction. Required.
+
+  Format: "module,<module type>"[, "<boot module type>,module"]
+          module type: kernel, ramdisk, device-tree, microcode, xsm-policy,
+                       config
+
+          boot module type: multiboot
+
+mb-index
+  This identifies the index for this module in the multiboot module chain.
+  Required for multiboot environments.
+
+  Format: Integer, e.g. <0>
+
+module-addr
+  This identifies where in memory this module is located. Required for
+  non-multiboot environments.
+
+  Format: DTB Reg <start size>, e.g. <0x0 0x20000>
+
+bootargs
+  This is used to provide the boot params to kernel modules.
+
+  Format: String, e.g. "ro quiet"
+
+.. note::  The bootargs property is intended for situations where the same kernel multiboot module is used for more than one domain.
+
 Example Configuration
 ---------------------
 
-Below are two example device tree definitions for the hypervisor node. The
-first is an example of a multiboot-based configuration for x86 and the second
-is a module-based configuration for Arm.
+Below are examples device tree definitions for the hypervisor node. The first
+is an example of booting a dom0 only configuration. Afterh that are a
+multiboot-based configuration for x86 and a module-based configuration for Arm.
+
+Multiboot x86 Configuration Dom0-only:
+""""""""""""""""""""""""""""""""""""""
+The following dts file can be provided to the Device Tree compiler, ``dtc``, to
+produce a dtb file. 
+::
+
+  /dts-v1/;
+
+  / {
+      chosen {
+          hypervisor {
+              compatible = "hypervisor,xen";
+
+              dom0 {
+                  compatible = "xen,domain";
+
+                  domid = <0>;
+
+                  permissions = <3>;
+                  functions = <0xC000000F>;
+                  mode = <5>;
+
+                  domain-uuid = [B3 FB 98 FB 8F 9F 67 A3 8A 6E 62 5A 09 13 F0 8C];                                               
+
+                  cpus = <1>;
+                  memory = <0x0 0x20000000>;
+
+                  kernel {
+                      compatible = "module,kernel", "multiboot,module";
+                      mb-index = <1>;
+                  };
+              };
+
+          };
+      };
+  };
+
+The resulting dtb file, in this case dom0-only.dtb, can then be used with a
+GRUB menuentry as such,
+::
+
+  menuentry 'Devuan GNU/Linux, with Xen hyperlaunch' {
+        insmod part_gpt
+        insmod ext2
+        set root='hd0,gpt2'
+
+        echo    'Loading Xen hyperlaunch ...'
+
+        multiboot2      /xen.gz placeholder sync_console
+        echo    'Loading Dom0 hyperlaunch dtb ...'
+        module2 --nounzip   /dom0-only.dtb
+        echo    'Loading Linux 5.4.36+ ...'
+        module2 /vmlinuz-5.4.36+ placeholder root=/dev/mapper/test01--vg-root ro  quiet
+        echo    'Loading initial ramdisk ...'
+        module2 --nounzip   /initrd.img-5.4.36+
+  }
+
 
 Multiboot x86 Configuration:
 """"""""""""""""""""""""""""
@@ -31,87 +282,66 @@ Multiboot x86 Configuration:
         compatible = “hypervisor,xen”
 
         // Configuration container
-        config {
+        xen-config {
             compatible = "xen,config";
 
-            module {
+            microcode {
                 compatible = "module,microcode", "multiboot,module";
                 mb-index = <1>;
             };
 
-            module {
+            policy {
                 compatible = "module,xsm-policy", "multiboot,module";
                 mb-index = <2>;
             };
         };
 
         // Boot Domain definition
-        domain {
+        domB {
             compatible = "xen,domain";
 
             domid = <0x7FF5>;
 
-            // FUNCTION_NONE            (0)
-            // FUNCTION_BOOT            (1 << 0)
-            // FUNCTION_CRASH           (1 << 1)
-            // FUNCTION_CONSOLE         (1 << 2)
-            // FUNCTION_XENSTORE        (1 << 30)
-            // FUNCTION_LEGACY_DOM0     (1 << 31)
             functions = <0x00000001>;
 
             memory = <0x0 0x20000>;
             cpus = <1>;
-            module {
+
+            kernel {
                 compatible = "module,kernel", "multiboot,module";
                 mb-index = <3>;
             };
-
-            module {
+            initrd {
                 compatible = "module,ramdisk", "multiboot,module";
                 mb-index = <4>;
             };
-            module {
+            dom-config {
                 compatible = "module,config", "multiboot,module";
                 mb-index = <5>;
             };
 
         // Classic Dom0 definition
-        domain {
+        dom0 {
             compatible = "xen,domain";
 
             domid = <0>;
 
-            // PERMISSION_NONE          (0)
-            // PERMISSION_CONTROL       (1 << 0)
-            // PERMISSION_HARDWARE      (1 << 1)
             permissions = <3>;
-
-            // FUNCTION_NONE            (0)
-            // FUNCTION_BOOT            (1 << 0)
-            // FUNCTION_CRASH           (1 << 1)
-            // FUNCTION_CONSOLE         (1 << 2)
-            // FUNCTION_XENSTORE        (1 << 30)
-            // FUNCTION_LEGACY_DOM0     (1 << 31)
             functions = <0xC0000006>;
-
-            // MODE_PARAVIRTUALIZED     (1 << 0) /* PV | PVH/HVM */
-            // MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM | PVH */
-            // MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT */
             mode = <5>; /* 64 BIT, PV */
 
-            // UUID
             domain-uuid = [B3 FB 98 FB 8F 9F 67 A3];
 
             cpus = <1>;
             memory = <0x0 0x20000>;
-            security-id = “dom0_t;
+            security-id = “system_u:system_r:dom0_t;
 
-            module {
+            kernel {
                 compatible = "module,kernel", "multiboot,module";
                 mb-index = <6>;
                 bootargs = "console=hvc0";
             };
-            module {
+            initrd {
                 compatible = "module,ramdisk", "multiboot,module";
                 mb-index = <7>;
             };
@@ -137,15 +367,15 @@ Module Arm Configuration:
         compatible = “hypervisor,xen”
 
         // Configuration container
-        config {
+        xen-config {
             compatible = "xen,config";
 
-            module {
+            microcode {
                 compatible = "module,microcode”;
                 module-addr = <0x0000ff00 0x80>;
             };
 
-            module {
+            policy {
                 compatible = "module,xsm-policy";
                 module-addr = <0x0000ff00 0x80>;
 
@@ -153,72 +383,51 @@ Module Arm Configuration:
         };
 
         // Boot Domain definition
-        domain {
+        domB {
             compatible = "xen,domain";
 
             domid = <0x7FF5>;
 
-            // FUNCTION_NONE            (0)
-            // FUNCTION_BOOT            (1 << 0)
-            // FUNCTION_CRASH           (1 << 1)
-            // FUNCTION_CONSOLE         (1 << 2)
-            // FUNCTION_XENSTORE        (1 << 30)
-            // FUNCTION_LEGACY_DOM0     (1 << 31)
             functions = <0x00000001>;
 
             memory = <0x0 0x20000>;
             cpus = <1>;
-            module {
+
+            kernel {
                 compatible = "module,kernel";
                 module-addr = <0x0000ff00 0x80>;
             };
-
-            module {
+            initrd {
                 compatible = "module,ramdisk";
                 module-addr = <0x0000ff00 0x80>;
             };
-            module {
+            dom-config {
                 compatible = "module,config";
                 module-addr = <0x0000ff00 0x80>;
             };
 
         // Classic Dom0 definition
-        domain@0 {
+        dom0 {
             compatible = "xen,domain";
 
             domid = <0>;
 
-            // PERMISSION_NONE          (0)
-            // PERMISSION_CONTROL       (1 << 0)
-            // PERMISSION_HARDWARE      (1 << 1)
             permissions = <3>;
-
-            // FUNCTION_NONE            (0)
-            // FUNCTION_BOOT            (1 << 0)
-            // FUNCTION_CRASH           (1 << 1)
-            // FUNCTION_CONSOLE         (1 << 2)
-            // FUNCTION_XENSTORE        (1 << 30)
-            // FUNCTION_LEGACY_DOM0     (1 << 31)
             functions = <0xC0000006>;
-
-            // MODE_PARAVIRTUALIZED     (1 << 0) /* PV | PVH/HVM */
-            // MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM | PVH */
-            // MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT */
             mode = <5>; /* 64 BIT, PV */
 
-            // UUID
             domain-uuid = [B3 FB 98 FB 8F 9F 67 A3];
 
             cpus = <1>;
             memory = <0x0 0x20000>;
-            security-id = “dom0_t”;
+            security-id = “system_u:system_r:dom0_t”;
 
-            module {
+            kernel {
                 compatible = "module,kernel";
                 module-addr = <0x0000ff00 0x80>;
                 bootargs = "console=hvc0";
             };
-            module {
+            intird {
                 compatible = "module,ramdisk";
                 module-addr = <0x0000ff00 0x80>;
             };
@@ -240,104 +449,3 @@ provided to Xen using the standard method currently in use. The remaining
 modules would need to be loaded in the respective addresses specified in the
 `module-addr` property.
 
-
-The Hypervisor node
--------------------
-
-The hypervisor node is a top level container for the domains that will be built
-by hypervisor on start up. On the ``hypervisor`` node the ``compatible``
-property is used to identify the type of hypervisor node present..
-
-compatible
-  Identifies the type of node. Required.
-
-The Config node
----------------
-
-A config node is for detailing any modules that are of interest to Xen itself.
-For example this would be where Xen would be informed of microcode or XSM
-policy locations. If the modules are multiboot modules and are able to be
-located by index within the module chain, the ``mb-index`` property should be
-used to specify the index in the multiboot module chain.. If the module will be
-located by physical memory address, then the ``module-addr`` property should be
-used to identify the location and size of the module.
-
-compatible
-  Identifies the type of node. Required.
-
-The Domain node
----------------
-
-A domain node is for describing the construction of a domain. It may provide a
-domid property which will be used as the requested domain id for the domain
-with a value of “0” signifying to use the next available domain id, which is
-the default behavior if omitted. A domain configuration is not able to request
-a domid of “0”. After that a domain node may have any of the following
-parameters,
-
-compatible
-  Identifies the type of node. Required.
-
-domid
-  Identifies the domid requested to assign to the domain. Required.
-
-permissions
-  This sets what Discretionary Access Control permissions
-  a domain is assigned. Optional, default is none.
-
-functions
-  This identifies what system functions a domain will fulfill.
-  Optional, the default is none.
-
-.. note::  The `functions` bits that have been selected to indicate
-   ``FUNCTION_XENSTORE`` and ``FUNCTION_LEGACY_DOM0`` are the last two bits
-   (30, 31) such that should these features ever be fully retired, the flags may
-   be dropped without leaving a gap in the flag set.
-
-mode
-  The mode the domain will be executed under. Required.
-
-domain-uuid
-  A globally unique identifier for the domain. Optional,
-  the default is NULL.
-
-cpus
-  The number of vCPUs to be assigned to the domain. Optional,
-  the default is “1”.
-
-memory
-  The amount of memory to assign to the domain, in KBs.
-  Required.
-
-security-id
-  The security identity to be assigned to the domain when XSM
-  is the access control mechanism being used. Optional,
-  the default is “domu_t”.
-
-The Module node
----------------
-
-This node describes a boot module loaded by the boot loader. The required
-compatible property follows the format: module,<type> where type can be
-“kernel”, “ramdisk”, “device-tree”, “microcode”, “xsm-policy” or “config”. In
-the case the module is a multiboot module, the additional property string
-“multiboot,module” may be present. One of two properties is required and
-identifies how to locate the module. They are the mb-index, used for multiboot
-modules, and the module-addr for memory address based location.
-
-compatible
-  This identifies what the module is and thus what the hypervisor
-  should use the module for during domain construction. Required.
-
-mb-index
-  This identifies the index for this module in the multiboot module chain.
-  Required for multiboot environments.
-
-module-addr
-  This identifies where in memory this module is located. Required for
-  non-multiboot environments.
-
-bootargs
-  This is used to provide the boot params to kernel modules.
-
-.. note::  The bootargs property is intended for situations where the same kernel multiboot module is used for more than one domain.
-- 
2.20.1


