Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 97MhHCsVLGpNLAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 16:18:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D8967A1C7
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 16:18:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=tLDBpulL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1336739.1598534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY2i2-0004ZX-Rl; Fri, 12 Jun 2026 14:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336739.1598534; Fri, 12 Jun 2026 14:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY2i2-0004Wg-OL; Fri, 12 Jun 2026 14:18:10 +0000
Received: by outflank-mailman (input) for mailman id 1336739;
 Fri, 12 Jun 2026 14:18:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wY2i1-0004WY-2S
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 14:18:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY2i0-00ABGq-FX
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 16:18:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2c150f-bab6-0a2a0a5309dd-0a2a450ca87c-26
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:18:08 +0200
Received: from [52.101.85.4]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2c151e-62f1-0a2a450c0019-346555044e53-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:18:07 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 14:18:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 14:18:04 +0000
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
 b=hSuKrPGrQrvULz0UO8JnS/9hQ3VAAwYP3UQTPrh0OQf2Ixg98FADoW6MVs+h+Mou0eNvukI2vPOfd9cOES+x0QBQUH2z86zt2Zt7re6G4J/zW0eUo4S3faGWAA4ZafNfI+xUQ4erRGt7zGf707LXMzfQHNsYOpFgoilNON0daxfkbv0AFVwxnmCPZ+T5z59jdqBUnGgZLB6TKGQDVksKef/vcF+FICpjDrX2AsHUlhGhnsLeNoenNsZ70dRT8/kOT8RWu6TtfUR8S/2X0i2CXGtVWDE6Sk/x8LlcagmM2u/+JVDGQlrL/srpcJT3IDoFdUzQlsDtUhIIgTHWkUlalA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0gG+fJ1x6Ao3ieM5tuU9q/ptCYrVf7uPi+upNT6piI=;
 b=YMk1XlZvmPcUyih0adKLQn5bEc5TXYt69mNSIrtlOMG9awDHYWJVNODDzfECpH9SwZ2zQrugZGouv+B9PXUmKCR6ouWwq16OEnRpr/wRztBvqJNNGe6/uwDa6SmPwcZIumV2n8h41MVWIVXIN7lRrNalc25V2vmPRCF080X36oOtC4c9PpZe3jqoL5CiKJKJ67M9TY3j5TBLiMFr67i59mvMiNg/PXak6HqgrAbKphfCJhtgZLohlrCOZqraikdD5ez58AXWakunJ38ghigJH52TchLTLMZAjAwlvM5/haR4p5ABN+DQeZKxP2swKI2IuPyznpT5cNcAdl6gKHDuvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0gG+fJ1x6Ao3ieM5tuU9q/ptCYrVf7uPi+upNT6piI=;
 b=tLDBpulLGz+8XycTQtzdsrDh0ON94KuKFY4FPQx3WXVDpHuYAyyLMj0x5rrIu/aVOWbF+IxcP7DgbbD9BGbLCYpRMSrOCa9/BoM7dzEo8yDARkpPhGMjX2i/gUCU/dIIMDpUwtehwzR5yMZQYMPFyZlFsiqU+U97AuaA/VYyces=
Message-ID: <0db98119-48f3-4edd-a422-8e50ee713b7c@citrix.com>
Date: Fri, 12 Jun 2026 15:18:00 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: Assertion '!is_idle_vcpu(v)' failed after 'Remove
 fully_eager_fpu' commit on EFI
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <aiwTkDUP6rDPbV6R@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aiwTkDUP6rDPbV6R@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM8PR03MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: b5cb2a2f-5473-40eb-648f-08dec88d6ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|5023799004|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qhXaiy0JyZDsFwi8lvJD9jFyJAp2s2KWaDOeyv6RAB4xnOV4BiMro4rNHO7fSKYUmWFKv85StrvjtKVTkPPEkTGvFK8sHoDJ70yF9YKKDGkdKnTGl2WNXaqqJJdau55N0WeUNQrRVX1SbnSJazlVhnsuDwujtIP6FCrymVOu8b3TadIaHKJMzQ1GPCZaw00rzaRaihjvYbwNSygbRdwk+cA49R7QB//ZcVJlsk5F1scEZTz9rlk1QLZvjAYrsYmn2cvSeiu6I6+PqRH8cAtrpUqtowgjaX6H5MjHgNE15MCPyY24V664x+96Zq0qMfpNAa60qX3z7ewti135Jjfdm3LWT4KrlPG4p7+3hkhKatnWBxMQXOWd/AhIfZhiJ5QPtQ1z3Th3j6mUJisidRU7K8aRjwAJsxucE95VE9Y58UAEtVQeuLtGw4p2fD7/ZOpP0FXKXD1bwp/SZAjtNCKtr1Gl87A2w/gHwNGDzbCLnMIssP3P7DmcMMqxj7Nlv68YuFoSWC+slw0JevPh57heGdWtDuOMJ5POe9GovXOz00C1Yr1v+1Nc1YPo4ruDb0VU9dAY5L+1P2mHf9OyZ3kGpUEj9Xf/hDSZRyMfyHzArPEYFi5DynbP8MTW+We/TdJPvu2G2HKaV2gQJOhZmmxBBo1WYSSpOmcObvganEjOtY32jstnPAqpyCbifQo72UKE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXE4d3YxUjJYOTF6aGFIR1VyalRrTGx2VVV4T0ljWEtlYVBoUThRWk5HQjlu?=
 =?utf-8?B?bmx3ZU1xMnY2UFJWMy9jUXRTa3BRYktUa0UvbXJiRXY3VU1sYUdyYWRLS3FC?=
 =?utf-8?B?dkJPOTVTeFpKVlFOV1FUeTNZQTZLNUlwWm9QUE1YYjl2QVRRdmVFTXUrMWJW?=
 =?utf-8?B?eDZ0YUdjRjRpT2RjQUE3RTYxVXUvVjUwQ3UxbDVwUTBJZXZNbGNSVndMb2pO?=
 =?utf-8?B?cjMzNlF1cnc5RjQrT3NFWnFoaWRKS1g5eFlTK3Y3UkhHcjhHa2cxNElrZnZG?=
 =?utf-8?B?eGdINFlTaFRNTngyS0V1Q1dzUGxSSVl1RmFMcWZ1WDU5aGdoTTRrSzJRZGZi?=
 =?utf-8?B?NUJTNTB3eENvYmhsTFQ3THNHNWdqN2x2eWZuVEQ2QXdRZHMxdG9UUUZQd0Zi?=
 =?utf-8?B?b01Jd1cwbzVKcHUwcCt2ZkJWTUhyY0c2cmNuMzZGUlhkb0VLT2YvUzFEZHk1?=
 =?utf-8?B?TGtkMXQ4c2JJUHpNUHZ0Mm9kRzhEQkxSZm5mSkNndW9qaFJrbWVwaWJMVmw5?=
 =?utf-8?B?UkpyKzJ0MzJlRHB5QkVBdlFZZE1VckNqNzVzdVNnRnlsTDA0OVpFaGtDTUxi?=
 =?utf-8?B?c1FDZExBU0lNUWdtMk11RGs4Q0RiUG9EbEUxMkRGWnNieTlEeHYydFlxdTJH?=
 =?utf-8?B?aFhOazZEOWFTL2JRNVhJb1F6RDdMZVhoa1lUMElhNit0NWxvKzhvZnU5SHJp?=
 =?utf-8?B?WG5hUjdGWE1WeGdUQUlETmhIb2ZDcEJzZ3gyckt4MGxUMU1ONmRWMEV6TFo1?=
 =?utf-8?B?ZncyZUhJVFNLVGQzODR3N0VpUDZZVHFoR3dkblNNNDMvTmNOdUh2Y2s0YTFK?=
 =?utf-8?B?cDAwcHpkVTZaZk4xY0FpTnRHTktPbEtWSm5kNDB4RENpNW9ETVBjR25rZllZ?=
 =?utf-8?B?OUdBU1NnN1lXNno0d01sVHU1SXVyNk1rTFExR2llbmpLTHRKbHZhUEVRa3JN?=
 =?utf-8?B?a3dmb1pBaEp1bGhVYXhZWmp1Snk4Yy9HbGVwbHN5R0FWd3FTaEMyLy9BQ1U2?=
 =?utf-8?B?QlB3NkZFSnlkT05GZXhYT1UrL0ozMEZ4ZzdEQ0xURTJLLzVXazJSNHl5Nkgr?=
 =?utf-8?B?QmNWSjBZaUc5Sm5BaTg2WU83aXdSeGtrN1dwSFV2SHpNY0g0aUR6ejZlZDdQ?=
 =?utf-8?B?eUVQaGl1Z20rYmx5b1lwb1A2UTVoL1FKOGdSMjFpVDZ2SWpKd3VFQzNYTWhV?=
 =?utf-8?B?QzUwQUhtM3lNL3VBcHdwbFdlQ1dIbEtvTS84T3lSYU03RWU3UGZGT1VCZmpD?=
 =?utf-8?B?K3p6SC9SYURzazNHdjNiM0t5OFNJakZWdEZUcWkvU0FBazJnRDE4NzVSMExO?=
 =?utf-8?B?dzc4bzNUOFVwNi9WTG5YZjNXeTV0c3RlQkNCR0t2MWdLNW9Ubnp1Z2dmSndF?=
 =?utf-8?B?enpncy9QVExXVmxwODExSHRGb1NhUHlsOVN6NjZjTHgrTDB5Tnk1NGFDUWI2?=
 =?utf-8?B?RDNUWUhreWZKRnhKQXZONnFsZEF5WXFnTzVjcmN5eUE5b1J3VndWWnRpajk0?=
 =?utf-8?B?VVo4dHZZcTFLQnRCVzMxamEzaFR0NDQ3aWtJbElJajBtTml3bndEZVcvNEs3?=
 =?utf-8?B?ditKVkRyOGJHOU5IUEZ4dklKVDZuVDdOQ2dzNFhSU1VuY0MyWXArSzYyWHZP?=
 =?utf-8?B?MENDMGdDNzJvNVVsUGlFYXFtbmZWMEtTTkN1cDVRZkM0OVIrYVVKczgrQWpt?=
 =?utf-8?B?Q2twQW1SbStlenpVQkxSb01xZHQxTEZhVU00ZU1lTm1FbGdWU21hQU15bDZl?=
 =?utf-8?B?TzVvZitGak9FTi9EZGNZWTUzVnVPKytPd1ZtL2duSUMyTmx5TWxobnlsRExz?=
 =?utf-8?B?czlKYk5ZYVNLNTZPNXEyc3U2ZWNHT2orRkVNTlR0WGFQTS9vUHpZK0NUbVlQ?=
 =?utf-8?B?Kys4SjdtYUN3eGtHRWIzS1RRT04rckY4bkpHWVRoVlBVNmc5Ymt0ZDJyMGNw?=
 =?utf-8?B?WlNrS1lBd3N3ZnZBZWZRMlBFZWd4elUwR3BTWktVczZKOFVRckRCcXhEZXhk?=
 =?utf-8?B?RERIeFBvYXk3bTVUbStDVWdhMTZ4ZE5YZDRTNVFQclZaL2NWdmxnUXBVeTNH?=
 =?utf-8?B?SUYwaU03dFp5T2kvUGNHQmVOb3Y2dElLYzlxdVNibTgwQlc4aFJrby9EQUIx?=
 =?utf-8?B?ZFlBM0ZsQm9DOWNxZlpPVmdVaSt3TjJONVZsWE13RGdDWU5nZFBzSUtWUEVE?=
 =?utf-8?B?R3BtTEU3bndZeHhUTXZYSUk2aU93TGdLaFdRZEtxOXdjVFp3aHh1QklMajh0?=
 =?utf-8?B?d3FaaHlXUTduRllEWUhhc3I1dXhiMW1tRTZRT2hldEx4aExCbDJzdnBTckxh?=
 =?utf-8?B?K3ZBN0R6c1QzS21MUkRaZUpXTVhBYzJqeDZ0ZENaUk12cVdWb3dJbEpnYmk4?=
 =?utf-8?Q?rYzHWS3Q1F320Nuc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5cb2a2f-5473-40eb-648f-08dec88d6ac4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 14:18:04.1417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaU8iG0pJHC6ZWrcqWzGc43qyjvwnYiEUEKookNYvQVkQWBTJ5YBY3XIJuY8qfkLnvBdtiDYVS7QIjKK/qtuQo1eA1G5mxQocHIJ1LIhfto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6230
X-purgate-ID: tlsNG-d25034/1781273888-DA975CF5-D708EE62/0/0
X-purgate-type: clean
X-purgate-size: 1846
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7D8967A1C7

On 12/06/2026 3:11 pm, Marek Marczykowski-Górecki wrote:
> On Fri, Jun 12, 2026 at 03:53:49PM +0200, Anthony PERARD wrote:
>> Hi,
>>
>> Since commit dba44e051209 ("x86: Remove fully_eager_fpu"), I can't boot
>> a machine and get assertion '!is_idle_vcpu(v)' failed instead. It's
>> netbooted and EFI.
>>
>> Xen call trace:
>>    [<ffff82d04033da2c>] R vcpu_save_fpu+0x65/0xdc
>>    [<ffff82d04029c5c4>] S efi_rs_enter+0x37/0x16a
>>    [<ffff82d04029c7e3>] F efi_get_time+0x19/0xb2
>>    [<ffff82d04047cbf0>] F init_xen_time+0x1e3/0x2b4
>>    [<ffff82d040477a49>] F __start_xen+0x1d71/0x24b8
>>    [<ffff82d0402043e7>] F __high_start+0xb7/0xc0
>>
>> Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
>>
>> A few more lines from Xen:
>>     CPU Vendor: Intel, Family 6 (0x6), Model 86 (0x56), Stepping 3 (raw 00050663)
>>     Bootloader: GRUB 2.06
>>     [...]
>>     Enabling APIC mode.  Using 2 I/O APICs
>>     ENABLING IO-APIC IRQs
>>      -> Using old ACK method
>>      ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
>>     TSC deadline timer enabled
>>     Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
>>
>> Commit this Xen is built from: 50936ea05660.
> Interesting, the efi_get_time() way is nowadays a fallback if cmos one
> isn't advertised. Can you try adding `cmos-rtc-probe`?
>
> Anyway, surely it shouldn't crash... The commit you mentioned has "No
> functional change intended", but well...

Well, no intended change.  It was a very big patch.

Nothing should ever be using efi_get_time().  It's unusable (i.e.
crashing) on hundreds of millions of machines.

So, while we obviously do need to fix the assertion, this is "only"
collateral damage from having fallen into the efi_get_time() path in the
first place.  That wants investigating too.

~Andrew

