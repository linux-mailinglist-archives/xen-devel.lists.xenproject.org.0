Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEVRFvF4mGlrJAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 16:08:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D94168BDC
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 16:08:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237240.1539622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtS7D-0003pM-L6; Fri, 20 Feb 2026 15:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237240.1539622; Fri, 20 Feb 2026 15:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtS7D-0003od-HN; Fri, 20 Feb 2026 15:08:23 +0000
Received: by outflank-mailman (input) for mailman id 1237240;
 Fri, 20 Feb 2026 15:08:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rFK=AY=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vtS7C-0003oX-7J
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 15:08:22 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe18af06-0e6d-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 16:08:21 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA3PR03MB7256.namprd03.prod.outlook.com (2603:10b6:806:300::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 15:08:17 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 15:08:16 +0000
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
X-Inumbo-ID: fe18af06-0e6d-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvpZkPzflkKVRfDR6P3JfD7MM/GHzyUJq2h69p5t2NpveRYnVGW+gvyyi1VJSkPvgWT1E5JRuEibtFwFULuauHt/Gv9TzTh+Q0f6CQWAP2Mh4O7ffaI/p/gHgwLOIaGz87lMXA5X3V/Kr3FrgNjjTAoOw6d+de6Gd1J1W6Ei14KHjdSJYLEqELl+CnGhVSWzymiEeD3dnQ4VunixSmkaN7feOZlwVvCyHqgRGnTr4Ps3w4Uukpnxya5LAv6lV6ZBpze11Uvnz80EIUDdT2whEPt+k0ey4WmtKdrXHSt8azIj86TeucB/9qhFhxTSj8BpYwQwp2VQ7NHYyO2uARbEQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mu5RkSTgtONRaYuGBUXlaO6R4hePM/OFbiP49FBow+Y=;
 b=CNwwiDEw4hs2jyIgh7hVdM1GLOsjEKj0uZUrFReXdYEke+aue5+MFvV7ZNhW4H21FbqqaFILJ5mxgWuYdQkFlrXp9tJl2TTAySJyCuVhpjuqYOkcFhZ+imM2CUm1NZDrTSrwALluxAjOdou4ZiM24qBGVQGxuw5hrIVX0G0s8+EdCGM0UCGdxh5M8ieZveUQy9uHMkOhxBm7Q0xgXGr4sdD+O0VaOzlX9DJv46oRR5VlJmJXG3BVxmRN0OVRRNRCSL6Avi4jyp+KeimwsOr0mKTt9+xs91M+SDO4WcQGkx3M8o4Pmrt/4/q1G2sb2MGXi/RfWPJDFhaZiljCqJo2sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mu5RkSTgtONRaYuGBUXlaO6R4hePM/OFbiP49FBow+Y=;
 b=y+LAY75C46ezdVQvYSLnVM/jEJxlfjlOPYiKUJtXcjtu1uDJNGW9/cy+Lal1unxk9HYL1msfiGvCY7IcMfRUeNal54tlTgb8Rciw6Vjt2Ac+kjN9x2e4rswjhdooaz7htI1BF7ZAm2JvURwWiaVdpVozzQZn40zcS4QEi1wwjF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c543d076-4ce5-4396-83cb-ba54c0bd2a12@citrix.com>
Date: Fri, 20 Feb 2026 15:08:13 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 08/12] x86/shadow: sh_rm_write_access_from_sl1p() is
 HVM-only
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
 <ce0dc192-7d42-fc71-2c68-2b67933c5912@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ce0dc192-7d42-fc71-2c68-2b67933c5912@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::6) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA3PR03MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: dc84cc74-9e56-4c28-d135-08de7091dfe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDJFZDBpczVMaWtGdUpJVFR3aVhyMDM4Z3JzVUFJMEhuT3dCY3A2RldZTlJG?=
 =?utf-8?B?UDgwTEtpM0V0WjNjbG12UC9wc1laYkI3RktiejEvQlZUTk5wa0oxaS9YZU1E?=
 =?utf-8?B?TkZwa2puTEJJUUplcGtqVFBCRmc4NGJpNW1LMFFveFNNOENWVEppWkY1b1dx?=
 =?utf-8?B?NlhCQlRLVXU1cjdaVkJ4cXQ1S0dkM3o4TDhwVWJZVTZOYkw5U20rZTFmcmk2?=
 =?utf-8?B?bnI0QXAyTVN1S3MvYmVSSkpnWTRRalo2a29ER0lnNDl3Tk1mWEFnUC9sRW1r?=
 =?utf-8?B?bngxYjlvU0lvTzl0OG5QVkN1ZUN4OWhCYkpsSGV4bHRlb1NmNWJuV3FKV2li?=
 =?utf-8?B?V3dzNXphZitlMll1amdqMkFDNXozM2lvUHZRZk9vaitUSCtSOGNWMkJqWXlI?=
 =?utf-8?B?TDlJVTJTMjE5MENCNllsb3ozTDFSMkpERkRnWGwrdTdXL3MrdHFYQ3JFUU1V?=
 =?utf-8?B?ellGS1RwRjR1bkhXdTZaZHgzME1vOHBwbE1oRGVtY1pYUWsrMzkrUlNwYTlv?=
 =?utf-8?B?eFVFaENTV1ExRUlaby9UUXFub3BHZkNOR3N6YldrcSsvZ2ZuY2NTajQrOEJM?=
 =?utf-8?B?ZFpoNnB0NUZqSHpGZ092eXpKSXZrL2RIeWUxZEdLV0RmTHpaUWg3R0x4RTZM?=
 =?utf-8?B?bkRscU5ZazNuRDIvTmlLUEpHcHp5N3RUdDNFeFJrTkJsbVhKUXhyRU9JSWpy?=
 =?utf-8?B?Q3BodU1nOEF2Q092aS9TQ3pPU1VNc0hvVTAvMmZTM2I4aGNSd28zbk14dEtJ?=
 =?utf-8?B?aDJQQ3luVkhUTFhpUlAwNmptZGZGTlBFeGpPaFRoeDUxRUJVVTBybkN0L2lz?=
 =?utf-8?B?SlQrSzg5dDdaaC9GL1VZQkJiMzIwbGZLZkp6MGM3NE5nM0w5cTFEL2FocFc5?=
 =?utf-8?B?cENtT3o3ZHJzZjE3UHpTWnBiSkxTUnpGRkcxTm5VZ1FBUW5RRjJiMGdpT0JN?=
 =?utf-8?B?TkZRcjBsVm54OElaVEVPOS9JbmJQY3JnaXY3Y3N3MkE5b2kvR0ZPckxKVkRa?=
 =?utf-8?B?S2pJa2VLRHk4cndBSi9jQ0ZpeThTeG8wQit3QUUxQkh4OVdLUkc4MmE4NlRX?=
 =?utf-8?B?VUYzWVByL3ZkZmJtZlB1MFMrMmdqN0R5WmlSTGI3S1RramNocWpQZ2dWc1dY?=
 =?utf-8?B?cHE2UTB1aEcvT2lzckxqaE9IWmJrcy9EbzV2OFNsNUhBc0o0bUE4VVR5ank3?=
 =?utf-8?B?cVVVaURiSWRTNklFclVhalRCdVR6cEJVYWlDTnY1UlNmWUIxVlJzUEtDZ3JD?=
 =?utf-8?B?UG9vTkhBSUJpN3kxZ3lXOGh6MHdvMmJEZkdnN0tGUVZJL2dWa3MvY1h6akdw?=
 =?utf-8?B?am96UElLYTl0TUU1UWp6UE41THgyZHNUQlM1RDZaMVphczF0TFpUY0U1eHRE?=
 =?utf-8?B?TUcvNEJFbE5YQnZIN050Q0MvZndnRmxzd3F6ZjVEaXdGN2lIMzhhTk1JTzhG?=
 =?utf-8?B?M1R6NVcrQlU2WW5OZmJFd3pHS3dSTGZYNFdGT1FaaFV4MkN5OFQ0TU1RNW9y?=
 =?utf-8?B?M2d3bFd0bjNzZURma3dVRTFQakNUVWwrOEorUFhpb1Y0NHI2ZzBlbTBCMWZs?=
 =?utf-8?B?RisrMWlpN2l1d3ZldTZvSzJuQTZ5STYxZ3BHSGhnUVlzSlh6cW1qa0V2cXdr?=
 =?utf-8?B?bldydnpUSndISFJTdVpBWTRVZDU3QXlWbjl1eWFKV3RVdC9pa3hHb3pHbVJt?=
 =?utf-8?B?a01DTU96Sm9LL2VkRFJQVWcyMlNpMUJEdFNzMEh2WHppRHlRbnpLVzFLdlhv?=
 =?utf-8?B?M08wWTdSK0cydUNrbVllMGY3eGFQNGJoK2ZVaGpQaEhQRlVGYW5FLzVmYTNM?=
 =?utf-8?B?V09XMlI2ekQxbDRlb09hbzVmU2U5cXVNUXlTZXJkRCtwWkl5b29oT3VrOTZ1?=
 =?utf-8?B?cnJwZG9zUWZaQThUWG84QzNmbklJeDY4MkUwQkxVNUNaZUVyMVpmeVRUZDBa?=
 =?utf-8?B?c205clMvY2NpQnZCM2Evam96dm5ONkVSVExiQlRMcmZqZlJCaUpCMW9WZHBG?=
 =?utf-8?B?U3lXZ1lBTVNpa0MyV3BveDFvMVR4eldzR09IeHFoYkJYbDZJOEVzUExiR0o2?=
 =?utf-8?B?b2RMZWtIT1MwaWU5akYwM2RCZUN3bUYzUHk4cGc4OG5uTjZxWVl2NFhvOVpH?=
 =?utf-8?Q?Pw1w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnBYUEU5endaK1Z3Yjd2RGlhc2dZU0RCbUYrMlRPdm13QTQ1R2RqU0xNRGdy?=
 =?utf-8?B?OTUwbmlhbkdSWFdRVW9HendhN0RmT3FsMW5pZGMwaWZYVDlCTkRvQkxaVkNz?=
 =?utf-8?B?a2lOLzRQUDhWM054ZlBhRmc2UnNEd01zTzdWWnJEdSt2bHBIUmRIL1ZCZHdT?=
 =?utf-8?B?WXhGWnc5TFUxR3JIb2c3ZWludHBuSnM5MWhPRGJZT2I2WnMvZXJNMmpaUzZy?=
 =?utf-8?B?T1gyeUxPWG5GbEM5d3FqRlFTbjM5MExJeXBjL2dJNEhQM2puV0pwQ2R6cXpu?=
 =?utf-8?B?ZGhKSUxGbFM5dUU4azlzM05KaFAzN20wbGpCNkVqdWUrdnBkajlOcGNFb3VL?=
 =?utf-8?B?dE1ZQ0xvVnVtMkErSjdTVDJMSGNNNHc4T2o0Y2Qra1Vja0pFYUFJaFVCWlBI?=
 =?utf-8?B?cmF5cnlJWG9rZlNZSTJUSytTaEIrT0dUQU1lT21kWC9MSFF5Qis3QjlFQTdG?=
 =?utf-8?B?clN5dzV3STRLYXFuN0JRaE1wbjFuZGF3Mk92NStMS2JMV1A0bXcrN2xHUm1K?=
 =?utf-8?B?R2NaVXo1WmxCRUUxQ2dlRitrTHFIRnduN3c5WWtYanpKcXV4dVlsQ1VMR09o?=
 =?utf-8?B?OS83R2Y1QUpBTEMxS2tXNmhHMkNFM1hmN2ZLdmcrZHdtS3gyM0N4cm1GeVFH?=
 =?utf-8?B?WUFFdG43RWpKaWFRdGg4VkJxTU1vWFRSR0RvQ0taQUttNjJ4YzJlU0svWXBh?=
 =?utf-8?B?UVJodDBBeU81Yk1CNndsWjR2bDBtc3o2L1VXaUxZNHcxS1g5WDJad3UrQzEw?=
 =?utf-8?B?NjBRVXVZUkJWdkNENVFJNHowRzFRRVhUREk4dlAyQlV3V1pvaWx3cHJDanhw?=
 =?utf-8?B?Vm1kbFZ2bFNLQnJrU0dDajY0QTlCa3pBVG5JVC9PODdxQTNESnlLZFVkRmcv?=
 =?utf-8?B?cXhlRmZLWUpjaVhrOVBHVnNDVWpOSXlYSXpJaWFPN0tFTzRXTkRoOGdPL2NE?=
 =?utf-8?B?bjVTeExzSW50WHFUZ0JmbzBLbHAvRDRMbHdEVHhrUnNqTVQ2cVZDalhib1ht?=
 =?utf-8?B?RnV6RW8rNnJBWHc5bk1kUXQxRHZvWit6T2RsbDlHbkluYzlEYVVtTmpBL1Nn?=
 =?utf-8?B?cjhmbUZOK1hnZGhiQXJNSTM3M2pLVEZhNTdOTHFvcXdNN0t2ZDhUS0ZRWTk5?=
 =?utf-8?B?bGJkR2sxSzhkQktDQUlwdGRnTXFUUEtDSlVmNWQ2WktvRHgrTTJrMnhoZ1Ru?=
 =?utf-8?B?Tk9oREc1Qm5qem9RYXBHT1c2djhrWTdUaWZkTlk4Mk8zT0REWms1S241SXIz?=
 =?utf-8?B?Ty9naVc1WHN0Z1dDOUZCYVQ3YnYzeCt2bDl4Tkc1OHRTUGFCbDE5K1UzOGE2?=
 =?utf-8?B?Q2c0V2tUditNa3BqaUttc0ovOElyMXRnRjRRS05RaXRDNURvWlZjYmFvbUFw?=
 =?utf-8?B?K2VVc2NwZFhmMk9TZkpla3JqK2Q4V2tGMmZJc0x1OXJRVm51ODV5NnNZUWpQ?=
 =?utf-8?B?MTRqUzVra3hUd1Ryb0pjMkhYUktURDVXK0t6YlhSa1hQNW0ya0NjSWJsb3Vn?=
 =?utf-8?B?TUJLNEIyV2thRWx2WEltYllPVVlMRXU3ampFV3Z6Y01ZdjR6bkxnVS8rQ1U1?=
 =?utf-8?B?Zng3VlJ4a2hHUUhwVnpLN3hNZ3BkWS96VzhhanVmSEs4TTQxZk91VG13eFFl?=
 =?utf-8?B?Nnl3OTd2YXB1N0Z3azVwWnEzaEpWbDhmUlpWZzB4T2Y3OUJYbEE2dkVJVG5i?=
 =?utf-8?B?MGNWVnlhZkcxcEZhNnlEVWVIdWkwQmd3S2RVTlZVVy92czJzQ3pOUUtXZ1pt?=
 =?utf-8?B?S20ySi96elNSaXZBc2cxTUVUNWZzM20yaDBxQkhXMkxCek80emJBVTA0UFNt?=
 =?utf-8?B?SEVYb2wwTTVFM1kvMWhJK3BtbCs2MDlxMzBjTFhBck5DaXZ4b1ZFWkIrN1cz?=
 =?utf-8?B?V0ozT0lZOFV0Z3h0ZnMzejM0S1F2MTZvUUJPU2pKS1ZqSzEwS3Vqd2huLy9Q?=
 =?utf-8?B?OVZLQzJlTG1vaWtGYnllSEhjSStlM2pJVG9kK2QrYzduWlRYZjl3c2MxU3BR?=
 =?utf-8?B?NUxoQ3VCQml5QitrOUJLd25jRHlXWGE0clVxbVpnM0VYUW5UYmhGYytOaG8y?=
 =?utf-8?B?bWc0enpIWmZhbVEzWndBTU8zQzhyU0ZXaC9nOWgzSjRxM0tPT2FITkpsOFJP?=
 =?utf-8?B?bWptUThpelFLRWZOUlp2Rm5rNkJMTi9CbUdBVmZ3MHBEdkZVNkNKZFJOWU9u?=
 =?utf-8?B?b3RVSTFNRkcxcWN0RUJ6NCtBYXpzeW5UbTRRT1pUM2pLazVOVENlWHkvaEtV?=
 =?utf-8?B?YmE4dDZpbFBOVEFCVGJtaTc3MHR2VzU1bENZTUlNL1VMYnBvNmNBSUhodzJG?=
 =?utf-8?B?RXRnQ0xsNkloR014Y1p1K2puQ2s1dytjK0M0TUZlMEgxVkd4RElIUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc84cc74-9e56-4c28-d135-08de7091dfe3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 15:08:16.3419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqpkedxKFlpE4PdNJi/rHF6niGN27RJ95wUS2bF4IYufMVvzWYS03rr1VE/iO5knGrvjzAUPbW/UvrE3Ur11J+RhKT61zwlGwTn5/aHEOUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7256
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:tim@xen.org,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C0D94168BDC
X-Rspamd-Action: no action

On 16/05/2023 8:41 am, Jan Beulich wrote:
> The function is used from (HVM-only) OOS code only - replace the
> respective #ifdef inside the function to make this more obvious. (Note
> that SHOPT_OUT_OF_SYNC won't be set when !HVM, so the #ifdef surrounding
> the function is already sufficient.)
>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew cooper <andrew.cooper3@citrix.com>

