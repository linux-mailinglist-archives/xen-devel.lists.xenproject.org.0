Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FC743CA76
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 15:19:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216938.376734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfiqH-0003vr-Uc; Wed, 27 Oct 2021 13:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216938.376734; Wed, 27 Oct 2021 13:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfiqH-0003t7-Qs; Wed, 27 Oct 2021 13:19:45 +0000
Received: by outflank-mailman (input) for mailman id 216938;
 Wed, 27 Oct 2021 13:19:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jCJ=PP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mfiqG-0003sy-3X
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 13:19:44 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bb01231-c11b-4fc1-b95f-c741fe7ebdbe;
 Wed, 27 Oct 2021 13:19:42 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RCThJi016751; 
 Wed, 27 Oct 2021 13:19:31 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fyjr2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 13:19:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RDBZvB152600;
 Wed, 27 Oct 2021 13:19:30 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by aserp3020.oracle.com with ESMTP id 3bx4gcpfa5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 13:19:30 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4271.namprd10.prod.outlook.com (2603:10b6:208:199::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 13:19:28 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 13:19:28 +0000
Received: from [10.74.107.92] (138.3.200.28) by
 SN7P222CA0019.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Wed, 27 Oct 2021 13:19:26 +0000
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
X-Inumbo-ID: 1bb01231-c11b-4fc1-b95f-c741fe7ebdbe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=jCTLYwXV72ZLYxKASLK1rgVCwYnEc5zUYfHCCwskxkc=;
 b=NiecBS1TAnCZpFkBy5NP9ySagRcqARBYvsAipK+DBR3PeHozh1CTABbs+zhbbCQekciw
 DywrGd8e9HJXK6KgCnHHSqLucYW/6rn2B7znkBAeKn0gZeZlWDRJ0arHuafDNok5vz1P
 T+CqophffiXZzQV4BzZUjBAJ2KRk961zrivSVOtOILEO2WqeGCSCKxpSBsX0wjrIjmY7
 2zSD7OkuykUmBeBnAoVzj+vuITahgfPVO8M48Hy4z2t1+BomhbNiKa1e8sVz4dTdzTzS
 Hk3GUO7keKmFTP+ODq1+Gs5Fzhaf62Z1w7SeFZ4z6HjSUP/Zs9u7XQu9YuuCntr0n4RD HQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOJZ1Rexiu/qd2InrL50yxkQUG1dwEZa2Gzha6cZcDCGudhVqDP7IxsWJNziXzKGbSiDhJjFhBq0oMkwaXDSYGOkEAeyjLJbv/3wKPcJhYf6tFj8bF0Kux8t1PFEdlGTWwHOTqbEaH8iAphj5hhJ079oGLm/2L2fYHngQgE4t8HjTb18XVR5xSsnes2wuolkjarErIHpdPihKzdmTHJVTY+tT/tKqRWd90hE2ArZRaCyEmFJzkyi4Elo6oZuYMHpBy/+NCCmM/tjFDnYuF1//0DmdmPb9zHg9o/h3xRe9v5i3NVFZrt9WTkPZcju/zz3fsxiPf1ne8cgLU7AmK2a6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCTLYwXV72ZLYxKASLK1rgVCwYnEc5zUYfHCCwskxkc=;
 b=YZsnI0xBMwvh6TsKlou5QGF4pb0qGRViZ0UKDce1g5SFww6+gzqzA3HBNxEGHfV6ucCLroWr0mSf1ID/nnPuIb2D7kOr01ot7syo3+cbSGn6zn9Ut/FouGGAtQX1Aa2BnfSfP17qWCJNjPB/t2Rz9q0jLvVvFmL4kALIAqS5Bupe3ECelcGGeTG1CQgJvzCbyfkQBW/lEru/zj78gyWMCsk2xnbB0FVVN6mIHYtsv/hOCRnJVYXg8JsG+6XUOw0bMVm3yfYu8kRLDYKYnVCiDWnv9N/ujrVUOr3ItUyZusFF4nz+bXtSmbyCvqiTRvOeGpG8/BLLKX7elrTXXt0fBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCTLYwXV72ZLYxKASLK1rgVCwYnEc5zUYfHCCwskxkc=;
 b=PATfkNBC+KJkJPcUukrGvLWOUqNKQtv035pYT30CFy3PUx+WjT1miThfKXLSK0QHoizvkuyROhSjX6idjPHtZlyagWs4CSqeFLbd8tIqS/qp3ulsv2GOdKuImMSqKyJDV4Cn4dsFyydDBFkKNvkEO5LzGZHyM09jOi4P3n6jmqI=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <9ad3538d-e4c8-2b74-e7b7-c409af0c3eeb@oracle.com>
Date: Wed, 27 Oct 2021 09:19:23 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] x86/xen: Remove redundant irq_enter/exit() invocations
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <877deicqqy.ffs@tglx>
 <bc88bc9c-d5bb-d9a2-0d48-c8703a613c59@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <bc88bc9c-d5bb-d9a2-0d48-c8703a613c59@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::13) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 383faa27-8829-458d-2eca-08d9994c674f
X-MS-TrafficTypeDiagnostic: MN2PR10MB4271:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB427119097C230D131FE2A36A8A859@MN2PR10MB4271.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zqGmL6Ux2LWA4SG4SNdjK+zE3BtGLsqCCTsinjhxR4cGhv1rP3nAEKuO0A6PAvXDyYB9MhMUKYXD4KbEgzLH0VTxineD1RWrZufeYuNvKOU4IP+yx4hOVzIueA6Hj7AC9b4M7sjqkn+8SYQJfLUPiT07aIZ4W4+6gIRLG5afiE61nvg2zvT7iv5JZ5fP+PF89O1/0ZbKvO6xkvrA7auW+9qkzKSRsNPiYkiJ9r3KBz0JDOXzQxQZ27bsaVED0lclIgrrEvYDFFsGPHEQDoswfF7MljFpePG3Bam5+4SJZUA+erpjATwJVmH7a3B7B56RBNFAUvDWlDPYQhqNUUrM8G5cRkWVUFBmOchq+BTQSut6WznoJ4XOoL2ZHKFmgy4ZeH5V//zQgSjsIFoHYEt2n+V4LfX/p7r5qRWpMUfQW9gO/PFHPas9hR7Laoaxo8NHAk0sgsxpP+7fwBGR1exwREQ/ay/pfFNBlj1bAx1WZQXt2q6DiW6oSOi4dL/NTVCm0mr/wLYV0k3JnJe87BOTQtKGgvQnNjkOTfvwe64/EqROjrVlb7wf0+WKqz5zoYzz0iHY+wFm8i++HBmgjgxHJVycpkeCGFUeemVbasqqcS5YO5hG7hf4AyVnECy/hfD1FMDSvqehFkyUQh0jHPLYp7ZzkEVtlKhAONkJQTtD90kYcJtgw0HthbaGgIu9hMg3NFrWctX4zpERlVn3rZEuYoDDF5en8tFvugjqxdzWvuUG7FYTbqBRREa6SSTKrQ8h
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(44832011)(26005)(66946007)(6486002)(66476007)(38100700002)(6666004)(66556008)(8676002)(508600001)(2616005)(956004)(186003)(31686004)(16576012)(31696002)(53546011)(36756003)(8936002)(110136005)(2906002)(316002)(5660300002)(4326008)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OVo5MEM3Mzh4SmdlYTV1ZDZlNy95N3JBTURxcFBlcko3UzdYWFhRQVpJK05v?=
 =?utf-8?B?WEJ0V24zRjJqM0grQkQ2VjJlWkdsMGdya3dqTGtUSE5EL3oxTEJsR0Jtazd0?=
 =?utf-8?B?aW5tQ3UyQThoUGJiMXEwcVh0NG1PVm4xSDVSbUZtTTdiRU03R2dWK3QrcXJj?=
 =?utf-8?B?VXdxV3ZiR2NHdEl1eWRHSmRvRm1IUFR3ZXMwU1doYVdhYW1OY096LzhoRm0v?=
 =?utf-8?B?QWhCMExjRmVQQ3JpZW02TzVvRUlKYTE1MWU2b1E2aHBnK3pMeGtYL2lGMWZs?=
 =?utf-8?B?b0ZnTE0zWGpUUEd2TXpUUTRRYUt1TTVTWkgrOE1CQ2ZTYUVHUHFSZjN0NVVC?=
 =?utf-8?B?YmRPOGF5WDNyOXhMVnRnSWJ3UE5iR3prdlBremUzY0FUMjZaWlBCMjVSN3pq?=
 =?utf-8?B?QUpsY1dab1VVeUdXNlZhMW5sS3YvTEc5ZkxDUk4yQW11RzJuS2dBdFFlblEz?=
 =?utf-8?B?bUhvMldnVytZa3NpYTJvUlUreUhYVUZ2VzJINGRzU2dObzQxOTVGc2JSeWxO?=
 =?utf-8?B?TWxhOUNhekw4clkzSlVPZTZtY0NSM1FGWDhvSGZhUTNQMmkzb1A3NFkxVEFn?=
 =?utf-8?B?UVBnbHBlMGtqaVdNa3ZSbndJT05pa2dIcHBBeDdheHFjN2lQaHpVeG5aTGM1?=
 =?utf-8?B?NUtGVmpDUkdPclVYeXd3YzY2VHNqMDJ1Q3paOUJGalUzWE9mcCt0STZqMnlB?=
 =?utf-8?B?aU5aS2QrTE1hYmhjOXMrbXZPNDhUREhhaUpqYVpXYW1UM0pMbUw0eWxKQU9r?=
 =?utf-8?B?UHA5c043TkRNTXowSG5pdmxLdmxCTUY2VDdjVGZGNk5Kem4waUxnUDM3eHJi?=
 =?utf-8?B?dTlZbHMra1JlNElVQXR4UWpNRWZ2VldUUFNtY3Joa2xoMmtsQ0kyMjR3bU1l?=
 =?utf-8?B?S2t5Q2YvdlREYmFYaEJwbjF0SWhpejRhenNKZVZvNTA0QTVrblJSa0hOU0gr?=
 =?utf-8?B?MEZScVk3ZW1aaXlrd3B0b1dZTVZZL3g5Q29KMG0xNnIvWGNFU1RnOENYTnE4?=
 =?utf-8?B?ZE9ORHhvdXJTejlMMnhuQW5SYk5Gek9FeUkwUkNOWHAzZmVGanUycjE3Zjg0?=
 =?utf-8?B?ZVdjRmF2S3pjSG1YRE5Icmdta2hkaENza25SWk9VZkM5b3VRelppU0htY0ph?=
 =?utf-8?B?MlF6ZXF3OGZjbVBtdjJFK3BRRmhBZjdlLzJjUkk0Ui9WUjZMVVhVRDZoNFE4?=
 =?utf-8?B?amE2N3h0THhnTytkSFNaTW5jL2QwN1I3RHd3VkZxSDByYjQ5YU5Sd3FDYVRv?=
 =?utf-8?B?MVRaVDQ0Sm0xclpvc0VTNEpCczIvOTNMWEFUT1I3dWxqdytVRCthOVRndXJY?=
 =?utf-8?B?TllHampWbmRSQlU3WTdpUUV3cW5EclBYQkRlZlRrOThQNE5ScGZtaVc3ZjY5?=
 =?utf-8?B?MVJvM29QTGJXaHJsZWgrQ1dkeU5iRXFJdGNySVRESlIyVFp5bU94cEJrd09Q?=
 =?utf-8?B?UUJFd0tFb0pBKy9rUVpCSk5vdlM5QjlMU2loQm90dzhwK3A1SjJwemIvUHdn?=
 =?utf-8?B?SnVIdjBvVnZPVU14bnBWODdaRENaVHRnZEp4RnZ0OTFkZzBmcEwyL0lTRGk1?=
 =?utf-8?B?bUNQUGhGditiYlZEdExmZTNjT2dxZWJLQVNwckJmcHU0MEk3dFkxWFpHUm5u?=
 =?utf-8?B?M2EyRWwxNThSL2EwNmNCeWttNHBPdzJuUkxERzFjenptL21YblJUWlZVa3BJ?=
 =?utf-8?B?d0ZCSXRDN1FZV0taVDlIODJEUXltWjkyM2NiT0FjRTJIOERVOG16Z1Y0emFn?=
 =?utf-8?B?SkRqN3U5ODRTdEF1Q0VqWHZEVDhVN0ZESUU3MGdHdTlJNkdDZUY2K0RIS0Vv?=
 =?utf-8?B?cUlSaENnTldQWkJDSmo2L0w2NVA0aFJOQ25VQ05sZW9UUUdvZ3ptYzkrTEh0?=
 =?utf-8?B?bFkzOTY0ZDc2b0loSE1lTHBJeUhkeEdSeDlYaE1GbXEvbmlXYVdRWnFQTGIz?=
 =?utf-8?B?R2hKUHAvYUJlU2JoOXQ4d2tyMnNWUW1qZjUrQmgxVEIzcjFmY2FQendMblM1?=
 =?utf-8?B?K05LUSszaThLSGV4L00vcDE2c2tTajk2dkdqUmVDOEM5ZzEwVTgvZnBJNDN0?=
 =?utf-8?B?Vk5rZC9NbWxkMFB2S0dNNUNSZ0VvTDBQTlFGcUJaT2Y0TUhjUDBDMWc3Uk9l?=
 =?utf-8?B?ckZGZ2tLYkNleW9HSjYzSVFmVTQ3WVVBYTNJTDRpd1l4anQzRTFIMktXVVUz?=
 =?utf-8?B?UXF5UkpJUlpwd0hVaE01QTV2SUlmd0hhZDdjMjMrd05Md0V1Q3BSdk9Dc0hM?=
 =?utf-8?Q?uNkamnSNUA3Ezjtjtv/1VO68PDxCgsdHn1bkOdlINk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383faa27-8829-458d-2eca-08d9994c674f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 13:19:28.1503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byoIO6OthIxkQFa6CDPb2C+Wm+TC1PS8YvLLtF+Qa5rY+3X9W236VDp3uE7X/Q5PmEWOApcsX3odN5LpPNx50WcBpH21d8Bepb6MjNGJnTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4271
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270081
X-Proofpoint-GUID: eOQJ2Szt3I6r5wuYEzc0uKbYGl9H-sVJ
X-Proofpoint-ORIG-GUID: eOQJ2Szt3I6r5wuYEzc0uKbYGl9H-sVJ


On 10/12/21 10:25 AM, Juergen Gross wrote:
> On 12.10.21 15:33, Thomas Gleixner wrote:
>> All these handlers are regular device interrupt handlers, so they already
>> went through the proper entry code which handles this correctly.
>>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Juergen Gross <jgross@suse.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> Cc: x86@kernel.org
>> Cc: xen-devel@lists.xenproject.org
>
> Reviewed-by: Juergen Gross <jgross@suse.com>
>


Applied to for-linus-5.16


-boris


