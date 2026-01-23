Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4iFAF2XLc2nsygAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 20:26:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD997A232
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 20:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212534.1523617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjMmi-0007eS-7C; Fri, 23 Jan 2026 19:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212534.1523617; Fri, 23 Jan 2026 19:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjMmi-0007be-4B; Fri, 23 Jan 2026 19:25:32 +0000
Received: by outflank-mailman (input) for mailman id 1212534;
 Fri, 23 Jan 2026 19:25:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Sxq=74=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vjMmg-0007bY-Ss
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 19:25:31 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 441386c3-f891-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 20:25:25 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS1PR03MB7870.namprd03.prod.outlook.com (2603:10b6:8:219::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 19:25:22 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Fri, 23 Jan 2026
 19:25:22 +0000
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
X-Inumbo-ID: 441386c3-f891-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpbOpOjAgvZD83KxZsQpVKma/Bpgu2hIv2Zc4vaANeaIgZCyu7nbJLRtTSNneCmczwap/QGpLXAGTtLShyDnkJkpYXilHddldINPN/q9r/MsWysn7lwwlKJsHVfcnkH3uKuR8+bjBtBL/7e2wZ8mNnPnYF7XKx42x5xIq/fvxwQJ28sNJdO7ZjDxH/yYpBFL2ecUtY3A6H1d6g1ZVdwWLQhGb8DxCHfvo72XXF9OUHp4Nia6Sw2nhnYJ2UvdT0w6Bxao7prLWcRIuxeLATWO5mPT5I+sQhZb5KAedMGVB9KT/gww6yubllxVkIQJ/Fr3pa9sWcCtbTSpuziIoHGRqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f39J1f54d22jlbm1nTCNDm0QvEkLQLSb0okXJ4v3uEo=;
 b=xeEUW6Tg9bcHBWELZDdddsV3B9LTeVx+SM09PtLhinwIH+7lCQbKZTUn4LwbWueD6lKyx+cjJ7oYrkhMUgas2cQuYFcgWfZgktaMNVqZFyMlhz5Dy10Ue15E/QHzGtlqU931ikQmwOw40xS0FxjWOcvxzTpXLLvLsJ/N1Pqj83KeNw/4D2lut4kPORffnzd2TKAiW73Ox3QadIV+HlFMn8fqGJBWPIH2Ty4zkVdZd6nqOcO3810fCbtHr7GVqrtPF+XfH8P0WMa12Mbo+A+Qv0hi+FD6c8Q3J/EjwkBdgNY/4gaRHBQyAYbALzAPKdj22dpxu7/YbciBkbYDN+WqZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f39J1f54d22jlbm1nTCNDm0QvEkLQLSb0okXJ4v3uEo=;
 b=TPSR/lcyTALFIy2DghfkmKEJnUlIxok8tbgMZxmlglO4HVSswEwIGvmgwuZNQ5xblPL56EA3+0JQKSlFdnEbXxy3sYGtcaOHth6gCwqhzOMWjik2wP78sIR3N/kWvZMbxdWrtnA2K7n2La2lwyG2y0GR7xZpe+9TpY4Gz140F7k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4feba079-aae0-4732-bfb3-5be6c1269e2b@citrix.com>
Date: Fri, 23 Jan 2026 19:25:18 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: Move NX handling to a dedicated place
To: Julian Vetter <julian.vetter@vates.tech>, Jan Beulich <jbeulich@suse.com>
References: <20260115151658.3725784-1-julian.vetter@vates.tech>
 <69b511db-654d-46b3-aca3-3f37f30d3473@citrix.com>
 <c4c2c376-ab6b-4bb3-9ede-091f791c1427@vates.tech>
 <335949fc-059e-477c-9b2b-ddcd2f144300@citrix.com>
 <4a38c2ae-dc60-4fed-b30e-81a02b657e92@vates.tech>
 <92c02d2f-ccc5-42ce-ba0c-076fdc75e1fe@citrix.com>
 <a8081572-4147-4761-87e6-abaacadacdfb@suse.com>
 <09d59ee2-92bb-41de-ad77-6b6c6bc44d6d@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <09d59ee2-92bb-41de-ad77-6b6c6bc44d6d@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0553.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS1PR03MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cebecdc-a960-42c1-c7d3-08de5ab52720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEZLWWd0dFZjV0tyaXV2VVBpZnVaRUo1Z2JuUExFQWt2eWxrcXgvZzdqWG1w?=
 =?utf-8?B?dmxINVRsVCtQQ0VPaXYyMVlqdFQxZDZzV3c3SDc2eURHNjZRbkZsK2xaeDFF?=
 =?utf-8?B?WFNZWkN3VmxjNU5PamtxR0tZQURSazNzVnVDOGtQMDFyTkRISHpMU3E5czlW?=
 =?utf-8?B?a1pVRThseVVnT1dmT0RDYXhCaStGMUVGcXNWTzF1SUJsU0VZVjZocUNFQURE?=
 =?utf-8?B?MG1GNGdZdHlxRUdYKy9JWUxmZ3lYR0p3SjVKYlhJai9aYTd2ZUxuWnVEdGlW?=
 =?utf-8?B?cW5zNzViZER0MURuck5wekIycGtEM1hmb2F6Z2VoSkpBSDFyeG42dGg2eWJB?=
 =?utf-8?B?d0xvQXNNb0VVbUQ0eWNaNGxXM1pyMXNRMG9ZZmpJR2ZMUTBweksyb1lDdHpQ?=
 =?utf-8?B?VzhPZ1pLdFVQanVWZUg1azIyTkp3MU5VQzN5UXZnU3BXeUNCTFlGTUtvZzND?=
 =?utf-8?B?NW9VYlFLakwrZ2Q5N29sY1czZHgxRnJ5WmNmclBKTXRyZ1dYazBldFVmcXFS?=
 =?utf-8?B?TUVlbzJyaVBBZUtxaVJSdG5KRnJCRDNNUW9kRSt5U3RQVFpCTUdoMCtZdjlG?=
 =?utf-8?B?ckpicjY5b2FEMEZVVFlyWkZlc2NPTGVZcEJjOEFPRllJSjR3TkppWmRpWFdp?=
 =?utf-8?B?aU0xRmZXamZRZGl2cGtuek5Xdko2RzVQeVBuTUNacTVMRUhDY2NlNnpMOEw0?=
 =?utf-8?B?ekdqWmhNdUNjTks5ZDhvSkI5MXp5VTh1T0Z5MnJhTm05bWhrQURvRFpjOWhZ?=
 =?utf-8?B?QlRob1ExZXQweThNUm5UOW1PRmZwZlR1blprdWZ2WldVS2t1OTNLdW1ORlRn?=
 =?utf-8?B?Nk1MWXlKV2R6WElqQVBTZlBJOWZGUWRQOFFIb3dpTE1zWFFsS0tNTVV1ZDAv?=
 =?utf-8?B?ZVV1by8xY09QNDNtdVNuYjJPRXFhcmRLV2wwWDVrSUo4REJpYW8vV2MzTXpm?=
 =?utf-8?B?UU0xVWlqNW0yY09kTWx2b2Z0ZUtHMkxyM0NFRDRzK0NsV2tYNzZwSnhHNkw5?=
 =?utf-8?B?SElDZFNsajNQaWhTekkyMDloWXpoMnhDcXZtYzFGaVZmV1BWMlRpZmp5OUw1?=
 =?utf-8?B?eXZpTVowQVgxd3pUU01pelhVSUtYcDhSVGE0YkNydVV0b0R2VFMrTFg2NTZ1?=
 =?utf-8?B?M2o2Myt6dXhLckh5eklrMXhVZDdPeVpSZ2FCaC93dDdtUFVJck1XaVl2QjJl?=
 =?utf-8?B?UzJVL2xJYmxyS00vcXVuSXFiK2g4dmFtZGZwcGFwd094eE4wbjFFeGxSeFlK?=
 =?utf-8?B?ZWNjWVdtWUJEUWNKcmJsdEdXUjVEZENkZ0pRbnpKVXQ5Tklia2FnVUg5YzZD?=
 =?utf-8?B?blRaVHRWM1FSYmNRMloya1RWaE1OVGFFQ2c1QUR3MjhVS0xtWXFwTkxBUFZv?=
 =?utf-8?B?eHhTbnBnOVJBWitNVDJ6cVhtVGRQZXBxSGZpbGt1eUJWMVRCajl3RGNqazVv?=
 =?utf-8?B?SW8yK0thamZxZlBhbkxNNXBtZEEwRDlnczVTbGJkWmZvZy96bzVydlpoKzFI?=
 =?utf-8?B?aG96WVl3d2tDc1FoaWJEWnJTdFQ0aGk3YVpXalJqVGgzNStmQjU5TkZ6RHlQ?=
 =?utf-8?B?d3Ara28yWk9WMzI4R1p3K2krVzhZMnBkaUhNVjlyNDBoQzl6cGNveHl0NW5T?=
 =?utf-8?B?S3hxV25jUlNjNStjeGRKR3B1S2ZWM2NFczVlNy9uRCtqUFlEQU1XK0N5WXpw?=
 =?utf-8?B?NEhkNjZNclhIVGwvOW1Lcm1SKzBWcEFqdWpqelIwdU9UcXRsNzdDODA3VkVr?=
 =?utf-8?B?Q3BWNEJMSHVIUEphYWduaFhud1o0cHkzaXNOTXFnNFVrUXlUOVNWNm9ORm0r?=
 =?utf-8?B?Z2NESFZxRm8wcjVpWmx0dytwMC9XaGxPeVZJcnFJclljR3EzSlFDckpNQmUx?=
 =?utf-8?B?T2hkYW1kUE1ZSDNqdTlaMk1SLzczdVMzTFgvTGRvZ0NaK1kyeFo0NXVuZGdu?=
 =?utf-8?B?UHN4eHhKNk5pR0RmWSs3V2N4em5KT3VLcDI2cXhmeExrRjVQQ0RQWVJWNGFX?=
 =?utf-8?B?cUFwZjVVVGJRQmhpVzd4WjNlaG16YXltZlRhNDFBRzZ6bU5YcmF1RFMyTnBu?=
 =?utf-8?B?Q3lwcGsxYnRockkwbGVEL1VOSU5nRFJYTEhIVDhFNmJJU3RWY1pOWjFvaHBN?=
 =?utf-8?Q?IilE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmFObzlwQVpwOEFqaTlnL3VkMEFDZTdvaEE2aTJIeHNOTTZRamV4VndkQkpi?=
 =?utf-8?B?dnlEQlQ1d2ZRcjIzbk52SS9qZG5mYXhaMVM5TXlpWWgzcmxWTCtzV0VENWlH?=
 =?utf-8?B?WjBaeU5uRHMxOVA5OTF6THRVdlB0NEJlaHRDcFVET1c2VnIwT1I3dUV0c3Ns?=
 =?utf-8?B?MTRHNUV0czdZV1VIZGRxNENwZERtUU9iVE5VV04vQWhHclg5S0VSbXROWi9R?=
 =?utf-8?B?RVlFRmJDdndHd2ZEUnUrWkhXNzJVNzJBRytjQTRDL2hwQlFHb1JvUFhLNnZO?=
 =?utf-8?B?Qk1mQ0JQV3hXbGZoUGcyVUFIbjZLRmxZblYvNi9KRWhuYXRQeS9WQVFRVndO?=
 =?utf-8?B?NXhwQkxzUDZSNFhqYWh5cEN0YjB6TXc3dWNhY0FhazJVNitLUm5XeVBwbzYr?=
 =?utf-8?B?RWgzS2RYb0ljU2tURGFVbGlMMlkyZWRmeXFKMVdjL3FoMFFhNDZwUTN1VkpB?=
 =?utf-8?B?cTlBVUZEbTVRRDBOclhieW9kWnd5TUx6T2Vlam5mRm1DVjU3dW1rb0NaZDlu?=
 =?utf-8?B?RERVelJqaUdQT01vak83S1c2STlrb0R4dTFHMmttekpZQnA4bzBjSndKUTdX?=
 =?utf-8?B?WGJxRCs4djBvWk9jcy9FSHBJOGN1VlB4bzBJcWNWVW1FU09tZVFSREp5VEt6?=
 =?utf-8?B?QzhxTHkxZjZBU0gxcTVRZmwvZDJhRENFaWczdnIwY0FuMkx1czVET1A5dVpr?=
 =?utf-8?B?Njlna0hsTU0waUE4dEQ3b0VWMXVUb0l2SVo2a1N6Z3VFVW12WTg4NjN2SEhN?=
 =?utf-8?B?d3puc3pTSktvWjRwc0lScHVrdWNkWGEyREtObHhKRjk1M3EvUUdNMFVqTE5k?=
 =?utf-8?B?VVpaMnBXdTAyTkdwZGRzZWQ4WTFiU3FrK1RXOTZBTHFVdEViYlhVVE9HaHRz?=
 =?utf-8?B?clE5UE1OdHBNZG1uWkFncXc3aUJKdmhOaEVhZW41Q3RHM3BOc0t1eStYUk5Z?=
 =?utf-8?B?bTFZcVVub25sZUo0S0JHaU82eTBmSzI0Sm1MT1QvUUFGeUtKRGFIQVFPaGNQ?=
 =?utf-8?B?ZmF1dm81TnNycXpGcnVYc0JZMmZ2NC9lcjFaVmJBQU85dlZlYTdHQ0Q1VXQr?=
 =?utf-8?B?aHB6Mnk3MC9tQlVxK1crZ3VHTWdHSjhCS1lUakJUTVJwUTd1Rk1DNGlnUWdY?=
 =?utf-8?B?bEtrcEh6RnhCNEw3Tk9JTE04MStqOXI0Z0R5NHNrSmpPWnpuN1JyRjhUTi9i?=
 =?utf-8?B?V1NobVFPVHZXME94dWNWOXFrci9qTmpUNXFUaGl6VzRJN28rV20yZDM4YnRz?=
 =?utf-8?B?VEUxWnpwL0dhdUc0ZkdLUXV4KzBmS0VxNGFkMEdFVVpTVnhLTWd0UXpyMXRV?=
 =?utf-8?B?WWN4a0JJcW4wN0J6SWtFWE5jQlZTYVQxVWcraVN4Z1EzcDBPTHBKTmVvUUFz?=
 =?utf-8?B?WE5lNWhjOFk4RkwvdTNETXRpcmxueUJsWWloeHV0c0FHMVljZFZUeXNJR2Fp?=
 =?utf-8?B?VUhTc1RqRnY4ODlYODFIdmVYbUhKM0tMSEVhTmtsc0tobGV5WXZsYUZYV2dJ?=
 =?utf-8?B?T0xwWVNMYWQzMXNObHVUN1JLTmhVajZBR1N6TldMbGMvTjlrd0tXdGZiVDA3?=
 =?utf-8?B?c0dYbXh2aGdYK3FOUVZkSnkzekxCcEp6MVR4anhKam5LVUVEczFtQ0VNbml1?=
 =?utf-8?B?ajdETVMyWWM1TS96VUgxTXFVK1h2OEx0Skc4ZVc4MkliSFlEeDhQempBSDNR?=
 =?utf-8?B?MXZaa3hYUWc5TlZKR3ZnOG90ejl6eEVLNVkzSVM2K2xTWnZNVlVyQlJZUVNH?=
 =?utf-8?B?bi85MjRrV01RQ0ZMWEJZWDhiTENMUDlKbDR4VDBnK2ZDSjBYc1BqN3gvZGdn?=
 =?utf-8?B?bjdLUnZwTWhvOWxoYTJqZDFWQUpuMzdOb2hRSjErSXZtSzd1VmdxeGlmNDJM?=
 =?utf-8?B?R2ZZeXI2cExBL09mNEtENUprOG1KN1loeGtycEhmYWxvSExtNllYcDVRakVP?=
 =?utf-8?B?UXZMeVRxMVpsU3N3OE5jSHkyV1N4L2tYeC9KS0J2TUM4WUpZRFBIcE90S0gx?=
 =?utf-8?B?Vzh1T3hHeW9OTGluemFFZGozbGs5djM3cDR0bjQ3SWF6dEFrSGZWRk5HVFE4?=
 =?utf-8?B?bE0wc29TU3FYMXVWVUJsVWNvSnU5SDNPa3hJTlo3R3BxOUNFdnNzSlZqd2lI?=
 =?utf-8?B?RThWSzkwV3FuYWkxU3dVSytqaWRhTEVrcmU4T3d5VGY0TWFUM0FMWGliaFI3?=
 =?utf-8?B?akNON2JCME9kUGhEK3VNcnN1TG8zRko2OXBEN01ZWGpFWkJDRUtIaE1mbE5H?=
 =?utf-8?B?c3BVYzdhVytPL0t3R3QzdFR4MGt0NVFvVmZISUZyaG45ZXVKdjJsUVVsTFB3?=
 =?utf-8?B?eEl2azR1L0dkRXR5a0tEaHIwVllyd3hhdnpGcDhtVzlSeGZaTUtXTFRmeHc3?=
 =?utf-8?Q?CKX4/g9dzAt75L8w=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cebecdc-a960-42c1-c7d3-08de5ab52720
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 19:25:22.6170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AM8W040CeCkMTAZG87WZMr3iqB+3sdhhU+w02p8TQlBtxM/V9HkMeF1yHxQ2KNYOSHPN+HGKe7yJ3hNDf3IVwdHCrZw/bbyel1QBoDF6K9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7870
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:julian.vetter@vates.tech,m:jbeulich@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.942];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8BD997A232
X-Rspamd-Action: no action

On 23/01/2026 3:31 pm, Julian Vetter wrote:
> On 1/22/26 15:11, Jan Beulich wrote:
>> On 22.01.2026 14:57, Andrew Cooper wrote:
>>> On 22/01/2026 1:48 pm, Julian Vetter wrote:
>>>> (XEN) Early fatal page fault at e008:ffff82d0403b38e0
>>>> (cr2=0000000001100202, ec=0009)
>>>> (XEN) ----[ Xen-4.22-unstable  x86_64  debug=y  Not tainted ]----
>>>> (XEN) CPU:    0
>>>> (XEN) RIP:    e008:[<ffff82d0403b38e0>] memcmp+0x20/0x46
>>>> (XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor
>>>> (XEN) rax: 0000000000000000   rbx: 0000000001100000   rcx: 0000000000000000
>>>> (XEN) rdx: 0000000000000004   rsi: ffff82d0404a0d23   rdi: 0000000001100202
>>>> (XEN) rbp: ffff82d040497d88   rsp: ffff82d040497d78   r8:  0000000000000016
>>>> (XEN) r9:  ffff82d04061a180   r10: ffff82d04061a188   r11: 0000000000000010
>>>> (XEN) r12: 0000000001100000   r13: 0000000000000001   r14: ffff82d0404d2b80
>>>> (XEN) r15: ffff82d040462750   cr0: 0000000080050033   cr4: 00000000000000a0
>>>> (XEN) cr3: 00000000b5d0e000   cr2: 0000000001100202
>>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>>> (XEN) Xen code around <ffff82d0403b38e0> (memcmp+0x20/0x46):
>>>> (XEN)  0f 1f 84 00 00 00 00 00 <0f> b6 04 0f 44 0f b6 04 0e 44 29 c0 75
>>>> 13 48 83
>>>> (XEN) Xen stack trace from rsp=ffff82d040497d78:
>>>> (XEN)    ffff82d040483f79 0000000000696630 ffff82d040497db0 ffff82d040483fd2
>>>> (XEN)    0000000000696630 ffff82d040200000 0000000000000001 ffff82d040497ef8
>>>> (XEN)    ffff82d04047c4ac 0000000000000000 0000000000000000 0000000000000000
>>>> (XEN)    ffff82d04062c6d8 0000000000000000 0000000000000000 0000000000000000
>>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>> (XEN)    0000000000000000 0000000000140000 0000000000000000 0000000000000001
>>>> (XEN)    0000000000000000 0000000000000000 ffff82d040497f08 ffff82d0404d2b80
>>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>> (XEN)    0000000000000000 0000000800000000 000000010000006e 0000000000000003
>>>> (XEN)    00000000000002f8 0000000000000000 0000000000000000 0000000000000000
>>>> (XEN)    0000000099f30ba0 0000000099feeda7 0000000000000000 ffff82d040497fff
>>>> (XEN)    00000000b9cf3920 ffff82d0402043e8 0000000000000000 0000000000000000
>>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>> (XEN)    0000000000000000 0000e01000000000 0000000000000000 0000000000000000
>>>> (XEN)    00000000000000a0 0000000000000000 0000000000000000 0000000000000000
>>>> (XEN) Xen call trace:
>>>> (XEN)    [<ffff82d0403b38e0>] R memcmp+0x20/0x46
>>>> (XEN)    [<ffff82d040483f79>] S arch/x86/bzimage.c#bzimage_check+0x2e/0x73
>>>> (XEN)    [<ffff82d040483fd2>] F bzimage_headroom+0x14/0xa5
>>>> (XEN)    [<ffff82d04047c4ac>] F __start_xen+0x908/0x2452
>>>> (XEN)    [<ffff82d0402043e8>] F __high_start+0xb8/0xc0
>>>> (XEN)
>>>> (XEN) Pagetable walk from 0000000001100202:
>>>> (XEN)  L4[0x000] = 00000000b5c9d063 ffffffffffffffff
>>>> (XEN)
>>>> (XEN) ****************************************
>>>> (XEN) Panic on CPU 0:
>>>> (XEN) FATAL TRAP: vec 14, #PF[0009] IN INTERRUPT CONTEXT
>>>> (XEN) ****************************************
>>> Huh, that means we have a bug in the pagewalk rendering.  It shouldn't
>>> give up like that.
>> Is it perhaps too early for mfn_valid() to return "true" for the page table
>> page in question?
> Yes, this is indeed the problem. Thank you Jan. The mfn_valid() doesn't 
> work yet, because max_page is set afterwards in __start_xen. Here is the 
> actual translation:
>
> (XEN) Xen call trace:
> (XEN)    [<ffff82d0403b3820>] R memcmp+0x20/0x46
> (XEN)    [<ffff82d040483f79>] S arch/x86/bzimage.c#bzimage_check+0x2e/0x73
> (XEN)    [<ffff82d040483fd2>] F bzimage_headroom+0x14/0xa5
> (XEN)    [<ffff82d04047c4ac>] F __start_xen+0x908/0x2452
> (XEN)    [<ffff82d0402043e8>] F __high_start+0xb8/0xc0
> (XEN)
> (XEN) Pagetable walk from 0000000001100202:
> (XEN) Using simple walk without mfn_valid
> (XEN) Early pagetable walk from 0000000001100202 (cr3=00000000b5d0e000):
> (XEN)  L4[0x000] = 00000000b5c9d063
> (XEN)  L3[0x000] = 00000000b5c99063
> (XEN)  L2[0x008] = 80000000000001e3 (2MB)
>
> And I also found the actual issue with the code, and why it fails in the 
> first place. Somewhere before early_init_{intel,amd}, there is 
> bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size), and 
> the 'bootstrap_map_bm()' maps the new page with __PAGE_HYPERVISOR_RO, 
> which has PAGE_NX. So, not sure how to work around this.

I'm working on a cleanup series to untangle the mess.

~Andrew

