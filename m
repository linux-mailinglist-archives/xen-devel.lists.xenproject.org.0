Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKWNE+jm/WkPkgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 15:36:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39BB4F7258
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 15:36:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303649.1576924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLLNT-00009d-Nn; Fri, 08 May 2026 13:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303649.1576924; Fri, 08 May 2026 13:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLLNT-00006x-KT; Fri, 08 May 2026 13:36:27 +0000
Received: by outflank-mailman (input) for mailman id 1303649;
 Fri, 08 May 2026 13:36:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wLLNS-00006r-4C
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 13:36:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLLNR-00D1O0-HJ
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 15:36:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fde6c7-5cb7-0a2a0a5109dd-0a2a450281c0-44
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 15:36:25 +0200
Received: from [40.93.198.32]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fde6d7-af86-0a2a45020019-285dc620182a-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 15:36:24 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6873.namprd03.prod.outlook.com (2603:10b6:a03:438::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Fri, 8 May
 2026 13:36:22 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 13:36:21 +0000
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
 b=fKdX9zxrZgIumBt7gX+rpySCTettXQEHKLE3Dj6lH8G14Ka6MqE+y2JINQQw0LGoVRlSA6Tne6E96JNfLHmCyTDu6JIs3Kuv6H6qFhW7wzkPwr2i8Q63T3lrlKr1vJuJ3lLt+zEToeq0y8L1ODWJ3snIqrSwBZuXn22B9NIJH3HW4XtQx7Dspa4oaaGs3lojwJZnk1pANJzN+2ffReyyBqK8yHemBOlTuPOGUvIZO1QtReybhT2k4Ky4C12h2uzP5FU6zfm4nOBXZBmCf3/DLk02FKevEvAuIVl0BI5Si4ijQHSu4F3P/M4mjgiCUW9uB6VzT2/FUosMV4sf+BRDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVpt2lLnQmDamz+KKva/ac7/qHAvy+vb8mgjPtjbF/o=;
 b=m/FHWrRl8HZ8C1qnYnoObbgxUR8WmigDK8r3QGpSOF+kvau2mRcTa29oePy7LlhhciZHiqhrRmM+SvfT3hW/pGRaRF+sAaG6brkmrOW+LRl97skA7V4J2OCXuX8DPhWYDOwnZAgg1gIGnOsea38mqn7gguYih3eo51jE7qDk6+lIvDhPe84WG5e7/B9R4HG8QTWTXjxDvyDNRdQks+Irdz2SKKnIt3q2lou8eLA0GPLFpjUwqwQRSVXe5Pj6NnEjIAA8pgzs7XTaP0ngMS4hh4yKMmmE8I1QcIYw6cEL6ruSCW/MTaFber+LvEkrQzs/aJgeTj7pSoDrPtryXrihUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVpt2lLnQmDamz+KKva/ac7/qHAvy+vb8mgjPtjbF/o=;
 b=k7ljcm0jaKkfuvZjAXkUV2uA/LM3n7Zg+YoEOUg9Vr/salbzqwP1syVv+CKO9l00X+/YOuGRIjCQyJqA1DmSOSRHIKR9vgHCQHClNH151eumnKiPIJRTXjg4k4f4BUg8FBubrT1x37/ErXeT+mfTI1rYOQ+UvBgLPoSzqTqGT6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d23e8f73-2963-473e-bd38-64b35cf02031@citrix.com>
Date: Fri, 8 May 2026 14:36:18 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] time: drop dead code from gmtime()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20642e09-5dce-4979-b126-b24a78db698e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20642e09-5dce-4979-b126-b24a78db698e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0497.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: 981d34ee-21f6-4ca8-5672-08dead06cab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	em2DsIM+fMG/1BXGyIUblZdgXVe/JHBAL2LdLUTog1uOFxM6Vgy6En+L/HXgL0OsgvWJGa5tesSxenKOJXvEL7USafawdeqaBFXsJyKy74mHl1Q8Gad8ASm8gnF2zVPTZV5FuIA6JGeFOvViXexTQwtJBozC8Ln66FbRS7fkTGuA75rtJuPuPKtJm00cjXkH35dCtQKrXceHAyPx0oqtH/zoLLfYeGDkMjZDWc5uzOKLZHbCegdG5dljoUQM1Oix01iJ9lTggZgXfcgXESr5ewPap0xmsmpYCnBa7udiCWgqqT2Yzmd0qbp1WdkOm+nY1KGWrPvw+DG3lmgOpXrFHNpsJ58aj3ZGDt7G2BwgKEDo0lpKfUqTrq3ppK8Bt/etkJFnBMrN0PZtFlpqdpzQVbLbmwd9fACWQGtk7F91AV3CjbJBXVBJfDUhwzJQ0mk8UjLq9WIo6lskodKNd/dRiRImS711Zff8UhcmUrDJgXO/H0QUNDgHNXaIX2JNRCmFcjm/tXD4kZj+vh6haHNIQDVEfgw7uazJbDrSNysW0Hu0h2pi72ZDfV5O6tuPaPXmvNDqR0HI5XFtfJzH9WOdgJcgIPYwIEXTpNCps7dXrbTczKnlWW9omWJShR5PRZVlFsyy+3eZaFQNt4ME/lrpFZ/WRDorRRFcxUMCDQd9IcNByjRBx/qPOmiO4nBamfll
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzZvVC9JLzhYczZxeTlkeWVmVmZMVkhNcTVQTEI1ZEQ0bHBGQWNtTVZFWEE4?=
 =?utf-8?B?NFU3NWs3OFdIdzFsR0txdzVWOEJCV0h4VkxhaE12a2ZwUDkyd2MyNDNZZHBT?=
 =?utf-8?B?R01vVlFuT04yUW51bXA4MGxtY1duN3F2N0ZEUitTZjhya1B5S3ZsNW9rRERa?=
 =?utf-8?B?QnJUNVhNNlhQcHdIWmhvYnJRTE9JQVZUZldhemF6UVhDN3N3aGlnRVEwRlRy?=
 =?utf-8?B?UTVlSTFaZXZ4d2hNLytGN2h3Z2wxSElaUnVyV2k3OE5ZUmVVL0pxcGVRUExI?=
 =?utf-8?B?MkJCUjJHOU1STXU1YS9QRzVBeUVjNWtoSU1SOWV2WU5LRE5PRW15RU9GOHk0?=
 =?utf-8?B?Y0gvNnhwTHcrOUZJamxETGpwaEVINWdCeDRXMUVhR3J2QStPdnFnSll2NHBn?=
 =?utf-8?B?RTdXdXJhRmF5Qks5UG5KaklIekdpSU5OaXJCTDVnckwvdWlEcHpCNVdacmNy?=
 =?utf-8?B?cVdHdjM4RmlZQjFTTFZ1alVyT0ZnQXd6SFlHcytOaGhNL1llOWFtdWJrK2xY?=
 =?utf-8?B?M0d0bkQxNFJIWUh5RVFNRUd4UlZaOVRiREdLNmVlTzNMYzRGU1VwYktoOVRz?=
 =?utf-8?B?ZTExM1pqM0VIaDN3YnYyd3JjN0tMaEdhemUvVm1GMkhBbXZmazk2VkRmc1Bi?=
 =?utf-8?B?d1dQd0c4TVRBKzI0WmRjZVB1QW9QNlZoa1JCZWQ4RUl4eHpYYmNYTU5VeU44?=
 =?utf-8?B?RXk1b3hWZXdUQlBTTmkvWVhnYkFRenpha0ZzU2hpUGlZQ3hnc29lS0R0bTdS?=
 =?utf-8?B?QWlxbC93Umh3N2RVRDNQTmF2elRCV2tOQ09SWW1ianozRi9pNnRhaHZaaWli?=
 =?utf-8?B?VWJRYVdJT250WGhwV2xxdHNDemhHeEdIUThlL1RhenhWRG5wQXFpcjZvcFg4?=
 =?utf-8?B?eUFmSXI0VDh0K0w2QjhOcGc2WlJ4UDhLZWJtSFJRZnhENHdDZTRBbVVrV1g0?=
 =?utf-8?B?VkFmV0ZrMExvdmlvMXZaRVFRcGg4dW9qaG9nZ2l0SStjVG52aitYdlI2VGRV?=
 =?utf-8?B?K3FaZVFyL3d2ekJZMG5IRi9aU0lnaEN3YzFLSjhiMWFORW04Q1JEYmdCcTEr?=
 =?utf-8?B?cW9WTkNsaXRlTmsweENNMng5U2lFbW4rK21GaUhVNHZHVTl1TG9RUGFHYnFj?=
 =?utf-8?B?aU9aU1ZFVi9CRGNFRi8zQkdxa2R5ZlNFMGFiSGQ4aDlLQ1lScEQ2N2t4RmU2?=
 =?utf-8?B?NFZNSVFrVjFZdHhyclJ3T1R2ckRvMGw4dUxYbmM4Q1lZRWNjOUlXRnIzWUN1?=
 =?utf-8?B?ajR3Tk94WXE0ZE9hTjN2WFBUYzJsK3o2SllwdndnTEVQbUFkNm1FazQ2VCtJ?=
 =?utf-8?B?dlAzc0tsbFlsa1JzeCtBbDFjYVhZOE5ub0hRLytEcGQ0NmlCTDNtYWpkbDJG?=
 =?utf-8?B?RVhXTFZyRTJWUURhMmFUMmowdUd3c2x6REtobjN0TnJ4enF1Z0FheHFWTXJh?=
 =?utf-8?B?NE5OTURwTC93SC85SzMyb2tIQkhBdkUwODIwZHlQWk54MFFQbUNqTUNtLytS?=
 =?utf-8?B?M0o4N2x6bnY3OStMVUp6ZHR6SkkySEQ0L1NLY3kyM0tDc0NRdkdaTnpLU1hn?=
 =?utf-8?B?WUxGcERLQ1VlUDFVcStCWDJKZTdza0dESCtRMDI5bmRwaTF2bnhvMkUzcWth?=
 =?utf-8?B?ajFnR3dFT1ZMeDVYaG4vNlcxRXNHbzN6Mnh2WW1CcUdwdzE3N25jN0MxTExa?=
 =?utf-8?B?RzZxWnBaakFLSlNRYWphdWFxVFZhaFRxR0hxaXpEMVYweGdnSGFvZjJTdW93?=
 =?utf-8?B?TWtOQXp4NmhQaDNqanFsNUZQRmpsbGgwdHBKdHFCRVhLbmgwOE9MM3ZPb05t?=
 =?utf-8?B?ZG5tY0ZFWTVNc2JXUmxWNkU2WElPRStwMUF4VmpkVG5sYUZMK0s3NDZpekpm?=
 =?utf-8?B?Ulh3REpkOC9wVExmMXBmc1pSME1kdHZWdDBxZE0wWGZRZ1dOMDZ3Q3RQVmNB?=
 =?utf-8?B?THBWT3h4YVVaS3VsYzh2SVV1c01PeWU2RGM2Qlo3S1BGRVRma2JaN0Fuc3Zj?=
 =?utf-8?B?cWt0S3h1VHhwT29manNaQ3F6dkFKZVJ3Yk9CYlFGMElZMGdGT040OTZDWndT?=
 =?utf-8?B?akxDYXF1QkNYK0oyT1puRU5zQ3h0NXJBWkhsdG45ZE5jbTB2VlhrbmdOeC9E?=
 =?utf-8?B?dmFNVWJ1eW41Q1hkRGRqRURkbVVEOVF0allZQk9VMjZwQVc1eHI4WmN6cEt3?=
 =?utf-8?B?ZXQ0OTNJbVJGemxvamU2dWN5YVIxOGJNZFpQVzcrTTR1QmFmQklHQ24xSE1P?=
 =?utf-8?B?b0dhRlo4NmNxczJwM05VQitlUzRGMXdSbytXTHlMSm1nMEtHT0h4MFk3VllG?=
 =?utf-8?B?aUl0UG5Ld3BCTmNvZTJCWjFzQzZIbGplcFhLN1drczM3ampIY1FMTDZqVHRl?=
 =?utf-8?Q?SqLdla+KSeuLK1Ak=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981d34ee-21f6-4ca8-5672-08dead06cab7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 13:36:21.6740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uB3OCxdMkpBT811TXhtgAPwXmQSQzIVI5dSFXUchHGPYskN7SiFDoIsT0HeoSrf9/MjZDiQRMjXBhllLrP3lKMnKRcOiWWeyYMgt5inIXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6873
X-purgate-ID: tlsNG-720697/1778247385-AB36C161-8FF38AA1/0/0
X-purgate-type: clean
X-purgate-size: 1105
X-Rspamd-Queue-Id: B39BB4F7258
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 08/05/2026 2:31 pm, Jan Beulich wrote:
> "days", as calculated, can't be negative. Drop the respective loop and
> change its type. Similarly "rem" can't be negative and doesn't require
> more than 32 bits. Change its type, too.
>
> As a consequence, the tm_wday calculation also can't yield negative
> values, so the respective conditional can be dropped as well.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

But, I really would prefer to rip this out entirely.

This is used by exactly 2 things.  One is a console timestamp mode that
isn't synchronised with dom0 updates to the RTC so of dubious utility in
reality, and the other is for an intermediate representation of some of
the emulation logic ported from QEMU, which I think we can remove
entirely by swapping to s_time_t instead.

This will fix a whole raft of MISRA violations about use of unsafe
library functions.  We're safe because we are not C-compatible (return
by value not by pointer), but a better option would be to remove it
entirely.

~Andrew

