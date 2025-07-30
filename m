Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1ECB15987
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 09:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063465.1429175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh1BT-0002lx-66; Wed, 30 Jul 2025 07:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063465.1429175; Wed, 30 Jul 2025 07:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh1BT-0002kV-2u; Wed, 30 Jul 2025 07:25:07 +0000
Received: by outflank-mailman (input) for mailman id 1063465;
 Wed, 30 Jul 2025 07:25:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ELN4=2L=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uh1BQ-0002kP-Qf
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 07:25:05 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e3512bc-6d16-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 09:25:01 +0200 (CEST)
Received: from DU2PR04CA0341.eurprd04.prod.outlook.com (2603:10a6:10:2b4::30)
 by PAVPR08MB9483.eurprd08.prod.outlook.com (2603:10a6:102:316::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 07:24:57 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::88) by DU2PR04CA0341.outlook.office365.com
 (2603:10a6:10:2b4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.12 via Frontend Transport; Wed,
 30 Jul 2025 07:24:57 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.10
 via Frontend Transport; Wed, 30 Jul 2025 07:24:57 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB9409.eurprd08.prod.outlook.com (2603:10a6:20b:5a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 07:24:01 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%2]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 07:24:01 +0000
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
X-Inumbo-ID: 4e3512bc-6d16-11f0-a320-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=x7AEbMaCa70H7aPe8cOz/MxxoXEvXl6UpkXvUMUuq8iRKRdF6Hlth4HPfxk0F3kyzRpFq07kYx196v3phXPepLSXbwrHHuCgc+GmR7q0/41L5rHVXT2/xFsTfkTzXqfoKIp2u+cjuuuud1UEqTkl7OKrqF8fBUFQIbyJemupB5Xb9+I02TnPuUaY8M4G4B9yIk+1dXLrw88EmfONKoyytdm2mZ32SnvhG0Erd5Mj2uGL/mpRaYbvV4UsKGdOVOOO6/mpbeNKjDPbS+ZKHMI1j0Dh0ZKWsir/lbXVXiSbwcuP9lZzAjIqBWBpc2OT898U2W28SlU9gIa7t+Eq/vOqwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QgKfnUhCc3H+yyRddPCJli3ardu41zHUMdphs4xJkA=;
 b=SvpYGf8DI4EmeXa/7Qxvtu7i8LjxIpgs4Uc84qi5lKzzSzA01pXhx99ZwEpcVYN3zDBpSCdPzJ6woxSfubxSEagdPpbKPoVm00imr5K+iWHSTybJroettvLIiGazraOCCtBnrTTn+61DePXAXkmVVyUTb+1/Kp6jZNft1ZIYxDX86+nYFXlhXTEdM+cH5vX6wOdiLSetkaQz+1pEVDAA+lJpKbhlVVE53XBXzvFdzoGFgrDDg5+3kC/mV/D9Br/XYqGuuMqLcTJj8TIKNC2RnM8kUavN3Vkmv5EPlYEaEoqWDF9m0Bb8lGntXpeIZIokAfdjYE26ZHocu/f1Y7fbQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QgKfnUhCc3H+yyRddPCJli3ardu41zHUMdphs4xJkA=;
 b=d1Z163QL+6w71x5aIDPRs10PDWUTyHh+kdDd1wIFe8fF2QiLmrUkzQlDXwAsDQMw7z/Jdh5GmYYWK9fdhWOY2C4JwTZ632rlOBbOrPpO6/CrIQUF19we9cdzoeA8QkPHdDlNEhO6UbJpOROTkwtpoSOWm+m8X/I5BTLYemx8TrE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqS24SM1mV0f+4NT2wHfKAVHifm5cGB/HeNp4fkLC0ViZ9rIAU1OO9FmN0xdY5p+jXXzIh6vPGWpzM1Gueq0JJ6iLS58K9PW6v5f7F3YeGpn4uVMNeiKwyznkOrcuZfc5mPMpuBCdlVplu08wCbugED1s9Jm4DAyGg85y8hPtD3QbNSW9ncYlVcdb4aO9zy46wFo3L+t8SGBT7bB87qJQ6BBRVrW27+HUGnCmg40P8ZbYZDkFtZeunbV5KFQZzpgSWpdYlWlAnLOpyL1wjyx3Ke4FLG6iC35qy5PfSjZNZodjdA0nU3tZWQCXn2SyS/RrsKCil8mldwEuY+lUx/AZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QgKfnUhCc3H+yyRddPCJli3ardu41zHUMdphs4xJkA=;
 b=x8UPnPwESTEMVAnUJn89uKM1XxmQMHTxjyJKUZnjmgrLVJ2x4qVEh0M7Fu1liKz9fodKtcDCSE5CJ3ohvKHL9stZ9Q/bfHQmb5UpBZnJa+TFEmnnfz4Kf/k3zNOD0h/zV+kW/9B1nKDL5xXimxqgSog5NgkAaNlO6daK+Ic1AXmPHhFQuw5BoDSp7xy3cbe7is2+1QL8zPndyFkifq1+fqu4rSsvaFvNrH97ZxINad3Bmqfk6GqHFAVQWTCBydALrFlrZXqfzUQLLNAtj7PbDnw29SGmH7QzUPK8joeYHXjmGHVcC78mxORqKgDaEcivZV5Sj5gz1HNKqKrnr29FIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QgKfnUhCc3H+yyRddPCJli3ardu41zHUMdphs4xJkA=;
 b=d1Z163QL+6w71x5aIDPRs10PDWUTyHh+kdDd1wIFe8fF2QiLmrUkzQlDXwAsDQMw7z/Jdh5GmYYWK9fdhWOY2C4JwTZ632rlOBbOrPpO6/CrIQUF19we9cdzoeA8QkPHdDlNEhO6UbJpOROTkwtpoSOWm+m8X/I5BTLYemx8TrE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
Subject: Re: [PATCH] lib: drop size parameter from sort()'s swap callback
Thread-Topic: [PATCH] lib: drop size parameter from sort()'s swap callback
Thread-Index: AQHcAJTgZe0uOtfsl0SCb5wVYhpgX7RKRKAA
Date: Wed, 30 Jul 2025 07:24:01 +0000
Message-ID: <FAB7DB54-4D5E-43C4-973B-7EEDC6B467D4@arm.com>
References: <fe3b486e-5122-4196-810b-38b3a58233bb@suse.com>
In-Reply-To: <fe3b486e-5122-4196-810b-38b3a58233bb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB9409:EE_|DB5PEPF00014B95:EE_|PAVPR08MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab95963-db24-4df5-3d66-08ddcf3a2fa9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?4Zw+XI8Tc3EA7dNO6pdFmZYIWheQqzJ+R8fEIt35s08aRwt5olYl3OaUrg?=
 =?iso-8859-1?Q?RlTz8h+8qxE//jha2cFEpkWf+ciw09KgZVCXEBtIrzZjaLvotmKJUYaJpN?=
 =?iso-8859-1?Q?Fe+UFXH5MLliqlbjYnBWBvdCbQCC6yc14SF5KdYrlt/JvHNMfIfZQFnUx/?=
 =?iso-8859-1?Q?fXpoUrCrqh0JvuSJ5bweGxDEQZvWexB9zrDUAZ1H2xEcH0Vd6Ro9nAzjPq?=
 =?iso-8859-1?Q?8WdqgFOmsGzCOUEj3IXHTx77yiqQzE9xj/M8ras9w304H6j/yNIhWjb5wR?=
 =?iso-8859-1?Q?gmgOkYvqLBsSLDPAAPTqHufSJfGRzcPZpdbUExTtDCn+qRjrSZt3i6sjdo?=
 =?iso-8859-1?Q?Vhq/2pOoPg8r5wRUZbjikqv2DuWSn7ZcQqy5gfg8NNbJTOfV2wEuoHjBLI?=
 =?iso-8859-1?Q?jYHdmjG8D1jY9ODWLtBYvnSgbcg9P5iHQFr0VzzWJu66/FB/nRg73OVYIr?=
 =?iso-8859-1?Q?e9Z96n11p9FDNCzRsY1qFdTWf3Egf5hmBOkV/IZ5MWlL/8ycth0GXlUAvs?=
 =?iso-8859-1?Q?lekrXZzNC78uYc1KNE6cBOlsPsFxbcdgqHArDGUiEe85di3q6r2SeAjcWd?=
 =?iso-8859-1?Q?xEpy23KbhtStbRDVDtoDn7BzJ6j2cdbF0eNqkrqXYpZ+JA8ttDRVwfknXs?=
 =?iso-8859-1?Q?ed9avQKfGRYHT+Vc9ECCXrwtElwCQqgMF2hFYENjSMjSo/yAXI0GmODIkT?=
 =?iso-8859-1?Q?/MG/DyYQ+CXkoPx0nZt8EIj+0eiAEXPqXAAKY9olI7QfXfKHEnCz7k/V0r?=
 =?iso-8859-1?Q?abOawJgxN3+2N+FpRxR0h/FCWoswXgbziy2GatIJriKLITyoomsWQxMdbT?=
 =?iso-8859-1?Q?ySIzRKF1RMTvt1BTPdfZvaRHcurP9Ojglwbade9ENGMUaIjOC8XhH7hNaa?=
 =?iso-8859-1?Q?RQiCtf9farL4UVw+cblc7JWKvPvCJ8Kj0amJL3+DL8uLcI5Z4iDrdqlYh+?=
 =?iso-8859-1?Q?5XYwhKNvG9YwuzpP8VDRDdMxx+GdM6C7ZjHxjjD5DwBHieVO2CA1hyguof?=
 =?iso-8859-1?Q?nQCEo1gFgay57TYqZajiqSIkhGzVfntSDOe0zuA9QW2+f0DVb6Uta8zPit?=
 =?iso-8859-1?Q?eUrpVA2D1w1biAWQkzdn23fp4J19ytK+nXKQLufRFIHXD31Qk3AfCgBMkn?=
 =?iso-8859-1?Q?5JGBnjRFyrT+cKLYHwMCr6PraSUpaiAoIuq+4E/FBRQtYMug21YPDfftyj?=
 =?iso-8859-1?Q?Sgt4Rw9KdBwSFYej6ftXlnDi+hWGw4Q6OoGQAoumwauWJ+8fIPRgZh05vv?=
 =?iso-8859-1?Q?Yki7VcydiSZzKirw4gB47gvrC6+73naFb8INFFkDQ2mvlMWwoUWizK+B7e?=
 =?iso-8859-1?Q?GL2IUeNEb38rUPMXsiZ0TleSXLY1Y5JJXj/E4PU20dberq1BjK/m+x+4hP?=
 =?iso-8859-1?Q?5MqbmbSrZdG4Mj6zb6Mt34iqLvI98jYbSh9YUFqp2TuwLljSJ9GGzO7r4J?=
 =?iso-8859-1?Q?STeTLzdYxbdBHQUWRBE9B0UNK6aRuf850Wbteh1QeBh8qs8SxmhNiKTR8Z?=
 =?iso-8859-1?Q?L3UfwKmA7DabjC8dopnoCH+ddhnMpC2ufOYDAllLfwqQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8C8138A18F272141AA4E6A088F3E15B5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9409
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f10a0fbd-68f0-464e-7769-08ddcf3a0e95
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|376014|35042699022|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?sNsk0qmz74VydajLe1/Vzs9fQ9ByPBbJxdIugqJ+UCB4tQdxtUamzML/f1?=
 =?iso-8859-1?Q?vnRLUDOhuDE/+Ql+N8IArDSUFoobAWqWWCGrv9dEgXg690o0PyPhQggLRk?=
 =?iso-8859-1?Q?r+diLDDs4tgtgLn9BY89InpBQ8txUm7jBdPwWk9mh9UcNh6T0gUx6R6982?=
 =?iso-8859-1?Q?C5wsmSpjBoBiJ+wYS3X2o42NA5ourPrs/yLfO+NcwdFiMqdY45zsQPpxlm?=
 =?iso-8859-1?Q?9sNmrQ1+gl09dMl5i1YTt90NFXZczEONRByukYWllzwax5DvGYmVfWTu6U?=
 =?iso-8859-1?Q?njYbxvTV/Kf5WA8EoGg0RusjCQ2ggKDvKgHNQ3UMk8oU2WGYjwquRuJc7T?=
 =?iso-8859-1?Q?bxXgrftpjyaezfK7v80C2JNV769+aYAk0N3fI8H0boG5GTwoDOaS82/9BU?=
 =?iso-8859-1?Q?4VyYY0U+iBKP7AP1mUS5KpFWMKacqX0huTCYJn7DpSdCWqRXGTAioxGEki?=
 =?iso-8859-1?Q?uKUwzqSTaxQq/WxsABEwE/w8PsOPaWlFDf2PGk/B/MvDZDI3CafpN8WVdM?=
 =?iso-8859-1?Q?PZ8s8M1TtfSbLLDQoimRiHnZujGPLW06ZGkWVeLloAEH7Dv6RHCdLAo4GH?=
 =?iso-8859-1?Q?m9sDbsAg1b2ldPQaQg7QzFHB4DYHBNkuCI9pp8yF2PpGPK/YO/RGvGt0/3?=
 =?iso-8859-1?Q?39oLWSwMXCvxeG3CraY/aI3GmdrU4abxFfJdrBjlA4xxhI4VDfUodSmw8L?=
 =?iso-8859-1?Q?PlBV2SvpiS5D90zEKzwbvlQ0AapwdvIYBfelkNxZetVQnUbuKV06aqu2n0?=
 =?iso-8859-1?Q?If5rCFX6rILtMfisspdc/HqMaNSgo3qyLmmMm79L5O+oWvZ28tsRCj1SxD?=
 =?iso-8859-1?Q?bmHFlZHLXDCN9BzZ9qLvkq2Llg1VEN0PTwQbQV+W1wnD40NiTCh/IFsiD5?=
 =?iso-8859-1?Q?CI8FPH3T6UC4U0TR+nnMQb2ZQEt/Y+uHVDIyQWX5uMYKsVwOje+wfCidfu?=
 =?iso-8859-1?Q?H2bn8VeCY+S29WPuBor9T8VnLQj/GXU9UWSV9aDsvDL6AXm008c1poIoPg?=
 =?iso-8859-1?Q?KyYAPcRHDRxrn39LYWljrmfHBMw7/QKAUOOYeGxW5ZyvfWBcmA1QcyFOyu?=
 =?iso-8859-1?Q?XnPleF/4TdUdPuAqqbNGMtm85KPE4hioqGOsV9b0CsbC+cKmms2lp6Uy3s?=
 =?iso-8859-1?Q?lMdDd3srHqynw2Uwc8+ydoJ4nkLkgqkSCPF9R4f3tR6vhTXvejZiG/bOtw?=
 =?iso-8859-1?Q?SKgInPi8fXSClzhob7zbsAJ3rL5kcM8jySGdcuMfmEfrFe1P3C1xUKwT8l?=
 =?iso-8859-1?Q?bA/2YCOQoVMtJkbnyDOr3mPw/GEso1zLA29O01vMTEoZ/WOvp52euKVIoS?=
 =?iso-8859-1?Q?W63XXC1r9T9k/viPGqRMcbkU2ASdbZThQUQqv80ih8U1VjNjDklJtm6ZX/?=
 =?iso-8859-1?Q?8VOqnaW2Nb+IoyT6KVSMbM0o5YWNiWi8LHkNwtBKtKHJrXTh1J0uus+5bm?=
 =?iso-8859-1?Q?OVQA9LXgvl66/5j0HspHcBr7hHn0tPbSbGIXg9XzCYg5Et0ujbU6cv9FT4?=
 =?iso-8859-1?Q?MAaCnt+0KxM0kx1jKcjBv7I92KoCvKTkmuW+9QNiruOzdcTVnulXXgzw5V?=
 =?iso-8859-1?Q?6LVyr/hMkwht7U9UZjDCkEY2pjPZ?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(35042699022)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 07:24:57.0031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab95963-db24-4df5-3d66-08ddcf3a2fa9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9483

Hi,

> On 29 Jul 2025, at 16:26, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> This was needed only for generic_swap(), which disappeared in
> 8cb0341a61fa ("xen/sort: Switch to an extern inline implementation").
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

For arm part:

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -100,7 +100,7 @@ static int cmp_mmio_handler(const void *
>     return 0;
> }
>=20
> -static void swap_mmio_handler(void *_a, void *_b, size_t size)
> +static void swap_mmio_handler(void *_a, void *_b)
> {
>     struct mmio_handler *a =3D _a, *b =3D _b;
>=20
> --- a/xen/arch/x86/extable.c
> +++ b/xen/arch/x86/extable.c
> @@ -39,7 +39,7 @@ static int init_or_livepatch cf_check cm
> return 0;
> }
>=20
> -static void init_or_livepatch cf_check swap_ex(void *a, void *b, size_t =
size)
> +static void init_or_livepatch cf_check swap_ex(void *a, void *b)
> {
> struct exception_table_entry *l =3D a, *r =3D b, tmp;
> long delta =3D b - a;
> --- a/xen/common/device-tree/bootinfo-fdt.c
> +++ b/xen/common/device-tree/bootinfo-fdt.c
> @@ -449,7 +449,7 @@ static int __init cmp_memory_node(const
>     return 0;
> }
>=20
> -static void __init swap_memory_node(void *_a, void *_b, size_t size)
> +static void __init swap_memory_node(void *_a, void *_b)
> {
>     struct membank *a =3D _a, *b =3D _b;
>=20
> --- a/xen/include/xen/sort.h
> +++ b/xen/include/xen/sort.h
> @@ -24,7 +24,7 @@ extern gnu_inline
> #endif
> void sort(void *base, size_t num, size_t size,
>           int (*cmp)(const void *a, const void *b),
> -          void (*swap)(void *a, void *b, size_t size))
> +          void (*swap)(void *a, void *b))
> {
>     /* pre-scale counters for performance */
>     size_t i =3D (num / 2) * size, n =3D num * size, c, r;
> @@ -39,7 +39,7 @@ void sort(void *base, size_t num, size_t
>                 c +=3D size;
>             if ( cmp(base + r, base + c) >=3D 0 )
>                 break;
> -            swap(base + r, base + c, size);
> +            swap(base + r, base + c);
>         }
>     }
>=20
> @@ -47,7 +47,7 @@ void sort(void *base, size_t num, size_t
>     for ( i =3D n; i > 0; )
>     {
>         i -=3D size;
> -        swap(base, base + i, size);
> +        swap(base, base + i);
>         for ( r =3D 0; r * 2 + size < i; r =3D c )
>         {
>             c =3D r * 2 + size;
> @@ -55,7 +55,7 @@ void sort(void *base, size_t num, size_t
>                 c +=3D size;
>             if ( cmp(base + r, base + c) >=3D 0 )
>                 break;
> -            swap(base + r, base + c, size);
> +            swap(base + r, base + c);
>         }
>     }
> }


