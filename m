Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AD5CED973
	for <lists+xen-devel@lfdr.de>; Fri, 02 Jan 2026 02:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194819.1513005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vbTsV-0004JZ-Cg; Fri, 02 Jan 2026 01:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194819.1513005; Fri, 02 Jan 2026 01:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vbTsV-0004GS-9n; Fri, 02 Jan 2026 01:22:55 +0000
Received: by outflank-mailman (input) for mailman id 1194819;
 Fri, 02 Jan 2026 01:22:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A6FO=7H=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vbTsT-0004GM-NT
 for xen-devel@lists.xenproject.org; Fri, 02 Jan 2026 01:22:53 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e15b53e-e779-11f0-b15e-2bf370ae4941;
 Fri, 02 Jan 2026 02:22:51 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by MN2PR03MB5181.namprd03.prod.outlook.com (2603:10b6:208:1e5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 01:22:49 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::4af0:a6d4:e568:ac0e]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::4af0:a6d4:e568:ac0e%6]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 01:22:49 +0000
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
X-Inumbo-ID: 8e15b53e-e779-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRn9y3e6Wmg12TXb80tJhBzlGfFrhOivFObkG7ebuXJzJDjtfMV0SxOFyV9WAqqtkxVDryUn1pUT6QM3dRjiZoglLGE36CUQuagyRw4iKDCXf1FXcfqf17/xwgBoyJ+b7xpTzuah/qWAsP5REuqSlT071DyvpOyQa3aJ95o8w6XF0flh3qAR5+JNSzy7R0WswUpsuFJKcpnsUc6dM95ihL5WDU8I97/AMFU7dU/e8hyKMxEH+SHyRwNTUhKRbFqEsw7npPR3Aa0EKQKQcymc3xEdxL31+ZRC+qlxOOjX3fzZEPnNuS9jjisSENosH4yX+vzWg3ozGsPyVzz5N/mIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpWFgV4moOBcRVk1A5juyp7Uf0nwRfe4k547PPJBQZE=;
 b=kw0Ms+vyrC67hzsMakGvm8GauFTCPKY8YiFcflRJtNAulxi/KahY5fn+DV8GxyElQRag+94W8KQxBfWFKUqmH9Yxm0PrQMhLGQKeRlcyzxyWPeqO+6NesKbEcM4qc+TRmsZWsU3l3izVKP0sYfapQt8xpyGU4psIZlsK7YCBp3oAED34JJXR7TLv5351dqucjv+3SnzLNnYP4EnUyk26kHCt9lmOrHCbJ+zU7LixzB8EXlyGHi2FlmlgIDD4jHXWlkvnhOIUXGn+T0+Yw9DfuljdmXQyVnK97BC6QEwVQhcRNSCq+VfIM2S5BMazNX6vWKQO5g/wFa5ovFz0UGeOEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpWFgV4moOBcRVk1A5juyp7Uf0nwRfe4k547PPJBQZE=;
 b=lAQy2B46oxVLvcijUBTLJyIegJWwK6Itg3b1BItK3rd09SS/XTLsaqfS/YKJ99JVvlIbdXq5n9xEZqgjWjs9AQcZSn/dWItfkWn5QO6IUBLOXS6SDjBDYYdBRgZLKZ5eVzO8AGiDWwff5k2mEWyiJ0R8i2q3tvo8/g0iBJoDR0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <90681969-e7c1-40ce-88c9-a5639865c93c@citrix.com>
Date: Fri, 2 Jan 2026 01:22:32 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: Dealing with SIOV/IMS
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <aVb7jL52nkmSD-Gr@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aVb7jL52nkmSD-Gr@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|MN2PR03MB5181:EE_
X-MS-Office365-Filtering-Correlation-Id: dd9e081c-a010-4247-4d8b-08de499d6b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2ZqQm5GMk5uV2pHbEoxMlZ5ZVhMVjVLQmVjRDdzeEUyVDVFTVRZOGc1bEsx?=
 =?utf-8?B?azNaYXNzYXA0cEkrOHp0enVrck13cUQ3R0ZJS1NPOXEzV1JxZTVLSGRpMitM?=
 =?utf-8?B?d2o2S2VYY0FyY0NXYm1ucW8xaXQyRUFpbko1YWlTc1Y3TkpsOXR2MEFoT2N2?=
 =?utf-8?B?QmFhU0Z0c0VBMUVLMXRtYkt4NTZEYnBLVHZuTTcxK2JsT1JXdkxXeVdGdlpD?=
 =?utf-8?B?WGd1RG9FV0VwMDVHL21TaGJwZWg0SkZOYUkxd2YzaGJMQUQ1MXlCN1pEemR4?=
 =?utf-8?B?UTB6aUxXb1JZZDZNa2xxZWVyYUxqaUgwK3VtMjl2Y21JWllJSmlLZ3pJbjlq?=
 =?utf-8?B?eG5qeFVkaUJLNytteW40aWZTUmYwZ2NrQUZDbTBBNDRBMjRMUERyMjJkREdz?=
 =?utf-8?B?bTNXSC9sNUtnWXFlNVlxcFJzWmh3ckU4WW1ZU3p2eHRJWi9GU1Z0dDN5RG16?=
 =?utf-8?B?dHFheHpuSFA1azYwVEVqRXF1cllyN296NFI0RVF1S2FBYjlyZGwrUjF5QXlE?=
 =?utf-8?B?Nk96cksybEx0WUhWK0tOVEkxYU9wb0phV0N4K1NoWFE3LzJ4S0pKU2RiYVV5?=
 =?utf-8?B?bXBEc3VqU1JpOUFNc2NNNzE5ejdDRkVIZEZ0enNMUG9YaXkxSUhWTzdoZUIx?=
 =?utf-8?B?aElUYW4vanY3dEp5elVVeTlqelFMczgzS3dVeHdmQzFLODZiUEJPeHFpYk1s?=
 =?utf-8?B?SERjZmNQVkFXRm1BaS8rVzhpWi9uQnJsTEptdHMwZ2NqNk52ejRneURSc3Ra?=
 =?utf-8?B?VWY3OXhvZU9HMCtkZUlWVFJTL2tBSnkzZXRhVVV0eHpxMVZjTUVkakNEQXBT?=
 =?utf-8?B?MllSeGRNMHZaMkhzOEY4b2dIWHFBMlFYN1BDaFIrMjRwOEJFQ0hiRmFGcERn?=
 =?utf-8?B?MEpaNTdiWWhBRlRKQ09wc0RqY200Z1RaeE1kdXRZQUN4WEdZVmJJU1kxcVNa?=
 =?utf-8?B?cEZDazd4dzBzckZhaWhSZlgvYktxV25UUGF4ZTNYVEkxVWt4bEtBT1RVVTBQ?=
 =?utf-8?B?RCsrUU4zRFdGK3ZCajFCeE5hYXlCVUJVMzkzZ1hSeVZ2MEozK3l6MGZKQkl1?=
 =?utf-8?B?YTNHVk52L3F0RGpYMThnTnZEbmJtMkJtQlVTOFJhclFpb3NtL09scHQ0VUVi?=
 =?utf-8?B?OERVQlJlU3k1ZmRRV1U3a0VoYy94WUZ5ZVJ4aEpHcms2c1NjVy96Y3ZrcDJB?=
 =?utf-8?B?dFB6R200emorUkNOTkhwdGR5dUdjSjdIRGlWV0ZUeUJkRGVSYXdYbTYwRGJ3?=
 =?utf-8?B?SERKZzFZNG93RlhxdjZBQ3NVeVY1RUNtbDU2SkE0L085Z2w2NFM0c1NGdDlK?=
 =?utf-8?B?ek9TdS9UbjVLYUY2ZGdpdStBUG1SY2ZlMktFKzZNMmRVMFZFL0o5TnBlRm1M?=
 =?utf-8?B?YTlRMWE0UzJHWmZyL3VDTGNyNEpaU09TdHR6S2dtSHIzY1E3Q0lQbHJmS2tS?=
 =?utf-8?B?ZUh1OWtFbFhVSk13bE5VUkhuYlhxR3FuOVA4bVRiQ0JhOFdPR1JkajVQaU9D?=
 =?utf-8?B?UFlnYWJZVUd5SGpEazJNeVIyamppV0lpblF0R2RwMkRvMzBMN3NFS3hQQVJG?=
 =?utf-8?B?Sy9SakRDUk53N3BDbmtlMnhONXpRQ2pNZ1lFT0xJVUR6U0ZPejZsb05DVEhw?=
 =?utf-8?B?dnY2SmpYZXBWUEEvWmN0SVRwaEtSbjE3ak5ET0tHc0loS2NlWWwycFFJT1B3?=
 =?utf-8?B?TW1aa2lUSElsUUxkNW9uMVhJUG0wcjZFc3BpZlAvRlU5NUlnZEcxZWVmdVZH?=
 =?utf-8?B?Rk5aV29MNTlJNzBKKzMxWk50Z1liYkJLSGpML0VMckR5Qk9qUWgrSWdYWUVo?=
 =?utf-8?B?a2ZEZkkyYUxiQy8yQXdnL3E1Vm5VcEh5eURFRUhkVzdaRWFKTDdmVVFEdjNF?=
 =?utf-8?B?aFhFVVVZRWNPSkJDTEFrelBGbEVaZGZkeGNuLzlzQlUzVmVldUdUS2xsMnlZ?=
 =?utf-8?Q?THYFUnRjAZr1lBkINUPzEx1CNLRw8bje?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHJZSTAyWFhaV2ZlVVRnT1d2dUhQOXNjQy8zM0ZzdlJwSGhUalF3L3d0c2ho?=
 =?utf-8?B?UXN4UGl1WUt5OFlWYStoRTFXbnhrak9wQVlUZ2ZiVEFudVhPNGl6TDBNYTVQ?=
 =?utf-8?B?MjhhRjQvWVhTbDh2NTVLU0lOak8zczl3NkV2a3FwSzBPdG81blJtQVkwNUxF?=
 =?utf-8?B?RUp0QWk1UnRpQldlYWtEanl5cGVqbUFISVBQdWVtdVVlSDJ0TnVQa2xNcmdi?=
 =?utf-8?B?cXBTcTFOUmhTbWRVSzEreWx0U08vRmxtbWxsd3gwRUFiZXJwREV5NXYrTnRB?=
 =?utf-8?B?elVNVE9mZGtJZlZoQmJybnlKWkwxeWpWSXByZjIyVDFYeFVnV1FGempveklr?=
 =?utf-8?B?bDBhT2hBK3hENlJrcGcrYnBCUVZPdCtsV2JTSEoxd2NMT3JJYTd0RjJEL0Y4?=
 =?utf-8?B?T01WOG1hMjFWdlluTGVRdG45elBkZUIwZ3JuUVB2NkxRakpWYWZHa0d6L216?=
 =?utf-8?B?cDVFVjM0eW5tVnpoa1dxZWJtdnJnRkxaWmlmNGVNR2lXcjJId3RkRHVSMUFN?=
 =?utf-8?B?N3pIY3paQlluQS9CYnBQb0RJamZXaWppS0hBOHQ1OVd5RlJxM01zVzNLU3pO?=
 =?utf-8?B?RWdxN2JkVjBxeFN4MG02bFVsd2dBejhPM2czK205RmpvUXZzcWp3K3pLRnVy?=
 =?utf-8?B?K3A4Yk9FejU4bU1xTmpEM1ZuaGdjRVcvK2VjMXM1M3BFOTREV1pHYXkrakU2?=
 =?utf-8?B?ZTJJcGpSOGl6eXZuVVZ6Tk1iYmZNdXVkMWVrSHNBQU5YNUttRHZGZFBiWWp5?=
 =?utf-8?B?dWMvd0ZmWXBESitjQlNlUEJVZE1zSjloWGFQUzNpM1U0Nk9scGhaWTJRK2F1?=
 =?utf-8?B?eGE2U1dRMGc3S3dpaW9MRHJFcUF2TnBSdHdGaXZmNGdWTnZvQWZ2UDBHeFF6?=
 =?utf-8?B?K1JOZEw3WFhLN0FiL3hBeXd4QlJQZ05MY2xQU3VteWVsYnBuMWRvOUI2OG01?=
 =?utf-8?B?OHBjVEpVY0xkZDZTSlJGa1l4QzZNUUE3bEtZVDFWK29mR05odlUrWmxNQlN5?=
 =?utf-8?B?VUowQ0R2M3RETFp4RmxFRm9xSFBTWXI5L09HQVFUa1pjMFRVZlpndGwwcitX?=
 =?utf-8?B?S3VneExtSnNZYkhKMG41ZE0vd2xhOGFwcVNkb0E3bkFnbUlJdVo3dklBNDJi?=
 =?utf-8?B?SXJMdWlURE04QnVKWEtuQUNhOXJycGFjZ0EzOVEyM1gva1ZSWVFoVWIzY1Mw?=
 =?utf-8?B?YUVDeXZmci95eDhpNWY1LzF3eGFDNWJjdUJmTzJhMVRoenNjKzV2Z2h2ZXUx?=
 =?utf-8?B?NlV4SFhXc1VuTE0yMm81T2x6bnRSby91RXFsMFNwbFZTT0ozai9sWWtLY0RF?=
 =?utf-8?B?ektsS1RIMnd5bldRTFpUTExFSW9xUkZJa1lNWkowTkxFamFoSlJibEFVcTl5?=
 =?utf-8?B?SWxTdHI3QTJ3VUR0YU1uTVdNQmtDcU5QZEJiQkxabGJuZEZSa0JWZVEyZ3kr?=
 =?utf-8?B?SVprV0I2WlpuTjhvcmZTMXMrU1dURU5JZVRRTmF6ZUxyMWdPRzJlZHVsVGQ1?=
 =?utf-8?B?bm9kU3RGd09EQ3F3TTNMOEZNSGVJY3pOL21tOHdlUzFxakwzUmJ4aElZRHRx?=
 =?utf-8?B?aUdxKzVYTXFKajdQUkhrV0h3NzFZMmpoUTUrTkhseGVRN2VVMFRVWkF3cStt?=
 =?utf-8?B?cGhJUFJUSXJ3VW05L1pSRlprTXhBRGMwVExsb0RMZVg5RDVVOWkzMm5KUTdQ?=
 =?utf-8?B?OHNubGFzZ0lXWmJJS2RYbkJpQnFKSXlOeml0YURqUTNWcjJ0YjJSY2xHQkor?=
 =?utf-8?B?d3pGSEpCd2VCSFUzRUhFc29oWFlSODNrWjRBK0wvQUhvUEpyN2N0Z2F6b0NB?=
 =?utf-8?B?WmF4cTJoL2pSbVhRYUtFKzRKNmJNdFFHMnp2WWtoeUZoSFhCRFdIbWFqNnpN?=
 =?utf-8?B?cGxqY29Sc0U1U1hOTDA5NktCYXFBR0NPcjF4b2xEbzYvSDM2aWZhdElxNWoz?=
 =?utf-8?B?ckpGU3hXS3ZMYkwycHVZeWpOOHRNYVNnRzhLRURCSGhKUWdFaHp3bW1CcFA4?=
 =?utf-8?B?cDJhSTNFUjdHeVRzbGx6SU5qWllPM01CWmM4YXcxdGVqdTZmVDVPMFJ2dmpi?=
 =?utf-8?B?bEx4L0V6NGhsSjZHR1BGTDROS1EyTDBGbjlKZU1pYmxKdmFPa1dTUmM1bW9l?=
 =?utf-8?B?MEhPdUZkWU55dW5vVjduSnVxeW40OXpKaEtEakVXQjFEWHhNNzdyWGRDNFo2?=
 =?utf-8?B?RlhBYnNCdDdIanFiZW1qVmRBeUYwMlNYcHdOSmYzK1VWQ21kRFNtVjlJQXIr?=
 =?utf-8?B?WUVnS09sZjFEZ0ZEWmFsLy9tZE9hYzNsWWxnalVqVlIzR2pxV1VyZlRpQ1l5?=
 =?utf-8?B?NStDRHdKd3hIRCtEMHpxQTdtT2c0RVVXNVM5OFFJbjJpSVRWbmg5dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9e081c-a010-4247-4d8b-08de499d6b36
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 01:22:49.3928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJoLYbTiq3eNZuFBqZ8KUxpnCaKLd/SunjeNd/ndNbv5hTo9/v3qcGQRJOp/i3XK9gdifVf66JwfxESc5IQdIO/XY64uPRPE9r4ja2Dp2rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5181

On 01/01/2026 10:56 pm, Marek Marczykowski-Górecki wrote:
> Hi,
>
> I've got yet another report[1] of device failing because (I assume) the
> drivers reads MSI/MSI-X values (thinking it sees values actually set in
> the HW) and then pass them to the device via some alternative means.

Ath11k is known broken in this regard.  It doesn't even work on native
systems.  (It only works in Linux by dropping to a single interrupt and
tying it to CPU 0).

But, my understand is that this is specific to Ath11k and not to do with
IMS.

> IIUC this is what IMS does.

Not really.  IMS moves the MSI-X table out of a BAR and into host memory.

It was a short-sighted design which is very hard for native to use and
impossible for virt to use.

AIUI, IMS has been abandoned as a technology, so I think we can simply
ignore it.

~Andrew

