Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BA7C70CF6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 20:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166358.1492948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnsl-0003av-Iq; Wed, 19 Nov 2025 19:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166358.1492948; Wed, 19 Nov 2025 19:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnsl-0003Y3-Ej; Wed, 19 Nov 2025 19:30:23 +0000
Received: by outflank-mailman (input) for mailman id 1166358;
 Wed, 19 Nov 2025 19:30:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GacY=53=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vLnsj-0002Z9-6y
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 19:30:21 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2efe187e-c57e-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 20:30:19 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB9PR03MB7690.eurprd03.prod.outlook.com (2603:10a6:10:2c6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 19:30:10 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:30:10 +0000
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
X-Inumbo-ID: 2efe187e-c57e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RaB2bSTix67HTsLfGfHAUWaXHzuzSuuX4ACsFgq3TL9s63UrXQ9ES+PSPfk6iX0umVLcjfYkQ89A9mkhTx8lQsQTytR2h+2fa+3rQ0R1pxui4kIYr1tdKlnmFW3NSteNvW74klYNlJQm5JcGCHXSIf0AKC+NCy0FHUDUNecT5PkqJOtrupw51sIW9ov4Y1m+EkJCTrc/Scz1KCa+Uj6QslxsCLaN3DB34h53S1B2f2nsRJS2jcIjLEqw8aD1OXB3d9e0x4FTz+S9d3ij2qs9gbuZpaI6d4+34ZXv2nKRdZMiEUyWOahXdwzm1d+IZUWoo3wxyXlGi2xIHk174w3WCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pgeAgmuBA5/KH5sFul8K61H69AUlJ3tMBDEqpzse9k=;
 b=hsrU32Mq3vrw8tlUWY6v2sz8lJfQuu0mFdbGstywnFQBQLdVHpXgr5qMrnybKHodaijmGAla5X3vJzckL97YZKJAt/2X8ygjIabiSSnrIwJKe27sm5ACLjpyHKfgBb8wY6BbWMmIjCtbGGMA88tJWa6OwcGlYM33S0CPmYJA8M7m4WABB4xQm3dI5hSFjQSNt6CrF7U3dJd2HnJ7JB39TICp3TuQh/ujR7h5sFRZwh8cGpV8Rrm53VAmS7X45lZRdDxqPHuaUE4/ZGxqCtWHGy/Ak1onnrtpGfTRv0suSb+/dGhcg1dZs61HNXHXFML9PDnJW7ZL/jFKsVHu7mVmPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pgeAgmuBA5/KH5sFul8K61H69AUlJ3tMBDEqpzse9k=;
 b=OBdl6jj9/ZWXoMbDyJpuSuh+YYlIC1Zkx5i4+wBEZSLjGksD/A8JystAPa+pber2dj42/yvgRXJNWj8BAlZkRTfufuK/3jKTkHB5oP4fk2BbuCY//bJPR2VW0FXz1Sl8JlVCtIgyAeSAnXsMMkcpEG9pNc+7VyyKAL0UfFZ3O3dXyC1HcwPxjwdTS6fXe0Ehko+AEhFbBEQtT3SW36uAbt3cNDk0N2naMwLlBDhDCk5YCnv1ukqrXSgXEH+i2LVh/3Zi+GvNca6dPH0ZsPk0lFXhEsSqPlMHMRZUzh68w/RdmDr7PJZJq4aAI7KaslCJwaxnILAtM5kmJcBod/fqrg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [XEN][PATCH v2 4/4] x86: pvh: allow to disable 32-bit interface
 support
Thread-Topic: [XEN][PATCH v2 4/4] x86: pvh: allow to disable 32-bit interface
 support
Thread-Index: AQHcWYrr1fGFNDkTXkKtxIuHdmqCJw==
Date: Wed, 19 Nov 2025 19:30:10 +0000
Message-ID: <20251119192916.1009549-5-grygorii_strashko@epam.com>
References: <20251119192916.1009549-1-grygorii_strashko@epam.com>
In-Reply-To: <20251119192916.1009549-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|DB9PR03MB7690:EE_
x-ms-office365-filtering-correlation-id: cf1bf8b9-79a9-460f-b80d-08de27a20e29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/m7Vu5f7cRx5/zi34OtZGNy/1t8dG75CvHfcYQITJlQtP5Cs6SuO8dmaiF?=
 =?iso-8859-1?Q?XIcpAX2mOGkdKtRetL/HqWC3D2eQck3IMk5MAFGxDutscx23dfBwpEOwWT?=
 =?iso-8859-1?Q?phP0FMdrbbejw7zEdHfqiP4puvKdGO5Rc4J06EnVn+XN8Ftsr0Q5plOlwD?=
 =?iso-8859-1?Q?9FqIQnNRVML8nFzAWnUMt++E20X4uti/kOmuKc9uUEAngnT5I7ue6rPQu7?=
 =?iso-8859-1?Q?PMeI1BZXawf6wQhRcnqTapR/esaynbq06Z0oR3wRbC7r4ZVb7HU5B5v+tc?=
 =?iso-8859-1?Q?GbsftW7lMTJG1notzZe36uYSiapAWFpTFhJKNO9kyrefir35YdoMfaTTu6?=
 =?iso-8859-1?Q?HLx3r1gBpBf2JzSY24w13JXxpSgIrxj2YtYNA1ADQsCtmsC9odpDe0dkml?=
 =?iso-8859-1?Q?+68DlzBweblYBKVbwHAa5xDf7cvQg7L16uxhxBVtCksPQ+rR2L0VqoYOru?=
 =?iso-8859-1?Q?/CnqbZBhWV3LSfWaSWHNUmoUzjlbH2y1FSuW+DK82HAI+4yNR8Yb0l3rRQ?=
 =?iso-8859-1?Q?aFqdulFWJKC+u6crmBh6CPCM9AaACdSjw4SBiUZ8qr4u/NcYZIYnlvEL5v?=
 =?iso-8859-1?Q?GYcV49zQmbx6VJddEcSl05DX5cS9L3dPMpbc14dfEbe+L8QZfIhIm8v2Fs?=
 =?iso-8859-1?Q?IV83uvVmUV0AzSMtHKhoGra9dFP+q90FwENbGA7LRk+tvjCLezCzY/YbQW?=
 =?iso-8859-1?Q?6TjuqRZdBO2/p3rS66H+UksUoPl3iMLiZ/3IFHTkhEEOLR/vwk5iKTzYtA?=
 =?iso-8859-1?Q?YdcKc8J/f29Q/Jp4fcns7CD2BDePyU2NUXAs/PGFabKhk7j9+Fs6Pq9JDk?=
 =?iso-8859-1?Q?GiyhENPWvx8mBtJmSZZaygx8ZOyZTAkTgb3uw1ICy0n+PGRAYhM7p4aMKj?=
 =?iso-8859-1?Q?ear69kqgAbsf8Jn4NjsyvHDisdmjPR/jKBDBk6Y9+RSoRYndJMs57M8CrI?=
 =?iso-8859-1?Q?7qsKQXcDFK2p5y7pWHh463J0xKXAGuLwz+waGsg5iSRy9hVzCEAMZhWglI?=
 =?iso-8859-1?Q?DGJOBLXns04F76DdG1IHBV6wCJRppoUQ07cW+xU64qhnzuqsyJIyVeqIJ+?=
 =?iso-8859-1?Q?km/fu/Vjdzt+tgeLBmPjN7WLOou2r++0CC2n9YrcZU2LevnkFNWSSVLnp8?=
 =?iso-8859-1?Q?DYRsK7lEocOa0lCOHhMAycTwSACPtEG72Sbu9Od9fsLm/dycB9HoM4gaRj?=
 =?iso-8859-1?Q?QNu2Cpm00qsuPc/fgMYimMG0pQMZRhnr/1YnUVt1dWdn3jcAdhI4oJC5Be?=
 =?iso-8859-1?Q?mDR+LylTnz1YPVDYf9iEVV3QuyCX9+Wm9PMqXkULS0AsZTJAjF3+5Da3j9?=
 =?iso-8859-1?Q?Vh9uuFTIMoeBjeRx7IxFQIB93MV2A/lZ7Md1woJ6RWWMN1B+PYN79NW2pU?=
 =?iso-8859-1?Q?nWpiGsSl2u1lwcUEL9ZPCLSaRiB1O1fol9nDOZUAs66Vhtzv8BhHaQdOtp?=
 =?iso-8859-1?Q?xpov1yDB9y6AjhrngkiPmB9d0VPaqih+bBxclVGuJfDXNB7LbdZJY0yP6l?=
 =?iso-8859-1?Q?egP5QCYyTvV8ZB/OTVh/gtziis6h+o++fCIzRnk8TPjrQ4wv+UkBHaCvzz?=
 =?iso-8859-1?Q?eC3SwQfRLv81C+X8n/umKBLs3xBO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QA4V2IK4AJKL7Kc4plrDuQLhykelSFEoUt8/JWsEHFQnaABYAtRL4RkfWq?=
 =?iso-8859-1?Q?7k8sy6X5IDCHBRJVnXbW4eBSBZnuhfdzFPgbXzNLEjgX3iETMTFdc1fSLh?=
 =?iso-8859-1?Q?jyIWhRI9IDu0Hk+ewHSThD5SFZuU94gjtEIEJP67mCatbUYwZNTL/uTaGk?=
 =?iso-8859-1?Q?0/Un2AFHbCA2njyZglPhBAM+mgCk/cQ5mNTSPUMxj5EAYpD50vUPQYp6vB?=
 =?iso-8859-1?Q?GktYpDhpM7Xx7OhV4uVf1M0dSsFfNjtVWKuwFzSTmCRjlw3jkEYobf0AWI?=
 =?iso-8859-1?Q?Ul1wTxiJnFlkWEKqa7Sected9NE3S9coHGhO127TGxDwd+UAeofdcdm13S?=
 =?iso-8859-1?Q?2H9lXNZSauXhCzrWjma542CK/ZjGwwM74jaiWepAIJ9JGUseXA5BU1ji4k?=
 =?iso-8859-1?Q?RPqzNctxuJyY1ziYZK7w4ExcB2GPt0fMiVKgztF5e5JW2tu/fQYEbBU/P/?=
 =?iso-8859-1?Q?0rfcKvq1Ga4He0EhyBDeFBzxSe+FGSdFA+qdD6An3+4aw3RYxzFixECdju?=
 =?iso-8859-1?Q?haEkHE2umPMLJ6EK8W7JaRPB9KaqDvsRNQ5fXyp8w5abRHm4SXAPhJGDR/?=
 =?iso-8859-1?Q?h2ZORwuYHlJUHKT9VrWkbMYlZzgIv+5wi7+LVJdA5NuZFz5eaLfKV4VqqZ?=
 =?iso-8859-1?Q?FqsviX6AAe4Zc/fXaHJIFG0OQJTdkaof9ItmyW1SYHFkqbbM/UDf/C2KUU?=
 =?iso-8859-1?Q?Ku5lbKoW+48FA0MKLVZBF6b2MRnUcarRiDHZl51/QZLox4QRwhs/IUwnJg?=
 =?iso-8859-1?Q?K4P8vwXOmBYq1IeodIIGH2xk4FYb5gUxIeHW7iURstYcRUVwAOnAJ24Y2i?=
 =?iso-8859-1?Q?0AIZCHRB6vrdJwTvUEMymH6etMqi321iiJo2Ud1hZHMwNYrCs3cQZOAQ1H?=
 =?iso-8859-1?Q?WSzTCZ2VxVB4EfkSGvwSt52cDPodMHhYHcFnjNqoTXkkVm1nS/ZLpOVTVQ?=
 =?iso-8859-1?Q?rynFhbsENDDbuY44WYw69d8ev0q4qDi5yfYMMFeo6vUp8izVCQ8vix3AJ+?=
 =?iso-8859-1?Q?LB7P2QLMkfo5FckQT6db8xBUwlwWsW7kndoadmLEyGwoL9CKOnEv7cpSYb?=
 =?iso-8859-1?Q?0mCPYi0VeOP4kMGeWasCVmOyaRxwmU0PeMPdWVmnxZj9zOjj4FeXh2Yi+K?=
 =?iso-8859-1?Q?Ek+rXgjP1X8awXM2/phRXOLgqbRoXdRHVXKQV8s6qSSc56xOwjpDatgM+2?=
 =?iso-8859-1?Q?WdTxwSnz5hw/sLdAMwdvlvtu9NZnQTnThhzt0UqIJF00Z4GrHHHIwAtNLr?=
 =?iso-8859-1?Q?eK2WEzp2SJGy5sTnunE4F/bc91w4O1qQJs9yCfoLf2ntS3SE8wP795BZrh?=
 =?iso-8859-1?Q?/L7XNh0W/fdaqOosj+tw/Sousi9NcJHP5eSL5Faxfx31S5f7JjAaIzfjSg?=
 =?iso-8859-1?Q?CGkXTitZec08/bm6QPlB/cA8Pn/xwfZcQWGH8qrgWGSE3BDBe9MeDXauUk?=
 =?iso-8859-1?Q?z3ROaP2h9vwaK1WGabSrQ2KFHyp+jZnD0iUlshtrL7LuQDh6gx+8p5XCrQ?=
 =?iso-8859-1?Q?QtzI1yABeQfUXQKvvwYPcjgnuUvHHVaBqxKttFj2ASnJhDC/KPSFhdWPdE?=
 =?iso-8859-1?Q?5xL2w3nx/v3W6Sijc7hXgjY8YGMphJMRhb8B9VGQ/XMdgMqAZYiFDoIk1N?=
 =?iso-8859-1?Q?X56y0nhZFOLyNv4SVZa+NiIlzqCXqlMeZO6hXPwW88MD57Y5J8LEOj4g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1bf8b9-79a9-460f-b80d-08de27a20e29
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 19:30:10.1618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zU89w4ffTQmie0Qdwt0ylgqRMda9CnX78+p3s5rY3dwcMBZvBfhdzVp5ahU8E9+ckxAnawvU+jxebkwXjtjH2s2W/XjycTsEAtTkzJ16L4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7690

From: Grygorii Strashko <grygorii_strashko@epam.com>

For x86 Xen safety certification only PVH Gusts are selected to be allowed
which are started by using direct Direct Kernel Boot only. There is also an
assumption that x86 Guest's (OS) early boot code (which is running not in
64-bit mode) does not access Xen interfaces (hypercalls, shared_info, ..).

In this case the Xen HVM 32-bit COMPAT interface become unused and leaves
gaps in terms of coverage.

Hence now all prerequisite changes are in place, introduce a
CONFIG_HVM_COMPAT option through which HVM(PVH) 32-bit interface support on
64-bit Xen can be disabled.

By default, CONFIG_HVM_COMPAT is ("y") enabled and accessible only in
EXPERT mode.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
- fix format and move above HVM_FEP

 xen/arch/x86/hvm/Kconfig | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index c323d767e77c..88090f5b3965 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -2,7 +2,6 @@ menuconfig HVM
 	bool "HVM support"
 	depends on !PV_SHIM_EXCLUSIVE
 	default !PV_SHIM
-	select COMPAT
 	select IOREQ_SERVER
 	select MEM_ACCESS_ALWAYS_ON
 	help
@@ -35,6 +34,24 @@ config INTEL_VMX
 	  If your system includes a processor with Intel VT-x support, say Y.
 	  If in doubt, say Y.
=20
+config HVM_COMPAT
+	bool "HVM 32-bit hypercalls interface support" if EXPERT
+	select COMPAT
+	default y
+	help
+	  The HVM 32-bit interface must be enabled for HVM domains to be able to
+	  make hypercalls in 32bit mode. Non-PVH domains unconditionally need thi=
s
+	  option so that hvmloader may issue hypercalls in 32bit mode.
+
+	  The HVM 32-bit interface can be disabled if:
+	  - Only PVH domains are used
+	  - Guests (OS) are started by using direct Direct Kernel Boot
+	  - Guests (OS) are 64-bit and Guest early boot code, which is running no=
t
+	    in 64-bit mode, does not access Xen interfaces
+	    (hypercalls, shared_info, ..)
+
+	  If unsure, say Y.
+
 config HVM_FEP
 	bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
 	default DEBUG
--=20
2.34.1

