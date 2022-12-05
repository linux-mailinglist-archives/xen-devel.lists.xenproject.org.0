Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1451B6429CD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 14:45:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453662.711247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Blk-0001sH-Ne; Mon, 05 Dec 2022 13:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453662.711247; Mon, 05 Dec 2022 13:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Blk-0001q5-Ka; Mon, 05 Dec 2022 13:44:28 +0000
Received: by outflank-mailman (input) for mailman id 453662;
 Mon, 05 Dec 2022 13:44:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Zgi=4D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2Blk-0001pz-1X
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 13:44:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7d00::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9caa41f-74a2-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 14:44:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8599.eurprd04.prod.outlook.com (2603:10a6:10:2da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Mon, 5 Dec
 2022 13:44:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 13:44:24 +0000
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
X-Inumbo-ID: e9caa41f-74a2-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiwqqJfQH/jWTAFJocsuPbULfvqNqCI5egg1OXe7Eqszes/V9ktXUWXldohaNA0l33/d+X+ZMJLq6ZWofqHcgwBFWdPYPBB2yhVF4VIwe0cgCIH25pJf4Uj7ZDYbXuJ3EFpVs1H6/+/V3DQOiwbG1VpyRXkfGiwg/uJeyS7pd5M6N2ovEahcqj7/WxEWlU0Zu4Ue3XelxpuumGlXXurHcxeF8nWSS1iYVbz9OpRywvuoBRWeCWwUUxGwFStBkuLYGLky71xT4szHpDcmJqtUp01DsGyGERjorQtkSE4LD8bvAeEhUAZx+IbqjZE+ISitkhb+x4khs+gFAW+6toKpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJWX5i/UjY80zkHgdh62XxlDc7OIJ4WxgJOe3jSKZJo=;
 b=aSrgM35JrPMhLh/hm0f4RUK726QxE03VsNHEHtBULFnEBZFKPfrO8N9WRKGEmImdBwwqen1Uyf3hY6p4CxSBU9eB31LQbZLXZBoqQg0+EbDhtSOvrBBK+jgFS9CG8Y1ObveXPQ9i81ELcGm57xSChd5YnSC65/2cR2YnJ+xg6ab36b4wwGP3HjtQRsweAbGdhTqUovIGDoxOMUI0dTfnZqkkvvY0Iz7p5551L0/3YSLsRSkTQf68YicCxkScCVdCfnJz1duukl3ZaeLjhAf7oGWlCP4heWUyRHB2XJEm+B1a1FFgJywdvSqvbLCiYXHKvSteo6U9irv/GXku/Pp6qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJWX5i/UjY80zkHgdh62XxlDc7OIJ4WxgJOe3jSKZJo=;
 b=yaZQYUARlN7ahcbaFnnVxE3sOAPHupW2Z1JUEfjZpChTA4df9NuK8MK8s88/s2+n8yR6IvbMzWbpGbWs5oU21oAzqGq3NnE7vn4IrRzyWEIgcMEaCeGD/HUkBAQIDNAAUz+mW725rtqTtOzwk9fFs8wzoxo8u2ksFu8YED+Q5KQB4Zv/Cgvxi2jlWbVZKDJi6CC4YfXt6qY9JqGxDQTjXxpwrUnLoy+9SL/Jt9bMmgBjXW3nyAvk46ejHBvtHRXlXoAHSK6X7uSrQdzcuksTYBC9dnIoPAPVUr5C+zGuRnSEZailQUm3WWU/eaa2wgpqvMqHVoprzemaQ7M5YCZXIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f94f9c80-3477-c6f4-bdaa-a4119ffe69dd@suse.com>
Date: Mon, 5 Dec 2022 14:44:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
 <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
 <5a2df843-1acd-ad78-baff-e47befd0703c@citrix.com>
 <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
 <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: 2701ff38-5a9d-42fb-85ac-08dad6c6d238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1uOL5b3VRUZbNZ27WX1MyuW4fMh+ysR0ts4M8n2k5cV+fNWf2t5olhgfYrlxyTvzOyTlL8RWtvLSWHzjPl7VCdlEDGgLQUHBYhE5Xt9xFuORGewzKNRDF37/J5ZwHYA5UzStMqJnxAPU74OvdJruWOQwMVOBFVl7cVynXVjEHSSNV9efS63CY8r79Igsi0Gurt72ScVvynjJuKdPyb/2zMgWn0vPPVXJtoqCUdIaZc2UJ9WDRDnaZAgCNWD5dne9Qo9/ZY1Bg66lFvS9WrNs47yzmgse6Yz5qxCZn2acnqVutpd0KkHri1u8Ok1NES8XG2OvJfM33TB4MO7mF5OqNO8UBT0bYXRtRVzgrsV5pt/a4jPA+33SXmAAkddxOGzbqLEd9QGcwhRtERExnPRI63AuBVNSEUsCo/jU1UQs9k0HB6kvfL7Ve50CZYiyPvnowZw9syrun6cWTUNQYBtMM9JV47eN/RmBIDT8p4vhTIOEMIKDdftJ0Cj+F2Y3G7/pGFjbDO4bw4QEDrPVdgqMrucM7C8Dt5gLmRvzE6BxB96WhJnVkqhcn1uQFkHkT3/VcPx8UDEIJNSuV0S0Bs+e+FWKW/5iPS5nAfhPg6Fan418RrImPPgC6vtuQtfvhvvurQpktLnBtGDUWR6PYG5T53H7dOq4p2fXnJhazs4L98pDhGPF7na5yRh91cyImkT7wxElS2VThcaNo37cHCQHc1MLU26yc1Erk0nuzRLblRk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199015)(6486002)(53546011)(31686004)(6506007)(6512007)(4326008)(26005)(316002)(6916009)(54906003)(31696002)(86362001)(66556008)(66946007)(8676002)(66476007)(2906002)(186003)(41300700001)(38100700002)(2616005)(8936002)(478600001)(83380400001)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjNsTzV2K3ZWNy96YnNvN2ExOFpzUzM1cTZmK3lSY1RCcHpJSnhpVHAxM3JZ?=
 =?utf-8?B?Z0pCelhhci9PNFdnZVFHaFhpUnVoRlBwUDJCNUFidFEzaUEwdWZnREFSa0pJ?=
 =?utf-8?B?NjhhZEFvK1lkNEFidStkbXROUFB6eDNyQkhBVzZrbktnUWZMNTBra3RqVy83?=
 =?utf-8?B?bkdmZWF5OEFDUzVUM2ZsQXc0N29DQkNXUFhoMHhTdGR0MEhQcjJ4M0hBOUlU?=
 =?utf-8?B?RGFtUWJkUUROQkhQRDlIMmI0UFo0Y3lEOGovUzRpSmlSQ0YxcVRCT2plV1ho?=
 =?utf-8?B?aDZ6NG0vdXZmV2Vlb2pUdndLSnduZVBCcEs1OUZmWDh0cGl5aGNIY0VMOVly?=
 =?utf-8?B?UWdhVXVIWVhaYmpyZmRSNytGWW01dzQ3UHdla1oxVU9xWG1Pd21MOWZlckZH?=
 =?utf-8?B?TDFTVnFnb1AxY1hJQURCWXU0N09ZbDFqTE5oUHVsMXNqQ0lVZnB2Z1NwMzBE?=
 =?utf-8?B?NTQvdm9Ra01SVVpSd3QwVDhLNDRVK0lGR3JBeEgxVy82WTJGTWFRSHJWTGlR?=
 =?utf-8?B?c24vR0UyK0IxaEhSR2srSkF4MG5Ua09yNnFLVVJxaEplMm9sSXhPRUkxdFJU?=
 =?utf-8?B?VVg3bFFlSjl4SnNnV2U0bmh1R01FbHkvelB0cWlaeGVKS1F6S04rb3pXSjVH?=
 =?utf-8?B?b1Q5VGVyY0U1cmxoNFFhYldLR1N1U0lyb2RXeklJOXQrOUZEamgzVXRNVEF6?=
 =?utf-8?B?MzdONjZLRUJDT0hsclM2NUVQOS90bkFHZVhBN21UQzVsZ0ZBSE5HNWVIdUhh?=
 =?utf-8?B?ZVY5dnlJb29xeHdtZGNFNXl1ZnFXcDBSOG5Sdk5ZSFNYTE9ia1dLNllOWXh3?=
 =?utf-8?B?WmlvUzdHUGEwRE5OeUM5bzFUSGJQV1E4WCt0ZE40K0xxTG9IYnFHcDU1a01E?=
 =?utf-8?B?b2xxcllQVHM2VFpwRUlnRWFIRklDMEtGZWczR1N3Z25TdEppYmV0aVNlR3k5?=
 =?utf-8?B?UFB4WS9WTFBSVzdYK3RmVVVtUDYvTkw5dFE2RXFacWR3Mkh0UVFMNHpYM0Zi?=
 =?utf-8?B?YTZIdkFtNlVwYTJiYm9IMzNrcE56WkliaGlpVVFYWnQ2R3NCVm9JS1FBcFVJ?=
 =?utf-8?B?dVF1cFJSS2RYek82VWYxTDMzTlRuM0hVTWRpV21IeTJaSitCNXBXSUdFQnM2?=
 =?utf-8?B?NTNmTVBIODVpelJoQmVvL2lYTjhDMXF1amg4WFltY3NwamlHb1JWdkhmWEYr?=
 =?utf-8?B?RlNiRkxCa1lvYy9NOEJvbWVjT1ZMM1lzb2haQlJ6bHhXclRjLytFeGpxRk55?=
 =?utf-8?B?anA4THF4SCtvUkJ0RzFHNmxKZUF1eHNYZ2taTmluM2lNemdmRFFJRGdoQS9G?=
 =?utf-8?B?MWxQQysvQ0pwREJrS2c2Z1lxTWtNWlJIVFZQTFBURVN2TVc2K3VIK1c2M0tQ?=
 =?utf-8?B?OXFDb3NUek5GYzlzcm1jTXEyMDVXZExUYTdLeTU1aWpGMTJvQm9JMzh3SDhy?=
 =?utf-8?B?SW8xQzhrOVZQeUF3WjZrKzc2b3dPdk5RcFZmcVlFZ2xrbDFtN1RwczI0RjdX?=
 =?utf-8?B?WGZFd2t4RUVUMy9zY0V0KzE4Nmhha0I1ZFRheTFUYmZVa0V0NERKWDd4WFRB?=
 =?utf-8?B?NnE3Qm8yUGFiencvVldJcGVtSmZVWlk5OWdBK2R5em5Xd004aHY2SHNyRCto?=
 =?utf-8?B?ZDJzUlNRL2REdWhXditDM0FJdUgweGVOazBTWmp5Z2RYZUpuK1ZsOU5GY2gv?=
 =?utf-8?B?bWpFcG5hV2ZhZ012RnhwbFNTUW93Z3czdVk3WTJaOGdSVmgyK3FzSWpqcE5t?=
 =?utf-8?B?NXQ4SklUeTFNa3NZb2tjdG5nMHk1Q0puOTZ5Qm82bG84YU5kZW90UUhxVmNu?=
 =?utf-8?B?eS9scmt2aExOMFpoZ1pCb2JTVHgrVUwzNjhMVWtUU0ZnRlZESVlpcnJyUFN0?=
 =?utf-8?B?Rk1ETE0vOFJ3MU84T2ttYWxpTng0UGdkWmUvZFozeTNaR2NrZkVTSStsZnov?=
 =?utf-8?B?YzJnSEJ1d2hQcTdHNWI0QUoyN0ZYejhNUUZ1MW4vc05OcGw3WVdCOUdoK2Jh?=
 =?utf-8?B?WFVJZHAvOEZKd2JUNWFjd1RjcHlRSWQyd2dsRDY0ZU9lc1RTWEV1dUJqNktl?=
 =?utf-8?B?WWlUQi9pNXFPbld3K1hFMVRDSU9qcSt5OVkreEl5SmNzcEk5SHZlWFVwbVRI?=
 =?utf-8?Q?cy4WhMHoGDC8PUVij9pp7Ytaf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2701ff38-5a9d-42fb-85ac-08dad6c6d238
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 13:44:24.7165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7OONVkiDgSg3KH7zGoxl0wh267ZfRU9dv+LoOFCaOiQOw9A5ri+ItJ8GxyymcGMLR2rkZF2Ta93qm+Zg06r5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8599

On 21.11.2022 13:23, Andrew Cooper wrote:
> On 21/11/2022 08:56, Jan Beulich wrote:
>> On 18.11.2022 15:27, Andrew Cooper wrote:
>>> On 18/11/2022 12:54, Jan Beulich wrote:
>>>> On 18.11.2022 13:33, Andrew Cooper wrote:
>>>>> On 18/11/2022 10:31, Jan Beulich wrote:
>>>>>> Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
>>>>>> exposed a problem with the marking of the respective vector as
>>>>>> pending: For quite some time Linux has been checking whether any stale
>>>>>> ISR or IRR bits would still be set while preparing the LAPIC for use.
>>>>>> This check is now triggering on the upcall vector, as the registration,
>>>>>> at least for APs, happens before the LAPIC is actually enabled.
>>>>>>
>>>>>> In software-disabled state an LAPIC would not accept any interrupt
>>>>>> requests and hence no IRR bit would newly become set while in this
>>>>>> state. As a result it is also wrong for us to mark the upcall vector as
>>>>>> having a pending request when the vLAPIC is in this state.
>>>>> I agree with this.
>>>>>
>>>>>> To compensate for the "enabled" check added to the assertion logic, add
>>>>>> logic to (conditionally) mark the upcall vector as having a request
>>>>>> pending at the time the LAPIC is being software-enabled by the guest.
>>>>> But this, I don't think is appropriate.
>>>>>
>>>>> The point of raising on enable is allegedly to work around setup race
>>>>> conditions.  I'm unconvinced by this reasoning, but it is what it is,
>>>>> and the stated behaviour is to raise there and then.
>>>>>
>>>>> If a guest enables evtchn while the LAPIC is disabled, then the
>>>>> interrupt is lost.  Like every other interrupt in an x86 system.
>>>> Edge triggered ones you mean, I suppose, but yes.
>>> For IO-APIC systems, you mostly lose line interrupts too, don't you?
>>>
>>> The line will remain pending at the IO-APIC, but nothing in the system
>>> will unwedge until someone polls the IO-APIC.
>>>
>>> Either way...
>>>
>>>>> I don't think there is any credible way a guest kernel author can expect
>>>>> the weird evtchn edgecase to wait for an arbitrary point in the future,
>>>>> and it's a corner case that I think is worth not keeping.
>>>> Well - did you look at 7b5b8ca7dffd ("x86/upcall: inject a spurious event
>>>> after setting upcall vector"), referenced by the Fixes: tag? The issue is
>>>> that with evtchn_upcall_pending once set, there would never again be a
>>>> notification.
>>> Ok, so we do need to do something.
>>>
>>>>  So if what you say is to be the model we follow, then that
>>>> earlier change was perhaps wrong as well. Instead it should then have
>>>> been a guest change (as also implicit from your reply) to clear
>>>> evtchn_upcall_pending after vCPU info registration (there) or LAPIC
>>>> enabling (here), perhaps by way of "manually" invoking the handling of
>>>> that pending event, or by issuing a self-IPI with that vector.
>>>> Especially the LAPIC enabling case would then be yet another Xen-specific
>>>> on a guest code path which better wouldn't have to be aware of Xen. 
>>> Without trying to prescribe how to fix this specific issue, wherever
>>> possible we should be trying to limit the Xen-isms from non-Xen areas. 
>>> There's a whole lot of poorly described and surprising behaviours which
>>> have not stood the test of time.
>>>
>>> In this case, it seems that we have yet another x86 PV-ism which hasn't
>>> translated well x86 HVM.  Specifically, we're trying to overlay an
>>> entirely shared-memory (and delayed return-to-guest) interrupt
>>> controller onto one which is properly constructed to handle events in
>>> realtime.
>>>
>>>
>>> I even got as far as writing that maybe leaving it as-is was the best
>>> option (principle of least surprise for Xen developers), but our
>>> "friend" apic acceleration strikes again.
>>>
>>> Xen doesn't always get a VMExit when the guest clears SW_DISABLE,
>>> because microcode may have accelerated it.
>> But as per "APIC-Write Emulation" in the SDM we'd still get an APIC-write
>> VM exit.
> 
> Intel isn't the only accelerated implementation, and there future
> details not in the public docs.
> 
> There will be an implementation we will want to support where Xen
> doesn't get a vmexit for a write to SPIV.

To cover for that, as just discussed, I've added

"Note however that, like for the pt_may_unmask_irq() we already have
 there, long term we may need to find a different solution. This will be
 especially relevant in case yet better LAPIC acceleration would
 eliminate notifications of guest writes to this and other registers."

to the last paragraph of the commit message.

Jan

