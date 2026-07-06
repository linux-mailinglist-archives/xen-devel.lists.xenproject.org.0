Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LhyBLTvIS2qoaAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:22:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF568712838
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:22:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=selector1 header.b=ABVAHCBl;
	dkim=pass header.d=arm.com header.s=selector1 header.b=ABVAHCBl;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=2")
Received: from list by lists.xenproject.org with outflank-mailman.1355411.1610184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgl8b-0006UI-HR; Mon, 06 Jul 2026 15:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355411.1610184; Mon, 06 Jul 2026 15:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgl8b-0006SX-E1; Mon, 06 Jul 2026 15:21:37 +0000
Received: by outflank-mailman (input) for mailman id 1355411;
 Mon, 06 Jul 2026 15:21:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wgl8a-0006SR-Bz
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:21:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgl8Z-008bwy-28
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:21:35 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a4bc7f3-bab6-0a2a0a5309dd-0a2a4501cf46-18
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:21:34 +0200
Received: from [52.101.66.50]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a4bc7fd-400f-0a2a45010019-34654232fffc-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:21:34 +0200
Received: from DB9PR02CA0030.eurprd02.prod.outlook.com (2603:10a6:10:1d9::35)
 by DU2PR08MB10131.eurprd08.prod.outlook.com (2603:10a6:10:490::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 15:21:31 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::48) by DB9PR02CA0030.outlook.office365.com
 (2603:10a6:10:1d9::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 15:21:31 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 15:21:31 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PAXPR08MB7333.eurprd08.prod.outlook.com (2603:10a6:102:230::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 6 Jul
 2026 15:20:28 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 15:20:28 +0000
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
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CfG59zO7DJLEY++Jiu+ZPM9igR8BA3X7KRCKk1BV7ZlqVkpIUR4RXCu6rxd6qRMHo2S3qD+Xzlg9CQVF25GSA0UcZna8Wibst8Jr6NfUTaABm5F8FmpvTDXsLHQaAzo2n3G7GI+C/NObB/X8lBjyKRisWonzdnNpyxequrxD/tR36Nnh/bDXJAoDdmvSpkTez6bBTZ2+Vwl6THcXA3ktmTLtSO8d6wYcRa1GWeuUCB/2mGuVNY+6dodRJut8b5d8700flihGt64d/x8XhTJA3VC0n1yGFtlpIM9kF7uBx047zHvoLPzr9lY+TIrEXb+ajXWoFbErZLwxcJ0PQatZxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZ4LXnAodtbjIFQjpzGCIllxKv2xm11MYhrqPEunvdE=;
 b=pUlEeKF9J6dybfSvFvEquL5BHy2smTFXfRn9/EcYzyCEwBp5nWlE9OZtImcpxcUuZOLfIScpC8A50asIy27mXHHHgPDDngxoC8ux3FksV+/sK/VsD4m3P4A+2hOAV+codGWPZoF7S7brpMp7aMrP2p5uEbQVu6GkJ2clf+Gz66eAISxHXqOlve+4RvT5gXkaoRkwo+VoI0EPtwwZOPsV6DO3jK1CGl2cWV7CSrgWxnqgLrxTkYpQUJBgceYY2MLcW0hdhJxdX1TWt2SdqWH6tISefBa0uBJLefu5XXcZq7vfAmhFm0Q1wPrAQE1QLFN0OVtPGKo2G25oDAf0HoqlAQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZ4LXnAodtbjIFQjpzGCIllxKv2xm11MYhrqPEunvdE=;
 b=ABVAHCBl9/siaivu/yE5neQyKOBcvTJfT6zb3wuLWes6axBYXaqMEU8txpx+zxLW0t/hWnrMgiIE1MRBXzF/8Zbm+ON0DFmMUA8UT9Vk4zlRckmcU/PocDlZLmMAjZf4dwGe8v7keIzEpBIbOGk096hmXg1bz/Jb1tvCCM303qs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHJwstbwREMUzEfLnl6moWCRdgebeydDoVqNsR9k2o/lqFJU2/7TFuHghYEkXomNdvLgQcBxGaqzoSdyqPlmvrUWUttT6BEl9LCk/dCxC9/onCc540m+ot0ANPrZAVdiEBNu92fQikwRF0KA+iXWidqgb2S2iUtfnF6PJ3KH781TGZZSBDpW7FNzfYGnzCQ3E4C3Pfg02j/Glges6KsFohb1mw8zmeY5Pe5dKYQ7+UyathBUBsDJu6v+f9hDJ3HcoydpWlo/sC1h361VeYp16fS9DOomdhJDGW9/h4pBSFYW2atCSzPBmmHh6YMJ2tMNXggHJlMZi0J2qTlNN9jN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZ4LXnAodtbjIFQjpzGCIllxKv2xm11MYhrqPEunvdE=;
 b=vztBcFNAIh1PYEuD+QrmT25mwKaKt/D5JS+UeRCg1fuc//bJrUXjiA8Zqvh+nFx+iEWcpsAYgS2TS7R3lF5eIzL6bzc9nB4BrSUFpqJKrzK4GfS+7K1EYtBY1rfikZZl1jUmxEoBY9RR/m9SI+MbI1uxBiJovWKcCxJ8eLR2kXH507jsQ0iDK7z51hdUuuUfa0za+7ubsTlHqG1Rzfll2bNbV6z0UAIcxB2V6wK3w7FM4Dbvnv3ry/P2BlAuvyQlb5Uh+9mLtnIvSCLYvhKKNDusNLe1ITNUeyKneVmNcAJIj0kpJUH+g0QCVlXEX/WhvSbwsFYhjIB1zyCHBJ6k/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZ4LXnAodtbjIFQjpzGCIllxKv2xm11MYhrqPEunvdE=;
 b=ABVAHCBl9/siaivu/yE5neQyKOBcvTJfT6zb3wuLWes6axBYXaqMEU8txpx+zxLW0t/hWnrMgiIE1MRBXzF/8Zbm+ON0DFmMUA8UT9Vk4zlRckmcU/PocDlZLmMAjZf4dwGe8v7keIzEpBIbOGk096hmXg1bz/Jb1tvCCM303qs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3] xen/arm: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Thread-Topic: [PATCH v3] xen/arm: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Thread-Index: AQHdDUx1aTYp1QlnvU6G8jJKuMyIC7ZgmzWA
Date: Mon, 6 Jul 2026 15:20:28 +0000
Message-ID: <DAB048A7-AE4F-4E28-A613-8FFE4F0AC359@arm.com>
References: <20260706133553.3026786-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20260706133553.3026786-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PAXPR08MB7333:EE_|DB1PEPF000509FD:EE_|DU2PR08MB10131:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b81cc1-5f02-407f-3d11-08dedb7241e3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|38070700021|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 oEOZ/vRiDrmg+9sUFvJ7eoDqYTW3mhV/ML51TY2XUtaK5FRcbADlrzWRKLXWy7k0lpHXJSi85jsivnz3V0nP57/dm5s7j40Nis/aWcXuZGtfl+MhTvwKy8Xo4RyFgANwkY1gFRKmzT0OD7R/Q/H+gHHPxfddL7BziIn1NDFjOsMXKOuJBJzqSISzlHNjApE0np5gYxevglbKiohtDjaJq516WkouvxStls3kYYEf9zUGZTp5OAuzEZRdoxiLJ3zC2eD6SEyuVoWQkSESZ8xyHi7zBYEVi5V75sjh2sCkWtDMs1z/RcSXm+lnkJRmkngUVA4R7jorOvUMwFvVfWjlgPS1GVZeGuIoK1pbrQM+9Xk2B0nsi8H9vPREZ9ac+E6irsmF7voQZ8+Hn38MjKL4xZQR/Fedl+4sQYDoiJdtCfdmf5YZGlBONDBf/i2cU9+l8TY4ImgnbxHBqE7XvDxOth4ei0BRdH1VfEYPJaYptx6ZFKuhBTADCQAyOrP173L80OQ0knyrW062kR6NRJLLa1PYgoVPu/FDelEJIoTIUbqkzVez51okiYsq1hZpU+UEEa0Cg3a9PmHwTyHwFtEiq/hEmvjfB4UqvfnGkAmNWoKX167JtUYkRENArumcB7smuZcjE6q03jyUCXkEtLKV8rsiBtO0jcytUQMsgivBUUwQZus6WiNNQdEhqm8H0s5VcgPcsCOoA4/64gwR+I4p/N1Jrxgr2XUh6zTgKvdCRrA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(38070700021)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A3FEDB4FE72C748BCFAC002E5377567@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 a7dRmMlNyV0/RM+dnVBBE427zaT3MOJ1wb8GAdY6Fde7EZzS5gOF6/2l+isFX4tKxVdz2+UxK7gSngd44aELnwLjaE2GuBV8KxqvwQC/DoFyClqV9LZeGK06smw3sBsxSm5iW6u+PACWvV1xuWosXkZ/7AzqiAYi1zVjAT84mELZCUNNaafYvPW2RUacTllcF2UNY1pkm7b5gnX8Cjbmn1Y8SEvAEr3D6AduggNP834hQSnYRnQpOADq+cDXDtba2SBPGTL6EB56o23gN9fsHZ7K8f9J0lWfPVGFUC9Fw51MDJRV9Q4r9ye5bZI/53FBrGeWqoly/6j08PFPtum1Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7333
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f3427391-128d-4b15-f5b2-08dedb721c62
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|14060799003|82310400026|35042699022|36860700016|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GOCumNf7veIyxx/z1i/29yDzkBxBPH6sPShVn//08fS9dw2X91IxSuYlbwMoh00LFo9AeznpoSGL2u23QxJLbEhn3aKXY4G/iB17+YIuEreqRnyn/bx/crtf3hZz8vCyNS9hY80Xb3tCanUvCBwFRcpdW6EzHv9nHkyIiPDBuTaqn6RhpnTyECll7hp+VOhWiv+KA46DLXYrVZsWwDjcL8ZpF8C8KlMf8HsB+iOry+66evukTNVHW2fCCcnNnbxF2D/QJBwVf6DH6q3RZyzLTC9SJVQrbfeNun1WXuOczBdqQmjkvwqstzza26b4GN+0VCyRVxZJ+zBKyLBj1EeVkz7kWRvxXJGBRft6tRmIIPsGM2Phj8Kl61lEFT9QfaEXlnLwehbxRASN5Rx9u7ti7iaOqus4QzNZ0ogTvM5FkWmragl7nOGJtjwPHrmSSOzrXGf49rXArOGJ0PxT3Qm1uJsbz79RRc68gL5g+pQsVe/A4AQgueAuQiV4Q9kYEVoOzdV8vkDjkE4ygkU7KSlS9cCVbz53c6GDvQANm21X4xaLgntjN+a32Usg4gMYKlcsaCag8l2GTwyHZkGyU1q06HGGw+fkIR3NpxmSlhq09kwy7YgUdoU1fzgkyz+SpVMz5YzmS+3uLq2Jb58UB+Z+QGkb5hix0ePuEQYqGm0C8pwf5YiVbjq96H+HwBI63ugiaSmZ6B0AXChm6HFNn0dhKQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(14060799003)(82310400026)(35042699022)(36860700016)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T2iVDn0DFJYmxNTcBwtiEjP3SDdYxan3x5CmWRhzg5JorAAddT4VeTN33rTUQENQcFpZ/4zCgSJNGn9+RsyC/3Hsq/4Px09v8Uy9wtYECbRIHGerssgOi174wb986ulQ0DciFKw/qDUdxdA0vvhhlsf/UfMCn7QV0Edvt7r9yko798E1RnYGzhVYESisF1kMcIyHNLDY+vXw1VpsKi7nbLO+Ss74Eq4nBL+YVLrHzJUQspf/Wq21ukn3ip50bKmG1/oWQaon/mckHkOLOsFdE1TGmhY+TWe1bKk+r0P5vRRHzHtbAKQu//MRb/ykVYoW0tiVMMbHvq2GZA6HlvPYXL0c1+aluryUgtQSr46Rr/BUp/xUINezjXoZUeQZCS3555P+uuhdzrIvEqpTBpgeeQ/ndzvuAPnZ32s/bHETxfEWZ26u6GDgdbwasrRCpxyY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 15:21:31.0248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b81cc1-5f02-407f-3d11-08dedb7241e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10131
X-purgate-ID: tlsNG-d62444/1783351294-834CA1E0-0FAEB614/0/0
X-purgate-type: clean
X-purgate-size: 1960
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,arm.com:from_mime,arm.com:dkim,arm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF568712838

SGkgQXlhbiwNCg0KPiBPbiA2IEp1bCAyMDI2LCBhdCAxNDozNSwgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gQWRkIGEgS2NvbmZpZyBv
cHRpb24gdGhhdCBsZXRzIGFuIGludGVncmF0b3IgaGFyZC1jb2RlIHRoZSBudW1iZXIgb2YNCj4g
R0lDdjMgTGluayBSZWdpc3RlcnMgWGVuIHVzZXMuIFRoZSBkZWZhdWx0ICgwKSBrZWVwcyByZWFk
aW5nIHRoZSBjb3VudA0KDQpUaGVyZSBpcyBhIHR5cG8gaGVyZSBhbmQgaW4gb3RoZXIgcGFydCBv
ZiB0aGlzIHBhdGNoLCB0aGV5IGFyZSDigJxMaXN0IHJlZ2lzdGVyc+KAnSwgZnJvbSB0aGUNCkdJ
Q3YzIHNwZWNzLiBzL0xpbmsvTGlzdC8gaGVyZSBhbmQgYmVsb3cuDQoNCj4gZnJvbSBJQ0hfVlRS
X0VMMi5MaXN0UmVncyBhdCBib290LiBBIG5vbi16ZXJvIHZhbHVlIGlzIHZhbGlkYXRlZA0KPiBh
Z2FpbnN0IHRoZSBoYXJkd2FyZSBjb3VudCBpbiBnaWN2M19oeXBfaW5pdCgpIGFuZCByZXBsYWNl
cw0KPiBnaWN2M19pbmZvLm5yX2xycy4NCj4gDQo+IGdpY3YzX2h5cF9pbml0KCkgbm93IHBhbmlj
cyBpZiBDT05GSUdfR0lDVjNfTlJfTFJTIGV4Y2VlZHMgdGhlDQo+IGhhcmR3YXJlIGNvdW50LCBh
bmQgemVyb2VzIGFsbCBoYXJkd2FyZSBMUnMgKG9uY2UgcGVyIENQVSkgYXMgZGVmZW5zaXZlDQo+
IGhhcmRlbmluZywgc28gYW55IGludGVycnVwdCBsZWZ0IGluIGFuIExSIHRoYXQgWGVuIHdpbGwg
bm90IG1hbmFnZQ0KPiBjYW5ub3QgYmUgcGlja2VkIHVwIGJ5IHRoZSBHSUMuDQo+IA0KPiBnaWN2
M19pY2hfcmVhZF9scigpL2dpY3YzX2ljaF93cml0ZV9scigpIG5vdyByZWplY3Qgb3V0LW9mLXJh
bmdlDQo+IGluZGljZXMgd2l0aCBhbiBlcnJvciBtZXNzYWdlLCBBU1NFUlRfVU5SRUFDSEFCTEUo
KSBhbmQgV0FSTigpIGluc3RlYWQNCj4gb2Ygc2lsZW50bHkgcmV0dXJuaW5nIFJBWi9XSTsgcmVh
Y2hpbmcgdGhpcyBwYXRoIGluZGljYXRlcyBhIGJ1Zy4NCg0KSSB3YXMgdGhpbmtpbmcgdGhhdCBp
dCB3YXMgYmV0dGVyIHRvIGhhdmUgYSBwYW5pYyBvciBhIGJ1Z19vbiBmb3IgYSBidWcsIHNpbmNl
DQpBU1NFUlRfVU5SRUFDSEFCTEUgYW5kIFdBUk4gd2lsbCBnbyBhd2F5IGZvciByZWxlYXNlIGJ1
aWxkLA0KaG93ZXZlciBpZiBpdOKAmXMgYmVlbiBhZ3JlZWQgd2l0aCBKdWxpZW4gSeKAmW0gb2su
DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEF5YW4gS3VtYXIgSGFsZGVyIDxheWFuLmt1bWFyLmhh
bGRlckBhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPg0KPiAtLS0NCg0KV2l0aCB0aGUgYWJvdmUgZml4ZWQ6DQoNClJldmlld2VkLWJ5
OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGdtYWlsLmNvbT4NCg0KQ2hlZXJzLA0KTHVj
YQ0KDQo=

