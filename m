Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC29403D46
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 18:06:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182300.329806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO04w-0006ac-FJ; Wed, 08 Sep 2021 16:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182300.329806; Wed, 08 Sep 2021 16:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO04w-0006Y6-Ba; Wed, 08 Sep 2021 16:05:38 +0000
Received: by outflank-mailman (input) for mailman id 182300;
 Wed, 08 Sep 2021 16:05:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ljEy=N6=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1mO04u-0006Y0-7A
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 16:05:36 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 992bc338-10be-11ec-b16a-12813bfff9fa;
 Wed, 08 Sep 2021 16:05:34 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 188ExKN3023705; 
 Wed, 8 Sep 2021 16:05:33 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3axd7tb7y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Sep 2021 16:05:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 188G0LxD057687;
 Wed, 8 Sep 2021 16:05:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by userp3020.oracle.com with ESMTP id 3axst41p1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Sep 2021 16:05:31 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB5331.namprd10.prod.outlook.com (2603:10b6:208:334::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 16:05:29 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f520:b987:b36e:618f%7]) with mapi id 15.20.4478.026; Wed, 8 Sep 2021
 16:05:29 +0000
Received: from [10.74.115.194] (138.3.201.2) by
 BYAPR04CA0009.namprd04.prod.outlook.com (2603:10b6:a03:40::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 16:05:27 +0000
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
X-Inumbo-ID: 992bc338-10be-11ec-b16a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=WOotRj4nQjDKasrtz0snA9uu+YSNII+Jq0+VtpkJHbw=;
 b=Jpo9oY4Q9n1JPkT8Ldflw013e3cOnnPZkyXnY6QLRTmhpV1kafqUw0HFEPFmgQp1OOI+
 1b0lLnTJp4bseEeXSbr7y7NXok/FELfrR3xdjA0i6xwpPcbadt7ZhP1cDg1JukvRyXQO
 bQWWAwgqiRjv4bqxQ5usU147mvINmNIKCFdOw/viBQ7oNlUmZqpTRcaUquPW0TWW0u9C
 CyDYL70KUt+4BAu+u81/qUj4Eb1+K51mGLITQZ9G3vvDkC+F/SDBWzZO+LZ2Av4f4r5p
 C0wmCpOL7VStwGGNs3mS5jT05JHxAKf7GUZ2Q8vTlhdQb9vPcA0n6tTxojZUg0+uUtAp iw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=WOotRj4nQjDKasrtz0snA9uu+YSNII+Jq0+VtpkJHbw=;
 b=TtF5RrTSGSZ6BWMHeYM1CFI8YmNAwi1QzayBlAkWFi+U0l8r5QYPPgN1PLaAnBmhLsJu
 1fOScIRwA8ZxiMFCwJT+5EMhMGSDDDhtohy9LTRAr0KZipsuK78AM+0z+Kkbn3q7al7g
 JFBuPQ4LMgaNGX+3LjmeoEu5JdqmvPZtArPCLkWl6Tm0/QUNUkhosJYaEmiE7JQWN/oZ
 Xw1wVQuDbSJU6/jojSTNaFcfuA13ecmqwqmsSn7aVhxHY01IO67w1CDlopFTcuCz24+y
 VVvRjlKk796pv70e5Fam3XaLjUleEf/Lu2dChRMQW9rM9e8KqQG4esDxEwQf/03rXPGg HQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBtMP37QRI4HPrJ/rhg3UCgFtzCCQIaS2fn3vf7IMyokCjw74oYxHhOTxIIulA83HADjFj7GkmZ4M0tC7NXZR9iuwL5c4+JZGCvCFCj1PGaRuETgkLjFKdj5QiiRwGsYlhH5n0DPtCAKUqbxCuudV9ODuwV6biOLsD5ZDYKCyq76NgZ4moB+iOco/khDjxFcVLrDCQ0ETy73t/OW2ry2YVwVevmC4MZ/rhWn0PiA4Mf8wIk7vkh+nm2vn0gAvGZ853E/vZ8WJTaKumNXUzISPGGYugOYxPUjnq+0T1s64GP7Unac2ZE+01qWOVHujv6XDRuq1nVno9CuGoOJG8JABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=WOotRj4nQjDKasrtz0snA9uu+YSNII+Jq0+VtpkJHbw=;
 b=ct5aYIbohUwIxYkHIesKQPTqfXxKM5LjHSNn8TWV/ggHXUEBNwa8KxEtyoKGm8wdGYdh6Y0cMiQ8jWESLAVY0mbem9nITqmo1hfY43LJjePn+C8xRDBS7YYuPlADH9cPDBHmHPbaP5EC0nST0oy5HLykPKizGcP1gYlBDzRn9mPt8yNgjsIwj9xajxU8kmRoICMvrV4MltyVz3PYcW/RdnGPt//+Ce8yt5GxAKAwMsieA/mDLWHU45siezvx1KhYSxIiZqHBPdkgkekocyahH2BqpRg4n+A2LUaJtC1xGEzLbEjUnw643+PFRSzbWyVh1ebhkURKfRvZlalY9CuJMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOotRj4nQjDKasrtz0snA9uu+YSNII+Jq0+VtpkJHbw=;
 b=QPfRNzHA40Q4NKktFC9zdeRrqopY7XIjVTQAFjlF20/jsFhp3NylDsL23Uga2WO9hQx64/uxhGAU1bUuq68rW7LG/ZbVbKeDYuftHRAm5zaFsBvfnqPWyhJeNL4KFE1axOqDzZq3kqnWrfcfSybWA0hxTXl335nYqAznyndyDoY=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH] xen/balloon: use a kernel thread instead a workqueue
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Jan Beulich <jbeulich@suse.com>
References: <20210827123206.15429-1-jgross@suse.com>
 <8b13525b-0075-f4c1-8900-1be151e85e3e@oracle.com>
 <9d1edc4e-b2b5-c620-17c6-31d238c2c417@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <97f394d4-6538-a931-6531-063998c6c5e2@oracle.com>
Date: Wed, 8 Sep 2021 12:05:24 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <9d1edc4e-b2b5-c620-17c6-31d238c2c417@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:40::22) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0378668d-bfc5-4e46-2c71-08d972e27a53
X-MS-TrafficTypeDiagnostic: BLAPR10MB5331:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB5331057E2A96DA0C126CE12C8AD49@BLAPR10MB5331.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q5eCZWhkSbC6YHbPM7FC/DDsEs5zlBlgrgn/eRctLc2rRez+PyE6z3HT6+VKXseBUscEuPnADsUW0fURDYm1mYNHNX7v1EM0q6AWHdErt1fJVD1ZlZLJM1j9+Fx/Ot6ZsRShi6al1Jxx7mwIeRHL5rJEvVsuyleZZHt1SlJtdwoFIMe18qn9auJmAhis1MjWfZEXbekUcfggjH/44glZ44gEwHL61xiXecXo0V07ICdnlO1H9Z502xvt2kaxcAv+/dfPz5WDw3KZIxEn2PJxoUgMb1WoVZC6+KdkNy8HoLGPd6S+l18OTw2fF8+jQLR2OBI9puYAxt8mZ6tf8wuQvIu5i7eouo+eiy9mzFERYadBeAQhIOCq66dT3x0iSKX3xN74rJogEucnXz2fgeV+dyx0TLIaj4eTfR5fw8wJx+nu74c9JqTQ3igWkzXnJeI7ASl5XaReXB3AweE+3J8cLvxw8pMlfM7GbLxp/gNRNW1KfwKifsPQ+EXOWBojHx4O2ZY7uJhy3Jbu2kSJ6sr16B2Prf0MA/BLIebLXv/Xe8EAubbH8fQGd/RJMkDB7+W+rIL7v6Cm76labYsp12vhi37LysZDZV4lZ0xUS0rimKV1KA7zhXe0ih8k8uL0/lUDx+upCBLJhDX7t3AiBBwvFI2uXfYLeCOEc3h2SADmG3oVmbpjVyf5VtlTnM/lYB1GXkZxA7T0z1LTzFTpe8+M8cBW470aRk8XCP6o3wz/sQs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(396003)(366004)(39860400002)(376002)(5660300002)(956004)(2616005)(4326008)(316002)(16576012)(66946007)(66556008)(54906003)(31696002)(66476007)(44832011)(8676002)(36756003)(86362001)(4744005)(53546011)(186003)(6486002)(478600001)(2906002)(26005)(8936002)(31686004)(6666004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ek1hSnJzU21LMGFoSk0yeHJYNm5peUFzcVF5dytIMHlBWmJMVmdFMGs5OWZa?=
 =?utf-8?B?K00rUXN0ZnNrREh6UEswYWw5a1JPZGYyQmt2bHhwUUpMWWpFMEJnUmFDcmlj?=
 =?utf-8?B?bnc2M05XR2dTSHcvYkthM2NEZzE5MzZjQjRzSnc1aTZLNFBqWlFlcElGTlFT?=
 =?utf-8?B?SE52R2svU1doMHZ2bTlGOW84bjEyNFBvTVhMbzk1d0hpNUovdDJDV2N5N1A5?=
 =?utf-8?B?cGZVMlYvcjI1VHpzZWZNSSs2ekFyS0tNSmVSNkI4RFhPN0NDZ0trOCt6RU1l?=
 =?utf-8?B?WXhOTU9HR1Y2bFBwc1ZTejJHYlJTMmd1cFYvdVFkZk5BeVJmUEJaK0lJc2Fk?=
 =?utf-8?B?THJmK3JSTHFNZXRJajF6TmQ4KzJQd3UyeDBac2dPOXczUWdwSldxa1lSNThS?=
 =?utf-8?B?Ulc0WkFZR1RLMFBCSCtKV2hQelBVTTFmZDJ4OC8vUWpsOStRMjRIajU5N0hE?=
 =?utf-8?B?enpCUHRIdlVQMEZZZEd0di85UUFuQlRmVnF0ZmpWV1ZHS2dIVk80R3JVRHha?=
 =?utf-8?B?RGQvYWU3dlVYNnJPYjZzNHVtNENpTkh0M0dUR3psRlB2VlpJSjYzWk1DS3BX?=
 =?utf-8?B?VlM5VnlCNno4UHFiZzVPRjdNc3BxSXViWTZrbXNIL01mRDl3aitJbnMrbXR0?=
 =?utf-8?B?K3lYSEJDc2ljZllNdWlwdUowM3RLVjhBaG9qVW96ZHJHbGJyY0pqSDZVbVp0?=
 =?utf-8?B?OG4vUXUxMFVQcU1ZdG4vVnlJRzlWanNGOTZkQ3ZPanF4TnQ0akV1STJQbG01?=
 =?utf-8?B?VFZkdHQraWd1ZzYvbVFYM085MEQ1M3poZEIzNUl5YXJ5YlIvVytScm5UNXpL?=
 =?utf-8?B?dVg4YzlwaTR2NnM3aFBrNWdidGpkdmpHTHBkMjNvaEExZk91RDYvbFQyWmpP?=
 =?utf-8?B?alVvZGFaL2Yvd0Y4RElyVVFDN1pmWUY3cWxKTnZmdEJFd1AxZnFULy9OUnNi?=
 =?utf-8?B?TWRvVk05QlVvVS9mcUlYMEc1b0tJSkdPVjFUWGRSdUxidHZ4LzR3dXlBcnRn?=
 =?utf-8?B?akQ5aHBWQStGMkYvMlVzUGJLR1l2WUxJWW5IZ0lIK0d1a1dBS3E0anVYdUdX?=
 =?utf-8?B?WlFpdmx1elZnTlhjMEhJRWRpRThmYmJNaGh1c2NBVVpWK0hrcndlZE5BdU0v?=
 =?utf-8?B?ekdTeWsrSmI3ZTgxdG93clhzZ0VRWlc3clJGRTVtVHFNbXdJRmNxNTZ6MGtI?=
 =?utf-8?B?QktOZVVpT2ZuWWtTdDcydy9CWjNJM2J2cDNvbDY3SVZSUkxKRUhRV0w1dDVm?=
 =?utf-8?B?eDBLMWxva09HQjNUajFHMXlJR2F1VUFTUHg0czdmb25aYUw3cnBKc0VJUlk5?=
 =?utf-8?B?a2dmeklvY3AyRXdQSUtUNjdjdGtOQ2lVbVQrVDVyVVl5citEVTZPVGhmZ3Fp?=
 =?utf-8?B?Z3YrNTYrMEIwUldsbEJ4djh6OUFQWkN2THVMZDRBNFZEdjBxMGk0YmRDa21R?=
 =?utf-8?B?VHRuNjBuTDQzWEI3OC8yc1FBTFNzQTFjKzM3L0xxR3hVN0R3UExBNVdjbzFY?=
 =?utf-8?B?VkFydVYvYnZWTVZ2MDdpYUNvTEhWRXlkdDQ1Vk1DRlVtSGtVeEJqZW1WOHdE?=
 =?utf-8?B?SnlHTU4zRHdvRFhKUk9wSUJOVFc5VTVIK0FUV3NITDJ6M0kvbFVRdjBaeVpJ?=
 =?utf-8?B?SFF3Qzk0YVZHUTg3WDNnclVsdkdsMkVZTnVBaWtVcE5jeG1ZamEzaStVd1k3?=
 =?utf-8?B?SFIxUWhqeDhuVUExRHVSNHZxN21lVVJrUUsrUWpsTGZvWHlnR2NGbGtSZXVl?=
 =?utf-8?Q?UYH570yQo2328mqNq7qGdWS2kNoIlIf11RqSnuq?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0378668d-bfc5-4e46-2c71-08d972e27a53
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 16:05:29.1137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yBje2jKz4kx2VE4rwXMeQ1DDsT5NjlruM6Y12QVcctF71VT1NeYodt4FySEq6oWb5AC1Wl8cKsMyX1VTCp1ma7Rm6Wo0c1P3l/83zX5S2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5331
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10101 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080100
X-Proofpoint-GUID: LTVQLA2FxSYhyNO8pqma16wmNm95498a
X-Proofpoint-ORIG-GUID: LTVQLA2FxSYhyNO8pqma16wmNm95498a


On 9/8/21 11:11 AM, Juergen Gross wrote:
> On 08.09.21 16:47, Boris Ostrovsky wrote:
>>
>>
>> Given that wait_event_interruptible_timeout() is a bunch of nested macros do we need to worry here about overly aggressive compiler optimizing out 'credit = current_credit()'?
>
> I don't think so. current_credit() is reading from balloon_stats, which
> is a global variable. So the compiler shouldn't assume the contents
> won't change.


Ah, ok --- good point. Then I guess we should be fine.


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


>
> But I can add a barrier() after 'credit = current_credit()' in case
> you'd feel uneasy without it.
>
>
> Juergen

