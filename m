Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA39664B45B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 12:42:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460576.718513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53fJ-0005iF-En; Tue, 13 Dec 2022 11:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460576.718513; Tue, 13 Dec 2022 11:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53fJ-0005fr-Bp; Tue, 13 Dec 2022 11:41:41 +0000
Received: by outflank-mailman (input) for mailman id 460576;
 Tue, 13 Dec 2022 11:41:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/kW=4L=oracle.com=daniel.kiper@srs-se1.protection.inumbo.net>)
 id 1p53fH-0005fj-Pl
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 11:41:39 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71b6c71e-7ada-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 12:36:56 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDBddhe011560; Tue, 13 Dec 2022 11:41:32 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mcgw2d5d8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Dec 2022 11:41:32 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2BDBZF6C031776; Tue, 13 Dec 2022 11:41:31 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3mcgj5h5vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Dec 2022 11:41:31 +0000
Received: from BN0PR10MB4822.namprd10.prod.outlook.com (2603:10b6:408:124::13)
 by CH0PR10MB5386.namprd10.prod.outlook.com (2603:10b6:610:dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 11:41:29 +0000
Received: from BN0PR10MB4822.namprd10.prod.outlook.com
 ([fe80::8781:9b5f:7205:b8b7]) by BN0PR10MB4822.namprd10.prod.outlook.com
 ([fe80::8781:9b5f:7205:b8b7%9]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 11:41:29 +0000
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
X-Inumbo-ID: 71b6c71e-7ada-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2022-7-12;
 bh=IiiwiamCcb4dBLyurtu9zcRiozYQjwfAOYRDpKAaKhM=;
 b=j1R5p37ayTK6aJT1rvGcxNpXW4gKerGOGfFpSHiG8RbewCFkjiC5iw17RjdGyyvrO85R
 jtUBhBz1s9cIVBiSsX6FhYTAJyuuf23U/V/xfIjN48w9m6lAfS2EXKDLu7Nwg9a3HsVK
 AcizmxvnVP7J61RexP4Q4XUsmT3n6Rvj5uko6NJA2e+MkpbJw+6cATsSrhMg0Qu8Zjii
 Jrnn6I8vydCie23a8icvEMJFKKsSbI5ExoIVk2DMrEP5FTAUFCWuAfp0mnKsVNXenEsO
 mwfuCRtLWiRKPpxGqSvt5AMyq/vyAVWKi2T0SO0CJabKCRo15IjHGECrgrebAMzjZVKo 6A== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sj1373DqWI6gKFAK4M/Fv1QJiyU1Y8QddQD4jNu9Z9ehxW6uSLi8AMa8Ri2Cxq01zHjqM1imO6qFXHhj9JBE354tJN5tI1lQrsF45tq9xFgOpqneMUhLHMgj6CWKgkgdBC3aqcPz9+aVuf69dgff4flM6GyN2ShOZkb1+VrJ6GrFucZoA++PLHZTjgk6UpVAqx/flyJHf9cIgvlmYb8DgqsneS4VEwoP0cSFkjTvPQK1IFEwLBoYuznrq3DG1bh0ggvADjD4A2DXw1mKATUXPBZos1ao9dPpYOb/z6IPUxlvNro6wSOwotXVVC4w8bJkQZQW02Dl/ACrq7lvonnXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uLSL5o0yzU34w/gGEHsG5WDd52rKFwHfr9/R3xuo4o=;
 b=QitmXza7EJC8V24ZmvxIL0a+wT0m6/LkBf+8rfhPKWSKCc8gNCr9cIr7E05BGr20Eu6pKH2Krw0Rsz/8Bjuklw5TSPskqjjOXPDW0otvZlXGQh4pqojgJaFSqwAHJQRcYVDXhtOy/BoDRriSztLAo66eBUxBIL88IVr2UPmgcuuxnEi957fMVLA2WG2qkxUgrpWOQASKaI9Mo9/mwHeA9ewAEZFrCtS+X22W/glOKjlmBFnSmXrV+8vuH2TbqWykey1kaokB5DYYlzO6guE2tZ3Ju6dl6mIgMou0giY6F3/Kivac6lRxAscSWmCtWZ8oFX9AaV+j7gSKo6Y0tA5czg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uLSL5o0yzU34w/gGEHsG5WDd52rKFwHfr9/R3xuo4o=;
 b=XW4pKHP2Wrodtah89UoyqxYCOtbcJExgUgMK3LickLE7HybX8MuVWszxG5D/1+AQ+NAkn0IZfyCVbOHBPUQbQCARSgWJXU2trBj8j4OJm9R+7Gujy+EbmZDd7AF2Zp/8n3CbWkMNb8FLeYoUF4dOu1FRDEytRwujnZzYIWpkaUk=
Date: Tue, 13 Dec 2022 12:41:22 +0100
From: Daniel Kiper <daniel.kiper@oracle.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, marmarek@invisiblethingslab.com,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/5] multiboot2: parse console= option when setting GOP
 mode
Message-ID: <Y5hk4m7HE6n9Tr9H@tomti.i.net-space.pl>
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-5-roger.pau@citrix.com>
 <8f7e0393-8c0f-a924-7cee-25b9fca6f739@suse.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f7e0393-8c0f-a924-7cee-25b9fca6f739@suse.com>
X-ClientProxiedBy: BE0P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::8) To BN0PR10MB4822.namprd10.prod.outlook.com
 (2603:10b6:408:124::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4822:EE_|CH0PR10MB5386:EE_
X-MS-Office365-Filtering-Correlation-Id: 62971276-ad38-46d4-5355-08dadcfef94c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VwqZLvZ7tTxxBspHhx5TTasbuRIpNuQPJisiPuloz9tFdMTQPexBURtgBNKNm9vnJYd0vPcbU6iz4sgE/f6EfcwNcIFtbsLAtsU6bsC6swr103/gaFMtZ8kZS8+ZP9pDiVKxs8rw0r9ayPES4syCPp1Px7li23SjsifILU8dO9ydurUK98ZVowaSZ3cUTQEpAzxCPuA4IoLxYRand0bIVC35P2pd/txZv160EjBn56hs2jzMhRaLiO4f/R/YjSFc2cAdZDVcut3u9eFwnJqS3P9A+vq1SO103cRlDFirFBb/TjJhQ9fv8A3BMdxW5eTt1jynKdC3ooTAWBdXhQECA6KpfpFB2u63Lk4fBgzWidwqTpFXNOVHJDq6X6PAVPGZWM84TqBMHUH+UGfVEjJGc7bnOHU4O2eCsddvEywQntfd7Z+U5VGRC74CPdY3jJ/92r9G/6S2BUSHHO2E/ItNxgd3i/8HdyNb1M2gnQD8bhhD/rksL6kmhxFbvd0WVdAB8Duh/CmbpzI4GxhFzg8leFru55QFahfyp/0rc3BZpPVAjV4m3/vO90sTeyL9Q8ZPXT8y0WnVgYNgEx1maL/TK56ECHoK99SIvvD2RQpt5W/wGj57VS6M3ZbxAtZdKBcfMLFpSxlInxHtHlR2MmVNQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4822.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(2906002)(44832011)(38100700002)(26005)(8676002)(6512007)(41300700001)(6666004)(66556008)(6506007)(53546011)(9686003)(54906003)(6916009)(316002)(5660300002)(66476007)(4326008)(8936002)(86362001)(6486002)(478600001)(66946007)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?yNI3K/3mTjjfZZpVs+2Mn7LU6jtMoKCJLKWMIKF0Q7WDNGgiQti/IEinK9?=
 =?iso-8859-1?Q?XZ0sPvKO7DmBynfxOiA3Ll5YYQHCdMVtT/RqvrqsePKHVYCysYdL86jz+o?=
 =?iso-8859-1?Q?n/DXQiOb02RQjduKc9PudHhziUjrBukwzUXTBRnLqFVidnOowdZP7gGwBD?=
 =?iso-8859-1?Q?TKBGuaZP+rBTHPX6fC3Pmk198goduG9qVivcqqbUVrlqHFaaxUC2FtYJng?=
 =?iso-8859-1?Q?beBUsWXwk8wQ5slL5/2EmdaKF5CHiK+310JXPPLjwcrjVh5wp4kOCxonBE?=
 =?iso-8859-1?Q?V5kiGFizQKKNu8wGI1/lpUj8CmxzEbxsMoEJfoCdP9nAR8DJQby8JqQZdz?=
 =?iso-8859-1?Q?AGqitr4/9j1KwhbFOY38OeJjYpOaUBTEOj+s76gbFeZt3oznHwsxGvE0Dq?=
 =?iso-8859-1?Q?tEybpL0Z/pPSPyCcWnkAb12FuTJio9w8X9WIL5N8iXp54kSVKdd1M6kB7M?=
 =?iso-8859-1?Q?S1z6KEVHazT97xP3mNtMLG//Judd9ntjX07vpp4ISLNsDcU3fiVGQEvazp?=
 =?iso-8859-1?Q?kPz146njlSH0puYZfSzdTiBLcGEpUG6vusCmvBY7KZtANO3V1MlMupkShd?=
 =?iso-8859-1?Q?knPpzOfIJ74cX9uaTv6QqCfGqfN+4H8V+S+9cACYVITMNkv9WHNJ6lMvSC?=
 =?iso-8859-1?Q?Kbz6B9XZCrRU/H3dXceg7CX6NgpYJ1Heymomk10p/8SlJAQ7I9tMcQuLoS?=
 =?iso-8859-1?Q?CQ2JsDqcEbETIeuWTavrCGN2lOnUjuOx1s866GJgjENVC2coOGkwE3dv8E?=
 =?iso-8859-1?Q?GPCMw9tSFWWXOt/L5ngZZZP8zxquk3+PF5qmt25ZVKPeWd7ArSuNo2OivX?=
 =?iso-8859-1?Q?cy92mxzixr8I+ra2R0ckHCbe1PJTnuJ/HVjpssUaSRc7Ijkhb110nwgc50?=
 =?iso-8859-1?Q?aluZHGzw9sBmVTvte3mQDlRVJeQMHICkz6RCzKKbLbP+nHCtlTJSrnjKs9?=
 =?iso-8859-1?Q?nvyjKGODJk0rlNNBM4f1wig/LuygX6Xi7DiJPSD7ojZPffdXDiCaDzeujb?=
 =?iso-8859-1?Q?+tRMhg0dEIEG0GPphENm0s8sEcXJ7n4JVt3hXgXK7pqxEnp264U8E/QP9z?=
 =?iso-8859-1?Q?510n29SznYCQoGdFw1RgUR6un0Bfelq2TIh/GaCzObDEQxRic2Xnf1cg1m?=
 =?iso-8859-1?Q?JgUfB62jCp1/JI1Gr/bZ78LyOo5sBhXvxARqBTyDa1lkYJzAuwQMvj209r?=
 =?iso-8859-1?Q?+P0g9i98UUxmazkkgG1NCXloKvQZeMozVkN7smzeWtsVnMpTFLv/lCvYoI?=
 =?iso-8859-1?Q?04CUkJVKY4BC0xp0yntwc0tjDa4M2NEQgKgJNXEDdGl9uDSg/d71oAmHkf?=
 =?iso-8859-1?Q?/UyBauGKD9wg7j3tKgPY6bab1ky2Ca1ngU5N6Z9rP7wiAJXPBIYIREf94G?=
 =?iso-8859-1?Q?9neoukeDvE9oW0rJ7Gr2oT4kLWoaObPwLu3eWAGbLjp1S46h7ttytO/s7i?=
 =?iso-8859-1?Q?uFZ6e6ITwukF4QZVIa0iGxXCTg3x9T7r6QFyCETxLYY2r4eoQ9LuC5x4AW?=
 =?iso-8859-1?Q?MR5Jct00ygHoA8EOAtdjEZXu39dO1Rwlu1gzCkzXs2NqGHIkYAdr+Dqgbv?=
 =?iso-8859-1?Q?+tHn6UrwjHiFtxZ4IUXBPhn695Zn46Z0/GpJhNSADH6ZrvbytOxXVGfsZg?=
 =?iso-8859-1?Q?QC5B6kF42INZMQNh/aiJDmTwlyvRlB9j295uYgLjPHU3vMFwbbF1qdAQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62971276-ad38-46d4-5355-08dadcfef94c
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB4822.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 11:41:29.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNDvOkEWm6xN+EoQUDfAXHS5524Q7SqI+gQIP0geHnBNkAfQRYBmG/rmfIPmjqe9E4rpxzmkBEs2btV8h3ssUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5386
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=924 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130103
X-Proofpoint-ORIG-GUID: BEtBnZhvN8Qcx1puRV4edxexwauOGRwu
X-Proofpoint-GUID: BEtBnZhvN8Qcx1puRV4edxexwauOGRwu

Sorry for late reply...

On Mon, Dec 05, 2022 at 04:10:28PM +0100, Jan Beulich wrote:
> On 23.11.2022 16:45, Roger Pau Monne wrote:
> > Only set the GOP mode if vga is selected in the console option,
> > otherwise just fetch the information from the current mode in order to
> > make it available to dom0.
> >
> > Introduce support for passing the command line to the efi_multiboot2()
> > helper, and parse the console= option if present.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I'm unsure why the parsing of the multiboot2 tags is done in assembly,
> > it could very well be done in efi_multiboot2() in C, but I don't want
> > to switch that code now.
>
> I guess that's mainly mirroring the non-EFI boot path, where the amount
> of work needed to eventually enter C land is quite a bit larger?
> Anything beyond that Daniel may want to point out.

Yeah, you are right, its mainly mirroring the non-EFI boot path and it
evolved from that code. However, if you want to move it to C go for it...

Daniel

