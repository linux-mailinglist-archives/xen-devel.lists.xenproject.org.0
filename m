Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B9457451A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 08:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367076.598136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBsOL-00071p-9Z; Thu, 14 Jul 2022 06:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367076.598136; Thu, 14 Jul 2022 06:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBsOL-0006zK-6E; Thu, 14 Jul 2022 06:32:05 +0000
Received: by outflank-mailman (input) for mailman id 367076;
 Thu, 14 Jul 2022 06:32:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBsOJ-0006zE-Bs
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 06:32:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaf1f4ca-033e-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 08:32:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8886.eurprd04.prod.outlook.com (2603:10a6:10:2e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Thu, 14 Jul
 2022 06:31:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 06:31:59 +0000
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
X-Inumbo-ID: aaf1f4ca-033e-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4sRnHNuoMHgMqttmVzMxze2W1daVa5z54z64qPsf5fydd9xkhEsBFUXxQRF+TuSMIJwziBOMHCF6peGJRRrJb1nCgzlfx/zjTIFZV+qEkmaJkYjjIK5CAFIXh9RjRhuEDn4/Y8OrHhzpKUOmTZkvG6kEAy1B3XmXVjwgwvrzj3WnpxO8DoP+3EiXKZhXm8XaybrpGsWf2oqDF/HdIPKx5TgNSgsTGQkaDNkay+zx7oZJTBZ4PME1HbCop4+BP4aG1BgcdPM9SvWOBKvS6aZH45xVUD0Rav1U/wU2/8pcTCq2k9OZpE98vIdoHLD+QyzbZSfJZESVP0JnLaq1ZBwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yadeePzeuVz1Fz3VAUuGl8yJrydeLyLWVLuCPKiQrMY=;
 b=XFmcAmn3wVYLPZKEJX5bKypINumS2RxMmUvwpopcPYSeN7I2Kjv6K1c1OoWA0joXaXup4Dx872zMSFmbE4+fnsCxZTV2+AHwdh4o1Qc0e24/Tj2ID7Ynflnxqjzeb6J0PeeJUYeIyf4s4ymKzb6zrQ1kLvMAa/HjnAADUZJqeFNZUXzCXfe1H3q3V9oDhjFTKn3syM8Zv7n/8U+34Y4dQmnh73Yfjo1TrD35z0zfTv8PxCtu7+uobKJsloc+ev1k/K0AHg27q7a4w1igXc19CSoJ3u6Amr13HrafDNgS6Rp9F8XtyzflrsKyLNhvmNl9kEFMt+ptYf4n9DpClF2isA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yadeePzeuVz1Fz3VAUuGl8yJrydeLyLWVLuCPKiQrMY=;
 b=yf+LcPRNxdE5hJNqcPj8iOD1LTvHJOSMlYrYkX9oJXJIVxg8lA9BvJqnD8VPqLsKs738nSCqaKL/NQgE7oWIDgoD8KRuiOUuU9ynofP9eJTTujtFeNcZiaD+on00iO3Tp1CF95xt9dtNYJs6UOA46aXfgtfKqMhf6siCYaqKbWiXbA9+C+zjnKuQO9+0uOYTkhVJkfLkViQeqi+UXLdhUGpUleHhF9LJXouhKJkTxBNYdD0H2/0i71Tx/6hCVnovFcI8LPOL0hOi1OCssFzVPMgEBnFmoe9ebCV5ppvC/cF+CkNwBXY6xK3eziNcreuefLhGigwLp4xAsn10tesQGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac1e9f11-de63-0ac3-ec88-8eff774254ff@suse.com>
Date: Thu, 14 Jul 2022 08:31:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [xen-4.16-testing test] 171608: regressions - FAIL
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <osstest-171608-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-171608-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0068.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::45) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1f225ef-2c23-453e-290e-08da65628e53
X-MS-TrafficTypeDiagnostic: DU2PR04MB8886:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JyRTTbi9CInRTXD4wwncbCTwA7aEHzR0Vu4lPcRrUJgKjwRgHE2fG7ncjwQC0MHto43JcX1H09OOtiLQjcqIbYEaOW5ElCS2YvOgL5BPJ2vuFUhcvnxPys7LO4iLmi0b0jdJYSr/Pm8QARRfNJy9zUlHUliixHi4jn0ZW5AbZ2JGPPZ0mxLgv2hp2DBgbc4rn/LMsa9xLareNf7ljyE5rfmBvVigJPtx0hg6oSpm7k5Tn7PRC8ye9c919br8EiVHtaRjHu+wdDjgfT50CmCjZHbe1JEuI5TDpxRm6T7BdGaS5POdJ53qWWC+pwhNkbU6nMVruE72q1g5fDgZbkx5hCTcIKmfhH69z4qjDAuvzY6bkCtuUsvvIh5/UF8R7GY7wx71EfFMYCnz/9pWytRqZ84VDOQ0xQLG6LBQMOQmLSvh8Ni/71O9g/YN9T9r7kS2aDZRvHMiT8PPV7z9GWbFKCbvOoauDD30IOugCvbbnp0xg0zW5m/URofMOkvM66yPmMWPj+qQspat2Vh2/dNPrLJS+d0aEa5U6GHSEq5jsJYUt/I+0ADBprPea05kRkjBgN4RRTlcmT2ya9YdssA7CvHRTOYOMfyudcdpnquoghqQ55IY3QEHIcK7aDpy4QU+mYWyQGrtQD8SqHWbTNFhRPqcgVe37r5GhyrS45/qLode+5644OEB01urdTP4Xi9nftfvI1AVml/F8Ln2d9OUsOMerc//75C0fNqdqhIaJHbzdFFQrvVVPiAwWUXH2b+48qr+mGX3yDio2+9rm52vL8rMmtYvhk3JZAlQTcQbKaA5djYcCjo0JoE3fKSy1AfUgdJ0rnepMbcvm+I1QExxg3cBtDZNK6eeRrVallMdFHD653EbnMY5LOBga12Ah6el
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(346002)(396003)(366004)(376002)(186003)(36756003)(38100700002)(66556008)(4326008)(316002)(31686004)(5660300002)(83380400001)(66946007)(966005)(31696002)(2906002)(6916009)(6506007)(66476007)(6512007)(478600001)(41300700001)(8936002)(6486002)(8676002)(2616005)(26005)(4744005)(86362001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVlaQStJeDJjWlRSZGtnc2lCYzJ4Sjk4dmZHYWJLYk9mWlJueERhU0EvZWIx?=
 =?utf-8?B?UkptZ0JDREpIa21wUlhiRzBUZEJKdGtoTFZhRjdrazg1cW0ySWRMS3c5OUho?=
 =?utf-8?B?Zkx6bGoxSHFLSDJHd3lNc0tZZjd3dEU2OWV2VEVkS1g5K1hXY0JhWEwzbWQz?=
 =?utf-8?B?dnM1Rng2MUdZenlBUW0rc1RUd3VtaW1Fd0tBRG5Pd3AxUFhhZU5LYU9MLzEy?=
 =?utf-8?B?L3lvK0ZCQjA3eS9PREF0OFJwNVpXWVBsZlpnaU1CNUpzcmZpYTVrclNBK1JS?=
 =?utf-8?B?TXBKc3R6eWFQczkrZUVReHltalNTNHovZzkwNVVCdEYxeXBuUW5ZYTAwdnBm?=
 =?utf-8?B?dkpLWFFYclhWR0tTcVp6Q050MkM3RjFaTi90WGlTSW5paTJCNTFHbGFhVXhn?=
 =?utf-8?B?cktwS1lBTTM1d2tVcmM1cGhQeEtWMzBGVW14dmdVaXJaSVoyVTQwcWJ3QjNL?=
 =?utf-8?B?SFhXcUg0bjlTcUhPSmljVVg2akVYWVBHUldRVWUrZXZ0Sm5nMkxQbEY2V2Fj?=
 =?utf-8?B?dTZJNlRLMThFWERJWkxRRUxmNUFSUFRUa1NnY0lYdUpQeTZRT1JzZU84ZkNO?=
 =?utf-8?B?MEdUWlcvakw5U1NsY2VLMzgrM1p6NDRYNytIbWxiNGlpVzJHcHl1V2o0dG53?=
 =?utf-8?B?YTB1UDJhTE9aTy9tTTRXY0lFSnVtVXdQaXRwek5waFNzQ3gyczg2KzFYbm9U?=
 =?utf-8?B?YUx3TXZob05id29pajA3OUVEM1A1MHZQeUs5N3VFQ0s5elJBUEV1RlFESVBE?=
 =?utf-8?B?QnZnL3ZadEhRcUdqRENPSDUvY0tKeFV3QllZZzhiNWF1Nm40UjgvWDZ1UFpq?=
 =?utf-8?B?SVFEZEZtZEVDTmp5Wk9FUWtWM2pKRjl3WG9mUE1iMUg2eVRZNGFZU2VqR1Ar?=
 =?utf-8?B?YktJbTc0RENkQnk4ZUs3dk4wcE9CZjQ4cVlkaVJDOTNHNW8zaU91VDhJdDBE?=
 =?utf-8?B?Y3duTEVUNjBwRlphcDJqNDQyOXljUUFPY1lKc1o4VmltK0QrYUxpRG53WXha?=
 =?utf-8?B?SHp6K2N6Y3ZSOFdIWm0wc1ZHZktqQUVueXQ4aEhjMGFqMlpVdlRIZnFmRkpv?=
 =?utf-8?B?eTVhZGNFalRrZW9MNHFCT2NYdjRyVktEMW0zM2dVL051aUV6R2xZYSthWlJk?=
 =?utf-8?B?aGlOdlhPS3VPdkUvc1c4bGtGRXh5RzNyMmpyWm9mR04wNThBL2V0ak5od1V4?=
 =?utf-8?B?UFppek9iM2hDQTNNWUdiSDVRN3RBM04yaGxaWWxsVmFJMGsvS2pHNVVISHJM?=
 =?utf-8?B?RTJsVHZqS2d6TnhqazVxZVh2S2tjVFRPeUkrd0NrNnNjTXY0eGpFNEErL1ZZ?=
 =?utf-8?B?czlWMHE5UzE1UXhPM2pFZjlmN0tyOUtNZ2dzcmtYVXdBTXl5dXZSTllrc09L?=
 =?utf-8?B?NHZzais3R3pZV3VGRXdQSU42aTdpUFB0TkFxNGd4b3NlbnBVVDhUZDlNZ1Ar?=
 =?utf-8?B?VEJSZktiWkxBS3RFQ2pTVmxQQ25lMXZ0cWMveEh6NXp5WVo3clZLK09YWDB0?=
 =?utf-8?B?R1JVeU93WithV290eno0cmkwcUR1dzZObmhPVXp1T3RyOGVCMktwTU1YN3pW?=
 =?utf-8?B?VklJSWdDWkFiV3NaQlRuc2NYUC9WVVc1OUVwcTBhU3p2QjJJdlR3ZXBsQ3JR?=
 =?utf-8?B?L1dQT2d1dEpBQzRxd3RoakpEVkZvRHJtc01UeFltZGJETnFHY2x5RzJZbmVi?=
 =?utf-8?B?OW55Q05IT1I5Q2hCakEwYTBUa0VVU2V2ZXcrZlk3L3VZb0VYUkEwc2VKaEJV?=
 =?utf-8?B?cHgzT3pSYmI0MEIvaUJzNW0vNWF1SmIrdlZxTElNTG5KcjhlV2V5QUltSTVO?=
 =?utf-8?B?dHVvcjZmMVc1eDdldElsMllCRStGNEg2ZXhtd2ZKdnZRR2pweVFlVkZxcGJU?=
 =?utf-8?B?SDRmaytYRXFMTEorRGdKVU1HL3ZMY3JodnhtbXFSckZDUkdDc25McmZsdXU0?=
 =?utf-8?B?Q1JBNWw2RG5ORy9wVnVtT2xtYjVoZ0lSV1dNOWc0NW9sNzNCMm9JcG9GRzRj?=
 =?utf-8?B?K2EwZnpTK2hUdzJtd1Z1QWdSYlc4RGRmMVJibnZKM3NiM2VRWnF5M2pNcWlr?=
 =?utf-8?B?eWNZVHR0SldjdS9oTzRseno0Nk9xM2ZvZkpwZHlsN3U3bml4VWpxamdqcitr?=
 =?utf-8?Q?Ml97iOXixnjZQ7Xrp1VMHjS30?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f225ef-2c23-453e-290e-08da65628e53
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 06:31:59.6611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+qQuIePEVANvya6emE1xmmeTUrjNYs6pXYxyOgsmyif+5r06e4lCI8pxk2XFDRmsPHLh0EKYxFqGgn0ZInmqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8886

On 13.07.2022 19:53, osstest service owner wrote:
> flight 171608 xen-4.16-testing real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/171608/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-arm64                   6 xen-build                fail REGR. vs. 171595

The (apparently random) compiler issue again, as it looks:

cc: internal compiler error: Segmentation fault signal terminated program cc1
Please submit a full bug report,
with preprocessed source if appropriate.
See <file:///usr/share/doc/gcc-8/README.Bugs> for instructions.
[1104/2442] Compiling C object libcommon.fa.p/hw_audio_soundhw.c.o
[1105/2442] Compiling C object libcommon.fa.p/hw_display_virtio-gpu-pci.c.o
[1106/2442] Compiling C object libcommon.fa.p/hw_display_cirrus_vga_isa.c.o
ninja: build stopped: subcommand failed.
make: *** [Makefile:156: run-ninja] Error 1

Jan

