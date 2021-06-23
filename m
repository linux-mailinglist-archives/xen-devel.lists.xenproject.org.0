Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120893B23E8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 01:20:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146316.269192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwC8u-0000sX-7g; Wed, 23 Jun 2021 23:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146316.269192; Wed, 23 Jun 2021 23:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwC8u-0000qi-4i; Wed, 23 Jun 2021 23:18:48 +0000
Received: by outflank-mailman (input) for mailman id 146316;
 Wed, 23 Jun 2021 23:18:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5ekh=LR=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lwC8s-0000qc-AG
 for xen-devel@lists.xenproject.org; Wed, 23 Jun 2021 23:18:46 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 998e9687-8905-4f30-8a4d-689758ea0451;
 Wed, 23 Jun 2021 23:18:45 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15NNH8i2002775; Wed, 23 Jun 2021 23:18:43 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39c2wnhjwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 23:18:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15NNFv29113613;
 Wed, 23 Jun 2021 23:18:42 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by userp3020.oracle.com with ESMTP id 399tbv65g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 23:18:41 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4333.namprd10.prod.outlook.com (2603:10b6:208:199::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 23 Jun
 2021 23:18:40 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf%7]) with mapi id 15.20.4264.019; Wed, 23 Jun 2021
 23:18:39 +0000
Received: from [10.74.102.31] (160.34.88.31) by
 SN7P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 23:18:38 +0000
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
X-Inumbo-ID: 998e9687-8905-4f30-8a4d-689758ea0451
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=NXaHNbeqOPtKkQw9Dha8CY4CHp/tDnQ+pswMmyzLSBE=;
 b=PpEy9HS3Iao0eEuAmfoKeID8w5fl5yun9EwiIWAzhbiA3cVu7sdyUKta8RaRve9ZT5ux
 IJHS8T4vOpm9VCmxmjmkXjoPppVwQf9KpGr3efKQgwr150hbK9s4QH6uVloL2+7rvy+7
 wZtOLtyJaXC8dcqZaD/VwoihW5bhS40b3hjaQbLmVo8LlSOWm04y4j1lVZuL4ba8rAEK
 9f/ObZyIQU6ZasJGc2PSMEOYkNfQEwA9Grg4gVJ8zHg9kv6bJrUH7OrUJEqdsJCzbqXE
 WHAKWDArNDuP5BhD+adWlA0cwucNf9+Q9xWqlp5ivm6lkpl9YeJe88ctpQ0KuSP4ihmm VQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ss2M0SQwbLE+mlwY1AYzlTSJyF675t05Zx9kicGoOAU7jKlGy3V3Kkj3aUmQ9DvLzY9xDO9uA4v8zD+4miZM0uAs20n9+vf2Y7Ov2KEG7jLUtk+1sWMYhQji6lm2UpsMqF4CZGeX0cyV1E9soZO+gruNEY+Xqj5aFwIkhOaMSrhoqM1Q/2iEaCDSVYrsnhKBEmse8RrcZV2nQMLfEaSyRlERIXRvkaT5druzL8PUq8Wii1//dKo4rrB39WbTjQcV0n7xc64utbq2vEmeqPhvPF3l3xATOXi0gYANb97gsqTSL8Z2LPxERYhtmVcvXN0RZMgO+3XzNWoomdLDnn5Cag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXaHNbeqOPtKkQw9Dha8CY4CHp/tDnQ+pswMmyzLSBE=;
 b=hw/t5+sDyfonvPOL476MLtABlWL+bbyMrvJDCT7JLoQm0K5AwhemBI+6Ly1vqtXTQuvDSgWnt26FY69Sw2rMZ09CDSNBkUG6klNx+GJ15Oao6vZvigiDMCxqMjFCa6C3J3Rihpzytzu53bP7yz4LLhS+NKxJbkaJJiLj1AKXRdtPQNk+5Vzuj7I+hig7+KrzO0/w2WpnaNkrmOM3lWG5Ul202wM1+rh2a7rplHx0QPQFzOo5ERlMM+pzZwhs3bTJFpa0JSD1BYwO3FiTqN8E7sW9BX6qUVXjnJ5oigSXjRUzYvdUpvZNvePhiFklFzjFK++7j17mXvLey6Ces5tbgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXaHNbeqOPtKkQw9Dha8CY4CHp/tDnQ+pswMmyzLSBE=;
 b=d4MU6BiyF51FSyL51WIPKn3qjVuaRj7XfnovC1bNVYkzbzJU0uf4lA68EEU5qhmlQuxRU5rJutXEWNQ4j/u+juI9Z6nV7iV2cVy9XhUQTvYqqVc97gAHp5n2SNK+lPtHyWG86BMRHhqpO5L7KH4bdFYdENlhzMekDjzXvwBA30k=
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] xen/events: reset active flag for lateeoi events later
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20210623130913.9405-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <9736ccf7-ee9d-ccae-fed6-cfeef78e6a8f@oracle.com>
Date: Wed, 23 Jun 2021 19:18:36 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
In-Reply-To: <20210623130913.9405-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [160.34.88.31]
X-ClientProxiedBy: SN7P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::34) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2acce191-0931-4846-9914-08d9369d3c17
X-MS-TrafficTypeDiagnostic: MN2PR10MB4333:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB433351FA3AD64AC14BAFA3048A089@MN2PR10MB4333.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XNGdQbzXxLo/6UiMA0Y1JfMqrjebBKjA9by96F759xpSHCqBxuAwQO5A/fznaSqkve2Qq7f1krkNehc3kCLFylkkutbmweJHaLt19/9AblxskiEQpUpDfleFxxv3K3HIx8nmljc91S/7BanG1K9fZK4FNmcA/u8ZNTafGRXeDyWI0mH+v/5+d2IR5Qm4BtvY/fRbOaz49CVB1nq/KWmo3us7puocayI7essSD/lL/IPHdkGQStPR3bHi1vAKMZeSAGIInF+beT5n1fsbN0lBpqNVlfodoCdbjsyo62GpBfheK8G6U8kNf9IBn3gR8RqkVO0kqzH6VyLAPom8pt48n1/YId9/akFZi+b4DL1R/ZyD8sLCH76Ptkz04yXzyVm6Zcalu5zWgR7Bd7LnTJj5ABszHocAnPOCyKzke/MsAbk+Tw4l1yNIcxHcqBUrKb3BhxmD8B+yZELS0LvB1GZ9YnYNl+maicOU8H3v19wgnyU8RfU05sIOGyD57UQSuS45DAJsvo1TSHXoXrHsFfKslzmUIXiHp/agPUZvXl/1NUx3ZiGtdxlL9K89a0n5XKSWf6gEEnivDAYSLcZukBBd7Oa5N46DftOyx3moXtCzvL9l9/HiRb8estGzePPUa3r04WroEtf1GEJpvbjSqsar7kOSg5ADSpRZl7jUUxXS3XWjpgIm3Fs/WVNmaT+IyPGG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(366004)(39860400002)(136003)(83380400001)(38100700002)(54906003)(6486002)(31696002)(2906002)(86362001)(956004)(478600001)(16576012)(2616005)(44832011)(316002)(26005)(4744005)(8676002)(36756003)(16526019)(186003)(31686004)(53546011)(8936002)(66946007)(5660300002)(66476007)(4326008)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RlcwZFRSQjFjVEYwRkRzN2t2anBHdlpaZGRHZzkyc3pGdWtYVkZtRmgzN3Ri?=
 =?utf-8?B?YkVJZi9FZVdlVGtNenM0M1pUYU9QeUJZVjIvZE11OE5nUmlvbmRVR0xxa3kx?=
 =?utf-8?B?VEV6NmYvbmZITmlnV2c1cFZUU2g3N2o5REc4ZEliVG93UStiODA2RlhQT0pU?=
 =?utf-8?B?M3JpajI0NHk4UHF4cXdDenMyNGxqTVBsKzhjRHhvMUp4THdZQ2NId2syOWRW?=
 =?utf-8?B?b1AzeGtKUHZEazFaNUIyNkx4Yk9nRWdPMXhNOEZlUE1RNkk1dWdJUVVMa2V5?=
 =?utf-8?B?N2FVQ095SXMySVBxeVI2REQ0RVd2V0c3THVsK015eTdVd0RoVzEya3JBa2xT?=
 =?utf-8?B?bFpsS05pcE5zL2o0SExDcEZNVS9ISFlnSERQQThFdU81eGpwSEdIWjQvLzhU?=
 =?utf-8?B?aTdrZ08zUGl2NVYyUzJ3eWNyYW1RYTNUc1lrNlN4Vnk3ZUl2Q0ZLWXJIa0xo?=
 =?utf-8?B?QnI0aXhiUHVjUlFLZldZRHEzeHBHMkhZaC9zUHpvdlpMc2Y3dXk3TlZtNXVS?=
 =?utf-8?B?N2FoZmczc3VLeVB5ZVlZUGs5L0tpLzl4czZVTTlzangwb0crd3Y3bDJyOVpC?=
 =?utf-8?B?SzZ6TG42OXdYcUhNR0Y4a1ZIbytHR2ZscUJjWmNRUWxzSzZzc2Ivb0xSbm02?=
 =?utf-8?B?S2tlaTR6NVkrTVcwVENML2RCclppRHZpcHoremVJRlkrNHoxTFNVSm05M21h?=
 =?utf-8?B?aCsxZWJ1czZFdE9hSXhpcDNDS3BFL1BDektGOGFHQS9sOTF3cXNGOEtsQnM0?=
 =?utf-8?B?OVV5dXI2Y2YrTDZpckg0bk9sR3I1bUM3dG1jSVd3MWcveit6NWFhdjFnbjFl?=
 =?utf-8?B?RmhJdFRPZWNTRHhna24wak5wc2xsVVpjR09mN2ZvRlRnb3oyN1ExUVRFVXFC?=
 =?utf-8?B?d3JYRnJLSUtwV2dOTm1yS1FUVTFLekhpcFlXb1NHbjd2TjZ1SW5PZkRLZE4y?=
 =?utf-8?B?di9VYXlDS3JhTWxvQkVJbWRORzQzVjJUUU52R3NqR2c5Q2U5cy9xLy9ZMGRR?=
 =?utf-8?B?QTA0dG9IRDMvMS9OWGc5OVRoT3ZoWVhLWGNBQ0Vnc2JXd2pXVmRIeVhmdmZl?=
 =?utf-8?B?SmZuaFRYN0FWQmc3WkFPNGMxQm9UcjYwR3NlZDVSMStlUGRLZ3VxaHBLN3ZV?=
 =?utf-8?B?N1A0Zmc0ak5LdS9Db3VBTzNwV2NjbTVjOVNTUDB1ekRFeENJRVhKQWwzVmtq?=
 =?utf-8?B?OFBTUkdqR1VXZEd6RUVaLzZCc2RubUJFMDdCRVdCbkswNGs5c2VkRThtM000?=
 =?utf-8?B?UzcyZ2JEWGVBVUJoZWxFU3VmY1lIbWlKTlNnTVJ0WHdwWmZXTk8xVkUyUWZV?=
 =?utf-8?B?bW9GOGVGaUUvRW9QS3JMcXZxM0loUHB0UUVyYVZORUJGVGY3ajRCcHkvd0lW?=
 =?utf-8?B?M05FdnV1YjV4dkRMMTZUWm9zbjlkZ1NCZmRnME83T3B1SEh2R2wwVi9pR1k1?=
 =?utf-8?B?dmpuMldOb1FmL0Nrci9Mdm9WbkhpRm9SaVhpdUl6Z3ByQ1ZyUENCRDhtUzRa?=
 =?utf-8?B?b2pQOStvMGR6OXhpM3dYR1JwZnVtaVFzMXZJV0JpODJmSjJsdkxaYUJ2M0Yr?=
 =?utf-8?B?VTBGdUdLSndKYWovd01lWHQ5NnI2Mm0xck82OFpWbEk1YTZmQlVzTW5xZFcw?=
 =?utf-8?B?OS90S1N6UkV6UUxtVm10c21vVTlFRlVPV21McFZtWjFJUUxFWGhaVCtUcjJ3?=
 =?utf-8?B?MDVhVFg5Q1FBZm5pTkx6SEducjNZeHpoeUQ2S3dRQ0ordSs1Z2R3QVNtVUtI?=
 =?utf-8?Q?MMvVzPc05mfLqC5t0X3pnfqUVe6IVYqIKmqI0X2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acce191-0931-4846-9914-08d9369d3c17
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 23:18:39.8019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qc1eb/+I/oFnyx4aYPGgwRn1qe1Q+y+cVNJvzgDL6CpeUZvWoyCs/DVTd+esriLE2DixpzC3yWreu/3fu/mYPb6MsXt/F2UFxDa6VRlonFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4333
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10024 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106230136
X-Proofpoint-GUID: vj2DWSSemc14Kp2eE4WH09dPyS1VC6xS
X-Proofpoint-ORIG-GUID: vj2DWSSemc14Kp2eE4WH09dPyS1VC6xS


On 6/23/21 9:09 AM, Juergen Gross wrote:
> In order to avoid a race condition for user events when changing
> cpu affinity reset the active flag only when EOI-ing the event.
>
> This is working fine as all user events are lateeoi events. Note that
> lateeoi_ack_mask_dynirq() is not modified as there is no explicit call
> to xen_irq_lateeoi() expected later.
>
> Reported-by: Julien Grall <julien@xen.org>
> Fixes: b6622798bc50b62 ("xen/events: avoid handling the same event on two cpus at the same time")
> Tested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrvsky@oracle.com>



