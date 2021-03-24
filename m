Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9353C34835F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 22:05:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101188.193375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPAh2-0003vk-VZ; Wed, 24 Mar 2021 21:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101188.193375; Wed, 24 Mar 2021 21:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPAh2-0003vA-Qy; Wed, 24 Mar 2021 21:05:32 +0000
Received: by outflank-mailman (input) for mailman id 101188;
 Wed, 24 Mar 2021 21:05:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=egK0=IW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lPAh1-0003ua-OH
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 21:05:31 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9be501b1-c198-4c1a-a5cd-fc9011a2206f;
 Wed, 24 Mar 2021 21:05:30 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OL0j7I187125;
 Wed, 24 Mar 2021 21:05:28 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 37d8frc9p1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 21:05:27 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OL0Xn2150299;
 Wed, 24 Mar 2021 21:05:27 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by aserp3020.oracle.com with ESMTP id 37dty136n0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 21:05:26 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB2840.namprd10.prod.outlook.com (2603:10b6:a03:86::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Wed, 24 Mar
 2021 21:05:24 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.025; Wed, 24 Mar 2021
 21:05:24 +0000
Received: from bostrovs-us.us.oracle.com (209.17.40.43) by
 CH0PR03CA0142.namprd03.prod.outlook.com (2603:10b6:610:cf::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Wed, 24 Mar 2021 21:05:24 +0000
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
X-Inumbo-ID: 9be501b1-c198-4c1a-a5cd-fc9011a2206f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=rEhjasuVODHOAL7eJj8WuAaWQFsGT8zWCYIKpPNMGOw=;
 b=etzaccYZRe/0ikvXEDrvYN6seyZ8qPBaY61+R5RdAFJsfYDq7yC3s0vdQqkrE6w+yRqV
 YZj2f8LqjUwDqmEevVTHVXpbNlXvlo/d8z1uG9kGbCo2PD+7KYEjQfGdOPVPsbpbWDiu
 nLf0cbcNasZikKs1Gv8AKCs94qNT832GBjc5TvQkCr9uSEl0IgPuJtuWbdhjUDauTf6T
 gRjIP86ZY10r3TKDseciIwzgh6AV4BkiAkHKkB9XQ3oT5OdSTWZg289ZjNoGq/2Md0bD
 97Cj/quvaitgWcIcw0re6R/aFA/LugrFYjjGTQi8qmiVtgh/NSf5KqAJFIdDb+53Z+kb xQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJKN6UoHbO8Xr0mvC06kWf9NZU/HQrHqyYYqAoOeXUF5SzejgpLdGM6WwpenxI9bEryj6qULn35BR/TnCVI+Zd8N58OFmbfokRpNxro24Y5lg8tOSBz7WiWFmN03ZPFZppSCCKGwOQiQdmib276S0W5E46Q6CcXCzpW5lbOK61OM1gOQ6dIw8mpsNsJJ5pjkyKz7GDzP1grpgEunAlYuP5m0tUHdmGCXRgwshhg7c2CCV6+oqyKnB1HYyssIh1G4Tltil5FrhLFVN/AGeRRgLl60evWHv8bSznwIbfISoJUXPVj1foFoFEhqUMx/c5nxAIjisgnyDCHxXlJhpRFSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEhjasuVODHOAL7eJj8WuAaWQFsGT8zWCYIKpPNMGOw=;
 b=DQQHOY03lVQxl3DrOyNk+E6z5WOiodF6d99xlhnTFsmbQxJCGeL9q4szG3LKqYeK0uoxofmVFt9i6WBnXnUSXkOAl+9Urk/MJeZLLmfOMt7CoWjNWDHZYTFy6JoUOW8yj0wcK+4egJkv5jCn7p+j5M+w/Wgtn4i7VZDBieN4jGzlZdu+SFrl+FVB2Yfz+zvQtIPcddI6adNlQYmNpttkztdcMk5/7jFI6EwuTIgXk1cUwQmLLbra85tZ/NQ6odzjQlCt2GT8lINHhSsMUYo9AyCt2KeYNM1o+cYsHcB8/uAutOn48MbaN9D3Kkhh4FAlkxRaqmMFes6EtDiHxg6PPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEhjasuVODHOAL7eJj8WuAaWQFsGT8zWCYIKpPNMGOw=;
 b=X/0humPjyaCMnkEP2QB9JT8lU+QcmDwMp4+SD/73zVcWft8qKxZEP1iqeq9WF42+RKf4XSFSjWwydmr6Z9e9LRzCRVvwdn8PhNHb9AYrwAHRGxSBHN6NRYcEIO8koDwhlaodQn1gpKXGLWlCGPgakoDifQKXRJ7QcWud9eXakBk=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        wl@xen.org, boris.ostrovsky@oracle.com, stephen.s.brennan@oracle.com
Subject: [PATCH RESEND] Performance regression due to XSA-336
Date: Wed, 24 Mar 2021 17:05:04 -0400
Message-Id: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [209.17.40.43]
X-ClientProxiedBy: CH0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:610:cf::27) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72a841c2-02bb-464d-be2a-08d8ef088b38
X-MS-TrafficTypeDiagnostic: BYAPR10MB2840:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB28409BB6BEBCA3047E264BEF8A639@BYAPR10MB2840.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UTIL58DB2AMKiMarFc5qXq3Nu5q2AQ1SxjnI120VxV+0qGW772m2JnLHk50KPLbJzd3hqoXJ6Oo2j1BEXh51nx5k5aeooJp2U8yAPsZYdA3bPkzw+59W/nZNRBpZarPz1WT6hySmHO2Szuz8PJ3wN4japvEXoI/4dWGCJy9bCkQOxS9X8UxntvGDU7A8C1ULDzCmt1vah7h2BIf4ZebtUy6oMaoALJZ9E1LGigLNv5g5S5zm5ir3TYnGP21dg+IDUbW7vtdVOaPdc3GeiugqCu4uHEbMcwY4/XolQKV3HooR7523n+osroe+YmTqvzmAs1gJuTfTAA8tILppFnE0v4iNngQXuzDidHxjcRKqizfUdMm/NzK7+iLe2BqBYR5Yb1Ip2qNMTQOgEjYGFzZjpcA3afj+CysWioW7x7YF/SUfuWojxAW2WZ1h0+z69zy3MLiE+bdU9yiSWJb83UjXTKqUg02HQsU63InEjtvUoE7Z127T+nfK853LOenq/UTrsmEIkE6Y3MIXXEaBlQNrCNNw6Cnkx7xPyTtNV81HKT851WvwD+Khmfy+PpVDMveiNg34cxO9BpC1bOv2uEycbkBo5+GUceN7K4umVotNTLx8/OjNXDx/icMd7siN/29YBWXRJ8OED2MHcfvlukbxQHE6eWLPL3pv13gvQIDbidI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(136003)(346002)(39860400002)(36756003)(26005)(107886003)(8676002)(66476007)(44832011)(316002)(186003)(38100700001)(8936002)(2616005)(66556008)(66946007)(4326008)(956004)(16526019)(6916009)(83380400001)(52116002)(7696005)(478600001)(5660300002)(6666004)(86362001)(6486002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4YHm9dqPiASyEAP+bKbW2ARgRi4mBRo7hEyIKFtDbGkGqYc1kuKhm8pD5RKV?=
 =?us-ascii?Q?h3NK/FfV7u+hv0vIdLTMKY4tTwB/UQbI41FmbEbqlXKkwNodeH7W974ID2KZ?=
 =?us-ascii?Q?cV77apdgWabY0S8DHvuKT30K7Tia/787bJvHwzYO82nJAT22F8bXn8XV9/Ro?=
 =?us-ascii?Q?CPOPOLYR3FEtzriO13Xkkt62gV/+LLnUOWeS5uX8bnzjYRh83jW91+aSWbLD?=
 =?us-ascii?Q?mROfRXCwYIBENJwtMv95YT9DNfpChAZNOAU+ecYOXVhkxHT+JlfCwCf9EvBR?=
 =?us-ascii?Q?OomSp7D6a5HWiH7HaPonG6k3xxPD2c6uJXFR6C4srf5PI4LsS9y/iEcwMbW3?=
 =?us-ascii?Q?O6kS48/MbKHwJjSTh5nrHEbkOL5S1VYPiASuBKl7BFuDHRCLTi/P70mgH9MO?=
 =?us-ascii?Q?4Xd5F5yxsOq73nWumaSvdfo5Bd+GzL+3L9od+38XZZrjrMZteB6ySjO1hImG?=
 =?us-ascii?Q?XlN/Ka3QTfUGaXdyCjVAx35hbyBvOBaHYvtnXUQ8X2TknmBLFe3eWfvu9XIE?=
 =?us-ascii?Q?6u9VFZL/MY80RIowQXNw45w+P0JIexjH/+pZ0Xcd55M3pwdx/wgwVMIUQ5/L?=
 =?us-ascii?Q?o3y5luY2dix86o07xT6RgP4XgILbcWbLiN/jgh8tiBe44ZY+IPUO5e7vpgYa?=
 =?us-ascii?Q?U3GX+e4ePnD22osEy+1x5kyf12WWmiDYECJaDPIJeNYgszcbHq2nVTl7lO16?=
 =?us-ascii?Q?3STue+cX/GZMYy3T6/sCc+TTw7jwCTqO63I8h9upfQJFg2aePMV2G3jG3w81?=
 =?us-ascii?Q?SJ8enIpMeFe4vCEzkgBPhcFZi7Lk/zXvzf+hDfU7Q1yjoNDfdZcw/gMEGhqr?=
 =?us-ascii?Q?2AYLnkFtbs4c0NHWI05I7NEvbYtFbT+0RZ4rTHTmM7/BwrBr2ahKW6AY0hUU?=
 =?us-ascii?Q?pKuzNUUUmwKNQRwAr3xpCJ3Ssimkc7VwlAgl5f/wtsp1SeMiTlLrz5XVpnVZ?=
 =?us-ascii?Q?Ve63Gr224Jwus0/BVKYcSzL4+ZuFm9bao7MOMbeoHAHgmTVQQGyfDtbsw4Iv?=
 =?us-ascii?Q?GkyApSDpiiENKEjn5WnHjiVWQx6em94QRUKBwIwmE5QfkPsS/S2P331HAhS3?=
 =?us-ascii?Q?eas1WCWPFDg9ptz28+XTwqmjfaGLDsa8dxVUJFHf2wxOJ7sUFdxjaoKhS0tG?=
 =?us-ascii?Q?gT258fT2WzBo3Dhwjdj5418gYQz+IWJRvLabXJdKB06RUBs4npyv0ufdcVim?=
 =?us-ascii?Q?F1Ir0zBR/5H8vNv5uvzpP8jIkW6C+46VymcpeoQ4qBhNu/VEmjfjBAmuX7h+?=
 =?us-ascii?Q?FXBkAGC/ZIkmvIkMVaA3BFKUtiypN+5J4Ro4QIOB5YYDZ+vzJfOU6JO2Y22+?=
 =?us-ascii?Q?z5c3Juxnlw8jfSEkrIQUejrP?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a841c2-02bb-464d-be2a-08d8ef088b38
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 21:05:24.9022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iM21/D7eF/f3NrdaD3fB5ZgIv0As3dhxNDH5+cHn2shrDf0ISwv6/sM27Ax7RQOmWcnGp+NQJf9VEhp5+3DlUzTqw2r7q/Ha+sH3n6NqKYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2840
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240153
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240153


(Re-sending with Stephen added)


While running performance tests with recent XSAs backports to our product we've
discovered significant regression in TPCC performance. With a particular guest
kernel the numbers dropped by as much as 40%.

We've narrowed that down to XSA-336 patch, specifically to the pt_migrate rwlock,
and even more specifically to this lock being taken in pt_update_irq().

We have quite a large guest (92 VCPUs) doing lots of VMEXITs and the theory is
that lock's cnts atomic is starting to cause lots of coherence traffic. As a
quick test of this replacing pt_vcpu_lock() in pt_update_irq() with just
spin_lock(&v->arch.hvm_vcpu.tm_lock) gets us almost all performance back.

Stephen Brennan came up with new locking algorithm, I just coded it up.

A couple of notes:

* We have only observed the problem and tested this patch for performance on
  a fairly old Xen version. However, vpt code is almost identical and I expect
  upstream to suffer from the same issue.

* Stephen provided the following (slightly edited by me) writeup explaining the
  locking algorithm. I would like to include it somewhere but not sure what the
  right place would be. Commit message perhaps?


Currently, every periodic_time is protected by locking the vcpu it is on. You
can think of the per-vCPU lock (tm_lock) as protecting the fields of every
periodic_time which is attached to that vCPU, as well as the list itself, and so
it must be held when read or written, or when an object is added or removed
to/from the list.

It seems that there are three types of access to the peridic_time objects:

1. Functions which read (maybe write) all periodic_time instances attached to a
   particular vCPU. These are functions which use pt_vcpu_lock() after the
   commit, such as pt_restore_timer(), pt_save_timer(), etc.
2. Functions which want to modify a particular periodic_time object. These guys
   lock whichever vCPU the periodic_time is attached to, but since the vCPU
   could be modified without holding any lock, they are vulnerable to the bug.
   Functions in this group use pt_lock(), such as pt_timer_fn() or
   destroy_periodic_time().
3. Functions which not only want to modify the periodic_time, but also would
   like to modify the =vcpu= fields. These are create_periodic_time() or
   pt_adjust_vcpu(). They create the locking imbalance bug for group 2, but we
   can't simply hold 2 vcpu locks due to the deadlock risk.

My proposed option is to add a per-periodic_time spinlock, which protects only
the periodic_time.vcpu field. Whenever reading the vcpu field of a periodic_time
struct, you must first take that lock. The critical sections of group 1 (your
"fast path" functions) would look like this:

1. lock vcpu
2. do whatever you want with pts currently on the vcpu. It is safe to read or write
   fields of pt, because the vcpu lock protects those fields. You simply cannot
   write pt->vcpu, because somebody holding the pt lock may already be spinning
   waiting for your vcpu lock.
3. unlock vcpu


Note that there is no additional locking in this fast path. For group 2
functions (which are attempting to lock an individual periodic_time), the
critical section would look like this:

1. lock pt lock (stabilizing the vcpu field)
2. lock vcpu
3. feel free to modify any field of the periodic_time
4. unlock vcpu (due to the mutual exclusion of the pt lock, we know that we are
   unlocking the correct vcpu -- we have not been migrated)
5. unlock pt

For functions in group 3, the critical section would be:

1. lock pt (stabilizing the vcpu field)
2. lock current vcpu
3. remove from vcpu list
4. unlock vcpu. At this point, you're guaranteed that the vcpu functions
   (callers of pt_vcpu_lock()) are not accessing your pt.
5. assign pt->vcpu  (we still have mutual exclusion against group 2 functions)
6. lock destination vcpu
7. add to vcpu list
8. unlock destination vcpu
9. unlock pt

If functions from group 2 and 3 are less frequent, then you won't see too much
added lock overhead in this situation! Plus, even if group 2 and 3 are somewhat
common, the performance overhead of an uncontented fine-grained lock is muuch
smaller than the overhead of a heavily contended coarse-grained lock, like the
per-domain rw lock.


Boris Ostrovsky (1):
  x86/vpt: Replace per-guest pt_migrate lock with per pt lock

 xen/arch/x86/emul-i8254.c     |   2 +
 xen/arch/x86/hvm/hpet.c       |   1 +
 xen/arch/x86/hvm/hvm.c        |   2 -
 xen/arch/x86/hvm/rtc.c        |   1 +
 xen/arch/x86/hvm/vlapic.c     |   1 +
 xen/arch/x86/hvm/vpt.c        | 122 +++++++++++++++++++++++-------------------
 xen/include/asm-x86/hvm/vpt.h |   9 +---
 7 files changed, 74 insertions(+), 64 deletions(-)

-- 
1.8.3.1


