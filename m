Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09FCCBF235
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 18:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187507.1508886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVC3b-0005U8-Rx; Mon, 15 Dec 2025 17:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187507.1508886; Mon, 15 Dec 2025 17:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVC3b-0005Sb-PC; Mon, 15 Dec 2025 17:08:23 +0000
Received: by outflank-mailman (input) for mailman id 1187507;
 Mon, 15 Dec 2025 17:08:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbMu=6V=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vVC3a-0005SV-Tb
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 17:08:22 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8b3be5d-d9d8-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 18:08:21 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5769.namprd03.prod.outlook.com (2603:10b6:806:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Mon, 15 Dec
 2025 17:08:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:08:16 +0000
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
X-Inumbo-ID: a8b3be5d-d9d8-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H64hlM7XUCLVua85T/FkxDRCWDQ8ZnctBhSte/jJKTMe7boGhVpOOLxPnZltfdGi8tcgzqvO0pyi8m1lJEHyQp8SULY+Q1swas9yZGDoWu1LLNbAXrM+5y8mkgyyUgdS/2WM0+FPxq96acaA5GIsWM99zNwfngMMQ8pZ0f6uTNubEs1PPt0JH+40YXuMTkvEw22+J3nKxZnUphGOaLlh3f2bQUGT83rllRKIXVoMTYMGgrZxghJmK4jC0Ctr6mKRSNOor7Res61X1El1/jEVN0ZIr7IkxJnaiKTojk3tREmJKxI4q70q4vVZ3SKpzzDG0+G2jxwrDDlqoQ0agOgn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/PkPy5oGpKPCENYhicY2DpHfY5ZU+4J8Ci1LC+baXI=;
 b=WEejFWHWILAZmeGpNuoJnZi8S4CDoaqY66cNyBp8/cTpuSrsfJdaSfEs6RkIWAp0XPm0UzKG0SUDEaDdYQB358xtid5TRXmMNRDBgglWNuuOeHwCWR1pS2u5OwJqpt9hens1g57UnDsZYcivkXbaElVQAwE5cHGKeDfRIAGq3L1dwwFaEq8a5YhCWUtdmOka8Sekg7lAPO18QnEZmg+2NApiLle5ly1C0IsPgEcGDR+QJyvnhkyMZVOWikAer+5XBzt3AkudBv9AZDArjhTVi/gFNSxjuQPuXRLsJlP0aB+RlucZO28MjzBwXv/VSbQVXqYiVZGmjzRpALZIBM4Qyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/PkPy5oGpKPCENYhicY2DpHfY5ZU+4J8Ci1LC+baXI=;
 b=RH5tBVwzbcbuGXwNuwq0RLEAsBONM6zENKGhUm0t/6lgP4wJZWL5Amcu1jfdfozwGTSz0sz9kD6NzmmcHpsmgX1TuMTD8Dk1xiy/070/MJ7BH/Pm7wm63u/w5lAoM0ypbGvpUfp3pa1oTJbXQ3TlAWc1PY4uVdK5J87dxVZQyBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b6dc5f41-9504-44d2-ad17-72d0b20f1434@citrix.com>
Date: Mon, 15 Dec 2025 17:08:13 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/ucode: Adjust parse_ucode() to match other list
 handling
To: Jan Beulich <jbeulich@suse.com>
References: <20251215153245.2675388-1-andrew.cooper3@citrix.com>
 <b14362f4-aaa2-4ded-943f-4ad4a246f521@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b14362f4-aaa2-4ded-943f-4ad4a246f521@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0025.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::13)
 To CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ae536a-b06d-47cb-7ab1-08de3bfc8a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WE05bnVaV0NJOFhUVUhhcXJpZDJpdElLZEhKUDVFRFRrMTRjV3h1OVJ0OVlu?=
 =?utf-8?B?MWh4RS81Nkhzb080QnEwRHM0cEl5SDBMZlErRGorL1VaMnl2S05lYWkyYUpV?=
 =?utf-8?B?QXROWFJEMTkrSG82d0k4VkMrV3dZd0oxanMrZnJzL0MxWnN4V2o0TTB1UDJr?=
 =?utf-8?B?N2E2bTRWQzBaOUkveExUdW94Wmc2ZERkeSt4SnovTHMrTkpZdE5GOThnTzlo?=
 =?utf-8?B?bFhQRENJaEFCMDVEbmxXV0M3U1pEQTF5Syt5azVYU2thWGNWeUNJNUo1QUU5?=
 =?utf-8?B?UnFHRmxsTndVZEw0R3hZdU1ZRmZSRXZvaEI3dm9IME5NMUxMdEkwcUo4cmlC?=
 =?utf-8?B?V2ExNFplOXlBU1k3aDBFQUhNQ3c3azNoUGRUQytpWmRRdm9oaXBmY28vb3h0?=
 =?utf-8?B?MlU3WGdXUUdOK1BlU0dZdXRzclZqVkVja2VKVTRaS3VQOXIxQXVGa290OEdr?=
 =?utf-8?B?eFZGWEtrMzdHamVlYldxTmgxU25JUW1XQWtJOCsrMnprQ29iK1Q0c0EySVRC?=
 =?utf-8?B?VzZNdHV5MDZtaFIvSGkzQjdKZCs5Ymk4OEcycjR6NTUzTTZtMUlLcTZxNldl?=
 =?utf-8?B?RW5DZTFRNk1RTE8rLzhBeW1GNzlaUjUxd29DMDd1Zjhvenhxczk4UXFINmZx?=
 =?utf-8?B?US83TTZqUnZBYUduMzdtT2dZd2lwTmxCK0JaUVBkc05tUEkxM2k2Rkd6ak1J?=
 =?utf-8?B?QkVYejF4dFBGVlh0TmV6YnZrcEhRTEpkaFpOVjZReXhXRnpLQUVpZ0s3cWZL?=
 =?utf-8?B?N0FOM2QrY05NUlVNVnlsNmtHVEcvRWMwQkpQNnVZV1RPTHpZNUM0RERaRUto?=
 =?utf-8?B?Y1VTRjA5N2oyaFhwNURxcDRzczQrSmtJUHlOYmMrN3luMTVnakQvTzc4S29w?=
 =?utf-8?B?VEN0V0M4TElJcHZmVWZtUmxZSHVxOVY2RkU4cEFTM1FuVVg3ZDM5cU5FWG01?=
 =?utf-8?B?RGowVkw1L2RVSFV3YjZQeG1yUHdPaHNyOFFjWjhNdXhwWHBGL3YxOXBVU21B?=
 =?utf-8?B?OXhVOGVGUkg5SVBsVWJrYUprbDZxRmNONWtvOHJIVGt6Vk5pZWd4Qm8zZU1u?=
 =?utf-8?B?bkhnT21RaDcxcndjRUVKbVZxRm1LNTY1anZiYXp2TkdYVmRwM1ZZRUdjVzdX?=
 =?utf-8?B?MkovME9EeUx1VWtRR2hqcW5mRFc3Mm1odkxxTFh0OWxWZG8zVFRscFluZnNI?=
 =?utf-8?B?OXFQYTJjN3RwSU5HZ3pVZ2dRUnpGZ2ZKV0FYOGZvQ3JWZ2lkNkloeUVsUkJG?=
 =?utf-8?B?ZVJwWi9CeC96QTdnRTgyWDhramlMdmQ0Z0lKNnBrT1JLQjh5aHRpSkloVVBv?=
 =?utf-8?B?MmNtbXg4a3NrQjNyY0JXV3Z5bzV5SGJUc3NLMmhxM0VWRUk3MThLWUE5NVdS?=
 =?utf-8?B?ajJMT0xmY09BQWFWRXhvdXRMQ3N2aFp3dlZXZUVXdmQ1bU5WajNXbWQ5R2hi?=
 =?utf-8?B?SVFtL3NtZVB0NzNpckhXYXk5VHRQVWpodVdyVEI4QUROVHhpejduSlFKWWZq?=
 =?utf-8?B?NzZ4dTNuTVVuaEgvcEpyRXNBbFl1QU1mQkQ3UUJUc2lTNVgwMUoydjFNcHlW?=
 =?utf-8?B?eERjSkxXbGxKQysrempTK2F4S2xKOWdzcE9saFdaM1krdmZVQXRoUXo2TC9U?=
 =?utf-8?B?V3U3V3YvdVJLRmFWQUVPMEw0SGpvSzBaeS92d1dwanF6b1RkaGx5c1lHQVU4?=
 =?utf-8?B?cXljd24zUVNvQVVDb0EraTdaYWtHRHlaMnUwWGE4SEVVWE1mbjFHZ2F3a2Er?=
 =?utf-8?B?d1R4VDNsUWFKRmhYa09PNHZ1cDBWdVI2N2VTbGtXNTlOVWFpR0h1aUFYMjhv?=
 =?utf-8?B?RjhLdGZaS1N5ZjFWZllkRFBoRnRJUjRnQzRJSkxlWmNnaFVwODJFQmRJNXZB?=
 =?utf-8?B?a1dsbHlaYmVXN0taR1ljaklqcjdiZzJvV0lrc3dOaXQ1SktkKzdneldTTWpr?=
 =?utf-8?Q?bpC0YIRVxNKU9zLMaR0zCnQ8tsAZRkoi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUcyV254SU9zVHFEbGpjek5wRnVEUXM3TW9WY3FWUkpUb2kxdkZ5UFpxby85?=
 =?utf-8?B?ajZLcWFhWHdwZjFCZUUxR1l2ekN4dXFBWi9JRDZCdGVCS3pVNFFkMnlDb2tv?=
 =?utf-8?B?VXphaGtIdWFsTG5vWVRua3RJaDQ2MkRTNXViZi82VmF2Y1Vvb1czU2FseFhh?=
 =?utf-8?B?VG4zL3RRTHg1M1h6UGZhY2M4cWtNZlhTekNqSS9uQTdPZGc5ZEc5SHc2SzdM?=
 =?utf-8?B?ZnBBTjN2UXB4bGNNbGJoRnRRajdKbm5yYUNaYVJZVXk2Sm5iRnBwOGRLZnBX?=
 =?utf-8?B?Uy9jR0I1ektpZWQ4RFBTdTJoUUtFR1psNU0zS0hHd0FKRllKeHBFVHA3UzZB?=
 =?utf-8?B?TXZOblVkQlZVSm5SYVhiQ0RkM0l1WmJmbURJZTQ5WEsrUnc1aHFjY1VsZktp?=
 =?utf-8?B?dTNJNjlzU3JuVFlqc2JQaU1FNEUvbWMyWU5xYy9kNEtQMW1hNDd4WkpZWlJn?=
 =?utf-8?B?QlJtam1wc0o5MytOdmVnRUl0d3FiazVxZy9wamlaYXE3c3ZpUi9lU01UVUp1?=
 =?utf-8?B?WXhoa3RsODZLL2hWelcwWDBqbkRiWjBVME80WE1QaGxkajk4VmUyV3M3WVh3?=
 =?utf-8?B?d1VSRWNzckliVm05WjVyWHFPR2hSVHVUcE9MdjJ5bS8rS3doYTNjWjZaUjVj?=
 =?utf-8?B?UDlPeGE5LzdsWVFObUo2MHdnUEpPU3I2cEdhK1FzWnpvY2taWVhSVEt6ZW9E?=
 =?utf-8?B?U1ZNRjdNYy9vR21TYWI0YWJxU2dLblBxcFhZYnZWK3Fpa0xCOTdST0RXUjJH?=
 =?utf-8?B?UEdSR3ZrSmpMdjRQdWVpdTdJLzI3TWVyWTVSMFVQQ29zZXdUTnJrY0pIaGQz?=
 =?utf-8?B?azBscTRKdWdNVTZHd1luV0k3OC9BS1Vud1hqZjBGMWVVeWFpRzFrc3d0U1po?=
 =?utf-8?B?bnh2SFdpL3Rab2tqWU84d3BOSTd6U1VhT0ZFdTV0U0hkdUFmQnVHclpvODBi?=
 =?utf-8?B?bHF1YVFBT3JVa1p0UDhlaTFCME5mRzBGQ2JyaWMvR1FMU0kxdSs1R2M1b29L?=
 =?utf-8?B?TXhyMkxac2F3ZTB5SXFEN01FNzBqSWFmQnNWSTU4L3BZOU0rQUE5ajljRjhS?=
 =?utf-8?B?ZlZWZnhGK1p5SHNJK0NlWjV5bGJFb3VFSHVjZzFwVmNTNGhkenVuWGd0ZG5u?=
 =?utf-8?B?WjR1NC9IWDh1SHlQYmcwZzhHK1Y0QU9Uai9qNllpT3pyb2tQWnpNRG4wSnpL?=
 =?utf-8?B?V2YwNzh3MnlYYTExclovaXppVzV1ZGQ1Q3Z4Rm1OQmtBM2N2emhFblBackhz?=
 =?utf-8?B?Mm1UU1BzU3dvTW1mQVliRzhzOW1TQ1NMUEdTWXJFcEVZa0t1cWo3SWZHeGh4?=
 =?utf-8?B?N2htY0NTRFZCdi9nbFNROFpUaEUwWHZjdFNINUpMa1puaktNREtGU3RzWnVM?=
 =?utf-8?B?MFB2QlNTTlFGT2pWZFMzcFdna3hWbVdISTRtUzN0eWtPNlA3RXZKMGs4L1ps?=
 =?utf-8?B?dFNyL0Q3OFBXblI4TEdKWkRJbmNvK1pIeEM1aS91NHh2WG1SVU94cXRLU3lB?=
 =?utf-8?B?RzBaSlI5RXJyb1JFaUEvK2g5RzZJVHk0dUptUWJpN2duNkg0b2x0YUV0eVZk?=
 =?utf-8?B?SjdCS1pqWloreWxCSGRaeDMyZXE1d2poN1Y4WmNhZ0xKSFExWUNKL3FBUmhY?=
 =?utf-8?B?SXY2T3kyNHFGR2w1dDJWL1RXUlY1bmJBajNkUmFOWnpZYlZjdVQ3THorVEF6?=
 =?utf-8?B?Y2pNK3l1UHdMUXJnL0FqRUtSMmNGU3loY014YnQ3MHZJNFJtZ3JXKzV6L3p3?=
 =?utf-8?B?YXlwenJkSTU2K2VsZXFrRlRGSndGRVE1TGl6VDVoZlpzc0MrK0orRkpQU1RX?=
 =?utf-8?B?QVIwbU14RUJ4cnczQUFlQkJGZlNzNXJxOGlXbWxYQTh1TnowUDNVN042bTRm?=
 =?utf-8?B?bmhqTlJtK256anRRaHlDY0tIcTB6SEJYSHpKNTZFWTBtTUI4bElmWldHeFZs?=
 =?utf-8?B?bUp6QVUzT3RqenFwbjVBeGJsbCtkSVRBQ256VXcwMkg2OVU5UGdnNlZZeUls?=
 =?utf-8?B?RFhLbjJqTkQxVUZLR2lRVXcxZm0yWkl1Sng0VjEyQk8rS25mK2dDdFkvVW5J?=
 =?utf-8?B?ZjdZQnBTNjlvOXRXbWl0Z1FOUUw1SCtSaGFJSllyU2tublV1SUZRS09USCsr?=
 =?utf-8?B?VEQxTHllQ0VTVWtlRWtRQ29paVJ6VXdNOEV4UXFpdTBsZEJNQS96d0FIeUYv?=
 =?utf-8?B?aUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ae536a-b06d-47cb-7ab1-08de3bfc8a00
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:08:16.6932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNKU11E9MYxlv6EKvcKeNBclQPSQIwNuQ1q7D2ENgfXVX2JjZTgDXBY1ptnOENGZSAtyIKV5P7ZcMahxDnacZrI8JAb7Jd6s3X0SgNAgrxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5769

On 15/12/2025 5:00 pm, Jan Beulich wrote:
> On 15.12.2025 16:32, Andrew Cooper wrote:
>> parse_ucode() is abnormal compared to similar parsing elsewhere in Xen.
>>
>> Invert the ucode_mod_forced check with respect to the "scan" and integer
>> handling, so we can warn the user when we've elected to ignore the parameters,
>> and yield -EINVAL for any unrecognised list element.
>>
>> Rewrite the ucode= command line docs for clarity.
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> albeit I'm not quite happy with ...
>
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2752,34 +2752,52 @@ performance.
>>     Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
>>  
>>  ### ucode
>> -> `= List of [ <integer> | scan=<bool>, nmi=<bool>, digest-check=<bool> ]`
>> +> `= List of [ <integer>, scan=<bool>, nmi=<bool>, digest-check=<bool> ]`
> ... this change when ...
>
>>      Applicability: x86
>>      Default: `scan` is selectable via Kconfig, `nmi,digest-check`
>>  
>> -Controls for CPU microcode loading. For early loading, this parameter can
>> -specify how and where to find the microcode update blob. For late loading,
>> -this parameter specifies if the update happens within a NMI handler.
>> -
>> -'integer' specifies the CPU microcode update blob module index. When positive,
>> -this specifies the n-th module (in the GrUB entry, zero based) to be used
>> -for updating CPU micrcode. When negative, counting starts at the end of
>> -the modules in the GrUB entry (so with the blob commonly being last,
>> -one could specify `ucode=-1`). Note that the value of zero is not valid
>> -here (entry zero, i.e. the first module, is always the Dom0 kernel
>> -image). Note further that use of this option has an unspecified effect
>> -when used with xen.efi (there the concept of modules doesn't exist, and
>> -the blob gets specified via the `ucode=<filename>` config file/section
>> -entry; see [EFI configuration file description](efi.html)).
>> -
>> -'scan' instructs the hypervisor to scan the multiboot images for an cpio
>> -image that contains microcode. Depending on the platform the blob with the
>> -microcode in the cpio name space must be:
>> -  - on Intel: kernel/x86/microcode/GenuineIntel.bin
>> -  - on AMD  : kernel/x86/microcode/AuthenticAMD.bin
>> -When using xen.efi, the `ucode=<filename>` config file setting takes
>> -precedence over `scan`. The default value for `scan` is set with
>> -`CONFIG_UCODE_SCAN_DEFAULT`.
>> +Controls for CPU microcode loading.
>> +
>> +In order to load microcode at boot, Xen needs to find a suitable update
>> +amongst the modules provided by the bootloader.  Two kinds of microcode update
>> +are supported:
>> +
>> + 1. Raw microcode containers.  The format of the container is CPU vendor
>> +    specific.
>> +
>> + 2. CPIO archive.  This is Linux's preferred mechanism, and involves having
>> +    the raw containers expressed as files
>> +    (e.g. `kernel/x86/microcode/{GenuineIntel,AuthenticAMD}.bin`) in a CPIO
>> +    archive, typically prepended to the initrd.
>> +
>> +The `<integer>` and `scan=<bool>` options are mutually exclusive and select
>> +between these two options.  Further restrictions exist for booting xen.efi
>> +(see below).
> ... then you say verbally that the two are exclusive of one another. That's
> what the | there was intended to indicate. IOW I would prefer that line to
> be left alone, but I'm not intending to insist.

You said that last time around, but it's still not how the parsing works.

ucode=1,1,1,scan,scan,scan,2 is legal.  The latest takes priority and
cancels prior selections.

The reality is that | used in this context is meaningless when there's a
comma separated loop around the whole thing.

If you don't like "mutually exclusive", what else do you suggest?

~Andrew

