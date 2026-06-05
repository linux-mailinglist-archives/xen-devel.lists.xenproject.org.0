Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YuPlCKqJImp/ZwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:32:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE706466B3
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:32:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=mKoPQ7wY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329212.1593418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPyb-0007Bl-5V; Fri, 05 Jun 2026 08:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329212.1593418; Fri, 05 Jun 2026 08:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPyb-00078v-1f; Fri, 05 Jun 2026 08:32:25 +0000
Received: by outflank-mailman (input) for mailman id 1329212;
 Fri, 05 Jun 2026 08:32:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wVPyZ-00078p-8z
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 08:32:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVPyY-0096zq-6k
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 10:32:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a228988-2eae-0a2a0a5409dd-0a2a45029614-48
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:32:22 +0200
Received: from [40.107.201.60]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a228994-af86-0a2a45020019-286bc93c84d2-4
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:32:21 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB5697.namprd03.prod.outlook.com (2603:10b6:303:94::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 08:32:16 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 08:32:16 +0000
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
 b=OITYHYDSWi/9WM/mV28F9kkAokfff96ShNMnSwtisiYofwp/lf+AP+bzPy4UQmOetkBKbxRBS0q9oxDw/PSPEIf3JxhRsrQEAAXbXpCAoiXUWD41yepvOfHT8/xuLuOxOaAFNfgwIAFziaE20bdg5KWfN8o4rJqY+1dJqflfprrPXqvgRwZwpZBk/qlf4BE6vXUJbr4RNbGlnUzbJ7VFscvSgX3It2dZF1ykLpb5wkj9ZqkmlMzrniVzM5WA2ZcR1KBH3NILnApQrYbKIWXkSAPxbBJG0wrpMuv2tzulJqA7dzG9mK6IrxkwC5G4LXjSNIgqEvTSQMncc6AvIXjfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iR4xP4P/PRWHxitKppZb1+vFEpuzqABCx2Sk+djoYIk=;
 b=uIwK9AOG62eSH18fCzpHW5dpiYq0cUo3hLSN86Dzd9zTS+KLfmYig/18QQR2hDtmKLQ37z0sH/0K32Lj2uTKPMWfPPzmFMXvuzwQjjjOo8PfiEq4NTmUNjG7d8+zlYMRCXi9gtwKnFAaVsVTpmWGcRgWovXL4Mcc/gaxkl+DdNASPP4JyJkasXqGMhQshWAzX941/vBBIR3qqOhpbeHJ2seVGVGvp7Bc6Wv2x4ziZANQ6NHjJMzL0AW8S5VAwelN4P2HzAb+JDB5/9sSdCofe1e2dLigoLiZziysbm60faV4CoNKXmVCuIMpWza9XuRuK7ipX7ss2RWssDmDlvi0pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iR4xP4P/PRWHxitKppZb1+vFEpuzqABCx2Sk+djoYIk=;
 b=mKoPQ7wYysiU/i2Zw89RweZMhN/foxo4RR0SxbeFsKgoFTcmfAgOVYaqn2WvDNRz/AHAt8L3g8METj8QVLUQohuLmKFOd2iCrnOGiYImdp9wryP1GlUmFZQyA5ROmzdVr7n4gA4VSBpgs3mAyTVOLxtl5umFkbofTUka4F8FPTs=
Date: Fri, 5 Jun 2026 10:32:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 3/3] xen/x86: Change stub page allocation/free logic
Message-ID: <aiKJjdzjlUs_WpVs@macbook.local>
References: <20260604231837.804560-1-jason.andryuk@amd.com>
 <20260604231837.804560-4-jason.andryuk@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260604231837.804560-4-jason.andryuk@amd.com>
X-ClientProxiedBy: BN9PR03CA0624.namprd03.prod.outlook.com
 (2603:10b6:408:106::29) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB5697:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e2d58e-50e5-464b-ad38-08dec2dcf2f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	9Mx7M5/Mmemnwjr390ObEcMUwqLbn3mkC1mr4OSfOegfcM1ZM1m1L1tlNnAxgvOmJWeCzhWRil6fVbyMPl4bRfUpuq1f4dueBSYpgefF4jwxfPPvm0WASaw3A809r/Fi1ws2oQjaQ8MZbHqxDcqT2xN5xcy0FgAwCWBqay0eTxj2M4rwgOHI2Nk8uzaDm1W/9DemrHYifrHS2hyLZnsE3GxNsTAoQEqN9SWE26DB3ey2/1CXT3pbndNbR+oVy9gkF49npIoqha3R+7UKEU5pcHUHbfWfPcra+bNSYf6TJZYbkKQb1QPnagLqPu07f1qTztD+17TphkL6ASaKP5IpDthAJG5bVJ+RrYsYtC7Vp6KKd1iifwmx9h+c4QqJLZqUQ2ZEvpmDetfocWDLmIw2XGaweFIOWax/KmBL3y9iepZLziYSD8ebV3SNjUmbwfLIEUKOhD6cshuaGJFj/N7h/lthUrlNpQUkjpOJMdPEWnebpWN5Ia2uQxUw7KLJovn7pERq+euZYBXlCRqaD5iEesAZp+kQLw0P9im7Mrlq187zJpblrIn+nuXVWIV7+wPwxP3OncYSnGPFShsefotAADrctE4qs0gQh5pyTvsYmFXNPyyJc2KL/9+DGwZ/E2JRKD43urPI1oSH/0cesRAPXjY9k4oZ/W/FoSKdqBGqu6tDh43sO/OZKhiJDRBgBEkD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE8vN3l2bnpzYnpFQ2R2NE4xd0EyOHBIQUl1S2c2eWhPTWV3UEtWeW5LenZw?=
 =?utf-8?B?bmgvejN4RlR2d2VnOUQwR2RLd1BSVWd3U2pJUi80VkJRVFM1QmtzSFVFQzQr?=
 =?utf-8?B?UHM3d05ZRS9GcDdRVXpmN1I2MFQxNURDZWJvZkJyVGdKOFhGaTcxMFZWQUho?=
 =?utf-8?B?ZXZDektwcW9VWHlSbG0weVIrbGhRMlQ1cUo1RTA0QmZRdlJ4YVovZ3VBR3FJ?=
 =?utf-8?B?QitYaXg5RkxRdVdpWk1JbmRxQk5DbDZLTDIzdm9MYmJ6VS9GMWVYMS9qWjFJ?=
 =?utf-8?B?U1Y0cW9JbUdIaTFnZ0UvSW1FL3NGVXdlOGxsSlJoaDVPTi9pZDlPL01LbVhx?=
 =?utf-8?B?YmQwTnpZNXcvSUZjbEQ4bFpNd2hMQnpDVTRBRjFEb0ZaWmg1dVdkQzhYUy9W?=
 =?utf-8?B?dnVmN01vaVNzOFpOWUhoYWR1WWxFUnNXSFpISTBBRFBwZE14UFNmWXBQdk15?=
 =?utf-8?B?c0pTZkZ4TGtpR0NybFdjcnNKVHVobWp6UDd1L1hFQjVTZmpHdGRvWE9oWTA4?=
 =?utf-8?B?ZlljSTI5YlA3aVNRUzJRTEh2REhMNGtZRTJiN2VmWUY1Wkl3YTJDR0hMcU56?=
 =?utf-8?B?T1hwMmRsNmVRNVJyVzNNT2tSeFRCeVJhT1hhUTFNMThraHRCZE1HcHFaUlJW?=
 =?utf-8?B?amQ2bEsyOCt2YVZENnppVUxyRnVBZjVnVDIzT2tMZ0p2TWJPZ0U5K2FFdjhY?=
 =?utf-8?B?akQ3VlNIcmlOMEhLMzdDWmtaMndiaUlrMUFvaWFQT3B1SFBNSGQ4VVhNWGhO?=
 =?utf-8?B?NEcySHRkbk4xTzU4anJkaUVyYkxOYTMxUkcyMFUrN1RpdkFTYWx3OHQ5T1lt?=
 =?utf-8?B?UWtnektRam9RNUhIZXVaMHRFa3g3Uks0bjZMc2JBd2hqTDZrSWxyUkxiRlNZ?=
 =?utf-8?B?WkFsUHF5U3VEWWlIQ0xhQkhmZVZrcVJsU0d4S3Y0K0JFQmUvb2pJRm5NdDJi?=
 =?utf-8?B?M2ZKMTNjdUd5c252L2QvdERuUjBuUkN6b3hjZ1RxSVcwTWZmYjZPcGhUTGhZ?=
 =?utf-8?B?U2ZsclhmUFZHb0UzMFZWc3ZoU0lqQnlhTlMrdFJEd3E3bGY5M3dCMDFoOEF2?=
 =?utf-8?B?azlQZGdCeEtORTdiY0VvRUNidU41ZnIzc2lRU0FYYVFCSUJXL0NWZjZhSkQv?=
 =?utf-8?B?YmFkZCsvYXFndGI1K0JXZTdNM2RVWnlMcUdZMTZQdWVRMTJlZjBhQ3U2czJV?=
 =?utf-8?B?SnF6SDZCTGRCUzQ2WUhVZ05wdWZMbkFQdmpFcm04UDZWdHZOTXgxUE5WVUp3?=
 =?utf-8?B?bllPWUcvcHdSSUkzZ1F3LzVDd3BvOVdjb3RNRk5SaWpOaHlPdllUQ1lsaldo?=
 =?utf-8?B?cjBPbG1ENHNkaFErVjlTVFhXdmJvaTYzdGRMZmVVVGxnUFQ2VzFQMWw0YTRW?=
 =?utf-8?B?cC9HU1lYLzByMnovNXFtYzFCM3FiQWF6Y3VoQ1Z6MVFyT0Q3ckU5QTY2ckg2?=
 =?utf-8?B?YVhBalltZks4YkpLUTczVmZDL0dvSm1Ud0ptTmhGWG5sbGtEYXNDN2RwbGM4?=
 =?utf-8?B?d3FDZWdwVW1zalE0KzdocFUxL0dOYmZscGZnc0xXdkt4UTZFNWhXWnpCTWF5?=
 =?utf-8?B?QlNZeHlKR2U1YUVCL2wzVndSVG1DcWlPQ3dPMFZaWEhMYnBmS1NlNTl6eFBQ?=
 =?utf-8?B?b05maFUxR05LVTM5bFRuT2lrcEhvdDcwdXQ1bXNIL0Q0Nk1WOU5RN2x3QVJ4?=
 =?utf-8?B?VmlnTWl4S1hFWGhFYUYwZWQ2NmpoV3NWamV1Q0xMQ1ZOcWd3UC82LzJFSmhZ?=
 =?utf-8?B?bEhldzk4YStqd1RWaExHekZZdlhTRVorV2s3WFZLTXZBb0RwNmZmWmNsK0wx?=
 =?utf-8?B?NmtvWGJuRTFqazc4a3hmZXBCcWN2enV5NEVNTDFNWXROcXZsSUhUNjJrQkpn?=
 =?utf-8?B?MHk5T1FRRUhTS1hjUzA0Wjc0cDhiVTJMSnNRTExkWlV6cTVQMFhZWW5NWG05?=
 =?utf-8?B?aVdmMUtvTzByWjhTb1BxSDkxZUk5MVEzN3lrZkN0eG5ndkR5MlF5Y2JiQzNO?=
 =?utf-8?B?d0xKVEhscXpOcXg0eXdaSlFzMHhIYm5yeTNXZWVJOXlyaXVkK1hTVU5VdE5o?=
 =?utf-8?B?TDRjQU9pWFJkZ2Q0U1c5dFRqMGs5TmRlYUN3M3kyYU1kYWwyQ3dhUVUyVHM4?=
 =?utf-8?B?TWNjaE9pblN0ZTVKQkNqVWFsR3VmUXFqNUwyM0dBSVlGQUxQVHNuRTByL2pv?=
 =?utf-8?B?RzhGUHA2NDB4K3RSV25leVFRUnEvUXJxZ29ZTmpuUFdSZ2VOY29WZkpKd1E4?=
 =?utf-8?B?disyS2ZTWFRzWGNNWWd0TWVibEV0d0kyakEzZUg3ZGlVd0F4U08zeUhNVFBv?=
 =?utf-8?B?WEMyekttaDZYMjBLL3Vkcm5YeGxNRWhnYmRMQ1NhODZDYndwbzdOdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e2d58e-50e5-464b-ad38-08dec2dcf2f7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:32:15.9478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvGB+5QMCCfPNwn5FnYWQKSVnigzGVscl6sLIhEIcUNwqscwTEOBywILWKMkrkG/qFPk1hc3Rld0vrk6E9eN+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5697
X-purgate-ID: tlsNG-720697/1780648342-A9772161-452C2DB6/0/0
X-purgate-type: clean
X-purgate-size: 3243
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:email,citrix.com:from_mime,citrix.com:dkim,macbook.local:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FE706466B3

On Thu, Jun 04, 2026 at 07:18:37PM -0400, Jason Andryuk wrote:
> Today the inine tracking of the stub page is problematic.  0xcc is used
> to indicate unused, but it is also a "clear value."  A !CONFIG_PV build
> with smt=0 will bring up CPU0, bring up CPU1, bring down CPU1, and free
> the in-use stub page.  Subsequent CPU onlining can write to the re-used
> page.
> 
> Each stub page accomodates 32 stub regions, and each CPU uses an offset
> into its portion of the page.  Each CPU used a CPU-specific mapping of
> the whole page.  The virtual address of the CPU-specific mapping is
> fixed, so it can be used to track the stub page.
> 
> Remove the actual free-ing from cpu_smpboot_free().  Use the stub_va PTE
> to track the underlying page.  destroy_xen_mapping() would clear the
> mapping, so replace it with modify_xen_mappings() to retain the PFN in
> the PTE (with NX set).
> 
> In alloc_stub_page(), check for a valid PFN in the stub_va PTE.  When
> found, it will be used.  This handles re-onlining a CPU.  Otherwise the
> existing logic is retained to use a passed in mfn or allocate one.
> These paths handle to bringing up new CPUs.
> 
> If all CPUs for a stub page are offlined, the page will be dangling and
> unusable.  But it will be re-used if CPUs are re-onlined.

I think there's a corner case with this approach where Xen will end up
allocating multiple pages for a chunk of 32 CPUs: consider the first
CPU of a stub page is onlined and then offlined, and afterwards the
second CPU of the same chunk is onlined.  That second CPU would see
stubs.mfn as 0 from its sibling if the first CPU is not parked, and
hence allocate a new stubs page when there's already one allocated for
the chunk.

FWIW, I would take a way more simple approach and allocate all stub
pages (using possible cpus as the max number) in smp_prepare_cpus()
and store them in an array.  Then from cpu_smpboot_alloc() the
to-be-onlined AP can gets the page to use and map it.  We could also
remove stubs.mfn at that point, since the mfns will be immutable for
the lifetime of Xen, and stored in a global array.

> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

You want to add a Fixes: tag above the SoB.

> ---
>  xen/arch/x86/smpboot.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index 7241dba621..11937175a9 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -647,11 +647,21 @@ unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
>  {
>      unsigned long stub_va;
>      struct page_info *pg;
> +    mfn_t stub_mfn;
>  
>      BUILD_BUG_ON(STUBS_PER_PAGE & (STUBS_PER_PAGE - 1));
>  
> -    if ( *mfn )
> +    stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;
> +    stub_mfn = page_walk_mfn(virt_to_mfn(idle_pg_table), stub_va);
> +    if ( mfn_valid(stub_mfn) )
> +    {
> +        *mfn = mfn_x(stub_mfn);

Before overwriting what's possibly in mfn, we might want to sanity
check it matches the mfn recovered from the page-tables, ie:

ASSERT(!*mfn || *mfn == mfn_x(stub_mfn));

Thanks, Roger.

