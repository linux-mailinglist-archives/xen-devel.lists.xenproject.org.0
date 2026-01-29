Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMt3IUeJe2mlFQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:22:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE57BB21D2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:22:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216831.1526759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUmh-0004Ob-VN; Thu, 29 Jan 2026 16:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216831.1526759; Thu, 29 Jan 2026 16:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUmh-0004N1-S0; Thu, 29 Jan 2026 16:22:19 +0000
Received: by outflank-mailman (input) for mailman id 1216831;
 Thu, 29 Jan 2026 16:22:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s0QN=AC=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vlUmg-0004Mp-88
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 16:22:18 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad02c092-fd2e-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 17:22:17 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5944.namprd03.prod.outlook.com (2603:10b6:510:36::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 16:22:10 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 16:22:09 +0000
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
X-Inumbo-ID: ad02c092-fd2e-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLhj2O7dQqDlQRY/rL2L/EpcnHWzU+gcxv/gytFXfzVzrDHPdjmTCyuxXqqP6/Vj9jkp6YM6ft1MVRGn4hO31qs9+u6S8uciGW3gAF/HXB/ClNsauFosdczoeC5AqpQ40C1ugixUjtNFWn5yZ0KJHG5GpV487cGpVnCCE4TSVyMK9/44a2P9Zly6eFnsqgrKwuu7kKZHc0sT43odR1LMCNLqS8Lf/xtxCK4jojtPrkG2i248jFfcn+3807yhuYGS509fyc8YBxvOdA325Blz23ra96uEVjODhbM3I3zXC9JrKD00RfSNon/gDLGI5ZivDaectwDbSQklGXWDmSRmvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ld5kYGQhPjo6emeGrwZ+RbLe3jVXmNS36W6aS7UWsg=;
 b=BccuwZrCvPQ3xxLUIi3oehUSTYzf8V4KHoZXkiRJe3wa1EyP12XOCFbqi7GYrSvdhEa4MTcxAepgmDUJPLDoMPMPQ4X9AWpK1PCF4hynQEnK1J1JsrH/GuBXPns3cAf3JQKms943d0I86XjORF+lpitghcF9zSxlPo4UfjbFKQTx3e4Crs05BZvaOBlw8NzYcPHh+00Y/zCx3zMBmXlY1EAjLmH5MQojZxhtuIIY4CA0WZwdzdPHKza63Tx41vlinogqGQPsDDSgB5kHI6pcYRJVIDlmHYJ19cUfBGWS16GcJim//U1Jlej7xCv1/FpS0mQfHOIcAIOo59RBfO4SGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ld5kYGQhPjo6emeGrwZ+RbLe3jVXmNS36W6aS7UWsg=;
 b=z1I5CrAqhHangtFXLcMEzeAFGBzAyW3alATq/ZzOkj4scwFA14qtlVCV2NO+C7TsEQF0aH8famFPQftFwum2Y7qEzkNOJu2FCaUKHYTRs9PixZ2Bpb3ieAwriNvQtArMpEfcuxMT6WXJlDcjLbaaVoORu0yx1n1PJL+UIMcxNDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d7d76c7b-b34e-4b58-a8be-bb86ca3ed98f@citrix.com>
Date: Thu, 29 Jan 2026 16:22:06 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86: Always display CPU vendor string
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <8b50a689e549fd174d6c34dadc5df5c65711c615.1769694285.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <8b50a689e549fd174d6c34dadc5df5c65711c615.1769694285.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0029.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e90914-0d46-4086-1b4f-08de5f528d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmpIYVFQYUxqcXlsSFVnV1NPNzB0N3Exd29tMkpIWVV2MEgzdE1mdUExVDcw?=
 =?utf-8?B?S0VveTZaenJpZ0VaYUdDZFJ4QU5QR24rRkZ2WGJINThlTkl3UjAwa2lMcGJP?=
 =?utf-8?B?L3o3ZndwZ2ZZd2I0Szg3cXNtTGJXWW5SVzJ4bUQwWktRWjZvb1o0dVcyenQ4?=
 =?utf-8?B?UmZnTDkzcWkzbnVZenU0ZXl1b3llYzZWYmREeFhIZTlFdjFPSlBhK0pkTzJw?=
 =?utf-8?B?dGhKdWRUVU9kSnZHYzE1OHhNb3lVcEhOWFFlaDQxeFlLMlIzeXE4S3RWU0ZH?=
 =?utf-8?B?UGpqOHBlaFE3QlB3K1RYcmUzMU9Bck03OHp1YW9ZeGJrcktHeEU3OWxoQUhp?=
 =?utf-8?B?T09LL1I4QUR5YzdDSm5oWDQxclF1SU01LzNDMUFGT3dLa0RyWDhLYUJFSEcz?=
 =?utf-8?B?TDFFYkNVdmo0emRQRnZvRVZ2M2lsakFJamozT3lVSkQraTNubmticDRGbDhN?=
 =?utf-8?B?elFLVFpEUWUxbTNhdHlwTndyc3c2T1NVemNPMmRmQ3k4eC85ZWJ3UXA4N2Y4?=
 =?utf-8?B?WmFoN3pPNE5wZHVoeEl4dzN4V0FXU3VwSTBsZGxXZTNYRFNWNWd0d2xuNksz?=
 =?utf-8?B?bDRiZnJBVEtMWHg3SFJBY3FaMEJacjVweTg3NEsydU9PeDJiNlRDU1dYNklF?=
 =?utf-8?B?NGhsNDVYZk5pZEE3d2FvVlRXKys0c05xRHo2ZWd0aFpuQ01uOEx6K3BBSXcz?=
 =?utf-8?B?aFYramRqMEs2MlR6aDI0VDhjb29ub3FhZEtDbEtsK000TlRtQWtxWER5NjFY?=
 =?utf-8?B?MFR4ejBkalJ0dmwybXkxOUN3WXkzbENPWUZZU05uRi9SWkxRNUs2Ym5tOWp4?=
 =?utf-8?B?RzJUc2ZoN0RzNEdQQ0hxMW92aTM2ZHExQXB0d2MvRVRJLzlFWGFBZnRiQUFt?=
 =?utf-8?B?dTV0L0J5NGRiajNIZ1RPYklrSDcvTGtLRmpSR1ZDNHhpQ1VRNy9PK0RwbXJI?=
 =?utf-8?B?aW5LcHdYU1Y4K1VHd0c1VkNxL3JWTnQvYWFsa2JzeldLaFVlMnBodDdWWC9Y?=
 =?utf-8?B?UkpKN04xV2lwZEdXdGlGdHdmTE5nVlpYb21NNFVQYmNMNnRXamtkRmNtM3Nt?=
 =?utf-8?B?U1BXTEdaTUcrdk0vMUh2WXNNb1l5OE5MMXVCbXVDcTRVb3RoZU81bnAxRDlZ?=
 =?utf-8?B?VlBhZ2tLdVpVZzE5OU44S0pZc2dhVkF5MnI1S0EwY0prZWN6TzF5aGtNYTUx?=
 =?utf-8?B?b044WWptZEM3eVFFL0VZMzVrdmp6WUVqQkg2QXlldSt6VkFSZ0VaNGtubmxm?=
 =?utf-8?B?NmxrWmVycXpqSHhMOHM3bWtjWXdMakxEdlNIdjBJM2d2a2xtR1cvU0hyenUv?=
 =?utf-8?B?S2t3WXg2UDNOdVNzNERoWm5qK29OY1hWSGlhL2tuU1dpMndhT0o3bEltVU9K?=
 =?utf-8?B?NENOT25yNGlwNGhQMVFVUVZDelNJYlU2WnJLaUplWU00aW93RkVPd3g5MjFt?=
 =?utf-8?B?NVdaSEUya1FVMzZVb1BEaVUzSnJiMHVyeDBlS29SdC9FbFNOa21zelBIYmVu?=
 =?utf-8?B?TllBaU1nbmJLblJ3cysyRUNzc29TK3pIOGFHekc1ZU1rOGV0TlcwZ2IvT0o5?=
 =?utf-8?B?VS9WejRHd3ArTk1RR0NJcmFtMDJSUFhZdjBaekh2SUk1bjdjT1c2SlV6dnR4?=
 =?utf-8?B?bXFsS2tEWEYvZ3J5REJMVE9YMS9tM2pQV2hoa3E2RXpHSVg4QzQ0c2RDSXgx?=
 =?utf-8?B?d1ZPR0xXSDhNaVU4cGZ3Wld0Q2pYQ0E5YWM5TEk2TWdhQWcxeGpZY2RPZXcr?=
 =?utf-8?B?b3A3bE9nQVRBWWhRcXBCNnl1K0p6SkZ3UDNoM1hPZDY4bDZHVmFSM0M5bThU?=
 =?utf-8?B?clZvTTZYOGF1UUhUaUNPRUNzZzZMREVTNVdVOTlrVWsrdUcrUk11NnZqOThC?=
 =?utf-8?B?NE5NZ09LZjhyei90b3F0OXpTWW1ONEVJbWtHK3Jtdkg2TmhnRHI3Z3hEb1pv?=
 =?utf-8?B?TkpQZG5mcWRzSTRNN0Iyb0lyR3pZWlhFa2xDR21TK0lrTmt5NTlYb1ViQXJq?=
 =?utf-8?B?RWZQWmtSRjBYQ01CdW5lU2huRjNRQW9vaDkzSnlNbThkTkFWVGM0ckcybjQr?=
 =?utf-8?B?THlNTHFISE1yRlFXZWlqZkxWeEdDN0ZhRFNWVE1uNkFuZHRkekdzQVFzRFFy?=
 =?utf-8?Q?/O1w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0xrMk5CMWlDeGx5VG5mVzBEODM2dHNUWlZKcmwrNkxWMmNmMEl3cFkzZEdD?=
 =?utf-8?B?ZW5QRXdKSGE2SHBPTU5KZ3hBWklNRXd5N3R1ckFGcWlwd1lQeWNrMkJTYXFl?=
 =?utf-8?B?Y1gzZUFzWmI1YmRja3hieG1ueGxGWHJxYmNrcG9kR1BacGxaWXRKSFpDVExH?=
 =?utf-8?B?Q1YxOHN5eiswbEVLclBKRWFEWmlQSXU4TEpSRC9MYnpwQ0FaMEVGTnZEK1dC?=
 =?utf-8?B?RTNoU0RwOHRsQTV3VVU0emhGcVJYbHFBbWpBUGkwK0FiczBmVDBEcnhiOUo4?=
 =?utf-8?B?K0o1NVZwQjhnb3hUSWVoYVJZUGNnYW8rWGpCY203M2lWWnBoMU11dTJKeHhz?=
 =?utf-8?B?WXBzcHZ0ZmdtYWRESXNxcW9HOTVpNFNCRmhqbVdFZ1Bmbm1ySmg2K1pjN1dj?=
 =?utf-8?B?b0V3N1ZvUzQyRVU5cHJFZEdpNm5Xblh1Q2FUTzRKZmFlZy81eTZSU3Bza25v?=
 =?utf-8?B?YXBLdU4yT2M1aFJmeFBFdmpqb0d1cFNFWENPdFRESzJpYmJZSnFrT1QrdXh6?=
 =?utf-8?B?aHNXSlpnUVRxeElkay82NkhhS1cxRmV3VUh6Mis2N3FwdkNEVHA3YXBqcEUw?=
 =?utf-8?B?UFNESDVNdklncldjQisxdHB0Q2RRY3d3R0ZiQk5CaWhveFlJS3FseGVteGQx?=
 =?utf-8?B?TzVHNVRzZ2R4czloYlVLNHE2YzVpYlRWb1RVMnl0TGxoUVJDVTExbk81R3FX?=
 =?utf-8?B?dEVqLzJpalh3QTZPcmlkd3FwU25STzNKZkFrbHozOVE2ZTJuWWVlRzZ4SEpZ?=
 =?utf-8?B?dUM2TDM5SzhyZG90bWpOWGMvdzFKeVZ5VmlXcmhWSlNJdkoyeGIrN29ibDZx?=
 =?utf-8?B?UFk5RWN1NHFsdmN0S0hzVFBFTWo4b3kxcFNmTXZHYmxIdVVnRFlyc0NMNHU1?=
 =?utf-8?B?Sk53TTB4RkJaM1gvbmdFSDh0S2QwMGY4WVluREJxREVHQXF5eXFmTk9oQ3RO?=
 =?utf-8?B?M3VzT3YrcjZ1Z1hlUk1HaFZhMGdDdzBpMzM5NW15cjBCUjdzdjZ4R0JucklX?=
 =?utf-8?B?dSt6clQ4aklxZXo0S292STRJUHhicHNoRjRvWWF0WkZ0bUlNMXBiRU1OcU9s?=
 =?utf-8?B?bTBTOHoxMVlsemdJUWtPUmxjUmhaRnVLY3RNajVDSWFyV1RFUWI3Qk5RLzAz?=
 =?utf-8?B?VWFvMW5CUlhCM0h1d0RMeTg2STZWODlQYU1FbWVJdkU5d3NFcExNR3FTcUF3?=
 =?utf-8?B?alpYcmk0R2Zwc0kvVlIwRFRZY1lqSGNNNmw3R0F4V0pYRXZNeDVJU25JbDM2?=
 =?utf-8?B?dGVCQURuWlNqbjBNeGVmcUtEdWs2QUcvSmkwYkNnT1RRSHozS3JxczRPZTNF?=
 =?utf-8?B?Y3dleXNUd3ROblUwNVU1cFVFS2Z3cERSQXJxVDc2VXpMRDZVRHJHTDBGQU1F?=
 =?utf-8?B?MngvQTE3RWxXOWN6OXZJZnpmcTE2OW0rcG41bzlQQnQ0dHlFbVgzQi8vZ2Fu?=
 =?utf-8?B?NUxRTS9uZGNUeVA5TXlUNUVJOTBKbURLSEZ2UUQxL0wydStsMytPSXV6RTdU?=
 =?utf-8?B?QjF1eHJPOWowQ3p1RGJLSFhla0YzRXFITWVrMTAwWmNScTZoMjErbUhNVzdV?=
 =?utf-8?B?YmJrMW95MTB0OUYxREh4QkNSUFpMWURmWk1XTmcva3c4NG82MjQ4M3NPUFZR?=
 =?utf-8?B?YnVkbnVzY0VoOTFwRVpUMXRLN1RXS1p2NzVYcFM4QWtOR3hBbXdGTlZEYjlM?=
 =?utf-8?B?cHdQRC9JdTREUDlwTFh2OEVnRkJRRG1NN0VwMjVtaTN4VEFvSUtKWlRXVnhL?=
 =?utf-8?B?Mml5SiszVU02eVNnRkx3VzFobVpTaDlDQk9EQStNUkZSMHJGY01TWWlQNkI2?=
 =?utf-8?B?OTJtZFF3VCsya3pVM2VRc3d4L3ZKSkJMOHFJMUhXNmJMMSs0d29JUVQvNVdx?=
 =?utf-8?B?ZjNZTWJMNXE0VVhZVWFoVVRqVTFEMitSaHpSNzgwdWc0N1FMTG85YjdwQ3B5?=
 =?utf-8?B?RjVCSDBlQ0s3VVNQYjlKN1R0aHpNOTYzN3YvcC9BT0N2b2U5dHF1cVEzNnhM?=
 =?utf-8?B?bDl0aHpLZ0lLTkdpNzJvWFhYaXBjQ2Fzdm0yNWp5QURnTHA3dk51Qy9RWnlt?=
 =?utf-8?B?RE9zaFh1NEFwTmVCTTRWMUx3Mk1FT1ZBZVRtR0NLejIrQXJ3T1JJNFZoYi9u?=
 =?utf-8?B?d1Z6dFh5YWUxTUZjNmJ2MDhDbE5qYzhONktwdDVUejhkc2tMUzhKSUFiOHBD?=
 =?utf-8?B?WGxRTVZGdVpjbTZaOThPZU9ZN0hjRkxvRys1ZTRjaGhWSmhSMy9LVFNIMzVx?=
 =?utf-8?B?SDdBNXpaeEVEazJvaGVKem12dC9KUnpPczlJNlVxMkk1VDBHc1ZOU1FIUWk2?=
 =?utf-8?B?Rnc0cytGc3hWZFFUL0hKMG9nL2pMaGZEVTBuaE1Rck9ybGZqakFsUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e90914-0d46-4086-1b4f-08de5f528d68
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:22:09.8429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lspbuQ224nO08hUgNeBRRPjWqsGK25QBeXCAZymhe1UMg1x8nV6xvQHhNszeS5cFWCeErkQwvl2afvNv1DQQxJ6aadWi3Cl1N26txLPSK1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5944
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EE57BB21D2
X-Rspamd-Action: no action

On 29/01/2026 1:58 pm, Teddy Astie wrote:
> While we may not want all the other CPU informations. We likely
> want to keep the CPU string as it's more practical than trying to
> decode it from the family/model/stepping combination.
>
> Amends: 35d60c59af28 ("Increase default console ring allocation size and reduce default verbosity")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> It would be preferable it such message could be written sooner, e.g right
> after the family/model/stepping one of early_cpu_init() instead of at the
> beginning of smp_prepare_cpus().
>
>  xen/arch/x86/cpu/common.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index ebe2baf8b9..831da72cd8 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -819,9 +819,6 @@ void print_cpu_info(unsigned int cpu)
>  	const struct cpuinfo_x86 *c = cpu_data + cpu;
>  	const char *vendor = NULL;
>  
> -	if (!opt_cpu_info)
> -		return;
> -
>  	printk("CPU%u: ", cpu);
>  
>  	vendor = x86_cpuid_vendor_to_str(c->x86_vendor);

I tried deleting this function (it's almost useless), but left that out
of the NX rework because it wasn't sufficiently related.

Previously (before I was a maintainer), I did try printing this string
because it's specifically useful IMO, but others did not agree.  I'm
definitely +1 to try putting it back in.

To be useful, this wants to be in early_cpu_init() next to the place
where we unconditionally print family/model/stepping.

However, Intel at least needs to do preprocessing on the string.  (Intel
right-justifies the string, and we've got logic to undo that which we
inherited from Linux.)

While I to serialise things, this will probably be better based on top
of my NX cleanup, where you can do the Intel processing in the (now
earlier) early CPU init hook.


Also... if you fancy fixing another todo in this area.

It is only convention that these strings are ASCII, and they're
arbitrarily programmable in general.  Also things like the cmdline come
in from external sources (including people typing into a grub
interactive menu), and accidentally getting VT characters into dmesg
ruins debugging.

It would be nice to port the %pE (escaped string) format option from
Linux, so we can have some defence in depth when printing external
content.  I don't think we want anything more than the default
ESCAPE_ANY_NP behaviour.

~Andrew

