Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3441D175C0
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 09:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201203.1516877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfa21-0003Dn-NA; Tue, 13 Jan 2026 08:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201203.1516877; Tue, 13 Jan 2026 08:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfa21-0003CI-JG; Tue, 13 Jan 2026 08:45:41 +0000
Received: by outflank-mailman (input) for mailman id 1201203;
 Tue, 13 Jan 2026 08:45:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kCXa=7S=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vfa20-0003C7-2c
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 08:45:40 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b0cfc8d-f05c-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 09:45:37 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB8709.eurprd03.prod.outlook.com
 (2603:10a6:150:93::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 08:45:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 08:45:33 +0000
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
X-Inumbo-ID: 3b0cfc8d-f05c-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gvtl0Cf1J381/sEb988NfW7LBOwqwdcNQIKmfKwPzujeogFwcHSfjI8AaFPYo9H6mE5eIenTMwQJJwJqki519E4lLaFf5dglIQCqsAYZ4l0s6rVZr6Z38cZU/ujLSjlyiEu4Rt6sT1DizRK03vxCeND1V1Svs/Cy4WiqVZytn5g7f4/KXhJe7mGZKZgOa2sr9LH2xUhfKUTOxK0U3raeMI5/NkVnLimuwc8d9unukwrd1D8LTZiIShN7DDKVjd1fnUZnymjjq/bxpJtMwP4xNA6RUVw9vt9OIIYz5wq7JJtGvK3HP6YgQujGG8SxCtfzp30xsBj/wnE5W5fjlXwcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJlY5ZCmZJOWgV9E5StvmeERj3PpIDnEnWSrTZAGkVw=;
 b=OMLdNiDCVT8NhqfVn/Nkh1gZTvhXbn6X6TXQfJ6hvr7OQ65BkpnTWIUeB0yV4vwAxlbp38yAXCoboNHdoI+2esFaOfyWlQ1JtXtGU2VdpJdfJwqEGCooNXS1vU/jtHdmAOVmNreJVfPEwmtjWyj+BGCCsLjBXLug1XumT52FL1bfTb4u96KDergiO94xivDP0hNGwxBTgWTQ9OwPCsiWEFItICoqlkxoz7ckg7otoZ86biPCUEM1qU871XoA7tEjYmrALVSwbXoK9vMZsipgeifbFqF5z0DKQybH+t+QfRvlYmUHjqNjr0Ai9+2xGTiS3gOEqKWEdDwfdWMYwNAjTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJlY5ZCmZJOWgV9E5StvmeERj3PpIDnEnWSrTZAGkVw=;
 b=CCGSv/JcsOKxBsf2ixKB0g9A2E3EK9945Q5gxnjMYArKOj0kA4tvalGtjTvpta1Lw1ZLeer9dml47+JCeou4/m62xRQbfjYiRZKgXcxlgznl9Egl9ExLx1nexm2Uouy7TUY16cb6nkSGX3r4erA2h+jLwQcxZpTYGRW9wpcmf1ByL7VoBgfwY2pdVaMRx+M0JaBrmemIu0T3t/4AXbJwhco6dypUL9sxPBz5HiPcrbl2gNlbkOZ19FU8zIDQkrrNekH9zN8sjjfyhDvYAm/vDXmyHu+9jbMr7rUPEsmk2V2kRiNfO502CqZYEeaDCz53bOXIy+OL+CNsZeTpTzvdSg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH v5 0/5] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v5 0/5] Implement CPU hotplug on Arm
Thread-Index: AQHchGj6Bf8iLxj9KkKeGyrpjQwglA==
Date: Tue, 13 Jan 2026 08:45:33 +0000
Message-ID: <cover.1768293759.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB8709:EE_
x-ms-office365-filtering-correlation-id: af8e9791-4b8f-47e3-e06c-08de52801d7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?yjB50VIXcJfNkIvLJaYd0tCtEwFr2E1dgSP5OEeDtl1ZGpiXdcnALoBkdL?=
 =?iso-8859-1?Q?r66F2LNkvpnOLep/aTz6zJLhnRnJ+pfUrYiJPD+w1i1cNHRq05cuJbU2JU?=
 =?iso-8859-1?Q?iF0T79uTtCzeDAi2PmKZCzCV2Sskhzuj/W5tip89/2AVULlCGGTgihs1+8?=
 =?iso-8859-1?Q?kSemhkKRsk8nkqEq1Z6vVE9f97xytke8BGzc0Ce9ZUrnbWu3l4nxiJIv5J?=
 =?iso-8859-1?Q?enxYzXrC8K/k2j/VWmJKQnk6vA8mnC+04T3ElXqjCqIsigVtTpqff44ees?=
 =?iso-8859-1?Q?4wwTRDtnl0xkF3WNbtP1dJBlgC0jWWYhEBViWxDX1P3Hc10CMejzn56thH?=
 =?iso-8859-1?Q?xslyXZH0OTWAW+1qNxB8ELuv3oXITEWai6VsN9jWjL8iNa8d6LdoW1spLm?=
 =?iso-8859-1?Q?sEb5wpkJgowjFMBx/re0HBZ11+KVFSHRBelxPo0FjwawCo96K83PPzAHAa?=
 =?iso-8859-1?Q?JB9Sm2ChFM6SM3gVS+JbCIBuYcYSKE8F9G4as6ylfsFZk3J3aNOZuo4LzQ?=
 =?iso-8859-1?Q?dgu02mLCad6c5pU7PeHHm6m9RziJ6i9qCQKX4rYQtpMuHUdkL5iJK1/Iwn?=
 =?iso-8859-1?Q?oyKQ+/p2DrYjBQ/wpIetm9uHHFkbKGwoyvYb5h+TxqbEhcTiPdzefu280A?=
 =?iso-8859-1?Q?1C9cmQguCskzGoidOShJwuSrhpS6wZxJuapSzZpXEdW6sgKVH69dh84oQF?=
 =?iso-8859-1?Q?CNY25ISDI3BoslwepYWQZ+tNonSIMsMYnmIuqLssPQtVhGcM+ohLgmjiwF?=
 =?iso-8859-1?Q?tChEYsZtj1zILFkFj3NGnaspf/b097zBsdJc87JkIVkBtdS7AyVDbLjZ2U?=
 =?iso-8859-1?Q?YggmqlGU8OF468fEMdvnj+p/thHtoriysIlZ9astf8asml7yYy1urcKSgo?=
 =?iso-8859-1?Q?osO/kDSiIHfMlN4vHYVAq9xil/k/YyXc6gQD42SBDAfOt6MTSsOrstuh6b?=
 =?iso-8859-1?Q?vNksJ9PXK8OuaCyZOxb4fGq/SThisNv2zSut1FTXYlY0rBoX6sDIYct7Vj?=
 =?iso-8859-1?Q?6zkLIZiLfNMKYclSbIahaz57XJ5lVgkSae9cHzBK6nk0zrmZcE2NSSjviM?=
 =?iso-8859-1?Q?sAhq57VbR3R63y1sAIMuryowenFz9k2LD6R4uawUJzP656ve3ZiOiJ/FPP?=
 =?iso-8859-1?Q?L2XORH1tBv6+vJp12kzAdFaubOFOFN4NQPw9TmsyolUAUOn+dR5WgyoHr4?=
 =?iso-8859-1?Q?wN0ZSKLiVHBnFUGrulE+npH5EZInHXCJWUxdI+nn7N28+TIMKBkh8SGn4F?=
 =?iso-8859-1?Q?I2ZiVj0eBCPAgFKeR4BF8aadnavVXL6OhbLQu+zNToAOR2hC8uJM9bh7OK?=
 =?iso-8859-1?Q?S/zrDGb1xOyXV+8TS77N8DcWgVr8ooaZIs3cb92GqMkjFHVAXI0go0MuRa?=
 =?iso-8859-1?Q?uknUWlFW/hKHael2xYvNpl4AhSvjiM11s+2faXbU6yTI7hBJBkVIfxcl8X?=
 =?iso-8859-1?Q?2CVaqF1fBl0sp0YGBAaWCErV/ZmGJRByx3cZOMvK1l4KCWBixB5Rf5Un8p?=
 =?iso-8859-1?Q?rnoVpht+rkBmbA+JRAbW+BeiDPlBa5lEWRzzkWPlqupuOD/QfMYoLE4x9S?=
 =?iso-8859-1?Q?OZKp2U+8qXF/zM9jVgXD/eVoVGC4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gpC2+MPX/5zDcN6uySrwARPP4jLtabI7zh5ZzBxG389r6y3kLw6/CDN8tB?=
 =?iso-8859-1?Q?xFgb7OXvZDWe787VCI6HTBiPxNJqs+a26VYLCN9t6QQ0Z6xQ2oQgc8JArp?=
 =?iso-8859-1?Q?0RRgU7pIEGbr1uHsGSLW4VvTEA9Iu1lzvr/W4vWi5tpC1/eGp0yEDrA10N?=
 =?iso-8859-1?Q?ycT5XdCXkajP3+21Bz5zNUJo3qqoNbGtZn5WFbiuDIUDgbw9oFw2DuwH3s?=
 =?iso-8859-1?Q?EmODRljIqzfBIPoYuuc08si09ZLXTlgwSPTPWLmeJ9C4JWw2bDCRiRJUNy?=
 =?iso-8859-1?Q?U7joM17UKObSDw71Fc23L6kVCrVt799Eglu/rkmH7oOU9sIya0Ya/yV+iq?=
 =?iso-8859-1?Q?+bqiXCdm48TrNGRXwAOdsB5ZWcpAjeuboB+z6OJbseiLLMw7dnCljnYBrz?=
 =?iso-8859-1?Q?aCxvd/a9RaAmc1NpR2i5qBFPGZQAs4ICKSZwSfF495J5nQBYBIThUd7uME?=
 =?iso-8859-1?Q?bfVF4PAoHxnhD1tOOBnCLmccFOxaTLsHVmn8Q9ocgBs6/IC9t+tQlOJee2?=
 =?iso-8859-1?Q?1iDHZtj04wd2QrPO20Q3FvntiDMOeBomBbLGv4GlEi1TxiY9GOxmMD0H1C?=
 =?iso-8859-1?Q?IbcW+Y2BctmbjqyFxS0AUBATHKA79gwmdFayzut8t/tyDMEL7fzCmXuSBA?=
 =?iso-8859-1?Q?GIGIBzmJ8JqNPiwKL1TeYA9LtyHFfnxwbSJWlg9lMyeGlB2LaIjgBtKOVV?=
 =?iso-8859-1?Q?gLieF7ltjFjtGvKtJjMlLLEm2I8Dy3q2TUZ8iYDeEVtkxHXhbPje+gnyrE?=
 =?iso-8859-1?Q?PSelc5jI/wIOXAxX8MB1O3ue3dxshT/9VR/IX6c9QYNf8RWPQjBWZnOAQ+?=
 =?iso-8859-1?Q?wgbsY1CtTHai0YQFN7Z2qp4k31Z//MDg9SHBTyHVpuxvWxYYNmC/hFglFV?=
 =?iso-8859-1?Q?/sHX1AlwtdaIcpgOYJMuVr1r7nW/m/UhAVwIx/rW/+JL/Ggs0JTJFaML1H?=
 =?iso-8859-1?Q?4Nkh+xW98btQ1jt4a4QJK4GpiZJOuo3+6LtFm/bjDQUACLiGExS/0uBIZr?=
 =?iso-8859-1?Q?vmaE1j4eW4q10llwky5gFxXnrg5Nw2kbDaTO3tovyxK0tM2GgSM/m+oXoS?=
 =?iso-8859-1?Q?p2sDeuuOytu9cNBW0AZbVPpS1y2f2Nj1nk7GcKR2EEupb+hEuSRC9Obeb2?=
 =?iso-8859-1?Q?TbtmosxZBx6EIo++hdteLjOdcc27QKHjd9DgJWIBdibOvzIDJtXGmHqQw5?=
 =?iso-8859-1?Q?q87Q026FtM/Oii4JhokCZuvm8uxxMc+BstZs/rlZe0+gomEUXX/cNI4M6h?=
 =?iso-8859-1?Q?WiHO3mVaUloJ11NKhLORZJIaWBWQqCzigoTSC0PTJaMdEhC2nHDaFiz0rh?=
 =?iso-8859-1?Q?lIz/CFNa+OMH1uBF2IM+b7wuye85k4QrXPnaEv+ybnhzb+WETCjIhrlubG?=
 =?iso-8859-1?Q?+bXTeTQQXTGdwi3zz3ddRGft5DubJ4L+wGtFI3rz6WUSvCU4XAQuQsfFYt?=
 =?iso-8859-1?Q?yRgi1FSK5HopMxNo4x2z8UQsivGUIlcIM7TbMkdwsgOy0/dgu9o4AThsxu?=
 =?iso-8859-1?Q?LPZEgMidbR0c0XTNoTuKLz6OOftxtsPCGL60Sr6FHwjiptHGEr2wJEn8zG?=
 =?iso-8859-1?Q?JzaIC+aFyAW0P1UBVfPwIlzb26BZRwtQDPtBAsVBM9AiDy9BI1accqRCk1?=
 =?iso-8859-1?Q?xDrZscCkhvEd6Xd0pRpQvxEVrYtF6fLdlF7eQkceCVwnIOUBmU1PyPGSXu?=
 =?iso-8859-1?Q?qCZXmZQJeuByrXwLKb0xixSI8QGbu5veoY0GIrJ7VDnyeERYEJfpT2hAoc?=
 =?iso-8859-1?Q?1Bj0KvSXs7zlTfLQ4wOJzwypEqngc7H/E0xFkfrNYzf4iLWl4clnaf9V1K?=
 =?iso-8859-1?Q?JbguJ9dD17ysfP1iSPXwJsnh0y341Ec=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8e9791-4b8f-47e3-e06c-08de52801d7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 08:45:33.6658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hDBBUFvm9pm9hrTBtOtN/yG4UPBEo/YGKd7QP+2AbqAzSmk7xy/+ZiCEwpV6CusJUMvPBSSXGMRN5KlOItrLZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8709

This series implements support for CPU hotplug/unplug on Arm. To achieve th=
is,
several things need to be done:

1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented on Arm64.
2. Enabled building of xen-hptool.
3. Migration of irqs from dying CPUs implemented.

Tested on QEMU.

v4->v5:
* drop merged patches
* combine "smp: Move cpu_up/down helpers to common code" with=20
  "arm/sysctl: Implement cpu hotplug ops"
* see individual patches

v3->v4:
* add irq migration patches
* see individual patches

v2->v3:
* add docs

v1->v2:
* see individual patches

Mykyta Poturai (5):
  arm/irq: Keep track of irq affinities
  arm/irq: Migrate IRQs during CPU up/down operations
  arm/sysctl: Implement cpu hotplug ops
  tools: Allow building xen-hptool without CONFIG_MIGRATE
  docs: Document CPU hotplug

 SUPPORT.md                       |  1 +
 docs/misc/cpu-hotplug.txt        | 50 +++++++++++++++++++++++++
 tools/libs/guest/Makefile.common |  2 +-
 tools/misc/Makefile              |  2 +-
 xen/arch/arm/Kconfig             |  1 +
 xen/arch/arm/gic-vgic.c          |  2 +
 xen/arch/arm/include/asm/irq.h   |  2 +
 xen/arch/arm/irq.c               | 63 +++++++++++++++++++++++++++++++-
 xen/arch/arm/smp.c               |  9 +++++
 xen/arch/arm/smpboot.c           |  6 +++
 xen/arch/arm/vgic.c              | 14 ++++++-
 xen/arch/ppc/stubs.c             |  4 ++
 xen/arch/riscv/stubs.c           |  5 +++
 xen/arch/x86/Kconfig             |  1 +
 xen/arch/x86/include/asm/smp.h   |  3 --
 xen/arch/x86/smp.c               | 33 ++---------------
 xen/arch/x86/sysctl.c            | 12 ++----
 xen/common/Kconfig               |  3 ++
 xen/common/smp.c                 | 34 +++++++++++++++++
 xen/common/sysctl.c              | 45 +++++++++++++++++++++++
 xen/include/xen/smp.h            |  4 ++
 21 files changed, 248 insertions(+), 48 deletions(-)
 create mode 100644 docs/misc/cpu-hotplug.txt

--=20
2.51.2

