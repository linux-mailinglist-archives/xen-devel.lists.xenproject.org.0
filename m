Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20AC48D6E3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 12:46:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257150.441801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7yYj-0002o2-GP; Thu, 13 Jan 2022 11:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257150.441801; Thu, 13 Jan 2022 11:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7yYj-0002lG-DF; Thu, 13 Jan 2022 11:46:25 +0000
Received: by outflank-mailman (input) for mailman id 257150;
 Thu, 13 Jan 2022 11:46:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yUlD=R5=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1n7yYi-0002lA-5r
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 11:46:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e41d765-7466-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 12:46:23 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-NVtPAFwWMaODrIEkURE5Yg-1; Thu, 13 Jan 2022 12:46:21 +0100
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM4PR0401MB2306.eurprd04.prod.outlook.com (2603:10a6:200:4e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 11:46:19 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::89d1:c043:73b0:be06]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::89d1:c043:73b0:be06%6]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 11:46:19 +0000
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
X-Inumbo-ID: 6e41d765-7466-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642074382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ElFCYPkC+p12OxVk2qKJaGHht5rnuboziASwWSYQYU=;
	b=MsApPNnTKTxzp2OLYwUlAvS7o9DawBV64qHqn8WHOc7W+nVJAAv5p1xcU1knT7rFgRoRML
	dWa9dq2E76h0jBFyGV5NZ4NelX2A2uKAK7aqPZBrL1GQiJ9cVa4GacodCSfQBjgJkqMM7n
	mEFBc0CMW/+ww3c0p8acnU5QU9uyo5g=
X-MC-Unique: NVtPAFwWMaODrIEkURE5Yg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXuwqxEzqp7KWUQxrMfpLgv+i/4sGP1aKGf66J5qj6sKFmbe3CufoIw460+55Uv3xTEGU4F97TIGPTqyTyezfqMVOfiCkzb+15JN9y0WBDTY78+3AsQP9ZHW3e18QnVfeBeFbmgEsTVl8CDRUdc41bLzRyvd24/reLLnRRkN0XzriYbQINX0MifYSVP1wR8KQ7K975nOoZU863HjbxLgeEVKbWrljt8AuvLoqtgTcLQcDq5f1ZX9OpYz7FJd9relXmUnlhG3gEURpZiBwPDfz4L5MHiURZx9nAd/9fYoq6XbapNHJkfFUVAfmnCVdQz3ptqEXOyP241Z8DJUtPjX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ElFCYPkC+p12OxVk2qKJaGHht5rnuboziASwWSYQYU=;
 b=m/Tt0BNetLSy5IIfH0h4ZgWOwZeCItSLOweyGHIIC2sylVYRZwZwKjauwzuOuATXMkcfKpWhVJ/A5MLKr3M68Q6n5Ip9V/WDhw8HBHc9753bFrtWfRI6aN/8gIiZynDzRsoIPCmTR4/aPXwA8tqYRi5rUKOrvmPFo5R5JmZsO9YJmnKGLxaqvhuvQibFA3VvIusbh4cdI1Ewo20Tzd5mDtJ3/MqBrA0veX72UVtkHREH8OHqKX62SwBEbNiJn/fDbM3sf7Gy2v8USkrOP7wLG3+YxNUQcl3NscIzK6Yg2wCOQOVZmRZIVaNhkAdfrDMqQYT0dLGZwp6KErRZlZuC4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Juergen Gross <JGross@suse.com>, Jim Fehlig <jfehlig@suse.com>,
	"wl@xen.org" <wl@xen.org>, "anthony.perard@citrix.com"
	<anthony.perard@citrix.com>
Subject: Re: [PATCH 0/2] libs/light: fix a race when domain are destroied and
 created concurrently
Thread-Topic: [PATCH 0/2] libs/light: fix a race when domain are destroied and
 created concurrently
Thread-Index: AQHYCHMuqbBxXiBHCUadGrc315WyaA==
Date: Thu, 13 Jan 2022 11:46:19 +0000
Message-ID: <022437925eca9c97cbdc3bc884a4b4109bd7d52a.camel@suse.com>
References: <164200566223.24755.262723784847161301.stgit@work>
In-Reply-To: <164200566223.24755.262723784847161301.stgit@work>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.3 (flatpak git) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 343ae992-cacd-460a-cc66-08d9d68a50a7
x-ms-traffictypediagnostic: AM4PR0401MB2306:EE_
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-microsoft-antispam-prvs:
 <AM4PR0401MB2306DAC6F7F4C89B8B8215EDC5539@AM4PR0401MB2306.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 q5e9RpF24lHN33AaMFAPKKwTuiNMB1D2W6LiUKHlJ6YswblgnqKAGtLpxEVF8a93uMe+nGq/XjGaXnFDtfkXG76ZsukV4bbP1YRvjpAZvJRN9/FR6KbMzuBghPZUVueWFTc96k9wJU2Z+mLG0fZqE4T9Ps3ZVWaa7S90NShZ8ncqLv3ubwSjrRuWtKng8vrUm1BJbv6pI6BcC6M/uKmdvjshH5zX2XYO3QH6k02jp4z+daAx8NLIjCVl4/yI1eYr4cQigyboNA4dRSrHru6q4ft0a7qaKA1g/EGmYrt1nzYVFszm41chT77q2lr1B37+3MyHCMzQ5czFMppAG4cAGGjwi/e2zarHZE1NzHpiBN+lgv+e9Tz8URT6kp61GqRwGqREpj1TzDiwiseE6kvDvzfwRCEkc7Ul/CIiZFyfWWcRx1lW+qFaYnz2ysd2IU22jiYcApUJL8HQsAxEOIwC/UkvrSAHyfnh8yAe/yP6eFWDX7v3fOEKHurIOWsGFl9sHQ6B63/DQDqG6U9xlbzuUIyWsZnMfdCLvcE7d4K/tIF9PkRgI0mXFr1mCbMy55b0AEzdoECyFKpmUREkvc93GQD5B9YB98TdrQvRnZCjpfOusLNDaUYPDlceVQOZPMWfIiSqRrTDzUd8+qvlps1ULGtSkEnImxJ2LJ+/bLa5gW89Lj3+R5rrvSkNOrmf/BIa6E9xYMTuuwweAwJx4N/78GbXbS6sqqnttLAtxpzNFXQA32+NfHPRSf+VXp1LmvyrdZoYkCrDmwNWlPRU4YGqE+4x74MO9jHhHZRRehhR9uOS52O4Z/OnOTFju/4RH4qk
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(6506007)(99936003)(26005)(66556008)(66946007)(8676002)(6486002)(66476007)(91956017)(76116006)(36756003)(2906002)(6512007)(5660300002)(64756008)(66446008)(54906003)(316002)(4326008)(4744005)(86362001)(2616005)(71200400001)(38100700002)(6916009)(122000001)(38070700005)(966005)(508600001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFRFV2RSc2Q4d1dlU29mMEFFdjNtRjhMOENhbVdORnk5R29VZjJNdHE5NjEy?=
 =?utf-8?B?SzhKMGx3ekZFT0pVZHV6ZTE5UFNYa2lmcVB6MTI3cER1UmQvbVpjd2hERjdR?=
 =?utf-8?B?SXVqSkVUS3l0UW1XcWdrMjhUN2R6WWxyYUk4Mm55Skl0WU9FZXNQZ2RmN2Zn?=
 =?utf-8?B?a09ENG5uRVV2cHRDdHg2NTkvV1BkM2Nvai9ydjdRakY3Zmh6L1ROVi9LNmVV?=
 =?utf-8?B?MjdremFnMmovYVlZd0R3ZWFDUFVCN0VhK3JRNG9FQ3pOK0lXYUo1M1JzOEVX?=
 =?utf-8?B?elpYRFJoNFBQWlM4am5CYlErYSswcy92TUVPMDNiRnh6eW5xQVFZQzQ3dEhF?=
 =?utf-8?B?VkwrdmxxNEtqNmFjSTFneDM4SHgrVENrUnlLNXhZcmJtRnA5UVhYbEFEMWkx?=
 =?utf-8?B?WFJXYlNjRC9FaHl4amYxNVBKelRnQXZPU3FIclFjWmhtZVBmZTFYcnJzUXZI?=
 =?utf-8?B?am55NWI0ZURvVVBaenk3dEVQWlZTSDI0QjVmWXl4Y01ZSHhFcnhDQUF2cHpx?=
 =?utf-8?B?dmUzQ3J6TkNsQmlSbmtNejVXaEs1MEVZaTFCNzdVUjJsNUdwSGpkWVRxNEow?=
 =?utf-8?B?UjZnT3JURXFIYlh3V1NMRzk3WmNXaUdEczBBWmpVVXhJTTR1KzcwWE80ZGls?=
 =?utf-8?B?UHdqeUVwMENrRTFQV2tFd3JqeVNzdm9idG8yaVpPTSs3V1VMWHcvZFovZGVZ?=
 =?utf-8?B?QW5URlZZb3UvVGNZU3hhRnZLTHU1WjVTV0lCdy81cHRieEFuQ3VreUxaQkhU?=
 =?utf-8?B?UEduWU5RZ0plbHpKc29CY3hOb3EyQTlqYlRodWlGU0tYRzF2VE1oRldnd2Nu?=
 =?utf-8?B?RWtZWm9mUmZzMW5EckFUajl2YytEdFhvMUVoUmJ3SEc4cTZEcXN2bUZxTHRP?=
 =?utf-8?B?VGNXRnBUdEsyR3hUMEJrTDBZSHNqcnBadEduR0d5dk94b1VyU3FaNmlucTlV?=
 =?utf-8?B?cWh5ZDNLT2MzSXV0YTFoamYxUkl6cERRZVJndEloVWhYR1BoZDhLSmZTMFE1?=
 =?utf-8?B?N1V4ejVMVWtMaW12NHhjcXlRb0NhQzNqdzJsMVNMRzR0NHJLdUg5OXRheU5q?=
 =?utf-8?B?R0pORkJOYzM1Mk14MGR6eWFhWHIzWWlxdDdLeStGVVFVZ3FSSk54bGgvY2Jl?=
 =?utf-8?B?RDV2UjhZRUZwc3ZxMjJPM0lkN2JiSlVNakYzVlprUTN2QjFEckxvdHBlRjVj?=
 =?utf-8?B?ZDNROE1Ba2R3SVlleTBxeFV3cU5rSFVSS3A5MXNiMlFhUDZ1NE50eGxwM1dD?=
 =?utf-8?B?c1g5ek5wUWN2NVR3YUVGOTBpRk9zUFdTcmxHcTZLT3lwbm44c2J4Nk9Kb3cw?=
 =?utf-8?B?WFc1Rlp2ZWlQUzVPcmhjTTExYUI2RGt6eit1Y2k5QmZmWlJHZmM4ZDluYjdO?=
 =?utf-8?B?L1poSWFlbjVqWTBnNE9EVzJadGI4K1Q2MjY5S0dwQ1FnVW0zclZBTWJoKzRU?=
 =?utf-8?B?VksyT3lKalUwc3lucFk3d3puZ0NPaHBseHZpOEdNMjM2a1Mzb3IvZUtiVFEr?=
 =?utf-8?B?L2J0MVE4NDFaWk5MS0NmUnV2RUVCT2VZVkJucDJLcjBGbFRlWVVhNDY0NjBl?=
 =?utf-8?B?QXdPY05HNFRwK1gxZlc5d2NyK0xtYUJnVjNKaTVmamMxQW81SmpGVWpzVzdx?=
 =?utf-8?B?SGQ2Mno2MXp3cUVJWEZ5UUY2bnlHWms1Qm5YL282Tzc0VHFydEx3cCsxTXlv?=
 =?utf-8?B?eVljL2sxcUs5M2NKSWlDc1JoVXpRcnlodEZJaFZzSVNrT3VyMjhEQkE0Y2Ni?=
 =?utf-8?B?SnhtN1NxUFJwRk5VNGExUGhyUzloUEZ3UkZyQlNCQWZ5VFN1NjhTbGpPUWFS?=
 =?utf-8?B?KzlXdzVpN3dnWm95cFRmd2RsVUFmQnNWYVFZMlBOdmd4eTRuWUZQcHZRVE4x?=
 =?utf-8?B?ZXVFMjdERWI4R0plZXU5Y1JaY3dTWmZVcHVXUlR0UEtaMEV3a2cybi9Lb2hY?=
 =?utf-8?B?WnFnK1Vpb1FMT1QrY3oraDJ4dW12TnVvcm0rRDBQY2F5aHMwNTYvd2hVN3Yr?=
 =?utf-8?B?SEtMcmN0aXBnR0IvU25KcWY1eWczQitFNzBnaW5rZUFVajhEYUtHVzBMdWxn?=
 =?utf-8?B?dkgza015R2h5L0VmOEpUTHJCQnlhZWhydHlCNWI2enlxdXpsNVMrRHBUNmdT?=
 =?utf-8?B?SVRSV1d2cXVmK1dDMVFBRVpxZ0Vsa0tKcEY2VHN3dENGNDB3cjRLcWY0SE9r?=
 =?utf-8?Q?tS/tPD3ylJ0AAPr6cJ4IC10=3D?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Q9LLcJ/Qd0eGMxrQcS8u"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 343ae992-cacd-460a-cc66-08d9d68a50a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2022 11:46:19.6172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JwZ/GV71K1YyTCD7V/+9GDQQYZzUqa5ujCqlKooS5CeDJ1CmJfACF4I/WdSXC0uMrEmn/yDKh3avN8dC6Ix0sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2306

--=-Q9LLcJ/Qd0eGMxrQcS8u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-01-12 at 17:41 +0100, Dario Faggioli wrote:
> It is possible to encounter a segfault in libxl during concurrent
> domain
> create and destroy operations.
>=20
> This is because Placement of existing domains on the host's CPUs is
> examined
> when creating a new domain, but the existing logic does not tolerate
> well a
> domain disappearing during the examination.
>=20
Oh, one more thing. This has been first encountered and reproduced on
our SLE15.2, which ships Xen 4.13 so, if the fixes are accepted
upstream, I think they should also be backported (to all supported
branches, I would say).

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-Q9LLcJ/Qd0eGMxrQcS8u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmHgEQoACgkQFkJ4iaW4
c+5M3g//ZwWC6Ej4ZjXuZP6r2N3MR7V7HimA8tfNGGChEeKjFq5usz0a2nVF0fsZ
PZuL1u9XWItGxPcsPYQ3rfY8YKfopyWFovdtWRZFEkfQOTPS9i83/YnXbMi/airF
3arXhDBnOAMh68cigJDN51RTT3KATrp1TEfC4PRZHk6am3ANw/On2vxh68mNepuM
LhtQFCSkvy1aU4m6nDYDScVE4MEM7WtksGS7nc7vTkGvtWdNnlzniIjjxsLRFOJd
2tPPoW4B+2jGx4o3aSamjydnCwh4TnTp5IiAaR09NrKG0UHZ6X9TcvdXWwQa2dqC
k5FiCJmsFwQ6zQsDQbyVEwUGafV0F35Ts5HS6pznd9UbFcwEIrsT8CpzV2uaYFdm
ol3zn7SoE/NuxcTO3LfNt1iOwUr6riw1wDvlSp6dt55EVL9AwJrkJYaC7OTlf1Ct
kKYeagm7LZ/1RBzUZitLG1Ea/4zbom/xoewrih2GEW3lcg2VI7D9XLOeTF6uqMFN
M1C0jBAK1YJ9b21H9JCimsAKn2/bFarPVsN2YjZ1P9UPVVxRK2zcJnOlLBJficxO
qWRHTgRS3OLAcFeFFVO6VYnmJOjyEwY680tgCgksPOo7UPFWDe8QUS8EJGIJzrdt
TXLlEVy8ggvOXOMrxxbjaqOiTh0H26sEi4xGOc24ENr6nY9QB7Y=
=kKfq
-----END PGP SIGNATURE-----

--=-Q9LLcJ/Qd0eGMxrQcS8u--


