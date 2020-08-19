Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C712824A461
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:53:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8RKV-0003vb-RU; Wed, 19 Aug 2020 16:52:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qP9Y=B5=gmail.com=don.slutz@srs-us1.protection.inumbo.net>)
 id 1k8RKU-0003kZ-Kz
 for xen-devel@lists.xen.org; Wed, 19 Aug 2020 16:52:50 +0000
X-Inumbo-ID: 8d9f3e11-7a99-4f01-a346-8ef0fadff7fb
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d9f3e11-7a99-4f01-a346-8ef0fadff7fb;
 Wed, 19 Aug 2020 16:52:26 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 77so22205427qkm.5
 for <xen-devel@lists.xen.org>; Wed, 19 Aug 2020 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=jZijM2ydIAX1ShIOsC2gPV47fryOmcc2JmO97Kfe7LY=;
 b=OO1JkZ2Gchr4DVF5qVUN29stIRb4h+6OZDeWgaK9+oVHn0j3lMJuskVmVVrxnSzdLl
 un0nbB8n/dl5jteLLfhh+FBD7HWF+z9JwD94Y4AgPpOCwL0fHr7VDKkiAUOUeT+GpFte
 7sRWsd+Xwf9iqsnii3u6z6bFpjVbcWJdebWmYFOTEY/o1ehGSnujMRZd9SQg9h6kbKVN
 Zkpd6Hm9AF0LGMVaQbi3Exryz676b+RAeX8xhHkk8E/iBdeJLvcpCt+IUVFc/K1cXg06
 dKSlUdqRboblMBI2zHWgs56ODsJ47unoKt/mdYFRQ3yH3i9nD9u7OZMCSEdrTYjU+sWg
 pImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=jZijM2ydIAX1ShIOsC2gPV47fryOmcc2JmO97Kfe7LY=;
 b=sSkJYDfQXUgDWP26+XSF/0K0wUIz1D5I1r3zsRi/bcr/I9Y6pdurt79FPL/m4SNKa3
 VAie2hW6kGb1NC5cR0eeGkSZ2TSouJt1dkZygzRF3Bb1rXghHk9nAqwaL/pmtCR8yVt2
 X0D69q8IUq664MMTvzuXMffkFvL/AyrNAS1zOpv1/toV9tKy3TQSB5kOMW0MZndWmEhR
 4JNls3LaqBalbLJJ28aX5weq3O+GA2bt01PtEO++1KPSM3Es/A0WvYhdANdSiGVMUNwD
 rpfqa78v1k9aLo2H/FiACI1eaZSpN3KzZ32KKBja+ZjZw0FXrB6wNwZzwybIR5gXzpQJ
 L6Iw==
X-Gm-Message-State: AOAM531t9D6W/ock4cszQ7FONBiiRns2HUK7+NA9h7Fhz6hdryDPwISe
 dQh3og60wOm0cKACh/TWn2A5+9A5rLXYVsg4
X-Google-Smtp-Source: ABdhPJzYnGB/7HHTOm9L5j1Ev22Cr1Ka+T02F2CLeULNpa3lQO4GBFw9zAi5FvQISQVHJp6bQx0otg==
X-Received: by 2002:a37:a09:: with SMTP id 9mr21999640qkk.290.1597855945546;
 Wed, 19 Aug 2020 09:52:25 -0700 (PDT)
Received: from TestCloud1.don.dslutz.org.zatium.us
 (pool-96-230-225-98.bstnma.fios.verizon.net. [96.230.225.98])
 by smtp.googlemail.com with ESMTPSA id
 128sm25105832qkk.101.2020.08.19.09.52.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Aug 2020 09:52:24 -0700 (PDT)
From: Don Slutz <don.slutz@gmail.com>
X-Google-Original-From: Don Slutz <Don.Slutz@Gmail.com
To: xen-devel@lists.xen.org
Cc: Aravind Gopalakrishnan <Aravind.Gopalakrishnan@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Eddie Dong <eddie.dong@intel.com>, Ian Campbell <ian.campbell@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Keir Fraser <keir@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Tim Deegan <tim@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Don Slutz <don.slutz@gmail.com>, Don Slutz <dslutz@verizon.com>
Subject: [Xen-devel] [XEN PATCH v14 6/8] tools: Add vmware_port support
Date: Wed, 19 Aug 2020 12:52:00 -0400
Message-Id: <4780b5be94be7820861f29fb618a2420effe26f5.1597854907.git.don.slutz@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <5d2e424a19ea4934be3be962cdbe6a0ec8db9a6c.1597854907.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
 <34a50dc69e4c5722597e02a4df4e3da6d6586ec7.1597854907.git.don.slutz@gmail.com>
 <67b90d11eae2c88faab22d458e7e38db0f5aada4.1597854907.git.don.slutz@gmail.com>
 <c1560bc4cecae1c40de5f5cfc39832394f77c5ed.1597854907.git.don.slutz@gmail.com>
 <ce3e037dc51581629fdb158f71f8f2e9e56d9eae.1597854907.git.don.slutz@gmail.com>
 <5d2e424a19ea4934be3be962cdbe6a0ec8db9a6c.1597854907.git.don.slutz@gmail.com>
In-Reply-To: <cover.1597854907.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Don Slutz <don.slutz@gmail.com>

This new libxl_domain_create_info field is used to set
XEN_DOMCTL_CONFIG_VMWARE_PORT_MASK in the xc_domain_configuration_t
for x86.

In xen it is is_vmware_port_enabled.

If is_vmware_port_enabled then
  enable a limited support of VMware's hyper-call.

VMware's hyper-call is also known as VMware Backdoor I/O Port.

if vmware_port is not specified in the config file, let
"vmware_hwver != 0" be the default value.  This means that only
vmware_hwver = 7 needs to be specified to enable both features.

vmware_hwver = 7 is special because that is what controls the
enable of CPUID leaves for VMware (vmware_hwver >= 7).

Note: vmware_port and nestedhvm cannot be specified at the
same time.

Signed-off-by: Don Slutz <dslutz@verizon.com>
CC: Don Slutz <don.slutz@gmail.com>
---
Acked-by: Ian Campbell <ian.campbell@citrix.com>

v14:
  Reworked to current code.

v13:
  Added Acked-by: Ian Campbell

v12:
    s/come/comes/

      In v11 this seems to have morphed into only
    LIBXL_HAVE_LIBXL_VGA_INTERFACE_TYPE_VMWARE being provided, which
    is clearly not an appropriate umbrella #define.

    "#define LIBXL_HAVE_CREATEINFO_VMWARE 1"
    Lets just have a single one of these indicating support for
    vmware, it should be added at the end of the series after all
    the baseline vmware functionality is in place. I think that
    means hwver, vga=vmware and this port stuff.

      Make (tools: Add vga=vmware) no longer independent.
      Change the #define to "LIBXL_HAVE_VMWARE"


v11:
  Dropped "If non-zero then default VGA to VMware's VGA"

v10:
    If..." at the start of the sentence ...
    Also, why is 7 special?


 docs/man/xl.cfg.5.pod.in    | 15 +++++++++++++++
 tools/libxl/libxl.h         |  5 +++++
 tools/libxl/libxl_create.c  | 10 ++++++++++
 tools/libxl/libxl_types.idl |  1 +
 tools/libxl/libxl_x86.c     |  2 ++
 tools/xl/xl_parse.c         |  1 +
 6 files changed, 34 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 10eac33..3c73985 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2359,6 +2359,8 @@ Turns on or off the exposure of VMware cpuid.  The number is
 VMware's hardware version number, where 0 is off.  A number >= 7
 is needed to enable exposure of VMware cpuid.
 
+If not zero it changes the default for vmware_port to on.
+
 The hardware version number (vmware_hwver) comes from VMware config files.
 
 =over 4
@@ -2370,6 +2372,19 @@ For vssd:VirtualSystemType == vmx-07, vmware_hwver = 7.
 
 =back
 
+=item B<vmware_port=BOOLEAN>
+
+Turns on or off the exposure of VMware port.  This is known as
+vmport in QEMU.  Also called VMware Backdoor I/O Port.  Not all
+defined VMware backdoor commands are implemented.  All of the
+ones that Linux kernel uses are defined.
+
+Defaults to enabled if vmware_hwver is non-zero (i.e. enabled)
+otherwise defaults to disabled.
+
+Note: vmware_port and nestedhvm cannot be specified at the
+same time.
+
 =back
 
 =head3 Emulated VGA Graphics Device
diff --git a/tools/libxl/libxl.h b/tools/libxl/libxl.h
index 1cd6c38..48ab231 100644
--- a/tools/libxl/libxl.h
+++ b/tools/libxl/libxl.h
@@ -439,6 +439,11 @@
 #define LIBXL_HAVE_CREATEINFO_PASSTHROUGH 1
 
 /*
+ * libxl has VMware changes.
+ */
+#define LIBXL_HAVE_VMWARE 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index e28d175..6689443 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -51,6 +51,7 @@ int libxl__domain_create_info_setdefault(libxl__gc *gc,
         libxl_defbool_setdefault(&c_info->oos, true);
     }
 
+    libxl_defbool_setdefault(&c_info->vmware_port, c_info->vmware_hwver != 0);
     libxl_defbool_setdefault(&c_info->run_hotplug_scripts, true);
     libxl_defbool_setdefault(&c_info->driver_domain, false);
 
@@ -1185,6 +1186,15 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
         goto error_out;
     }
 
+    if (d_config->c_info.type == LIBXL_DOMAIN_TYPE_HVM &&
+        libxl_defbool_val(d_config->b_info.nested_hvm) &&
+        libxl_defbool_val(d_config->c_info.vmware_port)) {
+        ret = ERROR_INVAL;
+        LOGD(ERROR, domid,
+            "vmware_port and nestedhvm cannot be enabled simultaneously\n");
+        goto error_out;
+    }
+
     if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV &&
         (libxl_defbool_val(d_config->b_info.nested_hvm) &&
         ((d_config->c_info.type == LIBXL_DOMAIN_TYPE_HVM &&
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index 89a9ee7..f563980 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -421,6 +421,7 @@ libxl_domain_create_info = Struct("domain_create_info",[
     ("passthrough",  libxl_passthrough),
     ("xend_suspend_evtchn_compat",libxl_defbool),
     ("vmware_hwver", uint32),
+    ("vmware_port",  libxl_defbool),
     ], dir=DIR_IN)
 
 libxl_domain_restore_params = Struct("domain_restore_params", [
diff --git a/tools/libxl/libxl_x86.c b/tools/libxl/libxl_x86.c
index 0ee7418..8da9913 100644
--- a/tools/libxl/libxl_x86.c
+++ b/tools/libxl/libxl_x86.c
@@ -22,6 +22,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     }
 
     config->arch.vmware_hwver = d_config->c_info.vmware_hwver;
+    if (libxl_defbool_val(d_config->c_info.vmware_port))
+        config->arch.emulation_flags |= XEN_X86_EMU_VMWARE_PORT;
     return 0;
 }
 
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 4794398..b655e25 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1321,6 +1321,7 @@ void parse_config_data(const char *config_source,
     }
 
     xlu_cfg_get_defbool(config, "oos", &c_info->oos, 0);
+    xlu_cfg_get_defbool(config, "vmware_port", &c_info->vmware_port, 0);
 
     if (!xlu_cfg_get_string (config, "pool", &buf, 0))
         xlu_cfg_replace_string(config, "pool", &c_info->pool_name, 0);
-- 
1.8.3.1


