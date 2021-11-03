Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8366F443F07
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 10:12:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220634.381978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCJK-0005kR-HZ; Wed, 03 Nov 2021 09:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220634.381978; Wed, 03 Nov 2021 09:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCJK-0005hW-Co; Wed, 03 Nov 2021 09:11:58 +0000
Received: by outflank-mailman (input) for mailman id 220634;
 Wed, 03 Nov 2021 09:11:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1miCJI-0005gv-PO
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 09:11:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cd55933-3aa0-48de-b7da-6008b5615453;
 Wed, 03 Nov 2021 09:11:55 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24--jyJ-0dPPtmghiERuQ8haQ-1; Wed, 03 Nov 2021 10:11:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 09:11:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 09:11:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0155.eurprd06.prod.outlook.com (2603:10a6:20b:45c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 09:11:49 +0000
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
X-Inumbo-ID: 5cd55933-3aa0-48de-b7da-6008b5615453
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635930714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KB7qvcZ5ZdI5tYHH3MA2gkI2rjK8w9Mc2OITaRW/AxE=;
	b=arUsos4d630NscV3FqhA2AhNStn4oAOpvKltIHGOHbURagdT0MS4Fg4w/Eu20Cr9s3DH6/
	F4OAvu/dRor9yZf4SkJDRP3vUebB+cMVSFwhfK1AsbaQvjVk/dhQok8sQ/fSNQ8P0bSckB
	E/RWuHqNjMwEi3QoNYGNKbOLHpEXO2I=
X-MC-Unique: -jyJ-0dPPtmghiERuQ8haQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=No8gmwPlap9jrlNbUXhRmtJ/J15tcJYzAB6j9EUxQNcws9UvfsNQEfp+GOyK/id9i6WbjTynRCm6rAs7S9TI3fQUc0iFV52LKzOWReYWQh7c5JRyixoH/bed9GHYbRDccfmE0qIxguE0WKnJK7fX9yLgqjbJbwpgj9fThCdss8Q56RI/Ngz8jwDtjOydSRSRh8CAspuLGR0H9BVwBijDAKYeJvGeJqxkfpaX+17Olymq/73ph23mTqFDSJG3SKN1fDVb8xMWgm+RAGHhoxamahEKcdeTUJdb9g4Ia/p93kA/9i5qQxM9nEABTlKH6EQkU6JT4scLGqfiQVJ2pVJwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URb2oE3rs2lP9ZEQw8m4FV+wjJplt6bgithgjRh/sWs=;
 b=NEVvS6tQbfENFauZ2fKCQFBQis+GOUmcK8peXIRa4+2u8J1V885KHtlbqJGRZT7F/UTaJP8zkEDBNYJnN+2T8gEuN6DGq+4yvChK94BiurQq4g+B2q8N6I4AYXOYd0kcwFjensXM4I7YAGIoiZ/tMOrdlxsiWVpG9/XZBqqX+BajxMG4aLyEdZHDGd4yoxpfwzd7dem6kwv2InpHFZeGu8DfjpC2Kqr+/lcCnWdf2a9GCGkiKy0NtWJ9AVxshvi6j4E1QuSphFM8MFgFzEqBYfTpRol/VWldB4dZG2sj7o4RdX1f70kFNcrX+670evvGeYER2cu4270x24WjzM47vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de320822-a94f-18ad-ccd4-574037903b1c@suse.com>
Date: Wed, 3 Nov 2021 10:11:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, Michal Orzel <michal.orzel@arm.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
 <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
 <YYEl8h+WtSZwNPn7@Air-de-Roger>
 <1a19dd35-a649-b155-bdd6-099e08fa3de1@suse.com>
 <65e218f1-471e-fd02-441a-f8c5f29d776e@epam.com>
 <b7626958-4df3-9f07-0ab9-604e55b3274e@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b7626958-4df3-9f07-0ab9-604e55b3274e@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0155.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92282bdc-ea36-41c2-42c3-08d99ea9f8ba
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43847728A5271691EE517C02B38C9@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ma42J24fqyEZQdnNjM+ho16irDPkIORtbO/L7iVPbmi/MuiW5QSRQehbXJ+Pmq/6G0azMEKMWDkE2ptv0lqrg0S+w7I8SZj+Ji1iOdgBv8nBY8pjM3MJXRXxvjCmTGSrsC1zfFHdR4BxhhCjYfQs8ijfZfzVL33piNEVojc53/SXE+Nk2OSxcAly5JI3v4SrE+wwUmZp4SXLRe1iVcsyEyPKFp4TH9ITEt/O0GkmNR33Oa+2/qkrFIfQfhcog5mbqbvdzRMhvZwel0tPXsXqAcOzR695ByDTkek2RvqGUgCN7k8Z+xJ0qCg2wBR7X0vGAFq3SykVj+I3wbSdXWzd5jKVs9VsW1zEkRmc7Cs7wOdU3/q04Pp4SKImLXEGq0kD7/rkvrHRFsQ0qKJkqOSaycEYDy/UYdZu5pWX6TEKJaRX8NJTJBEYDNhEBeqJJKP5G0bpdqhQANNEAX7WH39S0KbmBqCaswW565Ef4jd+wfDA+ifymWuydrniqY3/Uqy+gRem/W8Gzk3nawnD7vEd1KNxdmVsvGb6zY2QkrDn1klNfz6iV+UoHIGXIAKR1jqoa8IKRsK+8q9k03+0wGm8NW1YvKGi2L4u36ApLU63zHJXsFV7JeIaf6KN+nyoDZW0GpUpj9o4L5/6Va4TlvtmWgj0WYzrZ/SaX2a1wh2qOiylCYfSqQAf0igcrRd6vzHfE10vbO9pfQ5F62EOtIEFxx1pCvnn1bae86a2AdOmqJ7sSgGCF0txBeNE8vm+4gr/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(508600001)(31686004)(110136005)(8676002)(16576012)(956004)(31696002)(6486002)(36756003)(316002)(66476007)(54906003)(2616005)(66946007)(186003)(7416002)(26005)(38100700002)(5660300002)(83380400001)(86362001)(4326008)(8936002)(2906002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jCpe8kOPyfoDt5xYOKLJq+7Y/uJ6SnqHRnifoLDvMaAZJHlhwfFz67No4ty+?=
 =?us-ascii?Q?x+vbwdwvFlhtlVFSJ0qvQGHnQNENgVBY5ZsmoDJK2b9eBJdtdNSWzem5V2V+?=
 =?us-ascii?Q?CIx2p7nO4+fcGVZLs/w2Z2nadLIwAlIKqp6bKj0Q9frXUJy4ABrQOknIkyCJ?=
 =?us-ascii?Q?jWfSepmFrkfGyU/nZTmTl7o8bSQNYWmrNHmvnDZsGU4M32qswo73FSn5Nqix?=
 =?us-ascii?Q?8Ebs1p2Vsm05bGjXtEupMLdIUm9xarKpaSpGo4IvHGN13L2b8+Ka5W930osT?=
 =?us-ascii?Q?b0zc4+Qk+vxBW2/Uy2WT0E3l2jOPcH/QR75yteHq4LoRI3vs+UIIcevU9RYL?=
 =?us-ascii?Q?RnDDWdul1PPBYJxs51DmIxphqFFDLTpdKiXQT1H73uig2Le4zS27FoJ5l1QD?=
 =?us-ascii?Q?vi84uP6QZ78UEr4dEPUuM0NdzNzQ7VFofzXlKCn/fooOQKSmgzFPIi/t+7M6?=
 =?us-ascii?Q?FHu3smUthcl219AHIDwWuN3HY2+bwToDAEROmFzvnO5RpqDkUUC+CkijBx1z?=
 =?us-ascii?Q?3n6a1wv2luBFRk2myTU9d3zjJj23V+iJbwEsYhWymtRahnzPwMN6l1FL0FBX?=
 =?us-ascii?Q?h8JzXLXmxHrTD9HLWvgIgZcnN/IwvtCDUBHitZtkUX9dorYd9fFXKRPU9g+/?=
 =?us-ascii?Q?eFQjA+G189wA89LZ2eSyDTswFAyQ3pFW+3+wtQOIT0JDq4Roh33HURlyWxln?=
 =?us-ascii?Q?c2ZWBUuzIzBxlKsFDYrVu70UywfpowFIJUE+A/m5kxRgkXxRtWVIFxhVz7/w?=
 =?us-ascii?Q?xqC/pzMZNR417477RjndC82pSGRy976V03VcuyMyNGfx3CyqLeH+ckJEuTyb?=
 =?us-ascii?Q?HQNyBxrJvKWM9S/ZOfGJa9jNCJvN7xYRbhiBr0grPlbXdR7xz4QRiqvwlnwt?=
 =?us-ascii?Q?i7QKbJupgdyMQ0m4SmocfvtoTsn8hX0hls9PrTziwCUJJQ2ENE2q5PS2eRf4?=
 =?us-ascii?Q?gC5Ja33toiqZSszSypaA+kva/7GLn0KCGJ+cUiPMUaMTFU44UKIa9D8iQqc8?=
 =?us-ascii?Q?Rcox+KT3iQpbJsgBzVca1NNZBLMZXqAOqSicq8etQdTvJK9WFLt93jy/qJPn?=
 =?us-ascii?Q?yazIn9WYxZo/tajTuTNtH4KOzIvM94YvzoMxmqiYKNPsrb0hG+OZOPSUgnIm?=
 =?us-ascii?Q?VsVA4ikSx2MtA693iwGWi9OLq0tjd9aT/SprdMvg+UIQaCM30Dl5lBK4MozV?=
 =?us-ascii?Q?L5BGojZW5hwdwQPbvPY2BuZu/kts0YS4Kqvt9RMqPSBPIMh8UAmzTSeLTuhJ?=
 =?us-ascii?Q?uTNjewulNAZpuKDybGlHuVOERC9FEqYiYG10jNrc2XY5snj0R2shX1pHYGRW?=
 =?us-ascii?Q?uQT4CvapA6cKGVFxZsS/HsXb0wHhNOT3tQ5n/CU8XIvZ1TkqXvoiwcDX1iyb?=
 =?us-ascii?Q?6zb8I3IcRNLAb3vJPiWrX9oEdRwXlNopLWisfJqV+jueb5jiYAy8MLgrvR2h?=
 =?us-ascii?Q?AAgqIxwo1p843nokP7V4k/4FsJ/tU/8RP3LMGlPg8YKfB8XcaGpcbFps+Wm1?=
 =?us-ascii?Q?GpSWaml6qq+2QS7uaiO8f2XyEC4OEr99RepZbRvp40E3VZOz/D8aoWfPV6Kz?=
 =?us-ascii?Q?w896uD5oD8p0/di4M+e/e+EkxKjCqzhTI0DT9EQsW+bCHOvU+7c2giVvkqF9?=
 =?us-ascii?Q?SBtEmw1fi8pDGT+y8GCVBAo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92282bdc-ea36-41c2-42c3-08d99ea9f8ba
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 09:11:51.0722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgercSUcRZzC/ePDNoOS9TIBI5AKn3W2rsX98SIoclUsCCmXM57lPHurskeyOHGVZwWk0awk9r7Mq7Gl/gN9+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 03.11.2021 09:53, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 02.11.21 16:10, Oleksandr Andrushchenko wrote:
>>
>> On 02.11.21 15:54, Jan Beulich wrote:
>>> On 02.11.2021 12:50, Roger Pau Monn=C3=A9 wrote:
>>>> On Tue, Nov 02, 2021 at 12:19:13PM +0100, Jan Beulich wrote:
>>>>> On 26.10.2021 12:52, Roger Pau Monn=C3=A9 wrote:
>>>>>> On Thu, Sep 30, 2021 at 10:52:20AM +0300, Oleksandr Andrushchenko wr=
ote:
>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>> @@ -451,6 +451,32 @@ static void cmd_write(const struct pci_dev *pd=
ev, unsigned int reg,
>>>>>>>            pci_conf_write16(pdev->sbdf, reg, cmd);
>>>>>>>    }
>>>>>>>   =20
>>>>>>> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned i=
nt reg,
>>>>>>> +                            uint32_t cmd, void *data)
>>>>>>> +{
>>>>>>> +    /* TODO: Add proper emulation for all bits of the command regi=
ster. */
>>>>>>> +
>>>>>>> +    if ( (cmd & PCI_COMMAND_INTX_DISABLE) =3D=3D 0 )
>>>>>>> +    {
>>>>>>> +        /*
>>>>>>> +         * Guest wants to enable INTx. It can't be enabled if:
>>>>>>> +         *  - host has INTx disabled
>>>>>>> +         *  - MSI/MSI-X enabled
>>>>>>> +         */
>>>>>>> +        if ( pdev->vpci->msi->enabled )
>>>>>>> +            cmd |=3D PCI_COMMAND_INTX_DISABLE;
>>>>>>> +        else
>>>>>>> +        {
>>>>>>> +            uint16_t current_cmd =3D pci_conf_read16(pdev->sbdf, r=
eg);
>>>>>>> +
>>>>>>> +            if ( current_cmd & PCI_COMMAND_INTX_DISABLE )
>>>>>>> +                cmd |=3D PCI_COMMAND_INTX_DISABLE;
>>>>>>> +        }
>>>>>> This last part should be Arm specific. On other architectures we
>>>>>> likely want the guest to modify INTx disable in order to select the
>>>>>> interrupt delivery mode for the device.
>>>>> We cannot allow a guest to clear the bit when it has MSI / MSI-X
>>>>> enabled - only one of the three is supposed to be active at a time.
>>>>> (IOW similarly we cannot allow a guest to enable MSI / MSI-X when
>>>>> the bit is clear.)
>>>> Sure, but this code is making the bit sticky, by not allowing
>>>> INTX_DISABLE to be cleared once set. We do not want that behavior on
>>>> x86, as a guest can decide to use MSI or INTx. The else branch needs
>>>> to be Arm only.
>>> Isn't the "else" part questionable even on Arm?
>> It is. Once fixed I can't see anything Arm specific here
> Well, I have looked at the code one more time and everything seems to
> be ok wrt that sticky bit: we have 2 handlers which are cmd_write and
> guest_cmd_write. The former is used for the hardware domain and has
> *no restrictions* on writing PCI_COMMAND register contents and the later
> is only used for guests and which does have restrictions applied in
> emulate_cmd_reg function.
>=20
> So, for the hardware domain, there is no "sticky" bit possible and for th=
e
> guest domains if the physical contents of the PCI_COMMAND register
> has PCI_COMMAND_INTX_DISABLE bit set then the guest is enforced to
> use PCI_COMMAND_INTX_DISABLE bit set.
>=20
> So, from hardware domain POV, this should not be a problem, but from
> guests view it can. Let's imagine that the hardware domain can handle
> all types of interrupts, e.g. INTx, MSI, MSI-X. In this case the hardware
> domain can decide what can be used for the interrupt source (again, no
> restriction here) and program PCI_COMMAND accordingly.
> Guest domains need to align with this configuration, e.g. if INTx was dis=
abled
> by the hardware domain then INTx cannot be enabled for guests

Why? It's the DomU that's in control of the device, so it ought to
be able to pick any of the three. I don't think Dom0 is involved in
handling of interrupts from the device, and hence its own "dislike"
of INTx ought to only extend to the period of time where Dom0 is
controlling the device. This would be different if Xen's view was
different, but as we seem to agree Xen's role here is solely to
prevent invalid combinations getting established in hardware.

Jan


