Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 94J5NsfGQ2ofhgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:38:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6356E4EDD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:38:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=db5ucBC0;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1348916.1606706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYf2-0004Ef-JX; Tue, 30 Jun 2026 13:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348916.1606706; Tue, 30 Jun 2026 13:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYf2-0004CR-GD; Tue, 30 Jun 2026 13:38:00 +0000
Received: by outflank-mailman (input) for mailman id 1348916;
 Tue, 30 Jun 2026 13:37:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1weYf0-0004CL-UR
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:37:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weYf0-0083Jj-Az
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:37:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43c6b5-2eae-0a2a0a5409dd-0a2a4505b25c-10
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:37:58 +0200
Received: from [52.101.46.3]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43c6ae-3cb2-0a2a45050019-34652e031961-4
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:37:52 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by PH0PR03MB989281.namprd03.prod.outlook.com (2603:10b6:510:3bb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:37:49 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 13:37:49 +0000
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
 b=sjcvn+ShRN1Y+0tAqA7AnrMC3OSRKis68QxpPW0+xOAle+wbCmdVJGZ3TnaplENN7xlI0PYQXNkiCeMENHC4QQykyOJ+uIuWPp122+bEexSasjiZFHhoGBNc2FqweurY6RzCIzTkLkclch4jPNHgmouPMkgRKrqUeiRCZzBCG76be0truGnxmOtyrZ0PDJB05ZGjv3I4pITeln/tH/wuFSJEgrHgok2law6OS8lbpZtU/IxiVkn1iyWvz1LVFe94PfLZMm6CBNn5rGEymc4aJiS1xgd/mnYxnt2bsJbjmqx9RGjWnkph7gWAcUOiqaqb7m/hojit7JGtxzKvVYXAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHa5nEDubZEqXH94pKaCuna4Z8bvMYWp6efXo9AAFHA=;
 b=WnCtsVT4Ayd03ODMaNCzp9Vz0mTK5LMFMji/RhEWzxE3iCgnomc0UD3XbSkIJSnQpEevs53M8GZqxxYXcaOESzNJDHnfSAC3dYtkmhoukzmPahedQCBv+/9Q8rrrnboxbVlW/Od/+waTvOuvHhsCjuVyVLTfivMaGCpVV6F8oKJAxnYMpBn71ZuQK4Y2NhEOKHY4Mfs3LX/rH9NxadH3w0zq9Gpypttrj5iounmta7vGnNM28zMIGLLoWWuxewU7A5D1KaxPZIsjbcOs/71ewQGtQBrt54TVPOTID1ff3H/GSrG9d/OW3H1dv0o95dPGVQNbIljAoiyiuAFmdesjMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHa5nEDubZEqXH94pKaCuna4Z8bvMYWp6efXo9AAFHA=;
 b=db5ucBC0KhMHgg0mcUlIGxvv+tSZXtFFjgR9V6LcaHdWxFIPUKQ7x+zr/XVawyNJlytjS8/LDCOp+UykcoOMCkbrbocrpkzezBr3nfwKBCH7APxzWTNx+yevwXVHm1RmVdKIEKKTMeJwtbE1zq7YbxABeQLUGz+17bvrmYym9J8=
Message-ID: <065ae596-2fed-46e9-bfda-bad183fd6b67@citrix.com>
Date: Tue, 30 Jun 2026 14:37:45 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86: kexec is PV-only
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <36b16760-8888-4fa1-b486-2fa14b60053d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <36b16760-8888-4fa1-b486-2fa14b60053d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0429.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::20) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|PH0PR03MB989281:EE_
X-MS-Office365-Filtering-Correlation-Id: 308a145b-cfa0-4cc6-5e5e-08ded6acc6ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	3WNLdxuV/RTKDMr9WgxIqaa/P8IaLplhE1PqQ7ivIrkafmKgNPJvvw/q09OkVVF0jJo8S7lBPxFdVnREKYMlEdDkDGqhEAaYtTPCq0PjhAXgt4SpK/Hlf/ahOkEQXV4FSjrKHB52vQs/j0m6fKGGE3J7WEgd+cyDYvJenaI8auhGkTdj1/cdbDp1uNx4ISJT3khmTgVRt9VHlNAvSZ9M1Cre6IDxORsAVk3PVcLD0zyMHrf65Mkfqn8DWJuCRN9eTyPsdLtagDNHupT3DceBE3v7+t0q+Rj8e/+9dcmOGYDNGyj4tSjTL82Vn8NqZ+l0NtymiiRc4VfFdSwn6kKbSx+gx8Ty/nsWUzZEuIR+/xShhSKWMXYmLHR9uRzpg8yxjVvJAHFu8i980bPqi2pG8G6fbsy1mxS4JaOv0SRny0ZVzHLrK8vUsDdwcfxKxUfcDZwOe0uukWYxgWD8MDtmnX6VD+cPhKIRm5+1YQceXCRwMV/VTrApI0vDLSBB/DXFIWd89VEuEUjcknZa/AXEZmofVb3t3UbwkIhD0mFS9mJslazZZisiMGLcYG2FvJP8pfygMgi32PnKbrCbb9ojkPmpzg4IT/iIn2W7fsRNJd/5hlESnIeM2h8DzPz+3FNxjW9lOWIcoY5WqD+u90rs4QOdPZg6RWlUdg/+ZQWOlbU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnVJTWFKSGdXYkt5RlFWVll4Zmh0Qi9odmhER1RMeDlCa2xEeWwxSnorUW5v?=
 =?utf-8?B?QWpYbmtxQTBoQTRyOXA3MUFaMW1ackdPeDIwUWZlWmRicW1kMmtDcHdPMWdS?=
 =?utf-8?B?akxNclp1N2E4QTNnL3NoWW9mQUxHM2dMQ2Y2aW1WK2ZwMDR6VVlqWlFkNVkx?=
 =?utf-8?B?Mm9oZDUra1prNjZwWWJ2U0lja09rS1ZvNkx3S3l1WHkzUVJTaGNjazl6amtH?=
 =?utf-8?B?QmdpRFhmTnR4RzQ5OGQ1bkV4VktIRnJROWRaS0hLdUFIRGdHcGNMYWFXZjhM?=
 =?utf-8?B?cHVhTFNzK3dJNXJYVUZqQWxLSjBoOHZKVzl2RHhpTGN5S0N2bkNsdzhvWEo1?=
 =?utf-8?B?WkdZTjF1eFQ0OUtvSm9hVWdpallFaXk3aFFWVnAwaXRjMUxlY2xyMWxLenhy?=
 =?utf-8?B?SnhCZWllcklkeitMbWpuTGp1eUdBT0ZGOUE4bUxFNGo1OWhRUlpkUnczd2ty?=
 =?utf-8?B?SzhXeFJtNHdZK0Nqb3N3YWJZNS9HR28xRGF3WXkyTGt3ck1Ib0RjOGVNY0VZ?=
 =?utf-8?B?d3JoU3dIa2NlWDQ4bzhxVlYwU0VUZXNMNFhDc3ZadkRrczdsV3RDK1J0eC84?=
 =?utf-8?B?Tmp1bkZ4eVJzVTBiMGRZNFd2Z0dLRVdxUVU2dHV1Vy83NTVSSXhrdU9Mb0s1?=
 =?utf-8?B?VExBUDcrNjFhMldZS2VTQy9KalA0cXpYZG9DWDNuUnNvRFB2ekJBSEdVdlRn?=
 =?utf-8?B?MG5Ja0g0WHRiczdWbTN5MUxhYzU1Nk5DekFCSGY2bXNRUDFwa2F2c1ZhZXVY?=
 =?utf-8?B?S243K0pwTzNzK2hyVjJ0RVk4MXVJQ2FEVzk0UHE2MzlVWFhWZTBNNUFyVGNC?=
 =?utf-8?B?YWhQK0piclBETUFmVXFtWVhIc3JzZ2xyckZsMW11dk5peXlvSXQrc3VrdXBH?=
 =?utf-8?B?Q2JvN0x5eDg0VzkxVEtsbjRFcFovSmJhZUhPN3N4eEp4S3p2SDZ3M0FvN09s?=
 =?utf-8?B?ZVdNc0txRzZ5a0doT3hkeGp1bVdkVTBIM0VxY3FrSnZ5a0g2UDkzMzdUelY1?=
 =?utf-8?B?VUZXQ0dTYzhvSm5SVEdNMWFuRlFlZVpIWUlGaHdva0o1R3hMU1dPMmsyNlo1?=
 =?utf-8?B?NURGQUxzOEh5cEFuamZWY3cwRW53VW0zNWc5VG9kRXhic0l6Mzg1STNheXFn?=
 =?utf-8?B?RzZjVTdqMlJpeWhQTVlSUDVqTUcyQWtRVzBDRDhJbVp6U2s2UHllOXcySEhy?=
 =?utf-8?B?TlBqbFZBMXg2R1JCRU43dWUxdlFXN3lqazZieEZIYWQzclhzSUJPa29xMWth?=
 =?utf-8?B?Vk01a2EvM3lFNnZQQWlVRUQvSjQ3LzdYQ3VmMFVBNEtnS1p6UVVwUmV6NU91?=
 =?utf-8?B?dlI5Rm9IK0xIcXBTbWR5VmlPWVkwK1J1MzFDUkh0NmFvZDRXbW9lQnl5aWRG?=
 =?utf-8?B?ZXlkM0wwaUo2Sk5zSFRJNnRGQzlsRU1DeVNHOS9PTGQrMVlhb0pnWVJ3Uis1?=
 =?utf-8?B?TGVPQ0MvMTd1M2tXQjNKbWdPQTBKWnZLOHlUalV2UkVYMnMwM2xzTStCd0Fz?=
 =?utf-8?B?N1gyanFOTEMvbDc4WFNKQzVsaWswN0E3R2g1RllZYnBSaFRkYVFqY2FOWU9M?=
 =?utf-8?B?R1NveW5zM2twdkFrQVNtV3RSNVdLMityZXRMcFZ0MTRsYkgyTXRKNkg0QWU4?=
 =?utf-8?B?OHlhY2hwclZjYnIxR1JzRHJVWmNWdTNNa3FpdE8rcWZmSFdlVHFISEdFZDUw?=
 =?utf-8?B?VlNGR3d4ZjNIRUd1UWtCWlE2UHdJZVg0ME50dGZVdE5WZzhXVUREM095RFl3?=
 =?utf-8?B?RG84MTBqdHhta1RmM0NhaUJIUlQwQ0x1emY4bkU1U01vMnhxT1RDZlZEaVFF?=
 =?utf-8?B?TFFEUk96dVZjZHpkeXZoMzNZSmFocGlFVENjRFJlNHgyRHZsTDRUUkkyVmpK?=
 =?utf-8?B?N2RLNEQ0L1EvRktEc3dweU1pSzJCYnVKdlpKM2RwSE5BWjljSGVCUnpOa2RY?=
 =?utf-8?B?bktJOFZKRFQ4NFA3RkdHdVFiVDlBTFhlNitFWVRJOXp5M3kyMktaK0NTT0d3?=
 =?utf-8?B?cThJeWlDcm50YjEvdzNUUmQ0Q2duYnI4endBQmtTNDVJS1VKOFY2b0RucVhC?=
 =?utf-8?B?cmNCQXJlNHFtZHIwZzlIRXN3YU9OdHBOM2wyNkF3dW56aGNrSXdCQ2o3dGl4?=
 =?utf-8?B?dC85cG9HRmhicEM1UktQMWQ4V0V2Sks4Q0dadDIwck1zRnNleXNGUkdpMGhB?=
 =?utf-8?B?WlRMcUVSc2hZZmNvZTZBTUxzUHpHcllWL3hMUUZDSjc2NzdOTTJxYU1ZYXJs?=
 =?utf-8?B?bzROMXA2cTFWQWp2cTlPUGxRdzhEV0IycytZNnFmN1VFaDg2ZnZMc1d0V0x2?=
 =?utf-8?B?M2ZWNUI4NVpvWTE0WmMvVkxOSTFYZWRHN3o1ODgybS9uRnVMTkwzcFVLaDFO?=
 =?utf-8?Q?YxAOmJyImE2HXbWs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308a145b-cfa0-4cc6-5e5e-08ded6acc6ad
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:37:48.9969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B38NWKCvaU/qwCXjOF85zvDIXEjjQZKQ4UcZvjdgmFzhtY1h8lLxpa9ZnmcYCGvC7crwAJcnDhD9BNGn6bvB8PFlF3zeemLR9tusXKw+64Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989281
X-purgate-ID: tlsNG-c201ff/1782826672-0FB192B8-066657E3/0/0
X-purgate-type: clean
X-purgate-size: 743
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F6356E4EDD

On 30/06/2026 2:35 pm, Jan Beulich wrote:
> Kexec is of no use without its hypercall, and that hypercall is wired up
> only for PV. Allowing that code to be built when !PV therefore results in
> a lot of unreachable code, violating Misra C:2012 rule 2.1.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -22,7 +22,7 @@ config X86
>  	select HAS_EX_TABLE
>  	select HAS_FAST_MULTIPLY
>  	select HAS_IOPORTS
> -	select HAS_KEXEC
> +	select HAS_KEXEC if PV
>  	select HAS_NS16550
>  	select HAS_PASSTHROUGH
>  	select HAS_PCI

This might be true, but it's wrong.  kexec should be wired up for PVH
too, and I don't see any reason why it can't be.

~Andrew

