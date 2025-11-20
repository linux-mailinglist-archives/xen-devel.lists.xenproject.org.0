Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300DFC73999
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:02:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166831.1493258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Q8-0000DH-R8; Thu, 20 Nov 2025 11:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166831.1493258; Thu, 20 Nov 2025 11:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Q8-0000B6-NI; Thu, 20 Nov 2025 11:01:48 +0000
Received: by outflank-mailman (input) for mailman id 1166831;
 Thu, 20 Nov 2025 11:01:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM2Q6-00009T-Q3
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:01:46 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cb0fcf3-c600-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 12:01:44 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB7723.namprd03.prod.outlook.com (2603:10b6:610:23c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 11:01:40 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 11:01:39 +0000
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
X-Inumbo-ID: 4cb0fcf3-c600-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9CEM/azyOw+qAlg8dQ6chtUhrp8UL5l3AnbKAWCkk28PnGNWlQPtIJfVbS4SlBy3TEfVy/wIIL62I02ddNufOzs/S+opdWSf+V5kgIDSSBCu3nCA8OHV6XGTtz0BNZClmNzhjGCw5q3LwgEvaOoPieKeHNyn5kfu53Y0SQhpjzLSCkB1O6lajWMQJyVs97ahYnq1gzRpCYpQzHxjWc4yBE+i+Fo8XuA+eG3MIUYLeWtA+osxsEnu6ORZMmHTjf35JsEPZaht3bJ7HEZQYnhT+/YMET5RHYjLommG4NEwqf6BVyGEr3b/xRY2eXKIK3g1+ooUx5HXvI21Fw+z0esTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8U+VBh4pERobnJvTuByqG4B4pFfkMK052GaaIaUlOo=;
 b=c8fmNZwXfS8dx9gkYxT4/vNWNjzErxToIV8edumG9VzNZZYRsqqORHz1LS8/6vQPm5bhg7RgpTK0CULeIu26Em/o3C70WohLsztaTaZuDL6569xMoZ9KOq7Vc7Uw1qXSAJAaaIdTusbBjC9T0gGV5J8EMqTRbJJcoRG4CaA0TKQqWltQpdyjSmuO16Z3prMfwn1i44yfia7jgbcOHmFv/XVRgCPcAMpbzB1XCVoOMXzKc7ChveGH2+8k17Nk0Xj5vWiiUG1QDikY2O9gYuSt1E1feQwLW6OXhwJCz9Lr4O60eZq8jIpnBs8ixeMVA5z+GULGwJYzbIqPorCtV5EdmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8U+VBh4pERobnJvTuByqG4B4pFfkMK052GaaIaUlOo=;
 b=x/aqKJmA2Z8pL2K0EPweEt1pHV5t+llX0yrK0Pno/q/W0yB6Ii/NjctPbiJMadI8EutFhuQkZTLIW89Fv1k48vmNG5uR6V0M8D+2eNm+vkno3yFJhJ6mojAcxnoxPnWbOJ4joZzBeOzpMVV4z2tfMlp5/i1cDjmO543YGx4wWGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <943e462f-d948-4f72-8d4c-626febca5b32@citrix.com>
Date: Thu, 20 Nov 2025 11:01:36 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/guest: move allocation of Xen upcall vector to
 init code
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
 <5ccf9000-9847-40de-838e-cb181633b098@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <5ccf9000-9847-40de-838e-cb181633b098@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0670.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c984e8-b5d8-4903-9e9d-08de28242e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3VTUmdta0gvSnJENDR6U296aEdXUDMxVnZqR3d1WmhFdUx6VHNvY0l4aWpL?=
 =?utf-8?B?NUY3S0wvWSthQ1BKbEpWenJ1RTRSTVRVZUNQdHZ2SkJIbDgxR2ttdExKTndL?=
 =?utf-8?B?b0xnUW4zMzZOcmtDaFBpaVd0ZVNxN2hlM29tWmlNWXd0Szd2M3dWeHdCKzI4?=
 =?utf-8?B?MCs1WU8zYWwzOTZoTC9KV1JOUEx1ZWZGV0pEb0hnOUx3bytqK0FKcjE5YjAr?=
 =?utf-8?B?SUt6Smwvb2ZlZ2VWVmtzYjNNOXpQeW01TU02RWpRUzYxMHdNaGdwRkcwYTlM?=
 =?utf-8?B?UDJ4UFlpdyt0N1R4Qy9iYzVsbTJCOENCTGxmMWZmY2dyOWQyUE9DVHg5OVcw?=
 =?utf-8?B?M1M3VmZxdWZlMGhtWkpQbkVqVk9LR2pyVnIxbzNzejYrYjRpelJ5c1RxV0hJ?=
 =?utf-8?B?TXlDenBkdzNGOGlGTjBDM3FKeEJoUUYwQy9zM2FHTDRLdWxTZHlzbkd0cWsw?=
 =?utf-8?B?Mnh5dXVXcXJ0TkF0cGZ4dEFNc0xPTTdERmZwQXVjUzFHWlg2MWd2QnpVYTNY?=
 =?utf-8?B?R01YdldkWWVtREErWC94Zy9wNlEyYXhpbnQ0YnFSTnRSMWt5aTVhTUw4MlZQ?=
 =?utf-8?B?US9OV2lOMnVXSHJqRFAyNXZycnlIaWlCdDgwVVZkVFFVZHlrSU1xRkNHemFT?=
 =?utf-8?B?aks1RUtDcS9BM2t6K2FiTDNzQW9lcTFheTY4S2I1NUtIeU9qTHZScmVpbk5U?=
 =?utf-8?B?WXhSV1Y4Wnh6Wm5laHU1SHluTnhkY1dBN3BlWW5KWHRubll6M3d1c1dwRDMv?=
 =?utf-8?B?WkRMMUR5Sm13OHBpUHZnVUQzNUM2emorcURmQmpIdkllQ1JCWmd3K0I0SnA5?=
 =?utf-8?B?NHRPMXFCbjI2NTVkQU1INVVaTGpzUy9kQ1Y0bGVIQkU4bjBhMnVyN3hHM1ZW?=
 =?utf-8?B?RkNHQ1FDRUNjcHBZQ3RCbG5GNE8wQnZmWXNGU3pINnY2ckMwSEE0My9DdXpG?=
 =?utf-8?B?alp1TERmdGdtc2FLNlIxYm12dlFJSkxYM29tUytBdzR4KzdLM0ZWVkNWYkFV?=
 =?utf-8?B?SEZKcGhWQWdBLzdWZ09iZWlUVUlNd05XRStiNGsxNDBMSkpQb3NPcy9jbk5s?=
 =?utf-8?B?dGhyUVdhbWJVbU90R3hRNUhWbVhOOEtoVUpudHFIekhIQjAwd1VOOFB2dEZh?=
 =?utf-8?B?ZGJwMjVsUE1IVUhHazRudXJrUmk1Q3VUejVEckxHczM3RUd4T1lSTVViNDNm?=
 =?utf-8?B?bHRFZmd5YkZTMGZkc1czTnFkSGZFeWxDVFQ1UG5YYXhmb1V5YjdQdVFDY0Y5?=
 =?utf-8?B?WUFZQWFZN2pMMmVDWW9jNFhBU05uYTAzUWU5NVpYZDQ5QnJHemJrZjhzOGhH?=
 =?utf-8?B?ZTZwU1RJWVhmU1dBeGNHNGtLU0lMYlhUWVEyeHNJYXBkMmF4TGpRQ3ZDT1I4?=
 =?utf-8?B?a1ZnZkpqYUlrUU43YXJuZFB3YUxrN3BrdDdUeEt2VGdCMnBzV1BDY1BreDFH?=
 =?utf-8?B?RDczQzRjVk93SkZYNERtYUN6OHhHRmRvZGNpL2trM1g0REZRWGtmSUdyc3Vj?=
 =?utf-8?B?WXcrSEU2bVFBYytRc3VZYUl0aE5wWmR5YzY1TDUybzcrRWNDTTRwK1VPUnVP?=
 =?utf-8?B?YkJmc01IaHloQTFLMjMyTGVFWlBwcUtjbVNLYXlHYVB6MVpkYVRzTGRCdWdD?=
 =?utf-8?B?WG0ybGk5Tmp3bEVrWWZ4LytmMjZyMnZ3UmkwU3BzSjY3b1QwdnpBQzFXQVBi?=
 =?utf-8?B?d0xEck1xcUtzbDZRN2pNZ21mekF2RUhrdVJCZldiMEFZVFRxK1NWSEhHbDlu?=
 =?utf-8?B?UXVDTURzTTdoVUUxWEIwQlNyTVVUbTY5c3hiMk5JSFdqcHpJaWVXZGxQdUJt?=
 =?utf-8?B?RGZFWVdoUTc0UWl1dHU4Lzk4bzVQWjhLQ2R2NWlDYVN1d2ZTUEJTRlNNZmNB?=
 =?utf-8?B?N2RNWlhZWXErNlJEanlNQXE0QWJ0RGZEblhlbVRlOWhhUE5XV0VuaHdON0dC?=
 =?utf-8?Q?kNMJC2JulwmmLbHg1QDf2la5XLT98d/q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzRVREl3SFNDeFJoQW9ldk9ndFM0c2VZZElNRVlpYWhkOXdDeGlKQkMweE5G?=
 =?utf-8?B?MTQrbzgxUmRhcmhaOXJDdjlTWGJJOVFXY1Bhb25yOXRqZ29RcFJJcnFqVVpp?=
 =?utf-8?B?YmpKMEUzMHRQcEQ4alQwZytraXgvd2FRRWVGUUFHcEwrUVo1V3laVW91Y2Y4?=
 =?utf-8?B?NTFIMjdlNmZsOWQ5VmJ0ZC9RRjlHS2lndjlucWIzZ2lXRmplUFB0Zmx1ZEZX?=
 =?utf-8?B?NUdNbDdEenBvTDArWEZ3aGlOZ0g1WjBpT0VrTXJLaCszb3ZJbXRjKzlTZHN0?=
 =?utf-8?B?Uk1kV01VYjBZQ3luS0ZYRDRRN0RHZWRxYm9ibmY3S1hUNTZHSnF2TldnMkw2?=
 =?utf-8?B?RXFzMjBEVXJVQk00enBpS0xZTlVMNzU1bzRzOFFwR3FOVlY3SU9QWlVXYlk3?=
 =?utf-8?B?eUtGK2V5NzVHTE5DMEJRZGE2T2xnL0lHcDBZYWZUZFFWSjdPTnNKaFJ3aFlh?=
 =?utf-8?B?MDlOdG45aFhuQ2FpcldQenY5V2pOUWc3TnBIUjlNSmVkRGlTMVpwZ3B5OFdB?=
 =?utf-8?B?dFRSZ1lTUnZuN0pSREE5TUtmV2hHZGJ2bm9QNVlYKzdPcnZ6MThvUHhVcXB6?=
 =?utf-8?B?dXdmeTQrSlptemNtdU1vWkVLUFhjZ29xT3dYR1YzcTFxeExXTDV6dVIwOWRS?=
 =?utf-8?B?T00xOHdRV0F0dXpFenF1d0NWTW9Ua2hjeTdSbk5uK3lnU3JHU05PRXpqNkxp?=
 =?utf-8?B?WllvaGxqZklzOHdSaFdkdWpnUGR5bzR4c2dPUXZFUnNVRkRhYlN4SzRGaXBW?=
 =?utf-8?B?cDZ0WTBvUHcrbzRybkZSTkRjakxkdENiWHZ5Z3FRYUlJNWZuK0g5TGhZZlJD?=
 =?utf-8?B?ai9KZjNLbm1Gam1la2dVTktUcVM0TVROUmVjY1lkSmVFYlVlcnZ6a3E0c21n?=
 =?utf-8?B?V1FvdkFKVm1Tb0tkRUZkUDNzQTRub1ZSQ3BIU0NVTWU2ZDJWZ2s4b3N5eTV3?=
 =?utf-8?B?TXVlL3BhQUNWaFFSa2w0QW5RWDlJZm1NODh2QVMrWVJaT215UWRaQlBVVmdB?=
 =?utf-8?B?NkEvUXplN2ZNbGd5MUxrYWlHbktDSlgvYUNxc21xNUgvMzlxdWpKT2hwTUNt?=
 =?utf-8?B?V294R05SV1U2OGZLZFNSeGI2WXFKd1FtcjlCMCt2azBWMjRxbVBrZnFLWjNQ?=
 =?utf-8?B?aG5rbVFxSHN1S05qU3B2RkhVNEo3ZlJaNDdiSmgwbmpiL0NwVkJHV0hVNmdj?=
 =?utf-8?B?RzZxSFhUR2VLMHpHaXdRTnY1emVWRThJWGg0SXg1SmZoMTNxMjgvZVdCbzRB?=
 =?utf-8?B?K1hDOTcvRVJrM1pBeW5TZUtxWWg1eE8vckNpK0x1TVhoL1NPdEhxdnlOYXpk?=
 =?utf-8?B?bHBSLzVJckxnTWZhWStSNDFXbitma1kyOXVDR3crSUNwQS8rQzhaeVlqSWl1?=
 =?utf-8?B?ZVhqa3paWkZOcFV6a0xQL2l2TW9QWnlGbHh6R3JreXoyV1Y3MVcrbm5HMDNh?=
 =?utf-8?B?MklEa2hIZktUVjQwbFZ6bDREZTNob3l6alVlaEZSYysxemZ1QjZ6cVZna2tj?=
 =?utf-8?B?NmdXQVRrVzNzenNQZHZoMTV3ekhHZmNMVGROYm0xTElXcHpLS1pYTksrY3Vi?=
 =?utf-8?B?ekZacVgrL3V3bm5rbDh2Mk94clgzZVY4UGpsNmtOYkovVXJERXpkSEhIRUcx?=
 =?utf-8?B?L0VCVTdNbnhOdDBSNjJsTlpaK2hxT2lNVzYwbGd2VVR5NkREWk9ZOHh3RVQ4?=
 =?utf-8?B?Z1RYZm9hVm9Id0dLQ0VOU0pVYllnV2pvT2NvWkJaVVA0amIxMjRpb0VpNVBX?=
 =?utf-8?B?RXJCOUwyK1VISHE5ZmNwV1B5eTB3RTJ0YzhBS1RTREVoTWg1VkFVSVZlcnQx?=
 =?utf-8?B?MkhtempTMGx4MU9rdlo3WEszeldabi9BdU4vTFRwU2wzN0xtaVUwMDFiQmhQ?=
 =?utf-8?B?VzNXRWxncGUxeUx1bTJjc05FYjN5d2Y1ZHIxaWRJUG5nZnVSZjduZEM1d0FP?=
 =?utf-8?B?NnZFZ3VlcHg3UlZLVXUzNzdtQkViWHp1c1lhVlFHQmtPY05UcWd1RXZVMU54?=
 =?utf-8?B?SXp0ZFAvVE8rc2ozUldNTUdhU2lLQ1h0ZldyMHdpQW9Mcm5NME51UjlIeW13?=
 =?utf-8?B?Y1l5aEdvL3hWRXIvKzVDRnZVcWxraTVpc3lJa3JVdGJjVFFvbzF2Z2RlVzVZ?=
 =?utf-8?B?UzJiV210S09Db3FpQlNHSk04VkZPaEdob2E0VTVxcVlDSjhrcXdUbmo5YzNq?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c984e8-b5d8-4903-9e9d-08de28242e38
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 11:01:39.4332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLa6sWFocS92+1eIruYxv4A7bhFwf2pum2hHIoTnb4xvYugjhtgmsB0U1JoifEnXkjC2HkjZy1qozaF5oJUep3IOZdKxmYLLPpjFMbEwda4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7723

On 19/11/2025 10:50 am, Jan Beulich wrote:
> There's no need to do this every time init_evtchn() is called. Just do it
> once when setting up CPU0. Drop the assertion as well, as
> alloc_hipriority_vector() (called by alloc_direct_apic_vector()) uses more
> restrictive BUG_ON() anyway. Then evtchn_upcall_vector can also validly
> become ro-after-init, just that it needs to move out of init_evtchn().
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/guest/xen/xen.c
> +++ b/xen/arch/x86/guest/xen/xen.c
> @@ -233,16 +233,12 @@ static void cf_check xen_evtchn_upcall(v
>      ack_APIC_irq();
>  }
>  
> +static uint8_t __ro_after_init evtchn_upcall_vector;
> +
>  static int init_evtchn(void)
>  {
> -    static uint8_t evtchn_upcall_vector;
>      int rc;
>  
> -    if ( !evtchn_upcall_vector )
> -        alloc_direct_apic_vector(&evtchn_upcall_vector, xen_evtchn_upcall);
> -
> -    ASSERT(evtchn_upcall_vector);
> -
>      rc = xen_hypercall_set_evtchn_upcall_vector(this_cpu(vcpu_id),
>                                                  evtchn_upcall_vector);
>      if ( rc )
> @@ -293,6 +289,8 @@ static void __init cf_check setup(void)
>                 XEN_LEGACY_MAX_VCPUS);
>      }
>  
> +    alloc_direct_apic_vector(&evtchn_upcall_vector, xen_evtchn_upcall);
> +
>      BUG_ON(init_evtchn());
>  }
>  
>

This patch is fine, but it would be nicer to split init_evtchn() into
bsp_init_evtchn() and percpu_init_evtchn().

Just out of context in init_evtchn(), there's a check for CPU0 that also
ought to move into bsp_init_evtchn() (and therefore into __init), at
which point the percpu simplifies to a single hypercall, and we keep
subsystem specifics out of setup().

~Andrew

