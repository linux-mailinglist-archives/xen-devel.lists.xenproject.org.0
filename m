Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DEB38C792
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 15:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131250.245399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk4xF-0003qa-Qo; Fri, 21 May 2021 13:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131250.245399; Fri, 21 May 2021 13:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk4xF-0003no-Nd; Fri, 21 May 2021 13:12:41 +0000
Received: by outflank-mailman (input) for mailman id 131250;
 Fri, 21 May 2021 13:12:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAnY=KQ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lk4xD-0003ni-BK
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 13:12:39 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b8b7158-31d1-461a-86fb-acd4d55e7e49;
 Fri, 21 May 2021 13:12:37 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14LCxBaY101291;
 Fri, 21 May 2021 13:12:35 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 38j5qrfn3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 13:12:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14LD0ZLo052766;
 Fri, 21 May 2021 13:12:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by userp3030.oracle.com with ESMTP id 38megnhqnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 13:12:35 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB4978.namprd10.prod.outlook.com (2603:10b6:208:30e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 13:12:33 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf%7]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 13:12:33 +0000
Received: from [10.74.102.99] (160.34.88.99) by
 SN7PR04CA0198.namprd04.prod.outlook.com (2603:10b6:806:126::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26 via Frontend
 Transport; Fri, 21 May 2021 13:12:32 +0000
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
X-Inumbo-ID: 8b8b7158-31d1-461a-86fb-acd4d55e7e49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=pd9iADF2AoIYmkR0KCUndINvq5YCd1FizfhYJYGi53k=;
 b=GArF92PezCxGYZXvmHgAszK+L9fxPBBWwHGwCxu6w4odBH0lWNSZcyQfWKihKL+J6Arl
 I4cXJtxkjht3KZu1ZKuGKA7phNwi+J+QADNKRBS/eft2gL/iIizeC0ZtcB3jfVE89WEC
 vXNvHAKWlQ1kIfHhWuUMXyPerrH3nQA4Yq9iEr0Rv2UpJ37m+tENt58NXn6zzT08G9kb
 jBEZkPRMzs7WFVtQggW1T7m9nq8jG0sy7gLNgrAj+tJRzI8fqfoM+fxEMTiLVOr6MoF2
 q+zyJiNaXxv0Oo+34ao/ArmJ2fO3f9+DuRj7lhKZRTZrHWDPBRjvg3eLEyyQNTg+MiTj qg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AunWRNxw+GgLTv7G2G8CP+iuTlwI1B929+4rzwnEQOssM1eyTNIAItZlHylO+yahhh+0ZNf31ke9OPp7Yo3biVVlvnqkegQZNjwpi7r6WXi8pFpp3dFADt03/mdN8AFlve6V7cpW2kL/6ZtD61uxBRbptyKjC3cat2VtgnQ4b2LirPwZDIMHWeHu9FMyRByjaCJAVbVo1WFBvCxMdKmLGmLqdrbENYcyIP8p9aHuMXDsG+ykc1Mo/UPEdefHPwlAUK4DO00k486M8VVi3ghMMNkLEGtq161DXOtP+g1U5GW9hJpUYOD0KhfvU5hlxpmSNXiZz/1ppPlcHefEKm7jgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd9iADF2AoIYmkR0KCUndINvq5YCd1FizfhYJYGi53k=;
 b=Khb+sFqwJ2BBvvOR0AOlDjP/xr3bYBf1XQQ0oOuhqU32vpb5zbEWLNl2dK4NRyEUfuV+zvpg7FDEwt+/9ZZEIk8ND0gR68QBv6sblzQAgQn0B6q6cSc2AHWmS2EA3t8r9rmbA6Ff3H7wu/QfPqlkgw+bDBSBKgnrafDk1O4D+E/NW1b2x8IBVu0CzNGCt6KIP3xcMJBm9nvEILGpuTlIsoyp8SOtYB2rXegdrziP88CXuG7PHbs9uKwqkndlZ3OBsiE5Zx8yDpMlWBDw3mZA3EbCXnxKK3uAOJlt605F2esBdWrNEMn4wMD22u7J9q9/IrCFTaMhBomwVmFH9Y6NFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd9iADF2AoIYmkR0KCUndINvq5YCd1FizfhYJYGi53k=;
 b=KVdJ0S3R47LKgnm88A6TFZvJkoZOmAwYHuealcz06RM30LYjbeMEHQphrFYPeZBon7neEVGCOpt/7CJV+duBsVgHm28BRt6yHlvKwyq6VABaqaX2aXl3R8V+ScZQ8xvbPaT1snPX6SNgtBYcPOuf99sm6rXRslfd4NQywMatdY4=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH] x86/Xen: swap NX determination and GDT setup on BSP
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <12a866b0-9e89-59f7-ebeb-a2a6cec0987a@suse.com>
 <65bbc317-893e-da41-97e0-c8f2e1feb3e2@suse.com>
 <f594a439-ec1d-34fa-3ccf-b162441fa0af@suse.com>
 <3953076f-c2fa-2e2a-4b07-fb610046a27d@suse.com>
 <89c46d1a-9474-0f17-3fda-4809a14adb45@suse.com>
 <2d019c04-415b-293b-052b-26b1ea3be189@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <0103d46f-4feb-e49d-f738-a2bf3d38c216@oracle.com>
Date: Fri, 21 May 2021 09:12:29 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <2d019c04-415b-293b-052b-26b1ea3be189@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [160.34.88.99]
X-ClientProxiedBy: SN7PR04CA0198.namprd04.prod.outlook.com
 (2603:10b6:806:126::23) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75e14976-763c-4556-c0e9-08d91c5a1884
X-MS-TrafficTypeDiagnostic: BLAPR10MB4978:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB4978436925EE7AED8C0539DF8A299@BLAPR10MB4978.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ILz57p/o4t6Sm6Y+pYLmutca0flY3rTgFewoEVoXteNRjuSVMGLJprxhojUrPzl8QIwhQ2gw+vROWWaqzpRrNxTbLw+WHWKmG1K0zi89SBw+oImgj0UmyhkEXZ+ZWoyfwLJIcuwVf6lwT25T13kGiSFg8x9TwWuwkMtjADPY9oW214OsZ7gyb1/QYmamu5DV42DELH7/lGfJM2ClxhhsNDkh0lf6O6mKHciwAz/apXQ6mDeWUbTb8wMfbQRLENx3bj7hYTRmj9tIlFRQKOmbh54Q0SrKusOnGHIekMqLw1H5i4VH5q5QWUXsrIsB7G7yhDNfXHUNPrCO0Oe/3Vw5NlOocudLPXiPQYJXV5yGuo+BkI+lFxjj8+EhNht//id4DURco1WZk5CXLHXxj78+WSjzwI08g3BicN5yIEjZ3v9V5hE7xMbgGNeieGEZTNzLjqSY5ifzN8b8V4CYpmkpGyowvKFa8UfSL7x+5ZZKrVGWstgvALIj9Z0bLcJqJE2UbaWyHh9bA9UZffZeltvNhATq0zR7GBCg9CWxhK5b60lvxbb1yN9ajNaRcGWYOC+mRuiJAjDrzNAQ8SOOKGS1mdP64nv7+wvG1Rw+7p3rDX1Vz8/rLl/4NTk7QDCbAf+MHidVIjjuw3pyWxHY/G10ALEau9+G6JfVSnpHOTJG1nkrlm78LxtKdX7WqicZwR/j
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(346002)(396003)(366004)(136003)(478600001)(66946007)(8676002)(26005)(956004)(2906002)(8936002)(186003)(66556008)(66476007)(16526019)(53546011)(2616005)(110136005)(31686004)(5660300002)(16576012)(6486002)(316002)(31696002)(86362001)(36756003)(83380400001)(38100700002)(44832011)(6666004)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bWVZY25IQXBBZjd4WEgzUUFKbU9PMkdYdXhLR3JtTFl2NzVQREdsdW94bTNn?=
 =?utf-8?B?TG5YbHhva2xJY0ZoMmtJUlZ6MW1zNnh1VDVDRzF2SzNxbTlDbCs1WTFId2hQ?=
 =?utf-8?B?bjhzR2tjbitaaENwLzV1T3l2TmlZVm1HK0RnU0hNb3ZGTVBwUmZ6cDllZ3Vi?=
 =?utf-8?B?WlZkV0wxZEdaWjZWeGJJcXlxYlBxT1RnWXlVMWVlblBtQkFuZTlrT04zckRw?=
 =?utf-8?B?Wmg4MGE5Um9ldmtwZEI5MzRaS2xuS1RCUC80SVRUYnpRcTNxcFdUQWE1YUow?=
 =?utf-8?B?MjNnY2VMOXRwVFdkT05MSnlwc3dHQ3grLzlKQldtM2tkcll3Z2FWaTNDZ3BF?=
 =?utf-8?B?ejhNVGdVNUhXanlqUjdxQzlGM3RLbFoxeFR1TzU1emozbEtIQ1pHYVlaNURH?=
 =?utf-8?B?M0ZBbW1MYW80bDd0Z2RPcXVhbHVQd296dEZtWTBhclNsZk4vMk0walFocGJi?=
 =?utf-8?B?ZGpnWU1pQWx4YXFCUkZCK0U3cnptUUxBeWQwTGR5RVhNRGZoaUgraGU3cjJz?=
 =?utf-8?B?MzBLUFl6OE5vZ2RGUVU2M2NPYm9Xc21rRHdoblhHRkNYaC9pcDQ2dTFpRFJB?=
 =?utf-8?B?cjZOTnY5WTIyVXlJcUtZNHFEQ2JIeVhLOEJmUDFYQUdCUlBZdDBpWUdqMkE5?=
 =?utf-8?B?NllwNjh2VkFSYjlNc2NoREYxRGxCWHFYdG1QWW1PcTNXWlRzdldKcEk0V0Fp?=
 =?utf-8?B?YmJBOVF1Y09FenRod1k4aW5INkxIRW9aM2FRcGo0cVJWRUROcWh6T25KQzdv?=
 =?utf-8?B?VUNZNjFzMllJZlFCOEN3U2E0MDZNa0ZaOURUTUFYaVkyTWt4cldtWjE3SU1H?=
 =?utf-8?B?ZENqYUV4RjAzT0krY2JRYURYb3JoQ1ZTQnk0ZVdzcndZT1ladkpTKzRqU1c2?=
 =?utf-8?B?VzBzY2ZwNXFPeEFDd09LbVVWTC96U1M0bTBVMTdSZkFwcUQ0eXFUdXRGdGxm?=
 =?utf-8?B?dENoYTFXajVWYVBJTjd3cVBxWWtIeWxheWxBR1I1NXROa3hHMzFDNHZzOGdK?=
 =?utf-8?B?SVlDem1YL1RTY0grMllqcFRNN2ZYTW9Wc3lJZzJMUno2VDd5b2ttOVJMWWla?=
 =?utf-8?B?c2dnL0hMVHF4aFc5dHpmTHBkZ3F0UlIvZHE3MElSSG1qdEhRMEpGWURjTyta?=
 =?utf-8?B?TXJTczRoQy9TaWowRE16Z0NTK0tQQ0UwQ25TaDVwOEV5cVZjY21OVXdsOEVx?=
 =?utf-8?B?OGJXZm9QOTVlQzZ2Y0xrQXJ6dnVPcThpQWVTd3JwS1Z2UGRHbDNUajdHVGJY?=
 =?utf-8?B?enk2Sy95NFFIMmxDc1AzUGd6YnFzWHhvbEJwd1ZMTi8xVDh1b0JDOUpRR216?=
 =?utf-8?B?YTZNMkV4R2tWUFA1RTRtZXNkZlRLS1FHaFo5Yk9JQllRSlNrMDRlT3Z5Um1X?=
 =?utf-8?B?MUdyYVVvaWNXV0V1aXZScHZDOEN5OWQ0ZFRnbE1vV2NEQmh3aVV0Zm9WSWRo?=
 =?utf-8?B?VnFJZ3FQZVJ5WlFPT3ExdStrRFRGRWpBbVZXRFpOanc2WXNyK1YyakFzUngw?=
 =?utf-8?B?em05enNYYmlSS1VMMnZXUGtwWUdaSTYwN1RjQ1lFdUJwbnZEdDlCQThsOHR5?=
 =?utf-8?B?MUZWQXFhUUpFb2RTUXBidjVESEJkeTBtZTB1WGVRS0tSeXYrTFRsMm5WZjlF?=
 =?utf-8?B?cEJRR1N5V2JaeVhoMUh4WW5zRG5uZnJtRFBsaTh5ZzFTNTd3K29TL2VaY05t?=
 =?utf-8?B?ZExqL2xxWk5XQ2NBZkw3bjg0R1NwQWd5NC9TT0RCUDBZRVFrUVpVb2tqMGx6?=
 =?utf-8?Q?Nfd8QCqExT4SUa710FsQ/COuuwtusMhZZJuxe2y?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e14976-763c-4556-c0e9-08d91c5a1884
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 13:12:33.5037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nM9xmyn9dLvV2Ou9ZSP7SFwIK7OkwTt7OyYBsl5UvYLLNePoZ71UscViDQMvb7qo5MF+zdq7pa2kdyzqGWkiFOjFEg1H/Z8T4awnmkDt7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4978
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9990 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210077
X-Proofpoint-GUID: FGtvg42JK3_Av3hOdqYkxJduk5Ai-vA6
X-Proofpoint-ORIG-GUID: FGtvg42JK3_Av3hOdqYkxJduk5Ai-vA6
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9990 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 impostorscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210077


On 5/21/21 3:45 AM, Juergen Gross wrote:
> On 21.05.21 09:26, Jan Beulich wrote:
>> On 21.05.2021 09:18, Juergen Gross wrote:
>>> On 20.05.21 14:08, Jan Beulich wrote:
>>>> On 20.05.2021 13:57, Juergen Gross wrote:
>>>>> On 20.05.21 13:42, Jan Beulich wrote:
>>>>>> xen_setup_gdt(), via xen_load_gdt_boot(), wants to adjust page tables.
>>>>>> For this to work when NX is not available, x86_configure_nx() needs 
> to
>>>>>> be called first.
>>>>>>
>>>>>> Reported-by: Olaf Hering <olaf@aepfle.de>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>>>
>>>> Thanks. I guess I forgot
>>>>
>>>> Cc: stable@vger.kernel.org
>>>>
>>>> If you agree, can you please add this before pushing to Linus?
>>>
>>> Uh, just had a look why x86_configure_nx() was called after
>>> xen_setup_gdt().
>>>
>>> Upstream your patch will be fine, but before kernel 5.9 it will
>>> break running as 32-bit PV guest (see commit 36104cb9012a82e7).
>>
>> Oh, indeed. That commit then actually introduced the issue here,
>> and hence a Fixes: tag may be warranted.
>
> Added it already. :-)
>
> And I've limited the backport to happen not for 5.8 and older, of
> course.


Did something changed recently that this became a problem? That commit has been there for 3 years.


Didn't Olaf report this to be a problem only on SLES kernels?



-boris


