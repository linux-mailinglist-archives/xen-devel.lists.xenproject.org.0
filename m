Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC3E40472C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 10:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182783.330546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFef-0005JP-Qu; Thu, 09 Sep 2021 08:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182783.330546; Thu, 09 Sep 2021 08:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFef-0005Ge-Mz; Thu, 09 Sep 2021 08:43:33 +0000
Received: by outflank-mailman (input) for mailman id 182783;
 Thu, 09 Sep 2021 08:43:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOFee-0005GY-EQ
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 08:43:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 023f6a6a-114a-11ec-b1a7-12813bfff9fa;
 Thu, 09 Sep 2021 08:43:31 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-dyiNiURvNA6DQogx8WGF4g-1; Thu, 09 Sep 2021 10:43:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 08:43:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 08:43:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0036.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16 via Frontend Transport; Thu, 9 Sep 2021 08:43:25 +0000
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
X-Inumbo-ID: 023f6a6a-114a-11ec-b1a7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631177010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqtc6eD4w9cLj344mz9Jg3QTuzoqp5l+GWqOi2EnBUA=;
	b=DCUlz4a1/HBRQ5s0j2Uh16eFxYIoKTks+Ru9JAe2ricv/uwl6+25cDaHBO89Nw74IVaAJZ
	trrPxJjH+Dzc7Did5F7ZqWnPaogZN3DCHGFstK0P+mNae5MM+fURJqhW0z0wn3kbKDFb4A
	yYA+F2vUopOv2W2yDg0iCe4R88dPHB4=
X-MC-Unique: dyiNiURvNA6DQogx8WGF4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWNFVcBJe3nea4vmQWnolX79t7Zkh68+es/QHFtPZkkmbHuGeCbUDFlRZLyZ9ui4UlWAJLfUeX2DIu6YqJ8LDUuqITMLGDLniy4vP8tkwXvKeKcyJI3V2pdqT2YPX6vwSdWTx7NTbnx6xPm6HvNo2AGKzMVw07/JS7PJXm6cAVinSZWLiBrF2ZMTIvM2KQCjsiqtwSJrcV3p48u8bee/QAMRAldZDaqodlbKIApCkQy1IQTSsSvJqsLhWgOxvPMfSjraiBTws/ejb4cYGGfXNiD96qXRdOefodr8g0oqfM2JjAdIScYZPCYCVPHE6Mls4xJPlUsDPSt7kP2z97MI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wqtc6eD4w9cLj344mz9Jg3QTuzoqp5l+GWqOi2EnBUA=;
 b=JbZSFRj5I6jMOfen6RRu+EXPUP+cE1VRtApcYrE5s0LeV7cRDfbJIqUrmUn1Bixl3WIXgDBhnFZuNAL3pNVa4ObGz1TD9zaXS6OxHDOoYqjxeZxAn4N6uaMXmQlXHNVTry/ovLM/UuoQAivAbv2njY6+XRmV/uY3U4vohE93ZH4s58dElaFGpxysbroxD4E+JyTSsW+RW5/KWEvBvzGve4sZ6by9HX2laX4CCHfHQFVF7ysE6ZEQfoyOwjrF4Myb0iqHdclB/awYx2XBTdoRKQS2evhZIcH/3klc/XACKmjuG83Jn0Y8gGisZSxiIl21vUg5zWo5Ry/sd5QJUmxseg==
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
 <d78f2211-ff79-6bbc-f8ca-95cf07e3d7ae@suse.com>
 <73697ef0-85de-a530-7601-d8b1490ec5b5@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f4758911-0927-f31a-a617-9d8566edd2b1@suse.com>
Date: Thu, 9 Sep 2021 10:43:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <73697ef0-85de-a530-7601-d8b1490ec5b5@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0036.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d26ea7b-859a-4047-1c11-08d9736de41b
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039C19FCFEA4B9C3DE23C8FB3D59@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ayl/HTiWgyk+tu3FG2XKiLRLTRAeXjby5pXB4Vgn8I3pzDUNq3OR0CsNQl5zMSXvvsLra5FWZ2Nj2K+iQqxSNZMxadbCgJ+n/gXpDRQfC2KpsWxzoMMpd0Kvw/eR1g540w+U5E0ToEOKw9Lgi48h0uDtiwgvrFyHLmJZ30HuTFIiddBKZARCbIjKZAhzHLGIcvsn9E7fCCqKUfS1f03Yz+0EA8IMCORFkw439sVrG1aE9+tcMwC48eAQXtAhyUU2ouEsbpHpy2IjxpvFZ3tnLZ65jOV86DF5ZADdPsE4voirbp/ovsKvI+p9e5FCeVhVqkMFG0m+6aZzzVoJFJYCw/BLz2ZxLrjGDwQI8e2aBAr9Wsgd5oUSnMGDeAPNTyFHLzdu1lnUYS1yEr0fLb3h3yJ1FU1Su0GwNK5HBBRMHTeSg7UyA0nqJTqfPVfrmgbLoSXRLwL2kQ13gdegzyn5OsEE2lWe5Hb1iU6Jnu1Y6NS6Lhr1sAiCpwvjPWWXMzMDWIDVBxXRu5JcrKTJoCEa32EKZCzGMuO4u6GDsknXJ3MEiNQnyXSh8OgCmwiZtZklgOxVDrw4mZdrl6P13y3E1Ydplpy/VTC+lVHUqxkKv09KkQhlaDMJSduq9Y9K71ZQHglnTOwhn/TCJ4poRwTgHi94quSI/HpvcUhuljcDHe1EdeF6l9UHETxolhjztasaH95whsq+x9OfcJdAH4cxKsTgtwMLfrHVCSnJ41T3Q0EgLtHnliaW+XMwJbVr2SyF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(39860400002)(376002)(346002)(136003)(66946007)(6486002)(66556008)(38100700002)(66476007)(26005)(7416002)(478600001)(8936002)(2906002)(53546011)(31686004)(316002)(5660300002)(16576012)(54906003)(36756003)(110136005)(86362001)(4326008)(8676002)(186003)(83380400001)(2616005)(31696002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFVvRmJuR2hvUE1JQ2dqVUhTZU9tL1RSU2p1eWQ5TXJxbUtsSzR5dnRXZHdm?=
 =?utf-8?B?SUZhNFpEazdXY2YzTHdPYUZ6YVlpSmQweG44dnBDb0dudmdWclgvRlB6eTdX?=
 =?utf-8?B?MDBCWkxwZWd0a05Ua3BILytFVHMwaGlvWHlrc2I1TTFObUpJM05EczRoSDJ4?=
 =?utf-8?B?aDl1MmpCTXU4MGNWYVdNVnVKeDNjQ2U0MW1qSDY2QytWNVh5aFg3RTZYODBi?=
 =?utf-8?B?L2J1dGxHb0F3cmJKRGhVNm9LYnd2UXdRTXcxVWlXRFJuUDhPYVcyc1U4Z2l6?=
 =?utf-8?B?WDBtdGdYdEVleTR4enNITHBxeFhXNFVheG1MWFNuWllZNzVTRVcvdzI3SHNZ?=
 =?utf-8?B?YnFQMDFtMjJYalVwcEpnWEdGRmZJNW11Z09HRWcwNytmQ294ZUtseGVldlo0?=
 =?utf-8?B?SFVidWd1KzdxQUhIc3p4OUgvcXQ1V0lKVUZXNDA4Qk94TENpZUZqSlNMMGNu?=
 =?utf-8?B?cGJmOGJPN0ZsNlRFb0NYeHQ1MWVaK2MycldzY2lxV0UxcjVteXVBQnQ5M2c3?=
 =?utf-8?B?MDcxanhzSWY4M2Nnayt4SElBd0M3S01vWmRKS2dPaElaQVBDOHpMY3NldHhk?=
 =?utf-8?B?eTA1eG1xaXJyRGF6a3U2c1VLNUhJKzdPR004Y1d5OEJiVkhpVEZVdE1sY0d4?=
 =?utf-8?B?eWFjMktvTnowcldGQW9ibDhqRFJ3Q1BwaGdySnl5UTA4UHFzaHRiK3JUTm5n?=
 =?utf-8?B?THFmUkFkdVZ0ajJmU1BRUEQ1YzZaUHVSL0h4b1N0czFtbUt6S0tVMzRQNGw0?=
 =?utf-8?B?VEVCa24ydnRHaDhSN1NNZXVHVUNGV2JtNEhkK3RqU280SzRYZ3Q5M01wbmxq?=
 =?utf-8?B?dmNWYkJ1YmFZb2dUaDdhZi9STDR4TjUxRVpmOVlkRUpvdjdtYU1wVlRWS2JI?=
 =?utf-8?B?amx2VVVHbGdFSDhWbGttMUJUOVV3ZGJJUGdTeW1UTmxVcW16T2pNU05YbURD?=
 =?utf-8?B?Tlg2d2pNV21QbWlkK0NTeFhCWmpIdFV5Z3dYcTV4dHhlK1I0dzBKb0J1Z015?=
 =?utf-8?B?OUE0bC9xUUMwU3k3RWFkVERWRVVKQjRhZ0kzMFRhSWZmMmhRelMwQnBtU2U3?=
 =?utf-8?B?NFB4NjFYV3RiWWNWdk1SOHhGbmFPcVRueHVjM2RZRlViV2JtT0FoUGhSRE8z?=
 =?utf-8?B?cTNmZWkzSXF6R002VkhvYVJvek1tVFY1WGplcWpuSjdQRXFYNjU1aHdUSTVu?=
 =?utf-8?B?WE9IUDlSbGRlejJWazhqNUt2a29NYStiZlNHZjhVQVhheWJiVmIyZ3RqZHZl?=
 =?utf-8?B?MElpNUtERDNjdytRMmNPVHNmNTB6aStkbXpkZ2EzUXdaZVhPZGRqUytxUTd6?=
 =?utf-8?B?MnBkYmRSbXh3MmNTR3N5M09iRVRvRStZR3pXZEFtVnlVNmFNZDkzUFprS0tk?=
 =?utf-8?B?MC9telNEQzhRcmh4c2FQdU5oQytrVTk5eGVTeVZvUWJKclJrSnRFSXNOd0RE?=
 =?utf-8?B?NjQ1bzJiTk5uK0VTODZNbzBLZzFGaU5jcjJuTjg2Y0UxSWRJQk5ZTlVsT3BG?=
 =?utf-8?B?aWZGdFpRYVN2Y0RWQWhQSWx1emFsSWQwWVViK21pM1J1alFwTGhJV2RhSjQ4?=
 =?utf-8?B?WnYya2t5VTgwcVhXdDlGNDZpV2Q4RlBFb2xiTE9lN1FROEV6c1V0ZHg1TUdZ?=
 =?utf-8?B?T09heXFwVUhpZHpObWV6M2YzTDA4eHhNc0tpUEVVZ1o2TXl4QkVoQTF3QWZn?=
 =?utf-8?B?cDlvNkxNWUtLU1NEdjBRZUQrNFhNanJBd0tVUXN3eWVlL2pLUjRndkJ5cmxP?=
 =?utf-8?Q?2Vcz8fYzYCpcUxuVJrHJmwXIXkM6CgycfkrHZkv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d26ea7b-859a-4047-1c11-08d9736de41b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 08:43:26.6396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WG6cwc/aN/v08dsMnG/OcyrhQApcwSUBGJQLaxUn+sBdnE2iAnrq1XBJ9Wpdv2y516IclVEFWgNTWH6xD2YJ3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 09.09.2021 10:39, Oleksandr Andrushchenko wrote:
> 
> On 07.09.21 13:06, Jan Beulich wrote:
>> On 07.09.2021 11:52, Oleksandr Andrushchenko wrote:
>>> On 07.09.21 12:19, Jan Beulich wrote:
>>>> On 07.09.2021 11:07, Oleksandr Andrushchenko wrote:
>>>>> On 07.09.21 11:49, Jan Beulich wrote:
>>>>>> On 07.09.2021 10:18, Oleksandr Andrushchenko wrote:
>>>>>>> So, if we have a hidden PCI device which can be assigned to a guest and it is literally untouched
>>>>>>> (not enabled in Dom0) then I think there will be no such reference as "host assigned values" as
>>>>>>> most probably the command register will remain in its after reset state.
>>>>>> What meaning of "hidden" do you imply here? Devices passed to
>>>>>> pci_{hide,ro}_device() may not be assigned to guests ...
>>>>> You are completely right here.
>>>>>> For any other meaning of "hidden", even if the device is completely
>>>>>> ignored by Dom0,
>>>>> Dom0less is such a case when a device is assigned to the guest
>>>>> without Dom0 at all?
>>>> In this case it is entirely unclear to me what entity it is to have
>>>> a global view on the PCI subsystem.
>>>>
>>>>>>     certain of the properties still cannot be allowed
>>>>>> to be DomU-controlled.
>>>>> The list is not that big, could you please name a few you think cannot
>>>>> be controlled by a guest? I can think of PCI_COMMAND_SPECIAL(?),
>>>>> PCI_COMMAND_INVALIDATE(?), PCI_COMMAND_PARITY, PCI_COMMAND_WAIT,
>>>>> PCI_COMMAND_SERR, PCI_COMMAND_INTX_DISABLE which we may want to
>>>>> be aligned with the "host reference" values, e.g. we only allow those bits
>>>>> to be set as they are in Dom0.
>>>> Well, you've compile a list already, and I did say so before as well:
>>>> Everything except I/O and memory decoding as well as bus mastering
>>>> needs at least closely looking at. INTX_DISABLE, for example, is
>>>> something I don't think a guest should be able to directly control.
>>>> It may still be the case that the host permits it control, but then
>>>> only indirectly, allowing the host to appropriately adjust its
>>>> internals.
>>>>
>>>> Note that even for I/O and memory decoding as well as bus mastering
>>>> it may be necessary to limit guest control: In case the host wants
>>>> to disable any of these (perhaps transiently) despite the guest
>>>> wanting them enabled.
>>> Ok, so it is now clear that we need a yet another patch to add a proper
>>> command register emulation. What is your preference: drop the current
>>> patch, implement command register emulation and add a "reset patch"
>>> after that or we can have the patch as is now, but I'll only reset IO/mem and bus
>>> master bits, e.g. read the real value, mask the wanted bits and write back?
>> Either order is fine with me as long as the result will be claimed to
>> be complete until proper emulation is in place.
> I tried to see what others do in order to emulate PCI_COMMAND register
> and it seems that at most they care about the only INTX bit (besides
> IO/memory enable and bus muster which are write through). Please see
> [1] and [2]. Probably I miss something, but it could be because in order
> to properly emulate the COMMAND register we need to know about the
> whole PCI topology, e.g. if any setting in device's command register
> is aligned with the upstream port etc. This makes me think that because
> of this complexity others just ignore that. Neither I think this can be
> easily done in our case. So I would suggest we just add the following
> simple logic to only emulate PCI_COMMAND_INTX_DISABLE: allow guest to
> disable the interrupts, but don't allow to enable if host has disabled
> them. This is also could be tricky a bit for the devices which are not
> enabled and thus not configured in Dom0, e.g. we do not know for sure
> if the value in the PCI_COMMAND register (in particular
> PCI_COMMAND_INTX_DISABLE bit) can be used as the reference host value or
> not. It can be that the value there is just the one after reset or so.
> The rest of the command register bits will go directly to the command
> register untouched.
> So, at the end of the day the question is if PCI_COMMAND_INTX_DISABLE
> is enough and how to get its reference host value.

Well, in order for the whole thing to be security supported it needs to
be explained for every bit why it is safe to allow the guest to drive it.
Until you mean vPCI to reach that state, leaving TODO notes in the code
for anything not investigated may indeed be good enough.

Jan


