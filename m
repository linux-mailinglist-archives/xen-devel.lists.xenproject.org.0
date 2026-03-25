Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAdFIS4ixGmZwgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 18:58:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A9C32A2F9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 18:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262908.1555216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5SU1-0002M0-OM; Wed, 25 Mar 2026 17:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262908.1555216; Wed, 25 Mar 2026 17:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5SU1-0002Iv-KF; Wed, 25 Mar 2026 17:57:33 +0000
Received: by outflank-mailman (input) for mailman id 1262908;
 Wed, 25 Mar 2026 17:57:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5SU0-0002Ip-40
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 17:57:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5STz-00Djdd-GA
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 18:57:31 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c421f6-5cb7-0a2a0a5109dd-0a2a450895de-16
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 18:57:31 +0100
Received: from [52.101.62.3]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c4220a-1950-0a2a45080019-34653e0333f2-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 18:57:31 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH7PR03MB7834.namprd03.prod.outlook.com (2603:10b6:610:250::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 17:57:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 17:57:22 +0000
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
 b=FpA0x0MiyKe+UFkaZE24Px6Y705K0b0BBqnGYrlctsJ7LwcWBXLMTMOa1Wa2g5b+/Gi2ivIfLynBRtTkp1rZHv+8W/SY8ZB9aMgJE3uFIP2ZyJc4YYaluHhNjljX7R0C3nQ0Ks7Kq/JezpEfrIwMWmKIDI2G2IAbwpK/9+rlayVpwgJXAsyi/Mq9vP4E2EDxX7/k/WE9LBUb2PiJgPMy8pWF1bzQfzDlvR2Lf4gWub5zczXUVryYuxzgRz4/qLIZV/tB26Exvr8It4Z/YmB30ZTfXX8NB5RjfO638vLac5cJj1bgm98zF72YS88fakctQLPmTyTxfHJbfvwHCC71sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDI5HUHEtewLgS8n/ZdbVrbOmqMLBLVgjnZksf+/KaM=;
 b=DxN/Vd3DYW3WW3sj1riV28FzA+WkBMA7U0neD7+cz9TtA0g/ZlREmTdV3XDOtqDORysPtrx0xnwRWtjHNCAocpbm0aNCx5+2Q9dyKf76TFbNAEnlO9K79ltOL6ac7ECRVTa8qnkGF/syzGJLopDBsaV4DlFrL1KI7MXXsZU08BiGqllFWyRnqjmFiX764bGb/3km5wcj/2+LsMPJmg5fiAgl2jSa0IJPl9QZ75fVtMbpko4RZBlUd4XUmqlpsBKz8881cvKZIGrvrpAJ8SAdM9rgEWAovHEKwkAdoTRbm/e7A/D7s9z6PjHPgJ4Ywxapk3JktdrEnmoRh3WkvAssqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDI5HUHEtewLgS8n/ZdbVrbOmqMLBLVgjnZksf+/KaM=;
 b=JmOzmlclb31sFMcUwaD0QSiXmclP9rXQtodkFOiexnhi4+8AcbwuIA0Opr8qHpIf5J02i1IYfmAfWhXXRTPY1x1U5XTtmxLHrW+THbFtB4/6dBuNoK+zplE/GJq1mt4jTIU5dWROnp4Yey3XUlluq7KakX111brdPl8Vf8fzU94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 Mar 2026 18:57:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/time: adjust handling of negative delta in
 stime2tsc()
Message-ID: <acQh__WRAoav6IHN@macbook.local>
References: <f97bbfb5-389c-4845-84fb-e6f07ba0ade8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f97bbfb5-389c-4845-84fb-e6f07ba0ade8@suse.com>
X-ClientProxiedBy: BL1P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH7PR03MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: f70f2c08-f8ed-4ae4-8d98-08de8a97f6f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8+32wdfH9gjXnreTrIHfsPJ7X1ZquyS8arM/TfzP6Bpb16JH3lmHrqvuyKJCQEwsTFL1JMXaEQvhvmHFJ/QSj816GU5a9G+n2zISVgZieliKbKxTspqsRibUGXXuUt9vE9dSGpb+0FVxcFMOKkFnMahpWe056F8u03ArQfMUC+wFgs3H+Y4kPP/BXF8OWsXMTGU5OsBF25pc708rGgbjnCSFmcKcmVjzFLvU3abgqoSVRLzsQyOW0I4TkIeJG6dB5MN/bVOOMi8T0w3czqKv6r/xQ7w3PS/LJgz2yijBLhCRhi+RYf5qE5McQmI4gc+SdniSlUKvwFnjkGpxFZVN37R+8UtEfgNoogt7bkHYSI90FRMuPmHIcyp0aCKlvjDDrfICp5s/RW0Ubxo2P0B8M0Wq5sHjtOA02BMKLr56FqxSoRYjKejfqYjlrv31CKShNbIGVte7ESLjJtJ5aVKrvs2lcvEyP5wKf8t61J9rUYH8pfJvK+JFt12MVZosZ8LFrREFqhSNm63n72wkprNGPgfrJLnNHvwQj/8jyUUCO00IGVPwbfMb+rrTXP4LAzNfJuWJult8OmLaMsqCkNGqvHIbH3AGuWWpLw812UACVz5WjHiy9kMt/uV3DEyuUnCb65iQdtl+JX5dzVDvT0FOvsFakF1AwfBpcSkob9NgznxeHPjsv5pL6wN1BGt3mW3msOI66Q10/SuzZBAg/JDqFN5CwiKAaQdAMeJix80t2Mw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2xsMitNVDBwcmdEQTJBS25Ec2ZORDdrSEoxejZhREdmbE13S1Q2bFB6RXR0?=
 =?utf-8?B?MU9XZUJMbW5nU3lpdytjVFNTa0QwUUFVOStrUDV2SGs4UFJTaks3d0s0d09o?=
 =?utf-8?B?akNDNDd0TXBFeVB3RGVvSTc1SGRPNXRCSVVoeUMybWFEcFBVbEJua3QvYmdO?=
 =?utf-8?B?L2lQditzL0YwbktBSWlvQlk3bHdQUTFHaWRXUGxwekN4b1RTR0N2Nzd2SWRn?=
 =?utf-8?B?c0FEMXdWZnBGa0twWG1tV0haK0tkZHM0ZlFsaWVhV3pWWDlLT0VOeld6SGZo?=
 =?utf-8?B?VkJqZ1dyUVROY2FwcG5ZY0lFZmdiVDJyZ2c1OWFyd3lqQmlCblpSYkpPZ21Y?=
 =?utf-8?B?Q1IzTzdDOXRHNTRJc2w3bnpmSmhWZVQ2cTZHZzU4eWVZYmxrVDlreGlpdEMx?=
 =?utf-8?B?ais4Q3p6L0FuOXp2dElyVVU3Ny9iWGJlQlFaYzhDK2diN1JibVpYY3BMZ0U2?=
 =?utf-8?B?ZFpQSTNaWnpFZnpmU1dSYmVja2NtdStEVENTQlU3VkZzeEtFb0VmbThYNUc0?=
 =?utf-8?B?NXovOWI0Zk4ybk8vSi9OZWJubCtHanhNa1NJN0pQak82L21lTjhlSnRDdTFh?=
 =?utf-8?B?SnBMc1hLRzBDalNqNDk2RzJ2K0M1dEQyT09SQ2hwSVR2SFpMRlY4QmtXMHZN?=
 =?utf-8?B?ZTBvc3lBQ1BveXAwWHZGcWNnYWV1S256R3RFOVJpRW1FNDVHT1FLTmZpajJt?=
 =?utf-8?B?UEZpOXdTb2RlQlFtNmNORWZ4bmQwQWxQQWxucXdXYStTNWRrd0Nid212dWhV?=
 =?utf-8?B?dnJsTUpVYlFzcGhZcmdwUnZJY1ovYmsxbUtydlpZaStTdEFlUE5Ba3lwbGtI?=
 =?utf-8?B?K0t4Ri9tQXFFcGxndFM1K3liQVV1MWZsZmh6V05jN0dkRDV2Z3FERWpwWjY2?=
 =?utf-8?B?aDVYRmpjRkh4VE5ZamZ3dFNuVDZBQWwyM3ZpRi9kK3ZmZ095L1c2REp1TzFz?=
 =?utf-8?B?NHVycE1BUzBncTZ3dFVJU3M2VGZnRjQ5dGFsaXhWcld4enJBblBXNzBzY1hY?=
 =?utf-8?B?by83QktvazZHeHZQTlVzcmJxNXFaWjVDcWRGaTdscG5zQWE3L0JTaXhwRTZG?=
 =?utf-8?B?ZFNYdFRxRS9sMm9vcGR0ZS9lOVFXUFgrTUVOT2VQeDNHa0kzdUZ6d1VCMXEx?=
 =?utf-8?B?UzBGSktnRjR0V1RGMmwyNE8zR1ptZDlQSG5RN2pZZHBYU0Q3MVR1MDBsOEl3?=
 =?utf-8?B?bWd3OWNLK0lwV0ZXN3ltb0dwMnhoR29UOG9RSkZDR1lkalRROXd2M1grakxY?=
 =?utf-8?B?MGFYRjVSRkRWcjRsdVpVT1d6N0d1VnRaVjlOa3dxTExJZWpCRkhESGl4TFgv?=
 =?utf-8?B?NTdVRzROdE5zeGhOUWEydjR6Y0gwWWFpdmV4cDBrV3liZzZ1dlFDMEtpVkM0?=
 =?utf-8?B?T1NodUZLRW5hcGRKK0pQd2ZaM1Byb1dMUGdVWU83dzNjZmhKL2g2WlhLRkx2?=
 =?utf-8?B?VXJyTmJ6ZjI2bFlkV0o0NjY2ak1jTXpYbk1WTTUrcDBrVmVpR0dUWVV3VnRs?=
 =?utf-8?B?VzdkQzdUaUVhNzFzU21FVThBTFNhazM0TDJjb2pRcU8yY3ErMFdWdE82Rlhl?=
 =?utf-8?B?VHlMeUZwQlEyTXp1WXFQcVJ5QzhOdTg0eXo1Sm93aTRqUllUNGdpT1EyMHhT?=
 =?utf-8?B?QytmQktjSnpXYXZDRkhtbEVreFZtMUpCeE9jVGU4TVUxb2xqT3RteFFXaWw1?=
 =?utf-8?B?aWR0YjYxUlpoMVBLTGJ0VFM0VDkybmxvZzhNd0x2emdNVlBwZlExMllUbkcv?=
 =?utf-8?B?VTRDZFhaZTBIOW1CV3BaOEhJVjRvODVCUko0Y1RqRHBnZjFMczZza2hOQmRW?=
 =?utf-8?B?bjNjTTBGa1FVVk9aQVlUN2NPTWdpM0FhRGRuZEFma052TTlab2dqdzhjcFRw?=
 =?utf-8?B?bHZwbEdzNGs4OERpV3RyQm1nbzJIY2drWUhhcVRrOHlySnVkMjFQLzFnRjFH?=
 =?utf-8?B?c3kvMFJLRlBhVlplK25VaW14a3JuVTdCazMyVlhYN21HV1BKanFBby9McjB5?=
 =?utf-8?B?S2swME50VFRhUlFna2tWQkRYRDBJM3djTmIxU3pySllidDhwVFNnMHpYUGQ1?=
 =?utf-8?B?WXpFTGdJWHJDZ3U0eVppbk1XU3lZQ3pieGxZTWVIcTdoU3VVK25GZ3EyTWtv?=
 =?utf-8?B?VzRRYXpYOEc3T1hoRlVPRDNHM3lGQXU1aWNyM0txMllNcGM4NVNBSy9VcWFm?=
 =?utf-8?B?bndRMFJleGlCalJQVmlTcHZGeHFlWVcyYkJsNTFkdXZqT01KRU5RdEl2VkZD?=
 =?utf-8?B?bmFaQ3g1K1dkU05adHFnNzA0TVdFSmdhaTh1WjJ4QmxNbEwxcVU2a0tvamVC?=
 =?utf-8?B?eVZxeS90VFl2eTdONDJRb1hKN2xIOFVSSVU5bFV1V2tYWEZjRG50UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70f2c08-f8ed-4ae4-8d98-08de8a97f6f6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 17:57:22.3643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzOnyha8qGftnbFOPngNj9TRK2oP0M+1TAsnqofBoSQu46PsyEs+eCMJuPYG3ILaftNL2zfteqjLby0LcIcqwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7834
X-purgate-ID: tlsNG-c1860d/1774461451-F141E726-8D8BFFA3/0/0
X-purgate-type: clean
X-purgate-size: 2097
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E9A9C32A2F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Feb 10, 2026 at 11:04:59AM +0100, Jan Beulich wrote:
> When we cap negative values to 0 (see code comment as to why), going
> through scale_delta() is pointless - it'll return 0 anyway. Therefore make
> the call conditional (and then also the one to scale_reciprocal()), adding
> a comment as to why there is this capping.
> 
> Modernize types used while there, and switch to usiong initializers for
> the local variables.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Adding likely() to the conditional here does make a difference. Question
> is whether to do so, seeing that there looks to be a possibility (of
> unknown frequency) for the delta to be non-positive.

Hm, what I've done lately with {un}likely() is not attempting to
optimize for the most taken path, but rather use it to force the
compiler to optimize the fast path, if the function has one.  The slow
path will be slow anyway, and hence any compiler optimization should
be towards making the fast path possibly faster IMO.

This function doesn't seem to have any fast (or slow) paths, so I
would leave it as-is.

> 
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1176,20 +1176,26 @@ uint64_t __init calibrate_apic_timer(voi
>      return elapsed * CALIBRATE_FRAC;
>  }
>  
> -u64 stime2tsc(s_time_t stime)
> +uint64_t stime2tsc(s_time_t stime)
>  {
> -    struct cpu_time *t;
> -    struct time_scale sys_to_tsc;
> -    s_time_t stime_delta;
> +    const struct cpu_time *t = &this_cpu(cpu_time);
> +    s_time_t stime_delta = stime - t->stamp.local_stime;
> +    int64_t delta = 0;

Why do you make delta a signed integer, the value returned by
scale_delta() is unsigned.

>  
> -    t = &this_cpu(cpu_time);
> -    sys_to_tsc = scale_reciprocal(t->tsc_scale);
> +    /*
> +     * While for reprogram_timer() the capping at 0 isn't relevant (the returned

The capping might want mentioning in the function prototype, as maybe
new users expect stime2tsc() to return TSC values from times in the
past.

Otherwise LGTM.

Thanks, Roger.

