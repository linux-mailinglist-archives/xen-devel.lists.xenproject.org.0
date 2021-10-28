Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C410F43D888
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 03:28:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217582.377681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfuCq-0006n1-Ru; Thu, 28 Oct 2021 01:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217582.377681; Thu, 28 Oct 2021 01:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfuCq-0006lH-O6; Thu, 28 Oct 2021 01:27:48 +0000
Received: by outflank-mailman (input) for mailman id 217582;
 Thu, 28 Oct 2021 01:27:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XuVQ=PQ=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1mfuCp-0006l6-9a
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 01:27:47 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f31fe5f2-0269-485d-b85d-84d770fe77ed;
 Thu, 28 Oct 2021 01:27:44 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RMoQ0b004983; 
 Thu, 28 Oct 2021 01:26:23 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fj6ctg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 01:26:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19S1G2P3136150;
 Thu, 28 Oct 2021 01:26:22 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by userp3030.oracle.com with ESMTP id 3bx4h39y0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 01:26:21 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB3761.namprd10.prod.outlook.com (2603:10b6:a03:1ff::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Thu, 28 Oct
 2021 01:26:18 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021%7]) with mapi id 15.20.4649.014; Thu, 28 Oct 2021
 01:26:18 +0000
Received: from localhost.localdomain (138.3.200.16) by
 SN4PR0701CA0044.namprd07.prod.outlook.com (2603:10b6:803:2d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Thu, 28 Oct 2021 01:26:16 +0000
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
X-Inumbo-ID: f31fe5f2-0269-485d-b85d-84d770fe77ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=00hIRxLONqx+89sOGBZdZ0BNvFPX/tr/Ga097oZol8E=;
 b=RXWQ1nVHFH22oxLuSTWSm+MUpBaedacM3oodIlY/4ca9cEpy7DOnC+cIDWMUhejse9B1
 cFA/ornvfk0wHiUVR9wOgnxm7pcDEiWlylc8u2CjVdyDtUzModADyfgdHuqFeRrlYY2X
 XUbF0jszYU2J0DjjY2nSHClyJJulhpcL9aKC/4uyqint3gdCN8+/xSwXcUlFbhw6L3wg
 SXXLQarXL9aDcrelbY8F8r5andnKiDBTocW072q1KKJyMMVqsB3pGTcdrZAEdQ9Mjkjz
 hfWxnnnEhW55fbR5utvO0L6Oh1CfcpcAbzjq+yLkudrwAO0L/Q4K1gDY6MHhP92sEbAo sQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeZeAwLfVj0nL+YJy8sIk+zk0h8ZhbGk9RQ3Fr33b7Og9AI6Gsvdr5WINIgIbaqVilte4UfdhvGYFqGL2g8gkzoWJ2tot6l6QWdoSfz55yVIS9B7etAOabvdA97EqZxXmU+vQ+MPxMg4c4FIBF6VbkjQlORHGehpt3c13JHkcGf1KcX52wloET3xBA3ZrxaO6OmDEua+YErGht/ZzCu7wdd8Vbjli5XEOAOi7L0Qkei3dcmgg6uRwJ+tn+8h2tja1Ss121wrek3sKxBjaiLKSgk5zfplt1YpVlWh7f+G7Xacdm28mIS4qTX5uK2+Gy90tdFbcynHDxsw9KXb2Yj6Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00hIRxLONqx+89sOGBZdZ0BNvFPX/tr/Ga097oZol8E=;
 b=cVrc9ERBkhGcKMDYheuIGoyRTCWc7fWTsnoL/7wceO6+vCQ65TA3+855kETErWXC1zaqREXvgylBEGTcP54hKhc8EujwPWpsGJJXSM2IZvIzWVhsUGN6H6+cMj2UB4D0LNY1CW4YSoFserlzSMgxDs+4nROmREAL1dUq6L2tzO93I6Em0JsuUcEHvYbDRPZ+RBaN2qiWe3lcW9MeW6HVGNDLRzx5/dUp3ATW7ymH7MipbZXiWsVNuZqW2E2xtLqfSHWVk3/ySVvU/ZlvXwP0e5a9XJN+C3TDiGABBDeWHRjhfoQ/D2toVlaH9qteXYBs3aJVLquZTnKnn/SYvSYOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00hIRxLONqx+89sOGBZdZ0BNvFPX/tr/Ga097oZol8E=;
 b=R9J2bIbpyyoAIDSOJtkw0O1NQnUw4d4954SxzNxdQgnEI/rRtpzb9m4IPVnBYsniflBdTG++KL84WX1qAQH6XHD1Kheqmwtl/K3LeTmqmgTzUOABfKP2v1FMrNCJtikfbmk3OstC3YfFYcqzAEdfq6zgcq7l1T//O1xI+1NHS+g=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org
Cc: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, joe.jin@oracle.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] xen: delay xen_hvm_init_time_ops() if kdump is boot on vcpu>=32
Date: Wed, 27 Oct 2021 18:25:43 -0700
Message-Id: <20211028012543.8776-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0044.namprd07.prod.outlook.com
 (2603:10b6:803:2d::17) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee9e348d-fa09-4a9f-f005-08d999b1f0e0
X-MS-TrafficTypeDiagnostic: BY5PR10MB3761:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB3761F0B338E4D170F1F9D35FF0869@BY5PR10MB3761.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GZ0PE8fRiQtK/1s94b3zXHZ978dGcJr5t2hJngZ1Nb853CSC2Yg4NTSdVZHrui0WyNyEuD2Mw4peahW/L2CZPZNcdOhZd0m4oBkPjivgOonoh+hoT0AbG38qmJJEOXtwKSfj8I6JEvmUy/u3qBaRVq7n5tvaUy40WCLM78MDkdZCM6ene7lwrK8+oEHhq4l6oaKdxKjO+Cdgi8okwM8YVb/yeADTmvomRkyGSX0WeIJY8p/Ab4ZgHURR5BQ+Jqg4PzeE8Us5D9Q/nenuQbYiThNTDnThhVHAFOYh0J3at/o7mYWAcFzCoEQMG/6wCJwTHzer0GqJlMAqhWx7zLCA94GtXEYWSP/7/LUa+Mbco9M3J4riAYUcZaQfOfQDhZMqFVtrpRPo++PVC2PDG5dcjK6fWUTnhMWlr2aJpzU4Y5N6zc/cD+N454BFzC4uK2AMLSYV9r6R7TybRuP+piDN3cBgInhhHWE8Q5PCOxPxxvBoHfKug/83sp5+/tQ2An9d9XApoZthkxlFa10YajJKHlBA3rc4XGxJJ9MevyhWePpl0kJZp+dzLNPU2+s9QHHittyv7It8c9lb8+WgecSu721YlhfJSFgPWDqnbfwX8u6Wiyiyl553oGPyVJtDKqfXB6AFEUL5n++5hvFydIsaxkQDGFy99JXmwHtsGeIepSYbEbhg+hXxc3EfS8Ndfnvk2k4XvmV4W+Ks3v+rNB0Abp37OuwzND4wIT8+XKOjFmaL3YRhLRYBNU01GFQRc8Guq3/JGDlL0dLX/221+hDjeyuOi4twWrbyPSJuonbqEgE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(2616005)(5660300002)(38350700002)(2906002)(66556008)(86362001)(956004)(66476007)(316002)(6666004)(6506007)(38100700002)(83380400001)(186003)(6486002)(66946007)(8936002)(6512007)(508600001)(44832011)(26005)(52116002)(7416002)(4326008)(966005)(1076003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?90jjWBT5DMTT5TE7WJ7uCYuMl3UkX10N8b6g7zr8ZQSpf2xNqKPKxKvFmsCl?=
 =?us-ascii?Q?xUHYB9TJyyOAWgD8peO0JLJBMgsaKC1Ryjqo6AEcbU55xZF/DA3L/c3yQmnk?=
 =?us-ascii?Q?dAr76I1pb3TGQGIxggg7PVYWStyZErJw3v3QXqgwi7ncbfuaSpJetsvCYFQp?=
 =?us-ascii?Q?bntFohuSaPU12yHfptFAdtwJn16mZIyifPEWUjwepe69A4nwZicC5H03Yu7N?=
 =?us-ascii?Q?mV08XCfjiqlFJm1X4MPWM7FhNjUWZV4NjS82sP8UJlztSnArPjHEiUW1pGli?=
 =?us-ascii?Q?Ahr2RMCOUcjIQeDZ/ZzOVHPeJTpzoNzirQDqK5p95AaNt0olQ07CZhZyYiWx?=
 =?us-ascii?Q?+TP2ODfCpm0JVM2pXByNU2Xus28q5Z3Y61+G39tgianMAlvHbcbEE0hI+8us?=
 =?us-ascii?Q?wo3539OIgjsSJNAdqzYJTWI/+bG0z0pcDXPaFIsOpCFbYx81Ea2bREbXIM3A?=
 =?us-ascii?Q?1BPNAkDSRyvSI3x0XcYZ6GRir7APZ6R8E4yn2sfL7wujuEPIOzuVEUSGRPaO?=
 =?us-ascii?Q?iHUJFQhNLqtOYSw5FZtdEHNVj5y5Sxt7WYHGkCfL8/ifZRSNCCpWTves6VLb?=
 =?us-ascii?Q?78PV+X+cI54COPvn4bgbTNDsQxNmwzMFyfZgP4jVGof63/roUFzp28THAUk+?=
 =?us-ascii?Q?tXmud+uQZu00LjFrj4Otd1SSEm/cXHRzwy5zeqcnkL9aSNjF+iZKYSrtYhpC?=
 =?us-ascii?Q?kLGjSfHxJHiSSWyk2s9pICsL977TMh6V6VJb/tkKlyzkLnCANuFG1T3z1PQM?=
 =?us-ascii?Q?98AObkglseytl9zuHE+oY6g7a3XGjfBQE7Nc7arAGUsecwL7D6xdSZtKcyOp?=
 =?us-ascii?Q?GdXLLwoVHuQXmgRO8b8MolF3mgOQOxDG9ABiyq2w7CjOFPDn9E/EUx9Pm0+W?=
 =?us-ascii?Q?NYo9BI53cCD6bIeVfgYczP56fi/4+S727c/q6aiuHkBuj2LH9ViUOEWC5wJY?=
 =?us-ascii?Q?c1h3dpYTKBF5ZDp4vxdVNAEqy7AW4bMaMjFYGVc55SgIQ5qzOlsFU62a40wz?=
 =?us-ascii?Q?eoDGz6Xj2EgY/8OUKOz/UHG+ZvYItwGf9YieJKuHoeAMvaYBXoIAL2cns2Y4?=
 =?us-ascii?Q?5J97rxZ5r95rjq2yXJqUsGezX/s6ZHD6LasMGNKnHtkyAEdZ3k0yWjLUpLFj?=
 =?us-ascii?Q?+NrjjC6PbEwiTLXl1HtExYiqL3nP4JSJ2YBVxafKAwFAz0Trlq5zj2FTa2Qw?=
 =?us-ascii?Q?UNZTRmpoKvsCPGmcxyJBuCUGwQOhstSuixCNePjviHUTic+TeXhLzflsTxHt?=
 =?us-ascii?Q?Dwn5SEEuk8B6KHsORQ8Gq7OnOJ5ZnmEO0birBxVVm620eBFvtjTxWSs3QzLs?=
 =?us-ascii?Q?ncRgjeqp0dP1JQSv/ZZLcoSahU96gCINlHolJmhhJ74ilRwWmgvWVX7bxtuA?=
 =?us-ascii?Q?e3IJ5BcpNguE3b/gjFVYiJcITiAlOwlQKJsG929+IhCShaLHqvifIJAmT/NR?=
 =?us-ascii?Q?7UClibjGpV4yTEnRioKcK6gW5PjhAIeetmzPHaVaQWrusQEmYjVannfxtPOX?=
 =?us-ascii?Q?OcQQVSMAIPtzRf+NPsk5hegEVhwbLFjY9OLmBWArkBk+BP9odJUiYYnJoX0v?=
 =?us-ascii?Q?fYtt9Mf/zsEGfQDWIfMG1cFBhlqVUBnsR8OJPc0K+mTuQ30ckvDE0quA2yIV?=
 =?us-ascii?Q?0fCCTiWyvhSKP3OPqcbXO18=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9e348d-fa09-4a9f-f005-08d999b1f0e0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 01:26:18.1638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jki7SmEMuVURk2MiuuiD6+QLaRR6Q9Gcq0RGgOTkxdbW/AWGjUu80ZY9PqJgoY0dzunokPZLGHrfkqL+T8OWPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3761
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10150 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110280006
X-Proofpoint-GUID: HVIeaRs42jHKtvGrgD95e0-5YT6Jr_vo
X-Proofpoint-ORIG-GUID: HVIeaRs42jHKtvGrgD95e0-5YT6Jr_vo

The sched_clock() can be used very early since
commit 857baa87b642 ("sched/clock: Enable sched clock early"). In addition,
with commit 38669ba205d1 ("x86/xen/time: Output xen sched_clock time from
0"), kdump kernel in Xen HVM guest may panic at very early stage when
accessing &__this_cpu_read(xen_vcpu)->time as in below:

setup_arch()
 -> init_hypervisor_platform()
     -> x86_init.hyper.init_platform = xen_hvm_guest_init()
         -> xen_hvm_init_time_ops()
             -> xen_clocksource_read()
                 -> src = &__this_cpu_read(xen_vcpu)->time;

This is because Xen HVM supports at most MAX_VIRT_CPUS=32 'vcpu_info'
embedded inside 'shared_info' during early stage until xen_vcpu_setup() is
used to allocate/relocate 'vcpu_info' for boot cpu at arbitrary address.

However, when Xen HVM guest panic on vcpu >= 32, since
xen_vcpu_info_reset(0) would set per_cpu(xen_vcpu, cpu) = NULL when
vcpu >= 32, xen_clocksource_read() on vcpu >= 32 would panic.

This patch delays xen_hvm_init_time_ops() to later in
xen_hvm_smp_prepare_boot_cpu() after the 'vcpu_info' for boot vcpu is
registered when the boot vcpu is >= 32.

Another option is to always delay xen_hvm_init_time_ops() for any vcpus
(including vcpu=0). Since to delay xen_hvm_init_time_ops() may lead to
clock backward issue, it is preferred to avoid that for regular boot (The
pv_sched_clock=native_sched_clock() is used at the very beginning until
xen_sched_clock() is registered). That requires to adjust
xen_sched_clock_offset. That's why we only delay xen_hvm_init_time_ops()
for vcpu>=32.

This issue can be reproduced on purpose via below command at the guest
side when kdump/kexec is enabled:

"taskset -c 33 echo c > /proc/sysrq-trigger"

Reference:
https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00571.html
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
Changed since v1:
  - Add commit message to explain why xen_hvm_init_time_ops() is delayed
    for any vcpus. (Suggested by Boris Ostrovsky)
  - Add a comment in xen_hvm_smp_prepare_boot_cpu() referencing the related
    code in xen_hvm_guest_init(). (suggested by Juergen Gross)

 arch/x86/xen/enlighten_hvm.c | 20 +++++++++++++++++++-
 arch/x86/xen/smp_hvm.c       |  8 ++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index e68ea5f4ad1c..7734dec52794 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -216,7 +216,25 @@ static void __init xen_hvm_guest_init(void)
 	WARN_ON(xen_cpuhp_setup(xen_cpu_up_prepare_hvm, xen_cpu_dead_hvm));
 	xen_unplug_emulated_devices();
 	x86_init.irqs.intr_init = xen_init_IRQ;
-	xen_hvm_init_time_ops();
+
+	/*
+	 * Only MAX_VIRT_CPUS 'vcpu_info' are embedded inside 'shared_info'
+	 * and the VM would use them until xen_vcpu_setup() is used to
+	 * allocate/relocate them at arbitrary address.
+	 *
+	 * However, when Xen HVM guest panic on vcpu >= MAX_VIRT_CPUS,
+	 * per_cpu(xen_vcpu, cpu) is still NULL at this stage. To access
+	 * per_cpu(xen_vcpu, cpu) via xen_clocksource_read() would panic.
+	 *
+	 * Therefore we delay xen_hvm_init_time_ops() to
+	 * xen_hvm_smp_prepare_boot_cpu() when boot vcpu is >= MAX_VIRT_CPUS.
+	 */
+	if (xen_vcpu_nr(0) >= MAX_VIRT_CPUS)
+		pr_info("Delay xen_hvm_init_time_ops() as kernel is running on vcpu=%d\n",
+			xen_vcpu_nr(0));
+	else
+		xen_hvm_init_time_ops();
+
 	xen_hvm_init_mmu_ops();
 
 #ifdef CONFIG_KEXEC_CORE
diff --git a/arch/x86/xen/smp_hvm.c b/arch/x86/xen/smp_hvm.c
index 6ff3c887e0b9..f99043df8bb5 100644
--- a/arch/x86/xen/smp_hvm.c
+++ b/arch/x86/xen/smp_hvm.c
@@ -19,6 +19,14 @@ static void __init xen_hvm_smp_prepare_boot_cpu(void)
 	 */
 	xen_vcpu_setup(0);
 
+	/*
+	 * The xen_hvm_init_time_ops() is delayed from
+	 * xen_hvm_guest_init() to here to avoid panic when the kernel
+	 * boots from vcpu>=MAX_VIRT_CPUS (32).
+	 */
+	if (xen_vcpu_nr(0) >= MAX_VIRT_CPUS)
+		xen_hvm_init_time_ops();
+
 	/*
 	 * The alternative logic (which patches the unlock/lock) runs before
 	 * the smp bootup up code is activated. Hence we need to set this up
-- 
2.17.1


