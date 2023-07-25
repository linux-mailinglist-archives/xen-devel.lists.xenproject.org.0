Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB2176061F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 05:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569336.889742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO8G9-0007Eo-AO; Tue, 25 Jul 2023 02:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569336.889742; Tue, 25 Jul 2023 02:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO8G9-0007DD-4s; Tue, 25 Jul 2023 02:58:49 +0000
Received: by outflank-mailman (input) for mailman id 569336;
 Tue, 25 Jul 2023 02:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pBYh=DL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qO8G7-0007D7-Nx
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 02:58:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b7e2876-2a97-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 04:58:45 +0200 (CEST)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM7PR08MB5493.eurprd08.prod.outlook.com (2603:10a6:20b:102::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 02:58:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 02:58:15 +0000
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
X-Inumbo-ID: 2b7e2876-2a97-11ee-b23c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1IVtNqy1YEtqFEgPN8ge18GXe/KDjP7Xx3PZiTsDQ9J+mSLdJb6sv+rH8ZUI7yOQ1u3m2cHUEHnZPSbEHADjqxomsALzVfM+U4etKYM4FFDRsxRuIaMkiksjbq9q6B3Y1/qVZVJDNor99yzGsjWIyYAuwZkmZSXv6Kbf4PYmpYo/XKAtj+fiD+eYGpaUcA0C78s8OdnBchOkWHa2FNtFYGgbAFq74Is4eerNdWFsgkVGYjwjx4ImghhTRmpTyPHlFAWQrF3Wb0PUnPaRqSziFcM4yhURqFRmaCC9cy/PUfLuF3vOzOZPfMUdQN2r8mrOKWFvcX41zwJBB1XUNt/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDaxQidPXi153G5dSHXyTPT6bcFllfwouMfRau4SKEM=;
 b=Eui7rlc4QzS6Y5rIMZ+xkuUaC2Vg6I6vHjrLc4q0Wo0SqNDZ48QyNLVwFdDN6eUpq/eWgryIAulOcq0qDi0bTLRtD5+Qa2CFx7JeeViHmUiqnNC9TBV88e4zBc0IOdABdNNj4RI3pT+MTEUJL4HQ7yZZuP78Togmqi20vfHbnr9tifc/RokIcMu+TXqr+UNtfQ5SRSPG6MviNuJS/GB5fnEgaGG3IdFE7qoK4OWVaII0LABuEExoZZBwBME9ZtinCg3+/G4tBO1QSrgrj2L2Bmqv96k1jpGF1W/0qtubGVOhAvzlw7vYLPM8i+D+AKtIlEO4qQ3ZldkLneljugR15A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDaxQidPXi153G5dSHXyTPT6bcFllfwouMfRau4SKEM=;
 b=wTVNstI19233rcZFl93QHmVSmpm0/DArf7aPeoRYUD6B78EhhrkAL/mH1Gm4uJb7dbHgfspcHJW8Yb0y7f5XrWI+ywsfZXD6uLWu0gILXFKIeFBVNDLQZL6s+Q+d2GTz+T4ZLdwsPnNEdFOr/DNB07IPLOeGw6a1jrvlIyEbCCY=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "nicola.vetrini@bugseng.com" <nicola.vetrini@bugseng.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/dt: Rework the prototype of dt_property_read_string()
 to help Eclair
Thread-Topic: [PATCH] xen/dt: Rework the prototype of
 dt_property_read_string() to help Eclair
Thread-Index: AQHZvhkoHM9BIJ2JWEmZ3643dNrJDa/JsTlQ
Date: Tue, 25 Jul 2023 02:58:14 +0000
Message-ID:
 <AS8PR08MB7991452378AD792FF055F9139203A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230724102443.91894-1-julien@xen.org>
In-Reply-To: <20230724102443.91894-1-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2BD1D1F7D99C62408CFFFD96FDB38A1C.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|AM7PR08MB5493:EE_
x-ms-office365-filtering-correlation-id: e691e475-4c9a-431c-cf7f-08db8cbafd78
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Sj60MBY2mmRTYEdwXUHmSRJhe+Yuvcm9rhh8dpEbmhC+5LK401nlFxwzidAXXCoRelV25uB4E9n2kPrj3tnTt9tLhbpJKDG2OASz8/W05xsoUNv4zA8QZpk3fXpfVdC3StWYV1dhbjTybwm1t/hjYL4RCb254lsdYhjYi/1lEajgVWdMFKIHQhqI4rORSgkKZz6wH2DcZgotHUOcIMOBIFmnJw3Jkxq424V5J4ZFAwdt0AHZ4clFRGTv2o78XoykRigJQBEM6O+DXgqAOLa5r93OZgcjXsfU5zd/n1hV1jms4PKvX0mu4wBmeWAFamKCO6baxxIYJ6fuLStW4HECxyaI/DNTkMB+RNWrPRfz5mJFUiY/T7owq2BeZcwOtkh7SbxQG0xKRF5JouDth5x2shML0pt6rIMxlVtyYbNBFZ0hxPO4izsSoAGvXqya+ICq0+2twmIf8YBj64sqsZSovSofxjPbA0QS0jlhlKbY9yP0geM4+diGmj8RuudApVgO8wDWhvf1EYYPVRpTHeAJ5cQ8azoNqKPnbe3VkMvLR9+3t8chmtFHK9drLyDPjeKZPCyHsJGKEgH6NCNh6eF8VO8plVeDl6HNUh6q0VQyToMmuqMm2oISb5qT9pl/c0G7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199021)(9686003)(7696005)(478600001)(54906003)(110136005)(71200400001)(83380400001)(38070700005)(33656002)(86362001)(55016003)(4744005)(2906002)(186003)(26005)(6506007)(316002)(38100700002)(122000001)(66446008)(52536014)(66476007)(4326008)(66946007)(66556008)(76116006)(64756008)(41300700001)(8936002)(8676002)(5660300002)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eRqseQ0n7b60e58+59zNs9PjMBSyUD4SmTnWMsWQEl+MG86VHKSTpJJ3KJs3?=
 =?us-ascii?Q?Or0W0oMho4ZxNW1fKWk9hn/yTes85IsEuIu9+zAZSrlZwaLwU0VdmATGfXvv?=
 =?us-ascii?Q?zNR7D56NM3cXUD7EiB6A7MSapoO8d7YczY3D6Y6fz94rRqhnAxk6kVlsyl2V?=
 =?us-ascii?Q?rBhg1dA6od/SBOZ4thgU7myJcIP/RZq4sSw8MKpe4YQBcPOQc5nrMOqgDT+8?=
 =?us-ascii?Q?kDD8reywqT/bZl6qCbT5MIT/aLSl1xXBaaiXx4NMrtBvoxdbyUfRo/sWRRlz?=
 =?us-ascii?Q?UzjEUcmBUqWvJuJ5XB7HT8IbjpT6xZMaI0gRvp7BlqO4AH47O2el322CqrDk?=
 =?us-ascii?Q?1UFJj4Ih3nuibO0fO/1JKH97DlwJRDIW8dt+CT0kETRxQBiN6SYFdo5SGUeM?=
 =?us-ascii?Q?X5YO/F3WcDz8AI17mt+QhE9rAOj20oDv6A4eo3n306Daxxkapiw+vb5FMWGF?=
 =?us-ascii?Q?2/H5+wKCRQ/BGUXfTMiLOc38LFfyVnxTBIL8AcTP0em6W3rkb+aKTUAf65L3?=
 =?us-ascii?Q?2JSPi/63AxUJnAfh09qZjJF6puDF7O3oP07BMCFBwxnnIlc/i3tHAeELv97z?=
 =?us-ascii?Q?CvX4VnZ7bv9lCPBiZ6g4ZADufAaBvt4aglNlQCsyL5tXlL7OZMIVt5dRCnIK?=
 =?us-ascii?Q?k86BzE4HG0AEkae13A/i9L9XiLJd9kXLtdcdPl9EGA+xS6jFC5dXbgdvm+ew?=
 =?us-ascii?Q?0ljCB0aIvovYyz3B9wtIzvMwKhVtMnWc1rxjFnvt4UO5Chk94R5MIvXtFc0P?=
 =?us-ascii?Q?e+DHMWQqxwgiEtV2T3U708GiFcU8+vbnXcL2NaQ8/weWLHbvVLIQT8lln3OY?=
 =?us-ascii?Q?6PjR6TLDiJnxzcq/JZtHR/Q5PyM7zAXBVJ2Z+zmrtW0gsPUXWhFh+Px7sw9K?=
 =?us-ascii?Q?QYeWUsxcRkPQF1039to5Dqjo85m2BL28LgD+tl87kZO4wXJ5hG8y6j7YHGFv?=
 =?us-ascii?Q?l8W4CtKrHmU3rtkgTZKclc7WpZDnGlWN12OCZSJAy8Dy5VIH9l3mboMYsXJb?=
 =?us-ascii?Q?NdfxlkLDUXi5QXUKbUGtD7v/TUiY8FpFPUsnOxnMQpoEQnztAGLOJs37Bf5M?=
 =?us-ascii?Q?LcqxUsS5667VtMR2KVjUaMsV8LmYt5M+BuJg8k7GPBWbeTCBq5K4Lf0MKBqB?=
 =?us-ascii?Q?Wu3DiwD2VYFXZuO0S37D8CJOxejasaBW1H4BhgvEfFfgrKTOVDzKJfQWCQkI?=
 =?us-ascii?Q?FFhyvryWnT9Gi83ohCwgy6ng+f0maCkJpV79pSPXw+J27T1nkHUxJJYHJeDj?=
 =?us-ascii?Q?RpZOjxFopax9mbTJVTuEkg+okKJ7Zc/U/wr3ptJrSGtQJ4SqtjTP51OeXYGK?=
 =?us-ascii?Q?XG+4O1pyD8q7TYFGJJRf5hg77DMU64FKldkhKEZ3Eo8LMokbhRXfeW5EUst3?=
 =?us-ascii?Q?qdqQv/NoPBGyaP7tHmopQCnt7yyN2TaFyKJF+kLs8R6BSvllOhTcWpz9J5/W?=
 =?us-ascii?Q?2xBDlJpYyyJ7404WtfGnp7pfe5VH76gFwXV8VWV9EG7E8yyQU91RUgEmgPzF?=
 =?us-ascii?Q?lGq5XXIETJgK3CWwsNg4h6gjpRNC9zeoiWnV0xjnMoQtgMnMkZAGgW1zDq0a?=
 =?us-ascii?Q?Mi3edjSK1fYlrQiBTiQR1rWMUPvp+mMWkFS6B8LI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e691e475-4c9a-431c-cf7f-08db8cbafd78
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 02:58:14.7279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16gCKCTQp4q7YTOX49p1yBpxNkW3sRhkM+3epYnQUtKKosJZ/0M+qohYTaJcGZisB9SEkrpyOncQFoZcie85mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5493

Hi Julien,

> -----Original Message-----
> Subject: [PATCH] xen/dt: Rework the prototype of dt_property_read_string(=
)
> to help Eclair
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Eclair vXXX is unable to prove the parameter out_string will only be
> used the return of dt_property_read_string() is 0. So it will consider
> that MISRA C:2012 Rule 9.1 was violated.
>=20
> Rework the prototype so the string is returned and use ERR_PTR() to
> embed the error code.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> The XXX should be replaced with the version of Eclair. Nicola, can you
> provide it?

I am seeing some ongoing discussions about the commit message, but
the code itself looks good to me, and I also tested this patch to make
sure things are good, so:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


