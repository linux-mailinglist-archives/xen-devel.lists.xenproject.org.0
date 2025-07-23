Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FEDB0EC8D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 09:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053426.1422235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNH-0006so-Ax; Wed, 23 Jul 2025 07:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053426.1422235; Wed, 23 Jul 2025 07:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNH-0006ou-1N; Wed, 23 Jul 2025 07:58:51 +0000
Received: by outflank-mailman (input) for mailman id 1053426;
 Wed, 23 Jul 2025 07:58:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SBI=2E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueUNF-0005y7-9W
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 07:58:49 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc334240-679a-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 09:58:46 +0200 (CEST)
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
X-Inumbo-ID: dc334240-679a-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oys8FNFqobRxsdZzGXZwqdHQyuHqoNO0NrxmHmPdLMrNbhFfiYcDc56y4/8tZ09bvAangXl8de0Lx8WTS8NMJDsB0/aXsdpUnWy9mbeXUgr/LUR0mrlGCOj28Z7UoNdrBVVAs3tWeTm3c9lWFQDvzMo+IQpGBnzisXhDKrqZPwoRUrUFf3O1Qc2z3qgMbEJWleptBblerKXTNQNoSwTCYNUJsdtERluSB/Nx4n2hb4752Thyq4Ca2+Vu0FBkZjxrRSM5uGSziYpeF3mGCpq/RTDdX8NGzZoi/Ch+Bkcvc5VT7BgO1OBXSbvDNlnzP+1ANkwuHRpMOnJutK2y6KWyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkx64sGC+lYP/lfI7DCn/wv/fmYkPTLfTce17YnC4LE=;
 b=EwAvu3PyzMZBKqhSK0PDfkAK1qeQ6PvuW3NeJOvARuy8Ine7YgHUkTEHnCBQxqazxUfkuIwBA3mUKikKSAtlrDRiH57kpKyJ6r4Mv05JThWxsIf70dmSNoEPsZYWWuaJHcHdrE56JyDe2KQS5YK4EGjdoAZ5Lr0y5j5JOKJf4wxGlcsJgu4HeNuUvF1O0UGWMTlayANGX32g2bPzmKwnhYsm2O53SwmuglmXtEnvuWmE3dHF6xgKROnplPwxez6oaZXMy/QmPYJmVUiu4KNt1yADDb0FJI4leMPWnXbw3tdM2s9r2S4iWkDP0VqROXUTg+IizCpMyZdohq0pgGkrQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkx64sGC+lYP/lfI7DCn/wv/fmYkPTLfTce17YnC4LE=;
 b=SNHYJfhO3XDpWaK/Ifn3crBfybktGjkDJnk3amkR/qT/b7FPGIDekE3l2WN+G62iEuBlXShpBkWOLLuhF2VSqC1ePHV6fwiYtw30RPNzL7uIyUK92kqeyFVVQH7WvruTKNJDX/RS1g8AuM7x+gNHz8WcIkNCTviN1YV/VIvz9vDH0j22PRmqzaA1Ivngv/Cq5UEx9NJvANJr6uhtNT9Py7fh4xz4yMK5RSNgA5iCLuJl29vPTlYGBxykfWldFMTzo0+M6uYoLkEQfoCFbRoLDVGrejf+3DxEZsXsfG7P+sK+00xU9j4lVKyjNn5yjMXkCeQsDKY9LVu/IAGsrRTjfg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH 7/8] xen/arm: regs.h split subarch definitions between
 arm64/arm32
Thread-Topic: [XEN][PATCH 7/8] xen/arm: regs.h split subarch definitions
 between arm64/arm32
Thread-Index: AQHb+6eaq5Yp0PnU6kKhx9WtcuS+uA==
Date: Wed, 23 Jul 2025 07:58:40 +0000
Message-ID: <20250723075835.3993182-8-grygorii_strashko@epam.com>
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
x-ms-office365-filtering-correlation-id: 5ef8dc71-db07-4990-7ee9-08ddc9bebcb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3Q49/zIcrymWyu4ZDPkWrgA/yV10G2cj8tWkDJ5gaudXhjWkSVlyJuRVMZ?=
 =?iso-8859-1?Q?wurfKqTjjm55WQNxiRgc3Q4J/MuvC952GIa1xvGnDpd8QoqNsFi5Zc2BFW?=
 =?iso-8859-1?Q?ktzuZZMd3HHIXvwp7rhQNFgMHSQFQYHByNwUjHzIlfKrIeNiVihRNiMvE8?=
 =?iso-8859-1?Q?ycB3Sfu4UO3GNPzeFKbSEsEQE0d3ennRmA5NDmY524lOpBRMmPgwJbRIQU?=
 =?iso-8859-1?Q?zTgAEVkTrj1VfxiZg7/rgKmcvYkLo5ETkFSUcpXtOVQ8MFBMS4nv/j0ZKM?=
 =?iso-8859-1?Q?Kb6/I14YSBf1EWCjj4rMWkGy3sbTPvIzjla1yRZfkO8upz99AtSRfbAV1C?=
 =?iso-8859-1?Q?DFByxj9FiULYTqFMeF29UM4b1r26+2qukix0abpPjyrAyYTTFGSdzVxFtR?=
 =?iso-8859-1?Q?xM/qpT98IeMzAWgWLSaSFrv1jRrEWQEAlwRY8U1nktc6n4fzmc60xkMeA3?=
 =?iso-8859-1?Q?t/kkraWo7hvyaq0iitXlf6h7SAjXZwxSY2XUmcb978MqH/SFF/WIudApca?=
 =?iso-8859-1?Q?QLYzoYu9TPsWEFgD7VKkGCL945UGGRiLeytdaRho6Zf9nmZH73myZZ56FH?=
 =?iso-8859-1?Q?zDNbOTKuL+XHfgzbNQuLYx4F3tOVBj/+7T0sGchVObz9sgpphOULQRUluN?=
 =?iso-8859-1?Q?/voP/vp6fCaVkKJnE6kK2pwDpMfRtjwQRQgDuXy021M6sAA02L8VpIjfp7?=
 =?iso-8859-1?Q?VqL/sDji+3hwWPEL4KtgdmWmFzjU1nPUZPP+X3xzY6DWx9kKtaAtlwBbMh?=
 =?iso-8859-1?Q?jois5WCbpkCvsHrIUj1NNB885lW5fmTyvwtVCcBCIDYODvldo5R3PIGgGk?=
 =?iso-8859-1?Q?8z3g7ULOI2QeHnlOJ1XqQVMVL3mNkd9nttUTFfeqbiN0NbtW5dJwIbiI/C?=
 =?iso-8859-1?Q?nNNcLSHlcNLpwkBieKcClagFstHKU66seU07zJUdm1ImMCrlls2PBnxyXv?=
 =?iso-8859-1?Q?v3A7edJspeWWdexLiZQrUCZ8fP6TaPTJ/EuzUn7kjl9x4kd/qjlUvqkXLC?=
 =?iso-8859-1?Q?23tiis/QK96Wtobn4+xI+LQxO733vJtSSjFdmVX4oWTNJl83LjvhwEzH2g?=
 =?iso-8859-1?Q?Mo4Xp7sJAUGsqa+drD2VIxQZ0oEZPohPcwXMVtR6cI6pV9ALww76UJjKPR?=
 =?iso-8859-1?Q?rcFDi6mS/kz1gXxfH7v4RVuDGIIStvNOxhjY8NNe9fGwwFlsvBSUBJL5z/?=
 =?iso-8859-1?Q?3kkZpJ3xRS7ZB1GNLqP+HNuy6AKREopu+dgnkgtXXTemxON8S6XyGjc6g4?=
 =?iso-8859-1?Q?P6lbMTLlb6EFEoVlsooHR95fFHL/WM3y7VTB3pSop34dmlBAolFSa1Zqq4?=
 =?iso-8859-1?Q?Dk+Ysf7blBMoy3p8+ZmB4KL/qmmV93JVJzwCwlM/rcnj5YPYptRs0FAA5u?=
 =?iso-8859-1?Q?Fwt27i4mgtwQ6bAZ9slZ3cD+E/hURf3YW7Wnjxp8V9WoWRPqEnwwNoydpH?=
 =?iso-8859-1?Q?4BvLEj6QYsdirAKGsPxCen8gBcKWLDfXkfDUt+d05MbQLcPsqFlaKwthun?=
 =?iso-8859-1?Q?EFdRiFHOsb94xHGqyTFd4Tml1s6CLK/ry/6YgHURUWJA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3i8ggFAI3wgc3ALIlKlbfGgQPLQ416xaO7IlAB2boZshLM2PDWBaw+dp3L?=
 =?iso-8859-1?Q?zelvjjIVEm4frq+cv6XMcGzzuaX7pS3u/hkJWaNpA9GkPkqxCY9XHw7sEh?=
 =?iso-8859-1?Q?Em9DwD+bvPwfXII3DBpSQWNvw2ti3b8J4YkfebpPTHy59ViXLBqqwjaevo?=
 =?iso-8859-1?Q?xHNcu5AC4/QEq3yCljyJ3er1hznRSwKlqoWHa4Q3ErJ9HLz42hEaerE7YT?=
 =?iso-8859-1?Q?zGrJjHewb0iJ7TsFEIAIHRpvG9FuSNOS9FzQReMnSy2Jy5FXGQ4X5raa6U?=
 =?iso-8859-1?Q?AiI34CAQlgBCKobnKf/qq0vR03p2Z1taiXAm+OzBG9GYkSlDiEbaqmPeVe?=
 =?iso-8859-1?Q?lR8xIQ5QNC2n8hqRPb0A5GSQ1++JiZTHF3bPCcupUy+AS5na3Ak/Ji3VIA?=
 =?iso-8859-1?Q?EEEkNjhboOckahE8Mk1gUPgnZtiT71aOmr/M1SACPkFuVcINh7DnECEzZv?=
 =?iso-8859-1?Q?ssLCYu2HXGu9PP1P4iAoNX7a4h1JCnkcgRKuc2Or6/jcFd/pxLRq0L09hL?=
 =?iso-8859-1?Q?9iJNOHVePtHkPgdngF3MJWSlZQVCVLxKAy98ciqll0RvoZAcHvTgKRckiY?=
 =?iso-8859-1?Q?xh+iDxoRFrhsMWGEXDGXC+rWgzGEYf6/TkUMJCOk8+iO56K0z8bENoK/xx?=
 =?iso-8859-1?Q?LoYGRMz1cmGrzAPV8H8Jb8E7WN/KTMwyAJVNbET+dAr8SUKLKt+XVWpgNt?=
 =?iso-8859-1?Q?+M9xL4yOzPotp0YVaIfnFDWBWlTCxUq9BFil+I3zprRsRELh5noKn9JetX?=
 =?iso-8859-1?Q?dOg8Z4ACD2dTytbk3ri6QCmlovYBrSzSbENpwSAPL+huy6Hkpbng+FmScP?=
 =?iso-8859-1?Q?SWrrEJjWLV2FsP19RLQNJTrCxGSrNnayj87W+NKBuGr+dqxCsviHQVixm/?=
 =?iso-8859-1?Q?JaHpzx3QNNEACXySO22yUTU4RCOVvwIoXSUWJS1IV/SZVGYD2HDw+zazr3?=
 =?iso-8859-1?Q?CTNYLslxjFNh4VhaRwQzOfhnvjfvHNJwyoxSWSfpB8mKY2kisTgf5akHYb?=
 =?iso-8859-1?Q?3vnO+JBqI+1EsZrwwJ58AxpbIcI8CBXNXPYFH6841QMarC1KJMvvDTbqF5?=
 =?iso-8859-1?Q?7fyyMQdWET05qWRC4UoeAUL3S5ljfYHMtKovy9nrn1h8xnxstEy/UeaSZx?=
 =?iso-8859-1?Q?nFnaZTBTVplTXzOYjBxR4p5g56xme+J/rAuJ9OhdazR3S7SIxQ69G4ech8?=
 =?iso-8859-1?Q?yuua25YTA+XaF9qfhs6TbqDGG9wzAdqKrbAoQiyJNv9ULkvOVWH2JeMKdu?=
 =?iso-8859-1?Q?qoBiOmExiokeSUXlvHNbITDz1aSsM/9tR2bi6ELUsBvGPlhOWq5gw4/xOZ?=
 =?iso-8859-1?Q?MR7+6qqCgiZrJ2P+T+vtHM71Vs5fgCXJsKANQd4fjMxUj4P0DiPrlqlm0c?=
 =?iso-8859-1?Q?h97RLrdxL5gpOfj5ddRFjM/MozdZBc3SO6ytL4FjplJwb0BODjUto7cfOX?=
 =?iso-8859-1?Q?aUh40zbpHreuMwHWb1tvEDkco6bOZS97j329mgHRBnKVEOTphUuXv1orfK?=
 =?iso-8859-1?Q?nOq2ve+tzC3gCC96yX/NYcmJ5EmUF/SUNmnq0YaYwcRqeUFQ6hSVKDK1ck?=
 =?iso-8859-1?Q?lsB3B09OvZ3ysFc1iCE41o0qvfH8c+R4Uy5cv8aBTsJBcibIXueCCpdrDD?=
 =?iso-8859-1?Q?n7zZOoaVe9gAuOOHEshuPswpe+HyRn9fG6xEHhyQL017/kvZ6a3IVknA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef8dc71-db07-4990-7ee9-08ddc9bebcb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 07:58:40.2692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +AEb/SMAk55v8FAXgNdVz7q9AdNWlUhQQBEjlhZHTXrPNaNRk0iRyukiL+k+LMUwG+OUP/A8hxpBODH1Kg2zusKNlOOj4LXgfufMHi+CzkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8082

From: Grygorii Strashko <grygorii_strashko@epam.com>

Split subarch definitions between arm64/arm32:
hyp_mode()
regs_mode_is_user()
regs_mode_is_32bit()

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/include/asm/arm32/processor.h |  5 +++++
 xen/arch/arm/include/asm/arm64/processor.h | 15 ++++++++++++++
 xen/arch/arm/include/asm/regs.h            | 24 ----------------------
 3 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/processor.h b/xen/arch/arm/incl=
ude/asm/arm32/processor.h
index 4e679f3273ab..10d5ff5c192e 100644
--- a/xen/arch/arm/include/asm/arm32/processor.h
+++ b/xen/arch/arm/include/asm/arm32/processor.h
@@ -56,6 +56,11 @@ struct cpu_user_regs
     uint32_t pad1; /* Doubleword-align the user half of the frame */
 };
=20
+#define hyp_mode(r)          psr_mode((r)->cpsr, PSR_MODE_HYP)
+#define regs_mode_is_user(r) usr_mode(r)
+
+#define regs_mode_is_32bit(regs) (true)
+
 #endif
=20
 #endif /* __ASM_ARM_ARM32_PROCESSOR_H */
diff --git a/xen/arch/arm/include/asm/arm64/processor.h b/xen/arch/arm/incl=
ude/asm/arm64/processor.h
index c749f80ad91b..daf890708d87 100644
--- a/xen/arch/arm/include/asm/arm64/processor.h
+++ b/xen/arch/arm/include/asm/arm64/processor.h
@@ -86,6 +86,21 @@ struct cpu_user_regs
=20
 #undef __DECL_REG
=20
+#define hyp_mode(r)                                                       =
     \
+        (psr_mode((r)->cpsr, PSR_MODE_EL2h) ||                            =
     \
+         psr_mode((r)->cpsr, PSR_MODE_EL2t))
+
+/*
+ * Trap may have been taken from EL0, which might be in AArch32 usr
+ * mode, or in AArch64 mode (PSR_MODE_EL0t).
+ */
+#define regs_mode_is_user(r) (psr_mode((r)->cpsr, PSR_MODE_EL0t) || usr_mo=
de(r))
+
+static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
+{
+    return !!(regs->cpsr & PSR_MODE_BIT);
+}
+
 #endif /* __ASSEMBLY__ */
=20
 #endif /* __ASM_ARM_ARM64_PROCESSOR_H */
diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/reg=
s.h
index 0d9f239a7782..22d3a1688876 100644
--- a/xen/arch/arm/include/asm/regs.h
+++ b/xen/arch/arm/include/asm/regs.h
@@ -13,15 +13,6 @@
=20
 #define psr_mode(psr,m) (((psr) & PSR_MODE_MASK) =3D=3D (m))
=20
-static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
-{
-#ifdef CONFIG_ARM_32
-    return true;
-#else
-    return !!(regs->cpsr & PSR_MODE_BIT);
-#endif
-}
-
 #define usr_mode(r)     psr_mode((r)->cpsr,PSR_MODE_USR)
 #define fiq_mode(r)     psr_mode((r)->cpsr,PSR_MODE_FIQ)
 #define irq_mode(r)     psr_mode((r)->cpsr,PSR_MODE_IRQ)
@@ -31,21 +22,6 @@ static inline bool regs_mode_is_32bit(const struct cpu_u=
ser_regs *regs)
 #define und_mode(r)     psr_mode((r)->cpsr,PSR_MODE_UND)
 #define sys_mode(r)     psr_mode((r)->cpsr,PSR_MODE_SYS)
=20
-#ifdef CONFIG_ARM_32
-#define hyp_mode(r)     psr_mode((r)->cpsr,PSR_MODE_HYP)
-#define regs_mode_is_user(r) usr_mode(r)
-#else
-#define hyp_mode(r)     (psr_mode((r)->cpsr,PSR_MODE_EL2h) || \
-                         psr_mode((r)->cpsr,PSR_MODE_EL2t))
-
-/*
- * Trap may have been taken from EL0, which might be in AArch32 usr
- * mode, or in AArch64 mode (PSR_MODE_EL0t).
- */
-#define regs_mode_is_user(r) \
-    (psr_mode((r)->cpsr,PSR_MODE_EL0t) || usr_mode(r))
-#endif
-
 static inline bool guest_mode(const struct cpu_user_regs *r)
 {
     unsigned long diff =3D (uintptr_t)guest_cpu_user_regs() - (uintptr_t)(=
r);
--=20
2.34.1

