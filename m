Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5C5B4533E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 11:35:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111532.1460198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuSqA-00023r-Nj; Fri, 05 Sep 2025 09:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111532.1460198; Fri, 05 Sep 2025 09:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuSqA-00021h-K7; Fri, 05 Sep 2025 09:34:42 +0000
Received: by outflank-mailman (input) for mailman id 1111532;
 Fri, 05 Sep 2025 09:34:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPPU=3Q=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uuSq8-00021Y-Il
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 09:34:40 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85a4d901-8a3b-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 11:34:30 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU2PR03MB8123.eurprd03.prod.outlook.com (2603:10a6:10:2f2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 09:34:27 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 09:34:26 +0000
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
X-Inumbo-ID: 85a4d901-8a3b-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwoadAddVtSlf5TRRWUUiO4LEr2C0DUluhdHx0Z6S8OWkQ5Fljsu6q2YX7iXZoDWAaM37W4TeKoJvLVj2YZdd4/Tg7wyAnZsZQGgqlTiyOpPCzR6XtruRr8rlKWMSM1v7soUfvqAToqVYi1hqN31WxWTo66SG75NJ38zeoaxeivFWb1KqfWqtCDZfLzXBycGZ5pSqokgncyInU3muu0AtCMoCBi7kv71OeJtkaVhejp3M6aTGFKv8/9D6Rj9Ka5qaj0QrHDgFIB9BemMzyHF9WGb95Gopmkyl8XARJpBk8AlCTUgEDyS6TVIUqYxTCeloZRe3zfSOs7XkEFB7ismFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0vdsizoTTNdQW4TPL8DV4kDDbBU8+G0QEf8xk3DF7M=;
 b=V/Yd1nKmKwJyYpDnW3dxxDcP9fzwwezCv9caosOKFF9NMOK5q8qIWZqy5r9QeZ8il0WRuQQqscVCQFf0hP7FmpkVrBJ04gu0qUCUZCUIMIH/v1ZCjfD4kKsYy9O+KHwcHAPSbna44piFYdgHOlxnnKUgex6/c3NvJM8a6ELvtdcUI8JJt9RmsroK0QrsqilXEtWAF9HhMc2D7w8p2k0aUR4ZF4y2O+GAHqIGAxH5wkXLTliifN3fY9UY/R/93MjotoQO5WVUjxH2sSexivNzKlO2gtXoO8SG6Ag5QScR3hvIdcb6QDAqOp2fSwUVhMAlqZ0HGW/pBOtJb4tQvGjLNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0vdsizoTTNdQW4TPL8DV4kDDbBU8+G0QEf8xk3DF7M=;
 b=RpR9rathARpIO1ekOQx3hoKB+fgwP/kxy5T2iahMPw8rdCJrp1pXCJMTFnvQCFEz0vHMRapJh3rS0O7KbXKfv/I/0H+T9R1ryJHXS+LfZkiod8qapdinsKA0hTiazeaYcnCDtXtgwPLLbyVjVQUoFngwaMFexnHS57eHVclz/ZUqiIWhb216+CTQR238nMvkU90NLYHO8u2X0o1vNxot8Qdf0j+QBVEmbW84ZAEQS2t5Ga9yJeYUjt/zhC42/Sp/6VqnUyJGeP0QgHU3Gdo/1I12Tm64PH2wV/J0wrvARHL9Fqo4Ow8uMFIg7XEHaJCPCmMtqi+3CRxgLVj4j1vRSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <974cdd98-01cd-4df8-ab72-367fe5ec7514@epam.com>
Date: Fri, 5 Sep 2025 12:34:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/arm64: allow to make aarch32 support optional
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
 <20250806094929.293658-4-grygorii_strashko@epam.com>
 <9e69e282-ea6b-4d4d-ae3c-27c4d3b7ccf4@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <9e69e282-ea6b-4d4d-ae3c-27c4d3b7ccf4@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU2PR03MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: a1cf0304-1bd0-4e2f-dd28-08ddec5f67d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzhFZ3FReGRpUzM0YmN0M0dTUE9XUVJ5VG1JSGdZSGt6Y1U4NmZYRG1ZaUps?=
 =?utf-8?B?MUJyUU1GVUpFMjVQUllkWXB6QzNBbkd2ZnNVNHJaM2FXdDdLR1Z0ODc4Y2xI?=
 =?utf-8?B?YUxBN2h0enhwQnhXdENWUHVoMkRVUnEzSW10NWZpbm9Td3lLNkc0V2VBNE5X?=
 =?utf-8?B?cHhUQ29xVHhSOVpKWExJc3RLWWZGVkFCTEZLRm5nZ0NXbHhKNmlvMTZEeEF3?=
 =?utf-8?B?MEcwc0wwdCt3QmxmeGdKc0ZrL3FZZzNJYUZNNFRiWWxnUzZacHRYckU2eW5U?=
 =?utf-8?B?NGhFVHRMcjFCcmZDbzRxVHcvNitISm1xQm1WZFZrVzNyKzRVTUNkckI1OTZ5?=
 =?utf-8?B?TjN0V1EvbWREMElqYmFjWFZUMXRuRy9KMUtuODN2Y2MraHZucEZvZitUUTJX?=
 =?utf-8?B?U1Y2WTB6REpnT1g1MmFGSk1FMmlBdU01Y0xlRWRBVkEvSnU5ZDA2ekd1bXY2?=
 =?utf-8?B?RjB2UXRuM1RmcjVwbG1CUUdWR0hDbVVoWEw1dGU5K3diVU1MYWZ0clVxUHkv?=
 =?utf-8?B?cVN1eU9ERy9SNVptNW52dHVKd3VZbXJ3QjhUbEpBK2l3NUFOT3MvNkdvSUg0?=
 =?utf-8?B?S0xDajBQTjBpVW5zYkgzRnM1MGRSWDluWnRqbDJLM2ZIVTlaOGh0aFBmUVJh?=
 =?utf-8?B?RXZvNDZqTU9zaVlzOTUrN3gydVBUWDQvRi9VWUxNZ3V0bnBvUm40bHluSnNJ?=
 =?utf-8?B?K3J4TmxQazREK3VLdTdtdFUxRTlDQ3JxWk1MY1dPZGdGb25YNUhGU3JQUHN6?=
 =?utf-8?B?OVBkdTE5UkVMajg5K0FvdEQrc083MFFITlFScW1SWmN3c1oyY2p6WkhOdHo1?=
 =?utf-8?B?VGN1cGdIRjE4S21DMTRGSjhvNS9mZU04bWFnNVYzT3Rrd3RwTVRVYTY0VHow?=
 =?utf-8?B?UDB0bTRqQTBnbEdlbFdORjBodnBDZkRRSTV2aUp0a0Rsek9kdmxsM2N6UC8r?=
 =?utf-8?B?cW1BMmc5dDh4MU9VSUxzUXY1SEsydkg4SUxZbk45N0FVWWhGWGp1VmVNWXFX?=
 =?utf-8?B?VStCMU0rOGZoaTY1Q2lvUHNFZFYwcjZ2K000QVZHQUZBWlpWNzZOUGxsQWtE?=
 =?utf-8?B?ZldqbmpWanB6Y3JtOTF0SFFNb1JEMTNiWE43V05GU1V6ZEx6OTFSa3NWdjh6?=
 =?utf-8?B?REFEOWhSMzFKMXA3di9qQ0tWRWdlY3FMMzcrRW1lZzAwUWtacndrbGZIaVYy?=
 =?utf-8?B?WjgzaFJqOEEvZ05iVUt1OUtEVVRwSWFIRVpMWlo3RHNpNFJiOXl6UzVSNHlw?=
 =?utf-8?B?clNZOG9Bc1JKZUc5cERicHJLWGVVdkozVnVQejVVN0hnUk9CM3FHQktPUUtF?=
 =?utf-8?B?ZjBQbEpNT3k3c2ZUZks5MEhkOE4rV2M0OXl1cXBja2IxZHFGblY5UWZqSkZS?=
 =?utf-8?B?L0tPWVpCYWRGVWxjTU1wS0UveXBtSXlKTE1QeFZqWkUwcnJxSHBVNVh4b2Y4?=
 =?utf-8?B?Y1gwMHg3RDZaWTh5NlA2TFRmSTJwWEhIQXozNGRvRFk2cCsrbGZiKzgrZTBU?=
 =?utf-8?B?NWRrY3NaNFhvbjh5dzV6N2ZJQkwxS3NUUUJaUmt1bnMwNGhTL1ZtcDlSd0tH?=
 =?utf-8?B?VHN5aERaQVhjR0QxaklrYmNyb21rbzdSSVprc1cvTmxQNm52K1hIaHJPYUts?=
 =?utf-8?B?UnBURjQra3c3M09GQnJEOU1BQXY5aDQvZXlJQkY1cjZma0JzK1YvLzBSOGNl?=
 =?utf-8?B?aDU5dTZFV1RXM0ZKUXRna2lpdlNjUVFpNkl5Yi9iK0duZUtxWlk0eWxTbmxY?=
 =?utf-8?B?ZS9ka1RSOHJ4a1RuYi90TE9CdmpmNkZWRzA3NlU4enlPazNFQ0NLNWxTYlov?=
 =?utf-8?B?WkVxREpScGRXK0h6U093TXR0Mk42Y2hjSGhlZHFwUnJzYjJLbUswMHJtakRi?=
 =?utf-8?B?cGoydHZZeEprSlZmR3NPbmhDWHR1bGZMa3EycjhmR0xOL3FBV3d3NXgrUmov?=
 =?utf-8?Q?lbhXrV0EQqU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFprRkJKRmRTQUdTTE8vdURyclZyUXNJc0tsbDZRTEZmVmxycUJQaWpUMVZr?=
 =?utf-8?B?cWJvL2J4OEp1ZkxkL0syazlGYlZ2REdyR0dHRzdqbnJiV2Fsb2hac3A2UHFy?=
 =?utf-8?B?N29qd000aXpvT1JiTHVmTVJjWERvRFlrRytBcnF0MnhtU1dSRTJENzdtb25w?=
 =?utf-8?B?SWYvbDRnVFhjdFQ5cUVhektaOHhHdGxCYUhxdDJweXFOcWdTdTZaS0dBY1Fn?=
 =?utf-8?B?TXpXSTUzZUhNKzhBa012dDhCTUhNbkRlVlRIcUpxQkFEOXNoUmdrU0I2cHBI?=
 =?utf-8?B?dnl6RGdvOERpWXpZa2RRd1N1S3Y2NmFsRVJNQkpoZnJtN293N2J2RTRHa1I0?=
 =?utf-8?B?bkNUVG42WGRkOUI4QXJZUEM3YTMxUjlTMWkvL1o5S2x4dmRSYlkzMXRDRTFV?=
 =?utf-8?B?WitIemhmVTJ4bm45aXNUOVJUUVNHZmN2MTBJc0J1a1BsUkl0MXlVNG1laTZZ?=
 =?utf-8?B?bzg2WjRKTnlmSXNEbDVCeHBsbEdpd2dyU2RBNzNFLy9vYUg5akhmdUlpd3JP?=
 =?utf-8?B?aUROL1RLM09ncm1xL0UyV3AyTHRsbnVNSlNaenVLSFpzZ1FvOG5YK1RYY29u?=
 =?utf-8?B?d3pXYUllckpCd2hGZjZMbGxFMVRGdU01cmc1VFRQUk9lVUQrejdhakxZYVp6?=
 =?utf-8?B?M1FQWWU4V0RLc0NxUVVTOWpMWDdyR1Z5bVovcitOZGorUGp2R1VqenhhUVpH?=
 =?utf-8?B?MXViQnVVRkpaQ0h1VzM2aG93bS9aRHk4U0Z0Vy9sRnRCTXVCYWdwQUJoWitD?=
 =?utf-8?B?bmVSY1A3aUNTbDRPdXgwc2FHTmlsWG9QSWVPY29uY3lFVlpWYm1OZE5SWHdq?=
 =?utf-8?B?WUxIY2NoZHhjb1dLMTdJUHFDUlQrb1JhVy84cXllNWZCaHF5azdVUmE0clpo?=
 =?utf-8?B?ay9EaFNPblZ3Q3pkRElnMFgrZ3ZZa2djbFBGMTc0eSthYlJvT0Q3cnRhQUxB?=
 =?utf-8?B?NVdLRUFkYTllMWt5WXdPRW50MVNkQ2d6Y3ZqTzV1UGx5RlkybmRlcWIyTUly?=
 =?utf-8?B?ci8ybDcvTE4xQVdQK1RiRGtGcEdjNnZweHBPUXN1L25ONS9pWDgzZ0xLOHpm?=
 =?utf-8?B?V1JYZGlJV0J1R0htSks0ekgxWnl5dmtrZDd0WFo3VTZYTXZ6eUpUT1AvYlN2?=
 =?utf-8?B?c2F6bS9pWVFOVWFENExoNE9ZK2xvYU4xTittWUNnN0hjMWs1Tng4YVhoNitG?=
 =?utf-8?B?Mm55WkRkd3pxQjhoR1FKTW9GTHNHWUhWTDFqQXpsM3pvUWU3Qmg5WXoweXF3?=
 =?utf-8?B?NjBVWDNpcUFKZDhNSHhYQXp6K1VGK1k0MUdkRkYwRkxxcTJTYXB3VmFoMUxI?=
 =?utf-8?B?YzN0VVAxOU5YRnpTOXYxUnRua1FWeXBmT2ZMS3BhL0x4VGtwcnBBSU8rRXFz?=
 =?utf-8?B?clJ6b010V3d0Y3hmWHMwU05KM3Z5aXBSQVRxc1VHd1hmT1JqNTJneTZYeTNw?=
 =?utf-8?B?UVAwVkx5OGgzeWR3OW5Bb0N0eWdyc0hVNEF0ZVZKaXZycjBSbVIvd0dLTUNq?=
 =?utf-8?B?VUZVZWdKZngyZjhoS09hNytHTmhTWHd1YVdyOVJ6aXp4R3YzWXRITFNKVlgw?=
 =?utf-8?B?aktiUnFFQXhlYmVrY2dwc29WWTJra0ZiRVVFRmxFOTlsTGJLZm91UmdzeE1J?=
 =?utf-8?B?cVZwMk9FU1EwZmdkT0xEa3hubDFQUDBjYXFxUnFUcmNFOWgycnFOeG1hK0JR?=
 =?utf-8?B?MGJWWWExd3NFUnVETUNydUU0eFZjWmRzeFFTTzBxdWJteWIrRVFKdnRZenhF?=
 =?utf-8?B?YkNwR3hNUE9PS3hGK0J3ME9lZVRCSmxZSy9JeXFtK2toMXVhL2g1a2ZWSkNZ?=
 =?utf-8?B?d1QvS04wKzJJYVduaTJQU01LKzJmWHpEWmJRL3FFM1ExNjRheDVLQlRXaWRC?=
 =?utf-8?B?amhiU0pWUklWckp3d1QwcmNnNUZMRkxRUzVrZ2k0L0VISzRzd3NoVjYrSHlU?=
 =?utf-8?B?RUtrKzluU05OdE5xQ0FLenRyaXg5dnFydUFNNjVwR3RkcGVYRFJMaEZYWXdR?=
 =?utf-8?B?eUxUUzFkN28xOE9ESnBDNGtiZWZWQzJsT1lkUzhrejZYSExIU2xlVVRpa2Nl?=
 =?utf-8?B?c3Y3U2RGblJQa1N2NWZYeE1XUkYveW1sL0FVeWpYS2xnckF6NTRPK3l6SlZT?=
 =?utf-8?B?WWtnZjU0VW5tdjdJS0NtMGlBR2swTElHZ08yOWdIdEMzWkVpV01Tb1pSWGw2?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cf0304-1bd0-4e2f-dd28-08ddec5f67d3
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 09:34:26.6123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VafR+10kLl5Mg21HpUgEpyqm3xw6sU2TXgjUMNULeKQ/r1H6kELnsyL6rI/87uXycSAPf48n8L7efNO8I97IsC8N6WZQavhefOTXMESGbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB8123

Hi Julien,

On 05.09.25 10:04, Julien Grall wrote:
> Hi Grygorii,
> 
> On 06/08/2025 10:49, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Now Arm64 AArch32 guest support is always enabled and built-in while not
>> all Arm64 platforms supports AArch32 (for exmaple on Armv9A) or this
> 
> typo s/exmaple/example/

ok

> 
>> support might not be needed (Arm64 AArch32 is used quite rarely in embedded
>> systems). 
> 
> 
>> More over, when focusing on safety certification, AArch32 related
>> code in Xen leaves a gap in terms of coverage that cannot really be
>> justified in words. This leaves two options: either support it (lots of
>> additional testing, requirements and documents would be needed) or compile
>> it out.
> 
> To clarify my understanding, what you are removing is support for 32-bit EL1. But 32-bit EL0 will still be supported. Is that correct?

Yes. The 32-bit EL0 is still supported
(and was tested by creating domain with AArch64 kernel and AArch32 EL0 rootfs).

I will update Kconfig description.

> 
> [...]
> 
>> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>>    AArch32 is disabled.
> 
> A guest is not allowed to switch bitness. So I am not sure why we need to hide EL1.

I can drop code chunk which changes ID_AA64PFR0_EL1. Right?

> Depending on the answer above, you might need to hide EL0 and have more code (TBC) to prevent 32-bit EL0 running.

EL0 is supported.

Thank you for you comments.

-- 
Best regards,
-grygorii


