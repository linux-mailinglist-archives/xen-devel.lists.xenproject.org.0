Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1108C533F5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 17:01:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160248.1488443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDHL-0003DE-He; Wed, 12 Nov 2025 16:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160248.1488443; Wed, 12 Nov 2025 16:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDHL-0003Az-EY; Wed, 12 Nov 2025 16:01:03 +0000
Received: by outflank-mailman (input) for mailman id 1160248;
 Wed, 12 Nov 2025 16:01:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X0mN=5U=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJDHJ-0003Aq-Op
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 16:01:01 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8041cbc-bfe0-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 17:01:00 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SJ2PR03MB7140.namprd03.prod.outlook.com (2603:10b6:a03:4f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 16:00:57 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 16:00:57 +0000
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
X-Inumbo-ID: c8041cbc-bfe0-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diYtuecjqGYNL7wsDk131NT1wkV2gyfsn1+m+Qu3u6CA+daMpijIfXvDuKQYnT5LpZ1zDjSceAoPjvka1t5eerYdJqC6kxT/bxEAr/qV7noTffqpBFY51p7APOGIU2CPDBAHCkP47Q8RA3bpc8yrizPZtj9MEhylPVE9KvB21P3Tx37l910ogR7HZYZ1CdlArhzOXycvHs2Hx6/K5Y+liV2GXRPXD+8gowlYkNZLnnn7HykWmfcRPnkSAw7jruGNUZc4Cbgj0rDKDKleqLaKlPLmWW8TGihHsrOsFmkz5JDg0PFQmx0ZyPewhFeosfcvqjgaC6vBg8bH8sN0ZPUy8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgCXa7LlzhDldNZCfU6vxMe2QQIZBu4xkbX/oYDUjI8=;
 b=i3g6RYYDGYRiZoQTZdHpPIH6HHM+O1xZqDGrLEIl43xzAGNwuDFAftTukuJJHuBE4lR6Jln0QuaTf3LEIpmfBcNACilDKjfw4LF3VhypsSYsxRPrli7I4i8948peO4JDpDaTrDjP6ZvKQfb/rvXAKhcdnxP+IUt4NvxAMSo0xjmx8pNJ2azomp2ZzwKzcAWqBJJQEfLYfPA0WFJxU2DYOJSb1cyHHCQAPC4KctZU5C35MXHbVfn8n1vvwkt/uhXuXU1Nl3M5CovG5nNHjNxEyoyYaB3Ux4RUEsE+5wtJFWpeStRb1C2hwdyMgjm+MAdRw++K7gKzMp0uNpUtnOmayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgCXa7LlzhDldNZCfU6vxMe2QQIZBu4xkbX/oYDUjI8=;
 b=A3SkqTBsWvk8YTf6R5RECgs5y7Q56YFzsTmIjLEDy5dHCFJxWCAPmeGpZu1Z/47rGH4KZfM+w9SH9u4wWVtoef997p8MvEj4cDGQXYUO882RFEIPIchdYSv4TOTKHGrCFZHzIPs2RH61IeKEckLCNXRpRNidyFh9s8HHG2peewM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a8a87ff0-ee37-4f35-bf42-4ea580a425e4@citrix.com>
Date: Wed, 12 Nov 2025 16:00:54 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: there's no use for -mpreferred-stack-boundary= when
 assembling
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8f814892-9f20-436a-907f-f25b294a9741@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <8f814892-9f20-436a-907f-f25b294a9741@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::19) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SJ2PR03MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: a822e2fa-154a-42a2-c3bf-08de2204aae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDJHRkxNT3dMK1orMlBPUXNmRHZzQ28rY2RRN1hXYXRqUG93d2MvK1dSd0hF?=
 =?utf-8?B?TFRwVkxudjhxTFlVcUc4b0ZrQnN2enZpL0M4SXNnUUNWU05zbXl5ZWNkRGZu?=
 =?utf-8?B?UlE2dEZ6ZjYzejFYcjZsMG4zNXk1L1V5dmMwUmVrWHRjcm13ZGkxTUhpUFNZ?=
 =?utf-8?B?VUxxSlRPN1Rsa0tpWk1KMnZZNHJsYjcyNXRleVFiMERlR0lXR2wyU2g3N2xI?=
 =?utf-8?B?aVBmTndTUE5vcy9ub2V5aWJlbzdSVitDY2FacTFEMG9HOUR6TnJCWEpaS3cv?=
 =?utf-8?B?UkRTbTVnQnJmYnVNVlNlcHpmK2grd21pTlVVWUhmWmt0TXlMTzhHSXczR1RO?=
 =?utf-8?B?dENhb09ITkExNkF5NjlEVmtEejJOQkk2alg1L3U1YThxVmZ2UnFDRTBXYVdC?=
 =?utf-8?B?QlRDYXhBcStZeGp0YWZ6L3NEWlVVL1JCbmo3ZHZKVFJuQ3JxM3JEOEhUWE1Q?=
 =?utf-8?B?YkFNNWJGbWJURnNNV3JkckdtcEpaM2dLMlNvVnhmNy9RWW5MZG1PYVFnNDQr?=
 =?utf-8?B?ejdLUXNpOU0zY1lCbWxmaU9zK1diUHNRNVpRcWdGZUdvQlhvdzZUeGREakgx?=
 =?utf-8?B?akRlNEo5N0JrQXRRRSt1azMwZ1dmZVB2czhNMm5oT3kvMzA3M3BicXpmSTd5?=
 =?utf-8?B?UG5WM29aL0w2ZUN5RnQyV2p4UFE2U3MwSGVkaW5YLzhWa1F6dkFnUzl1Nlh5?=
 =?utf-8?B?WXRTR2NKMlJnOFZmL1lCQ1hzQ0FhQ2IzVDlKakE1bGJpRjFtOStZaEJKWDFk?=
 =?utf-8?B?K1kzZ1REWmJzZXFBSjFzaUZGYTFrdFAwT3lnODdkUSthOW5sTWd4M0MyWm1O?=
 =?utf-8?B?Slg4V09OUHZhdnZKcThsUWcva1dWUysxLzA3b3pGVFZTVkNIT1BoTlExQTlh?=
 =?utf-8?B?Q1ZBaFpPUkpRU1lzNUtIM1RtOCtDc285Q1p1SHYzcVpQamFhb1plbGxkS3Fn?=
 =?utf-8?B?Q1RscThTUlBuNHcrSXp1aFI1am1ya01mbjBReWkyOTRXdXMzNUpkRkdUS01y?=
 =?utf-8?B?dEhjWGZQRWllWW1DTy90RDlMUlFlVnZnTlc0ZFBlMlVPcEJtenk0bUwwUVJQ?=
 =?utf-8?B?N2MxSkpyYUh0NEdiOHFaRFVSS2hIVXVzbmV4U1YyYVYxMlBqY0l1NVpnSDdS?=
 =?utf-8?B?UHRHRG11Z25IczJBZ1VZV2h4RjI5RjlwRW1YM3cralRJQmJ3UGNPNGhmL3pz?=
 =?utf-8?B?V2RLM2tCcmk3bkNEN01FUVpqSUxkb2NCVW54SVF5S0NmN2dyZVdQcTJkWVJu?=
 =?utf-8?B?ZWsvc3F2QmdGWVhHeERxZDc4WnloaXg3dm1yaUxPMTVqa3F4akxNNEVHMGpn?=
 =?utf-8?B?T1FhV1ZDMUxIOG1rbjVRbXY5V0pJVWdQcTZTVlpMa0dneC9ENldONmNTakxi?=
 =?utf-8?B?MEhZVElpUTB6d0dYdVJkOGtKK3JSaDB0RGdoT2RkNkNkWmt1bHZMeTBJWWps?=
 =?utf-8?B?WlhEY0s2QWlwQVFxU2MzTlNaTnhOdTlobzBKMWc4eUFiR3JIY3lJWHpab1pD?=
 =?utf-8?B?UEZJSlRVMFZvSXdpS2VKSUx4ME8vTC9qa1ZYb1NmOEtLaHh5ZmRvaUhDSEh1?=
 =?utf-8?B?ekdhdDJpbUdpcDdzTy9ZRFN0bDIvZGhCUFd2TFJoZHlFVGtTTTMyN083d04r?=
 =?utf-8?B?aVhMMTY5TGl5Z1EyeEkvNEU2ZDlBYkhIVkU4M00ySTdkSUY3Y0l2ZHo2c2Rr?=
 =?utf-8?B?UHNPZCtUZjQ1KzRZb2gvTVpmTHFtRWNYV1VyNmR2WURqQmZUT25yVWlybVlO?=
 =?utf-8?B?TzFzcE5NeFg5NENXY3hRRHZ5czIxMU5JVnkvR1d6OERHR3lyaUthN3ZoVTYx?=
 =?utf-8?B?WlVZVFdrNnhFS2MyU2FsNGxSb2hONlcxbWdSaFUwQTRRL1lIU3pXVmp3MXNk?=
 =?utf-8?B?dlNaUVFPYzY1RDluQ0lqTGpldTk1OVhoZ0pZT1U0MkxRekJXaFBncUx1K2dB?=
 =?utf-8?Q?aX85b5SeYHsIKJlSaxsK8SfWrd9Bxa2w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVFtZHdrSHFKZ3lrdHU4enRjU1gvYnRnWjQ1OWtnZ05QV1BvWXhvdFd1UVE5?=
 =?utf-8?B?c1VNQ0FRYnhHQkFrWTZhVExiNjBMRGFESW5rMzlkU2ZGTGdlNnBRemF3WUtj?=
 =?utf-8?B?blRJSmw4SFBDemVxelppZ3hua3dhMWp0b2xEaUpSNEZKOC93RU1QRWFTbFVB?=
 =?utf-8?B?Vnowd0RhMjVmSHQ5Mi9SdElQOW9mSnowVmhXZFRaK2YwVUFLaVpmSEljRHFB?=
 =?utf-8?B?djFpeURoZng1Y0gxaGs0Q2gyQmdGeTR6RlVtNUZjU1FjM2N1cFVrS1JmU2lo?=
 =?utf-8?B?eTFMVjN0SjRGQTdzMzVNNkpxWFh4NmY2NDZYc3NqOVFidEhEWU5CTHc2T1hz?=
 =?utf-8?B?eXVNRDFweWlacHpFamlPKzRrUHZtSzh3RnlFbkJMUVhVeFNjMm85bVd1b3VF?=
 =?utf-8?B?VkR3cEZiVEdIYUo1Q214UWYyei9xZVRNU2g5cnQwMU5NQXlveEtBbDZCNGFF?=
 =?utf-8?B?TkhXanM0d28rMkpKNHh6M3pwVWorbFhBY0ZPWFoyMGR2MytjY2VLb1BaV29W?=
 =?utf-8?B?VGd4RlI4S0Z3UURlc3NPSkdOSW5YQldRQ01xTlRYVS9MVmJNVFhTYy9CUTV6?=
 =?utf-8?B?TXlWenlzUEJCeEdYT2hUUmFEUmI0VWgxRWkxdXdTWnNBd1puT29sTDdqTWRY?=
 =?utf-8?B?b2poWEk3VWNKd1BLM2FvUjRmSWNIS1pyU1k2ZTd3ZmU2aUZqa3orVUxGWnZD?=
 =?utf-8?B?V0E5d2VHL1h2SkFrTUtvQ0VWVkFSa0pKQUZTNitrS0x2Z0pVVkF6eEpoYmtU?=
 =?utf-8?B?RWIyTXZ5eThHTmw0QUV6eTVTTGNYdjRTdm1WR25CelpMRkk1QThVQjlHbnJ2?=
 =?utf-8?B?QW9RaUpWUFdGaEV0aElXaFFCTUVxblNnemZlYlZkRE5NbUlLMTVYeXhrSFB4?=
 =?utf-8?B?UjQxK0lLdHJqME9YbDgrRlA1SlJlUVFVUlcvQTAxQ0ozeEVoNmh5czBqM2Na?=
 =?utf-8?B?NEROZW8zNFVxRXNHYTJBYVlrNzJycGMxUWlCV2lCWGRhc1ZWVi9YY1ZNMzcr?=
 =?utf-8?B?Ky9qaDViV0h4SG1pN3E1VDJIZVdONlpTOHZka25sN2I1ZFFVU2ZjekhYTm9N?=
 =?utf-8?B?ajBJMTVFZGtSWU1nQnRvSzNCTE9YdXc0LzdCZDMyTXRQNDNRM1JzSWUvK0U1?=
 =?utf-8?B?dmlMcDN2TmhmbjRGdFcrUEUrRm9BOU1yYUdPVkVxYkpkeDFLaWRWWnJJTC9r?=
 =?utf-8?B?N0xqNDBHK25XWUQya21Ud215OEVVMUxWQkNoczJSYkNHclJjbHRhc0JPQnJr?=
 =?utf-8?B?ZTFqYTJ6dmU1OFMwTWtmY21YQnJZU1dIU09kR0RUSHFjcnhudjFtYUxZTmh0?=
 =?utf-8?B?QVZkaFM2U0dieWxoU042TlVDUlNaY3hBOXphZTN5UjBNVXhsT25XOGI3VTZJ?=
 =?utf-8?B?QXZpM25wT0NkUkltUTAwOTBjWEZZeVAvRHVPb2grWjdFQWZlMS9qa2JUUTA3?=
 =?utf-8?B?SHlvZzBNOEZBakN0LzNMOUFtMVdWcTdieEV0bVZ2TjVXOWJJR3AxbGVmTWxs?=
 =?utf-8?B?aEhQa0xRSS8rV0RtdUQvQWpCb1A5NG93Q1psQURQWTcyZE1rcDVVeUN4UE16?=
 =?utf-8?B?bm5wUSsxWDVHaTlCa095dHdMK2I0bFI1bVFtSEpSZWhKaXlIcFFsSXpES1kz?=
 =?utf-8?B?NnhkakQzbWlqc2ZYTGR5c3V6MjgvcDB3NjZKbmRydDZ5SkJFWVlTRHpBRVMy?=
 =?utf-8?B?Tld5VlAyNnhGNHBrRVBjQnNSUENjNnV6MWhPRUtISHBKMzlpaEEzZ2NRYWxp?=
 =?utf-8?B?MGtBcjU0cDRGbW5IUEQ5K25la0xqT1lsQTNxcmRHUWo5ZVEyb2srMGNmalZ3?=
 =?utf-8?B?dHBBS3pEYTY1M1EwZ3JsejM2MllNaE5DYmdNWExDcHFXWVEvTEpjU1BYVFpF?=
 =?utf-8?B?djdxZ0ZhK2MvMm1sUFZ5OGp5N0lROTEzQ0Rjd3A3UHJUOFFlZHlXWVhST0hz?=
 =?utf-8?B?MldSYjBoTW9qWmpRRkx0Qmhsb1hiUmdBNXhwSHM2S2EyOGRPYVVCcGVOS2d0?=
 =?utf-8?B?MDk3d1J2dFJRTVNhUHBaL1lDN21yNWRSUUFEQ3RBV2xwK3Vtd3RrWHZBcm5C?=
 =?utf-8?B?b3NlaGNLZUZlakhDdlFBZiswVnZSMWhWNzEveUNTOFRKVUJ5b1IzdDhYbS85?=
 =?utf-8?B?ZXovYzRxNFp3aEJqVU80Wko1SFFRZC9KdER0QUtMV2gvck40YVZZTjVGS0Va?=
 =?utf-8?B?aFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a822e2fa-154a-42a2-c3bf-08de2204aae8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:00:57.8269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwgV3eegwvZ8i1XtlrNmxF0tzqVXLIgenjI9x7nvevYvwehtW8HmHqpObrlI8da0fcXNQ/l3VwfmhVGQWvaDTH5fbseM6/uGSw5e9Q9FaA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7140

On 12/11/2025 3:39 pm, Jan Beulich wrote:
> This option is only relevant for C ones.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

