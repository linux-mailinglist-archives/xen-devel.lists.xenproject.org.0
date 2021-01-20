Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA802FDCB9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 23:50:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71801.128905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2MIE-0003CT-Ub; Wed, 20 Jan 2021 22:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71801.128905; Wed, 20 Jan 2021 22:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2MIE-0003Br-QX; Wed, 20 Jan 2021 22:49:38 +0000
Received: by outflank-mailman (input) for mailman id 71801;
 Wed, 20 Jan 2021 22:49:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F2v3=GX=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l2MIC-00036p-Un
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 22:49:36 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aef0beba-4a20-47e6-8d6d-8b02c1af16b5;
 Wed, 20 Jan 2021 22:49:33 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KMmwgN109063;
 Wed, 20 Jan 2021 22:49:31 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 3668qrctwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 22:49:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KMeh5Z150753;
 Wed, 20 Jan 2021 22:49:30 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by userp3020.oracle.com with ESMTP id 3668qx3deg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 22:49:30 +0000
Received: from SA2PR10MB4572.namprd10.prod.outlook.com (2603:10b6:806:f9::18)
 by SA2PR10MB4441.namprd10.prod.outlook.com (2603:10b6:806:11d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Wed, 20 Jan
 2021 22:49:27 +0000
Received: from SA2PR10MB4572.namprd10.prod.outlook.com
 ([fe80::4c5b:9cf:616d:b140]) by SA2PR10MB4572.namprd10.prod.outlook.com
 ([fe80::4c5b:9cf:616d:b140%6]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 22:49:27 +0000
Received: from ovs104.us.oracle.com (209.17.40.41) by
 BYAPR03CA0002.namprd03.prod.outlook.com (2603:10b6:a02:a8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 22:49:26 +0000
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
X-Inumbo-ID: aef0beba-4a20-47e6-8d6d-8b02c1af16b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Oj10fCSZwO/WpTZ8RIssk6cUWjwKr9DC0gs2ITsGH3s=;
 b=zwuPQYXN5PQ6X5aZkvt+mwS+BTwJEYYbxZQqHAYMD84LuOiJHIqFECuu2P1IrnXxt9WP
 fNfwWXOg2wgV3/QTcpqlmF3sJYVcqW6qmL93gyJVh8GviwU5j3oV/80GD+bPihqkSPF7
 cNtrEyBbzC+qs4hZRvSbYP5e+POkef8X817zmpGMI0nzsoBgNvy2cQ7lLbuUQho12Clv
 +5eI3cO12ebS9zqemyeuazuZ7hZUyfF19b2jp2pfYjU8gJ1L8QrvCYbV2TkY3aIEgqZy
 Qz7HEquRRTNrmJh7b1pQH+Y+DhHZNRQvBVJ8T3pFmwrxx37ogQ6lhOKZ7rgFOROd89UF bw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmnnoGFtaY4BQWSHjDG1gHOR1LmrsMsUbs/RZM4e70atfciBH0N2RZox9TO3TanIn+siqdJqM0RTsd6tJ9Fzj1kUWuDf66B6VW5rXbGsXq87Y7rJLOgGBOuxqva499cgcn+1/QtsQ370AmImCXZwwuibF3ESjdkOSUmd3MK68vIU1sq62RodUsTpEOVIsUvfhQ5mZG4ltYlzJuNOzUqXWrVYDv5+nPg/xnWDW7gViYyAHjIDpNeB5axStrKPZ6RN8FAjDNkDKxMBLmaSHGECCJa2vpYbxvbdUGMRjADMPlavOhByDopp2pgDwjynEDt4+xdmGr/a/nSNJgLUvO2S7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oj10fCSZwO/WpTZ8RIssk6cUWjwKr9DC0gs2ITsGH3s=;
 b=fFiulH10inlrgaYcvufe+jNX81eP6R3YjauHQHGC9y6MQU7tt913tUunrL4fWtVodFdq/4LjPFhiaO4d6muHo64PZabPFKSG9asBvwuD6qzoPm+xJqyJBipDjbln5Jw8KT3UPBpefOEGlT/cBARhrjs2kGX+jihrrtalovHz1I2dUdt7noc0vr5iRdapgbbvL2tiHvs0gUUIAcsUpqRqcoQJPmtQgcL+9nvCBN+mIwdHeYSOwi3ZNqXmD4sPvHiUeRmy7MPaeMC1iEiwURuJVvAkj8rkR6nH1YHQRwD7e6oeftCbjHJFTc6A1CiAzbXFpYOhvdj7wOJsUFzA/kZStw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oj10fCSZwO/WpTZ8RIssk6cUWjwKr9DC0gs2ITsGH3s=;
 b=R7GaKCHgfA3VfTPDsPGR3RQXOaOmYewTkrUpXFSm2Msw/2cF9SclA1hYHRIm7vODkOMlnGJ3BpmMAVYDkDZe29SYfgNEqXvn1ObnFBc3ZlOuZ9zgjW/xAJBfqi+mXaPwEajE2ubhqDZgOttaSeFlWjsCUkraHU+5YRfNtPzI88Q=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        boris.ostrovsky@oracle.com
Subject: [PATCH v2 4/4] tools/libs: Apply MSR policy to a guest
Date: Wed, 20 Jan 2021 17:49:12 -0500
Message-Id: <1611182952-9941-5-git-send-email-boris.ostrovsky@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 36d4a4a2-07f3-4142-6296-08d8bd95a418
X-MS-TrafficTypeDiagnostic: SA2PR10MB4441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA2PR10MB4441B8E5485592815350B3FC8AA20@SA2PR10MB4441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FcgBnX9irMxE/1wNEXqHvGpGSPLmGc+THehLl3bk3a/ZGa7sjGvltG8lCB3oIUp0B64xX6/ZhVul6ARr9vfIbWxFy09HlqyZRJYsfUfogIxNvbly73CrgRBH+kbBRRRXf6g0/eoqNwd0oUju5/ejToq86s8WOXaxHSjqZ5pY/i7zeE9uOqr7PXw91tUdX8U6FI+7IXvRq0ggxvQ2s2YA93HQeUpLRhZH0Y6XIJlqpX+JCPeHxVXOrHNzhMw+dt3jqzKNUClmYJVWeR9axanLNYDLxRe78/3v41CkF23DyncaFXtfqKUrwKKc2pSkt4G5aMoOmyMGVRxZbrozshj98sPf/81uoVnDt98FziZeKTzTdQEqaw2dl1UANRdLXb6ypoIQoVNCWxM/KkP/Y6+jPk8Nw9OX3RsZ2DxuPd7odKkGj9SigCPqJUuHvOVJxpRvT53vHSvT06oFG5D3MPERB2C9iEGUvdxrlfmjZLTkRbZS2hW5lqHvvbsA/E9Vo9ZgKsq+51faUPZOKUeX7+aCVA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4572.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(396003)(39860400002)(376002)(316002)(2906002)(52116002)(5660300002)(26005)(4326008)(86362001)(66556008)(36756003)(7696005)(508600001)(186003)(44832011)(6916009)(2616005)(8936002)(66946007)(6666004)(16526019)(956004)(6486002)(107886003)(66476007)(83380400001)(8676002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?hAWrZxLWJlQO5G1J7MBE5Yk9JqVbO0B66YMtMPqV31+XVtE57xEsAGfZT/Q2?=
 =?us-ascii?Q?AaruZwmHUVf1+WDPkj+EjF4YQkhhNukr32dV1resjRs5oHG3Pvd5Tu/l7BKu?=
 =?us-ascii?Q?0tp5Rg18xyqXXFv4P6DC4s+PEruqm8euofBBOytHxoaksKNkqCC6WPU04nWO?=
 =?us-ascii?Q?FMMv+Etw1LTsuwc6Pwl9AKUD5MKFyHXld6XqYf6s1cVRwekpVzNhkRAyRptU?=
 =?us-ascii?Q?Sl0gzFoTUiCD/wci3+zdaukMcR190PPsRbEkiEXkdHkohvafTStij7qg2svk?=
 =?us-ascii?Q?VC448OQlq25135kuBoacSV/h9Q3S11DCmtpQfrhJVcCt+EzPRLlqYygMxlPu?=
 =?us-ascii?Q?qkO5/PiStbXkGnSePvLy8moB66bDKD5zuCAgZdkTu7OyA1V/l43fhnbHlO4z?=
 =?us-ascii?Q?mdAzDGe4hAcGovtFYtfYz8ODiu3xCNIXDSuedRD4D9BtDArjvKykFfE/sc3Y?=
 =?us-ascii?Q?nq4l9zjQkl9yZXmQs/H7hTMpEdBHjC7SKnEA26yt8ErpGWeS+gvdSXuT2noO?=
 =?us-ascii?Q?okZdOzi1s4tjq1BguzWhMKMkzJCruo++h79Ynj/hW7qWzM3OuVeTyXdw7TX0?=
 =?us-ascii?Q?nLtlPa+VxLcEVE9UclKoIkFAjUbtLKM8FMoI6uZ+jOgyrmXwrnrT4kiZc/5s?=
 =?us-ascii?Q?oSrTLtOLVxmKdE9wFyUIWVUuUVIsTg/gNxbBEkRtVw3q0S8r+5mTCpdRrM3U?=
 =?us-ascii?Q?mMxL6b23WhuFk11zSgJg1LbCweOKpcufzBFWd3zGPIjvTZ2XPmj0NakzlOtI?=
 =?us-ascii?Q?cj29q4DDJQMNkJHyvZVCwB7nStO2qAprg3XDU0F3D2RFZi96mcmEDYMf3H2V?=
 =?us-ascii?Q?ycJhQXNH4NLaxElwVwyUJs6wo8kx24jQe7kYNaN7DobCKywwYxp04b1KsUtC?=
 =?us-ascii?Q?89OUu8Q0QAccIpaPBHVJPOKSSbrGlfNEqrEoRMP4Xg9PCBoFaRD4TMKhyxRV?=
 =?us-ascii?Q?0mDkoR1DWtYpM/J550o5++GHtB4UrIgIJjcXD93U9bV8zHfWvs06yiWO2Odw?=
 =?us-ascii?Q?utaL8apS94MjP4E0Wt7L3Kd7bcpv7VORAssBmbMB8vBZ60Of0E16yIfQDWAv?=
 =?us-ascii?Q?sY4C8XtJ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d4a4a2-07f3-4142-6296-08d8bd95a418
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4572.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 22:49:27.6282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lC+1Z/YlEHc6Wc4zIjb+97iDzwfvdriZJ8YqgTdv90WWl+dZu3nHYukzR0iDsAQXWwOl6YBVSpmeG3i4vknfL+Ul9MTOcODIQzWz9Ow3zlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4441
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200131

When creating a guest, if ignore_msrs option has been specified,
apply it to guest's MSR policy.

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 tools/include/xenctrl.h           |   2 +
 tools/libs/guest/Makefile         |   1 +
 tools/libs/guest/xg_msrs_x86.c    | 110 ++++++++++++++++++++++++++++++++++++++
 tools/libs/light/libxl_dom.c      |   5 +-
 tools/libs/light/libxl_internal.h |   2 +
 tools/libs/light/libxl_x86.c      |   7 +++
 6 files changed, 125 insertions(+), 2 deletions(-)
 create mode 100644 tools/libs/guest/xg_msrs_x86.c

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 3796425e1eca..1d6a38e73dcf 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1835,6 +1835,8 @@ int xc_cpuid_apply_policy(xc_interface *xch,
                           const uint32_t *featureset,
                           unsigned int nr_features, bool pae, bool itsc,
                           bool nested_virt, const struct xc_xend_cpuid *xend);
+int xc_msr_apply_policy(xc_interface *xch, uint32_t domid,
+                        unsigned int ignore_msr);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 1c729040b337..452155ea0385 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -56,6 +56,7 @@ SRCS-y                 += xg_dom_compat_linux.c
 
 SRCS-$(CONFIG_X86)     += xg_dom_x86.c
 SRCS-$(CONFIG_X86)     += xg_cpuid_x86.c
+SRCS-$(CONFIG_X86)     += xg_msrs_x86.c
 SRCS-$(CONFIG_ARM)     += xg_dom_arm.c
 
 ifeq ($(CONFIG_LIBXC_MINIOS),y)
diff --git a/tools/libs/guest/xg_msrs_x86.c b/tools/libs/guest/xg_msrs_x86.c
new file mode 100644
index 000000000000..464ce9292ad8
--- /dev/null
+++ b/tools/libs/guest/xg_msrs_x86.c
@@ -0,0 +1,110 @@
+/******************************************************************************
+ * xc_msrs_x86.c
+ *
+ * Update MSR policy of a domain.
+ *
+ * Copyright (c) 2021, Oracle and/or its affiliates.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "xc_private.h"
+#include "xen/lib/x86/msr.h"
+
+
+
+int xc_msr_apply_policy(xc_interface *xch, uint32_t domid, unsigned int ignore_msr)
+{
+    int rc;
+    unsigned int nr_leaves, nr_msrs;
+    xen_msr_entry_t *msrs = NULL;
+    struct msr_policy *p = NULL;
+    xc_dominfo_t di;
+    unsigned int err_leaf, err_subleaf, err_msr;
+
+    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
+         di.domid != domid )
+    {
+        ERROR("Failed to obtain d%d info", domid);
+        rc = -ESRCH;
+        goto out;
+    }
+
+    rc = xc_get_cpu_policy_size(xch, &nr_leaves, &nr_msrs);
+    if ( rc )
+    {
+        PERROR("Failed to obtain policy info size");
+        rc = -errno;
+        goto out;
+    }
+
+    rc = -ENOMEM;
+    if ( (msrs = calloc(nr_msrs, sizeof(*msrs))) == NULL ||
+         (p = calloc(1, sizeof(*p))) == NULL )
+        goto out;
+
+    /* Get the domain's default policy. */
+    nr_leaves = 0;
+    rc = xc_get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                              : XEN_SYSCTL_cpu_policy_pv_default,
+                                  &nr_leaves, NULL, &nr_msrs, msrs);
+    if ( rc )
+    {
+        PERROR("Failed to obtain %s default policy", di.hvm ? "hvm" : "pv");
+        rc = -errno;
+        goto out;
+    }
+
+    rc = x86_msr_copy_from_buffer(p, msrs, nr_msrs, &err_msr);
+    if ( rc )
+    {
+        ERROR("Failed to deserialise MSR (err msr %#x) (%d = %s)",
+              err_msr, -rc, strerror(-rc));
+        goto out;
+    }
+
+    p->ignore_msrs = ignore_msr;
+
+    rc = x86_msr_copy_to_buffer(p, msrs, &nr_msrs);
+    if ( rc )
+    {
+        ERROR("Failed to serialise MSR (%d = %s)", -rc, strerror(-rc));
+        goto out;
+    }
+
+    nr_leaves = 0;
+    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, NULL, nr_msrs, msrs,
+                                  &err_leaf, &err_subleaf, &err_msr);
+    if ( rc )
+    {
+        PERROR("Failed to set d%d's MSR policy (err leaf %#x, subleaf %#x, msr %#x)",
+               domid, err_leaf, err_subleaf, err_msr);
+        rc = -errno;
+    }
+
+out:
+    free(msrs);
+    free(p);
+
+    return rc;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
+
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 19168572fd3e..1f2abf6679d7 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -383,9 +383,10 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
     /* Construct a CPUID policy, but only for brand new domains.  Domains
      * being migrated-in/restored have CPUID handled during the
      * static_data_done() callback. */
-    if (!state->restore)
+    if (!state->restore) {
         libxl__cpuid_legacy(ctx, domid, false, info);
-
+        libxl__msr_policy(ctx, domid, info);
+    }
     return rc;
 }
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index c79523ba9248..4f369e6a6f14 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2054,6 +2054,8 @@ _hidden char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
 
 _hidden void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
                                  libxl_domain_build_info *info);
+_hidden void libxl__msr_policy(libxl_ctx *ctx, uint32_t domid,
+                               libxl_domain_build_info *info);
 
 /* Calls poll() again - useful to check whether a signaled condition
  * is still true.  Cannot fail.  Returns currently-true revents. */
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 86d272999d67..92ec1da77139 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -1,5 +1,6 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
+#include "xen/lib/x86/msr.h"
 
 int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
@@ -838,6 +839,12 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+void libxl__msr_policy(libxl_ctx *ctx, uint32_t domid,
+                       libxl_domain_build_info *info)
+{
+    if (info->ignore_msrs != LIBXL_IGNORE_MSRS_NEVER)
+        xc_msr_apply_policy(ctx->xch, domid, info->ignore_msrs);
+}
 
 /*
  * Local variables:
-- 
1.8.3.1


