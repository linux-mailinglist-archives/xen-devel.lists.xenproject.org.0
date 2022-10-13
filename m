Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03865FDBBC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422207.668065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiygR-0003l3-0F; Thu, 13 Oct 2022 13:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422207.668065; Thu, 13 Oct 2022 13:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiygQ-0003j4-Tf; Thu, 13 Oct 2022 13:55:34 +0000
Received: by outflank-mailman (input) for mailman id 422207;
 Thu, 13 Oct 2022 13:55:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bZiD=2O=oracle.com=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1oiygP-0003iy-NM
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:55:33 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a61d94e0-4afe-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 15:55:09 +0200 (CEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DCX1DU014995;
 Thu, 13 Oct 2022 13:55:30 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k300356wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Oct 2022 13:55:29 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29DDBvTU028528; Thu, 13 Oct 2022 13:55:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2yncktc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Oct 2022 13:55:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB4208.namprd10.prod.outlook.com
 (2603:10b6:208:1d7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 13:55:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Thu, 13 Oct 2022
 13:55:26 +0000
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
X-Inumbo-ID: a61d94e0-4afe-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=bpSvYUzf1hnen2JnJINY3EOINx560cm6soQcdO2nURQ=;
 b=T46myOM9Zh+V8T8F+Teloqm9y/vDrqK5k99Nv3VfaUc3op2SLKvCgGZZN/0eFkrHLxJm
 F6NYlpy3nwlqhHXop51xWmLJugnMdBEOKHu2hyjQmlupFDiKS9VlyxUgQXXgjZ7L1+Ec
 PST2Iz+n19BSvufzB0ArHo3eRudlg3RMkEuB44xvGG6qDoEftf+tV8W5cmFimYjcsvKH
 4AAAK3fZvURx/sAAkVn+5tqBcmR0p/DUG8b2WSQ4X3puQklzr+frYcMuHUy357KYCfJ1
 +1INmrK/kbo8dP7t5MU5mZFIBQo1gB01EN7g/U4cBH4Y72acRt8ATT/9920PZkNtC+Lk rQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WD+GaC/ERnk3CqUOpLMestIfzelwKrerOi1XO+o0JR4E8GJ5HXPGiOdtYzoMK7Ki6SO+m75f/y2WZHigTr5jUyqBE7rm4jRzdR7ZkIEzXEtnxH4mmExqTRdKOD//0Dn1mj/aiFk4sjL8BVxcve357bdVVyrQojktPtJ9BKRVWHERGC99QzVlH6EpTh95HJ+JKpk/gRHmNM2BFw6p+90sVX0FgjV/oi8E/k9DHN98GCYXEYrVTkhOM8qs2wo99AJ5nasvw0CLGApLCFnehLtH3yt8lVkaDIM3w2xB/Lp/JcBr/hTawW2eJP9TYbgtgVUT03g2CnwTeMWzy/XJ5VCaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpSvYUzf1hnen2JnJINY3EOINx560cm6soQcdO2nURQ=;
 b=EJaOIUcDkDLV4/mCsrLTpETshMom7WaHaTyb4IJfpK/8UWPdcKP4UxP7wZjfN/MDbzxqdyLrRwtNTxPc6HxqktzlVVDHUKfIu6fOMHXFsUUF13EStA5w1+zahl5K7hGJSqsXY2btm440haNoRXLQnYhGwq53L+Xxe9cENfzarKcRECu3SH7x9rTTKQ8X+0CEtg8x4sLqZjez35+hf4KUzIwkNXKH6n9Stp+fMVlTE3TKasSqYxdknJSW1ZGR6tUFZ3NhRTyr/K/j+G2g5xBnrp48RcjUMwWHsceU5y8CYk7cFc7dh0mw40usCjw2ERZO77Z1p1lyREj1JsrAcjvKww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpSvYUzf1hnen2JnJINY3EOINx560cm6soQcdO2nURQ=;
 b=uLYFAhmjrVef1JtQ0aqCDtIMK0M5NyxjXzGEaflpoJCh04mcJaNARwDaRYwBlUcEIBHuMafau4dKqnpSh0qcBs6Go3a0x8HvALvOcYs8WoUbrs6aYLIREjjBxdVITYZLStbFY4J8ppeTiu5gG+55Lzt8ibsusMrLDCtQgwa+T4c=
Date: Thu, 13 Oct 2022 16:55:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jgross@suse.com
Cc: xen-devel@lists.xenproject.org
Subject: [bug report] xen/pv: add fault recovery control to pmu msr accesses
Message-ID: <Y0gYuj9WKF/57zq4@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR2P278CA0075.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|MN2PR10MB4208:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f29731-dc2b-4c7b-feb4-08daad2294ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BSqS1+k+PWUAC6Lps0UshVLb17TzcSxynq6/yRv/lvvagivUIm71OksqvZ5cz0sScgvX+Giu0Yp/D3hXS3mSJh6zE8lC3Rzb1UMPtUDwpqEzc9ssjbeA32tjNyw2QPS3ko1qeXYFRv304HtzzghPTahTvfoBf+0KPbSh13ni/8KtOF2Mt9qFNeY7zQj/nOkv09pAz3aVY4LuCNLj5oTeNcPEAlOEADpvGyauMd1HYM8O20gRSD4TPIKHWUf5SA6AkpyxAVXmhlBgdOCrDMJDw8ucbd/VZBoSSumdZP79sAn8IDz5LGB5h0CDnJ41i70n6LKGkUQ6eGwf86XLJk++egEu6QOnjP//YUS6agBy47J/3oo1VTMl25e142RJpINE5SbLN1Ukhz2yxPQ16blLc/fA/clZfmHpA1xdLk/u5o9+0PlK0rxAQfvE7sbbtLKWhkv4G2AhSCuVY5pFMz/3S4m/YtGoana2dzt49dLJzCvAdDGWbfLWbGzS445KLp1G9NAQr02JeSRJWBhU0nJGfOplo3N/rrpZWQ2YsfHhzp6r0xV4RcuCZGdNRunHkJvZmp1mdcoDsY0XpEYAiLJBNqX0dTxRPtxjd8sLAKZcKYa4lCgo/1fX48K8KhaEDZxrwr2gj9tJKPmM6dd5G5OIstaZN2oGHTExwhhtrZowDtEcTDoXCFTZ6VrKuxUEmsmCffhAa9a3nsM47KXnbRkmAw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199015)(5660300002)(186003)(44832011)(6506007)(2906002)(41300700001)(9686003)(6512007)(26005)(8936002)(33716001)(38100700002)(86362001)(83380400001)(478600001)(316002)(6916009)(8676002)(4326008)(66556008)(66946007)(66476007)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3AkDDjx6oqAhm2R2p5dFop38CehIWgkk0oUPQMFR/CMfgZVjgu87oi4cPBSw?=
 =?us-ascii?Q?xaFnCBIS7PaxXzjBjyCcrk8WC/6MUewAVwFIvAwAbFqb78CGdkqd7M47WBc5?=
 =?us-ascii?Q?vjaw3lHwa0vyvfnSKJ+T3hOTj5jleKcTCc/zcIqlS/x0ghWVCH5jUU7KgwRW?=
 =?us-ascii?Q?kgObM4ARQCL0OZFWj2CBzjeu3nvOzZq7bRHFS5vfbGJ7JAkmjVJZVm4AePRr?=
 =?us-ascii?Q?OHtNz9R4oIN0RxLhQKVq83JiFkldSSiEN0tpW0VY3LCRVpV9m2v7I29v2zIQ?=
 =?us-ascii?Q?eskgdBadhyu5ruKwN+HKVA6p1t6DUHAIcAoCUWrytLXPR439BYqjUcZvvzjv?=
 =?us-ascii?Q?BTHxGiICeGLLTf27yIAcbrWSr+24nrh+Z9PaKn+T3inYVsda/+PWxlBSsV0y?=
 =?us-ascii?Q?KiOerA1TvAXZ3nDTJ/kBxVtGYYo7EvpQo7pzwjjX0PXNZKk4FTd+jRGgPhxV?=
 =?us-ascii?Q?b2cFQU6su8Q3SIC+dT+q9ZQLGAuGGV2AuJk9goEm4W2n5Z+cBqxF0n2OwANW?=
 =?us-ascii?Q?/KiRWP3irXyMzp/F+8cxqPBBDZgCLph7z3SHLAjlCCE+00diz1SIJVkzHG65?=
 =?us-ascii?Q?8JFzcLq6QfgrVyyGP8LRWSxtYKoQERv/sYMg8Gnrr9sdogG/tQ2LFYgToWe0?=
 =?us-ascii?Q?jaFoerjMO2XalWltLOqv6KHaWwRW100AACyJ6WhYIm1w4WzYJBIc/cIQ0uwm?=
 =?us-ascii?Q?sLI8riuCCDJThRNoLHcAbJPsxTTx8nDjpqRK0X3NEnWqTANfxFzMMy3FwFMA?=
 =?us-ascii?Q?PdKCOgSezMPfzvSVjzcD3KffkEUSwq0BZHCbQ1D8VJZrZ8VvEqEW4vGeezIh?=
 =?us-ascii?Q?gQ9tGz4Jfy96Z7LlWhpzonhF//klyM+aIna5TwcW0Scyeg6Invw3Xtnwu4Pb?=
 =?us-ascii?Q?GqEc6OgNs8iVOVAM+g/r+cuGFZnsDhnsBEic21cGb6zDvP/qH0O9mPyXw1Td?=
 =?us-ascii?Q?y8m2+Hax08QPKUCeDcQZPuw8nFd+XntbfFz7xKdB/rQhw/hqpuZLjpi1CYqo?=
 =?us-ascii?Q?Na8eH6IJu3FnzGheoMA5m+T+CzmCTv8QnwzNHukaGiiBh6WQq76V/imnIGc8?=
 =?us-ascii?Q?VJQMwv4gxU+rDVNflzkqh5Xt2GJatIjkYlFXfXgfSAu6vld6Gx1+Db4ThE5M?=
 =?us-ascii?Q?TRK1Tzf1hl8SSQbDyt1bMIkAhv0tCCVSHBizO5z7HER7aClp3R/pKtvK5TV6?=
 =?us-ascii?Q?fE2zAQhMf4cAz4h5l+CPvKe1jmmpfIcD5/ytJufriPjK45e0uATZ0L5TVVRh?=
 =?us-ascii?Q?lzGkDD5If4Z9jAVz4OFKsSrgcIs0R+iJsU+SAAgD7fIPBWS6jJBDWKanKv2E?=
 =?us-ascii?Q?8+fY0wPi29FDBSOAa2cHcw71p5GU+0JMdj9GMdIv83CWNnOt0Nr+gfIGi9D7?=
 =?us-ascii?Q?2mehAQvXjUgaLbK/lFMtxEGnq8YJz6E/596rJJ6wtdVU6uDvTsOqQU14yaBk?=
 =?us-ascii?Q?wCVyj4rZz5Hsl4XnK/brKhu/I8aXGpXig3MBfeIVYhgle7YDQtvpOnkioKqP?=
 =?us-ascii?Q?dQ/TAPFxGmG8x0mlhLfDFYAAZNy7UZxvi6su2ECJ5GgX10KAp1H8VbB9OtFH?=
 =?us-ascii?Q?g5EGJdRcItFgsoYoR0QltDYD6/hLV+qK57SM5MqUfMCWCnM4J0/qC+YwBVBa?=
 =?us-ascii?Q?8w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f29731-dc2b-4c7b-feb4-08daad2294ea
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 13:55:26.8705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcGw6qx4iaV7Rvv4aAu86Gpp2GmKM1Eg6CTlv5EYL6DJVQJNr8FgpAkzDsI9GaZJt03h9I8BmqzTUHLXcUgcLU4YGVPFpmgB+2QpVErt1/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4208
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_08,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=817
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130083
X-Proofpoint-ORIG-GUID: LbO0C4y08GV3tNW52E2Y9A6ppRT-Mvu1
X-Proofpoint-GUID: LbO0C4y08GV3tNW52E2Y9A6ppRT-Mvu1

Hello Juergen Gross,

The patch 8714f7bcd3c2: "xen/pv: add fault recovery control to pmu
msr accesses" from Sep 26, 2022, leads to the following Smatch static
checker warning:

	arch/x86/xen/pmu.c:310 pmu_msr_chk_emulated()
	error: uninitialized symbol 'index'.

arch/x86/xen/pmu.c
    302 static bool pmu_msr_chk_emulated(unsigned int msr, uint64_t *val, bool is_read,
    303                                  bool *emul)
    304 {
    305         int type, index;
    306 
    307         if (is_amd_pmu_msr(msr))
    308                 *emul = xen_amd_pmu_emulate(msr, val, is_read);
    309         else if (is_intel_pmu_msr(msr, &type, &index))
--> 310                 *emul = xen_intel_pmu_emulate(msr, val, type, index, is_read);

Smatch is correct that we're passing "index" when it wasn't initialized
but it's not used so it's a false positive.  I think KMSan will print
the same warning as well.  It's technically undefined behavior, but also
we care more about real life GCC than the C standard...

Another thing to consider is that eventually we're going to make zeroing
the stack enabled by default and when we do that the performance hit for
setting index to zero will go away for most people.  (Zeroing the stack
makes uninitialized variable bugs defined behavior and has security
benefits).

    311         else
    312                 return false;
    313 
    314         return true;
    315 }

regards,
dan carpenter

