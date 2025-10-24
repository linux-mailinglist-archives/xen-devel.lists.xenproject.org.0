Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C25C055D5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 11:34:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150030.1481350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCEB3-000489-DK; Fri, 24 Oct 2025 09:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150030.1481350; Fri, 24 Oct 2025 09:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCEB3-000454-9w; Fri, 24 Oct 2025 09:33:41 +0000
Received: by outflank-mailman (input) for mailman id 1150030;
 Fri, 24 Oct 2025 09:33:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0w6I=5B=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vCEB1-00044y-Ld
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 09:33:39 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84c40532-b0bc-11f0-9d16-b5c5bf9af7f9;
 Fri, 24 Oct 2025 11:33:38 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SA1PR03MB6321.namprd03.prod.outlook.com (2603:10b6:806:1b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Fri, 24 Oct
 2025 09:33:34 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 09:33:34 +0000
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
X-Inumbo-ID: 84c40532-b0bc-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1qa26IYjxb9lo81WV4FvieU+gNBQxXwG7ZrApp2+cQks+JUSWO93C4fz66RBC54L+y7WpaEwNSjc/2I3VpiYnl7ZAOQIgulxqK80aVHMGMdo/9V9OThNPWk7AcbDk/J6EcpviJFDdmLc8j6OgYkxwO9+Vd7L8xDiCuwsDizQ4gFoEowiWzjFtwv7NZMk5xxM5YTdgjnkKZ6fmWB8vnUmPgG0icdl1M9JS5fxPisIwh57e9MFpwYnGGsTE01mJGg7c0zHoGF5nQgKb0eQpi79ZICijh7hS3kI+EOD4w+5IoEGRaFCG4Oy5YIDWHkDmBPtxecHDdzNc7QpxyH4cC9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dm+4Pwx3kYjB7jxJ5WDHiU+ptwFy4CZJqJGq6BBHl7I=;
 b=acABWsAKJEU/Ztj+NOfE9HTH6ZnPGe3vr76Tz1u6ccQYOspgbxMOn9dEMVyGiL+X4j8TV7X2SOHcUwp3prDVKtSM6GOWgZ6qCpBoBxBmH7ItsTDvXx3FmKamYE4vW9f+ntGU7w/Divwq1UPVntmfKG0SoC6wLwowGbVb7C563100WrHv9Jor5VgNYdRY7iRnaRl25U5InKhti5SyY2vJIjH5k+GUvcNMq1yc8TBVJwEtOy2m5k+CijS5rvriQdAm9pEloKJCCOSQnSoKgDoIYP223ikKwbJQgvBJ7A6h+kG78y10aPe03gsI1M+VbVYu1YybttC5gw0rEFvnGnVvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dm+4Pwx3kYjB7jxJ5WDHiU+ptwFy4CZJqJGq6BBHl7I=;
 b=w3S8I4Ywhr9rwynUMJYJ8yoWdEl2z366hsp/yJpOaMWONbJdKc7mRfBJKawCd1beNZlVWy6gPJvlrUtifHitzYsfc76yCAzSOe2/lYb8o76FVAMVwSKQhmJIb5uKImAoWhLA4eouKohufCybPLSvvP/BeJ4v6N3TKzXr9UWBCwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c7397bc5-574d-444a-a8cf-e76e95ec20fd@citrix.com>
Date: Fri, 24 Oct 2025 10:33:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Support LLVM raw profile versions 5, 6, 7, 8, 9, and
 10
To: Saman Dehghan <samaan.dehghan@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Wentao Zhang <wentaoz5@illinois.edu>,
 Matthew L Weber <matthew.l.weber3@boeing.com>
References: <3dc1fe6ee55d973a25a0441d0f6b41e00a58227b.1759355762.git.samaan.dehghan@gmail.com>
 <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0375.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::20) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SA1PR03MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d93db0-ed66-4a72-8bc0-08de12e066f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3AxNU03UHFYUjNWaGN1QW94Q0tpcFgxMm05ZVRGdnVyUkY1T1J4YXdObWxa?=
 =?utf-8?B?a1Nua2tzS01UYVZFMHA0QXBuYjdyRXVnOGNLUFhLQ2RiankyWVZsRGlPTnEv?=
 =?utf-8?B?OGdSekdvQmdzM0F2amZ5NE5jUnJ0dE9ZeEJIUklha2tvZGFYQk95cndyUUV1?=
 =?utf-8?B?ZlB1R0dDNGVHcXAyenVndDV5dVZEa2l3WFlud016QXFMQnFUaW82ditLdW0y?=
 =?utf-8?B?M1B3czFxRXdSRFQwcjVhQ3JPaEVRRFdzc1lrOFZSUnB0ZDB2dUVLbE1ja2Zw?=
 =?utf-8?B?L012ak5aY3BFcWdKY1BqczN1YUJ1cHRqLzgwLzVBOWp2K0xQUk9RaEFpSUor?=
 =?utf-8?B?c2tUejFqZjJkQldHQUF6SHBqeWxuZ1lGcTVQSFBvUFk1RTN1bGVKaWRoUmtJ?=
 =?utf-8?B?OEYyNGZDLzNWemQ4dHVRRis4bFp0ZXRWSlI1RFhWeURiWnFqQXBBYU5EekN3?=
 =?utf-8?B?R3Fsd2lBNkpxVTRwT0dtOEtVV3RYWXBJcThKMnprMnBYcm9VbW1TZjU3OEUv?=
 =?utf-8?B?alE1b1pKKzdvcGZrTEM2Um9SR1JpRGVwd01wbkdSMW5zSnNkVE5Hc3lFSjJG?=
 =?utf-8?B?aVNmS0x6N3YzdE13T3MzTE9TRjAweHRKeCtNaTVFYmJqanUzUjBieGF6K1l4?=
 =?utf-8?B?cGpPcEtDbjE1TzBveng3c05VS0FqMW81Q1I3MUl5Nm54ajY2NlBiVW5FdmN0?=
 =?utf-8?B?a2lGSmNPckNjVTZSblNoQ3UyeWIwZXdLME5NQWVVZm0xeVV5YW1IUkE4S2tZ?=
 =?utf-8?B?ZFlRZlZyanNjM3FtVXMreVpuS2NadUtiUXB5blB1V3NYcGxGSkg1WW16dTVh?=
 =?utf-8?B?NjA1Q2k1cHJPWnNhaTJ0S2RNaXJKZmxkK2dJUzMwUkZjTkNlRW90QWErZ0JO?=
 =?utf-8?B?dkVWWUxoRWdnY2tMVE5lZDcxQk4yN1JhckFaQ3ByZW93ZWNMbFhJOHBXYy93?=
 =?utf-8?B?YmZQc0xNV0IvMUNnbXB4TTZWdkpVSHZlNnZub2FHV1pwNXc3YXlobnY3TXQx?=
 =?utf-8?B?OFBhN0JjNy9TY05ENDRuYUhHTE1Gd0hRenJpc0pCR0M2WHFhOUxzSm8zRGVO?=
 =?utf-8?B?OGFmdmFpdEk2ZWF3a21RbE5oeEI3UldBNVpoR1pEdnd2K1hLaVM5ZysrWXZi?=
 =?utf-8?B?YUErQXJsUC90MnNuV1lCT1kyNUNnZlBtck83cXBwOTN6SVAyVkozdFFUdnds?=
 =?utf-8?B?amFSazdPdHM5d2hiUUwwdVRlSEIxT0MwQnI2NDNpajJ5R3JFY0RjUDRTS1Y2?=
 =?utf-8?B?NDlEWGNoNmdQM0hUbTh3SFJPcmZqS1B5cld3VjJLV0FSdDZTUGZVcE0vcmJ3?=
 =?utf-8?B?L01OSHdNdlBVTFprVVdWRU52bURXWW9PaWZLL0RrZzJKSXR2Z21RWDN1M3Ns?=
 =?utf-8?B?WHVwVGMrelczWXJYbmVIU0FQdDN5VFg5R0g2eVdSK3ZnMitmRWUybTdCRUZE?=
 =?utf-8?B?TVkzbmcrRlFvYU15Z2ZEUkhCMys2ZkliZXFDdk5JRTFpSzBBaTd5bTVDN0J0?=
 =?utf-8?B?cCtxRXVNbVJMdG1IUU1sZW9Oby9sbEtjNjVKQzhuSTFXZm4yZWR3THNIdXZ6?=
 =?utf-8?B?dUhtMHpwV3RGSE1HS1V0Y2IrbzIzSi9CS0hWb1BKOWVYSGZpaE12SitYaWJi?=
 =?utf-8?B?YzduR1Q2UkpEQlA5R0o0dkFQVFNNT0FmQ003U1AwMk5NeGdzUE9FZU5veXJ6?=
 =?utf-8?B?RmcwUG0vSDZEMzFKYktPanZkaGNUS0NwWEpRUGxxcXNzUzBqWHZNVk92SlFv?=
 =?utf-8?B?WVFMZ2RtSWUzNWRXWXFHZkU2MitVLzlhcks3SzNYVHRiWGFNSXB1bmpXWllV?=
 =?utf-8?B?a1p0RGZQUFEwVDZXQk8zNUNEQTk0UWxoaFFGTldwNGl5WTBCVFp0QVQrYTdD?=
 =?utf-8?B?eURRUFVaSzNOUU5mcU4vTnYyNXlYOVNMSE9xd0xsUnByTzFyd1dzeDFnaVQw?=
 =?utf-8?Q?27bY2yeGLxGd4/A5NrVYU5F1DaFsLfTf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2xMV3dxbU5XdjZxVkRwK1h2K3lkUGdDc0JjWkR1ZE1NWFlxTW1hMXVGdnlD?=
 =?utf-8?B?anlYdWpIVkhzVGlqc2VDTDFXQUoxMjhENlU4TXJzQXQ2OE1TY1VOdnhtR0Nu?=
 =?utf-8?B?a2ZNSmw4MnNCMkIwSkZtUXFYSkNmbWY3djVkVzRadGpqM1JyY3RnY2RHNXZG?=
 =?utf-8?B?WXNJV014MjlNdUxrRjhYK29VZU45aU9qdVFOVzZ0ZWs5Z3ZiMDlHNkdvbFE3?=
 =?utf-8?B?dzBpcUVUSms4VE5PVk1pNzV4eUtqUTF3RmRVcEhuU0Zsd3NiOGVvTko4U1Rv?=
 =?utf-8?B?dU81aWRuSy9pVGVKakdNV0N0TXdoZFFvZEJYVG9XVmtIQmpYdE1KcEdyZkhD?=
 =?utf-8?B?eWFobDlCUkRaR01BZW1zbG5sbVRoNExQdDZyaFFlSVJuenNrekJuckpoNEtM?=
 =?utf-8?B?VjA5NytlTFlNdXVvTUtjcDIxckJ2ZDkzV0lPeEFCVkJ6dEdTRjUrL1hqb1Jp?=
 =?utf-8?B?NmhsNENYT2Z2b3FWWlprQ21tV1hNZkJDengvTmt3QlNXeXdWWThPWDdUQ3FN?=
 =?utf-8?B?c3lXWU1LdjNvTHZqbFN3UTVFMndoTjhVM2FVRVczZ0ltNEJhUHo3Z3F1Q1hT?=
 =?utf-8?B?RWhnTXRubDgxMHdSOFlzR0VhY0JndmhlQ05JeXFBVmluMXVrSzRVVzVXU21a?=
 =?utf-8?B?Rk0xWnplOE9ydUZlUmIzZ0hlQzY1TTBxUnNzS0xVWEd4d0Z2TkNhZzhWQWtL?=
 =?utf-8?B?ZmF4VUxmSWRLbnZFZEsraEI2UXFMcFh3TjBRTnhjTm5MQUs2M3Z2N1UxYUJ5?=
 =?utf-8?B?b252RHk0NGpxTDlkYVUvNk9QOXFBZ2FmKzdFN1JQSHFYcmdteFRxZGtDL2Ex?=
 =?utf-8?B?Y2NzS3dQc3BRSTY1SkpqY0t0cUQ3SFpYeFNQSTd4cVpsV1pFaS9rS1FwcFpB?=
 =?utf-8?B?ZElRVkEyYU5aeXBodWFiSUppNnBxL3VsVlQ3QVhpTmhDbnIvb2kzSlA0emlM?=
 =?utf-8?B?TDhuZVMwMUM0NFlPTjRlM2E0eW5hckVvalF0dTRFNEZQZFc1bnYrRmJLVGxP?=
 =?utf-8?B?Z1d3WDZSUkJxVXRHcFkrRno3ZDUrTm5PaWZwOUZidTkvNWt5QmpteFlhQ3Vz?=
 =?utf-8?B?MW1vbnRXRklIaVFIQlgzMGNCZllYUzNzaTE2WVBQQTBhZlcyL0NXeHFOR2tK?=
 =?utf-8?B?dW1KUnhSWGV0K3dCcFZ6MU16OEJNanZoMU0xUzVnWUxFR0YzeGJKckkwdDh4?=
 =?utf-8?B?MWZyQnkxenpudVNmN3ZTRjY1TnUyT1plVGtSQU8yYjFreDhFRUJxYnE3eldI?=
 =?utf-8?B?SVFjaVM5TngzOHdsZmVzUXRKVUFGdzlkWk91WnY3UE1GcjdzdFhBOUMxU0sx?=
 =?utf-8?B?cnN1WDVGM0FhVXh1MWRIZFJNOEltMVJUY2dCK3J1UkRjQ2lQQVNBK1IrRXdO?=
 =?utf-8?B?YXc1NTY5S0ppSGxrbWw1ZEk0YUE2L1RSVFJCbzhUM3k1Q3JrT29Tb1NxL3VR?=
 =?utf-8?B?eTVKQmM2bUc5OUQydHZtaEg0QlF0V3FLbzJjZVVmajJ1MiszRUwvYW9LcU43?=
 =?utf-8?B?UUY5bmdSZjVTK0RyNGlORnlOcVlqdTByQmE5cUpsSHlFcnBkc0c5WEFoV09K?=
 =?utf-8?B?dGhPbjFwV1c5eWoxVUgzaEFLajlVbHVrWW9rZTJqRGpSVEFCTUV4emJqRTJR?=
 =?utf-8?B?VmZyQkxLZy95VmtsemlEVWM1VEludzJ0VUE3MlZtdTAyN3BYcUdQUzNKSFl0?=
 =?utf-8?B?SldYM090SExvSVlGODNLWHZwWnUrL2t5SzZHcXg5TklHU0dmWWdZanpRclVZ?=
 =?utf-8?B?UWtKbFBzTml6MTZlOStKeWxHYkFQdi9kNHNpSzd1U1ptcmRha3R0WWl2dThn?=
 =?utf-8?B?VXo3MnR2VFVqUlZZNUEvemt2M3U3UDhQSks3aEJOaUg4eExrajBiVUs1eTNB?=
 =?utf-8?B?MWJveDh6dkk1aWxsMVZKb2UrRFkwcjNobFk3SGZacS9YQmtIWDVGSlZlM2ZL?=
 =?utf-8?B?NXhveFU5QWtxRU15TXdYUUprMXA1QnRqQmtpaG5MT3NHb3NwWVcvbVJ6UHhQ?=
 =?utf-8?B?Y3pWTllEaHp5TlZBdkNUU2F0MkQvWEJ0UnhEQUNaTHdldWI4MEdnR3lnNGRx?=
 =?utf-8?B?d1J6Smk5YUZ1ZTNCdWhxcGZKL2FQOTVHMkovK2ZjNDl5aW9vQ0VzMzRHWEcr?=
 =?utf-8?B?eVlYa2FCTFRSa3BISmhjWERGWU8ycHcwQlBWSFQxMjViazJyd09rTmFRRnVh?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d93db0-ed66-4a72-8bc0-08de12e066f7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 09:33:34.4503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzbnoIfteNcMCN7JNrTHqSd80NXrK3Fg2AohVyNkBH2XrJu3qd1aJ93clWG0QQPXH+cf9liUKvQA5cXGjdcC4qwhGVTe+jFoTlBTXsq1e4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6321

The subject should have a "xen: " prefix, as this applies to the
hypervisor and not other

On 24/10/2025 1:16 am, Saman Dehghan wrote:
> This change enables compatibility for measuring code coverage
> with Clang versions 14 through 20 by supporting their

Stale 14?  It looks to be 11 now.

> respective raw profile formats.
>
> 1- Added support for LLVM raw profile versions 5, 6, 7, 8, 9, and 10.
> 2- Initialized llvm_profile_header for all versions based on llvm source code in
>    compiler-rt/include/profile/InstrProfData.inc for each version.
> 3- We tested this patch for all Clang versions from 11 through 20 on x86 platform.
> 4- Fixed linking warnings related to coverage code in x86.
>
> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> ---

When sending multiple revisions, it's customary to put a short list here
if what you've changed from the previous revision.

Also, you didn't accumulate your release ack from v2.

Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

>  xen/arch/x86/xen.lds.S     |  6 ++++
>  xen/common/coverage/llvm.c | 73 ++++++++++++++++++++++++++++++++++----
>  xen/include/xen/xen.lds.h  | 18 ++++++++++
>  3 files changed, 91 insertions(+), 6 deletions(-)
>
> diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
> index 517b2aa8c2..e3272a546f 100644
> --- a/xen/common/coverage/llvm.c
> +++ b/xen/common/coverage/llvm.c
> @@ -107,11 +145,34 @@ static int cf_check dump(
>      struct llvm_profile_header header = {
>          .magic = LLVM_PROFILE_MAGIC,
>          .version = LLVM_PROFILE_VERSION,
> -        .data_size = (END_DATA - START_DATA) / sizeof(struct llvm_profile_data),
> -        .counters_size = (END_COUNTERS - START_COUNTERS) / sizeof(uint64_t),
> +#if __clang_major__ >= 13
> +        .binary_ids_size = 0,
> +#endif
> +        .num_data = ((END_DATA + sizeof(struct llvm_profile_data) - 1)
> +                - START_DATA) / sizeof(struct llvm_profile_data),

There's a helper for this expression.

DIV_ROUND_UP(END_DATA - START_DATA, sizeof(llvm_profile_data))

> +        .padding_bytes_before_counters = 0,
> +        .num_counters = ((END_COUNTERS + sizeof(uint64_t) - 1)
> +                - START_COUNTERS) / sizeof(uint64_t),

DIV_ROUND_UP(END_COUNTERS - START_COUNTERS, sizeof(uint64_t))


> +        .padding_bytes_after_counters = 0,
> +#if __clang_major__ >= 18
> +        .num_bitmap_bytes = 0,
> +        .padding_bytes_after_bitmap_bytes = 0,
> +#endif
>          .names_size = END_NAMES - START_NAMES,
> +#if __clang_major__ >= 14
> +        .counters_delta = START_COUNTERS - START_DATA,
> +#else
>          .counters_delta = (uintptr_t)START_COUNTERS,
> +#endif
> +
> +#if __clang_major__ >= 18
> +        .bitmap_delta = 0,
> +#endif
>          .names_delta = (uintptr_t)START_NAMES,
> +#if __clang_major__ >= 19 && __clang_major__ <= 20
> +        .num_vtables = 0,
> +        .vnames_size = 0,
> +#endif

Because this is a structure initialiser, everything set explicitly to 0
can be omitted.  This removes all #ifdef-ary except the .counters_delta
I believe, as well as the .padding_byte_* fields.

The resulting diff is far smaller.

>          .value_kind_last = LLVM_PROFILE_NUM_KINDS - 1,
>      };
>      unsigned int off = 0;
> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> index b126dfe887..42550a85a2 100644
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -81,6 +81,24 @@
>    .stab.index 0 : { *(.stab.index) }         \
>    .stab.indexstr 0 : { *(.stab.indexstr) }
>  
> +#if defined(CONFIG_COVERAGE) && defined(CONFIG_CC_IS_CLANG)
> +
> +#define LLVM_COV_RW_DATA                                   \
> +    DECL_SECTION(__llvm_prf_cnts) { *(__llvm_prf_cnts) }   \
> +    DECL_SECTION(__llvm_prf_data) { *(__llvm_prf_data) }   \
> +    DECL_SECTION(__llvm_prf_bits) { *(__llvm_prf_bits) }
> +
> +#define LLVM_COV_RO_DATA                                   \
> +    DECL_SECTION(__llvm_prf_names) { *(__llvm_prf_names) }
> +
> +#define LLVM_COV_DEBUG                                     \
> +    DECL_DEBUG(__llvm_covfun, 8)                           \
> +    DECL_DEBUG(__llvm_covmap, 8)
> +#else
> +#define LLVM_COV_RW_DATA
> +#define LLVM_COV_RO_DATA
> +#define LLVM_COV_DEBUG
> +#endif

Newline here.

But, there's no problem stating sections which are unused.  I think the
outer #if/#else can be dropped.

Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I can fix these all up on commit, seeing as it's release acked for 4.21

~Andrew

