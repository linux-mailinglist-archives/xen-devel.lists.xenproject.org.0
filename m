Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F5E24A467
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:53:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8RKg-00041b-M6; Wed, 19 Aug 2020 16:53:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qP9Y=B5=gmail.com=don.slutz@srs-us1.protection.inumbo.net>)
 id 1k8RKe-0003kZ-LE
 for xen-devel@lists.xen.org; Wed, 19 Aug 2020 16:53:00 +0000
X-Inumbo-ID: adb23fae-59a4-45f4-812f-5d87e5c9493c
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adb23fae-59a4-45f4-812f-5d87e5c9493c;
 Wed, 19 Aug 2020 16:52:28 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id x69so22225330qkb.1
 for <xen-devel@lists.xen.org>; Wed, 19 Aug 2020 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=NIouuXsEYi+wgGn1WivUNRyxwAiupX8YGmukK2Jhtjw=;
 b=H4FHGEeuU9lG/gYhGJ9hpvXj4f2Ah9dPVKPwiPbj24CBd+SUEwGDjgmhMBxtOu+Tb5
 IbRyeRwNFPBtxZDTyJ73Cocm9NVoEm/hHImRU0217LDXZULGNVspX02qixRgAOfdAYED
 8GJz9Aa0MbUDr29n/gq+Uly6HqOeR7PsIODjWZyRwpLLSrwmgNcnS3Esz9bFJ5teE+2L
 y5Ex2D+IjteUHmTqRnWYcEN1eo3ks6yFAbMFxNh/BDhfr3o7n6KeJWLUq6r1r6hNq3ov
 WuoIfijIrN4ssopL5BlCZ9utegm4ezFzFYQ/ujJnoytGX4McW0H93wwTVXPv63m0YX8q
 9GQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=NIouuXsEYi+wgGn1WivUNRyxwAiupX8YGmukK2Jhtjw=;
 b=PV22COOmnwew7wQB/HIr3mBku50uPNgfmb6r43ZIxHGOchWMmIFJUW1k8qJ0AjpqRu
 ST7B1BP+j1ngWo1Ia3qO4xI19BKyP7dA8FWlyat11D9FTOx7xMoSxcwpDkWiEYTRzkzC
 zaionzLAgG7W2dF2A8UWmMXjzq5NYPjYRUe8QN8K2g0fI89BCE8dFzj0NmJSS36W6qtn
 jWx2Lp/Y9yLczz0Eq1iRzq9RdIwJrmvK0VAdBawELTYqdl+YIwNz+Yi+yS88ffE7hk0v
 FFnspD/mYUDfnEwRJo6YlRXZz34eBRZM6zX0TRxUTPAEuxCnOXsNbFvVYhnTIabY4+nt
 h2nA==
X-Gm-Message-State: AOAM532gdQASBcnkUKyglNj+lhqO941rB5siQlPfHSHbMqSVf1NxFqyS
 k3ffIIg1O808x5WSeKwaimE5fbMI6SEjN9XO
X-Google-Smtp-Source: ABdhPJxrbMGH+O9islqVuzLlu6lGJF+Mb2N3CkY53ilGfxVJi3XL54yeT/ADxYLwiDBoh1c7yLcDHA==
X-Received: by 2002:a05:620a:11a6:: with SMTP id
 c6mr18688471qkk.209.1597855946681; 
 Wed, 19 Aug 2020 09:52:26 -0700 (PDT)
Received: from TestCloud1.don.dslutz.org.zatium.us
 (pool-96-230-225-98.bstnma.fios.verizon.net. [96.230.225.98])
 by smtp.googlemail.com with ESMTPSA id
 128sm25105832qkk.101.2020.08.19.09.52.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Aug 2020 09:52:26 -0700 (PDT)
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
 Don Slutz <dslutz@verizon.com>, Don Slutz <don.slutz@gmail.com>
Subject: [Xen-devel] [XEN PATCH v14 7/8] Add IOREQ_TYPE_VMWARE_PORT
Date: Wed, 19 Aug 2020 12:52:01 -0400
Message-Id: <bfe0b9bb7b283657bc33edb7c4b425930564ca46.1597854908.git.don.slutz@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <4780b5be94be7820861f29fb618a2420effe26f5.1597854907.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
 <34a50dc69e4c5722597e02a4df4e3da6d6586ec7.1597854907.git.don.slutz@gmail.com>
 <67b90d11eae2c88faab22d458e7e38db0f5aada4.1597854907.git.don.slutz@gmail.com>
 <c1560bc4cecae1c40de5f5cfc39832394f77c5ed.1597854907.git.don.slutz@gmail.com>
 <ce3e037dc51581629fdb158f71f8f2e9e56d9eae.1597854907.git.don.slutz@gmail.com>
 <5d2e424a19ea4934be3be962cdbe6a0ec8db9a6c.1597854907.git.don.slutz@gmail.com>
 <4780b5be94be7820861f29fb618a2420effe26f5.1597854907.git.don.slutz@gmail.com>
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

From: Don Slutz <dslutz@verizon.com>

This adds synchronization of the 6 vcpu registers (only 32bits of
them) that QEMU's vmport.c and vmmouse.c needs between Xen and QEMU.
This is how VMware defined the use of these registers.

This is to avoid a 2nd and 3rd exchange between QEMU and Xen to
fetch and put these 6 vcpu registers used by the code in QEMU's
vmport.c and vmmouse.c

In the tools, enable usage of QEMU's vmport code.

The currently most useful VMware port support that QEMU has is the
VMware mouse support.  Xorg included a VMware mouse support that
uses absolute mode.  This make using a mouse in X11 much nicer.

Also added HVM_IOREQSRV_DISABLE_VMPORT to allow ioreq server(s)
to not get the mapping to the 6 vcpu registers.

Signed-off-by: Don Slutz <dslutz@verizon.com>
CC: Don Slutz <don.slutz@gmail.com>
---
Acked-by: Ian Campbell <ian.campbell@citrix.com>

v14:
  Paul Durrant: is_vmware already incorporated !is_mmio...
    Reworked the "Verify the emulation request has been correctly re-issued"
    to have a pre if.
  Paul Durrant: This could be done in a single statement.
    Made a single statement.
  Paul Durrant: Is every ioreq server going to have one of these?
    Code no longer exists.  But, there is a way to not have it.
    See HVM_IOREQSRV_DISABLE_VMPORT
  Jan Beulich: Long line needs breaking up.
    Fixed 
  Jan Beulich: The parameter should no longer be named "buf".
    Changed to pt.
  Jan Beulich: Do you really need to set up a (dummy) range set for this
    Last version did not finsh on this.  Here is what I think now:
      hvm_select_ioreq_server() uses this "dummy" range to see if a given
      IOREQ Server should be picked.  XEN_DMOP_map_io_range_to_ioreq_server
      and XEN_DMOP_unmap_io_range_from_ioreq_server can be used to enable
      or disable vmport usage at any time.      

  Jan Beulich: Several comments on vmport_check_port
    All changed.
  Jan Beulich: Lower case please (and ...
    Changed to lower case in the enum.

  Jan Beulich: Was left off in the middle
      I think haveing the current state of the code posted will help.

  Jan Beulich: don't think having something prefixed vmware_ in the Xen public
    headers is a good idea.
      Also did not reach a clear resolution.
        Last statement:
          All of this may be true and fine, but none of this is - to me - a
          reason to introduce new unclean names into the Xen public
          interface. In no event do I see qemu dictating naming to us.
        My current answer:
          My take on this is that you want me to use a different name,
          is vmport_regs a name you can live with?

  Jan Beulich: Also throughout the series I didn't find any code addition to
    guarantee (perhaps at build time) that BDOOR_PORT doesn't
    collide with any other use ports 
      Added BUILD_BUG_ON for all that can be checked at build time,
      which I think answers this.

  Jan Beulich: But accessing BDOOR_PORT + 1 with a 4-byte operation ought to
    be undefined (or properly split up). After all you don't know what is
    on BDOOR_PORT + 4.
      Changed to only allow BDOOR_PORT with a 4-byte operation.



  Fixed bug in hvm_alloc_legacy_ioreq_gfn: the if is always false.


v13:
  Rebased on staging (not a simple rebase, needed rework to function
  with changes).
    I would have made this !vmport_check_port ...
       Changed to !is_vmware, and invert vmport_check_port's return value.
  Use 1 one for "list_for_each_entry ( sv, ..."
  Added full stop in comments.

v12:
  Rebase changes.

  Pass size to vmport_check_port() -- required if overlap
  I.E. inl on port 0x5657, 0x5656, 0x5655, 0x5659, 0x565a,
  and 0x565b.

  Move define of vmport_check_port() into this patch from ring3
  patch.

v11:
  No change

v10:
  These literals should become an enum.
    I don't think the invalidate type is needed.
    Code handling "case X86EMUL_UNHANDLEABLE:" in emulate.c
    is unclear.
    Comment about "special' range of 1" is not clear.


v9:
  New code was presented as an RFC before this.

  Paul Durrant sugested I add support for other IOREQ types
  to HVMOP_map_io_range_to_ioreq_server.
    I have done this.


 tools/libs/devicemodel/core.c    |   4 +-
 tools/libxc/include/xc_dom.h     |   2 +-
 tools/libxc/xc_dom_x86.c         |   3 +
 tools/libxl/libxl_dm.c           |   2 +
 xen/arch/x86/hvm/dm.c            |   3 +-
 xen/arch/x86/hvm/emulate.c       |  57 ++++++-
 xen/arch/x86/hvm/hvm.c           |   4 +
 xen/arch/x86/hvm/ioreq.c         | 348 +++++++++++++++++++++++++++++++++------
 xen/arch/x86/hvm/vmware/vmport.c |  36 ++++
 xen/include/asm-x86/hvm/domain.h |   4 +-
 xen/include/asm-x86/hvm/hvm.h    |   1 +
 xen/include/public/hvm/dm_op.h   |  21 ++-
 xen/include/public/hvm/ioreq.h   |  17 ++
 xen/include/public/hvm/params.h  |   2 +-
 14 files changed, 443 insertions(+), 61 deletions(-)

diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
index 4d40639..72702d7 100644
--- a/tools/libs/devicemodel/core.c
+++ b/tools/libs/devicemodel/core.c
@@ -166,7 +166,7 @@ static int xendevicemodel_op(
 }
 
 int xendevicemodel_create_ioreq_server(
-    xendevicemodel_handle *dmod, domid_t domid, int handle_bufioreq,
+    xendevicemodel_handle *dmod, domid_t domid, int flags,
     ioservid_t *id)
 {
     struct xen_dm_op op;
@@ -178,7 +178,7 @@ int xendevicemodel_create_ioreq_server(
     op.op = XEN_DMOP_create_ioreq_server;
     data = &op.u.create_ioreq_server;
 
-    data->handle_bufioreq = handle_bufioreq;
+    data->flags = flags;
 
     rc = xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
     if (rc)
diff --git a/tools/libxc/include/xc_dom.h b/tools/libxc/include/xc_dom.h
index 52a4d6c..7413917 100644
--- a/tools/libxc/include/xc_dom.h
+++ b/tools/libxc/include/xc_dom.h
@@ -20,7 +20,7 @@
 #include <xenguest.h>
 
 #define INVALID_PFN ((xen_pfn_t)-1)
-#define X86_HVM_NR_SPECIAL_PAGES    8
+#define X86_HVM_NR_SPECIAL_PAGES    9
 #define X86_HVM_END_SPECIAL_REGION  0xff000u
 #define XG_MAX_MODULES 2
 
diff --git a/tools/libxc/xc_dom_x86.c b/tools/libxc/xc_dom_x86.c
index 9439805..bd42f42 100644
--- a/tools/libxc/xc_dom_x86.c
+++ b/tools/libxc/xc_dom_x86.c
@@ -67,6 +67,7 @@
 #define SPECIALPAGE_IOREQ    5
 #define SPECIALPAGE_IDENT_PT 6
 #define SPECIALPAGE_CONSOLE  7
+#define SPECIALPAGE_VMPORT_REGS 8
 #define special_pfn(x) \
     (X86_HVM_END_SPECIAL_REGION - X86_HVM_NR_SPECIAL_PAGES + (x))
 
@@ -657,6 +658,8 @@ static int alloc_magic_pages_hvm(struct xc_dom_image *dom)
                      special_pfn(SPECIALPAGE_BUFIOREQ));
     xc_hvm_param_set(xch, domid, HVM_PARAM_IOREQ_PFN,
                      special_pfn(SPECIALPAGE_IOREQ));
+    xc_hvm_param_set(xch, domid, HVM_PARAM_VMPORT_REGS_PFN,
+                     special_pfn(SPECIALPAGE_VMPORT_REGS));
     xc_hvm_param_set(xch, domid, HVM_PARAM_CONSOLE_PFN,
                      special_pfn(SPECIALPAGE_CONSOLE));
     xc_hvm_param_set(xch, domid, HVM_PARAM_PAGING_RING_PFN,
diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index 415c12e..9be4548 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -1822,6 +1822,8 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             }
         }
 
+        if (libxl_defbool_val(c_info->vmware_port))
+            machinearg = GCSPRINTF("%s,vmport=on", machinearg);
         flexarray_append(dm_args, machinearg);
         for (i = 0; b_info->extra_hvm && b_info->extra_hvm[i] != NULL; i++)
             flexarray_append(dm_args, b_info->extra_hvm[i]);
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 9930d68..087ad05 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -419,8 +419,7 @@ static int dm_op(const struct dmop_args *op_args)
         if ( data->pad[0] || data->pad[1] || data->pad[2] )
             break;
 
-        rc = hvm_create_ioreq_server(d, data->handle_bufioreq,
-                                     &data->id);
+        rc = hvm_create_ioreq_server(d, data->flags, &data->id);
         break;
     }
 
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 8b4e73a..befa55e 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -28,6 +28,8 @@
 #include <asm/iocap.h>
 #include <asm/vm_event.h>
 
+vmware_regs_t *get_vmport_regs_any(struct hvm_ioreq_server *s, struct vcpu *v);
+
 struct hvmemul_cache
 {
     /* The cache is disabled as long as num_ents > max_ents. */
@@ -173,6 +175,8 @@ static int hvmemul_do_io(
     };
     void *p_data = (void *)data;
     int rc;
+    bool_t is_vmware = !is_mmio && !data_is_addr &&
+        vmport_check_port(p.addr, p.size);
 
     /*
      * Weird-sized accesses have undefined behaviour: we discard writes
@@ -189,11 +193,17 @@ static int hvmemul_do_io(
     case STATE_IOREQ_NONE:
         break;
     case STATE_IORESP_READY:
+    {
+        uint8_t calc_type = is_mmio ? IOREQ_TYPE_COPY : IOREQ_TYPE_PIO;
+
+        if ( is_vmware )
+            calc_type = IOREQ_TYPE_VMWARE_PORT;
+
         vio->io_req.state = STATE_IOREQ_NONE;
         p = vio->io_req;
 
         /* Verify the emulation request has been correctly re-issued */
-        if ( (p.type != (is_mmio ? IOREQ_TYPE_COPY : IOREQ_TYPE_PIO)) ||
+        if ( (p.type != calc_type) ||
              (p.addr != addr) ||
              (p.size != size) ||
              (p.count > *reps) ||
@@ -202,7 +212,7 @@ static int hvmemul_do_io(
              (p.data_is_ptr != data_is_addr) ||
              (data_is_addr && (p.data != data)) )
             domain_crash(currd);
-
+    }
         if ( data_is_addr )
             return X86EMUL_UNHANDLEABLE;
 
@@ -322,6 +332,49 @@ static int hvmemul_do_io(
             }
         }
 
+        if ( unlikely(is_vmware) )
+        {
+            vmware_regs_t *vr;
+
+            BUILD_BUG_ON(sizeof(ioreq_t) < sizeof(vmware_regs_t));
+
+            p.type = vio->io_req.type = IOREQ_TYPE_VMWARE_PORT;
+            s = hvm_select_ioreq_server(currd, &p);
+            vr = get_vmport_regs_any(s, curr);
+
+            /*
+             * If there is no suitable backing DM, just ignore accesses.  If
+             * we do not have access to registers to pass to QEMU, just
+             * ignore access.
+             */
+            if ( !s || !vr )
+            {
+                rc = hvm_process_io_intercept(&null_handler, &p);
+                vio->io_req.state = STATE_IOREQ_NONE;
+            }
+            else
+            {
+                const struct cpu_user_regs *regs = guest_cpu_user_regs();
+
+                p.data = regs->rax;
+                /* The code in QEMU that uses these registers,
+                 * vmport.c and vmmouse.c, only uses the 32bit part
+                 * of the register.  This is how VMware defined the
+                 * use of these registers.
+                 */
+                vr->ebx = regs->ebx;
+                vr->ecx = regs->ecx;
+                vr->edx = regs->edx;
+                vr->esi = regs->esi;
+                vr->edi = regs->edi;
+
+                rc = hvm_send_ioreq(s, &p, 0);
+                if ( rc != X86EMUL_RETRY || currd->is_shutting_down )
+                    vio->io_req.state = STATE_IOREQ_NONE;
+            }
+            break;
+        }
+
         if ( !s )
             s = hvm_select_ioreq_server(currd, &p);
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 42d96b1..03d2ad5 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4122,6 +4122,7 @@ static int hvm_allow_set_param(struct domain *d,
         /* Fall through */
     case HVM_PARAM_IOREQ_PFN:
     case HVM_PARAM_BUFIOREQ_PFN:
+    case HVM_PARAM_VMPORT_REGS_PFN:
     case HVM_PARAM_IOREQ_SERVER_PFN:
     case HVM_PARAM_NR_IOREQ_SERVER_PAGES:
     case HVM_PARAM_ALTP2M:
@@ -4279,10 +4280,13 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
 
     case HVM_PARAM_IOREQ_PFN:
     case HVM_PARAM_BUFIOREQ_PFN:
+    case HVM_PARAM_VMPORT_REGS_PFN:
         BUILD_BUG_ON(HVM_PARAM_IOREQ_PFN >
                      sizeof(d->arch.hvm.ioreq_gfn.legacy_mask) * 8);
         BUILD_BUG_ON(HVM_PARAM_BUFIOREQ_PFN >
                      sizeof(d->arch.hvm.ioreq_gfn.legacy_mask) * 8);
+        BUILD_BUG_ON(HVM_PARAM_VMPORT_REGS_PFN >
+                     sizeof(d->arch.hvm.ioreq_gfn.legacy_mask) * 8);
         if ( value )
             set_bit(index, &d->arch.hvm.ioreq_gfn.legacy_mask);
         break;
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 1cc27df..a5d124e 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -108,6 +108,44 @@ static struct hvm_ioreq_vcpu *get_pending_vcpu(const struct vcpu *v,
     return NULL;
 }
 
+static vmware_regs_t *get_vmport_regs_one(struct hvm_ioreq_server *s,
+                                          struct vcpu *v)
+{
+    struct hvm_ioreq_vcpu *sv;
+
+    list_for_each_entry ( sv, &s->ioreq_vcpu_list, list_entry )
+    {
+        if ( sv->vcpu == v )
+        {
+            shared_vmport_iopage_t *p = s->vmport_ioreq.va;
+            if ( !p )
+                return NULL;
+            return &p->vcpu_vmport_regs[v->vcpu_id];
+        }
+    }
+    return NULL;
+}
+
+vmware_regs_t *get_vmport_regs_any(struct hvm_ioreq_server *s, struct vcpu *v)
+{
+    struct domain *d = v->domain;
+    unsigned int id;
+
+    ASSERT((v == current) || !vcpu_runnable(v));
+
+    if ( s )
+        return get_vmport_regs_one(s, v);
+
+    FOR_EACH_IOREQ_SERVER(d, id, s)
+    {
+        vmware_regs_t *ret = get_vmport_regs_one(s, v);
+
+        if ( ret )
+            return ret;
+    }
+    return NULL;
+}
+
 bool hvm_io_pending(struct vcpu *v)
 {
     return get_pending_vcpu(v, NULL);
@@ -206,6 +244,26 @@ bool handle_hvm_io_completion(struct vcpu *v)
         return handle_mmio();
 
     case HVMIO_pio_completion:
+        if ( vio->io_req.type == IOREQ_TYPE_VMWARE_PORT )
+        {
+            vmware_regs_t *vr = get_vmport_regs_any(NULL, v);
+
+            if ( vr )
+            {
+                struct cpu_user_regs *regs = guest_cpu_user_regs();
+
+                /* The code in QEMU that uses these registers,
+                 * vmport.c and vmmouse.c, only uses the 32bit part
+                 * of the register.  This is how VMware defined the
+                 * use of these registers.
+                 */
+                regs->ebx = vr->ebx;
+                regs->ecx = vr->ecx;
+                regs->edx = vr->edx;
+                regs->esi = vr->esi;
+                regs->edi = vr->edi;
+            }
+        }
         return handle_pio(vio->io_req.addr, vio->io_req.size,
                           vio->io_req.dir);
 
@@ -233,16 +291,28 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct hvm_ioreq_server *s)
     unsigned int i;
 
     BUILD_BUG_ON(HVM_PARAM_BUFIOREQ_PFN != HVM_PARAM_IOREQ_PFN + 1);
+    BUILD_BUG_ON(HVM_PARAM_VMPORT_REGS_PFN != HVM_PARAM_BUFIOREQ_PFN + 1);
 
     for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
     {
-        if ( !test_and_clear_bit(i, &d->arch.hvm.ioreq_gfn.legacy_mask) )
+        if ( test_and_clear_bit(i, &d->arch.hvm.ioreq_gfn.legacy_mask) )
             return _gfn(d->arch.hvm.params[i]);
     }
 
     return INVALID_GFN;
 }
 
+static gfn_t hvm_alloc_legacy_vmport_gfn(struct hvm_ioreq_server *s)
+{
+    struct domain *d = s->target;
+    unsigned int i = HVM_PARAM_VMPORT_REGS_PFN;
+
+    if ( test_and_clear_bit(i, &d->arch.hvm.ioreq_gfn.legacy_mask) )
+        return _gfn(d->arch.hvm.params[i]);
+
+    return INVALID_GFN;
+}
+
 static gfn_t hvm_alloc_ioreq_gfn(struct hvm_ioreq_server *s)
 {
     struct domain *d = s->target;
@@ -267,12 +337,12 @@ static bool hvm_free_legacy_ioreq_gfn(struct hvm_ioreq_server *s,
     struct domain *d = s->target;
     unsigned int i;
 
-    for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
+    for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_VMPORT_REGS_PFN; i++ )
     {
         if ( gfn_eq(gfn, _gfn(d->arch.hvm.params[i])) )
              break;
     }
-    if ( i > HVM_PARAM_BUFIOREQ_PFN )
+    if ( i > HVM_PARAM_VMPORT_REGS_PFN )
         return false;
 
     set_bit(i, &d->arch.hvm.ioreq_gfn.legacy_mask);
@@ -293,9 +363,29 @@ static void hvm_free_ioreq_gfn(struct hvm_ioreq_server *s, gfn_t gfn)
     }
 }
 
-static void hvm_unmap_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
+typedef enum {
+    ioreq_pt_ioreq,
+    ioreq_pt_bufioreq,
+    ioreq_pt_vmport,
+} ioreq_pt_;
+
+static void hvm_unmap_ioreq_gfn(struct hvm_ioreq_server *s, ioreq_pt_ pt)
 {
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct hvm_ioreq_page *iorp = NULL;
+
+    switch ( pt )
+    {
+    case ioreq_pt_ioreq:
+        iorp = &s->ioreq;
+        break;
+    case ioreq_pt_bufioreq:
+        iorp = &s->bufioreq;
+        break;
+    case ioreq_pt_vmport:
+        iorp = &s->vmport_ioreq;
+        break;
+    }
+    ASSERT(iorp);
 
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return;
@@ -307,12 +397,26 @@ static void hvm_unmap_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
     iorp->gfn = INVALID_GFN;
 }
 
-static int hvm_map_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
+static int hvm_map_ioreq_gfn(struct hvm_ioreq_server *s, ioreq_pt_ pt)
 {
     struct domain *d = s->target;
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct hvm_ioreq_page *iorp = NULL;
     int rc;
 
+    switch ( pt )
+    {
+    case ioreq_pt_ioreq:
+        iorp = &s->ioreq;
+        break;
+    case ioreq_pt_bufioreq:
+        iorp = &s->bufioreq;
+        break;
+    case ioreq_pt_vmport:
+        iorp = &s->vmport_ioreq;
+        break;
+    }
+    ASSERT(iorp);
+
     if ( iorp->page )
     {
         /*
@@ -329,7 +433,10 @@ static int hvm_map_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
     if ( d->is_dying )
         return -EINVAL;
 
-    iorp->gfn = hvm_alloc_ioreq_gfn(s);
+    if ( pt == ioreq_pt_vmport )
+        iorp->gfn = hvm_alloc_legacy_vmport_gfn(s);
+    else
+        iorp->gfn = hvm_alloc_ioreq_gfn(s);
 
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return -ENOMEM;
@@ -338,16 +445,30 @@ static int hvm_map_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
                                  &iorp->va);
 
     if ( rc )
-        hvm_unmap_ioreq_gfn(s, buf);
+        hvm_unmap_ioreq_gfn(s, pt);
 
     return rc;
 }
 
-static int hvm_alloc_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
+static int hvm_alloc_ioreq_mfn(struct hvm_ioreq_server *s, ioreq_pt_ pt)
 {
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct hvm_ioreq_page *iorp = NULL;
     struct page_info *page;
 
+    switch ( pt )
+    {
+    case ioreq_pt_ioreq:
+        iorp = &s->ioreq;
+        break;
+    case ioreq_pt_bufioreq:
+        iorp = &s->bufioreq;
+        break;
+    case ioreq_pt_vmport:
+        iorp = &s->vmport_ioreq;
+        break;
+    }
+    ASSERT(iorp);
+
     if ( iorp->page )
     {
         /*
@@ -391,10 +512,25 @@ static int hvm_alloc_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
     return -ENOMEM;
 }
 
-static void hvm_free_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
+static void hvm_free_ioreq_mfn(struct hvm_ioreq_server *s, ioreq_pt_ pt)
 {
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-    struct page_info *page = iorp->page;
+    struct hvm_ioreq_page *iorp = NULL;
+    struct page_info *page = NULL;
+
+    switch ( pt )
+    {
+    case ioreq_pt_ioreq:
+        iorp = &s->ioreq;
+        break;
+    case ioreq_pt_bufioreq:
+        iorp = &s->bufioreq;
+        break;
+    case ioreq_pt_vmport:
+        iorp = &s->vmport_ioreq;
+        break;
+    }
+    ASSERT(iorp);
+    page = iorp->page;
 
     if ( !page )
         return;
@@ -418,7 +554,9 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
-        if ( (s->ioreq.page == page) || (s->bufioreq.page == page) )
+        if ( (s->ioreq.page == page) ||
+             (s->bufioreq.page == page) ||
+             (s->vmport_ioreq.page == page) )
         {
             found = true;
             break;
@@ -430,11 +568,25 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
     return found;
 }
 
-static void hvm_remove_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
+static void hvm_remove_ioreq_gfn(struct hvm_ioreq_server *s, ioreq_pt_ pt)
 
 {
     struct domain *d = s->target;
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct hvm_ioreq_page *iorp = NULL;
+
+    switch ( pt )
+    {
+    case ioreq_pt_ioreq:
+        iorp = &s->ioreq;
+        break;
+    case ioreq_pt_bufioreq:
+        iorp = &s->bufioreq;
+        break;
+    case ioreq_pt_vmport:
+        iorp = &s->vmport_ioreq;
+        break;
+    }
+    ASSERT(iorp);
 
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return;
@@ -445,12 +597,26 @@ static void hvm_remove_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
     clear_page(iorp->va);
 }
 
-static int hvm_add_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
+static int hvm_add_ioreq_gfn(struct hvm_ioreq_server *s, ioreq_pt_ pt)
 {
     struct domain *d = s->target;
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct hvm_ioreq_page *iorp = NULL;
     int rc;
 
+    switch ( pt )
+    {
+    case ioreq_pt_ioreq:
+        iorp = &s->ioreq;
+        break;
+    case ioreq_pt_bufioreq:
+        iorp = &s->bufioreq;
+        break;
+    case ioreq_pt_vmport:
+        iorp = &s->vmport_ioreq;
+        break;
+    }
+    ASSERT(iorp);
+
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return 0;
 
@@ -480,6 +646,9 @@ static void hvm_update_ioreq_evtchn(struct hvm_ioreq_server *s,
 #define HANDLE_BUFIOREQ(s) \
     ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
 
+#define HANDLE_VMPORT_IOREQ(s) \
+    ((s)->target->arch.hvm.is_vmware_port_enabled)
+
 static int hvm_ioreq_server_add_vcpu(struct hvm_ioreq_server *s,
                                      struct vcpu *v)
 {
@@ -590,42 +759,72 @@ static int hvm_ioreq_server_map_pages(struct hvm_ioreq_server *s)
 {
     int rc;
 
-    rc = hvm_map_ioreq_gfn(s, false);
+    rc = hvm_map_ioreq_gfn(s, ioreq_pt_ioreq);
 
     if ( !rc && HANDLE_BUFIOREQ(s) )
-        rc = hvm_map_ioreq_gfn(s, true);
+        rc = hvm_map_ioreq_gfn(s, ioreq_pt_bufioreq);
 
     if ( rc )
-        hvm_unmap_ioreq_gfn(s, false);
+    {
+        hvm_unmap_ioreq_gfn(s, ioreq_pt_ioreq);
+        return rc;
+    }
+
+    if ( HANDLE_VMPORT_IOREQ(s) )
+    {
+        rc = hvm_map_ioreq_gfn(s, ioreq_pt_vmport);
+
+        if ( rc )
+        {
+            hvm_unmap_ioreq_gfn(s, ioreq_pt_bufioreq);
+            hvm_unmap_ioreq_gfn(s, ioreq_pt_ioreq);
+        }
+    }
 
     return rc;
 }
 
 static void hvm_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
 {
-    hvm_unmap_ioreq_gfn(s, true);
-    hvm_unmap_ioreq_gfn(s, false);
+    hvm_unmap_ioreq_gfn(s, ioreq_pt_vmport);
+    hvm_unmap_ioreq_gfn(s, ioreq_pt_bufioreq);
+    hvm_unmap_ioreq_gfn(s, ioreq_pt_ioreq);
 }
 
 static int hvm_ioreq_server_alloc_pages(struct hvm_ioreq_server *s)
 {
     int rc;
 
-    rc = hvm_alloc_ioreq_mfn(s, false);
+    rc = hvm_alloc_ioreq_mfn(s, ioreq_pt_ioreq);
 
-    if ( !rc && (s->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF) )
-        rc = hvm_alloc_ioreq_mfn(s, true);
+    if ( !rc && HANDLE_BUFIOREQ(s) )
+        rc = hvm_alloc_ioreq_mfn(s, ioreq_pt_bufioreq);
 
     if ( rc )
-        hvm_free_ioreq_mfn(s, false);
+    {
+        hvm_free_ioreq_mfn(s, ioreq_pt_ioreq);
+        return rc;
+    }
+
+    if ( HANDLE_VMPORT_IOREQ(s) )
+    {
+        rc = hvm_alloc_ioreq_mfn(s, ioreq_pt_vmport);
+
+        if ( rc )
+        {
+            hvm_free_ioreq_mfn(s, ioreq_pt_bufioreq);
+            hvm_free_ioreq_mfn(s, ioreq_pt_ioreq);
+        }
+    }
 
     return rc;
 }
 
 static void hvm_ioreq_server_free_pages(struct hvm_ioreq_server *s)
 {
-    hvm_free_ioreq_mfn(s, true);
-    hvm_free_ioreq_mfn(s, false);
+    hvm_free_ioreq_mfn(s, ioreq_pt_vmport);
+    hvm_free_ioreq_mfn(s, ioreq_pt_bufioreq);
+    hvm_free_ioreq_mfn(s, ioreq_pt_ioreq);
 }
 
 static void hvm_ioreq_server_free_rangesets(struct hvm_ioreq_server *s)
@@ -645,12 +844,38 @@ static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
     for ( i = 0; i < NR_IO_RANGE_TYPES; i++ )
     {
         char *name;
+        char *type_name = NULL;
+        unsigned int limit;
 
-        rc = asprintf(&name, "ioreq_server %d %s", id,
-                      (i == XEN_DMOP_IO_RANGE_PORT) ? "port" :
-                      (i == XEN_DMOP_IO_RANGE_MEMORY) ? "memory" :
-                      (i == XEN_DMOP_IO_RANGE_PCI) ? "pci" :
-                      "");
+        switch ( i )
+        {
+        case XEN_DMOP_IO_RANGE_PORT:
+            type_name = "port";
+            limit = MAX_NR_IO_RANGES;
+            break;
+        case XEN_DMOP_IO_RANGE_MEMORY:
+            type_name = "memory";
+            limit = MAX_NR_IO_RANGES;
+            break;
+        case XEN_DMOP_IO_RANGE_PCI:
+            type_name = "pci";
+            limit = MAX_NR_IO_RANGES;
+            break;
+        case XEN_DMOP_IO_RANGE_VMWARE_PORT:
+            type_name = "VMware port";
+            limit = 1;
+            break;
+        case XEN_DMOP_IO_RANGE_TIMEOFFSET:
+            type_name = "timeoffset";
+            limit = 1;
+            break;
+        default:
+            break;
+        }
+        if ( !type_name )
+            continue;
+
+        rc = asprintf(&name, "ioreq_server %d %s", id, type_name);
         if ( rc )
             goto fail;
 
@@ -663,7 +888,11 @@ static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
         if ( !s->range[i] )
             goto fail;
 
-        rangeset_limit(s->range[i], MAX_NR_IO_RANGES);
+        rangeset_limit(s->range[i], limit);
+
+        /* VMware port */
+        if ( i == XEN_DMOP_IO_RANGE_VMWARE_PORT && s->vmport_enabled )
+            rc = rangeset_add_range(s->range[i], 1, 1);
     }
 
     return 0;
@@ -683,8 +912,9 @@ static void hvm_ioreq_server_enable(struct hvm_ioreq_server *s)
     if ( s->enabled )
         goto done;
 
-    hvm_remove_ioreq_gfn(s, false);
-    hvm_remove_ioreq_gfn(s, true);
+    hvm_remove_ioreq_gfn(s, ioreq_pt_vmport);
+    hvm_remove_ioreq_gfn(s, ioreq_pt_bufioreq);
+    hvm_remove_ioreq_gfn(s, ioreq_pt_ioreq);
 
     s->enabled = true;
 
@@ -704,8 +934,9 @@ static void hvm_ioreq_server_disable(struct hvm_ioreq_server *s)
     if ( !s->enabled )
         goto done;
 
-    hvm_add_ioreq_gfn(s, true);
-    hvm_add_ioreq_gfn(s, false);
+    hvm_add_ioreq_gfn(s, ioreq_pt_vmport);
+    hvm_add_ioreq_gfn(s, ioreq_pt_bufioreq);
+    hvm_add_ioreq_gfn(s, ioreq_pt_ioreq);
 
     s->enabled = false;
 
@@ -714,7 +945,7 @@ static void hvm_ioreq_server_disable(struct hvm_ioreq_server *s)
 }
 
 static int hvm_ioreq_server_init(struct hvm_ioreq_server *s,
-                                 struct domain *d, int bufioreq_handling,
+                                 struct domain *d, int flags,
                                  ioservid_t id)
 {
     struct domain *currd = current->domain;
@@ -730,14 +961,18 @@ static int hvm_ioreq_server_init(struct hvm_ioreq_server *s,
     INIT_LIST_HEAD(&s->ioreq_vcpu_list);
     spin_lock_init(&s->bufioreq_lock);
 
+    s->vmport_enabled = d->arch.hvm.is_vmware_port_enabled &&
+        !(flags & HVM_IOREQSRV_DISABLE_VMPORT);
+
     s->ioreq.gfn = INVALID_GFN;
     s->bufioreq.gfn = INVALID_GFN;
+    s->vmport_ioreq.gfn = INVALID_GFN;
 
     rc = hvm_ioreq_server_alloc_rangesets(s, id);
     if ( rc )
         return rc;
 
-    s->bufioreq_handling = bufioreq_handling;
+    s->bufioreq_handling = flags & HVM_IOREQSRV_BUFIOREQ_MASK;
 
     for_each_vcpu ( d, v )
     {
@@ -780,14 +1015,15 @@ static void hvm_ioreq_server_deinit(struct hvm_ioreq_server *s)
     put_domain(s->emulator);
 }
 
-int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
+int hvm_create_ioreq_server(struct domain *d, int flags,
                             ioservid_t *id)
 {
     struct hvm_ioreq_server *s;
     unsigned int i;
     int rc;
 
-    if ( bufioreq_handling > HVM_IOREQSRV_BUFIOREQ_ATOMIC )
+    if ( flags & ~HVM_IOREQSRV_FLAGS_MASK ||
+         (flags & HVM_IOREQSRV_BUFIOREQ_MASK) > HVM_IOREQSRV_BUFIOREQ_ATOMIC )
         return -EINVAL;
 
     s = xzalloc(struct hvm_ioreq_server);
@@ -813,7 +1049,7 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
      */
     set_ioreq_server(d, i, s);
 
-    rc = hvm_ioreq_server_init(s, d, bufioreq_handling, i);
+    rc = hvm_ioreq_server_init(s, d, flags, i);
     if ( rc )
     {
         set_ioreq_server(d, i, NULL);
@@ -1004,6 +1240,8 @@ int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
     case XEN_DMOP_IO_RANGE_PORT:
     case XEN_DMOP_IO_RANGE_MEMORY:
     case XEN_DMOP_IO_RANGE_PCI:
+    case XEN_DMOP_IO_RANGE_TIMEOFFSET:
+    case XEN_DMOP_IO_RANGE_VMWARE_PORT:
         r = s->range[type];
         break;
 
@@ -1056,6 +1294,8 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
     case XEN_DMOP_IO_RANGE_PORT:
     case XEN_DMOP_IO_RANGE_MEMORY:
     case XEN_DMOP_IO_RANGE_PCI:
+    case XEN_DMOP_IO_RANGE_TIMEOFFSET:
+    case XEN_DMOP_IO_RANGE_VMWARE_PORT:
         r = s->range[type];
         break;
 
@@ -1248,7 +1488,10 @@ struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
     uint64_t addr;
     unsigned int id;
 
-    if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
+    if ( p->type != IOREQ_TYPE_COPY &&
+         p->type != IOREQ_TYPE_PIO &&
+         p->type != IOREQ_TYPE_VMWARE_PORT &&
+         p->type != IOREQ_TYPE_TIMEOFFSET )
         return NULL;
 
     cf8 = d->arch.hvm.pci_cf8;
@@ -1282,8 +1525,9 @@ struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
     }
     else
     {
-        type = (p->type == IOREQ_TYPE_PIO) ?
-                XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
+        type = (p->type == IOREQ_TYPE_PIO) ? XEN_DMOP_IO_RANGE_PORT : 
+            (p->type == IOREQ_TYPE_VMWARE_PORT) ? XEN_DMOP_IO_RANGE_VMWARE_PORT :
+            XEN_DMOP_IO_RANGE_MEMORY;
         addr = p->addr;
     }
 
@@ -1326,6 +1570,14 @@ struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
             }
 
             break;
+
+        case XEN_DMOP_IO_RANGE_VMWARE_PORT:
+        case XEN_DMOP_IO_RANGE_TIMEOFFSET:
+            /* The 'special' range of [1,1] is checked for being enabled. */
+            if ( rangeset_contains_singleton(r, 1) )
+                return s;
+
+            break;
         }
     }
 
diff --git a/xen/arch/x86/hvm/vmware/vmport.c b/xen/arch/x86/hvm/vmware/vmport.c
index 863ec50..3c2e7d5 100644
--- a/xen/arch/x86/hvm/vmware/vmport.c
+++ b/xen/arch/x86/hvm/vmware/vmport.c
@@ -14,6 +14,7 @@
  */
 
 #include <xen/lib.h>
+#include <asm/mc146818rtc.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/support.h>
 
@@ -23,6 +24,32 @@ static int vmport_ioport(int dir, uint32_t port, uint32_t bytes, uint32_t *val)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
 
+#define port_overlap(p, n) \
+    ((p + n > BDOOR_PORT) && (p + n <= BDOOR_PORT + 4) ? 1 : \
+    (BDOOR_PORT + 4 > p) && (BDOOR_PORT + 4 <= p + n) ? 1 : 0)
+
+    BUILD_BUG_ON(port_overlap(PIT_BASE, 4));
+    BUILD_BUG_ON(port_overlap(0x61, 1));
+    BUILD_BUG_ON(port_overlap(XEN_HVM_DEBUGCONS_IOPORT, 1));
+    BUILD_BUG_ON(port_overlap(0xcf8, 4));
+/* #define TMR_VAL_ADDR_V0  (ACPI_PM_TMR_BLK_ADDRESS_V0) */
+    BUILD_BUG_ON(port_overlap(ACPI_PM_TMR_BLK_ADDRESS_V0, 4));
+/* #define PM1a_STS_ADDR_V0 (ACPI_PM1A_EVT_BLK_ADDRESS_V0) */
+    BUILD_BUG_ON(port_overlap(ACPI_PM1A_EVT_BLK_ADDRESS_V0, 4));
+    BUILD_BUG_ON(port_overlap(RTC_PORT(0), 2));
+    BUILD_BUG_ON(port_overlap(0x3c4, 2));
+    BUILD_BUG_ON(port_overlap(0x3ce, 2));
+/*
+ * acpi_smi_cmd can not be checked at build time:
+ *   xen/include/asm-x86/acpi.h:extern u32 acpi_smi_cmd;
+ *   xen/arch/x86/acpi/boot.c: acpi_smi_cmd = fadt->smi_command;
+ BUILD_BUG_ON(port_overlap(acpi_smi_cmd, 1));
+*/
+    BUILD_BUG_ON(port_overlap(0x20, 2));
+    BUILD_BUG_ON(port_overlap(0xa0, 2));
+    BUILD_BUG_ON(port_overlap(0x4d0, 1));
+    BUILD_BUG_ON(port_overlap(0x4d1, 1));
+
     /*
      * While VMware expects only 32-bit in, they do support using
      * other sizes and out.  However they do require only the 1 port
@@ -137,6 +164,15 @@ void vmport_register(struct domain *d)
     register_portio_handler(d, BDOOR_PORT, 4, vmport_ioport);
 }
 
+bool_t vmport_check_port(unsigned int port, unsigned int bytes)
+{
+    struct domain *currd = current->domain;
+
+    return is_hvm_domain(currd) &&
+           currd->arch.hvm.is_vmware_port_enabled &&
+           (port >= BDOOR_PORT) && ((port + bytes) <= (BDOOR_PORT + 4));
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 355777c..cdfa62e 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -43,7 +43,7 @@ struct hvm_ioreq_vcpu {
     bool             pending;
 };
 
-#define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_PCI + 1)
+#define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_VMWARE_PORT + 1)
 #define MAX_NR_IO_RANGES  256
 
 struct hvm_ioreq_server {
@@ -54,6 +54,7 @@ struct hvm_ioreq_server {
 
     struct hvm_ioreq_page  ioreq;
     struct list_head       ioreq_vcpu_list;
+    struct hvm_ioreq_page  vmport_ioreq;
     struct hvm_ioreq_page  bufioreq;
 
     /* Lock to serialize access to buffered ioreq ring */
@@ -62,6 +63,7 @@ struct hvm_ioreq_server {
     struct rangeset        *range[NR_IO_RANGE_TYPES];
     bool                   enabled;
     uint8_t                bufioreq_handling;
+    bool_t                 vmport_enabled;
 };
 
 #ifdef CONFIG_MEM_SHARING
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index 74a9590..48bcc98 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -790,6 +790,7 @@ static inline bool hvm_has_set_descriptor_access_exiting(void)
 #endif  /* CONFIG_HVM */
 
 void vmport_register(struct domain *d);
+bool_t vmport_check_port(unsigned int port, unsigned int bytes);
 
 #endif /* __ASM_X86_HVM_HVM_H__ */
 
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index fd00e9d..039b9e4 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -60,16 +60,24 @@ typedef uint16_t ioservid_t;
  *                               secondary emulator.
  *
  * The <id> handed back is unique for target domain. The valur of
- * <handle_bufioreq> should be one of HVM_IOREQSRV_BUFIOREQ_* defined in
- * hvm_op.h. If the value is HVM_IOREQSRV_BUFIOREQ_OFF then  the buffered
+ * <flags> should be one of HVM_IOREQSRV_BUFIOREQ_* defined in
+ * hvm_op.h and ored with HVM_IOREQSRV_DISABLE_VMPORT defined below
+ * if not the 1st IOREQ Server that supports VMware port operation.
+ * If the value is HVM_IOREQSRV_BUFIOREQ_OFF then the buffered
  * ioreq ring will not be allocated and hence all emulation requests to
  * this server will be synchronous.
  */
 #define XEN_DMOP_create_ioreq_server 1
 
 struct xen_dm_op_create_ioreq_server {
-    /* IN - should server handle buffered ioreqs */
-    uint8_t handle_bufioreq;
+    /* IN - should server handle buffered ioreqs and/or vmport regs */
+#define HVM_IOREQSRV_BUFIOREQ_MASK   3
+/*
+ * Disable vmport regs mapping.
+ */
+#define HVM_IOREQSRV_DISABLE_VMPORT  4
+#define HVM_IOREQSRV_FLAGS_MASK      7
+    uint8_t flags;
     uint8_t pad[3];
     /* OUT - server id */
     ioservid_t id;
@@ -132,6 +140,9 @@ struct xen_dm_op_get_ioreq_server_info {
  *
  * NOTE: unless an emulation request falls entirely within a range mapped
  * by a secondary emulator, it will not be passed to that emulator.
+ *
+ * NOTE: The 'special' range of [1,1] is what is checked for on
+ * TIMEOFFSET and VMWARE_PORT.
  */
 #define XEN_DMOP_map_io_range_to_ioreq_server 3
 #define XEN_DMOP_unmap_io_range_from_ioreq_server 4
@@ -145,6 +156,8 @@ struct xen_dm_op_ioreq_server_range {
 # define XEN_DMOP_IO_RANGE_PORT   0 /* I/O port range */
 # define XEN_DMOP_IO_RANGE_MEMORY 1 /* MMIO range */
 # define XEN_DMOP_IO_RANGE_PCI    2 /* PCI segment/bus/dev/func range */
+# define XEN_DMOP_IO_RANGE_TIMEOFFSET 7 /* TIMEOFFSET special range */
+# define XEN_DMOP_IO_RANGE_VMWARE_PORT 9 /* VMware port special range */
     /* IN - inclusive start and end of range */
     uint64_aligned_t start, end;
 };
diff --git a/xen/include/public/hvm/ioreq.h b/xen/include/public/hvm/ioreq.h
index c511fae..19a17ac 100644
--- a/xen/include/public/hvm/ioreq.h
+++ b/xen/include/public/hvm/ioreq.h
@@ -37,6 +37,7 @@
 #define IOREQ_TYPE_PCI_CONFIG   2
 #define IOREQ_TYPE_TIMEOFFSET   7
 #define IOREQ_TYPE_INVALIDATE   8 /* mapcache */
+#define IOREQ_TYPE_VMWARE_PORT  9 /* pio + vmport registers */
 
 /*
  * VMExit dispatcher should cooperate with instruction decoder to
@@ -48,6 +49,8 @@
  *
  * 63....48|47..40|39..35|34..32|31........0
  * SEGMENT |BUS   |DEV   |FN    |OFFSET
+ *
+ * For I/O type IOREQ_TYPE_VMWARE_PORT also use the vmware_regs.
  */
 struct ioreq {
     uint64_t addr;          /* physical address */
@@ -66,11 +69,25 @@ struct ioreq {
 };
 typedef struct ioreq ioreq_t;
 
+struct vmware_regs {
+    uint32_t esi;
+    uint32_t edi;
+    uint32_t ebx;
+    uint32_t ecx;
+    uint32_t edx;
+};
+typedef struct vmware_regs vmware_regs_t;
+
 struct shared_iopage {
     struct ioreq vcpu_ioreq[1];
 };
 typedef struct shared_iopage shared_iopage_t;
 
+struct shared_vmport_iopage {
+    struct vmware_regs vcpu_vmport_regs[1];
+};
+typedef struct shared_vmport_iopage shared_vmport_iopage_t;
+
 struct buf_ioreq {
     uint8_t  type;   /* I/O type                    */
     uint8_t  pad:1;
diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index 0a91bfa..d300fae 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -94,8 +94,8 @@
 #define HVM_PARAM_STORE_EVTCHN 2
 
 #define HVM_PARAM_IOREQ_PFN    5
-
 #define HVM_PARAM_BUFIOREQ_PFN 6
+#define HVM_PARAM_VMPORT_REGS_PFN 7
 
 #if defined(__i386__) || defined(__x86_64__)
 
-- 
1.8.3.1


