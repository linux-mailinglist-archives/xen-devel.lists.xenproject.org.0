Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OtIwIZ4MNWqbmQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:32:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2E16A4F74
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:32:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=bJ4ZSVu9;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341977.1602272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVZy-0006m3-Ch; Fri, 19 Jun 2026 09:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341977.1602272; Fri, 19 Jun 2026 09:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVZy-0006jW-9Y; Fri, 19 Jun 2026 09:32:02 +0000
Received: by outflank-mailman (input) for mailman id 1341977;
 Fri, 19 Jun 2026 09:32:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waVZx-0006jQ-Cq
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:32:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waVZw-002Alx-Pk
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 11:32:00 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a350c8f-bab6-0a2a0a5309dd-0a2a4509828a-8
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:32:00 +0200
Received: from [40.93.194.71]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a350c8f-4999-0a2a45090019-285dc2474df6-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:32:00 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5351.namprd03.prod.outlook.com (2603:10b6:610:a3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 09:31:56 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 09:31:56 +0000
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
 b=JIssAVgJOynGwhcoSwW0CNtDh6v8nd8vVB55oxwddpMNRb+kjWxuxcsp2WzCed1XzcCo/3kWj4NkvdvIMhKalQaP9/AVwJ5aKyMGZw4YHI6xZ5vSSNcTvjzrzVkIOeRDLiQqgSA2uAUs2ptNk/28S/KyGapWaeo9J98YjPVmaIy7GKkXkdQMfKMmF/dprCORAYmx3Hzm5xNYHh2oHAU4tZCOkpkMuKFAGhHh4fSfqW4IKrk42tKjFfXOb/Nfk2Kj/0hx4pmOZ3crrL7ma08ZABOnU6pu9eRAQEsJpbeK2zrgEqoVlWUtPQrkwb2FG8xbp5UJ8imr6tZI+qeG9adgig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RavRK7j7LBPiTLkeojggdqzK3Iw0Y/RuwQlpGQ7EiTs=;
 b=ToubHoRAU9rAJ0ertGKhOyce5VrcGtXbapWbbLFQiDcZNdbAHvAUmjEwaC9jCzHC/eC19ex0M61TMBHXvJqsekc3AZDM8+XPIEXvTzo/cDgXy3ROwhrqzxL1kV4qrmpxw0itZzOErgz6E+2hWmmzp5dGUxZRaprzuV6jhuWKkFRQt7ieF7FIso9r36UVabzZBSA9L4SgBvi6BgInVDJXCy7Qy/fDpjeLjPp+6Gt2IIGwAvOeORnt4tfl0wn5Oy717tYt1YBaZPQ2h2+G3FAu9TunQ+2kRYDaS13vT8xvrE8PzBecC6TE9DiH6YyEjh5gDgWDXlq9WIQ6MHTQV5aNDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RavRK7j7LBPiTLkeojggdqzK3Iw0Y/RuwQlpGQ7EiTs=;
 b=bJ4ZSVu9nX1gL3xZT8I19Brnn1ITt8jtwg8Zf/xPeKuRUBcQJ8LlCY9j/AQSiWuUXLcswA44/NThun1x2VKCqoYieQVn5aCEJFE6BRgfgScU6LZgrePT0pSQHGNFn8Rt1YK36wYHPdMkO6I9qCT758Y30fxTDaKuUJHK+TYKHXU=
Message-ID: <f3d0016b-782d-4085-8f97-cddba10231af@citrix.com>
Date: Fri, 19 Jun 2026 10:31:52 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 06/15] pci: Use pci_sbdf_t in pci_prepare_msix()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794554.8631fc262581453bbf619ec5b2062170.19edb3b42ec000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781794554.8631fc262581453bbf619ec5b2062170.19edb3b42ec000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0413.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5351:EE_
X-MS-Office365-Filtering-Correlation-Id: 83948558-63f6-4e42-4fe2-08decde59ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	9CJx0R2MH3Xk8cg4RF5BMeYGZdfuZ+sfqbe/QZH72v6SfbSXnwhiUGU9CJrlebW0wPhEzR2WtvDLdZ3rwlKNUYlP5wOhzHSI2MfJckAw+9HeCjHRsKyFhZMKgZzuJzCeiiJrUNUE5Q0H6MOkY8T7bRH5cRM4m1jFiCXM4Js7Q+HJQ2n/8SZItKNvUbVHkOzWZnLS9AYyOWOFIMFhvWjWxm7plZlW6x9gxs9RXUKky1F6StvL9eYXb5bR169Clbl2OT6lHWzw0s/O+9Gal/ASO3m4LuzGIrjkJ1CLfhrzUWS/BtiZKcXRmJ3+Q+hrGDoA8YcPYu2vwS+kQdCU9qXd+mdOH6fv6chVvCBmVnZ0sYia0vafQrmB7bUpi33YSzm78WgHhbKPg4FJyIMr1zKX15duewSJZcA7669JqoAKdcFy7TK8di6haaZiEaoZgIjkqRRuYP4W9OMNavAeg1V/ivFNOLGeVt93vjFSqesEGVre/SZyDsAzpLUDXRJGM3JvH25AgrYTHACf/2auNhvd/mEKSd7VjM1FGz0TFL7ETVNvp7GoUZwzZfNL/JvjlCOIZQzkTeCX2/Yn5uYNqO0+PqAKHzHOMpIq0dWyFPjSrLfTVamvwCVm8DHD2k5kZ5eT5L/Zb22+oSHLnmHODaZM1lGdBRZhrZtKpc1u83cGw78=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vy9SN3JLM3NWbDZORDQ0YlpNNks1ci9UYWhoVjIrUVRmN01WLzh0eEoxcVBl?=
 =?utf-8?B?dFk2WE0yeTdJd1hTV2ErTldjTEpNdXpSUldaRldmMVdneit5SUNzd2JTT09I?=
 =?utf-8?B?aDh4bFdKcmFDNEt2ank0M3UydkJpQjAzclNOTVhuNDlhTzlvZVhla09tNGFp?=
 =?utf-8?B?ZFhBOVpiMVlGZndnS3MvV3JsLzU0TkVOOEFwajBxWWZYMUtMdzh6SzBOU3ha?=
 =?utf-8?B?T1htYkVZWmVvdVZpRjI3S01reG1xK09pb2dDQkNSU0dVYnd2WUt4ZEVldWZl?=
 =?utf-8?B?MnBYOVA5RFppTThhaUFzOXVGQkdqVUZQaGkwYjVLdFFOU3VDVjcxdTZ6d1lQ?=
 =?utf-8?B?cXpIVEdBczFXZE1hSUtHQ2VBUnpCNmRxK3J1L3dra3ZEcFNWYXVxUDd2MmVi?=
 =?utf-8?B?SmduREFmdzdUcVQwMHdxaEJYalo0MXBBaWJHRkRDbFhXZDBqeVdvam9ldVls?=
 =?utf-8?B?ZXhuMlhEMkwra0pVQk9LTVBiQnF4Ymo4VEg4ekdmQ05KM3hkMUNzNW1GT25U?=
 =?utf-8?B?dlJhZ2ROOFIrd3pPR1JsSENpZ3k0ZklPZm84eElpd3NUWHpSVnlwbE1qcGNX?=
 =?utf-8?B?QmZmOFJIWkZxN2hEQmhRZmVyQmdMUVFTMXdEUGZwaTlXcmxCc0haMlJCeVpK?=
 =?utf-8?B?Mmw0UFNPeVQrSlcyMmFaSmZpeHVNMjVSZVFhVkxrazZHK2FCTnNBamQzOS9y?=
 =?utf-8?B?T0EzTFJDTGRyK254VmsxSzV6ZGhQVGtXRldFWUZwTndBWEFiVVlBeFJvQ2t3?=
 =?utf-8?B?aENSUHRVUndER2dSc0FhL3BDTk9Ba1M4UWJwdDFoMGxzTW9Cd0Fad1pLNXZy?=
 =?utf-8?B?WjJSWXFmZktqOVFVN0JhcDB5REhpM2ZuYTQ0bXlLRkdsRGNVc3VsR0pvOU5O?=
 =?utf-8?B?WDk0QVF0bEVjSThmT0JUYWtkTjBWQ0dFOVVISVhBb1EwOUtHOUdQL2FZRUU2?=
 =?utf-8?B?dmxGODVDYUlUOHE1VlVxQ0FpZVE3QjhJNHY1eWluZE9YTjByYmhGMnBmZ29O?=
 =?utf-8?B?cE5PVVFvMlF6Wk1YUFd5SlNVT0tKQTRrelh4MlVCRUhRd0VjMXRFRjRDazJF?=
 =?utf-8?B?d0JMWjc2T2JWajl0ejBOQWloMXRjcDhYY3JTUWd4TmxTbEJiTTRDZ2doRjJS?=
 =?utf-8?B?b1IzVEFuUVdiMjIrYXZNTFVxMDMvK1F3ZGh1M0dOMStscTN2bGsrSHNXRGU2?=
 =?utf-8?B?MlBLTjYrenR6Yi9aMGl3cDkxWWUvS3ZCK1VybEcxYmFxckNodVNLVkJ6NTVv?=
 =?utf-8?B?TjRjeG1nWm5wSzhwaFJ1MkJha2h6d01Va3RyOFMvcnZQRmtUVm1icmdQOTZR?=
 =?utf-8?B?eVFPT1pScllLV3lDSXRnaEhkN25haHFxS1NyVlNEWlIrenJvMGUxV0MzTjU2?=
 =?utf-8?B?V0RrQ2JFWW45cERjamZYKzRxNjlnc2pTY0o4cHAyQTU3NmVZSTZmdWRPb3VF?=
 =?utf-8?B?SzJjQ0lSVkVnTnU5ck1XTVFyb2djOWovU2NucS80WWZYdmpkS1JCdjU5TmJq?=
 =?utf-8?B?ZzU0eUYvaVNYUWJlaU0vRU1Qc0NwaG9qdzk0ZDF1Y2dKZmZZZExaRkVVTlo0?=
 =?utf-8?B?Z3NjdnFEN2JMM0MzcDhyM1NQeUt3NnhCczMrNDF5bDdQVDh5cDdlMDFGanhk?=
 =?utf-8?B?Y2RHRFg5aDZXS1hFcmNpSmk3ZWZkSkNicWFCelpyVFFVMVF4TkFObmZNdWl0?=
 =?utf-8?B?MVlwVWY3Y2pqVXRvMnVISGJuVHZxOVNYbmRtMFo1Yk1ZQ3hsbEx6bUN5bER4?=
 =?utf-8?B?ajUwc0grT0Rsd0ppU2xJQ3BVU1Q4bGxhQjNoTEtDcGRUeVY2UE5qNTYrVy9p?=
 =?utf-8?B?bEdHYlozTkNncHJ5WXFMQlZkRW1naHVTa3RYemhYR1N3bXpYUVgxclVBWFk4?=
 =?utf-8?B?VHo2Ny9udjdtRFhFOHlveWZWZGdtYVdFd285cmtNWGUxUTdmamxhVnZFcGZm?=
 =?utf-8?B?Rmp5REFlU0d3d21TbktUNWVFSXFnbWFVUlh1UHJGeXJhMW55UlRuSjE4V1RK?=
 =?utf-8?B?bEROVUNaL251cC9ucXVwbGVtOFdtTUlmRlNaVmhFem9HeFRXSk1RSCtsV3FV?=
 =?utf-8?B?R0V0V3BGVllvbStnbG1mc3JOU21kQmJXVzhhc0VhQ3JWdzRSa3ZFOTRwNTRJ?=
 =?utf-8?B?bmdOQkZRdW5MbnVsVjFJa1lnQXhCOC9ObjNNUGtSeFozU2t3QUxVQmQrbno0?=
 =?utf-8?B?NnpCSStYaXVHQjgweXdWL2t1OXNCV2tjKzJKR2ZHNmZMYkF3UUt6SSsyMko0?=
 =?utf-8?B?blRhNHZYYWhWOUcxUExMSzY1bnBIcllCK1Vuc0g5ck5HWElZaFVscWJvMG9Q?=
 =?utf-8?B?QTlOZmMwMU5XNmdlU2h6WDdneDVDMXBzM2lVVVVWaTN5cTd6aHFJMks3dEdL?=
 =?utf-8?Q?x4rSFdMF1KbE2VOg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83948558-63f6-4e42-4fe2-08decde59ae3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:31:56.3618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAtGJB52k6zeQ1RFJ85BADjGNmJnhcnsm/jqetji9/fMVuzydiRCpHIKoccES5e/xNQ4Zvir6/n8602IjBBpSQ8h2xsDvKs2tZReUO8PIBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5351
X-purgate-ID: tlsNG-bad1c0/1781861520-737EC744-A80DC6AF/0/0
X-purgate-type: clean
X-purgate-size: 1838
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF2E16A4F74

On 18/06/2026 3:50 pm, Teddy Astie wrote:
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index 5bbcf3b530..984fb99aa8 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -512,15 +512,16 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_prepare_msix:
>      case PHYSDEVOP_release_msix: {
>          struct physdev_pci_device dev;
> +        pci_sbdf_t sbdf;
>  
>          if ( copy_from_guest(&dev, arg, 1) )
>              ret = -EFAULT;
>          else
> -            ret = xsm_resource_setup_pci(XSM_PRIV,
> -                                         (dev.seg << 16) | (dev.bus << 8) |
> -                                         dev.devfn) ?:
> -                  pci_prepare_msix(dev.seg, dev.bus, dev.devfn,
> -                                   cmd != PHYSDEVOP_prepare_msix);
> +        {
> +            sbdf = PCI_SBDF(dev.seg, dev.bus, dev.devfn);
> +            ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf) ?:
> +                  pci_prepare_msix(sbdf, cmd != PHYSDEVOP_prepare_msix);
> +        }
>          break;
>      }
>  

You say "clean up", but IMO this is not much better.  I would much
prefer if it turned into this:

    case PHYSDEVOP_release_msix: {
        struct physdev_pci_device dev;
        pci_sbdf_t sbdf;

        ret = -EFAULT;
        if ( copy_from_guest(&dev, arg, 1) )
            break;

        sbdf = PCI_SBDF(dev.seg, dev.bus, dev.devfn);

        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
        if ( ret )
            break;

        ret = pci_prepare_msix(sbdf, cmd != PHYSDEVOP_prepare_msix);
        break;
    }


It is slightly longer, but the cognitive complexity is far lower.

~Andrew

