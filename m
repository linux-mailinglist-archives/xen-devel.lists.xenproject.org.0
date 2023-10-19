Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009F97CF6B7
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619226.963963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRBb-0000iO-Q7; Thu, 19 Oct 2023 11:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619226.963963; Thu, 19 Oct 2023 11:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRBb-0000fQ-LV; Thu, 19 Oct 2023 11:27:31 +0000
Received: by outflank-mailman (input) for mailman id 619226;
 Thu, 19 Oct 2023 11:27:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtRBa-0000fI-Ih
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:27:30 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c15fcd1-6e72-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 13:27:28 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8422.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Thu, 19 Oct
 2023 11:27:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:27:25 +0000
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
X-Inumbo-ID: 7c15fcd1-6e72-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3XfB9fMd2rHCfnZh3HxotdKHV5weFApQ0IbZt+hCZk1U58BV0GNCIL6nwSEX0eFRC7mjnqu/X1y0UmIwKg5z42dNziw0B0UohTtkqwiXdgGRhXf11f81615YNtCsZsmtujlGrtxqa+NQlNBpBcFuUX2DtYOqxH5xXuok6Q161y4GT6zs0wUAEkcwKDtHld6dkfQGh4EAxiRiKF0c/Xsy2lujzAkblYpIje05QJyE7LYVfUSScoxsvIN/E2yoFnUbjHMgDydUoD7Ko/+fBKNKL1fFi7Xq/FlVPjHg8eudhe1/9d5rdAa9+Hz7UX4G4OY+xmUzhOSi0QjvKmpZoI0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLlb7nS/7c3RCP9QonB07Jz3Nk7u8VGVTktgJfx3dx4=;
 b=I17qspdQNWOQvPs8BeRF2prrZCH9dmJVO08szpzZ+JFQMLcxSuX8AiIpMnjvtpGD/9aw/H3ZEcjmBlsQit/qInO4TCHlZhG5SYcjjrx6mpjV0oN8EPqCWpXG3XzuB/d54puz5eNzpQm3Hk8qG6OaLVOZqYFkVMsIjaz97rYA3Zve3ypFj3uDvXfVEbVR9Fa9ERoYltjG8azNNZP2cLYZmSoxyX6g1rLUxwdZOX7qm0aj+MV+K4W17Mboh0tQIIQKO+V4XD9zVrMZZCDAhMy5hVqiIytqeHV8WNYMkdMltLUthB61bL/5ZxBXoFIWk1RJnyUpd9CdWvXZpIlEbT6B5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLlb7nS/7c3RCP9QonB07Jz3Nk7u8VGVTktgJfx3dx4=;
 b=4q+6XMgQzB54xisyZE9bXhwwPGLPP7Xc5AcwzJj6UrHkZHqA9SH8Pt48I3+4vVfHI6x8NCyQxm3T3L/ckJHorVrmVWZ8cSxwhXM0XV5gle9Sq229bp3U+MUemTdz3BYgX5HkQ/0NmBBzq/BjK1dncGHKXwEaQJGowCBhbGDaauY9lpi9BpdPATPzxeBAm/LlQyJtrFDqWWgbVTwHBKIkRw3euIwNDikYJIzxKHDlA8cEvD+79Dod36/GQfPVcRv4lDOa/HYOTp7fR+NHnMtLWKEvt1No4JhQUJMCmVOLmCSDGNyCLsY5fZyqAeePhgNu6f12XRRtOA2pFlLAhyX9cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <32b0e0b0-aed4-4204-ef6b-8b93bfb557c6@suse.com>
Date: Thu, 19 Oct 2023 13:27:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 21/29] xen/asm-generic: introduce stub header altp2m.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <619b24fbd568f439baf1941a972c6943f423b4ad.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <619b24fbd568f439baf1941a972c6943f423b4ad.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: db67b24e-97ea-42f0-97ba-08dbd0965e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tbMwviSjaX5XInlnUQiaccFvHd7SjfSbtx0iT3bDPYcIuMeP9HcVRF7Vqs2P+FDgo55wICAHIJpX8Y3Z9uWPzXsduIbRBAn+CAyA7T5hW5ahOkaRL+24shuFDoHkcnFFG2GIuVG+V0dAxmCH9KYDxebQTgdfqLwsbAZ+jfQITXlwstG9AsXzsjTx76oCOxZOrAvVdF7YloptW5qR8zLkvAciJCoDBeDLZtJJT8Ml+hBwRrNVNsOYzAz88TTZRipliVj2WnKqASuXVg6MUy0QGDuNwE5Pu9rl9D1u5Ookn0Hk3LWe4tzXaIIADFgFwqeaBkeD3VEpEU3m25H3+aNX8Ka8kNIG+iIUe8s1+pVzdjjNOXdCFy87IqgpAtZ5WwO5ri/KON9AhemQlcXSNiHMFBUBYKrd56q6SBZTCJbu7D7tss5Q909JgJSuqidh8lhGSiHaG299t4x2RkXIO2D6ZGHdmG70iANzZerXUCPQyrsXVIdMhpC1CONRnibqbRG5FI7kplRNIrVZ5S+MRQhFdrgyAH414TvcgNx9T3yPiKGf/RnR1Wgc8StE/L109vZlu2hyaO/Wjvqq1NitkZTjRbH2n3Wwkra7ojjWEiD7eGyz6lrz4d0zukf5TS+8WNhZbGrjcQk+ln1Ff6atMXOwtI51a8LgDS6JOQJ2WMSTbpY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(31686004)(36756003)(6916009)(54906003)(66946007)(66476007)(66556008)(316002)(86362001)(31696002)(38100700002)(53546011)(83380400001)(6512007)(26005)(2616005)(6506007)(2906002)(8936002)(6486002)(478600001)(41300700001)(4326008)(5660300002)(8676002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlg5R045a3JvM3Q3Z3lHemY0T2VPMVRyWFFqQnF3dFlrSmdxQzZEc0lORXo5?=
 =?utf-8?B?cHdGUlN4V2QyQ1p0Q0gvLysrSmc0amVranhuNXBJMWM3c1hTVWNFQ0k0K0pZ?=
 =?utf-8?B?V2pNTndUYyt3bDA3aGhGRlJFeGZ2cnBxWWFLVEtoRzVsc3FzMmFINWRCUnFJ?=
 =?utf-8?B?TnhHWWFJUEdYSkRwdzFxQi94OG1FcVo3eHJON2JwaS9YSkZxd0VVUTNCWWt2?=
 =?utf-8?B?bTRpdW9QZHg2azMrRG1wQXRUY05UcFBGTzZnVWpLVkhGT3ZpOGFuS0YxMlJo?=
 =?utf-8?B?ZlVjNW04bGpaeCszQm40eitDS25BZkxJamJYUUFrZjh4VG95ekhWcElkMGdF?=
 =?utf-8?B?SGZlMXpsamJNRHI1b3p3ZHlNOGY2TFJMdWIyOXBiZGJ5NlFVTGpJWGY0UHhp?=
 =?utf-8?B?Qkt3ZmV5Y2J5VHMyNSt0dmFETEthWlJ2MDBXcUxaR0YySUM1WFRGS1ROQ1Jj?=
 =?utf-8?B?YUlaTEgvRm1IdzRVbWUxMDdRMHFlZ3QzdTA3ZWtwbml6QVFLdFNKc3hmcHht?=
 =?utf-8?B?ek4rZ1lXbmlhdFBRNkpkemt1VVNQTnVjQU00YTFwYTBGMjFZWExJZ2RHWEtJ?=
 =?utf-8?B?cTROeXFKVDFSMTRMaW96dGc5TkJ2L3JWV05UTjJOeDI1azE1dld6eGo5MzJ4?=
 =?utf-8?B?WHpveEcxbHdKZW5SMkY3QTY5MGFJYkx4bTc4eHVTR3JjY0l0dUVkVzd0OHc1?=
 =?utf-8?B?aE15anV1YTd2SGFNMTRuRnVHNU5MMXdPaHV2MXhOalpNelJLMUJSelZzNHB4?=
 =?utf-8?B?K1JMb3VucWpodmg0ellRVUVjL0NYZTB1bC81WkhjT1dEd2lCNmVFV0tNbi9R?=
 =?utf-8?B?TklQaGtsT2NPQzVFbzNvSElRN0hrcGxqYzNnSms4Z1VsUi9TWkwrcG5KcXVq?=
 =?utf-8?B?eDJiQko1eEg5QzBSVVd6bWRRTnFubStUamJES1BrVWtiUmE3WWEwOUVoM0VG?=
 =?utf-8?B?Q29kMVJsTXZ1Q0ttM0NQOHhHNWNGZ0lIaElDaklrallBclNjcmw4K3RROHQ5?=
 =?utf-8?B?ZkdHU1VQREpjQzExY2lRdUdGSytYd01KNXcrK05mSU5WeFVYVml2NjlMcERZ?=
 =?utf-8?B?QlpVOGo2cHNnREsxZVhPMnc1RGsxRmxTK2dUdi8zYVFMQVkrRDR5dzQ5a3Bl?=
 =?utf-8?B?cWRLUm9uNlFOQkk3NHo2RmNkRE1sYnVWYnV3cmFyWnNpM056YTlYWHBRbHR3?=
 =?utf-8?B?TXlHZGoyUlorS1pWZDh2akhUdDNoMFVTbWxKVGg3alBONmZ4c1NUM2JRbnBz?=
 =?utf-8?B?TGFoSm9MTFg1K3ZaRm5PYm54SWlLM1VaaVkveVJxS2JNTVNPWlByNjFVY1ZW?=
 =?utf-8?B?OXcxcW9ZVm1SUTFoQ2VCbnZjbGZNWUlQUWhqTEFWZU9TQTdHS3BKNTNZZis0?=
 =?utf-8?B?Q0hpaWcvT3haRENVTzRuS3pHYmhQRU53L2Mxak11ZmpmOWhTbGhvZ0NvZWlF?=
 =?utf-8?B?bHBqT0JVU1ZZWEprTTJaa3hYcEFTYXN5TmZTRkFjYzVoTFRNMy9JVUhneloz?=
 =?utf-8?B?VjBFVWNRZmtEaThmYXhaWWVhSGZuU3BsQVphMnRhV1RnN1BoWXdIZDNSSFRm?=
 =?utf-8?B?YWNJN01OcUxMMlRENEQ1SGxkdXpvZU56UmV6eTZWb2tHMHlabnQzbWh5VUFZ?=
 =?utf-8?B?Ym03U2ZrS3Y3bWFKQ1drZVRyREpDZlJtWXlMZGtqK2d1YmsweEZyb0tub2Yx?=
 =?utf-8?B?R2JHWExtemFudUNxcXlkLzJkaURvQ2hlQnhKejNnaTVlc1RWMzN4TG51RGV4?=
 =?utf-8?B?OWVtMkpzRDZSRmtuMzVLcGppcURXMzIyK2gzcEY3bG4wWWNEZXVMbjVvcXdV?=
 =?utf-8?B?RzhpRDJFN0xOTW0xdzZhR1RSMTdOaG11a3JOeUNrcm1ISjdtVGluZGt1VGdl?=
 =?utf-8?B?V2FaK3R6Szk3Q0wxVjcwK3Z2VUg1WUFKTXhwYndDNlk4eVJJdTJUTVZ0UXZo?=
 =?utf-8?B?M3BwemxPSy9OR0twK3F5VUxITjFGSExSQzlsLzhMemlyc3d3Nm9ZM0kwQ3dG?=
 =?utf-8?B?dkE3S09RZEM1QXI2aFc1a0gzYnQ3RjBTSlBRRlF6VVJQN0FFT0w1dUlmSHdF?=
 =?utf-8?B?YVdJY2VMY0lLb0M5M2lQNnNZWnhaWGVkd3MrdjlhT25tR004cm95b2NNNVcy?=
 =?utf-8?Q?SJi3S4LqPQ0gc2ipmOHIuEGxP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db67b24e-97ea-42f0-97ba-08dbd0965e8d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:27:25.4658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlDzV9iAk8xejbnobdiWkG+RCOVtThXnbUB04/wU33SPxHbLKYM01jkC0QCFeKsZXVaipmqVswnOQWHyGZZklw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8422

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> The patch introduces header stub necessry for full Xen build.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/include/asm-generic/altp2m.h | 34 ++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 xen/include/asm-generic/altp2m.h

While odd to be needed, this looks largely okay for the moment. Just
one remark:

> --- /dev/null
> +++ b/xen/include/asm-generic/altp2m.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_ALTP2M_H
> +#define __ASM_GENERIC_ALTP2M_H
> +
> +#include <xen/bug.h>
> +
> +struct domain;
> +struct vcpu;
> +
> +/* Alternate p2m on/off per domain */
> +static inline bool altp2m_active(const struct domain *d)
> +{
> +    /* Not implemented on GENERIC. */
> +    return false;
> +}
> +
> +/* Alternate p2m VCPU */
> +static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)

uint16_t is what x86 wants, but even on Arm it's suspicious. For a
generic header I'd say make it unsigned int, thus also eliminating
the question whether xen/types.h should be included here.

Jan

