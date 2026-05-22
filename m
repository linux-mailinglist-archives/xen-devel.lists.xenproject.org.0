Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id J/yNEdtcEGrbWgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 15:40:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 978105B5568
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 15:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316858.1586196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQQ74-0007bJ-G0; Fri, 22 May 2026 13:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316858.1586196; Fri, 22 May 2026 13:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQQ74-0007YP-D1; Fri, 22 May 2026 13:40:30 +0000
Received: by outflank-mailman (input) for mailman id 1316858;
 Fri, 22 May 2026 13:40:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQQ73-0007YJ-4d
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 13:40:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQQ72-002To2-Gw
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 15:40:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a105ccb-5cb7-0a2a0a5109dd-0a2a45028828-6
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:40:28 +0200
Received: from [52.101.62.39]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a105b26-af86-0a2a45020019-34653e27a41a-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:33:27 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS6PR03MB989095.namprd03.prod.outlook.com (2603:10b6:8:368::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 13:33:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 13:33:24 +0000
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
 b=QaTSDMQUaPUX9Ka4wG2mbg7DRUpYSi4OxH6K60ThNwwB9OorrBk1EFHx3FHmEP4SiSjga5lK4/NTuk8VrCuVRHyWtwuRTmcE5B/ybL6pyyeKiAoLtoxDRHQZcjnHnIkuO0CMIrFr1AcWEbk7dcIvDf98S0hIamgXmaBwO/sIBGiG2Lw9CnEZCbifmLWqhuLK2iLMOZUHAxjwRCCJHJwnG0ySWMklnQgYdCso3MOnUmonRY0GTRUoF0ff66lMe98XPOEZQQxXhT6G1scmEfOUtph0jcwbNMrJEoERpWXY1QUi2DKCM3Oc737fVCJg0+nbMn4HCgMA1mBAbPBtHMhuEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHE/ePwZPFW2mVX3FxK1qv1GIBqs0iIr5q0mbQMKbhw=;
 b=eIfydgbuneFaIglS/sjBXIs0WiXfkvOD3i1ravk+lHdACwdNGhx0R3QnNSbKRShwLns1sr8r9bhr68Q6jP4DdP2pYp3fC1RwkxkApJnTjgBPReZ3el1u0F+UacR//4xX81kDwq7s6skqrW3G3Pf4Unml2koPrHEay9Ho07ffsrEAbqPmZ/tBqjFCflOO6MZx+GIMgMMpGF3CCMYmJxGiZd9qN6cZ1SgqArUZsG1oYW7WCnRrT4t6C0FUhbg7JPQ1ZsI7tuizPzSUNbyIdSTRKC6ByI4Qgg35KUVZHJrExwBDw7SAtERQYn63cXE6zLR7eoxwVxtLtugukuQyEtKU9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHE/ePwZPFW2mVX3FxK1qv1GIBqs0iIr5q0mbQMKbhw=;
 b=TY1M7y+071HYBTE7uBS7Pf+wP8lvUOT3YRt+OoNKeYe6GSAnYypcHP2EnjCAzRoCNYse+CATTDP7hgt8PRBxZ7mxLmANmZq26xbACZDig387ntapiKS/toIDtt5O97KOOI5BN9Wl7xZZHBJay5naCpO6Vgfu/oBDMVhDc6kxE9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6fa17f31-05af-43f3-9a85-daaf96d97347@citrix.com>
Date: Fri, 22 May 2026 14:33:21 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] pv32: Fix bogus cr2 on fault in emulation gate
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1779453231.8631fc262581453bbf619ec5b2062170.19e4fad80e4000f373@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1779453231.8631fc262581453bbf619ec5b2062170.19e4fad80e4000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0266.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS6PR03MB989095:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f7d31d0-aa00-4af4-41ad-08deb806b313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	boX1u1l6f/Rn5UJVDdCLbkDpRsI94jt9P6FtiD9z+LVeiWIUjwNNKVEfJrOFGmmieSgPAyCt3zw8DIzMmFmU/2cox94Eg1hMsPVDWcymdmY2O5ErstfZ9qPtmG9352ClNyNwjrfEiiDFT2c5S3EynK2mjw2m3pu98EXNWTcsq4fEnxzz/ald5sN4gwMiKdnBAEvk751VhWPeB4qdbr5SXBGCPp2/5a5D6KXyK827QlwpyMEIh+LiX82qBSGmx5LjcADMsangSxDKsstjNxtPxrkU251BqR7NR4rtz1XRX+AAWZeJPOkKXcbhhxlwuY+9GkilaAiAm4HGsXelqpMq0rPgmhUrSmrQbUXKs8e3UgBi9JHCsPaZkIRayuuInbojeLpyx+AmQdkrpuM/aBt9ptNNSk8TDsd0u5rNIu7hmWPgbssn41tnDqQ/LU2RKrapbBBiFUkyQWHH4eTFmYifaPmOTNTgArYfQ6tuwQZvCo+9rmr1bL2PxV/ef5wPCA95Uy/GrqqLM388/2fDhi64LWDQr2qNsL0TrCyi5yeKcG0RjJyiyGcCWyCEQrHcDEgEiR3Cuo0kY8qycwnOOkoUuvvk8nJbG+gSmKPXQzStOMwkZEo3cjKeUGhewPyB7gX968rgjTJQ5+7Nk42TKwOwrYK+TzhixTr8clSPDV++evXpE0/OJEuteD0WIP7+MsLP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkVpM3E0UU1VVHlyZzE3eVNlQUljRmhTa3NjV3ZmcUtIUzd1NVArQ3o4QUVE?=
 =?utf-8?B?REIzZHhLSC9lelF5d3FnaFc2YnhBNWFzS2VJL1IwdUtSUnBTSG9EbTVJRVVt?=
 =?utf-8?B?YjNONklXU1hvTlNUbHNuRDkrR2JYZmtkYkovRzJmR29iTW1vbzNlR2p4N0pr?=
 =?utf-8?B?cGpudytmM3J3cXpUS1E0VG9LeUMrZ0NteWsvaCtReCtRdGtyQVdhZGtBd0tw?=
 =?utf-8?B?RVp6cTdTdnQ3OFZRRXZNeks1RDRTNmJ1N09tWW9LbXpnOTlYczltbnFpSU5X?=
 =?utf-8?B?dUcxSTFZL3dhOEF6U3RZMStzbThZMTU1RklZbFdqeVNINXZOZE83UEI5UlhL?=
 =?utf-8?B?aU5JelFGSmhvRERVaWdOMHpIZlY5bGFzaGhsaUkxTjFlVWw3cGgyYVFHRVpi?=
 =?utf-8?B?cnNWQStaeUZjb1RRTmNzREZ2TGFqZUxHSnExK3d4Q1lFaXpEdnJlTXo3UlhB?=
 =?utf-8?B?YTlEOFhaSEw5RTR0S1ZCL280QWFNRDBBeWRKTzdqWlN3blp4NytBT3ZpRmNl?=
 =?utf-8?B?Sng2Z1lvOFp1VlR2Z1VPWnBVazNlZzNJeUFNME9UZDJPRmkwR0NIa0dFSlNO?=
 =?utf-8?B?SFh2NlloZCthbHNFc2FQTEx6cUVIcllNbmRXWU5yVUpueUNQQk1TVWQ5eTZV?=
 =?utf-8?B?dFI4aWlzQzFNcUw1SWsrVUZlQUlDWXFuU2lSRlhsYStMR1kxWElTS2VOUEdI?=
 =?utf-8?B?M1VmWmVYYS9DZXE3di9tS2ZNTlJ0YkE5dDEzTFo5UzBic3k1NmZkUTlPRzJD?=
 =?utf-8?B?b1dxamFRTFRFdHFXbTJhdEFJdkRURWdlUUIxRFFycXRIbW9iWFBkZFRaNkNt?=
 =?utf-8?B?K2FhaXkyc08zSzhURHZqbGNoK3dkNmVUck5HcVNaeHQ1SmlDRTRES0tkSHVq?=
 =?utf-8?B?SDhObHhRY2hUMGxxMTdEMFpQTzg4Ylg2TmN2QXRQVDVGVERVQ2F1SWl0NTZl?=
 =?utf-8?B?QS9MbUtCSnVWVDk0d3g4T2dIUE5Oa0hYTkw5a0prc0hPbmhxTEs1UlBMdkM5?=
 =?utf-8?B?eVN5MlRjSDIwaHMvd0FSeVVZZnBad0s0NW9ZaTBaZURka2ZKL3VpU0FpYU4y?=
 =?utf-8?B?RXhwUHhISlZiNk4zNjVkODZGM1p5UEFjS0NQQmgyRmR3U290K3d4a0FJdlJH?=
 =?utf-8?B?b3FJcDZFMEp0NU5OM1JDY3Z0aHp6S3ZUeUdhUkYwZGU0RE0rM3ZVNmd4MlU0?=
 =?utf-8?B?NWt4RXhRMDBSQ2FkcTcrWXJ0cEZibitIYXNKTnJHeGxHMEowNzFrOU9mS0VO?=
 =?utf-8?B?TGNlaTdrNmFmVXQ4aUIyRXZ0UW0vM0NmeEpDU2tqZEdGaUIzWklnVFA0aTBC?=
 =?utf-8?B?WEZHWDJlZ2V1dUcrVzFRaGp0RTdMcFNjdElyS1o4OGJCaDNLVnRTcGIyNWQx?=
 =?utf-8?B?bGhwUFJleHA0b1c3T0FjSFJuUUYyUFUzc1BQSmY2NEQ5UWFmUVlGcFBNUzZN?=
 =?utf-8?B?R24yMjRHdkhST0dNUll3NU00QzF4RldRdlFrUlM1aWhiVmxHV2trMm15L1kx?=
 =?utf-8?B?QUY0bUZOTGR5a1RhYW5ZUUhuQU03aGord01RNzBMUXRwZXRsbkh2T21saGhX?=
 =?utf-8?B?RlU4ck8rV0lTMG1lNThWdU5SOGo0VHlDS2tVWTIxR3VGV3BYVUZWcHhFRWtm?=
 =?utf-8?B?MEJLZ1c0a2h6NXAva0s5U010ZlBpTmF2bHREM3ExbFUrOEROZlNxYWMwZWRJ?=
 =?utf-8?B?TGpJV2x4bUVrbUFwU2JYSzdOclNSOTJUQjF6YVdmVzYvaVBWT0tLWC9KS05V?=
 =?utf-8?B?MzZnTWhPSFdzKzU4QWJkS2FxNktMWUJjUjFjcitTcnYrTVFjbUxWZFlkbk1r?=
 =?utf-8?B?K0dHNEhmQXFQZmNENmpOcVdqUFIySUp6NzhZcHZOV080dzlhUFZEaXNTTGc5?=
 =?utf-8?B?R21PcFZKQk1TaG9iL2dkd3FQMWNxV0dFNUc2L2NmUWw2K2VGek8rcU5lbWhn?=
 =?utf-8?B?MnUzYzhqSkN5TDNQOTkvekZmUHBJNkZPcFZieFVJbllUbU1LaEM5dFFSVXhU?=
 =?utf-8?B?WlAxbnZEMFY0OTVIb3pVRDdmWHczckgwa0Z0cWJHYWVUcGhPdU5TMm5aNStE?=
 =?utf-8?B?THpOOXN1OVVBNStuazZPSndtekxhV044VlRQY3p0TXFpWUgwSEdNQS9pZ3dW?=
 =?utf-8?B?VXVLaDd2UHp2aitQcEtMdVBYNHlHc0tWc1kxcWlhaFZ0WUZZNnM4Q241QXJD?=
 =?utf-8?B?bTZyUDVFWVRHdC9BTUFMSmFLc05Jbm05YUM2SU9PUnpJWlE1UFVzd0l2NThH?=
 =?utf-8?B?TjAycEJOUlA2bEdyUjVHZlRjWFRLS3lLSDBjSUxndWlScW5xbUtLNys1RjB6?=
 =?utf-8?B?N21DTWtHVFlmcnRSZm1VdVVneVRlVFlaNWI0YlpzcnEwUzhEYjN2UGtRYnk2?=
 =?utf-8?Q?6b2iShj/J2pjFmmE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7d31d0-aa00-4af4-41ad-08deb806b313
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 13:33:24.7812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qDojo2kEZ2+VqJKVPJdXqLxvL8dR1mUnlYkb3H+ra/cRF0RYcibMPKll7Uxip/sDUYtftYj7hx5LSgT0VoW36ZePQKrhcBTtsoVqYIl6x4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB989095
X-purgate-ID: tlsNG-720697/1779456807-81D77161-57038220/13/0
X-purgate-type: spam
X-purgate-size: 2171
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 978105B5568
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22/05/2026 1:33 pm, Teddy Astie wrote:
> __{put,get}_guest returns -EFAULT on access faults which causes
> the injected cr2 to be off by 14 bytes (as EFAULT is 14) which is
> incorrect.
>
> Fix the computation by relying on copy_{from,to}_guest_pv which
> reports the number of remaining bytes instead of a negative errno,
> such that we can compute the offset properly.
>
> Fixes: 70ad570b2799 ("x86/64: paravirt 32-on-64 call gate support")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> v2:
>  * Don't add variable in push() macro
>  * Use uint32_t type for temporary value.
>
>  xen/arch/x86/pv/emul-gate-op.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/pv/emul-gate-op.c b/xen/arch/x86/pv/emul-gate-op.c
> index c2c699fbff..9c229c46c4 100644
> --- a/xen/arch/x86/pv/emul-gate-op.c
> +++ b/xen/arch/x86/pv/emul-gate-op.c
> @@ -286,12 +286,14 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
>      if ( !jump )
>      {
>          unsigned int ss, esp, *stkp;
> +        uint32_t value;
>          int rc;
>  #define push(item) do \
>          { \
> +            value = item; \
>              --stkp; \
>              esp -= 4; \
> -            rc = __put_guest(item, stkp); \
> +            rc = copy_to_guest_pv(stkp, &value, sizeof(value)); \
>              if ( rc ) \
>              { \
>                  pv_inject_page_fault(PFEC_write_access, \
> @@ -359,7 +361,7 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
>                      unsigned int parm;
>  
>                      --ustkp;
> -                    rc = __get_guest(parm, ustkp);
> +                    rc = copy_from_guest_pv(&parm, ustkp, sizeof(parm));
>                      if ( rc )
>                      {
>                          pv_inject_page_fault(0, (unsigned long)(ustkp + 1) - rc);

As with v1, __copy_*() rather than copy_*().

I've fixed up and committed (including Jan's suggestion), along with
some improvements to the commit message.

x86/pv32.  "gate emulation" rather than "emulation gate", brackets on
function names.

~Andrew



