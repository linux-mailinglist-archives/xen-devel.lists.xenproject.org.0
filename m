Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420A2322DB1
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 16:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88834.167193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEZn8-0001fd-1W; Tue, 23 Feb 2021 15:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88834.167193; Tue, 23 Feb 2021 15:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEZn7-0001dw-UM; Tue, 23 Feb 2021 15:40:01 +0000
Received: by outflank-mailman (input) for mailman id 88834;
 Tue, 23 Feb 2021 15:40:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUnP=HZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lEZn6-0001dq-Ut
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 15:40:01 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba446f7c-3ba6-41e3-9319-b234cd5b4846;
 Tue, 23 Feb 2021 15:39:59 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11NFOF3U010867;
 Tue, 23 Feb 2021 15:39:56 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 36ttcm7scx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Feb 2021 15:39:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11NFQiAb127810;
 Tue, 23 Feb 2021 15:39:55 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2054.outbound.protection.outlook.com [104.47.36.54])
 by userp3030.oracle.com with ESMTP id 36ucbxm8f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Feb 2021 15:39:55 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BYAPR10MB3526.namprd10.prod.outlook.com (2603:10b6:a03:11c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 23 Feb
 2021 15:39:53 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3868.031; Tue, 23 Feb 2021
 15:39:53 +0000
Received: from [10.74.102.180] (138.3.200.52) by
 CY1PR03CA0017.namprd03.prod.outlook.com (2603:10b6:600::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.28 via Frontend Transport; Tue, 23 Feb 2021 15:39:51 +0000
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
X-Inumbo-ID: ba446f7c-3ba6-41e3-9319-b234cd5b4846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=XQMt+fQEixjcF+7rhvfkQDyu9DhXQesKMvPb844wxpo=;
 b=SlZyYu0NrlWShd05kX3wWkvgNBhMkPvj52DU8NjlcPWXZjocgjLobZCPiQn+4q50ModC
 zH5Kg3QLCH1HnQkVlGdE01kgXRg4eb+nc3BjFhRzl9HYoXh3ROsYf7iG2I3V5bk++KGp
 XkZfZvZncu85XXeKS6JGayKieJG2eXCWNOSTjZWDXmZnrCx96mIUGMB4MBp8kPPdyY+d
 O4is4r3dY4rpvg/qyn26Hbe8if1KNysVjhdn77ppqs4KPrTILUMhRorO/rrwz3SUKlm+
 JnMCbNCqK8HC1uMVU3NJemg5fcRH+U0ORJk6RPiy0V1UOlklNtwRRkyH6KzEh/ujNRaz Jw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2NCvypqyyeXd8mTAOpBGV7dhG+LLtfdXgw1B2GFOFNbyjcBB9+SznQfCTHegubBIV55NdPznynu7oSbUoWAMFlu64+2GpUtKeKNwPzibh6yc52juRUmpQfo9SjUP8vwdXJGT2n2xWWrL8Fh6feHu/De67swj/CYmOs+LzgE+rYVTmXQ/bhthKTpOvMMuHsgmailM9J74WkO7+BcuPG7kVsCfBL1xpp/t+T2hbSilMiBmoDbZYwJ3AGti5iE3cdCHJxscuAvmUWMwNrgn5CywuaMi5JgLXl9Y+cXXae46RmgMSjSIgJZTE2GNzTXFYVn99+21KKVfexikzkuPRLCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQMt+fQEixjcF+7rhvfkQDyu9DhXQesKMvPb844wxpo=;
 b=QyBYD/jljFbP9AGna5kMUQlJL0OS3zj8y56d9tMf6qapS8Dp2lLH17w1jaNUwS9abJBxCcsTW2TcfZfOE1SD/JwBTRGIz01r1X1aNchVfFYwT13HstBzZw8y2fwBznizY03f+rpxZ6Foq4hlCKobs+0n+eBYM47F6XZxIhb9qzIiVNZWnONPKPImEeO9HijJv4+EKuYvY9+vZjXanyVuan5PUdd39cGAETDogVUCrW8Kv6MepI3I6Uj56Gg2UuTymeViUanSXLu2YrkbFrykjK7hrBdAyzh2ZmuwBOJgTBc4yLPtWLPUIpcNo4ByZYArnzNAxMoYm0tuXQJMD5Fs1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQMt+fQEixjcF+7rhvfkQDyu9DhXQesKMvPb844wxpo=;
 b=H4iOPYINgDVlwoIh/NsmJLQ6tOh1QzdCww7+ZLBCXZscAUmCELTzBTwQOySb4FiAAY5sZwzxVYFT0P5ets31MSpjZOEN4JfKaKDSfArSlP/67AGOTQnJRB/LpFgNa2So1LzH2D9Ipoo9V8vmctlJXR/baTuBNfvJPAD0ahDVlLw=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
To: Jan Beulich <jbeulich@suse.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
        iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
 <YC5GrgqwsR/eBwpy@Air-de-Roger>
 <4e585daa-f255-fbff-d1cf-38ef49f146f5@oracle.com>
 <YDOQvU1h8zpOv5PH@Air-de-Roger>
 <ce2ef7a3-0583-ffff-182a-0ab078f45b82@oracle.com>
 <307a4765-1c54-63fd-b3fb-ecb47ba3dbca@suse.com>
 <YDTMIW5vBe0IncVR@Air-de-Roger>
 <2744f277-06fb-e49f-2023-0ec6175259dd@suse.com>
 <YDTyScmud26aiaMi@Air-de-Roger>
 <172dfcab-9366-47f0-9c56-2202a8b7a7db@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <3ae19e76-2543-28f4-9c7f-697ccf9ed202@oracle.com>
Date: Tue, 23 Feb 2021 10:39:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <172dfcab-9366-47f0-9c56-2202a8b7a7db@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [138.3.200.52]
X-ClientProxiedBy: CY1PR03CA0017.namprd03.prod.outlook.com (2603:10b6:600::27)
 To BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6f08dfe-c7ce-4ed9-6541-08d8d811438e
X-MS-TrafficTypeDiagnostic: BYAPR10MB3526:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB3526AA95BD1BB708546742458A809@BYAPR10MB3526.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ea6hcQGEWnZOeSQBFe+zh6iN5YuotWyNtmLIucMYpQ6CLEmdpMxVXULzskMX4yXiJSQTsYhO2tqMtoZHVCGS5ESHrcPPea7ULjfzJCwv+ippkwEaOe+m85Kc4BOC3+rMALOWn3croXRPZRzQfZCTNpjof9bqWgCNEVZZf8ZRPfmarnbbyVPZxsG5VKQblg8yI+AqlJJ7/uPvR1YBWA4qk+k+G4w/vvrQBEyvxrkwubjKCYgZQjVvoElsUY7URXWEOvMkCSOcsPHFSWAF8q6TuSgC0SQvFFJgu38CxNW7kCqZhFV8jW/JxXU3FkbbdVRfxaBroHo8HBV2qA7XtumfgGN79RtyWFTmMwtTw55QiddzvS51ipfTGKiiV4Wy0rkGTnJKNEfYKq4A7EVzdAR8KwWF124GbuUJZ8T/OhsEXu6O11DR+MzlM7XFktrp0nT/bRvOfSN2j2asZqWspPoTK4Pn6aHYOw3DGKDGykZSP5rA1zRsCILuVgpKJmisDgZuyTQMsfbY/jYXlwvQzYxl0R3hpVxEM7Hk3edzPoqGKPGEl6tWDp9kqcGVnyCrrAx6lnXDNtJ+GZerHjkEE8v5fly7fWBYndf91Zqzi1vQJmc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(396003)(39860400002)(366004)(376002)(16576012)(4326008)(956004)(66946007)(6666004)(44832011)(478600001)(66556008)(31696002)(6486002)(316002)(86362001)(66476007)(31686004)(83380400001)(2906002)(5660300002)(16526019)(110136005)(2616005)(26005)(186003)(36756003)(8676002)(8936002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NDRTUElGR1V6aEQrbHNIcjd0aXFGcnhhdjIvR3E3c0t5VjRpYW9rb1hFQUtU?=
 =?utf-8?B?Z2QzdnRyQk1qb1BiOVFHOXdqZyt4SzJKd3ZlQ2JOdlNkUUxUT1FOZGJoeG5h?=
 =?utf-8?B?VWo4QUFPQ2kxbEJ5NDN2dVg3ZmU5Zng0NjVHV1o0SFJPd0NjclRiSVlSSUNQ?=
 =?utf-8?B?NFR4OTlnTHFESjVDQnBzbldjSnYyeXlVZzNMSUhTbEhJeFRGQ0FEMy9TUDUz?=
 =?utf-8?B?ck9nQ0ozY0JKS0hQY2FqZmt2ek9DMGFMQ0xDQWJrRUlPVUt1cWJ4eElGNFJw?=
 =?utf-8?B?dkhuR0RLUGpLQnYzVy9OTVQ0eDE0Sm9NQjZ2UFJUV1YwdG1wSnlVZEV4Szlz?=
 =?utf-8?B?ZGw4OVl0S3MrOVI2SVVrc2daVWJ1R3gwcTJqemlOMWtWc1B5NElrNG12dXJZ?=
 =?utf-8?B?SFVvcC8ycmdNSFhWNm4yKzdHMWJ1b3dFenh3SUpNaklKVkFQM1lBUnkwUTFu?=
 =?utf-8?B?ZnBnaW1qcGdrR3pkQ3h4ODM0TEY5R3RwK2o2RzNwRWVhZU1TWCtrVWhqUFc0?=
 =?utf-8?B?ZHhDczROR0F3WWNSTHRZYWhUM2Q0ZS9mZ0RDdWNqRlRBaW1DZ2dydm45ZGN1?=
 =?utf-8?B?MlVReUxwMW9LYXYxb2FiYk8vYWhVYXJGclBzTnYyVWhBR1FYVU9JbFdTRXlJ?=
 =?utf-8?B?M2tsdUxZUUdkQU1YaFNacTJsQ1FUYW1pdmNWc1N5b3FBRXBzTS9mZjYwRy9r?=
 =?utf-8?B?Um9vektEdUdTekRTRDRMMGduNEdJMmNUYlpnaXpXSjJHZ09BQzQzanEyMllQ?=
 =?utf-8?B?TXZUTDMySHRZVUpBYytVMzlYTzlmU3UvbjV3U0ZQeVM2ajNGV3NadlJvTTJz?=
 =?utf-8?B?dDJNWXZrOXRCTGdCMkV3S2tTRThad3hYSEhlWCs1aUhBYjc2Q0dsbkNZMUdk?=
 =?utf-8?B?NHY5M293M1FYUVFkbitnemlvT2R3QkRQejNmYUlkYkZ4dWY5UXkwK2FtM2FM?=
 =?utf-8?B?aUpMaVUxVVgyU2tNVDRTSmU0NURVbXE2M1dYOWg1cHplWTdDVHFLNUpFbGtv?=
 =?utf-8?B?bUlpM2M0c0RBSFhLYVlmekw3VTg3K2EvSnFRMU5laUpzY0RkajRkRndFak9H?=
 =?utf-8?B?eHFRRWFDSWVialhSK1V6TVZGSjhaaUxJMWxKbnNQamJrZCt0MTAwMGdtTis3?=
 =?utf-8?B?bW9IUEo1SWgvckVTd2tkTElLSWV3bWQrdm9zOUg1QmJrbFhFTitkaDhYOWtw?=
 =?utf-8?B?dHdNcHpnQ2tIbUVvYmFLWHY0YUYxYmtYWlRVQ1FXRmxtT0JuZjJKeElIZlpB?=
 =?utf-8?B?RlVhRW90R2FCMjh2ZE9WbDQwOFlhMDhmZWhKUjhLSTJVQlV5SWVWQXlSU0lr?=
 =?utf-8?B?S1FLVDRJMDN3aFZid0V2NFdrQ1NOTWFNUksyVHpjVXFUanQvTzdPWDQvNjl4?=
 =?utf-8?B?YVdsV0hyZldONWNzdHoyckhZbGlHSk9IcW9xczFJbTVDWnZ0V2ZJdnpaWnox?=
 =?utf-8?B?dFBCRTRWQVNmNU0yenZibDVCeFlUQmFubmo4dGI1QjhDYlJJaXRnS3JTdXdy?=
 =?utf-8?B?K04vakREVDNUYzNFUlBlUmR4V3JsalM2bkF6YkRyUzh0QzVCQVRRTnJMcXRu?=
 =?utf-8?B?OUVRZHl2VGx5YVFpUGlMVWpIb3VVN2JaN0xsMFJzbHV4TFRNajdpRGFKWXBq?=
 =?utf-8?B?NlkwWGRSRW83blJHSjVYWUc1cHRpQTFSSlloRDZPOWsvZWtmeDVhNmZweEpE?=
 =?utf-8?B?eWJBODdWaWg0Vk1IL0ZBYXphKzY5OXc5N09PUGVjWjlpSzR1OE1ES2JoWENa?=
 =?utf-8?Q?uwJKE7+9KlAwVWBpLwFTfCIlaf3NzvHJSGAwUVw?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f08dfe-c7ce-4ed9-6541-08d8d811438e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 15:39:53.4802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZqmXYNgzlSCMI9HM6ijZXQX33SnpvtuWtUOSf5DrajIt9s1Tkmh0hqnxxPoz5sLw2nTXKRRfRlRBY7929y5FF63PvZgK58kyECFfdTxomc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3526
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230131
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230131


On 2/23/21 8:23 AM, Jan Beulich wrote:
> On 23.02.2021 13:17, Roger Pau Monné wrote:
>> On Tue, Feb 23, 2021 at 11:15:31AM +0100, Jan Beulich wrote:
>>> On 23.02.2021 10:34, Roger Pau Monné wrote:
>>>> On Tue, Feb 23, 2021 at 08:57:00AM +0100, Jan Beulich wrote:
>>>>> On 22.02.2021 22:19, Boris Ostrovsky wrote:
>>>>>> On 2/22/21 6:08 AM, Roger Pau Monné wrote:
>>>>>>> On Fri, Feb 19, 2021 at 09:56:32AM -0500, Boris Ostrovsky wrote:
>>>>>>>> On 2/18/21 5:51 AM, Roger Pau Monné wrote:
>>>>>>>>> On Wed, Jan 20, 2021 at 05:49:10PM -0500, Boris Ostrovsky wrote:
>>>>>>>>>> When toolstack updates MSR policy, this MSR offset (which is the last
>>>>>>>>>> index in the hypervisor MSR range) is used to indicate hypervisor
>>>>>>>>>> behavior when guest accesses an MSR which is not explicitly emulated.
>>>>>>>>> It's kind of weird to use an MSR to store this. I assume this is done
>>>>>>>>> for migration reasons?
>>>>>>>> Not really. It just seemed to me that MSR policy is the logical place to do that. Because it *is* a policy of how to deal with such accesses, isn't it?
>>>>>>> I agree that using the msr_policy seems like the most suitable place
>>>>>>> to convey this information between the toolstack and Xen. I wonder if
>>>>>>> it would be fine to have fields in msr_policy that don't directly
>>>>>>> translate into an MSR value?
>>>>>>
>>>>>> We have xen_msr_entry_t.flags that we can use when passing policy array back and forth. Then we can ignore xen_msr_entry_t.idx for that entry (although in earlier version of this series Jan preferred to use idx and leave flags alone).
>>>>> Which, just to clarify, was not the least because of the flags
>>>>> field being per-entry, i.e. per MSR, while here we want a global
>>>>> indicator.
>>>> We could exploit a bit the xen_msr_entry_t structure and use it
>>>> like:
>>>>
>>>> typedef struct xen_msr_entry {
>>>>     uint32_t idx;
>>>> #define XEN_MSR_IGNORE (1u << 0)
>>>>     uint32_t flags;
>>>>     uint64_t val;
>>>> } xen_msr_entry_t;
>>>>
>>>> Then use the idx and val fields to signal the start and size of the
>>>> range to ignore accesses to when XEN_MSR_IGNORE is set in the flags
>>>> field?
>>>>
>>>> xen_msr_entry_t = {
>>>>     .idx = 0,
>>>>     .val = 0xffffffff,
>>>>     .flags = XEN_MSR_IGNORE,
>>>> };
>>>>
>>>> Would be equivalent to ignoring accesses to the whole MSR range.
>>>>
>>>> This would allow selectively selecting which MSRs to ignore, while
>>>> not wasting a MSR itself to convey the information?
>>> Hmm, yes, the added flexibility would be nice from an abstract pov
>>> (not sure how relevant it would be to Solaris'es issue). But my
>>> dislike of using a flag which is meaningless in ordinary entries
>>> remains, as was voiced against Boris'es original version.
>> I understand the flags field is meaningless for regular MSRs, but I
>> don't see why it would be an issue to start using it for this specific
>> case of registering ranges of ignored MSRs.
> It's not an "issue", it is - as said - my dislike. However, the way
> it is in your proposal it is perhaps indeed not as bad as in Boris'es
> original one: The flag now designates the purpose of the entry, and
> the other two fields still have a meaning. Hence I was wrong to state
> that it's "meaningless" - it now is required to be clear for
> "ordinary" entries.
>
> In principle there could then also be multiple such entries / ranges.


TBH I am not sold on usefulness of multiple ranges but if both of you feel it can be handy I'll do that, using Roger's proposal above. (Would it make sense to make val a union with, say, size or should the context be clear from flag's value?)


Before I do that though --- what was the conclusion on verbosity control?

 

-boris

