Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C97F677D2A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 14:57:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482874.748636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxKB-0008Hn-Dy; Mon, 23 Jan 2023 13:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482874.748636; Mon, 23 Jan 2023 13:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxKB-0008F5-AQ; Mon, 23 Jan 2023 13:57:27 +0000
Received: by outflank-mailman (input) for mailman id 482874;
 Mon, 23 Jan 2023 13:57:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJxK9-0008Ez-TO
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 13:57:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd0be682-9b25-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 14:57:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7108.eurprd04.prod.outlook.com (2603:10a6:208:19e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 13:57:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 13:57:22 +0000
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
X-Inumbo-ID: dd0be682-9b25-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kp9FHepyeZFiE5J8gJiuUVNvzzqMg3CgDP5ja4ZUe/+0rfwXGQ/2MzSMDQFsA+n0i6oDNc/uUpp3lfPbH5F9nvjUEp4RPOsYnnUy8xmAUsBIrLhzrRMwgUFDRNHoehjattnLxrwBBnmkHmJMxPLN+5oW7KuQObBpnYLjAceYJJ8rpaXo3KpRBp+9vFrOwh9XcPl6tAi9Cm6hpHCZgZZQJdGygyLI4SUZfp8j3tq/UHaMTnRSkaoTjnLwiwwQMJVqu3e8Bmz+kfx2uu31jkRjl6VtfuJmsuvlT/BAp8iDZcGCbRRbdHaKd9DmFKaOCU7Cljbf1jXM4K54wNhbWSsfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbeJmVZ0cCLkW+0jH6dPO/xtZoCyvfpomQkDuJawSRQ=;
 b=ljEtOPtD75y/zQycW3UW31RKynesektnPMFc3e5In4arQQzeNhH1vmna55selhlJTlo1Q1e2kuWZpptGFN+zEWq8+D/tLVRQoR7+VOIeYu3FvdMr4toDrpm5RXc4hWPejHcaeSZZ37U1BfUVB7Dl2oQOjZ7m1i1FWAiobEBC/PpsgMSd/69te6ApajM8JcVvnZbuZB3DE70BfAgUHatwWe4Pj4+caRoD/LZcW1Bs4lQNBFxUCn9aMBNgsOfkc4GupKdSajTF1ekiEQjbvQCUZrbvrV1HDGpVfaFt5vM4T8dznlFlpt931xnIUUGT5tsSHTDqbkflHI32n/r1s8G1eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbeJmVZ0cCLkW+0jH6dPO/xtZoCyvfpomQkDuJawSRQ=;
 b=MUqNk12f/5j0EHqcMAs66gg0+5OJ7mSivwsScs6khwP3cFOhmGSjGxdGBG9PNQqosDwL1kFb+IdzQnF4UGziVMwH7Qnchrhwd7CsZjfr0homykUNedygl4A408E4Pa6NMiuVMCnq0DMs4LzAPeCSVUrn0+sCv4zC53R97nk2twk0yH9pbMxUILLrBIhFM5+lY5GezxJsq/Oys/VshU5QbJZPAvpjXdyN2gwjM2IrYTyoUUsFU43GNhHztPOB+4fmjD6qgnHVk78nxosIeTrOQJIYGozDxvYBkrB1rzarBwCNUPLNV/ladkpc02efg82tpyQo7NmjlhdDF/m4tbf5Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08ac78fd-85d4-2a43-1922-3128d5fd8d21@suse.com>
Date: Mon, 23 Jan 2023 14:57:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 04/14] xen/riscv: add <asm/csr.h> header
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <afc53b9bee58b5d386f105ee8f23a411d5a15bed.1674226563.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <afc53b9bee58b5d386f105ee8f23a411d5a15bed.1674226563.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: 8665ccc3-0699-4422-9cfd-08dafd49bfe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SNPT0FjS3zixYnxkp8XjXcA9EHkzJhruWbCp8KuyNm+afLEP0gh1BzkATAtDEx2PSuG/aEEgHk6XqJGpO5U32B5X2qMC1FcRgt6Qu0Jq60Zj3xvuKyZtFpoXgDfjUUGaBpsV1rbUSx29vnDi63TNNs1gBb8QOiTfQ0XW/+nJRADKYjo6gqHHTSvTWH8dw04tRLYvf2DDz4T9db5A2qwHNSVqJfl1xoY7BHwgM6O+w6SuTdHLNYguYWHcv7RDJom4GqWI6pu1M8emNPcXhLg0ZXmLpYhXrIje6M605HzbfNaFk192+JQSphcrYcsOMKxt8hwdsK460MV15EO/8jGtGqvXcDcJAD8+bAD/7DoJ9plpQp+fd3B/WgKKe0x+4dsjOrcnYwowFrlPmyf1k1U4nINIXuHrH/gFatn1UbXbtHkFmWOMsrDBspk/XfCImbhFzID8WYzm8lAK8GKTCOVVGmA5/UVqeLH88y1eo6GNIIx1PyFX1vCD51NfRErrWU4LbuvpsDQwN0nGFTtjtal3XJ8F7Eanf3WCEfP6vDcvSR+WvWVHby/Met8AJ6HZfVmB8MPb4mD3jlA850eEekTAr1Wx99riVJ5q/75zBZt6RRFbWrbfptSqDbwAUq/M3WJqHFWXEchsyKcemSTDgKU7urh67jRuU2Lvwv6T7bnSNa3vkpXdFf5Mqtd4z8W46/P8KxWMt0oP6rbRYlKelp9p1J+xbDo2jdnkScrmcCpQUhU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199015)(36756003)(2906002)(5660300002)(38100700002)(8936002)(4326008)(4744005)(41300700001)(86362001)(31696002)(478600001)(6486002)(31686004)(66476007)(8676002)(6916009)(6512007)(53546011)(186003)(6506007)(26005)(316002)(54906003)(66946007)(2616005)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0xHcXpTSzBMbGlvUjAvbEp3NUZxQmdQSUtCN1hvSzBqcmFydXFBY1JQRDFp?=
 =?utf-8?B?dWhqbVpXVGU4R24xTXdpMnlUS1dEcW5xVWpySjd1a0M2bXc0bTRIRWl1QkZn?=
 =?utf-8?B?UU5tdzFVNk8xY2xRanppbkZpZkFoV2VnZEttSlh4MWM1RGV5aWZCZ3huNDlY?=
 =?utf-8?B?OWVIY0hhREhGMGRpUVVWSnI0bk01VCtQaWNKd1JLUmpJUHAyMmhaNWNtYmIv?=
 =?utf-8?B?OWdjWlB6OHM0bWJ3QXcxcm9MRTg2NGJtb2NLUjlCd1NZak00MHZDc0pQSy9L?=
 =?utf-8?B?WFV3bWFVU3BsN3g3a2pHQ3FWTGJ5eDgybDcyZXZSREgvMjFXaERrTU1hK3A3?=
 =?utf-8?B?V0JLYXJYZ2w5Wk9DbFJPU0hwbkhnb1FSbk5xc1BNTmdGSEdPUlNTZkNzdWNm?=
 =?utf-8?B?eUtYeEN5NTMzSm0yb05UbGxWekJmWFQzV1RoaTAzUDBqSGplQXpoQWcyaWVi?=
 =?utf-8?B?dzdTTXkwamxUQ0hSUG9VMGFpK2NreEx6V0FuS3ZGekZNSUFiTnY5VnFERTln?=
 =?utf-8?B?UGpNRy8yL3pXTkJiNDFCbzdCWDNxcVRwSUVsMU1velZiSHJnbStGa1VjRTU5?=
 =?utf-8?B?RkdhaWFTQVpiRWwycUJYa3kyVkZuRnk1LytFMUV0dnNkQnZTeHB1UmMrSzd4?=
 =?utf-8?B?VkFwQXNYQldtUmVwWFFEUWV6Zmg2Y3ROc3N0REhrRUdPc2dld0xSdFdrekFO?=
 =?utf-8?B?QTIxSDhHT29va0dacENxa1pDdWhxajVocmtTL1piUnUyYUF0N0FueTNpVFd2?=
 =?utf-8?B?MFRFNUpGSm5YbHptRzNQQXZCeDZObDFrQnRpL1EwZThWdFdjYzlsZjhmTTdV?=
 =?utf-8?B?dVJSMDgyTWZXMVBtR3lrMTdVLy9EZTVPZHV4czF3bTVhM0RQbjhmRUJEaEFw?=
 =?utf-8?B?RkdoMm9iZGViZ1o2NWhWRGFXQ2llR1lvMXYzS3RjU2hDRFFNQlhscytISVEx?=
 =?utf-8?B?ZXZsSnJUaE82MDdIS0RnQ09MTXBJaWM5ZGMxMjRtQTl6OTdJMmN1V3J0QVVt?=
 =?utf-8?B?VTJWOWlteG5tdU8rSk55N3V1MHNuSFpKSTJzeVVCQjBzOWxYYWhXTTl4bXJl?=
 =?utf-8?B?NkpFazQ4NGx5R0JJaTl6UzdYRklhS0JrRkVlMlMwRVlzcmdZMEZKNmpnaXVR?=
 =?utf-8?B?TEdFZGovY3ExZU8vUGx3MlJGOHVxNzh5a0YvYUZQKy9iQWJ5TmVxdGw3OHF4?=
 =?utf-8?B?YW5ETStWcVpSeUhjSHZzOTBkS0lpbHhnT09QMDNOS3FoekxRU3J4L2J6SjRW?=
 =?utf-8?B?bnZWVW9Zc0dkY3NGSENDUUdqSUppeCs4Ukg4ODRxdkl6RkxxM1pGR2Zmakgy?=
 =?utf-8?B?V2xOWmh2T3BqMW9HNzN1S2JlVy9wcFFuOW5ra0NIZU43RlFlSWtESzJqYlNG?=
 =?utf-8?B?S3lGY0Y1eXZOQ3pEN3lRQ0ZJVW5YV2V4c003dzFjbXpEcmZCZkhjSVI1aHpm?=
 =?utf-8?B?b0J4ckhBZWJrVVNJeFpjV0JRZ2dDU2RNQ29rdlNGbG0rL00zMGlhQmlQQXFN?=
 =?utf-8?B?b1RXTWhYNHZjWnR4eXlBVEc1SGt1STZUOXN2MWl5UDhsL09ZNGhjUWI5cllo?=
 =?utf-8?B?enB6UGlvaUkvMjdWaXIzbkRpZWY5NHBsSGJlSkY3SlBhT1REbTFPdVlnRG1w?=
 =?utf-8?B?YUxLQkJNQVJiNmVoL2dDeXQxZlZJSVIrWXF5Mi92Yi93SzdIUXpnVVdjRDQx?=
 =?utf-8?B?enY4OHIybFZxaytGa3ZpTVFkK2VKR05EZ1JENHY5ZURIeTFJOUhVM1BlbElN?=
 =?utf-8?B?NlhnWG5EV2N3S0hqVlpia1dxMHVDMHlmUkRDUUZuemM3NGlvYi9USHRLM3FK?=
 =?utf-8?B?NjlJU25BMjZtQjNnYXVrSDBWdHNSSmZOT1RVaXRucmVmR2FuYzZWdEtKZVNw?=
 =?utf-8?B?elZuZ2d2d05pV3F3NzNmeW5kMGxzTzNOb0llV0YxazVLb21hcis2MlI2ZHYw?=
 =?utf-8?B?TWFzb1RzRWs2ODJBancrZW1LZE00TUNCcDJlRlBzMzgybnhFQVFxL2hXTWEx?=
 =?utf-8?B?aThITmdEbGQ2QmYxUEswSDE5SDhDQzM4ZjhpWVFSdzFOVEhzWlp5ZUkyWHg3?=
 =?utf-8?B?RFFVSXg4QjZwSVBrcVlLTy94ZzluN1pzU0Mva25EeER4SUJsUW9ycXJjSUU3?=
 =?utf-8?Q?kZoPZ4qNJBnuwI7G2zBaWsA4U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8665ccc3-0699-4422-9cfd-08dafd49bfe6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 13:57:22.1910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdZHR+EP4h0T7EezKBbKuFJURvMHneTVUybv7rSduWod1qReG5SWhaV7+sFwguwiwiC+eLtN/GTkuWz9Wbd0IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7108

On 20.01.2023 15:59, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/csr.h
> @@ -0,0 +1,82 @@
> +/*
> + * Take from Linux.

This again means you want an Origin: tag. Whether the comment itself is
useful depends on how much customization you expect there to be down
the road. But wait - the header here is quite dissimilar from Linux'es,
so the description wants to go into further detail. That would then want
to include why 5 of the 7 functions are actually commented out at this
point.

Jan

