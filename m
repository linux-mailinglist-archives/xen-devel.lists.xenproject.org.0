Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGMIJvwkD2paGgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:30:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBD25A85DC
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:30:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315420.1585234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5LJ-0007fu-FN; Thu, 21 May 2026 15:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315420.1585234; Thu, 21 May 2026 15:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5LJ-0007d0-CA; Thu, 21 May 2026 15:29:49 +0000
Received: by outflank-mailman (input) for mailman id 1315420;
 Thu, 21 May 2026 15:29:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wQ5LH-0007ax-S8
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:29:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ5LG-00BMCF-Qg
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:29:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0f24ea-5cb7-0a2a0a5109dd-0a2a4508a654-2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:29:46 +0200
Received: from [40.93.195.68]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0f24e9-63b5-0a2a45080019-285dc3446a67-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:29:46 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7310.namprd03.prod.outlook.com (2603:10b6:a03:52c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 15:29:38 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 15:29:38 +0000
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
 b=cwjlBOWJq2iyGR77f/p0fUsUNB3970w3PRi8AANyAhqec8AvWyG2sG7p9WLdnAoPojOOn4rrEvk1jtZUiA8JhKV91y2Nr1d8c1qA0/nqVUvxRxbJdWHpU8PSquXCZDkoDqHdD8kLcJRaLyLO4rcFqmcogmrvVqcAw4QxIirN6QOJDxzXc1/W53MSIKSvCaiCE3VxZ1Dz449ACv74w7Ut50mwsnDRWzpxWWdlW+bYihYWkRkPcZRUrcgaCTGwkKLoUriFwiYU6W15KPdrKm8872M8651miykz1B1Sfn4eSPrvLQmxjmEhAB0ogR5mNvmsCZwv2ozng/jgdAhyGghvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xBNqvUwrbmlMpswj2eD8cOWiaiZ+c354uqsWwNo4+U=;
 b=iHCUn4PWkWRYv4Jkh2dg5M0UTHP8TXS55Fk+sEmw/7pzsTCKH28edPqXdNHauI2YdjP8/EHf7c1B4qroco8PY2Kg0sPupuQ+NgZHGpfPXNOStd4ZxNYyrb5tdYOmS8rzYHf/cSvv2Z5kjhZqS5YewAICG0Pw06+LAYHUNGs4hxgMdKk4r7HpgSVTqmp1yEHCKeWEncB9GGxF/Tf05US/LQfD7+lxNrfdUTDWW3yW3juBIGP6gZgp7Mq32hm9p92ZQCVWLaIV9a/dkO1vIzCN4rU+noa4t2nC3VTG9kUv+6Dy0nght9dNSxFlcRnyMSgz8DiBDFlTHu+vx+dot6z5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xBNqvUwrbmlMpswj2eD8cOWiaiZ+c354uqsWwNo4+U=;
 b=sneKqjboyip8m9EtiUZNKVJF7wYTmCDaNS8oUjufJ3aI7BNgQSMk2oBK3cMvnu75eERU2PQrQtQsjH8WQ9m2yOCJCnb+L2cZHm1GDS7L/x7exEJbrLefLA6JrdfRf9mn7kLaTSwetk9ePxZNJY/qmR4RFVNoSkxNAGtj6oqamR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fde66682-abe8-44c9-9324-85eb430e996f@citrix.com>
Date: Thu, 21 May 2026 16:29:33 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/4] x86/shadow: avoid sizeof(this_cpu(...))
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <738daea9-ebec-4299-b0f9-49448293106d@suse.com>
 <3e70e912-cb57-42ba-88a9-45e9e3ebab49@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3e70e912-cb57-42ba-88a9-45e9e3ebab49@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0203.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: bd290c4b-9e38-460f-54a2-08deb74dc4fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Djj5pzHqkegY9AngYzw5pIss0bgi0H3yxW6EHC3kxDb/ANKRjVn5C993dL3TMFcE4ee1cOAPfBJmwQ7kG78pbQ9Z/vo6hVOSGNZ2NsWjoRz9FJ040OSNFcAYYH7qa4KrSOKCD1oWBocliilEuFPmTl3OjYcQErh1QdZ180FgoUOXRQj1WYeGBNos+n1yVCx8YB6CzUGFyE8fwVQC/OqEF+DS2kh8CbANcgL8vjVuW8i7cPsZ7pUHym2jaTaWS8TlF1lTM0mcd52ugfQyDV1d8Mkb++QUbaCPT6O/M249X4bwqFvyy3oGevxquZ3ttkcxVapIzUAKFq3ARPjA00Tdv2edWT81+KAq5g+PgOFUfgqm+zkU+yAk+pneeiKQdZFDLviKTiLn1PgZ32QULETBJhA8lg8w6S3M2zNu5QSkPXEFjccxctZpRHIHvOgtMJ+j+S0RsbCf74p1U8MyVmiS+b9CBUCGYu78qPbqDxWjl1ftUCbX2hUJPrX3AwYosvrqEWSnFn2KBpUMrpPpPuZUvWDAsidCVMFfVUF4HnFU5U0L5FOO1bdIGRffn3Jj3OOp3PNlM7VqW2bAT7s4UtIUqycb1euZJs69pO2S+jBhL1RzcNV06xbcX8yE8662K+dQ0QlDJ92GcNGglcpeilV1bBr2l+iTLA4SepzG8vA/KLwEYIKC8KusGRoOOujYiuZf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzRlbGVoanFmeEFVa0NrS082ZHg4QWwrZXRMd0NCSmV3dVJXdDhGMjh0OXRC?=
 =?utf-8?B?bFJmNjhHRWxXT1Y1eTNPcjk3RE5LQnlUSzJ3Q3lVZlAweVVWdGQrdnd0SWdQ?=
 =?utf-8?B?V2lCb0RERWZnWVBGd3d6YytyRjVWcjVIN0dscCtiYlI3UVRqV2ZPMTJEeEVG?=
 =?utf-8?B?TVMzb1FhOW0xK2s0MU9BY29EV3Q3ajFFSWRCcmtVV0hUcnN6VStPR0xHTWxX?=
 =?utf-8?B?d2dmMEx5eTk2QTRpengyQnkvY0FTWXlZNE1Tb1IyYVBvdDY1UGFYRTJrY2k5?=
 =?utf-8?B?MldHcXVOTkZDdEgyemxySFVhTXIwM2czN3lFbUNybkRVQUJ6UWFTbjgzNkdQ?=
 =?utf-8?B?dHNzMkdwaXg2aXpKQnpOcGl4MHAzYnJLZHdTS3JzbGJTN1FNN0ZkM0pJcU5C?=
 =?utf-8?B?SnZ2SFFPd1FlL1hoYndZZDE5bU1oVG1XbGxnOGo5aHd2OUttN2QyTFFNTmtx?=
 =?utf-8?B?TFRBY2pYekY5NG1xeDBDQmNHR1gycERHUUNvNEJDeTN2YTFjUWZJa2FQV256?=
 =?utf-8?B?Y0wxR1M2cTNuRW5Lb2xvWTkyZXp0dis1RHZHRis0cDJOcTBTZWpFbGtjbXZJ?=
 =?utf-8?B?VzlrL01memt4SW5IZCtvcU5YUmFEVTdUR0Fqcmp0elZ2VUUrMzVMVmVwOEFW?=
 =?utf-8?B?ZVpuLzVMRUwxMGQzSCtFQ0VzYUhRbmZKVmZBVFdvK3pONE4zNFNacEpLbE5R?=
 =?utf-8?B?QjdtazByMHZ2dGVvcDlLK3phTlNIcUFnVnFIYk92KzlXSk1ick04QmRZTjZY?=
 =?utf-8?B?dkNndFR4aDFEaGxmRm42UzNvT042WEpLaVRQYzl6RnNqd3REZEgxaDgrYmJX?=
 =?utf-8?B?d1ZUVmp0cmZXQ2tvU3h4TlkvbE5sbVJpYWpUeEpyWHk1Zk1jVHc0eHBhOFJh?=
 =?utf-8?B?VlluZXhoWGFjOER4RmJBL2FiRVIzVVRYY2d1U3N5bFc1NTVrelhFR1N0YUNw?=
 =?utf-8?B?dnNRYTRSWHhMVVg1eGUrd2RKaGFWSmZyNnRweWN4UmF5UGxGWjB6cnVDNTZO?=
 =?utf-8?B?ckUvK3duN1YwVTd1UU13dDFnZ2kxTTA0Z2gvc2ZXdElURnYwdnF6SWVJL3By?=
 =?utf-8?B?KzdOZllRWW1IemVxUTl4UDVaS0lnc3RlYTFMcXc1RGRObGNxbUlnS1YzMGpp?=
 =?utf-8?B?UnRla1BoV21nK3VjVHpJTU0yZ0hVTUg2WEFjQ0JVRzVRaDRYNzNMSjliY2JN?=
 =?utf-8?B?Z3lQSTFISmM5TWRTZ3ZXMkJkYVgxSDZ5aVFxUExxNUJUZjd4WUFmcVQybDMr?=
 =?utf-8?B?c0VmK2pUakxwb1RtbUd3cER1N1ovZmlRMWQvT3FQaGJHMC9iNCs3VjhDSjVt?=
 =?utf-8?B?dGRzRkEvZGlqUXBPNzJHSVVvR0w3UzkwcjdtbFZnQW1mRU9CVXdTSzhtK1k5?=
 =?utf-8?B?TStvdTdRWTVTYlZzS3licHd5Umx1dkFNV2xCd0RxeDRHSUo5NEwrVFdCbmhu?=
 =?utf-8?B?Ym92ODZBSnYzTnllM3RNUWxONDVwVkZWRk5xdSszZVl6Mkl3TUNIN2dZY0Vv?=
 =?utf-8?B?a0NQUkM0Q0x6cnBBOVlFYXFPNW5NTy85RkFFR0ltbm5MNlNGdUFkd1lxR2Jj?=
 =?utf-8?B?U2prdTVKblM5OWVqUW5Za2U0WGFQajh4Z3hhRm4zQ1JydFh5bHRCbHNJLytq?=
 =?utf-8?B?RkhpTWkzSVNYaTFQd0l2bWRDN1RabEVsdE5SMkhRSHNObTd2SkZLbzZWa3dp?=
 =?utf-8?B?UDJuM3JkTTJweXRaMjR4TkJ5bWx4QUtoQlhOSjZydE0vZEZRU29ZdUVrcXY2?=
 =?utf-8?B?dVlPNjBUMDJIdEc1YktJbVY4TGs3WjVpTXFHbXZLRk1Lak1GMzQvOUs5Wjha?=
 =?utf-8?B?eHk0Z0ZUVnNPNW92WXZNSkFvQ3lRbkZTYTJQT0NoZ2JuY3pVZVlwbDlPLzRB?=
 =?utf-8?B?NkozbStoc2thNkdWUXJ6bk9DWXRUeUJ3SXRWNHJMZ01mQjE4ZGh5VDdwMTVz?=
 =?utf-8?B?dXR6aFJYM2lERTJjeXh5czVaekhoMDQ1azRIbGRaMGJnRENmVGs1OHNVdFV2?=
 =?utf-8?B?OGtaa2tEYXZRL01rbVIzS1dMejVMTGo1UDdxSlVzU05DbDkxUDFUNkVMNkRi?=
 =?utf-8?B?RGVKMTJTVm93a3F6elhxamZIRFRpSHVzWElPYUdXY2VVMUk1YW83ek8xdXh2?=
 =?utf-8?B?WFBtV3VkOHhaVE9kVEgxR2VIbVhBeG9MN1FoYmpZZi8vQW1ZVmZwSHFTT28z?=
 =?utf-8?B?TmdHWjNvcmh3STJvUXN2MVNIeU9DeTZBUms5MkRBRGY3VTl4Y01JOVlSSmxF?=
 =?utf-8?B?NXFpM3U2TURoTnU2azFrcnd1ekxsQkVWTkNWNWRFRHZrWkMvTjVRWlNBNHlu?=
 =?utf-8?B?aDdwOGY4cVBZdUZxV1BvMWNkWFlwbHZoWHIzUDcrd3VRQUFPcldSbGpJaE16?=
 =?utf-8?Q?7zgxUkIsYTeN4vbk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd290c4b-9e38-460f-54a2-08deb74dc4fb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 15:29:37.9043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QXedpBcPSwAYALDpVN9eRqkbbPq0TTiRIps43ZT4gUE+jQv7Sd0Czzr0kx/jQrjXT9f5uBWrBN6OUSrSC8OGN0FWerrlhY/w1JvpfB1jEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7310
X-purgate-ID: tlsNG-c1860d/1779377386-C4A7ADB1-2FFF5894/0/0
X-purgate-type: clean
X-purgate-size: 476
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim,suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0BBD25A85DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/05/2026 4:15 pm, Jan Beulich wrote:
> Misra C:2012 rule 13.6 takes issue with RELOC_HIDE() uses inside sizeof(),
> as used by this_cpu(). Latch the address of the per-CPU variable into a
> local variable, and use that in the two sizeof().
>
> No difference in generated code for 2- and 4-level code. There's a small
> improvement for the 3-level case.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

