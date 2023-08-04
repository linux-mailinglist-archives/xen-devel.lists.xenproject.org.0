Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 700F776F9D8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576850.903461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnzm-0006bT-Dc; Fri, 04 Aug 2023 06:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576850.903461; Fri, 04 Aug 2023 06:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnzm-0006Ze-Ay; Fri, 04 Aug 2023 06:09:06 +0000
Received: by outflank-mailman (input) for mailman id 576850;
 Fri, 04 Aug 2023 06:09:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRnzl-0005ze-Gw
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:09:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69c19f88-328d-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 08:09:04 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 06:09:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:09:01 +0000
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
X-Inumbo-ID: 69c19f88-328d-11ee-b26a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvX/PiIT/n9WMVHXRKgP/fAdTfzLiPzqQnAwg6I2YuRGAsmBCqvaPJkqJ0JffHk/wzV7Uno74L64d6BEpQKU4i7Q8UfUU7v+fYsPY+H/uFA0vpjsnlFQDLc2rkkV/YtoRrIpAOghlcS+LG0kaQF+5ntmfp9/3LuIn8cDFOIB4rdTtlguyyJebYFMh/utAljyGr7ySfNa7mW6QZlYxZuoRyazM+O1t/0bLiC1Tf6+huAM3jThqL4YPPRJk6cBVGb99RGKqd9EpanKyV5mv7O+0V+pycfxC4XS4zWBTouGq4dRBqII0ILSrPtaU0yUGmcCFQq+2TCn7Q1fFymbFW5VgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kl6RWXn5uemkd7ASmE2X55x5oFAeTzP12gxwiwAjek=;
 b=cJiXg6n3czBBLkW2iObgOkT9OnaSdxKm7IHEso0Pnkdt7ALp/81m0tDPPm69ZnV8GefOBjh5Ah4A1vwLkSA8dwJCRiFBbL3+Qm1nthus/q7zyfgjDICvqG3pPrwfdZwR7FYlyLRAjZAJUYMjGtDvwNhy0NxjQZoxRiy7GRZHELQhWm9N2RLwjk6su+WHgY8aAHG5+IVICaan8kpmMnLNPuNABdUcscW5QfKmz96Cesik9+81TLYb6dHDJ6Umy615pG0z9004A4eJXlBGLFqEawefaQRShkyUsTv+03orfCIg10NyByOdklE4iaM/93hPa55ueJWKQKWVs/WrK8xmFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kl6RWXn5uemkd7ASmE2X55x5oFAeTzP12gxwiwAjek=;
 b=anxPElsUaRztEXyJINxqzMAzz8zGhj96bY8aS9Gcd2B0SvaUJjeqSWy4HJV4bFk94ZEttoa3aFcZZzXOh4RUpwinKVxYb4ALFiu2UvVX+VuIhXBaXsbMksrCEusR00MvdvEaNtJyTxYnfm11Zh2z5WnVP7weII/DalZ9InO/tMLmNjKPzaKsoDaY9mGUohXGMMBKaY43eYdfnCN1OMclaahU034bZXuM6sN3Yu362b1FtXhLckN9qtyAgVeFpt/XYv0c8ZIYdwu8qeCYQxcHYxfyJnk69zjgQmew+yanqzF3p1eHYQzeOFZrppj+MOzDC17G7ZLvEe0scu/uLt8ekQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dfd4e7b8-f994-f33b-d158-e698e8e8799a@suse.com>
Date: Fri, 4 Aug 2023 08:08:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: [PATCH v2 2/2] common: __u8 is history
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <652ef09f-3654-548a-37d7-bbc46cbda177@suse.com>
In-Reply-To: <652ef09f-3654-548a-37d7-bbc46cbda177@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9067:EE_
X-MS-Office365-Filtering-Correlation-Id: 4547ea30-f847-4196-b5d1-08db94b14c24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IuYf+6Y6kagyl28TrjhEr80LTPWKvhlSJX+S39SjgAWH24WgPdrl8r5KLsfqjfRA8HK/0wmlE3fE38l31bv2CCSh8kr/8HRjH9sxkB1Xe88xcYAvAspnWRbtL50qGUMBZLxcs7NRYFJs5xn095Cw01Oq+v8hK+vcbpD6436CjgpxPsaAt2u1hy1bP5e6n9XOtqpLf9DcCUi7kZW8JSCXVAgI4A4SvoPjaZBnj5+HbgAdGJgw+C25wWBsq1IgAvS7ClLkQfoAFYcnUptmkDtshvyHGrlGkBvuG/4Eq76eX2XJZK/Jys/93Ggq3T5J59XFidvoUV8T0pDJc6W6CILFZZYbmkUHhMdRiJ8/rYa5k5ffQHmS1CkIhC1xHgiqINaSlZdNli/IZuNB01t3/znN/ybEwylnjtRT02B7IwUNTHYrvFENq8g6u6hJ7KJvl0yTu+Fb6KRGtBMZEtlZifHPmYGmpaizybEWUgJ5tVTy81hEGiveM2F+l2Jto5G/JnOXqVRdhlvFYXutFfatNnQkw+zBCTaZcYgAphVgEU3RnG22E/x3D9OPxI7t6a33sxP3Cun0+Ms5PTnEVmieDujyRTf+9QV08ndqOhbJ9aq60/y0k6yFUdvDyGf9nNAD9dzz5m/Y46s25qCcYQoySeQ50A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199021)(1800799003)(186006)(2616005)(83380400001)(26005)(6506007)(8676002)(66556008)(316002)(2906002)(66946007)(5660300002)(66476007)(6916009)(4326008)(7416002)(41300700001)(8936002)(6486002)(6512007)(6666004)(4744005)(54906003)(478600001)(38100700002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDNJa3hWZzNxWnpNQU43OHgrTjlURUU2YUdZK21PWjlvQmhGZ1VtUC9Fc2Nm?=
 =?utf-8?B?YVl6eE05VzJXRTluaG91N2ttYzVNOGhvVUpEMU1HSTAxMEZocmdNUERyRW0r?=
 =?utf-8?B?RG1rbWx0SjN4UFBPYm1sNzRWMEEwaGZYRVVrdEN5MVFNL0h5UG9qazlmSjRJ?=
 =?utf-8?B?c1Y1YjBVUCtPMitGL29HODIybURDdzRBekhMWXZaNnowT1VSOWZ5SFp2Uita?=
 =?utf-8?B?QStoNy8weFpDQythYmpJUm5VbUVwUEhkNnc4dTJQclZXTmJBNDFlTzR2ZnZD?=
 =?utf-8?B?RkIvbmFWWVhFSmJTWXVzbDdIaklpSlQzR0VsWWplcDlyQ3ZjZFlTdXRUU0tv?=
 =?utf-8?B?K0tTUm9TYVM1RHpVRExRVXhrZUdVczZJVFVDbkFYR0xpWStnazJoR2REeUVK?=
 =?utf-8?B?c1RsSEJ5ZnBBdjU0VVU4SHpxekZQZ2RuTy9ZYlB5em56ZFlYSlBnbFNST3h4?=
 =?utf-8?B?Z2lMYjF3Z2FzYU5LbnROdnl5SE9XZ0dxUUVMZzlmSTlCT3FlZml1NHlYMWFv?=
 =?utf-8?B?SU9TZUpYYU1XZnlwT04wRU81d29xWVpuUDdTZ0RvdlhpWEdqWlpzL2VWS2Vi?=
 =?utf-8?B?cDFvNHpTZHBlZGZUY1JWZkZUVHJpKzlKYmtUT0FWZWVjcVc0Q2pCZ1FrZXpo?=
 =?utf-8?B?RzJNdi9TTE1EMzBWMzAxWWE1NTlHWUlrU3lkYXpBVVFnZkhxVHdpNjB4QTJJ?=
 =?utf-8?B?OGowdUlTeXJRd25hSnpFYTJJUGdiSm1lcDBVS3pKQ3FHSnNDbGc2UXUxSEo1?=
 =?utf-8?B?eXM2MFJzaEVMbWpvNEtCaWVsMEtZV3EyNWJWRTdkWGxDYWIyYUxKRUVqeTM2?=
 =?utf-8?B?aEE4WnFlR25IQmp6dlhNSS85NGJ1M2NvaUtQUWswdVJCWDhBdUxmamdqY1Z3?=
 =?utf-8?B?MDJKYStMWVVoUDZXZEs5eWI5ZDI1YkFpOFdSWHZKWlFrMDVOcjJjM2J2MnhG?=
 =?utf-8?B?VjJpNVhHWWpRYjQzcmhEWVZlUHNLTjBtSVpQN0kwelpNaXhLdnN6WkIyMWY5?=
 =?utf-8?B?MWFNUWF4RXZJbnlBSTZFOVhjYlp2b0M2Rzg0SklvaTltdEFzc25ubDNyT0NM?=
 =?utf-8?B?cGlqZ2lRQnZSa0NNNXF4QXRYQWthdFFhQzFWR3JFQmp2WmtBWUdJakN1bVJP?=
 =?utf-8?B?a0pyQ1RVb0QvUTc5WHdWaWxwb1ExN0NOOURrekF4T1hsb2RCb296TEJxTmlE?=
 =?utf-8?B?cCtMa3g4UWtPVFV1UFVUWDNvNFNaS3lkejUrT09OS2JGd1o0Zml0MnNRaWVC?=
 =?utf-8?B?Tm5JdzIyWUsxSUsrU1FRVHpNY3VTeGRwYUVmSDBOclVjVUZMazQ0NXJidmh6?=
 =?utf-8?B?Z2c1VEw2VDcrRUxxVDdRYTY2QmpZMjJXTUF1UndCWTFHd0xOUnUvWlZIMGFv?=
 =?utf-8?B?Q3kwa3plRXIyZ0FUSU5IMGVyK0dUMC9EQmFsWHlGMHpBU3N2VjMrNE9tUHg1?=
 =?utf-8?B?MnNEblppMmVCbTVESENqRjQ2dnB2TE5vbTgwVnFmbDJCenp1VW40eEU4REZz?=
 =?utf-8?B?akVrZHdiOGtsb25XakQwVkdTQURDaHNOZ1ZzS3M0WlprbzQ5K3FvTGk4dVBu?=
 =?utf-8?B?dm40ZDk2R08wMzNDSkNhSFFtN1V6WHN0YXJPeE5BaHNLU0FUZlF5RHVJNlRh?=
 =?utf-8?B?LzlYNVJ5eTNsTWtkaEUwb0V3YWMzS3RDOWhqWmFxOE45NW1rS2p5Tm9yNUhP?=
 =?utf-8?B?ZFFjR1pYMEZpMFJGY1dNbXNpZ2lCWjY5dWRzZk1Nenc1V1djWWN6S3A2UGhl?=
 =?utf-8?B?TUkwOTZjdGt3TUFlbnBFNFRBdFROUEVRRDRKbWEvMm8rMTlrT3Q0QzBldmc1?=
 =?utf-8?B?d3Y5dDZaMUdoV29aNGdHUTlhVVdrY2VVRE9VZ2k2MDZDTWFHbXBQK3dPWjFo?=
 =?utf-8?B?VFdIa1o1YzFXWmM5SU53cTlVMmw3Y25GK09zVy9oZ0s0WUxwRkQrU2UzcTZi?=
 =?utf-8?B?ZjBZcUpLUC94MUxNcDRtcXNlcEFoZzM1eThTTHFYVmVaQUNpWnRyMlNGbXdG?=
 =?utf-8?B?cEU2RkJoVEtYOFZGSzduMVUvSGs3RGFKNGFHUGt5TEFGM1gxRlFYTG9pS0pu?=
 =?utf-8?B?USt6ZnFHZ1VTWkNkU0xoSnlyV2NkdVZUQXcrL29Uc0hWNEV2cmRnYUgvUnh4?=
 =?utf-8?Q?zxeh9yKovNod16W55mDJ4Hd89?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4547ea30-f847-4196-b5d1-08db94b14c24
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:09:01.5550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDwcK2szC59YV0gKoJFdEIHEjEdE3JRm/6WGzMtI+CKx+q3pUu0Qw8D7AUgDjkLNa04xwkvG7cTi/hrY71Y+qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9067

With the last uses gone, move the type to linux-compat.h.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
The primary use of __u{16,32,64} is in the byte-order headers. Iirc
there is a series re-working part of that, so I guess before touching
the logic there that other series would better land first.

--- a/xen/include/xen/linux-compat.h
+++ b/xen/include/xen/linux-compat.h
@@ -12,6 +12,7 @@
 #include <xen/types.h>
 
 typedef int8_t  __s8;
+typedef uint8_t __u8;
 typedef int16_t __s16;
 typedef int32_t __s32;
 typedef int64_t __s64;
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -6,7 +6,7 @@
 
 /* Linux inherited types which are being phased out */
 typedef int8_t s8;
-typedef uint8_t u8, __u8;
+typedef uint8_t u8;
 typedef int16_t s16;
 typedef uint16_t u16, __u16;
 typedef int32_t s32;


