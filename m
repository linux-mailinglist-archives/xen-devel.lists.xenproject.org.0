Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE8FCB791E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 02:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184837.1507118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTsER-0004zY-F3; Fri, 12 Dec 2025 01:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184837.1507118; Fri, 12 Dec 2025 01:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTsER-0004wR-CI; Fri, 12 Dec 2025 01:46:07 +0000
Received: by outflank-mailman (input) for mailman id 1184837;
 Fri, 12 Dec 2025 01:46:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRu3=6S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vTsEP-0004wL-Ns
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 01:46:05 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49811056-d6fc-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 02:45:50 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS2PR03MB8136.namprd03.prod.outlook.com (2603:10b6:8:27b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Fri, 12 Dec
 2025 01:45:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Fri, 12 Dec 2025
 01:45:46 +0000
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
X-Inumbo-ID: 49811056-d6fc-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbOmXo0uUIPup878Af0tckjzHnEt/5QaIA7fDryzFKcrKLRBfQWbn+R5QH8hbwi/Kuw9hYdhHVPLR3jIwrIjLH/fYkSwk2md0xKY9ty5o1XPGcIJha0G1rsgjTKih8w9QLemu/qedA7UrVpcmv3TIdwEk/tmvj4jxWApB13Ius+On7uKSqezfOuRvkiZtlPbiY009Cw2oq/Z3Uvb0epyvy7yf3ZXj58eNhmt0bUqmdwMwXvn/x8f+wT/5PSy1aKr5Fs8KL7ds1IaecuCg1dKL7mW6q9VbP/Njdh+uwb0VvEe4EUpFzatTEM+Xyrfkqnt5H6rDG82FNLmvSDXUO8mIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQtZF6C/icLyIA+777VnvJNTfdqs3GXuUbkFxxOgwFs=;
 b=Bso70b40xYIHwh7sivAizL6kKye3KBrXKutb9ZhKD1YGGjMPGL8gWThRT1tgSZqzi+1khLPauXKNbhpgVhb46l7hC0klFDbS2lC06q7GDumw2j90bYnbeKo7y33AG//NPHiVxPEZkKmX0pCvAXvzFa4bN11TWRy0Mh7hNjUKh3TdIGYwy/qFyQLMHbUWm238I5WMlxVuxdw4mzqUM2Ma/GuXHU5yxxKooOfm5M2hPyTSktAftS6Cc0koiwE1L4uYo5Zx3qXRZ+B1OSV747AKRL6qOQeiajxKg7mpK2jWd0eTTqyFI+xT0f/HGVSArP9yzVfG2yb9FSwUV8mzka/sCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQtZF6C/icLyIA+777VnvJNTfdqs3GXuUbkFxxOgwFs=;
 b=ck/lsG1exVp9o3b+XMYd4J2TFfqrmyahPQJ3ISSHnZS4q0RsTsOLdoh0dSCHwqZ/0LP+Ms/K+jWHfh/Rwme2WOuiYKpevo7ZOC+bud9oYXr1gFl1LKBDdqWPTyrq+NI5G+bZLamH1jpqebRkpUr/bkkOkEqKR4Jk5d9BeBhI2Mc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <75731067-89f7-4d8f-b6a3-05dc46c777b5@citrix.com>
Date: Fri, 12 Dec 2025 01:45:42 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/5] x86: Fix missing brackets in macros
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
 <20251210183019.2241560-6-andrew.cooper3@citrix.com>
 <5a4695fa-1520-4d52-adc3-72c159892e33@suse.com>
 <fdf95d1d02274a6442d4eb4c6b7284b8@bugseng.com>
 <d2988b31-66e0-4a6b-8f77-4ae2cf2c4bd4@suse.com>
 <9aee3813bc96718ce0d772ead4f0578f@bugseng.com>
 <d447f57045f1a7463fcc14faf271be87@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <d447f57045f1a7463fcc14faf271be87@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0366.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS2PR03MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: f197ca15-35e4-4afe-792e-08de39202b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDVxdnU3Uzh5cWdlSUNnNjBrYWN1VVlXV2d5MGoyM2hlSFRjZno3UlFtakFl?=
 =?utf-8?B?K0VMVnZna01FbHdnZEVoa3ZoL1Z1aTd2UmU0ZXdqTEVmc24vcXBNVFlhWFE5?=
 =?utf-8?B?akVsT0xiV2dldUZYbmMwb0QrNFRPMEZodU5kVWJOUFNmM0c4dWdjNnVyT2tu?=
 =?utf-8?B?WkUxWk1wOWJmVGo0V2N0WnA3U2dZb2JaSncvaVpOejB0UXpXMERIanF1U1JT?=
 =?utf-8?B?TnJRZVE0WHgxVjEzMnQ4NmtpbEdjT3Y2L0pNRmltSUdIR1dVMjdPZEFKOERR?=
 =?utf-8?B?WktjV2UybTd4aC9xdWR2R0ZCdXRZMVd1akd2eHdXRC9kWUlhZmg4bkhNOG0r?=
 =?utf-8?B?cmQ1dWtrV0F3ZFhrbmpLb3FKdTZIRDhsWXYrOS9wVjIzdm9QUE5xZWhxNjgz?=
 =?utf-8?B?ZXBBWEd6V2J0aVRYcEh0MHdSQ3R3aVhQcFExRWh2cldHNFY1cEpBdkI3MVVP?=
 =?utf-8?B?TEhQTWIxb1VXdXIzV1p5WkRpTjNEYlR2MzVBazI0NWhkQUVuQ0ZDVXl5ZnlW?=
 =?utf-8?B?UVFReHg2YnZqdXhvblR0SEwySFNtbENkVk1zZ0VjVmlRcDAzcnlXRHM2ZTFC?=
 =?utf-8?B?RUdOOERMeGVhOVY3Q2o4UFRhdjVjQnlJRG5sajI5dTdkQU5mQTlGeFZ4eGFI?=
 =?utf-8?B?alNyWktvQkZnUUtVa0syVUZXY0t3RG9CVFJqeTd4S2ZvcEp2d285U0F4RUt4?=
 =?utf-8?B?QzNRQTIzQndJT3VnQ1NwZUpjODdZZDdMWTZwY0llUzIrTmlOTS9wbXVkRlp4?=
 =?utf-8?B?ZHRqQ0kvUVh5eW9xUWNpTHZqN1ZzWkJQM0Q4OS9vbVdialYxMmlSeTNtaGh3?=
 =?utf-8?B?SktyZjNBK2tkTTJsYmd2T3ZMM1JzcFhyaWFQN3ZpY0p0WWN6RjVpY3pGYU9K?=
 =?utf-8?B?ckg1ZmJ4ZFBlRVdlNU9DZzdmcmJTSi9ONHBBK2xZZ3A4TEZCZlp3S1hVbmtJ?=
 =?utf-8?B?Y1lLWFpCMFIxTVJJZUpFUTJqdnhNVzlWelA3TEp5ck8wTFZQbzdiYVJtY1dn?=
 =?utf-8?B?UEQyNWpPWGEvczNMN1BMWC9mYVpFVzFEbjI2UFZtbWtKejhDNmk5ZUxocFAw?=
 =?utf-8?B?SDZwemluR3hDZmhTcmQxWjgxTVlNZ1RxRnp6QlN6NGhrRlRDaDhPZW5iV0FE?=
 =?utf-8?B?bGg4S0JYekFaV3VMdSsyT1M3SlplYVhUS2c3RXloT3NUK3d0TW5YbGU4WThp?=
 =?utf-8?B?cHVJWGt5RGNLVEszYTVjL3BiU1FxeHZDVWZ5Zk5nN1BremVBYWx3M1VaU3dV?=
 =?utf-8?B?QkpZS0NwMDFEOHA4RzhncEVRUUMrNTUvbHZtam5sVUtvTG5xdFI3TjEvZ0gw?=
 =?utf-8?B?TWVEN0t4L001M1Q1TjV4Y2UvRmR1S2QzeTBJTS8rZDUvYkFRbmlwMmJUdjBq?=
 =?utf-8?B?QUJKV1lFSFhHZUtBQU9YRzgxUDkramxSNVVZRVh2c014K3N6YkppREpBZHlH?=
 =?utf-8?B?dTVpRkVMSGtIeW95UVNIZm9oU005VUx6eGRTQ0pHMGNYMzRHZkt6ejdrczFC?=
 =?utf-8?B?OGhPTmxqRjRCNnBhcWl2dHdlQjU0TW9QeW1yVTRsdkxjckF6VlJzam5nQXBZ?=
 =?utf-8?B?Mkd5NHBRd1BqdFJubWdIcmo2NFBmWWN2OWtRN1A3VVF5RHdMV1c4OXpPNGtF?=
 =?utf-8?B?VncvZnhnaHI2dWFmNUJINDhvNkhMeTliN3crVWlpa0tiRTFsdjk2bVF2bUsr?=
 =?utf-8?B?MndGWVR3aUltN1Z2bjM2WW9XK2NudzNpZEkwVEN3RjYrTjM1RlkvZHFYanNT?=
 =?utf-8?B?T3lPTXcwM0Rnd3p4azdxNFVzeVp5cFVvMWZJaVNielpOSFJpSWx2VnoyS0xD?=
 =?utf-8?B?ZnExNmNkSUxhZTdaTzEyNEZqN2pEZWxscmxVVHdtQktnVkhlT3hIVWFhaVFt?=
 =?utf-8?B?YjFibHlnRHZIMUV5dk1QS2swR1oyQnNhQnZOdm9CcW10aUU0SUxOeGtQRU9M?=
 =?utf-8?Q?BlStM/pOQEWNbzItAsOCveutUWWg5C2K?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGhHbTJYNEROY1o4aFRmSVR4TkxUQTVBRUVkblgvbW83WWJmOC92UWVybnpQ?=
 =?utf-8?B?aEkrRU5QblRCZUNrVWE3RzBGeDN5czFieWFxWXVQM1hUdXNLVTc4YmdvZCth?=
 =?utf-8?B?S2ZnVjZTR3F2Mm5OZGc4Y1ZVWFdiSjMyVHc3djNqbFN3SU92c2FVN2IrNFBI?=
 =?utf-8?B?TEtQQmZrQjJhZDFTMVNXc0JrYkxTNnZWM2VOTXFzdEhrSVloSUlQZ3pjYzNt?=
 =?utf-8?B?aUFYUjRxaXZieFdqNUVaZUlnTWZZb0g2T3BJaHZ3N0Z4cnJXS0tuQ1RTTTVa?=
 =?utf-8?B?WmJPUHJ0bElmVWdvRjcxUGFVK1JkTUcyTHNlZEsyMTRya3J2QjJ5Zm9EcFNY?=
 =?utf-8?B?NFpPSVd3aFVOMzBaM2F5c3R4SDhFblYyMnhHTGdsby92U0RScUp0MEs0cjU2?=
 =?utf-8?B?NDZ4OXRxeTJjZG1qa20zT0pKSEx4Q1NONms4ZmhFdDdVL1JMbW00MnpLSnpC?=
 =?utf-8?B?QlBQSUxWeGhTeFFwZmlMMmJTdysxMUMzUEYwNVBGK2labytOWG9zaWFpSG10?=
 =?utf-8?B?ck4yQlNYVlErckRKam56am9WOXlHZmgrVmZFWStMZGduZmtialN3bmdIemx3?=
 =?utf-8?B?MkhMK1lIYm9CYmMxc0loR1Nud21KUmRYVnhxc0VpcXQ0RjBqNWdHaU5IaUI2?=
 =?utf-8?B?T3NtL2dWOUtJVmVSeDdCVjNVRnVyY3pCaXA4N0ExbkhWL2FxY1JlTEpYTDB4?=
 =?utf-8?B?dmRuZGZ0b0FUOEcxSm5LV2g4eklJN3lIQmVsdlFLVXRVUUhabCtKeDhmcDV6?=
 =?utf-8?B?QmpKSWg0b0dicXB3bVpBYms3bkFKaDF1YTFZejFUUnFtYjI0SVpONzRRcFJl?=
 =?utf-8?B?eU1UZWIxRlQrd3pTc0VDQUtMSVAwbWVWTFF6dXNQdUVKZzFpTXZPREhPbkla?=
 =?utf-8?B?RmhRcUdRUEFpK083R0lURHZ5Z0lzZ3BHT1JHNFJvV1hDTE9rNUJTWHltSFBT?=
 =?utf-8?B?OUNXaHppQVdqekJ1Tk9CcUlKU3RUVmg1dHQrMHNncHNJK0doaWNrRkRxUDVN?=
 =?utf-8?B?SlVIaXMyeXczUEhTSk5ZaDJ6anE4eTV0OTFTb0p1TEhoTHFWam9ZdnRpVCtp?=
 =?utf-8?B?aDR6OXI2dkRsb2Q2eE1Lb0FJb3BOMXkyZ3JmY3ZyRGRYRWVUVTBCTHlBbURE?=
 =?utf-8?B?WWhTaG9USFJNbC9UcXU2UHpvSVJHNjFTd1VpbnQwV1hKTGV1UXBYcmtrdzVm?=
 =?utf-8?B?Q0U4czlqUVZ1YlU3NzBVV0VObVk5S0w1WXBvZkFMcWhBaEpYM1dyVXQzdlQ3?=
 =?utf-8?B?RzNhNWhYR3dQWjhOZDVuODRhUDlqaExtbHpySlVGKzNQbkhsQWFjZTE1K0oz?=
 =?utf-8?B?QnpTYVRpeXp5bjRKSWFkRitVTXBsL3BqZ1M5aFk5VXhmcTVhSW5ROTlHQ21W?=
 =?utf-8?B?SHl5UE54Rm5wZzF0NWFsb2YrcmpBR2d5VHJEOWo4akk4Q2k3MVlkcFVkZXhn?=
 =?utf-8?B?OFlQWWo1R1V1dFU2Nk9najVnQkdlMVViTXl3NkVnQm9Lb1I2OUxHeThJNXpJ?=
 =?utf-8?B?emdGV1p3SFZHejg1TzJvR3gyd3BQLy8rYXBPN1MwbURUZDYzL2g1NC9zZXVX?=
 =?utf-8?B?NU1GYnZoaDhRc2gxTmF2dU00amVpaUwxY2xaZGRCWXRZTjl2anBGTDlRb01v?=
 =?utf-8?B?dW5rSTFGMWx5ZUtQZFpKdGRLNWFaTjZRZytIcUVlV0dzUHhVUWRKeU1YTjdw?=
 =?utf-8?B?QUc5dEhMVGpuc2FkMWVHa0trVUltVjBscWh6RGRENmsxOXJqemdJb2lXNEl5?=
 =?utf-8?B?c0VpcnBmb0lUNGlNUG0zV0Vvd2I4NmI5bkJRcEkybFNMUlRBM0IvUDhqaFFL?=
 =?utf-8?B?ZTRUWnMvRHlkVHVEZC9hY1M4WXBLazJuMnE1NDREMldYVFBtVXg4V0JKMXJw?=
 =?utf-8?B?WWpKTnJ1eEVKejk0WDB0R0FrVU1kcVFHV0lpeEJ0ZWVHTjljZERQVmcxeEw2?=
 =?utf-8?B?SFJPbjJScy9KV2RHR2g0WHRRRVhrSjhtbkpFdWNGMFExOXBRTHAvK1ZXT3hN?=
 =?utf-8?B?eGhnWXRFeU1Od0tZZHpjTnlKSzM3dVBqUXZpdm1yMHprSmVpOHNsaklMc3da?=
 =?utf-8?B?ZTNoMTM2OG81QU5pbnVYa29SU3cybEx0YXVBTTFRVHp1L0NWR205Y2FZcVg5?=
 =?utf-8?B?Qk5WL0txdTVVUCtKK2M0T0hJU3YrZEZjNGV6eEZHOGF0Z3NDQ0dWeG00SVZC?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f197ca15-35e4-4afe-792e-08de39202b96
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 01:45:46.6839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/n2q90maJFiWCwQ8qRx9S4Jw+95QkQl2nEq5s+pQwF9ZZK+BRueGwIEo14kXe3bdl+FhcFSESmySHTD5Id/liuVCW1GV8MXsGRNartzqaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8136

On 11/12/2025 12:28 pm, Nicola Vetrini wrote:
> On 2025-12-11 11:38, Nicola Vetrini wrote:
>> On 2025-12-11 10:30, Jan Beulich wrote:
>>> On 11.12.2025 10:15, Nicola Vetrini wrote:
>>>> On 2025-12-11 09:36, Jan Beulich wrote:
>>>>> On 10.12.2025 19:30, Andrew Cooper wrote:
>>>>>> With the wider testing, some more violations have been spotted. 
>>>>>> This
>>>>>> addresses violations of Rule 20.7 which requires macro parameters to
>>>>>> be
>>>>>> bracketed.
>>>>>>
>>>>>> No functional change.
>>>>>>
>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>> ---
>>>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>>>> CC: consulting@bugseng.com <consulting@bugseng.com>
>>>>>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>> ---
>>>>>>  xen/arch/x86/mm/shadow/multi.c     | 2 +-
>>>>>>  xen/arch/x86/mm/shadow/private.h   | 6 +++---
>>>>>>  xen/drivers/passthrough/vtd/dmar.h | 2 +-
>>>>>>  xen/include/xen/kexec.h            | 4 ++--
>>>>>>  4 files changed, 7 insertions(+), 7 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/x86/mm/shadow/multi.c
>>>>>> b/xen/arch/x86/mm/shadow/multi.c
>>>>>> index 03be61e225c0..36ee6554b4c4 100644
>>>>>> --- a/xen/arch/x86/mm/shadow/multi.c
>>>>>> +++ b/xen/arch/x86/mm/shadow/multi.c
>>>>>> @@ -781,7 +781,7 @@ do {
>>>>>>                      \
>>>>>>          (_sl1e) = _sp + _i;
>>>>>>   \
>>>>>>          if ( shadow_l1e_get_flags(*(_sl1e)) & _PAGE_PRESENT )
>>>>>>   \
>>>>>>              {_code}
>>>>>>   \
>>>>>> -        if ( _done ) break;
>>>>>>   \
>>>>>> +        if ( (_done) ) break;
>>>>>>   \
>>>>>
>>>>> I don't understand this: There are parentheses already from if()
>>>>> itself.
>>>>
>>>> Yeah, syntactically there are, but those are parsed as part of the if,
>>>> rather than its condition; the AST node contained within does not have
>>>> parentheses around it.
>>>
>>> I fear I don't follow. Besides us not using parentheses elsewhere when
>>> if() is used like this macros, the point of requiring parentheses is
>>> (aiui)
>>> to make precedence explicit. There already is no ambiguity here due
>>> to the
>>> syntactically require parentheses in if(). Why would a rule and/or the
>>> tool require redundant ones?
>>>
>>
>> this is parsed as (more or less) "if_stmt(integer_literal(0))" rather
>> than "if_stmt(paren_expr(integer_literal(0)))" when the macro is
>> invoked with 0 > as parameter _done. Now, syntactically the
>> parentheses are in the source code, so the letter of the rule is
>> satisfied (as long as there is a single
>> condition in the if condition), but the presence of those parentheses
>> is lost when parsing. I see how this can be seen as a false positive,
>> and we will
>> definitely add some special handling so that cases like this are
>> properly recognized, but for simplicity here I would add some extra
>> parentheses, at
>> least until the false positive is not resolved
>
> Actually giving this a closer look the tool is correct:

Ah, and this adjustment wont fix the violation either.

> the fully expanded code is:
>
>  19562     }} if ( ({ (__done = done); }) ) break;
> increment_ptr_to_guest_entry(((void*)0)); } unmap_domain_page(_sp); }
> while
>                                 <~~>
>
> so the "done" argument ends up being expanded without parentheses,
> hence the report is correct and the extra parentheses are needed, but
> should be put into
>
> /* 32-bit l1, on PAE or 64-bit shadows: need to walk both pages of
> shadow */
>    791 #if GUEST_PAGING_LEVELS == 2 && SHADOW_PAGING_LEVELS > 2
>    792 #define FOREACH_PRESENT_L1E(_sl1mfn, _sl1e, _gl1p, _done, 
> _code)       \
>    793 do
> {                                                                    \
>    794     int __done =
> 0;                                                     \
>    795     _FOREACH_PRESENT_L1E(_sl1mfn, _sl1e,
> _gl1p,                         \
>           
> <~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    796                          ({ (__done = _done); }),
> _code);               \
>
> rather than at the level of the if, I think
>

I hate these constructs with a passion, and from Matrix there's a
separate violation which has no viable fix with the construct staying
like this.

I experimented turning them into syntactically correct foreach_$FOO ( )
loops.  I gave up because it got unwieldy, but now it's the only way I
can see to fix the violation, so I guess I should try again.

I'll drop this one hunk from the patch and commit the rest of the fixes.

~Andrew

