Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439E4489D6A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:22:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255395.437618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xRE-0002H6-P4; Mon, 10 Jan 2022 16:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255395.437618; Mon, 10 Jan 2022 16:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xRE-0002EY-Lk; Mon, 10 Jan 2022 16:22:28 +0000
Received: by outflank-mailman (input) for mailman id 255395;
 Mon, 10 Jan 2022 16:22:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xRD-0002ES-1N
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:22:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f70637a-7231-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 17:22:26 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-6a20aE6DNdKfSkQdQ4nROw-1; Mon, 10 Jan 2022 17:22:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 16:22:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:22:22 +0000
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
X-Inumbo-ID: 7f70637a-7231-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641831745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GQ7PQdEZXmFipDNsOtGtorQ//VDHYKsNcKkXsapIQCc=;
	b=Y1J7Oy4FseY/5jMSfGr9O+NA/A0zc3YpB5z9X2RUgpVIdLIEL4dJgdBzR6LBE2W4/qRWMg
	IVDAX5I0GEKCGwk687OEWCprkPu6wpqFAYrcTeRdmnizp/SyjRTpEbkyG1QTIXk8TALO+z
	t+pF1+Xc2tpARr+9fBSgH5C/OAADxKo=
X-MC-Unique: 6a20aE6DNdKfSkQdQ4nROw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=app5qRmJp7e3xMCo18xDPUzDaF50E51VAJtFXL8io7dECuxyeZReQA8mJixWkp5F39p+ksFbZPye1y5TAc87BzT8UFHUfBIu7VQlUErsTLLZNvYRRdMqbG+KjxZwu5w4q1rqpfJuPA40omx+7RF+Sl4SyAbOykT8Abb12TOxTQ0aGjj2g3drZue2GMSGiMlNUFUGaptUVOiiR7vj+RWpda+YvFLaE5FQudc9Rj4BSX2ziqC6Emq7J2n3Po+Ql7TlJ7uFAke93mj0hf83D+5EnG/vB4qz7ofFtf0h3m3kJdt8dd0+dMAGrQcRZIjjEmdr94JLPIYVAoMO92Tm0uMcHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyEoSTasEfJmkFA13BmX2SyysSWYqAygZWIVBmrrlgs=;
 b=Ysql0tOieTPkEbJ28UGQPIjfi+UfvLcdMYziHF4wdHCUo3eXdsEsxW4UcQCnp80yWQgr1T6Ze4xFm05XsL0yzBUW5JC0Ge2CCAw8jpOWpUjkZK+wxyR/bJJSEO7PyStWn4/QuMX8NQsc0VmJvtveSIuw5fIZ3Qo6KzJ0+BulbgZQAko6oaobdz0y4kmBdQ2czp/7BAj1PN5pUjXtHhQZq7ZrZ+mLQz83OoJerw1luAsS3pq9pvVVaXB2mrKmWFx93jDCPGSrPDsE9RYKMdCdohXav2cKi6vh7RyEXeqVL/dQHIb7NaAH5RJOTW8nSQXbpxJazyuQCb+TbulCcDPRRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6549b60b-323a-fede-4944-cfd5f7b7e64c@suse.com>
Date: Mon, 10 Jan 2022 17:22:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 01/23] AMD/IOMMU: have callers specify the target level for
 page table walks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c0b4bc3-48f1-4bf4-db8f-08d9d45561b7
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244629BFC03F71719563FF60B3509@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I/EdxZ4t23whpX06CUuQYMfOzPJWTfCJVRlZnjos/TtGgS10z/0Ol9sNJCKoNIcCz6IgzdbwKWfvGrdHXmG03GDByYakiui836A4rfwAZgZwsQqpgb/2BZWkuOW8ehuG5Ii9DNXPfOEjxaR5aGNqAEQZSteouDhQ4ATLQHOVWbn90bPyLSyAMfmfmpbH9qU6IqykJSj6bp6AKNQKlWWUg2ktSdEDYU2OdTYnDFNxCCTLvqhBCOTmNiP5lRBLgSTKo0Jo2N/irRJBqq83oJOaJz8vHofcheBuV8DGq7ZlMD3iIKKpMRfPlREiT533wDfREj4489ectL0VO2QJgXnZ8esyl6tzx/J0yWqRssxiDgCqf52zE/c+upvjWPihS60JMCzK4n9oB65AZSWQloO1RxLeFWYWppp8J3NUWq0116tWvfeLKqi/24gML1B0ES7XS90gViIvYbyDVNdht1P7OZ4HVOhdtFyUQ+qwnJj9y3f/+VqnSpXrMc8f2davbtoXM1DfZlMRVbwbtwIOaxZNc17PY+2rYGGNYRyYPwQy8pIV7z1/WppQqPU48+GZf0kiaxUOSW++VLQSSD/7RITAD6yBV3Axx9pvyc944U3H2fAY2k1gSyfHHwiChAJJeLz3FQMlh2IOlNKVlRxVs4zzj3D/+6vyigEDUOLJ2KREOibx2DWOvVy9YcSO/JqjvyOmdodXDARimF0YYXGKDSitZ4BwcRyXgmYUDupem4Ucw7OWanKtUHp34iMZnlYAERb2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(54906003)(508600001)(26005)(31696002)(6512007)(8676002)(5660300002)(36756003)(83380400001)(4326008)(2616005)(86362001)(66946007)(316002)(66476007)(2906002)(6486002)(6916009)(66556008)(38100700002)(6506007)(8936002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lQIQG5Z4pF0ZDJkrTWQrPSpG6jg/1pj3KBEQU55YpK1YumQSEBWZiK4qMuPO?=
 =?us-ascii?Q?Zta+bFNlgfLhukPYKz1ZDESJQEnzRj/PFAYtRdTgt2QcVI94lD4BSB4cpiYf?=
 =?us-ascii?Q?XqBWN3+QIkJsI/Fx0kSBk5uA8qzAmwTMFan9yXfl4Jtp9zm4fGnp+v4CF8F4?=
 =?us-ascii?Q?6jxNjyzKY4HtkK3QO3CcP3zYLjO7igRsQXkXgcQ/l21fgtBwewQasIPdsPPP?=
 =?us-ascii?Q?KussLLgIZCNZ7u5cdkYzwxaosPFNGWoKcWC+prEMx1aNsmmZWQbRiuRv6cl9?=
 =?us-ascii?Q?SAhysThYcPjFLmnYxn/SOQzO1rqhAMMsZGGA/VOofbXbkG5Y8SZvuZTdPxZr?=
 =?us-ascii?Q?rxtG9EWRuNO03tEIthxnubUh+qwegOg94dKG6utdSC1yNYlNFoZEFrb5wP/F?=
 =?us-ascii?Q?N9jEfjkFfHsi/75TtEOLgZTvty740D6qJYhxvtNJL+Gry6UFEK3MsfMyx3Dq?=
 =?us-ascii?Q?panmxnvSnrmRR2SAeqFHZmlHkjexzj+xrkuGV3g8kBkHxgM0FoAha8AndnDP?=
 =?us-ascii?Q?eNoGD+juqbHHFskkj+lZm2uAuW16+GxdyvVCPwuZhz1dY2T9P5F3OxpPpvhL?=
 =?us-ascii?Q?kv7xLD513aK1BH8tTWT+WmDkq0NnIeX9hfJIEInRHyRS0VTzC4Oa6V5RcBbY?=
 =?us-ascii?Q?mKVOshaFPu5o4RU9oAedsn5i4PclLUTCME9sD9x6w390RD7L+H93RS/Y+/Wb?=
 =?us-ascii?Q?dK4jG/DAn1Zsckw8DUM4bfL8g+VhBz5QxfZ7GmjyW2EEYNWTj8g6K5ZHQTLq?=
 =?us-ascii?Q?0NrsDD+7uGgk76RdKF08a9GsHTYxaWE/wILVVzhIIlb7DRnsZlai4qeM8RXB?=
 =?us-ascii?Q?C/B+Uwe8Y8JUbqgQF6FhfJnyxC2B3PZCgKMYPn4ed9RrxTAg3zhzTX0lY1vh?=
 =?us-ascii?Q?Tf36StL0JG1kecaAatE8haVGNvUPKoEVFg6ZJJ1V6ywpHES8B7VMFUkUB+pt?=
 =?us-ascii?Q?rRsMVjohrPxKu8wgWkpvk85AqOm8OagIsLS4xcSH8qDqcuLyj4Z11qh1GBXC?=
 =?us-ascii?Q?6eayoWzQGvgL+5w4+qRH/qRufbc4k1pN2mvoFMXiXYSzgdqhBRb3VHyN6EGH?=
 =?us-ascii?Q?pxqIsMHM6vXBYT8tqZYhDxvUe0fu2qK/0cvUfvlrTTn2JuESnIN/FiaEfWvc?=
 =?us-ascii?Q?h9qdEdeKK1kpbKBU+p/aJumtLh5aErqHs5lus9e5ci1CKOyonZm6KDSOjfwp?=
 =?us-ascii?Q?BXBxH+ONIy5rtuD1t71Bln680QR6yMImir3pkqWot8nJ1HxI+/HBzVMsDWva?=
 =?us-ascii?Q?7RhaMzXldKvg1iyLNiwUz5Xvvp9K5qdpKjUiyyEjIcAH5Khoc4pbEFPCENn0?=
 =?us-ascii?Q?eJR3jjP1IfQLP8cXwyLZAT1hIkCzysXWwwCTQfdl6h2iIxGRSeH/5jFvtRL+?=
 =?us-ascii?Q?mAQ8eujltxKlEVdeVMPbVSgN67u686qMrOIh6Dw58/FdIhjqPaf23psLqhLA?=
 =?us-ascii?Q?HR4AKQD7X5qy2a+lONeTNJzwwZ7canK5rjVEdve4d0kfqv6LLOVuZ4nQZE3j?=
 =?us-ascii?Q?yns9IBD7v5zEEQ0mBOtsAA9+N+kXrvSCvyhwjkTK61QIF4GEsANkg79MNbV6?=
 =?us-ascii?Q?abECMV+x1hEDzXHgSFpY0AiEjYTxpNo3Ouux5AZ0tPFgBILJsR/Ek02WoUUv?=
 =?us-ascii?Q?rmHb841AMAkUyRH9EEUKW24=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0b4bc3-48f1-4bf4-db8f-08d9d45561b7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:22:22.7243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHhIztEb0toe+3V/PaJr1QwjPEwTi9ESjz2LNUM1sWlp5RTv5t+UgWvi2tgE/HhC0lwtY7iLf5Uyyenu6SkGQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

In order to be able to insert/remove super-pages we need to allow
callers of the walking function to specify at which point to stop the
walk. (For now at least gcc will instantiate just a variant of the
function with the parameter eliminated, so effectively no change to
generated code as far as the parameter addition goes.)

Instead of merely adjusting a BUG_ON() condition, convert it into an
error return - there's no reason to crash the entire host in that case.
Leave an assertion though for spotting issues early in debug builds.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
v3: Add ASSERT_UNREACHABLE(). Adjust a comment.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -178,7 +178,8 @@ void __init iommu_dte_add_device_entry(s
  * page tables.
  */
 static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
-                              unsigned long *pt_mfn, bool map)
+                              unsigned int target, unsigned long *pt_mfn,
+                              bool map)
 {
     union amd_iommu_pte *pde, *next_table_vaddr;
     unsigned long  next_table_mfn;
@@ -189,7 +190,11 @@ static int iommu_pde_from_dfn(struct dom
     table =3D hd->arch.amd.root_table;
     level =3D hd->arch.amd.paging_mode;
=20
-    BUG_ON( table =3D=3D NULL || level < 1 || level > 6 );
+    if ( !table || target < 1 || level < target || level > 6 )
+    {
+        ASSERT_UNREACHABLE();
+        return 1;
+    }
=20
     /*
      * A frame number past what the current page tables can represent can'=
t
@@ -200,7 +205,7 @@ static int iommu_pde_from_dfn(struct dom
=20
     next_table_mfn =3D mfn_x(page_to_mfn(table));
=20
-    while ( level > 1 )
+    while ( level > target )
     {
         unsigned int next_level =3D level - 1;
=20
@@ -271,7 +276,7 @@ static int iommu_pde_from_dfn(struct dom
         level--;
     }
=20
-    /* mfn of level 1 page table */
+    /* mfn of target level page table */
     *pt_mfn =3D next_table_mfn;
     return 0;
 }
@@ -307,7 +312,7 @@ int amd_iommu_map_page(struct domain *d,
         return rc;
     }
=20
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), &pt_mfn, true) || !pt_mfn )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, true) || !pt_mfn )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_ERROR("invalid IO pagetable entry dfn =3D %"PRI_dfn"\n",
@@ -340,7 +345,7 @@ int amd_iommu_unmap_page(struct domain *
         return 0;
     }
=20
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), &pt_mfn, false) )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, false) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_ERROR("invalid IO pagetable entry dfn =3D %"PRI_dfn"\n",


