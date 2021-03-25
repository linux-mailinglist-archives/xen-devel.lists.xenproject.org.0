Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5CC349C91
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 23:58:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101556.194360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPYuc-0005VG-N5; Thu, 25 Mar 2021 22:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101556.194360; Thu, 25 Mar 2021 22:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPYuc-0005Ur-JK; Thu, 25 Mar 2021 22:57:10 +0000
Received: by outflank-mailman (input) for mailman id 101556;
 Thu, 25 Mar 2021 22:57:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dmdg=IX=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lPYua-0005Um-Dj
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 22:57:08 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75e8c25c-66c1-4eaa-a019-d1772132c0b3;
 Thu, 25 Mar 2021 22:57:07 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12PMt9HB112748;
 Thu, 25 Mar 2021 22:57:04 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 37h13e8d89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 22:57:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12PMtIRM182826;
 Thu, 25 Mar 2021 22:57:03 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by aserp3030.oracle.com with ESMTP id 37h140n4bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 22:57:03 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4340.namprd10.prod.outlook.com (2603:10b6:a03:210::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Thu, 25 Mar
 2021 22:57:01 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 22:57:01 +0000
Received: from [10.74.101.239] (138.3.201.47) by
 CH0PR03CA0285.namprd03.prod.outlook.com (2603:10b6:610:e6::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 22:57:00 +0000
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
X-Inumbo-ID: 75e8c25c-66c1-4eaa-a019-d1772132c0b3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=EzPllQmjJ2MAsdxWEpVbMU/4HFnw55suz1Vf+Qgmp8o=;
 b=ezKt0RoSUO/x38TlCk3BB8JdFdq+OaO3kCHqVan9MuApOoCGnm6/F1+0SxUxZyzcBLJK
 x/38tIcY5FyJ4ofobZjFVbnv/LFzytIwrPJYtauj/fG9du/rHZfNq9x0sXfJyTlwm6Di
 O4QvOnGx/EfNntogrzhgUEp0IwKyvW71Dp5Ce+Sy8aRHIDJe8n/n7Y8idQdgcF1KfT6M
 q25pb8Q1Kp9sU8TFFh28n5acasjNaQJXuR7CWrhJL8wakZfSiDV4Pv2EBlB+b5qe+lfU
 m/+MoSe7PmYdcAJVNdJOCU0bSOBHLLBnaLG03MVQosWpKZH+Dk5rNcFgas3ZHHtZy3qG pg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzHFnq1mLxCO2zln+KgfJRE1oppDnK4dcGZxZqfEurOD1hCsi3vL/ntSigPTf9oH3d6LozU9hHrmM3Zz2PfyIlN4wKpoCi20KBZuACjaleFEL/2xHzLLEBU3YgKnVhxI63B0fhANYq05p9CqqRb4IJ48LZfuWU8uX86zqXVQswTQU/1rrS1L3iBXsziOPnmZH85ogMi2PQJdRIFVs8NyU0aeZphtsbPLzbJDDflfjPgiXK1bNQEym5NqNwQqqLIe2zHB/I8qKc1JoovV6OeEvU1ZUQAyi7S70cWC5lPhR/znnV1rk3ODgjvw1ywspzhd9NQsy9fy8GBlqCkffNR6xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzPllQmjJ2MAsdxWEpVbMU/4HFnw55suz1Vf+Qgmp8o=;
 b=PfU6LjUia6xjBqTmRbhfg5+INxzzA77cE0WA9CzmzpRS7/T+Ouo6MqGLd9rY9rk8oUNZ9El4+Y8qwWNfLBCQ3qVGv0mbinkM7//wEk2QWgD2Kl+siK81ol4D7BiS3jZ//MATrKnGRXyKwtf3QAYgN8aVT88foG+dq+eZ9PrV4M+KdX+RJF5GCc4YQ38egzi44WEoPRR2uCDZR6UYR9U41ZQ3wXhbTkH0D9aoE1kvXMyeBUdcv6K0q2Bt9Xd4C55i6yftBPQiH7nVXqAcK+eHTT+dUG2zh9o23a+DKEDAlQOE/4YVqcrQk3tzxovQ5bfearjJuoYoHlF+EdehHui9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzPllQmjJ2MAsdxWEpVbMU/4HFnw55suz1Vf+Qgmp8o=;
 b=jHE00/XxYg8YwP9GE+qhh4BdwlOdszEs1Ye2H3vR4L2LpK6AnSTN8R7iPxHhND1FgrnPYVifocAZEMAGgJs+oyzBQp/70+ItJoYClq7+cTqW6xDKze8qWZy1glV5TPBcGNhTkApKWAZ4Iff6wh3TD7Oz52q7zlDEnvi05JygwBY=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH v2 0/2] xen/x86: alternative fix for XSA-369
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Jan Beulich
 <jbeulich@suse.com>, xen-devel@lists.xenproject.org
References: <20210324122424.58685-1-roger.pau@citrix.com>
 <6b70700e-667b-03a7-8f5e-937d5c45c79d@oracle.com>
Message-ID: <62cde005-9aff-39a2-0b4f-eb262b411d2e@oracle.com>
Date: Thu, 25 Mar 2021 18:56:57 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
In-Reply-To: <6b70700e-667b-03a7-8f5e-937d5c45c79d@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.47]
X-ClientProxiedBy: CH0PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:610:e6::20) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0eb42eb-5422-44a1-1bdb-08d8efe14d04
X-MS-TrafficTypeDiagnostic: BY5PR10MB4340:
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB43401BAD65D62D6AD228D6848A629@BY5PR10MB4340.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u6wAxLNl0WNWBSZP4mR4ATFqC3SSLebgrICEjkBTu6fXU/3ChEiaQ0/yxfuH7+2B3NEb8fSdOqxIJNG26omvS36rujjzMsIfENLBT9e+CJuCnk+cQ3IkJO08W73W6pr9z7c1TYTGebZd9R9wquM6r6+L1/8IuRp6r9ZdMx0CexCckMpfxUOGHaFLSkVm5wOK/w2b3OhNJJiU6o0LU+csG/0GqQip27XDJsUx2/Zm3PyVVvANyyvKxep7knPvFOoY4Sxd4FFo49GAsk34TZH9c9djHf70LIoyd1eE/jHORXMY2yFUX/P/VawbqmVyn3/fZQ1Ijkgb7zFYmRRpyjDOsF/YCLRkLgbnw2Ub/vKh8vnOGh1pVlfWKu07Lq00CnqRDmBpDa6bTGglQKQUgQ9oSbv8geJMmqsomTelV8zr4fe8xsMpskU6cjuQ2AV2BxA4bZ/4eazTdBBttk7BmpjgJyIIGe28xi2f20sDzT0mQAams0CC0zDkdm8kKN3/iq37cZDUJTSaWCedS5mgPFgQQd7fGsaId8BV/mKc/iNoiVBWbUmNX9grHDYexvzql/ZMBBOc7NTG6mn9T3mRRWoVBFUo0wceB9qAbZEPHsCs+2XCYcLmp/aoRPWBKntw0xdmkddTiG8FHainmC5O78DOh1sx+Lc0msZZwaRt338N6qKWqgsEJtOChE7rjV3aaEOSJCFor+bUSY9haLzRs6YKlimyHl9hFuJzsgoGyGuuEF0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(346002)(366004)(376002)(5660300002)(186003)(44832011)(53546011)(38100700001)(36756003)(31686004)(26005)(31696002)(16526019)(2906002)(6486002)(956004)(4326008)(66946007)(2616005)(478600001)(66556008)(66476007)(316002)(16576012)(54906003)(8936002)(8676002)(6666004)(83380400001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eENhRmNtWnh3Ui9udkowWVc4NE1KZ2ZGU0NWdHpIOXR6U1o5aXV0YXMxa3lQ?=
 =?utf-8?B?akc4bXFDNWtwM0JFeXN0MS9aSkZCbElKVWRZOFIrRUF5ZGE3WWorR3hYL1dt?=
 =?utf-8?B?RzlHS25FSW9qMFhnNm5wRk5IY2xZSktwMWpHN0VUZDdRS3JRRTI3UWdxQXJH?=
 =?utf-8?B?czU0dTNqZHJhSzJjLzdRbk90VnRuT05EeWYzNjcyK0cvTEJseTA2RUpDT3pi?=
 =?utf-8?B?TWMvUDI2ODc5SjNTK25PWFFxczBXNmZ2Si9nWnJ6c2QxQitYTDI3SDhlbnBM?=
 =?utf-8?B?WDN1Y0V6cHRUR3BlcVFIM0ViSldLRmM1a2piSVNTSEVhOUVyZUNCU3NSWkRy?=
 =?utf-8?B?VHVzNmtKTkE1ektkZXlsUWpPTlZTZGdzQ3pGdGZsRndTWTY4YUM3NEVuaGhj?=
 =?utf-8?B?RG1tTzBuT21ucVNmNmN2c21tdSs5UVRGTHZQMzkzMVdzMkJkeHhZaXd1TE9J?=
 =?utf-8?B?bERoZzMvSFR6OFQwS3dQMWlMSkFRZUljTDg5Y01rZjdUQXo3amFHbjNNTnBz?=
 =?utf-8?B?bmVYbWpTZ1FCS1JxWGN5UTRJQ2JScHJ3SWRKUmhXQk03ZDJWK1R4NTU4ZHFE?=
 =?utf-8?B?aVpiLzJrdmNIMEI4b2tOSVJCSjJLWXg4aVhHMzlSU25Dakl5eFQ5YjJESy92?=
 =?utf-8?B?ZjIzaW1ucUE2ZUxRaTVsaUtrcisvRVZ2MkJLcDFBU29QTXRTclVwRXp1WkFn?=
 =?utf-8?B?QTllTkZyVUU5L3RQSVBKcUZ4R0VxTG5PVVBhVmNsUWUzdGI4K3lZeC9EalB6?=
 =?utf-8?B?RksxaHgzWDk3bXNQUXdzMWlUbUx4SE1LWXZhTnRBTlkzbjluY1c3aU5TSUZ2?=
 =?utf-8?B?V1VSdmhRTlVmSThKS0huaVRPVThRMnN2OVpnOE5jRmFDMGlQSEJmUWkzTGFY?=
 =?utf-8?B?cWpqVElhOWpCWGZsR2NIUW5jbmVOakRycXR1Njg1SWhnZkxPd09mekJkeVZs?=
 =?utf-8?B?WklYYms0V2lqNzE5RXBGWGJNb2FtWjBiZitEdTB2MDIvZWtIWGRoTnJFbFBT?=
 =?utf-8?B?YW1ZbUQvVkoxcDl3UDhRN0RiaVN1NUp0NXhBTm1hUEJERVQvSlZ1cnRrRHdp?=
 =?utf-8?B?SHNVbzVhUzhocVdDMEozTEtmYzI4SW1remtoQlBxSVdkL2RiMlRqZ0RFUnUx?=
 =?utf-8?B?ZWZ2Z0V3R1BQMUc2eStCMDZJZy9KOVpmUWl1bXo0SDA3ZG5LK1FNQnJta0pP?=
 =?utf-8?B?VzlwaEl4dnB1ZUVtd1d0RFRZa005L0h5ckZvNzVjTHBUYkpIVW1EbC9tMVMz?=
 =?utf-8?B?SXVkMGtHMDZ4OTRmUGc4WVQ1bEJ1ZTkzbjZzN2d6Kzg0czFwNElkeS9WSHUw?=
 =?utf-8?B?ZWJSbDBYTEx5V1pZdEo4ejVvT05Kb0ZNd053NmJjNEFNYnVBRU9lUGtaSHRX?=
 =?utf-8?B?akxWVVNJSzZLQmlrWW1Dc2w2M1MvTlpyUmwveHN0Z2F2VWRZZUxlRkcrb25h?=
 =?utf-8?B?SnBFSUFoS2NwV240WFNQZzVBaUtNUWNaRlF6VWRxRDMwQVVEL3YxS3BTSXNn?=
 =?utf-8?B?NFNDeDVidDRob0N4TkdWeDNjUU9tM0MxdDJBdmFIakJhWGlLUDUweEI0QUJx?=
 =?utf-8?B?d2JTcTBFNHlvamwyRi9RVjcybW9vRmVYL0g2dUYweXBxVjdEalU2NXBidEZY?=
 =?utf-8?B?K01LbmpaRmU4VzB6bEhQQks4ZFR2dWpzL3NPRkpWM1VxNzRaMnhaQzYzU0Er?=
 =?utf-8?B?dUFzS2tIUXdlZGxSOVFVK0JuMys4MERHS3NZNElidWZsVUw2V2dqTkk4WnlF?=
 =?utf-8?Q?4iWTx0Nqm3t2zmP7FH7kDXCky34d+G9CxhHuQMo?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0eb42eb-5422-44a1-1bdb-08d8efe14d04
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 22:57:01.4588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZd4EPoEB+LiklUJ1kXWueADHMoUqKR6qXVdOnlmJDcTSHPFggfA5UZE8Vt3Uj/ks6ZZsR/1JoorYaCMW0ax895/ia2tTcl26DGq+BZTuaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4340
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103250169
X-Proofpoint-ORIG-GUID: uYNVyr4eGFm5HZDWJX-UssneCXGmvXK4
X-Proofpoint-GUID: uYNVyr4eGFm5HZDWJX-UssneCXGmvXK4
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103250169


On 3/24/21 7:09 PM, Boris Ostrovsky wrote:
> On 3/24/21 8:24 AM, Roger Pau Monne wrote:
>> Hello,
>>
>> This is a proposal for an alternative fix for XSA-369 that instead of
>> special casing XEN_UNPOPULATED_ALLOC to size the p2m relies on making
>> XEN_BALLOON_MEMORY_HOTPLUG_LIMIT depend on the generic MEMORY_HOTPLUG
>> option rather than XEN_BALLOON_MEMORY_HOTPLUG.
>>
>> I think this is safer, as we don't want to be special casing any option
>> that pulls in generic MEMORY_HOTPLUG without XEN_BALLOON_MEMORY_HOTPLUG.
>> Without this we would also need to at least special case ZONE_DEVICE
>> which also relies on MEMORY_HOTPLUG, and is what pulls the generic
>> MEMORY_HOTPLUG option even when XEN_BALLOON_MEMORY_HOTPLUG is disabled
>> with XEN_UNPOPULATED_ALLOC.
>>
>> Thanks, Roger.
>>
>> Roger Pau Monne (2):
>>   xen/x86: make XEN_BALLOON_MEMORY_HOTPLUG_LIMIT depend on
>>     MEMORY_HOTPLUG
>>   Revert "xen: fix p2m size in dom0 for disabled memory hotplug case"
>>
>>  arch/x86/include/asm/xen/page.h | 12 ------------
>>  arch/x86/xen/p2m.c              |  7 ++-----
>>  arch/x86/xen/setup.c            | 16 ++++++++++++++--
>>  drivers/xen/Kconfig             |  4 ++--
>>  4 files changed, 18 insertions(+), 21 deletions(-)
>
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


Applied to for-linus-5.12b.


-boris


