Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PGFMvxVg2mJlQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 15:21:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCB9E6FF4
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 15:21:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220575.1529242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vndlC-0007Sr-Rn; Wed, 04 Feb 2026 14:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220575.1529242; Wed, 04 Feb 2026 14:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vndlC-0007QS-OC; Wed, 04 Feb 2026 14:21:38 +0000
Received: by outflank-mailman (input) for mailman id 1220575;
 Wed, 04 Feb 2026 14:21:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=THT1=AI=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vndlA-0007QI-I4
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 14:21:36 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccd8bb0f-01d4-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 15:21:30 +0100 (CET)
Received: from AS4PR10CA0019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::19)
 by AS2PR08MB8805.eurprd08.prod.outlook.com (2603:10a6:20b:5f5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 14:21:26 +0000
Received: from AM4PEPF00027A61.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::16) by AS4PR10CA0019.outlook.office365.com
 (2603:10a6:20b:5d8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Wed,
 4 Feb 2026 14:21:27 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A61.mail.protection.outlook.com (10.167.16.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 14:21:25 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAVPR08MB9082.eurprd08.prod.outlook.com (2603:10a6:102:32f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 14:20:22 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 14:20:22 +0000
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
X-Inumbo-ID: ccd8bb0f-01d4-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=T+pX1/FmwF55burFzIY1V5xB/qmEB/hs7+t3EO3qX1gOmnn0k9Mn9Cz1t0ujM5HIvvA/5WFjvaEHVhEKUr2R7Rji7Jqi2MX9hGDWL3T6BJjg8THnzKeoFNMKixvPE6uvQJCQyHNBfWKOMP0gBMAy4vHfka+eRWpK66kA/OdjIT4KQhI0kBBeQ12OzHzDm7L0TTTJLWf70mX4RONcdCnaOs1FD9Dl8iJV1i+roVjJPnS12Hs4+SS81PlZ52GkpBGVf0Fdd06/enn8v3osW4LzGuQfNMABVfgTMVFzhIGcP+MgWNP4n+6/cM4NbgsFVXFsoWXKzBuzdoL8pA0tzOcOIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3TgfEc++SekQkuUGacyFfqTZV6P4qcYaQamkIVbr+M=;
 b=R2oNqKrIKdJdg7OWfwjeRH9v6X3uJ9z3V1GFx/xdDEhRGr7ZzJ4Sjuf9n5bLLruzlAXaJLZ5VYlZe3ZyfmwIhocX7Qe/cgjmy++WYA1x40r0OhulSY869m2qZfIOetmcMbkVdyJRV7zRwOfpcOYmHrYmAhdrgbMqWFUqhKcxY8eekd92dsRKQp+i/H8D1LwDigPqDVaFZuvvF9Fu+nQOTFsBLs86H0xPinstSif9gessJLkjVO372IMm4FlCiwQ8/lgZizUM59qTXp9D48u1MkablJZ4U+9FyEWwHpiwWFOjdYSQ51lHQqFFyh8zAn8emNQTjD4jAuJkuPH7CxfhAA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3TgfEc++SekQkuUGacyFfqTZV6P4qcYaQamkIVbr+M=;
 b=N+y6/SDvlEnqXEQRpl9yl+//xrSPUknw/cLxk95bqpQSxwyvWzIObj/evT8JTpwBPLCXYu79kmFmstCCE5K8sgXzCuxeBFDKjUM62Qt0OlBhY5swKHtpjMKMXJL+GE4oRLrs1+3b+xKRnyRvM66ljFPq7xJ/T/xeTO9UZft9RiQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFjRKXqsMkafHKMwUVsbvsomO/vMELicAup2durjUafM13RWjbI08juGALzAE6B7Gkyj5Q5yfnTgDsJbuk2UVD6yCgngg6gL0f2kYS7MjYoKys+JgnyvuaQkCmSPtPBbaXo8j3AuVVcdw30BrBbioweJEf+UgX6P53GhrrSjCr3riFs3mQmHMdL2xlRi/RfzmBAjR35uYEo1I/D0cDOjk5a+z8aQuzxQSbSggtQ9ZkhfSz77I4Aj+n/FLEFCFkal0fJz1PDvfEXVLCb1SvxpZgd0elGM57hoFl0b1Xz2fVkHIH3JCKRVpftYR+nQeTx0K84rUIASGll8giKjH4uTNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3TgfEc++SekQkuUGacyFfqTZV6P4qcYaQamkIVbr+M=;
 b=Xr2G7yrVj+so+PfG1VBIk1BRhXZh7drKmt6EX80yuXLHj2m7vt5Ub+LHDQOfSaJ+bng7VPXP6z9BgsvACP390SYuOfeRvh3SMqPe50zUyHh3CWTZ8yNkjuGak3nWUKnDpiyFgawNEUEXtVvCs3xlu66Wu0hrXtXR0u65FdP2MhkiNd0unJsRS2GuVE+4ILC/nyiuwGpvlFv72wswImkxw2HALQH9KVWSCqq9L7tKZYhH9iCQ7ofGy4rIoKljuBsFxbMz78J+/uuZsOVjOfC48FXY/6w/HsIz2gEaYfFwALN5uy07MYvs5RnaFrZBAwuarMGk59P2Pp2CEofwrBnDXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3TgfEc++SekQkuUGacyFfqTZV6P4qcYaQamkIVbr+M=;
 b=N+y6/SDvlEnqXEQRpl9yl+//xrSPUknw/cLxk95bqpQSxwyvWzIObj/evT8JTpwBPLCXYu79kmFmstCCE5K8sgXzCuxeBFDKjUM62Qt0OlBhY5swKHtpjMKMXJL+GE4oRLrs1+3b+xKRnyRvM66ljFPq7xJ/T/xeTO9UZft9RiQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/5] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Topic: [PATCH v5 2/5] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHchGj73A4kTs3O/EWyR3N/eFmlXrVyue0A
Date: Wed, 4 Feb 2026 14:20:22 +0000
Message-ID: <6080438F-DB60-4A50-8264-1CD04761B196@arm.com>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
 <63892f56f227fae75d78e2ef2ee63887e74c523a.1768293759.git.mykyta_poturai@epam.com>
In-Reply-To:
 <63892f56f227fae75d78e2ef2ee63887e74c523a.1768293759.git.mykyta_poturai@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAVPR08MB9082:EE_|AM4PEPF00027A61:EE_|AS2PR08MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d16263e-d0f3-4599-ee80-08de63f8ae0c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?NDctHBbULmDDD6eRP2gotV5LILJnqm2m0VFYsxkwau72HdMLqRxKzUsUevFC?=
 =?us-ascii?Q?IcHX4g+g1gl/qNKfcPJ7Nvv4lyrD7k3mcveZYzH9c9c0IngAvWLVfq1PJYnP?=
 =?us-ascii?Q?N4LVSTX6hkrz0Sws5oR9eaAZkIEz6e8etqTemgNkwTxULdMiBYrpKpOPMwmv?=
 =?us-ascii?Q?EKQUsMceRNd+rZxPe6YZxBNGi9Jv9/+eYWC3URzXir44vqathZ47I0lWvszg?=
 =?us-ascii?Q?5XH0lmSVIi5b0kJ2KwN8vMugrwCNp5dDR4izcSm/ix5ZW5GChhDYv4uVF4PR?=
 =?us-ascii?Q?LbyrDW61DPeJzU2ws8qXh718QNR2dAL1aPe/PQi9D+uGPq8pUbcCHkT2qvx1?=
 =?us-ascii?Q?JSEP43JRVIR/pXkFzO4BsDyea1ycPd82aeV4qADB1MgrUJK1KWpgZpLnf1F6?=
 =?us-ascii?Q?vI7zMsOE0iHTsbIEVfPXpIhxZqb+bu6hKdQCPhBkhdTsjV+LDXPNevo0MMNA?=
 =?us-ascii?Q?tX3EW28k5tTRmVnrVqqfv27A1OnXuzabe54IJMcTw4ks+HzoFflkC14HcoDl?=
 =?us-ascii?Q?p+w2W5cObHwy9l9NItUg+KWR2MEtj22CLSWsIGM56DS1dbg7jNYVyS7s/o7Y?=
 =?us-ascii?Q?V3rx8iIF9XcyTF1JLziqCsVKziJNKm60TrDsNy3GplWJhNC2uDFajRQpNSla?=
 =?us-ascii?Q?2p4k1Cw9JpwCLywVLLVfS6PUpz5zQDokLl6ATRyF5gIIWkn0MTnlkZX/t5gf?=
 =?us-ascii?Q?w7ysgO2Jp+BoOe1mlt/QKrMDxV3hprmQNnO2yvlREX+f2JA/kkVgooyf3OcA?=
 =?us-ascii?Q?FynTP30OlIUmhyDXeBs3L4/rP1OQnqdjGFJ/tFtJI+qcqHHz8Tr8by0FZ9ku?=
 =?us-ascii?Q?zSuLdMWXWaxlptdqcQuiK8jwP3um29HaCztvboDTfaYBUIz1avffaRD+k7h8?=
 =?us-ascii?Q?EeKiIuPSHSlKB0JUQLBiLjdJBC2OlKMn3w1WvZsbKAvYBJ2JZPtm9fQytG/+?=
 =?us-ascii?Q?EJRZdDNUEiPguQ4jWo3cq/k99KD6/Jyke7ag+2jzm7FZhXhjIwIzn7mjlWuA?=
 =?us-ascii?Q?aH4ImRltQdlzqYX6AuWhx/2ft4grH2YI8VHpQNNzjcYv/sy+dAP/Xz7c5fcL?=
 =?us-ascii?Q?GtDXvy+zSi+HwaoLv5eOtlhHhx/CZ0DqCDAzoSXgqt75n3PQi03aJR8zvh+y?=
 =?us-ascii?Q?mDj3sprHZkodlHQUolK5ju65ohMD2Ke6gYwvASIzGBMsVveg/5EkOiDRpql+?=
 =?us-ascii?Q?NOM28ddak5BD6VmH8hgSrGFeK5oXiGCZLDjI+sraJ9HcVOCu6TUOljo5meqh?=
 =?us-ascii?Q?5LsCkzFAc80k4RXI1SMGH/P2A9QZ/DIy6N50N8gVAyrBN76h/oNR5qKAtYy7?=
 =?us-ascii?Q?+KD7JoxRS9OeLQx/VK9xN2QM92Z4XQCi0KS73ReUvaYnJhMVDzdodo2neH8A?=
 =?us-ascii?Q?wXEJtgJIpyjL7885yyltJiF9S1JBsDwqMcw7+H/1jVSoeBBJisjSkwA+2HCJ?=
 =?us-ascii?Q?jEMWysPbvV/+BsP4LOXKfpagk8dNZjQ0H3jxYLFUFktKuAus9kHqfMhbpJuR?=
 =?us-ascii?Q?ruX6lpyTE89NP22bRwdEesKINj0zoWuGH4qrgYZVIibGaemGI1wq4T24AeSW?=
 =?us-ascii?Q?Xlv1Fdoe7H8X0PNL+T8+Xa21o5Bmp9TtwaLiTPUZ1QRL6Clb4PSlln/Chgkp?=
 =?us-ascii?Q?OlgiWQbfx6ZdRXxcbhbrfLo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0C38E0A5252EEF45B00E9E2CBE1B1882@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9082
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8c236a60-0a93-4913-f19b-08de63f8889d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|14060799003|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iKc6TZv209q0HZ4Kq2nphS0/WnCnjZjIB8Qxoim6aIRFuCnhW4tbsF6PsZRv?=
 =?us-ascii?Q?PAtKVt/f4zoq2JBA6r4lmMvi081I9IMJZHoUP06GF3+9iVSYHlvjC+NGGybR?=
 =?us-ascii?Q?obodMVUZL6poQZKcYm4m7TeBCg5AHJHPoKngTErZlCVpWLpEZYpX/MEi3SJ9?=
 =?us-ascii?Q?mLbdMl4O57P85tYBxL9pJuufr+36g2U1Rj6avQtpOyvAEQz4dIy7m89m2Xhc?=
 =?us-ascii?Q?ZxC/qBhVxSSU4Vnr1+t7LuXBwgALvRS8FvsIOaYJt0sKuyoqCEqn9G+GIZZL?=
 =?us-ascii?Q?ep6PXlV0T2PM1PPPEnm/5/bWCkPcRxGHUmEw0O9JFqMB/AshzA/t5Rfau4Wl?=
 =?us-ascii?Q?1HxywntekqTB8wbcWhp+UPfZwhdGD7ycG6at9YOlBa+ns9tIkyu1xhXTStOU?=
 =?us-ascii?Q?M+CRNgPkqos9tUcp0JL0MbVBG09bJM9TOianEIAQd4rLzSOhhLN5q6+W88zD?=
 =?us-ascii?Q?BiOhP5ec4//apMM2BgkqzGKURSlHjCknsxtC+evThIM+SxQTptHZ52HSyj3V?=
 =?us-ascii?Q?AOGxBl8lbUYinH6DpUIxR2FvN15lVR1zLWtFhQFsgSIxGzDcCgASngo1gx/f?=
 =?us-ascii?Q?DADOPhDpxmerqYr2vIAUZlpUTH8lsxmc+XoDR7uuBbMrOeMpGIlGfomICum6?=
 =?us-ascii?Q?xGn5k6G2AxFmCoDRNgNRnqCRW7iN5XAyMa3h/SPTZRP2Z+K8F8mlZZ6i3FfA?=
 =?us-ascii?Q?bAsxYOSn1Z3Iysr/ochkIKTCAhOgsYvt7LUpP3zx4SXS7AX7pAxYIJZpMufk?=
 =?us-ascii?Q?CYArYEoutMm4zLMXwN1+/8toqRPirf3dk8ivny7HOKDsn17IgFzcu8y7iXMD?=
 =?us-ascii?Q?1BZF6XwtRWwffz3B7gYRX+Jh0tAGVH7GwoZxz1of7/TlQ5AownddTOPPKyq3?=
 =?us-ascii?Q?o40XbE8ZfK1qbGHIY6a5B7ZNUT8CvTnROaBjOuZ8x8R6YywgtKbTLusfxGCY?=
 =?us-ascii?Q?iES4HCqQJcd7fOKg9SKQ025hQ6OABkqIO3hecmPulOqIEHRXRSl+Yz80h2ZE?=
 =?us-ascii?Q?gQ5tu4FOdIPRt4rZZq1D49SkWuUOokq6+dx2rRmTpEjz8JEDTxX4PlNA7AY6?=
 =?us-ascii?Q?vKZVD76subnA8bu79kpcHbgC0+3Ry7RpnTz0KWjFW8Jim0ynYSDbZ5Z8Q/X4?=
 =?us-ascii?Q?W5d2ijAyBEb7UBr6gnfD2WRv1baJTXKPQgbWXRAYP0ALXvUKVwnWKcCiWVQ8?=
 =?us-ascii?Q?jklAVWLPlSmrCh+qdXHf/x8m8MNsAB+YMgSTUbsmdG1vg/SqsP8gPrq5qVr2?=
 =?us-ascii?Q?i1ZCFbL3vAhCDPw5tCS/9M9GZyQ21haqY/Gu+y3Iud4AOfhss3uevzyol2fB?=
 =?us-ascii?Q?r5guT+VYlnsezwKdiBUQBmyrZ+QnFzBj7/bp0EZhSDYJB8+RgSSB4AnEjXAk?=
 =?us-ascii?Q?4thFJSrw7ds1uRp0sS6Za8dRPP2OTyA04+ECO40VaYC+fGPlt4N+zBsEX0K1?=
 =?us-ascii?Q?Gyo84FanP2yYxni/7crI+W3giyNDhh867yq4mXHdKWTTuOj5Vs+pHlUJSksy?=
 =?us-ascii?Q?z5gir5npJwzVRlyfSeGq+o2RCMh2+TQifod83lYakl8g1VyAxd2vT4ucYCGm?=
 =?us-ascii?Q?u439UfoKuGVPUThuqUbWnKSfZcufDdDtMojV41qJOvZCjpP3YK4lGJ58xbZG?=
 =?us-ascii?Q?AAE6gk0R4fnbIlji+ViOtvSwpRdG7WPyxD5lQjLaY5nsDlsmBoNdKk5QnXaR?=
 =?us-ascii?Q?kRTU8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(14060799003)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yG4/w9oALkzs9I5EiHyOGswxiJuVzWZExG3tDT8Q2hWXfFSemez56z2SQmOcWS5b7LF+mbCFj2IjuLkkcUs77AqZzK2f0etJjy5k87RSgDFpg4ON64m6J48i+PmXrLtrPF1LxbpaPZg07/eAbtDxsW8Ny5YG3ZDp5WzZj0G94yfKTXNl0wPkqoe+oSN6IjDIjAEVsSdAGtWIiIk4M69C+Lkg56TtlQpDnNRCU4/e3o6uBebzBXw1kC/ZCvMV3QRA4bruh4+JRD2EaMThZOpb7vPuxkqqPH2j5pcqRcxXTSHXAcpPRG6opXROn2JePwq3nUWCnwUPlU7pFc6WI0MfCuR40+78F9sNKKXPsoKsMP71tSAMidvbuTZq0X+uhM4JKe8Jc/DRcbOBu/tRJaO11S+phavshjnf8bEy9KWrvRZCe1V1RmdjG3hVTPeQ4Yy2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:21:25.5206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d16263e-d0f3-4599-ee80-08de63f8ae0c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8805
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: EDCB9E6FF4
X-Rspamd-Action: no action

Hi Mykyta.

> On 13 Jan 2026, at 09:45, Mykyta Poturai <Mykyta_Poturai@epam.com> wrote:
>=20
> Move IRQs from dying CPU to the online ones when a CPU is getting
> offlined. When onlining, rebalance all IRQs in a round-robin fashion.
> Guest-bound IRQs are already handled by scheduler in the process of
> moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
> itself.
>=20
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v4->v5:
> * handle CPU onlining as well
> * more comments
> * fix crash when ESPI is disabled
> * don't assume CPU 0 is a boot CPU
> * use insigned int for irq number
> * remove assumption that all irqs a bound to CPU 0 by default from the
>  commit message
>=20
> v3->v4:
> * patch introduced
> ---
> xen/arch/arm/include/asm/irq.h |  2 ++
> xen/arch/arm/irq.c             | 54 ++++++++++++++++++++++++++++++++++
> xen/arch/arm/smpboot.c         |  6 ++++
> 3 files changed, 62 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/ir=
q.h
> index 09788dbfeb..a0250bac85 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -126,6 +126,8 @@ bool irq_type_set_by_domain(const struct domain *d);
> void irq_end_none(struct irq_desc *irq);
> #define irq_end_none irq_end_none
>=20
> +void rebalance_irqs(unsigned int from, bool up);
> +
> #endif /* _ASM_HW_IRQ_H */
> /*
>  * Local variables:
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 7204bc2b68..a32dc729f8 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -158,6 +158,58 @@ static int init_local_irq_data(unsigned int cpu)
>     return 0;
> }
>=20
> +static int cpu_next;
> +
> +static void balance_irq(int irq, unsigned int from, bool up)
> +{
> +    struct irq_desc *desc =3D irq_to_desc(irq);
> +    unsigned long flags;
> +
> +    ASSERT(!cpumask_empty(&cpu_online_map));
> +
> +    spin_lock_irqsave(&desc->lock, flags);
> +    if ( likely(!desc->action) )
> +        goto out;
> +
> +    if ( likely(test_bit(_IRQ_GUEST, &desc->status) ||
> +                test_bit(_IRQ_MOVE_PENDING, &desc->status)) )
> +        goto out;
> +
> +    /*
> +     * Setting affinity to a mask of multiple CPUs causes the GIC driver=
s to
> +     * select one CPU from that mask. If the dying CPU was included in t=
he IRQ's
> +     * affinity mask, we cannot determine exactly which CPU the interrup=
t is
> +     * currently routed to, as GIC drivers lack a concrete get_affinity =
API. So
> +     * to be safe we must reroute it to a new, definitely online, CPU. I=
n the
> +     * case of CPU going down, we move only the interrupt that could res=
ide on
> +     * it. Otherwise, we rearrange all interrupts in a round-robin fashi=
on.
> +     */
> +    if ( !up && !cpumask_test_cpu(from, desc->affinity) )
> +        goto out;

I am a bit lost here on what you are trying to do in the case where
a cpu is coming up here, it feels like you are trying to change the
affinity of all interrupts in this case to cycle everything.
Is it really what is expected ?
If affinity was set by a VM on its interrupts, I would not expect
Xen to round-robin everything each time a cpu comes up.

> +
> +    cpu_next =3D cpumask_cycle(cpu_next, &cpu_online_map);
> +    irq_set_affinity(desc, cpumask_of(cpu_next));
> +
> +out:
> +    spin_unlock_irqrestore(&desc->lock, flags);
> +}
> +
> +void rebalance_irqs(unsigned int from, bool up)
> +{
> +    int irq;
> +
> +    if ( cpumask_empty(&cpu_online_map) )
> +        return;
> +
> +    for ( irq =3D NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
> +        balance_irq(irq, from, up);
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( irq =3D ESPI_BASE_INTID; irq < ESPI_MAX_INTID; irq++ )
> +        balance_irq(irq, from, up);
> +#endif
> +}
> +
> static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>                         void *hcpu)
> {
> @@ -172,6 +224,8 @@ static int cpu_callback(struct notifier_block *nfb, u=
nsigned long action,
>             printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
>                    cpu);
>         break;
> +    case CPU_ONLINE:
> +        rebalance_irqs(cpu, true);
>     }
>=20
>     return notifier_from_errno(rc);
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 7f3cfa812e..e1b9f94458 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -425,6 +425,12 @@ void __cpu_disable(void)
>=20
>     smp_mb();
>=20
> +    /*
> +     * Now that the interrupts are cleared and the CPU marked as offline=
,
> +     * move interrupts out of it
> +     */
> +    rebalance_irqs(cpu, false);
> +

I would expect this to only be useful when HOTPLUG is enabled, maybe
we could have a static inline doing nothing when HOTPLUG is not on
and only do something if HOTPLUG is enabled here ?

Cheers
Bertrand

>     /* Return to caller; eventually the IPI mechanism will unwind and the=
=20
>      * scheduler will drop to the idle loop, which will call stop_cpu(). =
*/
> }
> --=20
> 2.51.2


