Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHlyKYwrzmnIlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 10:40:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D11C38630A
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 10:40:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271296.1559516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8DbP-00084o-Pr; Thu, 02 Apr 2026 08:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271296.1559516; Thu, 02 Apr 2026 08:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8DbP-00082b-MX; Thu, 02 Apr 2026 08:40:35 +0000
Received: by outflank-mailman (input) for mailman id 1271296;
 Thu, 02 Apr 2026 08:40:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w8DbO-00082T-Mm
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 08:40:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8DbO-00EFAf-35
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:40:34 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69ce2b7d-bab6-0a2a0a5309dd-0a2a45099cae-36
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 10:40:34 +0200
Received: from [52.101.52.59]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69ce2b80-bf79-0a2a45090019-3465343b2cfc-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 10:40:33 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DS3PR03MB989216.namprd03.prod.outlook.com (2603:10b6:8:38e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 08:40:31 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 08:40:31 +0000
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
 b=KT7I28GgIEUiOR5mRQ9B8pQfjtwYi00pmeSjiKiG1DXiLH2aDzSfTt5JpGx475Xwf5/cnOY5Z7zzZk1tJhmwbgtfovO7VV/vlMpjuWN57K1S4guQ21IT8tjH0zYgyercTTVAQzftwEOkmq/v0ji+iXk1SMlQy2ADJa6D6Zm2MqqGm6y34Khv6gSv+orCQt0rnWNRVFAHaBzQBRAOBkQSMki5Bz9wX5+3El5+OY+38PWpEgGHOpTijaovnae/GQ9uFXdrxhAALZYHKxlPZVi2HR8/8LLHQIgVhecAQXmjsllCjqjudkAh0HW7v28M9MlBzhLNTCKIqTJF/z2HP2gbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdfQ8Ppn8w3mAl8W9T0lMjJOVO/ZVKu+sDdhkmaWNwU=;
 b=JQ17+Wbe/vimkuO6HIRcih6++auws3aicAOAzUJ4nTiH1/1a2I46OJwPAGrv1b/23L4ZVLbbkwnPTSTCkGjHKgxXIZkOHNh9fLMVh/oePfEOwH+N/rEbaRgQgCux61j/XBOCO3jgkRWL6XNw1ISvUNLBPXxcC4zbdCfPLNJLvXov7qgOHRefrUQsnCjDcneLOCyi1g1YoczAgLt6THHUweUmnIcYjUlLh0l/OzwkWqJ/4x0c99dRaBcEI4t0uek3gub/9jKDLpDK2jh87N+zt+eIaqJqeBH8V9k7zS221tlBTbyDJkltdCZ7joh+6NQd2lAhP1qd3LieLPmr04diUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdfQ8Ppn8w3mAl8W9T0lMjJOVO/ZVKu+sDdhkmaWNwU=;
 b=VZ427re7rHirDSoxbBw7PhAz01yFkNBFTPAWrSdLa+JHXwuzUn2FoHuHGUOlcHitJlaTJ2NA3MAZXGovDdrgcDbTwH56XgZaGbL7IW8XcOBBBXeHA7Xg/HKzD5m+TAvebKkjlhXYzpF7w6otFi8yBzZqci4sw+PNVPnlP989UMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <17c4e7b4-297a-4bf9-9160-659723d15e48@citrix.com>
Date: Thu, 2 Apr 2026 09:40:26 +0100
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
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <94b2e444-844a-4d34-9c9f-de0b9e6e23b1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0055.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::12) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DS3PR03MB989216:EE_
X-MS-Office365-Filtering-Correlation-Id: dd8cde06-91bc-449c-c8b8-08de90937fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AgIpKNJJ+xdlDu43vNZjQy5bcBPd7yLP/uu9lhq3jBgLLWmfvC30F2qfs4gkIwni7S5cLxjdpaam/2CaH8f62b3DINdpO9l0bqLeMZt9iryjyDWmwy5LQ/77jfQdJLqyujDEX+TDcb1dRfm6TKu6rcsp7HwlEqtXRnm0m2ZoCFbV4rbY3wamUBssTOqp/4f9tUl40ktR+WM41DyOUb1g95bfsS8LtfgFmRVrvz6iITN4zxjohvBjI4JqdxcG+p+tEXJWiZFaBPmS99H+DDNtYLrf6VtNqaKBGH6fSvRhIQvhPnfcF0D+yGyBp1DKtDcmvGDPQoxICah6yZYrXVo+g4p0Su/Wj6EWcs9i+mKdgvkzszoL+U/AfE8XH08XsOJlI2/FH5IBhZINvhPdvX+BpWO/8bs7nBkhvFe5awS5jGm/ns+i7Oyp0u9TwS1kkWT+fyUqa/9oJM3PUUUsfJugxBt3JXMvHvfKWfMovCYrWJlvrGKK0YRyyKN+moC5s6curwCBYGGH3fWsfixNMySxkIFqYgqR+//Sqw67zrve7BMqa0cixR32BxDdpgISI5rxOsNRQ28tXOfJyTl+3TaTwsq0ochTVNT1FC+GSFHpuVVDHo214r8B5E5txF2nEcymc1CWJyLUKMQtdya7zvR+1oy3xynVOpgaZ3mm5UmeIaLvtYCDapP4LaP4J1wli2IZHy2gEEPAyS3wAEHl9iyPWyznHEafxxGSeaqhRvxxFpM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0VSVTViVkQ5WXEreFVOZ2NPcTAvczdSRVBMNmFmQTBpb3RWUWVKQVlFOWRI?=
 =?utf-8?B?Rklab25iS1hmYUU0U0YwOW1jTEdSRkpuMkNjVzhRZjhadUhzSlhoY0VLU25I?=
 =?utf-8?B?RkM4U3hQQVdSMUdsQUJOM3hFZm1YbkYxaXlJTTZhUUZrZmpsdzkxVTZFOXRs?=
 =?utf-8?B?cDZjN3g5TDhGMmtWNVJEbDRGTkd1KzVRQmZxeVREOFk1UnVaTGRheUVCcHZS?=
 =?utf-8?B?WjdWakdiL2FHbm93c3oyb29jZVo5TThHTExNMWhSMDFRRVF4ME5QWmhhOUgv?=
 =?utf-8?B?OVlVWXFTQ3paajAyS0xSZ3BGUHpjNGpRQ0JuUUs4SGlxeEhnVkVqTkcrWTY4?=
 =?utf-8?B?a3V3NGZqZHBhaTBCZ2xhRXhObEUvUEM0UHN5THA3T1NBMTRxK2tnTHlZQ3JZ?=
 =?utf-8?B?cTVLSU9ZUCtPZlp1QkUyQ1Jkd3FCQVZsZEtBeERBZVV3V0VBMDhyR2x0V1dh?=
 =?utf-8?B?YUlzM00wSTQ2eURqRVdvRUlRejQwTDAxQ0ljYm91bTl2MTY4TUNTR2NoRnFJ?=
 =?utf-8?B?WDhTNnRwU0JCR1BvS0NLekE1Q0g0U1RwTG12MHdBeFhYY1UzUDlMc2IvckNx?=
 =?utf-8?B?aDNRa240ZFptNzNlTU9hOE04SFJoUkVwaGxaREFwOXlkMi9NdUVTbWh4US9r?=
 =?utf-8?B?LzFiMG9IanlpN1VGeWZWRzlqblRzTHBnOGZhRjlDNmtZbGFocTY2TUVmNzdr?=
 =?utf-8?B?M3M4MEhnQXJKWWl3RmVKdEFZMWFYTkZob1hseHNnN1NtMVhaTG1nZUJ3SldU?=
 =?utf-8?B?NGtMK2g5alhFUVh5U0Y5RlFadHkxMURHNXVVYXdZekwrNGRDalNyNzlpdmVj?=
 =?utf-8?B?QlFjZWl3L2dMeDI2TjBEZzN0a2pra3l1YkNGaFNIZG1jd2tTUW53QUxqWWdK?=
 =?utf-8?B?S2Z2TVQyUitrN3E1OG1KWm9EUlFvaEh3ZGl4S0RqcndzaVhOVEc4T1NZcEFp?=
 =?utf-8?B?WUFOTVN3b0F3OVBKbHJNZVMrZXRncnl4Z3RYSkIvWUhkVW44R2o5S2hWQXdI?=
 =?utf-8?B?Y2hqenoyUmZtaVQraGtSeXpocFRtYjZENjBCWDlidnNRSzhtUmsyMFd0SXor?=
 =?utf-8?B?Zk5yNlJlTWh5NDg5ZHA3SlByZXZHaVlNZmoxMExFNldobFNTVUtDMXpvV1Fp?=
 =?utf-8?B?dUpnNmN4cUxRdU5NWXZOMHo5Ykg3ckI2Ty9RdS9VYXppRkNuc0FNaGpSOHBF?=
 =?utf-8?B?K05QQVlwbFJsVnZRbXpGUFM2NkFEbG9rYURqZ3pTT3JoNnk2QUo1MUVhZ0ow?=
 =?utf-8?B?SzVmbGRENWZKcXRkWkFOMFVsYTB4R1pYeXlwOGhTaUxzcnpTQjlHZGQ1K01z?=
 =?utf-8?B?Qjd3aGpyRDNncTBEWDA5OFVhVE5uRUNnblBGVkZWOUNyQS9lV2QwMzRrN0lE?=
 =?utf-8?B?UnVYMWRMQ2kyN0JCWkgzR2tHSHN5R2xGQkJSeGdWR3UyS2gyTzdiMlMvdzNN?=
 =?utf-8?B?Nm5NbFRCMWRpaXRKWnhEQWdFczJNNGRKSGZXRC8rSDBMdXRSV2M1REQ5ZVV6?=
 =?utf-8?B?TkhtbXpWNEJEK2Q4bDNBelBLNXNQN2UrM2o0VWVrendtdSswRVM4YjNkRllH?=
 =?utf-8?B?UkU0SlZlNEdPZzVoY2VqbEJ6N1FzbFVWOSsveWtDNExHdnZMV0w2NWJSeElt?=
 =?utf-8?B?Q0d3UkhhcG1XTDlzV1BwQVgya1hwYWFoVjExYkFCTVlxcHFtMHBBcWJKQ25n?=
 =?utf-8?B?a3RGZWlHcnRqbEdmb21QYVloLzlNcXBjdzBtT1N5QXphd1BZZldHaC9ZWjA5?=
 =?utf-8?B?VndzWTljWDlXNTJJOVNFUGRRS3l4czM4MFRpWG1CejJ3b1Njd1NHZElycHQ4?=
 =?utf-8?B?WXpOcVNCZUkxRFkxYUdzVFN3R2hOU3RtbWxER2ovVjFkQk90N292ZG52R1Jn?=
 =?utf-8?B?ZEF0eG5mdldoU3RMU2xmcVJOTTh5bk9GK2Z6NkhORjRaZ3JBM2c3c0g3bXll?=
 =?utf-8?B?TzJTZnNrYjBLTWlYeDNoZXQ0bUJ6d3BCTjljQTRDc0ZodzBHUk5RVENBNTlr?=
 =?utf-8?B?RUpYejBua1c1bTA2UzA0SEJoWTFNVVRYeUl4QytBREFHd2pFK0NRQmZXTktq?=
 =?utf-8?B?Y0N6WURwZDM0VGFhRjFMTWM3WnhHQXF2cXhib1ZIUHMvTWZlUnZCQ3M1Vkhx?=
 =?utf-8?B?R2Y5Z3Q3RGlCMUF2MWQxZFppUzJudURkcHRBeE84RDFnQW5pY3YwcitpRXpx?=
 =?utf-8?B?MjJRSTl3cVNkbUplTUMvOGZheTFLdy9GdmR4YjN3YVRrMTU5ZVBRVElhK2Vx?=
 =?utf-8?B?ZW42OElhRTlwakU1MVdpWnpuWHdJd3ZUK2pDcWhSUUVZYlZmQmRHWkFQdG02?=
 =?utf-8?B?eURwcENtODg4T002K3ZUekVmakFTTEJRMUNDZy9VODNIQVdiMmFYMlZmbVU0?=
 =?utf-8?Q?/CHNKYu5SsoIz0ok=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8cde06-91bc-449c-c8b8-08de90937fc5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:40:31.3191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75obsVRFqr+8cMfjn/5kF4q5uQaKqZA8owC6yekEcmFVxTbkVoypq1LbfyNAQReY0qnqVbXmHjQ5LOpKj7ohI5Uo7BTroHs2o881DJuAx8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR03MB989216
X-purgate-ID: tlsNG-bad1c0/1775119233-5DBE8152-B7D40290/0/0
X-purgate-type: clean
X-purgate-size: 2803
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 2D11C38630A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 7:09 AM, Jan Beulich wrote:
> On 01.04.2026 18:35, Ross Lagerwall wrote:
>> Hi,
>>
>> This series implements lockless SMP function call and then rewrites x86 TLB
>> flushing to use SMP function calls.
>>
>> We have observed that the TLB flush lock can be a point of contention for
>> certain workloads, e.g. migrating 10 VMs off a host during a host evacuation.
>>
>> Performance numbers:
>>
>> I wrote a synthetic benchmark to measure the performance. The benchmark has one
>> or more CPUs in Xen calling on_selected_cpus() with between 1 and 64 CPUs in
>> the selected mask. The executed function simply delays for 500 microseconds.
>>
>> The table below shows the % change in execution time of on_selected_cpus():
>>
>>                    1 thread   2 threads    4 threads
>> 1 CPU in mask     0.02       -35.23       -51.18
>> 2 CPUs in mask    0.01       -47.20       -69.27
>> 4 CPUs in mask    -0.02      -42.40       -66.55
>> 8 CPUs in mask    -0.03      -47.82       -68.39
>> 16 CPUs in mask   0.12       -41.95       -58.26
>> 32 CPUs in mask   0.02       -25.43       -39.35
>> 64 CPUs in mask   0.00       -24.70       -37.83
>>
>> With 1 thread (i.e. no contention), there is no regression in execution time.
>> With multiple threads, as expected there is a significant improvement in
>> execution time.
>>
>> As a more practical benchmark to simulate host evacuation, I measured the
>> memory dirtying rate across 10 VMs after enabling log dirty (on an AMD system,
>> so without PML). The rate increased by 16% with this patch series, even
>> after the recent deferred TLB flush changes.
> 
> Is this a positive thing though? In the context of some related work something
> similar was mentioned iirc, accompanied by stating that this is actually
> problematic. A guest in log-dirty mode generally wants to be making progress,
> but also wants to be throttled enough to limit re-dirtying, such that
> subsequent iterations (in particular the final one) of page contents
> migration won't have to process overly many pages a 2nd time.
> 

In the context of a real migration, both the process copying the pages
out of the guest and the guest itself will be hitting the TLB flush lock
so reducing that bottleneck may increase throughput on both sides.
Whether or not the overall migration time increases or decreases depends
on many factors (number of migrations in parallel, the rate the guest is
dirtying memory, the line speed of the NIC, whether PML is used, ...)
which is why I measured a more controlled scenario to demonstrate the
change.

IMO throttling of a guest during a migration should be something
intentional and controlled by userspace policy rather than a side effect
of some internal global locks.

Ross

