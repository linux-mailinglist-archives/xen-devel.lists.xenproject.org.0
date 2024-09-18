Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E031497BA27
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 11:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800230.1210163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqr0O-0004Ob-UK; Wed, 18 Sep 2024 09:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800230.1210163; Wed, 18 Sep 2024 09:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqr0O-0004N6-RS; Wed, 18 Sep 2024 09:29:48 +0000
Received: by outflank-mailman (input) for mailman id 800230;
 Wed, 18 Sep 2024 09:29:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=le+6=QQ=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1sqr0M-0004N0-NZ
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 09:29:46 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a0a7204-75a0-11ef-99a2-01e77a169b0f;
 Wed, 18 Sep 2024 11:29:44 +0200 (CEST)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DU5PR03MB10359.eurprd03.prod.outlook.com (2603:10a6:10:523::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 09:29:41 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 09:29:41 +0000
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
X-Inumbo-ID: 8a0a7204-75a0-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qw5afNvzdJeGFJrMIy+gERPn92aVp3LmRQlmvJTjDrII4sHd5Uukh11Zj8JGvWLT1DJk/xaTGxiGbelL3kAHtB4r0nAt3Aa5BMQXk8vlUv/s9+G5sUpSZkeg1srCRAHrxJELEDP6E/A2Ey6X344yet/eJB1jzIR1ZEnxDK/5G7zbJrurzpp0RiPvCU44S7/xyRrZ9XxvAgBiD/KTdEi+SQmdsLEMrz19nimwJAKnzZ6vwmUc+6VJDRIBaXXEwItz/NfksTnTyU5nZjtI+fsnq9i8nur4mxqrYxvYXviJrKn0qdCgTYfw1SJXaPxIokJwdj8lhzTl1NUuZ9h6ClY5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuzsUcEESQtQi3bXICGFQPYw/pLOGbg2NJYSnTPuoS8=;
 b=lBsaUJ/nCPhqbQXZt/g5t9m2mqbKIT9/6v0Y5Xi1f561S12Rp3AiTAoT6msH4Pf+Y1Ky7tnUEAjB5TNHvrjLEGkdGRxHVOlABEgomLmDdMnW+Z116XoVfIQbEd236Y4BggwH0w9ENLyqL4UjkuD6IZ8ieo11rGPmliSobv3zG9d5dsMSWnWKUW1k5glRK63j8+Uy+M6PACCxLZk0oieZhzXLC2j8zAFRVlPyYGN2VuwHYXCV0Vmu9880NJj8hdSClSxO7mt31Ezz3wsJr/3cYjfMyH4ZFq2A9xjvXBAVs3LsAoWs1ekJenlPlCPe6j53AyV2kdbzEuVHuZYj/c5jdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuzsUcEESQtQi3bXICGFQPYw/pLOGbg2NJYSnTPuoS8=;
 b=UETDkI0cmIrCLiUXMKGqorCe1EDFTF+PYWnd7LVRwfwMeBRXycYPxaYIabdiVAWmbFrN/DMTpvlpJzzbL4FWQmAyQxop6Rl5pupQh0C1/bMmav4vEHb91pRwk6qSL9SVqPFn0xRjsHFkqwnEuCEQNRLbvWnpaBsWzy5QDzEqLdeu735roT+jH6OrIWyyum56RDYSfaYI56SwSYv4OK1gpb8Kwz33KivizgiYUReDKT3tATk2yUe3v/QdOpybVJlZ324KyOd2lb+nRNjIGUJh8HOwkOMBch6vCB8vBV4xTwKjLWiNrfPigsolQ0aSWarG3IMAIGTrbeNo7AKXp7r2cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <614611f1-dfbe-4185-8f0a-dc89aa7f5a20@epam.com>
Date: Wed, 18 Sep 2024 12:29:39 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/hvm: make ACPI PM timer support optional
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240916063757.990070-1-Sergiy_Kibrik@epam.com>
 <Zufh7DOSCwzhrpZG@macbook.local>
 <alpine.DEB.2.22.394.2409161252380.1417852@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <alpine.DEB.2.22.394.2409161252380.1417852@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::28) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DU5PR03MB10359:EE_
X-MS-Office365-Filtering-Correlation-Id: 420b4a73-67c6-4a6d-6db9-08dcd7c46ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFhjbU5tS1VseERYNWZndlZvZlBsQmZ2eXRqL2t3U0NmejZyZGJWdW5oOFhO?=
 =?utf-8?B?aStDdnhlMmYweDl4WGJFTCt4L081aC82RG95ejRMN01iQ3o3Nm1zSzdjQzdV?=
 =?utf-8?B?TkFsblUxUVBTdThVSnRSekxOYjlXRzhBUWwwV1dxUDVSNmdzVGRkRXFpbDND?=
 =?utf-8?B?NkExN0Q4REo1MXZ4RHpDTjNQMHJuQU5tVHJ4S2FJVndDVHFjVmVKVlp4Tktv?=
 =?utf-8?B?M2xsVkhLT0hkaE14aUhSa2twemlMTkJoTkhOL2NrS3loS01IQTQyamQxL09O?=
 =?utf-8?B?KzFRTEU2R0phLzRHQjRuYzFKTytQREFPbmY1ckszNHRvNGd1L1VNVXhyNkFm?=
 =?utf-8?B?cDBZWmRNbE52SmJHa3IxTDFQcGFHbm03SlJkNnoxK0dmWGFOaCtOSERpOEV2?=
 =?utf-8?B?RXV1N0kxY1R6bWVxSnp6cjU0M1c2MGpyZkhyU3VZakNQdWxUM0xVQXhWcXJV?=
 =?utf-8?B?Q1UvV3VCUDBORWU1WS82bStFY1c5TkpJcU9yL3MxbEFDNkptckNUcEQvUDZt?=
 =?utf-8?B?dmVCVXlReklDTXpMKzhaM0k5Mk44clhtcVN6RHd6RStQY3l1OEU5NzZscEZh?=
 =?utf-8?B?NFV4ZzFwSjk2RFVneWN6cGZ4VjlaQlNzZkFleFNNa2I0cHVnd2xSbUNJbjJu?=
 =?utf-8?B?YVB5bDBwekxIL0FucVpEa0M4NU1WZlhPaDBDcUJpZnRwWTg3MFhtMWxRaXlF?=
 =?utf-8?B?MmJjUkU0L0hhYys4aHJLK1FQQjB5SkJ6MStxM0xNSnRkc2NNSGJCTUtFcW1m?=
 =?utf-8?B?aVM0Qis5UnR6ZXBsS1lkQ0FST1BiQ1ZaMkVpTEdwc2pZOXd3Q3FJd01CTHp1?=
 =?utf-8?B?Q1gvQ0FvbWlvc3R5OThOSnlreWM4ZTZVMmhaSitkSFMvcWo0Zm4rUkFnZ05N?=
 =?utf-8?B?K3hPREFnQWxmRWVIUFNBZTUySUlCdEFCMmxGQUNsdHlOWU0xR0tlMDlsbUQ5?=
 =?utf-8?B?MTA1OTNLbHo2RkxXRHFHR0tIUEtZNi9YWUJ6N0JDS1g2S2xJVnNKdk9QTGZR?=
 =?utf-8?B?aGMwbTI4RENYaWkyWGErTjh3U1VDUmY3TXpIUTk2MmxKQkFocEZROHdXMjk4?=
 =?utf-8?B?TnYxODkxM041RVlta3pkd1MweTJxdklGeXdPQ2lZT3FiQVhiSGpOWm1WcXI0?=
 =?utf-8?B?QVJNMEYrQXF6UlZnK1dsT3l4dy9YbkVLcnZhZEUwWkhOa2pGMlFVamFDZ01q?=
 =?utf-8?B?ck1SREpNVWNoOVJ2S2pHMlV4djBhR2dVTHhMRnVwMFY5T2pzVWJHbzBaVnAv?=
 =?utf-8?B?OHFrS3VKdk11Z3YwVnVPSndKQ1B2aGE2ZTRUYWpocHBNU1BpMkQ5YldQalFa?=
 =?utf-8?B?RG80STdSZFMxK1JMQjE2a09weHlpMS83YUR5RVlOZlBHY2dhbTJNSTBvenZG?=
 =?utf-8?B?VThBUERhUUFGTzI3TUc3S1lEYUZuRmNYUE9nR0ZqeElqVUFQMXNJbjkwcGxT?=
 =?utf-8?B?SnpieFlBQWZOTndBQm4wVGp2R1IwQ1ZubUlSbE1LYlhjQkd6R3FuVVppRDV2?=
 =?utf-8?B?R3Btd2M0RjhsTEFwZzgyd21Lc1RhbXVkK1hrYmMwc1VDTkxocE1MM0pVK0Nm?=
 =?utf-8?B?K1VwWVUrbXptUStQclpncGRQZW1kWVZ5VkZqQmZ4OGhmS3ZYWkxTVWFJb3pO?=
 =?utf-8?B?VkIrbEd6eTgxYmFuVkxzRmVnVFhJM1R2MmEyQ1BUZXd5VHUzRlloUExmVm42?=
 =?utf-8?B?NmdoMjFoTFhsL1dac1dReXdlc2NRWXJvMGZXbzV6RnJlZmdDYUhqOW85VVFy?=
 =?utf-8?B?RTJyNUFscWplSy9YTEpmYkFHaDZTU3NRbHp2SFhHSkpTNDZKWVZHWGNnbmJC?=
 =?utf-8?B?VGxrMHRaT2Npa3JBOFFDUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGR3NFBKcVRFczNNMDRqdElONWJkUWt6WEtCY1FtaG9YcHdpRExDQkJ0WVhY?=
 =?utf-8?B?eHN4RzBsZFRsV0VyK1hoZWNLVlUvYkFtbGR6TG1wYUMzNCtmKzN6cWhna1R6?=
 =?utf-8?B?T05ZL24yWUpIdmpVOXRoZFhmMDFja1Rsa2tIOHpUY0tQTFRHSWRzakRxcHRJ?=
 =?utf-8?B?RlZ3amVVNGp2V2NkOVdhLzY0Y2xLV0ZKdWx6T3NWN2l6TEtXVFYyWWFReDE3?=
 =?utf-8?B?WndIRnZHR3hwY1c0QWRibFBEQnpYdGRJY3JYWmQ2bVpDYU5XRjZWcTAvdGVG?=
 =?utf-8?B?bFh3TTMrb3oxek1nejl2N09TTTdGSGlDbkVLcTNJRUZ2eHJiNDgwSGRqd3Ix?=
 =?utf-8?B?SmlIMlJHZ0NGWGU2NUk2L245RkErWHphS2RpTkhHZUIzSCtZSVVackxxa2di?=
 =?utf-8?B?NUY1MWhVSFR3VTNpeTZQbzVyYTZwckptQUVDNTR0MUNRY1lPbU5KK3lpcFNB?=
 =?utf-8?B?bHg5Vlh5OWQ1SXJpSmRxOXFTYVJwU01vRUdPQ1d0QzZyNWk1SENsMFZhREFG?=
 =?utf-8?B?ckdEZFdvM1AveFhoNVNQUE0yU2VOVENldEVVenFTLzBzTzcrUHllUXVaTkEv?=
 =?utf-8?B?dHZiVzVreHJvTzB4MTEreWU5WVMxNVplWUVLRWRIUS9ZbUtwYlM5RHBja2xN?=
 =?utf-8?B?RWZiRXR6b1VTSW53dkF6YkNzeU1lbExWYy9pVXNkUzFQODBwY2EzTDFsb3d0?=
 =?utf-8?B?MmhEc0hYYllnK2dBT3hrNEp2Q25jc0xIUTg5ZUNvSFp2NVU1OUUvVThuc2Zl?=
 =?utf-8?B?b1NwUXdnb0doN0d4amw3YW5Ib29ncm1Vdk9MN3RJMFFtSlYvMG5URE4yL0lL?=
 =?utf-8?B?QzVlaG1RU3lqQjVqU2lQUlFmMXN3Z3JWYSs1ZExOWTBGQmRFRU16S0N4Si96?=
 =?utf-8?B?ZisxZHJHSTFRaWZLb09RS01BY3VPZWg1YW05UGovWHpkdFg5MkJiSjcxR2J0?=
 =?utf-8?B?MjFiMkJia1lvNDhJY1VRS2ZoTkdiU25sUHc0Zkg4VitFV3hSQ1Q0S2FWZVVr?=
 =?utf-8?B?Z2d5V1hyVk8wL0ltMDlKYmRsZmtrMlRuSkg4eEtlcDFuL251QXlJcWFRdisx?=
 =?utf-8?B?KzBBVlpUT3Z4UjlOc2FwOUgyRy92VmVYNzFqd085ZW12cG8yNVBZSDd1a1lk?=
 =?utf-8?B?VlMveGVtOXdmTVd6SzBrNUxLWERVREM3aFhqa1FjRlhkYnordUxDc1diMGIx?=
 =?utf-8?B?akUwNzM3ZzVrSDFMeDdaTlNwQVR5SURUbTI3RFdtT2NveDBxcGhYRmx3SkMy?=
 =?utf-8?B?UEhmOGwzZDV2dW85by91ckwwbWFTOEpVaE9hNnNGTXRlQ3dRcFJQcTRvS3VY?=
 =?utf-8?B?emZqVncrWGRsbU9rY0JhZVlnVGhsZXRPQkMyZUhYVmVYQjRETmh4M3VBNXlV?=
 =?utf-8?B?dFRaSG9OYTh5em9sMURBUy8vbjJFVWJoWldMbCtHQ1k2TkhPRzRtMHhWMXVv?=
 =?utf-8?B?UjZNMEZOV0tKZGxhNFpwWkdDU2FLLzRJR3RYbXlucWNQejdHRHMrK0F6QlZC?=
 =?utf-8?B?ajl0cllwYnZ6Q0Y1ck9ocDk2Q2V3WjlLOWNrSnZ3NGVHcGQ5L2V3b2xHcytF?=
 =?utf-8?B?aWpWRmJheHl4a1Rta3BJN3NHYlg3VEhUOHczTmJhK1hQY2RRYkYvWnVJMXBP?=
 =?utf-8?B?emhGR1I4UTEyWEhmYXFqczYvcUZERldIVGFxaFZrS1RmNTVQZmxDL0RFbUlY?=
 =?utf-8?B?R0c4SjV6d1VnYVJrL3FFMmo3TklFK2o4RDNXTnpESHpqcWoxanVQUGZEcXZV?=
 =?utf-8?B?V0p3Y0I1bldySXo0WkNHY0xEbnoyelFkdHQyUUlXbUJMcXdmRDF6KzFBcnVl?=
 =?utf-8?B?WEhRenh2Z1ZKRDgrVEE3YkFVa2pBdnpic1ZYVTBNZVMwcmp6MTNnVTVxWDdM?=
 =?utf-8?B?RTI4VkVCc0JQMHhja0NFSm5VMnArVEUxQVgwLzhCOW1sR3BpcjhBM1pjenM2?=
 =?utf-8?B?c2U2RkZlZ0lNMW40czFpT2NKbnFxbFA0NVNIa1N4RElLWXN5eDY1SVRiZks2?=
 =?utf-8?B?M1hyaFlMVjhSdmZWZHpJZjZvS045VmJoK0xjcU5QUzZwWXA5V0Y4SFhGdVll?=
 =?utf-8?B?enJ6ZjFxS0pzMlN1NHJpSzVObEo4K2w2ZHYrQVhZV1FBS1NQRkhINjdmOFph?=
 =?utf-8?Q?4v/tPbIiJ/V0Jf+qUzErYvcUN?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420b4a73-67c6-4a6d-6db9-08dcd7c46ca2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 09:29:41.7357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zn1H8ZXcsOhoFMz4TL319Gv4/PGzwJPEaPejGLFaKRQeSMcrElnKqesyzzGG6XMiPsnZAO4/oKCss1cBW0NFiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10359

16.09.24 22:57, Stefano Stabellini:
> On Mon, 16 Sep 2024, Roger Pau Monné wrote:
>> On Mon, Sep 16, 2024 at 09:37:57AM +0300, Sergiy Kibrik wrote:
>>> Introduce config option X86_PMTIMER so that pmtimer driver can be disabled on
>>> systems that don't need it.
>>
>> Same comment as in the VGA patch, you need to handle the user passing
>> X86_EMU_PM.  It's not OK to just ignore the flag if the hypervisor is
>> built without ACPI PM timer support.
> 
> I also think that the flag should not be ignored. I think that Xen
> should return error if a user is passing a domain feature not supported
> by a particular version of the Xen build. I don't think that libxl needs
> to be changed as part of this patch necessarily.

It looks like toolstack always leaves X86_EMU_PM bit enabled, so that 
part may also require changes.

   -Sergiy

