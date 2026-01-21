Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF5PHve8cGkRZgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 12:48:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67995639E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 12:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209642.1521580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viWfw-0005F6-0l; Wed, 21 Jan 2026 11:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209642.1521580; Wed, 21 Jan 2026 11:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viWfv-0005Cb-UK; Wed, 21 Jan 2026 11:47:03 +0000
Received: by outflank-mailman (input) for mailman id 1209642;
 Wed, 21 Jan 2026 11:47:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GdGN=72=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viWft-0005CO-Sm
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 11:47:02 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e561d388-f6be-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 12:47:01 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5536.namprd03.prod.outlook.com (2603:10b6:a03:28a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 11:46:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 11:46:57 +0000
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
X-Inumbo-ID: e561d388-f6be-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpDqEZU8GEwecuPeEZ7Dw6LN4jSazb5mxEBJuu8CG6qcJhW3XCozzM9AtGH8BHCTOc6I7lCdMtKsVCAnjNf2+59jqaPGKUW1qEVqAQMWyqmDdwMWmhNsDE4aHEpAeg7Q00YE8Z2G3b7hcR4tcGGn/EUijsdI1Mix3H0tzwE3SJKazei2EXB/Q/bx7KIyVPWElp+rRJwjZSz7CJCiSlrqdE9TogNfYBKQx1Ud2LiIwP9rAxYOzFKeutNqSG3ndCNzv6BnvPwLKe082K2iX2Tq7QqikOepmretijYKdQfJ+/m2dYqiNigWN/VQorHuPKjEKzBXhIbgTL+eILu8CZo8Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZ4bFcGFTRZHAmeK/YLqceUf8iIRLY9rilOKREF96c8=;
 b=yQ9UmO6BylDc5H+J5UMyn6fmVMWTBHV2OcoAPIyg6u+iuU/cNXql63CAocrTo/o21lfYG1MJtTRHSsgz9xY+X6NVMB8hPnyRZlRASZ3UsB6lgnDN2kYNWDN8u25u1oYB2Zfl2fAEO07qdB3EMmTVM292O72KzIcvW/58EsBA7z0RdSHdViuqnFiWhSK0yBn3SBLgZgkeuUrGKnPsxi6fsBFqDticwOkfLktv3kEJoKCNtiOVGXyhkDJbQ87KULiWzYNZzLD+UpoBQg6sepZUS99yZVGD6/KKBGAzSEs5K6zoSJYZL8GxInYHwig86oWkFBBmGKg/y8r4JaVLeik4zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZ4bFcGFTRZHAmeK/YLqceUf8iIRLY9rilOKREF96c8=;
 b=lo8AutfZa8/zj16vwkokXSSVWaPhicjh9ybw3XBb0rZoQOQvOe9Kw24Y9ADB0gxpN70ubqgpfNulwVDBQs96b5ZZijnpjUE8HZc1HgJHuSkGgAI8ZpDvtDR55Tgs2Lg6g2kN5XhHMDStOy8AgId5xgWqQmgeqIfmS7pSGoNAZiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a7b124a6-6d92-4713-89e5-f608de7ec45a@citrix.com>
Date: Wed, 21 Jan 2026 11:46:54 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] x86/amd: Fold another DE_CFG edit into
 amd_init_de_cfg()
To: Jan Beulich <jbeulich@suse.com>
References: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
 <20251202105710.1472927-2-andrew.cooper3@citrix.com>
 <55f40e49-027b-4162-94f0-54573fb1abc0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <55f40e49-027b-4162-94f0-54573fb1abc0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0698.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3bfbf7-2ecd-45a5-08c1-08de58e2c825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHB0eVhqWFBKejhtM1Z5M2JKZWZlUEQraUFSU0xjUFp3UzJEdUlpWGRMVEpj?=
 =?utf-8?B?eVRUckNMelFQTUUwVnQycURhN25pV2xyUDFpZndqaElZQ1Y5K0MyeFpBZjhp?=
 =?utf-8?B?a0ZkRmw3ZFhmVTd4MjNjcjVJZGhmVWN2bFZQSVBoOCtHODJkTVpjRDQvTmF1?=
 =?utf-8?B?R2ZBS3FNOGd1MDAvZVczUjhSeHowVGFPbVZxcU40eitTNWF0LzNkR3RXMTRD?=
 =?utf-8?B?THEzK0FtSjluWnQ5VFg0TmZ3Y2NPY29nSkwxTlVoTFZtZ1hpMWZ2MTJmcmpv?=
 =?utf-8?B?TmVxV2FjMi9WQWZvS1FQZmpPeUtpWG5KUkgyT21SVWZJeVllNzM1YUpCL3JV?=
 =?utf-8?B?LzM0cVpvVWtpcWw2a1AzNVNTMm5Ga2lkbzVNa2NJMlpvdWNJWVg2M1JyUDBG?=
 =?utf-8?B?c2lyekVWS2MyWm85R2x4SXV4b25ENFZKZWcrNHp5UEZ4aGg0NFFQSnExYVRt?=
 =?utf-8?B?KzYvYzFaem9zWFg3MGFtUWZBNWwyTEM4R1VMSU1oWHUzV1BqWFZ0ck9UcHA4?=
 =?utf-8?B?M01PVGk2aDl4Y3pMdjFJK2FzcUZlZ3FGWi95TVdWaHlzUlBvL0FyWUF2N0x2?=
 =?utf-8?B?VGNuVzA0Ykc0WkRSMXZGVzVTUUQyV3Nub0xVZVViYnRaenU2VVN1WUFpeGha?=
 =?utf-8?B?YU1rVFNMcEVnU0JVK3VybTVIMlVVdVNKZXYvdXpwUWlXR05LcDYvVTJmSVA1?=
 =?utf-8?B?cEV1UzVBOWhGZklCRG11aXl3UUFtU1VPUzQvemoyd0xqS0pIUnczaTduYW9G?=
 =?utf-8?B?NldiYlMvblVGL2pDcmsrOHNPckFmTU13b05hM0N5bXM0NXQ2b0dLdUdiMmhW?=
 =?utf-8?B?bkJjRWxQYWxuK0VXdDdmelozc0U0cUVnckFFUkZSeGFnRE56djhIZTRVWEpH?=
 =?utf-8?B?UUQrbGFqU0srRjdZcW5CM3NTR3ZXbVNEbjEzL2d0S0RuZk9DbnBNVUVHWTcv?=
 =?utf-8?B?czFIM1AzZXkrOW0ra09OaXZ6U1dQbWZDdEd2MlFoZFJUeDBudU8vZmE4dHFy?=
 =?utf-8?B?bXFaclpHdnNYR25oanA0WVpiU3lHUWU0TnVieGJ3U2NnMEIvTlFlVGQ0WHoy?=
 =?utf-8?B?Q0ZTd2ZYckdoYmNWTUFTYTlIdXQ1RnFnS1lBR1kwRFhnM2xRMTFkSXV3bW9D?=
 =?utf-8?B?OWkrZlJVYWJlU2NzYk9VVHc1RTgwQThHcE1XemxEekR4MlJnVncvZFM5VTVo?=
 =?utf-8?B?bkZGQ0ZtaGFhd1B5cGFtcHlVckMweDN2a3grRm16cStDN1NjWC9ueTJvQUhY?=
 =?utf-8?B?NFdXdmd2Yi9yU0VPZE0vNGR3OStycVIwUXVvcktsQ0krZkJxT3FYbmlMWlhn?=
 =?utf-8?B?SkxuLy9jcUlrSDFUN1RGR05yQ1RZUVlXRDM0REp6cGZPOUpLcy9vMWh4TlZn?=
 =?utf-8?B?Qk5YNkkvS3NKY1dwUEVHUHhYZGkvYS8yait3UWMwaTA1Q1hxU1BJN2FPdTNh?=
 =?utf-8?B?UGVRVXNhZnNSQVZudTdrOW5sd3g1bTJtTG9mRWpmN0taY0RheU1jTXhCKzRS?=
 =?utf-8?B?enViSm9Vd085Tk5tYW8zSW9yUEpLUDVNQW16MllVTWk3cGNOYktNbXo0T0xu?=
 =?utf-8?B?SU1vOEt5am9wQWtjdXpEZ3pZKzZDY2F4RVN3U3hWYjJaL3VVQWUvbWFvTEsr?=
 =?utf-8?B?K0tYNGFld3k5bzNiOHFGdXh4ZGYyVnQ5Nk1Pc3QzMTJrYTBKa0YvZkM4Qi9n?=
 =?utf-8?B?aVdOcVhYM1E3SGprWDF3SE41Vm1LZ2QweFJaeFNnYnZpTlVGclFwbE03U2F0?=
 =?utf-8?B?TFJaYXRKait1Y1JKS3JmTTVpbUloVjJsTDVMR2U5UjYyNWJQdEwwR2t1aDNh?=
 =?utf-8?B?MUFLZFpLUlN4bUg1aUJWdndtZmxMVWhXRzUwZVRDWlVnVnExalFvdk56Tmh6?=
 =?utf-8?B?R0lEK3pKamNoeHplenJXS3JiN2FpZzA3V043V0ZOVklIK1VaaTVUOWFmRzJh?=
 =?utf-8?B?SC9sUHIvbUxlMHpwSjREYnk1a2NkbFNxcm9meXAyNitPTDBIc295c3VhRjUv?=
 =?utf-8?B?TkJHQWd5Y0JZWUdsNHMzSDRLaU4xcjBQS0lCRkt1eEowYU16SFIxUGZ4cnNG?=
 =?utf-8?B?ZGJIVmRtaG9XKy9DVDRyN1dXSDZHcy8xM2NaNlZqZ3JtcnNtR25lRlY0VVFS?=
 =?utf-8?Q?XxQ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTdXalVBbS9ESkRFdExvTjNEM3d4TUxqQmlTeGp3YmUwK3ROLzZyT2dyaDNy?=
 =?utf-8?B?NVVQS2xlL3grVk10RWtGVC9EMGZPbGp1eXpkc1N3ckFXeUI3c0tvSkJIRVR6?=
 =?utf-8?B?dHY1WW5hWlowczBDNE8xVk80T1VqdDJEcHhpTlpnWk8xWFpRUXdvZWhyWWh4?=
 =?utf-8?B?czBONGZ4bWJaVERiNk5BZnNJWmhISG1SOWkrL2ViaWVHaUw4aTQ1UEwremxm?=
 =?utf-8?B?dEJUK0VpMHVZYjg2QXdKYzhLUWJBZ0NkYUl2WEx1aGk5dVFVWFc4R1Vub2RK?=
 =?utf-8?B?SzNkSGUzalc4UXdWQ0lVSFk0UmVyTzlqZjIwaE5mUDhGZm9wbXRWTWxRRGha?=
 =?utf-8?B?OGFGRmRuVkR1b0hzYWtrOGVvT3R4N1MrampmeHNaQVZFa2VVZGNOZFAyLzJM?=
 =?utf-8?B?NVVYcVZwbkZCaEJZYzE4NWF3MkhlMVFMYXAxYTdabS9IUHFxSG9qeWRxanQz?=
 =?utf-8?B?UjMwRHd3Y1pWKzUza0M5aU1NY1NIWGR2NlBIbEtzcXpxZEQ1R1lsRW02QytF?=
 =?utf-8?B?b2N0ZU1GYlpsN0w2aVpXV2diOG5oTUFWK3A3blBJQU5YMGZweWhYQjFSVklU?=
 =?utf-8?B?eEMrdkc0YTloTTZWZm8xMmltT3BTMjl3UXBib0lnL3RieDY1Y2FSeHBpU3V0?=
 =?utf-8?B?eVJtTjRucTlJVmRkaDdGa243RlpsNklzZjdLMVRLZ2w2S3RNNjdmeTFGMVVw?=
 =?utf-8?B?TU9BeTdublR5bm52ZVo4RklXK1VCQWlDN011NkJ1TzhPSFN0M29wYXJjbU41?=
 =?utf-8?B?TVo4Q0dQbCtkT3lCNWJyTlZRcFh5OVVFVXVINHp6Z3lOUU8xTFIwamJoL2Nx?=
 =?utf-8?B?L3JqOTVaaEVTQXdFWWdrZmdlZWFhOXB4V0NqQXhITDFLTytGNUVDR0lNa2Nw?=
 =?utf-8?B?ejk3b29ad2xWekhBOFZGWjJvQkt0ZEU1S3pneVo2cWtOUlRHKzVYeHRXR05H?=
 =?utf-8?B?UkRKbFNBZVZFdXl6aW1qNlgyU2t4WEZrV3dnRktzc0p0VUxxRDJvZ3M5d2h5?=
 =?utf-8?B?SDc3bUp5YXF1b3hwZnFWeWtEYmw4a1VhL1o0d25kajBTZkpMeDdsZ0JKazdQ?=
 =?utf-8?B?ejFwS0VwM2NoVUVadUZHaG9UbkFKVnA0bXFUc2xwU2NPM1JtTldiZ1JKclBs?=
 =?utf-8?B?UEZJa1l1STI5VEJhYkthdE1yWXBrbDZ6NG9PYnk3MHRjNkptNkVnMnBCR0Ro?=
 =?utf-8?B?b2NqSUg5eGc2aDNUaGtsdTVlZ08vK3RITmZqZ0g4SC94OGp3UnkraUhpd2NH?=
 =?utf-8?B?UXl0bVJtVXBtSC84QzNYak9UUk1GUTluMGpNSEtaa092WXdCRThlN0FIRVY3?=
 =?utf-8?B?N3ZHZmJRZGU2ME1KMjl2ZWJqMFRqQjEyaTF0TTRqQkdKcm5DeVhpZUdyeXdR?=
 =?utf-8?B?dzR3NjZRMW9Db2JWQWxUTlA5NFBnTGdTOXVLRTZUQm9aVy90cHBITzZJZk1Z?=
 =?utf-8?B?VFltSmc1UUQxdTlXdWJ2MmNVK2xwV01nbXhLTEJLZEMybUU4bkpXTklsQjFw?=
 =?utf-8?B?WUZEdEg5eUVjdmp0M2hqZEpNbC96MzA2UFAwOFFYU0kzQVZsVFc0SHN4UU5W?=
 =?utf-8?B?VGt1ODlWN1V0ZElGOWxxQ2V1RlBTejVKSEg2QmdpZTVwRWt5WGRwTUZYMWdU?=
 =?utf-8?B?c1NqOHhkMmR0QlpFTjdON2tuQkUybm5seDAwWVF1MWRPeHZQb0s5TENZa0g4?=
 =?utf-8?B?azNBaHFLdmUvVGRDQzZUMW1GRDFCeHMvSEJkYVk4NUpvSU1aSFdTTytUMUVP?=
 =?utf-8?B?bnJwWTA3UGh6OFJnUG1kUjJoRDljcXI0bTNtbjE1K1JaeWFZbGE1bHVYYlIy?=
 =?utf-8?B?emFjeTI5LzN4N296S0U4VTJCaUlwRG04NUhvZ1pvNlF3bU5OUWVETXg4S2pw?=
 =?utf-8?B?b2xETFRYWTlsdEh3WFVsQWtFVDVuV2JVbEpSVCtvZXpoV29vVGlyQnJhYytl?=
 =?utf-8?B?UFRjMEdTVUdsbDU3MlY3RmU4eWNOUlIzb0hRdnlUbjJBM3luYzJvZ0xtdFhE?=
 =?utf-8?B?VkFiK1Vwb29vZFJWaDhWTWtudWttc1hGQ0VFS0ZYa3dJd21haEw4Vmo5MUZm?=
 =?utf-8?B?MTduOHJlV1hUWjFMdEJ1ajdMdGM5U3dWd0kzUHdBTFBRdElDS2RxVk5oeHlQ?=
 =?utf-8?B?Mi9CdkZWeSt3V09QSW5WNjYrUjNKUU1nR00zUGVDWEZOeTVMaVdwbUVyUVg2?=
 =?utf-8?B?bzdEUXRVejdXd0pZT1QxbWxuVXJPRjZIZTIydnVHcnE2aDJ2MUNEbTVDME1J?=
 =?utf-8?B?d2xlVit1R2ZlSFhuKy9MZmtjcGpxaVZMY3hVMnBWWnZTYWFNMVRwRHdEakht?=
 =?utf-8?B?YmJoQjBPbWlGV2FpcEFJZUlvYkRLaXVNTXNnYnZIc3AybVA2K1ZZcjFpOFFq?=
 =?utf-8?Q?KYTcXTgonycpSBdM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3bfbf7-2ecd-45a5-08c1-08de58e2c825
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 11:46:57.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AAxAD0FimWSrcplLyYd8nTVI/u9yKTmaWz0EJhRMIR4w22SIITohi+Tj9RLdNd8j9boMz+Rr86QGkPK/9uN3DRiCEkXYyrDVVVo+Th40NKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5536
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D67995639E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/12/2025 9:17 am, Jan Beulich wrote:
> On 02.12.2025 11:57, Andrew Cooper wrote:
>> Fam12h processors aren't SMT-capable so there are no race condition worries
>> with this path.  Nevertheless, group it together with the other DE_CFG
>> modifications.
> With this, ...
>
>> Fixes: d0c75dc4c028 ("x86/amd: Fix race editing DE_CFG")
> ... isn't this more like Amends:? Aiui this wouldn't need backporting.

This does want backporting.

d0c75dc4c028 explains how it's buggy to have multiple pieces of logic
writing to DE_CFG, and here's yet another one.

It's only a latent bug because Fam12 doesn't have CMT/SMT, and this
property is not discussed, meaning that the logic as-is comes across as
unsafe.

>
>> --- a/xen/arch/x86/cpu/amd.c
>> +++ b/xen/arch/x86/cpu/amd.c
>> @@ -920,6 +920,13 @@ void amd_init_de_cfg(const struct cpuinfo_x86 *c)
>>      if ( zenbleed_use_chickenbit() )
>>          new |= (1 << 9);
>>  
>> +    /*
>> +     * Erratum #665, doc 44739.  Integer divide instructions may cause
>> +     * unpredictable behaviour.
>> +     */
>> +    if ( c->family == 0x12 )
>> +        new |= 1U << 31;
>> +
>>      /* Avoid reading DE_CFG if we don't intend to change anything. */
>>      if ( !new )
>>          return;
>> @@ -1201,15 +1208,6 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>>  					    smp_processor_id());
>>  			wrmsrl(MSR_AMD64_LS_CFG, value | (1 << 15));
>>  		}
>> -	} else if (c->x86 == 0x12) {
>> -		rdmsrl(MSR_AMD64_DE_CFG, value);
>> -		if (!(value & (1U << 31))) {
>> -			if (c == &boot_cpu_data || opt_cpu_info)
>> -				printk_once(XENLOG_WARNING
>> -					    "CPU%u: Applying workaround for erratum 665\n",
>> -					    smp_processor_id());
>> -			wrmsrl(MSR_AMD64_DE_CFG, value | (1U << 31));
>> -		}
>>  	}
> Are you deliberately getting rid of the log message?

Yes, it's basically line noise.

Most errata like this are not handled at all, and this is not overly
noteworthy.  If it were at debug level then maybe, but certainly not at
warning. 

Fam12h were rare in the first place and are museum pieces these days.

> And I assume it is deliberate that the adjustment no longer is done when we're
> running virtualized ourselves?

Of course.  It's pointless, and a readback would show that the write had
had no effect.

>
> Both imo want making explicit in the description.

I've updated the commit message to:

x86/amd: Fold another DE_CFG edit into amd_init_de_cfg()
    
As amd_init_de_cfg() states, it's only safe for there to be one location
writing to DE_CFG.  This happens to be a latent bug rather than a real one
because Fam12h CPUs aren't SMT-capable.  Nevertheless, group it together
with
the other DE_CFG modifications.
    
This removes a printk() which is not noteworthy, and skips the adjustment
entirely under virt, where the attempted write wouldn't have stuck anyway.

Fixes: d0c75dc4c028 ("x86/amd: Fix race editing DE_CFG")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

