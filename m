Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FAD51A0A1
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 15:20:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320735.541617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmEuZ-0003LC-As; Wed, 04 May 2022 13:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320735.541617; Wed, 04 May 2022 13:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmEuZ-0003IK-71; Wed, 04 May 2022 13:19:23 +0000
Received: by outflank-mailman (input) for mailman id 320735;
 Wed, 04 May 2022 13:19:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmEuY-0003IE-K7
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 13:19:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cef08fa4-cbac-11ec-a406-831a346695d4;
 Wed, 04 May 2022 15:19:21 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-2eZzxAFaOk-HwyhaOhjL_w-2; Wed, 04 May 2022 15:19:19 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB6217.eurprd04.prod.outlook.com (2603:10a6:10:c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 13:19:18 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 4 May 2022
 13:19:18 +0000
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
X-Inumbo-ID: cef08fa4-cbac-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651670360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=brOLFC9YKlUYWyAcAQIjbfZrHhyNPEPuAEN42KEly30=;
	b=nnfm7bX1Snov8wGkG3/1eusUbrIiptySXfCCL1TGQY5jwCIRQ3p4hseFRE0mn6si/Rm5NT
	xKTh6yuphBo4Mgz2O6Y1Io9+4vld73shFPDpKr09/V4yD1jm70zeCxuSD+PBhxCGqyx8jY
	VNgWrksOl1oOZU3KivbRzNdcr0ImLYQ=
X-MC-Unique: 2eZzxAFaOk-HwyhaOhjL_w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5QzvFr1BFpvk6Y08TYMJxTQezJVVmarXWbCoqZcc+c/q4HIpHu5oVGc+sY+MjURvXchRn+jlB1vvY2xGntAVM3Y2sE+TpKe4ds4tPbxHMRG5ig0jnz3T4UvqYb6EDumeyspUq8XkdpcGwXNge9kpQg3plxt4nRajoHD2X1y8yN+gItyal9FYRuGlYPDxY/xAx0rNDv1FhqYicAtFPDisPeaMFQCfbIp5F+xTv2fQD3as0uqnrHnauUAbBdeOewwFWy8NXdBEqejYk2BWXJvfXkZlTj6IpZ5QSnXqkyysZ1yWozp5Oo8ZVebNAFV211qvVHhwDj58eCkKftVPYCKwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIegK4KQyJkiHm0c3sXrkiucNtnTVk8d6mJ1eMXyT9k=;
 b=MqLbC+TG3FP8xG3SWH+1oWgu6+cqSYsTM79sAInC++oUUgkvs9+jbeGJG7u7TE8SYEK2bNJR03mebSEarGANvQEGgYES6UtPyAcch/0oA1MAk4EvRoYdKA4qj+a50/XTEoMZI2RMSRHG7/PVDwUtWggiGY6d2c4VDBXYgZz8NCOfDTkTx3m/4fChiph5FYTxMekHvqCORs7UuHdeN8ljeut8ix+PrdEjRq1PLuxT2M753vmQNLSeEgc3+byoSQysjgA683wQwpNDkSgfPVhAv6J0wZPiyhfxBwubsj1YBsX0EMvw5mHlAFFzCYP/PYtrBulYoiCmmsrtVvP0RkeZ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66587a43-02b8-20c6-2663-4a6fc3e010e2@suse.com>
Date: Wed, 4 May 2022 15:19:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 05/21] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <5cb4dc1b-f6b0-89cc-e21c-a27a5daf0290@suse.com>
 <YnEngsDG9BiiyzXj@Air-de-Roger>
 <6ffd48ee-9356-2f22-415e-03e172eabb55@suse.com>
 <6f45248b-2f49-0834-e801-d298ea680a33@suse.com>
 <YnJV3EYq7E+4ajPN@Air-de-Roger>
 <e40d5b56-e52c-34fc-fcfb-ebf136135271@suse.com>
 <YnJrBNkGl8Em0gTN@Air-de-Roger>
 <fa6e35ac-66f9-76f2-1dd7-f1175c65e3cd@suse.com>
 <YnJ5AeB0k4SQ4hhI@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnJ5AeB0k4SQ4hhI@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0155.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::29) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 476f4aa8-8c94-45ce-9fd8-08da2dd0b185
X-MS-TrafficTypeDiagnostic: DBBPR04MB6217:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB62173C1EAEC4282962D79D6EB3C39@DBBPR04MB6217.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UnZPgLD0p0ev1kHdjmDwQrp5TVdQnwBVwIDY+IQGCmamz0QxfNd3tdXCk1KbuHyfJHjbraWsA2LZhSKmn2EsSvICtLJvz70AyYrMaDSzKUH7aQQDKE/T7gqnCWa8vNJJs72tzhzg32B6SUGyX3VAQPkTLENw37E31qc/M0nztvOPK39EKys3vIuOi/YPbs+ErsYlypoLRa/rz3KPxAn3HG6XO30fT7atvAl7PZGH6fxMsrSVPGghmNHqFZZ+BDJyLOUU6q+lcn+XTSGQXr9/xTGtlgkvfGpg+wRVlGVcEIQev8vWEAOrI2+vrHRhReC+/8j30o2KS7fzCLKrpMWIEndrAqCSHUQrY31gC3GOHtjexa+vR5DppXAoKqlJbGKHemGfcZ73z4qyjFeTeFKYNjHIk8Fmy8qXJTzK3uONUUm+J9PGON4SM1pEdGhYkmPaowgZear+EQTp1Bq0Ew+6loXbfjhBUDtqh6PtgK4Une5JoyxRcb56xJQbNkFnyYtmHjx4gCvmloeDIbI/q55U6CVHYm2OVAZysj1E47uEw9smYtrpi8eqN7XE2eVbhDGntmm07cbiVDwweZPdE8js5l32jikGMDT/FfkcVFBCH+9qEhkWtHw778Ws+A8n0OLs0QS+oQwVLhrxyOZti7c7RJdd4LIplOoBsRk9VWPD8VPLuQxZtSy1nNNAYgXsHZZbcgQRMtHs18erfCfgn1VW7zNncYwXN0yvvdLl1iDbgFeeFICeBMfMc05xDEH+Wzfk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(5660300002)(6506007)(53546011)(186003)(316002)(6486002)(36756003)(508600001)(2906002)(31686004)(8936002)(86362001)(54906003)(6916009)(38100700002)(31696002)(66946007)(66556008)(66476007)(8676002)(4326008)(6512007)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?65El8MF4NeaWFWkSumL7KPbw4psSWra0CXRoVopLt6qBjVutMLIedLtC7JYb?=
 =?us-ascii?Q?jISiHgEnNmyznL+C6ed2Gx80YgNoeN5aNebZbHcep5KnsFzNs1lOVLLyF3dJ?=
 =?us-ascii?Q?Syt91El+T1nzFX5MSV7RVnUDtXZEPZysEeB4Rr6kbJiiryYRBTDneK37ts4m?=
 =?us-ascii?Q?K5Tt0RuauaQON1wLRnIBF4gEFRAb6O+oblNeyHTQPPWCpB6rejxR8FysPHcO?=
 =?us-ascii?Q?vXZbhapPcl9vso4WiJP/s8NxC88MDdVW2R2/bny3CTOQ7oczWmq/Dv/fnQjj?=
 =?us-ascii?Q?NE1hUb/LwN8Eiv+Z4qXMvTpfQQbi4sT/RcRKn+o42qEWuV0kqbFeYQQie1gv?=
 =?us-ascii?Q?5AtKyTGw/8ECzJ5ZXLjd38pnvHG4btQBXxXrxTjyzGyV7a8XNRvYuNFPYKo7?=
 =?us-ascii?Q?IYj2IQY8oAQvvYD70d4j8RPX4yD1jhOFIDccsZ6fc7J/+ED3Dlmxeltqr4O3?=
 =?us-ascii?Q?T6V/hLNJPhy2AId8MNfndDR/TpBFh5SJVQu6evlAU6Bco+z3GJhgybKRnYmq?=
 =?us-ascii?Q?2TmIarKnlN6koZBZM3Epx9caFXgaLsIRVnzd8vy0FGiYJ5RdufbrfRsV7Jog?=
 =?us-ascii?Q?C90VJFxVyLUYo0iQ39ZedbXZGdStv1u6EObw2W/uasGowx4KbqqST8jfhLC7?=
 =?us-ascii?Q?2A3D3mTw3kciBQ3US79Ec7T1n/9e3W7H4RB0Pw7UDozLoApLlvO6BWvk17k/?=
 =?us-ascii?Q?ctsgY63iYFGCIFTv3+P72fSDeqS/Fa4724DMOBZvk6HFjTjGGMdrlXdIMLwT?=
 =?us-ascii?Q?3Wmqk5B0/fLtAJJ1U6+piHl0a/15d3hQWfadYl6MRVvzkMglUTFzulEw95W9?=
 =?us-ascii?Q?OzS6V+uL2/AZD1M01QY5hCDJ+ryCLv6reqDth/EfuvcBil9arKAIvSQBlHDH?=
 =?us-ascii?Q?DkyGXJziR0yoYmCvUItwlic1X3KA1ta8tQsN90khwOAwXx4mwzyXKMjDzqud?=
 =?us-ascii?Q?1Z8HUGFbwyOydN0mDY7gLo1h/4JPUg0QAx7hoNzlFhQkLrTB0xBt8d8ri5jV?=
 =?us-ascii?Q?2dBl8whoN6wPRBJ8lkiYZ6vi7eir/ffaj12qRV7+pP//pGG3dPzUJ2Z1Hi8A?=
 =?us-ascii?Q?NDEYzRfzVuBcutvqnZ4u8nqEmjp0kj6jU2j0EmbN8poa36iz1lYG0ZGsYVbD?=
 =?us-ascii?Q?tDJ66Numo7+BNmq+DKaHbgAXTqNRm3I/pG23cUmym/c0BdNfXmZfyECRD2Su?=
 =?us-ascii?Q?T9HrWJDwXdF6rvymlBK4I/2p8yrdpk/+CPn4znSIQRMIOT314OYkW1jqkmUt?=
 =?us-ascii?Q?nBu23WRk0qBs+6ALQwJx/Qo4qQKIQBeSq9S0ZjJFIZbfsmyqj9OzSoNuZNLV?=
 =?us-ascii?Q?ig42+zgN12FvFEmSl3S5n6Rm+8ho5REPpuJ+ZtjTmhlmwmmiFWVUuIITj7KW?=
 =?us-ascii?Q?Eo+6yl1z4a/kceudznrsGTtdze7KWm2t3C9DHT+FHbb167q14z7EjlVqVxrs?=
 =?us-ascii?Q?K997r8eqIwEHsMILu33fwBLSw1zwF+rYOtbVnYlLnYeYQCokpKzrOFyb68cm?=
 =?us-ascii?Q?Gjk5GGV5y3iIxjA6J6FT4ESkOXEjqoOFdyqNHweAlJJ/ngQzwAjdKF8H56sj?=
 =?us-ascii?Q?CJBX08oM16+WIosAPcR1GUqC85yrtsIovVLumKeVrUmM4DiBrx078IcNOd13?=
 =?us-ascii?Q?jN8fpgzz3N8PhBixIVRu/5UFOmu54UKCSrOaXtp88LZSWsJmgxkw8WKOMysj?=
 =?us-ascii?Q?z+kMlNVigLpIOytRHfFr0DDZDS4+nlK8cfs/RD+3cQrbORCvbLVtXcWChzw+?=
 =?us-ascii?Q?8+rncS/h+w=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476f4aa8-8c94-45ce-9fd8-08da2dd0b185
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:19:18.2211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yGw1rgAQqjSTQdemUnE7KUDp0HQf0HekCbEkcRsEoVSScGHM24rYcCgiiiQW6DGKXw1XwLTEk/8Oz/48hKn8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6217

On 04.05.2022 15:00, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 04, 2022 at 02:12:58PM +0200, Jan Beulich wrote:
>> On 04.05.2022 14:01, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, May 04, 2022 at 12:51:25PM +0200, Jan Beulich wrote:
>>>> On 04.05.2022 12:30, Roger Pau Monn=C3=A9 wrote:
>>>>> Right, ->iomem_caps is indeed too wide for our purpose.  What
>>>>> about using something like:
>>>>>
>>>>> else if ( is_pv_domain(d) )
>>>>> {
>>>>>     if ( !iomem_access_permitted(d, pfn, pfn) )
>>>>>         return 0;
>>>>
>>>> We can't return 0 here (as RAM pages also make it here when
>>>> !iommu_hwdom_strict), so I can at best take this as a vague outline
>>>> of what you really mean. And I don't want to rely on RAM pages being
>>>> (imo wrongly) represented by set bits in Dom0's iomem_caps.
>>>
>>> Well, yes, my suggestion was taking into account that ->iomem_caps for
>>> dom0 has mostly holes for things that shouldn't be mapped, but
>>> otherwise contains everything else as allowed (including RAM).
>>>
>>> We could instead do:
>>>
>>> else if ( is_pv_domain(d) && type !=3D RAM_TYPE_CONVENTIONAL )
>>> {
>>>     ...
>>>
>>> So that we don't rely on RAM being 'allowed' in ->iomem_caps?
>>
>> This would feel to me like excess special casing.
>=20
> What about placing this in the 'default:' label on the type switch a
> bit above?

I'd really like to stick to the present layout of where the special
casing is done, with PV and PVH logic at least next to each other. I
continue to think the construct I suggested (still visible below)
would do.

>>>>>     if ( rangeset_contains_singleton(mmio_ro_ranges, pfn) )
>>>>>         return IOMMUF_readable;
>>>>> }
>>>>>
>>>>> That would get us a bit closer to allowed CPU side mappings, and we
>>>>> don't need to special case IO-APIC or HPET addresses as those are
>>>>> already added to ->iomem_caps or mmio_ro_ranges respectively by
>>>>> dom0_setup_permissions().
>>>>
>>>> This won't fit in a region of code framed by a (split) comment
>>>> saying "Check that it doesn't overlap with ...". Hence if anything
>>>> I could put something like this further down. Yet even then the
>>>> question remains what to do with ranges which pass
>>>> iomem_access_permitted() but
>>>> - aren't really MMIO,
>>>> - are inside MMCFG,
>>>> - are otherwise special.
>>>>
>>>> Or did you perhaps mean to suggest something like
>>>>
>>>> else if ( is_pv_domain(d) && iomem_access_permitted(d, pfn, pfn) &&
>>>>           rangeset_contains_singleton(mmio_ro_ranges, pfn) )
>>>>     return IOMMUF_readable;
>>>
>>> I don't think this would be fully correct, as we would still allow
>>> mappings of IO-APIC pages explicitly banned in ->iomem_caps by not
>>> handling those?
>>
>> CPU side mappings don't deal with the IO-APICs specifically. They only
>> care about iomem_caps and mmio_ro_ranges. Hence explicitly banned
>> IO-APIC pages cannot be mapped there either. (Of course we only do
>> such banning if IO-APIC pages weren't possible to represent in
>> mmio_ro_ranges, which should effectively be never.)
>=20
> I think I haven't expressed myself correctly.
>=20
> This construct won't return 0 for pfns not in iomem_caps, and hence
> could allow mapping of addresses not in iomem_caps?

I'm afraid I don't understand: There's an iomem_access_permitted()
in the conditional. How would this allow mapping pages outside of
iomem_caps? The default case higher up has already forced perms to
zero for any non-RAM page (unless iommu_hwdom_inclusive).

>>>> ? Then there would only remain the question of whether mapping r/o
>>>> MMCFG pages is okay (I don't think it is), but that could then be
>>>> special-cased similar to what's done further down for vPCI (by not
>>>> returning in the "else if", but merely updating "perms").
>>>
>>> Well part of the point of this is to make CPU and Device mappings
>>> more similar.  I don't think devices have any business in poking at
>>> the MMCFG range, so it's fine to explicitly ban that range.  But I
>>> would have also said the same for IO-APIC pages, so I'm unsure why are
>>> IO-APIC pages fine to be mapped RO, but not the MMCFG range.
>>
>> I wouldn't have wanted to allow r/o mappings of the IO-APICs, but
>> Linux plus the ACPI tables of certain vendors require us to permit
>> this. If we didn't, Dom0 would crash there during boot.
>=20
> Right, but those are required for the CPU only.  I think it's a fine
> goal to try to have similar mappings for CPU and Devices, and then
> that would also cover MMCFG in the PV case.  Or else it fine to assume
> CPU vs Device mappings will be slightly different, and then don't add
> any mappings for IO-APIC, HPET or MMCFG to the Device page tables
> (likely there's more that could be added here).

It being different is what Andrew looks to strongly dislike. And I agree
with this up to a certain point, i.e. I'm having a hard time seeing why
we should put in MMCFG mappings just for this reason. But if consensus
was that consistency across all types of MMIO is the goal, then I could
live with also making MMCFG mappings ...

Jan


