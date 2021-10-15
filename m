Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CC442F19B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 15:00:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210573.367499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMow-0001YR-0i; Fri, 15 Oct 2021 13:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210573.367499; Fri, 15 Oct 2021 13:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMov-0001W4-TI; Fri, 15 Oct 2021 13:00:21 +0000
Received: by outflank-mailman (input) for mailman id 210573;
 Fri, 15 Oct 2021 13:00:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbMou-0001Vy-TX
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 13:00:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f45ec14-db50-4365-9d70-4527ca05bd82;
 Fri, 15 Oct 2021 13:00:19 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-oCj84NtYMR2kzM_8CJVvjQ-1; Fri, 15 Oct 2021 15:00:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 13:00:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 13:00:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0402CA0017.eurprd04.prod.outlook.com (2603:10a6:203:90::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 13:00:14 +0000
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
X-Inumbo-ID: 0f45ec14-db50-4365-9d70-4527ca05bd82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634302818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dlqg6wIP95EU5M/9cFVtRdRsm0M8IGxop5ZZddvic7E=;
	b=hgFMvWXdfwp35t9fm11Nb14eS/a9ALL7FxjDCYKyyINca6vDC+qOmR1KjRhmOYL9C3nL9p
	PCirAtncvbfGCrdna5mgvpAdwgQOrlCmGk/irhll4nMEzQq/cddGfGHHFCbzbhMX2p/E3Q
	btnkI86779VfHt20Muz47rjDxTMV8Dk=
X-MC-Unique: oCj84NtYMR2kzM_8CJVvjQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiEseSDklaVEEkLxl4wwiqxZtApXFKG5rbQiF1LlncCqYQSpoSbKX2zMKmMav/vHR+MiAy9nKWzKyeWeo1vtE25W7V79CZ62mnyozJs3h6E+x4lZH6SLLrvTzQuxOtyiu13ZwwkZluv+FYiqFZ/9qxh/JtNIVdGURINIKQ6gPTMbMT3hTfwU9N/V+2Ma+oO4xrmLbJ3C9Se7ebYYRmlj5FrP4YJduopCW3IZRgUkIriO4RNwjf212vIe7JPi28pryBzGf0QX6oFIJb7ZTB9a2Qthpuom121yikCGOx7aeQNP5T1j/jWajwLduupbO835/ne3wbwgou2Rj1c+nsBieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vR6wTKTrVwmg0T+zOhdOldEAmYszKY/1ruNfZL9Tj1g=;
 b=i9cmN6SZjmZGKMHR2I0S4LuFeNHAQBQwTuVEgEgajJKffwHgS6Uyud2dJc1PNRZ0nGIgV7LzzP9spNGvGmQ99hodBlEAwHP6WCJYA5XR+KNlp+TiwYj5imgOl5dAWDqogkdyjMeOYwz+mMOO+5CUmS9avQ+S5DNRyWknKX1YvGgdv+z4BBxAvv1ZRMOfwCbuljxrrR99uauVEplJtzlSz1D42AnI6cHSsHcR1M6vQooDeFwYFjEIiisl70HO1MgXiIBzQFspDBiFCyOIU/PWc1HbDB0m/fWyG9Hs5XJ66xFXpfimYuXN81F3RXcYxoiaBk8LoxJIEQRTzpQeB5a6ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <f41f59f7-69ed-e2fe-dc17-434b456cf693@suse.com>
 <57A39480-34DF-4BF5-9B0E-802D30F94BBD@arm.com>
 <24937.21631.538303.29471@mariner.uk.xensource.com>
 <b8fc68e6-2bba-ef11-4c4a-50c2046ecb04@suse.com>
 <YWlnc3b0sj4akUWa@MacBook-Air-de-Roger.local>
 <A2AAD333-35A2-4250-891C-E8FB885D5660@arm.com>
 <887d99e8-bcc5-f854-ceed-a38701e1ad1d@suse.com>
 <6C183E72-A9E8-4AB0-B6C4-C31E8AAFC4B6@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <08fec860-7e8a-c8c7-df70-3c277de81718@suse.com>
Date: Fri, 15 Oct 2021 15:00:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6C183E72-A9E8-4AB0-B6C4-C31E8AAFC4B6@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0402CA0017.eurprd04.prod.outlook.com
 (2603:10a6:203:90::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4969986-09bf-4bee-5831-08d98fdbbb5a
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038C0CE1D14703706B4F979B3B99@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3521F/G7YrRiuBWfMoSKhBJTT0bd8LYYsBeMFRTEJmu7euT9uzul/8vz0M4A3j12b+ezfy8IEHyaqakO94MKBgbBzwfFtHvRpZhuACOEpfy5feaAF13tXBIgdKvP3GsEVWULR3zcaoI1rXS55fL2aUl3KHU5esV00f+NkPb8kZ8UdPORo0O/nuMUBK3jomlmHg/wNNqM2MxEAuL5Q8gNdFA4q9Ps8vuEH3owJ1wCMZ58sZfGd7mbsUEnayirBG2mU7o056gX9qRXx5X2XEoyzfKS5hLWErWg7/P6vrM0LFJIWgflfIu9WdQR5mk3gLQ0kmDOEKPrI8zzt4gFES/wCbmcSn/w/XFKXG5L4wIvpDRtqvG8O6jhA6I88/pfuQMRZE6DZML64GdMVB59YxVuqdLQoj5gegfUybTEFaYra5fr8SJ+JBB/zLjfYmi000VualxYSqhvjxKaKkXck8r9mQl5oSdlTvoz7bF7ztJEIPH3FU6V1kMy8POpTjheNw8yW1UFQgoILL99jTS/uiTo4TJ0pgFfmWjHiToZLKQd058QqJxWkLCJdmSNMRR1p8c2PtkcMBJ5Mnw50rtkEWuHQ4DFE7GhUyOQVZnMTpPwylWyFuxZ6LW44fAY5nlNcIbttOIkqcWx2K2yPDLJBhVkEWLGdaZfzRXU5a3dS3LE3wcmtOFHzzjCbJaWTRKJy0DaNSkMbzQS9ZHWp9XH3gIhewcydE2Ery5GxuWYTfm33OXZTTiQBKp9g4b6TS7gqEHiLDK5Wzdoyr1qNrfRQ+zr1ZRH2H8t5WTW54vRqxi2kR0J6NagpXa1qHKQuZ0Ur+ZPX9Eg01AZ9wVxImHvodiC2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(8676002)(83380400001)(966005)(38100700002)(66556008)(8936002)(26005)(66476007)(66946007)(6916009)(5660300002)(7416002)(31696002)(6486002)(316002)(956004)(86362001)(16576012)(31686004)(54906003)(186003)(508600001)(36756003)(53546011)(4326008)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OGBLF5zgF+ltaJ/8mWWa3gNVM6/5fIhNzAGZ7Jw/qLJbsFK0UIieitRsY7jl?=
 =?us-ascii?Q?d3uW5Y+claOm1hkwPFrZzIIezWnCAk0fZ60NiktBjhJStWsTJYq8t8vl59qD?=
 =?us-ascii?Q?8hB/bJYyY3ucHq1IWzH95eKhWntcZNxL7fWc7VrLH1uCZQy7iLlDi38mopf9?=
 =?us-ascii?Q?B+4LMWDrkUkHQr56D2gzn4mrcZVyPaQLcKvXBJcIVvoRDIjbuMr2dkdznUOe?=
 =?us-ascii?Q?XTSmE0Vkfh1erEpjCzMdkyZIXph8x+B83tGt+39arzJeBtcQi7Qg9A5EEB5S?=
 =?us-ascii?Q?tPgNQhXMf8jaNbf9DxGLYQ2bowRJjezD4eU6Pm3rYl4kTDaZ40IOvPjBUrGf?=
 =?us-ascii?Q?gYBinXV2oQtiQPJVwdPfeebM0n1fmpg0sf7E1lOO1Mh5IO1LByORd7Mi0P5A?=
 =?us-ascii?Q?Cb1n94LYpsgf56KpD7rMq9Gv//dFnPfJwd79ITgUrt9o0Bragvj0/QMTls4K?=
 =?us-ascii?Q?OFpRNRQI63NtoL3cGExtOWH7uXxhWxWygFN4ka7XiO7fgY0ti+Z2dWvUqxXv?=
 =?us-ascii?Q?t37Rg8axPLD2dfoh9Kb2c5xB7hFdhGm694zma0rH+Qa74GOGuYq/PqVXjJAY?=
 =?us-ascii?Q?mb3B09YqtG+DJMUql0/Gtr/HFO5ZIdBV0KbbXoCTrc0j/XTt/yXezZBnMiyn?=
 =?us-ascii?Q?3CDc0ZtQV+DlK1P01YLrPqxgWksDlv4hR5v+gJbJz7PkTJc+NzbclZ1jS8EY?=
 =?us-ascii?Q?qq+csp9Cw2XZ+YJa9qa1PIjCIbRdrHtDDoceMWyNspu2aMEeqbSl+vcvhmLy?=
 =?us-ascii?Q?1in701pR2o+eHLtLQTx39DIttVUcK04/Z30xAN9584YuogJGV974rxVMpWCq?=
 =?us-ascii?Q?CGYOdOZz38S/QSFdRRP2HP45SDShL+I2EnadEm9bJ/0NKNJtRinSTZuegxK+?=
 =?us-ascii?Q?OoETYVXsFQcuCYQHlagj1NZXl9ZrtVWKdgzuGA5+kkDFeDpeehjRJeTt8NJZ?=
 =?us-ascii?Q?QymQvHX31zFLfa+d3+PYRzAljSjQmRRAaSCg3j2pYMPLp0EBVHd6T75gsSym?=
 =?us-ascii?Q?GS3akvXVdAnVFRTVrWURwtkFDkaJ+SkeRUwC8SSpyLuM9EG39u66X3o+w22h?=
 =?us-ascii?Q?Xmiv1MqJdYW91svAUyQcIVGeQYrJ6JuVrbc3FCJWeJRkPm6cc1ndOHbYGCiD?=
 =?us-ascii?Q?GgHlVYA+bALROdRbu4XjME7Y+ANBtQTZ4r12zZlE3PpaXXhWR3O+cv8rINjW?=
 =?us-ascii?Q?J0vaE6BaaO0iIlcM0qCcC86S1vBPuBokxJCZwlBPr6SYtK7FnxEScIIjPC1Z?=
 =?us-ascii?Q?uRXAGeRIPOIC3RQmY5nZX+zsgMlQiPTQoGNF9amal3Lmfh2qOqqjla2GGug2?=
 =?us-ascii?Q?1vln+1kswxdgckA3FBtPyodo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4969986-09bf-4bee-5831-08d98fdbbb5a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 13:00:15.4645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZ2liF3Kihfb6ridm6XjKtr1GrzYgoXbrV9GAR6PLL3DOqCc1eLhtORivF0KNFbsBi/yjgBhweEDGBpIYSqnXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 15.10.2021 14:28, Bertrand Marquis wrote:
>> On 15 Oct 2021, at 13:18, Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.10.2021 14:13, Bertrand Marquis wrote:
>>>> On 15 Oct 2021, at 12:35, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>>>> On Fri, Oct 15, 2021 at 12:18:59PM +0200, Jan Beulich wrote:
>>>>> On 15.10.2021 12:14, Ian Jackson wrote:
>>>>>> Bertrand Marquis writes ("Re: [PATCH v6 2/3] xen/arm: Enable the exi=
sting x86 virtual PCI support for ARM."):
>>>>>>>> On 15 Oct 2021, at 09:00, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>> The latter is fine to be put here (i.e. FTAOD I'm fine with it
>>>>>>>> staying here). For the former I even question its original placeme=
nt
>>>>>>>> in asm-x86/pci.h: It's not generally correct as per the PCI spec, =
as
>>>>>>>> the bus portion of the address can be anywhere from 1 to 8 bits. A=
nd
>>>>>>>> in fact there is a reason why this macro was/is used in only a
>>>>>>>> single place, but not e.g. in x86'es handling of physical MCFG. It
>>>>>>>> is merely an implementation choice in vPCI that the entire segment=
 0
>>>>>>>> has a linear address range covering all 256 buses. Hence I think
>>>>>>>> this wants to move to xen/vpci.h and then perhaps also be named
>>>>>>>> VPCI_ECAM_BDF().
>>>>>>>
>>>>>>> On previous version it was request to renamed this to ECAM and agre=
ed
>>>>>>> to put is here. Now you want me to rename it to VPCI and move it ag=
ain.
>>>>>>> I would like to have a confirmation that this is ok and the final m=
ove if possible.
>>>>>>>
>>>>>>> @Roger can you confirm this is what is wanted ?
>>>>>>
>>>>>> I think Roger is not available today I'm afraid.
>>>>>>
>>>>>> Bertrand, can you give me a link to the comment from Roger ?
>>>>>> Assuming that it says what I think it will say:
>>>>>>
>>>>>> I think the best thing to do will be to leave the name as it was in
>>>>>> the most recent version of your series.  I don't think it makes sens=
e
>>>>>> to block this patch over a naming disagreement.  And it would be bes=
t
>>>>>> to minimise unnecessary churn.
>>>>>>
>>>>>> I would be happy to release-ack a name change (perhaps proposed bo J=
an
>>>>>> or Roger) supposing that that is the ultimate maintainer consensus.
>>>>>>
>>>>>> Jan, would that approach be OK with you ?
>>>>>
>>>>> Well, yes, if a subsequent name change is okay, then I could live wit=
h
>>>>> that. I'd still find it odd to rename a function immediately after it
>>>>> already got renamed. As expressed elsewhere, I suspect in his request
>>>>> Roger did not pay attention to a use of the function in non-ECAM code=
.
>>>>
>>>> Using MMCFG_BDF was original requested by Julien, not myself I think:
>>>>
>>>> https://lore.kernel.org/xen-devel/a868e1e7-8400-45df-6eaa-69f1e2c99383=
@xen.org/
>>>>
>>>> I'm slightly loss in so many messages. On x86 we subtract the MCFG
>>>> start address from the passed one before getting the BDF, and then we
>>>> add the startting bus address passed in the ACPI table. This is so far
>>>> not need on Arm AFAICT because of the fixed nature of the selected
>>>> virtual ECAM region.
>>>
>>> At the end my patch will add in xen/pci.h:
>>> #define ECAM_BDF(addr)         (((addr) & 0x0ffff000) >> 12)
>>
>> Since you still make this proposal, once again: I'm not going to
>> accept such a macro in this header, whatever the name. Its prior
>> placement was wrong as well. Only ...
>>
>>> #define ECAM_REG_OFFSET(addr)  ((addr) & 0x00000fff)
>>
>> ... this one is fine to live here (and presumably it could gain uses
>> elsewhere).
>=20
> So you would agree if they are both moved to vpci.h with a VPCI_ prefix ?

I wouldn't object, but as said several times before I see no reason
to also move and rename ECAM_REG_OFFSET(). If you moved it and if
later we find a use for it outside of vPCI, we'd need to rename and
move it again.

Jan


