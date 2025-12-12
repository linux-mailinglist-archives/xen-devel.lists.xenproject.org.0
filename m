Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38577CB9DCF
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 22:13:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185826.1507785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUARV-0000JG-9C; Fri, 12 Dec 2025 21:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185826.1507785; Fri, 12 Dec 2025 21:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUARV-0000G5-6H; Fri, 12 Dec 2025 21:12:49 +0000
Received: by outflank-mailman (input) for mailman id 1185826;
 Fri, 12 Dec 2025 21:12:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRu3=6S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vUART-0000Fz-FK
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 21:12:47 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d9510dd-d79f-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 22:12:46 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7528.namprd03.prod.outlook.com (2603:10b6:a03:556::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 21:12:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9412.011; Fri, 12 Dec 2025
 21:12:42 +0000
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
X-Inumbo-ID: 4d9510dd-d79f-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q32111bqaIcV9eKI5dAHPO7KreHGEC5tgz08wWrWHvVLdTIqG0ZBHq/ikn8AwcB1z0+p8cDRSlP1vh9WMq2byaK58aVRsGHoI3EXf0K9OmJA/et9N7zsXqMjBZZ1iDoaLEh2JQEhBixOdRULg3Ixe1hLQ2avCoTKQbD1u/aM2x9rFGSlBunOpgncuBwfhlxIXd18B/POWOmd0gvDb4MQ/9JVoLvO1RtX0x1Sj9qaNkNkUs/rvawG6ImJ8Nw2ZswNoRiIUNSJHXilS8lWuCGtVsJyuhId7QbnK8x+AJ6ME3OsONpBlsyMIsVkanu1EHEcQj5w0tKI+Ghs+1nQDggIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVBwWYq2HDV0bnDUqtE04AmAVbf+BYRgICXr/GJJVEY=;
 b=K+A/P7xGILhUX+mBWXIc6zeOmEsB8P+LI3rPaO0ffVuHmzfjXcy/e0RdfFrSxWRF8dIXFu0u7uLHP4eNPKGNrMCKuPXXk2xTM2+S9xbv0IDfGa87yN8LVU3tg2B6E3TJDoZRtdIhhlmDvLbGPeA/w8R/zxZNejeu9jfYgb1wncCImfNmD1LYbDtkuUlwFNTQlrDL0L+gdqvZvMaQ//YmAhB/QxD6SuTHZVywWE3qmd7HYjFmM8BgfKLEqfxsK/qScOPWRbAzIQoA7vFHFYNcyfTwxksUU25mkM4jiNQ/wtnR5No2uIHvnaD5goIlAmhnrVP6UwavBX3PIX7i7BDFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVBwWYq2HDV0bnDUqtE04AmAVbf+BYRgICXr/GJJVEY=;
 b=Jdc3h9G/bY3OH4O63RlGT/BU+xfzc31mIJMtDYETcOiiq0B2E9GpbiQPaglXDx70F5P+ZF3WXVFBFv8IrUqxG8jGY9NBGC3JQOxDiXadz6pw7O9MUaD85VN99B4CYdMrevJHcA37d7s5cwBblmgVUALeuMnOTyJZmFh9I1LLf6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dd3225bd-d416-4b61-8e5b-0a0637b0193e@citrix.com>
Date: Fri, 12 Dec 2025 21:12:38 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 01/12] Add Alpine 3.22 containers
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
 <08274c26cc710d3bfa87a66431f441b5703df272.1764866136.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <08274c26cc710d3bfa87a66431f441b5703df272.1764866136.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0011.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 06bcbf31-c2c5-4d84-0f84-08de39c32fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGlCV09iTkJOQW1ocTVrVCtwdWUrcTAxVDRYeWtQbmkyMDNGOWJ3M1dNaEZT?=
 =?utf-8?B?a2U3MU4vOWpaMHVNYkMrMU1VeDFJRWxMZ0dVbXNQeEd6ZkR6dCszTmY3TWlt?=
 =?utf-8?B?ZnBqSTNISXdycGloZkdhd3kvNW5mK3hHUmZMNVVwM1NJRlVJRzFmbXJmL2tW?=
 =?utf-8?B?Vmc1cllMdDJjL0o4QUc5MzhWQXdyVGdrQXNwVHQvWlUwSEpycjRZZW53NUp2?=
 =?utf-8?B?SFJFYkk3bWY1YTRWb2pESyt3aW9UMHpEYTJhcmZ4dU5STGVkeHgweXlFejJw?=
 =?utf-8?B?Y29Hdjc0N1YrZmVHZzRLU3NRVGRxdVZ6TCtja3BaZVRQcjVGcGltNWkxdnhM?=
 =?utf-8?B?NmJqTk5xVms1cHFLcXlQMW1PT3BOMnFpZm5sV29oeGxQRXFpcXR5V2FFeUNE?=
 =?utf-8?B?S1V6bzZjV1NXWXF6OSs3cGc4WTV2eG5sM3lBc3A3QkJMaDdHRHB1Tk1iN0VZ?=
 =?utf-8?B?RUc2d1IyQmp1Q0JMM2U4NjR6SFBNaHZFOTJPbHpVOXkwRFJpd0pRTVRKZVJv?=
 =?utf-8?B?b2JZN2srVTdyY2J5cG13SlVJODNmTXNUcEovZWVwMy90V1h2WGNaR3lNeVZ5?=
 =?utf-8?B?bmhhU1hJelkxL1BtQ0JEUnNzMVBmM3JZR1U4Y1JRVkREQjJ4SzJqekZydGtO?=
 =?utf-8?B?MFNyYkZRbGRFQk9VTjEzbHB1OXBEVmtlY3F5WlVJZnRBUjZUellKcmcrRFdM?=
 =?utf-8?B?TWF4d3RENmRhQlVSWWpocVBJOTdRUXFaWEtrQUJqQTFwWjBNZWxBRFNPNjhm?=
 =?utf-8?B?ZkwvN201SFFZalk1S2wrbHFKQ0lqS04weGVDbHkvcUF5Ny9sSmhnMHIyZUJV?=
 =?utf-8?B?dkZZMXVMVlBXQ3FrVnRKK1RGbzNWS0FFTVRrZUNRekNueXVYNVpCNnVMcXR5?=
 =?utf-8?B?YVZTcHNhemEvSURzWUx0YjZJL3p2RXU1N1lXMjlLb2xPczVWcHJ0UlZYTnRn?=
 =?utf-8?B?RkxSbGZaR2VWSGVqQlJjZVdjVXV3RGlZVTdQUEtzUmp6VjJCYVRYSEJ4N3gz?=
 =?utf-8?B?elc1SnJibGkrN0lYN25ZQlNSbG5IaVE5azIrQ1V3NFdlSHNJQ1RwWXNyS04x?=
 =?utf-8?B?dzd1b1M0YkNQS0pLSFArR2cvK1Qyb2lKejhIVndwa1hESmVDd0dZMkt3cUk0?=
 =?utf-8?B?a0dFWEVtL1ExYlVSSm5UT1RTR250NkhpQVQ2LzZNb1FxK1Nodm9Iem5sTHNW?=
 =?utf-8?B?WVBQQUtQUkpuUkI2L0dTMnU5SkVVaGoyWUlwdUVVY2ZkbGVTWUtwVlFtVmZt?=
 =?utf-8?B?K3V3NHBMdjZjSG5BamQwdTI2cnZta2E4clBaOEV1bzlIY1lxTGlYVUJVTENR?=
 =?utf-8?B?SXZReDhVOEFlWklVdFIzU210aG9aQ2o5bEVFVVV0WGV6YnBmdEl3U3dUazN4?=
 =?utf-8?B?WHNpUldZUnFrZjkxVGlIOUlrcTBtaldyaXU4cEdLWFpLU2NVV2kwQS9ydlR5?=
 =?utf-8?B?Tjg0dTJlVFlQZC96TW44NVN1L3JkRnZSSzR5NVVYSjNZWWloMW9SdnVnUFNN?=
 =?utf-8?B?OVJacTFxU3doZmQrOHpXekVVNUU1UlpDSDJSK0I5ZkE3UlJLN29pdlQvY0ds?=
 =?utf-8?B?bXlkNlBaYmZiQnYxOTFrVTdjYm5vcSsrS1VRR2dXT0llTTh2aWFiL0UwTTdp?=
 =?utf-8?B?Q0UrTEl2azcxZG1QaEFSSzFrZ0RpSDMwZVJuSkhEWm5FQ0UyTFB2RTc0ZG9w?=
 =?utf-8?B?eUtSbSs2Q2dNdld0TW1aTWFpbXl5TjRqYUROR2ZnVDllNzlRU3dzcjFlNFk1?=
 =?utf-8?B?NmF0T25iMU90VG5XZEt0NWJkMDdaUGJwZkFZb1hiaTZXK0dCUExETXl4ZXFD?=
 =?utf-8?B?SEN6NncrSTZDOFVpTTVMMU9XTUV6bjJBYURzblozVDZEWlhDUXhSR2hhSllD?=
 =?utf-8?B?c0I5clhBYlpVRkdvYm9pM084SlhlRUZxNmQybkxvc0hkS2hHY0cvUkpINjQ0?=
 =?utf-8?Q?2WPlgukY7qjB2RP5awR/7t7xzU+KGtDy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RG1FSnFrdlBnMFFXK1I4VGwvRnQxcGJpaEJNRHlnKzJqUGJoa08yWUVQYXh4?=
 =?utf-8?B?MENNWlpId2l4ejZwdVVkbmpEYlloVkxSNlBRVnF0OHBuTEk3OVpoUXlySlNZ?=
 =?utf-8?B?Yjc1WE1SRzBQMkF5RUpqTCt3M3d4SitCak4yTHNrWVczbjhmOGUvS1BUQmZs?=
 =?utf-8?B?cWtzOXBsZDFPVjBmV3pPUmd0ckovc1h4VVh0bkhiN0JwcHVCUDJkQ000eUtB?=
 =?utf-8?B?VjhSbUEzRzc3YmJMeWFDdTE1MVZZNHhUemxESks4STBmMmFrSk9PNVVvTE5V?=
 =?utf-8?B?MFU2bHlPRUZ6WUwyYmhVZ2hPUlJnTkhrKzZiOVNqSWR5cG1mRGQxMHluNWw1?=
 =?utf-8?B?MW5ydXpZcDBnR2oyQ1RZNCtDMFhjT0RBbDRRRUpRL3I1RjFUUEN0dzFIMDZH?=
 =?utf-8?B?Rnp4OWFXQ1hTTWZlZEU2Z3krZFZUc2d2NytGOURlT3VHK0tJYng4d1I4WFN3?=
 =?utf-8?B?aWwweXNmWHZyQ2VoZ3hZUzRQaXh2bkFLWmZKb0cwYjVKc0xYRG9PRmlhckJz?=
 =?utf-8?B?TDRBeitaNktXV1k0WFFseUwraDUrT0dYVGV4aFliV0w2SWo1OHNGeU12aHQ4?=
 =?utf-8?B?R0VzRnV4RnkrUkY5amFGTDlYSEc5QjEvVkE4SHcxS05tUUJ0L253RHNHMlls?=
 =?utf-8?B?V3pZUThQS242ZDZUeUpiYTJBWkV2RERvblBSQWNQaldsQ1FyS2xYeEdDaDVN?=
 =?utf-8?B?bHVzSnc5UHNnTW9PeWZsalFnb1lEZENDeVExMnk0YUlVV29iYnlkdXA3MlVi?=
 =?utf-8?B?MnJhUm0yc2lQQnVTYU1hQU5IeXE2NzBtazh2R0tjWWFOUkppRWsvbW03QXBi?=
 =?utf-8?B?aUNqaVZ2MFBORTZiYjlYemFFeW5jTzRpNUVYakFSSis5eWJXaGRpQU40WFFr?=
 =?utf-8?B?KzZ2VUIrOThEdjNIeFh0ZEoxY1UwS0RQRk9mZTlsbk1pVUE4RUVJbTV5UVp0?=
 =?utf-8?B?ZnFOYXBSK2tRbkJzOW5UY3hHRitrMXdmeWNaRXRtd0k3bmo3WDJNSFZBOG9y?=
 =?utf-8?B?dlhlTGdMdFdKMXV6NUdtbkpKT3VhS1I3SCtPelB4SGs1akpQZ3BBOWhyazFw?=
 =?utf-8?B?eTZReitacDZZV3F4ZytGYjIvUHZBNU10QWRCZlBQalJYelNrQjVFbC95ejB6?=
 =?utf-8?B?NjNGRXNURnY0QjdDSHh1VHRLem5BZGJsUDRIVnlEQ3pLUlpNa2V4cTFUd0Z4?=
 =?utf-8?B?RTl0MWxsQ0tlckkyZUREdzJFOWcyeVJocnRQMHM4YXBmSHF4c3NUNStVZnZt?=
 =?utf-8?B?T3NScjdmeC9EVm9oVFdmYXBxTlRmK0xZU2FBL0RvbU5MSEUxU1ZKRFNpaXI4?=
 =?utf-8?B?MWdzL3lVQUpnMGhkSzJOTFpxVnIvNVR1dk9zWTlKYkxoclVxZ3F1VkJ1cktP?=
 =?utf-8?B?R3Q2UHJrZEZ3ZHdiMnBhVW95bkE0b2kvRThSYTRWdmE4MDRVeW1abkFFZ3N4?=
 =?utf-8?B?em1ReG5WNXVLb0FYS1dqKzIyWUw1akVnRDcvNGllelFtcGFXb1ZjTlR0ZUhq?=
 =?utf-8?B?ekxjdHBPNkFPL2RBNFV2eHFZZDdNRnZsWk9zWjEzZmFBaGN1dWN0dTRGVGtC?=
 =?utf-8?B?dnhoOGw1QVEvazFUZ1lHeVBGYUprQzkwRnZuaFJpT3VTRnlMdXRTZk5GbnFP?=
 =?utf-8?B?bnM1ekdaNElEdGVydHpZM3dCTzRSb3A0WEdzRGh0cVlybkx1NTFwWE4xazQ0?=
 =?utf-8?B?UkYzWTZhK3kwQ0RpdjhTZEpYMklLRmQ3ei9sc2dwVEhyeWszOUV3RmpGREhX?=
 =?utf-8?B?TSt2NE9aaDFSZkFZZFZNczc3VVgyTzZ4NFFZYnUxZHFxa1ZETEg5dVBVUVQr?=
 =?utf-8?B?M2xjcFFvb0RBOU1QZUFObDZqbEIra25xVUx6anRLaERLUXpjUlVVTndYTlov?=
 =?utf-8?B?Z2wyRFdkaWJWQllIcHFyQ2taeExaVlFMR0tuRC95Mkg5M1djRU9vL20ySVRM?=
 =?utf-8?B?TmRDMnlVWW5ydXN2UXFodDJKS2pMSnc3Q1ZnRElqOWxpZGNmQTRQeDhjY25R?=
 =?utf-8?B?NXZTLytFaXA4ZlBOQk1sQVVvZHNDSXI1REtkQXZsdnNyT011WTR1bWY2aFZp?=
 =?utf-8?B?Ky9nSUxoVmFyUXVjQUxNbUg3SXFKZTdlZTQ4NXVIOHYrMFJCeC8zL2tUK00r?=
 =?utf-8?B?WkJsSlBFdkJreHQ2KzBSRmdWYWNvT3ZzTEdham9DNnVNYXBDNzNwMkpaaVJm?=
 =?utf-8?B?Z2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bcbf31-c2c5-4d84-0f84-08de39c32fe5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 21:12:41.9748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVgDS28c5vb9Bvi5ulW43pqpvRad+CRzPXKV6f9B6cNke+9Df6ysBIe2LUgxDnTIqDjcRT2arwrPidaSxbRZWSrDQHBPG6ofdHLJzUMHoxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7528

On 04/12/2025 4:37 pm, Marek Marczykowski-Górecki wrote:
> Add it in all variants:
> - base container
> - build container
> - initramfs archive
>
> libdw used to be part of libelf in Alpine 3.18, but it's a separate
> package in 3.22.

I think this ...

>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  .gitlab-ci.yml                             | 14 +++++++-
>  containerize                               |  4 ++-
>  images/alpine/3.22-arm64-base.dockerfile   |  6 +++-
>  images/alpine/3.22-arm64-build.dockerfile  | 31 +++++++++++++++++-
>  images/alpine/3.22-x86_64-base.dockerfile  |  6 +++-
>  images/alpine/3.22-x86_64-build.dockerfile | 43 +++++++++++++++++++++++-
>  scripts/alpine-rootfs.sh                   |  4 ++-
>  7 files changed, 108 insertions(+)
>  create mode 100644 images/alpine/3.22-arm64-base.dockerfile
>  create mode 100644 images/alpine/3.22-arm64-build.dockerfile
>  create mode 100644 images/alpine/3.22-x86_64-base.dockerfile
>  create mode 100644 images/alpine/3.22-x86_64-build.dockerfile
>
> diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
> index 6fa1d56..c9c0d43 100755
> --- a/scripts/alpine-rootfs.sh
> +++ b/scripts/alpine-rootfs.sh
> @@ -40,6 +40,10 @@ case $UNAME in
>              # QEMU
>              libelf
>              )

... wants to be a comment here too.  I can fix on commit.

~Andrew

> +        if ! grep -q VERSION_ID=3.18 /etc/os-release; then
> +            # QEMU
> +            PKGS+=( libdw )
> +        fi
>          ;;
>  
>      aarch64)


