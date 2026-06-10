Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1kqVGO0hKWrdRAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 10:35:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C51026673DC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 10:35:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=GrdbCLvo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334043.1597148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXEPI-0003km-FC; Wed, 10 Jun 2026 08:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334043.1597148; Wed, 10 Jun 2026 08:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXEPI-0003iM-CO; Wed, 10 Jun 2026 08:35:28 +0000
Received: by outflank-mailman (input) for mailman id 1334043;
 Wed, 10 Jun 2026 08:35:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXEPH-0003iF-2W
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 08:35:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXEPE-002Cyk-U9
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 10:35:24 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2921c6-5cb7-0a2a0a5109dd-0a2a450ca894-22
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 10:35:24 +0200
Received: from [40.107.209.33]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2921ca-62f1-0a2a450c0019-286bd12197bb-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 10:35:24 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA1PR03MB8357.namprd03.prod.outlook.com (2603:10b6:208:5af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 08:35:21 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 08:35:21 +0000
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
 b=ODQdQXfdSXafDHvhIeRPgAErYDAx0c1AW2LQ7Ua6Y8ElQPuMmP8a734NNlI1gWnm2ePMkznnbzRBK9IWILeu+YfMvdctrO5CgE/ksbE7eQdL6U/w6/pRp1keCMYUBDkrYLj6BnRYl+PKPNytlq5kv7J7K91wTuni44jkM/kLRVElAPSdG5Ywfon6j2gxqguwSMCGnAtnMDG16NbnD1v96AYHGNMoHhlXLONWfYYsQ6aJrWNfHurvXpqln8kE581yHouqgXujR5tWFV1ORvSFe9DvvqkNNeiTMzLJsHq9XrLKhKDI+3jQQV2GLyRflPjo+/t5eQ35dfHkNQSaEhb7uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTYXo62toH32kokY6IG22glmgp1L3u5fR7iuZMsSv1s=;
 b=QXjgig/DpIVnpWm2quSLYjPx2fNfjU3cZSTLwwPneQvCGMu7tWETyDs2Kh9PqC5YOwj4J364+D74t2CvhJDnO2eI+sGChGbFACDrIfDaOOe25c8PdkgYLRLnRQ+hminU8KYTsiEFD77V3EMPPqmfDkaFx09PB6ExduqKS6JBLNMKr5APPxFksbwaEzOw4iY39iy8jxgLlhsgEb91SAorhZ56ik1qgUGsUjAtLmi6HcjfRZd41jber+TXNWvQlRiXXf8GPFkKovuB21ZtuHU+urp7ivCvHS3zBH9qgH/RbCci7jbtaUke3VMpoTZtxaLFqRty+UP17x0qI2nTcv9Bkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTYXo62toH32kokY6IG22glmgp1L3u5fR7iuZMsSv1s=;
 b=GrdbCLvo+ZyAEco4G8B5tsBVja+NWJHkeQ4k2S5sH0koSPDWsMncoA8NMuK/AzXfxBWL+VKHs8y5qx7an+tKzh+8KQ28Vt/VUVnTSmBHUAbidBq7I3vOWXIVD/SQ+7fXFtcivMr6M/BMzoN6E0xoOP2fENCXUqZ9btdFJdd4jok=
Date: Wed, 10 Jun 2026 10:35:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 2/2] domctl: Handle some of XEN_DOMCTL_shadow_op
 without the domctl lock
Message-ID: <aikhxaH3ZKyd33IY@macbook.local>
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <20260609151528.2426788-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609151528.2426788-3-ross.lagerwall@citrix.com>
X-ClientProxiedBy: MR1P264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::32) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA1PR03MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a12dd5-bad9-4821-21ef-08dec6cb3543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|22082099003|18002099003|56012099006|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	ReKF2mqsMqN/PlDxEoDbGbR1xNLVuF9Ko/mUy+1MVO3viafXaMsmpTT3WNPlcDwuBO4aC1m68mO/15RKOqBKezhU6giE+aHrHzXVtfQPUL3l/cOU0kbYFLIC4vcbz2E6AyCdywMBnslYM8sGk1vVWF0f2wHZqklBYfx+J8KXBQ/wVrpT7t6DxHm1mUMv7RZYMEv11j0S/lb9sHO3pdOD8B+9YU6zeRRm3ltacOgEM5YSuIYc5RDVCKdjXhzY0NK4K3bamuWaaR0OcCzmemtWWcdIaMdHZ/VQudv6nIDda00uW+HExJE3xxOqArKeDVacycPMTNTUCeDWSuchlU4Qjy2uxoLpGhOBaLq7rI3YQFN1ZjeiXP1i0P3AnxnDiyQPbqYTFforWITpdhXEEOKGePthm8X/r5hTD3vpnXgAz+boY5SSjTgBnKNsT51iqcHAMjSvX2uh55ERFu5EuCp9NGHqanI84al3SRIk677Wjy483RmqAmA2u/+0OJXK5VPPk8N3UyhEqlJv4CBQo1jSHo3PV6UpblM4nS0QbtrFYJaK+ad+obmumNNyKbfSOKaQ/Dx7yZPWpCV8IEduMifTqfeU6F1HVIpI8cFi7rg6Bmywd4XvfebkMWL3hY0I/SrKXnjRkNhhLLQenp/kbCBFupFX5m9uZVinagT8ZGioYjOz/SggdPtUg63Ym0pJfzb9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUZncStOMmJvc2lXQzlEbkJBbVVVekhrT1JBMk1zQ2JXcElaZTJTcHg5MlZN?=
 =?utf-8?B?RWUxcVlFNUZvS05rRWlBN01PUWxsamZVT3BleFBpVXF1Z0Y5SGxjanVubFgr?=
 =?utf-8?B?N25vdjI1T29DdVE5bTk1bGdXVFo5UC9mVmRPYkZHSUFWdXU1U2hNOUtmR0ww?=
 =?utf-8?B?dEJmM09NVm5rblYxazUvQnpxMWlXc0JJNWFtK3Vmb3FWRDJ6dUJHcjJVQ3N0?=
 =?utf-8?B?a0NubCtBRys5Wm9BZkJ6THdoRXorZXZNNWhMaysxcm10SDBSVFh3VWRxdFlK?=
 =?utf-8?B?UW9aVEZQV0J6MU1NTXpEc1hWOUh4THhIdHZ6WE5mTWFGNytIaEVBeEgzVWQ2?=
 =?utf-8?B?OUhtMzZaeFEzbjBPQ1hhbEJNNXNvNXBKRFZpTmdyYk5FaDNvKzFpbFRHcGsy?=
 =?utf-8?B?S1lCZVlILy9RUkJzN1NuVmZMSW1mTktZYzI3N3JDNDgrMDU0RjRDQUdGSTJ4?=
 =?utf-8?B?cWRuWmx5b0JGeDBHWVdOUHN2M3pVOWdQNWhMbHBFemtxeUgrOFhhTGcyUjFN?=
 =?utf-8?B?ZjFoaXpmRVJEYUY0OU9tT0oxb2k5UEpyaTl0aXFrRWZIaThSVkRrSnE4SStR?=
 =?utf-8?B?WDRDbXlyWFV3Q0FRTEtZSnVHN3hLUmFFVlN6aTc2R1dodDBjekczUUVGdE5o?=
 =?utf-8?B?MzBuMmNmdnJIdTIzQSt2ekJMZWJqdmZGUTZXa0RObzdlbFhlT2w5MmxZL0pq?=
 =?utf-8?B?ZklKTlRvRC9CbGo2WDlHQjQxbHFzUDlFSUlZTUVQQ2JKbWw3UVVvZnhUU056?=
 =?utf-8?B?QWVab3ZkeWdsdG5jRGIzM08rTDNaM25PMlN3MkNqYnY1ejkrSnNVKzlHdm8w?=
 =?utf-8?B?QzFZMHpOZnk5d3cvdHlIbGJDVmhBNU5hSzVUaUhsVWJIb2FtWGZ0cUJ0VGNK?=
 =?utf-8?B?NTJHSDhxQnorNDh1Y3VRNXdaOEU5NW1jak1Nd0lrcnRZT21ISVpOclhKNzRP?=
 =?utf-8?B?VTdKVUxpVGduZ2tEMFhTM3NGekthQmo1cTFwY2ZrYkVpbktTb2VIV1hGYy9u?=
 =?utf-8?B?SG0zdUtiQjROWlBydElnWUF0OVpPVHMvNTNOVWh5NUthTUVkNHlLUDFFYXZG?=
 =?utf-8?B?QVlGWlNnM1pRdTF3cG9DZkJTRUxNZGFQQk12L1J5MVZtME0yV01nNmRhamo5?=
 =?utf-8?B?d0hhSVRtY0UyTXVxOWVuVXRwZ3BRaGtwNjAzVUh0THVFSlJKWEViSFB2Y0hU?=
 =?utf-8?B?cGtMVExKamdINVBTWHlyNi9iUy9YQXpsME54ZmlUKzl2bGlDMHQ0YjVhc0xN?=
 =?utf-8?B?K21sODRRcDBSeko1TmJDZ29rWExOaVNNV3RaNFhJdG5qcDVpRWM2ajVKTFlj?=
 =?utf-8?B?SUJCeXhiSWFQd0VNWjZiSHZtTmxxaTBlUlpRMVJKM1ovS3F3RHlhZWxzNVZS?=
 =?utf-8?B?Z3YwUForWVJiMkRjMTdQMzA5aDYzNXEvb1VaUmlYLzJIcEgxUC9xSDU4NmVr?=
 =?utf-8?B?VnR3TUdDNjQvWEFmZGVuRVBFQ1NDVEN2R3FIb25aaU1OeGlFeURzYWJqMmdR?=
 =?utf-8?B?d1BBbXlMajArbVl5THRpL3J6U3luYUJrQ3ArRlh0OGJUTnZ6SHF1MjcyWFUv?=
 =?utf-8?B?OXl3dGc5THdSK3o2MXdmdWlyck0wcE9CY25IVkcyTGJXc1YxNHdVMTMreG5U?=
 =?utf-8?B?MGR0Mkx6dFhmTWt1NWpaZVhIdHl1TS8yTmVHemp1eWhJVytMU3B3RnJ4WTA0?=
 =?utf-8?B?cElaRlVEMVlwQkxyam9KSkZaWk5pMDBpbEpwYXNzTzl1anltRnVKU2RLOUY2?=
 =?utf-8?B?djFxaUpBbzB3UVl0Nkh3dVRld3p3Q3lraXdDT2ZwYmhXczdrTGdqdHFreURQ?=
 =?utf-8?B?UC9aRys1MjBRdEx0dFlUS1U4TG9nWUVXQWR1WnVvVjNqNG1YeFhlMDBTWjFG?=
 =?utf-8?B?eTJGcU04OTcxMHowTzdJY00wUlh3VHBVbzRVS1hleW51dWJFblFEMEVOWjAv?=
 =?utf-8?B?NWcvYml0SEhzQVNuY21qN2Z3cnJQMXVVRjFqZWxUbi9GWk5idllzcGJsZ093?=
 =?utf-8?B?K0UyaENTa0VrN3RvckFpdlNZWWUvOTlVSnpaNjZVVWpQeDBhQm93bDhvOHdZ?=
 =?utf-8?B?NEFLRmdOcTE1UE00azZaNWpCN2hFOHhRMk1KcmVGcGRsdlNJb09heWZmWVJi?=
 =?utf-8?B?ZzYzd1pRM043YjRHTktvYUY1VUNEakwybFJIQS9aY1BiMDRQYWE1c0NxWlg5?=
 =?utf-8?B?bEhLTXI2VzBYTE1Dd3Q4RFhQVmRRc25DbWd0TDEwc1Z6S2NJUHdoNmtXaVlx?=
 =?utf-8?B?ek9TRk5valA1eTVpbVlPa0RieERTemM0NXlZVHBDdjVrTjRNZ09sNkxVb2hI?=
 =?utf-8?B?WDJMS2VSM1FqbWVuV2JQSURYNjYwaWpsdnljQkpkcGQzMkIydEFRZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a12dd5-bad9-4821-21ef-08dec6cb3543
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 08:35:21.0063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02SX+5tRtDUe7Y+SOeKi77BVCZfK2Rd/EHBzNa5CvN4b4olMu9DGtajBux1JYBgNOFXoP6Obw2BEmlVdmgbjGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8357
X-purgate-ID: tlsNG-d25034/1781080524-DAF72CF5-1EADBC79/0/0
X-purgate-type: clean
X-purgate-size: 3774
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:from_mime,macbook.local:mid];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C51026673DC

On Tue, Jun 09, 2026 at 04:15:28PM +0100, Ross Lagerwall wrote:
> Handle XEN_DOMCTL_SHADOW_OP_{CLEAN,PEEK} without taking the domctl lock.
> This is safe because for these subops, the paging lock is mostly held
> which prevents it from operating concurrently on the same domain. There
> are some parts that are called without the paging lock held:
> 
> * hvm_mapped_guest_frames_mark_dirty() - The function itself takes a
>   spinlock so is protected from concurrent calls. In any case, it will
>   mark all the pages dirty as required.
> 
> * domain_pause() - The toolstack cannot unpause the domain while in
>   paging_log_dirty_op() because the toolstack's pause/unpause ops have
>   a separate ref count.
> 
> * p2m_flush_hardware_cached_dirty() - This is called elsewhere without
>   the domctl lock held so holding it wouldn't achieve anything. It
>   should be fine as long as it is called at least once.
> 
> * log_dirty.ops->clean() - If the callback is hap_clean_dirty_bitmap(),
>   then it will hold the p2m lock while modifying the table. If the
>   callback is sh_clean_dirty_bitmap(), it will hold the paging lock
>   while modifying the table. In both cases, this is OK.
> 
> * domain_unpause() - Same as the earlier domain_pause().

You could join both into a single domain_{,un}pause() bullet point.

> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
>  xen/arch/x86/mm/paging.c |  8 ++++++--
>  xen/common/domctl.c      | 12 ++++++++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
> index 1a5822808620..bfb5b423a0dd 100644
> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -746,11 +746,15 @@ long do_paging_domctl_cont(
>      ret = xsm_domctl(XSM_OTHER, d, &op);
>      if ( !ret )
>      {
> -        if ( domctl_lock_acquire() )
> +        bool lock = !(op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
> +                      op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK);
> +
> +        if ( !lock || domctl_lock_acquire() )
>          {
>              ret = paging_domctl(d, &op.u.shadow_op, u_domctl, 1);
>  
> -            domctl_lock_release();
> +            if ( lock )
> +                domctl_lock_release();
>          }
>          else
>              ret = -ERESTART;
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 35144d95b808..a3888c4e87d4 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -559,6 +559,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>          ret = arch_do_domctl(op, d, u_domctl);
>          goto domctl_out_unlock_domonly;
>  
> +    case XEN_DOMCTL_shadow_op:
> +        if ( op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
> +             op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK )
> +        {
> +            ret = xsm_domctl(XSM_OTHER, d, op);
> +            if ( ret )
> +                goto domctl_out_unlock_domonly;
> +
> +            ret = arch_do_domctl(op, d, u_domctl);
> +            goto domctl_out_unlock_domonly;
> +        }
> +        fallthrough;

Newline, and I would use break rather than fallthrough, if further
cases are added below you don't what to fallthrough, and there's
nothing to do in the default case anyway.

See for example how this is similar to XEN_DOMCTL_vm_event_op which
also handles some sub-ops without a lock and uses a break instead of a
fallthrough.

FWIW, I would also put the XEN_DOMCTL_shadow_op case after
XEN_DOMCTL_get_device_group and ahead of the
XEN_DOMCTL_ioport_permission block, but that's just my taste.

Thanks, Roger.

