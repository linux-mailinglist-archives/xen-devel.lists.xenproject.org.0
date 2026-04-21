Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENyEIGJR52lW6QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:28:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BA343985C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:28:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288828.1569070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8LQ-0008W1-Gm; Tue, 21 Apr 2026 10:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288828.1569070; Tue, 21 Apr 2026 10:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8LQ-0008TZ-Cu; Tue, 21 Apr 2026 10:28:40 +0000
Received: by outflank-mailman (input) for mailman id 1288828;
 Tue, 21 Apr 2026 10:28:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wF8LP-0008TN-9s
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:28:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF8LO-00E8bz-Mr
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 12:28:38 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e75156-5cb7-0a2a0a5109dd-0a2a4501bdfc-0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:28:38 +0200
Received: from [40.93.198.13]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e75154-c1f2-0a2a45010019-285dc60d3895-4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:28:38 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB989204.namprd03.prod.outlook.com (2603:10b6:806:4de::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 10:28:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 10:28:35 +0000
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
 b=sGSeaMa7G6ZloMVhCEuz6Q9We8IRz5XMH9QOejluZWrDiQYDt0xVc02IUeGdzS+NzTI42uVwr4fXogs5D7c+5wjUTMqKWxpv1mxynX6tCa8Iti/iWS+Ag8+XICAeuuzuDNejDij9yau31Ry2GzOKBOT4yvsX21rafY/YQsa8U6Wdf+XlBZ08tdA/tBjqtsO26be1mQps76pyfTBL++0V8zPelW10OFDVks1jQPnPQFpipJc18MitA5jEsXf+pPGdsfIkD7E8onYN2CW24sK4eLF6LvKoZNyQlL8u0SEJ1xg6VBnqSAELEIE1auBJ3kyAH0Lc90MGgMyf+pebFuRBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REY8vBd5U172RlIBJPRvkNnG6pMvDq7I5it2hL6vetE=;
 b=ougdkxddTGaE0S9RmxzvyX4R2MjSUozNkVHY+hlm93k+MIYcf9aM1lnqPD5xk3msCOPkdM3dfvUQHikaAkCqAqKBsT2pTdVhl79mCid+3U11bVo++VhaQo1XG45q48A/6HplAELllO5vb632FQBgPquwHARuAMg7BU4JcgTcnx3I8hdARrH0OUkdfqkJGwTSmd1OLu5zZXqF0dzXgMPQDn8HRZQkFwcZkpu+ZRLac/2P8tCGGd+fGAQvYbXqER0w2mmSPv98ADzMyyx3HCF3YU7ioSODK512X6qqHhXtG3JkyWJMN42YPqly2OR7RzICmdz0Lr6dM/JgrMnV8tHY9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REY8vBd5U172RlIBJPRvkNnG6pMvDq7I5it2hL6vetE=;
 b=G+fWY0vX3vX5xTuR4QVCzumUfNA/PGWF9VW4Qm8G7D8FKc+9OfrmPz1UlneOH9k7Y/BBPLEIHpANCRhLt4sX5T2+8t+A7ZWHGqK/bx/TzwVwvCRIBHUcClqhAbFVd6hqT/KOLWTuHjSDFjSDoosHq2G1Fm3lYoP8ZM5aH+OSGLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0e523b85-a2c6-4507-a376-872f85852883@citrix.com>
Date: Tue, 21 Apr 2026 11:28:30 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 0/2] move KB() etc to make it usable by x86'es mkelf32
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5f299d7a-be1b-4bdb-a10b-37c334606bdf@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5f299d7a-be1b-4bdb-a10b-37c334606bdf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0208.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36d::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB989204:EE_
X-MS-Office365-Filtering-Correlation-Id: 2abf7898-71b2-4774-a793-08de9f90be5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rdaCQOXnHTbiod1fKySNXGpDR6mBc32yRwhgbnZibqaN1Y8KE9xwPUe3caoOQfFicFQ85+s42THHpE2UWXov8y9sPdiYZOBitkAnkALXNLNlL59/K+M5+bPntz4jLzvbLzHLdW+kpQS9N/jqOwWg7w0xoALLPi9xWEmVGszKSMkolAiQ6wuvsJ74Z6AlBughVCq+jXEiXiT7GmtOyMimqW+dTUPSJd2k19HTyxLVAHCU3GubC1A6JCVJgFpCXdqcygrktVejDdfIivCKn9mPc1d8FqtRUgT7ETVzmQThwyhHRXX51eDh3qUdfA7OBEbPPBx/r7gmbLwcweye2XG1bpBe8oFpYIGQ66ttNx36dSW8yGZlHB61Hrrug3e6VpYq8yyk5pxW48kXxCfxNAA0J8Tj04bv+SrqdKbBQYi88Hv0mmcO7Ykxcp9TyEfD0IawHax65W+HJbjuk6pP7zg24JCHXhrAsAuAf61b2tUaUkxIrXXQovWkqgQbpDqjts6fXSodnf9bQXcvhhJ70o3+gW/vZxYtH7w4/HVTF24yHlV1jA7up007I5gOq8S8Ze+LBrAAQ6/AHap3Nx4AB56buFd4WGTrPkCguYtHd6Oj0dCHIs5HgiTvo8mLyk6Gc5j5GiS1KmtBbtg3lF5wEZ19AM1T/ptIQyY+M0+VYeb6h385tAcq6g6fItLqQXaspw7kAiuu5tt3Ppyv0iVADekFbWL9TQ5Q2iPeFcu32Y2uM6k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjd2R3lmMGVyNUZ1dk1jQ1FGZ000eWFZaFdyRHhkbVF3MTQ1UVk0MkMvNXh2?=
 =?utf-8?B?aDdEYmt5aktURDBZbi9MRHMyQkluS0xhZENyYi9tQkRJMzVmUDFZNVF3UCtR?=
 =?utf-8?B?dTUrRVpNc01rY0VkTkxBNUEvT2xvY2JlclFva3E4OERsdkczaG5mRkg0MTl5?=
 =?utf-8?B?ajFxUVNJTmE5KzUwdVlzaEJFRzlqMDBsd3lZNG45ZVU5Sk1YSTAyTEpZTTg3?=
 =?utf-8?B?K3ZlWGxDeG0rU0IzZ1p1SEZUMWNXYis1RDd3b1JoZjh5cjU5eTNBOVlnYXRX?=
 =?utf-8?B?eHA0emFnL0VDdVphYlhiUlpzY212M2p5NTZkZXN2U2Y5OWdRdzBEcFEvRXcx?=
 =?utf-8?B?NVc5MEpmbjJrWDl6QmxHaGducStNUTJtRmkxY2l6R0RKay9kb0RlUFpaWVRD?=
 =?utf-8?B?MmIxN3Q4algvb0x4cjVLL0M0RkU4Y00xdllMZlJnaU40S2RLY1hmRGpJSDlO?=
 =?utf-8?B?VS94VmVKVyttMFBJaGJmOStKbytVakwwL0IxTHV2Z3dVZmtpVCtrNkJwWDB0?=
 =?utf-8?B?a1B4d1NXa2J0TXZVbnNBeXZ3VjRTU2RUN3gxZ25GbkRISHJaRlo1MUpxY210?=
 =?utf-8?B?cFcyOEYvb2R2aW55YVdWdWx6aGp2SlU3SDlsZ0hZNHhiVU94dWRQYXRPYUpx?=
 =?utf-8?B?aWRwdHZONkVJVXh3R0h5ckJxUDI5YVJpTHFsUVFQdXJCa0txbmR4RTVHcnpz?=
 =?utf-8?B?b1NmaDgzVFlORWZqQW1nOUhFSHo0Z1lpZFcyS0xVeUlWRDRtNXlESkNGMUxS?=
 =?utf-8?B?SW1tRWtyZEtqU0FCK1JRLzlNd0xHSWtXL1RFTWlqendKYkVXS0pqNkxoNFl6?=
 =?utf-8?B?di8rQjg3UWNiUkJqVzB3aGpFRXd4RnRKalVwTUZUbkdWazcvR1h4ZktzSjA3?=
 =?utf-8?B?OXRoZTd3Ny9LWjM4QzU0emtyTUVVK28vYXVsMStiNWJ5V0hyWDJsbHFldmgz?=
 =?utf-8?B?SWhVUkkxT29jS1JIRHp3T2U1cFZ5UDVCQ0QrTHFmeExZR3dQTkxnaUxab09F?=
 =?utf-8?B?UXhlUTY3bVB0dXRDc0dodHRpT2V5eW1FRllmbjd3aHdaY0NSWlp0ZGtPV1kr?=
 =?utf-8?B?ZUJaamExZFdaUWFFQWJZdWtjZWYyeGpTWGx2Wm0vYXg4c2NGVkI1Q090dzFE?=
 =?utf-8?B?a2ZlUTU3ZFFUUWpjb0JCR1pwY05PY1ZWbEg0VVhtblVzbmNwa21rbFdraGlX?=
 =?utf-8?B?RFR0c2g3V3R4eWVTS3Q2djJNUWg0L2EwRkdBb254V2w2Mmc2TWJsRXpGVXVO?=
 =?utf-8?B?aVVGNlhQa21qUkd5OUhSRkJFUmMvV2FpQmZSNEZHd0pMRi9PRjJrWFUwQ1NI?=
 =?utf-8?B?Sng1dFJUaFFFb2E0dVdqVUc0SmFraGE2OHJhbnQyandodnRiK2Rld3h4ZUtp?=
 =?utf-8?B?RnFxclowL1JNbS9MREZ0TjhCNDZSZytYUEF3dkZDbUlUN1hXQko2SkFvdmEv?=
 =?utf-8?B?Z2gzVGdWUzVTdGZVb2VtdFU3bjdJbW8xZnhzZVUvMHRJTWUrNk1TdlFDZ0Iy?=
 =?utf-8?B?aUpWQnlXckppc09yR01OWlJkczB4aFdBWXliNnhlZDZ4TkxucHBIK1pwMWJZ?=
 =?utf-8?B?NEdiczhmMFFscWV6cS9palgxMW44RHJTaENBTkJYK213NWNCQUUyM2RYRFEw?=
 =?utf-8?B?STBuWTZ5NnBkbHlCL3Y5WHQ2eFJSeFRlMjAzMnJML00wY3VGSC9pWFV4L3lj?=
 =?utf-8?B?ZkpFNXdlclo0VmozeXZGSDMxNmpHUkFlL0V3VzVpQzJwanhpTGVCenhPd0Ju?=
 =?utf-8?B?R0p4VnB6NVMwaTBxM2lURVhXbmJJUFRLRWwweDlXREhlVnpGTXppMnpBUHRX?=
 =?utf-8?B?cWhOWnJVSjZ5VlB2MkwrNnVLb0RQNG9LWDBzZzhtTEFpaHNLWXp1WVNXVDlD?=
 =?utf-8?B?VHd6M3ljR2Flc3ZicmcyNWhINVV0UXI2MG1XbGVvcnl2enpWUlFYb2tZTEUy?=
 =?utf-8?B?RUFuUGE3cElLenV3RUFJUXdtTTY0bmFPdGNzcGVOekVzckNKUG9ZbXd2VVJz?=
 =?utf-8?B?eU91V3lTWFZ0ZGdRTUhRdjZIN1pmQlRaVW1sb0kvNGI5RTAyQVRHRXY0dXN2?=
 =?utf-8?B?SjZsOUxhcVBpUlRsRGZXOHpwdzV2eUpIcnZ3UnVQSmpPeXlPdngrUFpmNmRn?=
 =?utf-8?B?K2Vqakp2M2RaRW5jZVBsT1ZxVklmME9iSmVZVE8wb0NXRGtCQXo2Z0o1aHNx?=
 =?utf-8?B?MmozMEpFblhyc2RvK2t0a2dYMFUrRU8yUXB2cVJ4eTN1OGhDbU80MGVINTls?=
 =?utf-8?B?Q205UW9tUmMrU2Q2eVdpUlgxZENIZE1xMzQ4QWZVdFppeG1mTlJzaVNjc3ph?=
 =?utf-8?B?RTMvczJpZU5DY00vWUluNEtHcVA3WnE0NyszRUpmRWlJS3ZERlNrWnlCM3ZB?=
 =?utf-8?Q?rbXRD/zRNhq/C0Lc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abf7898-71b2-4774-a793-08de9f90be5c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:28:35.1677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spABmKhG88jBSUa5f0G67/XmTZYsKjIMvyfSmbUlv90945qhq8Ebb6wPJhhznz0dRD15dYsQDK51p9UWhkZQuEEL95d6FfxFymQ89MpblEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB989204
X-purgate-ID: tlsNG-d62444/1776767318-BFC74FF4-4C0A2D48/0/0
X-purgate-type: clean
X-purgate-size: 384
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 09BA343985C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/04/2026 9:35 am, Jan Beulich wrote:
> mkelf32.c doesn't want to include config.h; if anything, it would probably be
> autoconf.h which it might include if so needed.
>
> 1: include: move KB() etc to macros.h
> 2: x86/mkelf32: use xen/macros.h

Ah yes, I've been wanting to move them out of config.h for a while.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

