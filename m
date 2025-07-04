Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4F2AF9BBE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 22:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033717.1407036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXnCB-00073P-DL; Fri, 04 Jul 2025 20:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033717.1407036; Fri, 04 Jul 2025 20:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXnCB-00070E-A1; Fri, 04 Jul 2025 20:39:43 +0000
Received: by outflank-mailman (input) for mailman id 1033717;
 Fri, 04 Jul 2025 20:39:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSlO=ZR=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uXnC9-0006X7-4y
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 20:39:41 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 019df714-5917-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 22:39:39 +0200 (CEST)
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 (2603:10a6:102:32a::16) by AS8PR03MB9414.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 20:39:34 +0000
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673]) by PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673%3]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 20:39:34 +0000
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
X-Inumbo-ID: 019df714-5917-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITNrJ4M0P6kqifRbj86j9jRFnaKDiLsiDucd1FHYK+CIElqZA46ujZllcK7OLmQAsB0ifx54q+QgEmLJJdTQLnOWSMApm8IwPUryeFh8An/2Vl3yhlDKWJNIS0LhhKAW8/CkDW1HIWrswjpm4/hqVcfc9dvN5sFFCGqmdDWhrxn6y7u/MxPEv2f41eLM3QthULdRGD3K7usKXnnaQyIozUaA7DFsiVSCxlCK6s6UzT+4Ld292/IoLBLojzBR5OGsWdKaklVLKaDaqI4in09vZHiqlygl1A2P5ZXpydriA1FuWLeLYLT9Oa/v/K7LuR1SzbcOIj7IeyfJWbXiHIK8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwsGS5179KhQq+DoYylCMb1ujqL+m54UlfDUzyF979w=;
 b=B/cVCuVlEiwRXmMUkhS2gXqKhVqRERIjONqNUPOTxwGYb/ccjx/vM6rqPTMG4Z0uojyCO066YCG76a8Xwg0Z+aKePhMpmL3O3baK0TVXc10GUYmZgyd2C1KkkaDXlO7LhYdjeK0245ELFM/3Hk+yT1DPjtUimsz8wE9F2W4XPgF4gP1uww8S2yuRZvo8Gl2MLYAknpkQD8i8etxNs0PnBJo1fYEFoSIDMT/Ss23xZQe2k27vLqGAVgksc6qqGxIJkqyti3+P6lXDh4Qp1BwL1DXJeKYbKL96D/Nf0L60rpy7io/FNYU/oKiGA32K98StK1u3KL0WuX/DeApvXiG39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwsGS5179KhQq+DoYylCMb1ujqL+m54UlfDUzyF979w=;
 b=j0SnW8PC7ucj4etNRfx47NKEyJCAiJP7WjdebFWDwOOCxU1mMsy6hwoXhLldUTiwwbBSl/CoSfOzsPkjSPRQZafRfP48UOpo7k88LMqH+zouFecStzSYBuN91nZqglHrMgpoPtc+O+bWvcWHuPOGFewrmJBxSXE67qYPPbCkYMUbEOQGjod6FArtGOoYzfeQKR1o/XWYGsOuM7ano9NS3yuTXaq/9Ucp/TV667DozS7yWCz68TZC/bMEd04TNsACvS0dMnqvSUTOaqYPB2YmeW2beCNw+ZuUfnPBzDpwLexx+dYxNLOqeaKN6ZsGAUWJuXpMK1B7fGyNVMXyFa2A1g==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/5] gnttab: address violation of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH 1/5] gnttab: address violation of MISRA C Rule 5.5
Thread-Index: AQHb7SO/ocKpxuM76k2AQCjdidhw/g==
Date: Fri, 4 Jul 2025 20:39:33 +0000
Message-ID:
 <12b31e64625806bcd82d3d820f39c44e71479e1d.1751659393.git.dmytro_prokopchuk1@epam.com>
References: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10142:EE_|AS8PR03MB9414:EE_
x-ms-office365-filtering-correlation-id: 112e3124-ab08-4208-eaec-08ddbb3ae28e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5+E1+Zy0LM/g7EUx8VUtu4yykUv26hCzLvVK8chEFmvWJEkpcbo/WkCPZq?=
 =?iso-8859-1?Q?Od0b2u8Fna3Dt75gr+dpfVh9Hk9PBNdAZy4dAWiJ50bVQf95Rz/MB9Tv8B?=
 =?iso-8859-1?Q?hDkTFd3d79kDjBkIVgJ5TkpS98qoWKx6yQuuWETCgbHwZEi4jCaaSkCn5R?=
 =?iso-8859-1?Q?tczU0iI2qGnSw8akpkHRUOulFYgwJgIexZoXrF31YENA3vjzLWPWWNGz7h?=
 =?iso-8859-1?Q?biS1QpxdB7niuJ0kdjiOy4q3G7raz9DKq9BS7OgfbUDY9cvGKAooyCiYH+?=
 =?iso-8859-1?Q?kRGbdls4eXSQDao5hL9bzBdx2zbgGAAt/Q3naYxWcvOKaMN+PMeTq4i2yp?=
 =?iso-8859-1?Q?wesbcIdj8qYqXyKQr46GE5jlDnyrAGuQIm0EX/2AqE7RNCp1KU2zlB68V9?=
 =?iso-8859-1?Q?8HMjLWdj+FITESlgoA0MnWFs1rSy+OmqGT3HNKaRmTeCfKTn9bCgGqSyBm?=
 =?iso-8859-1?Q?ntC99S067eN6Scw3PyKhKa4iMISGW8A3E+y50M+V+SQh+LBCBCFS4jRA56?=
 =?iso-8859-1?Q?nXqjTFp6kO8pK2M9Lt0Ik2qoF+PE1Bg+jqtasQwlGbIzSkY6wvvNtigRVH?=
 =?iso-8859-1?Q?T72l/PWhu6MFD1rtbazLL9EpjwkTCUFdd75pvwWieaGwzFOrb3jxA7j+7Z?=
 =?iso-8859-1?Q?G8uC9+RC1ZPbi0pc62MS2uoCYDLjIe7HILZBXYPQuXxaWe+rP6XMiutA8S?=
 =?iso-8859-1?Q?fWbBoY7/rcLbSqOzI5B+0eMY1xLepcXlrKMJAJ2J0NAtZ02Rn3SW1uMxLq?=
 =?iso-8859-1?Q?iuy2uAXQJTkH4Dwp6+dee00VfDax/ypKtRSGUOvBcr6FfJPGdKVG3V0/u4?=
 =?iso-8859-1?Q?/SlAxLD4bWhZxe/vzhuTrs5ZB9Qx/xhV5mY0aKlTbGscbHW8qrTz9iZhzy?=
 =?iso-8859-1?Q?nuD57aOvKHLi+swY23hZWoWc38FdgJnarm7yosPh9fcW1kkuo5U1ka5dc9?=
 =?iso-8859-1?Q?v7OpUvIJKUIFPo2YnjYGPsOZNUnZ8nOlkyrjkxWj4SFypr4/qmIWQuhVj3?=
 =?iso-8859-1?Q?wplzEIKsc+1gIGzcbav3xUv1NnG5RwAKkBSKnqNXCAdgeV3m2spW7KJ+qj?=
 =?iso-8859-1?Q?uSk6yQzRGjPdUndZd/tcP8WSchB4WPMv4AJe8P/C57yg055nIWU/OUf2SW?=
 =?iso-8859-1?Q?wQb3hiEIuoTFucQc5dkORPge48oGMxtv6T6oIYdT+4sh9NE/QKG5aZDoNa?=
 =?iso-8859-1?Q?toL0xeVSncqZWv7A4wBxLmOwJmWlJe9ckLaNG9YK7mLW9c8pK4zYM/zwNh?=
 =?iso-8859-1?Q?MkkxI5LToN/gh546yVGCwwjrvr+5GIii1ajWjSqNQX7Si8TQD4GgVtKFyO?=
 =?iso-8859-1?Q?e4yrIn39SoW1SmufQmQCuLmhNMHQpDkwe+lvhxq4pr7bo3TmwHXkN96NLe?=
 =?iso-8859-1?Q?31d+swieVHcswOPYr3ESm/PRwlQXvUrYBrbpUTLTQhHIPEs5l8Hm1yyLv/?=
 =?iso-8859-1?Q?3QZWd9og7yUMZJPrG4sYFLqZMbeZ5p0zYE37Xdl/a4epLkTdzSz+YcORog?=
 =?iso-8859-1?Q?qAskGqgnekNTFX+XY7cyhIomhpq76MmZyDNccU4FFuyw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10142.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/FGucPtR1QBcgQBfGG12mma96qrcZ8FzCo1Pv7wfGaOTl8UpJjOa3NA+uX?=
 =?iso-8859-1?Q?gqR+yvcO+AJif5n6/knaQdbBMCX9GcxVmKUbk/++dDH8Wg8vfaCvSKN2SQ?=
 =?iso-8859-1?Q?XJd99fYOwlvW7WCiLnIGdq1yybFZ5GVnz9jA/LG2W1myNzxG05djNPKNbL?=
 =?iso-8859-1?Q?SmoGlp4TxPPFdz+g99hGlHurnX6PQv2h9bZZt1DEeDWlzhQLGSXogi6pRx?=
 =?iso-8859-1?Q?dzCR9f/VEuotCVBU9HDVIJM+nNZO60hi0DfHr0Jdgp60rLzSt3f2HuEKlq?=
 =?iso-8859-1?Q?zFPnCgnb/rLxvVM0lTjbcXmxXiUUozTFA6DbMKuQvIPGJNsKU5Gm4tWGvk?=
 =?iso-8859-1?Q?70Kv36GqWrm55R3qBjC3GhJRSFGrI8rdBFzgiQ19MOHXm9V2npostFFRS3?=
 =?iso-8859-1?Q?hSOXg6r0aionzp7P3D31b624qpe/tP30Fn9dmWcL4+Zqakr44GLcLOLQ1e?=
 =?iso-8859-1?Q?vP3a5kXmpZYWd/9keFd3tcJgVnxmdC+EbghRoRegCRWG0lhMrN010xAgs+?=
 =?iso-8859-1?Q?lDsBnACqGKYsM7qPZk6TVdtzjP1hq9hTRa4IKNtSlSd3fq6gIi5dV/S5WK?=
 =?iso-8859-1?Q?6gNBbSn7igN47H8NfJz0F7wmoD1LQjOj1NjXDSZ/4GkUEFuO2SZt9tORhF?=
 =?iso-8859-1?Q?+t4gcoRZqWoJ4dBkmNzj2n+tRD5IoaAUXXEvTLXpZkSJ4K6g1MXuKTh2uk?=
 =?iso-8859-1?Q?1A+WZjqfKLW5z6IKAXZMHihNqAPIFQQrZDZeEIzerWat4poaDzNwSTDt42?=
 =?iso-8859-1?Q?zZ2gwY1I/Non0l8dcsDszCEFKE4jeJNV8BbNvO6SthBtLjJrgKyApIQQVr?=
 =?iso-8859-1?Q?wdVA2ax9hNfUshrWVOsXIUvX6tWxINOaCdiRgDhvCB57ke5fKo/qTjuAbR?=
 =?iso-8859-1?Q?H66D3o6KzfFeEXZZStGiltRo/STIADWY3Le5XqzE3E5IVijj2RfUeFV3TJ?=
 =?iso-8859-1?Q?xu0wdLuk1b2FMBSaCJ7R5MRhL6q5VCeegIBVM7Z2UfZLblTle8vP12k8Bo?=
 =?iso-8859-1?Q?wxyzvLxz/4gcjTQ400kIUb1rCFOI83nMBxP0+NLuJ/yLP+mVBIEFw6jCUB?=
 =?iso-8859-1?Q?R6SLwE/IiP+ujmqGzQcF3tXBiTaP2zbOGzRnLU4K4YaibGISUMDhgPekd1?=
 =?iso-8859-1?Q?HZqA3y2C//yavZNiIt+PwGlr5mhLAu9uNoKRz3U1WS0Nqf9/ISBFM/vNc0?=
 =?iso-8859-1?Q?TIZuDw04H3/3FWTI5IVPWT73HaIf1BXTLDnecfEJweYH57HQm7CQ/wtUi4?=
 =?iso-8859-1?Q?Pz7yyNLPSPujU4jHiSoDOZ1GdELPYBK7qn6LfIOrGsFItxtEOyXWg5dtit?=
 =?iso-8859-1?Q?iNnWNHw4EpgyViYh/XAZG0g4I2XH2MwheTlkWOrUZHdh644+MuEXK3BO8F?=
 =?iso-8859-1?Q?IW6CY+4GGPomkrafuiHpPjPcQtjFE7wCrKtOjVSicjb8Ua1grioYIT617D?=
 =?iso-8859-1?Q?9g9dQhNR2tB/bRft9x8U4Bt2Z8HVsNLv+C1lOuEkLF3X8WRndwxIy0LOF/?=
 =?iso-8859-1?Q?gFKCrcvbJr+D9LDfEJmCQACcfsYR5z5ODvfxMfrUFae8ZtHQrfH9LpY6em?=
 =?iso-8859-1?Q?dEjhu6EmKDdifa0qCk+OOjOzHtA/X5Q8PiArd/zGLLPbcOA6k34Y/ce/Xu?=
 =?iso-8859-1?Q?YXEehizVzSED/kRqYaFBUzqkh02v0nrINvDA16Luc7KXMrwun94sPWsQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10142.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112e3124-ab08-4208-eaec-08ddbb3ae28e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 20:39:33.8306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9QzMRoFZFEQ/v6pTjIRlcXH5KdEhc0QJxJvfeedgOmwoL3J9zTk90V4FyEnggt1ndv25ztnL7XD/gQ8qcGpfDMpD2OFw5GKqSPKojvoVOBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9414

Address a violation of MISRA C:2012 Rule 5.5:
"Identifiers shall be distinct from macro names".

Reports for service MC3A2.R5.5:
xen/common/grant_table.c: non-compliant macro 'update_gnttab_par'
xen/common/grant_table.c: non-compliant macro 'parse_gnttab_limit'

The macros above are intended to discard function arguments (unused1, unuse=
d2)
when compiling with different configurations of CONFIG_HYPFS.
This can lead to confusion and unexpected behavior
because the macro name and the function name are identical.
Split the code and create two distinct function signatures.
This ensures that the code behaves predictably and remains compliant.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/common/grant_table.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index cf131c43a1..f3282a1d7b 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -126,18 +126,12 @@ static void __init cf_check max_maptrack_frames_init(=
struct param_hypfs *par)
     update_gnttab_par(opt_max_maptrack_frames, par,
                       opt_max_maptrack_frames_val);
 }
-#else
-#define update_gnttab_par(v, unused1, unused2)     update_gnttab_par(v)
-#define parse_gnttab_limit(a, v, unused1, unused2) parse_gnttab_limit(a, v=
)
-
-static void update_gnttab_par(unsigned int val, struct param_hypfs *par,
-                              char *parval)
-{
-}
-#endif
=20
 static int parse_gnttab_limit(const char *arg, unsigned int *valp,
                               struct param_hypfs *par, char *parval)
+#else
+static int parse_gnttab_limit(const char *arg, unsigned int *valp)
+#endif
 {
     const char *e;
     unsigned long val;
@@ -150,7 +144,9 @@ static int parse_gnttab_limit(const char *arg, unsigned=
 int *valp,
         return -ERANGE;
=20
     *valp =3D val;
+#ifdef CONFIG_HYPFS
     update_gnttab_par(val, par, parval);
+#endif
=20
     return 0;
 }
@@ -161,9 +157,13 @@ custom_runtime_param("gnttab_max_frames", parse_gnttab=
_max_frames,
=20
 static int cf_check parse_gnttab_max_frames(const char *arg)
 {
+#ifdef CONFIG_HYPFS
     return parse_gnttab_limit(arg, &opt_max_grant_frames,
                               param_2_parfs(parse_gnttab_max_frames),
                               opt_max_grant_frames_val);
+#else
+    return parse_gnttab_limit(arg, &opt_max_grant_frames);
+#endif
 }
=20
 static int cf_check parse_gnttab_max_maptrack_frames(const char *arg);
@@ -173,9 +173,13 @@ custom_runtime_param("gnttab_max_maptrack_frames",
=20
 static int cf_check parse_gnttab_max_maptrack_frames(const char *arg)
 {
+#ifdef CONFIG_HYPFS
     return parse_gnttab_limit(arg, &opt_max_maptrack_frames,
                               param_2_parfs(parse_gnttab_max_maptrack_fram=
es),
                               opt_max_maptrack_frames_val);
+#else
+    return parse_gnttab_limit(arg, &opt_max_maptrack_frames);
+#endif
 }
=20
 #ifndef GNTTAB_MAX_VERSION
--=20
2.43.0

