Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGy3CvhLzmmjmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:59:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C6A388021
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271689.1559767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Fl1-0004z6-1R; Thu, 02 Apr 2026 10:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271689.1559767; Thu, 02 Apr 2026 10:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Fl0-0004wa-Uk; Thu, 02 Apr 2026 10:58:38 +0000
Received: by outflank-mailman (input) for mailman id 1271689;
 Thu, 02 Apr 2026 10:58:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w8Fkz-0004wS-Dl
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:58:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8Fky-00Elor-Pq
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:58:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69ce4bdc-e002-0a2a0a5209dd-0a2a4505e04e-4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:58:36 +0200
Received: from [52.101.57.54]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69ce4bdb-3760-0a2a45050019-3465393631f5-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:58:36 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA1PR03MB6561.namprd03.prod.outlook.com (2603:10b6:806:1c8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Thu, 2 Apr
 2026 10:58:33 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 10:58:33 +0000
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
 b=qC//zhSQK2leDfGDXoltnTpMVYUbDYPhl9CN5C77LwGur3HtDNsstCwccpDNvaPoOLStsC7HyAS2Vr5J+jUAEFuML7fbI9XekAT4uCG0/eosygYzFISmMZeRyBoW76ebA2KEbMNDQPj+lNX6a7HuIcEo4nTE/LkT7fGPB12E0VsFCp98wVPyRqLCadA1r8wKxx1o87aqFIGhp6xL7of4cW9obKBDt3HO9j+qfxFGyxDkUdceAGITa8/RWB+riaQISOcxLEa0byb4IZqNJP8lGMv5uVAuAgrNmKRgZKSC/Z0pdr1xOVCwOxsmVEHjeUJOs4VobGg46W7MhCLf2KeaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPgkq20skk4tn02oyEvhIipQf9VMYMraeaVg31hkWY4=;
 b=jrGitfEKlgI4WTsJnULrf0iAwuvp4CDV60Ug3uxGouRU1d4iM4dCG+q3xagegy74/vxqR3z5pCDqBlgwq1mlPpMOB0SNZZmtS/gfEYY0eAAMkcfkV+Ao+sfdt3QBtkw3faAPEJrAdwRSLUI9Av58HfyI3oMhSjUcYHRgzHZdB4SjJGksdKt1l12MHCYSF0Q1+0bqGHm+lcJ1k1+4L2rvIYAIhjy0VVNiQL9myLXp6+pw0u4GKPYaXGih5atYI0W8dzZdgPHuBwZ0CKM+hVuPaEo3EGm2CtNgVs0sy3IenslFCndVbOCY6xZDozUDYGJT6XQ5/M+wr5jQXNaPFDc67w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPgkq20skk4tn02oyEvhIipQf9VMYMraeaVg31hkWY4=;
 b=eXZv0KrWbI5Eni9sEVncnqL9AFzbAPB8HIg3z/nXywk3vFLGyWTXfu97OWw596mewH8fo5DA8zkQdTA5x21k54V6bdt0L+a+q9lACk7wBM3QCcNIpf3IN/cFk/NpcQVGFwB4jxXTgfRvvuNQ3JwZEo3kDjxtYgM97liVHrH1sFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <834d60b8-fec5-42ce-a6ab-a26ea9452ed2@citrix.com>
Date: Thu, 2 Apr 2026 11:57:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] Lockless SMP function call and TLB flushing
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
 <94b2e444-844a-4d34-9c9f-de0b9e6e23b1@suse.com>
 <17c4e7b4-297a-4bf9-9160-659723d15e48@citrix.com>
 <b0f721a9-42ba-4e71-8250-83fcfcec2313@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <b0f721a9-42ba-4e71-8250-83fcfcec2313@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0044.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::20) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA1PR03MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: 5316b0d0-eae1-400f-e99f-08de90a6c7f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	sfyhxYSfitjN5xUQ4QlSa9JbQgsorIsvt0ixR6njkGI+2kOa3zhVg/JgDGzqVPW1aPDkTHI8wfUJJc5LqrASMopx0P2twDRNdLxFytlwtBsSGO0JxKM5QVOBCgYTnXkRvbHT8P36PyAHIQUAjWDqVZn4WuGnTdSlWRCZENU6pOEkNBCRXRNq+lHVFICh7UOEz3m81OyFUryhl/IpU9OsY87rA523v9aM/DdBRJB3KABexRgExIfqh/05nWQWfROlCO9+nR+2ryZ6X2TpJqOgCGVFDAbX2HeYanC288M6vrG3Ld/a7SOHdEMuTnQ9k1wXGHtzVwOr6lz0ik3NFuRiWDxDRic2GtVBXEZTrdIEskZknjIKjFhf9aViBv85bUjbDMVp0Wqw35q5vQO35fvL9ar56Lo/HXMV//ET7PET81E/WhIs7IetHPJdbf8dmfLQuKWuzfiVn+6mhyoswW2yoPs7N2Il98Vz4RqWWiQQBLQcOW3Newl/SB0oeWnETAJy7qr3JBNJgqnWt0SZkKpKGngkkS9dr7dCjBjsMXsCjaHjFOdDPayCf92sEaLNdf/H4Y6NQ3wCHAKhMUJ710ebv66Rixj+mRuph3gZXZsyTbrU90wiEvpORrwJGG7zNUx3hsRVEtv2ka5XYRmKzZJVe3DAlqWp7L2HF8C6SWQBjZKLa5eoczW37N8czetjhPmmUAoL+onA48Jo8s+wo5gh5QF1kLSdA9E3IngCR4D9E5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFIxQUhLSnhvbnQxTFNZNDJJa3NkNXl0VzZiak9KWXVmTVB1RkJCWk5NbU9J?=
 =?utf-8?B?K1J5OGtnNkJTTHJSK3lqWndEeUM0cDRHa3hJSjBKejhTdFNxZTBHSTJDV0Nz?=
 =?utf-8?B?VnQrV05UNXU5M011TWF1ZkxJSVU3U0lGaXliL0Z2N3g3cUFaUTFXWGZZQkxP?=
 =?utf-8?B?Zk9rVTE1VXFnSFFtTGNTQUZhWG5tSGJTaWU1ZGRWUHJtUkh1RUM3TUw4MGwz?=
 =?utf-8?B?Q1BhWGlUdE8ySk9MSHJJWndSMVRpYVNYc3lUMldHeStOWWhMcitGaG1aNFZk?=
 =?utf-8?B?K2ErUmhWK2hHY2FObys0OHhmVEpKTHBId21oTGJTcFAzWWhCNEllNk1UWWNI?=
 =?utf-8?B?TEJmL1dqVGY5TmVFL0RUcGd4aldkT2pyNVdQUk9VcVM4ZjRJT2hTdk4vN3d4?=
 =?utf-8?B?UjdRQnJkNlBwN1dVSFVET0ZheXRMMUhFcHlkcEhQeXpkUERLeXZIaGZsaTFU?=
 =?utf-8?B?UzZXWnZTOVkxa2FsV0toTS8ySGJlZ3NrelRhSFJCdzVYVVF1bEZkdDU2c1BW?=
 =?utf-8?B?dXJzdzJ4Q0dRRE56VVNtejVYUzBFUk90UjcydTVGNjhyZHordXVGcWR5cFZk?=
 =?utf-8?B?VHMzeXVlNnhONEE0Nzh5dXNXOXdlVSt4S0R5VXBCUytob0hIdEdLNk9RZWVZ?=
 =?utf-8?B?cmZzK2xDWEIyUUdkTkZaNTVXNEhrck1RMWR2TWZqb1JjbG8zd1VDR0lubWZI?=
 =?utf-8?B?UlAzN0FoWlAvRUZxWTFHMmc1dnkzc1VoT1dkTUZZdGJQdUxBQm0zUG9QYlBW?=
 =?utf-8?B?ck9CQkpWUHFrYVdGQzAwZCtUNS9vWFNhU3Y2R3ZiMHNxRG82SHZEeG1hc3kx?=
 =?utf-8?B?aXl0WWptVW1TM1d0b2ExUDEwcVhhNExiU1lydldZYUx2VHkvdUwzL0pPbFlz?=
 =?utf-8?B?YWNwd0pndjRIUTBIenlhV05WNDFveWdVTXhOMmFVQUVjNkRMR2EvL1NxQjRj?=
 =?utf-8?B?MGxWSWdqVWRQNWw2YXU2c0hwQ2FaNnV5NjFERzU0OGF2RFNmemk3VjZWcmpK?=
 =?utf-8?B?REVvYllNNWdCL3h4RzF5ZWNjZ29tUnZ6NmhIRUdPUWhOazIxcGFEcWdPZGFP?=
 =?utf-8?B?MXltRk9NdVBjcTY3QWxWdUVvOXlWWCsrN3Q1MUNLeTVBN3JRUGlHbjVnYUwx?=
 =?utf-8?B?NHhTYnExbG8zQ3VadnZuNU9pQW5YeC8wZnllandaVkI3Um9PUCtUKzRzdWs0?=
 =?utf-8?B?K2sxK1hTaGlyY1NpTS9xem1ka0w5N3BDdC9tcmszdmxGTGRpUlQrVEtKR0Y3?=
 =?utf-8?B?UkMwL2gwOHJLR2l6Q0Jld3JxaGsyQnJPMEl1SnJnNFFMNmxUQ21wNzVYUm1Q?=
 =?utf-8?B?OUpSTzRUUEMyWEhvUXVKZVllVkF2RGZ6QjdOck4ycll6QTM0OGNBVXpjeDVG?=
 =?utf-8?B?R2w2WFVENTNGZXZMUC9MZmJyeVBjaUZ1OU45OE5xU1BuWnpjL1QxTUMrV3Nn?=
 =?utf-8?B?NE9lQm9FMll1SnFiZW1kMXVSRFByYjNvWDh5aHBkTU1qNzJZdkNtQUgvSlhH?=
 =?utf-8?B?cHcxbEQvOHJlOFkvL2pZemJRcXk3NkMwOWlIZ2pLNXZsLzNyV0FkQzJyKzRX?=
 =?utf-8?B?cjVNUW44S0ZQUm45WXJTUGhXc1p3K1ZMOFkvYWVBSGhvL0g3Y2xneDJFeGwr?=
 =?utf-8?B?UTJDbTVIbHRNUVY1RDNaRm56VE9FWFVKRTZsY0t1N0RJUzRuU0hhcXFqQVNt?=
 =?utf-8?B?dElFVTRwUGtSQjJUcjZ6OUdMS0tYVkQ4WFJxc3NZKy9rYmxGb0ZHOHNWL1pK?=
 =?utf-8?B?dUtuN1pZVTRTTGx1d0FwcTFkNXNFUVlMdmVMejRMelpWMkpmR29aODNJZzRw?=
 =?utf-8?B?QjcyTkZYVEhrMytJQ05CMkdVSU5mZ29qUHFaMGhnMVQ4b09XeFZFK0FYMC9y?=
 =?utf-8?B?SkVieHZpVmJGcUNPTFpzV2pGSDFPNlV0R3R0L0IvZi9JbGxhRXd4R0I3TDNi?=
 =?utf-8?B?YzFmRWNjdnRXNm9OdklCSlcwTjJyQXhLdVRGNEtRcXdzR0M2MDBaNy9tSmdp?=
 =?utf-8?B?bDV0MS9adUg3NkFEK2Y0ci95R2Irc0ppVTVxOWR2b1dPUTNzeDJzL2p0L3Jx?=
 =?utf-8?B?aHdianZFWUwyQ1psdzc4ZmpFZWJObHF2dkFBYm9wakNrWExlbjQ2dDYxekxB?=
 =?utf-8?B?eXRNMVNZZHdDd1F0Y0xFS1BMejU3aE9PYTFERXdKNWtCVG5nS0taNkdpTzE5?=
 =?utf-8?B?VU1UZkRIdzA2MFBod3hEdys2SmRYUGR5SVovSEVkL3o5VEZTSGJuVzQrQUc4?=
 =?utf-8?B?ekxrMUQrVHdhQ2xHRUpjVDE0a2JTUDNyN2hiSEdiK3Q3ZjlzNk1Cc1RoUkZm?=
 =?utf-8?B?UHh2eUxtK2wwa1Nndk5qWWZUVWdHS2YxRGlvVlBTNUpwY1pSOC9JcjdiSVRy?=
 =?utf-8?Q?I+7l+9eH4BYatM0E=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5316b0d0-eae1-400f-e99f-08de90a6c7f6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 10:58:32.8967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqPnKaISJ4BqCdY9UGZkQ9uzmAtFM/a5d89AbSOnZBhJ0WcAXVtj5CfVIWe4kb50UciyyfcLSDqFtYF7xUvzrs6NAP/wZsAe+pHZbS+Siq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6561
X-purgate-ID: tlsNG-c201ff/1775127516-31B3896F-3A20B97D/0/0
X-purgate-type: clean
X-purgate-size: 3383
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 84C6A388021
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 9:49 AM, Jan Beulich wrote:
> On 02.04.2026 10:40, Ross Lagerwall wrote:
>> On 4/2/26 7:09 AM, Jan Beulich wrote:
>>> On 01.04.2026 18:35, Ross Lagerwall wrote:
>>>> We have observed that the TLB flush lock can be a point of contention for
>>>> certain workloads, e.g. migrating 10 VMs off a host during a host evacuation.
>>>>
>>>> Performance numbers:
>>>>
>>>> I wrote a synthetic benchmark to measure the performance. The benchmark has one
>>>> or more CPUs in Xen calling on_selected_cpus() with between 1 and 64 CPUs in
>>>> the selected mask. The executed function simply delays for 500 microseconds.
>>>>
>>>> The table below shows the % change in execution time of on_selected_cpus():
>>>>
>>>>                     1 thread   2 threads    4 threads
>>>> 1 CPU in mask     0.02       -35.23       -51.18
>>>> 2 CPUs in mask    0.01       -47.20       -69.27
>>>> 4 CPUs in mask    -0.02      -42.40       -66.55
>>>> 8 CPUs in mask    -0.03      -47.82       -68.39
>>>> 16 CPUs in mask   0.12       -41.95       -58.26
>>>> 32 CPUs in mask   0.02       -25.43       -39.35
>>>> 64 CPUs in mask   0.00       -24.70       -37.83
>>>>
>>>> With 1 thread (i.e. no contention), there is no regression in execution time.
>>>> With multiple threads, as expected there is a significant improvement in
>>>> execution time.
>>>>
>>>> As a more practical benchmark to simulate host evacuation, I measured the
>>>> memory dirtying rate across 10 VMs after enabling log dirty (on an AMD system,
>>>> so without PML). The rate increased by 16% with this patch series, even
>>>> after the recent deferred TLB flush changes.
>>>
>>> Is this a positive thing though? In the context of some related work something
>>> similar was mentioned iirc, accompanied by stating that this is actually
>>> problematic. A guest in log-dirty mode generally wants to be making progress,
>>> but also wants to be throttled enough to limit re-dirtying, such that
>>> subsequent iterations (in particular the final one) of page contents
>>> migration won't have to process overly many pages a 2nd time.
>>
>> In the context of a real migration, both the process copying the pages
>> out of the guest and the guest itself will be hitting the TLB flush lock
>> so reducing that bottleneck may increase throughput on both sides.
>> Whether or not the overall migration time increases or decreases depends
>> on many factors (number of migrations in parallel, the rate the guest is
>> dirtying memory, the line speed of the NIC, whether PML is used, ...)
>> which is why I measured a more controlled scenario to demonstrate the
>> change.
>>
>> IMO throttling of a guest during a migration should be something
>> intentional and controlled by userspace policy rather than a side effect
>> of some internal global locks.
> 
> I definitely agree here, but side effects going away may make it necessary to
> add such explicit throttling.
> 

Explicit throttling is much more important for the already existing
case of Intel systems with PML. With log dirty enabled, a VM on an Intel
system can dirty memory an order of magnitude faster than an AMD system
without PML.

As an aside, for the same test an Intel machine without PML is still a
lot faster than AMD so there is probably something to improve in this
area for AMD machines.

Ross

