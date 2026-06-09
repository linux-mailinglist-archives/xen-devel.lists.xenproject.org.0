Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kAuzDi4uKGrB/gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:15:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB916619EA
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:15:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="SP8oI/8W";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333491.1596511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWyB3-0007N6-K6; Tue, 09 Jun 2026 15:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333491.1596511; Tue, 09 Jun 2026 15:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWyB3-0007Kt-Gs; Tue, 09 Jun 2026 15:15:41 +0000
Received: by outflank-mailman (input) for mailman id 1333491;
 Tue, 09 Jun 2026 15:15:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wWyB1-0007Ke-T9
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 15:15:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWyB1-00DzIb-9t
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:15:39 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a282e19-2eae-0a2a0a5409dd-0a2a4506a610-10
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:15:39 +0200
Received: from [52.101.201.26]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a282e19-7371-0a2a45060019-3465c91a129a-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:15:38 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV3PR03MB7523.namprd03.prod.outlook.com (2603:10b6:408:196::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:15:32 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:15:32 +0000
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
 b=M5Gf01aCKVSN7aaEAw/y0YvXgrmjKNYEGA0Hc+QhUHRNKsBVcVuSvZnbUvKpW5QXR6OjSBNLpaPZzm2H7+NU14OMbG0wtQ2RTuJL9wFPmk92r/PHNPaUvPvuxg58BnmAdLH7VzcJzJpUSDUeDajP8bGwE8Vu4HQXKnYImAIw+VPZJZkwzOlJ6TYdu5EZo0Qtgv4A2WoqasK+H4oQkONQ/ObYezmL6wNQDVj9sZ03KlM9+D0I3W3ViAgURxG46n5k5+6HCyshPuGj8I/2opyb2MfLB0fLPeb0WEsKHR6IzIGEnfXfZPQnZQ+EZQtrOplamGoWo/gqm7NfXfOkokh93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csaVkDL+nTZscT52FfwA4psWTg9b9UBQARWSBm2wEkA=;
 b=tdQv12nRHXUkb/lOIHjnUp0q1e8t3avSEBHx3A1ADwhvZT95JhvAvNJB6XS1CUj2WsPAhLbo2iy9Jf31HZW8bZMtPKh3GC0WEYO/bxdvMdpZx0wbo6VAXBj1vv0Lq6Cnze+9P9xLJphpLW1Cfh4jt8ucR1OiQHP5tCNWrA8lRjR7Z5pkv0xyBQ28o8SHDo7ipBkZT0uvqX6QjdzDB6aO9Uww61V71a2UaU0m2FHxmoLcLUPc6R7g+jPf22tPbcoGrS5D/yLiyFPPHXvM7uBzzAaecV4BcVAoJkFv/t18oS8Xov017ucbtsU7RWqUJcoX6VFBRt5WlGHPF0GNBZst7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csaVkDL+nTZscT52FfwA4psWTg9b9UBQARWSBm2wEkA=;
 b=SP8oI/8WvnGAiVEV4uYLa/s68MLiB7hzgHj5cvKQC3GteRf6P6Te9HUgy6SjsjFLVfcqJ/wrj7kq61xsSmrAc4c9ZbPPvjyD7rE+s6pZ0rEyXRR/TVPlg2ktVpTtsRtk9DMHLO/2czAMPWFvopU/lX8luEnLIeSVivpmjpqdeBA=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v1 0/2] domctl: Avoid taking domctl lock for certain ops used during migration
Date: Tue,  9 Jun 2026 16:15:26 +0100
Message-ID: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0030.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::20) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV3PR03MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cef766f-a1c4-43cf-b5b9-08dec639f30d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	2exLfBA5MPRvOeCePj8PdD8dHKzrfxmDXZoAhSz2jrOkF/d/rLvjg0e+dJ4XDEgMwjKzTs6Ykm1dVhPNUwbG0Yt+hSumDUP2Yh9cphtrqd5MnbgdcJU9U7ooLy9GIdoUQwnQFeQbvbJihwFY4bKDZUS3WteRpAUSnY7b75PH5qF/uDqEp0jOVHMJ998PKrD0aAUre7bykD/jfoDyrautdG2WpbipcsSjHzsrp/fQr+GuwLihN1w51BBlFx7AeNpAvIhfM7SRe2AD0R9Apr3qNrG2k7inOhJ6txop8F5LVLOHRsGC/PTssSul52QzN/jwM/KzpNW8KjkxdXoputtdHGSLj8EgmjZXjA+uTyvEs4Gl6b5W+L8ioZfaIzYMueBq4QHSO7x78xOUB6k8GmaFB3Oj8zLxrFOCzCQVIhNfGWbdVaqLt3YToMIFMJVmdRAwhVwkWboVGHlrXS5OahNvalNb3tO5l5u88U9prrNxDlZnyZb5qXoFgMhpmR0wI4G1yrxc/0Say8uIZYAd/bDJRDQ3LS/IyLZli14hqXGvirA1xvGfLSFLn1xiWMF/VGCcQIU316Lks2oHq0PRdfFHNKhVoOGXjTDoR1RS7Xu9kz0HyiBGSw4fjZXy1vDQKyKNgRtYgWjg7M0VhLVB06X1cKHK1f0H+/YwbWc2EfKBUA0gqnR/bQBT6q3GbXckUMZc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Oe1BI3X+PxA/2uYim8OZi21rvocYsOOor/ggETfujmT/VGcY38hxL8Mmc+H?=
 =?us-ascii?Q?1sWY8crlN1vMInnMdHng5izLtFqOwJsWY/uVSQvmy0pV8mGeTtcDjVcbFQ2H?=
 =?us-ascii?Q?1Rvfc2lBS8xTHYeFqHtYtxRV01nRUtog/ZN4eBwmDGCu4c4W3XRDyAQclBd4?=
 =?us-ascii?Q?0Ycw3E4F5dijsgkJ9W7eeiK3ywq8aaOLyIPbbCA1bDQcN4UfXBTQ9q8YYDYE?=
 =?us-ascii?Q?vaodLfdWsWHELTtLo22eKAIYiFQ9wWS4yp/jReLe2AaquF+XV+W5zNPt2vQ/?=
 =?us-ascii?Q?GLb3xwq4OhRJv4bZsekJpr2nl/wnoVjoYTOrMZoZsBsHoX+GYbGSXjX2P2+4?=
 =?us-ascii?Q?FZLr7URmJmTWy9S7+U4WVDPUO1+ESQs+I4+8yRNORvfbntEhAJ0erRRg93ov?=
 =?us-ascii?Q?o2wkR41jYTm/tgfwHEjEI4r3/o74jDrk+ym9nkLKbVmZ7fuEL2/RLhIM+k9G?=
 =?us-ascii?Q?h0QQiCne62aJTMYqnVxyF1WZH9dLC5FKcHU90djS0ER/mGJdEZK+92dwhWqk?=
 =?us-ascii?Q?VGCmUSHhH323NsBgGzLyxLapTdt/+IIyIjck4viTTGHcIkM366fXVpkRitdd?=
 =?us-ascii?Q?F9WwhC65wcLgPmogOGGTu/wM0xe4CYKRGGZmF23h2Yvag466MJPI6EatLemd?=
 =?us-ascii?Q?NNrs07scknyjq6oLExeC4T6qkVEIW/fnyEwKlk2QJ6+IhVV5cUjM4IJQYWxn?=
 =?us-ascii?Q?FE5vAIbWssT6L58W8f1gssNnXUb6gyBXsIlnlTBwz6KbTlBz+5puDdtAwepH?=
 =?us-ascii?Q?BMzaYastuRDoauzG8ULaCZ2Pgzkgx7mOnfmmIaGdNGUBLw9+ZefaKD2TOCUL?=
 =?us-ascii?Q?rGdYQS6nSy2ASXHlenvEGK4wwXQYboqHm/xfk95FPq4JQ3tDisuAoeEKMnsR?=
 =?us-ascii?Q?WJFZ2r85BMMJLv7sgNwfdet0+KQ3n5DQSUdqqxks0UdHpj4DFsX3qqVtJbVB?=
 =?us-ascii?Q?gk+ty776LOiN/I7XKZnlzH13+1Qm6wmPTw3N6tPZR4UTHfVuDjLcvYDzgGXL?=
 =?us-ascii?Q?2N0x+Rar6A0rZh1ga7HzC7vXFZrZWL2j6hHljDr/aLHHzt3VuoXOuaKGOLY9?=
 =?us-ascii?Q?bIAykTsK9I9i9m48w93rPNxe339zIJXZLUt4+x4WezhvLKmIiaEQKyfKc2+o?=
 =?us-ascii?Q?1Ni7dL4tXlwqUFWf0h4G7svqVSVfsyW9OG0RHjz218yHMRGR/9DVbpITC1fi?=
 =?us-ascii?Q?QGTKD4Fnd6Fvb0mb4UP+aDV7ExT8D+uCcI7h2f46LXDX/LeTddQvmr69iDAw?=
 =?us-ascii?Q?vU1GeQspSj163oPd6qaw+pahImFhyv+v4Muya090WKPIv2mWOYsRsNRsOqSt?=
 =?us-ascii?Q?VPoXp6T8JLwMnvSPLy6Zbie49d7NdyCp5XyQdw9MrRDT7n0oBFKji3POAfmo?=
 =?us-ascii?Q?EkXrAJQfI6qvsibsudimHaFbZ2YnGl5pkpNWAptdQOsQ+9aoXt81wsAnW6k1?=
 =?us-ascii?Q?ZsnJe+Nf55svTN3Je9gvbIV2BJUB1tJxFLqU1dE3urfGmxRXSWwJvrqEnkkp?=
 =?us-ascii?Q?rQCzQD8HcjcEXJ0vG1j1n7INJD3Uj+2j53f/Yd7F1CUoS+mwslPh+VtURVGk?=
 =?us-ascii?Q?rlDBNTrVGgOvCSEniIN4boKi3dZWUlIQTSikyL/1Q7CQavulQIPE7+5cRcF+?=
 =?us-ascii?Q?lQVjqC0geEOiHb3HcKIeQJ0zVqhlA836/Hv5baFP7/6IQJiVE58DiGGpeA/g?=
 =?us-ascii?Q?/DIQBJc8mcmPGNHfqRZneU12dl91frhQUutZlTOgdgkevV2Z4lAXzR/LGJ5a?=
 =?us-ascii?Q?sqMn0JWPSX1nq/DhbawRr5XRu++P5/Q=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cef766f-a1c4-43cf-b5b9-08dec639f30d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:15:32.7201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: or/bfqmiz9d/Cj7NMkcQbpSCSlRY8bW6r7xbEzulLvbaiWihG+YKQBY1Qjp7iQuCJMJhCf7F+AGTIs+UAr+z05j2sMO/YAeBu/i+RgukvL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7523
X-purgate-ID: tlsNG-16d1c6/1781018139-8D387D75-349B6293/0/0
X-purgate-type: clean
X-purgate-size: 840
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DCB916619EA

When performing multiple migrations in parallel, the domctl lock may
become extremely contended:

* Operations like "xl vcpu-list" were observed to take in excess of 20s
  to execute.
* The "clean" shadow op may pause the domain, restart with a
  continuation and then become blocked on the domctl lock, causing VM
  downtime in excess of 20 seconds.

These issues can be fixed by not holding the domctl for the frequently
called operations during migration.

Thanks

Ross Lagerwall (2):
  domctl: Handle XEN_DOMCTL_getpageframeinfo3 without the domctl lock
  domctl: Handle some of XEN_DOMCTL_shadow_op without the domctl lock

 xen/arch/x86/domctl.c    |  4 ++++
 xen/arch/x86/mm/paging.c |  8 ++++++--
 xen/common/domctl.c      | 13 +++++++++++++
 3 files changed, 23 insertions(+), 2 deletions(-)

-- 
2.53.0


