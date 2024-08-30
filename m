Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D32096686C
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 19:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786568.1196157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk5oD-0001i1-GS; Fri, 30 Aug 2024 17:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786568.1196157; Fri, 30 Aug 2024 17:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk5oD-0001fz-Cz; Fri, 30 Aug 2024 17:53:17 +0000
Received: by outflank-mailman (input) for mailman id 786568;
 Fri, 30 Aug 2024 17:53:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGfl=P5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sk5oB-0001fr-As
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 17:53:15 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba711939-66f8-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 19:53:13 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a86910caf9cso555690666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 10:53:13 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb2a3sm239739966b.3.2024.08.30.10.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:53:11 -0700 (PDT)
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
X-Inumbo-ID: ba711939-66f8-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725040393; x=1725645193; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iLBjy3jQyg2WrSnoZIIBj/Tgnhve2wb9GQSzOxv16XM=;
        b=TNybCgAe0QBRRO56b5+vA6AU5rk/Gy62f7kzAAII8w3YkYrJ1cbhwV3Xo1JTA418Lp
         XTBFvGsd14GyObafQjMXCy3wDu64qvtxmB/bcTteZ6O408XN8gK6GAh/2cLyoXQJkJyy
         UJW1BXWeRED7oQZCTZikbLa0VVnAKCbz+/AAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725040393; x=1725645193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLBjy3jQyg2WrSnoZIIBj/Tgnhve2wb9GQSzOxv16XM=;
        b=s+bNUuroR3d2dhwxQeXUWn8iRtGidCjNBElpfyMc5xTaKBATdBx6+bb/CmbJpUmlWF
         x4j7GuKPtAHXbOTfGBa374Q/2x6WoDIwPwznOivugczG/17jSajJjFAYrEJYm+2CyPaw
         hmuvVzD6pOO3N2L18oON6GElkyiYShPLq8q8EYkQxECFBJa3SDEbaRJKA7ZAVxAotpol
         QeEiejWnz+EF4jfdT2qZREkzIXWGgkP+KkxhiqvC247AXM8b/hXz8XF0bt9UdkcgOLnY
         BpUzHgDfEadI5cRS1p8avdyXLS90nc/WxzCTZoDZHW8Kwm9xTsDwyk7VZjgAqgCMAElv
         hIAQ==
X-Gm-Message-State: AOJu0YyNxMEz+iRSy2KpqChb2jMbP0/P74S/caO+8D412wzvIWtGaj3W
	+D5WOqJYRSJatosYTWl/7lEpcClSe2D2Mhj+UYsrp3pMKy64TzwwdL3Wps1lA7I0PKlE+wD7WUs
	r
X-Google-Smtp-Source: AGHT+IEc+PBwEUC87ER5KaT6r3CPMvdWEEhenPmCO1InpZBVYj2ppc+KV97HFABgF08k7L7IVEa6MA==
X-Received: by 2002:a17:906:565a:b0:a89:b829:7598 with SMTP id a640c23a62f3a-a89b8297622mr60152566b.12.1725040392217;
        Fri, 30 Aug 2024 10:53:12 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Rob Hoes <Rob.Hoes@citrix.com>,
	Andrii Sultanov <andrii.sultanov@cloud.com>
Subject: [PATCH] tools/ocaml/xc: Drop the GC lock for all hypercalls
Date: Fri, 30 Aug 2024 18:53:09 +0100
Message-Id: <20240830175309.2854442-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We should be doing this unilaterally.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
CC: Andrii Sultanov <andrii.sultanov@cloud.com>

Also pulled out of a larger cleanup series.
---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 63 +++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index c78191f95abc..20487b21008f 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -312,7 +312,10 @@ CAMLprim value stub_xc_domain_max_vcpus(value xch_val, value domid,
 	xc_interface *xch = xch_of_val(xch_val);
 	int r;
 
+	caml_enter_blocking_section();
 	r = xc_domain_max_vcpus(xch, Int_val(domid), Int_val(max_vcpus));
+	caml_leave_blocking_section();
+
 	if (r)
 		failwith_xc(xch);
 
@@ -329,7 +332,10 @@ value stub_xc_domain_sethandle(value xch_val, value domid, value handle)
 
 	domain_handle_of_uuid_string(h, String_val(handle));
 
+	caml_enter_blocking_section();
 	i = xc_domain_sethandle(xch, Int_val(domid), h);
+	caml_leave_blocking_section();
+
 	if (i)
 		failwith_xc(xch);
 
@@ -391,7 +397,10 @@ CAMLprim value stub_xc_domain_shutdown(value xch_val, value domid, value reason)
 	xc_interface *xch = xch_of_val(xch_val);
 	int ret;
 
+	caml_enter_blocking_section();
 	ret = xc_domain_shutdown(xch, Int_val(domid), Int_val(reason));
+	caml_leave_blocking_section();
+
 	if (ret < 0)
 		failwith_xc(xch);
 
@@ -503,7 +512,10 @@ CAMLprim value stub_xc_domain_getinfo(value xch_val, value domid)
 	xc_domaininfo_t info;
 	int ret;
 
+	caml_enter_blocking_section();
 	ret = xc_domain_getinfo_single(xch, Int_val(domid), &info);
+	caml_leave_blocking_section();
+
 	if (ret < 0)
 		failwith_xc(xch);
 
@@ -546,7 +558,10 @@ CAMLprim value stub_xc_vcpu_context_get(value xch_val, value domid,
 	int ret;
 	vcpu_guest_context_any_t ctxt;
 
+	caml_enter_blocking_section();
 	ret = xc_vcpu_getcontext(xch, Int_val(domid), Int_val(cpu), &ctxt);
+	caml_leave_blocking_section();
+
 	if ( ret < 0 )
 		failwith_xc(xch);
 
@@ -584,10 +599,14 @@ CAMLprim value stub_xc_vcpu_setaffinity(value xch_val, value domid,
 		if (Bool_val(Field(cpumap, i)))
 			c_cpumap[i/8] |= 1 << (i&7);
 	}
+
+	caml_enter_blocking_section();
 	retval = xc_vcpu_setaffinity(xch, Int_val(domid),
 				     Int_val(vcpu),
 				     c_cpumap, NULL,
 				     XEN_VCPUAFFINITY_HARD);
+	caml_leave_blocking_section();
+
 	free(c_cpumap);
 
 	if (retval < 0)
@@ -612,10 +631,13 @@ CAMLprim value stub_xc_vcpu_getaffinity(value xch_val, value domid,
 	if (c_cpumap == NULL)
 		failwith_xc(xch);
 
+	caml_enter_blocking_section();
 	retval = xc_vcpu_getaffinity(xch, Int_val(domid),
 				     Int_val(vcpu),
 				     c_cpumap, NULL,
 				     XEN_VCPUAFFINITY_HARD);
+	caml_leave_blocking_section();
+
 	if (retval < 0) {
 		free(c_cpumap);
 		failwith_xc(xch);
@@ -639,9 +661,13 @@ CAMLprim value stub_xc_sched_id(value xch_val)
 {
 	CAMLparam1(xch_val);
 	xc_interface *xch = xch_of_val(xch_val);
-	int sched_id;
+	int ret, sched_id;
+
+	caml_enter_blocking_section();
+	ret = xc_sched_id(xch, &sched_id);
+	caml_leave_blocking_section();
 
-	if (xc_sched_id(xch, &sched_id))
+	if (ret)
 		failwith_xc(xch);
 
 	CAMLreturn(Val_int(sched_id));
@@ -674,7 +700,10 @@ CAMLprim value stub_xc_evtchn_reset(value xch_val, value domid)
 	xc_interface *xch = xch_of_val(xch_val);
 	int r;
 
+	caml_enter_blocking_section();
 	r = xc_evtchn_reset(xch, Int_val(domid));
+	caml_leave_blocking_section();
+
 	if (r < 0)
 		failwith_xc(xch);
 	CAMLreturn(Val_unit);
@@ -811,7 +840,10 @@ CAMLprim value stub_xc_send_debug_keys(value xch_val, value keys)
 	xc_interface *xch = xch_of_val(xch_val);
 	int r;
 
+	caml_enter_blocking_section();
 	r = xc_send_debug_keys(xch, String_val(keys));
+	caml_leave_blocking_section();
+
 	if (r)
 		failwith_xc(xch);
 	CAMLreturn(Val_unit);
@@ -952,7 +984,11 @@ CAMLprim value stub_xc_domain_set_memmap_limit(value xch_val, value domid,
 	int retval;
 
 	v = Int64_val(map_limitkb);
+
+	caml_enter_blocking_section();
 	retval = xc_domain_set_memmap_limit(xch, Int_val(domid), v);
+	caml_leave_blocking_section();
+
 	if (retval)
 		failwith_xc(xch);
 
@@ -1203,8 +1239,11 @@ CAMLprim value stub_xc_domain_ioport_permission(value xch_val, value domid,
 	c_nr_ports = Int_val(nr_ports);
 	c_allow = Bool_val(allow);
 
+	caml_enter_blocking_section();
 	ret = xc_domain_ioport_permission(xch, Int_val(domid),
 					 c_start_port, c_nr_ports, c_allow);
+	caml_leave_blocking_section();
+
 	if (ret < 0)
 		failwith_xc(xch);
 
@@ -1225,8 +1264,11 @@ CAMLprim value stub_xc_domain_iomem_permission(value xch_val, value domid,
 	c_nr_pfns = Nativeint_val(nr_pfns);
 	c_allow = Bool_val(allow);
 
+	caml_enter_blocking_section();
 	ret = xc_domain_iomem_permission(xch, Int_val(domid),
 					 c_start_pfn, c_nr_pfns, c_allow);
+	caml_leave_blocking_section();
+
 	if (ret < 0)
 		failwith_xc(xch);
 
@@ -1245,8 +1287,11 @@ CAMLprim value stub_xc_domain_irq_permission(value xch_val, value domid,
 	c_pirq = Int_val(pirq);
 	c_allow = Bool_val(allow);
 
+	caml_enter_blocking_section();
 	ret = xc_domain_irq_permission(xch, Int_val(domid),
 				       c_pirq, c_allow);
+	caml_leave_blocking_section();
+
 	if (ret < 0)
 		failwith_xc(xch);
 
@@ -1309,7 +1354,9 @@ CAMLprim value stub_xc_domain_test_assign_device(value xch_val, value domid, val
 	func = Int_val(Field(desc, 3));
 	sbdf = encode_sbdf(domain, bus, dev, func);
 
+	caml_enter_blocking_section();
 	ret = xc_test_assign_device(xch, Int_val(domid), sbdf);
+	caml_leave_blocking_section();
 
 	CAMLreturn(Val_bool(ret == 0));
 }
@@ -1328,8 +1375,10 @@ CAMLprim value stub_xc_domain_assign_device(value xch_val, value domid, value de
 	func = Int_val(Field(desc, 3));
 	sbdf = encode_sbdf(domain, bus, dev, func);
 
+	caml_enter_blocking_section();
 	ret = xc_assign_device(xch, Int_val(domid), sbdf,
 			       XEN_DOMCTL_DEV_RDM_RELAXED);
+	caml_leave_blocking_section();
 
 	if (ret < 0)
 		failwith_xc(xch);
@@ -1350,7 +1399,9 @@ CAMLprim value stub_xc_domain_deassign_device(value xch_val, value domid, value
 	func = Int_val(Field(desc, 3));
 	sbdf = encode_sbdf(domain, bus, dev, func);
 
+	caml_enter_blocking_section();
 	ret = xc_deassign_device(xch, Int_val(domid), sbdf);
+	caml_leave_blocking_section();
 
 	if (ret < 0)
 		failwith_xc(xch);
@@ -1379,8 +1430,11 @@ CAMLprim value stub_xc_get_cpu_featureset(value xch_val, value idx)
 		/* To/from hypervisor to retrieve actual featureset */
 		uint32_t fs[fs_len], len = fs_len;
 		unsigned int i;
+		int ret;
 
-		int ret = xc_get_cpu_featureset(xch, Int_val(idx), &len, fs);
+		caml_enter_blocking_section();
+		ret = xc_get_cpu_featureset(xch, Int_val(idx), &len, fs);
+		caml_leave_blocking_section();
 
 		if (ret)
 			failwith_xc(xch);
@@ -1403,7 +1457,10 @@ CAMLprim value stub_xc_watchdog(value xch_val, value domid, value timeout)
 	int ret;
 	unsigned int c_timeout = Int32_val(timeout);
 
+	caml_enter_blocking_section();
 	ret = xc_watchdog(xch, Int_val(domid), c_timeout);
+	caml_leave_blocking_section();
+
 	if (ret < 0)
 		failwith_xc(xch);
 
-- 
2.39.2


