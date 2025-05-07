Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A056AADBEB
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 11:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978479.1365262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCbTd-0001sC-9l; Wed, 07 May 2025 09:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978479.1365262; Wed, 07 May 2025 09:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCbTd-0001p4-6V; Wed, 07 May 2025 09:54:09 +0000
Received: by outflank-mailman (input) for mailman id 978479;
 Wed, 07 May 2025 09:54:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owRi=XX=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uCbTb-0001ot-ON
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 09:54:07 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36b692af-2b29-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 11:54:06 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB9PR03MB9758.eurprd03.prod.outlook.com
 (2603:10a6:10:453::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 09:53:58 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%6]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 09:53:58 +0000
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
X-Inumbo-ID: 36b692af-2b29-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRZHv+kAANNHnWFXNPoDY6cS54+2/Kju7I+Oj8IxB13WC5sydsAdU1cpLv/r+YX+hztbZLHba0bEt9tNzvIIYDxczBGPf123zLVLyNU7K0+n1NPHSQMvnASavln490uX0jMb8YtdoiZIVboj7o4DN6Cpi2wkHHWFKApEyE5SKdLc1WsKT0Ss+0nBLk8l27jz9Q4r6nl/Ab540+G57L0Trmhv9T2ifUDmYJOqk1ulZGJvTomCCKydADQeeI9N2QT90KEWktSc174wpNfQfP0ZBIJ+/YTS7qzB0UUNdUB6WtigHJ3Ue3uAzEj4BoyZcOj1zgdMDRjyypDtwq5s7E5DpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImhYg9dkirrA85PgTSSSHIR76WDXQMdG46XAZVEQQSk=;
 b=RylLK4KaYfKTn0cN7mZ2quujjEeZpY1d/tBgfhAH5UcBLqJjrRoYAwi1pm7teIYyj+5gGs/N7B8sNFzd2jcioZkymphrr/OPizXsMWvTqx+WouusEk7j9tR5EJKNSdjB7WeMCjSrdnElyKWNGaDl2jPSXzYo/p/vgSDszhJZ7Shu7wOYKzTAZ95V+z9Vc3zYQnzJtbCtvHpQkQtRrk0YsVq0gC7wMPqIZ1w4dKeycuhO8quPzhHmNMmx8cEf7YPz8ENWYinLZEx+IvDoc1gRCxZpjXV5eUc5SRikHqVi+GBL8ffVZEN/S28OIqwoWSCLT2mrGNnUIiuIbsrvQHu78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImhYg9dkirrA85PgTSSSHIR76WDXQMdG46XAZVEQQSk=;
 b=fDJCOTiEa8Q5g0Yk5z+34oiFKIr8TLR5xb8EtSLc45BnN+0M+CaO/s5fHpxDHWZITDJ906IwOPn+Z0T477ua9M617uS7r8QuaK979ZBM/3wAWvo1sBf/w+drgQePPz4/ZvsOByRrUIH0yivE1te1Lq7BJab/GR/G9sIugCWNqtvjUVBRmljy2PV9SoRFJ3Twr5WXXxZw+SJygGfVfzJjvJSWKMMFSO1J6e28cecH9GvYEMbP/YmdlCMERytd26zSN043TAsj91Z9lx0gFdfi7+bEH8TVxDgsX4aa7qzRkt86T8q2Fn5+zBidX9FlDdnCor2NPM/6ZvGE49EmRpeN1w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen
 Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [RFC PATCH v3 0/2] xen: add libalf fuzzing support
Thread-Topic: [RFC PATCH v3 0/2] xen: add libalf fuzzing support
Thread-Index: AQHbvzXz/i9afaO75kKXSCRcBU5Yag==
Date: Wed, 7 May 2025 09:53:58 +0000
Message-ID: <20250507095338.735228-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB9PR03MB9758:EE_
x-ms-office365-filtering-correlation-id: 5a926501-e77c-464a-007c-08dd8d4d1676
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kfUEH+kVTuPM0e7sAZEQIorlJmGgwwJVOgZJQc+Td5LvXILbow6I9O+JFm?=
 =?iso-8859-1?Q?CyQmCvGZ69vESK1w71se7m0mwdPBhMZ6eRDL8nanX7sQHWn8oZGKmUbMid?=
 =?iso-8859-1?Q?NUmPdOjdTrtrYRDtoTWyMfMHMO2QV43nsSEHXge0FBAa5zUWCr2+1BIbgI?=
 =?iso-8859-1?Q?MGAJp5Yr0ozLFBuYd0Ii+ljamFVEpa5fkD85tVRRVwUvSNHGSVTNpXobI4?=
 =?iso-8859-1?Q?i7kYTQ6s14UoudKO61kzblCiiPCOMoSGdtyUWHLFWnuyQGtiBcmMWeXLzs?=
 =?iso-8859-1?Q?4ZoCRNC0wLLCxCuHkKclvfz97coZ7y/1R7zCT1XR3M+t6ujTT5YZfsd/6J?=
 =?iso-8859-1?Q?HsFEQMo8XXaxbngTTev8u1PqzAFCEIbkk/5EGbUi+pA1Cv5YLDQn+JZFWL?=
 =?iso-8859-1?Q?pgf+fH0Wuk8SQ9/x50zVeSkDOvZAgL7U9KrwGlifOTQmD4KCOEWhALLFEF?=
 =?iso-8859-1?Q?fBsxbXE+i58JIvL2JY6JmV/3fBXJV3JtQm1MEQ3ZdtUF6jyXU1Lz5iQazF?=
 =?iso-8859-1?Q?UQZN6AaTFPVMvMMPoOaWjP4P5ws8V2x9nUhgwRPud5y69jklWIKle0BiQE?=
 =?iso-8859-1?Q?IfcDf8GL/bRH3l1q3vQ9/6TVTf0mm7Mf66KGFeXrXgdR/vYFnGyntBd6AM?=
 =?iso-8859-1?Q?2HAb47HOUV1oXM9SuQthup1vk+rJar2Tmnnc7WDnNnvZqaKQinIhAvN2g/?=
 =?iso-8859-1?Q?XuJi3oKhF9yebiVFoTRjoIuP5d07cwPgGOIXhMdyUhXDkgCGCoVw3viwsg?=
 =?iso-8859-1?Q?ZCdsr2VjDn13vmIX+Dm/K5cWcRrhQ9BckfEhuzVrzfFu2PQjXll5+2tehY?=
 =?iso-8859-1?Q?0IFtrcUyaXSEDVo8wbzKFTV93XrWvbePMEdOX3i/XA0Xf3dj54cfAHmr7b?=
 =?iso-8859-1?Q?MW1nqhcEeLzTvi0rkLapumngRe2rx3MUtox3DxrCDghCYqnk4FcYS4aapo?=
 =?iso-8859-1?Q?X6LxhUNCfNwqmLfNhmyZ2Gy680WTta5tObk4MMibbkkEnLjjirdkKXnwHl?=
 =?iso-8859-1?Q?kdenqwP5eq/sydzfu55iCH62ma2XJYBjR4KigmsrfXNZ9ozqgWw/QdkTs+?=
 =?iso-8859-1?Q?gd7Ry1yPSMYgh3BODThHYrPK+1ueJfh/fe34NSOz03O/vRUg+U+Oo7KAYW?=
 =?iso-8859-1?Q?IbbkVrNvipKwF38LDdPffrewam7VprO2Cw+UMyK6zLL/aVU6c+VR3YzSqV?=
 =?iso-8859-1?Q?u4DbpDd90CMUZKXZvckIHkddTwEmUmoyCLnEAKqBqJ1kFMdMe571sY9NIa?=
 =?iso-8859-1?Q?aNhR3C7pnDCtCn8ezS7NTiDwE6o+cuo38sNalqmh+qq41WuaCthzzOc3cq?=
 =?iso-8859-1?Q?BZAP5BdhYagOQj5irQYDdZlIdJe/q4a0pJ5aZw2HN6wmvlUJCIzS78bjN/?=
 =?iso-8859-1?Q?9VHhQwY/4fnnsxmtiuFf7aHBvKv2q/svrWWFSnOaz9wIARn2NKWt16z9Wu?=
 =?iso-8859-1?Q?J/z/fbf4VS6+42r88F1ycjU43q5+ctlPQI9oF1T72R61kNrtYrYOprgtVC?=
 =?iso-8859-1?Q?vgPE+kbeB5Fm6Tv894JPFfLlPOPmHOJ0VcKHb9FAnXUfe0npnifm4jGEgy?=
 =?iso-8859-1?Q?c3Z2Gkw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OZaxUoT82NqASv/ZVHk9VrDo3a4ihDC7JD9FbSGDytIxQaKlzvvgLXGyUR?=
 =?iso-8859-1?Q?ufv021JlndbgxHS3fJM9f1BPl9EOSzuT9hMT9+ImIk0cjxRXtkPbG5OkNe?=
 =?iso-8859-1?Q?dsKfcX6bs+ywaTznjlJAKKTmQgV3JuNp3nFq9xYfb+HSjZHWyGoG0esH11?=
 =?iso-8859-1?Q?3IgB4eAfmvQg9RWsW/sfHN8L4OUdSiloqFcH/lfeBReyPoAzr+sukBzKqn?=
 =?iso-8859-1?Q?jJQLgBleHSR5+ovkk/2JaMvSnchh7bkeQphE8D70XxTVdzfKjdCfIXc7n4?=
 =?iso-8859-1?Q?ZDR435wkq4H8GtCvYEU6hspuK86cpICZ5rO4KgEici8eQhn88f9wKo/KOS?=
 =?iso-8859-1?Q?WxbCHftFzT2DOleeBOOVXdGdHnOTqcobmqI3zItsnb0lo7wP1GbtUdoBkw?=
 =?iso-8859-1?Q?h6UKkYi48yUxiXp+ehYm03wasMV7/a2Femwl4XPrTtX4JzITeXQIucUhEv?=
 =?iso-8859-1?Q?8a0J58eEHMvmglAzK040oTPIQqBO5FbOP1oDFPZvinTruLk9fwKwZRSJdg?=
 =?iso-8859-1?Q?Fn/3h1OVirldPuxxpL5FNSb5qQYh+mKTVWuzrwiXD7IIQ6XDE7B5xxFNtd?=
 =?iso-8859-1?Q?sqmKmOI+Z4hHwPWAK4cR3HpnNmfvAawyQ5LnDTAKHk28hrH68QVn2QCw5e?=
 =?iso-8859-1?Q?pGxAKSnYEA6qa0kBz59OaDvxAAwDds7NrxT4LNBFLukxYsC6IHGhlN0wBd?=
 =?iso-8859-1?Q?vzYWfvnIxeK45sZlYnNlJiuk5brp80fJz3ij+HGVjy/iixIAec7wKUvF9Q?=
 =?iso-8859-1?Q?sozoOj8FPZ47FDiI8BSY+52iNhAJrT82U+hct26yiuykmSSvh15rM25xDQ?=
 =?iso-8859-1?Q?6J/PMWFpfzwlYs8fU9pYcioNUXUjGoRepthrl1bkLVg059dHCM/PTu4tTx?=
 =?iso-8859-1?Q?BNJ/IgGF4CAOhXz1LILhaV9YvKWFT18xtAOPCec9u+zRpU64tL9C6D45zo?=
 =?iso-8859-1?Q?h+XtRz7u/m33rJVfxIDcLkxZUYVVFl9LgN9l3BF4bho7gwB0GnZ1d3iJAO?=
 =?iso-8859-1?Q?XL0NzVuY5zYP/mGmPCx4FlS03XmtaWmA0mCMKm5fldifLBtJMKohwf0N3h?=
 =?iso-8859-1?Q?50D57yhUv0wBARJnZN9s+xa0hnaQVlynW59Pq2I90ctxrhKknd8bMqmGur?=
 =?iso-8859-1?Q?vC9ye8+b5uYcPpZLHkYowuPBjwGP+AMhQy9yFnOJ62ajy8LqUgTA9cSAE4?=
 =?iso-8859-1?Q?Crs9oiOIDbSn0QtXTXYkxYCi12D3CmHB8KBMMYWYk9TTqzpJyyqtqq3Z0d?=
 =?iso-8859-1?Q?O2SPyXC52/sAOMi30oJHnLR7rJHYgR7OAffQp9ymeTtIHkaRZWx7bt4V/0?=
 =?iso-8859-1?Q?61soDB6TTLL2mRlmsL2vkYnl/iimQuX4B2lHZTcTp6kddJhGMf8zyU/eJy?=
 =?iso-8859-1?Q?nj/whdX7DAPZajeZreSRgcHdJrvMkA6LOEa5Ip+ZmqAJ9Rc2ig88u+O8WZ?=
 =?iso-8859-1?Q?QTqIXIw7nRuQIucPYb6+aslKt/6jjXvtv7qxWdw9312IO1zZRlvQWLpXF4?=
 =?iso-8859-1?Q?vGr0CuQAortnxyU0INSNEnhU2ljeB3tGo3su9Nafjm4JljGUSeP5ITDiED?=
 =?iso-8859-1?Q?rkJTrFeqYyKzp1tIptZaNTzd/+tqoVRQIT+He89Vid8Csw7iOwHQ46+2LE?=
 =?iso-8859-1?Q?DkUWlyb1CkFwK/Yvm498IFKr717J2HvSdKG5UqlvEUY3Po8qOKPTu9Tw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a926501-e77c-464a-007c-08dd8d4d1676
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 09:53:58.4956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3JZUIPhT7Nasm4//Ds8lAS8AuwbnUhnZ5XUwCcl8tEyg/zUCOpc/XEhFTJuIaK1BYy6x4KJPIW9DSGBS8w8IM+M4MG0Oy7MYkQ3O1btNgzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9758

It is possible to use LibAFL with LibAFL-QEMU to fuzz different
baremetal programs, including Xen hypervisor. This small series
tries to add minimal (but extenable) support for fuzzing.

changes in v3:
 - Added patch with experimental CI integration
 - Severely reworked the main patch (see notes in the patch itself)

Volodymyr Babchuk (2):
  xen: add libafl-qemu fuzzer support
  ci: enable fuzzing for arm64

 automation/gitlab-ci/build.yaml        | 11 ++++
 automation/gitlab-ci/test.yaml         | 34 ++++++++++
 docs/hypervisor-guide/fuzzing.rst      | 91 ++++++++++++++++++++++++++
 xen/arch/arm/Kconfig.debug             | 37 +++++++++++
 xen/arch/arm/include/asm/libafl-qemu.h | 48 ++++++++++++++
 xen/arch/arm/psci.c                    |  5 ++
 xen/common/Makefile                    |  1 +
 xen/common/domain.c                    |  3 +
 xen/common/libafl-qemu.c               | 80 ++++++++++++++++++++++
 xen/common/sched/core.c                |  6 ++
 xen/common/shutdown.c                  |  3 +
 xen/drivers/char/console.c             |  3 +
 xen/include/xen/fuzzer.h               | 52 +++++++++++++++
 xen/include/xen/libafl-qemu.h          | 63 ++++++++++++++++++
 14 files changed, 437 insertions(+)
 create mode 100644 docs/hypervisor-guide/fuzzing.rst
 create mode 100644 xen/arch/arm/include/asm/libafl-qemu.h
 create mode 100644 xen/common/libafl-qemu.c
 create mode 100644 xen/include/xen/fuzzer.h
 create mode 100644 xen/include/xen/libafl-qemu.h

--=20
2.48.1

