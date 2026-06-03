Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sCbSBD5+IGor4QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:19:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EF463ACB9
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:19:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="XRFpkV/c";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327044.1592254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUr7O-0001Y1-Cg; Wed, 03 Jun 2026 19:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327044.1592254; Wed, 03 Jun 2026 19:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUr7O-0001V8-9G; Wed, 03 Jun 2026 19:19:10 +0000
Received: by outflank-mailman (input) for mailman id 1327044;
 Wed, 03 Jun 2026 19:19:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUr7M-0001Tw-Mx
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:19:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUr7M-00Gsxh-3c
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:19:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a207e26-5cb7-0a2a0a5109dd-0a2a4509b786-8
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:19:08 +0200
Received: from [52.101.53.11]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a207e2a-2497-0a2a45090019-3465350b80a9-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:19:07 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7094.namprd03.prod.outlook.com (2603:10b6:a03:4ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:19:03 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 19:19:03 +0000
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
 b=OD7XmglC3P6kS853OTtrSpjJ8lyV8HhvdgPAbj08epprZw+oaI+fowBuR/CBl0P490pSe2Abh4XBATEaaQ1qxsqGZhAYDx2o4KleUFBum0A3HPI9f7efBTyOik2RBWFMcAG9/mS6poWYqLm0E30m+SUoyFBuWT0WvV2IO0OIvXHSr9OvBu40WwbbVeprP8AoKwlZjXJtJtP9ahXpdXtS+7JrsdDGVI4/aANfQLfafaqnzssfgFy0XWcaRoFUhhOqWkAE5cLu16yf8fMhTu5FCIQcev9JqMo8M17TVpska7rV48eQx4DDZAccANPkhSOTVbyEcB3Kuho1jE6eGvRUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIp3eQ8U9IHMHb2OBI91GP/BpRgkqybmO025NwKTRr4=;
 b=o/yFym/1QF1nG/ZS48rDjH5Xp7aS/PHd0LgIifyljMDME2Jppjl0y7LR+dIjuIJqQrrTw5ASYUP9/nHv0MePYJoy3sU68VZQzdEgHJREaAMIIG8XizvX2jkE/mfWY7iuNcosh+IGc4FadScnD6Igp1GlCmqHaVQ2pHVl2W7McOIi/sGDw4VzI6UnfStQYxVYxBA6GfLCjiqN7Q52/1ZN4W648arZoisd0onwiHgmQpOfX3tuYyJAtEzJoJ8JT6noq7K27eClkmd9fhoUMfo//SmD3Cwox5iJhBPziUFzhhfqE6wAKyZzkw/Dfm39MA4+LnqnXZ3TBr9rvH5YATUHfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIp3eQ8U9IHMHb2OBI91GP/BpRgkqybmO025NwKTRr4=;
 b=XRFpkV/cmVWQBxAKbOFwr/b8qhnqW5S8B084ZEV2iZVp5TVriWVioxHro9Hud4XqM1jFLH45qgxO8R0sImsEKHPpHZrf6jiuiyOFX+QfBXx+3H5gE0KexX0Qe7rbIyiqkM6OvBrAqcUCON50aFK5hMCPUm4nk23a7eCVn91y/Bk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH for-4.22 v2 2/5] tools/macros: adjust ROUNDUP() interface to match hypervisor
Date: Wed,  3 Jun 2026 21:18:33 +0200
Message-ID: <20260603191836.77955-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603191836.77955-1-roger.pau@citrix.com>
References: <20260603191836.77955-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:408:e4::32) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: f47b0da4-0b3b-4984-a3b7-08dec1a4f8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|18002099003|22082099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	GyQUDYJCWSds0MRF+LA1qgBftfEjbaCHhxZAPgSdQchcHtJjbOGWaVaOLkeuj4asYZ12aS7IMoW34IjJZX7DkDfkJb87kP2Y8CiG0fO5XSY2ygU433v2uNaeWxOxO1IIAp7JC1KDnen7VLWV43L9vDV/L3JFvqj+6+3bzuEjjqAOSbkbVc7uU+uHv6OSY4/p5DEibWUW6KjJxjLg+7S4/5Wt29703niyjRqhd5slzdPJdC0YqrfPQpunoXHXW/1uUJcSDGh3Mzf47BstVjOGCTN2uCoGJhAUUcmBwanreYmr+2tL+PkL4LpmVpBChGgBPu8CCAEl0iVLinQ4nm+Giw08Bn14aXjY1L3TNWPaD5BdwCNNMOQATNQov/ftVo6sigGYJXxbBBK7/CKThRmWZj6FLu6ymcwKeGjys4qsnz6amfAxTpsUR8OHknDXXhkikkj1HXduy6EzZnvUNiGy46ijbfGZYu/ctwV+B6bF0RbUQ4R6yHPU5/teH+SB4dlJbtFQBb4vrA5juYq4kFaGbCw51R8S146VUFiB62CTzJyJ2RAOEbUBXa+0c+EzxE9YtSeQguYtAVlp8bbUjUdOA5EueMfG0tDoZsTPE1+FoKYHBXAFOYR1KoC20eRQB4gtv5fgCQ9UYiTZQnsuG9FzXxq538nYKuqCSFoOI2eLy2zWsyXzPK423lblaDhyBPkw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(18002099003)(22082099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2lkU05rNnQrYXhlbUloV0ZPUFYrUVJLRHFacE1mZDFqbFIrNFdCRC9CZTdx?=
 =?utf-8?B?QWR2QVpDVUxoeUtiNk9tSlhBYnJMSmdLSVhweHVRMFYxN3NxQW1BL1FLVGJv?=
 =?utf-8?B?RUVEL3BmRUpXbkFVdFV1RndENWUwVGFGNUNyK3I5bmlxQUgrb0tGcXJheFB0?=
 =?utf-8?B?MWxUYzVIZnFSZ0JramN5MWpOQXJNU3M1c0lhcVFwWUpWLzV4Yk5sY3BMNFlz?=
 =?utf-8?B?UDdoQXJZOHMxMWNsN21zSWdkQnozdStOQzZYUUtXandBV1JDWVQrS203amha?=
 =?utf-8?B?QW0xekdSbmRsWWcwaUVKTXFjNUFyaFRjNjRMT0MzVUh2a0t4RGdBeU1reVlj?=
 =?utf-8?B?WXBDMCswTWhnakhOQmtQTFkvZTNtNUxvUFcwU1o2Vi9xVTF6UUFSbFVXbloz?=
 =?utf-8?B?VzZRQ3RlUlFLbk9kWm5SS0FaRm40K01pUWdNeFNTMEUwNGlUR1FSS1ZPWjNK?=
 =?utf-8?B?Uk9Wc29yeklKbndjRlhwK3lTWXRZWWxUODZpc3B5VW1vS1NYNTRVUXFlZ2h1?=
 =?utf-8?B?bmZITTh2c2l6bUh0czlvREkzcGNUSTdGL1ZDREs4U0ZGMk9VQmEyK25jL0c3?=
 =?utf-8?B?M21OZzVaVklaMmpqVmZIa3p6Mkhid0NtTk5kVFhXeW9ZMkV3OHNxdUZKMVR2?=
 =?utf-8?B?L0dibG5WQXJwSUpXNDhoSm00OTJzTnYxV0wrTSs3YytKc0NzMEowN0dRSWhD?=
 =?utf-8?B?NXZhTVpMY29tQzlrZk4zVGRaNmNIWGhjQ3puQ1c4WWFGLzBiSCtMRXRxOXNC?=
 =?utf-8?B?R2pqU3JtQlVTUmI1cCtWZmJWK3JZMHY5YnVsb25oLzVkcmE5MVZDVEFOWmtT?=
 =?utf-8?B?K291dXVaOHBabU9IWWZ5QnBPenRDRDZPMkl6K1pkNXBsSmNoOW9qT2xEV29I?=
 =?utf-8?B?bkJLR3dKWUZZR05ZZm1HNnowQUhXNEh3OGVPT0hmSmtLY1NYamZZOUZsMXIr?=
 =?utf-8?B?RXNtVyt1V01zVEpqbkpwamVqL2wxT2ZzelBCdGVWenlSNnNxM0Q2c0RFNzZ2?=
 =?utf-8?B?cGtFQ1dtMlU0Z1NTVG8rV01mMUczTk81Mk1NL3hCYTM5bFdZQ2hKR0F3TXVR?=
 =?utf-8?B?dWFUVkVueU1WUlgvMFc0WVFvOWtGQk5QUGhvWWcrQjlQRFpLc1V1RHRueFpV?=
 =?utf-8?B?RFlBSzVXM2dLcEl4QlFMZTFOMHNHRmNXUFJxVXFTdW5tTHllS3NwN1pad2lY?=
 =?utf-8?B?TmtXL1NWUmYzRHFGVFkzZFI1ekhTWW1qRE1oenpLOXpmblRsbFVVQlZ6V0w2?=
 =?utf-8?B?Szlxd2swdmFjZTlZcWVBc3dXTnBaMGpDQnp3U0NvcGR0Zk4yVXBENnBtVnY1?=
 =?utf-8?B?UkcwTytQNDk1UHErRlVnbVNKSjlTUzhBeGNPNzdjZFJGVmRGUUFZZ0trOW52?=
 =?utf-8?B?REFHNVN5Y2U0UU9nYkJvQ0RGdFc5aDNVVnZYS09mbmhEaGs2ams4Q0JSakM0?=
 =?utf-8?B?bW5uL2x6WHVDT0s4c2pEZzZNeVUzQWxERTdRdnUzVkp5SHMvWUlhejRLUEV3?=
 =?utf-8?B?eUc3MU5PR2V0VVYrTVYxWkZIT1J1cDlLQlMzT1B0S2NvSU9YeXRyY2VpZW5G?=
 =?utf-8?B?cWt2cEFhelBtQklRdUdLbzhvZjVaaW9Mc1VBTnVrcHovZGg3a3E1ZU1DTTho?=
 =?utf-8?B?UWs3d0JuTXVTb1ZpTkgwajYybmJSMmtaUlp3V3ZPMDBoc1FZbDhQaUxXd25n?=
 =?utf-8?B?UE0yZm5KckxWWjNGeEU4RjZLRCtkQUpEaGN1aGd3Z1lRNSs3MmxrYTQ3Yjdh?=
 =?utf-8?B?MC84NUpCYjlIUUthTWIzUnY5QWxrWkhNaCtsYzN0RVJkZmMwa05CQTFkYjNl?=
 =?utf-8?B?M0xrTVk4aFg5RmxCS0krcFMrL0NoUURqNThVc2lvWVd6UHovczQ3VDcwWXlv?=
 =?utf-8?B?TCszZys3emJSYkNoc0FWNnpZVjAySHZqajdxQ25CQUVjYzhVZTFLRmJNekhx?=
 =?utf-8?B?cnZYOTNjaGkxMC9GMEpnOC9xamRCYlI1bXBuMUtieHFtRlE1UkNhTmN1cDda?=
 =?utf-8?B?REF3M0pYOXZEWnJpRTBUT2s3S2h5dGVDNmc3OVV1djh6bXZ1dk1MYmRzbmQ2?=
 =?utf-8?B?ZFBpbU8ySmFNbVJLdGpscWYvUDg3ZmRRQnFmS08wT3EzczFOVnVZaWF0UTRh?=
 =?utf-8?B?bjk0WmxlcGxDN2dVTlpUR2xzcG5DZFB6MVI0Rm1mNWg4OGtySEFBdnZNdkJK?=
 =?utf-8?B?QzFjQTdWa0ZUK0tIMFRxbUVEbFBxbWRlWTVVSEVuZ1E1R0pOTjBSdll4cVJu?=
 =?utf-8?B?bEQ2eEtJMjJSbUNRancrRDROUjhxekNHeHVUcWQ5WHhuSHRRM0RZdjRXTURO?=
 =?utf-8?B?RGlkT21EeVp3ZkpxRHNNaW1pUHNUdnZqZllNaDVMd2o4eVlFcjMwdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f47b0da4-0b3b-4984-a3b7-08dec1a4f8f9
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:19:03.0862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUmSzYo3S4EhuPd4ZsPP1QC0glnZ110MJv2GTqtqTkZFJUFtzIXH2SVdhK78XcowKZuzYUBaB5oCo3iXN64nAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7094
X-purgate-ID: tlsNG-bad1c0/1780514348-4216DA53-6D54EDB6/0/0
X-purgate-type: clean
X-purgate-size: 19730
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:julien@xen.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70EF463ACB9

Adjust user-space callers to use the new interface.  No functional change
intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/console/daemon/io.c                 |  2 +-
 tools/include/xen-tools/common-macros.h   |  4 +---
 tools/libs/call/buffer.c                  |  3 ++-
 tools/libs/foreignmemory/linux.c          |  2 +-
 tools/libs/gnttab/freebsd.c               |  2 +-
 tools/libs/gnttab/linux.c                 |  2 +-
 tools/libs/guest/xg_core.c                |  2 +-
 tools/libs/guest/xg_dom_arm.c             |  6 +++---
 tools/libs/guest/xg_dom_x86.c             |  2 +-
 tools/libs/guest/xg_private.h             |  4 ++--
 tools/libs/guest/xg_sr_common.c           |  6 +++---
 tools/libs/guest/xg_sr_stream_format.h    |  2 +-
 tools/libs/light/libxl_arm_acpi.c         | 24 +++++++++++------------
 tools/libs/light/libxl_create.c           |  2 +-
 tools/libs/light/libxl_sr_stream_format.h |  2 +-
 tools/libs/light/libxl_stream_read.c      |  2 +-
 tools/libs/light/libxl_stream_write.c     |  4 ++--
 tools/misc/xen-mfndump.c                  |  2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c       |  2 +-
 tools/xenstored/core.c                    |  4 ++--
 tools/xenstored/domain.c                  |  9 +++++----
 tools/xenstored/watch.c                   |  2 +-
 22 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index 43d4973c247c..b6c46d11dea7 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -1233,7 +1233,7 @@ static int set_fds(int fd, short events)
 		/* Round up to 2^8 boundary, in practice this just
 		 * make newsize larger than current_array_size.
 		 */
-		newsize = ROUNDUP(nr_fds + 1, 8);
+		newsize = ROUNDUP(nr_fds + 1, 1U << 8);
 
 		new_fds = realloc(fds, sizeof(struct pollfd)*newsize);
 		if (!new_fds)
diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 9838a108aaea..9e2799178235 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -68,9 +68,7 @@
     })
 #endif
 
-#ifndef ROUNDUP
-#define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
-#endif
+#define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
 
 #define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
 #define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
diff --git a/tools/libs/call/buffer.c b/tools/libs/call/buffer.c
index 2579b8c71986..155e4f9d43eb 100644
--- a/tools/libs/call/buffer.c
+++ b/tools/libs/call/buffer.c
@@ -155,7 +155,8 @@ struct allocation_header {
 
 void *xencall_alloc_buffer(xencall_handle *xcall, size_t size)
 {
-    size_t actual_size = ROUNDUP(size + sizeof(struct allocation_header), PAGE_SHIFT);
+    size_t actual_size = ROUNDUP(size + sizeof(struct allocation_header),
+                                 PAGE_SIZE);
     int nr_pages = actual_size >> PAGE_SHIFT;
     struct allocation_header *hdr;
 
diff --git a/tools/libs/foreignmemory/linux.c b/tools/libs/foreignmemory/linux.c
index 12f959765abd..6d2f30cdf1b6 100644
--- a/tools/libs/foreignmemory/linux.c
+++ b/tools/libs/foreignmemory/linux.c
@@ -198,7 +198,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
          */
         privcmd_mmapbatch_t ioctlx;
         xen_pfn_t *pfn;
-        unsigned int pfn_arr_size = ROUNDUP((num * sizeof(*pfn)), XC_PAGE_SHIFT);
+        unsigned int pfn_arr_size = ROUNDUP(num * sizeof(*pfn), XC_PAGE_SIZE);
         int os_page_size = sysconf(_SC_PAGESIZE);
 
         if ( pfn_arr_size <= os_page_size )
diff --git a/tools/libs/gnttab/freebsd.c b/tools/libs/gnttab/freebsd.c
index d69d928a165e..801274478217 100644
--- a/tools/libs/gnttab/freebsd.c
+++ b/tools/libs/gnttab/freebsd.c
@@ -74,7 +74,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     int domids_stride;
     unsigned int refs_size = ROUNDUP(count *
                                      sizeof(struct ioctl_gntdev_grant_ref),
-                                     XC_PAGE_SHIFT);
+                                     XC_PAGE_SIZE);
     int os_page_size = getpagesize();
 
     domids_stride = (flags & XENGNTTAB_GRANT_MAP_SINGLE_DOMAIN) ? 0 : 1;
diff --git a/tools/libs/gnttab/linux.c b/tools/libs/gnttab/linux.c
index 7286c1d4fe83..829877e64baa 100644
--- a/tools/libs/gnttab/linux.c
+++ b/tools/libs/gnttab/linux.c
@@ -101,7 +101,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
         map = alloca(map_size);
     else
     {
-        map_size = ROUNDUP(map_size, XC_PAGE_SHIFT);
+        map_size = ROUNDUP(map_size, XC_PAGE_SIZE);
         map = mmap(NULL, map_size, PROT_READ | PROT_WRITE,
                    MAP_PRIVATE | MAP_ANON | MAP_POPULATE, -1, 0);
         if ( map == MAP_FAILED )
diff --git a/tools/libs/guest/xg_core.c b/tools/libs/guest/xg_core.c
index f83436d6cbf8..d3640f0ef891 100644
--- a/tools/libs/guest/xg_core.c
+++ b/tools/libs/guest/xg_core.c
@@ -696,7 +696,7 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
     for ( i = 1; i < sheaders->num; i++ )
         sheaders->shdrs[i].sh_offset += fixup;
     offset += fixup;
-    dummy_len = ROUNDUP(offset, PAGE_SHIFT) - offset; /* padding length */
+    dummy_len = ROUNDUP(offset, PAGE_SIZE) - offset; /* padding length */
     offset += dummy_len;
 
     /* pages */
diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index c8d091850622..739ec1c33837 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -364,12 +364,12 @@ static int meminit(struct xc_dom_image *dom)
 
     /* Convenient */
     const uint64_t kernbase = dom->kernel_seg.vstart;
-    const uint64_t kernend = ROUNDUP(dom->kernel_seg.vend, 21/*2MB*/);
+    const uint64_t kernend = ROUNDUP(dom->kernel_seg.vend, MB(2));
     const uint64_t kernsize = kernend - kernbase;
     const uint64_t dtb_size = dom->devicetree_blob ?
-        ROUNDUP(dom->devicetree_size, XC_PAGE_SHIFT) : 0;
+        ROUNDUP(dom->devicetree_size, XC_PAGE_SIZE) : 0;
     const uint64_t ramdisk_size = dom->modules[0].blob ?
-        ROUNDUP(dom->modules[0].size, XC_PAGE_SHIFT) : 0;
+        ROUNDUP(dom->modules[0].size, XC_PAGE_SIZE) : 0;
     const uint64_t modsize = dtb_size + ramdisk_size;
     const uint64_t ram128mb = bankbase[0] + (128<<20);
 
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index 268936efe25b..9af83535944a 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -678,7 +678,7 @@ static int alloc_magic_pages_hvm(struct xc_dom_image *dom)
     {
         if ( dom->cmdline )
         {
-            dom->cmdline_size = ROUNDUP(strlen(dom->cmdline) + 1, 3);
+            dom->cmdline_size = ROUNDUP(strlen(dom->cmdline) + 1, 1U << 3);
             start_info_size += dom->cmdline_size;
         }
     }
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index 285229cf82a3..31a79bccf75e 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -135,7 +135,7 @@ typedef uint64_t x86_pgentry_t;
 #define PAGE_SIZE_X86           (1UL << PAGE_SHIFT_X86)
 #define PAGE_MASK_X86           (~(PAGE_SIZE_X86-1))
 
-#define NRPAGES(x) (ROUNDUP(x, PAGE_SHIFT) >> PAGE_SHIFT)
+#define NRPAGES(x) (ROUNDUP(x, PAGE_SIZE) >> PAGE_SHIFT)
 
 static inline xen_pfn_t xc_pfn_to_mfn(xen_pfn_t pfn, xen_pfn_t *p2m,
                                       unsigned gwidth)
@@ -167,7 +167,7 @@ int pin_table(xc_interface *xch, unsigned int type, unsigned long mfn,
  */
 #define M2P_SHIFT       L2_PAGETABLE_SHIFT_PAE
 #define M2P_CHUNK_SIZE  (1 << M2P_SHIFT)
-#define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
+#define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_CHUNK_SIZE)
 #define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
 
 #if defined(__x86_64__) || defined(__i386__)
diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 7ccdc3b1f6aa..54dde924a7c0 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -56,11 +56,11 @@ const char *rec_type_to_str(uint32_t type)
 int write_split_record(struct xc_sr_context *ctx, struct xc_sr_record *rec,
                        void *buf, size_t sz)
 {
-    static const char zeroes[(1u << REC_ALIGN_ORDER) - 1] = { 0 };
+    static const char zeroes[REC_ALIGN - 1] = { 0 };
 
     xc_interface *xch = ctx->xch;
     typeof(rec->length) combined_length = rec->length + sz;
-    size_t record_length = ROUNDUP(combined_length, REC_ALIGN_ORDER);
+    size_t record_length = ROUNDUP(combined_length, REC_ALIGN);
     struct iovec parts[] = {
         { &rec->type,       sizeof(rec->type) },
         { &combined_length, sizeof(combined_length) },
@@ -110,7 +110,7 @@ int read_record(struct xc_sr_context *ctx, int fd, struct xc_sr_record *rec)
         return -1;
     }
 
-    datasz = ROUNDUP(rhdr.length, REC_ALIGN_ORDER);
+    datasz = ROUNDUP(rhdr.length, REC_ALIGN);
 
     if ( datasz )
     {
diff --git a/tools/libs/guest/xg_sr_stream_format.h b/tools/libs/guest/xg_sr_stream_format.h
index 8a0da26f7543..4310f4311e65 100644
--- a/tools/libs/guest/xg_sr_stream_format.h
+++ b/tools/libs/guest/xg_sr_stream_format.h
@@ -53,7 +53,7 @@ struct xc_sr_rhdr
 };
 
 /* All records must be aligned up to an 8 octet boundary */
-#define REC_ALIGN_ORDER               (3U)
+#define REC_ALIGN                     (1U << 3)
 /* Somewhat arbitrary - 128MB */
 #define REC_LENGTH_MAX                (128U << 20)
 
diff --git a/tools/libs/light/libxl_arm_acpi.c b/tools/libs/light/libxl_arm_acpi.c
index ba874c3d3224..ac8165de15b6 100644
--- a/tools/libs/light/libxl_arm_acpi.c
+++ b/tools/libs/light/libxl_arm_acpi.c
@@ -107,12 +107,12 @@ int libxl__get_acpi_size(libxl__gc *gc,
     if (rc < 0)
         goto out;
 
-    *out = ROUNDUP(size, 3) +
-           ROUNDUP(sizeof(struct acpi_table_rsdp), 3) +
-           ROUNDUP(sizeof(struct acpi_table_xsdt), 3) +
-           ROUNDUP(sizeof(struct acpi_table_gtdt), 3) +
-           ROUNDUP(sizeof(struct acpi_table_fadt), 3) +
-           ROUNDUP(sizeof(dsdt_anycpu_arm_len), 3);
+    *out = ROUNDUP(size, 1U << 3) +
+           ROUNDUP(sizeof(struct acpi_table_rsdp), 1U << 3) +
+           ROUNDUP(sizeof(struct acpi_table_xsdt), 1U << 3) +
+           ROUNDUP(sizeof(struct acpi_table_gtdt), 1U << 3) +
+           ROUNDUP(sizeof(struct acpi_table_fadt), 1U << 3) +
+           ROUNDUP(sizeof(dsdt_anycpu_arm_len), 1U << 3);
 
 out:
     return rc;
@@ -128,7 +128,7 @@ static int libxl__allocate_acpi_tables(libxl__gc *gc,
 
     acpitables[RSDP].addr = GUEST_ACPI_BASE;
     acpitables[RSDP].size = sizeof(struct acpi_table_rsdp);
-    dom->acpi_modules[0].length += ROUNDUP(acpitables[RSDP].size, 3);
+    dom->acpi_modules[0].length += ROUNDUP(acpitables[RSDP].size, 1U << 3);
 
     acpitables[XSDT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
     /*
@@ -137,11 +137,11 @@ static int libxl__allocate_acpi_tables(libxl__gc *gc,
      */
     acpitables[XSDT].size = sizeof(struct acpi_table_xsdt) +
                             sizeof(uint64_t) * 2;
-    dom->acpi_modules[0].length += ROUNDUP(acpitables[XSDT].size, 3);
+    dom->acpi_modules[0].length += ROUNDUP(acpitables[XSDT].size, 1U << 3);
 
     acpitables[GTDT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
     acpitables[GTDT].size = sizeof(struct acpi_table_gtdt);
-    dom->acpi_modules[0].length += ROUNDUP(acpitables[GTDT].size, 3);
+    dom->acpi_modules[0].length += ROUNDUP(acpitables[GTDT].size, 1U << 3);
 
     acpitables[MADT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
 
@@ -150,15 +150,15 @@ static int libxl__allocate_acpi_tables(libxl__gc *gc,
         goto out;
 
     acpitables[MADT].size = size;
-    dom->acpi_modules[0].length += ROUNDUP(acpitables[MADT].size, 3);
+    dom->acpi_modules[0].length += ROUNDUP(acpitables[MADT].size, 1U << 3);
 
     acpitables[FADT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
     acpitables[FADT].size = sizeof(struct acpi_table_fadt);
-    dom->acpi_modules[0].length += ROUNDUP(acpitables[FADT].size, 3);
+    dom->acpi_modules[0].length += ROUNDUP(acpitables[FADT].size, 1U << 3);
 
     acpitables[DSDT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
     acpitables[DSDT].size = dsdt_anycpu_arm_len;
-    dom->acpi_modules[0].length += ROUNDUP(acpitables[DSDT].size, 3);
+    dom->acpi_modules[0].length += ROUNDUP(acpitables[DSDT].size, 1U << 3);
 
     assert(dom->acpi_modules[0].length <= GUEST_ACPI_SIZE);
     dom->acpi_modules[0].data = libxl__zalloc(gc, dom->acpi_modules[0].length);
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 6fd62d140389..a8b0c8c50070 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -600,7 +600,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
                 .opts = 0, /* .opts will be set below */
                 .nr = b_info->altp2m_count,
             },
-            .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
+            .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SIZE),
             .cpupool_id = info->poolid,
         };
 
diff --git a/tools/libs/light/libxl_sr_stream_format.h b/tools/libs/light/libxl_sr_stream_format.h
index f8f4723c2e91..b02c954a388e 100644
--- a/tools/libs/light/libxl_sr_stream_format.h
+++ b/tools/libs/light/libxl_sr_stream_format.h
@@ -29,7 +29,7 @@ typedef struct libxl__sr_rec_hdr
 } libxl__sr_rec_hdr;
 
 /* All records must be aligned up to an 8 octet boundary */
-#define REC_ALIGN_ORDER              3U
+#define REC_ALIGN                    (1U << 3)
 
 #define REC_TYPE_END                    0x00000000U
 #define REC_TYPE_LIBXC_CONTEXT          0x00000001U
diff --git a/tools/libs/light/libxl_stream_read.c b/tools/libs/light/libxl_stream_read.c
index e64e8f0eadec..99c7607b6c54 100644
--- a/tools/libs/light/libxl_stream_read.c
+++ b/tools/libs/light/libxl_stream_read.c
@@ -511,7 +511,7 @@ static void record_header_done(libxl__egc *egc,
         return;
     }
 
-    size_t bytes_to_read = ROUNDUP(rec->hdr.length, REC_ALIGN_ORDER);
+    size_t bytes_to_read = ROUNDUP(rec->hdr.length, REC_ALIGN);
     rec->body = libxl__malloc(NOGC, bytes_to_read);
 
     rc = setup_read(stream, "record body",
diff --git a/tools/libs/light/libxl_stream_write.c b/tools/libs/light/libxl_stream_write.c
index 98d44597a732..9ea64369352f 100644
--- a/tools/libs/light/libxl_stream_write.c
+++ b/tools/libs/light/libxl_stream_write.c
@@ -119,7 +119,7 @@ static void setup_generic_write(libxl__egc *egc,
                                 void *body,
                                 sws_record_done_cb cb)
 {
-    static const uint8_t zero_padding[1U << REC_ALIGN_ORDER] = { 0 };
+    static const uint8_t zero_padding[REC_ALIGN] = { 0 };
 
     libxl__datacopier_state *dc = &stream->dc;
     int rc;
@@ -136,7 +136,7 @@ static void setup_generic_write(libxl__egc *egc,
         return;
     }
 
-    size_t padsz = ROUNDUP(hdr->length, REC_ALIGN_ORDER) - hdr->length;
+    size_t padsz = ROUNDUP(hdr->length, REC_ALIGN) - hdr->length;
     uint32_t length = hdr->length;
 
     /* Insert header */
diff --git a/tools/misc/xen-mfndump.c b/tools/misc/xen-mfndump.c
index 28687afbf01a..99a0b1d3b5c0 100644
--- a/tools/misc/xen-mfndump.c
+++ b/tools/misc/xen-mfndump.c
@@ -10,7 +10,7 @@
 
 #include <xen-tools/common-macros.h>
 
-#define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), 21)
+#define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), MB(2))
 #define is_mapped(pfn_type) (!((pfn_type) & 0x80000000UL))
 
 #define ERROR(msg, args...) fprintf(stderr, msg, ## args)
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index c55f73b265b2..7f6381cdd2fe 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -221,7 +221,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 	if ( altp2m_nr != (uint16_t)altp2m_nr )
 		caml_invalid_argument("altp2m_count");
 
-	vmtrace_size = ROUNDUP(vmtrace_size << 10, XC_PAGE_SHIFT);
+	vmtrace_size = ROUNDUP(vmtrace_size << 10, XC_PAGE_SIZE);
 	if ( vmtrace_size != (uint32_t)vmtrace_size )
 		caml_invalid_argument("vmtrace_buf_kb");
 
diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index d6d462b7bc82..86c86b3e9a77 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -466,7 +466,7 @@ int set_fd(int fd, short events)
 		/* Round up to 2^8 boundary, in practice this just
 		 * make newsize larger than current_array_size.
 		 */
-		newsize = ROUNDUP(nr_fds + 1, 8);
+		newsize = ROUNDUP(nr_fds + 1, 1U << 8);
 
 		new_fds = realloc(poll_fds, sizeof(struct pollfd)*newsize);
 		if (!new_fds)
@@ -3067,7 +3067,7 @@ static int dump_state_node(const void *ctx, struct connection *conn,
 	head.length += node->hdr.num_perms * sizeof(*sn.perms);
 	head.length += pathlen;
 	head.length += node->hdr.datalen;
-	head.length = ROUNDUP(head.length, 3);
+	head.length = ROUNDUP(head.length, 1U << 3);
 
 	if (fwrite(&head, sizeof(head), 1, fp) != 1)
 		return dump_state_node_err(data, "Dump node head error");
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 2db452144dd4..a880ff678ef9 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -2159,7 +2159,7 @@ const char *dump_state_connections(FILE *fp)
 		if (ret)
 			return ret;
 		head.length += sc.data_in_len + sc.data_out_len;
-		head.length = ROUNDUP(head.length, 3);
+		head.length = ROUNDUP(head.length, 1U << 3);
 		if (c->domain) {
 			sc.fields |= XS_STATE_CONN_FIELDS_UNIQ_ID;
 			head.length += sizeof(uint64_t);
@@ -2232,7 +2232,8 @@ void read_state_connection(const void *ctx, const void *state)
 		unsigned long off;
 
 		off = sizeof(*sc) + sc->data_in_len + sc->data_out_len;
-		domain->unique_id = *(uint64_t *)(state + ROUNDUP(off, 3));
+		domain->unique_id =
+		    *(uint64_t *)(state + ROUNDUP(off, 1U << 3));
 	}
 }
 
@@ -2308,7 +2309,7 @@ static int dump_state_domain(const void *k, void *v, void *arg)
 	n_quota = get_quota_size(domain->acc, &rec_len);
 	rec_len += n_quota * sizeof(sd->quota_val[0]);
 	rec_len += sizeof(*sd);
-	rec_len = ROUNDUP(rec_len, 3);
+	rec_len = ROUNDUP(rec_len, 1U << 3);
 
 	record = talloc_size(NULL, rec_len + sizeof(*head));
 	if (!record)
@@ -2372,7 +2373,7 @@ const char *dump_state_glb_quota(FILE *fp)
 	n_quota = get_quota_size(quotas, &rec_len);
 	rec_len += n_quota * sizeof(glb->quota_val[0]);
 	rec_len += sizeof(*glb);
-	rec_len = ROUNDUP(rec_len, 3);
+	rec_len = ROUNDUP(rec_len, 1U << 3);
 
 	record = talloc_size(NULL, rec_len + sizeof(*head));
 	if (!record)
diff --git a/tools/xenstored/watch.c b/tools/xenstored/watch.c
index a9a06e9e4816..309c5bb66bef 100644
--- a/tools/xenstored/watch.c
+++ b/tools/xenstored/watch.c
@@ -349,7 +349,7 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
 		}
 
 		head.length += path_len + token_len;
-		head.length = ROUNDUP(head.length, 3);
+		head.length = ROUNDUP(head.length, 1U << 3);
 		if (fwrite(&head, sizeof(head), 1, fp) != 1)
 			return "Dump watch state error";
 
-- 
2.53.0


