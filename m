Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BWEA8ha12lqMwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 09:52:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401AC3C74C6
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 09:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276738.1562058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkBj-0002Vr-II; Thu, 09 Apr 2026 07:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276738.1562058; Thu, 09 Apr 2026 07:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkBj-0002Tj-Fd; Thu, 09 Apr 2026 07:52:31 +0000
Received: by outflank-mailman (input) for mailman id 1276738;
 Thu, 09 Apr 2026 07:52:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wAkBh-0002Tb-Q8
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 07:52:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAkBh-000KXH-5p
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 09:52:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69d75ab7-e002-0a2a0a5209dd-0a2a450ae7d0-22
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 09:52:29 +0200
Received: from [52.101.56.61]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69d75abb-ee98-0a2a450a0019-3465383db269-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 09:52:28 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6221.namprd03.prod.outlook.com (2603:10b6:a03:3ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 07:52:25 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9769.014; Thu, 9 Apr 2026
 07:52:25 +0000
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
 b=M1V4Qbgqix8rfr4w6A67NI8tZHFyr9aF+1AtKqJx04jsPv6xn+6+8tH+fDkI6uooQ6H0Uz5NAvL11jrEXKweUKXgo3AH6G3GvU0SdgxNSMSK97aVDqsv4NeoK6AStORfQBhFlnEGbdXSp0TgI7tGGnpde3sz8t6DXy3u0gk/rSNSWA74FVEYw4WxDwqxe541uoll3vCbMPxRfo75jDzdhygghZL29jkc5Z4gdo/vYhjhksfcwsDKioCY7CkSHJGjBFtcC5EW1JlKiCZoeApzXia5q1GpGWMXE2q17EPH+4xVYvRQYIUcgUAZJINfzzOAo/MesI6fm9OBiGqktX2kkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cAl1/K0W7o6SLMZDfrL1uSCh+QCcLnxQSrjxPegdRY=;
 b=ojJG3n/i6RMNj0Yn5j4n3sAhr8J1H5az3Fe5W1noybHt0kYZaS5RhoTGSuuG1QmPz6bDAwiZsOW+jJBTTMb7iR5xhrIqMPrYtqr9FqwhH3HkjE+4+WnaoQuWKDdeYam1S91Ihu+RQMfOGjqtK41YarWc5VMjsQyFSsKcL86XA7H0zAvmmbSHR4FvVhxcGrGW3Yc4MJ2Z1sK9riF8fUd8qXUHYTBmYPlOnwAJEwigIzqdOaObUFg+WaD1ShNxkrO8e6ftViIbDY+iXAo0Nfi6y65rlCC9TwVM3cqbmFar3jkI7q+0y/d9wH5qOODM5Wa/jSOXEa6P0tW1MrW5cbQHZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cAl1/K0W7o6SLMZDfrL1uSCh+QCcLnxQSrjxPegdRY=;
 b=vJ6L4EabEQeZdWtvJI0gCE7ZshB4iKWZlBzGHyoWMSSamEJ7dHhmwhp4b/MOz4Tgwv4BLxWfqDntvXFIC0tGxVV7rxzf7EWUlA4zCuZC4tseObjNZIXptj76StFUScF8R556BsofMK+V47R1a4dR908HmFM4f9OAGpSfwNAEsNg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 9 Apr 2026 09:52:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] make ioremap_attr() common
Message-ID: <addasqowkczVjsE4@macbook.local>
References: <145299a0-b25c-4612-82c6-9401a2f88ad2@suse.com>
 <72526f3a-726a-4a1e-8d80-1a336175c1af@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72526f3a-726a-4a1e-8d80-1a336175c1af@suse.com>
X-ClientProxiedBy: MR1P264CA0194.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::9) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca98d2f-8971-4231-9966-08de960cefa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HTkKnLeRqlFi9Mpo51yw7h1+3cF+yG4J3IfB61wWYgPnKKA+epOibrgUjTP1kdCHOH4S8yjoq/seaC7y8I3cWxhYstWR7mm76+qLbFJ7rk4g6K5gGXBJDqtDYVZcia5RdvNUlOWMUxtMx0j5F1gieNLz+eQA8/yLWZ8ECUMysmawYog9Oi5DciEP8bLDHBH+QcH3sPO/A1S5S1Cq0pj6cxLOX3tNOd9QOzNVvWYao20Ym/5Cbws5ZK4Yc7A8E+GLAl86CiuOBfs0dy8r7SMgLwfOM/4GwWzgd5RbHvVttD1IWuqxPxfm/3jDDeJT/oTzohtNVfRsNBNUe1R/UvC9G06XY3L/LJnc2agVV3nwjJbjAiF3V7wHeN0MTW+0bxVtFvw5HVyfEvoZaGy41J8US46C27Dk1wouAurHLKc0Z9z7kKxYAv/ZsrnaGS9JSV44FB3zsRVDBof/brV/8dA8ys3JTdmtVfatGVWd44AY2T0mhN0mX4x0Z7QwW/30ornm9bnjSyTYMqGVxSIJeAqu8blKBGXc1Ix33uzQ00P9Zh2MsqW6FbkSbNrpIYZIqB89yB/UJVoAr2wxmqPOpscxvzNyt6EvRREFcL1uBly3JC2U9EelkCUCaR2raGBxgOwt7kMC4wvU9S3/mwA6tKY/C921A1E50q4zwvNHdcU4hEUomBu1aFQc22gRMJnVw9o7TERB/kQ/J/i1H+OZPDUV6r68Kw5Q76qfKprOpS746GA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlI3MU9OOWIwNDlVNUZaeHl2YlphanJ2TzNJd3V5allhc0M1RUFtaWhHeCtL?=
 =?utf-8?B?bzhUNXk5STVNOGVqaVlNbitzbUs2elFLZGZld3lUNDFNZ2NlYlJRbkFtSXho?=
 =?utf-8?B?RTQ3T1M4QXpBOHd0UUZpSXlZRm1DajlXdXZjV2Z4cG1KbFNpcHhISG4yYkJa?=
 =?utf-8?B?bU90clZoakFiblp0ZUVUQTcwaXo5ckFEZmhEVmxPbCsyWXdTWFZFbHJjYjJF?=
 =?utf-8?B?Z09kMVhmNk03R1VuYzA0dDRzMmo0YVE0MWRBRHdJWEUyL0dOWElIb0V4b3lz?=
 =?utf-8?B?eDBLOGJhajRmd09BMjRzc29FbDhJZCttRzFQb1hibGFtbkJrcFo1OW5KRnNO?=
 =?utf-8?B?alZLUVU3UzZ0WXB0U0pkZ1FkQXlrMDk0dWZxZjF4SnNnODRqTFRvNVNBQmp4?=
 =?utf-8?B?NXNSWXpIVVVoNlV5NTdRRHJkQmZPY1RDSTFmdVBsL01LcEJvR3pBNjd2SzlN?=
 =?utf-8?B?d0dLZ2hQQ0JxZHlXZVU3TDd3S0dzQy9Oam4rQzRvSFRzZ3NRNnU3M2NFekcw?=
 =?utf-8?B?ZlE0NEhVWFVFaXMrd2QzTTI5bzY2SXRmNlNMNEdtL2J0YnBqZzg4U3ZYQUh3?=
 =?utf-8?B?Yk5VVCtCR0phWWx0NW93czdXWVVzZG56bUVJcUN1dnJFWGswbTkwUEZNaS8w?=
 =?utf-8?B?c3ZkbnlKVUJpZkxYUGpySFdPZmJ0VkhldTlrOTlDeVdwTGNYZ3RmSGtma3o4?=
 =?utf-8?B?YnR1VFZCbHVJS2M5empYanQrM21WRHhXQkQzTksvRG54d29nUkp0RWp6YU9B?=
 =?utf-8?B?ell4YS9OS09TMEhEdnptQzZ3TS9EL2JoNXM2eGZ1UmlvYXk5NGFQSUNqekVo?=
 =?utf-8?B?enVaNWhsRzEreDU1c1gzd0RWRFNzdnZYZ0dLYmpObXB6OHZLMmNvRFZGTDM2?=
 =?utf-8?B?Z1d2c05tRGZ5aGtWSjNrK2cwSjVVZGk0bHAvd2o4NHRONERqWGxNR3FFdFhQ?=
 =?utf-8?B?aG8zNlgvOXhFT3Qzejl1OWU2eXNxek5zdlNtVGZWS1kxVGlGUUlzcUZmVkRN?=
 =?utf-8?B?SUJEbm9QeEptLzVWZUxnNDVWT1JwbTBWYm9sSUltRFBlcStiUnM0czJ4SVpL?=
 =?utf-8?B?VitUWTF4ekkxcE5vZjEzOG1odDZ1WnhqenFmN2hkTHdXU2NBaGt1OG9KWlNi?=
 =?utf-8?B?b1J3ODRUbWM2ZExicW5WaGNBMjBvTGJUclZhakM2Q1pDSjFWNFVTWVZSSTkx?=
 =?utf-8?B?Sy9RK1lFdUpMUXFCQ0lPWDloSkIrSVhkUHMxUi9FNFdkY0tIRDRicFppbWdl?=
 =?utf-8?B?SDdSTGkvTkxYMVR3M3lrbER6Vk41R3ZpMmJRWUZmUW9RTWxETVN2MWpNaHl2?=
 =?utf-8?B?RHVtRjd5UWpoK25OVkJLT0N2VThuRFdWQnJMdW1lcU9tZVNxVHgralVrYnls?=
 =?utf-8?B?QTlzTEQ4ZS9iRSs0bnpjdHZRUWg3QkUzcmRJOW5XUkxEdTlRTG1NWUlqVjVW?=
 =?utf-8?B?eU8wU1docHlGN29EWU93YW9nTlg4WHBGVWZyYjYyTlZTSnpaV2w0MFpxTTR6?=
 =?utf-8?B?ekJtYW1HOEhrM2ozaWVCRWxGcnY4UmF3TnhVTHcyUjNRTitFWUxUdHZIemVz?=
 =?utf-8?B?UkxJYi9mci94amlLTXBabnExQTdpS2NDTkZsVTNOd0htSjRraXN1TTRSODV4?=
 =?utf-8?B?cW5SL0MycHpvMFh4ZU5DTGs4aVo0dFJWUWlmM3JpUUZ1eWc5NGRHR1R3WUhX?=
 =?utf-8?B?bjRjeG5sWUhFVUtaRlFacHRBb3pZQ1lCQkdLN0Z4YzJleEcxNnQybFF2WlJK?=
 =?utf-8?B?Sm9ZNnJzNldaT3h6WW9LbkFabVQvSldHNmQ4Zkx5bDRDdVViZiszN1FxTzR6?=
 =?utf-8?B?aXBZUTVQMDNQZjNTRDBhRC8yUmcwQjkwN2hUM2doNkV1aWxZbHRXNDk3ZmF0?=
 =?utf-8?B?czJSY1FOUE4zRS96cThScis5OXdDNm00alBUOGIrYndKd01telhsTzRlZUdE?=
 =?utf-8?B?TFVjNktEWmc1dnVMaXY1Y2dOVElrV2NQam8wRVF2dytSVSswdm1hNmQ3NkV3?=
 =?utf-8?B?NlVzNVlBeFpTd0srSHBBU003ODdFb2VQMlFJY0ZHMUQyd2dTeDZsOWJTRzZJ?=
 =?utf-8?B?ZDNmU3p5MnFSS0VsWERCN1hFRlVveFhZQWQ0WExUR240SEZIM2RSMk1DcUx5?=
 =?utf-8?B?eWNZVTIza1hvQ3RRcENsMVRiT3E5Qk85NG5XMk9US1pOd3ZNNENRZFFxNVZm?=
 =?utf-8?B?dE1DS0NKWHU3YWZsamswanc3L3F4NUF1Rk53ajZ1bytvUDJuMVpDVXR2L1Z0?=
 =?utf-8?B?SE9aYU01L1VJendjendJZkVkeU9JM1pRVmU4dXB5b0RnektQWldzTUdNSDVh?=
 =?utf-8?B?bjJJdE4vSHpKTkxJRHgxL3NSWFQ5TmpHYTBhelFydEwvcE5wSHRCZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca98d2f-8971-4231-9966-08de960cefa3
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 07:52:25.5294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /okpbUO9mue5iouuOJTNCbNpNHTkUSjlYdSFQV+8M7S+C3ytN38SnrJ1UWhf9W7Tf9b6dfk+50Sz+ojU+Q1pWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6221
X-purgate-ID: tlsNG-4011c0/1775721149-BFB450B1-11075B09/0/0
X-purgate-type: clean
X-purgate-size: 953
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com,epam.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 401AC3C74C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 02:07:23PM +0200, Jan Beulich wrote:
> This core backing function is uniform; what varies across architectures
> are the attributes passed and hence the wrappers around it. Yet of course
> extra checking or special handling may be needed per arch, so introduce a
> suitable hook.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Just looked at the common and x86 bits, both LGTM.

> ---
> Declarations (or inline counterparts) aren't being moved around, to avoid
> the need to touch source files using the functions. Quite possibly they
> want to consistently go into xen/io.h and asm/io.h.
> 
> Of course ioremap.c could also go into lib/.

Maybe I'm missing the point, but what's the benefit for it to go into
lib/?  Is there any realistic scenario where we might have a
functional hypervisor build that doesn't require ioremap?

Thanks, Roger.

