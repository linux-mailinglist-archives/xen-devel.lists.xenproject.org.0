Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0139348341
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 21:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101174.193343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPAYq-0002gk-99; Wed, 24 Mar 2021 20:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101174.193343; Wed, 24 Mar 2021 20:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPAYq-0002gL-5U; Wed, 24 Mar 2021 20:57:04 +0000
Received: by outflank-mailman (input) for mailman id 101174;
 Wed, 24 Mar 2021 20:57:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=egK0=IW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lPAYo-0002gB-Jv
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 20:57:02 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd7bca63-ba68-4bdc-a097-202187aa8bf8;
 Wed, 24 Mar 2021 20:57:01 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OKsKtH165154;
 Wed, 24 Mar 2021 20:56:58 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 37d6jbmce6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 20:56:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OKtE9I076964;
 Wed, 24 Mar 2021 20:56:58 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2054.outbound.protection.outlook.com [104.47.37.54])
 by aserp3030.oracle.com with ESMTP id 37dtmrawg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 20:56:57 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4018.namprd10.prod.outlook.com (2603:10b6:a03:1b1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 20:56:56 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.025; Wed, 24 Mar 2021
 20:56:55 +0000
Received: from bostrovs-us.us.oracle.com (209.17.40.43) by
 CH0PR04CA0043.namprd04.prod.outlook.com (2603:10b6:610:77::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 20:56:54 +0000
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
X-Inumbo-ID: dd7bca63-ba68-4bdc-a097-202187aa8bf8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=cUWpybHwNWZf1njl51i+SbH5PEo8bcwx0W2qNrZVrNU=;
 b=Izf9Tfljs2yoZaNOx0WPvIh3iYGNamMixEe/YhyssbYClDGzbIzCZWNTgdoaGa06lVub
 WlRIwoY5ItbknDyv8JecG2P2rQBk+4bd/6ta2nuMaiuYMLNokDrdDSMJ8rPaHTVg4YNa
 LS6RoMxtdnk62h1VCUy1S0yCCjRWzLBSfP9mfCQRs0WnItKnAz/GHmq2BJrnsv7iHT4T
 FZgn8yr4Axd/m1V3uCJWXGjWRhvwS5qbFn5ttdRIJC4dJ2OLLo0ynItJiZ2u+dxazqIs
 dVixffBr9ezKwiEp5+hY2uewgbDcc4oWbaF5Vhy4aXdFvb4+AoSW1yuZGDA7vJ27sq/+ VA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPBovbY+NjYjhKn9zOW+mxzS3IBQ7+qXvTuD1MUQ2zw0cAMY5aWaSZsDcv0BY3LOoHV2hnfzoU0y2B2pYFBXgowUrlL6FCWJ5nW5TxsNlMKsXGMYVUX6KuWlfg0QiCqiXl7CnlbwtjBXqqE6RH3821f1CdKa9dmOL8/vzB5fcM1zqyi1S2SF14yMjQVQJNOwIfOvtihl723/O8eJtTvVmfi7zwb5XsL6ILMamvr+eBS8k8iNfHXRFII9C365GZThbNMT6oMk+xt4TNAKQI1lN9DWI20NhER7JKqofheD92hpdXabRBBIdhsRVvJ9LRC+uEch/DZupHI4UniM9cq6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUWpybHwNWZf1njl51i+SbH5PEo8bcwx0W2qNrZVrNU=;
 b=gg4P8n+lWGIiF7rNOvsnGy842BhfUtVgLeRf+VWLqWYlfmFwPBieYWbADpWRDxXZEEnxP86J5M5xScEMpbI4AxADn9mEkEyv2RYa/VPFcSqLTEMevGJfOfHiX5G7QeKLa7m6tYQ/m0/Le35FjPWa1/mHT2LQeelncTk4B5LRgzZtaUIP/6lQl1IsPTt4xqBpzGX22c71xbZUbuftbJH/Jv4807oCMdDp4VLO+Zzg+C540YjHSb4+v3kwauCgbMwgsRWedB7l604XXUZALh/OOOJCTKf1JkKxmSA5tFZgeKboQazFEIqBOyokWjBRQIgZNQPrvWYTUK/yNMAVVK4h8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUWpybHwNWZf1njl51i+SbH5PEo8bcwx0W2qNrZVrNU=;
 b=yviHkO0BDwad0eVu1B0CbrnbGyR22CnTsJwEo4T2asct1abMD1CM+CYoagOn9Ks5VT1seNa8VxXA7StMcPYtCK1hxFY5wPR/iEzatXJrM/ogRTSvQ5k/2XgV/FyFvS7Fm3oUA/ZWMfrEKShcJfBAfDHdnXOpb02FwyZGzJUmhS8=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        wl@xen.org, boris.ostrovsky@oracle.com
Subject: [PATCH] Performance regression due to XSA-336
Date: Wed, 24 Mar 2021 16:56:34 -0400
Message-Id: <1616619395-32438-1-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [209.17.40.43]
X-ClientProxiedBy: CH0PR04CA0043.namprd04.prod.outlook.com
 (2603:10b6:610:77::18) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 972403ac-5fee-46f2-f22e-08d8ef075bc4
X-MS-TrafficTypeDiagnostic: BY5PR10MB4018:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB40188AE80F211C8F91C9F5868A639@BY5PR10MB4018.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7P9cj4tKcrGrUdUYdCmv4vW1aS9TQw7lO90/nKo01Ol0asRfevXmYJhjOYIU6jNI1f6ohPOAXjYhm2Y2n4zE8PosD2MC/6rtZPWzpT4PvHiho+O1t30bEoV6ge1/YnIF5C8ew6Xa5KGPivdiP56jHIEexZj+UiRm1NyraJx/yOmOjrIEBQrdpIoHVl0NpXmC6Wnb1j3BGBncAnL5ijAs2kcNAwjRVffqIaXRbCXxLJ3nboElYWDK4Ddt3bxPjVdq3gO8EMpMbK7IFablTlhRPHN/BqACAKg3/7vXbflYaEyYqt3yQ8KU3tLl/8T7hAYDk1esBjT/EpvcvLNszVG3SVtArUaKp2lU9LeGl2ysay3ZyjKAM4V8arvXF1gOH8TivL8rr0e9PRMal6HRhRcSFa+rw3Nkfi2tVKU5ItYoP9+rYqbgukDmOqZzNuBjSPmOMDX1MQ0c7YOG8AyW7AHZPKxximq2fu0wCFkIgCVBlOIt9mbFutr007FlqiYQRH64r+R7PbjEK+iABw6CzO1N1ayow8GXmR179AxY2aADz7na4Ltmnytq8p8hpFmwBgaXlE1OxjQ1YujRDN1AbmSbro7NfVTWjqnn8LkHOYatP2O1uCBKfKTPi4ZFoF0SDwCN5nPJqMnNM8C7YOXVwwaYXQjWbroytRi3E6kcvWmYme4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(39860400002)(366004)(346002)(66556008)(66476007)(66946007)(107886003)(186003)(44832011)(6486002)(6666004)(2906002)(7696005)(52116002)(38100700001)(316002)(36756003)(26005)(5660300002)(6916009)(4326008)(2616005)(956004)(8676002)(8936002)(86362001)(83380400001)(478600001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?TpC90TFvqzOpRYENGZcOmzEcx8OEm89L5+b8BLphVPGd+etpmntVk/xa1CVW?=
 =?us-ascii?Q?G+rwhpQdbpaIfIqor7iRl0XKj1nppcySwXhdHZzuWcQXWckvgQZoidHPhZvm?=
 =?us-ascii?Q?3Ftz/F8HAEAekV6b9bSPzsBUT0vZk2qiAEJ97NDJSibNIfwsCWI/vG0308zc?=
 =?us-ascii?Q?jtbSINDULskNTFNksrZDgo4JTX4ISqEXxbhmbBGVCOkmuN9rIvjXbMWd5UlX?=
 =?us-ascii?Q?Mpbr3BPtvewBF8ZJSve30gFPMxKrgiwgg03a9b9Pz9nnHqpkpcgcha6ttmgw?=
 =?us-ascii?Q?m/Es3qyKtEiAfn4lnbz5Og0Cgz0DCKfbXF3NASEjm/74+T9sC7K4idFR/dyo?=
 =?us-ascii?Q?MZ1dCc+WbPh6LTu/cdpW+mkdFMryHQlLK9+Eb9SHucFY8xikJXVffNSYfkEs?=
 =?us-ascii?Q?ZQSXnjHcpfUU265rpY6w8aUHQ0dl0PVg4ZgPjWhgVi3ekjoKodJ08dx4WN0X?=
 =?us-ascii?Q?o6U3lAZafODPHQ7TA4zn54o1wDrDysAGgyR8eD4Wp+Qo8t4l9yXr20XuoxhT?=
 =?us-ascii?Q?hsJXh02/oj7Zm51nptjpxd5XzZK2ddrYfELPruWIyJSr5Dev2pRQn15ywXzQ?=
 =?us-ascii?Q?fTsEbmt2TKTDrqkwolh1qRR/btK+It/4LmpvdT8Uoi+9tnH6OGyB5rk+NQ8B?=
 =?us-ascii?Q?Fy5MBDO3n8tW+3yZ5Sb22vWayVJPD1LB73lKiy+D7faMFzalMm/AhNO+3eYD?=
 =?us-ascii?Q?EbZ9uWJ8v6neIHNP/uuM5BKByACilDIOSQK7fRGHIZD+HarBMTJmwJr+ygHu?=
 =?us-ascii?Q?cTXusES3hgnfssQ97VLPOjsFQg69ck8XZd2JcBRtxlzqFjYUb8hodFddovsh?=
 =?us-ascii?Q?8o5+ESTfmml3MEDe254xesL6GkaYXrEtN4/swFwLxWxLnCucqo36/paOCsRu?=
 =?us-ascii?Q?HhXzQoqt/nH4aGWiqeUksMrNOTX75heqmUoZYGPZe9oT2NmcwDxsnrCk7a3r?=
 =?us-ascii?Q?sNGwVpf8auBjmLBSSkjbX5bJ8UUW0iI0ocqlgkhGu+elHUmmS4M2Eo8+dEj5?=
 =?us-ascii?Q?vaH7uBT1O+sWib8WrFioEgoFkLuju9pKOin/SglfgiGNN7y6kfUw12Xxiv2F?=
 =?us-ascii?Q?otwUinu/VAbmdejhwa0ofAUM5Fgy/vwQIXU92SaqtIC0xbpT8jDe++1ysh1F?=
 =?us-ascii?Q?i47ipSf8kVn3PJ2QD3ZnDbLRbRmD2aTYGK7GGyIAZsf84upg5TRPV+BHt9DS?=
 =?us-ascii?Q?QWtM/VygICpcdW8sovVtk5Mlqx8dLuwXckaue0TZYF90K5PyLa5hxFNCbkvy?=
 =?us-ascii?Q?oOLZ7XBmWBuK69RJuSAdEmgesSC7rs1u3T7hU/OCTK/d+okr++zVAiCQlEtE?=
 =?us-ascii?Q?zt92vJkYuSj6K61BPv8PyKTk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972403ac-5fee-46f2-f22e-08d8ef075bc4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:56:55.8857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKIwcNcZQQFMwwmKb7Q7iab9yV5vaR/OOPNXr4UVyMLdb9MRc+6yh6sYc3xmjcK9XIiZqFSYs/8dgFXB15aMumqiUGIvNElA05i7ZAG6P8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4018
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240152
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240152


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


