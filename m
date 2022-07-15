Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D42D575D45
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 10:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367963.599143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCGZI-0007Rf-J9; Fri, 15 Jul 2022 08:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367963.599143; Fri, 15 Jul 2022 08:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCGZI-0007PE-G5; Fri, 15 Jul 2022 08:21:00 +0000
Received: by outflank-mailman (input) for mailman id 367963;
 Fri, 15 Jul 2022 08:20:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xoL=XU=oracle.com=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1oCGZG-0007Or-IM
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 08:20:58 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c2a6fd2-0417-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 10:20:56 +0200 (CEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26F4ZjZ9024288;
 Fri, 15 Jul 2022 08:20:50 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71scfcms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jul 2022 08:20:49 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26F8BjCs009765; Fri, 15 Jul 2022 08:20:49 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h7046qbgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jul 2022 08:20:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3282.namprd10.prod.outlook.com
 (2603:10b6:408:d2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 08:20:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5438.014; Fri, 15 Jul 2022
 08:20:47 +0000
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
X-Inumbo-ID: 0c2a6fd2-0417-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=I9k6znyuZNGJI5ofq1Xh/B9hlJ3AE3YMMudmaZJ66n0=;
 b=JgbHp+Q/QFx3qBdiqb+3eMDq97Vz2MwfkitRZk2bL8K03JgABtwiOZpZDS6LVIG3DYJB
 0zlxR+FhzvOhCRRB2oygeuTSS4WFrWjVbka8PrNFFtjdTDGQ/MWMm7rJSsJSEuhzvugI
 c/AayQQDkty+1fJyXK3Qz4c4uzyx+wJRuYABQibQHgRijeB1RliaS4gtd0EwNjOy87fo
 rBvkGdcjv4efEcMg8c0s30o2kdbsxE9VQdkXFADfMwuj4NrgLnmX8Sq/jRjYa9t94HtF
 M8Q1NJniZvtq7Y5wPBgWzAMnuj/ywc/HN/IkNV3MWat3Q7Yc0YHsFORYFccP7EOre16S 8Q== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnTJDVvKpAQEhD2YBB494lk5QmIDLfQZN6PHo8Mypan8IG8svN03By1PU19UQtjUIzfozXIX4u4to4NTtpZ+cgYMIwqD+XXGv/Z3HS3Af0HLTtciw8S8vHNTJFJ1yr07EQ6jysqEHBbz2Fiaf7jhCOsMxn0L6pnyHAEhcrDBsxD1EQ05tO0Qfnimi20BMPvX69a+le4qdI6IbpGolAtCHZ5nW3EC4jBqqYG1hGQuP1Eb5YtZJVLKSu4dR3Pr9RtbDH5QyMVEQdV74uHoT5kKlCMAKM1gTLF3uUt3aR8PX6oaVmXdv8CWxWoLB/bC4tkKRhmXiR0E4awluH9tvx9esA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9k6znyuZNGJI5ofq1Xh/B9hlJ3AE3YMMudmaZJ66n0=;
 b=IX7QyS1Z6W8xIekxcg6MCqezadlFDbva0pTOvQk6HC+C3PjkdzrGNJ6WpufPu46qSbQu6JbZlIeUzPRFt/P9VhoXUDVzHojc0jDrwHjynjkz/gLePnrR+70hiRKSB+5X5uyVsJ7lfpK9wTNEEuPt0ArEjshbcYpmX9Rbp1d4U6lBmC+VGWNlcipPqwCS4UDWSuqidZ2TglNTFuCVRr6g81JzMpO7IfFCye+0r4aO4KVBfm17RgEr6Vx8aKnHCWaDS55/HGHHhZ59VJNjLhJPdkmshETSnI1z0PSsrDqBs2K9QUBoU0UeD5xAMs128KZPuBB2tmlEHQpsv1dRGuVK4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9k6znyuZNGJI5ofq1Xh/B9hlJ3AE3YMMudmaZJ66n0=;
 b=sCdL9fUI/s7csGNiiUmvU737quPaGbpzyEEx+pyRbFv1Z9EEXiEunI8qn1TX0Ir8pFB8Wevih8tNSPHgr84YynIfS0IUL9iJ4Clo9rowmv2stUGDA8Kou+C1Xd8YS53VWHGA9G6SVWlfs611fELqLMB1gvPbX3PlUkvavJk55sU=
Date: Fri, 15 Jul 2022 11:20:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Andres Lagar-Cavilla <andreslc@gridcentric.ca>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        David Vrabel <david.vrabel@citrix.com>, xen-devel@lists.xenproject.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] xen/privcmd:  prevent integer overflow on 32 bit systems
Message-ID: <YtEjVdG+pp9DGz++@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0187.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::9) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f246f03f-843c-4e75-6327-08da663aeb5a
X-MS-TrafficTypeDiagnostic: BN8PR10MB3282:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OEzQ+VsbPWXDH1Ck6JOYBnJHg4u58xwIw/EOItlK1Jx0kUwoAoWDZW6swP9/ktTuSvqMFyCvSqgBm0VgQn2VgBsbGdfMyUO+WNW0a7H2s1Jq/58mSppiidflyCb9jPvJcL6Puuwl5cOStRit9Vb7+vWqjiIzduz+FaVVGjNRLwJqLZ7mc+wYOsByLEbaLoTQqxtzfw2qr39jqfAIRqOaUfaReUQq4SPgJ1N3a1DGJmIEJQKuf3TGL73ON7wtMCL4zrSiCXub9NvbQeY6rQ+ugiaUJX00TctK6hOGK+6a965GjXs6UFSeg9FBsbIfeEIiq77QOUPXhiuweEPAqJ79vu+GHYizOkui77ULy0klFQaaw4WLf4ufpYccWKpvXIWRWyhvKE1cWVxgSO6OUyxGO+R7YoSUEdvF6Bk5uQ1e7D2wnfarc1B07xSJ9jXZiLtKZyr8VXZm5DEdY0LHvMchgChM0Tjn9RiwglSY2NzplcFLxVSAcHz6sPuRteqinEEtDA0NnL3kj2HNkmU8w0OkIwHvpEE0ybQ4MxjXf6K4j1y4IkZW/1RSO90Sxb4n3VowtPsUTzu5bsXB7Ib8vFCxWk1Hlnc8T+KbdRS9ThASGUHzdMPB/JuEb/61lGoERbgpxHuUwLC/OOoitUCdYw1OSv1QMVZsmXKXgm9sq3XECCGj08tW5ZhibiO69Y+L38Kk2oujPDDNXkjBEMrWtt1x6e09F2i2QCTubTU6VeAMHMA1HmxLvPAIF8fuftyIJ9gazzjyoW48HKTaU9tmfQ0CSSpedzNJ2VWlFeOpLs6nRjxbA4Vdm4u7YXY2aFWj0iMk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(346002)(136003)(366004)(396003)(39860400002)(316002)(6506007)(2906002)(66946007)(44832011)(54906003)(5660300002)(6916009)(26005)(83380400001)(52116002)(66556008)(41300700001)(33716001)(8676002)(6666004)(4326008)(66476007)(478600001)(6486002)(8936002)(38350700002)(9686003)(186003)(86362001)(6512007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HwjIgLKd0J74mlo32cu3Ur60YPaX4C1uA80r7kYCGO8bxp73oJ587/zt2m+1?=
 =?us-ascii?Q?EmV0JSpcTEozd/jPNBA8AQpI7Dp3bcba5x4zhNMU+cnNOzTaN6BfzAeG/dVt?=
 =?us-ascii?Q?8Dy8uqB5kfJmxtoABOZGfJChVfB1czUaMK3h6U0KzKKeaoRMzSjofKsvn6VI?=
 =?us-ascii?Q?lt9SwgLGjPpdCzkYw64Vyo0yn3sCXj1I88qGobdixWLoyF5mfFpcXBGtJMP8?=
 =?us-ascii?Q?UAgr67eLZfIYx/Ew4jK/SmnkNj0BqdZzwSU37UuUQcXGszxJf2CSfjEXcrkH?=
 =?us-ascii?Q?VrknbKt7b4wAMoIpGPzL6PT4s+nZUDB9OLH5p1Xqcj0VGhWXlIcUeDegTbZ9?=
 =?us-ascii?Q?likGHG1uaK6mb2pHxi9d9SmLNfoF7GByHvLUehPfoE8Xdd4pCDrel+0wSu9t?=
 =?us-ascii?Q?U3037Jl/6oP5bdmobwXzTaJs823nwLpKPJRPbfHNnFNI6rhHZYz5VW8ZN5kt?=
 =?us-ascii?Q?uzpzkJ9ehQK3xp8rcYxuIqAtW9RQ/92laj8Uw1MfSWh55d6iXuRhPGRg/iY6?=
 =?us-ascii?Q?o0Q8nsm0zHLawSE3uQNPLKQssjgGzq8v4L+3nK0owTR6RpMUmywWOjLo3V2r?=
 =?us-ascii?Q?KueossACW7b+2T21YQXQdeb5ozMjL71Fz0dmwJY1YwbQkQkrwejMYKvHydKe?=
 =?us-ascii?Q?tyK2CR6CGsZNE8DMUFsm2p2EGIgilGY6DA5cIkBKKXMKVdH24jahRc3TWwXr?=
 =?us-ascii?Q?gaxrvWhAmmeD7R317XwvOcKszxgpAukkdwaj5YwIrFg8zGBwsahN8oF7hee0?=
 =?us-ascii?Q?jab3b4MAobRKWWZOjZ9rub7EWZsTF3LNio0SsuvHaXYOmTLfN3Gbj5wB5VXo?=
 =?us-ascii?Q?rRg/00d4fV/ONZPx0dLRuR8nemPOwTLs6WBmUrOJsm4aUlYTTmHjAI+Ipv8l?=
 =?us-ascii?Q?+aLC7MqaIDCnH5g3AlliPxDTO5Vp86lb+lMnjLg6XfHIs/Tmjj0H+UKo+1ds?=
 =?us-ascii?Q?7WBMefTsZPJfqq9WVtdGz67hUFQRxcyFAv7ou/IgnhFLeLvVYZO/USO+6Du3?=
 =?us-ascii?Q?8PM/nrtpEDQ3BvuarVaGIe64jlT0VlKmkv/0Y6/FzWDawBh0oCMs4YtoUIpd?=
 =?us-ascii?Q?ihACGQoP9NbqLN4qvTuW25ZIWtxlTlekF2Sf6/vQsXH/9qxV0Jl5mniew2C3?=
 =?us-ascii?Q?6v2xxErx1uuh7eX/KSBRCJQHkVtybeW23bfEzrRvHSSc7dO52qe0PFBChLom?=
 =?us-ascii?Q?goGyOv/R3mqq6SW0Oark/Zln662mhlfQs5sARWkr/E8z3AfNhCzO0IQNOxPV?=
 =?us-ascii?Q?JDQe6walC+wry9iw1pqSSWnHXUh59ESMepP115q5qE0XIyygfAPLDLQgq0ma?=
 =?us-ascii?Q?83G89U2EB3GXpm3D85CXNbWkJ5m596/7uUBrVJZTxFa6cv9y11hqgT1Htu/9?=
 =?us-ascii?Q?BaTDSdZO822OBZpATdGwkOOg1ZT/yT8QAv8SAH8IeZ/9QXlGabVVIaC+q9lX?=
 =?us-ascii?Q?wT4v0SajHmUnqGfr/bgihLdDqjR7QsK4C1IFlBtDI4SWLPz+qp8IEM8XJMRt?=
 =?us-ascii?Q?xSCvwziwQx1wcvKlwnHGGToU/Xej82u366rqHfc77XdXOaNLGvSpVY2oHdyX?=
 =?us-ascii?Q?BkI3ZXVPsvBUuvPBVjgmB1XnEnseM08rC27e76YU266EAJwqF/jAc7/TE7NW?=
 =?us-ascii?Q?fw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f246f03f-843c-4e75-6327-08da663aeb5a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 08:20:47.2020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iimI9xoGMLQlXr1C8+btkV2f50MHWnB6hwnPtRcOOlj8rEpdmr4NKbcMNfimBss8NwtmGHivo7UltHbNmsEgoXz6Ni1SRvgs5Pi+1lBOVjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3282
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-15_03:2022-07-14,2022-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207150035
X-Proofpoint-GUID: z65xdZIJiF8oR_iDbVd2Umha1-w-OwIn
X-Proofpoint-ORIG-GUID: z65xdZIJiF8oR_iDbVd2Umha1-w-OwIn

The "m.num * sizeof(*m.arr)" multiplication can have an integer overflow
on 32 bit systems.  Probably no one really uses this software on 32 bit
systems, but it's still worth fixing the bug if only to make the static
checker happy.

Fixes: ceb90fa0a800 ("xen/privcmd: add PRIVCMD_MMAPBATCH_V2 ioctl")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/xen/privcmd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index ad17166b0ef6..1e59b76c618e 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -456,6 +456,8 @@ static long privcmd_ioctl_mmap_batch(
 		if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch)))
 			return -EFAULT;
 		/* Returns per-frame error in m.arr. */
+		if (m.num > SIZE_MAX / sizeof(*m.arr))
+			return -EINVAL;
 		m.err = NULL;
 		if (!access_ok(m.arr, m.num * sizeof(*m.arr)))
 			return -EFAULT;
@@ -464,6 +466,8 @@ static long privcmd_ioctl_mmap_batch(
 		if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch_v2)))
 			return -EFAULT;
 		/* Returns per-frame error code in m.err. */
+		if (m.num > SIZE_MAX / sizeof(*m.arr))
+			return -EINVAL;
 		if (!access_ok(m.err, m.num * (sizeof(*m.err))))
 			return -EFAULT;
 		break;
-- 
2.35.1


