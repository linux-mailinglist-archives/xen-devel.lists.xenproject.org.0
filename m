Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6937C07442
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 18:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150704.1481761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCKXY-0007ox-9l; Fri, 24 Oct 2025 16:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150704.1481761; Fri, 24 Oct 2025 16:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCKXY-0007m2-6k; Fri, 24 Oct 2025 16:21:20 +0000
Received: by outflank-mailman (input) for mailman id 1150704;
 Fri, 24 Oct 2025 16:21:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h56G=5B=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1vCKXW-0007lw-N1
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 16:21:18 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76a3be14-b0f5-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 18:21:16 +0200 (CEST)
Received: from DM6PR03MB4764.namprd03.prod.outlook.com (2603:10b6:5:183::31)
 by BL1PR03MB6055.namprd03.prod.outlook.com (2603:10b6:208:31b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Fri, 24 Oct
 2025 16:21:13 +0000
Received: from DM6PR03MB4764.namprd03.prod.outlook.com
 ([fe80::4f33:d9f5:18a2:28c7]) by DM6PR03MB4764.namprd03.prod.outlook.com
 ([fe80::4f33:d9f5:18a2:28c7%6]) with mapi id 15.20.9228.014; Fri, 24 Oct 2025
 16:21:12 +0000
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
X-Inumbo-ID: 76a3be14-b0f5-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5Z+a/GvLsGYtSEf70jhHJ39g11C/XMxbI0APvaz7Xr7bzEyAIB2thAyOKy9qfXnv1FPGbmYLJtsREYai7sT46mjPpvmUy2bfjCD/CzACj6QcBAup1WmnoNMm/oIO/vCTLDpiWsDyJj6/BXG4uqmuIGUWrLQwd8+Bd4mLRmn3OGAlSTcoWOMUcYuPZSQnayvcto/BDJfoKe+bL5s26jemgih6d3lzK08s1JzVozoLigVB1lVA081ju5S+W+6AayblY1EEew3tEaEhN+Cl+6DGNfiXh3NN4BKnHS01CFl0ZSOl3V5lKwOJ7GHVgTK2LRdRZwSce1erZipyxrS8t/IJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uUQTuet8fHMJ2w3FZTZuj/+41PlPOzUESjZXEwkEDA=;
 b=JuQgJwHboDcHXHZyT56hbHOwz6zCX2HkI/CRykevQdIZzpMVHChBPRn5kAJ0TgVyoU4Bn9fyJq0jMVVkMTfnP66yE6ZzEe5x3ul3uE1G1NbJSz0x75ru7xo4k2jNSnt1TRFWmw9+P3pA90CVEpoaVNgmDY8+GB0NF3VfUyH2l1kXXjNoWTTyrPbOfyMkD3pLW9ODWHmGhwja/vz8223fTTT2YagCwvPQAYvkFDZviGXbuUvIVDlGkBMy9dcj2uncCxFPP9UhrqnfTjidBiTskAD/n9Zc2DJdriQA0ohFkpRgyrPVxrMByenCVSSNJhhM2OVXE5IhHbIZzXp3hzD+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uUQTuet8fHMJ2w3FZTZuj/+41PlPOzUESjZXEwkEDA=;
 b=tSNqYWPtP870WtBp9FZV85cU++YpaSi0qe9PhogR1Q4ot6PqFUW5ZVBlNZz6HxUk8NL3yPDLpWrkq7Y6xqX7zv93eZqhUxYDWQqWgDXSku7eGq8CtPLcJ4VJGnjv038pqaT247sL+9cQZMfL2/alPyNYDQuGaGyH7HlQFvCMxEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] vVMX: Cleanup partial vCPU initialization
Date: Fri, 24 Oct 2025 17:20:54 +0100
Message-ID: <20251024162054.2610454-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0175.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::14) To DM6PR03MB4764.namprd03.prod.outlook.com
 (2603:10b6:5:183::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB4764:EE_|BL1PR03MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a73758e-d087-4126-e0a3-08de13195947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VU9wAYZStRdBwggOFhT2uM6Rz/3uAueIBekLiNLpRHg0e3k9g80GCX2LHI8b?=
 =?us-ascii?Q?rjZDYoYhKOKMS102kjabJbDEtrholp2DH5QCHNEd1lWqMXnWLSNrua7Z050k?=
 =?us-ascii?Q?p2zG4f20UISpaeSWTDV2simTc67eGhzN0VjpSa0I3JM4fcLhSDYziisbGmFn?=
 =?us-ascii?Q?W5C+E8oLxn19JmL8g9cuRRMxyExj7y6JmDoBEGyCNHLw2v7caHtKfXeAt2Dj?=
 =?us-ascii?Q?6TDV8r4cCdr2UwCjhiLb+KGHBFbKFNF2ogJgZ6E6uwL4K9XD1VvXefYTb2Yu?=
 =?us-ascii?Q?+KqQqcD8A+Tdqc32zWcCzprIOfWKp7coaW7UNwr7I1vb//g6uXMqdU0mWBCS?=
 =?us-ascii?Q?As6yITipMAyrIuhCXXGwFpJkFNuCrp4/KBfs4uqDbRbiKkPfFgakGnQKICZk?=
 =?us-ascii?Q?cVbfdILCFLyB3tuyvgeyzBxi1gGyb0/vfEREk8+OoD/XvrqbprzlO7HGPjyV?=
 =?us-ascii?Q?n/NQM9eTPYSqu+Jd8QrWjGouXAMSHyVthlJ6SCi1OVlAcwwlXxUIyE8VkN/l?=
 =?us-ascii?Q?KMfiZn0aAdiF5FKPzGm1md5uLWyl0o2smAjXTC2+y+9PDPUkFw/TLQLLbe7P?=
 =?us-ascii?Q?wJfYTL1aVPxNbPEQJ+2RHISHQYJbjbjsNpKkh9bujGnNGOaqDmAciUtInJ4t?=
 =?us-ascii?Q?UfYkI29mvVk3GyqbFNWPoqlA2Vbm+Mj4wXbGxTqJLDO1mqK5dHWb9Sj/qWGl?=
 =?us-ascii?Q?9ewoUtLvKTqVJ+JqUB7AcbPtVC+lMLnhF9F5gYw9fgHRPgbF1jt7ceSg3slz?=
 =?us-ascii?Q?3+DDkB7Y8CSX7qURpk6pmHF9hy7JXC9uwxr8Rgol3HM0ywvtuYr7q8LE7Hj1?=
 =?us-ascii?Q?kCoWDDAL4C5ruLE4X64imTe3DW8KsgIC21ChpR2mcPPslqHbJHj0vhE3cpTf?=
 =?us-ascii?Q?qj4IIVZJ6EZfJlNoV3P2crMj7SiQk71pywMpKBmdoAi10kHTTy12NaxqJHO+?=
 =?us-ascii?Q?AXt6/y6H0Mpt1tAijJjksE681xpRGwMbTJVGEte9HRexpujCYfIU5aQRHPE+?=
 =?us-ascii?Q?0KLWBjB+b/5f5noLSZ7jRTxAGhUaefHJPfWZfKoz/ussYxBQKt1n+eHPL2S3?=
 =?us-ascii?Q?FtYpulUPm74EJeGShe4PTx8ueyhIunipb0paREx5Wu2no+CuE/viLihj8R3L?=
 =?us-ascii?Q?x+OfOxKd0RhuCoF+h8oyWcdItiVtInhhxpc9scsJiXo0IOR0CvPYA8Di/wIf?=
 =?us-ascii?Q?zmsJ8IhKzToG3ODjFS8bKWOwMwq+oISkF3xSBj4WbtuFgC8G8fcsOHjapPtr?=
 =?us-ascii?Q?sbWJ/TPJ2c/RhX/ZRZdGDUsiRY2ksVfgZ3Ub4FwQsg1I119UyvVP0h9WNsu7?=
 =?us-ascii?Q?OV5ILidAVO9Z5eWOXNBFuvlKAWxVHw0wgSLGgz5K0yPi7ewPupkL0SswdQLD?=
 =?us-ascii?Q?5GDDWKXMEMIMhvfD1ntvOpOXQ/spVZCKiLBD4BBenhyjveCDUdIN2M4H+I18?=
 =?us-ascii?Q?TP2aS4C6b3XPQ5RVDvD6MUWsCs94qPBu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4764.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vpbic0iwPY0jv/ZXQwCZJjyXiVf2bhSjRQUbpTqv2hD2jCyhjD0isQ1T+3uX?=
 =?us-ascii?Q?AWnH8e0snsvIu7MwSkTvIC4vp3no7bWXyVptvZl3tO6o6A00bVyNr31pSGt4?=
 =?us-ascii?Q?KGOjQVi31r2Vscu5gJ2f3/6Jn3/OaBqtHXDPO5SvVgZCUJbqDs8PweKRuKLu?=
 =?us-ascii?Q?UUv+ZrI9WHPsTGoPPPqDCJB8jC5OfWyC9bZvoWkIp/xHoMotKfRgUpn4P6cp?=
 =?us-ascii?Q?4dofcQ3dPhNGjN/BjvvWWnCYdXu50AwYtm9iePUFR+GPW/EY845f+kUMLMGa?=
 =?us-ascii?Q?N+vLA4nPmgxLNcMXDjgZWJUqDhrICbTIJdDO7Hl3OI3o5wGwPMXnl1uQfoa8?=
 =?us-ascii?Q?DNQk6IwhmmcvSzcZ+ySxBK2ep5xuQlV04QpWbww3awTmKRGaUMs5r+SQJV/Z?=
 =?us-ascii?Q?JAq792J2KpR5pRl4gwWXZZTK/E9nKvMsWa0jTuzXvVOfCMj8NJePg8gsGP4p?=
 =?us-ascii?Q?amWTDrQ3aDeCkfhjcb/NPlshFm/oZkVWSw08dcjoFT+opOGR+HD47NFxLJRM?=
 =?us-ascii?Q?PtuvrA4gBT/jK9swNHnpdUsoRHeAKHqq3S/pEQ0LZIt6BYHjgo5ewlG3ws/w?=
 =?us-ascii?Q?ACnKeRXHoPf//sIGv0bLbIk1F3nc9mcaw47i5i4Zy5Uvvp5A+VZeYEdITpdW?=
 =?us-ascii?Q?ziPWCgV/HPotuowIiDWXldiQnwtc60BW7Sipbxla5eszHAXYTcfmWaf1z3o5?=
 =?us-ascii?Q?k835ooqXzZB8DsifIOdF/2Xr/xQJ6mtQQJmsL7pnpQLex7ef7eTiJE3HphPL?=
 =?us-ascii?Q?1R5bYCs/LQe6EcwOq9i7JFz7D8EvM3xGgW0bOXGELkA8cX9T8urhoMWqd+UL?=
 =?us-ascii?Q?yJjpugnij9XhMiFC85n00N7fmPIBhURvXzZfU9zDyM5wBOInSEhzmPyju1R9?=
 =?us-ascii?Q?3u+fo85QLIFGOx3ZGMhna9UeXckXXJlxlt0mQmz+ozEObett39RnlO6N/d/N?=
 =?us-ascii?Q?qB6paCdBed0ngssp5EIPUzX/fSzIv+JOkFikBW3go1MXux9r+uJ0IMAH9kNe?=
 =?us-ascii?Q?jSeD4VFryu+3ISN6i++OYFIWd+OcoyGOb5H+pCrankDjwyOXU2Zs8HjJ7YIk?=
 =?us-ascii?Q?Xv/mw8LNaEy+g8kBO8NNGBO1Npz7wNSU8r0EEKG1NXhmLaIrpFv4IBsWwbUk?=
 =?us-ascii?Q?7Ue/g5ob4bYxCa+hSuvr2fRXL0ukAzAe3tjXX3TdGaUimaJuzS0UPdZeHV8C?=
 =?us-ascii?Q?g2vNpQQ1K3xYK2vdPEoTqdGruNYG6Jv/r7Q0XfYC3RH7+iJOGZbj+ljHbTHv?=
 =?us-ascii?Q?InlA6KwufF4N1dPD9c0GIUz4R6ismRJN5qxqZtAASI6NjckjiRRxbPvjqWJz?=
 =?us-ascii?Q?drlQ63mYjDlgNI5Yle0JQfglva/UE9wBiJtNM8B9Cx3yEMHvO3u4DRAgnIae?=
 =?us-ascii?Q?3O3+7c6dVu70rSxfkbcslNsMTEku0g7BVTa8dzq7W1DAkw4CZ5zgYQkAWPCx?=
 =?us-ascii?Q?zXA+ddWfJRLlNjc1sBGwnRCKlg8nPLEouDzQsKat/Xaf8O8ZgANltR1cNHV7?=
 =?us-ascii?Q?JDXhT277FQUBB+zLqRHqXN/bVu6MbcrFc48ujByR1eRcsrt0imgfsj+Basta?=
 =?us-ascii?Q?v30pvQmL2GWskTbpTVamA6n2onADwHfeKg4DxvUzjEmsW7sI9RpacBSghCaG?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a73758e-d087-4126-e0a3-08de13195947
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4764.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 16:21:12.8377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgOXTWVuB6etFvhPt/fHmljod3ZmBw+PXnTz7FrjmOOEVP7MKKfZo8EVsrfKA2DxvqrOX6jbJxBoT3AVC1sBx339j7S/NiA0MuVrt8XQo8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6055

If nested vCPU initialization fails, cleanup the allocated memory since
it is no longer handled by the caller.

Fixes: c47984aabead ("nvmx: implement support for MSR bitmaps")
Fixes: f5bdb4aaa165 ("x86/hvm: Obsolete the use of HVM_PARAM_NESTEDHVM")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/vmx/vvmx.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index e4f3a5fe4c71..cf9aecb4c3e4 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -53,6 +53,13 @@ void nvmx_cpu_dead(unsigned int cpu)
     XFREE(per_cpu(vvmcs_buf, cpu));
 }
 
+static void vcpu_relinquish_resources(struct vcpu *v)
+{
+    struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
+
+    FREE_XENHEAP_PAGE(nvmx->msr_merged);
+}
+
 int cf_check nvmx_vcpu_initialise(struct vcpu *v)
 {
     struct domain *d = v->domain;
@@ -89,7 +96,7 @@ int cf_check nvmx_vcpu_initialise(struct vcpu *v)
         if ( !vmread_bitmap )
         {
             gdprintk(XENLOG_ERR, "nest: allocation for vmread bitmap failed\n");
-            return -ENOMEM;
+            goto err;
         }
         v->arch.hvm.vmx.vmread_bitmap = vmread_bitmap;
 
@@ -99,7 +106,7 @@ int cf_check nvmx_vcpu_initialise(struct vcpu *v)
         if ( !vmwrite_bitmap )
         {
             gdprintk(XENLOG_ERR, "nest: allocation for vmwrite bitmap failed\n");
-            return -ENOMEM;
+            goto err;
         }
         v->arch.hvm.vmx.vmwrite_bitmap = vmwrite_bitmap;
 
@@ -124,7 +131,7 @@ int cf_check nvmx_vcpu_initialise(struct vcpu *v)
     {
         nvmx->msr_merged = alloc_xenheap_page();
         if ( !nvmx->msr_merged )
-            return -ENOMEM;
+            goto err;
     }
 
     nvmx->ept.enabled = 0;
@@ -139,6 +146,11 @@ int cf_check nvmx_vcpu_initialise(struct vcpu *v)
     nvmx->msrbitmap = NULL;
     INIT_LIST_HEAD(&nvmx->launched_list);
     return 0;
+
+ err:
+    nvmx_vcpu_destroy(v);
+    vcpu_relinquish_resources(v);
+    return -ENOMEM;
 }
  
 void cf_check nvmx_vcpu_destroy(struct vcpu *v)
@@ -183,13 +195,6 @@ void cf_check nvmx_vcpu_destroy(struct vcpu *v)
     }
 }
 
-static void vcpu_relinquish_resources(struct vcpu *v)
-{
-    struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
-
-    FREE_XENHEAP_PAGE(nvmx->msr_merged);
-}
-
 void cf_check nvmx_domain_relinquish_resources(struct domain *d)
 {
     struct vcpu *v;
-- 
2.51.0


