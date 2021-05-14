Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F2C380293
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 05:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127165.238940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhOhw-0005UD-Ri; Fri, 14 May 2021 03:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127165.238940; Fri, 14 May 2021 03:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhOhw-0005S5-Mv; Fri, 14 May 2021 03:41:48 +0000
Received: by outflank-mailman (input) for mailman id 127165;
 Fri, 14 May 2021 03:41:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QDWZ=KJ=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1lhOhv-0005RK-B3
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 03:41:47 +0000
Received: from mail-qv1-xf2b.google.com (unknown [2607:f8b0:4864:20::f2b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e17bf28-b5b9-49c2-a70b-5c049ad0651c;
 Fri, 14 May 2021 03:41:44 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id o59so1668297qva.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 20:41:44 -0700 (PDT)
Received: from walnut.ice.pyrology.org (mobile-166-176-184-32.mycingular.net.
 [166.176.184.32])
 by smtp.gmail.com with ESMTPSA id g15sm3873432qka.49.2021.05.13.20.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 20:41:43 -0700 (PDT)
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
X-Inumbo-ID: 6e17bf28-b5b9-49c2-a70b-5c049ad0651c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jEFwomjUiAfu63gnJ/imoReC+k3WHkjDiN31O5bV5mw=;
        b=U23Lw0L4zuv6T0JwdydBeLFOvmkhIhzsHiBWLJZl7aV+2kDDPQXxaFDMJ69PIyclnT
         TnQabamvfZuexf4k0IazbVV4Tm7QddIxcxZ/hX+C42VO2jOWlarZjYsbOlWGP4qZsU1Q
         OQOOt5biRX9w1K1K9LsYzuaKoKmr1bESM5HPF4gUalVzhkX3MaNyPDav3s4Mksi2MMrL
         1vYE8Yw0xYlMQ116M2oIKM3UYboFNgC3vVA8t5t6QY0til66uB2WYgoTdHZ8MV9nko+p
         k/xl17af32QOfWIott8e2NoeblRkNIfFsvNMTVvhPFx8crgBCHrkNq06hsuX3pOITuvW
         qQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jEFwomjUiAfu63gnJ/imoReC+k3WHkjDiN31O5bV5mw=;
        b=p1HqeffNKcJTujeiczq/fNLVXWynCiQdXf7DFIA2J0BiMI4WRcAKkaL4ZOAgLHttLT
         t5k28GZ9WRLmcIHJI0Mc0ZP6Y37ITkPMGsj5TydLhbw4LB2/BIQ21eSY6itjcQqe8u0Q
         0ozIiRgKBEHtVpNO0KIvD3WCaLko9wJoXCgmQK8WycNxoxN0YU4/UScMkc+n3VSf70bk
         +KMN+bVkriSYuIJHVJ7Ch1XqKZ0glbZUMO5FJyB5rif3OAvmGWMytc3+JcsksWC8SfhQ
         l+TtwWPMWZJ9+tC7eAY3r7FeePOfFCTUl39rD+Pyo6FGSkEs0u8EzJl83vtlDT0zwS5C
         h0Iw==
X-Gm-Message-State: AOAM533Fc2/q4cvv3Zzmpbzt4JaBc6KJkpAPLQFM591lK/vbFn7kMibo
	1/wZIoiCH2kIC7X9JrrttwPb+8nUpfoYYQ==
X-Google-Smtp-Source: ABdhPJx4ZWhqlb8L3Muq/l0fThUfeh/ZjiMw9SGdtD79LKcciTAOPSjzinFLv+7s+hARZpo2UX1j0A==
X-Received: by 2002:a0c:e486:: with SMTP id n6mr43853662qvl.21.1620963703731;
        Thu, 13 May 2021 20:41:43 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
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
	adam.schwalm@starlab.io,
	scott.davis@starlab.io,
	Christopher Clark <christopher.clark@starlab.io>
Subject: [PATCH v4 2/2] docs/designs/launch: Hyperlaunch device tree
Date: Thu, 13 May 2021 20:41:01 -0700
Message-Id: <20210514034101.3683-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514034101.3683-1-christopher.w.clark@gmail.com>
References: <20210514034101.3683-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Adds a design document for Hyperlaunch device tree structure.

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
+The Xen Hyperlaunch device tree adopts the dom0less device tree structure and
+extends it to meet the requirements for the Hyperlaunch capability. The primary
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
2.25.1


