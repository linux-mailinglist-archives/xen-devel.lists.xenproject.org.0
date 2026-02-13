Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAirHWxSj2kMQQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:33:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC97F138270
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:33:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231412.1536634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw6s-0005lk-U4; Fri, 13 Feb 2026 16:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231412.1536634; Fri, 13 Feb 2026 16:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw6s-0005jF-RP; Fri, 13 Feb 2026 16:33:38 +0000
Received: by outflank-mailman (input) for mailman id 1231412;
 Fri, 13 Feb 2026 16:33:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqw6r-0005j8-Ai
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:33:37 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd93bfcd-08f9-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 17:33:35 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA3PR03MB7396.namprd03.prod.outlook.com (2603:10b6:806:39a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 16:33:31 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 16:33:31 +0000
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
X-Inumbo-ID: bd93bfcd-08f9-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lF3gymsVmJWTV2bbRY1xLxLksCckMSng+lKEuN7DGQZw//QKnvCLrGqJbfes9v4acyhyk7uNrkTrEWgeB8b6rww9+3UT9nGXuIwrllT8uSZEPzJHCuHK12obSB5uXTp6Vt54t4bgDchq5Yu04zlnPcqLPPL/T5lz7qUcIlU1k/3JvxUBxNV1R/5P7s5FqDwPQMryAvyrbYURTXn7KTy2PYgkY46YaVyktK3X+PZb19QCjzYwUSThX0cdEvQpHsfJjsqP2zFcl+XX+N5miDwkxt5K0X9d5iAu59belCAzkiPf+n+VqfWdQ+/xlEWE9w/QYkXmmb0t4+LZ3Lzapwoxlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqm1//Ni5dovdXJ2JqxsMrEse5eljym6mkA8zl2x1tU=;
 b=MZDXB3+Ggh+/WPPb3yFr12ZGCsQWTCPKBbNyrouuD9j0PtSR1Vy2BHCaUK0QQxHeHcEmgwjdsNwioNtPlrXJ25f3J2/MLx4ETsgLyGpHMYNe1emhCj2sCjxRARHt1K2DmMA8Mmn6JnTIAMEGjaOXD8FTF12CdcdT1D/N/oXyjf+VDfTIcQnvSguBFlL7LK5JlE8hjeObIJCHrwu94blptyUhO8NRkmCUIeeDN7dhMjq3dE8yMMXVRF4ACPUUSVZUOjLhr/M5LOCSv8Yke+HB6uBbd343U6r7347N/O8oGIoX8LZyGy3bvmSwgFKypzaze9vxV2K49pM5V3h+AZRFxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqm1//Ni5dovdXJ2JqxsMrEse5eljym6mkA8zl2x1tU=;
 b=mipOmtlmrnegsnGnvAtnbbcfu4iYD6SCGDBdavz2ytxFLH8vRiQyF7J8FcLkQ/6KUVrTfLQpFPsQj8gOL6w10lrWs0NWE/HMOBrZZs/Wu5Bmpjzjz2WCSNPURVUUaQZXDwcITkQG/OSV/v9QbvoI/yFr7ZHmvg2QIWZV0IHkG2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Feb 2026 17:33:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] x86: Make hvm_enabled a constant unless both PV and
 HVM are both compiled
Message-ID: <aY9SV1PeqNqiPWlx@Mac.lan>
References: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
 <20260213133732.132326-2-alejandro.garciavallejo@amd.com>
 <aY80qJVIZOjjqBOS@Mac.lan>
 <1e4e20cb-71fd-4ed3-888b-7ca8b17175a5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e4e20cb-71fd-4ed3-888b-7ca8b17175a5@citrix.com>
X-ClientProxiedBy: MR1P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::25) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA3PR03MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 767288b2-73c5-4468-1f88-08de6b1d9f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2d2Y0hhWHZ1ZUwxU01WWW9SWEdISVZVRXB6R0djLzA2NGdYMEdIQTFGd3Bk?=
 =?utf-8?B?ckNyOGJqNWx6eDV5NUZDVnNtWGx6SG9BR3dNM3BjQjVBVUhCem93d3RTZjNP?=
 =?utf-8?B?VVR0TTN4TFB3cXVOVnBIbDdqMVBlTGlmTStzVXpCUlRrMjJwbklnUFdKMWl4?=
 =?utf-8?B?T25RUlVJcUZaT05ZSW83R2JRWXFVYWZsdHl2MmJjY2s0R0hGR3QyUDg5R1lN?=
 =?utf-8?B?dDZwQWR2NE5Lc1RMNlNnaGFvZ2lhYUlWQU9xU3NwQ3JWbHBKaVFGT1hKZ2dI?=
 =?utf-8?B?YktnazF3TjJRdk14V3RiTGUrTGVETmpIU3kvaFdZZVYwbm9JODdKQnB4a0ZP?=
 =?utf-8?B?WXpSTTlDM28xYzZMdGk0VGdaNk5NbjBoeG0vNnBTWmcyTTVlaXh2OE1KeUlD?=
 =?utf-8?B?Y21PV3pXSXRKYlFhQ01yYzFiUWU1L0Q5MjNTb2N0amZnMGNxMnNnd3Zxbisw?=
 =?utf-8?B?VTNhVmdjQlUzUkswSWdJcHRDd0JYUVNSUWlrTTRrRFdkWVpLT2dwM0JGRzVJ?=
 =?utf-8?B?MHUwekptNFZLQkZ0aGlrWkNjaXMzZ3ZSa2xZaVZyTC9yTTlaU2JuUUlCcHQ3?=
 =?utf-8?B?TXg2Z0JHRmlacnZmcXlyNkRpcDRxay9rdi9ZR2pDWitRU2dRdlZOZ09zZ09W?=
 =?utf-8?B?SlVrNnRwTSs2ZmxWVDgydENRS1hpRDdBUEF4bXFwS2R3cGtzWDR6UDBmWUth?=
 =?utf-8?B?TWdiU0IycnoySUFKT0M5SGFsQ0VkcWFGazNVejJrRGJVRlArTXlxaDRFSVo4?=
 =?utf-8?B?bTlzZ1lkUmIrdXVWbkxxak5nbmdvdmJSNVNQc2JQU1grSnkxWlNmUHZiU1pF?=
 =?utf-8?B?VDdUL2VYdm5EaUxxWFlMQ28yNGcwWmE5MFVFRE84ejc1NC8vWWphRS8zcC9M?=
 =?utf-8?B?b0I3bHVUOU0rYlZoWDhRZTJXWDF1Lzk2SFYzYXhIb1luc2VMSmsyYWdZdlFF?=
 =?utf-8?B?MjJZSUltSGlJNGVKd1p4cUl1MkhGQkpHMVlWRE5SNGVwL1UxTmJUWkREaVV2?=
 =?utf-8?B?YUlhdFU0TU4rZ29pekdPcC9wZU9uY1NKekFPL29SOUlaZzRXaFBuRld3SXVw?=
 =?utf-8?B?c1V6VmNnMXkvRW9tOUFlV2x6RlFaQThFSTZQci9pc2F0K0VDVlRxczBsbi9m?=
 =?utf-8?B?QTUrVDI3NTNJZFc1NmlMakpQY3FCbVBRakd3TjRUQVU3ZWVSZmRsdTNnT2lL?=
 =?utf-8?B?U252bk5kSzFrWXlFZHNaVTFTbmxudCtMeURIUGlGNHEvNDN4MFVZVVVLTVZa?=
 =?utf-8?B?UVlyR0tUU0JKSWpCRGZnNktkblA2RUNpTWZvQjZNYkoxTm1xWTdXWUlCZUpV?=
 =?utf-8?B?dzYxVkJqYWtEVXVaMmNoSWVVUnBxaFFMZDVtcGRmMWpaUzVTRzBwWENacnBn?=
 =?utf-8?B?UytzcjArMVJOUVRnYTVIWGgrbjNMcStSSHdtZHVWbFQvejFrQ1BwVU53Smx4?=
 =?utf-8?B?R2lYVHRuQkkzWmRGcFVBQ0l6OGJ4aWNFY0tJNkFJVXg4QTZ0RmN4NlBoMXVp?=
 =?utf-8?B?NTFQRjcvY29LZU1JODVReFNLbGQxRm55ZlBOSTc1Zy92TDVZL0xQZkFuVzlN?=
 =?utf-8?B?a0hqU05uZjJ1YjZyZUtDZkdha0hXYTRaTjEyVjhuK0UxU1czR2YvN0g2UXli?=
 =?utf-8?B?Y21Eb3JyYnJRdndESmZjY2JxUHdJWTRuUHJ1bVNGSDZTaXFITDVLd3k2Vm5F?=
 =?utf-8?B?TTl5TTlhMmU3Y0dJRlB4ZFNyOWd6SjhUcm1BRklNNi9sN0JQcGFMaTBPVVFU?=
 =?utf-8?B?WnlxZUdlNTF1cHpQcEwwVHhDYmozY1p4L3BqNWRQR05OeUZLYlpJTGdZWlcy?=
 =?utf-8?B?OGh4NUN6aldsV1JveUtqcCt2dmQ2YnYwc2tGOFk5TjJRdzNRbkt0c3RYSHV1?=
 =?utf-8?B?aUROV2JLYUpNSWc3YUtoRVhRZVBZV284aUkvYjUwbkhKVURwRkVjNysxUU5L?=
 =?utf-8?B?N2dlWENwTFFCdG1ZLzBsbUdsbG5WejcyR3NrWG0rb3dodHFoTGMxRmpmeHMr?=
 =?utf-8?B?cTNNU1c3VkM0bTFkTzJ6MHlQeVlMY2EzSHM2RHllUFdNdGx1RGMxNjdSQndO?=
 =?utf-8?B?TEpOVFdxYTk3b1psNi9vQnIySHNMUjlSTkE2T2NMUlp2TzVEelZjcVFaZTNF?=
 =?utf-8?Q?HVKQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXFqN2lmMzJSemdDWlhHaFl1NGRsK0t0bG9mS2hoancvUEV6dkNUNVJIeHdP?=
 =?utf-8?B?clhmNERVQ3loYlNBcVp6WTNyY2s4U3k2YUtCZ0s1RGdVSFhjQStGNVBLRENr?=
 =?utf-8?B?OEpMS25GS3ZaanR1R2NMTk9LeFBmRlkxbXp1MXY1TkgyOWJpVTVkcm5jK3kx?=
 =?utf-8?B?MXZJU3dBSnF4d05IazlpUUtBVEZvbk9LV3k5RG1VN1AwY3BlVnR4NzNuT3ho?=
 =?utf-8?B?dWx2S3FRWmNzenpyMlMzRlRPUnI0MEpFenBKZ3ZUazQwNDVJYldlVTE1cURw?=
 =?utf-8?B?WDVwMmRBUmJubEYxUmxxMXRnWE9WTEthSHo1R2dnaHVaQ1VnUTBlbThrckE3?=
 =?utf-8?B?S2djWllxdlcveVpQWFBJdXVuNGdCWU5WcFl4R0l3Z2k0cWp1bEJsU3hpcXJ4?=
 =?utf-8?B?Z211OEVBTkNUK2QxaWhVV1lteC9ORzBybURKZUY4ZnF4ZTI0VTI0U2twRmRm?=
 =?utf-8?B?R0d2ZzlxV2l0UlQ5Z0c0bFF5TDdGNDlmdWI4NHlHOWRMTzBDK2dnMkdEelAr?=
 =?utf-8?B?d1BIY3FYQkd1V2sxK1BQYjdpU0FSRDV1WVVOWG9QTWhQbWVkQ3pOWlEzVXUr?=
 =?utf-8?B?V1laMkpCWDZHbFpleEdSNHl5U20rMmhlWGFvZjl5MW0wUGlPdDh6L2VOOE5Y?=
 =?utf-8?B?dGR4K1NudDRDcXpDNHNVN1FzWWh0ak9WdDRzZnh2QVZ1VUszK3VVbVIzbUQ3?=
 =?utf-8?B?YTRjOXB4RFZpVTR4OGgwS0dSSCtROTVCRVk5VDlxUDNqWDBzMUpHd2RJYWkv?=
 =?utf-8?B?cFYyYWJ6Z1N0ckJOUWtQQUxhOHQra1dyKytIV05UaDlOUENiekdCTDRzZDV4?=
 =?utf-8?B?MWROWkFicFFGMFREVzJXaVZpUmlESlJtdTVXUjdpYmRkOXBDdEpCdGlvVEpR?=
 =?utf-8?B?b2VqcnV5UW9NTUE4NHBqb0RGZm5iVmYrOUJIaVZMdlFRZkdmR3FFU0prNExn?=
 =?utf-8?B?YVh2MHgzckVXcVRSL000NWY1eUNXclVmQkJGejJPR0hSQWlUa2pSTXl4OXFj?=
 =?utf-8?B?Q3JGSTc1TjBrajJHc0lVSU52b0NiSmEvTlFLRDVGZjBpWXlmTWpZY2E4WHBr?=
 =?utf-8?B?T1EyMFE5eXJSMUhnNTB3L3BZR0F6dElNTDg0ck1XMzZoT3J6dmtZY3FXbWti?=
 =?utf-8?B?a2IzTmdlejZnd01HaUpuMEF6N1VoVkgwcEs1Qzk3cmtLbWNRRENpSlVIRnJ2?=
 =?utf-8?B?WHIyTUYyZ2syVWRZdTBDRHNKVlM0Z1VkUk9wRHhuSTFvZUV2UUVGakpiUTZJ?=
 =?utf-8?B?Z0FQU3o4aS9idkJoMHhOMWNYTkJxNjB3QVh3cGRlR242TjNDSWFjNlVTOEpX?=
 =?utf-8?B?NjFWS09udGt0UFBkMXFIbm40alVEODVjWnhUNmlwcUlDYUxhdmlzdWRiMlpy?=
 =?utf-8?B?QmJBdzkrdVhuR0l2OCtiL0NYdXpocnZUcm42dDlxa0xoeDdQMVg0eUprQlZB?=
 =?utf-8?B?dlFrYUs5NFRvL0lDNFhWQ2lKdTFieGc5YjM3MmV6c1ZBMHR4V2FLWVBvaDJt?=
 =?utf-8?B?RHdmQzNHbU1WaFpDTHZsZkV3V1Z4dVl2ZXJIWGtIR29GU2lWTlV5eXZjamdq?=
 =?utf-8?B?U0lmU1VsYkUySElUcUIvZy9lTmZXWW5scEk0OUVOR0I4YTk1elMxNEhRQ21a?=
 =?utf-8?B?UEg4SnpFVkM1RnQrZE9HdnEvdFhBcUtCZ2Zpc0ZkNGg0WmJkck5LNmhHVzZO?=
 =?utf-8?B?RUVtYXNlM09TaDBwVkd2a003em41WHVEeEtya3dCVElwaFhsSXhKc2RPMXh3?=
 =?utf-8?B?dFRGQ09mWjkyZGVRVVNpbGcyU3VkTGkvUlhRamhZRFNkZkErbFFHMStsTWNZ?=
 =?utf-8?B?Vk96Y2V1MjZpZ3NheFc1Zk9rUTFZTWxnelA1aEhpYW9GYWJ2ZFppdXA2OURz?=
 =?utf-8?B?V0pVMkgyRzI0NGs1TCs4cXBscjlZNWt0NVM5VkN6K2RqS1dZR3lVRWF0U2Yv?=
 =?utf-8?B?aktHcnJmeEhxUlRNcEpTVGl1Q1diaDRqQkQ4L1Q1eFBoak01dVM0TFp2TUV3?=
 =?utf-8?B?SXY3U0pWenVSbElrb1BzeHB5amFqWWw1b2ZDb2RXU1p6YUNqYjAzRWxHRTN0?=
 =?utf-8?B?RUJQUHN0cTdVWnlZSEd0SzErYVFEeUdoUXVSS3o2RXNzUWlUT0JXbGkvbFBu?=
 =?utf-8?B?RE95UzEveHpMSDNIc3paMFN5ZVU2Tmo5d1hsRFNtNmJOU2l6Q0pLK1RMUUhY?=
 =?utf-8?B?NFk2OWE3NnNLcDc3Qk9uTnNlVEZXTnJ3Rjc4OUpLSEVhV3ZhZzFGWEVDc0Q0?=
 =?utf-8?B?R2Z6VFRlSStDK0hSTy9Cb3UwS1FrQlJaNEtLM3lKcktlQmh1YzYwWTVhS1o3?=
 =?utf-8?B?Zm5HZU9CNzlxOXdwSXI1R1VhZkdRdFI0VHpudGR4VFF1eUZaRGEydz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767288b2-73c5-4468-1f88-08de6b1d9f8a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:33:31.0711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CinqHIh/01UAOAMeYO1A+LdKHkhz/o4pJS2121Ayr70+gNZ1HXcsShVgPU8Vn3gzi4RyPDLX54PrZdta/Hd6Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7396
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DC97F138270
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 04:01:25PM +0000, Andrew Cooper wrote:
> On 13/02/2026 2:26 pm, Roger Pau Monné wrote:
> > On Fri, Feb 13, 2026 at 02:37:29PM +0100, Alejandro Vallejo wrote:
> >> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> >> index 4d37a93c57..da56944e74 100644
> >> --- a/xen/arch/x86/hvm/hvm.c
> >> +++ b/xen/arch/x86/hvm/hvm.c
> >> @@ -173,9 +175,16 @@ static int __init cf_check hvm_enable(void)
> >>          svm_fill_funcs();
> >>  
> >>      if ( fns == NULL )
> >> +    {
> >> +        if ( !IS_ENABLED(CONFIG_PV) )
> >> +            panic("HVM support not detected and PV compiled-out\n");
> 
> As with Rogers feedback on the next patch, this wording isn't ideal. 
> How about:
> 
> "HVM support required but not available\n".
> 
> This is reachable for people who use cpuid=no-vmx,no-svm but they get to
> keep all the pieces and the documentation already has a general warning
> about this kind of stuff.

Hm, yes, I forgot to comment on this one.

> 
> >> +
> >>          return 0;
> >> +    }
> >>  
> >> +#ifdef CONFIG_PV
> > CONFIG_HVM I think?
> 
> No - CONFIG_PV is correct here, because we're inside an HVM-only file. 
> It's the only case where this variable exists for real.

Oh, I see.  Yes, those are the right guards, otherwise the variable is
hardcoded to IS_ENABLED(CONFIG_HVM).  Sorry, my bad.  It's a bit ugly
to have to do it with such ifdefs, but right now I don't see a better
way.

Thanks, Roger.

