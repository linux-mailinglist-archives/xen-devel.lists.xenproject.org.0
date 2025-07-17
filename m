Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30D2B08DAD
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 14:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046843.1417232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOCm-0002ri-D7; Thu, 17 Jul 2025 12:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046843.1417232; Thu, 17 Jul 2025 12:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOCm-0002q4-AF; Thu, 17 Jul 2025 12:59:20 +0000
Received: by outflank-mailman (input) for mailman id 1046843;
 Thu, 17 Jul 2025 12:59:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VU7j=Z6=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1ucOCk-0002lu-NR
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 12:59:18 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8249ad0-630d-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 14:59:16 +0200 (CEST)
Received: from DU2PR04CA0194.eurprd04.prod.outlook.com (2603:10a6:10:28d::19)
 by VI1PR08MB10101.eurprd08.prod.outlook.com (2603:10a6:800:1ca::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 17 Jul
 2025 12:59:13 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::19) by DU2PR04CA0194.outlook.office365.com
 (2603:10a6:10:28d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Thu,
 17 Jul 2025 12:59:13 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Thu, 17 Jul 2025 12:59:11 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by VI0PR08MB11197.eurprd08.prod.outlook.com (2603:10a6:800:24f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 17 Jul
 2025 12:58:38 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 12:58:38 +0000
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
X-Inumbo-ID: d8249ad0-630d-11f0-a319-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Nh+1tOIzQHRR67vr+bgZK2KdjmTAP5HqYzv9TGgR7KTbtZDe+/zCZaw1ZeJIfF/Zn7IxdgKMkvVftaFmjLHNK2zR9IPBvTEsfWa3s7OrAUHrZ9jwpJRu0bz/4/GJSfOL+Bt7MNbj6pnhh7LUSN3Ox78BoIi0mQ2bMZcgckCo4OtXW4YcvuLE4Whr0HOG2EhkdbCVr+GmCefPdIC4Ehq8JJnj/6oG95Fx7q5L4E6kJTQ1ksAqYjcKgBkmnzPwhWit1sGrGOIlrRAmcky+zW62xm1CqY8uraJHc+QJuc1+8koxC+q5lltxjl5oH29xpPu6VLZL0bkMcbtiDfWUNuTgUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwQI9/ttfLDx3YEc9WG+tqj2pQMpzqXpN4Yxr7Ngatw=;
 b=wFO0EyjAMmBwqM5GPtMz4WLjjEQ11jR86tIITcHT4O7iV+c8RP2bb9Ui0Y1w8skWgrswFigNKz8uDKHGiSQiawdvmD0EMZXRvQ3LOc7gMznraDvMph3XJwDdHBZOUgkoQjUkV4ZIJVe9RFbtYjUmyu32rERrHmdrYa5f+zbST6p2WjYJdJgaBndZnoc18zAKdmu9sXR3RLZO8I/TTGTvox0feOSfpIRBPMr13mlGBNCI5t0kJ1Tjs3xc9Tg0iI3ocjYhyWCFx8I2QkcOVg/zYoqYKr3FBmPqIFSQUa3d3/Jk90zyZKkfd4y1n7kJAn0tdBwY7gcoeXCTmPB/qfxTvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwQI9/ttfLDx3YEc9WG+tqj2pQMpzqXpN4Yxr7Ngatw=;
 b=d1KNPX254hpOY+7xvicTAxVUaLv7aWcNpMrAM6Ka/Syry4AkrZn0QGO70IG/B8a9mPLqKbmzbiGeJE7pDE9Lrjn/Cd3zO0AnX4mrOFzkPOQW4OEYINPU9JRVqsWNo48HbbREIX/olp7zgR45m9SZc+OgvgkPMUTBlO7wUV8+9gk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEBxLjdiGOXmhb0yzkMvNVRRqUWX1l5oEoM3xWW88wZJCB0feFr7ws1W7waupVjgvIvNRkXdnfrCofo5yaWgbcMp2aUHiIeSM5Z1K9N/EHtKNgKCrGAs9+Au7FAjFp0CKrYCDsulFsCbU2clm8E70/Y49zBXvxxOStieZZMwbj1FrWXQ7xuVk7gKJDK0ltgHCEd108hTdyykCZDlUTtX++0On7WvGQvq1kUuczWv0heLK6GVB6gyHdSX5SOeta91F62ZVkcyd1xVEXi+Ud4/Y5wzxmjB0D5/hlwr5YgTP58YZRffni/JLu7isznO+k2AvWnqj4ZyEtf5oeWLIdiUew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwQI9/ttfLDx3YEc9WG+tqj2pQMpzqXpN4Yxr7Ngatw=;
 b=RpBni8hl05BpWSAYzC3qwE4vl5L4IF0ZJmhtB/BThH5cw9uaghlN0F85qwuHQ5Ud2vjOvjJjjUk45fm/e/TsPwqHs4GehOpN9AISAmNZ2Wm5HXu2E8Qz4Z6uzRwzpvYDkc/YOqnp4U0FDT0DFMt1SHcAd5uI87Jpq4lVkfmMr7MXmSOIQn+RNSNqTLPDXRhKX7ySG6lwknERYe3R+kWsJwx7k8dXITjWRL+gUjcZaYx4eC4caQir+FJZFYr+HF41RzIuO8tYMHxrdSMgAIIWxgRWm3UHM6EWNRGtW7G+GtcyZ9rNL8XolvlbB9ht2rVXi68Ig6ReuE+C4YOAamGn6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwQI9/ttfLDx3YEc9WG+tqj2pQMpzqXpN4Yxr7Ngatw=;
 b=d1KNPX254hpOY+7xvicTAxVUaLv7aWcNpMrAM6Ka/Syry4AkrZn0QGO70IG/B8a9mPLqKbmzbiGeJE7pDE9Lrjn/Cd3zO0AnX4mrOFzkPOQW4OEYINPU9JRVqsWNo48HbbREIX/olp7zgR45m9SZc+OgvgkPMUTBlO7wUV8+9gk=
From: Hari Limaye <Hari.Limaye@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Luca
 Fancellu <Luca.Fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [PATCH v3 5/6] arm/mpu: Implement early_fdt_map support in MPU
 systems
Thread-Topic: [PATCH v3 5/6] arm/mpu: Implement early_fdt_map support in MPU
 systems
Thread-Index: AQHb9xn3UHtrAGk0JkOM2kT/U4VvKrQ2RsWA
Date: Thu, 17 Jul 2025 12:58:38 +0000
Message-ID: <88524379-8162-4F35-BECC-CE98535D03F1@arm.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
 <e6a881be371c54a6bceccfac2a7c2fae887ea023.1752565274.git.hari.limaye@arm.com>
 <43e05cb4-c17e-41ac-bd14-413e073f2c2e@amd.com>
In-Reply-To: <43e05cb4-c17e-41ac-bd14-413e073f2c2e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|VI0PR08MB11197:EE_|DU2PEPF00028D05:EE_|VI1PR08MB10101:EE_
X-MS-Office365-Filtering-Correlation-Id: efc7ba05-bacc-45fc-3f59-08ddc531b9ab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?DCDkzu7cNUH3JTv7O5x+fMK0cDap5wPeFSBtj1DLQR2cCJb5gMITxfMSFm8X?=
 =?us-ascii?Q?bbZQcKc1G2DPbsZsHHrDx2N0iJW5hQ+0TNhCijuNp06KyVv1Paal3qQnfJLQ?=
 =?us-ascii?Q?Q+kmsYKflCELbT9pJaw/2CrTjv2xM6qFV7l+wxO7z8zPaV43aI0Eal83+G4e?=
 =?us-ascii?Q?7jiY3oiNVvZpCXH4xiAzcJRAIXikOwtVhJFLnH25WHnz40y5xK1sp3/mBwqe?=
 =?us-ascii?Q?jl37eXdBzYXBa5zkge7E7ECfajQLqf5I+fu10RmG43WASvgIqA4Vmdf9n9e4?=
 =?us-ascii?Q?kNSsFiKrA7gsFtCArUc5lyfKhOmPJhhuBk7TN6NikDl6WMjT19w+3UEc3VM4?=
 =?us-ascii?Q?70Vk+/QY9n1iWLlzJXS+b4i7HVrE+E0x0DhAO0TQYWsCTQUUOwXWMkLPIL9u?=
 =?us-ascii?Q?lWhuAiP6k/KM4OzdKq2ALj3njVAxJhwNXqVbcrac6CYPI8iPQVcfZeaxvwGS?=
 =?us-ascii?Q?17Gk38bD/o2qXlupE9yJbO4ZLwwIgMVccIXjl6xukPmqfUP/J7zm+nynXah6?=
 =?us-ascii?Q?kXkcdjsjOc5YKLxMkuaTGNqXQ58rOSyAlnZ3xZ+eyev06Tcc/ElmOnB8kiJ9?=
 =?us-ascii?Q?NDn1keoCMrTb05InLEhqo5TmO2duYB87sgK/pxJoXCKhTHorXdjRCEWwqw9Y?=
 =?us-ascii?Q?+QDR8i1bAPZxDRaKzbQOgFV58giCOHvyVZldijVjHLFyThAIUebTRZIpmlwq?=
 =?us-ascii?Q?fUUGk51uCaABab7T+MTdwL6DTYdMQcFHQuOdiY7bOrJfp21AOhXwYamz7xpW?=
 =?us-ascii?Q?9837ujO9WYVlI4qdVHBD1VzEaRSs7I3Mjn3/vLbUCBfXG0YbvTk7/fyni/A3?=
 =?us-ascii?Q?leBNVrdrWGdao8tk+8TIJ5+RjZjV7zyzBXP1Czp8FyHv1ekxmH9Rrv+gkGlU?=
 =?us-ascii?Q?HOCtnm9Xye5C2WubzgcL9tSfHLaA9DrPP5TSIX2F1iGS1/XTJD1Ebak0Tgxk?=
 =?us-ascii?Q?05v2LlT4B36Cq59j5gKlviML3SzzHIDgMaxSx/1oVxihY+dYIQyFDvr3P2UP?=
 =?us-ascii?Q?xVy+7YP77X3moyGgPkbVGUKhePVc3o8boyGruvQ2T8Ap8t4yqKnS+1Wdb66+?=
 =?us-ascii?Q?6vQy5MTRB2jmNedVI42rTAVV6ODycdC2vqikmy+2jTVS1FLLPoq+i3pOgXIs?=
 =?us-ascii?Q?opZOWPqhclf0oN0Y3iNAC55+qUUWlu+3dR2IgxPCAwKZmyVSKh8aJOv9nJaA?=
 =?us-ascii?Q?zcSPesC3x6AYhD993YbsPpvJHY407fzHqjkBRuiwP1XiDqe9aeucXIVhO8yx?=
 =?us-ascii?Q?KdUZli3fFW+sFUeY8+OALyZ/MtAJOJHBGZqUAxnDs2o199SbW6YbomdQ9zDG?=
 =?us-ascii?Q?xE7CGVDgIODNvQkIceGsUH9TyZM7X2czpPHuHy55a2GSlu8JCp6IjzzxJ5v4?=
 =?us-ascii?Q?ImEsH1TsJZ3Dm8/Kv2QGau9WjE6s35nOayjFGLNR9XjSC/jp3arSbYOkDHLN?=
 =?us-ascii?Q?96kIlHvnqR5Q5fZP9oZhnxi3lR7v3gLghZt6ilC0erjmiOYK3GiWRg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <98D925D86499534E88E2B722626F58AD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11197
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	96bb97e3-67d5-490c-a616-08ddc531a5b6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|82310400026|1800799024|35042699022|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xgdkqST98i1hfIrHisI35wOGsPonyqP+ZIX40s9Jb7lo6zWpAxmLgvyHxQp8?=
 =?us-ascii?Q?jdoYOntrDgjzQKc6qFHig3oLrha6S5gsqbEjjZQrQn3kek24JNFq0/5S0ETz?=
 =?us-ascii?Q?uXzqfmpe5dVEizpD49lLFo+msdgBaYeGZhdK26kzf/vz4TUa1MpenTJQD/tz?=
 =?us-ascii?Q?c472TXYNW2DvmP2Ze3H2AhGL11vPATv7CWsDGJWyoE27gAoEQb+Kv2MLA2tE?=
 =?us-ascii?Q?ruCBOCcOMVd2sKTrocOLFIxVmiY1F3pUd5bGGzj1F1KBNM6Eo7HjBxn1jjPk?=
 =?us-ascii?Q?H8UnmVaW/7jciGD/N1BUrCjNusbt2qkAkixMkvOsSxNxYwuNZZ8a1m+Qzixq?=
 =?us-ascii?Q?M4nq4A5LVh3vhFTm8TTQ5ZfAyzpOFA729HI7+1cfV5XcVdq72FuIWAu5A3qD?=
 =?us-ascii?Q?3Mg/nPnSb6i9po73gEe/jCPCWVQBnrGV5PXqNhHVVi459uj52jwsnEYhFXRp?=
 =?us-ascii?Q?/bV1eM4YQee85qa0uPAN10oZXBZMkS3HKTWQnrpcb51sgD6OmZkbWcOJHkzh?=
 =?us-ascii?Q?JaV7uGC8bt9G3KXghdivLyGrglt/w+kmsZXPLssRbUApaLbv3qLRTupVN3gR?=
 =?us-ascii?Q?w4dh1ZXsA4dWlDtQBgmegZINeRagh7llNjDpYKpPHo3Wl0KXN2SPt2zW9Age?=
 =?us-ascii?Q?zQMVTZz2DR4qutSEFo6//Ntz6riEJZEQqPYW/VFV5q7qrEUFP02Rgt4nHp0l?=
 =?us-ascii?Q?CXHCK2IPuDYumArtSJV4KaiBDlnS9oEYj6DIYXMHmkcGMn/j9ayyRzVeucQB?=
 =?us-ascii?Q?/RzgnT0KIrybk3x/qcAqRo9EdaAaPw4w4M0DVPM/ZEegFfHbzxcf+5jFpyPy?=
 =?us-ascii?Q?D+qQ6Qge8yxNwHLIET5cozzw17cen9jAbnvQIxj9MakXGFUCrVfOLZ1uQm7s?=
 =?us-ascii?Q?QOze+ZGVV8Ko/g1FdWYL4RkVzck/UUi62qejMuYITxvfdoXesndBEPplfMv3?=
 =?us-ascii?Q?v1TVMgntB9zi1GtuEaT5746XHN1dJJfTlK7DbJo8oHXF1XCDW/UuNarlTXr5?=
 =?us-ascii?Q?8iXwXb1m9mBCoLOgNsqVIKjXLpSKoo2yuACnZFFu5GmtZvc/6N3Mh2P7kumx?=
 =?us-ascii?Q?gFs2cV4EkMsf6BI1rB2H3ZFDBdQN5u/bUHuX9rvonYnLFQg3yUKmWj+5FZA6?=
 =?us-ascii?Q?tj8rZCx0HUH3tEAnV9Mak988pXGZklBh9h9PBWomer26xRcbP2XHmLIklnx0?=
 =?us-ascii?Q?7gOmVYlZfhIYzJZS4VmvnpJ6H028OT89g6ZZV8NfzOSU8sO9CD1JXWRGrjg8?=
 =?us-ascii?Q?AVq6VYqisjAPwEhdcx37P9pwmjQ7YvwsXYVBrjvDL/gaW0+1QxopTLmuh8ZH?=
 =?us-ascii?Q?rbm+yIkV197Rp5tduCdNGAd5ZfvY+TzTArLlvQAddyuPqQSlnKxBPt4OuAK7?=
 =?us-ascii?Q?74Oe4MYhQR4AILsJ+IaMI9cmyWLiLm2gE1CvsEIJO+I4hUoV+sipzpMotPn8?=
 =?us-ascii?Q?3DJhMis/UG5LFHleC1uNlGD74ysZqjCk9ptMGKb0iZ5etZG3NXOQz95r8ZsX?=
 =?us-ascii?Q?EvrqYMQJw+6zCbPvtUkANam4U9YWAf4B9rO/?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(1800799024)(35042699022)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 12:59:11.4561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efc7ba05-bacc-45fc-3f59-08ddc531b9ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10101

Hi Michal,

> On 17 Jul 2025, at 13:54, Orzel, Michal <michal.orzel@amd.com> wrote:
>> +    /*
>> +     * DTB starting at a different address has been mapped, so destroy =
this
>> +     * before continuing.
> I don't understand this scenario. Can you describe it in more details?
> I know that early_fdt_map will be called twice. First time, mapped_fdt_ba=
se =3D=3D
> INVALID_PADDR and second time, mapped_fdt_base =3D=3D fdt_paddr. What's t=
he other
> option?
>=20
> ~Michal
>=20

This was intended as more of a sanity check than a situation that was expec=
ted to occur. Maybe you think it makes more sense to remove this and just a=
dd an assert that `mapped_fdt_base =3D=3D INVALID_PADDR` here?

Cheers,
Hari=

