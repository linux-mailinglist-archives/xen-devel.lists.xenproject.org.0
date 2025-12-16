Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3A8CC1CBC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 10:30:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187777.1509107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVROA-0007Va-IG; Tue, 16 Dec 2025 09:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187777.1509107; Tue, 16 Dec 2025 09:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVROA-0007T1-FA; Tue, 16 Dec 2025 09:30:38 +0000
Received: by outflank-mailman (input) for mailman id 1187777;
 Tue, 16 Dec 2025 09:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zuqr=6W=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vVRO9-0007Sv-91
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 09:30:37 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc23acc0-da61-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 10:30:29 +0100 (CET)
Received: from AM0PR02CA0127.eurprd02.prod.outlook.com (2603:10a6:20b:28c::24)
 by DU0PR08MB9936.eurprd08.prod.outlook.com (2603:10a6:10:400::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:30:25 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:28c:cafe::31) by AM0PR02CA0127.outlook.office365.com
 (2603:10a6:20b:28c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 09:30:25 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Tue, 16 Dec 2025 09:30:25 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU0PR08MB9936.eurprd08.prod.outlook.com (2603:10a6:10:400::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:29:21 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 09:29:21 +0000
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
X-Inumbo-ID: dc23acc0-da61-11f0-b15b-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qHzo3AsXP4hVWgWG5mosbCqVw8WTd4JzJTl6DNzIA5aKZ1Y34aYPCsZ26aRH4CN4wj3K++vkPMjvUl6yHAriofsBFR0rpyQ2oBlogVKf5D+WKKRuZLDY0RSEPCiooz9zhcmZhRw6y2n0jkm5G5JgEfRQpiNbmMHmvq2iemGGrEhjf1k2gB9OZ7VtSjIu3XIpnfys4Xn++y0SoXMycMOodGZyUuxWlVWztzrFkUn/xneBAggBuE86qVc6I3pUkMWklf2ZEj28q97YJ1sghLAaSXDj+CKSFHoaKnRoF53KbIeVr14dLP0PSPIRCfgbBr5k/n70WivtB/k6J/oYQY3yXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSlHZH+vS7UzWlI+EqG1o8eEAyY7aZm/bknkgNVQPyQ=;
 b=I6Qk/KWNrI3+Czppu9tXi6oaESKnMCMOShkJHTHbxroUaEUYbc5XbJT8AWn9VYArx6B7J2sqn0z9H/9C+ZrtBQkk2EZ9nRz5pKvqVX8georlOW7Fb4F5KbgynifAMbbrSDStdJTEa14pU1+oA+Wapn6hpfxumDBj2PcYLQe0xMnOfnpFC6R5L669n2Xj1ZK6zeFY1hu+8r/ZFiZETgOP7F9nPpAGhX2aZsWlUn9FHGvc5QJybZFCuZXWeYnIMCV6ySe7ySMmDHdOBUj23o3T7Aruod3ecO20PWVonjm7q2C+f6G/g8I5NtF6RPr4pxztMrBxjoMZGjv6pbvRzQT1CQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSlHZH+vS7UzWlI+EqG1o8eEAyY7aZm/bknkgNVQPyQ=;
 b=RUNT4xWsE7jLK6oZUtzuEFs982vJJVf23xFIUQuTRsWqQL0j9k4HnvkSA59ao4M+yWHVZEaW2FKMKP4k+/2LHh1wbuRa9iAhXiiMowX6BzcUm6+9lzxkNh9ali3wBlcIn4nKSytoRQd0UBiEWCvvjHeK0AZuCLbIo3wWV6bHRCA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBG/lWKKUX4EFlmh1q6Bb6PqBwp73vKsdyrHuc37c9RQgO0xq4gEVYq9kNBrDCuQHCZXU2W5DVK5WKb3LLRNO/a8etOzjm/oUE83VdUXzM07omr8lnAQguH6PdeVgrh4OCePS7iQwFxYIg/70ZWTDKQQAG2b6p0bkSR5oV363ism8DeEltUN47ieZ39SucEYAAk/S3Gi7OvsZ+PPmZA0OUU051FNweShe5vdPWwqOl40LdaUmTPWEJG6/ehbmXR8lkv8AO6QBly2qpLLPL823OOfmwYH/kUuy3g8E3FUB/B7AYnAHnY0jEDawEn96k/bX+bN6iiRspclJly1JoFgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSlHZH+vS7UzWlI+EqG1o8eEAyY7aZm/bknkgNVQPyQ=;
 b=zR0UvaCRRKkpJNKTSNmccvQ7n3auh7A+Tj2RamQUKLXVaErcCt1e5oMN3f2qfY24RKlpCRrWR0vOaDtx5sCGHliGCP+lcvnWY6bPpQQGX4KW3RVGuNRQC4RQ8xvPTmysePBmfy6xr41nnyLcS/LAw6OJlwnLvfWCY9RtePbyyvUS9nUmFl79T0GvPlzVqRhkCcXJNLO73bij5EAcIl0Mf1lUueO2k+pA/RPpXhfxfE0y3Es5LhKlBEWjmE0sZoKtWzf4IcZSgBRunlJHW9+EC9zeBTKTaTOJBiaRUNduFqRvf7nPapnWCf/5rPtiDEoze+pbrWq2GL6JCk26uDqi+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSlHZH+vS7UzWlI+EqG1o8eEAyY7aZm/bknkgNVQPyQ=;
 b=RUNT4xWsE7jLK6oZUtzuEFs982vJJVf23xFIUQuTRsWqQL0j9k4HnvkSA59ao4M+yWHVZEaW2FKMKP4k+/2LHh1wbuRa9iAhXiiMowX6BzcUm6+9lzxkNh9ali3wBlcIn4nKSytoRQd0UBiEWCvvjHeK0AZuCLbIo3wWV6bHRCA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH 6/6] arm/mpu: Map domain page in AArch64 MPU systems
Thread-Topic: [PATCH 6/6] arm/mpu: Map domain page in AArch64 MPU systems
Thread-Index: AQHcbm4YR0/90zis5Uafj3gh5AdGL7Uj/+kA
Date: Tue, 16 Dec 2025 09:29:21 +0000
Message-ID: <CC6759B6-0341-4E8E-A038-7B50B22FFD89@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
 <20251128095859.11264-7-harry.ramsey@arm.com>
 <4c3f8be6-2525-4387-9dc4-b5dfdbf41a77@amd.com>
In-Reply-To: <4c3f8be6-2525-4387-9dc4-b5dfdbf41a77@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU0PR08MB9936:EE_|AM1PEPF000252DA:EE_|DU0PR08MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: a2840836-5ea5-43cd-2d03-08de3c85be4e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?OyU2qOD11d9z12FfG0bxlPG9BCF5+DFNO6ZUg1p14rr3kP1seOhf1GsUY9fC?=
 =?us-ascii?Q?vp+pxRS6g6Suq94z6EyhiOko6OTlPeoWRU9fEQ0YibMQWWafjf7N2Uq7F7kq?=
 =?us-ascii?Q?uzhWHmCNN/xO1Q1bzwvflS0y7T35HxYer1kJWlCylqDgyCYIsDdJSnCh5ELD?=
 =?us-ascii?Q?EmWiKFi83M8uJmmKN80qCoSXMPacLxX6OLllTX9qc2NGki6gFNSi3o4Fnlmn?=
 =?us-ascii?Q?Vmd8HDW4fho23ngoNPXy/jINxenSlTdTAVqXlTjIuD3sto4Ly40fL44CWDPf?=
 =?us-ascii?Q?MSPIU8XDOvPgsOdZNsvRS2VImgeK3JGic2MKhthiSlX9scUFgEaAFQ3JkEMX?=
 =?us-ascii?Q?Lq8lNtO+bcaxDxbecv6P7dxcu2LJ6oR4L3EPz2aUvUwQRkafEGFgRdqVsRRH?=
 =?us-ascii?Q?PFi9aRutJJ21IFd7cBKZZQ3PKUA76hc/P2egG3evyGxQcPuglrWMzzr0v4Ph?=
 =?us-ascii?Q?BWHkTvL6qRTqIvvOh1FDgP5xdCPRt9gvxZfS9Kz/jCEEwd3PqAr4qv+n288g?=
 =?us-ascii?Q?iMG20tMlippvNgRckp5q/FixBjqRQEG+wNaxnOyYJwMFrEqxjQ/g4/42ST69?=
 =?us-ascii?Q?CJ4gztGMdiv8b5KEXFr9xykM7aYvTRJjmVkuwURWyJkHnpri0J2D5Scaxq/s?=
 =?us-ascii?Q?lxru+OygOHUphPQd7QasQxcNIEueB2zYnjl2v2kWSfAuAy6/bjzVEl2p4yRx?=
 =?us-ascii?Q?4uLvIbbmMHRcS3R5cpew7rvfy0eFd4p1fitJ3T4fSnF0SEdS314rLE3bOVBB?=
 =?us-ascii?Q?rfjOTT1SUA+0QY1ZRMsyPEeVj09YZDvCE0/h+D5PLeomDqieMjeAMIBB5C4U?=
 =?us-ascii?Q?+uhmxxhRjvwSy8hjYSjexMeKcY12T6g2ZVXdXyo/v9IZo6uFPF9MImtofGc9?=
 =?us-ascii?Q?K+7BloQYGjMitShd1q1USWZTnT4lP/LrCktWs4a7Ubm1Y5vl7Lmp8TlyIu9R?=
 =?us-ascii?Q?W4mjUKMjT8m4SqUjNMdoCvI3hqzArbWZ28r5Df/E1nbiKxqz9IFk+0OKh1oS?=
 =?us-ascii?Q?j834IFJKDn8ZzhdHQrSW7+fDSloYU1EbLicLXnHrroQqAwOAqYm/N6iyTOyM?=
 =?us-ascii?Q?F9W76YwCuDbUDB717yIL35kA3q7TEL7hEwXgd9XHAxRWz9C39SvzCk3WNMsZ?=
 =?us-ascii?Q?/4oC0ucsxeFW2krQOmF1svmujgALELEp5LNs+N1Ij1FSHMuwaHGmFJD3fbZD?=
 =?us-ascii?Q?ny47nQ4MbMeJiE2669F+oYvveLaJSOQZx7R5rebch8KTGuPKb/WD+L6NNqcC?=
 =?us-ascii?Q?30TVa3xtLRi7T0qnLjbl8UfaGTIccJnw0PQrOLVAdglhl4Y6EFqBqtWujijT?=
 =?us-ascii?Q?daVbEsv3/h42SqfcvTNGgXjeo8ZWvUhz0PEJUbE/mzv4LITGbwsK9pBcZeIC?=
 =?us-ascii?Q?4KDvL1nBeTQ3UI16hUOkdBsXEgx0Xv6jKs4dE651nghi6ESLu/6DYjns4CtU?=
 =?us-ascii?Q?28zlh/s1DpnaFEqy4A5ib8KR9gr4NOQwxvNwVld3taqebuZUeHk9O9BM4RXr?=
 =?us-ascii?Q?060HvAful1tJbkkDphzTe1CiKOwUlIyl3KC3?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C04EEDFD17E3B84FB820892A192D36F3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9936
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	06162555-a1d5-4523-269b-08de3c8597fd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+d4SHMrfIBO0oARBU+JmD8MJHzMpPbFPMy0hOG00tl1JhjqxDd5XczhvN1Aw?=
 =?us-ascii?Q?N2t+Z3fHNsnhNisw2yNOm5BzbVdtPxv/VKbWr3bmiHWG2mhp7fgqh40hzWwi?=
 =?us-ascii?Q?IAH/VS3wQTV/rJ4kH+14Ijlqvyq4xNRwaFA0yD1GPOT7oq8PVJfchZ1TpDU8?=
 =?us-ascii?Q?of2u2/l01K6c7f8YFMLD15hSC9dIAb4v6ACrhOkFkS90QLXDgR1SW7TeDd/P?=
 =?us-ascii?Q?NlKVL4YGmDonFdfvgrQbtRbm8SvWPXQH2cwR/rhPttntk31vnhs5Hz8ACVNN?=
 =?us-ascii?Q?ZaEWIVZRJT29oNfdrfpcf6Ce3wvejOOecT7eJWfhzVoAuRe7m7yFKJNhKWyq?=
 =?us-ascii?Q?zeQ6ENiFmt/3GKFS6Yx90+BCuWGb/0HVBzTXJHuZmmwvOt4EPV2/GOME5Dwl?=
 =?us-ascii?Q?hrIsAXrPh2Odaei7S1kDTsFxtP1/7gaNqwgjoMxPq7T5CQdeOW5UlyZmbAAU?=
 =?us-ascii?Q?KB8ckIJXYyPLiRH9ypkyEZKlUbrQ0HVkUlYL7/j13quBrPH+rZtTeaz9zszd?=
 =?us-ascii?Q?J18bAOprpi0u41mjoKrE9HnqnhSqqS/UFuwHJiMhhVaG7V6I45J2/tweksWB?=
 =?us-ascii?Q?Bszi0fI6zrHuCZ9lRFE+9ul9dI3PU1Lvg/wUY06elnohfxY3rKCqIMr+uItM?=
 =?us-ascii?Q?4tcI2WgtDztehxkUmR5c8hSUYLM3eluw49t5o2bCebBq9jJCqkLlu9DXQApz?=
 =?us-ascii?Q?G2ahDf1E2yHRp2aFeFOzOre+Sg9o3NndEv2mhV3OTAzRl70Z6AhZuRX8ORnV?=
 =?us-ascii?Q?T4mmbEdIkzJ0YoQqtJEGHwC0icccMQscUeu8ADG9/ed8/QGS76Pjp93GEqrX?=
 =?us-ascii?Q?3qHJKjwyHInhTHbEeU5RB4oYFkod5xggkavUXD3i7Sv2K/b3L7ZCzMPO+zI2?=
 =?us-ascii?Q?SaSgNATR9e4HMJ0i8iJshTMNM1nxF01GfW/p3Z0VPY7mteviCwW7hprlH0J7?=
 =?us-ascii?Q?/hZxTF5dnq0HQH7GxoXmjhf5VmiRZnB89rMfGlxY1wyp30JkjXZ4B1CM9AcT?=
 =?us-ascii?Q?7IHqOXTFyMabr5NVFt9RGxoHcLS3MIJi8VVuIUlG15lm6iP3bhyIuC8HrcgT?=
 =?us-ascii?Q?R1vmASmldEcpZbyxYTFx07SPcy5p1rrhbpBuU56xp66P9oHAA52Vu71dS2a5?=
 =?us-ascii?Q?aeccx7NBfCjaASZWb/hlgJPgx7heHYpKTf+r/EM5RvcPPUGyv4z/zJ8g3c8V?=
 =?us-ascii?Q?3FUhr33SnKaEka/GO8utOwl6+jOyMuEFCgNeBMY6rf2KQ2ccLrXMBLGR7bZb?=
 =?us-ascii?Q?gt2rCIg2tKRMm1ZG7Mpq0sC+5oFv/HDpMbPqgjeSJsIZ9jU2yiEHI7BFcT/s?=
 =?us-ascii?Q?PJi4h9MVOYp/mej+cLysXR9gRdwwx9JgizESomH0dB31B2sdxOrhS9zNUnX6?=
 =?us-ascii?Q?hcbWdUvXqwHHmdebOCS8v3iddpIiIzV6GE/JDCaPV75WaNTOr9El5amrpLfm?=
 =?us-ascii?Q?G0aNg80I2Uoppfk4BUKRr/x6G45D++3fPwhBg0HCjOpm/y9+rfHKCd4yYLv/?=
 =?us-ascii?Q?tFnoQab2xhpcvlTjZ2nsVf4lz8SkshXgXt0ER/vn1KjxNo1y14JHL4SoZMPM?=
 =?us-ascii?Q?WREFEHpX5GIFm3Zsdzo=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:30:25.3357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2840836-5ea5-43cd-2d03-08de3c85be4e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9936

Hi Michael,

> On 16 Dec 2025, at 09:26, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>=20
>=20
>=20
> On 28/11/2025 10:58, Harry Ramsey wrote:
>> From: Penny Zheng <Penny.Zheng@arm.com>
>>=20
>> In MPU systems, we implement map_domain_page()/unmap_domain_page()
>> through mapping the domain page with a MPU region on demand.
> What prevents you from implementing the remaining few helpers?

Only the fact that they are not used at this stage, otherwise we would have=
 seen
a panic while running Linux.

Cheers,
Luca


