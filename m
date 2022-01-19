Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F22A4935EF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 08:55:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258745.445990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5oO-0001xX-EI; Wed, 19 Jan 2022 07:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258745.445990; Wed, 19 Jan 2022 07:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5oO-0001uf-B4; Wed, 19 Jan 2022 07:55:20 +0000
Received: by outflank-mailman (input) for mailman id 258745;
 Wed, 19 Jan 2022 07:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nA5oM-0001uZ-R6
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 07:55:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2469ccc1-78fd-11ec-a115-11989b9578b4;
 Wed, 19 Jan 2022 08:55:17 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-QQzdclr-OGymXoceOJXJ3A-1; Wed, 19 Jan 2022 08:55:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7326.eurprd04.prod.outlook.com (2603:10a6:800:1b0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 19 Jan
 2022 07:55:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 07:55:14 +0000
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
X-Inumbo-ID: 2469ccc1-78fd-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642578917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgIVQs2ZRoecTaGNepQSlgSTzmAbFdZ7Jcw93DOtC5A=;
	b=kd3at8EUThjZjHB5MAdXtiC1m5a5BpIQw/OCceBgs8Wrmbjiw/xJrk8GBK/oT3xbcT6ECd
	/GLPbuylsYeE1Mv91qgmZk67i3q6e28e2rTS0GI1SSaOJtdA5mk/Tkf75Yl+R9PgwPgG1n
	/hmzDJWOxV0Ew9jHq9UIr+rsj92oIXM=
X-MC-Unique: QQzdclr-OGymXoceOJXJ3A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqXqdrS1rvzx6iXRfN+wx+IwFuCMOVWooaXNzdTf4keGkvJuhPr24NlqYtJMFs2tuCw8xoi4DK4t6T83jwji1By0qWOExFLXuH30wUYD6I7A/6PkYC9UP0yrRJBt/dY3cBdeCCTt+BeJ9Lk6gRjVHFsoxwDXj33RuHNeTHefZO0Uv+FzWDr8vtIjhmsLKUxwJIKECptxLt7UMktRhnkmeQDwEPCJCqJVeBKU3CXG4Z78fdN+uq8U+k83JzYfJOKaKIZC/TGMjg4hqSG87ckJ9y0eURBYuHHNDBUUk72ACeAg+auJmKdnlTI/3cQ6FY4rWB0EGKxvqjOLso/Z1cHz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0U6oOn6KRiFjOO6BAnB7j0SDUpwov2umluK7tI/wD0=;
 b=n5OGIa5oe31GrWYNLemRK+zRiX/wYr6ZJutIH01YUK6orrjRXX8TNg5sADQvTPfeAA40nxZEKtwcyyH/6H9l5LY6UzZOliWrbt5qFkTyfcUwrJlhmxl+l5YXpwZEj6pVSh21E2DPz1V3iOYl0KnA8R2Rb/PRtoy/3ncsBlk6fKvwNei7a8of+IsJXuA+fjKMET+LlPOjftEfbxYEF9uMqyQwUqm1u7YRT/F29kklkfrrrY3Pp6F4VlgitYxjb+1lGvcx1wm2atXyZAU1t4wH1gEpYoAsk9cZQt4Wl2O3jFHD7v+xvMH+B/a6rSl/NLXdY7fpBn48fs1e2I5/X45phA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f712c0b8-d539-9121-cb23-28954280b57c@suse.com>
Date: Wed, 19 Jan 2022 08:55:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/37] xen/x86: use paddr_t for addresses in NUMA node
 structure
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-8-wei.chen@arm.com>
 <a1d96556-5da4-0c73-0d87-f24758866d7d@suse.com>
 <PAXPR08MB7420654893AFC5E9941C398A9E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420654893AFC5E9941C398A9E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P194CA0005.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03995e4b-f926-4909-4893-08d9db2106d0
X-MS-TrafficTypeDiagnostic: VE1PR04MB7326:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7326027E2403C9B0645A73AFB3599@VE1PR04MB7326.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UZwjNezB5P3ZpZyNZtJflEUC8G00hwNTU5Qf591moEUZ915plDj33vnF5pmSQmEqXBxJlAEjKV+dGax8MMuhvmRucpaIysQawqSkXRX5TK/wL3DgdFPY1gBqDofsZ9Tsg0r9gxjSojxYLEMttlr0IyZi0wrILvOy0ijtN9xn30WHl0n4UZD0AsoO3Z7a3wt7hkwTKwElPPXdnEghZ7wTf1rENv0xdYaaw/CN1tf5XLfeguwbM9fRyukYHGOyfoV+YivwStaHYI4WW2wiQy1kEj6PW1PCU4TEYMjz401vLXW0D1pDUojCNk4MsXuBSyKj6T5UNVxMDqs5HutDxicjisYIk4ypgwWjGtYdC7Jht2R69c3rkBXdEFJecWHW65kIVRzuZ0qDBFj/827d7YVLiBKZPWF+eBAl1THV+kUJEc+T/a5kbD+4xyNyq2kgdmZcAAu96/fWKyza5nINc7iV++ZQXYbtVfroY+3uxjum1T6UKNMhq/0l7AzfTk/huBEHfk9kEy6ZP6hLCz9Y12t82n3mXiHY3QM/UTQHSB428n494SKlP1TEc8c1f/KbPoxSFdyuGw2iuDSaTPkYJuOoIRuRrz19JkbDwtxHwWOj/VMorD8+fri/bxXsiez6bTBFcyiGNNOw+mQE1zHJVeX3qB7BEFD9/F2n/U2Epr5l4tfadPQnV5IGQVrRXyKCeikb+FWpHEy60PlWKYGmU8mkh7uJAG3oG6yuiHpWPGFOisc8D9JPCI7jtGhy+VDXBBR+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(38100700002)(36756003)(5660300002)(6506007)(8936002)(508600001)(6916009)(8676002)(6486002)(2616005)(53546011)(31686004)(66946007)(86362001)(186003)(2906002)(66556008)(54906003)(26005)(66476007)(4326008)(316002)(83380400001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3sWVjogDWfKUxYh94DmhjVgL6S+8nMsBTfZkOorcbsUxiQajsHM0SGDGD/Gx?=
 =?us-ascii?Q?UgnLhAYLkyeztl2ibgcT0QtpFar/4CdXCK9LyaGCGHVc/5Edo6za05YHtSqW?=
 =?us-ascii?Q?QHbCqTcXpA8C8heewBpPSZKj1PhmEeEGDOqFMnDC5N5LH94nntsCLkW4RlKJ?=
 =?us-ascii?Q?RN9I6fwJIRxu4OjPd0effUsyXbF4ZRuBYJo2mneaNSNhZzVVfxjsMhZJ2TcH?=
 =?us-ascii?Q?oJ9US2/gF4SkTruvsSCyDxOvAhWAmaHGpOo2n07eLC/7RgVW3lhj3EAtjTFU?=
 =?us-ascii?Q?jm4LLsiFIkiX2PqtgMv97nNhhj+34iv8nZSC9KW8Owfti+SmhJjs9FIUB1vY?=
 =?us-ascii?Q?HKyvlJ1+S2xkpZ1/p/l/kA165FPAL6EJi8H1pKV/2t4OZ3+2BCsWNqphsiya?=
 =?us-ascii?Q?yt+4mhTypWpaMzJbyVyhyklQQ0EdPB7FZDxN92skvhXoE8tN3PHHeBHe9fZh?=
 =?us-ascii?Q?JOq9dZpeokLwfJISadibb94UuWFLly7wYjgqJA4xIUE4qdvor8i2gTxqiX70?=
 =?us-ascii?Q?mPkVWqcxvSqFSTN/NO3U+5YJwRFXcBr8cwoiwjw5xMpfrtx1ozREZ75wkgbc?=
 =?us-ascii?Q?0BUUmLI+/CCBwm76e/4yLWoijUZg1ybe/emq4UEOpFQjGQdGHS2zhj70mD5A?=
 =?us-ascii?Q?xR+8iHPyArNNSgT14y3OmI2t6qT7xLCAWA0BYy2T6/lL3kcw8adPuhQ7FVzz?=
 =?us-ascii?Q?739Qj6eaP7o2bGSVTK60BvUZv22Cumu/sIJGmcEe3WJ0wKlvDC5DTwtt9hG5?=
 =?us-ascii?Q?dSLXJ7S+UU1oBx/OweYLm6ZhhpB22AoPGPrFZwOO1No+t2lxXsyBKxU48vOK?=
 =?us-ascii?Q?aIDMpWqFpeB3meHzVA7Krgm+7Wbpcd8qH2YywsNkWWI7+UdUZa2UDToXJAV1?=
 =?us-ascii?Q?VtAdk/6/YlM5soyO6+vFec0N19+xw0xMKeNVOLAc4eYB4tqAPUeth0zqSnHD?=
 =?us-ascii?Q?n05DXg09zZJx3Hk9Ae7UKiMvfOxO8SkNH8BFi3ePcPQIzSb1Sm60UTu+uE1D?=
 =?us-ascii?Q?4pwZVTRlCeJdF1dsnVuKukZV/1NfNbu6yiSEAdyy3QMdKQ6se1zmvP54dsi4?=
 =?us-ascii?Q?au5TCcsQsbtKSCmuQ01u1BXCSCPRfpuLXIQXZJaw10T2LcLCr8SazkWCEB6w?=
 =?us-ascii?Q?em6gM+/iwIR4kd1yndqt4ukr8q6TCoyYSRjHUW5hZCdMHGyAt5fVyR8RXTz5?=
 =?us-ascii?Q?X3/uLaekGSRCvc5UR+mBuaGr60dNPxkObfF3IsD7RJsuDRgkHMWvAk0tcbI9?=
 =?us-ascii?Q?9qpPMhJM+LV8uCga/eaKxscGxkUFXUXLEX0ZfU5dUYyIhV6Qv9lCYrO8yGe5?=
 =?us-ascii?Q?4Xzquth7/+KKXNVcS/MC8ZDiymW4UwkF/ATSzldzRHsRh5VDbPY/ll0a5xFm?=
 =?us-ascii?Q?o4PKLNK1SrzDCoWz6ksYnMayJCeTji+a137qCVe/j5c82h2XfngjHO6sXCu0?=
 =?us-ascii?Q?c4E1uH0gTde2gxAn2BHoNXiXd9t66FEJNmBDd6Gc2Ig5+JuzJCnw3Jqmhi3E?=
 =?us-ascii?Q?8vX7Nq8MXs1y0Y79r9rhA+Gd0vttcfmeRGRmKalB7BA4/GlCyU7Qbt7N23K6?=
 =?us-ascii?Q?eaQYKHRUToUdM7jqhOlno8me3IoDDY3j7V2mXUJHlaWQqi3426W04F8G/Nn+?=
 =?us-ascii?Q?s2yS7HK+qzAoR7NDA7CC0gQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03995e4b-f926-4909-4893-08d9db2106d0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 07:55:14.5672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bE7kLFa6THmnt1ynWtX+p5qbaUhjspan3QtsCmTVQBClfs7clSPaoDan1BJ+fOT6Z26cruz4R1FOLprwnXrBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7326

On 19.01.2022 07:33, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B41=E6=9C=8818=E6=97=A5 23:23
>>
>> On 23.09.2021 14:02, Wei Chen wrote:
>>> @@ -249,24 +250,26 @@ static int __init numa_emulation(u64 start_pfn,
>> u64 end_pfn)
>>>  void __init numa_initmem_init(unsigned long start_pfn, unsigned long
>> end_pfn)
>>>  {
>>>      int i;
>>> +    paddr_t start, end;
>>>
>>>  #ifdef CONFIG_NUMA_EMU
>>>      if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
>>>          return;
>>>  #endif
>>>
>>> +    start =3D pfn_to_paddr(start_pfn);
>>> +    end =3D pfn_to_paddr(end_pfn);
>>
>> Nit: Would be slightly neater if these were the initializers of the
>> variables.
>=20
> But if this function returns in numa_fake && !numa_emulation,
> will the two pfn_to_paddr operations be waste?

And what harm would that do?

>>> @@ -441,7 +441,7 @@ void __init srat_parse_regions(u64 addr)
>>>  	    acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat))
>>>  		return;
>>>
>>> -	srat_region_mask =3D pdx_init_mask(addr);
>>> +	srat_region_mask =3D pdx_init_mask((u64)addr);
>>
>> I don't see the need for a cast here.
>>
>=20
> current addr type has been changed to paddr_t, but pdx_init_mask
> accept parameter type is u64. I know paddr_t is a typedef of
> u64 on Arm64/32, or unsinged long on x86. In current stage,
> their machine byte-lengths are the same. But in case of future
> changes I think an explicit case here maybe better?=20

It may only ever be an up-cast, yet the compiler would do a widening
conversion (according to the usual type conversion rules) for us
anyway no matter whether there's a cast. Down-casts (in the general
compiler case, i.e. considering a wider set than just gcc and clang)
sometimes need making explicit to silence compiler warnings about
truncation, but I've not observed any compiler warning when widening
values.

Jan


