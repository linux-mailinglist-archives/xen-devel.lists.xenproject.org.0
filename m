Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6EBC9276A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 16:37:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175011.1499933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP0Wx-00031G-8L; Fri, 28 Nov 2025 15:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175011.1499933; Fri, 28 Nov 2025 15:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP0Wx-0002zn-4V; Fri, 28 Nov 2025 15:37:07 +0000
Received: by outflank-mailman (input) for mailman id 1175011;
 Fri, 28 Nov 2025 15:37:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q4nf=6E=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vP0Wv-0002zh-RS
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 15:37:05 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16780e7f-cc70-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 16:37:03 +0100 (CET)
Received: from AS4P195CA0030.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::17)
 by AMBPR08MB11654.eurprd08.prod.outlook.com (2603:10a6:20b:737::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 15:36:59 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::97) by AS4P195CA0030.outlook.office365.com
 (2603:10a6:20b:5d6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Fri,
 28 Nov 2025 15:36:53 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Fri, 28 Nov 2025 15:36:57 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM7PR08MB5510.eurprd08.prod.outlook.com (2603:10a6:20b:109::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 15:35:55 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 15:35:54 +0000
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
X-Inumbo-ID: 16780e7f-cc70-11f0-980a-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BT5MlMxc6AqzRyUcC1bFeML1/tsREyaMGXZcLP3EQjhKdMVRPhvwaCoGhTpm5bfwJph1Z14kkKxV/I0YQ15DfJgw6jJHbJsLwti514Z/Mhf/tV3qWP+dMkEtxqGdv8tHz8Ham0YIe6POZfq0tF3U0iPnC/29nTZKvvCTbqK8PqAe0b/E9aWVtseLJIatmAdG2KJfdsF4/b3xMGlXQ1+yMBTRM6P8s7nRiu3o0XVWl9WnoCur+f9IE4bKUkVs6Cp0r1Oc0n9usssSvQgsdKkl8uWO+yAMJY3qo5p9J2QCvK1LPw3eDzEe/5Ptsv5WYS6c+Oxq89Rj1omFksUOlEeHoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQS0E5j3qL7kNHEc3yf8TEfzNZMqyFeb0sE6U/bCnSg=;
 b=YsKvBXYCXylVkB2NXtBqw2i0FYbGAhkoguBIhnlE16T0Ou4vIrZCLVtXap6OZ66vDlUSwZjYsGw8/pAeU4DPTZ8igtT80SnEZ1zffgvPpgzucgsweNAWmVCqjwL6ruRBrMBUH7VxP/RG572KhqUS4kQqZekG/tlpiwPR0Uc21uStyoEYxkxwKX98Egf/FVNRksVzpP6X0TictOVSoexq2k32IN0WBNkc4Bj/tDKDgcjLhfDxpOxtFNCoXKnBHESpBvRMGChCYS1+9qKVk5fTBBs582WuBEjM0qZ6k1cILKmNlF0JU+W1Z8ejB6mbU1mpVuGT12sS8ZHB1LyTNci1nw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQS0E5j3qL7kNHEc3yf8TEfzNZMqyFeb0sE6U/bCnSg=;
 b=d25j9VpQ+2JXqWw8418zTiVrfe26qqYpAmZnQR4/MFXS0H2bAoEZkcWAtbfefEIAk3FSa1LUapw7vZ4rbmo6slXJc5t7n9TuztXpvX5DvybWsk8PbhcRtDit0fL8XduOGFWxk78h1MC6SDvqk6b39rrhzLypf0FMO8zciB05B/w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXGhNmk4pJ0eaSC8tWy7b/FIECOxhkp7hUilhEc8wFNVuS8heKZgX3xrHgzt5PJlzMdlWJWMENpYY+yB+DnzwNwM4e7YdLjSGbjpyrVZ+ccj3zZ6JM+n6v6XdxsP1/KRuBf0hC+5ZTj/jYfwCzmBWfw7uyDd3aHoprE1ap/YoASin+DCiDp5qK1mlrb1REN5Pagb2KvoohoS4vlNnEQJhK+YDpoFwcZV/qelB403s3cE5Jfswc6j0y1e7gdKgAaRgA0iaI2x0BGvWdX8u83s+IcPRQKtOtUzMoOwSMn5JHfqgHl6twhkh/Tj7RqVuO46s4nJRmgu/KNo13WSs/vRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQS0E5j3qL7kNHEc3yf8TEfzNZMqyFeb0sE6U/bCnSg=;
 b=g8kK4JzyAjIH9NImadDwM66ozEEIGn78MmdEKSY1gEPMLVCpBPFQbK4ILQ1q5OpEUvPmyUR105R5ltHBOUUeVHk246XuR40//ECJMnIKZOOPo90qdr7pzn5L7ZfY86A7ueeJQvfR+pTelDLGCLGGem0vVmef31E266wTwtNWwnzUApAPC25vATwMQRpeqCXKlI5PvMC+1sd2m0MutFrbkgDBA+4yo2QHsNJWxTSi2RsO287kimlVeqHagMz/eVHp0HxFrd31pZXvInQqwosXzFdRH8TcWrVdImImh9N14H8YnzLkhp+/fEIX3C7Dkyp/3hZSUQ+C9wMDjydRJKwcPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQS0E5j3qL7kNHEc3yf8TEfzNZMqyFeb0sE6U/bCnSg=;
 b=d25j9VpQ+2JXqWw8418zTiVrfe26qqYpAmZnQR4/MFXS0H2bAoEZkcWAtbfefEIAk3FSa1LUapw7vZ4rbmo6slXJc5t7n9TuztXpvX5DvybWsk8PbhcRtDit0fL8XduOGFWxk78h1MC6SDvqk6b39rrhzLypf0FMO8zciB05B/w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 2/3] xen/mm: add generic domain_clamp_alloc_bitsize()
 macro
Thread-Topic: [PATCH v3 2/3] xen/mm: add generic domain_clamp_alloc_bitsize()
 macro
Thread-Index: AQHcYHrKI/DuZxtTF0mX/NaGMgBzNrUIOEQA
Date: Fri, 28 Nov 2025 15:35:54 +0000
Message-ID: <ABA3CC5B-CB70-4DB9-AB52-CA4C2413BD5B@arm.com>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
 <20251128152218.3886583-3-grygorii_strashko@epam.com>
In-Reply-To: <20251128152218.3886583-3-grygorii_strashko@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM7PR08MB5510:EE_|AMS0EPF000001AB:EE_|AMBPR08MB11654:EE_
X-MS-Office365-Filtering-Correlation-Id: dcdffdcb-8b4a-4d12-f308-08de2e93f74a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?QydtSSsSuIrnqRffBoyrxuE7qJoDTYPRIpGlf02hYwwcW7Ls9N2Fsc4d8b?=
 =?iso-8859-1?Q?0yEjyg94bA4TKr9c+zgIhP7xuc5pkSSuKPJBMO58kksHVlQKeXv3p5BF5u?=
 =?iso-8859-1?Q?tbCZP3E01wd+qN4A3BS4nSOPMRJNTAjIs2KFX8JDYcrnpWQ/wlOallLL/x?=
 =?iso-8859-1?Q?xv7ozi9gJFx1F1jcgAXGrHsseMmZqzcDU1xHZF1ORjzahtsLFf4LGKuC3K?=
 =?iso-8859-1?Q?UyNqdrLtZxQI7qDZ7OgHTkatGagstIE58NTgeR3alBwhdnBfOpgGNO1o9h?=
 =?iso-8859-1?Q?DHXfVQzTQqThFaLY1DnaHx/Havj64cPLVhgpBWqCfJHvYZY8AZLAiH3TVO?=
 =?iso-8859-1?Q?CWNte5k82H24xy1Me2U9R1yilFFU3Mz52aIGYYxhK6Tv3egFWJhsMlAeuB?=
 =?iso-8859-1?Q?oEBScYIKjnhn9WQoF73D3d+CAKrAoU+w5zYsFXq6NFp9OwP3Dzh7yZZ0NY?=
 =?iso-8859-1?Q?HBvgOe1F13nCvY1fIllkyBp7zU6cd9X9iIPAVdR6OVEnFqjS3zGIMLoWYg?=
 =?iso-8859-1?Q?VPSkvLHmpQQhUc7jxggu6YEtm13LkVcO4vQdiU/oNIvK13538AChDMtpIk?=
 =?iso-8859-1?Q?h7Kq8LxASeeTzo0AcYaYzbnwEO4O8ueDePiFLLCNXPV5Bo4lneawyf9RDO?=
 =?iso-8859-1?Q?fRED0MABhV0D8fU1i/bhnsNuYohNZpUNMxS//ILGIbi3ZFkGjMGqpU+Yfa?=
 =?iso-8859-1?Q?6k4Bw7V7RMPmbHg3DVcKNe5SnGvL7XruL9VatgZ8fSJ5ljOM1dKRydDDTW?=
 =?iso-8859-1?Q?8d1Dj7Am2ZYqUG1PoQ5evslItutqrjQ+looKvj9G5FFWeIw4laBSkFVRjZ?=
 =?iso-8859-1?Q?hmeqxkAhwxJQ8cv/i2jFbPtWsAzqoqL5wN2Ck7xyNvWCWiAxjwQWpavyP3?=
 =?iso-8859-1?Q?DHNrHz/SgX56qOllty8OV2gamDX5KCsJC+NWZloGg3by6bj/X+FqoYMh+a?=
 =?iso-8859-1?Q?Utfw9dG4lrVhxadhZxvjP2eLi46IWgFTPFHUEHPI9ws5hNdhDayEQ2Zl3r?=
 =?iso-8859-1?Q?Hc1ZZon7F4T8lP78jB5Y/CTzkTAEeE0N727eLJcrOqkZD9ZvbWMjR9G+dr?=
 =?iso-8859-1?Q?cAKzS2bQMp0B/QQhXt2unM3C9d2mjxXsYWh519EIMI5OVv+AMLV4//NAi1?=
 =?iso-8859-1?Q?a02ie1KQyipOuCQC95ibfWDJh8Xa8QpVtUueu2QS+xeOrtetwsc3KlSZHc?=
 =?iso-8859-1?Q?hLC+Lfn6nrsMCTyv2BdpLjCG/wJujpoWnh1J3Lh/oV7KgcwPaly/O14fKK?=
 =?iso-8859-1?Q?A1g5RXamN7te/hGBP43l/wuT/6E8v4eD68xQFAZMRZ0oQ5mZSn2VL4U7Te?=
 =?iso-8859-1?Q?WeaFp2a83FfMESVvtg5hFNGMTntL1RVEsrFxvCu/0YOwWrkF2Lfk04CHDI?=
 =?iso-8859-1?Q?RSYl0jT+eEd7Z/ucfPqysSRFDwj5fZq5ceZ8utWqP3DfT51Aga9iw5jbWX?=
 =?iso-8859-1?Q?561GTH5SlCvnFFcsZmea9e5+F/dYjO5MVONIlxxTMgxkIiMIjszEzhfArh?=
 =?iso-8859-1?Q?k1R9wYU9THIY2dOrv0CzWFav4p06qz18BqangwfhdbLQA/8V009+comM97?=
 =?iso-8859-1?Q?x/GFtgWuARfkm79baeY5IUKHRK9a?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <74C14B25F6A92A4C837601C1E0F1AD49@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5510
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d87789a-ffa6-47fb-bbd4-08de2e93d1da
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|14060799003|1800799024|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?OBqNSs1VmwMEI14nhGnyA7wGNszvXRu0tw+XIs/tSo7JR3xXxduNAsLSI+?=
 =?iso-8859-1?Q?H1CB1/qFfJvPlcbD/goJnqoDsLnHDiA+RYzCrkC95PCN8jgB6zSLt5mB0+?=
 =?iso-8859-1?Q?znucj4sWjhn5FYf4Rri7VFCcTNwBAIkP+QOP7rEjI7+GAhDMdHcJIyRiSA?=
 =?iso-8859-1?Q?Hx6mWmWGtuL2x5vPbp05wnAYExYOzEtCNt0BqDAYfjgBamWRgM8sGLAJTl?=
 =?iso-8859-1?Q?5rAI5pYR9OzizsjC/0x52tupz4eOBtFR4ZlqklsEVPPv4AZweNcHCFhi4i?=
 =?iso-8859-1?Q?Z1dg79ihGvJOfTvCUK1/6lM9LGoTgXTM1YFGNArLFvWyKXdHSXLK4QHYdo?=
 =?iso-8859-1?Q?8/X1XKZaSueKBDMG3i8OHw/4IVMvPcOC+QHB4jBD8C5GGs6fuAE/NZcP7+?=
 =?iso-8859-1?Q?YXNA3F9khrGk13xGj0pYm3q2w1beqJMqpa9snNBFCTKeQdk7Rix5CXh4CL?=
 =?iso-8859-1?Q?wMkBMabwu2Sevm1YE4tLA2Bn6WAOtq4sTDcarcci1rnW2t4y2gkK5II8DR?=
 =?iso-8859-1?Q?UWSPPzgCIqwjvoSBy7xGvSj2ayIhiOCY3bDoDq7wqfuwQxsRzVQdlDr8iz?=
 =?iso-8859-1?Q?SxAJzIfTGUwVy/3rBuYODe1O1YOmxJtPjOR3LQND/laFkrj6HvMJ8qpTru?=
 =?iso-8859-1?Q?/0MCXrK5l7A/KlnT1O1pRvivHrplzpTt33RAt7ZkvbZTSrslTed4IfwvyB?=
 =?iso-8859-1?Q?lDpaavT4FW8C0FLmtL10yV89rrTWF2ZSqLpJhd6lgcCpcYBMB15ESTdZd+?=
 =?iso-8859-1?Q?9Vp+SXA69K6zX+PQtK2brlP6JcJs0fazB4PbVnidhwuqOdy/ewLCY4341b?=
 =?iso-8859-1?Q?3/G+oWSVHgatv/zkYf43kAXLjWA/L95T7JzDHwc0uZOghI2wjG2d+7WDKT?=
 =?iso-8859-1?Q?FZWc5BqR9pXOoaYYrv21YZCHBlQFuoOfmIUjeWUowPdFnk4bREeDMqhpNn?=
 =?iso-8859-1?Q?ZEiOiByOwPi7/Sw4+acF7nY3fBgR0dk+dYiKky51LUrFLlc73phouXg07j?=
 =?iso-8859-1?Q?HPfH/Osqi8E7hJhbggu+iUGTDAiiasFT+by2AX/ua1SsWBde0mHhBChWHq?=
 =?iso-8859-1?Q?WcovTPEwtx2wSRqM4zOfNHSgdGffyuHVeXOcBIyOjG1V6PX/UTg4kPiePi?=
 =?iso-8859-1?Q?666VhrR509YYb1h0hFir9LYFRaXo0l3VizXlgnO7iRYjs/ASqZT7kihSfR?=
 =?iso-8859-1?Q?tFcH9kan1GBeBqYV5I3bdkiNzVyBN54eVW7qu+nGKxo++TsydCsJXxFYRK?=
 =?iso-8859-1?Q?BEXlXtvlUH4H0JELb87OEx2FJjnQczXn/D7NLNpa4Ru4e5ANnS3Sr6FKGV?=
 =?iso-8859-1?Q?qU3gLjNMmIOf1klqfzN7QsGFDd4nZz/Pb5w5HjG8zLWIQVWXKC6rK2Is8J?=
 =?iso-8859-1?Q?8NZ8jg6QXudr35IQT2dcwrkc6lOcKws2/cevThEdqUk+ExfhKDQAGr+p7E?=
 =?iso-8859-1?Q?lU9ZyGGLFCtuaGqDb7npF0tCnNbjio3yS/k6hTlMa/y2/e2b+EZfVnN3VL?=
 =?iso-8859-1?Q?wdPWajjJknSqFGMU/MGeqsokEO78nq0UxFDsEZE96NCBgEUIluSfAnyOc+?=
 =?iso-8859-1?Q?RgLoi1RLtlHFHO4PGP4D7F/wmXqwrvGSP0hFrnSKE39Kqr91Ilv6CHeRni?=
 =?iso-8859-1?Q?JwsUI2wUMog4I=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(14060799003)(1800799024)(35042699022)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 15:36:57.6162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcdffdcb-8b4a-4d12-f308-08de2e93f74a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB11654

Hi Grygorii,

> On 28 Nov 2025, at 15:22, Grygorii Strashko <grygorii_strashko@epam.com> =
wrote:
>=20
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>=20
> Add generic domain_clamp_alloc_bitsize() macro and clean up arch specific
> defines.
>=20
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: no changes, added tag
>=20
> xen/arch/arm/include/asm/mm.h   | 2 --

Looks ok to me:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com> #arm

Cheers,
Luca




