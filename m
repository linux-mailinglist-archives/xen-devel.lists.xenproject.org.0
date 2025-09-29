Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EB9BAA40C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:08:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133102.1471273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IHz-0005Me-Ja; Mon, 29 Sep 2025 18:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133102.1471273; Mon, 29 Sep 2025 18:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IHz-0005Jy-G9; Mon, 29 Sep 2025 18:07:55 +0000
Received: by outflank-mailman (input) for mailman id 1133102;
 Mon, 29 Sep 2025 18:07:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o4HP=4I=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1v3IHx-0005Jq-MK
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:07:53 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 370e2d1f-9d5f-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 20:07:52 +0200 (CEST)
Received: from AM9PR03MB7025.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::20)
 by AS4PR03MB8178.eurprd03.prod.outlook.com (2603:10a6:20b:4e1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 18:07:47 +0000
Received: from AM9PR03MB7025.eurprd03.prod.outlook.com
 ([fe80::bdd:3097:e48c:6c4b]) by AM9PR03MB7025.eurprd03.prod.outlook.com
 ([fe80::bdd:3097:e48c:6c4b%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 18:07:47 +0000
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
X-Inumbo-ID: 370e2d1f-9d5f-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdQdBKITWl2CIakQ7427m3dDltjk4Hi0flKXkpc1ZdVHn75ugaamKblB3aa1hlbJePP+a9nICgVAEyBQynBbKb/NTlhI4cEP29F7gzwzmhbdKSQk2PQJeRGrtIKPRL5rbC0gwy9AV4k8Jh20R4YtU9DkYH8b+90HK0BuO3ZCkYgrJZcSjyPXUk5K+NypHRwdC/bacmnaLJUxtkM4m7ZmQiRUz/2BHn0B8Ak5HaqjzEI/eOUqDrbGwuuBZkOY+/XpL6OsyzMRzmvkPXytVkKWUfBxmRAUe8VlS1obf/z0tUul7+MTYHUwkrQZTzgm9Yi0TzxMZDESC2JSzW9xfVsXhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmz8ihFsTa28eFIIcZV7gRXPLn+VRuXAh5/gDPWy9GU=;
 b=Cev/IWnJtT719yQHI9XIhXEzrTR5UyfXELP/dXddmCXMmD8otyk4wa2I3WzOdmR4oPKSEvSH14O1g5CxvsJpNCzWnYHxwcSoxm8ng49zSG2hmB4ACjjgKubgThzke3W4Ty+J9A8cXknLOC5y6QvAWuMTxXTeSYkMlHE/u9BLcG1sD4CyfQj7FK2xk7DV5Rk2eKRpNg6KRLDcrf4TM2JrRMmK471lf+EzNtscGbhScV/CuZyQ/Vy4l6R8LyZXO3bTBrOX2nT1YfLC3jkD7v5hxpmXMhBE/Y3+aywbTDnC5yDRN9TqHOKXGNXRcvtmVIUi3gWY8+jJ1AWOXeT/s2F05A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmz8ihFsTa28eFIIcZV7gRXPLn+VRuXAh5/gDPWy9GU=;
 b=PA8j063y4ZULV5Vz/d3p9xihuC94g6fia9PsVDaNoT+A4VpV639Yl0gRS8ddGy4/kexkFD+Wp6104qPi/R26Zf6XwBO6dlC8Qq79yK3Mv6iiJmJ3UkTXBbL2GlzzqNV99HXiiiV/ddq7s0cnjxZxxEgP93YBIeV3N+7Hhg1KpJDWUQ71RK17jwlz+a17QRO2rwC/mfkDyOuAFScUFOAq5zHO0Q3RTrKEeokbJl/f9RtPxRt3pf/+sGCU55LOWmMydqUjvm5+7QEXDJ6Ce9u6sKC3t+04znVSlAHOiNCJ1TY9FthE52xqvWdHs6fvNzVxZGzm4OXY1Lk4koIG1IqbdA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder <ayankuma@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [ImageBuilder] uboot-script-gen: Add ability to configure static
 event channels
Thread-Topic: [ImageBuilder] uboot-script-gen: Add ability to configure static
 event channels
Thread-Index: AQHcMWv1PEvr31auREGXSWhX8dEo6w==
Date: Mon, 29 Sep 2025 18:07:47 +0000
Message-ID: <20250929180746.1881872-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7025:EE_|AS4PR03MB8178:EE_
x-ms-office365-filtering-correlation-id: 35a900cc-a209-48ee-dc19-08ddff831873
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gXcB4qqh8Wi9H4+EhryZH9F9+WiZb76qhzjElZxl59aS5fgJWkXxmcfH8n?=
 =?iso-8859-1?Q?Idy2nSCpfUqZm7VzrQjiKGmltU9UzqGvwMfgqXFS3Y+mot7EzhK353S8em?=
 =?iso-8859-1?Q?rjcbUc6fzhK6d2mz8/PbbARjz9BPJwR3/EWOP99tAjaenQajwQDzHil/Oe?=
 =?iso-8859-1?Q?vL1fAN1qj55SOHA/B9lURxaWZnbIgl91dc7BW0pd9J2jwdVaQPKsqv04Tu?=
 =?iso-8859-1?Q?6sLm47mR75ESNMWWAwi07dKDNCc088U4qZSUSXtFJBnF+z3lxxTR9H2FmN?=
 =?iso-8859-1?Q?ssmFjNDfIgjWxOLAGatzn1WaqtwulYRjeMWncb5uYhC9jSq9cB0c8sGF6v?=
 =?iso-8859-1?Q?pwnn1FD8Zr1KW9IFYtKk30wcCos33XpjcSahSwYSof6Bm71rqwYfmh36PS?=
 =?iso-8859-1?Q?SC6ePdSFL0ZJayRFp1DeqtfKSl+mv56zBgo1nWQdiHjPjVHBfj1q/xF/Vf?=
 =?iso-8859-1?Q?1ZRMJJe8UZAHlrd5mMYwE5Lu/k5mzrvSQlGFNJBYtodwzNv1sJ7ZNR95VA?=
 =?iso-8859-1?Q?X5hOU3ejJ+B1EhDs6UqAavdweZXxxLBH1r+TeqTbmIWGu4rceaZyvq3k0a?=
 =?iso-8859-1?Q?aU9r1yJeP42t6Lbio9aaD976yqD39Tw1i/wHcKVwnr5GVz/A6wrBoOjqYH?=
 =?iso-8859-1?Q?I9vqE0SCzfYu2DYXik+6A0MjIXBoqninNZgdohp59WH7NI3oXTozSWqU64?=
 =?iso-8859-1?Q?dkao8si5zXIA4eNsX72APRSCfTGJHtLQCD9hnr5cFz/SjVsztwAcKuqlxV?=
 =?iso-8859-1?Q?gj+Ae3B+MYkDJnCj/8EWId/7M3d/LZN/u76CEc6433BIerihVW7oODyV5M?=
 =?iso-8859-1?Q?jVBaGxoQb/3s0i08LyxMADCOP+JQ2E9TntH0qPJKmVXcCXF5Txf84vKnA3?=
 =?iso-8859-1?Q?ILEAvthNR/ICnbre10hu2fbNMfw06mcWdiT4P0QG1Ge4hBthB3GnNosc/l?=
 =?iso-8859-1?Q?qJsPfnnkCKgQa1eHh4wRw4tazhFizyNlCe33NIRZfN0KXRk5+ALwoRDzWB?=
 =?iso-8859-1?Q?OOeRrUnSWEd0XdJsqcXSXNdSS7NNHTEMmyw2rLrY1cKxtzPInftmyrcPw8?=
 =?iso-8859-1?Q?9KYU8y3iFkrNkdi67o5Y+E4DFzDftPokjt2jB20kc/iYNqIP2uppvH9n9X?=
 =?iso-8859-1?Q?dEYGztHsPnNPosXCeMSBA+bQXVfMQGrdOt+fMyMsdu6lu8AMDpmj67l+Sx?=
 =?iso-8859-1?Q?+sIQsVulORpI80y+Z+yxTMKvWXcdX4/VXtbd7fQiKbJKFh0aJQnOfgK682?=
 =?iso-8859-1?Q?sgoiQve3tHWGCIUD8a/LL5Z1ue1zIZRKeE5+AqK+rEV+a9peUzuVAOT7V6?=
 =?iso-8859-1?Q?eBxUUbj7lMervA5Z660vXJlJN5npsbTCJnctTpZWrEBdXgv70kBGmGYEiU?=
 =?iso-8859-1?Q?/oJz7W5uhEi9OmE/15pR3soHBIu3z1j4pGP+VIYpgfb3pxW1x3awhGJf/U?=
 =?iso-8859-1?Q?smDP7Rb3fUUX44FdA3ifc8PoAn11PldMr0kP2OcCPlVFzvr7DNc+NQ2/F7?=
 =?iso-8859-1?Q?XO8VOF3Nzd5zg1swJkkwtcIk+6z9ueom8VRrfAbU3G0VJZBvB/TSOFxdqO?=
 =?iso-8859-1?Q?W7KTRSkpvouWBIGMybBWZ/rL7UuU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7025.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?v+EeOO7/Y5ur1PpyQUcH8thdrE7MIKzVQUE2iHWgiXj7YYwG8S8W4bi3L6?=
 =?iso-8859-1?Q?ZWr6JN+2lkF8xy4OslN00bW80Hn0p8eqTiRcgd7jYUdmQGT+MthXi5mLVT?=
 =?iso-8859-1?Q?pYHgsrfccgqlhgbEJsWNkIn7N3hPdGKCCQau00hEEKPBQC3qlDqfw9HLxG?=
 =?iso-8859-1?Q?3ycrnAJKDEFRO6/KBeAn2AfELIwkyPPRsP1XURwLX5cd9xXgZu4ybgsBL8?=
 =?iso-8859-1?Q?rBACJK0U131JqD9CIeXg17bcNN8JB+Z7A0ZiA6JaKHC7DJOxD4Lgl70sm5?=
 =?iso-8859-1?Q?86UMhjrJQjoox0U759o+U4pI9sYUBcgyMDCfFMnnk8KRyqo5Ls3wmupUM/?=
 =?iso-8859-1?Q?k/wDHrVeIKiZHaeBwNfECy+LQq7GagqFFQi5sCXmlt5VviKB6+2k3vO1i5?=
 =?iso-8859-1?Q?QHhQQ96Wmshq94RaMiKLvX/SDs1ufmg0fM46YI2MJ3Zo9eu9tKIQ+3TwgL?=
 =?iso-8859-1?Q?wRR1eRCBWPcL6UUpLpjk2KkI96mRjNznoh69KUyaJ7ldtP34snECbOLuuG?=
 =?iso-8859-1?Q?YjW2VH3dygvb13+/xyU4ZjOV6w3KbGNXSLlVZvuH0mj4HzyJsNAOZn7MZw?=
 =?iso-8859-1?Q?b+3X2KJv++soink06tZYSRsrVrWPzroNdPqpaeLfSGopx/JEJOegVte/JX?=
 =?iso-8859-1?Q?xoiEGxyUzKoVMKNmqWk1cjJqdhi5gbHV2RwYXUMJMOOeJHYg5F6oALaal0?=
 =?iso-8859-1?Q?rWmHKMChdzkC1yx462rr74WG903KxNYBdFZhJN+Jrt32WiOzKe9LxmwY06?=
 =?iso-8859-1?Q?Vqo1TBCkENHEEIvhzxEygC0YSRViweNPvvAAMhA/+MrQsA6UD9k0Ez7jZw?=
 =?iso-8859-1?Q?2cgK4lTMh0ieePuXjxcmhHSOZ7+/9N7me8cBY2tk93qwtYKRQXtLzF1gJm?=
 =?iso-8859-1?Q?kvyCYgUTNT8vdIdOqmS5bIZXgoWHUAnlnGJAJ4vUMSCItZZs79KcwgGlrh?=
 =?iso-8859-1?Q?l4mvSDDWB6k3KwyEnNcJza2qp2mbb2Cgr/g6aqeWaBzUEhtwvIs43LMwvs?=
 =?iso-8859-1?Q?L6qUFh628sV+tUuHqIXiwKo/rusS7ZFcmMh+4YMj22VuljESCOKIPTQt3c?=
 =?iso-8859-1?Q?SrxChbZAIkCGE1Itg1G9ezRHtu3mXtI51ZWDQoVxWAQwpVrdQLKHtfmtiX?=
 =?iso-8859-1?Q?8peKv62eoBGomd30JJlGP4rCuqB1hGKgWOkksedVoGVwMMxJYkREOw+aKP?=
 =?iso-8859-1?Q?mukqaraRiEV2vZkrFlSUKCtYFeFp9JCUKUpuZsgPlKA1sPeGzkf6ihjtFS?=
 =?iso-8859-1?Q?c6mWxGWnV6zGqIZOyN8UXLQZpB54HpmWFsQEJOXIESMqET4s723OEHiGND?=
 =?iso-8859-1?Q?xyErJe+RI+Nllz48pomQecJRC/IP+L3l1vDER+K8hEBCRzszkG9aDRfkOV?=
 =?iso-8859-1?Q?qqXsboxCmh949eptNp/sDJp6wsHARQpb3Z/uWFqCL/3G1p9gcy/PsjYgRx?=
 =?iso-8859-1?Q?LtzDla1P5sBs1HrL5NoFpJpqDj3ub41AFpNt4WNqwUkuWY3I5YVXIeVPw6?=
 =?iso-8859-1?Q?iRYEvVXe813c9LuwKqbdq1R/QCw+UG0ZRtrKwBNn5UPzwEM9+2SeV082UN?=
 =?iso-8859-1?Q?ajxPbuIEn+p8HU+Spl4clNpQ50sbbu3ptkl802ADJCZ2q0wL6nCfQwX6ZG?=
 =?iso-8859-1?Q?I+g2iFhT+OvJSDWqeyhnQx/pXy9bL+58+YeitKRGZmJEczY0IbWtj1jRHo?=
 =?iso-8859-1?Q?fsWUlXoM4nvw6Do+6f0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7025.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a900cc-a209-48ee-dc19-08ddff831873
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 18:07:47.1990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +FFm9pUSSR/p0+1bUHPWvXARdkuGTtR+Bvh69ud3TgXNByUl5UfrA4FDe3usRJX0xr06IVZQ+MbgUNNmKbAJcQXBQ35OMhaHYUE8SeBWkkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8178

Add DOMU_STATIC_EVTCHNS[number]=3D"local_id local_port remote_id; ..."
configuration file string option specifying the static event channel
definitions for domain.

The build script uses simple IDs to automatically and safely
generate the required unique phandle numbers for the device tree.
The user only needs to define simple numeric IDs and does not need
to manage complex phandle values.

For the following example:
DOMU_STATIC_EVTCHNS[0]=3D"1 10 2; 3 12 4"
DOMU_STATIC_EVTCHNS[1]=3D"2 11 1; 4 13 3"

it generates:
fdt mknod /chosen/domU0 evtchn@1
fdt set /chosen/domU0/evtchn@1 phandle <0xfffffffe>
fdt set /chosen/domU0/evtchn@1 compatible "xen,evtchn-v1"
fdt set /chosen/domU0/evtchn@1 xen,evtchn <10 0xfffffffd>
fdt mknod /chosen/domU0 evtchn@3
fdt set /chosen/domU0/evtchn@3 phandle <0xfffffffc>
fdt set /chosen/domU0/evtchn@3 compatible "xen,evtchn-v1"
fdt set /chosen/domU0/evtchn@3 xen,evtchn <12 0xfffffffb>
...
fdt mknod /chosen/domU1 evtchn@2
fdt set /chosen/domU1/evtchn@2 phandle <0xfffffffd>
fdt set /chosen/domU1/evtchn@2 compatible "xen,evtchn-v1"
fdt set /chosen/domU1/evtchn@2 xen,evtchn <11 0xfffffffe>
fdt mknod /chosen/domU1 evtchn@4
fdt set /chosen/domU1/evtchn@4 phandle <0xfffffffb>
fdt set /chosen/domU1/evtchn@4 compatible "xen,evtchn-v1"
fdt set /chosen/domU1/evtchn@4 xen,evtchn <13 0xfffffffc>

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 README.md                | 21 ++++++++++
 scripts/uboot-script-gen |  7 ++++
 scripts/xen_dt_domu      | 89 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 117 insertions(+)

diff --git a/README.md b/README.md
index 7b68cf5..52ed1f7 100644
--- a/README.md
+++ b/README.md
@@ -218,6 +218,27 @@ Where:
       DOMU_VCPU_HARD_AFFINITY[number,1]=3D"3"
 ```
=20
+- DOMU_STATIC_EVTCHNS[number]=3D"local_id local_port remote_id; ..."
+  if specified, this parameter allows the configuration of static event ch=
annels
+  for inter-domain communication. Each entry in DOMU_STATIC_EVTCHNS[number=
]
+  specifies one or more event channels for a particular domain.
+  The configuration format for each event channel definition is a set of
+  three values:
+    - local_id: A simple, unique integer that identifies the local endpoin=
t of
+      the event channel. This ID must be unique across all domains.
+    - local_port: The numeric port number for the local endpoint.
+    - remote_id: The ID of the corresponding remote endpoint to which this
+      the local port connects.
+
+  Multiple event channel definitions for a single domain can be provided b=
y
+  separating them with a semicolon (;).
+
+  Below is an example that creates two pairs of bidirectional channels bet=
ween
+  two domains:
+  NUM_DOMUS=3D2
+  DOMU_STATIC_EVTCHNS[0]=3D"1 10 2; 3 12 4"
+  DOMU_STATIC_EVTCHNS[1]=3D"2 11 1; 4 13 3"
+
 - DOMU_COLORS[number] specifies the colors (cache coloring) to be used
   for the domain and is in the format startcolor-endcolor
=20
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 4f92610..003a622 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -428,6 +428,8 @@ function xen_device_tree_editing()
         fi
     fi
=20
+    xen_dt_build_evtchns_map
+
     i=3D0
     while test $i -lt $NUM_DOMUS
     do
@@ -512,6 +514,11 @@ function xen_device_tree_editing()
=20
         xen_dt_domu_add_vcpu_nodes "/chosen/domU$i" $i ${DOMU_VCPUS[$i]}
=20
+        if test "${DOMU_STATIC_EVTCHNS[$i]}"
+        then
+            xen_dt_domu_add_evtchns "/chosen/domU$i" "${DOMU_STATIC_EVTCHN=
S[$i]}"
+        fi
+
         add_device_tree_kernel "/chosen/domU$i" "domU${i}_kernel" ${domU_k=
ernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
         if test "${domU_ramdisk_addr[$i]}"
         then
diff --git a/scripts/xen_dt_domu b/scripts/xen_dt_domu
index 8134896..97c5325 100644
--- a/scripts/xen_dt_domu
+++ b/scripts/xen_dt_domu
@@ -37,3 +37,92 @@ function xen_dt_domu_add_vcpu_nodes()
         fi
     done
 }
+
+declare -A EVTCHN_ID_TO_PHANDLE_MAP
+
+function xen_dt_build_evtchns_map()
+{
+    local i
+    local evtchn_str # The full event channel definition string
+    local def
+    local local_id remote_id id
+    local new_phandle
+
+    for (( i=3D0; i<$NUM_DOMUS; i++ ))
+    do
+        evtchn_str=3D${DOMU_STATIC_EVTCHNS[$i]}
+        if test -z "$evtchn_str"
+        then
+            continue
+        fi
+
+        IFS=3D';' read -ra evtchn_defs <<< "$evtchn_str"
+
+        # Loop over each definition and process both local and remote IDs
+        for def in "${evtchn_defs[@]}"
+        do
+            read -r local_id _ remote_id <<< "$def"
+            if test -z "$local_id" || test -z "$remote_id"
+            then
+                echo "Malformed evtchn definition: '$def'"
+                cleanup_and_return_err
+            fi
+
+            if [[ "$local_id" =3D=3D "$remote_id" ]]
+            then
+                echo "Invalid evtchn definition: '$def'"
+                cleanup_and_return_err
+            fi
+
+            for id in $local_id $remote_id
+            do
+                # If this ID is not already in our map, assign it a new ph=
andle
+                if [[ ! -v EVTCHN_ID_TO_PHANDLE_MAP[$id] ]]
+                then
+                    get_next_phandle new_phandle
+                    EVTCHN_ID_TO_PHANDLE_MAP[$id]=3D$new_phandle
+                    echo "evtchn ID '$id' is assigned phandle '$new_phandl=
e'"
+                fi
+            done
+        done
+    done
+}
+
+function xen_dt_domu_add_evtchns()
+{
+    # $1 - dt path
+    local path=3D$1
+    # $2 - The full event channel definition string
+    local evtchn_str=3D$2
+
+    local def
+    local local_id local_port remote_id
+    local local_phandle remote_phandle
+
+    IFS=3D';' read -ra evtchn_defs <<< "$evtchn_str"
+
+    # Loop over each definition and create a node for it
+    for def in "${evtchn_defs[@]}"
+    do
+        read -r local_id local_port remote_id <<< "$def"
+        if test -z "$local_id" || test -z "$local_port" || test -z "$remot=
e_id"
+        then
+            echo "Malformed evtchn definition: '$def'"
+            cleanup_and_return_err
+        fi
+
+        # Look up the phandles from our globally-populated map
+        local_phandle=3D${EVTCHN_ID_TO_PHANDLE_MAP[$local_id]}
+        remote_phandle=3D${EVTCHN_ID_TO_PHANDLE_MAP[$remote_id]}
+        if test -z "$local_phandle" || test -z "$remote_phandle"
+        then
+            echo "Could not find phandle for evtchn ID '$local_id' or '$re=
mote_id'"
+            cleanup_and_return_err
+        fi
+
+        dt_mknode "${path}" "evtchn@$local_id"
+        dt_set "${path}/evtchn@$local_id" "phandle" "hex" "$local_phandle"
+        dt_set "${path}/evtchn@$local_id" "compatible" "str" "xen,evtchn-v=
1"
+        dt_set "${path}/evtchn@$local_id" "xen,evtchn" "hex" "$local_port =
$remote_phandle"
+    done
+}
--=20
2.34.1

