Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFFdItoT62lsIAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 08:55:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F32BE45A62C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 08:55:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293185.1571058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGARF-0005WH-RF; Fri, 24 Apr 2026 06:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293185.1571058; Fri, 24 Apr 2026 06:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGARF-0005TQ-NR; Fri, 24 Apr 2026 06:54:57 +0000
Received: by outflank-mailman (input) for mailman id 1293185;
 Fri, 24 Apr 2026 06:54:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peng.fan@oss.nxp.com>) id 1wGARE-0005TK-5d
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 06:54:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGARD-00DfKj-IA
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 08:54:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peng.fan@oss.nxp.com>)
 id 69eb13b6-5cb7-0a2a0a5109dd-0a2a450b85b2-12
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 08:54:55 +0200
Received: from [52.101.84.23]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <peng.fan@oss.nxp.com>)
 id 69eb13be-212f-0a2a450b0019-346554178876-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 08:54:55 +0200
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB11077.eurprd04.prod.outlook.com (2603:10a6:10:58a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 06:54:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 06:54:52 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1-NXP1-onmicrosoft-com header.d=NXP1.onmicrosoft.com header.i="@NXP1.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONOknKi0dEDjJvvYA1TAf+FZgt2l8vGH78ytJXjQuhLsGFiWKk1+QCJawWOsI7fP9eDtHhG6k0uCgIXk1B2I8IZtkwRwVja2POipYUGu4yyesJgmumOdhWTFHfxCFu/tYZquMQO6XxGyJ7lwL2NdqpKKNaCgLmrVXqJg/4/se4ljp9szE5h5x2y7ZxBbLMin5Xk6jL2yLKferpo+MseE1yHkWHPJV2mOaVZRFQYFqXdyfThwi0yoFA+Uv9NH1ZLQo2Ljch6tjsMYmle+bOH+7b5uIh4tnjDjNlK4C/FZwyN1w500Aq55TZrD2OiZrrLt6a01m9SRkiuMYXUz2n6D1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKmrSqn3mEOETaFW5rN2OEA5bGxOIbczvq85Q03itfg=;
 b=xIRzdjflIxKIM3fWpoMfb8rv0+8zgtSwnWJu4zOBZ9i73kFGqP1ayKdc9FgCBDKR0gRCbrP3pSytHBmLSIKBmpW2ZsMWC1hiHYTSrVDuXrEB0hl4SWRX+RB8VZ1k+LJt1hhl78EcuDlOCAmgU7Urgmn3Not8TCYdlo4QQq9OfwraWf0ZX7AAsgvymDABPUFQfG9bbuRyFS1xgN6fxSAR8w44YjBVJkRWG1PCHg777yc9gULwNYH1QNVKAsKf8dH48E98XW43wB73nleJTwgiPmkgICazi0x24STNl+/79nBn/cB9akG0p5O0PfsIhohW3tX9OwsDostyc5yqM1nxDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKmrSqn3mEOETaFW5rN2OEA5bGxOIbczvq85Q03itfg=;
 b=ALvy0m7ABgaAVIoJxrhyk/Ep5N+apCjembEGcQKN+VvafLZMjVLkLLWdSEOHj6M9KiVwJhu22YIU8y7Mpu/d9SNeXF1TcU4N3s8pfhuZCG9zgTEwvzNvtunEZUYdAxneZaurWiCTzf1FoWkN9GWsUu+5uJ5wvxcU2nT5nam0xI7nnyzVuj8J2BQ2Dk0UyDWivRtiIAB28Vlz+9iN7hNH+QDN4hJx6d7HZUx70RvmavyBEabdm02JpByShdLXJHobIjq9cmkdEs7X8PUPaWGc8RckW9oUqRKDvkDxVDWqXkMlK1DQqcaTPO4nTN500u7/dc//6nARR1ta8J4IDedvgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Date: Fri, 24 Apr 2026 14:57:19 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC] xen/swiotlb: avoid arch_sync_dma_* on per-device DMA
 memory
Message-ID: <aesUTxAl2qWZiqoT@shlinux89>
References: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com>
 <20260420230137.GQ2577880@ziepe.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420230137.GQ2577880@ziepe.ca>
X-ClientProxiedBy: MA5PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB11077:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c920f1-d542-4ddc-1a63-08dea1ce6212
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|19092799006|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	MiG4tXuphSaEolojpDjuORLcuLfeLX4pLw8UEZ0+xqLVJGCozlrINmK6cP4Xfkt1tQOvr3PRO8dnJgNBXyjXvzHPiUQYmYpS6wIX6kieOh+clNyjsC6Sb5oboZWDoIU6ogyO8yUZHf1Vrx+rKlVoBgvtsgo6Hjq7rf8hSOeQnSwRETNQLqGrAtHQMqnQ3epiDOSidqk6fC4I6uOUUkxTurlSh4fI+KPgZw1Bq7cioXcoYKbTJSIIoEPWS6yB78hw5xo/sex31+4oCQ4S/y3u8DMyd11lxDD79Wj89ClbM/ZoKNPiGl11d3VmF7KNoWyowrvS/X94mPqctL/gHN/GJ7PB/KVJoPjCUaJe2jEfP8Mbgx7P7Y9Ll6uvw3YR2NGwIVUbeakPzx9jogQSiYD8tf9EwAkoMmz9SwPYH1333xH8M6aAAFwzg/P2AXKAk8wjZaX4SnxE10mDOrMwEgxmH8FjE0MQxPIaQWw/orBbJD/Qb7CVuFC9FIzS0mgCT49mQsBmMopAM7I3HPniLVw2zR81Hkjok6P0Xn4LHxesWFJjmckoSgJ0DSOR8A550MlBLdBnvjwKP/OruDFWpVltx5pqsxS8RTcdF72n1punXOgArf2VbbZpfAxPs1k5dA05x+nB2fetLlQha3v92KBlGVqx1FL3DzcQ4m4m5j32vE4tY9XXNFrS3MzmHYixKc7CZY0VOiJd8k0RuMrOMV3iBolKTz+9rKUwWUYOeMOyps1zL+sKDZXXsGnZHUpOYJyrpxJrg7aTy54HUjmaHj2b1zfpiIJSfVyfkcQR/yKS+Ms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(19092799006)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QdzvbSeRXcNlVS+L4bO2cwQUJyXvJSDbbJIqs9OGwnIZO+X8a8TLgli2pECU?=
 =?us-ascii?Q?Q+T7XCaKhb/Xg0NvYK2VoZvHl5t7gz92oA6VYt4eI2OiWqHmQhGdWLVI1j/X?=
 =?us-ascii?Q?uBQnf6HZlOBJ9GXOGtQY6c0VY0Vn2jJuFDlj9FAhiPALGfM2BF7VDWnQPans?=
 =?us-ascii?Q?w+4lFpXbMw2BeUbWxAiJp2tiw+QprOIKFMSobyQvoNXniDilmvDTLs8hyaKu?=
 =?us-ascii?Q?iB0k4ORbJyWNxvMEOrEc7wdSe8liNFTNRhh3FBMKBLab84jpg5NtZK58pmqe?=
 =?us-ascii?Q?odtbrPxGtrlBG8wZkmOOtwrXfLyWIxysXYz1o0J1KOMvyl+/uHBqJL5ApTma?=
 =?us-ascii?Q?0DqjqHJ2/q4tqlTlbmFVnoqCIUOT2uGUGRKOR4Bypfj4Q/GYnD3N9khQcp4S?=
 =?us-ascii?Q?N3eZi0tsTRCVstiLWH64TZ5EYeu61IEJ3BTs35uhPHk556wbUD9dR65FYtI2?=
 =?us-ascii?Q?EnrAOfHzf+gegP/DRrRJlVAo/hiqjwz3QKh8mWDMMntFtRaa3NWmYzU+wLg8?=
 =?us-ascii?Q?QeojJ7X36F4UkJJwR2tfl656cb/Dk+JV2WZ5uaD43ANFYeKR9n93J/dkym1H?=
 =?us-ascii?Q?6YE64m2lQnHb/HNRTp8N+nfG0YhzK53UK9XWgXW9C9HLxXFzUjz8NlgOE8Ma?=
 =?us-ascii?Q?O8aEflSBNXspHJYgQaEn14qXleGtZTqK2NmrfB0Yk1u2nscGwOWkp1vxa6P8?=
 =?us-ascii?Q?XNT8P17LXqtGpNK5aJeMYRClbS5rJM4NHM/61ht0QYntoux7ejMZrM6yx2Dl?=
 =?us-ascii?Q?OelzPE4eYPCVAWh/aVp59UlheFnWwkl9C3TZzlW7QdjULjiI+X5gB03hDYhn?=
 =?us-ascii?Q?EYVOgNboxoi7KwPz/Anh7mArweofNyuPLHd/1Ybc1BlaRbY3BooO5sV8X7Rl?=
 =?us-ascii?Q?x8iNr+D3GhHvn2VYsXb4Rr61Os1q0a63/mE4weLwdTAs+4/1nwuO+UY2zOhi?=
 =?us-ascii?Q?w73y1rkbCGRxmeeRhGsrSB5FPY9fw/KX6VQ8pkG36EdXwbkLQffJ9nzrydCI?=
 =?us-ascii?Q?pVzMLEyBbsNvxqSZboOF1HatjzKoDWqwp9/VumL+T2+mMnDZBIKYMVXb7LIB?=
 =?us-ascii?Q?tDeM3sPGtohJxIvB/pz7s+qY4sQX4E4kLezKr37jP6oEApWWbEH9LQNOTKip?=
 =?us-ascii?Q?rgXEaLLT3hOLcVpYNRUFZVpsFZ32AeY5qr6E279nU/IUgeiaWo88pzLiUWLy?=
 =?us-ascii?Q?XAo7qR//CDfcLkycoQGRIqA79MxwELaDHbIkOtvC6XxZ3kI/HdfI+yMa7bM0?=
 =?us-ascii?Q?uA18ZiNbgABWbH3ZQcYlZnsT/9K8p1w1nUdLYgIkBHBTsILLvTx8EZwmVHz2?=
 =?us-ascii?Q?nZur1PqW9wi1ALE7RlU3WE4ew3pWuj2ZuOIb2+hmjFk7b4BCiWKm/iLfT5Si?=
 =?us-ascii?Q?NiZzdV5m7wfqCb7D/9uFBzW7DGuo3rox8tNfpyKEOTTrvxB+q38aCTfr/EEq?=
 =?us-ascii?Q?7o4qfCVFz/DzA3DYvWRgbot9hyMpNAvcypo0tlgtAPBMBtj6YkRIbZ+me8Gm?=
 =?us-ascii?Q?acnK3Q2pfd/BJDVkh2ndRpq663X3XExrHoQBxokB9YIWCy9YBEeVPXenIC3H?=
 =?us-ascii?Q?9jhhbkqCDHP1vVtTRiQXXlh70Jq5bC1fWxr2LpadHEdlJhLXea805fD6lpXe?=
 =?us-ascii?Q?qFmbry4+xIzIPTnnNHpUFcTonSvkHhZ35sMeOzYOi6B5opfJQ1RkBH2eyPBl?=
 =?us-ascii?Q?beBD3Ek5xLRxvWCGBRLIMhYZXTenUGpz/V2IZrm9iC/Gv2Vl7mw5WAAy7lgD?=
 =?us-ascii?Q?yDOcgEcu+g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c920f1-d542-4ddc-1a63-08dea1ce6212
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 06:54:51.9798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2qD6rpJUkb6jxT9Ys5SUz86y7XzC0FkFmNvfCKw3ynjHQ5Nzz7IVXPVqyCsG9Fu8wTRbCnoqr3BMkhpT87dzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11077
X-purgate-ID: tlsNG-42698a/1777013695-7F57BF3B-4128ECE1/0/0
X-purgate-type: clean
X-purgate-size: 3019
X-Rspamd-Queue-Id: F32BE45A62C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:peng.fan@nxp.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,NXP1.onmicrosoft.com:dkim,nxp.com:email];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

Hi Jason,

On Mon, Apr 20, 2026 at 08:01:37PM -0300, Jason Gunthorpe wrote:
>On Wed, Apr 15, 2026 at 11:08:36PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> On ARM64, arch_sync_dma_for_{cpu,device}() assumes that the
>> physical address passed in refers to normal RAM that is part of the
>> kernel linear(direct) mapping, as it unconditionally derives a CPU
>> virtual address via phys_to_virt().
>> 
>> With Xen swiotlb, devices may use per-device coherent DMA memory,
>> such as reserved-memory regions described by 'shared-dma-pool',
>> which are assigned to dev->dma_mem. These regions may be marked
>> no-map in DT and therefore are not part of the kernel linear map.
>> In such cases, pfn_valid() still returns true, but phys_to_virt()
>> is not valid and cache maintenance via arch_sync_dma_* will fault.
>> 
>> Prevent this by excluding devices with a private DMA memory pool
>> (dev->dma_mem) from the arch_sync_dma_* fast path, and always
>> fall back to xen_dma_sync_* for those devices to avoid invalid
>> phys_to_virt() conversions for no-map DMA memory while preserving the
>> existing fast path for normal, linear-mapped RAM.
>
>I think this is the same sort of weirdness the other two CC threads are
>dealing with.. We already have two different flags indicating the
>cache flush should be skipped, it would make more sense to have the
>swiotlb mangle the flags, just like for cc.
>
>https://lore.kernel.org/r/20260420061415.3650870-1-aneesh.kumar@kernel.org
>
>Then you know that the swiotlb was used and it should flow down to
>here.

Xen fully implements dev->dma_ops and does not leak hypervisor-specific
semantics outside of it.

The issue is that the existing DMA attribute model only distinguishes
between "CPU sync required" and "no sync required at all". Xen needs
a third case: CPU cache sync must be skipped, but platform-level DMA
synchronization remains mandatory.

This is not a generic DMA extension but a constraint of Xen's DMA
model when mapping private or foreign memory that is not CPU-mapped.

>
>>   * physical address to use is returned.
>> @@ -262,7 +267,8 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
>>  
>>  done:
>>  	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
>> -		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr)))) {
>> +		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr))) &&
>> +		    !dev_has_private_dma_pool(dev)) {
>
>Also this pfn_valid() is totally bogus. Unless DMA_ATTR_MMIO the phys
>must have a struct page, be pfn_valid, etc.
>
>This is why you are getting into trouble here, beacuse swiotlb created
>a non-struct page address and passed it to lower layers without
>setting something like DMA_ATTR_MMIO..

See above.
xen swiotlb maybe a bit misleading, it is not kind of linux swiotlb.

Juergen, Stefano,

Please help correct if I am wrong or I may miss something.

Thanks,
Peng

>
>Jason
>

