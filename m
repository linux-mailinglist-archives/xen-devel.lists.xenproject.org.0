Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B5589832
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 09:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380231.614300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJV1n-0004om-EJ; Thu, 04 Aug 2022 07:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380231.614300; Thu, 04 Aug 2022 07:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJV1n-0004mq-9x; Thu, 04 Aug 2022 07:12:19 +0000
Received: by outflank-mailman (input) for mailman id 380231;
 Thu, 04 Aug 2022 07:12:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xhOI=YI=oracle.com=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1oJV1l-0004mk-Ck
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 07:12:18 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2761cde-13c4-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 09:12:13 +0200 (CEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2741iZx0001397;
 Thu, 4 Aug 2022 07:11:47 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hmv8sc1wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Aug 2022 07:11:47 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27468WE6031471; Thu, 4 Aug 2022 07:11:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3hmu341cup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Aug 2022 07:11:46 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH8PR10MB6387.namprd10.prod.outlook.com
 (2603:10b6:510:1c2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 07:11:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 07:11:44 +0000
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
X-Inumbo-ID: c2761cde-13c4-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=nn0qFPMu9MmvwEWpJmm9NU6qhfcwG5Q9uVkuaF2az/M=;
 b=drv1eQ7zX2lx2x0rk+VhyHDf3bWwj5nueYf+IrE7oYV5V/sxqmRkIJTbBgKnMzVoEycc
 BJ5b+DyHPEURqKRn72jtKS8qfPnAuxNcPtO6zmb/lFdF71L0bliAUY3+dpWhwFmvM0f1
 H+ZKeREsiRXa89XsA+gXTwNijFT+CNGDMJ7as+KxIUoTNXNhllUOpKbPNGdkjNG+CLwG
 PiO/i6v8FD744WQN7pMJBLGcg9/aPYYTuOfo+Mt2ViTDxORRQqiIEH/5nsxs9ytqcql1
 kQzdS9y1eaK4h6zG2RvLOiANL9nn79nlH1uIrWmuav6lt+lu2NNJBUU94gbqYU+hiIrB OQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cj9wsQiec2oZNMxm4qQGU6nk9k67xpBgZAjD6Fnok/IqVRAnCUZh2LPlV6KPwgLWFx3mvv0eIeGWAjvBfaGre12gGl2wutCeZOzVTDcsBTxTiHllbedo3H5CWbihPebREMXuhP6eG1obYnl59+SQIYwlxw4RTOPTz3QQZeK0eJoz8Wpp3NZqV0IFf9KAv0A+WULC57kq2baeOBawbURxzAdY11SOEqBxvzolyMb7aa1t4K9h5Yx+6T6WzXe+Zi+MFOHBX816+YbYNnJECQwjDed0WhhORnHKOtvsSJ1nnjfv1bLCWXuaVAaosZ8Q5S0XbV99mGZS9YPFYCQ1uD0SDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nn0qFPMu9MmvwEWpJmm9NU6qhfcwG5Q9uVkuaF2az/M=;
 b=IADXb8jH2DPJsfBzwxtrqabpDtHZYn9NPS6+c7ycYjJ3vTbZuVH9DNO11ezqanjiJI8Z1cqF3ziWLOOf8PBWOEyVXfa7N/VfEJKrL8DQKEWaDcjMBNOeP+XYSsIUm7HRaR1R+/lFftkx/CMMLbIwWkyM+mElB/97LjYp1hjRywek1u4g4hugVSwBnqzINtg/rY2EnuFn++eVlEPVCAjXii7FmrqEj6hSSjvGDvP7MfWwZc29Z8ANnT2CWoSg1LN8QvAADB2d7Km+u+QxU0CIydKvkYPh+5uf637nM0tF4asu0Y/VlHf4U01XsFfXAeltESw/A6kxUo93A8UUCrpKCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nn0qFPMu9MmvwEWpJmm9NU6qhfcwG5Q9uVkuaF2az/M=;
 b=uSG2vnDUj7C0B7ouLbIRH9l8E3LEw7covJORAr08x/D88zj9XVhai3iZ/gINHXhIJLQrWPdy60DSyiSFOmdYwP+xKgDZXl5bOPnXH7IjeNIZjoVsAWKS8DpMxbMiyvk+YFtf57FKdz3xPh7XbgkF1VIPNYgVtufl84m+wMcmNQ4=
Date: Thu, 4 Aug 2022 10:11:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Juergen Gross <jgross@suse.com>, Bastian Blank <waldi@debian.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Ian Campbell <ian.campbell@citrix.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] xen/xenbus: fix return type in xenbus_file_read()
Message-ID: <YutxJUaUYRG/VLVc@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0048.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d74125f6-c1b8-4ef8-3788-08da75e89613
X-MS-TrafficTypeDiagnostic: PH8PR10MB6387:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/7PMcUx+nWvSe0ZnwFe2Rddtg79Khv0Ke6OBVttVBl/c4dsmOoQB+OK4U0BbhvDOmX/bQpblvAv45613PjbwHZ23k3N3jySqhSSGOhZXKiEkZI8wsyBqUUzlSjm3UKBV4n6fqBMKhi7ykHCK0OgPjZN4aolV24BKbGwGW4mlPWblkguSYyeL9tO8wqfUB23iAgocuObvqmdQPkmNHFfFVZ20Qs7GfrvGt8yP/OG2B1LPL+IHShXHtzu69CMfb+LaXuL4pqLejpXYuYVVzIiXlbftWbmqoyMPFS0bisLmimcr0/0CR1/CRg/kv/+TibmLRZz1B/kDZyJzDZQ9R0+ZurNoWLJ104yk2uXUlmCoEI8ASfOny/zkmtGLnw3JPahDXYMNxZRfNYZ07/Y8uHIqCidHYELpb/z+UB6Tt1vgWiTBHTXvxs8f6bM0lGS73hEV2YgQTheD1W8NuKkNZxJId5RziFgV8NM2e6zKD/hgIMH7o2+DOlmMHmV0hwP2XiLbT/nIL1W4+lLXYvPbluxiAEVmKSplLVheQN1+xPN6sh0gxD58S1/ui8uUHPF++floZJlLLJrEznNfgOxZy4A3ocmDXCt4EsL39Zkvb+A+TvWX+7vaUGm4vXzNZjoEOPdmxZ5zj499O6X7a0yLHEUzVaAZpBNqQGEHXk+oMvY08L0U6qqONDsaZnJpWTopKpRvKhDzmq/a82fP8fkW7yWhMS16TgdOuzN2KehRUqZhEukW1RdvTJYBnUuwkIuUFgTn4j/592/56/1AAozwO+9F6QmbDDqPsefJmIxmlNcxW1NAoX1kFMUO68U5DWdU/flN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(136003)(376002)(39860400002)(396003)(346002)(44832011)(5660300002)(4326008)(66946007)(66476007)(33716001)(66556008)(8676002)(8936002)(2906002)(83380400001)(86362001)(38100700002)(6486002)(41300700001)(478600001)(110136005)(54906003)(316002)(186003)(6666004)(6512007)(9686003)(6506007)(26005)(38350700002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rZKRfPMWH6vUxbQ+sTRPlExgQPaHu+Vv9iqk4ChaEOaiahXx/+p+0X6tct7q?=
 =?us-ascii?Q?Kcsm0W+UYRIPPMZPI3/VMCzlpNAQ6Fct3xLxJTB9Ec1HMPk/HaOnHbwsfNNU?=
 =?us-ascii?Q?kQhs9iY5muZz5YMXnziyovD5APwFQ5hBtWXSiujMxX5H9sLqP8MqEPvch8Kk?=
 =?us-ascii?Q?0gs0s/oiDGZ2SmAaJoCrQvUh5rTynLmVX4dzDUD+9d/po9Dd8lB4M/ZeLSg9?=
 =?us-ascii?Q?mNSbSM7sWSWLykW2eF/Ly86eQWhKLxYGad7felaXmxWzypnaKQhUoR6n8+pq?=
 =?us-ascii?Q?J7Z3htGY6YxPbPqg1PXtN4bUIRx9+nkfbniOulJOMbuGO3crzdS4tEeZsKUV?=
 =?us-ascii?Q?t+fCiZZ/fEU9ecKRWPUXqRYQ7cuh5taJZvINlGMCybOndU7bPP2eQ89dDQwy?=
 =?us-ascii?Q?iRYdti4S8KubOfi39dk6bKWA029UqeY3qd3I2dhmbqhXJQegBlMGOfWl5oBA?=
 =?us-ascii?Q?bw93zERCbuEIm5OR0KDI+P01sV7l7kk3eK1jTRgau99uIvz7JiRUlrkAbTyS?=
 =?us-ascii?Q?WYOKprxWQHwJEbf/wlaigGDtGhbyoeXt3TF0+pQo9LmBc1gcHI1VUvRr23J9?=
 =?us-ascii?Q?L5vX2L6JFMG966QgF0YphmeUlD7Eui79TUCnQX+Cwvt8sgiILZli05eHtcvU?=
 =?us-ascii?Q?QkNzNusG62AdMfRBjm28zDPSPHM/P2y7bhR0EuBfLruiy7GYQ9t+09OxZ/F8?=
 =?us-ascii?Q?VE7ix4vkQipM5g+7tnPKWhDeXHbFbxJs01UZAdRLWBQuDybim5jTLFLIns0a?=
 =?us-ascii?Q?dbXLFS35IzGHnpu1X/9iO9g/RWzC3+spvhuyBE3MpyGrDHb/xO4RMnrVe7Rm?=
 =?us-ascii?Q?W4eu8xGKkbpwWE6lwwBYW74qWbIN2icTlz/4HwM94tcesfMSrT31+g5zUtEF?=
 =?us-ascii?Q?Ay01oI+bee+dSYMG1yJg+9KkvSPX9RWj9th2b4q4tWv7ROBizgoe2QOzRIza?=
 =?us-ascii?Q?G/xfDksL4D7dWfEgKZ6vq+icIYrW+D016XD/by5uCzhUcjZwerctHDIvxQOE?=
 =?us-ascii?Q?9LaFapqXQ1kJQHABLYXzBJkxpF9BWMaKKP42fCFob+fllzTpWQYXNoim/xox?=
 =?us-ascii?Q?1CFDA7a+BGbkgHKuzbWR4Wzi25l8G/OEP2Fs5rYFPFIO7MhO3rbfdNA1KbRE?=
 =?us-ascii?Q?H0lHNRFhXUBWy7Xr8jJD2eoSZK13mslK+nCS83E1MKnbaz1oVZE9znoimAVC?=
 =?us-ascii?Q?FOqYf3o0pIk+LuEOMKRSdMVXFGyjyivAV9mfYUFXbS9sL1F08kcIdO+mSYAm?=
 =?us-ascii?Q?NV93o3wu0lPM9FJmKpyPj9Ait2FFu2hHca07yMoVSWKubIXTAVZcEwO3TjyY?=
 =?us-ascii?Q?Cen0LYiyNH21uZ7X37YcZfDtsmdTaO3unI2md6HZLqi/vq+YGezLhkTfd/Rv?=
 =?us-ascii?Q?PmXZDp9+0Cz1GBdFSmHnC+QVG5XA73A99g/bdNHcwpuxZXg6MPn8xARnZXGK?=
 =?us-ascii?Q?iMbaJ8J86RXJURwHd0m1VNTDUwsLwBaO9ZWEnxesbDwER4HTUqO9Qy6q/NGb?=
 =?us-ascii?Q?jmS3Uq2snrylXn4eZ0vDvddebZkKto7lCi0shV3JOIAojucyJjZjfV4VlVl5?=
 =?us-ascii?Q?Zc0Qo/DGsFjMZQKdrxZKL4MgoRjpkk3UP/Jwa26rtenAdiCXSHWD0hFbmSG7?=
 =?us-ascii?Q?3g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d74125f6-c1b8-4ef8-3788-08da75e89613
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 07:11:44.1269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eybsCDy685C3RFSOcMGS2MCwuMO19WfN9weKKIuoEAQSuwsDTZglfRlueZ9wjmdkaFyhNcmikkX9emdsYbeg+tRRlMxUPFDu4xZa5AhboHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6387
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-04_01,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208040029
X-Proofpoint-GUID: jM7R5_eBegFrP0VUvCl90oO-mK79FhhE
X-Proofpoint-ORIG-GUID: jM7R5_eBegFrP0VUvCl90oO-mK79FhhE

This code tries to store -EFAULT in an unsigned int.  The
xenbus_file_read() function returns type ssize_t so the negative value
is returned as a positive value to the user.

This change forces another change to the min() macro.  Originally, the
min() macro used "unsigned" type which checkpatch complains about.  Also
unsigned type would break if "len" were not capped at MAX_RW_COUNT.  Use
size_t for the min().  (No effect on runtime for the min_t() change).

Fixes: 2fb3683e7b16 ("xen: Add xenbus device driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/xen/xenbus/xenbus_dev_frontend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_dev_frontend.c b/drivers/xen/xenbus/xenbus_dev_frontend.c
index 597af455a522..0792fda49a15 100644
--- a/drivers/xen/xenbus/xenbus_dev_frontend.c
+++ b/drivers/xen/xenbus/xenbus_dev_frontend.c
@@ -128,7 +128,7 @@ static ssize_t xenbus_file_read(struct file *filp,
 {
 	struct xenbus_file_priv *u = filp->private_data;
 	struct read_buffer *rb;
-	unsigned i;
+	ssize_t i;
 	int ret;
 
 	mutex_lock(&u->reply_mutex);
@@ -148,7 +148,7 @@ static ssize_t xenbus_file_read(struct file *filp,
 	rb = list_entry(u->read_buffers.next, struct read_buffer, list);
 	i = 0;
 	while (i < len) {
-		unsigned sz = min((unsigned)len - i, rb->len - rb->cons);
+		size_t sz = min_t(size_t, len - i, rb->len - rb->cons);
 
 		ret = copy_to_user(ubuf + i, &rb->msg[rb->cons], sz);
 
-- 
2.35.1


