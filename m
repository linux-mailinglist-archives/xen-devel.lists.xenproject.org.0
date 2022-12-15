Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5064D768
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 08:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463098.721234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5iym-0001U8-CG; Thu, 15 Dec 2022 07:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463098.721234; Thu, 15 Dec 2022 07:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5iym-0001Rq-8S; Thu, 15 Dec 2022 07:48:32 +0000
Received: by outflank-mailman (input) for mailman id 463098;
 Thu, 15 Dec 2022 07:48:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g8Eh=4N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5iyk-0001Rj-SJ
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 07:48:30 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2086.outbound.protection.outlook.com [40.107.105.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd902ccf-7c4c-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 08:48:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8899.eurprd04.prod.outlook.com (2603:10a6:20b:42e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 07:48:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 07:48:27 +0000
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
X-Inumbo-ID: dd902ccf-7c4c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blppM4ILNX01xuoAAMsgtW5pAhSRP60KXexDNVhFfaOcfyWzH6NkDi+0tK3GCehjNQB5oti87DzCKrY3WlfN/frP3j9crFH7W4TBiqxR+1pl3tamkYO9S89HJaDMKlVO/IGt3930swElhsTSfhCuSO6w0TouI77DalKik6jsG3cXJZexJjXBlYkGm4/BBr0YUwM4PZ1BqdlPcNa1HHx3zF3CPsN9v14QJkWRBXs2qqO1dghnZWeGKcYuoyCtCsPZ5IVFhxUYZjeKH/cvV0JkH3fZ3DyrkDBNjElk8uoD7dOQSNqU7Wg6WE3BEJlw1kbkkzCckGPoWh9u7whudE3o5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/iBnEKcX4PXMTXbAEPvf4ujyqkHLjO6VJKRa5uoNtI=;
 b=aDowR7bPPPMYopeRnfvkraJn2eBef1oe1vpp7MadhebeAoK4Fdejk5z6VYOQPA4A3xigfYVQosSKstYPCdwX7BiLom1RBUhXam11ycJ4y20CtaKySgVOSQL3zCeXjUiT1gBN5P+dBL++0b3ucoTcIxDSTCKxSCxQANhtabtnBkyP0HL+V45tEAE4kjQ9t7B1uiwZ+GF5U2mBJ2NfF9GcH47N+Fhl1ATuT51P86DayVDH9Ge+iB0A7807DyOTXOnhdIdikPczNECPA0i8bE9Vbq7b36kIhdbkzwTMw6/hOIIk7l0jD1oVB/uApkhnHf1juSidtO82Y+Z8d4MWb0xQBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/iBnEKcX4PXMTXbAEPvf4ujyqkHLjO6VJKRa5uoNtI=;
 b=c/uh1TIP4Oos0hFyBcJHQgn3N/dNq1Z7THYMEVgfscZeIO4wYXbnf8Hv5jQ7OSgjoEGCIF0SVWa1FCuwFKKkTRwcTEMPMfNo4ZwI3XW7END6hK9gSBwSFshNsmPoE+NW9XVaBBdDu+HpiR9O3IAQ6+QN+SVIojASeRACesLW6qMJa+jtKgcT1HHiHQPj4IkCbfEsT5ZkoqX7JI0N/y9SsERcV2j9wZI3Swz7W34hqNsMQYB9Dj7lTDAQwjGmtuRBmhkx/+rwVOczB28xhYzr6I7NlK+BVJoUED41DsZuLBZ8BRYpf7ARAjxPJdxv7KZ3QdhL0Srxjb85qnUt2hs82w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5b948f88-7757-7506-aa53-26308893fddf@suse.com>
Date: Thu, 15 Dec 2022 08:48:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 0/3] xen/spinlock: make recursive spinlocks a
 dedicated type
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 Paul Durrant <paul@xen.org>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, xen-devel@lists.xenproject.org
References: <20220910154959.15971-1-jgross@suse.com>
 <933c9378-8f0d-41e6-ec9a-3a702ef13f24@apertussolutions.com>
 <d28412f2-2b94-5c69-c43f-481634562356@suse.com>
 <d57129f5-cfaf-0ed7-0dac-985b3a646b79@apertussolutions.com>
 <0fef4389-0373-b214-800c-f2457676e929@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0fef4389-0373-b214-800c-f2457676e929@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8899:EE_
X-MS-Office365-Filtering-Correlation-Id: e41767ef-e8ea-4a19-7245-08dade70c06b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lJT5gI2Ut5wOynTkvjfBH9rrvBsn+jBvDrGHQPOVGYgJBh8DGGsoShPVDTFCr6ycpMXpiy8UZQGpsAg8usGYtA1bzZyLYsuGopYkhZyHVnKj8pdMz8s1+pMvJDW+0bq3cybKEw8lyFsF4iTAbc80K22ovH11eC7wjrtXKzqiX0OWuXXLlrqenCsMaCrBqaAofXtLvl1dfIcOXCDZlD3uJRj7lo/iw4sRdgo2ScCvo2+oUrDqQfm/95eioWIandeJNfJRyiezAE3ZmJolKNt3lJnzIH0oF1RfAb7bYMenrt7Bh+hfjbtFY49Hv4C6z+LFEe94gkmhRQNt7hQ4A3FmCkiovAhDlkdcNZ6TIJfTc0S/Dphwg/fzs1BrgUSQ67EnJgagdyWUiRMUSRAQ7PklbR/puh3tq502ch9OzsBVGwfwVLPj8uu6gu1hXmK6qzmgGN7aFLTPebAGWicO8Cg2pz/s5cSVvEWvZAt2Sy28SgNir7ALHxaPInePxAaUyqrfQTdrJhSz4dM/i7+agbfqFhQjhSH2h1BpAdqlBNKzryLKwFAoQdbHwuZzxeg7ISFbHPS7adREcUc5jtVqs3zqz0Equ7qacAOJUfCa4zHyOUqDjGC4QnVH4oI9WKXp9ELW+rMnRtaXcEl59WRXCrI74cIMdfhyYLariXyDGo/f50esxK22CRwT9wh1bhkMqJ+Q3r2X8TmFJYrzPN9KGDPPu9f56K0BNQqv9+1bzqCjAx8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199015)(38100700002)(53546011)(186003)(26005)(6512007)(6506007)(2616005)(478600001)(6486002)(83380400001)(36756003)(31686004)(6862004)(8936002)(41300700001)(6636002)(54906003)(37006003)(4326008)(316002)(2906002)(66946007)(66556008)(66476007)(86362001)(8676002)(31696002)(5660300002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGxNQUlHY0JhMW92a3QyMW1UMnozYWtEa1hEZGI5anNNTGVKbnlEYXlUME9D?=
 =?utf-8?B?RXFhbmNhbS9HdmV0Y3Q2dXd4UHBVak8veFAwWnY2RDVkejVON0s2YVlNc3R2?=
 =?utf-8?B?K2lBSEhRVUtCNE9UQ0RhNkRwbjNyYjVsZ05idUozSHQwaEJnS0Q5ODkwZDZv?=
 =?utf-8?B?TUxiWldTV2NnY1JQSENJL2ZXUlVDU3ZmVUwwcE1rT2JFM3hoWHY2YjlxYzZB?=
 =?utf-8?B?bUM5b25nV2FpdjlMeTJnMTE0aTB5VlpzUEx1UzUrK3dCUFlhYi93ZWZ2L2xp?=
 =?utf-8?B?SWdTYmhnbFpoYWNhcmhaWlo4MFJCb3RBU2RmSkNnYnB4dEFQNm5jdUU1TURy?=
 =?utf-8?B?Z3BRWjBPTFlPM2dsSEVtaEp2dFliM3M2UEoyNU1IdjFBVGNPL29RMm5meXBD?=
 =?utf-8?B?bDlheXl2VzZpTzZ1ZjJOMElOUnR2QThGMG94WEtpangyY1o5YmlERGdsNGE1?=
 =?utf-8?B?cWZpN3VoM2kwM1AvekJGMXBYMngrenVGb1U4Y0RaWC8zeWMxVWdVVlpiTms5?=
 =?utf-8?B?bTgwR3BKdlhWdHFiV1I0NVB0Lzlyb0E5YWU5WkRWR3hsY2VBUEg4MWVaVDdr?=
 =?utf-8?B?d1U4UXo5YmlneWZTVzhMUHRkZ3RIdXZzMkZZS2lBbldQMTRmbUFTbmVqbWhY?=
 =?utf-8?B?cHZreEhydDF0NEd0enVCQnRMOGxIV05pT1VyeWRQb29qdVNXcFRybFdnREFp?=
 =?utf-8?B?OUN5NFN5WWIrcjNsbUplVUFXSHNrMmpXL2NFcDkzQXYyK2ZHMGhLbE5RbERV?=
 =?utf-8?B?N01mMGpnTGJkc3BlZHVOMDVDSGw3SVBVbytwYnZwU0NWOC9UUFNBSHpnQkVG?=
 =?utf-8?B?c0ZIa0pFa3d3U2NHMlpHYVlJbUR4M0pZVW0vWmMrek9ORzVMcERjSy85VDlH?=
 =?utf-8?B?akdzMEpTWkxJelFseG1lUDc2NmNPM043V3VvY3JXSER3V09ROWFOYWRmZ2pj?=
 =?utf-8?B?R0lKc2ZKbGMxWWZsbVNOMC9wMjVtU0xYQiswejExR1ZMSWJnME03Y3hsTjZm?=
 =?utf-8?B?QzB4c0JiVnNQR0JEcGEvbktqWGx5TUs3RGRxdmNJUCsrVG41QldsRkN6YTN2?=
 =?utf-8?B?NDlTTTE3b0lkeWJPSUZRaEhaQU5rTTlES0lpUnVXVnNQWXNjMitrck51UzBl?=
 =?utf-8?B?NXdvMWpLLzdWN2hVVFVTZ2VyaktmajMyM21kOGtDcDhxcnZOZDZOVDdJODZB?=
 =?utf-8?B?dUR6SGI1KzJqQ3ZJcHZQN1JRSW05WHA1MEoxMkpVeXByNVphc3VRSHoyQkQx?=
 =?utf-8?B?MVU1emZWeHBNYm9WTzF6UzF0VnMrUTUxeGNUOVQyaWVmUVYrL0tTbkw0bVUr?=
 =?utf-8?B?UnAzSEt2c28xS1dnTW5NOTgvWXExZVBPc0hrUklIc1Fod0YrWEQ2c0lrZ2VG?=
 =?utf-8?B?NndRSXNYZHp5ck9zYWRxMVJQUWNOem1WQW5OdzllejVzN1dreDBjenR3b2E0?=
 =?utf-8?B?MUJxQ1V4YkRsT2duSDZrKzZJbWtmcFZ6M3VBQk9kYjhZSFRaWk5sNmFBVzhH?=
 =?utf-8?B?cC8wQ0hNL0grS1VQa3B2YllkMlBJem1oQm9tVDkvWGF4Ri9QSVEvZG1aZnJW?=
 =?utf-8?B?eVNaZjh6UkRhbHNKbGtPWW4zUThDTDB3ZUVMdjhxaDFGa1h6dVRxNjMxajJO?=
 =?utf-8?B?N0I2ampTVmZyRlJ5ZDN6b1lmWVp1bFF2MVF4VFpkYlU5T1FiRTlCeEpyMlVQ?=
 =?utf-8?B?MHZLZUxWNFVsSzJhbksvY3RLb1BPRE1xcVd3V0N0UExDWUN6Q1RkbHFTRkMw?=
 =?utf-8?B?aHZxZFQvczdCOFBLYVkvL3FEM3djNlVjckw2SXJEaExmSk51a1J3SkJDWFNN?=
 =?utf-8?B?QlZ5aWU1U1grYzFZYzVMVDN2bWQ2ZGRPTXlXbUF2anExckFEd2JjUmkySDBE?=
 =?utf-8?B?L3ZTMG5BQVdWYk9KRjJ4VWZTQlYyQTRzTm9HelBkQmtSNXhRc2VnVU1oSTNw?=
 =?utf-8?B?M1lkZU5wcm4yT0Z2NGpNb2JxUEVrcTJ6T1hxbERxRFVocHpWTDlJN1Q4bU1C?=
 =?utf-8?B?YmlXaVB6YUo0V2l3Q2JBajJRMVcyOFFXM05KeitscVZacG8rVGpTa2huRFhs?=
 =?utf-8?B?SFdmWHVFUUIwUlRWd3puOUJYN2FucEZIUkZYMWVyQ0gyTUg0MlEzbEwxRE9O?=
 =?utf-8?Q?w7aGhm+u54ZCnapStPPQtlO1H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e41767ef-e8ea-4a19-7245-08dade70c06b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 07:48:27.3410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xnk/7LYoIOES4KmA8dQKPczrr9byxRkOkMx18hV+JBqHJsSKlE4496Ua//D0T3vrwfViwgtSxLQ2yDpBKhIlYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8899

On 14.12.2022 17:36, Juergen Gross wrote:
> On 14.12.22 17:25, Daniel P. Smith wrote:
>> On 12/14/22 10:31, Juergen Gross wrote:
>>> On 14.12.22 16:03, Daniel P. Smith wrote:
>>>>
>>>> On 9/10/22 11:49, Juergen Gross wrote:
>>>>> Instead of being able to use normal spinlocks as recursive ones, too,
>>>>> make recursive spinlocks a special lock type.
>>>>>
>>>>> This will make the spinlock structure smaller in production builds and
>>>>> add type-safety.
>>>>
>>>> Just a little yak shaving, IMHO a spinlock is normally not expected to be 
>>>> recursive. Thus explicitly naming a spinlock as non-recursive I find to be 
>>>> redundant along with being expensive for typing. Whereas a recursive spinlock 
>>>> is the special instance and should have a declarative distinction. Only 
>>>> codifying the recursive type would significantly cut down on the size of the 
>>>> series and still provide equal type and visual clarification.
>>>
>>> A "normal" spinlock is non-recursive.
>>>
>>> A recursive spinlock in Xen can be either taken recursive, or it can be taken
>>> non-recursive, causing further recursive attempts to spin.
>>
>> Yes, I understand the current situation.
>>
>>> So the explicit non-recursive locking applies to that special treatment of
>>> recursive spinlocks.
>>
>> I understand this, but to help clarify what I am saying is that individuals 
>> coming from outside Xen would expect is the spinlock family of calls to behave 
>> as a non-recursive spinlocks and recursive spinlock family of calls would 
>> provide the recursive behavior. Currently Xen's behavior is backwards to this, 
>> which this series continues and is a valid approach. Here spinlock and recursive 
>> spinlock family of calls are recursive and must use non-recursive spinlock 
>> family to have "normal" spinlock behavior. IMHO it would greatly simplify the 
> 
> My series doesn't change treatment of normal spinlocks. They are still used via
> spin_{lock,locked,unlock}.
> 
>> code and align with the "normal" understanding of spinlocks if instead 
>> spin_{lock,locked,unlock} macros were the non-recursive calls and 
>> spin_{lock,locked,unlock}_recursive macros were the recursive calls. Then there 
>> would only be two suites of calls for spinlocks and a lot less keystrokes for 
>> need for most development.
> 
> Only the recursive spinlock type user must specify, whether a lock is meant to
> be handled as a recursive or a non-recursive lock attempt. This is similar to
> a rwlock, where the user must specify whether to lock as a reader or a writer.

While I can't come up with anything neat right away, it feels like it should be
possible to come up with some trickery to make spin_lock() usable on both lock
types, eliminating the need to ..._nonrecursive() variants visible at use sites
(they may still be necessary as helpers then). At least if a spinlock_t instance
wasn't embedded in the recursive lock struct (as I did suggest), then something
along the lines of what tgmath.h does may be possible.

Jan

