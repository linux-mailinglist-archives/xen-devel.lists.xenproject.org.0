Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GMw5MtbsJmoqnQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 18:24:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A86658AC3
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 18:24:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=XxRmKne4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331990.1594635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWclx-0002op-CB; Mon, 08 Jun 2026 16:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331990.1594635; Mon, 08 Jun 2026 16:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWclx-0002mB-9V; Mon, 08 Jun 2026 16:24:21 +0000
Received: by outflank-mailman (input) for mailman id 1331990;
 Mon, 08 Jun 2026 16:24:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wWclv-0002ky-QO
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 16:24:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWclu-008moA-Kl
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 18:24:18 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a26eca3-bab6-0a2a0a5309dd-0a2a4502b816-10
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 18:24:18 +0200
Received: from [52.101.61.26]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a26ecb1-af86-0a2a45020019-34653d1afbb6-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 18:24:18 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8398.namprd03.prod.outlook.com (2603:10b6:8:329::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 16:24:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 16:24:14 +0000
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
 b=hNeme+ApX4KiGJXW7LokfwOEn7g4WjUnTpIw0xdM1HdMLVdjJY0BunuxZ8UfPwMGMGmE/W+ykJyg6amlfdYASmQywyvc3qHA5iG903OsYQ6WdyoVvxLjzDJKFFz6uNrVe8TJ+NngXZD/q3cbEPPLJm2FANESJ55UeBHngakJD5Onkn1lkYGO9g0XwRjzbZMoGjaVzbC4q++J9IvReBZkbHgAGndEpg0vC8TAKsqhkzYdYw9E5Vp9ATHfjHB6TD+SbV+7c1rsZIf3ESHAic70VR+MDPg6kYYcA1//YyjTaYECY4kMYgkXqdCDC+XXkO0mii+A5NTu0G/L1k3IdQv3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4u9qgMq+XewfoYUgesujL+qz5RLk0UmPd3ZsESK97Bk=;
 b=VIJw+O51TCi3ExFfVLUXbeqdnU8JoAqMsqXKhW4q23ltLjE+bUYi48OqrlnKLqZiGwLdvMn3NqQPu5W3AHsBsiu5vqBl5CL42XLE9MxNIfZ8KVQq8VvizUtOi7LSfav/vNQXPQZTcXuRXM/+zvtlQRJ99lI2pwMeLqde7rLZ1CAWTNUL0LvBKaw8ALGMxqTtP/KHOkw69z1cLIu3otjVawOEIOMuaTsj4oCfxGHgJALKRsghdoiAdQnAgWHhMN8McrwnvaxcT0omqMja7uM8esyg1D1/GVfpzdmm2+5HK5r8Ftd394JoUfHJvwRWNhiNwQEk1KiBYzzbF4/Wq21h9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4u9qgMq+XewfoYUgesujL+qz5RLk0UmPd3ZsESK97Bk=;
 b=XxRmKne4rs6sXPBLKFYdD0kYJXq1x4Doh80ghvaP/XHtnQ3X0bvDGuo4NFYL1YUWIF21JXoI08pq2Ds9ZyODsddx29kQ/wGFqm9bYwOI1F5XgflQGVjRmj8TExNcJTA9VeRgU8nbOGTXBkgf7/YM9+7xV0m6WGYF44hbzQMKfEY=
Message-ID: <1f795751-88f9-41e4-8e1c-875eccaedf37@citrix.com>
Date: Mon, 8 Jun 2026 17:24:10 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v4 05/16] libs/guest: allocate various migration arrays
 just once
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <freddy77@gmail.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-6-frediano.ziglio@cloud.com>
 <aibkcDCjyeK_0lMK@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aibkcDCjyeK_0lMK@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0393.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:399::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: 648ee1a3-6de1-4ab5-5167-08dec57a6178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9ObrXlURhH5COQlWC2sk6MVGr5ZA67BFYuflVmvDyPDlGnuQFjzyomtm4L27L2lvQu6RTKXSY4J1p+3Tw3Rkjmo4ZsosVdzypz3XVAqAm4UVAD7c2K3Ux73+dFvJsWFND34pSTgh5RAuyvWILMe0y0bnEvBWT4XbQFcXYP81k+NYomVrdVasfmTBVe/Vl8STrJSksCj3+BMaEyvEtBbBZtGQfWt9Ux8F2c3cPcQkODEK880pLXCeXQIt3XVK0bzqAnk5q1GwwPezcGN/9nN68cng9ym3vIqn8BM/EmIqkeAbJSt2jUzGidk5jrAm7otIDQVyvh7ONbih6XA4ShixMPNs9Tprb6+wFgb0UuZrZNopwn8sVK7F6Wpj+kr4u2UZg6cs+ACCgh5V1XDbtHN5LMZ75Ic1pChDO/0Izlaym30QZSO2IFvnnG5/U+hc5diiilfJU1/L3luAbpWxZkQm6rTYptLXgrE9Lg2rmRwyR6WPCmXzp4NH2AkZifTPxdH9HEBbEtbcdaaZzDi2trs2Q6N39BBuBKo/g+vghgE9o8TV+Q+nojbjvLqJpDLYEdtpRulqIgZ8eZquQskYGbqbaG8jsb+jm40jKeEipYaNeh3qFBGvBg/onnxHep0+ckQxxLEGlAvhdqKOSM2UrZF69zLl65nmhfygN4BKQ4e482goZfN7d3bd7r1vknkT9Q1LMpKSauSsRZdtgC6mGcqv/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk9vbUVUWHNIY2tRd2oxS2VjN2p0SWhNYjhSNmRpOUxpcG54ODdiMGowbXNz?=
 =?utf-8?B?eHZtMjJpSVJxMXFweWJ3aWFCRWt0MXlieW5JZmgvc0l2T0NYaDBGeTVMWVkx?=
 =?utf-8?B?SzNLeWJkOEdIaVlEaHJRbnJhRWk2TmQzeFNiaVU0OGpqV3Z2YWovREYzOHY2?=
 =?utf-8?B?dDM5VHcyazE4eUVnTzB6VUxycmVlb3NHaDhkeXh3QXNPdEIzbWZsWUZSaWdy?=
 =?utf-8?B?cGxrZFV1NGRYZ2pjRHdWclp4TVNDbUFRNFRabGpVYk5rRC9vY2d2ejZlZVZV?=
 =?utf-8?B?OTZhYzU5Z1J5VmZ0K201dnlBaDN6d29KMDF5TW1VS2lrSmRteVBaVE5DYUlO?=
 =?utf-8?B?VFhMSlpHL0RBVkRpNGN3VWs0eTJDVk04YkMrZ05UbWVKOW9lcDRtbUtOWld3?=
 =?utf-8?B?Q2p1ZFp3b0hucFY3OE12ZytmdU9oZ2ZvVmtvaWpESFgxUU5EbkNOdFl4OEZT?=
 =?utf-8?B?czFIMnRVQVpERWY1enozRS9PWnl2Y3o3RWR0MWZtS2pseUQ0NWtZUUxqY3BD?=
 =?utf-8?B?N0VPOVNYNVlVT0F5OGg1My8rV1R5a0JBREk0SkszZnZHNmJXUjJHRDdGdjJx?=
 =?utf-8?B?RmtvK2RpU0R6aUxwU0RHNHdHMFVrckdlR1puQmh2c1VMSTRxUUVSeDlVM0Rr?=
 =?utf-8?B?Z1NEdnR0UEZmU2RMdkg5dlp1K1pPaDViWEJkZVBZaHBNNVZEZVREbWVrVkox?=
 =?utf-8?B?c015bExrZGdVSFRXaEpNVmJ1TTJFMzN3MEpWdGhrMU8raEVaa0F6OWxOS1ZF?=
 =?utf-8?B?dnRKZ0FvRUVzMEFnMVpVK2IrQmVjdkhpdWI2M1JyMmxyeDhteGdJdkZyb0ZP?=
 =?utf-8?B?U210U1hhS3RiL3B1Y2ZMOFAzSFQwOHZoUktmV1JCRzdFY3JRSVRhMGk3R2xU?=
 =?utf-8?B?ZjZzbWpWanFDOEhXckpvQkY3SFN0dnZ6bmpsOGJ5WStKUkJNN0oyalB5RXlG?=
 =?utf-8?B?MkdGL3BsTHdja1dIenV5QVdOM3Q5a1JEY1VmdFhXWlZHQVJGdzhDazVZeCty?=
 =?utf-8?B?U05md01LSlRiaTZ0TXNJeWhCaG5kdWpleGZXNUNTMkJiNjhUL0x5RGY5cklT?=
 =?utf-8?B?cUlsNDRqb2tqaUV6VGl5T1dIaHlKdXJCVHEyM1VEUTVWTGxRZEVHWldwK0pm?=
 =?utf-8?B?VTFyQXRBaHhrNVB0dnFYNkJYbFJDZjMrTjZIMjVqZEs0ZVBPMEI2NkJ3MUty?=
 =?utf-8?B?L0lzVVFDQUpGOFgxMG9NSFc4Z0lFd0MzSHNEemVEd25LOXNHZUc1VGZCcUh0?=
 =?utf-8?B?TGFyOWhLb0RKaFhUcDhOb3l4RGhzVjVCY3RQSC9aL3VEWmhoNHJIV016aCtN?=
 =?utf-8?B?eGdBVUtBaFZYb0pqWlpEbnlFNHFCTkFlZmFvVEtHVlFxTWdHNjBsZ2ZCMkNa?=
 =?utf-8?B?cjZ3c2V1dURwMmE4UXplM1FWeDBGNFdSRk50VllISXZhaFRSdnlJVmVMck55?=
 =?utf-8?B?M1hHazZxNzdrTk9lTTh3YWhzeXNEMjNwcmhobEM3ejA3b3Q0UzE5Sy9nZE05?=
 =?utf-8?B?dXkvb1RlNlM3ZTlQU29qOGdBZThXaUkrb0Z3NTducUgyekZBYjZpTGpyem9m?=
 =?utf-8?B?OTVKV05WVXZaNUwzVGJ5TzJwb01ucFVJOTkvYWp0Wko4T0RDNnYrdit4VnpT?=
 =?utf-8?B?OGxaM0pDRHpIN2FJRGlFM1hFMzBGbCtDQTBtZVBlMUd5akpZY3JMcytYajJX?=
 =?utf-8?B?ZEFWdVdzcnFqOXFCMGpuT0gwQ0RiVWRuY09nUXpBMlBSeWZlbnlkZm53Unpp?=
 =?utf-8?B?ZDJmcTJIVWRlRzRObjRNeFRYN3htQzV0ZWxEb3M2RUQvdFNxeGQ0UCsyZVcr?=
 =?utf-8?B?YzRRNjBOSVhZc1ZyM1puMjI1dnQya285NEpTUTVXMm0vZkVSTGZvTGtvWkdm?=
 =?utf-8?B?elVycml2NERteUxNczltOFE2STVEVGdadzlFVHBacmZ3SXRad3o5UTBjNC9J?=
 =?utf-8?B?RXRndmhFZmRsd24zc2xReS9PRTJ3ckNOWnFwcWZmQmJvQnprWUF5VlkzTlFj?=
 =?utf-8?B?OVdsbXAvMjVYbDYvcHJUbHRvN3IyTlV3bG4veHB3RXU1VzlSWnRKTmlydUc1?=
 =?utf-8?B?U3FaV0xaTkdtYytrcVJCbTkxaDZBNGFJMEFCVm1wcUZ6ZWNtQlc3UDZoMUph?=
 =?utf-8?B?czh0QkIyL1BIclRQREszcmhKWHhLMzd2RUNRdXY2MmZ5M25WWlBONmJHekVq?=
 =?utf-8?B?TXduNVpKTHFJWjNFeDU3Y2ZzcW9VNjQ1VGg1U3A3UU82bzF3UlFIZVVSZ1Fn?=
 =?utf-8?B?NHpQeHNrWXhMUjQ3MjVUcnhSWnNGR1NDbWJSTTl6dFc0RStucHg1S1l2LzFu?=
 =?utf-8?B?QVlWZ1k1MW5ReHE5SnFVYkpGY2trUmZrNHFVTGlHZE5XSVBHSVdybkZ3YnVS?=
 =?utf-8?Q?K0gAr86MoXjA5lkg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648ee1a3-6de1-4ab5-5167-08dec57a6178
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 16:24:14.6083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YENOA2/GYjBbMrRpIiv9F0v24xpLUhC45uqojWsRY02kXMVJhNawJ73qZTRXEBTc+qfTM4KnsptWLLWCE6yRz68+PlBRphW4PukxPqFVf5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8398
X-purgate-ID: tlsNG-720697/1780935858-83B60161-637C09B4/0/0
X-purgate-type: clean
X-purgate-size: 933
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[citrix.com,gmail.com];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,m:roger.pau@citrix.com,m:freddy77@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31A86658AC3

On 08/06/2026 4:49 pm, Roger Pau Monné wrote:
> On Wed, Jun 03, 2026 at 02:05:52PM +0100, Frediano Ziglio wrote:
>> From: Edwin Török <edwin.torok@citrix.com>
>>
>> Allocate these array just once at the start of migration,
>> using the maximum batch size, and free them at the end.
>>
>> Signed-off-by: Edwin Török <edwin.torok@citrix.com>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Jan made a comment about this patch (and how it related to a still
> pending patch of his):
>
> https://lore.kernel.org/xen-devel/e3f22fa6-c497-4afc-9498-12449548acfd@suse.com/
>
> That is still unresolved AFAICT.

That patch is not pending.  It, along with it's series, is wholly nacked.

I have explained in public and in private what it would take to retract
my nack, but until such time as the feedback is actioned, that old
series is going nowhere, and has no baring on other changes.

~Andrew

