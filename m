Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B182B498417
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 17:01:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259898.448656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC1mN-0006UN-6c; Mon, 24 Jan 2022 16:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259898.448656; Mon, 24 Jan 2022 16:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC1mN-0006S9-2f; Mon, 24 Jan 2022 16:01:15 +0000
Received: by outflank-mailman (input) for mailman id 259898;
 Mon, 24 Jan 2022 16:01:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nC1mL-0006S3-9V
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 16:01:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d89bfb74-7d2e-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 17:01:11 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-eORonXBpMVa24ZFt3kWvYQ-1; Mon, 24 Jan 2022 17:01:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 16:01:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 16:01:07 +0000
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
X-Inumbo-ID: d89bfb74-7d2e-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643040070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dl3nvPUz50iyWEn9SlyJ02fVt3R4ez0veYrRYM72CNs=;
	b=nMtQJEGevdxVbT/sUM50u36cgoa7ZXVW6RJ2+lyohgFRE7bsyn6+SlwLt6f935EiVnXtYv
	jSsr+n+w5PKM1iVwVVbhBwBqsy7Ed25xY5KO0Dn99VQ7rWDWE8BLm5Mo5eckDm24bSOt8X
	YsUuxFMWQk5PZQIwdIeduqemjOIPc1U=
X-MC-Unique: eORonXBpMVa24ZFt3kWvYQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFl28bDiEYKmyWKO4M8y4JcPXwL3wRrNeseaPPovge+gf20Ajxu/xG/TfkLB92bX9ym/FJmxiSHmH/g3iNfkYW3CTSbzUhAOsjTlamEMOFs73BGsnk8Wca+bCtRw70pTLlSbUI2OJhPYxli+Tc5TkZOH00390cVDAAL0dyt9eOgffIZvYB53hUWGpW+7g2DfFQE6KnSl33RSTFTvw8GGMhd0KmnPOjzOkzJsHau0BPJz6I1f5rZZBY9OPfI9anGL78718dOup2+5UZIH1n2u9Ovyhjn88JCJI7gi+SJLnp1dGx0Mcr1qPPxJK1Ak2rxGZENhBti+BgUeXONF8UHWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1u2I3HRtgCbh3u/3XHE1f7ovqEZ/NuvEWRT3RFTqds4=;
 b=CGXDn4Si3hIgkZYglpWZuii2whijPCcepjOpBYsG/IZXMtRPZ8rQbthA6nJPVR1GxhGxuvase/RvRyaI0tlUqNoexuex6qfeVMe2hQd1QSmXQgq6YSaWMfqz8uST49KOXBwPVijqDq795bdRTkLrfcxUYcYPYvT5xRCKq/dsMhtSwS7hKwKGV0PB1uKNChsfnXcHxtGMez3XCm9TRb50duccyDWNgfdIjZRtob7YUSIeEHQN2XKQAAjHcuhXQvegbPDRAbKeuBZ3TC1CCWk4m0LgaEhyibC8cKrY603YYEGnCq5wbArACxAItsFkT4eTJX89pbZHMEl75ZVCsms+0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f2407e9-90c1-2c52-202b-7d6b5bda3217@suse.com>
Date: Mon, 24 Jan 2022 17:01:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/pvh: fix population of the low 1MB for dom0
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220124152316.37049-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220124152316.37049-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2efb20e5-cc62-4a3e-49f3-08d9df52bb2c
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB79828564BAD28DD115D2F8CBB35E9@PA4PR04MB7982.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rUgzWfgI963FrDgNu6NXBdJU9EGpsf9zDMPYrejZXy1RDc2BZWmVFDg12UwFWzkrAl0i6eko3kq3G294Q7+RHCr9OpKZD2sAjGJDgVxNULuuggbJovbH1YaRS4wBBD9PQmYQB8JjCT3UJvOJdgvPFiov/8NnIo/PhenvBjeRi2jiovqiYwcGh9ANsWIvKJVkbOQC5kX9BTqXOTOleS+k5u5RVcP8B7UwviVCwEVv0fBeL3odu+mTP/i1+nVDU4+DIFBP6ak5kKQfDnf/WWbynhKoOM7zyT6ic5dqsHi6AAifqgj4hrlDWearSg6/tJuWAeUiVn7pAEaneI3e3jhns+5Z17Gyzj4AsPS/cpujzd9lJ6rXYu9rx/2QBqXBZxptnvcShc8BqzQscXwVPbvzZFRnarwHAcu1tIxAdIyRSC3sgn5sjAt3hB8Us4cmRZxZhBwxNHpZ9iGnzoCnRREutaYPAV+zcmkOHRUEG0zmWRVt4CVVvADMjCgT79V/e3Px5uFq/QqhKrEEwxcLdbqo2k+aOWSUmC5Xk8psOCb2X8K4G165anlbJdO3TeBMBZU81ED0KteNw+RaNUmCxGiXgxhyQVOQqaQ6Maszo9BQroXnwundea3Rd0Wrp44Ir8Tew7FzGVTXFhOKdz3dRoa2WTBLzuHyCECmgn2raV5COF885Xa2b5RIggmgBZa+Bc+RDrbuf0YKMzAXVx/JlDIBUmo1oZoxcEsvxr/6Pih2Vm0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(31696002)(36756003)(316002)(6506007)(66946007)(4326008)(54906003)(6512007)(2616005)(53546011)(186003)(8936002)(38100700002)(6666004)(83380400001)(5660300002)(66476007)(2906002)(26005)(508600001)(66556008)(31686004)(8676002)(6486002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ABJRyBVDqQqaQgyPNwh7NbPve84l8BDgYU8zdCkjMzHmm9n9t6XmwPhWAi00?=
 =?us-ascii?Q?jFLUTLwE1gG4rpJznrCt/qgVB7vErp70txVLXZ0hXTd3yCY8INpCw+LnLScv?=
 =?us-ascii?Q?mF93i5tHKF5ISItQWwu7OEBJwX+RKmF80nOvDnCQlfO2FM1oPyLiO8PWHLEU?=
 =?us-ascii?Q?fH0b5AZvLNacEg4lybG3mgaj1ryjivCijQIGc2XGTA2nHVYQ+ZOuP7gr5y1p?=
 =?us-ascii?Q?ixuAXJEiA7E6INxbUq06MirBNJcebBlywnSoTncoWfyPJHH6lxZvkLrABCsZ?=
 =?us-ascii?Q?XAKEIqJDI1IaQW0WypvNfXiH2ntix2toquOozpZb6DxO+ZMNVz4p2LuyZ/z0?=
 =?us-ascii?Q?HWBTmGE1E0nO97QALIsichbHQmGMJ15d7m/3Jy+p4xWIgCpMND0yhyszASVi?=
 =?us-ascii?Q?T5VV03wU7PwcH5ilPMoDsJGbm9GUUIjiRDqyaLX41ftgz8XklPrrqoVk7CDL?=
 =?us-ascii?Q?054tmWoQ5tC0BZNlMc4fdzjjaGl3YSStRkQEhhvIMrabrLih05la98zPRWcJ?=
 =?us-ascii?Q?xbMglU9byzbLTt+IBK+tsdm5Ch/ZM65bopbnTebq5/k+6GTbCDpglzFTWXIh?=
 =?us-ascii?Q?46+1HnejuEJ9Mqeic0qbr0e7JREUyMvqUInb6D1VtfqkfL92+RYJGr0/xBpU?=
 =?us-ascii?Q?t53AE1YtwJ14NSnq3wR4daLL45+X57HcfVuqEAs/L0HeRrM4/ygVuFpn8vfV?=
 =?us-ascii?Q?URmTbZn9KyptzXv3QuhfnL4PSZavYTKaSuAvQ1HKyw9eI+mQgPFfXYteOUOY?=
 =?us-ascii?Q?13IIIXA6gRQSlAvtgXZVrwkjMhQ09r9H5LiDaCL6zjqO56VYPvjM+C4BREy8?=
 =?us-ascii?Q?XTlqqoK58I/AH8p9CH7kGAQm7NQlcjGDHxmlug+XUuI4J7vviO4ORhn36KJZ?=
 =?us-ascii?Q?kYzCOhaJe5j1ptHeo3t91Q9VcacPp2sOo8ewIxh6VGHuhqQJNJnTiuGoFjmp?=
 =?us-ascii?Q?oLyjXe9LsHm9Bmab2k7osAzb0LQZ26bp+wmbcKRPE72UKVKZtE2yjMECUruk?=
 =?us-ascii?Q?VBwzioDdnnqE7KkhkHoMQ1Xqq1427IgFSjqff0hqEri4p8eoSM/nDVVq0ukd?=
 =?us-ascii?Q?mxVpEN52qahDrwsrCdO+NB+ePokUepRwEEeYNlrHJuxunyIv1RdNSFIbevqt?=
 =?us-ascii?Q?0MmfqMOqpjH6OkQEDJEsjQXOTvNf+OXmT6CWJQyIAJvQ/8PjieP47xGzNi0P?=
 =?us-ascii?Q?E5gJioJgv7v6eyvC1zjvAH4BYCEKypoxjLTqzWKzIeK/txpw+BjyDtw8gP9B?=
 =?us-ascii?Q?/sR0sunvaAuW0FR1o++m5HD5Ec5r2xV9JHw3vQmWMSSlvXHgp5GmNwIR9Fbv?=
 =?us-ascii?Q?zL/042RPBebOi1ibvdB3GinixLropSZb8cZowh6djtCj+oGGyHUwfxjNMdBl?=
 =?us-ascii?Q?hpeEeCcON7S/k+YiGrXUu7D4qwVOcJG7X0dbdNluC6z1Uta/niLODQGrB8yw?=
 =?us-ascii?Q?lUoKBElJj4PrhWeq/9G12KKtXkoRvmb+X6nFO9O3l3QQ3iLRE902KqDzeXY4?=
 =?us-ascii?Q?x+GiZ12aYuKjtCjiB0G3zHBTScDMorkpzsl+cHM9hJEamHiNpFY4nmBxqX+z?=
 =?us-ascii?Q?ZDELtuVqEImjE8JIS0XE+Lcn6hvh4MGj+iJQgDQziVHqJgdyO4Uy1/nkFx7U?=
 =?us-ascii?Q?+7/B/ezOq09PN974AYKC89c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2efb20e5-cc62-4a3e-49f3-08d9df52bb2c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 16:01:07.2258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bcbET2heagEJS0Iu0ZmWyImF7UlDkoLItr4sIaKyQA9NvpehQvbhwhBKQIv8ZuoTjFtctHfNsH+4aKS2vrHfIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7982

On 24.01.2022 16:23, Roger Pau Monne wrote:
> RMRRs are setup ahead of populating the p2m and hence the ASSERT when
> populating the low 1MB needs to be relaxed when it finds an existing
> entry: it's either RAM or a RMRR resulting from the IOMMU setup.
>=20
> Rework the logic a bit and introduce a local mfn variable in order to
> assert that if the gfn is populated and not RAM it is an identity map.
>=20
> Fixes: 6b4f6a31ac ('x86/PVH: de-duplicate mappings for first Mb of Dom0 m=
emory')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -466,11 +466,17 @@ static int __init pvh_populate_p2m(struct domain *d=
)
>      for ( i =3D rc =3D 0; i < MB1_PAGES; ++i )
>      {
>          p2m_type_t p2mt;
> +        mfn_t mfn;
> =20
> -        if ( mfn_eq(get_gfn_query(d, i, &p2mt), INVALID_MFN) )
> +        mfn =3D get_gfn_query(d, i, &p2mt);

... preferably with this becoming the initializer of the variable then
and ...

> +        if ( mfn_eq(mfn, INVALID_MFN) )
>              rc =3D set_mmio_p2m_entry(d, _gfn(i), _mfn(i), PAGE_ORDER_4K=
);
> -        else
> -            ASSERT(p2mt =3D=3D p2m_ram_rw);
> +        else if ( p2mt !=3D p2m_ram_rw && !mfn_eq(mfn, _mfn(i)) )
> +                /*
> +                 * If the p2m entry is already set it must belong to a R=
MRR and
> +                 * already be identity mapped, or be a RAM region.
> +                 */
> +                ASSERT_UNREACHABLE();

... (not just preferably) indentation reduced by a level here. (I wonder
why you didn't simply extend the existing ASSERT() - ASSERT_UNREACHABLE()
is nice in certain cases, but the expression it logs is entirely unhelpful
for disambiguating the reason without looking at the source.)

Jan


