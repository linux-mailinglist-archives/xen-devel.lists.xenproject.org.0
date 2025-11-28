Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE8C92763
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 16:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174987.1499914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP0TW-0001uF-Fn; Fri, 28 Nov 2025 15:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174987.1499914; Fri, 28 Nov 2025 15:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP0TW-0001r8-CG; Fri, 28 Nov 2025 15:33:34 +0000
Received: by outflank-mailman (input) for mailman id 1174987;
 Fri, 28 Nov 2025 15:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q4nf=6E=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vP0TU-0001r2-63
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 15:33:32 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9134a131-cc6f-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 16:33:20 +0100 (CET)
Received: from CWLP265CA0326.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:57::26)
 by AS2PR08MB9366.eurprd08.prod.outlook.com (2603:10a6:20b:596::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 15:33:14 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:401:57:cafe::f8) by CWLP265CA0326.outlook.office365.com
 (2603:10a6:401:57::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Fri,
 28 Nov 2025 15:33:12 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Fri, 28 Nov 2025 15:33:14 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU0PR08MB8138.eurprd08.prod.outlook.com (2603:10a6:10:3ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 15:32:08 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 15:32:08 +0000
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
X-Inumbo-ID: 9134a131-cc6f-11f0-980a-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sixJwASO482la3VNreDAH3y/zu6kwMlQjr8cz4kfEGk8AX7WloDjEbNlbQGa9LgWiSAOIBdh1gGkyrdfr0yMg9H+h7aStlrZAmU8gKct+4cO5hLK+9HonBKOUD7YNVcGPVoBa565QYvjOqW+nYKiFe4D9l9C7Xys0UvF0e9snsrkhNkQiuTCEzhk9nd0YycJqk+heWvzhzdWaqY7Tau7z9QAPlsxQvErXiCwR07RQSUJzgNgAurifOP+J1/995fm9BgsLGA2VXH423t2P0yb3hM5Oaxl6K2TbJmJb/NvctFyFnD0SDO0rOasywmi2CKqCLnaLKiWJ6Fkl5fo0o2fBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVt7tzBPjCdDGSUVzcWmKkm4vG0ubgV9aV5KWaYsjW0=;
 b=kzoqgaIOgAG8i7YESoMSA0KECWboHc58oIDhRGvDwRZMEl4DwuLxsZkTUtDwpAIvN7Cz8zHWQnjqsvQ4jxQJWOG4q0WbN6Lo09ihQESXcU0SyqvUpowfao3Cf82iOwKc3kEV6o0F9mDSKVCopCfcqkShPDWO3F+4ehNFmJA2cIEJdhjGghqFhmEriW2A0ngo15tTYfmEY473oy1f4EYuGVZiNOvtpTtR9hwUeQE9Re6KTTrncrb3BdCvdBFojfNjR/93A4ED9gVrtmlPcxN4krmaILIm69IIlxjYCwi+mjaHXVP7IOHIJ9eekFxfGzFC9GgDnG+C7lUnVrY1wahfqA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVt7tzBPjCdDGSUVzcWmKkm4vG0ubgV9aV5KWaYsjW0=;
 b=izILt84RoImXDkVTSmQiBPM9R9sic2I5ZX8tkiPHfbdcP3F+6uulHR1ogEOn4moS56wt56kcP/zdUM2bCWrad+uPxLK0Tgt2Ix5HLiCqor0uYvZjx9uu+ytul6kAmKRRPw/BOCEUuGUVaMefy1jpcrl2evDm6w2ZyH41bfoEPyI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNiPorKUmxYMWA4UVurJ+xfBGRmmbNHsg7Gj1oiMuCKCCaZYxYb7Qq/E0qOJhbbRBo+edkxGaSnQmgofGV+23HOctjM/TJ/VYKLswHEB3pjtnNh9WK1FxOLdLCtFzsCjgOZtzUKZbtRmhx5pY9LjL1t14Oe3rca88Ry3Kru2bnPQnV0ild6fw4DqvVz29OL9EGiZk2rSvxoB2GX5+zZMd03q9NwXypQ3/DWsYm6kgR2bOub15kE2NhrfgSy7nJIuJQUWkN4sKmex4ExKNB22sEB9Aq/Yiq4HhuNXhGkwGY0ZTfLZjMlRROu05+t5G5Qg/nK7bsxZiiQkqEKtb6ChiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVt7tzBPjCdDGSUVzcWmKkm4vG0ubgV9aV5KWaYsjW0=;
 b=LcSFwD4TycqiFrp2u/wYsgRmJBF/pJj7rmfIt7AmM58LqVAc/uQTuZuwYtgA7MUT30u8Qr5zAHJbsW2oOrHDso/tL7GQPVBuVSEnfq0Q/W7HEKcjo0Y3Nll45FcOQLtPPhT4QJbLoTz02TOV/qp62NRSBIdEvBXXD4vZ2olFydzCvMekfHJAEQOwoFvYo8zPfvtSEB/+4qyACmk3TRV+EcGSr7M5URQm/RH+OCuc/H2O5CGF//9lgQLWGdGj+PNe5DuzY0J6v4viY6RTvtUlOPPf63l02AeZoDZZA74aynlcTukEnWn0jvc4tAqceiuG+wio8XWAzMgFeMjPqG8UoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVt7tzBPjCdDGSUVzcWmKkm4vG0ubgV9aV5KWaYsjW0=;
 b=izILt84RoImXDkVTSmQiBPM9R9sic2I5ZX8tkiPHfbdcP3F+6uulHR1ogEOn4moS56wt56kcP/zdUM2bCWrad+uPxLK0Tgt2Ix5HLiCqor0uYvZjx9uu+ytul6kAmKRRPw/BOCEUuGUVaMefy1jpcrl2evDm6w2ZyH41bfoEPyI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 1/3] arm/ppc/riscv: drop unused
 domain_set_alloc_bitsize() macro
Thread-Topic: [PATCH v3 1/3] arm/ppc/riscv: drop unused
 domain_set_alloc_bitsize() macro
Thread-Index: AQHcYHrKJo3fQNjNOEm0i3u+ucdXc7UINzYA
Date: Fri, 28 Nov 2025 15:32:08 +0000
Message-ID: <9C230C5D-F726-4E01-A897-BC38AE4507D1@arm.com>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
 <20251128152218.3886583-2-grygorii_strashko@epam.com>
In-Reply-To: <20251128152218.3886583-2-grygorii_strashko@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU0PR08MB8138:EE_|AMS0EPF000001A9:EE_|AS2PR08MB9366:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c1ac75-89a1-45ea-5772-08de2e93721b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?rtS5mt381abf9AkpwsEmZpyW7GRWpmpQrbKGGItJr56lJ0nsOCE4R0qBQ3jT?=
 =?us-ascii?Q?uIr6YAUAuRWo+/qZfT3lOZiU7QkwA6ZM5svOXE9pPVMYhl1n+CKpqrXuWLuf?=
 =?us-ascii?Q?j2TOJcdaiLJ+0eraZJIny/ckEd07jB36v/OEcjtCOJXJ4TEQlZJYBiT5HsSm?=
 =?us-ascii?Q?lz9AnM/E3uohkiq0ito2MqnHUZBhjPcp19+JBGoHflKS15Lam5uQYC3PkATp?=
 =?us-ascii?Q?9yujPwKKna2ZFXqAHODaBc2aJGMlr4+26IiErwGxxBlZPvvIzaxUnVTNYhcC?=
 =?us-ascii?Q?vCFDry27Nae5P5II4jaT9XtV9JhWeWQhja5Cs/R81/qLQM+Nbo+JjzB0tLrW?=
 =?us-ascii?Q?TlVAx5t8tnRw69STfuyJk3LDeROo1pKX9Bdxtfl4JkKtovMnVMGU6xWZhJr4?=
 =?us-ascii?Q?C9H55NacvmcqrP+cxVsOEbr6mLSQytQs7bFwuGV0Qfyhr5DoeVyJSIiT55Rb?=
 =?us-ascii?Q?cyW72rkTOjAyViUOlFE0K6WxpbVIQOEeT3jLRr4kDxBP/6Y5pDaDDV3pTZxQ?=
 =?us-ascii?Q?2RH6seZDrT+KS4s9HA7hsW+PYingBewTlwsz0ro1OV3SuwTZL+ZW5/Ail/Ke?=
 =?us-ascii?Q?sHYFul9/P541bib+36FBeCnq25B9sSVnzi6UyH9emSDjGoiZeMm9gW6VpgFz?=
 =?us-ascii?Q?Ogzk3PdDzLiWIY3AKlTnQ4srzAEfmXIKVNH3BGmRVGSEWflsSdhftINmcQCZ?=
 =?us-ascii?Q?nBf+OElT79dE6nt5q3sF0qUe6vhLXGre62/6hm6gCldnF1VgaiK+6vYwtOuh?=
 =?us-ascii?Q?Ubu0skdzarN26j7hwAahlsdyHqeHzSUPrUcXN9DA0utwQwbgi/ilP0Mv58t8?=
 =?us-ascii?Q?ZBLJSjk1dsbSSmT/7oUomyhe/SYiIl7KUve5wmWZ4LRv37A1iotmK1aJ/wYS?=
 =?us-ascii?Q?h2mmHkVbjKPzD1MgL/ole0gHaOfs5tg097pSftZKHDWbzmQ9GVsixW1Uya4l?=
 =?us-ascii?Q?kAp3ukpFiEfO+XqEdzcrK3mHDegpSksEVOmKcA69hWZhvJ9An5BiDbbr0xYc?=
 =?us-ascii?Q?HLfBcCx6Y+XkHoPp8kRaDVeRhaF+zlOyYpLkrO1f1wTp3Mf/4PpMGf6Fqwo1?=
 =?us-ascii?Q?vjLjU4I9btFe72uo70J+2opARRpklN0iAwWwo/RDg2cUuu+Gq5loaixDSKXL?=
 =?us-ascii?Q?1NgKlWTmcBJiemhBDCoU6DmrSF68YSPYDOgU1Q3uATfyfMC1WYad5hfgJcG8?=
 =?us-ascii?Q?0E+XvTDQkBkJIp1vLAe2OEj5fDQqmd/dcG8D6tSPjGARWPsOriMxC6JcWOOY?=
 =?us-ascii?Q?eVqI3N3Lld+/p83YGBcpCR+r+02Ulgj+r15FdCKEWXGDiXR3yv8op6b2eJrf?=
 =?us-ascii?Q?ln4dROE+IRcZNj9jgxLfqm/h2v1LvhiUcw2OJQ3dcvr0aKmjdZwqJi91/hu5?=
 =?us-ascii?Q?uG1pGdKux4acizeybNbNTF0d2+oCZiywdbwhX56vHxx0Ma9sQvMPl2i+eRmc?=
 =?us-ascii?Q?Zw3MPN3A5AhOYuWd8aWszlbhHuC+KAuwn1aaPfNPqBfs7Eu4gYcTzsZ7F+2+?=
 =?us-ascii?Q?RWH0ehfNncQLHiytFU9hDzvRZZRH6WAigmVF?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A96553A46041DE4A9BFD988710B0A406@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8138
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d0722d33-abd4-4218-6e4d-08de2e934b24
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|35042699022|82310400026|36860700013|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qbRTQLwUINljywhfbLJdveAlvcZKKlocvLm68ds5Z13KUro0yCZKZXQDqs86?=
 =?us-ascii?Q?ZHw53pqzszv4uT/RVXRmpxPzc2jSgkx1G3N2+50r/vtzjgG/NjYTaHh8j5mT?=
 =?us-ascii?Q?4ypXiGFoh28+lwQPz/KynqGrNYhQjN64JbAHpEoAEAXPR0amwT8WEZONaCna?=
 =?us-ascii?Q?E7HynYIGRND26NGGoMC7KeYrsPfusZhmPFjC+wfQ7CY1hlHZcVNcnsVyJcRW?=
 =?us-ascii?Q?6OQyQ7cSbgJmoCGCJcU1St7OYkAt4oE8RR+JY56Z/WoitdbYKAbEAc3b4/4t?=
 =?us-ascii?Q?u2enwg2P01n4KBq67FK1Yx0t8yNdK2j9NzjARP2R9gDK/enrsL7+1Yxeim1+?=
 =?us-ascii?Q?JcI/dV83VgcKS+hizhNkR8NTPP9nV322ECOrem+LtYNwtASSaHxMn3ZEofzx?=
 =?us-ascii?Q?tP4Oyz6+UvQZE5uboQr3lCET/ggNbB/unUqHMvM49RjJV5CdWSbXEBkorxB4?=
 =?us-ascii?Q?wSHykPlYfLC9lX6hRcz+pTY3bfpAzIKkvWEnkw0ORrqlKwsDL9zRFN736UX1?=
 =?us-ascii?Q?CzMVrhwwf7mx3dfTngvtH1ZneOPYzYyCoOPFkWToi4cqLk7VXoNzw80eQYjb?=
 =?us-ascii?Q?Udw/e/8lrkzUENmDFoW6Mg2TAUEjZ5dduwZb886QP1tptaFgIIEAkrpb8sLR?=
 =?us-ascii?Q?o+NHgOz7p2UZI6xx3KJ13jJ+6XaBk6w4qEjuf2NZVNIFU7SKpvSo/IyAiDmq?=
 =?us-ascii?Q?/sanY4idr/ahiU9nQpFVjXDQFMxhJ86AB4LgsE0eLC8Sc80At2kCb+cvXFct?=
 =?us-ascii?Q?AysZO8vi+vP1Ubd7t9w0RV/Jr4R1UiG+APcN5eSlKnTZxFROnQmGTp6z1/hN?=
 =?us-ascii?Q?azqCsIH9HR91zFETVLISxUe+QJ50hsNvHY0yJnz2mKWAHKVmbMBv9VA+TiWO?=
 =?us-ascii?Q?OseqA4GLY3TPdCu4/itHusAb1rPW0YLLXuIPLqAQSVzOIlfOIfTqJ7TPyKRy?=
 =?us-ascii?Q?dB9B3sQuULC0TFIgEydgNvIJoU36S/91q+7wQ/LKRSxpyog1wPtfgIHy8wqc?=
 =?us-ascii?Q?bDS7J83DoBhtEIH/3EjTKY8aUKP5nVAtfAOouevlqYlaFjXENQ0UUcKxnN6G?=
 =?us-ascii?Q?Sja01SlDlWHOWP2eH3pDk19uJoPiaieGcrEFcjQWIrfTf50NSn/k8E4bpSyj?=
 =?us-ascii?Q?n3QES7ChJLrXziCj4nd3YvzPJF45j3jtuN6V7JvEMFqj2V34vqs4j2sm4Z7o?=
 =?us-ascii?Q?b3vme6qxSQMNNDo5z3OWDz6kGdRAG6WEX7gqDXK61Eg0+aKDb2TBOfSKGs7T?=
 =?us-ascii?Q?V0ejO1+FaT8Ja92H2uIgO437aqPfZvO5/K/+AXxaoAEEJza28rthaM/maZfx?=
 =?us-ascii?Q?z+FV7J4lddf1MhN0bNlS2MgpjHThZJKwGEwetAFtnMRvlsXf+l+kdBy8bLFE?=
 =?us-ascii?Q?L7DDFbvWNaASVl0GcMuSs95mVIzFNEKzfboJhwLBWCCJgWswjrN1yFvjylN1?=
 =?us-ascii?Q?L1hfEx+S5q2VV0XHdCgUPittGlOcfEQejxTzupY4sqIRG5OpdnvKdQOBvKuj?=
 =?us-ascii?Q?4UApilbKtTjm/5ov543A20FXdynXoOQLXLRfEcNChahAf8ICkTQCLpIJuw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(35042699022)(82310400026)(36860700013)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 15:33:14.1743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c1ac75-89a1-45ea-5772-08de2e93721b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9366

Hi Grygorii,

> On 28 Nov 2025, at 15:22, Grygorii Strashko <grygorii_strashko@epam.com> =
wrote:
>=20
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>=20
> The domain_set_alloc_bitsize() is x86 PV32 specific and not used by other
> arch or common code, so remove it.
>=20
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: no changes, added tag
>=20
> xen/arch/arm/include/asm/mm.h   | 1 -

Looks good to me:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com> #arm

Cheers,
Luca



