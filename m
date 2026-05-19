Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNj6I5tbDGrMgAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 14:46:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA81F57EF74
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 14:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312954.1583125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPJpT-00063R-OW; Tue, 19 May 2026 12:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312954.1583125; Tue, 19 May 2026 12:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPJpT-00061L-LI; Tue, 19 May 2026 12:45:47 +0000
Received: by outflank-mailman (input) for mailman id 1312954;
 Tue, 19 May 2026 12:45:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wPJpS-00061F-DN
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 12:45:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPJpR-00C2Pc-PP
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 14:45:45 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c5b64-2eae-0a2a0a5409dd-0a2a45048d00-30
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 14:45:45 +0200
Received: from [52.101.61.14]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c5b78-1dec-0a2a45040019-34653d0e98bb-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 14:45:45 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BLAPR03MB5377.namprd03.prod.outlook.com (2603:10b6:208:285::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 12:45:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 12:45:42 +0000
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
 b=XdUpZgJN+yGHlv+5kv6dSetG9HGZA9w9bm0telVLCf0lgpembF5pVlCnGhA3giUywWrSsni04pdck8KtmK0SaB0HU0DNcr71dmP1vITNqGoeryW7dkoq1kC+G+8MFiHB3+VwHn6mbkHWNDo5aWO/I/3b9wfViukfwNqT6PnZ10yk14/NefM9WwV21vcnOfnfq003muOwFAYHGAj1D1GIxbyRKObrpS+IUWHA9Z5Fsph2FUl5Y2HoE1a7kXIqv+pyuv3887gQW1UIBO+nBeJPXLU5xl4Go/cLY6rDxVSbKFqDXpORoehNfDOtmpg+U3S0jIOo5cylEDpsQ9E3ZX4pGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6/vhb/Is7FicYzX1f9wXo/16zxFaX6xyGjfnCdU/DM=;
 b=tI43c5gaIIUpBiHCeCXuw0Nyiv5EAEe4smu8X7G42L1b24G236xpomBYucln3+7+RWXojecu5396N3imP/Rz/TYdI9g5KGS7YSukCQGEvsBfm5yQpH2Hlg8ED0hpmBgJlM7tcZ+Pkkv6lx8DBEI5AysRpbA1q1OLFNVQIBoyrw7avaY7lRA9qUJKY3JZVEscd9/akn+/R+uhpmXubQIL/ZLdiNVedlX+8WEBRLl+gwrezsMXxxGZzW5P0SE0+oYWy9Q4t8Lzz1XmWFZgB8q2dPaamF3E/p4uL5yzlFw+QpHsmU1EsZZzKmBOVukaOxhxqF5X5/gyK3ui3xwDTEh4FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6/vhb/Is7FicYzX1f9wXo/16zxFaX6xyGjfnCdU/DM=;
 b=CBhjPi1NGe7UJYruaFdnlJS9jkpwQD1B0hvHN2ejZ4qxwDgTMY6SfYghUN545RTuau4PdLMQhiaChvS+KkiL17AyLN8uy2qVFT/cEgHcVxSHN2/Vh6MKh0RZ6Tm2j4mUK6sQsZsEmkoCFUKbeVmGLd7b/B7iLNguwdgkhYmNtK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b9088d84-c92d-4b71-9d02-177282221a90@citrix.com>
Date: Tue, 19 May 2026 13:45:37 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, sstabellini@kernel.org,
 julien@xen.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com
Subject: Re: [PATCH v1 1/1] arm64: Fix strrchr() matching of null terminator
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260518234353.453193-1-edgar.iglesias@amd.com>
 <20260518234353.453193-2-edgar.iglesias@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260518234353.453193-2-edgar.iglesias@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0676.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BLAPR03MB5377:EE_
X-MS-Office365-Filtering-Correlation-Id: dc921fda-a1db-4c2a-9146-08deb5a48994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|4143699003|11063799006|22082099003|56012099003|3023799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Zu4pLnDBbnC08kBeNuuU9rNwKVcwoULofLbELHUUhRDA/wgO8gGfA/QyZthO1swWCxX9bCk6DB68mqiB1wWgAzC9FWsr1MEgPrI5PnZ86zlOZ/VH/vpXZZqYsuDVbdr0BSa3ABYDTU0griZRtOs1oGJt2tmlLQmkoSukw1TomYVFDzjuvbhhQFPunafjKm1JhfUTeDKRIIJsl9qFE+fiC4Rq9Q1EQzkjK/xvqsOmNBQd3dH0x9pt4KpqFLAdS49s2GGsFcqYguoS8SZBcdFO/d+TrWyIxVf3eWEeHp4lK0nut1pibfvt9EJ9oH/lhsPxPgsJjQBzi5j97QfqrpZofmvjL+HDv/c47Rlzpq+q0hro9jBvzJAmivPT9x7ygwfwmr9tLLsT/C8Iv04u/wHzsdS+ACUkAhgrh6OC+jLg2lsTNaQwlHlJZX98egQRhge8nLkJ6dmker/gEZNm98+wUIpyKbWmieD9MADobk5KG4SDOZ6SEgXoUtu5wUYkm77Dg5Q79gUKD7f7LXniKVOO8+5nCOFAuoTHscHe5Hvw4FxMcutItIgCTJ4W9ls6dRRNPyknIff/mxhcLmmYawqRFFR/RPznwyUwS/B9tWWs3m4z0rKYaHoDDR46gwPJixJG4QtX0kSssZKiWi6K28f19qJdffuv2pTFLHX5EVJvWr9t96TBBZdXMdV4fGr8jEA6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4143699003)(11063799006)(22082099003)(56012099003)(3023799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0RMLzZLUXlJejEvNEMycUw4dlJaVStsNTd2dFF6VkkvczB3U2U3VU1hRFRQ?=
 =?utf-8?B?RDNoMTNFMnpuVGp3MmtEaWhJT0ZiWTVzeGZCQlF1Wjk5U3BuVVY5MmdqU0xI?=
 =?utf-8?B?ejRxZlpmekxtUjduTkU1TVgzRlQ2K0VEMEg0V25LV0hYbnIvOE9HblBMOW9P?=
 =?utf-8?B?N29ISVNxN2EyWHBMTGcyWU85RDl3YlB0dG1xOTFrcnBwVHdSSVMzRlBldHZv?=
 =?utf-8?B?a3NsNnlpeFBHZG1nTFhJdWlMWnpFdVNGMTJmTWhhcVhRVmxsblV5VkUrMGxi?=
 =?utf-8?B?NC9Iazk0Ukg3cjUzSGpkbWhmYzFCV2RWeDlsMUhIa09rRFY2dS9CeEJoZ1ha?=
 =?utf-8?B?NDRFOFlzaDlEMUlKVHVlZmVSOVhQaDdHeE5USDM5UnF2cTFxUmYyei95TkhN?=
 =?utf-8?B?dC8xSDd1bUwvSldYM0tvYlJSZ2xneHUyVEQrZ0lRand4MjRlV1pIdUtqMVVu?=
 =?utf-8?B?QjFwZTBVZGN2ejgrbFJaMFFjS1hzQUhUT2RMeTNMM1NZMXZLVXN0b2NpcjZz?=
 =?utf-8?B?VlRVdjdNaEZVN2JQdWQ3Q2J5MllHejN1T0wxSnBoTnlOZGgxSmZVRjVKeEtK?=
 =?utf-8?B?V2cwaWkvUnFPRGs3VkovZmFWRFlLalFrZ2FmeU5nNUkzZm5MTk5CdlRKTlJM?=
 =?utf-8?B?Zk5aRHh2czJiS3VIOTJNdWo1NEx3R3hUOUlleEt6OFl6eTVvK0RrNnFqTk0z?=
 =?utf-8?B?UWRZMWpqOWE1dFAwNy9yc2xCKzVUSHAxSURPeDY3L2NTRDc0a05oUlZhTEJ3?=
 =?utf-8?B?TGV6amNqSGJvemRhR1lhOW85WkFEblY3VUwwYTZpVlg1UmpIdUVGM1R4M1NW?=
 =?utf-8?B?YjNDMDJOd0pST3J1QTY2b2tlUVlONkJtcGZEQzd2a3pFRTNXVHUyM0FtK2xw?=
 =?utf-8?B?VG8zdmxXd0dONk1QUlVGNzV2bTFweVcyODFGU2d2bUdSWkd0b3Vmb3NHbUU1?=
 =?utf-8?B?NW9pb3N5Ni83YlNXTVlPZWJPbTRvL3BUakF1MlZqVGJMY0xOS2ZrZkIyTi9T?=
 =?utf-8?B?Z2pzRm0yczkzV1NoOFhQamdhb3lGeWcxaXhZSlExNkR3SlpzNzRNbXovOGRY?=
 =?utf-8?B?SVpRdWpiNDRBRjg0eFNnQlRGbzRFQS9vNDRORGJpb0puOFUxQkplazV6Y1Vh?=
 =?utf-8?B?c2hWczhSc3ZoVDZYMUFTR0dBa1ZMT2VWTzVIbWpRRWZjKzVud2ROZks2TEli?=
 =?utf-8?B?dGg0c3VSVVIydG1BVFBITVhvWTlycVJxNHdhbTVIMTFMWnJBTzd1RDdiY2Jq?=
 =?utf-8?B?WWorNmp1dWZQWVlGSjJBN05Dd1BISEw3OVpkc3R4dkhZMnR6WDlvRHJteTdF?=
 =?utf-8?B?SUY1NlNGbjNvc0JzVXA5MUZyNXoreXZxemxJTTRtRmhSdTZXSGRHUlJVY1VU?=
 =?utf-8?B?OHJZU3BEdHYzcU93TGp5aTJ1RDNqVWVDZVJOQURlWmMxeGF1OGdKQXFEaXJT?=
 =?utf-8?B?VHdrTVJZREQrbzVRTS80ZENWR2dNbVhzUi8vd2kzQTFXdi92TDBPM0RYTEt0?=
 =?utf-8?B?V1N6TDBlSEdDcWpLZDVpY2lVYVJxV1U5R2dWOWNwdEdYNWlnZG9nNnVIV0h3?=
 =?utf-8?B?enoyWk1KMHpsOExrenFhTlZsVXE0YWdPNHJPRkdYanlMS3JzMGprOGNyUnY4?=
 =?utf-8?B?SCtyQzlvcGFENjNha29DVm1xVXFKdWkwT0xlQkQvNGZqQzB3VmgvNExaUm5G?=
 =?utf-8?B?NGVnMmtRSDRqbnc5VG1yd0laTjgyZnRBZjVlSnZQNFBOZW1JS2lvSzVKMkdF?=
 =?utf-8?B?YXlQWTYrRVZ4YjUwUHpYM0U1YktYOGNCcGRyWHdmMklZQjV3RjdFblY0MWdU?=
 =?utf-8?B?ajhkWDV2S2R5VHAxaDRkZzIyU2JJVG1TUzRPekx1Y0s3Ync4cHFwdFNZTEhP?=
 =?utf-8?B?MTlRZlludHFyVklZTHNzRE5UNzlJK3oycDl0em5tcGx5cHQyUXBhVDZIaVlI?=
 =?utf-8?B?L2I1bzlXQVAzMUplMCtXNFFDWVI3NEVZSmdNaTVETnpTK2ErTkJQY0lmcjNQ?=
 =?utf-8?B?SlQrejMzbGJrZHVqNzZ3Zmh6TW13WFl5RjVPQTFQVTRzUTc2cmJ0UVB0THFk?=
 =?utf-8?B?WXJuSGV6UVVNaGgwVEdIK09VWFdtYXJBVWdNcFdHaTd5M1o5ZXoreW1JcnV0?=
 =?utf-8?B?RnErczd0RGhOV2Y5ZUxENUdENmMvTGtBcmVqR0MyN1RBWFBLeEdjSVgzM3ZQ?=
 =?utf-8?B?RTVQei9LU1A5RnhBc0dWVDRsSmVDWHdYdDNwZ0orRzRKNFFvWGs3UUVqTXF5?=
 =?utf-8?B?YnE2QVdGejJkMldOV1ZxVmZSVVF0YUVBSDVHM2FBUVlhbjY3TlZSUjZUWHAr?=
 =?utf-8?B?a3oxWVcyMm5CUjNJeVBvY2o0VUxaazlDRzAySkdaeDg5QjJENGdmSHJVeFls?=
 =?utf-8?Q?+WlhYU0DnXj+Abwg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc921fda-a1db-4c2a-9146-08deb5a48994
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 12:45:42.2527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6wyGGKltT3joT0qJzrffTYWaMutyPdyM9uB/8SHJ01yXerBxJZg0rQjDu/iDdT07jccIx4FmrYu8/V6jRF35B8OrrgUr/WLzIZfcz4lpkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5377
X-purgate-ID: tlsNG-ebf023/1779194745-42D643FF-CF12071E/0/0
X-purgate-type: clean
X-purgate-size: 1432
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
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:mid,citrix.com:dkim];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EA81F57EF74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 12:43 am, Edgar E. Iglesias wrote:
> The generic Xen strrchr() implementation returns a pointer to the string
> terminator when searching for '\0', matching the standard C semantics.
>
> The ARM64 assembly version stopped as soon as it loaded the terminator and
> returned the previous match pointer instead.  This made strrchr("", '\0')
> return NULL.
>
> Compare the loaded byte against the requested character before deciding
> whether to stop at the terminator, so the terminator itself can be returned
> when it is the requested character.
>
> Fixes: 42c4eb6a83 ("xen: arm64: assembly optimised mem* and str*")
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  xen/arch/arm/arm64/lib/strrchr.S | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

A couple of tangential things.

This file was inherited from Linux.  Does the same bug need fixing
there?  What about the arm32 side?

Looking at your example, it surely wasn't actually as simple as
strrchr("", '\0') ?  I'd expect the optimiser to be able to turn that
into a constant and not call out to the library implementation.

Elsewhere, I've created xen/common/bitops.c to be CONFIG_SELF_TESTS for
the bit operations including the arch-optimised variations, because
they're subtle and easy to get wrong.  This looks like it's worth doing
the same for the bits of libc we implement.

~Andrew

