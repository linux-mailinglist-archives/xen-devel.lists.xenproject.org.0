Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECB8B3A696
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 18:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099669.1453437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urffr-0004ti-He; Thu, 28 Aug 2025 16:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099669.1453437; Thu, 28 Aug 2025 16:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urffr-0004of-Cy; Thu, 28 Aug 2025 16:40:31 +0000
Received: by outflank-mailman (input) for mailman id 1099669;
 Thu, 28 Aug 2025 16:40:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCus=3I=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1urffp-0004ma-R5
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 16:40:29 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3f4e5eb-842d-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 18:40:27 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PA1PR03MB10844.eurprd03.prod.outlook.com (2603:10a6:102:48f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 16:40:26 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Thu, 28 Aug 2025
 16:40:26 +0000
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
X-Inumbo-ID: b3f4e5eb-842d-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lD3Aivjh/5OevKM4xOVlRouGMKaNMaCCfhfri38ZqrAZOsq/NlIqLYRdUsLuP1/jVljJU8bIUSk4n5bffhT19n8unksxHHSy5OzGp/phcLNa4VlujZU7HUHHoWGZB6TiU4ina1nVAJOtyVVkdKrd94q6biXOH9da2HLeVKBPGuHsUrIA/5rSxjzZZ+Cay54batORDq+An0Fcj+WMUQXaDpZVhSzuvO8ScxoFsB2NjN6imHTmzlvtTf0hmSJ5EFlKsA6SdRQqZoqmRWoF+/fm3/q0bIVjR+BOF0BZkKysiAatLwYgPp9is2A1kbaD1LPj8J78YMBHKnx33kwIw7lqDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUyI6g6QYrqcztB9UI47RsxU2Qmm4s4rioVv00bAEDY=;
 b=wy5WmjoU9Qk+APT4HhPxy300YpY/XmI2t1vxE8DjdWKSGskBcUjIdX8c9GK2i02xomh+SG/HHFH93bufJbVLnALfCSqu1UTU0U7RdclHwet0dwsv5jaJuQKFD6L7aNpIYjhEPuVro1cczvUTDn5r3SgRk/v4mG6nUXaRxcdfwNTKtqOfEAHrs2HvGW0XCk50fHmv/AyhWZvmRusSjNUf+5hNq9lueMvSyFvcQEem4fbiMCcxibINW6DvtoClU+TL4xGA6KGAidRIyeaJO9aUK9Fj2botI9+LAZo8qaj8G8ACdE6LHz8RgxFzkzGaJM7Sh2JcYLRn5ZOdI8L/HvO3KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUyI6g6QYrqcztB9UI47RsxU2Qmm4s4rioVv00bAEDY=;
 b=ZFSkduPnaSjRb3TH7wEf0naTf0wS/Ipr4OjA/du04V0UtEEb97izs/LMnZVnbvEDIEEuTZiXuaPYzBXisCqSwZBGQSmMyhp+KF4nZghCtBQgXWgENlAKKI1pyVd4WhuIxS9uro9t1BLPKymOI1s6vGWVzED24lxX6MfK3c3mRX6R1jCSkUkVemes1gIw0XOEMKncFC9rjtLzmwVvwImLMKCy8Rgbi5YTXLI5MZUcROB0YgzILSfcvEZisOe2W1G2ugBjb09/U6ZjNcTfcdr/rmQhXH4400tFD5KNThQ3SNtqrYc7VwKAc3EYoyLij3enU8xpjw3DVkn7QjuoPHzv/w==
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
Subject: [PATCH v6 3/4] xen/arm: scmi-smc: passthrough SCMI SMC to domain,
 single agent
Thread-Topic: [PATCH v6 3/4] xen/arm: scmi-smc: passthrough SCMI SMC to
 domain, single agent
Thread-Index: AQHcGDp07aUQwsobaUO2Bmd+Gq/u2A==
Date: Thu, 28 Aug 2025 16:40:25 +0000
Message-ID:
 <02b79eaa0a611fb43a2146a5f41aec435d3db6c7.1756399156.git.oleksii_moisieiev@epam.com>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1756399156.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PA1PR03MB10844:EE_
x-ms-office365-filtering-correlation-id: 348b0454-0b2a-40a4-98c7-08dde6519737
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rb1dMANtdzBDwWfTuZAVKbne8YxCVaGyXky8mjMi7LQEhD8hPVNpgMNYYc?=
 =?iso-8859-1?Q?gKJcB2RU3mfDJ/FoRG+k5ww3fnTY1kLU/VzmC3O7SKOBi2nM3rK9F00lXa?=
 =?iso-8859-1?Q?v9mR+rE9/bQ/xSribJ2ywxQEXib2iH+ZH+eQlymh2rCParD6oavk//+QPq?=
 =?iso-8859-1?Q?xRK8/wMuY+YuN9+NGqWV34nWHaBFM5ftU6qTwAuisFQoW9z7iw4RxarYeb?=
 =?iso-8859-1?Q?t2u98yWBLXeWoWGnGrLaCgfNSU78Uo+wkLvuHWHenG9b0jVHl62lCCBWkh?=
 =?iso-8859-1?Q?oqayOjClm5jF0l76KETYo8Sq8XFhyvr7+k0vUVsWCYR6aLGnWYLaNSucjl?=
 =?iso-8859-1?Q?DJuVnbhIFgFjxPbjYjFAyuTVSJL5mDIgIhaZjVyG88XGh44+ZcNuB8i3EH?=
 =?iso-8859-1?Q?ch4hzfUi+05/xQE5eghbeJCxYWCH2aB8muq66I6mmxfWsdgN1syEGV79u8?=
 =?iso-8859-1?Q?2MunzDv2tYmkrSIsU/Apgxa2F/t1digcrDaZhEBzwcFPiPpk1cENRb0xa0?=
 =?iso-8859-1?Q?bDJA8nFuB6xsvzDFXydQUh2hbOcotcx1j1DxE6KPvXBqpwjT7JL/DLp0Xg?=
 =?iso-8859-1?Q?dfywm+28OgBJgfqyv6P3ctbvI439J9mu/jan/CfBgAaw9PqkVzU/mYNcH3?=
 =?iso-8859-1?Q?8HTrrgD9+VRy74a5dtlBsmHda8bvVFRPHvw0TGxD2beWWhFU/kS/LAqbDY?=
 =?iso-8859-1?Q?D/ECo8k07iQWnNdv7wetKpM60ZsGi84LcBwhsnQbHhPWUk/AUasi2Ikt9m?=
 =?iso-8859-1?Q?jaJsegCwHbaSeuVexocAy4uO5CXgo2016Y/NHdR5FvARRS3o+boYHHUKbt?=
 =?iso-8859-1?Q?0fH8HQ/YJ7gPOUczCGYfLKBvXtjpgEh8OXEBciu0rMIZoHyZ+1t7WgJvSW?=
 =?iso-8859-1?Q?pcwTeBdyrqjxsbBeKamb1oNQW7JQKkLTHHdg490a5Wn4gGIdJC3FN1h+ga?=
 =?iso-8859-1?Q?I+iyVjwHsK8o0xYAu4TZhlCjS32lSIpqRXrfJ2sNrixjjo+Wnc2qEIUF3P?=
 =?iso-8859-1?Q?+y93rcG38ehMmaXxK0vcIuZZ90vp+2je5PAfBdFUYSdUWIjhhAcyJUAdIZ?=
 =?iso-8859-1?Q?2gI6Ewl6a8qa6pABRUaK7JhFTAR082zUOQmjB1RBtfLiOtScaU6uSeKhm9?=
 =?iso-8859-1?Q?PokWYsFsV2dZj3MGDKv63wngHoGrJDQ5n7thVdYKccujPKXvVQwIEg417F?=
 =?iso-8859-1?Q?28JMExgwKht67PEsuxyXo4XUgghlABBT+ViTud94JfqDaAFDacDvfWO+bO?=
 =?iso-8859-1?Q?7BpfFdfJ31zpGxqPAEXF0S9c++50SSkoxP/wRHAsGftIZyDXm7DlSUXZwW?=
 =?iso-8859-1?Q?PBGb5AdumaOjbWaJgLJ5yENsinw0KiiNLV3LzfPuTZsxv8zafkBWAmj8aR?=
 =?iso-8859-1?Q?cZbgPlD8Q89ahe9cxIA56wSsxaWEj9gtUJgFTWUXCB/utiEn/D5TW8un3E?=
 =?iso-8859-1?Q?EJXzE3ouMWt/yRNRuTVDXQM7zxbesN9MWDE4BIK/VlfWK4+4we/65Hyh4J?=
 =?iso-8859-1?Q?zHjv37+17fRoisXq5S7FdHq2f8zK95sWhbOax/dng/og=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JlSHkmvKOvK/0WqOhNWhy6E9JqWrrmHCY6gt5LAf4f4BI1lgkBHvXIkHMJ?=
 =?iso-8859-1?Q?bQrrospDobvd4IjiYIU3SVuFqGe7ECMC1j1u8uH4QmdsYkM9ObvEeAx+cC?=
 =?iso-8859-1?Q?miJzy0KbbIU3xuWWpgo9SOgvckJE4U4FU0OIqRuAZBgbrgIhkiAwVa2ZhJ?=
 =?iso-8859-1?Q?/KBAVDVrnILJLplq27hBsEo/ppJV3ba+qPIbhgbOP4yxbSsInJ2q7NQEW0?=
 =?iso-8859-1?Q?8x++xRjFLwVzuwblwEMQQz35SV7OKP1mZQjqMYGEcARToJHNE72TUK7TC6?=
 =?iso-8859-1?Q?GD4PLP8SqhK01UtdlAQj25WdYlPdrIfDD9NoIjCaGU6bWTImcMx1spT751?=
 =?iso-8859-1?Q?37h5NRFgg1A6dYNspfe9A44zGHHg0BN5mH7qJaGAAuAlhrFmDsN4V48XnY?=
 =?iso-8859-1?Q?AyU1L3RKlZ1on3nNBZZfiRDuXCc4zwCE9yLjTWH35SF15w//maSOTg/WR8?=
 =?iso-8859-1?Q?RVjMSetjKoVKhMQBmLnqQBIGSnF4LsuDpJW+7YF2xvDe6Pim6r9l6tZIQI?=
 =?iso-8859-1?Q?DEajWRCOgbv0tz49cLPcIclQlC/WG/2aOwxxCquL6rP0YU1tXD59Z4F/eh?=
 =?iso-8859-1?Q?nJqfhuvIaQDhlqKUsFO5QCzxLTXj4ZmXvpepLG5vX27ZdEKDO1IcITi1xf?=
 =?iso-8859-1?Q?BEAuU89NEfV9OxBfyiDubyBwGBdIKHx5IJFcyOInfBGP2jIAKdMVjzvh7e?=
 =?iso-8859-1?Q?15m6mtCyXAs6jqUALMKzKIn4+ovFRimo7d45Uv0gDrqrjOGXH8vm8mIwlN?=
 =?iso-8859-1?Q?JrS5zJgkA8fbqhyRdvmfe5IAiQQinx9Yrm05nlweaXYRa0zWqTisBqC8gR?=
 =?iso-8859-1?Q?VfxKwQ8I1EE7UxpD3BteayOMoF5fSnXjQr79t+U1Xzm9ZwYG7GKFuwO/LG?=
 =?iso-8859-1?Q?wMA4wExdFJ8zzYjx5DB0x2guClQjlZSHqBPs3olPPWd05gerohCqpkIoTp?=
 =?iso-8859-1?Q?xOJUap7m+1mUNPkdj1I9gaTtQiDTVKocd8swvtUi9GBOgQNYAqq+QqyJ6W?=
 =?iso-8859-1?Q?Ua/HCAO22MXB7pW3Ik+stzj8la8yfkp/G5BFx9/IvIJda5CNP1nPNlVH7j?=
 =?iso-8859-1?Q?F85sPyoj6cCXtwNHsCRS6PNnkJvI9Go9AmzvH9ozhId3FLt6DqUggKoMzW?=
 =?iso-8859-1?Q?9wgeLPzq1sMp8Yoi0kbGYFN8K8lJw7EAfFKpK4hZ0X7jC7zSI1vnxVq3Xn?=
 =?iso-8859-1?Q?3LCshTx6kGi/ot41q5TsLpvqFPEkOhL6z+0neESnyBJWd+qC11e0mUDLlW?=
 =?iso-8859-1?Q?n7HuvkU6UzAEUc/Dc6wKvc5+8E72YBRLZuLMgqxFdmXmDbed4s2y8BkeyR?=
 =?iso-8859-1?Q?OKDNN7aRarMkbVoxYkCsbWzW+V+kE8y8zBZXI7ael1NpHraAdV0BPHMEvH?=
 =?iso-8859-1?Q?A2M+4Jcg5f4lnNOZVE4Xhj2ZPIRTJTOMasdp+OoxVVLhk3tMUb0CfubIRx?=
 =?iso-8859-1?Q?uggC7VzIdSu6l+WE6qpEy5FBSadhwy1d39CVIZaci9LybPexiOyqHY64qT?=
 =?iso-8859-1?Q?BdJKtLXUZva4XoMHa1pyJNBx/P6+4fTxs8833tO4Bah4QOXXzuEJ1qr5jW?=
 =?iso-8859-1?Q?wSoj6uqspC1/5Z0j6edLociENAcs/hNxtGVzetXcyGsR80/wH/JKK0LHBk?=
 =?iso-8859-1?Q?ZxS+ThlAGAJuG7rc4OLDjlSTqJYBGSv+SJrPqMXg5v62xUHrc1SaCOZA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 348b0454-0b2a-40a4-98c7-08dde6519737
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 16:40:25.9763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vdM1dgpvoESoKA5BBOxh6uLCHaCty4olO4Z3T5CnnBxfX7Re4b3CtWXSN5rsUvVUlv/H1SA2s41ue6tVSrUFnedqGxjTc/oQL1Wkvg2LLfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10844

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

 - dom0: add scmi-smc-passthrough to the Xen Command Line

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
Acked-by: Anthony PERARD <anthony.perard@vates.tech> # tools
---

Changes in v6:
- added generated helpers and types go files
- rename cmdline parameter to scmi-smc-passthrough
- fix goto tag in parse_arm_sci_config

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
 tools/golang/xenlight/helpers.gen.go  |  41 ++++++++++
 tools/golang/xenlight/types.gen.go    |  12 +++
 tools/include/libxl.h                 |   5 ++
 tools/libs/light/libxl_arm.c          |  14 ++++
 tools/libs/light/libxl_types.idl      |  10 +++
 tools/xl/xl_parse.c                   |  36 +++++++++
 xen/arch/arm/dom0less-build.c         |  34 +++++++-
 xen/arch/arm/firmware/Kconfig         |   4 +-
 xen/arch/arm/firmware/scmi-smc.c      | 112 +++++++++++++++++++++++++-
 12 files changed, 321 insertions(+), 5 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index acff45d308..3b18bcc095 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3123,6 +3123,40 @@ writes will be ignored.
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
+Should be used together with B<scmi-smc-passthrough> Xen command line
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
index 07acc7ba64..977b428608 100644
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
+    Should be used together with scmi-smc-passthrough Xen command line
+    option.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
=20
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index a75b6c9301..0a3d697396 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1097,6 +1097,15 @@ affinities to prefer but be not limited to the speci=
fied node(s).
=20
 Pin dom0 vcpus to their respective pcpus
=20
+### scmi-smc-passthrough (ARM)
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
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/h=
elpers.gen.go
index 667030cbd7..3937653dab 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -938,6 +938,35 @@ return fmt.Errorf("converting field Vcpus: %v", err)
  return nil
  }
=20
+// NewArmSci returns an instance of ArmSci initialized with defaults.
+func NewArmSci() (*ArmSci, error) {
+var (
+x ArmSci
+xc C.libxl_arm_sci)
+
+C.libxl_arm_sci_init(&xc)
+defer C.libxl_arm_sci_dispose(&xc)
+
+if err :=3D x.fromC(&xc); err !=3D nil {
+return nil, err }
+
+return &x, nil}
+
+func (x *ArmSci) fromC(xc *C.libxl_arm_sci) error {
+ x.Type =3D ArmSciType(xc._type)
+
+ return nil}
+
+func (x *ArmSci) toC(xc *C.libxl_arm_sci) (err error){defer func(){
+if err !=3D nil{
+C.libxl_arm_sci_dispose(xc)}
+}()
+
+xc._type =3D C.libxl_arm_sci_type(x.Type)
+
+ return nil
+ }
+
 // NewRdmReserve returns an instance of RdmReserve initialized with defaul=
ts.
 func NewRdmReserve() (*RdmReserve, error) {
 var (
@@ -1113,6 +1142,9 @@ x.Kernel =3D C.GoString(xc.kernel)
 x.Cmdline =3D C.GoString(xc.cmdline)
 x.Ramdisk =3D C.GoString(xc.ramdisk)
 x.DeviceTree =3D C.GoString(xc.device_tree)
+if err :=3D x.DtPassthroughNodes.fromC(&xc.dt_passthrough_nodes);err !=3D =
nil {
+return fmt.Errorf("converting field DtPassthroughNodes: %v", err)
+}
 if err :=3D x.Acpi.fromC(&xc.acpi);err !=3D nil {
 return fmt.Errorf("converting field Acpi: %v", err)
 }
@@ -1163,6 +1195,9 @@ x.ArchArm.GicVersion =3D GicVersion(xc.arch_arm.gic_v=
ersion)
 x.ArchArm.Vuart =3D VuartType(xc.arch_arm.vuart)
 x.ArchArm.SveVl =3D SveType(xc.arch_arm.sve_vl)
 x.ArchArm.NrSpis =3D uint32(xc.arch_arm.nr_spis)
+if err :=3D x.ArchArm.ArmSci.fromC(&xc.arch_arm.arm_sci);err !=3D nil {
+return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
+}
 if err :=3D x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err !=3D =
nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
@@ -1489,6 +1524,9 @@ if x.Ramdisk !=3D "" {
 xc.ramdisk =3D C.CString(x.Ramdisk)}
 if x.DeviceTree !=3D "" {
 xc.device_tree =3D C.CString(x.DeviceTree)}
+if err :=3D x.DtPassthroughNodes.toC(&xc.dt_passthrough_nodes); err !=3D n=
il {
+return fmt.Errorf("converting field DtPassthroughNodes: %v", err)
+}
 if err :=3D x.Acpi.toC(&xc.acpi); err !=3D nil {
 return fmt.Errorf("converting field Acpi: %v", err)
 }
@@ -1699,6 +1737,9 @@ xc.arch_arm.gic_version =3D C.libxl_gic_version(x.Arc=
hArm.GicVersion)
 xc.arch_arm.vuart =3D C.libxl_vuart_type(x.ArchArm.Vuart)
 xc.arch_arm.sve_vl =3D C.libxl_sve_type(x.ArchArm.SveVl)
 xc.arch_arm.nr_spis =3D C.uint32_t(x.ArchArm.NrSpis)
+if err :=3D x.ArchArm.ArmSci.toC(&xc.arch_arm.arm_sci); err !=3D nil {
+return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
+}
 if err :=3D x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err !=3D n=
il {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/typ=
es.gen.go
index e26b3cdfc7..328afe0d94 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -520,6 +520,16 @@ SveType1920 SveType =3D 1920
 SveType2048 SveType =3D 2048
 )
=20
+type ArmSciType int
+const(
+ArmSciTypeNone ArmSciType =3D 0
+ArmSciTypeScmiSmc ArmSciType =3D 1
+)
+
+type ArmSci struct {
+Type ArmSciType
+}
+
 type RdmReserve struct {
 Strategy RdmReserveStrategy
 Policy RdmReservePolicy
@@ -582,6 +592,7 @@ Kernel string
 Cmdline string
 Ramdisk string
 DeviceTree string
+DtPassthroughNodes StringList
 Acpi Defbool
 Bootloader string
 BootloaderArgs StringList
@@ -599,6 +610,7 @@ GicVersion GicVersion
 Vuart VuartType
 SveVl SveType
 NrSpis uint32
+ArmSci ArmSci
 }
 ArchX86 struct {
 MsrRelaxed Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 185f74d8a8..bc35e412da 100644
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
index faef3d63a1..c8e3f77947 100644
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
index 61660a02da..1cc41f1bff 100644
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
+                goto out;
+            }
+        }
+
+        ptr =3D strtok(NULL, ",");
+    }
+
+out:
+    free(buf2);
+    return ret;
+}
+
 void parse_config_data(const char *config_source,
                        const char *config_data,
                        int config_len,
@@ -2996,6 +3026,12 @@ skip_usbdev:
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
index 0094cf9e40..7422f4be30 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -279,6 +279,36 @@ int __init arch_handle_passthrough_prop(struct kernel_=
info *kinfo,
     return sci_assign_dt_device(kinfo->bd.d, node);
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
 int __init arch_parse_dom0less_node(struct dt_device_node *node,
                                     struct boot_domain *bd)
 {
@@ -288,7 +318,9 @@ int __init arch_parse_dom0less_node(struct dt_device_no=
de *node,
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
index 13d1137592..edc54b11b6 100644
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
+boolean_param("scmi-smc-passthrough", opt_scmi_smc_passthrough);
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

