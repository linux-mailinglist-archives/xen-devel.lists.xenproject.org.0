Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yzC9DAbJS2rnaAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:25:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7A17128E1
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:25:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=dOitJxOR;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1355428.1610202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglCf-0007VF-Bo; Mon, 06 Jul 2026 15:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355428.1610202; Mon, 06 Jul 2026 15:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglCf-0007Tn-8h; Mon, 06 Jul 2026 15:25:49 +0000
Received: by outflank-mailman (input) for mailman id 1355428;
 Mon, 06 Jul 2026 15:25:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wglCd-0007TO-2h
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:25:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wglCc-000WNB-FB
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:25:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4bc8fa-e002-0a2a0a5209dd-0a2a4508bd5a-2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:25:46 +0200
Received: from [52.101.201.12]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4bc8f8-edec-0a2a45080019-3465c90c5f53-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:25:45 +0200
Received: from CH8PR03MB8276.namprd03.prod.outlook.com (2603:10b6:610:2c1::14)
 by CH2PR03MB5335.namprd03.prod.outlook.com (2603:10b6:610:91::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 15:25:38 +0000
Received: from CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e]) by CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e%3]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 15:25:38 +0000
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
 b=FSfWcOqaYOjOLLLZAv/YsTVjAQtA7GWDbvR386aywhC81fMGDbPepHDgt5BIOdntbQ5KQltoXG1HCw6xOC+huKfml2bqwkWsviiLn0eSe9fqvyOtMUYEyOJ4l/gJwbMIPnc/z9bylXJj6wNsrNDM81RWudnzLxv9WHMr8z53lePPTYJhHcXSt4Bbc0oWbKeArCy0jtk5g6rCM0jpdAiY2B1iDHVhweY5Ca1cEik4jp8t3jYXTQsCcMwKBwnz9Z1JCIiErTZyAG0eiFws1SvnBqLdu/6yaFoE3KEzhCu5gKgHxjAJE8UZSe26K2cW33L9iVoxunz5ThqQCCFE8qOgag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxGiT3OZKgqJsYq/8hulY9CxwbAoACwxJSNvNOTJHjM=;
 b=GxJWSkBKhEKkJzjZPTnyROltzjdqoON2zfJv3bjw7iomZAXd6q3HD2Ur3CdNyeSl/7HFwGnzMvOrWmwzR2IWVyutPzOdD3cO37YhGsd39pswnVHXPn5+vrJdWuMxOy6itmFuMxiy7j5qJaKodXTdo8mp8Yo6vFj+whC8AH0nyCumOv8zmxgCQ1+5S76mzNoodquGPgDW5DqDRzG/MOh85hsXd4FudZoTk3tOH3N3j5doKtPR4OGYy1p5hml8RP4WFF0sMdD1m7oKtTEtRw3bWU1fCjNTZJ/v3vWEgjccfsHtLX6SvC7afiiA7QmVtw1vf/uf3eatv9Vt3iWrTIiV1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxGiT3OZKgqJsYq/8hulY9CxwbAoACwxJSNvNOTJHjM=;
 b=dOitJxORVus1ssHvocH0MWdeQ4aP6doyoQMoSZ7bRJQ2NGR3rKNDX9eah6CTpQMqeEyr+5dPLFf9Owv3nyU1GkNBBo2WEwG0+wH+trOcTryML0j4nNqsTB9mX0uS9yrilqdI57lhfoNLVgfxdDrxhlL/n5s87Zr6IPKTBeZ0wmI=
Message-ID: <2c9f8d2b-ef36-4d70-aa3f-bb394b48ee3f@citrix.com>
Date: Mon, 6 Jul 2026 16:25:34 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3] xen/arm: gic-v3: Introduce CONFIG_GICV3_NR_LRS
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20260706133553.3026786-1-ayan.kumar.halder@amd.com>
 <DAB048A7-AE4F-4E28-A613-8FFE4F0AC359@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <DAB048A7-AE4F-4E28-A613-8FFE4F0AC359@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::13) To CH8PR03MB8276.namprd03.prod.outlook.com
 (2603:10b6:610:2c1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8276:EE_|CH2PR03MB5335:EE_
X-MS-Office365-Filtering-Correlation-Id: 3373eae3-3795-4542-a011-08dedb72d53c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RB9bhGoSlqW0JF+y94Hz9jSUGiO6I8olItELa379nDxNwGtv1Y3kmDJCv6ifV0yF575uCfXu0/CgEOk/KlyP55jug1qa7tHvicglPydzOwxsh1U+RveEIvjJg0d6xpt6KxwnEWJLoVVDU8GCS4BrY7yq/yQNLyvHHN6FmUpxRPXbof+ArqCH2hPv23hHvFMJ5fjqIFHD2GNlniFw4sMX8XJdXS5KorA3cdgbUCoybKlYXVObfNrcN3KBeX53ulkukHX62nz7N1bHPU9Fjm6Wl1ft1JqS9farqj2FzlIAUWTkshtb/pPjjWt/J/RpnIfU2ntFsigCPVxl4O1MPgzvTGKX/TFwb5DKk2ibtcUcgVXv/ESRmlavjZFjmlafeG+wM+dQiNUrMRldf5ND6UYUKgcgo4BVdPGAfn6l8PEKoL1mpxArhPCNManfw+eFNjgaTSXbDSZ46/YXTaX810W+iun1HXZ3m23UhExA+KLBLrWK05k6nv26lt46//089bpw+2VScm+BG5v2uR22wI16z98Vneu+F302H4A1cqM3aGjX36PvCM8uvLgmfS9XjxI+kKIsZqThs0EIN17T0yXGl/BwtodbCaKVZdNngwxX49LEre7xlFXR9w8gsFrwSltfo9/PrjktF3XzAZ22ZAEjLBMMuCkQR9CJULhHTmpcec0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8276.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTRDeDhVbWlsMVp5RDZXMXdvQ2RyRmZJRjVkNzFaRnRmL0JlN25TZW5JdDFU?=
 =?utf-8?B?MFAzK1BmckVXMXAxeGVveDN1WWNUZVVucXRIQzV6WU9JUEJGdzBMY3JOL2Jz?=
 =?utf-8?B?eWNza2VIQ3VyOTRSZkRJVHUwcnpCSHVDZHhkdk02ZlZsUlFBekxHM3BxN212?=
 =?utf-8?B?OXpJK1dDckZuUFpKYk81MWpuSk5PSkU1V1JIWFZMTWZvaEE1NnlXek9Bd0hw?=
 =?utf-8?B?V3dub2lDenNPUUN4WGx1cE56cmZhN0lkWHdJVXo2ejRXUzhFYUNYTGNZSUI0?=
 =?utf-8?B?QmpVUVc5cTN6UmtxYlIrRU10YVlOaDcwL0MxOHhKdkZraWRqdDZTZHc1czBq?=
 =?utf-8?B?QmoxSlZSR1BRYTVHME02cHVPbk9VcHREVUYvVkRJaUllRWh6aXlWeXI4TDRH?=
 =?utf-8?B?bFFNUjUwbHpzY0M1cVM0bVJiRWU0cjV3UEhwbjFmUlhiWloyTWNQMlVhRVlC?=
 =?utf-8?B?VUNHd1NtTDltRHJkVVBlT2FoTG94UW40STBzSEJlU3RtQmZleExVcjBJTURG?=
 =?utf-8?B?bWE1aWlXeDlNS1ZwY2xOdm5OZ1lOd0hEaVkzbFpyQk9GQlF1ck5zWkwrV0o5?=
 =?utf-8?B?QWFwbmQ3citMUHUxdFpNWTMwSnJxVVhqd2pxOFJwOXY2a2hFNFdCM1ZlL3R5?=
 =?utf-8?B?RGpXYlg1SjhqS203K2NVZGlieVMrNE8yUFY4M2xnRnRTb0hHckJvRUYveEtI?=
 =?utf-8?B?WFNYK24yNDdkb3kwRzFQUk5wQ3BWTjdERjhkN1lHVkk3dVNrdFl4WGFyYkFK?=
 =?utf-8?B?NzNlYUlKU0xzL05GQWx6Ty9jYUo5T3RCRzR6c0paU0RMWEdNVGpWcGYrNEFZ?=
 =?utf-8?B?MXdaM2psM3Bab3BMU2VobGlqeW4ydVlIR0J4ZXEwN3NSTTJQSUpHWG1hT3Vn?=
 =?utf-8?B?ZXdKRG5ON0hMUlhEajVyRDJCT0l2K3VpS3dKZDU0a0RiT21YK0pRNG82WWxF?=
 =?utf-8?B?dGNBWW9WNnBVaHYyS0ZISW5mQWF1V1V3SlREZWZtMTFBZGRZcWNoYWo2NEtp?=
 =?utf-8?B?OFQ2RVpHemFqd3lMc3Q2MnFEbTZuRjE5ak12ZmxBaGFyNlR0M0s2S2JoM1d6?=
 =?utf-8?B?STE1aGZjN0VQeU94TlFjcGZSUEk2S1lvK1J0QzZrak53NzJIbiszQ3VIUnEr?=
 =?utf-8?B?RTJKb1pxc3NTeHZ4M2VNRWQ2UTlRQnYrMTBHZWRYMTRIV1hnaFdOMXFoOHVu?=
 =?utf-8?B?TlBLZW1oOS9hUFduVGd0aEZGT2J5bjF0cERwN0tnczdoMW14SVZmK2JkT01Q?=
 =?utf-8?B?UmtqdmV3RHhFVnNzdlJPY0tPYmhlbjQwajltakZMNmJOc0QrOXlqMzJLRXNV?=
 =?utf-8?B?OXlUSG4rNS9uYVpkSEkya01XdUpBaW9TQXRFZkQyWTIrZUdzakE5SjhReTdN?=
 =?utf-8?B?SjlHR1JjR2tSdThaSU5rcVRBV1RnSkxZUTNkL3czTGJGZlMvZTJrOUl6ck5h?=
 =?utf-8?B?MjFIcU15aHJXUHBsWk5BMWRCR2RtT1l6TVBqOUtnY0xGQy9CdE9GREJFYWR0?=
 =?utf-8?B?Y0VucDV4SEJScVlKV0pmNGFTcmpLRUpoUGpCc0k2OGxFeVZtaWlqRWlQRkw5?=
 =?utf-8?B?WGRaZ1d1UDdnVUVhRUp1QVhtb3AwckEwMzNNaVFVZHQxai9UTHNBVVhPZ1Fi?=
 =?utf-8?B?ckc3QnlRL2QwWWVVSmdMWGdmS09DdElFaTFJT21EMHZwYlZrZkQ5VERwdEkz?=
 =?utf-8?B?cHRBK3dsVnVJaEw5S3lzdjlOeEdpRS82S3U0U3czRHhldTdJNFpoMGJJbFdi?=
 =?utf-8?B?WEswbGlDN2dIQldQWFFObkx0akVLa1cySVZTWVdjVTNBbCtScG9scjRyT2h0?=
 =?utf-8?B?Y2xZV2ticGp1YnJXcmRueDkrZzcyMXdVVEl4SWt1cWVLWnFFN1JxSmxmbWdu?=
 =?utf-8?B?amdodi9DcVB1aXYzb2dsdU4vbnM3cFhFRW5KNEJCN1hScVM4cjVZbjBzdHNh?=
 =?utf-8?B?OEd0SUxoS251TUtudEh6em5Kdjd1cWtTK09UZ3pqQmFiZnZOdE9ZMGFqUlh1?=
 =?utf-8?B?elhZRnNETHpidDhxczBMZHlRMGltbUNDU3huaUpSMmwzUGt2MGhUcWw2VS9r?=
 =?utf-8?B?WUx5OVRwTjJHVGhaQ2RGMHBHZWw0T0RnUm9kMDBWVTA1OHF3dFZRSXlubGVG?=
 =?utf-8?B?Tld5NVZiL25VeUVqbm5TRzNscEVicXdCbW52ZnpYWCtyRytkcDdWa3AwM05s?=
 =?utf-8?B?VUxPU2ZCclV2MTVGNnZRMmFCM1IwYzFMQnBrY2dVdXF3N21GK2JnMkpFa2x1?=
 =?utf-8?B?MjZIUmNiSTFKK2puUUhoUDkvWG9uamVNdmFvSnlzQVAyTjhRQzRiU0ZVTnpV?=
 =?utf-8?B?dHc2MjNxajVtMUpUN2w4bW5KVjlKODhzZEJwWjR3Y01CQ3dUUVQ5Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3373eae3-3795-4542-a011-08dedb72d53c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8276.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 15:25:38.5778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5id46BIsWdi+TqvF9UREkdyIFYeRtk9+4rPDbBQwtNAxfQe6MOfF4hsF5LavpTwtwZGDG4q1UghpbFiAyX1SWSAONF/8w7449zEUoIBsSy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5335
X-purgate-ID: tlsNG-c1860d/1783351546-A17263FC-78BB6A9F/0/0
X-purgate-type: clean
X-purgate-size: 644
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Luca.Fancellu@arm.com,m:ayan.kumar.halder@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B7A17128E1

On 06/07/2026 4:20 pm, Luca Fancellu wrote:
>> On 6 Jul 2026, at 14:35, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> gicv3_ich_read_lr()/gicv3_ich_write_lr() now reject out-of-range
>> indices with an error message, ASSERT_UNREACHABLE() and WARN() instead
>> of silently returning RAZ/WI; reaching this path indicates a bug.
>>
> I was thinking that it was better to have a panic or a bug_on for a bug, since
> ASSERT_UNREACHABLE and WARN will go away for release build,
> however if it’s been agreed with Julien I’m ok.

Only ASSERT()'s go away in release builds.  WARN()'s remain in release
builds.

~Andrew

