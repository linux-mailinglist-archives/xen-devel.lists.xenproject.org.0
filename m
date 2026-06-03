Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yQ4jG2M3IGrGygAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:17:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10E163877B
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:17:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=cAqZCatb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326476.1591921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmOu-0007JC-AL; Wed, 03 Jun 2026 14:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326476.1591921; Wed, 03 Jun 2026 14:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmOu-0007Hc-6Z; Wed, 03 Jun 2026 14:16:56 +0000
Received: by outflank-mailman (input) for mailman id 1326476;
 Wed, 03 Jun 2026 14:16:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUmOt-0007HS-9H
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:16:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmOs-0048xV-MA
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:16:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a20373c-2eae-0a2a0a5409dd-0a2a450b8c1c-48
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:16:54 +0200
Received: from [52.101.53.55]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a203754-212f-0a2a450b0019-34653537db18-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:16:54 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6947.namprd03.prod.outlook.com (2603:10b6:303:1be::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Wed, 3 Jun 2026
 14:16:50 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 14:16:49 +0000
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
 b=w48plQxxsIBr9bgZQx36C2i8j09fM7XpiLzJorqx/qIfIvtGkPCdS2D76rJ8qsKk8MqkbFsBvEuTzRTt8yNbPspFc6+2b4x2+EtB1OT2MVHJ3Bftw/IoeyGVGKrvSWZIN8tAImbRkIprS8OZXRWptDI9S+N/Ve2OtyEQKNIRMU7N4NvS2SB/GQ1YJUsJu8/keH5tpYibQRrpRuRPzNuNtPQr5K5DoREVKrkDJ8trYpCn/gc+sBh8RbObaVTIzAIgWaGy95op0F+HgZ29qpByBXWiNW3fJHkPPwcbsJa6dgGILLzC+ohAK8CCfqpeG1MfQ2yV9Ke5KkYSZtlM2osXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMqwwI4Xx1eopbTzifhcDbu7vCOUBDHJO3sykFHN+H8=;
 b=YUiTolb81irzLLPv1kuHz9QiEG7D2lYYdnMf8NkNnZ04qnnrBwqVnSb/qsuZgQKtkJ+rDUjpS17paYOwxsfEZbZhMNM2IAut6NR9FanC0NGzCMHko4BQlldCvSJOeQpSFYVTfvy+QfSzTAohG0x5wd6PTI2E000l1uaSEOF/KvMITB93VHSkqONeNRYR+soU9NH1pRl8zVsSfAwZLgvHy5w/474pgcOTNQHyJMSOFTFicy3DN8aCERNXwQGSuWHYbmSVC+DGQeB7rtPMoVDA+KxhrpCXsdFxfVal5XL4j7pzHRQCD0P8teH8psChKEcsRZ/+9pxuYKEKTzp6Ljgcow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMqwwI4Xx1eopbTzifhcDbu7vCOUBDHJO3sykFHN+H8=;
 b=cAqZCatb5h6qU9gWaklLn03yLZc0vb91ACTzPLYRRE5ZVehYeH493vE93jHOSENp9uajbMElRTD6XLXprqUt6Ln6wRb6vcCVWcQbkPmGFyBW4QrSxSTK4kU7zldgUsZTmWvykEVtidU7WaeAA9FTZ1ozn7VbCkDKKysdHsu99cY=
Date: Wed, 3 Jun 2026 16:16:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] xen/x86: Change stub page freeing to fix smt=0
Message-ID: <aiA3T2DvE0v6uwoC@macbook.local>
References: <20260526203114.40882-1-jason.andryuk@amd.com>
 <ah26nl95MgqhPPAi@macbook.local>
 <5cdfca65-50f8-487a-a146-86e1a68f459c@amd.com>
 <ah5_0vvipY2Wch-x@macbook.local>
 <cf275fef-27fb-4d73-bbc8-9a75c1836608@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf275fef-27fb-4d73-bbc8-9a75c1836608@amd.com>
X-ClientProxiedBy: MA3P292CA0062.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7dbc4f-424a-4ad4-ebce-08dec17ac0af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|6133799003|5023799004|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	+WARjk5pumontWFDUpdBykH89LgMYpW4knz4PPWNv1w3y8I4gbTKRmfmpfJ62btfRyukANLpmNNUWYqjEI5RJXnzwmO0ZohAWWmk7rxk09NnQExvFuMUS6I8homwMztp/tEtm4j85NFrj/bvreIl/h8o/EiiavbecfsBow9zgI+JVG6Fp5HCHxCjZ4RGBdrbLmbL8nbuWPnptj7HkTipi5racuEUHW3iRbEc4fglZQNgCFGsL7BqK1fts3Sibm2Nj9x8ELqZ6knlxQlRmzWHbKICD05slBUQ+LGxaCviH8jaoNDOBYKbRl4HCtI9+kJAb3SKaaZ8MNmljjUVOtqxDwuLAGn+dRM2o+QCCeDu9HvDv5p1cJCdSMboUmJ0eaJqsTxkjNM3wsrzOK8ha7S2lvudrTKxvlQCcpjPFed6mY0LZgtCCkNPv3+YN/5mdGbsygjdrFXkYDiGtlaBsfOqUL/NGRwVE68IUF1LrADEHcVCyodUM2O6PgZNsvA8islBWfKYZji168hplXoJVQfmQ/rbBcQVNlXmn6l9/oOshy8Spa1oII0ni/Nvs0aCPId7Jj6W25MN3ks1WphRG7h9re6BSImZA9tmmTQ9LeN20gP8930dOA44yqE9Tg2fedF25MAF+RdrD/75FXRZmmQUVz+FsW0FHbc0LYRoYCQxGBtqvAD2k1pJ4uMO6jb491O3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(5023799004)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTNXS0NYYzR4NnVBNEZ6YXlYaVpIMENxdVB1WVh1cndJbGprWXFQOENMWlpE?=
 =?utf-8?B?VGhja2ExelVuZXc5YzlnbU9ya1l3Q0dnNnZWNzl2MWZ5WVk4Ty94b3czSzZl?=
 =?utf-8?B?VERYWHd5OXFLSWdFblFEQ0QvOUl2NXVDK1I3bUVBZ3ZHQ0hLMkpkc3pKV3Ra?=
 =?utf-8?B?Yy9oMDJiOHMxU0tKdXZXQ1JZTERrUGNjbGtkVXlSWFp2RUcrc242OEJCMG5H?=
 =?utf-8?B?NXJKdTRmMmNYK3k3bThNaWIrY2JPdmJCTFB6STdVUlZLTDNoc2MxbDMxVjRs?=
 =?utf-8?B?TDd0QzdLWURBUFhMVkl6UzV3Nkt2ckVlRHJKRmtLMXo2Zkh3L0tlekxmbjdG?=
 =?utf-8?B?ckJMME9MN1RRSnVpZXBveE5ITnN3SW1Wa1hkZytGaURJNGRBenExNHh1RWJD?=
 =?utf-8?B?L1pvN0tKZHNpcjJ3THFoZkZuUlBRWlFqUXNGNng5a1NtL0NkMmpJQnBKaUlw?=
 =?utf-8?B?T1pVeWNuYzRDMFZ0a2p1TFFyYnBDMU1rTmVvSU02Z05HVmdUOW1pbW1uWXEz?=
 =?utf-8?B?ejNNN0ZpQ3ZmT2NudVBjU0dmT3VTU3dtZjFRNHFqdy9Fc2hTNnIwL25rVmg4?=
 =?utf-8?B?NXh6YVVPUUpWOUxhRTkvaEpVdGpuTkV1eFVVSTUraExHOFppU0pTVE5mK1lO?=
 =?utf-8?B?RDFuTlVLL1V0YTBXS3N2ejh4N1dJaWoyMkdKU1pVSlVtNTllMXR1dzZpaFJl?=
 =?utf-8?B?alhOTUN4SW5jemtFcUhLdkx6b3ZPeERsK2tFME1INlFQSVRCTVYrTmhwNFpP?=
 =?utf-8?B?cEFZSDVpc1JUd2U2RWt2VU1SbS9rNHkxazVCUnFsZVRRMVdxT2pRb2Z0Vzhh?=
 =?utf-8?B?Q0NQanRqeEhrcTZRbzdPbklHd2tqdlhKRkFCT2JCR2s2SmZRYTRHNVJlZXlq?=
 =?utf-8?B?YklyRjcxQmF4NGt0VS9LU2E0dDN5Y3pLRjdyeXFnTzZwQkcybUs0MUhKendx?=
 =?utf-8?B?bUZwbTNROEFaQmJaWkovWlVmK2FPekhJTFhmMGZNcE1qR0RHdUpkRm1NR1l2?=
 =?utf-8?B?blBSbG1Na3ozeTUvVXpJZFBSUEh6elJ2Nk16bjF5YjBpc1E1QnhFdmVudDRH?=
 =?utf-8?B?SXVnUDQ0a2VtY0o2dEhKc3N3dHFrVGtZdDFiRGh4SW9ldWlZd3luVURzVEs1?=
 =?utf-8?B?Nnc4d3A2NlJHZE9hSnZac3NNWGVCYVNSeEFQS1gwelRhN3RsdzRyOGhvMjdP?=
 =?utf-8?B?cHFNL0VqbmZNTkNGdTBiOXpJVm44cVh6bHp2ZjdBbGV4M0N3a3crK2VyRGl1?=
 =?utf-8?B?RHBYMFdPTWdVMmpKZnpPVEU2TGNjRG4wMkppOHJBYUplakZDL1ZaMWQwaWZI?=
 =?utf-8?B?MWVETW5menlvM0trbzlYUTJtYUdpU3E1bjhobGZEaEsxQTZRMW5TNkxGY3Vp?=
 =?utf-8?B?NEg0TkNvdVpFUi9MRUNDVlJPZG9hTTBjRVdvUVBtZEFRcnFGcTQzOGFxZlM1?=
 =?utf-8?B?MklnM29VZDRORHhza0g2Z3JBNE5sYm4vc3QrbTBrbXY5Yld4cUR0Z2lGNFBy?=
 =?utf-8?B?c1RDVkJSUktobU04YU1UeG8xclZoNW1UcDZUckxXKy9IVUswMk9Va3BYMDVS?=
 =?utf-8?B?TnZ1cGVvYjIvSnJtNUNyMk55VlNDZFg3aC9zWTRsRzdFbnRKaEgzN2dYRmYz?=
 =?utf-8?B?bzM4QW4vRk9EeEpHTzFXM0VCb2hmRTYzU1dDTlVnc05uVXVXaFlKb0Q4UUly?=
 =?utf-8?B?dFg3VzNTKzBia3VGbEQra1ZvMUdxUzV0VlNNTEFVQ2xqUjBodGVTWC8veC9m?=
 =?utf-8?B?cWIra243RmJyZnZ1azV1d1JiWkU2cUN3WlI1NUtyWUhheVQyTm0rTU9tdVA1?=
 =?utf-8?B?UEVFZXdjMTR6eFN2SnVheHplUXlwRGZXdmo1ZjB2MmxGMmdwUlBIN04wdkFl?=
 =?utf-8?B?S0l0ZWZ1MXF1Q2tUVHNtaGlwb0NCSElBZEpZakxoSEY3Vng2UHNCTW1rVjVI?=
 =?utf-8?B?bHdrdko0RjNMVGVFM05KZTQyRGkwVE5CRElheU1IWVNiUW05UTVGTVQ1WFMx?=
 =?utf-8?B?Y0F4WThjd0t4M054OHF2SCsycCs3RW5qNUVka1BlV0tHQlNzUVhuRnJ3dGJW?=
 =?utf-8?B?aUduOUVUSlM2UkdnaHZQWXV2Nm5ybVVCTkc2eml5dzk1NlhQMmRhMHAzMFNH?=
 =?utf-8?B?WG01YmdRb041WEg5bVRKYlA1dGZ2MzEzOXFUbHEwY3VZOEVRUDJuS3FYMUo4?=
 =?utf-8?B?bmpob2l1cm90eHo3U3pyeWdCUVJQd0dqYVFYME5hSm0xbFNHblVLR2xjMEFw?=
 =?utf-8?B?YjYxTFR2SHhHYmRLanpiWmdUdFdsZ2ZVWW5pK0l4Mm4zOVpnVmo1NnQzRnMv?=
 =?utf-8?B?bFdHUmY0NWRHdWxqbTRWV2NtU1JNbzBCcXdzeGh3bEdxWXd3SlFaZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7dbc4f-424a-4ad4-ebce-08dec17ac0af
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:16:49.8596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaynNsh9sWNZgwd1ShWvTNtTgLnrGNi4lKoA/Mx1FO9c77JiBJrG5vl2OYZBw2s+KS7WQ2df+eI5nCZPB4LjNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6947
X-purgate-ID: tlsNG-42698a/1780496214-1A16DF3B-F64DAFF5/0/0
X-purgate-type: clean
X-purgate-size: 6697
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:from_mime,citrix.com:dkim,amd.com:email,macbook.local:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B10E163877B

On Wed, Jun 03, 2026 at 10:03:53AM -0400, Jason Andryuk wrote:
> On 2026-06-02 03:01, Roger Pau Monné wrote:
> > On Mon, Jun 01, 2026 at 05:07:52PM -0400, Jason Andryuk wrote:
> > > On 2026-06-01 13:00, Roger Pau Monné wrote:
> > > > On Tue, May 26, 2026 at 04:31:14PM -0400, Jason Andryuk wrote:
> > > > > A single stubs page is initialized with 0xcc and re-used, with multiple
> > > > > CPUs each using a portion of the shared page.  In cpu_smpboot_free(),
> > > > > each stubs area is checked against 0xcc.  When all are set to 0xcc, the
> > > > > page is freed.
> > > > > 
> > > > > Booting a system with smt=0, CPU0 is initially setup, allocating the
> > > > > stubs page and initializing to 0xcc.  When more CPUs are brought up,
> > > > > CPU1 is initialized and then immediately brough offline as it is the
> > > > > sibling of CPU0.  Since the page was initially memset with 0xcc,
> > > > > cpu_smpboot_free() finds all stubs as 0xcc and frees the page.
> > > > > However, the page is still assigned to CPU0 and continues to be assigned
> > > > > to other CPUs.
> > > > > 
> > > > > Meanwhile the page can be reallocated, which can lead to misbehavior.
> > > > > The particular instance was the stubs page re-used as a page table which
> > > > > later faulted when the entry was all 0xcc.
> > > > > 
> > > > > Change to initializing the page as 0xd6/STUB_BUF_FREE, and initializing
> > > > > individual stubs as 0xcc/STUB_BUF_USED.  0xd6 now indicates unused, and
> > > > > 0xcc indicates used/assigned.  When freeing a CPU, the stub is set to
> > > > > 0xd6, and the page is freed if all stubs are 0xd6.  Initializing with
> > > > > STUB_BUF_FREE lets cpu_smpboot_free() a page that was only ever
> > > > > partially used.
> > > > > 
> > > > > 0xd6/UDB is a 1 byte invalid opcode, which is similar to the existing
> > > > > use of 0xcc.  0xd6 is used to identify bug frames, but the stub addr
> > > > > (e.g. 0xffff82d07fffe000) fails the is_active_kernel_text() check.  It
> > > > > should be okay to use here.
> > > > > 
> > > > > Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
> > > > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > > > ---
> > > > > It would be nice to use get_page()/put_page() to let count_info handle
> > > > > reference counting, but they require an owning domain.
> > > > > 
> > > > > The listed Fixes introduced the use of 0xcc, but the smt commit may have
> > > > > made it more problematic.
> > > > > Fixes: d8f974f1a646 ("x86: command line option to avoid use of secondary hyper-threads")
> > > > 
> > > > Speaking with Andrew, we believe it might be easier to simply forego
> > > > the freeing of the page, possibly something like:
> > > > 
> > > > diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> > > > index ff05955bae40..62c6cbf4b561 100644
> > > > --- a/xen/arch/x86/smpboot.c
> > > > +++ b/xen/arch/x86/smpboot.c
> > > > @@ -990,19 +990,12 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
> > > >        {
> > > >            mfn_t mfn = _mfn(per_cpu(stubs.mfn, cpu));
> > > >            unsigned char *stub_page = map_domain_page(mfn);
> > > > -        unsigned int i;
> > > >            memset(stub_page + STUB_BUF_CPU_OFFS(cpu), 0xcc, STUB_BUF_SIZE);
> > > > -        for ( i = 0; i < STUBS_PER_PAGE; ++i )
> > > > -            if ( stub_page[i * STUB_BUF_SIZE] != 0xcc )
> > > > -                break;
> > > >            unmap_domain_page(stub_page);
> > > >            destroy_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
> > > >                                 (per_cpu(stubs.addr, cpu) | ~PAGE_MASK) + 1);
> > > >            per_cpu(stubs.addr, cpu) = 0;
> > > > -        per_cpu(stubs.mfn, cpu) = 0;
> > > > -        if ( i == STUBS_PER_PAGE )
> > > > -            free_domheap_page(mfn_to_page(mfn));
> > > >        }
> > > >        if ( IS_ENABLED(CONFIG_PV32) )
> > 
> > I think I've made an oversight in the code above: if all 32 CPUs
> > sharing the same stubs page are offlined, the reference to the stubs
> > page is possibly lost (if CPUs are not parked) and a new stubs page
> > would be allocated if any of those CPUs is brought back online, thus
> > leaking the previous allocation.  The simplest way to solve this would
> > be to introduce an array that indexes the stub pages, and replace the
> > logic in cpu_smpboot_alloc() that figures out whether stubs.mfn is set
> > for adjacent CPUs.
> 
> Right, but I thought Andrew's point was that offlining 32 CPUs is
> unrealistic, so don't even bother tracking.  If CPUs are offlined (and you
> somehow keep running), you can leak the page.

I thin we should avoid freeing the page and ensure it's always reused,
rather than possibly leaking it.  It's also possible there's a single
trailing CPU using the last stubs page alone, and offlining and
onlining it would trigger such a page leak, without requiring a block
of 32 CPUs going offline.

Entering an ACPI sleep state causes all APs to be offlined (see the
disable_nonboot_cpus() call in enter_state()), and it would be
undesirable that putting a system to sleep causes page leaking.

> > > > (there might be further cleanup possible if the page is not freed, the
> > > > above chunk is untested).
> > > > 
> > > > It's a single page shared between 32 CPUs, and offlining 32 adjacent
> > > > CPUs seems very unlikely.  IMO the extra complexity of having to deal
> > > > with the freeing overshadows the very small memory gain we get from
> > > > it.
> > > 
> > > Hi Roger,
> > > 
> > > Yes, I made and tested the same change locally last week.  Well, I retained:
> > >       per_cpu(stubs.mfn, cpu) = 0;
> > > 
> > > Maybe it would be good to save the mfn in case the CPU returns?  But I
> > > thought per-cpu vars are cleared, so it wouldn't be available anyway?
> > 
> > Depends on whether the CPUs are parked or not (see park_offline_cpus).
> > I think leaving stubs.mfn is fine, in the parked case we avoid part of
> > the setup logic by already having the mfn cached (no big deal either
> > way).
> 
> Right.
> 
> > > Also, I was waiting to see if anyone chimed in with other ideas.
> > 
> > Maybe you could assign the page to dom_xen and then use
> > {get,put}_page(), but again it seems overly complicated.
> 
> Code-wise this doesn't look bad, but it blows up:
> 
> (XEN) d[IDLE]v0 Over-allocation for d[XEN]: 1 > 0
> 
> I don't think we should pursue that.

Hm, I see, yes, you will need to use MEMF_no_refcount to skip the
domain allocation accounting, but as you say it might not be a very
wise idea.

Thanks, Roger.

