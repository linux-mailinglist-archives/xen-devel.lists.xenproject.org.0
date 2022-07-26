Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AAB5814CB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 16:08:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375338.607654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGLDy-0003MB-Ay; Tue, 26 Jul 2022 14:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375338.607654; Tue, 26 Jul 2022 14:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGLDy-0003KI-82; Tue, 26 Jul 2022 14:07:50 +0000
Received: by outflank-mailman (input) for mailman id 375338;
 Tue, 26 Jul 2022 14:07:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGLDx-0003KC-AJ
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 14:07:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60086.outbound.protection.outlook.com [40.107.6.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53ab2cb8-0cec-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 16:07:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8622.eurprd04.prod.outlook.com (2603:10a6:102:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 14:07:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 14:07:46 +0000
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
X-Inumbo-ID: 53ab2cb8-0cec-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adJStU0tLH5qmVz3ZhMRM0tAkKcE9dd4tUs9v8Lk8hb3ARax2xCOFPt8VCmhFDPrDgEgjTpyNFFbwMXnELB80JvwrHtxq45q7YaQgihU8h19GCfUnZc7FdpO5vW7ywu4lz3i5omhuMN9NTh6OL3Fr8mYjm13KjD8Pib6X++dn8xhYExib0XJjRcCNPfDZAwFUj75fzvRyb+FKLbYkysvVXTFAWTfgOjmYAKOmPAyEfAXP7vUnWgJG1GK+w8ykrgsc/Ti+ySSR38O5XMUmt2b9c1lQWUAjQx0EzmJFsbkWHNR4W9l5OzyIZQOxxQa2kbobV86XQBXdVRW01sCwT543w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtkIvKUFpUIzCJWUNG3vj5IkWmPNXnF1JPbQ5cZR1ig=;
 b=RaiOOgcBypuUqLnrnwodFhcLFSQLN2eT7aGATLOoQt88HKK/teCb3Y/t+pjp3HWEMQRNin0rVJvvvPtdP3bmRmklryNrtM4evp3prLGVSHZKt/Kvoar6bWr2igNcifryBLKK/V5WYdl0Hjrs/h4+SQNm3HKUwNaT5ZHkenmWKLO2+prhudV/jA5GPS+m+uAUbmxqHkt4IEvRHQKX13eX/eLQ+Z2kmuiGaZj8OuatlONn6Umy5iLliuP39gHkArWBYLs5ovJHmRfkXgMtwCewU/eQuIIs2BROyxkeyAnQAx7Eb9sVwOXRHL22OjSazCdekrpgLjyV5b1kTPw9m1GpGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtkIvKUFpUIzCJWUNG3vj5IkWmPNXnF1JPbQ5cZR1ig=;
 b=RuMcdzhtjBll2u3fH7WxVtyFB3+I3k+Y7J79OkUrwXkfI0TciL5Ep+7Zx1D1Z9VfTN9fJ6TI6Oh1FFwBHaI/maUPPcOcQMBrgAEO9K2gHxcpBoXW5hJhHMpAiU7V8py5n0ZXvQ4tYU95UQMS4TAeQBfojzNPAxQjb858WzVaopopbOQu0X6LbQVpqstItMqzvpIdQyJAOZg94M13ccAjiCXmUBrg/af/6Z6MnQcWrlmZAVcMFW92PWilIa6DYSuBEWRNGoQfXMbRFQG1+yYzZo9qOmtxPEkEvU6prdavLekS9xFYmDXiwlMQilg57AjLP2/Iq9phkX6fSnKgdOQQ/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <924ecfef-c9a0-b56c-f403-c4014e84d9d5@suse.com>
Date: Tue, 26 Jul 2022 16:07:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86/tboot: Drop mfn_in_guarded_stack()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220726122521.16091-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220726122521.16091-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44747734-ccd8-4de1-7968-08da6f1036fc
X-MS-TrafficTypeDiagnostic: PAXPR04MB8622:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WZ2qwqY+kwrdas1sC5FcEpEpCJ/MR9gyuF2uvSUhUTab15qC9AawbzTh4T/tIQt8PgMCuSfAsjatplgmdnanepB56vXIZw7Yhx1JMvasLRvB9vivyYxch54Y8DxU5Ki7YfzvN8gu3mUWSZ0RovJDFEV6VKLKWWTm15skgGlAm2hUMznjh4XylVXr/I0WAYAC4qEuPMqtkuSBfbsfxDuuYIF9DiglWxwBvdK3TjBXGOYOsFR7L7xg7dutd3dRhii9Gi08Rar7H8cN9+5Ip1oMCreV9yPFfumfExTWKM6ZiA69194negfo6+1PtqODPUOF2mshjxWcLU1tWYO/+9hjIe1PA/AiyWBTqh17L/2i9JPo2XIkVj7+59LUPMhJ7/2by3UnwuLAOPy3l2rgRwVRnSrZqOdvr+iTduubsnbWC4Ez+fiyUbpyQzyk7Hh8XBvZ5llLgPVNqfmIt5U1rrp8CP2UrYbbNCUKzBq4TvQKcfmscQOzenH+lASdAq07XFjiBv2BCPW79sZMAOMu62nage2TK+ZfbiuNWpcP27twLOdBVK4UDOVctgYXub0IKwEtxIkkSMLk73Qy8YKag60/3+ib2VkulCF+sp7jL2E8uLQS4xuvI/XHIW2Z02sLw4rfDn3Q0sOJ7Xh1Qcex4ByvcD/kGSSpva7hnUP/IuMHvfi0UjNO8YtardxvbTng9ujgO/+yx215/oXgyWMu0Mpnh1IE73G78e0s8c1q/u6f7Gmz32Xwl3A2+V+N5XuoMOFdqtN2T6bLsoQfFY6nNX9g4y5lh5r3vRD1qEqiJUyeP9Fajn910ZJcdwPr2CGxIZwSDXh8G1LqgqB5ITewNjZl3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(39860400002)(396003)(366004)(86362001)(38100700002)(31696002)(6486002)(8936002)(4744005)(478600001)(5660300002)(316002)(2906002)(8676002)(66476007)(66946007)(54906003)(66556008)(6916009)(4326008)(2616005)(186003)(6512007)(53546011)(41300700001)(26005)(36756003)(31686004)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWFqcnJXMysvTXhRTHpxcko4Y0R6YjZXN2pHVi9BcFpMdW5qZVkrUG1vUlY5?=
 =?utf-8?B?d2ZGdEYzRFRWVzJaMDF1eTZlYWx0QnVSdXRoS3B6WEFNMFc4dWFkbm9GNFBw?=
 =?utf-8?B?eTVXb2NaMkowL1FEOHJZdFNjTG9HaGlydUU1bDJrMmplVTQ4VmJuYjBzaEN0?=
 =?utf-8?B?bkgwQXlqemFjcG9DeWxVeTVnMkx5TWRwMWFUK3UxTlgxYXRjbkxSdHgyZURo?=
 =?utf-8?B?MXdBN2dLcjY0ZmlNQUw5ZG9sRHkxYWtTYkFiYVRUaXRxbFk0SkJ5T1RkclB1?=
 =?utf-8?B?d3daSEx0Tmtsb0w4M0x5ZmZVaDV3c0FvYXYwMGQ2cjUzdDl5dmtDZitFeFJU?=
 =?utf-8?B?Y3hpZ3pzWUxQdkNQV2M1ZVFHVG9JT1FZQW9vTnEza01uK0wvWUk4aEgwcUk0?=
 =?utf-8?B?UWZidkhnRDJ2b2NUbkxralhXZHloYVhIeGdRaitWNTQ3ajhCTEVxUEtmQXBK?=
 =?utf-8?B?eG9rMllieW1OWXZqblpzYVZLUGZJalFTNS85NlliMGU1RWt2TVFiSENwRnlC?=
 =?utf-8?B?cTFsTU9hYXJvOTRtRElhMTlyUWxIV1g2SEhkYmg3cHM0OXVXeU91THh3dFU4?=
 =?utf-8?B?RVRBcGNUR2lESVY3Um5wZjlycTQ2QmJIM3VMaTBJbzkvNmp5S05YQVV2bUNU?=
 =?utf-8?B?TVU3MmtlaHdDc3ZWNzRZaWNmeWR2SEpSMmt6WGEzSHowVi9zd05qK2M5dmZ5?=
 =?utf-8?B?bGEvV0hwNCtwalFFNzNRcDVaTUwyQ2t3RitoMlJZMlZsOEJXWU9Ca1pYS0FH?=
 =?utf-8?B?VHpkK3R4V2d4NnpURllQN3FsNXcyQUxCRFU3MVBMWmlhQnZpK0FNVmI5dnZO?=
 =?utf-8?B?VUdZUlZTcTYzYTRpVlVoOXhoVVo2bUhaOHh5QUdIdjhTWnA5N1Z1Sm9YVnQ3?=
 =?utf-8?B?Q3ZUaFVrS0FuUUxBOTNnR25NV2NXTEh6Y3NVSHlvNmNqR0lNbCtLOVVla09S?=
 =?utf-8?B?RUwxVWtQZkJkdEZHTDZ0cnlwbW96RzBDc1M0djc3bVNOVDNPNURBT2hJRk9r?=
 =?utf-8?B?NHdEa3grUXYzbTMwVXdNZFdnRGFXNzVoUk94cTl5WUFHUERlVmpXTnRyU2tu?=
 =?utf-8?B?SCtSNlNrc1JTenNQZno1Ukt0TjB2MjhZS21EN1owQzZxZXg5RnB1VHIzUmgv?=
 =?utf-8?B?a0RmdmIvcXpqSTB4ODVpUkVmVlYrNFphTndUNWN2ZFp3Q2JneDhMekpVMmQw?=
 =?utf-8?B?N2hkRWp2L0grWGZIbCtqTExIdzdiSUtKVWh2MzdpSklLd1Z5cjJ5aW5wWHZG?=
 =?utf-8?B?Vlg4WjhqU1RJbThrejE0dGNJYWhiZnVIck5rMHNwWmIwRU9wQ2ZWQ3RNSzFp?=
 =?utf-8?B?a0lKOEsrRG1sTFUxRE54R0ZGSUU2YjdwY3pRQjUrTVY4dXMvZ3lqY1FnT21s?=
 =?utf-8?B?OCtvWkxzQkl3L3BTSnJ1eFB6ZG5kMHNlYXdPdlFHa1c1VkF5YkFtM2ZNNWY4?=
 =?utf-8?B?OEIxb29ZWm9QbzJXcDl5T21XeE5PYkx1NHhzeVlXTkgvK1VnMU5ZRkdVQUxx?=
 =?utf-8?B?MUp0MDVFYXRFZHdibkJaZ2M1Qjh6V0Z0a2txTzZQRlZXUGNtYi9IQzQrWnlp?=
 =?utf-8?B?TUExaGV4MkRsRVN0Mk9lSWQ5OEcwTEplVW4yWkdTanhpSEhCWDh4K29yNzhr?=
 =?utf-8?B?enFLRVptNkJ5ZE1oYTlEYTBLRk9jM01MVFVrUlR1dXlTQXI3Q1VLanFMWEEv?=
 =?utf-8?B?eWxaSzFvYXp1V01JblF0UTFZZk5CSnYzZkhBbGxEcXZCSjQyaVNMRGw5elg1?=
 =?utf-8?B?ZENrOTA4Y1lXYWk3cmdMVXEyMVdJckJ5T1RHZVpNTzZYME1VT1pack44SVJk?=
 =?utf-8?B?Q2tlY1NrUGdhcjRMYWt3bmVGaTl0SjVuNkc3QTVuNGtMSWFJNkZ0aVAzNUhr?=
 =?utf-8?B?d1c1QzcrRmo4RFFONlFFZnVrRC9LNE5adWxkclRRT0JuaHJmMUtYcm1Sa3FZ?=
 =?utf-8?B?OWtBdVFwSFRtS09TaFlPN2pxUXNpZUZwanhNR2hkZk81YUttNldLRVZvZmtn?=
 =?utf-8?B?bGU3K1ZrOVo3RDRaTDRZRGgrUUVwQVhZTUtqaUJmUVFRMG5RSDkyR3c3bVQ2?=
 =?utf-8?B?aWhlcnVwZkQyV3hwRzlwVENJWEIwRGVjT1lKUDFDcy9kRmFHNXduMndRaTRP?=
 =?utf-8?Q?JCO7e3MKtXKpHK6Ypj0nDoylH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44747734-ccd8-4de1-7968-08da6f1036fc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 14:07:46.0740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: di/MZ0ewAgaGg/zBUQBAwEH12SiIKs/RY9HNNwfhChTpfUscUWP3TEDyTCs3V1YlTW2Hv12/DRKgiD1fe2N3xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8622

On 26.07.2022 14:25, Andrew Cooper wrote:
> To support CET Shadow Stacks, guard pages changed from being holes to being
> read-only.  As such, they can be read.
> 
> Moreover, they should be included in the integrity check.

As long as they're non-present mappings, I don't think they should be
included here, so - not being a native speaker - I'm not sure about
"moreover".

> Fixes: 60016604739b ("x86/shstk: Rework the stack layout to support shadow stacks")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

You should have included the three TXT reviewers: I would have been
curious who, if anyone, would actually have responded.

Jan

