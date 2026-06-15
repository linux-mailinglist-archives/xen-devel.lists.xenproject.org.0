Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zp0GBXcwMGrEPgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 19:03:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0F5688A7B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 19:03:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="FRGtKdW/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338464.1599499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZAi9-0002hZ-9F; Mon, 15 Jun 2026 17:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338464.1599499; Mon, 15 Jun 2026 17:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZAi9-0002f6-6W; Mon, 15 Jun 2026 17:02:57 +0000
Received: by outflank-mailman (input) for mailman id 1338464;
 Mon, 15 Jun 2026 17:02:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZAi7-0002ef-9A
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 17:02:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZAi6-007Evf-Cx
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 19:02:54 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a303038-e002-0a2a0a5209dd-0a2a4506cb02-28
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 19:02:54 +0200
Received: from [52.101.62.70]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a30303c-7371-0a2a45060019-34653e46bc9a-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 19:02:53 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 17:02:49 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 17:02:49 +0000
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
 b=oT9JsT7v772bqScIabVpp4Ahl1ZVo2X/8azNfpk5ZJ/XTEo/MMpNgPmKzqDfnwoLoKG3anYjRfXKZWLL5y2QXvSNeIosi6OshjmoeIiRUp/MFpHQB+XneuRpFi2PfthQ8IwYjWrgE9UtwcEjltngzjjDPqdjPCFDFZYW1PxRXJozdj7H62b3ws6HQUGBCZbQhGxhCdjV/CtDxCgfdLJOab/VkGLW0gwy5XnBrzjOl59yGxcGmitKjrC1Vtj69+dGT6Jh9ei1hZZSDW0N8LOhJO82gL92zqHjpgfomOXhmN1Vyog2no0EMaxnkI+lIAl+vEKxZORaZ6ILOIEq1tG04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvOV7WXETWJzVyv8Lab9eshfLRKxquPFigfzOzAxzBs=;
 b=LZX2koj/E5ANb14/IHDEzML3T2XPa6QdUjo3EPmMc1PaW/LxH9XLODdmV7ndcFlCUznNqkQq/5NIk4frejj0YDCJ+hSTZ5HOA4wcscRJdRvI2J6hlrgVl3TasW2o0mIC+bbULFOL1yo+cqCebpy7m27BK4iP/1+tVUZZFutGW20FdLvSPwU0EdblLhko9ik6P3Kn3TAkj2MXUkRjRtWT67VsD6OS/lPLzrNavMnThqt/44e2cHwuM/6H1a//FxkUik7uzUHu6AgqrzLJTAjd+9zg3vY07xDYDu7j2xg25KZeqi3/a8GOri9SYjzZJ77IMCLgpfXbbdU31WAHkk0yEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvOV7WXETWJzVyv8Lab9eshfLRKxquPFigfzOzAxzBs=;
 b=FRGtKdW/jZt31PP6JC0vNnQkabOvPQIes8zFXcIi/Y+sHMAG7bs7Nq9B2V48WeM7IGLH8wQDd2J7L/204NW2GRBRxIMx0gXa9OQOnwAv79WyN4q+HAn0QLuLiuQaNm9oKoPwv34c8GWwbrvtx9vco6B5YOj+rgGQeqKQ1aGW8Yo=
Message-ID: <aea699f2-c869-4301-b67c-ddea1e08ae9a@citrix.com>
Date: Mon, 15 Jun 2026 18:02:45 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Assertion '!is_idle_vcpu(v)' failed after 'Remove
 fully_eager_fpu' commit on EFI
To: Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <aiwTkDUP6rDPbV6R@mail-itl> <0db98119-48f3-4edd-a422-8e50ee713b7c@citrix.com>
 <e84d6765-61fa-4203-a1ee-ac07f54a1026@suse.com>
 <48878ff6-ad36-448f-aa9d-6b37e2e179b1@citrix.com>
 <1781277924.8631fc262581453bbf619ec5b2062170.19ebc701bfb000701b@vates.tech>
 <ai-_jUw0QmdC7gPK@macbook.local>
 <1781534374.8631fc262581453bbf619ec5b2062170.19ecbb938f1000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781534374.8631fc262581453bbf619ec5b2062170.19ecbb938f1000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0015.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f83352e-d287-47a5-261c-08decaffedae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|4143699003|11063799006|18002099003|22082099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	ooHU4KNRKs76VsjfSII0Zv2hCvuwsbSvxpUpxL9gz4f5PXA5ngZWXkwLENB/K/aXsP+W5ksqcqlSEW3l4hcc8sgyxCxdxkLN+VrJedoJLDIEJB6/8kEXoRfeF9UzPdihTBY6r60LMVVk7vau7RbwkSSwkUjTwYBddc82livFHsaYOen6cGxsQNHkA4lsf8oq/1JkIah8XczEpjo3Kda9p5gXHDQ+TfdXiiBFLQ84xEO9UWKpWCz2qLgtVcMzoYZVx2i2Pkk137c+7tSUoNePyjy0Y6w+WSG5qc7UkH+rs8D3iMdWI5shBiwYBpvngyZe9YqfV4u7i3fve00yt+Om5S3QhXdSOHVAkkhADzLvdix0PKt+ItdFzmVIsq3dUrkf62Rn064dm/cOKMz5OlUZtxq60mFX0WW7itXLFHiQsoNlH15G01wu7TXDTEf5uPrHOnzvdKLsEk1o7NipNezq4mm0w4hEuMOZBNHoQh69zH/HcFUa3Eb7sluSBIDIsp0KMQlu23tsYyItJGwDDvcXQ+D8kWN9WXWm9KnOkIISKWw7k1XzOKoLnwtpbB6c7J8c/QRz04n681Yye1mR8EKtS1+B78LSMWH6x+PcyTEEInLeLEuel8Nyee2bjuBBS/6ADdCqNbYWahE0PRM52dYrWjAtI4pJIJ47Vo441KDGGsZk9odleepx7DdqLmQJhCqL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTl5L1lTZm8wNUFzV1R1UW51NWY4am9Kcm9VdnNTeVYvRGt0eFI1cnRRNHYy?=
 =?utf-8?B?dzNSc0pQbHpLOGFsL2dVLzR2VTQzSlZHZHVLWllVZFVRNGVZN0txS1EvWkNz?=
 =?utf-8?B?bnkya3JjSlJlYWFFOXBUUDVGYnQ3V3NMK1dFdU56dmNJOFRGdW5id0R5VHBs?=
 =?utf-8?B?TjF1bXo2ZU9ZNTZ6dUM3TnQ4NWEvN3EwMHI4T0VUVis1bVVvZFlxeGhhK0Fp?=
 =?utf-8?B?NXJxcjAzb0pSSWgzdUtCQ1ZyeDZHamtvWnIxUkVHdnY2NVVlRlY5YXE0cHM1?=
 =?utf-8?B?VVVSR28vNU9lS0J3aThxb2R0V0JSYW5mSXBRT2FBRUoxU1pLSVgvS1lyeHJh?=
 =?utf-8?B?S1h4aDZmNVBwYU9uZnNrNjBhbW9nN0N1L3liRFJSMndmTzBtcjRHSEY3N1hW?=
 =?utf-8?B?TTZ1TFlOamY0UDB0cXEvUWlMNStBS2hEeVlvbno5MEpka3V0RXlET0l1R3pB?=
 =?utf-8?B?c3ZPdGx2czdiemExeER3a1JLZk1EdG5IT1J5SW9pb2lWS3YrNjdGRy9pMzZ1?=
 =?utf-8?B?TmtKbWk1NTliMFAzZE9CNTc1K2dJWG45bEkwSXdXdzVRQ2VVYnFFb3cyNlpv?=
 =?utf-8?B?VGRFNXROY2w3T0NUSHVLSmErMEdxTFdra3B3Z1g5NTVPNkhDYnR4NnhOZ3dE?=
 =?utf-8?B?ajJDRVIwVnlnVjQyTjhhZlMwaU9qZDNpbmwxdWx3amQwN24vclU0WS9NWHBi?=
 =?utf-8?B?bjBPRUdHc1ZVYVNuTHNLdUI2eDRpZzR0VWljY2l2Q2c3Q0dQaHRSTGxpcWps?=
 =?utf-8?B?aGJiNUY3aXVzTVZGNU8xOXQ1Z0V4YjVjNkFYV3ZrTStCc2ViU2FnaGxZOG1h?=
 =?utf-8?B?S3l0OFJRZGhvbnIrOE5OUE5ZN0xSdFIvTlFtVUVjNXFKRnhTRHNYUjhOZ1No?=
 =?utf-8?B?eWVOUm9BVldnbTdKMldSUXIvR1d1Y2J3VmFCalJDV1UvV01YZGtGVWR4bjll?=
 =?utf-8?B?OUd2MW5rT1BxR2lKNlNnTmozb1JJSzZSd1ZkWXpQMHNXcm5IVHZiaGE1UW5q?=
 =?utf-8?B?bWJhZ1VDMUxiaXBBZFltM3ZBeFFpUCtyYWI0UlpvZkZDNWNLcytFT09qdnJl?=
 =?utf-8?B?aFZUN2xwM3hCeWJzRU4vTkJsRUJSTitzcGkwb3ZWREhYbUZ1WHVnUHpycHN2?=
 =?utf-8?B?UGlCa0VxajY2cVkwWU1pUGJZeEs1Nkl4VXpCTnk2cUpGS3ZuMzFib21CZnJZ?=
 =?utf-8?B?R2RHV1dGbVBQZk9TT2hEUWlkMk9FRFhXckxjc1FzUEoyczdFd0hvdlBnNUlN?=
 =?utf-8?B?Qkd2V1lDRmZCbUFvVFgzS0hLRFJCeGNBSGFPa3o2RVRSdGVkR1M5UEVMbkQ2?=
 =?utf-8?B?S2QvTDc3ODFjSkgveGtNSmxMMGticzZlTGJLYUlSek1tTUJFM1p0UThOOXN5?=
 =?utf-8?B?UVFVT2RncWtvTDFNd241Lzl3UTlITlcra3h0UnFoeVM0TWlaWVMyRmgySGlJ?=
 =?utf-8?B?M3lCc0lMcFpiUSt1N1VUbXBHbTdSeE9TbFlrTDJhOEl5aGcvc3RCK2EzYlhB?=
 =?utf-8?B?REF4aHlTR0kvam9palBLU0RxK2ZBc25nK1ZaSWgxb0xxa2dOTDVhVkpkVjRL?=
 =?utf-8?B?UjdKUHFPMkRiRHkya2piNHFYMm0vMEJXQWdsdEJqdlVnNlZBdnErSlB1RmlJ?=
 =?utf-8?B?SG44SlhOT3pUVERkdWd1cUJ2QWY2V3ovRXplY2lFRHNhT2JNMEcrbFNMb0l1?=
 =?utf-8?B?RGRCZlhwOEFQQTBQUWxFak5XaVhXOHIrWHpFWG9MZUUyV3ZSdkRReXpjNlIv?=
 =?utf-8?B?akJNWjVkQTBLSDBtdWpXUEhWYUhVVGNHR3FGVnZWMXliaWgyaTNMTUdNTzFm?=
 =?utf-8?B?ZCs4Ynhjc0xCeDZkUzNEbGwrS2h3eWFzVWdwcXFjYy9UWlBwSkRQdlRTTzNG?=
 =?utf-8?B?OUU3ZmNoVnQrSXdDRGFuc0w2VjA4NExTdm5QcVRpNGRoeVE0Yml5bllVZXp3?=
 =?utf-8?B?aC9GcUNCWkx2UXJmU3FKQ2RKNkFNQkR2SzVET0syYmxKVVBvZUNkdG1NYmI1?=
 =?utf-8?B?eWZ4RlIwclA3M2l6VUYxNUhyNHZvdzlDVUZyNGtVQ0xVbjlSR0lPRGhMNWMw?=
 =?utf-8?B?YjlTTnJLY21kWGMyRGlvVHU2SjdoNFc0ckdDUlpxdFpCNjNSanpBdGRnMzNy?=
 =?utf-8?B?T1Y1U1EwVmplNytZR1QxYUFmdVAwTkVUdlFscXlNNWtjS0grVVBwNUVjZk9M?=
 =?utf-8?B?Q05aeXluSmJPTm4xM0kyRldkVWlkSGZESjgyY0d2OThBK2JvMHVIWTJEZS9x?=
 =?utf-8?B?aUJ2cW5Yd0FVR2hTNXlIMjlwMGY3Z0JlK1NYU3gwSGRXcjBBMUY5T3M4TWlZ?=
 =?utf-8?B?UFZQTzNRdVVsOURvZ3BOVTIzTjdCRmFIOXVzNGpqck1BN1ByVG9sMVJNMHZ5?=
 =?utf-8?Q?fsy3b5hkCdIf8b28=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f83352e-d287-47a5-261c-08decaffedae
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 17:02:49.4822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zU0jDhMv24x5EA5+ldklRQF/kFckXCuq4Vv8MwO5f/ITDonzQ/MXX4s3SaRH2Lg3PMLnff6jQ4UuwpDLhn4Smup4GMNxsIHyJ9mlz9UEsPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7889
X-purgate-ID: tlsNG-16d1c6/1781542974-85D6AD75-11B86309/0/0
X-purgate-type: clean
X-purgate-size: 1309
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E0F5688A7B

On 15/06/2026 3:39 pm, Anthony PERARD wrote:
> [06Ah 0106 001h]         RTC Day Alarm Index : 0D
> [06Bh 0107 001h]       RTC Month Alarm Index : 00
> [06Ch 0108 001h]           RTC Century Index : 32
> [06Dh 0109 002h]  Boot Flags (decoded below) : 0033
>                Legacy Devices Supported (V2) : 1
>             8042 Present on ports 60/64 (V2) : 1
>                         VGA Not Present (V4) : 0
>                       MSI Not Supported (V4) : 0
>                 PCIe ASPM Not Supported (V4) : 1
>                    CMOS RTC Not Present (V5) : 1
> [06Fh 0111 001h]                    Reserved : 00
> [070h 0112 004h]       Flags (decoded below) : 000004A5
>       WBINVD instruction is operational (V1) : 1
>               WBINVD flushes all caches (V1) : 0
>                     All CPUs support C1 (V1) : 1
>                   C2 works on MP system (V1) : 0
>             Control Method Power Button (V1) : 0
>             Control Method Sleep Button (V1) : 1
>         RTC wake not in fixed reg space (V1) : 0
>             RTC can wake system from S4 (V1) : 1

There's 3 pieces of information on here which confirm an RTC is
present.  Setting RTC_NOT_PRESENT is clearly a bug.

We should probably have a quirk to ignore RTC_NOT_PRESENT on this system.

~Andrew

