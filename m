Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7460C7CAA96
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:58:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617618.960378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsO74-0000ra-Gd; Mon, 16 Oct 2023 13:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617618.960378; Mon, 16 Oct 2023 13:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsO74-0000oE-De; Mon, 16 Oct 2023 13:58:30 +0000
Received: by outflank-mailman (input) for mailman id 617618;
 Mon, 16 Oct 2023 13:58:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsO72-0000mp-Ey
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:58:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13e5195c-6c2c-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 15:58:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7680.eurprd04.prod.outlook.com (2603:10a6:102:f3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 13:58:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 13:58:24 +0000
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
X-Inumbo-ID: 13e5195c-6c2c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irwq8HTo/t0lJU6IEu0JtKWVXnqf2+aoOtldKP5M/rYEBvKC8qfx1NJ5ExsWZkqsovqTvZbBIegtCwj3um970Xcne7Y32Vd0iMlR+Qbdn+/rmV00dizutM/kWlT0JEDSwI7TWSMSZ2T7nvatcDwvlP+ZoAr0ijced4gAxKK4VdLQikmpcDjJBNnVJdnQK8sjUyg+GyaeSv2GtKRlqzxxhvMt2RidIjisFqXIBS12uY8FksQReTz6ryP8RRbOqtW9/HGMssQBDHcHVQSiArdZOgl2HE2FCcoHqDZtisxVW52MsjAJmKtrH92f3WNdUDVlminu8bB4PBT8y91PHisRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3JH9WksVCDGaqBLkvgh4IIwhsnATv3HsHCPEtxwWUM=;
 b=S29jCwuVBvmqeqVxbAq6cJDhCiqvGOXww3cRrHR/waaN/6ozgoSt8TlwFiUCuxlDUAXqiddTUJ1HIQfVgP5H+VSqZgyu0qp9HFC02LlQ2AH3tFpdYnYEbZLu/9R610Am3y4dSuxTpbU2C6DXT28z4e3hp3r5lab99Lnji+KrOK+a6Kgq8UvJFgcrD+Di3A+xh2pX7DOM97y0xgJflm4ACg6Z7g2ePI12K2gc1fGe463qzZ6kO5RTDAmOB8lqqh7QmaZQ2knM52mC9ponGa5Bl95MDZk7hfZxlgl+JuxxqJxGfCR692vyYM2zS/LpVpelIZh/FrpKBy7/rt6ErClyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3JH9WksVCDGaqBLkvgh4IIwhsnATv3HsHCPEtxwWUM=;
 b=5UaK3cfRoaf2bYMnxEnbvKLq3+nnYqrSRwLoXIkbexgKhoXX7pk2eP5pB3RdDjXNNcbnMCd1LbbfRERR6WeExiRY3hVo9lYopKoXsTX+jlDTf733siBH4wVJglM7pyRl21i/7OrCgslQjx1MP5p7tHCj3cCW/AR+DZ+WdFMsT/Bc8GM2iDmsiapozgcByvOtRYHmRQE5H0qsGQZFIiAczKxKcvHLLQbWLsZJi9RtyFeHaAR8Ad872IhPseOloIpwtb+rf3L47gnitZdK1uQ7Bj2cYsnryH5r+lM/IyM3R16fJ88VE8Zx/1hj6LdYs/m3w5BCSF2bY2s6rS8dGryUTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2cd47d7f-00de-3409-c21c-561c92a5c42c@suse.com>
Date: Mon, 16 Oct 2023 15:58:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] domain: expose newly introduced hypercalls as
 XENFEAT
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231006130059.97700-1-roger.pau@citrix.com>
 <20231006130059.97700-3-roger.pau@citrix.com>
 <b8c03b77-d4bf-3be7-2090-e76e6849b085@suse.com> <ZS0z89xtFzkmK8_d@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZS0z89xtFzkmK8_d@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: b47857c0-a848-45dd-029f-08dbce4ff6cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hNpvLIIhLR2ZmB5oyJ9+eZFWJGmfcLGNLGyOh7006rwPGRBKazUwSGcg+HUdtGszNNL66M6ec0x6kDR2Ri3XQv+a8BHurdUTuXPv3Ip/OuZI8ueyuXfgwkfuzy5I10ZXUcyFEyALCcGni3KfFfKcA9v3z5Q49nOr0VEVOIm2Q9P+M+K9sPFl5BXwynTNkM0GH+PTwg3m7oMACi3nVF6rk1CXrGJGmVI9jcGb9rSApDcx8LibtuNG6b8fWZJiK7DGFDCJI22HXYUzqUEss4HEaFnC4a+xxn42QfpBng9dpY3rsepovO/ZalytcaBKMpG+nGZAozohoFrUjmAhy/GM64EkzHJmzAfOHN/ArQNvFRNzOWn+SED5GCoHwy/yrMciOK5FUkn/QptaQw5C442Ak2wZZri0O74/uHUMfE0oaWILXdjo8nIefYsQ/1+jXxenzwfPVBaBcHjBoidMcNNXJSzPkIFpb+AwZGS2SM/y6Pdf406Z6H9iaXJi9gAJ3muaMUg8hzG7M1ur4WZ/6s21zBhiZ9UgQyBuYqbgv6UmDf3rWoOO1ChQw+h+CkEMP3QlBAMzKsFLka5aW3n7LLnIchBuvliIvHJhbyPFaTGGVdvfmKNGAO+yOiyGwS9Qxj+giZJFFI18V6iwKHUOkIcwXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(26005)(2616005)(8676002)(8936002)(4326008)(5660300002)(38100700002)(31686004)(41300700001)(478600001)(31696002)(86362001)(6486002)(2906002)(316002)(6506007)(6512007)(53546011)(66946007)(36756003)(66556008)(66476007)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3laNXpPZzZaaXJaY3VXYkRvUXVBZ3A5SndDd09mMit1YmRXWTJyNStycUV5?=
 =?utf-8?B?bXdUbUlZbmhuRFhjS2pwTGxXNVJ2Mmc0a25ZRkZ4L3Y0NldMeVpBWFR5ci95?=
 =?utf-8?B?WW5rNVpTaEVqbnU2Mk5ZU2ZSQmpwQ25LaUNWdGVhV09wK1dYdHBNMEwrOGZv?=
 =?utf-8?B?c0xTa2xtck9uZnBvRXpXWUlBc0pxeUdMOENnaWt1VlBjOFlaUnF2TWRKNFhR?=
 =?utf-8?B?T0t0VVNyeVNnL3lTUHd5am9NMm1TMW1NbEJEQW5naXltR2tYaUlINTdldmhl?=
 =?utf-8?B?NW1oVkkxcDJFWlYrWnhNSTBKS29rMmpuaXpDSVp5UE9kMkdEWmFtcStxYWdL?=
 =?utf-8?B?ZDlJUkZiSGFGZ0QwUExrdERBdnoxcC9jWGNLUDhKZTN1VlY3SkNDNHc0ZlB6?=
 =?utf-8?B?cEJuT3hCS1BrRTRsZFdIcG5jK3N3SmVtQnB6dVZvdHI2ckYvZmxhMW03blk4?=
 =?utf-8?B?MEFOajdTekF4Nm52Y2Q0S0NpdkhjaVQ4NmNNdUJZb3JJOHNsbFpzMUgzd2hL?=
 =?utf-8?B?OWduUWwvRzVxZHVQNkViS2U0a1A3ZUlUNXNmaDBVeXlnUU4raVFvU2pwYUFm?=
 =?utf-8?B?K0NtQlFVVGs0WDVzZzVmY3o1eFlPWTR5SHNGdHo5NEhHK1kyMHIydUp5L202?=
 =?utf-8?B?UytlYzVtYTJBWWNkWm85SGd3QXRqZW4zeEtLeVR1Mk9MdDMxTnNoY1J5Y0Mr?=
 =?utf-8?B?dkFiT0ZhbTJXeGh5Lzd1MUtPRkJjWFozSS9hM1RwTHBnNm4wTTJnODNaUUUv?=
 =?utf-8?B?UFRXcDNObkZwT3NOUVAveHMxZld5LzFlMVNrZUpwN0kwSlAxVnB5TVppV0pk?=
 =?utf-8?B?YW10aDBNU1NCZlJVY3V4dTJHUlRZNjJDRWpPRWpBZ2hpL2d3dTBHQVkzZDJC?=
 =?utf-8?B?cTg1R2F6TVp1aFZ1UFZRei9zMERmMk1QSXovcGFOYUd6QUo2dG84d3hBdjRN?=
 =?utf-8?B?RW84by9FNkV0RWtFOHoyYTJhdDF5YnlhUDBzUFFZNUZlcEpsVkFMQ1l2dTZx?=
 =?utf-8?B?VW5lbm9XODRDbzkyUVYzN2dIZnBkd2daVWFLY2loSXV2OFY2NUdIS3ZtUEJy?=
 =?utf-8?B?cFZiUm94R2l5UXExTGFUNFpYR0pkY2FMaVBPYlJzb0Y3Wi9HeU05cDIxTHBv?=
 =?utf-8?B?VUIzNzZ0aTNQdDR3bE9kV01sV0M2czdpSEVabUFkcGVuYlRNZmt6RE04d210?=
 =?utf-8?B?aDhUR2tLTXN2dno4ZXo2cnJXVDJOb3dKL083MHBCU0xnQTBXVEc5MGUvdTVj?=
 =?utf-8?B?NnM2WkNlTStydksxbVZiTnlOK1g1ZUZCSlQrVkZSdDJVQzdIZ0R3YUV5c29p?=
 =?utf-8?B?TitJVjRuOE5iYnpqVDV3UXVmanYrWTdNNkd4cGdwamt5dFJmSWNDRjQwS0cy?=
 =?utf-8?B?amlVUVMvOFp6ajExRXQxY1h4cENvSnZFbjVSd1ZBUGJZM25GeGYxVzVOcEQv?=
 =?utf-8?B?TGlhL0swZGpFN3k3aCsrOGlqNGQyT3dIOVBHc05XcURLc3dBVFpUSTFCcE9C?=
 =?utf-8?B?T0g0TGVsSHFQYTZoVThRSXZXWHN5TTJSTm5ZbHh1d2dRRFQ4M1JBQ1Rxancx?=
 =?utf-8?B?bnRaQ1Fsanc5WHQ1Mm9LNTZuVDlZYUE3enZTSDQ4bEJRUm1BanViMEZ6cFlr?=
 =?utf-8?B?YmR1Q0dRYzBLY25JdnRIWlhHZzhUZkZwQkN3bXRoWXBRTlRMeTNKS2NqaGhk?=
 =?utf-8?B?cjQ1ZzFJRS9TYXFxMjdRTTkyL21nOEYvSXhMd3BLcnBoTU1QUjhWYkhsRW1T?=
 =?utf-8?B?RHpUeDV4QkZ0NzRLSElEU1JwRnN2V3o3Y1paeHJsNE53WXNlcEZ2Q2QxK2Zx?=
 =?utf-8?B?ZDdPSmdoZ0dwd3RPTmsvOCswTlJaUmZ0MjM3SXBMZkFEcDBoWlRLWFBmbWlY?=
 =?utf-8?B?WW83aTkwSFNFSTJ0c0Z2RjVtUWRDQTM4TmRscnVUdm9kb0cwaXFtV1VQYWps?=
 =?utf-8?B?NTVVNm5WWitDVjNnUWJ6ZXY5cXJpK0xBU3hIdGZINjFmTXFwRGh6eVF0QUww?=
 =?utf-8?B?d2hFcllqRmRWMW1PbDJXeS9sQ1NxdlZqeE84V2lmU3NKa3JZUUE3QTBVSmdL?=
 =?utf-8?B?QzhoRldqdDdYVmcvc21YSHEwL1Rmd3VFMlBSKzdNcEN4ZGs2Qjd4cnZCN3Bl?=
 =?utf-8?Q?gXLVnx525PvfERy9bgb/FKIin?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47857c0-a848-45dd-029f-08dbce4ff6cc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:58:24.2473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyIU+DDvrfRUPItagq6hEUg/wIH74EiveM2VSzGiT/JVCsFtUv5PUqfRUhBC7uFEuoBR14EreHB3Mw5+9tCitg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7680

On 16.10.2023 15:00, Roger Pau Monné wrote:
> On Mon, Oct 16, 2023 at 02:35:44PM +0200, Jan Beulich wrote:
>> On 06.10.2023 15:00, Roger Pau Monne wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -1998,6 +1998,10 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>      {
>>>          struct vcpu_register_runstate_memory_area area;
>>>  
>>> +        rc = -ENOSYS;
>>> +        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
>>> +            break;
>>> +
>>>          rc = -EFAULT;
>>>          if ( copy_from_guest(&area.addr.p, arg, 1) )
>>>              break;
>>
>> ENOSYS is not correct here. EPERM, EACCES, or EOPNOTSUPP would all be more
>> correct.
> 
> I don't think so, common_vcpu_op() default case does return -ENOSYS,
> and the point of this path is to mimic the behavior of an hypervisor
> that doesn't have the hypercalls implemented, hence -ENOSYS is the
> correct behavior.

Besides that other ENOSYS being wrong too, I question such "mimic-ing".
Imo error codes should be the best representation of the real reason,
not be arbitrarily "made up".

Jan

