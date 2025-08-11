Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D5B20065
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 09:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076961.1438058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulN3X-00064B-HA; Mon, 11 Aug 2025 07:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076961.1438058; Mon, 11 Aug 2025 07:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulN3X-00061B-Dl; Mon, 11 Aug 2025 07:34:55 +0000
Received: by outflank-mailman (input) for mailman id 1076961;
 Mon, 11 Aug 2025 07:34:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6owi=2X=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ulN3V-000615-7c
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 07:34:53 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8312b97-7685-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 09:34:47 +0200 (CEST)
Received: from DB9PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:10:1d9::31)
 by AS2PR08MB9569.eurprd08.prod.outlook.com (2603:10a6:20b:60b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 07:34:40 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::8e) by DB9PR02CA0026.outlook.office365.com
 (2603:10a6:10:1d9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.22 via Frontend Transport; Mon,
 11 Aug 2025 07:34:40 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.11
 via Frontend Transport; Mon, 11 Aug 2025 07:34:39 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAVPR08MB9817.eurprd08.prod.outlook.com (2603:10a6:102:31d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 07:34:07 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%2]) with mapi id 15.20.9009.017; Mon, 11 Aug 2025
 07:34:06 +0000
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
X-Inumbo-ID: a8312b97-7685-11f0-b898-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gOa0uEeNG8pav6Xn3nUfSoTD1OJLbByMR88xy4xNvKE5az42Kp8DVqPtvFnC3xuIVHC4TnSlMJcxbOkOqlSkmZ9nftJjOnf3WYSLu0J1q7n0PqNPGRZxg3gZ9/W8oKKVgEpa6H/BP15FFPOB4fwSKV4UDmF/haGKur0Wwr8Me8cUYi6TtrxMQs2W2P0Nw5q8IgPv1zWBXbnxGfg+U0QdzArtwIW1cagNO0R6DqdgluaCJyQojA0BbDSnmzYrbc2dmFxw8bBRHaRFr6lW+c5i5TOjghYGcyTLcht13OunqOXOP38CCPCPe2gEj5FmX9nyLV9JKmktHpbRjvr7J6zc5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhG4rbTSHhy/Sr/3v+F7BVCUauPzVThuTt12zVq3ehk=;
 b=iTBjlI5bqc1rLjdDZn7bzRJyKTtUk7HDf/bWq6gDwZW556RBnXld6OX3ted124Me+B/kRrRS7NBv0z6LTKGL12dCerZNqXlwqffKHzC5KHVwAT0hY0CuvIg42WMDI1qwbxEAner/GK2so/HwsxDbt8oUgxXgYS04RklvUARBh/lc+UUUGIwPdjR3IQ3x3h7hiNi9WNFVBaNdahO2YtbZQglWxLabOOSMnseevqicN/fpAtw2M7ZRXWidb1BU7QjawlRkTopK/SOJ8D3NURJRtH3rYkUE8gcLybSTE/xLHANTxeBPdMh7hMdSwAqAh9eP27+EmxROSeM3cfIJBTe5oQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhG4rbTSHhy/Sr/3v+F7BVCUauPzVThuTt12zVq3ehk=;
 b=WnWoGSuouvXJOZqMfPRosyT9JMU0VZC127ko21UAWFpjLMQ5MI7Elj/Nd1wIOAb5Lup82EAAKmpZCXVO8JUajj5an2X5ahBcFh7JMvEjLJDfMJCn6N0JbMdD+kohMqqkQlZktjVf5ZIEJuaRRxWjOucAKKANdb2T+jGaOgPyYiI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIkUHUi/g24AJSRUQuewArLFSwrr0eYUc1tLeeGPlNo3ugfljAUCEuWOBuDGUs8i8N0FxzfVOtJ1CT18GEjAa5eJLxcLDqB7aFFLjA8d6ZBrTRc6t5CdFgL6j21mC33hAUC1qKOj9aQ0s/GzYjatSpYcgFKZuC2eqFJ9EcPefDWNuP9d0POjfBSXLwQhIOKrv6OO+DmCWyi6OJ/pXR5OZ03JE38PaKSjTSPh5F3WLIu/auMY8dSEwbFyKe2ZreXlK/dtrXXcFe4Sy1HPo1WANG6fD+kp1B7DCGDLn6aME0ErBszi8tltmiPzSTlkVLY3ID+IlQvCtvvvjk0AYbEXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhG4rbTSHhy/Sr/3v+F7BVCUauPzVThuTt12zVq3ehk=;
 b=I4UFEfn7/LiDsp6wO0gkR9KprCRJ+x275KCKzc3AwVl0Gz188TSIuH5ynx0xmdZpGQWb9HXetR1p01hpGDcvmLftOBsnR+C0QG9vfTXuTIp4SYzn4ErDIGd4KFL/bd1sg5vHBvIAd0p3tqdFdHKILsZqFMS4XIEOvAuj6UQzQidcnL2x5VCWzyM8ME2Q7HxQ3P1hjovPjeEELsOxqd2S8+1JQ/Qc36vLtZZ5Vr1+ZW4enOZOQrgyIoOPLHXk7QozFNHEFzLTFjmWqFMKioBgGcLbvtIlsanvGkoDWOep+xkz6c82/Bm7IuXfmOw1SLxX2Ea+NmeGJpfvH2Ww9Ry0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhG4rbTSHhy/Sr/3v+F7BVCUauPzVThuTt12zVq3ehk=;
 b=WnWoGSuouvXJOZqMfPRosyT9JMU0VZC127ko21UAWFpjLMQ5MI7Elj/Nd1wIOAb5Lup82EAAKmpZCXVO8JUajj5an2X5ahBcFh7JMvEjLJDfMJCn6N0JbMdD+kohMqqkQlZktjVf5ZIEJuaRRxWjOucAKKANdb2T+jGaOgPyYiI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v7 3/6] xen/arm: ffa: Introduce VM to VM support
Thread-Topic: [PATCH v7 3/6] xen/arm: ffa: Introduce VM to VM support
Thread-Index: AQHb9xP9tgnM92Sxpk+5sdmAsJMirrRZG8AAgAQargA=
Date: Mon, 11 Aug 2025 07:34:06 +0000
Message-ID: <85167096-B676-4EB3-80EE-8BCC8DCF68DE@arm.com>
References: <cover.1752754016.git.bertrand.marquis@arm.com>
 <50224eb7cca4eaef2646ad8e33f689d912704733.1752754016.git.bertrand.marquis@arm.com>
 <39df0f84-3004-479e-990d-a8437a384294@xen.org>
In-Reply-To: <39df0f84-3004-479e-990d-a8437a384294@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAVPR08MB9817:EE_|DU2PEPF00028D0F:EE_|AS2PR08MB9569:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1ab3ac-dfe4-49d9-4b10-08ddd8a98808
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?BQNh4o1vAFo96jzG+beWiCnKUp+sCaHaBmoxdQSGiZ9DwjuQLfwZEPrNFX3J?=
 =?us-ascii?Q?UuT9ZlYVufbvGm67V50nSGdju8aEJRMXZu9FlPuA5BbeX/FvTJJeDmU7DW18?=
 =?us-ascii?Q?putl29ghwIyTqDHJh4Q6F1edV7lHZF9kVjJL/O36W+D3NG3XcglkAy5eiI/X?=
 =?us-ascii?Q?WYuidnodHI5Ee2fJYhg2NxWrF6XXUnBab+i3GgY+qELockxGEEnWc4vSXbk3?=
 =?us-ascii?Q?lwSIrWkPq07dEh0I6bl3ZDl95krK6m7o8Xv+iIMR8rpxbkVjTjwjCz1DFw84?=
 =?us-ascii?Q?+RX62aYwyhTSt+r9aTr9U2iiQ+0ycQTq8A1227HOn7DvnhYWBgBIGadv9YuL?=
 =?us-ascii?Q?b5RmsldrsKH6VKKr77P7xHi196fD5APa16lx4EQgVvMct3HpRiB9JQs9zboN?=
 =?us-ascii?Q?ZwstTblzlzOjmMSeaPkcTDVZq1itSD3gRem4i4QcHGNrkiHKsgmN5JD7z874?=
 =?us-ascii?Q?qfPDNYckVOjSbQYFVXKugoPzDMzjEePpG2Mh5WrBCSyUJ+hn76TWVHqpwKim?=
 =?us-ascii?Q?c06Y5u9/1ctIwNggdcjUz//1hGXaKhTOyNmg7+uYUTrzii/8WCyMzd8u8NOC?=
 =?us-ascii?Q?vVyHxRw/HLDSmcY5mKuUsQrMFbQcLtyf/FUkO3NzQMWOv7jpS/Mm7yXQMB86?=
 =?us-ascii?Q?4inQpMDzGtK3mO/+L6L2wUZGC/QkmVOYqMa4SGRkjsw5iZdls2d8ITfdTVpG?=
 =?us-ascii?Q?ZlyRUHV+iKc3uwShaG1Fsud0B9M4f8JqrmEnS568V3Erz2jwkcIgL6sTWg57?=
 =?us-ascii?Q?jMeZJyfvbX1op8UWZseDDZnvJ8ysO1iO9ZDuwp3nGi9YtufR1chku8GGlhJX?=
 =?us-ascii?Q?lRozqKDu19OrFuvnhaytX6gOdzZ2CDjSGVJ1wdasojKV4eUs2VY5ApNfegLD?=
 =?us-ascii?Q?9JVyb+1MLHUGAYD6EOaNjamOUjV+ERavjrzbMBnnXEi6YsLCciHnAJpt2jpT?=
 =?us-ascii?Q?ywkj3vL+HjmyyA//Im4Lpq4+u77IxOsJNUGNgWCrtKBBTzycK8B/HW68elOu?=
 =?us-ascii?Q?LIuL/kzeXF7rKZN0LoFi/o/CqIWxf6uE3IN6JVPTvfXdGW+386xx126scNXK?=
 =?us-ascii?Q?sc4Qy4F7PtnvZqpmFgFVBw0vdrKiT4mRFyHUUJD+8UOIbUUIVTFJneFUKqLO?=
 =?us-ascii?Q?4Uc2j1zlCQv+XnSNUbZUHr/oJV8GGq1k7Z+ae4AmUSEfMmKLjDyFqCUsAAHV?=
 =?us-ascii?Q?FM9Cc608hB87yncc8Ug181bjx8YuUY2UaSLnpVKkFY36MuXWD7ALej/0BifU?=
 =?us-ascii?Q?ECN5XtPiHIwF7pVgkJba+zbM7fQXMTpE1Th3+EmqCC0k0aquARkkHeKAtZRA?=
 =?us-ascii?Q?b/OkgCK+1CLqqIzcihG2avKIu1IoIZ1W67uuknu3DG2A0hI9IbJmtStJJ1Fo?=
 =?us-ascii?Q?oPG6OX7x2zAvrrpzswCRMVLor1R43wCYEfvLuCZAwMdySROS/r7QgxHyMkLQ?=
 =?us-ascii?Q?5J/OR8sC4Kh7S/uhu/IHpELWD+ev78pC+jqutqINHfBmM93ZQOZOMjGzuSvF?=
 =?us-ascii?Q?RfMWKW+22W0l5pE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <06413ACFA6834544BD7553C168D1F65E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9817
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c4689afc-c325-4f57-225e-08ddd8a97453
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|82310400026|1800799024|35042699022|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hh3FZMywHqt/95oHMrAQIGBNJVJWqApoGj9JIRCEk8rChVLRvt/gUAPe41NE?=
 =?us-ascii?Q?6pe2GDNVSpCITM3RoIIrihs1OAfhqy2gGEfBlBryX2REoLEfGquiiHIoF09L?=
 =?us-ascii?Q?FA/H3Tjce8iBOCV0L41f/8kBThn34BAITBYuWq9Xuz43hn79or9GSLPhFL5B?=
 =?us-ascii?Q?yfIwqESgaXLYKfZUFXld6Yb5+nYtFjRyUpuhIq5kedGa8eFmAczp4Mw31ny+?=
 =?us-ascii?Q?Wviy7GWWFpOQfsUq4B2a/c3uUrhyra2+UlTqAOY4nspOHKquMrnCtVggYNln?=
 =?us-ascii?Q?bJUfyzROnYq47jm8M/YW9e5skutrKNDguGNVDN1I012ip5+P2AxX6if1ezaj?=
 =?us-ascii?Q?SLnPBNe+77990b5RagEn/Ef/51n7GKNFAk8MaZiPNE1Z9Cr5A6+dj6KQTUr0?=
 =?us-ascii?Q?YvdxJBCmjklU2wFeUI8kN3cmReBdUZqcDVlWxKm6wVupr8P9bkg1H5441cfG?=
 =?us-ascii?Q?i6iAzByESovGyAVHjMq0Y97OdMvMJXpLmfdNSIvXiYd1tmsejbTYDWXcQwKJ?=
 =?us-ascii?Q?tI/g9PSsuKOau3sR8XZtM9yFIozkHXcn6RJvWZIiOfOqcUcqyzmNNafeML0C?=
 =?us-ascii?Q?qdj7YT9ySLsiEy+XfULfZuiJXdDqw+roOZm2rFjyQn0rRHZox/h2AvAV368d?=
 =?us-ascii?Q?KMdKcgVIssroJc/k1oroCkzA7vegv+dk/HK8eTrZG2BNi73sC6jD6Ys86SNZ?=
 =?us-ascii?Q?LQElOd/bIRGlN0cvvfnrAkf8tPXaq+XLdbv7S0vs28Z0TPAdmf9EDlGiZXUU?=
 =?us-ascii?Q?VXWvLSl96R7nFedYTgDhiXph31YRZsqIhzEUCPfyuuGIi53+kS8E44w85iQr?=
 =?us-ascii?Q?4QVvbd/FGDcpeXOnDaXvoUm4e/txudg6/v56lFcXnvaPtd7z8Vu2fUCErtec?=
 =?us-ascii?Q?25PQftEsE9WfCUWQ15HboUTlvBnJRlGcbxpla2b3gHZF7NXQ4X5kWsFhJjpG?=
 =?us-ascii?Q?+e6LWLnX1FkH58+YrMjX3fZ06ix34JkpaT+6WluYux4rG/lGJIdQrPXcI7f5?=
 =?us-ascii?Q?YuW6TNzpxPVhrcTBE9Xe85MMXuiKVZuAQi2F4X/pL6EieKehp3Zz5P+AuAgz?=
 =?us-ascii?Q?H/ZgWyDbIQQVTtw4OPWMmCsyTGNBt38iazDj1wKXJUTn8P1XFB/MpvSqKjRn?=
 =?us-ascii?Q?h9krWFO3dvY1zfvKQ3kqJt98jlzlCIXJXE8R1f5HRp61zPBCggm3mJuqjApk?=
 =?us-ascii?Q?NEdfaq0jsHEz1A0LAqvy3mJwmYjNBsWvEFsfcn3VArj4+PQ4EWabWRJpdQXI?=
 =?us-ascii?Q?U/kVf+bNtcnH0+Lr5V1SUMqNV6T8UcHrr61GctW49yQEYcUWHb3agJMADQNs?=
 =?us-ascii?Q?dZOofeXr1ul4Qp3pc/CMiK0YopoLHJipPueFRpLf48xbsMk3jySkcN6QJi+d?=
 =?us-ascii?Q?ZRF3dvzrPcvyeMSBq7hw1Q7led9BYM5OqzneXIQKaTOADT32L3mgy+iSmxeU?=
 =?us-ascii?Q?EKkMwn1E9ywY+cBgaYItHdHQsAC04IFDC4jqzDcG6+Ot6L/+cp8CkGNG+M10?=
 =?us-ascii?Q?M1VGSRSqGPCvdJzMbkU1KuESFpN40xBQhNhIyekR3pow69kuBBJKosompQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(1800799024)(35042699022)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 07:34:39.8719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1ab3ac-dfe4-49d9-4b10-08ddd8a98808
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9569

Hi Julien,

> On 8 Aug 2025, at 18:53, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 17/07/2025 13:11, Bertrand Marquis wrote:
>> Create a CONFIG_FFA_VM_TO_VM parameter to activate FFA communication
>> between VMs.
>> When activated list VMs in the system with FF-A support in part_info_get=
.
>> When VM to VM is activated, Xen will be tainted as Insecure and a
>> message is displayed to the user during the boot as there is no
>> filtering of VMs in FF-A so any VM can communicate or see any other VM
>> in the system.
>> WARNING: There is no filtering for now and all VMs are listed !!
>> This patch is reorganizing the ffa_ctx structure to make clear which
>> lock is protecting what parts.
>> This patch is introducing a chain list of the ffa_ctx with a FFA Version
>> negociated allowing to create the partinfo results for VMs in parallel
>> by using rwlock which only ensure addition/removal of entries are
>> protected.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> With two remarks below:
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20
>> ---
>> Changes in v7:
>> - protect ffa_ctx list with a rw lock to allow several partinfo_get in
>>   parallel but protect adding/removing entries.
>> Changes in v6:
>> - remove ACCESS_ONCE for guest_vers access and take the context lock
>>   before modifying it
>> - move guest_vers in context declaration to fields protected by the
>>   context lock and add a comment to state that lock in only needed when
>>   modifying it
>> Changes in v5:
>> - remove invalid comment about 1.1 firmware support
>> - rename variables from d and dom to curr_d and dest_d (Julien)
>> - add a TODO in the code for potential holding for long of the CPU
>>   (Julien)
>> - use an atomic global variable to store the number of VMs instead of
>>   recomputing the value each time (Julien)
>> - add partinfo information in ffa_ctx (id, cpus and 64bit) and create a
>>   chain list of ctx. Use this chain list to create the partinfo result
>>   without holding a global lock to prevent concurrency issues.
>> - Move some changes in a preparation patch modifying partinfo for sps to
>>   reduce this patch size and make the review easier
>> Changes in v4:
>> - properly handle SPMC version 1.0 header size case in partinfo_get
>> - switch to local counting variables instead of *pointer +=3D 1 form
>> - coding style issue with missing spaces in if ()
>> Changes in v3:
>> - break partinfo_get in several sub functions to make the implementation
>>   easier to understand and lock handling easier
>> - rework implementation to check size along the way and prevent previous
>>   implementation limits which had to check that the number of VMs or SPs
>>   did not change
>> - taint Xen as INSECURE when VM to VM is enabled
>> Changes in v2:
>> - Switch ifdef to IS_ENABLED
>> - dom was not switched to d as requested by Jan because there is already
>>   a variable d pointing to the current domain and it must not be
>>   shadowed.
>> ---
>>  xen/arch/arm/tee/Kconfig        |  11 +++
>>  xen/arch/arm/tee/ffa.c          |  47 +++++++++++++
>>  xen/arch/arm/tee/ffa_partinfo.c | 100 ++++++++++++++++++++++++---
>>  xen/arch/arm/tee/ffa_private.h  | 117 ++++++++++++++++++++++++++------
>>  4 files changed, 245 insertions(+), 30 deletions(-)
>> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
>> index c5b0f88d7522..88a4c4c99154 100644
>> --- a/xen/arch/arm/tee/Kconfig
>> +++ b/xen/arch/arm/tee/Kconfig
>> @@ -28,5 +28,16 @@ config FFA
>>       [1] https://developer.arm.com/documentation/den0077/latest
>>  +config FFA_VM_TO_VM
>> +    bool "Enable FF-A between VMs (UNSUPPORTED)" if UNSUPPORTED
>> +    default n
>> +    depends on FFA
>> +    help
>> +      This option enables to use FF-A between VMs.
>> +      This is experimental and there is no access control so any
>> +      guest can communicate with any other guest.
>> +
>> +      If unsure, say N.
>> +
>>  endmenu
>>  diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>> index 3bbdd7168a6b..be71eda4869f 100644
>> --- a/xen/arch/arm/tee/ffa.c
>> +++ b/xen/arch/arm/tee/ffa.c
>> @@ -118,6 +118,13 @@ void *ffa_tx __read_mostly;
>>  DEFINE_SPINLOCK(ffa_rx_buffer_lock);
>>  DEFINE_SPINLOCK(ffa_tx_buffer_lock);
>>  +struct list_head ffa_ctx_head;
>=20
> A more common pattern is to use LIST_HEAD(ffa_ctx_head) and ...
>=20
>> +/* RW Lock to protect addition/removal and reading in ffa_ctx_head */
>> +rwlock_t ffa_ctx_list_rwlock;
>=20
> ... DEFINE_RWLOCK(ffa_ctx_list_rwlock) which will also initialize list/rw=
lock for you. So no need for extra code further down and less risk if the v=
ariables are used before they are initialized.

I will modify those and push a v7 to the mailing list today.

Thanks again.

Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall



