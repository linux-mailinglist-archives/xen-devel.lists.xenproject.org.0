Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7695BC47F11
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 17:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158582.1486916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIUmL-0005nV-QS; Mon, 10 Nov 2025 16:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158582.1486916; Mon, 10 Nov 2025 16:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIUmL-0005mD-Nl; Mon, 10 Nov 2025 16:30:05 +0000
Received: by outflank-mailman (input) for mailman id 1158582;
 Mon, 10 Nov 2025 16:30:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7fAs=5S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vIUmK-0005VE-E6
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 16:30:04 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8002be1a-be52-11f0-980a-7dc792cee155;
 Mon, 10 Nov 2025 17:29:59 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SJ0PR03MB6390.namprd03.prod.outlook.com (2603:10b6:a03:396::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 16:29:52 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 16:29:52 +0000
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
X-Inumbo-ID: 8002be1a-be52-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRsR3ceXJsqHyT1+TwgXtJCynWlPPlmMy45PnaG9sstbjHN9indsJwoCo5iEt4e7JezFTCiHgxPa2/a1ah6vrPz+d+umB6F977PZGS7pqSoO68HdrJhT3eVe5odlxFL6TfwMQ4vhmqK6BhJdULwrDs5sYMvpkW0aOrwR3Z0q7udESiyryG18i7cwTAsF1s+tQmmj0IwIWggEwiEKh3wM5vxERwDFCbHiyEScOy3Z9lGvbt4cfFHgxFY2fZwOfMBWJYrgAFqaqou9Hozlr4YCiMRSi48mujLv5ALbrKAflQuruWsJh1eGYvUKVnXORqbHsrKm2bvIjzJzwA6yq7Nznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nL+GyyFrwz6uOqGV6oCoXxIJHFMOn2qfbiUELJN9OPM=;
 b=uHKLb4ONtChPz3cixiQ2kq2EuzFnYEeeCMeiUewY+ubF7D6zivG7OQmvCVFkdMndsK3A3ffyDzAyTwnVAFv5YbA3bA4yLWOIndcOeA+p8wr1WYRt0y8sxjkI2biVDF7GQ70jGV65uSRp4uUOxfybvLagKt0BWC3SAxk+MAw/0qkUF5isua+7P+2mhxJZyqwlatGshlgwiJ606eTd0vfUqOXARxv1S2w24UGvwS8jh3lqlbkBWP5F/T1eT4TPq3e3ou6ezBgiFFW1wTEX3E23Y3ZHYLmvcnhQN5X2b2Jec+IOhTTjtF1YUIeIj43WNF5WE7QPij4M6C/MisiIqRV0qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nL+GyyFrwz6uOqGV6oCoXxIJHFMOn2qfbiUELJN9OPM=;
 b=cpR9gho3ItfdiZ8jHk8+nDjm8zXZ7eScI1mXisSTmGODaCYlaeab8w4Bh4D6zjRasnHAf3q86MwCgn63Yd3ZFXBIgvR8Lc3ipO6MVb+AeYAxnb+atIwWTeU0b8tv8yXWJEFGVhdLYFNDK/mmgDWKQO1aAF0g4W9MA9gzAqsa5dc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <60d1d66e-83cd-47b5-9b94-0325f411ca72@citrix.com>
Date: Mon, 10 Nov 2025 16:29:48 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] CHANGELOG.md: Update for 4.21 release cycle
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Cc: Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
References: <1930832802df980a6fe610233265bc238fcfaca4.1758901622.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <1930832802df980a6fe610233265bc238fcfaca4.1758901622.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0282.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::30) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SJ0PR03MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: 153a2f37-9b01-4771-f8b0-08de20765f9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmdhb2RHOTVlNG15V21OYkhYcWhTd3BQSkQrUW5LSStIS3BhM0FDbHY5Sytj?=
 =?utf-8?B?WW5nM2RGUHAvQTlTWm9xMFZMUTd3MWdwTHVZaTFoNlZYeXdnN3FTTldxOEhj?=
 =?utf-8?B?NVEwS1h1SHpWSCs2Mk1SMGF4QVc1S0MwR1hVNFFBWEc5STFGL2ZqWWRGQ0di?=
 =?utf-8?B?UDNSL0JGZjJBajV2N2RSUmQrMW5NWCtYOEZIdVdrS2pyTU5QZzBwUHdZOUdz?=
 =?utf-8?B?MWxWaGJQbkRqNlhkZzNwbVRvd0hCYzNuZ0xwcmx3eFBSL3JybStWRFBLcHU1?=
 =?utf-8?B?SHltQTZvZWVoMTVGdVh4OG5HYU1iUVVTbXdCQUFyQ3J5Vmd6Z2liOUk0N2M3?=
 =?utf-8?B?MGdWR1BuNCtTaGRoTTlDK1Q0bFd1ZHNsYm9XNXNzbEZQdzlzaXBpN0UxeTBE?=
 =?utf-8?B?Mk5Da0NHblZsQ2pTWDljc01pMEJ2bk9hbnNHcG9RQnJUUnBlKzJ5RFRoK1Nx?=
 =?utf-8?B?Q0R5N0piWGNMYmdEV1dDZ1M4VHBlSEdTaU5BVC9JeEhHVXdkUytoK09kU1dG?=
 =?utf-8?B?TDZhaXpIWll3Rno1YkhVTXk0T1VsRk5WQ2xDemZIQnlMV21LWE5oTURFT0ow?=
 =?utf-8?B?alp3RDVvbFZNcUpwcGxCNGwrTUtmS0p2NTk5MUxZV3ZxV0tsbmxmVWoxejdj?=
 =?utf-8?B?RW5ZWVpZdVJ6ZExrNmhmWEVDcllyTG9kOTdwc2pXRFkyNEVkWTF1RXhYREw3?=
 =?utf-8?B?c05USmZXa005QiswN0FJQlFRMnBMTzJ4dFd1d0dHZXRNRGtoTVJIeUF1OTc5?=
 =?utf-8?B?bXRIc1p4UTduSGxtQklrQVI4ZGRDK0w0WktiQWord1lrNHdDSGd1UXdrOFhI?=
 =?utf-8?B?dEt3aEIzYUw2Q21oSFlMR2IwYzZSTlNnWnV4UEEwT0JNRFNJTkZtK1U2cEIv?=
 =?utf-8?B?Vmh6bmJrNEg5R2tnLzI1YTI4aXRVdkFKNzZwdGdUU3huN3FhUkduMjVXL3RQ?=
 =?utf-8?B?c3pnSGJ1R2MvQ2lMZENGOHF5eWNHNDBDM3hjOFd3YmpxWmNQZmZtb05aeVNv?=
 =?utf-8?B?SFhnWThkSmxsMFhBck9OSUo1d0xWdVk1aC85aUcvYTdFLzBmbVpIWndhcWJa?=
 =?utf-8?B?d25jRXlxbDgvd3J2aGxYLys1M1hYaTFKV3AxQzhhZzZrOWxZaGxVRzBNb2x0?=
 =?utf-8?B?ZkkwSmtLUWtRWHhZMVJWand1bi9qNjJBTjR3MGtqZ2xPQUV1eFdGWUhGYUtw?=
 =?utf-8?B?OUZRZnAwWGlYMGZ6K2ZvdmtvKzFLd3FOZDZPbzdrKzU5M3VNWEdGTXpSZnRR?=
 =?utf-8?B?aFpESVdkOGxnaFp6UU5CUVgvalkvdmVQU1A0K2JGQlpPM2ZkZzl3K3lNa1NI?=
 =?utf-8?B?em9XaTJMM3pIWHpUZXJiNmltVngyQVVwQ1lQRHlFdXR4RjlRVUw3MkxjcVY5?=
 =?utf-8?B?K0xabTVKeERFVzdTWFNvZDJ6bW8waHV1V1I2R3BmS0dtVmtScDd6WFlSSW43?=
 =?utf-8?B?ZHp0YjIrL0I0MWpQWHZUWkhCamxqYkU5Tzd3d25WT2gxcGt2R1RjSjJkczdj?=
 =?utf-8?B?UktRUmhRbXAyakNISUJVTndkQUJpWlgyZUV1MFJLbEw5VExVODE2Z2RocXJM?=
 =?utf-8?B?QjhPM3h3VlNCNnFjVW9WSW9UVWNqeE9qeVdSRk13NThHSm5ydERrM3B4aHJa?=
 =?utf-8?B?UGJyejk5K2tlWlhBeU93WTFSajNveGRRZFgySjJSNWNoV2pRQ2U4ZllTVUVo?=
 =?utf-8?B?QUhvQ3F5dWc2NWFrVzIyZCtTc1VqYk9oYWZzVW93akZmVmRwVXpQKzdHVG5r?=
 =?utf-8?B?K0FNMUgzL2o1K2swNnhOdG4zR21Qait6djFnMVdBSUI4OXZHK2o4RUZiekFI?=
 =?utf-8?B?YWxhZFRzSEZEVEE5U0NZRlR1RUMzVjVTQkw4U1Q5M2p0UllLa2RmTTFsR2JE?=
 =?utf-8?B?MHJhU2hjRlBEdFBZMEpyU3dVVDFNRGRLT3Q2dG1EM24weFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1FYSkRHTWNKbUJ6eEUxN0FhOHJobUhlUUxVK0o5ZGx3TnNzS2hPVkRveVI2?=
 =?utf-8?B?cTZhT2dEQkVkN2luczNqNmxjeEpsOENuSktDVld1TytUdkI4TE1ITUFSLzJq?=
 =?utf-8?B?ZFN4N1NQU0Z5TEhsd1IvU1UrYlNSdW5ocStWRFVvNFNYeWdScEVUYmhyQ1Ix?=
 =?utf-8?B?azFHQmJxcEJlUTF5bUgwS3R1THAyTk1CWEIwVktWNUhieEQ1WjhlZTRTaHgz?=
 =?utf-8?B?bkd6ekcxd2Jsb0xiL1JJVGg1UUZGakx4ZG5hTmsvd2lCYWt5a0g5UWRwV0s0?=
 =?utf-8?B?aGlDK0JvelhSM1ZCSVpvYWgwVDJiSjdIWUR4QTFlMlZrR2lIcVlkZDhYZldh?=
 =?utf-8?B?MjRTM3pxbU5uUXNRdjQ5b05Od2lBWFpyNWtxcG5ram9Dd3dDWUV5ekYxV2Ni?=
 =?utf-8?B?NlNnYlZxVko0VXh6Y3labzJVVFBGS3YzN1pWbit6cDdraTB3Q3BjOW1GRWpJ?=
 =?utf-8?B?VmRMbDhNMjAzNndXTThXMkViNyt5TmtxUnRrQ2hrYWNndVVpOVNIZlFjUFBo?=
 =?utf-8?B?dW03RGtFMzJzd1dJZENibVl4RGdocS9mbURCR0hqT3M3bDg0NEZaYWNicWNP?=
 =?utf-8?B?TnFQc2dRWWhaWklIb1drWmQrYmErT2g3U0h0Sk9JNWhFMmQ0c0ZVT0tINUcy?=
 =?utf-8?B?QS8yUnB6MkY3dUg3ZHB6c3BFVWNNV0JWbG96RUJ1dWE0dlNzcDF1L0loRVZs?=
 =?utf-8?B?UFFoOHZ3Y1hveWtuRElRb3Fhc0NpZDI1cjQzd3prbCtDK0pUQW5NWEUwb29s?=
 =?utf-8?B?dTZleUFxbGRMQWRKKy9vZzE1Y0xjM0Z3UFdLRVJoTzVzcmY3YmZkSlN5b1pD?=
 =?utf-8?B?R3kwOTNmamZjK205S3V4WngrcGg2T3loQnBPc2FiWEhWU2pWK1dGVk1RZi9w?=
 =?utf-8?B?VGFzK1ZxYTBsSEpYZ1k3TXZGYk9BWlZGUEE2RVMrMTl2MUpnOHQvL3VwNVNa?=
 =?utf-8?B?VjNVR0tJZUxvZjhQSkdKMmpPNjd5eThIZVQ5QUp3WWxtMms1QWdRckdKVytK?=
 =?utf-8?B?VURLRFo2dXM0NTFDNW1ndkthdE9tZ0dMcnRkRjVHZ2hyK1MwSkJjN0hlcFRT?=
 =?utf-8?B?RW5XMFk2WjcrNWgvcUUzRjBZdkxhaE5rbWV3c3JlN2EzUkNzZm1ZZ1R4TWgz?=
 =?utf-8?B?bFFtWm1ZU2NycStkem5yRXp5Q1o4UzBoaGc0bFBvSm5mNUJNR1ZJTUZaUjda?=
 =?utf-8?B?aHpQZzlMNC9uQVpWNDFtSTV5VzVBdFRGbE9VZHhGSXZ6RTdIVzI2VjBvZVhv?=
 =?utf-8?B?ZHdtRHFER2txeHNyd0hpTmNYeHNjTkJTUXF1eGdNbC9IcFN3SGtucXFCL1dC?=
 =?utf-8?B?a2d0alpyUFN6TC9jcFFNK3NKenhoTklVWVc3WkZpb2xrazlCL05LenBWRnUz?=
 =?utf-8?B?MXU4SVcwMVAvZGdtU0JHWGk0cFBLZHFZY0g3L0dzTnJnSTFhRXpnbjRsUzFM?=
 =?utf-8?B?QjE0ZjhaWTlrSGQ1aGxuRzljUGFNL3ZhZDlTNnJJUm9lYnpXakVvdWpPZTRE?=
 =?utf-8?B?bWZabS8wU0xkUTNmaGVySFRaRHpLbXZGRzNQbC95SmVYWk56eWNwaldyR2xN?=
 =?utf-8?B?MzhiSGE1Z3lpZ0daL2NvRmUrM1IwQTZWeU81UHExaWdFTGxUUHRUb3UwRnhU?=
 =?utf-8?B?SUpsekxtbEZ2RTU0ZTJHdWRLZmlQRC9vY3hPempaSGVBR3NIL2lTdUQrOEFp?=
 =?utf-8?B?aUFhWEVHT3FqcCt5WUJMbEpFRFJKeUxJK1BRbGFPNlFpS0NSOHJTWWYwdWE2?=
 =?utf-8?B?L1NhOWlFaUdWdWtiV2pERldzRSt5R0tZdTIvM05HUkcvMExzVWhoTjBHN3A5?=
 =?utf-8?B?RCtPbkpnN3hBWXU4c0R3YTg1bk5uRC9FUjE2U3NGNU5ubFVIR29vRko4Z3E4?=
 =?utf-8?B?cXNlQy9VMTJoTjIxTldWM3AxL1IxODQ0dVp0bTJFaEpRem54YUJIeTFNSkhn?=
 =?utf-8?B?Q3hEa3FVWEJnN2F3VytFelZVOE1BcURBN29mbDBJcmE5YWtzbWNWK3kxYlYy?=
 =?utf-8?B?MG83MTdSajJkb3YxWFJFZUtRRzhhUEdoMUJTYkZDUWVweis0bks0dklyQ29n?=
 =?utf-8?B?TUVCQ2U2WkIvUHF0OVN0SFV5dUJaN1BjZGh1azlYejdEcXBBNVJTVE5lNVN6?=
 =?utf-8?B?eFlkNFlSbHFpMEFRUGZ4VURBbjJRcWY2WWs1Unl2RU5FTkw4WDVHUGJSdmp6?=
 =?utf-8?B?c3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153a2f37-9b01-4771-f8b0-08de20765f9a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 16:29:51.9438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXVY3mygWCe4fJ+paLglfpafyQmhz5Wx1WIhT/d/GnSt2iDWbf3jQPKYU6B13t2o/tN7SpHv8z3nLfe2gDF9h8dAB4HD6g7bdAwdgmdOlyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6390

On 26/09/2025 4:47 pm, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Chnages in v2:
> - Drop the following items:
>   - Allow to unflatten DTs.
>   - Basic kexec support to Mini-OS for running in PVH mode.
> ---
>  CHANGELOG.md | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ca1b43b940..0afd2eeb4b 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
>     to the baseline change.
>   - Linux based device model stubdomains are now fully supported.
> + - Remove libxenctrl usage from xenstored.

This is about libxenmange.  I think it wants to say:

- Introduce libxenmanage as a stable library, replacing xenstored's
dependency on unstable libraries. 

Otherwise, LGTM.

~Andrew

