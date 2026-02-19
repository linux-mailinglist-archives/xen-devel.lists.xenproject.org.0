Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMvWIR5Dl2nzwAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 18:06:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B0E160EF3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 18:06:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236613.1539275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt7TF-0005zG-6k; Thu, 19 Feb 2026 17:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236613.1539275; Thu, 19 Feb 2026 17:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt7TF-0005xn-3p; Thu, 19 Feb 2026 17:05:45 +0000
Received: by outflank-mailman (input) for mailman id 1236613;
 Thu, 19 Feb 2026 17:05:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=erNG=AX=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vt7TD-0005xh-Gf
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 17:05:43 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37ad82d8-0db5-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 18:05:41 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA2PR03MB5785.namprd03.prod.outlook.com (2603:10b6:806:119::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 17:05:37 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 17:05:37 +0000
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
X-Inumbo-ID: 37ad82d8-0db5-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McprM9qJ8KkcqEJzoFc4bFU4r0HMR/6Xi5zg4DhfznzBn7c/ffC4uejlUEhgYcU7ea2wSBv3c87518+S4B8Fo5yWib6GvlZ1A0aO9QrZowkWM+K31mdqMT01LlCJko2pQXkZjt2Gk3QNvAbCohRep/8U1Np+7k4vXQsDIE5v1BgVe19KL36LCTL+UxsI+yWFKSDqYhRZ6hwi415qqYqsWc4LBdiCAXvyIkTU5RsE+/gFh0pX216rjcLY4E3omJ9vk5O75d+SmM7cjYNdVTmW5Dfofn1jEiJLc0ohoCRWOTYDqhwYIxjt03Qtxm9y0k9gvk4ZT+WA1IzCQgQsfWNPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSgHdUcv0+HF384iyma8R33+dhHWTJ8vI8YpkUR2HZE=;
 b=KT3+r2rjO9/FphbM4LOc2mWL0I8IkMPIvlyOoddrlXODD7BAU8jfuE6VU82bmMSqxmXyxi5ustIlDBY2VSLfj0k4UJNPq25Wi5qx87gd/hhMDxFhWSBKABHaQ5dS5XzdGzUlB2RRsLWwx5cK6HMBUev3r6QVe94F2h6de56wEzJlPqPWPbF4wtiUddZAU4LOWIqL/CaPqDOYnPSZTkSxqLAAAr+rnWVlNw7BcLykBje45YxRdhh6WeyUWZHMFGwlEuCIiwm+M6gqDfQW1Psf+JOpts8eS+h9kD8Yr/Jl6AbraWeUya4bxLgmgptLUT1MWCSPw+cxCxpnTYUaAml8QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSgHdUcv0+HF384iyma8R33+dhHWTJ8vI8YpkUR2HZE=;
 b=oTy1YWPROuH8GEwCyxpQen+ZQt3js5tmX9Mjk5YIP2NIdHLKAvpE6DjHsIZYKCoqlK4P9nANyGoa/CraZ8B9HchJ6RmYLRngU5vHlOMdeZCCohlA8OzFGJjqWEHedtD7vUMSd/+NvNNGFk+eDro+hn2I7Y8bV5ghjSWFdVYdbvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9487868c-f7fb-4362-9c1b-507b2fc90dbb@citrix.com>
Date: Thu, 19 Feb 2026 17:05:34 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/bitops: adjust partial first word handling in
 __find_next{,_zero}_bit()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b2aa7f0b-147b-439f-8e25-2f7a5a2f75a8@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b2aa7f0b-147b-439f-8e25-2f7a5a2f75a8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::13) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA2PR03MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb6937e-46c3-472c-c148-08de6fd91a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUVsbFJxcmFZa3hacGlyNGVOZ2tLckRJUzBwbUhPWmUwMFEvWlJDSG1XSEty?=
 =?utf-8?B?YU5oR3hML0JJaGtqR1M1NTQvVko3L0tLZk5KYlp5KzNFZm52WUZpK2ZsUXh5?=
 =?utf-8?B?NnJlZVptVGRrR3gyS1hDMlJvZ3Zpd09EcTdMb2VrNUlWZjJ0aENhZGcxU2hH?=
 =?utf-8?B?KzRCUkYrNDhYV2NJNGJabUhQMFd3amp0bVhIMGpqSU5oTnN4R2lZRklJcWQ1?=
 =?utf-8?B?Tk5ndzlWR1NOdmtpT3ZnbFZha0ZXWjVJQ2REcmZLZGxvVmNmK015NXRYbzRZ?=
 =?utf-8?B?VndYbElIbzlDZURJMVNGMitwejByNUgxOWptenZzc1dOZm5ZckxOOFBFTmts?=
 =?utf-8?B?R05qVnFwdmpqQjNTcHFZNzRYZGs4N2ViZzVJM1lmVU5RTU4xQU9HTTRydlpJ?=
 =?utf-8?B?Rms5K3gvWXI3SVZnODZGRzl3QWQ1NEF6RjZvVysvd09SWlNoTUFwNitPYXZB?=
 =?utf-8?B?ZHBiZ2dETFE0SitDaDJsV09NWDlzRElISjhpNGRSdjFubEh1a2lkdnZiNHZs?=
 =?utf-8?B?TjQ2K3pVRVhsTWNNWFUzSWV3Z2RIa1A2Q2VCMlRNRUZOQ3FQNXNHRHVmUlZI?=
 =?utf-8?B?ZmxNalZ5RkVoWHJMQ282WjBZWVYyUzFLdXhpZkhPblRNdlViTEk2bE1UZEJm?=
 =?utf-8?B?Y0xuMEZSWlNORDRhMGZJMS9jaFlLV2ZsK2hxMEtQMzRkdzdTNW5JSnhlYlc4?=
 =?utf-8?B?NnR1dEphby9ZakdQSGNWWGNBM2wwQTNvNHdNUnl0c3o1VmdnWHgvVVBMYUdj?=
 =?utf-8?B?WE5jRE5zOWxmLzZhZ0l5amVpbzRzQVlqQy9sVWdNVnJja2lTSDVLNzRISGdo?=
 =?utf-8?B?cm5welErR2t3ZEUrelVObG56SGlHM0RpSGNuRUZtL1F2d0lNWGVsRE9abmR3?=
 =?utf-8?B?RHA3WWYxaEdpOEZPeisvQXFKbEtxM1Y2K1JBdWNPTXNkMW9LTVJ2MEdDRkZL?=
 =?utf-8?B?NTJKVDVObDdBNmlLRjBKY3BoMmIrVlhpUEVGOS9qb005RUR5QWwzOGhudkFZ?=
 =?utf-8?B?R1VXeTF5V2MxanlxdDZxdysxT2cxc2xWcTBjZ2NlcDVjWmtYRGx0MUN4TE01?=
 =?utf-8?B?bVlxTXUyd2pkTjN3eVlvRk56V3QyNFJobmVqMVRVZ09BMEhsZE5iVkNXa3ls?=
 =?utf-8?B?NCt1aFh6WHRieHlBK3p5clhIb1AvdmlxNCtZVHFsaGluR0ZiMi9JeFREeUNJ?=
 =?utf-8?B?YTUwNENkUE5leTlHUEpKcVlEN2lSSXl2MXFRS3Yrc0laZ2VvS2JVeUVIcWhU?=
 =?utf-8?B?YlZ0amdmU1lPUTdUdVYzTXU5Z1MvTlF0VXdzNWtKbkdqcFh3WWJ1Q285eklq?=
 =?utf-8?B?TDFpMzlSZlBtNk9yNk5LMEZaL3BjNlpBNkVSRW9Sd0FkMURseWlsKzZubWw2?=
 =?utf-8?B?ZkZGYTJQeTlaaFRaek0zNnlZeVlnTXo1dVp0QkRPNzBjRFRuKzJuckFWK3ZN?=
 =?utf-8?B?TFJBa1RjTXJ6NlhULy9WcWRuWGhQVkVLMHlxN3lUMXRaQzhtc3VDdTNEdDVx?=
 =?utf-8?B?SURlT0lKNUVadnBaMUd4WXR3alFqblNsMEhuUVRBb1hzQkcvWERDajdUeW1s?=
 =?utf-8?B?eEI1bGt3Y29wTmwyREVOakRMSUs5THd3ckJjTnAxNlgzdHJlOTN0aytJbXNV?=
 =?utf-8?B?MTJaWXh0bXV6WjFvNVpXcTc4T2RqQ0dKbmQ1TDk0Nm9LN0hNRTRKRm01SjFj?=
 =?utf-8?B?cDJFczF2Vmk1YnhhU2pOaTJoclZMakJncW54dWFvWEFQbkN4YUNDR3VtOHlq?=
 =?utf-8?B?dTdWOXhtcXBvdnNEZ0RsUGlpYTM4Q1FtUkk0SmM5SVlkNHp6MTMvYXZ6dVp3?=
 =?utf-8?B?R1BqKys0REgyaDgzUGdOSXdrTHlXLzcxc080NkN4ZzNYb2p6M3dLek1yemtL?=
 =?utf-8?B?ZjBSR2wvSUF6dUhiUVBOMVNBdjFjeDNvMWdqWTVRcUk3T25IcnQ4Z0JFeGRO?=
 =?utf-8?B?YUZoamFrb0hpOElQYU4wa1NFbzBYZkllWlVTZkUxMGtIbGtpSTQ1MzFiSFB5?=
 =?utf-8?B?dXFqaU9RK1dkdXJCaGxncHVKV3ZFV1poYlN2czlNVVVGK05CNmNEMzRKRitz?=
 =?utf-8?B?THFsUzRVR1VmeEhKYUV2UGN3QTdxNFVMaHVNYzdnNmRlZk9MNGFqTmhzSXFk?=
 =?utf-8?Q?nKfU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2doM1Y5bFUyWWZDQldHUFZiZTY5d1phZnNLcnZlR3NMa1cvc1FRaXNuMkdo?=
 =?utf-8?B?QXptNC9zVE8xUWVXUjRHTTVzcHkxWHgrQmpDd2RqS1FnWHpvSnNMWlR6aTdE?=
 =?utf-8?B?UzluVmN3aGdsY1RjZXNaV2hxdUcxaGZZL0FjL0JaZG54d0RZTjV6YXpZVzk5?=
 =?utf-8?B?SEhDaXZVNk0rVHdrVUN4czlCSUtQb2g2Z2d3TmUxRmNwTXE3eUdzbmVHaEdW?=
 =?utf-8?B?UlByOUg2RkVPcmNaVGxZYjNWekJpa29TZzlWN1V3UjJZREVNUENhSndjYTAz?=
 =?utf-8?B?aWFUK0VLUXM5bU4yZFdMaWoxY0hzZmZyK3l5aStRUFkvWEllVW9BUXdjbzRt?=
 =?utf-8?B?OW42M2RESVRjUHhSejBGSzFibjZGL1V1MVliektCeDVEczRSZFU2RXhKeG13?=
 =?utf-8?B?NE1jUVFQWEZuR0krRlV3T3kyaGFvUjJlVlFKUERVQ29qai9HU3RuSjhJam9N?=
 =?utf-8?B?TXl1L010SFFRcEdjS3RxZFp2bFliY1RabkNyS1hJdHgzRkJPTk9lK3hrVUtX?=
 =?utf-8?B?UkNqMEdUN2gzRjlTckJSWjNFQ0dWb1NDdTRvaFpZT3dENnQvSzhjWE5zbmhS?=
 =?utf-8?B?Z0pKS0ZWRllKM0JmbUx4bWIwYnJYUlhZbVdpbUZUcEE2QTFlNy9NVDBqRjhy?=
 =?utf-8?B?QjZsb0lCVjFKek5OK0JjOER1MHNxQ3F4Q1NXNUV1c2NuRVFNZUVXdGZPUHBZ?=
 =?utf-8?B?VkdPdGl2T3hwZW5naGEraTNrMm16V05JVnZxNk5WR2hnL2lWam5Db3lJTTV2?=
 =?utf-8?B?blJ6a3ByLzAzbmxHVUF3SzJIZWVCN1N5eXFrQ2FidGt6M0s1ZW9YWDJ3dWhY?=
 =?utf-8?B?bGw3UjJjODNMTDQrckJ3V25jeTlEOU8vUkFYREwyNGJEYlZGZTVJMXp5cTdk?=
 =?utf-8?B?ZVJldTlrTTNtVEM3TkpUZ1ZvN3g4K09EVVhlbzQ5UjVWNXhycURFaEJYZERY?=
 =?utf-8?B?OGJ1QWxDY3grZi96SDRVNWpYSm91Rk1kcEl6cDVrdjc4bjAzN3pzT0FKdGxm?=
 =?utf-8?B?N2ZONDVrUHZQdXJra3IxN0M5QXowanIxb2JuanBCNkk2RHA3ZHpNaXEzSlk4?=
 =?utf-8?B?T2Fraks5a1UvTkdUemlOVEJJcFBpNmhWYVRtUmZ4M05KRlV6UzdUdVY3aTNr?=
 =?utf-8?B?bWNZaldRbnhKbVk1eFZ0RE9jdnFPcVNQUGo1Z2JVWkxNNGFMcFRYUzkwd2lS?=
 =?utf-8?B?RjZqRFFUZHdyc2FIL1BPOFNFbm41R2tCL0pvL1dBWEwvVXlqOWpCRzc0ZUhG?=
 =?utf-8?B?UFMyM0hOZTlwaGc0UWVLRldGMDk1KzNkaWYwdWUvUzFBRENGMnJwRmUrTW1r?=
 =?utf-8?B?dGxSTjNxYnFnQjBFRlZLcFlmK1FsZkVYT084MHVpb2ljekRXY1RlVTJuY1Zi?=
 =?utf-8?B?U2VkUlJPTnI0MkNTbFRYaURra3VqVWpxdWR0R3dPcTRTVDEzWUVKOFZQdWpy?=
 =?utf-8?B?WWJRejBXZkVsVkNDcENhL2dTK3pmZHhUaWFCV0k0NVJjdXdBTm8yVEg2QjBB?=
 =?utf-8?B?MFpKb2ZGM2NOWHlrTW00Zk1nNXJMb0xnMmNVY1V6dktFOWxHUkRoN1pWd0VB?=
 =?utf-8?B?YTZmbVVvTW1CUFNLRXd5V1lEcDNwOS93Rm1ydDJlYTZmRmNmclBkb21jSjN2?=
 =?utf-8?B?R3BBNlN1RG9JK05xS201U0NZalFvV2RsZ2ZPeStYdVlwTUVsYlFEaEJxZHp2?=
 =?utf-8?B?bTZrNnRBVHJLUDdzTHE5cjJmK1RDZnpFYk54L050SmlhN29LOFcyKzRaenJY?=
 =?utf-8?B?d2FJZlNTZHJZdVNRZFdIelVlY3d1SSt6MS85ZGF3RjR2clFVKytYckQyZW5H?=
 =?utf-8?B?Szk2YVZBdVVWNFFGSDk1S01FNmNEWlZYbUpmWlY3NmtsQktFa0pHbkFuOXQ4?=
 =?utf-8?B?M1R3OUdDTW1DL0hoeWlGRk53VDRqOVhXWXFhYWMxaWF4RVpOcFFienp6SDJk?=
 =?utf-8?B?WmhyZi9IVS9xeG44Q21VZG5wU3ViL1FQN3hDM3JxZXhSOGdXK3gvMlZQVTRy?=
 =?utf-8?B?VUlYOXpkQjI5QXNLdmJxU3pvUjBGM01Za0dCanFadEEyZGNka3VoSlVNQWxY?=
 =?utf-8?B?K1FYS3Uwa3EvZ3ljRU0zVjdFMDl3RDFySUZBOWVtSC9NajU4dmZ6QXQwN1M1?=
 =?utf-8?B?UmRMK2FpY1V3NW9FN21pWDVFRlhTSFY0cFFzeVQ1WUV3bW53TzQ5TFJKSXlD?=
 =?utf-8?B?QkoxRzJQejg4MmMyNFdsaTlsUzVLZW81M0hGNFE0V1lXSTBZNFI3VWhmdXhQ?=
 =?utf-8?B?VWlCYTRkMHYyd3BtdHlWcVU0WFFxZjdiS1VRTlRLS0FuaXNYbU1FcTJhSnVn?=
 =?utf-8?B?QVJEc3ZpNTVuQWRxQllQbFBDaGh5aEw0eDJ3WWR3UXozL1JUS1ZGUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb6937e-46c3-472c-c148-08de6fd91a1d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 17:05:37.1299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1S8g/6YbdXsYkzJ8f/33LTRwpdAEONwJXOfilCQaNvXbboqsNc2q5XFCyual5HKWjWUkZ3b3mdTHP2SL9+RvMdceJEk/rEE1ehYvmZt4KQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5785
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: E1B0E160EF3
X-Rspamd-Action: no action

On 19/02/2026 3:42 pm, Jan Beulich wrote:
> There's no need to subtract "bit" in what is passed to __scanbit(), as the
> other bits are zero anyway after the shift (in __find_next_bit()) or can
> be made so (in __find_next_zero_bit()) by flipping negation and shift. (We
> actually leverage the same facts in find_next{,_zero}_bit() as well.) This
> way in __scanbit() the TZCNT alternative can be engaged.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I agree that we're already doing that in find_next{,_zero}_bit() and
therefore ought to be safe here.

What's really confusing about all of this is that __scanbit() differs
from ffs() by wanting a return value in the range [1, 64).  With that in
mind, I think we can do exactly the same as we do in arch_ffs(), but
preloading with BITS_PER_LONG rather than -1.  That in turn removes the
alternative and simplifies things further.

~Andrew

