Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TIbbFOoONWr6mQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:42:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973F26A5042
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:42:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=p8HPmEEp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341988.1602281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVjI-0000Mi-BQ; Fri, 19 Jun 2026 09:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341988.1602281; Fri, 19 Jun 2026 09:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVjI-0000Jw-8T; Fri, 19 Jun 2026 09:41:40 +0000
Received: by outflank-mailman (input) for mailman id 1341988;
 Fri, 19 Jun 2026 09:41:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waVjH-0000Jq-0t
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:41:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waVjF-00EO56-Sy
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 11:41:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a350ec4-bab6-0a2a0a5309dd-0a2a4501b898-18
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:41:37 +0200
Received: from [52.101.53.32]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a350ed0-e031-0a2a45010019-346535208bef-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:41:37 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5575.namprd03.prod.outlook.com (2603:10b6:5:2cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Fri, 19 Jun
 2026 09:41:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 09:41:35 +0000
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
 b=oWICE4/WqUTHMGbaFp1qP3svtxo2uXhtXnd/xDM/YSLhoKY0YIoatYolW/E0/8oLKl6x4/lDwoPHgTLg/T08KybG71LubI60DP+gfZDxrAEzl0tc6tbd1yn9At5E3uzpWC11HSD7AY+j+FfABaOJNJnnzD6D2DtS5I8oyWSWKKAd+tyVq6euKev3ZBYmHoGgS5f6t2NA//uxVkMXGDupmhUCxnKKIBxKt6uNuZr7zrvWc7nmSstxRrJvW2CIPps4T0q8QYZOI93jTKibbIsNCVFs4kPGOpybLN08c/IveWdjiKAy9nMbYOdB2qnJzl+M+BbPGCFdH/LWT4TBbVOdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qU2N4nXPr+o6FAuoPmvtgvL3wNMFOtuZpquTWpf6BuA=;
 b=uCPo3ks8Xl1CzJjWxhnHC/Y0cg3P0VZip+YpvNjNYVZlpe7twhpA5xeOHRbteskWs20TA5JI0JB2RvTnfmUcHy0nywr+XUUGrVHAh1jx5SdAtdWMcg9QFtrayK/Yh4/0AmGQz3QicjoJndHYafX2Zmw6vHMtaEIeJcyjyrydFxDYpVETT8HVPvehsVUtsr62ct8ZP6DxpZhQesIJaxPzskpj+YEfMJYsaU4adlBtVsWF1TRxd2tNbYDSMdToM2ligT8+6+5ZIH9woYlp2y4rS3Vc4D0k/3doQt5RK8skKlST9fXLB9j8zPp+EraB8ac0j4m/TOFMNWW+jbq+/NHaxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qU2N4nXPr+o6FAuoPmvtgvL3wNMFOtuZpquTWpf6BuA=;
 b=p8HPmEEp9JaEx4uDL3ASVpvCoHbRK+/DT1gKTWfOvo58UW4bJ8/fMhroyQMNozs//uaz1VNLkZSKvq48RRfxKTosnSuKc4riW03of6u6UYmIxvb/kLqRjEnpQ1BvT8zatA5V+IVvvcUicP7P4OeUr8ZgxqzzpL7lz9rNA4MUrWE=
Message-ID: <8821a8ec-be7c-44b7-8217-5687cda09dcf@citrix.com>
Date: Fri, 19 Jun 2026 10:41:30 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 07/15] pci: Use pci_sbdf_t in pci_ro_device()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794555.8631fc262581453bbf619ec5b2062170.19edb3b4612000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781794555.8631fc262581453bbf619ec5b2062170.19edb3b4612000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0085.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5575:EE_
X-MS-Office365-Filtering-Correlation-Id: d968a765-77ef-4f4b-8895-08decde6f3c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|6133799003|11063799006|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	hITtv3YqTapno005Tl7xp45KCw2PRShcutXtzffwyxOHSneo3jPwiseWu/7wmiFIkKGC3upiUX0rR//Rd3cG0If/CONS0ESbwEkiaOVJUWW5mu60otMzLD4qgNxl3jecr7C80IhAkComnkOwDx9xdotq/u81N0u9kcq7MlEHHk/b/KufG+2HMW+EfgKVXIfvf24ptw1bb03QNNSJiaXscUVzFguspeuNAySTYFmFsCPUkAKs/YIDa3r/UKQB70Btu5RDeLzgACFlbopTEf7AriGolINFEsETEQBxia6E5ppipNgS75Lt/uHxrvpVq76kLcFyL2HhsgrtmYN+aYTXDXdXu7cblFKxC3X6TNiCK/ef2Hkt503p9P0TCQUiHuosMcVGjwMJZhhLk6BSTSATpMcer4sEh0vpWy8uy+dl5diN/X4vohKheK7szUHjo303lcgqFjt0YXvvM1GEMipPTqdI/+k1QnZot04p/hQR1E6uO3EYrXT9Hfz6vYdmCjARF8yMswjksu2nEcx6ai4cjELzSYDSQhmp3kaz6CbJnPXIKz2ytKS6XQ9Y3HPcDYA1Av3Tur+X3LZS+upu1yM93e7460GfxK4QbqmnBIacZQtwInBoqURS1JS8lpeIDZAVAuAkykRHwbk2htw1rFPTXld/GzOd0H6NufPb2RKwks8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(6133799003)(11063799006)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b05taEFoQVBqaktZL3lwakIvcVIxb0pNcEdNa0YwUVlUdEZxTkxMNWFYTzlo?=
 =?utf-8?B?MndaMnBJbHZYOE9KWEFlRkVqUlRFdk01LzgyWmVIK21GYThYbWlwSEpQbEln?=
 =?utf-8?B?M0YxZEUzOU9NR0NMWTNZTGpBQ0o0UzFucnQxdHZYMWllOFlxeVdnSGFDMmFH?=
 =?utf-8?B?cHFyS3lJK0pIeVBndlQySUIzazZIMlhydjA0K1Q3NnBRVDZEWG5sVU4yZjN0?=
 =?utf-8?B?Rkg5a1d0OFBhMWQwOWxLTVRtbnhHNktGUm9zazl5YlU4S1dsRkpseDdIWEVO?=
 =?utf-8?B?RVJLQkx2Z0xVSk1PNDZqT2kwZW9ZUEl2ZFFNVU5CTXVrTXRYUEpsd2RnU0ZN?=
 =?utf-8?B?a1VGb0dHWk81ZVhZVVMxTzhTUTZnRjJqU2xxZkdGWHhBc1pBd1hQaWNjMjFS?=
 =?utf-8?B?R0RsNU1XKzdvZm9UOVcrTXo5aVV6REZYV1VXTWVtLzJjY3pJUjlsTU9Ib2Nw?=
 =?utf-8?B?eUZGNENaVnhMOG1QVis2MnhDaGU5cXNZTDVjTm9SWHg2dUZURDEweEcrUXRi?=
 =?utf-8?B?S2piS2hIQXFLY3FXY1RZcHh0Z1FWOUdodTF4UU04MzY5REhCc3RyQkRDNzZI?=
 =?utf-8?B?UG5QLys0djJ5SU5kL1pCam1pN0hZOUNxWllhaTJlZytPSXNBaG9NRS9zZEFR?=
 =?utf-8?B?L3N0b2kzSlB5YTNCNFp0b0FNWTdNZGtGWk5WTzZYcTVhcXY0VzBsVk1HbFdO?=
 =?utf-8?B?aHFJOGgreERxUnNmRWticlZvcFZXNlRHNDZnTjJkYWNDalVtUndUSWRYNVZN?=
 =?utf-8?B?RFNaQjBOUXhaNzYzQnhBZlVUNTI0cDdUVUxNZHFYdzJRdUJQMERSVFhXZEpR?=
 =?utf-8?B?WUR0TFM5dzBTTDZXdk9jUDVyQ1J1SU1IRlh0RXFDUEJ0QlB1Qzd6RDF5NlNz?=
 =?utf-8?B?NytBWlMwTE9ub041ZDBXZnd3NXpqSGtQS1E3R1JGRUlmd1ZZbnNuSy96eWw0?=
 =?utf-8?B?R3A3QmlmSzFtcW5tK0JySmlDSytETEpoZUJSaCtxMDJSMnd6eFFSTytLZ2Vn?=
 =?utf-8?B?SFZOWGVHN0hjM3lWRjFXZWsvTk1ucjM0YUlGeVBWY0s5NUFVSWsrTEl1d0lB?=
 =?utf-8?B?VisrWHpKL0NmdVMrRGdKOU8yUFNhL24zdzhFd3ZBRWdKVHFpcG01QVV5U2Fi?=
 =?utf-8?B?bDRwM2pBcjdzUDBPdHFiSElYeGsrSkJCZWhnRW9oMGRHTU9mODJwdldiNWkz?=
 =?utf-8?B?d2x6OHVleXFPU3d3VUp6SnJ0WTN1dUNPRU5IVW1iU005QUZmWHRzT0lEeWtw?=
 =?utf-8?B?UDVBaFdIMlFJY2FTQ09vN0pmdEtSYXAvd05qTzI1WDBrbG1IQnV5MWR4Smtl?=
 =?utf-8?B?cW1ZYWcySnc0ZHpQSDA5SUU1d3BrZ2hxQVlJVTFySWd4L3J4bURFWkxrYkRX?=
 =?utf-8?B?bjJOZS8rRWtOSXpyVE4yTnltbno1cVJyZjU4WUF0R3FKa3VGZWttYVdjVzlQ?=
 =?utf-8?B?MVo5cFpsME5ValZIeUpwRks5eFlrTkNuNytudDgyNVgvR3lUMDNsem1CRTBl?=
 =?utf-8?B?dzNGd01KMmduRjB1RUtuWkl6N0RsVGFROFBTQXhCWG93SUVlT3pjdUtuaFZs?=
 =?utf-8?B?Z3JFNjNwZnY2QVFlUTArQmpuelhLU0VQc0FTYlJjUjAxZmN3a1dzSU1WWnJF?=
 =?utf-8?B?czZCSXB2MEIyLzc5QjlUNExSWWtMSEJHWGhIemhORHVmeW9EVEFRQjdveEEw?=
 =?utf-8?B?d1ZFaHJzQkdOdkhOVkgwd1pWU0NMYnVhTFhGWDZ2cUlPazYvcnNRYzFINmdK?=
 =?utf-8?B?VnJqWVV1cGpkUjZrUHdxSWpnVGgwZDYxNG9DZHV2RTdIZ1hUY0EyN01rOWxp?=
 =?utf-8?B?RTVKVGJuWmk4ZzY2M2p1NVNhN2k0SEtBM1B5YW91emEyL0RqSHJuc1BORzgx?=
 =?utf-8?B?cXAyTnpzaEpxU3BTdUtkTFNQOHh5bTBwTGdKSTlQRVNVMThOQmVtdGZaUGk0?=
 =?utf-8?B?M1h2MGxuc1k1a0J1WGNLRUlsRXFZbXJwclA4TTZZakNTRHE3S2paQWlxN2JK?=
 =?utf-8?B?R21KQndoQXBFNWRGdktpZ2NoRDc4bXc1em9OakNPRUJ0RUV3NmpIK3pHREVD?=
 =?utf-8?B?eDNmVXVFSWFtbXBiNWZhaWpBWkRzVWt4MFVBRTJoamFWN3N0dW9iTEhvQ3Ny?=
 =?utf-8?B?VkRQUlVKejJjS1JXS0ZhN2VjM1NmelVSampUcjQ0cUhyQ25vZ1l4ZWhoUHJK?=
 =?utf-8?B?TlpnWUVHVUloU0p2MUhHQlA0d1VBYlFLaExUNUNVcmpwUjcxY0dkZTVkenZX?=
 =?utf-8?B?eEpBbEJGT2JSdE13R05hRDB2QVFvT1M4RDl5K0ZBSmx0dTNzMVBoajd0UjFO?=
 =?utf-8?B?MnpDYUlEcjA2dEJJQ3ZaUmhyVXdGVGlIRmVaNERISjZ5MXF5SENGVS9PVEdT?=
 =?utf-8?Q?Di7QHk6sp0B4hxZE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d968a765-77ef-4f4b-8895-08decde6f3c6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:41:34.9885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wN96F9TRjM/NP8ZiZYB5SCllNzJWC6RZpt8STv0T8m9uhdiaB/sHiESDA2VMcbInRf6cUSE96StT1nhE4C9yexNMRPQd4hYBT0e8tJy5kvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5575
X-purgate-ID: tlsNG-d62444/1781862097-CFFA2E30-EAFC9FAC/0/0
X-purgate-type: clean
X-purgate-size: 568
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 973F26A5042

On 18/06/2026 3:50 pm, Teddy Astie wrote:
> That has the indirect effect of properly considering segments
> other than 0 in xhci-dbc.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Considering non-zero segments is fine, but I highly doubt DBC will ever
be on a non-zero segment.  Amongst other things, it's now the hardware
debuggers attach, and have to work prior to the CPU executing
instructions.  i.e. it has to work (route correctly) from the reset
configuration of the fabric/etc.

