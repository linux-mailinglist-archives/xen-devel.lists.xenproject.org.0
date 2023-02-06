Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EE668BCDE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 13:33:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490338.758978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0gI-0002sR-Je; Mon, 06 Feb 2023 12:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490338.758978; Mon, 06 Feb 2023 12:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0gI-0002pQ-GM; Mon, 06 Feb 2023 12:33:10 +0000
Received: by outflank-mailman (input) for mailman id 490338;
 Mon, 06 Feb 2023 12:33:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pP0gH-0002pJ-71
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 12:33:09 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68e486ca-a61a-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 13:33:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8553.eurprd04.prod.outlook.com (2603:10a6:20b:434::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 12:33:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 12:33:06 +0000
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
X-Inumbo-ID: 68e486ca-a61a-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcQMDsDnmrSfdgfyUTSuIsHtEwCA67lrFIdXdlY6kig1mJs6MiJiic32n73xthee0i5y+o9ZQQx70Nc3hNAs09kSyTEbcJb586tIWp0hP3aO+GbXd9QudkhmvTSfQ3qi+L5XQLtKvj9TuEALfgparPy748bc/JGvFfVAIYor7dy92k5ud1ohLmqZDRzM8+lkk06wTdVTZiuj978RSo+rpjnxECFbn4BlZrwnTwhVeX2/XVV1XxoSaIMDsfTuzBsdAI1AOEtdBBPESFJFgqbDliYk1+Bd2ewivOj6J8GiBZIuQQzeJEZgAm32j05HaK0VPip7oivQoVsb0LKFeXJ7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcab7qzlesiQNGAJRREkouTYMLM7Xss9ex40gU9Vk7U=;
 b=P7V3U5Gee6gC9VHwiCE8guq4yi4yADiuX22qZJr4FIxnWj7o6zVz5KmVwL5WabtHB8kli1e4l51UsyLafIA3mDhYgDfkh1ERj11UwgzO3XR8XSsBQMJXsbGQv7qMhzMclYVM8M1Hshh2J2nSs02nIdhU6aTniwHteNYhH4mHOPEPieyQkeAs3r665GP4HI7oaTeqHxzL0lJm3RHsHmw5uQK63qCw+H+xhXr/4CVbZ3ENjliYO53sNwisDdTyC2paOT7qMiF+oBzfZFe2oiK92aDKhSEGFq34E9seDMVE6uxawRTy34NvYGRjEUqHJq+wEbxs0dtsXgkVI73kcvqXyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcab7qzlesiQNGAJRREkouTYMLM7Xss9ex40gU9Vk7U=;
 b=T2+IsHx7Y2JbPwbT7xa3eJj69yNhure1jIJvzOHTT6o/wpwkWn6+XPTZ5tsqqmeyNlzwApeo20OWFZFq4WYJkojf0UIThD6kK06kehIb/57ahF4zZWsDDroQiRDbr9D7HROunrWxmbDtyQc293YQHMxM9iQFQRncV0727ydB6tstelD/Bsm76JyT8uC856cye2LTamBxatK78XSR9xU6tR8/cMMiwr/kcTV1FP3JY7SR9iDbEMjIHm0D/HEFerhgO4+4FgndO9WBmTyuJoOeTNnU7119jP6HUewsNDvLczi60WT8DyMf29RAmc/ZYqvL5GQ/3mwSnuQ+dTc47mThrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d80ade5-dcf2-b0b3-ba4c-010962a6febc@suse.com>
Date: Mon, 6 Feb 2023 13:33:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxl/x86: use public interface TSC mode definitions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: fd6bbd47-16c9-47a3-d8c1-08db083e4bf8
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bj2mD4F+Gna0HBWsz9ipiSpYSfd4hXEqPzJ8aXSQGMxLW5vWMY8h1KF06HUFbAjWl7GoSgpT2Wex8nYHHM3iDJQVOn4gxd6ot5QHQGbmntcciiQewSAO1U4VXWjZ3qkkmm07MFmm5YKCzlabf/BO+dcJCnh5UzxrMwEo8QUfMP76E4NK3FJunmHEhQpFxhERYD8XhJIQX/weZy1ZIn46mIY2VTfd13OUS05y3S78Cyomwf0AUawF/sWENGjA2EYIDfhF30/exKGSA3pZE5xDViC//fHtJSGFWMQQRZ196ifBrZK1WyyPBGJakR9S4HA9TaVT8a+0TOg2Awdxdf28r+uuJcEgy1k3AB9P2hKaI9HWVviLwKZGEiCUE9BPz8Hs7ROyoSbtveyOXUDHsfr0asxw9Kle4WDDCw+KG4WuRMJlja1CNMVJ5zxaXKXRP2qpKzj2iHhNNJ/S1qy/eHTUw9SkX184AtelAUSRVIEYTenRus9HT7IrfYWL0hP4c+EicCgLDPRa2alyv/m8HXueeN86oMcg+AkNvpjpB4ykrd83PM4SYycLiuGqeVOgHZnoVa1rqBsDN92fmIxW0QeO312bnQxsPlY1oqI0zCf76nTA9L6aBiGYRhfQ9lnhH4SRk8CXinT/WKAWkiYruXNe9k+bp8IsabJrUotgq8+AqxKqL9+sGx+6fGVUqNY/0EbxOGKv1fu2287TkhwUa+2UQQ1KiiyGgvGk4/r/Oz2eKDw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199018)(31686004)(36756003)(31696002)(86362001)(66476007)(66556008)(6916009)(38100700002)(66946007)(4326008)(8676002)(2616005)(6512007)(6486002)(6506007)(478600001)(107886003)(6666004)(186003)(26005)(54906003)(8936002)(316002)(5660300002)(41300700001)(4744005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkxSQ05SbE9xdHZoQ2FvMlJjUTN0M3h0WXIwRnFKYVBoUytYOERQV0hTdHh0?=
 =?utf-8?B?M2dQU1lLUXFudmxubTYvSUlHdzVsdXRVNGxlTEppQmljYlVDVWhrR016RG9X?=
 =?utf-8?B?SEZiUWxCR1ZsTm9jQ3F6eDdveTdiclBId2tuaVc3VFdKNTRjU05EeFM2NUly?=
 =?utf-8?B?OXRhZTRvMTBQd3MweEZ0bTFXNUN5KzBWSWNZQldWQkw0ZGpBSFVqdURJcFcz?=
 =?utf-8?B?cXRwT0RQcXBkM1ZHUjN0UXVQL2dIOTVNRmtTNlR0eUllZzFpdEdUNktnTWVF?=
 =?utf-8?B?d25nRkFGOTBvamg4K1I3Y0dJbUdVZm5VTU9aWkJuL3JhVDlQM0lGdkpNZkRi?=
 =?utf-8?B?YU1Yc0lJTDE1Y3I0cFRCdjVJWWFDSkRaT1NITjJYVG9NSVNkbWlLcEdWK3cr?=
 =?utf-8?B?aFB6aGFJL1NHWWxYMnA4bzNVa3hFRU8ybmlLVXNaUmpnNURKbkdBZERwZUd1?=
 =?utf-8?B?NUxpTk5FTXVFeHlFOGZiMGxOdTFmVnN6bnZsYnJFaXBmaFRkL3NMWU9QOVdm?=
 =?utf-8?B?TGlPQVRVcHppcHpreVRWSHRjcXBtMjZhYnZxM3hONkQxVkd3bEZOb0xXT1VK?=
 =?utf-8?B?YWE4Zk81dDVSMjNTQnpCN1JKUVh5RHdzR3ovOHNxb0pBMTVJRGlCMmJ1eGRM?=
 =?utf-8?B?U1lwMWNMQlFoazhVeTZxTFdTZmpDMHdJSzJOdmxXR3NtS3ZEOUtlSWNIVGla?=
 =?utf-8?B?VHJFNGZ2VkJEOUpDaWhQK3AvbVlJM2FTYlZBcC9TcGt1a21JQW1QOG52VnYz?=
 =?utf-8?B?UHl1QkRXUzlBSGgxQmhmVE9XQVRYNkdrVDI0Y0ZiLzc0aklrSlpRVXNUODJ5?=
 =?utf-8?B?eXh2TytFc0xiV1BJZVFhWW1jbS9KTW9ybXZXRThyUnBQaCtVVUVKQ1JPMThO?=
 =?utf-8?B?Sk1aUms5aDE1Tmkwa3RKOUF5UWVUQStJUk9LYW1zaWFITE1tN1YyVDdUUG5Y?=
 =?utf-8?B?T1UyNk1MSEJ4cG1tOUc4dWxPWGsrQ291R3VFSTFuSUQzbzhtYTFUdTh1UzJa?=
 =?utf-8?B?Q3JvanB1ZnpDVVQ5N052YnlYL09BOTlYc1lNVWNQSGI0L2lGQzB4NGFTZXBq?=
 =?utf-8?B?MWNPZ2ExZnR5ZXNvd245MzhaaGpCVERLdllEMGszN0pXOFFhWEUrZGtCZ2Uz?=
 =?utf-8?B?Y1ZyMTcxeUZ5bzI1bEhCdEE4QlNJMEtnaVZhMU9GaUdKVS9IbnJ5bjVJV1Jj?=
 =?utf-8?B?SGxZYWY5UXh4d1JjVlQrby92d1gyV003bHY0eUhQLytQZmtMSktBZVEybVlR?=
 =?utf-8?B?Ymo4TS8ycTdYWEdsVityUWRLVHltL1ErWm1oN2hCRitUYkQ0WUJlR2d2Sm5t?=
 =?utf-8?B?VVZGUG52R0hzc0ZsTU5oRHliWE83V3d5bUZhZ1BiQ1N1ejNGWnNaUmdOeC9r?=
 =?utf-8?B?N1pYZTRRa2VRWFA5c285cCtMQVBwYXpDRjZMTi9NQXFHaGNPNFVMb1N6Smhq?=
 =?utf-8?B?T1pRU1IrT1lzTElVRmxvcEh0WXJ4ZTR2OG44OU1NRUpRKzB6QVJoN093ZXMz?=
 =?utf-8?B?cC9QS1FSU3g2ZTA2aW11QTBvSkxXcVVNY1AybHpTdDcyMzlaYkhIVGlpOG9T?=
 =?utf-8?B?ZXlXTkw4SXBDTnBSbUhWU2cyd1RnWnBtRGc5alpoSElIVU5USmFLYTlQTUlJ?=
 =?utf-8?B?Z0ZoekJ4NksvV3E5NkgzOEdmTnAwU1pDOHFWendYR2dRaWswZHZxSEpZVEhB?=
 =?utf-8?B?RGxRdjRHQXVOV3dxUlllYWtSTTljOHpzK3IyeGlkMU52eDBTT29TTjFpdXJr?=
 =?utf-8?B?U2FBZmhCNDVlSWJ4dWVoa1JqVXRiMHI1Q2NBc3FDeVBNRkdIUzY0aWtVNXdT?=
 =?utf-8?B?NmsyRVFEcTR2enYzVXh6eXRGR09qT2JuaHVxSGNDQVZSWFdncjVlMktONUI3?=
 =?utf-8?B?ZFh4blNyZFlORkg0QlhNTlc1TjZaUkpIQ3JoOFZ3eVk2bDJrTXVYL1doeGZE?=
 =?utf-8?B?dFdhSUM1WUlYWTBMR0M1bzhVYjVEeHFYK1ByTjlxL0F3WFlYQnFwdlhSclda?=
 =?utf-8?B?OGxSRUNmd1BrUUdQT3VpQXlMNTMrTmQ1R2J5RkMyOXdnOThpeEtiK243a2lt?=
 =?utf-8?B?WXBJdU95amdjc0J1aXloMFRlSWNaNVFmV29mTUlwd3B6ZmlYeUhPc3BrUGdp?=
 =?utf-8?Q?nq2TcyeM5P8dwQVRi91jfgZ8i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6bbd47-16c9-47a3-d8c1-08db083e4bf8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:33:06.0526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGa9y7+H5RG4/RW1xXasMOx7IQGEh1lxFDzvLSaI/WjZ1mc2d9l5luG6ENJ65NZ2yhvQDCBBuotGbHj8OzlWpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8553

Now that they're properly represented in the public interface, stop
using literal numbers.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -1,5 +1,6 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
+#include <xen/arch-x86/cpuid.h>
 
 int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
@@ -486,13 +487,13 @@ int libxl__arch_domain_create(libxl__gc
 
     switch (d_config->b_info.tsc_mode) {
     case LIBXL_TSC_MODE_DEFAULT:
-        tsc_mode = 0;
+        tsc_mode = XEN_CPUID_TSC_MODE_DEFAULT;
         break;
     case LIBXL_TSC_MODE_ALWAYS_EMULATE:
-        tsc_mode = 1;
+        tsc_mode = XEN_CPUID_TSC_MODE_ALWAYS_EMULATE;
         break;
     case LIBXL_TSC_MODE_NATIVE:
-        tsc_mode = 2;
+        tsc_mode = XEN_CPUID_TSC_MODE_NEVER_EMULATE;
         break;
     case LIBXL_TSC_MODE_NATIVE_PARAVIRT:
         LOGD(ERROR, domid, "TSC Mode native_paravirt (a.k.a PVRDTSCP) has been removed");

