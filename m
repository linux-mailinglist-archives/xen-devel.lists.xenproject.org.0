Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC33D4026BE
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 12:06:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180734.327514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXzU-0001fD-Ix; Tue, 07 Sep 2021 10:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180734.327514; Tue, 07 Sep 2021 10:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXzU-0001cE-Fk; Tue, 07 Sep 2021 10:06:08 +0000
Received: by outflank-mailman (input) for mailman id 180734;
 Tue, 07 Sep 2021 10:06:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNXzT-0001c5-GY
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 10:06:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca338be1-7622-4c61-9c6a-b161f093615f;
 Tue, 07 Sep 2021 10:06:06 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-HT3K6R6bOXiOq4H7_uRxjw-1; Tue, 07 Sep 2021 12:06:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 10:06:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 10:06:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.6 via Frontend Transport; Tue, 7 Sep 2021 10:06:02 +0000
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
X-Inumbo-ID: ca338be1-7622-4c61-9c6a-b161f093615f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631009165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oRW46sjfDAt94IjC1ydronO3b2EUU8JpbrPq1APVDwg=;
	b=ClVIIcFNWKH11waog8tT+45stenI5dgIN7mSHxifl92Okq/7+RYNgQI1vtP4zP79huDQzM
	1lPNcNBor3MK0VbYVpaq8H695jEUzKMuoZOWV7vTO12TVTsy5KTt5l8HnZdV5kvqO1C/mT
	iKhftAjDURz1vkYy6EeCzKFYUrjZMpY=
X-MC-Unique: HT3K6R6bOXiOq4H7_uRxjw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=br/rr9eNNwv2wbxAiQGxT85pEuXCZ3v8ssI/cP3YDJbK9F2aEoPQ8HYTqWLdlSqfnzT57NlKWIm78mk+uGB6Yjw0HoypEwKt5jWl++Jj9Be7QanAHg5N92m5EzdzEyRfMvL7HOFQT0OdmaTR7sJq9a2z1ft4Txp6ljig/MCb+E6ThXRlcfh+9k7gKiybolcGRQzuZPVsB5J3sn74fz0uitodXqyxxLY+JM2dLf+bQU0daD47+pHV0mRpJAo9kJEI8wM2xUWKzyGVZeYihTJWEWemltqnO/W3XG9es0RxWIsWi3nTtFw7LkXz1aTFOk1YD5Q101nJjqcr8LlEXUQPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oRW46sjfDAt94IjC1ydronO3b2EUU8JpbrPq1APVDwg=;
 b=QGw6EeBoZ4+pqvxfQMADsclCJvG13l2hvGE9XCyZsP1A+HGsJ78BFeA9nQjz1Lad0TdQLC+p3JCOcXBjKYgOcnbmC8BET3Tv/LGkgAH5zm39alUg1C4TdhzM7Oo9Mgx8ZMJ0CpkJMDvHHNnONZghdW0seruak8bPTB5jMlzoaI+1dBFh18k9qplq+lT/HqiGAGzjQ9N+tKc8a21ZMv1bGADLDszuNFG4dbJFbnLBi9MbqnkwhhFoYFTIae7n6L+oNeRAGcWtq/ls2GaxrH4Z23ef+ZlAyqMA60PdcrSRLVRDy2Ck0vSXpQiEm1oQol9IAMNd7/Dh5jDSlng1h8/9/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-9-andr2000@gmail.com>
 <ffddb533-399d-3b34-69f2-33ba1e977231@suse.com>
 <5366265c-d169-041d-f812-1c49260f6499@epam.com>
 <8f1816db-798b-15d9-7343-2199eb8f39e0@suse.com>
 <0e3942a5-9105-c99e-f15e-dcf35aae142a@epam.com>
 <c6702cee-9c37-8f0f-77d7-20da718e3e94@suse.com>
 <5d0d345d-db16-f0c5-9a78-4ad5f4733886@epam.com>
 <5ffbd0a6-b34f-4de4-b316-2376211039f1@suse.com>
 <6db7c55c-93c6-7901-6097-687287463c78@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d78f2211-ff79-6bbc-f8ca-95cf07e3d7ae@suse.com>
Date: Tue, 7 Sep 2021 12:06:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <6db7c55c-93c6-7901-6097-687287463c78@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e0e0d22-6bd0-4490-fdd3-08d971e719ae
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4191DA9BB2E619D1C3490294B3D39@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bJtqs6GaIsi7awptKQzx8l+javLX0++t37nkHEChriL0CaScmgI7uYhMk222VJSh5DEsisZaX8mYisp0JI7Npq1LrrUBkLMSl0hnayaz1pOh+2QCBr7dZPvOIQ0P2JhYW20Lmk378rJCl5ecQG87uBX8KSzHTCa7W4O/R1dTXZw6oJTe7Ds8bhRKx3RAVQLBbW8JoqoLdtbm6/ejPzzGumXtGTiHsMKB+zIe6DeQDJLakEaZyBBctR/bUdSvhDd5JbUjPCDEpSBFg2xuBfyFUOwlvC2C7YrrLO17spg3Wh8pAeWNZ8xzIjtKUvGL/kaCjZOxOoho4jlCJYTBGAHjwArW8rxidm9M/RaZvOzVjdflZn5tbBS5TNeIcJWvinXEOPE72PAnMwR7JYUuoAtFX52PrNGEtdFbm+LOHwk2jhpWXNUKvicMwdMYyLvoGsraXsnvSYBdKnobOYr9wzidCeg+1Gn4XQH7m1I9GuEH9Tkz7CFAQmRy2WWqeRVhDl0avkYN9iblspbDQedjEeXExsaZX8F0eUSC2PV4/ao0LYooZmNOvYvvHfw1gQHIyHEseZ/4Sy7o8jSguKoX4dUaH4ngvJ7ILLtzU43EiSArFEfe9cmU9gpqSHv2c/wPBzKMOw1owe+GddsG3Hmn15uxJJFTNRqDgwL54mDhjin6iK/uT6y/thKxTGmeo2xWWusBmbbTDytCqyF1m+NvgAi8t+xPZxjf06Di7hXyyjJjUhNuDkw8sOWx5JceoA5m2ZZ1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(86362001)(66946007)(26005)(31696002)(54906003)(186003)(5660300002)(8676002)(31686004)(2906002)(66556008)(66476007)(8936002)(7416002)(4326008)(83380400001)(53546011)(16576012)(2616005)(508600001)(6486002)(110136005)(956004)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWZ2dEVOa3pUcmIrM3NkaUhZcDhHMzYwbHAzbEJyUkVUak5Fb1pHQWFBOFRZ?=
 =?utf-8?B?WnMyenJTVW13aVdXWVZqeUJ4VDJ6cEo0UytxQUFzSEtXeis0SnMxbHI5UkhI?=
 =?utf-8?B?dHJ4eVZuQXBCRTdSZHR0QSsvNEN4eStxQms1czV2R05Qd0d5eXNvandRQjly?=
 =?utf-8?B?Y2ZMcnFEcW5QWE02ZzE2N1p0TUVlV1hqUCsrdmUyY0RDZVJPdzU1b1RNcXJn?=
 =?utf-8?B?cS8wQlJWYW5VaCtESm0xQjJEQThXcmNkTGlYYzM4TnBCbllDamJhZlFYR3dz?=
 =?utf-8?B?eEhJWnhZSGtrMVBBYXpLUUVmQ0pOei9WS2hpU0xHdTRPQ2ljSlo3SU1KZkNK?=
 =?utf-8?B?NkpldFZPbkxIVndnMUg3S21zWEJIRFRxVTgxLzJOdTJVUCs4QXY4MWo1WVNR?=
 =?utf-8?B?czZKai9nOUhZR3pGeGtEMW5pRWVaZ1R3NjlPZXFyNTZWZUxQNVJWYURwZFBh?=
 =?utf-8?B?QWdkWTEyTDVYQkIvR1B0RVZXMmQrRDVMVHhGS2FnMmVCSkxOUDlsOC85VVlK?=
 =?utf-8?B?cW5vMTJBY0VCQ3dmMHdSdkFrLzA5Mm0rTG5sdS90dC8wMVlSMTVoZ2tHQ2N0?=
 =?utf-8?B?aXk4cks4U2x5Y1N0R1k2MnZHQ3pVOEw0WTRpV0VVT3Z1S0s5c1k5YUNqMERI?=
 =?utf-8?B?c0k1QVZIeDRENGhpb3dFK1dZaWVtdyt2NVp5VDBkanJqYm83SWNmbVk1M0tu?=
 =?utf-8?B?NDFDNmtmemhEYU1ZeEwzNjRZaE4yWGhBR0p5ZnlESWtwUmJ3b1RiTWFkMlcx?=
 =?utf-8?B?b1NkT3VyR0srUFpYdGdBNmJmUXplbml6VTVGdk91NGV2aVJ4amJSZlBkVVQ1?=
 =?utf-8?B?N0tOUVJWekxud2dTVm9qNzljMnl4NnphSWt3YUtrL3ZPYlRybEVZM3piejBu?=
 =?utf-8?B?cjE5a3QreXZNZzJYZWlONWEwZlB3ZlppdWJzV1lzdy9zaUlIMjAxUXRuWmcx?=
 =?utf-8?B?RG5WWEpNcEhxZ3RnbzUzY1hXRmo3ZlcrUFNkVy8vQk5QeW1rQ2h3cUgrYnBa?=
 =?utf-8?B?aWlkQWtEeG5VQlVFbVllOTVpTnhsKzZaWThEMUxSV0lWeGhnT1o2a211dlVM?=
 =?utf-8?B?NEtpSTVxYmlxN3oyWjZuMWRCZ3VvQUM2Vk0rVVFpWEFoWkxpSmtnSUl5Qms5?=
 =?utf-8?B?MDc4eDFzWkVranVWVFZZMlA0cjE0UmM2bi9zM2dCYzJLSGFDemZCSXBRdDhm?=
 =?utf-8?B?R2IrV3FBWkRXWVpOSmFLNmdJbWNrdXEzMnV3a0FZVDhjVkFuWEhzYXY1cXZP?=
 =?utf-8?B?WkhXUE9TYUVsUlVJeUpXa2FmTHNQeFFOcitrLzhSNXlBWVBvcEh0QmxOdmxM?=
 =?utf-8?B?alZNeFVhTEhMUFhuSkx2bGtqcWJLMnBxWCtQY05kamN3UmprdHRYV21KVEpT?=
 =?utf-8?B?S3VibGVEOVdGem41RVY2cUZGNUhuRXZPcUtoYm5Hb2tDOG9Rek5RcjEzcE01?=
 =?utf-8?B?Z2lHZm84VTNvdlM5TDFzZ3M4eVVZT29WdUNQcHA5MWJ5TVpjUERMeTVRNlRR?=
 =?utf-8?B?QnhKYlFBSzE1TG9GOHhPQnoreEhSWERLK0lNZVRLOHZ6VnI1Z0I4amxTREFw?=
 =?utf-8?B?UE85ZzJvTVZZSmxqRTE5K0xlOEU1ZjVaTTIzV2w1Y0p1U3g1MFlaa3dTMHRO?=
 =?utf-8?B?a0w3OEZwMmJyUnlwcEx4NnhFUHNYTzBkSDJERW5vMjBMTXpsOUZRMUUwMkxj?=
 =?utf-8?B?dGN5Z1FKNFVNaEZJNER4QkdqOW9QbUs1ZnROQVBNaXpDRFhncHZsTElmR2Mw?=
 =?utf-8?Q?vg+ptef31Ywl+m6kWFVSFhdgxnaeXy1CGy1fzqI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0e0d22-6bd0-4490-fdd3-08d971e719ae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 10:06:03.3007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DslmiGuRLtSAxNjuMzS28bs5IhNvYVFg3nNJRxmECWWXq3PnzogdxmKSe5+rv+kx7Yw9gl9AW8V8f+c6b2jz1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 07.09.2021 11:52, Oleksandr Andrushchenko wrote:
> 
> On 07.09.21 12:19, Jan Beulich wrote:
>> On 07.09.2021 11:07, Oleksandr Andrushchenko wrote:
>>> On 07.09.21 11:49, Jan Beulich wrote:
>>>> On 07.09.2021 10:18, Oleksandr Andrushchenko wrote:
>>>>> So, if we have a hidden PCI device which can be assigned to a guest and it is literally untouched
>>>>> (not enabled in Dom0) then I think there will be no such reference as "host assigned values" as
>>>>> most probably the command register will remain in its after reset state.
>>>> What meaning of "hidden" do you imply here? Devices passed to
>>>> pci_{hide,ro}_device() may not be assigned to guests ...
>>> You are completely right here.
>>>> For any other meaning of "hidden", even if the device is completely
>>>> ignored by Dom0,
>>> Dom0less is such a case when a device is assigned to the guest
>>> without Dom0 at all?
>> In this case it is entirely unclear to me what entity it is to have
>> a global view on the PCI subsystem.
>>
>>>>    certain of the properties still cannot be allowed
>>>> to be DomU-controlled.
>>> The list is not that big, could you please name a few you think cannot
>>> be controlled by a guest? I can think of PCI_COMMAND_SPECIAL(?),
>>> PCI_COMMAND_INVALIDATE(?), PCI_COMMAND_PARITY, PCI_COMMAND_WAIT,
>>> PCI_COMMAND_SERR, PCI_COMMAND_INTX_DISABLE which we may want to
>>> be aligned with the "host reference" values, e.g. we only allow those bits
>>> to be set as they are in Dom0.
>> Well, you've compile a list already, and I did say so before as well:
>> Everything except I/O and memory decoding as well as bus mastering
>> needs at least closely looking at. INTX_DISABLE, for example, is
>> something I don't think a guest should be able to directly control.
>> It may still be the case that the host permits it control, but then
>> only indirectly, allowing the host to appropriately adjust its
>> internals.
>>
>> Note that even for I/O and memory decoding as well as bus mastering
>> it may be necessary to limit guest control: In case the host wants
>> to disable any of these (perhaps transiently) despite the guest
>> wanting them enabled.
> 
> Ok, so it is now clear that we need a yet another patch to add a proper
> command register emulation. What is your preference: drop the current
> patch, implement command register emulation and add a "reset patch"
> after that or we can have the patch as is now, but I'll only reset IO/mem and bus
> master bits, e.g. read the real value, mask the wanted bits and write back?

Either order is fine with me as long as the result will be claimed to
be complete until proper emulation is in place.

Jan


