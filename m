Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKPdCDppHWrqaAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 13:12:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8407961E251
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 13:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323840.1589506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU0ZS-0002Kz-Au; Mon, 01 Jun 2026 11:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323840.1589506; Mon, 01 Jun 2026 11:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU0ZS-0002JX-6j; Mon, 01 Jun 2026 11:12:38 +0000
Received: by outflank-mailman (input) for mailman id 1323840;
 Mon, 01 Jun 2026 11:12:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wU0ZQ-0002JR-AB
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 11:12:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU0ZP-006gvf-9O
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 13:12:35 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1d691b-5cb7-0a2a0a5109dd-0a2a4507da9a-24
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 13:12:35 +0200
Received: from [40.107.209.13]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1d6921-229c-0a2a45070019-286bd10d980b-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 13:12:34 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DSWPR03MB989166.namprd03.prod.outlook.com (2603:10b6:8:361::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 11:12:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 11:12:28 +0000
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
 b=L7a3i6KVQOF4kzrxRPxalGPeDOgNuNVIusN89scUt1rAKnatysfCPrbTZoA7BBIIPO1zGOssqgVBmssTmJtL5EZ5jrRZ6Gl83UMWKrSqcfeAiQ5P+gJDKmXBKZV39PkddzsbsP6H0beTiKzPsh4yupTSVIlvNUgGcdw4SJhsieNhpkxdrX8DFUzssvWeNsmcY6zVCvZTNRE0sKPiEERPBOUE5pwrYxMbFdsJdzOy0jkkmd3/zyBy0aqmVf6uGIwaYc9cbRkYb2nVfo+wj0DN0y0ipPq1byMzU1oHUKizs7s5KLmgLPFxTt+knoqRLSnmrs2A+OYUo/6QUHD3OW0cwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlSAjt+cn+N8AfCcHlK8pSsQnZoF5lloqNUDwk+Y56k=;
 b=sOKhFNxs5+t2NIlPM+D/ESzrwsN7BWYSN1uCsr5rK3RO6X+VfwQooVsZhIQul9FqT5yFngWiP6E3WbSr3+5LzsRcATiSqPqBMmjdIJQBDx6r68aMia4AEJL57aqxr09iAmBAJPsaRnIDrrUHezhvxgtcxH7f1QEpEa3l2QpGIbA9lqz46bFQk8A4XEnIu7y++wFHIhtYgVkNaLLMla2n1LpmUOh18tMtXFp1weuGH4tKIg/a969I6Q1ATgu4Bz1SLY79DT854sM+Hjkri8oCfuIGFcCMcLWXtngSIOPlDNLur5xlW5nVPWz8m4SW4ZS5ikUnLf/kV6Swp4llsifDnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlSAjt+cn+N8AfCcHlK8pSsQnZoF5lloqNUDwk+Y56k=;
 b=NXzNYvxH0H0otwejaQW6r0sXx2djZtW1Ab6RdugMDOB+UM1EsA+tIqVnkWSd5GtDGCyTUM4I39FM9tpSLBZoBkb70YWxpMgFuuaA/jGFubc8PKUwIrI/CsOtDd6WHoPKDeXlPd0mg5Cm6zbbluS/y1OHrUGxp6E6nJMsCbB1FkQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0c7048d3-7283-46a9-ba2d-2b02cb5c3da8@citrix.com>
Date: Mon, 1 Jun 2026 12:12:25 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 jgross@suse.com, dfaggioli@suse.com, gwd@xenproject.org,
 stewart.hildebrand@amd.com, jbeulich@suse.com
Subject: Re: [PATCH] xen/sched: fix stale schedule.c references in comments
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
References: <20260601053022.6044-1-frn1furkan10@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260601053022.6044-1-frn1furkan10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0246.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DSWPR03MB989166:EE_
X-MS-Office365-Filtering-Correlation-Id: 924d1fca-87b4-4d7a-cba0-08debfceab1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	j5oxyodyLOTkT00swRNUFBPPNht9rWUTpaPvKsPauFeMUGFXsrf+IFLDeFFqzlC/gkqte+ln4EBFoIrBKz7WXPR/GwiDueGC5fXpRgZPUQBmDFyvsLcm9U7prsrX0ndaF6wxezDsElP0AGhHs/xE0vbipE/kMLi1/3Yd5e7lRvzgPC1gOuj/+Ec6aVCsvKcBjdXcflC5YV78HNuv0zxIP3n9sDp17BaikFmABOfWBV1lZ0v76eWVNa8KOYMIBR3AZNixjkh1lcU4UrmOA2wWRVrZFCdcIB0ESsQh73Kkb10NXRml+2+lkmM2kvV/OU37b3CcOoOgSGsTQS9WCs330rm1yuOJEcfq9mg0yHeUF4HDiKHeptHWFwDwjzrx7L0Ulx+S3uEa5HzVwZTyiNIHExydyaOKQLayvXAeey763hsGq8PYbY2k2Noz/N07bKyB7MtzMHQ8op0flJR8X22R0+f/QuGhJHbHK/szW2FQBeh4D3rCCSng7v8Ht8zgxmV/6xtfcfEzzTLlJqBHzNnehPeQkzyYGbv8pFmFoo+K9S8AW03duXqQltOqqvVdFcDj5krqZ4rKYLYmFvM5KLuFF/g2cmcPLeCjYPRdXQWYAtmWzVADSqcu/07ge6ksiNl5TiTlDtIv5rmlNAZmPvUr604CnNkml+lB9HaOi4X9Ilj2s9xEbC30E/wdCRQqoMk3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVVtZG5oOUp1Z3BzM2FjR0I0QjFXSjRKRDdzT2IxQm5IdmFGcVViK2ZSdThk?=
 =?utf-8?B?YlRjU2JDRFdMY1pPTkVEUWNvNVJZSDFZd1d0eUhhYmRjV0JkRFBGUjVwWXVM?=
 =?utf-8?B?NzhSUEFXRi9NVk9BaFpvR1VsRjBleDNmK1YwdytzUk1zbW5STVBueDJqSjh5?=
 =?utf-8?B?YzR4WXRaTVpGWGgvZDRYVndJZURzTjNsa2swbmZTS1QwcjBzYjIzVlFwZnRs?=
 =?utf-8?B?T2xTLzAwR3dFN3ZpekRqMmJmL1pxSWw2TmcrcTQxdzB4MnlPSGVlVHJ6Q2dn?=
 =?utf-8?B?amVxYkE3S2pmL3ptZDlVVlVVQ1U1UVdtWm00YXEwZ0djaXlIWlNZeU1YaGFK?=
 =?utf-8?B?SjVPbjZpZHlHb0RzNXg4SHZzN2FvUWdyV3lEeG5hOVBEeGVxcU0zb2xsQ0Q3?=
 =?utf-8?B?YmhNM1pmcTI4d1dsS1pWcGRiUmhlSWNydnVqQ0hSWmg3d3JIQzZXTGpOMDQ5?=
 =?utf-8?B?K0VZbWxLbU1OQyt5SE9XcDZzZjdVWXBrOWFoZC9ZUzBlbGZTaUhwamNyVGFG?=
 =?utf-8?B?Qy9nV0pwbDdjNy9OUUxkOFBHd0ZiVUxkSTBzTHFSbDhxakZZSlkwTFhxM0Rv?=
 =?utf-8?B?K05BaEwweldZei82VUhtRkxZQTBDY3B0L0swQWRlbE5KUVljQmhnZ2V4My9J?=
 =?utf-8?B?OWRJNkdYWHlrQnNKSWU5RWllWElIWWFBT2VqNkF0OEVNYm80SmpQTVF4U3pN?=
 =?utf-8?B?dU84MWtKR2c4Y1FyL3lqQzNocHJVTkpIQjBoVDM0d2kxeU1tSWVuTm1jUUMz?=
 =?utf-8?B?NlFya2ExQUt1YWNIdjRPRWg4eWRadWh1TWFLMFVnVTJ3WmVJRllsUzdZUlNF?=
 =?utf-8?B?ems1MlAyUkdnZkVrOG9QNE8zbG4wSGt5QnBCbFVvK1cvb1hHQkhOZFpTTFAv?=
 =?utf-8?B?U1cxbDNzQ1BGUU5VS29xb3VMVXp6NldjVXlha2Vrdm5ZZGUyaHErVUxodFBt?=
 =?utf-8?B?S1lxc2Mzbmppb2llVDFKU0VYdEc1emx0WHFjcUJOMVJBd0ZiMEJiK0lsQUpS?=
 =?utf-8?B?MHFXUFlzSVJFV01tWXdRa3JqRk5tVVlGTGZnbVFnS1BwbHlRZ29iUjlFK0xi?=
 =?utf-8?B?cmhsSzEwcGd2M3JrajFCYWhQS0RDVzhvWnZrbGFjZExOTkdNVEFuMCtLVEtQ?=
 =?utf-8?B?RkQwZHpDNW9nSisyYklDcERvaS8xdHNydXdrRGwwbkxKRDJPc0xMdmpsU1lt?=
 =?utf-8?B?dDR1Yy8yM2c2SjgyUU1tNUk0M1FsNElrT1JWK200bm5nNWIxVFNDOGZTbG5K?=
 =?utf-8?B?WENyN1BsZzVVVzAwV0drb3dZRnhodUYxL1dJMFYyQVRHcEpkU2xJWEtnbEtq?=
 =?utf-8?B?TlphSGVFRm1QTDJXL2hjYUlCUjM0VXNSdnNIVjM5cmdZUkVDZGpaRUQ3VGdU?=
 =?utf-8?B?VUJLMUhuM0cvcFE1NU10NXhvbnBRcWwwRGl1OWFELzhpbm1WTlNFalN2RXF4?=
 =?utf-8?B?MTQ2UW5nOGdNOEdtOTlhcmNiNWwvbjNNeHRpbk9OZitEeFUvSG5qUjFzQlhR?=
 =?utf-8?B?NVdhcXhkQ2FLOEFZb3NjVG9BYmRUSlgvRVF1NE91QXk1YjA2d2VyUzhjS0NE?=
 =?utf-8?B?d3dES1pqTFJNdXdBdUdFcVlXQWNuK1hDNHRpMWJWSTJQY3BHdjdlSXorenFS?=
 =?utf-8?B?R1QvOFAxcjhtUGY2Z0VlM1Nxc3pUbnhTS1ovNE11Qlpyeldob2NvRTFTSFk5?=
 =?utf-8?B?RjhEU1B3SEdvVFJvK1ZaZzl1RW1YTkR3OUNYeVptNVBEVmxsSlBmTmJ1TkI5?=
 =?utf-8?B?UzllVmJLK0lHblFiRzBQYmdPZVVnNW9Jd1UxYUU0MkVHNWEyTDk1NnFTaEY4?=
 =?utf-8?B?NVFKcWhOT3k0LytGMmFZMTY3eUk1ZFEyR2lPT3k1SFU5bExEbnozeFpQUVpp?=
 =?utf-8?B?cGlqR3VPYkp0SkV2SmNPOTJqUGl0ckNHZnhWaENRSFJIZGJSL01KbmY5b0pR?=
 =?utf-8?B?VDFVSjNVcUNrN3lkcEN2L2h0Vlpha29FcmVYMUVHQkw0WURldTVtR3BsVXd1?=
 =?utf-8?B?Z0llV1R3UmFjbE4xeHprS0N3amg1dUdwYy9lWWhVbENlcG40S1YrM2J3dFY4?=
 =?utf-8?B?S2VhK2xLZXh6SmJ3bDlweWhuTUNRczlSTVNudUJXL2d4VDJlOG4veUM0elEz?=
 =?utf-8?B?MGthd1A3VkNWVGcxVFIxbUxhbWkrS0xkNUdDdzh3YU5DeTlIY1lDQnJCUHNO?=
 =?utf-8?B?OVVXQzRUa0d4M3F3SjNNeXZ5NnA4a2l1RmhxUkdJOHduOWRrVE0yYzF5NVRl?=
 =?utf-8?B?Z3l0MUxvNTdCcEFhQjh5SS9Mb2tKaGgrUUxUZWNQL2p6eHFRQStuNnRpbHQx?=
 =?utf-8?B?eDFsT1pOcC9HcDh5ZzhPODdaTUxHeW5HNjJzc1h0NjFVU0FOWG45ZEg0Vm1t?=
 =?utf-8?Q?AgoVjgRcLFyKJ3iw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924d1fca-87b4-4d7a-cba0-08debfceab1f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 11:12:28.9100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/v7H3N71yuH34PVAGPHlrsF9jXElxUlAMcLwpr33ECgBNSNgWQwAdJAjwWEM6wiKba/yWRq1gFfyTak6XkO/y10hGrgxUL6ZRxvVawlVbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR03MB989166
X-purgate-ID: tlsNG-ef75cf/1780312354-0A971C48-F3FA3736/0/0
X-purgate-type: clean
X-purgate-size: 1979
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jgross@suse.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:stewart.hildebrand@amd.com,m:jbeulich@suse.com,m:frn1furkan10@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 8407961E251
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/06/2026 6:30 am, Furkan Caliskan wrote:
> diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
> index 07656a57e9..fbcdc53f7b 100644
> --- a/xen/common/sched/credit.c
> +++ b/xen/common/sched/credit.c
> @@ -873,7 +873,7 @@ csched_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
>      struct csched_unit *svc = CSCHED_UNIT(unit);
>  
>      /*
> -     * We have been called by vcpu_migrate() (in schedule.c), as part
> +     * We have been called by vcpu_migrate() (in core.c), as part

As you've found, file references get stale, but so do function
references.  vcpu_migrate() ceased existing in 9a36de177c1
"xen/schedule: Fix races in vcpu migration" in 2018.

These comments want adjusting rather more.  In this case:

diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 07656a57e979..5ee26cde58f6 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -873,11 +873,12 @@ csched_res_pick(const struct scheduler *ops, const
struct sched_unit *unit)
     struct csched_unit *svc = CSCHED_UNIT(unit);
 
     /*
-     * We have been called by vcpu_migrate() (in schedule.c), as part
-     * of the process of seeing if vc can be migrated to another pcpu.
+     * We have been called, as part of the process of seeing if vc can be
+     * migrated to another pcpu.
+     *
      * We make a note about this in svc->flags so that later, in
-     * csched_unit_wake() (still called from vcpu_migrate()) we won't
-     * get boosted, which we don't deserve as we are "only" migrating.
+     * csched_unit_wake() we won't get boosted, which we don't deserve
as we
+     * are "only" migrating.
      */
     set_bit(CSCHED_FLAG_UNIT_MIGRATING, &svc->flags);
     return get_sched_res(_csched_cpu_pick(ops, unit, true));


still has all the salient information but is rather less likely to get
stale.

~Andrew

