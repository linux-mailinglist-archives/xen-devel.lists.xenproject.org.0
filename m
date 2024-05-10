Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E208C251A
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 14:51:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719864.1122720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Pi5-0001dy-0R; Fri, 10 May 2024 12:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719864.1122720; Fri, 10 May 2024 12:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Pi4-0001ao-Tt; Fri, 10 May 2024 12:50:48 +0000
Received: by outflank-mailman (input) for mailman id 719864;
 Fri, 10 May 2024 12:50:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+D8H=MN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s5Pi3-0001ad-SA
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 12:50:47 +0000
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [2607:f8b0:4864:20::f31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb6c1511-0ecb-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 14:50:46 +0200 (CEST)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6a073f10e8eso8098416d6.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 05:50:46 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f195018sm17144226d6.74.2024.05.10.05.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 05:50:44 -0700 (PDT)
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
X-Inumbo-ID: eb6c1511-0ecb-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715345445; x=1715950245; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mdAQL6LWUhcHd+2TKy01L2FyMVtjyGGs4TMnOgqrMqU=;
        b=IcRehdOAu2vk84PoQP+HmqLn5Yoao4CQBH1GB6Yu49QvM/OKvros10XRrZr9r1HRGO
         WzIEJO/RQxD7kX4fVm3zjADXznOnGFfFbyUjwgS+7kHAwe8kUDZgWoEg8MWwR0ELrjqt
         W2NH6nMctJ/KiaABQUEYaSMbRxnVKECNC+XgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715345445; x=1715950245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdAQL6LWUhcHd+2TKy01L2FyMVtjyGGs4TMnOgqrMqU=;
        b=i2FOaTyAG7EQ7t76MCKC5VUycCBDORccWQVTGr+x3nw9iofhv9n/b24E9m3xiDJoLa
         0mwePhYHFbafp9CtZn27qELu1s3zL1ZB9RWQqDVxWeEWtSeMc3XEevkAjqQn6+TFWHOl
         9SATQwQXCVQW80IWxrWpSN05yesutgcbLTjb18RlWNOAuHoHUKtIpQ92uZ/EIGBqUzFm
         0bo48RrYHGWHtziDrEpV/k1IxeJC7PZwzsI8zxLi8b0q9POjFGkYMNlwflOE4PxgmFE8
         bmwyvMopuISyIPNILc8prx2OHOTL9j8ajgGHVVNfRc9K58SCEH7o79AC+s0sRJBZZsY1
         GxDg==
X-Gm-Message-State: AOJu0YxkwZtdq9uZuBoyimmFyQaOU3uo4lJmMkcsjQcVfC1/AqGrdMQk
	CsDjWBmjI1IyfqDQE/c9gzwOwlT0mMPPHHoplSvYmN6e2SmNhtlGeiZNOR27a+TMkbln0Sk4ni7
	q
X-Google-Smtp-Source: AGHT+IEYrRMn6RljjSD/DkKmMC+boUrUg/gIAaIUrqGnt1xLnLi86R/xTvCv6GEu4L6bi+EBeV+EuA==
X-Received: by 2002:a05:6214:3906:b0:6a0:ab13:e058 with SMTP id 6a1803df08f44-6a168160125mr25512216d6.16.1715345444981;
        Fri, 10 May 2024 05:50:44 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Oleksii K ." <oleksii.kurochko@gmail.com>,
	Arthur Borsboom <arthurborsboom@gmail.com>,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH for-4.19] libxl: fix population of the online vCPU bitmap for PVH
Date: Fri, 10 May 2024 14:49:13 +0200
Message-ID: <20240510124913.49945-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libxl passes some information to libacpi to create the ACPI table for a PVH
guest, and among that information it's a bitmap of which vCPUs are online
which can be less than the maximum number of vCPUs assigned to the domain.

While the population of the bitmap is done correctly for HVM based on the
number of online vCPUs, for PVH the population of the bitmap is done based on
the number of maximum vCPUs allowed.  This leads to all local APIC entries in
the MADT being set as enabled, which contradicts the data in xenstore if vCPUs
is different than maximum vCPUs.

Fix by copying the internal libxl bitmap that's populated based on the vCPUs
parameter.

Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
Link: https://gitlab.com/libvirt/libvirt/-/issues/399
Reported-by: Leigh Brown <leigh@solinno.co.uk>
Fixes: 14c0d328da2b ('libxl/acpi: Build ACPI tables for HVMlite guests')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Note that the setup of hvm_info_table could be shared between PVH and HVM, as
the fields are very limited, see hvm_build_set_params() for the HVM side.
However this late in the release it's safer to just adjust the PVH path.

Also note the checksum is not provided when hvm_info_table is built for PVH.
This is fine so far because such checksum is only consumed by hvmloader and not
libacpi itself.

It's a bugfix, so should be considered for 4.19.
---
 tools/libs/light/libxl_x86_acpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_x86_acpi.c b/tools/libs/light/libxl_x86_acpi.c
index 620f3c700c3e..5cf261bd6794 100644
--- a/tools/libs/light/libxl_x86_acpi.c
+++ b/tools/libs/light/libxl_x86_acpi.c
@@ -89,7 +89,7 @@ static int init_acpi_config(libxl__gc *gc,
     uint32_t domid = dom->guest_domid;
     xc_domaininfo_t info;
     struct hvm_info_table *hvminfo;
-    int i, r, rc;
+    int r, rc;
 
     config->dsdt_anycpu = config->dsdt_15cpu = dsdt_pvh;
     config->dsdt_anycpu_len = config->dsdt_15cpu_len = dsdt_pvh_len;
@@ -138,8 +138,8 @@ static int init_acpi_config(libxl__gc *gc,
         hvminfo->nr_vcpus = info.max_vcpu_id + 1;
     }
 
-    for (i = 0; i < hvminfo->nr_vcpus; i++)
-        hvminfo->vcpu_online[i / 8] |= 1 << (i & 7);
+    memcpy(hvminfo->vcpu_online, b_info->avail_vcpus.map,
+           b_info->avail_vcpus.size);
 
     config->hvminfo = hvminfo;
 
-- 
2.44.0


