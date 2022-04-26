Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C3850EFAB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 06:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313430.530946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njCdB-0000t0-A2; Tue, 26 Apr 2022 04:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313430.530946; Tue, 26 Apr 2022 04:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njCdB-0000qZ-78; Tue, 26 Apr 2022 04:16:53 +0000
Received: by outflank-mailman (input) for mailman id 313430;
 Tue, 26 Apr 2022 04:16:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jBxj=VE=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1njCd9-0000qT-AX
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 04:16:52 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0679aa3-c517-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 06:16:48 +0200 (CEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PLV6sI022232;
 Tue, 26 Apr 2022 04:16:28 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmaw4d0w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 04:16:28 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23Q4AR5j012450; Tue, 26 Apr 2022 04:16:27 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5yj4940-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 04:16:27 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by DM6PR10MB3129.namprd10.prod.outlook.com (2603:10b6:5:1a9::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 04:16:24 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::d1db:de4e:9b71:3192]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::d1db:de4e:9b71:3192%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 04:16:24 +0000
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
X-Inumbo-ID: b0679aa3-c517-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=VgShOSuxQqfoj97gAL6GK2pWBCOuBmWMfHpOmNYmLms=;
 b=OtYmsq8G8b5RI22dbLOhM5Jw4sreT66i/r4obiHaBmE7x18GcwopAR6A8LjRsyP0yrwu
 /ChcpAp6Eb+flbIKuNrqgeGzAo2MUWXRoZreohyeg2Rk5mO6D+sfmjFltbiKlvM+ELq4
 RwcStAPaLz8AX9im04VlQ59ayyK9WPT2W0QQoZYXQ8mY8foBidZ4jI6BX78BsHu0SlDP
 0e3v4HGavanW1GE7bFS/xzTyDjsi91O1EhjtH7JLEwO9tlcmdUNIQJ+4n3n660UGzZCo
 qfqJQCDk0chCqM7CUmiA+I094CYXxG4ZZB7SXmK+GU4U6eIyF00KFboyDbWOLXmL5mGc 2A== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUOhLZKNL3vrNl/maSq9xt45/b5a9NdXwIhXvstJAYwIsAi0DxupEQl/Yvix7bJkhWOcyWDMj1Z86LqzR2sBaF9Njm7mKI0E7iPfS6tvhupy6YoXis7wjl2yAmEg3XVwIwnRD7TXGS7Lp4uSKHm+D+vNIIKsp07IgnqK3C/esfCnpvAQspS/rwxCLYikKu3NATPpsD8FIckfWAfsADoxVsInmB+mfKQ5CeQKCpwTgVdzibDwYWjb0/FhMPRYu+CM7azS0uotfZMZj4EMLuozZJHZhuyydbp/FNVzkBbrTHENZwrGfiMYt1NkVjqWTGu+IUDuJEm5vrAdkdX6U4bYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgShOSuxQqfoj97gAL6GK2pWBCOuBmWMfHpOmNYmLms=;
 b=MELrS1W3JzftJQi7nfd3yt907GKzrEuF69GOSkRcSt/yRF0P26S8bQJ3u5SkwIh0cbPh/4ivs7IazWwxNEzZuDmdrvufbsv1y9r2NtHzoWo80/GIyAOCopQpRS3vQYoRIo4eGWfsudOh0C6qucCJFG21qOmmTOxEKGvrOsUO+etVxSrAc947LtMJM6bXqTIh5nhnlWjxNB0GOtSQ6vZTzyBo+HadFY+E5bfv6pIpzk5wldicLOXEXu+ZRKS1179vvO1XHRQsi8So10WAuPLIms6ajGHbjwXkzrTBwQxPBvDCMrIfTM0degoP/A7PqMTdRDHZbTcDPtXzs1+/+qwQGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgShOSuxQqfoj97gAL6GK2pWBCOuBmWMfHpOmNYmLms=;
 b=A3am2cwBpuqjfY9kIPSeyfS7WwrY3aqquCThNKiIOdYqL981QzGx0dyEc11s46jGa6ebZeevTJj/79eFZ394X8QAkoUzqgK1xhVr0SGikjY+BNh5NjuNlE+uzRx6fhSULKfR/dmqEh9lDelXfGMgep7VN1yBS1p98+BvJXLcSAU=
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>,
        Johannes Berg <johannes@sipsolutions.net>,
        Josef Bacik
 <josef@toxicpanda.com>,
        "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
        Jack
 Wang <jinpu.wang@ionos.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
        Mike Snitzer <snitzer@kernel.org>, Song Liu
 <song@kernel.org>,
        Stefan Haberland <sth@linux.ibm.com>,
        Jan Hoeppner
 <hoeppner@linux.ibm.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        linux-um@lists.infradead.org, linux-block@vger.kernel.org,
        nbd@other.debian.org, virtualization@lists.linux-foundation.org,
        xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org,
        linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
        dm-devel@redhat.com
Subject: Re: fix and cleanup discard_alignment handling
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1tuagv5xw.fsf@ca-mkp.ca.oracle.com>
References: <20220418045314.360785-1-hch@lst.de>
Date: Tue, 26 Apr 2022 00:16:21 -0400
In-Reply-To: <20220418045314.360785-1-hch@lst.de> (Christoph Hellwig's message
	of "Mon, 18 Apr 2022 06:53:03 +0200")
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0082.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::23) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 835a5865-72d0-4ac4-b537-08da273b86d0
X-MS-TrafficTypeDiagnostic: DM6PR10MB3129:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR10MB31292380D74F76EFD145BA388EFB9@DM6PR10MB3129.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X0D6KBg3dYE7LKh6WthP6tgUSgJnyXvQVuy37VB7bVFWKyTyZpiYPqKVs3Jzizuwg+Sf92KHStLxr+xa3JI22N1hfVbIdR+D/hINi8ev2jXI5RPeztSc9M7Pfv8wN/KlfccpqYFzZlCo5fZC0qJe9mn6+euobijLQ+ae3W1Q4ZSSK+k6g3gj1X9rr3ZFeCf9R4oOxgqjLqE//AGw5JJz14O+wIKv8oOUSl5DbPRYYE5pYch3DXESswFS7q0LgWDkyynxnMeCOwM3I+ZcXRp0HDOOw38bg1/UmGwk7R6kKoQT09BnhshRQptOGkKJbk1TqA3ojIMkvwsO3BvRvme7OKVzKhtfYOrpHTxE1nDe7oUu1zaDggjj9Hx+tUiT2rsXAHF4nqmCzuVh5sZx8O3Fr3KQAaZ0iGVMV17moVVHaqC7x0Ze//UiVG51Ku4RDI3eHLUHWoAnGy3IJzDuYBG/otHNI3ceEV+qLsmjxX8+cDTfHXvH4dK89dvlqS3ADewVSJmXUQBL3kRw79LXhxkRdbBZckOUrZjGYfDlE6UNpH3ka85nzwyCT15D+xxviw7SVLIkB+uYD47wiiadu9xCVEbX7c1Bbglyrs2g+wOET49yX+M04p188Ceo0MX4Z0s/fEANDpsEvkPbetZ+B9iMa8H7On2NO3ifD93u8aM1pkJwPcnEAW2NFb6Go6fxxHT6CptTyDO4NAfDFQ+CIZFuRA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(52116002)(8936002)(186003)(4744005)(86362001)(7416002)(508600001)(2906002)(6666004)(6512007)(6506007)(26005)(36916002)(38100700002)(38350700002)(83380400001)(5660300002)(316002)(6916009)(4326008)(8676002)(6486002)(66476007)(66556008)(54906003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TB4tA924ES23Jbjeya1BYJTs1OvtA/zZv6THpxhMU79cce2hBvRPpiS49za3?=
 =?us-ascii?Q?mUONwmtJsiCknSg/EcY91oV51b/6kYP1mGaQV91M1HhGLu1bE/mmUjgXe5BE?=
 =?us-ascii?Q?SqqnyHd99Z6KyY5CLuitjo7OSNvyWpQ3ukZ8SyjQEJIcvnq3Gg3EkU5R+HG3?=
 =?us-ascii?Q?F8fUv9n6HOda4W/bB+HraU/tzreM8+EWPjk2HYGDdAC7U32s3JGn4V6pFdjc?=
 =?us-ascii?Q?EyZC/gXEK2RXovs+rqNtiXAn8Y1xnn5A0A4Nh1NIJFpuaTiTpo2VmTYmol6m?=
 =?us-ascii?Q?0UbCryYNd+ZCvW5dW/X4TU1Qv+oPKgMV9lqUzmk7xOYKt+9B/hPqNDcHBglp?=
 =?us-ascii?Q?XTeDDi8XHXO1D5P3WLajf6NjFpitG4XqaV9vmUxClpxedVXvRbi98PBuLTeF?=
 =?us-ascii?Q?BKRu/8UIxZUe9pthO/CO66KVDUBcGOnzELJEsoRFs08hY/UG2sqncy7tgt0t?=
 =?us-ascii?Q?nvA55r3YQu8SSkHhw50KmjFF706K/czmMyEdVi2HXCzcPiOxOs7KvhJywE1B?=
 =?us-ascii?Q?Eh1gGP/2tgTCaYhCTSs1zZ+ZFeoSw0ocq/HEgpIntTv6HJtpQx6KqSRGOXV7?=
 =?us-ascii?Q?JcDQxbe1XhEdhnAbfzp6vEcG6YCNbs0SIxKP6hS7jAteqV8nRLnAjLRy1Pph?=
 =?us-ascii?Q?H6E+hxLB1CInAKwRT0/+o/fAsfmcGgoDJAnIfVg8BZ67BgRdV2VALulbozvP?=
 =?us-ascii?Q?2wnmKY+uku255u0vK1dEoptoo6YpiOODxrPEKu2rm5dJklw426eL7Pcbf6mB?=
 =?us-ascii?Q?2jo0Q1xNQoM3RmwrrrIufsvxMNGmz1mWqLgExox8rn0CGer6iwJVzl7MHvtx?=
 =?us-ascii?Q?WSisn2XeQ31GZs2Ays3lwTmolcCHLf1sN39+oJQziOJg5iSOUBlrE3qY9ryn?=
 =?us-ascii?Q?Ddy2KZo9oGxfl0CzSidZvVjfHjOQuDCpI794Pucgfowl2w2KruGMXZS3GVgl?=
 =?us-ascii?Q?QB4KWlnDOPGRepoOY18EgaS2wd3XXbdWYFxh7NY0ySmiq96j9DUNERGzOtGP?=
 =?us-ascii?Q?ke8nRsN6Uts+l5dXLI1WLLJtOTOMskxZ5cqzXGXbWfs6cnqNc4N47g+MOOMi?=
 =?us-ascii?Q?khwSby0iMLA5fQsyRHYHr+Yt2+cgpCymS7woTMu5/GYc2Qz71IwKaYYrE0T4?=
 =?us-ascii?Q?yiHlseLzNfilBiXLRkBdCfz1quf0+RtPshsIz4+ucUYTNDgmJi75SEuIBUEP?=
 =?us-ascii?Q?Aqhzuj7AMa3Y9agTnz1W+7vd7+L4aj3Hz1KF6fS2W+PqHp6HVS757X8KtSDp?=
 =?us-ascii?Q?00DgbNPViQTRs9TQ//lU3PUutFq7odj+TM3IxVZlfds0Qyg3pxbOo0g4JNg1?=
 =?us-ascii?Q?sMXx2p6R35Wqw94RidfoO22d7QrxNBSa2tC5TV1fuA5Xo0CrGQkdrvgBTJVO?=
 =?us-ascii?Q?6YNaMJanUjQJVYnjGO6DkWgTuVC/n+nGFzYXeqdMymlT1wFUzJlaASPKrpyF?=
 =?us-ascii?Q?SQJvJ90b4tiE3DW5z5HBnA85+dXINGsNFxdRxipwE6F0s4T4sLeeFObSgiNe?=
 =?us-ascii?Q?0PU//rhhc23Negk43JrkvaDsNkInRzuILS80NmHqquWDI/2TR1/Jwq2acRt+?=
 =?us-ascii?Q?pDpZbxqRYu0dB0FOfOHQwMQMUtJXNwhRUEyyKvKFB1kh9YRCqY7Le4w8GOcL?=
 =?us-ascii?Q?68r28By/gaXsB3HU2N6tNEWEddQVidZzuQSCRzX6xxDgwLEGc1T4y59QDQ3m?=
 =?us-ascii?Q?XW6XaDzoV+2/HLCd7yg08CDJxvE5dwpDDIETeYfsVF8WLkmnrhL6SSnsWcHg?=
 =?us-ascii?Q?//ysxLiDUE8tILEWYPxrVO9Squzf3gk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835a5865-72d0-4ac4-b537-08da273b86d0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 04:16:24.7224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nf2TI3DEgT4qtSJndbWmRFqMGbzkMS2vq7+Y5mOBDAJDRs7oHXuyNKkAk9ybd0dRtdbzLEe54D/bHDq4bXF1AdU2cnvLzYXAEPCE3V3v7Ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3129
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-26_01:2022-04-25,2022-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204260025
X-Proofpoint-GUID: 76EsLqdiuyTX3yre8fbQOOLA-RdU5MY-
X-Proofpoint-ORIG-GUID: 76EsLqdiuyTX3yre8fbQOOLA-RdU5MY-


Christoph,

> the somewhat confusing name of the discard_alignment queue limit, that
> really is an offset for the discard granularity mislead a lot of
> driver authors to set it to an incorrect value.  This series tries to
> fix up all these cases.

Not sure how I ended up with "discard_alignment" when I called the
corresponding I/O parameter "alignment_offset".

Anyway. All this looks good to me.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

