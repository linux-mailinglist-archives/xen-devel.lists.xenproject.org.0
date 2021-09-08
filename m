Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D5E4036DC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:27:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181582.328756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNtrM-0003Wf-Pz; Wed, 08 Sep 2021 09:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181582.328756; Wed, 08 Sep 2021 09:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNtrM-0003TE-Mr; Wed, 08 Sep 2021 09:27:12 +0000
Received: by outflank-mailman (input) for mailman id 181582;
 Wed, 08 Sep 2021 09:27:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNtrL-0003T7-9N
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:27:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f08a8b74-1086-11ec-b148-12813bfff9fa;
 Wed, 08 Sep 2021 09:27:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-t_TL7G9YOfGi_mOJw49UfQ-1; Wed, 08 Sep 2021 11:27:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5471.eurprd04.prod.outlook.com (2603:10a6:803:d0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 09:27:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 09:27:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0259.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 09:27:05 +0000
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
X-Inumbo-ID: f08a8b74-1086-11ec-b148-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631093228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BGsWH3DlKX8CGcHvdtIStd5DnQ/LPtxITcKt1B0HTMw=;
	b=i7FHzqfAHQEIfoFXdYBq0l4Cwrd4LBe2MCW12YGzGRZzSYTOQLuhK62fEsqLMmU4V9fDys
	F//5NqIM65+QlR5hDqa1agQDbct6/7ja1n/GE7MxblI/VppT32Jy8ZnscI8wcDPUWy4XgN
	PeV17OytrqzsKv5OcPQyjEv6Alo5VOI=
X-MC-Unique: t_TL7G9YOfGi_mOJw49UfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTf+i/a8bwz3ctpaateDObBE9D3gnoJA9W+tUTXWQZ5nU6jQXZ/VfDGrZ60RAFZGkOTH3/P+rzg36rmjK5e/B5RmXUw/PB8FFPelt/4OSccTINKHs3beoWm2hdCz03g3a3oeMg1erZNRefbWiGzHDbIm6VB4fiVpCrraUmPxvEFVDylnW+5/eLja0kz9d0WU3VNtntGXq9kyd4LKcJ/0URiCAuHbkT72/EsThLG3CaDnGwyaFusFgO0Ena9wifon3oHIjee0NQ9jq3uNsuS0r6ConH0kjBGwxb3ejqVdwKl8eG85SQeJImfD1qz0Pg8gp7+XNpR0L7U+GrhAInddWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1zhjAwC6vyGmgkrRKbJ1KOOZfLGy0u9qqYmJFK21YRk=;
 b=cKk4nP7hC3JDOfIL0dBMkjY9dd/xkC+L6gFX7M4sGsZIm/31ozwgW96HpbLopXcAZPKddY9xTZDGc70d1Rqg/G7Xl/2cFjudq5zKzG4636mEDo+97qB8OhBhcSyIs+VfajAkxGEZpk4YJP1owC5meNcdiPJpSzgzGjC6JImPHIW6PBfOf+MqyYK/33sm5AjoeHJ3PwUbh2LAnJ5bud6DVJ7YEWYRlMFby1076imZhQf8mJWAPoCTvoCt9u7uQYO23NoKsSV3LS6jxzTb/kF4rXjAkVtpjHyIfRlvPdP9s37TY6YBDy+sayXMigPEbOe/KPS4tCmNaiHgGmkJwhO/Fg==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <983f79a9-d72d-0704-9b04-950f858fbd7e@suse.com>
Date: Wed, 8 Sep 2021 11:27:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <24624eca-766d-6841-dc90-43371f5a39ba@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0259.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::31)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 700032e4-a12a-479a-facc-08d972aad2ce
X-MS-TrafficTypeDiagnostic: VI1PR04MB5471:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5471D5F931ABD6189A3F010FB3D49@VI1PR04MB5471.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FGDjygKQMoUD429p3r+tWx84GNwJVZGnnN9bZbHt8hJ+UtZS2x+9ql4wZ5zS5KqYoE6E8Aad22cTxsaylR20FI7e4/BAZmbKqtBxu+/k1qZBQeYqRgvShrC80FCAOSZQIHX1H6PDoazwUPw8tSBheH3dDzipjhGfCWneMUlfsHkS0mfXZp2ic1RSy+wtTtOs/m+7FgGrgYmo5UTgyncE6I491CbbgI2x5Mx7JirC4ZeF3Ojbeq537VQFq3tjzP02m1BflREM6ndQepes43vL54o0awoPwTMBszJj/bXaZl53Tw4UBanwduEOAnjDz0T9pGLrMcmMdK0cf6fWVyCaDB5bsRhzcCYY9dXHCd9LLzsz6C1q7IfOCBOaoEnlV5hnqYPUxFRNfk4Vsudv3bCG+eQ3M+b33tI9Oc+PDF8YMA65xpmu8eMXUJSmC4N70WaSQ/FIdqI9IebmRgmOKDgRvuEWtGRgGpcEmsRtaZMVvSAW8LwH9GYyZ2pigWOl+boLfI1oYh+jquSWRHKw/KDVKvoULA6X2enpd5HNSOp04TIwdNBw2mfEL5cxLC60m5FxBO9SGmxtecFA2BzEIiKIZTXi1p1jdBnUjKnJw3hA23UAbvsD9oxWXaQDeA7n738cyEpM5xnw0vauAVf4r9R2IW4BvDtvH3KLaMbUWTsdnOKW+B8LPz963bBrk+oYo+HzTnNGB+92Epne71l9o3s4k7UznFsEP1WnIF36pLcw9Pd1htX+rG6jwX/3C5tI4Fep
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(39860400002)(346002)(396003)(366004)(53546011)(16576012)(2906002)(186003)(36756003)(66556008)(66946007)(26005)(31696002)(4326008)(54906003)(478600001)(316002)(86362001)(2616005)(8676002)(956004)(8936002)(5660300002)(31686004)(110136005)(38100700002)(6486002)(66476007)(83380400001)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9pFIHmupBTgZQnJNxGolZZGpQLRTZ5wSh9KSvGK0/QZvgopmAjWp6vT3mypH?=
 =?us-ascii?Q?3Ua+TK298yxLL2qm/lfM9eWkG0RoGeip6uLowgtWxJvxd2Ci6pl+Lsxv9GXB?=
 =?us-ascii?Q?b47lpZ8Bv2pI38o0TNLJIPxIDnRGAU/APH9YArpIKJriRdLnFhouo8BJYf0C?=
 =?us-ascii?Q?KFxwGOzSfyBbRHZMPVXI8tTb0Zn1F8ExTB8otUHh8E/oRFYue4SzylohZdSl?=
 =?us-ascii?Q?WPA9GeO+OaG4Sm3ir6XIRi9T6ajW2jrseihcxTonvhi8/PP+5QfKjstNcM4s?=
 =?us-ascii?Q?dlUMSQPy20y3w2BT/LWgq6We40g+qMFoWsMBGd1XMQdPXKZ4MuUWInf2MWqt?=
 =?us-ascii?Q?pcby/meM7PNmjAzraJexvJfOyqgHMqHuNruAjkE1f2VPdhj56lKijQXcDuRY?=
 =?us-ascii?Q?7UccfD7ViqqMVzdBeYJE/QS+MEOcYw9Kt6fkOPesEKi7IeMDC30N5OdtMBVQ?=
 =?us-ascii?Q?QKdiUWKLGUzPdqZQ8uROHVKUOsWVRaj12Kvw4cL8fCIpF7/zX3PtEWYn6Vsd?=
 =?us-ascii?Q?GMYuDwsqge7NoGHCRowCqLUiUgZi0Omh0ubiEOZyWrQxYxvkpRb5oVXySh7U?=
 =?us-ascii?Q?4XPLacWCviF0WfEx8VdYiBmF6NY5IkYhuvVRWmKMwpcpccuB+Fkf2ScYZGnz?=
 =?us-ascii?Q?AZ2umt7VaOelZyLZqjUO6GuKcek5sZZ2jZoLSrEoBByI16Zs0kxUyo7R6ND7?=
 =?us-ascii?Q?Q91rRcK5XED/4wIfEE4n8clOuSbmA8Xd4MX4HuXAS/Yi5CECxlqkxv25GlAZ?=
 =?us-ascii?Q?BKQBkrKAPMmwoiNPXIe7/mctbHMPaYXx10LmQqllbM7TcOjPzS5cWCGnP0Cd?=
 =?us-ascii?Q?hsFk0MKryEOLSm43wXXKfPSpiTCZdvqnhmP0x6tVqEe5+7W+C11q8sZiOwDH?=
 =?us-ascii?Q?2QtfOsscER0QNoiBOv5iPuE4ShMixA2UeHbstW7v7rcEPuF0Bg3lMvmXWAol?=
 =?us-ascii?Q?XZ0NoAoQgKZV3vgL4W93QQuO42FK0mrMW8ennwfaig5KBsr8J+wOK1QzXsWO?=
 =?us-ascii?Q?Y6+syZuVp2xKbWNHWPMkImKniifXYXktJGmee0nqC0RbjwHofukxp48n3CcV?=
 =?us-ascii?Q?mSMIFQxspYzekadPEbx9aQqtlov1DEZGmdqxfeo8laLw6/LjrDsNlp2dAl0g?=
 =?us-ascii?Q?7a1WfNCXaAwxgRKLmVfWUFCOQQRkvErgOsOi9MRztEiSkbUNpG+gPRvWiCoB?=
 =?us-ascii?Q?0uDW0LtPTEfVzBeoIG7gSj97J7XEHM7OGGJ5uZgJnH5gdZPM2M8Smp/P2CJU?=
 =?us-ascii?Q?eqYhqZz6x6sL5BCIiZ3pNhTpf0h7GKCA/rINuB4QUy5zgdnCYdR6dDHY2Vpr?=
 =?us-ascii?Q?CZnk/BJILLQmoK7vBSZK27HP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 700032e4-a12a-479a-facc-08d972aad2ce
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 09:27:05.7841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+Pebd6H3BP+bhhMcrV4OxuHtCxL6f2eEOD9d5ySi29qntH8LYtTfae8UnIz7OjUdVWhymzMFJ/pvO3N3QXPiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5471

On 07.09.2021 19:39, Oleksandr Andrushchenko wrote:
> On 07.09.21 19:30, Jan Beulich wrote:
>> On 07.09.2021 15:33, Oleksandr Andrushchenko wrote:
>>> On 06.09.21 17:31, Jan Beulich wrote:
>>>> On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
>>>>> --- a/xen/drivers/vpci/header.c
>>>>> +++ b/xen/drivers/vpci/header.c
>>>>> @@ -400,12 +400,72 @@ static void bar_write(const struct pci_dev *pde=
v, unsigned int reg,
>>>>>    static void guest_bar_write(const struct pci_dev *pdev, unsigned i=
nt reg,
>>>>>                                uint32_t val, void *data)
>>>>>    {
>>>>> +    struct vpci_bar *bar =3D data;
>>>>> +    bool hi =3D false;
>>>>> +
>>>>> +    if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
>>>>> +    {
>>>>> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
>>>>> +        bar--;
>>>>> +        hi =3D true;
>>>>> +    }
>>>>> +    else
>>>>> +        val &=3D PCI_BASE_ADDRESS_MEM_MASK;
>>>>> +    bar->guest_addr &=3D ~(0xffffffffull << (hi ? 32 : 0));
>>>>> +    bar->guest_addr |=3D (uint64_t)val << (hi ? 32 : 0);
>>>> What you store here is not the address that's going to be used,
>>>>    as
>>>> you don't mask off the low bits (to account for the BAR's size).
>>>> When a BAR gets written with all ones, all writable bits get these
>>>> ones stored. The address of the BAR, aiui, really changes to
>>>> (typically) close below 4Gb (in the case of a 32-bit BAR), which
>>>> is why memory / I/O decoding should be off while sizing BARs.
>>>> Therefore you shouldn't look for the specific "all writable bits
>>>> are ones" pattern (or worse, as you presently do, the "all bits
>>>> outside of the type specifier are ones" one) on the read path.
>>>> Instead mask the value appropriately here, and simply return back
>>>> the stored value from the read path.
>>> "PCI LOCAL BUS SPECIFICATION, REV. 3.0", "IMPLEMENTATION NOTE
>>>
>>> Sizing a 32-bit Base Address Register Example" says, that
>>>
>>> "Software saves the original value of the Base Address register, writes
>>> 0 FFFF FFFFh to the register, then reads it back."
>>>
>>> The same applies for 64-bit BARs. So what's wrong if I try to catch suc=
h
>>> a write when a guest tries to size the BAR? The only difference is that
>>> I compare as
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( (val & PCI_BASE_ADDRE=
SS_MEM_MASK_32) =3D=3D PCI_BASE_ADDRESS_MEM_MASK_32 )
>>> which is because val in the question has lower bits cleared.
>> Because while this matches what the spec says, it's not enough to
>> match how hardware behaves.
> But we should implement as the spec says, not like buggy hardware behaves

The behavior I'm describing doesn't violate the spec. There merely is
more to it than what the spec says, or one might also view it the way
that the spec doesn't use the best way of expressing things.

>>   Yet you want to mimic hardware behavior
>> as closely as possible here. There is (iirc) at least one other
>> place in the source tree were we had to adjust a similar initial
>> implementation to be closer to one expected by guests,
>=20
> Could you please point me to that code so I can consult and possibly
> re-use the approach?

I only recall the fact; this might have been hvmloader, vpci, or yet
somewhere else. I'm sorry.

>>>>> @@ -522,6 +582,13 @@ static int add_bar_handlers(struct pci_dev *pdev=
, bool is_hwdom)
>>>>>                if ( rc )
>>>>>                    return rc;
>>>>>            }
>>>>> +        /*
>>>>> +         * It is neither safe nor secure to initialize guest's view =
of the BARs
>>>>> +         * with real values which are used by the hardware domain, s=
o assign
>>>>> +         * all zeros to guest's view of the BARs, so the guest can p=
erform
>>>>> +         * proper PCI device enumeration and assign BARs on its own.
>>>>> +         */
>>>>> +        bars[i].guest_addr =3D 0;
>>>> I'm afraid I don't understand the comment: Without memory decoding
>>>> enabled, the BARs are simple registers (with a few r/o bits).
>>> My first implementation was that bar->guest_addr was initialized with
>>> the value of bar->addr (physical BAR value), but talking on IRC with
>>> Roger he suggested that this might be a security issue to let guest
>>> a hint about physical values, so then I changed the assignment to be 0.
>> Well, yes, that's certainly correct. It's perhaps too unobvious to me
>> why one may want to use the host value here in the first place. It
>> simply has no meaning here.
> Do you want me to remove the comment?

Yes. I wonder whether the assignment is necessary in the first place:
I'd somehow expect the structure to come from xzalloc(). Albeit I
guess this function can be run through more than once without freeing
the structure and then allocating is anew?

Jan


