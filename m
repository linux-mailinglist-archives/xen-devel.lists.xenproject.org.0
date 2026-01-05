Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E35FCF4B02
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 17:30:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195630.1513560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnTU-00037o-4V; Mon, 05 Jan 2026 16:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195630.1513560; Mon, 05 Jan 2026 16:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnTU-00036D-1D; Mon, 05 Jan 2026 16:30:32 +0000
Received: by outflank-mailman (input) for mailman id 1195630;
 Mon, 05 Jan 2026 16:30:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtAc=7K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vcnTT-000367-De
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 16:30:31 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8f08d5b-ea53-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 17:30:30 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5802.namprd03.prod.outlook.com (2603:10b6:806:f9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 16:30:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 16:30:25 +0000
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
X-Inumbo-ID: d8f08d5b-ea53-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6GM7R+Q3RHtFDRPTeOrKUu2GAbNQhyNEstjAKh+31papcrjfOUO1hjCStbO39AcX0e2rs2UZ5mJ1cx2MtHnmSHzU5h2B9Pfar4mDIW74Mg2qOrh+0QEAstfokilal4iC8XC4CJ6jP12yK1HK8d1d89/5XE+SmQ00uC/uQgYYec/IhhnX0GAu+cPqXX9F0QSEHFH6eFj0Qq5ziT2jeznRp6KCzeXgJz3v9wlUD7rcxhjAwc1VXoNkHQ006JT645/sw2uqEHndeXk616vULqgta+XiIdISkrzPPRHX9ph36Wtg5itTAgFv5x5N7VuWRkfFGo1voEXHXaMIxefRsKQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNMfRUWDIRwvlSqEoaathDbUKK0R3FDWIkAAM7ol/hU=;
 b=Wsi9/OKkgsvYYK6Dvvd+SWpdVmzSjL3bqfBEzYKGFdRlippIBXofQSYFbTuWswTxQXNW0naZn2p26OX6ReLnwjuMhRZUr6sSANn1A9t4LFeFMH7ZoTe6TyPVcDb2+CmRGrxJRcMqQB8eloMHZkEl6Xx0saK/HztqKnb+toulAuZnvGJJmha/cv6VfaE/AVz3KweV16/yYR2J197GfNHNComJ7v6GV+dC/yZihwsCLy6XNO5fb31BoddyPe0+x1Nyl+mO6orks5nFLZb3iP0T5jrTF5geBEugH3ZXTNLfm/E3W6546BmgBmmFct2o8F1nSBznplq3O+00Y1QYgOppig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNMfRUWDIRwvlSqEoaathDbUKK0R3FDWIkAAM7ol/hU=;
 b=FS8kv9JpzZldC3ANHsP/syNeXuoTuTtXdtuK16Kbk/TDqjqHRaEfST4KxvLOXjC2OWX0QXcIDjAb4wnAbY9B9csybJyD7NkVVPZdeveQjoSH3OGq1LFUGM116/2Y607/o+QFpQH4U99/kthf6fRgRJmxmTJpooaDW8sdezyAFHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <20a27b92-f356-4905-8a3f-b76eb53dcd5e@citrix.com>
Date: Mon, 5 Jan 2026 16:30:21 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 0/2] x86emul: use vpath uniformly in harnesses
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4c2a53b1-7133-4900-8bc8-26fc97aa1702@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <4c2a53b1-7133-4900-8bc8-26fc97aa1702@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::30) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a81d05-b5ef-49f1-7d7f-08de4c77bad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGpjV2dNZEVJS3dOVXV4SHNkVUxscUZQMWJQaUFGZHJteVF6RUxnbVNkTkFH?=
 =?utf-8?B?YVc2N1NsVFlPNWJZVk42d3JBVGJSSmRMTW9kMmcva1BYbW9wbnNjcllaS2sx?=
 =?utf-8?B?WmpUREh2aGprWE5iOWRoV0R6bXU1cW91bU1CYkVmUnkxanZIN0tFTXUreWRx?=
 =?utf-8?B?Wm51cnlQc090ZmVXcHZweXp0TkdBQUtkcmNOR3U4dUI0dUVDQ1AxUCtwcHJD?=
 =?utf-8?B?VkhtZnQxckh2QzFZVjg3OTZ2WFRXNkFYNWVLVk83SEE0dmtkVmFuWEdUemxy?=
 =?utf-8?B?WkhjQ2M2Ly94azFvQ0NGdU0rdmJpLy92SWpoMlozMVNYTzFaRnVMUHRRaS9I?=
 =?utf-8?B?QzFTNnBaVjhMMXVqSFB0ajV2ODJOT1V1bEM4UUxyKzFFcHdvY2dWcmhxVVhh?=
 =?utf-8?B?cHZZemdscVRCSUptdUNuaVlPajBkbjlTdkMrajBmWUV3RVhlMHZZMEJ3ckEx?=
 =?utf-8?B?MnFIN24rS2kvTTFPc0NwZEUyU0k0UlZMSFdnSE9MekNQWENocENUM2x5QkZi?=
 =?utf-8?B?cDVLSmZIb3FZQ0FoKzBhMWszNHRNL3plT1FDQ3o3V3ZRVWNHVVVRYkNPanJk?=
 =?utf-8?B?STQwaHAzZFp1UFJWNThRWkJhYTMvWkNUMmZmRFVSQUo2SGJJRUxPT2V3MTJz?=
 =?utf-8?B?QVF4WExmY29YQTlyOFhSVGYzWUhZUGQrUGRGdm9BUWVGamEvR0VoeC9MdzEz?=
 =?utf-8?B?SWJpWjk3U29xdUNSZ0h3RTgwb2N1UUtZdk1QVkNVY3Q0dUJrZXAxcWg0NHE3?=
 =?utf-8?B?TVpvQ0J2Y3E0ZENhR3A0VVpDMHZyanVNSExPUzBpZmZ5NFY4dlVibldqYTc1?=
 =?utf-8?B?bHBEQ005U3ZmVjNSK1VtQkRUdXpSb29tdnF0K1pXMFkxRVp1Z2N4OExhWk9p?=
 =?utf-8?B?djFobWJkcVRzSlZybWdWZ0pwTCtpaEZhUEZDYUJ4eGdnRXNMU3BOc2VYa2xI?=
 =?utf-8?B?eDlWa1ZUd2xjcDNQTHZsM1NkWjdXN3pXQmZoMGcwQWtRZmJzbzhRVWtkSUps?=
 =?utf-8?B?THF4U3FNWjFJQVV0UHNuQjBlRFZBd2xiMzFCSStLdGIwMFQraXFmN1VNK2sr?=
 =?utf-8?B?WHFMM0p1bmxUSTdhSVNBRkhDTFBYb0VaU2hTaWU1bkV0TTFzamZxOGQrbXEr?=
 =?utf-8?B?RENRVnhPUVdlY2Y5b3ppSU14MENwR3haQjJjcHNhSkpzNktWYzh5Q1o1Q0Na?=
 =?utf-8?B?QjhMWnZVbmtZU2haa0hCeDBTd2g1cVAxTHd4YnhGQmJtS05PcEM5cE4zVjBY?=
 =?utf-8?B?bUpDM2NxWDN6QWZRYm1TT09NMVRFWk1yYU83YkNuNmNUVEtTV2RHL0ZwYmxV?=
 =?utf-8?B?SmtLTVJSc042Kzh3b1p6NmVtek9Ba1owRWNkcXcvQVZwMEtFREV2ajNtaFJx?=
 =?utf-8?B?ZUdPMU9YNTZKb05wVDhOdERNeU9SMS9EMithMmNKbU1WWmY1TU40bHByMUh1?=
 =?utf-8?B?Q3VzUFNRU3pIQU1LaWk4ZHRubmJFSDVUM0pRenJrRWJET09USjE1YUxmS3JU?=
 =?utf-8?B?amZWQ3RUck1PTEE0SjZRamxDS01FbkdXUnNnNUtjVmx1c2xxZ0h1ZXBRMkJj?=
 =?utf-8?B?VlI4OFFBb3VPSklOSXVWMG9TL2V4ODIzWlRMUVkxTnJKV2tiaWk1WENFdWFk?=
 =?utf-8?B?Y0g1Skx2cGtlT1h6bS82cHR1aERCOWtwRUZyRkVMTlMyem9sMXpiSnNCNzMx?=
 =?utf-8?B?NElMbHY3UURZblBSMk15N0lETzg3Z3FNdm9rZ1VETWthSDM0TEVka3VscGNK?=
 =?utf-8?B?WW1QYmdNUVFPWENOZFhUY1p5UVlmUnc4enQxYVBJVVNNNERwY0RhRzRveERF?=
 =?utf-8?B?WmJXRnNnTEliRVN6RWNVZlZPZEp6d2xzVWZkcHlOMlBEcG5Tdjl2cFZaSzRt?=
 =?utf-8?B?U2JlQ3p1bUlrVk1JNU4wUjdEL3VPdEl3c0pDSUNHVU1mOFRlNy93QnZFeUlV?=
 =?utf-8?Q?GJ6DogZSFgm0YyIMFTx1K0Pcs2BRFhKP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnlheGhLMEZzSGlweEFFU3k4bGNsNlpDc0pTbnR2MjM4bFIzRUI2dW53Vnd0?=
 =?utf-8?B?TUFOUENWMEFRcHpIWkRqUGk2dlRWdGZGUmhpV2ZHZ2JsaWp2WXh1WTB4V2hF?=
 =?utf-8?B?OUNtU3VTeCs1VGRobm1YWVA2Uk9HQkhhTzQzdHZWL0JReHAvZUdJMjNDNVB4?=
 =?utf-8?B?dGVlVjk5YWlVbElwU3p0aVUvQVVDZ1l4WmVibmJXcXdiSkVXdTdMVm1QUlFi?=
 =?utf-8?B?aisxVmRuTHpTRWoxN3o3TWhFL3JraGxyN2lVeFhldWpROE81aFZ4USt3bWg0?=
 =?utf-8?B?cHZBM09jNEFoZHIzeGJMbWxLS0dhOGFVME95cGU2K1ZWajE5dVhLbFZSOUNX?=
 =?utf-8?B?cXV2bEFpb1NYS3Yvc2NLak5TTHF1QW1zTHRJQXJnOE0rQzRnY0gxQVRnTGQ5?=
 =?utf-8?B?L2VZQlE0WW5ONEQ3OTMrcytmT3FXUUdBdm9SemY3eHF3ckxvVDdHSjl0cW5s?=
 =?utf-8?B?Q1hydEgvakhiNWphR3NUNFJ5YlBIRk9mekJBUFJZYVZFTEM5UDdibjJTekpQ?=
 =?utf-8?B?VStQYTR5WHAwRkpPWUlEbWszUWoxT3RhdjVPNjUwd1FMRWV0SU1PeDlQUnN2?=
 =?utf-8?B?RExVeFdDZUdJNTIzQ0VXWXc5b3VBSkM1Y2NsSk5qTjVod2NlTzFicmVpelhM?=
 =?utf-8?B?TEg5S1lCdU9zNjlHL092UlY4K1dxRmpBOTArbk1DcTlJMGg2clNGQjd3ekVS?=
 =?utf-8?B?OXphWkc2V0tKK2xCLzFaVjVwOUdHVGlJSEljbWwzbE5OcE1GNFFqRlF1ZTNm?=
 =?utf-8?B?SmJlSnZDeGRVNUNnb2ZtN1F4dkFBTGV6MDBuMUFRdkVFZlZNYzRMVlFZQmVI?=
 =?utf-8?B?UGE1bkxjWk5OMlhFM05NcUtEdEF6STYyMkZWYzhHSkZtdGtwNTdtclFMbGNw?=
 =?utf-8?B?SGRsaHJZWVN4NHphZzhIT3F5Y3VCOE1CS1loYW94YlFwVDV2dGZSMTlOa1N0?=
 =?utf-8?B?d010azNuN05hU2RaNFNiZGJwaXJXbCtiQXprbTBnMS9ybE4rUGRWcXFLd2pX?=
 =?utf-8?B?MnVqd2V0OXpTd0JMLzhFOWhXUHNtY2VvaElBUU00K0hzUFdINHJIUWRTRGVO?=
 =?utf-8?B?c0ZHaWZsRi9ZRXljWmF6OU5tRHdxU0RXeHhjZTR3ZkRKV0lvM1dOQkVsVk9i?=
 =?utf-8?B?Sk1kemRJZGJJYXlDcnV5VFhvUVcyY1R5YXFDOVgvbFRIMkxqNEtQMEllOXc4?=
 =?utf-8?B?ZW5Qb1lMWStLT1JTTXJPcDcyRW5WRUJncHBTcVlUNXllcmhtUWlYZWROYlNL?=
 =?utf-8?B?d01aWHZBZWc2aDlRMzdDVndGd2xTWkhuU3dvVDcya0UxdGhaeGoybUNqYnBW?=
 =?utf-8?B?bGYvNm1paE5OYnJPVitDQWFRWHU5SXdHcG1USTFWK1piQlgzMW9kNU9pZXhX?=
 =?utf-8?B?ODJDREI4ZU9yRXh0KytMSDFkNVB4V05SMUR3aVRWUHZYQXhnWmswWHNBVU8v?=
 =?utf-8?B?d2dLVjR3TGQ4WllhcmFsbVNNWk1LeHlLa3pOeC94TDI3WUI3L0pReGxRdnZi?=
 =?utf-8?B?bEhTaU5tRGxmbFFGUXcvN2pMc2t2eVQwdFJLNVIvamtkTTc2c2lyVklqWm1o?=
 =?utf-8?B?b1hRRmcwMUJDLzNiY0tOWDFSZVRzcW5BRFRhVi9KcHpsQU1UcStxTldYRldj?=
 =?utf-8?B?dFlTYXQ2dXJyYldHTjErdDM1YlJ5WW1NWXNDZUhRdUcvanhheU11T1BzcnBu?=
 =?utf-8?B?S3FHZ24renRpYUk3Qm1zWGZvZXNZZWRVRnRjcU9qUE1HUU5UajIrdmlUcVhu?=
 =?utf-8?B?KysxZzl6QW5FNjhmLzhOWlZUOVgrSFNwR05BbjREbm9Ta1ZNZE9NZFBEeTdl?=
 =?utf-8?B?VCtKSHpkSmJrT3lmLzdXNkp4TGJnZ20xVndVZEJRTzN5cDRQcUpSaExFQmpB?=
 =?utf-8?B?cXUzRytMN3kzRlJHREFzM3IvZDByOUFKVDdmMXF2YjVVRGwyZHFRR1h0NHpE?=
 =?utf-8?B?TGpIc0xNY2NJakFOZ0RSSkRUekVjUmF6L3pXaXY1U1ljdnpVTDh3TXdVQnF3?=
 =?utf-8?B?REtQUmR1WHNjaEw2dmNCZWp3ckxyTVVOYWlzbUM1T2o3M3RHUGZkNmdReFlQ?=
 =?utf-8?B?cUxZQmR2WGtTSVl2TmNqT0Jxd0xzeWF3YU14eUY4bDFGbHo2U1JtK1RJSmNN?=
 =?utf-8?B?YVhDREVxOGQ3Z0RPVEd4Q2xRdGtBUkZBOENXNmhNYnpyQ0QwTVVXMG43aTBk?=
 =?utf-8?B?VFRIaXZBUXFvZCtSUEd0dGN6aTVpN3hIakFyZmRSR094c2pzeFMyT2NCdUpB?=
 =?utf-8?B?bS9XK3BFWmhpVHVPZFhwTU55WFBYbXdHNjRNS0tCWmFaOXlSQ0Y5V1Q5SUZG?=
 =?utf-8?B?R1dJa1pHZVFiUHc2MzJwSm5lc09tNkU3SnJ0a1RiaFJwRnh5VE1xQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a81d05-b5ef-49f1-7d7f-08de4c77bad2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 16:30:25.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTqYUbJ37kJughMPVD9JRDINWEPjPXGQ+KjKI6TQoJmXAI3ynoAx2FlCbm/V25M/DhH25m94RdH4XCxrLrbROTFOR+SkDwLcJsytP5zKQHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5802

On 18/12/2025 10:58 am, Jan Beulich wrote:
> While seemingly independent, the latter really depends on the former, or else
> the fuzzing harness build's behavior would be dependent upon the test harness
> having been built (and hence x86_emulate/ there being absent / present,
> offering source files [as symlinks] which really should be taken from the xen/
> subtree).
>
> 1: test: use vpath uniformly for access to code living elsewhere
> 2: fuzz: use vpath uniformly for access to code living elsewhere

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

