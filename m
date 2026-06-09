Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IQbQL7hhKGoUDAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 20:55:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAA3663738
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 20:55:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=J2EfG3Ns;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333781.1596940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX1bw-0005LE-5A; Tue, 09 Jun 2026 18:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333781.1596940; Tue, 09 Jun 2026 18:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX1bw-0005Jr-2G; Tue, 09 Jun 2026 18:55:40 +0000
Received: by outflank-mailman (input) for mailman id 1333781;
 Tue, 09 Jun 2026 18:55:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wX1bu-0005Jk-5D
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 18:55:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wX1bt-00HLLC-Bh
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 20:55:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a286183-bab6-0a2a0a5309dd-0a2a4506d6cc-32
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 20:55:37 +0200
Received: from [40.93.201.57]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2861a7-7371-0a2a45060019-285dc939255f-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 20:55:36 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7562.namprd03.prod.outlook.com (2603:10b6:408:28f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 9 Jun 2026
 18:55:34 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 18:55:33 +0000
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
 b=FcAKcvRIJOpR5aoCHxzWl00Kicmkk9i1veu46omFQqGR4ozf6EpxnhjDNJLsKJOZ2vfrOsq4qMcnxXW6VPln2xp9tDbagk2XBmCLjpFu9WYsxf7awtXOLeRgxPt6rqX+Dhaa5o6/onzoihq7rF4HB/OFx2V81b4YqBMhmta986O12mULaNont5wKbwmhrVrUrvj/raeetRRyuEwvkRwTJ8s+PIxDStqseGBFTWz/cKw4iNsGg7s3f2v86VtYItY463nRUrJi46RIa3NuNHlv0yLH+ZjQSlUjrqBR81pWvCgBj/d+79NcAt1yiq5RuGutsVZlKWI9Em6b3K4kRn8mvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6rB2ubt0c1goT4cIg9Pt8jQg3t/gSjmHGLTX9nvMkA=;
 b=wZsoB1J+0/QvXDunNn8bg/D+LYcIHQ0s/2tvBR6wcYhypt5JVuyb+IBdhRs9k6lgYtTWH5y6nlhxtBGXYi3aWg8IEsmAh9uFpFGZjlvzZWEuTjI8ilyRdSSQKYxIRXVInGmkgP64VRTmpS1vMUnoq1Kkz4eh8ySPyO7jZqvr84JN/QG2zQiVuFflq+u8x/So7fClNfR15s1cxKUQUrYuxj2g7ZopnBPdRL/6e/DxpjEfC3Ng/mRowGbqCfNpIw/rjf45lpKjUROk1QrjvwBdREdW/FpggWWRf6WS//zjdGMoMPsp+N6bSp0JXkyCA7hW1u+ZlbC6AYgifjQtAy9DCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6rB2ubt0c1goT4cIg9Pt8jQg3t/gSjmHGLTX9nvMkA=;
 b=J2EfG3NsMIfkyKi6kZ1jkPcw9hJhPWRMKn3xHqT2hLVzKkv3oIUsi5VkjGRf4yqjvr7TVHUNKxWX4px0EFep+3HJnKw8sYQGuLO/c9KJJMOOGnq/PR74c0B0H4HW6rGFFEjAMPlFGMPr4iqDNx6X5gtTT+piFe8/UG+HFZcUa34=
Message-ID: <78f86445-10d3-4ea8-971e-b9887a259972@citrix.com>
Date: Tue, 9 Jun 2026 19:55:30 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Kevin Lampis <klampis@citrix.com>
Subject: Re: [PATCH 1/7] x86/kexec: add digest checks
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-2-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260609154518.779757-2-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0019.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e181a2e-8c9f-4acf-07ae-08dec658af7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|11063799006|4143699003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	XifQMaU9aJc9UqxLWm5JHTsY/HmSRYmEHSUql2TuxlYgDyscke6CNBX5M+CWUlwy83uohnLjiiHIUXev4cBw2lA2++1Bhn1/LOaOH+2W7oUypLa3esuB3X5c32rk5wDrIzDN5ialMHNtYVLP4jnEBqRNt3iV6b3N0T5Fx5rKASEE48OwrO1iAfTkdA/Zg02+YpKOPFU6E0FhIJ8loTleTLVR84uLR5oB3KhMMqwfo1uZO1c8VuSzvehOery4Igo0umAKwPHlIop/e6FhzUM0c1EpZDob7+oig524yHr8pOnYhjP4oiDQqCHFoNmuWPZKV0aKCncAbVTLUhWVUMv499ERz+ZUGBsDxrQfjG9HQDDffRqdzQIbLNetc5xQrU8vAbsWRQ/Ev3PWBqWJ1i2t44Trc6pawz/mPNUO7/IcuQv0Il19WJfSY7vFqTQYELOOnou8pSWg/TsXC47DnPKlgW/zMNiB5ZdVrIpALUeIKngj7tv4f6gDJ2z+Baaf0e/iPocdR3/4nRI+oEQI4HoK+8lRur62q9vJ3HETvKJsO7xqg6v20LySor7cGCTf8FmxjE1m9mVTaEE68MjWTRHW1ynQhPAz8DxIhX58nr0xCzzNN2Vw+UpteP7UYgBUO/sL7y6zMIQ3Qf608VHWiGolax1ECJl5YdcnwjLhN+QOlMzB/wZDSkUTDCHA8E1bMPta
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3ZaZnp4T3NrRDhka3c3dXVxdlg5UFVrV0dtWWxUQXVRRlRuWE96ZTdpUUlH?=
 =?utf-8?B?T1B2cERqbStKZ2hYTzVlR0xsSnZ2M20wKzhRbSt2cVhaU2ZtZTUwRWFHdkRy?=
 =?utf-8?B?Q2RENkVuN2lQenhOandjMXZwQnE4Q3NCNExPSTMwaWY1dmRCZittbUpxYUZR?=
 =?utf-8?B?ZVVXeGdUSFRxNVRVQ1RoRFJ3K1JjWThvNnc2eDd3Wmw5dDJjSXZXSXFQUld4?=
 =?utf-8?B?VHo3T1RlM2FYQnZCbkxzTngxT3owRmI1ZFpnM3lXbnVSSnlrOVFQNDYvWlpy?=
 =?utf-8?B?d2gxVURiU0pQN0FvcCtsbFNDVTBEODkrYi9yZmtsVkhnTThWVldTcEFrbUUx?=
 =?utf-8?B?TC9BVjhqSVVIdlkyamQyZStuaVNjajBSZlE4QU8yYXVlZGIvZUs3MVliZHFW?=
 =?utf-8?B?b0gvenFOYk15RVhLbVg4bkN0eEFmY0JhZ1lwZWdaU2JDYlNEWm14OGFJc2FS?=
 =?utf-8?B?alVRL0dxczdqaExNQ0lOb21YVXAwMVA2N1lLVHFjclM1VnBpOVZLVjU2Zkpp?=
 =?utf-8?B?azRrMVJtNFI0cVpvV01SZ3kzcktDdWw3amcrcEIxNWlRbk9VVFdNNjNCYmtE?=
 =?utf-8?B?bXBvaFhNT1BkSXRPL3RzQzVydko5aGRsdm1yYVgxQUVjclJSNlZoR2ZZVzNL?=
 =?utf-8?B?RGtrajUzRmRYRkp2TzdPcngreVdLOTRHMndoWWVVN1NxOWF2bE9ybjRKQTVm?=
 =?utf-8?B?YnFLTDB5cG9aWlRYV1puZVE1OG81UFZkU2ZHZDdqdlBObFliaTVtNVhzcjc5?=
 =?utf-8?B?bUlwSU5CVENPc1ZwQk0rTEs1cGx6aWdOWEJXbzF1Uld6aVN0UmJIUWhDa2V6?=
 =?utf-8?B?Y1ArVDNSWDdGSUxjVHVWSXFxSFp1UXhGZ0hFeHFDUnVPYVFWTzhrMlI2bWda?=
 =?utf-8?B?SmFqWWIxNnZtekN6bHgxZWV0R0tqdWtzdTc3N2VBZGxNc0ViVitwQ2Q0VCtS?=
 =?utf-8?B?dWFSRnlpS2tZSjB3WVR1L1JoRithMWZHZVNLQkRrcGtmZE1INXBONUkrZVdp?=
 =?utf-8?B?aTF4OUsyV25RTFUvVE5vZ3ZPSlFNNGNsbE11aWJOQjFrQmFheS85U3Y2L1BV?=
 =?utf-8?B?azU5VFVGQ2RxMUlvd2pvVTIzbHZlY0kvVGtFMENzWU50ZTgydExwSU9haHBH?=
 =?utf-8?B?Mi9lVmJCY1gxN2JFUFhKbHZYaGpGSUZCYUxkQ01lSVZyRUduRWV0VWQzOVVx?=
 =?utf-8?B?cUx2cXhkeHZXdHJjNEFScXd1TmdOQ1BNKzcydWMxSjBmZVNpRTNKQVZBb3NK?=
 =?utf-8?B?MjdEZmMzbUZaSFNqaGZJNGFDQlJkNXZuQ3VYTm9oaEMySVRYaXlYNnZYSEU2?=
 =?utf-8?B?OEYvamZteVJWWVpqemZkY3BzMzhRRUNvZzhzSjJiTlRXeDZSNlhKSEdKbDFS?=
 =?utf-8?B?VG9YWEttRFpQcndZaC9HSlhrQzJPTGdENE53Rm5WQmxjS29lcllDTFJyMWQy?=
 =?utf-8?B?enBldFE0YW5RVFVZeWYxNDJwanRrVlpGZ0hYc0tYcGpKdTBuQnBYOWFTSzBz?=
 =?utf-8?B?bFRTV3VzN0JQYzBsc2JGVXhITE5lVm1oVC9hNHpibW42UjlDKy94eHF4RjYz?=
 =?utf-8?B?TmplRTlkWE9SY082QmdmSTRiTXFZY1J0SFpPczNWSWFBUTBMd0N2T0hkVE1K?=
 =?utf-8?B?TW83NjErYldublNERElPTkY2SnhuMnJMRk5vWDFObWU2YUdTc1liN1JCZFRK?=
 =?utf-8?B?NXVFaEdSd2hhdFJ6d21wVlJ0WStUdno3QmprUDlOcldwZmVRank5SVdDd3RV?=
 =?utf-8?B?WWtvNjZjVVFENXFkd2tqbWRhaGVtSEhXTXFHWERjd09LS1V2c0lSMDV0VUpB?=
 =?utf-8?B?OThMRXNWNjZHOGRNS1NQUS9kbWNXdjF4aUt5bTduc1hWVG9Mak5WUHVqeWg5?=
 =?utf-8?B?WGhvNjNJbW9nRlRmU2dVcHFhVjUrQVprRzd6NlBoeGlzRkJMVDJjK1FzRXo1?=
 =?utf-8?B?bGhUSmp5MTRsOFhrNGFBY1c0UGpXanFOVld2TVIycldYK1BsTERVVVpJeU5W?=
 =?utf-8?B?a2hUQ2FQc1JxN2R6eTM3M1B3ajMvS1d1d0FPYklreUYycFRjSG5GTEdlKzRi?=
 =?utf-8?B?cWF4c0hUb0t4Z0pyYjMyTTQ4TzQ5OUNJRXdWak9DbjhGL3pxOXZTdWpLRGpK?=
 =?utf-8?B?UGpDYmdBRmc4N1lDaFVsbG9zK1FFUWgxMGJRWVhjb2pBQ2FYa05tTCtlK2Ir?=
 =?utf-8?B?bFQ3ekRReDlOZDYxcVJSUVNtbC9KY0ZjVDFMWFVKViswY2d5enVvNGtkNDUr?=
 =?utf-8?B?Z0FmYkhiQjNxbHJTMVBHdzZEajI0WHdtZmljazFISDdOUWh0MmtsTVZGK01l?=
 =?utf-8?B?cHp5SjIrMEQ3dTJEU1FvTWtIV3IreXRDN2lpNEg5MDhJd2tRbkhIcjZ4QmRz?=
 =?utf-8?Q?KSiwHv+K9c+cgiII=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e181a2e-8c9f-4acf-07ae-08dec658af7d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 18:55:33.7739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mG7/+STq7UOtpLUJsbfXS0+ukQP8FizeZU3g9x7FBsO7fn/FR2GaYcauvH7ytVtEY8rlFIws/Ex+QnOtQRb0Ns8/TyAcfGOFi59Ze/v+Mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7562
X-purgate-ID: tlsNG-16d1c6/1781031337-8E78DD75-5C0BAA6D/0/0
X-purgate-type: clean
X-purgate-size: 6186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:klampis@citrix.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EAA3663738

On 09/06/2026 4:45 pm, Kevin Lampis wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
>
> During kexec load a sha256 digest is calculated of all the kexec
> segments combined. This digest is stored and verified again during kexec
> execution.
>
> This is a requirement for Secure Boot to ensure that kexec data has not
> been tampered with or corrupted between signature verification and
> actual execution.
>
> Only kexec crash is supported. The segments for normal kexec are stored
> in temporary buffers and moved to their intended destination during
> execution. To calculate/verify the normal kexec data before relocation
> would involve walking the relocation table to find every temporary
> buffer which was out of scope for Secure Boot work.

I'd suggest reordering the information for clarity.  How about this:

"In order to support UEFI Secure Boot, we must confirm that the kexec
data has not been tampered with or corrupted between signature
verification and actual execution.  However, it's a good check to
perform generally.

During kexec load, calculate a sha2_256 digest over all the kexec
segments.  This is stored and verified again later prior to entering the
image.

For now, only kexec crash images are support.  The segments for normal
kexec are stored in temporary buffers and moved to their intended
destination during execution. The logic to reconstruct the normal kexec
images runs long after Xen could cleanly cope with a digest failure."


"out of scope" is not really something that wants to end up in the
commit message.

> diff --git a/xen/common/kexec.c b/xen/common/kexec.c
> index 65776a95fd..c920bc6d8a 100644
> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -383,6 +383,12 @@ void kexec_crash(enum crash_reason reason)
>      if ( !test_bit(KEXEC_IMAGE_CRASH_BASE + pos, &kexec_flags) )
>          return;
>  
> +    if ( kimage_verify_digest(kexec_image[KEXEC_IMAGE_CRASH_BASE + pos]) != 0 )
> +    {
> +        printk(XENLOG_ERR "kexec digest failed, won't boot corrupted image\n");

"kexec digest failed, aborting kexec crash transfer\n".

The !=0 can be dropped.

> diff --git a/xen/common/kimage.c b/xen/common/kimage.c
> index 6202491f7e..018ef66451 100644
> --- a/xen/common/kimage.c
> +++ b/xen/common/kimage.c
> @@ -20,9 +20,12 @@
>  #include <xen/mm.h>
>  #include <xen/kexec.h>
>  #include <xen/kimage.h>
> +#include <xen/sha2.h>

You don't ned to include sha2.h here in kimiage.c, seeing as you need it
in kimage.h for the struct change.

> @@ -820,6 +823,101 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
>      return result;
>  }
>  
> +static int kimage_calc_one_digest(struct sha2_256_state *ctx,
> +                                  xen_kexec_segment_t *segment)
> +{
> +    paddr_t dest;
> +    unsigned long sbytes;
> +    int ret = 0;
> +
> +    sbytes = segment->buf_size;
> +    dest = segment->dest_maddr;
> +
> +    while ( sbytes )
> +    {
> +        unsigned long dest_mfn;
> +        void *dest_va;
> +        size_t schunk, dchunk;
> +
> +        dest_mfn = dest >> PAGE_SHIFT;
> +
> +        dchunk = PAGE_SIZE;
> +        schunk = min(dchunk, sbytes);
> +
> +        dest_va = map_domain_page(_mfn(dest_mfn));
> +        if ( !dest_va )
> +            return -EINVAL;

map_domain_page() doesn't fail.

> +
> +        sha2_256_update(ctx, dest_va, schunk);
> +
> +        unmap_domain_page(dest_va);
> +        if ( ret )
> +            return -EFAULT;

ret is always 0.  (This is dead logic from copying the form using
copy_from_guest()).

With these dropped, the function can become void.

> +
> +        sbytes -= schunk;
> +        dest += dchunk;
> +    }
> +    return 0;
> +}
> +
> +int kimage_calc_digest(const struct kexec_image *image,
> +                       uint8_t digest[SHA2_256_DIGEST_SIZE])
> +{
> +    int ret;
> +    struct sha2_256_state ctx;
> +    unsigned int s;
> +
> +    if ( image->type == KEXEC_TYPE_DEFAULT )
> +    {
> +        /* TODO implement digest calculation for normal kexec */
> +        return 0;
> +    }
> +
> +    if ( image->nr_segments > KIMAGE_SHA256_REGIONS )
> +    {
> +        dprintk(XENLOG_DEBUG, "More segments than allocated SHA256 regions\n");
> +        return -E2BIG;
> +    }

This is the only use of KIMAGE_SHA256_REGIONS, but I think it's stale
from the version of digest checking in the patchqueue.  I think you can
drop it.

> +
> +
> +    sha2_256_init(&ctx);
> +
> +    for ( s = 0; s < image->nr_segments; s++ ) {

Style.  Brace on next line.  (The code you copied from was wrong.)

> +        ret = kimage_calc_one_digest(&ctx, &image->segments[s]);
> +        if ( ret )
> +            return ret;
> +    }
> +
> +    sha2_256_final(&ctx, digest);
> +    return 0;

With kimage_calc_one_digest() becoming void, so can kimage_calc_digest().

> +}
> +
> +int kimage_verify_digest(const struct kexec_image *image)
> +{
> +    uint8_t digest[SHA2_256_DIGEST_SIZE];
> +    int ret;
> +
> +    if ( image->type == KEXEC_TYPE_DEFAULT )
> +    {
> +        /* TODO implement digest check for normal kexec */
> +        return 0;
> +    }
> +
> +    ret = kimage_calc_digest(image, digest);
> +    if ( ret )
> +        return ret;
> +
> +    if ( memcmp(digest, image->digest, sizeof(digest)) != 0 )
> +    {
> +        printk(XENLOG_ERR "kexec digest failed expected %*phN but got %*phN\n",

"kexec digest failed:\n"
"  expected %" STR(SHA2_256_DIGEST_SIZE) "phN\n"
"       got %" STR(SHA2_256_DIGEST_SIZE) "phN\n"

The newlines and tabulation are important for legibility if this really
triggers.

In hindsight I should have pointed you at check_digest() for AMD
microcode, which is even closer to what you needed.

> +               SHA2_256_DIGEST_SIZE, image->digest,
> +               SHA2_256_DIGEST_SIZE, digest);
> +        return 1;

return -ENODATA or -EBADMSG.

Error handling needs to be either truly boolean (in which case the
function wants to be bool), or int with -error.

~Andrew

