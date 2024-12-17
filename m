Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FDE9F51A5
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 18:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859585.1271782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb26-00006X-DL; Tue, 17 Dec 2024 17:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859585.1271782; Tue, 17 Dec 2024 17:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb26-0008Rw-2R; Tue, 17 Dec 2024 17:06:54 +0000
Received: by outflank-mailman (input) for mailman id 859585;
 Tue, 17 Dec 2024 17:06:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+zK=TK=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tNb24-0006B0-Bg
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 17:06:52 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f2c7e7a-bc99-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 18:06:51 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa67333f7d2so827497566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 09:06:51 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab963910f7sm461362666b.166.2024.12.17.09.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 09:06:50 -0800 (PST)
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
X-Inumbo-ID: 4f2c7e7a-bc99-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734455211; x=1735060011; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yFCjWByWBlLWohsvm0nzKlA6dcBQUEk8oUoZi9smWw=;
        b=ygsN4MQQdbZFfzJamLemuXmUg4Jtk0YHJLsPDcPLVBA1CsQPkNBgacxd9txHiiGVlZ
         1Q7XU/oziZHE8gW3pt/zqoE/9dymbAmHAj30Hlv99ugO1tQDVyLBEJHGiYzLXgujQxTZ
         3eS0EE3lF6qTESR2LsNsnpcIhcIHscgtO/iKSCcICyTkYJ4ebCJumCFKRcHI3Q3rwIsa
         OMWp+ouqtSUHUaiMYN0ltnvnvt4iL9h8fVtLkLJ8IVm98H7WDiXuaqvubQs6hTP0GaTM
         EjRE6Vv1XKBQG2GQWb5p8O+SVWc9s5Qv0xgckk8Tp8f1HP8lQlOjooiVuDVPO7uSDxFm
         hTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734455211; x=1735060011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yFCjWByWBlLWohsvm0nzKlA6dcBQUEk8oUoZi9smWw=;
        b=komAIIYbmppXpXuz50F5Hk2W53XEnXaX9cLDVdQp3PluK5UQCa66yWjhv+l7OfR8YT
         8BmYJ/ydLSYbf+yjdEvRhE7sYwnyfyR6EAu+uhYJzFd0L6lO/1Pk50SMUG/Jhd5nHvfy
         u1E/C63zGJJOdhVKuLtVWTAbztC9tVYkK9T7ztFQDx+87hVqj1MhKoXNsBOxe6FhxVWR
         e2MOyMqC1LzJEF7cq6YQXNENKxqQ4glqSPkQfu2/G9UaW4iUe6g2AoW0Omkey+pXEZRQ
         HUuOWoYSzqMyZAUYPj0t4sh8KAd6YkquVCm2c0r1kTWssUj+I8YXXeAj9fmNJGpDnqAn
         g3gA==
X-Gm-Message-State: AOJu0YyREIHe8Eu0OTRIZu0S4zZB16Z7OIgutMJPwJ6D+Z/RStJq52Ru
	DTOUMU63mS50A97VQPGdNyLYbw5KWIzP2Uj+JqrcG700oP/tjQyOup7bMPUFGBIrHFJ+ep2lf+7
	nfMw=
X-Gm-Gg: ASbGncv1idgT3CDKCtk5WRaMlraNU51Q+0TirWnmCtgIXEqJrRNXmtbEeIingXxngwf
	Lr1HLtI+l53bC4iusq/05Xe7zuBtFr2VlB3w3pSPCM3x8RDXcifCbxddTAsQxHhieP2Ymf8hxdv
	6siwChG/U3MVQIzU7FQQFN6VU97OLj/uXB6QL9bMX0dwLThN9XKwPA8EqhG9AlHQgrs8hPV9pjh
	P8KgsDt1SMLJ8K2yKuEFwZSWiO+dBUkAegRhX+3ecFXZZCW6F6H026NXJgFtJ4d8W0SZvjDgsUv
	dXCf0nYm/Nf0Bzu57BvW6k1Oyq+ntHJGzKVztQuhNJ+bp99ml3pV85f3ixI=
X-Google-Smtp-Source: AGHT+IHABKJ8nQpchEGx4HHrgDQ1znx3h1yf5DTmFdzEj9pREyPSZ0pPO4Cj5rldUVQkqa0/rsr9zQ==
X-Received: by 2002:a17:907:d24:b0:aa6:6b7c:8a62 with SMTP id a640c23a62f3a-aabf1c8552emr9481566b.38.1734455210924;
        Tue, 17 Dec 2024 09:06:50 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Luca Miccio <lucmiccio@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: [PATCH v13 10/12] xen/arm: add Xen cache colors command line parameter
Date: Tue, 17 Dec 2024 18:06:35 +0100
Message-ID: <20241217170637.233097-11-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
References: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Add a new command line parameter to configure Xen cache colors.
These colors are dumped together with other coloring info.

Benchmarking the VM interrupt response time provides an estimation of
LLC usage by Xen's most latency-critical runtime task. Results on Arm
Cortex-A53 on Xilinx Zynq UltraScale+ XCZU9EG show that one color, which
reserves 64 KiB of L2, is enough to attain best responsiveness:
- Xen 1 color latency:  3.1 us
- Xen 2 color latency:  3.1 us

Since this is the most common target for Arm cache coloring, the default
amount of Xen colors is set to one.

More colors are instead very likely to be needed on processors whose L1
cache is physically-indexed and physically-tagged, such as Cortex-A57.
In such cases, coloring applies to L1 also, and there typically are two
distinct L1-colors. Therefore, reserving only one color for Xen would
senselessly partitions a cache memory that is already private, i.e.
underutilize it.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v13:
- no changes
v12:
- no changes
v11:
- no changes
v10:
- no changes
v9:
- no changes
v8:
- added bound check on xen_colors in llc_coloring_init()
v7:
- removed XEN_DEFAULT_COLOR
- XEN_DEFAULT_NUM_COLORS is now used in a for loop to set xen default colors
---
 docs/misc/cache-coloring.rst      |  2 ++
 docs/misc/xen-command-line.pandoc | 10 ++++++++++
 xen/common/llc-coloring.c         | 29 +++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
index 5224b27afe..e156062aa2 100644
--- a/docs/misc/cache-coloring.rst
+++ b/docs/misc/cache-coloring.rst
@@ -115,6 +115,8 @@ Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
 +----------------------+-------------------------------+
 | ``buddy-alloc-size`` | Buddy allocator reserved size |
 +----------------------+-------------------------------+
+| ``xen-llc-colors``   | Xen color configuration       |
++----------------------+-------------------------------+
 
 Colors selection format
 ***********************
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index de5d68a452..4f1fde84df 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2925,6 +2925,16 @@ mode.
 **WARNING: `x2apic_phys` is deprecated and superseded by `x2apic-mode`.
 The latter takes precedence if both are set.**
 
+### xen-llc-colors (arm64)
+> `= List of [ <integer> | <integer>-<integer> ]`
+
+> Default: `0: the lowermost color`
+
+Specify Xen LLC color configuration. This options is available only when
+`CONFIG_LLC_COLORING` is enabled.
+Two colors are most likely needed on platforms where private caches are
+physically indexed, e.g. the L1 instruction cache of the Arm Cortex-A57.
+
 ### xenheap_megabytes (arm32)
 > `= <size>`
 
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index bebd6e2056..0cfaa77a2b 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -13,6 +13,7 @@
 #include <xen/types.h>
 
 #define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)
+#define XEN_DEFAULT_NUM_COLORS 1
 
 /*
  * -1: not specified (disabled unless llc-size and llc-nr-ways present)
@@ -36,6 +37,9 @@ static unsigned int __ro_after_init default_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_colors[NR_LLC_COLORS];
 static unsigned int __initdata dom0_num_colors;
 
+static unsigned int __ro_after_init xen_colors[NR_LLC_COLORS];
+static unsigned int __ro_after_init xen_num_colors;
+
 #define mfn_color_mask              (max_nr_colors - 1)
 #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
 
@@ -94,6 +98,13 @@ static int __init parse_dom0_colors(const char *s)
 }
 custom_param("dom0-llc-colors", parse_dom0_colors);
 
+static int __init parse_xen_colors(const char *s)
+{
+    return parse_color_config(s, xen_colors, ARRAY_SIZE(xen_colors),
+                              &xen_num_colors);
+}
+custom_param("xen-llc-colors", parse_xen_colors);
+
 static void print_colors(const unsigned int colors[], unsigned int num_colors)
 {
     unsigned int i;
@@ -178,6 +189,22 @@ void __init llc_coloring_init(void)
     for ( i = 0; i < max_nr_colors; i++ )
         default_colors[i] = i;
 
+    if ( !xen_num_colors )
+    {
+        unsigned int i;
+
+        xen_num_colors = MIN(XEN_DEFAULT_NUM_COLORS, max_nr_colors);
+
+        printk(XENLOG_WARNING
+               "Xen LLC color config not found. Using first %u colors\n",
+               xen_num_colors);
+        for ( i = 0; i < xen_num_colors; i++ )
+            xen_colors[i] = i;
+    }
+    else if ( xen_num_colors > max_nr_colors ||
+              !check_colors(xen_colors, xen_num_colors) )
+        panic("Bad LLC color config for Xen\n");
+
     arch_llc_coloring_init();
 }
 
@@ -188,6 +215,8 @@ void dump_llc_coloring_info(void)
 
     printk("LLC coloring info:\n");
     printk("    Number of LLC colors supported: %u\n", max_nr_colors);
+    printk("    Xen LLC colors (%u): ", xen_num_colors);
+    print_colors(xen_colors, xen_num_colors);
 }
 
 void domain_dump_llc_colors(const struct domain *d)
-- 
2.43.0


