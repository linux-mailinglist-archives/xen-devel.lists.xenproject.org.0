Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA82CAE29BF
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 17:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021615.1397572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSztH-0003Dn-3X; Sat, 21 Jun 2025 15:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021615.1397572; Sat, 21 Jun 2025 15:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSztG-0003AM-W8; Sat, 21 Jun 2025 15:12:22 +0000
Received: by outflank-mailman (input) for mailman id 1021615;
 Sat, 21 Jun 2025 15:12:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3VJ=ZE=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uSztF-0002Hn-Pp
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 15:12:21 +0000
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c406::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20735cc8-4eb2-11f0-a30e-13f23c93f187;
 Sat, 21 Jun 2025 17:12:20 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYWP286MB3033.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Sat, 21 Jun
 2025 15:12:13 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8857.022; Sat, 21 Jun 2025
 15:12:13 +0000
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
X-Inumbo-ID: 20735cc8-4eb2-11f0-a30e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hpAygUs7+ALrwr/3UVsCwCPNBGUJ4eXZsw1vN2YEwBE7w/exvCP8+nC9NymKaS1NUYAKyrKlOyLgWkt+QLgVx+7i99nQD/ws2hfdIuJFGQJdInmaiJbl/hO4LfFUKdOq3KUFIo0BtvYR7VRiTiA2Ajz0YMPZddwB6qk5vfoVekcqdiSdtMeXFa0Z6sD4byIfProlhmLehazGieyN6vz8wXm5lhWjanJKu3hPRyW9wq9BGYWHxmIYeBTHh/JFb4B/ACIypBAkHDImUTLVLm6qOSYkF+GjgNA1BpECyGG5wIp8OqsexigraPZ6KoMN/lA1OpytZIxsWKBGuylUn1dpjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kqMEJ798ZMvRUHDoDgvFJRcUZEDqjdXngUvsN8djbY=;
 b=tXeJWrJxttA0g6ALNuSOmLwicLMFL+oSPVL3cJD7JPk9siCKQxu7KFwRzQEkUPSZWhiF7/Zorojcsy7bzFNdcN2nejXa6Ylfj1cEJ71tQbyeCu8wcL/WaR+BPZkbsAGCcnwQ+kT3B3MTsBXRxdEnyv+C8T3G75xVEO3ZSTtH+FKMva2w5/Q12CZZogkfym3wJDiXycVD8lfbR/oAOAtTaisRme6/9dUYnUikbtzekWJtmA/5CnlGcp96AdLr130Q1Z5OyEajmWPvJlDk2hQdLix366m6ybmE09aw3USJMFz8PFNyNDHmb/fH2ZbQ59plAkkCWpAs2mkx4DctkAaATw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kqMEJ798ZMvRUHDoDgvFJRcUZEDqjdXngUvsN8djbY=;
 b=Q3RdmJGLQybMX6+xAn6vcXM1aO7eveUs1MFdkqVUx5P3u32u57meBZt9pVnDRffR6yad+kSoBoI1MmP5K9tqtKgavjykZL5hEgbQrcH/QXDnI0YR3NTTF0bxrKXWMRoSlKW/+S2ANVd3j0hky9qbjT+6kUOgN/RU6NbBvmjzSCk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Koichiro Den <den@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 4/4] xen/arm: Implement standard PV time interface as per ARM DEN 0057A
Date: Sun, 22 Jun 2025 00:12:01 +0900
Message-ID: <20250621151201.896719-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250621151201.896719-1-den@valinux.co.jp>
References: <20250621151201.896719-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::15) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYWP286MB3033:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a938403-aad8-4871-d792-08ddb0d6003f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vzkc4W1n96iPSPmHu0T2IBfGCd/cfo4Cox3ZYy9nAdwQG6Ajls9zkR00SLV3?=
 =?us-ascii?Q?0CjjZuGH6fApLi1B1vJH+bsBnVXkDQjeA2QEdTSirIXednBD4ricOUyoFwWV?=
 =?us-ascii?Q?+DIidno53tZbaTI4A5YIHOLGln7Gbj2ZBiAJmF2w6USjpAuM5Sfa3FdPoGLF?=
 =?us-ascii?Q?BBiYgPC/Y7V3iqvHoNFXnx22DojRIXNZoHBHpY6/44qWBtNBji4u80i9lo0n?=
 =?us-ascii?Q?hd27QTZAaggjzW1aeRmkIHI9TzFhLz3UNE7MBfkSePijsVh/repLhGRI++4z?=
 =?us-ascii?Q?Ya2PvJiR3UTrCdygXEhSA95Y3ysRpTazHfIv5KkMSAIEoIxXmzwhX7TsZITY?=
 =?us-ascii?Q?7d0qS2yGE4DvQVM3jmSHbYokHx9o1THKYAbSjXKCDyw8Q5L9nxQY59a5awbA?=
 =?us-ascii?Q?CiPwRaRJaIYoNtHlBHMl4buFhmjy7EVdVYaRolS8d6TSGjHvP+Hta+1DipQW?=
 =?us-ascii?Q?RPPmTaOLispxkZroOqi5uMowsh9yzMOPNEg6CB3kC6oZVOwY4eSeiH6mpaGi?=
 =?us-ascii?Q?l+Ha4XZUqfhb+RTYKi47k5iKbYNGvFpA3rTehhR2vWSzRemm8+WOtdVGYEJh?=
 =?us-ascii?Q?/GA4L3rYEnwW87DFJZM9J8+QyaY72J0xhdfJMvezeZTqGsC29Uf2r3hvboZJ?=
 =?us-ascii?Q?safUSJT+ogaXqQb1l6yIGCFMbDqKVIEC/MMcnEPksvZPFfQXn3l1Xo0mDhAb?=
 =?us-ascii?Q?fYVBXRTOTILX2IL6TpjAeoC94f+/b5kyyufpwf8+vbrbw0eRRN89LXzaQeRt?=
 =?us-ascii?Q?cnqCXyu2t25gwfZOwCzGyNnDKx3/P0dtsm5jWi7OonByoWmBMpxmEIem9hgv?=
 =?us-ascii?Q?lKP5rl42ogwfKB2IdG0PKf0s+tvZLigPIZVzQMcCaH1XeiWDfIsT6w9rdnfI?=
 =?us-ascii?Q?ZO01Hr8oTAHXd0smL09IEgat+2EUjf0tSn0vCS8MxIW/XsPdR4CXn95rSHTc?=
 =?us-ascii?Q?X8n5XYwIXuw0UdpWbws9ulbVoX035QlrvgwLRCWayWj2jbFfA9U1xoQazn1m?=
 =?us-ascii?Q?OYx3QoGCaLGkyV0r4HtAcq9Uxws/xR8vUvjnL8NVUibOsoJln0olBgqLD44m?=
 =?us-ascii?Q?2C178zvfFHvL8vVPUm5wid2/Y/IvB3kzy0WuIBBF3yLI0hUIWUvkH4jt739M?=
 =?us-ascii?Q?SwSFkQcIva1ZMMhbArOb2i0XTT7MYvIVv0Smr7phsVLEdyAJd5gm4oqf2jQa?=
 =?us-ascii?Q?2IqxNapxqynJ2/P939FTyGnzxQl+yKO0+183nUJCuieM+IoBJP+9TMGApKah?=
 =?us-ascii?Q?ADKjALR48v6VvZpIegHvTHCJyDdmkwjkoozml31Km3Rji4bP3oE+UV5NCNBH?=
 =?us-ascii?Q?f9xXNzGwF0fHEnuV2BmlB9A0MkbdhPp6TJym9VTySGLN7Ok/gvk3qStX/cKj?=
 =?us-ascii?Q?rWCW2+j6c3ej4E48PknNgN8hF2+uXHkbonbfQ1vWR50dUHCLaGrr3jzy1zQr?=
 =?us-ascii?Q?tGgCc4E7rTs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nyhrxn+omUJIBGCn0LCJcB6g1l5JhYeMgDTj82wkOhdzmAm3VTfmGgEMlD85?=
 =?us-ascii?Q?Gu559R5MJUgWZfqHMz7kRQZeL/iX4MyuNx1YHU2rejLmLrH2YZuUYh7N84NI?=
 =?us-ascii?Q?ICyI6XFmiq3WaRxjWuWqWxGcRnjvR+BGJz8DNrGj3qZhFRPdsZNBGkvwZM6o?=
 =?us-ascii?Q?2p5xzEp7sn4srXs5H+z/KQVuEDuMK1jGFU51uSNeN2NUkp3tKPxuLZnB7+4P?=
 =?us-ascii?Q?UXJxcguTIl6loGMXnoN8F8KH3wbZl4z9Mcf6sxcc1X+OlkY2JH2Dntthk8VZ?=
 =?us-ascii?Q?8f9UB5k1DHUNFv3v2QEHTPXQexgac3nBByrok67Lk4Tl9mrn0DjBBVKeBgWp?=
 =?us-ascii?Q?q9Vlccxmncq/tYOJ0n0ehiLwKfOc4Sc8yvDey1VG6hioxD/OsGdzG96cUTdk?=
 =?us-ascii?Q?SXtgMIDZCfBfO6ha20CcfcpIGPVmx4Av74P/+sPUr1uLG+ZMgc6+4OjAj/nh?=
 =?us-ascii?Q?izhaU04Y1wyxNdA3dTDEhinDBy4jDMAQaIraVKjNDNQWI3Y/kI45tejjX8L8?=
 =?us-ascii?Q?NGMtglhmK3H0BA52YQ41TMitIrMqzmJn2MmWI4B2nlypm9jGnre+IrKc/kZt?=
 =?us-ascii?Q?tbkTewLSlbwOjKxos4KwNLeZngpGzAm4EPjquid1LKPjDzLyBOcKlUWOylF9?=
 =?us-ascii?Q?FUQ18SwNRFi0ZKqIPkyBRmb9oIMMGum+F8IehxEiMP5OC+o9zb3tWfka+Eki?=
 =?us-ascii?Q?NOIyr/mDEZKJ4QIl63V1iP+kCyKEoegqvEKOvn036Y/pUSP1YOEPKzvHG/fL?=
 =?us-ascii?Q?2AWwWt8rBLZOAFqdHnD+CjaKmVAIedp79akXCzW/SHPE5Hg06Ep9GfPqfIRm?=
 =?us-ascii?Q?57pG/wVdzfLSfg40fAX3mZec2uu0muIgJ9GlDQfJFzjS3I8OjB5C8GwDsnRW?=
 =?us-ascii?Q?poBzf+8TIvISUwtJY2DEeNFg0CvvW25ZvI+VZXE2Rtsvq1UtKFkMgdchgZ+T?=
 =?us-ascii?Q?hVqz0btYch78HKG5MJ9b5I6lLhCRnOQ9A0anldqGbJGMlT7mjsDm64rhojEv?=
 =?us-ascii?Q?fye1M/n43eBo8U1lKNZHkeAuYcVYG61xC6HetjVWB69fANMJX3gPlNPkan3i?=
 =?us-ascii?Q?oYTDg/yaTqsF+yXMB9KeDUWWrd+Lp6ozKUHIwXyzM8vulGLLBk4mv2RV+S+z?=
 =?us-ascii?Q?tt8WTvSugaORYmTq9xu8+gMAR5/+t2vGMpHxXN8dlfE0mkBvl49/+lHw1G3P?=
 =?us-ascii?Q?Bjqu1gUUlg6uzs4Zkb9pmPoNH5CW6I1X+aZQZ+WwHnppu/Oxxj4Z2Ff0DOgk?=
 =?us-ascii?Q?KvyigeMTjK+gwT57+dAtuPwJXOMUpOThRSGbJ9O3GIdKKQB2KSvWorCo4K2t?=
 =?us-ascii?Q?oTCcmA4qOEldlkrBnoi5ERBI3Bn5UcBVQ1uEeJ2UZ7KzXGm/zkroDL5wgceZ?=
 =?us-ascii?Q?TI7BdAHn4Uyajrs6HsYxXWmwIyAVZUhM9knqLJwqEy3VLMfXA7g5P5+JwTuP?=
 =?us-ascii?Q?boSnsOVWhdjdQwhr4W0/+ZFte3l2DFb2UvjQd31IeF265LaQkSfr/X9L/E5X?=
 =?us-ascii?Q?iLLW7vgHrmqzuqeYxz+ETmoB+IQK347G4YcLBOIqbRxh/8IPQMncWhPPAGNd?=
 =?us-ascii?Q?hWY/j1ezCt1DvxxOR818xIXAq7USTwOsfTi4kpogpIeygO3jzeATTaewIc/q?=
 =?us-ascii?Q?NsHM3jZ/S5inhTFEDZ+WfkY=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a938403-aad8-4871-d792-08ddb0d6003f
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 15:12:13.1167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlRNmv7RDB/9eGjQGmVsGBFhPWgD72etZyodBWuhDBJQx4a1+Ikdl+KXUuctf6kgEFGSDuggaHyW+Hiq2YXA+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3033

The VCPUOP_register_runstate_memory_area hypercall is still actively
used, e.g., in the Linux arm64 codebase. When KPTI is enabled, the area
was not registered from the beginning due to the VA not always being
valid. In such cases, Linux falls back to using the standard PV time
interface (ARM DEN 0057A), but this interface has not been implemented
in Xen for ARM64 (until this commit).

The VCPUOP_register_runstate_phys_area was introduced, though it's
unclear whether this would be used in Linux arm64 and when it will be
prevalent amongst every possible downstream domain Linux variant. And of
course Linux is not an only option for the Xen arm64 domains.

Therefore, implementing the standard way of sharing PV time is
generically beneficial, avoiding reliance on specially crafted
hypercalls, the usage of which by guest VMs is not always guaranteed.
Note that the PV_TIME_ST interface communicates with IPA (GPA), not GVA.

Add the PV time interface according to ARM DEN 0057A.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/domain.c                   | 30 +++++++++
 xen/arch/arm/domain_build.c             | 87 ++++++++++++++++++++++++-
 xen/arch/arm/include/asm/domain.h       | 17 +++++
 xen/arch/arm/include/asm/smccc.h        | 12 ++++
 xen/arch/arm/vsmc.c                     | 38 +++++++++++
 xen/common/device-tree/dom0less-build.c |  2 +-
 xen/include/xen/fdt-domain-build.h      |  2 +-
 7 files changed, 183 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index be58a23dd725..e895e4111f1b 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -277,6 +277,18 @@ static void ctxt_switch_to(struct vcpu *n)
     WRITE_SYSREG(n->arch.mdcr_el2, MDCR_EL2);
 }
 
+static void update_stolen_time(struct vcpu *n)
+{
+    uint64_t tot_stolen;
+
+    if ( is_idle_vcpu(current) )
+        return;
+
+    tot_stolen = n->runstate.time[RUNSTATE_runnable] +
+                 n->runstate.time[RUNSTATE_offline];
+    write_atomic(&n->arch.pv_time_region->stolen_time, tot_stolen);
+}
+
 static void schedule_tail(struct vcpu *prev)
 {
     ASSERT(prev != current);
@@ -291,6 +303,8 @@ static void schedule_tail(struct vcpu *prev)
 
     update_runstate_area(current);
 
+    update_stolen_time(current);
+
     /* Ensure that the vcpu has an up-to-date time base. */
     update_vcpu_system_time(current);
 }
@@ -586,6 +600,8 @@ int arch_vcpu_create(struct vcpu *v)
     if ( get_ssbd_state() == ARM_SSBD_RUNTIME )
         v->arch.cpu_info->flags |= CPUINFO_WORKAROUND_2_FLAG;
 
+    v->arch.pv_time_region = &v->domain->arch.pv_time_regions[v->vcpu_id];
+
     return rc;
 
 fail:
@@ -707,6 +723,7 @@ int arch_domain_create(struct domain *d,
                        unsigned int flags)
 {
     unsigned int count = 0;
+    int order;
     int rc;
 
     BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
@@ -791,6 +808,19 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl = config->arch.sve_vl;
 #endif
 
+    /*
+     * Preallocate the stolen time shared memory regions for all the
+     * possible vCPUs.
+     */
+    order = get_order_from_bytes(d->max_vcpus * sizeof(struct pv_time_region));
+    d->arch.pv_time_regions_gfn = INVALID_GFN;
+    d->arch.pv_time_regions = alloc_xenheap_pages(order, 0);
+    if ( !d->arch.pv_time_regions ) {
+        rc = -ENOMEM;
+        goto fail;
+    }
+    memset(d->arch.pv_time_regions, 0, PAGE_SIZE << order);
+
     return 0;
 
 fail:
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 85b6909e2b0e..1c51b53d9c6b 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1561,8 +1561,80 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     return res;
 }
 
-int __init make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
-                                 int sizecells)
+int __init make_pv_time_resv_memory_node(struct domain *d,
+                                         const struct kernel_info *kinfo,
+                                         int addrcells, int sizecells)
+{
+    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
+    unsigned int len = (addrcells + sizecells) * sizeof(__be32);
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    struct membanks *unused_banks = NULL;
+    void *fdt = kinfo->fdt;
+    unsigned regions_len;
+    gfn_t pv_time_gfn;
+    mfn_t pv_time_mfn;
+    paddr_t aligned;
+    paddr_t avail;
+    __be32 *cells;
+    int res;
+    int i;
+
+    /* Find unused regions */
+    regions_len = PAGE_ALIGN(d->max_vcpus * 64);
+    unused_banks = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
+    if ( !unused_banks )
+        return -ENOMEM;
+
+    res = find_unused_regions(d, kinfo, unused_banks);
+    if ( res ) {
+        printk(XENLOG_WARNING "%pd: failed to find unused regions\n", d);
+        goto fail;
+    }
+    for ( i = 0; i < unused_banks->nr_banks; i++ ) {
+        const struct membank *bank = &unused_banks->bank[i];
+        aligned = PAGE_ALIGN(bank->start);
+        avail = bank->size - (aligned - bank->start);
+        if ( avail >= regions_len )
+            break;
+    }
+    if ( i == unused_banks->nr_banks ) {
+        res = -ENOSPC;
+        goto fail;
+    }
+
+    /* Insert P2M entry */
+    pv_time_mfn = virt_to_mfn(d->arch.pv_time_regions);
+    pv_time_gfn = gaddr_to_gfn(aligned);
+    p2m_write_lock(p2m);
+    res = p2m_set_entry(p2m, pv_time_gfn, regions_len / PAGE_SIZE,
+                        pv_time_mfn, p2m_ram_rw, p2m_access_r);
+    p2m_write_unlock(p2m);
+    if ( res ) {
+        printk(XENLOG_WARNING "%pd: failed to set P2M entry for PV_TIME\n", d);
+        goto fail;
+    }
+    d->arch.pv_time_regions_gfn = pv_time_gfn;
+
+    /* Reserve the selected GFN */
+    res = domain_fdt_begin_node(fdt, "pv-time", gfn_x(pv_time_gfn));
+    if ( res )
+        goto fail;
+
+    cells = reg;
+    dt_child_set_range(&cells, addrcells, sizecells, gfn_x(pv_time_gfn), regions_len);
+    res = fdt_property(fdt, "reg", reg, len);
+    if ( res )
+        goto fail;
+
+    res = fdt_end_node(fdt);
+
+  fail:
+    xfree(unused_banks);
+    return res;
+}
+
+int __init make_resv_memory_node(struct domain *d, const struct kernel_info *kinfo,
+                                 int addrcells, int sizecells)
 {
     const struct membanks *mem = kernel_info_get_shm_mem_const(kinfo);
     void *fdt = kinfo->fdt;
@@ -1596,6 +1668,10 @@ int __init make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
     if ( res )
         return res;
 
+    res = make_pv_time_resv_memory_node(d, kinfo, addrcells, sizecells);
+    if ( res )
+        return res;
+
     res = fdt_end_node(fdt);
 
     return res;
@@ -1744,6 +1820,11 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                                         dt_n_size_cells(node));
         if ( res )
             return res;
+
+        res = make_pv_time_resv_memory_node(d, kinfo, dt_n_addr_cells(node),
+                                            dt_n_size_cells(node));
+        if ( res )
+            return res;
     }
 
     for ( child = node->child; child != NULL; child = child->sibling )
@@ -1791,7 +1872,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
 
         if ( !res_mem_node_found )
         {
-            res = make_resv_memory_node(kinfo, addrcells, sizecells);
+            res = make_resv_memory_node(d, kinfo, addrcells, sizecells);
             if ( res )
                 return res;
         }
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index a3487ca71303..c231c45fe40f 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -59,6 +59,18 @@ struct paging_domain {
     unsigned long p2m_total_pages;
 };
 
+/* Stolen time shared memory region (ARM DEN 0057A.b) */
+struct pv_time_region {
+    /* This field must be 0 as per ARM DEN 0057A.b */
+    uint32_t revision;
+
+    /* This field must be 0 as per ARM DEN 0057A.b */
+    uint32_t attribute;
+
+    /* Total stolen time in nanoseconds */
+    uint64_t stolen_time;
+} __aligned(64);
+
 struct arch_domain
 {
 #ifdef CONFIG_ARM_64
@@ -121,6 +133,9 @@ struct arch_domain
     void *tee;
 #endif
 
+    struct pv_time_region *pv_time_regions;
+    gfn_t pv_time_regions_gfn;
+
 }  __cacheline_aligned;
 
 struct arch_vcpu
@@ -243,6 +258,8 @@ struct arch_vcpu
      */
     bool need_flush_to_ram;
 
+    struct pv_time_region *pv_time_region;
+
 }  __cacheline_aligned;
 
 void vcpu_show_registers(struct vcpu *v);
diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index a289c48b7ffd..6207ac74b715 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -380,6 +380,18 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
                        ARM_SMCCC_OWNER_ARCH,        \
                        0x3FFF)
 
+#define ARM_SMCCC_HYP_PV_TIME_FEATURES              \
+    ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,         \
+                       ARM_SMCCC_CONV_64,           \
+                       ARM_SMCCC_OWNER_HYPERVISOR,  \
+                       0x20)
+
+#define ARM_SMCCC_HYP_PV_TIME_ST                    \
+    ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,         \
+                       ARM_SMCCC_CONV_64,           \
+                       ARM_SMCCC_OWNER_HYPERVISOR,  \
+                       0x21)
+
 /* SMCCC error codes */
 #define ARM_SMCCC_NOT_REQUIRED          (-2)
 #define ARM_SMCCC_ERR_UNKNOWN_FUNCTION  (-1)
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 6081f14ed0c1..1e2fbc1a62b4 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -12,6 +12,7 @@
 #include <public/arch-arm/smccc.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
+#include <asm/domain.h>
 #include <asm/monitor.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
@@ -127,6 +128,10 @@ static bool handle_arch(struct cpu_user_regs *regs)
             if ( cpus_have_cap(ARM_WORKAROUND_BHB_SMCC_3) )
                 ret = ARM_SMCCC_SUCCESS;
             break;
+        case ARM_SMCCC_HYP_PV_TIME_FEATURES:
+            if ( !gfn_eq(current->domain->arch.pv_time_regions_gfn, INVALID_GFN) )
+                ret = ARM_SMCCC_SUCCESS;
+            break;
         }
 
         set_user_reg(regs, 0, ret);
@@ -162,6 +167,35 @@ static bool handle_arch(struct cpu_user_regs *regs)
     return false;
 }
 
+static bool fill_pv_time_features(struct cpu_user_regs *regs)
+{
+    uint32_t arch_func_id = get_user_reg(regs, 1);
+    int ret = ARM_SMCCC_NOT_SUPPORTED;
+
+    if ( arch_func_id == ARM_SMCCC_HYP_PV_TIME_ST &&
+         !gfn_eq(current->domain->arch.pv_time_regions_gfn, INVALID_GFN) )
+        ret = ARM_SMCCC_SUCCESS;
+
+    set_user_reg(regs, 0, ret);
+
+    return true;
+}
+
+static bool fill_pv_time_st(struct cpu_user_regs *regs)
+{
+    register_t ret = ARM_SMCCC_NOT_SUPPORTED;
+    paddr_t gaddr;
+
+    if ( !gfn_eq(current->domain->arch.pv_time_regions_gfn, INVALID_GFN) )
+    {
+        gaddr = gfn_to_gaddr(current->domain->arch.pv_time_regions_gfn);
+        ret = gaddr + current->vcpu_id * sizeof(struct pv_time_region);
+    }
+
+    set_user_reg(regs, 0, ret);
+    return true;
+}
+
 /* SMCCC interface for hypervisor. Tell about itself. */
 static bool handle_hypervisor(struct cpu_user_regs *regs)
 {
@@ -176,6 +210,10 @@ static bool handle_hypervisor(struct cpu_user_regs *regs)
     case ARM_SMCCC_REVISION_FID(HYPERVISOR):
         return fill_revision(regs, XEN_SMCCC_MAJOR_REVISION,
                              XEN_SMCCC_MINOR_REVISION);
+    case ARM_SMCCC_HYP_PV_TIME_FEATURES:
+        return fill_pv_time_features(regs);
+    case ARM_SMCCC_HYP_PV_TIME_ST:
+        return fill_pv_time_st(regs);
     default:
         return false;
     }
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 3d503c697337..fa31b1733388 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -502,7 +502,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
+    ret = make_resv_memory_node(d, kinfo, addrcells, sizecells);
     if ( ret )
         goto err;
 
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index e9418857e386..645e7d0a54aa 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -25,7 +25,7 @@ int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int construct_hwdom(struct kernel_info *kinfo,
                     const struct dt_device_node *node);
 int make_chosen_node(const struct kernel_info *kinfo);
-int make_resv_memory_node(const struct kernel_info *kinfo,
+int make_resv_memory_node(struct domain *d, const struct kernel_info *kinfo,
                           int addrcells, int sizecells);
 int make_cpus_node(const struct domain *d, void *fdt);
 int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
-- 
2.48.1


