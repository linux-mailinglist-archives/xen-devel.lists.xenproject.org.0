Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D25B0D871
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 13:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052281.1420916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNU-0002yZ-HP; Tue, 22 Jul 2025 11:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052281.1420916; Tue, 22 Jul 2025 11:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNU-0002vA-Bf; Tue, 22 Jul 2025 11:41:48 +0000
Received: by outflank-mailman (input) for mailman id 1052281;
 Tue, 22 Jul 2025 11:41:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibko=2D=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ueBNT-0002RD-2H
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 11:41:47 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d82abb7e-66f0-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 13:41:45 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI2PR03MB10809.eurprd03.prod.outlook.com (2603:10a6:800:272::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 11:41:41 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Tue, 22 Jul 2025
 11:41:39 +0000
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
X-Inumbo-ID: d82abb7e-66f0-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBF0FzU7UAivJH9myFSb3n7b1yrkrVig+CiYw26bDKthzlu51wPApBxFRzdBL4l03ueAlpComW/QPsDPPWW03JypC2dDRKevSo6TSt5lulBvahyUqfje/5Vkt5WjLx1flpTxKN0hhzu9GdHCmLTgxUjTDBq9ctLEHozFeR9qYIZCu3wsRVNWMW77kVhG7Z2o3SNL5nw6rnFNR+3FxnX1tqXzRR34LZfq4tHT03Um0LfgIfy+c/y6TP21m84jwrB8iEWOC3v6rt2dQZ6k1JYPeJwOoUOC2QlryBIl+0KlsTOCruim2n15y/ADF4Q/X5TLBgRzFpR5+S8VVTZc2iC5Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH6uP6T92fUPJOOHYdRU2OEOHDWBDGnbqymyAZm2crs=;
 b=s1tUzFKJ4GDsJ00YcT9xaCazu+jcoKmXxiLOouwikEixOqj1v0waXdmwGVlVH32X9bX454q/K1c0rkuuJTyzXV8gD5j5Qk7mpWAu8J1TwuasbcrVXmb0xB0tZVO39wab2NLryEUXhkuMtYuBekMwSjxTw29SRJEfkv+1GWNH8erxHIxR+aL8ObckmmNv4WbqPYmTM+zrJXTzEV2H+ob2vssgoEZjwo1p24bII4qpg3uGhDjvZut3fVX50LZbpqC05xN+aYZPZmiRvB1SLUUASrwvpEOpX/HS1avo0wJE6buYeySranPCEEn/zmDtWOws9nhHeRxmGp51gxv1RhQfJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BH6uP6T92fUPJOOHYdRU2OEOHDWBDGnbqymyAZm2crs=;
 b=G0rsfAvhHW+XY+0O4VF1627q2/b51PYSDTM0SHclk3GQ1yOofQ9T6Kzk6YLlmXiDqWfIcJ2Q76xwYvp2ZfVWRYUExni4f++kR3h1UOSgHZ7nqbwXd+Z1u7xEq7D3hCCEgIUCo3KG98zMi0mGGceW+Tz+ZwgWtVfkAJFKH/NCNOZ7oiFjKOM8FXwXcG9oGFp+IC4t3aAZUuyrksqjOISNrzZ05IbO6vny1Ev6leJh7FaoUtc05c+CkjykvRS8Dw/olI/BbgdblydqOSflTnLN5q/RHjuUAYuJaY5lj2hg5mVWcBpq40l9PdbNca+0tQkcQiHSHHJkVoR4xPGOCppYIQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [RFC PATCH v5 03/10] xen/arm: scmi-smc: passthrough SCMI SMC to
 domain, single agent
Thread-Topic: [RFC PATCH v5 03/10] xen/arm: scmi-smc: passthrough SCMI SMC to
 domain, single agent
Thread-Index: AQHb+v2WwNOcdkSTxEeQCZiMLfCc7w==
Date: Tue, 22 Jul 2025 11:41:39 +0000
Message-ID:
 <3c8b292b345d81cd20ce260d45d3d7aac6d98702.1753184487.git.oleksii_moisieiev@epam.com>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1753184487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI2PR03MB10809:EE_
x-ms-office365-filtering-correlation-id: d60a3750-99a0-436a-0307-08ddc914b8ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6gMxcGNqQAE4ESnTFnn3X3ib6ZwAXOrY4RZKRrkGMvFBealjV8wmtFha3+?=
 =?iso-8859-1?Q?46Pp4obHSp70FG9DqVTjb8NLQcamtScaSuVWsL8/F5AjVwic02BJwJbhmz?=
 =?iso-8859-1?Q?vTKqjqVjTpIAUdSIpTY+SG5RY8Hn9MXjWSSWfgBjkxvWjU0FFNPjrPP+zK?=
 =?iso-8859-1?Q?VIsny/ICp6uA5tMLn9P+Z+xRxnSi4mxu63Xi1OeeW20tA245TRD9CNy7rI?=
 =?iso-8859-1?Q?eQBMUouJwlsSc7/A4MhZRnyYSLdqp86kV9jhmWHYjcMDostKqAXt8kXCwd?=
 =?iso-8859-1?Q?0hVOYvUlziA81AhWgCvEz7gYvb613IP8aWWcLsKyy9v8ZKfW5oa6xkQUm+?=
 =?iso-8859-1?Q?k6vUjdpnqCfRSZ9NECutzEp/xsgU5lKMwgUyixpNhujVnA/53so5nCgmpK?=
 =?iso-8859-1?Q?wT+wMPj8UZ0RcQlRSOS+uURglRUVdq1xiId/W4AQ/r32z/+CFlrcNfuuV0?=
 =?iso-8859-1?Q?ouDOS6ZVtu3DLVCd19BBMYYswklGY1i+H1H8KharyWZLl61Zb55m7IM8E0?=
 =?iso-8859-1?Q?n+mRRtu65+mdkqUmn3RdzNA182RD8Gi3VviqFr1IUM8lEXOzbR+5Scak7D?=
 =?iso-8859-1?Q?4+/Sw7LC3p7BxDzFTEM0CxTbSydygI+6DzBmGA5JmH6ZQxCFBCbGrr12zE?=
 =?iso-8859-1?Q?qtIt5KHOnqlW7lqoxExQwYnlBOY/wa1wgcwrgHUA8y79sASlwi8CYTvYeH?=
 =?iso-8859-1?Q?k4Q7jvIYmctFFchP2qRgRGjuze04kDp7gRVf71JrhC35+6YwMd9n51hKaj?=
 =?iso-8859-1?Q?Q14wK/9GCJawFhPceG+z2a1BW++UG/XPr3MZlaE0VSPJ7nyQamr319nPEb?=
 =?iso-8859-1?Q?f6LTa2wS+YRkffL4DTxmRKGcikIy3NhdXzKvmydS5BxfwcdI4K5CCBXvuX?=
 =?iso-8859-1?Q?pshSpnhnO43HPzLT7QkIjjhQwG0u7s8Ho0qlgbdTaUt9wzcX8UGpYugktj?=
 =?iso-8859-1?Q?8kgIVFamDIP8xNTahiyKLaeLEEW9CltUa24Sm2UUxmv+gbWxxmjV6ESpgA?=
 =?iso-8859-1?Q?kheW5M1Xv1fEHHGTtOiheMmgTcJcmoNworqqC/uWkJx0/7UG3SsWJ5bAZU?=
 =?iso-8859-1?Q?Hg5C33O23ToENKlM27LFEtD/MNgux+ME8dQihPWhRLV1xqYqSvpnhBJ1hn?=
 =?iso-8859-1?Q?qAfXjLOHbccWkN8T8B5JwNYdPFP0ihpaCEVyK0RVN41R4DCa9Iy3bXu0Hq?=
 =?iso-8859-1?Q?HBJ95pfYjpdUUzkXwaSu0b2tgcARbLAJnkv4+y6fLT8XFl4lRsvJ3A6frP?=
 =?iso-8859-1?Q?+fBCz4zdfhlrHBSededLay5RhbO5efAx+eMesEDinSMehITb1fEgMkajeB?=
 =?iso-8859-1?Q?4YgVrNtl+cKNGqall/RKtPwHO432zSi/kCb9MZu2PlV+xEIJxkpv1NRmKl?=
 =?iso-8859-1?Q?sY3tZbQGJHJj/Lpnjxsb3LUz2NNrHDo7f6476bHYSZFTkQV0ctgiIbHmIi?=
 =?iso-8859-1?Q?K0v0kMUfQ8I7b0Kol2dpu84U247TkQkcGw9eXusxhp6/oVr2supIfialAv?=
 =?iso-8859-1?Q?qIhZ1qOM45loR0up3X2z11AqqeobQx57pWRkFLRZ3TPg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2ll9+V0RB6SAlI44myPaNew0qckNv1QjBEu25+QcJR6Z3xvBjyStNWDO12?=
 =?iso-8859-1?Q?IVF0rwSjI5bXvwLkXlJoLwOhDStqBFLtmuWpDwcWhUJntFUPqO33d07OCv?=
 =?iso-8859-1?Q?9q7VdhNu3jQVs9kHy6ly9DsxRXIPL7nDERGhCpooAdX6sJv3paQW955d4z?=
 =?iso-8859-1?Q?51uFfT9beLBrxNH081I8bZsVYzeLITM6Rg+vNMf4el6u9cizPlWWcowAqH?=
 =?iso-8859-1?Q?4U++62VQrmf0naKeBulL/Ezmo20taQN54wAJr6iH1nOCQ0LwXUipipjyP3?=
 =?iso-8859-1?Q?SFlO5HBqa5txuOM7J9KDxS2oSMj0OiqujI0PoagJEMAN0XAGsMHPWsYgWI?=
 =?iso-8859-1?Q?dEW9dsJRJ87womZFGu+lLfjyZQWWkFti2icfP2Hm82H5Sn0NVjANqV4cCW?=
 =?iso-8859-1?Q?tEDYONyxQiu11Mf8pacMjkVeDvsfl2ITky5q6XQarNyGv261f3e7d4xvNE?=
 =?iso-8859-1?Q?cUixHUu4odmg+jHnWMUEXmcI/NIHzt94pO2NSce/bl9mi+8Qst8TGc1EVW?=
 =?iso-8859-1?Q?wUH8TPYDMxhAbZLXJJOOl0FwN/lLZfAIthgWr8phGd8twMntey0qBYDQdN?=
 =?iso-8859-1?Q?6AMtGnqyKzwQuKsPVP/Oim7l/aUcvr1A/k/tD1N6Lz6KxRis2Wd2UdOARd?=
 =?iso-8859-1?Q?4MUFmCxCeFLXKfFZ9pdJn0IYsiWDPV/2yxuslWxue7qhTBjU9G/mdUAOia?=
 =?iso-8859-1?Q?DJUq4azOb50gMjtH5Nm66j/c6p6PGA31K5uwPhgIaPvsF5NIYR6RM7+nS7?=
 =?iso-8859-1?Q?UKopTiAPSndMkZjnkuR0VoEvViGRTOilApWE/MFnfAifZESZuxKd9tiLNZ?=
 =?iso-8859-1?Q?U1Kgd69MsKTQt6fryr+HP14eod0ORbUtMeZmt8oPfwbBH+3zA4tboSlFsf?=
 =?iso-8859-1?Q?S9YHufQJdRlTdKuDyGvWhcLBEOXVIDrvufQFSydNn6vDwRUQFWzbXIAyKH?=
 =?iso-8859-1?Q?VbwQpNSkWZBlediKq1xetkWv5XhZ/MSB/BcZSp+8IrdV9HoNGe6CN0Yae/?=
 =?iso-8859-1?Q?7ZOlqpVrKf0S3KHD/Ce18W1KP2UooElRYbBEyAFmMUPIA4TN0fRqwBzq/I?=
 =?iso-8859-1?Q?LDyaNcOZ/WQIAWEIcUGhFQUtuN2BFROVlDXfg/KSItkoFkj5zMmXXjs6ig?=
 =?iso-8859-1?Q?JD5nfDLTfzQFurr7K9WgdilKph6+VZuyLEykEpjkYQ19hvSRFC+6cqbe0y?=
 =?iso-8859-1?Q?vPACKI1ZDJSpk6pzdKX8Vo1ubvj+Z9W9LjeDkLQW3wJoPB3Q+MbmpxpaTI?=
 =?iso-8859-1?Q?s5CpmHykwknd2/Ni8kcC8OByJ7RL0UZxdWa0d7JMLFx+j5xEOiP+gXbcQ4?=
 =?iso-8859-1?Q?B6NFqlmrijwHrZcTsWaH7cx0Sxtj9fkojFKMO1eRqXwpWGnMHf3NRNN8bT?=
 =?iso-8859-1?Q?A5JneoEwGZbbmfX8Kru00BlKRO7qtCekwbzIpLCx71+f3CySXjFwwCl8MG?=
 =?iso-8859-1?Q?JBp8kJfaA3L9l1V1SDueC75nMkjh/t84E0YxNx8I/KqMb7uEWmrzoCfxWE?=
 =?iso-8859-1?Q?nior78ZaTF4dQaBVNB7XMul9RjNa/kOEHCclvgLU0c51/xcWwuiCJkXp1V?=
 =?iso-8859-1?Q?JOnfK1oY15xX89PfsIDwHkyEYsD199JiS6rrAGIifyjJRzBtaM7JR3w7lF?=
 =?iso-8859-1?Q?Zmn7SbA7vCpzG0ATrnwDxL0IbWNa3nx04Fs2IEqEdKRzlmbRRkLmRTnw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60a3750-99a0-436a-0307-08ddc914b8ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 11:41:39.1200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oghOXPjohugEu/alHEAdIIiu2xp937GrkdCxbeu20vjV9cITYrQsgt5XikwSuYZ2kSX+ks2DSjCABCqbK9rkuHfybkoCox9qTKQuf/R5g9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10809

From: Grygorii Strashko <grygorii_strashko@epam.com>

The commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls
handling layer") introduces simple driver which forwards SCMI over SMC
calls from hwdom/dom0 to EL3 firmware (TF-A) with a single SCMI OSPM agent
support. While it is working gracefully for hwdom/dom0 use case it doesn't
cover "thin Dom0 with guest domain, which serves as Driver domain"
use-case. In this case HW need to be enable in Driver domain and dom0 is
performing only control functions.

The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is
pretty generic case for the default vendors SDK and new platforms.

This patch enables passthrough of SCMI SMC single agent interface to the
one guest domain serving as Driver domain.

Configure Dom0 to enable SCMI passthrough:

 - dom0: add scmi_smc_passthrough to the Xen Command Line

Enabled SCMI passthrough for guest using toolstack in the following way:

 - domD: xl.cfg add "arm_sci" option as below

   arm_sci =3D "type=3Dscmi_smc"

 - domD: xl.cfg enable access to the "arm,scmi-shmem"

iomem =3D [
    "47ff0,1@22001",
]

 - domD: add SCMI nodes to the Driver domain partial device tree as in the
 below example:

passthrough {
   scmi_shm_0: sram@22001000 {
       compatible =3D "arm,scmi-shmem";
       reg =3D <0x0 0x22001000 0x0 0x1000>;
   };

   firmware {
        compatible =3D "simple-bus";
            scmi: scmi {
                compatible =3D "arm,scmi-smc";
                shmem =3D <&scmi_shm_0>;
                ...
            }
    }
}

dom0less case configuration:

- add "xen,sci_type" property for required DomU ("xen,domain") node

   xen,sci_type=3D"scmi_smc"

- add scmi nodes to the Driver domain partial device tree the same way
as above and enable access to the "arm,scmi-shmem" according to
dom0less documentation. For example:

  scmi_shm_0: sram@22001000 {
        compatible =3D "arm,scmi-shmem";
        reg =3D <0x00 0x22001000 0x00 0x1000>;
->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
->        xen,force-assign-without-iommu;
  };

The SCMI SMC single agent interface can be enabled for one and only one
domain. In general, the configuration is similar to any other HW
passthrough, except explicitly enabling SCMI with "arm_sci" xl.cfg option.

Note that "arm,scmi-smc" and "arm,scmi-shmem" nodes will be removed from
dom0/hwdom DT in case of

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v5:
- rename dom0_scmi_smc_passthrough to scmi_smc_passthrough

Changes in v4:
- xl.cfg doc
- fix comments from Stefano Stabellini
- fix toolstack code as sugested by Anthony PERARD
  - use MATCH_OPTION()
  - move arm_sci struct and cfg params in "arch_arm"
- add SCMI passthrough for dom0less case

 docs/man/xl.cfg.5.pod.in              |  34 ++++++++
 docs/misc/arm/device-tree/booting.txt |  15 ++++
 docs/misc/xen-command-line.pandoc     |   9 +++
 tools/include/libxl.h                 |   5 ++
 tools/libs/light/libxl_arm.c          |  14 ++++
 tools/libs/light/libxl_types.idl      |  10 +++
 tools/xl/xl_parse.c                   |  36 +++++++++
 xen/arch/arm/dom0less-build.c         |  34 +++++++-
 xen/arch/arm/firmware/Kconfig         |   4 +-
 xen/arch/arm/firmware/scmi-smc.c      | 112 +++++++++++++++++++++++++-
 10 files changed, 268 insertions(+), 5 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 1d122982c6..8f1a203e21 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3073,6 +3073,40 @@ writes will be ignored.
=20
 This option is only implemented for Arm where the default is enabled.
=20
+=3Ditem B<arm_sci=3D"ARM_SCI_STRING">
+
+Set ARM_SCI specific options for the guest. ARM SCI is System
+Control Protocol allows domain to manage various functions that are provid=
ed
+by HW platform firmware.
+
+B<ARM_SCI_STRING> is a comma separated list of C<KEY=3DVALUE> settings,
+from the following list:
+
+=3Dover 4
+
+=3Ditem B<type=3DSTRING>
+
+Specifies an ARM SCI type for the guest.
+
+=3Dover 4
+
+=3Ditem B<none>
+
+Don't allow guest to use ARM SCI if present on the platform. This is the
+default value.
+
+=3Ditem B<scmi_smc>
+
+Enables ARM SCMI SMC support for the guest by enabling SCMI over SMC calls
+forwarding from domain to the EL3 firmware (like Trusted Firmware-A) with =
a
+single SCMI OSPM agent support.
+Should be used together with B<scmi_smc_passthrough> Xen command line
+option.
+
+=3Dback
+
+=3Dback
+
 =3Dback
=20
 =3Dhead3 x86
diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-t=
ree/booting.txt
index 07acc7ba64..8ea11c1551 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -307,6 +307,21 @@ with the following properties:
     passed through. This option is the default if this property is missing
     and the user does not provide the device partial device tree for the d=
omain.
=20
+- xen,sci_type
+
+    A string property specifying an ARM SCI type for the guest.
+
+    - "none"
+    Don't allow guest to use ARM SCI if present on the platform. This is t=
he
+    default value.
+
+    - "scmi_smc"
+    Enables ARM SCMI SMC support for the guest by enabling SCMI over SMC c=
alls
+    forwarding from domain to the EL3 firmware (like Trusted Firmware-A) w=
ith a
+    single SCMI OSPM agent support.
+    Should be used together with scmi_smc_passthrough Xen command line
+    option.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
=20
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 6865a61220..7a1f723e63 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1096,6 +1096,15 @@ affinities to prefer but be not limited to the speci=
fied node(s).
=20
 Pin dom0 vcpus to their respective pcpus
=20
+### scmi_smc_passthrough (ARM)
+> `=3D <boolean>`
+
+The option is available when `CONFIG_SCMI_SMC` is compiled in, and allows =
to
+enable SCMI SMC single agent interface for any, but only one guest domain,
+which serves as Driver domain. The SCMI will be disabled for Dom0/hwdom an=
d
+SCMI nodes removed from Dom0/hwdom device tree.
+(for example, thin Dom0 with Driver domain use-case).
+
 ### dtuart (ARM)
 > `=3D path [:options]`
=20
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index a8704e0268..64ca80e4cc 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -313,6 +313,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_NR_SPIS 1
=20
+/*
+ * libxl_domain_build_info has the arch_arm.sci* fields.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index ec258bdc16..e4407d6e3f 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -233,6 +233,20 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         config->arch.sve_vl =3D d_config->b_info.arch_arm.sve_vl / 128U;
     }
=20
+    switch (d_config->b_info.arch_arm.arm_sci.type) {
+    case LIBXL_ARM_SCI_TYPE_NONE:
+        config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+        break;
+    case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
+        config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
+        break;
+    default:
+        LOG(ERROR, "Unknown ARM_SCI type %d",
+            d_config->b_info.arch_arm.arm_sci.type);
+        return ERROR_FAIL;
+    }
+    LOG(DEBUG, " - SCI type=3D%u", config->arch.arm_sci_type);
+
     return 0;
 }
=20
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index 26999b77e3..c8bc0f8521 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -551,6 +551,15 @@ libxl_sve_type =3D Enumeration("sve_type", [
     (2048, "2048")
     ], init_val =3D "LIBXL_SVE_TYPE_DISABLED")
=20
+libxl_arm_sci_type =3D Enumeration("arm_sci_type", [
+    (0, "none"),
+    (1, "scmi_smc")
+    ], init_val =3D "LIBXL_ARM_SCI_TYPE_NONE")
+
+libxl_arm_sci =3D Struct("arm_sci", [
+    ("type", libxl_arm_sci_type),
+    ])
+
 libxl_rdm_reserve =3D Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -726,6 +735,7 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
                                ("vuart", libxl_vuart_type),
                                ("sve_vl", libxl_sve_type),
                                ("nr_spis", uint32, {'init_val': 'LIBXL_NR_=
SPIS_DEFAULT'}),
+                               ("arm_sci", libxl_arm_sci),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 4ffcbf624b..68d2ebeb9f 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1284,6 +1284,36 @@ out:
     if (rc) exit(EXIT_FAILURE);
 }
=20
+static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
+                                const char *str)
+{
+    int ret =3D 0;
+    char *buf2, *ptr;
+    char *oparg;
+
+    if (NULL =3D=3D (buf2 =3D ptr =3D strdup(str)))
+        return ERROR_NOMEM;
+
+    ptr =3D strtok(buf2, ",");
+    while (ptr !=3D NULL)
+    {
+        if (MATCH_OPTION("type", ptr, oparg)) {
+            ret =3D libxl_arm_sci_type_from_string(oparg, &arm_sci->type);
+            if (ret) {
+                fprintf(stderr, "Unknown ARM_SCI type: %s\n", oparg);
+                ret =3D ERROR_INVAL;
+                goto parse_error;
+            }
+        }
+
+        ptr =3D strtok(NULL, ",");
+    }
+
+parse_error:
+    free(buf2);
+    return ret;
+}
+
 void parse_config_data(const char *config_source,
                        const char *config_data,
                        int config_len,
@@ -2984,6 +3014,12 @@ skip_usbdev:
     xlu_cfg_get_defbool(config, "trap_unmapped_accesses",
                         &b_info->trap_unmapped_accesses, 0);
=20
+    if (!xlu_cfg_get_string(config, "arm_sci", &buf, 1)) {
+        if (parse_arm_sci_config(config, &b_info->arch_arm.arm_sci, buf)) =
{
+            exit(EXIT_FAILURE);
+        }
+    }
+
     parse_vkb_list(config, d_config);
=20
     d_config->virtios =3D NULL;
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 2a0bf817ba..d28143f98b 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -279,6 +279,36 @@ int __init arch_handle_passthrough_prop(struct kernel_=
info *kinfo,
     return sci_assign_dt_device(kinfo->d, node);
 }
=20
+int __init domu_dt_sci_parse(struct dt_device_node *node,
+                             struct xen_domctl_createdomain *d_cfg)
+{
+    const char *sci_type =3D NULL;
+    int ret;
+
+    d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+
+    if ( !IS_ENABLED(CONFIG_ARM_SCI) ||
+         !dt_property_read_bool(node, "xen,sci_type") )
+        return 0;
+
+    ret =3D dt_property_read_string(node, "xen,sci_type", &sci_type);
+    if ( ret )
+        return ret;
+
+    if ( !strcmp(sci_type, "none") )
+        d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+    else if ( !strcmp(sci_type, "scmi_smc") )
+        d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
+    else
+    {
+        printk(XENLOG_ERR "xen,sci_type in not valid (%s) for domain %s\n"=
,
+               sci_type, dt_node_name(node));
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 void __init arch_create_domUs(struct dt_device_node *node,
                        struct xen_domctl_createdomain *d_cfg,
                        unsigned int flags)
@@ -287,7 +317,9 @@ void __init arch_create_domUs(struct dt_device_node *no=
de,
=20
     d_cfg->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
-    d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+
+    if ( domu_dt_sci_parse(node, d_cfg) )
+        panic("Error getting SCI configuration\n");
=20
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
     {
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index bbf88fbb9a..5c5f0880c4 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -25,7 +25,9 @@ config SCMI_SMC
 	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
 	  compatible only). The value of "arm,smc-id" DT property from SCMI
 	  firmware node is used to trap and forward corresponding SCMI SMCs
-	  to firmware running at EL3, for calls coming from the hardware domain.
+	  to firmware running at EL3, for calls coming from the hardware domain o=
r
+	  driver domain.
+	  Use with EL3 firmware which supports only single SCMI OSPM agent.
=20
 endchoice
=20
diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-=
smc.c
index 13d1137592..ae759f1616 100644
--- a/xen/arch/arm/firmware/scmi-smc.c
+++ b/xen/arch/arm/firmware/scmi-smc.c
@@ -14,6 +14,8 @@
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/iocap.h>
+#include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/types.h>
=20
@@ -22,7 +24,11 @@
=20
 #define SCMI_SMC_ID_PROP   "arm,smc-id"
=20
+static bool __ro_after_init opt_scmi_smc_passthrough =3D false;
+boolean_param("scmi_smc_passthrough", opt_scmi_smc_passthrough);
+
 static uint32_t __ro_after_init scmi_smc_id;
+static struct domain __read_mostly *scmi_dom;
=20
 /*
  * Check if provided SMC Function Identifier matches the one known by the =
SCMI
@@ -50,7 +56,7 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
         return false;
=20
     /* Only the hardware domain should use SCMI calls */
-    if ( !is_hardware_domain(current->domain) )
+    if ( scmi_dom !=3D current->domain )
     {
         gdprintk(XENLOG_WARNING, "SCMI: Unprivileged access attempt\n");
         return false;
@@ -75,12 +81,45 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
     return true;
 }
=20
+static int
+scmi_smc_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    if ( config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE &&
+         config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC=
 )
+        return -EINVAL;
+
+    return 0;
+}
+
 static int scmi_smc_domain_init(struct domain *d,
                                 struct xen_domctl_createdomain *config)
 {
-    if ( !is_hardware_domain(d) )
+    /*
+     * scmi_passthrough is not enabled:
+     * - proceed only for hw_domain
+     * - fail if guest domain has SCMI enabled.
+     */
+    if ( !opt_scmi_smc_passthrough && !is_hardware_domain(d) )
+    {
+        if ( config->arch.arm_sci_type =3D=3D XEN_DOMCTL_CONFIG_ARM_SCI_SC=
MI_SMC )
+            return -EINVAL;
+        else
+            return 0;
+    }
+    /*
+     * scmi_passthrough is enabled:
+     * - ignore hw_domain
+     * - proceed only for domain with SCMI enabled.
+     */
+    if ( opt_scmi_smc_passthrough &&
+         (config->arch.arm_sci_type =3D=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE =
||
+          is_hardware_domain(d)) )
         return 0;
=20
+    if ( scmi_dom )
+        return -EEXIST;
+
+    scmi_dom =3D d;
     d->arch.sci_enabled =3D true;
     printk(XENLOG_DEBUG "SCMI: %pd init\n", d);
     return 0;
@@ -88,12 +127,77 @@ static int scmi_smc_domain_init(struct domain *d,
=20
 static void scmi_smc_domain_destroy(struct domain *d)
 {
-    if ( !is_hardware_domain(d) )
+    if ( scmi_dom && scmi_dom !=3D d )
         return;
=20
+    scmi_dom =3D NULL;
+    d->arch.sci_enabled =3D false;
     printk(XENLOG_DEBUG "SCMI: %pd destroy\n", d);
 }
=20
+/*
+ * Handle Dom0 SCMI SMC specific DT nodes
+ *
+ * if scmi_smc_passthrough=3Dfalse:
+ * - Copy SCMI nodes into Dom0 device tree.
+ * if scmi_smc_passthrough=3Dtrue:
+ * - skip SCMI nodes from Dom0 DT
+ * - give dom0 control access to SCMI shmem MMIO, so SCMI can be passed
+ *   through to guest.
+ */
+static bool scmi_smc_dt_handle_node(struct domain *d,
+                                    struct dt_device_node *node)
+{
+    static const struct dt_device_match shmem_matches[] __initconst =3D {
+        DT_MATCH_COMPATIBLE("arm,scmi-shmem"),
+        { /* sentinel */ },
+    };
+    static const struct dt_device_match scmi_matches[] __initconst =3D {
+        DT_MATCH_PATH("/firmware/scmi"),
+        { /* sentinel */ },
+    };
+
+    /* skip scmi shmem node for dom0 if scmi not enabled */
+    if ( dt_match_node(shmem_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        dt_dprintk("Skip scmi shmem node\n");
+        return true;
+    }
+
+    /*
+     * skip scmi node for dom0 if scmi not enabled, but give dom0 control
+     * access to SCMI shmem
+     */
+    if ( dt_match_node(scmi_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        struct dt_device_node *shmem_node;
+        const __be32 *prop;
+        u64 paddr, size;
+        int ret;
+
+        /* give dom0 control access to SCMI shmem */
+        prop =3D dt_get_property(node, "shmem", NULL);
+        if ( !prop )
+            return true;
+
+        shmem_node =3D dt_find_node_by_phandle(be32_to_cpu(*prop));
+        if ( !shmem_node )
+            return true;
+
+        ret =3D dt_device_get_address(shmem_node, 0, &paddr, &size);
+        if ( ret )
+            return true;
+
+        ret =3D iomem_permit_access(d, paddr_to_pfn(paddr),
+                                  paddr_to_pfn(paddr + size - 1));
+
+        dt_dprintk("Skip scmi node\n");
+        return true;
+    }
+
+    return false;
+}
+
 static int __init scmi_check_smccc_ver(void)
 {
     if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
@@ -108,8 +212,10 @@ static int __init scmi_check_smccc_ver(void)
=20
 static const struct sci_mediator_ops scmi_smc_ops =3D {
     .handle_call =3D scmi_handle_smc,
+    .domain_sanitise_config =3D scmi_smc_domain_sanitise_config,
     .domain_init =3D scmi_smc_domain_init,
     .domain_destroy =3D scmi_smc_domain_destroy,
+    .dom0_dt_handle_node =3D scmi_smc_dt_handle_node,
 };
=20
 /* Initialize the SCMI layer based on SMCs and Device-tree */
--=20
2.34.1

