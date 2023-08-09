Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCDA775302
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 08:40:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580690.909071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTcrC-0005eT-IJ; Wed, 09 Aug 2023 06:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580690.909071; Wed, 09 Aug 2023 06:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTcrC-0005bU-FG; Wed, 09 Aug 2023 06:39:46 +0000
Received: by outflank-mailman (input) for mailman id 580690;
 Wed, 09 Aug 2023 06:39:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTcrB-0005bO-Gn
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 06:39:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86963bc5-367f-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 08:39:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9195.eurprd04.prod.outlook.com (2603:10a6:10:2fa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 06:39:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 06:39:40 +0000
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
X-Inumbo-ID: 86963bc5-367f-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlgUx+U4hK1ednOtWqEdo7yGaM6pqnrUnGkzhEiRCkaZRL1S92qmlHxFo8FBgZukn8xMC0aqwN9LM2B80u3ABiHyXG51PN9pwkY1i9qQ+6BnX1cWtVy+zjiIrn58tKFfBGPZcDypwL9MpN5rUsC/fYYYKLdpzOgz2DIf4JEhFxbuAbvZN46dnG7hpnXFW/uWYlMiFXZXsmNQpHhj4l45UHk66Bsei/d1oYFWS1iJzmmBfqPXjsKlZTrFnqaY0XbwYR/bvSwfOVxsR2e+odU1fRcE8fdYVgnpQRX1w5QqVgygIK2npvdAG5aSjJRDdS+3ZKIxVVVYjaDr08FXAuUBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZ4awkKV8+Y/0cKxPAF4bECQPSCs1gIuSPS13v726vk=;
 b=EaHtuXRuaJ9Ad0LjFuDg0+WsgooAUNnNcnyXXM2sNOzZMgrHt5a62o4y3ajPL+D+VW4XDWscJGLwWYLXWetxuv6wMQtGoCFfq8SOfKRF8R/lScpvgz2VzmCyCNJZI4/Br0EPAKww3jOyzgK9LyagQx7gHkWu1dXFEt31fr6gBsgo/j2EVMujChTtHRs0R6cob8qvv6caDWxOx29glfgFsy1FO/+Wg+mMqRQ6GyofUdzGq+S4oCOIRL+4fH3u1L4b61YZlq23St4K0GEgUJcvTmVcbd3hPjkvJ1kzgbQpHXbOmiIbB8h42nGhOFTZuiKp9B50tgIYDEfImZJ10nggZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZ4awkKV8+Y/0cKxPAF4bECQPSCs1gIuSPS13v726vk=;
 b=1Y4vlXhl+pPv/WbXkLuGxTtzvqk3mZEZrW4IuS55n+8nr+n73fd5N9U1i/tbi80Tt/N2fmVnIRJVZ5qMuSqhR8C2CQqCehMyMcAZ5zGhthFARlHjCZ44wS0Prgrnprz4gFW/MY2SSCHDcBwpZ2VriDkC8oU/5B9p5RV6rD6znyRtUllT1rN2EY/vZ1/NZG8/WzQKZvLIzoCyIEnXQrteH0LJmN8y8jQ5Tza4NQZ4IUvyjY4mLEHg7fsBcX91uDS/2HkUemkZuOnlNnL7qXtoDiIscrQ031bjiwWEwX1E8TnEO9dsBdko5PMkiyDY1MxO3qyTdbK7BDlSgOXG3JYOnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3667bf0b-5e5b-ac31-4d79-122f8ad159be@suse.com>
Date: Wed, 9 Aug 2023 08:39:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] console: generalize the ability for domU access
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230801160608.19219-1-dpsmith@apertussolutions.com>
 <3b889079-571a-a83a-0cba-c30cf2ce0b1b@suse.com>
 <d90cc238-87ef-d0d0-b06f-58e89d24eaca@apertussolutions.com>
 <01a80d4c-f19b-98ec-805e-e648e752d6b1@suse.com>
 <e1554020-a605-8df2-619a-eda86d86c50a@apertussolutions.com>
 <2ded224f-0b8b-90fe-367a-91762d1f25d5@suse.com>
 <72274554-5942-294e-aa1f-a594ae2e37e9@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <72274554-5942-294e-aa1f-a594ae2e37e9@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9195:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d901e04-f341-4936-ea6d-08db98a368a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MEvxUb09zAbUR+afv7cvx+qBB5oLm7XMdmBza1lCKNiHdgFbFw5jv0KWI5FDeRuZHJZISqWef6g0CubegQ8whlD/X1W53Os3p2VdN7zL9MitkNPoMoLhT/I+sz+IRJasgSwOw6Z6BZvBh3i4Zs6joNROurU9XEn6sWCuna4KuH99JJYj5FOo/08YAoexQSvidr0yBrDUeUpUrTKGH68zofUbGf2aZKDTEKXx+0RgAs2EsjWAkPlGsP7HbqlsaS8M9Y55obsrnLy5qr6mJ68S3vH5zCqBhNjEeXz//kk7/zmOGzTduJRbL1K5xGLlf2v6DBrBJisZJxkOtV+kI54swbQYM7R61Ds5lxiEFYEBeiz96hy+1rtzGpS5wczCB/9sx/t0jLPcVK38qTJ8b/AlEqJbCM4G41KiAamBnFrLnN20SbF+FdGlT2SO6fixOe6Yeowm+lwI2VhGOuRj3u2Q5xNIWPhSRDrkNS+269X4nH5NlJPpV7KubrbM74WDFujLmLy8VvrdlyNe1JLUmwGv79zdDnJtjiBdW2imFTCfa5YAQCrTZzRxVEgs9A5aVu2DBG3wew3XB3nuxBKV1KBwdH+pLcUqOC+WnogFqh9ng4U45t0zYxsjQTBvcbFJTGQwQ26x/GCoTWbRXasFmC0R8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(39860400002)(136003)(346002)(366004)(186006)(451199021)(1800799006)(478600001)(31686004)(2616005)(83380400001)(6512007)(26005)(53546011)(6506007)(66946007)(8676002)(316002)(8936002)(31696002)(41300700001)(66556008)(2906002)(4326008)(6916009)(66476007)(6486002)(6666004)(36756003)(38100700002)(54906003)(86362001)(5660300002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTV4bWtIdnlOY0JaelJ3NkFVbGZlU0NhblBpWWdCTCtyV1IvcVp4aElmOGs2?=
 =?utf-8?B?SWs0b1JkS1QydU41VE5URlR0NDh1c01WZzhzQk5FOThiMXphUG5uTFBCNlJo?=
 =?utf-8?B?V1FEdkRGbDl2L2UxTTV4Qkc5MTNMMnBWZE95SUhhUzRYWmNRNm1OcWVqWitj?=
 =?utf-8?B?UUhQa0phSUY5MVpMcmZITUNTRjM4bk1PTngyL2kxVzlGcy9TVVprNEFHaDlC?=
 =?utf-8?B?cnpacGtLbHdqS080KzkwUi9RUDVzUDBvYUlXVXpIUGY4alJVUk5YZnpCZFBC?=
 =?utf-8?B?cnhqb0dIanQ4dFVKRC9FS1lxYlFXUTNjRDY0ZU1XbWR0NFlFZVpxSXJIZG9l?=
 =?utf-8?B?cktwb1E1ckVNME10TnNHWUhrVWRkaG0ycEZLVEhpYzIvaWI4TkczSERtVGY3?=
 =?utf-8?B?cVRmS1lWSE80VjErV201MWNtUW85SGhPanhPZzZrbGF6amcrOFhSZmFCRW9R?=
 =?utf-8?B?eTZLQi9mVFJWVENMdTNQZUg5SGRRQzlIdkUrNXVjWksydVRPdWRQU1dwS1VT?=
 =?utf-8?B?Skg5T3FoY3Z6VkJ3MzNwaXZXbThXc3hNd28zMkUxdXduQUxXbEtQT2JpbHd4?=
 =?utf-8?B?UWs1UFFOd2E2dVlaUEFUNFpIYjlBL09NUk5CbGdRZWF5ZHZvcUg3ZWVvY092?=
 =?utf-8?B?VXp2T1hXQkl6UHVvN3Z1ZXduSHhGN0NQODBQdWFBRXdsR3BPT1ljaHY2c1Yv?=
 =?utf-8?B?RGxlc214TkxkTm9EMWgxdzY4MXB4S3BXcEI1L0VybmlNMVdXMmNpajFVOURw?=
 =?utf-8?B?ODlHeVlwYVl2eStrY1hmUUdjSWRoMFVtQ3JSK1BoNmJoUVMwYTZFdHpYTnJH?=
 =?utf-8?B?dUNqbU1DZ0hZUkFwTWdNRjgrVnhSUE5MWTVwNmR4b2pYMTc1Y0ZFZVRpemZv?=
 =?utf-8?B?ZDYzYjcrZ0phVHlMaEJzMjB4RGRQc1NPOFozUVlrMmV3WVllbGt2V0V6cHhP?=
 =?utf-8?B?dTZEcFRLa1k3L2w0REFRRGF3bU10UUpxZ3Rmckc2VlFPZmRRL2dXRTk1NHVv?=
 =?utf-8?B?aTRoTnAvdi9Fb1YzazU4andQeGdtSjBiM2xvNy9Yem1JTGZwK290QVZkbHAw?=
 =?utf-8?B?N0pYaS84cHA1MUM3RGFSdGJUNkllRndReUx2VXJSRmk1aUw0UHVEUnpXdzFO?=
 =?utf-8?B?bnFTWVBvdGp2S1dJVHYyeEZyNGpCeGVmS3JvNjB4MEVjUlB1T3F5ajNqckla?=
 =?utf-8?B?ci9hVTZVb21UOXdlK1ArU3hyRUtMVzVKaUt6VXMzalRoczhUSHRsZWJjSzBr?=
 =?utf-8?B?NTdCZ2hpOVFUSFhkVWRaMU40LytRSlJ6TnVpYlo4S0RCNHVMK21ML2JGSUFn?=
 =?utf-8?B?bE44Z1ZkK2ZyQmlQR0V0Zml2VVpVZ2hyc3FQQmgzMXpYUlpDamR3R0JGcUVa?=
 =?utf-8?B?UjJjMjdQdkIwQWlUUmxyNlcwRFFwK21MOGViQXlrMUVQeWkxeXV0OGVEQkYz?=
 =?utf-8?B?cGNFQ1NVNjJDQTZHejBXOXhBMlp4WUxtM3hXdjdTZ240MlJiaHNOblcxMith?=
 =?utf-8?B?RVNGNXV2cnUyV3Q3UWRlbEpPNUtPbjM2ZVE0NEtmc1JwY0hxanQrVm5VTDRG?=
 =?utf-8?B?eCtQOFMrc0pTaWI5R0xkNC9PaW5FcHloSDVLYXBqZERmZTY3SU45ZHU1T1pT?=
 =?utf-8?B?M2lwWTJlM2ZIL25kdDdPL1NQaFYvcnI0OEY1ZUlzaVdRNlN4dko4TkRaRjY3?=
 =?utf-8?B?Z3cydFo3bkNmY3lCTm1wbmpYUHhwOHhjaEk4YXNoNUYySWtvYk0va2RFYStl?=
 =?utf-8?B?V2RneGlPdDkwVmxJWlp1WmNCRVJKbHFRZkxuVXVGa0E4QjFMc1EzY3lJa000?=
 =?utf-8?B?S0hXSnBaL2c2ZnFFbW0yZzhTNXNZdTdtbFNtd2JuNGY1RzFPTTRha1FBaWdU?=
 =?utf-8?B?VkFFcTNOU0RNQzJKVU1Hd2VRaXI0OThUdDRoL2lWZHVEanNpMUx6Y2t4V21r?=
 =?utf-8?B?MVUyMk9tdXIzMkh5V1l6WTBCWDFFSEJ1V1VaSTJ2bWVuejBZSEtZSjFtMk9u?=
 =?utf-8?B?cVprczFXUTdsOC9YQ0kwekRkWVduSFRuOUZnL3A4SW0zS2Vnck5ERE51bHRM?=
 =?utf-8?B?WUdEQVRtMnV6MExrSkIxNnE3aWM0ZzZMbkowby9wSlNSZE9YSXJnRDlXcG51?=
 =?utf-8?Q?gqRnjz5XbzAtMu7TjfrjEGHnK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d901e04-f341-4936-ea6d-08db98a368a6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 06:39:40.7760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkzQ1hxWISo4zoYH/x98JPV4kDjGdlAu4ehX2yzJ0pQ1f3JPzKADlkEdMG3yG4f7ScrRJjFHO77jatEgr/wKpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9195

On 08.08.2023 18:58, Daniel P. Smith wrote:
> On 8/4/23 03:49, Jan Beulich wrote:
>> On 03.08.2023 18:31, Daniel P. Smith wrote:
>>> On 8/3/23 11:56, Jan Beulich wrote:
>>>> On 03.08.2023 14:56, Daniel P. Smith wrote:
>>>>> On 8/2/23 07:01, Jan Beulich wrote:
>>>>>> On 01.08.2023 18:06, Daniel P. Smith wrote:
>>>>>>> +        {
>>>>>>> +            for_each_domain(next)
>>>>>>
>>>>>> What guarantees that the list won't change behind your back? You don't
>>>>>> hold domlist_read_lock here afaict. It might be that you're safe because
>>>>>> that lock is an RCU one and this function is only invoked at init time
>>>>>> or from some form of interrupt handler. But that's far from obvious and
>>>>>> will hence need both properly confirming and stating in a comment. (It
>>>>>> is actually this concern, iirc, which so far had us avoid iterating the
>>>>>> domain list here.)
>>>>>
>>>>> It is better to error on the side of caution instead of assuming this
>>>>> will always be invoked in a safe manner. I will add a read lock for the
>>>>> domain list.
>>>>
>>>> I'm not firm enough in RCU to be certain whether acquiring that lock is
>>>> permissible here.
>>>
>>> Same and I took your statements to suggest that I should.
>>
>> Actually I wasn't paying close enough attention here: The code already
>> uses rcu_lock_domain_by_id(), which acquires domlist_read_lock.
>>
> 
> Right, it grabs the lock while iterating through domain_hash[], I 
> thought your concern was with regard to the iterating with 
> for_each_domain and the embedded open coded version. Because of your 
> inquiry, I have been thinking about it and I should be grabbing the lock 
> as I iterate to be sure that I don't get deceived into believing the end 
> of list was hit because a domain was being removed as I walked the list. 
> And if it so happens that the context is always safe, then there should 
> be no contention on grabbing the lock. Do you disagree?

Well, RCU locks aren't real locks, so there's no contention in the first
place. As to the context being safe - I continue to be uncertain, but
the pre-existing use of the lock means you adding the necessary locking
to your code won't regress in that regard.

Jan

