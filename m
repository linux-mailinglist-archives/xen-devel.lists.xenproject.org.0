Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 533C0455FB7
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 16:41:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227488.393454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnjXH-0005NS-VC; Thu, 18 Nov 2021 15:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227488.393454; Thu, 18 Nov 2021 15:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnjXH-0005Lf-Rq; Thu, 18 Nov 2021 15:41:15 +0000
Received: by outflank-mailman (input) for mailman id 227488;
 Thu, 18 Nov 2021 15:41:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnjXG-0005LX-O4
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 15:41:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f598557f-4885-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 16:41:13 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-Od3eCBwhPTCsHWSen8OI0A-1; Thu, 18 Nov 2021 16:41:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3773.eurprd04.prod.outlook.com (2603:10a6:803:1c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 15:41:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 15:41:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0701CA0022.eurprd07.prod.outlook.com (2603:10a6:203:51::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.10 via Frontend
 Transport; Thu, 18 Nov 2021 15:41:07 +0000
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
X-Inumbo-ID: f598557f-4885-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637250072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5jExqXhxg2XpO1vBqByWYP9grueM1SmeTBm9TWPgMR4=;
	b=PXIIBMEApXOgoo0iMtHo6iyEkhHH5A0+bLAkjhGUFi/MNZlPsi78QkhCYmRsQ+qL3GOVnT
	cj/uEp+jmIhWqR5DLUW6KqqaqbT39Z7sW/JIVy7R5wyEr7GfPJor1Th/NmnpT5trTe8hjr
	uu7IMdehn7atUrUHX7Civ69QY2w/RdE=
X-MC-Unique: Od3eCBwhPTCsHWSen8OI0A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kekVtLac1v4DSbqTw/evAKLCj6fzp9hZay1Kt8gj8Wfosj9ZmOBNNSO4wXJTLA0ijK3ABDk+BRUT703bOtFOEf+8ytDhmJ9VU/7OJxFFjNdtLOgAf4U7ANemZykQIis0O+bjSoHfy7bDrJI/OEoEWhzfjz0RmFm4AnzxhagYcc76f6Zcyd3r5OC2VGMGtNlZKayNSvFXtBUcW1kruWq/k99MEUAi165YpHJjb2RuaOJzaT/6AwCAv0iINJzhrmpVLCCv5bj478VYIFLPe7b51/KP+KIlKflYz1vF7Q1kHhP/2Ju6nAmUvSGotBm4ZKI+1EOx6VdJIRdsFAetmTmOsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vflEYNAaxUGaHkx6BA9lxKG3NWyibnUr4GFhwV81uuA=;
 b=go5HdboeHmwgVSkXLxkZMtvWwgmFBfj8Pa1HEdLNMyj23EFhXd1H3LnNLoRsWI8sePVJS17TiSVjsrd4gXDAkg3uOrDx3/NOx4Oqk/kUYWiy8gq4Q+kslHdv0Lku5hShvpdzmo5XCVM8iNCslIyx2G72HYvJTdZISiGSkfuvl/ts0sKyI5SCY4g+LwlTeDNWzVO8N3adtU7lDMlstKagzl255+myEsiQzEvkViz3xew+KuglZfcYUQ1XXbKCgRpf/NhO6bCb7bzhmJ50SWfr8vjtFynYGl4TBO14517UGRd12j+2e2qsWZF61KeS/MnjHjq787vojzW0TlIbFI7hLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac0cc710-05b9-bdae-c31c-d159b4de0105@suse.com>
Date: Thu, 18 Nov 2021 16:41:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
 <YZZdU1oCaMt1HxTj@Air-de-Roger>
 <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
 <bf8f1c03-d872-094b-4a3c-3b15706babdf@suse.com>
 <816d3519-f007-80e2-e07f-ff285640926b@epam.com>
 <ecd83d8f-f290-295c-e073-583aa70a8c1e@suse.com>
 <2db325e9-0349-1cc3-1c4a-fefa048f181b@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2db325e9-0349-1cc3-1c4a-fefa048f181b@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0022.eurprd07.prod.outlook.com
 (2603:10a6:203:51::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b05b49d-970b-4bd9-9785-08d9aaa9d747
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3773:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB377310DB91D2560B22D5A85CB39B9@VI1PR0402MB3773.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mrJfw9EAHr8Xi9fyGqkueWB4iWedZeSz9POjYvBo6f3WAb5aCGdF4isslASC5OChssiVoDq6K5G2Wz2yqUt6evL9tmAhfFg/mT0Pn/b3jtC0IORcYt2BJzS5m/2Rz0FlsVeQAx4B8MERmgKuTB+yCubSlrmjvtm96WOUrbt2pZ/Hk2q17FuVrLA2zMtSNjzZpZxj+pjizkE2h+UTeO5rMEGmlmXtx3cGbZQraVzKmlP9CZ1EYAuWvXHaGcG1zgKjYt3c4H5n6QX/ipBrdVI/yxsDIH/Lwnh6VTE+CyIP47z02Uu/pBmjlEdxnRafnSeHGxH64o1F2zFGY0QgaGOWvjPQ+OBhb8Ns0GBIKjebqX/YsB0CbzH+Qot5uDvJ4Udx7Staiid871d6tE9gBAOhHQnX2Sx81rpCofFUSCuVfDqk060EN2RWxqR4PjuIZwRHVi7XvFm5zygbeYSjmy0T60U9IDZwTQoUkVtAqDlHMoLb6R46NhoAEmbNKoqKGdjr2PeArsa99zVgOsDOciEvDhtaFOaJP5x6IIn5y4nRhri+QK/ycvWfWK9Wl16Gop5IHlmuxqwIJKw/x4BEVkM25ZNBgtpQdXeNy0StSnbt89e6dedHzgISmdfmnBxPkCER14fqh6DZN7XLC8ttWCiNrDuNuuaWJ4OgH8cYVKY5p/p8q0KoIwla1MwQupYbAeLW1HcXU53SMICvnClcViUSmKvxN2zuGpXA5Ez9dELGhB4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(53546011)(31696002)(186003)(508600001)(66946007)(2906002)(5660300002)(4326008)(31686004)(6486002)(16576012)(6916009)(36756003)(66556008)(66476007)(54906003)(2616005)(316002)(956004)(86362001)(8676002)(7416002)(38100700002)(83380400001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WZQXAdjxqlejd2IqO4L5hdVAvQ2ma0gQQp6JPluBnmK9q4rTq3vwktf4d8N9?=
 =?us-ascii?Q?7TK1dI6VK0ZfXLnlTHgMbh2ZDoAnZuyHh4pRJ0DZTgIHWLYLvmetBU+GURhf?=
 =?us-ascii?Q?qmuS8iCKmM7Od61Pmlma/3gX+6PG4enyGEE77I4yResDN5Zzg6EBE1Ny2i1D?=
 =?us-ascii?Q?UXUkNn2/c++mKISJug2GgWB4TwAWwc6bu8U/Q8deipvQiH9A09ZeO0gxIZhW?=
 =?us-ascii?Q?YP1X/qokKHJygIGoOboFCOwRFDjyIw/MschJ+RokS8tBReUjwK9M7B/1rfIH?=
 =?us-ascii?Q?AzwgAgb+BX6hc68CiJVDTd9MkUbmfoV233gU7ZrVaei6dXrzoIISO1Kx5rPR?=
 =?us-ascii?Q?hCYTjkyj9rl1Hxb/RtceAiPQgHnnnWz3oaNytbJI6aT5OsrlCw5CyvLBppfv?=
 =?us-ascii?Q?DnSJ4t1pYJYjR+NGchG2O0ttRG+zQ6srQ21Fz7OV4SYYSSGNDYluCKOjLULB?=
 =?us-ascii?Q?MJbMMl0CXG7Dqy7fex3+Vlx7dsc/nQLKACSyETGyCFCidaaYt/xlDxEdXH+i?=
 =?us-ascii?Q?MAF8s93bXthj8B3F0sYMguq+5mwd49Bmz0Hv5KVwxQLotZTekpAntbX+vmzM?=
 =?us-ascii?Q?jtgOE/uCQSltLzfe1mi2tp9PCAZ4nJBYPv7I9FGetPtuoMm+h98Y7s21LI2m?=
 =?us-ascii?Q?N78GpVJ9R426dbNTzNEb8CnUEKHWp4adbbZDN4VOEOx687L1iET3bxUnSbFs?=
 =?us-ascii?Q?i4hlr99iOHPWUcrRG4ewEWYsPNnGNk5tgYIwHELhWt6jA0Udig7CpQ28LMvU?=
 =?us-ascii?Q?s5S6IjaZZ0g6GSp91DcsZTDYKIgMk4h7ECCP5ljEDicNllUNWfPcqMT/cagb?=
 =?us-ascii?Q?Z30BMxTI2v9nMtdAfcXW3RPOa8d6OM4ZKp8AavK3YUeRxPk4crvztutRAXt1?=
 =?us-ascii?Q?5a4z1MsRHh0j7ZsR8crGRRmmYeodwZRf+GMVy6VWNNObdF8KNaq1p1TjzkVb?=
 =?us-ascii?Q?Jcb+pohlzsxsKLSypJCJsElkd/Ga2QwFotvnCdWPlVyLfJpgMR3ZJObnEwVE?=
 =?us-ascii?Q?OQyuG1DBX1AuaMylaickZ+GO26msPw3qa1E3Ga7+QBlrKegKJ1AsuP92hWJJ?=
 =?us-ascii?Q?u6SXPeZgu4Ko68HEYxi6Sl3R3egStDz4zaCuZPrLU06GX+0ikN34t+mFGASV?=
 =?us-ascii?Q?IZ8Za/rxam2G5W1tTakMmkvL0xmLP1/1vSpAlxq3JVmhgUWS4ztHx85VY+1O?=
 =?us-ascii?Q?B8feIlLDzmV0Ae4u6Gt0yLpDz7bAmfZEViYku81lvMFpLx7TEb1a6+5iJ2zS?=
 =?us-ascii?Q?qvmpEG1NtdQfEH2IB/iZ2lDEFZiomY2uHwHnQIehrqswhFUdHoM0xOHkHlg+?=
 =?us-ascii?Q?kvaVbrsHWrgUxXUV0USJAvC6UYjS+vxvcD83RNulSaTh/N+FjtSfAE7stbYA?=
 =?us-ascii?Q?BwNTrR3gi0/kEj6FUcCbORAyGgicfcZn6RXQ9uK/P2NvEeN6xeU9JcPLkzQR?=
 =?us-ascii?Q?JIBLgof44ncZjtYLZ6kOxt3t4d408sVrcRE9Zc5dYvsMRHs1od7IE5t7xUDN?=
 =?us-ascii?Q?8f3gHhOz+9VC1Hkk3pT7jfhH/zkkwccg4VRX6Kx4GBHtqHxt7juoyp4t2XNq?=
 =?us-ascii?Q?o5WMGNtMATfsEJpD2EAh0YZyK9EledtOHO1J1MOQiaMcGfarp4nmi6tEjXw9?=
 =?us-ascii?Q?gbkzAluepYAO47wsHsNM/Ws=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b05b49d-970b-4bd9-9785-08d9aaa9d747
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 15:41:08.9233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GL7jRizeH2MIbvTAdMD3NBnVdtcTB7ibHUtKLhiABPvw3sGHaZtB8j8yGA0IGGlRro5O+b+SGabXRLG2j4sMqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3773

On 18.11.2021 16:21, Oleksandr Andrushchenko wrote:
> On 18.11.21 17:16, Jan Beulich wrote:
>> On 18.11.2021 16:11, Oleksandr Andrushchenko wrote:
>>> On 18.11.21 16:35, Jan Beulich wrote:
>>>> On 18.11.2021 15:14, Oleksandr Andrushchenko wrote:
>>>>> On 18.11.21 16:04, Roger Pau Monn=C3=A9 wrote:
>>>>>> Indeed. In the physdevop failure case this comes from an hypercall
>>>>>> context, so maybe you could do the mapping in place using hypercall
>>>>>> continuations if required. Not sure how complex that would be,
>>>>>> compared to just deferring to guest entry point and then dealing wit=
h
>>>>>> the possible cleanup on failure.
>>>>> This will solve one part of the equation:
>>>>>
>>>>> pci_physdev_op
>>>>>           pci_add_device
>>>>>               init_bars -> modify_bars -> defer_map -> raise_softirq(=
SCHEDULE_SOFTIRQ)
>>>>>           iommu_add_device <- FAILS
>>>>>           vpci_remove_device -> xfree(pdev->vpci)
>>>>>
>>>>> But what about the other one, e.g. vpci_process_pending is triggered =
in
>>>>> parallel with PCI device de-assign for example?
>>>> Well, that's again in hypercall context, so using hypercall continuati=
ons
>>>> may again be an option. Of course at the point a de-assign is initiate=
d,
>>>> you "only" need to drain requests (for that device, but that's unlikel=
y
>>>> to be worthwhile optimizing for), while ensuring no new requests can b=
e
>>>> issued. Again, for the device in question, but here this is relevant -
>>>> a flag may want setting to refuse all further requests. Or maybe the
>>>> register handling hooks may want tearing down before draining pending
>>>> BAR mapping requests; without the hooks in place no new such requests
>>>> can possibly appear.
>>> This can be probably even easier to solve as we were talking about
>>> pausing all vCPUs:
>> I have to admit I'm not sure. It might be easier, but it may also be
>> less desirable.
>>
>>> void vpci_cancel_pending(const struct pci_dev *pdev)
>>> {
>>>   =C2=A0=C2=A0=C2=A0 struct domain *d =3D pdev->domain;
>>>   =C2=A0=C2=A0=C2=A0 struct vcpu *v;
>>>   =C2=A0=C2=A0=C2=A0 int rc;
>>>
>>>   =C2=A0=C2=A0=C2=A0 while ( (rc =3D domain_pause_except_self(d)) =3D=
=3D -ERESTART )
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_relax();
>>>
>>>   =C2=A0=C2=A0=C2=A0 if ( rc )
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk(XENLOG_G_ERR
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 "Failed to pause vCPUs while canceling vPCI map/unmap for %=
pp %pd: %d\n",
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &pdev->sbdf, pdev->domain, rc);
>>>
>>>   =C2=A0=C2=A0=C2=A0 for_each_vcpu ( d, v )
>>>   =C2=A0=C2=A0=C2=A0 {
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( v->vpci.map_pending &=
& (v->vpci.pdev =3D=3D pdev) )
>>>
>>> This will prevent all vCPUs to run, but current, thus making it impossi=
ble
>>> to run vpci_process_pending in parallel with any hypercall.
>>> So, even without locking in vpci_process_pending the above should
>>> be enough.
>>> The only concern here is that domain_pause_except_self may return
>>> the error code we somehow need to handle...
>> Not just this. The -ERESTART handling isn't appropriate this way
>> either.
> Are you talking about cpu_relax()?

I'm talking about that spin-waiting loop as a whole.

>>   For the moment I can't help thinking that draining would
>> be preferable over canceling.
> Given that cancellation is going to happen on error path or
> on device de-assign/remove I think this can be acceptable.
> Any reason why not?

It would seem to me that the correctness of a draining approach is
going to be easier to prove than that of a canceling one, where I
expect races to be a bigger risk. Especially something that gets
executed infrequently, if ever (error paths in particular), knowing
things are well from testing isn't typically possible.

Jan


