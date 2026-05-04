Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJYmJjq7+Gnh0AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 17:28:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ECD4C0AE6
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 17:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300067.1574631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJvDs-00016w-UZ; Mon, 04 May 2026 15:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300067.1574631; Mon, 04 May 2026 15:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJvDs-00015V-Rn; Mon, 04 May 2026 15:28:40 +0000
Received: by outflank-mailman (input) for mailman id 1300067;
 Mon, 04 May 2026 15:28:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wJvDr-00015P-4G
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 15:28:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJvDq-00DNpg-CT
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 17:28:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f8bb26-bab6-0a2a0a5309dd-0a2a450adeb4-2
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 17:28:38 +0200
Received: from [40.93.198.22]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f8bb24-56b3-0a2a450a0019-285dc6162b39-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 17:28:37 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 15:28:32 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 15:28:32 +0000
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
 b=ecBERiwbEX7cCaGadpqgDDjvr0B3CEEMTFfyd/9/7ksB7AVBfAJ9e/02gRVvQUL1jWZR5Nb31CYYqzdgCbjsX3n3OJ17NgkmgQnkchd3kjHvWwBLdA5WyHuCcTTjcP8x9eJyZUb+4ex3ECp5uh9JG1AHaFMrpmkhxpcOJDta4YOOdVRylbTNQRqMYY22JdjNMVP6v+SaBC3l00xM+OgBS0lGRifK8zU47SNaCkb9t+08slGFSB1eiUxRyczuX0nbBrKj0ep91HAEBAOBZLTsUDcH2jzfC1mgFAm67M2tmY1JnUp03gZHGcH61TKSJSbneG5qoXEd1fu4vf9Qu10O3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JAb9tEbw9b2g2PZcWBDD4654VCnxzMyv7lXoltvcyE=;
 b=l2wpPga0YNMXdAxzP5x6P4sntkfWliTir+DvDN+1ZKRoUQomYmRhNffe7qHTasJZrHDjVDe8Dz6V+z8HLs0/h+WII94LWVtggN8ebi2yUhKtUeJ9Wnvjsdb1kQtB88oJ807VEQ4n7bzTPzL6hPlo/EpHMa5Za1sKn6+TGiD3ggxhGA16M2DQ8+fSZeTMIzlXroi2sYGW6ipPZLVWUdd7vmTItjceXJ9XjN9iaVT+KP/7rvLonyMHAWPsvpsGa259JSMzTkruFFh+5PHStREZin5L/wzbI8AQzd95GcCwp6Q0ADc7wdeyTE8882VO/RBDnkYf90n47KbdSg8hyPo7mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JAb9tEbw9b2g2PZcWBDD4654VCnxzMyv7lXoltvcyE=;
 b=Dt0OMrVOHHafO8aIB3EeG1eLRf1t7jnol5mIV8gHXxVCF+fwl6BJxJhgbfqpORrzPsF0V0dcheHnqWY7PgVR8eIy9OWy2od0gMES7Wj+dqK9RG8eYzxNj3d9q0KHa59NJ0uP5aTtbGR4G+SyFy4YHFcvWIuGBv+RiVg2/rv1zMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 4 May 2026 17:28:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
Message-ID: <afi7HUFoDYabM9VV@macbook.local>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430125103.401811-2-michal.orzel@amd.com>
X-ClientProxiedBy: MA3P292CA0067.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH8PR03MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 506a0db5-3ad0-4ef2-375c-08dea9f1cd01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ho8JL65yeem9gvil0hrQLOxzpMrSw8hvHqY+QAIszwh5Fxs93nnqRcKGr0BarRNgdouOKrGAnIXvMDeulr4nzgZvfcekvIMTremky+xTEt5XcgNJ8EaqVJE9u3gaFtqf+4cftA5jbkXrXIG+x4s4DHObjCE+Y/jK7DJN9p3ulv0uFM/ir77+U9M0zecCqCdw27kpA896rd4oszUcsMMKIF127XAxmpY0BumkKmRgpakLlQOR+diaLw8thnR+BRcvs4WlWkYBGGmTs5nsP1gj1u9Kb8of4lYZNG5I5CQsDsxl5dKw8M8XQkaMgJxgBpu7+sGEecc+eAReINK8ChRYMP45/5Y7E5hmKZzZsjWvkw/WxaY1u7j5UCqUIetunavZssPzH9kdaqThEn7Fv8bTtGa5c2ALwuMN6Ds/qnpADKnT8RLjoLHrEy/1bNxU2pL/6mpD3+jgEqMYo4V8hp56ZyQ6shLIMd8+G2m2JMSkNWgu0hn6dLm/x/M9CyBoHQsToXUC9spXt6+Pb1jsXYpd2E2ciqha/ToffGVY5lUTxwqXIJIupuRjS1i29CX1TPey43ESaveC6NGHIVdS8VG4Fn9xuOk/tiE50Jrip+w+NqM6zw/dak06EVBv0Aq0xOFcvPFVBAbSQ4mzZVoZJe/a0U2rht26nublkI4OoeFaEnf+Q93jJi1Vsq+di8NEUhCA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qjg5aEk2VTZwVjR1ZVNOSnpLMnNRdk04Wnh1eVVmWGtNTUhxMjA0aUY0azJN?=
 =?utf-8?B?YS9RRU5aTXdTSE1qOVQ0K1lKdmFaeVFWM2dUUzBqci9oMjZHSmhidEhNUjdY?=
 =?utf-8?B?VzN3c3N0TkJjbUowMCtVMS9iYm5mSzJ0cjhFSnRRS0Q2YnhCUUxIbHdkbmQ4?=
 =?utf-8?B?SFVsOEN1b0NySVlxSEtoOTZrSjM1UHBSd3VsMDMxU2xmazdNNkt3b1cwMXFO?=
 =?utf-8?B?RjN3SFRWKzlqNmF6NkFyTE52bUhnbHdKZjRLM2s3cUpkeVVCV0NnZVZ4RWhX?=
 =?utf-8?B?UTkyZ2NQVDNySDBnTzJrWWpsKzZwK1drYnJtNVg0alVHYXd6NU8vbHJ0bUVJ?=
 =?utf-8?B?Q2htQlphbTAvUEUvM3A5Ym5tTlFNYWVub1JJbWhhbTdJSUw4SC9mWTJsWVRE?=
 =?utf-8?B?VFI1eGlYMHNNWVNiR253b0dHVTlMZGNST0dSRzJFQmRXbTI3eHpuQW8zeFp6?=
 =?utf-8?B?RHFwUWllMDB6eTc5eFhsc1hPUmhxV2NjeE5Rd2REMW9MQzhocWs0bktGR1VF?=
 =?utf-8?B?ZldnU2hocDEybnN1cWY5TkJEdEQ3cUVWWGFGZlJ5N3JVLzk3M0NHMXFVUjNV?=
 =?utf-8?B?a1FHUSt0YzhtNlFHYWRmb2llUzBCMHJLc2dIdHJpbGVJL0ZIUWY4cXNpenpI?=
 =?utf-8?B?eUx5ZklFUitpM3Arb3VQc09EL1Q3dlhRWFQ2WXdwRTJnZGNOVmRFOHBrRVk3?=
 =?utf-8?B?Z1dsV1ZzenJ4U3JiQnBhNTlEaVJ5L0UzN3QzeDZHc3NCWjVGM1dwY0tmV25t?=
 =?utf-8?B?V1pkQnVpbXpGRk5Jdzh2SXl4cTMybUJsZFVFblhMMko2MVdScTl5dXN2a2FE?=
 =?utf-8?B?ZXZ1NTF0RzBWSG5mL0oxcEkyRzY5RHpYdmthYmU3QURodi93b003a0xlNFRN?=
 =?utf-8?B?TEdkNzZoSkIrY3BlQlk2OUZhSW52NlNUeG1qUERnbkswaHI2V0psUGJUbk96?=
 =?utf-8?B?UzRxYlBISHJYMDJpODQ5dy9LZHFrREtZcURJWjdTc2NJTTh5YUxaWFZONWZF?=
 =?utf-8?B?d0MxNmJWbzB0cElUM0VwSG8xc3FRT0Fwclh2bElyRDlPZVdybXo2OWRIanhU?=
 =?utf-8?B?bGYyVVFjT3NQM0IrZTZOUTVvek85L0ZSQWtMRnlPbEhXVUNLUnpGemxsdXEy?=
 =?utf-8?B?VEFLbHdnbi9MS2Y5TkR1SGZ1bjF6SGZwRXJuS1V2eE8wWTJIeTU3RWlBeHNx?=
 =?utf-8?B?VExYcHhDWnpDN0FSTE1UOHR0andXWE1hcGpZMy9sMXJ6VFgxZnZuZ3JuVWw0?=
 =?utf-8?B?VUlsSlY4T09MaTJlWStsMDVmSzB2N1J4RjJzL2psRkx6TWJIK3JSK3RBYU4v?=
 =?utf-8?B?MHQ5M0pKRkt6OEg5VktDNHZXandhY0tCUDVNU3loYzlrNXkvYU9kS2RaTTh6?=
 =?utf-8?B?Y3ZvTjFoakE3S2pMN2hkYVZ3RGpmbFlZZTBuMmF2RFhhN1Y2MnNjcFpJQTYx?=
 =?utf-8?B?dk1VNDVUU1MvaXF6VWdkZXZuQ09UR1FyeWNpU0Fwa2JCYW5tUkNqTUl3UDl5?=
 =?utf-8?B?RktkUDFyRlpPM1VmM3kxZTR3Q2pKNHo4SXpabG5tQkFFZHpYQlNNTkhSTHlo?=
 =?utf-8?B?aXpPaHZXQ1lSRHdBTVhManhkeDVaK29VZlpVWUxGSmNiSHErR1hIdWxFMmpt?=
 =?utf-8?B?S3g5dUhKak9tSDg0WUtqTDVJeVF3Szd2bW9GRDRKNkh0eFQxWlVBNzNkWG0r?=
 =?utf-8?B?MmUxK1hHV1IxMk9zSTZiWlNoOVFFZ3NFK0VHbWdPbVI5UnU3QVRZTnBGNDFz?=
 =?utf-8?B?VWRRUGRxVHdhRXNoZEhlbXpyTThuMklLcmFDVktNZEgycUR2TTUyNlNXMkZn?=
 =?utf-8?B?dXJ5T3dVSXpRSXFvOERiaHMxSk9wODRMUHZBbFhUTlBFcUE4NktWRU83Tjhh?=
 =?utf-8?B?VnJza0N0U3A1aE53aHdxaGJ4WFhtMUVtNWJQS0Vrbm12aFRPTTl0OXVZd1pp?=
 =?utf-8?B?SG9zMnRid3lIMnNCMUJMd0pMTU14TUVTYUFxQ0cya3I5U3ZTU2MzOXZwVXlJ?=
 =?utf-8?B?Ymw3eC9hUjk4MExhWDFnTGtFZ25KWE1DZ0Ezc2NoRVF2NmgzNEFlSEJBMUpB?=
 =?utf-8?B?bXJERUpPN0dLbVVueUxKTFc1ZmRnN1VMcjRqdkdkUjFpbUJSNzlZYWIzeHp4?=
 =?utf-8?B?ZEhxWjd5dGtHZ0dTWldQdFo5dXJBWEJ1SXpHV0hCb0k3L1Z1cGRZaHJiN0dy?=
 =?utf-8?B?NHJMVk5BZzd5VFFlUFdERThWNHZnVXBpNGY3cTFVSFRISXJEL1czUlpJenJN?=
 =?utf-8?B?UUU2Y1dKb3FJNmFBbTlUVlE5aUNyVER4ay9zcGJzWXJPU0dwL3ErT2FWUFh6?=
 =?utf-8?B?K1VMdFNpV2pMR1JUT2twWWlEMW10YUp1Rzd6amhHdjVVVHRjVmx0Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 506a0db5-3ad0-4ef2-375c-08dea9f1cd01
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 15:28:32.6835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V48/uX798n1xr5hJ9jx6XZDdWEH6dmZDltF5A2bioi/yQUuhuExFx6uVaqrThl03v0ftnjFvVDj5VuauCyImnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8275
X-purgate-ID: tlsNG-4011c0/1777908518-47F798B7-6D7B0768/0/0
X-purgate-type: clean
X-purgate-size: 1033
X-Rspamd-Queue-Id: 03ECD4C0AE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Thu, Apr 30, 2026 at 02:51:02PM +0200, Michal Orzel wrote:
> The generic pdx_to_page() and page_to_pdx() macros in xen/pdx.h assume
> the frame table starts at PDX 0, which is only true on x86. ARM
> uses a non-zero frametable_base_pdx to offset into the frame table (PPC also
> defines it).
> 
> Fix the generic macros to subtract/add frametable_base_pdx, defaulting
> to 0 when the arch does not define it. This makes the generic macros
> correct for all architectures, even though they are only used on x86
> today.

Hm, I assume this offset was added because the original mask PDX
compression won't (usually) compress the gap between 0 and the start
of RAM.  However the newish offset PDX compression should be able to
compress from 0 to start of RAM, and hence you don't need to apply
an extra PDX offset there?

If that's indeed the case it might be better to integrate
frametable_base_pdx into the mask compression algorithm itself, so
that on some arches it's a mask plus a decrease.

Thanks, Roger.

