Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD88B3675E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:05:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094536.1449867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ3-00082e-6g; Tue, 26 Aug 2025 14:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094536.1449867; Tue, 26 Aug 2025 14:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ2-0007tK-Kt; Tue, 26 Aug 2025 14:05:48 +0000
Received: by outflank-mailman (input) for mailman id 1094536;
 Tue, 26 Aug 2025 14:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqrf=3G=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uquJ0-0007NC-IV
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:05:46 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c225f514-8285-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 16:05:44 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAXPR03MB7887.eurprd03.prod.outlook.com (2603:10a6:102:216::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 14:05:38 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 14:05:38 +0000
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
X-Inumbo-ID: c225f514-8285-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7394oy42b4sbFCi9G9vEbD8xrAKHdewybgdnaSNYveRk6WtBKWeEKDQwi5kg9229KNXhRbB/vuVWY7zQ0EXZ6aVRtBmO0O5EOzBGJIkflAeaFeMHoUhQcQcK6goMzhB8XESb2C6SdFA52XtJFmGAoKmqnuqL5VVQHh/yWk+ytHYsO4Husw4l67afJ8PuXdAdmG6MdcJ4l2HJBVuja5ZkuKWmTPumMd1waYXWD04XWZZryVkql7gpshEV3XqvM7INiCjqxlvUNN9cBeFPfgGKhr7K3Sglqv+CRDGiFGVv2lnJRCZyALeENjBGv50+BjkptPXobtV1MdyCX8FyB4x1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ll0e4xERDwzSsCyUHMw4DPQ8wk5o/Q2P9RE4dkhfAI=;
 b=vin7Vh/W16D+T8+LpW8++Hjn+/CRn98g4gASV9/8vH77JrJ+EijKFSGJB7dXaBedDIee6iC+kXDpMiDRBr9OCkOnaTkWcwcNnS1qUah9k82Y+o6GOPFx0RBbgPtGl3DJYMNJpOYMQeZMkCjW9q13hvPKQKPRnbedJfh/Y5FDc/T32U4y4Vlxz5G4zbwcivJ2hubyXG1u2ziOq++zTk9M1fop7MehnNkxoFloRF6CAmNvTTDsjxvPVXhLIfDAAd3SyKLozZS/z+NVvC3gpLWgOU0CFEDXArp+LYPc8cs2GoRHUZgVeApEQSHsNeYiMkZPNnCxZy/3Dw02i/DjEi58QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ll0e4xERDwzSsCyUHMw4DPQ8wk5o/Q2P9RE4dkhfAI=;
 b=GkaowbECMAe3ZEwjc1nVQ+3humXzRig2ZHx1IT16PJI0xVmlR6r3/Ef+EZGx22h26oxL2HwnRqaOjs+39jWxBPWbR8i1Z505GM54Cn2ue2y4zBwZnSBJyB54w30vprBa8z3+uG2QAG/UdzdB4LPO4oO81Kz+SmVYXoEEEWSe9cBYULe1xis895mLccOFUwq6607RQUuLdotf4uj7CE9ctDATbby8ogoHfXWEIlh4xWV5UW+aKYcJ/Kzrqly6O707bC8Weetq1HbqNCxVemKhr/nKoKJpCZgPE1uohJCZ0/XMAUBhkO+xVtJxKn6v7DfQoUNzP/pi6ohzQiH8jWZwlw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 04/11] xen/arm/irq: add handling for IRQs in the eSPI range
Thread-Topic: [PATCH v3 04/11] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcFpJ/t39ssss6a0y8SPAQeD5PEA==
Date: Tue, 26 Aug 2025 14:05:37 +0000
Message-ID:
 <8b42416d779537d6a0ac4902cabc549253b9da9d.1756216943.git.leonid_komarianskyi@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756216942.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAXPR03MB7887:EE_
x-ms-office365-filtering-correlation-id: 487dde22-ae8d-4300-77f2-08dde4a9a26e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4A4AafZUBd36LSUx5vByLXsvXPELv8VBzFpQUiHy3IERmF7tkoodie/PFf?=
 =?iso-8859-1?Q?iSy3wl7i12elJqD0H8SZHTv470JPfNNAl+QMiY2nOP9o/dbKrBbL75Du77?=
 =?iso-8859-1?Q?vcQrTDnmJdxCkTOWt9Otexa2WF+MtYbZht47ysdUmqzjWkTHKJNTMkr7+a?=
 =?iso-8859-1?Q?UOh9jq9kZkwWA4lt/dlLzoW2Baa2kIEHNGu5f0clOWMlnP+qtnkAO4Hw/G?=
 =?iso-8859-1?Q?z1+SlGVd/ggATRPat6rAitgYh9Vu3kqM6IcpFSj1X5NxyFhT2O+pGlcJD0?=
 =?iso-8859-1?Q?HlilFeujqJ1SRKxz/lgbS+sK9+id7gnmiEaKGiptRCJuFbx9/zQGc5A6r7?=
 =?iso-8859-1?Q?oB27thFm+sB9kcLtB9ANwNSf2t3bqDZLVW/ZWUY52oqMt6ruIhqwqOwkw0?=
 =?iso-8859-1?Q?WDE6sepExWw75Gv6isRwpvBAyq59ME9qxmoEjQ0jefa9PYsyabjiYPUVF2?=
 =?iso-8859-1?Q?xyz7kAznheQLQHsKREwcAap9dFFtnVI/DbasAOl2fkbJ8zrKcyk31SnTmx?=
 =?iso-8859-1?Q?fRmQxta5V3L6v1bpPbMxhnKfjF+cu5kvJGtXNBSffXycRZQY/Dx7gJtP1y?=
 =?iso-8859-1?Q?wCk+JhvwBsYZjq7wWreg0QFUODqWbaddoQmLKjqD5/jC+gL2fvZQuNJiB7?=
 =?iso-8859-1?Q?kb1Fn2n/9gLW55kbsmhUU1RRK8OPnTLWEa/hitpdw3jXZuNahwu2tnq5KI?=
 =?iso-8859-1?Q?C4KggMQG0o82nGkaqoQvdiJ5xne9hImu1v/xzJUeBsaDcadV58snL6FjPa?=
 =?iso-8859-1?Q?0rztImwnrz82tTKOREfZmSroAXXoTs74ob0LVSMFDktcjNUjvzXiXjYRwz?=
 =?iso-8859-1?Q?ekjwWsBIg0IzpeYdvY4OMjWt3fWWQt6c+50wX9er2QlaMuZKgOL1sfjuTL?=
 =?iso-8859-1?Q?t4abZHMEn7U2cBVhzZBLwaDCI8bsv+uRIGlw3iVx4zIP/JITEtwrCR6604?=
 =?iso-8859-1?Q?WyXhw6iJP8cpQMkgbQLjZPTBG2sfDOEAztthG2+CqwqN8OQvrxhTU82sIY?=
 =?iso-8859-1?Q?OsL5Q6eRUTKBymULkeFXFRVDuOJivnfVsTniGWomj0PZxrdS+4EaAOskGI?=
 =?iso-8859-1?Q?s+r8H7KW4AwyPvXARBw0fdaScakqsU4Src5phtuR+8oxnAs2BtqRx/+1yd?=
 =?iso-8859-1?Q?uWl5SQPdgEONMZUpI7mX0oKCjAp1xPHMRhUSzSuDx3Tr6HaZumjrX+rdNu?=
 =?iso-8859-1?Q?op3kVu2iXjRlprSSsdErY6iL8JZeeZvuMapUc1qAqh0vEbmlmRkDzWvvjn?=
 =?iso-8859-1?Q?Ely++hUp6z1NyM7ONB7/aCgy3zSUKbltn/GXUQmXOkQj/92QT3K2p+K7uv?=
 =?iso-8859-1?Q?Sch31Hqxd6H/8j4R4y/IQhB74SV4BC/rg+wKBiCVwxOaIbPgodsZS0xfpi?=
 =?iso-8859-1?Q?Y1M+ccsKEpcc+bIYZVnJ8GgKDSAW6DaG7PllSPSXyN4788n0ZHDMlKHEEt?=
 =?iso-8859-1?Q?2nbfgcnMPJva8UIVpVwSDEjLPhB8uqWYwFumvRB73EgOCU13QTW+9b4OAK?=
 =?iso-8859-1?Q?gh1GH7BvW78uw+o01FJ0/KeDwcUyue9bfQrUKDOIOWyg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XEzAkylWFc6vDZiEkuK8B3OePnvVoDDT4sJcnsP+AdY9RfV7JprlaGd7MX?=
 =?iso-8859-1?Q?wDwuB+R+tbCF6hnJSO3f01Yge1nkL5ANfVm/vy8SL/+tAwFhcv81UnIxSN?=
 =?iso-8859-1?Q?0hykDi0wl+mXNfJhkElxZP9Wqr4IJYIUc+sxMQ7Qa67siSyKHi0biDevdu?=
 =?iso-8859-1?Q?FWSRPQFknFNLtezXOPnhgSh9ctfeOB8Ee1aPQVJEb/9BLvtnPBmIj1hdp9?=
 =?iso-8859-1?Q?ckZi95PbCQjYFUWLpMm/ZbNcONjjhcgME6G2WH2uVSPVnmdXFaP00AG7dm?=
 =?iso-8859-1?Q?iQyZwevJXnqO5rXXY5sxLSSDVVWuLY2lF6bKjWYXTIkH5XrSqQrUVNcIW6?=
 =?iso-8859-1?Q?7mpcjzdHNvom32QUjvZHhKeeDJpeUQmx98CLhOUx2/gvP5241F6HZpuSf1?=
 =?iso-8859-1?Q?LV88wJ34QfqZw9nmlsX4q83kiJ2eos+jbiw4qVjOiSieLbt8Sigks351z3?=
 =?iso-8859-1?Q?JVuOehTcCVTKG7sd9dFVREnh73FZ4PfkK4rezccJw6Fb/uyTsXpVVpqd3m?=
 =?iso-8859-1?Q?DkL0KB26rBIdYxyorZztEQZD9HfEdirK4X5IYYVa1xmdd4yYN1bcrLmUQ2?=
 =?iso-8859-1?Q?tqGIb0b/7vMio1EHSgQRtN4iwXu+MmzdroXV0kMUmiA7VLGFjusn+UJKLQ?=
 =?iso-8859-1?Q?8/CXA/XbpKuqwE5LZsWmjetwX0BlUCzc3Xa+zRze7IfDbWb4iAKFFFgmV2?=
 =?iso-8859-1?Q?cIq84tgaBr6saFF60+o3k7/pbFWY2R7zeFpoyPBALt4C4ZhyeLiPDzjANs?=
 =?iso-8859-1?Q?ubWV5P+B0z5O2wJiiRBIQUkGsK/sspLL6P9YYCh/9YMbauaq8ukR8FLoJ1?=
 =?iso-8859-1?Q?01/LxCLBHD+hWLhfRc0HQ0FsE9EfuuSE325SOfJauJX9PgFKTj3B+sbQaH?=
 =?iso-8859-1?Q?g7fNAlvDNqnAVy+4UC7kDdBcYx9IdsWhL5gsy5lDKLu/tzop9AYaemNpTT?=
 =?iso-8859-1?Q?gT7gjcY36CqRNzwHx93bXzi8diuMgSr24SXTi8S99+3HaJtMnqvvvHRRgc?=
 =?iso-8859-1?Q?LZ2GAXY7lKa5e2fOYXFhea1pbMGanX2hwtqI64KpGpjXytLjYpVOrnZFBQ?=
 =?iso-8859-1?Q?FzCVJAhLKpd2HmtEOKYqmgMPrYpUSIsQ18n1lk2eULxr1TUN73oZZ+AYQg?=
 =?iso-8859-1?Q?YOLBb+ni2R0NLEJwHaEy+uAvOjE6tqRC5y553T2WzHXU6i2NcSsyM0sZOZ?=
 =?iso-8859-1?Q?rKXKGbV0jCkJMvsHCqp8XVcemjyLaQaXwCizOVIrJ8+KJYXT4wTTepAD4O?=
 =?iso-8859-1?Q?yFIj0ij1ozIbiHSFFgQNyPYIFB3/9lD1kxwzUBr+799Hlt40gy89WepCu2?=
 =?iso-8859-1?Q?rB3gwdkvjilszUWh3lmRxDvvtDAOepYv/rEpJGN/b7Mt4ZaIhu9VhpNDMl?=
 =?iso-8859-1?Q?XTHQlOWVa0cEIWRb1lh/qrhlIBW7S87efGyNoXIgobKJ4q0TMWuiqXkEui?=
 =?iso-8859-1?Q?0r0P/2fJWPcaXp1jDdVakzIzYlp3vqIAvq7avCpldgzCA/a3cd29nn4s0I?=
 =?iso-8859-1?Q?0gukHTVq0nnPSO1nu9NfnB4lQ7jD+oAhLY0xOJYFL2Pj426Z9PRuPS9yHu?=
 =?iso-8859-1?Q?H+2tKYgSH80Tilc+RapNvguJA6kGZwZGkVetsWwmVXoEoLfgJJIAT4kDAv?=
 =?iso-8859-1?Q?61zyG+Chg2ntc2IcPnBO58zMHeG0lSlrQWmZJrblzzQo3TXWXcALDTJgzS?=
 =?iso-8859-1?Q?+dunt5z3JHuhgaCey1g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 487dde22-ae8d-4300-77f2-08dde4a9a26e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 14:05:37.4113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SHDYzJtdBF0SH/YZiDAZkRqzS1XUQQEWqd+4dX6N+iaa+OictKtITZr+M0KP/kFQkFCbYhD+uJGoSPjx2LIBzqum86JkPA1oU67P0wrIias=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7887

Currently, Xen does not support eSPI interrupts, leading
to a data abort when such interrupts are defined in the DTS.

This patch introduces a separate array to initialize up to
1024 interrupt descriptors in the eSPI range and adds the
necessary defines and helper function. These changes lay the
groundwork for future implementation of full eSPI interrupt
support. As this GICv3.1 feature is not required by all vendors,
all changes are guarded by ifdefs, depending on the corresponding
Kconfig option.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V2:
- use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
- remove unnecessary comment for nr_irqs initialization

Changes in V3:
- introduced a new define NR_ESPI_IRQS to avoid confusion, like in the
  case of using NR_IRQS for espi_desc array
- implemented helper functions espi_to_desc and init_espi_data to make
  it possible to add stubs with the same name, and as a result, reduce
  the number of #ifdefs
- change CONFIG_GICV3_ESPI default value to n
---
 xen/arch/arm/Kconfig           |  9 ++++++
 xen/arch/arm/include/asm/irq.h | 26 +++++++++++++++++
 xen/arch/arm/irq.c             | 52 +++++++++++++++++++++++++++++++++-
 3 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 17df147b25..5813e5b267 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -135,6 +135,15 @@ config GICV3
 	  Driver for the ARM Generic Interrupt Controller v3.
 	  If unsure, use the default setting.
=20
+config GICV3_ESPI
+	bool "Extended SPI range support"
+	depends on GICV3 && !NEW_VGIC
+	default n
+	help
+	  Allow Xen and domains to use interrupt numbers from the extended SPI
+	  range, from 4096 to 5119. This feature is introduced in GICv3.1
+	  architecture.
+
 config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORT=
ED
         depends on GICV3 && !NEW_VGIC && !ARM_32
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index 5bc6475eb4..221dbf23a2 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -32,6 +32,15 @@ struct arch_irq_desc {
 #define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
+#ifdef CONFIG_GICV3_ESPI
+#define ESPI_BASE_INTID 4096
+#define ESPI_MAX_INTID  5119
+#define NR_ESPI_IRQS    1024
+
+#define ESPI_INTID2IDX(intid) ((intid) - ESPI_BASE_INTID)
+#define ESPI_IDX2INTID(idx)   ((idx) + ESPI_BASE_INTID)
+#endif
+
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
 #define INVALID_LPI     0
=20
@@ -39,7 +48,15 @@ struct arch_irq_desc {
 #define INVALID_IRQ     1023
=20
 extern const unsigned int nr_irqs;
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * This will also cover the eSPI range, as some critical devices
+ * for booting Xen (e.g., serial) may use this type of interrupts.
+ */
+#define nr_static_irqs (ESPI_MAX_INTID + 1)
+#else
 #define nr_static_irqs NR_IRQS
+#endif
=20
 struct irq_desc;
 struct irqaction;
@@ -55,6 +72,15 @@ static inline bool is_lpi(unsigned int irq)
     return irq >=3D LPI_OFFSET;
 }
=20
+static inline bool is_espi(unsigned int irq)
+{
+#ifdef CONFIG_GICV3_ESPI
+    return (irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID);
+#else
+    return false;
+#endif
+}
+
 #define domain_pirq_to_irq(d, pirq) (pirq)
=20
 bool is_assignable_irq(unsigned int irq);
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index b8eccfc924..adb5e49ea3 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -19,7 +19,11 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
=20
+#ifdef CONFIG_GICV3_ESPI
+const unsigned int nr_irqs =3D ESPI_MAX_INTID + 1;
+#else
 const unsigned int nr_irqs =3D NR_IRQS;
+#endif
=20
 static unsigned int local_irqs_type[NR_LOCAL_IRQS];
 static DEFINE_SPINLOCK(local_irqs_type_lock);
@@ -46,6 +50,49 @@ void irq_end_none(struct irq_desc *irq)
 }
=20
 static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
+#ifdef CONFIG_GICV3_ESPI
+static irq_desc_t espi_desc[NR_ESPI_IRQS];
+
+static struct irq_desc *espi_to_desc(unsigned int irq)
+{
+    return &espi_desc[ESPI_INTID2IDX(irq)];
+}
+
+static int __init init_espi_data(void)
+{
+    int irq;
+
+    for ( irq =3D ESPI_BASE_INTID; irq <=3D ESPI_MAX_INTID; irq++ )
+    {
+        struct irq_desc *desc =3D irq_to_desc(irq);
+        int rc =3D init_one_irq_desc(desc);
+
+        if ( rc )
+            return rc;
+
+        desc->irq =3D irq;
+        desc->action  =3D NULL;
+    }
+
+    return 0;
+}
+#else
+/*
+ * This function is stub and will not be called if CONFIG_GICV3_ESPI=3Dn,
+ * because in this case, is_espi will always return false.
+ */
+static struct irq_desc *espi_to_desc(unsigned int irq)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+
+static int __init init_espi_data(void)
+{
+    return 0;
+}
+#endif
+
 static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
=20
 struct irq_desc *__irq_to_desc(unsigned int irq)
@@ -53,6 +100,9 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
     if ( irq < NR_LOCAL_IRQS )
         return &this_cpu(local_irq_desc)[irq];
=20
+    if ( is_espi(irq) )
+        return espi_to_desc(irq);
+
     return &irq_desc[irq-NR_LOCAL_IRQS];
 }
=20
@@ -79,7 +129,7 @@ static int __init init_irq_data(void)
         desc->action  =3D NULL;
     }
=20
-    return 0;
+    return init_espi_data();
 }
=20
 static int init_local_irq_data(unsigned int cpu)
--=20
2.34.1

