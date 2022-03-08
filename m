Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A42E14D18AA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 14:06:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286841.486508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZXf-0006iS-CP; Tue, 08 Mar 2022 13:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286841.486508; Tue, 08 Mar 2022 13:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZXf-0006fZ-9D; Tue, 08 Mar 2022 13:06:19 +0000
Received: by outflank-mailman (input) for mailman id 286841;
 Tue, 08 Mar 2022 13:06:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lJ0X=TT=oracle.com=konrad.wilk@srs-se1.protection.inumbo.net>)
 id 1nRZXd-0006fS-Ea
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 13:06:17 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87162064-9ee0-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 14:06:13 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 228Ci8Yw002361; 
 Tue, 8 Mar 2022 13:06:10 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekxn2eyjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Mar 2022 13:06:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 228D1G3a049374;
 Tue, 8 Mar 2022 13:06:09 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3020.oracle.com with ESMTP id 3ekyp256u7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Mar 2022 13:06:08 +0000
Received: from SN6PR10MB3006.namprd10.prod.outlook.com (2603:10b6:805:cf::13)
 by BL0PR10MB2996.namprd10.prod.outlook.com (2603:10b6:208:7e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Tue, 8 Mar
 2022 13:06:07 +0000
Received: from SN6PR10MB3006.namprd10.prod.outlook.com
 ([fe80::99d1:2941:91dc:bc78]) by SN6PR10MB3006.namprd10.prod.outlook.com
 ([fe80::99d1:2941:91dc:bc78%4]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 13:06:07 +0000
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
X-Inumbo-ID: 87162064-9ee0-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=zK/deBtyWDe5Xvuz1WlD5E5TH2mXQmiuMqnIbzuiDCw=;
 b=ZC6g0BoSBthcCe4uPM0yHYFXDHvQQL1dH96mXQU9T12rBLvHxiQxuXlQjrjs0mGHcv2T
 bbQ4EUB785Keaa8wMFSySl4OkYwxfFMHK+ldUZ48Qky9yvTzvCe9I9BSjzUL3sdwyRGX
 na1ACOOr5/ib5uySjUb3DQYimN0oH3/15uMKg7Vn2WBJL4S5mKRlyTF+eQYac3Fskbpa
 bvSuojHjpYmIMS1t3/7+yWxe4aXvF9A/HMtpoEO70BTuwWiWUpSqmF7Ra/QGPkZ4bhrC
 xme46zm8YUia0nvu9YSoyTjSOpBkBviEp2HqJtpWgHaNfSEfYhnHV796ByYlwCDPitbs Qw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILakcvTkwE1+9VuNmQObt2wr4jROyZXkdVvR09dfwUwFBfontVknKpuua8I7QFzoFSF6Gd+zH/HybBsNzkFhfbS1I+cQKnwDyEPy/ZXScCJwPEY0/P2Rq6PfjgE8rsEAU+1B/h3Vo8Kh1vhXotxWYzKx5qiWYstAhjQu1C7eN9bIUBY4GicVFpTzTNxegTm+LYDM2LzUi9WI/AmhF4jg4OZ3K3h5TvSm3mYjvH4JMJSJDl2xHWZFywYWv32DY2MwtBhFRvuok6K+LXHPeyQj4g6TPx9g48GZa55cK2QLOJ2I4PgdsSOKSkeCtx3+NS2deiEJsooeWNIeNlAPsodBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3U3C21nHbh6mCK8Uus/6EZdN0ukFe+dqwkhazJX0mcQ=;
 b=RU4WLfqEF7WM5mCxDKxxquSP464Mbh0AOJcFaazC6EqEQYfKc3s/69CBBGHzZbusVVE9+vOOuWm4zmiXYqo9lHayJz1ebJhIHlayJfYvAO1+9ly7KriAlk85XtYz0zw7coAeALGiM9FIwNSerQVNs3KHFg+JN4c4Z+wYGpIQqr00axAL4alhdmqPRq1fvER4Y3Po0ebO5S6U/Y0pMojFVx/m//h0SqjxFLgxW/Wf2lI7bm+b7iiyDIcVkfwBnTQSzIqDIYzyZW0SxjzhkJx6AZaHUHDuL+ZWhBAOE0qFJ8v9s/I2EuI+pBHtTXZ3pRLs7XKYehLntn+7E0zIBbg69g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3U3C21nHbh6mCK8Uus/6EZdN0ukFe+dqwkhazJX0mcQ=;
 b=BlIGv8b3N5opWjDV0uUSYK85FUe4TvXRnfMlvCXwthHpFd8Ev3km1TWcl0BtdrycanzCSZ7OkcMBukS/josyrALEizxxyT8ANezZSmw7WVTN1QmsZNla6x2EEupkfOzGW7SWLF1y0F9GgG1iPjo76LoizTVR3myHt10uWqEP5+s=
Date: Tue, 8 Mar 2022 08:06:02 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Bjoern Doebel <doebel@amazon.de>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
        Roger Pau Monne <roger.pau@citrix.com>,
        Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Message-ID: <YidUuuWGAghGY7oM@char.us.oracle.com>
References: <453c6e5decb315109a4fbf0065cc364129dca195.1646735357.git.doebel@amazon.de>
 <b91fc474832dd0ce07d223542316fba74afc35ee.1646735357.git.doebel@amazon.de>
 <cf0be28d-090c-1881-5831-1d58696a9272@citrix.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf0be28d-090c-1881-5831-1d58696a9272@citrix.com>
X-ClientProxiedBy: MN2PR20CA0012.namprd20.prod.outlook.com
 (2603:10b6:208:e8::25) To SN6PR10MB3006.namprd10.prod.outlook.com
 (2603:10b6:805:cf::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9aba4ff-64f7-4b93-30e4-08da01046851
X-MS-TrafficTypeDiagnostic: BL0PR10MB2996:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB2996570D098089928362375689099@BL0PR10MB2996.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tIkYvuYjZQ6J47r6+SXXQat7wivwNydZNdScmJqtQkSie2eYdi6P0ek7kfCB66OKDyydcdG5Meghogvw1DwkpVJhdHFDpcmrXuQ1HOWYH2mQ1c8HSZZZkJrAsQv/pt+6Kh/aLi4sce7dEG1UE7O0bs5MRJG+ybzTgYD5Dr9p5WoOOtSx79xBGbQOlSl4j4eIxazelcQwYYNoW7PbBQg7T1lnhPDY1pKC0GWAgyojJp4+kCZQoZiTz1b9iKMYsonyYFlkSTM0hXBv0/dSQnDgdlNhVC/r0bj9CBc9mDLgto7PJY0q4MAipEf/I/dBybMC4Pfxe8X4JZYb4quqRAepRHyKrAN5SE3nQ5a2yl1gsfzakqSaVfJiBUMI/ue4YYIyXhAXcnZs9LMPWla9kWZ13zCEtD1uH8BhIPfwZoFfrqK438jyjnmyRmYkPvX9pt4i56PBCd+Rt2YQSAhDtfKB+VxH4pQAboRVH1k0w/ZLVp6/9BbZwOhh8P9DYgEn28mlGKM+3iccwmKoLUf6a/beYYV/pHOSvLrj9XaxboK+3F2rELazJr4/lM8Mp0NlCNumGJIX5i0cjpXxz3hnAX8lkCYycrdX1DO+h4OUyqlsR5+gVkpeKFEHhnY7p7iO5gQJDEMTwt/REtINGWnTgcmiCD+XOoGaYRdJE4PwVRBUpJ4ydB/wenRjVXVqiEu1xWR/mw2/WQg11IjtHbXXEQ0wrw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3006.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(2906002)(52116002)(508600001)(6916009)(316002)(6666004)(5660300002)(6506007)(83380400001)(86362001)(8936002)(6512007)(53546011)(54906003)(38100700002)(38350700002)(6486002)(8676002)(66556008)(4326008)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?JH3XsmRAQez4Fe1F5c574ha+0aCqpQrujgBZHYFKfjDm2Hd+Vj7h68k/X2?=
 =?iso-8859-1?Q?k3wG5EDLgG53dGpd52GsEL/6LCllj8q5bT88jKYz2FhKkydE0pZpdTVTn0?=
 =?iso-8859-1?Q?WIyQ1Qv+qUwGhkd5JTEePlveDpshwLxo9AcA4PCRRIwHmV+oMrDYxo72Au?=
 =?iso-8859-1?Q?7Ut/JrhJmf7nsyrbMpYLxz3fGNf8cC+Jw7J6Mdq4L4T9t21Sk87r312F++?=
 =?iso-8859-1?Q?g9hA9VHofyeavfM6/5t7uagOfbGMpJMQI2+/eBcBAGDihmyLfJQhi3TVRK?=
 =?iso-8859-1?Q?arpPCfgmd4WT6n9O8Yp8xqg3e96ez/D0oByHZwakW9Gcpc7xWPNIxSBcWk?=
 =?iso-8859-1?Q?IpkHchW9DhpoXXm5EmZGp2tpISyEU3CThI3wUbhhsTwsW4UlbdislfjGCC?=
 =?iso-8859-1?Q?eqJoMZrdMZFsArfxRX/TukDwS2jvJVZtBVTwMMf4vkkYekpQUYW2ADlDJj?=
 =?iso-8859-1?Q?lMCimmDZbCiUEwSw0zWvhSYEd+pAzAZnUhHmCqWtat8j0bEzkkmMpPtmZZ?=
 =?iso-8859-1?Q?ls8JqlA6xWsD9dK1JnWd2exXHdwgQP/PJU/vuY+SlXttUUuASOpYXaZqXY?=
 =?iso-8859-1?Q?IBN1NADpcUVZLI/Re+1Hd9nErdc1ACEh4RKwefBDaCzomE+1KkscSrqqte?=
 =?iso-8859-1?Q?AI/z5qY9BD03qLzOw+fmwQvKmFva2+TdBD0S2DhUdOBrkxOVT1uRz0al3m?=
 =?iso-8859-1?Q?jQABHpD/ZwpfBqqg1UwzPDfcMkvaH+tMOkrbgOc9w+5CHI5MItl3sGEAF4?=
 =?iso-8859-1?Q?ZY3VZfRlpzugYq1c7ooxSIx0+ok5ily7DQRVgfTOtjU/lDwkIm3J8xjs/p?=
 =?iso-8859-1?Q?o8jPZPls7Y1zmCj16PROTGquR1ZZVDSUJZH5TkyqFjyO1CUht+d4QiaffT?=
 =?iso-8859-1?Q?PdW5pv0oaNQOz2kQQZwyr18gcvsoSNX1QuOm+fHwwWoYs5t4yrKCxJ/ET1?=
 =?iso-8859-1?Q?ESIn0Gz4Sz5XQYBZ+ctmK7fal4NcX9rG3Ga3UGw7HCTc9bRgFsYAuc+ek9?=
 =?iso-8859-1?Q?J3lbB7UvON9JtmCB9sKCSn342ZSKfxJF6dsjLbV71lZZus4vY16vwvk2+V?=
 =?iso-8859-1?Q?Vbb9ilsjL21Irf4PapCEiRxnI3jo9hp4y07EbqpW0IjDFbZ9FDUmSfFLVq?=
 =?iso-8859-1?Q?t7I70mIIlsysM3/uw9bWeaxJMPx4gjH4g44m85NXVLzBUvjAkOnB/hbw+p?=
 =?iso-8859-1?Q?9571U33MRYLiP4PSm9E1lG2PmCeo4Qa7OhuHKQ1hmYRLWfI9vIOKISjqzJ?=
 =?iso-8859-1?Q?T/ZMwfzkV4Put+vCH6Ymq/W4ydVDabW5bACA/ebhI1V7mxfr13578WLx4O?=
 =?iso-8859-1?Q?Kh3gNEnwQJ66Z8jWwyfdSCaawT1scGKAGnJ3C4jgBgTZS2qv6FRio1ZFT+?=
 =?iso-8859-1?Q?7luRgx6pvFSqM+bm1xfAm2YH03+NZJQGXmrykNGKkwa3eYdED/LWXX+5r/?=
 =?iso-8859-1?Q?qoKSpRjfxhtVjt2nf2axN/BTXRRlcVR/SBl3Zs+jacmm5FUXtGoj7xO/NR?=
 =?iso-8859-1?Q?zeQ8Juh8dy1wwRRsHKDOnrc4VmuDv6FTj2ovICgfmvcmvKXQFLGIVWhZ5u?=
 =?iso-8859-1?Q?RuTgHViw05F6XrxzPfcWvVPcySo3b6PF7n4FHyosgV1eD+8tJJnX7pbcFb?=
 =?iso-8859-1?Q?13C6j3fC4TEly1ulxai53XGooy+UYOKk2AYvjnhERCqvNEy9tHLY+fhAwS?=
 =?iso-8859-1?Q?n4L+8QDh5bfaKUVnEJQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9aba4ff-64f7-4b93-30e4-08da01046851
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3006.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 13:06:06.9713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+sm8FnF1hDYlRFBJL9gD2W1vSKB84fVGAw4kGMkToBYtFAapM02HFq62XzVskBDvMmAfje38LhnOVz3p0GrYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2996
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10279 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203080069
X-Proofpoint-ORIG-GUID: mFGNdE0amdSGzz_rxlHwdKJZDhxZZYjy
X-Proofpoint-GUID: mFGNdE0amdSGzz_rxlHwdKJZDhxZZYjy

On Tue, Mar 08, 2022 at 12:44:54PM +0000, Andrew Cooper wrote:
> On 08/03/2022 10:29, Bjoern Doebel wrote:
> > @@ -104,18 +122,34 @@ void noinline arch_livepatch_revive(void)
> >  
> >  int arch_livepatch_verify_func(const struct livepatch_func *func)
> >  {
> > +    BUILD_BUG_ON(sizeof(struct x86_livepatch_meta) != LIVEPATCH_OPAQUE_SIZE);
> > +
> >      /* If NOPing.. */
> >      if ( !func->new_addr )
> >      {
> >          /* Only do up to maximum amount we can put in the ->opaque. */
> > -        if ( func->new_size > sizeof(func->opaque) )
> > +        if ( func->new_size > sizeof_field(struct x86_livepatch_meta,
> > +                                           instruction) )
> >              return -EOPNOTSUPP;
> >  
> >          if ( func->old_size < func->new_size )
> >              return -EINVAL;
> >      }
> > -    else if ( func->old_size < ARCH_PATCH_INSN_SIZE )
> > -        return -EINVAL;
> > +    else
> > +    {
> > +        /*
> > +         * Space needed now depends on whether the target function
> > +         * starts with an ENDBR64 instruction.
> > +         */
> > +        uint8_t needed;
> > +
> > +        needed = ARCH_PATCH_INSN_SIZE;
> > +        if ( is_endbr64(func->old_addr) )
> > +            needed += ENDBR64_LEN;
> 
> This won't work for cf_clobber targets, I don't think.  The ENDBR gets
> converted to NOP4 and fails this check, but the altcalls calling
> old_func had their displacements adjusted by +4.
> 
> The is_endbr64() check will fail, and the 5-byte jmp will be written at
> the start of the function, and corrupt the instruction stream for the
> altcall()'d callers.
> 
> Let me write an incremental patch to help.

Please add Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
on the patches.

Thank you
> 
> ~Andrew

