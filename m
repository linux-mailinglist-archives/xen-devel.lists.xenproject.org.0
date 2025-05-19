Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B12ABC31F
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 17:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989959.1373915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2la-00058o-Id; Mon, 19 May 2025 15:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989959.1373915; Mon, 19 May 2025 15:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2la-00055j-EM; Mon, 19 May 2025 15:51:02 +0000
Received: by outflank-mailman (input) for mailman id 989959;
 Mon, 19 May 2025 15:51:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWXC=YD=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uH2lZ-00055d-KX
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 15:51:01 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20625.outbound.protection.outlook.com
 [2a01:111:f403:260e::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ecb8684-34c9-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 17:50:59 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB9023.eurprd03.prod.outlook.com (2603:10a6:20b:5b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 15:50:57 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 15:50:57 +0000
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
X-Inumbo-ID: 0ecb8684-34c9-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RryLzWZbIsJo6b1rJskZ7YYToVMkIPM/j1E1nn5pwHowdDghahrjTFLoikh450/w7uHEJDRWBmBqyrUf7LePsO5hfWEN2Z11ZCWkDjQo7eRGMHdm3z++Ij4lH3E+pWmzLCcR04w14t1+6eUiHg3NnHgZFMZire/BJgN0fMEBrRaxKPFYvC5+1zx6qp7iwePKxIZs36+ug8/wtImaoLNZy03EpthBCucG6Fk7gnG72Q1eRuZoM9HNjrI9ufFhpA+ztwVEn3y8Y4DDfA5nVx9q1C0T1MwsxxhOzUOSvfP9JSwR/0zwgavxbOWCHvLhqBQ92s1WPQ/H4FO8G83kJE79rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8pCd32735DZkbJkk0J7H/LgxlewCXbsG9CT2RHeX0c=;
 b=T6SSteX+rr9vSV/4oWuR8jOFSTjJkom9+vo9la56MXrSyjWjFicQbn6oHdWsI/Ck92JgAk7JG7l7lPnlZnq23RyMxSFVkL7d4rXrZAqMKuoBJVrDM4TGtAaEIxby20DHoc0Rz+ZhCz6BFjqtSUev+1ezRnoOk1xxZhfiExZgMDGasF+PsSCR/q5btD/Lk2ef602DMO/YDkjCthyeF/MaGf3mlpiq8IULtfyCm6c8pmb9Sz0ayAGSLt6omyD5aW57iag+qSrdL0mwjnRx+J0EvTN41BkVB4wgZUtwbt7Eg7OvBDBFuaEPNSDTuWJT1FRVYSjaiQ3+7P1s4h+xMZjgoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8pCd32735DZkbJkk0J7H/LgxlewCXbsG9CT2RHeX0c=;
 b=tdpXAT8qouXfxbKdYTvvOvUFlLGo6tncuN12fNRUrAUho5Di7Bf0xD+7V1Myf4MOlGanUcuGcm5ub/nfk3hxMiFF1Y98qALsYkMOl4cANPg0tCM1w2Wu0xUyWH9VYgEwwMPc3I36NxF24ZTrX7xKsdUmDn/FIEbvIb/MhIJOs3IQlzHSqI5/1lFCbyqlcGhczYbxdjGfGQ1aNeQn7wHHuDfYBrpy+iObOw0lHgD2kiLY+jRnC9Z3RxqMwhThA7m/dxQ6107WQrbU4UDoMZlX4Hlm/yLJpC796dXYXgAIUwYmVvzQFGUs00FH1dDg8bMOj14xCwPJQWcigGP4CU5Feg==
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
Subject: [RFC PATCH v4 3/8] xen/arm: scmi-smc: passthrough SCMI SMC to domain,
 single agent
Thread-Topic: [RFC PATCH v4 3/8] xen/arm: scmi-smc: passthrough SCMI SMC to
 domain, single agent
Thread-Index: AQHbyNXP6iFNbvP7Mk2Ziw3Fypk2NQ==
Date: Mon, 19 May 2025 15:50:56 +0000
Message-ID:
 <fad64016701e0dcd3ce365343f4305ca6bc67ab4.1747669845.git.oleksii_moisieiev@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1747669845.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB9023:EE_
x-ms-office365-filtering-correlation-id: 136e7324-6871-43b5-f1f9-08dd96ecf1e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+YB7kXEZb1MlHtVF5MciDrZg8XQpSuEDIt/3hNavNOpPgh4iDDudf5rVey?=
 =?iso-8859-1?Q?K1Heao3egCMeF//OEtsys5C9WxMABilK/KI6I5qCDC+THLcqDyszGoeUsO?=
 =?iso-8859-1?Q?kZij6lPcWcy6o+i8IuDrXxIXEwOETVbKe+/SF2Ex2nyerOAbwVAU2vqIkd?=
 =?iso-8859-1?Q?mG4fga8Qa+ALTS9GVY+J8XKFDFiFR2PQrfIeynr84oDJudy3RURJ47dnEu?=
 =?iso-8859-1?Q?rn+3MDDnHnEwt1rp7nBB6ICs+HWFZ8B0BmnuoPlEm6stWw8hLcTFGTTIXo?=
 =?iso-8859-1?Q?AU+qO4TxNWIZl4RE2M59lOoXvJAKs3+c7a9kUS3F0aqPhqSU4OPb1PYApe?=
 =?iso-8859-1?Q?VgQUnrOmOJDO6ImAr5rCausTEr2q1kFcvjV0/M1c5P4h+g0Z4JuSqow0Vr?=
 =?iso-8859-1?Q?HNwxIBI6YPm/qv3g5s0bVg1tIPe3ZK6H5JgUbvAKhxLJsYDhTdq2C3b7pV?=
 =?iso-8859-1?Q?rwpgbac9+qtD60fSBOV4/cqxSBEGkWW3fRAmdUioKNRMCYGfP9ey2K5Q4z?=
 =?iso-8859-1?Q?aQJBqk6h43dcZsrwFmwfjv6oVREcY4SyJ716KU68jv20O9EmFd1Zwoc73d?=
 =?iso-8859-1?Q?U0ebLh2xRSpzs/rpRToCWVYV12dWdsv83EdTfvRZFjPHyyOeQP/laQUcYC?=
 =?iso-8859-1?Q?M0Ug9hHgLOxFa9p/Q6quWbDzibTtLTO0i4sh99hNAhxWVJ7wTVcsEW1Ete?=
 =?iso-8859-1?Q?WA7l9ayMcahieW91AbFEMPow0959LDWDfaLloIxgo8P1CtrlNfNQLWoMc+?=
 =?iso-8859-1?Q?/QOvq5FdBDw8IyiwsKXw5e6MWH5DZ4tIFWpE3L1rkOF+OX6hU0VCFrZ1tB?=
 =?iso-8859-1?Q?v3xMxi2awr2wxpiqmyxoiISz13YHc6nAP6JxvB/U6WXBDp67fgLV9w1gb3?=
 =?iso-8859-1?Q?37xv33Wr2WThcYgOCjYDpvISFKYeeZXsSbcNwO1KrgvAFGvRaXb9gVLBvC?=
 =?iso-8859-1?Q?WgaC2CWw4W9pYuMInN0dZBMYvvu5ZPUrdrRR1a7QlgQQI3me1Xd/EfFtBb?=
 =?iso-8859-1?Q?Jz8EpKHqIEvPZIpnVij2NsSxcYPpIXw2f7XGg7P13S+WfVkk48ZBvu+Mxj?=
 =?iso-8859-1?Q?ptmJPO+rdVlWzyTp0e301+wuSLfhlGHei+rTxxDIDBcnRvz07LuiKdfgwv?=
 =?iso-8859-1?Q?ufw6HAvapiTrpQYycj9vf18Ynx3btqFF8ynvXKbOkU9AEWSFQG781cShPi?=
 =?iso-8859-1?Q?18F9pVHu00qxMXsjHNUMI9evX7XBKM8vgKbA3nsZgcWyz72xZxJHGND/S1?=
 =?iso-8859-1?Q?/grR18PfKo2TMhqTELEhv6VLm7u7VsbqxEFBRPc0Mq88dD2QtjMoZuq5Jw?=
 =?iso-8859-1?Q?oawbSP1MGbA2Dcaht+NHazqHvXV5l5LM55o77XgvithlH9dWCyT4kDiLkY?=
 =?iso-8859-1?Q?h6i426wzV0H18E6V2+vetFq4/f7r5zJP/SEPVjSaEVC+4sbDJzr09hsIJA?=
 =?iso-8859-1?Q?XwwX8ILfS3ni7t9PW4HnSCjyUQ2oej2Z4EZXCbILWtVE2MikQDkkHc2L4P?=
 =?iso-8859-1?Q?nFgqrA6VF/yIggDM9I78lJz8YEzR3DBC9LBijH87Uyrw//4+TELcxRJTYY?=
 =?iso-8859-1?Q?9gGVVQ4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sM6adaUoG6n5t05kQG23I1Y88LloOemG1ktX3x438fcVjygK+eRps/IJ14?=
 =?iso-8859-1?Q?NvU92GifetE8KbEiutm+0BlS9XJ5/iJqORUOl+ZkB+x+U9payRKShPGAwX?=
 =?iso-8859-1?Q?iWHeGetZT6do9UryYZ0T1kEe4lknICATL/AO62y6FgHbWR2/5uA59FTC6D?=
 =?iso-8859-1?Q?IZ3bm96ff53jFMEKaQ7FyN4AQHKc3TbzpNkRi+00mdF7ssCE3h1jpeIAY0?=
 =?iso-8859-1?Q?xmnW3KBbXJFUHU9yQThtIkfDQDdaXheXBhAhDji+5Eavj8LENWZQrbjtvw?=
 =?iso-8859-1?Q?utnGIhPaDT7IGZX/itVx33s7YHJHrXhwItL5n7o27rbBSn9NP2c9IGlV6Y?=
 =?iso-8859-1?Q?ZSf1v4TkZIZxvbPj9645z9dSdcngz/TbjmDbbIVsmMBEdJJiSNd9Jk1XWk?=
 =?iso-8859-1?Q?BCqfHIjOSMs4RLBAiyiCiIMoKS4V28gFUjOJ8zgTGKV4dWI64uqZWBGI3M?=
 =?iso-8859-1?Q?SGqqZkKREHPzYfK4LmlEJ7F6VGzH0c+ma9AGy4hSAZtUXZpARogShlkbFY?=
 =?iso-8859-1?Q?Y0Ca8CxgvU26tQbjKJNLIlR6AK1U8GmcZ1i5qgJD3tTKH76hveJZRHhzMW?=
 =?iso-8859-1?Q?O6RGD1h5Y72XKktWJ3JrP5VKN17yi1Gf1hXtnbDZvNQL0azKJ/6fCE7gaL?=
 =?iso-8859-1?Q?XI69cbD0x3jthjPNRYxEgVgwiKg3HEhNheoubtjrUIVayg0IODdU6pN/dP?=
 =?iso-8859-1?Q?F3QlI4LgdUA0rogNTmEHCnz8kCQpyLnirLR188t3y42EYTbAtqCj7A46jA?=
 =?iso-8859-1?Q?bo8wibTH3GPu9FYMXF/HbVA4coLc+LELyvH6b1FdiAaqCa313/yz7QCBzL?=
 =?iso-8859-1?Q?/Dp2n5mSHVwFssgx0WKPvkEO//yDbPPAjIMu+ZlUZ0bbFdR7F0Q3he3lxW?=
 =?iso-8859-1?Q?8qOa7VG5MQATh+995kR2P3nJLI5fHq5uFrNWafQae1+NcULb935Y67gclq?=
 =?iso-8859-1?Q?phNDbcJIf+Jg3i9x5c58grYFtYfyrkoTkt1w1r/VKXSOI4RurWIBMssLow?=
 =?iso-8859-1?Q?0t2Hu74Ftmhm59Jp3MZTOQ9qGVBf7ccZXqaBKz1W6g/c0Cd1D1AhJY653c?=
 =?iso-8859-1?Q?HZoGWeRP+ss0C13Tebqy9ZkvCMlGJDJMf0YbS9EjJcrJozbh1ylIGctsYs?=
 =?iso-8859-1?Q?JaYQIijj5Jxr56y3qZLK2XypqBv1BqfsCPWZTLsUP+WEHuLQQFbCxobwKg?=
 =?iso-8859-1?Q?n2m+3sFZzm6+036+xZlmKSKu7pZ/zeJ9/LqwtIGPus+4T5t/g+/Va+Qykb?=
 =?iso-8859-1?Q?yXkM9bF2cwcyK3K0vGz6tQWUok64Z9EPtNbt8FCLbpKT2KfDgYsLOuUZff?=
 =?iso-8859-1?Q?iwoWgclv+NWojsyTSVaJt+gy9widWbqEyVox72aKNlYEG16T9jLeFV5mTu?=
 =?iso-8859-1?Q?PBMyLcwNngHAaUy4x3nRVgFX724AnozMy6nxVcCrHluS9gWUIblG/tEDWz?=
 =?iso-8859-1?Q?sCnPWBrRTtHCkvjJ7pngtloUbNuCHy+unAyJA9jJQttzPxO2X4aK8+EOYd?=
 =?iso-8859-1?Q?/06kHMHjwNwBWMGxZh1i6Q4udM30WarAFQQ8gv+YV06PJ0PzgrICjv/9t+?=
 =?iso-8859-1?Q?sJpD3XVGF8Zu6l5TDiqH9/NbuHmd0/pnmT73tet/iVos37mT239rjSrHPF?=
 =?iso-8859-1?Q?XhQVH4CTfhSSkE7qktySglzLiovNd79Wy/mtU/ij6oVAyBphZNvxGvxw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136e7324-6871-43b5-f1f9-08dd96ecf1e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 15:50:56.7823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P1oExcoDz+9OYdvdYTCS4JCjf7kYyT+g152tiYi/7Ny+EcLclzLaBV4ohuV8Zzvino0+Ds39FQ24BsOGq6gbiyTYGXPNIFclEdBpIXZEPHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9023

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

 - dom0: add dom0_scmi_smc_passthrough to the Xen Command Line

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
 xen/arch/arm/dom0less-build.c         |  33 +++++++-
 xen/arch/arm/firmware/Kconfig         |   4 +-
 xen/arch/arm/firmware/scmi-smc.c      | 112 +++++++++++++++++++++++++-
 10 files changed, 267 insertions(+), 5 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 8e1422104e..1ccf50b8ea 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3092,6 +3092,40 @@ Otherwise, the value specified by the `nr_spis` para=
meter will be used.
 The number of SPIs should match the highest interrupt ID that will be
 assigned to the domain.
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
+Should be used together with B<dom0_scmi_smc_passthrough> Xen command line
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
index 9c881baccc..8943c04173 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -281,6 +281,21 @@ with the following properties:
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
+    Should be used together with dom0_scmi_smc_passthrough Xen command lin=
e
+    option.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
=20
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 9bbd00baef..8e50f6b7c7 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1082,6 +1082,15 @@ affinities to prefer but be not limited to the speci=
fied node(s).
=20
 Pin dom0 vcpus to their respective pcpus
=20
+### dom0_scmi_smc_passthrough (ARM)
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
index f8fe4afd7d..5fa43637ab 100644
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
index 28cea1f643..28ba9eb787 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -222,6 +222,20 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
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
index 33c9cfc1a2..aa2190ab5b 100644
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
@@ -725,6 +734,7 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
                                ("vuart", libxl_vuart_type),
                                ("sve_vl", libxl_sve_type),
                                ("nr_spis", uint32),
+                               ("arm_sci", libxl_arm_sci),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 9a3679c023..bd22be9d33 100644
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
@@ -2981,6 +3011,12 @@ skip_usbdev:
     if (!xlu_cfg_get_long (config, "nr_spis", &l, 0))
         b_info->arch_arm.nr_spis =3D l;
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
index a09c4c4bd7..0a00f03a25 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -815,6 +815,36 @@ static int __init construct_domU(struct domain *d,
     return rc;
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
 void __init create_domUs(void)
 {
     struct dt_device_node *node;
@@ -975,7 +1005,8 @@ void __init create_domUs(void)
         if ( !llc_coloring_enabled && llc_colors_str )
             panic("'llc-colors' found, but LLC coloring is disabled\n");
=20
-        d_cfg.arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+        if ( domu_dt_sci_parse(node, &d_cfg) )
+            panic("Error getting SCI configuration\n");
=20
         /*
          * The variable max_init_domid is initialized with zero, so here i=
t's
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
index 13d1137592..7470a21505 100644
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
+static bool __ro_after_init opt_dom0_scmi_smc_passthrough =3D false;
+boolean_param("dom0_scmi_smc_passthrough", opt_dom0_scmi_smc_passthrough);
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
+    if ( !opt_dom0_scmi_smc_passthrough && !is_hardware_domain(d) )
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
+    if ( opt_dom0_scmi_smc_passthrough &&
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
+ * if dom0_scmi_smc_passthrough=3Dfalse:
+ * - Copy SCMI nodes into Dom0 device tree.
+ * if dom0_scmi_smc_passthrough=3Dtrue:
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
+        shmem_node =3D dt_find_node_by_phandle(be32_to_cpup(prop));
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

