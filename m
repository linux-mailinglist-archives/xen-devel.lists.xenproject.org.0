Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD46B3E61C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 15:52:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104841.1455871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4xE-00078l-AA; Mon, 01 Sep 2025 13:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104841.1455871; Mon, 01 Sep 2025 13:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4xE-00076M-70; Mon, 01 Sep 2025 13:52:16 +0000
Received: by outflank-mailman (input) for mailman id 1104841;
 Mon, 01 Sep 2025 13:52:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5fby=3M=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ut4xC-0006av-Ve
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:52:15 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcb2c5d3-873a-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 15:52:13 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB8345.eurprd03.prod.outlook.com (2603:10a6:20b:509::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 13:52:10 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Mon, 1 Sep 2025
 13:52:10 +0000
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
X-Inumbo-ID: dcb2c5d3-873a-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUUPJM7SBXDf6RD/2TXkInnuk1J8GM0QUrEHb9SDMAqMDEd1CC7YLxBTRO1SFAS7dpqZW8Ozz8Pt3lUnJm5s3JJegVuB+6cxYP1jsoohbn6x92IFAJnrCcI3EKpJyFMIEH/tVkAkTtPcIFhAPptjFh59/s9/BxZxd/BigL7zPETe2tJtv7lxg2kjCbVo6IjDjT7ILHrAvhppLkhdOfLj1vaWbyt4vjO96Nim7aURdRBL4LTplbm6m6xxjWSFqgf+9Y2X3/+jOngrCS6cgM7mmAMJ4I7KdgIMWvvhXei8TbvEkDLGRAcXEg9FVZEXiNO29Ixwp0TTEC7aFK28KvnVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vqn8KHmf08y6X1smKB3qqJnD8bCqb7hVgN7Y4e44yUo=;
 b=crjGLcaqUydpBCxcEsPoIYrV/SlK1apyic5wsHoU99jm1SG4pkQcAhK81F8iJtQ1e9NzRTfjtW1fyQ4lGaEgpiSNmqauqIBLniXNyPs9NEhniRtaIdGXJxDzHpxfTHJVybKqGK9ih540ojlVMtgDcSNUY/NoiX6jMsakClo7TPyd30IeGr0MnfGFAjVoB/Di489R8yM90gt6prKybYU5DoZhxmohVjSc9QMusgrZBRN2KZBePW/4/J4rIzAC32WQO1LHYByW6rNIpKFykeyGzak1t1gTg0GR/HHAYHe3XyDRIUmOT4HrP/WILosnM+i0kVnA5OLTj5x1ROD19Uinvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vqn8KHmf08y6X1smKB3qqJnD8bCqb7hVgN7Y4e44yUo=;
 b=kVpEGIBpKJldd+m9BQl5PoseCZGrsjQFT96/UNgKpPjDJJPgNuyDwwQ/H1a/nGNuei8yigdmyVNLbXOgLIdimHjZmcybeQ136gky+45if+cap8Ir7W7MbeBAr2uhgwTa3pft/Tt1QABA+revwnWbVaiGELsCtlw8uDdrNJoX0Ccyu8Ws+7n76E6qH6WMmqENsgQrvyUTOSfHVfFq3eMglbfUMhoc96Vnipv+mJewqTBv1gGiiYaGucw9N9o7r1Mwrj6tdpNnF0cJqJF2t2ngC6ma2jmLCSRcPBWLJcl8zcSIvWxtMz9TBeW4V3/mnJYr/60wCzRezBzfFexViYMOQQ==
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
Subject: [PATCH v7 2/4] xen/arm: scmi-smc: update to be used under sci
 subsystem
Thread-Topic: [PATCH v7 2/4] xen/arm: scmi-smc: update to be used under sci
 subsystem
Thread-Index: AQHcG0ec/HNOZvfKOkCNWjMavHIF7A==
Date: Mon, 1 Sep 2025 13:52:10 +0000
Message-ID:
 <d79e94659dc48c2a2cfcca6e58094c15cc6e9d09.1756734682.git.oleksii_moisieiev@epam.com>
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
x-ms-office365-filtering-correlation-id: 6856b965-041e-427d-6c81-08dde95ebf35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0q8UVWvsO+Wj4ULbLEa8iZh2a8OkG975JhxmXD6KoEkv2K3d87V0+OkZYy?=
 =?iso-8859-1?Q?C+Lyz0PYOvYmQ9gE573hdWsIp3o5ealOhluUbXT8FjGTHdXkQCffQ9dNps?=
 =?iso-8859-1?Q?qKHScNvzsxJKm8oj+tROjHVm3o/Nq18ym/p+1EfaP9TPi7HNkaZVQ/NCls?=
 =?iso-8859-1?Q?NCrlLaRQdUTyf7ZbM2dl5y+4qIsTNIAiF9kqHP8WvMBl4u38uk9R4Q0uY9?=
 =?iso-8859-1?Q?irPugw+KrqbmxxMMojkZFVdnQVLj2bw4mAOoGKwOm6pjqytLil8x+GgHKW?=
 =?iso-8859-1?Q?UpP6M7FG3tn1aO4AU3nJmWnpDqXiGK8Jqxsfeip0pkZ/81Boaa0Kxc/fEF?=
 =?iso-8859-1?Q?J1WdVeBoruIge9KFtXy3x6n1SJ/u7KbANbgLfYuOOUhthSD1sMjotMUgvZ?=
 =?iso-8859-1?Q?WV1guHE37gts0oJdMByaxH6iQ73Gnf5Pg+Y7PGpBfXicuGagVuFKqB5He0?=
 =?iso-8859-1?Q?nNrfgpX5RVWlHlMzf/Gh1B2qCxyRiq3KWW8flDdsiQujF2A2yDD+vyLUz4?=
 =?iso-8859-1?Q?F0pU0xVPF58eWM42jPhBT8/P+YSW1zZc3DSCs2YN0jX9bhnKP7jS2nX2wY?=
 =?iso-8859-1?Q?TfpeC4tPS9BX+I/1/oaBoBFP1+JDOsw/rPxcK4pR5fnfiNZdYvi+dDttih?=
 =?iso-8859-1?Q?I6VGPmVnz0jcbuVDuCejW1Vbw7+ZmMd145co3jiWhdnPz8/va7BRU5OgLA?=
 =?iso-8859-1?Q?hMFl9igdWRj3yi6EpX3tP+YnEPTMZLtD3NxEw79OzwFEzo4xaT3kg9a19B?=
 =?iso-8859-1?Q?BXdVUSW9zok++5uqVVklpr+FYrnSuSNqfxkGen+W2b0LclfJf2Gmzs872H?=
 =?iso-8859-1?Q?TbyxNeOk/d2mcc15y8GSCKv4uTSBWqRkEkn2APKHQeqjaauULoL7oFciux?=
 =?iso-8859-1?Q?5ocjFa1Hk7n5EgynZctqffyUrlNs1hSSYgYB7E7NX6bYwNxn09TXZoScpu?=
 =?iso-8859-1?Q?1BG0wPxPsZ7Ho3p/N1Wb4tbVwPRRp/EQr9prKNUypVjywER0QcBSr/mwON?=
 =?iso-8859-1?Q?MxjKPmiHIIP84xpE5G8ULymxlzD2fohm9ItBcrY7HOwlkXDHwdmjmxxG0m?=
 =?iso-8859-1?Q?SUilZizxO/UEhqBS0bfuxDCXL1mOgNNN8Fp4oxL0Ms0ii13A3zpcK5fhXH?=
 =?iso-8859-1?Q?Kjo2/yWduupbB0M8R02d5KUPg0bRsi7vvM7KFhqzdk8CU+/K2o9qjD6sr1?=
 =?iso-8859-1?Q?O0zM2HG8bAH/ERg0YCYLdoZmL7R3WLphZ/2qE2PzG71o9Zjd27D0HDL4HH?=
 =?iso-8859-1?Q?2rvvGPv35VQDhStzVgJ3G429S8xh6x1vuIaV/I03+kVcioQOw6//SNjJeL?=
 =?iso-8859-1?Q?8cjMaSy2ZDzbavVUCe62dYCpNmIWc9Wlt+zMpwdAgwHqCiVfYGCATZuUof?=
 =?iso-8859-1?Q?l/5IIGvzyF/+G8uK2OjMr5bvOQL8p6uDmbD4+Z7M9IJ7slHrqJJ1Q0wJJ7?=
 =?iso-8859-1?Q?GPNt/lbVpeJ2ClUZjyeEAfy6IWOwgomKN43kbUto0ftbPCDQeoCZLMM/M3?=
 =?iso-8859-1?Q?t+mR/8qzjaySAtETlOdOHRcc4ifycEy+tIyOJUfYXorw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DGVUU7mP/yBZQ9d8O1gi+xImab4yK2Q4ZLw3yZgid2aRsa0tUkM44dRaCv?=
 =?iso-8859-1?Q?bodVI3N4vxSCDHOnKvm3myHjCqpN4YD2L0mZKeWiYTmJd7P3lwXap2g3iw?=
 =?iso-8859-1?Q?AYE3fL1RbcmRWhjoI/eQq4lE9Y1iaPWRQnlfGu9TXKiKlSIn1JVUfVdyYB?=
 =?iso-8859-1?Q?qO23xbjuVT5GSIm9XeL4eIx6xf3ao7Lza+FqVXNqj7jtQvpXj/f2Bv+qyu?=
 =?iso-8859-1?Q?hzsoX0Pnt8AbpLBkelXGoiIqdW55cGib2xxQ3FM2gGXQZqrZK1rh50dS9Y?=
 =?iso-8859-1?Q?/oQPaRuJZdcAU8MfUhQ3erPxlYzF3cr9FZwcv67fcEyagiKS1ht2GXgqI4?=
 =?iso-8859-1?Q?UohArbdBkK994V+ucyIgX0kvcWPy5qWah+UReqxlMfpQvoUCpKUbLNW9ed?=
 =?iso-8859-1?Q?0C/1guyK6HkNJcDAth9+zmisEgccE6hz6rMwF3/h4PTgzEH7DCwV4+g2lj?=
 =?iso-8859-1?Q?1CFXDCTZ5+hjq7G79OTPugyHGkEeLefiMxZHlw8UJaC+EO8THU33NNLuGv?=
 =?iso-8859-1?Q?w1cTyhUzvQ6sZgUqftsnczEoM3bR1z6hBjcpW/9wMLU22o7Q94R/AvSnNc?=
 =?iso-8859-1?Q?BDadovgXg/OROJKWCHTLVlSfS1E5voYmOrbuvpX21bI9XnMWRBWo9YAaNs?=
 =?iso-8859-1?Q?i2HyUJt6afuUb3x+vjQBfSi86RQnJEfeOuG+BEFpF87MzlDvjaWBmEiTqj?=
 =?iso-8859-1?Q?RXK8eNblwPC++FdbxKYENB9XTmn4qBBJtTw+7JFpQx2vbUcy82b7VXkEbi?=
 =?iso-8859-1?Q?vBTI7uQQV/fcuuBlYAzIUzkKHsBO5rKcufPK6fTaL8vQVWeyVuKFz6tafM?=
 =?iso-8859-1?Q?/BrbsitJtotCWisMJfS1VS6DSCA9MtPwgrsG5mvrlc+Bb6iRhdLg0FcpoD?=
 =?iso-8859-1?Q?uaBvypRMRYLKOZP1+UKngDOtjf0osUZzOcIHeM+YfknaoosMqly/LUaFmh?=
 =?iso-8859-1?Q?1scWYVHjJ5pmJWtXA/fjQksWkcnSCWRHj+IMhpCaTUcl68MJBDRdB86rrA?=
 =?iso-8859-1?Q?L9StXcnElVKJrO0XIh6ZtSuvH+0TzGlHDGu2RPjqpLhJCEE4I50+38CH3c?=
 =?iso-8859-1?Q?TZgE0h6HygdofyaqKWH8gXXToByOwvpgHo+dj215rZ0PKXWno3lcUuDO0g?=
 =?iso-8859-1?Q?CBGmR1WNTE+Ik0Rq+jtlwMuc0/kaqqkfSZQrrmFchritixmgOfNj8V/fBV?=
 =?iso-8859-1?Q?+t3H7WT1pqdlu0kAqLip63LseQuv0q6Lz1Gu9cUeB7NcNo7FgamaGGQ9ro?=
 =?iso-8859-1?Q?ukzrAmsKCj3MhsIpbX1Xx/QPDCBZ8GnHfr7koiw9vNhPJOSNA9NN5mu/Vq?=
 =?iso-8859-1?Q?M3SyBMIjoj0/aUuCZ+jgCjmEtbL3i3Oaivcj583FvIw3QIamSs1/0lGKwo?=
 =?iso-8859-1?Q?yAjW8vUkzJL/HRMVwJf4Qn2NiXZmhhXyMfXuET4XLT5XPZXrbgiiz2z9wL?=
 =?iso-8859-1?Q?bM6xdlgARfl7Wf6MUReSowwgW8lV8Fs0F/n+C1YP19ACHZ6LMnaWGXhUu+?=
 =?iso-8859-1?Q?Ub5C1dQvv2Fywh0fCQXBKMHU5ZP8nfRGwumwDqBg9ELvCVuRR7/VMorKLq?=
 =?iso-8859-1?Q?IGJaESFiW5SwTXAO/WI4E1Ex6pLRMdSAuo7nEp+0osr6V4aISujqkaNXMQ?=
 =?iso-8859-1?Q?rbUu+aAABsdCL/+3erJM43HM6MDBk3l44MH51DPn6Uj7f9KF8MgGpLzg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6856b965-041e-427d-6c81-08dde95ebf35
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 13:52:10.0448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AMHfP4JH7bQ5iT5SJLIb+i3MXEBVGYrgDIOcHs/VeR2fLeHCzDKIyPwtvwgkJWnCgsp8/jrtdZf1QHiy0n6jVd+zUnj3N3Q2F08w3SA49DY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8345

From: Grygorii Strashko <grygorii_strashko@epam.com>

The introduced SCI (System Control Interface) subsystem provides unified
interface to integrate in Xen SCI drivers which adds support for ARM
firmware (EL3, SCP) based software interfaces (like SCMI) that are used in
system management. The SCI subsystem allows to add drivers for different FW
interfaces or have different drivers for the same FW interface (for example=
,
SCMI with different transports).

This patch updates SCMI over SMC calls handling layer, introduced by
commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls handling
layer"), to be SCI driver:
- convert to DT device;
- convert to SCI Xen interface.

There are no functional changes in general, the driver is just adopted
to the SCI interface.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---

Changes in v7:
- sort headers in scmi-smc.c file

Changes in v6:
- add R-b tag

 xen/arch/arm/firmware/Kconfig                | 13 ++-
 xen/arch/arm/firmware/scmi-smc.c             | 93 +++++++++++---------
 xen/arch/arm/include/asm/firmware/scmi-smc.h | 41 ---------
 xen/arch/arm/vsmc.c                          |  3 +-
 xen/include/public/arch-arm.h                |  1 +
 5 files changed, 64 insertions(+), 87 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index fc7918c7fc..bbf88fbb9a 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -8,9 +8,18 @@ config ARM_SCI
=20
 menu "Firmware Drivers"
=20
+choice
+	prompt "ARM SCI driver type"
+	default SCMI_SMC
+	help
+	Choose which ARM SCI driver to enable.
+
+config ARM_SCI_NONE
+	bool "none"
+
 config SCMI_SMC
 	bool "Forward SCMI over SMC calls from hwdom to EL3 firmware"
-	default y
+	select ARM_SCI
 	help
 	  This option enables basic awareness for SCMI calls using SMC as
 	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
@@ -18,4 +27,6 @@ config SCMI_SMC
 	  firmware node is used to trap and forward corresponding SCMI SMCs
 	  to firmware running at EL3, for calls coming from the hardware domain.
=20
+endchoice
+
 endmenu
diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-=
smc.c
index 33473c04b1..4c5df714c2 100644
--- a/xen/arch/arm/firmware/scmi-smc.c
+++ b/xen/arch/arm/firmware/scmi-smc.c
@@ -16,12 +16,12 @@
 #include <xen/sched.h>
 #include <xen/types.h>
=20
+#include <asm/device.h>
+#include <asm/firmware/sci.h>
 #include <asm/smccc.h>
-#include <asm/firmware/scmi-smc.h>
=20
 #define SCMI_SMC_ID_PROP   "arm,smc-id"
=20
-static bool __ro_after_init scmi_enabled;
 static uint32_t __ro_after_init scmi_smc_id;
=20
 /*
@@ -41,14 +41,11 @@ static bool scmi_is_valid_smc_id(uint32_t fid)
  *
  * Returns true if SMC was handled (regardless of response), false otherwi=
se.
  */
-bool scmi_handle_smc(struct cpu_user_regs *regs)
+static bool scmi_handle_smc(struct cpu_user_regs *regs)
 {
     uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
     struct arm_smccc_res res;
=20
-    if ( !scmi_enabled )
-        return false;
-
     if ( !scmi_is_valid_smc_id(fid) )
         return false;
=20
@@ -78,49 +75,45 @@ bool scmi_handle_smc(struct cpu_user_regs *regs)
     return true;
 }
=20
-static int __init scmi_check_smccc_ver(void)
+static int scmi_smc_domain_init(struct domain *d,
+                                struct xen_domctl_createdomain *config)
 {
-    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
-    {
-        printk(XENLOG_WARNING
-               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled=
\n");
-        return -ENOSYS;
-    }
+    if ( !is_hardware_domain(d) )
+        return 0;
=20
+    d->arch.sci_enabled =3D true;
+    printk(XENLOG_DEBUG "SCMI: %pd init\n", d);
     return 0;
 }
=20
-static int __init scmi_dt_init_smccc(void)
+static void scmi_smc_domain_destroy(struct domain *d)
 {
-    static const struct dt_device_match scmi_ids[] __initconst =3D
-    {
-        /* We only support "arm,scmi-smc" binding for now */
-        DT_MATCH_COMPATIBLE("arm,scmi-smc"),
-        { /* sentinel */ },
-    };
-    const struct dt_device_node *scmi_node;
-    int ret;
+    if ( !is_hardware_domain(d) )
+        return;
=20
-    /* If no SCMI firmware node found, fail silently as it's not mandatory=
 */
-    scmi_node =3D dt_find_matching_node(NULL, scmi_ids);
-    if ( !scmi_node )
-        return -EOPNOTSUPP;
+    printk(XENLOG_DEBUG "SCMI: %pd destroy\n", d);
+}
=20
-    ret =3D dt_property_read_u32(scmi_node, SCMI_SMC_ID_PROP, &scmi_smc_id=
);
-    if ( !ret )
+static int __init scmi_check_smccc_ver(void)
+{
+    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
     {
-        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT nod=
e\n",
-               SCMI_SMC_ID_PROP, scmi_node->full_name);
-        return -ENOENT;
+        printk(XENLOG_WARNING
+               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled=
\n");
+        return -ENOSYS;
     }
=20
-    scmi_enabled =3D true;
-
     return 0;
 }
=20
+static const struct sci_mediator_ops scmi_smc_ops =3D {
+    .handle_call =3D scmi_handle_smc,
+    .domain_init =3D scmi_smc_domain_init,
+    .domain_destroy =3D scmi_smc_domain_destroy,
+};
+
 /* Initialize the SCMI layer based on SMCs and Device-tree */
-static int __init scmi_init(void)
+static int __init scmi_dom0_init(struct dt_device_node *dev, const void *d=
ata)
 {
     int ret;
=20
@@ -134,22 +127,36 @@ static int __init scmi_init(void)
     if ( ret )
         return ret;
=20
-    ret =3D scmi_dt_init_smccc();
-    if ( ret =3D=3D -EOPNOTSUPP )
-        return ret;
+    ret =3D dt_property_read_u32(dev, SCMI_SMC_ID_PROP, &scmi_smc_id);
+    if ( !ret )
+    {
+        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT nod=
e\n",
+               SCMI_SMC_ID_PROP, dt_node_full_name(dev));
+        return -ENOENT;
+    }
+
+    ret =3D sci_register(&scmi_smc_ops);
     if ( ret )
-        goto err;
+    {
+        printk(XENLOG_ERR "SCMI: mediator already registered (ret =3D %d)\=
n",
+               ret);
+        return ret;
+    }
=20
     printk(XENLOG_INFO "Using SCMI with SMC ID: 0x%x\n", scmi_smc_id);
=20
     return 0;
-
- err:
-    printk(XENLOG_ERR "SCMI: Initialization failed (ret =3D %d)\n", ret);
-    return ret;
 }
=20
-__initcall(scmi_init);
+static const struct dt_device_match scmi_smc_match[] __initconst =3D {
+    DT_MATCH_COMPATIBLE("arm,scmi-smc"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(scmi_smc, "SCMI SMC DOM0", DEVICE_FIRMWARE)
+    .dt_match =3D scmi_smc_match,
+    .init =3D scmi_dom0_init,
+DT_DEVICE_END
=20
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/firmware/scmi-smc.h b/xen/arch/arm/in=
clude/asm/firmware/scmi-smc.h
deleted file mode 100644
index 6b1a164a40..0000000000
--- a/xen/arch/arm/include/asm/firmware/scmi-smc.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * xen/arch/arm/include/asm/firmware/scmi-smc.h
- *
- * ARM System Control and Management Interface (SCMI) over SMC
- * Generic handling layer
- *
- * Andrei Cherechesu <andrei.cherechesu@nxp.com>
- * Copyright 2024 NXP
- */
-
-#ifndef __ASM_SCMI_SMC_H__
-#define __ASM_SCMI_SMC_H__
-
-#include <xen/types.h>
-
-struct cpu_user_regs;
-
-#ifdef CONFIG_SCMI_SMC
-
-bool scmi_handle_smc(struct cpu_user_regs *regs);
-
-#else
-
-static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
-{
-    return false;
-}
-
-#endif /* CONFIG_SCMI_SMC */
-
-#endif /* __ASM_SCMI_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 4095171533..78d5bdf56f 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -21,7 +21,6 @@
 #include <asm/traps.h>
 #include <asm/vpsci.h>
 #include <asm/platform.h>
-#include <asm/firmware/scmi-smc.h>
=20
 /* Number of functions currently supported by Hypervisor Service. */
 #define XEN_SMCCC_FUNCTION_COUNT 3
@@ -233,7 +232,7 @@ static bool handle_sip(struct cpu_user_regs *regs)
     if ( platform_smc(regs) )
         return true;
=20
-    return (scmi_handle_smc(regs)) ? true : sci_handle_call(regs);
+    return sci_handle_call(regs);
 }
=20
 /*
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 55eed9992c..095b1a23e3 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -328,6 +328,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_FFA       2
=20
 #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
+#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
=20
 struct xen_arch_domainconfig {
     /* IN/OUT */
--=20
2.34.1

