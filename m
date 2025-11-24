Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCA6C81694
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 16:45:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171471.1496486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNYjw-0006tq-0W; Mon, 24 Nov 2025 15:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171471.1496486; Mon, 24 Nov 2025 15:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNYjv-0006r3-T0; Mon, 24 Nov 2025 15:44:31 +0000
Received: by outflank-mailman (input) for mailman id 1171471;
 Mon, 24 Nov 2025 15:44:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9jE=6A=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vNYjv-0006qx-0b
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 15:44:31 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7633efca-c94c-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 16:44:30 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB4926.namprd03.prod.outlook.com (2603:10b6:208:1b1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 15:44:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 15:44:26 +0000
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
X-Inumbo-ID: 7633efca-c94c-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgzi1ARaXN97f61rtrFpOzQon/9hCrfyc4q+9wk4COSt0M80w5InyK0/xq+uIZtcphSMvPZxXZbS3gKixRXMfLmzZ4CekgEdzvY5V4CEGtDAET0YCwf5oN/NrK/2CRnKsDMqBl+/jm89YEHdC/wUT9QVVt2feCVoU6HNlakzyRNKtd/IretWW5bmDhObDJyw2hhdUysoXxQIqBAP+XeitFrL1JaktKwCeCssAgM2bUodb4nbtC5IZ+iZw7kq1xuqodrJIcUPOH/CQnBYQ8ITc6FZhqmCJIcBaQcOep2g9d6TUeptJfuq81FW0R/229d9dhYfUZ+dPD4dy0ZTlp8Wmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s9ydKkgVoCIdlRXbpEUY7dHNLoTCOWwZ3cXCoDh7b8=;
 b=Y3YqDJt6ClTxbY6PnC4fgae/4jqDM7KnVszH9Wi1eROmNDCvMaIeeCtqpyM3svKC2WixuGVYsjRW69oEFJd4PuLx90CtmGpGIENeuv4mT/YwmqG8EqW0zm1d/Y/SMHA0U9MXuC3/B6xT5lZ1wA8qX9CdRdjfspdUhReEPJml+tiE//rDE9t9mU2XrVVG6BJg3omlj6pO+XiRNtoM/5rDWRmrpl0ZMxYgDAaYwSlIYvGmZoAfDf/Az+0FHPPBJo6SRN0Riwh10WRAAddiPuSk6bOwoVoA8ZLQ4mNUwgFN0ZrcFdcV5FEeaLu1iGDs37Kb1SeuYfngCCjkselwNWl/eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9s9ydKkgVoCIdlRXbpEUY7dHNLoTCOWwZ3cXCoDh7b8=;
 b=hxwqmrNz1c0yl1DVrl3MR6kW5+1THdIWh0xYtHCp0R3wKlNTaQVG3CavSOfUdmYnT5HYmt24h60yPWL2DSU+WRhM4egQkOJrmhVP4+SBaQ1kYQnaAunwYjXYYm+kvUtjc3i4NfLRMVznWdmkcmN+bgJxhp72ccf5pUbc0AohwyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <87970fbb-6a1a-44f7-aef1-1e9aa7bffd09@citrix.com>
Date: Mon, 24 Nov 2025 15:44:22 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/intel: Resync intel-family.h
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Lampis <kevin.lampis@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251124150837.654354-1-andrew.cooper3@citrix.com>
 <7a206e59-9ab1-49b9-a2af-dbd380566962@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7a206e59-9ab1-49b9-a2af-dbd380566962@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0624.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB4926:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff4062e-e51a-4fb1-7ea5-08de2b7058a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUNPeTg4NTUzeE1rTm5USkE3N0NvakZJTTlIbXZoaU9CdjRUejB5Lys1RmU1?=
 =?utf-8?B?NklHMU1HQ3ljT0luTHYyYVpxellqTytvVHdKVUVqSll5MVdqYUtQakJtVHM4?=
 =?utf-8?B?ZU0rQzJudFpYRk9DczdVWVJsdGdxVWtpMFQ3YnpDQjZFMFFDT2UvbnI5QUR1?=
 =?utf-8?B?MmNxZk5UdGdsMUFPcEkwTXp6eWNicjc4TC8wOW4wWEFqUUIxZFc4MDVFdm5S?=
 =?utf-8?B?eGpJRi9heDhNK3psQ3l0dExwc2hhaXJ1amppM1phWG5obHYzYTNqM2tiWWs4?=
 =?utf-8?B?ZjhuRGRTVmh1dkFDaXN6RlYxRHFHdTVGVUFBVHpGUTdaWG9EV2l6ZU9FQWVy?=
 =?utf-8?B?SkRxcnlRdlljNWUvK1c5a0d6bC9qNTNEZ0VRdjVsc2NzR0xDY1BvNUg3MkRz?=
 =?utf-8?B?N0FSazArSFlPTjFDeUVIRWVmVWVxc3BJQW5ZLy9NejF0bDBiRWRjNXFkYVNN?=
 =?utf-8?B?Tm5GQS9aZFZLNU5nMjhFcjZ2Sm1VOGJIdjdpQnRwZUtqd0VnUW91TEFhcmc3?=
 =?utf-8?B?d2wyaVJaL01ZcEVYYkZadVpuMkhma0trbEN6a05JMGVRNUV2SGQrRWdyTnVL?=
 =?utf-8?B?czFoVWlIM3BCL3B6bHYwQVpSTWxnc0RVUHQ3Q1ErTnZGU1hLN2VFc0RaQkRB?=
 =?utf-8?B?L1F1Zmw1WlFKRmlaR2tUUjVFMm5iM254MUdNVUdKTDQxb08wclpEaUc5ZGhM?=
 =?utf-8?B?MkN0TnhRQ3hlMkdSQjlpUkxXN0R1OWpTc3BoU0pKSlc3ZlFSMm5jSmRpTUNj?=
 =?utf-8?B?YzczWlV3NHNKTnFyVUpwUVlwWVF6L1A1MHNHdURUUld6ZG1UWXJTSmNhYThh?=
 =?utf-8?B?U05GclpDVldjSTJiQzcyRExwa3owV1QyNk01Z0twK0ZRbUl2YkxmekNRV0JG?=
 =?utf-8?B?RjRSYVZvbCtsK29jOVRmbG1ETk1DMnVsSHpiTFh6Zjk2aExueDZ5NDM3d3hx?=
 =?utf-8?B?QWtJOUw3YVhtb0dKd1JpRjE0R09vYTNZMTFuZDN2TitFdlBESGpSZ0s5VkN2?=
 =?utf-8?B?YjRIc1hSd2VrVDNUUkYwaW14OEtENURoRGgvZmU0S0l3YUs3RTRmalZOV29n?=
 =?utf-8?B?eWw0WXh6MmdoeFlNQ0IxUEhMOVdwdTA5SmxtbE54NFZtR1NLbHNWN2NSV2w5?=
 =?utf-8?B?Mk5NR2NKU3VmTkFlVk5nNExZZERZRUxwNWQwM05VVXhPSDJLTjJUMDlKK09J?=
 =?utf-8?B?TDlaMngxdmpNbnIyeGI0ajNUUURVOWUwNzZkdDV6OTgydDJIME1JWVdvVStT?=
 =?utf-8?B?cWdVamVNUlJTdWFrKzlNM3VROXVjWXZiVjI4ajhIN015Rjhva0NFTi85dEpY?=
 =?utf-8?B?QS9RQzJWT0Z4WHQxN1B0ejNKWFd3bmJ1ekFCTXFncXZjZkVQdFhoeTNlOS9x?=
 =?utf-8?B?RGIzRWg3UGREZEx3SXVLZXhzMmhFQVp4SHRhWnFGSklHTkt2WGp6a01LazEv?=
 =?utf-8?B?MitRRkZJYU5hUE1qRmZSZDR6VnA4akpPc0ZWblpiMjF4Z3BVZWoySm5xT2hm?=
 =?utf-8?B?VWkrbUFzWGpEQVBuNWZJckpZUUJ1V0lZeCtEUCsyc25Bby9jUi9QKzRMWE1s?=
 =?utf-8?B?eXBERG5WK0VJRkhuQUdFS1lxWmNPWStGKzRSVit1TWdYdGJyemxzNS9hSjBI?=
 =?utf-8?B?aE9YOENMYnNEbTJibUg2cDVaZC9IenpRbm43WGVlYnUzR0FiajJmL0liTWhY?=
 =?utf-8?B?VWxZTTVXM2NNVnpMMkhBSHVzR2VvZ29FdVF2N29uM3BIdVNFdnV1M0ZteDA4?=
 =?utf-8?B?ZCtsTW90ZERycEZxbm9qQWVqUGdzRWR2TnJHcDgzZ2Fib0s2dmxOY05uRjEv?=
 =?utf-8?B?c2xYVS94Nisrd29URkVzZlg2bVNRL0NXMDF6UFBxc1R3aVpoNi9PK2tsRGFG?=
 =?utf-8?B?NERuSGxwYllJZ0N1b2lqMFh0UVJLU0ZNUFF4L1dISGREcWk4MEhBZmM0Smsv?=
 =?utf-8?Q?yG/kWzwIvawhaCFoWKksT1UZz1WHt1RZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk9UMWVzVDFCelRkS2JPZmF5QzFIVzFSZENudUNqdVZRNENLYTRFMFJHajh5?=
 =?utf-8?B?QkdVVTJoc0JGdEdwT0FKaG1kbTdzREJhaVRuTnY5WFJ6dGhuOEtnUnVQVC9M?=
 =?utf-8?B?ZkJlY2pTYlZIT1lNS3ZTTzQ4MTgyekhiNnh3TlVCdUxWTm1RNHFMKzIyNjRr?=
 =?utf-8?B?THRMOGNMRENrd0pzSnIweW12a0s0bzV0R1lsQkpMRFprU21KUG1ENXNkdnE2?=
 =?utf-8?B?dXlxUVZRMWJIMUJaNFM0eHFRRUVGSWFLYWdKNm5rRDU5aEkwcHRYN2ZoWWU5?=
 =?utf-8?B?c1FhZnF1Y3MwdTZhd3JZcjUxd0FPUTBLTS9sMHdrSDRBZ0VzNXRyQ0pqNkxR?=
 =?utf-8?B?Q2hCdStrK211SlBWNHI3TmtDKytWaTlCVWl5QnUzcE9FeUw5OW9TWHhMMm4r?=
 =?utf-8?B?WFpFOE5ZZkZSR1Q3WTQreTVPUzJEYVErMk1TWGhJN3RiQWRwczFtYXBjZGtj?=
 =?utf-8?B?VEVNR29mbWwxWHNVZEo2YitUN3krS3ZXc2hyRm1YNldDczdidXBQd0tQVmdQ?=
 =?utf-8?B?Vyt1NTUrMDlFMG0yR1ByalhlMm80YUNrbElXK3VEQmJOajE1TDBvK3FrQXR6?=
 =?utf-8?B?TEh5TVJmKzhLdVZGN3FnZ043bDJNMFZNb1hJVXR4UXZsV1pZZlpTbTBtU09w?=
 =?utf-8?B?T2p5NGJWNE16QnZsVEdiWHAzdVhHandnYlAvK2szN3c1YTNZR29CNXNjaXl3?=
 =?utf-8?B?WkxaY0xlLzlrUVpabUxRTzQ5ZlhRNnpGODc2NEFlY2grdWVXTlZuNElkWUxX?=
 =?utf-8?B?WEErbDQ3Tmw0dHpLcDcrcmhQTG8yZGY4a3ZuTEhkUjFheUZEdUIzdEorN1gy?=
 =?utf-8?B?cmRrQU9PZ1NyNTdkb0ZsTmhZM29URTl0YkhMREI5Rmx5TlBsRkc4bHplWW5R?=
 =?utf-8?B?akFteVNVc2IrMGdZanp4MWdGemJjdW05OFpQWk4vREwrdkM1MGVvaDFBRUN6?=
 =?utf-8?B?NTVTOXVacTlDNGhjVEN6enh1L25jdG1LSURQUUVQYXluR2Q5Q1AyU3FMVnlu?=
 =?utf-8?B?WkRIWk5iY1crRll4MklMazBmNlRScFV4SEMxK1p5di9OaVN3WlY1dVZJZS9C?=
 =?utf-8?B?Qmh5Tm5pYWkxeW5ZQUJBMVQvckExZGJ5dzR4elJsWUM4YnBHR2RtRTZvL3Rk?=
 =?utf-8?B?RFVJMUhBK05YLzdrVUVEU3Q2OTJyVkpHbzI1MGdWNG8wWVRVM280NVNoV0JD?=
 =?utf-8?B?RXkzQWYzRjNnaFgrL0Zic1VpSWFHN2lFaHBzdHdHZmQvbHNJZGRONzE0ZDBN?=
 =?utf-8?B?UjkzQ0ZjYVFDeHpNc1k3QjVrYUZZUlNwVDR0N2Rsb3J0eXVRanJoaWRad3Jn?=
 =?utf-8?B?R0p3TGprazlPdHAzSXZZbG9lMGhabEdFTVA5Z0FSRzNCSHBCWEh0NXg0a0M2?=
 =?utf-8?B?anJ5MGF0S3RKekZqNDBDMmZaek5EMkduREIrM3BjcU1kVVczTmoyUTVNTmpO?=
 =?utf-8?B?NUh4NzhTdHpqM0pML0dzQzRiU2hVZmdLRjB5UlcvN1N4K2lzSGpNalFxR3py?=
 =?utf-8?B?dmFDRThJUlU1Um5MYVJCTklpb3hPRXdCRDBNZmNvcXJKY2F4UUt5T3dvekFG?=
 =?utf-8?B?L3hPVFMrSkJ4bWtEUTA0U2RlUUVZT201Wm5jd2l6MHFwOXBNM3V2US9kTVhO?=
 =?utf-8?B?MDlxRlhBYXYvdFlsNmVsN08yZHJ2MXptOHI0OC9sOGJkaU5DZFVDeFVzdU5S?=
 =?utf-8?B?bVoyeEFCeUEyU2toQnVMU0J5eFkybm9tVnNhcjk4MVdFbDg0ZmlnWDFldkM3?=
 =?utf-8?B?UTNsVlNTekd3dExFZ05XSWhYV3ptSzdBV2Q2bGNvaFQrYm15ZTlCZTM2dVBo?=
 =?utf-8?B?S3luc1hzbGhCbE5KV2tSTVlzcHVuVlNuS3hDRTIyL3ZJV2VIRDExRlJOYTAz?=
 =?utf-8?B?cXNhcWZHSDZGd2xuSHNnYTJSeDRTd3VtNGExTW8yNEdnT09JOVpiTHhqSDFj?=
 =?utf-8?B?MnByVGdHQkdPdDVLQ0lmc21OT3J6dFFEbVRtTUREUk9XcU5iVnV6L0xSL0hE?=
 =?utf-8?B?T0RjN3JkVy95TXlENzYvczNrMEdiSXE2VkZwRDNhN2lBQ3FQd0NvN21abURJ?=
 =?utf-8?B?eHRIU2ZJWE56b2VJR1RPSzRrVHNxQU00MURoUVgvV2lQK2Y5TmdEQ25rM3ky?=
 =?utf-8?B?N2RHMUtlY2xFa211MVBnSUdzdXM0UFBIU2ZnNWZObEpQeEdBWXFxQzQ0UEZh?=
 =?utf-8?B?RWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff4062e-e51a-4fb1-7ea5-08de2b7058a7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 15:44:25.7691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NeYZFPTRuVlxjRlpdX8l8qUaXVvDBsy2skHrtkpZTdPzGZlASQFa5Imw/iJG/fWQPu2o5XQurg7aRHtWzNuOwMLtJ1JHbL6Gzz26lTJSpDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4926

On 24/11/2025 3:17 pm, Jan Beulich wrote:
> On 24.11.2025 16:08, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> I'm unsure about the Intel CPU Core types, but it's probably better to keep
>> them than strip them from our copy.
> Did you mean "pre-Core" here? In any event, as we're meaning to stay in sync,
> we can as well do so properly.

No, I mean the enum's at the bottom.

>
>> @@ -152,9 +174,9 @@
>>  #define INTEL_ATOM_SILVERMONT		IFM(6, 0x37) /* Bay Trail, Valleyview */
>>  #define INTEL_ATOM_SILVERMONT_D		IFM(6, 0x4D) /* Avaton, Rangely */
>>  #define INTEL_ATOM_SILVERMONT_MID	IFM(6, 0x4A) /* Merriefield */
>> +#define INTEL_ATOM_SILVERMONT_MID2	IFM(6, 0x5A) /* Anniedale */
>>  
>>  #define INTEL_ATOM_AIRMONT		IFM(6, 0x4C) /* Cherry Trail, Braswell */
>> -#define INTEL_ATOM_AIRMONT_MID		IFM(6, 0x5A) /* Moorefield */
> Interesting, there's one entry changing the group it belongs to. We don't
> use the constant anywhere, so right now this is purely a cosmetic change.

Christian did some archaeology, and concluded that it was misclassified
originally.

~Andrew

