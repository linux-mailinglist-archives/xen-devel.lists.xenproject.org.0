Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3163C530E81
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 13:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335828.560031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt5s7-0003fm-Ab; Mon, 23 May 2022 11:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335828.560031; Mon, 23 May 2022 11:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt5s7-0003dQ-6w; Mon, 23 May 2022 11:05:11 +0000
Received: by outflank-mailman (input) for mailman id 335828;
 Mon, 23 May 2022 11:05:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nt5s6-0003dK-A5
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 11:05:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 358fe29f-da88-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 13:05:09 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-Ok8ZnDo1P3eO9nJqtggemQ-1; Mon, 23 May 2022 13:05:07 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8765.eurprd04.prod.outlook.com (2603:10a6:102:20c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 11:05:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 11:05:06 +0000
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
X-Inumbo-ID: 358fe29f-da88-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653303908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hKRSySOYehnReLELVDpxuSoWopnYBrwiSBIK4eDBNuU=;
	b=mz0X38cF9gcEUt7eJXzO3kJ49Vkuc4064qLy5TfZWlmNgW8WAYx1MiFmfbCeP851s1EY2k
	xogvgjSWFLMGEJz8FJKiOggBgGYVU1x5Zuvm+y3j2fygGwLYIyn40UOw8Uv2WrWk/Mghee
	/9QwVCFfuhpuh+mFLGQ6bieRAiD10b4=
X-MC-Unique: Ok8ZnDo1P3eO9nJqtggemQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtNcHfw3xh5RcZBH0ehBCv0k5VXQXPUo/TNcR7HoFT0FsLsLeM94qJ0oDas8LvqYWcZnHg4efcUfmCXWNth692MSl5r1bxDFSNWgalYR3GbTNgbtV923CvDbtIg8q86/hY3lNo2z1uVfTjpnE1Y+jkZUsfrhGYEzTCFHf5xSOQ4Xvx7qazshIs1upjlfH+c3r0dvuDvipC9xZNRoQtsKdKEUceEUfLcG/9s25Dr9EcTOxqlGhRguTP3AAiJ5qnAuDFe3fBzBWtXUB5cpZU5/glWGcfq/rT25b3clWZp8Uq1jrPn/C4MGYorAw0mo0A4sBvdDd2wVD3zc/MTT9U1jFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzIVZMyoi35U2KDDaBp06NfhSwNDMnKJNXfExSzbGXE=;
 b=MjdGvhZ8LrlaVddQvWTmn5zMpZCwiFd5efcc+RyqIMhPRKV9sk7sNkNyAtOUg55xSkPKTUCFbJUDCq1+v8nKcvDPkMwgcf6V74yoAHGNW9qPDzXVyfx0gJsP93xdDpysNPcCYoEXK+5X2DdXQdIPq5iR6VOqSiozP8zhYVo3a3D+St+6Zpo4yKJn1bWiCAXqP3YxleFrRuhwiFV8xP8P+rDdtmsSDovAI2tQgBceA4fti5tPU1Hrk8yVyq9qXj0vgixzmsVlEz3dO9hcSXi0tgESMIjZsd6aFwhilsSBKpwG36ILHzZwdVZCAbzsli5YmEHC/Bv8tv6E6SNoGG3B+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab4c8582-70f5-90f6-e300-d80bdc81714d@suse.com>
Date: Mon, 23 May 2022 13:05:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 1/6] xen: implement byteswap
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Lin Liu <lin.liu@citrix.com>
References: <cover.1653295437.git.lin.liu@citrix.com>
 <89b15afe026a84748ac0d9ca28e8608085454e78.1653295437.git.lin.liu@citrix.com>
 <YotcxufG467QSLab@Air-de-Roger>
 <4ed6ac07-b6c1-e7cf-b8f8-154da425357e@suse.com>
In-Reply-To: <4ed6ac07-b6c1-e7cf-b8f8-154da425357e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0136.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ea3ba44-b897-464c-fddc-08da3cac17e4
X-MS-TrafficTypeDiagnostic: PAXPR04MB8765:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB87659388E910A1D0DBAEED6DB3D49@PAXPR04MB8765.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	odp4ImXSzjifHEiHDrrE1wvBWVocjYhPm2NyyvUt4NuzTxI4NPKwYidHWTYQwnjcQ+XLrW8E+4D/KGcAoitM1V63Lgj6rCYKw5mq8Ws26UR3bVp1AZqIxdhCHuj+dHKZUWWiwDiJYI1a382zxBAJyUxVEc/ENJbOzl+K9IX/2CCQIhL+0A7dN7AiMlq5sPWt/frA2/viEDfNh1TFkScUEY0iKzYbJmBQGxcIyYoPaEDczFuqutxCCn8NU1uu5Pog1YbgJ52rVeg0i3wu4Lt7bxZ1OV4iD0pfwm71oYYO99pjivFX82xu6qVB0t9L1yiXx7hB1x8IkE3bheZ9zZCCe1X2V2+UVZqsmfavzxELKWO9OZVkOQDR08Eo3PzGBA9vxMsTg4IXDssGGvOf0OzNI9d+BrMCIdMM8/jwDFJPzwDU1cbfJGen6d1MUlVxWFw/xoYDvbnGWNZ/U1UyLx3FP49Jj64POhmOs5V2zQfCj630rlLa7ovidhv+wPZkedHh21u8sTQOFMZXku6lOoYgxu7JlsFlnQlb2J4JwluOvaoWohrYyKBHWlNGAl827ZmuZymySy60G/1k5Q5lQWetNmNrBltkjFOsKYBFXs9v+wtIa4AZhy0pZInzjgdjQeCLsostWrR4kaTLaUbuVTvdFRxBgVmkr4uLQ6+fSxzPsaVjqLB7tGLz/hYQNF76sl7rQUARRF/orEOg3Qe/m/ZrlcWvoqSs9fbfyn/2ULXe3V6Ax8xMuL8WgH65FBRePuR0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(26005)(6512007)(316002)(6506007)(54906003)(53546011)(83380400001)(6916009)(186003)(31686004)(36756003)(66946007)(66556008)(66476007)(8676002)(6486002)(8936002)(508600001)(4326008)(7416002)(5660300002)(4744005)(38100700002)(31696002)(86362001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iFkY88L/Y8C+oC9FAlNxZbMJ39R/LAHdFKy0IgXfs8I5LMRZVbr7nQ9W77n+?=
 =?us-ascii?Q?QRgOY9V5RTsF89/Y7JVTqYvq9WzkQlK/jyN6L/gnPfZf9N+i9orD3c4hgB3/?=
 =?us-ascii?Q?dlxfeN488uvtMDR2lRz0048KXmfcWdkYMA/KYygAiJs8uBmg/x9SmcGrJY50?=
 =?us-ascii?Q?SKX0I7Ao4UeAcvuLxrQyTZf6bq685o5jm7BJ++uGe7H+niBpiZ8rVKkCly/1?=
 =?us-ascii?Q?O3GxglN5z6P74ykn2NfGxBW2ctwi+lqVfGRFvyDH0+ejoczYkrMqZylti9HJ?=
 =?us-ascii?Q?89Ddh9ugKu58UAtd65jWjR6jF7k4iRiiPJayQhG6LSGGIkrwWP4oAOcylACh?=
 =?us-ascii?Q?RvHkRuOxlP4DaRlNiAZ7OXy8IJOSMeiP15nhUbjOh9E/+PlwQwedysqlkOtN?=
 =?us-ascii?Q?HDIvgtSSqn59X8yHtGRjWZSYM6bBz7BU09eFMXeo/6p9uEMjrzhgCEKyJOOF?=
 =?us-ascii?Q?lM3Op5PDDRUGcrWWTbC+rs0K9smnsenntoSHtfXleI/MR5J9nfR6UdTBgN7o?=
 =?us-ascii?Q?Y7oxc3pkW6HCzfsGDpbR2TbsLGA9e1jHN44m6MAeVplaqsYxm1XPK+brJjcM?=
 =?us-ascii?Q?ap8AUaWUOatlL06x10CiW+zlB30tSTW9ixsHogvDU+BECwbapWbr2THAVscb?=
 =?us-ascii?Q?2MXifL6pyX9CFPB0rQZcWh9snuDFb3B1dDq4jfo/tQjpXubgfukuSN6oGKCt?=
 =?us-ascii?Q?ebkHCKAzua4mxEyPQZedlqkCzIlpqcabXMnk/1ocib3MUs9Jo6zIRdwf0QE7?=
 =?us-ascii?Q?VgJdtfjMIW01PG5A3Dta82RO2t8xHKeqVrOx3sUybD+gBBSsti0iou3S+Xna?=
 =?us-ascii?Q?HKXe0ydRnby591Z12OVDIlex9+1e2bZ3IvjJryhj6r+aicDFzPa9MBN64Xvx?=
 =?us-ascii?Q?31LbxNMGhEKvBcd8Gqk3D4OVApMXupFrMqI7sa0PQJoaSDNxCjL7477aphTm?=
 =?us-ascii?Q?NprsKXkBEW5pRfRw9f3Wliu4iB+WLQhh428HAX6+iN6NPvzi/sG754BxPcBe?=
 =?us-ascii?Q?OUpcskymTS1EGvY9KDMhTPrVoIjSgQsTeh0YyvMcLVD1qu/0brf/qbknbVHM?=
 =?us-ascii?Q?QsUFJQ14TEhqzPXBibrAh94zQJyIPoJP+uC/oRm6eQuzsEIYgdvuQ5IF1Fe+?=
 =?us-ascii?Q?v8D8u8J9WanPSeDqnZBZmC5Uz/Qs/38fX7IYrbnyunl8OCdyVrHA5p1G1wYH?=
 =?us-ascii?Q?krMP3EglDTPAd1CMEKHqQJvjbUFNYFD/Cnl80v78X0r4M+MTYA2T5LEx76nT?=
 =?us-ascii?Q?Kr9fMqJ4xj1L2JXZzcLK40RkToCX6pdwb8nzgEsTbdCXmsqLalM5RqkoWne1?=
 =?us-ascii?Q?lrtFsiRyXLaL4e/d75xzfN1vdbKnfDTjpau3H2VHOWWKhMr4acED+YsXi6VH?=
 =?us-ascii?Q?/18LlScE+GM8ELMw749RHQ9/9DXMz68/qCnQzpQl3qqXYMlyDHGx7t8RyLmg?=
 =?us-ascii?Q?mlqaq89bqiYPiqULjAfQvfBtGZg8qoLhxqa7eS1/uIQcuDZRNEC/wrv2Yotf?=
 =?us-ascii?Q?hpd7YzUxTAT/muZX0tXEyo6W/AnYbdGyR7GsB5MYkHTqMxBaEFi2LKNwf+xo?=
 =?us-ascii?Q?VpNfmuETcI9EdhdsbEHOGf9rGtn7bx8I598jwq/DLtlSGGveiv4ymXr2WGv7?=
 =?us-ascii?Q?8SoQzcQHSH+IyaIGE0sCMie1guOO8elYlK/9vhwb1a9VIN9UAUNQOOOJsVA2?=
 =?us-ascii?Q?OOHFMUqTuLOP+tEYorgnJ+ChoIEKIU2Y4KCQ5nSR4VJVZxRkfjkIvcy6EktY?=
 =?us-ascii?Q?PFwhsosQ3Q=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea3ba44-b897-464c-fddc-08da3cac17e4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 11:05:06.0364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnWtzINtMdg6Jf96kZiIDUqG7MNQofJ2gvW9bQyFQgf8W8BnoeYU0r9jwQ3xlPiOFxFkP8V1qWyCRsZ3SphH1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8765

On 23.05.2022 13:00, Jan Beulich wrote:
> On 23.05.2022 12:07, Roger Pau Monn=C3=A9 wrote:
>> Likewise the __ORDER_{BIG,LITTLE}_ENDIAN__ defines would be better
>> placed in byteswap.h itself if possible IMO, since it's not strictly
>> related to the compiler.
>=20
> These need to live in per-arch headers, i.e. asm/byteorder.h.

Or rather not. __BYTE_ORDER__ looks to come from the compiler, so
#define-ing respective constants in compiler.h would seem quite
reasonable to me.

Jan


