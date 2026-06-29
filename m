Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TUZSIxI/QmqZ2gkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 11:46:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE8F6D869D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 11:46:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=s8oCm1wH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347354.1605224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8Zf-00021D-2V; Mon, 29 Jun 2026 09:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347354.1605224; Mon, 29 Jun 2026 09:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8Ze-0001yN-VT; Mon, 29 Jun 2026 09:46:42 +0000
Received: by outflank-mailman (input) for mailman id 1347354;
 Mon, 29 Jun 2026 09:46:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1we8Zd-0001we-DE
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 09:46:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we8Zc-00DxKs-9v
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 11:46:40 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a423ef2-e002-0a2a0a5209dd-0a2a4502dae2-42
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:46:40 +0200
Received: from [40.107.209.16]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a423efe-5a27-0a2a45020019-286bd110c41b-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:46:39 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5141.namprd03.prod.outlook.com (2603:10b6:a03:1e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Mon, 29 Jun
 2026 09:46:36 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 09:46:36 +0000
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
 b=WYxlEIHLy1kNi2j5vYUPDFbXTVkj3SjoeB4tXtj/Z/MhMnjlem9qtNgZMT/xK9SzsOHU76JDOUfp4pHP5RRsoMWycy42dcCM0++IHqOxSUagP7EUl200HEB8BKwE0w9rWelELXnaBUTj1An3452uphoGvat2Flmg//FLvpVd/xWS1tWNxj/mIXeNqM+Gj7Kov5alWce9ehgCn95MSnPKeXfowQ8TO4Ia28RKCKVgjwtpvHApqkSfoCA6prWomVyCisjTNBVd9kzwpAvuzlAvrtXFtAACjn7S5R+bbpovKGg91FEfSm5P6qRauAdu+eUQCOK5/G+qwTlbVlWa4fM9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SB2wbjUvy0R0FHhYbGZoS+Kajo8TUqIXA5aTQJgQCh0=;
 b=mJahms7vTwsFPDowc4jXvzMbU3Usmd3AnBtUpehAO2IifNj2oeqC1UKOT/+RqJZ+lnZmbVisNpjpevPvJDiT+tSkDoMs89xCfiidGSivOTHUzv//gaBTsVf37cyZVG1nJfAXRusnJ+HsQwbPaSIiaLUJCarrxoDS7OJzrA/dJoP4hKwcprVpzJFxXfdg0lY4hlBhjPrjsZKOrBKHMATpE7Uc7Y/OaXSdoXq9yaupPdNqi6OqWutUJEBtwHOornvJRvMqRvJImHPTVAeDVWjOHrWqJ1NUex9wfyzX70THkXvW8F/jA37Upn7lUq2I2/+GLVtZ0u5UL/RUdulgSNbf5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SB2wbjUvy0R0FHhYbGZoS+Kajo8TUqIXA5aTQJgQCh0=;
 b=s8oCm1wH8ChoVHD+RSfo83RvY1V4VyaiqZg/o3g4x9ZQqz3vcttg+MeC1hOZAWKOmBh7Ns1aFhR5TbU18RITh8eAPSEUoIttzWDTYGNOXmIUiSumRMc/iv4U3TsZCRM9KH9KP5DgaMzzPfNuIED7ZOC1eEln6hi4sDo/ejbCBZU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.22 v2 2/4] xen/ppc: introduce a dummy irq_to_desc()
Date: Mon, 29 Jun 2026 11:45:29 +0200
Message-ID: <20260629094531.55555-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629094531.55555-1-roger.pau@citrix.com>
References: <20260629094531.55555-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0083.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::23) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 0016a1d9-9cab-43c8-2a65-08ded5c34faf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	+U7PQEjOHWPPqMRDNitsR+JI6+WGrlX5amAqE0dJtuPaqotbV/rsfOjq4XbZhQeYxz8rZFYgVHmyOfWVA3CJkaCuYqsWiQfD/tkZhavH/ONIHXLWppgxUP6G5EZR66AfHGM+BLi34wCwroIMmqU1HmcNvnklpGAVZVfuC+4S5IPTp9lF+zD6pJwWUS91qdd8k0ERqJ47xEPkD6/RUILmijVN69v5+GIm5rIcmuIpVJy8sVioVNWM3XoFIqDGucrQNHAbjFdicPbmcXZQFBbXew5VSq3covYKyAMQ000j9oJc07064S5bRHKybExUBk2/pU7yK/On+oP9IsfZB623zR4W8Lh5G/H/uYULa3X0u9Rntm04wnabgOlq7NEerYk9h+MHUuS0OaVwjN6S5yg+UIUmZ0ARj44EAt8fcSnvdWQyOIdwncbMxB6C8mma9/3kQ4jqzrhRy8/Oy3QOC98BWsU9gITePodSiN3ZTfW9uX6yIWf6QM0UK717QgC5e8xgY8G+sSbCRbRumgnzkVhQRVCmyI0PLcMXIQT+lhPID2LPFgKctAS7zrPS/hmrhMDggtuCR4lrjrsnNDrSSF0q3dT9fwUVHNf+n+U1yv27PETCyaOHYtAXUpe3oaL1CGt36YXiQKfqCZ6XcuHGEXxOwbHDc4FyIflUa2Cjn9WXCnM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUtyK0RIeTRabTlmNHQ2MitDSmVZU3BJVW5nZjZEM21RMFZ4K3pLZzg4eUs1?=
 =?utf-8?B?Z1d0NFFTTWtiWjNYZnUwZk5jaWVQRGUvTHlYYjBsTE93dldzVFJBTzFLSVly?=
 =?utf-8?B?OVJWa3lCOVZFd3lPTk1YaXRKc2tnZFhFYzFYempkQ2loZ0M1UGFnTWVTWkw1?=
 =?utf-8?B?amVXNE40czRtc3BQSmtIb3A3MERQcCtpU2VJeHMxSkZUUkdjMVZNUTc5Z216?=
 =?utf-8?B?YURrbDVISko2Wk5KdTU4RHRJeXQxZFFvT3RyKzhXQmJYeVhpSitzWE5uZkdM?=
 =?utf-8?B?clBTaGowSy9IM0hyMXdMOHIvL3hBSmtqYTZxNlRDOWtWUGFlN0lXa3NlcmhF?=
 =?utf-8?B?ZDU0bkRISVRHbjFwOCttQ0JpVml2eC9JQ0hxczArc0QzRklQN2NGcTlpYjJE?=
 =?utf-8?B?dW5Ydks1M3R4U1dXRkk5Qi92QndtNUlYM3NyVk5tTWxUWmRCSnl2ekpBeUIv?=
 =?utf-8?B?djBLVkNBTG01R0k0OU1vb216U3JqMnNuak5OUEJuUHZpV1JCZFlBcTlHeU9r?=
 =?utf-8?B?cGhTTTQ2UWwxWTRJWktmS0pvSnNjSVJtZkVBYUJFMzliUUc4ZWlmaGREZU04?=
 =?utf-8?B?dGF4NGpVejhWUHRGak1GMmpPMHBsamVweGpQYUV6UXVZZU1GUDVPVWlKaUdU?=
 =?utf-8?B?aUZtQjMyeUxYaVpjbnNUME04K2ZSTzc2Z1RTYzlQTGpQSVZmQzNmeUgwMWcz?=
 =?utf-8?B?eStuNTNnSm5tSHpua3R3ZlNGaTFZTXZuM3hWUUVsbEM3bllISDZxaExjQm0r?=
 =?utf-8?B?SFRqaUNFLzEzVlVOZE1LMERKTVlJa0VoWlBWUGp1a3hGd3JNVGU2VUFLT1ll?=
 =?utf-8?B?RmI5T3NQK0RZSkpiSEwvR1p6M3ErdFhRSmxtVGxJdk12RVZjK3ZnVmptdkYz?=
 =?utf-8?B?UWJUT2piQm9tR1FaZGE4K0hiODB1RUl5bVBObEdmOVBKUmpUWnhWdXp0aTl0?=
 =?utf-8?B?NmFNN3hwSU5IMGxRZCtFQ0VaL1AvN083Zjk1QmdzRzFLNklTTllVMmt3SGYr?=
 =?utf-8?B?SmdoMjVIV1BnQ25xR2dnRS96cHJEM2tzdlROMUNtUG5EMlRDMEJBd21qNHZh?=
 =?utf-8?B?WVdlUXZuVHZjYTVJdndreGhHWU1rSzVmTjFQQ0xHRERVUmJ6WXJxVHdERWta?=
 =?utf-8?B?dUkrb1ZwWTBEbXZqOGZ0S2lpbVFnazJHSVcwcE82N25GMUwxeG9XbldTY2xq?=
 =?utf-8?B?eWZZMkx1Y2planhPUGhjQUVCTmI0dUt5djQ2MGNTZ2pWKzJsTmk0cHc0Q1Va?=
 =?utf-8?B?bDJzVzl0U0VVU1FHbzhEY0ZMMWhFRFF2STh5aTNaampmWWRvWU8zSUs4LzhI?=
 =?utf-8?B?UVNzK21tYWVobVBhUVQxS1N5WFA4TVJDVy9iODVRQ0ZpMi9LZVBjU2VQRFRi?=
 =?utf-8?B?bGFhdlJXQUV1c0RZcEVoSzFDa05MODN5V05BWUx3RU90NlZLUFJlNTFXcUV0?=
 =?utf-8?B?eXc2S0Q2aGFLNloxQ0I2alVRdWNVbS90ZUwwQkcwb25MQkNlZkRHRVNvL3JY?=
 =?utf-8?B?dCtvOFJieHM1NWkwdVY5OEp0M0NRdjU5S21uRW1jNWJqc0g3R256cjVnekpL?=
 =?utf-8?B?TnZWM3NyamFNZmJMNGJad0xXR2FuU3Vsc25CYmxxMkxzMXJOa25lNXovWVRs?=
 =?utf-8?B?VmUzTGoyNkxjSFFJMmNJVWtWSkVzWlJKVGdVZG5CN1dNY0ZjOWJFUTNQUGNt?=
 =?utf-8?B?V283MkU0eXRxd0phWXdGTDMvRFlFaE0rRGFNMDFzbEhkWkh4alBxdU0vcy9F?=
 =?utf-8?B?SU9GTGhsRHVwemxQd1JMY01jQWRrTWUwTGZGd0RxN1dLNGxYbUlnRzIxRUtD?=
 =?utf-8?B?Si9ldDFKQkFFSkszcGd6L3BtVzdhRXphQUVDRkxlUklQOVliTUgzd0Y1c1FJ?=
 =?utf-8?B?cURGa1l4ZnBNN0RySTFuTkNiZ1pUNTQ2bkQ5NDN3Z0ttZlQxNkpIb09OMkE4?=
 =?utf-8?B?QmRnQThSOEd4VjRpSUVoYlJrU0dRR3VzME9YMThJbkE0T0hSSE5kTVRsZVJY?=
 =?utf-8?B?Y1BQU3UxNmRzWHpWWFlFUkxwMHloaHAyWmtLYmw0WWl6amJPYW5NR1kyZW5G?=
 =?utf-8?B?TnZ4dEVmWFhmSlJlOVpSeUpIOEdFdWVoYWsvSXcvSlhSM1hRMDdLMDdaUTRU?=
 =?utf-8?B?YWdEdU1vOWlSQ1FEV0prSVU2UEcreVRhNnlUM24vV2VrVXRINGlMUnNSVTFB?=
 =?utf-8?B?ekRmVVF2SHZubmxwbTQ2VjhkMWYrQWptTktwYmcweWxBaTE3TzV3Z2NmeGF2?=
 =?utf-8?B?Q0kzY1BGRHdRcGZkZkE5Rm9FZTJtNTRsWXRJcDNvaWtnTFBnenNaR0FONVZ4?=
 =?utf-8?B?eEs4UFZicng2aS9UNDNxTGkxYVcvSXpxTjdOa01sS295QUNURGhrQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0016a1d9-9cab-43c8-2a65-08ded5c34faf
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:46:36.7663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgG00QVakSMxOZF1MDPcojunwI+RibR3QVy/qqFhRspEwEipj4/CwoeBvjYKkhFTK4En9LVp8IgG05szUlpucw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5141
X-purgate-ID: tlsNG-720697/1782726399-76D107C5-E9BD08D1/0/0
X-purgate-type: clean
X-purgate-size: 839
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,raptorengineering.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EE8F6D869D

In preparation for irq_to_desc() being called by common IRQ code.
PowerPC doesn't have an irq_desc array defined, so it cannot use the
generic irq_to_desc macro in the common header.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/ppc/include/asm/irq.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/ppc/include/asm/irq.h b/xen/arch/ppc/include/asm/irq.h
index 5c37d0cf2500..fa70fd7d46dc 100644
--- a/xen/arch/ppc/include/asm/irq.h
+++ b/xen/arch/ppc/include/asm/irq.h
@@ -30,4 +30,10 @@ static inline int platform_get_irq(const struct dt_device_node *device, int inde
     BUG_ON("unimplemented");
 }
 
+static inline void *irq_to_desc(unsigned int irq)
+{
+    BUG_ON("unimplemented");
+}
+#define irq_to_desc irq_to_desc
+
 #endif /* __ASM_PPC_IRQ_H__ */
-- 
2.53.0


