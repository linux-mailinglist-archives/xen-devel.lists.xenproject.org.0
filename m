Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CIpJFjx+IGoo4QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:19:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FA263ACB1
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:19:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=aKeVsp5S;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327042.1592236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUr7J-00015S-Pl; Wed, 03 Jun 2026 19:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327042.1592236; Wed, 03 Jun 2026 19:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUr7J-00013X-MG; Wed, 03 Jun 2026 19:19:05 +0000
Received: by outflank-mailman (input) for mailman id 1327042;
 Wed, 03 Jun 2026 19:19:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUr7H-00013L-EB
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:19:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUr7G-00Gsxh-R2
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:19:02 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a207e26-5cb7-0a2a0a5109dd-0a2a4509b786-0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:19:02 +0200
Received: from [40.93.198.17]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a207e23-2497-0a2a45090019-285dc61193eb-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:19:00 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH5PR03MB7886.namprd03.prod.outlook.com (2603:10b6:610:215::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:18:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 19:18:57 +0000
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
 b=AhH2iMXXlAxDIkrfqhKg8/Gp2c+Ch/8uWZ7A6CQiY6pIEyl4oZvhimgyGffO92rO3wSq9n1cawoTDPZ5rrsRa9CP36xOeepMbrtEzhbH5jSCaKjRYfeaCFp2NUhfiFTNkTkof4/VxyCYqMUBKre39Jd4rc3bi3L28LdVffgqE1fZb2WLDR2LLWl8hejn8HEhJv67CfeO1bk13vqFhehExEG1Yd1vBaxl0hr/r5olsSbI8jDVNtj2H582t0WiHNmt27orIV5odyESgvwsS6H6ugy+gBRitD5Lf6SMgwRcVc41d9TFzNmVifL/fs8XmnXZljDTtlfBQ0r3mHcxVXhOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpQZ7LMJgYkSTB2ULpsle/Dl0pjfw6r9H2SKsbbNlzI=;
 b=l423yJzzY5Rm+osh3QqpdXiBTyFk/7DcNG25gWODdbp1y4oXAytYSgCFAMHScQt8Trx29s1eMqSIim14viTrSLStj+QpYgJ+eWKPjuMJe6JEht2GvSlTLS2db8N3qlHiEqVsvCldkImYp4UW3tu5p8qxLdoFQBr17B0D3gW9n1IOCrq2GcAX6CrtBelhvp8JaC0zQyFcfdGeIEodRlgwKxNQZlD7T/af5tHcTqlfmmJ1zQBAHr+80hQm+NLmzVOiW4MCqoMdGDuFFaOYCS2YuFZ5fJD8qw1i3gyrekJ2iLeNESLHkp4yJRR0500hIWDz8XscXxuOmXu2DRo8qI8ESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpQZ7LMJgYkSTB2ULpsle/Dl0pjfw6r9H2SKsbbNlzI=;
 b=aKeVsp5SgHGJKYeAiXOsessCxEb4D01bEGmu/0GZhOBU55O+5M4YD4ForBHADd8dJYbU4yJQr11jch6kVeWlxx6VabjPM8hT4m3mMMrwET4M1drllwrh33y0BmNZulK7NhsGDxZbHI1YgZkYi+pMXYoJ2dxraKrx9JILEiqDOxg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.22 v2 0/5] numa: add unit testing plus fix regression
Date: Wed,  3 Jun 2026 21:18:31 +0200
Message-ID: <20260603191836.77955-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:408:143::22) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH5PR03MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: 733747d8-38af-4547-43fa-08dec1a4f53a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|6133799003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	llTMGMInnjNf5tNvs+TDZIFRQ461pgyUMGDeljMQ8ugwcT3J4391jdMiD7BFTuvE3GJwAeajjWYzMJJn0h7OgEepnsZqz99kr4Nx4CYUUxvgEVfbeBfynAeX8RC7xRka0SiRUodzbxHtDvbZy16VPawig8lSQSp98KUWpoThfd4iX+tyMQL3qBmH+aK3i89s2nZR4vCsk+3ZMq5kMJpCUn6cUa9FbcL+kq61FtBymqrUi8Yjnz3tvR/5mXaylRx2NYtInFtZOtWwGJnt6n6WNp2UxV6cKIpV28qw6l8Luyf/4WqbzVSv5Z+znTn0OGGmZORkO4SsfQxL8/7wVOOfgaAulPsG7UpmPGVyjD15EaA0iBHvQEgDQdwa6Ba0hPzHYg4Gp9bZcdnl9VwK83m5HSklleoucsg3zMZBfPkXx7jMvt7/Vuck1tPqb3JrLCwcactTQU6fLiMtTcnmP0xXDvW6bOiI0KkTvXBAChqNQ+MxLaGp2phO0IukR0Tdr9yGfqH9G96osPFhUz69dUw+5iUgNxFdZUr33bXtZJa9Y/LI5yLKijxPQl8X1hs+IIlSb2fl9gwJiGOZdMBUCGFrb87ell9qo6R2Dg45QTiiXrrrUSVpXSji+GBWCpK+Dsr8Z4B8t9V4vKrU5ARXtPBhVSvyWyGJaA0o5eFq4P2Y09mvhuEm2nHczyAVpm7M9iBG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFpnUFh4cnVYL2FNMGpYalo1L3Y4NTBOaWc1UDRkdFVnenNMOGJQcGh3UlJv?=
 =?utf-8?B?UGhuNEZ1K09maE0rczFDa1pxUWc0NmtYM2Y1SEtLT25UT1BHSWovMEJXYU9R?=
 =?utf-8?B?ZGg5Wjc4ZHdDT1RScXJJbUdQUnU1K0xwUXJDWStpWEROZVBJNktPRmxMMitM?=
 =?utf-8?B?SWt0OWNCQjRKTlFoYjJDcENmU2J6UG5TekhzSU55eTVEdmQvUFh5VW5HWFU5?=
 =?utf-8?B?UUh6Rkx5T05ublVROVE2bFhyZUVtbHUrNDRleFp1aE9mdkVMYmM0cWNhVHds?=
 =?utf-8?B?VGhrUFVCMXZrOUFnYW1XSEd6bnV1cG90dnZaR3NCdm5nSVNNdjBuQkU3Z2Yz?=
 =?utf-8?B?V0NFK2pKZTM3Z0R2OXBEZjB2TVJ5c0tkRU9HV2doKzd3WFVacXJ0S3AxQTlt?=
 =?utf-8?B?UlFDQjUrclBMT2sva1YxbHJiRnA0Wk1HZnZmeThMaUFjRjVia2VPUHNCdHRD?=
 =?utf-8?B?bDU1d3VCa0dzQnJlTUlRWFlKcDk5d3Y2cm1NMkVlT3R1Q1ZPNVlzMGtvWHNs?=
 =?utf-8?B?N2hFMnlPQVpPUFpBd1lTbzJVZm5tQW5wTXFVeG1uenFvcXhNc2tDSWhlcG9B?=
 =?utf-8?B?SVltdGVOSHNtc2R1VFowcFdNZlJlZXRUbDh4M2RzbzNPR3BORWlTd3FCQWJ0?=
 =?utf-8?B?bzcxOHZpd0xTZWI0bzhiUzcySGNrN0lScUdZV2xiTitaNjFEb2FpL0kwcndV?=
 =?utf-8?B?VmsvajVMekltcVY3ckliTFFSbnlURkZqS05WNndNSGhIczB4ZUxVVjVJenY1?=
 =?utf-8?B?ci9QYkRSMG9McFVqT29mYXdUY3A0R0tzeGQ2L1lwZ3NIZTFCcEVQZHlURjVW?=
 =?utf-8?B?Mk8yZnpvRHZvYXRlbHBQN3dCQXVBZERGYUNJQXZocnUzQXE5YlBOamt4ZmdF?=
 =?utf-8?B?WWJiZ3MrUzg5Mjh2NUNaWmxSZTdEMGFVcStqbmdnWjlJa3BuWGJ3Z1hkME5x?=
 =?utf-8?B?S3FMQ2RzbGt2dU9VS2xWM0E5SDlMYldLR2pFOHc0OEc1OXFwRXRMLytkb3I4?=
 =?utf-8?B?ZlNlNm1MVUdrNmlyU3hlOGZsS0ZVbGdkc0R3cFExUmVEcjhHSkZIeG45bmth?=
 =?utf-8?B?cU1zbjV1VC80Nkx2b2VteFMwdTlaZnRwUHdyclRXYVJPT2pMY0szbTZ1WThl?=
 =?utf-8?B?K3BVMXJrSzBkUzRZNFlSTVkrVGdPMm5IdWxSTlBGWnRxN2RHcGFVYTh4dHVL?=
 =?utf-8?B?MGR4bkhFWVdiU21ZZlJXREE3L3phNC9lbGpob2x3MTFZMjVaMXZ5RWpTOVlQ?=
 =?utf-8?B?MWw0YUJweVB5NTNWanpvUmFuaUZJQXF1YjlIZFBQQW85VHd4NGs4UU1MRDJt?=
 =?utf-8?B?S1M4RnIrQitRdkZqVEg5YTJMeG5OWlRITlY0QndrZHdZL01idGs1Z1FnbXRn?=
 =?utf-8?B?Qk9lU0lvM2lmUjg1RHIyS0lQN1Q3Q2pQUW40T2w3QnovcksxTFRuNFc2YlBY?=
 =?utf-8?B?N01rbWRFZkhlZ3FLTVY4dGw5bzRJR2kzbmR1SDExQ1VEV1J4YnRhRjNLY1gy?=
 =?utf-8?B?RnMvVURzaENLYjQxTitSTk5RREpjcG9LL0JaYjBLQmJiL2JxL29rSW8yOU5p?=
 =?utf-8?B?Q09Nelp5c0hsc0pyUndvbGgrT3pRZ05TQzJDbUVZQ1dlRUljQVhJM2ZDQUdq?=
 =?utf-8?B?WXBnWUorVlNsVzM2NENlNDl2TGJQMnhrbFpxVTZBME5vYjArdExzdjdpQ1U5?=
 =?utf-8?B?Z1dsR1JzM1NBVjlsbkswQ3FNaDkycWVQSktITDZkUkdTK0d2Rmd3NlNXV3Zt?=
 =?utf-8?B?M3BJSnB6eHFWRm85M0ZkOThMbzhXRUZEVUF2Z1UreXFTSXhFRGhsaGMybFpi?=
 =?utf-8?B?djhGa0dVUE1HYlhueFBRZHhzaUVCMklJK1dlSE5sYS9VQXRDWjEyc1Z5SUIr?=
 =?utf-8?B?eGM3WWZIaHhyNjZTK25GNXpMdFpkeEkzUkg1LzNMK09hUktOVlRnNEtKWS9w?=
 =?utf-8?B?TURVc0V4TlUrTmlxV2dta2VzWVRxMVBMQk5UZTlvMlBmQkpPOXQxSGN4RlN2?=
 =?utf-8?B?WXk1cU1UUWxoU2QyUVBIZ0xTQUtkMXIxMmJGVGxocW5ScXFGdUJxVWRZdHRY?=
 =?utf-8?B?UFJtTFg3ek5keWEzZHVFbnB2SVAxZUJiSnV5ekcvS1kzcVhwWmpQZklWN3Qv?=
 =?utf-8?B?K01VY3dxM3N2UmJrLzl4cmo3RkFGR0hWWThBTiswQnFnQ3hvMkVwSzBiQkNu?=
 =?utf-8?B?ZlFySGZUbnpIb2Y3WGtnY0FlTUFINDVjeUxOd281N1gwWitRbm5PR0lBd0Nr?=
 =?utf-8?B?TjlnRlE3MnVacUNsaVoxL0l1UUlUZVN6eDYwRmE3NGVMaG5OMTNVRHI3RHRQ?=
 =?utf-8?B?QUJQS0RSRU5lcTJ2NzMzOFN6MVVrWVYxZWMralgvTU8yZnozTUpYZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 733747d8-38af-4547-43fa-08dec1a4f53a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:18:56.9037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9l1M8jUyZZ54QbebObY7cNISKhCtXyprQFqcsvPKQWlAd/L2l3lIrcKh/zKiE4oYYWNEYjnxy0PBECl/reQ7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7886
X-purgate-ID: tlsNG-bad1c0/1780514342-41969A53-E4035CE7/0/0
X-purgate-type: clean
X-purgate-size: 2468
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:julien@xen.org,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03FA263ACB1

Hello,

The first 4 patches add some basic unit testing for the NUMA setup
logic.  The last patch expands the test cases and fixes an issue the new
test-cases would otherwise trigger.

Only patch 4 is missing an Ack or Reviewed by.

Thanks, Roger.

Roger Pau Monne (5):
  tools/bitops: adjust bitmap_or() interface to match hypervisor
  tools/macros: adjust ROUNDUP() interface to match hypervisor
  xen/numa: prepare NUMA setup code for unit testing
  tests/numa: add unit tests for NUMA setup logic
  xen/numa: fix setup of non-aligned memory affinity ranges

 tools/console/daemon/io.c                 |   2 +-
 tools/include/xen-tools/bitops.h          |   7 +-
 tools/include/xen-tools/common-macros.h   |   5 +-
 tools/libs/call/buffer.c                  |   3 +-
 tools/libs/foreignmemory/linux.c          |   2 +-
 tools/libs/gnttab/freebsd.c               |   2 +-
 tools/libs/gnttab/linux.c                 |   2 +-
 tools/libs/guest/xg_core.c                |   2 +-
 tools/libs/guest/xg_dom_arm.c             |   6 +-
 tools/libs/guest/xg_dom_x86.c             |   2 +-
 tools/libs/guest/xg_private.h             |   4 +-
 tools/libs/guest/xg_sr_common.c           |   6 +-
 tools/libs/guest/xg_sr_save.c             |   3 +-
 tools/libs/guest/xg_sr_stream_format.h    |   2 +-
 tools/libs/light/libxl_arm_acpi.c         |  24 +-
 tools/libs/light/libxl_create.c           |   2 +-
 tools/libs/light/libxl_sr_stream_format.h |   2 +-
 tools/libs/light/libxl_stream_read.c      |   2 +-
 tools/libs/light/libxl_stream_write.c     |   4 +-
 tools/misc/xen-mfndump.c                  |   2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c       |   2 +-
 tools/tests/Makefile                      |   1 +
 tools/tests/numa/.gitignore               |   2 +
 tools/tests/numa/Makefile                 |  47 ++++
 tools/tests/numa/harness.h                | 184 +++++++++++++++
 tools/tests/numa/test-numa.c              | 267 ++++++++++++++++++++++
 tools/xenstored/core.c                    |   4 +-
 tools/xenstored/domain.c                  |   9 +-
 tools/xenstored/watch.c                   |   2 +-
 xen/common/numa.c                         |  20 +-
 30 files changed, 568 insertions(+), 54 deletions(-)
 create mode 100644 tools/tests/numa/.gitignore
 create mode 100644 tools/tests/numa/Makefile
 create mode 100644 tools/tests/numa/harness.h
 create mode 100644 tools/tests/numa/test-numa.c

-- 
2.53.0


