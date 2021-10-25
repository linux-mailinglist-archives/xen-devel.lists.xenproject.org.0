Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D9439DAD
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 19:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215987.375436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf3t4-0004xR-Au; Mon, 25 Oct 2021 17:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215987.375436; Mon, 25 Oct 2021 17:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf3t4-0004vW-7E; Mon, 25 Oct 2021 17:35:54 +0000
Received: by outflank-mailman (input) for mailman id 215987;
 Mon, 25 Oct 2021 17:35:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWrL=PN=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1mf3t1-0004vQ-Po
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 17:35:51 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7d14a71-8a90-4b68-a0b5-af07ad55f5b8;
 Mon, 25 Oct 2021 17:35:48 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PGFA7K030378; 
 Mon, 25 Oct 2021 17:35:45 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bw6v1vk8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 17:35:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19PHRBkq079779;
 Mon, 25 Oct 2021 17:35:44 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by aserp3030.oracle.com with ESMTP id 3bv8efskeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 17:35:44 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB3157.namprd10.prod.outlook.com (2603:10b6:a03:14f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 17:35:42 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::2848:63dc:b87:8021%7]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 17:35:42 +0000
Received: from localhost.localdomain (138.3.200.16) by
 SA9PR13CA0022.namprd13.prod.outlook.com (2603:10b6:806:21::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.11 via Frontend Transport; Mon, 25 Oct 2021 17:35:39 +0000
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
X-Inumbo-ID: a7d14a71-8a90-4b68-a0b5-af07ad55f5b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=cDImQC0g3WWbNeSuHjh5Voz2pA2wuCtC5/LKbSnoOEw=;
 b=SukbJ0kiMFquBT7kDQ93rhd5I7leU3JiSVCpaGDeWv0+d6YFt+2I+o3ZGoSvHObkm/lV
 WQ7BBzHmfSf3jpfzjO5Etnv8BbWYBTtmhkKpW7s+8E1/cyAyhgX+lLZ/KEDruZ0vDfBI
 exFzrOi3zPb8sy2akUE8SWylUgC14/E5ZKTq08GgimIQXbn/j0owqEHLQMr9OOtaSmG2
 IBARnL8rmnQcErSTTdBar1ZzS3BeeUYweNN5Ksl7XlUko7fL9YKbMJVBbUfZ9bL/hQ6L
 U+/Dq6jNvOjhfKUnGsqDTTNK0EORYv4Rev1Umr3Z3fnR0XeKrYBILKBVig1nwTde9TuH Pg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8Y8hPWActoieUdB5z3GRtDt4X5tzri1Qw55rSS8+54l5ZKBa6F3mrVWLkP7JicownskJJ0EFOUJ3dzFo+vQZUxL8dEcfx+dEyoJpz7Ck0ApECietDFfFXBIwjyWkWhki784T3fs1rXW6UbxAyfH2U24AG+dA4ueyaRJlZ7RKiWBCC+xdzLhIkeQ2SsRX5LFgb6uQq5Y9DMLBL0Szng5+1q6d5sk3Zyg65R0NtuQZuAIBl8YNX22UX/e0dEFh0GFEzYfM1J03IKr3g50h6w9Qv5fExOYN+Rv8wbuIlW7Y7VfPUw1DGyBC4UUREzvsSthfIY89QU9dOkaMusxkkLL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDImQC0g3WWbNeSuHjh5Voz2pA2wuCtC5/LKbSnoOEw=;
 b=n4F/gBmdhfpd96i5TqXQ3c1KBx3R8XoPiPO0IL7xk+JiccisZ42XVuPXBLgDosF3uhPqsU2Al9esLD8frlXES957MvgcFx59sKw7+NBoFvNq5wLsYAwpeoQW07/HKJQh0Mpv0Xs28nyJ4vY4OGZ8QAU6RAUJSM3LtWf6RvtLsrhbkEmEB/rbyDrnd+xclnOKeHdmlighb538UdlPocw7bv+3b9gOPmhYXj6HapcTIYLX/5VyC9nptoAmXtOPXZobOElc+7HAMDWdr52Kq3/+l6mrQWW8pYvsO50/hFnhHJwP7fCnt2Pj3rKtB7Z3m/kfrAstv+Q/2ckqpDoAADr89Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDImQC0g3WWbNeSuHjh5Voz2pA2wuCtC5/LKbSnoOEw=;
 b=fL+n4G3fqvreyT8JeaasbmsoxJCXv10QjGmTS+FHqLOmDXLIrDPCeea36hWFEBUMc9jqjv0+uDThCiV/swk8o/E+33xbUav1+EAMlGiLE8qfMXml0vfpu2tCoA9pR3EyqylcvQARBGrqZaZ5hrW0umFmAS/JnOkfsK3HHm46WnU=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, julien@xen.org, Volodymyr_Babchuk@epam.com,
        andrew.cooper3@citrix.com, george.dunlap@citrix.com,
        iwj@xenproject.org, jbeulich@suse.com, wl@xen.org, joe.jin@oracle.com
Subject: [PATCH v2 1/1] xen: update system time immediately when VCPUOP_register_vcpu_info
Date: Mon, 25 Oct 2021 10:35:23 -0700
Message-Id: <20211025173523.3647-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:806:21::27) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1cd7eee-da71-4771-0508-08d997ddde38
X-MS-TrafficTypeDiagnostic: BYAPR10MB3157:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB31577D1FAB9543F17BD192A2F0839@BYAPR10MB3157.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kfSQFX5PeH0i7Z4nctWNQdam0bUgWRs9s/KjgIgrKpxTyZZacivEwQpVdFy/28MmvKqhlmOEGEcaZ78xfVLExcNGCwnYzoVphWa3M28pW69yWcX6kBacgc2ZOvUePlzr+cr1OCdHA5xhzdLkSlSvUDZMFR7AA0jlipyjAPd2xjrrvw2ISoXI2BUbtLfFIGg9YK6AyY/AAaMZSjggIEMJS9nT9n7LdmAmcVrxsszNAD3GiqBMjKPhCbzo1DrfyHObjuEom6wWjYVsIrlbJ+o0mKpJ9WPYbbjmayibforbhEiboySN+vcZA9PvrquuJTn8XvFWYMFhHcik/9nmsf4y7b7JLI18IugbhNXMg6HD7FJ8+ekFPB8pV8b+wilstU9oClZyKmXTCCesJ/q2EjPZURQUNYXm1yWbSLLMuY4oB6QAvKkFpXds+9OECRgMbuhFJiXyzxDeJw4cRsF7o5Iq5zfckvkrylHlrpaAWQ4t7GXIWinQGk49Dm1tXHLrIMuMhwY8y3pmMhJKLV0J+gLa74XmwKC9u/9HM/vvHGoaY5R4HfS17iZCWguXrNoGW044zOck/D+gpKwpXQwXzOms30xZWzGanV4sHHUyU18tXso+SitLvEG4HWUtryv3o907yN2z+eBboHyHBL3moIRngONGaUUYw9Bvyu+uiVkOqH/AgK1PeRVMoQUV6VlydifIS2D1BVgfD4xGAOfhBv9x838l8JxsAYXepLjcDLiBl1TbYGnlVtB8e4QEd4XB87aS1AV0wY/J7DeapwUVRP6KyyqES9cByHggxvGs0Rx9/N3Jp2QnF2ln0gCiWnJIOqysz/SaEP7bxgYJI9xjtjXrjA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(66476007)(6512007)(44832011)(956004)(966005)(2906002)(66946007)(66556008)(1076003)(5660300002)(316002)(6486002)(186003)(508600001)(52116002)(8676002)(107886003)(26005)(15650500001)(6916009)(38350700002)(36756003)(4326008)(6666004)(38100700002)(6506007)(83380400001)(8936002)(86362001)(14773001)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xX04tbQM2Iu5eKhUYjoUcL4Ub5QQKALnCR3/AnJ6qaenemwsLg6i08/FaUCD?=
 =?us-ascii?Q?70mBNn/nh1l3qY/MuNlDRHHptT4tXi57J3SCC9jLyLzjRQDO8yJ57KiCZ3l3?=
 =?us-ascii?Q?h9tu0h82PtJmmNbbccXlIWiXhR4t0B/41zJr3jkqRXsx+S+oZJnQYnA1lRCL?=
 =?us-ascii?Q?LYraDHtbotVaY8yxRp9Ro/Sz4Jdz3BT+iote+Ouf7zj6my1y96lXMjp6aXil?=
 =?us-ascii?Q?gJ2EIEfGOjdftXEU34UaHHYTcdaZhoA/TZiijBunUtptO0iH2Tn3u4WJqRDI?=
 =?us-ascii?Q?TSp6DoQ9EB/1oVUFET5163Yby6cF+JnYQE1xBpmbj4i5mN4jzg2o6GWOhtFI?=
 =?us-ascii?Q?qK09eEb6nunuuSURZkxFjavijQs98thibGfvDi6SnZ04z9naD/bgzDbDe5uw?=
 =?us-ascii?Q?a+FDFSXpOqaS1L1xKmR780/muMIp4M4Gs7q6tUD8dudgyqyMUJhI6sb8P0b7?=
 =?us-ascii?Q?wgMbuhrr/S97e5ZFUhUpradccP3VEx2iv00cohB7P/kVBUnOahpEsyKnhl6U?=
 =?us-ascii?Q?xTFp1jWj4nO07OyhabourHOGbng/tInI5Nd+X1qmJomL2c/dzM1hxtJpGk79?=
 =?us-ascii?Q?3xhr0Aw8y1NkOU/9FsN3q7XKliGIfUedXDIDzZsUZ+YS509Ahp85iXm4MJT3?=
 =?us-ascii?Q?717HbA/pC+FWantXWK2Eq3Z1kBu5yPw29iiZNQMVn8mDjqhb5fBNfxw6ms57?=
 =?us-ascii?Q?zh+gtDr/PKS7vgu6GyWXxugT4Xvdd2NxMNYsm5kY1SMai7l7uAVBXBrIl97z?=
 =?us-ascii?Q?zOJb4L+Yf8IQa0ntd+QKaMAg9o4lUtrJ0EI05zPxtOoYw552WfUK1fj42ua0?=
 =?us-ascii?Q?nPlqz4ozQqEarOagDN4eth63I3d51SUKUqGXGREKxCH/3pysMlgad7QpxRED?=
 =?us-ascii?Q?sQsiOvwzRWbun7pmK1t7047Xs3+lVDCCSzXUPhrBL0rq97sYf3rjjXFKGuVP?=
 =?us-ascii?Q?nOQEsiwoTsuUSdW7nSdOsfGZZ2FKsG3vckVOol6bR7P0yYwI8iEiNDD48SZS?=
 =?us-ascii?Q?EcGSGDey7LOyvW71JD2ahtUxAt84k++Ua5nDtxa71Z/sARoD5YFfCZpFixy4?=
 =?us-ascii?Q?s5JGvMVkCvX3YOmWHiAYRz4CWzg9DTIWcEIIdudv2PQALdn6/eEOJeR3ZrDd?=
 =?us-ascii?Q?P6Vw5OW6OQ355dqNUjVSq2oEqd++gOXKlO6jPGZe9P22dTwPDYtIkA9IEClQ?=
 =?us-ascii?Q?S4WF59QWQY4/F+u7Wzz6sa4SMYVLs2hv9MeY6r6mD/d1fX2QbwVqIHipsjQY?=
 =?us-ascii?Q?c51Yp1WBa/JkdQWUcazXmSHkoayFB2Nn0tnaAOeADZqeBgiqTGTdJ/hJO0MU?=
 =?us-ascii?Q?gth7vG7RRiYBlZ/juNZZuc+8sYLfIZejQXNsmML62ZOY1w8xUv+VuZSPx4wh?=
 =?us-ascii?Q?aV9rli4FWofCs7B129ZOV3K7lfuQpUjyfeqXytfJ3LU697/+AF2NbMyZtWk6?=
 =?us-ascii?Q?ZNDFR2Jw3092yiBxpgjo/ZDhjMkQ9ALQrTpjJgbW6xkbXxjimKNPCf+h5za3?=
 =?us-ascii?Q?18oYSflNMnloo2XPo0Vn/bom8xKxKvDptrpCTmyxNA+6ySbpvj3zsJqtNQq2?=
 =?us-ascii?Q?ooBR2wXNcTggdhmmVLOX0J/8IWFFKC7bME0Ql3bc72wEh4w7lD44eg2qofZw?=
 =?us-ascii?Q?+86W4qezotvkMFfpQ7/4nds=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1cd7eee-da71-4771-0508-08d997ddde38
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 17:35:42.4923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hJ11t2/vdLB2A58fNhuCw1l6VMIFkhSKkwnYJmceE6998AnZzmu3JONPaScTeIfcAn6xodgB3XDBNW/h0fHlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3157
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10148 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110250102
X-Proofpoint-GUID: fychTKbXcvXHilXliQJiKAqZ0wrr42dF
X-Proofpoint-ORIG-GUID: fychTKbXcvXHilXliQJiKAqZ0wrr42dF

The guest may access the pv vcpu_time_info immediately after
VCPUOP_register_vcpu_info. This is to borrow the idea of
VCPUOP_register_vcpu_time_memory_area, where the
force_update_vcpu_system_time() is called immediately when the new memory
area is registered.

Otherwise, we may observe clock drift at the VM side if the VM accesses
the clocksource immediately after VCPUOP_register_vcpu_info().

Reference:
https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00571.html
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
Changed since v1:
  - Implement force_update_vcpu_system_time() for ARM
    (suggested by Jan Beulich)
    While I have tested ARM compilation with aarch64-linux-gnu-gcc, I did
    not test on ARM platform.

 xen/arch/arm/time.c        | 5 +++++
 xen/common/domain.c        | 2 ++
 xen/include/asm-arm/time.h | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 7dbd363537..dec53b5f7d 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -351,6 +351,11 @@ void update_vcpu_system_time(struct vcpu *v)
     /* XXX update shared_info->wc_* */
 }
 
+void force_update_vcpu_system_time(struct vcpu *v)
+{
+    update_vcpu_system_time(v);
+}
+
 void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
 {
     d->time_offset.seconds = time_offset_seconds;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8b53c49d1e..d71fcab88c 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1704,6 +1704,8 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = map_vcpu_info(v, info.mfn, info.offset);
         domain_unlock(d);
 
+        force_update_vcpu_system_time(v);
+
         break;
     }
 
diff --git a/xen/include/asm-arm/time.h b/xen/include/asm-arm/time.h
index 6b8fd839dd..4b401c1110 100644
--- a/xen/include/asm-arm/time.h
+++ b/xen/include/asm-arm/time.h
@@ -105,6 +105,8 @@ extern uint64_t ns_to_ticks(s_time_t ns);
 
 void preinit_xen_time(void);
 
+void force_update_vcpu_system_time(struct vcpu *v);
+
 #endif /* __ARM_TIME_H__ */
 /*
  * Local variables:
-- 
2.17.1


