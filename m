Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MMFGOejnGnqJgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 20:00:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C690317BF59
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 20:00:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239334.1540768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vubAY-0004wa-HF; Mon, 23 Feb 2026 19:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239334.1540768; Mon, 23 Feb 2026 19:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vubAY-0004ur-EY; Mon, 23 Feb 2026 19:00:34 +0000
Received: by outflank-mailman (input) for mailman id 1239334;
 Mon, 23 Feb 2026 19:00:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ndCc=A3=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vubAX-0004ul-8x
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 19:00:33 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb86a1ce-10e9-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 20:00:30 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA1PR03MB8263.namprd03.prod.outlook.com (2603:10b6:208:5af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 19:00:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 19:00:26 +0000
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
X-Inumbo-ID: eb86a1ce-10e9-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhYZHL/rNQPtFAZeFPWct/y8iNWup5v1cF5/fDPcykWAYTzfLktYrX3JnJ57NyewD88qj8mvU2q4Cvd1QtyP+kaVQh9Qkju3zTQkzuE2MS+D/DFf7ArSz8Ut6W+B9SJQdBID8ArwWOxpmEFwoBY0m4YbF78N1raxKGuIanaUFhFxFgw4e9QzwUIV7QbN5Qj4u+O0QTAnqXRXgapGO8Bxxx5KW3xv4CZHuwQZT+7KmRj/ixOs26s3dwCu8sQEjNNMY5+GC3gTh0X03I0tICxS6fosLYu5dAQIgMF8y4YMGNX8YbtHrdFq2WQpicCn9dUpl9IQkAM3IgNSopUwFDoqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ib1f9QBLGjD/v61YoZiiOIvTrgkbf+TPCvCpl3nyHDg=;
 b=KgJc9LraQnI6xUa8s2QgU2wHtFoXXLApMDy81yqaXoYouNaE9jrHdwJzpZvhZqB2aLwSc0+czAaBXtvKJBnuBFY9KM0ejfna1ik5VNQLBFWl92MNeLl4Z5yj2v4HDUsHmQFxnvXEdw0iF1pE3gsdZ26ctaCy/u0b6NTWa5c2CDOJngOeTRMKacGebwyKgKPQK7Z0qP8DGqYQB5Alok2hIS3Q+dbg2FlPIQGweQZacU1C25zMdhg2GBlsTNM4Ppg1ik7kvOp7VXGlXfvSKfCXY0roYxstU+gliQMnU7Eq8RWyVriON0C+ILX6ImRE0lwp7Pht7wSPSUCmp+TqFAklXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ib1f9QBLGjD/v61YoZiiOIvTrgkbf+TPCvCpl3nyHDg=;
 b=VJ+sq7GtTZOkTPyRHSJIsYRsTIrr1QTfyw/DpQ++W7dLli1e2E54W0RXmUtSDc5I3QeNuHTRdAv57k8hDPKsykorPuvNstTsXcAlAMA8dng4XmZJr9++VPIkm/mZlTjMpt0nSVtoP/zOsGYDwhMESiw1Sxy4PNpqDsKFFzaTwGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1d85f83d-45c9-444e-8db4-3e0962aad0a6@citrix.com>
Date: Mon, 23 Feb 2026 19:00:22 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] x86/cpu-policy: move CPU policy library code
To: Jan Beulich <jbeulich@suse.com>
References: <4bd68e41-e665-4992-9d3c-0086bb5195ef@suse.com>
 <7c06bd5e-fad2-42cb-947f-6749f647b068@suse.com>
 <d8eb4220-da82-43b3-b0e0-9d006f68877c@citrix.com>
 <e5e75e36-a383-4506-8e59-288faeffb614@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <e5e75e36-a383-4506-8e59-288faeffb614@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0264.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::36) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA1PR03MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: a41dfe2a-98eb-4d2b-6d07-08de730dce03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTZXa1ljdEw1VHQ3YklSY3pvV2dRL2l6N3U0TklNOW9YV1Bma0pOY0p4d0hs?=
 =?utf-8?B?cEhwWnhRbDUxdkJUL0E5SW1KSFdDSnE4WitFb05WMUtpUkFYcnVxcG5Xa2kx?=
 =?utf-8?B?UjBBWXZmRktLMzc2L0Z4TVR0aHZ3a3I3YVdzTjBsRGx4MVoxVWt1NW5LclhT?=
 =?utf-8?B?N3F0ZXM0OE45VTZGVE4zL2N2dUFKMVNFa1pqSTMwVGo3ZUdkdVdNeFhhbDc0?=
 =?utf-8?B?cDNzbzNEYytEQXMxcEN2dkhKVXpvMmxHeXdCeVJjNmQ3aEJQdVZBWmozcEtL?=
 =?utf-8?B?UkxTTGg4YlhZUHAvSFBnQWIwREJmWmlhSjF3czNaRHo1a3pGTitlT2FMQVRZ?=
 =?utf-8?B?SWppcGFvbDh5aW82QUxYeWVaRlprcGhsRERaUjU5eFNzWFdxcERzUGxKYStG?=
 =?utf-8?B?dTJtZTlqYkNvTEhiZUt6WklyUEt5a1F3bHVmTTR5UTYvOFZpc3VnUnM1TE1k?=
 =?utf-8?B?dFhTVVdOWk9EbURySXpFdDBVMUNGL290MXAxQng2dk5OWkp5QTJCbElPWGdG?=
 =?utf-8?B?L04vLzBYVGtVYVplVkdzdnRmLzB4TlBqMmxRU3Zpa0c3VVhpdVRZcVNBRm8v?=
 =?utf-8?B?ZUJCUjdGaXFBL2t5Y3NaRjhZWUNBZmRWUDB4dVJFcE5Zd1hrZFd0TkFMUExL?=
 =?utf-8?B?T2E1RVVhZ0FJY0pxTUFZN0FycVEwS29oM1VKZUZoNG9tZUh0cEs3VE9vQmZJ?=
 =?utf-8?B?RzNRVlVETEdIQ1hoc2xuOTM1WWQrZFlXNWROeUMzcURId1BIM2hUTHBoLzgx?=
 =?utf-8?B?RFN2U3BaUi9nZFh1aFFkOTVwUUt5SnBCbUtzTEVlRUMwS3UzQlRScXZpd2tn?=
 =?utf-8?B?ZFY5L0dWVHY5VXMveG5lcVd0UENPV1BZMm5CODEzTU5uaGk4c1g5VEpCYSto?=
 =?utf-8?B?OVBBYU9rR0p5OTFyd0t0R3JlWjJlU0FMU0dQSzBKbitDS0d2V2JiTmcydUFZ?=
 =?utf-8?B?R0sya25sMkpvQi9Pamh5MWlsRWtTTHhZbjdpYU5WS0FjQUpTc2FkejQ3NjBB?=
 =?utf-8?B?VWpZVzQ4YzlWZ1o4M1dSREVOVkZhcEdQREFzNmoyRXBqejI2YjVWb0Q4dzUw?=
 =?utf-8?B?elA2bHMrWEMra2UySHhQSFFCeDFyVlcvWVNFU2ErTm9KVnR3L3ZHT3YyRFd0?=
 =?utf-8?B?UUtvUEYrUVJhUlllai9lREY0VjlZdGc0MjlxVFpIRjZxbVRCaEwxdjdlcHhq?=
 =?utf-8?B?VWFtVzYxYTZTUzNRUk1jandkRnNiZmprTmE0Qlh6NkRTZmVNTVBBNjQrMDlY?=
 =?utf-8?B?M2VpdHIzb3RRc3VWUXVQNzZpc01Dbk0veEVsOHVoM1p6M0ZXYWdhQ0FlMGlz?=
 =?utf-8?B?alpadWVCTUR0NzhGYVhKTFU2Zk9WQ1RrWEI0WkJvakxBOFJyQ2wzYWNtSGY0?=
 =?utf-8?B?WndSSW1jdnM3TDB3SFBsaXFaK3UrRmQ5eXhxR09BeDRFSkI0UlFTOTZONWZJ?=
 =?utf-8?B?NXEyb21xQnQ3eW5rVWJKdW9wcnNucnMrcUFXSGNFd1VKazZPRklxa2VaR2c1?=
 =?utf-8?B?Ym9IUnhLSVZVTmFpRmF3M0RtalFDc3BqRDJtUkRsK3EvbzBZOC9HbDhXWU53?=
 =?utf-8?B?d1pGeTZUMXN0RXJFRThveGJJdlc2bzRIeU16NGd2QjFKOHhMang1OEprM1kr?=
 =?utf-8?B?Q0FKWnc4Zk9DN0ZoMDY2QlZuYlpQc2VLblE5NlNSbDNrMFlFK1oxeGlUUHFG?=
 =?utf-8?B?U0dOMm9SbFkyVDNFdEdEMjJKN096VnpFQlJWcGs5ekk2Z0trSkNBZEhOSFpu?=
 =?utf-8?B?cldDR1dMcDhNcDQ2WXRHLytMMy9WY1JheEszRVNiUnJJRkZjM2lSUWJ2YTJN?=
 =?utf-8?B?cVpqUDhKRjkvSUdTdEFpbWVud1U3WE9jRVpFRjlMZ2dsQlBZb0pIcDl5TWhX?=
 =?utf-8?B?TVdTS0ZYOEFwOUQxdmxSVi9xTFVnbFdsMUp0MkVEaVJESWlidGJSWTJLTmxq?=
 =?utf-8?B?VHJNUkNiRUhiUmVJdm5nZFN6T2xZaWE4VUNGV2VHWkRWRWtQVXEycGZFVnF1?=
 =?utf-8?B?OHBTYW0ySmp0Wm5qcUx6c095Rm1ETWtzN0s5ME9vR1I5eUduWXU1aFM0cDZq?=
 =?utf-8?B?eVZ2d3FVSmhLaVBNck8wVnRuWG1qSWFLWXhJdDYyZEthdUV0eGRrSE5nWis5?=
 =?utf-8?Q?jqTw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blFrQzNRYjh4UkwrOFhVUmltWHBmTWh6eUVZQzVIWmt0WUs3c09xaDBXMlE5?=
 =?utf-8?B?TjF5ZU1RS3U2UEJKSEhrVGFpT3A3Y2JsWENaektTUWRlbFIyL3VqRlJ1dTEw?=
 =?utf-8?B?OWpJQzk1NmpGWTgzaEJZcmdnM2xBbmV2TCtmdmw2aTRyOXhSSTZjVnNScWpJ?=
 =?utf-8?B?bXpYbjNMUXZGdGRnbE1ESmJaM3JLQjlaZHJMbFdqSStQYjhmTjhRbVRjbHZR?=
 =?utf-8?B?WFphN0hDT2lPRWwrY0JTOEZramRxcU1CZHNwOUZqVmVHYm85QmV1bFcwanF5?=
 =?utf-8?B?RUsvMWdQMTF4RDVnV1VNcCtNN3lIODNuR1c1TC9yaUNKeVE2NE9weUVURXlB?=
 =?utf-8?B?TFB6MjV4Y2pBTFJRbWdnWEFWOGg5dk1iNlQxMU45Wlo1NFU5T1pzZDVtRHUy?=
 =?utf-8?B?OWErOUpjMzJKZEg1VjZaWFVWUy9QSW1TalZQRU1LclNqMkRqdUh5OEVtRDBy?=
 =?utf-8?B?bXhUUjZ5T01VMlZ1RE1OVlVaSGRsaE00bitVQlJjZ1FXdDloRElXT0lLbFRJ?=
 =?utf-8?B?ODBtall5Q0kyQmhDUXZ2U1hjMzRVQ0tJRCtvTVZwOHVJelk0S3RRTjFieGdF?=
 =?utf-8?B?Z1FXY0dNOGVhLzJTZWxWWnFOSmk1TjVtbVZ2L3AxWkhrcGxzZDFJNWI0NGhO?=
 =?utf-8?B?eUFLVWdjS0NScHpSMEN2M25sY0I2WjhkcjZOUlpSZC96WHV5dmpJNE9jZGxs?=
 =?utf-8?B?OXd2d3MzR2o4bkQ5VTgrZE1CWHV5ZUd5Y0JZT0VsRWF2bEVBNXB4OTBubWRm?=
 =?utf-8?B?enEyb2h1UzNqS2UycERyUlNxNG8xZ2htQ25XS2dMR0JoRGlGdUF4cjhuU1Fl?=
 =?utf-8?B?VHZQU3NleUxNWVBaR0ZqOFlIWUVEbk84VXpIdUdmTjlVcmtvRFpoN1JjdnpD?=
 =?utf-8?B?OHYzWDlxUFRybzBOY2tsd2xsc3FkYzFhZnlXMUN6Zm5xQzNtcC80SW84d2oy?=
 =?utf-8?B?N2xQUFBRbzN0Y2l2SEZjdnFwcW5JSFlnU0g2NGVsQ2lXZFd0NDFRSGRwck5W?=
 =?utf-8?B?b20vRllLcVBjTXk4OWxFUDdPT0VwUENXaklQTHdBd0szQXl3TXNnT2lib1pS?=
 =?utf-8?B?R3BxdVBLWHVTVy8rTVdtcGorTzFvQ3NwM1JGeEpIUVQzN3hzTXBYMEkwRXg3?=
 =?utf-8?B?NmQ5bHhIbXhQMysxUXNJVm1iWERmaElNYkQ2cVlmTFgxcWQ3eHVFSzNKeVI5?=
 =?utf-8?B?RHFzR1BRY0xaMU9XTVIyUmxDTmo2WGpFWWh0bzd5UG5Dck1ML0hid1NENlJt?=
 =?utf-8?B?dHlhM0ppUFlWVER3NlZDWENta3JXVUliK2JCM2lMc0tMQ1dISUJjQWdUSEkz?=
 =?utf-8?B?MVFaQWxSQVdHdEFEL0hPaU5WcE9CazBTVTYwVFU0bUNOb2J3NDVCdHpBSFk2?=
 =?utf-8?B?V3hlbzlOVnY3VjFRNCtLbUdyNDZRK3BVaGVvTVBES2ZyMVlaSmZUUWM1Z2Ja?=
 =?utf-8?B?UXFGREkzY3AzYnozbnp3TXZ3UlRrQWovQ2YyNVJ3VVJaT2lSNWh5ek1HNzhQ?=
 =?utf-8?B?N1pzdGYycE1QZE8xd0JTKzJOVldiQWFlaFdXMEw0cnFvenhWTXRycG9TNkkz?=
 =?utf-8?B?MkhEdnNWUDdNSkJhUDVsWlBGVHl6Q2EyMENkSVg4cUs5K0x2VlFTaWxoN1g0?=
 =?utf-8?B?djBoMGphVjB6OXlmM05TaXJWTmFBd2s1aG44V3NBNmEzMjYwY29oazQxRVpz?=
 =?utf-8?B?UElQRW5NMW5UV3FFTTBuOVFSdWViVU0zd28yQWpuVVRUVTlZRC9tTHB6VUEx?=
 =?utf-8?B?alo3eE9JR1Q1SjgrckRmL0Z3SXdWYlJ3U0VXbDRaY0hKTnVTNXpZRGtTK1Bi?=
 =?utf-8?B?YVBVaVBYWHBsVFNxaEJYSVpmR2JLa0F1dFlkSmNzZkZvVStJYWNETGlML0dk?=
 =?utf-8?B?N3g0K1UwSUVRRGIzeVRtUDJOZ2RtQzNXemJ5WHRubzdGS2ZXYWtmYVpqazI4?=
 =?utf-8?B?KzYvMFFLMmVUM2hldzFRVXBNVXc0OVE5RWRkTytEbm95b2t1ZThjM281WVhs?=
 =?utf-8?B?L2VLSW1CN0xib0NSTkUwWjFUc2g3aW85bEVkcTZxR05wbjAwMElQVUx2a3Vu?=
 =?utf-8?B?bEpoSWFITC94SzVWb3RjOEZHb29wUHY2NnloTVVuNEFkYmFzUUlHNmg4OTNl?=
 =?utf-8?B?MWVKUVcrQ1NuUk5IeFlaREZ1Z1djNi8vcFFhbjNudnlBbndyT2pQY0dXbGJx?=
 =?utf-8?B?R0M4TkZJdEQvSllOMnB5aTZuQ29ocXMzb1NxcHNrNDVOa3ZoNnFRWVI3TWRr?=
 =?utf-8?B?QVNrS1RFL0hEK0dKV3VVdWgzVlU4eHlZTjh5aHM5elhERkxiNUF0azRXWG44?=
 =?utf-8?B?akpmd0JwbnN2VUoxUlNvRzMvN1BwNlA0TG9SMTRKOVdTbVFWeW5abGJFVEtX?=
 =?utf-8?Q?DoH+RELf6cAzaD8k=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a41dfe2a-98eb-4d2b-6d07-08de730dce03
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 19:00:26.2108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KtA+ZiEk9hl0fZrbEeAP7atHdTPOgVJ3X837xYVPqJhEPbW4Jgty4o6t0A54x+pGOnThxoy/S1wIzdNJ457n0+mYEAWbDCmwmzzGVM1QSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8263
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C690317BF59
X-Rspamd-Action: no action

On 02/02/2026 4:26 pm, Jan Beulich wrote:
> On 02.02.2026 16:47, Andrew Cooper wrote:
>> On 07/01/2026 2:17 pm, Jan Beulich wrote:
>>> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
>>> index 0203138a819a..be6c76d2934b 100644
>>> --- a/xen/arch/x86/arch.mk
>>> +++ b/xen/arch/x86/arch.mk
>>> @@ -4,6 +4,7 @@
>>>  export XEN_IMG_OFFSET := 0x200000
>>>  
>>>  ARCH_LIBS-y += arch/x86/lib/lib.a
>>> +ALL_LIBS-y += arch/x86/lib/cpu-policy/lib.a
>> This wants to extend ARCH_LIBS-y surely?  Is this a rebasing oversight?
> No, this was deliberate. The functions here are different from those in
> arch/x86/lib/lib.a. We don't need to fear collision with "common code"
> ones. Hence I preferred to use the more "normal" placement into what's
> passed to the linker.

I agree that we don't have the explicit ordering requirement that we
have with arch/x86/lib/lib.a.

But, it still reads as bogus to be putting arch/x86/lib/cpu-policy/lib.a
in the non-ARCH list.

What difference is there having this a little earlier in the linker
arguments?  Nothing AFAICT.

~Andrew

