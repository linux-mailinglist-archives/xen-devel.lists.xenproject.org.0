Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58417604B5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 03:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569318.889732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO6sx-0006wG-4u; Tue, 25 Jul 2023 01:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569318.889732; Tue, 25 Jul 2023 01:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO6sx-0006uV-1x; Tue, 25 Jul 2023 01:30:47 +0000
Received: by outflank-mailman (input) for mailman id 569318;
 Tue, 25 Jul 2023 01:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pBYh=DL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qO6sv-0006uN-C3
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 01:30:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df61705e-2a8a-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 03:30:44 +0200 (CEST)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBAPR08MB5686.eurprd08.prod.outlook.com (2603:10a6:10:1a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 01:30:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 01:30:13 +0000
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
X-Inumbo-ID: df61705e-2a8a-11ee-b23c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JV9mIbVS14dDB0XhxEw92+N+/CQzxXUzforYRsXJexN0im89/5mF5U8K6J6PM8cEfZm/c+D+oFkXPTwDIv8TskabO2lVowK9tEZEkgzYSPkR9Qu2IIsICQ3kMlIPFWEmAxJeoLPGsEOhNOwbeA65yiAS18QNJFOtQfQsjren834udlJg5vLYkfoUm3nLCEgmapWiKymy5+aZwn/yWcWb9LvBrNzxC1vqkI2NkC9h/BuFyn6G0yAm9sTHDvbyYka5psNcoYRFkYr0ii4pk4JlYlh6dT+pcxLz6Wd0w6LTVpMa0tz1JX/x5YcT6gH/yq0wOa+m1A2aRBMxiVynUtWoMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6+43YiA7NSSOO1kPlP466bX5vcdFAxXzpiBNrwtWx4=;
 b=QQkeE1+iVQzUPWA77VdWOCZoL4YhXvP7kfph+OUjjpQkDHV7/hJ2WxrqmDXk6nuytPEtQhhVnYLUff6LoR5UmMJ21PV5t9e8mYLS+/5A8xV/6ZHTDxrC8mDOXnlJBGEqYrBSYrWBGSG9MdGYdlMrPMrZmRqvGOs80xIW3+UiiTUN6AnLJp/AZWgWqHI0HCE4QAQ3k70UbVKIRNL6CF7eUiddXqXcyggy3Aj034inYpy0jl+c/0kc5OniLCnSaESPVKQH1tEU7B4f1kw/C0AJJn7wamireK2jbjJvrivf6J0EjJR1d7tNv7Y3StmcI2LZ+gqGzOrubhs4DoOsQiulpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6+43YiA7NSSOO1kPlP466bX5vcdFAxXzpiBNrwtWx4=;
 b=oYRqgJ4XM00wGN+XnY6hXDTaUnU7wj4/2RK+1hkvMNPjOf+WlLe7aUyoVpVkGGxd2zETTs12w/QYqunVxZ/8c9DBmAvf1QbjUM0HaPArQa4QV5zycijDmW3j8jdDScrLsNFKVGtmrLSfacMa4idVIzJh+bSc5bxDxfvCzuYfUxQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Topic: [PATCH v2] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Index: AQHZvhfA/4kdXKXKFU+aFkgCYJxPNK/JsRLg
Date: Tue, 25 Jul 2023 01:30:13 +0000
Message-ID:
 <AS8PR08MB799137E28B7345725FCF724F9203A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230724101458.79412-1-julien@xen.org>
In-Reply-To: <20230724101458.79412-1-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CCE200FA451D0049BDC650FC333FDE6F.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|DBAPR08MB5686:EE_
x-ms-office365-filtering-correlation-id: 35476500-52dc-4bd3-aadc-08db8caeb1b5
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 C+x2dCCd3CeY+xHXZ2prhyY6FRDhBYGW98BrGNLwY1wyavjjex453FGei9ALph3ft2TVpYkQDzGECobEGdwvTplK6bgasT//HPnKGsibyCJRP8VPQPcIZUI1F0iZ+HD5lU2EUK8k3lZ+vPjDyJFCwawoW9oLb3ifO9JIl7wWwPA4aitw/4y/ap1gzZ7PKjAZNn8eejxtAF2hnl+USHTslNHRwgauL//JNsk/xXliYFUxJnoENRtmrP2c1D03y2n02IHY8emBRnHWvDfdF6GVGftzfBrerGuiRKqXF1FRpvc6K+pvExgRVNjYmQEMbfi77BCSXSRW98iM+URbIvVdB2k74xKKkMUG4Cfm2lxutjTuS+g+D9ogeeewN9i5+xL6yNhQvCgGoaJYYYxeqq10+k+KSevJXcNQiS2ObfqQZ0eiOX0gbhAwufVRlczng/ZCObPPHMeC0XSe/mTd9Sr4zneRxuYnFlyDRLqRQ/NWZgrHpfQYYx5li5hTzaXpOG8OGEpprU7iDNgHiXMRgEEQIJZyCyJC9Z2VYGPvDgBbUqW6iQxXy8zOUKT9kEQNaE4we7BLnUszOiIosCw+sqXLjCzAleqKjOFdbzZvDznifSasAMnJDr6G3SQy9MrfdDOJ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199021)(86362001)(38070700005)(478600001)(66556008)(64756008)(66946007)(66476007)(66446008)(4326008)(2906002)(55016003)(7696005)(41300700001)(9686003)(316002)(76116006)(8936002)(8676002)(26005)(6506007)(71200400001)(110136005)(54906003)(5660300002)(186003)(33656002)(52536014)(38100700002)(122000001)(83380400001)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jGiQXxt6C93OKfLsYdmLu83CBYzgB+zfEybz5UyG6rUejoshBxs6PEFu9D94?=
 =?us-ascii?Q?M1ij8JCrU+/Vfxsr9jYBUJpOmYZwZMExPqMoFzgsG94SPcdZ6mI7G1THGx7Z?=
 =?us-ascii?Q?SujWhENQsn36SyTVZmJurGS7CQ+ipAULXt/CePrm/n8E7euCbqwUr+/Wjyra?=
 =?us-ascii?Q?FmKi/TVJxhFeyaVSCOmOJRzFvZx6Mx4pNrTnLzFy6eWPpFvhLe+Zy8sa2Y8x?=
 =?us-ascii?Q?vFaYI5BBNug4OgyjhSKCssvywC0y0LOmGzxkVUrYHKJPj4gjN9qExyYopfGt?=
 =?us-ascii?Q?cnVbkjXy8mbz5xKjPzFToSP8URXpUYlzJ7WlmSSzuSquNIIGbtB4WpQ2xZBw?=
 =?us-ascii?Q?YurLjagJk35cZDqA0IfSS3eLn0BZJqVuC9bgtYOpZn20kGU2qTVjQYWIWcxO?=
 =?us-ascii?Q?cFmw8jomym4VzLTtoYh6vx9lm8Dhh9WhNOQm9sbGEgVfle+JCWgZg/65+8ou?=
 =?us-ascii?Q?+I0ocdaB+hLfVtH50BQ+q0O2pZpMQgFY2/bHbMg6CO4CihDij3YWiXTeQZOv?=
 =?us-ascii?Q?QDmeAHG5sQ3hK3ri4lV72tJBEJYFR2Vyh2OisY32h70L9MWOnq/+ZhClLFnN?=
 =?us-ascii?Q?HzQ/i6uShDAFgXQO5ohRuUQNYRffI/ccUTnKDkZinClF4/rWuMzRNMBeiKgA?=
 =?us-ascii?Q?Fyr+jT5XJtfEwMJJrxcXN04KvTLrqDo3Xjo4a39r5BefaUKRI8rKcZGI6M6k?=
 =?us-ascii?Q?dJv72OORzwDThcXZxR19MxrFlzfdHwhchFvdG2p20k4LLY3EJLTlUWyXUf5B?=
 =?us-ascii?Q?s2m05TC0uquwp/u0koLpH0BGW6I6hg+Mo/j3diR4kiDa/L9F3iv/g3S6Phzo?=
 =?us-ascii?Q?dkzw/aMmcdgnCqpvkESwWzeZ/deKnbtpR46sBvIZPwU2yIA2z2Y5a1i4C2rZ?=
 =?us-ascii?Q?lK6X/z/9K3gpAYKSVU7c+nxIONHPoaBZtfv0S/ctr0BKwkZOxy+eYysrQvfu?=
 =?us-ascii?Q?18SLeKC8+tUJy381XSKJ0kMVW8zSoBtK/4wqaoRVRSNAVL0IaKrAGXavrZIo?=
 =?us-ascii?Q?Sy5+IeK4EBc18U+Fa1GaR9IMJTkbEYP8DYtXS8nRaZWnvWhFvlJyYKX+QQRP?=
 =?us-ascii?Q?SftnEewIaJ7o0wF91IZl7e2eQqIO91GniJhZLz5yvAfm3r+DFdy5ZQo6DqKg?=
 =?us-ascii?Q?IypOfrH+OIySnivzlB2Tv8NPOuuMdWIpeQbOju1pKhj+CCTelEiFFQ1NtB6o?=
 =?us-ascii?Q?inwGsWCEVKontQFLy0ZN4V/ccTLmPIHwB9/jLS+DOsmw4yPSGJNQmknGTPMd?=
 =?us-ascii?Q?T7pRUSsotJ1BXaVYxKR9OAAsTEcHsxo1wrkexgcXz97zeNuZMaXXJDK04BYt?=
 =?us-ascii?Q?67nBcBavT7+1HuIQ2B5wFkOopjqsd4smTnZv/NISVRH9JRoLHfQE2/il9AYU?=
 =?us-ascii?Q?wirkwStI9oo6mWHEXAYHyJm/hqQ0JVZSSdRjdEZZqa80HI04UyMIwbP6pTao?=
 =?us-ascii?Q?jSA9u3L4uh2H/LTFWHbNGGVELwQR4PtJ1iRcygkU6giHGCph2/H9kqOOyLDs?=
 =?us-ascii?Q?RQgD6KSSc5ympU1m81UMZ+pQiPImuUtn6go39QeXNSq/33ZT7Fdr9g7R60J2?=
 =?us-ascii?Q?dQe9KD2j3Xggy62pZSilcmEiiSWxGizDeZvtSWhw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35476500-52dc-4bd3-aadc-08db8caeb1b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 01:30:13.6549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f30QoasN9J9CFnLUdU6DHQcfRJzXpulzwo6CL9ZvErh5xC6nugkN3emvAUwmxvy2XptMYTxRw0ctcgPPrMXm0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5686

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v2] xen/arm32: head: Widen the use of the temporary
> mapping
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, the temporary mapping is only used when the virtual
> runtime region of Xen is clashing with the physical region.
>=20
> In follow-up patches, we will rework how secondary CPU bring-up works
> and it will be convenient to use the fixmap area for accessing
> the root page-table (it is per-cpu).
>=20
> Rework the code to use temporary mapping when the Xen physical address
> is not overlapping with the temporary mapping.
>=20
> This also has the advantage to simplify the logic to identity map
> Xen.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

