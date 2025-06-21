Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6654AE29BD
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 17:12:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021612.1397539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSztE-0002Oz-Ai; Sat, 21 Jun 2025 15:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021612.1397539; Sat, 21 Jun 2025 15:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSztE-0002JS-4a; Sat, 21 Jun 2025 15:12:20 +0000
Received: by outflank-mailman (input) for mailman id 1021612;
 Sat, 21 Jun 2025 15:12:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3VJ=ZE=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uSztD-0002Hn-1Q
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 15:12:19 +0000
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c406::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ee9fc84-4eb2-11f0-a30e-13f23c93f187;
 Sat, 21 Jun 2025 17:12:18 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYWP286MB3033.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Sat, 21 Jun
 2025 15:12:09 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8857.022; Sat, 21 Jun 2025
 15:12:09 +0000
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
X-Inumbo-ID: 1ee9fc84-4eb2-11f0-a30e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1BxLef7LVRWI6ip8AZdslSIgOJwKd9CyRVy54r3S0HT2611z56a3YOYYmKpeNi3AJXUc5tMJhIUDXZq2EVt4GYkMhB//ntuJ4r3LQwzg0g+RO/6wLWBO1bZZlxvCIPN2CjDa85Dn8Rko/U8KkTKjiDu08iyWhMxR0cfutQPSps9VKSRZ1EB42THbhvvEdDV/RxrZ5c8q7H1I3sRojXGX1uAhK2GU0VFR0E7eFWec65Ryl3WFIk951oC8Im1BmV+/6JpAATamHM6I+xJbgwjc9HBUHvvwq74huLjdPC7FOg0k0giQMob4Rbe/ZhHjbaSkiWl2e0ekbDF55kcs+V4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzEqMguDXik+OUbkQR4RTQfJmvwdGVxoIrMJVs4Ffn0=;
 b=o9UxXJ/2qRKq9Cb9bG94NUB87nl/G302ZWytSEfw4BXvPHRLbY55hDCeo2o/Kg5NjBTeIhH/tBoy59pXf9nBtSbb4cf71pmSFWvdpXy52saRgaADpkf2+9QB1OGdc3aY/BZLdd+bD+F2T0dDcWo7a8ml7HWivMd55CdpstKpjJ517oWsBRDX8k7rxuKa3Nk8LWSbul73HV36GrgJLEcWK99127URX3es/gYR9+0h3AMr8X2aW9yXUlZx/mb5Vjv/iDCEk8mznf8pVQ2uy7GpS6B2sWwsf6ilnlwggAKkMTzO1tr06Wp+GFFQDI3GRBNo7U/0FKruvEf+g+moOQTc8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzEqMguDXik+OUbkQR4RTQfJmvwdGVxoIrMJVs4Ffn0=;
 b=LVmtatB5pLtahgirZJp961Vo+zoNCfEZKikw1x+NEsv3M/5RM9bWnqdv+4PzOk20tTOVwj3YBRC2JLjXjwVJnAoiDuYVEgY7KChNwY287itMgXMjbZGIEJKQqXrSRd+4sZzhzI6CSBvGRDGqSY8ZBZW78i2RMJ8aM3c8XXNF5RU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Koichiro Den <den@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 2/4] xen/arm: Move make_hypervisor_node()
Date: Sun, 22 Jun 2025 00:11:59 +0900
Message-ID: <20250621151201.896719-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250621151201.896719-1-den@valinux.co.jp>
References: <20250621151201.896719-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0019.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::13) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYWP286MB3033:EE_
X-MS-Office365-Filtering-Correlation-Id: da6b9d95-a852-42ee-72e8-08ddb0d5fe49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QJgK6wI1IR4fvJwKOm95Yc7Ao7egDdTqhCnvD72QfloD3N5s8OnWekWOxthT?=
 =?us-ascii?Q?OIdQyUiPgsu8ze6ess4m4yrn//JOgVdMXnVLpyER4EjKE5YGXdDyBqxyz3qe?=
 =?us-ascii?Q?xCyCe2qkPSJvmJWlvmcXiYgcXXDKiGmpXSU0IWGcqopToq4Uggm2uwMM2tom?=
 =?us-ascii?Q?Y40r0DnEZYbKyXadn2JWc7MJ6Z3SWGCLqX/0WE0XKNCkNbxtkwkAZZtcFXum?=
 =?us-ascii?Q?wIV4mVOFGy9oQo863kAtSrePXk6PY5UuEKNQCO17d7A9YBJSgLCpAKpOZNog?=
 =?us-ascii?Q?HJAncLRhj/0ar2ImEc7Jp251FNIwdJ68aNkG/6TtNiafZpELf3yNPfQ4rxn+?=
 =?us-ascii?Q?4+p7tWLY6/QKOcxZe/kiQuCWysDsyTiR+whSSnZZt26qzKKeE4TdEfRLOKyt?=
 =?us-ascii?Q?LhkBDKJG7yVtYdwhHrhoeMkfSwuLPB0HO05A2svJnkyr2txKFcxxqMirjtE2?=
 =?us-ascii?Q?wPf7WdbhElHu4yQ1wtXl5FI10tYFmTr+Wt1ZngWe+Z2LEOTOYriUHFwmmcwm?=
 =?us-ascii?Q?dJnq3sdkD5Kyr0h4mxqPqZXsxhAknlgNdM/g4OsQSHiQOSiAVkCDd33A8zcX?=
 =?us-ascii?Q?pRKAMUgJVh/i+RbseNQ6z/1payh5xLJo9l6g1i+udSGP7kbxpXNfRP+k+iys?=
 =?us-ascii?Q?0wATX/x1ANzIP+uubu9KifJgu27JBHOuKG52xyb9MEGYp+qSi1e78H9jQkU3?=
 =?us-ascii?Q?Q6tm/qo3P3CV00OUt4EJ60Z4h3oK/3SM6ADjOzV1yEPV0YGLb8s5OOeieKsO?=
 =?us-ascii?Q?t0eZYt6dnbKc4l0QD5QmOSpVE+HSmoECctgSZgYa7AnKEWANw8IyvELD3j7u?=
 =?us-ascii?Q?C5Ya/6vLtXwUaa/mDhZBZ0sAXq+/5QkNBBCYktwZ3GXtCct7s78oJ7R/H5fC?=
 =?us-ascii?Q?ff3GPbp7bb0OSnDkCWbqQL5eK9hQf8MlP8OYrl70QFbZY0Va09PokcvKIsdP?=
 =?us-ascii?Q?CG4hUlZl30Ru/8Mmx7TzXpPWU0dp2jDYkuoXh3hCKUClJk0o9IpUzuBItOjp?=
 =?us-ascii?Q?o8jQ1IFmXLCnGqDrodXJQKRxw0RivDB6Kks+ZlHAemCx2rA2pUTEJDLAUHwJ?=
 =?us-ascii?Q?8QW+KY7UkCrsndtEg89QWkrNohJvA+/CosHbHkC3HeUAWr6tQ0cWueHSDCtc?=
 =?us-ascii?Q?f5nSx2X6VH09vu4XZYeR85/Io6YhKrNi4WNrJTiWPSDJhwGIztqhG2P3+PUv?=
 =?us-ascii?Q?X75sQ60VeOwZt42cNDBqbvdeTCmueuceaAyxY2vM7kxEH9KBQJ2f+SqdGEqZ?=
 =?us-ascii?Q?35WEc77NFoCTPe+/LC/+VPrREVjapJOFNrfo2o7BQVMXhleU4AZeLx7ms1jD?=
 =?us-ascii?Q?NO/w74KX/h4IQ/WlYW/L3Qi0hBATcXrXrzlYaZHOF43i2lju1+YgkxL5G2VL?=
 =?us-ascii?Q?bop/cKweOXiF1OosupBXfUBqLwXRmTwxjHhdNTrfQpdyfrjRNyM7vDNV2ZLO?=
 =?us-ascii?Q?IBpWk6u1rZ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NRnZaDRJ2tSFy/mQHnIp9yKMHEctB3ZMOcesXJEALSXrMYHQl5SeYvJS2aQq?=
 =?us-ascii?Q?Al17Dkcc+pzQx3a04a4r2kthIZ6AqHUWGMGNrJXwO3YLnBf9/6abkWHf4AY3?=
 =?us-ascii?Q?PZCMbnAk8vNC2VmIAEx1yRJhs+J+EsEQ8Y+UriUPNMNXjsxjpU/JVm1MnpUF?=
 =?us-ascii?Q?yBy/6n7cqS9YFAWbd5Epw0nnLFDJ9x9XBa5bvPHm6Qx/04Qdn44D8nwBa60E?=
 =?us-ascii?Q?wosLm/U6c4eInvIPIyCEx+7TSIc9EnDMZtPG05SveNPX4TqKRwGXh5+5XykB?=
 =?us-ascii?Q?5AeaDL43Lxx3k7M5t9Rrv/gtErQsalvvJYPmLtxCv5UOivLFnmZNadHvyQAv?=
 =?us-ascii?Q?tRnQBw/lTavvk1KFr7aBvWBj3We9OxLnUXUGNgFpx0U29pm1FdfvJGWCfckz?=
 =?us-ascii?Q?SQTzvtARX1HY+zNbNdQlipBNWqxVqR47+zRzXtRdIjBq6ULGq03iPpJgGiDI?=
 =?us-ascii?Q?FxYiv27YG+7nyaWjm0FP8MEDiywrD0fYb3alslyp04xpGPHuHUICFSHrOg2T?=
 =?us-ascii?Q?ns4YHGwMv3NGe8tLl79zCtOSIPreQ06ShlSMDy9iBpoM/2EMw8ZBCHiXZyuO?=
 =?us-ascii?Q?iq6kwJ+s6qaIh1AFCEukPiGVg6lH2jErNovvI5idmS4Eg9O589immhnvTak7?=
 =?us-ascii?Q?AvkFsDGxmbC1OVcw6q0nfFr3/LQwPayk7xWHgUnWdpUGGlUNGovGVKJZs6lZ?=
 =?us-ascii?Q?+xOdVoMJ1xIEpLVt7EiuTXb+oVLcFhLTexxaH0mIuY+y7PmFpum5TTDvZX7q?=
 =?us-ascii?Q?KIy0ESiNqylRmsR/k5oLhdJ7m3uDxwlCjwUN9Of9i+8/rKMKarVgArEMuEfg?=
 =?us-ascii?Q?NuSX+hvG3UVxlaUbGbDNeZSw/O27saXxgLvQtQ0akJ1YacNNa9EJJExxhlKb?=
 =?us-ascii?Q?T97IyFHdlbc5uwGhPeSdW4B4vfhWOeCZxVONKpA8jni/frXe1NH4yR9hcvRu?=
 =?us-ascii?Q?21jszU7jssrvaISAl9eo5HU9samXyB0KLaH4aEAU0y+d2LyDqRL7TUbjORVi?=
 =?us-ascii?Q?+Q2O/YOQufnnoq8zhL/umhTvdJBVHKCB/DNbQO3mXNNZx0Oeornn5MSLymm8?=
 =?us-ascii?Q?m4+54ivGFeIHSZz9khAZeRf0tmHOUCmOMbcO8+WlcbJBzSOWO0EME6Ef3gba?=
 =?us-ascii?Q?nQWVi75wpzEIGBWz/7a/QiAHqkuDzKsmd0EVkR3yydZeeIeIxsVQvumhTK5w?=
 =?us-ascii?Q?EFRBM1sh82RUjVxtknoiCHs8V8dnhi5A2YAeyMPd3X1Y4VNKGrBICI1sJHUh?=
 =?us-ascii?Q?L9anPM6iIHAysHNnG3Shar5SwoArnYfn308fx/bmydgcalm6lwg7RBCK1kqe?=
 =?us-ascii?Q?F3IaM//SqTkLzhh9E9vj90zL4dnLmXYhFQvvlVC0O+H59kCtnE7Pv8Lun9dW?=
 =?us-ascii?Q?ULyG+QxW4uB8w1exc0d5Dsa2xXPO3uy4jT5w/ZBXMGJghGpgAWQgpXZykOeo?=
 =?us-ascii?Q?jmbWnVUCBp6knOX53e7/tgIEUnHTy0w2h+ZYoWpKDQIIx6ofOI17H14WDP2V?=
 =?us-ascii?Q?9b/35MCryd3lj5QNZsf1PsCGWTBMZbZ7Y8V1RZs8pNnYfnm108XEZbzbhC+a?=
 =?us-ascii?Q?0PuqTNCLMnNEDW1sKEEBO0m5FAqOuVoSJqq1xishnIaVEl+S/rqJ0NLeIdJp?=
 =?us-ascii?Q?ApmScpFfVhrovAhgrDZCnZo=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: da6b9d95-a852-42ee-72e8-08ddb0d5fe49
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 15:12:09.8013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+RqEPMuLtsqsyPR9gpuwLjqf8vUO6IHPXM/xt2CqWJP1BFNR9J0YVqWS/W2KoZTWrG630luhW7CR++rrkx+sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3033

Even though make_hypervisor_node() does not rely on the /reserved-memory
instantiation when calling find_unused_regions() (the wrapper introduced
in the previous commit), the next but one commit will use it for PV time
shared regions, in addition to the existing extended regions.

Move it as a prerequisite for the commit after next.

No functional changes intended.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/domain_build.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9d44b6fa9470..967ca6f375ca 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1725,14 +1725,6 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
          */
         evtchn_allocate(d);
 
-        /*
-         * The hypervisor node should always be created after all nodes
-         * from the host DT have been parsed.
-         */
-        res = make_hypervisor_node(d, kinfo, addrcells, sizecells);
-        if ( res )
-            return res;
-
         res = make_psci_node(kinfo->fdt);
         if ( res )
             return res;
@@ -1763,6 +1755,14 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
             if ( res )
                 return res;
         }
+
+        /*
+         * The hypervisor node should always be created after all nodes
+         * from the host DT have been parsed.
+         */
+        res = make_hypervisor_node(d, kinfo, addrcells, sizecells);
+        if ( res )
+            return res;
     }
 
     res = fdt_end_node(kinfo->fdt);
-- 
2.48.1


