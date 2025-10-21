Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 375F9BF59DF
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 11:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146929.1479270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB8zS-00026h-8b; Tue, 21 Oct 2025 09:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146929.1479270; Tue, 21 Oct 2025 09:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB8zS-000244-3w; Tue, 21 Oct 2025 09:49:14 +0000
Received: by outflank-mailman (input) for mailman id 1146929;
 Tue, 21 Oct 2025 09:49:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5X6=46=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vB8zP-00023W-Uz
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 09:49:12 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eca128c-ae63-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 11:49:06 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH0PR03MB6162.namprd03.prod.outlook.com (2603:10b6:610:d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 09:49:02 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 09:49:02 +0000
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
X-Inumbo-ID: 2eca128c-ae63-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/Damgjetl/t8AZC/wLeG38ndezdDgifa67Herwe0nFHdEZIoxuw/1SFmqI1vjywlw8Qb504ypcKOIRc/JLLdoBsacW38mvZaAftx+pDOKXFg6NHy3HeNwJWUI5TJx6xcBk6sublXmqBDp6HSj5Q9NeIBcJN7p09b2hoJcbPDHEzn4yn+UBCDgS+uXMpxG8HGmbxpT5Q2W8sgQo1FKHdCUHhIXLyzHDndzh88axemTUpq8jlfk+Gky3NcspQnAiC2EKcYWiH9wuVbwNVCuDvHGlpakIM2f6dKcEKpPSKDHc2L3S4LRmT192A2yVP0V6L0qDIWzlYxLIukLXiMe/J9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xUQveSAMaTSWthRxxUkVrjXbBu/B05arQkqbfcOES0=;
 b=ZKNFnobMhfmdrH4uLemTv4f5MJ+bXDQrrmURRT03eOOW4nsaIFTVhLhQzFwZxCPQvPTexFVV10dKawsmzp9GSo9uRn4DETwa39bHO/GAwNBNTv2T1P8VW31sbejp93nFhyMSXNxWqRjeV6a1prZWjEetSpmVLoP7h2KGRON3OTYyEzXNY9vgHm/WbipDsC6SXxrMTBcQb9I90e6LCXDqCKRGli0eABvDQ9xfPlPVVhg60855SA4i5Ai67KVnhhw3KKCwZPuVrGQOrN5WiXc2eRo4ddB7eLUg0IKrf9puM2erfn+Bdw3i7CKF3fcvolGzCDZzVd8MFvlULrMu7ntSpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xUQveSAMaTSWthRxxUkVrjXbBu/B05arQkqbfcOES0=;
 b=pgi9vI3Pe+cDYwGIM3XMrhxvuwFgYdATKAn4RRzNX/9R+2KAskYgwH9XVufkeOzbDNzQF1UwPnFpC1da7IXKB+SRf5Kupbio5D5K7gOqj7zXxwzyE7kaNMtslCaZrkmgbimEiNmwrT4MlcjVMJM/EApC8AWlZQY/u3e3lkPIFfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Oct 2025 10:48:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21?] AMD/IOMMU: unshare IRQ .ack and .disable
 handlers
Message-ID: <aPdXCTvrcUHv2uQM@Mac.lan>
References: <3cfa136c-3689-4d47-8a69-ce7af12ed9d0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3cfa136c-3689-4d47-8a69-ce7af12ed9d0@suse.com>
X-ClientProxiedBy: MA2P292CA0013.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:1::6)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH0PR03MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 386a02e2-258a-40fc-0e2c-08de10871082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDZlRHpJK0FtczcrVlVwTDQ0VXI1Q1NsRUFyS1ZwUTR2RTlEdHVHQXpwWEU5?=
 =?utf-8?B?aDNjRnNrN1JoT0l2bEhlRndRZjUvYWxVYUxQbzQ0Uk1GSVB0ZWtnVlJjUHFw?=
 =?utf-8?B?M3l2bGZmcS9uSTFuNHVzdWM1Um50ME5aZkhNRjNucGVrOGtCdGNqeVhtM1Nn?=
 =?utf-8?B?NXczK25YM0pJMm93Z2g0bEZqSnBJVmhTYVlmY2RBeG1xUmNxNkFkVE5SZEEz?=
 =?utf-8?B?OS92ZkhxSW9sUnl4NWZRcEE4OUhJajJTWStmeFhNQk83YUMyTTBqaTZTUGUy?=
 =?utf-8?B?RWRzRlVLUTViZkhPbU5teWRxN3B3OC8reXVCajR2N1RlKytFbTJjVUVoVlJq?=
 =?utf-8?B?UTZ6SVpRME1tTHRTYnRNemJiTnB4NGlCSzEzeWtDdmVVREs2VWhtTVgrODBo?=
 =?utf-8?B?bzFUWlQ4cVFXRkNhREtib0xvNUxMcGVFQ21nNGtDejZoOFZmMGsxN21GWWpI?=
 =?utf-8?B?NXlDbGlvK0lZMDhRWkhrZ3h0Z25XaXBoTDcreTQvZDFwSVd1a1J2QjZkYjVk?=
 =?utf-8?B?Yll5NmQ1UjFwdzlJM2lGV3JNNmg0Zm0rYW5UeWtUREkvT0V6MnRadDQwUXRR?=
 =?utf-8?B?OXJKWGk1SC9UMWZLOFFxVVExbHZBdjRRZ1o4bUV4eFgvY3ZhSEpudlBRRHFO?=
 =?utf-8?B?VW0yK1lXeEJjVG1hbld5MlZuM05MRitBRUREMVNwOHRZTjI4SUpNQ1lEZHBa?=
 =?utf-8?B?Q0QxbkIrOTdsZjFiQ0VUQmYxdm9OWmtad1FSUjgya3FMbDE4ckNTMHZKL3ll?=
 =?utf-8?B?Rlp4V3JnNjZVWjIzSDg1cVJ2S3JpbG0vMTNwcmVyRWJJRVdPUTF2bUE3WXBZ?=
 =?utf-8?B?VmpJc2dLVlZoRGozSC9yY1BObFVSRk9DVFdERHBXTXpjVlFDcGpHUmRCbkpQ?=
 =?utf-8?B?dVFyaWttc1VKdjYvNVJFL2wrL2M5dTZsTytCMURsRnVzMGJhd29yUXRqRkNQ?=
 =?utf-8?B?eTUrRjRIOEdiTTBqa2pXUVBXejg3dGFkaCtIbWpNTlFhMHB4MmNWcWloRjBt?=
 =?utf-8?B?K0JNanBvMU5iVk9ETEdJMlRWaE1KVFExNVlkYjRHeWdQT0tONjlrZ3lYdDIw?=
 =?utf-8?B?OUl1Y01ocENEeEFzWUxqTStPM3FaVHh6RFdmcHlHN0EyeUtWZW9CUEVHVjc5?=
 =?utf-8?B?MDkyd0tRczJ1TWRTaTNyOUpLcjFVOVJSWHN6UUhFTkdqU3RONjJLMXBySTN0?=
 =?utf-8?B?RFdJY0hVbUxZdFFsWTBlTTgvclNVZnBmVm1INGhwNk5qZVl5WDB5K0NIQ2s1?=
 =?utf-8?B?anJ4ZWZCUVFwRTdNSDY0UDI0UXlSMWRkQTJzT3hEM0hVMEJ2TVpUU0NQcnRn?=
 =?utf-8?B?cXVZZ2lkT0pwTDdBaTQxYzdSR1dBbUdYRDYra3VaNjczdUNUZEJJQkpYU0dy?=
 =?utf-8?B?RFJkSVFoQnpiUzlOejl6ejhrWk82bGtxd3pJY21DRjRXNUsxdVVXeWJ2K2VR?=
 =?utf-8?B?STZaTlZzZmVHeWZyYys2RU1aelkxN25yUHE5SUxqU2l1NThvbnpFWExjM3Z4?=
 =?utf-8?B?VDV3UHA0aVhhS3VQQXRGVmF5SktBeWxpc0d5a3g4Z1FQUkFZZjQwKzNWNFlq?=
 =?utf-8?B?RmJrc244Wm5LM2VIQkNBbVdLcG9wVjV5L29ta2VPT3BScEVxQjR3OHA2c0pG?=
 =?utf-8?B?Q3lDRTdIRE1VQzB2b3ozT09UWldIaXZKM0g2UHNnMHZNemFxc1k3aEJQNDdJ?=
 =?utf-8?B?TEVSd1NQTkgwbWJYSzNyS3BCRjlmN3liZkxSZXlyMWovMmwvTmxUMHBsM1pL?=
 =?utf-8?B?OTA3dUtwSjRURmNGdlBUUk0rbFNoekZuVGg3Y1ByRmtzalpkdnVBL2VrTmNJ?=
 =?utf-8?B?WWNNRmI0S0YvbzVEQmFsdHlwaG9FTzhFbUJPSUlTTUFYcTZxcDdTV0VGY3Nk?=
 =?utf-8?B?Q3J1aHduNHkyOHlSL2xWaFhEYWNiZU9VQUUwUFhJbmJ3YzdOY2RXMjhSOUZp?=
 =?utf-8?Q?Skk0maQAbNF/MZ/akazUw1BX7hdH4Yne?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm1hNzNUcW5iU05vT2UzRW1VeFdOOC9NMDR0QXFnOW14K2gwVmx1b3ZpVDds?=
 =?utf-8?B?NGxhY0ZwR01INEdKOHRGQ1hVdUFvSDZnVHBvMDdOMlF1bnVKMVVDVS9ZWC8w?=
 =?utf-8?B?L2FMMVc5SjJDc2hKWXhXS2szRXZNM0M0a2d1ZHg3UHl4czQ1d3kvQXF3dmtX?=
 =?utf-8?B?N1VIZ1ZYN1oxMHo0WnVaa3lyaG9ieFFnN0VlT2Y0aDFQU0tpS1JucE9MS0ov?=
 =?utf-8?B?Z3J3blFjc0oxaUFxcm5taG1KMDd1bFhFb3J3YlQ5d1RXYlI3bGNvWEFWbDVC?=
 =?utf-8?B?NmtRaDJPODFZZGdLbmlVN2xIZGxVZ3VoR3dTTlhRUjZ3MHV2T2JEbmxLOG1B?=
 =?utf-8?B?ZHRoMGsrZXJxd3VvL2R1RnVmNGFhTC9NQ2lNN3BFc0xGaGtzb2ZQY3VHdEtN?=
 =?utf-8?B?eU4wY0VYeVppdmNNUjdVWmRPT0JzN25tekQyOUhZRWFPZFl0RFdRMXJjMDB2?=
 =?utf-8?B?NGZJRkg3QktveXF6Y242UzZxaG5KMHJIZEpWWlRHcTNTZkNFR05RR2RlRXFo?=
 =?utf-8?B?QW9Qc0xTYzRTY0hBOTNONWkyelNpeVVoalRsdXM5L210S0VNWUI2dFZVU2Zl?=
 =?utf-8?B?K21UZ3JBMk81bWNZd0gzSTl2KzBjcUo0bXFiVHdabEdlRUhaZ1JHZW5UdFVY?=
 =?utf-8?B?WFBFL09wK3JaakRrdXllOTVZOXZWQWZXYXBMZlFZbWx3YmJSbUpUTS9JWVlm?=
 =?utf-8?B?Z2NpNnNQcWhvT2xuUFAzbi80K2RqNy9uekEvczI4MWcvalNEaHJ1eHMvSXRa?=
 =?utf-8?B?WnQ2d0JwQm9QU2FCbUlUVWIxQ2pmcGk4dEVDSE1vbzE5MndiYkg1cmprckhJ?=
 =?utf-8?B?K2NUZkdGL2ZWSllBWEF1MTRXNm1odkZybmNvUGliQklrYVdQSjZWZnJzSkJJ?=
 =?utf-8?B?Wjd2VHhOUDJtdEFXeFhzbjQrb1lzUFQ0KzBuTENSU3UxYXk0T2xLOVVtUzNs?=
 =?utf-8?B?eGFucGxQR2hkbzgyNjVIQ3N1dW1sOHRVK0NLZWRXMjZnbXorTDV3MFI5VVlh?=
 =?utf-8?B?bFptM0NFUkhhY3B3aU9hVC9ZS2p2dExjNWI4bWJMc29vdWZHMXhwL1JMNHN3?=
 =?utf-8?B?dTkvUmlRWWdqb0pZdGxQQ0ZxTkRGZEZZNkQxVTg3Ly9rSndGbFZua0d6cVFX?=
 =?utf-8?B?ZXphUjgrY2EzWnkzYm10REIwZEE2Q3R1ZnpXVFR6SjB0L2NqU0VjMzk0Szdx?=
 =?utf-8?B?Q24vT3J3bVVYWVdTUm1raXo5VkNwUFBWYTlwb0l0VGhVaUNoNW9YMDlHZThq?=
 =?utf-8?B?K0VYM0szOS9aUkczUXI5S24rVDExRTBna1U2cHcvT2tBY1pRaW1PRnRJQm1F?=
 =?utf-8?B?QUVPYWJDWkpSOU15aXpvQ2tNaXRvbTEvNkIvbTZudWJueStLVWFtSlNVRjJy?=
 =?utf-8?B?bmNCQmtZa2JIcWl0N0JFU2FmOHhoek9HRU02NmN6NnRJRVZiVFZOclR5VElP?=
 =?utf-8?B?ZVpHcHNYNTI0WktkSkZQSEZwc3I0MUlTdFlsSGNlNlI2VFQ0VmVaLzZyZW1i?=
 =?utf-8?B?M0YxaDlhMlkrUFdIZy9RcWZkMTJuU2xFRkZSZEh1ZEF6Q25yeGt2T001WS9V?=
 =?utf-8?B?MDFIUDhncFUvalBvQzJYdWZHRHc2ZlBzMThsbkxTVWhqeVFyYkM1V05uNkVF?=
 =?utf-8?B?Y3ExTTN1Q2xGcEhWQnY1cFJ6UTZHTVkwTHZDVG9MaUpBL2RqMk5kUTlPVW5O?=
 =?utf-8?B?N21EelNMWFd5VnEyajVNTmJVSGpUb1RCRFIvSHAzczM2aVFRaGIxd3B6ZXMr?=
 =?utf-8?B?ZFRtcDMrT0NodTVESUJrdGlXRUd5WXNRMkw3ejlEdnVUOW9Kd3pQaEFXa3Bu?=
 =?utf-8?B?QU8yL0YzSmVGSkZYUnpleTIyTzRYR0MvNnpzM3NJVnRJMURnNDJRSks0a3Z3?=
 =?utf-8?B?bjFOandMdUtSMlNpcTErQWtSc0tpdlJyS2h5VkE1aTRIeFUvWkhGRS9FSUJL?=
 =?utf-8?B?bGs0aCtBWURqWGh3QkVpcGIrSVhaSGgydkpyWXlUU0t6cXF3RHVReW8rN25v?=
 =?utf-8?B?VnhOaDB2cXBYKzBEWGN1M0svNEpUVXNSOUFwOGxlUHA1M01VZEM2bDNSdnJD?=
 =?utf-8?B?a1FtY1lFMDFOcmNqWEx5Zmh6UzRJNHFaMWFlTEhtVER1bmduRkJoZE9CYUVk?=
 =?utf-8?Q?+7qIlBLuqf89waP0PT/whFJ8g?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386a02e2-258a-40fc-0e2c-08de10871082
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 09:49:01.9787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TI+KbixX2NqklofQ+PEuW1c2VezyakUCg0jp+bqpMnkGfBAulmJWQweRmm19dCjKRfEJINTYcXR5ko/Cdtm7mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6162

On Mon, Oct 20, 2025 at 04:16:13PM +0200, Jan Beulich wrote:
> A .disable handler can't typically be re-used for .ack: The latter needs
> to deal with IRQ migration, while the former shouldn't. Furthermore
> invoking just irq_complete_move() isn't enough; one of
> move_{native,masked}_irq() also need invoking.
> 
> Fixes: 487a1cffd71a ("x86: Implement per-cpu vector for xen hypervisor")
> Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -428,8 +428,6 @@ static void cf_check iommu_msi_mask(stru
>      unsigned long flags;
>      struct amd_iommu *iommu = desc->action->dev_id;
>  
> -    irq_complete_move(desc);
> -
>      spin_lock_irqsave(&iommu->lock, flags);
>      amd_iommu_msi_enable(iommu, IOMMU_CONTROL_DISABLED);
>      spin_unlock_irqrestore(&iommu->lock, flags);
> @@ -442,6 +440,13 @@ static unsigned int cf_check iommu_msi_s
>      return 0;
>  }
>  
> +static void cf_check iommu_msi_ack(struct irq_desc *desc)
> +{
> +    irq_complete_move(desc);
> +    iommu_msi_mask(desc);
> +    move_masked_irq(desc);

Not sure it matters much, as I don't expect IOMMU interrupts to move
around frequently, but do we really need to mask the source?  The
update of the interrupt would be done atomically, as we know IOMMU is
available.  Anyway this can be done later, so:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

