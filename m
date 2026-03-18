Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFAlMV5dumnFUgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 09:07:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4D12B7884
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 09:07:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256363.1551040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2lvY-0003HU-1I; Wed, 18 Mar 2026 08:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256363.1551040; Wed, 18 Mar 2026 08:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2lvX-0003Ex-U8; Wed, 18 Mar 2026 08:06:51 +0000
Received: by outflank-mailman (input) for mailman id 1256363;
 Wed, 18 Mar 2026 08:06:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cC/N=BS=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1w2lvW-0003Er-8I
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2026 08:06:50 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 697033eb-22a1-11f1-b164-2bf370ae4941;
 Wed, 18 Mar 2026 09:06:48 +0100 (CET)
Received: from AS4PR09CA0011.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::13)
 by AM8PR08MB6419.eurprd08.prod.outlook.com (2603:10a6:20b:316::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Wed, 18 Mar
 2026 08:06:44 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::31) by AS4PR09CA0011.outlook.office365.com
 (2603:10a6:20b:5e0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 08:06:39 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Wed, 18 Mar 2026 08:06:43 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAWPR08MB10209.eurprd08.prod.outlook.com (2603:10a6:102:365::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 08:05:39 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 08:05:37 +0000
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
X-Inumbo-ID: 697033eb-22a1-11f1-b164-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jJkQvYHqGymcKuGeH91/4+GpQHFC+Y5ELkiD6X8dCiIWWvexg354i7mLsVkuvE2R67fZcJ0HUB6SGEhatvtT2s6lvaCOsKAwJT6Mc/d2bscU1cIpdteA6EeCFLso4g5Y+O+oECJNPBTf2rtrojT9EYZJcah6z9XPtsvRAZS3i/pO4jqDQPAb0QEsk5xvpDUSCCcSor5AbOWT18njSDO+nyEX5tIMFeH298UlYpXQo3SO8YTj5TBPZ/FnQCpk3kkfKpBXGnHhWB2kvQ5LZ66PnsHhExh2Y7b1cibaGQkxLR+HAFA42MQ+1JTJurA+Vkc7VJ/wynZowlpbxyrRLbbs/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e06hFaaSWzx0NqsxDjm0VeDdRrxM/xNlXBEnh3vcgR8=;
 b=L6cr1V4y7QC8lInIMs+ARtGLEIby0/HqSk93uB/KK7zjPR68ocl5kwFfXapIboIMJCp2NmgtMyduWNAjzQxQY/xHHfqgGf0AkkRwwvY7jx6CQ5yhdRoyLiee8RGvegRgl+XdIGBTLzGIIrr/NiSMSdtbAtMTD3erslPlHnvVezwmG+Txm/rjQBHH/cUcPaMSIq8V58ThvbeDJoxnyc2nm0y+59eYc3PPBxJ6GNgY0m0k1+KxA4jXTa5AU3kDwqOiEzsb87GcMVc8yLDna+9Fuc6nUo1BCObLgKbd8F4osoiPLGXW3n5HjStrVTTbi8rPLiix+ljQKqHK3iGCP7LfLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e06hFaaSWzx0NqsxDjm0VeDdRrxM/xNlXBEnh3vcgR8=;
 b=GW+D6Ur2G+LA4ZKQ7KElTjbvEW2+U51NFl2P0HAwMNRwme11EQinwtZ6lip5vDBsRgPCpH0zpTOVAGr6Jnx5N8l9MuA80Org6Y384ehlSBZ6WCa3kFEJpg+ras4UmqPA43YYPMtqwN0QhA/l7gsIW7Fi1IxstQMw7xcsEEGYNkc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6uK+LT1CMkp8SZd5Ny2m4rZgu4u0EKaShjPRiO80CUdu+jtyHXh9Icort6lHEOfjucYyLTG26EVgbfwU+octV0kD/Dg8X4BCc+7K8aQqhXasn2RuWIuuUdmX4zmAwEIUfjBpVF0hAh0tDx9xoSusBg+gclLpSdnBCmI3xktiQKDHQdhExpNGavM5g7ceAQWjh3f57IlmjYx8VhiME5u4LbwVz5AbWGPElsrqLxLLzedorPKs0mfmTjeWCP6pwnTYJ5AEAAKt2KW83fW1pv0Z9mpqoWcXTOi7guxYGp5g6sVCV39XCN3f/C+yLlorpsHjqsPT/LBGaQ1Qj0nCfmMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e06hFaaSWzx0NqsxDjm0VeDdRrxM/xNlXBEnh3vcgR8=;
 b=frbz163zXzpy5oHa3CQ324WiLnLbj7oQhBcS5ZlbZDFgvwKb2qVSqJZEthw3ITd570aCUvx/Rr5U9npZz8Ae1ruTVQrDkJqQTSwdprHZvnbpQeUJiC9JkS/f4LCs/El+s1r80/s+MsQ3se8CyolJb9A9IEbO/DxRBQ+dbdivX4IvtR13f/w39uRjh30VwjChbCpklve9mIQvgmm80csDLlkeJuXvFJ1iXA39frzXOwRYtr2yeNSVNSonH4LOcrZnLlQ49egJjJFGrzQ6K2sk1+M4zARcaeex7FLBBcsNvRaN8t0jqPiHQ1Sce2R2CBoNrOmMh0r4bRnn2ocLVJpXwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e06hFaaSWzx0NqsxDjm0VeDdRrxM/xNlXBEnh3vcgR8=;
 b=GW+D6Ur2G+LA4ZKQ7KElTjbvEW2+U51NFl2P0HAwMNRwme11EQinwtZ6lip5vDBsRgPCpH0zpTOVAGr6Jnx5N8l9MuA80Org6Y384ehlSBZ6WCa3kFEJpg+ras4UmqPA43YYPMtqwN0QhA/l7gsIW7Fi1IxstQMw7xcsEEGYNkc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 1/5] arm/irq: Keep track of irq affinities
Thread-Topic: [PATCH v6 1/5] arm/irq: Keep track of irq affinities
Thread-Index: AQHcsgQfYo2+uc7QB0+uZY6Wrq2BgrWz9+2A
Date: Wed, 18 Mar 2026 08:05:37 +0000
Message-ID: <63FE871D-35EB-45F4-A2E1-3359116C44CB@arm.com>
References: <cover.1773307749.git.mykyta_poturai@epam.com>
 <733d58a26766a1d15e47447ed4f3cd299dc28cf7.1773307749.git.mykyta_poturai@epam.com>
In-Reply-To:
 <733d58a26766a1d15e47447ed4f3cd299dc28cf7.1773307749.git.mykyta_poturai@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAWPR08MB10209:EE_|AMS0EPF000001B7:EE_|AM8PR08MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c02eb26-b975-4484-3fb8-08de84c54af5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 XH9Tjo73jkBYOK3EIwrxcpbh+OBPdKCtGwkoVktzjWOmIPhy6Eliy6psRgfkCbZhPU0dhIGlic69LKxbc/V97CKnC8E4ydX0H9eNiP8UpGKLQl2oVfAFjdfE0JPiMFuNDD2qFnlhoLsMWXGk4NLZrp+0L5tHEGmtYKkILJ6w7ox3Dx45a0RR8pmI9Pca3RRpviq38T5otf+8A7QqaZPZ8jOnl79sWofkKtPg/EhsjquGgMRx7UQaNYZhQJJ2FsUCpq24M0rvCqCHD18NzrtTfqfDdGj3NrCxVdTlhPnqSywv/xosoDAmZwsKKcvwRKlhIkZHooJrGcoMP5jKL2/pF36M587l6ymSMTKSj9GjP2xWEyDIRXCBEpghAErr2pxo3C5X7p0R+irwp0AufEaSE9hw81/9aX1nnr98zAiQHrDut78jHCjFUq4LBOkhQVeZ+o9MggIKY35tEdqADUAaKu6Jxy9B4Ba5rUnlaTx6zj03LQ9yIWw4gixVwA1LaOiq6RlJyqQUy1yNVsqGh8TG5A9hp4PGxfpr4ZD8SflhCW7QSp0VJZv0yrF/9AmbifAj0x1QE13XWAl8tbBCZytaBFLm3SNh8CTiFZhcL7WFId644qgRy4Kx++sdAqjqsoNGsfQ4nAcaH2k58l6EpObAHzpaxYrSumVauJyT4Ky3uQ7UFBcqg6Vyd374b+0gbfarfwQeu7VKiyIFkSjPzkNYjKle9S3n+xWwWvipE65W3paENO2rpQM5WRsaD5yNUQDZGq3mcpnvFX1EluERB0ehGs5tG9vm6QdJtDJP4tGovVA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E6CB80E92B8ABB47AEB3DC5E2B7BCFDF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 D4O3vfIemz4Dx8YXVvC3N2Me8eSMV3sI+GKWP3WN2cmzdhPXF5gelriPrieWRBQJGE0AQolOAGWsvbqcFVuc7DmrOyU607cqrUKbRj9Ac5dwh8F4NNLGrUKh9UpgOXRxz4k2Rhl1vUJFLFIBwOimtvWwMmX90EjH4ew74Ow9LOE39ZE6Hmdbh36cm8JRI96FnzQGcTLVGbZWrj+ub91/ubY7IwcxQUgG/x9Xi319mstPs+TjjhVR6xoCu+x2h2noiTaqxl5lYwMAZglP1xaTvd9kYuB4kvHQpRnh/k4bENqYMUtLqIRf5YwQHIay96CuHkzU+73mh2fGOFb4EIUDfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10209
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	06353ab7-539b-41ba-b552-08de84c523e4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|35042699022|376014|1800799024|82310400026|22082099003|18002099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	HAmlSCdom+vG8gfoZHSVk3yP7eBABPFehHLZ5PbQ4Opo17wOPOQ650tkt0u1tMMJ92TDi2U00qr0UsUwxO5IJIquxM4Th4ZxGuT40CqWNnVomWN8W00MNJjdXgJKSb4UwOtXTYlUgsAF6v1fDSR0BA9arPXB0w1wc4pGECFQd4CqZTgp8tTsTRf90DOKzE5xh1rX9ilPXmBTCevDk9yckrHp+WEpRoa6YmLcfeM32bkOiatV4aV6eJ8AKodKyxho3+g5PO85v2fwJrriRFUFv0IZD9OQMnLtPyHU1bahaZN7+8MOVAMs9B0eki6pHL2nWeIqXG2ianXob0sCszZfRB9Y7IUcoFkEk8s1YjVp1CCIEpSSGQ95/MmmZ/OitxTsE2tnKlm439yCDwrgL7VGUUnlATDHKjI5K4kLu1cs++I7lhwA8ODyalAbMHRCZ+Mcp6RrkwQQtG0qZu/vjZtzp2keh6WiwubiQSYvp27A0vmOVVnDoQxpB0zXdoi24vMkmCGq0WvkZSyLSOip6vUFI5X2wv36oGK+6utSjRY+Oum9nGG3w21SsOj4ebJfgxA2ynC/Zs6xEDYwhGbcxk1DD1Y05Ploqvuul0ie/xMPfDoABaTJT09DaQzDl71me04AcHaXI/3ftkXVTqNc8L1Ynk1y0AWbJQYHqJxEaJjAaM9CzNvK0amiJVSa5meSm7PAtDlRwPKxYwAkDG9Qo2d90oNMRj8kxAMUqAfAZZ/8SxedkIXbi/RAG/wF5BaiE0UbMZowY+UPjYlVWxXiJnhfiQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(35042699022)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qy5UCfzya8P9nH6u6o+PqZ87gBjozQYutIj49YXVydvH3MtDAjvi+wXPk0+Mf60lDBi4UNG0FrSkyML5mnnfXirTp4fzy8Bunf8SJSvpAXR60U1XXw+sqs2jQOLlg8zJ3U5FPyQx6nScKMleMi7q5MFuijOXqAcj593UTvzciTMIjDtCbZ1x4cc0gBCjaWM6Y4Dq7IMJ5p9LB3zZPUe0Wy7v57p6fgw1KXCGk1CkyRsbaT3yl7wSUgZ7OszzwJrQ3vV2iAUXDI3S/BcYGLK+4j1eakPg/hcs+9JOD4CVv+OqrZeNNt0FxDBO3vNieKJlT/12ISFPq+c4uMJF1uVqE+KtsjaMj89CSvQtMjAAnWtE27g87CuG6p6ltCZut6sN3BSN7RRvXzk8xJqd/+MEEj0UD4pM0ckKW+WEuc0pTLAzUlLTEQpCdvrF1QNBaz56
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:06:43.3115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c02eb26-b975-4484-3fb8-08de84c54af5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6419
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 0C4D12B7884
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykyta,

> On 12 Mar 2026, at 10:39, Mykyta Poturai <Mykyta_Poturai@epam.com> wrote:
>=20
> Currently on Arm the desc->affinity mask of an irq is never updated,
> which makes it hard to know the actual affinity of an interrupt.
>=20
> Fix this by updating the field in irq_set_affinity.

The commit message here should also explain what has changed regarding
locks and irq affinity and justify why code is modified in other places (vg=
ic.c,
vgic-mmio) to follow the new locking requirements for it.

>=20
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>=20

With that fixed:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> v5->v6:
> * add missing locking around irq_set_affinity calls
>=20
> v4->v5:
> * add locking
>=20
> v3->v4:
> * patch introduced
> ---
> xen/arch/arm/gic-vgic.c          |  2 ++
> xen/arch/arm/irq.c               |  9 +++++++--
> xen/arch/arm/vgic.c              | 14 ++++++++++++--
> xen/arch/arm/vgic/vgic-mmio-v2.c | 11 +++++------
> xen/arch/arm/vgic/vgic.c         | 15 ++++++++-------
> 5 files changed, 34 insertions(+), 17 deletions(-)
>=20
> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
> index ea48c5375a..5253caf002 100644
> --- a/xen/arch/arm/gic-vgic.c
> +++ b/xen/arch/arm/gic-vgic.c
> @@ -232,7 +232,9 @@ static void gic_update_one_lr(struct vcpu *v, int i)
>             if ( test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
>             {
>                 struct vcpu *v_target =3D vgic_get_target_vcpu(v, irq);
> +                spin_lock(&p->desc->lock);
>                 irq_set_affinity(p->desc, cpumask_of(v_target->processor)=
);
> +                spin_unlock(&p->desc->lock);
>                 clear_bit(GIC_IRQ_GUEST_MIGRATING, &p->status);
>             }
>         }
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 73e58a5108..7204bc2b68 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -216,10 +216,15 @@ static inline struct domain *irq_get_domain(struct =
irq_desc *desc)
>     return irq_get_guest_info(desc)->d;
> }
>=20
> +/* Must be called with desc->lock held */
> void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
> {
> -    if ( desc !=3D NULL )
> -        desc->handler->set_affinity(desc, mask);
> +    if ( desc =3D=3D NULL )
> +        return;
> +
> +    ASSERT(spin_is_locked(&desc->lock));
> +    cpumask_copy(desc->affinity, mask);
> +    desc->handler->set_affinity(desc, mask);
> }
>=20
> int request_irq(unsigned int irq, unsigned int irqflags,
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 6647071ad4..c59f6873db 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -445,7 +445,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *=
new, unsigned int irq)
>=20
>     if ( list_empty(&p->inflight) )
>     {
> +        spin_lock(&p->desc->lock);
>         irq_set_affinity(p->desc, cpumask_of(new->processor));
> +        spin_unlock(&p->desc->lock);
>         spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
>         return true;
>     }
> @@ -453,7 +455,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *=
new, unsigned int irq)
>     if ( !list_empty(&p->lr_queue) )
>     {
>         vgic_remove_irq_from_queues(old, p);
> +        spin_lock(&p->desc->lock);
>         irq_set_affinity(p->desc, cpumask_of(new->processor));
> +        spin_unlock(&p->desc->lock);
>         spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
>         vgic_inject_irq(new->domain, new, irq, true);
>         return true;
> @@ -473,6 +477,7 @@ void arch_move_irqs(struct vcpu *v)
>     struct domain *d =3D v->domain;
>     struct pending_irq *p;
>     struct vcpu *v_target;
> +    unsigned long flags;
>     int i;
>=20
>     /*
> @@ -494,7 +499,13 @@ void arch_move_irqs(struct vcpu *v)
>         p =3D irq_to_pending(v_target, virq);
>=20
>         if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->=
status) )
> +        {
> +            if ( !p->desc )
> +                continue;
> +            spin_lock_irqsave(&p->desc->lock, flags);
>             irq_set_affinity(p->desc, cpu_mask);
> +            spin_unlock_irqrestore(&p->desc->lock, flags);
> +        }
>     }
> }
>=20
> @@ -574,8 +585,8 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, uns=
igned int n)
>         spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
>         if ( p->desc !=3D NULL )
>         {
> -            irq_set_affinity(p->desc, cpumask_of(v_target->processor));
>             spin_lock_irqsave(&p->desc->lock, flags);
> +            irq_set_affinity(p->desc, cpumask_of(v_target->processor));
>             /*
>              * The irq cannot be a PPI, we only support delivery of SPIs
>              * to guests.
> @@ -944,4 +955,3 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v,=
 unsigned int rank, uint32_
>  * indent-tabs-mode: nil
>  * End:
>  */
> -
> diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c b/xen/arch/arm/vgic/vgic-mm=
io-v2.c
> index b7c2d7ce99..fc04741ca1 100644
> --- a/xen/arch/arm/vgic/vgic-mmio-v2.c
> +++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
> @@ -159,24 +159,23 @@ static void vgic_mmio_write_target(struct vcpu *vcp=
u,
>     for ( i =3D 0; i < len; i++ )
>     {
>         struct vgic_irq *irq =3D vgic_get_irq(vcpu->domain, NULL, intid +=
 i);
> +        struct irq_desc *desc =3D irq_to_desc(irq->hwintid);
>=20
> -        spin_lock_irqsave(&irq->irq_lock, flags);
> +        spin_lock_irqsave(&desc->lock, flags);
> +        spin_lock(&irq->irq_lock);
>=20
>         irq->targets =3D (val >> (i * 8)) & cpu_mask;
>         if ( irq->targets )
>         {
>             irq->target_vcpu =3D vcpu->domain->vcpu[ffs(irq->targets) - 1=
];
>             if ( irq->hw )
> -            {
> -                struct irq_desc *desc =3D irq_to_desc(irq->hwintid);
> -
>                 irq_set_affinity(desc, cpumask_of(irq->target_vcpu->proce=
ssor));
> -            }
>         }
>         else
>             irq->target_vcpu =3D NULL;
>=20
> -        spin_unlock_irqrestore(&irq->irq_lock, flags);
> +        spin_unlock(&irq->irq_lock);
> +        spin_unlock_irqrestore(&desc->lock, flags);
>         vgic_put_irq(vcpu->domain, irq);
>     }
> }
> diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
> index b2c0e1873a..81ba4099ef 100644
> --- a/xen/arch/arm/vgic/vgic.c
> +++ b/xen/arch/arm/vgic/vgic.c
> @@ -812,21 +812,22 @@ void arch_move_irqs(struct vcpu *v)
>     {
>         struct vgic_irq *irq =3D vgic_get_irq(d, NULL, i + VGIC_NR_PRIVAT=
E_IRQS);
>         unsigned long flags;
> +        irq_desc_t *desc;
>=20
>         if ( !irq )
>             continue;
>=20
> -        spin_lock_irqsave(&irq->irq_lock, flags);
> +        desc =3D irq_to_desc(irq->hwintid);
>=20
> -        /* Only hardware mapped vIRQs that are targeting this vCPU. */
> -        if ( irq->hw && irq->target_vcpu =3D=3D v)
> -        {
> -            irq_desc_t *desc =3D irq_to_desc(irq->hwintid);
> +        spin_lock_irqsave(&desc->lock, flags);
> +        spin_lock(&irq->irq_lock);
>=20
> +        /* Only hardware mapped vIRQs that are targeting this vCPU. */
> +        if ( irq->hw && irq->target_vcpu =3D=3D v )
>             irq_set_affinity(desc, cpumask_of(v->processor));
> -        }
>=20
> -        spin_unlock_irqrestore(&irq->irq_lock, flags);
> +        spin_unlock(&irq->irq_lock);
> +        spin_unlock_irqrestore(&desc->lock, flags);
>         vgic_put_irq(d, irq);
>     }
> }
> --=20
> 2.51.2


