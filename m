Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VZw3MOAUNWoBmwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 12:07:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6706A51E4
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 12:07:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Si7pdZPd;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1342027.1602326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waW85-0005tX-64; Fri, 19 Jun 2026 10:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342027.1602326; Fri, 19 Jun 2026 10:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waW85-0005r5-2K; Fri, 19 Jun 2026 10:07:17 +0000
Received: by outflank-mailman (input) for mailman id 1342027;
 Fri, 19 Jun 2026 10:07:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waW83-0005qz-K1
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 10:07:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waW83-002JJB-0s
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 12:07:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3514ce-e002-0a2a0a5209dd-0a2a45088a0a-20
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 12:07:14 +0200
Received: from [40.93.195.35]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3514d1-9ee7-0a2a45080019-285dc32335f8-4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 12:07:14 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA1PR03MB8046.namprd03.prod.outlook.com (2603:10b6:208:593::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 10:07:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 10:07:12 +0000
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
 b=i08oEaMMVy+gPJYqbO20AanGz/ZnQS7OFlR4U+Dlwy/qzauU1Awq7SXNoEy2xm8umeSlO4VWaR1yZOP1kUDhbb3KSclLrrCOlZxmMerKgdA4zje7qcnx4Rjij38SqpXU2Um7MQabtVsNyktI4mHu4JhNsF4ABmKJWVgy9/UEf3Pk8T/SjnTdlhxAkfGT+61mmcQPN1FMOXqzRDFWS75EYPqLTzPpNOCnUJJQAracFRh8y/8bu5DVuiuAGVxmrGZrBP+cKyo0qJLvAf6DMU1LIwXrOOUyWijvnToUZZSL5P5kMeHpVWJRJvrANknhmn/pz2RJ1tZ6dez8h71QaBNQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6B99odyI20nUE4Me0xwTmieYBLyaiIzkirIM1rIlRTk=;
 b=CI+uPg/hZrpbWzaRo5fdvC0MqfC/uoao2D6cDG7m2uR5i40LE4RFqZWkV22v2Np7c227pKKuiPfmehTCM/tyB+loI6LuPBEJbjmRphHaU3l/vgLnjf0ibcwK41KHj4M5gjTGAlBSUKw/SyMtck7b14OkOQKvmf/N+zaB9BzNlRjpLGVy+dpYdOO/12qjIS8ia+ctRBpuM/n9zu5hkgnQaJrqS6EaTEfpJiD11upbyH8dL7sY4lJSY8ZQVJuqmmL37US/hJVjWbiYbyG6o8kN3VnICnqjYJ0Xy0mln29elTt1q+rwJn04riDcghlF4ZoTKq2Ljx82i1X7QqZu38XuTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6B99odyI20nUE4Me0xwTmieYBLyaiIzkirIM1rIlRTk=;
 b=Si7pdZPdEchuQo+lTns+8LqBInCoCwks4nivu/08fHz2OPYJ38JnD0kNhUA6W4+riPXSc1vJOd5X16bSc3XBm5EdMNV3FqAVCOgB9LmgwattJ1KcFdJ23GhGRcxvDX6BZbsiIYL70S0lZquKDJ7pPV29QOim5SG6KyFF0+xNdy0=
Message-ID: <812e4ef3-3da9-406a-8512-8b29ed983e48@citrix.com>
Date: Fri, 19 Jun 2026 11:07:08 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 11/15] vtd: Rewrite igd device check in
 acpi_parse_dev_scope()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794558.8631fc262581453bbf619ec5b2062170.19edb3b524c000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781794558.8631fc262581453bbf619ec5b2062170.19edb3b524c000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0140.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA1PR03MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e426ef6-82db-4eb0-6988-08decdea87df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	N6Z2mrVqW8JDPieRA2Yjm5YeGMkxqsG9MyxVSDle7VMVqU3H4056Jb7lwXCGSa79oQ0EEO06l7MnsDoFSXpRgQ86j6f5FYrWZSA05hHzJw4zqiO4etgdOcVe9bGmL4aGiIhWK1RPWkam1/ucZf3nFotxNlvqW3aSOQkknmHJRaYZoIr68WQ2JQ89vLinbfheilOQCXDlB9+vNiIRIFu8I8kX7KKolI4yU4peeiBjpFJEtrVxz1chbGcrQ46NwZaC43xudhLt5Oi5xe9EzgUVv+IeKYgFqMOw0G1/qOLFI3/Z1H/Epqedk3hPlE+C4Iu9kr0kSH/QbNoNMuH4puN+c+MyDCTv8dk2An2TsK2uHwylcGk346pSw9IdRt1E+y6PP0cvJnVP87V+udeXa54tBPrgC8uKhiEkIduz4ekT2Jw4BWayFCfeMU35GpyGelJYnjZMcnlXxO7WUUYiNIRjA8KvwP+wEHmUy+8rdB0Kzyd9XyHgStBpB3ksT7JO52xg1RvYI2nWVAbQQm9V7AqvjXuHXqmbX0r92nc/ECUuxrB3+yH7hZmilAfX/SgraHa4TntlKQ2jlSnDrFJbv3BVbteAdFXz4EvV5WkJX02W8Ftnz/fAvbj8gTBdJeD9ajae7BfFLfOaSND4yIYlFUDuwhBe4An4Lg4xX8F4NhPF1qI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXFiYzNydWNVUjgwOE5Icmw2TnJ4dkdiWHBabk1JcmZ3UEZPZE1FS3ZLNTZK?=
 =?utf-8?B?eVFGTnBQb3lZTGhFNVpnNnFpUWJLRkg1V0laMmVsOUVNOW9FSkZsOXh2TFph?=
 =?utf-8?B?WEdBSUp5aWkvbFFvaWhncUZRZTBidmZGRmZGWmRVRTlvWDNhUTdqa01LUUpO?=
 =?utf-8?B?eFVMYXFyL0VRa1hURjRxVDliclVwZDlzMnFiOUFCOE0yenBZWUdvS0QyR3RG?=
 =?utf-8?B?eHlxZGdOYkwraGpWV0UrNlFWaGNIUjJ5eXhPeEpDU3FIZkJsaFRmNWFRRTdn?=
 =?utf-8?B?Vld1VmM1bWZGRmNzRVBMWEp4T1VSd09GV3NpZEdvd2NJWVFHQ1VndDhTSEJo?=
 =?utf-8?B?V1FYMFp1QVJVaXAvcnlGUkljdlByTTBrbTJyblUyS2ZQUW5wSVIwSUtiVnJw?=
 =?utf-8?B?TDFOeS9wY3VzWC9wNmJQalFEMXMwS2Nydnp4d1IyaG1OS21LcW9VaVdMVWo4?=
 =?utf-8?B?VXZUaW1zd1JxTG1ramtTOGNNQzh0aWFHTnFaTTJheW01WTJWaXVQRXNZcGdu?=
 =?utf-8?B?MFhDRXBmblMxQ0kvaEJKa3lWVGlCT2dhVlphWitHT0hiTGYrMGJqWHF6SWtB?=
 =?utf-8?B?emd4bU5mN1dRNUllNlNQMzFzRlJDSEZLSkpWeXJ0QjM4OWpwMTlPUnFkWCtS?=
 =?utf-8?B?eWNGM1dLQm5GQjdhUExxdHB6TjJlK01mYWxsalJudDNDcUI0TTdvQlZoNWRV?=
 =?utf-8?B?dzZNY0tKZjNsUFhCY3BzeFZuT3kwYUVVZ0w4MWdmSDU0VndoVjdTZUdZaW90?=
 =?utf-8?B?SGNrK1VtVHQwemJjUFl1R3UvRzNWZDRYVVpyQ080Sk50ODFWVlB5ekllWitK?=
 =?utf-8?B?a0toUmtsQ0RtR0dPNG9MMVhVTDVtdHNvQTJ0eWVyUzdoM2UwNm43cWNhMzcy?=
 =?utf-8?B?Slhkc3ZSUjRJSDI5eWVDcnRqOXVwQTFQSVBxcE5DOGJveWJadTZZbkZlZ3V4?=
 =?utf-8?B?RzFYS1ptcmZqeVQ5d2JXd2NsbE1hN3U5VGo5dUhrZlBsVVBDbTdlU0M1bHVB?=
 =?utf-8?B?N0FTNG5jQW5ydGxvNW1pOE9MWFNiSFhwakFGaWtHQ280dnpTRDdPbDdQZ282?=
 =?utf-8?B?OElvMU5oMkZ4aHhxTE1iK0hDYmsrOXplRzFDekNqeFBtc1hVMU9BWm5sNzRY?=
 =?utf-8?B?MnpmUzRlVVEzd3RPQ3hQUE9jbHI2VEEwbEprOG5MTE9EaURWNVlrdnF5TGtV?=
 =?utf-8?B?enhTNTdrRzZjWTBseDBnR0d5Tkhwc1dCVm5EbmJ6VjJJNFJObVVPa0JpR2lm?=
 =?utf-8?B?MDNrbTFWNU9tV2ppaGVJM1JzNFJBUjVyVG0rUWswN09zNWdQVDd1dnRyazkx?=
 =?utf-8?B?L3dodlRZb2hHdUM1dXYxdmVISmhzbUsydy92NUtjT01OSVhwQUxuUDF2cEgv?=
 =?utf-8?B?VFNjQ0tEcWRscjNGYWNWVTczZS8vb0k2Y0JjZEt0K2NVbzB2aVhtWXBxMzlE?=
 =?utf-8?B?cFFwblJYSnBsdk50a1Nyb1J4b2JGdFZRVXI1SXZiRHltMlJzV1pacGw0WEI2?=
 =?utf-8?B?K05Iem5ERW1VQmk3WEVYeXU0ak5iMDdIYzhYdHlvMFR1UWpORkxsR2hwL2pG?=
 =?utf-8?B?c2crZGtTWHdiSFJYN3J0WERkNUlJc1VGODZTZ0RmbjlXc2RVSm5OaDRJWVVs?=
 =?utf-8?B?ZHh2K0ZyVjhaaERxcW9zVE1CN003L3JIS0tHUXZaSW5NaU9jTDZITWJ2ZEtr?=
 =?utf-8?B?MCtYbmFCY2FuMWNsT3ZoMjI0aVRHajZ6bVdWOFMzT0pqMHhEcHBQTkVwSVFG?=
 =?utf-8?B?V0hsWnN0ekozWk80SXlIRC9WVHM0L1RWTkZna1RrRE5USHp0cGhzS2ZyQXkz?=
 =?utf-8?B?MmJySVM3YWZLRFNmNkVOOHRzRXIyZTRkSTZOV0NjVWl0cXcyNHZCWlpmQlBC?=
 =?utf-8?B?ZFNSeUN6eDVzZ041bWlwZjdwaTcwVk5FT3NHaDVLeXFFbTFYbk5hWWRJZ05I?=
 =?utf-8?B?NmtLUE5DVTJwNzZIK2t1UzZSd2pPY0k5ekhkUVYvV0NDMHhzd1NIOUZ1cVdj?=
 =?utf-8?B?V1lWWHc4QUFzUTQ5ZVdtaFN3ODR0RHZBRkVkM1B0Y3BYVjhUc3Y0MjZVeXBO?=
 =?utf-8?B?Y0dBeHM1dVp3cUtNcFJWZENqOEVWOW1kc2F0THRHQ3A4K0RzSVdWZGdwTHYw?=
 =?utf-8?B?MWMwSHFEb3NDb3cyMThxNXVNRkRManlmRDg4dHhEM1RWVm55eEhMaEtsRnli?=
 =?utf-8?B?a2EraURyaHpzNHVwV3FmcFlhYThXNjRxSUZhWHZ1dFNIUDhPZFZZaXZsZGRQ?=
 =?utf-8?B?dmdEYnFCSjRKMGxKVjlpa20yU2pDRytEYWJWaW9YZTd6WUsvWlVWZzRJV3Qv?=
 =?utf-8?B?RGx5NFJWdFduazQxRWtjMG5pUmR2MWZqZlMzR1pTWlErbnNTSWM2d0p4UnpN?=
 =?utf-8?Q?aZXwDaTs3bASdeTM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e426ef6-82db-4eb0-6988-08decdea87df
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 10:07:11.9634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzlhTvqObJw/NIGOBdVmjfuF6G6x5PoE7zm6rjH/RbVIoyEXd4Xr5w4eo7P+Hro7vTfZFlSpEKy3EdJ+9fAfecvibJFvNznD3/012wzatL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8046
X-purgate-ID: tlsNG-c1860d/1781863634-6685A0FA-20B90126/0/0
X-purgate-type: clean
X-purgate-size: 367
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A6706A51E4

On 18/06/2026 3:50 pm, Teddy Astie wrote:
> Make it clearer that we want to check for 0000:00:02.0 here.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

In principle Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

But, shouldn't this be part of the other adjustments to
acpi_parse_dev_scope()?  It's not clear why this change is split out.

