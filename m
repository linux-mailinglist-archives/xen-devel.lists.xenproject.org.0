Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A559398F382
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 18:05:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809631.1222060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swOJu-00026C-Kq; Thu, 03 Oct 2024 16:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809631.1222060; Thu, 03 Oct 2024 16:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swOJu-00024E-I8; Thu, 03 Oct 2024 16:04:50 +0000
Received: by outflank-mailman (input) for mailman id 809631;
 Thu, 03 Oct 2024 16:04:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ein2=Q7=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1swOJt-000248-Kw
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 16:04:49 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36e1a4fd-81a1-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 18:04:48 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AM7PR04MB6806.eurprd04.prod.outlook.com (2603:10a6:20b:103::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 16:04:46 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Thu, 3 Oct 2024
 16:04:46 +0000
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
X-Inumbo-ID: 36e1a4fd-81a1-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+2i0F9P0Axi/dwQdlECZi2CeEMJ67skv9xomo9Z1aPNUN2sSnqyFNtlryyLhLsqZ4JJGs2HGYmfgXYbECCIgcBoSlUBYyOnNrrtKkLD9rU5g44z1LSEa6SVxj6M20NBtWsZmQiLT8UaqlFKPbHuzVbh6YIphF59iCtscEjZh2oQ1XFkVuq1hmP46pf0PBda1ryvgpWPGWy23/vRVqR3vr0CLkNi8jERZJPJaioogapIzoCXXL/U5kQQfxrU8lWQi5e/DLN26daFP1NIpFtxM33j/FD4Thdz1W8i74VGzXWQ/ZwxX+b0jstm1ZVRlPLBpDN4/JDwaJes7U45u2kllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AprMTSjiftUEuICpNCK0LIyqpyHWZEGFNkm8Q01d2Q=;
 b=DpLbU6nbUzpiAVHbU9WrwEE4yuil8q1Irr2rU3S7XQUEu7/hrqIUHE0S2PLn3lgI7H+jbRfX3UsO7qvQIa0WHYBzQ99wQUDEFk7tgtlyHc4QBNX7ku/7/X9nOzJzSSTzjCaawzQmJ4FxuEgtwD1DMnsIkKQk5ISqFGza775hkc6GsgrrEnz39zv6MeQuDQXBZh8Jny1OrtEnTo+rH7vO4eq3AKvOoYXnk7cHVlL9nzAdUA/3E2T3oBNwB5YKIu8AI5C4INEn8Yld8db7mSV3GxCaggfoi1An6JuB4oQYLdYxcFd7oLsGL/Luq89xDtHJCNTshJ0cZD7QO9zW/HLnPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AprMTSjiftUEuICpNCK0LIyqpyHWZEGFNkm8Q01d2Q=;
 b=teq/tlvGslF6IhbgvnWRvLWepqzST1OmBZIZX4r6Sbh/1hR6DE0PAXFAESz+speA2Uke1SQUfgtPqNb5lLajfCDolp2Z//UGOjr35LnaVU9sdL/t4R38MIYfVFvCyVrO8fZpZGK6inXH8nN/Isq8HOys0TLaBtqJXaGQDfLp3V605Kf+MkX5vnG4wkBOfqVqE371Y4NnDdzrdZZSZjBOayiPFE4JEaD42UHsF84Inj81gkQk5o7ox1xkqrbUBbP+aJ6z5An23+CmPMzGj1+OdsgVeV4Nt5Zxw0ZJ9tSYdKeIKtuxaL1UqaiTxQHhGK8XLkDNwCzlbch5tQ3aArcdEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <35a2b5c6-a40c-4403-b008-d7944733f597@oss.nxp.com>
Date: Thu, 3 Oct 2024 19:04:44 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] xen/arm: vsmc: Enable handling SiP-owned SCMI SMC
 calls
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-5-andrei.cherechesu@oss.nxp.com>
 <7878c251-7b26-47e0-a79c-4e563ee1e9f9@xen.org>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <7878c251-7b26-47e0-a79c-4e563ee1e9f9@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR07CA0021.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::34) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AM7PR04MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe7cb59-44c5-49b9-d41c-08dce3c51a1b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFQ4eG9Za0NoeUZyblhTOVAzeHVRR0EwOW9jTHBWZDk3c1NSRFh2MjNWaml3?=
 =?utf-8?B?aWhncXBnWmZuZS94K0FrbzMyYnEvNEt5aUl3aFd6REFITFVSTXUxM2ZYejV3?=
 =?utf-8?B?dEVKdUkwQzZaVGcrSkVEdW1JaGZ2MGhJQXhmcXVweFFiczNXT0xHdzZudTVr?=
 =?utf-8?B?cTMxRXpUQ29OMTN2TlJyTHp4c2Jtbjh3TjUzSkVSSVY2cHVvUTRDUjRTZ25E?=
 =?utf-8?B?bTBCdVl0N2UyRDhqSTBvMVBUNmRlZlJiUUtUK0lRUG5SMkJyZ0dRSm1GM1JJ?=
 =?utf-8?B?aEdFZEM4ZVRsZVFleEJ4ZmNWbS9JZS9kcFdHbE9sSnFybEVMN1FlaTNVSUty?=
 =?utf-8?B?cnprVXRYQ0pEWFV2SnR4cDZHT2E5SlhMTVIzRUR5bjJVZWxiL1RHcFU4REY5?=
 =?utf-8?B?UTZMaDVVamNQVmhOQndmREtiYkZJaHZVMUJhdFYxaVYweHR1RURqRUZydW9T?=
 =?utf-8?B?RmdaNFRnZVAwZEFidlRvYjlBcnB0S3Jlc1I0WnR1WnRHVTVwbUduMlZtaVJ5?=
 =?utf-8?B?OUQ2bzR0TktjTFlDWUU5dW5wYnBOaVo4M2pnTW5nNTRYdk8rNmRabWY2QUZL?=
 =?utf-8?B?bDdZNXlObzB5TThoWkJ4UkhwNHI0WUJGWjhWWU5LUzlJM1JmNFNmR3dubVFt?=
 =?utf-8?B?bWdEeFZoNks0a2dUS3U1SzlzNm0wV01oUWxWNUxmUzFzdHVOTTZIVWZEWkxT?=
 =?utf-8?B?alFoL2xYVWZNdmhEa0dkK0RhUW9ET1d6NEpZSXpIYTVmVUZHMXdoYzZ3d1Z6?=
 =?utf-8?B?aU1jU2U1T0ZvZE1kTyszVHZndndoVGliZzJCWk1JZ01zcnZjemYyN1dpMUsz?=
 =?utf-8?B?YS9KWGgxKzQ3WnJxL0hIemd4NTJJenlOa2I0Y0NkekFQbndlUUpNaXpPUXZS?=
 =?utf-8?B?NGpMTThOcExhbHkrSk5vYWVGZEZSNU10SHRtZjJZc3pvZVdVbFFoemc1WXg1?=
 =?utf-8?B?RXN2Qnl1M0VVUDRFMTVlMUFaa1FXZTVKVkx6TS9qSVp3akFqcVpIOW9MM2Uv?=
 =?utf-8?B?VEZzK0svSysxKzdDanRnNDVLUmwwc3J2V0VXY1RJWm9FNkhNTk1sUzZIK0JR?=
 =?utf-8?B?SHFKOHh4eVNFeTQrUktKVlVIcVArS1hOZlhUTUtHM3ZVby9OTVdQMEgrQlZy?=
 =?utf-8?B?d0wweGUzSXV3dDRxZWxEbHd1b1Z0U3o5Mk5SeHl1blhqSEpCak1mSUhUYllW?=
 =?utf-8?B?WlV4YytkZVhJRzFhKzJ5eHIvT0p4KzMzYkpYVHBXS2J2Q2tRVGdCanE2dzJr?=
 =?utf-8?B?K2wyVTVlWTl5Z3FsZ05FSHhXVDJ2SVRBSkI3anQ5eFBkb0xybW1yQ3R0T09L?=
 =?utf-8?B?MDUrbjB0NGhxWVE1Ump1NUFoS0ZZMG40M1lpNUhLZGZ3VW0veWxEUkIyRS9m?=
 =?utf-8?B?aDh6QS82ZVJCSlRWTHVvOHo3SEpKU0llQnlacEIwVTA5ZHltc0gva0ZrYms2?=
 =?utf-8?B?aEdwK3hlQUgweGlxMkVpNndBYWlJcHF2YlNHbkFkRGkvdzlhakp0cnVHZm9s?=
 =?utf-8?B?TU16bkZVY3NCK2tmZlFBbmJRV3VmSDFldzF5elhaVkd3ZVVTd1QvREVxSjM2?=
 =?utf-8?B?bHRxRWYxaXhtN3dNVEpGVDNVY2JoN2hrR09DZHUrTUI2NzFqcFoxWTFRY3Jz?=
 =?utf-8?B?aHg2MGd4T09JdDZxNkNQVXNRTG4rQkhxeXRqRGZjUzlHblp2WElXUndaK3cy?=
 =?utf-8?B?RnNxanNMRnhSeFMvL3ZLUWJJV1JYTVYzcHhLS3I1dk96ZlMyd0dtTXVRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW8zNkJCckpTT0FBRWMxcGk1bW5XbzYwTWFFQUVNeStjQVhNTDEwNUJMdGhv?=
 =?utf-8?B?NXk4enh0MTBUVzBEMGZ2T3BUOUdSYmxBUlRoYmZjSHRNem90YngzRDFaZ2VJ?=
 =?utf-8?B?aERXcWtLM3Y0U2d4UjNvVENJWkxpTTB5OWFtak5EQ2NyRzV5WEJVU3ZjNzJN?=
 =?utf-8?B?WkpRb0NkaFZCWXUyM1NpL1haTDhvbjgwMDJyZEZJM0dHT2FhZkhzeE1KODRr?=
 =?utf-8?B?ODlWelVkbyswNjA0ZDZ1aHhOb3Y5M0ZCTUY4YWxmbnNqcUNSR2Fhd1dSbHRO?=
 =?utf-8?B?OGtCOUE2NXYrVk1NZTl3Uy8ydXpuVVFlUFA1VXlIQWx2Uml0eFZldjMvUHBq?=
 =?utf-8?B?VmRkeUlycUJlcGVjWXRtL3lVT1VkK2pzTmRmdkpubFdQUzVtZDFUQ29hL1Rp?=
 =?utf-8?B?TFB6OGZBMlVVZEcyOGJzaHZXaDg4Y1dBS2pSZW4xVmJOQ2FiR3UxUHdPUmJ5?=
 =?utf-8?B?czdWTlozYUM4cFU1b2VmNGc3RVlJUjJ3UW9wQ1FEdGNaT2NqMzVVNWxRVWht?=
 =?utf-8?B?RmRiME1ZbVVLbHdrOWJtSXFvTCtjVUZ6Vm9HNVJBVEFPY0lCcUxoSnd6WTB0?=
 =?utf-8?B?OHlkejFDaUEwQ25DblI4Rk15SmNUaXlRbm53UWk4NTcvWXROVDBnb0ZxNVcz?=
 =?utf-8?B?R2Y3ck5IWXFTOXUwc2FMKzZiazF2cDIxKzFQQWVjSXdzSFhXS3hCTW1nOExI?=
 =?utf-8?B?WjVIS0hmTUU2Snd0QWo0M3l5cmdjaUxPSWFhd0pzZzNFNWNxaGFVTFRnc01C?=
 =?utf-8?B?WFNBaGpQU1R5TURqK05GUlZwbzZEdGI3K1NwN1FRVkMvUmtpRG55bFdMcDBV?=
 =?utf-8?B?V3NTdmVON1FEMWVUUVBObFJYTk0rMmkzMHc2UXUyQ3d5ZC9na0pJR2wvTnQv?=
 =?utf-8?B?cW52bUJVQzZOU1ZUc0RIcU1YOS9XZEpiUHluMUp5K1JVcHBFejVReGcya3RB?=
 =?utf-8?B?Tms3dnc5KzJ0NHF1MGVmUWVVdUNDTFlKbERwazZ4WU1rMTNLOXY5Ymx6ZTB3?=
 =?utf-8?B?cDF4dTlmQjd3SjdqYmF3YkE5bWttYnRjc1RyU295d25JWTJJci9KV2MvZHFS?=
 =?utf-8?B?M3ZIV3Z0U05mQjRSM3BMTFNKNU90cEJ5WCtqTzYzR1BlekNzRWhUa0pielp1?=
 =?utf-8?B?YlFzbGtLR1BFaFQ2UzdITGIwTyszTTd4Y2kzSmxFNFRJQ0k2d2pBS1dqTjZp?=
 =?utf-8?B?Z2dOckJPZTk3dFJOT3dabHVIZXpWaHJxWkU2QURMUGYrMHV3ZWlwdWhuV25p?=
 =?utf-8?B?QjVRbkdQUkJ0NEVMR0JJNW1lWnM5S3I4c0FOSmdqeWticEZwYjZackp4R3hj?=
 =?utf-8?B?bzE2VHZZL0l4Q3pjWFhoUVUreDg5UTVVYzNucHZLVW5wbFRXTTBMSmZtcmpT?=
 =?utf-8?B?d2Q3WWJEVHpFMHRqeWkvWUpPU2lpaUdrd2dkUXZ3KzdidHhhZUhndnlwSzdn?=
 =?utf-8?B?UlMyNGxEb0c3ajVnSmZENWxXdVFnVk1MUGxheXdiSWhEVVNZb2I0UklIVGVW?=
 =?utf-8?B?OXNMbkRVYWxYd3R4TFFEKzVMdXE0ejRYT1JOTGVPbnA3VVJyZndIQjVBOE1z?=
 =?utf-8?B?c0xZbzBwS1kzbWlnWFJIdldqUldwRnF5dFBsNGxLMXVEcGtSQ002c2VudUlP?=
 =?utf-8?B?ekloVFJrQjcvVFJ6NFcvbmhXTDZtTXFvdG1TNVBFM2lEL2k3T0ZxNVBYOElZ?=
 =?utf-8?B?Smw5bHM2V3FtdlR3azZ3RVhySU1BUVZqY0l3djhpQUZHdmFJRlUrMFNpZ29z?=
 =?utf-8?B?Q2pmYnBVTFZFNmsyNnA1YXZDTVNaaEpKWUZiRno2YUowR1FyOXJjL1padE9x?=
 =?utf-8?B?R2hieFBpU0hlYmZSS1l1bkducEkrR0dXUUVqQmsyWDhWSnJLT3NzbE4xVDJB?=
 =?utf-8?B?K2ZFYVM4T3J0R3Vqd2xvNzBuS205Q1o3VDN0Y3hjQUlIeGFPTUtpRU1KSTlz?=
 =?utf-8?B?bWMvR1YrbHYwRFZOdlZxUlowT0k5TWhHYkNQa1B3WUwyK3V4Y3I2Y2U3WmR0?=
 =?utf-8?B?ZFRqaEtjdGtMT2VDTEViUVpMR0lUT2grN2toZ0RLanEraUhmYjJXWis2T3J0?=
 =?utf-8?B?TkhIdWl3QlAyUkp2Z2E3dDM3bTJ1TDJjVm1waWxiS3ZLT1pCSTNpbnQ2emxN?=
 =?utf-8?B?SFRmLzJUbVVOMFNUTEtDWDRlRi8rb05PUUlwN0JWdmpwakxDUzNCWXpGTEZu?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe7cb59-44c5-49b9-d41c-08dce3c51a1b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 16:04:46.6892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnnA1uApMOrTrjEfxAF+A6LprGIcgh5wZ9ppYGxTqJDiZW2YnahV5bDZAff8BB2aHGuk5NxuKr0pWlFChqrVok85eINn0DccVMjVnR53o64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6806

Hi Julien,


On 01/10/2024 12:46, Julien Grall wrote:
> Hi,
>
> On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>
>> Change the handling of SiP SMC calls to be more generic,
>> instead of directly relying on the `platform_smc()` callback
>> implementation.
>>
>> Try to handle the SiP SMC first through the `platform_smc()`
>> callback (if implemented). If not handled, check if the
>> SCMI layer is available and that the SMC is a valid SCMI
>> message. Handle it then within the SCMI layer which forwards
>> it to EL3 FW, only if the SMC comes from Dom0.
>
> NIT: I would remove the last sentence as this is implementation details. But if you want to keep it, then s/Dom0/Hardware domain/

Agree, I'll remove it.

>
>
>>
>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> ---
>>   xen/arch/arm/vsmc.c | 19 ++++++++++++++++++-
>>   1 file changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
>> index 7f2f5eb9ce..0de194a132 100644
>> --- a/xen/arch/arm/vsmc.c
>> +++ b/xen/arch/arm/vsmc.c
>> @@ -14,6 +14,7 @@
>>   #include <asm/cpufeature.h>
>>   #include <asm/monitor.h>
>>   #include <asm/regs.h>
>> +#include <asm/scmi-smc.h>
>>   #include <asm/smccc.h>
>>   #include <asm/tee/ffa.h>
>>   #include <asm/tee/tee.h>
>> @@ -224,6 +225,22 @@ static bool handle_sssc(struct cpu_user_regs *regs)
>>       }
>>   }
>>   +/* Secure Calls defined by the Silicon Provider (SiP) */
>> +static bool handle_sip(struct cpu_user_regs *regs)
>> +{
>> +    uint32_t fid = (uint32_t)get_user_reg(regs, 0);
>> +
>> +    /* Firstly, let each platform define custom handling for these SMCs */
>> +    if ( platform_smc(regs) )
>> +        return true;
>> +
>> +    /* Otherwise, if valid SCMI SMC, forward the call to EL3 */
>
> This comment is likely going to stale. This is up to smci_handle_smc() to decide what to do. So I would remove this comment.

I'll remove this, since the behaviour is up to the SCMI SMC layer.

>
>
> With that:
>
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks for the review.

>
> Cheers,
>

Regards,
Andrei C


