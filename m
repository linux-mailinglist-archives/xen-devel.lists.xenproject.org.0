Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950DA7A4895
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 13:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603969.941141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiCbE-00079V-89; Mon, 18 Sep 2023 11:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603969.941141; Mon, 18 Sep 2023 11:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiCbE-00077i-5Q; Mon, 18 Sep 2023 11:39:32 +0000
Received: by outflank-mailman (input) for mailman id 603969;
 Mon, 18 Sep 2023 11:39:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiCbC-000766-NP
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 11:39:30 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe13::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 077a22b6-5618-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 13:39:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7252.eurprd04.prod.outlook.com (2603:10a6:20b:1da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 11:39:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 11:39:28 +0000
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
X-Inumbo-ID: 077a22b6-5618-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vxe2oc6nrinudmoHSweKhU8Yz6tTKMFdRnrOPJ3QwBU947/U/ER79yRslefRioRhKACEBeLamwHyCjZ8OwRSI7zuBheopcJmms4hs5DWSgmWpgZYM/vHa4aAQNDZ+U+mlg32Zrn0ywEXCltAWTxdQa2e0GjmNb671EDFukXk6KE2RTVCNifvQKbtWhZJweR/ShrDG4+pHSR1vi/GA5kAU7lLEskE1RXO8cxR3GqVq4xZ9trVCarxcRJJSkFRkwFwFG6lzYf8d+4QMh0P1lEHI1Y0UrLtoCcv8ri9z1gazBWum9pWrmyYSJ4QpEElOTC9YQLPaRzNf/XtMDwSYj7dBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7IJPx1HGFMhf3BOkeVsGK62ciu/3IBNwa9AVeFARr0=;
 b=BJPy6RiV+fjcWIlVqbcDvacRPtcFFcAoo5FGhiSP4Qn7E4GO0rKJUOG3Ym2t9NscWOrFxdsYk+NEnERLp2b5RWaxYb+IvVg4QRGlB4f8oqbw3pIPzhpi4U5BgkzI7+isP1mCt37idk7zBxe328qyCSVx2pYyfMC2l/h0hws5PLl7NWZ9zh1y1P1rPAQfedIp+17/yPRE46yfcCdWdEH6W9Y8HLn3uNJx5gGscNmie6CFUyinVR0y8rBLdXtgTIyyK1RXnmfuJG0zaSdsCFNDfncdJPL0r1Lwn4nrLfJXJubpwl74sx5neW1PB5g3AQU402OQUvqD1eO4gfXKxE0NAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7IJPx1HGFMhf3BOkeVsGK62ciu/3IBNwa9AVeFARr0=;
 b=k3+VLCG/zMHvKXJ9ji0whWVJ3Jk/Ky5Id3dafZPcWHsxiZvxk43+DoEFgwKN86KBiIxn8GVHJ9yrWAaevox+9GndVzUZ+QzA0i75hXyR1HugbJZGcSCzuXIPnoIsCMhXbC7BasjCKKAivaBn48K/ZkFsfHwEsIiaciHXHQ4vNhoqwggXgd49fD3CKyBhb5V+B6Pn46r/IHf4D0Gaori68VqJtcsGTD1AgRN/uDFN+nQeJDrWgoKOOyELMh0FROLXjyeO9XH0OwPxFWHRio8oH1EHgjuZNU9YM+7kwk3yInXSNZeiUfDIUDO8RFhclfxK9d+d2Xff+rbu90eNqXR2FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01233c16-647d-7acb-cee2-55d6669a35cb@suse.com>
Date: Mon, 18 Sep 2023 13:39:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 6/7] x86: Extend x86_event with a pending_dbg field
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230915203628.837732-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 2637dc5a-7b22-41a8-4eb5-08dbb83beaaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5pIiEYYgtOe+MARIlcTSBQDQ72n7fxJ9Ca9yZQ3w8KvwU1p936WbCM+6cBNVp9wnlyZhWQFPO9Ws3h+eleSNN4PXMm0LCBU4GzlBURShm1BobNNqp33bsjUTKuMEYitysRxG8CgzoZ3U+mR6KNT3wWHWXJojIHNgGx9CtbDybjmSiA4AZmiLLMBKK0QnQ0PgiWOJQiY2s4l80Cm/nitJjA69vSM3V0ObIR+ZCtx70E/brcYL6LKHt2lVmokOqKZjdX2+gKWLoXBb04xP6WHNmfdN1kYQMG3itY78IxTXU+GEvBZFEcAXpNhx5uoxty0KrZxcG9y8BWG2jftd19VF/Q2Xq6+355KiW6tdbXBXS9ilhSYuJAyc5ao443mYPsrbPVEz3Rg71rt5ANHtqQx4Z/g4JDOAnQSiNp8p3pgsFjj7Qhw/3BVG+ntvfxG/DH8hd66UpVw+lzOZDZfJFd5UGEUN6dIKD/kNEuWbX1UD9pfpRCeU7u3v8H52wC1Ua1fZzoQDOH+DzSyj4HdHkk5WbifjX96oGilIb1LcVDk/C8Etp9mlxa/yEWeBu6MB+R19jrELnpIfwHj0glP/icJVIqVEuGBBxyu52od+IDGbdKU5ylnzBswP2gQHXwGBPBR7+svQdYYmh25Z5bEo/hsf8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(39860400002)(396003)(346002)(1800799009)(186009)(451199024)(31686004)(478600001)(6506007)(6486002)(316002)(6512007)(2906002)(2616005)(36756003)(53546011)(4744005)(26005)(31696002)(86362001)(38100700002)(8936002)(4326008)(8676002)(41300700001)(5660300002)(54906003)(6916009)(66556008)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXI2ek82S0lNN2thM2s4VzhBZ1BnaFFFV2tNcnN2Qk43cFlPUExNdGtaM0RY?=
 =?utf-8?B?anhPVTVvbFZLYnJIUjZkdi82Z3lCWW4zeVF0bkNONHkxeEVINVcyN1lUWDI3?=
 =?utf-8?B?WTBFcmpPUVlMSm1may9vU2dUbjFwMm5IY0M4S0QrS0RubnE0UnQ3bGxHcENy?=
 =?utf-8?B?VDh0VUJyNENWZHRscndYRGdMQ3FvSEJ4d1lpdXczY1pKOVlGdnpWTEUyaXp2?=
 =?utf-8?B?QzF2WCtuaG5kakRLclFiOUd1ZXdOaWJIYmowS3QxajBlb3hMRHpVVWJPeU9s?=
 =?utf-8?B?YWVheGNpVDJMWlJJckczbnhBTWNvM2VKZVQ4aklHS3Z2T2VtZjEyWitibUpO?=
 =?utf-8?B?MFNyZ0djVXdyRVlIUVM3VXJ6V0tjS3o4N3VqM2Z2VEVuT2VnVW1xOEF2T1Zl?=
 =?utf-8?B?WXVwenQ5ZXJxdFBwaFB1MVIzRXd5M0Noa1B3djJGcEY5c2habHJqVWVpSXJq?=
 =?utf-8?B?NDhJRVpqV1g3MExoM3RSRUpwaFlPemtIVzVYelUxSGVKMzJRTHZhSTFkNGpw?=
 =?utf-8?B?ZnRUTXdlc0R0Mm52di9NbFJTbENxQ081THovVjYxbVhZdWNoSkZoNG5HSU8v?=
 =?utf-8?B?KzYwRG9Wd2dRVW9XQWpKNll6QWpZeEtLcnBCdFV3WTZheGx5ZXdZOFJ2NXVm?=
 =?utf-8?B?MGU0dmRidE1ZM25acGlRaXJHVWtIeDV2UVJ1OFAvRDBpM2lzaStEU2phNG5H?=
 =?utf-8?B?RHFObGRkLzZOL1RvTG12QktvbDdtU3VDQUd2cGhWNzhlRWZjdE82bktmTlhh?=
 =?utf-8?B?T25jdXQ3QXlVam5HWXhFc0JyREZXbWNNL3cyRmtEeXRweTFxbzlQRFc0dWJ5?=
 =?utf-8?B?SFA5VDV5dWd1VmplTDlTeDgxV2o4M3pDemxScE96cGZ4UHNxMTFGblZqWndB?=
 =?utf-8?B?NG9Xem1qWTVGTkRYRlpaY3NCbU9TYzJidys2R0JTYXB5T3Q5SzZtTjA2RWIy?=
 =?utf-8?B?d3Ftbm1sbUk1VkNCcjU0YS9pYlpLR3piL0p3UVNTM3A5V0l0ZmVIVHBtQWJF?=
 =?utf-8?B?TGRHV3p0RXI4OGgvdnB1akkzT1Y0Z2xDeUN0aENZM0FCU3NHWnNBZmkvS3pk?=
 =?utf-8?B?MWdLNVNqbHBlUEJickkwdEQySHRWV2tjS0R1UUtmUHBtQ0dPaDZkTDdjWDFm?=
 =?utf-8?B?MWhWMFoxZUdlcjdYdDhUdXROb2tJU2d2TFdoRENuS2lGbTJvVS9KMVo0YW1L?=
 =?utf-8?B?WHZZUlhPeTlJT3o0dTlZUVZKVTF3alRmcG41dlFTZ2lYNzRweU9JWjhoZkE0?=
 =?utf-8?B?UGxpUG9wZmxSWXIvOUE1QWVMdnk3R0J0Tk9CaTE5R1NLTHRRODNZa0ZpUzFH?=
 =?utf-8?B?eUY4eThYN3Z5bHd0VkU2TXJ6SUFDNzBYam9OTHo3S1AwRWF4a2VkeTJhVVF0?=
 =?utf-8?B?S1ZCZEduSkMzcE1zOWMzRnhGR093ekhreEYrZS9BeW9ZWlJqUER2czdXTVB2?=
 =?utf-8?B?NjRqaXZ3ZHAvRDhwTEo5dUd5ZVdZdExsTk9jeUY5aU1QU1dJUFhCRndHTFE0?=
 =?utf-8?B?ZGRuQlQrUjE1VWNENEgzQVNWYmtSRUtjZ1lxZ3BMeHZLZjIxYThVU3BYU3JJ?=
 =?utf-8?B?UWN1QlFRdjVCQngwQXl2VmF6ZjRMMjZBYXhpYlpZNDZGcUQwdjhrenViMzgx?=
 =?utf-8?B?VDh6ZDJVR3lxb3BIUndmZ3BDb243T1J1d3hjNUJLNFRXYjBLTytoSmdJbkgy?=
 =?utf-8?B?S01FR2xiOEFYRFpuN1ZQNnBEaGd0RWswbHhHdVhmWnRlaWpuVmh0ZzA0ZXI4?=
 =?utf-8?B?aEZseXlWOEhFSzhGY1drdC9GSkhoL2MrVG5MY1BDYXNNK1hPMVRTTkVRTzFh?=
 =?utf-8?B?V1BpdEk2a1ZCbEtqUzBNbTVCUjFYajZ0eFFJTGtQVGZOdU1xU2NXWXFOa09C?=
 =?utf-8?B?T1pVVFQwUVhMVkpYaHJEOEJlUDkyaytwRjNabk1mY0djNHh6TVhhcWZPY1dR?=
 =?utf-8?B?c011OEVobDlyZ3NkWHpFTDc2TlA3bkFvSEVmOGd4aGowMEpra2lpaE1ESWRJ?=
 =?utf-8?B?OUpBQk9PSmI4VVo2dEVCcDhvaVdxdXlqQ0dUVGZDRHdkdlZjZVRnQVZ6SmNu?=
 =?utf-8?B?TlpYV2J5QUpaVFVPNG5oRzJ0ZVNzMDVlK3NTZFc2WW9sWGQ5NWpRQzVrck11?=
 =?utf-8?Q?ujORROH+7B/v+O5JGqmXwEvhp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2637dc5a-7b22-41a8-4eb5-08dbb83beaaf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 11:39:28.4443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qt2SQNqjO/3ZSnpoB4+E3VuamVGbM/AP3/iNjYssIEY9oR23uYqfr/HprDzLOglu9B1m5yZ1brbzqvViFxCsgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7252

On 15.09.2023 22:36, Andrew Cooper wrote:
> ... using the Intel VMCS PENDING_DBG semantics, and sharing storage with cr2.
> 
> This requires working around anonymous union bugs in obsolete versions of GCC,
> which in turn needs to drop unnecessary const qualifiers.
> 
> Also introduce a pv_inject_DB() wrapper use this field nicely.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



