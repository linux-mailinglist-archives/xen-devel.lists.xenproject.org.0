Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD564047AC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 11:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182855.330668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGFT-0007eQ-Gs; Thu, 09 Sep 2021 09:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182855.330668; Thu, 09 Sep 2021 09:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGFT-0007az-DH; Thu, 09 Sep 2021 09:21:35 +0000
Received: by outflank-mailman (input) for mailman id 182855;
 Thu, 09 Sep 2021 09:21:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOGFS-0007at-0p
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 09:21:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 521d2da6-114f-11ec-b1a8-12813bfff9fa;
 Thu, 09 Sep 2021 09:21:32 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-Y-NZ8-HwOUGsaMPaZ45nWg-1; Thu, 09 Sep 2021 11:21:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Thu, 9 Sep
 2021 09:21:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 09:21:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0033.eurprd03.prod.outlook.com (2603:10a6:208:14::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 09:21:27 +0000
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
X-Inumbo-ID: 521d2da6-114f-11ec-b1a8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631179291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qCf+5Yd/fZvb/dblph5Mi3U37xAhwaBmRYC/0Jhk3P4=;
	b=NSWlC/Cwso2yk2dvORFHUlfeFIvVZjl6w4PB9EpRQg3Y0vfM5+Y1ruyFhLCXbHifzzg7UD
	DP0duIm4CVKqx4kQZykbVOsXtpU7XAMDfPJtUBug2UbwSEKvlpAkybkkJMCSuY5+Pgvggk
	+SpRvxS+5GR1oJyyEkUuFCQ452XJpDg=
X-MC-Unique: Y-NZ8-HwOUGsaMPaZ45nWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3++X5Ywxv7Nm67jYvHXB0VSViN1gt4IMaPrXnl3tnrVUFfmpnk25hlh9fjCSeoj5jDbBxYsy3bRb0jOWFfG/ik1Uee2qkNI/Jl9emb4J0/RhyOb9z+l3Ha85WkvH3t4H9tSd1Y98ziFxH1H2VlQDC2bkBfSGCffnjH+ePOOmrhZXqn9V+AICabsBb7rWjRgQrz3Fuyjgz/TWs6DPdnPNB4821s0q2zO7N6kk0YCVyJ596J+lkx2wFzlmhYKLbFUuI0kMAxaO8aQWOzlPHBRhaTXc6xTnhjdL4S7gJXoIRB/w337DopEOzIzgfONjyTUWRQrzoXGg4ESNjPN32pJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qCf+5Yd/fZvb/dblph5Mi3U37xAhwaBmRYC/0Jhk3P4=;
 b=Tmsg3dQ6fGbWIEKWkpHRZpPnGRe7M7LslhLeYbodZODBqa6nGo/ZqkbVvLRGC5tF8y2alI71YLaaGuzaKuUd5AOGrB7JLBU8DKy5/48YIb/ruxH4OViMtujjIvYxlMEz+z2IAb7L1k/MZ+TDtQ4cM3F9qkJt+SbuE7PylUJ6qJiDfLOAihjx7yoJoApB4LT24FCKwWnZ2aT0B+gd8NYTweolrs8B0L1p74lWnur91YuL5KYmdTjPwTmNLtywEQExgnl3tDJdgTFEmiQwKH2QkYeIgMN57BpZzBZb25G2p4WAAPEa+6vQs/IgFX8VZ5yEV3sR4OZigO1p2gabeRZOGA==
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
 <f4758911-0927-f31a-a617-9d8566edd2b1@suse.com>
 <6d8a4bae-cfed-07fb-d6e0-7587eb85069c@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <10bccd76-bbbb-1cb5-b9ad-4298014befd4@suse.com>
Date: Thu, 9 Sep 2021 11:21:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6d8a4bae-cfed-07fb-d6e0-7587eb85069c@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0033.eurprd03.prod.outlook.com
 (2603:10a6:208:14::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b992711-1d68-4be6-98fb-08d973733448
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393336D915BBDA82117490C3B3D59@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dpT5mUI6Z0I9ebyzosrVNxaSjDk/fC1LkVz7ErS4J4/WiVwwVCAKrWPLUw1+zdE1Wq/RzLaamgoa1M/VP7Tk870RjdbLAac5dojvu8m+6Ew9xKb5pUDmXQKNqosMTDTpAQawCcilu1BIRBaYfZ4ZKvzV8OCphSFLLR9h5BE8UyOwOgiK4lfi1EyTqRrrfIwh5l9jhz7wZUNUOTE92E0xn7dwr5jACkBljOqlKMmukr/3WKK9KwdgapeN00XOOKLgUUSRFAayD4Szm/ehHG1WI3AKZGxrA4c/8nB+pTrzpETWo4CEyAp1hdqHvRi0zoaw82w9g2j7aRIXSexBha+i8zZps3+GCu84op4s0Jft/OzxGVgxNjsuZWCeJiX2Kyxm7cb4eZ8ZfU6S2mDKBR9sBFcbcV2H026HgYfEmr4pNJWWFQWc7SzNFe452FepdhodkdOfkCcWMGZK7CcCXSjdfRopTieEdWqJgle5KebL1BrjxHZT4/1vy4nZRUSeB/p9qtHApZ63tNEkzgSrSieRDP7R3ibUfenyXZHgAh+3qstNrBtUJHPamRmv8ZDyGLTGBKmS5xIrezHoWm8xQiq2Yvwx4k8wQfDLfI4pfnNInBWnhIIl1X5tNZUZoh+ElFlcM69dEFcgBLLJKW+Vlxk2wB7Zgb88/WVDYfnKQZvpwmfS8Vsca5F/ebc6nWGfAfyjLhSM7IZSw71/s5adNEYs8Rr5YDqnUY1HYzwuLAOB/Lk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(39860400002)(376002)(366004)(346002)(6486002)(956004)(2906002)(2616005)(31696002)(38100700002)(26005)(86362001)(7416002)(83380400001)(36756003)(186003)(4326008)(478600001)(316002)(66476007)(16576012)(8676002)(31686004)(66946007)(53546011)(5660300002)(54906003)(110136005)(8936002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFdGMlJPaFdWZXlCTVEwRUM5aFZDK2loVG83TkVIaUZvckduR09WbGFrZzlP?=
 =?utf-8?B?dkxYV0R4M24wcFlub0pzaXQ3YXVoSms5YXd5dk5HTVpqMXc3L3l2MytUeDlh?=
 =?utf-8?B?Mk5PdzlVSjRxWnFiN2xjenFvcStJcmE4Y1BXdktuMVE4NGlKa0huYU9VeEN0?=
 =?utf-8?B?N2F6enVZYml2N3JQS1BBeTlFSHJ3SnRvYll0VlpQbmFhbDc3aFovYkFmWStv?=
 =?utf-8?B?KzdDQ1BweGRXemhDOGVwS0t0OThhL0FzNUpVc3hiMnJpcmdyUWZkaFJsWmVw?=
 =?utf-8?B?dHRVUlRnMWhtNWd4eUwxWm92aGp6YlZxMnAzeHVuR3NaU2hIdzFrdUhJL1JB?=
 =?utf-8?B?bVo4YzIyaFpOSFp2Mm45TjhmMEsvWnVrYUNBNWlkVFV1eEpwZHp5T1JCTlJ3?=
 =?utf-8?B?bVUxQ04xT21CbXVHTXBaZFljVDBMY0RSbjBtVnpMK1ZqWTFFSDBGM29Mbko4?=
 =?utf-8?B?OGtoaTNDQ21VdUFOQ0YxQzMwQmMyQ0dHNjQvV0xpVHRneWZTZ2piaDlwWTR4?=
 =?utf-8?B?RmlDSWlzVTVKb3BVV2Zna21kYkViZlEzdXlBd2RUbjFGN2diVzhKU3h0eHJw?=
 =?utf-8?B?N3hRa1lYZ3Exb3E4eHk0eEsrWTJReVRPR00yeG5EYUV3NGU3NXg5WHVOSndZ?=
 =?utf-8?B?KzJ6VVJtTksxUE5EQjJmSHZqQ3FGUkVPT2IyeXdFYmhvbHRzR0RtaWZZNUYy?=
 =?utf-8?B?WUR2M1ZyWTlpNERLQjRldlFBeXZKM1A0ejRwejdHTjVreEFjVitKeExjMFhF?=
 =?utf-8?B?eUpNUThsODAvb0VMUHdldnRyNW81Ynhhb1ZRS0JsblpKK3kxUTNCZEpNNUEz?=
 =?utf-8?B?K2VaVWVZMXVzRkFaQ3pxT3lkQ2U1TU94eW9lbWFjQnpXV0RvcFRQTVpkbzZy?=
 =?utf-8?B?VVVHQ3BqT2pQVGxQSHZPSWR2RXVZWXJhYzFUdkZ3UXFwTTlCbGFIajdNMzRC?=
 =?utf-8?B?L1pGVi81b2pXVklWMFRLREs4YUVGeEZpYjkyM2dWNHFsYW5jTjViOFNFbVZa?=
 =?utf-8?B?U1lNK1R3TlpWMTh2aFU1NWNmUFJjZitpT2NyT2thakw1bjc0TTFiWkhjRXA1?=
 =?utf-8?B?QkdCVkhjc3VONjV3SHAxWUkvSndvS0JiRlhQRWs1Z1AwdW9Qa3ZmNzVYc2pw?=
 =?utf-8?B?S1FlWDVNNlJtcElVaUdJeVZKd3dJSGlDd2dJbGdpQkpKSjU5TzFvUmdqY1k5?=
 =?utf-8?B?SUltdmpIcDE3Z0FtTDB0K1ZscE56OFJzSmFtWjhXVk1oUWQ0UWhPeVpkeWJJ?=
 =?utf-8?B?eVJOay8vUHNWS3ZxL3BYZi83NGsvdUZKQnYvZ3BNT2JpRk5DWmt4REpCOTQy?=
 =?utf-8?B?M2U0ZDZMRmMzYkk4Q29pUm4waFJCU0VZWmNtTUpRYmUyVmpGVDlleVJicnhM?=
 =?utf-8?B?djAwc1d2TFBRQkVpTi9PZ2gzZkVJMkdubjRCQmtUc29UamRBOFF3SUZGelpY?=
 =?utf-8?B?NVR2LytEMUZhcHNZSzZZTVdoOUp2ZGpoWmhwYkx5TlNvM3FzRE9YNWdYQmdr?=
 =?utf-8?B?K1ByQys1Zk5TcjBBUU1QcHlFRkZ2b2J3L0g1QzFYQ1o0V01xODNwQlBxdFR6?=
 =?utf-8?B?blA4NHJ5VGN4SlQzSzRVN1FQRjRrbk9OaEdSTXJrZk9Jc1hDb2lraDJ6QU5o?=
 =?utf-8?B?M3d2UC9LVVB0aXFKckMvUjBXYlN0Q0pvQVNoT1FKT09hTTBqWEI5YWRoWmgr?=
 =?utf-8?B?dHRFdVlYQVhZbktvOFRlbkFmQm5icDVVZ3F3eTkzbXhub1JUQ3pNYVllQkJo?=
 =?utf-8?Q?20DiCY5TrPjOD7zG5oVAgJqhYAFJvv59Q0VMyZA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b992711-1d68-4be6-98fb-08d973733448
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 09:21:28.6441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/NlnfQu71CUvDUwREDhu4LSXBHWBqqsGLGafyaWWmmsnQvNIfgxOb6E5TrC4H6nblXgwHjVUTdqIk3AipXN4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

On 09.09.2021 10:50, Oleksandr Andrushchenko wrote:
> 
> On 09.09.21 11:43, Jan Beulich wrote:
>> On 09.09.2021 10:39, Oleksandr Andrushchenko wrote:
>>> On 07.09.21 13:06, Jan Beulich wrote:
>>>> On 07.09.2021 11:52, Oleksandr Andrushchenko wrote:
>>>>> On 07.09.21 12:19, Jan Beulich wrote:
>>>>>> On 07.09.2021 11:07, Oleksandr Andrushchenko wrote:
>>>>>>> On 07.09.21 11:49, Jan Beulich wrote:
>>>>>>>> On 07.09.2021 10:18, Oleksandr Andrushchenko wrote:
>>>>>>>>> So, if we have a hidden PCI device which can be assigned to a guest and it is literally untouched
>>>>>>>>> (not enabled in Dom0) then I think there will be no such reference as "host assigned values" as
>>>>>>>>> most probably the command register will remain in its after reset state.
>>>>>>>> What meaning of "hidden" do you imply here? Devices passed to
>>>>>>>> pci_{hide,ro}_device() may not be assigned to guests ...
>>>>>>> You are completely right here.
>>>>>>>> For any other meaning of "hidden", even if the device is completely
>>>>>>>> ignored by Dom0,
>>>>>>> Dom0less is such a case when a device is assigned to the guest
>>>>>>> without Dom0 at all?
>>>>>> In this case it is entirely unclear to me what entity it is to have
>>>>>> a global view on the PCI subsystem.
>>>>>>
>>>>>>>>      certain of the properties still cannot be allowed
>>>>>>>> to be DomU-controlled.
>>>>>>> The list is not that big, could you please name a few you think cannot
>>>>>>> be controlled by a guest? I can think of PCI_COMMAND_SPECIAL(?),
>>>>>>> PCI_COMMAND_INVALIDATE(?), PCI_COMMAND_PARITY, PCI_COMMAND_WAIT,
>>>>>>> PCI_COMMAND_SERR, PCI_COMMAND_INTX_DISABLE which we may want to
>>>>>>> be aligned with the "host reference" values, e.g. we only allow those bits
>>>>>>> to be set as they are in Dom0.
>>>>>> Well, you've compile a list already, and I did say so before as well:
>>>>>> Everything except I/O and memory decoding as well as bus mastering
>>>>>> needs at least closely looking at. INTX_DISABLE, for example, is
>>>>>> something I don't think a guest should be able to directly control.
>>>>>> It may still be the case that the host permits it control, but then
>>>>>> only indirectly, allowing the host to appropriately adjust its
>>>>>> internals.
>>>>>>
>>>>>> Note that even for I/O and memory decoding as well as bus mastering
>>>>>> it may be necessary to limit guest control: In case the host wants
>>>>>> to disable any of these (perhaps transiently) despite the guest
>>>>>> wanting them enabled.
>>>>> Ok, so it is now clear that we need a yet another patch to add a proper
>>>>> command register emulation. What is your preference: drop the current
>>>>> patch, implement command register emulation and add a "reset patch"
>>>>> after that or we can have the patch as is now, but I'll only reset IO/mem and bus
>>>>> master bits, e.g. read the real value, mask the wanted bits and write back?
>>>> Either order is fine with me as long as the result will be claimed to
>>>> be complete until proper emulation is in place.
>>> I tried to see what others do in order to emulate PCI_COMMAND register
>>> and it seems that at most they care about the only INTX bit (besides
>>> IO/memory enable and bus muster which are write through). Please see
>>> [1] and [2]. Probably I miss something, but it could be because in order
>>> to properly emulate the COMMAND register we need to know about the
>>> whole PCI topology, e.g. if any setting in device's command register
>>> is aligned with the upstream port etc. This makes me think that because
>>> of this complexity others just ignore that. Neither I think this can be
>>> easily done in our case. So I would suggest we just add the following
>>> simple logic to only emulate PCI_COMMAND_INTX_DISABLE: allow guest to
>>> disable the interrupts, but don't allow to enable if host has disabled
>>> them. This is also could be tricky a bit for the devices which are not
>>> enabled and thus not configured in Dom0, e.g. we do not know for sure
>>> if the value in the PCI_COMMAND register (in particular
>>> PCI_COMMAND_INTX_DISABLE bit) can be used as the reference host value or
>>> not. It can be that the value there is just the one after reset or so.
>>> The rest of the command register bits will go directly to the command
>>> register untouched.
>>> So, at the end of the day the question is if PCI_COMMAND_INTX_DISABLE
>>> is enough and how to get its reference host value.
>> Well, in order for the whole thing to be security supported it needs to
>> be explained for every bit why it is safe to allow the guest to drive it.
> 
> So, do we want at least PCI_COMMAND_INTX_DISABLE bit aligned
> between the host and guest? If so, what do you you think about
> the reference value for it (please see above).

Please may I ask that you come up with a proposal? I don't think I've
said you need to emulate this or any of the other bits. All I've asked
for is that for every bit you allow the guest to control directly, you
justify why that's safe and secure. If no justification can be given,
emulation is going to be necessary. How to solve that is first and
foremost part of your undertaking.

For the bit in question, where the goal appears to be to have hardware
hold the OR of guest and host values, an approach similar to that used
for some of the MSI / MSI-X bits might be chosen: Maintain guest and
host bits in software, and update hardware (at least) when the
effective resulting value changes. A complicating fact here is, though,
that unlike for the MSI / MSI-X bits here Dom0 (pciback or its PCI
susbstem) may also have a view on what the setting ought to be.

Jan


