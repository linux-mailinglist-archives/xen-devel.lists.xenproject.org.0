Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6F54F60BF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 16:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299905.511220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6Jq-0000Yg-25; Wed, 06 Apr 2022 14:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299905.511220; Wed, 06 Apr 2022 14:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6Jp-0000WR-Ub; Wed, 06 Apr 2022 14:07:33 +0000
Received: by outflank-mailman (input) for mailman id 299905;
 Wed, 06 Apr 2022 14:07:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc6Jo-0000WE-CP
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 14:07:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5ea19ae-b5b2-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 16:07:31 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-Ym77vU_qMdWEBj7YMIHIhQ-1; Wed, 06 Apr 2022 16:07:29 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0401MB2474.eurprd04.prod.outlook.com (2603:10a6:3:81::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 14:07:27 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 14:07:27 +0000
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
X-Inumbo-ID: e5ea19ae-b5b2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649254050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E5bh+ey1Rw5u5rRXtK5jEsLHmYFwyFby8P88zX/4yGM=;
	b=LUX0n8+GoiSROzmUhCBL/Y9BCrhz5UxA6YUf8paizKEx6WPCIdZx3cv7gnU/Op1a5lTpJJ
	cLrgIVTfvsjk47ffRSGQPlw8DIB7+0NsNfvALfYIOJKMVa2JGgq9BZXDCxtsUARp5drIfG
	OlYgzq/KGVT443fSeQt/nUcg/5zxyV0=
X-MC-Unique: Ym77vU_qMdWEBj7YMIHIhQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBKrbYFWsHpQmOCn7fADLUaAnCxIHLbKKNt51mUedXHrpB0m1l7BIW2PoTW8FqdeWsRQZO+dfmA0FWAsB77ihEpqe7tK6+wmcdbPxhf/dXaZJHw28oEqDgLkSgAe5Wo7RE5znkgEjeqRaO+IgqsYm/xB3zXa2d9Lb5k7+cckmWk4/wRuUFW/GtYU8JadH7XwKNHOQ6E5tU+W8aRxnlme6SNfg+WndmB9HdB06mxTkxVIPtVxfPYkYGLWmLtJVQJ35aa2+Ss3jkY/ISbhJRUBcGkHHs5RB3MAL1mSlYyRL/EhHMTwq57YD7Fhhm/JRePnWYjfG/PgRhj7dhHWtKGZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GI6es+cDM5BD7wofvnJq9gfMD7EOKxjxaWmlkahmBHY=;
 b=AKsRdr0paUsm8b7F8NNUggOJkn/935wpuIesekO78kbYUEyDzOwN5WSN4+fmFqivCtLryZBMdV+V/KgkpzmekxIF6yVAZ1/k8+/r7PH0FkkEUGRrjiqas/O69Il0BaIvtmCmgsxp69cYOsY80Nks7nRvJXPetLdJBTersFWLxeqr2W8vjBEBkzbXvBPH7UMoluK96xvmmoLfGugyfMMzaeb7nuxZiOBcpv9WVcX/tKucpKwAy0cQV2ZdHLkDLpDsi6LbM7idmNmqf25glz3Tqod1QnG8pFtjCmoO3fNm/ukNgvGsLDAlrlqnsT2tjaGmaKCZeWy7qAUNon8l2+LiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ffad005c-d6b9-9f27-9b5b-4f6d7345c81a@suse.com>
Date: Wed, 6 Apr 2022 16:07:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] VT-d: avoid NULL deref on
 domain_context_mapping_one() error paths
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e17b98ee-8d84-512b-6403-26c7b2ee1eb5@suse.com>
 <d232b6bd-17d2-c78f-49e1-67ffc2502810@suse.com>
 <Yk2XcUhUn0BYk3lA@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yk2XcUhUn0BYk3lA@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0502CA0047.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::24) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf2c0f85-0bef-4bf8-d94f-08da17d6c7ca
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2474:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB24749FB9714883D1C6BCA144B3E79@HE1PR0401MB2474.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gV5Ayl/4Q409hTn0dUwYFsS+zpP9m0E6DqFT/zeIK625ZYfDyW8Wo/hO0DuIYaJ99FdEl+EZxNsuwgfoJdnlDwh2JKBlBIs/6od6U9xn+tK9n85WFGuEkszI+V1tx8yV0TmbsD/omrDENkuR8JB5xzdFC4iUVKQieALFDkfn4qszhMwO3V4m0N83N4g6HgEAazX8wYPg8mGIQNZrPuIcSAW6Y3GcmsP1+nIlVN1nIqWInAj4/YKs0CufybdtsNmsG+0zWX7x53IhX/eYKiRT/nqqN1MlZyyyAXK6ELGEfxnn/4cSZBsunEUdkFQRPlPi4bOjWcfUZ3pwi/nvlQ2tSjRnHUX7w40zXjh85N99bQgCGRLqHZ8lH4K4xrgODk6mfdl+2QzoxQZXC/q3YSSbAaF6HYvYbMGieKWNHKU6trDR1Lc54uAowceKUeuj5pBfr7MWF/tcZeR2WFmjThpvK+2TtEdC9Zn0R9XRW8IsiMCn20NEx2nhshmDwgPVDhDC2XTsa+jozU7eCvsQyoG1AqcBexTQErE2af5scbda/ADxo78uPBDRspdX53SSxAaYuDAeL7boFsgoE8PosjPS14wNspLghMdxeDgSyXdo6oU5OAIlYdFcOMFZotFnbITGmcGY2PkMKJ6ou/KVEuO36mFcAXl9ciphNR9cBtCIO9Qsnu+xquT6XB1K5N68+0dmkBVbFhR0Z8eogUdVOcPEKDVEA1RsLOCinDb/GqzZ0eQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(66476007)(8676002)(54906003)(6486002)(6512007)(31686004)(316002)(6666004)(4326008)(508600001)(6506007)(5660300002)(186003)(53546011)(83380400001)(26005)(66556008)(36756003)(66946007)(38100700002)(2616005)(86362001)(2906002)(31696002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I8tR9W/dpoPvPTKKxVvzdkIkppzzJmy2HddLnZGc9zXv3mpHhwCmiCLutwRh?=
 =?us-ascii?Q?YgqbifWDt1tV6dswTr42f/k/7iMpS193WmVe68PTg0OTcuN17MWDpezB1sj/?=
 =?us-ascii?Q?L7j0QyrckaCLcnbs+uf6GK8E1w7vdMLRXUfAErnh2Uruq2LEdNUySLWUtKBp?=
 =?us-ascii?Q?8pRhBNbeKb/ExXo1K6R1n2Fd/iv204IqHg6peu8bcl5THGOI3igevmH4HTf6?=
 =?us-ascii?Q?FyliOfDt/nvnscXEvawuadr2WqLDOZJQpeYVLM5ktx7+zN9Y4CMCHxNR0yKb?=
 =?us-ascii?Q?3w09Wk37sssyzQ6lAHfkMeZ8zvOF8ipmDgLMGb29jndaDUqimUgD4tD0wzuR?=
 =?us-ascii?Q?cvgoIj5AjqZBHD7hHxblevj+5odhGDs0CdKExSMz/kkh+J6LxMYSmvY7mxXr?=
 =?us-ascii?Q?tAH2J73dY0fx5XaFNfrgYAWcDvGK5h24M74uSEp+gyRd8VuWDRnCsl1/m4/2?=
 =?us-ascii?Q?ENqKeVMZ/R5SGMMooV1OqQFlKi1IbfiHwOrgkZlQV0XpMgMxAGc3cNKQ27lS?=
 =?us-ascii?Q?qoP9U1HJWbMbPTnCqFVqSDoW83823jSkgkCbnzR2vODMptFQCHOgYZmcudt7?=
 =?us-ascii?Q?utS0ETys9u+yh2qUbOxRfIeLrBClMJQHZ+3c8SPcN/YiqBp2NN14QjFqblyF?=
 =?us-ascii?Q?QNT1USy4jcQx/T8lgZJBtRsd0ai/6MVn653KnFcN6TfZHK0uLgCa9+JgCqSq?=
 =?us-ascii?Q?/Qn6HOjHIGkqNXwbAlWCsnmAZsz5kXRf5kyRIjEx3jrMfMnolzOlsDUVovKC?=
 =?us-ascii?Q?eN/xD6aYpAeXAoJtCwpcM+65/fN1dHlLWHhapYvy63qdHjxE73KWjqO7wZtF?=
 =?us-ascii?Q?Pgo9OPYxJFKyO6gFmR35vC9E+yBfTg7qbeSI7tWSVFPp1zatyfB4CWo+pZ6q?=
 =?us-ascii?Q?2MELLVtInVvNsMsOE2nQc0T5WgSlG5xRyK//5RiwATDO22JMuH7+sqbZeOfL?=
 =?us-ascii?Q?xiFJgWn2GGO6SEN7VEGAfU5ERpeUmQdTwsi5L4/fpib6HwJYM+7jWP2RG86l?=
 =?us-ascii?Q?/OBcY7rgpqNI1XOpwn+iyq39/D5MFI5t5Tr1LnIoE+B63Cocje17nkDXwlcy?=
 =?us-ascii?Q?3FmOPGvFLNqSBVh5v5XODeAaWna6kFoYuQGgUq2L5lAA7ub7mdOFYM/aGhoq?=
 =?us-ascii?Q?s1UIF0yrWzQAELMACcaqvPc4BQTPnFMdoqMViL5eVmYUHj+3R1D0CAw9sRn2?=
 =?us-ascii?Q?nKjpWjBoVqblrQ/LDFIINTcC/tkBXx0PRKpM5hczBCzRebm8RTcYiCyAd3/3?=
 =?us-ascii?Q?yng6XaunDiTdoqBeAczrc/GNozSLz3wh+LPLa0UEdk2yHjDjS0m1RXBmXo3K?=
 =?us-ascii?Q?6afVY532rtpIDwMdHXzUtDfM75X8G7GnP3uc+5/QR7Ika9rnIAWgJOwrPSZL?=
 =?us-ascii?Q?5hfo/ZaHtIK/RpV1zqKt/u6E0/ALWI0J8+Kq1RJV6m+QiJzUqE/PzyytXlLm?=
 =?us-ascii?Q?/0Cw8kmpCfwmFKyMuKeQQ5sll6dtw7lN+Gnyv+xfmb1N5klkktUGEDWEQWa9?=
 =?us-ascii?Q?iTEzXqDm1huvF4CZRvfqdExKgh/v7bFto0aRl0949afbOSkVA8xcNZeo7Yy7?=
 =?us-ascii?Q?b8KEDMhRO4RXFfBgai/9AEff0Yu8kC5f7LDR4rmHHnwWyHKUMg+FXc/nH6TP?=
 =?us-ascii?Q?I2DQvE432co7tVFfhe8Dgkzudc6zFEFvnDJJj1a+aAlAstUSK2DkqwwNROBx?=
 =?us-ascii?Q?NZvaeZUckx+vDuqvsnv+Dp5RRskvUyDkeZzHHAuDxVXVK3MNtv9ECrJTmyxr?=
 =?us-ascii?Q?WOkDGSmdhA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2c0f85-0bef-4bf8-d94f-08da17d6c7ca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 14:07:27.0152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FP/b2C1O+F20AmY+27AUwStrB9q4CpmJkL1NoMs3VPj/+5Yts1D87743kq5+WxpZrdsJ3U1Mrikr22Ag3f839w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2474

On 06.04.2022 15:36, Roger Pau Monn=C3=A9 wrote:
> On Wed, Apr 06, 2022 at 02:24:32PM +0200, Jan Beulich wrote:
>> First there's a printk() which actually wrongly uses pdev in the first
>> place: We want to log the coordinates of the (perhaps fake) device
>> acted upon, which may not be pdev.
>>
>> Then it was quite pointless for eb19326a328d ("VT-d: prepare for per-
>> device quarantine page tables (part I)") to add a domid_t parameter to
>> domain_context_unmap_one(): It's only used to pass back here via
>> me_wifi_quirk() -> map_me_phantom_function(). Drop the parameter again.
>>
>> Finally there's the invocation of domain_context_mapping_one(), which
>> needs to be passed the correct domain ID. Avoid taking that path when
>> pdev is NULL and the quarantine state is what would need restoring to.
>> This means we can't security-support PCI devices with RMRRs (if such
>> exist in practice) any longer.
>>
>> Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
>> Fixes: 14dd241aad8a ("IOMMU/x86: use per-device page tables for quaranti=
ning")
>> Coverity ID: 1503784
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -750,6 +750,10 @@ However, this feature can still confer s
>>  when used to remove drivers and backends from domain 0
>>  (i.e., Driver Domains).
>> =20
>> +On VT-d (Intel hardware) passing through plain PCI (or PCI-X) devices
>> +when they have associated Reserved Memory Regions (RMRRs)
>> +is not security supported, if such a combination exists in the first pl=
ace.
>=20
> Hm, I think this could be confusing from a user PoV.  It's my
> understanding you want to differentiate between DEV_TYPE_PCIe_ENDPOINT
> and DEV_TYPE_PCI device types, so maybe we could use:
>=20
> "On VT-d (Intel hardware) passing through non PCI Express devices with
> associated Reserved Memory Regions (RMRRs) is not supported."
>=20
> AFAICT domain_context_mapping will already prevent this from happening
> by returning -EOPNOTSUPP (see the DEV_TYPE_PCI case handling).

Hmm. I did look at that code while writing the patch, but I didn't
draw the same conclusion. I'd like to tie the security support
statement to what could technically be made work. IOW I don't like
to say "not supported"; I'd like to stick to "not security
supported", which won't change even if that -EOPNOTSUPP path would
be replaced by a proper implementation. Even adding a sentence to
say this doesn't even work at present would seem to me to go too
far: Such a sentence would easily be forgotten if the situation
changed. But I'd be willing to add such an auxiliary statement as
a compromise.

As to "plain PCI (or PCI-X)" vs "non PCI Express" - while I prefer
to avoid a negation there, I'd be okay to switch if that's deemed
better for potential readers.

>> @@ -1601,9 +1601,13 @@ int domain_context_mapping_one(
>> =20
>>      if ( rc )
>>      {
>> -        if ( !prev_dom )
>> -            ret =3D domain_context_unmap_one(domain, iommu, bus, devfn,
>> -                                           DEVICE_DOMID(domain, pdev));
>> +        if ( !prev_dom ||
>> +             /*
>> +              * Unmapping here means PCI devices with RMRRs (if such ex=
ist)
>> +              * will cause problems if such a region was actually acces=
sed.
>> +              */
>> +             (prev_dom =3D=3D dom_io && !pdev) )
>=20
> Maybe I'm reading this wrong, but plain PCI devices with RMRRs are
> only allowed to be assigned to the hardware domain, and won't be able
> to be reassigned afterwards.  It would be fine to unmap
> unconditionally if !prev_dom or !pdev?  As calls with !pdev only
> happening for phantom functions or bridge devices.

Like with the support statement, I'd prefer this code to be independent
of the (perhaps temporary) decision to not allow certain assignments.

Since you mention phantom functions: Aiui their mapping operations will
be done with a non-NULL pdev, unless of course they're phantom functions
associated with a non-PCIe device (in which case the same secondary
mappings with a NULL pdev would occur - imo pointlessly, as it would
be the same bridge and the same secondary bus as for the actual device;
I'm under the impression that error handling may not work properly when
such redundant mappings occur).

Jan


