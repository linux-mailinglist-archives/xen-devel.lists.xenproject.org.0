Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE50B11838
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057145.1425053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBfz-0006Y5-5m; Fri, 25 Jul 2025 06:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057145.1425053; Fri, 25 Jul 2025 06:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBfz-0006Vc-2a; Fri, 25 Jul 2025 06:13:03 +0000
Received: by outflank-mailman (input) for mailman id 1057145;
 Fri, 25 Jul 2025 06:13:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fuZF=2G=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ufBfx-0006VH-Dy
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:13:01 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66b3b25a-691e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:12:54 +0200 (CEST)
Received: from PA7P264CA0102.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:348::7)
 by GVXPR08MB10639.eurprd08.prod.outlook.com (2603:10a6:150:14d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 06:12:47 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:102:348:cafe::b9) by PA7P264CA0102.outlook.office365.com
 (2603:10a6:102:348::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 06:12:47 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Fri, 25 Jul 2025 06:12:46 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AM8PR08MB5746.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 06:12:13 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%2]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 06:12:13 +0000
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
X-Inumbo-ID: 66b3b25a-691e-11f0-b895-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kWfVD9vYcJWYVb+ufGVWvdU7NeuP01PW5C/2ktaNUVy5Sj4aEZz9i7VcA7wYRtjUlwXSgdx4mtjUq86KixXKUFDNuS5ac9y6so5jD5xrltuui3UjWs9AhIk7OVYLAF8YPvckzV+WO02zFPX1zla/D3Do0P5wjv6W9aHhGlAF6tT6yV4cvfTCXQJPakNTSRVgHnSK4qP+6n8/tgE4enL+1J8BbPFRBJu0KUxY4R88yhE178V86hAy5xiIvEz/dJoQljKgevVrSuAzaxgDZX1To2ytRzg8xO5txSeBDFJygnasEg9hsF4nmx10VfhvU732i9arlX7A9gIQwRxrvsv/+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=falzG9wCgrZY9GMPGPMooEvy6Ohut7ooSEVIzzYoNyg=;
 b=UL4uDtnEVsio/DZ1xnwVrIvOb5Zq3mseq+rV0RUliIjhmsvK5rKC2nhID0u2a+3Giar4s9EPjB29uPDmtisC3WWLHQdT5S1C2KQG6fcVn5mp3nml0iLohFGp5mtrifSRej1Zrbw/fsy+DW2/qzzkPM6+KPV1Cm+9n3RQW8bqX3wwyzcouwk0VpqFN1ZVmt5dE7Y5F2cY2dD7gmeyTr0K5ypG7bZGXXq8WZ8YYbDXY5dLGXeO/vk9XRCukIorYIBEn3GD7gn34JQfxzX6AuPsspKcnUaHW6ZylEKwKD686jH/DaCzoyib/fhBshIvTVlPrzf6l/gedvg9nvAD/h/wpQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=falzG9wCgrZY9GMPGPMooEvy6Ohut7ooSEVIzzYoNyg=;
 b=OjwZbhgBlgd02gxeewXVZ+6/D9kwHf9OyiVTVFaFtfvxgIkKLqr8EmqGT7eEv3pUN77n3yNibbOtX6zE+e7yvpU4opgeM6taOmh9fSf1Cqr/y3DOI2+Z/SloNbDTRm6Pqih4U0cPS1pNv3hlwfgjpEQK2OifpVnk50RooWMLXvA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvcmVn7qhjtFjlbKF3ExqYHbAbkj99nFb875I/S/Mfs2E1e8WrQGCD06DzeK5ECKSVa7r+JTBMyseiB9HeFyJdO7+N8CKns9eOZgBYsv/sUg4PTfzUb0uuIcKp2kdZgy/SFeTnSkKnQYHiuNk/9ZisLeKgUbCXg+ahsB3W92HGAkTfJtDl8KrqV7K3R0kAjOW3OxRjKWE62t03hTo7Mgnxyv4TGA257VZmhWTk8QciIKAoGFIhPkiviHvk0YrE6O3M7Avhd9il6gDLQesClds4QSkY2ss/aKk5N5ClUOXvAjiCrZIAvqIvwN+/E+usZgtdFmwFzDYbmno8X6LVkrxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=falzG9wCgrZY9GMPGPMooEvy6Ohut7ooSEVIzzYoNyg=;
 b=cqfJrz6BH7ZFss8cvPrX5Rpc7vUnjERrMTmRHt+A9wpYIXIIgM/foTlfq12IKMwaUfV7agUc1nZGaByvxEufG0Z+v/o9+k9S4XvTu+RSHZ8mEVbj7GZNFpePJJc+d9c/YyBSgykyDX7DtqDC6wv+O4AK02YAh4kSz/tXDs+j19f2DOM/eg3w7hlUn3v1UqzOdnuxw3tE26MRuONtffhoE+du13JlvQgWtJGh9jd9zMHGcjffk/vd6d5atf5yXNk8Fn2VogIPACaUFvsdVW3IE4XfziGthnHBcNa5Ry1AAgAE3ghKzkF8yMeYaTBiXDbW/Ngf9bny4+QB32pYrSnb4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=falzG9wCgrZY9GMPGPMooEvy6Ohut7ooSEVIzzYoNyg=;
 b=OjwZbhgBlgd02gxeewXVZ+6/D9kwHf9OyiVTVFaFtfvxgIkKLqr8EmqGT7eEv3pUN77n3yNibbOtX6zE+e7yvpU4opgeM6taOmh9fSf1Cqr/y3DOI2+Z/SloNbDTRm6Pqih4U0cPS1pNv3hlwfgjpEQK2OifpVnk50RooWMLXvA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stewart Hildebrand <Stewart.Hildebrand@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm: smmuv3: fix UB during deassign
Thread-Topic: [PATCH 1/2] xen/arm: smmuv3: fix UB during deassign
Thread-Index: AQHb/CTBUeABU74FEkyJ7zHVeZJ647RCXcqA
Date: Fri, 25 Jul 2025 06:12:13 +0000
Message-ID: <C27D448B-F9B1-44B0-B2FD-7EED70EE0BE6@arm.com>
References: <20250723225422.116387-1-stewart.hildebrand@amd.com>
In-Reply-To: <20250723225422.116387-1-stewart.hildebrand@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AM8PR08MB5746:EE_|AMS1EPF00000040:EE_|GVXPR08MB10639:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e315082-9c59-4b61-a660-08ddcb42467a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?OZNBIpf/RuSJ9kN8VGB1tkQOytiMHmfrOzuOvvFhGuKKXNDu2/69pch2/o5W?=
 =?us-ascii?Q?rRQ8LLp/hAoh3dXdTzDS2f0t/HEsXJNOjzXq/BWM2a0OYPhaqrWPA+0IGc92?=
 =?us-ascii?Q?MW7AunRBbMhtq4YjY1z37dtIAdZapNHlmyTM4o8nO/4HuvWi1ITXjsVKgBt2?=
 =?us-ascii?Q?gTBsiEdGeq0TsSYqfDjbVTHqtG+M+w1N3FfGjXe80g/u4AkF1ur5nTXxYfh6?=
 =?us-ascii?Q?G57VysapHJOLIhTYx+ntq9u4fz/PO2mCWGoRWlH4UFPrU30QwZhZubv15jot?=
 =?us-ascii?Q?7dfowTZVTdD7MXGLZmuvRRFg8A3W+/oYJmqffzoWsbtXtYpgsT/P3TfAFLjd?=
 =?us-ascii?Q?KKre02DV1cx6FIF+c2NOt7q1dckJk3ZbhpS9VB/MSXJPirmvI92Nj/5Lh8xd?=
 =?us-ascii?Q?oVNZd0bOpve9R9D5PlbPQp7KCbkr/MaK5SAQGWEfMQ5p/wZKg49BDQ65norI?=
 =?us-ascii?Q?arJcDSlSBd79AF5fjYohXeHutUcnfC6uOoBtoHZNoSMM0i7wtcHz/pVUY8OH?=
 =?us-ascii?Q?5VJZ6MuCH7p4M2fQemNr2XQioYzILvCIzo3shh+pj5kKdAHra4SBtzfv2U2x?=
 =?us-ascii?Q?mY8qZsuISn3IceXTgB3WOEn3rYIbO1CyQnbECXryGTnf3FVeiU885eNh2Kt9?=
 =?us-ascii?Q?Q/0JERF/echt72PVjaN+jTvKMbOszogbIF8NYtClQw9yoRSoZJZicmBHJY0Y?=
 =?us-ascii?Q?A00SqLF7+GjUkNnCj6qhBPtK5oifeKzhCmr3A2O5K5dkUCEOgcr57/0Ki+FY?=
 =?us-ascii?Q?IJZpRPWjaVxi/FqTYTFsElkku50vCQGQL77bsW24T3A5vSgYk2V/FHDpnyRx?=
 =?us-ascii?Q?4hzVf2M0K1m0M1cA12A1qEhDCaX4Gx/NunCaHthO+yszKW0oTxLJGiJjCnRz?=
 =?us-ascii?Q?zM7FM0KJhVnhhHzx9W7PTc9Cz8tTG7PeIvBlDwL7YVNAjnKFlUw9L6tSXPfD?=
 =?us-ascii?Q?fddjJ9yvgrbjM3ctNjV7+qQCdBjmfn6kSSxsHJ6p9FWG/TP0ggZ2LQB1cgIq?=
 =?us-ascii?Q?lcCfj7YE1V/AXDFRUvy/CyRm2nzwuQjTQh6BjB1ZntFPsyX9A35CW2HW+Jlt?=
 =?us-ascii?Q?jS9YhnlYjGK8z4f3CpwqN/0GqP7SW7X4XmAE7uFZqvksNQa9zYkBpQg18Rw5?=
 =?us-ascii?Q?Mf10tiVvDrvb7iPDTt4XViYlEKu4T2TDVlB4ZwrFpZWMpIn2ZDaxaUvq+vxP?=
 =?us-ascii?Q?gXACFeBrwnukxc9ceJzI/pTi9PNxMXnp+c4moJCmQoaP53Vz67wkzBuH6yDG?=
 =?us-ascii?Q?Ro0noUbhCTqPx90S5vZLT+qTg5UhlhqsuAoZowzXXEWT+fGB8pFj5YDq+lWS?=
 =?us-ascii?Q?3VbC9R2u3ECw1bjL4u8D2RLBV0/Fi9fVDGrik7PgUwYb49ipxPHONOF1vVgB?=
 =?us-ascii?Q?oYYpJru3HsWRc0qVYLy+oI0b1UazZpDAm48KXMN/RNTOj4FfGlXjBC9LuIfL?=
 =?us-ascii?Q?rjn15bS2fAvdiRNZdxzjCDEzHOXCARbko6PS0dtmze0ANUDmdmRCGg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17C7060253844540B01A2007CC73FA10@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5746
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8026d8c8-4d3e-4b56-1846-08ddcb423283
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|36860700013|35042699022|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PlfAZtB/xywlEdOGPm3Hilx0qv40/RM16eyNwqWnoPYRbw5VDZvVaWApH5Py?=
 =?us-ascii?Q?oj7L4fwSHIqh8NqPhBvZQ7QNTXXTNpH1QocEVDuRj4zvlEdiSeESVsa6Cplr?=
 =?us-ascii?Q?S0r4R5zP5Rq465fIlS70pekKeBAmfFqrtMT7oK7WPVaeUDOtE5pEVjaLPvl3?=
 =?us-ascii?Q?LVEndI+fyvud69uR+LvRNrGp221ccfCEoxWZpLtKR0HNacQ1f/BIrJNf683f?=
 =?us-ascii?Q?nxulDQPm/6gs8GcLQLX9fc5TRQZj+Hv3K9ZEKNaDPLLKu+nrLQ6NvRnn6HBB?=
 =?us-ascii?Q?wiWE7FoiwlNZw3Ml0La0CG9jwTgdqFkelGZhevRqk2s8QF87ct4ZTYAuBLyT?=
 =?us-ascii?Q?M3OZUOowqxiYMT3iWnlrA34UORTxc9FWwrMrIcJoG2soi3ny/Z5V36goJqK2?=
 =?us-ascii?Q?MaT5gIUkWwHR3mKL+DzFbtbOCDL+7dw5HLksHDBaAQOXrAnH6ay5dSTyPEeI?=
 =?us-ascii?Q?I0x02XWBWE3JMrlxGj15UUn3UUslx4LCYECqAxVnt1hj2TxMbEHjelU+zatU?=
 =?us-ascii?Q?mwjfx9HExesxMiwntqH/NQnnvJBC3/j5yjzo5HPp1DvuaP6XTARtHgiPDnCg?=
 =?us-ascii?Q?zOPSwHwinUgRjKRiAy7QVSCv5DoLqk3w9+C7f6MDqU5r0VIIA4+b3RvTQLTn?=
 =?us-ascii?Q?Pu2YQ5Z0Eez+OdkV6DhOrZf1pnPCPiXJ9emlyEbuEg87jUa9BpewFt6TtY4n?=
 =?us-ascii?Q?i7n0V4kAmgg+lrLOZiD9R0TTWjuysHU5wd8vYIXE+mJwORV+tkAtUHNxEICu?=
 =?us-ascii?Q?mdfejtZguts+HcNryBDojCmHIUAApAFlu0XNtW5ForSA2Tj1rFUcKyW4cLOD?=
 =?us-ascii?Q?I+DVC4jZI9B/TS0DpKF/02xMSUcT+q+hv+zZD7juXt0v8PhN6E26QWhilC7z?=
 =?us-ascii?Q?yb29R4yCOgLK5xy2Sl4iMgs3hrocBCk/y9yNW4sxzI6wOyut9rmTIYAVqXBl?=
 =?us-ascii?Q?MGUxA1aja+LJDA+BB1CKV3YzQaxmp6zU/uqsq+KWwySXT3Q1RFEPiiq8uMjF?=
 =?us-ascii?Q?/InvmhFPz15wZnzVO9dmZHc2JrK66zrTUExTjekJSGMB6qpHSvuWdvc3risG?=
 =?us-ascii?Q?7TWbOKpo6x/skqcei53r787U4TQGbnjfhQk8TqUw3aMN3Mpu2Uc+em1baG3n?=
 =?us-ascii?Q?KSwSyxBZ2rU2J5/xZAGmOLGFzzZ2Ftk/1w6vg6toSqwaqEE8U2U5WBDsAL7E?=
 =?us-ascii?Q?yuqli/03oEQHxE50t7VTiwVWzRhBKF+J5bkrwonwHGvJ4XJUwJbOL9bTxMMu?=
 =?us-ascii?Q?SGje+gyHpEs0bjE9PCJHlOk9IgchBwV0Q4/6qgtELUS1SR4xjhiLE8+okLAy?=
 =?us-ascii?Q?p3UV5v83IhN6vanm2NaFtnmQ51l+yn/3Nmn2hZ7xZHg6giFKeIWFCVPAbIHJ?=
 =?us-ascii?Q?NGSbLqcddph0DiAIOKCftSEhDI++PfgqNly/i8sLVdsAqMRGNXI5FbWWShxT?=
 =?us-ascii?Q?D+THKMXPuFGFocTNdSgYxJuFv9Wjh7rVfLhyQF8RBwTZpeKZjoXhhwGHWFJz?=
 =?us-ascii?Q?x5PFsSxhE65bpUaMYSXCkUl8fl0ctTg/WwrJ?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(36860700013)(35042699022)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:12:46.6254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e315082-9c59-4b61-a660-08ddcb42467a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10639

Hi,

> On 24 Jul 2025, at 00:54, Stewart Hildebrand <Stewart.Hildebrand@amd.com>=
 wrote:
>=20
> In arm_smmu_deassign_dev(), the return value from to_smmu_domain() is
> NULL-checked. However, the implementation of to_smmu_domain() is a
> container_of lookup, so the return value is unlikely to ever be NULL. In
> case of a NULL argument to to_smmu_domain(), we will attempt to
> dereference the non-NULL return value and encounter undefined behavior
> and a crash:
>=20
> $ xl pci-assignable-remove 00:01.0
> (XEN) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> (XEN) UBSAN: Undefined behaviour in drivers/passthrough/arm/smmu-v3.c:221=
:9
> (XEN) applying non-zero offset ffffffffffffffc0 to null pointer
> (XEN) Xen WARN at common/ubsan/ubsan.c:174
> (XEN) ----[ Xen-4.21-unstable  arm64  debug=3Dy ubsan=3Dy  Tainted:   C  =
  ]----
> ...
> (XEN) Xen call trace:
> (XEN)    [<00000a0000350b2c>] ubsan.c#ubsan_epilogue+0x14/0xf0 (PC)
> (XEN)    [<00000a00003523e0>] __ubsan_handle_pointer_overflow+0x94/0x13c =
(LR)
> (XEN)    [<00000a00003523e0>] __ubsan_handle_pointer_overflow+0x94/0x13c
> (XEN)    [<00000a0000392f9c>] smmu-v3.c#to_smmu_domain+0x3c/0x40
> (XEN)    [<00000a000039e428>] smmu-v3.c#arm_smmu_deassign_dev+0x54/0x43c
> (XEN)    [<00000a00003a0300>] smmu-v3.c#arm_smmu_reassign_dev+0x74/0xc8
> (XEN)    [<00000a00003a7040>] pci.c#deassign_device+0x5fc/0xe0c
> (XEN)    [<00000a00003ade7c>] iommu_do_pci_domctl+0x7b4/0x90c
> (XEN)    [<00000a00003a34c0>] iommu_do_domctl+0x58/0xf4
> (XEN)    [<00000a00002ca66c>] do_domctl+0x2690/0x2a04
> (XEN)    [<00000a0000454d88>] traps.c#do_trap_hypercall+0xcf4/0x15b0
> (XEN)    [<00000a0000458588>] do_trap_guest_sync+0xa88/0xdd8
> (XEN)    [<00000a00003f8480>] entry.o#guest_sync_slowpath+0xa8/0xd8
> (XEN)
> (XEN) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> (XEN) Data Abort Trap. Syndrome=3D0x4
> (XEN) Walking Hypervisor VA 0xfffffffffffffff8 on CPU1 via TTBR 0x0000000=
0406d0000
> (XEN) 0TH[0x1ff] =3D 0x0
> (XEN) CPU1: Unexpected Trap: Data Abort
> (XEN) ----[ Xen-4.21-unstable  arm64  debug=3Dy ubsan=3Dy  Tainted:   C  =
  ]----
> ...
> (XEN) Xen call trace:
> (XEN)    [<00000a000039e494>] smmu-v3.c#arm_smmu_deassign_dev+0xc0/0x43c =
(PC)
> (XEN)    [<00000a000039e428>] smmu-v3.c#arm_smmu_deassign_dev+0x54/0x43c =
(LR)
> (XEN)    [<00000a00003a0300>] smmu-v3.c#arm_smmu_reassign_dev+0x74/0xc8
> (XEN)    [<00000a00003a7040>] pci.c#deassign_device+0x5fc/0xe0c
> (XEN)    [<00000a00003ade7c>] iommu_do_pci_domctl+0x7b4/0x90c
> (XEN)    [<00000a00003a34c0>] iommu_do_domctl+0x58/0xf4
> (XEN)    [<00000a00002ca66c>] do_domctl+0x2690/0x2a04
> (XEN)    [<00000a0000454d88>] traps.c#do_trap_hypercall+0xcf4/0x15b0
> (XEN)    [<00000a0000458588>] do_trap_guest_sync+0xa88/0xdd8
> (XEN)    [<00000a00003f8480>] entry.o#guest_sync_slowpath+0xa8/0xd8
>=20
> Fix by changing to_smmu_domain() to return NULL in case of a NULL
> argument.
>=20
> Fixes: 452ddbe3592b ("xen/arm: smmuv3: Add support for SMMUv3 driver")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Sounds good to me:
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> I'm unsure if that's the right Fixes: tag since I'm not sure if it can
> be triggered prior to 63919fc4d1ca ("xen/arm: smmuv3: Add PCI devices
> support for SMMUv3").
> ---
> xen/drivers/passthrough/arm/smmu-v3.c | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 58f3331520df..db08d3c04269 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -218,6 +218,9 @@ static struct arm_smmu_option_prop arm_smmu_options[]=
 =3D {
>=20
> static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
> {
> + if ( !dom )
> + return NULL;
> +
> return container_of(dom, struct arm_smmu_domain, domain);
> }
>=20
>=20
> base-commit: 5c798ac8854af3528a78ca5a622c9ea68399809b
> --=20
> 2.50.1
>=20


