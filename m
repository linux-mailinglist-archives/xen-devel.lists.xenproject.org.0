Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4392C34D979
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 23:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103267.197073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQzER-0006TF-FT; Mon, 29 Mar 2021 21:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103267.197073; Mon, 29 Mar 2021 21:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQzER-0006Sl-Bb; Mon, 29 Mar 2021 21:15:31 +0000
Received: by outflank-mailman (input) for mailman id 103267;
 Mon, 29 Mar 2021 21:15:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmwh=I3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lQzEP-0006Pu-Qw
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 21:15:29 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2dc537ff-a2cb-40c2-bc38-571311742598;
 Mon, 29 Mar 2021 21:15:26 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12TL93X2149008;
 Mon, 29 Mar 2021 21:15:24 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 37hv4r50rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 21:15:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12TLAkVp131526;
 Mon, 29 Mar 2021 21:15:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by aserp3020.oracle.com with ESMTP id 37jekxp8rn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 21:15:23 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4416.namprd10.prod.outlook.com (2603:10b6:a03:2ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 21:15:21 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 21:15:21 +0000
Received: from bostrovs-us.us.oracle.com (209.17.40.37) by
 MW4PR04CA0095.namprd04.prod.outlook.com (2603:10b6:303:83::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Mon, 29 Mar 2021 21:15:18 +0000
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
X-Inumbo-ID: 2dc537ff-a2cb-40c2-bc38-571311742598
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ivlZR+JN8fPCmMqrrPDqj0Vqn0pzdwEdR9x+/IBM4g8=;
 b=Mcplh4EucM48vC0OsjgpeD4PFj9MXegkqwJi06KJBzzCd89XvueDhIHcKi57ao+kK95m
 1wbFcXN95PmyxChRnmRrwMV5f73jjQRl+/POICviirEeyKJp/KqbmcvqIdH8XuND9K6F
 kRqkszJwsnrRowPNRY952j46dX/wZlfK17zuwl46WJOYlXnF4CIqAUpDDMSC8X7OuJBE
 gtwpwhtfge1YeL7f6B3PVyAjGG309FW1MSam8jpeLpmQy8TBfC7ip7yYHoNkYsG1DeNd
 KtsVCR941BQyx0CibfUNkJqFYrulat+QjrT9tOvoo0YgXG//FzM16ceCX1riGGVraz6e lw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1AZhgISStcdkDVTC/CvbFIMZBumE7/TPl5bzOY5Hni9boGkLxnlbru+UHMT+NJYQeXUNYlQ/5Rhf/HgMlH38wgkSyBD+g0rsWVAMXo7BAW+6yfzHchoQQQYF31UcjLVLfspkyXNyduv6pk2JQZ6/pKTCxx0wqG7A9Ux04OSksLOF9rxPPH+7/oHdroXFhW673ZSOo1PbKJL8u1KqBJAc8YRwGqlhiL02fJCByEDH8q93IXx62lV8Hxu9hziay35r+3Lg7m1sOPBQFUD+rhaaqZon1NEXJZ8QtTpxv7+tlZp9rHCyapAIL1SF93iB+Zl106xyS5HzUYlJBYSBKeIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivlZR+JN8fPCmMqrrPDqj0Vqn0pzdwEdR9x+/IBM4g8=;
 b=Ge9NzWdV1aavrOFdGJNHeim2UkPqMgyJiKyHwr2ikQJTrNgwtkERNF0ZzywBn/QdSLWJHpwf5kob1+1FZED2+965Kq8L21B4SnnvO6Pg5+jHiauJK2/jHU5MqxQAZ2qX5lM8oiQdUmDH2HTgq2a1LKJgOQMzCII0UYAlmAATIWeoyXuKijWi3q/UmWGLq5Vjm9T8YA3EiaGdd2RBL1l5RR0wSNIhjt3b7mCHXXO37JQyjDFcBcIJ1v2uYJWJvW/Gjfp0NAW2T4oPVvuyRZWNDF+vv7Tg5vvmT28zbTAGJzvKSLsx/rz+LyOZe+v38sZqZdZ7C6lVD0ZWBJfwv8J1pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivlZR+JN8fPCmMqrrPDqj0Vqn0pzdwEdR9x+/IBM4g8=;
 b=UAqplVG4vs/2Bfh6x5OVNZFKhX/NtOwmXqsFCfgzqG9eJtCgzKOsIs+JCR/UlJnxwiYwWg5i31+bp9NTCaVTJjv/UuyHscxHSiIKzJ2+d6Km5FKYQd7aNgUAb4oNEFhHQEt91SYWV/j9ctLwcRznXNFloCgV/VY4KvVeg5Hbdmw=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        wl@xen.org, boris.ostrovsky@oracle.com, stephen.s.brennan@oracle.com,
        iwj@xenproject.org
Subject: [PATCH v3 2/2] x86/vpt: Simplify locking argument to write_{un}lock
Date: Mon, 29 Mar 2021 17:15:02 -0400
Message-Id: <1617052502-14181-3-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617052502-14181-1-git-send-email-boris.ostrovsky@oracle.com>
References: <1617052502-14181-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.37]
X-ClientProxiedBy: MW4PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:303:83::10) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3efc8d69-a83c-4a4e-220b-08d8f2f7c197
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB44168270704E0933188D51C08A7E9@SJ0PR10MB4416.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HoAxWbBhralypUVp0Q2lLTso8gmfV2PwqXnwuqhMcsIdi4ZAWHSuKRgRn0qT2C9YVmuPxd7Y+TC31iZLd6XC7mfpmdQXFhCVhzEKGv/xEwpwNycGG3fhODL8EkrAOoXIgPVldBm25iCMt6Ns0OznvTd0dl08sOu8+ILCaYFM4tHXInHUMvxR7/KsiqwM1OIJnIufvVwl8a5DaB+YqYLGpicsFc+b5vhygRcHvxV52vDueRDE9w/9vODjttxUbHwso4Hv3UeX3fvdKt8UGOR8RvaXYkrPb+uWbzgM8G+TBZILmqZVAdh7uM8BVLW2pK97RsXOBXDT20lASKul0LNnY6aOEbKmJfg33AC0CuWJTCTj7/T2YJX5/BKcpPz10mk6K+vQLznrNWGf4H12u1LOUXrwXbJipLnUnk25TCdymbAYb+XbfWGj9GKvw+N/fFO5ile13alrzNKBzsQOdSXc0vhOKbVaxQLaTGk6rtZxsaslh9wEdBLSoyZYhqik2QqBCiiB7w3reZv9fu/y9XjTKxBEo77AvA2PjWMdgLXiOvgOgETkBnkDiDo357jZM1ueofZmY0ucNue3NmLM/7iUcz0UPRlceOMUr0tSe+CL8Q7MZr8Ut/a/3ySfsiog9NMgwQt2WOHNV9JFZfqRCT6hocqFhYmq9C7bKxtNTuxpd+c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(396003)(376002)(366004)(316002)(5660300002)(36756003)(6916009)(8936002)(6666004)(83380400001)(2906002)(16526019)(186003)(44832011)(2616005)(38100700001)(4326008)(66946007)(478600001)(6486002)(7696005)(52116002)(8676002)(956004)(26005)(66556008)(66476007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Sqp14K9dw7ucqx6U5olNAAwJqCMAfz8fn3IIgCi508WhSvO7Wmg4Fgs7DBs8?=
 =?us-ascii?Q?ixSQRCYufpgCL2Z7G+44plxUiRsYFcyPsGrfRJxtvZWofyExs9Gj5XNhRfKO?=
 =?us-ascii?Q?YwokiikkLD7C4gmzFSSh4bqDIUviOFZITaRQlbphuXVwEiwJD/jzOH0hdgzx?=
 =?us-ascii?Q?+GYwSVlOR1iuoyA1BEijsneTYR+sOR/szYcWJxBL/ZcnqcqOF/9LiVH8cMl/?=
 =?us-ascii?Q?0kgWIoACFeTZTyyh4Yts5sTlWYjXmM1ZaKyQeV03O7JWk/8KzAqVab7VqTaQ?=
 =?us-ascii?Q?iwyH8Q+3/IAPszyPs29qrAQzIU1bsRh+rqsmpNO1ztQ4YKH2vvhgIQcnjIDw?=
 =?us-ascii?Q?a3jkD5yGbAlmQYn19plFBO1XJ14yHZYqoDFsb+hjdq8axaNEuIABitt91UeA?=
 =?us-ascii?Q?x+BDm5ynhPlTliu/tU3vuv+ycCziFmleSkXSn/s1iv0O8vA/Pv34DDXf5q0v?=
 =?us-ascii?Q?Z8VrIESgclcrUHYIo68y6vJJn6h1H1zi+IYsD3m1jQPnlLhH1Dx5oEnm+rpx?=
 =?us-ascii?Q?qY2WLk0CIqju+vp2Qc+5ayln/9BcEZyzyh2ojALDWYKxH/WOyRlLCci4HUnD?=
 =?us-ascii?Q?+YYV2QXE8hzbt6nIpfpxWE4fU9zGgv2oQ+OGu0xOyj8HTDBrVYSTxFdoWdHc?=
 =?us-ascii?Q?AposiEB6ewPReBH7uy/qqibNStzhOn5qFVcFL4pEliyrxNHJ0+FZzytgPawi?=
 =?us-ascii?Q?UwNOGyEYqTW3WHqETEuGfMBgtXYlMFso5Q5dlw8YfuLCdOQWge8uzH/N/dwj?=
 =?us-ascii?Q?2fBeqi9uUZjIvJ8mdDjXDI39Y9egvwhxLBWhaSzGkddNLYceGHfKVVsUJONz?=
 =?us-ascii?Q?dhBMnfeRyq6FaTH4FIMGwbKfDRxs7FSPFvVoEFvja0b+4lXgdPNMxMQQ1/dc?=
 =?us-ascii?Q?KoClsII+BM+j5i2Wni64EIPk3sFDNOkDfmRoslMHdm1FPZlLpgh/bIbYznJ5?=
 =?us-ascii?Q?/Fske0FIOwCniMwoB7QTkd2rD7Q0rTHlNHQCdPic9kt1ICk238mjAYUl7Ur2?=
 =?us-ascii?Q?oJe7Z9aVqsKXjIr9BHlv6GqV6Ud1/sbvm4kp08cFIrntWmF8/FLTFbi2l07A?=
 =?us-ascii?Q?wvYvZ1LRjTlE0e/tn7G/DgnpKlMx+5m/hS0itzjx8nS7+FwP6ZBRTEY2zcJf?=
 =?us-ascii?Q?SdtqWdZn//CDKLcRegpisrpJfLhg6WcREDm8iK5KgghnKlJ8LozXs435MWJK?=
 =?us-ascii?Q?tz00rO+WCuiI3p7BfmDNKdgFGVrIsRT2TiBWOe//1ajgtOn2bAxcqWv9qHwN?=
 =?us-ascii?Q?ITwd9Yl+SUWUg/VafplpVh7dvYxVVjm9LUmPvYfBybquhstOse6a7mLF6ET7?=
 =?us-ascii?Q?Joa6GZopZqzLdxYqD+F/znjJ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efc8d69-a83c-4a4e-220b-08d8f2f7c197
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 21:15:21.4083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnAGnk0bX+EqJhK+xquExG5pN/jgDkheVdIGhWLLdwyyXiEq7GOVZzVWZJ5L6AhqcuyuBqbbZHPl7oVlhWZ1cTQt1Ecf16xBU/FaM2L5+DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4416
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=967 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290157
X-Proofpoint-ORIG-GUID: 68bcp-Nj3eF4dIsN6f4BCHRNfPQQ7gzI
X-Proofpoint-GUID: 68bcp-Nj3eF4dIsN6f4BCHRNfPQQ7gzI
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290157

Make both create_periodic_time() and pt_adjust_vcpu() call
write_{un}lock with similar arguments.

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
New patch.

I ended up doing what Jan asked --- create_periodic_time() is also using different
start pointers in lock() and unlock().


 xen/arch/x86/hvm/vpt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 560fab9cfc60..4cc0a0848bd7 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -592,7 +592,7 @@ static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
     if ( pt->vcpu == NULL )
         return;
 
-    write_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
+    write_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
 
     if ( pt->vcpu == v )
         goto out;
@@ -613,7 +613,7 @@ static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
     pt_vcpu_unlock(v);
 
  out:
-    write_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
+    write_unlock(&v->domain->arch.hvm.pl_time->pt_migrate);
 }
 
 void pt_adjust_global_vcpu_target(struct vcpu *v)
-- 
1.8.3.1


