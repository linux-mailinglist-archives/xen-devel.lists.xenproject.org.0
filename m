Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 38z9E2zEKmokwgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:21:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB807672A94
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:21:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=KWUVisbR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1335618.1597810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgHM-00035G-VZ; Thu, 11 Jun 2026 14:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335618.1597810; Thu, 11 Jun 2026 14:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgHM-00033n-Se; Thu, 11 Jun 2026 14:21:08 +0000
Received: by outflank-mailman (input) for mailman id 1335618;
 Thu, 11 Jun 2026 14:21:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXgHM-00033g-1t
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:21:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXgHK-006jUr-Sk
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:21:06 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2ac44d-bab6-0a2a0a5309dd-0a2a4505e434-24
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:21:06 +0200
Received: from [52.101.52.0]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2ac451-aaa8-0a2a45050019-346534007a3b-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:21:06 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA3PR03MB7762.namprd03.prod.outlook.com (2603:10b6:208:507::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 14:21:01 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 14:21:01 +0000
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
 b=A1x2oYA7KdqiaODtGrUWfVuVSNcGz6jEh/rppUM3j80g3BQkZvH/W5gZTBVU75ESj3XrCi47xrAxnMS09z8vQgYZLs5RoT6SHJw9xowxNhz/i9I+Q7m5GWhLmulAhCbZzRzZIWJePCCXTXYJW9BLdiGxr5IhH7lajLYyypAWSQQqgmMMAQ1EWG2Bv11HgitnP23M8UiPmE+iifEXyeWQGkN++H8rxNAIcjNrr1XyS2YSYPvNRzXi0PgUfurch4yHZSPEblE/aTV3OLfSgTMTEIrxYpw+ik/nBxJJ1+OPSHAajxSel6zDEpTxRPVuIW1kJNVKsva/y0kBWml7u/D0ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKsxN/lRc27+NZHDKUQc73SxfuDFyPo67W3xsWBf27Q=;
 b=Oxk/pB9Gx/gWFcXizWj78ySvQfUvUhQ5ZKbwmGPQYgOxSkXYGl4cvphvWMygNRPAdlem0UZ41zZ8qgjAiNYaW71NurW2ogKSNlQF+4WN5KLRk9y153JBB2h+QasDW10OCO9zS2ZS0ydh0aj/pRuzY1t04SySyvukHHwK6rDk5uILlkmxgtd8s6Yr4VYhJAHk3txcr2NqoUfdsWkR2KEpLrGPORohRoQ3JMa0BjOYZmFmxuNQRpasZB26FZU90CEbw+5Jvsir6iOZnKl5aGVrVHDEEHNijBdbf6hPrqQUs6NRFJJf0yyV7ynA9lpJNyfSY3gnwD0f+O2qvWZuh0kY0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKsxN/lRc27+NZHDKUQc73SxfuDFyPo67W3xsWBf27Q=;
 b=KWUVisbR3BfcVwidtSMsO8NA37kAjzyuQ5gcInErf0ScJ/7ApCbIdZoag6WrdHzp0FaEmGRGEl+ooRk3ItQNpqbUX70qn+LWACQIRQ2UIeI2uQ9Run0V44xtX7/mcbYBlgqBGlwXcf4EShj5+hUCBiMDsYFGGtoLDlRRb5v/aY8=
Date: Thu, 11 Jun 2026 16:20:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 2/2] domctl: Handle some of XEN_DOMCTL_shadow_op
 without the domctl lock
Message-ID: <airESvOliZS6tSch@macbook.local>
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <20260609151528.2426788-3-ross.lagerwall@citrix.com>
 <987f029b-02c0-423c-88fc-2e588f03a5bf@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <987f029b-02c0-423c-88fc-2e588f03a5bf@apertussolutions.com>
X-ClientProxiedBy: BN1PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:408:e0::27) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA3PR03MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: d98fd397-3893-401a-9a5d-08dec7c4aa03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	M68FHFAeGDfMiRVxS0d0JlD0HOM4dWMgrQTptOWGT9e4HtqhoW2y44i4MBJ2o2V/Y0zFhmNypfmHYh5EzZ9sW/o2JW08llLe9Y/XO2qkAo47U71W8j/7+Z2qmPkeK7qlSLnCzLZ2WFyn8Uj1PdSRlpS7EwjjQSCrrEEzUYH3cv7cWURwD+146Ubb2+afsWr6XXdOBR+a7MX3M1RGB6+Pz4PdGo8VlTQ7LVy1f1PeFbwrfbfCIX12WNrZ7ai5CyvKwgnTwBDue55TZIORlznR3XQMaV1pJyvkLfNfQghLrIXwRNNwYsEW62Dxo3FJ3P8rtRwZHJM9wjA/3oB+iFDpqiQUIvK9cZN689HRhqYe+dMpZCPPLzAcaKa0PdZAnqlx8qS4kF/xHIAdag9rJo78wLHhtu4+kdsKvKCEATeOofzZwYtucqEt9M0Hm506CsZrlVU1WhbnzW56rrIGJ6qNyloYzOd2+a8UfZDoZca2VVQ/8/6bosaMa2RQyE9haalfBT4RtudnWvI1zJLijls3l4XxCz0QR+RA+pZRI7FlkzYU1MN7D/DD6a7FDBrYuCf2O77wGqRXMOZ8+MEw7PqrwmFhoy1gw9FW4DiZ36HQ1sv4w8hEcZ5LNLXvxJ4hdfnWmLYknSvjWkQhYoYy1N2B472r35eAh7kfyuU285K1DX0/BEl2lhYG5Jm2gmk1f+yM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkJNV3lJYTZzR25pRnpWVFZucnJtcHNPSDZPbEtYUzRwUVlHOVRPbncrSmRm?=
 =?utf-8?B?Z1VlRkx5S0U2Qi9KUFZRMk1YZnUwdzNhaVpXbkR6OUFrcGZRcTZmMnpuT2t1?=
 =?utf-8?B?dGtMdWxTYkVoSzRTTk4zVVFPaEpEM1p0bEY5SXlOUEhlaVpZZk4zMDBKeXVB?=
 =?utf-8?B?UGVWUm1IVk1pY2RVaE5xeTNwVVZTcTIrSGRFR2NUTXY2NnpUVzh3RmpvK3k3?=
 =?utf-8?B?eEx1OFA1TTZHeVQ2YnU3dk5BTmNlYzgxSWVPSzc1eDZjNDNmOE9ZUjBweFJM?=
 =?utf-8?B?VlFUVmJsOC9RUmxmNzZLYWh4WGwraUtlUnhqelg0ekJrUXNNZzhwSHA5aFZq?=
 =?utf-8?B?Yk04Y3l2ZzZ4RUxjek9MeXR3aWROUjBVZXJ6V0tyNCtwVDFhMG9KaTRnQVpV?=
 =?utf-8?B?dHc4eDl5YTZiYkhVaGVBayt4VFkwYndRbXdIM04wck5RSXRmakZsVjhZbi9I?=
 =?utf-8?B?MkJzaGFyWk9VSnBtNUc0alo2K2NwQnkrRmZ2QTlYbjI1eHBMclorUXJsRFlM?=
 =?utf-8?B?U2hlMHhTYW5UUzFIZDdScjNMRkhTZnZ0cTNsYnJ5alVYL0JLZWNrbWV3OEZM?=
 =?utf-8?B?RFdyT0dDV2JlYWdVVUIyS3lRZ05ISk1HRXovWm5rSHlXNXFSand2eWFCYUVy?=
 =?utf-8?B?My95c2VnVHEwUnZETTN3QndmUVhkdTFvTndKYUEvVmgyNzFDWjJCL2wyNHFK?=
 =?utf-8?B?dnhkdmJBV0NFMDFjZjlHeWdvTmlMOHIzUXdEUG5YZVdhNlVEVGUrZEdSUnFM?=
 =?utf-8?B?TDkrUEVZRVhzcm5PdGNMZ3lBWHRUTDJoZDRJMUxWYUh3STNmYytaRnkvQ0lx?=
 =?utf-8?B?VzJTYUtyQVBpeHFPZjR0UnplNEo2UlZqUG9UNGQ3cjNkaDFYRE1uaFlQSnYw?=
 =?utf-8?B?dnRKL05UWUcvZkpKMmQ2NXNVVTZ4Si91RHZ6MmMxMEk5RWtoQjAwdzF2eitr?=
 =?utf-8?B?WVd2b0NWWmw3MkVkQVN2aER3ckNLZ2dkaUY0NWNYQmU2cjhTQVh3ZGt1Z0tF?=
 =?utf-8?B?L3NSdHJMcXlIQ0NLZHF4b3VGdStZZzdVZ0c2cG5xaGpNeGZ3SXZ5L29jYXJi?=
 =?utf-8?B?Q2NjTFljSnFORFYyRnFiaHk0ZHM1RW92NzBIYmdSYVhjb2ZZV0UrSmVCM3ZM?=
 =?utf-8?B?T0UxRDB5eFJsTmNOSUJYMlRYbnpXK2pIZ1pzYWZybXVqd2JPalVzQkx3SDJp?=
 =?utf-8?B?dm1wckphcGQ4MzdLdVA1YlY2UVU0Z3NRdkVsOFVsUmc0TnBCdjkrQmg4aER1?=
 =?utf-8?B?NjVDZ1ZadklzSXF6Q2dJSGJ0NnBsZmJmSjJZU1lNOC9iZGZPSUlaRW03WSto?=
 =?utf-8?B?OEtFM1hrL2VSdWVOTkc0OVFETWRSNlBmN1laYXVnK29WRFhXL3orbFp3V0F4?=
 =?utf-8?B?VG5UZWtkMFNlRk96TWJyZHluV1dKVEhvc3lTVlJOT1JMVitnU1g2QnBtaVFL?=
 =?utf-8?B?UmozOEhaUUIzR0EzZW9HK3hxNE5SYWZPWDltZFpPT0JmUW8rOXQ5clFiUDQ0?=
 =?utf-8?B?dnE1SW5PSmozR3k0NGoxeEcyRTY5a3VwNXAwQk1zL0lVWE9DaXRINWNNenpF?=
 =?utf-8?B?Z21wS29YSkVmbmdmek43UWgxTnVzS1YzYWlQOE1TUzE3bGtRMm82eldqeHVn?=
 =?utf-8?B?R0RFVDBFT3V3ZCs3NHBnSWpiUlFsZGtqMy9zdE1pMlVjQjcraVRaNTBORzVX?=
 =?utf-8?B?WGtyajRCY2U1TFRhT1E2aEdPRFJURmpCc3R2cVFtbkdhcThKbVF5cG8vczZH?=
 =?utf-8?B?eC9GVGFJcmVqeVVSZW93K0xBOUpBMnlDWnZLYTZuYkcrYXFCWnI0Q0ZuVkd6?=
 =?utf-8?B?TVlTNVE3Snc2K1JkYXhBNzN2Qng1ZU9mNXZKVUgrS1JMY0Zncms1dktxWGd3?=
 =?utf-8?B?M2JLM3oxTnZVejB0djZ3MzE5YTdIb1MvMWFyMU1UWUdIQm1qOTh5SDNZU3dS?=
 =?utf-8?B?T2dhNlg1RlR6VXcxWUxPcFpwTEY4SUpRb1dsendRMGFxMVhTWnZkMXlkTmgz?=
 =?utf-8?B?UTlDWEd4S1F0d3k1TWxpWm8xL3lWTVdWckJIaFVYTzNsTWxxMldpRnNuck9C?=
 =?utf-8?B?ald2ekVUQmMxZTFVSVdjL1FxUEtWWFFvZlc1VkZTeU9qNko2cndpL3RabFp3?=
 =?utf-8?B?SXJHaW1kd0srSlluUHY0MzlySmozWDlpWjZqMnVldFBqVHlFS2cxUkM3bW1E?=
 =?utf-8?B?cWtqUHpzMDF3R2hKWXJsQ1pKM3djOG5FekRkMm5UZlZwR0hBZUYzeDgrdEhW?=
 =?utf-8?B?N1FuUXNobUd6Y3c1RFNDLzNnek1la2FtRk1TcTVTU09ndWpHS3dzTm9DUWFp?=
 =?utf-8?B?ZEsrQXhmTUZXUHJIVFRhQ0xHVW02YXMxckpoK1BjNWhpaWN3U3V5Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d98fd397-3893-401a-9a5d-08dec7c4aa03
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:21:01.5957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qws8PeElKIvPj7vjF+CHcBZTZTb1a3yrq/9tfyNepKDpLTXlB6BUVZSxRNA6fn12vEUEm8uYCMsM1QYTFin60Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7762
X-purgate-ID: tlsNG-c201ff/1781187666-D937C443-837F87A8/0/0
X-purgate-type: clean
X-purgate-size: 4001
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,apertussolutions.com:email,macbook.local:mid];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: AB807672A94

On Thu, Jun 11, 2026 at 09:18:15AM -0400, Daniel P. Smith wrote:
> On 6/9/26 11:15 AM, Ross Lagerwall wrote:
> > Handle XEN_DOMCTL_SHADOW_OP_{CLEAN,PEEK} without taking the domctl lock.
> > This is safe because for these subops, the paging lock is mostly held
> > which prevents it from operating concurrently on the same domain. There
> > are some parts that are called without the paging lock held:
> > 
> > * hvm_mapped_guest_frames_mark_dirty() - The function itself takes a
> >    spinlock so is protected from concurrent calls. In any case, it will
> >    mark all the pages dirty as required.
> > 
> > * domain_pause() - The toolstack cannot unpause the domain while in
> >    paging_log_dirty_op() because the toolstack's pause/unpause ops have
> >    a separate ref count.
> > 
> > * p2m_flush_hardware_cached_dirty() - This is called elsewhere without
> >    the domctl lock held so holding it wouldn't achieve anything. It
> >    should be fine as long as it is called at least once.
> > 
> > * log_dirty.ops->clean() - If the callback is hap_clean_dirty_bitmap(),
> >    then it will hold the p2m lock while modifying the table. If the
> >    callback is sh_clean_dirty_bitmap(), it will hold the paging lock
> >    while modifying the table. In both cases, this is OK.
> > 
> > * domain_unpause() - Same as the earlier domain_pause().
> 
> Please add a comment that that xsm check is to continue protecting the
> sub-ops with XS_PRIV.
> 
> 
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > ---
> >   xen/arch/x86/mm/paging.c |  8 ++++++--
> >   xen/common/domctl.c      | 12 ++++++++++++
> >   2 files changed, 18 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
> > index 1a5822808620..bfb5b423a0dd 100644
> > --- a/xen/arch/x86/mm/paging.c
> > +++ b/xen/arch/x86/mm/paging.c
> > @@ -746,11 +746,15 @@ long do_paging_domctl_cont(
> >       ret = xsm_domctl(XSM_OTHER, d, &op);
> >       if ( !ret )
> >       {
> > -        if ( domctl_lock_acquire() )
> > +        bool lock = !(op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
> > +                      op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK);
> > +
> > +        if ( !lock || domctl_lock_acquire() )
> >           {
> >               ret = paging_domctl(d, &op.u.shadow_op, u_domctl, 1);
> > -            domctl_lock_release();
> > +            if ( lock )
> > +                domctl_lock_release();
> >           }
> >           else
> >               ret = -ERESTART;
> > diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> > index 35144d95b808..a3888c4e87d4 100644
> > --- a/xen/common/domctl.c
> > +++ b/xen/common/domctl.c
> > @@ -559,6 +559,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >           ret = arch_do_domctl(op, d, u_domctl);
> >           goto domctl_out_unlock_domonly;
> > +    case XEN_DOMCTL_shadow_op:
> > +        if ( op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
> > +             op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK )
> > +        {
> > +            ret = xsm_domctl(XSM_OTHER, d, op);
> > +            if ( ret )
> > +                goto domctl_out_unlock_domonly;
> > +
> > +            ret = arch_do_domctl(op, d, u_domctl);
> > +            goto domctl_out_unlock_domonly;
> > +        }
> > +        fallthrough;
> >       default:
> >           /* Everything else handled further down. */
> >           break;
> 
> After commit message change,
> 
> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Sorry, this was already picked up in a rush to get it into 4.22 and I
didn't realize it was missing an XSM maintainer Ack.  That's entirely
my fault, there was no intention to bypass or overrule your opinion.

Given it's already committed, and there are no objections aside from
the commit message adjustment my preference would be to leave it
alone.

Regards, Roger.

