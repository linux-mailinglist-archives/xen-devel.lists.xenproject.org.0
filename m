Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F89665D5C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 15:11:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475392.737091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbp1-00034M-Lf; Wed, 11 Jan 2023 14:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475392.737091; Wed, 11 Jan 2023 14:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbp1-00031Q-Ib; Wed, 11 Jan 2023 14:11:19 +0000
Received: by outflank-mailman (input) for mailman id 475392;
 Wed, 11 Jan 2023 14:11:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFbp0-00031K-1T
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 14:11:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2053.outbound.protection.outlook.com [40.107.8.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d02b5c98-91b9-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 15:11:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7350.eurprd04.prod.outlook.com (2603:10a6:10:1a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 14:11:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 14:11:13 +0000
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
X-Inumbo-ID: d02b5c98-91b9-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpR0656fUdv6dGf4ZoB6GU9xbwXNK2jko6PvMOU43awudUlJYNAbAUhwBQp6JVcumw3vUrl/P3aOib8aMaXcKcT1sH+xcSQZiO+aggu+8dZtchBZ8FxUXoRcudvWC1YwYKaDqNKTRFI6pZA/hirXt0futXBfmuBsyLqvXwFQagiuhQ4cW17YDD237ZhyBIWfEzLPlyZGf9X93PvSAE8YUACm/ACcA36RMCSoyR2sAEmpCaA7ALIMmfW71FpEsx59aqz1xmvor1Cdy0V4amF8uXHEWXbZ0CUi968OIDnL8Tw6a4ssXP+9pEWM7IOFQTFbm3LHxLn8VD6hLor6lsXKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=samdL1jok7HXUArxo1y7qppuzAQBeGFzLeWWO6WNryw=;
 b=YeRUFxWIM8T3f8f898L0IfCTpTz0xbl1CKjrS8RJ0vWunLnsXXmFud4QM3dWMYRtSAkDAR1BSshenZI6fqxthVtDqkWLB25EwVAmlxnsAox6bR6uuzBNUZ3Af1Qjk+HAF861VNvybk80m9Sd1rxXdQqjXKcEyHKfOe1iIDtRuz6vFCph6gbWxaBklrM0nQojPS9oG3M5LcXvW75gt0sT9DqK0raYlLCiATcApufCFodgSUMWePax8IQwbfHcQr1/+OwhHeAYzMC2Ae5ouFQBufhhnrZOH3cN4nRR/16SS8S2e12hDHNJuRrzu1pbw079fp1ZddaNoYLUDJRyilydCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=samdL1jok7HXUArxo1y7qppuzAQBeGFzLeWWO6WNryw=;
 b=qy3pTWyXdi8str371y7RgG/kAz7QYHMSATdajMZ1LN5OVZo5xxgYfrnW1UVuyJhpReB6t+xP3fv/qnzkc5h7nuRWZQ4EEgDe9ZL3GxHoaVsc68hYJKK6KZCR0S35rNZBg/ffN4vfeXul0+bFXA+8j2qI6Gn6p/p2vbid2EiEm5AF1ghuqauk4T9a7h1BpS62v4aVruVZJSzC8AKxUXmQReOvp/NPRXLsLh4Xm+Qy+U5jW6JiATq7P2Pm5I3Gh4ObVXGEiWOZ3D6pzgVEHmt1dCPMSeX4TB/sW/FRVGbFxsz958q4EfB1dTcqcLY876bYdkBL5bZai2fIA/PIOvzRqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52429554-1559-6bae-f3d9-d32152e763b4@suse.com>
Date: Wed, 11 Jan 2023 15:11:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 14/22] x86/domain_page: remove the fast paths when mfn is
 not in the directmap
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-15-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-15-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: ffee38c1-f8e3-41fa-d850-08daf3ddb2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oWJG2y0e1e5wnw9wzE9jhnk8PGd/pYfq+rowrPesldxeli8SoPRf5/Aesssr5khIUTjreYkLkBoHmI9YxJ2YV4PFEDrC40uPtwX4fHuccZLl19p/9TNO1GRH1VjSMyLkTmjGFbYwh5mHgPmXnk+KM9cH4IfnlvCw7oS7BDhxxHUVwomtb7QK9LRjogCohA3ldsutgNSZsbLOlCJkAsiv16bUUDB1VisD6n8LinRhzP6vvCCj1KKB1TPBq7VKVVZUakTmyI/tpVWg2TY4ROlABWockz63HqULBKYYqNOCqKsINxuwgo9IJn5Gia55L4FOkZ+EP5umpHD6UU6OHmLywWp0gNOpX5B6GgI+XdO9e/nvY7ShcJAKgzCCSIWlz6QjQNWFpWJcAMcRUU2UYUeNkhMjANW0lyn2Ew18vM12MHAMVpSbbHPM+PH9AHnvJAPil/Jr3/Z+LZbahxXcviztnVkC0W/7jbLOVvtUPWPVamm1kqOwOaEexVBz0Dyj6GP51wNmZ2aUAhs0FT3FCt/sDxUL9NfD3l5eMEw4jVzyz3ZESpkOIeNJ5txlGwERILAr5n82J4Yq/M65vobIlFkhJfFx082Q9IjQHyGqs3HXICmYWlDbmYu0kI8NtIXzMFzISpErmvm/Ztfuis2GEBFl1f9jKVUj6t5WaHsA0ChBlet2oElz5PX7GNyLG+gwT2pvXz9O/wbQc+Ul0qgHQud76TiSNLaiyWhYqdiGVtcjJ2w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199015)(478600001)(53546011)(6506007)(6486002)(31686004)(186003)(6512007)(66476007)(66556008)(86362001)(31696002)(66946007)(316002)(54906003)(2616005)(6916009)(4326008)(8676002)(2906002)(41300700001)(38100700002)(8936002)(5660300002)(26005)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2Q1Zmd3VUdIR3JPY2t0Vm8xUFBtOFArL0RvQnY3U2hua3VnMXBMY0o1OVho?=
 =?utf-8?B?OXhyUHNEWGlwMkoxdE91SklwN1NWMmJ4RlUrNmJKT05Sc29ndzZUdU9iSVlH?=
 =?utf-8?B?V2dTd1dyUG4xb2toeWduaTBOSkthVU5tazU5WVFmcDNKbXNSdktSNHZycEZi?=
 =?utf-8?B?Z2NaUUNsSlVBcXRtZm1jS2wxbzZseU5mRXBDUlI1M1pmNXZNb1UwRFU2Mi83?=
 =?utf-8?B?YStmWnNxOFc3Nkw4NitpbTBGemt0M21WdjgzaWYycXByMERMU0tNZkhBMGdy?=
 =?utf-8?B?ZmRiMHduSkJyUUdFQ28xMUtTMFp6TG05OVFlTTJPNnora0lNaytFVjkvVng4?=
 =?utf-8?B?YW5DN0E3U3E1SmlycURJSXZ0NEpxQm1nZEpoMnhmeTAyVEtxait4aURrVjRW?=
 =?utf-8?B?TTBsN0V5N1dCMnJuZ3Q1N1prb1g1K2FhTTFYRU10KysvR2FXRmJ2cDhmekU5?=
 =?utf-8?B?WEJDeVBQNTNwdlJsQjVqdjJ6ejdGd2VyZXNjd0p6anlBbXhvNmNqc09yU0hT?=
 =?utf-8?B?Mm0vMXBxaXdzeDZLenlTSEszOFBGRWlaelVDL24rZnR0T0ZsdU1iWVJERXlx?=
 =?utf-8?B?U09FVjlHMEd4dloyNGx6YmFpN1BHR1UzN0gvNjBYZGQ2WmM3d21wZDJIb1BJ?=
 =?utf-8?B?QmQ3ODR0RG1NempVa2JBNFNHSlovb1VOVTRpcFdwcTlLY09ZUkc1dzYwdUxV?=
 =?utf-8?B?MzRqTDRhN2VlSTRPR0JKSWhnY2RoUDRjNnlENnc4d2FrREJXQXZjeWxhQXhF?=
 =?utf-8?B?aGFac2VGelE5ZndjOVpkVVM3VjZFOUhMVlFRRjI1ZjBORnJBdmtSM3FzUDdX?=
 =?utf-8?B?MlhEN1lrUFlTa1kxczQ1M3lwWThDRWFGTHpRdThaQndVYTBCMTBCVXdCOUJE?=
 =?utf-8?B?aEh1NjlOWURoOGZ6Rzc5YmZKN090Y3pLVkw3L3h2R0ZSUUJhWC95R2tlbUh4?=
 =?utf-8?B?UzQ3RU1oRXhTNVlkL2oyYzhxcnE4NkJOa1FndWdKMVB6aVVua2pQTkdGS25V?=
 =?utf-8?B?ZStVcG5kT1ZUdHFuTzVFTVFZV3FVKzhwaFM0TGhTZzhVa2ovQ2g2THhWdFVV?=
 =?utf-8?B?QlV6RzV4WitPbVdjVGt3WUN4NUh0MURibG9ZZ1V6MXZwL3pSZUwzZ0JiTDV3?=
 =?utf-8?B?TXNySGNpQVhaUHJoUnhWNmxXbjdjUTRtTWJTQmxDOHFLM0pSSVNzTmFvWjRj?=
 =?utf-8?B?czQweFVyb2paSXFrMU1ZUUJxVGV3REhxUndQc0xCVXRMemhEYXJlaWxhWWNw?=
 =?utf-8?B?NVZaMVl2bFRFYyt5Qng2UmhEaDdlcklHanI3QnZLR1FXTDcvQ2ROTEdSU09K?=
 =?utf-8?B?VGNRc1I4SmF6SC8wWitUQzh6MWRvL1ZoUVNwcURDZXFPMWxkYUhXQ3RIUW5O?=
 =?utf-8?B?U2N4eitJajV0Y3J0VlgxZzE3MGxVVElIL1BaaGRQb0ZSODNoYUtvMUJmdDhl?=
 =?utf-8?B?dFgwMlRramxrcmtlM0pUcDBEZkJSaVlsZGdOL3Z2U0F1d3M4a2dKZnlFdlNY?=
 =?utf-8?B?U292dE1iUm1lazREVEhWZ1k3L1l6Y0xxOGMzVWhxZUF4ZzdETDR3QXlSKzU0?=
 =?utf-8?B?cjhBU3I2eFFTRVRDTFdoSlB4ajNKdzllU0x5Q2tYQ2NvN3RpWDlRVXBDOW9Y?=
 =?utf-8?B?OFhTVDQ5YXR3dWlDOTJFUFVPbTJmdjVucHZrR01XakxlRERmMWNmQjZEOE9o?=
 =?utf-8?B?dVVDc1J0dFF3UCtFMWdlS3lDTWRCZ1kveVhVVEgzWVRDRk8yd2N0L2N2QWxa?=
 =?utf-8?B?OEpHMlRLU2c1OE5ZU1VwQ2JUTkpoVnJDZ2F5UGgxSUpmTnlYckZ2dEpFbC9p?=
 =?utf-8?B?OTk5VU05SzAvQ05YUVU0ajd5V0pIWUErZ05KNWNLbVNjUlJkRG9CQWw1MTBj?=
 =?utf-8?B?b0M4Vm4wdzNaQ216d2REUHRzMHIydzVUVlFrZ2F6bms3NWVodmV5U1c1azZO?=
 =?utf-8?B?VHRYSnVrQkRMNFQwRFl5M3lGK0dNVnpoM1BKeGtCdGxpaVpPZlEvV29YWFEw?=
 =?utf-8?B?b2lsRmJzQWJqUldUWGZYc1NhQTVKL3lmUDJGM2o4ZzRTQmRtV2o4MmR3QW40?=
 =?utf-8?B?cFpQSTNQTzYzOFFQSFJvdEw0M2t3Q3JPUm9rVHNlVUducDdpNmN4Q0Y1NzBq?=
 =?utf-8?Q?mJwuaRm2MDaDT4jdHX3uFjN9A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffee38c1-f8e3-41fa-d850-08daf3ddb2bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 14:11:13.9482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vv4Jj+eVfRj1i4ZlZjKNS2weRiCxFH8dKmOS9FC/VfsVLEXB0ZTN0icO99iJyRyCmqcQHtE/8WkjPlYvpPM64Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7350

On 16.12.2022 12:48, Julien Grall wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> When mfn is not in direct map, never use mfn_to_virt for any mappings.
> 
> We replace mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) with
> arch_mfns_in_direct_map(mfn, 1) because these two are equivalent. The
> extra comparison in arch_mfns_in_direct_map() looks different but because
> DIRECTMAP_VIRT_END is always higher, it does not make any difference.
> 
> Lastly, domain_page_map_to_mfn() needs to gain to a special case for
> the PMAP.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

This looks plausible, but cannot really be fully judged upon before the
mapcache_current_vcpu() aspects pointed out earlier have been sorted.
As to using pmap - assuming you've done an audit and the number of
simultaneous mappings that can be in use can be proven to not exceed
the number of slots available, can you please say so in the description?
I have to admit though that I'm wary - this isn't a per-CPU number of
slots aiui, but a global one. But then you also have a BUG_ON() there
restricting the use to early boot. The reasoning for this is also
missing (and might address my concern).

Jan

