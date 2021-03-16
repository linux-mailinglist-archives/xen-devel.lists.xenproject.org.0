Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCA133CBB3
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 04:12:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98173.186163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM08E-0005Uv-Fa; Tue, 16 Mar 2021 03:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98173.186163; Tue, 16 Mar 2021 03:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM08E-0005UX-C5; Tue, 16 Mar 2021 03:12:30 +0000
Received: by outflank-mailman (input) for mailman id 98173;
 Tue, 16 Mar 2021 03:12:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LlV3=IO=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lM08C-0005UL-UW
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 03:12:28 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d5bf7ce-b7c5-43f6-921c-6f7dccefd4c0;
 Tue, 16 Mar 2021 03:12:27 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1615864287068120.23057697352931;
 Mon, 15 Mar 2021 20:11:27 -0700 (PDT)
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
X-Inumbo-ID: 3d5bf7ce-b7c5-43f6-921c-6f7dccefd4c0
ARC-Seal: i=1; a=rsa-sha256; t=1615864289; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jKlOCkqlHh3hvFADTRxcDezdBYav97vKeUQvaSuiQYhtJ4/9H5JCyqqf9IgMeKTA7Jq9WS+E24taqN8jgY3JD0kwwQV2wLJ2coPi7LkfuOa+O204WE8mMOq/2okWStIRg5ao/w4VlSLgZJn1eHPeuEhvIeBFLBuak80+7SztfOU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1615864289; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=c75/ljSO7EUvb05LAP8qRYoze7Y9SmH5sS+qXF/Am7g=; 
	b=jiT/zFmkq6ft/ePp2HG7YqK5gdXFFHuzUJt8Y1Y0y+npWIt92er4JnpKOKihs/NAyZ5MBQe9ujjqTThsCzO+Iyqjv3bzq4bOX61pSaaGTrsP0cjH5lI9zQT92toI0qeNvqoLCh/b64gUYCuyXpHzkPUgYoDI/5abPb4OSLcATtw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1615864289;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=c75/ljSO7EUvb05LAP8qRYoze7Y9SmH5sS+qXF/Am7g=;
	b=cF5Zn6FJ4Eb4CYAdt8R+S1XW+vSO4Vxr+uTmOXSqQiRwMak3n9FQo6MSntClXY3d
	kid3dlYClEhxPYTnWjTmMPugPNYqQT02yQcNMf+AhvONm55tA2JWzF1i2oB+/Cy3ArF
	EpnQR8Im2JEOC+4zPLZe6M1WH+CN0g1KaX+WEBGc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com,
	andrew.cooper3@citrix.com,
	stefano.stabellini@xilinx.com,
	jgrall@amazon.com,
	Julien.grall.oss@gmail.com,
	iwj@xenproject.org,
	wl@xen.org,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	persaur@gmail.com,
	Bertrand.Marquis@arm.com,
	roger.pau@citrix.com,
	luca.fancellu@arm.com,
	paul@xen.org,
	adam.schwalm@starlab.io
Subject: [PATCH] docs/designs/launch: hyperlaunch device tree
Date: Mon, 15 Mar 2021 23:18:14 -0400
Message-Id: <20210316031814.10311-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210316031814.10311-1-dpsmith@apertussolutions.com>
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=Y
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Adds a design document for hyperlaunch device tree structure.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
Signed-off by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 .../designs/launch/hyperlaunch-devicetree.rst | 343 ++++++++++++++++++
 1 file changed, 343 insertions(+)
 create mode 100644 docs/designs/launch/hyperlaunch-devicetree.rst

diff --git a/docs/designs/launch/hyperlaunch-devicetree.rst b/docs/designs/launch/hyperlaunch-devicetree.rst
new file mode 100644
index 0000000000..f97d357407
--- /dev/null
+++ b/docs/designs/launch/hyperlaunch-devicetree.rst
@@ -0,0 +1,343 @@
+-------------------------------------
+Xen Hyperlaunch Device Tree Bindings
+-------------------------------------
+
+The Xen hyperlaunch device tree adopts the dom0less device tree structure and
+extends it to meet the requirements for the hyperlaunch capability. The primary
+difference is the introduction of the ``hypervisor`` node that is under the
+``/chosen`` node. The move to a dedicated node was driven by:
+
+1. Reduces the need to walk over nodes that are not of interest, e.g. only
+   nodes of interest should be in ``/chosen/hypervisor``
+
+2. Allows for the domain construction information to easily be sanitized by
+   simple removing the ``/chosen/hypervisor`` node.
+
+Example Configuration
+---------------------
+
+Below are two example device tree definitions for the hypervisor node. The
+first is an example of a multiboot-based configuration for x86 and the second
+is a module-based configuration for Arm.
+
+Multiboot x86 Configuration:
+""""""""""""""""""""""""""""
+
+::
+
+    hypervisor {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = “hypervisor,xen”
+ 
+        // Configuration container
+        config {
+            compatible = "xen,config";
+ 
+            module {
+                compatible = "module,microcode", "multiboot,module";
+                mb-index = <1>;
+            };
+ 
+            module {
+                compatible = "module,xsm-policy", "multiboot,module";
+                mb-index = <2>;
+            };
+        };
+ 
+        // Boot Domain definition
+        domain {
+            compatible = "xen,domain";
+ 
+            domid = <0x7FF5>;
+ 
+            // FUNCTION_NONE            (0)
+            // FUNCTION_BOOT            (1 << 0)
+            // FUNCTION_CRASH           (1 << 1)
+            // FUNCTION_CONSOLE         (1 << 2)
+            // FUNCTION_XENSTORE        (1 << 30)
+            // FUNCTION_LEGACY_DOM0     (1 << 31)
+            functions = <0x00000001>;
+ 
+            memory = <0x0 0x20000>;
+            cpus = <1>;
+            module {
+                compatible = "module,kernel", "multiboot,module";
+                mb-index = <3>;
+            };
+ 
+            module {
+                compatible = "module,ramdisk", "multiboot,module";
+                mb-index = <4>;
+            };
+            module {
+                compatible = "module,config", "multiboot,module";
+                mb-index = <5>;
+            };
+ 
+        // Classic Dom0 definition
+        domain {
+            compatible = "xen,domain";
+ 
+            domid = <0>;
+ 
+            // PERMISSION_NONE          (0)
+            // PERMISSION_CONTROL       (1 << 0)
+            // PERMISSION_HARDWARE      (1 << 1)
+            permissions = <3>;
+ 
+            // FUNCTION_NONE            (0)
+            // FUNCTION_BOOT            (1 << 0)
+            // FUNCTION_CRASH           (1 << 1)
+            // FUNCTION_CONSOLE         (1 << 2)
+            // FUNCTION_XENSTORE        (1 << 30)
+            // FUNCTION_LEGACY_DOM0     (1 << 31)
+            functions = <0xC0000006>;
+ 
+            // MODE_PARAVIRTUALIZED     (1 << 0) /* PV | PVH/HVM */
+            // MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM | PVH */
+            // MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT */
+            mode = <5>; /* 64 BIT, PV */
+ 
+            // UUID
+            domain-uuid = [B3 FB 98 FB 8F 9F 67 A3];
+ 
+            cpus = <1>;
+            memory = <0x0 0x20000>;
+            security-id = “dom0_t;
+ 
+            module {
+                compatible = "module,kernel", "multiboot,module";
+                mb-index = <6>;
+                bootargs = "console=hvc0";
+            };
+            module {
+                compatible = "module,ramdisk", "multiboot,module";
+                mb-index = <7>;
+            };
+    };
+
+The multiboot modules supplied when using the above config would be, in order:
+
+* (the above config, compiled)
+* CPU microcode
+* XSM policy
+* kernel for boot domain
+* ramdisk for boot domain
+* boot domain configuration file
+* kernel for the classic dom0 domain
+* ramdisk for the classic dom0 domain
+
+Module Arm Configuration:
+"""""""""""""""""""""""""
+
+::
+
+    hypervisor {
+        compatible = “hypervisor,xen”
+ 
+        // Configuration container
+        config {
+            compatible = "xen,config";
+ 
+            module {
+                compatible = "module,microcode”;
+                module-addr = <0x0000ff00 0x80>;
+            };
+ 
+            module {
+                compatible = "module,xsm-policy";
+                module-addr = <0x0000ff00 0x80>;
+ 
+            };
+        };
+ 
+        // Boot Domain definition
+        domain {
+            compatible = "xen,domain";
+ 
+            domid = <0x7FF5>;
+ 
+            // FUNCTION_NONE            (0)
+            // FUNCTION_BOOT            (1 << 0)
+            // FUNCTION_CRASH           (1 << 1)
+            // FUNCTION_CONSOLE         (1 << 2)
+            // FUNCTION_XENSTORE        (1 << 30)
+            // FUNCTION_LEGACY_DOM0     (1 << 31)
+            functions = <0x00000001>;
+ 
+            memory = <0x0 0x20000>;
+            cpus = <1>;
+            module {
+                compatible = "module,kernel";
+                module-addr = <0x0000ff00 0x80>;
+            };
+ 
+            module {
+                compatible = "module,ramdisk";
+                module-addr = <0x0000ff00 0x80>;
+            };
+            module {
+                compatible = "module,config";
+                module-addr = <0x0000ff00 0x80>;
+            };
+ 
+        // Classic Dom0 definition
+        domain@0 {
+            compatible = "xen,domain";
+ 
+            domid = <0>;
+ 
+            // PERMISSION_NONE          (0)
+            // PERMISSION_CONTROL       (1 << 0)
+            // PERMISSION_HARDWARE      (1 << 1)
+            permissions = <3>;
+ 
+            // FUNCTION_NONE            (0)
+            // FUNCTION_BOOT            (1 << 0)
+            // FUNCTION_CRASH           (1 << 1)
+            // FUNCTION_CONSOLE         (1 << 2)
+            // FUNCTION_XENSTORE        (1 << 30)
+            // FUNCTION_LEGACY_DOM0     (1 << 31)
+            functions = <0xC0000006>;
+ 
+            // MODE_PARAVIRTUALIZED     (1 << 0) /* PV | PVH/HVM */
+            // MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM | PVH */
+            // MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT */
+            mode = <5>; /* 64 BIT, PV */
+ 
+            // UUID
+            domain-uuid = [B3 FB 98 FB 8F 9F 67 A3];
+ 
+            cpus = <1>;
+            memory = <0x0 0x20000>;
+            security-id = “dom0_t”;
+ 
+            module {
+                compatible = "module,kernel";
+                module-addr = <0x0000ff00 0x80>;
+                bootargs = "console=hvc0";
+            };
+            module {
+                compatible = "module,ramdisk";
+                module-addr = <0x0000ff00 0x80>;
+            };
+    };
+
+The modules that would be supplied when using the above config would be:
+
+* (the above config, compiled into hardware tree)
+* CPU microcode
+* XSM policy
+* kernel for boot domain
+* ramdisk for boot domain
+* boot domain configuration file
+* kernel for the classic dom0 domain
+* ramdisk for the classic dom0 domain
+
+The hypervisor device tree would be compiled into the hardware device tree and
+provided to Xen using the standard method currently in use. The remaining
+modules would need to be loaded in the respective addresses specified in the
+`module-addr` property.
+
+
+The Hypervisor node
+-------------------
+
+The hypervisor node is a top level container for the domains that will be built
+by hypervisor on start up. On the ``hypervisor`` node the ``compatible``
+property is used to identify the type of hypervisor node present..
+
+compatible
+  Identifies the type of node. Required.
+
+The Config node
+---------------
+
+A config node is for detailing any modules that are of interest to Xen itself.
+For example this would be where Xen would be informed of microcode or XSM
+policy locations. If the modules are multiboot modules and are able to be
+located by index within the module chain, the ``mb-index`` property should be
+used to specify the index in the multiboot module chain.. If the module will be
+located by physical memory address, then the ``module-addr`` property should be
+used to identify the location and size of the module.
+
+compatible
+  Identifies the type of node. Required.
+
+The Domain node
+---------------
+
+A domain node is for describing the construction of a domain. It may provide a
+domid property which will be used as the requested domain id for the domain
+with a value of “0” signifying to use the next available domain id, which is
+the default behavior if omitted. A domain configuration is not able to request
+a domid of “0”. After that a domain node may have any of the following
+parameters,
+
+compatible
+  Identifies the type of node. Required.
+
+domid
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
+.. note::  The `functions` bits that have been selected to indicate
+   ``FUNCTION_XENSTORE`` and ``FUNCTION_LEGACY_DOM0`` are the last two bits
+   (30, 31) such that should these features ever be fully retired, the flags may
+   be dropped without leaving a gap in the flag set.
+
+mode
+  The mode the domain will be executed under. Required.
+
+domain-uuid
+  A globally unique identifier for the domain. Optional,
+  the default is NULL.
+
+cpus
+  The number of vCPUs to be assigned to the domain. Optional,
+  the default is “1”.
+
+memory
+  The amount of memory to assign to the domain, in KBs.
+  Required.
+
+security-id
+  The security identity to be assigned to the domain when XSM
+  is the access control mechanism being used. Optional,
+  the default is “domu_t”.
+
+The Module node
+---------------
+
+This node describes a boot module loaded by the boot loader. The required
+compatible property follows the format: module,<type> where type can be
+“kernel”, “ramdisk”, “device-tree”, “microcode”, “xsm-policy” or “config”. In
+the case the module is a multiboot module, the additional property string
+“multiboot,module” may be present. One of two properties is required and
+identifies how to locate the module. They are the mb-index, used for multiboot
+modules, and the module-addr for memory address based location.
+
+compatible
+  This identifies what the module is and thus what the hypervisor
+  should use the module for during domain construction. Required.
+
+mb-index
+  This identifies the index for this module in the multiboot module chain.
+  Required for multiboot environments.
+
+module-addr
+  This identifies where in memory this module is located. Required for
+  non-multiboot environments.
+
+bootargs
+  This is used to provide the boot params to kernel modules.
+
+.. note::  The bootargs property is intended for situations where the same kernel multiboot module is used for more than one domain.
-- 
2.20.1


