Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMYmKRIs62mBJgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 10:38:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0727F45B9AE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 10:38:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293282.1571093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGC3C-0005dl-WB; Fri, 24 Apr 2026 08:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293282.1571093; Fri, 24 Apr 2026 08:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGC3C-0005bu-TU; Fri, 24 Apr 2026 08:38:14 +0000
Received: by outflank-mailman (input) for mailman id 1293282;
 Fri, 24 Apr 2026 08:38:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGC3B-0005bM-E3
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 08:38:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGC3A-0074i0-Qq
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 10:38:12 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb2bee-e002-0a2a0a5209dd-0a2a450ca3ee-38
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 10:38:12 +0200
Received: from [40.93.194.31]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb2bf3-62f1-0a2a450c0019-285dc21f4568-4
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 10:38:12 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS1PR03MB7918.namprd03.prod.outlook.com (2603:10b6:8:222::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 08:38:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 08:38:09 +0000
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
 b=PvntZJdk9W+BrM5VTEpzqQAnliXyhUCT2W2wmHRU9qgiWUQ/NvCxmmebGSl5VBK5iB10kilVVvOGr9cS967GNqTKsfV8XKlI4zNKhhcub/1g2PT1TOYNKUUF7IP4Ye7xTVk/1w5rV+ezAq57leuYlnRW/G9eJPP1YcrvSsDVaTiBCeF3eHZSkpzPEjNdYf1qee5M+Le66dsq5aG6mcljvPm2XBQsltCpKC+y8ph0pEMRfe4leWof5xCG8jMWYy6UefrLfOqQrCPk0YoDiujbpmtbK7ynNSOWmMXpxPt0ii1gcjtdRgcsouPUXJNfZN6tSjlxGueRD/bL3WibIzqzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dovTWvXMvbx1uRW13q31Roe/4gyTFgE/R8ddkYUhMjM=;
 b=ny5jqjFz39p2mGp0T++pi9Djw1/arA/nKKQVHyEngn8zcPNC8p5KgTQS7MBJBtUMTmm8wk12Yvi5KBApE2kbez+UN2gVGa3FlfAqEvtZsPBomHq7ZrWNZmfVwEBHVtlOO2Mbm0HuW0N9lxKTRBNibnGq348d0HpWYNYwTAG9Su6AIQUH8wbBJLn3Xn2YItkCY5NdoGd5OwozoIZkvzi752l7reNxnau0FM9GahmiDkzYDDtkUliAnetYkYFuA6XowZJ1xIvKkL8epogsJly3BLfRjQLM06i2/UZnghSTuC3L//HsdWgPA/id9tMw6I62a7Dpieq3K2uV8TV/3snFcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dovTWvXMvbx1uRW13q31Roe/4gyTFgE/R8ddkYUhMjM=;
 b=ZTVt6dQV0eVpD4EkSjxMXdnItYp5X1D8I7m587pEcW7rGg5xK8HaPdUa+JLdso2rsX0iTuEeITLDVuQmABwVkcYkOj1o/i2hXWlq8Ap0xl5AlujL8Am6a9SszcNI2ibKbHZFbsWBBZuxPvAeC7BNB4o8KKzucKA2RgAeFRAVqd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 10:38:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 3/4] vpci: allow BAR map/unmap without affecting
 memory decoding bit
Message-ID: <aesr7YlOKjJsLTkk@macbook.local>
References: <20260406191203.97662-1-stewart.hildebrand@amd.com>
 <20260406191203.97662-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406191203.97662-4-stewart.hildebrand@amd.com>
X-ClientProxiedBy: MA3P292CA0052.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS1PR03MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 5038c7b6-ec48-4f6e-20dd-08dea1dcd035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VwRTXCwqisY6NIb5kjLm9MvcAIA2uANirJ1mR2OWGeklcVDc2wTHkb3BIS07RJGBCsQ9T4ZAGbpZ1L2PvCJ/8qY3YMOr9qA2dQibpfQhvwdhg02rBEHxIWmAKaqFHbf3RoSBPsR0yQU5IhjP1B7FTJmqs6hvEFOjfggvJjJe8BbwUtVEc21L03aGtHm0fMSjAOoZHrWaO/wCzTwYVwBmVpWF21azthuRO6luYh/Dn2Xw/d/fWupLo0oEWM0y7b40MnX454n3tfORqug1mPjmBmr+VpIUmT4y8MaAtR7nu9lYBpwh55ChtFK6vXe+TSFhbeg3X7EY+sIUVkDK+30AaKV9/s+Xa7q4lj+ydnCPeBdmWSTG5+hLcDu7PItDuSowr+waFdu3AEp1MI4tyrrccvtO5zPVbQhy5GgeOycjdvCZBUpp8G5VuO0UG9R0gldhy4KKwhmCLhdMx3aJ+/ieo7k2ioqhrFc3kYPWHyjHts/YHo6WelYVyW8gEBhG0ef3x1Ys8K7/2v/3AHIMAbHw+V02M0egJyoCn4S5A1C8tMQIHB1RszdOw9p0VOGURw9uNkRqN5m4sN34mTQ9HYi7UkDahRaxErb95wMRNymMoXvVNMeDm5PogLjhZaAlFKu70Co04AqCHIedJJFmhXNc74305zR4p0S9f7Gn/A0RtA1p7IP2PTPgqJqQBAw9WmRxYDXYvoYir0uHOy+svnB9wkVSJ0aGzwuOrqEJIckSjfg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGN2Vk1FUUFBYzRoeUZaOExDQzhIOURaSithSmJtUE5RRHRLWG1OemFyUXJk?=
 =?utf-8?B?ZDFqenZ6K0NrUEt3a013WktEajl6VlRFandlUTBYeFltRVJveFV5elg2YWxz?=
 =?utf-8?B?VXIvd1JmeVZJeGt5ZExmcXgwNUxGd2Y2UG84dWdLa1dOejdaMG5acmwyQzgy?=
 =?utf-8?B?OUJONGI3Znh5N0tGODBVMVB5YWEyT01Famp0OHdBbFpvamhHdmtxOE5Ob3po?=
 =?utf-8?B?MEJkdUVxN29UaWJyUXU2Vk1QaTBRTzFRYTYxbU1JRk85ZU9OQXJvaEkzYUFs?=
 =?utf-8?B?MVJTMGF4em90bG01LzZQZm1TUnFiLytiLzQzQjFDYmV5SFBpMTI4OEZQVUVn?=
 =?utf-8?B?VkRuUE0zQW1KSm5GSVJVYWJKcjFpUExzYmFlZ2tja013REJ1TFdDTUNpTVdp?=
 =?utf-8?B?d2NpbnA0T3cxU01BaUJNQXA0dTNLYUN2b2srVU5NY1F4Zlp1bTc4NTZxUkxE?=
 =?utf-8?B?aE9EeFc0clZua1Jna2JhcEltbXRxcS9BdDEwR0RFei9tV3JNUUd4T3RicE54?=
 =?utf-8?B?MUtZTVdXOHRWcmp3cE5KRU9WNDhRbHNlbVNxREZDTkNCR2FDVThEMlFYYWs0?=
 =?utf-8?B?cldJNkZEUUQ2ZDZleHZ3cVppcE5WdlBWQzNjSndGKzVocm8xam9yOFNqMWF6?=
 =?utf-8?B?bEJIQUZ1UmtRUkZDblprdEpsVGF0ME9yRTlCNEVnUDhQMHV4WGltOTdRR1Fo?=
 =?utf-8?B?blZwenVZakFtbHdraUljV0d3dmZ5M05sNGVJV2VzY0I5MG1nc25PVDNGUWpK?=
 =?utf-8?B?a1ZsUUs0N1RLZzVWRytVU29QUFVnRHhTV0J3NFQ5eUNrLy83UlhCMTJOMmE2?=
 =?utf-8?B?bzhXS2NnVU9CTkozejF4aWdMVWd5VDhsL01YcVo1REx4NzVpUUdFdkhaM2xN?=
 =?utf-8?B?c0d5WDhMR0FZSndIT3FzeUJaUDdiK3gwdWxtSXY2NGlGbkNZY2Vwd0VHYXVI?=
 =?utf-8?B?OWRtdEp3QzNFMGcvOVJtWkpEZW80RUlYQW1pNVU1emhMM1NZZzNHWHZOSWs4?=
 =?utf-8?B?cThaemUvaE5sK0RGOHNtTkJENjg1eTJ2NDNLb3BLL0tUTkszeTZML01LYTF5?=
 =?utf-8?B?RFR0RnhvYzFKUmtZRVVWOXRUY3Y5YlF3TkdYWFA0cWJzNTd0alVaaC93Zit2?=
 =?utf-8?B?bWZrcGtKdGNOTGdCdUF2MzYwY0EzYnZJQUFmc3l1LzNSU1NxUTBqRXJJelRZ?=
 =?utf-8?B?YjZzK0p6bVBXa0UxOWE3SUd3K3BGbStEOUViczgycG0rN3JHSFhWNWg5SUsx?=
 =?utf-8?B?N2NBMnJJQzd6TUM2OUtNV2RXZThxaUM0eFIyMEJ3akpCS0J2YkpFYWljSDBR?=
 =?utf-8?B?a2wzWGczelN2UGdiQ3ljT3Fsd2Z0N3dRbDhaVDlmRGxQL2lFUVhBZEdQWFhQ?=
 =?utf-8?B?Lzdha2ZmaHZEcjk1b1dGL2Q4U3VLNFJ1VjdGVzZ2RHIyTDY4Z0J2cnRlNmVE?=
 =?utf-8?B?czd5OTV2M21QOWtuSGtuV2IwZmxQbktablRUdWR2T3FwMTVkdUF4bDh3Wm5w?=
 =?utf-8?B?bG5DcXowbExrNjJNVU51WmRQYW5EblRDOEVVeE1HdTNHbkFvQk9UeEtnbTZE?=
 =?utf-8?B?UmRsSWFsYVNWbVdnb1dPdzZsSEViUEo5ZENiSFZJUnZheWZjL3g1NmVTU3Rq?=
 =?utf-8?B?M1VLU0hqamc0amZYeE5xT0hIMEVSd29vVGQ0a1h6OUZIcCtLWjlrTWI3UU55?=
 =?utf-8?B?Q0NSS3A0QW0vYW91WmNZc3dMaU8xRUhBSmk5ZkN6aURUNnIxKytQcEVraXRL?=
 =?utf-8?B?aHN1MDVmWUw1cmVBU0FSWDNobWdPWll6UkYxZnBHT1FuWUdRZkh1Y1N1SThE?=
 =?utf-8?B?V1Q4SFMzbUhFR3JjTlRIVm1Jeit6VVQyMW9CNWdvVE5PYWZjdVlnVjluTmgr?=
 =?utf-8?B?SDFUYkxkbjAvNDRDeXgyRWJ2dGJvRmQxbSt0S3BYSkFTWU1XUWlqREsvdzho?=
 =?utf-8?B?NFVja1BoSGJBREJPOVVtRndnTC9wdVJ4c1dxQ3BLdTN2Y1dmMDFxZWkwbmwz?=
 =?utf-8?B?Sk5IL2k3ZWo5TlA3amR5TmFlSStBOU03T205ditieE5jSFRSUC9XSks4WVM1?=
 =?utf-8?B?a1dqZkRVN21PSWZDU0N6UFZiRUZ1OGFuRUN2QW9WcDRCMnpseC9LTUF5VlAz?=
 =?utf-8?B?eXZKUEY3dDRxU3BWaUx5bW11N050OXV6aU9TWmh5eEFVOWtuSDVPTzhPU01D?=
 =?utf-8?B?ZGZQbFFnUjZIQnkrbHR0NGFmdHI0MTJjVWxSQjNJcTV0T2lKaWJ2SytJTHNC?=
 =?utf-8?B?UHFCL1Rsdk1jN0FCZ0tNTzZkeUZFbVNneVJHVHJzSjU0SU9Nejl3RThhYnFr?=
 =?utf-8?B?ZWF1S01wa3RMUVVTRmxCVlFSa2czK1NtZzAyQVQ5VzdiNENIRUlzUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5038c7b6-ec48-4f6e-20dd-08dea1dcd035
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 08:38:09.2523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OFPVr5S9FeYO7lLln0ao/89ueM9ecAmqEPgOVw/pjs4IqxeINMxJ922+w5Pjyog6y0N4G6U3UDx2R4SvfQ2Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7918
X-purgate-ID: tlsNG-d25034/1777019892-6CD63CF5-A7293881/0/0
X-purgate-type: clean
X-purgate-size: 2344
X-Rspamd-Queue-Id: 0727F45B9AE
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,macbook.local:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Mon, Apr 06, 2026 at 03:11:57PM -0400, Stewart Hildebrand wrote:
> Introduce 'bool map' and allow invoking modify_bars() without changing
> the memory decoding bit. This will allow hardware domain to reposition
> BARs without affecting the memory decoding bit.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> This also lays some groundwork to allow domUs to toggle the guest view
> without affecting hardware, a step toward addressing the FIXME in [1].
> 
> [1] https://lore.kernel.org/xen-devel/20250814160358.95543-4-roger.pau@citrix.com/

The deferred toggling of the command register bits seems overly
complex IMO.  It would be much simpler if domUs simply don't get to
play with the real decoding bits.  For the hardware domain we could
toggle the decoding bits ahead of the mapping operations, so that we
don't have to defer the toggling after mappings have been sorted.

Long term we should aim to remove the cmd field from vpci_map_task
struct.

I don't mind if you want to pick the patch in [1] in your series, as
we could then drop the cmd field and possibly simplify some of the
logic in this patch by no longer requiring the deferred write to the
command register?

> v3->v4:
> * rebase on dynamically allocated map queue
> 
> v2->v3:
> * use bool
> * switch to task->map in more places
> 
> v1->v2:
> * new patch
> ---
>  xen/drivers/vpci/header.c | 43 +++++++++++++++++++++------------------
>  xen/include/xen/vpci.h    |  1 +
>  2 files changed, 24 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 146915e28c50..20fe380552f4 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -117,11 +117,12 @@ static int cf_check map_range(
>   * BAR's enable bit has changed with the memory decoding bit already enabled.
>   * If rom_only is not set then it's the memory decoding bit that changed.
>   */
> -static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
> -                            bool rom_only)
> +static void modify_decoding(const struct pci_dev *pdev,
> +                            struct vpci_map_task *task)

task wants to be const here, unless further patches require modifying
task inside of modify_decoding().

Thanks, Roger.

