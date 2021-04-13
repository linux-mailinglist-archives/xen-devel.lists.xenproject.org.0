Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C817E35E0CC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109791.209605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcz-0005X5-J0; Tue, 13 Apr 2021 14:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109791.209605; Tue, 13 Apr 2021 14:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcz-0005WO-FQ; Tue, 13 Apr 2021 14:02:53 +0000
Received: by outflank-mailman (input) for mailman id 109791;
 Tue, 13 Apr 2021 14:02:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJcy-0005VP-88
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:02:52 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c4f8e8f-c4e2-46cc-88fb-18f4bbd2e007;
 Tue, 13 Apr 2021 14:02:51 +0000 (UTC)
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
X-Inumbo-ID: 4c4f8e8f-c4e2-46cc-88fb-18f4bbd2e007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=LlfT1DWe4NTaP55AtYF0ZPiSw7w08SLaktbWPptC3lk=;
  b=ReSNqZ82stdFrOIXSPvUnQk/Lm8rW2FEszCM1Z2M4ahUasIBASaDwzAy
   UppZHgK3t0hqLdJWPVJe9GKLOzIBWtAr/v0fSM/oCUF3QKaRp+3nksfoD
   vudgZiEZ2l3EcMlXaZdzE4VeQPlgXOnW+voEZ4n7UmM+0zICBe7YldIsl
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1jvGi0w09W/ulosaOf2u+LuUA9Un+Hj3/H7riKjtwACkTx69RrnJRy8JGt2HBoBDZw5B4zm8yi
 cndbThvbg3PmfINl05LA+y1Eb9tNiYDqYDS4f5fui1IdQEjRALmEOOJiNXtIglc53tG+ehiHU5
 CdTurR+xADd2YE2LeWFUh/cxCzqTm3n03n7rCYpWe7Ll8SA527NQRebCf/tIseZOM8nE6RRlJb
 Uc01aP4Xa64Y5JsN3We79LrznI/Su2XMVYN2MYOrp6q3mZaDznfL0CEMV61MHrE3DVuIWxyPHR
 2Wo=
X-SBRS: 5.2
X-MesageID: 41476493
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:HljoC6qrjcCs8YOYIWVgQ9UaV5vxL9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LRy5pQcOqrnYRn+tAKTXeRfxKbB4xmlIS3x8eZByb
 xtGpIVNPTcBUV35PyU3CCWCNAlqePozImNpcPzi0hgVhtrbaYI1XYaNi++HldtTAdLQboVfa
 D92uN9qzCteWsaY62AbxFoY8H5q8DWj5WjWBYaBnccgzWmty+i67LxDnGjr3Qjeg5IqI1CzU
 H11zbXy4/mmPG9xx/a2Qbonu5rseqk8PRvLoihjsAULx/llwqnYp9wMofywQwdkaWUx3sB1P
 XKvhc8L+R/gkmhAl2dkF/W9CTLlBYo9nP4xleTjRLY0LPEbQN/MeVtr8Z9UHLimi4dleA56o
 1n9SalkqASKhX6kCH097HzJmlXv3vxm1UOu6oulXBFOLFuD4N5nMgk025+NowPJy7+4JBPKp
 gUMOjsoMxbdl6XdBnizw9S6e3pWnwyGyGPSVQZtvqU1CBLnGt4w1Fw/r1noks9
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41476493"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jc/rg7PTxVuMryOpNfOnTx6MKW5xHEACJNAVjF7sUjJaKMViygvNw6LTsl/q+OFX0xFJ9CWl+2dvSI7PPI4sfblY8fUuSQZVKhddNs0mwyexDL1iM6tnHCtYTTfx1XaEApEppKFATeICGQearybm7VMma+yNqrsUaVqDnh3lwiz0fci0zhhN4A6bLAWiCaDh1YW38GZ4ylZoG0X+0GBNZZ8BP6n8zWADjMWq0O2m4jSJFx8A8AOc5DIVvzFUF+6TjfM4VabLLX4wiDYb6y3zDTsWCGCYi8JkaX91+3bYC/Is3S/v8jTrBTysy6r5f9hV4+Q2mNvMmyqt4bME0yXXZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3gNWM7lFDWsx1HrL86tq3Osjyogq5McpScOb4qDlhk=;
 b=fr7mU9a7uC95iKDbvQjRtR/mP95CAIUjOP2ULWOF9cx2rn5h/mF3vqSvtZpFU4qzmYBFN7e7somKfkJwM66F0jTgVh35eHQryV0vt5Hy5jIn8pL5IB30Ro4TIzEbadkQGbXSfoIqoUefQZX7Sl5BWWvNkl48GEzPR1fqQm+DZsUK7kZ2bXymTbeBBSy1ivmYjAT2unLYdc/uMmFH0cc9ITZlzW+b7r3aYctxtQn2Qsy0Wpv+nkWcS+cmJ4G3NiQ8SmO6BqLdZnEHkBweaIRGKf1joLU3LsppzIvaVziZHf9hdlhZdlqxJdjEi3cUwCtkeQEHjlyGxPpIpdcupUo9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3gNWM7lFDWsx1HrL86tq3Osjyogq5McpScOb4qDlhk=;
 b=ajx0fmlhrLENhLz3hLRHQAHuvTX7t5N2/8xz7FJWr0ORxd273ujV1RWmRn9uqfdIYjVQwzm9jXPE29H8mRq/iiOzQNsTZMetsjOOKfV7JgnhvP/eB5w+wDGYcxn7Ywzk/u8v1DG7DvQeF6/gmiWhjxA+6nh/qufHcnZ3Mia9HgY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 09/21] libs/guest: allow fetching a specific CPUID leaf from a cpu policy
Date: Tue, 13 Apr 2021 16:01:27 +0200
Message-ID: <20210413140140.73690-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d2b021c-64b8-4464-8754-08d8fe84d0d3
X-MS-TrafficTypeDiagnostic: DM5PR03MB2553:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB25532E47D27E9317EDE2FF388F4F9@DM5PR03MB2553.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eUH13AqT7QdOPGOu+ebdMZelBXnIr19GCdgIiy8xEPia6uGTpuG43d01pFF3L2o4UauhteEqou+ETAuTZ3rZQS5WXgAF+ovKM/H1QqFqueCjcpw6yHr25Xcu/nSu+nazPHO7DfaPJHtadsgFo/xHxw4wWO/UZSLAJylgh3vnKyNG8ZAa9ucoDrnKphQ5RbkqQcSiwLOse5l9c8xORgvjNwfn+NAQ8CGxe26t8k/fw2VmXPJZUSJEaUAelCNPDpOEVIeY52JYaRpnilKh4OMCDeAZgJJelubwSvbqCil0dXyOHDE4y3d+5lyvrKmbD37UcT6+qZwnsCNvHbTHMQSf3BdPKi6KxqYLsuXt0AezRwqvMh1TpZ4lhLN0JO9lvKK9CkfZSRoBRT8nB76suM2R4jHyrgLjeXr6r3V4qRpIWHIDni4kLqDaJcnCf28M0Y+dLEievCnYhoINDbE7zCT4TxBMbWlSIyyo30/IUOFq5D8BrQubDYOdPlUWvuxzEnCxIwxUNMVohnV+AS2SHvftNbsVSyrWKOAPFcTVOp1gpYelalG8scwxh00I+rKsjJB0qPZRz+fpA7kskE8sPBhPNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(8936002)(6496006)(186003)(83380400001)(38100700002)(2906002)(66476007)(86362001)(956004)(2616005)(8676002)(478600001)(66556008)(66946007)(6666004)(6486002)(16526019)(316002)(6916009)(36756003)(54906003)(1076003)(5660300002)(4326008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TnFzQVFpSXg3L3lHUUlRcmdkeXQySVFFN2xGOXE0SlhNWEpvUDRXazJlKzlH?=
 =?utf-8?B?U2dOVUpHVnVua0ZtQ0IyVFNtQ25PTXZybGJWZFJKU01LajVIeVR5UmJIMEk5?=
 =?utf-8?B?blBpZ1BYVFpHN3VaZGh5S0h3VEptd2hwL2tnL2FDTTh0Zm1OY3Q3ZTloT1lW?=
 =?utf-8?B?OTcyUjJNeHI5cGpYcjNKckVGSGJuS3I4Mk5pSWZxRFY4WTF5RU5jQkdFZmt6?=
 =?utf-8?B?bFU4YS80bU9GZEtuZ3pBZ2xXbmpyYU9FeSt4b1ZhdUVLOXZ3Y0hzcndpTTVz?=
 =?utf-8?B?VFl3ZWpIVGNWdWlPTGN6ZmpCWWdEN0Rkd1prRXQzSzdJNG1saW5kT2ZqT0ll?=
 =?utf-8?B?Rm8wSDlZN0pKWC9WVHJzSEFZUnBJNDNkZUtDeVlxVm1teHdscEFVSkxjUFYx?=
 =?utf-8?B?ejlJeWg0ajRJcStKbU1ZQVdhUzZXT2lLOEhKMm5kT0R1czVERERTQm9qbDkz?=
 =?utf-8?B?azNuZXc1Vy9vYTFoa3Nwa1BvRFJ4VmRocGIzdWFibFRQbnZxK2dYb3lwektY?=
 =?utf-8?B?WG1uNFphbS95MzNFblp1Snc3dXRBeEtwK2o1UE1LQ29PL0pqbUdtelU3RjY0?=
 =?utf-8?B?NHpXZjI1Z1hpMHFwRTV4Qk5nQ3kxZVcyeWd6aUZjRzJMNDJLR1cvanlRWXJM?=
 =?utf-8?B?cjR3alozMkRBSDBhcHd0ZDhYQml3OGZNZTJYcVdYV0Q0S05SZFEzbFEydmhM?=
 =?utf-8?B?YjFOUGRxUXRmUG12Ti95Q1hBck5YQWZ2K05KUEt0UlpYajBVb1NtK0toMDR2?=
 =?utf-8?B?RFJnZDM5RUM2ZW1yNUZMTklrekRUaXVzYkU2aUtmYmNXL2lLMUFYaXIwc0Rp?=
 =?utf-8?B?R0lReWlGd0lMdktzbWd3Q253b2FuQXlpdDZEVWxvSFplUVFCMTBEYjBwQ0pC?=
 =?utf-8?B?U0hQS0VLNExoOHEwRFFUWWlCejQyV3pHZWJ6ZitCazlwRnJzQzBaTW52U1NT?=
 =?utf-8?B?elR6SWI0c1Y0L0JVSmpTcWs0NFhmdFlLNDJ6bzlPSUlyMklxbjZ3emlLZTd6?=
 =?utf-8?B?czVnU2dwVGJHamgwWDJzR1V0eTl6aFVXdisyUktwYXpDSE9WdER0SW1lVElT?=
 =?utf-8?B?dTRHVDZiTGptSzJwOTdDN01tNnFuYmhTUnoyWVdSb1YzNzhibVV3T0o3RVJy?=
 =?utf-8?B?UFBQL0JIT1B5emk5aTFOV3k0UWJ0akpvaGFIVU0xUFRZeS9DZmp6alNISURj?=
 =?utf-8?B?bkp5NFBxVWJPWDVjcFpZMFpXYUk1YlZhWkFDYzV6cFYwbmMrTVZDd2FBRUxT?=
 =?utf-8?B?TGd2RElkQTROVmhsbFVIVkNqU0VPaUFLdG41OHJ3NHVrV2JPMFNVbGlKTlIv?=
 =?utf-8?B?SzF0VE00SWVoakNtUkV0Qy84VW05bytMbVdIZEtVSXVrLzBVOHhSMU9vWTlq?=
 =?utf-8?B?b1MvcVB6NXp6dGRVMG5MMzdIVUhwRm9CR1I3ekxEajRpMFpybTFkc1UrRVpx?=
 =?utf-8?B?Zk9URUN1bVorUkNRMkxPdFZrZmgraFpqaHpvL2FxOVV3VG9uOWhPcDB5MW5X?=
 =?utf-8?B?WG9uWENXclI0bHYrVWpBait0YUYxdXhZVFZUeE9xME4rOU1SSXg5cFlYUWN0?=
 =?utf-8?B?ckZLWEdmZlRpU251eGNvYmk4TVVxaEN1dkp1dG9aclZ3aW51QzlvUS9GSkxz?=
 =?utf-8?B?c3B0aTRmZ0xEaWlGTEJrQVFRSVNRNHRkNmVrZERyWlZEMzZDS2JIMHF2dTZp?=
 =?utf-8?B?YmcvVmo1R05Qa0VQNWVSTit6SGIvRUdLZW4rbEVRYktidURTY0llc040aGlx?=
 =?utf-8?Q?AqyvNGZR8sp4qYp4n/nvnXFMN4MO+XP2zon8V+b?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2b021c-64b8-4464-8754-08d8fe84d0d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:02:46.7732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1osmuPCmby5rrRI2DCxLFzboJ1+tLtDJfUTGOjHYNXo0FM3GBvPsp1JClQZir5IxPJJp9PP59r3vy3D2xPXaKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2553
X-OriginatorOrg: citrix.com

Introduce an interface that returns a specific leaf/subleaf from a cpu
policy in xen_cpuid_leaf_t format.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Note that callers of find_leaf need to be slightly adjusted to use the
new helper parameters.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use find leaf.
---
 tools/include/xenctrl.h         |  3 +++
 tools/libs/guest/xg_cpuid_x86.c | 38 ++++++++++++++++++++++++++++-----
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 27cec1b93ff..cbca7209e34 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2608,6 +2608,9 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
 int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t policy,
                             xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
                             xen_msr_entry_t *msrs, uint32_t *nr_msrs);
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 8b48c51a8ee..d146c5bbc99 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -280,9 +280,9 @@ static int compare_leaves(const void *l, const void *r)
 
 static xen_cpuid_leaf_t *find_leaf(
     xen_cpuid_leaf_t *leaves, unsigned int nr_leaves,
-    const struct xc_xend_cpuid *xend)
+    unsigned int leaf, unsigned int subleaf)
 {
-    const xen_cpuid_leaf_t key = { xend->leaf, xend->subleaf };
+    const xen_cpuid_leaf_t key = { leaf, subleaf };
 
     return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
 }
@@ -365,9 +365,12 @@ static int xc_cpuid_xend_policy(
     rc = -EINVAL;
     for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
     {
-        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
-        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def, xend);
-        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
+        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur,
+                                               xend->leaf, xend->subleaf);
+        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def,
+                                                     xend->leaf, xend->subleaf);
+        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend->leaf,
+                                                      xend->subleaf);
 
         if ( cur_leaf == NULL || def_leaf == NULL || host_leaf == NULL )
         {
@@ -817,3 +820,28 @@ int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t p,
     errno = 0;
     return 0;
 }
+
+int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
+                            uint32_t leaf, uint32_t subleaf,
+                            xen_cpuid_leaf_t *out)
+{
+    unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
+    xen_cpuid_leaf_t *tmp;
+    int rc;
+
+    rc = xc_cpu_policy_serialise(xch, policy, policy->leaves, &nr_leaves,
+                                 NULL, 0);
+    if ( rc )
+        return rc;
+
+    tmp = find_leaf(policy->leaves, nr_leaves, leaf, subleaf);
+    if ( !tmp )
+    {
+        /* Unable to find a matching leaf. */
+        errno = ENOENT;
+        return -1;
+    }
+
+    *out = *tmp;
+    return 0;
+}
-- 
2.30.1


