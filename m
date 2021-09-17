Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D584140FED8
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 19:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189655.339480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRI0u-0005cz-EZ; Fri, 17 Sep 2021 17:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189655.339480; Fri, 17 Sep 2021 17:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRI0u-0005af-A0; Fri, 17 Sep 2021 17:51:04 +0000
Received: by outflank-mailman (input) for mailman id 189655;
 Fri, 17 Sep 2021 17:51:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ysil=OH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mRI0s-0005aZ-PW
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 17:51:02 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1855a3c4-e705-4135-bf73-d2c82e1bab8c;
 Fri, 17 Sep 2021 17:51:00 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18HFwp4f015158; 
 Fri, 17 Sep 2021 17:50:59 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b4vvy0qxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Sep 2021 17:50:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18HHUaZO049488;
 Fri, 17 Sep 2021 17:50:58 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by aserp3020.oracle.com with ESMTP id 3b0m9b5sex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Sep 2021 17:50:58 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4318.namprd10.prod.outlook.com (2603:10b6:208:1d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 17:50:56 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f%7]) with mapi id 15.20.4523.018; Fri, 17 Sep 2021
 17:50:56 +0000
Received: from [10.74.115.10] (138.3.201.10) by
 BL1PR13CA0201.namprd13.prod.outlook.com (2603:10b6:208:2be::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6 via Frontend
 Transport; Fri, 17 Sep 2021 17:50:56 +0000
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
X-Inumbo-ID: 1855a3c4-e705-4135-bf73-d2c82e1bab8c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=8RzBI9rQ7gL3OCEC1uwYXpUxnhWvDlTVcndSDMLtFQo=;
 b=IlUXXzcYnvSia0ltzINuloUhOTzXcpbnRjvo3tEqZaD2xAadSUxglIw3R5tw+O6TzuuJ
 IQ9Utm6zgMvCmBrXRfrL9bQ2TSQDqDUO9uMn/jTypB5lYElsTRSBk735Q/ql0QfqUEby
 5vCmT+B84bi1ukj2rLHBKSqYCflXKSqVktul7AlQXT3YmCnrPAPNTUACutNtLWpP3HQr
 TrvIB6VOwW4B1MxZvr5SDCSejRIcqz3Ux/pWrNduKVsUmv13NMO9C4kFXllCChne06pf
 2rLXwivxcex1w0iPi3VP05DrLbmltiyUE8G7KJswYs2X3S07RP2NMP/So4kzzl8jjTNH iQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=8RzBI9rQ7gL3OCEC1uwYXpUxnhWvDlTVcndSDMLtFQo=;
 b=jo48fvV20lVq/Kd9VbWSX7CfPFOjNt+A6h96687kIu8JNgG/lh5QWHgxjOFVjzvCAsuL
 pX6bWdweK65ccmJdLEfXWapvuTkhPp0s3UIYslkBmKgJlutTcTdvHmLOUwYvpRchB0eX
 8NZ76ckRMsJp9hPMfB2hAD1gOBsreOXdAO+tV/FGUw0l/iUVc+A1dt58BnXmWCiYCTeS
 sG8k7VGcg355PCYdqzOMkU0mncNWbvWlaN1GleiKqtuUNgQ2VmE2lLqwrnJJYt5fZAXx
 qAph1RILkn5dMZ4YS8jgJufd+xZHNNwRM1IQfhaNxohbojpiMfR+TWEz6ffgYOIahZJi xg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0qFHVYgg0pVljjE4GeYun+vqQW6/uIFrecfatxk2fKczPSad21cqo1EvP2tzWny7D2W6pMagRG/UW5tJZKVVxfaaLIjmrXU/E3vM9i6QTOWCjmUfdrYKTBn6BAUUqHkdfYXlDuZrrQLtE9suwCbQEwPaShpWEL5nnmApXbxS17ehYJOkIVGCpR3d6jI5pcINldPp4uO54R/zH9h6c0mDs0DxFDJDqlVLUGG4FoL6WRjHs7BUB+LLEF6dyZ33cjEAanlA9GqaImAdBGoFbV73akhwa4bX7BPFwHK4gl1xM4faW8/oRRSZa3FYbpmarhG51EbB6e/+JDz3L6nv+IrKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8RzBI9rQ7gL3OCEC1uwYXpUxnhWvDlTVcndSDMLtFQo=;
 b=kCSbPAQHPN8LwOik1/b9WV4ZDn5o2m4m2Ahb7b9coiwD4z8vTsNfyZOzjja21RGsJ8svjleIu5hkvlHfMmBHpOQe0CVLpGITqJ5SeZ8MbfYZr0r3xP4kjTU/wSOR1zRglaWpWPXt0SfZqssnGqUWB+3e1ABxzTpOZua9E6OecxaG97tg6y914h9JPQHWo3Os7rxrH0fnwA/vofPIn5jWp/A2O8mwkfyCCSQqELDUsxdb0j0644xNJe9nzmS2ywPWLAB/Ikggp3nXTNMSVqALYm8ZsvFKQwXdpFqD03Qc1x3ZsozOvOqe0hrBOYHVIoVx00XlCmN1bGb1H+wTz1EMjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RzBI9rQ7gL3OCEC1uwYXpUxnhWvDlTVcndSDMLtFQo=;
 b=AJl38nw7E5m04fncPbBD2dHedShEHcSJ9oGxuCIWw3jYTtAzsF2UOhB2c56BG+yzh2oyW+Dh9UpL+jL3Pdqz91JxOjRQGGjrnmLDB+Gr6CDm1FGcJF66v6MiFWCX779cU4rczSVvMVoP4pwn36eJbRjKqrFZRco7/Zfp4pAGtTA=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH] xen/x86: fix PV trap handling on secondary processors
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <34898e9c-5883-a978-98ee-b81b22d8caed@suse.com>
 <823f4ef4-f9e5-68cb-d6e9-d079483c1e21@oracle.com>
 <0afce6e8-3c8a-e5ae-cd54-0fd598276506@suse.com>
 <62ccf5b7-b903-e604-d113-67c7633278cd@suse.com>
 <2c4549c8-bdeb-3584-95c4-7076b7cf79bb@suse.com>
 <35835650-bbbb-7dbd-061b-693f39f9453e@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <1bdda8a5-4748-6791-58a9-b1e342281b01@oracle.com>
Date: Fri, 17 Sep 2021 13:50:54 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <35835650-bbbb-7dbd-061b-693f39f9453e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BL1PR13CA0201.namprd13.prod.outlook.com
 (2603:10b6:208:2be::26) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20811149-4c5f-4209-bb56-08d97a03b395
X-MS-TrafficTypeDiagnostic: MN2PR10MB4318:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB431811C69CD925E62A7FA54F8ADD9@MN2PR10MB4318.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CmHu0Td6lzWtcHJmxK4ZS6uXRwJyMP5RAabkbn4bDmb/IrJtPeq4Z6A7bReI7iFQqeKDMxntTUZh99sHy+/nOHqfZPXOq0c8wcyJ4xUVyNINqRNviDvdPLxN5lzJNsIFnmHmD//7oNxFPVoJMfnGCQKmNfOq4AFTqJXQzkzK9Y4Vh0Inlw8MUfhKpcdH0KOYhCQC+MwkL8oK2poBBlgn5aOsBPPSovH37e7BWZMmc5hh7f0pJ84ECAeKoTMAS9DRAjDE0cncgt2cN5EN0WSIpoNuplow7cIaYpVERb+zf0OmcEs1+VLlf8NR6IWLJS71ZXW0AzZZ9kHO/0UIl/GjouVqt8QtGq7Q07LmG3nSmp5n3XGWV+WCH2sBpgXErP1jB0cxNbccCGpEuwf946IgR890xsmlnlAR8TjsjM5gPaKV0G44wx/GdqK551QlUYhGLb3UItZLxJjr1m1SWrtfhZNAtB/E8FxbNKh4++Z4udEoJITC5QVAWaroCCc8fvlHjFIg1jMX11PYqXjmxvtPFbwWFb6jARhm6oJleq8sWJCtMgDW51uFMGN1QZyDy9PxsiazaWU6QVGqi43HfMfvoCJpKo9guJ5TMJ4QW42gO3+6um4PsW7uZMY1P7OXzUoyZpAQQeHHI3i1H+9IRMfYktB1xqmGak+B1w1unFD7dS9+KRCjjwfGrBPrh52HDaof7RuVtXphdct8DSJyRp9BKgsnawQezE8GminhNf9x+v+b83OFOKCJA9g7ajWbN9Vl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(346002)(136003)(39860400002)(31696002)(478600001)(4326008)(2906002)(186003)(86362001)(6486002)(44832011)(38100700002)(316002)(66476007)(54906003)(53546011)(83380400001)(16576012)(36756003)(66556008)(26005)(5660300002)(2616005)(8936002)(956004)(8676002)(31686004)(66946007)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dGtEbXZDanhHUTlFWHBwYktiN3hRUkZ1a1VHWUVnM2djVjF3ZEZoRVMyNDlV?=
 =?utf-8?B?a1JpcTYrd2wwajRDMEUzY2xZeXN5N011R2NoL3JBRXNVMkNGYnBmN2c4YXIx?=
 =?utf-8?B?WitmSGFVK0pLZ2NkN1p2Z2JNWVQzbzg0ZGpVYVd1MlA1TmhoWVN5L1B2U1J2?=
 =?utf-8?B?eUVPSUl0S3NRbmNwckhTcmRjd0VxVVdEVXprZnVHaUxEUDc4RnJkeUkwaGlt?=
 =?utf-8?B?ZmJFQVJlK2JEMlpvSkxiM2Fzd2dHemt0VHRTMzFTRU4rTU5JcHQrNTdvMzA4?=
 =?utf-8?B?NENidjN5eFBZVWxtenBkWk9Rc1B3RU1DTm1ocDhUSGNQUWhWSWpVNFZybkVv?=
 =?utf-8?B?aS80aW5zMVNkRDBGT2FtLzk3L0Zsa2RHSnVEQXNxWnZDWkVmUEtReUFMd3RU?=
 =?utf-8?B?ZWVkbXZHTFgvY05xT254M2NPQlBVSmNYa0czcnBiSEJPNlNjY2w3R1JlOVd6?=
 =?utf-8?B?N2lyVVBPQzIxS1pwUGdNTGpGc2R2VFZVOUlxUko4SkF4N1I0eDRPdkdOYWtG?=
 =?utf-8?B?bG9vSmlyc1Z1MFJucmV6ZnViWEcvb0NoUGxVT0k1MEMxcTE1UVd4MWQyQ0Nt?=
 =?utf-8?B?clFtdkdhMXN4TGtJUVJjZlFodjhCa05USVl5Q2N5ZjF1c2prSlJtc1FPSFY0?=
 =?utf-8?B?bUJYZ2x0bG5ZdVVES2dVbFRwVTN0NmRKMFBaTEZTTHp3NFZHVnBlVjlPS1Zr?=
 =?utf-8?B?WStzVWszRHFVMVRJdXl4bGxZOFVSblVhREtMUkxOckJ0SGl0TjlpN0cwaXpV?=
 =?utf-8?B?SU45eld0aXA1L3lRYmRMcjNLdDRldEpUT2o1ZGhXMitZOUVsK0lMMFAvNVBl?=
 =?utf-8?B?U3l4SytzaDNxaDQwaHFQejFpMHVXMkRSSGlJenk3TjFBODFiSVhvVWFwUXhS?=
 =?utf-8?B?QUM4NTIzUHIrenNuZWcvQW5MZHoyYWFGTm11MDUyZXh4V1lJdVppRGFrajVT?=
 =?utf-8?B?MFBFL21GYzFwOHQ3RUo3SHIxRGRUd01VVUtFdFB0Sk9USWUyVUpsZnh5dFp0?=
 =?utf-8?B?S0tYQmh2Qm5qakE5V1lpS0FGSGIxa2JTc2FhNytINWZ2ZkhnallGVHVtUkta?=
 =?utf-8?B?M0k3VnBZWTd4M0p2dk9KVGM5anVqSW1KdTUzaTgzSUFxbjhxVGxWZVJablAz?=
 =?utf-8?B?MzV3aEFqcElJM3RHVE5EY1BUaGlxSkU0YkhSdC95Y0cybkpoSXp0RW1OZnZu?=
 =?utf-8?B?SnU1SXA0bnpnZ3k3YldGNHYzY2tWK0tRVkpjWnNnQmZlU0ZLVGZzZytHS1dn?=
 =?utf-8?B?bUdnb0d3L1pFTlBrRHZTdFVRY0J3M2d6ejVDaU9QMWU4WktsdlZoa1FsNTdQ?=
 =?utf-8?B?WG5zMU94WWxqeGFHbENKdU4wU1Z5TGtwVmZjYmxIdGhUa1NNejFrRDd3R1hS?=
 =?utf-8?B?VVRHR1VZS3gxZ1p4bVllSkdnK3U1cGlLbllVVHJYS3VNOW5OUXlwMjFjbGRo?=
 =?utf-8?B?b0dVT29ZeFc4ajg5ZkUvczFwcFB4b2k5R3FiRENCejB3NDJUd2N0SVhOdWwz?=
 =?utf-8?B?ZEJXdW1SdDNvaWM5dU1IWWkvSlZibnFoc3M3WERnNkNJSmFQQUZDYzFGbkhW?=
 =?utf-8?B?ZUhpK0YvYnpVbzJ0aGQ5cm1NYk96SFZubzBsQlhwTHBhcEtDbnJjSHExcDh6?=
 =?utf-8?B?MXRMK2ZndUh5cnBvb01WeGx5WmZyZjRTeVYxZVdHRVZVNFpOTjNSR3Nnb1ZO?=
 =?utf-8?B?UE1EdzBaZHFQQk50YzlXcDV0NHJWbk1hcXErZ2l1Q0RqcDVFc2NQTXE3MVFC?=
 =?utf-8?Q?HzJGQwmsTUN02aqc/gM/dHEKTotHCYgrQF/HDr2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20811149-4c5f-4209-bb56-08d97a03b395
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 17:50:56.7584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1M7lCaYKdya8lcRjxAFU/MwWD+sIZw9IBG3tBSWqycq9JoSh4gknGQZ86xLw3IUBuHM8VEnqnBSNJ/5oOyUCkz7/KhFjeaTVpZIh1juUk6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4318
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10110 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109170108
X-Proofpoint-GUID: qz4rghgpVjQRIrD0YimMuXXzC1OH82TJ
X-Proofpoint-ORIG-GUID: qz4rghgpVjQRIrD0YimMuXXzC1OH82TJ


On 9/17/21 3:24 AM, Juergen Gross wrote:
> On 17.09.21 08:50, Jan Beulich wrote:
>> On 17.09.2021 08:47, Juergen Gross wrote:
>>> On 17.09.21 08:40, Jan Beulich wrote:
>>>> On 17.09.2021 03:34, Boris Ostrovsky wrote:
>>>>>
>>>>> On 9/16/21 11:04 AM, Jan Beulich wrote:
>>>>>>    {
>>>>>>        const struct desc_ptr *desc = this_cpu_ptr(&idt_desc);
>>>>>> +    unsigned i, count = (desc->size + 1) / sizeof(gate_desc);
>>>>>>    -    xen_convert_trap_info(desc, traps);
>>>>>
>>>>>
>>>>> Can you instead add a boolean parameter to xen_convert_trap_info() to indicate whether to skip empty entries? That will avoid (almost) duplicating the code.
>>>>
>>>> I can, sure, but I specifically didn't, as the result is going to be less
>>>> readable imo. Instead I was considering to fold xen_convert_trap_info()
>>>> into its only remaining caller. Yet if you're convinced adding the
>>>> parameter is the way to do, I will go that route. But please confirm.


Yes, that would be my preference. No preference on where to set the sentinel.


Thanks.

-boris


>>>
>>> I don't think the result will be very hard to read. All you need is the
>>> new parameter and extending the if statement in xen_convert_trap_info()
>>> to increment out always if no entry is to be skipped.
>>
>> And skip writing the sentinel.
>
> Maybe it would be even better then to let xen_convert_trap_info() return
> the number of entries written and to write the sentinel in
> xen_load_idt() instead, as this is the only place where it is needed.
>
>
> Juergen

