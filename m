Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6ED63BD49
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 10:51:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449335.706008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozxGl-0001OS-Hk; Tue, 29 Nov 2022 09:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449335.706008; Tue, 29 Nov 2022 09:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozxGl-0001LO-Do; Tue, 29 Nov 2022 09:51:15 +0000
Received: by outflank-mailman (input) for mailman id 449335;
 Tue, 29 Nov 2022 09:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IQjj=35=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ozxGj-0001LE-T7
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 09:51:13 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2042.outbound.protection.outlook.com [40.107.13.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5be21da0-6fcb-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 10:51:13 +0100 (CET)
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8611.eurprd08.prod.outlook.com (2603:10a6:20b:563::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 29 Nov
 2022 09:50:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5880.008; Tue, 29 Nov 2022
 09:50:38 +0000
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
X-Inumbo-ID: 5be21da0-6fcb-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jm4aGdhhw52Jq2i4BHYUVbVkAALmGcZ+oDcxBjUYK5zIOdzF91YYNi0WCsi57kvZElkIXe8iTQrms3JfF7x2RRGXkVFWP6GGVA8zvHHngvtyk9ga1DX2Fz4ANrzHHt/0lM5hzqSj7K9oWsYU7tCxXO0cNnx7ILe43WTpTZFk+tyO+XvlktYTkpI4/hPk5wsILHHW0dj71PRISjbKyKKm6LB2llIo653NvLrfngfFVKqldPAX+AOpWvYUNEasFxVAh1wo2M1VqbWMwqXnbBsdpKOjhLX9iLRNsGdG45olgRYPbpEFRhwl4I99CtcmjcVKDaRNbe3mG3+boxFV+ZAVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5nIHmzlzR1OL4IKOJt+GMbsscZUl4pg5fcENDAO+QM=;
 b=F1K6dlK3O77LuSqIgQQ3q9uFqu5ofphSWNrdhQ/OUPBL/DoDT/4UTg//xte/vSC1xd4AV6CZWLRcrNGae+n9S3aEwfKpUOP9qVe7qzLAwq9Cu1A5zRL+ru6S0Xc9nd9DCAw38BkLgu8/isYQsCoDX18plfZTc4BeOlDLQIoIa7vKXJuFTG77GJtqbGks2U5ompL6HT1sDN+n49jja3L8Y6ji+PPyqI5e+pyJ7cnI9fhDnitJSep10NTcNq3lXO7ZvshegyLTLUvfDqWcQT58LOiI4jg5atEpUI0Fx6taCkunsThUsWEdCoknxdRiwT3eWLdK30rmeWWIBZ9+VYQfCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5nIHmzlzR1OL4IKOJt+GMbsscZUl4pg5fcENDAO+QM=;
 b=OU8IQrA5NuQbRX0O44N+zTM+vL6yvNBYTiUuuac93RSGNtDWobApRdlixz2bQddPy7QnDraYHcb0qwS2zPuy4ZmRek9S8LNHOL/6MBDg4Z4BYfk5/7jyc1uXWJrC+0pQIAASdPc5MKEQejXnVSKKlf9KIWc0Y2l+/3sOYmey3po=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "julien@xen.org"
	<julien@xen.org>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] Introduce more MISRA C rules to docs/misra/rules.rst
Thread-Topic: [PATCH] Introduce more MISRA C rules to docs/misra/rules.rst
Thread-Index: AQHZA4gfi8O26GJwAkiNeMgx9oJ4ZK5VqQCA
Date: Tue, 29 Nov 2022 09:50:38 +0000
Message-ID: <41BEA3DE-75E8-4E24-8F18-2DBBAE34822F@arm.com>
References: <20221129001824.2344912-1-sstabellini@kernel.org>
In-Reply-To: <20221129001824.2344912-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB3784:EE_|AS8PR08MB8611:EE_
x-ms-office365-filtering-correlation-id: 92cd4628-a1c8-4c7c-d2e5-08dad1ef2b8f
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /U5HYhDL8cPW7NIfeJ22NssZiZwHu8Fqg2wF8/mVYlqds8RIgeQDjryNPmIMirPD5SJwS6fJkhQy9zea/mm0nSV7T5K4B9bU+U9YEC6mRdJQs7J9x39JQesH1N3y3f2CbslRoGYwm4INjomy+psCF/g0BJnOTK7s1P5qc61AH+nd777MY8rUyQlmuo2ipq74ej/TynXxSuP6QAuxVDzF4vXqZFD981OvkvJf60Wwf6BIqhWx9nOpAuHanjOOeGrIUt2HpWNA7n0r4mxeZomgpZeD5KRL6gPI7YoIP0zXprZ1+PdQAe73MLJMQ5I9vCPIugIZ9IxrR4e3NnJYoY5rGZBnfL7Qo+UQM4pZzg4czIfIkyqNj1IYQ/voEgpQDvPpvS8D3dZGPPnkJihQteqobV7AntUO5DTP03obsRay8NCj7b1FFKTqLYWI4ZGDnaSM4ZL8FQV+x0YVWYtrpQNZ7Iz/T/aZwEdUbFWpzbxoPmLSuHo4ng1gglF8jHpf8LVRxp2EEH7ZkpOTYno/AD63zClS9XMJq1oHurMY5khrcobXmcnCI/uFQyJmQmg3dMj1cnoi3LdRQTSl/Mmq5vSZNXaegbTDYoXj6316hMI2fRPh1gKFZWlhebY6DzeVpuE6rUESMhj1ZxHzyVld6KENdw231wxAgeZCBKnmQmBTVCrN0flrf31Ls2YSCwUqbu5MU9Rxk4NztlNnHVSTnM7mxtxYfDjfF9vJ/ErCIFjITSiezqCf4vY8xL+usA/iwjq3yTXBSuK79AUivAMQkDGr4l/RRCbWgq0f865vTlD7bGWUCsrSTTMnIxlfKJdEzr4a
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199015)(83380400001)(6512007)(26005)(53546011)(2906002)(6506007)(6486002)(38100700002)(86362001)(5660300002)(54906003)(38070700005)(6916009)(316002)(71200400001)(122000001)(478600001)(186003)(8676002)(76116006)(66476007)(91956017)(8936002)(66946007)(64756008)(66446008)(66556008)(2616005)(41300700001)(4326008)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?InhYvf9+WiCmALpSIgTGVQKhEnvf78+wFGG3gynLFeLl1ngYxjkc1aHUgJDF?=
 =?us-ascii?Q?ne4nPziovStDWe3nsZ2e+/bnJABNzeVQFcM8PgA7Kg1rI/WULiijUngIjH87?=
 =?us-ascii?Q?atPp7HzhVF29HPKHJEJjESvvww/3QgVVZZePtAwU6XeXhHmW+Osrj5Ngca+j?=
 =?us-ascii?Q?ffwxHbK0iNBUM46HHgR7n0Po3A8mDeYTw1i4nAd3U/1rX0zYE5fRnd1EaZ+Y?=
 =?us-ascii?Q?dLhWjf/NUp/Lr0kqP5E1UfAyKv8yJHoJISy/Lcjg1NrEWatyS6E2rKMrDMLo?=
 =?us-ascii?Q?wilgxtSa3+VKUlZn80RpMrQtCAJx8avQoZ9p92tt3VJwp9oO6VdOb26Xq7l5?=
 =?us-ascii?Q?z50dIyr7niaTZPZ8AAfWc1PPlDZU0mYXQt6hmEOW/bPQ6yDpVvZ4RGB5BJso?=
 =?us-ascii?Q?xLbI9PiJapO2xyrDcAazMObT2mmF7efxJua7tOVVV9yyAzbqIQY9wWqjJ8OD?=
 =?us-ascii?Q?XWVI+ZfHZeRYt6QIBj3lJ+rMYkq9sOu7vuCzsHzz44ZYRKyKvGDSy6/LSlbj?=
 =?us-ascii?Q?dIzX7cbS/Xnku4pvh04f/kq5270uhWirJ6qGJQG79C+hBceSFyl9o4yxBZYn?=
 =?us-ascii?Q?cz8jvA3YH8dvtgBkFQKM2i01GT4Gn6YgW7oeOoa8vl684bVfIfoFkWB8LaIl?=
 =?us-ascii?Q?j+PbxXuTDymh+WTPfVTAp0n5ARQJjCrt3Mr+H0ZK3SZtYyyLbFnk3L2fbPTD?=
 =?us-ascii?Q?g0N92P5CAB3kRO4OKr5gny8w+p9d0wt54k/pbzr+4PSCkPcPt3WxwinbrkBv?=
 =?us-ascii?Q?H/y81OUbFDf4HPYun+XR19WsNL6Bw2pz9oukPD2zSefaw6/D/Qd2nZYyMhJ/?=
 =?us-ascii?Q?8zOQpGJWpgJ08PRkuPWQwPFoVe8liib3a8nmrNSUdLwFzdCERNOFs9JRtt2Y?=
 =?us-ascii?Q?mh2A5p9jgbDMsqs8cT+6wGBMVA0LcNkV9kE3R+SSvHBsRslVhDlLex1A9ee3?=
 =?us-ascii?Q?ThRiwnnzVFI7j+VKNkYwmAou2lmas24eDAdmzS0kQ+EguAtUgz6MT2WmSHlX?=
 =?us-ascii?Q?1WtiW/QcUiq5q+jFPlrdiF6jab1J9x8pPcYY6deqhmw2nA5cvyEONuXjuIxz?=
 =?us-ascii?Q?F/Jz5mliul18ULQVoMl7iWLtw4T1qVfyiAP5+yA4q4fIqiWg4OUtRBmmTZog?=
 =?us-ascii?Q?r4R4eE8uIL/rZy5vflQTKWscIwCMTQrukqrHPu4NJDjy4T3uUBLJQaLSwK1b?=
 =?us-ascii?Q?kpPBZr4Z1k6BRe8LZNBpdPqTjxgtfOMmpKfqeWV9jS08YfZWGj+4IrY13lF9?=
 =?us-ascii?Q?rKKLZYx2jAR9F6g0ZrwmNTxgao5pQxG+8euw1y2UGUrUmcv4XvRvP7C8rCpW?=
 =?us-ascii?Q?Pdaz1q1ytijjE0qMgwHqpRjQpNvGBH36llR4Ed/3hp4zcogLs6He7rGiQyu7?=
 =?us-ascii?Q?y01b0BIXjsfkoGfrFgJAGpYCBS/x0Qt6SEGAvp/UY0GW66NWe/j/BKdxjASa?=
 =?us-ascii?Q?KNM+yFgWYrrYD1raWqoPyE0O0J8TGBRReC6iYdzHNK3SUygc6iMyXRAPewMF?=
 =?us-ascii?Q?0kG9yXd04dSzIP+4FivxmXYpXYFbSfQHfA/nMxJvh0vvx4RhlI3za8qpbYFp?=
 =?us-ascii?Q?n5QhqQxFY/hw4OEpqTP8azpZOJ7cpyKRsVHVApxkG7BXV2GGp2up0ZANsxap?=
 =?us-ascii?Q?TQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C8758EADBEEB1D41B0A4E48A1D75DC06@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3784.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92cd4628-a1c8-4c7c-d2e5-08dad1ef2b8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 09:50:38.3956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jl2SbG0xWQiezOkohuAdFipQ/9DKxq0W1ga151E+hu9gn1qnnIqW11cgVampEXkBIivcy+BEG5WmzLY5qL1i8S+SASyb+O/LIyVxoKPXMKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8611

Hi,

> On 29 Nov 2022, at 00:18, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> Add the new MISRA C rules agreed by the MISRA C working group to
> docs/misra/rules.rst.
>=20
> Add a comment for Rule 19.1 to explain that Eclair's findings are
> "caution" reports, not violations.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> docs/misra/rules.rst | 36 ++++++++++++++++++++++++++++++++++++
> 1 file changed, 36 insertions(+)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 8a659d8d47..dcceab9388 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -77,11 +77,32 @@ existing codebase are work-in-progress.
>        behaviour
>      -
>=20
> +   * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_02_06.c>`_
> +     - Advisory
> +     - A function should not contain unused label declarations
> +     -
> +
> +   * - `Rule 3.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_03_01.c>`_
> +     - Required
> +     - The character sequences /* and // shall not be used within a
> +       comment
> +     -
> +
>    * - `Rule 3.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_03_02.c>`_
>      - Required
>      - Line-splicing shall not be used in // comments
>      -
>=20
> +   * - `Rule 4.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_04_01.c>`_
> +     - Required
> +     - Octal and hexadecimal escape sequences shall be terminated
> +     -
> +
> +   * - `Rule 4.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_04_02.c>`_
> +     - Advisory
> +     - Trigraphs should not be used
> +     -
> +
>    * - `Rule 5.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_05_01_2.c>`_
>      - Required
>      - External identifiers shall be distinct
> @@ -200,6 +221,21 @@ existing codebase are work-in-progress.
>        have an explicit return statement with an expression
>      -
>=20
> +   * - `Rule 17.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_17_06.c>`_
> +     - Mandatory
> +     - The declaration of an array parameter shall not contain the
> +       static keyword between the [ ]
> +     -
> +
> +   * - `Rule 19.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_19_01.c>`_
> +     - Mandatory
> +     - An object shall not be assigned or copied to an overlapping
> +       object
> +     - Be aware that the static analysis tool Eclair might report
> +       several findings for Rule 19.1 of type "caution". These are
> +       instances where Eclair is unable to verify that the code is valid
> +       in regard to Rule 19.1. Caution reports are not violations.
> +
>    * - `Rule 20.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_20_07.c>`_
>      - Required
>      - Expressions resulting from the expansion of macro parameters
> --=20
> 2.25.1
>=20


