Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q38EHSfUHmo9VgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:01:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D9362E3C0
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:01:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=OEGdN8uj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1324986.1590494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOjx-0003b0-B5; Tue, 02 Jun 2026 13:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324986.1590494; Tue, 02 Jun 2026 13:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOjx-0003YQ-7r; Tue, 02 Jun 2026 13:01:05 +0000
Received: by outflank-mailman (input) for mailman id 1324986;
 Tue, 02 Jun 2026 13:01:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUOjw-0003YJ-2x
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:01:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUOjv-003LI1-5H
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:01:03 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ed40a-2eae-0a2a0a5409dd-0a2a45068f5a-6
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:01:00 +0200
Received: from [52.101.201.1]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ed40a-7371-0a2a45060019-3465c9012a79-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:00:59 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB989281.namprd03.prod.outlook.com (2603:10b6:510:3bb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 13:00:56 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 13:00:56 +0000
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
 b=F8+tLlMykhfRRdnB9LQ46RlMzq8z8BLikD7JW6bM0q7DMk04ZpupTpVE6uEZdg26W6TG3HPSiIpXwRTOcXLSiOtZCiIo+71LzukJ/QVGJp46qkmDG2oCwMk6/rU6sZ5BwknDCBQpA0ARi6y+DUNpRBiHsSfGbz+ZQD7NDzL0lHhYSsgxtuKFcqPaCEFRdLHBTHUebQUHQY1vjaDLtMHoioGEz4xbJS7A1xqiV32m0MJ/Wmi0nVgndlA0s4E1jzW+hhiioFz1lxx9ePCn4dhdXVFN3erW0k0sqoPxSITMe3GKDwERbCB+pM/IaNpcgQcQmR9D5XA2ZO3/bGJ7lBv69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8O1ZE7Pq+2TshYKU8xnRWBNP3JcYKADGsUWc+Qhr32E=;
 b=PV8cVJ/i7u692h0Px36J96N/O9DzVEJtrkhm6UGkTOx1EvFrFSm/8DPXivTu7RpJTgLHTrEbfBkIz6YdACKPik6Hk73ZyxC0+0njEQsF+zH8XeE8A2Nw+abRB77/RZBgBjPHuaLeMSF//B1CBrjKLswAkQgv6BKFEPKt1R4vmUyrX77xGW+ofQYnMqD4OaHpYfcetPpi/SxvNkZp8P3tzoK2gu7CfSeIcPbqTZ/ZYmEyVMHzvtCuWefYpO35ECbvun4+DxlOT5D5F/DKVncnilZEjW+P8HUbslRdwKXgbVhZdZPyKpHpEUczwC8FtA2QPIPsNJAEC/5cuPspDy597A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8O1ZE7Pq+2TshYKU8xnRWBNP3JcYKADGsUWc+Qhr32E=;
 b=OEGdN8ujuQDaizbe35z+EbYgPyO0TGN/FRXDoQ5a8VuDW/XLlD5D1lxwwda49mPvX4VW7mnz5GwhzM7QkHOXzLgCncBjEIwjVrw+E2hZ2mJ1ZfYOkZs6Htk6Sl8n1v2Fsngxw2VyRCA1FPCY7LVvLOZXrTJR2sy1mU4ImdLbNSo=
Message-ID: <1ca74f11-6e86-4dc5-aa55-c3beee64b673@citrix.com>
Date: Tue, 2 Jun 2026 14:00:52 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>, xen-devel@lists.xenproject.org,
 Frediano Ziglio <freddy77@gmail.com>
Subject: Re: [PATCH 1/6] Add SBAT section to the PE binary
To: Jan Beulich <jbeulich@suse.com>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-2-frediano.ziglio@cloud.com>
 <e6cd8fdd-97d9-4f07-b952-079c67598f32@suse.com>
 <1090e22f-f1bd-43cc-9e8b-cbb6060d805f@citrix.com>
 <7e0a37b0-570e-46fe-864e-f29be43e6fe7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7e0a37b0-570e-46fe-864e-f29be43e6fe7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0683.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB989281:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b757b6-ede1-4baf-734e-08dec0a6fc82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099006|4143699003|3023799007|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ehUvkjhWRfaadWcNqTzEq2jDXhoomZ+87YhRRM6OUGa0M5BjS4POB1V+RO0d1m4B4TnYvX/wBtwv40HCFzwRUn41uOMTnNg/h3sSKwrFwNLReMAKX/0zlr1xUyku1aNDzDIqozG1klBreftpVHQVQ+x+ng9FeBCGysE/qh1glI7xuNT1UhyoaGuylEtXQHTAGjP56iDsGdTOjpXpMrskmb5L3ugV+u8D/m63JFaO7/XytwhdjwGEoEle/7zJS9B5bXm/OwSO8uqBdQiol3Y+8Jtk5RwKrURuYqArqqGQqbONfK59DsvgAji4Z3mili3f5FJeDitrRri7DIXiJiXi41bId+MveOx7H6pqRKAQBx4VYaYZJQrAkwcXhXR8yPuqF2cNNEWkl8QOjIcK4zzTdhfLFzNVjlwrhSx56yAU0ygFk3ECpYT551+RpepXyQKOD200v/2Qe+fO6b35Fd75VCo5EQwFFUSwCNQEH/QIe5dgn3X63QTNOvsRPKx/QGyfuaMKEFtBEsB+bqX4C2H5bDAZfl+ruaKTkR5tc7LrE8tjkIF4YB+Uc0NUhO2VfQjZov38O1HshZhCO/+ndVWFEP2PmnRTLIrgGJlRK1EbygmtcgZIkg3vW0nnxoNYqevZYY+O3+DS/15xkKzdq7jN64/N6OdoDvNjXVZPd72xdgTkKmpbGHP/wE/QkaLj2v/W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099006)(4143699003)(3023799007)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE80eWkzS2gxcUlWS1U1MUpVQ2lCNUk0MzlDVWFmNWRFa1NIRTNuLzhOelZ0?=
 =?utf-8?B?SWNMaG1EbzMyNGxRQnhuVkx1RktjUjZGSUxhQ0hVNHJ2QmdIZXVKREVKRnhv?=
 =?utf-8?B?bmhTWHFWa1AvWTIzanFGa1JUdG95VkRmTEgrWlN1MkMrWWVLakJwRjU4SVhR?=
 =?utf-8?B?RXhYUkJ3SG1ZZnA2UjlSZ0hDMkFzSllKdDBaN0d4MjNwVEpWVFQyVHF5bndp?=
 =?utf-8?B?UjZvZFQwcThyZEhEVVJKR2gzTUkxdjhzQWhGMkdOSXZ4dWNXQlY5bnpaWDB3?=
 =?utf-8?B?clROdXpPOW5ybzlWbzFXcjJKbjJiNU83alYwRXNmV0t1cHp2cmExOFE2T00w?=
 =?utf-8?B?QkE3NEx0dk5JQlR0cmg4YVZFYUoyajgvTWpiQ2xRdXRTZjlDbnFlMGJGQlBN?=
 =?utf-8?B?ZXV6TFhJazBkZDdqOG1FYVFZR21MOFNDMnZIeEdhQ1hRbytBZzZuZHhDSmpY?=
 =?utf-8?B?ZWg3S0dyVmR0Q0NNd1lRRThicndEUGZPd2hMdUU0Z3NkV29Bc0RNMkNISWFV?=
 =?utf-8?B?RU5iYWpqZnkxWVE0QVVQbzRZZXlONlhEaGNQRzAwT2N5c3hxNDZpODFOQVpZ?=
 =?utf-8?B?UG45WndaVUZlS2pDNzJnVi9uOE1pQzI1T1VqZFNIMnJKWlF5L0dtYWthTlBX?=
 =?utf-8?B?K3Q2YTcwM1pTbnFWQkJGQjdRL1BYTGJaU3hlNVlNWVI0QUpPcVk3QlFPamE5?=
 =?utf-8?B?ZTQxZE82S29lNnJROEFvSjB3NXBFNHdyaTY4enQremZYc2xZSU5GZFc0Kzhy?=
 =?utf-8?B?SGIyRForRnlFOWxQS3lUNG9uQWdZTGlwb2Z6OEQxaldtSG1QOTd5SVM1QkMr?=
 =?utf-8?B?Z05SSW1pTUVTdlZZdHR4ZGhhMkFJclhtSExOU1FsbVNCejlTajVQYkpVZkoy?=
 =?utf-8?B?dzVTRjlHUUpRYjdpT2xKeEdIWlFkWGk1eHlaT3NHTGYrOWlQREZCM01mWkda?=
 =?utf-8?B?QTE2V3JKMHFmcFg1cmx0QVVSNnNBcEJtVFVzSjRXb0psSzRHQnFUZ2dKaGJL?=
 =?utf-8?B?cWlSaW1YcFU5SmN3T2NRWXNuQmN5NWZrckJsNkI1NlhidnZmdEJpR2RWN01t?=
 =?utf-8?B?STRNV25qQ3N0d2tsc2JnTnBqcXgzbFZSZitMUEY2VU1aTWlCdFNya2pqditK?=
 =?utf-8?B?SzhYSE1Xckk3U05VNHFLM0krK1c2Y0xQMFEwOXd1anN4NmNDc2hvWWR5Q1lI?=
 =?utf-8?B?a04vbkoxSEhQYzRjaXJBQTNoRE1YbFZOLzhUVDdEdEhUcWhKVXViMHNsSW04?=
 =?utf-8?B?aEtQclNUWHV3K1Fyd3ZoM2Z5cnAwNGlUTW9iVGVxZDN0Y3puZFYwRmsyaTlU?=
 =?utf-8?B?bjh5YktmRHVvK3A5MlFhayt6NjMxb2NSRjgwL0tBUXQ5VFpkY1lwS0JQSWpX?=
 =?utf-8?B?amFpcm9lT2VBckxXeE1OcmtoZzFnWC9kVmEvN0ttbGJDVzZRNzJUQVJmSDlq?=
 =?utf-8?B?N2dxbG9LaWJTYXlGVUNwbzEzQzNXaXJ6VDNiWW8yMkZrTWxiZjhZTDJwOGpj?=
 =?utf-8?B?MEVoNGNkVjN2L2RhcFBNVE9laEdyc2VWY0VXbDB5K0Q5TXhta0lEandpZE9E?=
 =?utf-8?B?OFZPVFZaNS9ha2s3eS9EdWVMZ0V1NlBQUENZQ3RQRzJpdXFhbCszUThkREpR?=
 =?utf-8?B?dTY2RjVnWkh2aVhhN01nZHVKbXl6clJKSjlkaXdtTFQ4NHNKcEZqMWlZeDdD?=
 =?utf-8?B?N3BjcGV4ZkFnL2t5SitGemxJMUNBREpPSHlQWjI0TnNXdEpXVDJ5N2hDaGtt?=
 =?utf-8?B?ZTBaS3JwbjRsMFlBSkVJVXRZRnZFendIaG52ZW1CdjdNVWlPU0RmL0VUMTF0?=
 =?utf-8?B?cGcrNGgrbDE0dTlINUJONW9HYjAwV24vb2ZPQ2RmWlVHTk9kR3JNbFp0RS91?=
 =?utf-8?B?ajBvaEZwOGozeWVqOHAyQXFuTVdlMFpxT3F3c2RDNGEwcHpQWGZxK000a2Ex?=
 =?utf-8?B?cWc3T0xrN3luQ01UdXUxYXlqQXpCcUdCYkRJZnFrVm43VEpjRHcwZ2xDK3dT?=
 =?utf-8?B?d0FnYVprTDhKd1VxN0xQeFlQUEVFMEkxR1QwRGlYVm1FdjFwMG1vZURZMHZh?=
 =?utf-8?B?QzBwdUpiVGtzNnpCckZ4ZVFqVng3TmNsbHdFTHFFbnJjL29MRkY5aTltRVpv?=
 =?utf-8?B?ai90RDViTUhDY3NOWjhEd3c5ZjhXUENabUVlTnJDNkxjSlFUbkxJaG13dnll?=
 =?utf-8?B?UmRML1drVVpzSGNwampTZy9iYkJMVGJnQ2xwV3Fjd2g2Q3Y5RG82bjMyVmdL?=
 =?utf-8?B?YnN5RitQcHpGMlpZU2Nnc1FPcDh0KzhOVmJ0VWRpaHVVOUNUeXhxbEM0cGRl?=
 =?utf-8?B?VTN1cVRCWERsdHB1RlFyZFl3blRkMFZHTys3YTRMYzBDOTl6Q1ZTeHRSSGZk?=
 =?utf-8?Q?vVlRRWupwxxG5mzU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b757b6-ede1-4baf-734e-08dec0a6fc82
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:00:56.7462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdyHewM8BXFw36QrzchWfxhmCdtkBGBxIhaEGBJoHD+xxFWV/oyQ4DMw74cdv3xCEnLOY6esDbA0KmW8rxJqbEHiCIsKoj5ygn3jwPzRGEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989281
X-purgate-ID: tlsNG-16d1c6/1780405260-87170D75-07D4C976/0/0
X-purgate-type: clean
X-purgate-size: 1106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[citrix.com:query timed out];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:gerald.elder-vass@cloud.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@cloud.com,m:xen-devel@lists.xenproject.org,m:freddy77@gmail.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,cloud.com,vates.tech,amd.com,xen.org,kernel.org,invisiblethingslab.com,lists.xenproject.org,gmail.com];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:from_mime,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5D9362E3C0

On 02/06/2026 1:58 pm, Jan Beulich wrote:
> On 02.06.2026 14:54, Andrew Cooper wrote:
>> On 02/06/2026 1:06 pm, Jan Beulich wrote:
>>> On 29.05.2026 17:35, Frediano Ziglio wrote:
>>>> @@ -275,6 +276,9 @@ $(obj)/efi.lds: AFLAGS-y += -DEFI
>>>>  $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
>>>>  	$(call if_changed_dep,cpp_lds_S)
>>>>  
>>>> +$(obj)/sbat_data.o: $(src)/sbat.csv
>>>> +	$(OBJCOPY) -I binary -O elf64-x86-64 --rename-section .data=.sbat,readonly,data,contents --add-section .note.GNU-stack=/dev/null $(srcdir)/sbat.csv $@
>>> That'll be an SHT_PROGBITS .note.GNU-stack, won't it? When it really wants to
>>> be SHT_NOTE at least for bleeding edge GNU binutils (see relatively recent
>>> changes there).
>> That was my addition to prevent there being a warning about RWX stacks
>> cascade all the way up the build.
>>
>> Maybe a better option is to have sbat.S with an .incbin sbat.csv ?
> Yes, that'll avoid all the custom objcopy-ing.

The objcopy line comes from the instructions in shim-review, not that I
think they're great instructions overall.

~Andrew

