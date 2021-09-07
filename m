Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263FC402575
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 10:50:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180645.327382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWnd-00025j-AI; Tue, 07 Sep 2021 08:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180645.327382; Tue, 07 Sep 2021 08:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWnd-00022n-5s; Tue, 07 Sep 2021 08:49:49 +0000
Received: by outflank-mailman (input) for mailman id 180645;
 Tue, 07 Sep 2021 08:49:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNWnb-00022h-5C
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 08:49:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8cca3e32-0fb8-11ec-b0dd-12813bfff9fa;
 Tue, 07 Sep 2021 08:49:46 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-_uOl7SUxNhK_wGlpSXP27Q-1; Tue, 07 Sep 2021 10:49:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6669.eurprd04.prod.outlook.com (2603:10a6:803:125::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Tue, 7 Sep
 2021 08:49:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 08:49:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0120.eurprd02.prod.outlook.com (2603:10a6:20b:28c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 08:49:40 +0000
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
X-Inumbo-ID: 8cca3e32-0fb8-11ec-b0dd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631004585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+USiVCtL27+QQVariAoWrWCDUJ0hi/rb0UFRwLTlaow=;
	b=SYDMJFrpR7gpCRgiYpYjofoYikWKfk9roc1lp9retPps7XGuA9L8ftdsbC50vJovjCgYAK
	VOLq/cM7rm5qIb8anrvQSMGM5V0kLjskLrph/hFBaiIJun6tio/pszBr6q/aDnxHdxafM+
	9sKSngbhuTW6hJKncBURWVbyXp1kZE8=
X-MC-Unique: _uOl7SUxNhK_wGlpSXP27Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ec6JgUnFhyybd6anCfRarEA/03/sBMUfW9BG0eSLitlfHjvZeWUBhENH43rjKmwrG+W7+SW0v1Bg1PKN6na16IkTHiUSOUB6yQ3bbtQ9z+0gwdFlTEhBkCfFhwiePCwUrI0vEYsoriCd34mLHFpqvSWgyyFLGxcIDx51JRpi3WhJ5eOgk9sp9zrrcZZrCC4SNY5dmtXoCFVkr5o65Rcpqd4WBevNRugpJ58iOgB6KXK7NSJuWmQhszq5p0S75kuPy43gUmNVEmpiiBGwpkReuD+0T1jbjNZFpOJgybkhpxjjuVq7KFuUSC6TyrmanmtV+Z2bl39lKbFAQLj31UUPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=m0kuWnlTREyx4UISZpn1Ak+Ryu5Www7B1hzmyh1mIPU=;
 b=O+LzsgfB8sER4uDHJ7yGBhX6Fw3VX80mmKc8HnCIB6BS9ZfZdMrxE+WyAfoUhN9udpbo+ejDNylk9FJUCZLGeiMUJg2P9L+MZKbyBguyoBSLf2wj8GCZzBSDr33r0DVskdAt+xXPAB3dtFQGPezAOhSGVNQtww/hHqS72jlmmB89srWmAsXeSHr25J9WkjLHgAe0FngmZ2bTGdx6Sx2jAj1pU0UZ2p2ZvsIM6bkf9i9IIOhOT9/jRuf9+blcFi+hNNRoaAzmPbsFctDjm8jcAMEKVmouBlc3UMO0AlSBVqV9LZpKwaKWAp3p1fXg5dX5ZieAAr05eyv0Bk0NETa6Fg==
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
CC: "julien@xen.org" <julien@xen.org>,
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c6702cee-9c37-8f0f-77d7-20da718e3e94@suse.com>
Date: Tue, 7 Sep 2021 10:49:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <0e3942a5-9105-c99e-f15e-dcf35aae142a@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0120.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6a9fe48-1b83-4bec-108f-08d971dc6e86
X-MS-TrafficTypeDiagnostic: VE1PR04MB6669:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66692B7B073FD05795F08E91B3D39@VE1PR04MB6669.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GnOff/IUUpeRC0jvHqH3QlMUKu89A+rAXavLqdve8muAYenIFul/ALNCkWEHgLdObZuA0PjY9u27cQqiDKfrbGeP+ZKS6BnBHAO8q5vXIov9z6Opw1BoadxLsJbwNmtb7uLr6EvnxmXUmJ3q2Ftm3u1oQ+ekk9mad8RR27l6P8oU1Fw3XqdB8U0tKE8Sn3t/a2b6UDuNQfhZlqdVhjzLhi26Z42vaziNvtlUt8eKriK37t5r2p7fLx3FRozGN4QarK5urjo5gE8YPE7+tHp2WK/cXEeCyMoCVM/AmrY9LkRK79FJQoryddF59kKzSrom3+sXhERYmjDEbjkCm6KBYlMb79E2x1VlvNNbbA1yHkDjzv37hfACELAM8mPMlW8OXwoP2KSgBfa/T4wZCYtE9wxb2Dxwm288g4MR/7LHGMQdMBCGiygTfDmX/shWiTwqUZ9UBaJyf1ju145SBIajYzK2I2+dUNtz38+mNqcL+06044bHKwfAMV13R/xIao7rjBWLtzw8EbFysjGxTnbAz6epnJHgNzfUpiqtFo4JPoW3wQFgEwprraKRsbQ+31499xfUjpErE76dMBNVYCyxOxz330P59Pn2qHzUs3pBKHcfW6TzUxV8wcxlwRZOX6QYGLjTjmlunQouakKPB/QdXvTCUEOWZSPQ3kI2NyXWBxUUs02dgJfIbJ8c8InWxj8GM720ITbHSHkoGzhZn9SmuhtybKvWI8OgowoxP1GgkareVWe1f5dp+ZezaVfLbRsz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(346002)(136003)(39860400002)(54906003)(110136005)(36756003)(38100700002)(53546011)(8936002)(7416002)(186003)(26005)(66946007)(66476007)(8676002)(2616005)(478600001)(956004)(66556008)(5660300002)(2906002)(4326008)(83380400001)(6486002)(16576012)(31696002)(316002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JJasR3zm8M7Mh6GuhMxIWpP7hL4CS4grKhNx71AcXJMgxezQOePwyM35dU8y?=
 =?us-ascii?Q?Fn5LFobznt4+XmSAavLgr/TncGgq0W28xDSYmqkM7vou03IMEiunZt82x56I?=
 =?us-ascii?Q?xZTDzsz7dY9/UwYjJuo3w45RiYGnvzIUAxc7LiD4XQmKE12Y+MnLOqGnghcQ?=
 =?us-ascii?Q?B7b2qFYZcvbtFXDnOdE2EA3vDbcTO7FieE6Mz2Qh/gDMGBo5YwsuzA0wB2rc?=
 =?us-ascii?Q?vQCwrmwvhmRyz3T8DDAUeP5w6PF7wl3DXooi5ZzbCHydNNCuqzyL4sDe/93j?=
 =?us-ascii?Q?43GFfzBp5sm+5+nvfNv4sDHP9+Ur+34ZbC0lCKLaTxXqcbT+ofnVS6vm6yoU?=
 =?us-ascii?Q?xWP66URUnzs6Wtwg/bcTbyL8WFzfgTiN3s1h8Fm8bqTCVllpxuJgIFqcMY4G?=
 =?us-ascii?Q?KqfBfPCzsWtsE2/yOEqwgHPi4RNNYxxb4t0YE6zu1BIna74GjfrcsHBFfA24?=
 =?us-ascii?Q?NL1hBM3VRbTFVbhdD7paPocTX9Z/pYJ2n4hEVDv0MmYM58NdkiJI2LOHvoZp?=
 =?us-ascii?Q?xiMa2aRCuzAockgGA6gKBXZCyu27RjyeQzCAw5QFvRcdMcbf52QEFL0GOi7p?=
 =?us-ascii?Q?rWRbfN6z1E+LdE2b+vO0c/ojGkLtsAR0g82m4z3h5GoE6OAZRE45hzkEt6jI?=
 =?us-ascii?Q?i8Fyy8rjeMHBG5TySf+wDx92KWRfBiTL9AxleGK/FYSMxLjeTUzP3sxLl5bA?=
 =?us-ascii?Q?EHofjFkmqcIzwJzEtIUazPdnwb8SDD8/PlSRT4MfE8uy0R1owt8h2PDF1TLk?=
 =?us-ascii?Q?9egnKEyEk1vv2EvUWj6Ukg4XkAH4BOusI18sCrkHeBE/RPTAPRqee8YOYTSM?=
 =?us-ascii?Q?ZotSMWl8+fxphaXMLkHp6HFwvoEU+hZXH7BQrXJzb70jKTAXMz1LP8mv91xj?=
 =?us-ascii?Q?F326q6Zhy8VkpPi7qbDTp4GFA2Kbc4Cfl38YYWTNSUVKnqK4dzthkpUrdBed?=
 =?us-ascii?Q?Ekr4EpK1Nhz+lxYmnnYXPQ/Y/agT/riwO99xda8GCKJt6u1V68nJVBOlTLoW?=
 =?us-ascii?Q?dTqBiy6UUHO0tQD4sLoy32TYX2AiEB/1yccUgPC9Vs+u5G5U/Ol7EVBEr77Z?=
 =?us-ascii?Q?tEWc2ny7LQC3SI/OJ0qtrdAZUvEPBYI1loQslZgC5BwVJOxohk/wvbtG5KTO?=
 =?us-ascii?Q?7PKZUZGK5QManJOLxbkd8FJWqLpjrIMS6FHvmH//OpuiBj1oJR7TnKt3D6wT?=
 =?us-ascii?Q?iOmiw9LyQ30Ou8xzxD8Pbx0erg//KtU5CXzVnnWrgSvoPjAN+hW3yRqe1d6x?=
 =?us-ascii?Q?fktusEporvHSbCnw8x0uTXPymY0DMszGjMKRxQcGaLuLsfvmYB/7Nwg8KrM3?=
 =?us-ascii?Q?lGWJbRtOmEdTXWA8JyxbOem0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a9fe48-1b83-4bec-108f-08d971dc6e86
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 08:49:42.1373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUna6nDs2FsHh1Ppp1OZWQNRynqh1YADuz3Iy2JqGbYHxoR7qelKXsdtZ5VBr0o89arxGqWJuKRHOw8xdq3//A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6669

On 07.09.2021 10:18, Oleksandr Andrushchenko wrote:
>=20
> On 07.09.21 11:00, Jan Beulich wrote:
>> On 07.09.2021 09:43, Oleksandr Andrushchenko wrote:
>>> On 06.09.21 17:55, Jan Beulich wrote:
>>>> On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
>>>>> --- a/xen/drivers/vpci/header.c
>>>>> +++ b/xen/drivers/vpci/header.c
>>>>> @@ -811,6 +811,16 @@ int vpci_bar_add_handlers(const struct domain *d=
, struct pci_dev *pdev)
>>>>>            gprintk(XENLOG_ERR,
>>>>>                "%pp: failed to add BAR handlers for dom%d\n", &pdev->=
sbdf,
>>>>>                d->domain_id);
>>>>> +
>>>>> +    /*
>>>>> +     * Reset the command register: it is possible that when passing
>>>>> +     * through a PCI device its memory decoding bits in the command
>>>>> +     * register are already set. Thus, a guest OS may not write to t=
he
>>>>> +     * command register to update memory decoding, so guest mappings
>>>>> +     * (guest's view of the BARs) are left not updated.
>>>>> +     */
>>>>> +    pci_conf_write16(pdev->sbdf, PCI_COMMAND, 0);
>>>> Can you really blindly write 0 here? What about bits that have to be
>>>> under host control, e.g. INTX_DISABLE? I can see that you may want to
>>>> hand off with I/O and memory decoding off and bus mastering disabled,
>>>> but for every other bit (including reserved ones) I'd expect separate
>>>> justification (in the commit message).
>>> According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0" I have at hand,
>>> section "6.2.2 Device Control" says that the reset state of the command
>>> register is typically 0, so this is why I chose to write 0 here, e.g.
>>> make the command register as if it is after the reset.
>>>
>>> With respect to host control: we currently do not really emulate comman=
d
>>> register which probably was ok for x86 PVH Dom0 and this might not be t=
he
>>> case now as we add DomU's. That being said: in my implementation guest =
can
>>> alter command register as it wants without restrictions.
>>> If we see it does need proper emulation then we would need adding that =
as
>>> well (is not part of this series though).
>>>
>>> Meanwhile, I agree that we can only reset IO space, memory space and bu=
s
>>> master bits and leave the rest untouched. But again, without proper com=
mand
>>> register emulation guests can still set what they want.
>> Yes, writes to the register will need emulating for DomU.
>=20
> But then I am wondering to what extent we need to emulate the command
>=20
> register? We have the following bits in the command register:
>=20
> #define=C2=A0 PCI_COMMAND_IO=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 0x1=C2=
=A0=C2=A0=C2=A0 /* Enable response in I/O space */
> #define=C2=A0 PCI_COMMAND_MEMORY=C2=A0=C2=A0=C2=A0 0x2=C2=A0=C2=A0=C2=A0 =
/* Enable response in Memory space */
> #define=C2=A0 PCI_COMMAND_MASTER=C2=A0=C2=A0=C2=A0 0x4=C2=A0=C2=A0=C2=A0 =
/* Enable bus mastering */
> #define=C2=A0 PCI_COMMAND_SPECIAL=C2=A0=C2=A0=C2=A0 0x8=C2=A0=C2=A0=C2=A0=
 /* Enable response to special cycles */
> #define=C2=A0 PCI_COMMAND_INVALIDATE=C2=A0=C2=A0=C2=A0 0x10=C2=A0=C2=A0=
=C2=A0 /* Use memory write and invalidate */
> #define=C2=A0 PCI_COMMAND_VGA_PALETTE 0x20=C2=A0=C2=A0=C2=A0 /* Enable pa=
lette snooping */
> #define=C2=A0 PCI_COMMAND_PARITY=C2=A0=C2=A0=C2=A0 0x40=C2=A0=C2=A0=C2=A0=
 /* Enable parity checking */
> #define=C2=A0 PCI_COMMAND_WAIT =C2=A0=C2=A0=C2=A0 0x80=C2=A0=C2=A0=C2=A0 =
/* Enable address/data stepping */
> #define=C2=A0 PCI_COMMAND_SERR=C2=A0=C2=A0=C2=A0 0x100=C2=A0=C2=A0=C2=A0 =
/* Enable SERR */
> #define=C2=A0 PCI_COMMAND_FAST_BACK=C2=A0=C2=A0=C2=A0 0x200=C2=A0=C2=A0=
=C2=A0 /* Enable back-to-back writes */
> #define=C2=A0 PCI_COMMAND_INTX_DISABLE 0x400 /* INTx Emulation Disable */
>=20
> We want the guest to access directly at least I/O and memory decoding and=
 bus mastering
> bits, but how do we emulate the rest? Do you mean we can match the rest t=
o what host
> uses for the device, like PCI_COMMAND_INTX_DISABLE bit? If so, as per my =
understanding,
> those bits get set/cleared when a device is enabled, e.g. by Linux kernel=
/device driver for example.

I would suggest to take qemu's emulation as a starting point.

> So, if we have a hidden PCI device which can be assigned to a guest and i=
t is literally untouched
> (not enabled in Dom0) then I think there will be no such reference as "ho=
st assigned values" as
> most probably the command register will remain in its after reset state.

What meaning of "hidden" do you imply here? Devices passed to
pci_{hide,ro}_device() may not be assigned to guests ...

For any other meaning of "hidden", even if the device is completely
ignored by Dom0, certain of the properties still cannot be allowed
to be DomU-controlled. (I'm therefore not sure in how far Dom0 can
actually legitimately "ignore" devices. It may decide to not enable
them, but that's not "ignoring".)

Jan


