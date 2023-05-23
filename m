Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFEF70D40A
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 08:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538233.838039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Lbz-0001L9-FL; Tue, 23 May 2023 06:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538233.838039; Tue, 23 May 2023 06:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Lbz-0001Id-Bu; Tue, 23 May 2023 06:35:11 +0000
Received: by outflank-mailman (input) for mailman id 538233;
 Tue, 23 May 2023 06:35:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1Lby-0000kG-KM
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 06:35:10 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe16::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f68f9568-f933-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 08:35:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6917.eurprd04.prod.outlook.com (2603:10a6:20b:109::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 06:35:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 06:35:07 +0000
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
X-Inumbo-ID: f68f9568-f933-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYx/c4t7pPeKchveUb5vDidI82L+Z/q82Ve2abZ08Aupg0PVRhruttBIxUeo8RK84qE7Dru+f0Y8T7C2qGe/+8+eUYMVZ7mDm9SBnM33E1sTGcS+TwJVDAXKBZcPfWOZCEpRECXno2aKOKMHZNYycn1A6M0OXL/8EQhtHDjyU0Xq9IkGufv3j61GRoO6qDlWyj1EZOhXQWDkllzj/WV/3MdX61GNSySre3pSZrEO8VqWG6wEo2kyVpzJ6lzsD5uHcUlz/nBd5Ldcz4iHI4OwqymS6jcebyhj/zNQ/gNE1qSmBT+jImU3QJ+lX6AnS7dUOs04NohwLB3aafMG78e7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFGqUfDf30qXhHqeq7tRuoNndDE9UeRpAYnp+oLLIKY=;
 b=b73yHWCxxgjzJ6UbvP/riEr/d9GZKhHAFLyzvOKWZiLC4//00RBHNUCox+RlADLXlKxv82Y5conRXDGAUyfOamlS9lQ/VkIkteQf58e4pXnw3+uN0FfjoUAF5rlUGUAeO4ZKMKeeCefj4KefURyWSz+W4ln7mTJ5pyypBDLjfZgxW6km9QG53fvX6niLg2KNfcyX9YDUjefJqGXbMDocwesiDoJWsNJNQR3YYbOoWQwrJa1rY8w/RlF1hbGnQlWbOrOtOqTLWCGD+5k/Ls/2LScadT8e5bkO2uygWoG/fxcpMR2+aEL/0WTRsXsNmiEsk67mHqwF+ZJun/WJp0m6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFGqUfDf30qXhHqeq7tRuoNndDE9UeRpAYnp+oLLIKY=;
 b=Ndqf5zc0y1Dvdn16Hlou3LzIkOvd22ALP1qs+0QCfd0orWqkg0DzYYpyMbd13PR3Vmm2UcGCwXWrcrRnj1yn/gQTd0VRLdQZSDxRYA2R2NYIkEa/ZhZS125FlFrNMr1qpQS/4lr3X3neaStS9kT2RrfGvLJJs26K7PaXkZdLtKJbmrvVW0OishVHRjIp2SMUn5sjZJvZSq7GMTIFENtW+Z2Z58NBEWuSOHu5K6iB7jQDIv9C5WXBFXpCxzl6yvaLSeA0AwTDUxJSObj1TntBTKTXQuNgS/9w1pm3N9sOZcHlV59rO7XlcEKb00b0NLa9BUDF/MOIukwh1jUXyflbMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc1aca4e-c333-957c-d0e2-bbb4edc7af72@suse.com>
Date: Tue, 23 May 2023 08:35:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 00/10] x86: support AVX512-FP16
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
 <d6aa8dee-49e2-1493-adb5-2adb474af067@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d6aa8dee-49e2-1493-adb5-2adb474af067@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b7fab0a-a5aa-45ca-5c65-08db5b57d99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kvvpj4Gwf6aRaURS75Q/Z2iZAeoXJLEpA0n98Tjnjqh9V7RPLpRYnTW6H0Sgb6W9pFz1WMW4pL/MAX6OXTeqnqLEv9E4GOjXxKjgHi9y4/B1ArYSoIQlMhKv1M3isMX8RmTORrja5EsLEKoFYl7yd5r8+2CQbc9u0DKvF/z7juf9DLt3qaq9xhsgJzPlZNKcleB4Rf4e4N4extfT6Nh9VrE43tmOZcVOuxmH/DoWKqTBmpA00AWHU6G6BP6AOP92IY8CuXAM7Hr3VC0AFSNf58vOw+ft1C6R1XaHZ6XjCGtqEgU9a5BGRQ9wAIbzE/mbTbxKExcsmr4I61a3PATaByBM5zvrfJZ/xm31y18N0JKV6UPDNeRYk6UHlFLMkizecq8ulYvf3t345t2FIXuYaNmmXWKasjrZus+1QjfrsBnPWmF0dLbQQXb6TFO+0hRWiC1X6mBXRmPyDjxo4XZuEkA4IhpbKMzoW2CY/lBw12rQsP1xAddy/hXZgaXr58i651Wn/1QL48yknxKqlgyHlBbs+/tgFQp2jTw7N4959Z7HBQdOSsEicEns2n0jtX3+kfxg+CZdLdFmNiCalokhA92lRjg29cqa/23LpD6dE6wflDwHSlaSt+M8/S6c8cXvjrKGkIl1/+wd6jm1N02rvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(396003)(346002)(366004)(376002)(136003)(451199021)(8676002)(8936002)(5660300002)(86362001)(31696002)(966005)(2906002)(53546011)(6512007)(6506007)(26005)(83380400001)(36756003)(2616005)(186003)(4326008)(66476007)(66556008)(66946007)(316002)(54906003)(110136005)(31686004)(38100700002)(478600001)(6486002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eThKVzlzcTB4SUNnZDdQUGVXWVdVbkVGWVE0VmdFdHN1Z015d1cwbXEzYmZH?=
 =?utf-8?B?RThZRjRJNGxqYVBCTWR4Q0tCUVM4ZHVNZXJJeGFXMFZzdjNUZ01kN29FdElq?=
 =?utf-8?B?dUJyaEVscDRnam9CQk5Hc3FzRkFuVldqTHN2bmQ4V2psRTljdmRPZFJVbWFP?=
 =?utf-8?B?ZGE2NGRNOXprYXROUVd4YnlTNmlnbCtZblYwQ1BxMlNCenVERkxweE9mT0sx?=
 =?utf-8?B?anhuVG1HTVc3a3Bxa0ViRVAvRTRtU1YvT09YRVZOTnFNZEpsMWtPblAxZ2J6?=
 =?utf-8?B?aDVScXF5cjRPdERyWWlFMEs2aGNVUGZMQUhPM0dhN0JESE9kQUtsUi9BdGxW?=
 =?utf-8?B?MDZHU0pTZG04K1pOY29WTHhGdUNaR1ZqTEpMMUZ0ZEZ6QUJNUktyVXBhS0ZW?=
 =?utf-8?B?VUo1VUhPeHFqUU90cEo3R1NoYk5QNTYvRFVZbTRwcUFoQVZBMkFGWE1HVGY5?=
 =?utf-8?B?Mm1qZ0l4Q1NFTWcvcTgzN2NpcFVRMjNoMVhWUDFGNDBlcmt2UEhvZXdOZ3FS?=
 =?utf-8?B?TWxtM0tjcFlYVVdQai9PU2V1aGt0aG1sYm5EcFJsNXBobHFOVG9naCtzVkxS?=
 =?utf-8?B?NzYwckVnQ2JwMUsrNTlURWZEUGtCU1lnejJxU3QzSG9LTGdCN21FVW5oZ2dz?=
 =?utf-8?B?d3pjVVlMaUFrTU5QY0l0TjhRMDB1Z21WeUQwL3Q1OU5KbTFsbnEzL09hQjcx?=
 =?utf-8?B?MHFUNnE3L0FMVnE3WXdFSElZdndiTFYwWVYwUGV2QUg5MW1Od1J5bWRPdHhy?=
 =?utf-8?B?ZVNiWUk1aG9OL1lrbndxTGtBbmFCU29MUUNLZmpTK3JpUWxlK05tVFVRcGpS?=
 =?utf-8?B?K1FKTXdmY1VFVW1CSlkyZ1BMNTZqWUVxczliQ245d1J5d044dk1IWmJJQ1ZT?=
 =?utf-8?B?VnFKbDg3REZkak5MNVJXdEROcFgzSEk2dXFyMlo3SmNwQnFhYUpWcjJHR2tV?=
 =?utf-8?B?RGNWalJLbE9US2pPdSswS2xDZEtwSzlxSHBWYWQ5TU9EdnBPR252VU1IVTVs?=
 =?utf-8?B?a0p3eUdHS0ZlSlFrSmVVMnFUdlZWVjh3VVVselNWNVhMUFpEZDNBaHZ1NENI?=
 =?utf-8?B?M1BsUllSU3NUNC8zMnNrK3VaWER1VU9oZ1R4MFFveXI5dWVPcEVmOTJsRmxz?=
 =?utf-8?B?RGJ1dGcvMHNaTUtTK3JWRmhNUzljWHFNckhnYklIbWhyRHBkYmRiV0hSUFJC?=
 =?utf-8?B?TytLQTVVRmVDSndxaXE5Y2pnMHdEVDBiYityd0ZaeVNid20vYm1YTlVEQlQr?=
 =?utf-8?B?Nld3MXZpMnVmZkhOSzJuQllCNjZDWGhHNXBWWXAyZlAwWjU1MFgyeittS3dX?=
 =?utf-8?B?Y1FYeHdLSkdMc2FoY1A0RXdLZTZocUtYd0U0dHFUUGFDRVJZUGx6Um5YS09W?=
 =?utf-8?B?NHFCVUlhMFhGb0xaSEozbU1PekdHSHhGVkZGM1RUdGtGQnFRbmd5dHd6ekla?=
 =?utf-8?B?dzFwUDlEL2ZCZVRkUUVSRUlWcEJFTXpGWDByays5dDd1KzIrRGtOSWNwbk1E?=
 =?utf-8?B?OFprRm5pTVliR0dXMWY3NnV0eEtHenR6VHp5cktRZHNib1E2NUZpck1vWGJF?=
 =?utf-8?B?TE5scVp4dE5CNURjMEJJWllueFBmdkxRVEg3TTk4ellsVUYvdE5hNzd6YnZX?=
 =?utf-8?B?ZkRrb2xwaUVzN21pTXJWRGc5OExPL081UnJ6UVAzRzkwY2dmSERtdnl0czBR?=
 =?utf-8?B?NnJ0RG95NFFyVXJCb0oyY0s5aUdGbzMrSk1NM25WOGo4SDJ6YndJVDRUWGpP?=
 =?utf-8?B?KzAwQXA5NGczWnBsRGV4d0FPMGtyNXA5cHNyN1VtUFRySjNlbE1HM1RjcUJ1?=
 =?utf-8?B?L3lSeUJvZE93eXlYUWdONXFFbWE2bmhzNFU5V28vM3h6TDN4OVJWT01nWXY5?=
 =?utf-8?B?N1BlQ2dNb25yZ3hoQXZtaTcrVDBGNTlPSUlsZWJGQjl5VHdtR2YyUkltRU5i?=
 =?utf-8?B?NXhTbmVuM2l1RjRuU3R5c05qUXZlbGJhV3dEZWdXeW84OGM2dDkybGp0UkJR?=
 =?utf-8?B?RmpQVzVDZ2tySlAyY09UWHlMZ1FtNWc3MENMS2Z2Vm5Jand6RlNYVERTcGQ5?=
 =?utf-8?B?NTRza0tzQWduelVFaXU5cHhRTi9jRExON0g3WVJCdXVRemtiUW9QZ2k0SEJh?=
 =?utf-8?Q?gp8XNoXa3KrWS0739AQc6eZCt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7fab0a-a5aa-45ca-5c65-08db5b57d99f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 06:35:07.6504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAQ7uN90Iayao/2Yn3UYHBN1BDLRD00m8V+EBdOf60Au/l8elZAu2oiva8GucPjtaL3FqhmV2jYo+gRIqrPt9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6917

On 22.05.2023 18:25, Andrew Cooper wrote:
> On 03/04/2023 3:56 pm, Jan Beulich wrote:
>> While I (quite obviously) don't have any suitable hardware, Intel's
>> SDE allows testing the implementation. And since there's no new
>> state (registers) associated with this ISA extension, this should
>> suffice for integration.
> 
> I've given this a spin on a Sapphire Rapids system.
> 
> Relevant (AFAICT) bits of the log:
> 
> Testing vfpclasspsz $0x46,64(%edx),%k2...okay
> Testing vfpclassphz $0x46,128(%ecx),%k3...okay
> ...
> Testing avx512_fp16/all disp8 handling...okay
> Testing avx512_fp16/128 disp8 handling...okay
> ...
> Testing AVX512_FP16 f16 scal native execution...okay
> Testing AVX512_FP16 f16 scal 64-bit code sequence...okay
> Testing AVX512_FP16 f16 scal 32-bit code sequence...okay
> Testing AVX512_FP16 f16x32 native execution...okay
> Testing AVX512_FP16 f16x32 64-bit code sequence...okay
> Testing AVX512_FP16 f16x32 32-bit code sequence...okay
> Testing AVX512_FP16+VL f16x8 native execution...okay
> Testing AVX512_FP16+VL f16x8 64-bit code sequence...okay
> Testing AVX512_FP16+VL f16x8 32-bit code sequence...okay
> Testing AVX512_FP16+VL f16x16 native execution...okay
> Testing AVX512_FP16+VL f16x16 64-bit code sequence...okay
> Testing AVX512_FP16+VL f16x16 32-bit code sequence...okay
> 
> and it exits zero, so everything seems fine.
> 
> 
> One thing however, this series ups the minimum GCC version required to
> build the emulator at all:
> 
> make: Entering directory '/local/xen.git/tools/tests/x86_emulator'
> gcc: error: unrecognized command-line option ‘-mavx512fp16’; did you
> mean ‘-mavx512bf16’?
> Makefile:121: Test harness not built, use newer compiler than "gcc"
> (version 10) and an "{evex}" capable assembler
> 
> and I'm not sure we want to do this.  When upping the version of GCC but
> leaving binutils as-was does lead to a build of the harness without
> AVX512-FP16 active, which is the preferred behaviour here.

Well, this series on its own does, but I did notice the issue already.
Hence "x86emul: rework compiler probing in the test harness" [1].

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2023-03/msg00123.html

