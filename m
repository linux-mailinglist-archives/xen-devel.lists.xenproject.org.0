Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27975753317
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 09:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563517.880738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKD7x-0004Sx-2o; Fri, 14 Jul 2023 07:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563517.880738; Fri, 14 Jul 2023 07:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKD7w-0004Qa-Vo; Fri, 14 Jul 2023 07:22:08 +0000
Received: by outflank-mailman (input) for mailman id 563517;
 Fri, 14 Jul 2023 07:22:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZ6j=DA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qKD7v-0004QU-LO
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 07:22:07 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 211c4442-2217-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 09:22:03 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB8972.eurprd04.prod.outlook.com (2603:10a6:20b:40b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 14 Jul
 2023 07:22:01 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Fri, 14 Jul 2023
 07:22:01 +0000
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
X-Inumbo-ID: 211c4442-2217-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jsm3uXKOAQeZ/mqNHhUvjawkULcyKQ7SVimvsSj/QhO0OvzHv1m9+oXZzsp9euhi7a2+WCwZ/3nlsROFy5G0VcxaGH0v6rfv25dv0TXOI/iagJiUuUglbfWWgjS4432LRe2/e+p8TKXBjSZngz9DvJAPcpYLCtila0l2av2kz2BDtOVn9SNweNs2s5Mj6XnxL74/G7/ABioHduRUJRAZiBqPBTBkCwhUvQsAGFLsBQi7+PzQRzol/EKOehbySrL9eukaAIkOLIeD2BoI5ACQ2Xoky95Tskh4V88Gwx35tm4ax3fjK1E1X1+InfxzqDCFZR44nD1ZDkYtr0HHxc9YSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eO/dBxYW8Qr6n5VUF1iS40XT6a/pvQu6awmEewCYBRE=;
 b=OqF6r6dwXZ28dpljs4WdqHLou0PQBpcf+7xbjkT4agu1hTEEBkcjdPZNeT3pu0fg0Q5++tI1DTr3XI8ULFLuHXidGZ3BBQyXDL8NNsFM1lUd8d9gRYG2hLyXiML1cXDqgV4U+icqFuVVLIRmmqhknPyt2cNjHGiKyXyWmym2qv4akZFxzLmeI0SXrRvizm7EBklZSNeqT5W526i5NcSHNPJ1Muvsr86+RsCM75mer744J6r0MI5URX9Anh5nNF6XcqeUoFdTkn3oCO1/HigSebmVJO1A8s4sNrnFh/ZOiIJuNzb+0eG4v5zVx04RLzzBR3WDLdDliSYU3q982hQ6Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO/dBxYW8Qr6n5VUF1iS40XT6a/pvQu6awmEewCYBRE=;
 b=xtLIQGshtkBMkwCBHP9trRlI1qipXUsz/bl90qNfrtplHwtrExpNVSsX1UXq6qH3x8XRW3iKJW/4Mn0WJKK632ybvT+4eIv1njjaif2R3LsX9FCtL1vJEVTxznJYf2I0qZtj9v+O52Hr7/dur6Ouh1ZaXF3Qo2Tkvh/GJcpX5+cO5vDakOHSynK45qhPD0bTALfOgt84ys2I4KiidNItFksqaMees355Pz6qa+AfWEgOZMuT5Jlt6OShlPR26ZHlrp2j8rMIv98WkCb+wheIYaSqBFHJxifhQUEbYzV4YxnTvfiJgTkkNToSPwW1wBjtkxdIMDcl33ndOkIIQXQhKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3db9387-8139-e7f8-d250-9933e288f9fc@suse.com>
Date: Fri, 14 Jul 2023 09:21:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] docs/xen-tscmode: remove mention of numeric tsc_mode=
 values
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <a8223a339a0b8ff3c0d04fb4ee2913c7558cc131.1689294071.git.ehem+xen@m5p.com>
 <ZLCj62XMBbspMWbY@mail-itl> <ZLDErKk8ziBuh1ZJ@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZLDErKk8ziBuh1ZJ@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::13) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: d92a4b12-ca64-4e3a-d529-08db843b041a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2aqrjeaYPVINsGA+pQ/q77p5CFFZ0BYqQ0TIph1tKM2FZKJ1e9zI5J90OSs0uSbjL1WTrHRp3FFxwhyrVI8V/FzMO44R68BgbIzy0uYzeSXNJfXIFOWLJUp10UzOf/epBFzmYwlyOsBdjk/mHID7Af+V/ZIG8+bvA613By2nfiC7XaencpT4A9SjhVPCZ0LSGRpbwuz58/irlHQ49bAgw3jW+cqQZEWAWZ9F0ptz2XawShmjwLJiUD8RHO0/NrPqrEYvHn5fxPQ+tR/qXEXXfKiVjVuXp4934UZFt2StsXHLbOctjaTCPrcCVxwof9QguSzs6DTldVX8xMnD40q6x3zLup1nnHtchFUKtjg68yb4tk/Me38ZstPaXBZ8ywr8VPgGPuDPukRlqKP2bG4bPrsfRd8OoGH1734Np7Bf1AlZSEBYg0URRffMtZHpcjTpcKOtZHcGSgT7zb/OlxUQF/zSvTC/xcYfmqTqWUbQEVVYh9mhs5WTB5nbOWyQl9/scaViALU7+7IGzKsJrHWUhzYfRjXSaFMscULpZkaG0gAngG69rKXs0cb3eBsWIhWE8kY5FItAPqBYUKHYqV0mZHSKXBs892fm5ql7rwsFIJnhFc1UZccDqVi7ewJYlxBZWnV0tirGpOeD+DnrRMBhiQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(346002)(366004)(376002)(451199021)(53546011)(478600001)(2616005)(66476007)(66946007)(38100700002)(66556008)(4326008)(6486002)(54906003)(6506007)(36756003)(26005)(6512007)(186003)(86362001)(41300700001)(8936002)(8676002)(31696002)(5660300002)(31686004)(316002)(2906002)(83380400001)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnNJeEFyaVRSQkpkRkhhL2pxYUJtUHdPazREMVVrdW9malVvejNEK2QrK2w2?=
 =?utf-8?B?aFNyNlZSeUZnN01aY1ZmQk1SUlRvdTlUTUlmUmU0Z3RKUVp3ZnlZTkowelpG?=
 =?utf-8?B?MWJDRGluMjBpZ3lPWnN0bnRhNEg1SFBtcG1hSksxNlcvd3JEbUpISHFsSFJG?=
 =?utf-8?B?Z0h6ak9FWGp4cFhwUlBZZTlBU08wTERMaWlCa1ZnTmZXbjluVHdxT3dsTUhl?=
 =?utf-8?B?YnZqbEdjcm5DaGRhVW5jMm9iOWtXMFZjS2RIUklReWgvN3dXSTVWUUlkV1pE?=
 =?utf-8?B?dUxXNVZ2VTJaVmlhcWZxSHBUbmF4VW4vWkNkNzRxU2ZBMGJoTmpTODhNdWg5?=
 =?utf-8?B?M0pHNklEa2ErdkI1dUxXN3dJeUM1ZUVOUXg3RFBKU29PUUd4elFwMVJUQTNq?=
 =?utf-8?B?Nkx4S2k1OGx3dW92Z0RHek1EaVM0YmVTUFB4WjJRaDZQUzZEcHU1VmZiQzZI?=
 =?utf-8?B?OGdhZGFwMjBhckViZXJxQzI2LzRDN3ZLWU03UXBiaTVhaFVwcG1PQTJhZEpm?=
 =?utf-8?B?OVBnY3lhZGV3cXhMWFdiZ3FiNEpjRVMrZDM2VlhWTC93UVZRdGdONkZDQmdv?=
 =?utf-8?B?b3JJd0FQam14WExqTkc0eGV5QzhKZHNjcGhBN1RyUDdBcVhTKzlrYWM0aWV5?=
 =?utf-8?B?ODBrNzdNdlFFTXE4SUttdWVZNk9JUWxJMVF1VWwyNmZ4WEdzMk1mUEdaUTlL?=
 =?utf-8?B?UDBvNkRBWTU5R2FqZVN3T2kvUzJpcFVmbmlGVHp5eTlONEI4cFFsZnMzYzU3?=
 =?utf-8?B?KzNnM1pzL3crUzQyUGkzUFJ1c3FJb0htb0NxN3RZOUdNWG03N0g5KzNIWDVm?=
 =?utf-8?B?aGhkR3lJYTlMbnpTZHVRTnZNemk4YXFEUktNYmNoOHhCd3FLZ3JKOTZxR0Ev?=
 =?utf-8?B?OHhnOGVQdkdLWlhrUnpzUUhzSjhwRDlPN2M1LzZDREVMZnFaRDZRRGpFbkdX?=
 =?utf-8?B?NzZKcG5aVTZFL04xZ3hpSHpadnAwWDhHVG1KSi9wM28ydHovdk90d0xxNyth?=
 =?utf-8?B?VHFZTkIzaGJvWTljYU9ueFBmNXZhZzQrZUlILytqaXBPTDUweHlSVERueGtO?=
 =?utf-8?B?Y0RncGxadFQvZXU0Sm0zemR6SlN1Z09zVVV3WDBaZk4zeUlKelRYdnh5ckhB?=
 =?utf-8?B?QnVJWjVXdFl6VUkyUENwV2RsVEdRMG1rcTFiZFNGcDFUbGtpOXhwaGZJSXJn?=
 =?utf-8?B?bXA2RVN0bnVQbGoxcmtFSEFJa1U1Q0g1SHllYnJ3SFpjZ09CYU1PVkVIYUhs?=
 =?utf-8?B?VENVbkIzMUtpdVdteDZ0SWxXbS9XeDcyQjF4WTN0WWpZWnJJU0JJaWJLdVdJ?=
 =?utf-8?B?Ry9Qc243dG53Um9GTnk2N0FqME9UMVk5dmp3WUcyZmpsbTV5bjZHTGovT0pM?=
 =?utf-8?B?endyajFCMWYvV0pSSzZaVndrbm1nVytBdm05aHZScTgzUmRleU5naGRZbHVq?=
 =?utf-8?B?RkI3Q3VkTnNtL0hnbktOMjVnSWNpQ3Nwb2NoaUZQNTlIWWtkb0thMzVaS2tu?=
 =?utf-8?B?dWNVdUwzYTlDK2tCSUlEUmhhd1RMREY3NHNLSUxnTzM2TnUwRGFOVkJ0RFBo?=
 =?utf-8?B?ZlVyOG12elJQMzR6YnpxOWIycWtkaUtxOHJxN0FMMkVralAyQTh5WFBUb2xL?=
 =?utf-8?B?N0V5bHVkYlpQQ1d6bnkvUlVjTGtsQWg0UEJtZlRnVTc2M3MxUUtZUGtXYktv?=
 =?utf-8?B?UTcxSFZKVnREd3k1cFVJTTIrUUVPNkE1KzNQeTNKSGR3SzZFWEU2S3hPTUJJ?=
 =?utf-8?B?R1Y4bUV1RWNUQzlkYmh4NXFVdWQ1SjhPMXdyeWZkVXVMbEozQXBhZ0pCNE9K?=
 =?utf-8?B?WlpnSjdKdjBERjB1Rmk1RFVrN2pGaVRhTW5nbi9uYk80aUZjQ1VHNzBiQ0t0?=
 =?utf-8?B?akRTUFdqUWxKSjA3YnVORmliaDBSVk9leWhWYXdmTTVkY1hxc1ZWUyszdXpm?=
 =?utf-8?B?TUp4cFUrREE5OHZiM3pJTDFQRU0ydUcyR2NmWGZYMGUxTWlINThTb2JIck54?=
 =?utf-8?B?TFphNlIzVHVDQkhZckpCT2oyVEt6bTJqT2ZwTGZzdGVSd3ZScVlPcHB0TkUy?=
 =?utf-8?B?RGRUNjJ5WFRaditlenl0V1dESVBRNFR5TXJKbHNKeGtMeFp5enVoWXQ4c1p5?=
 =?utf-8?Q?gizQv0i2XAVIke661UhsmUkWF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92a4b12-ca64-4e3a-d529-08db843b041a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 07:22:01.0785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EknzJE2e3O90iWWPTny974fhE12RaiLNV+W0zo8ckR7ipeYB+1YUPTnZGQIPR381+hg+Y9HZsP+yQLgS9u8n5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8972

On 14.07.2023 05:44, Elliott Mitchell wrote:
> On Fri, Jul 14, 2023 at 03:24:59AM +0200, Marek Marczykowski-Górecki wrote:
>> On Thu, Jul 13, 2023 at 05:16:40PM -0700, Elliott Mitchell wrote:
>>> The better to encourage moving to setting via string mode names.
>>
>> The numeric values needs to remain documented, otherwise interpreting
>> pre-existing configs (that may use them) will be tricky.
> 
> Problem is the way it is documented tends to encourage continued use of
> the numeric values (notice how reports irt Zen 4 mention "tsc_mode=1").
> 
> `parse_config_data()` suggests the appropriate string value, so nominally
> that should take care of older configurations.  If "xen-tscmode" really
> needs to continue mentioning the numeric value, it should be in
> parentheses and with "old value" to suggest moving away from that.

I'm not sure about "old" (we can't change the values without breaking
backwards compatibility), but the numeric values will want mentioning
alongside their spelled out names.

As to mode 0 - that's the default mode, engaging emulation as
necessary. See xen/include/public/arch-x86/cpuid.h

Jan

