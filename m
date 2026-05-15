Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A+OMtr2Bmo4pgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 12:35:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD3054D6E3
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 12:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309825.1580861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNprl-0000jo-TL; Fri, 15 May 2026 10:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309825.1580861; Fri, 15 May 2026 10:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNprl-0000hl-PV; Fri, 15 May 2026 10:34:01 +0000
Received: by outflank-mailman (input) for mailman id 1309825;
 Fri, 15 May 2026 10:34:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wNprk-0000hf-Hc
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 10:34:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNprj-0066xo-Q9
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 12:33:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a06f694-5cb7-0a2a0a5109dd-0a2a4506d8d2-8
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:33:59 +0200
Received: from [40.107.200.10]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a06f694-7371-0a2a45060019-286bc80a4279-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:33:59 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by DS0PR03MB7204.namprd03.prod.outlook.com (2603:10b6:8:122::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 10:32:53 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 10:32:53 +0000
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
 b=MrAT/WTUpEBLyeOkjbZIbqDAkx1isPYJwQ+DsraeGwYA599Ov5tHQ75S+w5BJZWagd5A99uaGoYPgGTg+S1R1Iw94+R8a/mbU4u5fYL3HsfSYShgiOj/n8CBp3+01TOYZZ3tXqLKOj+Rm9gV5gCwKMAmSzPodbBFVNFsmqWDkjOBPK/mPiR+W+ISQnoMFZJa+KuKxVVBmfNDZf2vD2SNmvqgJE1rS3+bL0u0c53WLdrN9mYAZgV39hwYkJpKDiXABzweFZcNMpK8fb3uqDSoDGplBMunXFc7PvcCEATyvZcaKYA8MDA+0RLsc9dGdD14d6f6aH1zqfCBjE8KpAF2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiQOaaIiVKnCo8ByStn4RAq7eucU797GJ07Fezt0PCU=;
 b=Ae3wmpgjnGfLAJ0hg1y9SiJQefGGw219+gFSIwvSILMqmY39oPn+W6sc0L2FLekYjQCr2FiEUkwxnSvD3aAlDrD0zhg3St/MuEx34d5v7E1akLRe24W5NR7oQkPJXC0D09rpoaovQyL8K4SR97AhhOEQktOnkPNKi9I26mde8QCiRWF9IRFQVO8tk0AFzyZ9jqintEoPIgrMqN5YOi7t2hOLWeHE4B44R7md6SWSiJSei8G6vrhs452G2rw9ezqCR4KgLKHXQsJ7/l5N55m/wFeXpE4Ln7R2B0cyXA0Q6aCcCycyoVjYboHBvn6jDUqEpecsR8SetMK6KxE9mEXlqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiQOaaIiVKnCo8ByStn4RAq7eucU797GJ07Fezt0PCU=;
 b=x5tDEMaG8R8ZfSqWHz0QUgv8zf7XsYNpPqkFPfchxR6PWS6vYQsNNyNqwj0fi+bsPqL8vQU2lNQUNiNzixwRs4AGwJ/553YsuyDxvfcKNz8NHHR7EmMNYlVvaC2ZVVYyseykiRAKWI0BzCC+fbryElnfVF9Ki3rnKkbh3YoM7iI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <87b5f720-8130-4939-aa80-24e865561748@citrix.com>
Date: Fri, 15 May 2026 11:32:49 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22 v6] x86/svm: Support vNMI on capable hardware
To: Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260514175623.1869042-1-andrew.cooper3@citrix.com>
 <1778836825.8631fc262581453bbf619ec5b2062170.19e2aefe501000f373@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1778836825.8631fc262581453bbf619ec5b2062170.19e2aefe501000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0054.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34a::14) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|DS0PR03MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: f5c965e2-f57f-405f-153d-08deb26d524d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799003|56012099003|4143699003|22082099003|3023799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ypnROulUthe9Xmp/VJsNN2VwSvE22GvsYZxCv+pO1ydeLJqPeQdMtd2jpkj2dvSezUokPbc+Gnf5tNenkDLphl7tQ2B3/02ph5+KaoPfoNPb5Nzfu6uRRrquG2x0Uwts1KTamxybVE0sqhCwblB7ulyu5RSQTv62h72FwFRb1lt0RbdhAnuO1gJJJvIpJC/uhAufOPJzG7E4HblDlHHw1vHpcHI2SNKlZC9v/ili2S7qaDCZJ6Gu1FifZEGWAjTq820resbBVQcqUUDmlmDKPI2nPbftcObI12Q/qntQdZ/srk5+mPoURuYEt/dRyDTt34dMKyWnhuQTZ3jCueM1CUiSdDzO7p0Fa9qKchlZilRZNo7rL1se16TAcxEZu3FZ/APJtYRhPP3xUZVVfmlYJnB/nXX84KM0fISC9DaODqYpL4cZy25UiC3SO0VhfvdDWaws+FCEPwmQcWKGdXG3M0x9nmm93aEyRQ/g9/RBMnQ4bI7Clr8WtfhcjPKsQ0u6yPuZKTUeiLLrIagOjutUc5+mpUfobC54Qi8di+xrHG/v+xZJEuRLPJpetasYwD85wYreDiXimwNcsbUYedgTWBiCO+l+hOBnQGg1nA2hLMlSFTkBwaBDU71JjHjKx/Hc1iU1omISb35SdP+Y1Zr8q289SqdKiUOI9t6Jlf6vXtEwIob2gXinvP96/+by6nlv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799003)(56012099003)(4143699003)(22082099003)(3023799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG5EVklVemV4SEU5Q3FKeHJXZVJyMVI0dkxQejBQL21weDAvWVYrMnhOaEdS?=
 =?utf-8?B?bVduYUUwWnZKeFhXVGJ0L2R5RXNyTXRZZi91eDR1VHh5ZG5YSDFlU2ZVaUl2?=
 =?utf-8?B?Z2hxM2tsekV5OGREQmJOQlcveEdZQTFOcFNyT0s4cEIzRHBXYWtVYk5NOFU1?=
 =?utf-8?B?UUhEL3IrNFAwOGJVNTZZMTI4WEdPTk95c0xzTXdsVk9ydTB3VVBpcEtyZ2Ur?=
 =?utf-8?B?aW84ZUJ4VEZ3NkVGUHc2Y09NZlljTVJzNlE2MkdHRHlIWjFvSS9rR1F0clRB?=
 =?utf-8?B?TGM0VmtjMVFzdDNsdXpzNGgyTWVHT0ZzMWoxOUcxZ2p3dkJSS0RzdWFJSXRw?=
 =?utf-8?B?b2tGM1VEMlZySStqMDJGWG00ZE1nNGQxY01KZWtGejJMbm1KMVZEWHhqSFB0?=
 =?utf-8?B?WStWQngzSGJEMGpUcUNwb29zblpRZWRsSDE3U3dLUGR6T0ZkVjhCa1YvN1Ay?=
 =?utf-8?B?UDd0bzAvVGlQK3hMRUU4eXRpTW4zZVNML0xrcStXZmQreVA4SDNtSUZZVjFF?=
 =?utf-8?B?bU4zUURVM1kyZzF5YmZjeUJQVkk5a2EzL2toajNWWFI2T1oxclhidzByUDND?=
 =?utf-8?B?SC9KNUJnbXd1QVJET1VDckJVNGhOUTJGUFk0VXlnYmJZUVJlM2xOa2xhWEVj?=
 =?utf-8?B?eTRnRk5VbEx0b0p2UU9QejlPNExBQXJ1QXZEdzlhUGdaU2lXRWpwa1grejJG?=
 =?utf-8?B?OEtLSmZjeXd5ck9LTVNrSjArQWQxZHlhb1lPRm9RcmlrQmgzam1jWnJTVUhn?=
 =?utf-8?B?YXo2a29LTjhxQnp6Yy9ScGhndFNwTWJHSUdvUm9TSG4vYWsvUnMwUmViQWpx?=
 =?utf-8?B?QnI2WGdvUkFtR0RlZWhucFFETXp5M2NtQld0U2tyZHZmMEJOVXl2MGZ1VnF3?=
 =?utf-8?B?NVBQSG5KT1hvMWhraGd3bHhKZ2xwRXFEaEJWdHFia2pOa0FPZlZLOW1KZ2R4?=
 =?utf-8?B?VGZkS2xNUzFMRFNtNk55SWpGcmZmWnBsR2Vpb0xsS3RaSVJuNXludHFFYVpF?=
 =?utf-8?B?ck9OUXQzODZUdnhjaFZIaGQzMXAvbDNYaHBCQ202MVV0L2NyWjUwN21EWEVI?=
 =?utf-8?B?VVFEUk81bUpiZUhBOStDOFZwOE5LdmplczZQSUNIU1VLcGlFZzR0TjBReWlx?=
 =?utf-8?B?WUYxUlQzZ1l2dG5DWjZqVDF2Uzh1SFZHNU5tc0FOdjZwdlAybFVKM0R1SHdX?=
 =?utf-8?B?RWJxMnN3SW9ORmtvYjMzdjZwcGdVYUN2REwzNTR4YVVXRk1FbjV6UWc2VHlj?=
 =?utf-8?B?TER4bXNpY0ZSQ2duV25kMXVPUmpuWkNPc0Y4azhFd3Bsam5wYTBBYTFqVUVp?=
 =?utf-8?B?bDEvRG45cmFHR0w3RGR3UGRRanI1TW12d29RSjJXSFRuRTJIMEg1T2cvWVpi?=
 =?utf-8?B?aHNaNUJJYUFlajJOZFVrSnMxZWhYUXAvWndwVnpmeTNPbXZjWW9ndW9Zd1NV?=
 =?utf-8?B?TDdEeFB6QUwrLy9GSDZ3bUdKem05VDFsRTRaT1JacHlsV0ZGNnFxVXROYUJ1?=
 =?utf-8?B?TCtZajJGK2ZHSFBnTUthekR2S0RFdlF4eW5PY2hoeDFycWN6L2NyazlGZUpX?=
 =?utf-8?B?QTNZaUhmeTFiYnQySC91ZTdJbGxGWlN2azlQa3JPOVJ6WlgvM2krd2lRSURx?=
 =?utf-8?B?Wk9yb3BJcEhidUw3M2w5NE11OTZLcml6NU85WkUwRC9hbFV3UjZJSkc5N3JQ?=
 =?utf-8?B?QnliVEIwbVJ5WkdLcXVHeXRuMVMzNkFjaXdlYkFXT1lOWmR2UVhpTjhVdnR5?=
 =?utf-8?B?Y2gwT0IwSUE2a0g3ZDdEZlNIK1pOYzlGTEV4S3A5c2tMdU10VTdIQ1dScm0z?=
 =?utf-8?B?VXVZN2o4ZFhXMWNGSXZkVFNxSFUybCt3R0dmZDVkby96bDhOSXlHMmduVmp2?=
 =?utf-8?B?VnFaem1sVmhLMmprUmNRNTU4Q0xBY3Z2U3Q4UWdwS0lSZm9JVDgwa0tRQXE5?=
 =?utf-8?B?cXFZSjdlNHR6YVdCVGdqTnVYdGtkU0FqaHJYV25YRDAvUHlBeHBrNktJS3ZW?=
 =?utf-8?B?NVFQMmNnMEFFQmlTRnVjbUsreE4yalZjQUZ3Z1dxTGJmWjRGaXIzS09TK09E?=
 =?utf-8?B?UHRBZWJNM29aWXFjcE9GeGllQzIvMkduRFRBOUpZR05xMzdKYldlUFZVb0dS?=
 =?utf-8?B?bnFmc3l6K3B2VWg3ZnVuQURrVEY2cUllMTVSbG5mT1dYUXVuUVhLUEVweVhw?=
 =?utf-8?B?alQ0aHYyVGQwckRScmRDUjdyUGw4Qk1obW00OTBDbkRqWGlIc3VqMDlEODE3?=
 =?utf-8?B?azVVNFRBS1JEdmh3WGV5Sk9IT01jbmFCNkZ2dFgrSkxGZkdnZEYwdW1UdU9X?=
 =?utf-8?B?SkJxSWp5bVdmOE5TbTMwNnNsYkE2YjdMd0NZaVQ2UFNCVnZhQmV1bFNRL2hR?=
 =?utf-8?Q?R//lMyndTzVRRfsc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c965e2-f57f-405f-153d-08deb26d524d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 10:32:53.6131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0Uv9yAl/98t5jcUgz+yO5AZoANt/UIGXljjrnM/IoTdYRrLBGjlQEb617pup6+GneCtJX9/TMij/yWa/NyvZTqbHTeJMT4AiVEhdwoFKlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7204
X-purgate-ID: tlsNG-16d1c6/1778841239-8E78DD75-943CCC4C/10/73395122804
X-purgate-type: spam
X-purgate-size: 3534
X-Rspamd-Queue-Id: EFD3054D6E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:abdelkareem.abdelsaamad@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:oleksii.kurochko@gmail.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,amd.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 15/05/2026 10:20 am, Teddy Astie wrote:
> Le 14/05/2026 à 19:59, Andrew Cooper a écrit :
>> From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
>>
>> Starting with Zen4, AMD CPUs can virtualise NMIs for a guest.  On older
>> hardware, determining when an NMI is safe to deliver is a challenge
>> and Xen
>> does not handle all corner cases correctly.
>>
>> With vNMI, there is an enablement bit and two new bits of state in
>> the VMCB; a
>> pending bit, and a blocked bit.  These directly map to the CPU state for
>> handling NMIs, and are maintained by hardware during the running of
>> the vCPU.
>>
>> When vNMI is enabled, have svm_{get,set}set_interrupt_shadow() work
>> in terms
>> of the vnmi_blocking bit rather than the IRET intercept.  This allows an
>> emulated IRET instruction to re-enable NMIs.
>>
>> When injecting a new NMI, simply set the vnmi_pending bit; hardware will
>> deliver the NMI to the guest at the next suitable juncture.
>>
>> One complication is that, when delivering a second NMI before the
>> first has
>> completed, the mix between common HVM logic and SVM specific logic
>> will try to
>> open an NMI window, malfunctioning as it does so.  When vNMI is
>> enabled, short
>> circuit this to not consider NMIs blocked.
>>
>> Signed-off-by: Abdelkareem Abdelsaamad
>> <abdelkareem.abdelsaamad@citrix.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>> CC: Jason Andryuk <jason.andryuk@amd.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> For 4.22.  This is somewhat overdue and makes a concrete improvement
>> to NMI
>> handling on recent AMD hardware.
>>
>> v6:
>>   * Plumb through svm_{get,set}set_interrupt_shadow() so that
>> emulated IRET
>>     works, as requested several times during review of earlier
>> revisions.
>>   * Expand the commit message
>>
>> The !vNMI case is even more broken than I'd realised.  Besides the
>> "what if
>> the IRET faults?" problem, svm_enable_intr_window() basically ignores
>> the NMI
>> case and simply re-enters the VM.  This causes the pending NMI to
>> only be
>> injected next time there is a VMExit.
>
> Does that happens often in practice ?

Which?

VMs don't tend to make as much use of NMIs as native does.

IRET faulting is mostly relegated to misbehaving userspace.  E.g. one
thread uses SYSCALL_modify_ldt to invalidate the %ss/%cs that another
thread was running on, at which point the next reload of that segment
(generally the next IRET) will fault.  But to attack this, userspace
needs to hit the IRET of the NMI handler with this race, and avoid the
IRET of all other interrupts and exceptions.  Perf counters is the
typically the only way userspace has to influence this, and we don't
have PMU available to guests by default.

Then we get into differences between Intel and AMD.  Intel unblocks NMIs
even if the IRET faults.  AMD unblocks NMIs only in the IRET completes.

With Xen's current SVM code and without vNMI, IRETs get Intel-like
behaviour WRT faulting, and already pending NMIs get delayed.  Software
needs to cope with the former, and the latter (while far from ideal) is
generally indistinguishable from the NMI being slightly later than it
was in practice.

 
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Thanks.

~Andrew

