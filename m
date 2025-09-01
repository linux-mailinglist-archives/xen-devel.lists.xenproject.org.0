Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A4BB3E61B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 15:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104842.1455882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4xG-0007NY-Oe; Mon, 01 Sep 2025 13:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104842.1455882; Mon, 01 Sep 2025 13:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4xG-0007LR-JP; Mon, 01 Sep 2025 13:52:18 +0000
Received: by outflank-mailman (input) for mailman id 1104842;
 Mon, 01 Sep 2025 13:52:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5fby=3M=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ut4xE-0006av-RG
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:52:17 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dde3dcd1-873a-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 15:52:15 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB8345.eurprd03.prod.outlook.com (2603:10a6:20b:509::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 13:52:09 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Mon, 1 Sep 2025
 13:52:09 +0000
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
X-Inumbo-ID: dde3dcd1-873a-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TC2zlMcK+F094JTxi0+3KPIGFRQAkwUNEqJQRqL/XCTQZvx7/ROCn8SKbRYb2vaadmGs0mutPhseOWNLYrsq/9mtsLORvByYArlHi0V62DnzRpSYX5vN43tmxREDbkJZF/jLi+efYasYnPNWoGN9V4QJlp+sSR0KsR/7tEbkkfZdZDwwW0D6l1MMuE5vmyluhStkq5S+2OQH/7pK4/LN/xdgp/LdCePldyqcejcrF0HHnZqDZ/F2RoFOwR9myayoiSa0IDMMOpFdr1MxVDGfaEu6F/YWcDlJbctNSkCao0XudPnQyTfR0LpaQjAgF++RGTqJfcWKcWhs9/7WahLRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20T5ISGy8h7E4wQRZxZEgundHszIygrbBdCU0Wjq894=;
 b=pBBfMrf2Pi+zYe2D5Lda2mZtZbkGfc+gZ35fHi4ZaU0XoUJ5ShGkEbuqQBcl/xDFMpnNlrkz9tvx6V9whF4f024j/ih/oN8FAmkbW2TcnYjVyghdK1zX3CujKPQ1vnwrgwkgk0DIwyiCZk4iPltEYZ/Opknf32+Qw8Gc2ElECi7cJMvQ197UdLechFmcQSnZbZ9C+Vsj15Hmj07+p7PBRsc/D9eRNd/RPOjarKtW6cjgNsCXT2OV6w+3vMr3G/W25/JXHwE5e74nJ+VaBMdOQ+quDMTZeZh+MYUTvBeanc0e5Esfm3VBlKBigc4dZl2JlDwtwHWBvzZ3LoXPMQqtbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20T5ISGy8h7E4wQRZxZEgundHszIygrbBdCU0Wjq894=;
 b=rGFBla3hI8pUPypZWpZ8zmyorN2C0sIviCpdAPGalS6cmc84VSy/hVPYtMKf6soJ0Xikkm3Y6t9y5eADonyviczET/dlng9RdmHBhs8zxX5GhAQ9QsxPGc8L4WG8ggSAs1umJUIZ3PAAfb+lkJwwXCh0tK/D0BLMGuIs7lMrD699Ozl3ZHZ+w17TM1p5xuyWZrr0lD6fE8IAn8hNcQUk+YVGkAAzXGtVZZ1o5dhIWyiE6BEBc1ZOQ/ZIoH+ThSIdpOlmESkiKANp9QmJZN4IT9Rd5M7j/p0Y39SoRDBT39i72vy5RUeBXg/WZs8/Y5MTX+FYmcrlsejcT2kFFdOdKw==
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
Subject: [PATCH v7 1/4] xen/arm: add generic SCI subsystem
Thread-Topic: [PATCH v7 1/4] xen/arm: add generic SCI subsystem
Thread-Index: AQHcG0ecscQZ4aZyyUGW7Lpq7NOpDA==
Date: Mon, 1 Sep 2025 13:52:09 +0000
Message-ID:
 <04ae6dd2cd4a7e1617a564db5315f293812fcee2.1756734682.git.oleksii_moisieiev@epam.com>
References: <cover.1756734682.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1756734682.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB8345:EE_
x-ms-office365-filtering-correlation-id: 40fd31c0-7c85-4a83-a68f-08dde95ebee8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?n4lAt1aVYk55fKdQ+lq5l+Btvr7Yw0/t3687E/BymZ/8FXV7pJf/4LT/E7?=
 =?iso-8859-1?Q?s96MRR2UU9gYtIr15yd5BcCaeS42LIpPoKNNlBQiuD1q72P4YDP4MKUNbB?=
 =?iso-8859-1?Q?uH1/VSbGIQGgP+b+e/5EEccKuNthuDfmOmwq5NSSekJgK3BigdNcObkHjC?=
 =?iso-8859-1?Q?bqv5VqGRpO7yQrZx8MF4ET5JQ+KacU3URhvQERAPfj2dNhUWUsXx0W4UX7?=
 =?iso-8859-1?Q?gx3tsgbdYzD2bE0TkHZ4pJFpK9SpwKYrByBBMdlok8XIxbp3Tjj4WqpQkN?=
 =?iso-8859-1?Q?G9GdEI//hsgvOBgTYtlFUD/I4eyQthkhs1z/6l2qv2mLsDlH/EgiXGACXu?=
 =?iso-8859-1?Q?L8iPHwU5TjPt8TaYMGjlHOuJ25DaX0FuuQJ96vMhcybqPAvhlcMSaXczGu?=
 =?iso-8859-1?Q?Wu65w9qD4drNLtEhhkKCqVm9lU6wvsVPPFrtLTr0RqAreGt+rcF+SxRSh2?=
 =?iso-8859-1?Q?Oa0UHe6Hym9iGGGAoHN6G2rVGc1d0lFCiNOnPcq+sYfLbWjYsjBRtOsglW?=
 =?iso-8859-1?Q?iTBvh7qBuu9bviNFqy+P13182t/C1//CLzJFL7+EuOA69847F0AvkNXNfc?=
 =?iso-8859-1?Q?Ly300BmUIW0mLq6L6revz0FGP6jy+esFpGcccK5qi1kKhAfTA9CKvkujLt?=
 =?iso-8859-1?Q?1VUUn0wCz5VVZ0QKOLEEgNrkOrM5YDaEdyAaq5rN0iQEUyKuQgpjjqoeOG?=
 =?iso-8859-1?Q?bVvTMrQV/zuDsN8wLbd0Q0BcCTCQfFP8pqYcQzppapd0NHrL6JyXLDIUrU?=
 =?iso-8859-1?Q?fx2gdrr8khSWAI52mN44XgnQmOYHZwnlTLkKpf56OaBAuojIJM0Z0o9sNM?=
 =?iso-8859-1?Q?kG3sZ4z92RxwHwLpWTTjL/aJzTjI7tY/3RCO1V6sEzQs1d5/GK5c+fWPyg?=
 =?iso-8859-1?Q?vp+h+YmhrDywZFAyOatBaUQHtTsVvIXYc5gcsKLSzyQus2kupDfRG8Mero?=
 =?iso-8859-1?Q?4kNo83PvQfZm4kJeUWen9/4TKmfHTFXBMWZ9FEikroYDcAKWJY4m/B4+Kz?=
 =?iso-8859-1?Q?qBXVGW+k4F53nU17i4GCWUoucmfOB8sXGqCoWYGcW1C5ELm2yID5wcWqNJ?=
 =?iso-8859-1?Q?piujo6iM0kSpD5Y/rAbp+DJy0k4i0EG1n77A3mW8oXajQ6S9WKCXqw1X/m?=
 =?iso-8859-1?Q?LMY8wMHS88kU8UxSV9NRJq5F/sDyJFoAeJp5sLFIKNbW6Sy7cdVcm9UA6N?=
 =?iso-8859-1?Q?6zeIMFR3JnlCINyQLlHai5yOuAgBjrF4uzLv19IiMeoqbybG2FDo6dRb+N?=
 =?iso-8859-1?Q?8bU29EoE34p8jh6XIg1s8/9iiIMssd4C4kiebQG9sC9qxUTGH19SD/4PfA?=
 =?iso-8859-1?Q?ST/nK6TrwRILCSIwvLovA/W6W7qQ0tW8G24oATeqOKaZ61kNVr2xGZUVwA?=
 =?iso-8859-1?Q?n2Dn1hQFNV64+FlktljoQwb/ildZRt4weKpsyH7/nMmXknYeOxssc6P2bu?=
 =?iso-8859-1?Q?1CJWDFCQt/oITqAA+r58bJ0+BLthf2ibs1XlZlVn4/rbyQl+//IqDHH/t/?=
 =?iso-8859-1?Q?uxvq3vZCZ9Dc40QSRdJRdifJLEzMfGar2aU8xdGPz8rg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Neqlts2X8j7P1zN+GS6hJ/v6+bJ7ZMm6Ir2ZTPS+xVTUs+t1HwDshdVjsA?=
 =?iso-8859-1?Q?3hZ2suAmufVdqJMSQcoL15l9g6mtG16iq94L6BTN5OIVSZ0fBGOb3pXd0G?=
 =?iso-8859-1?Q?k3SJOLKmNnlrN+PVyZ7qMr7kB37l5P+s411e8yc2RJFrptzUVxsrg5BuAE?=
 =?iso-8859-1?Q?ua14VHC2o+/INK9/fHahQJbtjlHW2RSdBxKSRD81cSvKl6zyPqvOwNXygg?=
 =?iso-8859-1?Q?7UNQicZHoefe9ek/8iJClU2XU2boPfZtZk1D1buNBH6lwXxiIfhC0Mxb2E?=
 =?iso-8859-1?Q?s4GQdP5UCK4SFiOz5ab/RN7o1/geAf9/9TRnGnMXJlnbByd/f9CTaV4hGw?=
 =?iso-8859-1?Q?Xg7IGTx3pzswlTJQszRVRkxpMdwP7KjiETQPuxnpTTqzlHUrL+1a7zOseV?=
 =?iso-8859-1?Q?3TEy4VGdWeE5IHbr0SZs1kT1q86tQooBBjsF80QRAur7SfHhaUXWfv/uMt?=
 =?iso-8859-1?Q?ONJZjgQm9LqHi1bedyntv59C3hYBc8sh20G0x8gmAyL9Z/bf0j3ciIugm5?=
 =?iso-8859-1?Q?1oEm/BnG0/hifVTTQO6FeRmb/EElJZ8ydEu6wUSlyQkgJeG2Z/58+bqzHv?=
 =?iso-8859-1?Q?b3YF4OCXdHY9lNffJIqZ2a0wbkC+qiE71jfhlJYoZx8k6LhdxkQgZKfva3?=
 =?iso-8859-1?Q?ExjppMqGBGvxWS5UnV408/GizOjjxc5rCcjh9qRuVOHvGhRZTozSDUlKG7?=
 =?iso-8859-1?Q?2NH55lmXazYQaXcWrEaaUhEV6q32ffr13DSfZgs1byyvuosGA0GHRDmbeW?=
 =?iso-8859-1?Q?uQXYA2hSgW/a+2wKtR57UXBFNIo0F7mmsQtEBhAlB40EAxuMawNH12mMED?=
 =?iso-8859-1?Q?iUf2mn11ktlKZurpR+tb6flLBB6fJ8bMbPyvv5T+GdfZa++lhoVJqnYEcM?=
 =?iso-8859-1?Q?gDyMIlFmm5LX5xUI5oE/99FWfI4cuLJnqVta+GuWMdfqS1tNUQ8ykYQLEM?=
 =?iso-8859-1?Q?LScT7sjXwihDuHHHS3GTTu7qVtSo4SShOWCvvSF3wgUXyxqHNZDq4lU78Q?=
 =?iso-8859-1?Q?zeQ3caQjGYp2LG5tKKGmVDqVnZGQQh09UVtjsWhGvAGGDjTpTZSvoCxp/f?=
 =?iso-8859-1?Q?H3Cuy/bOZ6lgLKcn3LxqIk9LQKYKardStKxREPSDXoRkPkkdUrvSxkZ1A5?=
 =?iso-8859-1?Q?eAWr0aXB754j1HgCJiJtRU1M4r2KKrZy3zTsKVi4lHjprzYNZOVB7emTRD?=
 =?iso-8859-1?Q?vv41OTGu2Ry5Q7KbwMH48xZYh0XN+FiHl2or7RyhdofwOHDJC2xP9Z9B58?=
 =?iso-8859-1?Q?opOTb7GQ0Mzql3RCxY4JCgqHS10t1FKawA+aBAMUHoE+TnWMS6iomasJjv?=
 =?iso-8859-1?Q?Guw347Kep6MrSdjXk3j+1GAnc/DN2FhAkt8feRmHzGuulpJWt+lHir9oFG?=
 =?iso-8859-1?Q?1OJ0RmWJ7JY72yx8+aDaYaV18X5NhO7LmQUWKargILsLYfSHGXvIkNsOAQ?=
 =?iso-8859-1?Q?nQXYn7/nz3KO+f9HDB4n1yb06pCyzrxaoSWtIZk2nX5K/DbY/0kZ43hedd?=
 =?iso-8859-1?Q?PZgSeznM5a0xaZ5qWYxEvNxAPf79Cq+hm9hBYTxXahMLbo5g1kC1/EGCl8?=
 =?iso-8859-1?Q?y7t0ZF9aFPi3vvAGwX1U0qdOVRNtifcGG9do1r8JwU8t6TXk0eGCCk0lGT?=
 =?iso-8859-1?Q?FtcO2gHUjRYj77X9FwGdjdhobtKheTTF4Bl3ndAmdybsYW8WiYBpZzjA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fd31c0-7c85-4a83-a68f-08dde95ebee8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 13:52:09.5067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LyGGFpleyHScvKByd/KgRhpMGroE+m/MhWb6jwfy1Pffr5lkw2MsSgqN7AVdRNOYMHfSDWJZdn4IrNP0I9A6CIFJjPD8qQMAmEMcms+1gTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8345

This patch adds the basic framework for ARM SCI mediator. SCI is System
Control Interface, which is designed to redirect requests from the Domains
to ARM specific Firmware (for example SCMI). This will allow the devices,
passed-through to the different Domains, to access to the System resources
(such as clocks/resets etc) by sending requests to the firmware.

ARM SCI subsystem allows to implement different SCI drivers to handle
specific ARM firmware interfaces (like ARM SCMI) and mediate requests
-between the Domains and the Firmware. Also it allows SCI drivers to perfor=
m
proper action during Domain creation/destruction which is vital for
handling use cases like Domain reboot.

This patch introduces new DEVICE_FIRMWARE device subclass for probing SCI
drivers basing on device tree, SCI drivers register itself with
DT_DEVICE_START/END macro. On init - the SCI drivers should register its
SCI ops with sci_register(). Only one SCI driver can be supported.

At run-time, the following SCI API calls are introduced:

- sci_domain_sanitise_config() called from arch_sanitise_domain_config()
- sci_domain_init() called from arch_domain_create()
- sci_relinquish_resources() called from domain_relinquish_resources()
- sci_domain_destroy() called from arch_domain_destroy()
- sci_handle_call() called from vsmccc_handle_call()
- sci_dt_handle_node()
- sci_dt_finalize() called from handle_node() (Dom0 DT)

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---

Changes in v7:
- fix sci_handl_call to make changes more readable
- fix build error when DOM0LESS_BUILD is disabled (removed
 arch_handle_passthrough_prop from the header)
- sort headers in alphabetical order in sci.h

Changes in v6:
- rebase on top of the latest master
- fix return value of sci_dt_finalize() call

Changes in v5:
- update Maintainers file. Set role as a Reviewer
- rebased on the latest master branch
- Introduce arch_handle_passthrough_prop call to handle arm specific nodes

Changes in v4:
- fix SPDX-License
- rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
- move XEN_DOMCTL_assign_device code in separate patch
- Add documentation for SCI SCMI drivers

 MAINTAINERS                             |   6 +
 xen/arch/arm/device.c                   |   5 +
 xen/arch/arm/dom0less-build.c           |   8 +
 xen/arch/arm/domain.c                   |  12 +-
 xen/arch/arm/domain_build.c             |   8 +
 xen/arch/arm/firmware/Kconfig           |   8 +
 xen/arch/arm/firmware/Makefile          |   1 +
 xen/arch/arm/firmware/sci.c             | 154 ++++++++++++++++++
 xen/arch/arm/include/asm/domain.h       |   5 +
 xen/arch/arm/include/asm/firmware/sci.h | 200 ++++++++++++++++++++++++
 xen/arch/arm/vsmc.c                     |   3 +-
 xen/common/device-tree/dom0less-build.c |   4 +
 xen/include/asm-generic/device.h        |   1 +
 xen/include/public/arch-arm.h           |   4 +
 xen/include/xen/dom0less-build.h        |   3 +
 15 files changed, 420 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c4886c1159..31dbba54bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -509,6 +509,12 @@ R:	George Dunlap <gwd@xenproject.org>
 S:	Supported
 F:	xen/common/sched/
=20
+SCI MEDIATORS
+R:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+S:	Supported
+F:	xen/arch/arm/firmware/sci.c
+F:	xen/arch/arm/include/asm/firmware/sci.h
+
 SEABIOS UPSTREAM
 M:	Wei Liu <wl@xen.org>
 S:	Supported
diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 11523750ae..74b54cad34 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -13,6 +13,7 @@
 #include <xen/iocap.h>
 #include <xen/lib.h>
=20
+#include <asm/firmware/sci.h>
 #include <asm/setup.h>
=20
 int map_irq_to_domain(struct domain *d, unsigned int irq,
@@ -303,6 +304,10 @@ int handle_device(struct domain *d, struct dt_device_n=
ode *dev, p2m_type_t p2mt,
                 return res;
             }
         }
+
+        res =3D sci_assign_dt_device(d, dev);
+        if ( res )
+            return res;
     }
=20
     res =3D map_device_irqs_to_domain(d, dev, own_device, irq_ranges);
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index c8d07213e2..0094cf9e40 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -22,6 +22,7 @@
=20
 #include <asm/arm64/sve.h>
 #include <asm/domain_build.h>
+#include <asm/firmware/sci.h>
 #include <asm/grant_table.h>
 #include <asm/setup.h>
=20
@@ -272,6 +273,12 @@ int __init init_vuart(struct domain *d, struct kernel_=
info *kinfo,
     return rc;
 }
=20
+int __init arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                        struct dt_device_node *node)
+{
+    return sci_assign_dt_device(kinfo->bd.d, node);
+}
+
 int __init arch_parse_dom0less_node(struct dt_device_node *node,
                                     struct boot_domain *bd)
 {
@@ -281,6 +288,7 @@ int __init arch_parse_dom0less_node(struct dt_device_no=
de *node,
=20
     d_cfg->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
+    d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
=20
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
     {
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 863ae18157..1a8585d02b 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -24,6 +24,7 @@
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/regs.h>
+#include <asm/firmware/sci.h>
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
@@ -699,7 +700,7 @@ int arch_sanitise_domain_config(struct xen_domctl_creat=
edomain *config)
         return -EINVAL;
     }
=20
-    return 0;
+    return sci_domain_sanitise_config(config);
 }
=20
 int arch_domain_create(struct domain *d,
@@ -791,6 +792,9 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl =3D config->arch.sve_vl;
 #endif
=20
+    if ( (rc =3D sci_domain_init(d, config)) !=3D 0 )
+        goto fail;
+
     return 0;
=20
 fail:
@@ -851,6 +855,7 @@ void arch_domain_destroy(struct domain *d)
     domain_vgic_free(d);
     domain_vuart_free(d);
     free_xenheap_page(d->shared_info);
+    sci_domain_destroy(d);
 #ifdef CONFIG_ACPI
     free_xenheap_pages(d->arch.efi_acpi_table,
                        get_order_from_bytes(d->arch.efi_acpi_len));
@@ -1044,6 +1049,7 @@ enum {
     PROG_p2m_root,
     PROG_p2m,
     PROG_p2m_pool,
+    PROG_sci,
     PROG_done,
 };
=20
@@ -1103,6 +1109,10 @@ int domain_relinquish_resources(struct domain *d)
         ret =3D relinquish_p2m_mapping(d);
         if ( ret )
             return ret;
+    PROGRESS(sci):
+        ret =3D sci_relinquish_resources(d);
+        if ( ret )
+            return ret;
=20
     PROGRESS(p2m_root):
         /*
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a9e4153e3c..039aa71439 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -28,6 +28,7 @@
 #include <asm/setup.h>
 #include <asm/tee/tee.h>
 #include <asm/pci.h>
+#include <asm/firmware/sci.h>
 #include <asm/platform.h>
 #include <asm/psci.h>
 #include <asm/setup.h>
@@ -1640,6 +1641,9 @@ static int __init handle_node(struct domain *d, struc=
t kernel_info *kinfo,
         return 0;
     }
=20
+    if ( sci_dt_handle_node(d, node) )
+        return 0;
+
     /*
      * The vGIC does not support routing hardware PPIs to guest. So
      * we need to skip any node using PPIs.
@@ -1740,6 +1744,10 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
         if ( res )
             return res;
=20
+        res =3D sci_dt_finalize(d, kinfo->fdt);
+        if ( res )
+            return res;
+
         /*
          * Create a second memory node to store the ranges covering
          * reserved-memory regions.
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index 817da745fd..fc7918c7fc 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -1,3 +1,11 @@
+config ARM_SCI
+	bool
+	depends on ARM
+	help
+	  This option enables generic Arm SCI (System Control Interface) mediator=
s
+	  support. It allows domains to control system resources via one of
+	  Arm SCI mediators drivers implemented in XEN, like SCMI.
+
 menu "Firmware Drivers"
=20
 config SCMI_SMC
diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefil=
e
index a5e4542666..71bdefc24a 100644
--- a/xen/arch/arm/firmware/Makefile
+++ b/xen/arch/arm/firmware/Makefile
@@ -1 +1,2 @@
+obj-$(CONFIG_ARM_SCI) +=3D sci.o
 obj-$(CONFIG_SCMI_SMC) +=3D scmi-smc.o
diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
new file mode 100644
index 0000000000..e1522e10e2
--- /dev/null
+++ b/xen/arch/arm/firmware/sci.c
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic part of the SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#include <xen/acpi.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/firmware/sci.h>
+
+static const struct sci_mediator_ops __read_mostly *cur_mediator;
+
+int sci_register(const struct sci_mediator_ops *ops)
+{
+    if ( cur_mediator )
+        return -EEXIST;
+
+    if ( !ops->domain_init || !ops->domain_destroy || !ops->handle_call )
+        return -EINVAL;
+
+    cur_mediator =3D ops;
+
+    return 0;
+};
+
+bool sci_handle_call(struct cpu_user_regs *args)
+{
+    if ( unlikely(!cur_mediator) )
+        return false;
+
+    return cur_mediator->handle_call(args);
+}
+
+int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *conf=
ig)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    return cur_mediator->domain_init(d, config);
+}
+
+int sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->domain_sanitise_config )
+        return 0;
+
+    return cur_mediator->domain_sanitise_config(config);
+}
+
+void sci_domain_destroy(struct domain *d)
+{
+    if ( !cur_mediator )
+        return;
+
+    cur_mediator->domain_destroy(d);
+}
+
+int sci_relinquish_resources(struct domain *d)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->relinquish_resources )
+        return 0;
+
+    return cur_mediator->relinquish_resources(d);
+}
+
+bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->dom0_dt_handle_node )
+        return 0;
+
+    return cur_mediator->dom0_dt_handle_node(d, node);
+}
+
+int sci_dt_finalize(struct domain *d, void *fdt)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->dom0_dt_finalize )
+        return 0;
+
+    return cur_mediator->dom0_dt_finalize(d, fdt);
+}
+
+int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
+{
+    struct dt_phandle_args ac_spec;
+    int index =3D 0;
+    int ret;
+
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->assign_dt_device )
+        return 0;
+
+    while ( !dt_parse_phandle_with_args(dev, "access-controllers",
+                                        "#access-controller-cells", index,
+                                        &ac_spec) )
+    {
+        printk(XENLOG_DEBUG "sci: assign device %s to %pd\n",
+               dt_node_full_name(dev), d);
+
+        ret =3D cur_mediator->assign_dt_device(d, &ac_spec);
+        if ( ret )
+            return ret;
+
+        index++;
+    }
+
+    return 0;
+}
+
+static int __init sci_init(void)
+{
+    struct dt_device_node *np;
+    unsigned int num_sci =3D 0;
+    int rc;
+
+    dt_for_each_device_node(dt_host, np)
+    {
+        rc =3D device_init(np, DEVICE_FIRMWARE, NULL);
+        if ( !rc && num_sci )
+        {
+            printk(XENLOG_ERR
+                   "SCMI: Only one SCI controller is supported. found seco=
nd %s\n",
+                   np->name);
+            return -EOPNOTSUPP;
+        }
+        else if ( !rc )
+            num_sci++;
+        else if ( rc !=3D -EBADF && rc !=3D -ENODEV )
+            return rc;
+    }
+
+    return 0;
+}
+
+__initcall(sci_init);
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index a3487ca713..af3e168374 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -120,6 +120,11 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+#ifdef CONFIG_ARM_SCI
+    bool sci_enabled;
+    /* ARM SCI driver's specific data */
+    void *sci_data;
+#endif
=20
 }  __cacheline_aligned;
=20
diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include=
/asm/firmware/sci.h
new file mode 100644
index 0000000000..66c88cec3c
--- /dev/null
+++ b/xen/arch/arm/include/asm/firmware/sci.h
@@ -0,0 +1,200 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic ARM SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#ifndef __ASM_ARM_SCI_H
+#define __ASM_ARM_SCI_H
+
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/lib.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#ifdef CONFIG_ARM_SCI
+
+struct sci_mediator_ops {
+    /*
+     * Called during domain construction. If it is requested to enable
+     * SCI support, so SCI driver can create own structures for the new do=
main
+     * and inform firmware about new domain (if required).
+     * Mandatory.
+     */
+    int (*domain_init)(struct domain *d,
+                       struct xen_domctl_createdomain *config);
+
+    /*
+     * Called during domain construction. The SCI driver uses
+     * it to sanitize domain SCI configuration parameters.
+     * Optional.
+     */
+    int (*domain_sanitise_config)(struct xen_domctl_createdomain *config);
+
+    /*
+     * Called during domain destruction, releases all resources, that
+     * were allocated for domain.
+     * Mandatory.
+     */
+    void (*domain_destroy)(struct domain *d);
+
+    /*
+     * Called during domain destruction to relinquish resources used
+     * by SCI driver itself and request resources releasing from firmware.
+     * Optional.
+     */
+    int (*relinquish_resources)(struct domain *d);
+
+    /* SMC/HVC Handle callback */
+    bool (*handle_call)(struct cpu_user_regs *regs);
+
+    /*
+     * Dom0 DT nodes handling callback so SCI driver can detect DT nodes i=
t
+     * need to handle and decide if those nodes need to be provided to Dom=
0.
+     * Optional.
+     */
+    bool (*dom0_dt_handle_node)(struct domain *d, struct dt_device_node *n=
ode);
+
+    /*
+     * SCI driver callback called at the end of Dom0 DT generation, so
+     * it can perform steps to modify DT to enable/disable SCI
+     * functionality for Dom0.
+     */
+    int (*dom0_dt_finalize)(struct domain *d, void *fdt);
+
+    /*
+     * SCI driver callback called when DT device is passed through to gues=
t,
+     * so SCI driver can enable device access to the domain if SCI FW prov=
ides
+     * Device specific access control functionality.
+     * Optional.
+     */
+    int (*assign_dt_device)(struct domain *d, struct dt_phandle_args *ac_s=
pec);
+};
+
+
+static inline bool sci_domain_is_enabled(struct domain *d)
+{
+    return d->arch.sci_enabled;
+}
+
+/*
+ * Register SCI subsystem ops.
+ *
+ * Register SCI drivers operation and so enable SCI functionality.
+ * Only one SCI driver is supported.
+ */
+int sci_register(const struct sci_mediator_ops *ops);
+
+/*
+ * Initialize SCI functionality for domain if configured.
+ *
+ * Initialization routine to enable SCI functionality for the domain.
+ * The SCI configuration data and decision about enabling SCI functionalit=
y
+ * for the domain is SCI driver specific.
+ */
+int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *conf=
ig);
+
+/*
+ * Sanitise domain configuration parameters.
+ *
+ */
+int sci_domain_sanitise_config(struct xen_domctl_createdomain *config);
+
+/*
+ * Destroy SCI domain instance.
+ */
+void sci_domain_destroy(struct domain *d);
+
+/*
+ * Free resources assigned to the certain domain.
+ */
+int sci_relinquish_resources(struct domain *d);
+
+/*
+ * SMC/HVC Handle callback.
+ *
+ * SCI driver acts as SMC/HVC server for the registered domains and
+ * does redirection of the domain calls to the SCI firmware,
+ * such as ARM TF-A or similar.
+ */
+bool sci_handle_call(struct cpu_user_regs *regs);
+
+/*
+ * Dom0 DT nodes handling function.
+ *
+ * Allows SCI driver to detect DT nodes it need to handle and decide if
+ * those nodes need to be provided to Dom0.
+ */
+bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node);
+
+/*
+ * Dom0 DT generation finalize.
+ *
+ * Called at the end of Dom0 DT generation, so SCI driver can perform step=
s
+ * to modify DT to enable/disable SCI functionality for Dom0.
+ */
+int sci_dt_finalize(struct domain *d, void *fdt);
+
+/*
+ * Assign DT device to domain.
+ *
+ * Called when DT device is passed through to guest, so SCI driver can ena=
ble
+ * device access to the domain if SCI FW provides "Device specific access
+ * control" functionality.
+ */
+int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
+#else
+
+static inline bool sci_domain_is_enabled(struct domain *d)
+{
+    return false;
+}
+
+static inline int sci_domain_init(struct domain *d,
+                                  struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+static inline int
+sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+static inline void sci_domain_destroy(struct domain *d)
+{}
+
+static inline int sci_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+static inline bool sci_handle_call(struct cpu_user_regs *args)
+{
+    return false;
+}
+
+static inline bool sci_dt_handle_node(struct domain *d,
+                                      struct dt_device_node *node)
+{
+    return false;
+}
+
+static inline int sci_dt_finalize(struct domain *d, void *fdt)
+{
+    return 0;
+}
+
+static inline int sci_assign_dt_device(struct domain *d,
+                                       struct dt_device_node *dev)
+{
+    return 0;
+}
+
+#endif /* CONFIG_ARM_SCI */
+
+#endif /* __ASM_ARM_SCI_H */
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 6081f14ed0..4095171533 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -12,6 +12,7 @@
 #include <public/arch-arm/smccc.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
+#include <asm/firmware/sci.h>
 #include <asm/monitor.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
@@ -232,7 +233,7 @@ static bool handle_sip(struct cpu_user_regs *regs)
     if ( platform_smc(regs) )
         return true;
=20
-    return scmi_handle_smc(regs);
+    return (scmi_handle_smc(regs)) ? true : sci_handle_call(regs);
 }
=20
 /*
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index badc227031..aaa5e9b22c 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -228,6 +228,10 @@ static int __init handle_passthrough_prop(struct kerne=
l_info *kinfo,
     if ( res < 0 )
         return res;
=20
+    res =3D arch_handle_passthrough_prop(kinfo, node);
+    if ( res )
+        return res;
+
     /* If xen_force, we allow assignment of devices without IOMMU protecti=
on. */
     if ( xen_force && !dt_device_is_protected(node) )
         return 0;
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/dev=
ice.h
index 3bd97e33c5..cb13f7faea 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -18,6 +18,7 @@ enum device_class
     DEVICE_IOMMU,
     DEVICE_INTERRUPT_CONTROLLER,
     DEVICE_PCI_HOSTBRIDGE,
+    DEVICE_FIRMWARE,
     /* Use for error */
     DEVICE_UNKNOWN,
 };
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 24840eeaa6..55eed9992c 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -327,6 +327,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
 #define XEN_DOMCTL_CONFIG_TEE_FFA       2
=20
+#define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
@@ -350,6 +352,8 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+    /* IN */
+    uint8_t arm_sci_type;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
=20
diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-bu=
ild.h
index 408859e325..faaf660424 100644
--- a/xen/include/xen/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -62,6 +62,9 @@ void set_domain_type(struct domain *d, struct kernel_info=
 *kinfo);
 int init_intc_phandle(struct kernel_info *kinfo, const char *name,
                       const int node_next, const void *pfdt);
=20
+int arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                 struct dt_device_node *node);
+
 #else /* !CONFIG_DOM0LESS_BOOT */
=20
 static inline void create_domUs(void) {}
--=20
2.34.1

