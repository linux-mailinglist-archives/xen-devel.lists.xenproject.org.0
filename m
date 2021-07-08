Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B353C1517
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 16:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153157.282954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1UvO-0006Ao-Qj; Thu, 08 Jul 2021 14:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153157.282954; Thu, 08 Jul 2021 14:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1UvO-00068F-NA; Thu, 08 Jul 2021 14:22:46 +0000
Received: by outflank-mailman (input) for mailman id 153157;
 Thu, 08 Jul 2021 14:22:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKjp=MA=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1m1UvM-000686-NQ
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 14:22:44 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f53345ae-dff7-11eb-8585-12813bfff9fa;
 Thu, 08 Jul 2021 14:22:43 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 168EMXX3025875; Thu, 8 Jul 2021 14:22:40 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39nbsxtkt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Jul 2021 14:22:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 168EKD8h037372;
 Thu, 8 Jul 2021 14:22:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by userp3030.oracle.com with ESMTP id 39jd15rr8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Jul 2021 14:22:39 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by SJ0PR10MB4784.namprd10.prod.outlook.com (2603:10b6:a03:2d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 14:22:35 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 14:22:35 +0000
Received: from char.us.oracle.com (130.44.160.152) by
 MN2PR10CA0032.namprd10.prod.outlook.com (2603:10b6:208:120::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Thu, 8 Jul 2021 14:22:34 +0000
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
X-Inumbo-ID: f53345ae-dff7-11eb-8585-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=8+aqNpOIdC336lxqyNc/bD55AhEDMwUsfe+OdCIsvpw=;
 b=LTNyKg14gbyoNV21MAfFLgnpgzRETypOrZqXWbE7dapEYl7lmZFGkO6qG/3uuuioXPXA
 FQX3zpQa0Ao1tFjt35GcZ74JkICBk38jyUVwLU79crA5x/jtXrV3poLlVT4q3Dkod4L7
 5RKScWJC6DyTnmRP5lA1SZmL+ij6FC26z8obUi+NqR2tZqqP19kN/tQGlbLSFJSl7K3O
 12WjDki1feB9fyUo5Ii2B/brLut/+N9nAntfkG7JvkfQrkvHqsHkIhki755viU02cleq
 /3guEjYK92/sopediQKbEP1Anm8CoOfBrxrrm7vFq1zaMKubjhXpIWNVlXaVch+b9FId Mg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTZaeum1WY5qH2L0fakQjhybJgs1q6/zXBLJPB4U5y7JyE6Gvr+FWmFi0wG6mdkLGHnoZwWWW7WEeD4OVJbZSBbGzj5evNpc+eslaxEM8EPO/5mFWJEJk5+incV1a9AbfwIR0VNDYUk0mxsn15PBJzUpjP9AjFz+MnSvsSn/dVyNQQl3ftBppw4B+g3ecuujwlBZaJxo5WCexhxnCTJg8ZPRtK4/2TtJxGcnxWOLw/l6TYxrdhjZlhd6/YZpqdxCa1uuG+jPmB6WUQzV2d3l9+A95+dPTUr4Fj9B0XeYOgRvsjw1aULNjvsQen+5QmpiTBLXz0WKSfkIXk5ef6ayUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+aqNpOIdC336lxqyNc/bD55AhEDMwUsfe+OdCIsvpw=;
 b=lNdoIV+XNbb7jYR9JezJDXD8G88AGVIe3KGnp/rz0PJVYLkNKPblJcGTxG/Ip5GRKbjAiFHivxGCurXvAzJhpR9WiEfo8IuACkpylVk23XIBDtX25BueiL4jQUstQ9bUJz0ovPckk9Y4BUk838ceY/xqsF6uKRVwIvwO3W5S4HzOrs5I+u7gXqpuRNuXBod85gbVOBd60BKJVhUHYKCN/MPTGtFdAz9+SH2E4Eal0E4qpXvCwEKttGb6YPXRFlFGeXNePqrmF7JaQCGtnbghS05BXuxCyJ4Tanv3fmgnyW9mb461W/oLzBcnJQeE+OFYS+P1PNW+5BSTGkE4wLULWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+aqNpOIdC336lxqyNc/bD55AhEDMwUsfe+OdCIsvpw=;
 b=Avq5tnJoooPOrbPR98xd2+EB6fnWcm17UxXHEErvOc25MKmIoVjbhTK6en1TcDKF+Bs6+1x5n7n8HnKXzlxpSV5qs91VAGEglercYR3GVRUMknbt/tGM7Y+Her/etIL32ZkIMM5muOuxQeatbjwTupfy2qLZLSccF8q9bZOQEpk=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Date: Thu, 8 Jul 2021 10:22:31 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v2 0/3] xen: harden blkfront against malicious backends
Message-ID: <YOcKJ6m31tHuq2kh@char.us.oracle.com>
References: <20210708124345.10173-1-jgross@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708124345.10173-1-jgross@suse.com>
X-ClientProxiedBy: MN2PR10CA0032.namprd10.prod.outlook.com
 (2603:10b6:208:120::45) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d36ba2f3-bf74-4b9b-d202-08d9421bd50b
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB47849DD12284E1917D44FB4489199@SJ0PR10MB4784.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NpJNicft54NU0o5bY+ypmRKcSOJzBbttEiPos6zjQgNHWTRB6mv0vygbpsSkhlJBWcLfDP129P2h6ncn4Ao9h0ekIDnbspLQ3QBlo3cbDWJfEIC7rIizcCebUuggqrlhf0G3ugw6BbxJXAQFtHVejXMfg2eenI5RAtDn9T5oKZrbkOOR5BfO1BpTkGRk2c6DXmktXa+nrUx13MoGYRkch6b70jFFVwJQI2F+/ae3bsHJOhQ7Ncx6TXB6jNFwyrdQ4K8TZc1qblpMvwiamDNbJfb12cXOJd5a7LAy1+Ij/If1qYtS47aV1xu7iY7aeLVAGEI2lmg5x/LXUFH/fatCHidvPWI559WRWNZhFG6bP86io3u50+Kl5rquUI5GwNYs2zKVDTsth+xwCAeNdvbTuUN6wy2E5uzRTNT1lGSepZ+tX5EFRaoz7/jLRVRAlks1iZaysOFNVi/y24YBLahyyI6EIscOblnNc6iocZhBMUxTDfJv2g+cmEKo+r+3wO95Z70wbZDqkcqYXAmYsf9nWQGIlez3s+wWGA1IstH1LwlaAUBccQcEOL43yDSGL1JX8uF5QA/wbAGFU9wDowNtwXToysuPc2K3oIQjDQ3ThwJVeI0RCUjWYs8FIKyR9Z0laCsIWQr9AvtBolKGJ23MdgY+hQ9bP/42EyRaGcDtwkTq8v6144XmoqiVQCdmjJPn64/nNgFayKjuLZbYEw18FsafJIOIgeX8rYHER5cEDCHof9aqtLBvtccwJe7p7MytWEcVk4VcjLC7vrlmCzajIIF90bxLCmlgqosgnn8YAu8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2999.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(39860400002)(136003)(396003)(478600001)(316002)(38350700002)(86362001)(966005)(38100700002)(2906002)(83380400001)(52116002)(6916009)(26005)(7696005)(8936002)(54906003)(186003)(8676002)(4326008)(6666004)(66476007)(66946007)(66556008)(956004)(5660300002)(55016002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y3ARb6nCAKV3Czv7MtYPpmokDhR/zrnUzhjSPOK7Rcq027a1q0auvcQfbfRh?=
 =?us-ascii?Q?GrDKA0zJTL9PIf7YUB+svcFOoUY0z/OMzJ5vf73B54cgM4bdTB24ubBak0+d?=
 =?us-ascii?Q?8CcY/ha3JbHxOzDQlDHtMfdRoKq2/M167r7MpgZPWP39CaFnaR/tm1MBVDfR?=
 =?us-ascii?Q?nOBVmeDeYPA6dOn8SmfcOc86unJHDXZt/13wzafPAL5o6FioyRBB81T49BsX?=
 =?us-ascii?Q?NbUaL0M97O1nmigeGpx+PhBuPPawSUYF0BKq+bCmS6pEZX5KzLZ2Lv62ZSxZ?=
 =?us-ascii?Q?5HxGQWqwXDVK9tygyd+zm0QSA0XLv8dfeuHbLgt8lMUjkjas9MNnwaflR5Gb?=
 =?us-ascii?Q?PuboWg/NHCL646vFWy4qpdDCTUmi7ZonVW19jIn8HYWxRgv7esjeePAPPMPY?=
 =?us-ascii?Q?ZkTFe6RMjz67kX03nQKlle5Eu24zIAO+qg0K0cGo1ebELE78Psjym7ccxtue?=
 =?us-ascii?Q?xPJXYgKB0spNZChvX76VetlRiogU5aqvO5fLs/7LLKiYO9OoHDLJSv/5humf?=
 =?us-ascii?Q?tcVYDrs6U62UxAa6EaQROPJbweFBUnDgeh5aQNKFiK5licpny3I2iylvDFsj?=
 =?us-ascii?Q?YGmeR0NaD2v3152+HRZ2jHp5J8fVWNTZ2B2ngxJJUxj1ArYvXXNBy+BOS98R?=
 =?us-ascii?Q?N5v35WC2su+E46NwySSmhNIH3kErwjIwEbPObmXnAUdeMTJA5KXchFPn1rp9?=
 =?us-ascii?Q?LiPb4OmXlNTm4RkttT43mDbJytFDhJVLaxSQtOYsxVXO2PKs2htM/mkxf4qP?=
 =?us-ascii?Q?5wJvNyrY/4KyERZ/3IPI8XiEeWySqoFXb4uc2lTI13xlhzvubYQmS95tGppq?=
 =?us-ascii?Q?Ym2e9g+fpuCzY5iptD3K1YrwbOLEJlvdDusgnCqh50IEThCcGRwaTQYzD6cq?=
 =?us-ascii?Q?mdmW3CXXcSCqTp9ldmeKMjG+bW/WjaP/xp9PjXedqX/Hs0sgQUAb0ehogCbo?=
 =?us-ascii?Q?tCwJAb3dqSWiC41Nz+FK9flmFQJYeWCLS4la9FDY/9X3XKQhpH3sOOKlfaVu?=
 =?us-ascii?Q?U4SfGYWPfUHzIULcelfC0OMyiHLK0jSu8Vc+srBdhyMNxpIo5mcIrd7Il6j/?=
 =?us-ascii?Q?Yx6/sz/FKCpOPaCN81TPqk+eZmh+HFAhvCzBQ+XaNcwOFcAhPo5+h/X4au4+?=
 =?us-ascii?Q?FTDdUCvwVn4knty8ZhJMJmSGDWdfLpUxWcJIX7TF9ypwmNtkEPnuKFB/heVd?=
 =?us-ascii?Q?Tw6xkEuFJy0cVUbSFKneVg5efVxxllAsZuG9yjH4rkDulgogwldYa5IH+v3k?=
 =?us-ascii?Q?KOyrwSO3XR81IQ0kesCX+QMZw6xqLmW3ruN9nfinFlK0g9f/7WgcKQCldVPM?=
 =?us-ascii?Q?49gueOoFptQI5UHmwPf3SHiH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d36ba2f3-bf74-4b9b-d202-08d9421bd50b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 14:22:35.6637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJft0CievwA0O/A/blsVuPrNFEgcrqjXzukmfT7Q9lg5oa/01dqMykVWDAbazvIS2uYBPocCX29YIdHHDW8kww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4784
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10038 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080078
X-Proofpoint-ORIG-GUID: I-PLq_lY1OLt-zFhG7kTrumscKKdY6nu
X-Proofpoint-GUID: I-PLq_lY1OLt-zFhG7kTrumscKKdY6nu

On Thu, Jul 08, 2021 at 02:43:42PM +0200, Juergen Gross wrote:
> Xen backends of para-virtualized devices can live in dom0 kernel, dom0
> user land, or in a driver domain. This means that a backend might
> reside in a less trusted environment than the Xen core components, so
> a backend should not be able to do harm to a Xen guest (it can still
> mess up I/O data, but it shouldn't be able to e.g. crash a guest by
> other means or cause a privilege escalation in the guest).
> 
> Unfortunately blkfront in the Linux kernel is fully trusting its
> backend. This series is fixing blkfront in this regard.
> 
> It was discussed to handle this as a security problem, but the topic
> was discussed in public before, so it isn't a real secret.

Wow. This looks like what Marek did .. in 2018!

https://lists.xenproject.org/archives/html/xen-devel/2018-04/msg02336.html

Would it be worth crediting Marek?
> 
> Changes in V2:
> - put blkfront patches into own series
> - some minor comments addressed
> 
> Juergen Gross (3):
>   xen/blkfront: read response from backend only once
>   xen/blkfront: don't take local copy of a request from the ring page
>   xen/blkfront: don't trust the backend response data blindly
> 
>  drivers/block/xen-blkfront.c | 122 +++++++++++++++++++++++------------
>  1 file changed, 80 insertions(+), 42 deletions(-)
> 
> -- 
> 2.26.2
> 

