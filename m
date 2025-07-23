Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD252B0EC8B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 09:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053427.1422247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNI-0007En-Ka; Wed, 23 Jul 2025 07:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053427.1422247; Wed, 23 Jul 2025 07:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNI-00079k-D8; Wed, 23 Jul 2025 07:58:52 +0000
Received: by outflank-mailman (input) for mailman id 1053427;
 Wed, 23 Jul 2025 07:58:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SBI=2E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueUNG-0005y7-9b
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 07:58:50 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dce0afbd-679a-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 09:58:47 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAXPR03MB8082.eurprd03.prod.outlook.com (2603:10a6:102:231::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 07:58:40 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 07:58:40 +0000
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
X-Inumbo-ID: dce0afbd-679a-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=me+0NfpjBTB8TBpSCxfSMzQb3FQTvx6KUn3PjiN5KighV4h/xS94Zf3IRsk1nAiRoUtZqPVx2dxOHjBR5ne1baD0jul2e4nx/iLv63nnAwGK7a0qHuOVrzrQDVlr3oIVAi4ilktYrNA18KBS6gwVNs+g13zxaiSXAutsiBsJSd4qctk+cfPVpzwE3cAgYY+NTCHX57ktGcdcCP3A0dQoujWBQfRh3swUx9gzeEJmMVhQ3A2moeJZRnANAUoMm63aGlMWSt/u6jDlxM1WaNALMrAQPylGqzNNuHo7bEDc7dWyNzajZuL5mnXooHaVq2RrhQ4LYiNqxvYPZgL2R9qsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/xUhbOd3Hd2arTHKwJKlILV9mz0mb0pwpQ7u8kFI5Y=;
 b=xbPWo+/DkZfRQhfk+neA120L2M6qEK14Ui8VjVOsW4n+7x+SpKp77WnMkvtxy1lMThL4PfNY9yOF6rCGLeMuI3QE8eMWE45u4pr7KbSwvgmqru35DTBJCNWOPZSKNdnlnK5R7/tFS5fqpwYgRPqmugRnasZVOYsrId2jKC7Mf5DQKOAahbQbAfu7e+HN3/ommrMdp3T4goNrULA12xKCSEY522UllawRmF/qhnELXTfaFXkFUDWGWH7OnROiFQPMe2Bv50DNZiuqqTwZGOAa/joIadID83X45OAkm+22hvXWHn3pLqPkwXoZgExw3WFwYqGr7SUJofWLkbre/9TytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/xUhbOd3Hd2arTHKwJKlILV9mz0mb0pwpQ7u8kFI5Y=;
 b=u7Uuu5q49jPjLPjgqSFn3JsnvbTvv7etY4GNRdZM/xzgRMmF3ZZ4FxGGpQcj+e7tsRm016Cnr4DZpxUNZ8XR1RZpLDlFjgkoP5GAdmFdsx/r5SVX5+53tZ62CbmYa7qdTlfm4inYFI+g9XKAC/DfxWU5AryfrRnpwWUfaVHfZsqD2d0ieUWfqN8wdO8vzv9yvQo84Y4VRpqWbvmWm/nS+zQq09cl/SN4AggCziPPeN1W09vNwWhsuSuQ6U5itjMbg7UdpeYffvZPDZNPNVrWyfOu+VCHqOXyAwRWj/n2O0x8moMNhfIOx/IHL4v9q4GNVeBnpnfispNu0PSLuyRr2w==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH 8/8] xen/arm64: constify regs_mode_is_32bit macro for
 CONFIG_ARM64_AARCH32=n
Thread-Topic: [XEN][PATCH 8/8] xen/arm64: constify regs_mode_is_32bit macro
 for CONFIG_ARM64_AARCH32=n
Thread-Index: AQHb+6eaXQ5OjqGTX0GClPul0tEYsQ==
Date: Wed, 23 Jul 2025 07:58:40 +0000
Message-ID: <20250723075835.3993182-9-grygorii_strashko@epam.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
In-Reply-To: <20250723075835.3993182-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PAXPR03MB8082:EE_
x-ms-office365-filtering-correlation-id: 6c62ecf0-250b-4363-77e7-08ddc9bebcf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?hLnjPQy8RDUAhIAo/1Wk6AqmdbCI1WbNebLntt5F30o2OUOVwTC/kulGuM?=
 =?iso-8859-1?Q?SpMDQP8TcSeud0A5OGzBcQRVyFnU/RwxKx/HuZiJQFZ3giwbVk71h76h+0?=
 =?iso-8859-1?Q?t/gXbbgJAD2Rb3N7YNXYTMC3rZyTKXVnSbNF1sqaX5pchC0XvwdXUwKJul?=
 =?iso-8859-1?Q?KZ1pp8BU+mbdwsA6duzhUJ2yf7MK1yiRzaml3UkXscR6uSlJw+5qSnIpSx?=
 =?iso-8859-1?Q?IbB/+XWdBDDY3Nrolwcvp6p2T6wp0WNIvEXzmX5gvzlukHe5Cpq7l4HSgf?=
 =?iso-8859-1?Q?2HAKjwr97cIE6LCGaP4dcZscnR6/nfPWcHybl7UWAwZPZ1aRZx3/y/r94t?=
 =?iso-8859-1?Q?LuWSziR+NCbheBbAYU6eKeYaoSlffvbN6bS9smPAYKPMCGKrPNdb3G0sGH?=
 =?iso-8859-1?Q?E+bzMkSuBMvPdsFG2Ba4N9vDkkYv35ANWYYUNcdbmozuNmd8LytAyc2bow?=
 =?iso-8859-1?Q?Nww0znRcqjze3Ofj0OO+13HTqgrcpng/olRPqEEmqHosK2bLti05PPA761?=
 =?iso-8859-1?Q?/z8A7botnpfcgagslVd1dOAvNiw4xuLouUQoW3jHjRUyrmLG9aqbjDwhsD?=
 =?iso-8859-1?Q?UDm2sEi7NdqNoG69TajeQeIwNLEA/If8EDJ685Q2nQDazH3pD935mEue/C?=
 =?iso-8859-1?Q?G07sOqmgpyYChypGHpRxnaFCVaCLdCHH5W5xv1APYezpP/JFpyGRBAyVMx?=
 =?iso-8859-1?Q?x0ZqPXJi/ew1xbrTpSAqHhD/ICBTRy4pIAZ/hVSPttS8uVL0y99j2HsGxf?=
 =?iso-8859-1?Q?pOpO4ixZ4MtXsGJkJxb8f0XfFk49AeNSMJFXro4i5GqR22hP1zxjzbd+uB?=
 =?iso-8859-1?Q?epssetRHv3NvLj3utwwh0Qc+FAmYao1JbtOPG/48pWvHDf1bK1eoBpidD9?=
 =?iso-8859-1?Q?rJydAObEEcz7B/nfENgsowegLiUNevD4cxH5sVnBtnAYGNLL0BvRDDs9Mz?=
 =?iso-8859-1?Q?wBKuTucxTK+IG3TfGnkKIXJoFOr8K3dweAXIyceUyJnQkDrYuNBIThQBZr?=
 =?iso-8859-1?Q?2ZCFHHBKrvdXn7ZtcHQiRPK3sRN3JqdSRjHsMVoslyZTCDdXmGiOeqLxoW?=
 =?iso-8859-1?Q?+uaPqdx4LJIxu+lka+gnPsrtC/OihsfCtr7xRRjZZ/CwRxLJT/wnQyb+gZ?=
 =?iso-8859-1?Q?PYNeHN86AB19GvFH7dK2UF9O8v33AwwcNIkdUCisApzf09t2gXW6KWNHXX?=
 =?iso-8859-1?Q?kWJ11N+As3HQ1JcLOM2nzHIpL/BdOdXRvGVRIMnsFLwQ79c7dsca8ez1bF?=
 =?iso-8859-1?Q?DB8/wrD1f7EOe5wT0tzSFEy/50McaijJGTYT9UTS3xHY3j0vWi5srfk1Wg?=
 =?iso-8859-1?Q?VLmb9ReghssKDyVnmLUMsgHi4PyEzBPer8g2pREDXJ5aj6z8WhJr5b7/ps?=
 =?iso-8859-1?Q?MA1prj+fN4AyJyMthSbXptmZc3t7ZEWe6BX/zjaA1wId2VNG10mdV4I2aQ?=
 =?iso-8859-1?Q?WRxZr+Se9wEM92kzXQ98MH0Cjbp3IMM3ZZqLdQjbsKTXLZDgRMH+cHYQN+?=
 =?iso-8859-1?Q?T25EhlovV3N+eJUwQyOBujYpLXB2jYwKi/J+pMp64j9g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZFxm7Lpq2k9KEqPYptb4Uss+y6wPuvrRxj3QtCs57LcksoUA0qmqV9Nc+G?=
 =?iso-8859-1?Q?EoCxYUbJLVDYS/Vq7gppdWMFHCZxpp+SinFeUELTgKMU2VQw6RB3H08MVM?=
 =?iso-8859-1?Q?jlP2VCDh3wKPhwKY0ON8cwyOxAQCpIQD2Ac/i3SnWCNKuRYajR/+NSqUh4?=
 =?iso-8859-1?Q?3Dw9uG3tNRRBKQz04ftaj1syY4BTtAvJCQ/YtZlaqrYVWdj+BOyDl+zuBn?=
 =?iso-8859-1?Q?A0hkXmd8bBCEiJxhHjYuqPapGGKWDwJfpACv0v8OFLvuNkKPaysSwMWuy5?=
 =?iso-8859-1?Q?6sUpnT5Z7iCQiybmzoOReNjRfT5FR4IJM+W5vtxLCCNEaYpNZQ2IVe9KOF?=
 =?iso-8859-1?Q?o81/q5iZ0A2Ggz8O5nKaQ78gdZOlc6/y2vvu64iWZ2+oUAe17wdIv51vLm?=
 =?iso-8859-1?Q?zkWfzDJYUy2WGOIemIjqY6C446PqH0UpBcFpK2FmyqvNCLkC2sO6jcithZ?=
 =?iso-8859-1?Q?Sat1Lqw1ovmrAT9FTMQmKETk69SedIIq8d0eVm81Qf6wRuOPzcKO6M15R1?=
 =?iso-8859-1?Q?w9QOXHJKrMXI7huRNnCRJxyBglJQR/bOv8SOg2cY8Bk9I5NzWdlR0y2HAU?=
 =?iso-8859-1?Q?hLnzgT/4zPbZ3i7AOUAZm4gX2MMGeL5JvXCFf/dYfL7eSWWtykCW0z8XrP?=
 =?iso-8859-1?Q?4BQhzm+WyDgawd190F/ser88Y4rVIatkYrWBoiQLJ8wq75e3VtST5cNGCw?=
 =?iso-8859-1?Q?f3Ugq90UaJAwaSuAuyhDo0gwy8J1ycJgnSQzLjbKAxS54D61UM+lcWFBT4?=
 =?iso-8859-1?Q?WbY/bls/zkv4eOoQAnyaRY6vJdFjI+TScSXRjcL2tbTPqa0eABXDq/LQB1?=
 =?iso-8859-1?Q?h6Kv4+Kg68qjqYcNENHkYpofZiA4ogsAHJXEcpfvSOIxstgA7iylIs7xEu?=
 =?iso-8859-1?Q?bnE2JSJsU4FnuA8MBefcrr6SeSAEkqcTv9PfbBZz7D2kw7Nc6E57oK3FM5?=
 =?iso-8859-1?Q?DXrGADioQPJrs1jA0l6juMQME2AQr76kco7OYATzGR3ctILykeVkMAC7oY?=
 =?iso-8859-1?Q?5PbnW822rp5hjXn7swSTaHQMFuX1dk69vmLMJ4pPTPfO1+M2NIS1EcSwkG?=
 =?iso-8859-1?Q?a8MvJOGr/qBgY26rOTKSjelgpJ3vmN+h/5LOHEUMXP4CA/EFobPkVLo+A4?=
 =?iso-8859-1?Q?Q+1HMDEy3ZiI33VIsgNepXM6BusJKLDbUYOmhRChbszQb39byGdOKeGMId?=
 =?iso-8859-1?Q?Dta2MAhDDO2/vFPPo25CgHMxj4jyJv/h5H4XmUU0XxoC9jOXWOJgMlPBjF?=
 =?iso-8859-1?Q?rild27AASq2wR/lnRVdx157xAQO8WbgIiAbJ3ecO4OC4wSCqTRNgDkqjTA?=
 =?iso-8859-1?Q?URSl5w+3V7Vz57e6tFflv9DiRL1EROf7Wcqr4FW0R3AQP/O7L7PKtNJMbo?=
 =?iso-8859-1?Q?O+n5Op2oFNIkbnFyGPo2zXffRP0oAFdMS8hMSY9DNdoD93hUKKDv6dXmfB?=
 =?iso-8859-1?Q?ijD3K++KMeQZvQMvIkPARuR4GS5I/w6egWjPSjmzaV33xKjOHPeJWQbu/C?=
 =?iso-8859-1?Q?wnVji3UuQmFbZzTV2r9+UKTX8Jr/ssp8lfG9fHTCIIwW55nq8PJIM3rCmh?=
 =?iso-8859-1?Q?0DiVu6tAV3p1gP/B0XAAEtFR1n/5hfsBvzHUbB8Yq/mgxyVE61MUN5jh2L?=
 =?iso-8859-1?Q?zazvjQks8cIOhNhlyYBj/XUW4ypO/WNSSSpCSPeAkG3qXPEXZ9scJdJg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c62ecf0-250b-4363-77e7-08ddc9bebcf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 07:58:40.7200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LhtIg0b7o7kDEp25etbILjpA5KPGcJXmBVyH5olBeaJjjxEG2Sz6BG7dS1eJ+oX7N5BY9WVaTsz7BKKaEg3HozBc5uMdUmQ/fX1v3MVe/mU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8082

From: Grygorii Strashko <grygorii_strashko@epam.com>

Constify regs_mode_is_32bit() macro for the case CONFIG_ARM64_AARCH32=3Dn  =
and
so allow compiler to opt out Aarch32 specific code.

(CONFIG_ARM64_AARCH32=3Dy)
Before:
 855232	 322404	 270880	1448516	 161a44	xen-syms

(CONFIG_ARM64_AARCH32=3Dn, CONFIG_EXPERT=3Dy)
After:
 849548	 322404	 270880	1442832	 160410	xen-syms
diff: -5684 (dec)

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/include/asm/arm64/processor.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/processor.h b/xen/arch/arm/incl=
ude/asm/arm64/processor.h
index daf890708d87..a3d83869f02d 100644
--- a/xen/arch/arm/include/asm/arm64/processor.h
+++ b/xen/arch/arm/include/asm/arm64/processor.h
@@ -96,10 +96,14 @@ struct cpu_user_regs
  */
 #define regs_mode_is_user(r) (psr_mode((r)->cpsr, PSR_MODE_EL0t) || usr_mo=
de(r))
=20
+#if defined(CONFIG_ARM64_AARCH32)
 static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
 {
     return !!(regs->cpsr & PSR_MODE_BIT);
 }
+#else
+#define regs_mode_is_32bit(regs) (false)
+#endif /* CONFIG_ARM64_AARCH32 */
=20
 #endif /* __ASSEMBLY__ */
=20
--=20
2.34.1

