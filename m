Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9704C51C5E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 11:52:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159701.1488060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8SE-00089A-5o; Wed, 12 Nov 2025 10:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159701.1488060; Wed, 12 Nov 2025 10:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8SE-00087s-0q; Wed, 12 Nov 2025 10:51:58 +0000
Received: by outflank-mailman (input) for mailman id 1159701;
 Wed, 12 Nov 2025 10:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulhw=5U=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vJ8SB-0006fP-UR
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:51:55 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99c20714-bfb5-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 11:51:53 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9786.eurprd03.prod.outlook.com
 (2603:10a6:102:2e8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Wed, 12 Nov
 2025 10:51:49 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 10:51:49 +0000
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
X-Inumbo-ID: 99c20714-bfb5-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unIW4zEC0wHFFctVtNHkc+oWco2vI6W1nDkCgucoqWIbUAiS/besPfKUvjccDuve2aCAulbtwn6GrMz9f56y29H5DbdpwemPUMsSZSoGkXiqa1U8hScPDIGEKhP5OoZm+HK6qB3MdWdPtX9lj3wgHWAtDgpEItkiUjuOXNQycpv6F3s0Rkm8wblBETqRrxFJvcNIkzh+pqsCzDsAerMA++SrRyvQsF490F0tYqCJ8e/bhC46IADilpm4iP0l3Ffa1XV1u4D1nLSpZpZpG8wc82ytRPff8q2jIBdnnEpPl613lQG2vSmWrE2lL55B/5Ld9jIv3GEErPSwUZye/HhQiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RK3xjJT1/m7h8Eiq8scWUKysHO6uL/FasxMvbQpKdSo=;
 b=tjeCWW4PqlQHCqLy1MnansX6f+goo0eWfOj/q1YwjTxcs+L4JJkgOq22lfmBAf2dIRVi5Sj7E9wgS6kmu+QuVpLICCp1FOrOuVWtOkKugguQuYWNpIHZhuwjw5fZVmWbE/MCjjx8HZieHziwgc7Hzz9LHXZD2eQy25zVwD3T0jK0tsfyL+xuTsBfBhicfgPLwqQZQnjDA2lQw/QkBolhNdo+9oCTG2A3Bsu096Q36OnwlpRO/kSXEEdkbwYcuYeyT+FR+yBC8Rb3c5SPRuAF11VmWKVUmh3oPn+hy/ksjhFTSkperMH0icM7aoRgVVEmIRObWIdAJP/qMJGvp3fciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RK3xjJT1/m7h8Eiq8scWUKysHO6uL/FasxMvbQpKdSo=;
 b=q1diejAUXV+jdjwUMJkRw0DuP6YQFwMz+v4omjDtjgn9c2ezO9Ta0FidIVRdGBx/3U7U8yy9GorcDaoYUEjCw/bGq9HrUVZ+xfAaE4ydTHabBlgCXtYMU70vLUwrz18uiJ/ov+1izfB78hqlISPCiJfiTInH/b0BDtdE7F/fJpJ4naY7lE8beXMY6VwjBKc50VudmxWKSxvwkW4g97BshBm5hOl/Lt+YANJTRAGoC0hYlVyyEE5A2T7E9ezKX8bKxKv71SxNQk1rDQK7hdgwQdgIDAgBnC4c1NVuKGZCD6M+9rVDg0YFqZGKcbk+EBY8OvpiJsFnChj58ys3YvXWpQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v4 6/8] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v4 6/8] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHcU8JY4MUEJP5v5ECe3RrLj+fwXw==
Date: Wed, 12 Nov 2025 10:51:48 +0000
Message-ID:
 <656cb01061f2ec726eb23784d01517a94117618e.1762939773.git.mykyta_poturai@epam.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1762939773.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB9786:EE_
x-ms-office365-filtering-correlation-id: e2c5d9b2-e834-4c46-91ae-08de21d97b1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7WyZVAbBsrJYl/SB/GcPH0Isi8Nlh855KJks4d8wHieoQVkKrIRKUmsdoa?=
 =?iso-8859-1?Q?QlyqeBjqiS8x99hp26DhueYu0+VvLzqI4P+sJoxXvPtpceaiLT92cN6hy8?=
 =?iso-8859-1?Q?/Q+DIOHhvlZHupGPaUxBISBFm46+OvG3ITEAoXq/QZ6jH76ow2zt0wBuLL?=
 =?iso-8859-1?Q?ssBwJ0hOhvwy8hEZC45Ep+jkCXrGA/Yu3Paet4eXMZ37KWjlpjD8r7w1kj?=
 =?iso-8859-1?Q?Z6lUdMUbarHpOmLyvVI5V3HbB/F56g8hL17QQ5W/0oTm9r39k8r1n3qEuE?=
 =?iso-8859-1?Q?vEl0Tu2yaIVajzG2Jxg0O8ED0JUJiNhMpCxNTtpvgWcWyTQcoNB5VVEVmH?=
 =?iso-8859-1?Q?adJUI4wzWxfbai57EvHnK5gCJHOYTEh52pDEwLKEFEYsvjMsGbqVNOkNeq?=
 =?iso-8859-1?Q?H8rjsu+vs47AeXDe+O/FMQYvT6vK3j9aErRnH/G3mXyqELfm6T9+bOldA1?=
 =?iso-8859-1?Q?Dm63wBuvdE5GrqylAuMULMgOLdv6p5IiAPEQiYq1YXhjsBsf+M5rAznosM?=
 =?iso-8859-1?Q?meSGDuhuDMfR5leaJDuTbjSV1rgA2ZWj0OiYIXxAovjBOp+AK9t+nV7AdC?=
 =?iso-8859-1?Q?S42zdjtX2JYv+qha77pxDy4mQ15ltLERDtQWvZdCSLib2p2aAu9Xq65zhb?=
 =?iso-8859-1?Q?Xj15iKR6c2unUuQ1fJbjvKBiNZn0vGyeWrETwF27rEx1IHENqa1ldoKVr4?=
 =?iso-8859-1?Q?HAGSMp5C4Z1W1EVlDNiH/5qEOJ6L7jXK/F/C4neheKPEnkFEeQ3zFhbqrl?=
 =?iso-8859-1?Q?Ohe2HpY3uh0v1iCeWRObfQx8EFs4557bqfOfA8hbjIhqWT/62IGXl0XhR3?=
 =?iso-8859-1?Q?kA5WctKCFFJqRJPEvQUU462pC4oXVP7m/17hwPuMyt9nx3RFuQRcsT6poY?=
 =?iso-8859-1?Q?Rz3HfeVPN/jZ0tGW475VrAyuut/dfMwL9B+MIhFupZ7w7oZa9u0zrS/tZv?=
 =?iso-8859-1?Q?36CGVKmNgal7yU8hv3raGovGvf2RCmmfPrPzotkjt2r7lJZJpbIWeJXpJP?=
 =?iso-8859-1?Q?vYtb/I0dAALTd2wLysVOthM6Xck/XfRkBVxJbWXTmQNI76zG2geTdpGFuS?=
 =?iso-8859-1?Q?YF8hQh6Cuo6rkxMreAncAgemZmLQFttOSAEdrUYfLDgsnC/k5CQAeJf2Ah?=
 =?iso-8859-1?Q?PimaxqnM1JpPgpv35F455WHvVHtgRU/xE05ET7PREyXS/OCsCXrDPLWlF5?=
 =?iso-8859-1?Q?zObuP3KqoeakM99KdNDgXJMzFjLw+tQg2QF3tmA6D2w97lhfZgFGVCUg/4?=
 =?iso-8859-1?Q?VFZP/rQY4ddnczC6rwwM1yIr9Xr9g4LpBNu01IW1hqpH7sRVJX5yXAepV3?=
 =?iso-8859-1?Q?cfzzhB/Tl5owyf/Cnii8gXLCvAMkzL10TC6veI16v6pMabRnuOmg4VAGbZ?=
 =?iso-8859-1?Q?ZBOXop+Q6qID5EYrSHS9+yIjcSMN9KQyplUOa8PPWS0f7KCsm5IYKIuWeO?=
 =?iso-8859-1?Q?eV/y0BfVZ4sekoGHT+saFOFGRAxecojP+kAb4tQL7HObb9iQ46/2+FjzEk?=
 =?iso-8859-1?Q?3L0fJSBOkvo38R7QF3oHCiDRTn5Zmq6yCwo3kyel7Hu9Q1Z89WwNXAiF8x?=
 =?iso-8859-1?Q?k7fp13O8aRqycC2XvXGBlooolMQe?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?R2/loyO7+u8znGONUJxJbT0c5GLVepvuUitfGTnM4/Hm+GlNWv10ThOrHi?=
 =?iso-8859-1?Q?IoTJW6O/OT7HKFe3T33BWzcKF3bVSyNV/WHPHS1cgE+rNLWTcsXSe66Ujk?=
 =?iso-8859-1?Q?99jkZDnp9uKRPQG4dmMwVEeX5ELOjnKxnB2P2pxCAeCNbtQdmvfh85Zf9o?=
 =?iso-8859-1?Q?LNsHZFil/eQDRFJ5RUA7HXdTvk2DRpMwjGv5p0Ck6GGdxn0s2QWjQsByh4?=
 =?iso-8859-1?Q?DrMQJvjCVr3978qTPV9P/x4Qh4qlLslF8wNt7LKELO4o+H0FVhpbu8jECs?=
 =?iso-8859-1?Q?HwmNhkZUDJOPxB4RJOTgbWs0GuKxG9RM0Xcnc9zdoXmjR/zq7EYBbSCmrk?=
 =?iso-8859-1?Q?YE6KvKS/fW3kugPC/U4/mNg89PrQI5FsCYifjTtIV0sBj4JApR8BCJMRtA?=
 =?iso-8859-1?Q?D8J9pCYAWfvSjuEYW/7JFFWoW8SsUgIykaA+P3hM+AZPcHKCaRdZts4ymL?=
 =?iso-8859-1?Q?Pa5Jnp+MDDaN8g4jBtDMVRfVbVn31n5xfoOM71DVplnKlagpmK/h5NESPg?=
 =?iso-8859-1?Q?3KtzT0vPZYfL1QOIWFQzD0+3gMwTQrRgrorizlj2Te/ri3X38LY/r74A2t?=
 =?iso-8859-1?Q?1XIU+OBr5vOEi4BpDybb2IJCM12QVB0WF87YiRxvigP+Jz60RwHPy8GaDA?=
 =?iso-8859-1?Q?3vl9jhcQbm5tP7imtWDUVneLXaVBZPgFSfzeOAJhd6QUPqy+/0fB2wrKIb?=
 =?iso-8859-1?Q?eQiBqWuhdS8T2pouI77QkoFBU8gqiJthmMtU3iHUlDDBP8cP7SKkJyTIuz?=
 =?iso-8859-1?Q?Bh3cjHjJHPEZPbTsD/6ohLX3sag9mWVdMOqTJRl5lnh2hEJt0f8iJ2aK/H?=
 =?iso-8859-1?Q?wu3sCkA+pb38Zx26kb9Db7uVw50PwD+XSBfxdNipET0xal5PiURpmXY1Zw?=
 =?iso-8859-1?Q?NpEzbb5c1bFgSeaXWi9XhKmSBCqTQkfQKi/nYPRDS01QYPpzSYuoOvC8W3?=
 =?iso-8859-1?Q?GfjL2hjnj/qRYUhu5z6DcYfyCkSpvT1g81Kh4U61UzZVWWTSSSgqQoPuqw?=
 =?iso-8859-1?Q?MSP+LOqIwRUD8sqYDBmK04nuqEwBX1Wase5HiFnMHfnM2Aap513uRi7IBg?=
 =?iso-8859-1?Q?DTEUIsfZ5/O9KqiGjevjAM99o17nzJLggefqPaO/jpn8qAdIRBWSo3e+jQ?=
 =?iso-8859-1?Q?+TeaQySH+mho/HTe9IgaEhIZ9f4n4wbBhPnHTs54fhLKCFQhtMvA61v4em?=
 =?iso-8859-1?Q?sGZlTmIhSy5YngbetamFOrPGgue86C/39CHNH+D/+6qV+VyL+7Pp0rGqIU?=
 =?iso-8859-1?Q?Zlxc61QfTGHhysQkjO5c/MPETG2SemRwMmx6FIYrFFFJklurzJLo6SGv9q?=
 =?iso-8859-1?Q?/puBntGzzw3fHtij9cJvzRpvSOM06Fav4iW9lZpZDj9YDDZkw792aWa8qp?=
 =?iso-8859-1?Q?bagidUC/j2Q6yqU4uK6CaqlC0Pq9PhnI9RPqKKqv3sWcRrFwgv7yfS4IY0?=
 =?iso-8859-1?Q?05+zE7C0YkXX42k+y5wAFafKwMnx4wNRfPz2L87T1gGL1HT8s27fa5X3sV?=
 =?iso-8859-1?Q?g8ckV8V/2cgdth88lXJM86T7j0tbwDhKW/GAl/Ff8nHLRHRwGv8R7HF0zF?=
 =?iso-8859-1?Q?dejmfpp5Dzgl+ZzLYyXectBf0noDOcqYbUpIW0Neu/Fpwp6cKZ2DCHIR5/?=
 =?iso-8859-1?Q?F84x8hFR/aotVy6jAXieOBGGqKdrx8QrbsgF92LfYGu8+8xSlEo0Uutg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c5d9b2-e834-4c46-91ae-08de21d97b1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 10:51:49.0352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zXMOreC99SoWseZ0KgOhN46PyW3A0dWzsLhJHRlSKlI3MnDLQhaRT9O3KZTk29YkuqDB5tAc2Syb6QfJEB4Ubg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9786

Implement XEN_SYSCTL_CPU_HOTPLUG_{ONLINE,OFFLINE} calls to allow for
enabling/disabling CPU cores in runtime.

For now this operations only support Arm64. For proper Arm32 support,
there needs to be a mechanism to free per-cpu page tables, allocated in
init_domheap_mappings.
Also, hotplug is not supported if ITS, FFA, or TEE is enabled, as they
use non-static IRQ actions.

Create a Kconfig option RUNTIME_CPU_CONTROL that reflects this
constraints.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v3->v4:
* don't reimplement cpu_up/down helpers
* add Kconfig option
* fixup formatting

v2->v3:
* no changes

v1->v2:
* remove SMT ops
* remove cpu =3D=3D 0 checks
* add XSM hooks
* only implement for 64bit Arm
---
 xen/arch/arm/Kconfig  |  4 ++++
 xen/arch/arm/sysctl.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index cf6af68299..931ae51575 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -274,6 +274,10 @@ config PCI_PASSTHROUGH
 	help
 	  This option enables PCI device passthrough
=20
+config RUNTIME_CPU_CONTROL
+    def_bool y
+    depends on ARM_64 && !TEE && !FFA && !HAS_ITS
+
 endmenu
=20
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index 32cab4feff..3c4e29d82c 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -12,6 +12,7 @@
 #include <xen/dt-overlay.h>
 #include <xen/errno.h>
 #include <xen/hypercall.h>
+#include <xsm/xsm.h>
 #include <asm/arm64/sve.h>
 #include <public/sysctl.h>
=20
@@ -23,6 +24,33 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
 }
=20
+static long cpu_hotplug_sysctl(struct xen_sysctl_cpu_hotplug *hotplug)
+{
+#ifdef CONFIG_RUNTIME_CPU_CONTROL
+    int ret;
+
+    switch ( hotplug->op )
+    {
+    case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
+        ret =3D xsm_resource_plug_core(XSM_HOOK);
+        if ( ret )
+            return ret;
+        return continue_hypercall_on_cpu(0, cpu_up_helper, _p(hotplug->cpu=
));
+
+    case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
+        ret =3D xsm_resource_unplug_core(XSM_HOOK);
+        if ( ret )
+            return ret;
+        return continue_hypercall_on_cpu(0, cpu_down_helper, _p(hotplug->c=
pu));
+
+    default:
+        return -EOPNOTSUPP;
+    }
+#else
+    return -EOPNOTSUPP;
+#endif
+}
+
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
@@ -34,6 +62,10 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
         ret =3D dt_overlay_sysctl(&sysctl->u.dt_overlay);
         break;
=20
+    case XEN_SYSCTL_cpu_hotplug:
+        ret =3D cpu_hotplug_sysctl(&sysctl->u.cpu_hotplug);
+        break;
+
     default:
         ret =3D -ENOSYS;
         break;
--=20
2.51.2

