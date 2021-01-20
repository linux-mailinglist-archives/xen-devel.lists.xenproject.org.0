Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134772FDCBD
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 23:51:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71811.128917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2MK4-0004Ej-BC; Wed, 20 Jan 2021 22:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71811.128917; Wed, 20 Jan 2021 22:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2MK4-0004EG-7Y; Wed, 20 Jan 2021 22:51:32 +0000
Received: by outflank-mailman (input) for mailman id 71811;
 Wed, 20 Jan 2021 22:51:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F2v3=GX=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l2MK3-0004EA-74
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 22:51:31 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e69168c8-f7ea-44e8-80e7-4af8a8318284;
 Wed, 20 Jan 2021 22:51:30 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KMoF5A110042;
 Wed, 20 Jan 2021 22:51:27 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 3668qmvtfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 22:51:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KMei61150786;
 Wed, 20 Jan 2021 22:49:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by userp3020.oracle.com with ESMTP id 3668qx3dcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 22:49:26 +0000
Received: from SA2PR10MB4572.namprd10.prod.outlook.com (2603:10b6:806:f9::18)
 by SA2PR10MB4441.namprd10.prod.outlook.com (2603:10b6:806:11d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Wed, 20 Jan
 2021 22:49:24 +0000
Received: from SA2PR10MB4572.namprd10.prod.outlook.com
 ([fe80::4c5b:9cf:616d:b140]) by SA2PR10MB4572.namprd10.prod.outlook.com
 ([fe80::4c5b:9cf:616d:b140%6]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 22:49:24 +0000
Received: from ovs104.us.oracle.com (209.17.40.41) by
 BYAPR03CA0002.namprd03.prod.outlook.com (2603:10b6:a02:a8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 22:49:22 +0000
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
X-Inumbo-ID: e69168c8-f7ea-44e8-80e7-4af8a8318284
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=BW+rJtflc9PuVgftQd4YzA261OfzZZgz35MQdhpNXNg=;
 b=gSIABrviQfEEUc6re0vNe0/n8KZc33zhLuO2fUs74aOwrB23f5eNk+pKn9zTYKCshrTo
 EgYtqUXFbwTwzv/fIOPW0pYinZhARRZ7OIhHGNU+ksg9WU2HSIA3bT1Kk1ueSKW2ebKL
 y22vAkgXlgkj+Tw8zPrB2FcjeAvtGK0co4+/tObWqlqSiT5AZMOTjc9GToj4qUE3Lbtp
 iyxIpGDpct8zHqmCtaoiXRQ2rpZi9XRz3RzNAOmg7Mf2zxiFNVCCKyKowHS8EwC2tEMo
 SvhaW2FsHH0iL127ZxX2WiPNL/vi3gF58Pbo/EMmiSizC0j4hewDGLApYX/i2rtm0SfB dg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjWsE5MJ3TE7FYHyliceupau9blOwav3sHj5FhDrhaJ8oQstMJqoGfZ37GrYu9iCYc0q/brqw1nA7Q6x/lFYpPY2+lCBA9WeW01fcdgadvFOHmnhSNpkXUV/toGDohM0+5zTFpEBSzMk04J/r5s6mZdyLwJh+ORqh9fJDFtoZDEQI19y9mMdbjMOCkNcv+vKKouSZaTbrjkGjQA+/eYWVZq3xpK5j/K1p7J/tOXXV75jYG5DfvNNUb/G74sfp39G1mlk2RCFFL6/BPi5VRNcT0drYLndduMynRghAWK1t2EL7aSm6VvZGfPTF266GmrH5QKhPr6/GEyudi7jSNw6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW+rJtflc9PuVgftQd4YzA261OfzZZgz35MQdhpNXNg=;
 b=J7vV9+MNL29ice0rReANM9774mEQ0A8EXgyBOaHjriM/B7yDfHklUmnSc2SJ1JTFs501kXFAfLdeNNABB0iVsAdUPf5H5OxEApM9Q4TxFuaOkpSyIqCbLROLN2kFv1OriYZLsLiBFxcs1i7HXUuJLwZjA6Ja01Pjls6JI1o8rpM68XQDbsFqlWuQu75Dlfp+WM3OvGrVzQaj9Ecp5UxXP5biZ7/ffpTRHZ7o8yvsFvYcxI8N9TKH+DI3eAPt4CGu/+3zLehebkGo6hZcd68ucxGbadkREWF8NR4kGt9x0Ti2zZjwPBEURfG9pzKJoIMyBpT7hKtrEFgx1cPiaF6V+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW+rJtflc9PuVgftQd4YzA261OfzZZgz35MQdhpNXNg=;
 b=WlmZOGFw7Gd5W4r0ZGBuqAJFXzO0XVyAufqfLmvkwbYbCYlv+HRbOTwuot2u5KhNgKMd26Go/7sbofqQgt67GnIIVXn8sv6svJPs/Bl2N39gnZ/YtK1/HLaMFyuukazHVAF2yl8fIT76AUE6BJ4/5pFhtpb1ifkbZKsjIFQfrGs=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        boris.ostrovsky@oracle.com
Subject: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
Date: Wed, 20 Jan 2021 17:49:10 -0500
Message-Id: <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9b4537ef-6994-45b5-d2f3-08d8bd95a1f8
X-MS-TrafficTypeDiagnostic: SA2PR10MB4441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA2PR10MB44413FBEDD896B74F2326C868AA20@SA2PR10MB4441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fVimmvSDgaO8CrG8tDVxDhU61aXb1woSWx7mZciXxD/fFDqidZGgZMxKibadU0+M4VpHl4hb0HWK0PVP+i6fhHWNeo0mQnYkUmB7h+3rBPZZNl99yd32edALrZPdsMP+gfWTCx01AnAVmL/GQj8W3n2GbKc6qGn7k/h9MorEDXJLP7gn6/2LB5g9AcDQ/YgIkajHtLYyqnBG+/sIh0RG9xDfEuV6IJwiYOsEAyewT2t8HJOgId7cfiSEc1sFxdkTTPJKoc6yp/9adFWPSanVxK2mjbbQSvNejN80zkT2Qc/BkGN0Ucj3O+k1+zZPbwH+dEa82cZA0wH9ogfNy3MOZfZHxb8Rko2bbv3gO5w/MbOxOMNtoS6AEQaRttzGFlgvSppABF1v/ETTJrqIoO6ogw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4572.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(396003)(39860400002)(376002)(316002)(2906002)(52116002)(5660300002)(26005)(4326008)(86362001)(66556008)(36756003)(7696005)(508600001)(186003)(44832011)(6916009)(2616005)(8936002)(66946007)(6666004)(16526019)(956004)(6486002)(107886003)(66476007)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?9huH2WJBrUoPGPS9hPi7tfvnlDnLZ+KwWj5BfRr9Xex4YRwHLOi1Ithmy9bL?=
 =?us-ascii?Q?imKwJbX9SpUCK9Rfmmc+WzmbUgJYMHIPxct91tcDb7Y9LWL89X/7yojWkJdh?=
 =?us-ascii?Q?w1goPWitvLL2zHetiToC/IX4JGyIQTdZespuegoNE8VQoU45AYL0oXQn0zIP?=
 =?us-ascii?Q?UXs0xHm9OKFcMmSoPIJ2xLmyK+jLlE3RquSqkpkgXhOBwMoNmqBrhKhkg99D?=
 =?us-ascii?Q?JXchOTq5LDWfeK061FMu5D3UxwU9hAvqi5Ufi8GLxs8kHCPwjNBLHe9u0fej?=
 =?us-ascii?Q?IaBme2TyPJjggY5NA61ayAwm8FVB7Xva1Mrh9NJX3xcGEMQXHSokPDz9onVR?=
 =?us-ascii?Q?8ya5ACy6Fjt79GhAhdLJdG0Z6Kh0iuDsfY/1odvkUmtod/vkE63bVbikNgHx?=
 =?us-ascii?Q?GLY9XaAJO4GqZZl7O7C8farEa+cEDgrdJNVjotXlmSoZFDc2QcaQ3WAYvPuJ?=
 =?us-ascii?Q?LMXF6xxAUU3cAj7/DNNEoBh6Uv00Gk/PD4WAohwclsZX9/P3Y+pKWytOhRz8?=
 =?us-ascii?Q?r+nMeCMekwB9KwqD1a+KOqMX8Iom13ALwVTvBS0mXRjCkDrsYaxHoKhDNol4?=
 =?us-ascii?Q?uJByOX49ymVO1t9HlCf9Ola5iIBaTEDF56S3lsrTSXjKbdbolvRMecSlPZ64?=
 =?us-ascii?Q?MFmqnReY45ZBE5w2Aym2JoS9hdDl12G2Htgyzn0mnI/x91xemYHzvANmrk8N?=
 =?us-ascii?Q?Ub2A+PxsfAufRWMqDQrQ+OKOAzlkWENnnJ9CqQhDa48k1ubHIW5R62mP6h21?=
 =?us-ascii?Q?iR0BAn4dFCdgwYqV+9Bhau2C7zK7ZSwwQ/c1zryGMKdS68+jIFnyGEtCQ+65?=
 =?us-ascii?Q?7KMv8uUrck2ce7klSCsXXCzB5IrTrbRViOmNtz/o+eloqANixCqGiCFxwhM/?=
 =?us-ascii?Q?xi0p9jHGrtA77whzrZ3n2SKy7c8tkene/PdZr4ZvQIm4d3rkUQ0fc9VnJJE8?=
 =?us-ascii?Q?++eyXsarXKbKDX/7S/opjrik0kEYvQuLMY0KwOgQXRAFJDMdJE4BkomaQLZo?=
 =?us-ascii?Q?DRevfjpPDkz1R2ooY6abawhajMYM3kuUZVJyAX/X7DnPJeqtIQIgAOyuxL84?=
 =?us-ascii?Q?VedOwVn9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4537ef-6994-45b5-d2f3-08d8bd95a1f8
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4572.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 22:49:23.9763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SfWvBVTOyiuqz0JCYRei2SJmYhzibiIVMck8rHFxZZU4uOlffgHbT2eMTDc85lZMS91OTh8nI9yhUu9qRSntNYBYSF++WKNSt7u18jZG/NI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4441
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200131

When toolstack updates MSR policy, this MSR offset (which is the last
index in the hypervisor MSR range) is used to indicate hypervisor
behavior when guest accesses an MSR which is not explicitly emulated.

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
Changes in v2:
* Use 0x400002ff for MSR_UNHANDLED
* Pass ignore_msrs in msr_policy.value

 xen/arch/x86/msr.c            |  4 ++--
 xen/include/xen/lib/x86/msr.h | 17 ++++++++++++++++-
 xen/lib/x86/msr.c             |  2 ++
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index be8e36386250..433d16c80728 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -295,7 +295,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         }
 
         /* Fallthrough. */
-    case 0x40000200 ... 0x400002ff:
+    case 0x40000200 ... 0x400002fe:
         ret = guest_rdmsr_xen(v, msr, val);
         break;
 
@@ -514,7 +514,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         }
 
         /* Fallthrough. */
-    case 0x40000200 ... 0x400002ff:
+    case 0x40000200 ... 0x400002fe:
         ret = guest_wrmsr_xen(v, msr, val);
         break;
 
diff --git a/xen/include/xen/lib/x86/msr.h b/xen/include/xen/lib/x86/msr.h
index 48ba4a59c036..fbbb3b7ba870 100644
--- a/xen/include/xen/lib/x86/msr.h
+++ b/xen/include/xen/lib/x86/msr.h
@@ -2,8 +2,21 @@
 #ifndef XEN_LIB_X86_MSR_H
 #define XEN_LIB_X86_MSR_H
 
+/*
+ * Behavior on accesses to MSRs that are not handled by emulation:
+ *  0 = return #GP, warning emitted
+ *  1 = read as 0, writes are dropped, no warning
+ *  2 = read as 0, writes are dropped, warning emitted
+ */
+#define MSR_UNHANDLED_NEVER     0
+#define MSR_UNHANDLED_SILENT    1
+#define MSR_UNHANDLED_VERBOSE   2
+
+/* MSR that is not explicitly processed by emulation */
+#define MSR_UNHANDLED           0x400002ff
+
 /* Maximum number of MSRs written when serialising msr_policy. */
-#define MSR_MAX_SERIALISED_ENTRIES 2
+#define MSR_MAX_SERIALISED_ENTRIES 3
 
 /* MSR policy object for shared per-domain MSRs */
 struct msr_policy
@@ -45,6 +58,8 @@ struct msr_policy
             bool taa_no:1;
         };
     } arch_caps;
+
+    uint8_t ignore_msrs;
 };
 
 #ifdef __XEN__
diff --git a/xen/lib/x86/msr.c b/xen/lib/x86/msr.c
index 7d71e92a380a..178203803946 100644
--- a/xen/lib/x86/msr.c
+++ b/xen/lib/x86/msr.c
@@ -40,6 +40,7 @@ int x86_msr_copy_to_buffer(const struct msr_policy *p,
 
     COPY_MSR(MSR_INTEL_PLATFORM_INFO, p->platform_info.raw);
     COPY_MSR(MSR_ARCH_CAPABILITIES,   p->arch_caps.raw);
+    COPY_MSR(MSR_UNHANDLED,           p->ignore_msrs);
 
 #undef COPY_MSR
 
@@ -101,6 +102,7 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
 
         case MSR_INTEL_PLATFORM_INFO: ASSIGN(platform_info.raw); break;
         case MSR_ARCH_CAPABILITIES:   ASSIGN(arch_caps.raw);     break;
+        case MSR_UNHANDLED:           ASSIGN(ignore_msrs);       break;
 
 #undef ASSIGN
 
-- 
1.8.3.1


