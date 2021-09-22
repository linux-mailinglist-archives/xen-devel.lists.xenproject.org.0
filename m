Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ACD414241
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 09:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192211.342544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSwIY-0002c4-HS; Wed, 22 Sep 2021 07:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192211.342544; Wed, 22 Sep 2021 07:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSwIY-0002ZC-EN; Wed, 22 Sep 2021 07:04:06 +0000
Received: by outflank-mailman (input) for mailman id 192211;
 Wed, 22 Sep 2021 07:04:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSwIX-0002Z6-6t
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 07:04:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd872aa9-dfb0-4933-a383-4b13c7b4b033;
 Wed, 22 Sep 2021 07:04:04 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-WDEx5p1eOJKopdT7SL9k2g-2; Wed, 22 Sep 2021 09:04:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 07:03:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 07:03:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 07:03:57 +0000
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
X-Inumbo-ID: bd872aa9-dfb0-4933-a383-4b13c7b4b033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632294243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WrNld46FLQXMxSEDG20jPvZ658ARGRbFtLANVAASoaI=;
	b=BKZlqDMknF1lLGFnFP4wd5dfpXV1jTaQ31UNj9kmtgf5fsknnDl95s/+XtrwhIspY1ZWXQ
	sb4f/PTLgi008RVpoaHHStp080ugJ5xrFZEQ17OHf9YGAz1sTuIAt+x6NaZIHZU8azrOP6
	vpGk7wYQhbg6lD9kA/h1TL2OtX76cqM=
X-MC-Unique: WDEx5p1eOJKopdT7SL9k2g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiF0oMptAdRe/DUtPbfN2RRedCYGfH3pWoqTkKpCiY6kXoK9MMiRbLd0b/chJbzb2Wb3wGYtjzs8VevtXcdAU5j3WGRCtbLxHTlSUyCXqZglGHY4oti9848rWvubvZPqeIwekrt57SLgg+ZavvN7BkwA0RIonPcsiOTcHrZ0Zgy4MlXaL2pc/2T1GT4jimo7zz2EhFzYn0XBAtK49nE3S2kkUXkQvF79K1JCa9K3p8aK1mGb3dxiiNvXPTT+cHXAXWjD2oLnA2UVldNZm/tk1vhfEzCnG6jvM04okQwJ5wxRC0JXbmBDj7Ft90Nc9FHEWGMTGngybF4iJy5Y3xSl6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8hA5CF9k5Gw3YJIJbxUjLGQqn3qkUPNgnAZHoFImazg=;
 b=G0davBIf97SZ7w6dH0j8W1sEuvVgnnQ683CTYZOGkYzRAaao6RD6VwaZz18EjyNokzzudXOXhs/L6BHfjmbtnusR19y/gaueUItRRvWCruuPf2eM1OzybHfGopjVkG1QAF2uzG0WPsAfrmkCVvqNRHRjPPaHx2NtXIUyVs5djwAFro2tL7quSasPLr09lFrNFqiqfsaIgskjID64N6VWTNFYCCg+MdZgGFhqFa4yfKYkfgd+33OIrXHp5tp0CPUGEDQkvmHqt9VYe3zXnJ2ufCuyB2/vHTlRrAe9OWzxFyWW/AeZzp5SIlogn8zZwe4VGu/QuYScg/SoCnzA+LXi2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2.1 RFC 17/12] xen/trace: Drop cycles parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <2bd51843-de50-d442-dd5f-7fcc340c3f26@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c56b991c-d9cb-0fbf-a29a-6bcd60b09d58@suse.com>
Date: Wed, 22 Sep 2021 09:03:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2bd51843-de50-d442-dd5f-7fcc340c3f26@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32c22205-b36d-48d9-57a2-08d97d9725d9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5901CC9973D1D61DB26365D9B3A29@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cFRbMYCXij2v/ljFAvXmtyS4jI9o2alJver7gnourvQ5kTbq+uXRz7b8tRPliE1zMkGrj1PGDKbjS0FNMlb6NVeXL0MTSXMTadumLZSx/MRy5G1igYivObumemJBKwz2ghAcBGo0OrKqLnjIaZuYurd/O6b6dnV6NTMYd5FmDT2bhrFFNCANJXA/qS+sDBp10VhSbau2aHUsU8upRvKh9u3AkDdSN4gvyZzcLa74PMf2qBgquZtXd6AIQEVxJNL9hzswf9U56L963YfHrOu1ednG8o9D+FmBWP5DJ2fAefpKPduRLC7D8KLO/toW1wwvT7r50t20qvaB1i7ksF7Rp1NTz9E1ImZ0RnGJGnuoEYUMGp22/J270Bl4QNn1Fehfj3OvWritkMEehYE5oVvp0FmxxmnNZq1awfJy6Nvqw/T3ik7D4OpweQi4JoEcUT1tsN+4W6Yz2GSAV1rAKleeuIgzvXsYXeTSNWX2yib9neVZ8CiSuULwRIfi8Sixs8cVOoBbrRsGtRi1HuZgkfHQ6k5SHN8ArsqJwbeznbKYDdFlFlM20kdNbC6wlaVsAdRyVCk13qyZ8bYbqPxhoLiOY06J1bRBAgRCSQQvg+Tku0FUPPAuRnqC3rF1vVG5LXw0hFOAzejOhKs0w8LNYahFgrpZWkAZnHAHhas6eFXY/gri364M3112Nb9ylA94GoAXyb2xFOpAbGCkPGr/5uco17/WKkf3MxpPi0fjpXfQqfg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(2906002)(8936002)(956004)(54906003)(26005)(86362001)(2616005)(36756003)(31686004)(5660300002)(4326008)(8676002)(316002)(6916009)(16576012)(38100700002)(53546011)(6486002)(31696002)(186003)(66946007)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4WkhGw0PgdzLngogZLoZ31p5EEJjZTpJjjrGd1r2M32AzBgjyn6qo1QT1w5X?=
 =?us-ascii?Q?o7XPGfWx1hTDSzGj9ixCsoIPThF/E0AAyAjPVuRcEMEThfgeOqombgTGCAtL?=
 =?us-ascii?Q?uPsn/RywgD9zdfGFfsvfTtwDoqNQhyTHRydE6UglKPjk1C5WZlKvTn5Is/SK?=
 =?us-ascii?Q?sPMiO6iLCy91hSASBPJzxKcvskWwA3XOSpqJ6Zi+T2y2jG64NMSYDyRNwZ9T?=
 =?us-ascii?Q?X4FFkXF12zyxxveVoXMEo5TCZLl3Hk4XFsWKKM6KnsncFR/Dry0c58NgO/LW?=
 =?us-ascii?Q?DDz0oep9wh4OZDRviNc/kOMeNuiwU14ZQ3VM9iD4RiobxX+AXSK0OwhQU1lq?=
 =?us-ascii?Q?Oh76Fz8T4gQVIY9RK/A2raqXqXgkMXl8NOvX/crk4lnOwydDANGwl5a9jSi9?=
 =?us-ascii?Q?YHLFg+235wIQ1dmEQAW2DICX/72+Fa9BjZAQlF8kWVhtnoI80rnsUyFXxpWz?=
 =?us-ascii?Q?NzD11SAZpSniZjqMfZEEpvLkDil+2VKvR9UGN03rbYtyFPuroTKr7xBZSwd6?=
 =?us-ascii?Q?v8dMHikdzc0N29Z/SYCO3Hlqd++QbZAk89NgYlY7Ld4BJzi8yqRlJSBcn/v9?=
 =?us-ascii?Q?mQzdcxt3dP+w0oovU+7GBSGFOWaoAieMEhAqG0nstyBjZj09fcV/LU+OetdL?=
 =?us-ascii?Q?N5ox6WvPsZOfLmvdvPMoDbRybNTSMtqVgntZUTnfUGus+fFh+pOAorziukvQ?=
 =?us-ascii?Q?L/VexGdrZDEd/1g5o0zgLRVHcBzwyf98OMfy+S4lp3FlyKqGwo09/qN8aYZG?=
 =?us-ascii?Q?iKCAzU8StLgZWRFOJcI+yM2GyECgHXvLnGE53Ba9phlc+YOxACQtJdeccNph?=
 =?us-ascii?Q?DxY1IoQOZ4Vs1q8mySZMdLKO5yGo+8GvnT31IvKD3lFHjqNujfX9hOc6qyol?=
 =?us-ascii?Q?K9ExJnaQyxjRi17m67TaaWYLj/o9Z0230CGFCxZdewMqexKNPNLV6WePlhK0?=
 =?us-ascii?Q?61e+Zw2aIqlnZ5tG9F9t/Wj8mI45L4U77XGp0mtIqx9veU0u3hZ03ofAc3hg?=
 =?us-ascii?Q?fiGk2aDhPX69bEoFWUryXUr1Gl/izW9KRATunlAe53LyIJ11EjwlYIt5Blq2?=
 =?us-ascii?Q?P1YaasiSm0pEPLin0ce3j3QliIKy7v0yJjDk9JEJ2eUq98CTDdRWjkbcLEAl?=
 =?us-ascii?Q?3F49CoaFhZXgD56lxGt6ofejOoPVtmwkrOfHGhb1r4GxDxjDlyey+tXFTAUm?=
 =?us-ascii?Q?lA2jd0qMmLsLPz0R5QVqau4cRQqFJUxj/tVu9dhCSujGgkQnI9tEUIqCXds8?=
 =?us-ascii?Q?jz/G+Stk1FTZGunXG4T5uJtQPm/b3QeEPx6ahMEuZAvvdquZKeJyc7xwQif0?=
 =?us-ascii?Q?50IOkKKZIiuNziTUvnArrEof?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c22205-b36d-48d9-57a2-08d97d9725d9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 07:03:57.9179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sf4dMh+25Gj6y+0CaXeYxhsz/LpWuE9c8J9Pg5ESTLbRp2jnOIQH27wUHPbyVQQO4IHwEhjY/qwYF5aKB/UDPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

On 21.09.2021 22:08, Andrew Cooper wrote:
> Not a patch, but an RFC idea for one...
>=20
> It occurred to me that the cycles parameter from __trace_var() and
> friends is pointless, as the cycles bit is encoded in the top bit of the
> event field anyway, and passed in the adjacent parameter.
>=20
> Dropping the cycles parameter results in +85/-1029 (-944) net change.
>=20
> The common change in callers is e.g. from:
>=20
> lea=C2=A0=C2=A0=C2=A0 0x3c(%rsp),%rcx
> mov=C2=A0=C2=A0=C2=A0 $0x4,%edx
> mov=C2=A0=C2=A0=C2=A0 $0x1,%esi
> mov=C2=A0=C2=A0=C2=A0 $0x10f002,%edi
> mov=C2=A0=C2=A0=C2=A0 %ebp,0x3c(%rsp)
> callq=C2=A0 ffff82d04022ea20 <__trace_var>
>=20
> to this:
>=20
> lea=C2=A0=C2=A0=C2=A0 0x3c(%rsp),%rdx
> mov=C2=A0=C2=A0=C2=A0 $0x4,%esi
> mov=C2=A0=C2=A0=C2=A0 $0x8010f002,%edi
> mov=C2=A0=C2=A0=C2=A0 %ebp,0x3c(%rsp)
> callq=C2=A0 ffff82d04022ea20 <__trace_var>
>=20
>=20
> Just sprinkling "| TRC_HD_CYCLE_FLAG" over the place makes things a
> little bit unwieldy.
>=20
> Instead, I was thinking of implementing trace() (and a thin trace_time()
> wrapper) mirroring the "new API" in patch 14.=C2=A0 Half of the trace_var=
()
> users should be __trace_var() already because of living inside a
> tb_init_done conditional, and the rest are actually opencoded TRACE()
> taking no extra data.
>=20
> Thoughts?

Sounds quite reasonable to me.

Jan


