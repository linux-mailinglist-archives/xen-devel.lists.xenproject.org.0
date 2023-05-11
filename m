Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D27DC6FF10B
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 14:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533321.829874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px544-0000RY-8V; Thu, 11 May 2023 12:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533321.829874; Thu, 11 May 2023 12:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px544-0000P9-4t; Thu, 11 May 2023 12:06:32 +0000
Received: by outflank-mailman (input) for mailman id 533321;
 Thu, 11 May 2023 12:06:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px542-0000KI-C4
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 12:06:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 426e7a90-eff4-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 14:06:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7072.eurprd04.prod.outlook.com (2603:10a6:800:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 12:06:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 12:06:27 +0000
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
X-Inumbo-ID: 426e7a90-eff4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9rNuV6oyWbE2uBeBsPkTsuA1LQEhfWPJGlfDdTG+eCc4nFJ9IvPLhcjAyF9hOdhwjxn+NG1VLa8NvE4YyNAtD396e3nBBDGkXgDcPzrse7LzbcRk8/1NgzVSy8cX+L8zXbvMbhNJ0VPxSjk3bOTht9crGPsxjket+YvozCZav5xMzfSyOMZKoJTCi82lqOzukmKIGyliK8SbA+NjuMaNgOsWUujjVrrrvqv2Vq0ssj8wtZYEzu3ijpSYklIXwIwhXHJxIdtRHLf0b5PZdiOFqJ6GQadFluIrXLoM4cY50wK94dvB1g9hfMrqYIbGVz0so8YcRyw9cU0QO5X8FZDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKCZe8aIk+i5ppy7aKMs7dwLZsehuRpn4OGEOjQsCn8=;
 b=VP0tD1NzrJa8S6aWmgsv/IJZj5kG0/rQ3LkhxYSLZ3RABWGyBqpazCta2KweHVmHklcOf5jw5uBzwRXFko5vlbr1GT0zeg1DLDYTGDkTovPETsSxclUfa9TEPlzDTTHJaUJdImimJNlrrabzMIIsFbF2mVoa8saYmdlqQO/VESQrqrUjeWO52mSPMdH6Lhj0hbZWDyCfy694ukj1KixHmnZRJVPWa5ZD70KJm95h+bJbJolHyzr50TFcHNqAFzuUSjMAHtcP/9F3HLeaqP4zcp9eY2wOdMmop3WCZD5955oh4Q55W2gi9O/XTMLuYgrQtS8d4kVmaJ1ID1Oc80NyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKCZe8aIk+i5ppy7aKMs7dwLZsehuRpn4OGEOjQsCn8=;
 b=L8OXzxY91fz/m6MhXXbcOq7WdAXBqT5zMoJkmBOg53zoH1KW4xP2Y/g1Ria0APjRjaAJv795aDcCnhVxu86eiXC7/ygIe9mYc3EUYjSnju8wo91yLgMNlAiviYxEErC4sXtb+NksoywKOEyAaBTATghK//yjXph8Thj9i5n/2ICbTfINUFWPiEf1vqrCfl0LWy1bTQJoHNMKGQiodbsubX8c1UqaFDrEei0WLEdzItz4PAzObQKWRmMKmlnLbloY9Dce18o3BHgJiEasCyF3t8Fgf6kLDxG97KanDXszvvpdaGpuqNVVgXckUsuvudEfL8b9wuDp25LnoNlfCU+POA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f0c67b05-c4d8-c588-d2de-e98dc819491c@suse.com>
Date: Thu, 11 May 2023 14:06:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH 3/7] x86/PVH: deny Dom0 access to the ISA DMA controller
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
In-Reply-To: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: de9a531f-cd8d-43a3-9e1f-08db521825d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YBmn72Z+88o0bYT92PouPSfxs2iuuPRfekHVGWd7ri6Eg7N/7RfG5m5/Jy01klu+sFGO0uc24lBNfD+ID2kKQJnfgcEYIiDZJ/RCsHfMubQBm//tiRGbSpKu+tPkkBkJMQ7yQeYQrEVkHZapWB5IV4lvHF9UtoJVFsFgOu5Uw88w6qLCobOu/03LAQbmhhz9E0UeN7rZ085tMJUT+rlRWJipUvn1RJDVUC+X0QgBaXqMJBXYuDENea26tkOZBPiN369t0GlFDPnZB2EtT0Y8+6utLlSAGpAV43yvrKaNpNxJCX/eZf2e/yzy8fVNilpPFLkhMYHIZO7bj0k+WJYzdZFHAAOzADsKwJqU1eos/SkYx4keRyjt3uI8UIocJpbflOJpTLedKvfgPpdLNdrTOLJCNRd/kZxdp43KpFvHDwy7PDt4JhplzfLZSto2JYjwMvgSZNSQkH1Crpe1MEHd3KQMMEC9A+Zsumeyegc44n6LF3K0yCCJKhXgBiu4RvOyorhDerB2SB/KtglrlZaJrqIZz2fTFEfBhSH6zPSWFUou8uo8KRhPRHly5yITPtNYEjvoXLO4TxqvBLKoelZYV2cwz3eAI7v/LEbBOxrrBSJdur1JKPVx+Cmc0EWY5xFjRLqoJjxs/GOljdIGOIW5m7gYBPeN00vfoxOrsV9+5sc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199021)(31686004)(36756003)(2906002)(41300700001)(86362001)(38100700002)(8676002)(31696002)(5660300002)(8936002)(4326008)(316002)(83380400001)(478600001)(66946007)(6506007)(6916009)(186003)(6486002)(66476007)(66556008)(26005)(54906003)(6512007)(2616005)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWl2RXdYZ2o5R1RFcnNmQnh3Z0pKaFNvc2ovQWRwQlI1dGVvVTliZzlpMGdm?=
 =?utf-8?B?K3R0aDErbTZlN0VEazBPS21Kam1WQlFPNlZUK3hrWENqdWRWRC9ySUIyRU9K?=
 =?utf-8?B?MEs3c3RjZC9PNWZUL0Y0UGJaSW0vZ2s0V1BDTXJ5T2ZOTDF2M28vZ2xIOUlx?=
 =?utf-8?B?K2RMNkcxckZoS252NlBRYUJrc2xTVURSTHY2QVhPLzd4OWhCekVvbE5NUmhu?=
 =?utf-8?B?bGZQTnZ3VFFvK1R1MlYzVU1yNFNGdFZWRGdIQzN2cnJjVEljTS82dnBVdUdH?=
 =?utf-8?B?NmZJOWFyaEk4QkdKTHgrS2dNRGxXYWlmR3Z5T0dYME1YTlRCREh1eUFZbkRn?=
 =?utf-8?B?SjJ4SUo1ZzBwZkZSamVnbmQ0ZzJyTldGTVlkcnB4eFpScDlLQUZTU0RvbHdQ?=
 =?utf-8?B?LzFTZW1TSDJmeEE1Uk5hRHVYQW5xbjBOR2E3U2JFYlpsSXBYQ1JrUnYxVjNI?=
 =?utf-8?B?bGxaNmJQSVlYZ3VhL2NPbm9zNnIwT0ErQ2NkUHhiZ2Q3RVZxYXVMbVVjamxy?=
 =?utf-8?B?OGhWVjZoL2xvd2N1QkNEV0Q3eEgzVUhlY3pWVi9HU1VPTmMzN29jNXFhUTRl?=
 =?utf-8?B?bVBZTTR5bTRpTjFNQjhPVWpWS2x0Zm1SbVhFWnNMbjVZUlZGOHU2ZURUNllY?=
 =?utf-8?B?Q1FNelBlZGhOZjdSVTUwSW54T0hPR2FBeHBkQjZMc0hpT3hzaWtPcXFUYVhJ?=
 =?utf-8?B?SEVIbUJreGZ6cjd4NFdHTFgwdEt6UDlDWTJGMkdMMWMybXdxMCt4SEt2REdn?=
 =?utf-8?B?QWNNLzl4MnVIWFRld1JDZzhpaDZBaVZqYjlQSnJBOENaaTEvUUVNcHlmbGNW?=
 =?utf-8?B?dVc1eEVJOEdzaTNnbHg3VlIzYWNjWjhYMTBDWVk1SXdLaTdnY0JiRmtxY0pw?=
 =?utf-8?B?d1BaTHA1Ym1HTGZ4TzdZRWozbFdxdXFOTExkeTM4RjkrbmZaRkRZSG16OEFx?=
 =?utf-8?B?Tm5zZit5akY2TEhxTDJrQXBYc2MrbEE0eGFyRjlLUDROWWRHRFBkR0FmVFNy?=
 =?utf-8?B?QW5DMzNVZEVNZzA1bFk5bFJpMUlVTnFoNnRRc3hWWk5VbWdiMzZTNUIxQ0wv?=
 =?utf-8?B?M1hFVVgzWWt6T281MEZ6T1ROY1BLNTQveHBBczI3SjZoakZDKzZNUEJrUmtQ?=
 =?utf-8?B?NzhkRUVTeDN2RExOcGdaQlduUDZpZlhDamRTUENZQjBhZVhvV1g3NFhqNzh1?=
 =?utf-8?B?ZlVZbFFHanpjM09DODVNdU9YMU1EVE1QWUZqVjVaTmhDOExzb2U5ZEhDbEV4?=
 =?utf-8?B?cFI5bVVSeEZPUWsyM3B2Y1ErWHhXV3hPbnJjbFZrei9ZSzd4K1ZWVkdhVklC?=
 =?utf-8?B?c2JVT2pLc0VNWndac3R3aTc4SjdzL0Y4V0Z1ZVNwQ1NsUW5QMCtaem42UWkv?=
 =?utf-8?B?cmc2Z2VCcVBzNm5rVnYzajJSWWlUM2JLWDZzZDd5K3MzMS9aaElvRm1PQ3F2?=
 =?utf-8?B?WUxPeXpsN0dzOFBnRVRNZ2hydTJWOWd1Y3Nabzc5dDBQV2VXVHFsTFVUUE9D?=
 =?utf-8?B?aU9KRm94Y0huUVgwckh0a3IreTNrbXhoSmdOWmJuVDM5ZjR1M3lHWVhXR2Fs?=
 =?utf-8?B?SDVoQzdkaW9IQWJ2MTJESCszTTd1WkZhYkVMVFduNUIxaGN1YnEyT0VqbnRI?=
 =?utf-8?B?Q00rb1BObHE3cHZLWHRyZUlQL3ZCNFdnZnFYY1VET1FCT3RhZ1lVRFNrdnNM?=
 =?utf-8?B?aXhDb3doeEdtb2ZHZWUwMlp5NkNlTDhXUVNtQy9QS0V0Q3dnZFVTU21zZUFz?=
 =?utf-8?B?NlpIS2Fkdm5CVFZKbERJVWsyc3BvMktuQ1hURGpJNVkzdGNlU1BZSDAvQ0Q4?=
 =?utf-8?B?SGl0TURmVklwS0YvaVNXdWorVXdXRnFHMjJJTTNYVGpMdlp1UEp2TXcxdENI?=
 =?utf-8?B?cWhoZzJKSGZtUVhpV2czcFNuVU8xVWJERlFrQjVxclNGZGhHOVRnZWFjeWJ1?=
 =?utf-8?B?L0lHZ3FEcHNLcS9ySmZzMGtkUGtLU2VKMmMzTWNsRjAxYmtvT1RTL1VTdG0r?=
 =?utf-8?B?NEhOdGVGMXRndk9vMTAzWWs1QUhXWDRMMDY2R1A2WFZkRE9FYTVETC9tcGxr?=
 =?utf-8?B?WVo4eGtPUjNkMW45N3M0RzB2anJIOWVjMmFmY0FTNFE2NDhLeGtsWnZIR1RK?=
 =?utf-8?Q?KlfjQpz8fyUMeIvdBDASBTvp3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de9a531f-cd8d-43a3-9e1f-08db521825d7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 12:06:27.3118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dj2AUvX/4qBhIP5qtpanOsatBrePftGCSjjHzxVUY2MCzzmeW0xrvjAo5D5RZ9pXN6C93DBgWDoEYRm1Q6xpkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7072

Unlike PV, a PVH Dom0 has no sensible way of driving the address and
page registers correctly, as it would need to translate guest physical
addresses to host ones. Rather than allowing data corruption to occur
from e.g. the use of a legacy floppy drive, disallow access altogether.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The possible aliases of the page registers (90-9F, except 92) aren't
covered. Unlike the possible alias range 10-1F, which I think is okay
to include here blindly, I guess we'd better probe for aliasing of these
if we wanted to deny access there as well. This is first and foremost
because the range having had wider use on PS/2, and who knows what's
been re-used in that range beyond port 92.

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -517,6 +517,13 @@ int __init dom0_setup_permissions(struct
 #ifdef CONFIG_HVM
     if ( is_hvm_domain(d) )
     {
+        /* ISA DMA controller, channels 0-3 (incl possible aliases). */
+        rc |= ioports_deny_access(d, 0x00, 0x1F);
+        /* ISA DMA controller, page registers (incl various reserved ones). */
+        rc |= ioports_deny_access(d, 0x80 + !!hvm_port80_allowed, 0x8F);
+        /* ISA DMA controller, channels 4-7 (incl usual aliases). */
+        rc |= ioports_deny_access(d, 0xC0, 0xDF);
+
         /* HVM debug console IO port. */
         rc |= ioports_deny_access(d, XEN_HVM_DEBUGCONS_IOPORT,
                                   XEN_HVM_DEBUGCONS_IOPORT);


