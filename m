Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wERUC0DW1GnuxwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:02:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2BA3AC789
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274747.1560762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3GP-0008Hs-7v; Tue, 07 Apr 2026 10:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274747.1560762; Tue, 07 Apr 2026 10:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3GP-0008Fi-4D; Tue, 07 Apr 2026 10:02:29 +0000
Received: by outflank-mailman (input) for mailman id 1274747;
 Tue, 07 Apr 2026 10:02:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wA3GO-0008FG-7b
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:02:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3GN-00BXgv-Jn
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:02:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d4d62e-5cb7-0a2a0a5109dd-0a2a450bc51c-28
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:02:27 +0200
Received: from [40.93.195.16]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d4d632-bca8-0a2a450b0019-285dc31035ee-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:02:27 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6438.namprd03.prod.outlook.com (2603:10b6:a03:396::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Tue, 7 Apr
 2026 10:02:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 10:02:23 +0000
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
 b=aliNF2SEsW2Pcu/Rw7XI/AwnFzysFhyv5JoMZYPqKjpncmU8+P52ifKodWwEkw9tZ8qJYxSAOKKcCPoO1r1pe7qJA625+t/GPyTmIB17onk6Iw/qTJK4+CRVJ49X8+BzwsvjGZTEJsYXTokOneqPTW+bL/hRaVC4+jfrSq4+CBCtKX9G0MYLg+VRmXqmFwXUiL/JfA5VJKbx6KW3DIFwP9WnCIzFuW4fY5mQ4ccXYsBoUfOfihn/M0DVTDre0rbOrDkGF+Vfw3c/jL9RDpQtKlcBc/UJftGgaPiudrK8BQi/QTSp/EZBNdsQPNOCE0R5A6ugXSHFuppmE8dp9ZQCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2dUskJt2xzLRAQZ9C7R+tmv8D/JB/CdQYvcARuTgD4=;
 b=Op57Fhqpemv1Nni3YXCu7vCzCaBEGWYWrrUjtneOjJvwbhcTR05YFmTr+BhpxSv6q77GlhMuiuKNRPP6VgutNHh+ehPKSTTxYWyJAtxXDu010qcF/jxmMHK4aea/NX+41qtNVGgoDfBp3NCkFs+G7vEF3JZOigY6S+OzkEw5XVBiufwSst4nmVUS9ZxcfuZQZk7f744BK9qKs/+BfyOcezCjKkMNMbh0stVXdYUIHSCoRFXIYzRCVd5bl+hotv5WYr5hz1iQKL/NQ41a3cnZ0zfibnHJtPjhEO4wu/wZsStY5I55Wvj4iMLF25tP/qeGB3OQxQlVLDyVOIJteYVg3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2dUskJt2xzLRAQZ9C7R+tmv8D/JB/CdQYvcARuTgD4=;
 b=SOnDbNZxFSxCP9sEqyHmK627kjfd4JnT2fpmreqlz/ovKUUb8Zh3+NFZ8K7vC/XqjU0VDoCcH0lCa2op+QDmzif1LF9Sw0wZmUW3vvJNLz0TD7viP79B+KOHhbC962JBhVH586ddwPU5MI2i/yLOKjSZBqY0YMu0UQmqWnvTSJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <55138b49-4a70-4f97-80ab-d28ce3deb96a@citrix.com>
Date: Tue, 7 Apr 2026 11:02:19 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
Subject: Re: [PATCH 4/5] ns16550: harden positional parsing
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
 <b34b6e26-49ba-4ab8-8f43-a53c5dac63b7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b34b6e26-49ba-4ab8-8f43-a53c5dac63b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afbd1c5-f23e-4db6-421b-08de948cc3d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Tv8MLRAmJueb4lgCJfab1hAmocoAMRl7sMHqofNFHlQKfPxV9R/GCdB8mz2FZxUAwF7PR0Jgx3y/GC1tmmFmosCB6U4tz1DmZDyZf6OD10n+Na4L2QyXrPLalZ5b41p3TuPFyLJRwLE4MRBMmVK76kSx12g8WFEWsMmM3tOPUegpv2nVSm7y49sVL/6bPSZbHsXYEDB+wxJl5Q6gr+DNADu9mrTkW1E47AMtfime75+ad57oEoMOzAJzky4IGxJbeCw7uTNboNMKpRxDo++36I4Gm/3FgDzj2mugEVH0qlRE5zvjcDpn7bgECTPnLB3EBwmjkhzmlXq5L148LtSjBA+Hz7U4q2HznZox7DFqUFKr/IcmH6I0BZ8krjZPSo3qCgJ2FDULl5Iz3p6SkPSYx3cdA4p55+LCFtgqO3Wm+a7c+MOdDUMRdyK38qHLN56t6Qow/yl7h7DHy1kIO+OJJar78p8nqme+j/1oBLMxOTnnuQBI2RBypjbO0HtGS3SFUx7F+pBJVf5S+xfrWGbG4FS+RpG9e2jFIYAJhl4qOhbIUxe2cMB9zhdVaOxoPyO0ZuH/1kv9wT/FY8pchy/3ITV46427eEKqJXHim15ESFG/uGGNFfmhtlTpQHLhiz+Ov8wq+YCRwqgij+AyE4byWq9ng2UqgOVcIH7Gljsku1QL8YBA5EDUla/ifM4bleGPFh7Jy6PZUSpM/9rTp+qupHh+UC96HIcGiIBcRusqZjE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SU9wd0JCSERXekJtY29DeElleVY3YWpWS1F3MjIwUlc0RUJ6WWZRZGxCc29C?=
 =?utf-8?B?TzFlQlNnLzQ1c1R2U25VZ1hUSHdHdEl0Tkc5d0F0K3o4d08wWXpMSTQrd3R1?=
 =?utf-8?B?cEpYdFF5aVZCZEI3L1F6Y1dRejMrc0VlSTkzNGlUbVFmZlJINGlBTk1nRXph?=
 =?utf-8?B?SU41Z3QzQXZGZFJXTFdlMU1MRTVCM3pLY21BMjFDTSsrNmNlRmtKaTBvU2JU?=
 =?utf-8?B?RXkyOTVTaVVqVFVubVd4TjhKMGFOcVRGL3h3ZlhocU95VCtmVkRicndTRnFx?=
 =?utf-8?B?ZDRnNW9TOEVieUlCcEtDakt1MnJJRHB0Rk0vU05MTkhRajhWcHVGWHZIb1E3?=
 =?utf-8?B?R3RWaVIrOWV0cm1DSTB0VHVraUk1bGJxZUovREhYTTY3eUV0M211QjJLMmN2?=
 =?utf-8?B?aFRpdms0UnN6T3VVK2VQUzIrWGliUkU3bXJlb0NvS25JcXV6UUlEemlhNENo?=
 =?utf-8?B?emxLNVpTTUpKSnJSWXBVaW5lWjhKN3pqUzErMnJNVmVQdVU3RURhSVNoOTM4?=
 =?utf-8?B?MVU0Nk93WDRPVi9QYmlpTUVCVjFsY3NIMU9DYmRtMmVWbVpPUkl6a0xGcFEv?=
 =?utf-8?B?NGNoWEpsaEt0T25KZVpHVk5wRVRxUnM0QklTOEk2NS9pZlFyVUR5dUttSGpw?=
 =?utf-8?B?T3ZkdUtvWVB3SFNySjViOVdyRk1MMEVXaS9VdU5mMXNOL0xGeGY3cnFkaGdt?=
 =?utf-8?B?NVNuQ2U1b2NnbEQwOEFJOTlPSFBUYWFGTktWRE5oWUg1KzFvZ2cxY3ZXRmJI?=
 =?utf-8?B?SVF3aUQwYUxtaHJLd0pGb3pnWGRPQld0U2Z3RnljR2dabEcxWEtDaExmZVhx?=
 =?utf-8?B?UjJmZDMybFFYNWhFano3THRsL0F6Yi90WDRncTdmSDlDTTRBM09GWnlwNXpN?=
 =?utf-8?B?Y29Nb2tUOFJsWVpGQ25Ta0hQcElHTzJyS05vUjJNL1NJc281d0I5TDhLbFBS?=
 =?utf-8?B?NVo1QTAwT3hIeElxelpIUENyQ3owN0Vzem5QeW9SakY1bllsK1dpck4xcHow?=
 =?utf-8?B?RkpxT053SER3MFQvSUVIOWZMVnBSU3pTTGNtMzNCWFdkWjhoMmh5ZGpvd2w0?=
 =?utf-8?B?S1Nuc21lRUpnV2h4UktySWdUVGNqaGJRMFBKdVdFM1hGZ0pyT21heWJxeHhh?=
 =?utf-8?B?MnlqM0d0cGdmVndZSHdiNFVrRlpqRTZTMGwwV0o0VUVFdi92YVpnZGN2bkkz?=
 =?utf-8?B?UEFFZVUxTm9VVWk4VU1qSXA2SGM5MjBxTDBiMWZxVWtvZ1RlYnN2WWFUblhJ?=
 =?utf-8?B?K2JwdFBnVmNKV1hzdFYxeGZ6SUpwVmMwcCtpQ1lrdHJYOGlZZlgyeWlUT3Jr?=
 =?utf-8?B?enJUS2ErdVFwTjdyU2JMYkVPWktnSnY0VEVDOGU1ZFZjbURxU1ZyTnkxNnFD?=
 =?utf-8?B?empkQnZEdDFqaFNSN1AzcE5ESGtNTVRrcG1zRmZPUWdaOGJBZTIwNm5Ba1JP?=
 =?utf-8?B?U2c2UExBZ1NyMXVRSmNMaCtWM0w1K2hzK0pkUVcwTFdBQ1g1Z2tOMmloRWkx?=
 =?utf-8?B?YjV6QUdYK21JTyswWU1iYUxhYXF6MGN2NSt3N2xnNGxOUTgwbjZ2QU9QOVp3?=
 =?utf-8?B?SjJ5ZCtkZjM2UmpCa3VGMGZHVjhDVkJnKzlyT2k5a0N1RFVMSGthbklXU05B?=
 =?utf-8?B?OWU4ZlRSMzA3TVdwN25sQzFheW5jR1FqOXdOa2cwZmpEUUU1a2ZOUHpmaXB6?=
 =?utf-8?B?cUFjOVBtNGs3Wk1VM001cXpxRHEyRXJNUWRLSlNqWVRMWGVGYmJ0WTh6WVJ1?=
 =?utf-8?B?dTYvOTVOK1ZPRG5SNThVQ1FaMDFVRitUVFVaUXk5MUlJWFlEK2MzYVBSVWF1?=
 =?utf-8?B?R2Y3Z3E3eGw3Mnk2RjJYQ2JPcjhtdGxlaGhocjBMUG1rWTRvMFY5cUdNWTls?=
 =?utf-8?B?d25VZE5CM2pPZTNlZGdrR05KcWc1aXkwNC9WNXdZNWl2UjZwVWlvUEliZ1hn?=
 =?utf-8?B?SURXNFhwbkZSZ1l4MkZ2d2F3cWMxY3daa1RQVVY3YUN0ZXNwUG5MM2hwUEUr?=
 =?utf-8?B?MDJscWR6UmJWQmM3THh6RHFoV3BHS0IwMnpCM0lVeGdoVy83ZWZRSlNXZUNK?=
 =?utf-8?B?SUY2NTJPUEtGS0FTd0lTV2k0bmxDUCtlbFdlSU1iTUpXNXFzNVdmUGZWS0xj?=
 =?utf-8?B?ZWFmMGJuOWUxWFU0S3dRT3lXTW1oOHhoSUVSdEc2UWFsaVlGZ1ZDOEd4dU5W?=
 =?utf-8?B?bEdJYVZGcElvYU9mWTI4bW1OZW1qL3hkZkp4QU90N2sySE9QcnBtUmZiSHYx?=
 =?utf-8?B?SVJ6Y2Z6bXF4WnRFQ3ZKazJISWs5YklUYlFydDd2eUZiank4SU1UdXhPcm5n?=
 =?utf-8?B?YlhnNC83QXg5dmNlSk5Wak9pdS9UbU9rSEFORFdyUk9yS1BpaVphZFAxTVJP?=
 =?utf-8?Q?+YeNcK6aY6jcBO5U=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afbd1c5-f23e-4db6-421b-08de948cc3d3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:02:23.5572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMAaDQiRwhW5bjhEnRvyZVmRXwkleAh2xeWNUGZXkDxAxW6cnDquXO1tsWiU2f+3D7tfwPwPtDuZrMOugb5zC20m3ELDj5DiX7/RLIj4HRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6438
X-purgate-ID: tlsNG-42698a/1775556147-177422A1-C4FF6A83/0/0
X-purgate-type: clean
X-purgate-size: 413
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid];
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
X-Rspamd-Queue-Id: 9A2BA3AC789
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 4:38 pm, Jan Beulich wrote:
> Advancing past a character without knowing whether that's the NUL char is
> at risk of reading beyond the buffer.
>
> Fixes: 25de1f692059 ("Allow arch-specific defaults to be specified for ns16550")
> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

