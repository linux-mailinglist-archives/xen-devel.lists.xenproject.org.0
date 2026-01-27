Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NFKDH/AeGn6sgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:41:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F029504C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:41:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214750.1524994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjJc-0007N7-SR; Tue, 27 Jan 2026 13:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214750.1524994; Tue, 27 Jan 2026 13:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjJc-0007Lg-PY; Tue, 27 Jan 2026 13:41:08 +0000
Received: by outflank-mailman (input) for mailman id 1214750;
 Tue, 27 Jan 2026 13:41:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvRA=AA=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vkjJb-000780-PH
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 13:41:07 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d38d457c-fb85-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 14:41:05 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB7655.namprd03.prod.outlook.com (2603:10b6:8:1f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 13:41:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 13:41:01 +0000
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
X-Inumbo-ID: d38d457c-fb85-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lM6Qin7izs7C1av7EMsuO9v5HuD31VnE9umJGftPcg9i0ojNZ7oVvw7yb1mVw7+/PhkGSnL6hw9VJPakE9a3z621lDxQ3etc5SU0i8PCN+4hJtf0tioEFekMol60OT29LvN71GSlZTfyMd/0ONtEjxp7sUxs8AnHb6qDuWWApWYasqsMlcKx+fuBvSrNXlKwGCMq8aX7cwrKXWCi7SZECLsvLB/w+bjXjjGOpaxXh83NR8HaMD5V/GWeczLzuPEKDGisYKPVOyVmL83j0MNS9W9/1jXkKdhErFtdezPP1VqnBHOj1mmf3dO6ud2wt/Ig8TKTxCuBvCZGxJ1xb8BBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaGYI9vUVbUl6w20gDTaN24Ga25f72VI737q9fQIulg=;
 b=uyFDyVZoxgmCTBmkQ8NODoGlRAYJikv9kBEUKjQ9rpHOht+iTkQbmCIwRDaBkBCkfbn7p3/mVmBn/d4h0w/EC14InKjM4KzBy9T23qUwZucmrSLI27ENpMuLkseBD4+HmLubnCzEktHTUWQd+MaPq9R5khJsSJeL5pa0Vk2so5dYIzLwWncix8ZP0udKrdCbl0ro7VV4vSSOfIz9CPzBJl3Xyp5CMR0xVUah2anoqBll4Z/CDkRjO+bk5QlPYdkOT1oBmVy9ePu7YUWdN3SfXuW873fKpsqpE1SgH+5CP9DturXE5MmxWoCcwJhYovs61pUBS16RJM11lesy37E27w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaGYI9vUVbUl6w20gDTaN24Ga25f72VI737q9fQIulg=;
 b=UDYTdJLUhxNPh1XfUPCXMDqTAlLo99NuEl9e907odJMZQ5NN51byR9/T0L+Rx2McEYF/bij4qw5T/TggYNfU0BzB82g/QfcxzuCnaZ3rgxuuYwu434yTUFqJpGC9ulJTVjsK51h0tQU/4dYlGm+mfpxGIWrN08W/xUSUIIHjuBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b297df43-87ea-404a-b3ef-46f6f4937863@citrix.com>
Date: Tue, 27 Jan 2026 13:40:58 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/ucode: Adjust parse_ucode() to match other list
 handling
To: Jan Beulich <jbeulich@suse.com>
References: <20251215153245.2675388-1-andrew.cooper3@citrix.com>
 <b14362f4-aaa2-4ded-943f-4ad4a246f521@suse.com>
 <b6dc5f41-9504-44d2-ad17-72d0b20f1434@citrix.com>
 <2a661e47-78f1-4569-9ed9-b4c3e62af646@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <2a661e47-78f1-4569-9ed9-b4c3e62af646@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0035.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: f9cfad9a-0952-413b-2936-08de5da9b5c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVlZRXpiT1JnOWpOMFB2OFJrTThRS0ZEQ0dWYWZMUjJsK3ZGY0N5a0VjbkZX?=
 =?utf-8?B?WXdnTEh1ZGN0OWpvUWc4Z1JnWEhBU3JwNTNIZGI5WG5iR3VxM3Z4aUVENlJa?=
 =?utf-8?B?dDRJYlpsekVEclF0dWR6Wkp6SGE5dkE2N0pSR3VkNHhoTDVZOXIwWnRCV251?=
 =?utf-8?B?MWQvS1BsRVZmUEJuelRXU09PN3V3QTJmNitvODBRZnFXY2ZsZmpJYUU1TktT?=
 =?utf-8?B?R0Z2RTVUMitlVlI4azFraG9HZVl5WXJBNWwxREJ1SVQxN3ZRd2kyZ05hSS9t?=
 =?utf-8?B?RnFXekErZ0g1N0xFajZGdjJLbXNDaVBZZEdmYTdqNEtBbXJDTDJ2UjFRakg5?=
 =?utf-8?B?K2IrUnV3NVNiQis2Z01YM3RVbjhpQ3lrTTRXcEdhbjlWa0VGLy9qb1pxSDM4?=
 =?utf-8?B?cVcySkN3NUQ1djMvY0FhRFl2Y0Y2RmFQZUh4QTBOc1gvS2w5Y0R5SzEwODJn?=
 =?utf-8?B?SG9XNCtCeHlVQXNoMHNzYlZjbnZyWk83U2svTTZwdnhaaWIwR2dTeCtvYkdm?=
 =?utf-8?B?NnJhbi9WWEZPWStZSlVFTWtzaW9Sd3ZXaFYxUWR1VWpGZDJOV1I3Z1BjN3FM?=
 =?utf-8?B?K3ZubzJkYlZ3VDIrMmMxbi9mQ1F5c3lEbmtyNE8zQ3FJQVhTUFB5UjB4MEpV?=
 =?utf-8?B?eTYwclM4c3NWc2p6a1JsRy90WmZpZ28vZHg0dUhrcjhUNUZZTlQ5cU8rZU5y?=
 =?utf-8?B?NU1PQmdmN2NiRW9ZUUF2SlhrY243QmxmRmMvS05SeVhzNjErOWhudHJkQ1Ew?=
 =?utf-8?B?SUdFanRoRTlmOVVWTmdLQXU3UUx1OGk5bGlQSWNXZVM1Qkd2cTRpY2xVMThF?=
 =?utf-8?B?YWNvaDJ6VDF2L2h3dzhuS2svbFdJZnRJTUs3cnpNU0lNZEtpeDVxcmJ3b21q?=
 =?utf-8?B?U201Tzg4NmJIdlV5S2p1N2F0SXorOFBGV0ZGM0xFVXdYRldHc1hDRkQ5OE5D?=
 =?utf-8?B?Vjh0aCtnYkNZQmRYV2lFbTJLQ1kraXRzVDRzMEZkVlB5ejBqUS82WFViQnpj?=
 =?utf-8?B?cGNaUGxFUEFVZ21OdUswcXhzOVYxN1M4cGR0N05JbHJYb3BZdk14NEFBaXlO?=
 =?utf-8?B?WDZQYytTQ3NQcHJ5R1NjK0s4L1B5dlR6Ly80dGYzaG0wMlAzMklPUHdFaWhh?=
 =?utf-8?B?MzNmcEZjYnZNSEJMUUdQNmNYa2JuclZnNjFzQjFwK3hPOStqVCsxVVk1UlIw?=
 =?utf-8?B?NEg5NEJEU2F4Ni8wUHBIcVMrMmdJM0M0WHY5UGg1L2hJYTJXZW4yaXh6Y3ZU?=
 =?utf-8?B?eGxJL3FxeDc0NXdmQ00vWCtLYjByYVh4SVV6aFU1S29xTmVjWVZrZmE2am5s?=
 =?utf-8?B?UWFJRG5taVJpSnhxS0VOb3hsaDFVaDN0em9CTHR0YnVvVnc2a2RVcEhhWFBr?=
 =?utf-8?B?Ynk1d0RNMXlpU0RpNnVRZ1gvTkxNSDdZb3QzR3B5NnE2VmVKclU1dzJhZG9V?=
 =?utf-8?B?QmQyZzJLNWpaa2VrbEg1dnk5eXlhNEhzNlRSNGhzY2V4eEludVpHSmtWS0Zx?=
 =?utf-8?B?c01TWWtFV0Zreks3VTREeUJCR25PVnNBZHNZcGVsMEdaczNYRDQrWjNyQU10?=
 =?utf-8?B?WThBWUV6cFcxMFdWeDNVQVJDaXJucEE4ZnF4a01yM0taWTVEcXUvTGxhbzFO?=
 =?utf-8?B?VWRMcU1MdHdDb2Z5QUVoUnRVVWhSa2xqMFNtbFFXWis1c041R2l2K1g5YW5E?=
 =?utf-8?B?a2I2NU11dHNPL1d4RUljaExsK0ZtaS9ST1pEWlhpWmMvemhQdWdkSnRnMjNQ?=
 =?utf-8?B?WW9oTEM3TnBJUTlFLzhlUVFpV2hQdkQvTWpOY0p0eXd3c3l2OC93Z1VrL2li?=
 =?utf-8?B?WktLUTVkd0F2dXBycGgvempLcHpLbW9qTEZmQ3JZNzlGcEFSTkxVZmsySTR1?=
 =?utf-8?B?amRIYTNMTWx0dFhERVZ2SjN3T3VxQ3BReWQxMkdNeFJ4M09KTVBERjA3MjJs?=
 =?utf-8?B?TnVVZTdqNlQ5Z2pxbzljRW1qZDBUWkpIa25hZU8xT2dCMUVmZldCK1VKSEsx?=
 =?utf-8?B?Yk9nUjVsSEF1ZTJOaFczNXVYdVdrUmNLd2UxS2djaFNFM0ljdjc3UHQzbVhp?=
 =?utf-8?B?WHlpeEw1dTQ3R3F2Q2dyZU9neVpRb25zc1VPL2t5SVhmZmdHYndtcmpNaEx6?=
 =?utf-8?Q?FpiI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkVFTmpQeEFmSHFibG5BMlpHcDdsQzZzSEtLOTlua2xWVVlnYjlVdFY3eUFr?=
 =?utf-8?B?eWhab0NLNTdkN0R0eUsrMU5JUFBzQzIxNGpKVWw5aGdGRjZvd2JPS3cySzU0?=
 =?utf-8?B?MUtpQUxlZVVDR2p3cmZYYWZzNU14Ni8zQzNoSzBpWnduekdtWW05Z3NvVENP?=
 =?utf-8?B?TlV2d1h0V0d2ZXpwTzgyeTdiQ3Y5TkliYWxCZGZwTjRSWDIvSTdwWml1Zldj?=
 =?utf-8?B?dWdEWWN5YjRXbnVPMkl6aldIYWZqTkFYSmUwdEIrTVUrOXZlS1Frb3Q2TUlT?=
 =?utf-8?B?Wm41SEpGN0J3V3lGelFWVWZXRHhDNWJVblM0VlA0aDYvZnpBc2p6L3RpNldV?=
 =?utf-8?B?dlN4M2Q5VWRPRHo3TnF4TUNmSEVUMmNQVkc2WDYzeStxWjJNMkwyL3A1emFY?=
 =?utf-8?B?cGdwMmd4ZmNWTzBZUUphU1Iwc0R5alVkZEZCdFlWWUd6dFFvWm5YdDJRVmhp?=
 =?utf-8?B?ZGF0LzNldnhpK1ZxTCt0cVlOd3VTTTFrdi9RWjhWVjd3Lzh0M2RXOHJ6WGRF?=
 =?utf-8?B?a21zQzBmcHNvTndVYmI4Z1lBU1pmUUNoUXhjZ3c2MElIVWIrbzEyQ0xVcmRD?=
 =?utf-8?B?QlZ3ZVloUUtKK3BDczNRaXE4U3c3YzBKME96aW9Qc0ptRHRvUmF6QVI2a2JF?=
 =?utf-8?B?MG5ubUV4VUZHNFdlblVaNDBKY2w0TENNQ0NuamRXU2FFWUdUWkIvZFNkNG1Z?=
 =?utf-8?B?aGtWVHk2aTVNNGVMamR0dDB2dFpUZ3owWWJPRkdtbng0Sk5QN0N1YXh4S0hw?=
 =?utf-8?B?N0l2NjY2QlVPbTgrVE05QWZBai9yam4rVnM1cHZzTW56MWFsWCtGUzhBTExL?=
 =?utf-8?B?Q3M2TnJ3SHlNY0hVL05DVHlXTDlwL3c1b0FNMWRxTVdSaTRXZnBWcXdqZDhH?=
 =?utf-8?B?NlI2c1Y4MldSakFpM1NGNHFjSGk0QTdXbTNCUXBDbUEvbGNheTRRVE4yUWRU?=
 =?utf-8?B?RGVYeGVaaHFBRDA2c1JkbE1iTkdIdy9qYTNyK3puZFhDVk5PZVhaZkZSdEg1?=
 =?utf-8?B?bGlvSmlMQm9QUU1INnltK1lubUR4cXovdTBhcEpWUklsS0xCQzFLQ09rK0Jt?=
 =?utf-8?B?Z3AxWXRSOVpudzY4K0Z0RVFIVHRZS2J4WmpDRmJZdjEvbXBVNkErdnVhTHNy?=
 =?utf-8?B?VVBVZjRvK3AvUSswUG0zaGhoaVZuZHVRMHJLekxybWRER200RmZkSW0xcEZ0?=
 =?utf-8?B?ZjE1RE9BWUpybXZZQnZIUG42MVFDZ1czMnJVVlNoWUk4SURuVzF1cTVSaVNl?=
 =?utf-8?B?SGR1VVZSM3pBd04wZTd6SzM3b1VlUTZ5VG1vRTc2K2hQV0N0czVkVENLZm1y?=
 =?utf-8?B?cXo5ZkpoeWZzR0VyQUlTTXBqSUl4QzRuUTc0SEdHRGdFV01jZ1VpWVBOZ3dW?=
 =?utf-8?B?VisyaHdlNDBNa3R1cUxYTTN2aU91cmlXUHF4bGVDYjlCT1I4Y3k4Q2tUTWZX?=
 =?utf-8?B?L2M3ckIvNytndEdlZ1cycHM5UmJWaXF6cTRYOGhYRW5nMWd6N3hOUVFURyt1?=
 =?utf-8?B?UTRXWWVFTXpXSGUra0FYNzV2eUxGTFZqU2hYYU0rOXQxSkR2aEpLQzJhUG8w?=
 =?utf-8?B?cWhLMFVkdWtLcXNMRHpsRU9RejRpV1M2OWdjM0JJU3V1S1grN2tPVUF0RnJp?=
 =?utf-8?B?bUU0ZFhONXB6U3cxa1FwVnJqMWFQZTVMWHpxMXN3M1RjOUVvelU5YUFjVitm?=
 =?utf-8?B?ZnZpdU1XeVh2ZzRxWHJucHRQb1FlenI0VTErOW9Kc2FiN253dVNSNHFSZU5h?=
 =?utf-8?B?T3NEZldEUG9JS3RNOW5KdEdSRXMzVCtqK1VEVDJFYkNtclU2L1NyWUFiZVRV?=
 =?utf-8?B?K0tnb0U3bTJVRjB5Q1FabXFwaStSZFpaQmxyb3M3Z1VxSkFZNmNtMkZJOS9x?=
 =?utf-8?B?RmZXN2U5TERPZmI5alVlcGF6N0NEUGVKcCs3eDV0cnZFUUQ4TUs3MlYzQ3JV?=
 =?utf-8?B?dkc2QWt6NXJVR0E2L0lBZzlSNHBCU3YxNkhEeWFyeFNTaHA4U0o1b0U3K2RZ?=
 =?utf-8?B?WTF3K0lJTlMzQWRHSGVjMDdKTFpjVzRkbzRQRkxodktFanVwR1ZYdVFaSTkz?=
 =?utf-8?B?T2VYUHpXdEU2N2tKaTlmMXp6bDdMVzRkSmRDYVp5V1JaRExpYmhjT3RpeFdm?=
 =?utf-8?B?elVkWGJmVTd1a2s2WmE4ZmRyR04xTzRpeUl3ekdHSjZXb0JoQ0JNdzhKOExD?=
 =?utf-8?B?R3pBblc1SmNFekszelRrRTJiVGVkT2JtS2tpV1J1Qm5PSnhTbmxKYkU4THN6?=
 =?utf-8?B?V203dGZDMS9vQ3o5YnNSaVNWbkxERG5RbHVpRk1PQUlCOXNmNGg2Z04vd2dh?=
 =?utf-8?B?bHEzSSswdVAwSTdKdjJzUmlKcEY4dVYvb0hTYzBzNWExbEVxU3Z5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9cfad9a-0952-413b-2936-08de5da9b5c5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:41:01.4359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aw5yMtDM0+zhl292yCy/lwPzXJbTPppXHlA15EJ6asX6DzBhC4nnwn4bKE6OEDwIFa58RLQGPkzkh/aI64ieDz2+8JcX3dwt0aOSKAUgl/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7655
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 73F029504C
X-Rspamd-Action: no action

On 16/12/2025 7:55 am, Jan Beulich wrote:
> On 15.12.2025 18:08, Andrew Cooper wrote:
>> On 15/12/2025 5:00 pm, Jan Beulich wrote:
>>> On 15.12.2025 16:32, Andrew Cooper wrote:
>>>> parse_ucode() is abnormal compared to similar parsing elsewhere in Xen.
>>>>
>>>> Invert the ucode_mod_forced check with respect to the "scan" and integer
>>>> handling, so we can warn the user when we've elected to ignore the parameters,
>>>> and yield -EINVAL for any unrecognised list element.
>>>>
>>>> Rewrite the ucode= command line docs for clarity.
>>>>
>>>> No practical change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>> albeit I'm not quite happy with ...
>>>
>>>> --- a/docs/misc/xen-command-line.pandoc
>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>> @@ -2752,34 +2752,52 @@ performance.
>>>>     Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
>>>>  
>>>>  ### ucode
>>>> -> `= List of [ <integer> | scan=<bool>, nmi=<bool>, digest-check=<bool> ]`
>>>> +> `= List of [ <integer>, scan=<bool>, nmi=<bool>, digest-check=<bool> ]`
>>> ... this change when ...
>>>
>>>>      Applicability: x86
>>>>      Default: `scan` is selectable via Kconfig, `nmi,digest-check`
>>>>  
>>>> -Controls for CPU microcode loading. For early loading, this parameter can
>>>> -specify how and where to find the microcode update blob. For late loading,
>>>> -this parameter specifies if the update happens within a NMI handler.
>>>> -
>>>> -'integer' specifies the CPU microcode update blob module index. When positive,
>>>> -this specifies the n-th module (in the GrUB entry, zero based) to be used
>>>> -for updating CPU micrcode. When negative, counting starts at the end of
>>>> -the modules in the GrUB entry (so with the blob commonly being last,
>>>> -one could specify `ucode=-1`). Note that the value of zero is not valid
>>>> -here (entry zero, i.e. the first module, is always the Dom0 kernel
>>>> -image). Note further that use of this option has an unspecified effect
>>>> -when used with xen.efi (there the concept of modules doesn't exist, and
>>>> -the blob gets specified via the `ucode=<filename>` config file/section
>>>> -entry; see [EFI configuration file description](efi.html)).
>>>> -
>>>> -'scan' instructs the hypervisor to scan the multiboot images for an cpio
>>>> -image that contains microcode. Depending on the platform the blob with the
>>>> -microcode in the cpio name space must be:
>>>> -  - on Intel: kernel/x86/microcode/GenuineIntel.bin
>>>> -  - on AMD  : kernel/x86/microcode/AuthenticAMD.bin
>>>> -When using xen.efi, the `ucode=<filename>` config file setting takes
>>>> -precedence over `scan`. The default value for `scan` is set with
>>>> -`CONFIG_UCODE_SCAN_DEFAULT`.
>>>> +Controls for CPU microcode loading.
>>>> +
>>>> +In order to load microcode at boot, Xen needs to find a suitable update
>>>> +amongst the modules provided by the bootloader.  Two kinds of microcode update
>>>> +are supported:
>>>> +
>>>> + 1. Raw microcode containers.  The format of the container is CPU vendor
>>>> +    specific.
>>>> +
>>>> + 2. CPIO archive.  This is Linux's preferred mechanism, and involves having
>>>> +    the raw containers expressed as files
>>>> +    (e.g. `kernel/x86/microcode/{GenuineIntel,AuthenticAMD}.bin`) in a CPIO
>>>> +    archive, typically prepended to the initrd.
>>>> +
>>>> +The `<integer>` and `scan=<bool>` options are mutually exclusive and select
>>>> +between these two options.  Further restrictions exist for booting xen.efi
>>>> +(see below).
>>> ... then you say verbally that the two are exclusive of one another. That's
>>> what the | there was intended to indicate. IOW I would prefer that line to
>>> be left alone, but I'm not intending to insist.
>> You said that last time around, but it's still not how the parsing works.
>>
>> ucode=1,1,1,scan,scan,scan,2 is legal.  The latest takes priority and
>> cancels prior selections.
>>
>> The reality is that | used in this context is meaningless when there's a
>> comma separated loop around the whole thing.
>>
>> If you don't like "mutually exclusive", what else do you suggest?
> I'm happy with mutually exclusive. What I said I don't like is the dropping
> of the |, expressing the same "mutually exclusive" in a non-verbal way. Imo
> those short forms aren't supposed to describe how parsing works, but how the
> options are intended to be used.

The documentation needs to describe how it is, not how one wants it to be.

Anyway, this is long overdue (and needs another rebase over Alejandro's
recent work), so I'm going to get it committed.

~Andrew

