Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E8F715BDA
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 12:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541073.843413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3weX-0004Ky-KP; Tue, 30 May 2023 10:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541073.843413; Tue, 30 May 2023 10:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3weX-0004IY-HF; Tue, 30 May 2023 10:32:33 +0000
Received: by outflank-mailman (input) for mailman id 541073;
 Tue, 30 May 2023 10:32:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3weW-0004IS-HV
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 10:32:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7d00::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47a310ba-fed5-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 12:32:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 10:32:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 10:32:27 +0000
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
X-Inumbo-ID: 47a310ba-fed5-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9i9US0zK9xH5w2cnI7k0L738tvs9uH0q+UnxtieeSvwHlPZBsrxMwWEv96/eGzDrwq+S6CQwnajiklBQLmDhM5X6eXEOjGmJ23DtEJGopyX4n0zz+0YnD9chqSmrxqpJymoe/nAZe7gDTKYdfPpjYFj1olUbBqFrbpb6LgJFwginMicNCHy4eL6SmRNmFF03u+CaCUSPH6kgQB+sV+Um2/8f8R04sq2TlRrauFKHcAwcBOBY1LCdUYN2KBIL3/pVP+f05jDo879NYzv2fMOrVexb4ittdVnQsR7EHPX+l3YE8g1ulTEBKERsIu+o6zM2aCHtLnniDeachVpf0ZcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndw49eniBQQNb30Vo4vgHdAVfOcrEHVcwDEyZm9FUFA=;
 b=VF680DZJ7fl79LqMr5QkgFPCyXS5v5oi44iRUeGVT6PjiEUMu0JFsQzAOvu4NZg6zia4pSRmIcmc3AzgnMkDPkQ2fuHxH0PuO2lWde74aqYeYE9W/hqgpnoMbkvjtBXjUeDkDA+WkIYEArXxty5seLJ/e2hS7Yq1jhtsbsvme1XTvpzyomC5FxTyGUbb491p1riMXLpRn9pfpULfpkTEqprxbhJt9cFxiy8ES6kiooKieG4MB1Cab2BuuzeOn9wKKHiJdarWMYMW1APECdEaLpLHYopHSmrVi4eE9iY9ST/vljTSzJZp7qQn2hYek0hRmLI1UOQPGrUDsJ1n/xgs0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndw49eniBQQNb30Vo4vgHdAVfOcrEHVcwDEyZm9FUFA=;
 b=N4ytH5Oisdp9Azqjv6HsP9CDDzn3IWqXeXeIYUs/aAlsru/AO7aDTQs+nuVi02gwf2rjZHrpA6PXuvivelIIeCpFY2bJR68uJ/JIwXecp/Ev+lO4QfbwOjQxxJyRgHn2cY4mlHwa4I+8plsk81xNQN/XCzMXPHLpGJ6ASmwJ67lmxJ6oG+T+OMXw++HDC9OHBG0JyoGrzIOOW2yk5N4GneS3g6osuBIyrXHQ2tt80Uwb2Qq9bP8Kqis0duxlJnSbbpIqlhYiAy4cKzrnL32PWbgbjLhMVWOck1fgaFQUCClYPJwKTIfiRCcTzNWZWjALRCkHI6f6GuvY0DVZSKv6lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62332bdc-696c-264b-47d7-2d9bcc6af734@suse.com>
Date: Tue, 30 May 2023 12:32:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] xen/misra: xen-analysis.py: Fix latent bug
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230519093019.2131896-1-luca.fancellu@arm.com>
 <20230519093019.2131896-3-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230519093019.2131896-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: 147a89b5-c7ad-402f-efd9-08db60f92a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+8RzI0y04fe+47aNWto5w7s3gBG2DNoOo4G8Ux0S9ZAfnSvDbQJavr4zT1nxhrlOSy/D1haJx65gtoIYdSkj4ChaRjzgoPVt0nyJ7ZNmT2cHomUX8A0pz9Fj8bTiU+VHyQ5bt1tcmAF9dzmBE7DonxIiMwUsga13mVrPY9otrVPfb89EJOWnXAy+Z0RMgNYkPvVoFQxCuH+k3QHvJsad7jE5RVkgTM/Lg+0XpyUyj2Uia6g96qxPd56c41cxkwBJvSXBfePjLCmPJqhPtgWp7xh1LHqzdfYfWbakoTeMA9GpNSnAotnmzX6OKdhflp1o3fUm+DbzGnlcmmb2HnqbsoyOZJdgWrUlSq44UuxsIIpHbm43Byr28/0mB44Tapzsa1NT+T4YjOliB78kCLtmAJzir2Jgno0+DfmAZp/BsnoWCPqt5FRp51GJQsOd+xTYRP7MDZMf7xRX+yOdg/FQ+XFALmUZ/ZTI7k3vBF85dSFr/K/IxYOq70pmuywOkmpQ5k55s3HjM1HjkqnZcd54rn1HdOctFNlxq8uZLL4cXQMbKrm0SSBcBjLVRI0u8fdvnWo2M5LArYk1mWBgWAZIhZFcq2EokcR/T7G+bx5auf/x0nK44k7pSF7E/0Hudc//AKchzD2H6jdSn4K7xYj8tA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(478600001)(54906003)(8936002)(8676002)(5660300002)(2906002)(36756003)(4744005)(86362001)(31696002)(66556008)(66946007)(6916009)(4326008)(66476007)(316002)(38100700002)(41300700001)(26005)(31686004)(186003)(53546011)(6506007)(6512007)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGFwME1lcTZSRWhUcElFZnFuSTZQdVh3VEVLYzBDWnVXZ2ZRZW5yNW5BWVhC?=
 =?utf-8?B?MlJPYzFyUFhPczNvLyt0UE1iVWJPdEYrbURYZXNZbFhTd3E4T2c4NHBlRjNO?=
 =?utf-8?B?SXc3Zmd1NVFZZU1aQTduUTM1N0N5QW9Vc1lvekxUUG9TWlpBeDlxK1RTUTZn?=
 =?utf-8?B?UFpEUFFRWU1KTyttSGxBL2xGK0NzQTdSbU5WNXI3MWNFM3IwZW1FeFNRVW5j?=
 =?utf-8?B?WU5NR0xaWUgvbzZ1U2xnbWZLTlUzSlhIVG5XZVFRZHI1eFBaNFRZTVpXZ1Bl?=
 =?utf-8?B?TkNMaG0wMUM1UGJEdEdNalFmdVB0MThqb29wc3o5YStZaTdab1B4dTZvKzVa?=
 =?utf-8?B?ZFNPZlBjQk8rUjYrZ01GR0h0blNobGxRSkgwODNRd3QvbXBCbVc5d04rcGRP?=
 =?utf-8?B?MlRwaXc2dDdKa080SHByVDc4VUxHNkNkR2I2Z1Y4bkxvRlJFVVh0VXZlTWIx?=
 =?utf-8?B?WHlkMUZwNTdwV3o1T0RxUjlEQ2VzZzNCbUZWRlA3TVAySkVMclIwTFBVNmhM?=
 =?utf-8?B?c0lRbWI0aEZhelNJMXVBUVFvOFBXOFoxSzJTcTNyYUE0dTNWZ2VNc1BhdGlJ?=
 =?utf-8?B?ZXhCcUhxdUNWOXh4YjNkYkFaUGY0Z1Axb2NFdXpMeVNCMjVRVm1RQXQrS1pi?=
 =?utf-8?B?N09HYUJYUXNkZzFScFJndk03WGUvS0J2M1RjVGJIVkhzSnBPc3BWZ0xWa1lP?=
 =?utf-8?B?WGlZNUpDS3Q2LzA3eEM0ajhWM3hFVm9oN0c5ZTBYZDZ0Q3Z5OHNGaFB5cXV2?=
 =?utf-8?B?YnRMWDJZS2poWldDazc2bjFSUjJvM2VoU3V2TDduZFZRbkVIZUplL1pKTkoy?=
 =?utf-8?B?SnJINHpxRWhXUDNCcSswMy9BV05NQVJOb2FuajZ2ZHR2eWZlZlJJTjg4TEs1?=
 =?utf-8?B?RzZ3QUxBRmYvc1B0NFVqNlZhZlo5Sm0xZG1vYWlOR2U5UHFVd1BUQmNQRlow?=
 =?utf-8?B?cGxLaG16M016MTExa3ludUhXR0xjQzkrQ3lFcFliQ09KaStDSWR4NHFtYWpB?=
 =?utf-8?B?ME5uS1g3VEpXTk5zOTVjMzVJZzdXUTBEcnFBR20rQ2cveUcwU3dlbjQrd0lG?=
 =?utf-8?B?dDVNNzVEV255R2F3ZUZzUWFlTHR4MXRBU0JBVWxKOVU2b0U4OUFVV1djUDVV?=
 =?utf-8?B?ZTA2ZVNsV1pQb0UrQnBWcXpCK09MMHZKcFN6TEtaWEhSc2k3QVFYTjhjc0VH?=
 =?utf-8?B?QjJkS1p6djROcTI3TXkxMURabnN0UTg5c05xOFNuRXJqVEk3WXBaMlJFMWJU?=
 =?utf-8?B?NEtsU3ZhUTZDay8rNkI1ajNsaE5ZdmVTQWlVeWw4Sm95OUhuUVZZaXl1eE9h?=
 =?utf-8?B?L3Foc1FvTzd1Z01qME1PY3NKYklxZWxFQzExUUJQWERTK2xtSXZ5QW9mamVT?=
 =?utf-8?B?NU8rWkd6azJScUU1UFZIYXcwV21MS0J2OWc2VUNUOU1MZTBUUXBQdTZxU04y?=
 =?utf-8?B?NjA0MGplYSs1WGg3NnFHVWkzQ2xoUytFejVFTTVlQ3JUdFdOMVFTWFJOYVh0?=
 =?utf-8?B?Ull3aEMwY0FKVm1PTlBnbDZYMWx2ayt2UnIza1hKSWlyR2tENUdzOVJ4aU8y?=
 =?utf-8?B?b1ltZzNPNEFCWkl0RytZV1RIdEFGN1EzaHdWM3hUVjNicm5MM2diRjlqZmsy?=
 =?utf-8?B?TWhndXhLR1dSRm81TEhPMWhRUjBXRGZjQVQyKyt2Y0RyTjNtZXQrdVFCR0VD?=
 =?utf-8?B?cUtkbjJGanVYOXlZT25mZ3hDaVhqcW5JclR1Y1pnM1lWVDNYU2dlcW83OU5P?=
 =?utf-8?B?SCtHWEhHZlpTKzA0Vm4wNWRtWXVndFhCL1hoalU1YnNBTFpXU0FiYTA3TGxw?=
 =?utf-8?B?SUZCUWJjaG5oUHlSZEhqUE5YRWZ2RVlqU3g0NEpPRG5yZllDaCtRM2xudkZB?=
 =?utf-8?B?L1cyMDhWWVlqV1U2Ykc5WUI4aFNmaE1QRENzbVBWdi9uaXBDa2MwanZpSnpx?=
 =?utf-8?B?UVMzY29MV01oZ3dnQ1JkOStnQWptSWZidkk2ZnBrbjd4b2pMeStUL2FNeW1K?=
 =?utf-8?B?WmVSQ1dWdnNVQ01oMEJFTG9YU0pTcmIwcUdkOSt4LzJ2Y2VnUnh0dHoyREY0?=
 =?utf-8?B?a0V4YWp4d1o4QkRJdzBUYmZLbktoNG8wZ3ZnbnFBVHFXQkFSdUM4UHZaRXNh?=
 =?utf-8?Q?XVodibNVeuZHuZhPn++R94pNY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147a89b5-c7ad-402f-efd9-08db60f92a0c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 10:32:27.3691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8Vkm/fSPl5g0dDAZnkK+lKj3MP+KwMcOQG4PfumyzSALrRUamhlj47E7mU5uJvzhvKLMW+bv4BDJSs43g05Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8247

On 19.05.2023 11:30, Luca Fancellu wrote:
> Currenly there is a latent bug that is not triggered because
> the function cppcheck_merge_txt_fragments is called with the
> parameter strip_paths having a list of only one element.
> 
> The bug is that the split function should not be in the
> loop for strip_paths, but one level before, fix it.
> 
> Fixes: 02b26c02c7c4 ("xen/scripts: add cppcheck tool to the xen-analysis.py script")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Just wanted to mention it: I've committed the patch as is, but in
the future could you please try to find slightly more specific a
title for such a change? The way it is now, someone going over
just the titles in the log will have no clue at all what kind of
bug was addressed here.

Jan

