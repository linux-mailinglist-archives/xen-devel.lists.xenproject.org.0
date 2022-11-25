Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B120A638571
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 09:44:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448105.704959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyUJa-0007Sm-Kr; Fri, 25 Nov 2022 08:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448105.704959; Fri, 25 Nov 2022 08:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyUJa-0007R0-HR; Fri, 25 Nov 2022 08:44:06 +0000
Received: by outflank-mailman (input) for mailman id 448105;
 Fri, 25 Nov 2022 08:44:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rprq=3Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oyUJY-0007Qs-Ow
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 08:44:04 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5022530a-6c9d-11ed-91b6-6bf2151ebd3b;
 Fri, 25 Nov 2022 09:44:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8563.eurprd04.prod.outlook.com (2603:10a6:20b:422::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 25 Nov
 2022 08:44:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 08:44:00 +0000
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
X-Inumbo-ID: 5022530a-6c9d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5WYWl++bdF2J7RukIjxz5pUjrDZ8F5L36dFLlrKmFmwdHOP4Tqvf6kfQRKHGHi4+AI368xZ98R1BlRsw6of3iLWrATKvkcnOWoiKzjrSVFJgO5eG17WiHu1yXdTYNgZCWHjId/Ji7FA2DrP51fHXOh1NZ0TXVO4hn2di/s/dwAWD21yynMYVDbXUDrg4bwmvM3pmqSForD7sIOsovStm0bxSUhs0sB0BjfWW2jPUiws4gwjs2jLGBv24SJ6n+17kBr1HoPb9V2KZSqWK5DebSA/k7G5WkCTfxvsUnnLi73wBXt3Zoczr9uVoTgTphYSpgGckS0WCuTOKa/NYn/bQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNO0OoUqwmpTxsu+T5m5itKfKI+xNFgcstOiM5jmLIY=;
 b=hHmoI8zsWLF/WAqIBwJ1SgqcalYH/dpTjhTbBaWZ9I8XZI2VloVvQNlo+DuApq3qiuOBwVPVakh/d8NCPeY02Yfm/JfMETiBcUazZY058+FJH/K53T1fWsPcgCSgyWIIr2wkS9qhUJbKJ+eoP/x+gx+lKHTju/y/CoE7kZsOaQ63ytroxTlRJXR22Lbuwi52j/iFO5p2PvTicrxpVUzw9rQ3dLLtLAarj6zKFWMFBL6t2Bs4gy0izFRTZt7MzxdxEFNucvcF5AZfAWXrdC6QMEiiVFNwP/yO570hba0HBTC7c+oSkt2Nbtopjo/nZ8K1H/dlz+GcfjnLI3qklzejeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNO0OoUqwmpTxsu+T5m5itKfKI+xNFgcstOiM5jmLIY=;
 b=bIPFFngm9Tybyq/IHc50lwxGm28LPg0y+LQs+d4r9VtorvQs+e9JkR6WbCa/beq+MLPwMibMRVA623LDjzaD9I93HID9nRdErpcD7O7f26R7s4gBGOtgdi4xBF0J+XeSqfws/uSOaGx2oxOZEHUjMp5PvbSujPIjYojE4EhtgaydBtBShylJV7dbK8SpuGLI8U1PLiuzi0XnClzZYri36bzcmYXwMwzqe6sGUTUS6RCXGvgqVUmPofohjYA2+9OKqbPhDEBrBcLGlenzU0AxYPDTg0DJOkzHE2y/HdXwR0ee5HgCzk4Ua6xL85daQzxLahbRILa2IuFlPhAJgZL89g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <516fb872-bc79-ad8a-233b-b821265c1911@suse.com>
Date: Fri, 25 Nov 2022 09:43:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
 <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
 <33a005bf-0596-c624-0e70-077a450ac2ae@suse.com>
 <Y34L/MwSFGUsSe2I@Air-de-Roger>
 <351a6e54-8002-aef0-993a-c6b8bdcc1e8e@suse.com>
 <Y38ugExH9uGdw83a@Air-de-Roger> <Y38z/h4aEkzh5rCG@Air-de-Roger>
 <c928c198-2565-2105-2b6e-b07e96935080@suse.com>
 <Y386hoiAovoACjEG@Air-de-Roger>
 <3f3bced7-62e8-4ff2-655d-aed222f343a9@suse.com>
 <Y3+JwEtSHTRhngN1@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y3+JwEtSHTRhngN1@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8563:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d5b1c9-6acb-43a1-f153-08dacec132d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GUhHsfh+6n3kVS8xMki2lu9CuoxMlcyBmjSVb6qBYvWfqfBy0Q0JWKYbeuOgSwOH6SoL8ahCBDoSs/9m6wMCld2NaY4hqJIUFPmKBd/IoGs/p/WDxygzo3lK8ZsX4o2JFguwMrd/DUV/1649r9gbV4SC8d3xqLZeOMrbktXwvUZLEayVW2H8YSJAqhcJLKP3p7KeUQF3adCIMDvQ9aitJ+9WDnXCv02Z4Bmyz6y0qrAThFygin5IYVKlzqadhrEwN3EN8O9UR2k9BoUiPPZmMQch7GJmLZFBm0SRXOFk/HUmaiiRs7DLpola8oi5/O+CHTBgvCYt9VL7Mc/Cl7qOk4rIpEsI7nJxRjoRmFvoQqZZqyrCIKYsUVwVI98O9wUX06rbAgk2bQHQ3CbviQ+/se6y79OSPx6yFOuH9JovioiLJfNMF/flHaP0VTuA0njlvPo5IHqHRXGZHvGlzIfII7jrUFhPPuS5axGCADMNvevN8Gr13wP45xQWXr7f5FA7OPIzenqe7dX+EiNMg2mnHHrs574APUw+G/2ItPiGKDuY0mclivyJ/2XdoIBamLHO1uYtYerpFNG6MNe85npI+eCqL+y9ECktWO915udt4ePAkYMUxGLiX4Mx7Y0vaQiqM4AM4ypnAThHrBi3o0nQ38iXoFLHu7cQORTyV4XYkVs9GL5qrbmkQI5WothTdJQwDz4GWGAIPqOdQezLAnO9vw6YeuwVK79mX1L4MsBX+C5BJOc5WNdtQ7ADqaHWr0sG790fqD9joXfRpVEiLV4iyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199015)(36756003)(86362001)(31696002)(6486002)(478600001)(966005)(6506007)(53546011)(66556008)(5660300002)(41300700001)(4326008)(66946007)(8936002)(316002)(6916009)(8676002)(6512007)(2906002)(66476007)(54906003)(26005)(38100700002)(186003)(2616005)(83380400001)(31686004)(66899015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXpYQXVoUk8raGhRRGlDQzNDMzB6bXZxTzBkUlNaQnpZTGxPK0wvd1lENUVr?=
 =?utf-8?B?Y1B1S0k3dE55djFFaTBsWTd6dWFOcEtKZUpiMW9vUkdaMlZRdDhHY1NaYXBi?=
 =?utf-8?B?V0VubVc2c0xMdjh4T1NjSUJKeVdkU3hsdjZHUXQwdjlHckZtdEZaYVhkQ2Zz?=
 =?utf-8?B?VU8vR2NTVVc0T2kzbVR0QXFaNWlWdEtWQXlrcDcvSkY0UjdtaXVCSXY1b3BR?=
 =?utf-8?B?N0J0QzVqVlFLN2d0bTgzOHVVTTQ2T3A5Y1BlUm1qQ3pleGppdXVoei9KK0w4?=
 =?utf-8?B?Z1RqSDlyeEJ4Qnp0SnRuSkJabGVzaklnTUhtTzE4MVlJSzRaa05FZGFqWEZm?=
 =?utf-8?B?bHB4aVdxWlk5MTlRcmpDMUNGald1Ky83Ukcrc1RPZ1RMQjZ5QjVaUFl0UzlT?=
 =?utf-8?B?TmdkWjluc1pNZXUrWUdJdlFobGNMMVRJaG1jS3JiTnV4VDcyLzd6c043SkEy?=
 =?utf-8?B?M3oza1JCWDI3YllPcGJ0dG9wZlBsYVU5aFhNY043bUFGTTc5OXRDcFA0dnJQ?=
 =?utf-8?B?ZE1INlo4bXNHeUdLZlBDczNNV0Vpdnc3YjV6Y1MrQVFGY25LMXVsamRhRkdH?=
 =?utf-8?B?RGI2QmpJVjhuK3ZKMmc1VjNFbkVjcHNsS3VYcFByWFV0UDVvdmlBWXZkaTB4?=
 =?utf-8?B?dnFkVzZFUnN3QjhTbVNNMmREYlRnK0tFcTZwWUJ6STMrdk9HVlZVMkJsSEh1?=
 =?utf-8?B?dXhxTGhaOEhPOVE1eUZXYVpNeGRiWUhvWnZGYi93SjJvNUt4eEQwNWU5RzhM?=
 =?utf-8?B?Q1BQejBwang1YTQ2c0U0T1p4bnJBM2VGQUptSldJODhPNk5BcTFWdU1kenV2?=
 =?utf-8?B?a1c1NHNKNGFhT29tSldXVDVJUENwZXU4MHZJdU5YTTN1Rmk1Y0p3M1c4amlh?=
 =?utf-8?B?am92THl5anFRZmFaMXJqRjA3YTREREVJN3F3R3ZyT3cxQysvbGVuZ3Btd3Zr?=
 =?utf-8?B?aVVNRmFxbmZGQnJiVkNuN3VsUmE2akVFVDRwSDVFS1RPM0ora2srM3VHZGNq?=
 =?utf-8?B?ODIwdkN5M3RkZkN4QVk4cUxURldkMkdGK0EwekZ1T0tzcU9yRTYxSlh4OHFz?=
 =?utf-8?B?WHVRNnI5ZjVOMDBwTmFQd0hRb2JCdnBBbVJkZVRldmJBeHlKbG1KN0NGMHJH?=
 =?utf-8?B?US93L0VSK2hLRFRnK3lqdlBoK01LODhSeVh0V0FEOWlwcTFBNDVaNndsd2FY?=
 =?utf-8?B?V0pBUlp3cnA5VVdUN2pEYjIrK3NkWTRtMDJxajd0cHlFZG5NdHJzWjBHQjFm?=
 =?utf-8?B?N0lnTzg2bVFocjNkeGsxMUpkbi9OYzJZck8zY1NFYmUrbXd3YTFiRHJNQ0RH?=
 =?utf-8?B?RGZXc2hMTk5ScjBjKzNnbERyYUVTbnYxS0xzQTYxaXdoLzdTSzNGNnpOcGQ2?=
 =?utf-8?B?MWFMV3pEdnJ1OTRpQXRSbUc3MmlxMGErbDJxZ0tWWlVqejR4QVRsa01aN2NG?=
 =?utf-8?B?MFVwaFJJT25kaG9GdFN5bWlHWWJtZGZOZmE3Zi8zSFRWbDZLaGVqSE4zL3Qz?=
 =?utf-8?B?ZmMwUVlmV3d0VEU0UGFXZllUa2RPTnN5R2pDNGg2dmt1OGorVEY2dWFYODJI?=
 =?utf-8?B?bldqWi9ZN2M0bGd5WHhkVFVYWXJXZUEwWWk1NEFuVXg3eFlWRGFrTjNibFBJ?=
 =?utf-8?B?akFuQ0F1ZXJLV2lMOVpLbCtINW9MYnFNZzhUOVN3bThXT3NjTkRjL2NZbDMv?=
 =?utf-8?B?ZUZBRGplYjBaVEdCVHVVNno0MjVOLzJRQ0xWZ0tCOUNjZGxTbUJGeXI1WUFw?=
 =?utf-8?B?TFRNTWszWnJlQSt0RUdkdlIxK1VsQ3R0czhlMU1MUzJYL1Q1Yjd5Zzcrbllx?=
 =?utf-8?B?akhzanBidnZaQTlvL3JFVmR1bUhQanR5OWtSSENnTS9pSTJUbW8zenN3ZlFB?=
 =?utf-8?B?Y0FrYWw2L2pvUm4yakt5TkxqdFFjaWZpdVlNK3RnRWJTK0gvZ2FTc2tidUV3?=
 =?utf-8?B?Y1dZM1g4UzA2Qy9QR0RzTmI5ZlR2aW1EcEthZWUza3RFUDN5aFRBT2lyVTJC?=
 =?utf-8?B?M0pOSEpyZGVHbHpXbjdwT2s5ditpQ2hXUVJML0ZLVDEzY0h4eW5qWUVNMEEz?=
 =?utf-8?B?YmJRQ2IxR2tDbkphVXR1MjAydVpnejBqZG9OUFlSaTN3S0g5TkxNL3YxQ0hF?=
 =?utf-8?Q?PNKEb5QPcd3KCKiMsWhE96MQV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d5b1c9-6acb-43a1-f153-08dacec132d8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 08:44:00.5153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQDRb+Nr2rBbUegIDnEnIjW4aN7O0jwd234tM5KMQ5yHXhtukzihnB9x5yZkwqeJREHlp9y9Sv70NS9WYIqmXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8563

On 24.11.2022 16:12, Roger Pau Monné wrote:
> On Thu, Nov 24, 2022 at 12:16:13PM +0100, Jan Beulich wrote:
>> On 24.11.2022 10:33, Roger Pau Monné wrote:
>>> On Thu, Nov 24, 2022 at 10:11:05AM +0100, Jan Beulich wrote:
>>>> On 24.11.2022 10:06, Roger Pau Monné wrote:
>>>>> On Thu, Nov 24, 2022 at 09:42:40AM +0100, Roger Pau Monné wrote:
>>>>>> On Thu, Nov 24, 2022 at 08:59:00AM +0100, Jan Beulich wrote:
>>>>>>> - problematic wrt evtchn_upcall_pending, once set, preventing event
>>>>>>>   injection later on.
>>>>>>> As you may have inferred already, I'm inclined to suggest to drop the
>>>>>>> the is_vcpu_online() check from hvm_set_callback_via().
>>>>>>>
>>>>>>> One related question here is whether vlapic_do_init() shouldn't have
>>>>>>> the non-architectural side effect of clearing evtchn_upcall_pending.
>>>>>>> While this again violates the principle of the hypervisor only ever
>>>>>>> setting that bit, it would deal with the risk of no further event
>>>>>>> injection once the flag is set, considering that vlapic_do_init()
>>>>>>> clears IRR (and ISR).
>>>>>>
>>>>>> That would seem sensible to me, and was kind of what I was suggesting
>>>>>> in:
>>>>>>
>>>>>> https://lore.kernel.org/xen-devel/Y3eO0bMKRPYJc2yQ@Air-de-Roger/
>>>>>
>>>>> Another option would be for vcpu_mark_events_pending() to
>>>>> unconditionally call hvm_assert_evtchn_irq() regardless of the state
>>>>> of evtchn_upcall_pending.
>>>>
>>>> I think you said so before, and ...
>>>>
>>>>>  This will create some spurious events.
>>>>
>>>> ... I continue to be afraid of s/some/many/.
>>>
>>> Not _that_ many I think, as we can only queue one pending interrupt in
>>> IRR.
>>
>> We need to be careful here - the kernel treating it as "edge" (like
>> any other interrupt coming directly from the LAPIC), it ack-s it
>> before calling the handler, i.e. before evtchn_upcall_pending would
>> have a chance to be cleared. See Linux'es sysvec_xen_hvm_callback().
> 
> Hm, that's not how I handle it on FreeBSD, where the vector is acked
> after calling the handler (evtchn_upcall_pending gets cleared before
> the EOI).  Maybe there's some corner case I'm missing that requires
> the EOI to be performed before clearing evtchn_upcall_pending?

I think for the purpose of the one vector doing the EOI late is okay,
but aiui the goal of doing it early for edge triggered interrupts in
general (and yet more generally as early as possible) is to unmask
lower priority vectors as well. Of course that's useful only if IRQs
as a whole are unmasked during (part of) the handling.

Jan

