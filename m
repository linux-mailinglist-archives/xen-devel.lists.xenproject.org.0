Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CeBCCmHcKmo3yQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 18:03:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A9E67348C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 18:03:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=qFhBKSx0;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1335862.1598009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhrX-0004UI-0W; Thu, 11 Jun 2026 16:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335862.1598009; Thu, 11 Jun 2026 16:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhrW-0004Rq-Su; Thu, 11 Jun 2026 16:02:34 +0000
Received: by outflank-mailman (input) for mailman id 1335862;
 Thu, 11 Jun 2026 16:02:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wXhrV-0004Rk-9K
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:02:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXhrU-0076Nz-MI
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 18:02:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a2adc13-5cb7-0a2a0a5109dd-0a2a450bac92-12
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 18:02:32 +0200
Received: from [40.107.200.0]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a2adc17-212f-0a2a450b0019-286bc800077d-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 18:02:32 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DS7PR03MB8034.namprd03.prod.outlook.com (2603:10b6:8:250::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:02:29 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 16:02:29 +0000
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
 b=atbPVOY/mHFyzdqwNgEG3cgdCH8gKMMmIjd7rDZ++jZqCbw4zuXePqG5V5EUiQ0TXRNq4wkEszBzb9NqP/IKk9VSCurxMzfZ5gHlhnTfh5VrcQBIsBd8gFVhzXtrIeQhRH/P8lccNvuphuOZ0BUb5yFBZNEiUTgoZS4xC/s+Pkdh+WoJhaf2vJEzeAQclMF+pRKYbQoeK3acJXsqvoAcKaCiGYGGbsGYy0tinNjV9La9CI5fkexrgwf10iSczXHNJXi/H7OOIbpGwQd5gAQGV4WxODxJckxX+dfBVVLOgcTRXx1r3Ix8dsilpqLV4lhjc0MzeNfq08sTNmey+8WG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTZzeQW6Bg1X/5ulfZ1+fcS4tzPxkvTsofSYpu8tyDA=;
 b=FmaKcX/qxMvQegCNGcj/UeIzK7Rf3tyCUUmqDCCEo7U1+HpeU5HKmrRxTFzJ26eQGP8bDhOTp9a0wi+mgg8VoE4ccZw79O387CQlq4T/VkDams4C3Xqz9BSBJVWZk2nknQxuUR50/YNoVHdS3g5kIFU5CHDUQCYx3i9w2YtMqMBPmY6nbZSDkBpSgw96hO2Iya6Q/2WrCIHq9kEoRTJ72fAFPg3hT7bPy2BTA3yt+cb1921P+3cbJa5o72I8NOFtPxPZKMLdZWjvnkyi/QtgX4ql+Yth4AP/SgGsM05wIUy9oAI1QLCATifxmYugI3hJtZfh3TSxT+A3CUOlZyI8Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTZzeQW6Bg1X/5ulfZ1+fcS4tzPxkvTsofSYpu8tyDA=;
 b=qFhBKSx0FmH0LMPauMssrsPuZOic386Iz+OqVKDhb5hx5sOnDC3tJhQVdC9V9P8XV7KTm7i0FegPE0YClmBfC6WOb6q7hBONx4aARf9UuYPtNDbnffouDG3DEkitkA6IaTamG3LgrkrvP6KR8cR/8hi+3zzs3KIvZARaBlEAieI=
Message-ID: <552cac1b-2be9-481d-a687-01c965ade221@citrix.com>
Date: Thu, 11 Jun 2026 17:02:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] domctl: Avoid taking domctl lock for certain ops
 used during migration
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <3034d82a-f1ae-4c6c-a293-ca44b7e086fc@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <3034d82a-f1ae-4c6c-a293-ca44b7e086fc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::6) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DS7PR03MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 893a66b7-9f70-409d-507c-08dec7d2d6ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|6133799003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	SjKLFPKM3W38kKjv6tjk+I7+mMEdCKmPi26xOlkjnATaikrVk6I5ve7B3VyHlqBzzQhGM5SQIZlgSXp5EW2fdSoYqcc+47CxpbeX/xnaeQRCpS2NHEVDn4GuQB35cfIq0lQnRgE1/rPJp3QairJ1kZ5XrXu7Wvw252bJTgRUqjVd/d4Fct3d9dNfxRw7S1iman25UDHwtkXCJJTfmtxmFGiH8GgyR7pXUK/Ib+vUxV+1U0Nr44hLK79g34dpUK0UTsi9VSW6yBl+o+4q37MAJIkhJwHL8mhCc39dq+t8u7pSi9Mep36uIbuIRcWSLv8fT+qhiEfwAnxbmJ3llk4httgV+xZbCQK6ZpfmPOXVugyD4NmhEbWfDI2UDkeKE2JLvPvzNW/kqx9dhnQK8FEOLJOOAv28XLVgC4Zzm/hm9ZCDo0xvtcLvAtEJ9a+RqRzLpCCiG5BOdE1Nz+71YJBXjjHf3rxLIP0o7y+w46QZd2gbUF+6vOgPeWT6P3wiGitnsxNvNRs23I/wVwZicWFL/Q+pYLAIUPS4rHUqZuycYB4Vgx0JehxOc0YvcV9dWf6A7q3vMBMzttA810gWYap1waH3/7rJFBUQUCpvr8QD3Id42Tcr5eAoquPH8EKq7UB5Mm+C57CiK1+ZPZZGRjq4ZOysf4x1gGXrEr8ePWYE6haNdyKWmIRI7LfSKZdYYSDi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(6133799003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anZzZk1GT3FrbFQ2SWRHOGFHZU1wVmRlMFNkdDh4ZEtsaE14SEh3Ui9NdDIz?=
 =?utf-8?B?N2tSSC9majRtbDUxQ3VURDkyMUVrMHRpYUdtYTU4RzZSZFBXQzdJWHJIZHJ6?=
 =?utf-8?B?RElFSGdzTVFrNlVGT0Z1QlJSQUR3enRBMzhOL2drKzV2d3FhckVWRFVVV1l0?=
 =?utf-8?B?aW5mOUhDdGNIQTh2Qnp0Um4rZ1JYQXAwRVQ2bDNTVUw4OUJWUk5pQ0kwQzVG?=
 =?utf-8?B?a3JpcDBxRHVZaG1WRTFTeXBUS1VsbFlqWm5vb3FmUnorc3YxaG1Sc0pIaHdJ?=
 =?utf-8?B?ckhUNW9BbkpJOTNzdTZ5WFNRdDRFZW5wOGVOUm1JQlpNc0VnVUwyZDR2WW5u?=
 =?utf-8?B?NXFLSE9qSlFaQXVwWmFiektqdnNvWEN1WThwb1NzUHpQM3B6WXp6VmFzRWtR?=
 =?utf-8?B?bXppQ1NpUEplbGpUenZnVkgzb3dCUUowaHVmejBPd0pJTzhWNnJNOXNYMjNS?=
 =?utf-8?B?RzJTS3ZhRzI1c3RVNk4zamw0VXdrZzl2WkVzK3FySTdxU2JJNzRrZ082ZThk?=
 =?utf-8?B?MzY0NC9GT3pKdUtBaHZiSnFtdGRCa2tHQlk0VVZOSG9pRlBtSHRBQURML2hp?=
 =?utf-8?B?a3h0eDF6ajBBbFNlbkwyK1ZpalRseHp4eXpHcnBPWXhCRGFSNHE2dHdNN09M?=
 =?utf-8?B?WDhIdEJpbnRaVGNFdXlBNHdqaytGY0Y0anlVYkRwNmVqb1llbkdGSjNDMytj?=
 =?utf-8?B?WForOHdhNUdPTTRuNDFaQ21MbkJwZ0ZTN25pYmM2S3FoZU9teGxKYm9Bamtl?=
 =?utf-8?B?MEVmZTNBcVI3dCtZVkRraCtkV2pOTmU3OXNxaEM3VVJxbWEvSXZMYkxreGM4?=
 =?utf-8?B?ejdXSmhaYkU5ajNNUjlIOXF6UmJ6RkY5OW96MTIvVHpOREoxM2Z3TG1hbTRB?=
 =?utf-8?B?RjQ4Y2NDYStQazlUbTBtQ3Q0bldtVTN0QzZubGFsK0k2V2NpaVdqS0hFUTNo?=
 =?utf-8?B?WmNzUW5BZGhhcllCVlplcWNjKzVVYXh6YWxTMFdHTzNiTXFnS2JTR2ZONzJ6?=
 =?utf-8?B?YjljTDQwU2NhdWpOMHpBNkprN3JKU2hRVnNtVkJaSkk3MXhuZ3ZacUxMS1pu?=
 =?utf-8?B?WXhxWXdjWUpxbnNSeTY2eWJZYkdqVXpVdHpJV21CUFNPV1ROQ2phR0YxaHFo?=
 =?utf-8?B?dGdCeEpna000SDF0WjRIV3l1ODBXbzBJenFrUWo1VlJpZ3Q4T0VXK25od21H?=
 =?utf-8?B?T1RwbjBYQ0d2TUtSMnI2Zmt1MmtKSmh2dEZlUDhZaGpqM2p3bVNEblgyOXpJ?=
 =?utf-8?B?dFFyNjFGT3VTUlRnaDZCckYxYm5ERExUakw4STFQN284cmV6NXZNK1pySmNu?=
 =?utf-8?B?cnh4YkdqWnJDYUZ2Q0gvM2FoMDlPempYSGlRUGw3LysyV0FSY2s1SC93MUFX?=
 =?utf-8?B?QUV1cG1aZUdtdEU0dUJ4eVhMdzI0ZEtrNUlhU2ZYaHdWVW1VYXhKN0lodDRH?=
 =?utf-8?B?SW9VZTBmN3hHVEpROXBudkhidmRtWSt2cWQ0OS9KYytnRGZ5TVppMG5ZcWIv?=
 =?utf-8?B?YjFlMDQvYVBTUkpOMmxhM0xhRGRnWHdxSStWemVMRFBzRjg0TWpadjJHRkFQ?=
 =?utf-8?B?cGdsOFQvWTBJZzN1Szh4cDFUcEs0Qm9CS2tGWmU5cGMzcFRTNCtMN3Y3U0hx?=
 =?utf-8?B?WlpuN2JBMmJKb0VzbWVjd2FnUHU5VEppYzQ5VmJUazY2bWFzVllpTWhmQXdy?=
 =?utf-8?B?b3BVcEViWEpFS244eHFvU0diNVg3N3c4aFpqek8zVWlpSVIrMDNLVWIzdjE0?=
 =?utf-8?B?RzFwVmpxQWw2K2VsQyt0azB0Nzc2ZnBZOHNuSzdnVU5LRTFoYVd3cGZpd05R?=
 =?utf-8?B?eVIwa3drQlBtaThLbDRua2xRd2l6eWhDWTJNRElTRk5rWlNyQ0FQTkNwU05a?=
 =?utf-8?B?SERoMDc1NnhOdGt1YythVFpDNS9PbzZ4a29KOWVheUdRdXR1b1hOVkowaGJM?=
 =?utf-8?B?TmxBQ01BU1FpSHVHWDlTL1VNczJZT1ZFcUZXK201Rnh3RlFmMC9aWnAyd3dF?=
 =?utf-8?B?ZFFEU292c2EzQVlUQno0TUNpK21icGVhcUdHdVdObTV6VUZhdDlyMHBNeDRD?=
 =?utf-8?B?clY2a0o1Tk9jU2tYYXdoVnhHWTl6Y2MxS0RNMzlFWGQ4SEtQRnZMaDA5RTNs?=
 =?utf-8?B?bmVVbUpJV1hxY1FaWGJ2K0VvcExuOGFqN3VUcnlqOHo2OGtma2s0SEEzSlRG?=
 =?utf-8?B?aDQ1alkxZGxMOVA3ejJvK3NLSWlhb1l4Nk5TZmMrTzVRVjB2UnAybWZCdEVF?=
 =?utf-8?B?UCs2bmQrRDNwQ05KNWIyUjQvbVBUQ1YzZlkwYnN5UnlvWDdJdjVwUGJYODBP?=
 =?utf-8?B?RDJ1R0F1MmNHOUxxMS9iclV3ZExObzV2bXpnV1gvZjQwK3AvYTNWZWIvRDdI?=
 =?utf-8?Q?ay2AXdZ6AEJgFsUY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893a66b7-9f70-409d-507c-08dec7d2d6ab
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:02:29.3741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIxkbeWl2Y+ym1eWz9Qrp2kTe97fANqZGf2P5a6zVTWpu8Sgk7NX3wNqL+vTehV8Wers500o6czYXqy4uzOFnDMAPK+1P2CJ/y46JNVrCZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8034
X-purgate-ID: tlsNG-42698a/1781193752-18B60F3B-1A549A5F/0/0
X-purgate-type: clean
X-purgate-size: 1144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RSPAMD_EMAILBL_FAIL(0.00)[ross.lagerwall@citrix.com:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07A9E67348C

On 6/11/26 3:55 PM, Jan Beulich wrote:
> On 09.06.2026 17:15, Ross Lagerwall wrote:
>> When performing multiple migrations in parallel, the domctl lock may
>> become extremely contended:
>>
>> * Operations like "xl vcpu-list" were observed to take in excess of 20s
>>    to execute.
> 
> Does "xl vcpu-list" involve ...
> 
>> * The "clean" shadow op may pause the domain, restart with a
>>    continuation and then become blocked on the domctl lock, causing VM
>>    downtime in excess of 20 seconds.
>>
>> These issues can be fixed by not holding the domctl for the frequently
>> called operations during migration.
>>
>> Thanks
>>
>> Ross Lagerwall (2):
>>    domctl: Handle XEN_DOMCTL_getpageframeinfo3 without the domctl lock
> 
> ... XEN_DOMCTL_getpageframeinfo3?
> 

No, but "xl vcpu-list" takes the domctl lock and this contends with
XEN_DOMCTL_getpageframeinfo3 and XEN_DOMCTL_shadow_op taking the domctl lock
which are called frequently by the migration process(es).

Various other operations were slow due to the domctl lock contention but "xl
vcpu-list" was the most obviously visible example.

Ross

