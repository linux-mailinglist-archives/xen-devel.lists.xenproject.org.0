Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476E82FDCB6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 23:50:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71800.128891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2MIC-00039Y-FO; Wed, 20 Jan 2021 22:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71800.128891; Wed, 20 Jan 2021 22:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2MIC-000395-Bq; Wed, 20 Jan 2021 22:49:36 +0000
Received: by outflank-mailman (input) for mailman id 71800;
 Wed, 20 Jan 2021 22:49:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F2v3=GX=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l2MIA-00035p-IH
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 22:49:34 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 123af9f4-1e61-4648-86ad-41892f1c7ed8;
 Wed, 20 Jan 2021 22:49:27 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KMiw4s105583;
 Wed, 20 Jan 2021 22:49:24 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 3668qmvta7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 22:49:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KMdirL148865;
 Wed, 20 Jan 2021 22:49:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by userp3030.oracle.com with ESMTP id 3668rdxwkt-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 22:49:23 +0000
Received: from SA2PR10MB4572.namprd10.prod.outlook.com (2603:10b6:806:f9::18)
 by SA2PR10MB4441.namprd10.prod.outlook.com (2603:10b6:806:11d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Wed, 20 Jan
 2021 22:49:22 +0000
Received: from SA2PR10MB4572.namprd10.prod.outlook.com
 ([fe80::4c5b:9cf:616d:b140]) by SA2PR10MB4572.namprd10.prod.outlook.com
 ([fe80::4c5b:9cf:616d:b140%6]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 22:49:22 +0000
Received: from ovs104.us.oracle.com (209.17.40.41) by
 BYAPR03CA0002.namprd03.prod.outlook.com (2603:10b6:a02:a8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 22:49:20 +0000
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
X-Inumbo-ID: 123af9f4-1e61-4648-86ad-41892f1c7ed8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=/KFniBUDgE1CDZR+wKbl9DuVufi1j0rCzyWZxtuLZVc=;
 b=SmsjzpZNeD7mH8STV6JNrrv8x9v8qIP6SDleovo2/mBhHZvW81ts5G63lk3zJR5t2et1
 eONGlr4xL1uGBT5ubZoUkYS5lBBbekPufGWXzjstQ8SlYExtCccxbLaS663EzySQrlIl
 /vLYeJFiIUXhhtunZ23uuQ1xNKY9PPM3tppGy9as2MYp0kTrOKFcpdZR/SBvs+MRsmuJ
 OwKwLosgt9YSYPXtvvgkMWuOO/bV8mnApjkfVPTpqhu6HuglXQ6x9Bioz67KSsiORlIx
 HTCnOJiBsa39TqIMBVVrFwTODUSYVKAbIT3csBzrfQsa/+3/aOf4GQNVzLg3OHIVnHVv OA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gR3aDEfUkzvkWyx17nOr+LJTZ6m8hevURX1j50cPoYjT7HgtpEZo/+d0es/W1I8uD7J9KZETgpJ0kQ2ciS5Mhl1YWEPR6a5CpywVw00jtHP4uk1cedvClaqasnvQ2fMt8FbRTd4eujIQjkP0ChF75p/mAQBlT6dDu6S8Giciyj0eotWMsI+gCdTVn2YKTzAETmVl72CYIZRB/xplWYrPLqo32GC2ygLUvr6xjKRZItjV5KX7Xi102cpwvVYLGyfKq8IGc6VZlaBK3VabJ01CotrBSsFzB5pvP6Nd3eOZu/3TbjKGtEE1etl0t/SsGvxwgMVqrNUFj15VqciBxHlJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KFniBUDgE1CDZR+wKbl9DuVufi1j0rCzyWZxtuLZVc=;
 b=Na94HtgWBs1I5noDZiUdttMfNRnSmMfyE0ZcyRirkX3bIK/o9TPEYb4SmF94EdHN+KL91af8zXsWyGlGw1hp1/6Mg35ZeybJWarIhrIL23AKTXNjwfWEgkzsbRbnD5flcCvnGPjHFEaLtic1thvbmVVuERYqgep6wEK3dL1/cK9W5ENpkq2TZxn7alDPaJNh8U/hveC7BYxWSuOJgj4iPC/E+fcNIcBorPTvE03E1hpcFtFzTOEEGn89l9Nfs6UEx0qmSV4uO7c8G2npl472oFS9Ow/Mv1MZmYf4exoyvR5HiuBUrJVwYE/AoPASBy9Q7M486nDBvC48BUnoff1+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KFniBUDgE1CDZR+wKbl9DuVufi1j0rCzyWZxtuLZVc=;
 b=S2VBcvJtuR3NuQGu3urNGv1Jo+VI5Tq46zjYyYJdlPO+6GcoX+EkqLwZqQlnd3WoEbQ8l/2dvnw7hujDW7CZNt8w6JX7+53A/sRXVXGE8lSUfEq6yFfbkK6yT8+0YmiO3AHM4ZnfU1UHuz0PzgftW7wf+l0WZtCgoBK/ULoe4ks=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        boris.ostrovsky@oracle.com
Subject: [PATCH v2 1/4] xl: Add support for ignore_msrs option
Date: Wed, 20 Jan 2021 17:49:09 -0500
Message-Id: <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.41]
X-ClientProxiedBy: BYAPR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::15) To SA2PR10MB4572.namprd10.prod.outlook.com
 (2603:10b6:806:f9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d46894b6-99d2-4b5d-ca46-08d8bd95a0e4
X-MS-TrafficTypeDiagnostic: SA2PR10MB4441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA2PR10MB4441E234B231499C0CCB02238AA20@SA2PR10MB4441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XuXPECJxCHc+vXFSmAGMjFd9UqQr0JWvta+fuul3KqEdjvD+AOk+2XLYIOTT0fb8SCufqjc2HNkLeV9ozElECEj7uG1GwiGFUMJhUGJCHkwcDW5pKVGqN6j5sFjqQU/PvHYDv6yASG1tY4XiU8OoR8kwdowOymLVRNKjFVdF5BfLNK4/dzet1F15QuOzsj0czMXtF47+fWxhafakcAUkcRMWXV83/52BBIEC6ZaTHSZk1Etmcg2KLR3KK66YsdbNLXbx60D+hwzc2KvMDv1N1OUF82RPiUy9oWDY17nJdmEUQ18r2JzGI1SeYARx0FpWvQGFyQDH3VOml75e7MBTd7CmR2hJFL2t92gH9n3wSFwmHm/wgQELx8pyY6JzXybHXmhKRuzXs9t6WOAOn3y+64DSONSAF8HQF3+N3zTUUzS+h9ojE3tgrPqHd5tIhW9igfkOqGzRTYOfvhenByBtQA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4572.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(396003)(39860400002)(376002)(316002)(2906002)(52116002)(5660300002)(26005)(45080400002)(4326008)(86362001)(66556008)(36756003)(7696005)(508600001)(186003)(44832011)(6916009)(2616005)(8936002)(66946007)(6666004)(16526019)(956004)(6486002)(107886003)(66476007)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?+2wdBPH7jNxFYYbXOT4rfz710VDzt6fXZYfAVv2U9HQ+V2KY1p9uvSLNCfez?=
 =?us-ascii?Q?d2lpHb6nh4xLVyWZ7s49ju7NXUmlRt4A2i8Q1ybA5qoNZUZpvh2aOz6Dfj3H?=
 =?us-ascii?Q?7+6ECvq09YDHld8I6bhCcLrjoc6+kch15cwzB7K/MoJPDEuHkT+9w8sfLjAB?=
 =?us-ascii?Q?Sp5ZdIDTRJJJmZ9CIZ44d/3KScUnLa+zvWMbH3opDNN7QtwJ0TB+uQiN56kq?=
 =?us-ascii?Q?eTIRdY1Zpn7oCKooCisQa6rHxbrrLDHKe+MohMfFYrNLUtFU/RlARXJ7H8z8?=
 =?us-ascii?Q?MXmMqN6V8bCxK7krClw9s4HbLYOVrvv5OZlr6jUMbuIK7xu4ho9p54eMEOAc?=
 =?us-ascii?Q?RIGcWZVqcF7SZgSlanRv4kKyZdAma9rw6YwfryJe2F2hOhQA75CXfoUyFLfF?=
 =?us-ascii?Q?aACATdtZPeCkJ2DFSDswo+cnUWfY6vbJkciaRSoyfXQMgU/8vOQ/bl2anX/Q?=
 =?us-ascii?Q?lF9/B/kGRNkicIMyAzZq9MmqA5fLzJoabvLLzqOXBiqEvHTcSo4q/GNXKCic?=
 =?us-ascii?Q?56E/3ch7qJuTyuYC3WgRN1j2NljD/jGHcdFTxLiG5cOScqskT1uJ91Ely4Gm?=
 =?us-ascii?Q?n5a9X0eExyuIl7yQShYYrtVKeY/O+JqenpjPpsOYovNx2X1yhIa3HyGNU+P5?=
 =?us-ascii?Q?mWpcl6NFxKQZEOsZ16klxEV3LtvZindTt0UlGarpuQwnk5ZpHtFLYMjMF+kN?=
 =?us-ascii?Q?Q0CPZQcDIsYchtn+Lx4GnVJXcTM5S2+CWuwVvuR1HoaQzLlE+1+GX1OtEqQP?=
 =?us-ascii?Q?UUuvqZjjghYHXz6o6QMzmYgy0lov7pBsNGR6CR0w7vdfbA3d4IpE64mhqApO?=
 =?us-ascii?Q?1ZsylA+k33zeOxLNpyOHn/8s7i27NhKdjuuS+co5PA454Nabq/b5/eUB6qUo?=
 =?us-ascii?Q?NTffAToesZ11qwSKR9BWPuDUFiz/ODaEEY2Qp8QqUVPUdTzntS9v0GC6Mbc+?=
 =?us-ascii?Q?ySuAcTW18CTDU7TSZPkJbURRStW5aHBXMAxTp8fkaYtqUPpEwajPF3+PfQs7?=
 =?us-ascii?Q?M5eEmV9eheSDiLXE6qORg0CyqpPMzI/3NKW667xtdzYZIzqHXHboNTSObbOQ?=
 =?us-ascii?Q?U4Zm1QuO?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46894b6-99d2-4b5d-ca46-08d8bd95a0e4
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4572.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 22:49:22.2121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQjA7CnbBIh6ZhiEcQ3r0uBmB9ZNHMWAOtqk2XlfZ9qfoL2IAQSnCxV8fwdljfBQBGVqJfec6l2XLWpnM5T4BoSjrKZ9fJZnUe2yMWBPM+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4441
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200130

This option allows guest administrator specify what should happen when
guest accesses an MSR which is not explicitly emulated by the hypervisor.

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 docs/man/xl.cfg.5.pod.in         | 20 +++++++++++++++++++-
 tools/libs/light/libxl_types.idl |  7 +++++++
 tools/xl/xl_parse.c              |  7 +++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index c8e017f950de..96ce97c42cab 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2044,7 +2044,25 @@ Do not provide a VM generation ID.
 See also "Virtual Machine Generation ID" by Microsoft:
 L<https://docs.microsoft.com/en-us/windows/win32/hyperv_v2/virtual-machine-generation-identifier>
 
-=back 
+=over
+
+=item B<ignore_msrs="STRING">
+
+Determine hypervisor behavior on accesses to MSRs that are not emulated by the hypervisor.
+
+=over 4
+
+=item B<never>
+
+Issue a warning to the log and #GP to the guest. This is default.
+
+=item B<silent>
+
+MSR reads return 0, MSR writes are ignored. No warnings to the log.
+
+=item B<verbose>
+
+Similar to B<silent> but a warning is written.
 
 =head3 Guest Virtual Time Controls
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 05324736b744..7b5fef771ee8 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -477,6 +477,12 @@ libxl_tee_type = Enumeration("tee_type", [
     (1, "optee")
     ], init_val = "LIBXL_TEE_TYPE_NONE")
 
+libxl_ignore_msrs = Enumeration("ignore_msrs", [
+    (0, "never"),
+    (1, "silent"),
+    (2, "verbose"),
+    ], init_val = "LIBXL_IGNORE_MSRS_NEVER")
+
 libxl_rdm_reserve = Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -559,6 +565,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("apic",             libxl_defbool),
     ("dm_restrict",      libxl_defbool),
     ("tee",              libxl_tee_type),
+    ("ignore_msrs",      libxl_ignore_msrs),
     ("u", KeyedUnion(None, libxl_domain_type, "type",
                 [("hvm", Struct(None, [("firmware",         string),
                                        ("bios",             libxl_bios_type),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 4ebf39620ae7..942086c3f41d 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2732,6 +2732,13 @@ skip_usbdev:
         }
     }
 
+    if (!xlu_cfg_get_string(config, "ignore_msrs", &buf, 0)) {
+        if (libxl_ignore_msrs_from_string(buf, &b_info->ignore_msrs)) {
+           fprintf(stderr, "ERROR: invalid value \"%s\" for \"ignore_msrs\"\n", buf);
+           exit(1);
+        }
+    }
+
     parse_vkb_list(config, d_config);
 
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
-- 
1.8.3.1


