Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DD1B06DD2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 08:24:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044837.1414862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubvXl-0004dl-1R; Wed, 16 Jul 2025 06:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044837.1414862; Wed, 16 Jul 2025 06:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubvXk-0004cC-Us; Wed, 16 Jul 2025 06:23:04 +0000
Received: by outflank-mailman (input) for mailman id 1044837;
 Wed, 16 Jul 2025 06:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NYI9=Z5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ubvXj-0004c6-HW
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 06:23:03 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50b8f92e-620d-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 08:22:57 +0200 (CEST)
Received: from DU6P191CA0026.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::17)
 by PR3PR08MB5578.eurprd08.prod.outlook.com (2603:10a6:102:83::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 06:22:55 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::de) by DU6P191CA0026.outlook.office365.com
 (2603:10a6:10:53f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 06:22:55 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Wed, 16 Jul 2025 06:22:54 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB6712.eurprd08.prod.outlook.com (2603:10a6:20b:393::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 16 Jul
 2025 06:22:20 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 06:22:19 +0000
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
X-Inumbo-ID: 50b8f92e-620d-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pRFOGgYChUqvdABEh11VuI0cNiEwFQVbSaO4U5oClDYAW6oxSE8SdbxUgAQbX7BI1udfYV0AaOwc3wOkDx+XhP98Y4VCYx/rA2lna3FHmF/fEFef+8B0HROdGQdD9H+F9gOitMgTjWeoH4Zb7cQdtxb9Fh0P3XoD4sA9CaUr+O2zxrv0RMP+kA3F4p+ojAFTmCMf78JjFF3wx8E5zNEui/ZZKqaQE/ZNPJHpzadgm4Rq0xAUyvF7zmZBnakEbCi0WUiFrqHcRIEejdN1y5JJAqwcTZxeo3TKkmvjVC7UIHgDIzSLjv/cGakrQGChAXkuDXoGZxNguYvMSPey5f4IRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfDaWa6Y7B6oFora8PLVT7ooDOMNy21yuR7EeNEZz6g=;
 b=QCXJeSysPFnHfTVfiTFO5UE21nEQxVdNYIM2p9iP4ks6K7wXtEjLrm2G/GKYk80HVas7Q9MAoLrrNdfLudau+J/SJqnshHkEy+G4HquoW7vmNnnoP/2C7/rvPOh7i44lgyw4CPMk87zRLgh4eSlpdQHuACF7WewmRaIiXG5Ej2mScD8UEFfu2RfhRh+GhV2RiDDPTyXLlbIroPBFiavPBoCP+4qstYpaFUW3JO83nGrdMKB/FNPtasZ5CbEXYMJbGRddj9NoZ0TudxV+VC1Y6uWEmkxEFzfkk4ocgLx5qpkxWvoKtwdaKj/FODZxDAtNkt7ufac2nTNpcdGjqniJTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfDaWa6Y7B6oFora8PLVT7ooDOMNy21yuR7EeNEZz6g=;
 b=g+dq4SvXflwjamAQK4N4aaEckXNvpmhIDMcEEejmB6oIXImFj/a3D3K1hCe3jBUVvV8/iyFE1+vJP6JGGIEzt3B4SuBei37G5+/nv+elr7yL7yLRCns9aSQsWEzRRsBtULhHgFQjAdHG5CJYf3LGDLGCg5pJWgSv6i1sd6BTNmE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkJqhxJ7Pep/jnyxV5IXQ5K7BLJce4TIyfF1lS+jtwx03FGI7ctUcWweKM4+wfBc0XSttHlmPW/1pxitlEPWRXPjvzjbXwH7xyKrVnJw0EBiISfrIsG1Np81t0DXA9495v3y7NGCULCXNfvqGQQjSIUbdcNBTxSkHdzCOmIsuxUgiTke+ymKLaJ6reliZULF49D4XGRdlLdqDS0LrVYqh7SFxIBqrkOrzdItFSIjA29FrF82E7Y7U4Kml2vBLcEXJJUS1cGTKqrUgt7EXnp9r5TgdGbKTbz1/V8Qe775xHQKcpwH5JdP2iY6YEn5sX/nzY2MWcMxYce6Sg1OPyUthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfDaWa6Y7B6oFora8PLVT7ooDOMNy21yuR7EeNEZz6g=;
 b=xKCXVM51/Ut4RydB6xH7IMippuft8fRVLyHu1t/A7fLAR8KumISbW8ENzJ8gGBOLC7qNXOcU+37Xf8S7mLKEipisgSAV7DrszkY4SW7w77i/TBVLLA6WXfwREM9Be8RathPtji9oYnYumBuAAYuhRVuRre7luKD3FvltLHVIZhpndvgFegWxBjHer7Sj84K09ZhNi23p6NMqhumft6Gz3zcCRsl7e03Odna3CTeup/U/UjSLPZDckse3nwHf0xFvhDIm0EPIae9mryGrCoCK4ZrflMqt+Uft0M4QVEcOaZFehEf6S1YKob+ipKyHXG0CiPVI+2G27EzUYLQeOl+m9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfDaWa6Y7B6oFora8PLVT7ooDOMNy21yuR7EeNEZz6g=;
 b=g+dq4SvXflwjamAQK4N4aaEckXNvpmhIDMcEEejmB6oIXImFj/a3D3K1hCe3jBUVvV8/iyFE1+vJP6JGGIEzt3B4SuBei37G5+/nv+elr7yL7yLRCns9aSQsWEzRRsBtULhHgFQjAdHG5CJYf3LGDLGCg5pJWgSv6i1sd6BTNmE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v6 3/6] xen/arm: ffa: Introduce VM to VM support
Thread-Topic: [PATCH v6 3/6] xen/arm: ffa: Introduce VM to VM support
Thread-Index: AQHbyyty9jTfyAQcDUecgzUaHU35fLPrtYWAgEjoDQA=
Date: Wed, 16 Jul 2025 06:22:19 +0000
Message-ID: <19D4F0C8-832A-425E-8DCA-F67E9DF4A476@arm.com>
References: <cover.1747925287.git.bertrand.marquis@arm.com>
 <3405d6a545c5ad8fadf7b252c98ce4120fe63fd2.1747925287.git.bertrand.marquis@arm.com>
 <d39763dd-0154-4c0e-97a0-fa3db2a8d943@xen.org>
In-Reply-To: <d39763dd-0154-4c0e-97a0-fa3db2a8d943@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB6712:EE_|DB5PEPF00014B8E:EE_|PR3PR08MB5578:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7ca823-27a9-4c8a-b474-08ddc4313323
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?oQRb4TX9FohFreVx+LVFjOJIG5WZ5hYNFa9FiZKuSuwkf5WDEtjZJ7c0ykpT?=
 =?us-ascii?Q?QThpyKOwjTUaFsY3KPjn5gOrmQsCc68u/2DXdG1AKaLODxrALlv4KuPOQrYL?=
 =?us-ascii?Q?0N7kcuAy4FhpCRPqZaoLH4kiOgNBJwzI0rb6256cMs86PsviE0/wHbNw88rQ?=
 =?us-ascii?Q?GbyoqWvRkLXcXwCeVbjicii2gGvzUeYfe88DeqFN/M1V+zuzxCquMX0Rpz2n?=
 =?us-ascii?Q?SjfaDOUz2eVZ4rGblPvS4Aq5+wK5/Fu6AjZ/GIegHP3b39v6HsLKQn+TLC+q?=
 =?us-ascii?Q?qj1oBferkGgCvlhi9EP7wHG5aAi3EiK7UbyCdFONgpCHLaDQZT+zHkyCTlDW?=
 =?us-ascii?Q?I7l6K6w2bSpLG7k0oHoAk/Aj7v+7dKQ11WqC+WM5Xbh05xDhm0PVJX306/U7?=
 =?us-ascii?Q?cZ6JXmUVak9y6JccmoKDsO8qRF2qBCLbRTMMKSZAmWWrXSWChCDU2kYr8tBZ?=
 =?us-ascii?Q?hUTo7kjJ/06Zcs5ksOGAyRaoY8do9fkVmvR/jP5ngUMFoasoTQi1sVzUitKh?=
 =?us-ascii?Q?BwOFP3ZSvi56WN24URVsFSneiVZP8ja99UrPrEgMvwMed5YBJF1F9Aq/WZMf?=
 =?us-ascii?Q?KM/ZYbriCJKOeDJiUC0iOSDuUM8XcY60z72gqV7CDbLMGtuu2qlB/n8qAysN?=
 =?us-ascii?Q?w58mMP9dP+3fICukQ54kEpAa5Llzbw9f1XPxlZbMlOUJL15KGjWgl8z3sZpZ?=
 =?us-ascii?Q?JlA62avePaO5n03lQ8ICLd+MDQgKiJ1eUOXLY1XDR8BFbK7Kn2m1osegI8Yx?=
 =?us-ascii?Q?reh1aU3ZbLjPyImaRiExbHY9sIHk1lRfxPBROiohxedNT4V3yKCfHiINjvN3?=
 =?us-ascii?Q?HIgBsmkmwhEDHTLNsUmEwo/Wv+Y/ib5tjw/AqzlyQEOEDhdLVuewtEG0em8z?=
 =?us-ascii?Q?65VEs+MsMvGuyAn/cQ33iiq2OQBWXzWPn36LW2gHfulF6rqmHeqgocRhqOh/?=
 =?us-ascii?Q?JLfQ0U1dpmgkAQgMJr5i2Ytzl0HX5r3SDztZoBhVkXk0E13c+rJKze8QDkvw?=
 =?us-ascii?Q?Bt62wztTGOFDEUbvuzdhe0wt+4k8ylsrQnVBOXDQp+hgbZRXxLU3rf21kZIq?=
 =?us-ascii?Q?LqjIbpRwzaY2Y9SSOiA8A67s/532uaG8pk9NReZstKCpY8A9VacfbuycpAaw?=
 =?us-ascii?Q?GawLZPV/RAHoUWeLiATWW92AExU0QZnCBi/k/+SZt7MHI0tilit8le6rmTcy?=
 =?us-ascii?Q?weaPt2q5wTk2Rbcm/iqrW/7QcRgv65HsVfIXodHZsdOgfmS3mEnN9Kpqo3CS?=
 =?us-ascii?Q?rFUQRYwqcPIMPeItt08jW3/YNRCBVzGb9KIEmwYZK5Q0wiDee2MZrqEwcZJ5?=
 =?us-ascii?Q?m761R4jFDQbFMROJ4hSILyCOxxs9G6A0jIDj36Ap30edIGlNCoyV7JHT9LlW?=
 =?us-ascii?Q?msnB5gD+ZAq0hWK7EzybeTBFhvQ3hoEK6vzjkGF0KSr0uWlv8AOGKM4KMf3s?=
 =?us-ascii?Q?ERw9IOxwJj2N1/uHDR8Os7+ry/YRm/kn2Z0lSElMIatmLutljOcNmQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <91D74D3BCB8D2841BF38AA5A89158D9D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6712
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	451101f7-22ae-48a7-1014-08ddc4311e3b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|14060799003|36860700013|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jxDdCNklufNw0t19TrSHjBEL/qG993XB21Jtm1/axzTbevGgWbUzNjDBu4DZ?=
 =?us-ascii?Q?dS+XPqlLkQhDTurrFcb+IIoxCrxFGJymVEePO4V00GWZrT9BPpx/CoycDaKD?=
 =?us-ascii?Q?PmiN3LExADuAAlGYP17rJkj18MyJIr3EdN0szkEFFOazyFaResqZKxe7rQnN?=
 =?us-ascii?Q?TKDFd/kTuEQHzq0HQwnFrTDOLEpUEgjeMKmu69S95Q/oBY7G1eXlLXUZqxTd?=
 =?us-ascii?Q?hbLTSnezuo1Li5g+Khm2kHmiIgHq+r0lfAHu+CR8D4kR6MXM9rIRvIDt/qkD?=
 =?us-ascii?Q?NP5nApOKDEGdpvWjCcZ1qECsoJyH/fBObgDsQxzOYzXHY++fXR6CMKfHGp25?=
 =?us-ascii?Q?UriyeruRe8qY+boc462UGl4XYtOBNeZRCLh3cuQNI+dw+pfc8nPkheHgcEV8?=
 =?us-ascii?Q?7bWZ6kwGSvcENnIirRKZb/SjWBzRLkyRwLxOK54kQOgFDQIwhieZ4eT/x1KE?=
 =?us-ascii?Q?5Ionx3XsvZfRqoHoDjvGsd+l3ydNRNI1idBy2BL4Gbe3IE+BKIiaQNH/RzWA?=
 =?us-ascii?Q?8XRYz2xqttsGCbtGhrGnXJyAVktco0ECB1z2o8ybf8wdtjb2fvLE2OzfQdMv?=
 =?us-ascii?Q?egVO02tLQpqMMpskfro/eePfAaHIjAFq0F1oUmiSE2Bwi0TSnaSIdXfqWwcF?=
 =?us-ascii?Q?JqKgOuw3XCOaUWgPdAMmgeS64W3vADfK3QWM3Ehmfpnq9tOoC5bz7dwvHfbC?=
 =?us-ascii?Q?+kh/cOK5bo5nYAdhRCQ9s3mnaQ3CV2vxk5nvZRsZK01HcMGhgc8XrjEmywO5?=
 =?us-ascii?Q?83cx1QWiy46zJ++IP+o9YuWHpezEiXmscYbVlpipMLVh7ciB0VkOLbFYLYuA?=
 =?us-ascii?Q?tTsFYY1REACfsqr4Ixm/FXrs/tcZAh8C1KOI44aSFmUx8Tk5Bh5CCZkKXzfg?=
 =?us-ascii?Q?S0tw0qsLpb9kUhvDjhFndgQyPshyLUv0LWh31smJsChubYtGuxqSGy6bLYTv?=
 =?us-ascii?Q?hssOC1TC0eoYp43ofOFFLYCTssF6d4pz3xxTh3SUL+DNfgK8XpOFBvBTgsng?=
 =?us-ascii?Q?o6nYMkgF74kmfs8Oa4/+o9acCACb4NGTSXGSTFnsjv5gHkb/21lwaL9OvTvo?=
 =?us-ascii?Q?3FvGwdhQhvYwAPuqXW90QokFtB4W1G969zQtzPu8aprRjlBpm6BASXzPCUvt?=
 =?us-ascii?Q?0Tt7RkzbVEANtZMXPQ6uc8RbX3ttDexBgh25l8+izeN4awvnrJLNnrn1M0cB?=
 =?us-ascii?Q?mnAbMdi2avPKX2E+hksk+XP72ugoArAHZiYcKcN0yLghgOXiCQqIn+ibtU/N?=
 =?us-ascii?Q?++KFmmsH8rNTL/wtUdDIsd6r4CjkVtNd/s+/TNtUujak1APrSF9WUc93wTyd?=
 =?us-ascii?Q?iFCTQ0PaHhI3N0QcbqX/Z95uxiCTBndrmC9CS1oAqXxzGfmHH5qN++Iph1ta?=
 =?us-ascii?Q?xyTBGdFhk+5Gt3LMc3o6CiHcGkzPmT4iusuZEYxn4a3Gjw3ZUebAFAEALeU2?=
 =?us-ascii?Q?AzuUHTqbhDLicMuICwMxcBctyNaMc8gu2v5+jsDt851t22i7CtlBC7DO8jqb?=
 =?us-ascii?Q?0wmmAoE+6udLbEQU63BIy+/mkOEYiWY3hnr4?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(36860700013)(35042699022)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 06:22:54.5955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7ca823-27a9-4c8a-b474-08ddc4313323
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5578

Hi Julien,

Sorry for the very long delay.

> On 30 May 2025, at 23:00, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 22/05/2025 16:08, Bertrand Marquis wrote:
>> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_part=
info.c
>> index dfa0b23eaf38..66ea1860e97a 100644
>> --- a/xen/arch/arm/tee/ffa_partinfo.c
>> +++ b/xen/arch/arm/tee/ffa_partinfo.c
>> @@ -150,6 +150,67 @@ out:
>>      return ret;
>>  }
>>  +static int32_t ffa_get_vm_partinfo(uint32_t *vm_count, void *dst_buf,
>> +                                   void *end_buf, uint32_t dst_size)
>> +{
>> +    struct ffa_ctx *curr_ctx =3D current->domain->arch.tee;
>> +    struct ffa_ctx *dest_ctx, *tmp;
>> +    uint32_t count =3D 0;
>> +
>> +    /*
>> +     * There could potentially be a lot of VMs in the system and we cou=
ld
>> +     * hold the CPU for long here.
>> +     * Right now there is no solution in FF-A specification to split
>> +     * the work in this case.
>> +     * TODO: Check how we could delay the work or have preemption check=
s.
>> +     */
>> +    list_for_each_entry_safe(dest_ctx, tmp, &ffa_ctx_head, ctx_list)
>=20
> Looking at this code again, I am a bit puzzled why we don't seem to take =
any lock and use list_for_each_entry_safe().
>=20
> I was under the impression that list_for_each_entry_safe() is used if we
> delete an entry within the loop. But it is not used to protect against a =
deletion from another core.

Yes you are right, my logic here is wrong.

>=20
> Did I misunderstand the logic? If not, we possibly want to use a readlock=
 (over the existing spinlock).

Definitely yes, thanks a lot for the review.
I will fix that in v7 by protecting the list using a read lock.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20


