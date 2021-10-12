Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274CF429E92
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 09:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206784.362437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maC9s-0006q9-C4; Tue, 12 Oct 2021 07:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206784.362437; Tue, 12 Oct 2021 07:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maC9s-0006nI-8L; Tue, 12 Oct 2021 07:25:08 +0000
Received: by outflank-mailman (input) for mailman id 206784;
 Tue, 12 Oct 2021 07:25:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kpIn=PA=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1maC9q-0006n6-E8
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 07:25:06 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85092268-2b2d-11ec-811a-12813bfff9fa;
 Tue, 12 Oct 2021 07:25:05 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19C6q3TU017592; 
 Tue, 12 Oct 2021 07:24:51 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bmtmk3tpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 07:24:51 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19C7F6wv153005;
 Tue, 12 Oct 2021 07:24:50 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by userp3030.oracle.com with ESMTP id 3bkyv8damt-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 07:24:50 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB3592.namprd10.prod.outlook.com (2603:10b6:a03:11f::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 07:24:49 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 07:24:49 +0000
Received: from localhost.localdomain (138.3.200.16) by
 SA9P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Tue, 12 Oct 2021 07:24:47 +0000
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
X-Inumbo-ID: 85092268-2b2d-11ec-811a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=uUBzOadnaIwwsYIV3T/XKD51rUxNsmjfESD7O5siaBc=;
 b=c/wCRmyfbO3PQ5D+SbvaDmJtP91setYBDOS+a8r/qC6X5Wbd4+lnJLyPAwSmyE+Nvg9D
 WaJkFZ28cp8iXQGztFHh2pPCiY7V3w1bRkF5R6IemRpyCXLSRehd3z7h7J7Sb9qzdg9/
 Eu27/YPFT6odsH5IFv6g+H4RzwuEbW8UED5uRRzyDmgKNlOhlCG9rLxnA3Ho9/7Nb/LV
 aDhAax7RVztknEuw8FzD3mIEOewoire0t/xZePZmsVjfEkzkSq0XmfLlRWUQ8lVmoVu+
 LQuTpZi0eU7MMpPt0eQxsIH++BeDQzJXB/oRMTTzaOPczeGR2qUyhFH9V2uMfX2yJRDZ dA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/vO2Cu4mEpfsfrD+0+lk+EdvxgZWNfodU5k8p9xOuWSmRdpvDEHIsAC54RPE1IoMiHk1wRxH2B+MM9rK0ON0v1Wam/erHjgZtvK/qe4WnOf1tZ6iagP0wJ5SR9Vg9YRiVRCbROGwhS1J1CpZ1VHqzOyReX7HrDswkRYFd0GdYwFd8II/e2uWuVrr+UGo/CjZZw8AxEwPGPVORYQ+c0R/pfh/81IXuxJmwmXcDvcz0vzSQnfWPlY7NrRHMHIelMKLmxfjjCAguio9kuHDWNIL1sQOrqdHEhxcwasLrnz47J769KSvXBE1c40q6/X10Po+M6HtZxGO8gCPUHNCK7fFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUBzOadnaIwwsYIV3T/XKD51rUxNsmjfESD7O5siaBc=;
 b=Kz7hh2LYjUxOZ5hRHw3nxLx9PKPqMtRfUx15eTktxVOwTyPxtSEyYzLtIRdRSvKqzXTnepmF3iayrSVY0lxFgPwjclxKSZLOmzh3ax/nlVzhE+Cr0Kpjy8Sbybea8Disq4TkRhF7eUv+B9cs2ZSE6/CqN508KyYGRxzDIoW9Y7H2HNMglpb1PIomJQpuOFI6IA39ZHDQroxW9kE9WoaS3IyliWbbiSiNNvVLJPvsylBXlERlXfyWWPnt1EpdLWq8QZYfcGQHBynAVhT9MzFG0fuZRFdRuQPYhbjYSrb4QxjsPgwtqGbGPpuQbAe/VgaS1a1F5y/4I+TDHL/zobK6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUBzOadnaIwwsYIV3T/XKD51rUxNsmjfESD7O5siaBc=;
 b=GYnXHGSgwuSuajEf8ImgHKLUWffESxAN+r3uFfJlDxCJGWFr74J4z6Ip89eoBWytXFN4+/SQ7K3YkMeb1Jg5ZNLGo5G86jb5AI1Cha+/vkDj40sEvaIrux3Ka9RcVkqlAaoTAOlE7Xm6fNSE/HMcMGg6yYwLJrsVQKxJlHaayZ8=
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
Subject: [PATCH xen 2/2] xen: update system time immediately when VCPUOP_register_vcpu_info
Date: Tue, 12 Oct 2021 00:24:28 -0700
Message-Id: <20211012072428.2569-3-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211012072428.2569-1-dongli.zhang@oracle.com>
References: <20211012072428.2569-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::34) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2159f8b3-e7e9-4483-7534-08d98d515fcc
X-MS-TrafficTypeDiagnostic: BYAPR10MB3592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB35926DE8158385CFFAC38766F0B69@BYAPR10MB3592.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vz1hN7kqa8yvwTluY/yONzJgUTrCw3wIIRTwdBS4P+Ion9+ZB/ScZrJwRRCehbWdjlEupOO0ku5avR9CcV6yh5/le91VhuxtLt6yflmezquIlgRT5Q2/I7lEtgT1Bq4gh/oJqCtQL0Gws5BnqJm23z0kyw/ZI18zZZYmeSgbdPPVeQSxs0hOrEcG/ias6LBlaJrErh1ri043IYQmfEsBbt7MWwrhSK7BSxfKSv4HnyLIKsga7dxGb+/T3semu4lqJpizAXyHYeNP83MSncavoAvjrt3yYrlQiGJLbTR1Ke5MRbAaXS1X8ZhiIGu4EIO9XwgcSuiHRhuRMG1T48K4xX8R19fQHeEg0HSfvXZ3uQsJlYPIY9uZzRZh0nsHS3pJTDRtbzg7Sokqjauqfl+mQfNjpGwfcbnYEw/vAaUkIRpOoIeOmUfFjm7TDyK5DXcbwLmMv6nErRgica5NzGD4VztoS6IoQwCIcHSPXtqJPl1aKgPGCggjowLtTnBtvk9XkBQAzZB8GPEIn/y3dhDeHBq3k1IevDCBV0d3291zRj8lV0CyaDtab6jCdcG0dIJY4TXHHE6+nU/ejy3i7jFTeO1MLFL8jtC2W5+LEce1TsI2u8ypUavzqW16Mznh9ovBIRC+SBvv1rs2FGfWHHY9aprUb12MxJc+Zlu7hNyqIXnYsE3ok3eqEuiq+JNqPZCPeCCCy9WYIvCerrHfMRBfIYTjWJ8oZvARRsgvflMrXp0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(44832011)(186003)(86362001)(6506007)(508600001)(8936002)(5660300002)(4326008)(36756003)(26005)(956004)(2616005)(52116002)(6916009)(316002)(6666004)(8676002)(66476007)(6512007)(83380400001)(66556008)(4744005)(38350700002)(38100700002)(1076003)(2906002)(107886003)(6486002)(66946007)(14773001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O0dHk2t4n2STRnP4K5+otTdJ/3QHuT5PhQe+qijr9PsaikiZ5sXWJ6FFPryy?=
 =?us-ascii?Q?JarKyohTB1YcktAyiDw99oejGAEE8Pp4JhvMH/2i6Xl8tcl9a0eq3XMKvSir?=
 =?us-ascii?Q?VXWKUxfjr9B6VgLZzJZ8Oo993pWNscVeQYPCLZfoYScPHMgjSJCGCmQwEiUX?=
 =?us-ascii?Q?apAZnt3vHI4yChLUwbMugxZ8OXDbC43R3jXQhskWEkoF7IjAaEUvDYvKxdUI?=
 =?us-ascii?Q?EtdBJ22p4wASW7oVgWbAnjz5GQdGoM4taA2IAro7Yk3v89PK7RA4X6cMBGbd?=
 =?us-ascii?Q?C/A2rAZPlSIx/k25bBs/soLT/xQBDHAZ57lJaX4HHIsdcMjFdmvRiN5+mAMX?=
 =?us-ascii?Q?e84+V8RsHePCHxsN+G6gE5dZj4rQcj+yCLaXObwSqDhUxUZqCg1iz6ucbsG7?=
 =?us-ascii?Q?Jp0FRvLOscoMuRdXeJwblDIdMGEYPQgTjBulivvxXixv+ZNigALf2X6w9r7O?=
 =?us-ascii?Q?klqIbyOg/FaViJdosSR0ltmp1ZRWDbV3pQsaoswdyD7kuzTQfJNoPZq61TAF?=
 =?us-ascii?Q?xT1QY3j+FKVWaHt24QsGeMqYmIxPBdt9nfpyNquUMG2fmEUchkwbg1jmEX6T?=
 =?us-ascii?Q?fjzrDqtTQMAFNPWNNHpA2n25izQbFeNyKiMZrGunhr92IHY3767t0FtzXyvq?=
 =?us-ascii?Q?AUkLtHA9rHGDyj+JPJ+kcRBFUlNOnAbDq/nUDkposVSOfQZ5SP9GPQ1k1Ctk?=
 =?us-ascii?Q?83Zn3Z8oErgPw4u/cPWXIG0QZHrPNReQKnljOZsvn6W/mBEYIlu7IF59PQoR?=
 =?us-ascii?Q?dFzimOjB3EjpnHjyXrsWfu7mryilT7ENBepjIg/nLqmbBgD7YOhgw+LK93Ya?=
 =?us-ascii?Q?ETIf/zmsJIcEcUZrSZBWiVdOW9XYtVWXQ9nGgPGsAAKAFZes0SelbF7ieT/8?=
 =?us-ascii?Q?hi/BWzT7q8KVoyQMYul1AzrfwTlxJ/UJwSrCtSvfGyqfyO8PPQKRrtixaXDJ?=
 =?us-ascii?Q?RO7Kx2FxNqtLrWSjHcuGNbgxg8pavolRedzlYhURNDvt1pJE7qsPQ5Vlqu+9?=
 =?us-ascii?Q?RnUKzpUE6uOzV9SByMWK5ubhpKyHptz2OtGxpwLwb3rcl/Fc5Ck7LQqtj4RI?=
 =?us-ascii?Q?6TFFlKnP4M+Ms3AHCFAahdcfb4y+kpFT9VcxEfoJi03n8y+2zrNHc6qQKhCK?=
 =?us-ascii?Q?mb50+6ab9Llm44v6mivbexcSq9clYQ8DnqRuRyENGw5rP5tQMi2gk6cSjCpJ?=
 =?us-ascii?Q?DMVt5SYkN3UWtGGJZZxE+jgDWXNY4nmXqldvo1AA5sId4N11wHdox+VXuLP3?=
 =?us-ascii?Q?p74f7HxmMOAorRau3qhofgjOw5mC0F8k3JdEPpk68mrW4QF4EsJ+/a5+DF1Y?=
 =?us-ascii?Q?ZrgohxLz/7YKVioAT+468gp2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2159f8b3-e7e9-4483-7534-08d98d515fcc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 07:24:49.1536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kq7Op4hdU2L+ReQ5ED8TlHTloEDQeIZtYF2cclbt07DdIyPu7DdWrzug3WtxNWql49dtfNV+04x18SnwxIGnIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3592
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10134 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110120040
X-Proofpoint-GUID: yfUNozGS-NVNFifuP6d2uD8wX1hV75yL
X-Proofpoint-ORIG-GUID: yfUNozGS-NVNFifuP6d2uD8wX1hV75yL

The guest may access the pv vcpu_time_info immediately after
VCPUOP_register_vcpu_info. This is to borrow the idea of
VCPUOP_register_vcpu_time_memory_area, where the
force_update_vcpu_system_time() is called immediately when the new memory
area is registered.

Otherwise, we may observe clock drift at the VM side if the VM accesses
the clocksource immediately after VCPUOP_register_vcpu_info().

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 xen/common/domain.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 40d67ec342..c879f6723b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1695,6 +1695,8 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = map_vcpu_info(v, info.mfn, info.offset);
         domain_unlock(d);
 
+        force_update_vcpu_system_time(v);
+
         break;
     }
 
-- 
2.17.1


