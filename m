Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E2BACA9D2
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 09:18:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002818.1382210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzR8-0002J9-V3; Mon, 02 Jun 2025 07:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002818.1382210; Mon, 02 Jun 2025 07:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzR8-0002Gu-Rj; Mon, 02 Jun 2025 07:18:22 +0000
Received: by outflank-mailman (input) for mailman id 1002818;
 Mon, 02 Jun 2025 07:18:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFk4=YR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uLzR6-0001n5-UC
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 07:18:21 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c00fea5f-3f81-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 09:18:15 +0200 (CEST)
Received: from DU2P250CA0007.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::12)
 by DU2PR08MB10187.eurprd08.prod.outlook.com (2603:10a6:10:46d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 07:18:07 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::d9) by DU2P250CA0007.outlook.office365.com
 (2603:10a6:10:231::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.31 via Frontend Transport; Mon,
 2 Jun 2025 07:18:06 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 07:18:06 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV2PR08MB9422.eurprd08.prod.outlook.com (2603:10a6:150:dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 2 Jun
 2025 07:17:29 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8792.033; Mon, 2 Jun 2025
 07:17:29 +0000
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
X-Inumbo-ID: c00fea5f-3f81-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LitSMbD+Zu+QTJms2V2alI6tgiI8c1JDEjOGGUZP7mROCXDguiLX6VkL17TcgS3Xgui2b5AwHtAzHyMwPZgB3EGNNkGFXSTomslFGu46cG3um+Hi5KFe/QFK9EHV6YSO3Vzri9rboEdlOfTOwnCfXM2WjB1QJpVE59uTwlmjBx47QaJL3R0+SOgGawzIuVfJH0N2+9IWEmoD73zubcjHjOHES1uq7YT5YraOqYj6KdwP8GdN55ffHyycgKT5cghCyAT012SNTKk1QoYmFR0HTnjRI+58qsfO/e1uiojGIeV7zaFgjlWJW9JFyDdIuxbFLWYlgriwwe3q95cxkiVHBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8365uYGqRfP9UxX4VmuZlIYfBAKeVIqmmmcqVV9tR6Y=;
 b=lFppGJ7NjcrB505OLWydO8nOw1k8x9AnTAhSoaxDAzhfYkZVKkOEvw3CX4niWAZL84kxzWLvTh7KZLJtCAMNcwlewyTJKMUzyWCVagif5KETVmZVZ9y+A+Oq+CoBlwgub4vacl3e4OElv4n0P/gz4Y08HRVhE15ry688rqbjbMh+tErZpfRO/NFMZn1SEkI5082VXQEDAIM3bKoQ1av6TtllpssHWlJH+nIXB53xynVATVpw5UHk0pDi6Sz2yEjsPHCjJ9EfknPhmo9K3+S5M+JKU05xICTfGTi4FxIEiK5v+vneZX+SzzruBU4TZZy2ROj3P6nNprzu640cslgEzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8365uYGqRfP9UxX4VmuZlIYfBAKeVIqmmmcqVV9tR6Y=;
 b=niLhBBpjeqinl/GpFBoYzohaTo8WfmVwfMCBMJv6coIBUzMk0YxPU2mGNjy7tP+H/WI+D6OdFtkEv/43lDkdwxvA66D0luEbINQqJ0fd7geqRjd7CEdSsXTCR+yQ642aVdrE4SuJKr2WGW9VWVvu4pEBFHyIAO6qNs1DCVq8xVE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dmjb/k6xYrpdgNcyG8jUtqbtr3VUTtNn51O43qeJYElE/GWjPZMKrqR70O5v6yw6WDG/UbuHwYQee3DwudAYes6li1/brV2g0Ha9M9jV+O+hC/v0sjsHgCKpcM7l4/2Ca5VTuWiUBotNl/HaXomGRRI/gJz75lWhuJT6TLJiTxggXufrWNPKec/ZW/Iqo7yOqPYIvN6T9TX8hxaZCW6TfrSVjP8ocXUO6Rbc53to7gGckOvfyi7zqu5Xa5VaAtmH8n0fjVwGldyQnNO6OMHJxzK7jMUUNRZSeLu3rHnu+Guduli5Hge2hlrr3j7OERXgQVlRx+RpjRQI/qWIsVVbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8365uYGqRfP9UxX4VmuZlIYfBAKeVIqmmmcqVV9tR6Y=;
 b=PYfCQBx3jVpwKC1MsX8C0kfGKJmxIONDdl1A+a4HUZSuLdJ87KyMzrORvX4FT6B+6by6LIAHCx0gX7g+QXq++7tadPgDhBtmCObIp1pWLZzrxsCnHOOXKdvJsDNU8ga6L/OwVW3c4cpyG1sOQW2yaGWiYmTD7rzwVOKIxSf3Y3SWRr0ysulj56PyhNQEOgPA6ugpAF1GUbJeGNSdfDb+/NblbhP+AU8GxftZoyQP/swNtp6LcIYd9zpu4t0ll2upitSlykQt81QB5ym1t+xG8m1Q6F3URCTwNWwyfVX4HTDui2Z42xzKJcukmXwoQkGcofRRdIqZWYGYbI/1oYGmgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8365uYGqRfP9UxX4VmuZlIYfBAKeVIqmmmcqVV9tR6Y=;
 b=niLhBBpjeqinl/GpFBoYzohaTo8WfmVwfMCBMJv6coIBUzMk0YxPU2mGNjy7tP+H/WI+D6OdFtkEv/43lDkdwxvA66D0luEbINQqJ0fd7geqRjd7CEdSsXTCR+yQ642aVdrE4SuJKr2WGW9VWVvu4pEBFHyIAO6qNs1DCVq8xVE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Thread-Topic: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Thread-Index: AQHbyNXUPX94A4OrRkGo4Yj0v+1L6LPgqpIAgA7ggoA=
Date: Mon, 2 Jun 2025 07:17:29 +0000
Message-ID: <04B1F737-5E6B-47C0-B2B9-74288C68E68A@arm.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505231114050.147219@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2505231114050.147219@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV2PR08MB9422:EE_|DU2PEPF00028D0C:EE_|DU2PR08MB10187:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ccc60c-686b-4bfa-95ee-08dda1a59f0d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?z7OcDfOOlSLTs8354HtJt1ItZOfX1Od3w1AZJoywNSOd5mBMqWMi32RCXF?=
 =?iso-8859-1?Q?HL6fdN2OzzoEz8RccPQJO9dhrNeLbGNBn3eka+ZEpUYWQ6Zcg2nT5XgR73?=
 =?iso-8859-1?Q?frfq2wVrdhVBfL9h2M4VdcJqVaK3HtWXDeal0lTwgUrTpKL+3l6WE8fWlc?=
 =?iso-8859-1?Q?WoAAIJL9wWUFeeCTHtrRb2jaqiiUP8OPz4a7bYisyZuQAU/idYipHx2nEr?=
 =?iso-8859-1?Q?lidqGNrvWtG2hSlxlw2ySY7yxm5q7tgp9hrRv73JYAhznWwpSbJCZZDjJd?=
 =?iso-8859-1?Q?27HVln5s/GQuEqf2siPgNZlNCnPBWIK3vy1J8T7M2gl7xnb9LS5Udv+2pw?=
 =?iso-8859-1?Q?1vzId3UocsX+E/KfLhJo5aSfubgdWa3/p92SFsBOCCQ8f3LhWPfjnb5Pw1?=
 =?iso-8859-1?Q?CYX8jZPFwKB52LsNIldZ0Qb3L4LBKnUKeScQVO0sZFqbcRiCxcw6GIUKiW?=
 =?iso-8859-1?Q?EUBk5G9sQddOxGW3F2A8q5xB5NyKCfJOa/GWs29Y4MsQCNfhFRKE2FVmR0?=
 =?iso-8859-1?Q?9SnamO5MDb03ZqZ6PwRvFfC/eRvpcRGpT/cwpGHbtwsZNYwJXnSg0/4MqY?=
 =?iso-8859-1?Q?QlcoHqULopEO+MXn7A1YwWnuK1AmrjgMbO1gZdk4kUWwOAfziqobiW8t8B?=
 =?iso-8859-1?Q?2RKzI7dV4GemkS0GmR54udOqWgKQeO5AsUlyOUQKOXMyNi9YfONT4AnSxK?=
 =?iso-8859-1?Q?j1b0EgEPJfqRDfuCz/r/qTCgoBpjlwitYa3S7e+aBIMZ4Y88yorXXva2od?=
 =?iso-8859-1?Q?CSfMre5y7HzhF3a1ed8Z+QWt7LQcOwIlxE5hFW7zUisXP87d3JPTjHRiqD?=
 =?iso-8859-1?Q?DCVhTPx+eNDuXznw46GJW5K1hdzdC18Yx129BySSQIUf4B/qrTjKtxA0Nh?=
 =?iso-8859-1?Q?7v9aGSgk/6U4ZNIiKw6ED20DeIOcP5qihaTy9TkgM6CVWZ1Bz8S+m4VY4j?=
 =?iso-8859-1?Q?4xy5p2bQqMEYa6HtZBDgB5RVHgm5HumB3y12oZR19noZbuOUbmXstMC6hF?=
 =?iso-8859-1?Q?ip8+W24Up/mwtnA+7Dr9jvuPfBeU5Zwbi0NF7+CSWLyKigwfqp5IFGLjuR?=
 =?iso-8859-1?Q?VM3Y0SMIMgp1hj1P9Dt2rfdrSeMskRdETrgJbafmyZCRIM3ZFfUUcgODzO?=
 =?iso-8859-1?Q?U1LZ85C7oR55Hyz3MMZC6xQs8ZiZPfk39i6jDzn3+3zk0709oEAbRGMN0E?=
 =?iso-8859-1?Q?yaLKxMW9RDVsgHSuUymOiXJDnCkHB958CbdgeM8pxGAAE2ruzqYAKMNxF0?=
 =?iso-8859-1?Q?cmDtn2bfrp4BV2nqkyS22W8UI7pY2EolEEOCsCfHaWqL+iBQhyWsXm7jeS?=
 =?iso-8859-1?Q?Uzpya8iOLyn6qM8JSi7WhH7RVcVnEKARslfZedbwaD6jYz+KejAe6JI4hH?=
 =?iso-8859-1?Q?WWAE0I5PJSWKFXMjZZfQ3u8oYTOlgyxMIkCHpwC2ORG/97VTo9WJPZ6ujJ?=
 =?iso-8859-1?Q?Z2NmtXtMeNfKMstu7fAPt3n5InqPepxF4aBnq0pHsWX25Cg4wZlZ2w9aTt?=
 =?iso-8859-1?Q?4rCUG38bdTWvzxJORwNnlG?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <35856A384109AC459F38951C86D3883B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9422
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea2e1b38-0e4d-43a4-2d5f-08dda1a588fa
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|7416014|376014|35042699022|1800799024|82310400026|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?P4k5ntiZOBKt5m+GaQHSeHAQxZgCGhrjUPSPLssfoIhXgE3FE3tUWeqaLN?=
 =?iso-8859-1?Q?0e+7Ar/OAd53gRJOC2chbuoFO1h6vfVbyNc6jAB8BGdkcuDvNa+xzHHQmL?=
 =?iso-8859-1?Q?Adl/oSsHRcU4SBPJyB1UABwC/8U621DZKMVjTy+hz7qZTIHPXepbIfK5sT?=
 =?iso-8859-1?Q?NAQVe6gUPGCYp2Yz6ntajVnRr2iD9kgsevjK4VV1gsdNJnrWNNqMBub3Hq?=
 =?iso-8859-1?Q?7J0gf6z4BAMi+bUnZDIVI+If98mEjjFEH8TuF1vJr8pYdnEGindwqW3Kmp?=
 =?iso-8859-1?Q?h5ZLkaGj51k/H/8M5EU6L/gzwvqgtcjLpOWNTApw2Fo2GU6CDST+mG4422?=
 =?iso-8859-1?Q?a6PPsVy0hWUN0IGJ/9Xr7yeR/YS0zkonEmp6dpoqvNuZGqBef9sqa87GL0?=
 =?iso-8859-1?Q?2q8HQJRyLwnvlL9tIK4DyiKymdQI6eEDNA4+JioWRwexA03PVmpoukB9XL?=
 =?iso-8859-1?Q?D0TnIoAdVCGRwQLQknI0etsFxLeZhY3d6YziG0tVBwhG2p43EI/TDEK3yk?=
 =?iso-8859-1?Q?Yg3GjcjDox6e3qB//lkD/kxNkW/Ajl2I/U1XdCa7NyfIF27Q65Gn6Uqqa4?=
 =?iso-8859-1?Q?0nXXDgzHuS2bAaWHb+XMsVop+t3go410JST8NysTVKoQC08NDBTDrl13d6?=
 =?iso-8859-1?Q?6GpjGb1tZ112FeKCpNYXTeiT2EkUJOng3F8HfD3Cxbr7G/Wu8InQ9u0x7s?=
 =?iso-8859-1?Q?nMDdWjRxgpAl5MfV18G4O3UrM08dKAbVk9/hyk7uKFANOQW9iCAJDPFk2T?=
 =?iso-8859-1?Q?2ZFF6moyYzesZrtz9/iqTTKl2TVi3k3ht++tU3Ydn3NEVNSfl8nd04qv2E?=
 =?iso-8859-1?Q?6G+Jg5qM3EEfbMaVSId1wCzlFWAxLOLLrm9L1wSbCk8aWKzAcgM0uVaqNX?=
 =?iso-8859-1?Q?G2tu19DUiLwpMjf4vJWugXwE0MdKeRLAcKXnZdRk2UitJc3bQV3hVImbWS?=
 =?iso-8859-1?Q?2qrL6CtR4w2pqgNy+RoEvRxpcd88OAVZzvM4a1KlRHZh6ONr581YRxf2gB?=
 =?iso-8859-1?Q?MA5OW+NHtngFc0jv7Tlt/UBWzxHYRgg+fEsqSDL9ia35wCH6kqB7nXaBEN?=
 =?iso-8859-1?Q?9fgsKrF+cnQtbVczBz4koTQM04l9vrDN76qplOvy45NkS31/kWBIM1O952?=
 =?iso-8859-1?Q?9FXIYmnC5d8QwnljWOoCjNrTkoJ9suM6MlFmJTsVIwMpSSJ2VhBdR/iOkV?=
 =?iso-8859-1?Q?NPXMAeQ6GQ/niy5vcv5k8fW859kdYH5vxBqa4MkA25svrkxbjp/MvVV8Om?=
 =?iso-8859-1?Q?3vqx+YRbZzeU5kC+KWn5FRG9erMb8t1YF0itGWjiGEgVpF135JK4nAcoCF?=
 =?iso-8859-1?Q?btIwvVK18+jMcToFhDzrQuarW89G1UXNjpgclmbZRbE4+DrxoqT6jnaFuA?=
 =?iso-8859-1?Q?0HMiYo/HNjznBkKkA1ZFPEvaKclGplBTvv3mYb/ZDZiZBOMi2VVLMruAV3?=
 =?iso-8859-1?Q?c8lXajWlHNa3M46i7ZenMP+RqgC9a77L3CKZk6Lw/kFSW3mk2M9TegUSNE?=
 =?iso-8859-1?Q?OmATBWN9eAuC3SbvmnezkurAFL2yM6e1VNT+h9ZpMDpw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(7416014)(376014)(35042699022)(1800799024)(82310400026)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 07:18:06.5552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ccc60c-686b-4bfa-95ee-08dda1a59f0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10187

Hi Stefano and Oleksii,

> On 23 May 2025, at 22:06, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> One question for Bertrand below
>=20
>=20
> On Mon, 19 May 2025, Oleksii Moisieiev wrote:
>> This patch introduces SCI driver to support for ARM EL3 Trusted Firmware=
-A
>> (TF-A) which provides SCMI interface with multi-agnet support, as shown
>> below.
>>=20
>>  +-----------------------------------------+
>>  |                                         |
>>  | EL3 TF-A SCMI                           |
>>  +-------+--+-------+--+-------+--+-------++
>>  |shmem0 |  |shmem1 |  |shmem2 |  |shmemX |
>>  +-----+-+  +---+---+  +--+----+  +---+---+
>> smc-id0 |        |         |           |
>> agent0  |        |         |           |
>>  +-----v--------+---------+-----------+----+
>>  |              |         |           |    |
>>  |              |         |           |    |
>>  +--------------+---------+-----------+----+
>>         smc-id1 |  smc-id2|    smc-idX|
>>         agent1  |  agent2 |    agentX |
>>                 |         |           |
>>            +----v---+  +--v-----+  +--v-----+
>>            |        |  |        |  |        |
>>            | Dom0   |  | Dom1   |  | DomX   |
>>            |        |  |        |  |        |
>>            |        |  |        |  |        |
>>            +--------+  +--------+  +--------+
>>=20
>> The EL3 SCMI multi-agent firmware expected to provide SCMI SMC/HVC share=
d
>> memory transport for every Agent in the system.
>>=20
>> The SCMI Agent transport channel defined by pair:
>> - smc-id: SMC/HVC id used for Doorbell
>> - shmem: shared memory for messages transfer, Xen page aligned,
>> p2m_mmio_direct_nc.
>>=20
>> The follwoing SCMI Agents expected to be defined by SCMI FW to enable SC=
MI
>> multi-agent functionality under Xen:
>> - Xen manegement agent: trusted agents that accesses to the Base Protoco=
l
>> commands to configure agent specific permissions
>> - OSPM VM agents: non-trusted agent, one for each Guest domain which is
>>  allowed direct HW access. At least one OSPM VM agent has to be provided
>>  by FW if HW is handled only by Dom0 or Driver Domain.
>>=20
>> The EL3 SCMI FW expected to implement following Base protocol messages:
>> - BASE_DISCOVER_AGENT
>> - BASE_RESET_AGENT_CONFIGURATION (optional)
>> - BASE_SET_DEVICE_PERMISSIONS (optional)
>>=20
>> The SCI SCMI SMC multi-agent driver implements following functionality:
>> - It's initialized based on the Host DT SCMI node (only one SCMI interfa=
ce
>> is supported) which describes Xen management agent SCMI interface.
>>=20
>> scmi_shm_0 : sram@47ff0000 {
>>    compatible =3D "arm,scmi-shmem";
>>    reg =3D <0x0 0x47ff0000 0x0 0x1000>;
>> };
>> firmware {
>>    scmi: scmi {
>>        compatible =3D "arm,scmi-smc";
>>        arm, smc - id =3D <0x82000002>; // Xen manegement agent smc-id
>=20
> some extra spaces, it might be a copy/paste error
>=20
>=20
>>        \#address-cells =3D < 1>;
>>        \#size-cells =3D < 0>;
>>        \#access-controller - cells =3D < 1>;
>>        shmem =3D <&scmi_shm_0>; // Xen manegement agent shmem
>>=20
>>        protocol@X{
>>        };
>>    };
>> };
>>=20
>> - It obtains Xen specific SCMI Agent's configuration from the Host DT,
>> probes Agents and build SCMI Agents list; The Agents configuration is ta=
ken from:
>>=20
>> chosen {
>>  xen,scmi-secondary-agents =3D <
>> 1 0x82000003 &scmi_shm_1
>> 2 0x82000004 &scmi_shm_2
>> 3 0x82000005 &scmi_shm_3
>> 4 0x82000006 &scmi_shm_4>;
>> }
>>=20
>> /{
>> scmi_shm_1: sram@47ff1000 {
>> compatible =3D "arm,scmi-shmem";
>> reg =3D <0x0 0x47ff1000 0x0 0x1000>;
>> };
>> scmi_shm_2: sram@47ff2000 {
>> compatible =3D "arm,scmi-shmem";
>> reg =3D <0x0 0x47ff2000 0x0 0x1000>;
>> };
>> scmi_shm_3: sram@47ff3000 {
>> compatible =3D "arm,scmi-shmem";
>> reg =3D <0x0 0x47ff3000 0x0 0x1000>;
>> };
>> }
>>  where first item is "agent_id", second - "arm,smc-id", and third - "arm=
,scmi-shmem" for
>>  this agent_id.
>>=20
>>  Note that Xen is the only one entry in the system which need to know
>>  about SCMI multi-agent support.
>>=20
>> - It implements the SCI subsystem interface required for configuring and
>> enabling SCMI functionality for Dom0/hwdom and Guest domains. To enable
>> SCMI functionality for domain it has to be configured with unique suppor=
ted
>> SCMI Agent_id and use corresponding SCMI SMC/HVC shared memory transport
>> [smc-id, shmem] defined for this SCMI Agent_id.
>> - Once Xen domain is configured it can communicate with EL3 SCMI FW:
>>  -- zero-copy, the guest domain puts SCMI message in shmem;
>>  -- the guest triggers SMC/HVC exception with smc-id (doorbell);
>>  -- the Xen driver catches exception, do checks and synchronously forwar=
ds
>>  it to EL3 FW.
>> - the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen
>>  management agent channel on domain destroy event. This allows to reset
>>  resources used by domain and so implement use-case like domain reboot.
>>=20
>> Dom0 Enable SCMI SMC:
>> - pass dom0_scmi_agent_id=3D<agent_id> in Xen command line. if not provi=
ded
>>   SCMI will be disabled for Dom0 and all SCMI nodes removed from Dom0 DT=
.
>>   The driver updates Dom0 DT SCMI node "arm,smc-id" value and fix up shm=
em
>>   node according to assigned agent_id.
>>=20
>> Guest domains enable SCMI SMC:
>> - xl.cfg: add configuration option as below
>>=20
>>   arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D2"
>>=20
>> - xl.cfg: enable access to the "arm,scmi-shmem" which should correspond =
assigned agent_id for
>>   the domain, for example:
>>=20
>> iomem =3D [
>>    "47ff2,1@22001",
>> ]
>=20
> Looking at the code and the configuration options, it looks like it is
> possible to map a scmi-shmem channel at a different address for the
> guest. It seems like it would work. Is that correct?
>=20
>=20
>> - DT: add SCMI nodes to the Driver domain partial device tree as in the
>> below example. The "arm,smc-id" should correspond assigned agent_id for =
the domain:
>>=20
>> passthrough {
>>   scmi_shm_0: sram@22001000 {
>>       compatible =3D "arm,scmi-shmem";
>>       reg =3D <0x0 0x22001000 0x0 0x1000>;
>>   };
>>=20
>>   firmware {
>>        compatible =3D "simple-bus";
>>            scmi: scmi {
>>                compatible =3D "arm,scmi-smc";
>>                arm,smc-id =3D <0x82000004>;
>>                shmem =3D <&scmi_shm_0>;
>>                ...
>>            }
>>    }
>> }
>>=20
>> SCMI "4.2.1.1 Device specific access control"
>>=20
>> The XEN SCI SCMI SMC multi-agent driver performs "access-controller" pro=
vider function
>> in case EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access cont=
rol" and provides the
>> BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an age=
nts have access to.
>> The DT SCMI node should "#access-controller-cells=3D<1>" property and DT=
 devices should be bound
>> to the Xen SCMI.
>>=20
>> &i2c1 {
>> access-controllers =3D <&scmi 0>;
>> };
>>=20
>> The Dom0 and dom0less domains DT devices will be processed automatically=
 through
>> sci_assign_dt_device() call, but to assign SCMI devices from toolstack t=
he xl.cfg:"dtdev" property
>> shell be used:
>>=20
>> dtdev =3D [
>>    "/soc/i2c@e6508000",
>> ]
>>=20
>> xl.cfg:dtdev will contain all nodes which are under SCMI management (not=
 only those which are behind IOMMU).
>>=20
>> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> [2] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/tree/Documentation/devicetree/bindings/access-controllers/access-control=
lers.yaml
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>=20
> Thanks for the long explanation, great work! I am really looking forward
> to have this feature in the tree soon.
>=20
>=20
>> ---
>>=20
>> Changes in v4:
>> - toolstack comments from Anthony PERARD
>> - added dom0less support
>> - added doc for "xen,scmi-secondary-agents"
>>=20
>> docs/man/xl.cfg.5.pod.in                    |  13 +
>> docs/misc/arm/device-tree/booting.txt       |  60 ++
>> docs/misc/xen-command-line.pandoc           |   9 +
>> tools/libs/light/libxl_arm.c                |   4 +
>> tools/libs/light/libxl_types.idl            |   4 +-
>> tools/xl/xl_parse.c                         |  12 +
>> xen/arch/arm/dom0less-build.c               |  11 +
>> xen/arch/arm/domain_build.c                 |   3 +-
>> xen/arch/arm/firmware/Kconfig               |  11 +
>> xen/arch/arm/firmware/Makefile              |   1 +
>> xen/arch/arm/firmware/scmi-proto.h          | 164 ++++
>> xen/arch/arm/firmware/scmi-shmem.c          | 173 ++++
>> xen/arch/arm/firmware/scmi-shmem.h          |  45 +
>> xen/arch/arm/firmware/scmi-smc-multiagent.c | 860 ++++++++++++++++++++
>> xen/include/public/arch-arm.h               |   3 +
>> 15 files changed, 1371 insertions(+), 2 deletions(-)
>> create mode 100644 xen/arch/arm/firmware/scmi-proto.h
>> create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
>> create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
>> create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c
>>=20
>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
>> index 1ccf50b8ea..302c46d8bc 100644
>> --- a/docs/man/xl.cfg.5.pod.in
>> +++ b/docs/man/xl.cfg.5.pod.in
>> @@ -3122,8 +3122,21 @@ single SCMI OSPM agent support.
>> Should be used together with B<dom0_scmi_smc_passthrough> Xen command li=
ne
>> option.
>>=20
>> +=3Ditem B<scmi_smc_multiagent>
>> +
>> +Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI=
 over
>> +SMC calls forwarding from domain to the EL3 firmware (like Trusted Firm=
ware-A)
>> +with a multi SCMI OSPM agent support. The SCMI B<agent_id> should be
>> +specified for the guest.
>> +
>> =3Dback
>>=20
>> +=3Ditem B<agent_id=3DNUMBER>
>> +
>> +Specifies a non-zero ARM SCI agent id for the guest. This option is man=
datory
>> +if the SCMI SMC support is enabled for the guest. The agent ids of doma=
ins
>> +existing on a single host must be unique and in the range [1..255].
>> +
>> =3Dback
>>=20
>> =3Dback
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/devic=
e-tree/booting.txt
>> index 8943c04173..c8923ab8b2 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -296,6 +296,20 @@ with the following properties:
>>     Should be used together with dom0_scmi_smc_passthrough Xen command l=
ine
>>     option.
>>=20
>> +    - "scmi_smc_multiagent"
>> +
>> +    Enables ARM SCMI SMC multi-agent support for the guest by enabling =
SCMI over
>> +    SMC calls forwarding from domain to the EL3 firmware (like ARM
>> +    Trusted Firmware-A) with a multi SCMI OSPM agent support.
>> +    The SCMI agent_id should be specified for the guest with "xen,sci_a=
gent_id"
>> +    property.
>> +
>> +- "xen,sci_agent_id"
>> +
>> +    Specifies a non-zero ARM SCI agent id for the guest. This option is
>> +    mandatory if the SCMI SMC "scmi_smc_multiagent" support is enabled =
for
>> +    the guest. The agent ids of guest must be unique and in the range [=
1..255].
>> +
>> Under the "xen,domain" compatible node, one or more sub-nodes are presen=
t
>> for the DomU kernel and ramdisk.
>>=20
>> @@ -764,3 +778,49 @@ The automatically allocated static shared memory wi=
ll get mapped at
>> 0x80000000 in DomU1 guest physical address space, and at 0x90000000 in D=
omU2
>> guest physical address space. DomU1 is explicitly defined as the owner d=
omain,
>> and DomU2 is the borrower domain.
>> +
>> +SCMI SMC multi-agent support
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +
>> +For enabling the ARM SCMI SMC multi-agent support (enabled by CONFIG_SC=
MI_SMC_MA)
>> +the Xen specific SCMI Agent's configuration shell be provided in the Ho=
st DT
>> +according to the SCMI compliant EL3 Firmware specification with
>> +ARM SMC/HVC transport using property "xen,scmi-secondary-agents" under
>> +the top-level "chosen" node:
>> +
>> +- xen,scmi-secondary-agents
>> +
>> +    Defines a set of SCMI agents configuration supported by SCMI EL3 FW=
 and
>> +    available for Xen. Each Agent defined as triple consisting of:
>> +    SCMI agent_id,
>> +    SMC/HVC function_id assigned for the agent transport ("arm,smc-id")=
,
>> +    phandle to SCMI SHM assigned for the agent transport ("arm,scmi-shm=
em").
>> +
>> +As an example:
>> +
>> +chosen {
>> +    xen,scmi-secondary-agents =3D <
>> +        1 0x82000003 &scmi_shm_1
>> +        2 0x82000004 &scmi_shm_2
>> +        3 0x82000005 &scmi_shm_3
>> +        4 0x82000006 &scmi_shm_4>;
>> +}
>=20
> NIT: it should be };
>=20
> Looking at scmi_probe, collect_agents, and the following SCMI
> SCMI_BASE_DISCOVER_AGENT request, I wonder: do we actually need this
> information?
>=20
> It looks like we can discover the agend_ids for every channel, I guess
> what we need to know is the shmem location for every channel? But the
> full list of shmem channel is available below thanks to the scmi-shmem
> nodes.
>=20
> So, we have the list of scmi-shmem anyway, and we can probe the
> agent_id. The only parameter left is the smc_id/func_id.
>=20
> Or maybe smc_id/func_id can be calculated from agent_id?
>=20
> I am asking mostly because if a user is supposed to add this
> xen,scmi-secondary-agents property, where are they supposed to find the
> smc_id/func_id information?
>=20
> It is important that we write down in this document how the user is
> expected to find out what 1 is 0x82000003 which is scmi_shm_1.
>=20
>=20
>> +/{
>> +        scmi_shm_1: sram@47ff1000 {
>> +                compatible =3D "arm,scmi-shmem";
>> +                reg =3D <0x0 0x47ff1000 0x0 0x1000>;
>> +        };
>> +        scmi_shm_2: sram@47ff2000 {
>> +                compatible =3D "arm,scmi-shmem";
>> +                reg =3D <0x0 0x47ff2000 0x0 0x1000>;
>> +        };
>> +        scmi_shm_3: sram@47ff3000 {
>> +                compatible =3D "arm,scmi-shmem";
>> +                reg =3D <0x0 0x47ff3000 0x0 0x1000>;
>> +        };
>> +        scmi_shm_3: sram@47ff4000 {
>> +                compatible =3D "arm,scmi-shmem";
>> +                reg =3D <0x0 0x47ff4000 0x0 0x1000>;
>> +        };
>=20
> Are these scmi_shm_1 - scmi_shm_3 under the top level device tree node?
> Or are under /firmware? Or are they under /chosen?
>=20
> I take they are under the top level node together with scmi_shm_0?
>=20
> Can you please also clarify in the document as well?
>=20
>=20
>> +}
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-l=
ine.pandoc
>> index 8e50f6b7c7..bc3c64d6ec 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1091,6 +1091,15 @@ which serves as Driver domain. The SCMI will be d=
isabled for Dom0/hwdom and
>> SCMI nodes removed from Dom0/hwdom device tree.
>> (for example, thin Dom0 with Driver domain use-case).
>>=20
>> +### dom0_scmi_agent_id (ARM)
>> +> `=3D <integer>`
>> +
>> +The option is available when `CONFIG_SCMI_SMC_MA` is compiled in, and a=
llows to
>> +enable SCMI functionality for Dom0 by specifying a non-zero ARM SCMI ag=
ent id.
>> +The SCMI will be disabled for Dom0 if this option is not specified
>> +(for example, thin Dom0 or dom0less use-cases).
>> +The agent ids of domains existing on a single host must be unique.
>> +
>> ### dtuart (ARM)
>>> `=3D path [:options]`
>>=20
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 28ba9eb787..7712f53cd4 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -229,6 +229,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc=
,
>>     case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
>>         config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC=
;
>>         break;
>> +    case LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT:
>> +        config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SM=
C_MA;
>> +        config->arch.arm_sci_agent_id =3D d_config->b_info.arch_arm.arm=
_sci.agent_id;
>> +        break;
>>     default:
>>         LOG(ERROR, "Unknown ARM_SCI type %d",
>>             d_config->b_info.arch_arm.arm_sci.type);
>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_t=
ypes.idl
>> index aa2190ab5b..11e31ce786 100644
>> --- a/tools/libs/light/libxl_types.idl
>> +++ b/tools/libs/light/libxl_types.idl
>> @@ -553,11 +553,13 @@ libxl_sve_type =3D Enumeration("sve_type", [
>>=20
>> libxl_arm_sci_type =3D Enumeration("arm_sci_type", [
>>     (0, "none"),
>> -    (1, "scmi_smc")
>> +    (1, "scmi_smc"),
>> +    (2, "scmi_smc_multiagent")
>>     ], init_val =3D "LIBXL_ARM_SCI_TYPE_NONE")
>>=20
>> libxl_arm_sci =3D Struct("arm_sci", [
>>     ("type", libxl_arm_sci_type),
>> +    ("agent_id", uint8)
>>     ])
>>=20
>> libxl_rdm_reserve =3D Struct("rdm_reserve", [
>> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
>> index bd22be9d33..81aa3797e3 100644
>> --- a/tools/xl/xl_parse.c
>> +++ b/tools/xl/xl_parse.c
>> @@ -1306,6 +1306,18 @@ static int parse_arm_sci_config(XLU_Config *cfg, =
libxl_arm_sci *arm_sci,
>>             }
>>         }
>>=20
>> +        if (MATCH_OPTION("agent_id", ptr, oparg)) {
>> +            unsigned long val =3D parse_ulong(oparg);
>> +
>> +            if (!val || val > 255) {
>> +                fprintf(stderr, "An invalid ARM_SCI agent_id specified =
(%lu). Valid range [1..255]\n",
>> +                        val);
>> +                ret =3D ERROR_INVAL;
>> +                goto parse_error;
>> +            }
>> +            arm_sci->agent_id =3D val;
>> +        }
>> +
>>         ptr =3D strtok(NULL, ",");
>>     }
>>=20
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build=
.c
>> index 0a00f03a25..43d21eb889 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -835,6 +835,17 @@ int __init domu_dt_sci_parse(struct dt_device_node =
*node,
>>         d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
>>     else if ( !strcmp(sci_type, "scmi_smc") )
>>         d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
>> +    else if ( !strcmp(sci_type, "scmi_smc_multiagent") )
>> +    {
>> +        uint32_t agent_id =3D 0;
>> +
>> +        if ( !dt_property_read_u32(node, "xen,sci_agent_id", &agent_id)=
 ||
>> +             !agent_id )
>=20
> shouldn't we check that agent_id <=3D 255 ?
>=20
>=20
>> +            return -EINVAL;
>> +
>> +        d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC=
_MA;
>> +        d_cfg->arch.arm_sci_agent_id =3D agent_id;
>> +    }
>>     else
>>     {
>>         printk(XENLOG_ERR "xen,sci_type in not valid (%s) for domain %s\=
n",
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 36d28b52a4..0c9274a2b3 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -616,7 +616,8 @@ static int __init write_properties(struct domain *d,=
 struct kernel_info *kinfo,
>>                  dt_property_name_is_equal(prop, "linux,uefi-mmap-start"=
) ||
>>                  dt_property_name_is_equal(prop, "linux,uefi-mmap-size")=
 ||
>>                  dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-s=
ize") ||
>> -                 dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-=
ver"))
>> +                 dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-=
ver") ||
>> +                 dt_property_name_is_equal(prop, "xen,scmi-secondary-ag=
ents") )
>>                 continue;
>>=20
>>             if ( dt_property_name_is_equal(prop, "xen,dom0-bootargs") )
>> diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconf=
ig
>> index 5c5f0880c4..6b051c8ada 100644
>> --- a/xen/arch/arm/firmware/Kconfig
>> +++ b/xen/arch/arm/firmware/Kconfig
>> @@ -29,6 +29,17 @@ config SCMI_SMC
>>   driver domain.
>>   Use with EL3 firmware which supports only single SCMI OSPM agent.
>>=20
>> +config SCMI_SMC_MA
>> + bool "Enable ARM SCMI SMC multi-agent driver"
>> + select ARM_SCI
>> + help
>> +   Enables SCMI SMC/HVC multi-agent in XEN to pass SCMI requests from D=
omains
>> +   to EL3 firmware (TF-A) which supports multi-agent feature.
>> +   This feature allows to enable SCMI per Domain using unique SCMI agen=
t_id,
>> +   so Domain is identified by EL3 firmware as an SCMI Agent and can acc=
ess
>> +   allowed platform resources through dedicated SMC/HVC Shared memory b=
ased
>> +   transport.
>> +
>> endchoice
>>=20
>> endmenu
>> diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Make=
file
>> index 71bdefc24a..37927e690e 100644
>> --- a/xen/arch/arm/firmware/Makefile
>> +++ b/xen/arch/arm/firmware/Makefile
>> @@ -1,2 +1,3 @@
>> obj-$(CONFIG_ARM_SCI) +=3D sci.o
>> obj-$(CONFIG_SCMI_SMC) +=3D scmi-smc.o
>> +obj-$(CONFIG_SCMI_SMC_MA) +=3D scmi-shmem.o scmi-smc-multiagent.o
>> diff --git a/xen/arch/arm/firmware/scmi-proto.h b/xen/arch/arm/firmware/=
scmi-proto.h
>> new file mode 100644
>> index 0000000000..3f4b9c5d6b
>> --- /dev/null
>> +++ b/xen/arch/arm/firmware/scmi-proto.h
>> @@ -0,0 +1,164 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Arm System Control and Management Interface definitions
>> + * Version 3.0 (DEN0056C)
>> + *
>> + * Copyright (c) 2024 EPAM Systems
>> + */
>> +
>> +#ifndef XEN_ARCH_ARM_SCI_SCMI_PROTO_H_
>> +#define XEN_ARCH_ARM_SCI_SCMI_PROTO_H_
>=20
> NIT: ARM_FIRMWARE_SCMI_PROTO_H
>=20
>=20
>> +#include <xen/stdint.h>
>> +
>> +#define SCMI_SHORT_NAME_MAX_SIZE 16
>> +
>> +/* SCMI status codes. See section 4.1.4 */
>> +#define SCMI_SUCCESS              0
>> +#define SCMI_NOT_SUPPORTED      (-1)
>> +#define SCMI_INVALID_PARAMETERS (-2)
>> +#define SCMI_DENIED             (-3)
>> +#define SCMI_NOT_FOUND          (-4)
>> +#define SCMI_OUT_OF_RANGE       (-5)
>> +#define SCMI_BUSY               (-6)
>> +#define SCMI_COMMS_ERROR        (-7)
>> +#define SCMI_GENERIC_ERROR      (-8)
>> +#define SCMI_HARDWARE_ERROR     (-9)
>> +#define SCMI_PROTOCOL_ERROR     (-10)
>> +
>> +/* Protocol IDs */
>> +#define SCMI_BASE_PROTOCOL 0x10
>> +
>> +/* Base protocol message IDs */
>> +#define SCMI_BASE_PROTOCOL_VERSION            0x0
>> +#define SCMI_BASE_PROTOCOL_ATTIBUTES          0x1
>> +#define SCMI_BASE_PROTOCOL_MESSAGE_ATTRIBUTES 0x2
>> +#define SCMI_BASE_DISCOVER_AGENT              0x7
>> +#define SCMI_BASE_SET_DEVICE_PERMISSIONS      0x9
>> +#define SCMI_BASE_RESET_AGENT_CONFIGURATION   0xB
>> +
>> +typedef struct scmi_msg_header {
>> +    uint8_t id;
>> +    uint8_t type;
>> +    uint8_t protocol;
>> +    uint32_t status;
>> +} scmi_msg_header_t;
>> +
>> +/* Table 2 Message header format */
>> +#define SCMI_HDR_ID    GENMASK(7, 0)
>> +#define SCMI_HDR_TYPE  GENMASK(9, 8)
>> +#define SCMI_HDR_PROTO GENMASK(17, 10)
>> +
>> +#define SCMI_FIELD_GET(_mask, _reg)                                    =
        \
>> +    ((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
>> +#define SCMI_FIELD_PREP(_mask, _val)                                   =
        \
>> +    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
>> +
>> +static inline uint32_t pack_scmi_header(scmi_msg_header_t *hdr)
>> +{
>> +    return SCMI_FIELD_PREP(SCMI_HDR_ID, hdr->id) |
>> +           SCMI_FIELD_PREP(SCMI_HDR_TYPE, hdr->type) |
>> +           SCMI_FIELD_PREP(SCMI_HDR_PROTO, hdr->protocol);
>> +}
>> +
>> +static inline void unpack_scmi_header(uint32_t msg_hdr, scmi_msg_header=
_t *hdr)
>> +{
>> +    hdr->id =3D SCMI_FIELD_GET(SCMI_HDR_ID, msg_hdr);
>> +    hdr->type =3D SCMI_FIELD_GET(SCMI_HDR_TYPE, msg_hdr);
>> +    hdr->protocol =3D SCMI_FIELD_GET(SCMI_HDR_PROTO, msg_hdr);
>> +}
>> +
>> +static inline int scmi_to_xen_errno(int scmi_status)
>> +{
>> +    if ( scmi_status =3D=3D SCMI_SUCCESS )
>> +        return 0;
>> +
>> +    switch ( scmi_status )
>> +    {
>> +    case SCMI_NOT_SUPPORTED:
>> +        return -EOPNOTSUPP;
>> +    case SCMI_INVALID_PARAMETERS:
>> +        return -EINVAL;
>> +    case SCMI_DENIED:
>> +        return -EACCES;
>> +    case SCMI_NOT_FOUND:
>> +        return -ENOENT;
>> +    case SCMI_OUT_OF_RANGE:
>> +        return -ERANGE;
>> +    case SCMI_BUSY:
>> +        return -EBUSY;
>> +    case SCMI_COMMS_ERROR:
>> +        return -ENOTCONN;
>> +    case SCMI_GENERIC_ERROR:
>> +        return -EIO;
>> +    case SCMI_HARDWARE_ERROR:
>> +        return -ENXIO;
>> +    case SCMI_PROTOCOL_ERROR:
>> +        return -EBADMSG;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +}
>> +
>> +/* PROTOCOL_VERSION */
>> +#define SCMI_VERSION_MINOR GENMASK(15, 0)
>> +#define SCMI_VERSION_MAJOR GENMASK(31, 16)
>> +
>> +struct scmi_msg_prot_version_p2a {
>> +    uint32_t version;
>> +} __packed;
>> +
>> +/* BASE PROTOCOL_ATTRIBUTES */
>> +#define SCMI_BASE_ATTR_NUM_PROTO GENMASK(7, 0)
>> +#define SCMI_BASE_ATTR_NUM_AGENT GENMASK(15, 8)
>> +
>> +struct scmi_msg_base_attributes_p2a {
>> +    uint32_t attributes;
>> +} __packed;
>> +
>> +/*
>> + * BASE_DISCOVER_AGENT
>> + */
>> +#define SCMI_BASE_AGENT_ID_OWN 0xFFFFFFFF
>> +
>> +struct scmi_msg_base_discover_agent_a2p {
>> +    uint32_t agent_id;
>> +} __packed;
>> +
>> +struct scmi_msg_base_discover_agent_p2a {
>> +    uint32_t agent_id;
>> +    char name[SCMI_SHORT_NAME_MAX_SIZE];
>> +} __packed;
>> +
>> +/*
>> + * BASE_SET_DEVICE_PERMISSIONS
>> + */
>> +#define SCMI_BASE_DEVICE_ACCESS_ALLOW           BIT(0, UL)
>> +
>> +struct scmi_msg_base_set_device_permissions_a2p {
>> +    uint32_t agent_id;
>> +    uint32_t device_id;
>> +    uint32_t flags;
>> +} __packed;
>> +
>> +/*
>> + * BASE_RESET_AGENT_CONFIGURATION
>> + */
>> +#define SCMI_BASE_AGENT_PERMISSIONS_RESET       BIT(0, UL)
>> +
>> +struct scmi_msg_base_reset_agent_cfg_a2p {
>> +    uint32_t agent_id;
>> +    uint32_t flags;
>> +} __packed;
>> +
>> +#endif /* XEN_ARCH_ARM_SCI_SCMI_PROTO_H_ */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * tab-width: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/firmware/scmi-shmem.c b/xen/arch/arm/firmware/=
scmi-shmem.c
>> new file mode 100644
>> index 0000000000..dd613ee0b5
>> --- /dev/null
>> +++ b/xen/arch/arm/firmware/scmi-shmem.c
>> @@ -0,0 +1,173 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * SCI SCMI multi-agent driver, using SMC/HVC shmem as transport.
>> + *
>> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> + * Copyright (c) 2025 EPAM Systems
>> + */
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <asm/io.h>
>> +#include <xen/err.h>
>> +
>> +#include "scmi-proto.h"
>> +#include "scmi-shmem.h"
>=20
> This code is written more generically than the description implies. If
> we only want to make SMC calls to TF-A on EL3 and exchange data with it
> over shared memory, then I think:
> - we don't need the __iomem tag, as there is no MMIO

agree

> - we only need a DMB, not a DSB (readl and writel imply DSB, use only
>  readl_relaxed and writel_relaxed)

agree

>=20
> On the other hand, if we also want to handle the case where the SCMI
> server could be on a separate co-processor, then what this code is doing
> is not sufficient because we also need a dcache flush, in addition to
> the DSB.
>=20
> Bertrand, can you double-check?

If we want to handle a case where the memory is accessible to a coprocessor
but there is no cache coherency, we need to flush the dcache definitely.

Seeing the amount of data here, I do agree with Stefano that it would be a =
good
idea to make the provision to flush the data cache in all cases. Even if th=
e data
is accessed by a secure partition or the firmware coherently, flushing in a=
ll cases
would have very limited performance impact here.

There is the other solution to have some kind of parameter to say if the ac=
cessor
has coherent cache access but I do not think the performance impact here wo=
uld
justify such a complexity.

Cheers
Bertrand

>=20
>=20
>> +/*
>> + * Copy data from IO memory space to "real" memory space.
>> + */
>> +static void __memcpy_fromio(void *to, const volatile void __iomem *from=
,
>> +                            size_t count)
>> +{
>> +    while ( count && !IS_ALIGNED((unsigned long)from, 4) )
>> +    {
>> +        *(u8 *)to =3D readb_relaxed(from);
>> +        from++;
>> +        to++;
>> +        count--;
>> +    }
>> +
>> +    while ( count >=3D 4 )
>> +    {
>> +        *(u32 *)to =3D readl_relaxed(from);
>> +        from +=3D 4;
>> +        to +=3D 4;
>> +        count -=3D 4;
>> +    }
>> +
>> +    while ( count )
>> +    {
>> +        *(u8 *)to =3D readb_relaxed(from);
>> +        from++;
>> +        to++;
>> +        count--;
>> +    }
>> +}
>> +
>> +/*
>> + * Copy data from "real" memory space to IO memory space.
>> + */
>> +static void __memcpy_toio(volatile void __iomem *to, const void *from,
>> +                          size_t count)
>> +{
>> +    while ( count && !IS_ALIGNED((unsigned long)to, 4) )
>> +    {
>> +        writeb_relaxed(*(u8 *)from, to);
>> +        from++;
>> +        to++;
>> +        count--;
>> +    }
>> +
>> +    while ( count >=3D 4 )
>> +    {
>> +        writel_relaxed(*(u32 *)from, to);
>> +        from +=3D 4;
>> +        to +=3D 4;
>> +        count -=3D 4;
>> +    }
>> +
>> +    while ( count )
>> +    {
>> +        writeb_relaxed(*(u8 *)from, to);
>> +        from++;
>> +        to++;
>> +        count--;
>> +    }
>> +}
>=20
> I don't understand why we need __memcpy_fromio and __memcpy_toio: can't
> we use a simple memcpy?
>=20
>=20
>> +static inline int
>> +shmem_channel_is_free(const volatile struct scmi_shared_mem __iomem *sh=
mem)
>> +{
>> +    return (readl(&shmem->channel_status) &
>> +            SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE) ? 0 : -EBUSY;
>> +}
>> +
>> +int shmem_put_message(volatile struct scmi_shared_mem __iomem *shmem,
>> +                      scmi_msg_header_t *hdr, void *data, int len)
>> +{
>> +    int ret;
>> +
>> +    if ( (len + sizeof(shmem->msg_header)) > SCMI_SHMEM_MAPPED_SIZE )
>> +    {
>> +        printk(XENLOG_ERR "scmi: Wrong size of smc message. Data is inv=
alid\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret =3D shmem_channel_is_free(shmem);
>> +    if ( ret )
>> +        return ret;
>> +
>> +    writel_relaxed(0x0, &shmem->channel_status);
>> +    /* Writing 0x0 right now, but "shmem"_FLAG_INTR_ENABLED can be set =
*/
>> +    writel_relaxed(0x0, &shmem->flags);
>> +    writel_relaxed(sizeof(shmem->msg_header) + len, &shmem->length);
>> +    writel(pack_scmi_header(hdr), &shmem->msg_header);
>> +
>> +    if ( len > 0 && data )
>> +        __memcpy_toio(shmem->msg_payload, data, len);
>> +
>> +    return 0;
>> +}
>> +
>> +int shmem_get_response(const volatile struct scmi_shared_mem __iomem *s=
hmem,
>> +                       scmi_msg_header_t *hdr, void *data, int len)
>> +{
>> +    int recv_len;
>> +    int ret;
>> +    int pad =3D sizeof(hdr->status);
>> +
>> +    if ( len >=3D SCMI_SHMEM_MAPPED_SIZE - sizeof(shmem) )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "scmi: Wrong size of input smc message. Data may be inva=
lid\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret =3D shmem_channel_is_free(shmem);
>> +    if ( ret )
>> +        return ret;
>> +
>> +    recv_len =3D readl(&shmem->length) - sizeof(shmem->msg_header);
>> +
>> +    if ( recv_len < 0 )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "scmi: Wrong size of smc message. Data may be invalid\n"=
);
>> +        return -EINVAL;
>> +    }
>> +
>> +    unpack_scmi_header(readl(&shmem->msg_header), hdr);
>> +
>> +    hdr->status =3D readl(&shmem->msg_payload);
>> +    recv_len =3D recv_len > pad ? recv_len - pad : 0;
>> +
>> +    ret =3D scmi_to_xen_errno(hdr->status);
>> +    if ( ret )
>> +    {
>> +        printk(XENLOG_DEBUG "scmi: Error received: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    if ( recv_len > len )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "scmi: Not enough buffer for message %d, expecting %d\n"=
,
>> +               recv_len, len);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if ( recv_len > 0 )
>> +        __memcpy_fromio(data, shmem->msg_payload + pad, recv_len);
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * tab-width: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/firmware/scmi-shmem.h b/xen/arch/arm/firmware/=
scmi-shmem.h
>> new file mode 100644
>> index 0000000000..2f8e23ff76
>> --- /dev/null
>> +++ b/xen/arch/arm/firmware/scmi-shmem.h
>> @@ -0,0 +1,45 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Arm System Control and Management Interface definitions
>> + * Version 3.0 (DEN0056C)
>> + * Shared Memory based Transport
>> + *
>> + * Copyright (c) 2024 EPAM Systems
>> + */
>> +
>> +#ifndef XEN_ARCH_ARM_SCI_SCMI_SHMEM_H_
>> +#define XEN_ARCH_ARM_SCI_SCMI_SHMEM_H_
>=20
> NIT: ARM_FIRMWARE_SCMI_SHMEM_H
>=20
>=20
>> +#include <xen/stdint.h>
>> +
>> +#define SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE  BIT(0, UL)
>> +#define SCMI_SHMEM_CHAN_STAT_CHANNEL_ERROR BIT(1, UL)
>> +
>> +struct scmi_shared_mem {
>> +    uint32_t reserved;
>> +    uint32_t channel_status;
>> +    uint32_t reserved1[2];
>> +    uint32_t flags;
>> +    uint32_t length;
>> +    uint32_t msg_header;
>> +    uint8_t msg_payload[];
>> +};
>> +
>> +#define SCMI_SHMEM_MAPPED_SIZE PAGE_SIZE
>> +
>> +int shmem_put_message(volatile struct scmi_shared_mem __iomem *shmem,
>> +                      scmi_msg_header_t *hdr, void *data, int len);
>> +
>> +int shmem_get_response(const volatile struct scmi_shared_mem __iomem *s=
hmem,
>> +                       scmi_msg_header_t *hdr, void *data, int len);
>> +#endif /* XEN_ARCH_ARM_SCI_SCMI_SHMEM_H_ */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * tab-width: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/firmware/scmi-smc-multiagent.c b/xen/arch/arm/=
firmware/scmi-smc-multiagent.c
>> new file mode 100644
>> index 0000000000..e023bca3a1
>> --- /dev/null
>> +++ b/xen/arch/arm/firmware/scmi-smc-multiagent.c
>> @@ -0,0 +1,860 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * SCI SCMI multi-agent driver, using SMC/HVC shmem as transport.
>> + *
>> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> + * Copyright (c) 2025 EPAM Systems
>> + */
>> +
>> +#include <xen/acpi.h>
>> +
>> +#include <xen/device_tree.h>
>> +#include <xen/init.h>
>> +#include <xen/iocap.h>
>> +#include <xen/err.h>
>> +#include <xen/libfdt/libfdt.h>
>> +#include <xen/param.h>
>> +#include <xen/sched.h>
>> +#include <xen/vmap.h>
>> +
>> +#include <asm/firmware/sci.h>
>> +#include <asm/smccc.h>
>> +
>> +#include "scmi-proto.h"
>> +#include "scmi-shmem.h"
>> +
>> +#define SCMI_AGENT_ID_INVALID 0xFF
>> +
>> +static uint8_t __initdata opt_dom0_scmi_agent_id =3D SCMI_AGENT_ID_INVA=
LID;
>> +integer_param("dom0_scmi_agent_id", opt_dom0_scmi_agent_id);
>> +
>> +#define SCMI_SECONDARY_AGENTS "xen,scmi-secondary-agents"
>> +
>> +#define HYP_CHANNEL 0x0
>> +
>> +struct scmi_channel {
>> +    uint32_t agent_id;
>> +    uint32_t func_id;
>> +    domid_t domain_id;
>> +    uint64_t paddr;
>> +    uint64_t len;
>> +    struct scmi_shared_mem __iomem *shmem;
>> +    spinlock_t lock;
>> +    struct list_head list;
>> +};
>> +
>> +struct scmi_data {
>> +    struct list_head channel_list;
>> +    spinlock_t channel_list_lock;
>> +    uint32_t func_id;
>> +    bool initialized;
>> +    uint32_t shmem_phandle;
>> +    struct dt_device_node *dt_dev;
>> +};
>> +
>> +static struct scmi_data scmi_data;
>> +
>> +static int send_smc_message(struct scmi_channel *chan_info,
>> +                            scmi_msg_header_t *hdr, void *data, int len=
)
>> +{
>> +    struct arm_smccc_res resp;
>> +    int ret;
>> +
>> +    ret =3D shmem_put_message(chan_info->shmem, hdr, data, len);
>> +    if ( ret )
>> +        return ret;
>> +
>> +    arm_smccc_1_1_smc(chan_info->func_id, 0, 0, 0, 0, 0, 0, 0, &resp);
>> +
>> +    if ( resp.a0 )
>> +        return -EOPNOTSUPP;
>=20
> Why if repo.a0 !=3D 0 then we assume -EOPNOTSUPP? Is this part of the SCM=
I
> specification?
>=20
>=20
>> +    return 0;
>> +}
>> +
>> +static int do_smc_xfer(struct scmi_channel *chan_info, scmi_msg_header_=
t *hdr,
>> +                       void *tx_data, int tx_size, void *rx_data, int r=
x_size)
>> +{
>> +    int ret =3D 0;
>> +
>> +    ASSERT(chan_info && chan_info->shmem);
>> +
>> +    if ( !hdr )
>> +        return -EINVAL;
>> +
>> +    spin_lock(&chan_info->lock);
>> +
>> +    printk(XENLOG_DEBUG
>> +           "scmi: agent_id =3D %d msg_id =3D %x type =3D %d, proto =3D =
%x\n",
>> +           chan_info->agent_id, hdr->id, hdr->type, hdr->protocol);
>> +
>> +    ret =3D send_smc_message(chan_info, hdr, tx_data, tx_size);
>> +    if ( ret )
>> +        goto clean;
>> +
>> +    ret =3D shmem_get_response(chan_info->shmem, hdr, rx_data, rx_size)=
;
>> +
>> +clean:
>> +    printk(XENLOG_DEBUG
>> +           "scmi: get smc response agent_id =3D %d msg_id =3D %x proto =
=3D %x res=3D%d\n",
>> +           chan_info->agent_id, hdr->id, hdr->protocol, ret);
>> +
>> +    spin_unlock(&chan_info->lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static struct scmi_channel *get_channel_by_id(uint32_t agent_id)
>> +{
>> +    struct scmi_channel *curr;
>> +    bool found =3D false;
>> +
>> +    spin_lock(&scmi_data.channel_list_lock);
>> +    list_for_each_entry(curr, &scmi_data.channel_list, list)
>> +    {
>> +        if ( curr->agent_id =3D=3D agent_id )
>> +        {
>> +            found =3D true;
>> +            break;
>> +        }
>> +    }
>> +
>> +    spin_unlock(&scmi_data.channel_list_lock);
>> +    if ( found )
>> +        return curr;
>> +
>> +    return NULL;
>> +}
>> +
>> +static struct scmi_channel *acquire_scmi_channel(struct domain *d,
>> +                                                 uint32_t agent_id)
>> +{
>> +    struct scmi_channel *curr;
>> +    struct scmi_channel *ret =3D ERR_PTR(-ENOENT);
>> +
>> +    spin_lock(&scmi_data.channel_list_lock);
>> +    list_for_each_entry(curr, &scmi_data.channel_list, list)
>> +    {
>> +        if ( curr->agent_id =3D=3D agent_id )
>> +        {
>> +            if ( curr->domain_id !=3D DOMID_INVALID )
>> +            {
>> +                ret =3D ERR_PTR(-EEXIST);
>> +                break;
>> +            }
>> +
>> +            curr->domain_id =3D d->domain_id;
>> +            ret =3D curr;
>> +            break;
>> +        }
>> +    }
>> +
>> +    spin_unlock(&scmi_data.channel_list_lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static void relinquish_scmi_channel(struct scmi_channel *channel)
>> +{
>> +    ASSERT(channel !=3D NULL);
>> +
>> +    spin_lock(&scmi_data.channel_list_lock);
>> +    channel->domain_id =3D DOMID_INVALID;
>> +    spin_unlock(&scmi_data.channel_list_lock);
>> +}
>> +
>> +static int map_channel_memory(struct scmi_channel *channel)
>> +{
>> +    ASSERT(channel && channel->paddr);
>> +    channel->shmem =3D ioremap_nocache(channel->paddr, SCMI_SHMEM_MAPPE=
D_SIZE);
>=20
> ioremap is for MMIO, if these shared memory channels are on DDR, then it
> would not be the right call. Are the "arm,scmi-shmem" address ranges
> part of the memory node ranges? Or are they completely separate?
>=20
> Also, why nocache? Wouldn't we want ioremap_cache?
>=20
>=20
>> +    if ( !channel->shmem )
>> +        return -ENOMEM;
>> +
>> +    channel->shmem->channel_status =3D SCMI_SHMEM_CHAN_STAT_CHANNEL_FRE=
E;
>> +    printk(XENLOG_DEBUG "scmi: Got shmem %lx after vmap %p\n", channel-=
>paddr,
>> +           channel->shmem);
>> +
>> +    return 0;
>> +}
>> +
>> +static void unmap_channel_memory(struct scmi_channel *channel)
>> +{
>> +    ASSERT(channel && channel->shmem);
>> +    iounmap(channel->shmem);
>> +    channel->shmem =3D NULL;
>> +}
>> +
>> +static struct scmi_channel *smc_create_channel(uint32_t agent_id,
>> +                                               uint32_t func_id, uint64=
_t addr)
>> +{
>> +    struct scmi_channel *channel;
>> +
>> +    channel =3D get_channel_by_id(agent_id);
>> +    if ( channel )
>> +        return ERR_PTR(EEXIST);
>> +
>> +    channel =3D xmalloc(struct scmi_channel);
>> +    if ( !channel )
>> +        return ERR_PTR(ENOMEM);
>> +
>> +    spin_lock_init(&channel->lock);
>> +    channel->agent_id =3D agent_id;
>> +    channel->func_id =3D func_id;
>> +    channel->domain_id =3D DOMID_INVALID;
>> +    channel->shmem =3D NULL;
>> +    channel->paddr =3D addr;
>> +    list_add_tail(&channel->list, &scmi_data.channel_list);
>> +    return channel;
>> +}
>> +
>> +static void free_channel_list(void)
>> +{
>> +    struct scmi_channel *curr, *_curr;
>> +
>> +    list_for_each_entry_safe(curr, _curr, &scmi_data.channel_list, list=
)
>> +    {
>> +        list_del(&curr->list);
>> +        xfree(curr);
>> +    }
>> +}
>> +
>> +static int __init
>> +scmi_dt_read_hyp_channel_addr(struct dt_device_node *scmi_node, u64 *ad=
dr,
>> +                              u64 *size)
>> +{
>> +    struct dt_device_node *shmem_node;
>> +    const __be32 *prop;
>> +
>> +    prop =3D dt_get_property(scmi_node, "shmem", NULL);
>> +    if ( !prop )
>> +        return -EINVAL;
>> +
>> +    shmem_node =3D dt_find_node_by_phandle(be32_to_cpup(prop));
>> +    if ( IS_ERR_OR_NULL(shmem_node) )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "scmi: Device tree error, can't parse reserved memory %l=
d\n",
>> +               PTR_ERR(shmem_node));
>> +        return PTR_ERR(shmem_node);
>> +    }
>> +
>> +    return dt_device_get_address(shmem_node, 0, addr, size);
>> +}
>> +
>> +/*
>> + * Handle Dom0 SCMI specific DT nodes
>> + *
>> + * Make a decision on copying SCMI specific nodes into Dom0 device tree=
.
>> + * For SCMI multi-agent case:
>> + * - shmem nodes will not be copied and generated instead if SCMI
>> + *   is enabled for Dom0
>> + * - scmi node will be copied if SCMI is enabled for Dom0
>> + */
>> +static bool scmi_dt_handle_node(struct domain *d, struct dt_device_node=
 *node)
>> +{
>> +    static const struct dt_device_match skip_matches[] __initconst =3D =
{
>> +        DT_MATCH_COMPATIBLE("arm,scmi-shmem"),
>> +        { /* sentinel */ },
>> +    };
>> +    static const struct dt_device_match scmi_matches[] __initconst =3D =
{
>> +        DT_MATCH_PATH("/firmware/scmi"),
>> +        { /* sentinel */ },
>> +    };
>> +
>> +    if ( !scmi_data.initialized )
>> +        return false;
>> +
>> +    /* always drop shmem */
>> +    if ( dt_match_node(skip_matches, node) )
>> +    {
>> +        dt_dprintk("  Skip scmi shmem\n");
>> +        return true;
>> +    }
>> +
>> +    /* drop scmi if not enabled */
>> +    if ( dt_match_node(scmi_matches, node) && !sci_domain_is_enabled(d)=
 )
>> +    {
>> +        dt_dprintk("  Skip scmi node\n");
>> +        return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +/*
>> + * Finalize Dom0 SCMI specific DT nodes
>> + *
>> + * if SCMI is enabled for Dom0:
>> + * - generate shmem node
>> + * - map SCMI shmem MMIO into Dom0
>> + */
>> +static int scmi_dt_finalize(struct domain *d, void *fdt)
>> +{
>> +    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
>> +    struct scmi_channel *channel;
>> +    int nodeoffset;
>> +    __be32 *cells;
>> +    __be32 val;
>> +    char buf[64];
>> +    int res, rc;
>> +
>> +    if ( !sci_domain_is_enabled(d) )
>> +        return 0;
>> +
>> +    channel =3D d->arch.sci_data;
>> +
>> +    /*
>> +     * Replace "arm,smc-id" with proper value assigned for Dom0 SCMI ch=
annel
>> +     */
>> +    nodeoffset =3D fdt_node_offset_by_compatible(fdt, -1, "arm,scmi-smc=
");
>> +    if ( nodeoffset < 0 )
>> +        return -ENODEV;
>> +
>> +    cells =3D (__be32 *)&val;
>> +    dt_set_cell(&cells, 1, channel->func_id);
>> +    res =3D fdt_setprop_inplace(fdt, nodeoffset, "arm,smc-id", &val, si=
zeof(val));
>> +    if ( res )
>> +        return -EINVAL;
>> +
>=20
> Are you sure it is worth to go through all this trouble to modify FDT in
> place when we could simply generate the DT node from scratch like we do
> for example for the GIC? This seems to be more error prone as well. Is
> generating it from scratch is really difficult? If it is difficult then O=
K.
>=20
>=20
>> +    /*
>> +     * All SCMI shmem nodes should be removed from Dom0 DT at this poin=
t, so
>> +     * the shmem node for Dom0 need to be generated from SCMI channel a=
ssigned
>> +     * to Dom0.
>> +     * The original SCMI shmem node from platform DT is used by Xen SCM=
I driver
>> +     * itself as privileged channel (agent_id=3D0) to manage other SCMI
>> +     * agents (domains).
>> +     */
>> +    snprintf(buf, sizeof(buf), "scmi-shmem@%lx", channel->paddr);
>> +
>> +    res =3D fdt_begin_node(fdt, buf);
>> +    if ( res )
>> +        return res;
>> +
>> +    res =3D fdt_property_string(fdt, "compatible", "arm,scmi-shmem");
>> +    if ( res )
>> +        return res;
>> +
>> +    cells =3D &reg[0];
>> +
>> +    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZ=
E_CELLS,
>> +                       channel->paddr, SCMI_SHMEM_MAPPED_SIZE);
>> +
>> +    res =3D fdt_property(fdt, "reg", reg, sizeof(reg));
>> +    if ( res )
>> +        return res;
>> +
>> +    res =3D fdt_property_cell(fdt, "phandle", scmi_data.shmem_phandle);
>> +    if ( res )
>> +        return res;
>> +
>> +    res =3D fdt_end_node(fdt);
>> +    if ( res )
>> +        return res;
>> +
>> +    /*
>> +     * Map SCMI shmem into Dom0 here as shmem nodes are excluded from
>> +     * generic Dom0 DT processing
>> +     */
>> +    res =3D iomem_permit_access(d, paddr_to_pfn(channel->paddr),
>> +                              paddr_to_pfn(channel->paddr +
>> +                                           SCMI_SHMEM_MAPPED_SIZE - 1))=
;
>> +    if ( res )
>> +        return res;
>> +
>> +    res =3D map_regions_p2mt(d, gaddr_to_gfn(channel->paddr),
>> +                           PFN_UP(SCMI_SHMEM_MAPPED_SIZE),
>> +                           maddr_to_mfn(channel->paddr), p2m_mmio_direc=
t_nc);
>> +    if ( res )
>> +    {
>> +        rc =3D iomem_deny_access(d, paddr_to_pfn(channel->paddr),
>> +                               paddr_to_pfn(channel->paddr +
>> +                                            SCMI_SHMEM_MAPPED_SIZE - 1)=
);
>> +        if ( rc )
>> +            printk(XENLOG_ERR "scmi: Unable to deny iomem access , err =
=3D %d\n",
>> +                   rc);
>> +    }
>> +
>> +    return res;
>> +}
>> +
>> +static int scmi_assign_device(uint32_t agent_id, uint32_t device_id,
>> +                              uint32_t flags)
>> +{
>> +    struct scmi_msg_base_set_device_permissions_a2p tx;
>> +    struct scmi_channel *channel;
>> +    scmi_msg_header_t hdr;
>> +    int ret;
>> +
>> +    channel =3D get_channel_by_id(HYP_CHANNEL);
>> +    if ( !channel )
>> +        return -EINVAL;
>> +
>> +    hdr.id =3D SCMI_BASE_SET_DEVICE_PERMISSIONS;
>> +    hdr.type =3D 0;
>> +    hdr.protocol =3D SCMI_BASE_PROTOCOL;
>> +
>> +    tx.agent_id =3D agent_id;
>> +    tx.device_id =3D device_id;
>> +    tx.flags =3D flags;
>> +
>> +    ret =3D do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
>> +    if ( ret =3D=3D -EOPNOTSUPP )
>> +        return 0;
>=20
> Is it actually OK to pretend that everything worked if the return is
> -EOPNOTSUPP? I mean that in this case can we assume that the device is
> actually assigned anyway? Wouldn't follow up SCMI operations on this
> device fail?
>=20
>=20
>> +    return ret;
>> +}
>> +
>> +static int scmi_dt_assign_device(struct domain *d,
>> +                                 struct dt_phandle_args *ac_spec)
>> +{
>> +    struct scmi_channel *agent_channel;
>> +    uint32_t scmi_device_id =3D ac_spec->args[0];
>> +    int ret;
>> +
>> +    if ( !d->arch.sci_data )
>> +        return 0;
>> +
>> +    /* The access-controllers is specified for DT dev, but it's not a S=
CMI */
>> +    if ( ac_spec->np !=3D scmi_data.dt_dev )
>> +        return 0;
>=20
> I wonder if this should be an error
>=20
>=20
>> +    agent_channel =3D d->arch.sci_data;
>> +
>> +    spin_lock(&agent_channel->lock);
>> +
>> +    ret =3D scmi_assign_device(agent_channel->agent_id, scmi_device_id,
>> +                             SCMI_BASE_DEVICE_ACCESS_ALLOW);
>> +    if ( ret )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "scmi: could not assign dev for %pd agent:%d dev_id:%u (=
%d)",
>> +               d, agent_channel->agent_id, scmi_device_id, ret);
>> +    }
>> +
>> +    spin_unlock(&agent_channel->lock);
>> +    return ret;
>> +}
>> +
>> +static __init int collect_agents(struct dt_device_node *scmi_node)
>> +{
>> +    const struct dt_device_node *chosen_node;
>> +    const __be32 *prop;
>> +    uint32_t len, i;
>> +
>> +    chosen_node =3D dt_find_node_by_path("/chosen");
>> +    if ( !chosen_node )
>> +    {
>> +        printk(XENLOG_ERR "scmi: chosen node not found\n");
>> +        return -ENOENT;
>> +    }
>> +
>> +    prop =3D dt_get_property(chosen_node, SCMI_SECONDARY_AGENTS, &len);
>> +    if ( !prop )
>> +    {
>> +        printk(XENLOG_WARNING "scmi: No %s property found\n",
>> +               SCMI_SECONDARY_AGENTS);
>> +        return -ENODEV;
>> +    }
>> +
>> +    if ( len % (3 * sizeof(uint32_t)) )
>> +    {
>> +        printk(XENLOG_ERR "scmi: Invalid length of %s property: %d\n",
>> +               SCMI_SECONDARY_AGENTS, len);
>> +        return -EINVAL;
>> +    }
>> +
>> +    for ( i =3D 0; i < len / (3 * sizeof(uint32_t)); i++ )
>> +    {
>> +        uint32_t agent_id =3D be32_to_cpu(*prop++);
>> +        uint32_t smc_id =3D be32_to_cpu(*prop++);
>> +        uint32_t shmem_phandle =3D be32_to_cpu(*prop++);
>> +        struct dt_device_node *node =3D dt_find_node_by_phandle(shmem_p=
handle);
>> +        u64 addr, size;
>> +        int ret;
>> +
>> +        if ( !node )
>> +        {
>> +            printk(XENLOG_ERR "scmi: Could not find shmem node for agen=
t %d\n",
>> +                   agent_id);
>> +            return -EINVAL;
>> +        }
>> +
>> +        ret =3D dt_device_get_address(node, 0, &addr, &size);
>> +        if ( ret )
>> +        {
>> +            printk(XENLOG_ERR
>> +                   "scmi: Could not read shmem address for agent %d: %d=
",
>> +                   agent_id, ret);
>> +            return ret;
>> +        }
>> +
>> +        if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )
>> +        {
>> +            printk(XENLOG_ERR "scmi: shmem memory is not aligned\n");
>> +            return -EINVAL;
>> +        }
>> +
>> +        ret =3D PTR_RET(smc_create_channel(agent_id, smc_id, addr));
>> +        if ( ret )
>> +        {
>> +            printk(XENLOG_ERR "scmi: Could not create channel for agent=
 %d: %d",
>> +                   agent_id, ret);
>> +            return ret;
>> +        }
>> +
>> +        printk(XENLOG_DEBUG "scmi: Agent %d SMC %X addr %lx\n", agent_i=
d,
>> +               smc_id, addr);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int scmi_domain_init(struct domain *d,
>> +                            struct xen_domctl_createdomain *config)
>> +{
>> +    struct scmi_channel *channel;
>> +    int ret;
>> +
>> +    if ( !scmi_data.initialized )
>> +        return 0;
>> +
>> +    /*
>> +     * Special case for Dom0 - the SCMI support is enabled basing on
>> +     * "dom0_sci_agent_id" Xen command line parameter
>> +     */
>> +    if ( is_hardware_domain(d) )
>> +    {
>> +        if ( opt_dom0_scmi_agent_id !=3D SCMI_AGENT_ID_INVALID )
>> +        {
>> +            config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCM=
I_SMC_MA;
>> +            config->arch.arm_sci_agent_id =3D opt_dom0_scmi_agent_id;
>> +        }
>> +        else
>> +            config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NON=
E;
>> +    }
>> +
>> +    if ( config->arch.arm_sci_type =3D=3D XEN_DOMCTL_CONFIG_ARM_SCI_NON=
E )
>> +        return 0;
>> +
>> +    channel =3D acquire_scmi_channel(d, config->arch.arm_sci_agent_id);
>> +    if ( IS_ERR(channel) )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "scmi: Failed to acquire SCMI channel for agent_id %u: %=
ld\n",
>> +               config->arch.arm_sci_agent_id, PTR_ERR(channel));
>> +        return PTR_ERR(channel);
>> +    }
>> +
>> +    printk(XENLOG_INFO
>> +           "scmi: Acquire channel id =3D 0x%x, domain_id =3D %d paddr =
=3D 0x%lx\n",
>> +           channel->agent_id, channel->domain_id, channel->paddr);
>> +
>> +    /*
>> +     * Dom0 (if present) needs to have an access to the guest memory ra=
nge
>> +     * to satisfy iomem_access_permitted() check in XEN_DOMCTL_iomem_pe=
rmission
>> +     * domctl.
>=20
> Ideally this should not be needed but I understand we don't have an
> easy solution, I think we can go ahead with this for now.
>=20
>=20
>> +     */
>> +    if ( hardware_domain && !is_hardware_domain(d) )
>> +    {
>> +        ret =3D iomem_permit_access(hardware_domain, paddr_to_pfn(chann=
el->paddr),
>> +                                  paddr_to_pfn(channel->paddr + PAGE_SI=
ZE - 1));
>> +        if ( ret )
>> +            goto error;
>> +    }
>> +
>> +    d->arch.sci_data =3D channel;
>> +    d->arch.sci_enabled =3D true;
>> +
>> +    return 0;
>> +
>> +error:
>> +    relinquish_scmi_channel(channel);
>> +    return ret;
>> +}
>> +
>> +int scmi_domain_sanitise_config(struct xen_domctl_createdomain *config)
>> +{
>> +    if ( config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE =
&&
>> +         config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_=
SMC_MA )
>> +    {
>> +        dprintk(XENLOG_INFO, "scmi: Unsupported ARM_SCI type\n");
>> +        return -EINVAL;
>> +    }
>> +    else if ( config->arch.arm_sci_type =3D=3D
>> +              XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA &&
>> +              config->arch.arm_sci_agent_id =3D=3D 0 )
>> +    {
>> +        dprintk(XENLOG_INFO,
>> +                "scmi: A zero ARM SCMI agent_id is not supported\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int scmi_relinquish_resources(struct domain *d)
>> +{
>> +    int ret;
>> +    struct scmi_channel *channel, *agent_channel;
>> +    scmi_msg_header_t hdr;
>> +    struct scmi_msg_base_reset_agent_cfg_a2p tx;
>> +
>> +    if ( !d->arch.sci_data )
>> +        return 0;
>> +
>> +    agent_channel =3D d->arch.sci_data;
>> +
>> +    spin_lock(&agent_channel->lock);
>> +    tx.agent_id =3D agent_channel->agent_id;
>> +    spin_unlock(&agent_channel->lock);
>> +
>> +    channel =3D get_channel_by_id(HYP_CHANNEL);
>> +    if ( !channel )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "scmi: Unable to get Hypervisor scmi channel for domain =
%d\n",
>> +               d->domain_id);
>> +        return -EINVAL;
>> +    }
>> +
>> +    hdr.id =3D SCMI_BASE_RESET_AGENT_CONFIGURATION;
>> +    hdr.type =3D 0;
>> +    hdr.protocol =3D SCMI_BASE_PROTOCOL;
>> +
>> +    tx.flags =3D 0;
>> +
>> +    ret =3D do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
>> +    if ( ret =3D=3D -EOPNOTSUPP )
>> +        return 0;
>> +
>> +    return ret;
>> +}
>> +
>> +static void scmi_domain_destroy(struct domain *d)
>> +{
>> +    struct scmi_channel *channel;
>> +
>> +    if ( !d->arch.sci_data )
>> +        return;
>> +
>> +    channel =3D d->arch.sci_data;
>> +    spin_lock(&channel->lock);
>> +
>> +    relinquish_scmi_channel(channel);
>> +    printk(XENLOG_DEBUG "scmi: Free domain %d\n", d->domain_id);
>> +
>> +    d->arch.sci_data =3D NULL;
>> +    d->arch.sci_enabled =3D true;
>> +
>> +    spin_unlock(&channel->lock);
>> +}
>> +
>> +static bool scmi_handle_call(struct cpu_user_regs *regs)
>> +{
>> +    uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
>> +    struct scmi_channel *agent_channel;
>> +    struct domain *d =3D current->domain;
>> +    struct arm_smccc_res resp;
>> +    bool res =3D false;
>> +
>> +    if ( !sci_domain_is_enabled(d) )
>> +        return false;
>> +
>> +    agent_channel =3D d->arch.sci_data;
>> +    spin_lock(&agent_channel->lock);
>> +
>> +    if ( agent_channel->func_id !=3D fid )
>> +    {
>> +        res =3D false;
>> +        goto unlock;
>> +    }
>> +
>> +    arm_smccc_1_1_smc(fid,
>> +                      get_user_reg(regs, 1),
>> +                      get_user_reg(regs, 2),
>> +                      get_user_reg(regs, 3),
>> +                      get_user_reg(regs, 4),
>> +                      get_user_reg(regs, 5),
>> +                      get_user_reg(regs, 6),
>> +                      get_user_reg(regs, 7),
>> +                      &resp);
>> +
>> +    set_user_reg(regs, 0, resp.a0);
>> +    set_user_reg(regs, 1, resp.a1);
>> +    set_user_reg(regs, 2, resp.a2);
>> +    set_user_reg(regs, 3, resp.a3);
>> +    res =3D true;
>> +unlock:
>> +    spin_unlock(&agent_channel->lock);
>> +
>> +    return res;
>> +}
>> +
>> +static const struct sci_mediator_ops scmi_ops =3D {
>> +    .domain_init =3D scmi_domain_init,
>> +    .domain_destroy =3D scmi_domain_destroy,
>> +    .relinquish_resources =3D scmi_relinquish_resources,
>> +    .handle_call =3D scmi_handle_call,
>> +    .dom0_dt_handle_node =3D scmi_dt_handle_node,
>> +    .dom0_dt_finalize =3D scmi_dt_finalize,
>> +    .domain_sanitise_config =3D scmi_domain_sanitise_config,
>> +    .assign_dt_device =3D scmi_dt_assign_device,
>> +};
>> +
>> +static int __init scmi_check_smccc_ver(void)
>> +{
>> +    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
>> +    {
>> +        printk(XENLOG_WARNING
>> +               "scmi: No SMCCC 1.1 support, SCMI calls forwarding disab=
led\n");
>> +        return -ENOSYS;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static __init int scmi_probe(struct dt_device_node *scmi_node, const vo=
id *data)
>> +{
>> +    u64 addr, size;
>> +    int ret, i;
>> +    struct scmi_channel *channel, *agent_channel;
>> +    int n_agents;
>> +    scmi_msg_header_t hdr;
>> +    struct scmi_msg_base_attributes_p2a rx;
>> +
>> +    ASSERT(scmi_node !=3D NULL);
>> +
>> +    INIT_LIST_HEAD(&scmi_data.channel_list);
>> +    spin_lock_init(&scmi_data.channel_list_lock);
>> +
>> +    if ( !acpi_disabled )
>> +    {
>> +        printk(XENLOG_WARNING "scmi: is not supported when using ACPI\n=
");
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret =3D scmi_check_smccc_ver();
>> +    if ( ret )
>> +        return ret;
>> +
>> +    if ( !dt_property_read_u32(scmi_node, "arm,smc-id", &scmi_data.func=
_id) )
>> +    {
>> +        printk(XENLOG_ERR "scmi: unable to read smc-id from DT\n");
>> +        return -ENOENT;
>> +    }
>> +
>> +    /* save shmem phandle and re-use it fro Dom0 DT shmem node */
>> +    if ( !dt_property_read_u32(scmi_node, "shmem", &scmi_data.shmem_pha=
ndle) )
>> +    {
>> +        printk(XENLOG_ERR "scmi: unable to read shmem phandle from DT\n=
");
>> +        return -ENOENT;
>> +    }
>> +
>> +    ret =3D scmi_dt_read_hyp_channel_addr(scmi_node, &addr, &size);
>> +    if ( IS_ERR_VALUE(ret) )
>> +        return -ENOENT;
>> +
>> +    if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )
>> +    {
>> +        printk(XENLOG_ERR "scmi: shmem memory is not aligned\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    scmi_data.dt_dev =3D scmi_node;
>> +
>> +    channel =3D smc_create_channel(HYP_CHANNEL, scmi_data.func_id, addr=
);
>> +    if ( IS_ERR(channel) )
>> +        goto out;
>> +
>> +    ret =3D map_channel_memory(channel);
>> +    if ( ret )
>> +        goto out;
>> +
>> +    channel->domain_id =3D DOMID_XEN;
>> +
>> +    hdr.id =3D SCMI_BASE_PROTOCOL_ATTIBUTES;
>> +    hdr.type =3D 0;
>> +    hdr.protocol =3D SCMI_BASE_PROTOCOL;
>> +
>> +    ret =3D do_smc_xfer(channel, &hdr, NULL, 0, &rx, sizeof(rx));
>> +    if ( ret )
>> +        goto error;
>> +
>> +    n_agents =3D SCMI_FIELD_GET(SCMI_BASE_ATTR_NUM_AGENT, rx.attributes=
);
>> +    printk(XENLOG_DEBUG "scmi: Got agent count %d\n", n_agents);
>> +
>> +    ret =3D collect_agents(scmi_node);
>> +    if ( ret )
>> +        goto error;
>> +
>> +    i =3D 1;
>> +
>> +    list_for_each_entry(agent_channel, &scmi_data.channel_list, list)
>> +    {
>> +        struct scmi_msg_base_discover_agent_p2a da_rx;
>> +        struct scmi_msg_base_discover_agent_a2p da_tx;
>> +
>> +        ret =3D map_channel_memory(agent_channel);
>> +        if ( ret )
>> +            goto error;
>> +
>> +        hdr.id =3D SCMI_BASE_DISCOVER_AGENT;
>> +        hdr.type =3D 0;
>> +        hdr.protocol =3D SCMI_BASE_PROTOCOL;
>> +
>> +        da_tx.agent_id =3D agent_channel->agent_id;
>> +
>> +        ret =3D do_smc_xfer(agent_channel, &hdr, &da_tx, sizeof(da_tx),=
 &da_rx,
>> +                          sizeof(da_rx));
>> +        if ( agent_channel->domain_id !=3D DOMID_XEN )
>> +            unmap_channel_memory(agent_channel);
>> +        if ( ret )
>> +            goto error;
>> +
>> +        printk(XENLOG_DEBUG "id=3D0x%x name=3D%s\n", da_rx.agent_id, da=
_rx.name);
>> +
>> +        agent_channel->agent_id =3D da_rx.agent_id;
>=20
> It is OK to set agent_channel->agent_id to the value provided by the
> SCMI server, but if we are also taking the agent_channel->agent_id value
> from the user via device tree, shouldn't we throw an error if there is a
> mismatch?
>=20
> Or even better: can we avoid taking the value via device tree to make it
> easier to configure?
>=20
>=20
>> +        if ( i > n_agents )
>> +            break;
>> +
>> +        i++;
>> +    }
>> +
>> +    ret =3D sci_register(&scmi_ops);
>> +    if ( ret )
>> +    {
>> +        printk(XENLOG_ERR "SCMI: mediator already registered (ret =3D %=
d)\n",
>> +               ret);
>> +        return ret;
>> +    }
>> +
>> +    scmi_data.initialized =3D true;
>> +    goto out;
>> +
>> +error:
>> +    unmap_channel_memory(channel);
>> +    free_channel_list();
>> +out:
>> +    return ret;
>> +}
>> +
>> +static const struct dt_device_match scmi_smc_match[] __initconst =3D {
>> +    DT_MATCH_COMPATIBLE("arm,scmi-smc"),
>> +    { /* sentinel */ },
>> +};
>> +
>> +DT_DEVICE_START(scmi_smc_ma, "SCMI SMC MEDIATOR", DEVICE_FIRMWARE)
>> +        .dt_match =3D scmi_smc_match,
>> +        .init =3D scmi_probe,
>> +DT_DEVICE_END
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * tab-width: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm=
.h
>> index 095b1a23e3..30e46de6d7 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -329,6 +329,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>=20
>> #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
>> #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
>> +#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA  2
>>=20
>> struct xen_arch_domainconfig {
>>     /* IN/OUT */
>> @@ -355,6 +356,8 @@ struct xen_arch_domainconfig {
>>     uint32_t clock_frequency;
>>     /* IN */
>>     uint8_t arm_sci_type;
>> +    /* IN */
>> +    uint8_t arm_sci_agent_id;
>> };
>> #endif /* __XEN__ || __XEN_TOOLS__ */
>>=20
>> --=20
>> 2.34.1



