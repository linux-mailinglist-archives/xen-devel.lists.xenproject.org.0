Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ar2JORPHQ2pGhgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:39:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEE56E4F10
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:39:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="ewg0/87L";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1348935.1606725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYgN-0005OJ-7N; Tue, 30 Jun 2026 13:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348935.1606725; Tue, 30 Jun 2026 13:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYgN-0005Lv-4K; Tue, 30 Jun 2026 13:39:23 +0000
Received: by outflank-mailman (input) for mailman id 1348935;
 Tue, 30 Jun 2026 13:39:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1weYgM-0005Ll-GK
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:39:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weYgL-00HWax-T1
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:39:21 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a43c709-e002-0a2a0a5209dd-0a2a4504e654-8
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:39:21 +0200
Received: from [40.93.198.17]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a43c704-a01d-0a2a45040019-285dc611e4e8-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:39:17 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6615.namprd03.prod.outlook.com (2603:10b6:a03:388::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:39:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 13:39:14 +0000
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
 b=Ym6ny/zxb6/H3XncJk3594YeTtIXeZISoVv6aK64xgNaV6FTFtNetksuoSshYzQ5o2Yolubyfd6u7xOxRDF1KEcjmSwmVjvkCdwZaZTu0SSLAwPVZw8oIP2EEQC3pj09aPUByMGgs0X9Cq8dDAVMEMXKraBpgecLjgXncg433oijcZa1+d+wJwfjkV7xDUVzWswlG5Ce3bZSb/kMU+JtPqgRDutzoN0urPaT7ohOXpzpBUNrbfQ1cW97v1AA6c2XsDKt2Z+i2LXgEse6DjcwFTb/yJTumxK9hzmNZzs0P/tm+RHUj/zFolEAuI3a17BCJ/RyHybEpi2nD+hXR04G3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Met4QhsbXv3thN0cscjnql2ajHPodLBp8dzJxRqHbYs=;
 b=V5yWjlvRSa0rEpMd7OsEb0rNce7/TSojj27WFjyxGKs5uFQCKEBZ1IZgwO75XBdM4OPhHEYYkiEm9q7IgkVNqrBq5m1AiJdlMvReFst9VdAz2GQLGxiV/xCFo6l31Ri+ozqhr9Vw0elIi5lJJZAtnnK1Oh0/n/ttTOSqJMopxj2fV1hENryqyDH3p1syhx45A1n8JC3IfZNvVw32TWsUmEOqYzlAKL/GxX4NlEkWRr/8PmtvI9omUMzACKcTPJ0PlIK2deHjRLH+zRcMkKMgO6VF5ky89vNBmhA0fM8hofdJWE2VH0Ce5gRn6d4NchWHWY+ejSebyIkovqAUs53ZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Met4QhsbXv3thN0cscjnql2ajHPodLBp8dzJxRqHbYs=;
 b=ewg0/87Lm1ZcuQd7NbL+KPU0KPc85Heu4nfrkBFVLbhyFaNkP2IJ9AA8+QQUYZAxC1AKx++fAqwfTHTVT4jH+jk04jWb5u2pZncz3vyqmb1fjb+dLN+ccz+rGBpL3+Rd/orlOLe2Ru0pU//8Fp3uZTpz0kACU7TsJM91iYyi3Fo=
Date: Tue, 30 Jun 2026 15:39:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86: kexec is PV-only
Message-ID: <akPG_67-QSnYfKwV@macbook.local>
References: <36b16760-8888-4fa1-b486-2fa14b60053d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <36b16760-8888-4fa1-b486-2fa14b60053d@suse.com>
X-ClientProxiedBy: BN9PR03CA0490.namprd03.prod.outlook.com
 (2603:10b6:408:130::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: ae265a48-3f13-4fc9-070b-08ded6acf9a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	XAwQw+ktQOPlOa9DEfeuiDZTURwthDF/73pdPbZvn1mT7q9P2zHLw9ZgietGh1pl2XcOEu8G6i4lidtH6BpD/jbm6HmMY9jnhKRYTSizPbA4ecPVIn1unIAE9YJ/gozUlb+hgILyeWw2hAAHdvhpcHFjAvQloeG2QfJERTxCXBvJ0tKgiW5fi+sENAK2MMtpd7NHNwzEbMtPsG/YdacFm2IsoMtX2wvHLqBWNr/SpL8EhYUVLle6zyhW7mIOSZ5Nikvh1jujhaCzTqzbaPRQO2ExbJhu8Gy43nEJpY4byEP4zycXH2Vn3B52fpjtyIAIJd5sURynoYbcx9JDzy5Bw4KOEK2wqgbNeRLrJwXHp3OsxeQk1xTTmi3tU4DWQNNq7sJXGq3jLouf2SqNKKGGN9xt8g1udKPxhhz2Inw2MMcO9RfASXjhU+Qua4ayCrTRpCSDbnsy9vq091KC5wz3BqjJaHvNFtzCczfNyqn7ns+UWOgGqDZWZYnpVNK3wHxsyAhkDb1b58Jj97HoJWyUtNPTkGZP2WJY8lVKpBH01hSNSEqMkHmVzdnLefRnXXa2bd6LiAvyPlHU/BCz8W8z/ksXxNoNbdseuXvis/SLRLsz2XvUds9uohHxLFlyUlChhVI3lMWRUjmAF771D1f4nOXYP6hg17ZpMUhJwoUoQy0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjBRWjh1b1RpenJubS9ValVuY1BxOGYxOWtxTmsyekpONVZmQm8xRVRVb0NN?=
 =?utf-8?B?QkMvb3NTbkRadzh5SHVoc2ZTVll5V1JzejJtRmp5ekVLSGxhL3J2cHhRc211?=
 =?utf-8?B?TXN6Z0V5SFVWamtLbWV0OG83Q2hGSlNzTU1qVFJXZm5JSy9jOFZzRE9MWkox?=
 =?utf-8?B?cUl6MzNvS0NvMHFqSytQanNUbmR2R1NJWGRzMkxpaldCSU4yWmoxOERXU2dM?=
 =?utf-8?B?ajlkdEZ6UzBwR0ZvU2JEeWloK25oNGFSclMvRHpBdmZPMnRiemF3MGl5MFIw?=
 =?utf-8?B?SmN5Ukp1dFIvQnIzUUxWbWJIRTRIeFhQdE1LVlVsdjlTVHFncldCTVZBaGRa?=
 =?utf-8?B?aWJyT242d3hBQ1pWek94Rmt2amR4by9YanBFM0dEdytpNmhadnlZbUk3UDNr?=
 =?utf-8?B?NnJFNGJPY2hFTUY1ZTcwcEtXT2ZuSzRFUVJSczRBSkpacVNxU24wdnIrMlBV?=
 =?utf-8?B?KzRMTW10M2dJT0plU1pxdDJNY0RtSkdIbFY1V09sbXlkdmI2OGUyZnFhK3Ix?=
 =?utf-8?B?VG1YemFpT2Vua3JkNzBKdDJVRWxra1h2eHNIWjJTcVdibGxjK2t2MGZJbG5j?=
 =?utf-8?B?aW4xK2kzT3Q2UkR6YWRpSDVLdGpmNzkzaHhVSmQ1TEVMVkhOaDd0aTQxTUk2?=
 =?utf-8?B?ZkVZR3RUTmNRZER2bUlWWW9yZGFUUVdhK3NGYVk2Q3JoZ3YrQk9oNlJBWVpl?=
 =?utf-8?B?UnM3V3NhN3M4UHVEbVJoeXFPemZiZWE4aXlWblh6d1VsZ2dsOXdhcDZIdGRu?=
 =?utf-8?B?MHNPeU9QM0FQTjNGSWp5VTFWaGZQQzdheHYrWFRncVBBWFNRMHRKeVhnTXRi?=
 =?utf-8?B?RXpjMDZlcHhSZzk4dmlPQ3dJL2Y1dWJ6V0pmZFViTHR0cjBoRFF1MHFQNWw4?=
 =?utf-8?B?cTNFaVhiNStUYWZUNTcvTi9TRFg3Z1JGRXpXbE1HUmEyNDY5SkFDUmsxVVkv?=
 =?utf-8?B?NTkwWlN6ZVovbzhZM0lsTlZEZ0xqOEp2aGl4d3JEbThOZ3lleGt1ZmVVWjJS?=
 =?utf-8?B?M1orTStrMDZ3ZDlROFhoMExFV2NqdmJzOUlrcHRydUpuZ1MrRy95L2NETWlx?=
 =?utf-8?B?eGR2YmJSUmpqaE5sVUVRNjNILzMyeFRDdHRtdjB6OUVuT2Y2NGlEMzJNNVdz?=
 =?utf-8?B?czhaRkxYWkhVcXR1WlBqWmNtUEtLczFObmlQVm4xR3B1dnNpbHBHSXNiZ200?=
 =?utf-8?B?VjFYcG04M1ZtekVTUFI2c3BJYUJpWDhLeVJERWo5Y3J0Z2lmSy8zRGtCYzlp?=
 =?utf-8?B?OExOT01oMjhNVWpxTWhxNUltNWtzWE9JOW9vVE1seEp5MmJuellYYmphREps?=
 =?utf-8?B?ZFViUTU5dkF5Ui80QXpRV0NXcjVudnVXN3pFNnFaSndjUURPUk1WZWpMMzNC?=
 =?utf-8?B?cG5tbVFYYkZiWU9oSFI0QnFrMXBRYzBrb0tOOGx1eFNwNWlNUHFhMDdBc0dR?=
 =?utf-8?B?WXBGcVNGUFVmaFlhbjZmR25wRkZQZUhObEFLQnlFVS8yMHZzUE9qeXI0azVJ?=
 =?utf-8?B?SllhL0lJelpDNXIyQzNnZ1o5NFc3R2o1ZTBqNXAxeUhQNWZpTFd5eS9wQXU2?=
 =?utf-8?B?RmhwaW9HbDAya0dJeVZCdlBxbUJBRml6V3o3S0krWVlrNTNMdFBLWnllV0lC?=
 =?utf-8?B?STgvZC9ZNEVPSEdSQ3YwSHFLamh0U0lPREZSS2duM2JncDYxSFNWblFrZWVn?=
 =?utf-8?B?eVdJT1p3LzYwY2V6QjJBTytqc1FmUUxZWkFjc29MVUw2RlJZNzFFUXZoRzdI?=
 =?utf-8?B?RFBKaEduUkNWTm5UaW1EMnU0QjZQSldrb1VQWEtNV0w1ZC84eFNrVzdncTNX?=
 =?utf-8?B?bWJydWhnc09kSUxtV2dZWmhnM3JPMlNhelQwaVRhSTVoeXJXTFFHRFh3L0Za?=
 =?utf-8?B?cXhmV3VTS0JqajFwdUh0NHZsL1lmZkxKY3lpeTA2emNhYWpxRmZkdlFBWjVX?=
 =?utf-8?B?RnNiSGdSR3NxalkzZ2NrSzhPRUt3YWxQY3N1ZGVKUkdBczlZMzZDMXRibmVJ?=
 =?utf-8?B?bHh0cmd3WjZ6R0EvdXYyZFU3cHFwMW1LbG5GdmR5TGJjeTl4SHRqa1REdmdu?=
 =?utf-8?B?WU5VVkpFRXdoSmEweFE5bC90OWUwc0FPMUczVEVtbkRhUWRiWnpxQklva3pD?=
 =?utf-8?B?VXVraXR1NGJlR0xBbnhFMTFzWHh4NkFSMzkwRGtkbWhUNW5KdW9oSUJnMVpN?=
 =?utf-8?B?T0c3WmRIcExuRFFrelVpdGRyUGxid1ZoZTdxUWphN1VYU1ZGVW5ZRm5xN3hG?=
 =?utf-8?B?aUppTXREZ3hFRlZMcHNLS2pjRWVDTWQ4d0J0eVpNWUtxOUh2SGxtZmZRRzd6?=
 =?utf-8?B?VEJuYkhlMXZKR1lwS1Zkc3JzZ2JSMHBXdEZ0V0oyL0FSOWZ6U1RHQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae265a48-3f13-4fc9-070b-08ded6acf9a1
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:39:14.5674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjoJriUTY8WZ9kom07M+uyO719+PYM4TCivVqWoYnc4zzuK1LhES65QLnpGkB6cfzkhZxsC7ycQCrC04KaAdZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6615
X-purgate-ID: tlsNG-ebf023/1782826757-2F15F1CC-9387E857/0/0
X-purgate-type: clean
X-purgate-size: 440
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,macbook.local:mid,citrix.com:dkim,citrix.com:from_mime];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AEE56E4F10

On Tue, Jun 30, 2026 at 03:35:12PM +0200, Jan Beulich wrote:
> Kexec is of no use without its hypercall, and that hypercall is wired up
> only for PV. Allowing that code to be built when !PV therefore results in
> a lot of unreachable code, violating Misra C:2012 rule 2.1.

Do you know what's missing for the hypercall to be functional on HVM
environments?  We would need that for parity between PVH and PV dom0s.

Thanks, Roger.

