Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61426A0A62
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 14:21:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500372.771715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVBXD-0001Oy-44; Thu, 23 Feb 2023 13:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500372.771715; Thu, 23 Feb 2023 13:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVBXD-0001MO-07; Thu, 23 Feb 2023 13:21:19 +0000
Received: by outflank-mailman (input) for mailman id 500372;
 Thu, 23 Feb 2023 13:21:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVBXB-0001MI-Lk
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 13:21:17 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f36dc572-b37c-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 14:21:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 13:21:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 13:21:13 +0000
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
X-Inumbo-ID: f36dc572-b37c-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ec4oojDAFLxpvoyShrlCY8PBPb6rATbSXmv85x5OVtt9PH5OQ3wpzWpI0Z0uYwvs68TdjHHdpQEAHym/lC53G1F/vC/BMXfa4DrU6HiRIVIcNrcHf6pCRqrSVYISXiQL/2a0Jdzcmx+hT3jCJmUc7rwGk2EZELTqnRNnY3AV5RWfSSXvBSCNr1296tZoeTUiSEPY6QbLGKpJrKPcBlD4u/OFW2/tOm12138igWNeO1m4ErouUMzgERX67Ga4xTo/wza9oaiHb//x25Uprsgwz5VFPtx6lGT1JFuWyS0kaQx941QEug9hAGK4keZ6HrmHfzOO7oBmicS1u7bbZCETUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y27drwXplKh9nrqujHlWXmeNrzaYOCjyW0iIbCL/Fms=;
 b=gVmvJ5DSq2vhu/vDQGiLDzEnvys3LqodyHGXV8TZHStMh+WKE+bu53IpmZ7VnLiKjgnKnQ9UEEjH8aHS1Lu+rgA5/A76jX1EClcMdLv70XfmielpvXezrcPoP1G2f0BaKb3NUK2vkYQwPnkzRo2iLYStTuZo1IdJELwUOG2Cb1/uF5eMCoZUpeGtZ49t2zh0HhcH5Z9WI9j/9ugrDSAk9ZQffgCV9setwb5e1CBaYYHEsN/ysW1EOXuOZo52DfmXk9gnvRIVynQDFyJMhGkZ9rxr5DkEqfESQ+svNGlc+Rx0YB9ivY9RF7HZe8rPsEKNTRTIKBAlkRmVgdVEBy1cog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y27drwXplKh9nrqujHlWXmeNrzaYOCjyW0iIbCL/Fms=;
 b=ahuF3fTjDofBVHYOaM2ciXjx70wxqd9iWExZnQX6SmeE6CqfkelZsFDMof8hz7lQzZGQgxpO/0EBA4Ka9xmSFrRhYtSMdg+X5s7G7AcRgLP2st4nIISzNjLTcPAQS0Uxh8QDXnSkq3o6QMVifAUnKE06FVOUw45OMc+9TxOv6KusxxB00xd3k4NXOMPfMPkPXSVt/Ih9Nhd2KFLpC9rfuIDGNQubpEdl6aDN4AanXXGMvxJ365gjVw0lr+GOuDQ0Sf7iuADPs3pcxi7kRC8LwNIGzVpmkUVH0iyLVwm0F2rRlA+kpd7uH5R/WEfoblBHu1EHpA1Ry67o+U46XGk8qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49f35c93-2235-4223-89dd-3e6256a17369@suse.com>
Date: Thu, 23 Feb 2023 14:21:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Call SetVirtualAddressMap() by default
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <9a0e5021a612951c4174c45099edc8a4fb5bd3bb.1677091168.git.demi@invisiblethingslab.com>
 <dc46acc1-9eb9-8091-28df-405a66879a85@suse.com> <Y/dlPXeJlPRwEB1s@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y/dlPXeJlPRwEB1s@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 228444bc-9409-45a4-212c-08db15a0d610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n3NgVYhCqLr5vk1PVVGr/i/sRraMbuWRLOGJWeCHwga81T004SD9jOWHfWtQkHJ8qj6YFzVrD6gMaFiO7uXDe7omcg9ClBGtGvF6aWbfaD3sKhtdQJxSEuAsuDgBDwLTHcdM5zx0du76q8I9sxkb1gpuuaR+EG7Wd8O0wUIMKUPPTlQTdaOyoZFioXmw/v+5sAWdRIqD/ULCmNYz3M4atXgm7w8JsxTMLdL5y46DeS0URANfDkP0eEd/sBj0NdLqVLR6FztjysKYB35EaUaXtLHH4FY+mMCyY4PMa9LfpqtMsR5d+0wXPoRZ6uOEQ+DtaJvhCMTFsN5RwVfBmLWde8HegJ1+9/7wF20EbkThJN0cLw0ohI8moBtY1C25AEONhdKcHPuVbr8r9PX5D2PsiL41t1/egsxiMNqSiEwjZQazupfpGkjv1pbGXWhf2r2o4pRDXYWzK5P2SSb55Yl8LZqE4/D51p960yFpVbCeJtaVhB9vTKJQUAWy9yCziyqc2JhBTF87hqH63GTbbQkU9LUEM1RCmZke9jAPC8ecxtV/ZibIPH8cwQ/JQcF+OqtkNvCwtbxWZcA1qMLIjnPiqY5ZaYEtd4dMWo7Lhews6rrL9xuNfLwNAlZcbNBYzKzdrobq+RCtvZgoFphuqo6r9HPCILcaNoP+zT7CwHjwmhyFo84EuM+o6cRfgjKknP6GAZHK6opFwedHO1MKVmvUeA54MhqABZyeaHA/YQZ+XkBfxwFrOXQsX5/N15czrK/w1/GIu8C+74+XYRBRivpbhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199018)(66946007)(66556008)(66476007)(54906003)(83380400001)(8676002)(316002)(8936002)(5660300002)(6916009)(4326008)(41300700001)(6506007)(2616005)(53546011)(6512007)(26005)(186003)(66574015)(478600001)(966005)(6486002)(36756003)(86362001)(31696002)(2906002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnRmTnJIYU1ISURQRGF4RG8yWVlSV0pKOXE3YTNyR2RSYnhHcmlDR2lhYXNZ?=
 =?utf-8?B?V2xZMldwR3hqS1B1WU1Ja2trMnBNcDhoQ0ZHeXMzMW5WK1U0VmhRRmZnKytk?=
 =?utf-8?B?VjlhRnBlYzJ1Tm9SaVE3Kzg3OTFSZWMyek93U1NqcXF5QTUxaUtkSmlTRjhw?=
 =?utf-8?B?b3luSTAvYmlNQWphV0ZxOHdqazhNRzB5SU4wUjRiTGpoZ3MwSTBwT2E3T0py?=
 =?utf-8?B?NXhQd3Q3NFRrNTdlVTE2Sy9TdTZZZTJCNEZZQ1JyZmlvT0dPZFlXalY3cmdw?=
 =?utf-8?B?Y0ZtbDFRaGErS01YQlJaNUNYWU9oSXkrS09idzRXL3BaQjBBc01oT3ZaSmlI?=
 =?utf-8?B?aTFtaVduOVoyRyt2NFcrUDJkZHlQeVZxQWppTzVVTWJHZzI3ZVp3Z2V5MVVz?=
 =?utf-8?B?TXhIUFlYeDRCZXEzS0lFTjBSYVRTdWZHMGRZaVRzMUVjYTAwcGNIaytFZFhS?=
 =?utf-8?B?VjdFb1hkTDE1d1RXNU53STF6bXpEc0VIZlVLd09US0ZJYW56SlFVdWpiVHlr?=
 =?utf-8?B?YWtoUkttODJUek5BSDhwMlhOMDZVaEJzMDJMb1pGZ3g3bUtGOEhkZDZOcWZy?=
 =?utf-8?B?MzJEaDhZT2h1WkkyaS96THY5UThHTHo1UzFCZjlTMmZGOGJpYlpsdkpWRm5B?=
 =?utf-8?B?V3RlN2xDYzJXVEtKc2JxeGYxSHM0K3VpdUdROWtyMUNKc2dWM0lERUM2TjN1?=
 =?utf-8?B?Tk82OVVGMG1kOHl2a01kV2NsN0Q5Z2l2MlVvWHRCeFJyVnBhNEsxaHhKemNt?=
 =?utf-8?B?ZkpHcENHbUFJdUtGalJKc3NvNlZLeWtGa1U4OU1xUmIxa0NlVEU3dkVDYnAw?=
 =?utf-8?B?THl2dkx5RndYalRYdUhzVUh1MzdPSW1ZTmJpb0I4MUFjWVBSY3pVSmVjVTdI?=
 =?utf-8?B?RFpMSjE5cVluUUlwZ2Z3WnltQUhtQURHY1phU1lMWU1vTDNPTXdyQUNqNFRp?=
 =?utf-8?B?OU9VRndNYnVERFJyM21XUEJMTXNwaTlKQkJtbmVTU1B3OWtGLzlab2JxMHhl?=
 =?utf-8?B?bTlsS294NXBFbUtHRWR0bkRXbHpxaEVSVytzaHJxUEhzU3JuY01yc0VaMWVL?=
 =?utf-8?B?RTdMZUppMXlBdVM5YjRtREYrSm5sVGNhSkpNbS9NbHFlcnRleWQzUEowYWNt?=
 =?utf-8?B?eWN6Zyt6OU1jOTFEdUwyQkxoSzlIYmZBM3NYUVllMHhkWUl4NEtKKzZ4NVhr?=
 =?utf-8?B?VUxmbnZ1Qm1ldlZTNFZjc0VUMnhIbVpJQ0Juc1NTVDdVRUNpb2Judzh3azhO?=
 =?utf-8?B?Q1RaWU5CdTEyaFNVQzBIWjVhSlhOeDY2NTliaHFHRG1yWTgvbEFaOWRMMUJC?=
 =?utf-8?B?TE9GL0k4alc3aEFzOW1Nb1gxTGx6WEh5Y0JWM3pKMTZoNGp5SUxrL2hQbUVB?=
 =?utf-8?B?bmZCTFhmT05GQzZkbklCN25VRXhNZmszWU5QVTZRbjJmc2lNZDFmMkdmWmQ3?=
 =?utf-8?B?bXZUejJMdWFjMDI5RWlBdmF5Rm90bGRrUldLNGpUSTcvSWszT1hnS3EwbVF4?=
 =?utf-8?B?ek9KVm9ONjgvRW5kUFpDWkdEb2RHTjExUTZ6RC9weG1HSzVYcWkvdGNqOGg0?=
 =?utf-8?B?NG1vMUpNaFVlL2FXQ3N3SUM0ZHE5TUFJUXUvNFQxMFRmc1RXczZVZ21ZTloy?=
 =?utf-8?B?OHFnVEx4WDFnTTY0elhzVXJ4b0dwQXk3T2FTRXFBOFUxemhnczRyaUQvY0Qv?=
 =?utf-8?B?d1B4MDM2MjU1eE9yUG9KdDhHQ0hOcUZVd2FlWExRdlRDSG9xYmMwSDMyNWFK?=
 =?utf-8?B?TEhCdmlOSzZFS0VEOGdXMzNnbUEzaVlCVTBMdHBMaXk3cW84ZUhyMVBlakJQ?=
 =?utf-8?B?OUlMSndFRDR2SUdBMkZ1eVJkdkpZeHUvMExaZEtRQTRpajNTNCtaOEhoVmE5?=
 =?utf-8?B?bzJLQWJFNmJrMXNydndNWlBVZFJOQW0wbk1iaVZ3VmVxd2pkMm9ZeDdHS0JQ?=
 =?utf-8?B?Vmh6cTczYVRqNFNjWEZ5bnpRQ2Z2RFgxcWlxWDMrL0w4TzM2TDBaRkdEVmFp?=
 =?utf-8?B?WDdVOHlwUmFCNlU2TE1jNTAwQzUvMDlLL25CSThjUjd0ZXcvT2JZaHY5RjRS?=
 =?utf-8?B?SU4weWVlb21uMUxzZ0RKb2JCK2tjZ3ozRURmM1g3ZW43K0xncnl2d0JHdWNU?=
 =?utf-8?Q?sEtvAudouTZDtR5Wsr2WpSM6o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 228444bc-9409-45a4-212c-08db15a0d610
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 13:21:13.4951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSD6RoBFXaPNPGa3AGj91kxQM0ZHLu1b43kJlbKmkosdnuUh4ygueCDOcTI+Mphi/H3i10NZq8UN/cqRZfRN3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316

On 23.02.2023 14:08, Marek Marczykowski-Górecki wrote:
> On Thu, Feb 23, 2023 at 11:16:28AM +0100, Jan Beulich wrote:
>> On 22.02.2023 20:14, Demi Marie Obenour wrote:
>>> To quote Andrew Cooper:
>>>
>>>> I know we've had this argument before, but not calling
>>>> SetVirtualAddressMap() isn't a viable option.  It's a prerequisite to
>>>> function on literally millions of devices
>>>
>>> Qubes OS has been shipping EFI_SET_VIRTUAL_ADDRESS_MAP for years, and I
>>> believe OpenXT and EVE ship it as well. Mark EFI_SET_VIRTUAL_ADDRESS_MAP
>>> as SUPPORTED and enable it by default.
>>
>> This is insufficient justification. The main reason why we don't call
>> it is because it can be called only once. Any entity taking over later
>> (e.g. via kexec) can't do anything anymore about the virtual address
>> associations once set. Hence what's needed to justify a change like
>> this is an explanation of why this restriction is not really an issue
>> to anyone in any case.
> 
> AFAIR from the discussion about the original patch, kexec under Xen does
> not preserve runtime services working anyway, so this limitation is more
> about some possible kexec implementation in the future, not actually
> breaking something right now. And since Linux calls
> SetVirtualAddressMap() _and_ supports kexec just fine, it's definitely
> possible to design this future kexec extension to work after
> SetVirtualAddressMap() too.
> 
> Relevant parts of that older discussion:
> - https://lore.kernel.org/all/272a9354-bcb4-50a4-a251-6a453221d6e3@citrix.com/T/#u
> - https://lore.kernel.org/all/20191009235725.GT8065@mail-itl/T/#u

Well, there are various statements there without further reference. I'm
having a hard time seeing how a full-fledged Linux could do well without
runtime services, or without being able to set the virtual address map
to its liking. If they can, then a question would be why they need to
set the virtual address map in the first place (yes, there is this
supposed "firmware bugs" argument, which unfortunately I lack any proof
of; at the very least I'm unaware of bug reports against Xen boiling
down to us not making this call). Plus maybe they can merely because old
and new OS are similar enough in their (virtual) memory layout? IOW
kexec-ing to Linux for crash dumping purposes is just one (important)
example of the functionality that needs retaining. Once we get better
PVH Dom0 support, maybe other Dom0 OSes surface with entirely different
needs. As said back then - part of the reason why in the original
implementation I've avoided making this call is because of the fear of
closing possible roads we may need to take in the future.

Jan

