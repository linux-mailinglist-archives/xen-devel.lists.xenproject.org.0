Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3kcYJurpImqnfAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 17:23:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A31649411
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 17:23:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=N28ZA6L6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329654.1593682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWNq-00031h-57; Fri, 05 Jun 2026 15:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329654.1593682; Fri, 05 Jun 2026 15:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWNq-0002zN-2Q; Fri, 05 Jun 2026 15:22:54 +0000
Received: by outflank-mailman (input) for mailman id 1329654;
 Fri, 05 Jun 2026 15:22:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wVWNo-0002zH-Bx
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 15:22:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVWNn-00BMlu-LA
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 17:22:51 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a22e9c3-bab6-0a2a0a5309dd-0a2a4505e332-14
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:22:51 +0200
Received: from [40.93.196.16]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a22e9ca-aaa8-0a2a45050019-285dc4102a72-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:22:51 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7564.namprd03.prod.outlook.com (2603:10b6:408:28d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 15:22:48 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 15:22:48 +0000
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
 b=H7IhFcF3oj5fbJqxYYR1ojea7nT5ZfdJWqi0MwXDkq4iU4XPxNOC0lAwOiejBnssiHZffDnE1DaInDEKilXm4e22hK0qGyFLCPihvpENNdEuwcLpQ838E8kPihK8FlIT69YReZ1blfkcms8j29OEWXGVu/UlahXyD9uFN8skySIDDXL4YSgnouCfVNQS3jcldsJEAg4x2l1RLfl2rKrybkcVtMFgXOcQcrKdcVTiF4UkHQjdr4+f4tS9yfyIwA6Fy/zEyYBKmS669wv1f4ZRP2O+Hfa9P+pAxIsFWWmEZgNIbsVITLv4lOvVMIkxnilAHsWNUWSbURNW7MDdC+epHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5933RkXps1DxWL9uFpl/G5QCQvGCrfzQWg1COmW+dc=;
 b=HQoiKT2ZjI5JKQZPZgxs+N0KkfRWBV2ZbPfB4n7EGaFYrllePDCTs0lTb5Yffi793NT/cQJPjCjNAvbXFFwP1v9f14i9hHcLqQ6BqUJwGP0q9LeQAbacG5lFUGr43hNXSiXz415a8Qz2IzizCR35Aq0IHtqmClyyVLHzgemFhD5CLmTb/lOHfPxq1qL70bHDIEX/2p2mHeNO8EC7ipVLaWfi5P0G8vfDo6FGX7EQ1rerm1tzc8uHxNR4fIXYXz3Y63bikOeqc+rnJgJ8mes81qOx5r+hMXnxadAHLJ3hrrqPt4dNOxVSlq8vYrA3uSjupobBt/NnfaQpm4icCYlzqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5933RkXps1DxWL9uFpl/G5QCQvGCrfzQWg1COmW+dc=;
 b=N28ZA6L6jVaQkJTh0qSu6rVHLEem6l4gm+wrqzOOLwl4jpV9T07rrmKPslvYytw4wGQzyr9URoMZ4ScJE0aw9+GO/6F0vRDtWkUzhvOto+dkyccaSdR6r4gkCKyfJNNSCf6bOMdtdU705tWlsKcLfdTclTSd1o75nEU+vNfkIAc=
Date: Fri, 5 Jun 2026 17:22:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22 v2 4/5] tests/numa: add unit tests for NUMA
 setup logic
Message-ID: <aiLpxA__rzSCQQn1@macbook.local>
References: <20260603191836.77955-1-roger.pau@citrix.com>
 <20260603191836.77955-5-roger.pau@citrix.com>
 <1780672224.8631fc262581453bbf619ec5b2062170.19e9855de55000701b@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1780672224.8631fc262581453bbf619ec5b2062170.19e9855de55000701b@vates.tech>
X-ClientProxiedBy: MR1P264CA0021.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7836eb-5911-4535-503f-08dec3164cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|6133799003|18002099003|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	2LQvq/xoeQTJ9g/ORq+g2k6yRyc3bDTKNKxGjVAnFlIkI8Dc86c3XrLJ2yTIKGFTEQw4e182YUbxqkPsv4fwemfXWW1tt0eTGtjccuPuXqUZrTXgWzwIKyKMRJtx/CsGIZ2Bw0wAu92ciHSjBlxyiwKv75jNqzWtbGbySK/kM0YYjgJdXE0LTaOAvIcUiLVuTBvJcY9fa/ajwbd8ueNzgp0RpsZ2+pSIz7lS8i5GLoJ2JNUlQeYLATBSAALhW6F1hN1q6ef8ujDjQO9akD2DXLxmfuR11NnsRgcXx87o2X33yiEtzudlmsDpP+DuQn3HWtpIwVX6FyuC0c8lAV/prH89n7VHdXivelvjRvZALmEXXe0dzN0j6d12cIjrgQfY1tQ4fS08ETZ1jm4I9cZrP5glKl/h93wD/9VVUHvPzQRseFijgjZx2I4ewpaqFDmDZ0X2dg5biEinShCgkoreZR5seAQhbvXiUsOWQvdgrbaJlZh5J26aNoNGqgMlX2XKB72TYl0NYsdFe1OPmbBlrzGTUTpHtvZNV+fKqmfpbtZ0z4homczzAPWjeVfGHr8lQ8QHdX86GDqB7wlOWU3SZJNFwEsIdsTpO0cFwrkfSrtKCEScmJF6QIpFnEaW7VGV4eptvqv949ZyRVY/DfwqUhh1WMTiWG9nrAuaz97QT4StKOAx85Swraz7AJALX5ll
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(6133799003)(18002099003)(4143699003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1ppWEpvWmtrT2JFYjlGYTZQbHF5cVhlUXh5eUs0WEpYbUk5YmUwQXp3Y244?=
 =?utf-8?B?cGhEMmQramMvdDErcUVWME8xWXQ5SkRSMnRySUlhUkZVTW5hbzZrcm9DMzdX?=
 =?utf-8?B?aFFZQjcxSlhXM3hudU55NXV1MzJmMlpYSTM5UVV6OFdUb1JrSDJPRVpjNHA1?=
 =?utf-8?B?WFFBeFlWaG5mR21FK3JzdXloOEc2UDNLWE5hVnJxclA4eTVrTDhIQ05mRGZB?=
 =?utf-8?B?YkVoa3Z3bmVmQnp3T3Y1RFkvZjV5aTNsOHlEWFJxMDRud1VkRURXSlJYWjdT?=
 =?utf-8?B?dWRua3EyeStGeEw0Q0hucUFySTFKaHEwZzdGT2JYVTBWQUtxM0hBNURvTWNx?=
 =?utf-8?B?bHFVWnBRQzlpZVFXa1JGVjFSdXpUVTBrNmVvemlaTytwdmRBNVBIOHp2elRr?=
 =?utf-8?B?bVI1djhCU2VSbkIzZThUSkdzRmhyMktoT0k4aG4zc2x3Zm91TnZ4U055RHhE?=
 =?utf-8?B?cXIwcEJTdzQ1YjVGeHFqYkc1ZDY0S1l1cHZDOXMwUTVWKy9wQXdESStrNDRl?=
 =?utf-8?B?Y3VFRVFBRlRiSnJIa25udU10SGdRL0x6M1pOM255OEx2OGNSek9zK2I1K1lu?=
 =?utf-8?B?bFJENVFyV0tPK1BSaVVXWW5pNHZBNGEreVhQc2srVDQwZ3dkS2JzYlgzMHJ2?=
 =?utf-8?B?OFVjbDFrSXZoOXkrSitzU0dxWjZSamVIUFJHUkdhdDBLUEVrSGc3ZjI5L0c4?=
 =?utf-8?B?ZWFHSzNMSFEreXl1SHVsSlk1ZEJGRW9NcFBzRldob2FNaXpXcTVDbmpCdVN6?=
 =?utf-8?B?dWhVSnpkaXEzTmZRWkxvb2d1d3FQQXZlLzUyck5vcFBHQ0huWXdscnUvWHRF?=
 =?utf-8?B?YllZb0JqVTlqcERWQ2V2L3JRdFRLaCs3QnhRZE1rQndWMHhCazVPaVhSelh3?=
 =?utf-8?B?YUVZb0dHNmRVS0hsV2hkRDFwZWJoRlNFOTVHd1pEK2VzUWV2ZzYwRXpZbWNP?=
 =?utf-8?B?ZHpaRDdKNXNMbjVZeGhNVys0WGF0VUJOOHFXb2VFYlExbmIrMEdpTm9FeTJq?=
 =?utf-8?B?U2hYNWJlc3RIV3RJeC9zc2lNcDI2T0FsR0ZMZEttVTZWaHNDZzFQRTVDWDcz?=
 =?utf-8?B?Yks2QUovT2xXTUxzdGQ3RS82dlAwdGRHS2J3UU1sNjZlR1cyTWd4UEZPVkUv?=
 =?utf-8?B?N1diWDJ4Vi80MWNKQUpnaG8vNldZZXdhYWRvaHFUdzJQaWZTeE9rZE5kM1dk?=
 =?utf-8?B?NWJOTndtMENyaHJLSmVza0JpR050bkRZWDBYOWlKRExMSWxlMjRpQjF5ZGRR?=
 =?utf-8?B?UGthZy9zam0rbjJGbHNIbzNrYnN1UEw3ME55aUxrMEVTK2hRcHVyN2x2bzk3?=
 =?utf-8?B?bWQ4cFRLc1ZhRWFJL2V0c2oweVFZZUdCM0xQUEE3YmJkckJJME5RcmtBNFN5?=
 =?utf-8?B?R0psalNjQXJmcGFkYmxFUEM2NmZjZVpQVVZUZDdabTViT01FZkMxNnh3YnVw?=
 =?utf-8?B?VE9YUGM2a2V4NHdaUmljK0FWdkl4aXpiNWN1NmJZeFA5YXB6WUt5cUk2dTdM?=
 =?utf-8?B?bCtvZEpJVEh4aUs3bDJZVitWd1pKdlVMR3IwNTV4TFJxQWd1N1dOSXV0eHlE?=
 =?utf-8?B?M2l5TDFjUmFwRmcrZHBUUnZlS1RVOStFRm4wVU9hSkNEdzljM1lUN2EvNC8v?=
 =?utf-8?B?L1V6MG85b0R1Vm9Xb0NQSm9tNEtPZ2hmSHRmYi9BSzRJNzU5N2pzQlNreGx0?=
 =?utf-8?B?TGVrTTdMRDlIQzdlZVpBc3BhUFR3TXFCb3FOcGNRTHFjTzE2N3k0b1Z4UlF3?=
 =?utf-8?B?WUd3NWZERnJieXZZSjR4NURqNGVJdWp6TUF6WW5Db1F4My9PUU4rT09kZjNh?=
 =?utf-8?B?RTJnS2ZFRlgxaDdNU2pBQkpEWkRnY01wMTcrNk9YUGVpc0xFaE8zMmZYbHZi?=
 =?utf-8?B?S01SUW5uV01IckIrbjJ1MWQxa2k5eEVSWlpNenY1Ti9VSWF2TXJJOW80djN0?=
 =?utf-8?B?UVVpUnFOUGpLZWhtSUhQc3VORWxyaUthZVV3bE9peFVHcHJjL0ZSYnJEUHRi?=
 =?utf-8?B?L3BHYVFjdmdkdjltWTVPRG5VUGtNRWtXOUV1UmpNSktEdHE0YkI4N2hiZXN0?=
 =?utf-8?B?aUNsKzJDM3hPV3dwcTBPdGhoRWhWdWxXSm96aWVBYUhHTGVhc3JkVHh2SEhh?=
 =?utf-8?B?VUNqbERhczM2TVNwaElxYllyc0h3clBQMjlhWlJZb2Y0dHR6a0ZqOXdJNTdi?=
 =?utf-8?B?czdOU1A5UVVkdE5nWkYrREZZRGFqZnFPbEMyMHpxWDA1cjdMK0RHNTV6RmhC?=
 =?utf-8?B?RkhIT3A2YWdjS0RjMTF2bWhlenNOWXVQMElyblN6ekZBSGV6MEk1SEZNZUYv?=
 =?utf-8?B?dy9XUFRxakQvRHBmYmpETlR2T21NYkhLSFRXMzNjR2t4bmJZU0JHQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7836eb-5911-4535-503f-08dec3164cbb
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:22:47.9798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSb80KDE5z9UFZIhrNiO6X/TlbbyUH/I7QOFhrNXhbKH8ksPOPCa7UX6rlMhtypVSMmExyEX4iWG6QUbq25fhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7564
X-purgate-ID: tlsNG-c201ff/1780672971-D3563443-0F82997C/0/0
X-purgate-type: clean
X-purgate-size: 2236
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
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:from_mime,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:email];
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
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0A31649411

On Fri, Jun 05, 2026 at 05:10:23PM +0200, Anthony PERARD wrote:
> On Wed, Jun 03, 2026 at 09:18:35PM +0200, Roger Pau Monne wrote:
> > diff --git a/tools/tests/numa/Makefile b/tools/tests/numa/Makefile
> > new file mode 100644
> > index 000000000000..5235f9d6297f
> > --- /dev/null
> > +++ b/tools/tests/numa/Makefile
> > +
> > +.PHONY: uninstall
> > +uninstall:
> > +	$(RM) -- $(patsubst %,$(DESTDIR)$(LIBEXEC)/tests/%,$(TARGETS))
> 
> There's a simpler way to write this, with
>     $(addprefix $(DESTDIR)$(LIBEXEC)/tests/,$(TARGETS))
> But that's ok to.

I've merely c&p what we had in other Makefiles, and didn't think much
about the specific runes.  I will leave that one alone if you don't
mind, we could always do a sweep change of this pattern in
tools/tests.

> > +
> > +numa.h: $(XEN_ROOT)/xen/include/xen/numa.h
> > +	sed -e '/^#[[:space:]]*include/d' <$< >$@
> > +
> > +CFLAGS += -D__XEN_TOOLS__
> > +CFLAGS += $(APPEND_CFLAGS)
> > +CFLAGS += $(CFLAGS_xeninclude)
> > +
> > +test-numa: test-numa.c numa.h
> > +	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -o $@ $< $(APPEND_CFLAGS)
> 
> $* should be undefined here.
> So we have $(CFLAGS_.o), but that variable doesn't exit either.
> You could remove $(CFLAGS_$*.o), it's not use here.

Ack.

> Also, $(APPEND_CFLAGS) is added twice, once via $(CFLAGS) and a second
> time on the command line. I think the one added to $(CFLAGS) should be
> removed.

Done, will remove that from CLFAGS then.

> > diff --git a/tools/tests/numa/test-numa.c b/tools/tests/numa/test-numa.c
> > new file mode 100644
> > index 000000000000..bced68d4d7f1
> > --- /dev/null
> > +++ b/tools/tests/numa/test-numa.c
> > +
> > +        for ( j = 0;
> > +              j < ARRAY_SIZE(tests[i].affinity) && tests[i].affinity[j].end;
> 
> Why do you test the value `.end` ? ARRAY_SIZE is likely enough as the
> test array is static. Same thing later, with the `ram` array.

To skip processing empty/uninitialized entries (ie: ones with start
== end == 0).

> 
> 
> Anyway, it's all look good enough to me:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks, will do the above changes and do one last pre-push CI run.

Roger.

