Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD5142E901
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 08:30:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209772.366319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbGj0-0001g1-Uu; Fri, 15 Oct 2021 06:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209772.366319; Fri, 15 Oct 2021 06:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbGj0-0001dV-Rr; Fri, 15 Oct 2021 06:29:50 +0000
Received: by outflank-mailman (input) for mailman id 209772;
 Fri, 15 Oct 2021 06:29:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbGiz-0001dP-8t
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 06:29:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ab0741c-2d81-11ec-8226-12813bfff9fa;
 Fri, 15 Oct 2021 06:29:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-cT0T7Iy9MVKrYo8nZYx2Aw-1; Fri, 15 Oct 2021 08:29:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 06:29:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 06:29:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0028.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Fri, 15 Oct 2021 06:29:42 +0000
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
X-Inumbo-ID: 4ab0741c-2d81-11ec-8226-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634279386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kk9aqE7Hf6K+1dwDB8q1G1Au5NoFvIB2rHxG7TTE2B0=;
	b=Q89SUEVwXwgvXMrNE1L5qP3oYTYYHueO4r9D9qVyWVPzJMY3edWkYigNJjOukIOzMW220a
	gtdyPTuBW6yfylzcmxF1z148lYKN2SVzZh71FtiSESsGuFQmF8U1H6et5fk4GiozOtTjjs
	4yo16Rk7Pv1tQ7I/Vcg1xjD4AfWgrNA=
X-MC-Unique: cT0T7Iy9MVKrYo8nZYx2Aw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdOOZIQXu13Fa8k72R+FA2bmBs6mI1AuJT7z/RFtesgsQgO4IfCBobDUGfw12aSzuTatyCh6UevXCASp0lgZSq6xNfIseI2hL3F3H9wIc1+Kohqlw0ozw+M7Qk6kl09986Eb1A9Xzje9dRktWJdBzhr6ZmN2fyMW9kXcis1k+6xBc4B6CW8zhf48LSZe+yErRCHUDEeAeYYF5s/W9BNiV2klETxMcRlCCKO1YMF/SD5NYldJ6qfn93s8GY0IgkkoscPy1VtJpMsZVZMtlmtPzWLB5kE6zLJjJRlwfxmtmtwpe2NkZNGgw3Swj1B9ahIA+kcQ7OA0AbELIuJjewN9Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NheZX20MwZBm0N64iNBm3OmW9KxSWXOPiPSjl6uZdME=;
 b=W41U220tGazdZYqKMmgpQ5Yq+qa4/y9kRXoKYeJ0TxpGNHdCgxyR878zL6FyU0N3eY7wp69LPZX6cxvRpLUSLYNKhfwmHCciUPBn3vOIlVkuYr96yBQzR+A/8UX09YbpdMFzbWz/jdbClsr7v/aHiWhoVfaJWeOGHjIqyDkiPh9aM/5tUf5KwFyFkp1Xa6b3cX/tTEI2JM9/T7QwquD9cPF1wX8kZuuHvUCzdFhjy6THEJfGs2YiceIU0B/qK7nxA9B41X7dC0pzE+iQW5ZEDqKZeK1NrLkzj0YTjSAlODYyFYmKN88FNJFioXnfYPxgKnz0Dgnf1gOTIejaGidWdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Ian Jackson <iwj@xenproject.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
 <20c73f4e-5a8b-c127-f3a7-b841f50b1a4a@suse.com>
 <6C71E132-0A78-4DA4-AA52-E62833912145@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a7d1370-ee58-8e95-efea-8e4162e1e5f7@suse.com>
Date: Fri, 15 Oct 2021 08:29:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6C71E132-0A78-4DA4-AA52-E62833912145@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0028.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1350ac5-66e8-45df-ad5a-08d98fa52c7e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2336C84715BF70DF633B48CAB3B99@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mDDnq6jcnqnURyP/A2CuzloG8SFcMIC+OdKmY9yVrzditEMZuHxvzaNC+ugrk8djFBNB+ibsnsmKdbodKSVjVccgi1dmB97YWEvM5pijB+cFt9ybE8xkQGQKF1aq5Hlv1VZPfXgSK8S30S+7ZipgiMYQi0NT2ZffQJ3evQtWNFXvRuRhG2b8qubF6hKaEtczHvRbUiBSGCAPYL1QIfEuWe7BceZnWbBCq2XuclXKHsfNdGuLQovg2S8zjV9ODdjLvhXYz/fkFBe+BNojpSMhhvcLF/fVNuyX7GjtVixcIn8hRvV0c2dFisMwfBdcjFsiP9r8yHkRTV83YM5t3Rls7xQCWTke7F8z9ILR4Z9UOzD/MhAo7WdGIPbYh916LRtuBaP0HPC2FEgOR0RZ8fCnfhASVJb6wX6L5IA/FO1j0+ZCd2RHkMgfc997U3Gs37sWaWXZvKnGH/jW2+ZStDmkW7XeXL8YvENJ/RLnfBX6AnKb/4awkwRK4oPjG4g0lbnO9QZqER0WwYMkt/wE87f02p0GPNS8wCH5/ZloSQYKZbNXvpMOkeSrZiEjguiQvhQ5p1pvWRCkAcFidLmVr9eAdH4xwB+8xrnfRPLApLadJGeMztxDuO1QP5QkgXsprLTbImWLIDkFyvB54poMqm7jj/iqUZnkS+T39Gq1btxvRDymHgeQf1/JbsNg2DkGqv0kgiD2Le5YRsSB7En4OOOa7jUXfhGNAij9Vfz/A6LJhPpmJSMwRlz4XrnKyk+vJJre
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(31686004)(5660300002)(508600001)(6486002)(86362001)(16576012)(2906002)(54906003)(36756003)(66946007)(6916009)(66556008)(53546011)(31696002)(26005)(316002)(186003)(956004)(8676002)(2616005)(4326008)(38100700002)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PEImCTex7FF0yY0wCMUsNk0itQ84K2STILNTNaFsWb+0SFXxlWXhBGieLy0A?=
 =?us-ascii?Q?OwZuvRaAeZjajDxsKoN7Kf/vUZXgchdj4X6nRsmyyS47F7TsZ0oH1Qw5QMLv?=
 =?us-ascii?Q?7eb62tfmn8Q1jZWywZid9vgqE5B6TzsAqAdqVzOLyhLIm52qoG1sVYKaa9ZB?=
 =?us-ascii?Q?P6v49JcobIzd2LN7wLbSjHo1ngs9BP+qFo33J5oerviBNzsBH5fZ+z86rrsp?=
 =?us-ascii?Q?isX8cYQjmCCic8rVZXkZ7mUk2p57mnOjAvY8dkIXEyQAixQ1TNlzJuArT1hF?=
 =?us-ascii?Q?l4HBP3XC53Xf36qyw4fFjSj8Rth433at3DSQg/8dLXiE5KBGxnixFxBwVHfm?=
 =?us-ascii?Q?gtvu6w4btJpn3rbkKwCWnhPe3Aj/W70tgwTXLDpYvp1viNFc/bHg2ra41DSj?=
 =?us-ascii?Q?8FjDtgwSOFGlGBIY1iRzzwzckzxPbeHmTYns4iraHEZv42gOXruvVVw62Wjf?=
 =?us-ascii?Q?hxf7FLTYOy9IIRYk4iKQo3iBvA3JAn/xQxtcBU59HRYaw7e502BOZczLu37U?=
 =?us-ascii?Q?mzzpxpmrVlFlUmeM2NkNTirYJAFXhZien7vhPlnf77H0mb7o2k9kBiRlWK85?=
 =?us-ascii?Q?p+m/66EpexfsBdr6Z9xVF+BoVnSE+3ZjXzE5n61n4AJAGy7d8+NrmYQNtzJ6?=
 =?us-ascii?Q?HlEULpdfCMrLSrlWXocHKF/kUN5k0SNtd0uc2FyQkcwEtKnbXk+vuHUQScqS?=
 =?us-ascii?Q?fM3WuVqgfPCxukMDcHoizBdc55q/1xwfRijSvvFlYKEQPc65jX4pfMuBgXv2?=
 =?us-ascii?Q?zX50HuGD/zOPgamHNFlCr8bjlJAO9YEjv9mHIHCBYu8y1p5Wq8p1zc4S5SR7?=
 =?us-ascii?Q?eE9kys9uHdelgWVKOKqOBa72A5uBcBbY3jJQz3Tf9Amrur0jy8Ls5z2LBfwL?=
 =?us-ascii?Q?Xij+pRRoWPAIZcn1RJGXiGE4isR8FVHQNotsV7NVZf2yy8zng138affhTjYj?=
 =?us-ascii?Q?ZVc9az1BvFA3jfKTjTFdpE3vSzHr9bwbVthjiVoZ9U3OrAEdyTHRRPPa4nYI?=
 =?us-ascii?Q?RwX8QkkVQNr9xNmtH6k7SnLMejpn/p6xHn3JdFRa9j8JScDyu/6y6P7o7G2k?=
 =?us-ascii?Q?rmIx+wiFFOi/wm0wIfbxGsAhVf12XBJmM9nBZUPGDSca+4i6Cbxu41gtU7cC?=
 =?us-ascii?Q?RyVrbeG439CSmyBb5HbifG1ukEatc5Fy4w4o19HJwWetaH4PN2kD9q8JSHjT?=
 =?us-ascii?Q?liHX0uGY/ZL3Z7Fz7yJYilCk8dhMR0GbE+i1/f1vQMamEMaIH5KMVLi4hxJn?=
 =?us-ascii?Q?SehikSnUtdlZEjJ8ZXfLl/LKTUnDybfMNF/lz1uw/Ss6WCS5devCo2Ng6puw?=
 =?us-ascii?Q?zA85sTCgz/RnGigvxqhUTS9V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1350ac5-66e8-45df-ad5a-08d98fa52c7e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 06:29:42.9620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vKogTSvvM4PcpmEH+szltJFCo0R8SnnrjYNxsWY1Th//GwqPhZBP713qPZ4VfC0VyTvqDar+a7m0UnFz8P15w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 14.10.2021 19:09, Bertrand Marquis wrote:
>> On 14 Oct 2021, at 17:06, Jan Beulich <jbeulich@suse.com> wrote:
>> On 14.10.2021 16:49, Bertrand Marquis wrote:
>>> @@ -305,7 +291,7 @@ static int vpci_portio_read(const struct hvm_io_han=
dler *handler,
>>>
>>>     reg =3D hvm_pci_decode_addr(cf8, addr, &sbdf);
>>>
>>> -    if ( !vpci_access_allowed(reg, size) )
>>> +    if ( !vpci_ecam_access_allowed(reg, size) )
>>>         return X86EMUL_OKAY;
>>>
>>>     *data =3D vpci_read(sbdf, reg, size);
>>> @@ -335,7 +321,7 @@ static int vpci_portio_write(const struct hvm_io_ha=
ndler *handler,
>>>
>>>     reg =3D hvm_pci_decode_addr(cf8, addr, &sbdf);
>>>
>>> -    if ( !vpci_access_allowed(reg, size) )
>>> +    if ( !vpci_ecam_access_allowed(reg, size) )
>>>         return X86EMUL_OKAY;
>>>
>>>     vpci_write(sbdf, reg, size, data);
>>
>> Why would port I/O functions call an ECAM helper? And in how far is
>> that helper actually ECAM-specific?
>=20
> The function was global before.

I'm not objecting to the function being global, but to the "ecam" in
its name.

>>> @@ -434,25 +420,8 @@ static int vpci_mmcfg_read(struct vcpu *v, unsigne=
d long addr,
>>>     reg =3D vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
>>>     read_unlock(&d->arch.hvm.mmcfg_lock);
>>>
>>> -    if ( !vpci_access_allowed(reg, len) ||
>>> -         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
>>> -        return X86EMUL_OKAY;
>>
>> While I assume this earlier behavior is the reason for ...
>=20
> Yes :-)
>=20
>>
>>> -    /*
>>> -     * According to the PCIe 3.1A specification:
>>> -     *  - Configuration Reads and Writes must usually be DWORD or smal=
ler
>>> -     *    in size.
>>> -     *  - Because Root Complex implementations are not required to sup=
port
>>> -     *    accesses to a RCRB that cross DW boundaries [...] software
>>> -     *    should take care not to cause the generation of such accesse=
s
>>> -     *    when accessing a RCRB unless the Root Complex will support t=
he
>>> -     *    access.
>>> -     *  Xen however supports 8byte accesses by splitting them into two
>>> -     *  4byte accesses.
>>> -     */
>>> -    *data =3D vpci_read(sbdf, reg, min(4u, len));
>>> -    if ( len =3D=3D 8 )
>>> -        *data |=3D (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
>>> +    /* Ignore return code */
>>> +    vpci_ecam_mmio_read(sbdf, reg, len, data);
>>
>> ... the commented-upon ignoring of the return value, I don't think
>> that's a good way to deal with things anymore. Instead I think
>> *data should be written to ~0 upon failure, unless it is intended
>> for vpci_ecam_mmio_read() to take care of that case (in which case
>> I'm not sure I would see why it needs to return an error indicator
>> in the first place).
>=20
> I am not sure in the first place why this is actually ignored and just
> returning a -1 value.
> If an access is not right, an exception should be generated to the
> Guest instead.

No. That's also not what happens on bare metal, at least not on x86.
Faults cannot be raised for reasons outside of the CPU; such errors
(if these are errors in the first place) need to be dealt with
differently. Signaling an error on the PCI bus would be possible,
but would leave open how that's actually to be dealt with. Instead
bad reads return all ones, while bad writes simply get dropped.

> When we do that on arm the function is returning an error to the upper
> layer in that case, that=E2=80=99s why I did keep a generic function info=
rming the
> caller.

While you're the Arm expert, with the above in mind I wonder what
the actual action in that case ought to be there. Would you explain
to me how, say, a misaligned 2-byte read that the CPU permits but
the PCI subsystem doesn't like would be dealt with by bare metal?

>>> @@ -476,13 +445,8 @@ static int vpci_mmcfg_write(struct vcpu *v, unsign=
ed long addr,
>>>     reg =3D vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
>>>     read_unlock(&d->arch.hvm.mmcfg_lock);
>>>
>>> -    if ( !vpci_access_allowed(reg, len) ||
>>> -         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
>>> -        return X86EMUL_OKAY;
>>> -
>>> -    vpci_write(sbdf, reg, min(4u, len), data);
>>> -    if ( len =3D=3D 8 )
>>> -        vpci_write(sbdf, reg + 4, 4, data >> 32);
>>> +    /* Ignore return code */
>>> +    vpci_ecam_mmio_write(sbdf, reg, len, data);
>>
>> Here ignoring is fine imo, but if you feel it is important to
>> comment on this, then I think you need to prefer "why" over "what".
>=20
> Agree I would just need some help on the why.
> Now there was no comment before to explain why so I could also
> remove the comment altogether.

The latter would be my preference.

>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -478,6 +478,66 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg,=
 unsigned int size,
>>>     spin_unlock(&pdev->vpci->lock);
>>> }
>>>
>>> +/* Helper function to check an access size and alignment on vpci space=
. */
>>> +bool vpci_ecam_access_allowed(unsigned int reg, unsigned int len)
>>> +{
>>> +    /*
>>> +     * Check access size.
>>> +     *
>>> +     * On arm32 or for 32bit guests on arm, 64bit accesses should be f=
orbidden
>>> +     * but as for those platform ISV register, which gives the access =
size,
>>> +     * cannot have a value 3, checking this would just harden the code=
.
>>> +     */
>>> +    if ( len !=3D 1 && len !=3D 2 && len !=3D 4 && len !=3D 8 )
>>> +        return false;
>>
>> I'm not convinced talking about Arm specifically here is
>> warranted, unless there's something there that's clearly
>> different from all other architectures. Otherwise the comment
>> should imo be written in more general terms.
>=20
> Other architectures might allow this case. So this is specific to Arm.

If it really is, I consider it wrong to live in common code. If
per-arch tweaking is necessary, and if earlier handling of the
intercepted access doesn't already exclude "bad" cases, then a
per-arch hook would imo be the way to go here. Given the size
of the function I would then wonder why it doesn't remain per-
arch in the first place.

>>> +int vpci_ecam_mmio_write(pci_sbdf_t sbdf, unsigned int reg, unsigned i=
nt len,
>>> +                         unsigned long data)
>>> +{
>>> +    if ( !vpci_ecam_access_allowed(reg, len) ||
>>> +         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
>>> +        return 0;
>>> +
>>> +    vpci_write(sbdf, reg, min(4u, len), data);
>>> +    if ( len =3D=3D 8 )
>>> +        vpci_write(sbdf, reg + 4, 4, data >> 32);
>>> +
>>> +    return 1;
>>> +}
>>> +
>>> +int vpci_ecam_mmio_read(pci_sbdf_t sbdf, unsigned int reg, unsigned in=
t len,
>>> +                        unsigned long *data)
>>> +{
>>> +    if ( !vpci_ecam_access_allowed(reg, len) ||
>>> +         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
>>> +        return 0;
>>> +
>>> +    /*
>>> +     * According to the PCIe 3.1A specification:
>>> +     *  - Configuration Reads and Writes must usually be DWORD or smal=
ler
>>> +     *    in size.
>>> +     *  - Because Root Complex implementations are not required to sup=
port
>>> +     *    accesses to a RCRB that cross DW boundaries [...] software
>>> +     *    should take care not to cause the generation of such accesse=
s
>>> +     *    when accessing a RCRB unless the Root Complex will support t=
he
>>> +     *    access.
>>> +     *  Xen however supports 8byte accesses by splitting them into two
>>> +     *  4byte accesses.
>>> +     */
>>> +    *data =3D vpci_read(sbdf, reg, min(4u, len));
>>> +    if ( len =3D=3D 8 )
>>> +        *data |=3D (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
>>> +
>>> +    return 1;
>>> +}
>>
>> Why do these two functions return int/0/1 instead of
>> bool/false/true (assuming, as per above, that them returning non-
>> void is warranted at all)?
>=20
> This is what the mmio handlers should return to say that an access
> was ok or not so the function stick to this standard.

Sticking to this would be okay if the functions here needed their
address taken, such that they can be installed as hooks for a
more general framework to invoke. The functions, however, only get
called directly. Hence there's no reason to mirror what is in need
of cleaning up elsewhere. I'm sure you're aware there we're in the
(slow going) process of improving which types get used where.
While the functions you refer to may not have undergone such
cleanup yet, we generally expect new code to conform to the new
model.

Jan


