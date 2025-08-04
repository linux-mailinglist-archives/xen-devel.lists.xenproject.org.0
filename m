Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56344B19C70
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 09:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068841.1432699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipcT-0008Nw-VL; Mon, 04 Aug 2025 07:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068841.1432699; Mon, 04 Aug 2025 07:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipcT-0008Lm-Ro; Mon, 04 Aug 2025 07:28:29 +0000
Received: by outflank-mailman (input) for mailman id 1068841;
 Mon, 04 Aug 2025 07:28:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/Qs=2Q=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uipcS-0008Lg-SZ
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 07:28:29 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b3ce5cc-7104-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 09:28:25 +0200 (CEST)
Received: from AM0PR01CA0144.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::49) by DU0PR08MB9558.eurprd08.prod.outlook.com
 (2603:10a6:10:44d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 07:21:42 +0000
Received: from AM4PEPF00027A61.eurprd04.prod.outlook.com
 (2603:10a6:208:168:cafe::ca) by AM0PR01CA0144.outlook.office365.com
 (2603:10a6:208:168::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Mon,
 4 Aug 2025 07:21:38 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A61.mail.protection.outlook.com (10.167.16.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Mon, 4 Aug 2025 07:21:40 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB9PR08MB8699.eurprd08.prod.outlook.com (2603:10a6:10:3d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 07:21:08 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%2]) with mapi id 15.20.8989.015; Mon, 4 Aug 2025
 07:21:07 +0000
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
X-Inumbo-ID: 9b3ce5cc-7104-11f0-b898-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GrCO8xILQHowHRYIvrXBKgytW0Oeh7NoD16P1lANdK9e1QF9+qgSjxKAp5kDT/NNT/x33foNHHXQH197CDiQXvtTCBfGqBnV7bjQv1twN+3UiMX1Vd02w53I5wSJaQRM/9V34CicfXmQ36O4WkYXUzU8DVljlOSdACzjWbSgtNmjC1rvfxOuGVr7IhP83/8k9W6Ml9BZ+3THq/9guXyUnOKFuGu4IpVs0+Mk5DmSi5fcWTWYKTGxaH1gsx8d2v3iDD+mCDfVQ/lNL3Bs4099PHmugH7wU4XKGKvLML2Iu5k7L38G9NlNswHcpcrVcqkfT7H6PmATxVhAbCsMGdD72g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geAkE7DB6wdH4evMbSTVt9r1MrUQTgXJvQJA+GSeqf0=;
 b=h2oWqCdbYBRMmuIt+hgfFUht3raXbSOjEGeLtJCfHtPd7Nf3qVAqQOfoa+xzGH1BOApuIIqXj+xo0mbawv0L6znU+/4gCxzWsdXLyZAP1+iygoMLz90W+lrStz1J/CrYerwErBes96lEtr9NwtwYRx3r9S1fRF3yHh5D5UfYBUednUGbEcCwo5AHx18I8smGBoS/iqIAcFNUafsPmzM3YyeKhZKNLdVnLpk1YMS/whGrz2zqsrgfCMiG3QcVUHopu+ortELw3xT207ij0BVoHq7UYhvx/eQFZTKC+ksa5M+vTI7ZDbBlrZLTUu4SEF3V9eZohxExdga/DdPTX4mZIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geAkE7DB6wdH4evMbSTVt9r1MrUQTgXJvQJA+GSeqf0=;
 b=JYvBWJOCpyoVU3eObYbRIFwt+nsfd8l61Cg7jAmhEMKByxEXtGDtWMeG0cFeFH+i4XY4BXg2GVXl3qJB2vA0St96yCJPjCb2Xcpd+Q7rBElQV+KtXwe4al+p1LaCr3fpTMFDJxsocSRByueWzI/lao8Skjw7ji4YfUR/+g/yuFU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwKl8F25EOEteXawnbw8RLxIFwJiUBQMTmZMdw7Yomlw2zmsGc32JAe3fznfD04DVel2Z5uVH5LbfRjd3iFmJLPTa28exxagY1BPgSEXNejDqim/riuf6DhDYgQvCYS01CJO4LTmej6l2suCX01zFIrZWzGPPiP7osSAkTEa2gVUqF/24UJJ4sBBBBXWh38OaPSaH3sZXBRno7ItJ9GPjEHgTvKXcAnpN/OEbON+xtvZf9i5XVhJdWHvDKX29qCZJPxja2/Pcti7dyGZD/7tztCm523G3SKuiAHCoaxo+vpLvDoryHPHV5aDISttwZYTAB1X3K1mupE2LUAEn2VL7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geAkE7DB6wdH4evMbSTVt9r1MrUQTgXJvQJA+GSeqf0=;
 b=Lt77er1OYg2PiIir8xeSUACPFi8kFq+ObytLuL2BjidiLW6kfb4xuHT+zrnGGvwiQ2Q/6nIMK0OHwmGxugnoZ4MIp9YHB/akov91FDgYxOih3wMEzkYg7KTcYSVgAeqx0At8mYape1DIHYzqMA532AV5sYPU662xEFYmheZtTs3WN2HqdYDWCOrIPq4s3HYtWddWYiLsZljgxZoeI3B6QWsNfyDcpZaD82ULO04uP+ZI6ioMzEpoTEda024AkxMbKvkwa9slYSzJyIHH1tDd5VInhIhRLJMRryR+a8Jy9//ndD/0sGcOJ1ms741hQUz7KCcU/eLdl2oeOeY0ud3OhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geAkE7DB6wdH4evMbSTVt9r1MrUQTgXJvQJA+GSeqf0=;
 b=JYvBWJOCpyoVU3eObYbRIFwt+nsfd8l61Cg7jAmhEMKByxEXtGDtWMeG0cFeFH+i4XY4BXg2GVXl3qJB2vA0St96yCJPjCb2Xcpd+Q7rBElQV+KtXwe4al+p1LaCr3fpTMFDJxsocSRByueWzI/lao8Skjw7ji4YfUR/+g/yuFU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v7 3/6] xen/arm: ffa: Introduce VM to VM support
Thread-Topic: [PATCH v7 3/6] xen/arm: ffa: Introduce VM to VM support
Thread-Index: AQHb9xP9tgnM92Sxpk+5sdmAsJMirrRQbvOAgAHDiYA=
Date: Mon, 4 Aug 2025 07:21:07 +0000
Message-ID: <DA6D0021-A761-4EEF-8A45-712774B2568E@arm.com>
References: <cover.1752754016.git.bertrand.marquis@arm.com>
 <50224eb7cca4eaef2646ad8e33f689d912704733.1752754016.git.bertrand.marquis@arm.com>
 <af3983f8-6d45-4cc7-8523-53d104edb0c1@gmail.com>
In-Reply-To: <af3983f8-6d45-4cc7-8523-53d104edb0c1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB9PR08MB8699:EE_|AM4PEPF00027A61:EE_|DU0PR08MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: 3172c775-100c-4297-f8f7-08ddd3278eab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?FZ7aPkX9eSZGUJWuB4uHLpqsZkIvCvPZoRIm0r6S9GycYywzzb/lo6CbQkWL?=
 =?us-ascii?Q?Y3/p4JHcLrFp4STgA7vPF1aVL/ZimXX/VVj1Wl29UnygZBsOeBwRLkGRi9mO?=
 =?us-ascii?Q?eFE48kQkFmk2bnVjP6HLyxG1S6O+D/6KjQZdVieaxxGdsx36bDPT0XPJ0aae?=
 =?us-ascii?Q?P8HSom9xopOt/TcaH+7XENK92F66JesOdK8PFxIJIbc33U6+MjBeqNVZJkJe?=
 =?us-ascii?Q?lzUQOwFwNk0+irkt09bfH4FDoytika5NE+nQ7xPbVcW2Rok7oA5ey/1e57PU?=
 =?us-ascii?Q?ABDLj/Rl8UfXDiTkZen1MDUiXBU/q4NHOqeEMWfLKPN4yFqMDASgWa0yrQYj?=
 =?us-ascii?Q?m2bGE4ANdvt17uYw3XcQEp0M69fPWmh0IVkqtSCjLdVlQCQYGB2L7tO0veVm?=
 =?us-ascii?Q?WDrXsyjZ5HxM8NbTjldRGCvKbzFabS7cp/oEj/k8qOEmC33F5Wp9AJSUJ3a2?=
 =?us-ascii?Q?/Nmf4bMD9SxpHWv1MMUDnwdR3nWk8ISF29NuFzbf1zZFkA86R+wRGh1y7oeI?=
 =?us-ascii?Q?dX+29DtQwv/sY78TJGrCU/zRsryI2aXYSv40I5/8G0lKoFLIEoYx0HmR060/?=
 =?us-ascii?Q?fXBTPCn2aETB1Of/KTlqSS9ck84usg1qGz6dUFIEAQ8tmIHP5axOW2RvX+k/?=
 =?us-ascii?Q?FyF4GL0psaHhZJETo2Z6vQyvD0utlty2gmGufKTx/P6jwMJgp13jBxuFwUjv?=
 =?us-ascii?Q?C1zkH2m4lvY1B22QCaYFg88gxhvtZe+os/yw9F6UitZn+4RcPtVj4BmIr7QJ?=
 =?us-ascii?Q?bKQhrrQXcepUv/xuTn1Y+QPLevG7dDrRVVNWhBQ3aJdi492pJjeJDFkD6vtr?=
 =?us-ascii?Q?tPd0cNZSSkvCIvbdaARH5p2ZVSS7btJ1BX0ONKSVt5/dLzFn6VqlI6mFI9xH?=
 =?us-ascii?Q?F8BHZRyYVvRO7Ik6pxtHEBzAhPqkaYcLyD0Ih7laR6k2vI8+0dQG37aezUW9?=
 =?us-ascii?Q?OS2XICEz22BHRjjwj+y6QkeHlTqAav3tOz2V+zV90cZZNGHQx5fVMguxxjtR?=
 =?us-ascii?Q?GyqsqJ+CuWTY55sTmU8MdnazUqgkxTLsXtGZEZalVj3NWzg0MfNYYm/TKb+h?=
 =?us-ascii?Q?YGUE8HHsJs2CAh3/cFcy7tRk+YN/qYIzy37LVvn7Gczxy8yAxx8Mrcdur4PA?=
 =?us-ascii?Q?nL1rTY8impn49RH3R3QoSonnuGz1l2bRgUPBAwMjQolAjd3MNwzo3E5KOjWX?=
 =?us-ascii?Q?pEfatZp34pLB6qxzwlmhqD9VgLnqUaWUBGHsQkg64u3zphIRdKKdTNAmBaaw?=
 =?us-ascii?Q?uCr5Qchdr9MZy93qSYXcfRUEhU7nf/f/ZhotUxZJnABLckQzJHKRukYMiu7w?=
 =?us-ascii?Q?g6A8jU1gQibTs+GH0PDMUrJKGkE210uYsOO2z8y9/RwYtcD26xJ62viK5e1t?=
 =?us-ascii?Q?416TZnNrBzKj+GnpID3i/ZfJK938o8NHgPGECK/4bx6JyT4pDmtrEvJLK83f?=
 =?us-ascii?Q?aPGmWZKxeLJeB1Hzda8sgguhbHpT2CKLMVPjzz9OXBKRzm2zF6+YHOiuGyok?=
 =?us-ascii?Q?oN454Y4TJWH5eRA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2CAB79268E9F454491514D3690CD07DC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8699
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	78d25aa4-9418-448e-aade-08ddd3277b01
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|1800799024|14060799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d4Y6yJ4SYFYkqO7daR2JOYGLLHcs/rF8cj5gYJHrNKALSCncf75WWqlsWN13?=
 =?us-ascii?Q?1vJYfbx/Y2RvHKKEl8Ml4A2Gyt2KKVJq4M/5P6xIvHyy58VtPqsehmvnpjaK?=
 =?us-ascii?Q?Qm/DterM8SPtRo3udepKGnLmZwTuPWeENENljG7ngblOXrBpWJLN1GPAvmNq?=
 =?us-ascii?Q?DScXw139jc/llUPnLVM4OoL76RPVZt1ZyretdvKjYFDXXx1/2HJXLO6+YP+q?=
 =?us-ascii?Q?mAfYB92DZ6IyoiQ0wNR1oaAIUEvUTmqW7YTD+IH+gMxKGgzF562+b1M7fnZW?=
 =?us-ascii?Q?RxpoLsOelREpvdQ6XEdiu5DK4ksSssqWRbLDZgOzV+0Kz6+EmeI05SglNM9+?=
 =?us-ascii?Q?Cu8EJtWSjAZGOon8iyfJIH2XQfuEJ+aCLgv2KQr7DRVPuaZc1Y2xk/OQRFtA?=
 =?us-ascii?Q?9NjWEUNmwQF7vwbLgL99AOr3v7ljQlVhkcXEVijDbjDkOWMnVZK+PuREzzet?=
 =?us-ascii?Q?LiEwuitFlIklmeNUReExMn2O2yLHoPvmLESt2ygJnoDYk90JAEsCvnobb70u?=
 =?us-ascii?Q?xrmhKs8i38s6PXTzmeKuV3nLLytl8nqnEeHHcUazM7sGx8eSLSshHd9IPnkv?=
 =?us-ascii?Q?btRDbLESdM4FVIEQ03u/6puxNWPBGFKRMpdq1zLPdheBEPFkztXyeOoqL5GG?=
 =?us-ascii?Q?ZvUMIVnC1NWTIhMmSlmTORJfrpG4nBHvfhqjaNgoKcQub7kZHKAZpY6a/Ovd?=
 =?us-ascii?Q?3/pRuGweXp7O7xpkf/VZ31U70XL1sH5lny5nUb8RLMEWAUk+j4yop7EEHbf5?=
 =?us-ascii?Q?H4UWnA04MHQiWj3a8av8WkMBhxPW+ybeB0cdCjc/GQWcCVuZ8pu6YHA7wNnE?=
 =?us-ascii?Q?9N35gBZaNoIQNVxSi/KpaKi4fmMotWyiIsp/3DHcDgWFsuVHGvySYva/S16X?=
 =?us-ascii?Q?ht+QQY50984NN+faoziPtNevC+eeh2Pze5+09Rq85UzPghSLkHj56Gm1rWVd?=
 =?us-ascii?Q?LD/Mzezg+JYjChbJnr5GAjd3DPKRR+tUgJlcVL5dz9SbVVztriWu6NrE5+gA?=
 =?us-ascii?Q?g+/uumwqk6hhpmOwqfGOar47EXsfWtUjvl4MMTgRbbQiL2k0lfmlZV3y9OX/?=
 =?us-ascii?Q?69U1kMQT2/JN9Wt9PJLT50zZeeg/CWs0oJSgmOGAerz8GvS1KyAysXKmScfY?=
 =?us-ascii?Q?pULt5hEOyCowNPNgqyiJ9ngCXD9SahmSejNRDTw62W2CB7Out8bdQSTbFx3W?=
 =?us-ascii?Q?uBx5ZZXCGI/zqDkd32IYCDrmGnRBOC/eA6EbnZk47kiZ0aNrg0GT+wskgpca?=
 =?us-ascii?Q?nvm6jFYZi5LP6pC+uiMvZrQ5aPhEWRHszaIShsYHoKW6ImD1/zO456cYf6a9?=
 =?us-ascii?Q?6IT9yceMxVeQoNnt8VaiGo0kZBnAEWNi/Ym2z9h0+hdJZZoPuJ0tDIarHVxE?=
 =?us-ascii?Q?dSSVnBtT2+keIsumPpKqeFFwVfCRgns+BJCwBwqv66V+AYX5v00nkHXrbfay?=
 =?us-ascii?Q?W3qf0LLxdN2nxOacXawTswN/sv5r5VA4yJJcaRZmjO09wstViBz20k5lxUyy?=
 =?us-ascii?Q?Xl+VSmgrbbVKcHa93e+sZxvIJs8LzhiHT/On?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(1800799024)(14060799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 07:21:40.6177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3172c775-100c-4297-f8f7-08ddd3278eab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558

Hi Demi,

> On 3 Aug 2025, at 06:24, Demi Marie Obenour <demiobenour@gmail.com> wrote=
:
>=20
> On 7/17/25 08:11, Bertrand Marquis wrote:
>> Create a CONFIG_FFA_VM_TO_VM parameter to activate FFA communication
>> between VMs.
>> When activated list VMs in the system with FF-A support in part_info_get=
.
>>=20
>> When VM to VM is activated, Xen will be tainted as Insecure and a
>> message is displayed to the user during the boot as there is no
>> filtering of VMs in FF-A so any VM can communicate or see any other VM
>> in the system.
>>=20
>> WARNING: There is no filtering for now and all VMs are listed !!
> I'm pretty sure that there is already no filtering for things like grant
> tables and event channels, so this doesn't make things any worse.  That
> said, FF-A is quite tricky to implement without integer overflow/wraparou=
nd
> or denial of service bugs.  In particular, code in Hafnium (Secure Partit=
ion
> Monitor running in S-EL2) requires quadratic time because of repeated lin=
ear
> searches.  Xen is allowed to use dynamic memory allocation, so it can, sh=
ould,
> and must do better.

I do agree but we still have tricky cases where we could end up in unbounde=
d loops.
Some are handled by adding some limits.

Dynamic allocation being available in Xen is helping a lot on some cases bu=
t for now
I try to prevent it when possible but we might have to review this later if=
 we want to
increase some capacities (for example the number of shared memories).

I plan to do a presentation at the Xen Summit and a design session to discu=
ss how
we could define a way to define by configuration or at runtime what secure =
endpoints
or VMs can be contacted by a VM with FF-A enabled.

Regards
Bertrand

> --=20
> Sincerely,
> Demi Marie Obenour (she/her/hers)<OpenPGP_0xB288B55FFF9C22C1.asc>



