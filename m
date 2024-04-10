Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 217248A0435
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 01:48:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703701.1099525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruhfT-0000CD-6z; Wed, 10 Apr 2024 23:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703701.1099525; Wed, 10 Apr 2024 23:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruhfT-00009Y-3B; Wed, 10 Apr 2024 23:47:51 +0000
Received: by outflank-mailman (input) for mailman id 703701;
 Wed, 10 Apr 2024 23:47:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHON=LP=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1ruhfR-0007t7-SC
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 23:47:49 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbf7e741-f794-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 01:47:47 +0200 (CEST)
Received: from MN2PR19CA0065.namprd19.prod.outlook.com (2603:10b6:208:19b::42)
 by BL3PR12MB6644.namprd12.prod.outlook.com (2603:10b6:208:3b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 23:47:44 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:19b:cafe::74) by MN2PR19CA0065.outlook.office365.com
 (2603:10b6:208:19b::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 23:47:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 23:47:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 18:47:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 18:47:43 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 18:47:42 -0500
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
X-Inumbo-ID: bbf7e741-f794-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jv+eQzE59uYRpgDZQzo1+ss1Y0qMisSd39Ww/BsgrnY+1AEv9yyxXjJrAZFTRJ6xxx2kqgeMU4vTfyZ4VRSPjRvuuHNqlS3zASpXthtJO1SpuO7DsogJv3kXniIDaZup23m6mfBLp0Ocq6bWjWZ5BtNfsCYQeq5oj4cVi75CMyBRDeIGpdsfPXcpKQO8AetxyRA/WiW5zVTQPJ42lj/czyMfcDHSTWNi8dIhCqfgj76XkVIDJM1DCZh/tmHgykXP8hjZCOLlyHRYvhiJr9bqhlbnzxmiszX0Zp4vNhLyaQEDUIWvIZJHw2TK7fGwVbiIDcD5qNDf3Vh2yeVDHETwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaIg2vgRJkUNARF3tfFcTa4SSvAWBZd5C0EPMzdLi6I=;
 b=bqrrap8dSOgS+MjXXgsJ1gXeOtue+/0iObxFnetegAj3hRu/IegsDAsTgq3Z3GvoDfa6ehhUaYoyXYvA8BSa9eXg17eTQe8CLrtvWMOzAZWkcg6gDYalsKBRx5ZNEvavR82JQRUwAvY9m2UV5qAJvAOxPpQEFzFBMsNqWiaz82bXlu9XBN3RtUdDT+LT5zD9BcJouW8G4y6y0NJ6ZPqSQ/cBupdCSe7VXwIYzwu2pFDJLQK+BSF6Fp4ctfgX+EIybZQfDOSeLDg7tBV9FdJoa71EfvQgp2lMsJxNhUEoY3MZ+cbSnU14bUW3suZHLoai5Eo/UMui/1GKgWXE1IpHUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaIg2vgRJkUNARF3tfFcTa4SSvAWBZd5C0EPMzdLi6I=;
 b=Vk+2zYhBNRmZ8/iIB13nP7MvN/Od8fwYUvrWHQ992zaSFThSznKX1ZTwbTJa8HoT6ODzVrUtSOGYaDRc/YgJ1O2WDHRo/mqb381eSq2iuQsd5wvMumgxGUrgMAp3F/bufYqyAwOwhuYC7e+V6X/5N+0kKckFRlEqjbMrZ8oOCUc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	<bertrand.marquis@arm.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <michal.orzel@amd.com>, <roger.pau@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>
Subject: [PATCH v2 2/4] public: s/int/int32_t
Date: Wed, 10 Apr 2024 16:47:38 -0700
Message-ID: <20240410234740.994001-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|BL3PR12MB6644:EE_
X-MS-Office365-Filtering-Correlation-Id: 702328bc-c093-4e5c-ca80-08dc59b89dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h9Scw4j9GOPVcZg0lVjC4C1ncTKDm0fFAgXTSz1HYtVKG05QifkvYcSoI8/D0jA+SRGH9TQdi4gSn0ZYMFV7/FHfgYK6JovMaYuKVJQ7AlBN7c2237ii+1r+fVvziU529xasxISsLhM2j5vhLaAiuJjeLLFngnCUcNqMFRpHCRyRmQBuRjQ+XwIbYHeZHOVIMYPRUwkgfN8xzVQfSoZGvTNmP82/M8ImMPoOLNa9jR69hWhwwa6BsIjKM8ot0BNZPamBGrPHg06Zjv45ep52VbiH2E3VUgRZIFmTiFYoB5DMVHgxuF7zSsLxrh/YatB5Zj5Btn7EfzEGLqtsRZpm0V6BWldQ48Ugh3QsbNl2I1ab6TBY0HPciva4WkXW95LZhExSlFeRX0gQ77Jx1DsYuRC+sPly/h69XaFv/Xq+2wlQCPySWCu1yy1BuVzM1Uat9m/aDs2CGLLLnyeVNG480HPSQliDk7Wo8f8fbNFe+z24rK0+8bI8PBV+Le3jv5QsJXE2YHevr9SX0sgTTr3X+n9FzS/P/1XNAi7EJN1XlAVB/0Oq/TCP4N3xW75NLswRVbyBuyJyDGoh8z/KkM2SUdV3MJjKKEMUWG+e9gFd4MYd8bKAYBZ8qYWpFDqyksKq7SHsSaFCcYIg1fnQZ4KAdM4zJv3jEPUnsT+TbSlbRtFFWXw08wRucTXPu9sesm2ekDLmdLqVP1I1071ZGcyxGSZHS2zcl9r6SUzz/h/p80ZJJOIN8cpC/P0fSZiiNROb
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 23:47:43.5926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 702328bc-c093-4e5c-ca80-08dc59b89dd1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6644

Straightforward int -> int32_t and unsigned int -> uint32_t replacements
in public headers. No ABI or semantic changes intended.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- avoid changes to GUEST_HANDLEs for now (there was one GUEST_HANDLE
change in v1)
---
 xen/include/public/kexec.h   |  8 ++++----
 xen/include/public/memory.h  | 22 +++++++++++-----------
 xen/include/public/physdev.h | 18 +++++++++---------
 xen/include/public/sched.h   |  6 +++---
 xen/include/public/vcpu.h    |  2 +-
 5 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/xen/include/public/kexec.h b/xen/include/public/kexec.h
index 40d79e936b..8d2a0ef697 100644
--- a/xen/include/public/kexec.h
+++ b/xen/include/public/kexec.h
@@ -105,7 +105,7 @@ typedef struct xen_kexec_image {
  */
 #define KEXEC_CMD_kexec                 0
 typedef struct xen_kexec_exec {
-    int type;
+    int32_t type;
 } xen_kexec_exec_t;
 
 /*
@@ -116,7 +116,7 @@ typedef struct xen_kexec_exec {
 #define KEXEC_CMD_kexec_load_v1         1 /* obsolete since 0x00040400 */
 #define KEXEC_CMD_kexec_unload_v1       2 /* obsolete since 0x00040400 */
 typedef struct xen_kexec_load_v1 {
-    int type;
+    int32_t type;
     xen_kexec_image_t image;
 } xen_kexec_load_v1_t;
 
@@ -143,8 +143,8 @@ typedef struct xen_kexec_load_v1 {
  */
 #define KEXEC_CMD_kexec_get_range       3
 typedef struct xen_kexec_range {
-    int range;
-    int nr;
+    int32_t range;
+    int32_t nr;
     unsigned long size;
     unsigned long start;
 } xen_kexec_range_t;
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 5e545ae9a4..ae4a71268f 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -61,13 +61,13 @@ struct xen_memory_reservation {
 
     /* Number of extents, and size/alignment of each (2^extent_order pages). */
     xen_ulong_t    nr_extents;
-    unsigned int   extent_order;
+    uint32_t       extent_order;
 
 #if __XEN_INTERFACE_VERSION__ >= 0x00030209
     /* XENMEMF flags. */
-    unsigned int   mem_flags;
+    uint32_t       mem_flags;
 #else
-    unsigned int   address_bits;
+    uint32_t       address_bits;
 #endif
 
     /*
@@ -163,7 +163,7 @@ struct xen_machphys_mfn_list {
      * Size of the 'extent_start' array. Fewer entries will be filled if the
      * machphys table is smaller than max_extents * 2MB.
      */
-    unsigned int max_extents;
+    uint32_t max_extents;
 
     /*
      * Pointer to buffer to fill with list of extent starts. If there are
@@ -176,7 +176,7 @@ struct xen_machphys_mfn_list {
      * Number of extents written to the above array. This will be smaller
      * than 'max_extents' if the machphys table is smaller than max_e * 2MB.
      */
-    unsigned int nr_extents;
+    uint32_t nr_extents;
 };
 typedef struct xen_machphys_mfn_list xen_machphys_mfn_list_t;
 DEFINE_XEN_GUEST_HANDLE(xen_machphys_mfn_list_t);
@@ -232,7 +232,7 @@ struct xen_add_to_physmap {
     /* Number of pages to go through for gmfn_range */
     uint16_t    size;
 
-    unsigned int space; /* => enum phys_map_space */
+    uint32_t    space; /* => enum phys_map_space */
 
 #define XENMAPIDX_grant_table_status 0x80000000U
 
@@ -317,7 +317,7 @@ struct xen_memory_map {
      * return the number of entries which have been stored in
      * buffer.
      */
-    unsigned int nr_entries;
+    uint32_t nr_entries;
 
     /*
      * Entries in the buffer are in the same format as returned by the
@@ -591,7 +591,7 @@ struct xen_reserved_device_memory_map {
      * Gets set to the required number of entries when too low,
      * signaled by error code -ERANGE.
      */
-    unsigned int nr_entries;
+    uint32_t nr_entries;
     /* OUT */
     XEN_GUEST_HANDLE(xen_reserved_device_memory_t) buffer;
     /* IN */
@@ -711,9 +711,9 @@ struct xen_vnuma_topology_info {
     domid_t domid;
     uint16_t pad;
     /* IN/OUT */
-    unsigned int nr_vnodes;
-    unsigned int nr_vcpus;
-    unsigned int nr_vmemranges;
+    uint32_t nr_vnodes;
+    uint32_t nr_vcpus;
+    uint32_t nr_vmemranges;
     /* OUT */
     union {
         XEN_GUEST_HANDLE(uint) h;
diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
index f0c0d4727c..03ccf86618 100644
--- a/xen/include/public/physdev.h
+++ b/xen/include/public/physdev.h
@@ -142,17 +142,17 @@ DEFINE_XEN_GUEST_HANDLE(physdev_irq_t);
 struct physdev_map_pirq {
     domid_t domid;
     /* IN */
-    int type;
+    int32_t type;
     /* IN (ignored for ..._MULTI_MSI) */
-    int index;
+    int32_t index;
     /* IN or OUT */
-    int pirq;
+    int32_t pirq;
     /* IN - high 16 bits hold segment for ..._MSI_SEG and ..._MULTI_MSI */
-    int bus;
+    int32_t bus;
     /* IN */
-    int devfn;
+    int32_t devfn;
     /* IN (also OUT for ..._MULTI_MSI) */
-    int entry_nr;
+    int32_t entry_nr;
     /* IN */
     uint64_t table_base;
 };
@@ -163,7 +163,7 @@ DEFINE_XEN_GUEST_HANDLE(physdev_map_pirq_t);
 struct physdev_unmap_pirq {
     domid_t domid;
     /* IN */
-    int pirq;
+    int32_t pirq;
 };
 
 typedef struct physdev_unmap_pirq physdev_unmap_pirq_t;
@@ -224,7 +224,7 @@ DEFINE_XEN_GUEST_HANDLE(physdev_op_t);
 
 #define PHYSDEVOP_setup_gsi    21
 struct physdev_setup_gsi {
-    int gsi;
+    int32_t gsi;
     /* IN */
     uint8_t triggering;
     /* IN */
@@ -242,7 +242,7 @@ DEFINE_XEN_GUEST_HANDLE(physdev_setup_gsi_t);
 #define PHYSDEVOP_get_free_pirq    23
 struct physdev_get_free_pirq {
     /* IN */
-    int type;
+    int32_t type;
     /* OUT */
     uint32_t pirq;
 };
diff --git a/xen/include/public/sched.h b/xen/include/public/sched.h
index b4362c6a1d..57ac3df47b 100644
--- a/xen/include/public/sched.h
+++ b/xen/include/public/sched.h
@@ -116,14 +116,14 @@
 /* ` } */
 
 struct sched_shutdown {
-    unsigned int reason; /* SHUTDOWN_* => enum sched_shutdown_reason */
+    uint32_t reason; /* SHUTDOWN_* => enum sched_shutdown_reason */
 };
 typedef struct sched_shutdown sched_shutdown_t;
 DEFINE_XEN_GUEST_HANDLE(sched_shutdown_t);
 
 struct sched_poll {
     XEN_GUEST_HANDLE(evtchn_port_t) ports;
-    unsigned int nr_ports;
+    uint32_t nr_ports;
     uint64_t timeout;
 };
 typedef struct sched_poll sched_poll_t;
@@ -131,7 +131,7 @@ DEFINE_XEN_GUEST_HANDLE(sched_poll_t);
 
 struct sched_remote_shutdown {
     domid_t domain_id;         /* Remote domain ID */
-    unsigned int reason;       /* SHUTDOWN_* => enum sched_shutdown_reason */
+    uint32_t reason;           /* SHUTDOWN_* => enum sched_shutdown_reason */
 };
 typedef struct sched_remote_shutdown sched_remote_shutdown_t;
 DEFINE_XEN_GUEST_HANDLE(sched_remote_shutdown_t);
diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
index f7445ac0b0..2b8df2b0da 100644
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -63,7 +63,7 @@
 #define VCPUOP_get_runstate_info     4
 struct vcpu_runstate_info {
     /* VCPU's current state (RUNSTATE_*). */
-    int      state;
+    int32_t  state;
     /* When was current state entered (system time, ns)? */
     uint64_t state_entry_time;
     /*
-- 
2.25.1


