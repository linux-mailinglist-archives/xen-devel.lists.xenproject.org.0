Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8254C859D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 08:54:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280928.479049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOxLG-0007gW-3T; Tue, 01 Mar 2022 07:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280928.479049; Tue, 01 Mar 2022 07:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOxLG-0007eO-0S; Tue, 01 Mar 2022 07:54:42 +0000
Received: by outflank-mailman (input) for mailman id 280928;
 Tue, 01 Mar 2022 07:54:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOxLD-0007eI-Uq
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 07:54:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d832865a-9934-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 08:54:38 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-uFMk8q9lMB-gREREpdHU8g-1; Tue, 01 Mar 2022 08:54:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5428.eurprd04.prod.outlook.com (2603:10a6:208:113::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 07:54:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 07:54:35 +0000
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
X-Inumbo-ID: d832865a-9934-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646121278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tuferMufzsFXQYa+KiVEBJBP1Epvsmt/w+PiT8wjslI=;
	b=N/lHd41j2GTQG655ns94leGQXE2SAdpypYl3kokx3ZEprRmuDXFiXxj3rB0UMqmIe7adR+
	o+Vp9q6a+MMAbpElw5uSpiLVMbIXgqBnbb42VECjBaETuPG0WBRBurhoijua/HqW2fUG6s
	JI29t8ELNGR38FShcJ0m1h35KFceAiU=
X-MC-Unique: uFMk8q9lMB-gREREpdHU8g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPBuhtADskuH12y8qsdJF4IAUCy6xUfswfKTDGXQALyOPOIjH5HbrBz6SYvbMtsO+i8jTexo9lqkwV/mAImSsCq+yxPcmkBiXHBRSOrJQ5/YyiwO4PyyUr5YVNb0ht8xX7FkhUcbvnbQreAHSdOk8MwJWTRbPwTshaewESIWnwc9aI0/t0rbSXh2/pIkZ1LI/ACvemscyRs00GsWCY3lY5Cs33g4UXkDi5X+fWhNrYQ/WHB6eHL4xdHmmzSBbOyv2oLJrNbThwDQ4/tmFRBfhf+gGzvUX7tju1I/slA1LhiQ/R1ugc/+cMS3ZkyCCaIU83Tb3PC+YL97St02cOs7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgwG/7GAukzSMCZIXw062wDuDQ86sS0ae0m92b8+naw=;
 b=RZXVO53kvY+J07rQ1Lq2mTyNvPVHARpk/nkfb03gAeBYaGIDDrhYKmoBMY+6YMJq7213N4AEGFRjohi1NkWpMfDMS2jWWbpBn2XtMcHlXvTZROw07YEONRjwTCQ449636ZYUs/oJ9u+TpOOkNRE3PdqKPP1/tHGQVEauXRce9NlrFCZRREI1GEFy1K6/CP0b+DPe7ZITQOfb5UE4TUOPdTkJoEh0IU1RoatHCKp9zy34plZK+AX+39cqTOhdUcMAjFJnLQ/fid+ydxIIOqphArffhIB0Wi6i3kV7Tu8ZswCvordujU/J1ZNvDtsi8fVm7GRco68KOfaiEzS5izvpgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <713a8237-6f50-c764-e572-b914cbfa1616@suse.com>
Date: Tue, 1 Mar 2022 08:54:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-3-jane.malalane@citrix.com>
 <b83773ec-c97a-7aea-e61a-c2e34b270816@suse.com>
 <Yhyv6Ui4ap1wOeNd@Air-de-Roger>
 <7ad79609-bd67-aa44-56e0-1070f3ee88f7@suse.com>
 <Yhzu4Nl2dY80KXss@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yhzu4Nl2dY80KXss@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0044.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6795d9d6-977c-49ca-d3d2-08d9fb58ba4e
X-MS-TrafficTypeDiagnostic: AM0PR04MB5428:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB542859162C5FF5FA2215B20EB3029@AM0PR04MB5428.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gVT4ysDUvFb8rnZeLwStwrJFSguYo4sbpSo1seHklqtW9694p4Z1H82xmmuoxiepErkjljngoXcaxNde47pJpxtVMQx+pHo8Mc9TbrM2Klz9IhnCl7gFWFC5buc54h4vtq3yIESG55SAQ3BytJfP8JP8BY9kpfx9n585LCLjNZfPzOWd/508k7gUoy9mPkd7/xnGD8qc9nbXM9t27GmuDlXRQo6NAMNfK5odFJ0YYTauACnS2L/u1sokjjfLnphCvrfs6CDaKyHn0R1z3vLQnp6pj71z+JOe36gxd8/3uxABzNh201dFF/HhCxythpzu5iMrkm3QXpJfqUhGlRKY65PcgDR+Rrct1Sw++VLZYM67Hwfn9dELTAL0MavVZv0V6jV8ejE1iq5kbpfkJ45rSAVtphcOSc2M4+XAF+9GuycpSlt9VVIp5Mn+ZPwGg+HN5L0GlkQ+ryoj4k0Y/3RGAYp6vOYKQ9Wkn15XwLlHjCoUD85cvdpvamQp+hIbM3ZaFchkIP2c9rZR4LU+EnXErJMPg+0G3z5URoNv2D/hKTrVr649HP3FdTq1JFquFHbgMOU2M+8tmFK8aCKo2MAMy1gYYRU6zx84EgbBB5tFpJMRhHZXCyakkfZY7QrwObC+2j6oxWa6Q11DsIa/3hSLVeGDYFs6g8z2sRPiu006CHI0fwDBI+WRQO8lQwhCC53lcXsSn97qLPeOgtt3MKpFnrPv6diAP8Rwl+rJCCs43IE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6512007)(53546011)(508600001)(6916009)(6486002)(54906003)(31686004)(38100700002)(66556008)(66946007)(66476007)(2906002)(316002)(6666004)(83380400001)(86362001)(8676002)(26005)(186003)(4326008)(2616005)(7416002)(8936002)(31696002)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QOUpVH5Ok1O6vHBTXH9c9mO7ZGga4DV3jn2yWylUBPgpJAUTzJf6++A/h0ec?=
 =?us-ascii?Q?II4/3/F3jig54HwQbUAIPRVUMgovsBPs8pwBzsdSOMflhN5KRNIG0qnhu4rk?=
 =?us-ascii?Q?vmr6uAJ16nlFVnz7Bqu1kCbKV/EBAf9DykHvCEM1F2zQPaTiqIUzHzmY5PKt?=
 =?us-ascii?Q?JUJEZjMwbWyF0LE+a0Zq3bQGv1MQtGUGfNnr1s8sylSR1DxaJGXDhpXVX7qf?=
 =?us-ascii?Q?3Jx3FoopLDON39l/BgBPuJzx8YDsWdJerszMj8W1HEZjFNGgbAkH0axOhq9i?=
 =?us-ascii?Q?4tpJA4ChdGwu/OavWW7oS1xqg9YMZvpzVylB29htWdGURwC780MaWR0zCKPX?=
 =?us-ascii?Q?gyA6GqgwHoKLHtdqcNkE4+9UVhlCWfqTpt6/Tsir9vS3IBOjABnz0TEe0o9N?=
 =?us-ascii?Q?7uDC0BTgStkAZGULQLWP24ZBPonvK64h7Ixr2HoP2DpQxUO3b5UbLiw7/WAE?=
 =?us-ascii?Q?d/jvSQW4FwDcRlgupd8dAjOUXGh7Ib9sJwNQAySNri9q6NyCP0iP/4hV/Cqh?=
 =?us-ascii?Q?G2qCoq/K+3+yTLFmpodgXo+pjVPFNMKT+YwlNyQJaIyFwu+ZexwmAD7LOvDA?=
 =?us-ascii?Q?qQvj45fE+TDheGU1lBdxMo0Dfuyy4uizzNQFWokCcGtBtkntsr55t6p8NwjS?=
 =?us-ascii?Q?AkSO7hpzyBxTYSTvBmNiXqM7hRxnlIfE+nPuVAKAqm/W3n4DZmabphgKaGrG?=
 =?us-ascii?Q?h5n23dsRbzJtuJ3FkwOoCxSbkcjCWRq7yfxJT0Q6zsbf4d9sn0VstKfpupVI?=
 =?us-ascii?Q?WKHCDiyC7dgDUv8r1/HtTntA+3jKEk02i5lhOXwtS3puNDWz4JpGtuBjgSGr?=
 =?us-ascii?Q?HU+DXJvaOu/9m3eJkCSNnOHvfyZDwEJMtAMOraViMqHN2vpf381IwmHE1WMz?=
 =?us-ascii?Q?bjUVslR4ofvkKabkHLCdUfFfnEXCe1QoLFs6knA1zCpTUHNUKNRfSvY+OmsD?=
 =?us-ascii?Q?5KEyYAAbfnixewpFzVtpbYFImEJdYxy3goie7S20p9TGQn3DKtFblCe8Bw9k?=
 =?us-ascii?Q?jbvx6mKvXgYGlNLP7zUUynxcbMk3oGbXdsBocRenrWil39RYLA/zjoAC+4TG?=
 =?us-ascii?Q?kgsguO/NVbumyk6YwO2lmNLHfOIoTTcJRqcah4P1Z/cjk4sQgU+Z+FnrpCP/?=
 =?us-ascii?Q?BS82wKb7joci+7YQrUpOQc6S0tdeikrV89Jv+tAarg5WpCiJKBGAFE7nACSs?=
 =?us-ascii?Q?Rq/2iHnPd90nwqbLWyjFryrl/3xw/9j3LvnF82VpvOTD7e6IqaVlUv8aRoYH?=
 =?us-ascii?Q?cUuumURhDdJg/JiKS55BIkhX9Q9qF8va7kiYA/z0CSHZDrVUq7G2QaLx/uMP?=
 =?us-ascii?Q?vLPYtOIZi9EEk4k6Dp8UuIsjgRpQKi3QhKFIo/DjtBtzKH7Cb+SkCRymLAHA?=
 =?us-ascii?Q?4AiTZrxA3tC6FtpxjZG+LxOd0s+J/1EILvS1GwgyBTr/cSJVIc5PAuuLu7Nd?=
 =?us-ascii?Q?qh/iqRacZAWjPEwGoZueXb4LhB8BZUJO5CMCC4BSDig2IKCxu/F8+zk2QU2F?=
 =?us-ascii?Q?CFm7ZCMBM4R5jcoZyuGf7tDX4c9Xy0SP57wGmLVUJlsPW95/B9v8PANyD2GS?=
 =?us-ascii?Q?fD0qAw1xLoxVY0w4YEUa3FzHkSZEdpQyXA0m9yk2dL1aZusgIa6m69C3RQzH?=
 =?us-ascii?Q?MG1nycjRlMsheQcMT4UnWr0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6795d9d6-977c-49ca-d3d2-08d9fb58ba4e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 07:54:35.2776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQoNrCx4bYe/UDjMPCGSDZduPorl3ahwTjMG8jSt+/bng3vHCw8Hu6WihlOyZRA5JFzcROyuEjj40aUJwt7fqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5428

On 28.02.2022 16:48, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 28, 2022 at 02:14:26PM +0100, Jan Beulich wrote:
>> On 28.02.2022 12:20, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Feb 24, 2022 at 03:16:08PM +0100, Jan Beulich wrote:
>>>> On 18.02.2022 18:29, Jane Malalane wrote:
>>>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>>>> @@ -3333,15 +3333,15 @@ static void vmx_install_vlapic_mapping(struct=
 vcpu *v)
>>>>> =20
>>>>>  void vmx_vlapic_msr_changed(struct vcpu *v)
>>>>>  {
>>>>> -    int virtualize_x2apic_mode;
>>>>> +    bool virtualize_x2apic_mode;
>>>>>      struct vlapic *vlapic =3D vcpu_vlapic(v);
>>>>>      unsigned int msr;
>>>>> =20
>>>>>      virtualize_x2apic_mode =3D ( (cpu_has_vmx_apic_reg_virt ||
>>>>>                                  cpu_has_vmx_virtual_intr_delivery) &=
&
>>>>> -                               cpu_has_vmx_virtualize_x2apic_mode );
>>>>> +                               v->domain->arch.hvm.assisted_x2apic )=
;
>>>>
>>>> Following from my comment on patch 1, I'd expect this to become a simp=
le
>>>> assignment of v->domain->arch.hvm.assisted_x2apic (at which point the
>>>> local variable could go away), just like ...
>>>
>>> I think we want to keep assisted_x{2}apic mapped to
>>> SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES and
>>> SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE respectively, so that in the
>>> future we could add further controls for
>>> SECONDARY_EXEC_APIC_REGISTER_VIRT and interrupt delivery.
>>
>> If we want to be able to control more (most?) VMX sub-features, it
>> would seem to me as if this would better be modeled accordingly
>> right away. At that point there would likely need to be VMX and SVM
>> specific controls rather than general HVM ones.
>=20
> I would have to check the AMD interface for hardware APIC
> virtualization support, I'm not sure how different the control values
> are there.
>=20
>> Plus then it might
>> make sense to match bit assignments in our interface with that in
>> the VT-x spec.
>=20
> That could work for things in secondary_exec_control, but posted
> interrupts are controlled in pin based exec control, so we would need
> to expose two different fields? Not sure it's worth the extra effort
> to match bit positions with the spec (or maybe I'm not understanding
> this correctly).
>=20
> Are you suggesting a (VMX) generic interface where the hypervisor
> exposes the raw vmx_secondary_exec_control and possibly
> vmx_pin_based_exec_control and let the toolstack play with it, setting
> in the VMCS what it gets back from the toolstack?

Not necessarily all of them, but on a case by case basis. But _where_
a control bit would appear (if supported) would be well known up front.
This wouldn't be very different from VMX'es "supports the 1-setting of"
information provided via MSRs. The hypervisor would indicate which of
the bits can be controlled on a per-guest basis.

Jan


