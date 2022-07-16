Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DC3576D41
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 12:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368691.600071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCenP-0004nr-RL; Sat, 16 Jul 2022 10:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368691.600071; Sat, 16 Jul 2022 10:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCenP-0004lb-NZ; Sat, 16 Jul 2022 10:13:11 +0000
Received: by outflank-mailman (input) for mailman id 368691;
 Sat, 16 Jul 2022 10:13:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tGfz=XV=oracle.com=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1oCenN-0004lP-QV
 for xen-devel@lists.xenproject.org; Sat, 16 Jul 2022 10:13:10 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdde389f-04ef-11ed-924f-1f966e50362f;
 Sat, 16 Jul 2022 12:12:33 +0200 (CEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26G3CEhD002739;
 Sat, 16 Jul 2022 10:13:01 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbn7a0bcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 16 Jul 2022 10:13:00 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26GABiXK007572; Sat, 16 Jul 2022 10:12:59 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3hbkrynfx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 16 Jul 2022 10:12:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4532.namprd10.prod.outlook.com
 (2603:10b6:303:6d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Sat, 16 Jul
 2022 10:12:57 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5438.014; Sat, 16 Jul 2022
 10:12:57 +0000
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
X-Inumbo-ID: cdde389f-04ef-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=1k6gj6cFFW104RN+pwDglwXobR+RGNKua6JhD5+mt2k=;
 b=ulJMSdfhaKe5bIWiLrP3Y/GDB2AyiASabwWxLfBRujmRkWzUwfYrj6TYtJIt3Yy2Das0
 f4HYAxW4XB19RFr7XmsTHSm4wfCLZukbRLOsrN6OHs75dNbqlHrmV9//M83S+EgK/fWf
 /fMt4rfObYdwZBTEPtqSMUwIChMObPzoP2vj0q9HcUpCQkNgWvhEUQSZIZos7XRwaXUs
 aQHwjYExDaZh944tUVMzoP1yRXdEdNN+bPYIYTu3Dddoo8swD5rFlknU7rz32qpcSRLY
 Q99qdTA649FWGO9DkdvKb45p3VdapluBYOZFQGpnmVD3uzs85YE2k7Aror3lzDehLRYC Mw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVF9qS3I7dT4P4f3Lt4K+oP1bslio8KIukAJ3OVT5brH7h5it9vKNF+4Ok5NV9lImbiY+sD/sTNLUH46oLkQMEMpvC6tyODGPzdCfPdJQKjvL9w0oDvI8BCdNyFInZfxgwlu0TKAdZ7HdOr5qBKdXtgUhU2OYWQnCO3RO+ZWyLZcYJ0ahXfBbdkRqaJYkQKU3h95d0R6IEk0tkZcZmWi+L9F6OVIk14XBEarC9fWJBNAT0byzkMJ+wZmlk4wygDF8yojCm2AMqv5kqTAoSSAo6QCOBuQS7iRccdmdkzpsQe31c/aU5n0A50Xez0WHWPmcNcLWzTvmZl1Tzfo+PmVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1k6gj6cFFW104RN+pwDglwXobR+RGNKua6JhD5+mt2k=;
 b=LqRMF6Kc6F9rAs+FtTlyYyfxveGL86mzzYSH849W5g4s0qxrP37narNBPO/oplSO61GgCuwNRxdw0hKaobAbUdtYBpcJsa9un8pturQikQkQw1VPfq194oHZjB+Lq37yRZAC3v2ivak9njoGWWCCMDBayA/RHuFw3NsBgsN1xAruSXmRbMIOsSU5y1eHmcndtSaM0Hic7r6s03qR5pFHyz61QpLpq0s616RVD+3m5IKP97wQTF82edwYQIhM4kiCSFzhtqeNU9cW2e166xdKzgD29lmzljYJVzKQMAjnjLej9poOQtGWtAlPVGJjbWRpagQMawdbPW4+JKtoM7MxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1k6gj6cFFW104RN+pwDglwXobR+RGNKua6JhD5+mt2k=;
 b=Kxbf8ZnGa9P6RfHObC4+Wcx3mGzjVsk96tOpE4Yo+PgLLifCTObj058+vi+3IZp8RmP1GokahfQFiILDdWR1D6BDhIrJOZ2PDVXr+Qc8hTneAhIpA3IeWEAkBTVHUblS8hXZWCSSA5pKsVxCG0PqJ8AiMjjHnriCmt1K/2hNUmw=
Date: Sat, 16 Jul 2022 13:12:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Andres Lagar-Cavilla <andreslc@gridcentric.ca>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        David Vrabel <david.vrabel@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/privcmd: prevent integer overflow on 32 bit systems
Message-ID: <20220716101246.GA2338@kadam>
References: <YtEjVdG+pp9DGz++@kili>
 <fa5e41eb-7f10-56d5-77db-e214535addf4@epam.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa5e41eb-7f10-56d5-77db-e214535addf4@epam.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR2P264CA0044.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::32)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c968cf8a-b27f-4c63-81e1-08da6713c107
X-MS-TrafficTypeDiagnostic: CO1PR10MB4532:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sXT14P+tgbTEwQJUQ4nMfdbFxdYxRVoytehprs6PzyPZHZ1K4xrLEsZMgsUHyq46hKadmquxG3SOceQ7p1KTXKALAUj6KJqRQtE8Skcepblgq6KkpHOtU/Cs5G/UO8qZ4TOHS1+yjgwh43cXIsldZNFTowAS7jDwBDaSb+coV6Y3ie6/1kcwgqIOdBqr0mgs8omegiBArF+9FzKaSPkr159UcxwT98qLQs8e/sPnUVpk5MWBNvQTdVQMy+7C/44L16Oj3CYB34lxwWijyIFCkRg7xn+GlTe5zjkFO9PagHDCNsWA7ziC6zMdhRtkdS7qD8tugh2irdDp/YBhdukf8OJplF4XHr0HbHxq6JXMCHknxePkQt+L9sCdxNxLDngPwiOhmg42yr3Al5MdPZnMII2fr/hj4DgG28823rnUjiqdf9IPEwyTqxQczinRc23PzBt/TOfqgEVZ/ATRAmYjzwjx6GJVvXGMs2bZMqOG5pyxNeAPzHb9bHNIU4Ji74LyWriud5b5LmWTTS82KWmHGyn/TfJWfavehOV2w9yQHHrn6q340Lh7MkfydoMIEt0F4rRDcvvAqmcFKvWsCXypO9U3eeiFMHJ3xr3idv280HXv1szQKKzPAL+Qj3YVwx4b/XUpCFi+Us3AIVyrWf8KQZBw19GbxkzDsF3paOtEUF4hbhlVGpSVH/5tob36eXDlUn6Fn5HyB2s1btc1T8PkfXoMrwIOK8K2YVKPsZV36xP6YjXmWOOEkHsOlJFqmac5RopmGbcxlGDvdG7APHd3TOewHq0GnIPWraSJNHKgQqJ1pcbCwR0y60/+gxLApjmi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(136003)(396003)(366004)(346002)(376002)(6506007)(9686003)(6512007)(26005)(478600001)(53546011)(5660300002)(8936002)(52116002)(41300700001)(6666004)(2906002)(33656002)(54906003)(44832011)(1076003)(38350700002)(33716001)(38100700002)(83380400001)(86362001)(186003)(316002)(6486002)(66946007)(8676002)(6916009)(4326008)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rKum5LHWG2R2GAO++IfvqoxbVehEe/E7VCCWJxbyxLkjTpsphy9Xvvp/LbXK?=
 =?us-ascii?Q?UQBZlRVjep7+Lkb3fTw7P9S/ygg1TxjMCiBP1Ut8pVdYqVM38memMJYom1Ii?=
 =?us-ascii?Q?Bit3HA9aPzMIfXqVPBu6rxjueQVY+OIEi+Qkwm0Ra0olI+tMHywr8p3YbiRE?=
 =?us-ascii?Q?lhEHamjXi5TQ5tqWgfH7kqaaTztfbZr84aigcPoXy+JQlkLpyqvQo0p4Sq4l?=
 =?us-ascii?Q?YItR82e2wUeq5SNgmqOLxKSgvskcuCgP0tz2TfTSlRWgIpnWhXePqtojBI+N?=
 =?us-ascii?Q?32JtDfXdxkLk9azzowyGkh8+vV0aMzPaFuqyDRGCFqP5VJQ9xlH3gxsPXF3B?=
 =?us-ascii?Q?Lu+OQXkYzQJRqB7i11H44GIltJ38PJU/FOQqcgxw1SuPvfTlhSoeaREGS/Je?=
 =?us-ascii?Q?6Jzqpwm3B+uC8qqfV1cVeQ5EepPKtHs3GVQY7tjQ0cxrmpY2Tfwl/RRjqHLN?=
 =?us-ascii?Q?wfTtVrIcgtSmXZ8u6zJpzpfqVdjqIcV9T9gdcwsABrHBURzCk60yQmCEqgau?=
 =?us-ascii?Q?CG1oOLAJYC5xHH44euEMjOarU1oEZ1lyXHhewrA58P/2ncNSdydc9zytO4Iv?=
 =?us-ascii?Q?cpsRV3C5dnychOGvDb1o+8lm8mFe4mPvgS8HSm8H1x6nqM/RAxsROl04qlkw?=
 =?us-ascii?Q?PBYnWxwBKcytR3DL4jh1fKpb76TCyfLvh79O0qipfNV4Jtdse0iiBXaRLHCT?=
 =?us-ascii?Q?i2CUt6136Izt0dW8EwyVhDATa55DIjyQIXKL7uUmE4VVwyD35f9UvhIlsKme?=
 =?us-ascii?Q?tizognQkjdaaPU86aCYHg9dtoXBXk9AR/PJfh4FMeEZYpS3PZB/ciFS5P02M?=
 =?us-ascii?Q?QpjValCeUpyEeqPFP+GlXTtKgpR4XddwNBv3H/346LdrorQ5jjsonovU6KB+?=
 =?us-ascii?Q?aPyhbJnq+D9k0BlRmowL0CLMPXTcSzWeDww2u1Hil+9ndjypF6JSKuEXbIzL?=
 =?us-ascii?Q?XZ7zh5JRUTiyGbM8yHSmCDAlqNBuZeyu1LAfL5hfurZ8+rgujKOMHTdUJb1J?=
 =?us-ascii?Q?zClCFQbEkWFd0f0sNn0tzBVEcD+lrsGKutsifT16yJ6NT92RH/0aiBsllBLz?=
 =?us-ascii?Q?XrE5EA5XsrHU0F19jSzWq/W5OTPon9GTXOvqgRk+7c3ANFs8b6P70JHLxLuz?=
 =?us-ascii?Q?BQceGoqqny3TI+8b6xJiZZdI8AuinYd1xvgBlGEREbu/NxkAaEH6qLI5GFDJ?=
 =?us-ascii?Q?MrZp5DxojOzgXS+IreaN3ftLcPAFi6nz5n5flwO3epZbjUKT1OfCzNQHyxlW?=
 =?us-ascii?Q?TFSWsXTtYR3ztgdfd+tJA7ZYAgwl5tf3QjX5GMaUS3H/xLBNhGV9Z01+iM0X?=
 =?us-ascii?Q?hZuNWcP4+k/aXz3VrgVK0cIflcTZv746C8+COHSqBRmE5Rt2DLbBJg42Ct7V?=
 =?us-ascii?Q?eUd46ZkoDAkfysJPM7Wf0ooUjnTGLkXKRJsdx+LxelTvFaZotX0EvQ/vDaWz?=
 =?us-ascii?Q?AHBkgVW1RgxT+xXw9TKWuvjWK1vbSGoxI6Mq7E+PyTq6BsPpVZdN+T7LUzIY?=
 =?us-ascii?Q?kPd1RY9O4zOuhDKWBkuE3suvslku4aBBKTmTRGsrlZxpC6s+trkXHY5Bb91I?=
 =?us-ascii?Q?EORiACzMwKdVPdHYz+ZNQRLDHigf8ZlWLQ+mwnqq?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c968cf8a-b27f-4c63-81e1-08da6713c107
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2022 10:12:57.1411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHI1bBxj+tn533Iwdq0Ohc84HT6sLCH2F0E8YBru0D6HyGJh0N9BzfyGzpIRfcJ2rEkfl4l7g+qthRVQ679q15cClCornNosEM53LDnj7Fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4532
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-16_08:2022-07-14,2022-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207160040
X-Proofpoint-ORIG-GUID: qZYC0BGH8z82PbgsedSVW__RJKzuTlCR
X-Proofpoint-GUID: qZYC0BGH8z82PbgsedSVW__RJKzuTlCR

On Fri, Jul 15, 2022 at 08:56:30AM +0000, Oleksandr Tyshchenko wrote:
> 
> On 15.07.22 11:20, Dan Carpenter wrote:
> 
> 
> Hello Dan
> 
> > The "m.num * sizeof(*m.arr)" multiplication can have an integer overflow
> > on 32 bit systems.  Probably no one really uses this software on 32 bit
> > systems, but it's still worth fixing the bug if only to make the static
> > checker happy.
> >
> > Fixes: ceb90fa0a800 ("xen/privcmd: add PRIVCMD_MMAPBATCH_V2 ioctl")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/xen/privcmd.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> > index ad17166b0ef6..1e59b76c618e 100644
> > --- a/drivers/xen/privcmd.c
> > +++ b/drivers/xen/privcmd.c
> > @@ -456,6 +456,8 @@ static long privcmd_ioctl_mmap_batch(
> >   		if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch)))
> >   			return -EFAULT;
> >   		/* Returns per-frame error in m.arr. */
> > +		if (m.num > SIZE_MAX / sizeof(*m.arr))
> > +			return -EINVAL;
> >   		m.err = NULL;
> >   		if (!access_ok(m.arr, m.num * sizeof(*m.arr)))
> >   			return -EFAULT;
> > @@ -464,6 +466,8 @@ static long privcmd_ioctl_mmap_batch(
> >   		if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch_v2)))
> >   			return -EFAULT;
> >   		/* Returns per-frame error code in m.err. */
> > +		if (m.num > SIZE_MAX / sizeof(*m.arr))
> 
> Looks like here we need to check against sizeof(*m.err) which is used in 
> the multiplication below.

Oh, yeah.  Sorry!  Need to redo that.

regards,
dan carpenter


