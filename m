Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ8eKmqQymlV+AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 17:02:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97A235D5D8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 17:02:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267773.1557265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7E7R-0005dl-76; Mon, 30 Mar 2026 15:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267773.1557265; Mon, 30 Mar 2026 15:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7E7R-0005bR-3c; Mon, 30 Mar 2026 15:01:33 +0000
Received: by outflank-mailman (input) for mailman id 1267773;
 Mon, 30 Mar 2026 15:01:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w7E7P-0005bL-9D
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 15:01:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7E7O-00DIj5-Ap
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 17:01:30 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ca9048-5cb7-0a2a0a5109dd-0a2a450ccbc8-10
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 17:01:30 +0200
Received: from [52.101.53.13]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69ca9048-f93d-0a2a450c0019-3465350d349f-4
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 17:01:29 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH2PR03MB5190.namprd03.prod.outlook.com (2603:10b6:610:91::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 15:01:25 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 15:01:25 +0000
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
 b=tErYHar9ZdfnITDwPNhs7QYVcmW43XWTXci/4yWxLtr4sfLbuWLfKYPjfisdO8rO/VhVboXpD8RAMcL3j5gkWStXyllDqd3+1r9t78L5UAZm32fu6igIehkJSllLjCVVl676xlVFFNyaw0cD7NFv1P8Xxvzf8mnjsI/4s2i74e8vviMlJgo44kQ+wVj5e7638iZjfUpLqbrKOTxBG2zFBlKcbG50LNLezTn5jzBgxrj6yNanb2VS6c67V6bO6GfsPdiqTaDTqrIEQJA4w09AVZrPf7o8G9GKGeLY2eMCPsNq/BT/pmXJqGXYbWWRRXjt9B9i3wQeKWwHgHW+74qgiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/Wpa+dqtxDBbvTgOf3beO0ep55Yd6lsRJJRLt4s6Uw=;
 b=aaWbQO/LUdknWgEGze88TxMW2ulHmaBGK+KD76Ze0pGFCKd2LaKLx3KF4wrY3Y2iE8dep+eDZFACxaPCluvtri1xyQgABAV7vIFvQMrAm86Sm2ikLYIbeBzvTc2zrnvQuRbiQzq8N0nVgRTTnmbzs8APRCNurDQGyFi56HVy+vkj/GajD+Q9vlkHxK29uP2ucJoMl5UqbrAavPv8UWkD0Qzs056ibzak+lWEq38pVG3KTFOyqX6kFQGlDIhXqwzOzLNzedLGi+6EP8XdUWR4dHWu1dGKq95qwDea689mgbMAlsT3gedq4bAjFqzbO10vr7AvoRrAAjJR3mCUefCG4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/Wpa+dqtxDBbvTgOf3beO0ep55Yd6lsRJJRLt4s6Uw=;
 b=ghIaUjKMD0e8kVBEaPDNu9sE21g39yW7sngEt4h/WVQj086HrVII6TZslBW4wzvzq0LCkKQPf61QmzYFYdZ6BeSpEt2ocF2vRD6aNWRWi9k3YzL/BpG0Y3c9L73+iWBRtfWkaMPKplhUIjmM/6Lg5rraDS5rKDYyVpHd8EmE5NQ=
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] xen/mm: improve freeing of partially scrubbed pages
Date: Mon, 30 Mar 2026 17:01:19 +0200
Message-ID: <20260330150119.10546-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0012.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH2PR03MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b616755-ab74-4662-2966-08de8e6d369a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	z9XYZXgrhE84c3x9ZxcU8LjqMKQfpLChOJlqqz4Zfwl6DQzDcmcxjXTDoyoqPNVFLCVGgr03yoD33SRbHmn9jiy+jR56aPet9KqAT/xx8mFb79lzvSNroHj+iUh0SAXokIrPp3dA+MYHalXjhwj1nOWkWzLE9OPlnN+JnMzwG/kxZmStCHhMGQDniK+wbO/DNj3jSv+/9F+lTwTUN5YtWG4AYd5IdY6z+5A34RYXcxRfNIZOU7Oi7gseqSGgJLVGiLy0dl6QJsaHuNZZr+jiLfsApvpK8yCImbbX4FqDGUSGHctZpNbt2e3bn/mQjlsD7Sz5zmDitsxeVNNbqdoOnAhmVGYDO0QU3qrKMoojBIos+k+dcUO8xpGm/MsWitiZFkrLTx2uGAZMaCPNpGbfuGbMGByuu1OTQmMgbvd0VKMSz4BylaDdrUFjQILDZp9xdPv5gItCulia4YiiN9vsntNfASpjhZrjiVWYQs5/owrQCuB5XBh4xuNnP1s/cLIOffHhas65RJoq5fPyioua1Scq4TVanbaIh5BA6VmoL6ym3XIeSMzgkEZla7vgfR9hnqBMyyJvyreAlyHG+E/QrkE4bKAohqF7eqE6ZWYIfch2j5ebwmSUvck4FFyz25juVMdWz+JIK4t7T14z6NnjSMXF41N0AglJ5yuS3IKExqlg49cpuLkEOtR36lvXcwHxB5F8L7KWiubJm2pL+doYI36S5QGZOwihkHzfLMPT894=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGl5TzM4UG14SzViN09hS0lCRjk2dFRwcE8zb0RLVmFtZENabnRHcDJKM3J5?=
 =?utf-8?B?SkhSU2NRWk5JM1Foa0MvbkRPTXl0KzlDTmNiZDN6YWxQWXNvQjVndmdJMnZL?=
 =?utf-8?B?ejFhbXVBekZMQXpRQ3VNQjl0dmUyZ0dZMFNPbUZ3eDU2SEpMcUZwVGxmaTdM?=
 =?utf-8?B?NTBmdDluMDJRNjVHckI2SlduRXl1Q1UxMXFvbUlxRWpWcHorOVhrRE9TUksx?=
 =?utf-8?B?dXJkTDVtQmpuS0lDSDg0OHZCNDl3WWZndm9MN0gwclJEajZ1ZDFPV3VTZm4y?=
 =?utf-8?B?R3Naek5mcHRxd0NROUV4c0NNK2s5ZlhFdDVsTnVVR2NzMGVBWkF6cm82TU4r?=
 =?utf-8?B?TEl1TUFYRUc3OTkzeGRTQk0yOU1LRVRka0dTTzgyUmhEUDNGWFoxdGIzeXBx?=
 =?utf-8?B?N3YzdFI4cHM4aXAzRlA4dHFFUnFsSEIwVjU2UGZjekY5TFhkd0xJdkswNGNu?=
 =?utf-8?B?UzZMK2IrTTlLNGtyZUlyd1VscFhXM2I0a3hSV1czWWhsamUxWGhJNG5icEFp?=
 =?utf-8?B?RUNsQ1Fmb1gwZkVXSUU4ZUFlYURlV1FsaHZTcTRjUm9jakxldG85MU1VaHo1?=
 =?utf-8?B?TGN3WHZ0T2hLdTJsQm03NXdvTGVXLzRRU3NyZytGWExNamxtd1BsVDVPVDFm?=
 =?utf-8?B?a2ErWVJLSExaWUJqcVVjNjUzZ3NsbThxQktPTG15aG5sNWh6WHg2bGhsZ2Ix?=
 =?utf-8?B?U2c0a2dwdjdHa1R1Z29vQUlzbUtsM1dlS0o2MFZPcUYybWpESkpjOWJUTCsv?=
 =?utf-8?B?NnRFM0orQndpbnZnQncva0xuN2JDVUprRXoxRzQ3d3NQanJiVFU2T0lYNGQ5?=
 =?utf-8?B?dUF6WW4zWlIxVWJnSllJVHE2SzNDT2UrNEI0S3JJeG40eE5hdlc2NFBRTlRx?=
 =?utf-8?B?REFYUExqQlM5VDhDMkhXQUo4dzRnSGdlRFVVS2lKYkI1ZDdCVWFCVHlGb2lC?=
 =?utf-8?B?SE54Wk5FQWF4M21kK3RkOEtZVTAxQUFPUTlhSzlET0gyM2MxMUgzTWd2ZkRY?=
 =?utf-8?B?OHh4M3ZVcldPakRkWi8xTW9TYTAyTjJWeHVyMCthTXB1bDgwMUhQeHFWTUhl?=
 =?utf-8?B?MWFOZ2J2MU5wUkVOQzVSUU9rSGxlak5EcUp4RHVuTGExNGZlUmFNM2F4M205?=
 =?utf-8?B?T0s5Z1ZBS1JKY0JxSHNId1lkUFhTQWg5SXZpZnFRbElkeU1rbXprV0w1ZDNP?=
 =?utf-8?B?eVYrL1ZYb0NFempwc1Z6cy9CcXJUN04zcUxraGw5bVl1ejNlWnhXMHppbTU5?=
 =?utf-8?B?c0hHY09odGJpVi9zNEE3eGU5UDFVdVd2Q1RUOHdyeTNSMitqeFhVZVpkQy9w?=
 =?utf-8?B?MG5aUnU0dzhMYnhvY1RMbTdpdW8yeGpOTVhWYTNSb1VRSVFiZk0rWjRaeHox?=
 =?utf-8?B?NDJBVmtMNk5hMWhSWDNEa1VaQzIzRHpHaEUwdkdDcC9uZnRCTFJJZUdJeVZG?=
 =?utf-8?B?QU1XbGFwZkQ4Q1hFczJ6QU1TV01JMzEwS1hESEk3eTViaWpHWWFtN3hRNHlj?=
 =?utf-8?B?alI4Z3dLbGJaVFIyV1lDR1V5REsvMlB3NVpGaXUyVXd1dnJpZkxUMStFc3dZ?=
 =?utf-8?B?S04vMTlmazBIZjhSWlZzeW5SY0R0Y0FrU1dMdGRhWFhGSWRrMTJZRU1kRzZ2?=
 =?utf-8?B?NzV5eTdsTjZTWUhSc29jckg0cVlvRmdlZVYreWc0Rno4QWFUWGkxSjMyUW1P?=
 =?utf-8?B?VE9FejJZMTUwaGtaTlFlZ0FFclJnV052L2R4cjk3YW1DUW1ST0ZTdEJ1VHRr?=
 =?utf-8?B?ZlJheEZBcEd6a0UraHJlZUpXYk9PMkUzSm1SYzl5dldRcE1FTXNDRXgyY3N2?=
 =?utf-8?B?SFRYMW1uRjJVVnoyUkZ3UC9kUzcyWGxYNFVhc0pDSncwQkxsTHNTTVExQWZO?=
 =?utf-8?B?TCt4aWVBdUtxdnJ0YTlRdnNRSnorMkRyUjVQeldEanNWUGF0K3ZVRU5HaHJy?=
 =?utf-8?B?cWJXMU9UeUcvdnNKbWxJeUowb1hjRW0zUzh2VUFXbFpUcG1EaCtZc0NVdHIv?=
 =?utf-8?B?TVY5YW1TdEpORTdiMk9kOStmTVhkVUV5N0RUL0Q1U3VxYXpGR1VJSWNUcEJF?=
 =?utf-8?B?WjEyb0lVYlR6ZjR1MkxpM3NReW15YTFqMUxjNHVYeE42OWF3YzNtZE5JUW5Q?=
 =?utf-8?B?ZFExSFRyTDZvaEM1QkgzRm4zUWl2dC9aaXJKYVkzRjdqQUlPRzBWRmFZejJW?=
 =?utf-8?B?endESkNFWktmbnkzeHpKcGo0V2l6QzZ2ckFSVWI0Z0xwcVpOaVRrSVRoZlFt?=
 =?utf-8?B?S1p2U042Y2hPUkdtVWgyUGVkbjRpVTVsTmx2dm90ZmpmRENVUnVXSXQ4WWVh?=
 =?utf-8?B?YUlOZmVLQ2QzVUduRlJtQWswVHVNQlUwSTltUzQrOFdHSGNZTEk2UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b616755-ab74-4662-2966-08de8e6d369a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:01:25.4185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGkf+A/oY0kY2yGEWBL/KntirN3QAZ9c/ldXBZoyzxqAqQd9sm4m4UdyRWuG86H4OXCisQTHKRGKwdIb1g7gRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5190
X-purgate-ID: tlsNG-d25034/1774882890-F74A6734-BD4E0A00/0/0
X-purgate-type: clean
X-purgate-size: 5663
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C97A235D5D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When freeing possibly partially scrubbed pages in populate_physmap() and
domain_pending_scrub_free() the whole page is marked as dirty, but that's
not fully accurate.  Since the PGC_need_scrub bit is preserved for the
populate_physmap() allocation we can use those when freeing to detect which
pages need scrubbing instead of marking the whole page as dirty.

This requires exposing free_heap_pages() globally, and switching
populate_physmap() and domain_pending_scrub_free() to use it instead of
free_domheap_pages().

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Use free_heap_pages() in domain destruction.
 - Introduce private header.
---
 xen/common/domain.c     |  4 +++-
 xen/common/memory.c     |  8 +++++---
 xen/common/page_alloc.c | 16 +++++++++++++---
 xen/common/page_alloc.h | 14 ++++++++++++++
 4 files changed, 35 insertions(+), 7 deletions(-)
 create mode 100644 xen/common/page_alloc.h

diff --git a/xen/common/domain.c b/xen/common/domain.c
index ab910fcf9306..567887ab3202 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -48,6 +48,8 @@
 #include <asm/guest.h>
 #endif
 
+#include "page_alloc.h"
+
 /* Linux config option: propageted to domain0 */
 /* xen_processor_pmbits: xen control Cx, Px, ... */
 unsigned int xen_processor_pmbits = XEN_PROCESSOR_PM_PX;
@@ -636,7 +638,7 @@ static void domain_pending_scrub_free(struct domain *d)
     rspin_lock(&d->page_alloc_lock);
     if ( d->pending_scrub )
     {
-        FREE_DOMHEAP_PAGES(d->pending_scrub, d->pending_scrub_order);
+        FREE_HEAP_PAGES(d->pending_scrub, d->pending_scrub_order, false);
         d->pending_scrub_order = 0;
         d->pending_scrub_index = 0;
     }
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 1ad4b51c5b02..0e3a86e37381 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -40,6 +40,8 @@
 #include <asm/guest.h>
 #endif
 
+#include "page_alloc.h"
+
 struct memop_args {
     /* INPUT */
     struct domain *domain;     /* Domain to be affected. */
@@ -177,7 +179,7 @@ static void stash_allocation(struct domain *d, struct page_info *page,
      * interface is designed to be used for single-threaded domain creation.
      */
     if ( d->pending_scrub || d->is_dying )
-        free_domheap_pages(page, order);
+        free_heap_pages(page, order, false);
     else
     {
         d->pending_scrub_index = scrub_index;
@@ -210,7 +212,7 @@ static struct page_info *get_stashed_allocation(struct domain *d,
             *scrub_index = d->pending_scrub_index;
         }
         else
-            free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
+            free_heap_pages(d->pending_scrub, d->pending_scrub_order, false);
 
         /*
          * The caller now owns the page or it has been freed, clear stashed
@@ -391,7 +393,7 @@ static void populate_physmap(struct memop_args *a)
 
                     if ( assign_page(page, a->extent_order, d, memflags) )
                     {
-                        free_domheap_pages(page, a->extent_order);
+                        free_heap_pages(page, a->extent_order, false);
                         goto out;
                     }
                 }
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index b1edef87124f..8fc9b5a27f1b 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1529,13 +1529,13 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
 static void free_color_heap_page(struct page_info *pg, bool need_scrub);
 
 /* Free 2^@order set of pages. */
-static void free_heap_pages(
-    struct page_info *pg, unsigned int order, bool need_scrub)
+void free_heap_pages(struct page_info *pg, unsigned int order, bool need_scrub)
 {
     unsigned long mask;
     mfn_t mfn = page_to_mfn(pg);
     unsigned int i, node = mfn_to_nid(mfn);
     unsigned int zone = page_to_zone(pg);
+    unsigned int first_dirty = INVALID_DIRTY_IDX, dirty_cnt = 0;
     bool pg_offlined = false;
 
     ASSERT(order <= MAX_ORDER);
@@ -1552,6 +1552,13 @@ static void free_heap_pages(
             pg[i].count_info |= PGC_need_scrub;
             poison_one_page(&pg[i]);
         }
+        else if ( test_bit(_PGC_need_scrub, &pg[i].count_info) )
+        {
+            /* The caller might have returned pages pending scrub. */
+            if ( first_dirty == INVALID_DIRTY_IDX )
+                first_dirty = i;
+            dirty_cnt++;
+        }
 
         if ( pg->count_info & PGC_colored )
         {
@@ -1571,7 +1578,10 @@ static void free_heap_pages(
         pg->u.free.first_dirty = 0;
     }
     else
-        pg->u.free.first_dirty = INVALID_DIRTY_IDX;
+    {
+        node_need_scrub[node] += dirty_cnt;
+        pg->u.free.first_dirty = first_dirty;
+    }
 
     /* Merge chunks as far as possible. */
     while ( order < MAX_ORDER )
diff --git a/xen/common/page_alloc.h b/xen/common/page_alloc.h
new file mode 100644
index 000000000000..4661767148d1
--- /dev/null
+++ b/xen/common/page_alloc.h
@@ -0,0 +1,14 @@
+#ifndef PAGE_ALLOC_H
+#define PAGE_ALLOC_H
+
+void free_heap_pages(struct page_info *pg, unsigned int order, bool need_scrub);
+
+/* Free an allocation, and zero the pointer to it. */
+#define FREE_HEAP_PAGES(p, o, s) do { \
+    void *_ptr_ = (p);                \
+    (p) = NULL;                       \
+    free_heap_pages(_ptr_, o, s);     \
+} while ( false )
+#define FREE_HEAP_PAGE(p, s) FREE_HEAP_PAGES(p, 0, s)
+
+#endif
-- 
2.51.0


