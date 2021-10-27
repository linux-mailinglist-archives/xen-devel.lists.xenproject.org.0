Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E8943CA7D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 15:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216953.376755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfirs-0005uV-Lt; Wed, 27 Oct 2021 13:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216953.376755; Wed, 27 Oct 2021 13:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfirs-0005rz-Ic; Wed, 27 Oct 2021 13:21:24 +0000
Received: by outflank-mailman (input) for mailman id 216953;
 Wed, 27 Oct 2021 13:21:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jCJ=PP=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mfirr-0005rt-Tw
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 13:21:23 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef23d07e-da83-487e-8ca0-2511f0171745;
 Wed, 27 Oct 2021 13:21:22 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RCTjTU017577; 
 Wed, 27 Oct 2021 13:21:20 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fg29tg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 13:21:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RDJvYC055161;
 Wed, 27 Oct 2021 13:21:18 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by userp3020.oracle.com with ESMTP id 3bx4gr2dea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 13:21:18 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB2883.namprd10.prod.outlook.com (2603:10b6:208:73::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 27 Oct
 2021 13:21:14 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 13:21:14 +0000
Received: from [10.74.107.92] (138.3.200.28) by
 SN7P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 27 Oct 2021 13:21:12 +0000
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
X-Inumbo-ID: ef23d07e-da83-487e-8ca0-2511f0171745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=XeUytp3hIPU0AtblceHI1LRrE4kwQgGDTm2effsGT+s=;
 b=Iu7hrbT7DsjyLG4l6tQL9+wMYk3BtKITUpYMcWAZAtETT4EFJK+xgQrNSCoYthLYAhkX
 /xXEG8+cOMJp19vWtxsxFz+y/i6xf4CIely652KhZczafjyvjF4LUql1hGZyMUaAJWKQ
 6Y3aPWB8yaarAE48wg5CR8J2jysDvPFuHXmtvzMfYHD6TbImpqk0O+Pxnr03RexWRfCt
 GaB71qvSUdkQDlsNnXbbVlLpUvmrichoFoB9rveqPhUgnyn5TMt83gqSPpDDoAS1aplB
 Pos437EvANWFWYDzjt4cS/TntgpZNHRqKh6aPRDXk7Jq6Dt6aXIGGQL64I9+E8U/wPNa PA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpkrwFBE+kVkrKsgp2333kG7IbMPIPg1dFkuaH+F/paye5JO/mf9f8IM5xPBahb3kukgQWjNv8QkF1+MzNJf/ntw+/pKNdkShZ6I9gXnc1T9G1gHE4j1FRA/8OnQh/6yTEQkPfLfCme8a2Jlc5ao6YEsJ5/rEi5qft52H/YEW2UJlF1w6Iw4kArnwrafjQQK+ne31e/o//FqVfYilf5IH/OMibq8fknpzTM8Rb0JSw0H6OZldMlKmxMJOCSFtpUSKgHB/bTMokpTr8u4fBUBp04fPyr1OBWA40g8BUvYjQ5dpPWQwV8NzsMOfGwu6PMKV75ebFbMhL9x++ttal7XyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeUytp3hIPU0AtblceHI1LRrE4kwQgGDTm2effsGT+s=;
 b=N03VFWWpWDG+u9ch+IM8jK7Hj4WsmlYd9xbmMfcLXGKbdPBHituIFPaZXwFq13zoWV90QosdSqWZhZCuwknUh+uKJOT6ondwF6dU17DAf9avKxA+fS8WfoNbmbZygnJoXjJt87vlT3UMvCe4zXteNfYtyt2ksmoykQR3226EzD29rQECl8K7UKFKafFmn5x8sCR0Lfx0Z8SXdY87L8hYV2n4HYMGO/JeSAc2R9uxY2zQgGYilRufRoVFz/z2vPmwdklNMjVFEt+H91J5z8sCX+5CQm77D+2irUWSkOTt5PQ3dsV2j/FWEVtyx47aTCGfYVoxNiPCEs64cHavrqwmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeUytp3hIPU0AtblceHI1LRrE4kwQgGDTm2effsGT+s=;
 b=pnn+EJdVJQ8ISyl6dpIhYAY0/n5BLFG2grSo6QMSucQBNVK3/BV/zIAO+RIJpoC33W0QfnGI9h9ll3GRqaF9fb3HI4kZZpgJFEtTkeuw1sL08edvTOj8823KNDi2hWAsBPxNJW1ZncIooB6ggdsXfebLUUamRt+ndvYzZbfKYhw=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <f08cdb58-dbcc-406a-d3ff-cd4ca507efb9@oracle.com>
Date: Wed, 27 Oct 2021 09:21:08 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] xen: fix wrong SPDX headers of Xen related headers
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Cc: gregkh@linuxfoundation.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20211015143312.29900-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211015143312.29900-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::10) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea34547b-6dde-4d0f-b0f0-08d9994ca676
X-MS-TrafficTypeDiagnostic: BL0PR10MB2883:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB28830C063A9C5F1184E406218A859@BL0PR10MB2883.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lYCEK6eUt5bF8P7R1aVwawdmxr3BQ3rp5IIow1mo2KsA8MflYTT+KBB3MGAYM2Xmstezpe2Y5pH6gRfsjnHpFOB3zY04aLd32PNs7DoWRyZLahWCkHJ72Jqa3HH8crUpgpyO4M753B/38EqYfJSd056QbNJnkD+eJ9P6IF4TJ6lnLgNKfrRqECFcC9xX0tuRa2PQfhUYB9mTngQ27RuTKqvZyaIKkShCkmH/7rPJkgRnoZ8HO2+qpI0657AcBVB0zdgt3dEeRTJ54iyiHW7UXSq4bJrC+BRGCK9mWwUrA5U0tFYBouHsO2E27AUvbt1riMKjj0EtkxdTvrfBlVX7U6Gwz/XqEKJVvFcDaI4e1RQfusTnEHTy5PRdEbl61aiaVjwzfl+dBf3Jv0QsqMp7IO9stxYw0qIPW38paNaESjSxBtASVD4uGPp8589LCxj/qtMe4cZPLOYGTNcqXE41IYIhpJC4JnYJfnvqPl6AeCBhKiXFPblS7f6kruKZ3MToZ0c2gt3hoLnfmnCd0Fk26nrtiDbMc1W9UMTBf1D+ZUBz1ab7CzvCymmdUp6ohQiw5FzubtZYmdtO+YgRQ2g3JXio3+GcgHcpbTcWehZ1W78B+86y1lrAXa800T+OFepSrSNeL2rHUsZTZOqjDSSECE7KN1sPI7Tf7LGKe0UetgtVXX1wYoUoJ4zfYhZU5j7EYlYc1LN1mlvSe6chlhHvf1lUS3ELOt9wP9yuEsggWAo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(31686004)(66556008)(66476007)(66946007)(38100700002)(8676002)(86362001)(31696002)(956004)(2616005)(36756003)(44832011)(8936002)(5660300002)(53546011)(6666004)(26005)(508600001)(186003)(4326008)(16576012)(6486002)(316002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NFdRQ3JhbXkzdmtYWEQ2TU90U3B4UG5VVTVlSUVUOGdRUWVBd2dhSlY3UjNS?=
 =?utf-8?B?UHJaNmlSRzZkbGxiN0szZko4N0pxR3lxNDNkL0t1SmdOQ2lvb0xSM09tWnNH?=
 =?utf-8?B?RmRnSUZiR2dJVloxSEJPdTMxVzFaZEFsMmpKYXZycllaS0kzeDN0ZVRVYzBF?=
 =?utf-8?B?REhqUk04L0lUbUdHa1o4MUh6c0RpZzJmVk5tWjAxeis5dG5JeU1vL1VIa0F2?=
 =?utf-8?B?WEFxTDFvMkMyS2JVSnNvTm8xazBPN3ZRRUxmZmdCdmp0NFczM2lyVHN3eWJz?=
 =?utf-8?B?WXpJaXRCYzhQUFM4eHlhMkdOaW93THBLUEhCUEYxTjhxczBoY09oY2JabXpm?=
 =?utf-8?B?emVrUExGRS84NjdvejUxdU5MMFFiRjVhK3JnOGMxeXhYekNLdk1RRXk5cm9V?=
 =?utf-8?B?cS9LMTIraWtzUC8vWCtTWW1EdlZHUXBHbXJIamVWZlNwTnM1YnBRbERvUWZa?=
 =?utf-8?B?YkFsWWJZSFNxb2tvdXZDV3RIaFpqUmJ3VGxJYUxqYUt4WXpCUktFOHdtcVZy?=
 =?utf-8?B?ZVdIN1lQd2JIWjBOSGtEOUMxNWdZMnNZUk9INm5OTUVKckNUaG81L3BxbHZL?=
 =?utf-8?B?SGhYMjNXTldFSDc0Tjl1WUxyRDNBd2VkT0RtanVGdDh2ZkUyemN5bmF3a2JX?=
 =?utf-8?B?cTQzaVhWNVhwOEZKcEp0ZFlSemlTcmlEVzhXL1JkSDRQbHJkYzRiYXFoMEk3?=
 =?utf-8?B?NExSS3owQjBFQk1ac2srVVJzc2JrVjFGTmpvbWZyajErTklKV1RGSHpwdFVG?=
 =?utf-8?B?QlhlQWtOM3RHZ3Q3RVE1S3RadW9iUDhMRHNCY3VVMFJGcVIvRHl6SXJjQlNY?=
 =?utf-8?B?Q29iMDRBTm12aGkwbWtqNWpVR21rODdDeUFaMUJjeTlvVk5qWGVLMURKZ3hV?=
 =?utf-8?B?NStPZ2F5T21lbUFnSlArN21ONVVnbS9XaExrN2E2aHV3SEpIR1Z0enRLSStL?=
 =?utf-8?B?MWdhTFlRWnJIeVZzYy9aeG1JZUp6RVpSbGpIVkZraGkySG1xRzN0UjZ2ZjZ3?=
 =?utf-8?B?RWtnQ3pKeUQybzIrbGlSVDZtSnRuRFQydVJNNitGOXNnK01SRkU1b25PWG1F?=
 =?utf-8?B?eXlLb0QrajFMSEdla3FmVzMrYWtWdERLdEdsOVdmSlp5c2NUNmd0UGJLUURu?=
 =?utf-8?B?SHFDcTZVcTVCaVFPWnZCUUJ6WmpxRXpnUkNjQXVTZDNkMGpwbEhvSE1oTzdj?=
 =?utf-8?B?cnNSaENodXBCVURjRmFPYjdUdUhxVnQ4YXY4V1d0bUtVZG1iMjVBcWZHaktK?=
 =?utf-8?B?cEJDRTNySmhPOTNUSTJ6WTZuc0FYNXYvRjdBeDVHeERnaWdHQ2FHMUJ6eERm?=
 =?utf-8?B?ZzRteXJSaFhNRTVEaE9YUFVkVjJHNE4rbGNUREtIeEE0VWlVVGRvYSt2VUd0?=
 =?utf-8?B?QVdNQ1FmTkprUE5paDhJNGRXQ0JyU1VzUFNIaXRyRHNKbHJFNitUZGZtNVB1?=
 =?utf-8?B?ZDh4VSsrak14UUNVbEorV1UvVVg3SGt0SVZXQmh4VEo1S21TN2M3YlVncUpJ?=
 =?utf-8?B?OVdoMGxqK0xRbE5RblR5YjU3Si9jdXVaYlYxa0RzTVR3MDlaNzM3TmxENzZZ?=
 =?utf-8?B?ei9vcjArYllBWkJKZ0FhT2JxMVVJYjFtMnhxdmNvOTIwcjlXazFUN3lvbGZO?=
 =?utf-8?B?d0ptODVrVU5GbGdpYSsyenMzRTh4RXU4M2VNTHhMMTBqcGZGTGlwcVkrNUVi?=
 =?utf-8?B?WUczYWRsUFRMTUVEeFR1cEg3dDR5L2plcEp3S25xNHpiWmpWcFh1YjNGQXg1?=
 =?utf-8?B?N1ZpQTNXS1pKTTZDTVo5eU5GNnVwU2tUREpEc0xRM3pQcjJPaU9DY0FXNkNY?=
 =?utf-8?B?Z0hmRytRL2RJbDFhYzdnc2h2N0hDbW54MnNST1NqajNoT0luN21rOTNtZWNw?=
 =?utf-8?B?MVZZRzdNbk1yTWIwNTdNZEtsQW9KMXk3WDdVdE56NS9DK01uT0p5ZzBWbHJV?=
 =?utf-8?B?ekxkMXp5dENhSWhCS0ZCVW1xTGU1MjNpL3RSMmN5dCtBRStrOExkRXFHSDd6?=
 =?utf-8?B?THNLT1Brc2JHZ1BoUEhqa0k1TFA4V2x6aEhXN2lGWUh3dDI4S3ZLV0ZldWk0?=
 =?utf-8?B?ZDJzRzg4ZDBjbHF3UjZoUnJHQVNwY2tkUGh6djZGdk1hcW9RZUNoWHR1bzZs?=
 =?utf-8?B?d0pyb1ozK1JQNkY0WkhNbnpOT0NKV1VlZkNibVgzb3lVNDZNUE1IVlBZMnRJ?=
 =?utf-8?B?WUx2ZXVqNmVPZE8vNDdMbUQxdmo5NjdoUDkwWmhJTm9NZ3FZL1FUTjk3VHJ6?=
 =?utf-8?B?T1kzZi90L0RhYjg2Y2lWRVh3bzN3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea34547b-6dde-4d0f-b0f0-08d9994ca676
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 13:21:14.1774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9quMx5P2gw/dBWae72opcDJhiIBFZqZ7cUnvUQePZ3cfpCiamvwhCMdH4IiJmzjEfUYZftxG2VNMIIgdISovkKlhJxzMSvwRTY08dgLkq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2883
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270082
X-Proofpoint-ORIG-GUID: O23f2bqCU6iHhSNnYTERd-M2G1K2CNrc
X-Proofpoint-GUID: O23f2bqCU6iHhSNnYTERd-M2G1K2CNrc


On 10/15/21 10:33 AM, Juergen Gross wrote:
> Commit b24413180f5600 ("License cleanup: add SPDX GPL-2.0 license
> identifier to files with no license") was meant to do a tree-wide
> cleanup for files without any license information by adding a SPDX
> GPL-2.0 line to them.
>
> Unfortunately this was applied even to several Xen-related headers
> which have been originally under the MIT license, but obviously have
> been copied to the Linux tree from the Xen project without keeping the
> license boiler plate as required.
>
> Correct that by changing the license of those files back to "MIT".
>
> Some files still contain the MIT license text. Replace that by the
> related SPDX line.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Applied to for-linus-5.16


-boris


