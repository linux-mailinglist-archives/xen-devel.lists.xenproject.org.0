Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG/RAjkxEGoaUwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:34:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8AF5B232A
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:34:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316608.1585994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQNCq-0007at-B6; Fri, 22 May 2026 10:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316608.1585994; Fri, 22 May 2026 10:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQNCq-0007YW-8C; Fri, 22 May 2026 10:34:16 +0000
Received: by outflank-mailman (input) for mailman id 1316608;
 Fri, 22 May 2026 10:34:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wQNCp-0007YD-9c
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 10:34:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQNCo-006tES-Lh
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:34:14 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a10311f-2eae-0a2a0a5409dd-0a2a45039d06-26
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:34:14 +0200
Received: from [52.101.52.40]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a103125-672d-0a2a45030019-34653428222b-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:34:14 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH8PR03MB8228.namprd03.prod.outlook.com (2603:10b6:610:2bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 10:34:11 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 10:34:11 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViO5Dxn0UlvchHRZOxoGOW2g0yR0f//4pYN8UcPtkGNHSCgl262do/uNonnbuFvGEE1k3OZXF7zok53IFbhNPYBIdw3cUlbWbAkEl+Clb8XV+NzELokx+kbTKNGIA+OaRMwNVVqmfIvpGAyB2ziD2omOYeBLSMoHjpUNt2Tup0PRP3S/dWF4cpdqmf7TmHOEf97T0pvVgMQXuWQeNkDspmAT1JihnezdYphm/7z4/JOrf4gMOELg+mPqb+LSve+qv+3DEHPFoOGTm6FCTT+aD2eHlTNqN0uNF9rwB2/NERahnL87LvTnANkRH2kWizNm0XR2ZppFO4BBJVAyZmTunw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R649cwk1MfjMUCzx7wjruhZ/AZOsslmqxJwS167XBI0=;
 b=kuzfu3cVKnaQbaRViqTl4PmrfnHJKINrKwa+WXJWtQRHswuG5oT5KeIaFVpMDKvqYA/mhqrs681W4/lQ9lwsNCqr0ms6g6XfvfdewU5hJ6HbD+Tupn2IA43GJakfGkaGICqjQCjewrTryoR38U8SSz68bhXbz5s+4689w+NoAl/vk+YFNcaRoNokh5t8MmPrZUXSz8WmWsYr8HB72Rp97EjRieHrE9VlbC9810wcFtjPnqoLn2nbW8yVV+gJ7L/fFflMW8lOUxfd0qTqzuq967ZaJwol/95uroTXAkIVVQSdTKHR6EsQn9W9ZYDHTMbW8K9pkpMR/eIF9EBJzEmm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R649cwk1MfjMUCzx7wjruhZ/AZOsslmqxJwS167XBI0=;
 b=U0EJed1rkNFIKSq6Ga1L8OOBgrbFnwmwQ7aIi9qBqvsHDQst6lmDDaRgqMgwVCbzfe27Y6f3nMMYnJOQxGU3CkL3O7HSTFSocOVjw5/MGaCLJ58z/s3jkIQnqgDqwjc2EXMcefRzYZ7bDkhwwgOU2VAudL+if+F7I6/H479b2fA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a51495c3-3549-4ea4-afd0-0a8ea0e80ba7@citrix.com>
Date: Fri, 22 May 2026 11:34:07 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] crypto/vmac: adjust for Misra C:2012 rule 17.5
To: Jan Beulich <jbeulich@suse.com>
References: <036752dc-5333-4d01-acaf-ed450e09fe48@suse.com>
 <7ef99f0e-2847-49d8-8701-8243e4b073ed@citrix.com>
 <1019524f-bbe0-46b3-b742-d7404732bc66@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1019524f-bbe0-46b3-b742-d7404732bc66@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0168.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH8PR03MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: 902e26dc-0b1c-4ab1-9ed3-08deb7eda95b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	vBr9Opm90AFXlb3Qxbe79rlpuUR2aTk7btqH8kiSh1D4wJrkZEuXCMjDs55bElU7EzcL5vXYhe8xE4+Nm37iFI5fmKKfOe7k+tOVGSt41op4XmB7eLBeb2zUhhi2a+9DEiv9g8GjaFbqyAneSO/KUYxDg3Ee5dLqoU060YTZHTGISDssdE9IHwwR2HGBb3eareXCHQ7odtjJeMSPzmb29D+4okJDuase67UmgGd051BsYjrczWhNh0CRnhdT4Wm47wVYmt03U1ZG6J9jiojgcFZzQcAiqBE67gpGuOIOO/BQad7iJR2aPqpRTTPJWejEHR8rERJ/TNEZcjrS3iXuooefGQAJixTftc8DUqpSzn+2asVPYG8f0L2TK/EjGudtdvxvlAK9YWoxIp1CB11AKYqW208oZPlMuR7L94LwrBgWeh7oBT68RTZL3EAGuxLzzIusOfaqCJml1iNR2NmRrZD6RFuqX0Oq5Esl1fU3Q+BUj80kFAoOnQTrrDlwRewfsfRC+iCqvXyJ94yflPpWDOS/onVkl8X/Hx+/iVumZp95si20TZmVvTOG9Pt0Na3imV3aH4S0dzBCrUcLbe2a50TY2Vm2HOhb4UVSte+fbYjsnm8WvAnwO/VKve1N8nbkuSa83wkvzMOvv79+KPMgg7z3wEF6V6fNeuDTLYO9PT36PNbfOtnEMnDQsw8I6LLq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003)(11063799006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2RoVTE1UnVRZ2hUWXlHMUc2ZnRBRDRUNWMyQnI4NXJHdDJrUTJKNVE1ajlX?=
 =?utf-8?B?bjhBZGpOUzF1QTNLMnhJYVlON1ZsM2tXTHNRUlhvL1I3a3o1bkZCZ0NKNGZD?=
 =?utf-8?B?a29BUmJCdXRPUjFobVZ0SU5Ed2RqM05kbGFENVR0elNKaW4xQTRFWXBrbFlj?=
 =?utf-8?B?OFMxcHZiYkNHbVA5ZUwvUksxNWFNY25JYUQvd1o5SDdZcUVWTnJISEhtOUNN?=
 =?utf-8?B?aXhRalc3VHVuYjZqUWtXbnFCQ2ZrRWJTUzN0elpXUnduZDVjaUlLakxOdko4?=
 =?utf-8?B?UWQyRU5KK1I3ZDh0NksrK0N3MHZXdVl1aXM0eVJDMm5XOXViU1dQNVVFV3ZD?=
 =?utf-8?B?Z2lxajNEaU9xWnppb2QvMHJubC8zcEJiQWQ1S0tCRkNQWGl6VXlCYmZRNTg3?=
 =?utf-8?B?bERjMWdrc3BTYldsNjVXSVdDeTdzd2pQZU1yaC8rbzg1b3dpSldEdkVjeUZ2?=
 =?utf-8?B?SFhWU0FYK3NKL3JrRXEzZ01kM2d5ZzVlUWtYTE5CTExUYTJUMkFpY3FmT21D?=
 =?utf-8?B?NUd2cER4L1F6Um1NUHk4TTFzSGtkaThHVjJXdEExWlZSRTRvZ09Tem00My9W?=
 =?utf-8?B?SEFEY0Z3ajM3UTJIOFd0MWdMMUVKd0s2aWhqbWwyUjVrWlE0dVJKdSsvUzA2?=
 =?utf-8?B?REN4SG5xZVBOSmJGQXlTK3V6U2FEWUJlUm5RNXRFUkZWb0llSkpUTmROMUZz?=
 =?utf-8?B?NDdKVjRoSFlOM2xJbGR0NExuMHI4VEVWWkFUaHlBbmcvK01TVld1ZHh0SC95?=
 =?utf-8?B?dHlZcGZVa1psNERiY0d5Z1k5SUdWWlUvc3pJQzJtcmlpVTFhS1Q2S1M2c1J1?=
 =?utf-8?B?K2N5S0kzRW9xcnRiOThPZEVrQ0htaVVKWUxTUzhOT3YzS3VhMzNITmNNV09P?=
 =?utf-8?B?di81S2JnVWpmWkhjanJyQm1IQmgwQklJWWY4ZUxSc0o1L2svRVlWTzJTa0pF?=
 =?utf-8?B?OUhEQm13cWtMbENPRFNadXcwVExyYUJ3OTJha2dZM3lSd1BFT1dUdlJZNmtU?=
 =?utf-8?B?MUJ2ZHgvZS9wc2VWNDFaQ096SnVsNElHQUhNd3NPZkR2K2ZTdU44cGZ4OTNk?=
 =?utf-8?B?K3RjUHNqZFQ2R1hmSkw4WXB2RFpibWhPMU5IQVBZNzF3OWUrSjExMCtIYU5I?=
 =?utf-8?B?emd2ZytHQTlKRUMrZG9sS2VXeTZIdVVMM0NZVFJ2QjVaVWI1Z1h6OFpkYUIw?=
 =?utf-8?B?UWVkZ1lzZ2QraGI0RXdEcjZFNEVLOFhBN1BJQS9rSmJ2ZmpGUStBS2svOVBX?=
 =?utf-8?B?UTNnajZIS1JVZUxKTjZmdjRXV09RMmNuNE5YeWFWaVFkRzMxUmRJRmh6NlRE?=
 =?utf-8?B?WXVuRHp2NkpvRUoxMy9oMUJnaXJ6UkxMUUZESWptV1FGQ01PbTFVeEVISXVt?=
 =?utf-8?B?UWM2aVk0L0JWOEhuSTVyVHVDMVlzYnpCZlVFNXhQMVlSQ1lWU3FiMWxuVUNV?=
 =?utf-8?B?ZENZZTByMTRwNzQ4M3RZSE8vY3Y3TEdYRk1UNkVjNGcxZ1YvNHdHK2dWMVRF?=
 =?utf-8?B?QmpXUGl0Mm9LMmFTM3I0Q0RrS3hab0dOdXNLM0FqUmJHTTlsaDBvRzJjRXQz?=
 =?utf-8?B?cWRUcktHWEtyQzI0VC9WOTlXZ0IvYlJrakQwNmpaSE1zeWxjTmlLUVlwSWNj?=
 =?utf-8?B?TkxKNVh4YnAzc0pFYnRSQmtlL0FqcDBMVEk4TzNNSW9uaklmTlJKQ3lKUVYy?=
 =?utf-8?B?d2d3Y3BjMkFPdFpRcVZ0c1kxNEk2b3B2OTJuaGRicWVzeFpmY0JJZTRwZG1u?=
 =?utf-8?B?MzNmUmI1WEg5U3g3MXdhcDlyY3c5WHBYN1VLUHZZYXVpOTUvKzFXQ1d1ZnNB?=
 =?utf-8?B?OS85S1BjRGlWQzF5OFQ4cnlEK0xhTkRZbnFxREtEQkZMNTg0STZLSys2NWN0?=
 =?utf-8?B?Q1JvQXJUVlpmR3h4ck5zSVZodUx5amJNKzdNWXR1ZjJDcGVaTjRmZXJGa0p3?=
 =?utf-8?B?RHBQdHBkcHRFOXNYa3I5MjdMZnRnNXRxaFVmWHU0dkJOOHlyRitwK1FHa014?=
 =?utf-8?B?L28vT1VacTF5WmZOWisybUpDNlBwL0pGdlNyMXMvOXB3Q1R2RXAwSnVyNGR2?=
 =?utf-8?B?YzRzQ2JwWjNWSVlyeG5JcDhpbUczWlpPblRsVnhxeEJqTnZVdU4xcWsvTTlE?=
 =?utf-8?B?am10V2N3bmFNYTN2NzhXL1R5ZGs4Nnh6STNGRGN6S3czUDF1Vlo1OUNhTzFX?=
 =?utf-8?B?ak9jNGd5TkNKdnl2ZzVSZHVmR3U4Y3loK1pLcE5weGpyeGVSTW5UcWh4VkE0?=
 =?utf-8?B?U2ZsbGJiTVUwUnlqM1BkNG9FblZEZXZMbDEzajVLK3B2SDU2VkF1NTE0Zi9T?=
 =?utf-8?B?cE4vWmdPOTlrRWcwRVhKS0F6UnI5T1N4bjRxZFV4TWJzNzRzQkNud0NacGFr?=
 =?utf-8?Q?AKfAG6jUnJO/7UcU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902e26dc-0b1c-4ab1-9ed3-08deb7eda95b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 10:34:11.0445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szKHsSAaGmGLRUOlUgLmpLXNcoXl3M+Z+nzNWOhO6WfYNNo9vHF0BrZo3GLMBJlQk2cv37W4mUKFEtkLaFweJvZEoToq5iXRCImnvUSj49A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8228
X-purgate-ID: tlsNG-33051d/1779446054-37D4B938-371E6521/0/0
X-purgate-type: clean
X-purgate-size: 1394
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6F8AF5B232A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 15/05/2026 7:32 am, Jan Beulich wrote:
> On 14.05.2026 20:07, Andrew Cooper wrote:
>> On 13/05/2026 4:51 pm, Jan Beulich wrote:
>>> ... ("The function argument corresponding to a parameter declared to have
>>> an array type shall have an appropriate number of elements"). Instead of
>>> casts, (ab)use unions.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> The Rule 17.5 violations aren't reported against this function.
> The report is against uses of aes_encryption() from this function.

Oh, that's very well hidden in the report.  Both the top and bottom of
it say rijndaelEncrypt().

> --- a/xen/crypto/vmac.c
> +++ b/xen/crypto/vmac.c
> @@ -926,41 +926,41 @@ uint64_t vmac(unsigned char m[],
>  
>  void vmac_set_key(const unsigned char user_key[], vmac_ctx_t *ctx)
>  {
> -    uint64_t in[2] = {0}, out[2];
> +    union {
> +        uint64_t q[2];
> +        uint8_t b[16];
> +    } in, out;
>      unsigned i;
>      aes_key_setup(user_key, &ctx->cipher_key);
>      
>      /* Fill nh key */
> -    ((unsigned char *)in)[0] = 0x80; 
> +    in = (typeof(in)){ .b[0] = 0x80 };

typeof like this is not good for legibility.

In this case, I'd prefer to keep the "} in = {}, out;" pattern from
before, and this line be a direct translation like the others in the file.

With that, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

