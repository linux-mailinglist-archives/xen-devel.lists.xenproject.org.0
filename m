Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 777906B8F9B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 11:19:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509525.785419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1kL-0002zp-07; Tue, 14 Mar 2023 10:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509525.785419; Tue, 14 Mar 2023 10:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1kK-0002xN-Sc; Tue, 14 Mar 2023 10:19:08 +0000
Received: by outflank-mailman (input) for mailman id 509525;
 Tue, 14 Mar 2023 10:19:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc1kI-0002xF-P0
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 10:19:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a62fa1e0-c251-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 11:19:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8974.eurprd04.prod.outlook.com (2603:10a6:102:20d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 10:19:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 10:19:03 +0000
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
X-Inumbo-ID: a62fa1e0-c251-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWj5cI68KjhVCus9HL/9cuWPJvNu9QX9UQkkCyxBKU/ewRQcL2x/ECqAjZt1yQI2sDgMOzkZrd77Y5PF8hADUuv8nkn5Y8dN6H7an+p8zpH30Wz6/QVR+utPx1+T4vc3sexE86oIhncgkidHsg01VMB9c+762hHxbNrZ0xgOZOHFLcMvVyzm5uXxXwY7RIMqGkSv3eeXkPkHt6XBM3w2mCsgZjTB8ERoJBnBVvuEbRlWKU5gSvVzVgyTer4zA+CqqmAowpMZjCMSq6s5u1rRrZrjekTqBHFoJ+q9xvBKFVAd+p2NpddBWYw2ximZq6DQrdSnJhiAzA8pzk7MaeuGbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHkD6PhycPuvNiAuX72UD+P+GjRnHCGWJNfKJ9noZjU=;
 b=oQN3OxU+I8tlO6iCt/sq7zBZxcCM+WpSWyGitNx6kZKFR3K6dML6FRzzYgsnpukzXXkHLhLG/FvnGW4szy1FwuILNO08wPhDRT8zynyRHcNZwGelY/ornXsut4JKO7OINl/xaRoZ8PIMES7S00v1puDx9xL0o3Hyqp08bX+q+wVhe5OEy8zCJ89jxqZccyEJeSRAdunuQwmJeg5CrKq7k6MotsD8dvf3NyGEp+QGr/l09hvpwZm8AzFj4aK8kuC4La6y3Sc5kmdfYsvPPn0+nInkRo5ic8FDOUyUv7BXLGgVnXUQHQ3rprZVhRnF/Nn/AiFA3MoPvOyaXUPbZuHt+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHkD6PhycPuvNiAuX72UD+P+GjRnHCGWJNfKJ9noZjU=;
 b=aP/Z4ipWplRrNdqhcLP+vYjeDKMIE+2y/HbS4qZiChWdswRPsSe5J9UR2gCWUDFYkakJvpFzHTB04KIOppMNLe3c6SMXSH0ARxxYCxnXufmYcunNdfYZ+yGH/ZIPk68HEHBkwTL9t8rlMsD8sn7SZywUcCzY1yijTtd6f35eAqZ7R/FQKa9qTbY2qDp2rtz5cMcQ43/5zE4YUOozCPimvzAf5JFq6egbMFqBJUvWCMYHUHq7kr7RoM5YXNaXOOYipEqmBygQskwdX7VBzl72WYj2yK4iZOUJSrAR51mKAm9BTsaVSlyMQ/KUVaLhSJUow6mh5VTgw9Q1tozMllyDHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <593392ae-91ce-3499-1aa7-fcfe664025cd@suse.com>
Date: Tue, 14 Mar 2023 11:19:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/cpufreq: Remove <asm/bug.h>
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230313175103.20778-1-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230313175103.20778-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8974:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbad7c1-79e4-4efa-bf0a-08db2475893b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3pN3EKtztFGdYWoAeEQSzKG9ZS2RtwnYkuwiPfTIiBh5oh89A0YD5aS3xvH1czBTWe+VnJKv6hwbSADC3NTtAOpKeqCpm0n35KXFkOSFl/2q4cK9LJ4ywMHQuI93OureXZm5tp/w+GlHxO1AsRhQYpSF9S9hubrH5bwPCNKcSw3rndNC5usgXuAvjpBY1Ndzdvw/gzgiKjhqXESwn/7F6pPIbQ9c5mL4c374nFKt4GdyEb3l9X58n4strK/yVL06TD3tlryVH20EQSMz4g/UI5KaZCkpYLGKea3zVqCrAO+hOyrXKMDyfulypMbeNPTlNi6EpAx2+Z22jfh2Q59jYUxtzJevb+cmk5fQMj2fGq/OCu5R90qnhsaRh7EPzsFUeeiZjiPaZJ+pzCNYeGcZV4+v7Ziq0eqoM+P9PjZ7fbki9OLV5COgI7eXYfIsS71j7ReVV9FLMUiXdvUD/nkwtLZesPam6YZYFxtkNIJu+FR/47gECpG50BOPaAZ4YiC29iLw8O5ynK+fwmYKapnTjY0BKFKv5lv60Ef0Xm1FJA9WVzCRFSyOYRFyjkwBqpd/ge2O+eFmOQmT6kL9TjEaCy4tmnNuhLAMv5POQxpAIaNip9ss1Cx++P0V6xlSQAP0yAcmbtRh+ojvEyX5DgN8UKW2tnlgraKAlnBeZUc42DGMKfX1UXQ0ZvfYY7fNIJlrTlHNoNlbLdXWqFaTAP1QiLUKU5Clms0jGXrLcOvLe4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199018)(86362001)(31696002)(36756003)(38100700002)(41300700001)(2906002)(8936002)(5660300002)(4326008)(6512007)(186003)(26005)(6506007)(2616005)(53546011)(83380400001)(54906003)(316002)(110136005)(66946007)(66476007)(8676002)(6486002)(66556008)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUlZaFltVTF4SERuVU9SVldqZWNyeDdvMnpXMHhWa21HYTFVV1lJS1hIazZh?=
 =?utf-8?B?dkM2NFhXeHNFeFNjV3ZUcktGYXYxQjF3VmdQWDlaV1Vrd01wMGVrRVZMNEIw?=
 =?utf-8?B?KzM2L3ZpMDNUVDFTUlMvWUhmYUJPRkhEV1F2R05Fa1VoQ3JXMzNqMC9Sdk80?=
 =?utf-8?B?VFExME51MllxWWZXZyszY0FyK0RnMnRZN3VCbzBwVlBLMWdibmtwZGV0RWs4?=
 =?utf-8?B?MW5vdzNqRGM2c2J3WWxkVE9oQ3h1anlPT1FCWGlXeTNpWnNYcUdWVHhCWldW?=
 =?utf-8?B?L1VCRlNUR2NyUVlDRmtYUXVNUlhFNW9ZdFJjMjh6RllMZXg1Rzd3Nk9oSkFz?=
 =?utf-8?B?WFBQYkxaYmVTTEhiTTY2K0ZER0tJdk1pUGV1dXJON0RwTkVqRlVHUUdEazBS?=
 =?utf-8?B?bGRkOVBRdDVET2hSNXdZSXlYOUk1aFBrRWdnSHR6ZWE0L1QzQ1NGdTNMM3pV?=
 =?utf-8?B?MlpZT0tDNzhudUVnejdEZFM1T0lzb1ZheWM2YTd3bFZsRTcvblJGQWN0Tll1?=
 =?utf-8?B?VnJ1SjZaL0JmVmx1bWtIZ1FtWkNFWk12UlpzQVBONHpLZVZyUGxJUW9OWXJM?=
 =?utf-8?B?MnVTMVZ2b0d0UWtRZFlzYlBHSndleFdWSmkwdGV5cHhsdDlLamlDWG9ZeWRD?=
 =?utf-8?B?QzhsQ0RJTmZlelpuODdzWkpzNGREbDU0TnFOQ3lJcjl1QUdhNE1HUEVzQjNw?=
 =?utf-8?B?ZDRZamszMHpOQVh5V2ZDOStMcTZSRitZck8xRnJXcjd0dzhONW1oRWZaMEVj?=
 =?utf-8?B?NlBSOE9sdUpZV29RN3ZLcXQybnVGRWtiNlZ0YTc3a1I5OEgxSjdwRWhjNFBh?=
 =?utf-8?B?a2g4dnlkeEZKamRwbnpyYndXUmJvb3NJV1VZaTRGUnA5bDF3T0RCK0dVdDFp?=
 =?utf-8?B?dXJmK2tHcmNQakkvR0JvL1crVm12bkJkbERyZFlVck1TOElLOC8xc3FpSjR4?=
 =?utf-8?B?ZlMrSVpkd044M0VvcjdPMHFIdWZ4WTNnM04yL25CMmtheHRiNjhpVU1FWmlO?=
 =?utf-8?B?UTcrQkxjQ1pFTXE3VGkvU1NzbGcwT3M1QmFDOFFWaFo2bFY0NDFyak5LTDRk?=
 =?utf-8?B?V1dwWi9mTmt4WVJnaVY4djJCRzJjZDc0VlpEQ1FacjFnVEh6NkFHTkVubzdu?=
 =?utf-8?B?SHpkT1JNU1EvRGFLbHllbkdsVkFwUGVSYVZmNzFiZkh6UlRIakdHdTRKdk1I?=
 =?utf-8?B?RW5NRENCem10eXlsTjNvVDE5akpkeVIzMlFlc2NaUldBclh5MkdHdkdZc0lh?=
 =?utf-8?B?ek1KWE1QdEJ5d0ViQy9ZK25nTUQzOXdPbU9NMkg1YVV2bVQxWFJNdG5BS3lv?=
 =?utf-8?B?UlkyWGRUTjZLZWNlZjlSLzRUVVh0YXlMaEFseUkzMVFNRWtFVmYyeXZia1RG?=
 =?utf-8?B?VFc4SGROUWVWR3V3NHdSMExEOTgxZDRTd1dMNTJQa05PZ1dmWHFBWjE3OTl5?=
 =?utf-8?B?MlZNS0xUU2RJd1JVU2h0dFBKVHVGSG1YQkZOSUd3bzBoeTdlRnA1QWxRbFF3?=
 =?utf-8?B?ai9TTGF1TUxFekV3TEFHbUorbHd4TXUzTE5vZWlHRExVL2UrSlkwaEt2TzZj?=
 =?utf-8?B?c3d2bDlmSEFaVXc1cldTaE9lbjdsUGY2eDkrWHFyeEQ2ZnNJS0h4MHVqUHU4?=
 =?utf-8?B?UnoyT3dUK1IwZEtUU2d2QzJyWXVlNmg3SjR6ckErYVNtR2JkMmRkdWJ6NWtZ?=
 =?utf-8?B?UHRxaGRadjNrOHdiOStYVDlNMzlGZlBKaDEyZEVtaE52RWUrem1mZnJwVG9y?=
 =?utf-8?B?Y1o1UG1IQzRIZisxcFh1dnBKcGh4RFhrNjVpUnVsbHdwUzVvNzY2aTFxVlI4?=
 =?utf-8?B?dHo1N3orOWl5RjBiTGtpYVk4cEVzMXhWSkRYT1lRQnhyeWtXTUV0RlZIN2dZ?=
 =?utf-8?B?Zk5HZW5xcnhXOXRwdng1cUNwK3ZKcmRjZ3hUeWtPdzZ4V3ZKSXpwUUdWYVBZ?=
 =?utf-8?B?d2VybzJkQTAvcjFTVDl5YjR5cGtZVURzMm1Ib1piVisxbm5kckJhM2N1Ujha?=
 =?utf-8?B?NDBDaGR1WmtGMXgrVzdQdWxVT3pzYW9zalRNSmFYdTVzQ0d0VlFDM3pEUVJ3?=
 =?utf-8?B?V3VGZmR6bDV2ZHJYcDFDOThNWFZiRDU1YWxPVlVlYU51SHFxYVFRTWVoRzNM?=
 =?utf-8?Q?CV1czTkDCcm3hlWCjmLhYvtz3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbad7c1-79e4-4efa-bf0a-08db2475893b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 10:19:03.6630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7Qb57kRYvyGDShHKhedDScG978Wt1usUnFL3FgMQOXccfXQu5LQyaoAfp1NPH/Hgia14vbYMLcrvm7eK6bgVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8974

On 13.03.2023 18:51, Jason Andryuk wrote:
> The header is unneeded - there are no uses of BUG() or WARN() in these
> cpufreq files.  Remove the include.  It is still include transitively
> from xen/lib.h.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

This, in a way, is a review comment on Oleksii's "xen: change <asm/bug.h>
to <xen/bug.h>". We can certainly put in the change as you have it (for
him to drop the touching of the two files), but I'd find it more logical
to continue to be part of his change, just with the xen/bug.h replacement
includes dropped. Thoughts, either of you?

Things would be different if it was clear that the change here was dropping
all unnecessary includes from the cpufreq files. But that doesn't look to
be the case, as I think ...

> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -35,7 +35,6 @@
>  #include <xen/sched.h>
>  #include <xen/timer.h>
>  #include <xen/xmalloc.h>
> -#include <asm/bug.h>
>  #include <asm/msr.h>
>  #include <asm/io.h>

... at least this one should be unnecessary as well, even more so ...

> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -39,7 +39,6 @@
>  #include <xen/guest_access.h>
>  #include <xen/domain.h>
>  #include <xen/cpu.h>
> -#include <asm/bug.h>
>  #include <asm/io.h>

... here.

Jan

