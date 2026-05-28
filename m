Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBW/CmIWGGoAdAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 12:18:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD915F0740
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 12:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321069.1588086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSXnx-0004C6-BN; Thu, 28 May 2026 10:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321069.1588086; Thu, 28 May 2026 10:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSXnx-00049T-6t; Thu, 28 May 2026 10:17:33 +0000
Received: by outflank-mailman (input) for mailman id 1321069;
 Thu, 28 May 2026 10:17:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wSXnw-000473-2O
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 10:17:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSXns-00EIFz-4D
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 12:17:28 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a181638-e002-0a2a0a5209dd-0a2a4507831c-0
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 12:17:28 +0200
Received: from [52.101.43.42]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a181636-229c-0a2a45070019-34652b2aef70-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 12:17:27 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SJ0PR03MB5534.namprd03.prod.outlook.com (2603:10b6:a03:279::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 28 May
 2026 10:17:23 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 10:17:23 +0000
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
 b=XzCfx/z+Tuwkkj9/2/hFgdJYl5kL8dDLXc3uu+zLZ//Mm7eeviLNvd+mfD/NVA0iWW1GmhXEF12oKkrTPDvqca7h398as0vAT/iqNxt8if1pH2hwCGo1E6O4q3PGbvlPa6oMT9JgeQNZDW6Q0ZrQvZhxxY3DvF5IpBsA9NTVo0bdV6lWA0qbnlGDlLRoP+aujgw3CGQDaVAuEHLkmtHlruRRls7+9gKUR+rN0UkyK2IXb6NQZwr5Ic6O96bm2u0UmRfcqrTwJxpKrJhv7mK4vRsj6lzzlBVRwfS+ocKr1ibN+qRJkue7WRxpEPe94X5WH9yKOXgCK7Wucp8nv6J2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaugPCkhtvQSrPz39U5tPBHy2LHQeZkHEGyHiEnEFi4=;
 b=Ir5uH/ZXZS/XKe8N01Dzfu1YxybgXGMp4pmjDUbOLXp9JWhH7BuCMFRkxxsPNy0AFozSFPuzm8s7E0t3s1f1hlgPekbhOJOe0imeEpZh+jNQkMbyOUmQ6NNhabNE1XysorCz1/mbupDA2Tr75PZcw/txHyYEoOuQInYwSWPsMV/+OE25w0btL6NTOFUF6P3C1VnY5maC9Zd3HUvmR9ScKccD0Qf2J7oVOy8y/7d4b8MvnMRRM2RSeV5vxcnIiRPNnf2RjbZfZ1kOzZgDP3m4dXapOvEyXjXdiNUIJA819YMLsUw72d7O9s+Gc6FSf5e7mnjsTmkPLRjYmVOauiTNpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaugPCkhtvQSrPz39U5tPBHy2LHQeZkHEGyHiEnEFi4=;
 b=Dh+D7ctL99UzbExQYNISUjTZapnr9eNCPLRZ9+J8byJXSK0Y7SoCCpyLk+EHzpD6c7UXeej2QJbjMQa1SFruxp/HRyByptDwvlYWlRHWPZxyY+L44zi/aHf7AsKMyCIkhDhWFm1Nxn4kw0IpTHR6SIPmMS5Zj8KTsA8kZE8Cnrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <902cd39c-badb-4194-8cd9-dc2e42d33eb2@citrix.com>
Date: Thu, 28 May 2026 11:17:20 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 dfaggioli@suse.com, gwd@xenproject.org, jbeulich@suse.com
Subject: Re: [PATCH v2] xen/sched: remove stale file path comments in
 common/sched directory
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
References: <20260525102539.27050-1-frn1furkan10@gmail.com>
 <20260526075236.14265-1-frn1furkan10@gmail.com>
 <f21b3696-187e-4526-9c34-bb56e9000898@suse.com>
 <61fbcf6a-4533-4a1d-ac2a-0c8b2427d27d@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <61fbcf6a-4533-4a1d-ac2a-0c8b2427d27d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0571.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::10) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SJ0PR03MB5534:EE_
X-MS-Office365-Filtering-Correlation-Id: a07d5230-0e4a-4337-b692-08debca24f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	krEh5tgg+2mmr5/rzlN+ys2cWhBoS2H9Ijf0H2rR0k/tse60XzjR21pkGSpQeQlg7zFMwETCNeYrlsnxHDWW+Jq46XK11t5QgmOz/klp9artiIYw0kUOpmAvX7HSSdi+9IJooUO9KPHh4VP6bioTldEbx1Ka0FfOHENYB6vUdxpPwBlYeHXRTC3KrEigThUT7bwSrVRjvKxynBZMa53Hai3d9qCh7+dOwB8G+YP0JgVc2vjTlhMZ5Tl0bJOqPFK4ylEYEMIrD5lNJ8F8YgeFW11U3m5FN/+lE/EC5svV+H9DCgwzMoORfzMHdOdlAezI4wUKvVoLO3Kp/yrFQRgZcpp2PQFsYyx10XScgnY8GN8htFmu4FxraXpEwtUQoiCtq50rbcHiW0nPLdNyP65PnaXZoiqh79vO0A7ovvLgQ+GpPcdn+5Cc6TObIfJKYG7gVRtsxmUhxppY1d6WpCRLUNrxucgPVr4QLmyLo6uLFPCYNDCiKseKwZYEbfUqg1ZWzTKKfXxAxlKg8Vac9IPfxGl2gIa6/2pCjtml2NQ0yS/lwdWFkExA4uQjHDgPdca3RX7rFVhFiVPdd3NA2xiNmFTVjGaAcIIJtR67imlVHtN0HCtJo8MIbIB2Gxj5f13Q3hTpJ51yGXf+qIPpFkm9Fl0OQF/rYoZyx+NP0xREqGT5GRhEeT3jDWqtYvBTgEL7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0FybnFrc1Yra3p3Vzk3bEcrK0JOZmIrM3k5UHNoNTNBcDZFNEl6U1h5L1Q3?=
 =?utf-8?B?WFR0ZEdKSUlvM0ErazdFL21ZSUVHekdPZkN2c2dWQUpvN0MwS0tySGxmMXhP?=
 =?utf-8?B?clpPditOQkFxd1NEZ01sNXZXYjZrNUxUU1A1WFd6dTBLL2twVFliL0lzYWM2?=
 =?utf-8?B?ZXZLZGw1OTlMOTA5cEM1NXNPMFB5UmkvKzU2QlhBazVpRktXSWJOZ1prejRQ?=
 =?utf-8?B?dC9uRXFOMjFNRThmRnNCTGQ2SkovOVRWL0xhSjgwN1JqNkF2K0ZxajZEM2J2?=
 =?utf-8?B?SmdhRmp3Rm5GT1gxVDVCWXdSVW1tcmlGekFzZXh1YUNzVjllaURVUkowRU5n?=
 =?utf-8?B?a2pJS0JmVVh3UkNGODZ4QitwTjFGQlR0TGZXSmMzejhMa094ZE1vWVJ4NWJR?=
 =?utf-8?B?WElJY0pLSkExbFQwZEQralNxWHNPeFdPMi9QbDB0SDVSNjk4Uk1sUUpXd2VO?=
 =?utf-8?B?V0JYaVpyVGQ4WDhBR1R2YkV4YWxTM0EyTGNVaEEwMVhaS3hudjBvdTJEdjVE?=
 =?utf-8?B?VzhFSkxNQXVvUjBpVzFZZVJyYXpOUy9HV2RYa1NEUDRGOC9PcVNaTGF5SkUz?=
 =?utf-8?B?OENyVU56ZEVnUGFIcjIyQTF1T1J3UVFBcStMOXp5aTV3b1R1V1YyY1A3b3kx?=
 =?utf-8?B?YWIrYXYvTlpiaUJPQXE4ZmI1TUpzSHVDZlVzS0hhNVJpY2xodUJYVzNkSUFa?=
 =?utf-8?B?a2xLa2NkQVEwMCtlQ205a3VHcjNaZ0x4cTQyRjNKYmk3ekZPTnp0NFo1citJ?=
 =?utf-8?B?bTR2WXV4QzNXWnpPMDliZHRodHNwMlpPNmtLTXNlb0JZbjhnNkJuYVpFUGJ2?=
 =?utf-8?B?cTdISE1xdHdQZzkvQ1U3cXdHYmVncGw0YTh0TUtTdHFubC9qcHFnNDZ6Ukps?=
 =?utf-8?B?S0dFYXg0NlZERS9SNGNyOWloZjgxM2VuRGpMVEhqM3VMdlMzZEVhZUFsRktO?=
 =?utf-8?B?TmxWOXU4OUhGOUVBUHJhUGVkY25Iemp1bTFIak5sL3N0ZlhnQUY5dkhUbklJ?=
 =?utf-8?B?TXJjMnN3TFFsUEh6a2xFUjhMZWFEdzhUUEM2clZzcWx3N0FxendONjI2aDk0?=
 =?utf-8?B?dm5naXhKSjRZSlMzNyt2djZiMlBqNFZUQnBQMnJ2OU8zSkQrSVh4b01SaHhO?=
 =?utf-8?B?OGFaLytZL3paTWFGb05ZWjBWaEJYT3pqU3RFRit3K2FHdlpjb1EyOFMvWm5h?=
 =?utf-8?B?empxSnNablRrT3ZKcEJ4ak9MSTQzUDFKdmlDNG1lRXRSbVIreDNUVFZJdTZs?=
 =?utf-8?B?LzZVUmY2ZFRBQm5TakRHd3ZGL3lJNGFnZUYxY280Nkp1dEYrZGZvcTd6VlVw?=
 =?utf-8?B?WVpBV2tNUis2R3dJN2hCVWFLR0tFTGU5a3dnU0RlM3VNajA2ZTQzNW1aTDlq?=
 =?utf-8?B?UUxlc0JvN1pzM1RqTWh4UVVUQlR5SXBmOWJTQmNqaU5idUxOSy9KSmQvd3RH?=
 =?utf-8?B?bEJ6NEdobmNYcFFIQjBVWjQwYWNZTzFDQWR0OFltK2h1QUUxK3VyeDBWU3Vl?=
 =?utf-8?B?ei90U20xSVEyU0w3ZG0vS2FEOVEvbEVVOHdsRHZiN3czYlgxY0RRNms5M0tM?=
 =?utf-8?B?Y1RpVmJiMWVhNHNVNW9Scy8rTCtwcDFNKzJwa2tONHovampLd3cxaTFrb0hk?=
 =?utf-8?B?Zkt4Y3FzRDFJRmt4b3R1SGJWSjFGaklmZmkvRnJWQmtqeUw1Z0cwRXNXWTU3?=
 =?utf-8?B?OEduTFdvb2FiU0hBcUk4WVhvOVRhMVFJVkpob2E2UTVndjRSajFzd2l6ZTJQ?=
 =?utf-8?B?K3Z0ODUwVFYzTXhwZ2ZiemF1YkxUenZ1a25LYWtwL0pyQkxLeTJtMjRTMWR3?=
 =?utf-8?B?SHRWbS9mK0tUNmkwZXFMT3oxTzI0U1QzRzRmMEdOclp3WEdyV1BrUVUxTlZt?=
 =?utf-8?B?ZkpTazlVT0NBSmxNalVHVURxTkpVMDdxYnlTSGhmdmhYNVN6aC9zNWJsTUZD?=
 =?utf-8?B?R3VJU1YwQUduV2pNSDZRZ2FUMkdHTW9KbWk5UVlQV0FHZ1p5SDlmaHk0ZEJw?=
 =?utf-8?B?K3VjU2hvb3BVQk0wdTYzREZiRjFMdGZ3MUVWNWptR2hrdTRKNWtHSEVJcGJQ?=
 =?utf-8?B?SUNlQm5RSCtpSFRsT0FVTEdveE95TXQ4TldSMmtrOG1USjk5Q2c0eFp6anVN?=
 =?utf-8?B?NjZQNURVQ2dLcjVzZzZEQlpkckIwOWpKcGliaE9XcFNtSlZxelhYTFB4T0kz?=
 =?utf-8?B?a2xvYmpMNjh4UE53V1NpQ05IajlzSXVaUXE3dnFpSGhBU1RyTk5BODFYaVlH?=
 =?utf-8?B?a0ZKakxRUnlUcyszQy9VWDJNcml2WU93OUtOYllwY2ZMNXZWaFpkTVYrdFFH?=
 =?utf-8?B?Skk4WUYrK2FRS1F2VkVZWGhlM1VBZndGT1pBK0hYdklvdW1uakhkWS9oYnht?=
 =?utf-8?Q?Xlv9IMSxv6q8YEiA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07d5230-0e4a-4337-b692-08debca24f59
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 10:17:23.6821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWD3Vvk4sFtgLhhW2P4QJpfNqODYXLzUqUi/gsR90f2EG0jRkOEQTGTpV2GCKkw9YHapHo4omurJ6PM2xqw6fjX7u70VtlsWA2nZmpcoMus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5534
X-purgate-ID: tlsNG-ef75cf/1779963448-22D77C48-5019BCD0/0/0
X-purgate-type: clean
X-purgate-size: 1119
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jbeulich@suse.com,m:stewart.hildebrand@amd.com,m:jgross@suse.com,m:frn1furkan10@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,suse.com,gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:email,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7DD915F0740
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/05/2026 8:51 pm, Stewart Hildebrand wrote:
> On 5/26/26 06:09, Jürgen Groß wrote:
>> On 26.05.26 09:52, Furkan Caliskan wrote:
>>> Commit 6cb4b01c03 ("xen/sched: move schedulers and cpupool coding to
>>> dedicated directory") moved the scheduler files from xen/common/ to
>>> xen/common/sched and renamed some of them, but did not update the
>>> in-file path comments at the top of each file.
>>>
>>> Remove the comments rather than updating them, as they are redundant
>>> information already conveyed by the filename itself.
>>>
>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Suggested-by: Juergen Gross <jgross@suse.com>
>>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
> For ARINC 653:
> Acked-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>
> FYI, we are in the release cycle for 4.22, and I'm not sure this is justified to
> be included in this release. IMO it would be OK to wait for the next cycle.

Bugfixes are still being accepted, and wrong comments are a bug.  I've
taken the patch.

~Andrew

