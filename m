Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6321E40ACED
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 13:59:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186497.335227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ75C-0000g9-8D; Tue, 14 Sep 2021 11:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186497.335227; Tue, 14 Sep 2021 11:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ75C-0000dJ-46; Tue, 14 Sep 2021 11:58:38 +0000
Received: by outflank-mailman (input) for mailman id 186497;
 Tue, 14 Sep 2021 11:58:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQ75A-0000dD-C0
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 11:58:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 161a8738-1553-11ec-b41f-12813bfff9fa;
 Tue, 14 Sep 2021 11:58:34 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-xkeiV7F7Pz6XsvTxq7Likw-3; Tue, 14 Sep 2021 13:58:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4847.eurprd04.prod.outlook.com (2603:10a6:803:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Tue, 14 Sep
 2021 11:58:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 11:58:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 11:58:30 +0000
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
X-Inumbo-ID: 161a8738-1553-11ec-b41f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631620713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x8h8vrdylyoR9o51554wlmESqyDSMuN77HtVq4cvB2k=;
	b=VxjeEKoka1/xDQr/I9oOz6vLmTlrirHHLJSkDO+1gRkxu9DFlKZPOHHubRBl8FxlGamST5
	WqHXt5uuL8MSpzQV2ZE57T/wJyyZSUMjEP1Xj0b2ap9Mg3AfwqsU6f5hXmGaLdJUeZPuq1
	E8oDu5gGM0Y+5pmublDtJ+q7LR4pOYI=
X-MC-Unique: xkeiV7F7Pz6XsvTxq7Likw-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1UASAHL7YZ3pmzMjn0SklA8/FQkxLfydjd+IspXFdtf5m6OJBZdw0Ba/NLvQ+DHylHzf67mt0Ekv/9sPB2j5OxnITFHwoKnsO7xeJCDgXD64PG4eTvz2dkM8s4KvvjElzBuhsfnPQkiK+f42N6lcHCKmpXYHGC4qbzBs10r01fbLmj6xNkDzRGqi6gwLUu+6qyAtlbtMa28rtFPRVV798YC2x2IcbGxjXE3SXFdYgon4hsZu6z9v/45JU8/zx7NaVhR2R+2pQM2PQfW5lo2DfHGO7BgDrhiB0Jni1MLYI+4llmBxgEqW4Fk28/wYwz+Rap1MqerDy0w9vupSYzc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=22xZutEVb7YW8bswfCVj8AKyuuIOWtilaoRxFERMWqs=;
 b=FHgtVmjW/EoNRQfoxyXfHvRCojLkBZatSpXutA1Iwbz/cUkxB6xDDKLJxAqu2/lDw+efYTRLU9eZ9+VaIWMzdZxV9ewt+GozO3vQGYi+sEPXB8OjOKVF/5qwt/5/W8aRmIKoORmhoOc2pF5QXhAWhEM4PUmpJwJxrN7a81tCXex6+k4jh024NShvDy7vyz3qeyfO1iUwg3jbtlgDsyvKcNLmf5UjIa6j6cvxNDkqQLba/uBhwVH3nKWoGYNQbuII9jDjqvEscFQpojx6aB/igZnc4XCrxc1tjigU5Ah8iX8fLHZYGJuJqN9ktVCZD4sisvflRDpI35OBCGU/0A6CKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 0/9] xen/x86: PVH Dom0 fixes and fallout adjustments
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
 <YUBeJLvWXukyGSFf@MacBook-Air-de-Roger.local>
 <050f71c8-227f-4f78-1ec5-394ba9fba9c1@suse.com>
 <YUCEQFpdc+3kUqQj@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40ea4ec8-483b-9191-a233-f2916f22c131@suse.com>
Date: Tue, 14 Sep 2021 13:58:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUCEQFpdc+3kUqQj@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR2P264CA0006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::18)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbb7c1ad-f466-4052-1f41-08d97776f86b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4847:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB484789E7F32119DF40BAB3A2B3DA9@VI1PR04MB4847.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CYKmB3vn0zkYTPhXAdyHTOB2SALaWXVvfHDLdZi3a5+GuW6ZaEl0RjsdjfiBFRfdHdpW5QhKqrNxYAq2IA15lKYn2Gow2Q4wyOb97VsqT3eCbbSjzT8iiMXuG5Nms5AzmEH7aMEKzZ8LDf2bIuVCVX3HPSunmPQxRa8bcPIhGvcQO2z0VsvXl0gwIDxWLYViQhbhx+714c6404mNd+aV4HWUmG0ae1RK5B0ij/4Nnzn0j/OIx29s+unU8TFPOv/2JX6oyJz908fV+PSturxboq8eKhl/q8tuXwBu33AA+PVXFkKOZOH37O8BR1Rco4tzrhIkeH1rbam0l34OVcI1kJh5bJpeBnVUEBP/gPqA5phC1aF1ZTNDr3SIxxgn2P4e+x/f1/lmIJUSCFjpbW/gpJN7W35w1uq20mj9f5tIz0E1KnLVPZrgthx/uBQkMJfMqzZCnZOdMrczLKip60+ffEtLH/DC4x6Oxb0vzDj6JIDbZHwGtF2c5M7dbuS/AZZEmCpNL8WZUMc6vMbf2lJCQeDHD9QcV7dx5au+CYd83q9MTgf2WNwyj7pD5ygoSWfq0LIhUas3acJkuT/HjSRtH7u0OsBd+H/1h3RAeX7HTtmeqNRqjuH1Cs1FK8NINhqjjDy3GgD4lVHxchRna3B84NcKtB+bd6vd3I2kjNVvEmRWx+gGtNqAjUmjIEf+DnrjyVO+V+ALoAF9OAAsLH4weDkjh5y0tgZeRUQLIgtfo50TcB7GeeOSKlj0xUaL4UvGlLEcQ0SJ7ErkVB2CoMiW41MP1WBdcPsit96gEk8wfs6CA/pifbIb34Ke42sg90Nn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(136003)(346002)(376002)(186003)(478600001)(38100700002)(4326008)(956004)(86362001)(36756003)(8676002)(2616005)(83380400001)(31696002)(5660300002)(966005)(16576012)(316002)(53546011)(8936002)(54906003)(2906002)(26005)(6916009)(66946007)(6486002)(66476007)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s/EcSBBRZvZypQAUQXfCZ6iWsMaz4v84ci/jHV4rXU9YOEIJ86S6ZEKXozoq?=
 =?us-ascii?Q?vvzKhkzseyRDK2iYLeRaZJf5Q92jL+ym6ZDoKYSoeyCiaEsdmkmC17TaGg9R?=
 =?us-ascii?Q?GbLya3CBEFzx2J8M8dA5DaGgb5BPz9HYTu1xwqA/HbmMC19ofH/M50lkrjAR?=
 =?us-ascii?Q?5WYQq571rBRFcERSLkhLui7zmmeRcWh/fjPAjTHfAsK/qF1loI6f1g2GNOAl?=
 =?us-ascii?Q?K1+UbpBXwK6Ozxt33vS/H3mkYeDL3fcUIQOqYoKeXhV5xWat/72i2YEuZXXA?=
 =?us-ascii?Q?Qef148xucSIKagTNwvFsguc71UBsZuEYCfz01hF36v/llGqAvRHiY0JUVLJ1?=
 =?us-ascii?Q?moFUZWubf6uxISKiz1pp/hZsyIZk8x4da8ARbyhqNCU+P7QocfyTlkbrDVUK?=
 =?us-ascii?Q?swCLSCehA7lXXGYKZ35EDVcmKHbqm4spjoBqsw0lHqAIxmuwuhpZCQJ/Satb?=
 =?us-ascii?Q?cserW8aEJEs8utfUCIOjbU1st9kY3Aepf8TPjGiSL0xgCj1Ck64bW32Bkskm?=
 =?us-ascii?Q?Kygb1Amc+56cTbz7nnpf1aJg56vEojnQfp0nBpurwDk+ca5cTH+4yD+grdSH?=
 =?us-ascii?Q?xtk23D2YLgDmHYA+bwjJqnnJCo6Du//g/J44+VsMq0oLBCB9ZdEyNBm0brcq?=
 =?us-ascii?Q?zvwICfl90tmgnDVxj6PCR/XDWANj160K6LVxEaeI+9GmNa0mj/WDtptBDVWb?=
 =?us-ascii?Q?1uuH0PUZuNgM2U+/whovfOvWB/ZdZvGNh1vm6H43+P+/7KkncLZncWFRyJs5?=
 =?us-ascii?Q?Pu+vR6jWbBbjgpK3/u1SSZ9nQW+CZOY6fCIriQzOLmSb1ndpVhL/5Z4Tvf6x?=
 =?us-ascii?Q?hWlO+2hiqMkyFURnfbDBRG+HNfHkjMpw5AmfgPgzcN5w6YI2BRv3M9H6Cy+N?=
 =?us-ascii?Q?98DFfbPcsNKzF9zKQb2miMdj1E8w0/ckHvA1z7LvOERtTaUXJHCCPLZ1L/9f?=
 =?us-ascii?Q?PNlwesepKAG4Vv/Lvn94PsV8BK+ulK7e17tbB7OJuLv/5j7W8siBLuNr3h2O?=
 =?us-ascii?Q?BAE5Ntuvh2liP/txkbKcyruuGhV5mrHu/77cHojsOTFeeM9MbByD6On+NZoj?=
 =?us-ascii?Q?xvx/CwvKNyuSs2rBWc2DspdM2v5vHjKb1KMoh8iUiQwfJJH/pVxVQ6yrXbH9?=
 =?us-ascii?Q?ztWlEABRh8lHqIG5RBfa0VUZYf1Oer0g7vYpNshAuJL4wi0NrgpYRVmijI69?=
 =?us-ascii?Q?8xz1ruEYv2NWAqsPcICImxNsZ6qZPM9HtQQ64Fh8ueCP2tI913YnLUhYXqKA?=
 =?us-ascii?Q?b7WPcCroFKm4YRpCnhjdpyKiB4l/BUkPz0128oAQi3rfUTHzeouoCx1X2K8u?=
 =?us-ascii?Q?P5NbVPIuKf14b5nuh743+IqO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb7c1ad-f466-4052-1f41-08d97776f86b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 11:58:30.8661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrpIztEEIRW0KSxvy0FhmuV/2c6KDC/SGPdXFPoTMSXmXYQrF7fbuiOjQeE5mbrAYdFUHsgrCdtdLVAAvUNZuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4847

On 14.09.2021 13:15, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 14, 2021 at 11:03:23AM +0200, Jan Beulich wrote:
>> On 14.09.2021 10:32, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Sep 07, 2021 at 12:04:34PM +0200, Jan Beulich wrote:
>>>> In order to try to debug hypervisor side breakage from XSA-378 I found
>>>> myself urged to finally give PVH Dom0 a try. Sadly things didn't work
>>>> quite as expected. In the course of investigating these issues I actua=
lly
>>>> spotted one piece of PV Dom0 breakage as well, a fix for which is also
>>>> included here.
>>>>
>>>> There are two immediate remaining issues (also mentioned in affected
>>>> patches):
>>>>
>>>> 1) It is not clear to me how PCI device reporting is to work. PV Dom0
>>>>    reports devices as they're discovered, including ones the hyperviso=
r
>>>>    may not have been able to discover itself (ones on segments other
>>>>    than 0 or hotplugged ones). The respective hypercall, however, is
>>>>    inaccessible to PVH Dom0. Depending on the answer to this, either
>>>>    the hypervisor will need changing (to permit the call) or patch 2
>>>>    here will need further refinement.
>>>
>>> I would rather prefer if we could limit the hypercall usage to only
>>> report hotplugged segments to Xen. Then Xen would have to scan the
>>> segment when reported and add any devices found.
>>>
>>> Such hypercall must be used before dom0 tries to access any device, as
>>> otherwise the BARs won't be mapped in the second stage translation and
>>> the traps for the MCFG area won't be setup either.
>>
>> This might work if hotplugging would only ever be of segments, and not
>> of individual devices. Yet the latter is, I think, a common case (as
>> far as hotplugging itself is "common").
>=20
> Right, I agree to use hypercalls to report either hotplugged segments
> or devices. However I would like to avoid mandating usage of the
> hypercall for non-hotplug stuff, as then OSes not having hotplug
> support don't really need to care about making use of those
> hypercalls.
>=20
>> Also don't forget about SR-IOV VFs - they would typically not be there
>> when booting. They would materialize when the PF driver initializes
>> the device. This is, I think, something that can be dealt with by
>> intercepting writes to the SR-IOV capability.
>=20
> My plan was to indeed trap SR-IOV capability accesses, see:
>=20
> https://lore.kernel.org/xen-devel/20180717094830.54806-1-roger.pau@citrix=
.com/
>=20
> I just don't have time ATM to continue this work.
>=20
>> But I wonder whether
>> there might be other cases where devices become "visible" only while
>> the Dom0 kernel is already running.
>=20
> I would consider those kind of hotplug devices, and hence would
> require the use of the hypercall in order to notify Xen about them.

So what does this mean for the one patch? Should drivers/xen/pci.c
then be built for PVH (and then have logic added to filter boot
time device discovery), or should I restrict this to be PV-only (and
PVH would get some completely different logic added later)?

>>>> 2) Dom0, unlike in the PV case, cannot access the screen (to use as a
>>>>    console) when in a non-default mode (i.e. not 80x25 text), as the
>>>>    necessary information (in particular about VESA-bases LFB modes) is
>>>>    not communicated. On the hypervisor side this looks like deliberate
>>>>    behavior, but it is unclear to me what the intentions were towards
>>>>    an alternative model. (X may be able to access the screen depending
>>>>    on whether it has a suitable driver besides the presently unusable
>>>>    /dev/fb<N> based one.)
>>>
>>> I had to admit most of my boxes are headless servers, albeit I have
>>> one NUC I can use to test gfx stuff, so I don't really use gfx output
>>> with Xen.
>>>
>>> As I understand such information is fetched from the BIOS and passed
>>> into Xen, which should then hand it over to the dom0 kernel?
>>
>> That's how PV Dom0 learns of the information, yes. See
>> fill_console_start_info(). (I'm in the process of eliminating the
>> need for some of the "fetch from BIOS" in Xen right now, but that's
>> not going to get us as far as being able to delete that code, no
>> matter how much in particular Andrew would like that to happen.)
>>
>>> I guess the only way for Linux dom0 kernel to fetch that information
>>> would be to emulate the BIOS or drop into realmode and issue the BIOS
>>> calls?
>>
>> Native Linux gets this information passed from the boot loader, I think
>> (except in the EFI case, as per below).
>>
>>> Is that an issue on UEFI also, or there dom0 can fetch the framebuffer
>>> info using the PV EFI interface?
>>
>> There it's EFI boot services functions which can be invoked before
>> leaving boot services (in the native case). Aiui the PVH entry point
>> lives logically past any EFI boot services interaction, and hence
>> using them is not an option (if there was EFI firmware present in Dom0
>> in the first place, which I consider difficult all by itself - this
>> can't be the physical system's firmware, but I also don't see where
>> virtual firmware would be taken from).
>>
>> There is no PV EFI interface to obtain video information. With the
>> needed information getting passed via start_info, PV has no need for
>> such, and I would be hesitant to add a fundamentally redundant
>> interface for PVH. The more that the information needed isn't EFI-
>> specific at all.
>=20
> I think our only option is to expand the HVM start info information to
> convey that data from Xen into dom0.

PHV doesn't use the ordinary start_info, does it?

Jan


