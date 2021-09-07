Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37555402CE2
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 18:32:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181221.328282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNdzw-0005JP-IF; Tue, 07 Sep 2021 16:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181221.328282; Tue, 07 Sep 2021 16:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNdzw-0005HP-Ek; Tue, 07 Sep 2021 16:31:00 +0000
Received: by outflank-mailman (input) for mailman id 181221;
 Tue, 07 Sep 2021 16:30:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNdzv-0005HJ-2T
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 16:30:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa587f1e-0ff8-11ec-b112-12813bfff9fa;
 Tue, 07 Sep 2021 16:30:57 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2057.outbound.protection.outlook.com [104.47.10.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-xzGIXKmmPOWIzO3Ef1a4fQ-1; Tue, 07 Sep 2021 18:30:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 16:30:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 16:30:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0024.eurprd09.prod.outlook.com (2603:10a6:101:16::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 16:30:52 +0000
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
X-Inumbo-ID: fa587f1e-0ff8-11ec-b112-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631032256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aH3OuqSwJzb+8ZU3KTnwJsKyxX6bcxjI+WZ19P4EHUY=;
	b=jBB5J3VIGAxV3Njdha9p/JEV6kiYzbLQb580lnYG1SSkk4+nXs46EmLDQr4Qz9IrnaYbPg
	mIuaLG+S81GQ8PjwCA5nj4Vo3sdUCjRPhmiMaM01PfFcYSzSU9zFtB7zq/aLw8mW3S6qax
	kwuxw89Cw4yUWmmq3uXA8Sh0WhwIIT0=
X-MC-Unique: xzGIXKmmPOWIzO3Ef1a4fQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjO9pJob/cDyZZx2niWHexw75N8srREp7wcjiaC6YJN3hqv6+IKGBy5w56amWYyPA/f5W+zQdB+ykd5UObIx62+fpVw9W4UEPRLbj7AvU/pKuL8xmloUI+9zIzWxNys2Jwpky+PGX2APMsnisnibmGytdadcwi7gKWGDsNiMR3gEX71j8W/9cXF4bMrJetTVGm4dWLA0p0hgRP6oOkQjJo9MPcT2E4wI/e9dUre/8ZNz8SixX8aFwuTdHURd42MK/uZ860tOpTs3Pwn1sYbV41nQ1/j932wv91atoScseE4rTze4qVo2uKWQfAat92/kQcnQXsdM14jSRltJUsOXxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=aci6m3pjwbaz5O1KJStmBiwl09NYg9Epzo3SDRuPRc0=;
 b=GzohOCJce+guttojPssOmQoSdKjE6SgftLQQ2pOBCw74eyOVAbDlIwxD4JRNK2A3csjf8zcYbSlp84pSAGeSzSTwRu1vjy9glEM6UGfR5SSwU61bWilHLVQZN10ShwZuBOySZXN5tLDrxeG4DJjDaIYvk3VUeF3ifpNFmkjMKQPVskNzlpAqbVxdmwsasc0wSu3mOMyw/hr+F4vJWht3Z5PHAKdLthkWGsACpx5MK7LYvOYw5pinyINtn6g8IVg6VuSGEiX6a3C1/5XY4WJRwloGGtTutwMgDSfBTCXNL00OmSvLt9olKThUbjVixHNlomDJe8gL2CyvriN6Os0bAg==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2e0c2ff5-7228-a439-c8a6-50f7a022e77b@suse.com>
Date: Tue, 7 Sep 2021 18:30:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <eda075b5-eafd-2367-2f1e-7f6b9730beb0@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR2PR09CA0024.eurprd09.prod.outlook.com
 (2603:10a6:101:16::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93f00116-d657-4b80-1b97-08d9721cdca3
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2333782CC72C9E1E0E2ED536B3D39@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jVTVDauqvRrfUM0HTpofQdmj/lYdS+QszUt1QBpjfrmKBLd4LLyvvCkuQIfyK2/n/G31KUrN3fsGCMYLXX4+3Fz6Hhjt25QmF/cXh/ePffuXdPhrjLMK5rNY98oIWfJjIR4ftJ//koE9RfiW8nGFaixot2mkLkRe2G1irGB8hCjUxAoxLfco8fTAXWZqNF5Y+PIPCTl+i71Z6x/ODQk5x6R+V9c2kORmYoIvB+DKEp8jCgJcyk7pQtH+X7XYKp+p0OKmcAPHpVA8MstvoM8Rg9lL6Mbnryq5m7oHJ4414wrO/hIUSBpXDAtKo9Fq6/jiPeMqsXMBwYr2ecRsAsvTppyxnP/bDxX4WjfnPYscHjECsJdQnpMJW9MeKwyG/xLy8svcKxXKtX9nOQbeJn5rt0pESuC+ldUNo82Gq86KPzOKBmC6j/6R1ZNneCtY9oMYmIlt0iZOZAgVhePRcu/9dvBsQ2P3wVgj/F1SkOXRa8XChTMR6R9Qp2ruOl+cHPEkr3slE/napYV/5ROEDNfuAbPe3mk39IeV1bizZa+SF06sHbKHXuxkhAteLzz+3CCG+mluGUpNOJPjvdnStYIdP8pTcDD06SGLhG9JhcHTlEsRAcl8noypRmdhKrHlatc+u+3aUhMKiu0AY5TvBXfdYvsP3QHUGgJNfcfiK/sCg1RNHmNbpRtopKGZXiHyuzDO/pInAWwo+N3p9zlFqM5fCylx8AFU/kkHEwCfxYrTCjtBBvqhjYVnptD9ceX8q8Kz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39860400002)(376002)(396003)(366004)(38100700002)(8936002)(54906003)(110136005)(478600001)(8676002)(53546011)(2906002)(26005)(31686004)(7416002)(31696002)(86362001)(36756003)(66946007)(66556008)(66476007)(2616005)(83380400001)(956004)(4326008)(5660300002)(6486002)(16576012)(186003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EGzw3YmtUrxGtDEMC9ih/8Uc2Sv3ptGg5W+h0HpEvUYAE0jIr6DV9oPLcI5q?=
 =?us-ascii?Q?lPjmfGYRF+iEpD1PS21EqZpe8l7UqZs1aV4RRxBatFZi5OQ5w1v7gvvPd4y8?=
 =?us-ascii?Q?tKBy7g1pXqRoBOM456y/XUtNI5fr/QHjFMwert7GjFXU5MCMCxTTLQJ0ynTe?=
 =?us-ascii?Q?SlapRhkxiaWEKJ+ZNyOex8zguDtActtT6rKpeyfIjqL4zjbGf8B9pQffJRgy?=
 =?us-ascii?Q?WsPdHTl3IjGBq+03hiD0rqO8G2KOdJq5m3/rmYK/yXKnoSVnqQhJ/LhNICeH?=
 =?us-ascii?Q?DL82b9hxydJhbkHD8YpVabiQNfc3Yk1E4tcflTrL5Hpv6EeSy2355GoG4mJ9?=
 =?us-ascii?Q?GC3+0ZdizbJYfEbqt9GXwyVgXzXWGAlEX43TuEXZ4G5prkLwi8yhQrlvVfe5?=
 =?us-ascii?Q?cXgE379pvtWG2RIPu89MuAjwdIqfHf+QbgIBat6RuxXz1AVDEWJRGy6LFOdS?=
 =?us-ascii?Q?bGSK+djH51kg5kEBeL6kXGFgOleO1k5cF7PzbwQf0CVXEDOvHArR76IA1cN6?=
 =?us-ascii?Q?VEZvgrlFA7aBsjlqf/cJLhsqweSkQ4XICSYfj3Sftg0N2xjWOvqlPBMYHsnL?=
 =?us-ascii?Q?L/8DUNqXVroVJU+2tv5T00lqYw9piR6gAoeMuAkpoBoHEP8AOrsOFZaWESau?=
 =?us-ascii?Q?r8tEguD9pLreTNFsq7vIejc2Q1wlVDARPpdfTEAJGwgzXAQ98r2h9swMpm10?=
 =?us-ascii?Q?mNOup8nrf3MZBCNCNRC5Pcmapa727QnEhxeTPoFClJlQ0PFiEiIpC1M6WnYJ?=
 =?us-ascii?Q?OHj4ssCZ5aEX1d1peuXA4IaZ4aPGlexe3dEE6TnSlliRwSq/bJigckfnAoyZ?=
 =?us-ascii?Q?ysz0hoKHJii+8NzgOsOXJMAG5Ht9TmDJqcGV8Cmi7ROD5f1YpMKNBeXaENRc?=
 =?us-ascii?Q?Xytt2x/cNYSuFV8YnACnCiQatiGNZe1FJpaWGIBDvle87CleDqG2XNvrsDbN?=
 =?us-ascii?Q?KkEwQt9BFlRF2RjzBPXjqPOa4ChlZOfr4VIAwr/WP6nH0hi7OpCIa6rDJgUU?=
 =?us-ascii?Q?TpWahRSYMdLm9cFOx/xRqHUmk4uL0KEGCxH6XIXTM+Cbx/FIaU9WjXfxUvD1?=
 =?us-ascii?Q?WGGA8Xp7w+Ln6i4u6hUbTKsif4Y13owDxPl68tbvy6l4X9vxCGg5Gbx+WwKg?=
 =?us-ascii?Q?75h5YqkThz1+khmvpeOT1r1kHwDwrJ/6xdC2OTFXguxrDXHpQhXmwLTfWkWJ?=
 =?us-ascii?Q?XwVI1CPiD2SG/gdljcbMylJU/vD9l1oy/oOq9EUhEXEWXqC95RZkc9aKD5NX?=
 =?us-ascii?Q?tKG7uEoKUvkckRp3mWwvs2sp96CTJBs7ck77PEnUIV97WSGPwy3t3CjwI3aG?=
 =?us-ascii?Q?cp+FcWCR8OSYFKVJtrBQtePV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f00116-d657-4b80-1b97-08d9721cdca3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 16:30:53.7082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ekXdIyJsPFy2+2hcjoAmYOeIZzl+PKvQ5EM6ZlcN08Rj7JzcEA0TJ1/PcX7C5eDRg4qLviMtPcDyVDedVHw7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

On 07.09.2021 15:33, Oleksandr Andrushchenko wrote:
> On 06.09.21 17:31, Jan Beulich wrote:
>> On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -400,12 +400,72 @@ static void bar_write(const struct pci_dev *pdev,=
 unsigned int reg,
>>>   static void guest_bar_write(const struct pci_dev *pdev, unsigned int =
reg,
>>>                               uint32_t val, void *data)
>>>   {
>>> +    struct vpci_bar *bar =3D data;
>>> +    bool hi =3D false;
>>> +
>>> +    if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
>>> +    {
>>> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
>>> +        bar--;
>>> +        hi =3D true;
>>> +    }
>>> +    else
>>> +        val &=3D PCI_BASE_ADDRESS_MEM_MASK;
>>> +    bar->guest_addr &=3D ~(0xffffffffull << (hi ? 32 : 0));
>>> +    bar->guest_addr |=3D (uint64_t)val << (hi ? 32 : 0);
>> What you store here is not the address that's going to be used,
>=20
> bar->guest_addr is never used directly to be reported to a guest.

And this is what I question, as an approach. Your model _may_ work,
but its needlessly deviating from how people like me would expect
this to work. And if it's intended to be this way, how would I
have known?

> It is always used as an initial value which is then modified to reflect
> lower bits, e.g. BAR type and if prefetchable, so I think this is perfect=
ly
> fine to have it this way.

And it is also perfectly fine to store the value to be handed
back to guests on the next read. Keeps the read path simple,
which I think can be assumed to be taken more frequently than
the write one. Plus stored values reflect reality.

Plus - if what you say was really the case, why do you mask off
PCI_BASE_ADDRESS_MEM_MASK here? You should then simply store
the written value and do _all_ the processing in the read path.
No point having partial logic in two places.

>>   as
>> you don't mask off the low bits (to account for the BAR's size).
>> When a BAR gets written with all ones, all writable bits get these
>> ones stored. The address of the BAR, aiui, really changes to
>> (typically) close below 4Gb (in the case of a 32-bit BAR), which
>> is why memory / I/O decoding should be off while sizing BARs.
>> Therefore you shouldn't look for the specific "all writable bits
>> are ones" pattern (or worse, as you presently do, the "all bits
>> outside of the type specifier are ones" one) on the read path.
>> Instead mask the value appropriately here, and simply return back
>> the stored value from the read path.
> "PCI LOCAL BUS SPECIFICATION, REV. 3.0", "IMPLEMENTATION NOTE
>=20
> Sizing a 32-bit Base Address Register Example" says, that
>=20
> "Software saves the original value of the Base Address register, writes
> 0 FFFF FFFFh to the register, then reads it back."
>=20
> The same applies for 64-bit BARs. So what's wrong if I try to catch such
> a write when a guest tries to size the BAR? The only difference is that
> I compare as
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( (val & PCI_BASE_ADDRESS_=
MEM_MASK_32) =3D=3D PCI_BASE_ADDRESS_MEM_MASK_32 )
> which is because val in the question has lower bits cleared.

Because while this matches what the spec says, it's not enough to
match how hardware behaves. Yet you want to mimic hardware behavior
as closely as possible here. There is (iirc) at least one other
place in the source tree were we had to adjust a similar initial
implementation to be closer to one expected by guests, no matter
that they may not be following the spec to the letter. Don't
forget that there may be bugs in kernels which don't surface until
the kernel gets run on an overly simplistic emulation.

>>> @@ -522,6 +582,13 @@ static int add_bar_handlers(struct pci_dev *pdev, =
bool is_hwdom)
>>>               if ( rc )
>>>                   return rc;
>>>           }
>>> +        /*
>>> +         * It is neither safe nor secure to initialize guest's view of=
 the BARs
>>> +         * with real values which are used by the hardware domain, so =
assign
>>> +         * all zeros to guest's view of the BARs, so the guest can per=
form
>>> +         * proper PCI device enumeration and assign BARs on its own.
>>> +         */
>>> +        bars[i].guest_addr =3D 0;
>> I'm afraid I don't understand the comment: Without memory decoding
>> enabled, the BARs are simple registers (with a few r/o bits).
>=20
> My first implementation was that bar->guest_addr was initialized with
> the value of bar->addr (physical BAR value), but talking on IRC with
> Roger he suggested that this might be a security issue to let guest
> a hint about physical values, so then I changed the assignment to be 0.

Well, yes, that's certainly correct. It's perhaps too unobvious to me
why one may want to use the host value here in the first place. It
simply has no meaning here.

>>> --- a/xen/include/xen/pci_regs.h
>>> +++ b/xen/include/xen/pci_regs.h
>>> @@ -103,6 +103,7 @@
>>>   #define  PCI_BASE_ADDRESS_MEM_TYPE_64	0x04	/* 64 bit address */
>>>   #define  PCI_BASE_ADDRESS_MEM_PREFETCH	0x08	/* prefetchable? */
>>>   #define  PCI_BASE_ADDRESS_MEM_MASK	(~0x0fUL)
>>> +#define  PCI_BASE_ADDRESS_MEM_MASK_32	(~0x0fU)
>> Please don't introduce an identical constant that's merely of
>> different type. (uint32_t)PCI_BASE_ADDRESS_MEM_MASK at the use
>> site (if actually still needed as per the comment above) would
>> seem more clear to me.
> Ok, I thought type casting is a bigger evil here

Often it is, but imo here it is not. I hope you realize that ~0x0fU
if not necessarily 0xfffffff0? We make certain assumptions on type
widths. For unsigned int we assume it to be at least 32 bits wide.
We should avoid assumptions of it being exactly 32 bits wide. Just
like we cannot (more obviously) assume the width of unsigned long.
(Which tells us that for 32-bit arches PCI_BASE_ADDRESS_MEM_MASK is
actually of the wrong type. This constant should be the same no
matter the bitness.)

Jan


