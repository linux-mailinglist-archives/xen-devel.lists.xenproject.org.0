Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E46A40C1BF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 10:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187324.336140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQIF-0000Dc-9L; Wed, 15 Sep 2021 08:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187324.336140; Wed, 15 Sep 2021 08:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQIF-0000C8-5l; Wed, 15 Sep 2021 08:29:23 +0000
Received: by outflank-mailman (input) for mailman id 187324;
 Wed, 15 Sep 2021 08:29:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQQID-0000By-9W
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 08:29:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 055d2386-15ff-11ec-b4e7-12813bfff9fa;
 Wed, 15 Sep 2021 08:29:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-c0oMk0xyNli3FlPz0zxCpw-2; Wed, 15 Sep 2021 10:29:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 08:29:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 08:29:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0233.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 08:29:13 +0000
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
X-Inumbo-ID: 055d2386-15ff-11ec-b4e7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631694559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NrPN8UOMJbX5DXknjPHRqIXzQeCP7d2OwvcDucIFrx4=;
	b=Riw8cljiwLjO2F7hOerP4xeOX3feo5/YjSR0iz7HIZywTezyZPysmmGrI2db3qzEB1DQtu
	P2i2OhW3u74igVd6hhcajzLoxbyaZ/VsvWk4XC5+1WZ7COCoHyGkI4XiKfnqsEbpAToUU6
	bPwws+8dQLvELFbUAW1pyNKGjlP+S/w=
X-MC-Unique: c0oMk0xyNli3FlPz0zxCpw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKR3KyojnGCablw2P/AcNxOpYnZXAK6fS6jSoWj6MFpypqrjMDe1nO4cs0n1KZva92g/ib3HoxyCeB54y/40a23EPS42LxZtayOQZdnscPN4RSSEHs8QaqzR2WQY6wu5Xor1jKw7KwqkA2Y2LPjfjXORxMZS+bZbfJmlU6PSNnKbq9G+RE4wKpIgilVHAk3DPPzKT4U7bDrDIotvqxRwtG/fnBtHKsmy2qCIp3O/Ig9eHTcso9Ji9TV/9Mto/GYGZa2O7QLDTXSIYsy9uu1sRunEUqoVNgJUOEk2r+K1ykAWkMKhwonHbw6qFXDBS+JgFJ3RqahAYiehvg0WvkFrVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=2YQi9jhheTBMVlHNg08LfTgwAJJiCRcBKae449KfxBk=;
 b=Hi6xPT9QK1XfTKwlte+h/B2i7CJgJ4I6EoAa5E31KxPJ+aY6BWFQ2DentiABLPk8Fmt4hU22eDB8w8CaHl/ODwJfWBhN9OrlAQGMIhVZuS7tSGDa4YvwHFZDS+8hoGa4zbPdLpoLT148ENlTV6DroaMKIvnx9q9nqBgPpGJcXTRgDoT0h9Ry9QKbQzkZUvXNpBUpegDWwTbQ1bik2qiat4GXrElx3s+VaKyg+vzfYPkBR9DpGigKW8AimFCCKLU+W7C2afiuw66fcRxO44w+4dTIRWJgTKHRFzYk9wQiAz/vAqnKRkD/Z8OKD9clqoT+XliyUVt3BCaR3LKFTpAaOg==
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
 <40ea4ec8-483b-9191-a233-f2916f22c131@suse.com>
 <YUCYYmqQMR5NCTyz@MacBook-Air-de-Roger.local>
 <13dd8509-330b-4571-086a-7a3ed9c22c82@suse.com>
 <YUDNh9r8nYOxB76n@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0d011380-292b-49a2-f900-ead44e8a0bc0@suse.com>
Date: Wed, 15 Sep 2021 10:29:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUDNh9r8nYOxB76n@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0233.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ec2ffe3-c71d-44f4-269c-08d97822e68c
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260816DF26796CB7281234BAB3DB9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0HYb8vP2tP/qAjMZT2+S0se7lxMdbie9SaiioTKc6Q4GSWZK8YKr0LFV5YbDMy2YeBc79PYLdgjr5Mrc0D8QEkz1/P/69BJnCuE3gq4xNOcxxEwjLqKjKRCUpCttPv+V4vSqtEfKS2mEzvfb5xJZBpeBAggV4601p6zbXeHgaW5+2guGH+G3bpQMzGKlA7cJgMix/3H+/+BJyHdY6ZqNhXqWMAoITzol2BgWoeNu7e150uMgaHnQPO+IPxkRGU8TZVLy5VMBeHSFnuFBiGWE9BlGV5Vls4ZU8Pm1G7syTbUyxL72mpUSbPzIpe8GueAIRDUwqb7h5dc6IztT3tsdjIJFDv3GDsv0I416tvKgF6JnHrZwkauWFp2U4I7G7VsqH61bpCSn3DjOjFAG8N+fjSVhQVvWXY4Fwm8FD2F10CbWNWkjQaM51ofP1ilu67TTWba/KQIycDVkxBjxAiOqxd0TdmBWeBh3p2d3f94KH39EnoCsmjRdKhwLpEPD8VfL2/lyo76V/WxYNac+vpCuwcEw2/0/iKU2UXxkDTgQ3LBFmmPbdxw+wSQnz4KDHPphvGhZ8QyhvV+nxVCD60Pnp8J4254cwea/Tsb4P1eBriJujWxdoqq/PMOsi201hBJM56DEX0zOSGZGL+cfETYqFN/UeHnrZxqiF2KB3qbIpGutW9WJBqIRRP0c+y+ls8bUbwKIM4UNHqwxfHbBk+KaE1hSmGbW6D8UyXIOOMLfwOwuvIkAMwLh6uuh8CSDzzfk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(36756003)(53546011)(31686004)(66946007)(66556008)(66476007)(5660300002)(6486002)(31696002)(86362001)(6916009)(186003)(2906002)(4326008)(54906003)(83380400001)(316002)(2616005)(8676002)(956004)(38100700002)(508600001)(26005)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QN24YgvqTzKhfeBjXJO7hy6DEoo+7J2npBMCPiXFc4NVN5qQ0/X9X2h3D9ni?=
 =?us-ascii?Q?w+3U9gN+I5rruUL40m8jYLjEyOBl7lIEM4y/ZpWgbeTOmZNPPWcH77T1NlWw?=
 =?us-ascii?Q?3VnaEZ+6Ly42OiysZJ7k6x2ppqPGuGhyZADOnTJmVxxMbqTmj7EamoVwZ0WF?=
 =?us-ascii?Q?VgeOKoe3bLrn94vNAFU2/qHMlWhsobVw599E/nYPfZlzezOz5PQvSY1LgT+f?=
 =?us-ascii?Q?8obvUlcBumWr4HSWn+bjRS0u0/vFU4o72SF095ZGjojrd3dFS5VkZymyuMZU?=
 =?us-ascii?Q?P4Pkl0ql+fpo0TBSZlNTQB6e8OhmaxEgh+dQiiLXv3U7b72XpatoGhaYDO9m?=
 =?us-ascii?Q?GLcuVtPWKJHnYNkgZvo6c1YOfYa7wua1O2K6rI4OQDcCJ4fGGHeDCuG3x0RM?=
 =?us-ascii?Q?73ZVjITgEvFnJgEuW7HEliJhplT6xhLxSXNiCxb7NnBpvp7i5qEirhRnO0Gj?=
 =?us-ascii?Q?4S8QD40GfOMbCZaCcAS+z17ztkLL40rebKkvy3ltM9FgTXO2ZVksH2/o2cFb?=
 =?us-ascii?Q?wtmsWPYAQpz7juZ7+G6nAOkse1/6sNPGFejaowGF3rVzlJWhZBcRJJNHnzsl?=
 =?us-ascii?Q?z4KzmohCQHP+07c5nxy5ACQbc6VU/ACR867fm/S/B/s5vaX7onP7BRLfsvLd?=
 =?us-ascii?Q?y3wbVTHz6lhHKWFCClm3VczbV2cM3BWkBihwxeykxfAPCbVwoBwoSUpi6KZI?=
 =?us-ascii?Q?OURY+nciBEfs61hhI1YW0ZC+9lEY8vcwDP81kZAx1JndpiCGIY01bdYGzQQD?=
 =?us-ascii?Q?cJETs2i3sKGHg2Xg70nV3+5WoemyfM4MEMtVi2ZK6g6DtKD48yP2+lMwPySM?=
 =?us-ascii?Q?KY9lPyu9Wt6p1t34lqaTasip1d+i2gq8V0wgbnBG1JpBWqoZ2sUdIpSkstC6?=
 =?us-ascii?Q?/YErLXxy44Fk2seQ4Znd7gyw3d9d8LsUPQ1ADnIjOEgaiJK6IE3+lceAuupu?=
 =?us-ascii?Q?wHWiFd6eEf/WZBmcUzafpUS0ooXCMsh4bhjjRwZsCtEJso8q2ULybJYF/kNE?=
 =?us-ascii?Q?b2h7SHX6aSTxJGKrpZJKrGisStLEp9I+APSG9sYy+0VyUQgOsiUnGMYdSN+c?=
 =?us-ascii?Q?5FEMeeNdDRcd5vYEwfoHbu9YrqnjalmX7W653gCaTrID+o+5ViCuRbuE4LeO?=
 =?us-ascii?Q?coGKLkxSoWVl2mNVCYvYh5XST0ecP8J2fNZI8a9ToX5V5VsqX2OjQ+pmVTIZ?=
 =?us-ascii?Q?rWYzbx+UsZJDPw4cpFDWePr+8pcxcQ/qeNxos6I3dBbuIOFo5Cxv3AEPPuY4?=
 =?us-ascii?Q?bflNhgS4bpasZwoeWzyoZZ0Pcfqw8P9Fz/R3mNDzecBsV1ieSKsnxaflqMxl?=
 =?us-ascii?Q?krg7D//M0RbfUWWiLs/J7Ev7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec2ffe3-c71d-44f4-269c-08d97822e68c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 08:29:14.2671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeqoU17UZS0+1G+bCf5CgfAJB9NDnrpI2SW8Y4r6y4Ny5GwRlc0jxtaO7gs15ppqi1jzEsL9/CR5BUx3pMpdeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 14.09.2021 18:27, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 14, 2021 at 05:13:52PM +0200, Jan Beulich wrote:
>> On 14.09.2021 14:41, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Sep 14, 2021 at 01:58:29PM +0200, Jan Beulich wrote:
>>>> On 14.09.2021 13:15, Roger Pau Monn=C3=A9 wrote:
>>>>> On Tue, Sep 14, 2021 at 11:03:23AM +0200, Jan Beulich wrote:
>>>>>> On 14.09.2021 10:32, Roger Pau Monn=C3=A9 wrote:
>>>>>>> On Tue, Sep 07, 2021 at 12:04:34PM +0200, Jan Beulich wrote:
>>>>>>>> 2) Dom0, unlike in the PV case, cannot access the screen (to use a=
s a
>>>>>>>>    console) when in a non-default mode (i.e. not 80x25 text), as t=
he
>>>>>>>>    necessary information (in particular about VESA-bases LFB modes=
) is
>>>>>>>>    not communicated. On the hypervisor side this looks like delibe=
rate
>>>>>>>>    behavior, but it is unclear to me what the intentions were towa=
rds
>>>>>>>>    an alternative model. (X may be able to access the screen depen=
ding
>>>>>>>>    on whether it has a suitable driver besides the presently unusa=
ble
>>>>>>>>    /dev/fb<N> based one.)
>>>>>>>
>>>>>>> I had to admit most of my boxes are headless servers, albeit I have
>>>>>>> one NUC I can use to test gfx stuff, so I don't really use gfx outp=
ut
>>>>>>> with Xen.
>>>>>>>
>>>>>>> As I understand such information is fetched from the BIOS and passe=
d
>>>>>>> into Xen, which should then hand it over to the dom0 kernel?
>>>>>>
>>>>>> That's how PV Dom0 learns of the information, yes. See
>>>>>> fill_console_start_info(). (I'm in the process of eliminating the
>>>>>> need for some of the "fetch from BIOS" in Xen right now, but that's
>>>>>> not going to get us as far as being able to delete that code, no
>>>>>> matter how much in particular Andrew would like that to happen.)
>>>>>>
>>>>>>> I guess the only way for Linux dom0 kernel to fetch that informatio=
n
>>>>>>> would be to emulate the BIOS or drop into realmode and issue the BI=
OS
>>>>>>> calls?
>>>>>>
>>>>>> Native Linux gets this information passed from the boot loader, I th=
ink
>>>>>> (except in the EFI case, as per below).
>>>>>>
>>>>>>> Is that an issue on UEFI also, or there dom0 can fetch the framebuf=
fer
>>>>>>> info using the PV EFI interface?
>>>>>>
>>>>>> There it's EFI boot services functions which can be invoked before
>>>>>> leaving boot services (in the native case). Aiui the PVH entry point
>>>>>> lives logically past any EFI boot services interaction, and hence
>>>>>> using them is not an option (if there was EFI firmware present in Do=
m0
>>>>>> in the first place, which I consider difficult all by itself - this
>>>>>> can't be the physical system's firmware, but I also don't see where
>>>>>> virtual firmware would be taken from).
>>>>>>
>>>>>> There is no PV EFI interface to obtain video information. With the
>>>>>> needed information getting passed via start_info, PV has no need for
>>>>>> such, and I would be hesitant to add a fundamentally redundant
>>>>>> interface for PVH. The more that the information needed isn't EFI-
>>>>>> specific at all.
>>>>>
>>>>> I think our only option is to expand the HVM start info information t=
o
>>>>> convey that data from Xen into dom0.
>>>>
>>>> PHV doesn't use the ordinary start_info, does it?
>>>
>>> No, it's HVM start info as described in:
>>>
>>> xen/include/public/arch-x86/hvm/start_info.h
>>>
>>> We have already extended it once to add a memory map, we could extend
>>> it another time to add the video information.
>>
>> Okay, I'll try to make a(nother) patch along these lines. Since there's
>> a DomU counterpart in PV's start_info - where does that information get
>> passed for PVH? (I'm mainly wondering whether there's another approach
>> to consider.)
>=20
> We don't pass the video information at all for PVH, neither in domU or
> dom0 modes if that's what you mean. Not sure what video information we
> could pass for domU anyway, as that would be a PV framebuffer that
> would need setup ATM. Maybe we could at some point provide some kind
> of emulated or passed through card.
>=20
> The information contained in start_info that's needed for PVH is
> passed using hvm params, just like it's done for plain HVM guests.

This is what I was referring to; I'm sorry for having been unclear.
It's no video _mode_ information, but information on hot to get at
the console.

> We
> could pass the video information in a hvm param I guess, but it would
> require stealing guest memory to store it (and mark as reserved in
> the memory map). Not sure that's better than expanding HVM start info.

I don't think it would be; a param doesn't seem a good fit here,
and I have to admit I'm not even convinced its a good fit for
xenstore and console coordinates (that's fine for HVM; the only
reason I can see for PVH to use the same is the expectation of
the line between both to become increasingly blurred).

> Maybe there's another hypercall interface I'm missing we could use to
> propagate that information to dom0?

I don't think there is; if anything we'd have to add something.

Jan


