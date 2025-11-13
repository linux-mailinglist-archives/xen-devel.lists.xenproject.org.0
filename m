Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC525C56E1D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 11:36:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160914.1488963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJUgk-0007x0-2b; Thu, 13 Nov 2025 10:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160914.1488963; Thu, 13 Nov 2025 10:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJUgj-0007uW-Vt; Thu, 13 Nov 2025 10:36:25 +0000
Received: by outflank-mailman (input) for mailman id 1160914;
 Thu, 13 Nov 2025 10:36:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/hc=5V=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vJUgi-0007uQ-Kt
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 10:36:24 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97081c94-c07c-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 11:36:19 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GVXPR03MB10777.eurprd03.prod.outlook.com (2603:10a6:150:221::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 10:36:16 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::d976:7403:c89d:4677]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::d976:7403:c89d:4677%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 10:36:16 +0000
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
X-Inumbo-ID: 97081c94-c07c-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALJlAML/T/gnexz3uoxvLenHZhinSEkuSnt/REK9AS0NaC0e83RF9ndKvfo62YEZayKtOWSRvQdnTA5sy0FgAI2OVOPB6IlrLUwdQs81EIRq2+PkMC1nR90wZs0JhosDqAw3azHKkmHr7M3F4XDcMr6YfMpVNNLb/yp4IO1OuirNYnrh0bg7HTtztQb7EEhni0vUd9kZX+cBEUss4glV5+4pv2wEewdVUQAKNSLTGsIiB8nAk/eZIwOzlgMisec6M9XB7LwiOgRfat5Xq458tcCw8qen4d2tcdXtw8ZksMj0S1Cfz4MrqukzINzqvQZMm6PDrA0MEFiSBrhGkk578A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbxJhpzrqz+EFeD1v9Ld8Gc4lj4WhTVnIX6MzzfdEuc=;
 b=QPsdo5YgGrk9X0TOzcHuACadDj2Nt8xNewh2VVSaioDlccK723Uw7FZb+iAmIXSrIhCluLzx0SCquEkOwcDVHyXKrj7vujV1mztgDMV/g3S5oMddZcguJjDS80/qze8yWQ5Ft7OecqiyZoqcNb3UhPgDOK+2JXUCedyoOWLeXIGNzt4JTYzSL6DJavJmJ2l78QVDOAN2BaMFiohKPSu/EfIZgYAsO4ayZ/FzUummekA1y23NhLwnqMkfy3EmQHvlxeUfo2Qp3jGTnJ1h5D5oDxO613UEfIWHpHbs8SYEpZOMSBWmTCXlUBvAzsUqCOYpKQA6jLH7dpQRwLj0xlgJdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbxJhpzrqz+EFeD1v9Ld8Gc4lj4WhTVnIX6MzzfdEuc=;
 b=leZ4PWKjj0gUqw5hVjqHWl44SrZepbeVRSTbC6opvE+ZhGrLr7FGy3TAqTLwWHGGKEUTlyzwwVMPNc/B6g1LAvTIW9h+K2Ddp/l3wcDmAkWwvf+kVx4Fb6oCdj4+AbxSwg6PiF6tfV3by3/M/5dap/ude0nmsHMVnXlG4f6H3phz/Piedi2ntN4zRY3QRzWi0pcBAFi8zUKXMJIGOixDrD6bQoOxinN3V85Ll7a0FSyYXRxRFaSq74C4yXcdgmKVAabxkG9eJTdhzKE90Aj/CCYCGM00e7MZ0PQOnyKGILQKFsFC4ocmXDVnlhKfDU5Ypv8DIqp/P6X1CUxKpXfu8Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] libfdt: Replace hardcoded FDT version numbers with macros
Thread-Topic: [PATCH] libfdt: Replace hardcoded FDT version numbers with
 macros
Thread-Index: AQHcVIlX6FmSxVBd8UyRU/9awRURXA==
Date: Thu, 13 Nov 2025 10:36:16 +0000
Message-ID:
 <b449ec7262c4e04c7e82eb50df294991dd9fbe50.1763030084.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|GVXPR03MB10777:EE_
x-ms-office365-filtering-correlation-id: 413b537b-6136-4324-e995-08de22a0798e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?e87eouxlHPi/o+jb9hpnb/4sZkgAMULd1D+VKeWEiEDyHy9FO5XDctspwL?=
 =?iso-8859-1?Q?fPtmTROZYT2eIIWN40qdcvLqSvo2uRpZ2/zv8lF8AXiBb6iYefFMpImEun?=
 =?iso-8859-1?Q?Ca0CxIohqoVgaSs5i3RO6qFt+br92IUgbw7nYWNbv5Vi7NDV82pyTDkkio?=
 =?iso-8859-1?Q?xGJaCBkYJYXescTayKNNwVi5EM3BJOUlW+ovB1snRfpKHnIBFMqlRhYbYe?=
 =?iso-8859-1?Q?IQGrxolubhdiHmXxyiTW+nAuO8uTzTAbZZb6hI/qNdgx9BgPaHECcMj+vx?=
 =?iso-8859-1?Q?yv0U4B6p4uNPDwg87S3OOEQ0H46IhkU8oWvEdi8RvkshZySU7xeYlUBS/I?=
 =?iso-8859-1?Q?pE7wfmtanJYObzaFxq8sNWP8UHwxAjdS1EWlZA+ho3URxh2WUE3nm0SmW2?=
 =?iso-8859-1?Q?De0368jPFDSgrEWRktQsG0q+J3IiKdl+JA5UEzFXFgIFBxbEnGl9TNopbG?=
 =?iso-8859-1?Q?OqNDSUbCWBmNGvaBIMGmAJvlugZboGJbXLnIAzaK6Bz3ft5pVT1/HDdV3e?=
 =?iso-8859-1?Q?Ou3SBK1UgdPSLAWUpzAWX3BqR+z7nx0L6GWbvrAVjwIESjXjBGeMmOoOuK?=
 =?iso-8859-1?Q?grV1fXGrjK18GT++IQmBn2ED1AbFminIyRY+wUSHsMjUM5Y8kIPbQR9FD4?=
 =?iso-8859-1?Q?SOPJJ9vxBo0t98vW6a9zGqs8Divom9+faZ4I5KS5NdYfNlMItf/2TlpyzR?=
 =?iso-8859-1?Q?LAmdq9/KI0g3nLUg0bhYeQxaTVwRZBvthegc1zI5gAz3qcUvFbuZAARCob?=
 =?iso-8859-1?Q?/6kGuH1UXnx/Q1VjazAkJgurPxzazSq8dL+qs+4udJyb3WoFq7D0bBdjtw?=
 =?iso-8859-1?Q?V+VCz6i8n9bxz56TKDyLRN8sNxHNQRaCy3gyalK+wvEXgoZvD48RyXEsGC?=
 =?iso-8859-1?Q?/BUtjG8DiNrWGd6gBArZurN6L0PkYK8GWYUJ8Ojd3gZLDrIycgwOgICnFm?=
 =?iso-8859-1?Q?ZxlUf3HyLFdTnd5wsTp4SZtD4tsG0Xx8lOynIKcN5Xhs2DcO9ziBo35Y73?=
 =?iso-8859-1?Q?brdin/rzfH5Pn9z60mzCy4bR63xWE+xHWshTpQd0ik/gNug23e3IhT3+l4?=
 =?iso-8859-1?Q?/6uhWNtoqn2bgv3kymKD5OJsdT10qI9izjz3NEwRhyLXq2yMAWn8228CoF?=
 =?iso-8859-1?Q?Iq11OY/hOjd0G359cb3TCOJo4LYG7rYHj1Fjf224N0xf9idJB9DrqJli2B?=
 =?iso-8859-1?Q?FZzXt+jc88jWP0RtTsPUO/MyBF0z/a4emSbHDfT3zKrEE1DlE6UW5yvOFr?=
 =?iso-8859-1?Q?ZTSyMmpW5AvSGHqm4IPMYlC0g4GuJ3U78Ba+i/aohfaw5x0IwkKoHWJi3t?=
 =?iso-8859-1?Q?KmZiqS7liBX6DA+18tTG8FWQG38jk/NZTBZ46VWAMaA7ZRBX1ccYx3ong3?=
 =?iso-8859-1?Q?GgFQW5cXIJErD36Q2/C4ob8SK6ZzW+mco/jm6DGuJFp/9dCuowpZbdwlli?=
 =?iso-8859-1?Q?yKUB67z85vbc1rSdbUXNhKKEpFM8hyaezRrOP1MB0680ni9EXKHVMVIIww?=
 =?iso-8859-1?Q?XzDqTtdDGvZsuD09Qsv9/2paBNjhMLOLhSRyOncBlNZxuqjtaFfg7PDUD5?=
 =?iso-8859-1?Q?47Eyeqbfw5UBE+sGp3aZca/Lq/mR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zHTUuDxaFVjGcrQ7OYzTgyWnmUhKsTwg7be/5MBcu7PPwp1hV9u+nR/P/C?=
 =?iso-8859-1?Q?sVVxIRrKYgzLFSGYkv2ejFtEpVWz1g40w57WR1rxC1BvrU88qFTp159xmH?=
 =?iso-8859-1?Q?IzHXdE2NC7Og6XnKQPFAgRZHFtB8LI2E086qK95sIMlZ136SJ0HZ+Pk/1z?=
 =?iso-8859-1?Q?f4zsH0/yINbYe4JHu7+uUl3m6CQ2a+kaSdw2vLfQ2W/8XKNhIxPBq3WV28?=
 =?iso-8859-1?Q?PeS7C27OibJYflOxQg19YPe+0XbxPGIQh8X3Q1GTJ6kgC7XtHyr9VJgE0N?=
 =?iso-8859-1?Q?KNz0UiksTK5hxOjfQSMpT2nsA08essdNvKCYjTgr7wLrV+Q90PGqsq7hkf?=
 =?iso-8859-1?Q?dYkSgo+s2W9v3w/AYb8eHH0dRXyO+2daI3lnpWLNn+GnuqS11HcH+Enqj5?=
 =?iso-8859-1?Q?xW7cKKF8PaQJTBruUapyTmgIL7prdFn2TtYa1qD4/55qg/IfmcLFN69YI0?=
 =?iso-8859-1?Q?ZMJSVdA3L2YxnFR9iGlUJ/2aD5CBaDfGs0fZSZWENXHOsYCjv4cODsNlih?=
 =?iso-8859-1?Q?3KyUD+IA8f73inyaF1n4Ry/vvx35+bmFH+w19JQ80iEKffwl4jUrmu0lo1?=
 =?iso-8859-1?Q?CvfLtO+uSCrYsUV7QZJJwdpI73Xj940CDxsWrPeGAJ/RV0F/Xd+yxNgdkR?=
 =?iso-8859-1?Q?jPoCLg+zPs5nkonKwSw82I4IAJHMvd7MikH/JCRViwBDlEMTzhEbDIdg01?=
 =?iso-8859-1?Q?nizUPlxDPe12h9BjlDdjrlS6uA9eNys9oAQuoyF9A3oCT8vF92iVF6Z3vm?=
 =?iso-8859-1?Q?XdgBF8i6JW6566jr7u8Tf65fDf3GmsvPTCsJmNcBwW9OOyFb5stVbux1pY?=
 =?iso-8859-1?Q?tvUUwTSWIHiw7yU7gYhr1s1cD2TzJLLYANFXLUQSXARDQmJjy39cAzMBxT?=
 =?iso-8859-1?Q?cNhttAIGHEGlzf6YkbzkGzf8Ms07PgLxm/Lx9ZoBeA7XH4veVeT4R078uN?=
 =?iso-8859-1?Q?zkj7hRre/oUpbFFs5zBIpSufZ9fHt3YeCUq89NafRfRqWKytBJvmyF7DsJ?=
 =?iso-8859-1?Q?sr7O0XjUuMDfb7unsGpnU+AiWrvwi/ZHpxHooGzN9N3RDgtHnj/v4hUBNs?=
 =?iso-8859-1?Q?3f7Hpaf8LwkRmoxAiBMCVKgwTIlRVjXp1zqyzkAscCEWQz8whqiqFJbxjQ?=
 =?iso-8859-1?Q?K9e89PA3n4Ea8a1hHPuhwSI7bHxm8PyXAdsDrZP33qZY53YG+A9Skje69I?=
 =?iso-8859-1?Q?C2ZEubVZLla5avOzakZyJI8RsA2swLdgB3vSNqQC3B0xsNHcp2ICt89Ih4?=
 =?iso-8859-1?Q?ztGqwFO6xyeQiN9bY6xnQLXH3roqTyQF0Qlg2sO6tswQPI2wl3oHlXa+t2?=
 =?iso-8859-1?Q?keV3OoIeHhnNMlacANfL9k9e8zhce677B0JVT+slMMPEQ7jIVpzBefGV/M?=
 =?iso-8859-1?Q?jIbLGiqGlI/E/n+lZsDBSKPZuml9eoh9jwj/f5g/ST0TmLsQXsPxqgtSs/?=
 =?iso-8859-1?Q?hzXLa6IJiaQV/yk74YIEE14gH+shSvEIliUY0+bxtbdjyTYszqJf4zGdS7?=
 =?iso-8859-1?Q?mXmc7EvNpY8TwEIjeVCupSEV05I+xF8Eqr/YfV6W8PHAHMqlqcc1g5GpTP?=
 =?iso-8859-1?Q?kTtDAntB/BRzUzULmeP28xooioSJ/JPv2l6jjZM3DvS67wYN0mokohpgkd?=
 =?iso-8859-1?Q?DSRfg3fN6/qJ16lSBGJrqbmOk/Yb30lKO2lLZHlrYV4APQYbH/ZeKIhA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 413b537b-6136-4324-e995-08de22a0798e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 10:36:16.1941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fnWiA20eJM/U5F+27ViuW5r/WFiq02x89BJADhw7BDo8wdxAmfmLn1SLo7WPr7xxbbkzsi5jJLJHGh7L+Hd8GMCgR2WEMwLI8txMwwH9pmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10777

Replace all hardcoded FDT version numbers (such as 16 and 17, or 0x10 and 0=
x11)
with the macros FDT_LAST_COMPATIBLE_VERSION and FDT_LAST_SUPPORTED_VERSION
throughout the Xen device tree and libfdt code.

This avoids magic numbers and makes the Xen codebase more robust to future =
FDT
version changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/common/device-tree/device-tree.c |  2 +-
 xen/common/libfdt/fdt.c              |  8 +++++---
 xen/common/libfdt/fdt_ro.c           | 13 +++++++------
 xen/common/libfdt/fdt_rw.c           | 16 ++++++++--------
 4 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/=
device-tree.c
index 0b5375f151..ee8b32a8b4 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -1949,7 +1949,7 @@ static unsigned long unflatten_dt_node(const void *fd=
t,
         sz =3D be32_to_cpu(*(__be32 *)(*p));
         noff =3D be32_to_cpu(*(__be32 *)((*p) + 4));
         *p +=3D 8;
-        if ( fdt_version(fdt) < 0x10 )
+        if ( fdt_version(fdt) < FDT_LAST_COMPATIBLE_VERSION )
             *p =3D ROUNDUP(*p, sz >=3D 8 ? 8 : 4);
=20
         pname =3D fdt_string(fdt, noff);
diff --git a/xen/common/libfdt/fdt.c b/xen/common/libfdt/fdt.c
index 9fe7cf4b74..4b30a17b93 100644
--- a/xen/common/libfdt/fdt.c
+++ b/xen/common/libfdt/fdt.c
@@ -119,7 +119,8 @@ int fdt_check_header(const void *fdt)
=20
 	if (!can_assume(VALID_DTB)) {
 		/* Bounds check structure block */
-		if (!can_assume(LATEST) && fdt_version(fdt) < 17) {
+		if (!can_assume(LATEST) &&
+			fdt_version(fdt) < FDT_LAST_SUPPORTED_VERSION) {
 			if (!check_off_(hdrsize, fdt_totalsize(fdt),
 					fdt_off_dt_struct(fdt)))
 				return -FDT_ERR_TRUNCATED;
@@ -154,7 +155,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset,=
 unsigned int len)
 		    || (absoffset + len) > fdt_totalsize(fdt))
 			return NULL;
=20
-	if (can_assume(LATEST) || fdt_version(fdt) >=3D 0x11)
+	if (can_assume(LATEST) || fdt_version(fdt) >=3D FDT_LAST_SUPPORTED_VERSIO=
N)
 		if (((uoffset + len) < uoffset)
 		    || ((offset + len) > fdt_size_dt_struct(fdt)))
 			return NULL;
@@ -195,7 +196,8 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset,=
 int *nextoffset)
 		offset +=3D sizeof(struct fdt_property) - FDT_TAGSIZE
 			+ fdt32_to_cpu(*lenp);
 		if (!can_assume(LATEST) &&
-		    fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >=3D 8 &&
+		    fdt_version(fdt) < FDT_LAST_COMPATIBLE_VERSION &&
+		    fdt32_to_cpu(*lenp) >=3D 8 &&
 		    ((offset - fdt32_to_cpu(*lenp)) % 8) !=3D 0)
 			offset +=3D 4;
 		break;
diff --git a/xen/common/libfdt/fdt_ro.c b/xen/common/libfdt/fdt_ro.c
index 17584da257..f719712b71 100644
--- a/xen/common/libfdt/fdt_ro.c
+++ b/xen/common/libfdt/fdt_ro.c
@@ -60,7 +60,8 @@ const char *fdt_get_string(const void *fdt, int stroffset=
, int *lenp)
 	if (fdt_magic(fdt) =3D=3D FDT_MAGIC) {
 		if (stroffset < 0)
 			goto fail;
-		if (can_assume(LATEST) || fdt_version(fdt) >=3D 17) {
+		if (can_assume(LATEST) ||
+			fdt_version(fdt) >=3D FDT_LAST_SUPPORTED_VERSION) {
 			if ((unsigned)stroffset >=3D fdt_size_dt_strings(fdt))
 				goto fail;
 			if ((fdt_size_dt_strings(fdt) - stroffset) < len)
@@ -309,7 +310,7 @@ const char *fdt_get_name(const void *fdt, int nodeoffse=
t, int *len)
=20
 	nameptr =3D nh->name;
=20
-	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
+	if (!can_assume(LATEST) && fdt_version(fdt) < FDT_LAST_COMPATIBLE_VERSION=
) {
 		/*
 		 * For old FDT versions, match the naming conventions of V16:
 		 * give only the leaf name (after all /). The actual tree
@@ -382,7 +383,7 @@ const struct fdt_property *fdt_get_property_by_offset(c=
onst void *fdt,
 	/* Prior to version 16, properties may need realignment
 	 * and this API does not work. fdt_getprop_*() will, however. */
=20
-	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
+	if (!can_assume(LATEST) && fdt_version(fdt) < FDT_LAST_COMPATIBLE_VERSION=
) {
 		if (lenp)
 			*lenp =3D -FDT_ERR_BADVERSION;
 		return NULL;
@@ -429,7 +430,7 @@ const struct fdt_property *fdt_get_property_namelen(con=
st void *fdt,
 {
 	/* Prior to version 16, properties may need realignment
 	 * and this API does not work. fdt_getprop_*() will, however. */
-	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
+	if (!can_assume(LATEST) && fdt_version(fdt) < FDT_LAST_COMPATIBLE_VERSION=
) {
 		if (lenp)
 			*lenp =3D -FDT_ERR_BADVERSION;
 		return NULL;
@@ -460,7 +461,7 @@ const void *fdt_getprop_namelen(const void *fdt, int no=
deoffset,
 		return NULL;
=20
 	/* Handle realignment */
-	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
+	if (!can_assume(LATEST) && fdt_version(fdt) < FDT_LAST_COMPATIBLE_VERSION=
 &&
 	    (poffset + sizeof(*prop)) % 8 && fdt32_ld_(&prop->len) >=3D 8)
 		return prop->data + 4;
 	return prop->data;
@@ -493,7 +494,7 @@ const void *fdt_getprop_by_offset(const void *fdt, int =
offset,
 	}
=20
 	/* Handle realignment */
-	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
+	if (!can_assume(LATEST) && fdt_version(fdt) < FDT_LAST_COMPATIBLE_VERSION=
 &&
 	    (offset + sizeof(*prop)) % 8 && fdt32_ld_(&prop->len) >=3D 8)
 		return prop->data + 4;
 	return prop->data;
diff --git a/xen/common/libfdt/fdt_rw.c b/xen/common/libfdt/fdt_rw.c
index 3621d3651d..9e87eabc5d 100644
--- a/xen/common/libfdt/fdt_rw.c
+++ b/xen/common/libfdt/fdt_rw.c
@@ -28,13 +28,13 @@ static int fdt_rw_probe_(void *fdt)
 		return 0;
 	FDT_RO_PROBE(fdt);
=20
-	if (!can_assume(LATEST) && fdt_version(fdt) < 17)
+	if (!can_assume(LATEST) && fdt_version(fdt) < FDT_LAST_SUPPORTED_VERSION)
 		return -FDT_ERR_BADVERSION;
 	if (fdt_blocks_misordered_(fdt, sizeof(struct fdt_reserve_entry),
 				   fdt_size_dt_struct(fdt)))
 		return -FDT_ERR_BADLAYOUT;
-	if (!can_assume(LATEST) && fdt_version(fdt) > 17)
-		fdt_set_version(fdt, 17);
+	if (!can_assume(LATEST) && fdt_version(fdt) > FDT_LAST_SUPPORTED_VERSION)
+		fdt_set_version(fdt, FDT_LAST_SUPPORTED_VERSION);
=20
 	return 0;
 }
@@ -430,9 +430,9 @@ int fdt_open_into(const void *fdt, void *buf, int bufsi=
ze)
 	mem_rsv_size =3D (fdt_num_mem_rsv(fdt)+1)
 		* sizeof(struct fdt_reserve_entry);
=20
-	if (can_assume(LATEST) || fdt_version(fdt) >=3D 17) {
+	if (can_assume(LATEST) || fdt_version(fdt) >=3D FDT_LAST_SUPPORTED_VERSIO=
N) {
 		struct_size =3D fdt_size_dt_struct(fdt);
-	} else if (fdt_version(fdt) =3D=3D 16) {
+	} else if (fdt_version(fdt) =3D=3D FDT_LAST_COMPATIBLE_VERSION) {
 		struct_size =3D 0;
 		while (fdt_next_tag(fdt, struct_size, &struct_size) !=3D FDT_END)
 			;
@@ -448,7 +448,7 @@ int fdt_open_into(const void *fdt, void *buf, int bufsi=
ze)
 		err =3D fdt_move(fdt, buf, bufsize);
 		if (err)
 			return err;
-		fdt_set_version(buf, 17);
+		fdt_set_version(buf, FDT_LAST_SUPPORTED_VERSION);
 		fdt_set_size_dt_struct(buf, struct_size);
 		fdt_set_totalsize(buf, bufsize);
 		return 0;
@@ -477,8 +477,8 @@ int fdt_open_into(const void *fdt, void *buf, int bufsi=
ze)
=20
 	fdt_set_magic(buf, FDT_MAGIC);
 	fdt_set_totalsize(buf, bufsize);
-	fdt_set_version(buf, 17);
-	fdt_set_last_comp_version(buf, 16);
+	fdt_set_version(buf, FDT_LAST_SUPPORTED_VERSION);
+	fdt_set_last_comp_version(buf, FDT_LAST_COMPATIBLE_VERSION);
 	fdt_set_boot_cpuid_phys(buf, fdt_boot_cpuid_phys(fdt));
=20
 	return 0;
--=20
2.43.0

