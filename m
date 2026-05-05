Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE67CHQM+mlsIgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 17:27:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DDC4D0304
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 17:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300821.1575287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKHgO-00041Q-6v; Tue, 05 May 2026 15:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300821.1575287; Tue, 05 May 2026 15:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKHgO-0003zo-33; Tue, 05 May 2026 15:27:36 +0000
Received: by outflank-mailman (input) for mailman id 1300821;
 Tue, 05 May 2026 15:27:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wKHgM-0003xv-96
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 15:27:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKHgL-00H1x3-BO
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 17:27:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fa0c5c-bab6-0a2a0a5309dd-0a2a4505ebac-12
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 17:27:33 +0200
Received: from [52.101.48.22]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fa0c62-aaa8-0a2a45050019-34653016c558-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 17:27:32 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS1PR03MB7944.namprd03.prod.outlook.com (2603:10b6:8:21d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Tue, 5 May
 2026 15:27:22 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 15:27:21 +0000
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
 b=zAEiM1/M4UcFh3eSvv9XYjiwoBHtx+cOfOlF1bk49ulHszChtO2TyIV0SHKgvaPi1C9SXfTyFAE/u+3VfGEh3kn5WE8vSH32dZAgVRs1UHh066Ifch+V0UNgr7wW3FzV4wroWSsXyODSi2dETwLhh3RmNFZ06Lvviz61p0/2EOkHTVB6QMYTOHvGyJcG1xKHwjPeEALHPdRpxAQNZlNgXOyWV6c/R6uafXkKfvmSFYDPv+MnhdJBSzX6z0vGpSiU54NMjGdsFZGE8yHpJKPwZOYAf868ZkDqvZFRX7ebHLckI9VlUBY3NFJlaO9xL0JtqqcgL4UFfP0THalFLQ21Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3B8AV2bJbQHrfkFBgUdF8FLlHjYdN8Qa7qpHcE8CIQ=;
 b=irhizpoTE9DoTLH5+f2ERoZFW6JfMCltVXgenjEnAnogqrKVxcT51RNSefZoFzt+BZDqEMtRXAQHt5zcnoNIDkcWnFmJ4n/CpIrI+bxLql7GBxVIjIdwSeird3tn3gusQoGLfUwxJEEMNburfU7ISZpXqVBKHaAiPRS184kzTNkFc96YRnwdAOY2ObVMrW8xKSPnjTB5u6yu5VHqZ5I4Xa4ik2MKfnExpXJMaSflPepMOyngH773HjGf6rFzyC3ipEtVcaDdie8QNXn3pK13BLYm1Ccjhai33Z/+b4vgKFEH7P3Pu1fRSFAAehppo99zCO/ZRpqFUXuZV+FhsSkYYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3B8AV2bJbQHrfkFBgUdF8FLlHjYdN8Qa7qpHcE8CIQ=;
 b=LqSwFtkejbJlyOd5Z+XTxKaSR+MCR5LYX4fBk5HQnkJ2ingp/pROY2pdFtVwz0oumNoguWSpMhPmuPBCWNEuSJNvShLoEv4+ZXz+tRsVplmZTtaUapGD68gFYUu91vyzuX3Nj6Hmek3ITUhx1yrVkbzQC8U38zBA9gwuQ7yDkxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0db21b07-0d4a-4528-bccb-8989606ea4da@citrix.com>
Date: Tue, 5 May 2026 16:27:18 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation/gitlab: introduce macOS build jobs
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260423190459.93299-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260423190459.93299-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS1PR03MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: c137fb3d-d927-44e9-f13c-08deaabacd3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xQOBzieKHgYNuw9LecItqwzjdycHGQJDgwCcOhFOHo8kUTz4qy1RdNzYDKsuSYjWN3d35Wts8gT/r9eMckgP4t4dn4xfFGE8p+Szf6UaG4LRpvbbnBVehZSRkhHSDKCa4ThkEAf77YyFo5/+l2GLu4Agjd2Ky0Adk1ajwKXTwXvoYvkuw73kw8fAio3WPCYrhfP6PjxVhTknrWYCESVR/oLTJlgZJiv+kd5wZH0wGmToYwayh4V41RjPHf7bs/MUTSRIvxD6paYUDcc1CnDvMr0FyLRmxj20KJkk5XGrIXlmDnngmWi9SQTVqiSU/3JYmRZkHjYwwQ685HV3C8U2DfqAlx29iTUHNREPPlrUnbTSsE+HzKkn5JhGgOkp28zk2GQr9VaAWjm0/SvXl4jPz9u0M+1EwI23tkBbYlKyXTo7klNlAEUHR+soAuX9oyb4u6KJmAeNO67RydcTwdmIOhoFwkZ9ove6VxoZl6qw0V7NsnPQsgo7DTm1UN3SLhcFX+NCkB38ZW81YfzPOch7/Rj/W2SLHvnoFdPNNfHwB5TlU1huDicrrbi0UEaTqrEEOtMkUDNWpef4EVZyPTI+BDtiAYwpSepUUUiPpE/89a2dssZj2ghC4UAdp2ZCvWV3Qy5WfZIAiRS64Y5nU3nIC9Z5DQAozRPbS9GpB5Q6N6au6538GwvCR0hnfwJamDfD+i1aK8PQtv0HHa6QDkaDYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2FCd2dBaXBlMzREaVovVDVXQ1M4UDRaTSszcVBPdzVJRE5GNnVSVmkyeDFR?=
 =?utf-8?B?dWRySmQvc29ndnpreXJSYmRHTFZLS2hkN1l4d2I0Z2dOSXRiRW12UUhTK3Jh?=
 =?utf-8?B?cm82bEc3RlViSjhnYStZRlREaFd2ZFBIQi9COXJjZVFtdjA3OGdVdlg2OHJp?=
 =?utf-8?B?QzI2T24xZTI4aXN0cFRkSy90WjBaNFQ3bXpBRjNRcWhtc1U0RGxtbUZwMmxa?=
 =?utf-8?B?NkZ4c09vbWFab1NQb2dENnI5WXVGNVpLbGFVMitVZzZlSi9LU3lKWXQ4a2w2?=
 =?utf-8?B?MmF6Qlp5OGF1VGovdzIzS25tbW82SllWQkdHVVRGZHNZNk12QW9COVREZTFX?=
 =?utf-8?B?VE9kNWE4ZDRkODNZVFlDQ2dDZHVETFZ2WCtHQXFkRGNtZzFlTG1VUzRFNFE1?=
 =?utf-8?B?YXBLVzMrdGhydjd5VlRoaDdRbXRrbFc2bmVnRVNDQmpGV3RLcGdXVzkvVHQz?=
 =?utf-8?B?c3ZMM0xwOEpSR0NmRmF6eFBNd3FNdXVEbEVOMk0vQnlCTnFyZmlDMmlkNDlR?=
 =?utf-8?B?RkJsaDBpN21sVTRoU2J5dUU0OVVzSTN0aER1Mmp0RW5hSk0rNVRsUlZTSVFt?=
 =?utf-8?B?U3ZtTEhLK2RZaFJiKzN4UDkyWTE2ZGU2WXB3N2pwUi9mVFNRZ3J5R3ozY1lm?=
 =?utf-8?B?NTJ5NzVWZi9RVnBSNVQ5T053OGxqSVBLTmlEblBQOXhJU1JxaVZqZ1A4N1JP?=
 =?utf-8?B?NW1CSkM2YzBUbzZsRm02OCtpTktGWDg0M1NtUkZrcGV3QnViUzBxdEZiWFVD?=
 =?utf-8?B?Nit2bTd5akx1dkgvRnVmMmVhSllVK2YrSkVsaGEwaDF6bWd5L3lQbURuZGcw?=
 =?utf-8?B?S0tUTHBzb2tZZ2VVL2J4aklmdVpwL25aR0k0OFRnencwSm5IbU1jRERpbHND?=
 =?utf-8?B?dS81b3Jwd0F4ckVQcWNLdHJBRDNUUnluSWMreCs1YVlDamRhcGlDSjA1dVhw?=
 =?utf-8?B?ckhCRHNDTDU1bUt6M2l4aFAvejRmeEIzRlY3UmtlN1JpRHZNSFNzaStBU0ha?=
 =?utf-8?B?Q2pESkJTdFNVT0p1UXZuSVBHVFdmL25ydWNJTnN2czY0WWVEZ0ZrZDNIb08v?=
 =?utf-8?B?ZkJZcHZrWlRBTWN1VVB6Y2tlMHppY2t0QzRHcVVEdVEwRzgwNmswTUg0Y0xs?=
 =?utf-8?B?bTV2bEF1aFh4U0JKOWFndWVhL0YzMUhIQkswQjhDeGhpWTNraWlGZ0lHekNG?=
 =?utf-8?B?UTNEQnpDUytKSW5vYVlKTkhKb0diYWtkbmNTbm9Jay9rb2RubjYydnUvNkNB?=
 =?utf-8?B?UFEwRDFaNk5HMnQyUWowdXpRS0l5MVB4S3JlSmNuODcyUnVUMGYrTVUzTzBt?=
 =?utf-8?B?dlRwdzhvVlhlUWVUb041K0JHNXhWNW0zRmM2dUpOZFZiS3dQTnZFY0k3dzZ6?=
 =?utf-8?B?L3VVL2JiRlpmS0t1STRUa1RVTWgwTmVVc25FVjVFMkl0ZXRvVmJrOHBGR29B?=
 =?utf-8?B?eUpxSERVbVRkaGZXMU1vaklSdlJxYTIrOFZnVW5FTjRGUkdhbVZnQ0w3WFVZ?=
 =?utf-8?B?eW5vek1WM2U4QU5ZdFh3NkMybHBWQ1J0VjBiSzFuQzk5SHgvSDJNRzR3TkpT?=
 =?utf-8?B?My9mYTk2RDU4dzFmY25HTmNWU2R2TndjelJHSE1vL1dudzhmdlFiOW56VVhX?=
 =?utf-8?B?d1g5bk1MbklFL0RYcjFPSWxram0rTWd5TlY3MmE4dUtmdSt2cXZpSnZqU3dP?=
 =?utf-8?B?K3I2cUt4cXdKTWJSZFl4bEkvcUljZzdzZXZsZ1V1SkszQyt4Y3Z6OEZ6WUt4?=
 =?utf-8?B?RmhhMWRzLy9pcGhlUW51Q0F6TmE4N2hXejQ1a01IRlV2UTd3aEw3L2YxVlN3?=
 =?utf-8?B?UlZMTzQyVkwzRzBNNzF2R2JHOG1iRXdMY2xHUGdnM2FPRHBDamQ3bHh5WVla?=
 =?utf-8?B?NjhBNTg3K3h4MS9QWElNRGYzeFlXZ01iSDdqNk1DSkgzeGxVdXFHTTJzcmRG?=
 =?utf-8?B?QW1PTDltU3NnNmd0Rkw5bXlzU1o3WDY1VEhzWjJhZmlYdjZXQ2JjR1VHc0cx?=
 =?utf-8?B?eG1uaXlTVnNWTnpQVDgwcUIvOGxPVUNGSk1MbEZQUEtnVnBlRGxqbUpiNzBo?=
 =?utf-8?B?aVprbjZBaHFWNlRmZ3pzRHB5UDFZWEQ0RndnbGl0REdXU2lpUS9qcDVHcVY5?=
 =?utf-8?B?SkQ3R0hnSk1xQ1k3eUUyUm5yRGU0NWJ0OVJObnJLRkJRTUxIdWQ5dWlwUThP?=
 =?utf-8?B?a2FtdlpaeFZQMktnMTYrSm1BL0ZqTTd0WHJDMUlwK0J4eUxlYVJZWFE4ak9U?=
 =?utf-8?B?UlBUaVNNM0I1ck00KzNQWm1xRnUrRXZkWXd6WitKTGFOWElMRElzMTZBVGNS?=
 =?utf-8?B?N2J1eisrMWZvWXVhTGtqNHFSbzQrMjhGSUZ0K2FrYU9mQ05XMzBWcy9OYStS?=
 =?utf-8?Q?ga54EK7NVxUUVpPg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c137fb3d-d927-44e9-f13c-08deaabacd3c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 15:27:21.8374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGpz5A+O7B3BX+2dGj3X4DP6msaJjt1Yx0bck/q7xgUiwjuzFmyUyBTkZ3TWj2UkmlbVmhopG2v3EJlfQLgJ1uWE3nWqRzji0JfHb8BaAtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7944
X-purgate-ID: tlsNG-c201ff/1777994853-E8DA3443-07759ED7/0/0
X-purgate-type: clean
X-purgate-size: 778
X-Rspamd-Queue-Id: 75DDC4D0304
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:bertrand.marquis@arm.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 23/04/2026 8:04 pm, Roger Pau Monne wrote:
> With the imminent decommission of CirrusCI we will lose the limited macOS
> build testing done there.  Introduce two Gitlab macOS build jobs that
> reproduce the ones present on CirrusCI.
>
> According to the "Community programs" Gitlab documentation [0] we get
> 50,000 compute minutes per month.  The arm64 job takes ~1m 15s, and the
> x86_64 one ~2m.  I think it's likely enough given the amount of minutes we
> have available.  We might need to reconsider if we add more tasks that
> consume compute minutes.
>
> [0] https://docs.gitlab.com/subscriptions/community_programs/#gitlab-for-open-source
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

