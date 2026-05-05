Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONQSDuS9+WkIDAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 11:52:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C01E4CA2B0
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 11:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300420.1574947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCRc-0000D6-Mm; Tue, 05 May 2026 09:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300420.1574947; Tue, 05 May 2026 09:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCRc-0000BO-JZ; Tue, 05 May 2026 09:52:00 +0000
Received: by outflank-mailman (input) for mailman id 1300420;
 Tue, 05 May 2026 09:51:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wKCRa-0000BH-Ud
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 09:51:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKCRa-00BuH5-8R
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 11:51:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f9bdbe-e002-0a2a0a5209dd-0a2a450bead6-0
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 11:51:58 +0200
Received: from [40.93.195.5]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f9bdbc-212f-0a2a450b0019-285dc30517df-4
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 11:51:57 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5226.namprd03.prod.outlook.com (2603:10b6:5:229::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 09:51:54 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 09:51:54 +0000
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
 b=t+FqDgr4qEDLO095/q7GD8adPNmA9n3YCHxxhotqeL4DVUkaM0+AOrUHxdkZwALyKWPf5jV+xZfUc4oL6Gdxx+Fg7Zxal16m50Ale3frD75KWgRo2ERKg3nY+KNYdc1xeDRkDiGc3wXEG8/50DVsDhGGhhMc8NdMVEnFrnmAMDiuMIN5AcJkkbH6IA1zKB8D3MOCAGpqMU2uSAR8iqJto2n571y3hoi6aETWzEL8/LCuPE1+UNX34ntCkVtBSuesNsbLcfO5sy2yHXZJly2qaTmxs0jrQ0qhzFzuFH8djV/BioxV8YBQqw+xS3LMqRCD2XeB6lww2xZ/LZTbQDCplA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x04ahgBByQJsXXmBoTLtnTDW8y+6xS92mrsbssJR3us=;
 b=rqxT6jW8TV7mjgO3GDBRBB9kJ8N8UT5GlQALjGfSGRwB5vvtuE7EyS2AFuCAuJvjNcg+OK4LR0oU9dthSOte+NzfzSlXWbpzBG17nhLC2RYa0YOxM5ETJXnF82q+2bFBnaELpsUgi18e7Z78T0T31RNkSNQz+5vGFSFXxDNziPCXqwEXGf7ez8ln7ru3KlgXGl2+ahEZJtx+PWcZ8lEgfkM6fwW4/eTetfPteLyvSVwRs4EZntFGJK0KTVM7p5O+KJiM4zHoyBqnaxn1bIj5B8vBFHZEvp47XJyUUXERuKZ7TbIivhbph8bPDSFBpL3+PLNundM5khKJWCre6ACHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x04ahgBByQJsXXmBoTLtnTDW8y+6xS92mrsbssJR3us=;
 b=aL2pWyFvB7HseKTFnXtJRs/9CRh9PRHuirX+CYg3XAgKj95uCj8EjX9RotKBEtHWxzPFAZ7o0o0SWxVZwtzCI+PA2FtgDf87kKlM6jPR9y63mbpejd2D7OntUXX7rAeIDUO1Y7ixd4j3wMAUvdzZJRx+GUDZW7rYG1h8A3xQNbE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <97213bec-14f0-45e0-ac22-c01b4db5df6e@citrix.com>
Date: Tue, 5 May 2026 10:51:51 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/boot: Disable interrupts when establishing SSP
To: Jan Beulich <jbeulich@suse.com>
References: <20260505084315.1350002-1-andrew.cooper3@citrix.com>
 <ba9facaa-84e1-4c61-8e47-9ef76067a922@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ba9facaa-84e1-4c61-8e47-9ef76067a922@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0189.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5226:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9600c3-fb7a-4b38-b2f6-08deaa8bf066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NtAkir2KtG38XqabWn7byg1+z7rmgc8IrR3WRCrXB4akVAXGsOUnQbHeETQSHxdtXkFHRMiCXzb4uQGOoqaS/+DTXTJQraXvkgIlmpRSdiPVmd+4wDsVop3XrOAfVa/IhphPyCLAw04O8tNx74aOpT7zhDGd+wM6uFK5OBDuwfKwM8gWC1Fu9mPQby5Jc4qmauLpF4mlVZK+42vUYJ49hNgtsbfHVcpYo868jtZYy9S1cPds/dUCH8WA9e2dtFTwQgQXlOFmUmPZcDIFz+n3+jXLoZyLtY3K2ma1pcXbB4pp4Toi+up0GLxO8puWhnO4yqDHVljAoXAECGyLGPqR9ttRUiRNjzVtmXQSzayeYh/AebHh1i0s91PwrsTIRU656k24FFMgURzw1kj+3AycLKRHlxClA7ngZCDZRr6/0CohrEHankUuw1Mkw9QNV3/S6g7bazCly5iTzfYLKNjxVl9deoJDAPj/865It5AFVQnaTZsnZf2gefFwIXJ+eVClLsB1K7sxsjgdBWIOoNHq8QuxkFM+UNvAjY+8tIj2poM2UWAJLexDkb4GiQnSqCpYDq2AcZifPy1ab4WgByQIb76epcfFH14+y3h71IAaH2vJs5jrk/glgK2BZsKmbplbVC6fbLEN20OxdiXnIJyDRNHBYUd4gB0MKjHTzRiFOo5EuUsOFKHXgHEXRenR+u3q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STY5YmxMRi9iQk9iSFRncXBsZ2ZTV1l6b2t3dmRiYzVFRmo2MndSdmNXS29S?=
 =?utf-8?B?R2pEalNVcUpta3ZXeldnUGRudWlaYmJWWEQrbkduN2daQlBURXJqY042NlhP?=
 =?utf-8?B?Z3lUamVqOFFxNXVLOEFKVWp0U2g5NEhidWxqanF2YThZQU9ZMlNsbFN1MUMr?=
 =?utf-8?B?QmQ3TC9aRCtCWnMrZ2tuaHA5ZGwvT0lGMjZTWGZoZEdoU2R2amZ5NndWT0ZX?=
 =?utf-8?B?WUxPTjVwWU1saXFzMEVBTkZBU1U4eVp5RmhNc0xobTBlZ05TUnAwQVRlVm9V?=
 =?utf-8?B?MHU2bXNkNHoyUCszdzFUWHdRd2pvNVB0UFZ0OWEyYnZVLzhMNTFxMVQxNWVk?=
 =?utf-8?B?OWtMZ1VnS001RHlMdS85MXh5TS9qMjh6dzYzQlA0dmxMWjdQRFhYV1NvZHFS?=
 =?utf-8?B?VUFxU0czTlEySm9jQThnVDlMUTAza3pBUVBUNjVRVE9BM290S2FIUFpnYmxu?=
 =?utf-8?B?RVdjeTF6aFlNeWZKaTFyZHB4T1pYbUgzL1E2UjZrdUhEc0I3U0lWblNjOFZ4?=
 =?utf-8?B?SzRWY1JXN2Y5Yll5RWhVQzVMNDYxRXA4RHVuRFRVb28vUTNRSnMzYnQ1QmtS?=
 =?utf-8?B?bko4SjJwbUJuQit1MlU1cG81aHVvbFE0dmVweVR3SWdKNnllaHhYUzg4OHNS?=
 =?utf-8?B?aENjRWZxQk1uRVNsWm1veksyampkQVltaXBEWENvYTFoTWRQL1lBTTYwVlhm?=
 =?utf-8?B?YThXbUJRK2dmSlRRdzRWWlRkais0V21sb0szZEc1ZW9uQTJFU3RTdHlGZ1V2?=
 =?utf-8?B?bkw3bktNdnQ0TlNNWkRFSE9UL0diN1BhM3RMa0MySzkxc3J5ZGNiOW9ZZHla?=
 =?utf-8?B?aW0yS1IxeXV1cjkyUmppK2dsc3l5VmlVMC92ZW8wN3ZUcVljb08yOE9WSE5n?=
 =?utf-8?B?elJXUWNUbFpUQXRpeTc2Snd4c1hrTVBJaUpKQTllVEV6ZWg5T3VrN1hpamU0?=
 =?utf-8?B?TThuT0IzNWJsUkk0dVBVaUZXTVM3MDR2NGl1OFRucWhPdThmZGhpRjhLNFhw?=
 =?utf-8?B?Y05wNTN5a2MvVnNHcWV1a2xBVkFkd01jUSt4WGI0VmtXZktFeHQwNGZWQm1j?=
 =?utf-8?B?N3g5UU4xSXlMODh3ZEk1VU0vY0xSOHNCVTh4M1NqczFwYmo0Ym55eG5LY1dk?=
 =?utf-8?B?RnFpODBuYTllS1RhUzg2TjZ5cTUzaTh5ZllJSUVoeDY0UTFyN0greEIwYk1v?=
 =?utf-8?B?RGh2T1FHSlgxM2M3WHJhY2VrUDQ0bmVncFJuUmdsZFlKb0E1VnpKTGFSQXJv?=
 =?utf-8?B?RzVmZll4ZVU1OEJTRGY5a0xFWWUyaS9XQVpERXlhUVlxTFF3UE93dHZWaDN0?=
 =?utf-8?B?bmdOTkRzdVJwTHB0TDNwN3BFbXgveHozd0YvUE5CWGYwUFFXM2FOaGVtakRE?=
 =?utf-8?B?am9FaHBjcVk1MHl4SXk4NTVITHEwMnRyNVgvR05CbkE0VjhJTG5kMkdOU3Nm?=
 =?utf-8?B?WHN2Rkl1T0lqaUo0UjdvRzVGVmlOb3dRZzlXc3BRSUpyUENMWXMzTHFoZWcx?=
 =?utf-8?B?Z0NkVWhuQlJ0T2szMFcrclVIVU1RTEkzZXVNTVVuUlR1bzJRZ0pCTzhWWURO?=
 =?utf-8?B?UnJGMlNCMVZNMmdlNmEwUzQxenRNcmZsVjV6anVBUnl5UDQzWHNMVEtwVzh1?=
 =?utf-8?B?VGRUU3lNNmNyblVKN3kyQXIwRVhlbHc0YzlLVlRmaWNTYm1Bb0VZNTYzMTFv?=
 =?utf-8?B?TlFWR0ZMeDlmTy9waGRuZUFrZGQyRUtxRkRvLzMxbmxCdUsxeVp2TFNNWllC?=
 =?utf-8?B?STljTDhhaHpJZzh5aldkc3g5OGoyQmVXazBsK1NIdDA0TTdnTnFDOEdhakhu?=
 =?utf-8?B?MEVmVXF1bUtvUUdTb1ErQVhzUmJLenNOdWp1YVMyNVVKbmIxRVdpZ255Qzcr?=
 =?utf-8?B?NzlQM2RlRmFiY2J5QlZkcnhlbUxiY2QzRGNoSnZTd1F5enZ4aGo4OG52WGto?=
 =?utf-8?B?VGJSaU5OTkl6RnZadjd0VnU2SnhaZE9xZlh6cU85VHZ4U1B4T2xFeHpuTUxt?=
 =?utf-8?B?bVVLNVNHZnZoUlhKUVkwaTdnQnl0ZUN3VUIydFB1bkErbVlFbHlJR3c3YlNK?=
 =?utf-8?B?WUdpcStDYUQ1OWZIeGZlS0E5ancxSlh3dVdFK2NXRzhpVlVEemJMclEvMVEx?=
 =?utf-8?B?TCtsdnljZGRmWWZrTEZEdXltT1ZXczhHV1U4NTZuWkhKOWttbXdINmxVdVRD?=
 =?utf-8?B?WnNSNHZ5MU1KSnNmdjRYVmw4Z2Z3UnpGVmF5UnI5Rzl3bUMzTFhuam52Kys3?=
 =?utf-8?B?d3pjQnNsWmtUYldZWFNyTmppK01TeTNMcTAyeFM3NklJM3hWVnlZZC9TSEoy?=
 =?utf-8?B?TjdoV2hybCs2Tm83VVpKSEk2NzA1WE5haERJVjNXTW9RV3ROM2FFRzNROFUr?=
 =?utf-8?Q?Pknf9v3KaHpYGJes=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9600c3-fb7a-4b38-b2f6-08deaa8bf066
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 09:51:54.5552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arBCga74yqnmRg6tR+zk0nlUcXOVCyOYVCLM3NHxoDaq5oGW0Net/SRKfGBjXBxCBRcbrLFU6vTeK6M2mNQjoliy5ffUHD6vHyJRL4P2z6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5226
X-purgate-ID: tlsNG-42698a/1777974718-07374F3B-FB5F275F/0/0
X-purgate-type: clean
X-purgate-size: 2819
X-Rspamd-Queue-Id: 7C01E4CA2B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 05/05/2026 10:00 am, Jan Beulich wrote:
> On 05.05.2026 10:43, Andrew Cooper wrote:
>> Gitlab CI reported a crash on boot on Alder Lake hardware.  The bug is years
>> old, making it an incredibly rare occurance:
>>
>>   (XEN) *** DOUBLE FAULT ***
>>   (XEN) ----[ Xen-4.22-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
>>   (XEN) CPU:    0
>>   (XEN) RIP:    e008:[<ffff82d04077bbc4>] arch/x86/setup.c#reinit_bsp_stack+0xfa/0x160
>>   (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor
>>   (XEN) rax: 0000000000000007   rbx: ffff83049a4b0000   rcx: 00000000000006a2
>>   (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 0000000000000000
>>   (XEN) rbp: ffff83049a4b7f00   rsp: ffff83049a4b7ef8   r8:  ffff830497e47000
>>   (XEN) r9:  00000000ffffffff   r10: 00000000900c2121   r11: 000000009a392956
>>   (XEN) r12: ffff830497e47000   r13: ffff830497e49f40   r14: 0000000000000000
>>   (XEN) r15: ffff82d0407dad10   cr0: 0000000080050033   cr4: 0000000000f526e0
>>   (XEN) cr3: 0000000043c16000   cr2: fffffffffffffffc
>>   (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>   (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>   (XEN) Xen code around <ffff82d04077bbc4> (arch/x86/setup.c#reinit_bsp_stack+0xfa/0x160):
>>   (XEN)  00 b9 a2 06 00 00 0f 30 <80> 3d 71 26 f1 ff 00 74 3e 48 8d 93 f8 5f 00 00
>>   (XEN) Valid stack range: ffff83049a4b6000-ffff83049a4b8000, sp=ffff83049a4b7ef8, tss.rsp0=ffff83049a4b7fb0
>>   (XEN) No stack overflow detected. Skipping stack trace.
>>   (XEN)
>>   (XEN) ****************************************
>>   (XEN) Panic on CPU 0:
>>   (XEN) DOUBLE FAULT -- system shutdown
>>   (XEN) ****************************************
>>
>> This is on the instruction boundary after enabling CET (writing MSR_S_CET) and
>> prior to establishing SSP.  Despite identifying this as a critical window
>> where any fault was deadly (the CPU tries to push a shadow stack frame at 0,
>> hence the CR2 value wrapping around to the top of the address space), I
>> clearly forgot that this meant interrupts too, which are enabled.
>>
>> Disable interrupts during the critical period.
>>
>> Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>>
>> v2:
>>  * Only disable regular interrupts.  NMIs are fine.
> Much neater a fix as a result:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, and yes; I'm rather embarrassed at how long it took to realise
it was exactly the same as the SYSCALL gap, and therefore the same
safety reasoning applied.

~Andrew

