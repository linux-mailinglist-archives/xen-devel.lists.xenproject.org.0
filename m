Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2886C0FA0D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 18:27:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151697.1482244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDQzP-0002Si-IP; Mon, 27 Oct 2025 17:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151697.1482244; Mon, 27 Oct 2025 17:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDQzP-0002R7-FW; Mon, 27 Oct 2025 17:26:39 +0000
Received: by outflank-mailman (input) for mailman id 1151697;
 Mon, 27 Oct 2025 17:26:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjEP=5E=bounce.vates.tech=bounce-md_30504962.68ffab49.v1-5b31a19e18894c109ce18d0fd42be2bb@srs-se1.protection.inumbo.net>)
 id 1vDQzN-0002Qy-Qc
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 17:26:38 +0000
Received: from mail132-22.atl131.mandrillapp.com
 (mail132-22.atl131.mandrillapp.com [198.2.132.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1634a743-b35a-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 18:26:35 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-22.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4cwL5j6jF6zGlsvQD
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 17:26:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5b31a19e18894c109ce18d0fd42be2bb; Mon, 27 Oct 2025 17:26:33 +0000
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
X-Inumbo-ID: 1634a743-b35a-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761585993; x=1761855993;
	bh=akIZjurkfx4umR6HXIbRiCq0LksKkl71LpPu/xGEBqY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aszSUeVZFL8Hd9lyl7Nral3H5btfCkdY2jxgxU0ppK2G1ew2C8GNE+revuGEhc96b
	 OWIx5Zj0AHhnQI/EHbah6X7+vcvxzRKooBGQBb9CxuWBLEX3Us6J80U79v6w0xv/dy
	 XnSjtA4rzHlw5PjRaX68eql8rcs1xe6lgN0Q/iYN7kSqqLF6wldT3974j9AOtIKy8I
	 NfdTbUA3x5C0LtBpBXDjxvs9ZBsQ1U3jiRBDI1uQ39Zcfl+VOWZJ8IGvTlPPTyu6FG
	 Jj2TZZ57QRvMeR7qNO7TtV5pc8e6yWjrLPidHBRAHxQXoEOiXZXFIA7RzrddITMA8N
	 BQmIR9XLiZt9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761585993; x=1761846493; i=teddy.astie@vates.tech;
	bh=akIZjurkfx4umR6HXIbRiCq0LksKkl71LpPu/xGEBqY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cwi1khAOZLDIHFRxADBKLFOZDZDwDNNc070ME6l6HeJ6/cTEFUQk9H5qXcLE2IyYF
	 lznS2qfCBqhlwKz6fv41fqBC0+no+3rwkUpZnmZcXiSL0A+ILDTRYREmDCkYFhYeJ+
	 19D8oiuacKt0+ENIM4TohPc5NSg2bo10+k5Q63pppEql9FZa8t76ijdi1hK+K1jO6I
	 aYRE9bcOk2R+yljtokoUIx6QjJl8B2ACbNVal90TJ1G6vztIWQZR9FGtKTa4reY//K
	 FvMTOMzDjGS7mSpgxfCKngptzUQfHW9uu7dx0WkM5f/mNcijjffu/qRZWm3FX7tyIG
	 M/oxHc5hWSXzg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20for-4.22=202/2]=20tools:=20Introduce=20xen-inteltemp=20tool?=
X-Mailer: git-send-email 2.51.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761585993392
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <acb887d5df692aa143cb2b509dd362b7b46c158e.1761585640.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1761585640.git.teddy.astie@vates.tech>
References: <cover.1761585640.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5b31a19e18894c109ce18d0fd42be2bb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251027:md
Date: Mon, 27 Oct 2025 17:26:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Introduce a new tool to fetch Intel CPU temperatures through the
Intel DTS interface using XENPF_resource_op hypercall.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 tools/misc/.gitignore      |  1 +
 tools/misc/Makefile        |  4 ++
 tools/misc/xen-inteltemp.c | 98 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 tools/misc/xen-inteltemp.c

diff --git a/tools/misc/.gitignore b/tools/misc/.gitignore
index 28af46280f..65048eb901 100644
--- a/tools/misc/.gitignore
+++ b/tools/misc/.gitignore
@@ -5,6 +5,7 @@ xen-diag
 xen-hptool
 xen-hvmcrash
 xen-hvmctx
+xen-inteltemp
 xen-livepatch
 xen-lowmemd
 xen-mceinj
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index c26e544e83..6498b47ec0 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -25,6 +25,7 @@ INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-memshare
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-mfndump
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-ucode
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-vmtrace
+INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-inteltemp
 INSTALL_SBIN                   +=3D xencov
 INSTALL_SBIN                   +=3D xenhypfs
 INSTALL_SBIN                   +=3D xenlockprof
@@ -89,6 +90,9 @@ xen-memshare: xen-memshare.o
 xen-vmtrace: xen-vmtrace.o
 =09$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenforeignme=
mory) $(APPEND_LDFLAGS)
 
+xen-inteltemp: xen-inteltemp.o
+=09$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
+
 xen-mceinj: xen-mceinj.o
 =09$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(=
LDLIBS_libxenstore) $(APPEND_LDFLAGS)
 
diff --git a/tools/misc/xen-inteltemp.c b/tools/misc/xen-inteltemp.c
new file mode 100644
index 0000000000..624c74ca7f
--- /dev/null
+++ b/tools/misc/xen-inteltemp.c
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen-inteltemp.c
+ *
+ * Get the CPU temperature of Intel processors.
+ *
+ * Copyright 2025 Teddy Astie <teddy.astie@vates.tech>
+ */
+
+#include <stdio.h>
+#include <errno.h>
+#include <xenctrl.h>
+
+#define MSR_IA32_THERM_STATUS         0x0000019c
+#define MSR_IA32_TEMPERATURE_TARGET   0x000001a2
+#define MSR_IA32_PACKAGE_THERM_STATUS 0x000001b1
+
+int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *tem=
p)
+{
+    xc_resource_entry_t entries[2] =3D {
+        (xc_resource_entry_t){
+            .idx =3D package ? MSR_IA32_PACKAGE_THERM_STATUS : MSR_IA32_TH=
ERM_STATUS
+        },
+        (xc_resource_entry_t){ .idx =3D MSR_IA32_TEMPERATURE_TARGET },
+    };
+    struct xc_resource_op ops =3D {
+        .cpu =3D cpu,
+        .entries =3D entries,
+        .nr_entries =3D 2,
+    };
+    int tjmax;
+
+    int ret =3D xc_resource_op(xch, 1, &ops);
+
+    if ( ret <=3D 0 )
+        /* This CPU isn't online or can't query this MSR */
+        return ret ?: -EOPNOTSUPP;
+
+    if ( ret =3D=3D 2 )
+        tjmax =3D (entries[1].val >> 16) & 0xff;
+    else
+    {
+        /*
+         * The CPU doesn't support MSR_IA32_TEMPERATURE_TARGET, we assume =
it's 100 which
+         * is correct aside a few selected Atom CPUs. Check coretemp sourc=
e code for more
+         * information.
+         */
+        fprintf(stderr, "CPU%d doesn't support MSR_IA32_TEMPERATURE_TARGET=
, assume "
+               "tjmax=3D100=C2=B0C, readings may be incorrect\n", cpu);
+        tjmax =3D 100;
+    }
+    
+    *temp =3D tjmax - ((entries[0].val >> 16) & 0xff);
+    return 0;
+}
+
+int main(void)
+{
+    int rc =3D 0, temp, cpu, socket;
+    bool has_data =3D false;
+    xc_interface *xch =3D xc_interface_open(0, 0, 0);
+    xc_physinfo_t info;
+
+    if ( (rc =3D xc_physinfo(xch, &info)) < 0 )
+    {
+        perror("Getting physinfo failed");
+        return rc;
+    }
+
+    /* Per socket measurement */
+    for ( socket =3D 0, cpu =3D 0;
+          cpu < (info.max_cpu_id + 1);
+          socket++, cpu +=3D info.cores_per_socket * info.threads_per_core=
 )
+    {
+        if ( !fetch_dts_temp(xch, cpu, true, &temp) )
+        {
+            has_data =3D true;
+            printf("Package%d: %d=C2=B0C\n", socket, temp);
+        }
+    }
+
+    printf("\n");
+
+    for ( cpu =3D 0; cpu < (info.max_cpu_id + 1); cpu +=3D info.threads_pe=
r_core )
+    {
+        if ( fetch_dts_temp(xch, cpu, false, &temp) )
+            continue;
+
+        has_data =3D true;
+        printf("CPU%d: %d=C2=B0C\n", cpu, temp);
+    }
+
+    if ( !has_data )
+        printf("No data\n");
+
+    xc_interface_close(xch);
+    return 0;
+}
\ No newline at end of file
-- 
2.51.1



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



