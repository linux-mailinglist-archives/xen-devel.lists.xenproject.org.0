Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCd3OLdt6mlBzQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 21:06:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403B745663D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 21:06:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292580.1570959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFzMZ-0005pN-Qo; Thu, 23 Apr 2026 19:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292580.1570959; Thu, 23 Apr 2026 19:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFzMZ-0005mc-NK; Thu, 23 Apr 2026 19:05:23 +0000
Received: by outflank-mailman (input) for mailman id 1292580;
 Thu, 23 Apr 2026 19:05:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wFzMX-0005mV-8b
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 19:05:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFzMW-002tny-FV
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 21:05:20 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ea6d53-5cb7-0a2a0a5109dd-0a2a4506d3c8-34
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 21:05:20 +0200
Received: from [40.107.201.66]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ea6d6e-7371-0a2a45060019-286bc942a7d3-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 21:05:20 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH4PR03MB7724.namprd03.prod.outlook.com (2603:10b6:610:244::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 19:05:16 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 19:05:15 +0000
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
 b=D/lqSSAD1xhAl+wcPEE2LSIyfroVauP8Bny0zSEvtHkzd/Lm0MbzC29lnv0qw/oZDVTFssrXWZ7WOhN2wUgr0RGgqk2zUx8doAmY3GZe5nAeuy5RJdHbO+mqvB0wBbBtXUFuyNw0SzPhBM/tbTVqjc0rSStox/XFiFfOndPKKcw/z2tU21HwqYjx4w5LAjg1V4dj/IaeqRz6WqevKd4u+CC4PT+F+wK9FVxsSopTM8hTnhVmPVSxLTALuVD4DJTot8QEreDrG8iQhCfEKonwpTzQtoEBp5eiU29AzVkHWg/YW3S0UC6oh5M+DDoARBUZRv3xz5ldGnGkDkOny8iOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TT4SKwuDeacSLN/BvcsFT0MhedM6/CopzU9IpsvlNhU=;
 b=XUjUCpT4ct2aRuTFZU7xb3jS7H8wsufv9Co5mixYYzyObF8XZQfWMpLIAhuMg6iJpVWlVnApowUJR0KYVgrw7KXjDQ2i/Z1fFzOcUnzoghr9QxMx3Q2ezxdJPjobWSkB5GaRl3s6cULjQoCfcyp4NUzgLj3UKozD6WjpiYnWEgHRo6QbP0hif40eZOKBIZs3VxN5JomMvZujXXPPkTdW1krL9nI/B27w9IlsJxsTJ0ikWq0nkt/PG3VtW+qHuae8P7JuXmaDOOFFL/45q4xZZ/7UvMvzW2ClqNFL3YYhRFqNWFGIaefDQnWDEY+/sJ2dlrOFW7InByq3tD127e7zPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TT4SKwuDeacSLN/BvcsFT0MhedM6/CopzU9IpsvlNhU=;
 b=kpb4gUKqF6XOUlw6PKM7geWVa+HLPcOhsEJtim9jWbH12hHfaTpFRR34I3WKZmW3WXXpLfCSiTQ+EK0/GRUT0S22O6zF2UHv3BHo06WxGkje1SgJrAJZJuAcCxtG5S1Ek6ppKSoPuAhtB6livF2pFwiIakvgqm9kfa9xynZ82v0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation/gitlab: introduce macOS build jobs
Date: Thu, 23 Apr 2026 21:04:59 +0200
Message-ID: <20260423190459.93299-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0137.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::21) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH4PR03MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: ae05a6a8-8971-4ce7-41d2-08dea16b40c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nhWViy3buhAySxvO/3TYrS/36Bv5ViWmZXCugIMw54QIwHkSk1mZTtnP0uGuNS1+3tIn/WY9Tfe0UIoWHYumLpGx5OkRTNa/RY/nW+pkqtGg6y+Sgkxiop8gYvDp/zH06QZLX5vev0kKvW36SndVfIEMa0IZFiiCmxTIGD5Gl/enZnOPFoGALOyiSX7+f/e4YU5m0m5z49NR6JcB+bnN2wrPBkHlBJyIR7QEnPTNdh9kcLVB96Z4lYD1Hd9TPX7f4ijhqGWZWP5bsiT+c/TvxgDSv1edgt9N5Gz+6SRkAZxHCBnP/m5iBXi8OxoyClz3MRMaHDXs7FkgJUXVf/ichO/70okl4vZe9SAfWbB6Fq0QMtH2dMuAlT0kLM6dK0hKGqS/ubnllKtEz5cvG8ji4lDuveUbMA/2Ad6Cdca4N+iHU3Nloi69FEOzaA3qjJCbhfTuCb8bRn4EJevo8hbjC/QGp08sLppQBKTBlEZ8VXChp14tZkMElH2U1EAuQ2W8IywI4+2AJDULXGgM5UcQwtFI1fbacGQEN7EA8mYoU2woo51gcEKm0hmAAP33Hb8AVgcOVqt7ieA5sT1GTPGpOdcr3/oXEVwsdjBFR+wuOmrP8dSQbXDCwi+Uzzp8jiawsF7l2gpvzJ0vjMH9GNp0oj+MOPnt1xHX9LqRODETtE9zEQcHqgB01XVbDiwkLJ7/JuilSc8zo8rbvksSwuJ3Bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmFDUzZjdkx3aEsyODhyVnk4ZkRtalR4L1poYjZRYXJSQVE3SjZvZHpqZnZB?=
 =?utf-8?B?cUQ5R3l0bGVuTTIzNkFxTjNxV0pDVUN5OVNVajhoZUFlRitrSjA4TDVPYWwz?=
 =?utf-8?B?b0FmcWQzTVA3N3JtcERQSGFXVkp2d3pwL3czb3p1Sk1CT2wzdEdQWjJ0VHJ6?=
 =?utf-8?B?ZGkwZ0ptNStxQVZVVUVxN1ZxNHdRTjVKSW5IR280YjdzWkNYZVlQNUpTVDBL?=
 =?utf-8?B?NGQxZTYxK3hIRGMrQmtFcE1JVmdENUVDRVBtK1AzWC83aGJib3ovWmN6V3Bx?=
 =?utf-8?B?QzdrczFQWFBuVGJJbFRiSTlPU1U1ZXRzTFJEVkRjNHQyMDNhWTQydTFJMk9k?=
 =?utf-8?B?amdOY2xUbHVHTndvVGFHUk02dWhod3NRMkhuNGVUM3BZMGN2cDZia0pHUlJv?=
 =?utf-8?B?bWFaRDNRNFlvajRkbExxMGR2cHNkZDE2b3lUaG02U0hlSjkrcERQR1I3U3pS?=
 =?utf-8?B?R052ckRQRytJRG8vZHc3c0hUSkkwanlZYTdqMVNOcU9BTy9MSGhQWHVycEc0?=
 =?utf-8?B?MG10VDNyTStGMUc2M21YdUJSZ3VQMjRVV2JjVmF0N0NLdi9XQkFXaFdhNHRh?=
 =?utf-8?B?L2E4YU5VVWtJejlHNCtyUFZFRDFTa0xOQmJmWUJaTnY5eENTV0ZQMk83anly?=
 =?utf-8?B?Ykc0akhrR3NRYTNYUEx5STFXRXpEWFVEcytwcFJablo3QnJxS0hRalVlSkly?=
 =?utf-8?B?Rm5HazI0WlBrMElGekM3SGpQWWVvUitnUVQvbWJNc2JOdWVNWU9LbHJ2U2ta?=
 =?utf-8?B?ZGVoUStvL0dRR3VHQnNnVnZ5TGsrV0gvTXBzVHhNNGFrendacThNN1JsRmo0?=
 =?utf-8?B?bFNEWTU3WW9YNEMwY01YWFdXZnhxLytoNUEwRjhJTlQ3SlVSNzBweTdXY1c1?=
 =?utf-8?B?eDFJdmU4ZTRFRlB2czgzYkxTMEdCUVd6RUtlRDBvVnFSQjhyUm5nRHFPa0Nm?=
 =?utf-8?B?cWIzWlo4L2kxTmVHMkJ4d0lQZnlCQzQydFhJL3lxbmpCZlVidS9LVU5ZYm1O?=
 =?utf-8?B?Y1ZHNUU5cllOdDFJTloyVWlYUGorNXdhVXFPU0MycWJ1ZDRDaDlKZFh1MC9t?=
 =?utf-8?B?R0tNU3RKaGxmYkR2Z0t1cnZETk1iaW1BRnZmTlJaa2hvNzU5ZC8yVEtHWnJk?=
 =?utf-8?B?QXl0aTR6Mk9ZdWovYkUyQ0xDekRjdjJEZDNaTlRjaDhXUEpjZWIyeVBZKy9j?=
 =?utf-8?B?Z2g3bTl0a21qcTZkemVvSTgrdnN0QnFjYnZicEg3aUNxWEJYcXo5K29sdVpP?=
 =?utf-8?B?RWpXVmNNRnI3S1c0MjNwdEN6S2FCVDhGYTBQd3RZMkN3MHlFUVZpekFJU2lj?=
 =?utf-8?B?TU9PNXBhOC9IdjRUck1RRmVPcVJxTDFNaFQ2ZTc4cU0yMmZwUHBHRE8vOTRo?=
 =?utf-8?B?UFBram0vWThhVE1HcU5rZ2dNV2hjbzJhdG00OTlFNmU2bERxeVNSb0k0QWhX?=
 =?utf-8?B?QzJBdkNkVyt5QlNDRm13Nk5USkRaRGV3elNVQWlaZVFaVEpMRm5iV2NZbkdj?=
 =?utf-8?B?STRKdGtTTCs0TWxUVCtNVzNQWG1abGE1SDRpeUI0MXhjaUZjVVlUZXZGUUVp?=
 =?utf-8?B?WTRwVDc4Q2dTRWFZcXVYZytpWGo1RXBwMlNVb0xlTk5pYkNKcFozTUtBYU1L?=
 =?utf-8?B?REhsU3NBNkhzd09ZUkNETW9RM3oxeG03NE1ZT1BJMm4wa1BOVGNld293dWhl?=
 =?utf-8?B?dVhYQ29uMEdQdU1FM2FIdGcyRmJCdnhtanlBbEVxZjNEZS9YWUx0OXpDVjBt?=
 =?utf-8?B?aDhid0pMZFkzWjBoVmJyZW4yMjZ5WjRyeVZWd20vN0l2TDNrbGo4UklGN1Qv?=
 =?utf-8?B?bS9UWGt1eHlNMGJZcjdkN2FWYmxCbDZLdXAyRk5VNU5KOVdWQzlLbmN3Uks5?=
 =?utf-8?B?aFZ6bzJOZG5OaTJvRnRwbkVScmxkZ1N3dmd0UDMyWHdPQm1lNTR2RkRDYVpT?=
 =?utf-8?B?VnNBZGZFNWpuK3ZkRUoyRlVuYkNqOTk4d1pRT1hZVlhtOGIzNEVxbEpucVcx?=
 =?utf-8?B?Ny90TnkzVWpjVjNYWkNSQmJQOWdMRFNhd3VXREFtckJCaFRHL3lTaWVFODha?=
 =?utf-8?B?MlJTTWMzZXE2d0NUeXUwS0FHT2ZEckR5c1Z6dUpzM3NRQW5hcFZwcTd5UmU0?=
 =?utf-8?B?c0lXOCtLVWxzZHBMcUc2YVV1bjZMUk44czhobVNnMEpXL09hL0tGY1UwaFB4?=
 =?utf-8?B?K2dwd3JPRktPaU1pSDUxVStaVkFYRjRLeFh6RWJqbzBCSXFSK3pkZlVUc3Nn?=
 =?utf-8?B?WTZTWDBDWDRNUnE2QjBWaG5SMEhHd2FtaXpWSVJDMDljN3FPOTRyQUJNQ3JK?=
 =?utf-8?B?MlVKN3FrRGpsdDAveU8wQXhheXlVeHJ6RHFxV01vdnhPT0M5eDROdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae05a6a8-8971-4ce7-41d2-08dea16b40c9
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 19:05:15.6467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHK72Xi6WxXDbx+Cx+Lh/96GvOPe3j7muERVgpriPfEv1b/f4NjnI75vKQuMvuujypPnAOU2tJExPVNjo9jvDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7724
X-purgate-ID: tlsNG-16d1c6/1776971120-51D6AD75-B9379BC7/0/0
X-purgate-type: clean
X-purgate-size: 1962
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:roger.pau@citrix.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 403B745663D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the imminent decommission of CirrusCI we will lose the limited macOS
build testing done there.  Introduce two Gitlab macOS build jobs that
reproduce the ones present on CirrusCI.

According to the "Community programs" Gitlab documentation [0] we get
50,000 compute minutes per month.  The arm64 job takes ~1m 15s, and the
x86_64 one ~2m.  I think it's likely enough given the amount of minutes we
have available.  We might need to reconsider if we add more tasks that
consume compute minutes.

[0] https://docs.gitlab.com/subscriptions/community_programs/#gitlab-for-open-source

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Example jobs at:

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14064832403
https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14064832402
---
 automation/gitlab-ci/build.yaml | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index eff96beaa5c3..463ed2f96d86 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -815,3 +815,33 @@ debian-13-riscv64-gcc-randconfig:
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
     <<: *riscv-fixed-randconfig
+
+# macOS build jobs
+.macos-26:
+  <<: *build
+  tags:
+    - saas-macos-medium-m1
+  image: macos-26-xcode-26
+  variables:
+    HOMEBREW_NO_AUTO_UPDATE: 1
+    HOSTCC: clang
+    HYPERVISOR_ONLY: y
+    <<: *gcc
+  script:
+    - brew install ${CROSS_COMPILE}gcc ${CROSS_COMPILE}binutils
+    - alias nproc="sysctl -n hw.ncpu"
+    - ./automation/scripts/build 2>&1 | tee build.log
+
+macos-26-x86_64:
+  extends:
+    - .macos-26
+  variables:
+    XEN_TARGET_ARCH: x86_64
+    CROSS_COMPILE: x86_64-elf-
+
+macos-26-arm64:
+  extends:
+    - .macos-26
+  variables:
+    XEN_TARGET_ARCH: arm64
+    CROSS_COMPILE: aarch64-elf-
-- 
2.53.0


