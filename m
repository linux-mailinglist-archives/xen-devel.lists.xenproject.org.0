Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sLflMR8xNGpbRAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 19:55:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5EC6A2051
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 19:55:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=B9aDnQ0w;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341537.1601930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waGx8-0001iE-Bm; Thu, 18 Jun 2026 17:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341537.1601930; Thu, 18 Jun 2026 17:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waGx8-0001fc-8F; Thu, 18 Jun 2026 17:54:58 +0000
Received: by outflank-mailman (input) for mailman id 1341537;
 Thu, 18 Jun 2026 17:54:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waGx6-0001eY-L8
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 17:54:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waGx5-00DJAN-MR
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 19:54:55 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3430be-bab6-0a2a0a5309dd-0a2a450a8694-34
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 19:54:55 +0200
Received: from [40.93.194.66]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3430ee-93a5-0a2a450a0019-285dc242293a-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 19:54:55 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7565.namprd03.prod.outlook.com (2603:10b6:806:442::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 18 Jun
 2026 17:54:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 17:54:51 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wv6+iyjQa8fpI3b3IGezDQo4fc0vLfOKXACCwyhQ8jj1csAf3gf8tGZYZMG11l5fJ434ps9Z5V6kDBDS8e+bV7+nj4mNTh7Ike5oUpwBymBroB0R7H7FuGvDQX256FONCQrfRRetvsb+dqeGnG79Jkdmx13fFCaJz/GnsU2ZAR0PID5UcdPNm/85mjkZT5FHRNuH186GmF2oKlGKLRgNZ8FqQyur9UANobFTMvWGnliEr1fd5QQ8kZgGGFQS8L8mC+JNPR9DVrbRdQLS8PSoggEmMHLVKChiOeOv4Ltob19KSz4l2jTQQwshBfJaZFcLMKs2pziI/aGJJkwoH3HZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9MmiEcRz060P+QPJ5Wfo7ZfRrn7A12Hb0j2ZJJ15r4=;
 b=rhSS6tpOYVhLKCOb/XS+vzvfQXCTrpg8qqaWdunPlnXRi4ucp+6FCGrreT2y4efoKeBhs2qzk5dqFWfXmiCmZJa+wGJ1UWTqxFil38vbSXZ0Ei2yl07B3spSd8edwHs/fX6jKMzpeWBOy3Y1tQ4qTgTSDaHx/8tuNZJn3QtDcoAXocZaM1BpgtKqgbAXinw9tEaeIWUI3SKjuzvtTYudXlab6p9yWeAR7pH0SnRsUkSB33nEdvhDUaBjcKI5Ro+3BUk6WnNAvH44gEbDFsTFYlThPkNrLxC7pxs5Xl8AGYdRFwY8R10vqpeBKbcnHR3j6m519Id/hewD3jt+mnBItQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9MmiEcRz060P+QPJ5Wfo7ZfRrn7A12Hb0j2ZJJ15r4=;
 b=B9aDnQ0wd5QCTLl+2NG/GQC6G6Gnh/2uoBOjxBbHtgxpW3kkMENS4Z6dfd+BgJaFxXQygYwS1KRRsiVzLEPTvzIPrLt6u6sp+kuKr6qd9w1V5Ik/T3fnVyfAET8EN6qKoP65sqZIiJIP4H9c9mGL50wwDkERSrin6h4fzLs9OdE=
Message-ID: <f44587fb-5d77-4787-9e09-2aded00ca165@citrix.com>
Date: Thu, 18 Jun 2026 18:54:47 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 05/15] pci: Allow ommiting func when parsing with
 parse_pci_sbdf()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794553.8631fc262581453bbf619ec5b2062170.19edb3b3fcc000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781794553.8631fc262581453bbf619ec5b2062170.19edb3b3fcc000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0132.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd2feb8-86d7-4bae-5f7f-08decd62b26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|4143699003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	YunQpNYCBuV5v3jkoKIrg74uKj2FjYe3fbcMqqasAFtFO+2FQTpr3l8Gb+srEVsOsuLqS1yzAFZBw9Je3g74ZgdkPFWVxSiGfs0gSrLAmp3t6FfQntTuFpb37C14tQr0Br0+0aiMn8W0sUeER5HnZGbdMYT/Hd/Ci2n7LT9IrETKnN+zTVmjz8CSqSSi2ugZOQTqNby2Mcm6O7gkkJ5JjZNtFb/IjAelpaDvcv/1GrzWVWnjNR+jCafm6rVzBUODJBaevHL50nN8tW42oxyAuyAeteMbNXGC/KyEMR1McD7OQqFI+267vmkikw8eQgE7QdmnjDB0/PF79jcATP47O3s7KJOhQANz07EmBNE1skukE1J1nNDWiwv5dc4Qmw3V5yrefQ4uQ59VDavLJBE8C4tP7kt8VXQQpvOw1zKcbKXmpqv/vN4B0Bgw7L/5YFn0O/NsZL12lvSjlMjmDJesK5sK0mlbtrltHYvVuheAbOUcg0/GEGqgENihb7UUgES8NOMH8e0/yxMc6dIjViuB43w04084CHX6sW63+9QH3AbJ0g00h3OHZc4413/ZXQ0N7BqpHq+moIWiGHoVAWdTNXT/rQqKZxPPi8+tp+2enVX45DH1U9vPIySgcU1kAvDj/MBygQMpmU6Z8dc6exmPtyCXRwqpCAosCnWWWjCRHWH2SRq9YnBWJk+VlEcJHjCt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(4143699003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0ZxTG4vK3p4MmwvYlY1WVBXTlN6QmJpZ1NseFJxRXlpREloL3dzcStHd0o5?=
 =?utf-8?B?cnRyMUVOU3lsN0s2cnhLZjJiOWtnWE4wTk1uWTc1RjVub3NnYWdFNkNUYUVN?=
 =?utf-8?B?ZlNlaXl5bS9tOTMwNDVwdVQ0SFJBdGZuT0RXRmxnYjZOdzc1TDVJZUZ1cTJZ?=
 =?utf-8?B?K3dSOXNydHFKZC9xNVEzMGxRdHFpdWlRdFR0YVBQSkZHMnZSRHNvVXFFSHhv?=
 =?utf-8?B?Yjk3bTl1Qkw5Y1FGOGxSN1BGN2tlZEY4VHFRa2k0eHlqQzhGYkxPUE5oRkxx?=
 =?utf-8?B?V0pEQlNhWkcwcmROVVJLbkkvekFvY1FtaituSW9qc1VpSHlQRnZxblZHMHhj?=
 =?utf-8?B?cldSRGNZMDJsRlRCbjlqTFNMSVY2MjlqcTh6Q1FuaVRoT1ZNdkpaSmRrNVpQ?=
 =?utf-8?B?VU5KRXovVEZCS2JET1piWjVlcDBDUkE5a1BmQ2pPVGM4UC9SMmo2OWkxQzZx?=
 =?utf-8?B?RWFSSFdKU3Q3U0VycmpjMVJMbE44SmJvMmcxWHdNVkgwNFBXSC9KbDUrcFg0?=
 =?utf-8?B?UHUvM29RRU55cmRnUE1sMVQvYzIzNjFQdG0wWHVLVzNoOGxUTWR1d015UGUy?=
 =?utf-8?B?clFFUC9oT3dOTCtyd0NsNHRERjhLSXNNaHFOU0dHR2pJVEFoWGQ5Y0VvTDhz?=
 =?utf-8?B?MkYwV2M3MkRTTmlZUjJmZU4zZmlUdllRR3FJVWhHWEppLzF5ZVhTemVHZTE0?=
 =?utf-8?B?TG9xUkgwalY1RnlkUjBwanU3RmhQWlJDUUFUMzBSZVBJajIva0l4UVZOclRS?=
 =?utf-8?B?b0toaVFZWlZYRGw4c2pBK2RZdGpzVEc5ZE5pUnJFQkszSFJPUkJvRVMzRGl2?=
 =?utf-8?B?dFpYcmVMcDY0QXVwaitlTGhXbzJvNkpMQjU0RU1WNlM1bERtMkVuWDB5ckpz?=
 =?utf-8?B?ZFcrVXlZK1lmdGYvN0pFZjhyRm1UdS9XMFBqSTFWQzBCSnVmY09kcHYzZ0VZ?=
 =?utf-8?B?QU1lNHB0d3hXMEFjM1NoZGNDODJhTGNaUEZPS3VrVEFiMHRIV0ZJTk9XNEZG?=
 =?utf-8?B?TGZ5V1JIMm53RWRwZTZ3L0czcXRsQ2VUYVA3ODlhMU9temhEWjRwalJhaHZI?=
 =?utf-8?B?YWhsekxveTU4bEVPYnBqOEQ3eHJpRDdNcVhnZXBsNll6ekVNaU83alZEOEN4?=
 =?utf-8?B?emp6WlU1V2x3dDBoa1l2TVZ5dFRNbW5pbmlHUGFJVU9KY1RORHlzdFlEK1pL?=
 =?utf-8?B?ejRabEwrSERselRaNG9jZ2dKTVV5ZW5oTTduSUNreTZVVkJqdlFuZndjYXQv?=
 =?utf-8?B?Vm54d2pMaXFic0hhNkF0VVdRVHZqcmZZZFBpSE9CTlhOZElBelYyRFZRaFhE?=
 =?utf-8?B?Y3pPMnk3cXJ3ZVFXUER3QUJ0VnM2VHBVVDk1Q0sxVVJ1U0lKVEZ0SlUwVnJ1?=
 =?utf-8?B?R0Y4Q3Q1Snl5NFBUR1d1U252Ukw4N1hYSmtXRmRlaFVEK1hOREVyRnhEVVJp?=
 =?utf-8?B?U3JvZUJmanNNa29aQnl2RFIraHducWVPUjZtTnE1Mko3YnZ6eVJFaU00VGU1?=
 =?utf-8?B?NlUzZjFWYW91RzI2aDZFazdTUk9hRWQxSlIwaGZmQjhxemNpVVdWOHlQeE15?=
 =?utf-8?B?NFBMZzVMR3p2bm1EYkhhWHRib0lYOUdwM3lJSWJtdWN1Q0JHVzZvaWcyeHVy?=
 =?utf-8?B?VGtEa251bWNRaEVFbkNEUEhnbGVoaUcrMW82WTQ0cUFVNjdPODV6SWlrdXFp?=
 =?utf-8?B?c0ZRSEpROGhLN2ppQWEvbWpCM2FNR2s3V2hURE9BQWh1WFRQN3I1S1VoZ2lI?=
 =?utf-8?B?clAya0ZNeXlmRXNPMGp6M2VxU0J3ZjBGeWRkY2o3UFZURWFjdDdEZ3Z6WFN5?=
 =?utf-8?B?clJmWGJqUXk3TmlVRllaRkx5N0F5aU45YjRiK3pGZFZkKzhPZVdKQnNJT1lm?=
 =?utf-8?B?b01BQUZHWEJtQVpMWEJPb3lEZXBXdW4vQ0RvMm5keGd0QUZTZDVJdXQxOUFi?=
 =?utf-8?B?NWpVK3ZQbiswZHpsTnZKeE9Dd25qa3g3ZGNIVURKQTdwTGFGM3gvTGt1Mk5o?=
 =?utf-8?B?R3JUSDBLUHlRWTE4eUZHU2M1V0x3cmVtZjczQWtUY1NoSzVCMVJpMDh5TmVu?=
 =?utf-8?B?SkVIZlZZTVIzVDl5Z2g4ZU5scy9sYTd5dkl1TGR5STRST1NFQ3U5VitNeTRV?=
 =?utf-8?B?YU8yQUtnUGExczkybFlpazNDZEd6M2tHOWlUVmtlb0hYUGVKTmc0RDVlR2tQ?=
 =?utf-8?B?NlpEYkh3ZEt4QUZ4ZzZMMklXaVJZTmpCc2lNZHVFdWF4YWZNWnJRSmNGaVVo?=
 =?utf-8?B?U3JwUWo2dU4rUHY2Y3FST2s2VWNaWGc3b3ZwL1YvZWlaWnNWNlZyd2hJR0tw?=
 =?utf-8?B?S003SllFT3hqYmM0R240L1dSeDlSbTVPajlHNkp5dE5lTHlneHpyWDF1RWdy?=
 =?utf-8?Q?2r2Nlepuull/+300=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd2feb8-86d7-4bae-5f7f-08decd62b26f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 17:54:51.8918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVeueBRjUlHFMBAnwPe8djnLaZ1N3xwele4T6RR01wn+35feewMZY7pNeqziGnv4XJ6z2WnM6Tgj58HU+tI3f7F9tC5ALmgnZbApugM8b5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7565
X-purgate-ID: tlsNG-4011c0/1781805295-B3DE4DB8-167D58BB/0/0
X-purgate-type: clean
X-purgate-size: 2526
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C5EC6A2051

On 18/06/2026 3:50 pm, Teddy Astie wrote:
> diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
> index 1d06cb035b..a2b49f1b26 100644
> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -179,18 +179,14 @@ const char *__init parse_pci_seg(const char *s, unsigned int *seg_p,
>          seg = 0;
>          *def_seg = true;
>      }
> +
>      if ( func_p )
> -    {
> -        if ( *s != '.' )
> -            return NULL;
> -        func = simple_strtoul(s + 1, &s, 0);
> -    }
> -    else
> -        func = 0;
> +        func = *s == '.' ? simple_strtoul(s + 1, &s, 0) : 0;
> +
>      if ( seg != (seg_p ? (u16)seg : 0) ||
>           bus != PCI_BUS(PCI_BDF(bus, 0)) ||
>           dev != PCI_SLOT(PCI_DEVFN(dev, 0)) ||
> -         func != PCI_FUNC(PCI_DEVFN(0, func)) )
> +         func != (func_p ? PCI_FUNC(PCI_DEVFN(0, func)) : 0) )
>          return NULL;
>  
>      if ( seg_p )

My build fails with:

drivers/pci/pci.c: In function ‘parse_pci_seg’:
drivers/pci/pci.c:206:45: error: ‘func’ may be used uninitialized [-Werror=maybe-uninitialized]
  204 |     if ( seg != (seg_p ? (u16)seg : 0) ||
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
  205 |          bus != PCI_BUS(PCI_BDF(bus, 0)) ||
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
  206 |          dev != PCI_SLOT(PCI_DEVFN(dev, 0)) ||
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
  207 |          func != (func_p ? PCI_FUNC(PCI_DEVFN(0, func)) : 0) )
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/pci/pci.c:185:62: note: ‘func’ was declared here
  185 |     unsigned long seg = simple_strtoul(s, &s, 16), bus, dev, func;
      |                                                              ^~~~
cc1: all warnings being treated as errors


which is correct.  For the !func_p case, func is left uninitialised, but
is evaluated as part of PCI_FUNC(PCI_DEVFN(0, func)).  The ternary
operator there will lower to a cmov which requires both sides to be
evaluated.

Again, this is something which is addressed by patch 13, but it needs to
work here for bisectability.

Initialise func to 0, then use:

    if ( func_p && *s == '.' )
        func = simple_strtoul(s + 1, &s, 0);

and I think you can keep this line as func != PCI_FUNC(PCI_DEVFN(0,
func)), which shrinks both this patch and patch 13.

~Andrew

