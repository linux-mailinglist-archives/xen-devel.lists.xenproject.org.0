Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D532FDCB8
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 23:50:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71799.128880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2MI9-00037J-6J; Wed, 20 Jan 2021 22:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71799.128880; Wed, 20 Jan 2021 22:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2MI9-00036u-3G; Wed, 20 Jan 2021 22:49:33 +0000
Received: by outflank-mailman (input) for mailman id 71799;
 Wed, 20 Jan 2021 22:49:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F2v3=GX=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l2MI8-00036p-2O
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 22:49:32 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3385a017-774e-43ac-ba07-acc6b5d7a700;
 Wed, 20 Jan 2021 22:49:30 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KMmZHW108569;
 Wed, 20 Jan 2021 22:49:28 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 3668qrctw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 22:49:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KMei62150786;
 Wed, 20 Jan 2021 22:49:27 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by userp3020.oracle.com with ESMTP id 3668qx3dcw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 22:49:27 +0000
Received: from SA2PR10MB4572.namprd10.prod.outlook.com (2603:10b6:806:f9::18)
 by SA2PR10MB4441.namprd10.prod.outlook.com (2603:10b6:806:11d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Wed, 20 Jan
 2021 22:49:25 +0000
Received: from SA2PR10MB4572.namprd10.prod.outlook.com
 ([fe80::4c5b:9cf:616d:b140]) by SA2PR10MB4572.namprd10.prod.outlook.com
 ([fe80::4c5b:9cf:616d:b140%6]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 22:49:25 +0000
Received: from ovs104.us.oracle.com (209.17.40.41) by
 BYAPR03CA0002.namprd03.prod.outlook.com (2603:10b6:a02:a8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 22:49:24 +0000
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
X-Inumbo-ID: 3385a017-774e-43ac-ba07-acc6b5d7a700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=dCXkXSta+TTp5MqacSTXoq1rfECu1lT3kCVoJmd6hDA=;
 b=tcRmiUQ0F19LuHVDdAMR5/CM3NXQL7spHgWFGxLsB0CmlD3VPm0qgMtI4oYOQ98tGuDQ
 K2XcGk88D032goW9agTHzwYsqxDTOvjf144FGM4OQDEqBH08jhATIoVYF2APPcOOAAgY
 sduXhmPV8SXH7zUOkE9l3fMQ36zJmA4M9Knb9dn8hgev6/I7wUm+AZSK6sycgYXMAKpP
 m+yWvKCEkMsmMJpDs3/DLByb2TaiN/JTeb7o9rx83SiPdVcL4hPMBGYCJHoMhudhm9CC
 Q0/tARhEk80CP3j/bEKbTucweDfKEUz9Caqv7BKSMInlpjk5S9BA6fLt1l7D/5DEn5K3 ZQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hE2SOXghGeHsyNcoK1XZkmskvD7M8v5bXR9M0yRl47/lkfgoOYI9kDdOyGrDrxic7C4U+1+z8Fic39ujVCACXuTRH61le7W+vGfx94nVeJUgeCqgJenhiaygNytiInx0QlWpZScObtP8AzQ1fo2vyGHJb0HmwaApi5wVK4hwDvogzdtfQm2qZpN4lP9b29ZQgnt37nr1V3vpzzv6ywgzDuRMXnfFyYLGh6197IkejvJwKZPgIKUZgXMbwJf88gYZvBS6ry7tO+rU+lZuiccqBbrKYooVvHh2ci1yuHo3xAS0aLvBF6KrOxWvf/pe0awTXOT8QpFgTzDX93RwZA9blg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCXkXSta+TTp5MqacSTXoq1rfECu1lT3kCVoJmd6hDA=;
 b=Uef6ywOxhlEpLqt+Ltva+/oA9tHDR3jAOQ4jmDLTXdpk3usN6wPUxWUkwT449r6v8UPMWXGK20/pBlWKIbWqBTSfKQFOZQuj+TKv5h5F2p7ikTuzcNLWEGCOifTjXWqVX1KsBSYJGVO23IXEMQoRsXgkM8Qh/d6DjgWfaHYa/A0cxqfMc1JxN23su40u25dKrJ8BE/guBYPiC5rPRDSwfnMFJDFuBpZFafJw/Ejn/o0YxM6+Ha7HOupSaf0HxleYCBPqllIHAdUJZe4vfg/dF9alzhoFGsR38mzTrYn/N6yoQyz5oSshE9KHZjHlirHLChHewbpTw8mt7D5cAJRpmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCXkXSta+TTp5MqacSTXoq1rfECu1lT3kCVoJmd6hDA=;
 b=o1w1mdaiN0vrrKHvOQJgayjIXNpThRJJPf2Ggw/SE635dj5sy15Xi9THALK+CATy64Cob8m2Chpz2DGFbCPRqReeR5OcZSixwVgNx+WuMZFSwwROFy9ol19tjNu5eHqk5NKw41v4e5lhLyZTf8NiYtXwo2viSD02VENInNCGNgE=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        boris.ostrovsky@oracle.com
Subject: [PATCH v2 3/4] x86: Allow non-faulting accesses to non-emulated MSRs if policy permits this
Date: Wed, 20 Jan 2021 17:49:11 -0500
Message-Id: <1611182952-9941-4-git-send-email-boris.ostrovsky@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 77d7f799-3921-46e2-a7a1-08d8bd95a304
X-MS-TrafficTypeDiagnostic: SA2PR10MB4441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA2PR10MB44414A09A1B4CDC0BD0045A48AA20@SA2PR10MB4441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1K5vKl67xC4MlDEofZ+oa83UTVz9k8vs36TZTxr4ohEWjUU573Cq/l1fLA8HLZHYlbRhNzVElVuKlQULgQb25JhblrgV6FbKR/eL0Z4jHoaDo0bxQCx9eDVmfhsM+eMJQFcgrGd45rplwn2r+qeTvU1S1s7RuRh2Qt2MvBqEqbLFawk98TOoT+9dPDLJRlpREEud/SN9e83nPTL086P9eK9HwDKN8ljknyAf4Udrj7KY+4zgYIBKUuAQuGLJSo3P+fIjIi8gZlSxNQe2nMmJoBOthB4cHJE3SQqYtqhJ4Ah2g6Ai08TERUhIuVv/WZ42VBwWSQLeCHFNAwtC8wm+7p1PtqZqBqb3vPv2Q5c/8N/Wh2U2YKz8Wi6qe12aw8pqyQkZ1QAT/PPZqrsOVkZm+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4572.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(396003)(39860400002)(376002)(316002)(2906002)(52116002)(5660300002)(26005)(4326008)(86362001)(66556008)(36756003)(7696005)(508600001)(186003)(44832011)(6916009)(2616005)(8936002)(66946007)(6666004)(16526019)(956004)(6486002)(107886003)(66476007)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?f0r9v+GbN2MwVeBf0w8J2zTUuHjXyGFP2x8w6DFokhiG4dQ0aY0hTFXKLCVX?=
 =?us-ascii?Q?/KKtEqFZo6zcY88Bd6CmmXYlckmLVkbgh13vE7Ia5W3mS1CTjL6gKhYJ9adD?=
 =?us-ascii?Q?EprdM6jKLb7rNxs6OE5p0eQokNvVG+RfheLW3xwNiaOnORwXT8gGvqbVJ8xd?=
 =?us-ascii?Q?DBpHthEx9VPGXBzXPFD7YXKti2vOpwbh7KkWn66o8u2AaO2R3agRvIe9Oh9l?=
 =?us-ascii?Q?7O4GjhmTra7DnBuPtjEJybjaJCVjshBDT/mKcHZgPrrNZ27WXLMWw0OZabSo?=
 =?us-ascii?Q?Jc3M/LHachReyipZKd690ipysoTm0eF98KIpBUgpoQTjw6dkaGllXrRtgEAU?=
 =?us-ascii?Q?S51mLSY6eFXKW/chL1VQqw3RhkKFLkrCd9H6+/ctpTbeLAEoWLtw0eswhEma?=
 =?us-ascii?Q?e4YWczwoEg4m+kXT6q3BA5Ku4Smq0ulMzBD0bYmnP8jcGweEPCY4U1DXIRVM?=
 =?us-ascii?Q?C1VKfrNkKIuXwy96w4y9QFuuGMkinK64hP5Qcdg1uVbVxuF+Jd/RI/sF2t9f?=
 =?us-ascii?Q?rbOoYsCFfw3Ajt8B4Iorl6YbtOkSHbu8HG2SySEMc6AHY/aRQl37Be+/aY5i?=
 =?us-ascii?Q?Y8DnWVAqCN45BVs9b8DMJ14MI5D2lp51V0QDiYvKwfVI2d4LiR4U5Xji9RQ7?=
 =?us-ascii?Q?118CixHJ8AexOFJkRwHGEPmphRZoSAqvjZ82RC4aMd4a64wH/niRx0IfVfUE?=
 =?us-ascii?Q?g7q1XTKiwMpfcQJPTWNjdirfkS6Oh8u2FhjnxFIffr3MmnNarj7BtY61So1h?=
 =?us-ascii?Q?Vf8nKhgHMvSciZAfQGl52opVdJbZ43YeaA3vMimoRQN8GAlKq+Am+J41nYhQ?=
 =?us-ascii?Q?7r0M/2WnFMuDempPE+KJgYOO9XI2tMihsHw1Qxt0CRdRgwJNK1zqZHriVjPb?=
 =?us-ascii?Q?vcOTcLR6yoeiyPsaxAthFmbiGkRubpPTrn8m/PuBgIUx2WiKuHAh3O7vtc6N?=
 =?us-ascii?Q?Wsr8s2N0FGt7SIiS21fjTgXgPAhg3FfLfCudU66fAUv92U87XlNYlY6nNPFm?=
 =?us-ascii?Q?EbUxOk7FZIXYx4KoSvgIp53MXi9N4aTESbsaytUTlH09lNcXZ0Ga84GJdIU7?=
 =?us-ascii?Q?0E6/0P09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d7f799-3921-46e2-a7a1-08d8bd95a304
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4572.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 22:49:25.7146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/0kJfC+7nrAVGBOjI3a3L4m+XOAt3Drj5LrolztTwOe7LRmfLLxpzpNyh/sI2+DwPI4A5/jGvLEtCuoWIIlzZ/yk9wN4PSeIeRWsfr4sDw=
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

Starting with commit 84e848fd7a16 ("x86/hvm: disallow access to unknown MSRs")
accesses to unhandled MSRs result in #GP sent to the guest. This caused a
regression for Solaris who tries to acccess MSR_RAPL_POWER_UNIT and (unlike,
for example, Linux) does not catch exceptions when accessing MSRs that
potentially may not be present.

Instead of special-casing RAPL registers we decide what to do when any
non-emulated MSR is accessed based on ignore_msrs field of msr_policy.

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
Changes in v2:
* define x86_emul_guest_msr_access() and use it to determine whether emulated
  instruction is rd/wrmsr.
* Don't use ignore_msrs for MSR accesses that are not guest's rd/wrmsr.
* Clear @val for writes too in guest_unhandled_msr()

 xen/arch/x86/hvm/svm/svm.c             | 10 ++++------
 xen/arch/x86/hvm/vmx/vmx.c             | 10 ++++------
 xen/arch/x86/msr.c                     | 28 ++++++++++++++++++++++++++++
 xen/arch/x86/pv/emul-priv-op.c         | 10 ++++++----
 xen/arch/x86/x86_emulate/x86_emulate.h |  6 ++++++
 xen/include/asm-x86/msr.h              |  3 +++
 6 files changed, 51 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b819897a4a9f..7b59885b2619 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1965,8 +1965,8 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
         break;
 
     default:
-        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
-        goto gpf;
+        if ( guest_unhandled_msr(v, msr, msr_content, false, true) )
+            goto gpf;
     }
 
     HVM_DBG_LOG(DBG_LEVEL_MSR, "returns: ecx=%x, msr_value=%"PRIx64,
@@ -2151,10 +2151,8 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         break;
 
     default:
-        gdprintk(XENLOG_WARNING,
-                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
-                 msr, msr_content);
-        goto gpf;
+        if ( guest_unhandled_msr(v, msr, &msr_content, true, true) )
+            goto gpf;
     }
 
     return X86EMUL_OKAY;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 2d4475ee3de2..87baca57d33f 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3017,8 +3017,8 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
             break;
         }
 
-        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
-        goto gp_fault;
+        if ( guest_unhandled_msr(curr, msr, msr_content, false, true) )
+            goto gp_fault;
     }
 
 done:
@@ -3319,10 +3319,8 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
              is_last_branch_msr(msr) )
             break;
 
-        gdprintk(XENLOG_WARNING,
-                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
-                 msr, msr_content);
-        goto gp_fault;
+        if ( guest_unhandled_msr(v, msr, &msr_content, true, true) )
+            goto gp_fault;
     }
 
     return X86EMUL_OKAY;
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 433d16c80728..a57d838f642b 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -164,6 +164,34 @@ int init_vcpu_msr_policy(struct vcpu *v)
     return 0;
 }
 
+/* Returns true if policy requires #GP to the guest. */
+bool guest_unhandled_msr(const struct vcpu *v, uint32_t msr, uint64_t *val,
+                         bool is_write, bool is_guest_msr_access)
+{
+    u8 ignore_msrs = v->domain->arch.msr->ignore_msrs;
+
+    /*
+     * Accesses to unimplemented MSRs as part of emulation of instructions
+     * other than guest's RDMSR/WRMSR should never succeed.
+     */
+    if ( !is_guest_msr_access )
+        ignore_msrs = MSR_UNHANDLED_NEVER;
+
+    if ( unlikely(ignore_msrs != MSR_UNHANDLED_NEVER) )
+        *val = 0;
+
+    if ( likely(ignore_msrs != MSR_UNHANDLED_SILENT) )
+    {
+        if ( is_write )
+            gdprintk(XENLOG_WARNING, "WRMSR 0x%08x val 0x%016"PRIx64
+                    " unimplemented\n", msr, *val);
+        else
+            gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
+    }
+
+    return (ignore_msrs == MSR_UNHANDLED_NEVER);
+}
+
 int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 {
     const struct vcpu *curr = current;
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index dbceed8a05fd..6b378dbe2239 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -984,7 +984,9 @@ static int read_msr(unsigned int reg, uint64_t *val,
         }
         /* fall through */
     default:
-        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
+        if ( !guest_unhandled_msr(curr, reg, val, false,
+                                  x86_emul_guest_msr_access(ctxt)) )
+            return X86EMUL_OKAY;
         break;
 
     normal:
@@ -1146,9 +1148,9 @@ static int write_msr(unsigned int reg, uint64_t val,
         }
         /* fall through */
     default:
-        gdprintk(XENLOG_WARNING,
-                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
-                 reg, val);
+        if ( !guest_unhandled_msr(curr, reg, &val, true,
+                                  x86_emul_guest_msr_access(ctxt)) )
+            return X86EMUL_OKAY;
         break;
 
     invalid:
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index d8fb3a990933..06e6b7479f37 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -850,4 +850,10 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
     ctxt->event = (struct x86_event){};
 }
 
+static inline bool x86_emul_guest_msr_access(struct x86_emulate_ctxt *ctxt)
+{
+    return ctxt->opcode == X86EMUL_OPC(0x0f, 0x32) ||  /* RDMSR */
+           ctxt->opcode == X86EMUL_OPC(0x0f, 0x30);    /* WRMSR */
+}
+
 #endif /* __X86_EMULATE_H__ */
diff --git a/xen/include/asm-x86/msr.h b/xen/include/asm-x86/msr.h
index 16f95e734428..e7d69ad5bf29 100644
--- a/xen/include/asm-x86/msr.h
+++ b/xen/include/asm-x86/msr.h
@@ -345,5 +345,8 @@ int init_vcpu_msr_policy(struct vcpu *v);
  */
 int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val);
 int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val);
+bool guest_unhandled_msr(const struct vcpu *v, uint32_t msr,
+                         uint64_t *val, bool is_write,
+                         bool is_guest_msr_access);
 
 #endif /* __ASM_MSR_H */
-- 
1.8.3.1


