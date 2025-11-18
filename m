Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 978CBC6AAD7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 17:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165171.1491968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLOil-0002J2-Iq; Tue, 18 Nov 2025 16:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165171.1491968; Tue, 18 Nov 2025 16:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLOil-0002Gd-G8; Tue, 18 Nov 2025 16:38:23 +0000
Received: by outflank-mailman (input) for mailman id 1165171;
 Tue, 18 Nov 2025 16:38:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPWA=52=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLOik-0002GX-6i
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 16:38:22 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb290eaf-c49c-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 17:38:16 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5641.namprd03.prod.outlook.com (2603:10b6:806:b0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 16:38:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 16:38:13 +0000
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
X-Inumbo-ID: fb290eaf-c49c-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvLtdhn1JpEu+SFe5+d8JFwWkeFXRAfeh1awrROCRvQvJulk0YkdvE6ou4WU59U41HrwctWEO22Gw5c5DE5oU3e6Fe3ZjpQ5kZ4Ki3PVCSfyOEXMGfKKgow69KeYOdOCQNnzPeKVB4ZOo4wZF2dsaqSwOIEizZpgeINAW9huReVNpIUii2G29D8x+w4ygJl2YsAJFaEdBTE4VZcLJ73M+nySgQsuZ50o63vI24UihpwGTWwBmM7dvcHUdRFhY82lFFsEFdH7LvJcZvMdqA0g/uBiL85DFH2dc0CFqv5o4McKpF6kgWI+bIF3xkxljpD9AdpPvIPv/HrB8WNqxaQ+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LzYLrMVTikP/lipnUx0Clcv3W1fH3EHtSQ9Sjmu3uo=;
 b=kPzt7J8FD2TaefgXa/PvvEK1OnUfIi/JDB6MFYnVZA/z3ZxZhFwt8ArgxpMtlBSycFB/+O1Y/DowMzRe+vggu87xMaLSuUxS3QUvRWjfBkJJq1Tz1bESOKfbIoZLuMyt1nVk3jiZdKxe6liPJGQ7OlFj4wd7OhXto234iagbAfoXlR4QytN969wbWC55tsMLkSFso3E+0uxmv6QUxBiaQ+G7Bw6BUv81DzQXgdCV0HWwVr5B1jfT3pvw1voxn98A15HZ1x8ZFP53TMOmblSFQrWGDidylnXQ6jlraRxHVjYhnYYvqnvqLiYqfONsb4m/iTgAw69qc/CLB5HR7UVv2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LzYLrMVTikP/lipnUx0Clcv3W1fH3EHtSQ9Sjmu3uo=;
 b=Fkm0yPg1uPozMFw5XPBXVZmjksoX8qsmTyjrFwLUEcyrjAUVZ+1qeI6Z/A2UWTo097p67CUw+eG1Fg0LwIPOlIoMLOysJUfr0sIgujqMGNh2IdiP8jSNbbu+GXr98MNibOzLjkALsX8nDDbBCjnEiZ2f7BPM4uSlx5vPpHsMdtc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <828b87a8-9521-40c5-95ff-f46e55fd5f71@citrix.com>
Date: Tue, 18 Nov 2025 16:38:11 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] x86: rename ARAT feature flag
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <bd4f2601-a2fc-4c58-b1a9-3b2c40076eab@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <bd4f2601-a2fc-4c58-b1a9-3b2c40076eab@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5641:EE_
X-MS-Office365-Filtering-Correlation-Id: 42ce9545-4720-44e8-f23a-08de26c0de25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTZ3QTA0b1JhVzA5Nkc5VDF1ZmZmb0d1ZkdBTDl0bDl4MHRNa1IrT2JQc0dT?=
 =?utf-8?B?MVA4UXNuRWhwRUJWQklwZ1dGTVRhYlVyaHQ3dFF6bDZia2dVQ2NJVWZnZTFQ?=
 =?utf-8?B?YTdsMTNENlVYemJHWWZTR0dsYmQxb3F3TTd6TkRaQkJ3QTRTS3cvOGxCaUZC?=
 =?utf-8?B?VkxjM09RTzNjR1lDbHdQUitXL3BBTi9CWndPNndXakVmR0s2MkhIQW4vY2dM?=
 =?utf-8?B?c1JQakZRWnZJUXcrbkR6SVhJVWVTVzBIZVBMRnVld2daQjYzZi9JTEk0SzBu?=
 =?utf-8?B?aUwvZzRXbDBvQnIySmFheStkMnBucUhxN004WTErNTFwVjYyMDJWZThhYjFY?=
 =?utf-8?B?bDRyemtnME9BeDFOWU83azhpQ1RIUTdDNHNMbk9HUE1qOHlKelI0cklzZk1l?=
 =?utf-8?B?Vnk1RlNmNnAzOGxrK0lUWVplSzVUK2JwbnEzbGZ3VmxxUmI1MXQ1eGQ2d0cv?=
 =?utf-8?B?dE5xVnQxZ0xpN1Y4R3pxMDR6NmJqbUVMWUdCU2szbm1ZeVNFb3A4TTFQWDMz?=
 =?utf-8?B?SEoxUEdOblNEN0k5SHZVM3VCZHNNSmVyOHQwa09sdVFodUxqVVhtVFhmT3NU?=
 =?utf-8?B?VjBNL1B4NU5UOElOWGpEYVpuR3IxMWxnYUhkcFM5alVtTmJxNmRacG16ZmJy?=
 =?utf-8?B?KzNCUmVJRnluU21Jek85MXRPS3RQbVpiaHg0TGJOTVZFc3NjNWFZWWx3cm1F?=
 =?utf-8?B?ZkNYU2dEM3NabmpGK2t5VXZCRDZUVGhhQjdKYlJtY1g0WkxSb25VWk43NklF?=
 =?utf-8?B?eDIxMW9mMHZhREQycENkNVUySXdTSlJiejdmNzdTN0ZSb01FVnlRdGRxdXhw?=
 =?utf-8?B?TFBHQk1PejlCaVpvUVdEa2tBR29RVkcxQjUzZDdpOEJUbitCbXl6a3JXRkY2?=
 =?utf-8?B?UE9UMW9vK01GbTVYaCtiekdtQ1d1ZVRNVENFSmZ2ZC9wamU1MkNVc0d1bGE3?=
 =?utf-8?B?UWlCTStsMTNGT2dMVlZIczhNRmNJa3dZSlViekw2RUpQVUNEY2V5YmVBQlZN?=
 =?utf-8?B?V28rdERHMHZUbkFxWFg4ajdKcDRVcGlPWkF0KzBvdzYycGVSL0toSEdmMzRH?=
 =?utf-8?B?RVpPbHNYSStzR2Nockp6VTUxVDJwcjMyQzlaOFZhWk1zMDNnVVl1dkkwWnVV?=
 =?utf-8?B?NmUwZldKamZXTjNBU0h1MTRCVGV6TFRTVVdSNXphczF3ZlN1b2QrNkhmR0Fy?=
 =?utf-8?B?UVQ3VGNuWU5YTi91bForQ3B2SEdkRk95a1hwcHh3bW4vRHhMVlR5SHo3VFdK?=
 =?utf-8?B?UmtWUzNvQVhsRFIyQTh1SHBoc0I0R1lJKzZlNlVRanl3bWZDNHo4RXVMU0l6?=
 =?utf-8?B?cE9uZTZ2dXNxR0NJZWVGSTBSR0RyQzYvbjdueUx4Z1piN3RKYUxOTkhIRllV?=
 =?utf-8?B?NzVra0wxYkZ6eE9YY0h3dytDaDIzRU5WSWs0RUtkM210MFRHSFVjYUdFZzVI?=
 =?utf-8?B?Y2hDaEZVTDJvYkgxaENhRmZkZ2U3eW0yUWJLVVFhdmMyS0ZvRjJlVlV1Y3JF?=
 =?utf-8?B?UXFXazNGQ2FFemgvQ05WWDRzdEs2cERGMzN0TnJEWEg5L0FzVnBwVlRuN0hj?=
 =?utf-8?B?THY0ZlZuKzVUOVk1STFPeVVWSFdiSzhScjFpbDIvSWRrSms0R0NjeUw0bFBp?=
 =?utf-8?B?b05Cdk8wYW1tcXNPbW5DN2JkY1BIVjNsYTNlYlhtdWRTOTVhRDRTdTdOa0hN?=
 =?utf-8?B?alM3V0ZlVmVWVE0rL2FCZDh1WDBPdnlGbjJ3cmlRZ2oxNWJiZlM5N2VGVkhT?=
 =?utf-8?B?UEJLeFViVEhkRzFkc3B4WVdSSnAvSFAzTEdCK3h3QWF1TFNJcWNsM0Y2ampn?=
 =?utf-8?B?dmdZVnVyeDZCeTZBUDl2bXNxZ1lPL29GZ2xsZG0rQlBJUWJXeWdmKzVya0Nv?=
 =?utf-8?B?b3FzZ1c2VUFGSU9FOHRVemRtR1hTVWxFSjloZmM1eVRSTzJudjB2YlFNRmlU?=
 =?utf-8?Q?k6YZlaGfkTrvKtDWW8f/T73BmY62KQ6y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alJ3L3ZBRDl0dGVJbFc4SVFDQXNuYjYxQU1TT05QbXJnYS9QdVVVM0lvZ2d4?=
 =?utf-8?B?WUtRUm9UYnpvbEtrdDhWaDVVMUdFQ0h6QnlDS0k4dmVMSDVQMVByKzJDU2dY?=
 =?utf-8?B?SmxqcHZiL2Y1TFEyMzB4Mi9MMkdoSGR4Rm82SXU0ZWt5TWpIKzhxbFRrM3Vz?=
 =?utf-8?B?VnRHRFpVTDgzRU5JVGVwMFVFSk0rYUdleVpycGwrT3EvYVN4R0o4aUovQjFw?=
 =?utf-8?B?NGtNeGdmYldSUG40QjFyV1JwQ1hYZ3ZjajBuQjRWM1RNNWt6eWY1N3kvczhn?=
 =?utf-8?B?YVdHekkzczJ2SS9kdDBzajI2VXBDSlVyR2NwZE5wQjBXL2t6blZ1U1VLR0RD?=
 =?utf-8?B?TUR2YXpwM3Z2Mno5QTYzWjhMMUNSbDNhUHdhcmJxZ0pzdGF0ZGMzZURvT2w4?=
 =?utf-8?B?TmlkVklPZU5YUUdMV0RIb0F2TSsyRFpNWnRBUmwvajRVM0dJNnRqTGkydUFM?=
 =?utf-8?B?aCtHZitLWWt3aVdmdEl1T3lBa3E5R3h4Y1FnNURKR2orRzVIc2Z5MHpmTkRt?=
 =?utf-8?B?R1dBZGpsbDBKdlIvUjlQTDJTZmF3SVV2WTQra0Y1SEk5R3pOZk9PQkNTakhH?=
 =?utf-8?B?TFB0OFNCNFI4TWU5TS9sMmVMdzJibzdZa0tPd0dRZXhGVHhLSVd2ODBTU0ty?=
 =?utf-8?B?NzJKVERnQlVEeXNLMmZhWHpYMGZwT0N6T1h5S0xKanE1K1Q0dE1rcTQzeW9s?=
 =?utf-8?B?cnpPdmZMVEsvT29BR2dvbi9CVnprUnRNK0R0WGNtMW9DR3ZESXhTWjlsNzE5?=
 =?utf-8?B?dzVDUjJQblJKbjdlL090OXZabExIbmtuYmI2MVZEV3dpWEFXN01EdFZhTjdm?=
 =?utf-8?B?S21BN2tIbmNpV2dqUjFUWjN4N3k4N1I3SXR4NGk2eC9EZXkxaFlNZDFZdFB1?=
 =?utf-8?B?M1c0U1RnR213RWR6ajdjTjJJVG8yWFJYcmYvRUtNN2IwRm52UDVRQ0Q2YXhF?=
 =?utf-8?B?d25JWmlPYkxCMW5kUm9JcG9yckN1dFZKWVZ4RkVZZXB4V0R0SU1MTVJBRlFm?=
 =?utf-8?B?Zkd6alVyNGtMUlpqOWUwWUdGY3paY0xKbHpFQVlIZkRvUE9kemtybWZObGRX?=
 =?utf-8?B?aW13M1ZSd1FpOWpLem15ZFBTYkNUZ0hBOFoxNlhFRm1qRjdZSkNBWDNHRGdx?=
 =?utf-8?B?a2VGUFM5R1Y2R2FZT3M1Y1pVWGIvazhkQUVZRWl5ZzNSb3VFa0M3QStJc2du?=
 =?utf-8?B?dXNFZ3VXRTRyZHdpTTlaL3E3RG9OeVBwTVdQUmRwK3dITDZ2YUplOFl5bjYz?=
 =?utf-8?B?eGFpQU9mMUxIeUtJeThvTWhuRHIxb1ZFMVJScTJESmd5TytNYW9TNDUvNUVt?=
 =?utf-8?B?U0V5Z1ZoUW1IWW5PeUMxbG9JRGVjaVFqbFN3Q1FZdmFYMEVkZ3dtMmU1ZGE0?=
 =?utf-8?B?R2Z3N3p5QVNCeDV2WDFSK0wwTDlHdWR0aitlTzN3WmQzZEorZ0lNSUI4eCtz?=
 =?utf-8?B?Y0Jjcm9mZkJ2aGNYckliSjROM2pEU0c0L0k3SVY5YVV3bER5TWU0RzZpZzd4?=
 =?utf-8?B?cmU2Q0pyajhqN2RxbFRFdisyYVl6YW1Bak5taW92a2NCQjd1bTBvaXpQYmZ5?=
 =?utf-8?B?TjZVWUp0Ukl5SjlBMGVVZTUzVzdibFFVdVpLNXFoV3J1RHZicW5ab1ZjQS9n?=
 =?utf-8?B?bldQcklOSkhxTlg0SDh5MWE1VklIbENMS3hISDBRYWw2TGtucFFmT1NkU2Nv?=
 =?utf-8?B?OVNPSjgraE9RcVB6ZUVhaW5sNHRrWllaaTQwNTRUdEZSUUt4bDZ4NXBqUmVF?=
 =?utf-8?B?ZmZid2g0d1dETWtEUE1zdlZURU1QYUh4cEwwc1daOSt3NWpoc09DbVFlK1dU?=
 =?utf-8?B?eS9NK2twc2ZUU2FndXFUR2RaRkJYQmhrVEl4ZDlrMWQzQXpST3hYR0Y4eW1J?=
 =?utf-8?B?VVhzQk1qM0wzY0U0US9hUVVsamtvT2NZaVJtM1c5cE8wczFIL3plUGp1cC9l?=
 =?utf-8?B?d2Z3c09BaEhYZ0FGQUExc2hXaVFTQ3NEMHVWYXE2UUlBcjU3eW5nQ09ZWkk0?=
 =?utf-8?B?MC9ia1dHMXpkb3Y0a0ZHUG9xQ0dQM0k1ZzdJUkp0WEpRYUFaVWg0aWp5OFVJ?=
 =?utf-8?B?V2tsZ1VUZjlqUmFJRmtYOWE4Z0paWjRDUWN2L1VYTXNISXRHbmVlK3FjcDlP?=
 =?utf-8?B?NVErRlkxdFNwc3NLSmE1djh4cDMralJIMXpkNk4zSG9ZMk5ybE9yUFUvbzdj?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ce9545-4720-44e8-f23a-08de26c0de25
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:38:13.7504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38HZujmDKU1p5R8ZGVN/aLzTOtQ5f0qpVzQ1Eh9vHRMELYxKJZ1XWadE200mKPhaJVIDarEF8vu/UKgdjPcg8RkcaillRR0Ggjk6yiHcI9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5641

On 18/11/2025 3:07 pm, Jan Beulich wrote:
> Add a XEN infix, to properly distinguish it from the CPUID feature flag
> (leaf 6 EAX bit 2).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Question is whether we still need opt_arat (and the command line option),
> or whether we could go directly from the CPUID bit (overriding it to on
> for older AMD [and Hygon?] CPUs). Or whether to have opt_arat affect the
> (host) CPU policy directly.

I have no particular love for opt_arat.  I added it when there was no
way to force a system to fall back to an older timer.

As long as we've got some way of configuring the exact timer to, I'm not
fussed about keeping the top level boolean.

~Andrew

