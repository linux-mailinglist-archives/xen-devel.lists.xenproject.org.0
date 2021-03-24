Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9AF348360
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 22:05:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101187.193368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPAh2-0003v8-Ld; Wed, 24 Mar 2021 21:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101187.193368; Wed, 24 Mar 2021 21:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPAh2-0003uj-Hb; Wed, 24 Mar 2021 21:05:32 +0000
Received: by outflank-mailman (input) for mailman id 101187;
 Wed, 24 Mar 2021 21:05:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=egK0=IW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lPAh1-0003uZ-JO
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 21:05:31 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c92a9e70-2a49-4fd8-b3f6-ad0e0cb5fe08;
 Wed, 24 Mar 2021 21:05:30 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OKxt9E103461;
 Wed, 24 Mar 2021 21:05:28 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 37d90mm8yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 21:05:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12OL0Xn3150299;
 Wed, 24 Mar 2021 21:05:27 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by aserp3020.oracle.com with ESMTP id 37dty136n0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 21:05:27 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB2840.namprd10.prod.outlook.com (2603:10b6:a03:86::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Wed, 24 Mar
 2021 21:05:26 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.025; Wed, 24 Mar 2021
 21:05:26 +0000
Received: from bostrovs-us.us.oracle.com (209.17.40.43) by
 CH0PR03CA0142.namprd03.prod.outlook.com (2603:10b6:610:cf::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Wed, 24 Mar 2021 21:05:25 +0000
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
X-Inumbo-ID: c92a9e70-2a49-4fd8-b3f6-ad0e0cb5fe08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=mCJL1UVF0uGsPx6r2QxWvx1KIL6nSvrVsNJD9J0kgL4=;
 b=OIjQYUNIvaPLCrikIyVFJPUceL5rib1tBdSiytluybyi9BXc30DxSf4rxzA09u2w2R8j
 8PzO+L+D2ZWeairLV3+QU/RR7tKojjHYpobn3NIb71fdXgYKG6vpxGoOg6yPJJyNXgn0
 F/0zG0tMDrLk62aFgSRo2NLirt6Mr11TiWOlcDMfTKMY0D6RUbRsJHIhoYyzYyweWgqu
 qFU3kZnNbDcATJmsVb3dNrce0NUjXE4RcKD9rbdfHQoev0KC5XktJ/HfCMIJKqn62yuV
 AuJw6PGcGGFiXDgmr9GdiebCa0WAC/6BcTlAvTG68E5hI/ggaFYerNqlUqQyPgPWuC0U 3Q== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUoOj4EOavOZADcFbzUFvcT51hwN5nYiiXxX4XeEhMIZ7MleGyrhuYnHmqSkJdvNAopHE7ux5VaoZjckiSzIrsAZWnxLOJjKd5JgroFKlgnBWEMLapIOjn6c52I4T+zJ0wNm5TeXrn74jg9AGo7RQ49KBh8wrWLaOFMGJdpi3fqZmYnfbc+MCWArTAVSRihBNakx6a5swZPumEql5Eu/KIsz0GVhR5yEGLoXsPgddyBddpQx02Ilj6ANJuaOfzeWakyyg9T7z4CQ/X/gduIsroBY6ff8O6D7IxrmACLWFhrS5HjOfHBmXofRrjxk/n3+GWmmAYxHKUCS3pLLYXvxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCJL1UVF0uGsPx6r2QxWvx1KIL6nSvrVsNJD9J0kgL4=;
 b=WS8Ag0fwHbmfQk4hkNiwlFdSJen6FoKlWqLEtTZSvtQIG64qkDOgYCTbpbLmN9Xk+PicobDz0NpXT3vGxroYo8mlrmvbHYLFIR9AbdsHfoel7FuuuGC8mFVfVbJj3amiLkAfbh/W2llkorrCxhrrgyCZpSIM0tZhSsgihWRZ60g7r59qnGK0mAidaKwnSfvM1bo4nELCKYQsKGIG54y3lfHj0jlEDImb7SlZP8x/ZGXfZzPl7AnKoXyIdhv8c6tGdC/vbRzIsb1M3ZizBOeU3WcszG59SOiBIu3WwJeqfRie53OTiKApWJ7QFICV5xpcusI93KNh/eb8U/jOvQ4TAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCJL1UVF0uGsPx6r2QxWvx1KIL6nSvrVsNJD9J0kgL4=;
 b=qTgvj3qNd/3l6kIRt+UkeEhoPjlMSbUqEdfYdSaYZ1ChGxb86PN3UJEbI/BqSySNYjyTx3xgNCwTKtAGH68mHjG80OOp+KquCwiij5tQKDzNnNJZrn68Xr3SWLqqGxsvyeWL1apN635jvusovoxwYdCJVmwD2uTJRQcR5IUnpkM=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        wl@xen.org, boris.ostrovsky@oracle.com, stephen.s.brennan@oracle.com
Subject: [PATCH RESEND] x86/vpt: Replace per-guest pt_migrate lock with per pt lock
Date: Wed, 24 Mar 2021 17:05:05 -0400
Message-Id: <1616619905-640-2-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
References: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.43]
X-ClientProxiedBy: CH0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:610:cf::27) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be7f7965-bc39-416e-0051-08d8ef088be4
X-MS-TrafficTypeDiagnostic: BYAPR10MB2840:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB28409DD657F93547FCD6943F8A639@BYAPR10MB2840.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:534;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gF7hY3hPhPTO8AopiIWlG2STahSupVrLwTnQXhqRIuGr3IbJ3lAsETH0Uj6NVDdmRQbu6W5saiTv759BVfsYZzBHOCa91gtNeMIrb1PPuFTxtsK1oirMBDSavIEk6wc6fTcWvN+eFGZHd0OeFwc1kTxvv6X9UMKuMkicIBWcQ1W6LaXwFd9Kvzmk51b8DmWDZ+kTh5KVGd4oj7YzO/eEyTl6Qobhm2uzpf3TUA5DtUH46URAwBajLCr+iK/FtuFNYcBDzTck1ct8w3ES9LCHj/YsaVsA+grXI1xJeEkXanyya7hrWkqN+Xh96k+iDAZIGNEy3BbXy5XH09Nzf34LcWFZ/B7Qk1yMHVN32vGUEB8NZrAwOJaoFYKajo2n8CdrSm/z2k9uQ7ftbX8ULfE/e6qbrsIHu0NlODaz0ZdKEPk8giwB1Zi69il3mkk2JiDndaL0oq/LrqdDl1b2kvUw36BY4r2pW/l3fZuuWXcsMLh/9yWENtDws8n0/DoT++Lla7djdKUnceAQg/yMkAzY5W/8HygW0Gc0F597SkkmhZuw6qdlTT7UW/j6PBqW8WCAeRHN2qm8UbUVHfqVfJIQxPk3RTcc7p4TxaCL5AUjH0jQ49mfUGmonh55bKI3OXnepRlGRhuaed6j2q1c3dtgkdqgEb/iMyZphf42z7fWzVI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(136003)(346002)(39860400002)(36756003)(26005)(107886003)(8676002)(66476007)(44832011)(316002)(186003)(38100700001)(8936002)(2616005)(66556008)(66946007)(4326008)(956004)(16526019)(6916009)(83380400001)(52116002)(7696005)(478600001)(5660300002)(30864003)(6666004)(86362001)(6486002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?/36/80BSE0/vHCJd9wdUCBWEjnc4B2hufUcIj08bvgOFdauySqpF5YTaJJbD?=
 =?us-ascii?Q?izjAErZtZ7W0zgkKgOWpOkJQ+HKA4W++6A18OzEz6h9f9mdxGYTAzYMueyGn?=
 =?us-ascii?Q?Gf24yiL+APBX0gABd4Fv/RtjCYzF6HUYQ2xXTsxwlunzDxUhKti2NX1q84aa?=
 =?us-ascii?Q?jdbgPRZGlrkPH1BQDVkwLTZQ9nVyBKaKLFczxjeh2MadLHIPpkDJoeAS8qqx?=
 =?us-ascii?Q?UEAYHgDB7C456ThVydOdfjHwfbM1NyzqNKcbtz1jt69lL+fshyxo4Hds1f+M?=
 =?us-ascii?Q?w+FTgb/J5Gp66Y7LZSEiVpDLb1oiL06xxhxHayn2aKTBXrc9XRYhey8JXy08?=
 =?us-ascii?Q?o/E5MTwAxvgMz3VTs6KjlP3ZLHLhK7BWAe9j7TU9uIL8m32XCjcR9ygWORvv?=
 =?us-ascii?Q?QL/M0fex0ZChF9k9JADaqhjIZo+ZPMkRneh5L3z+aCku0wfX8Mv7kYDH0dqv?=
 =?us-ascii?Q?0rFU7W/uOyRhUDqwYgj+4lbY7WzqGymzZxgLiAz+CVK5Yrwb312PHAx50ly+?=
 =?us-ascii?Q?MP9IJljZ9Ue/oNwcBqTp3opVGa+zlznPA/xKwBtPO9is2U7thYvVcBZWLpoA?=
 =?us-ascii?Q?7m8F1MRcjbajIPG2ZnozfcxQmgqCeF2J5KUOU4zIx64xW7PMeaglMXP5hcmX?=
 =?us-ascii?Q?yG5jMFEYR5lY/NdQkKaY4EnSi59H8UxQDbRd6N4zDT6Seo/0av6CVtzm8o0I?=
 =?us-ascii?Q?kF2MoGDnNAZzuLoc6+3BqoSsrBSDb5kh4Bok0US8Y45qtRWfuB1fMzLc6YPh?=
 =?us-ascii?Q?IyaakxIi8fQyE6AB509Auk0ZPWZ9XHfFt0uMtasHRjaMxMLBUTToXZE8W8Lc?=
 =?us-ascii?Q?/yUBIGUGjVJqgj8CAT2M9b/DuvFEffcaDeO+x1J76qoUa8uKFu5A7tACMHeI?=
 =?us-ascii?Q?tAFqZG6vsjaPFoSMXCHr4s5Lejl7/Z9WQaZAwG827rbWcgWggbhmiWYITN3U?=
 =?us-ascii?Q?0b777jJTVMVLWpCkADx0RGpa5UXe22+tOYrGviCsE0LBiBgDBDU5Un9M+Gi5?=
 =?us-ascii?Q?c3///HyMRHZoTdB5y8E0jsItYHpLS3pOVQo3Vj+yu4w/aKZc8LauWUZ65hmz?=
 =?us-ascii?Q?RwuJe6m1SVFEl5n+Iek1sM0j8yECZFO05UnbcFJQxto7yr6+MJiCh9D1An9r?=
 =?us-ascii?Q?z4Be98Bt/X+aspcmUhNPQTS3S5Z6fOGA/bctb/u9VcEJhSXNc1aYPcLsd/3Q?=
 =?us-ascii?Q?23allj36uQ/6G3F3BHxcd3iWoY2APBmAcvJP6V3PoxN/gybmxZOIxO182G2N?=
 =?us-ascii?Q?u/TPslYzBTTrqOl1xJ9AOq2eDHwWUJ9TResnjFPrs9QGwFx+rwIvgyJ9ZoSf?=
 =?us-ascii?Q?JuPFui/DT3zf7k0sqk6OfW+G?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7f7965-bc39-416e-0051-08d8ef088be4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 21:05:25.9906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6VrotNMXlwkhZil5lCpS/Cg+CZ9VUMZ2oI4BEGRn0sPP6fIjqm+9drvySKoCq/FzsGjdaDXh44fUR5vPilEVT6qF4J0/I5oW1RCVvKiJr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2840
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240153
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240153

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


