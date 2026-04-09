Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO+XNxmM12mVPggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:23:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E153C99C9
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:23:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277051.1562326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnTF-0004SI-8j; Thu, 09 Apr 2026 11:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277051.1562326; Thu, 09 Apr 2026 11:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnTF-0004Po-5S; Thu, 09 Apr 2026 11:22:49 +0000
Received: by outflank-mailman (input) for mailman id 1277051;
 Thu, 09 Apr 2026 11:22:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAnTD-0004Pi-Rf
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:22:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAnTD-008UC4-7a
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:22:47 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d78c03-e002-0a2a0a5209dd-0a2a450ccd26-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:22:47 +0200
Received: from [40.93.195.64]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d78c05-f40c-0a2a450c0019-285dc340e1f3-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:22:46 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6508.namprd03.prod.outlook.com (2603:10b6:303:127::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 11:22:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 11:22:42 +0000
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
 b=HgQJWGp4iSoDLJGgO6yoztvdfLLhCQ8WRs1tfMnPOug+0eRL5eHNB5l3wOS4Qz/SRacf4Iuh49iXOPfQSk4m2PJ0rC1LTVMPLk1GA8sT0G3wd+/uUesdi35i9m3EqAlftlaCCsh3pZuAuY0i8gE/hMHiYMTdx4YYSiLeVvntvSddn6LqImWxSRQuPQsECSWN5HuJlWsydXYdR6YgVmb5T9bom/4wCVA/cembWsiWUsvfA9jAi9H3p98zedMLGeKMPG1DQNLvPlAfBfS1hhrh4AMpvc2uQ9pqRjL110raXygIG76l8yAd7o96vF5hm+S6CFkToJx1nrzLzvlqwsP9cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aay0Ut8ruxv3rj9DqIyV4nHfBqLYFxdAoKXeB9+NCjI=;
 b=LwVgL38pgo0RLE3R22PgKTo3lSP1Yjd8glYDx6FjPDff6GKBAbDYTJwPE85rQIkZ3nH70iSiMhbMwEeDCRehQpm29nUuLdj2YlkM+9EU5gdouLX52IUgkONK0lE5i9P2atebC6BCEoCAx/LRtJgjp+4FfDPyc+83U33yQeXt1spQ1f/gVR9G2bXKZkXS9gEtSA98IQ4XcYt11rFPi2dgIggJ+/QpB2Zhs9ihVWqYX7Qvsso8XrNCg7g4i4FnfsaYsAzE7Ga0Gc6omyalX6AldUzvnunex7+eDkEgOo7j89wHmRsMkF3PcsrCN9KMwsxpMk99BldNcUFJ7ZwYEghEeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aay0Ut8ruxv3rj9DqIyV4nHfBqLYFxdAoKXeB9+NCjI=;
 b=nnvLwYciSU3f58geGWleOxHG3MOvWo8s5pKsROczYZD4eb1vNkCjAMH0V8JpE5SdKoP3OEK6TbYnFg8uaBHtwDAaQkfhCzL1lbJU0OlLgEJfcSzxCp3Kpvewt99uH7+wR0iL0zKVTzRWTyKvl3langPuDgdIiUUIgQzYEs1iVDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5d3472ff-77ff-466d-9461-3b33ef0815aa@citrix.com>
Date: Thu, 9 Apr 2026 12:22:39 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/3] x86: record SSP at non-guest entry points
To: Jan Beulich <jbeulich@suse.com>
References: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
 <de873764-c803-4f56-b88a-936cb948c382@suse.com>
 <f08e0fbf-3570-4760-9977-4e99e651a3a4@citrix.com>
 <868b63e6-c551-49b6-b177-cfadb29a69b1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <868b63e6-c551-49b6-b177-cfadb29a69b1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 63639e81-4b36-444c-4dbf-08de962a50bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OBqKUirhzffoL0BRTwKeFYSDZaraXXZ+eiQ/to+db0Xo8+4B5jWjzLkn0FPtaBKtWJDZcNdaNyp9tUwpiB+w4pjbxkn68Bwq16oDICpMjZjQ0oUkXer3L+diBD6PEL7FLQDdkpsbsrktIT7YfeE+nDh7AFf9TNyxoG9M6sambv3DL34kgpvENUnoGBtGjj8lPWlDe/MXHYONm58uzTJCLp/HVQqnnq5MJF3U1/oHQNNMkm6qgWkP53ocC56Btfw0PYbnt8nMj7sNoJTQuo1MQOorWHYv9QIbCxKTWveDvRxUEqu+Oe9WPPmCgmWNzj7Ew7pi2z9BJv+n/dlda4lEnFFqkTb+F0DTLkSdpWYlB6OzZv5uwDxxm+10I7WLRiYSaGC1MhRstVQVU2y7sWpUzH0G13phKlOIRf0NauwxbPC/PFyuy7LnPmRqK8BjUhkEiWm42IARlDAPBNa+JhQhcbfkwrgQa3EJUkT29VeNOy4RhbJPs4mgJsLvX4F/tFQjUlir5dCZbSQYzezm6gQqBl9M0tf8Zxk/cGujIwI5cgO6s0fNx40v+4xJNMzjxrys/pWjuaX7QQJ8xtr+UnJXhmFBxvNuC/t8SvT8w7d066szN45xoly0LRRCL8ovBsRHAWnUsm4HTsiVrn9H+IqA5MobzsGkPmx9E+X6A8StwYd7nWj65HX3qBQvysHrqc1p2PVrEzEfZ3uvo5VtPZnCVRw8c6MsntY+FtjTRo3cQiU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG1qQkNVdVFlNkoxTmNQajdCdXdidnZjTGxPRE03ZUhxU3BScUUza1FvQURL?=
 =?utf-8?B?c2t3SUl5VTN4SU9WRC9saHh1cGY4V1IydnR3QTFxNjd1NjJJTFdIeU8vbWhk?=
 =?utf-8?B?TExMWkZxZWZCM2F6Y0x4NmtmeStIRXpFclo2OFh2RTRZY2hVbmR3ZjAwT1hO?=
 =?utf-8?B?MmZGWnQrQVBxTGp3eHJHaG1ENUZRakRJcllDU05XckozOGdlOEVEY1h1Z3dq?=
 =?utf-8?B?ZWtGN1ZDZndNK0FLVVZNQUpPUHFaQWloQitkYmNhMVpPQWRtdndyMkJRUzBO?=
 =?utf-8?B?VFk2eUhvczZQT0w5SXNWSmNXZytRWnZDRm5nT0ZqSTVvS2NNWGQrR2xjSGlo?=
 =?utf-8?B?bG9mQ2NJNGlLZ3ZEVjdQdlJkLzFnbTBXTFFNU295dVdmOE5rOUFMZG5kQ2Rx?=
 =?utf-8?B?MkpEbUNHSlhDeUg3VEM5V3ZveGR5YVFaWmdsK1BEQUVpc2c4WUJsT0FzS1Yw?=
 =?utf-8?B?VXAzWFZzb1M2ejY1L3ZUUlZRZ2NINlhYdkJ4U3Rxc01qSmcvMWdwVjJWb0dB?=
 =?utf-8?B?cTB1ODNKNldlYW9oNyt3L0Jub1RpOVFoS1o3QW1vQmZnUzdrNkkyL1k4ZUNj?=
 =?utf-8?B?S056Z2h0cS90U1JWWHdULzZWRjlOajR6WUNqeWNtWFhmVGdzeTJnbFZCT0tW?=
 =?utf-8?B?TzVqUThIMjhKRTNXUlk3WndKR0NQbEs2blNaa3FBaUtiMWI1bzdkTjFrUHpo?=
 =?utf-8?B?dHBLeHlKdWxzY3dheVlkdmJVOGF5VkZpU0JzcGRLYWwxYjFNZ2hyZlpaYWRx?=
 =?utf-8?B?ekdyVDYvZTZMNHN5cFhQVlNrbzJYVHJVUDdNbUUxUU9YUFVmOHdLZnBlNUZn?=
 =?utf-8?B?WXUyb0lhZXRvSUk2UzdlTmtyK2RNZEE4bzhGbzFLUGFNSmZGSXVpR0ZMNEk0?=
 =?utf-8?B?TWdKTkEvWWg0QnNPWUd4dGN0YUordElsQXRibXQxODB1bFNIbHRackdMK1BR?=
 =?utf-8?B?MHlXVlV4S0xpTitZNmZkUVFxSncydWYySzdWWEJGL2E3YS9ZeEhkU2xieUk5?=
 =?utf-8?B?dHkrM0F3VmU5OHlnVHU5UHlqNFdxTEJzbGdYUUFhODN0blV4dzVMSDgwdnpJ?=
 =?utf-8?B?NlQ2azk2RjAvVXFidnlCbW5PQ0tVSDNqdXk3cGtGRUVQczR0WWFCanJvcnhU?=
 =?utf-8?B?Nnl6VXFUb1pvcTJYOGxkNHRSblVKc1VVcjBOS3dSQTl0Y2ZaUmYwaUc3N0RY?=
 =?utf-8?B?NndLVjBPbUgzeDU4c3h6Sld0RWVVR1NuQzRNZGNmWG0rbGV3UXc4eFNuSk9G?=
 =?utf-8?B?STBaYTVIcTRqTnovR0k0QW1qV0xRM0FvZzhLUHhsemdkWTNjV1dwSzh5SDFs?=
 =?utf-8?B?c3crK1hmd1R5V0hBQXJyRWQyQ1ZrNWNOb2NmL3E2cnRoME81dkE4cDlVTFR3?=
 =?utf-8?B?bVFBNCsxYlR3NHZtUnFiNCt3cHJobk1kV3FzQ3NVeVowQkYzeERtVVlZaHdV?=
 =?utf-8?B?RmVMa1ZzMUU5QnRkM1BldC9TdTRJY3FwNTFUM25mNFJZZjFuOUVFZTZjenFu?=
 =?utf-8?B?WDc2Ukd2R2pkTjJLclh3RFpzcXNtTHY3RmtBZ0JSdW05ek1DZ1M2WVE3ejAy?=
 =?utf-8?B?ZnJ3LzNEbWhGa3RmVDhnUEpaRXhMakFKOE1telNUVjhCaS9uREZNcjVXVTdX?=
 =?utf-8?B?RldjUnpXZTZjNnNLN0UwWWNIMkcvSi9tVkcyMENvT21KR2VSNTlVa1RNNXFx?=
 =?utf-8?B?SnV0ZzlqTU0wVXM4VnhBUDJDYUhNUTBpdHRENzMybFZGK1JvQkMwRzNaQTBQ?=
 =?utf-8?B?YzFHcHVBZTlvMHBQL3U3NGFLcEFiVU0zcDhvSnhvN3FTeUxhSENXMXhMVlVR?=
 =?utf-8?B?YU1qNXpUSFpPa2VNNlY5OHIyVjNnVEN0anVaL0tjRGNBZkMydThNWFZvNzdF?=
 =?utf-8?B?OHNyNFJyU2lIdGtwbWJnbW5ncWJTUXloaS83ZVN5QnB1SS92REJqNjRxYjZE?=
 =?utf-8?B?dmR6WWVpMUpHZHJPWkRiMjdmcERyaDE2TEhtcWp5Y09GbDNMTjA5bzRyTmlt?=
 =?utf-8?B?UHVLUFJyOEJxWUxUQVVvUVZIOUQ3UXRCSjloNXZVZis2bVpDLzVoWDhsWjdx?=
 =?utf-8?B?V0J3cmFrRjFZNzUxMWZ1d3pCdkhaV2IyMS9pTEFSem9CMnpaWTN6Qy96c1F6?=
 =?utf-8?B?eGdBb0RsamVzTnJJQjdqWlhhWkpnV3VyTUhwZDVDUU45TC9leGYxSWNVeFBo?=
 =?utf-8?B?T216aHhibGx2SmZRYm01Z3cyRkh3NGcySEtObXNHc1FIdWN0dE1hNzF3MFJ0?=
 =?utf-8?B?dVUzNktMZ0hoOFo4K2VKM0tBYVIrUmFrVnBOL3FsN1dTWExNVTNWRGpJNWRI?=
 =?utf-8?B?MDA2YmVaaFFFajBsVzhMTE5zSDRXUlZDWFdQOUNwdTZ0cHV2MEUwSEg1ams1?=
 =?utf-8?Q?4+r5snZ/6JrkII3Q=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63639e81-4b36-444c-4dbf-08de962a50bf
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:22:42.1565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbNpd7F3QX0YfMm3EShzu3OwxhyxdPehqEWRuK6/mouOOQBPUioNFPt4UBj2DiKQuPvVwfIZ8WCwzCzYjQJnSRG9mq5RKkAoJt7JKxHcG08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6508
X-purgate-ID: tlsNG-d25034/1775733766-FCF5AA3D-ADA80613/0/0
X-purgate-type: clean
X-purgate-size: 3069
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 59E153C99C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09/04/2026 9:13 am, Jan Beulich wrote:
> On 08.04.2026 18:58, Andrew Cooper wrote:
>> On 08/04/2026 1:22 pm, Jan Beulich wrote:
>>> We will want to use that value for call trace generation, and likely
>>> also to eliminate the somewhat fragile shadow stack searching done in
>>> fixup_exception_return(). For those purposes, guest-only entry points do
>>> not need to record that value.
>>>
>>> To keep the saving code simple, record our own SSP that corresponds to
>>> an exception frame, pointing to the top of the shadow stack counterpart
>>> of what the CPU has saved on the regular stack. Consuming code can then
>>> work its way from there.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> For PUSH_AND_CLEAR_GPRS and POP_GPRS, putting the new field right next to
>>> the error code isn't entirely nice; putting it ahead of %r15 would entail
>>> other changes, though. An option may be to not make SSP handling part of
>>> the macros in the first place. Thoughts?
>> I have a firm dislike for SAVE/RESTORE_ALL, both for their substantial
>> complexity/inefficiency, and mixing of unrelated tasks.
>>
>> I have several series trying to purge them.  I suppose I really ought to
>> try and finish this off properly.
>>
>> While classing SSP as a "register" is probably fine, the ssp= parameter
>> (and particular it's asymmetric nature) is on the wrong side of the
>> "complex" argument IMO.
>>
>>> For POP_GPRS, does it really matter that it doesn't alter EFLAGS? 
>> Yes.  The SYSCALL fix for one (reviewed, but waiting on final testing
>> before I commit).
>>
>> Then the VT-x code when swapped to use POP_GPRS.
>>
>>
>> To take a step back, you say that putting it ahead of %r15 would entail
>> other changes.  What changes?
> SAVE_ALL's initial ADD, RESTORE_ALL's final SUB,

Ok, this problem goes away if they're purged.

I guess I should refresh and repost my series.

> and then the hunt for
> anything which may simply assume UREGS_r15 to be 0.

I highly doubt we've got anything like this.  (And even if we do, it
wants fixing, not using as an argument against doing this the nicer way.)

>  If UREGS_r<xyz> were
> ordered by register number, I would have considered putting it where
> %rsp nominally would go, but without that putting it somewhere in the
> middle feels rather arbitrary.
>
>> The resulting asm would be far cleaner.
> I agree.
>
>>   It would be an rdssp;push on
>> one side, and a pop into any register on the other side.  Furthermore,
>> given that the ssp= doesn't exclude storing it for some user frames,
>> just store it for all.  It's one push/pop into a hot cacheline, and
>> makes a substantial reduction in complexity.
> I'm having significant reservations against that. I use the 0 put there
> in subsequent patches, to identify absence of that data being available.

Well, that's not safe then.

You've already got non-zero values there on entry-from-PV because
there's no CPL check gating RDSPP the common IDT paths.

~Andrew

