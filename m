Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0814B65FBBE
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 08:12:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472329.732511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDgtC-0004wA-Dq; Fri, 06 Jan 2023 07:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472329.732511; Fri, 06 Jan 2023 07:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDgtC-0004td-Af; Fri, 06 Jan 2023 07:11:42 +0000
Received: by outflank-mailman (input) for mailman id 472329;
 Fri, 06 Jan 2023 07:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ggnj=5D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDgtB-0004tT-7F
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 07:11:41 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2041.outbound.protection.outlook.com [40.107.103.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d49113e-8d91-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 08:11:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8976.eurprd04.prod.outlook.com (2603:10a6:102:20f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 07:11:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 07:11:37 +0000
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
X-Inumbo-ID: 5d49113e-8d91-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTO/hX2NnU0CaFQ1rnRN2JHB8m6wntDKLv4VxP7WfR2Ms4ooXiUib3yWR7mQJEvDV5ZoSFwXnK/SG2kmnkbHzyRBy30Vbfa35N1jpo5vMApc+K/HJsOZGJxilu3BCy4fpoPH4+gXQxnEwIlAsMjcF+qPMTGCA58ahDMczSupMwvI0hODX2+yPLuZ7ooQgx7jkKJtyVOQlDo8sK8qVhrEFSTeF/1R6Yg93DGFmSpBGSqDrfcJw1d76up8UKKAU0BAr5l8Zx2qGgwkOO5/x5JYB4lK48roL8HA7rIGbpzmAzUQkzz8ZLRgdiKlTyNLmXG0oc7dgRqniWFivkv4jkziEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dp/SB8FHsc/pkJeDx9F8rMb9yST6AkHe9p8Ch4PCHkc=;
 b=nCZf8kPTPLb6VlMmePmX6Vlebf0nWDgWVjFdTt7I+n8s7posmeO1hmCcVw/IYeadXnwFKAxAOLBdQSENoPDPhC2Sax9fahrE0eUTg9BDVN3OqPDdFj0Goi36mihpWhmOTTIQGhEaHGMVlRWKCWTCUq3pswyYd8QQvvOgi2qMff5SZfkvihRxZIchSP5QDz0gf6XpbGnGO9YDICmYnmzmPIRywb38ow1X9ocrn9wKHNim/NE5ccNJvgEBMjhqDMRKCqgIFQp4GsIMe3bLykZYe9adYdy5K2f46YEq/YkDV/AZEfXXu47YXE1iAsVmuwHNIxZOzUuUdKh9yC4CfZkrJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dp/SB8FHsc/pkJeDx9F8rMb9yST6AkHe9p8Ch4PCHkc=;
 b=2QuCnoSdN3kvDepH/R+VdMtQmnLBl8p3cMOjg1OpFMmlIoVLSNqkwvomdJHTmc5WjMjeDUrNYghAVJVOs9FY+qa/DvZz9ChtINDZfqqAdsWAJatRN/y/0yFlGL8+OuV0PGBNjbjJrDe52KfI+/nNzXhB8+/zoUg1v0GSu/kRRMx1TZyf+pF7xBmdnGAdrafG8sEzOdotn+tNQV4w6myeMDW+SVbIsNN8P5Ja+c9TVuTAow5ftS+KU8isK8HraIoWHgu4KbvcFeHtAXFFi3xjwNmAuVXD+djHjG8z/weP31DR7Tjc00TJImPEkFJxIPnhx2hngF3qKu9KYjUA/z/ymw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0869534b-4481-d3d1-2afc-09560844d9d5@suse.com>
Date: Fri, 6 Jan 2023 08:11:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 4/5] x86/mm: Reject invalid cacheability in PV guests
 by default
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, "Tim (Xen.org)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1671744225.git.demi@invisiblethingslab.com>
 <2236399f561d348937f2ff7777fe47ad4236dbda.1671744225.git.demi@invisiblethingslab.com>
 <c6223295-c4f9-8fa8-7635-80d48094190f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c6223295-c4f9-8fa8-7635-80d48094190f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8976:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b9a312-a0d2-49dd-bc05-08daefb53ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HffHmHG3QUyYvttGBY2irtzuM5ced7UXhSmTV3vBy9eXsWy4WrOUfgwOzUDSlls5rTHNCqhvCf70ltkFr15bUO8RlhTmothzLY7uBMhqCzJMxh//c3RqB90qpghirRU9ML3YLUTX63TGlfIraOH3u0c8tLCRZnml6ikH4tZ4dC+TNWQWjoHtlIzqhr3h0tN7WjSQgHoSFGXFiaxS5BvHRwaxA4LKOScFnJbH8p6xTyS2c6Z76Qu/EbggqFN2SN60zNdnnjLemUMx81dUlLILpuc/3o/xgvUlJOxccWQGds/Wyb8Mwhk3GV7GaypdQYrWyJmQNyarpmLRyiieJlS6OJ/lo8BTWkH7508qNdfEYkQPaz9vWOpOMfqPckDop7rGyW5rNLinJX+MiMcEiQNFKNAbdWdyiPzozZ67BILx+FgSALWqoXpcM2p3uyPj2lbdWT/UqW4bCZ4SQJGjp0K3J4r7/KUI1r1SrISOgt0s5Qz0SFL4mW67G2HS9XWsVBlPHXScCIGMpqnp2siB6MoCjhZf+GPikhJfdUXcaIhgAQmhLFMbWIPC+2GarTxaS0cxq4fGoWlvR8MQQeR6ihUjFC3KXUyPw6Q3euIdnsMkR7SFPPx5WAfFuXVklklFMqIMWoYFZAzgeuExlcZN7n+voCko/H7W+gd9FKQxi6rjuu/GpwhiSxb++LjDyqfdYzVCSQnUYpQYw06LAu7N0/CADnbJWW36Zgwr7Jdjm5h3L7c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199015)(83380400001)(2616005)(86362001)(31696002)(38100700002)(36756003)(54906003)(316002)(2906002)(8936002)(41300700001)(66556008)(4326008)(66946007)(8676002)(53546011)(6512007)(26005)(66476007)(478600001)(186003)(6486002)(31686004)(5660300002)(6916009)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3RiZnFSbUFBMTB3SHkvbkdqelluQ0VGVDZmQmJoUE01WGxXNms3ZFNXZHpO?=
 =?utf-8?B?eHFIU3U2L2NXTjBzN0EwRU9BMXAxMlhsbHpyNS96ZFE2dkF4M2hIWkNDVC9s?=
 =?utf-8?B?Y0oySitWaW1JUGlCcTNlOXhVM21nRFhNTDIzTE1VSnUrTnNNMlN2cTRKUlpO?=
 =?utf-8?B?SHErTWpkTGxvOGRtczBHZTJlL05qUTBES1VCZGt4Y2srTVJwUktENE9rVlBj?=
 =?utf-8?B?RDNCSDdtYzN2U2k5dUdvdG9ETXFnODBjS0srcFhPY3Rrem54cDFRZlljQk5Y?=
 =?utf-8?B?cnpLZEk1U1RENXJvdVlXbHAxbi9WTXdWMDVoemVVeUtRTnJWWTNEZUVyTG80?=
 =?utf-8?B?OTdiRVRXRW1ia0JhYXF0aktQbWl2cTc5aVpCK0xhVnk1ZXQ0dFVPQlB5RkhX?=
 =?utf-8?B?ZExUN25ZeFRGZHBNMjJCRUxqS25DNUVNK1ZIbnJBNUxiTUNpQk5wTVRreEM4?=
 =?utf-8?B?TVd2NDJWYitadDk5S0tSUWVuM0ZJNUo5akx0bTFTN2FEOFpOcUpQMDlhWG5F?=
 =?utf-8?B?MldXWkJmVTQ1SS9vRzg2Qm5vOGVZNXcxU21KWFlneldGZnBnU0g5WWN3Z0d4?=
 =?utf-8?B?RWJ3d29sRXJZbkFoSGoxdENyeis3dXZjS2JINUFUQXpta3hmRGowOThRT2J2?=
 =?utf-8?B?MmpsMjFSVlNQWXZuMEMwQ0hOdDRpUUJHcFVLWTJiZDZTRzRlTDByYTlzRGo5?=
 =?utf-8?B?SDJ2ek4zeGw2N0ZKZlhxUnIvcVY0QXlOL081Z2l4SkNDVUVldkRmUVpZeU91?=
 =?utf-8?B?bTkyVUhzLzZSdXc5cGFVMXhROWxTa1hHdjJGT1RHdDJCUWZxYzg2UGVtci9k?=
 =?utf-8?B?cGduVjhSbVRFNklTdGpPcGVOcVZFU2IyaWNybkIzUUQyeUtMT1Y4TTdHOGFv?=
 =?utf-8?B?ZnNGcHBnV0VIUkhOT0tWdVh0N1BJTDBOUkt4bEsxbWJsc0ZBd0tPZnUyK01w?=
 =?utf-8?B?UU9peHU5SXNYYTBkRnpxby85aTMwYXpGV0E2OVhBYTB0L2pzQUU2ZVZDYzhX?=
 =?utf-8?B?eVVKOVVWTG9oUHFSNFEraDN3WVlpSzFCbVFpRmxEdlRMb2JrUkV0eDVaekFO?=
 =?utf-8?B?Q0dWaXFhT1RNd2duaG8yTEZLeHI0T05LZnBQUndWai9XcUxSWFFrb1czYWF0?=
 =?utf-8?B?OXBFMktaUE80OVA5b3JKTUhSeGZZRGdyU0ovOXFTMVQxemJFVGRPVVV2RGZJ?=
 =?utf-8?B?TGxIUHNYb1BWYWZmNkkxanJNTVA2TDdyVTZNMGFwNnBJSnhpTFdtOGNWVkxH?=
 =?utf-8?B?SlJ5bC80UTVwVXNUbEJJUXNZQkZRTk81alVYRGhUR1pCeHR2OTExV2pnNDVn?=
 =?utf-8?B?UDJ3SS94VlljWHpSYkFsUnlGV1IvcWFMeUtUdnhpZkQ2dzU5UWFacVQyazhL?=
 =?utf-8?B?UDJoR3o3MnNKS3ZJR0E4N1lGYWVWWXBaMG0yTWdtWkRVbWovMXNPaHZxaUNF?=
 =?utf-8?B?eDRSWTJyTlAvaUtpMkxMc0hycEpNY2dSalB0b29xM3QwRWRKYTBGbWp6K0Zh?=
 =?utf-8?B?cE1nOXdKVVJ2c0pabmUvRU94RklRZDBHaVE4RHN0N2E3aU43b0dTdHRPV242?=
 =?utf-8?B?WGFDQ0ZsRmEzVGVuSHBrb0ppTnA3RVdJbi9rdzczNFlHc3FFTTlSdkxraTI2?=
 =?utf-8?B?R2kwaUZ2OXJMZlpYNDJrdmgxdGg1U29hZEY5QW12WmxRRFdNN3BBN2FadWIw?=
 =?utf-8?B?T09DUGswRlhZTzJDVXVGRmVUQXFmQXRpSWpyd2h4clVrWUlkdndpdjZPZGdx?=
 =?utf-8?B?SlVkQnQ0QUhxczNFMk4zVDN6UnRsYWRveTNBc0tmeGxYTmNiemY3RWZKdGk3?=
 =?utf-8?B?cExsSVZOS2VJOVRRcTZ6Slp4RzRGbGVGeFJPS0JYTVMwMHdabW5wdGhiM0dy?=
 =?utf-8?B?ak9kdVhJWkpTMjBwRDNneUVOM2o2K0tNdVB1TnFFb1hTalhsYTZoLzhncCtm?=
 =?utf-8?B?SkZMVnYwOG8wdXpmMVpXN1dLVUVPelE1bzBYcnZ4cmpreUNjTVEyYVJ1MFBz?=
 =?utf-8?B?MktzSzE1R1RRcWRraXpOMkRxeTIxa1cvZitTREtmYnJvdFVhUlNYTEt0eVN5?=
 =?utf-8?B?TEh0M1BhRnVqS1Z5M2ZuNUNqTWxDTkk1dUdxSUJHVFpGbFlXT2tNb3ZtbWU3?=
 =?utf-8?Q?a24DWZVbFQAGTcK+rpU7DTZWX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b9a312-a0d2-49dd-bc05-08daefb53ff2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 07:11:36.9056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVQd4rDxEdi6rGYpskdP6bYcAmzaB0VKxB1XC0IXVuRmOxNo9VUAjzm/RmmYyCMrIax3A2YlL4yT+cPwgjCUuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8976

On 05.01.2023 21:28, Andrew Cooper wrote:
> On 22/12/2022 10:31 pm, Demi Marie Obenour wrote:
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>> index 424b12cfb27d6ade2ec63eacb8afe5df82465451..0230a7bc17cbd4362a42ea64cea695f31f5e0f86 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1417,6 +1417,17 @@ detection of systems known to misbehave upon accesses to that port.
>>  ### idle_latency_factor (x86)
>>  > `= <integer>`
>>  
>> +### invalid-cacheability (x86)
>> +> `= allow | deny | trap`
>> +
>> +> Default: `deny` in release builds, otherwise `trap`
>> +
>> +Specify what happens when a PV guest tries to use one of the reserved entries in
>> +the PAT.  `deny` causes the attempt to be rejected with -EINVAL, `allow` allows
>> +the attempt, and `trap` causes a general protection fault to be raised.
>> +Currently, the reserved entries are marked as uncacheable in Xen's PAT, but this
>> +will change if new memory types are added, so guests must not rely on it.
>> +
> 
> This wants to be scoped under "pv", and not a top-level option.  Current
> parsing is at the top of xen/arch/x86/pv/domain.c
> 
> How about `pv={no-}oob-pat`, and parse it into the opt_pv_oob_pat boolean ?
> 
> There really is no need to distinguish between deny and trap.  IMO,
> injecting #GP unilaterally is fine (to a guest expecting the hypercall
> to succeed, -EINVAL vs #GP makes no difference, but #GP is far more
> useful to a human trying to debug issues here), but I could be talked
> into putting that behind a CONFIG_DEBUG if other feel strongly.

What is or is not useful to guests is guesswork. They might be "handling"
failure with BUG(), in which case they'd still see a backtrace. So to me,
as previously said, injecting #GP in the case here can only reasonably be
a debugging aid (and hence be dependent upon DEBUG).

Jan

