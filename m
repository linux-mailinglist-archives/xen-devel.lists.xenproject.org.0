Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F03255543BD
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 10:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353522.580458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3vLa-0007WP-Em; Wed, 22 Jun 2022 08:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353522.580458; Wed, 22 Jun 2022 08:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3vLa-0007Tj-B2; Wed, 22 Jun 2022 08:04:22 +0000
Received: by outflank-mailman (input) for mailman id 353522;
 Wed, 22 Jun 2022 08:04:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3vLY-0007Td-GL
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 08:04:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea9c8194-f201-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 10:04:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8950.eurprd04.prod.outlook.com (2603:10a6:10:2e1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 08:04:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 08:04:17 +0000
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
X-Inumbo-ID: ea9c8194-f201-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KK6PNOcJDlgirF3tmBNq8FM7exXp98zNuqpEwA54+oCdNvV4YzHgydquKtyf2dUSDd3pSZ5KTYr9ie5OHPq0Cux4pvcl1TmrQLnnn9yPPmypalOqDiy/3FlhubdDIB/9wDdNAnNR20SVk0FB+LHD4FTbR/A8wVark4DbeNaokLd1ijnpBqlCGpU/Rl0yG7yCKZFzARClzPgbh/+BmAq+ymuxVdv/kRaUP/3BxfQWpfcnVM52xjNDGkCCIPI2vd6QIAyOuP5X/Idl010Uu+kK8EegMkcUWLhOP2fwa5bFoSFPWSlR7qmTXlX2wtgS8rUuD4gr5j1GP/jCOH37yZdyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIhfBpWI2qTPNsoFMcYpVGbr+wW25luuICYFqYxKsxo=;
 b=hqIce9Aikaxm8Cz9W+M85WGUNEJ5lm5dbRzuqeR9h+tXMgt2awKenGqbzmHVwAAHxhr494f0096iKrWJ9DUn7ftd7RJxr6r6nLYNmbT2ZP3FBPJnPL38wCEBGy6r4bzC4Tk316I1Zwz+BWrA9sNqDqOIUZ9BR544Os7s3jXd8ccSlN+5U+giSWrTo8sp/5FNVfWyV0diQwxFHA7R68GzGQPXxcQ8kBcS1hj4BZdd7ArpirGErwbWXAsLvV6USRYpaoHBrUxHrYrESHEEXZOQuywIURx3u2tFhbT+DOiOGG1+GX7xGiuMHHW2iFTBsuLKDpj0jrxqrwUS7sUZdIGTPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIhfBpWI2qTPNsoFMcYpVGbr+wW25luuICYFqYxKsxo=;
 b=vXBtt3ON5gxBAjrPbC7IesBu476GAwIUb5zjoaYIEkNpjNseUbgL1ByaykSJ5ItqVBSBlMXmJE7eayUmpbEafId0LBGef9zuGTuh6aox5aXX3Px37ZINn/3NqsVebEnQ1XrHG5rlgBROAcm2ZKAHCyiB29XcGTf4fo3Qreo6emzuuCsjh0ipAr7wRxyuDWxAK5J1jT4c43Rgs9Zl0xaxYTl9bvuGeJ61AZBlnZVTwDNUsYOV8+qFTSE9u+I2/7GhJIDPPONSP49F+NHN/hk4rqiL+QTfec4iatq72FdHE6t5XqX8kA0Rf1fRp9NR2l9CAI35pbZtURm536wOGR3mjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ee15e94-f4a9-69f2-4c57-2e0cc9df8746@suse.com>
Date: Wed, 22 Jun 2022 10:04:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <Yqb9gKUMokLAots7@Air-de-Roger>
 <afa0a9e3-fd35-be38-427e-3389f4c3ca26@suse.com>
 <YqcuTUJUgXcO3iYE@Air-de-Roger>
 <f0f87e99-282b-6df7-7e57-3a6c73029519@suse.com>
 <YqgwNu3QSpPcZjnU@Air-de-Roger>
 <69d85d88-4ec1-987c-151f-0d433021fe34@suse.com>
 <YqhHtetipYTG8tuc@Air-de-Roger>
 <72c94980-cbcd-d3b3-7aad-c9db58d9c4a2@suse.com>
 <YqhXFKMlIvkQzVoT@Air-de-Roger>
 <291bb0ee-06d7-af25-79bb-e099c7ff2fe1@suse.com>
 <YqsUfH763oSchRdW@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YqsUfH763oSchRdW@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR01CA0072.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::49) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4131a68b-6531-4e90-b7a9-08da5425cdb9
X-MS-TrafficTypeDiagnostic: DU2PR04MB8950:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8950350169D43252D12265A8B3B29@DU2PR04MB8950.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dROnWwGE9o2fW2QIUKAZklMRrOaTTX0CStP/FN3vj6W2qsTwC8XhzmTrY0KN6oIEGCtEdJ1qpKUll0ip0vRYm3041jXOkZL2ezZWvC+hhv123FXtbU4RK3w2l1FsQmBjHC+ea8LBq10PDzRui/7aWljYGDReKaEawVjcC8Vu3y3aAsi2/1FRx8XPzpjvsAxCROa6yne2jV3SapUC0808oIf6A+4jAY7AJWqH/FZKhDZZFHimr1mEx0REzzvZPx2Kd+J+n4+z0Qgo4LB97u3GulANAdC8v7ZvMKSpCte/OzCZ96H8OzHzAaIJY8THGDVQpKVT6VYLPbbt+kRND1t5NIbaKcKgMm6VklN+PIf0I8RcVO086oOLoFPoOd1og5omCipNMs0oXOTjYb7wYAn7y2KXGkB3m1YgQFz8siFzDWGC7IZrUPiBV2GjlJ6hKOeE4MypqOS4Sf8GzNIp7Z/ahLxlnq+BLwsguXzRBbS1lJliE6HIaEpETDOwQwMCq8ObGqdiwt3rL6c8kw2pq6YQSYtfdHQaWK4Un2bSSLQ50qLZ7QTFLQiJjFmyiOUFchnGSQxxHeIL7HOc9436eqWLFM79ZujNA8Arnzcoe3hhOr67DN67T+KzrLy/rKCzUzxUYQX5HFWg8oujmNqyDu0ZjIx8QwQDEB1QZozjXf2YVP1+rHAeOh0QalXWl1lnk4Wo9u47ukIVknnHYF5DmLMzG8qQguOhzEVf640QXMunY4KJKeNaIIHyGT8yWNTM9eGsTwixnyzlTvh8B90r2R3reSsaoMMRvEZpUUZ9rSESYLo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(39860400002)(366004)(396003)(2906002)(186003)(316002)(31686004)(8676002)(4326008)(66556008)(66476007)(66946007)(36756003)(6916009)(54906003)(5660300002)(8936002)(478600001)(6486002)(86362001)(6512007)(31696002)(38100700002)(6506007)(26005)(83380400001)(53546011)(2616005)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmR0dHVjNGwvM2JOQkZtSTN4ODZ0QlZ3OHRza2F1RVQzZjRKZWU0QmVKTzFv?=
 =?utf-8?B?UlNYYncyejRBZ3ZEa1ovMU9MamZ4ekhJbEpSNWI0a1l3c2VVek05bDFBZmgw?=
 =?utf-8?B?aytkSDI0VXJXNU1WRy9MVVpUZCtacVJMZVVTRExiSDNPY3dSQzdRaW9KeFdy?=
 =?utf-8?B?UEU4WFh5c05vTFFNRWg3YmxHZVhWL3pTOC9lZXBNWEFRUUU1aHNuLzdHdm9y?=
 =?utf-8?B?bE5SSGdNMDlzMlZOZjJwYmlXL01hY0FEWUlBRk9zcFJGUFNWMU83ZEtSL3ln?=
 =?utf-8?B?QlJwYU54WlhtMVNkQWRrYmpjdmFMUjAza2JNbUlONWVsZW55b2haODZXeFFD?=
 =?utf-8?B?SEN3Z2c2UFhsM0ZBU0pVaGlNRnR3UUhQK0d6d0xZMWFXME9PdG1zWldtanpR?=
 =?utf-8?B?Um1tdXBJZ0RWK1NjMk1BVkJBbmJpVHgxRHFJV05NMEhkcXlkaWo5b2N3cVNv?=
 =?utf-8?B?VENWcjUvelZnTVM1UU12UERTNlJlUWZBV3EzdE9JZVBPaTRhMjZxbVV5ZG5J?=
 =?utf-8?B?QUxlMDh0M2gxQU0vTzFka09OSFhBZzFJejBsVHNDV1YvK2pCMFFxTDRTMG9P?=
 =?utf-8?B?c0w1UlcwU0pubXpqYzVWMXQxc1oxSlE3NEhOMGhOUG14eTRTNXJLczFUZ0J4?=
 =?utf-8?B?eW9GWFRpWm1wVUdKVUllb093T3dMTzdCeVhOVmg2VFFrcExpaWd5cUEwZFRU?=
 =?utf-8?B?a1VBUlNmdXFobDVjRzRoc0VBVjY5YmdJN2t1ZW13dURTMHJZOVRENGJCVGht?=
 =?utf-8?B?N0tNSEVLa0E5ajJqb3hPRmlEb1hpa2UwRDBXYnRTRC9Ga2JYRURLR0l5NVpG?=
 =?utf-8?B?UHVRdElWdUpsSVV1MldUb0U3RWNqeisvZHhsbEJMakRyOGYrcjgzanphY1E5?=
 =?utf-8?B?NDcxNEFJekRzOENUbHkyc25tTlEzN2p4L1NNNWJTRmVNMnBxa09rUEluN0Vs?=
 =?utf-8?B?OTF0OWFpZXN5ZDN0dUsrR01UTVhjSUpaNVc3MC9ZdERQc1prbjlsc2lzRkw2?=
 =?utf-8?B?YUp4WGs1VjJSa1doZlBHTUJoeG00eVFwZHJKejQweVJzb2wwbWpBY2FqUmNp?=
 =?utf-8?B?YnoydmxkTk80YTh0dkpNTjZ3Umd3TUx5Z01PeHd4N0VibmxBTklLWnhXOXZX?=
 =?utf-8?B?clY5dzNBajFGRVJJK2s5VE5CZTV4NUdCZ3UvczVJSCtlV0kzd2NqSVVZTVBm?=
 =?utf-8?B?c1ovYk9nQTh5ckhpK0M1b3RQNWt6UGljSXA5NFdWNSt4dXlWelRSVUh0cGdt?=
 =?utf-8?B?bVowalNLUXcrR1JkbFUzM3BnUnlnWFZPR1l3c3VManNMc0tTcWc1cGE1Ung4?=
 =?utf-8?B?TW5neVZWbmcvUEpuRHZlektJQlA4MjRMRmF4WUdtZGdGdmorZWU3VDZ2RFBI?=
 =?utf-8?B?UGIrQjY2R3lELzdtTnpMMWd5a2J0cFNyUWE0RSsxZGVyNHVMSlFFRm4yTFAx?=
 =?utf-8?B?cDFMRmlpR0s3SUFoNHNuNFF1UEhjOFFzSGJFVGRON2NHNkkxdDJibWc0NEdx?=
 =?utf-8?B?eWhtMmZRSEl0RzdDaURGZjc0eGdVTmFKMTg0U1BGWC9qd3o2R0Z6a2pVcm4x?=
 =?utf-8?B?NE93d0wzWVJ2czNMd0poTWdHUkY3WE5mM3VrdnlxQTFiNXMzaWgyV3dHRGNj?=
 =?utf-8?B?d3ZJZXlYbDRkTEtSQVZTNTl6bjFvQVc0UDF1enFBSHpSUG4xOGpGeHB4UDMx?=
 =?utf-8?B?UTlOdXI4OHZkSUJ0NXpMbDBqdWdtSGZzdElKS3lKTy95MWNJQXAvVnVNNTdy?=
 =?utf-8?B?UzJ1RlhGZEpobTRDWGgvb0VhRXR5NzFod0dtUGppblc0UGt6aUV6UGtnbHhW?=
 =?utf-8?B?NFhDZndIZ3RTNHpQWGR3MGtrVmM2c29La2NpYVIrSVNKSUFiQ1lQV05aTks0?=
 =?utf-8?B?alRjL2lvbUkreWYvTXBmNkpnTXk1cGowd3ZHREluSFVhQzJRQk91Q2k5QjNP?=
 =?utf-8?B?YlhibE5MRXE1M09xQ2tZalhncUJxZGk1MVZlcDBBNm5NcWpMT01XWnZiY2F2?=
 =?utf-8?B?NjVCOHI2bmpsd3BtbjRRa1phVDQxc0FLM2dRWTF5ay9wcFJkQXNpb05YaHlC?=
 =?utf-8?B?WFBHclVHTllZQk9qWGI2M2RHbmRsOG1GK2pvV245WmYvNjhBTnR4NGhyNHNz?=
 =?utf-8?B?NkQxVzBlYXh0aXpXREZoRnMrVldrbmNCbnMvR2hPeGlPOE8rYmYxQWd1S3N3?=
 =?utf-8?B?cGtzWlhITGRSN29ieUo5ZVV3S0pNUkdRa0RpU2pYR1VvellkeHFNL3hJaWRk?=
 =?utf-8?B?VWNUNmtTaW9SSzI4TXBFbFVaUDBNWVJHaGp2TnRWZGRiS2xCUzMzMmV2SGRq?=
 =?utf-8?B?a1FvY2JJbkszaWZxREJxRDZmM2dUV0ppYWpEWnBER0VrU0owR0ZWdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4131a68b-6531-4e90-b7a9-08da5425cdb9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 08:04:16.9932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fr5USLOFkEoOoon9gmBINJV03LB9eDSqt9bGd3/PemXoe/JAYkg1fB+OoTQApXB3NEKjL6VPlAhq6Ud92WdSpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8950

On 16.06.2022 13:31, Roger Pau Monné wrote:
> On Tue, Jun 14, 2022 at 11:45:54AM +0200, Jan Beulich wrote:
>> On 14.06.2022 11:38, Roger Pau Monné wrote:
>>> On Tue, Jun 14, 2022 at 11:13:07AM +0200, Jan Beulich wrote:
>>>> On 14.06.2022 10:32, Roger Pau Monné wrote:
>>>>> On Tue, Jun 14, 2022 at 10:10:03AM +0200, Jan Beulich wrote:
>>>>>> On 14.06.2022 08:52, Roger Pau Monné wrote:
>>>>>>> On Mon, Jun 13, 2022 at 03:56:54PM +0200, Jan Beulich wrote:
>>>>>>>> On 13.06.2022 14:32, Roger Pau Monné wrote:
>>>>>>>>> On Mon, Jun 13, 2022 at 11:18:49AM +0200, Jan Beulich wrote:
>>>>>>>>>> On 13.06.2022 11:04, Roger Pau Monné wrote:
>>>>>>>>>>> On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
>>>>>>>>>>>> On 13.06.2022 10:21, Roger Pau Monné wrote:
>>>>>>>>>>>>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
>>>>>>>>>>>>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
>>>>>>>>>>>>>>> Prevent dropping console output from the hardware domain, since it's
>>>>>>>>>>>>>>> likely important to have all the output if the boot fails without
>>>>>>>>>>>>>>> having to resort to sync_console (which also affects the output from
>>>>>>>>>>>>>>> other guests).
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Do so by pairing the console_serial_puts() with
>>>>>>>>>>>>>>> serial_{start,end}_log_everything(), so that no output is dropped.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> While I can see the goal, why would Dom0 output be (effectively) more
>>>>>>>>>>>>>> important than Xen's own one (which isn't "forced")? And with this
>>>>>>>>>>>>>> aiming at boot output only, wouldn't you want to stop the overriding
>>>>>>>>>>>>>> once boot has completed (of which, if I'm not mistaken, we don't
>>>>>>>>>>>>>> really have any signal coming from Dom0)? And even during boot I'm
>>>>>>>>>>>>>> not convinced we'd want to let through everything, but perhaps just
>>>>>>>>>>>>>> Dom0's kernel messages?
>>>>>>>>>>>>>
>>>>>>>>>>>>> I normally use sync_console on all the boxes I'm doing dev work, so
>>>>>>>>>>>>> this request is something that come up internally.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Didn't realize Xen output wasn't forced, since we already have rate
>>>>>>>>>>>>> limiting based on log levels I was assuming that non-ratelimited
>>>>>>>>>>>>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
>>>>>>>>>>>>> triggered) output shouldn't be rate limited either.
>>>>>>>>>>>>
>>>>>>>>>>>> Which would raise the question of why we have log levels for non-guest
>>>>>>>>>>>> messages.
>>>>>>>>>>>
>>>>>>>>>>> Hm, maybe I'm confused, but I don't see a direct relation between log
>>>>>>>>>>> levels and rate limiting.  If I set log level to WARNING I would
>>>>>>>>>>> expect to not loose _any_ non-guest log messages with level WARNING or
>>>>>>>>>>> above.  It's still useful to have log levels for non-guest messages,
>>>>>>>>>>> since user might want to filter out DEBUG non-guest messages for
>>>>>>>>>>> example.
>>>>>>>>>>
>>>>>>>>>> It was me who was confused, because of the two log-everything variants
>>>>>>>>>> we have (console and serial). You're right that your change is unrelated
>>>>>>>>>> to log levels. However, when there are e.g. many warnings or when an
>>>>>>>>>> admin has lowered the log level, what you (would) do is effectively
>>>>>>>>>> force sync_console mode transiently (for a subset of messages, but
>>>>>>>>>> that's secondary, especially because the "forced" output would still
>>>>>>>>>> be waiting for earlier output to make it out).
>>>>>>>>>
>>>>>>>>> Right, it would have to wait for any previous output on the buffer to
>>>>>>>>> go out first.  In any case we can guarantee that no more output will
>>>>>>>>> be added to the buffer while Xen waits for it to be flushed.
>>>>>>>>>
>>>>>>>>> So for the hardware domain it might make sense to wait for the TX
>>>>>>>>> buffers to be half empty (the current tx_quench logic) by preempting
>>>>>>>>> the hypercall.  That however could cause issues if guests manage to
>>>>>>>>> keep filling the buffer while the hardware domain is being preempted.
>>>>>>>>>
>>>>>>>>> Alternatively we could always reserve half of the buffer for the
>>>>>>>>> hardware domain, and allow it to be preempted while waiting for space
>>>>>>>>> (since it's guaranteed non hardware domains won't be able to steal the
>>>>>>>>> allocation from the hardware domain).
>>>>>>>>
>>>>>>>> Getting complicated it seems. I have to admit that I wonder whether we
>>>>>>>> wouldn't be better off leaving the current logic as is.
>>>>>>>
>>>>>>> Another possible solution (more like a band aid) is to increase the
>>>>>>> buffer size from 4 pages to 8 or 16.  That would likely allow to cope
>>>>>>> fine with the high throughput of boot messages.
>>>>>>
>>>>>> You mean the buffer whose size is controlled by serial_tx_buffer?
>>>>>
>>>>> Yes.
>>>>>
>>>>>> On
>>>>>> large systems one may want to simply make use of the command line
>>>>>> option then; I don't think the built-in default needs changing. Or
>>>>>> if so, then perhaps not statically at build time, but taking into
>>>>>> account system properties (like CPU count).
>>>>>
>>>>> So how about we use:
>>>>>
>>>>> min(16384, ROUNDUP(1024 * num_possible_cpus(), 4096))
>>>>
>>>> That would _reduce_ size on small systems, wouldn't it? Originally
>>>> you were after increasing the default size. But if you had meant
>>>> max(), then I'd fear on very large systems this may grow a little
>>>> too large.
>>>
>>> See previous followup about my mistake of using min() instead of
>>> max().
>>>
>>> On a system with 512 CPUs that would be 512KB, I don't think that's a
>>> lot of memory, specially taking into account that a system with 512
>>> CPUs should have a matching amount of memory I would expect.
>>>
>>> It's true however that I very much doubt we would fill a 512K buffer,
>>> so limiting to 64K might be a sensible starting point?
>>
>> Yeah, 64k could be a value to compromise on. What total size of
>> output have you observed to trigger the making of this patch? Xen
>> alone doesn't even manage to fill 16k on most of my systems ...
> 
> I've tried on one of the affected systems now, it's a 8 CPU Kaby Lake
> at 3,5GHz, and manages to fill the buffer while booting Linux.
> 
> My proposed formula won't fix this use case, so what about just
> bumping the buffer to 32K by default, which does fix it?

As said, suitably explained I could also agree with going to 64k. The
question though is in how far 32k, 64k, or ...

> Or alternatively use the proposed formula, but adjust the buffer to be
> between [32K,64K].

... this formula would cover a wide range of contemporary systems.
Without such I can't really see what good a bump would do, as then
many people may still find themselves in need of using the command
line option to put in place a larger buffer.

Jan

