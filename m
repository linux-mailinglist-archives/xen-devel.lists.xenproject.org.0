Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4591348342
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 21:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101175.193355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPAYq-0002hl-Pk; Wed, 24 Mar 2021 20:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101175.193355; Wed, 24 Mar 2021 20:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPAYq-0002h7-LS; Wed, 24 Mar 2021 20:57:04 +0000
Received: by outflank-mailman (input) for mailman id 101175;
 Wed, 24 Mar 2021 20:57:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=egK0=IW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lPAYp-0002gG-I0
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 20:57:03 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ee38f51-d74e-4dc8-97ad-ab2c9523a4e5;
 Wed, 24 Mar 2021 20:57:02 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OKtFjN165719;
 Wed, 24 Mar 2021 20:57:01 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 37d6jbmcea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 20:57:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OKuEf1188520;
 Wed, 24 Mar 2021 20:57:00 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2050.outbound.protection.outlook.com [104.47.37.50])
 by userp3020.oracle.com with ESMTP id 37dtttuf5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 20:56:59 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4018.namprd10.prod.outlook.com (2603:10b6:a03:1b1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 20:56:57 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.025; Wed, 24 Mar 2021
 20:56:57 +0000
Received: from bostrovs-us.us.oracle.com (209.17.40.43) by
 CH0PR04CA0043.namprd04.prod.outlook.com (2603:10b6:610:77::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 20:56:56 +0000
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
X-Inumbo-ID: 2ee38f51-d74e-4dc8-97ad-ab2c9523a4e5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=mCJL1UVF0uGsPx6r2QxWvx1KIL6nSvrVsNJD9J0kgL4=;
 b=smhqu2ltVF7JEJ3o1X7jNbYIEzWYuZIWPt4DOprHDhDwSuLz9Y+JVrjYzhTgJR7K7uVP
 KPNbsaqvm28EXmZKJgWBc19UBD9FE0sx4gQgZ7T8yzHx5cv9HD0l0WNHZkqR76fwUPDP
 fCSAxn8OxPaL7NriwcVu4S6Mw1HY2VEvnxHa8+iu1vUlvI8AklQlvuLsy0XmFk9JiLrV
 0W7Zh1UqEn+XxGJxjMKfFzzpxPN250CI6LFfwRuGurCD64N4oao3uyNiH2LiPkdkNbN4
 U5IgoqS19WVflA6joTo2f50jjFXn24eZB31cscyLlxmpd5d+ow6y0uPykRVF6gHrb6OV uQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3zVHzcaJg/uWzhuuTpWZBDmQiI7sBm/b1ZdHKHVnZImTXIpcA6IDR63GN0Lh4vHGyhRDuXgvabvxoQZZU+gq4STdhBmXbwj9tmp/h/K99rWh+H7ReMK/2CdGGDxXltNIsk1TSV6yoWCtPwAYtbbsM4U8sM4fvLFQnm56jTC1T7KHfw9aM/wpJ76I+ADu+Y4F+TwZlql6mpf/Dc1SdkoYwZeTo7MKokckbGn5/FPURYrgdzgm7Oi60rAYDwWCVnb4lXF7IH20PDXeVH8PWpu5f3LSEzT3ehrV/RNrYfKpTxuTWiHlxUEbPkh6Q2k93JJki84e9sFET9V0R232wA4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCJL1UVF0uGsPx6r2QxWvx1KIL6nSvrVsNJD9J0kgL4=;
 b=coZPl+Hub/krc56SHRvnaHawYf49m5LLTkPADhT9P+PZRAKyxzgGvPgfmGZQE63Isk0triH7Nz361S3+H5AD5tAR8VsY11gb6cdc7L0M9uOhww/RzXwcHBhd2a8IsYpZtalgSrTlwsvxEFSFNANcOgAef6L2UUKMNMKR5U5Lfv0CosUbgwAqeYw6dGTp/UGh9N37ozZ7dFz5rxMNigCqCyp3unno714Bkynp8tXFbof9EntnmaDSyPlJSgWpTmB+gEVpS8ZI0JskY9JscK6/587CLKtVkVfi73hZX8sOqdSVo5GjgN2lRqf3tx5SVYERueRtOKEJbTOu/j90eksphg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCJL1UVF0uGsPx6r2QxWvx1KIL6nSvrVsNJD9J0kgL4=;
 b=zZmQIBOjCKqUuJoFqh4C6JPa6KUzCO4z8piu6h0//2lObGDCjDA7m0wEECBgNNz4P8Ta6a4xeEwEp0DDLOoi1sqyBqL84yXm4mDdyMJzDDGQ7q4lcNYfOECABOE6ZxBtFPKGk34la48SYgoNpLOJ7/2HjlAgfIm1TG6YyDYZq+4=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        wl@xen.org, boris.ostrovsky@oracle.com
Subject: [PATCH] x86/vpt: Replace per-guest pt_migrate lock with per pt lock
Date: Wed, 24 Mar 2021 16:56:35 -0400
Message-Id: <1616619395-32438-2-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616619395-32438-1-git-send-email-boris.ostrovsky@oracle.com>
References: <1616619395-32438-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.43]
X-ClientProxiedBy: CH0PR04CA0043.namprd04.prod.outlook.com
 (2603:10b6:610:77::18) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a43b28c8-a191-47aa-1ca2-08d8ef075c8c
X-MS-TrafficTypeDiagnostic: BY5PR10MB4018:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB4018B29D5CD52707A75408D78A639@BY5PR10MB4018.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:534;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xNMRXYKa5NB8kGh10vOSKUnBZyfeIbBaz6c6x5MEsZVgsWATchqehoXG5UL4KMHwXHF55iF5rxVWNpb7xsQfXU6UX4X4X3eY7T1YID1y3iMT1VenxwqiJ5iwSL60nAcXBCMItiJuVjqKfAhYKd0ASGzwetCkh6nRFJiKt9ldcIwqaQRMeOvVs4gsbTEdjTTLtg3WVKFYdWzDt4HcedVKGShw1YxrUWcIXweijvrSvPVChcph2bFmUvRuknlzm2O+6C3QLxJPaLL8FJzrmWTrB4CnZeEXraZngPAeuKaAwr6hVAcGdiS2D1BZMfP2Z6tVFtI5aetUy3WPL2IMxjs7wXDnE9e3Pqut5my8EbTp+d0or6chtA0p+d6f2uDWAMhMIkyBo19GULThw0nXxdB5kr3bR1iS0L2fSFWuGD4zkBmJznLrb6LjZsOBwucECy0kQEccmVr+X1nPkdvuTzZHo9Dz6SJs+aoPJLP5N27JbsVD5QA9bLighALCMQ8l6uI9+2xzIuWHHwAQ9LQ/WCrBxptQYExYJdhJTKhJztskTf0b4BCbsKqu+UNtbyV7Hn3grJDQPwU95D/aIgYy3bIZACXhZjUw0HTI2WY3Z3a6IolndcPLJ0Stp5Wjvi6A61t+X9DYkKazx7QsWhbSg38CaM6DlS+KhoY7JBlC+uCr4Pw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(39860400002)(366004)(346002)(66556008)(66476007)(66946007)(107886003)(186003)(44832011)(6486002)(6666004)(2906002)(7696005)(52116002)(38100700001)(316002)(30864003)(36756003)(26005)(5660300002)(6916009)(4326008)(2616005)(956004)(8676002)(8936002)(86362001)(83380400001)(478600001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?9TBLtfejEozpk2669SkoTesYmFx09Xcbycs9AVxaZ8J/sDz56OzoPCdYOloJ?=
 =?us-ascii?Q?drtiOPdt+v24p4zoxwNqN4bLuZzR2BALER6l0GvFvI13rdQSmba+Qubqev7H?=
 =?us-ascii?Q?j3TLCtGOjxGvkkcDJQlyeY9fW1c3uVhh8+GVhRaynAHaQ/J3hrmxImzkZQya?=
 =?us-ascii?Q?U9mraghpMTnQONi+q08oBY1BfpfA1cH/cIFYoEk/gQ5+fpsh+UEx962GLGdo?=
 =?us-ascii?Q?eXo07naQgaid3YTecFo08ZlrT8SpbU6fEF3SxMtY7pn453vvKad0kvGLAkc/?=
 =?us-ascii?Q?od7MQi6fpt10aAoEwla3L/IOqVyR2WNiU9kQHLq/Kn+IA3GV4Q4exhg2+OOY?=
 =?us-ascii?Q?tT0bxwd4jEIv5ylY/O3OqbvHw1vQ7gTnm57EewIj1OM+v4jk6Wph028lvn7a?=
 =?us-ascii?Q?BwkMkVdo9WjQ0fon2qacnjLjKmtbfpaKymxP5wOu3aSSe3Oq/cVNuLOo1MZf?=
 =?us-ascii?Q?zGC4V0Y2351UDVOH7j3UcPetFOJA6+vU/AE13gGQXNB31qDYQ5QRRkEdIam+?=
 =?us-ascii?Q?rLHcNfj6cIrCj71bbIpomBfZT8hEFdeD3fvr4cGfH0unL/BnDb7yE2rl4f7a?=
 =?us-ascii?Q?UdCykzD4uah0w76sE9aDx+LK7Y37HRNAtqen9pwOnfS8FPAR9c/guQANARhb?=
 =?us-ascii?Q?AemjxhoOIlukM5ZAQxVZ8/pJdrevDbFIkzXx1qjZydiWvr69Lvugzxxuo5LL?=
 =?us-ascii?Q?mzlfw38ZCaW24l3oQrjK3fWgm+aQ2fk+kAv+fG/W3W+O1+mcyuU0pj/Fo0TV?=
 =?us-ascii?Q?jZZ31DwwvTtud9hTOVGLaA/vAC3XVfmYsFz5yreNiJJFIrPfk2zH6RxrAhkk?=
 =?us-ascii?Q?lWIif9dZSFgCk9MuARjlIUdI79fKJI5K4ignLTYVsajxv+nHq41b/mdDaOFu?=
 =?us-ascii?Q?OnKgrZ/tJkQv8FM/pYRiSGbTN3IJd/b6rmXYL+nG8Ym8EMy5o4+Ly3h4nC8E?=
 =?us-ascii?Q?+WMuVkwSBCcnC0hBHpQcupKveAX0lf7AD5367dQWLXgZazkOaPbeLCdJQ66s?=
 =?us-ascii?Q?cxYaW0mt5X1uT9fjjPx72MfPepQwk8bZcg8M1HEgN6eiwJNpNVGDaIgoDHvE?=
 =?us-ascii?Q?LubKuk6qmnhcj8/LVE8q7nCS16i3IUcat34GqUb4SICyx0tgyegS5GwJLOSX?=
 =?us-ascii?Q?ydDKXwbfShyR8otnJk+W9skls+tS+7cSyV5Rv1PQCfwMMNg6KZ7xJCqvDySR?=
 =?us-ascii?Q?pPJM8xx4stQkL5ybdbUsXwZCbhRoET7V3mc3LH6SCV44r8SRRWtU5A8q9H8X?=
 =?us-ascii?Q?OjwKHEr6qrqBR+O9gHQx/gSg29d7ltojq2Udrfok60jLngUbmjkLYxmN4b2c?=
 =?us-ascii?Q?z4xcJZeqPyMgil3xDaU2yhwp?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43b28c8-a191-47aa-1ca2-08d8ef075c8c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:56:57.4937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDUgPVCYhBZkFBx2twUlfQEVN+bRZmkCqiQmr7WJmrw9wGFM7nO7GuTXziW3/CIhAk8osdMkI4IMVf84PWeLta5WZa3Yxt1BZ3OsqofSzvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4018
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240152
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240152

Commit 8e76aef72820 ("x86/vpt: fix race when migrating timers between
vCPUs") addressed XSA-336 by introducing a per-domain rwlock that was
intended to protect periodic timer during VCPU migration. Since such
migration is an infrequent event no performance impact was expected.

Unfortunately this turned out not to be the case: on a fairly large
guest (92 VCPUs) we've observed as much as 40% TPCC performance regression
with some guest kernels. Further investigation pointed to pt_migrate
read lock taken in pt_update_irq() as the largest contributor to this
regression. With large number of VCPUs and large number of VMEXITs
(from where pt_update_irq() is always called) the update of an atomic in
read_lock() is thought to be the main cause.

Stephen Brennan examined the locking pattern and suggested using a
per-timer lock instead. This lock will need to be held whenever there is
a chance that pt->vcpu field may change (thus avoiding XSA-336
condition).

Suggested-by: Stephen Brennan <stephen.s.brennan@oracle.com>
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 xen/arch/x86/emul-i8254.c     |   2 +
 xen/arch/x86/hvm/hpet.c       |   1 +
 xen/arch/x86/hvm/hvm.c        |   2 -
 xen/arch/x86/hvm/rtc.c        |   1 +
 xen/arch/x86/hvm/vlapic.c     |   1 +
 xen/arch/x86/hvm/vpt.c        | 122 +++++++++++++++++++++++-------------------
 xen/include/asm-x86/hvm/vpt.h |   9 +---
 7 files changed, 74 insertions(+), 64 deletions(-)

diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 73be4188ad41..d83e727ff35e 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -478,6 +478,8 @@ void pit_init(struct domain *d, unsigned long cpu_khz)
     if ( !has_vpit(d) )
         return;
 
+    spin_lock_init(&pit->pt0.lock);
+
     spin_lock_init(&pit->lock);
 
     if ( is_hvm_domain(d) )
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index ca94e8b4538c..c7f45412164e 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -734,6 +734,7 @@ static void hpet_set(HPETState *h)
         h->hpet.timers[i].cmp = ~0ULL;
         h->hpet.comparator64[i] = ~0ULL;
         h->pt[i].source = PTSRC_isa;
+        spin_lock_init(&h->pt[i].lock);
     }
 }
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e7bcffebc490..b60549a12a33 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -658,8 +658,6 @@ int hvm_domain_initialise(struct domain *d)
     /* need link to containing domain */
     d->arch.hvm.pl_time->domain = d;
 
-    rwlock_init(&d->arch.hvm.pl_time->pt_migrate);
-
     /* Set the default IO Bitmap. */
     if ( is_hardware_domain(d) )
     {
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 3150f5f1479b..6289d972bb67 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -842,6 +842,7 @@ void rtc_init(struct domain *d)
     }
 
     spin_lock_init(&s->lock);
+    spin_lock_init(&s->pt.lock);
 
     init_timer(&s->update_timer, rtc_update_timer, s, smp_processor_id());
     init_timer(&s->update_timer2, rtc_update_timer2, s, smp_processor_id());
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 5e21fb4937d9..8413e41a7a80 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1626,6 +1626,7 @@ int vlapic_init(struct vcpu *v)
     vlapic_reset(vlapic);
 
     spin_lock_init(&vlapic->esr_lock);
+    spin_lock_init(&vlapic->pt.lock);
 
     tasklet_init(&vlapic->init_sipi.tasklet, vlapic_init_sipi_action, v);
 
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 4c2afe2e9154..36d4699a5de6 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -153,32 +153,16 @@ static int pt_irq_masked(struct periodic_time *pt)
     return 1;
 }
 
-static void pt_vcpu_lock(struct vcpu *v)
-{
-    read_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
-    spin_lock(&v->arch.hvm.tm_lock);
-}
-
-static void pt_vcpu_unlock(struct vcpu *v)
-{
-    spin_unlock(&v->arch.hvm.tm_lock);
-    read_unlock(&v->domain->arch.hvm.pl_time->pt_migrate);
-}
-
 static void pt_lock(struct periodic_time *pt)
 {
-    /*
-     * We cannot use pt_vcpu_lock here, because we need to acquire the
-     * per-domain lock first and then (re-)fetch the value of pt->vcpu, or
-     * else we might be using a stale value of pt->vcpu.
-     */
-    read_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
+    spin_lock(&pt->lock);
     spin_lock(&pt->vcpu->arch.hvm.tm_lock);
 }
 
 static void pt_unlock(struct periodic_time *pt)
 {
-    pt_vcpu_unlock(pt->vcpu);
+    spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
+    spin_unlock(&pt->lock);
 }
 
 static void pt_process_missed_ticks(struct periodic_time *pt)
@@ -228,7 +212,7 @@ void pt_save_timer(struct vcpu *v)
     if ( v->pause_flags & VPF_blocked )
         return;
 
-    pt_vcpu_lock(v);
+    spin_lock(&v->arch.hvm.tm_lock);
 
     list_for_each_entry ( pt, head, list )
         if ( !pt->do_not_freeze )
@@ -236,7 +220,7 @@ void pt_save_timer(struct vcpu *v)
 
     pt_freeze_time(v);
 
-    pt_vcpu_unlock(v);
+    spin_unlock(&v->arch.hvm.tm_lock);
 }
 
 void pt_restore_timer(struct vcpu *v)
@@ -244,7 +228,7 @@ void pt_restore_timer(struct vcpu *v)
     struct list_head *head = &v->arch.hvm.tm_list;
     struct periodic_time *pt;
 
-    pt_vcpu_lock(v);
+    spin_lock(&v->arch.hvm.tm_lock);
 
     list_for_each_entry ( pt, head, list )
     {
@@ -257,7 +241,7 @@ void pt_restore_timer(struct vcpu *v)
 
     pt_thaw_time(v);
 
-    pt_vcpu_unlock(v);
+    spin_unlock(&v->arch.hvm.tm_lock);
 }
 
 static void pt_timer_fn(void *data)
@@ -318,7 +302,7 @@ int pt_update_irq(struct vcpu *v)
     int irq, pt_vector = -1;
     bool level;
 
-    pt_vcpu_lock(v);
+    spin_lock(&v->arch.hvm.tm_lock);
 
     earliest_pt = NULL;
     max_lag = -1ULL;
@@ -348,7 +332,7 @@ int pt_update_irq(struct vcpu *v)
 
     if ( earliest_pt == NULL )
     {
-        pt_vcpu_unlock(v);
+        spin_unlock(&v->arch.hvm.tm_lock);
         return -1;
     }
 
@@ -356,7 +340,7 @@ int pt_update_irq(struct vcpu *v)
     irq = earliest_pt->irq;
     level = earliest_pt->level;
 
-    pt_vcpu_unlock(v);
+    spin_unlock(&v->arch.hvm.tm_lock);
 
     switch ( earliest_pt->source )
     {
@@ -403,7 +387,7 @@ int pt_update_irq(struct vcpu *v)
                 time_cb *cb = NULL;
                 void *cb_priv = NULL;
 
-                pt_vcpu_lock(v);
+                spin_lock(&v->arch.hvm.tm_lock);
                 /* Make sure the timer is still on the list. */
                 list_for_each_entry ( pt, &v->arch.hvm.tm_list, list )
                     if ( pt == earliest_pt )
@@ -413,7 +397,7 @@ int pt_update_irq(struct vcpu *v)
                         cb_priv = pt->priv;
                         break;
                     }
-                pt_vcpu_unlock(v);
+                spin_unlock(&v->arch.hvm.tm_lock);
 
                 if ( cb != NULL )
                     cb(v, cb_priv);
@@ -450,12 +434,12 @@ void pt_intr_post(struct vcpu *v, struct hvm_intack intack)
     if ( intack.source == hvm_intsrc_vector )
         return;
 
-    pt_vcpu_lock(v);
+    spin_lock(&v->arch.hvm.tm_lock);
 
     pt = is_pt_irq(v, intack);
     if ( pt == NULL )
     {
-        pt_vcpu_unlock(v);
+        spin_unlock(&v->arch.hvm.tm_lock);
         return;
     }
 
@@ -464,7 +448,7 @@ void pt_intr_post(struct vcpu *v, struct hvm_intack intack)
     cb = pt->cb;
     cb_priv = pt->priv;
 
-    pt_vcpu_unlock(v);
+    spin_unlock(&v->arch.hvm.tm_lock);
 
     if ( cb != NULL )
         cb(v, cb_priv);
@@ -475,12 +459,34 @@ void pt_migrate(struct vcpu *v)
     struct list_head *head = &v->arch.hvm.tm_list;
     struct periodic_time *pt;
 
-    pt_vcpu_lock(v);
+    spin_lock(&v->arch.hvm.tm_lock);
 
     list_for_each_entry ( pt, head, list )
         migrate_timer(&pt->timer, v->processor);
 
-    pt_vcpu_unlock(v);
+    spin_unlock(&v->arch.hvm.tm_lock);
+}
+
+static void __destroy_periodic_time(struct periodic_time *pt, bool locked)
+{
+    /* Was this structure previously initialised by create_periodic_time()? */
+    if ( pt->vcpu == NULL )
+        return;
+
+    if (!locked)
+        pt_lock(pt);
+    if ( pt->on_list )
+        list_del(&pt->list);
+    pt->on_list = 0;
+    pt->pending_intr_nr = 0;
+    if (!locked)
+        pt_unlock(pt);
+
+    /*
+     * pt_timer_fn() can run until this kill_timer() returns. We must do this
+     * outside pt_lock() otherwise we can deadlock with pt_timer_fn().
+     */
+    kill_timer(&pt->timer);
 }
 
 void create_periodic_time(
@@ -497,9 +503,16 @@ void create_periodic_time(
         return;
     }
 
-    destroy_periodic_time(pt);
+    spin_lock(&pt->lock);
 
-    write_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
+    if ( pt->vcpu )
+    {
+        spin_lock(&pt->vcpu->arch.hvm.tm_lock);
+
+        __destroy_periodic_time(pt, true);
+
+        spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
+    }
 
     pt->pending_intr_nr = 0;
     pt->do_not_freeze = 0;
@@ -543,33 +556,22 @@ void create_periodic_time(
     pt->cb = cb;
     pt->priv = data;
 
+    spin_lock(&pt->vcpu->arch.hvm.tm_lock);
+
     pt->on_list = 1;
     list_add(&pt->list, &v->arch.hvm.tm_list);
 
+    spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
+
     init_timer(&pt->timer, pt_timer_fn, pt, v->processor);
     set_timer(&pt->timer, pt->scheduled);
 
-    write_unlock(&v->domain->arch.hvm.pl_time->pt_migrate);
+    spin_unlock(&pt->lock);
 }
 
 void destroy_periodic_time(struct periodic_time *pt)
 {
-    /* Was this structure previously initialised by create_periodic_time()? */
-    if ( pt->vcpu == NULL )
-        return;
-
-    pt_lock(pt);
-    if ( pt->on_list )
-        list_del(&pt->list);
-    pt->on_list = 0;
-    pt->pending_intr_nr = 0;
-    pt_unlock(pt);
-
-    /*
-     * pt_timer_fn() can run until this kill_timer() returns. We must do this
-     * outside pt_lock() otherwise we can deadlock with pt_timer_fn().
-     */
-    kill_timer(&pt->timer);
+    __destroy_periodic_time(pt, false);
 }
 
 static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
@@ -579,15 +581,25 @@ static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
     if ( pt->vcpu == NULL )
         return;
 
-    write_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
+    spin_lock(&pt->lock);
+    spin_lock(&pt->vcpu->arch.hvm.tm_lock);
+
+    if ( pt->on_list )
+        list_del(&pt->list);
+
+    spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
+
     pt->vcpu = v;
+
+    spin_lock(&pt->vcpu->arch.hvm.tm_lock);
     if ( pt->on_list )
     {
-        list_del(&pt->list);
         list_add(&pt->list, &v->arch.hvm.tm_list);
         migrate_timer(&pt->timer, v->processor);
     }
-    write_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
+
+    spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
+    spin_unlock(&pt->lock);
 }
 
 void pt_adjust_global_vcpu_target(struct vcpu *v)
diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
index 39d26cbda496..b0f4af25828b 100644
--- a/xen/include/asm-x86/hvm/vpt.h
+++ b/xen/include/asm-x86/hvm/vpt.h
@@ -49,6 +49,8 @@ struct periodic_time {
     u64 last_plt_gtime;         /* platform time when last IRQ is injected */
     struct timer timer;         /* ac_timer */
     time_cb *cb;
+    spinlock_t lock;            /* protects vcpu field during PT migration. */
+                                /* Needs to be taken before VCPU's tm_lock. */
     void *priv;                 /* point back to platform time source */
 };
 
@@ -128,13 +130,6 @@ struct pl_time {    /* platform time */
     struct RTCState  vrtc;
     struct HPETState vhpet;
     struct PMTState  vpmt;
-    /*
-     * rwlock to prevent periodic_time vCPU migration. Take the lock in read
-     * mode in order to prevent the vcpu field of periodic_time from changing.
-     * Lock must be taken in write mode when changes to the vcpu field are
-     * performed, as it allows exclusive access to all the timers of a domain.
-     */
-    rwlock_t pt_migrate;
     /* guest_time = Xen sys time + stime_offset */
     int64_t stime_offset;
     /* Ensures monotonicity in appropriate timer modes. */
-- 
1.8.3.1


