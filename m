Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F82C773A9B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 16:01:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579976.908207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNH4-0001a9-9q; Tue, 08 Aug 2023 14:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579976.908207; Tue, 08 Aug 2023 14:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNH4-0001Xn-6v; Tue, 08 Aug 2023 14:01:26 +0000
Received: by outflank-mailman (input) for mailman id 579976;
 Tue, 08 Aug 2023 14:01:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTNH3-0001Xh-7I
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 14:01:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f4a8935-35f4-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 16:01:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7869.eurprd04.prod.outlook.com (2603:10a6:102:c4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 14:01:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 14:01:22 +0000
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
X-Inumbo-ID: 0f4a8935-35f4-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odPYHy13W948CIc0WTEbnj/sRPp0MXPEkF0vY5pbdc9GBV2qClcKsleR/dclcCPhV6Xt+NGai+PucCg5U5c1WgQztmJyDzpJTzXDhr1NwXrQOuPwRM2IdeQPM4J4rkoxfCWSOceRrKXdZgUUHQdzyX2r5Szheo30HxwrN0+FS06BqwblFelKgr2zz1cT4ZSSWTwMPZo4ezJ9UFLla46o7372kiaMRK+Xkof155eAPxl7Fi4yCfVBVAYTgXegf1Sosq/6/MrHOVeosFPTxBLPfPPbWJXGyJ9z5Kj1sULp2ND0XGHpIXfSexzlzWKrPFChGKj0AqjY0V+r5nXOQnumKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baBWFeRjOBkdXC/voNhdSJw5wzxdGRLHNp0RW+pSYAU=;
 b=cIUgtHum3ktYsG489zG7/k6UeJ+idr88GDeYwEX5wnfTzTHf2ZuEqmPYNU1l16w/GDUyknbzWyw+lzqjBlGDzU7VkBsLzVyBEmWQZpaPtcIWB6Mc13x+c91Ybuj52bk63vle+WtY/FnSdieceDBV50s4jOHzB0mlRsZv0f3qL0abgMcQX0gePuUERD3x96WYmLPWy1a5uqB9XGRAO/dkHmAiZBpfY7PaMMgItri3SPe3Rs6da+IF8SrwFBtWj4A9YIdVQeLGwb/wAQpONCGfeSlfrmin//hME3vJOKCcJAhR0eGYZ0JBImbMO1MbzbP/tRkodXaVHCixJVj+oVD9aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baBWFeRjOBkdXC/voNhdSJw5wzxdGRLHNp0RW+pSYAU=;
 b=Mt0Wfhv6PO3mQl4EObpiA1H80OYhrjGfNflxJWoGABgJSjBrj9MA25+fgRfD2MOvsNMXZiUsCLdn2cvPiUlNljPk7AANQnMcdi3Xk7faU9ZvAwIELI9anxmsnFplMETZbQvXUXUXfFB9+ov6K0DsQKzg59vkKdEMXzvJmSh1JMiEmbWgq5gPzZlKYNNgtNRey2M6HfYQ4GyYGSLTL9Ce0Jkcx2HfEksimOwE49Oc0LO6dJc3hhj7JE2mVUZ6/XCigodj0O5G/ER64ELp2g3zdT8PeaZyw5XHgdqdPqqGAhBZ3g41NAead/dSeiYLlPuOYU2x7mLlkj1sdxBoVUJ7Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97b43017-722f-4891-395c-d53ae4e6c24d@suse.com>
Date: Tue, 8 Aug 2023 16:01:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 3/5] x86/include: address MISRA C:2012 Rule 5.3.
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691492441.git.nicola.vetrini@bugseng.com>
 <4b41f84c6cbce3466917d1091029cacb3c327d7b.1691492441.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4b41f84c6cbce3466917d1091029cacb3c327d7b.1691492441.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: db3a8eed-68ca-46a8-60d3-08db9817f251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xWcQ3Ne6EYf64pjx4nDhrw/fNWpdntspbf4GPERanYFbZt29QVWInrgIkwB/JQKVHrKQ03nBzgWYcCIWepFXoQ751dqWRXfUi6I6jS1fNoYIPL23hBMVab2YqEi2pC8shvCZJDLR6kge/B4J5ZwcKagO8IWqrsrwTFJgX94Cqmmuql/UPvSJHvM+Gnvws9BqUu4qQtGqbHacH+5vR7YzgVHWnFdot5eE+iSMi5zxPK1kOBfmV9kJ0Xliviip7ElSfbPcUZRpFd1xTUfUXe5Gd/CHz5FTWpHHSrD4wSs3Uu3DrOZ683V62ZRNrMIzB4RIiltdOu3jKtmXNQovQa+P8qkhgRYk8jaTqHQsAcbQrjre+cQXSMjcSgrFbeW191nsorKiiPV6B/hilBGq5SpYitndnxJdwewRwiVtrcrHWTWyiEApiTYoZhEcL5LMlnn/xeD9Es+22wzYxKauG+kPTvermutoPggALTz/hVFCWF6dAygmXQTAphysHifo4akHuuD973P2oMYbao7C5fKkRrg17ZdYr7OG9N+Lk35tKi0wClcHc0XqGepA/fY6PMjd03qcVvaOPrd5XmgVdwo1uv/WKLeTRd1SiaBUJQGGuG6KMrEUEcwn2ST689DgTmwhJsk1SGpUC6EXyCIQd3cCFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(39860400002)(376002)(136003)(186006)(451199021)(1800799003)(8936002)(7416002)(8676002)(54906003)(478600001)(5660300002)(31686004)(41300700001)(4326008)(6916009)(316002)(66476007)(66556008)(66946007)(38100700002)(31696002)(26005)(53546011)(6506007)(4744005)(2906002)(86362001)(36756003)(6486002)(6666004)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGI2MmtPWVdac2hrTG5tWm82SVJ5WWxpQTdmanpSKzhJaTN3OG02NnNaU08v?=
 =?utf-8?B?TmlzcURoOUxGSHpPTHo4QTQzdTdLRnhZM3UyQXphL1BhaFlZQzFZNGpCQkk0?=
 =?utf-8?B?WGlKQTBLNCtyZXpId2ljS3p2QWpHUHpWVWlDSU0zYVduQm9VZ3hXczJ0L1pU?=
 =?utf-8?B?UkpyMEN3L0s1R0JSd0FrQ0FlejNTQzczak9LNDdOL0svTlgvRU4rcUg0bjk4?=
 =?utf-8?B?OHhSVjc3ekRoYy93MWJVbGJRV0xGaEJXOENqaGMvanFsRUlPZ2gySWZRcFJ5?=
 =?utf-8?B?Wlg3UUJWU1ZYdksvWWxHclYvOUdRVThvYzM5SHhaaTBIWmszaENQRGJWRXpO?=
 =?utf-8?B?Qk9wMy8wN1RhUFA2SnFwWmFpOExBMTd1QURrd0oxRW16WUpaWWhhNHFvalJD?=
 =?utf-8?B?dmNoekNncWZRbFN1Z3dXU1F1djY0K2FURHZBUVFYOU5oV1lTMEN3bHRwcWJi?=
 =?utf-8?B?UkUyRUNIWk1ZMnZrclFJcnNLQzhNcEJJYk1BNHhiYnhYV29SS2NyNHFJaGFP?=
 =?utf-8?B?cFB3Y3JqRGIybkMwaFkrK0J0bVN6UzA1N1I2a2tjVjM5TG5Ba2tCSnBNT3k3?=
 =?utf-8?B?ODNYdVZwOTJkL0JpZjZ2dTRyS2VxOUJZUUlmcGl2Ymw5S0F5N0NramdtSVFS?=
 =?utf-8?B?WEcrT1p5bWJ3SHdMWUdhQjg2RC96T1dNMTg2S3ZyK1o4UWY2cVJOWDNmcW10?=
 =?utf-8?B?OGVpcDkwUjFqWGFPRXV3MWh6dmdlUjVXZGovNHp0b0hwVVI0dWxvNkZic0hM?=
 =?utf-8?B?WEZuSVZwRXlON0wyWGlsWFBRTWV2SWdqQ2VubVp1Y3hMeWQvKzNaTUF6cVFt?=
 =?utf-8?B?b2ltUHY1eDM4ZDFDTEt0d2wxV2xTY01mSTRPMjdTTjR6cmlnT09ta3pyQmFV?=
 =?utf-8?B?NS9zRzJRdElMUzdLT21aN1c5MzRxdDZpMkk2cm5uMFlpN05YOHRqaHdITldD?=
 =?utf-8?B?VUR0NVp6R2xGcnZzbU41TnRPTDVWUDdyaEZiSzl2VnVnS2JoZi96bFJnd1pz?=
 =?utf-8?B?eW0xSG1DcmJYRXhveU80UjFYRldBNFh1Z0RNQkkySCtIa1k1THUzMWxkeDdP?=
 =?utf-8?B?ZktmM29lSnJlSDhsOVRkVU8wdmJPK2J6M3BkOGl2a0JjM09vY3VRQmwrZjA2?=
 =?utf-8?B?eFFkMG9FYjIxNndJTVdEaGlncU5rdjBtRVJEL1FramsvNzBGOGtrRmlMbmhj?=
 =?utf-8?B?eHRMK2thNHRrbzFtZHByUm10U2plTHI3NGVia0V1dXhobnIrNitnTnIzUHNG?=
 =?utf-8?B?VkN4eXBFWEVFaHBvdTBWR2x4M09QekNRWXJqUlY0aDRLYkU5N1U0VTBBT3Nu?=
 =?utf-8?B?Q3BmVHpMcXR2dUNYYVJpZ09JYmd0NE1lLzVXWHkxYk5UVTJhSFFWQUkyQ3Fr?=
 =?utf-8?B?dFdvNkNhSTFQVGczMG5hY1QvODVVWnV4L1JackdTQ1dPVHBWV2gxSVdsclFH?=
 =?utf-8?B?S3liNlFaZ2lEbFRWVzF1SVNRZUJSSEpWV0xkeW9EajI2M0VjbUhTRWxyUGR5?=
 =?utf-8?B?UXJtajM0cGwwaHV0UDAvTStiNW9iTk52NUhSYm5SQmZncXNsSk91cS83NFE1?=
 =?utf-8?B?OGNBNG5rTWJHWTVyWTZxbkQyZzhUbjlxamV4SkZ0eC8rYzdKWE51RlpKSE1k?=
 =?utf-8?B?dSs5K0lKR1ArOU5sWjBSMUtVMi9NUmVIaW9zeVRrMm5VOHZHRmdJbGFCNnRw?=
 =?utf-8?B?Tml6UVFUbEs1SmFRNmFGQW5mV3VuOUNERzRRQzlLcXQrY1JhYm43Q2VJK0pm?=
 =?utf-8?B?OGtJUWJKTWY1MUttRG9IYmZPbXlQUWs4cHdINXRNbHlxL3FjQm9MNVpFMHF1?=
 =?utf-8?B?VGd0ckxSd2pPSWJjZWxNdG5QWVJkWjVHVFd0Nlp0WHUzdG9zMjZ1VjVnT3Ir?=
 =?utf-8?B?bXg5WEo4Wmp4U0IwMEl3MVFRemVrT0hKdVVSREgyeVoxdHFFT2lSeGlWb2tP?=
 =?utf-8?B?eExqYTgySkJSZkVucHZ0U3h1Q3h5WDdpVUZFYlM4bEtWTzVkamVZTk1GQ1ZV?=
 =?utf-8?B?bXoyVm43R09lWXNNdVRDbXNFMDlJcXNWUjlBZktnZEFoMlNFVHVVZnhGTzBV?=
 =?utf-8?B?TDJQQ0RhK3JQcUlOMmFhbEhXZThRa0k1UHlFS0lWWkxMOG00QU1BeWo3SnVT?=
 =?utf-8?Q?JI3BeTMd3ALfZS14N+QOvEI4/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3a8eed-68ca-46a8-60d3-08db9817f251
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 14:01:22.1255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LOWqBt7/0PhC/KTapMJ/ydXMUGz9/YpvEg9CZUvnl78WIiSUoSNOGA5a6wAISKrwWLTee4R1DO/O+dBm1EuCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7869

On 08.08.2023 13:08, Nicola Vetrini wrote:
> Variable 'mpc_default_type' in 'xen/arch/x86/include/asm/mpspec.h'
> has no uses and causes shadowing with function parameter names
> in 'mpparse.c'. Therefore, it is removed.

Personally I'd again wish this could be expressed more precisely than
just "variable". What you're removing is a declaration which has no
definition. So aiui shadowing is only one of the concerns Misra would
have here; the lack of a definition would be another.

> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



