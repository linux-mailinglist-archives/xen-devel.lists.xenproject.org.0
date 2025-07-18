Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DCCB0A393
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 13:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048599.1418798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucjdr-00083j-EZ; Fri, 18 Jul 2025 11:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048599.1418798; Fri, 18 Jul 2025 11:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucjdr-00081j-B5; Fri, 18 Jul 2025 11:52:43 +0000
Received: by outflank-mailman (input) for mailman id 1048599;
 Fri, 18 Jul 2025 11:52:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BwDc=Z7=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ucjdp-00081d-OH
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 11:52:41 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b529155c-63cd-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 13:52:41 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB7190.eurprd03.prod.outlook.com
 (2603:10a6:20b:2ed::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.27; Fri, 18 Jul
 2025 11:52:38 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8901.018; Fri, 18 Jul 2025
 11:52:38 +0000
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
X-Inumbo-ID: b529155c-63cd-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fnwq8wEx1fvz8i/K2D81LYiD78Ka4CnMegFkBNonoRojK2y6LJXMIwvZ1whg/QOWiZWSZLhFiKrwolbXG1xLmzDiXzVGgszvJoVb7ktQ+P8+35XxRzsu3da5ZCvVH3y/a8Vw9D2CS7jQAHqIy61k5T2EO5g9M1UHr8qcUOlHDGHsF3AhHVY/8Ub7gFurHqhAEIgF7nczgTvYgaygN5j2Q4UlyIz4X98/NX3stT6jm+I/uxygSJ3mByoDHDMYbdWRLGJmQMJhnGLGXjptJhqDFPzQ0W3THxhHpDmf6fB6vHs/IBOXeA71oW/zNOu6pBdouMTxyKY1M5u/ZQyYwbAgsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMP0k57Hu3y4ZkCDfW9AgHCn3p1fAo8CheFa23TymMo=;
 b=WMW4zsaBWIMW0lW6CDlujXWYzjfXnsdKM5qMaEV8w5eDsWArLAZKGFORKZSTk2Y5oyhqDCejqLFPtR7YHlmliWT0yB33xBdGxH5EWV65U+63tNOMICg5oAIXtxu2DUPsSqn2TJUmIQaLuGiZTX6zLqNCA1OlB2R3iwQJdBzC8QqW69SHy0OPoiEjqH63hNvcMzG0ndz6IL6EWhPGDc2VvG40one9T6+FjlgNUly0703lwovjEFxGIv4mg6jNw99KUTo12ZQndc1yi5oGGR4xCQla/BQ7ZRS112t+xS0+ihDzoVcwJmbW5Zt415W+0BW8nkiGMEZwfdLmnWNF1uhcvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMP0k57Hu3y4ZkCDfW9AgHCn3p1fAo8CheFa23TymMo=;
 b=OyCC/EVIAfD3YuXxBmJb3JZGRlvHxSrifFmfHTpLSObs+I1MOl1coWwhq/G+j/UU9qtQr6eWuYHf+vdAVKbTZlsqKQLA0ujVpkFnG9cRuS6HsJkVIM67CDCDLe9JjAOPMH53i5OHZThhKUHwHH7OaOdxLBgXytxuLKcL7pQTwvmEHZUuMtyQ0hSx9byeo4qOgY7DkVvBL+3vdKXJ41Rqt/XNzuDrHOfjLOOMwGUNPjtfauS/hrD5U7RV6O/dfPkwt8Aeu6jWGzdCwtWNnR3sRZc5GptdoSGHzj30Kn7SBX/pTSYITDuT751Cd9DAZdSjdSRb6ZO8bm4vnjPiZsJj+w==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v13 1/2] arm/pci: add pci_passhtrough_enabled check to
 pci_device_reset
Thread-Topic: [PATCH v13 1/2] arm/pci: add pci_passhtrough_enabled check to
 pci_device_reset
Thread-Index: AQHb9iVc9+KBe39cBkCCdxD6apzzJrQ0bRQAgANbioA=
Date: Fri, 18 Jul 2025 11:52:38 +0000
Message-ID: <65673df2-3219-4e7d-8e9d-51fa977ae3e7@epam.com>
References: <cover.1752649797.git.mykyta_poturai@epam.com>
 <daa6b4a6f1e0d90ddf5fd4c25cd941e3fb0d4774.1752649797.git.mykyta_poturai@epam.com>
 <82575b1a-970a-4d70-8fdd-5615cd3f3195@suse.com>
In-Reply-To: <82575b1a-970a-4d70-8fdd-5615cd3f3195@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB7190:EE_
x-ms-office365-filtering-correlation-id: 7c14fe5b-027d-4a04-8d6d-08ddc5f197e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M1A1NTBzbmlDODZuMnlEU0ZEb2tQZXVXdlZWKzJ5dHM5ekNYNjBGVS9oeG5E?=
 =?utf-8?B?aTRLMDJaSHZESXBmZUJUeUpWZWtDcllTLys0VURxVjVIZXZTNHJvZElhamQ1?=
 =?utf-8?B?L2FoeHlpeS9sNDkwcDFuK0t6Q01sS1c2Q29iTUJoNDl3M3pNYlppUGZpcnl5?=
 =?utf-8?B?N0syVFNkbEhCOHlMcE54ZFU1eHVCSWNkZU9teWxDYjJHSm9lU0ZqTm03RUUx?=
 =?utf-8?B?dk8yazNoR3p6ZUYxTVdJaUtiRlZSVEJEcWI4dU9ES2hCOTlDOGZ1RGJJUFNt?=
 =?utf-8?B?dDZPbE95bXZTMDhGZWtYdlVWVnBzeVVTbXVmU3NwVTZqZE1uUThlZ2QvdmUr?=
 =?utf-8?B?WjNGWjJpSzQ4VFppQ0lTcG85MzNkaXZZTFRiUzI1N3BDRk5zVGtsb1hnOHU4?=
 =?utf-8?B?Ym1qdmp6akhyYVQ0MFlLa1RYeGYwV1NnRFhpRmJ2bGVjNXRySnVvTWhITHFQ?=
 =?utf-8?B?TWRCWlFyazFqREQ0NWhVc3ZwV3dCa1hNT0tkbzcyejNHVTJSbUhpRWVYZ2p3?=
 =?utf-8?B?V053SFJ6d1JIU0VIazJmajFKYTNUY041YWk4d2RHYm1HS1BIcnI4ME04c0Rq?=
 =?utf-8?B?OVpxamlDTmdIWUhDcTZJMWlwSWJOaTZxR2hKbW85bnl4OUtGbEhNZDBrYTBK?=
 =?utf-8?B?NUUzNEIrSTdHdkhMZnp5SXhZaEMxWEVMaTkyUUpMSDBYMUFkTGUyNFAvU2wz?=
 =?utf-8?B?dGtiMXgxa2NjOFVNR0dWbzlwT21tdFRBTDFDYTZwSHY4Z2dBN3B4NTc1c3ox?=
 =?utf-8?B?eE10cTNoVk04SGtOZitPdjNhanZIakQrSkNUY1hRMDJUellqRkZmOXVNTlRK?=
 =?utf-8?B?a1FWUGFZL0pnNjhOWHF1VFR5SzVRQkV3bTdoM25VNnNjcE0rWEVJdXZjMC9U?=
 =?utf-8?B?aUNLNE9tYTl0NFpUcmZZTHR2ZklDM25VWGRyNXBCbkF4alFDN2xieWlnR1Z6?=
 =?utf-8?B?eitjdlEvaENlQUtYSXdmTmdtMXczSFc5RTVRV0pKczNNVmE4SU9Ba3M2aEVN?=
 =?utf-8?B?dHk0YnVCOVdqVTRSaFZ1VVVJMVVIZVlZS3FId01yRG9Fd0pzaU5tUzZQaTl0?=
 =?utf-8?B?TmM0MDVmc2lTNEk2ZU5NenlkZnJoK2JBTWVTNGNMVVFzT3FPSGhER2RULzY5?=
 =?utf-8?B?dE44SDN3VUNiM1hzbUVjNVRRcStZaFBHUHdtdS9ySUlLd0VwalNEN0V0dUQw?=
 =?utf-8?B?Z0hqS25Udm5vTkFmTnM1Ujh4eGZwOXdlQVVXUTVFb1h0bGVocFM4QTY3VmU3?=
 =?utf-8?B?cVVmNyt1dFRRMlFlVlBqLzZPUmRGc2QyNTZFS1cwRjR3V3ZwbzBRZGh3SXE3?=
 =?utf-8?B?Rk95azZ0eFdMRFdLOUVnSVNwQndZRktUa1N5ekJzZkdKcWNwVWhCZFFFeDNj?=
 =?utf-8?B?WWdTbXJtQ0k5akYyZCtvYmUrUmRxQ21McGQ4cnJoc081bnM4ZUZhUHFGRVlM?=
 =?utf-8?B?LytrYmp6UEhWclZ2eXplYXVpWTllWmNweFI3YWFzY0Y1b1VxNW5RSkJDNUp0?=
 =?utf-8?B?bGxLMlUySmN4OVdqZDJrRlR4RVpoOStXQ0NUMzhHdUwrMk1tVmg2N2p1VHNk?=
 =?utf-8?B?NGVuTDlXVlpaSHBqSGJtbWRzVVVJbXBMVGZPYXFsSGFRY1JDUGkyeGxHd2Nq?=
 =?utf-8?B?SmRUZjNFb3lNTHNsOW5BTlFTMUJmTEtKWnZGL0ZoNHRnZnBsNDltNjVmTE9n?=
 =?utf-8?B?YTN5bnhJM0pWSlpDMG41V28vaHRpNkZqOTJ2M0o0S0JiVjVQckh1Y1lnWXFn?=
 =?utf-8?B?Um9qeFRHaitBODREZ2VIY1hqajBRRWxqZ0p5Mmh0VGk1aE9NQzFHSTlVZUhj?=
 =?utf-8?B?SXVxcUNOSHpMWnV6MVo4ZGh5K1ZJekp1My9INEhUN1F6Vk9PaTIrcXdaUnlG?=
 =?utf-8?B?Q091THcrNlY1dzhmL0EyN25INGdoSG1TMEw2RzUvaW9uc2hOUDRDejBzL1RL?=
 =?utf-8?B?eVlURTExaUp0VURacEEzWFgxd0l2NmpscEo5UFBSSnU4M2l0UVU5MFFSczBU?=
 =?utf-8?B?N0RQazEwRFV3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWs2MlExeFlQY2xaaWxDOUdiL296T2tRaHB0ZVppZTZBcTdFTUkydzRhSXpE?=
 =?utf-8?B?NnYwLzlTbFltYkNWSmQ3MGdhN2NESW12bWpJSUZMaWwwbjYyOExkV3lCNXlp?=
 =?utf-8?B?ZGxHaVZIeEdiSWcybVdXT3QvWGZJQnZrMGxrZUF0UGtzeUN1SDhWdjFVblVY?=
 =?utf-8?B?ZkVPdkJBVE53SzdWaG1rY0JIeklGdjRQd2hDSFFvY2NqSmdmTXI3ai9DdWNW?=
 =?utf-8?B?Vm1WUExiY1FHYUpMMkw5c3Joak5TK1FDUWJGTE9LVSs5S3hMWXBCUjhTSHAy?=
 =?utf-8?B?UVB4UkN2VEFrSXp0UWZYYTZ0QjB3Z2tORFdKU29ZdzB5R2hjVGpiY2FmL3hF?=
 =?utf-8?B?WjJrOUE4NTJVZ1htVHZzQ1Ztck0xOEUyeFZVWDQ2a2VJNDNpaFE2Z1dkNDhV?=
 =?utf-8?B?VStTNW5yRXhCQ0dLMndQK3IrSDR4R2M0L2VvTkVXRzI1WXNZVlhQd2RUWFcy?=
 =?utf-8?B?N01oT2hsQmdPSVo5WE43dW1wRlN4VWxYWEx1L3VhTFJONit3NkJaRWlYcGM5?=
 =?utf-8?B?Nmg3eVNTSEZxdHp5akJWc3ZUU0tJcXF3T1RNN3d5L1lISkpHQlgyVWsxY0Zn?=
 =?utf-8?B?T1MxMU1mejEvVGxPZVk0Z3dlNmJLMXI5U0t4Z3Jqc3VXMVRaQURCZzZpSkJ5?=
 =?utf-8?B?SkZoSU9FZ2t2SnN3Q2wyODU1NUVFNjVQL1dORDRaL0VkNWhiaWdSemgwM2la?=
 =?utf-8?B?d3VKZHdNL2tYclkzd3lVZlNGcjEwS1VOa2xOQ2dZK3lPcUkxWEFQR3lncXVj?=
 =?utf-8?B?ZmFZTnZXeUlxdzAxYkpha3lSdkUvdW83ZVBJMXQ4OW15UnZiR1AzUGtVM1pY?=
 =?utf-8?B?VWtDcEd4UHl5eTNRbXRJb1NsMEx3a042NnJUTFY3WWJydnBJRjBuV0swdml2?=
 =?utf-8?B?NmRlSFg0SEdLRUQ4WVV4ZUNYVWcrS1p6RjlIdGF0MHExNGZOdDZHV21RaGVn?=
 =?utf-8?B?RStTRHF2MXV0Vjg4WHFEMnQ2aU9QYU1qQlVlMXA4eW4vMkdhZjFqTXVtRXlX?=
 =?utf-8?B?NHIzR3lqTCtnZktsUXdqYmpMQkkvdGJiZjRNeGtwL2pCU0t4NEhjYXdENXBH?=
 =?utf-8?B?TlcvV1pwUkZYQlNaRjJhTC9BNytEakl6VmI4NXB0aWc4SlhHQTdDM1Y4VGI5?=
 =?utf-8?B?bFRla3VqV1dqd2xJQnZiZ204U2ZMcldBTTRMVDlFQXlreE1wSHcyZzA3V0VL?=
 =?utf-8?B?VjNJeEs0QUxBNW9VeEMvTHhFRlFvcGhlR2ZwcGZudXVkQkY1bDFkUDJ6NVhH?=
 =?utf-8?B?c285RGVUZXVQbmVmbEl0S1JlY2svdTJRVXpFWDNSUGl3WW1GVVBTVzhkYThM?=
 =?utf-8?B?ZExKVXIrUGk4OEV1WEtVTXEyR1h6WE4rZ2Zwc0JTZmg2a0RaOFg0MFd2RjVz?=
 =?utf-8?B?T25ZYlJlRHFmdGFtMUg4NEVnSDdzSDBOQm9Ld3Azc2RBTlRNbUFTSGh1ZjJn?=
 =?utf-8?B?RUlrK09SV3lkYlZSS3ZPTXdKOVQ1U21PMnBrUmVqVnRxN3h5NTltUTNRelBQ?=
 =?utf-8?B?QllGRUZXQVBxRDJOeFFvLzgxWEJVbGxKc2VEZ3RESlRaVzZEbHFKaFhDS3lO?=
 =?utf-8?B?OHQrMUMyTTZLeW9GN2hwek9qY0JlVDg1dzdnbUVxYXg1UndiOTB0U3lJWHpR?=
 =?utf-8?B?WUYvZEhSVmJob3JyTTdKbXY4KzBjMlRTdkhnSG93Q1lzL1VSOGpuL3dvKzVs?=
 =?utf-8?B?OHUvd1lHQlhESVN3b0owNWI5RU5kekU4MEIzeWFpSGtHOEh1NHpsMEEzcVlj?=
 =?utf-8?B?N2krTUFJZTg0bVA0cDNuWHl1TWc4SkovcXY1UXQ4Vm5jbWJCd3Z2Q0g1Qktn?=
 =?utf-8?B?ZU5zaHlLTmJEb1BINjVWOFJwdHhKOUJlVnZlbkI1a1Bpb3VFSm5udWRUWWkz?=
 =?utf-8?B?MDNYaDRVNWVxWFRsN0pDMWRkaDJvK0N3TGY0enpWU3pKMGRldzJid05GVnp0?=
 =?utf-8?B?MTJ6K2lrKytMYjlhWGhzdjlsR2lZa2dESDhTd1pnWHZuTUZHLyt4cDBYZHFo?=
 =?utf-8?B?aFhadGdwUkcyK0ROYnF1RHVEd08vZ2ZVSUxPbnRJTnkxOG9BUUdWdFp5VWpv?=
 =?utf-8?B?WGJ4TGhHaGg3Ri9kQWtETFU2TEVXbjdBNVlzM01TRUU0ZzFvUXZweU54bkl2?=
 =?utf-8?B?MzRtUmZjQ2FCQlFoamtybmdiajhibzIwOGR2WVljQnVZY1ZZRkp0MmJqK2dk?=
 =?utf-8?B?Qnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D277DF69741BB64A842C80E5945407D0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c14fe5b-027d-4a04-8d6d-08ddc5f197e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 11:52:38.2533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5aP92Rj6+1ywgfmJvVfvR9Juz9R/RZo3ACsu8v+JdYsdyNBebUTUhIbeUKrY5ztqo7/3HaUoIJD1V0HU0YWROQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7190

T24gMTYuMDcuMjUgMTE6MzYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNi4wNy4yMDI1IDA5
OjQzLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IFdpdGhvdXQgcGNpLXBhc3N0aHJvdWdoPW9u
IFhlbiBkb2VzIG5vdCBrbm93IGFueXRoaW5nIGFib3V0IHByZXNlbnQgUENJDQo+PiBkZXZpY2Vz
IGR1ZSB0byBQSFlTREVWT1BfcGNpX2RldmljZV9hZGQgbm90IGV4ZWN1dGluZy4NCj4gDQo+IFdo
aWxlIHRoZSBsYXR0ZXIgaGFsZiBvZiB0aGUgc2VudGVuY2UgaXMgdHJ1ZSwgWGVuIG1heSBrbm93
IG9mIFBDSSBkZXZpY2VzDQo+IGJlIG90aGVyIG1lYW5zLiBJdCBzY2FucyB0aGUgYnVzIGl0c2Vs
ZiBhZnRlciBhbGwgb24geDg2LCB1bmRlciBjZXJ0YWluDQo+IGNvbmRpdGlvbnMuIEZ1cnRoZXJt
b3JlICJwY2ktcGFzc3Rocm91Z2giIGlzIGFuIEFybS1vbmx5IG9wdGlvbiwgd2hlbiB0aGUNCj4g
Y2hhbmdlIGhlcmUgYWZmZWN0cyB4ODYgYXMgbXVjaC4gVGhlIGRlc2NyaXB0aW9uIHRoZXJlZm9y
ZSB3aWxsIG5lZWQgc29tZQ0KPiBpbXByb3ZlbWVudDsgdGhlIGNvZGUgY2hhbmdlIGl0c2VsZiBp
cyBva2F5IChvbiB0aGUgYXNzdW1wdGlvbiB0aGF0IGl0IGNhbg0KPiBiZSBqdXN0aWZpZWQgcHJv
cGVybHkpLg0KPiANCj4gSmFuDQoNCldpbGwgYWRkaW5nIGFuIGFkZGl0aW9uYWwgbm90ZSB0aGF0
IGFsbCBvZiB0aGlzIG9ubHkgcmVsYXRlcyB0byBBcm0gYW5kIA0Kd2lsbCBub3QgY2hhbmdlIHg4
NiBmdW5jdGlvbmFsaXR5IGJlIHN1ZmZpY2llbnQ/IEFzIGZhciBhcyBJIHVuZGVyc3RhbmQsIA0K
dGhpcyBzZW50ZW5jZSBpcyBjb21wbGV0ZWx5IHRydWUgZm9yIEFybSwgZXZlbiB0aGUgeWV0LXRv
LWJlLXVwc3RyZWFtZWQgDQpidXMgc2Nhbm5pbmcgcm91dGluZXMgaW4gWGVuIGFyZSBndWFyZGVk
IGJ5IGlzX3BjaV9wYXNzdGhyb3VnX2VuYWJsZWQgaW4gDQp0aGUgbGF0ZXN0IHBhdGNoZXMgSSd2
ZSBzZWVuIHRoZW0gaW4uDQoNCi0tIA0KTXlreXRh

