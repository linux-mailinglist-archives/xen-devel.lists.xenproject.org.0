Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3951E429E94
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 09:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206785.362448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maC9t-00075O-TH; Tue, 12 Oct 2021 07:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206785.362448; Tue, 12 Oct 2021 07:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maC9t-000742-MQ; Tue, 12 Oct 2021 07:25:09 +0000
Received: by outflank-mailman (input) for mailman id 206785;
 Tue, 12 Oct 2021 07:25:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kpIn=PA=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1maC9r-0006nC-Ax
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 07:25:07 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2adee3c7-c373-4de7-89e0-212a6fb97407;
 Tue, 12 Oct 2021 07:25:04 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19C6q3TS017592; 
 Tue, 12 Oct 2021 07:24:49 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bmtmk3tpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 07:24:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19C7GMUt128333;
 Tue, 12 Oct 2021 07:24:47 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by aserp3030.oracle.com with ESMTP id 3bkyxr7vr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 07:24:47 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB3592.namprd10.prod.outlook.com (2603:10b6:a03:11f::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 07:24:45 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 07:24:44 +0000
Received: from localhost.localdomain (138.3.200.16) by
 SA9P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Tue, 12 Oct 2021 07:24:43 +0000
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
X-Inumbo-ID: 2adee3c7-c373-4de7-89e0-212a6fb97407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=O7D6Lx0SGGeULyAuzI6QSTKRXt1l8pLOBAU8iEv1O+E=;
 b=0hBAu4+d+odE5Rb0CuKXlImBSuvfVgqVWtBK+BJ3m+k+AZ+UCBhlTttrRKhxA9408IUs
 8xCnv6Pilo9n5PhG85UdDuD9fyp9b24TKgTEdBiV1vAgrED/KmSJu6oBlSi5YksQq5xn
 VDs2rqmv1CQcxqCW6SKUH42V6IfZ7payYDNijGC1dcXWfuPVIuAZFjLM5hbU7aj5Ol7a
 NtOxjDnKezUaUD74WNAA5312nHNfy2pDskLs4yx0/CTIKor7nkbpYakmbyxT7QpKPxFz
 PtUgdZWkYHm8vErj6LfYZVK6oApB+HP1xHpRjFcdNVS8ZoWPwkgmgoAMNzUDlnpp0a1m Nw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9D2aAH5bsy8IrFQuiwEiSON7gR86ONrFuytar1wzDMWwOAz+zpOvMXtkpPb8PJLoWdgaVLog0rhMYNZiHfSLOb0Al1iMp6SgyeSTFApdHwi/hfMr4bhYNgqxVKXM0wdqKaF6cHowcT2csIce7a8U2YPJzIln+wbckuFS+VkoQlMF77HSS0OoHU1rc4ak5ZleH0R9F0FMxyu0A6Z1AqLFqlvPnxM41cWlzyx0HxxHAc5m9MvhQvNJ0LWxrPkpvmw191wgsJA6iJRv/Zb2i+cdmUjUIWKTS0JaVHkDdGsfei5mUh/XNcDkBrb5WDZmf32ncCXbo9Ulhn9bIFq08bH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7D6Lx0SGGeULyAuzI6QSTKRXt1l8pLOBAU8iEv1O+E=;
 b=n4KL1yIpa1AuF1gcxpXbISU96G43iAJ900KsNnKm1OLYVbWZWcivkjmvgVko13OTwNanFC7EMhlYZXmxKz3wJh6iIVxM7yvoC/FPiB58a0Ozd91W6g98MqYT9bAp/478RvmGR2pD3sfeHOMpLvDZ92bRvcRXgLyUX4KkDw5OjrrBSlzjInQH/6lWTHC2/XwtYuh30DDL5cqTBAi/nc9WmNuFl/x3HeaVhJ4bhLafBNDEYm+c+OGMlDDXWRvfbbcQE9feEBrafqkfC6Y/ahDRSVSDuzs2kjm9ARZ9rais+CcgUO80jh4JEReL2NtFMtXmS+w31c0NH30t01Qd/m55Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7D6Lx0SGGeULyAuzI6QSTKRXt1l8pLOBAU8iEv1O+E=;
 b=pZ59AZmLogCR/P9XAuWJ4pJUdveq0jyKN+BDEtBzlN/OGO5M9klTfxN/zoR2EnExjIXRn/CwAm8IwMYCNzdtvbhsHCg8roliR2/lDNc5KOxNtn+dksBGJEh8LCALBzt306S1f4T5+Zpj4bEpFdmwSRvAV81s62XQmw1K1IbYky8=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, boris.ostrovsky@oracle.com,
        jgross@suse.com, sstabellini@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        andrew.cooper3@citrix.com, george.dunlap@citrix.com,
        iwj@xenproject.org, jbeulich@suse.com, julien@xen.org, wl@xen.org,
        joe.jin@oracle.com
Subject: [PATCH 0/2] Fix the Xen HVM kdump/kexec boot panic issue
Date: Tue, 12 Oct 2021 00:24:26 -0700
Message-Id: <20211012072428.2569-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::34) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09aefd72-74a2-4ca2-dc82-08d98d515d33
X-MS-TrafficTypeDiagnostic: BYAPR10MB3592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB3592C6401473B25DA033915CF0B69@BYAPR10MB3592.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P86hrSXa6fDwCBQSykKhavM5qZx0chdBhGgT4G0t/Fzfisb4I2nfJfLX0hGsP7tIzWWpTx3LGJGUosswSPDtNfGSl0MVWBsSgc0Iq0LHPYHzKiFSaeURiYuz2zzb66McBOyFD81xq808I6GHkLBZXeBVKoiZ9d6E/8qBB34CiiAts8jenKjsjK2e5kgBn7PKN4zjZsjKWa2VRZKfQCvCDl2rn0V3WQGT2Ghc4WT6C5oJyktfWzAsUF73A9OMMkzykl+DlLdFtdbR+lOBE9TiFM7sDFskc22sQV77RmcGN9bywtzo+HUro1HNiC6ZUwbhpKq+2ValNQhIHGCjwNd42oT8x2VId5o5Eur4ehSbgebPJiC1V2hRcHHS7/WUdhXQt4TY9kzwak9Dxtg0dqihcix5nQ2SfEmCt1fI2euESbxMJz+qnkkQHkDNPL6O8RLJ76RU/o5F2uaJjqjmMbh0eLM4T/AbY7mpXEicAXMT71JZopyLbfk4PW4c5xo3y28Y6uh8vsnOXNzwTUtllN1UEWVaOnFb5yLTnJiS4+olqgEkXps45a+k5CRzry311v1226e/L8vyq951hFBt0usHjbcfAw0MJU57zzRl/IJ61KhLt0LX9SA87dF5eM99Fe4UobVU0xZBmwgKTZTnHdjSNGdRUgFs/x/1dFvhYcBmBLoz6azK0bT/aSZXWEN4Nfr3XkRclR3IHdh9dad1rAlrFw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(44832011)(186003)(86362001)(6506007)(508600001)(8936002)(5660300002)(4326008)(36756003)(26005)(956004)(2616005)(52116002)(6916009)(316002)(6666004)(8676002)(66476007)(6512007)(83380400001)(66556008)(38350700002)(38100700002)(1076003)(2906002)(107886003)(6486002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fsJETzHqyc8lZrZdGSo/+RSSuMjrAdudYLlP5mKScax3WBEPhgWfpvz+aYEB?=
 =?us-ascii?Q?gt9UboqkuochgEq6dA8DI3W1uqdks0lMSeKVmKTZepfVH1+q1vgKJv+HuRgV?=
 =?us-ascii?Q?Ojh97jlm4mY6lBlHF00/ICsemFU2t69TALufrjhmyTgjpJA83Rs4EgRUYUb6?=
 =?us-ascii?Q?Czwlhwa5QBsDZZ+ugxaWCH6XgecGZ28gbvKz2l1/2JZ9ex0arWQt6VdfJR12?=
 =?us-ascii?Q?HhFhtxiFnuegbKWPEMUbchaOA3+oKcFw9sj5l9Np6qLyalstAdDfogZOstY0?=
 =?us-ascii?Q?oc+P8ZnGqb8pbHAaE3rRI599Qsrmm5DixSQewwwIZn+52B6kK0LXmROBSCyF?=
 =?us-ascii?Q?S9WfEU+ywKi7VCWEkt+TDGvkCOvD1uKG0JWnVfzDDYdMmNLSl1fKkl5eNJNO?=
 =?us-ascii?Q?1QUwpPGiHkgh1GkHjosa0WoLYo4D6fGpdw30Va6lMFt1faIbnS/PisUY8EO8?=
 =?us-ascii?Q?C2+kUmgPdY1eNp2DGXmgFQpU/uNSrALE1GYLW10vasdfXax2apztEj3WW2dl?=
 =?us-ascii?Q?ZW+CG+wdZpxQWse1RPtdUNFz4mRYANtXsDSlDog3ss6V+fQtI1/NFPR80UUX?=
 =?us-ascii?Q?elh0QrumvP34k1PxRCFH9oAp7pXaq/2hOf+aS4+Xl6arqyQ4CgRdEg486A/v?=
 =?us-ascii?Q?44hBWsbehD+s0eLlmaDCR3h55BAhTKdY9MzvCUAlp+f/wyTI16UTjB6vgJ73?=
 =?us-ascii?Q?4xDHVErd2mIzl2BgGXLZKWgkYGDMR1q3068Ao7nyCUc+EKp+UKhVByGbuzfP?=
 =?us-ascii?Q?jsNrm9c1Fytbh0TiogdhkMSMZSr7t/BkBiCag6Gd76NX5LUJA/lKGvs/zaz5?=
 =?us-ascii?Q?dsP2QeeYD6rQZEba1HQiqxvXx/poX0mTKTWHeeiwrJmWyn655lXm2o6fO8uE?=
 =?us-ascii?Q?p/hOL47YYa3gD2RU5riZKHyCXlaRFr5NPUDDAbsRWuzag7h7VyYsowNW5yr4?=
 =?us-ascii?Q?nAx5dlJKd86IJCV13MBhrTuWABculGZB5RoqM0G8dSP5jpWh+bG7KX2x29yU?=
 =?us-ascii?Q?zZHv0iA0BUNDZ3ExKlaL+KzffY2k0JdypKhJaLOwnAveViCVTN75ikWNOz9s?=
 =?us-ascii?Q?veZhS/MmM8letl9WTYpc2ggYl/xCuwgXwMw9uOjp5mbXKOb98h+XosRm+ksQ?=
 =?us-ascii?Q?Awus4PgtqNFta5XCH2L+KpuxB313UIiqURuVdMJ/D3BcmU3+D2qDH5HDcHPp?=
 =?us-ascii?Q?irYdVIhMwdCMievFgsfcuR1595Wz6PINO6hJh+f8/kq1UyNJUNQO0bbFFCaf?=
 =?us-ascii?Q?BuZI7GJlOMSAoaL4HBz+snc7Jb7SjQkz4nDAbN9k4TSWy0H/DGnsYjmZZeWE?=
 =?us-ascii?Q?yS00Osfra5lbqTdrCrU8mVOL?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09aefd72-74a2-4ca2-dc82-08d98d515d33
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 07:24:44.7491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cq3mSf6zw5NW5Uqsu4yKFLGjs+Zn5mZWwbp8fswGS04PyPBYDWuDyYZ1IjCOQEz0hnwS3mj4yuIU+ab23D3xGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3592
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10134 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110120040
X-Proofpoint-GUID: mlVgeoZ3IhzkcvrKSIWiYwH0rPZiJYw9
X-Proofpoint-ORIG-GUID: mlVgeoZ3IhzkcvrKSIWiYwH0rPZiJYw9

When the kdump/kexec is enabled at HVM VM side, to panic kernel will trap
to xen side with reason=soft_reset. As a result, the xen will reboot the VM
with the kdump kernel.

Unfortunately, when the VM is panic with below command line ...

"taskset -c 33 echo c > /proc/sysrq-trigger"

... the kdump kernel is panic at early stage ...

PANIC: early exception 0x0e IP 10:ffffffffa8c66876 error 0 cr2 0x20
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.0-rc5xen #1
[    0.000000] Hardware name: Xen HVM domU
[    0.000000] RIP: 0010:pvclock_clocksource_read+0x6/0xb0
... ...
[    0.000000] RSP: 0000:ffffffffaa203e20 EFLAGS: 00010082 ORIG_RAX: 0000000000000000
[    0.000000] RAX: 0000000000000003 RBX: 0000000000010000 RCX: 00000000ffffdfff
[    0.000000] RDX: 0000000000000003 RSI: 00000000ffffdfff RDI: 0000000000000020
[    0.000000] RBP: 0000000000011000 R08: 0000000000000000 R09: 0000000000000001
[    0.000000] R10: ffffffffaa203e00 R11: ffffffffaa203c70 R12: 0000000040000004
[    0.000000] R13: ffffffffaa203e5c R14: ffffffffaa203e58 R15: 0000000000000000
[    0.000000] FS:  0000000000000000(0000) GS:ffffffffaa95e000(0000) knlGS:0000000000000000
[    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.000000] CR2: 0000000000000020 CR3: 00000000ec9e0000 CR4: 00000000000406a0
[    0.000000] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    0.000000] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    0.000000] Call Trace:
[    0.000000]  ? xen_init_time_common+0x11/0x55
[    0.000000]  ? xen_hvm_init_time_ops+0x23/0x45
[    0.000000]  ? xen_hvm_guest_init+0x214/0x251
[    0.000000]  ? 0xffffffffa8c00000
[    0.000000]  ? setup_arch+0x440/0xbd6
[    0.000000]  ? start_kernel+0x6a/0x689
[    0.000000]  ? secondary_startup_64_no_verify+0xc2/0xcb

This is because Xen HVM supports at most MAX_VIRT_CPUS=32 'vcpu_info'
embedded inside 'shared_info' during early stage until xen_vcpu_setup() is
used to allocate/relocate 'vcpu_info' for boot cpu at arbitrary address.


The 1st patch is to fix the issue at VM kernel side. However, we may
observe clock drift at VM side due to the issue at xen hypervisor side.
This is because the pv vcpu_time_info is not updated when
VCPUOP_register_vcpu_info.

The 2nd patch is to force_update_vcpu_system_time() at xen side when
VCPUOP_register_vcpu_info, to avoid the VM clock drift during kdump kernel
boot.


I did test the fix by backporting the 2nd patch to a prior old xen version.
This is because I am not able to use soft_reset successfully with mainline
xen. I have encountered below error when testing soft_reset with mainline
xen. Please let me know if there is any know issue/solution.

# xl -v create -F vm.cfg
... ...
... ...
Domain 1 has shut down, reason code 5 0x5
Action for shutdown reason code 5 is soft-reset
Done. Rebooting now
xc: error: Failed to set d1's policy (err leaf 0xffffffff, subleaf 0xffffffff, msr 0xffffffff) (17 = File exists): Internal error
libxl: error: libxl_cpuid.c:488:libxl__cpuid_legacy: Domain 1:Failed to apply CPUID policy: File exists
libxl: error: libxl_create.c:1573:domcreate_rebuild_done: Domain 1:cannot (re-)build domain: -3
libxl: error: libxl_xshelp.c:201:libxl__xs_read_mandatory: xenstore read failed: `/libxl/1/type': No such file or directory
libxl: warning: libxl_dom.c:53:libxl__domain_type: unable to get domain type for domid=1, assuming HVM


Thank you very much!

Dongli Zhang



