Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB67403BBA
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 16:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182152.329599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNyqA-0002JV-Go; Wed, 08 Sep 2021 14:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182152.329599; Wed, 08 Sep 2021 14:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNyqA-0002G2-Cf; Wed, 08 Sep 2021 14:46:18 +0000
Received: by outflank-mailman (input) for mailman id 182152;
 Wed, 08 Sep 2021 14:46:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNyq8-0002Fw-3r
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 14:46:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1135ad44-261c-4d06-b578-ad89a789e08f;
 Wed, 08 Sep 2021 14:46:14 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-Tx8vfN78OI-4-bqSio0OXw-1; Wed, 08 Sep 2021 16:46:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 14:46:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 14:46:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.15 via Frontend Transport; Wed, 8 Sep 2021 14:46:08 +0000
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
X-Inumbo-ID: 1135ad44-261c-4d06-b578-ad89a789e08f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631112373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8DtTdJYa/Tw7LBS0jWqH87B2qObWyBGzYqUMWDx7yU=;
	b=n2OPgli/jutmrIBRfTjO+U9OwoOtJNrebfikbZ7+k+h9hznHvL/yPNIOLp7K/323UtTdPK
	sU1wAgI6m4zKS6xuJ2bLTZbCJptFyy2h9vbskm/Tt/wgdUqab/oY4TPiP8ygsd5p9honFT
	mMAHMd9NwlIT8caPEEZjIK/XLWpxBx0=
X-MC-Unique: Tx8vfN78OI-4-bqSio0OXw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oi9fkcmKjaTYTOev3W+Ci6hQscx+v9RBneU5VRSh7WBasEic+TbBUtrfXbidiYC855OHHIxhfY13WCXIHheLJWoXr2cuVU6tHgT2TZ7W2g11cadaZQdsw/39x48+bscrnx1LJTyAYRdauKM+3po1+Mw4pzjvumKnXEy+jh6iINLoCr+j+psd1lF+KzTU/+flBkyoiYxDE2+AkACywqma2NjE2QLyMqZx/bNeQqfx0P0gvX6hYqLhtZtJWeBzWChl1PHcRXZ7cH+zyz8IPp5Z3OygmoO1RpTn81OyWP+prEd1aE3d0V7vkzniZDA5Xlx+YhBXCmiL/zBCeFFDUqb1mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LY85W1wE8icZ5Xp3oQXxJul0FLdst9GEKEWgt33NLQk=;
 b=ZEcav5W7WXlzxenujNzmbDZ9DwplOa1tkrB/Y9NtpSmgZZvofppy6XVe35M4l6Cfv2+QFFhvJN43SY3OpBBo1NKltggHRZRLbNoc+WVs4t0BeopeXjNOkLcXGsv84QHwz9dEs9kKLUNSyw+eQRmGf5yUtuRaRBa7Iv5UDLs1r1LhBtw6AWPPLE3iygbb7fv2ecxrim7yOE875TuoxUUCIRuq1J7IFUjSjcpY+yVUwViLKHnWq8OApjLH148Cf50w5YTZAmJgdgamyhFu6moAwCsCLEHBX3G836Bv7rQX1L3PXpbkzySuy++LH46CtkMImlBI9bWF/tB6UThTDhzzig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
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
 <20210903100831.177748-6-andr2000@gmail.com>
 <1848521d-4179-f5ee-e3af-f4e6738f60e6@suse.com>
 <eda075b5-eafd-2367-2f1e-7f6b9730beb0@epam.com>
 <2e0c2ff5-7228-a439-c8a6-50f7a022e77b@suse.com>
 <24624eca-766d-6841-dc90-43371f5a39ba@epam.com>
 <983f79a9-d72d-0704-9b04-950f858fbd7e@suse.com>
 <be31cb44-fda1-0413-dae9-412affd6e3f7@epam.com>
 <80de7569-522d-656a-e9e2-9e741511963d@suse.com>
 <dafd3135-ca9f-cd4e-c966-eb51c2a6e9e4@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2fd6b81e-e5fc-f6d8-b24f-9fbb1db034d7@suse.com>
Date: Wed, 8 Sep 2021 16:46:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <dafd3135-ca9f-cd4e-c966-eb51c2a6e9e4@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P195CA0024.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c320985-ed5d-416b-b584-08d972d76567
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB736052E3EBA1161240E78653B3D49@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	88id3ZCw1FVGiuxgAA1YIgl9a6CxAoQ69uhX6QUx7cLwjweFw1cP39EPLButsV96xxIL71sa4ParzwTNN/ZxQHpZ74H8mObv+eQCV/WS4X1DlTOTjib0rfny3iNlUUulQMwZf/j9+NtSrK8sdGMszthZmIU7ScmCxZQ5McZUPlGylVWuF36iRUmQpf9dcqS988I3PubJvfU/7OyIKEk4KNjOhbwZqm2UwKVO4pYcIyBk+xdWBFNl+s14PYeoFOwwWgfbAzUecGqKP4MYTR9VsDFycLvr2ZuCCSNb9j8McnMpBdvYamDY8n/RCZehKxcbOyn0cLlXbyXcUkbdQvZK3Y8500e1QndW3YvVml0+DOjEgabnt5+/ebsl2p0Bg+48E4SJOw7DgEsTaKVLuL3QrJER5B8TNmQuBmMRrhbAr1Wfe42SgX0dQQSmU5BuflvxK1i+xNS9NgsnKB9IYIUXGwRedRWftoTuMZVFEctL+a1reaMGTcfxaFIrES2IEUBwyH5YyOp3nXi+ocJpX6bJKbj7pazL/UImWFTKEvkYpQaCk8yoNCuFOKvepzXlNHNGdYyM+Uket93v4/Xkr44ZIGKaHHalvaTgYZ3DZ0W9ephl3/ku55BKFbUV3UD1vAd6EnkU9XR7Di4vWWAcvynfCZqjrCH+Wjy+1FG44E+ePujqCyFp556X30GtpvyxhR0msVaKUJOio0mLhY4bw1QFaZ3tzTZ3/MRvlavvoQ/kZEDcvAgpvOuppz+l/GSAKB0V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(346002)(366004)(136003)(396003)(31696002)(8936002)(53546011)(83380400001)(316002)(110136005)(956004)(54906003)(16576012)(5660300002)(2906002)(6486002)(66476007)(7416002)(66946007)(66556008)(6666004)(31686004)(36756003)(2616005)(26005)(186003)(4326008)(8676002)(86362001)(478600001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U/urUua2N+dzmmhf4WaLOJ3SBm3kk7oPWeJi69yuJ6EGpg0s/vl5Wgu4AAGv?=
 =?us-ascii?Q?9NvwwYjI8OgLaXfSsyuFIbtcqftW0G7luC12YidvYb3NZRMMy7EOJpAbWQmG?=
 =?us-ascii?Q?oRDwUCmR1zhNLuKCp6jJCzbhhK+UJja6QWA1lD6UQngSswkv+V7Z2lCwojAH?=
 =?us-ascii?Q?pcCn2TxGPi7P64pSqrFS4RlF+ePyL2uI0NUzILA7Bk1+mUWBUkERgoI6S256?=
 =?us-ascii?Q?dkAjyxhQvJ5O8qH6Gkgw9qXUsv0k0CaMKjitTAeGciTKFx03pOOb7BYaWHNY?=
 =?us-ascii?Q?fTPV4rwEozUGquoetFjOsZYp0hDBQRg0BEjrDQ4rqFWleQuht5YF4IeF+JkU?=
 =?us-ascii?Q?UIeEstIjjZaBtmpUnUcWqTtTJG5HbWyF/62IDyRo7JgpaEZPfgaM/f7WsS2Z?=
 =?us-ascii?Q?Zay9CjHtPiVMqeEBW69y6iXr/SUoi0cBNwUNBC2AXnYqWGW0IdSqiBBlhsmT?=
 =?us-ascii?Q?i6mfbm8ov2tnWtcCefvnnyGUwuz3IWGe6RxvtD82bu8Klbw2mlu1vpzPZjyy?=
 =?us-ascii?Q?E+KMhN+YGY+FtPRzZrkNegmDVAwtRyYvHX7U4rTSzOGmY01rS4T2pB9Soz4P?=
 =?us-ascii?Q?DkoalZd972C/a1Q3LmH8hJAdxCqQm2eVd+1PgUSuBYMF9WxuHqKng3COC73c?=
 =?us-ascii?Q?UIHaih+vofTiGuId3c4y/nTY5gJU12JeRh4FhPRsB84QWtFZLLpdYVo49WEG?=
 =?us-ascii?Q?GA2dY2JnT5MoAQcW30s5lATbwhFi/A5MYzyxWM/884RKSxDZp7Ra3iRNpfEB?=
 =?us-ascii?Q?GyoZ+pEKHS5eeOUcrf2I06Ix97Ram4E2fgPOwb0EkRUXo6yfdt/7NVN8khfc?=
 =?us-ascii?Q?wTw5EdkmuxKTA7ul9eVHXBPtdtQGW80nLYjyjfSzV2iLPU2aqmHSe2OKPynb?=
 =?us-ascii?Q?jFTZkB9AIfxLm7vmcvaXG0PIRJHYi10bGyjKrrYTNqk2SF4Jmr/W3ciUa6fX?=
 =?us-ascii?Q?Zpey03AMNlTGJehJ6lIFzKRX4YRWEmPhfeP6Te7P3mKrvbWypUzcL/ejEM1h?=
 =?us-ascii?Q?ABUYYeKewptj9guPVW/OjuUKjxfmtePrJDJZt05C7bt5gOwQJBYQFIMRbmxi?=
 =?us-ascii?Q?7X8NbSpl7yzZGYvuJJIoD+dQEjx65EFUBb3Kz2mzxzkr1ujdi9hiajwTIJKW?=
 =?us-ascii?Q?JF/UK+FdhcFgTtJRpymWLT07JkFDoiXerxyzOmf0F+75dZEEQMyGKrVcUwYr?=
 =?us-ascii?Q?TFkQubJCWKNgH2frPpyBIHAoFwGG8vCSEvKfPBRCiRbiFBWNeqJdARROVnNB?=
 =?us-ascii?Q?jAe0/54ujJvznxKlG90SoKZ1PUbnem36ETqmCk5EgHPVJ2HuImqTc0kakay/?=
 =?us-ascii?Q?tAOE6iQWXUT4fngGPQxo44T/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c320985-ed5d-416b-b584-08d972d76567
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 14:46:09.5825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YiIAW1CJ5A6Oj+WAVT8dQOA3dGba7XoybLublHNN52+MkaotUM4BPNwfDJs3e+OmOdLEjTsgeCAKemdwSfnLmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 08.09.2021 15:33, Oleksandr Andrushchenko wrote:
>=20
> On 08.09.21 13:03, Jan Beulich wrote:
>> On 08.09.2021 11:43, Oleksandr Andrushchenko wrote:
>>> On 08.09.21 12:27, Jan Beulich wrote:
>>>> On 07.09.2021 19:39, Oleksandr Andrushchenko wrote:
>>>>> On 07.09.21 19:30, Jan Beulich wrote:
>>>>>> On 07.09.2021 15:33, Oleksandr Andrushchenko wrote:
>>>>>>> On 06.09.21 17:31, Jan Beulich wrote:
>>>>>>>> On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
>>>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>>>> @@ -400,12 +400,72 @@ static void bar_write(const struct pci_dev =
*pdev, unsigned int reg,
>>>>>>>>>      static void guest_bar_write(const struct pci_dev *pdev, unsi=
gned int reg,
>>>>>>>>>                                  uint32_t val, void *data)
>>>>>>>>>      {
>>>>>>>>> +    struct vpci_bar *bar =3D data;
>>>>>>>>> +    bool hi =3D false;
>>>>>>>>> +
>>>>>>>>> +    if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
>>>>>>>>> +    {
>>>>>>>>> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
>>>>>>>>> +        bar--;
>>>>>>>>> +        hi =3D true;
>>>>>>>>> +    }
>>>>>>>>> +    else
>>>>>>>>> +        val &=3D PCI_BASE_ADDRESS_MEM_MASK;
>>>>>>>>> +    bar->guest_addr &=3D ~(0xffffffffull << (hi ? 32 : 0));
>>>>>>>>> +    bar->guest_addr |=3D (uint64_t)val << (hi ? 32 : 0);
>>>>>>>> What you store here is not the address that's going to be used,
>>>>>>>>      as
>>>>>>>> you don't mask off the low bits (to account for the BAR's size).
>>>>>>>> When a BAR gets written with all ones, all writable bits get these
>>>>>>>> ones stored. The address of the BAR, aiui, really changes to
>>>>>>>> (typically) close below 4Gb (in the case of a 32-bit BAR), which
>>>>>>>> is why memory / I/O decoding should be off while sizing BARs.
>>>>>>>> Therefore you shouldn't look for the specific "all writable bits
>>>>>>>> are ones" pattern (or worse, as you presently do, the "all bits
>>>>>>>> outside of the type specifier are ones" one) on the read path.
>>>>>>>> Instead mask the value appropriately here, and simply return back
>>>>>>>> the stored value from the read path.
>>> But in case of BAR sizing I need to actually return BAR size.
>>> So, the comparison is the way to tell if the guest wants to read
>>> actual (configured) BAR value or it tries to determine BAR's size.
>>> This is why I compare and use the result as the answer to what needs
>>> to be supplied to the guest. So, if I don't compare with 0xffffffff for=
 the
>>> hi part and 0xfffffff0 for the low then how do I know when to return
>>> configured BAR or return the size?
>> Well, but that's the common misunderstanding that I've been trying
>> to point out: There's no difference between these two forms of
>> reads. The BARs are simply registers with some r/o bits. There's
>> no hidden 2nd register recording what was last written. When you
>> write 0xffffffff, all you do is set all writable bits to 1. When
>> you read back from the register, you will find all r/o bits
>> unchanged (which in particular means all lower address bits are
>> zero, thus allowing you to determine the size).
>>
>> When the spec says to write 0xffffffff for sizing purposes, OSes
>> should follow that, yes. This doesn't preclude them to use other
>> forms of writes for whichever purpose. Hence you do not want to
>> special case sizing, but instead you want to emulate correctly
>> all forms of writes, including subsequent reads to uniformly
>> return the intended / expected values.
>>
>> Just to give an example (perhaps a little contrived): To size a
>> 64-bit BAR, in principle you'd first need to write 0xffffffff to
>> both halves. But there's nothing wrong with doing this in a
>> different order: Act on the low half alone first, and then act
>> on the high half. The acting on the high half could even be
>> skipped if the low half sizing produced at least bit 31 set. Now
>> if you were to special case seeing ffffffff:fffffff? as the
>> last written pair of values, you'd break that (imo legitimate)
>> alternative process of sizing.
>=20
> How about:

Yes, that's what I was after. Just one nit right away:

> static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 uint32_t val, void *data)
> {
>  =C2=A0=C2=A0=C2=A0 struct vpci_bar *bar =3D data;
>  =C2=A0=C2=A0=C2=A0 bool hi =3D false;
>=20
>  =C2=A0=C2=A0=C2=A0 if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
>  =C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(reg > PCI_BASE_ADDRESS=
_0);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bar--;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hi =3D true;
>  =C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0=C2=A0 else
>  =C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D PCI_BASE_ADDRESS_MEM=
_MASK;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D bar->type =3D=3D VPC=
I_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : PCI_BASE_ADDRESS_MEM_TYPE_64;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D bar->prefetchable ? =
PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
>  =C2=A0=C2=A0=C2=A0 }
>=20
>  =C2=A0=C2=A0=C2=A0 bar->guest_addr &=3D ~(0xffffffffull << (hi ? 32 : 0)=
);
>  =C2=A0=C2=A0=C2=A0 bar->guest_addr |=3D (uint64_t)val << (hi ? 32 : 0);
>=20
>  =C2=A0=C2=A0=C2=A0 bar->guest_addr &=3D ~(bar->size - 1) | ~PCI_BASE_ADD=
RESS_MEM_MASK;
> }
>=20
> static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int r=
eg,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *data)
> {
>  =C2=A0=C2=A0=C2=A0 struct vpci_bar *bar =3D data;

const please.

Jan


