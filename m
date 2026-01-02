Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 753D5CEE163
	for <lists+xen-devel@lfdr.de>; Fri, 02 Jan 2026 10:44:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194911.1513060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vbbgH-0005pW-KP; Fri, 02 Jan 2026 09:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194911.1513060; Fri, 02 Jan 2026 09:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vbbgH-0005n3-Gg; Fri, 02 Jan 2026 09:42:49 +0000
Received: by outflank-mailman (input) for mailman id 1194911;
 Fri, 02 Jan 2026 09:42:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A6FO=7H=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vbbgG-0005mx-4c
 for xen-devel@lists.xenproject.org; Fri, 02 Jan 2026 09:42:48 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62688ae7-e7bf-11f0-9ccf-f158ae23cfc8;
 Fri, 02 Jan 2026 10:42:43 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8447.namprd03.prod.outlook.com (2603:10b6:8:322::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 09:42:40 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 09:42:39 +0000
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
X-Inumbo-ID: 62688ae7-e7bf-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GeKuvjpijCl6DTbfwBdd7l7czTXGHr4ogTbNM4y3klCbmLHOQ5Wg+tgKqP9qtL90iXQibA4Sl1TCNsp4U+upsHKIbTGIXmac2Zp6YypOJj/ILMN1+ZVruPdkChd3NMhDgN+UsJGb/ghQhG76xnHG4DsYTjJiZOIzCW+oB7QGFGCCKOMQuRBqj9UWn1WVh79FWgQa7D9Oob1VfyW8aKoKSmGqVhu8pp7AvzVMMVIzcNnzDV7FUUO79+NbMkGhqAXwEQLp5uFmqu05VRb4B66/X904weCf38+TnlVzn9PCp//vi85ueAzPAbPdYsDxSZfEFB/i8VjJmt45fur1J7xT+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTBIoynGvjpXTtxUwXGOfeyWAeChqHuqKcbpPGXyv6s=;
 b=pJDO84mPC9zKyyLCsMr3VX953eKZl3UBALJeU92eRTfId0DkxjOkb8FOBbzKYN74izj+gWO71abzAqrbJer18lh7mx1D6SgZmNOpVcwIee1fshJ1ZMAZtlCXjGS8Uo49381kYTkmogQoss2YYHhuSulClwogdEYku2mcHGtouAqaPMwxn8zw8rRagN6zxAc7PubdROn3ZQphyMsXufcJqbBHvKXQfnLKg2sLGJ1KTywXT0IHZLUKqejmsX2zLPhVJ61Ay+ngnYVouaIzClYbgp28m5sctiOMUjXIbpigAtl0z8buicE9fqKNWBhocvmG0UykJAHkNA9aXIW6h+4pCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTBIoynGvjpXTtxUwXGOfeyWAeChqHuqKcbpPGXyv6s=;
 b=ZjDGLMjzOcxrEERB24rddSyK3cEwcSnhye8A2J8R+rkP2IrWNGJy4+dDYbdzOHeELZIul88hxkLRrjsREYw8U/8bUb3w/F7/9ixYWWKJhsXp69pDDXsTK1nmIRWsSE1GJ1ewdM6/1rWyYYZtRTzhTxBqPLKF7ft6cBpNka+ZEbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <24aefd91-18ef-4ac2-a1b2-6098aa31e716@citrix.com>
Date: Fri, 2 Jan 2026 09:42:34 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, sstabellini@kernel.org,
 consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] xen: rework deviation to address varargs MISRA
 violations
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <d2ba22d6a36a4f2b952a80712aac2cfe632e8609.1767174251.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <d2ba22d6a36a4f2b952a80712aac2cfe632e8609.1767174251.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0210.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::17) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de0ab2a-0cf9-4af9-f07a-08de49e344a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WE0wM2lrZUZkcmVRVlZGSGNxSktvM2ZuclkzdkxzVUE0ZmVaSGNSOUlVVUxp?=
 =?utf-8?B?WmkxbENFNE9EdzU4N0JqUnVhNGcxeEVCUzQ2blRpQjIweTlGUTQ2SGU3UlVJ?=
 =?utf-8?B?Qitucythcnh6VkkyRUN5OThxak8wUDd4NjExUkpwaFRhQXdzbk5jSEVwMUlI?=
 =?utf-8?B?ODdKZzc1UE9WQ3UrK0NBeFNlbmV4SGhvNGVyS1ppU09xN3l2QW15RHJnVmxr?=
 =?utf-8?B?QXkySFE4c0x1RnlqcTdvUWdZWEV1MEhoQWs3OUVibE9DM1BHMTh2dXdkcjJh?=
 =?utf-8?B?Uk1rdHdKTHJzeXRuTFppKzV4R1pNdzdVSWpxUUlQQWxUMUxBZUFnRWVOb2s4?=
 =?utf-8?B?TU4rL0Izd2MrOHZLK0thN2lwU2JvbGV3Z1hwSzFMZ1JCYmY4TzZLaWhGcUJI?=
 =?utf-8?B?dTN0MVYwLzhaV25wTmVuRjZ4S1hCbDBTaEU5UlY1b0Q4T0d5aDlwK3hlQ25u?=
 =?utf-8?B?elBqSjJjS3VQajQrRVI2S21MNGlyWmx4SE9qTjZSR0JjKytCOVlBblVWNEha?=
 =?utf-8?B?c1BiL1FnbTFrTW1HMy9pRnlFeVRuRW5Mb2FVVWN5YlI2SjdtS1RJODlORnIx?=
 =?utf-8?B?SW0yb2I2Zm1SRVhZaXl5U0pBVnJzeXlJTDN5QkY3TDdOZXVOQkduUnQzQlN2?=
 =?utf-8?B?TXpjYmt0NjZyM2hCSE9tYzRJRGVXcEVpd1Y1ZUtvYTMxdFBpOThBeDh0NVN2?=
 =?utf-8?B?R3lndU84bHBHcXQ4dmk0aTEvekNEQVAvcVBJdVdwazJVcTlrRWtZcDhRS0J6?=
 =?utf-8?B?VzVyMFowUU40UWhvWk4wenpLZmdtSjJxYVhXaDlFanRxNjVldisvVkpuNjZx?=
 =?utf-8?B?MVR1V2k2aEJFbXNVazdiNnBvZ1dwaWhLS0FERitOWStGMisxY0tJWTJSMzZp?=
 =?utf-8?B?UlBRUlRSalEyNjl1ZWZSNTNka090MmhzZm4za3c1Qyt1bWVBMStwQWxBK3I0?=
 =?utf-8?B?ZVBKOGRUcHU0cnJzQldpQ0dTa0NvMnhJWkY3aGVwM3JhdVF3Zm9ZZ3dSaUc5?=
 =?utf-8?B?bjJCMkJjSmZDclhoV21pZ0pKbkQzcU9LZzZGbVVad2NCbkxlclY1bVFyaUt4?=
 =?utf-8?B?bWtWZTRIWXpLdXZtTUNSZGxOZldPQjdvdStaaFBqNUdWY2pNa2M1Z3hFY3BB?=
 =?utf-8?B?TkNaSEwwT2JMNHV4OVlQR29lb3k4d0gvN3hJdnNNOE5LckIwcklRZEFiMXNC?=
 =?utf-8?B?Y1NZcTJhaXI5OGJvSjNIdDBOS056V2NXVDlab3NOMGcvZ2xGaE9DMXVxVVJF?=
 =?utf-8?B?aTZVWHduSm5nS2tKMXA1K0h1L2VJVC94R0Mzd1pVUEg3d2JqNWF3VHZZcG9F?=
 =?utf-8?B?U1lVeWVubUJsTmRvQ0Q2Sm9kaTMwWWJUbk5JMkd5V0duelNhMlV6Qisrbkpa?=
 =?utf-8?B?M3NvcmtyY0JlYjJKeUg0dUZIeDRmNG9nQmtSMU5yZTZtMUJucVRvOTZUN1Z0?=
 =?utf-8?B?SDllUmcvck5Ed09Jdm9Uemg5dS9JTXRMbC9wZEF3bE1kRE8zUm1CTU1jMHlE?=
 =?utf-8?B?N0cwUnZMeVNUSmt5ZWZxcFRuR0dmVC9xOE1uZzhJeDJQT3ZaNzhuZmc2WGQz?=
 =?utf-8?B?SmxiVUxKa0h3S280U3dnZVRGbitsT0l6Q2xBVnA2VXloNGVoWnNlbm5xNEVi?=
 =?utf-8?B?blF3M3R5WGduTTU1L1ZYalI1WHNwVDVUNVJZZDlYeDhNUkkydmszUjVuS2xY?=
 =?utf-8?B?ZEUrN2x6aW1hZ1JzU05VQllzRzZDQzZHb3JPdVlSbksyaXY1N29GdFVSNU9Z?=
 =?utf-8?B?L1R1NzFxQUhhL3BaVFNFNzBvSWNjM21iNFNTUkt3NnBTMW9sTWF6cjBINWhn?=
 =?utf-8?B?d2t3YklJSGk1RFcxM3REWjFGZkl6eFAzZy83eE1iNmpyczljTytoY2V6WG1k?=
 =?utf-8?B?Z2YzQTVnUkpQY09LcCtKNmNUaG9qTEYwOHdDY2xyRU40TmJ1QWoyZGJTRmhp?=
 =?utf-8?Q?8VQACsaADuV8UEwcKa+w63xkGEN2DkAd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXFUT3QwNTVWVkZZWU9DREpZZGxKd2ZXNzdZeEhLa2M0dTRSbWZUK2dvZEIz?=
 =?utf-8?B?dEkzNlBpQTRPQTh3UVlXWFFBRU1XNERtRFdhOVY5ckdWWHF1eWFLSndHNEs1?=
 =?utf-8?B?czM5UzZoektCMTBidXRPNGFIZUJPQ2crSExJbC9FNEduRlhLd2hmeG5kbjJE?=
 =?utf-8?B?REN0OGhQaUJ0bS8xbWhZRlhsWVlyTTRJYmZKajA5WmpYZDkzZ3JUMVVwRUpl?=
 =?utf-8?B?M1ZNVGc4elRFRm5kRVA0cmRaN3VWNXV5OFBIRjg4VXBkdDRNMGFHMmZDaklz?=
 =?utf-8?B?SmZhSm1VZGNpMnhMejdqaEt1QXdGVHNlNWpVSTNEMk5ob01JaGR3dFhMdG91?=
 =?utf-8?B?QXJvNmFwbkIzbzc0V1RjL0tOTGgzbFZiRXJhWHFNQkY3R1hXbDF3T2YxS3dZ?=
 =?utf-8?B?RE1ISjhqKzU3cEFidTF2OGFnSWpFQXhKcHMvdU12Q3ZEcDByU3FOclRZQW9U?=
 =?utf-8?B?Vy8wbDhSYWtBYTlFRlJQYTRqMWlORFVpRlYzdHZUQjZkZ1ZZbzFSZmJZOFIv?=
 =?utf-8?B?dlVodGpKbEh6bWN5T1Q0cHVYRHZPcTFFQjBwMkRlSGE0RkRCUjNVZmNSVGp0?=
 =?utf-8?B?NmZxalhhSGZtdVh0K0R0MW90WGh4U2ljTzZiNmF4czJmMXZSZjYveU1jSndN?=
 =?utf-8?B?U2g3MHZWWStqUXF4YlhHRCtJeTNYbWNWQlNORzlLQkxXMmd0QnhkNVJ1UnFm?=
 =?utf-8?B?WXI0ZzNlVitGRFAzOHQrbmF3YVd2VG1tOHF6Vk9QZ2pWUTAvMlV2aHJrSDR6?=
 =?utf-8?B?Y3RTSTZUOEJSZ0JZT2cwaTBmYVp2dnBRRmw5M2h0LzdkVStYb1pVenlUeUdP?=
 =?utf-8?B?Sy8vM0l4aElmSXVneHl3TmtBVGRRZTlRaFE4dWNZeVk3Z2NkZ21TcjJKNVdX?=
 =?utf-8?B?bWFIY2w3ZHA3a2I2WUdjVWdRUHRrY0tiZW9RZDRFRlhMdHZ3UFRiZkN3bzht?=
 =?utf-8?B?ZEMvQml4dk95TnBjMWN3a3VTWERQakkvVmpLZmlybDFWdUFxbklabDhoOFlt?=
 =?utf-8?B?Z0pXamY4MnYyZXptZzFONGFkZ2ZqVzdGeHlOSWtvTlZrRldJSWx3RWMxbTZX?=
 =?utf-8?B?MmRwbnFFbnA5MlRIVkxZc0VuVUxLUVpEdnptQkFEQ3R3bWNsRkRUc0UxK3d2?=
 =?utf-8?B?Q0lKNEFmbHlRZktlQ0JNcmtKVmZxcEx5YWxDZEJxV2NmVGZYbjBQVnE3RGVl?=
 =?utf-8?B?SGJtdTFmQWdvbFdsRlRCaW0zODhGdHV3Y0krODNIYTRwL1NGbTYzN0c4cU05?=
 =?utf-8?B?M241WlZlRkhoZ0VVcEpoY3dwOXM0L3RiS2s3dzhDMWpXVlJVZENPUktrZHh4?=
 =?utf-8?B?b293b3pGL0pDbkdZdEUrQnNXYjhpd1ZpbzB4UnFHVjk4RGg5T05oUHAwakdP?=
 =?utf-8?B?RXZRSkR6MnhRYTZHeUVKZEtJOENZb0RJWW84UElCbTJWcXVtQ2tzWUx5bG9Q?=
 =?utf-8?B?OFBidzR6bXA0azZ2RDBxc3NGWENmWmFzUCtWVUV3WWxsZ0RBaEVsbWVNTS9j?=
 =?utf-8?B?TjRrRFVObjFvcndFV0RBYVVYT0tobTRKYmpxaE1Xc3BuQjY2WmtMUmp1b0dl?=
 =?utf-8?B?N0piVGlFWEdZczJQZWpjeXlCQ3ppY2hMNDdaZE9HQlBlZ3R4ODRlMXV3eHZM?=
 =?utf-8?B?MkRUV2Rwbm43MFJHRU5KUHBsaDJSY3FlaS9XTDBkUCtCdE9ERDNQOTJiRkRP?=
 =?utf-8?B?WTVFNWtiUXFkUUJwOHRWS3pnZWYzMFBzWGlxcDRQUUpycFFRZ0VLa0tsS2lZ?=
 =?utf-8?B?TXJVbXRUVFNPMHR0cjdRalkxcUFLakxwODJma2ZlbnJBVER6bGR4ME42K2o3?=
 =?utf-8?B?MU1iNnlGZjFVOWZpekxsbzdVRzVvbzB1Rkd1SktrZDhzay9iM0hMUVo3TDhw?=
 =?utf-8?B?RGxERkxQTm02UEsrYlpIL2xNRGxrclZoWVRGalhZOFhrYXVzdW41NHBhWjZn?=
 =?utf-8?B?WlhQKzh1RjZaUWFVdkVOUW9MY1dqUGhwWXUweXRFVzUvZVJsbmtoSjBpMndC?=
 =?utf-8?B?WnpRbkhWSGFGWTBac2IydlZRQ21yekh1UXZsRXY1L21HOHQ4bDBBbHhnVnNE?=
 =?utf-8?B?SVhrSGoyNEpiN2pPeUNlWWo0TGNoc3JvUHp2RzFBcXdBblFNUjQ1d1FJYVh4?=
 =?utf-8?B?OWdlcWFUSHNiOEZ3bjVJVHNPSEpSUGRFS1U4RHN1Skt5VXB4MmdOQk5WK3JI?=
 =?utf-8?B?QlpBMjBnR3Z1M2l4MTFwczJHMkxjUEVoY0gzVkV4UWxhblMxRnRYczdTRWFZ?=
 =?utf-8?B?b0JCd3B2bnZMSWYzc1ExcmtEa0V2cHhPUG1KLzk1cTl1TWxQMkxmRFdJY3lz?=
 =?utf-8?B?QkdUdE85MkQxbHUwYmJVeCtRMzhoMGp3aWVtbklEUDNlUEtXbDUvajBHUFln?=
 =?utf-8?Q?8rbfF/JCahT8iB0U=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de0ab2a-0cf9-4af9-f07a-08de49e344a4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 09:42:39.8946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Kd/z1xxqzzdlVnqnaPkFxzD/JwCw9YlrcnL+T7k11XHiESe1QZVIfjxn1jYT+lSzEybkLZ9AgHmMhZQ0/MBeC+bJLIpKBnl4rf7P4AHwMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8447

On 31/12/2025 11:22 am, Nicola Vetrini wrote:
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 219ba6993b90..7dee4a488d45 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -570,13 +570,11 @@ safe."
>  # Series 17.
>  #
>  
> --doc_begin="printf()-like functions are allowed to use the variadic features provided by stdarg.h."
> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\\(.*\\)$)))"}
> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\\(.*\\)$)))"}
> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
> --config=MC3A2.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
> +-doc_begin="printf()-like or scanf()-like functions are allowed to use the variadic features provided by stdarg.h,
> +provided that they are declared using the `format' attribute."
> +-decl_selector+={format_attr, "property(format)"}
> +-config=MC3A2.R17.1,reports+={deliberate, "any_area(^.*va_list.*$&&context(ancestor_or_self(format_attr)))"}
> +-config=MC3A2.R17.1,macros+={deliberate , "^va_(arg|start|copy|end)$"}
>  -doc_end
>  
>  -doc_begin="Not using the return value of a function does not endanger safety if it coincides with an actual argument."
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index b3431ef24e26..584907b048ec 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -570,8 +570,8 @@ Deviations related to MISRA C:2012 Rules:
>       - Tagged as `deliberate` for ECLAIR.
>  
>     * - R17.1
> -     - printf()-like functions  are allowed to use the variadic features provided
> -       by `stdarg.h`.
> +     - printf()-like or scanf()-like functions are allowed to use the variadic
> +       features provided by `stdarg.h`.
>       - Tagged as `deliberate` for ECLAIR.

Much nicer.  But don't we want to repeat the part about
__attribute__((format(...))) here?  After all, that is the justification
of why it's safer than nothing.

~Andrew

