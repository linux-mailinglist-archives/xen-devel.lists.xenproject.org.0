Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F668D241FA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 12:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204858.1519411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgLNz-0004Dx-Ov; Thu, 15 Jan 2026 11:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204858.1519411; Thu, 15 Jan 2026 11:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgLNz-0004D9-KG; Thu, 15 Jan 2026 11:19:31 +0000
Received: by outflank-mailman (input) for mailman id 1204858;
 Thu, 15 Jan 2026 11:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cICa=7U=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vgLNy-0003bC-4l
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 11:19:30 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e6a5028-f204-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 12:19:29 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7431.namprd03.prod.outlook.com (2603:10b6:408:194::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 11:19:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 11:19:14 +0000
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
X-Inumbo-ID: 0e6a5028-f204-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsDoWne7cHuZsKJqc/j0QsxbXsuykPAwP9pI4tQer56FSk8/ldC6SRonV63PzHt4KEGZWLKy44GBsgmbq+be/A+Ge0djmbE6r17x8eQ/4GnY64tfO//cYbRHqkgv2u1DWCkVrnZeZrvemdCL3Wxsay2bdeEGKdy+ucA7jBefPvSzw/61xdifuMkh6TA/J0CvXdEsH7qpBjaKAQb2081Xn7LwZ6sEXCXbJxEKmHg17PyJxV3SFZlK4D0qibYbscv6VtSrIfMwu/ShohxEhncKBt9j4mqX5mwhYu4omGzIL2lq0qADRD4O8bkfGq5quFVRupKEjUAOY00k+jCf0bVytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8bzH/L1hTXEPNB93H2sFsVys9laAXqSrcgU3fr2F+Y=;
 b=UkZY9fWiYYoTEk/2npoVwn+rex5Uak+0qJW25hi361rbTSuRcT3gI3oF5HahF4hoNO0/eCMWhjlxOF/H+frzaGNdpbmRPknFZfArgwq7yhxQFHWDATIKnF3i/w5JpKbdbfRF5Ny9NaCaCjKs+xmpxyLbnP/yJ2a5v3Yu8J26vgRIkQSu0YWzlzYS0tTKnLq7TFPjnlxyKmMVbnQH6eAoLbIKmqFYZW4guEGd2ZA3Q6pV7Mg+M4El439NqXwEcHuQGWjjt5X4F0pUkKg4m3BqrvMX+/3TgbioG3bsTcX/jUZagmR5+PJEttCFUQFysp+I4eCURd1G52PDsnN7oymKdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8bzH/L1hTXEPNB93H2sFsVys9laAXqSrcgU3fr2F+Y=;
 b=WO0pLLVyNWx57TYuN0Xyi/sHxj50w87SbEN2zrs9PpspAP6+GdPuC97+6d3zFXDau9d/kXkmsf6PZUgvGRd0GidLNHwd9cAChOgRASnsF0Ub+w32OL70hVfYbifeVWkzwrKvvNkpNCO78Brcn7N9D6z6F22iaijMiiu1W7SjnFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/3] xen/mm: allow deferred scrub of physmap populate allocated pages
Date: Thu, 15 Jan 2026 12:18:03 +0100
Message-ID: <20260115111804.40199-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260115111804.40199-1-roger.pau@citrix.com>
References: <20260115111804.40199-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::30) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 7568f4fb-280b-4145-1564-08de5427ea52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFFXZWFwVmpqVkR1RXZRY0lVV0F6Y2M2SkIzUFp4UEdXelZ3RkxhOVpjVnVT?=
 =?utf-8?B?RHowNVhFbUZsODR1ODRMNzMrY1YwMm5sd3IvQTBLMlovbm9wcCtJWEYxSHU5?=
 =?utf-8?B?THAyWGphUjRsQ2RaQkVSaUhGbDlza0JKcDRibzdIVTdCdzF3SENXdDJJTFNS?=
 =?utf-8?B?NjF5UDRaQStuL1M5bWtqMThvNXZic1dZbDdUd2haZUN6eXZpM0NwTEF5OXNI?=
 =?utf-8?B?T2dnd2t0ZC9jMHVhNGkrMnhNU0VBYTVWYjRTYktqUktFVTFvRS9JcEE2djBn?=
 =?utf-8?B?MHlZeDNRbFJKY3NzcXdFbTcwL2U1K3ZZdnU3Y2xlVXltd0tRV3FETGlFdkRS?=
 =?utf-8?B?bysyRVovazh5TTVsenErUW80T0VaalovYklUL2hrM0NmQklkQlBucElmSElB?=
 =?utf-8?B?RUJucHFMTHpEblhlNzJJMjNLdXlDV2ZWbWJrNTFrQ3RtMXROK0RYNURYN3Rm?=
 =?utf-8?B?bVcrRUV2WkNkRXN0N1AxV0ZFeGliRUFWbUQ4U3dvSEZRN2pRb1RPTFFaUU1o?=
 =?utf-8?B?akhqWUFGcmlSZXV5QjRLZ1QwekZwanB4Tnc5RUlkUFlKR1JGNmMvTEF1MC8y?=
 =?utf-8?B?cGh4dzZKOGJmTGR4WjR6Ti9SV0xnRTUzUWs0TVIyODkzQ0oyRWhLZElyMG84?=
 =?utf-8?B?S3VyUG9Da1hTQ3JtYkFYbGJ5RXAxdDVOdEJoWGJmQnVjVXRLWmVtWXBmVWFk?=
 =?utf-8?B?TU5NdzhzTVAxY2hCS1JQcWJKNVFwZmVZVFczK3ZGNGxmb1dRdnBJNTJjZlNu?=
 =?utf-8?B?TGNGakV1T3ZvenRlV0x5TUdBSHBNZ0Q5a0VMN3BDY00zS3ZvejRXaHFrcmwz?=
 =?utf-8?B?NVNWRGN6SDI1MUFTWEFmUUZPc1pRa3h6a2hySTlPcm5kemR6QWtuZkJOQ1l4?=
 =?utf-8?B?cVg3eVRXb0tBNFVrUkpVc1Rma2I3QUtQNHlqY2UvMEVoYmJ4L1ZwTWMvOGRt?=
 =?utf-8?B?dnpxS1RIVDR0alRHejhzQUhReXBkUnBLR1lSRnM2VE5QMHd4U3FYbTE4VkxY?=
 =?utf-8?B?WTZvRm53T2U0OTZCeEx6QjBHZ2NBZXVsYm94VmMzb242UUFkczc0ZU5NcTNM?=
 =?utf-8?B?RDFRSS9FU2F4bXpnUlJ2bWV1aFpEUXk1QnR5SmpscHZieTR1c0twQVdQdUQw?=
 =?utf-8?B?c1FhSUJ5YjZobEdmSzk5eGZ0Y1dQT1JScTErLzAvVFo0UFdla0pNcUtEZDVN?=
 =?utf-8?B?Vmhsb25xWjRXRytVM2FRRHIxNWhjM3ozYUNUN25qMndwdWRReTQwdHJLaExq?=
 =?utf-8?B?OEZsNjlkY3RkYjFnZXhQYjdVNmVoQTRXazdraHdvNXlqZDVLOXNVMmRYdUY4?=
 =?utf-8?B?Ukd2NVBndXhCUy81Y0dVb1ZoM3MzamJ3M0VEWVZSVVhGd3RjRVNVMWNGODN1?=
 =?utf-8?B?T3kxMVpwWjZScmFha0hXYitzcVN4a0Q1eXM4cDlnZkd4V3JINmtjMmIrMFhG?=
 =?utf-8?B?cFNvQllERG5uSFhoRDBXbmlhSE9XS0crcTl2Y2RDNDB5UDhiMVBlWVlaL1lG?=
 =?utf-8?B?Ukg3ejVpWnBQSGN5WHcvTGNWQkpZVHdWd2tqeWkyd2pmTkFYZWhEdWdUWGpn?=
 =?utf-8?B?dmNuY3A0c3l5RE9DK3dCRXM2N0FobHV1RFlBNGpnUmF6ODYzRDVwWUJqb2Fp?=
 =?utf-8?B?MFVIaXJ1YWV5TVlwZ3ppakEzNzBlc0trTHRsKzlPTlRsekRYclk0RW10VnRM?=
 =?utf-8?B?M0I2aDlBSFBoN2hDajZCYVpVMVNQNXBCd3VOdnArWlNteFFIb2o1UTlIMys1?=
 =?utf-8?B?NU8ybmtaaXpzWUh1SGRuUzlBYm9oMGRQVHdYS2FhTTRUOXBBRWtkckcwU3Zs?=
 =?utf-8?B?ZnBPczlTelpLYktGRDVvUVpReEpkTCtwZkdwVGlJQVg5MS9ML0E0dkhhNG9u?=
 =?utf-8?B?bWF2TXZIeHFmR1ZlVTRQRHcvTTNOYmEwRmJEM3ZMWUhPVEtKUUFkQTg3VDMw?=
 =?utf-8?B?UmtRRjJXaVJnNDNMRlFUT0YxcWR2SzlWdnpzYU94aG80d3lEbnFiUVZ4Ymor?=
 =?utf-8?B?RFp3NGtGK2xNUWxvbC9XanBOdHZWVXBjRWQ4UC84Uk9zN3Vzbzl4YkdVc2VV?=
 =?utf-8?B?NndSemVCcUx4ZE90Y0tNcm1YcDQvUGhxMko3bjdGOWxhMmtMRU5Udi8yakZu?=
 =?utf-8?Q?aZxs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVFaa055MnlqTmg1WWxnL29GOWJSYWNKZlVCbDQwdVBuK3hxbVNRTG5tQU9F?=
 =?utf-8?B?b0JyUzNBUm9mR01TaVdOMkFzWERvNHNXZjBzTEtVeUtFL3YyOHI3WEdGMXhD?=
 =?utf-8?B?NEg0QlhCT2d2Y2V1N1I1VDJxQTNOQ09Fd0FEN0toOTdFalJXNWFWcVdibEV3?=
 =?utf-8?B?Y2VGb0hPQVhLM2VmU01HZmwyVUh2dGZiZEIrMGQ0czRrcDRyc3dMMStWV1p6?=
 =?utf-8?B?TkpBOXp2RTVnOUR4R2M3aEJxK0JFUkllb09hVzVtZlBGTm1SbzNVKzFOcWpF?=
 =?utf-8?B?Z2Jrb2tyUTI0Q0poM2dlQmxRYkp6dng3enFvNzZvY1dkTnlhdTVNVThIVzBR?=
 =?utf-8?B?TjNKODQvRUJaSG4rSEg1dDNPSS84VVd6M2szbCt5T2V5TW1KNDZUNHZNU09v?=
 =?utf-8?B?YWs4Z3hvWktPN1hQK2xXcCsyUTYrRG5TOTlDZkVlU2xQQzQ5QUd2VjFnOFY0?=
 =?utf-8?B?TkRYb0hKYUVIbUVWSWl3eVFvaGNaZkFtREFwT0lDaTZIbk9VNk51NkpiVDE1?=
 =?utf-8?B?RXFuU2N5Nk91OXFjTEJnTklKS3lLUmVmVE1PQW9iMGhGVlU2TFhpOVN1cjI4?=
 =?utf-8?B?YWxDUS9JWVh6UU1nRUlZTGZvcWZ0VFJ2YmxybUV1UFpEcU9sQUswRitGeEtN?=
 =?utf-8?B?czkxOEJDMncwWDhQaDdGK3JYV3VERWdKeVQzMmdnckJJRjZ3eForQ1pGeEls?=
 =?utf-8?B?TXVUWDlvYXRxNVZzWmhiajBrQ29pNWVrQlVkbEhpb1Q5QlpTLzZMeDV3UkFy?=
 =?utf-8?B?dmZwaXFzdWo0UUVtdkk4dHRLQXljVEZQNno2SHpHV3FleXpuVG1qaVJLUnAx?=
 =?utf-8?B?ck4va0tGZFp6NTI2b09YaVozcnBlMWM4b3pJVzdIbUdGUFJjY2xOK2Y4OFAx?=
 =?utf-8?B?UVAyVVlWUGE0NUtyRmVrQjRsQm1OMkFyUDZLN0xmWnpjNVBIYmVkTmZrS0VY?=
 =?utf-8?B?ZGJHV2FETnlvYW82TVhEdGhlZVNmWHlSM01EWjh1ZFJLLzFROVo1dkNOblkv?=
 =?utf-8?B?dnNvWFNaaXlNeTRjRERxemdOTFRiVENvbVJBMm4rbGg5ZWdPWEJwQ0MzMjc0?=
 =?utf-8?B?YStBRFJsNzdyT1ZkL2tNMkJELzZjbno1bEN3RXBpdzVramdXY1RKd0hGcnNy?=
 =?utf-8?B?SnlLeW50akg3SVRZOHNyUXRPS1Y2ZjNtTHFnOUN3bXA1d0pZZnQrLzdMZVpo?=
 =?utf-8?B?b2FqVXNLYWs0ekQzYm83V1dmS3IxUW1XMnhxQUg2MkVJRlNFcjMxazA0cFow?=
 =?utf-8?B?MVVoK0JUTXdwSmIyaUdUUk81ZVc5UlVzU0xTdnNMMXpuNWo5Qk1ObXczT09Q?=
 =?utf-8?B?SXIvN3lzWnRSQUJBRmNMTnlOOGVBcmFXdU10TXJlSXN1VTlJN1FPaHI1TkpE?=
 =?utf-8?B?ak5kSDd1ZUYwajZOOThzNkpzRWxYaHdiK3lDNDlVVHk3clQvWkRYWjY2cjd3?=
 =?utf-8?B?YWtSRVhJbkllSWZ3T0xpUlhUN2xOVTBaN0h2VnB5a2djS0dseVgyNkgrQVoy?=
 =?utf-8?B?OHpXMk1zbVRRclh0ZHZsLzFFLytoMDJ6dzhmN2RxRXhORjFsN3BTK25ETExu?=
 =?utf-8?B?R2s3VFRVRUx6a3BUTUVicVI1STIvTWZTbzg1MjdPR1RnUlZXWkdreDhRZ3NM?=
 =?utf-8?B?eEhNdDdRRURKYlFVN1ZWbjRuM21PTlpTMGt5Zy82c0w4eGYzQ201UlpGYjBy?=
 =?utf-8?B?cGkyNWxURWhucmtHa0xZd0h6VU91UnM1a3U0NjVRa0JaemVVUnNmUlhNSjBj?=
 =?utf-8?B?aEF3WkhQUmp3VVlrcHFqSGQ3bk9Eekpzektrd0o5ZWRnYldmQS9uZTBqSzNa?=
 =?utf-8?B?Z3R0Nm1BQ0d4UjROWEt5TVFXMmdQaEIvUEw3UFVUNHVuRDJTTEhuYWhIVWRq?=
 =?utf-8?B?bGFaQWlWcXYyWDdVVWNqZklBN05YQUdJUERmekZGdjk0U1JlSjBidWVsN0Vy?=
 =?utf-8?B?a281WmppenNjUTBiNE93Y3RjbDRFaTNIbFI4R1h4blNScThkeHkwYXhXYTR2?=
 =?utf-8?B?Y0lxTkk4dC9SZEt4dG5rTFRWRE1zRi9ES1NNa0RuYitrNlZVWnBxakU2SDNy?=
 =?utf-8?B?NzUvU3JobTBLSEJ3YjdHeERuSzR1T0ZKWGNtVXdEaWxNUFZPa0lhWEd4TFVm?=
 =?utf-8?B?MlFxMzZjSU4xUUNZT0dNY1VtditJWU5XMEZXUUlJbE55enBBZzdEZkQyWVV0?=
 =?utf-8?B?T1dlZkFIcHhzSGxTRE1uTEx2R1lHR2I1N2tZUEtTeHBKejVSRlY0VU1yN0N0?=
 =?utf-8?B?L3hSN0dwanJncjlldDRHN3pvcmJEeURwT3pLTzJ5a0JZSkpid1BFUkswS0t2?=
 =?utf-8?B?bXZXM3FLMVBCVkEzS0oxMHpqWjVDbzdFMENkR0RnZE5lKzg5RGNyUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7568f4fb-280b-4145-1564-08de5427ea52
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 11:19:14.6685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHf3YnkPw9gZt7tmrUoCIeyGkOiqLa3e6BfBdr+GEeNvW95r1Yh4Ks1TivRPOxf0KKuvP91Ghgd+LADiHD5iTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7431

Physmap population has the need to use pages as big as possible to reduce
p2m shattering.  However that triggers issues when big enough pages are not
yet scrubbed, and so scrubbing must be done at allocation time.  On some
scenarios with added contention the watchdog can trigger:

Watchdog timer detects that CPU55 is stuck!
----[ Xen-4.17.5-21  x86_64  debug=n  Not tainted ]----
CPU:    55
RIP:    e008:[<ffff82d040204c4a>] clear_page_sse2+0x1a/0x30
RFLAGS: 0000000000000202   CONTEXT: hypervisor (d0v12)
[...]
Xen call trace:
   [<ffff82d040204c4a>] R clear_page_sse2+0x1a/0x30
   [<ffff82d04022a121>] S clear_domain_page+0x11/0x20
   [<ffff82d04022c170>] S common/page_alloc.c#alloc_heap_pages+0x400/0x5a0
   [<ffff82d04022d4a7>] S alloc_domheap_pages+0x67/0x180
   [<ffff82d040226f9f>] S common/memory.c#populate_physmap+0x22f/0x3b0
   [<ffff82d040228ec8>] S do_memory_op+0x728/0x1970

Introduce a mechanism to preempt page scrubbing in populate_physmap().  It
relies on stashing the dirty page in the domain struct temporarily to
preempt to guest context, so the scrubbing can resume when the domain
re-enters the hypercall.  The added deferral mechanism will only be used for
domain construction, and is designed to be used with a single threaded
domain builder.  If the toolstack makes concurrent calls to
XENMEM_populate_physmap for the same target domain it will trash stashed
pages, resulting in slow domain physmap population.

Note a similar issue is present in increase reservation.  However that
hypercall is likely to only be used once the domain is already running and
the known implementations use 4K pages. It will be deal with in a separate
patch using a different approach, that will also take care of the
allocation in populate_physmap() once the domain is running.

Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version, different approach than v1.
---
 xen/common/domain.c     |  17 +++++++
 xen/common/memory.c     | 105 +++++++++++++++++++++++++++++++++++++++-
 xen/common/page_alloc.c |   2 +-
 xen/include/xen/mm.h    |   1 +
 xen/include/xen/sched.h |   5 ++
 5 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 376351b528c9..5bbbc7e1aada 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -722,6 +722,15 @@ static void _domain_destroy(struct domain *d)
 
     XVFREE(d->console);
 
+    if ( d->pending_scrub )
+    {
+        BUG_ON(d->creation_finished);
+        free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
+        d->pending_scrub = NULL;
+        d->pending_scrub_order = 0;
+        d->pending_scrub_index = 0;
+    }
+
     argo_destroy(d);
 
     rangeset_domain_destroy(d);
@@ -1678,6 +1687,14 @@ int domain_unpause_by_systemcontroller(struct domain *d)
      */
     if ( new == 0 && !d->creation_finished )
     {
+        if ( d->pending_scrub )
+        {
+            printk(XENLOG_ERR
+                   "%pd: cannot be started with pending dirty pages, destroying\n",
+                   d);
+            domain_crash(d);
+            return -EBUSY;
+        }
         d->creation_finished = true;
         arch_domain_creation_finished(d);
     }
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 10becf7c1f4c..4ad2cc6428d5 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -159,6 +159,74 @@ static void increase_reservation(struct memop_args *a)
     a->nr_done = i;
 }
 
+/*
+ * Temporary storage for a domain assigned page that's not been fully scrubbed.
+ * Stored pages must be domheap ones.
+ *
+ * The stashed page can be freed at any time by Xen, the caller must pass the
+ * order and NUMA node requirement to the fetch function to ensure the
+ * currently stashed page matches it's requirements.
+ */
+static void stash_allocation(struct domain *d, struct page_info *page,
+                             unsigned int order, unsigned int scrub_index)
+{
+    BUG_ON(d->creation_finished);
+
+    rspin_lock(&d->page_alloc_lock);
+
+    /*
+     * Drop any stashed allocation to accommodated the current one.  This
+     * interface is designed to be used for single-threaded domain creation.
+     */
+    if ( d->pending_scrub )
+        free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
+
+    d->pending_scrub_index = scrub_index;
+    d->pending_scrub_order = order;
+    d->pending_scrub = page;
+
+    rspin_unlock(&d->page_alloc_lock);
+}
+
+static struct page_info *get_stashed_allocation(struct domain *d,
+                                                unsigned int order,
+                                                nodeid_t node,
+                                                unsigned int *scrub_index)
+{
+    struct page_info *page = NULL;
+
+    BUG_ON(d->creation_finished && d->pending_scrub);
+
+    rspin_lock(&d->page_alloc_lock);
+
+    /*
+     * If there's a pending page to scrub check it satisfies the current
+     * request.  If it doesn't keep it stashed and return NULL.
+     */
+    if ( !d->pending_scrub || d->pending_scrub_order != order ||
+         (node != NUMA_NO_NODE && node != page_to_nid(d->pending_scrub)) )
+        goto done;
+    else
+    {
+        page = d->pending_scrub;
+        *scrub_index = d->pending_scrub_index;
+    }
+
+    /*
+     * The caller now owns the page, clear stashed information.  Prevent
+     * concurrent usages of get_stashed_allocation() from returning the same
+     * page to different contexts.
+     */
+    d->pending_scrub_index = 0;
+    d->pending_scrub_order = 0;
+    d->pending_scrub = NULL;
+
+ done:
+    rspin_unlock(&d->page_alloc_lock);
+
+    return page;
+}
+
 static void populate_physmap(struct memop_args *a)
 {
     struct page_info *page;
@@ -275,7 +343,18 @@ static void populate_physmap(struct memop_args *a)
             }
             else
             {
-                page = alloc_domheap_pages(d, a->extent_order, a->memflags);
+                unsigned int scrub_start = 0;
+                nodeid_t node =
+                    (a->memflags & MEMF_exact_node) ? MEMF_get_node(a->memflags)
+                                                    : NUMA_NO_NODE;
+
+                page = get_stashed_allocation(d, a->extent_order, node,
+                                              &scrub_start);
+
+                if ( !page )
+                    page = alloc_domheap_pages(d, a->extent_order,
+                        a->memflags | (d->creation_finished ? 0
+                                                            : MEMF_no_scrub));
 
                 if ( unlikely(!page) )
                 {
@@ -286,6 +365,30 @@ static void populate_physmap(struct memop_args *a)
                     goto out;
                 }
 
+                if ( !d->creation_finished )
+                {
+                    unsigned int dirty_cnt = 0, j;
+
+                    /* Check if there's anything to scrub. */
+                    for ( j = scrub_start; j < (1U << a->extent_order); j++ )
+                    {
+                        if ( !test_and_clear_bit(_PGC_need_scrub,
+                                                 &page[j].count_info) )
+                            continue;
+
+                        scrub_one_page(&page[j], true);
+
+                        if ( (j + 1) != (1U << a->extent_order) &&
+                             !(++dirty_cnt & 0xff) &&
+                             hypercall_preempt_check() )
+                        {
+                            a->preempted = 1;
+                            stash_allocation(d, page, a->extent_order, ++j);
+                            goto out;
+                        }
+                    }
+                }
+
                 if ( unlikely(a->memflags & MEMF_no_tlbflush) )
                 {
                     for ( j = 0; j < (1U << a->extent_order); j++ )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index de1480316f05..c9e82fd7ab62 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -792,7 +792,7 @@ static void page_list_add_scrub(struct page_info *pg, unsigned int node,
 # define scrub_page_cold clear_page_cold
 #endif
 
-static void scrub_one_page(const struct page_info *pg, bool cold)
+void scrub_one_page(const struct page_info *pg, bool cold)
 {
     void *ptr;
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 426362adb2f4..f249c52cb7d8 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -144,6 +144,7 @@ unsigned long avail_domheap_pages_region(
 unsigned long avail_node_heap_pages(unsigned int nodeid);
 #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
 #define free_domheap_page(p)  (free_domheap_pages(p,0))
+void scrub_one_page(const struct page_info *pg, bool cold);
 
 int online_page(mfn_t mfn, uint32_t *status);
 int offline_page(mfn_t mfn, int broken, uint32_t *status);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 91d6a49daf16..735d5b76b411 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -661,6 +661,11 @@ struct domain
 
     /* Pointer to console settings; NULL for system domains. */
     struct domain_console *console;
+
+    /* Pointer to allocated domheap page that possibly needs scrubbing. */
+    struct page_info *pending_scrub;
+    unsigned int pending_scrub_order;
+    unsigned int pending_scrub_index;
 } __aligned(PAGE_SIZE);
 
 static inline struct page_list_head *page_to_list(
-- 
2.51.0


