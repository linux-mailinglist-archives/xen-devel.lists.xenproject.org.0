Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941D8B8A938
	for <lists+xen-devel@lfdr.de>; Fri, 19 Sep 2025 18:32:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126948.1468185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uze1X-00077p-7F; Fri, 19 Sep 2025 16:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126948.1468185; Fri, 19 Sep 2025 16:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uze1X-00075U-3W; Fri, 19 Sep 2025 16:31:51 +0000
Received: by outflank-mailman (input) for mailman id 1126948;
 Fri, 19 Sep 2025 16:31:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qZGy=36=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uze1V-00075O-6R
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 16:31:49 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20703462-9576-11f0-9809-7dc792cee155;
 Fri, 19 Sep 2025 18:31:43 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB8865.eurprd03.prod.outlook.com (2603:10a6:20b:554::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 16:31:40 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 16:31:40 +0000
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
X-Inumbo-ID: 20703462-9576-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XC6bGJrSE74BjFlg3BT5H4r3Y9uD22HQTufKs0l0u/9ggG2M4ePw9cWl7BE0T+zSNu1pcyIlH+KluFVS8HF8GOz7JAqVxdbdDL005Li5W+xVt5s+Q6AMXbIYYVnUt//0TGB9KbV/vdz/ZjRPF6MN13zIflZnP7QApOMaK8QbExUu4xyig1pV1PSJcnAumZo7OPoYO3HHzx9x7Tpx8jPwaP4lNx5yrGQH+CqQu2gm6KaJqkFT9N8gsrdUNlwXOXdqQGjJ1T+OXHAoF0qEIyQbKA8W7H1YUFnZWpzakThRwZLAPpJdsIMSe80QB2LDlMPSb+MtshvqjSB1iw12TKNBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBngCzqWeLPwedEJWM3naBs/ymn3A3SkrGGYCFVM/L4=;
 b=A44b+L7NsVhd8EA7ADJth7EI/xUdJfv1BI7Obte0m7AOwv95J1SU16Hda+iu+ZBUts+jRmnptNTuzljabzo3t3BE5Vk7NF5E/iWJngIlhIXig+p7J7MGhJ6lQ3bPexsjwMZj+YYuZmlFI6aellIN8Xhl6GrkTRWfNdDl5f+S1OFw1jnDjRCDj7aleSMusPPTIAcmaIe6mTeEPSiZZ2r48Mr9V7IvIKr44eFeMpeWdNlVIvJH42p1103GSdwz/Pxwon+U+W7c59NIGmziXXFzbIvVAPl0gOFhGAR1IQznbkB4FSuXURtJT9JAp/GCjN82c6zp5p+gQNsJ5LMwghxe2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBngCzqWeLPwedEJWM3naBs/ymn3A3SkrGGYCFVM/L4=;
 b=nDTtFlJ8KLlAWD9jMvziruVbdrhHYM7VAQdP6U4qjPj8PQGrxBB5ECuFHuOFg/LVodULFpTigYom0fd6Z+CZrVWsfrpKUu/xss72mMPnkepx3bmZR1gOFRA05JywHv8Gc308LGxzwLq0NGwyVopfyzy2fG7cf0V+bwROaVAcRQqmUjpkcw3X3y7h4UeVnKxYzDi6sSZZFS44m7x/dz1D7xSh6cVvlqBstnQoZbDzFwrDAkTFOy4ccIGKUNUcN3npEblmCFHUTi7tBPkG1j5jrxP11mO2jKiGwy+0zdrPDyUSRLXx+CZYl59BYXtCPMhW7J3D0gH7/JklHRVx4zGLoA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v4] x86: make Viridian support optional
Thread-Topic: [PATCH v4] x86: make Viridian support optional
Thread-Index: AQHcKYLgAWeerUFTx0CrYmKq2dRJwA==
Date: Fri, 19 Sep 2025 16:31:40 +0000
Message-ID: <20250919163139.2821531-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS2PR03MB8865:EE_
x-ms-office365-filtering-correlation-id: 36678050-eabb-470a-eb3d-08ddf79a0335
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/+iceIKj8rm0b+DojetilM1jhTY0gpsrsAMBGVVhh5XbZv893ils+4zFSL?=
 =?iso-8859-1?Q?XPt3zdJNaJMgtMYqygyF1ZXcLJ52kq1o/5Rl8ofCGrS9yYHRwVWdBog4m5?=
 =?iso-8859-1?Q?Au0+9VmuutPzIa3Xpk+cwNx4nt0qNFSqD83WWEwUz7W/t7Ccqhv4R7DdKB?=
 =?iso-8859-1?Q?xgHsfpdpIU1MG0uAmQ9ueTZMOzzKSCQ2XTYMBj2DrIPGerOwUjJjll8v7A?=
 =?iso-8859-1?Q?W3+VBSX+M7RIr668ZLw5QCamDpuN13FSG0HNhouFsF/kuU+POXFhyw1+O3?=
 =?iso-8859-1?Q?6HmH2baSghjk1iokaKKfuxiz+QYhbV4mmCpmut8VtogW37T1+JDpm0Wn9v?=
 =?iso-8859-1?Q?G5hD97vx4W/aOrXVEVh5ziIn5soHcUTL2xM+mlCjSnHuXtzf7woupZUoy1?=
 =?iso-8859-1?Q?aT7Zib//kFMU0a3vjNesNAMzk7Xd1VAVfVqEcuwdVgAcg7sCe/EEWgS0If?=
 =?iso-8859-1?Q?AYAoMyUdgOD5QdjZ4hVD92zHlnTIZ8e+HXgxM6NSCt0i4xFjZdCbEI+5jI?=
 =?iso-8859-1?Q?CJnhYEAvHi2cEGlsq0kQCPs4zyWlhSo9p/zZrkKZZIsMn6Dae26rToegpF?=
 =?iso-8859-1?Q?Fz8UPKKZgFjDvpIg1iRSPDan+ipg/ggcq7pLPWFi8Ge0xe7y0pTh9C+K8/?=
 =?iso-8859-1?Q?GwF9M26WZWc5WooS01UxLWNmXBQRjdxDLd2kH0JeO1s10QNYCqDsfQV4uc?=
 =?iso-8859-1?Q?xarEe9d5NbN6ffLxOY3W+1hjFSCJpFApE0m7gVsEVFk6f5IPmqh8ouYlZI?=
 =?iso-8859-1?Q?z8YveFJTuDStHuaylU6VXZQ70FpiLvnHKQT6CeAk72wiiMXGWXJoyl95kc?=
 =?iso-8859-1?Q?UD/ptm0eJA3GcLVYAHycdDzJQ9Yc098rVjF+9R4UTg8agmalNbOKA2An99?=
 =?iso-8859-1?Q?HQgBrWgoHaw8HINaJlUE8oCS+GiLoA5H+Jd6QCBvwyEDUA/ubm2zC9NnPB?=
 =?iso-8859-1?Q?YwTsHiTBGjxfJdDCM1EsbEWbJqAlvjNf4vlHDKAurITFDp4zB+JYewrKxp?=
 =?iso-8859-1?Q?otJ5v5/33pywYxxhTH/HijDbEZDbRScgb+u/R8pLWRA5POaziSLrxfgy1A?=
 =?iso-8859-1?Q?IqQjIx/vvidbiZoZ+7D3c+N3ewRKSmGk2Mc0VyYZYxLLkMx8zqF2GhcxIr?=
 =?iso-8859-1?Q?0ykyj+RAlxu9rmInUFZxiShO9kjOpEtEgadRZGQDJky5CMi8kuhYn12VEY?=
 =?iso-8859-1?Q?Cp01cM+1gzlbSIf1yg7evWtRhqG0nglYaCQpxiwEqs3wLw/elwhL+GdUPb?=
 =?iso-8859-1?Q?JDnz8JqP7HPCyoVTyym6MgTIrHIYpVdaL25PmCn3ume5Cem7JZlcw0yl71?=
 =?iso-8859-1?Q?1oF/sjjmwYXyDl3OZV1Gu/ri9aAtJqEl1q+qUa6dXnoFU7sP4lLkjAzmVH?=
 =?iso-8859-1?Q?lWHNH+f1F7qt20irP7o/f2u0K7LVI9iviyhwZn9IIfOpZX+QajBvWu+P7E?=
 =?iso-8859-1?Q?fDLAFuWLoPTQgMKtDGSdYQqyM/LbImNts/e5xRx97MB4pYvo4onUFkVDlu?=
 =?iso-8859-1?Q?iYK4/O7XlJ1RxM1RlAbUnaYadJQMgXa42+L2drVAzofA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mjP/Xx5xjQRMr6UfEn5x5leO1tMWxOhOBYDJXFzl+RAfK5lOHqlMbdWD0Y?=
 =?iso-8859-1?Q?ICszp4aqInUJYRCQH6bE/2CEY6EwSR/FzafNmG7xdj+Y2vXf1mPtDUoF/0?=
 =?iso-8859-1?Q?UslrXkL+0ecCoNcC/ZYyOoc6F/VFollotA9xRJ4PA6vr6ZChY5M4LAd11D?=
 =?iso-8859-1?Q?uU7ybCcCjI3aYgs8rmdcHUV7uncOkl93yzVjVwIeTOw5xs8Oc/iaAn5q84?=
 =?iso-8859-1?Q?033LchJ21JvJc3rlFSxnAl6Ai+2/+juTLYj/W0xICWy/4VOppKyOG1So1Q?=
 =?iso-8859-1?Q?oWAdzq5irXOC0FPK474H3Ol224Pr92WNx1OjIwvx7w0pMQc4JSUttJccAn?=
 =?iso-8859-1?Q?QHUcrUcVD0LfVcR4PViIfDCbcGcJqFYD/FnHCZFIN2rGsQldShij7LclnS?=
 =?iso-8859-1?Q?K2eEmvEtDRxievQNfyowQZM2pqTWoTBkr15l8S6AM4SH3XcO0rmCeokgd1?=
 =?iso-8859-1?Q?q0B3LEND/aMzvcxB6YQu/V6I9jx9tUlSpdJcups6OaobT2A3qdhk6UBslj?=
 =?iso-8859-1?Q?aBxTrOlW1rvSoCVes2pjNC4PUeG6yeZmVSHMUnDVQgDhqsj4DFpx7Ybfvy?=
 =?iso-8859-1?Q?hM3J2Kqnncv5hiSChrCLYNP2EwdxD5DONSkAfPFrpY5kOcZmmPXgVpHX0Z?=
 =?iso-8859-1?Q?gYShuuowj2sYpOYDX2gVNTKQ2yw9wcXKFBYRs/kgFI1V9BpdmS+PD/N+bd?=
 =?iso-8859-1?Q?ewigbVklK4zrhzjAY9YtLBPFS6wR8NXjn9Sba3TaHvrunhPtDJziIPmXAM?=
 =?iso-8859-1?Q?xgqTdxJl4ZJL2IxtpJvj0LyKjPC2xYRqmgMFF2hFV6/67s3rqoDTD/1tHm?=
 =?iso-8859-1?Q?PvQJGmrsRztuiw6Fqz5In+f+179gY0abEosxPnr4hU8cW6pCHDq9FgbQB6?=
 =?iso-8859-1?Q?AzukQpyO5eeZ/m13lYnbAjcxibYCQONVdJGbzBoadFDM7aC0R/Pr5vWPEq?=
 =?iso-8859-1?Q?9VAVNeiv7dkhQzmQmb2l0SwBwI8nY7CaSxLwr8y4Ctr6M5FGIBz2AbKsbR?=
 =?iso-8859-1?Q?gI2TqQWQ8BenuCRs1XHKvDVVbjv69+0S5G1aQ6/XwiqS+uzRSHKtS9DqML?=
 =?iso-8859-1?Q?aBT437yb29Dv25MjEkYufvqaWIwCx8qUorsYS4w/naZSzgyZcVt2GlHAq8?=
 =?iso-8859-1?Q?EOLb5PNdpbJi5XVCvHm2AwlgdHYdw58eL8qzUwhfSIVYwyTbUjGhKRbS/l?=
 =?iso-8859-1?Q?EKgORiWOaqcby75q9rwnMHW46y1DZONs4B2TSbBz1BG0Pm205r7pIZm0VL?=
 =?iso-8859-1?Q?gP5MMt7MBKxOqGXodL0eFS6aq/PjDJfqmwN82v7+9ns+cJfVVAkrv+vYBh?=
 =?iso-8859-1?Q?q4RJIq9pPbstJQ0Pm2v20Q1ZjLsmYVQpsrvZt0S3cRl1ujVIkBH3y55fYH?=
 =?iso-8859-1?Q?MMP0w8yGK/ZajfARZEKhHofX5xyrDynm8xJz9DZ0p/XSkrXcaCXt/Udgtq?=
 =?iso-8859-1?Q?nN3tErdffAdkzInx4wA/8oXMzuy/ckjin4tR1RPKwPVauO53AFc5Q5t7Bo?=
 =?iso-8859-1?Q?yhIJDUdP1fsgjZs5GusdXP9w6nC4CJx0EnCSB1DuxpxAn9eO4TJV1MegeV?=
 =?iso-8859-1?Q?+HQP2nl0Qe3eWnxrmII8/CZJZX3aAaGUa/Cov5f0q5XN51Kn3rEfNWsPi7?=
 =?iso-8859-1?Q?0dOCUqXV7CRPqiBGOIHiqsK0L4l2sxhlLoROyf/QcdmKJJoNQwbsyhHQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36678050-eabb-470a-eb3d-08ddf79a0335
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 16:31:40.7008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t7DdPCDvVhVSguGt+JhZ//eSCYVPBTVyyAdEURFR6KpjabPfYdSRG4Ff85KYXgNwDnbadAPtZUNj2iiR9JFy2BLp6xYxzxXyxZrOuuSBjAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8865

From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Add config option VIRIDIAN that covers viridian code within HVM.
Calls to viridian functions guarded by is_viridian_domain() and related mac=
ros.
Having this option may be beneficial by reducing code footprint for systems
that are not using Hyper-V.

[grygorii_strashko@epam.com: fixed NULL pointer deref in
viridian_save_domain_ctxt()]
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v4:
- s/HVM_VIRIDIAN/VIRIDIAN
- add "depends on AMD_SVM || INTEL_VMX"
- add guard !is_viridian_vcpu() checks in viridian_load_vcpu_ctxt/viridian_=
load_domain_ctxt

changes in v3:
- fixed NULL pointer deref in viridian_save_domain_ctxt() reported for v2,
  which caused v2 revert by commit 1fffcf10cd71 ("Revert "x86: make Viridia=
n
  support optional"")

v3: https://patchwork.kernel.org/project/xen-devel/patch/20250916134114.221=
4104-1-grygorii_strashko@epam.com/
v2: https://patchwork.kernel.org/project/xen-devel/patch/20250321092633.398=
2645-1-Sergiy_Kibrik@epam.com/

 xen/arch/x86/hvm/Kconfig              | 10 ++++++++++
 xen/arch/x86/hvm/Makefile             |  2 +-
 xen/arch/x86/hvm/hvm.c                | 27 ++++++++++++++++++---------
 xen/arch/x86/hvm/viridian/viridian.c  | 14 ++++++++++----
 xen/arch/x86/hvm/vlapic.c             | 11 +++++++----
 xen/arch/x86/include/asm/hvm/domain.h |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h    |  3 ++-
 xen/arch/x86/include/asm/hvm/vcpu.h   |  2 ++
 8 files changed, 53 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 5cb9f2904255..aed799fcb9c2 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -62,6 +62,17 @@ config ALTP2M
=20
 	  If unsure, stay with defaults.
=20
+config VIRIDIAN
+	bool "Hyper-V enlightenments for guests" if EXPERT
+	depends on AMD_SVM || INTEL_VMX
+	default y
+	help
+	  Support optimizations for Hyper-V guests such as faster hypercalls,
+	  efficient timer and interrupt handling, and enhanced paravirtualized
+	  I/O. This is to improve performance and compatibility of Windows VMs.
+
+	  If unsure, say Y.
+
 config MEM_PAGING
 	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
 	depends on VM_EVENT
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 6ec2c8f2db56..736eb3f966e9 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -1,6 +1,6 @@
 obj-$(CONFIG_AMD_SVM) +=3D svm/
 obj-$(CONFIG_INTEL_VMX) +=3D vmx/
-obj-y +=3D viridian/
+obj-$(CONFIG_VIRIDIAN) +=3D viridian/
=20
 obj-y +=3D asid.o
 obj-y +=3D dm.o
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 23bd7f078a1d..95a80369b9b8 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
     if ( hvm_tsc_scaling_supported )
         d->arch.hvm.tsc_scaling_ratio =3D hvm_default_tsc_scaling_ratio;
=20
-    rc =3D viridian_domain_init(d);
-    if ( rc )
-        goto fail2;
+    if ( is_viridian_domain(d) )
+    {
+        rc =3D viridian_domain_init(d);
+        if ( rc )
+            goto fail2;
+    }
=20
     rc =3D alternative_call(hvm_funcs.domain_initialise, d);
     if ( rc !=3D 0 )
@@ -739,7 +742,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
     if ( hvm_funcs.nhvm_domain_relinquish_resources )
         alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
=20
-    viridian_domain_deinit(d);
+    if ( is_viridian_domain(d) )
+        viridian_domain_deinit(d);
=20
     ioreq_server_destroy_all(d);
=20
@@ -1643,9 +1647,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
          && (rc =3D nestedhvm_vcpu_initialise(v)) < 0 ) /* teardown: neste=
dhvm_vcpu_destroy */
         goto fail5;
=20
-    rc =3D viridian_vcpu_init(v);
-    if ( rc )
-        goto fail6;
+    if ( is_viridian_domain(d) )
+    {
+        rc =3D viridian_vcpu_init(v);
+        if ( rc )
+            goto fail6;
+    }
=20
     rc =3D ioreq_server_add_vcpu_all(d, v);
     if ( rc !=3D 0 )
@@ -1675,13 +1682,15 @@ int hvm_vcpu_initialise(struct vcpu *v)
  fail2:
     hvm_vcpu_cacheattr_destroy(v);
  fail1:
-    viridian_vcpu_deinit(v);
+    if ( is_viridian_domain(d) )
+        viridian_vcpu_deinit(v);
     return rc;
 }
=20
 void hvm_vcpu_destroy(struct vcpu *v)
 {
-    viridian_vcpu_deinit(v);
+    if ( is_viridian_domain(v->domain) )
+        viridian_vcpu_deinit(v);
=20
     ioreq_server_remove_vcpu_all(v->domain, v);
=20
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridi=
an/viridian.c
index c0be24bd2210..5e49fc286d76 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1116,14 +1116,14 @@ static int cf_check viridian_save_domain_ctxt(
 {
     const struct domain *d =3D v->domain;
     const struct viridian_domain *vd =3D d->arch.hvm.viridian;
-    struct hvm_viridian_domain_context ctxt =3D {
-        .hypercall_gpa =3D vd->hypercall_gpa.raw,
-        .guest_os_id =3D vd->guest_os_id.raw,
-    };
+    struct hvm_viridian_domain_context ctxt =3D {};
=20
     if ( !is_viridian_domain(d) )
         return 0;
=20
+    ctxt.hypercall_gpa =3D vd->hypercall_gpa.raw;
+    ctxt.guest_os_id =3D vd->guest_os_id.raw,
+
     viridian_time_save_domain_ctxt(d, &ctxt);
     viridian_synic_save_domain_ctxt(d, &ctxt);
=20
@@ -1136,6 +1136,9 @@ static int cf_check viridian_load_domain_ctxt(
     struct viridian_domain *vd =3D d->arch.hvm.viridian;
     struct hvm_viridian_domain_context ctxt;
=20
+    if ( !is_viridian_domain(d) )
+        return 0;
+
     if ( hvm_load_entry_zeroextend(VIRIDIAN_DOMAIN, h, &ctxt) !=3D 0 )
         return -EINVAL;
=20
@@ -1172,6 +1175,9 @@ static int cf_check viridian_load_vcpu_ctxt(
     struct vcpu *v;
     struct hvm_viridian_vcpu_context ctxt;
=20
+    if ( !is_viridian_domain(d) )
+        return 0;
+
     if ( vcpuid >=3D d->max_vcpus || (v =3D d->vcpu[vcpuid]) =3D=3D NULL )
     {
         dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 993e972cd71e..79697487ba90 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -426,7 +426,8 @@ void vlapic_EOI_set(struct vlapic *vlapic)
      * priority vector and then recurse to handle the lower priority
      * vector.
      */
-    bool missed_eoi =3D viridian_apic_assist_completed(v);
+    bool missed_eoi =3D has_viridian_apic_assist(v->domain) &&
+                      viridian_apic_assist_completed(v);
     int vector;
=20
  again:
@@ -442,7 +443,7 @@ void vlapic_EOI_set(struct vlapic *vlapic)
      * NOTE: It is harmless to call viridian_apic_assist_clear() on a
      *       recursion, even though it is not necessary.
      */
-    if ( !missed_eoi )
+    if ( has_viridian_apic_assist(v->domain) && !missed_eoi )
         viridian_apic_assist_clear(v);
=20
     vlapic_clear_vector(vector, &vlapic->regs->data[APIC_ISR]);
@@ -1360,7 +1361,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
      * If so, we need to emulate the EOI here before comparing ISR
      * with IRR.
      */
-    if ( viridian_apic_assist_completed(v) )
+    if ( has_viridian_apic_assist(v->domain) &&
+         viridian_apic_assist_completed(v) )
         vlapic_EOI_set(vlapic);
=20
     isr =3D vlapic_find_highest_isr(vlapic);
@@ -1373,7 +1375,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
     if ( isr >=3D 0 &&
          (irr & 0xf0) <=3D (isr & 0xf0) )
     {
-        viridian_apic_assist_clear(v);
+        if ( has_viridian_apic_assist(v->domain) )
+            viridian_apic_assist_clear(v);
         return -1;
     }
=20
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/a=
sm/hvm/domain.h
index 333501d5f2ac..95d9336a28f0 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -111,7 +111,9 @@ struct hvm_domain {
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
=20
+#ifdef CONFIG_VIRIDIAN
     struct viridian_domain *viridian;
+#endif
=20
     /*
      * TSC value that VCPUs use to calculate their tsc_offset value.
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index f02183691ea6..7312cdd878e1 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -510,7 +510,8 @@ hvm_get_cpl(struct vcpu *v)
     (has_hvm_params(d) ? (d)->arch.hvm.params[HVM_PARAM_VIRIDIAN] : 0)
=20
 #define is_viridian_domain(d) \
-    (is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
+    (IS_ENABLED(CONFIG_VIRIDIAN) && \
+     is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
=20
 #define is_viridian_vcpu(v) \
     is_viridian_domain((v)->domain)
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm=
/hvm/vcpu.h
index 924af890c5b2..9ed9eaff3bc5 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -176,7 +176,9 @@ struct hvm_vcpu {
     /* Pending hw/sw interrupt (.vector =3D -1 means nothing pending). */
     struct x86_event     inject_event;
=20
+#ifdef CONFIG_VIRIDIAN
     struct viridian_vcpu *viridian;
+#endif
 };
=20
 #endif /* __ASM_X86_HVM_VCPU_H__ */
--=20
2.34.1

