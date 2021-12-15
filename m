Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA776475868
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 13:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247347.426497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxT4Q-0001k3-GU; Wed, 15 Dec 2021 12:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247347.426497; Wed, 15 Dec 2021 12:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxT4Q-0001hG-DH; Wed, 15 Dec 2021 12:07:42 +0000
Received: by outflank-mailman (input) for mailman id 247347;
 Wed, 15 Dec 2021 12:07:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxT4O-0001gi-Oj
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 12:07:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99170540-5d9f-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 13:07:39 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-DxGG4ctFMGKxak2UNYO1ig-1; Wed, 15 Dec 2021 13:07:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3533.eurprd04.prod.outlook.com (2603:10a6:803:b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Wed, 15 Dec
 2021 12:07:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 12:07:35 +0000
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
X-Inumbo-ID: 99170540-5d9f-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639570059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nxyhZTlEzR5YCpYo4L4Y4mwpF9Atr6VzvbS9ubaWdmo=;
	b=KYzN9dD7w3U7JJ5FaS6dUmUVkAzxIZ/pJm8uo5bblZfwzqYdVpIgwvRctZaApoSZcNoBxY
	FV94wL4Kopa33W/ihFzP+IzINHwVEheDIGZKOaG3aQY6XmyzQYzz0GyQhDMsFrDdC8g/3V
	Y695ns7sIyakKQQSJkPImEut0L0wgL4=
X-MC-Unique: DxGG4ctFMGKxak2UNYO1ig-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMKvDw7En3wVFDrNERdFbg+EL5Efd9oo99hWBwa6a9JFZDw0Gpv6sTjO0rJ7yBP3lyobvpdQYwPONi7CizrmtYR4yfeAtmg+5RcnKzQNXSJRTrdZIhaVNnapwZiK9iv5KhJ6ajLStK3DEXtyzPL9g0n/D8Fl+E/s2OADEpOlixSWLc9DLnTjSGNKIl7clh/sIm0zD48ACaFK0iyUYrFpYhaPoEQwJRU5Gkv0OlEHxL/cJvoQ7727ts4kQxmgx1ohBA4cJ1Oy98uv8zxrqPcC/QmAgJycucPhN+uwSKDa1x8LfcYOcbdziOKHnZcojtzZx7svro8h0CERMYwWremBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxyhZTlEzR5YCpYo4L4Y4mwpF9Atr6VzvbS9ubaWdmo=;
 b=dImBW6oS1NURllzz9cKA+zU88PXj2wls3MVKDgNxsQdmGLX0hC+8Pg0sW6SBaIbyTcdxo8s2aBWDuviPNOc76vsPjWPlQJ/ikh1GpTi49a05/ph7I2kZLoecwMAQliVVGJiH9r+Z2hwempuW5hifx8VXAyh6l+KBfVzJmzDDXkyFBrG4C2jLVWOXV413kDI/t/fI4q8f8E6/JL2AV1XkIEgnthSEC2j2ZVCIfGC86C3RXssq5LA7hUzebW/zPau0bNK8mc3ygLxEaMX9mR8AeHbCx9AiEVKrlae5zGGrYDPWv0QohqqO+pLGn1rPUzm1l/Jti7lfYnXEADhnW1McyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <79466492-fd58-1be0-c47e-13fc1e17479d@suse.com>
Date: Wed, 15 Dec 2021 13:07:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 00/14] PCI devices passthrough on Arm, part 3
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>, "paul@xen.org"
 <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <3a9f16d5-f076-92e2-f1b9-33a3c1a3371b@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3a9f16d5-f076-92e2-f1b9-33a3c1a3371b@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56f840b9-ec58-46cf-8677-08d9bfc37ada
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3533:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3533A0FD13209013A9D028C4B3769@VI1PR0402MB3533.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aFSutYcQQkez6sTuemjeNSp06haCbkWAXn1hvj+q8etHRskJLTu4KQM8ThyZ6HwCyTt8XHKF4hEphgyMCLgpBk6OxsNO2rMk/8O3e5FTxS270SaIfIzVKO6LVDso7ncjp1ZkRsDyBIoh/AVtVzCaZBaZhTE27yINjhZFixaSZke4BXB2r4mFJej5EzQ9Kgi1F8HZFLoUBgi6OU8nNudVWHUZkOk2LwV2XNp2+aMeHfdZPJysIIGjvBbPrH0oScH289FmKD3whNdk7xvLRLEzyro39Hq2xAmXVyAgjK4xN56JnB66PR25X/SOZHLbTdovdc9Rmk1LfIiWUacy50Vpj/+15U8R4jeX4BwMYKlJ4NKhrxZYzWAXf7iyVnd1RzdjaRWxhFRbMZFUmGxb676iO07dvKdpTRnpXRn6LkRPqYprpKERIR7fHu+gMWJZSXNixPi7LHDOWfR5yMlxrlVJoSIYArRQr09GmVfPLjYB9fnbKIn3jac4DuDh8KnptP+WLxYlx+IChn2egxGVNy/ZQWDkTuKbORcg+wJR0hD93DaG5XT5joYxTt36kQ9CkajfTj4lG3Qs+jfgiAPohJ+WFeZV6NEZizVh8ZfdzE69/KJMqjdpXQXfeJf7vFX4lyWziTR11AD5NYb8kwr2z+dt61JjZP1C6/OHn2fV28uGf/oiYuu97e1u5y6PjL+NKyHm9zcH8+8Xs0B3fKf1f5Vn+z+CfkvOx61Osy9USXOz3M5BxZnP/BArgMHLUg+2sAH9e0md9K6SgYIENhAbW8B/NVDzPH2HS/X7xmdFYliwGm+dZqkCWfQm72ApS3acV7Bn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(5660300002)(54906003)(2906002)(966005)(83380400001)(6916009)(26005)(86362001)(8936002)(66476007)(2616005)(6512007)(6486002)(186003)(66556008)(508600001)(7416002)(8676002)(36756003)(66946007)(53546011)(316002)(31696002)(38100700002)(4326008)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2FRalhhTEhNd09FNTkvdDg1TTZXaGVqdm40TjVlVS9aTEJLNEJRQzBLUU1L?=
 =?utf-8?B?U2hSTUZtNXVHTWJXRmVtS2FZeG5MM3F6bE55SHBPbTJPcFRrWjZuMlNPVmRE?=
 =?utf-8?B?NDM0RGZMb1pXY2lYbDhhVFdtUDdQMlk3QVNEcm5qT2h1UTBVVkZUb0pUblhh?=
 =?utf-8?B?ZTBsdXFySlJPSzVQMUtMR2ZUcU9XenNudDRRaXNmOGE5MmxlMXRkR05PVXl1?=
 =?utf-8?B?dDUxamVlMmpRS1VsTzJReU5yUFBPbHdKbkF5aCtSRlhHWmhxTU5zK2lZWkRN?=
 =?utf-8?B?MWZIQm96alR1b2I0d2ZNSkE2UmZQclpISzFsSVJFRzczWmVManlCZmJudVp1?=
 =?utf-8?B?OUFNb2doQVA4Y2NneGhSMkZoNzlaZXZFOStVZ0NKckRnejJaMHIrL0tPdUxt?=
 =?utf-8?B?NUFTNUo0V2s3WXM0M2ZweE5mY1V0V2ROQUtTTi9ocThBRHJQZFZGcGFKa0Zv?=
 =?utf-8?B?NDJkZnVHVldzTnY3cncrajJTeEhMVTlSUkkrU2xoOVU5NDZMaUpLUjd5YjRP?=
 =?utf-8?B?Mmg3Zys2Rkw5eGJWWU5rcnFEYytYb2FKdlB6MnVoNGI3U0hWUU5Cdi9UQ0da?=
 =?utf-8?B?dmFQREkzSEUrVUIvOVd4c1h6ZG1nQU96eXZYUVJTdnByN281RlFKOC9leFdr?=
 =?utf-8?B?OTFoR0RZK2tlZHQ5VTRLcXJpWEw5QUVISytLaC9MMERnaHFEaTBycmxzdVhk?=
 =?utf-8?B?TlViOTgrajJNMzMzSWZzYnRxT05PMjVMSEJSV1N6SkNNWVN5WHkzNDYxY2Rn?=
 =?utf-8?B?THNYcHhxMFdYUjJ2Ukc4S05HVE5yMmlZWXBYdFJrT0pPSXF3VUU2TnAxWFJK?=
 =?utf-8?B?TUZQRUxQdXZ1dWJFekdyOXdIazBMeHR2MHhoUmNucVp2RHlEa09CaFVqNEVE?=
 =?utf-8?B?QTgreXVKVFRRUE9pK0lqb3JuYjR3cm9sMEtQTzB4S2RhMUlESTZnemNDRzJE?=
 =?utf-8?B?dkdBVkEwWlovSFBmaDhGb291MERYc3Z0cnVxOW5xQmNTMkYwWEszNThCQW5M?=
 =?utf-8?B?TlI4NTgvQUFQUnVyMzVXVExWYm0rUml3RVoySmpYWXdKV0NOWlFvdmhjQkwx?=
 =?utf-8?B?bzAzWXRKMHN1ZUdKU0V4T2VWeUZiSTgyemhuMU95VmgyTXE1NWkvT3BMQlRS?=
 =?utf-8?B?eVlPREZqTDIrVmZJdFAyR2ZnbFRCbTJPUTNEQlJHWkt2OHNGbnJTS3IrcURS?=
 =?utf-8?B?SXZLZk5WWkEwUEttVE11OTRiYXUvc0V3QWN1Zy9xeFFGU2JMM0xibUkwSkdK?=
 =?utf-8?B?WHU4bTRCL1JjVXpOMmRtRFBocG1aZmJMcVJ6L3UweDhEeGk3NFMra29Zc2Y3?=
 =?utf-8?B?eXBTN1pVMjhWMGR3V1Z0ZzJGMnlkZ2Q3Zlk1eFQrYWpYMUxpOSs5S2EvQWZK?=
 =?utf-8?B?aWNram9xbDN0RHI5OVllZEZUMzZmWWJXaEhxMXJ3UVNjL3JsdEFEQzlLVW54?=
 =?utf-8?B?OWg3MGI4aTRUR0NxNXhsN2ZMKzl5WkdMblFsWFM1VE9meEhtcFFYdVdmK243?=
 =?utf-8?B?eWQ5TTlBSlZwbVhsMmtKaDk1ZnhlckluTHd0YmhQMzNWODJWMUtGbVA3Ryt4?=
 =?utf-8?B?cDI5elhPZTUyekpBUS9rSWo2OEJwLzZOQ0syWkMrNGdoREExVTAycklrcEs1?=
 =?utf-8?B?RUpPWThncS9OR2NBT3VsVHNpdGM4bGhySjgweEY4REpNMXNqRmdkb3FQRVpt?=
 =?utf-8?B?L2s1d3V2V2s2RFpwZE5HaFROQ0pHMy9ZMmNPd2E4c21GcUovNnNjbk12bkJV?=
 =?utf-8?B?RTdCZ05MNnJIVUtWQTIzMHVRYU5PNXUrbEIwOHZCSi9PRXdOQ1Y0ZU5zZkc2?=
 =?utf-8?B?d2RhQm9FL25NeTQ3NHpodTE3eDFRTVpXR0lJazNsaWxXNGdoQlBoU0RUQkk4?=
 =?utf-8?B?SjZSUDVtRG1qSWsrdHhrVUhiS1AvOVB6cGZUamowY3lKck9vVFRxdEE1NzFZ?=
 =?utf-8?B?d3ZwanRXSGx4MWFVcGVFOExzM0VPNFpreGZnLy8zUWhxeE9HY2luYXpTdmNl?=
 =?utf-8?B?Y0VKa21jU3g1RHlQZUVNdER1MDBKS01wKzhqV3R6RWM0b05ud3c1b1RQZlVi?=
 =?utf-8?B?cGpyRThYY3FsQ0h0TGJXSysrbDNZWGQyNXZhNzRZSlJQazVVb3p5ZHVnbHlw?=
 =?utf-8?B?NTd5dFh1VjVhMW55bmE5cnF1RU1UcWxDRVYraExFRWtLQTlCQTFGRExKYUUy?=
 =?utf-8?Q?qzgW1B01sj7AHkE/p3qM2S4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f840b9-ec58-46cf-8677-08d9bfc37ada
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 12:07:35.1914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXwOjCmoPt3x8ynqZToOn2gSKlQJlG+oBtWO6IvOU60C2l5d284UAxJxh+J7hHJQuoOJVYpiunIAgQUiFvSnCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3533

On 15.12.2021 12:56, Oleksandr Andrushchenko wrote:
> Dear rest maintainers!
> 
> Could you please review this series which seems to get stuck?

I don't seem to have any record of you having pinged Roger as the vPCI
maintainer. Also, as said on the Community Call when discussing this,
I don't think I'd view this series as in a state where an emergency
fallback to REST would be appropriate. As indicated, in particular I
wouldn't want to commit any of it without Roger's basic agreement. IOW
while REST maintainer reviews may help making progress (but as much
would reviews by anyone else), they may not put the series in a state
where it could go in.

In any event, as also said on the call, afaic this series is in my to-
be-reviewed folder, alongside a few dozen more patches. I'll get to it
if nobody else would, but I can't predict when that's going to be.
There's simply too much other stuff in need of taking care of.

Jan

> Thank you in advance,
> Oleksandr
> 
> On 25.11.21 13:02, Oleksandr Andrushchenko wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Hi, all!
>>
>> 1. This patch series is focusing on vPCI and adds support for non-identity
>> PCI BAR mappings which is required while passing through a PCI device to
>> a guest. The highlights are:
>>
>> - Add relevant vpci register handlers when assigning PCI device to a domain
>>    and remove those when de-assigning. This allows having different
>>    handlers for different domains, e.g. hwdom and other guests.
>>
>> - Emulate guest BAR register values based on physical BAR values.
>>    This allows creating a guest view of the registers and emulates
>>    size and properties probe as it is done during PCI device enumeration by
>>    the guest.
>>
>> - Instead of handling a single range set, that contains all the memory
>>    regions of all the BARs and ROM, have them per BAR.
>>
>> - Take into account guest's BAR view and program its p2m accordingly:
>>    gfn is guest's view of the BAR and mfn is the physical BAR value as set
>>    up by the host bridge in the hardware domain.
>>    This way hardware doamin sees physical BAR values and guest sees
>>    emulated ones.
>>
>> 2. The series also adds support for virtual PCI bus topology for guests:
>>   - We emulate a single host bridge for the guest, so segment is always 0.
>>   - The implementation is limited to 32 devices which are allowed on
>>     a single PCI bus.
>>   - The virtual bus number is set to 0, so virtual devices are seen
>>     as embedded endpoints behind the root complex.
>>
>> 3. The series has complete re-work of the locking scheme used/absent before with
>> the help of the work started by Roger [1]:
>> [PATCH v5 03/13] vpci: move lock outside of struct vpci
>>
>> This way the lock can be used to check whether vpci is present, and
>> removal can be performed while holding the lock, in order to make
>> sure there are no accesses to the contents of the vpci struct.
>> Previously removal could race with vpci_read for example, since the
>> lock was dropped prior to freeing pdev->vpci.
>> This also solves synchronization issues between all vPCI code entities
>> which could run in parallel.
>>
>> 4. There is an outstanding TODO left unimplemented by this series:
>> for unprivileged guests vpci_{read|write} need to be re-worked
>> to not passthrough accesses to the registers not explicitly handled
>> by the corresponding vPCI handlers: without fixing that passthrough
>> to guests is completely unsafe as Xen allows them full access to
>> the registers.
>>
>> Xen needs to be sure that every register a guest accesses is not
>> going to cause the system to malfunction, so Xen needs to keep a
>> list of the registers it is safe for a guest to access.
>>
>> For example, we should only expose the PCI capabilities that we know
>> are safe for a guest to use, i.e.: MSI and MSI-X initially.
>> The rest of the capabilities should be blocked from guest access,
>> unless we audit them and declare safe for a guest to access.
>>
>> As a reference we might want to look at the approach currently used
>> by QEMU in order to do PCI passthrough. A very limited set of PCI
>> capabilities known to be safe for untrusted access are exposed to the
>> guest and registers need to be explicitly handled or else access is
>> rejected. Xen needs a fairly similar model in vPCI or else none of
>> this will be safe for unprivileged access.
>>
>> 5. The series was also tested on:
>>   - x86 PVH Dom0 and doesn't break it.
>>   - x86 HVM with PCI passthrough to DomU and doesn't break it.
>>
>> Thank you,
>> Oleksandr
>>
>> [1] https://lore.kernel.org/xen-devel/20180717094830.54806-2-roger.pau@citrix.com/
>>
>> Oleksandr Andrushchenko (13):
>>    rangeset: add RANGESETF_no_print flag
>>    vpci: fix function attributes for vpci_process_pending
>>    vpci: cancel pending map/unmap on vpci removal
>>    vpci: add hooks for PCI device assign/de-assign
>>    vpci/header: implement guest BAR register handlers
>>    vpci/header: handle p2m range sets per BAR
>>    vpci/header: program p2m with guest BAR view
>>    vpci/header: emulate PCI_COMMAND register for guests
>>    vpci/header: reset the command register when adding devices
>>    vpci: add initial support for virtual PCI bus topology
>>    xen/arm: translate virtual PCI bus topology for guests
>>    xen/arm: account IO handlers for emulated PCI MSI-X
>>    vpci: add TODO for the registers not explicitly handled
>>
>> Roger Pau Monne (1):
>>    vpci: move lock outside of struct vpci
>>
>>   tools/tests/vpci/emul.h       |   5 +-
>>   tools/tests/vpci/main.c       |   4 +-
>>   xen/arch/arm/vpci.c           |  33 +++-
>>   xen/arch/x86/hvm/vmsi.c       |   8 +-
>>   xen/common/rangeset.c         |   5 +-
>>   xen/drivers/Kconfig           |   4 +
>>   xen/drivers/passthrough/pci.c |  11 ++
>>   xen/drivers/vpci/header.c     | 352 +++++++++++++++++++++++++++-------
>>   xen/drivers/vpci/msi.c        |  11 +-
>>   xen/drivers/vpci/msix.c       |   8 +-
>>   xen/drivers/vpci/vpci.c       | 252 +++++++++++++++++++++---
>>   xen/include/xen/pci.h         |   6 +
>>   xen/include/xen/rangeset.h    |   7 +-
>>   xen/include/xen/sched.h       |   8 +
>>   xen/include/xen/vpci.h        |  47 ++++-
>>   15 files changed, 644 insertions(+), 117 deletions(-)
>>


