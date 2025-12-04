Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50493CA2DA7
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 09:46:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177382.1501681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR4yI-0003M5-TA; Thu, 04 Dec 2025 08:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177382.1501681; Thu, 04 Dec 2025 08:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR4yI-0003Jd-Q4; Thu, 04 Dec 2025 08:45:54 +0000
Received: by outflank-mailman (input) for mailman id 1177382;
 Thu, 04 Dec 2025 08:45:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=anql=6K=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vR4yG-0003JX-Ss
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 08:45:53 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a26c84aa-d0ed-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 09:45:50 +0100 (CET)
Received: from DUZP191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::17)
 by VI0PR08MB11549.eurprd08.prod.outlook.com (2603:10a6:800:2fc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 08:45:46 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::bf) by DUZP191CA0029.outlook.office365.com
 (2603:10a6:10:4f8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Thu,
 4 Dec 2025 08:45:45 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 4 Dec 2025 08:45:45 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PAVPR08MB9308.eurprd08.prod.outlook.com (2603:10a6:102:303::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 08:44:41 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 08:44:41 +0000
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
X-Inumbo-ID: a26c84aa-d0ed-11f0-980a-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JYYPkJ56QNMLcERezwP2JtA3tdHf1ok6AH3faMaJzVuckOzhUrTONE/2zjL/TNcApm1RjmhlCclqaCqMVXfvmh1Q7ZOrwxVLuE2Zmd0zDuJ5l8NKD3HA84iYsfD0HhPlSKxMFe/NLC7rBF2kWRdTnKiSl5bGEFKdixkQur4CkWWDPTfEwIqZC3gwtprfv58Vgjnr3etEJKCh+MUFyQxF5IW3UHgh0z3g0XY8szANs2yiOPloZCSMbi2joPxBtLjNxWzUVkEwAu/Ji5UO3Af8Xf1dqoutO7osxFkHsLz1dgjSFnsD73M7fIwsX1besHMUVRaH4B3EyzrzV+YANZw2jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehfkvZHkUdLZkpqGnHzJx+s1dyrXJ5/mwH9i7SCxMRw=;
 b=WzdJoXjTnNq1HeKjiYj4ObrZEEiOqUHSI4esFDU3rePDYSX0IQvLye+3WHl4AzNE0Ss5FqX/EV29f1hjN+SP3AZ7uZzPCPYpSQWogAGLaN04F+QEzKHdaRIGEWrbSjH9yl7iJS7+jdgCyTJV9lew7E9ipXR6FwwmklPVgFx7bIq9LtuZtIfuO271lkmK2L22xSwCoy0oD8sVhUs9KL3TY84kCjA41mZXPt72UFSREa4h4lp6MXHepLRiSJu0vnIFLesCinXF4gEl+0uhyiyqA8ZPG8mZ3jBKn+mwwOAnZl7uwYUeBWwPLgxwi4Rz7vhjh8xI65ek8n7BVmKmtFL/Eg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehfkvZHkUdLZkpqGnHzJx+s1dyrXJ5/mwH9i7SCxMRw=;
 b=k167xQ4ij+LheTrprIMXjVXZRFXHlaDUj1eWOx/YabDByck6j3dkkRzb2v2F5RIRTr81VZSj4CBFCPTPb7COX4rQL2nPzsVkTaAO+GKpVqyvvZdNsDpPcA2CDhL5b7MeFPkAKfM3j1psfTEd8k7F2sBSJTif9YP0laObOUwLlTQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9uX1iY20emHCCKI/5vIwVqPaqwfqx4jCSt5EI9n5E5Qhu6xlr9m96mmvVbU75v/mB2JfZI6dAf6jY9WMV8QTAEqn1UHj9Rdoo7vZ9SijtLAAwX8tkar/f+Hkm8rgt1c4RozcfnANLOJ1UYQJM6XpwrinOwAAM67sawy0ZSoXdcZF8xo/cPZ7oWiFlAAJQJSL/Gwy95sFc+e0kYvOH/Vid0i6AU6RZqEd/1nTp8Bgb623N6QCyNsT4jCGtvSyzBmuGErN6L8xx8mBP8HUWTjbmiin8TGSmwJX7eq3Hp2ZvhJhRj2KerlunnKmVKCMhDLZTLjjs/aDCPVNXMYniuPWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehfkvZHkUdLZkpqGnHzJx+s1dyrXJ5/mwH9i7SCxMRw=;
 b=UD9qTc8kYrOs1FK1Di7PWgGC9957mxIj0oYZE3vKWlXhKAWy9uxXXjJA+m7J7ULsXnU3HBCiFRPCiDLfkFsv89RYYqv8UQTc9zBe84TD40ZccsyHAcuge0ckWPiqZv/UCeT7jV/kEtQ1yZy07CqJh8N3UJzxFxg1gshi9ZOyIij/lVrxkEoD3T+O4QLFwFNRtam0XSUwVCeyQ9pr5RN6cQDEgw2JHl1avj7vQua5ArMwtj20D7UD9ax02yHJ6qUsPyApZ6lZd6x/VHNI//+PyJ39Q26qLN/E4dOJgE/fdVXw55jBtt73WzXyfMzuuQmj/wKzrGZzCi9FqtbmluKFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehfkvZHkUdLZkpqGnHzJx+s1dyrXJ5/mwH9i7SCxMRw=;
 b=k167xQ4ij+LheTrprIMXjVXZRFXHlaDUj1eWOx/YabDByck6j3dkkRzb2v2F5RIRTr81VZSj4CBFCPTPb7COX4rQL2nPzsVkTaAO+GKpVqyvvZdNsDpPcA2CDhL5b7MeFPkAKfM3j1psfTEd8k7F2sBSJTif9YP0laObOUwLlTQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Topic: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Index: AQHcZIbKZWHMCLfhnk2g+3dibmJCCbUQaX2AgAAU4YCAAKzmgA==
Date: Thu, 4 Dec 2025 08:44:41 +0000
Message-ID: <9FB64A3E-D05F-49B0-B979-25894D25BBD9@arm.com>
References: <20251203185817.3722903-1-oleksandr_tyshchenko@epam.com>
 <6e83d3bc-c49c-49f4-9dbd-e994e53a62a7@xen.org>
 <44f6cb05-33c3-4937-b508-7616c36d0e4d@epam.com>
In-Reply-To: <44f6cb05-33c3-4937-b508-7616c36d0e4d@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PAVPR08MB9308:EE_|DB5PEPF00014B9C:EE_|VI0PR08MB11549:EE_
X-MS-Office365-Filtering-Correlation-Id: d31ba91a-7b26-4c5c-1459-08de3311840c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Kylp546LLWs67EbUWpcztDzJLy4snaPI//eyMekgr9GqtrdanRXx3klwJkg3?=
 =?us-ascii?Q?/4hSSnoyELSTZ7pvDrclnoq0os9LRbFzd0J7/iDvX0gHEOubYLO1OKAl5Rvz?=
 =?us-ascii?Q?B16Zmg1xE+t2P1UKzGdSHqQMXdxtM25XpI/0Uh1M1XIIJeYVtCjYgKxhfg5m?=
 =?us-ascii?Q?RewKzZsyIBvPhHJ9dXf4tpc+B1LV3K4h3Fht+yKfzEboHm4u2MB/m6IpTJOp?=
 =?us-ascii?Q?F48xg5Ecj3/6rYf3gTRZkyJT8f1Wh1M7jXv4cFXyMokpFVHyy0H77e60rFbR?=
 =?us-ascii?Q?C3jb/tALbfqAQNG9Ebsj3cO8ASZ4eezHvSi37KwoSJDnOyZ1pMATNCv8OFoh?=
 =?us-ascii?Q?ULYROxbaPJVVF1gx0oAm1LuGkl0f8A5ryurvLOH7yeVIjCey7aDfu3zgPCMT?=
 =?us-ascii?Q?JTSKf0sjGLayTkh1tc0BIzdmR0zR41eeVY2wvtqZXunxDOcLKmng96jS0OFA?=
 =?us-ascii?Q?oVu2qge3v6ELmIeIdU0NATelGcQvlFgVEpYZwkiOIPYyW5ncCEfvOUn46A2w?=
 =?us-ascii?Q?M0Kv9LagtVAPmlhHV4mD5EYp+yvu6f8Yw3fKRU4KViVGTvcSxVthQhm3po6n?=
 =?us-ascii?Q?vIqEIVeUY9lKcio1T7T3b7qvXJ+uqUmBH2UBYJVbvZ/U55RZcuEPrILbenct?=
 =?us-ascii?Q?w7Yv4bLWPH4A70oK+JC3tugkzYEWkKCTmaJu2PXp/SV+03rs0wkJvvuWm9zb?=
 =?us-ascii?Q?8MRtpq8PyHSPTT7KXjAKOZoSV/LdkJqUJ4JPb7Uuxr39vwYPHl5DnC9igz+Y?=
 =?us-ascii?Q?jAscCksYbFoZykDe1IYYEhnPwiTj3GB9X2p28wmE6Ke6t61zS7/z8ewxiq1w?=
 =?us-ascii?Q?DnZCOoQ0vgelC4DDW5uwPBLP66fIREkGvjo4ibgH15vdgv8Jk/J/Dcv8+VnW?=
 =?us-ascii?Q?85stHHlqbhoTOvW8D08qAqhNrAV83+r7BIGMxSw13zdTlMMAK+d5euRPuok6?=
 =?us-ascii?Q?ZQVg1xo2LQsMT7ziZkBKP/QhK26wmKZQwFYD4bluNJZ8DY1opbNw4IG17Zx9?=
 =?us-ascii?Q?ndc4BJwnZHPV+/rt5HGyDVGHf9kY/cWy+9O4SfYgUt0onPmepdPHUV6c/qPY?=
 =?us-ascii?Q?BaUlXLvGGHpijrAkWsnSjLJalJgT1saZuIVWkFfFvwiiAian51oarhN+ETVr?=
 =?us-ascii?Q?poMDhRqmj5ysHPML2ACfjs4oW2DZrg5msixKbeg/lg4h/n3xy7XL1OonDPnZ?=
 =?us-ascii?Q?tg9Blo/Co9LH/eT9FgsQN3R4uzQ2cDriXplGHLjs6kvMJszh2keNMjrAzWpI?=
 =?us-ascii?Q?fSCw1OGBbFzk+azPefvse36IuPJclZRCYhKqS0NUSI5knBVIE6O+up49dSV6?=
 =?us-ascii?Q?K7VisydmhduxrfoQg6coX5L+m4FtjTYnI5UnvQhBFmG2y+vlBIRN2dsb0bOB?=
 =?us-ascii?Q?xf5dMYCU4P4omf2KRnkL1Qq3SFJ9Nfub7TvWYolsc+mPGSv8vRShNCTmZaVS?=
 =?us-ascii?Q?xrb2+fa/5vTlSlR2UdAG9tLPNfkY4xAflsn1ZJDJTho7TjMXSHI5+EGA4cls?=
 =?us-ascii?Q?mCASw+hlaKiZNKJy/3oms0492CSNiDa0wi14?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D33BBF35600D434DA3765474B5BC7DAC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9308
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c1eaf9c5-4147-4c3c-fb52-08de33115de4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|376014|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o8gP5/UW8W1ejwQpVQwE6vigOCG9wtVQ2DfYEaeMq7sNxcd2WXTcuA3RI71q?=
 =?us-ascii?Q?xCKlV9gNQ3IKUURRBLuR8gpk52R7AiimHFxgBVKJNllTTv/lBCi2zMTh+cKg?=
 =?us-ascii?Q?s1eBpRDBX+muLQRHJ6LJ+vD0IZGWHTAydcxHi6xvhJvbnwSl7RwSLIKj4YDG?=
 =?us-ascii?Q?W/jXZ+kIVhYj0WXzvSHQr/eAGJP2eEz8Ycja8LtZzaObYNeUELz/Rm6aCAWx?=
 =?us-ascii?Q?acpWDrNjQfM+xwlAwQse5+713Sp/WV4qCKL+IZ8uPUjEWRlZkp/ogUXjPMeg?=
 =?us-ascii?Q?+Ag0gCrQ/60u9rPYLjAXkTgG86XM2SyGxQlE3NIKAftQLyuxuZIRiB43ewyQ?=
 =?us-ascii?Q?buMsMQ46Xp9igDUnz4ZX6/EdKi4xQqp4PebzX5IjSqCFtNIfF8i/tHheHfXS?=
 =?us-ascii?Q?tSlCUdgaoknFyi+wdSbHhJVRggndcStpEdo7t6ee+W4GnSf+FTc3+4Rr8sdx?=
 =?us-ascii?Q?qWJmWf10vO2fRLYeRC8WjRQ3/NgE1msVLBGi8bta7/V3yUBPWZlwlOMkNHBE?=
 =?us-ascii?Q?V/BBhNQwu7WAQPVEzbFfFnOcIqhRLSAIoZl5F/GYiVWeclNCUi/qsKGZtyLm?=
 =?us-ascii?Q?C5lGR0m3ikfz29BdIjl83PHA6pTL6uHRcZQzYLynHiVsoAZUEd1iajPoxabc?=
 =?us-ascii?Q?OXMyHV6vitsixviJDCe4ZC+vcJ6cL7udhLPsuVI+63rVUm76K6AYe5QDvcAr?=
 =?us-ascii?Q?DZ1E0CCi7X6cvBC10b4tN4b7RK/7WafzXheJi/Mn1mjJ6fDOc7pj8Ne6lq3X?=
 =?us-ascii?Q?ISENw1oQNIXnGYpWD6nnQZwe+TpP1iYrAeGhMNWfbCjB8O6ARQrt//bTFsEs?=
 =?us-ascii?Q?Gh5yTjoGRLFXrh/iCTThJN7gihEmr9W5dVOfH2x/kL/BrcCw5i+J/mGekXg5?=
 =?us-ascii?Q?fF/viClSIbfd2/bQEimf/FUk9QOACm7YHnnNNYr3H0/vy+u4oYyZ/goE12BR?=
 =?us-ascii?Q?nXPn5+yN+7No9fsfo97fArrGZU439FFNzdcrlCvqrF0UAbAU/3NLarA2+MLA?=
 =?us-ascii?Q?H3HDhPdK2Nvf7c5BdGay0GAyIXxeEx/O3seC+HllHeD7vHAccU+rPXhScZyY?=
 =?us-ascii?Q?LarwkXzp08MCpRkSZYWtNE6krXqJbY6+ypAiSzYPk7KIV7qP5ded+qchu98n?=
 =?us-ascii?Q?/jBxvJSt+yVcYJ/654gYS48q1pkSrIoWdcnG3kWw1u/QIDoLwdR/mmx1Cwqo?=
 =?us-ascii?Q?pU0g03MYU4QmbjzGmpkZabiWqSZD75T86STCDEXI+N5gVFl3O+UUeUAhnxUB?=
 =?us-ascii?Q?8fXr/bWz3j2rXE4SZUdoel2njvgmCRjsR+RC4kQz36wXMB5jEuD9foCtT7ou?=
 =?us-ascii?Q?WNmu0WnqY7MhZTqbfcrl8aBMZsMjDMC7V9xaRmEPy4TMSCSbjec8ygtjLOeb?=
 =?us-ascii?Q?DtlbBmSy8lYnhyo94ytCQKda+5g0Zom89Y6aCmSxA39WMr6Xg0EA7cdOGUdZ?=
 =?us-ascii?Q?RgEx74rLSUTNeSVcpcQ3lPfScNY6RStQ+afgFZECX+IjGIxq6nv4ogSvm1Au?=
 =?us-ascii?Q?VSAaYcq5QmtMfIlgYYOpeZoofbNPcSXsVQJx+834BIUNM9Jrsv8TbLmlRVJW?=
 =?us-ascii?Q?ABJPQYofqvdpF8qYgPA=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(376014)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 08:45:45.5057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d31ba91a-7b26-4c5c-1459-08de3311840c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11549

Hi Oleksandr,

>=20
>>=20
>>>    */
>>> -#define DOMU_DTB_SIZE 4096
>>> +#define DOMU_DTB_SIZE (2048 + (MAX_VIRT_CPUS * 128))
>>=20
>> On Arm32, MAX_VIRT_CPUS is 8. This means the new DOMU_DTB_SIZE is going=
=20
>> to be smaller than 4096. Why is it ok?
>=20
> You are correct to question the impact on Arm32, where MAX_VIRT_CPUS is=20
> smaller, leading to a calculated buffer size of 3072 bytes, which is=20
> less than the original 4096 bytes.
>=20
> Unfortunately, I have no possibility to test on Arm32. But, I do not see=
=20
> much difference between Arm64 and Arm32 in the context of DomU device=20
> tree generation by looking into the code.

Let me know what kind of test you need, we have some arm32 setup here (not =
HW, virtual platforms).

Cheers,
Luca


