Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KjxMcJNvGkXwwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 20:25:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2706F2D1A36
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 20:25:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257524.1551902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Iz4-0004u1-5t; Thu, 19 Mar 2026 19:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257524.1551902; Thu, 19 Mar 2026 19:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Iz4-0004sZ-2z; Thu, 19 Mar 2026 19:24:42 +0000
Received: by outflank-mailman (input) for mailman id 1257524;
 Thu, 19 Mar 2026 19:24:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAdu=BT=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w3Iz1-0004sT-SB
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 19:24:39 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43da2881-23c9-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 20:24:37 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV5PR03MB8410.namprd03.prod.outlook.com (2603:10b6:408:35c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 19:24:32 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 19:24:32 +0000
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
X-Inumbo-ID: 43da2881-23c9-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcYLPzlPNXai1X7CHKV6y94SS4mwqnUBt52ymx/PqXO/uNG3ooluQtqi031nzHaaC/nF2/5woLTS2pcrFqEAt8aPU/GLuOUKTo8fpxfhB150KoZ/jh0GuA/6ZmB3i6SZRbNkfTszf7GFiFM2SJjoqo/7DO7gc3nrLzt2DTRb6Afqw/xDzpo4noYhf6r3W/3I59JLNADLsxKjpP8mqYnu2vq/44+5x5/bUUazH5LlcPXIEZyoYesnynuRDXZoYxZ//0PwL8ECJDQ9PPB96xwsU13muuLO0LExCOsI8iCplZupGSbJqofZpjlxx3ReLF/3MzMDRhNPJjV5/iaAEbrpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnfoQD1iOxBQgVgIwHYtmITVbhRM6K62GUJs5V3R8iI=;
 b=meE3YT7WC5GTQXNbv7ioK7T5Gaa1/A6Ue8ZkGb2edTCKCkyapm4k8d8bDFCrb39s43TzrBWC2CM/OezbX9J5o50zNGIAVkGsEvmT0HlnwRu0VJvKZrhvlu5ZcTtSChNFitPm2/dHYoWLwYI7W/rc4BWFEW10an7cMFaF/O5kGHPxejajd7O0Uppgjd5q3RqMNzOqWvkf8FqP5X5dmebMuEHusr3oWO9qXJQA5nWmdl4Txbp4pRtXzOUAexUEcVwBztvFakS58U2rqMZYhFMlUq2jePEaN8Vn2bMMVnn091ep5QCWpTq6p00DKiUdGZh18Q4kkrK9AkMk2r1VK2V+kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnfoQD1iOxBQgVgIwHYtmITVbhRM6K62GUJs5V3R8iI=;
 b=NVN9UKAMSvuljDB1CNtqsmRLDfIyt9U4dat1WEpLLyq/iDL2ZiZcdyMbk+nX7QzLv7tNwyQuF/A82FIaHJxRppyXuo6bA4y2kug9+1SoIzO/5FNlkOqEniZH06IRreSdBRTGmU8i1H8grGTRt0kAl3AKis7g/h5udWHPXA48SO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c8f1cb30-d883-44a3-90d1-f3f07bc59f4e@citrix.com>
Date: Thu, 19 Mar 2026 19:24:29 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v1 5/8] x86: Remove fully_eager_fpu
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-6-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260319132924.1469809-6-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0139.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV5PR03MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf368ce-73b2-41ce-bdaa-08de85ed25d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	WJo2dleQ1RYnynMExco5tP26SAUBmVXiaFw1272Y2E1gHOLxeN7zXth7OMu6GTJPHqtfaFn/0H3uT2VfGFDrzE29Q8lgeaqX6WzOlAUUu0hVKU00eWmBfyivZWlfddXcZEYqcW1T64oowF58w+wjnD5P36z+WhY82vs8nTFlCon2DyH4FiTG+Vo++n0bIdIcXJQ/1jFtbbzsRdnglX91cE/BYO9FTc4HSAVIwr88+k1s2NmSuGlf2nv9w9xPSE4QavrDDfTPpaefepDnbHvdTDFzD37L8gCqmSMeSQ1AWGMoQUUSfD7qQkqUKhlzfoIV0NLQIyBU8ZFw27q7T5CsGHw7skWvpinFt4FMcmrqlz/di+9be2CS20bht0Fj00Mwfr+zkdy+58VKvuNjnjlD9zRplewTRcREb/Cs+ORfGzahmdoSFHrV3fpHiv/w5ibyR7B8g33ywuTANXSVgq14JmUgezV8gkPESN6QgzQWxZcbzf2guEHIO7NkHP0IdTXxfbJvxj6i1rIXpT5T2kaRRGxBl0WeOSXlpBHAHmAsGqwPK/OAwcF2dJnr7IzLFvHVtTcKZKRxDkmbjQ9dml8VIK58bINw3ru/mdVrIV7PKOEIlx38syTSTR84EftIZPDVnpfktlPdXIsb9P1KY2lVuyqf+g5mtoTRAiSHNj7TlR/HfMg9hKejbfFq2gNXAj/jtP8xaTYlcfBlFv/NWZ8M5kiPIzUM7T9TsEzyppfDW0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGE4VzBmb3dqaUd0a3JvY05kRUY5am5pUlQ1Q2IveFljZjB1czNkcGdEa1ow?=
 =?utf-8?B?VEQ4dWpZTFZMSmprN0MwSjJzQzI0d1hlU3A5bXVuUEJtRkhrSzdwVTZnSGth?=
 =?utf-8?B?SG1XcC9yMG53dysxWnBxYlk4ZDArMmtiaUJUeXcrMnJja2ZYdUNZK0tYTmdj?=
 =?utf-8?B?VkpSS212TVlKYW0rai9XNGJBUUQ5dWlJZytkdXVqVkphN3pDWHJseDV6SmhQ?=
 =?utf-8?B?WkhuaXA5YWQwd3VOdnJwVnFSZnZuSDA1Q0RIeFFoYnM2RWhJNlpsNXE5Mkpx?=
 =?utf-8?B?V0hTY0pYUURKbzMwL3BjK0MyYXIxeDRRWi9FQUdVQ2paYjlCNW9ObmpZMnJm?=
 =?utf-8?B?U005ME90OHp5dmlSZnNZRlpCWTE0UGIwZGg4YWRSZkhTYWU3cjdqWm5tK1J4?=
 =?utf-8?B?M1FBMVZYenNXU24xWmJ6SGVDVVA2QWNkMXZrSGtMenZLMFhpZkJTeXZBZ0xO?=
 =?utf-8?B?c1doei9QekdzVDBnenUvckdPSzVPVGpHVmlVUWUwdGtrRmloZVRHZmFMakxo?=
 =?utf-8?B?MktCQVpPWkRsYW9KdnNFd3VJSE1SUUlMb1ZWUGMyamh4TnBqSHZ2RjE3eEdL?=
 =?utf-8?B?dUMrYURtb05zOWU5SUx2b2JuSFJ1QWd0eEpjUHFnb2RWWFJUQThJQ3lEV2RP?=
 =?utf-8?B?QzhzOC9VQVIvb1FDbUtkRnJBWnliN0tLMjZlcDhqWFljQVJsZk1LQ3V5YVhR?=
 =?utf-8?B?MXlCSGhhZzRBOUlNT3p2Vm9nUnZFYzBwVWMwYnR6Nk55V3czWjNPQ2VlaWQv?=
 =?utf-8?B?VDY1eDYrRVRJU3RSenhTODVaMWUzc1ZCbkM2bU9CZnZIQisxcVNkOW5KU0Uv?=
 =?utf-8?B?OGdtWVN1ZXNpOHZ3QjVRcEtPZDNLWEVRVEFCMW1QSkN0QnNXWDNwRWw0TWY1?=
 =?utf-8?B?UWM5VGNMeE52NVZ1QjhvVnQyYjA1ZVF1a0dURXZabjB3TDlwNVFvTUJUbDlD?=
 =?utf-8?B?VTlYQTBvNzM2S2JWcEhvQjRLZmRIVmo3ajRxZzdESjhacXR2QVl6TW9uTVRS?=
 =?utf-8?B?Wm1UQWRlSWxKMFF6VWZMMHR4cElXS25uVW10WXoxandQVlZwQzY4Y3RrekpK?=
 =?utf-8?B?bVV3N1BUNmJ3TW91d1BtYUJNSDFaU3FvSkdPMUk5bDhjWHJGN1VheUtUbDRN?=
 =?utf-8?B?clNSM0R5NEh5MnJvazlucmhySS9hQ1J5RXA4cnBhczNQU1BOMDU1bXpndDh6?=
 =?utf-8?B?MGZvc05NZVpKVHBUdVd0OG9rK1FFVEt3QWZ0NHhDZjhIWlFrZzFGQ0FQZW5a?=
 =?utf-8?B?NURERkpycjlxYjdMcFlJSTVnc2FtNitTaFZGRFRueE1sOEkzd1JOS09VbUsz?=
 =?utf-8?B?RGV3S3BFVTZOc0JLM0FYOVZWV3pyTnZXTklUOUFObDM5NzIreUNHbnNERExw?=
 =?utf-8?B?WU1iM2luaytOK0VLV3Y4bWU5NGFwZkU0UEN0NmVCSWNzRW4xN2dDM3dVZTU3?=
 =?utf-8?B?TlU3OUYrUjdWZ3NyZ1REY0w3VDRNcHY4bGdjbFhKeDNCU3BjejEya1N1czFm?=
 =?utf-8?B?a0FNcUdaTXRaN2ppanl4OTJpOU1yMGdvYjlySkg1Y1dtdXcxZmRnUU1hWGlj?=
 =?utf-8?B?V1hUa1Q0VjJjUXplN1MzMXE4eExQbCtUempWQ29xWmYrKytxU29vallCVXRl?=
 =?utf-8?B?b0RCU055Qm5Qd0pRVUN6M3NxRzZ4S29rME5EbVNBZHNWRjFkZzJVanowRTRs?=
 =?utf-8?B?VlZNVUFjZm5BKzlIMUpVeHkydnNiM2NnQ3NJMi8xbStud04wR2ZxUW9CbzR3?=
 =?utf-8?B?bktIb01YeTY2dlhEZFNRazFLTWhOcUxtYkpzVWZjVTBIT2lpVWF0RGxiOGdo?=
 =?utf-8?B?ZVBvaDBFdk9QeE5FbWxLeWNvcXpZK1BXZEdHVWpPZlVHWUJHVDVSZWhzYzBU?=
 =?utf-8?B?L0VCL1dKUTRFQmRCNEpIazV6a2hDNzhYZGNKdGVmejRPTm1aYzc4WCs0SzRh?=
 =?utf-8?B?ZzlkTlQ3V2x1TUF2NFJaL0QyRWJrKzQ2Z2l4Z2NRSFRzV2RwckgzUlhaOFA2?=
 =?utf-8?B?VjEwNmZzOHh2bSt6WTFPM3oxdjdOTWVGYzNSWXhQVUdUYi93bC9penQzbHVE?=
 =?utf-8?B?MGhDSmFNNUtYT2UrZ2Y3VVM1QUJ5ZHNYZGdkMVJqMDFPVHl5alFXcE5UVThN?=
 =?utf-8?B?NHk5alRncGwzdllEVTIxV3hoeWNmZkNBTzN2YUt0WnNVREZocHBpVnRVV0pY?=
 =?utf-8?B?MjZqeEMvc2VqUEpMR0xpUWdoQ1lXaFBCWEVEVEorVzBvc2xUd3MwRGtYUDBw?=
 =?utf-8?B?U1NQeGRHdWxCZFBtTmRtczM2QXVEMmhUUzBzQS9mV2xtZk9GLy85VGI1ZUFu?=
 =?utf-8?B?Z0VzdHF4aXk2YlFueFI1ZzFvdXRZWGhvSW1JbkNFTUVvS2N6eHJrb3NCcTU4?=
 =?utf-8?Q?SEWTWOajfNQkuxY4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf368ce-73b2-41ce-bdaa-08de85ed25d3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 19:24:32.5083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXJvlenMJa7XL5dcJCbH9immtsdpE2ipSziE6x2qLKn3YwEqSs7DE4UppkC1+04+fYTAxJtN8naFkDS2Qml3I28SRUU5+AGJm7zmxezhmiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8410
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2706F2D1A36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 1:29 pm, Ross Lagerwall wrote:
> Since fully_eager_fpu is always true, remove it and adjust the code
> accordingly. At the same time, rename vcpu_restore_fpu_nonlazy since it
> always does the full restore.
>
> No functional change intended.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

