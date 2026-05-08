Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN3JEVSo/WmEhAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 11:09:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD764F413A
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 11:09:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303330.1576784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLHDA-0007vi-6i; Fri, 08 May 2026 09:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303330.1576784; Fri, 08 May 2026 09:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLHDA-0007ss-2c; Fri, 08 May 2026 09:09:32 +0000
Received: by outflank-mailman (input) for mailman id 1303330;
 Fri, 08 May 2026 09:09:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wLHD8-0007sk-CF
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 09:09:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLHD7-00C82r-C5
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 11:09:29 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fda836-bab6-0a2a0a5309dd-0a2a4501ed5a-44
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 11:09:29 +0200
Received: from [52.101.53.62]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fda847-c1f2-0a2a45010019-3465353ec54c-4
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 11:09:29 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY1PR03MB7215.namprd03.prod.outlook.com (2603:10b6:a03:525::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 09:09:25 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 09:09:23 +0000
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
 b=KvlP9B/5AoQWV9M1n63ihAJ7UZu7nd1AnVZWEj7cWpcED07Tw7NHFmixIJNIeD5jbHklee0pVTg6StF4kEGHumSGUMy6CB2qGFqe4vsKbmvOpPoQEsWt9DBYCae/6mXrHBPwVhJehol5uvIKskmMbd4AvItKSOajMzpUknLRwiXDhLzEc3H/mGIyK66FH4IAuoPSm3xwUA/FshJe0UEKDieps5hG8q6U+0EaIL2vi1SXjPbQDxYxiT4/GfU4642V79itcWn29xtk2XQGNQQvJbrpRlsC2ODWCYtVQ+lMYwjcQHPYtWb8Shp4fLvOg/LdqLk9VrwwK052IwE52MX/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUVEHxrKR+eW3aGyNqw0ViTP/jQIYisrE+p6Ds940tQ=;
 b=o+266p+Zvl8rOwQHxrK36IEQHOVISP5Wzfc9jY+or0FU91hW4ZmGnm8jlDSDwhl3aPpD0GyoETTEHyjPj8twrmfeTx3OnzOuwJd7hXf20gkQEvzRL65eyBKIAZ8hnQdsgEtHqCp6RjlnVtbv/7YmMau8UzyEGO/9LOjX+3Jintc89tXbkcB7FeE0G+5dNhSKgl+M3fbxEXBSOczWv5p33C2uFCNZKE8ypk336IFKMofvUOXkq8IXAuAtROhjqRoZZj863B36XBiyQJH942NZmZ1XWvbU0RDPJP2LK1olYeJCA0Bi9PCXyo+xedLvOG2eYHivpA2FPEFk1YvqF+K9fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUVEHxrKR+eW3aGyNqw0ViTP/jQIYisrE+p6Ds940tQ=;
 b=h0xGq1tWL9vrMnjzkPZIziGhrBPopLsk6Vt7fhsyJ+VF918BXkPJJu+/7x8tDhVlAFAUYZV1cF3b3ZHhaBn7ZfWd4rOmFqwIJI1KNM2KJOPlY60O5qDWbomduqn6rqR6Vn+2p2fvJUst566FwZNliwl46TYBYAYBtH5mLa/Gcqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/dom0: enable pf-fixup by default for PVH dom0
Date: Fri,  8 May 2026 11:09:11 +0200
Message-ID: <20260508090911.51941-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0032.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY1PR03MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: d1cab7f5-bb98-46fc-e6ef-08deace17f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZTTaIVD5LJBF9qaotdjOLtMZi9r1e+cmvkKu49h2aJ4JmQkS4/UKmQdgNVf1l93wDQ6h+b+V2BqGZdGUm61kPDf8nXVE4EobSqyYMprkhTxrZEM/9eaBIuNn+oy+uxxRRbIUSGF0NwKKllIi+h80FmidF9mygttfPb5p9ZajzInwCEzdqmZbOxk933zkvWT50VPq99ekDDMn2P/ZSSXY62vOjKi6h1D25846MUKozqL275GX2+qne/1JSSeSRd25fOABKCsap+TmylkwtIIabJpmSTlgWjbHTktS6tnzekSqaiUecAH6Sr5ndd/m6rac6S8DH6PggAWJyCsZ8YVHOOBHZloE91Gag56GPQnLSw2+QlIEyUEjknPkcuaVvZKlIOv/fOxA9RvNK6ypJDNf2PSnDWAr6SWZJ59beUEpc4eHt0RShyiScgGpzOtjNQbRlwn9cveD4J2kDW8Mbk3k+HneM0CKzM6OOKaezcvDSL+4qHaH4wAaNF7Ej8KLpUERWMV2REiYnWrDkz3Z+D/9WUDatd84REXp2IN9VjUBu6/wET8r3OKIkG0b827/mYqzDaqlnwqvaA9/gKFehvFPIgLAgmlMeg+m7RQdd/8DbOZTYC/EA44Xqww0G28k4QtzoYSqfMcGUQgC87AcFCzONWJnZGBdL/X810eI1DtWmOQ5N41rel+/jYwnDbNe0YQf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZENWWVl6blhibFhoYW1aR0RCSnVWYjc2QlUzSTQxQmYwUGl1UExKeTJWQXBD?=
 =?utf-8?B?WVFlQmUxME1xOUpLUDNyWnVCUmRVWWxRR2dtYlBsT25CNG9qSFV0VTVNQ3RV?=
 =?utf-8?B?empLTHh4bXhsUEJQUWJCQUo2VVBwclcyMTV3V21Mb3h1bnhsVkFvODFZRjdu?=
 =?utf-8?B?SVAxSWNMTzIwTWgwVWkxa2ljd2ZxVmNUdEJlaHNoRjF3TDQvYmlQZWswbkZx?=
 =?utf-8?B?b0JFejVmL3Q3Wkc4cWVPa2xvZ0pQUytKQm5BL1B2TUNzd0dqNngwWUYrZllY?=
 =?utf-8?B?cU5VS3dVaUd0WmlRTVN3VWZjYTAyNVk0Ynh0TDJtUjRHd1A2L3h4MzBwYTdD?=
 =?utf-8?B?SGJXVXUrUmRQRHVFQTdlb3puSk1YOEFlTVUzQ0prTTljbFFqRjhZd0k2UGgr?=
 =?utf-8?B?bDFSNFJreU55M0J1d2xURWdOZk5nN3U5UitSdFU0clUwQkhkR0QzbFNMd2sw?=
 =?utf-8?B?UlI4U3pxYVJoN2tmVXdQT1l4c0ZYK2JsU2FSTDVwU0dRby9yZnJhNTJOOTdX?=
 =?utf-8?B?ckRiNUtFbUlNUXcxYXRBUzA1UmlkVWxZU2FCT1ZndXgydWJwdERuRjFpc1Zi?=
 =?utf-8?B?RE1lYjVJN0syK2dWOXZrcXZ6YjV1dERId0lSNUpvNmRtR2FWcDIzOXVWV3c1?=
 =?utf-8?B?K25aU1pvcE9wYWlhd09tVWZlSmF6NTU4Z1JFZWJCdTRETWt4M25wd3dGRkV3?=
 =?utf-8?B?RERnY25iM242dmFQcTlUaCtNMWJWcm9YUklheU1yK2QyR0NaRnlBN2NUdWhw?=
 =?utf-8?B?Ynd6Qmg1emFRTDVkN1phempxcG5Oa3YvNUp0cnNNQkV2dmIzKy9Feldlb0ow?=
 =?utf-8?B?VWNqaDExZHc0ZDVmSzROY0ltS3dZNUpNNmJWWnlWckNKN2xQb0ZqYW1Xbm8v?=
 =?utf-8?B?Zk12UmtUQ2xLY2o2dXB5TFNRWDZnczVnV1FYK3BhV0VKaitsc0pQVzZiUTNx?=
 =?utf-8?B?RWdxYi9tUDhhTGg4djFSbTEveHJiNkRvNlVFTDBVRnNHZ3BOSDFBQzJ2blVt?=
 =?utf-8?B?Z2xoZ2RDUHNUSzFTUW02OUJCYVVXWm9ILzZzd2JIMXVvLzF0L1dkVVNmTVNp?=
 =?utf-8?B?SXN0WHFXdnRpRGJqY2Q0cnVoL0pQK0d2UHl5ait6YmFGeWc2T2x4ZGVsTkxx?=
 =?utf-8?B?OG1UUkZSWUtsTENSdzVacXdUcFVxeGJ2OS9JYWlFMkJjbitXcnJMY2hGQW9o?=
 =?utf-8?B?TDM3NTluYXFpdUdKWmZKTy9XZDlQVlZMYUxwMGYyN2VFQzdqR1JhbEFyU3k0?=
 =?utf-8?B?U1FmT0R1ZVVPNlVoNmF1Z0J1amlmeklvZkROOU9za0xiWlQvRjE0K2pNQThC?=
 =?utf-8?B?N3lRSEFkRFltUlNhSzhpUk43ZHRnT3BsOXFHd2YxS0hONUx3eHVOVSttdnNV?=
 =?utf-8?B?aFU0M2ZnQjU3YzBHQ2R3d3RIbklLNlFDQjc5Z0NnRzVEM3ppZ20wdjZ3b0Jo?=
 =?utf-8?B?cHJJMithQUlwMXhKVkd4TWhsc09GN294RllVaWd3RU93Ylp3ai8xNlFkNDMv?=
 =?utf-8?B?TTJvOTF5ZUtYQndiRmQ4YWRacFV0bUtKL2FWeEVvRW90SWVYeFhIMWFWOVRV?=
 =?utf-8?B?bXREYm5HN0lNaUtlU2FrSmF0cW96L2QzYXRkaUhzV2VwdGdzVG9qQi9CT2wy?=
 =?utf-8?B?M0FrRUxYWVZlYUc0Y0ZnTUhQRVJrV0E3RGtXWWtxQzk4MGZMa2RWZndnOHNu?=
 =?utf-8?B?aGg0dWdMZExXNWVXNVg4OFBxdGlyaXQ3bGhobTV5WXp1aDVpVENyMDR1Rzdm?=
 =?utf-8?B?djU2akdOOFpyN1NwSVU2R0xsbDM3WG53MWlWSlRybkdpcG4xb3E4MkpKZStu?=
 =?utf-8?B?d1UyNWJYUWFJUG02NTF4NFBYVWNGUzhKcGpHamF5bmIxUHpqVklVTzV1Snpr?=
 =?utf-8?B?cXhzd01qM2hHZFp0RmZtZDg2eCtXbjhTbGZZc3JoblR5ZTFVOVR4L1RQbGFa?=
 =?utf-8?B?QXRjbEl4VXI2b1F2RG1TZ3F6SjNOazJaWEFlVGxXZnVQYXJqTm5OeHRoTkw2?=
 =?utf-8?B?cXJFNFBxK2x6ZHlFSWtSbHBPM05hQURtb0NqWndHdjg5c1p6WmNnZ3M2U2ZZ?=
 =?utf-8?B?b0RXQkhwTnBxOVU0dy94enlCOEVoZFI2TkZFOFIvK3BEa3hZTk5GcllZVTFS?=
 =?utf-8?B?VHhwQ2lzVEIxak95NDlJOWtZd21nM3ZFT0hvblJLVVRicEdTQXVudGFaMGJO?=
 =?utf-8?B?VTFhWERTNkVzN09VcS85Y3ppNzRUSTZmcHpzRzJqcnI2Q0NWUFRJdnpjWkFx?=
 =?utf-8?B?ZFBCN3FiZXFpTGR2eUJNS204RnVNaFdjL3J3ZTIyb2VMSVhUek1IcnRXZXho?=
 =?utf-8?B?MlVwdVk3Zm1rTjZwTm4rNUp4T2RwTmdaTkFKVDcwbDhEcXpLZkY2QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cab7f5-bb98-46fc-e6ef-08deace17f2f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 09:09:23.6941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8ioCH66zNAMK+efwPWUw/h3ZUKspJg+C7HYpn7lKGZ6vn8Hsr21R551PzUblRs9Jn3DOuqUlgxCAGJ+8MRO4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7215
X-purgate-ID: tlsNG-d62444/1778231369-B474CFF4-11E0AE1B/0/0
X-purgate-type: clean
X-purgate-size: 1581
X-Rspamd-Queue-Id: 9FD764F413A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

A non-trivial amount of issues related to PVH dom0 are fixed by enabling
the `pf-fixup` command line option, and no issues have been reported as a
result of its usage.  Enable the option by default to make PVH dom0 more
robust in its default configuration.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/misc/xen-command-line.pandoc | 2 +-
 xen/arch/x86/hvm/emulate.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6c77129732bf..0cbac1093928 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -849,7 +849,7 @@ Controls for how dom0 is constructed on x86 systems.
     If using this option is necessary to fix an issue, please report a bug.
 
 *   The `pf-fixup` boolean is only applicable when using a PVH dom0 and
-    defaults to false.
+    defaults to true.
 
     When running dom0 in PVH mode the dom0 kernel has no way to map MMIO
     regions into its physical memory map, such mode relies on Xen dom0 builder
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index f3aae158e9f8..bb1bb03ac4e9 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -165,7 +165,7 @@ void hvmemul_cancel(struct vcpu *v)
     hvmemul_cache_disable(v);
 }
 
-bool __ro_after_init opt_dom0_pf_fixup;
+bool __ro_after_init opt_dom0_pf_fixup = true;
 static int hwdom_fixup_p2m(paddr_t addr)
 {
     unsigned long gfn = paddr_to_pfn(addr);
-- 
2.53.0


