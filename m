Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SvilJcbzxGlO5QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:52:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051EF331A57
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:52:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263520.1555432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gRe-0003TU-2i; Thu, 26 Mar 2026 08:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263520.1555432; Thu, 26 Mar 2026 08:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gRd-0003QR-Vm; Thu, 26 Mar 2026 08:52:01 +0000
Received: by outflank-mailman (input) for mailman id 1263520;
 Thu, 26 Mar 2026 08:52:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5gRd-0003QK-8Z
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:52:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5gRc-00FZYJ-DO
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:52:00 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c4f3ab-5cb7-0a2a0a5109dd-0a2a45049bf0-10
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:52:00 +0100
Received: from [40.93.201.24]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c4f3ae-c823-0a2a45040019-285dc9187e5b-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:51:59 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6130.namprd03.prod.outlook.com (2603:10b6:610:b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Thu, 26 Mar
 2026 08:51:55 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 08:51:54 +0000
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
 b=ce5BwS1CIkLTTSH8KzREddY57YKBwa/FixrMzxqbRnTv9p1O2l5oL8tod5ZvXBkIVfZijHlxh2WfL5MfQ/Iuq84zHKUQydyc8okUXZmJjJUpIHPxXDiR7hCQ0A8aGga9/U4GSe+bw/tqB7tXj5d+JY233XY0SQfGsPvUpRHpZpf0iFfdpFE1hTt5UHi4/QKeLmWHg7mcnAp0sZwP9Y/qGCXYVwo1lUt4uQssGYRHPzMeIRpKbKy5lGnztfAjArtI6QJeeyeDdqELYBiw80fuow0Zk0gkG3Aj9YaaynC37AcfL+xJJbKiU5ZiPo9XKBiN6bpufSiK6mvk4hBkOHN62Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17HZ3jI+bQlD2Prw4LOAzGgmCirP7diNopYd0fvwwRk=;
 b=AHes0iZFYx4ef8NI8pA5VSfE48z7gF832bm8IA+/ppNIgH5ouuyoIubH8ZBE7oHGi7ZPbbfrWrKj/PnJQ+n8Bz/xf42dI8URglsKlz0u2VvH//bA/39fXsIn46Dz6vVAW9x8U+gybyMY7Itta3EHQkhfBPZ5as82ELnFJkuAc84M8Pr68J7Rdb330crtiQ4r2lvS44aOwearB/V7mFOFHXYRIimzbrBLeeC8FzqjURv3QZB/KdsC4wJca6hzFk+abe2wdB4yZlKm2JSGrxiEDI8ln7C2lzOY6uvHu7avATLFUViueouFxYuExnPiHo/K8pO/Pb+8f3CmOD90L/aCyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17HZ3jI+bQlD2Prw4LOAzGgmCirP7diNopYd0fvwwRk=;
 b=IxIo9k/1LGJtK7s6bVEEYNK1dTIW86AHT1+xfp9fJbJGOC54rYHkEloXMVYwIA9j3+OZOeBKiHhjzNWQhl/nR54NLT++dRCdwk9hFRVcPkWJtbMdlaUbiZcOlcazpsIk9GzOqm4hIGQUVQbrQx7JlAuy1Z9ECHdJ7dSOa8cLjk8=
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
Subject: [PATCH v2 0/3] xen/mm: fix fallout from populate_physmap() deferred scrub change
Date: Thu, 26 Mar 2026 09:51:42 +0100
Message-ID: <20260326085145.61380-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 950cd055-f90d-4a40-2cea-08de8b14edb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HYiMdETMdl/rnlZzge+yoUfghYdFkb8rRnO/CC6d4sSdBNkQT1XIuNqX1anjl/rzp9koc5Io3MBRUFjSUbLMJc0BTWxk02VEqv2WlQVDd7mItxxJUv58PYds0vbmRP3gY/xYmkZ/zGApHTkivnVndxHtLhHXeTWltJ4BU1rX7c47i73FbdrZAwa93sWcRn7acdc4dQ+pyOCfFcbV4WvogfuABhM95tA8GLj6Wb4chKLaPREHRlRswGBBD/w1t7Mhw1OIHSKlr1UrG7BiYhjG/fXqJ9nLG4XahQg6pA8b6+1YUOcUTMghWA8cs8Ba/S3Q3fz/Un+bkOspmXkE8NUoYqXDa3XhS0y12XOVYtyI4upae5WcNClTPCmIJQCAPwiZhy0BZKHj/tqrGpZyr+AmcjHUkE4Msjzy8E+FIDVuCTlJfjDN2K/R7x/I9qbcg9uQDd+I4HBTrieyIpZOU0lxVcEAkCqhmCy1LKQcOpMdsBxlxJD7GpMEP9ULRFIJCUsGUjdp6tPwf1anT6wyglsI0SVHesxGUef+UN6QeKFTUm7AkhEmZGzQabB7q6cPzUpps6FIwFanB/rUmWkxAXChndUT79HY3Veubopv42EglBHL+AV8ym6eL5SJoY8Lh5m0EjI5lUlqyN6XiBijMtzC8NfJdMRXnkQiGoZW9KJErOamGXsLP/XV8LBN7GW5BrqNp/DliKteGetoGDRzOgFE6kI2rpLuwJF/anF0E9DMAmA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0F4eFZUMFhrOXhCRkMvbnZPeE54V1ZqSEVzdGUrQTYrNVFuUlJVRXFkNVQw?=
 =?utf-8?B?VTdwU2pDQ3BoclRXSm54Sk93eDZCaEtqRG16T1g3dTBkZmozWHZUUHM0RE52?=
 =?utf-8?B?NXhYakE3NnQzWXp1dUR5QitERmdPVm14TWxNUkJiSThPYjloU1lwTWlGNVYx?=
 =?utf-8?B?ejdxWVcrOC9EWW5pRWJkVkxPSEJVUm55bTRrNEFjVUhDU096VVI1a1NyZzE4?=
 =?utf-8?B?Q3ZRdi9mYjRMbVd1ZXk1blF5Ni9NWmEyV2NKQlR4cjJGMGp2MHJtOWx0dU56?=
 =?utf-8?B?UWFrb0xJNWZiWXNUVERsL1BDSUtZdWxuZkgrU1VOWnNZSDYwWmRYU3ZzL2lQ?=
 =?utf-8?B?YXJrRDJnTlBIRjVLRmRyMnovdFY4MGZBL1lHV2FFNDc1aW04MTNjUTlYbnN1?=
 =?utf-8?B?U2kwNFFVU3VEU1VJdmU5aGRMd3RQc3JEYUlHREthYlJwK2RCMHNKdWVITVBW?=
 =?utf-8?B?SlJLUWNBeHBjbHdjbi8vd1graWpFa1IvR2MwaC9lZStLWnZrdE5OdUZHa3NC?=
 =?utf-8?B?OFNjSUhDOVhMQ0J5S1F1SWJoN1B1N253QWpETE5KWHhFYmVzRTFVNUN3QWtx?=
 =?utf-8?B?T0Z5SHZBajB5eVBlY0FOYlVvOFNXK0k4UEJqdFNwdzRtdXVLaXYreXpCYktz?=
 =?utf-8?B?Z3UzV2ZLYnBHb3BVcExtblphbHpEOW9lSFdiOS9ZenFIZEJUZ2E3VHRMTnAx?=
 =?utf-8?B?dkY0b3Z3ODVQQW4yclZuMitJWnBTWmNtaWh3NnBJWG9QR0dXcHZ2T1VsVDVo?=
 =?utf-8?B?WlI2M0FlRmxYM0pXMDJwZ1FBeHJJS09uMGNiMFkxL0YyVkdYQjA5MWxkb0Nu?=
 =?utf-8?B?SXNZWUZtcm5FTlRGWkw1ckI4S2k4Z3RVc1JSKzFzWk5ZOEZPM2ZZOWdlZEsw?=
 =?utf-8?B?bGJTcGZxV0poVjAvLzhGdXlabXYrQVc0STUyd1VRb05DVnNncVVCdG4zcXNq?=
 =?utf-8?B?Wk5mSk9CL1VlMUQrMlZ0bnk1RkwwejdVQndYSlFyYjMwWnJkTjl1SE1LUU42?=
 =?utf-8?B?SlNnamRPbWpyU0hqY1JUSjQvZkVmc2tnTVRMNktxbW9mbmJWQkw0MzR2QWk5?=
 =?utf-8?B?eVlpOENrL29kZEZublJWaExkdmNOYzB6bW12dkZjVmZLN04vNDZ3TkgrcG9h?=
 =?utf-8?B?YmJ5cDJXSWlzWFdxUS9Qc2kxVmU3emRweEZyVk12aG1Wb3ZiOGFnN1M2bjNw?=
 =?utf-8?B?K3kvZ2RjWG05UnRYdzNZQjNOajFTYUNtYzZjalNtSjVkNHZWNStreVk5aUw2?=
 =?utf-8?B?aUxZNzRuaWxRdnFVaHUvOC83UE12WXdxWG5FU3R6b3luMGY0UGJha3hKMGZn?=
 =?utf-8?B?N0tFMHVTZ3I0Y2R6cGdVMFgrVnMwbDNUZHlZVFBQYzhwWU4zdHJ2cE80SGxK?=
 =?utf-8?B?OXJqU0RKalFMaWlxUHhJQWFsN05UYzBWMngzMmxxYmFmY1BEZHVOeERPNHNK?=
 =?utf-8?B?M0hHQkpjT1k5Q3JGOFdSSE1hNG1pNm8vTC9GSnYzdzNyQitZV2Q0TitDemE0?=
 =?utf-8?B?KzExV2pZZnhSRzRaZFUzdDNTYk55dTFaVExoSnRhcVNjbGJrZkMzQ0FRMmg3?=
 =?utf-8?B?Y2x1VWFkUzU2Zkt5bWZMcDQ3NS9pNmF0U3J4Y1dTWk5LZkJRM3NwamRvVnhv?=
 =?utf-8?B?cnlRTk5PM21aRmgwWFlaQ1RTRjhaS2RqbWJhcytZbnVYbjZ5bEJIWHJ4VzJD?=
 =?utf-8?B?S3l6a1AydzVjWFdhamFhaXpKNitxaUpWVjBtSGphdDZBQzhEU3BGV3dWdG5a?=
 =?utf-8?B?SnQydGJUanRFb3B6YUN5RUlYUWVTT2lzNmd3eTdQUWliaytHdlUzcmFhRHB0?=
 =?utf-8?B?ZldqaVQxSzN3Z3YzL0VoZVd2L094ck1nN0RCQW9jSng4QzRWVVBxaGtmUVlo?=
 =?utf-8?B?MDhlVTRTZjIrbnV2eWdtS1pndEdsT3N3RlJ2dlhFQTIxYTJZRXN3bmNMV0tH?=
 =?utf-8?B?K09nOFYxcnZ4VlprdlpFM05NZ0hDNjNpbWYwYVVLQWFkNk51MDRqaGJkcE1u?=
 =?utf-8?B?elJSQjF0Tit0dWpVRGhaMTk3UkRDOHhSRFg2d2ZLWlNzSWRvVEFRY0NySE42?=
 =?utf-8?B?SXlmTUZFTjlaSFVZdERkT2dhVUlvUnR2MXdiRXB6cDk0SXZRYjI5UXRsL0dy?=
 =?utf-8?B?eFZQUWYxcEc2ZVdmdEptb1ExUVBBUVg5dWxPeUtENDdmUmM1Mnp4ajRBbCtF?=
 =?utf-8?B?a2VlY3dTckR2RjRNMVc1enhMTHg4YTREUk9Ga0JBUGFubVJOWXBmMTVWcEVq?=
 =?utf-8?B?MU5OdDRqY2IrdFB3STE5R2ExN3IwWEQ0WlUwQkkrdEpYSlZ2cWw1Z3pycndC?=
 =?utf-8?B?ZkpWRDFaV2tHb3ROdzgrNVJtN1JaWXNYZUJyNHd0cjZZNmhJb3BHUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950cd055-f90d-4a40-2cea-08de8b14edb2
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:51:53.9036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqFUhOSVY30BmOrifX2miAAPQpvFEkPr+pElvkJIKETKj73JyyKEWa48udSadRtKBixYv/ZesFfxLEnufA24MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6130
X-purgate-ID: tlsNG-ebf023/1774515120-B888F9D1-65EBC410/0/0
X-purgate-type: clean
X-purgate-size: 573
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
X-Rspamd-Queue-Id: 051EF331A57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

Two fixes for the populate_physmap() deferred scrubbing changes, plus an
improvement.

Thanks, Roger.

Roger Pau Monne (3):
  xen/mm: don't unconditionally clear PGC_need_scrub in
    alloc_heap_pages()
  xen/mm: do not assign pages to a domain until they are scrubbed
  xen/mm: improve freeing of partially scrubbed pages

 xen/common/memory.c     | 13 +++++++---
 xen/common/page_alloc.c | 56 +++++++++++++++++++++++++++++++----------
 xen/include/xen/mm.h    | 14 +++++++++++
 3 files changed, 67 insertions(+), 16 deletions(-)

-- 
2.51.0


