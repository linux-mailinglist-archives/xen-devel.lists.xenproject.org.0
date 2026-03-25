Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MM6FjL4w2nPvAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:58:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C909327517
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262510.1554991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Ph0-0003JO-JP; Wed, 25 Mar 2026 14:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262510.1554991; Wed, 25 Mar 2026 14:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Ph0-0003I3-Ex; Wed, 25 Mar 2026 14:58:46 +0000
Received: by outflank-mailman (input) for mailman id 1262510;
 Wed, 25 Mar 2026 14:58:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5Pgz-0003Hm-Cd
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:58:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Pgy-00H94M-Oi
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:58:44 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3f81e-5cb7-0a2a0a5109dd-0a2a450b8c88-18
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:58:44 +0100
Received: from [52.101.52.57]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3f823-ef63-0a2a450b0019-3465343945fa-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:58:44 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB8032.namprd03.prod.outlook.com (2603:10b6:806:45a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Wed, 25 Mar
 2026 14:58:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 14:58:39 +0000
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
 b=F3FBUMdoo8NBUo4GSWACakMgNySExrJ8s4sC23Zok81KfYJgakc/sbUu2wZZGzS5F1FyRHp5BA49JPGQdJjdcWVt0SyZW58lvnAgUiNYffCpSh3XzuYBKyGHW/ixxUaXEBrOLMk1kMERlGstSZGhnzZbrCHLqc/EfN7lXUBb3uoI2U8uLwM29t+dkY8fU8fLQVOoa0SLOSylBxCNJ9Me84S0aggLQiQk1VK/6VhPwHRg3t7mA2zS2tpYVubvs7U0cNjrGR9DEusAZbuYUAqREgQ2+4NC42Pi69zetu0CmPdueiJe01lQEoOiXdcaM5gkn1h7NMbkdOsLxWdE/kB70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCCbnci/1/Eb/HhtKG9s1fldlqwHd88/UxiGZ/Ck8Yw=;
 b=W0uRWdl+sENRJYCNhastCSV7r2y6niXWxQ1ihxdxk8fD3fksYgr9BrTxriAg1y87ALp31hiEELQXyEaycEGqwq3luliZRNb8fm5OBrpigWFEc/4u9R8DTb0VrMFGUvqXQQgDodPo8IDfcMI9z0dFMOhR3Pk/cb9WL2HcM5P3Km9Ait11VDcyKs8mIfTqmH13cZ4pHnhtArBW3ZdnzG0NBneMN1QKEJYYJpNiLna43k8JoztNAgfd4Kn8vTcvJgpgLvzkZSy96BcVhsppZS0GD+M2Nn26/VN0RjrVuN80kBVLJ18Dz0iuTdjN7zGwVIYht0+eg1kjBbPvY24Ja8DchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCCbnci/1/Eb/HhtKG9s1fldlqwHd88/UxiGZ/Ck8Yw=;
 b=rDlcdElYr0BXQSVxVzIWxju6ika5OYpM0Ot1drHOXN9Vp5on5CN8LpfXotfxQHR/vn67o9TK1idq9jUh4HojpDr0tSz5K9YSY45URkrqORmFKSMwG0hFi0RSvXXKA0Ljmu0uSLTZK1hKPYpLkyLaaA84XtOvKmrvCdqcUIZpWvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/4] xen/uart: be more careful with changes to the PCI command register
Date: Wed, 25 Mar 2026 15:58:21 +0100
Message-ID: <20260325145824.31601-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325145824.31601-1-roger.pau@citrix.com>
References: <20260325145824.31601-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA4P292CA0007.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a28ed3-829a-438b-568e-08de8a7effb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Cj92Xa800JsgpTwsbQH5CXLk+hlt8XkOTPXROhjzBzr9O274BJvormJQEAaBfUP6ThxwE4NO77LVkFLM2Ip9bzKQpjozF+/EpNEi0jIUzEVkcB7dpfD0wHefbtNdCQoW7Np83IhZX5T1hk8WGScxkWCzkk7NHxth0aM8Z4ZcVQNGktcfb7ix2czWflvMvLHtmirmptVI92HpUqS3nLdWm4n6BV13CiJ40KNKQDdn5430gtjw5JDFurZL8GPwzVoUQ1K/uNHL+bf06+x4jhyHSyl3ISMFe9FbmlJW3yfF4+NHMud4H/U4w0jkGCNlWj29WN/xkGCmFq91vUKKcz/rSITf5l3itg1wv67lOBD4slVisTVYUUSE8yLGlbAdxYOW9DCNNJE+wKZq7IQf/kfoSmc8RLQOJ7Atyw74cyfTot3j8xdLqvJ8Kr1CYNmvYu4o9ImK21DV2O4mogIiwkvzVGDLkmZBn5Kep+qz0LvkAaeX/2axyUnK+3ipkhCx2OWLPjEQ1tIEurFaOUPZRWDYvtoM1tMg4M2kyPMlgGpqBUPstVotAUfHgjBz2geKbXNxi8A041HuDVy8bjFBL/i7go+OLJ+XIE/3YDgT+Za1++eV4fMPLiIuC5ss1FP4kbxuqdE5MF7xrXxCvM1zn0SUaRNdlhDVnba2yTxLk7SSI9shZJQJqT5fCfFr064ijbfwfvB87UTDo5LuhnxhFb/dY7B9YJP7vr07p+MGxH26i9k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU96eW4wOWljYkNrQW9VRXpFVkJQeG1MYTY2N2l5dEYwK0s0MmpSUzZkbnhx?=
 =?utf-8?B?aS93SXlLTy9memdZSFRZM0M5MGROMDdIWjV2RVlkOUFTVVBoTHAvUitrbFdP?=
 =?utf-8?B?SWJnbS9xTUU5OUtjU2RmQmVNY2dLTDE0OUp1enJuR1crU2VwMDBEKzYrdloy?=
 =?utf-8?B?WG1SY1Q0TEM1cmUvN0hHUHBOWDJmL2MycE05WTY5Yk9aQkVhbmdRaXhCRmdo?=
 =?utf-8?B?dVZ0cXlUNk5pNlNvZTQ0KzEwNEh0R2pHcTloU2xwRVV4ZXdPbHJnVEFsL1VM?=
 =?utf-8?B?MFE1NkJQUXViR0Z2ZEpCWUVDemJDUFo4Y0lBNGlNUlRPbHg0UWJtNkFOdTFS?=
 =?utf-8?B?OEhjVHB6VzhQSUQrWGJFTUdVcnBVMzBkelpocjZmb2REYkM2cGJieWlMaUlm?=
 =?utf-8?B?U2dEeEtxTU4weFo2UUtHWk1kMjc5UHZ6azdVQW5vaEhtRXJNNUtQczdSUVFj?=
 =?utf-8?B?Nk80Vnd3WUpRWUcwV0dncUp6WWY2WTFNd3pnU1MydGNrUjhKNnNJZ2N6dGdD?=
 =?utf-8?B?RTJ3emd1OHpQVE1pdVZiaUpodEdQamdDRVBWdDN3a1ZOSWFGdjJRZzNUSTZj?=
 =?utf-8?B?Z1NwMklRejF2RTEva2F5aTNZV256NDlrNFE5YzB3UlkyRzNzSmZveC9QR1FR?=
 =?utf-8?B?djJCTXMyaEZuYWJlSHZBaWhnaTgxZWhkeWc4Z21vMHlkSEFSNm1mS2U5djNl?=
 =?utf-8?B?NDkyU2F6WTFQdUw1S1E1Mk81ekI4RGh3R0RxNGM0aFY0RmczMlhpYWxiWWh6?=
 =?utf-8?B?a2E4YkMrR0hVZENnKzNVRVZ0YmNRbFpyT1EzTG8xVGpZcGJrYS9Uc2lZU21L?=
 =?utf-8?B?dzJKWjRDQWtBd1dXNjdzdm9QV3NjSnNhWmIvZXB6TkZjVGZpeW9XODlUSk5S?=
 =?utf-8?B?c0pxV0VUbnpWbEtBNHUxejQyclA3UkczOVplUkF4UWp6bFYrL0czWVFXZGpq?=
 =?utf-8?B?ZVRyd1crTnhVNWk0MGZHSXBrUUMvRHBCelNIcjY1ZGVXKy9BQ0tKelgrdmd2?=
 =?utf-8?B?Z0lDQTI2QkJWS0ZkVDlTckRCcWNhOGlabTZydGs5bXNNM2k2cERXSytuOXdL?=
 =?utf-8?B?eDAyeXd6c3ltTnBpUmRxdHQxaDFJdEZwTkNQNDdxVDNnNEdVeGNkSVlNRnI5?=
 =?utf-8?B?bUtScTNZRGFSRGdSanE5eW04Uk5qWDh6YkJFWVpFSnlQK2pqazQyNkFtTjZI?=
 =?utf-8?B?SHhnUDdEWG5EVXE5Y3Q5Rmk2YXpzVWdvMzZZR21CMTFySng2SDJZSDI5azA4?=
 =?utf-8?B?QXltZjQ3OFhNVnVnTWJwbitIQTdBYWNPdlV1SDVUVnRFc21hVjB2bFB1eHp2?=
 =?utf-8?B?UzNYOVNkRkJRaVYyM1VhZndPSEpvUXRJK20vTFVweVNDeEYycGtJclFzUkFB?=
 =?utf-8?B?U1kvWUJaUWZveENnYzhEMFZUajNNeFQ2ZVc2U1R2QzZ5ZjE5SVVWUTYweHNk?=
 =?utf-8?B?OTlqNHNzVkN6N05LdzZVY0NwVzVhVjhsZjBjRlF4YjhDWThScEdKK2lpNXZK?=
 =?utf-8?B?N0ZZZVZLSTV0am1WRU5zVkNaNDMzOE5YdUFxMjJlVWh5ZC8xY1hQLytFRHpu?=
 =?utf-8?B?dVNobWJCSkJKbDJqdi9YWHNGb2YrMkRKQWNPNjNYS2ZwS0VHSHppbTJsVk12?=
 =?utf-8?B?NHF2cm15SEp5clpJUkhDTysyd05sdFB1c1Z6ZmpIWktzWENhY0Z4RnNyczJH?=
 =?utf-8?B?MW5TS3RwcFZpWHFTd3FBZjRQYWNWejZTdll5VTRnMWxzbzdrMExJbUFkUWRL?=
 =?utf-8?B?Q2thUmhjMm1IV0kvUHZ3UVdqV2piSGVzTkk2VDAvT2ZJcjFzQkJBQk1Qd09s?=
 =?utf-8?B?QTJlSGY2dmpoajVRS2pUcnMvaGU3bmZNSSttdGNjeWlnU1lnYjlwNndFTUFQ?=
 =?utf-8?B?U3NMSW1neTdBQXN3bnpkc3ZSTlFDZm9kMFF4TmZFKzJHSjVWUFNGWVdOS3or?=
 =?utf-8?B?KzlCeXVDb2FNMHU4Q09NZ0xvVGRYeG5pZDE1NU4rek8yc1FrY1AweWVId25h?=
 =?utf-8?B?aCt0UWlMSE9mUzV3WDZPbWQzd0RMaDg5ZGJkU3RQNDZZM3VySnhaeWZYVHFL?=
 =?utf-8?B?RkhqMmNpY25lb21nMXF2NTVvRTVCRVhTNFBkR214dGY0eGpWSjNQenZMUERU?=
 =?utf-8?B?aHQwQ2pJZnV3eWVqYnRLNmRTdE1lNDUyZ0lneUNQWHdwVFUvdVhucEZHWEhD?=
 =?utf-8?B?THZjVUZ5SXlqRnkwNHdwMzhiaExpbG4yRVdadzFlNmdhQnJiaFZyL0JtTTdz?=
 =?utf-8?B?UjkxVGRrZktVWExsZmxqOEx1ZlNSamFLQkFWelV0Vk13eXpyV0h6N3k2cnZM?=
 =?utf-8?B?R2dtYmU0VGMrdGNrNlFaTE91bmtJR1VtTDI1WHhOOVpkc0RRdGVoZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a28ed3-829a-438b-568e-08de8a7effb4
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:58:39.5644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8q3wji2hdxGdFcDvo21gZnk2bCum+XScQBXw1z9Hq5zpJxsOziilaOVpBCsflj3y+5lXjZDDT39fbVMdMGcMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB8032
X-purgate-ID: tlsNG-42698a/1774450724-A1003112-0154B624/0/0
X-purgate-type: clean
X-purgate-size: 2062
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0C909327517
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Read the existing PCI command register and only add the required bits to
it, as to avoid clearing bits that might be possibly set by the firmware
already.

This fixes serial output when booting with `com1=device=amt` on a system
using an "Alder Lake AMT SOL Redirection" PCI device (Vendor ID 0x8086 and
Device ID 0x51e3).  That device has both IO and memory decoding enabled by
the firmware, and disabling memory decoding causes the serial to stop
working (even when the serial register BAR is in the IO space).

Fixes: f2ff5d6628b3 ("ns16550: enable PCI serial card usage")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/char/ns16550.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index df7fff7f81df..41d6380367ca 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -283,11 +283,17 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
 static void pci_serial_early_init(struct ns16550 *uart)
 {
 #ifdef NS16550_PCI
+    uint16_t cmd = 0;
+
+    if ( uart->ps_bdf_enable )
+        cmd = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
+                                       uart->ps_bdf[2]), PCI_COMMAND);
+
     if ( uart->bar && uart->io_base >= 0x10000 )
     {
         pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
                                   uart->ps_bdf[2]),
-                         PCI_COMMAND, PCI_COMMAND_MEMORY);
+                         PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
         return;
     }
 
@@ -307,7 +313,7 @@ static void pci_serial_early_init(struct ns16550 *uart)
                      uart->io_base | PCI_BASE_ADDRESS_SPACE_IO);
     pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
                               uart->ps_bdf[2]),
-                     PCI_COMMAND, PCI_COMMAND_IO);
+                     PCI_COMMAND, cmd | PCI_COMMAND_IO);
 #endif
 }
 
-- 
2.51.0


