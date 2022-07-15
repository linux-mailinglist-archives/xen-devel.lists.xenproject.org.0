Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822DA575F32
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 12:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368079.599257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCILL-0001s0-7Q; Fri, 15 Jul 2022 10:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368079.599257; Fri, 15 Jul 2022 10:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCILL-0001pL-3r; Fri, 15 Jul 2022 10:14:43 +0000
Received: by outflank-mailman (input) for mailman id 368079;
 Fri, 15 Jul 2022 10:14:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8RKo=XU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oCILK-0001pF-CQ
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 10:14:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f086e10f-0426-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 12:14:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9206.eurprd04.prod.outlook.com (2603:10a6:20b:44d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Fri, 15 Jul
 2022 10:14:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.015; Fri, 15 Jul 2022
 10:14:39 +0000
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
X-Inumbo-ID: f086e10f-0426-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPGAf9U380EhN4D59cA0RUUQ6q397j3pFNAsFatm0jLDHvFRLmBeSsrw9pgL3WM4Qq9WaU3Aw3RCiI5LkkbbaYa2/DSYWtIwFHuykSJ2FdwHGOOXNZImkSzpx+820K5XOSA6kB/6VNMztPmPP0IuR6fF3pncd27zkUTbJihYAgLm4DCSmB4wmtHeHsAnKYhDfAH3VLjNd+Y8TN1JYfZGkwru7PbOeALEfmgV0LR/MHg97d/BxREdJs6tH3Jvyin1Z8zgeQFKkHtdOUd5nRpuQFOE6uMSxcHESZW4YofWXApiXj+ZGV35fWrxR2Sm8Jg44IE2u8+N3dsfccULYJU5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrHxZTLfABoiB5W2wRRF/3pHtCvhqOHQnkTZMH0RHdE=;
 b=J2ilypP/fJMmO1p9HwohkQmybRxLkpuv6i1DvHdwh8eOvlSPkLqZkBngGe3wI/vBeh811IKjJ/ncz9eawc/PikvMpSBXnuRvgc37+2VFT8/vDQKEiFfMAK37TaILoBnnczAjcLTe0DQxyK3XVy1ZYBPWVBJZ4T9Ist5+ip4OXsr+xIGq1sGf/z10k76+drv93vObWkez18OO+CjPN1Y+6IVhngdsqtIR86pTIiGT87or3E04JYqvvSl5q1rwXME/sVnIPg2f3SNhr9pXYI3y8v9lxgojleJ3qGPFlxplThqByrCAHsaPbwqfWjGqUfJyXL6BCy7ks6vC6SVN4DTBPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrHxZTLfABoiB5W2wRRF/3pHtCvhqOHQnkTZMH0RHdE=;
 b=CkAX7b1v3vC/CMbfpIkf+VJvFWc3zt/q2WEdv/gs96uLYnDjKmPyYUC0WaJDxMypFEyRqsEd5YjhDHis5dOxZ2zsU9XrFYu6ctti78GpQMaBDNwbEsBtsVF5Jay/Pcha32R2ex5BJUGN+GrWwJzi3gHhKx+tGapHxd9ByC9G3euZf7D5HnqOZ3YIpS5G9CdIFEYJzsMxwnxWqS2iKxJOda0Bgao2tiFRwaCOpBjDKqOtuFeUtmIfL2PnHjDY4YNz0P33MpB3LvgLVrkloLHet4x4exMyIoGjg/ZhiJm5l726Wg0Jt3b9muNj7srta0dVxtvMx8+InpUdBlaC4n8M7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4767bc7-0f0d-7fde-4a9e-c6d4bc7ca2c2@suse.com>
Date: Fri, 15 Jul 2022 12:14:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220714143907.25938-1-anthony.perard@citrix.com>
 <20220714143907.25938-2-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220714143907.25938-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0006.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef9c1e18-6133-4dbb-3398-08da664ad3de
X-MS-TrafficTypeDiagnostic: AS8PR04MB9206:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T0Xw5AKRqbxi8+zRdE8pihGwZb1G7JpmkhOqQGQXSW0cnaoj8mgQUJCsqRWKgBCENo3xs44EOB6seCmENH1gTASbvP1zA0cmLP/UyCG27o4B6zwIBhw/wGD8egtsd/qIvYfNOtCycE3BKBq9uLuSxTivsRgExKahazFDMt6JiIepEsCa3FGXiqw5nrq/4qOBOcO+z+mzzgHl7ClFYfNz4tudhtr1nPrZsvhQ92kQZ819A7FytbDoUnsTIb3tG/AqIdlElXUWJaaLiARznDWYdQo1tUYcflOKF52rvXUHoCNpySga+vc4MY4GsHI8WOhG6QjjdTc4+Y26X6O8p/ZqQ8nzOs4WZvmiMLMcXtCUWwGKz0tlGNolX5UN3IrJxX0PUfs3HqjAExbl7zKv3AwvLB7gN3ScdKgL0JO6GhcJs80+jcSFV+5ORz6PaUfXbMBhG/aKSYH+tUqZ5eVV98jhhlHGRvRlNRCMpGxbNVQbb93FFIDTjcjUXwS84VXI/zKS3Wx6OSXGwfwr2HI1dmEhSsxeIZQRst1V+ohXORl7tteM8kycXy1IhQp2xPOzP/59RwJaIrIagDwO+HtfmqHUWL2Dvfi1pkZOvOP3PuBbctAYdgq5AuWtby6F9ZYYV7tYBHzTt4tU/p6xqfyf6/kCQAy/a4MjbS6m5Iqo2NvrcELu3T/c0l0B/sEf8uksauO0qoHQQvGOeRImRlMBm4PIoZL7LLC70qZy/7O0H7t/dbzuHxsN2NrltKy/HIhw1ofl2M3j43GooiwQuTzILNnO/gasjbOT3MD+rqbGQ3z+ENXRho3qy7FVCZOlN9VTK0QaaFjdWEsZTO6fokKmTLuazw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(366004)(39860400002)(346002)(376002)(66476007)(31686004)(6916009)(8676002)(2906002)(8936002)(4744005)(26005)(66556008)(5660300002)(4326008)(66946007)(38100700002)(31696002)(478600001)(86362001)(186003)(6512007)(2616005)(36756003)(6506007)(316002)(53546011)(41300700001)(54906003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXNHK0d5eGRtUlZhZkJXcmNydXBUZy9XK3RndURCaDAzU0luWWFtNkpmQXhZ?=
 =?utf-8?B?a1N6TEtKdXhWWEFOM3AxZmpBQTBjdWlnSmNRZUd1dUFLS2NsNm9yOHVOUlJ5?=
 =?utf-8?B?VEZVSXlqcWhJS1hmdUhzbFl1TVpXcjhCK1ZKSytjZ1FseUsyOThwcmtsdjZ0?=
 =?utf-8?B?dFY3WjVaRG9ZYnplcHNLU3U0dmprN1dWdGd3STFTL1NIeHpRejVBcTFKOEI2?=
 =?utf-8?B?MVo0dXZ1ODJIbzZ4VXluTkVVcTB2dHlBaGVGU1J3SHBlZnF2REZwS0ZvSnFV?=
 =?utf-8?B?TmtiRWlyUWNBeEp2Uk5HalA0VXpkSjZTK2ZINTFRQ3BucTBqd01hc2tMcEtJ?=
 =?utf-8?B?RHk0d3I4R1FmaWlSQU95Q280ODREOU5reUJoOUtLVEZBM2NDMmNvdjVUQVEz?=
 =?utf-8?B?dVdxTTVuaERjaCtBbkFGWE5Va3Q4RHlPQnZMU050Y29aZHNFQ2NvamI3VlF0?=
 =?utf-8?B?VDZTK0VFQU5CMEFLMlpHR1pOWktKRHB5WlAxU3MvdnhNUVNROU0xdG9Wek9x?=
 =?utf-8?B?aXRrV0Z4MkFRdU5ZdVR6Q3RzL2lLQXRwbUx2My9XSk1xYjUyTWJTd2Vmek1I?=
 =?utf-8?B?S0NwUCs0QzV2dTRsUFhNbCtUQ085bHNaRzZsOGgzSXgvTDg4dG5ncGw5NlBa?=
 =?utf-8?B?ejd2N1ExemRRSDYwaXpycnl5a1U5WWZqUis3OWVoVnc2Q2EyUWw0QjlqbHVm?=
 =?utf-8?B?VnNWNnFQWU10M0k0aFNFWmxsdnZQQU52QzUwZUk0WVprQ3g2cm9XeFJGUGcy?=
 =?utf-8?B?WUYwbHhsb0NQeDRxRXF4TUxyWGVjS3E2aDM5bW5SVHpzeUYweUlNT2owZjZD?=
 =?utf-8?B?a0M1K1JLdEIyc3pBQ0ZLb1hGb0FLREtQQkhuTTR2SHA0SmJRYk1jcGl5cEVC?=
 =?utf-8?B?YWNxV2tpNUluTlc0MDZVRURFb0NLV2VSZ0U5b2JaSUU5MUlmZzk1ekZ2ZmRP?=
 =?utf-8?B?QlVmSEZRMHFYVk0xZVFTVGZSUmk5NkVncERnR09EcHl0cndkTTBHbkRzQk1s?=
 =?utf-8?B?d2g5VjU1NENCbnNvLzYwUEtCcU1sQkpGUk1nMHdJb0drS3k5S3N6UkZUOHh3?=
 =?utf-8?B?dDRTQ0F4V0lzRmtDNXAyM0JWQ21CK2xMZkZNREs3SUlUc1p0bFBoelJOR3Qw?=
 =?utf-8?B?SmswNkVieXlnK2Y1ampJNkF3L3JzOXRHWE1wdjVmdVVxbUhHNGVUUnB4S2hW?=
 =?utf-8?B?YW1mRHFzeW9vK3h3OVpUNEkxajFYR0kzaGJ6RGVuNlo2bmVJL1cyemVZbWh6?=
 =?utf-8?B?dkl0cjh1R3VIOUJyR0czcytNM0lBZDVuTW1ISllabk9lQ1FTZUJaN3A0bFZH?=
 =?utf-8?B?N2NYVU1ObzlybEFPSnVYdDVsZEZFaUk4dEJUdE1LYkJBUUpxNldxN0xYczM1?=
 =?utf-8?B?Y2hDbHVHV2MxV29UbWs4bHoxVnFzd0QvUnV0elV0SHI4UVBUVzFqUE81K0Zy?=
 =?utf-8?B?cTM3WEh0NGpBNWFyZDVLd3dQanZHdHlVQ3Fab0dmSzhRVzEyWUd5M3JQTFE1?=
 =?utf-8?B?UzBQeUExWmxGM0hVWDd6c1pvRElRbldrMVM0S1Z2T2NMeXlEZUNMc2MrdUh5?=
 =?utf-8?B?TnNnZlRXak1uTXlSWmhvZTVGVnAvTTNxVUE3NEhPRDgvTFp3TkNHMlJtRkZJ?=
 =?utf-8?B?cFZBakxSbnhtdmFuSUVMNkZpUDhvYzN6WEN6OXdFRm4rS3NRUHcyWWpNTHI1?=
 =?utf-8?B?NWNPR2lDMVVQbXVkYnlwSEZwZXZUMzhTNC9OZ203VVVwWUl0Z0ZTa3FBL3Vz?=
 =?utf-8?B?dDM2REJlWEpITEx0bG5mSkdkbjM2MnN2T1c4S2lJd0tPdm94eDRKckpPRGlC?=
 =?utf-8?B?aVExc2dnTUh5MXFURG5qblBzTXBkT21ZZXU2Q01DZGc3NHlUalJEdUYzMlcr?=
 =?utf-8?B?QVFNUmlGZmFwZVdQRWJlRGdQWW1FVk5XQUs0U0lOdFY2ZHF6dG4zUU5STG9X?=
 =?utf-8?B?UW1rWVJ3dzFMVng1dy93d3lUWnN5TC9MUWlRblB0UjgySmxMalp5eW9JV2xC?=
 =?utf-8?B?SUtGQ2FEQnZtam8wRmREYjNUMzF3R3pEN1dzTjJ3a2JWZFBLSDNDc20zWHJC?=
 =?utf-8?B?NHJ5Mm9lVHVlUkFaVis5MjUrK1BHcGxuNEJoM3lFWnFWTlpMbTI5cVYwNHdQ?=
 =?utf-8?Q?Z6paDz4kgcT9vYYbTwVKAhplT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9c1e18-6133-4dbb-3398-08da664ad3de
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 10:14:39.6857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioTqIRDZtOGNEDIChtAOM1eaDqmnandbWCaJglUYXWa/nWlRiLN+mEwQPkCAs9+JgS5vUe/4lTrRRrkVTeTVTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9206

On 14.07.2022 16:39, Anthony PERARD wrote:
> --- a/xen/tools/check-endbr.sh
> +++ b/xen/tools/check-endbr.sh
> @@ -78,7 +78,7 @@ then
>  else
>      grep -aob -e "$(printf '\363\17\36\372')" -e "$(printf '\363\17\36\373')" \
>           -e "$(printf '\146\17\37\1')" $TEXT_BIN
> -fi | awk -F':' '{printf "%s%x\n", "'$vma_hi'", int(0x'$vma_lo') + $1}' > $ALL
> +fi | awk -F':' '{printf "%s%x\n", "'$vma_hi'", int('$((0x$vma_lo))') + $1}' > $ALL

I'm afraid that's not portable to environments where sizeof(long) < 8.
The shell isn't required to use wider than long for the evaluation.

Jan

