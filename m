Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262177CF61E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:05:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619191.963874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQqJ-0003mQ-2J; Thu, 19 Oct 2023 11:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619191.963874; Thu, 19 Oct 2023 11:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQqI-0003j6-Ua; Thu, 19 Oct 2023 11:05:30 +0000
Received: by outflank-mailman (input) for mailman id 619191;
 Thu, 19 Oct 2023 11:05:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtQqH-0002xs-2H
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:05:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6941029d-6e6f-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 13:05:28 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7016.eurprd04.prod.outlook.com (2603:10a6:20b:11e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Thu, 19 Oct
 2023 11:04:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:04:58 +0000
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
X-Inumbo-ID: 6941029d-6e6f-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFc7e5FSZ/8UQH3PvWFOaL71Y3Q+l5oj0beh5TCqwHFWg04A12N1eXEzi6i3i8326RbtX/zoDPbm5nDFogg3Cc5TyYGXL0v8SDL9Q7QKxjqunBwGvTrGetve/7CotHUa2scuPAVs2MxW+H+dpiQj45ZdkuXmFV8DmsYxBmJjIf5JlyCaMR5/6KxJSAAvtb0hGmRRx7OedLDBJOGEN5q5NzpPHvjThroQWXigOYSURRCo41hIQeca4v++L18+El+QjvHyjc1IMUU0FbylNffHhPfbh6/aPCmbJYKhEFdbknG4/8GNV1zTQs32xl8B/IMfxnP524ZFKqrXJLFt1cHh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zl6czcccU3Je0a7T59b25S4OQslclU2No1euv4l2XDQ=;
 b=mTPr0ofhrm6mjJA8uX2T6nqcquVEJXCHf6HqbW8p6pvW/HhE9OaLho44ttcAIndx5UwCV5ZWrs4euGUHwxjKoABywxflhSj6URajqZoyQkd02aEIAgq1O3aMJl06vt8uaK2mGWUnP78n1P4Fou6seHWRKQWJOsquzOokOsOBI7NCbkwrI5m9YEAWL459Or5krQK3/Cx7jgYRpfxZCP8f234Symhnz303UuhZJOttbPXwlfkXSgJ6Z+pR0yA01R1jDIVXa70iqwaCDoZcHKCDRLZ3QOjycD7kG6iDtvBlFAeAwe0NaXktUWBcC0nD6ftDiyE7bGdxYNb3iTik2JzkLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zl6czcccU3Je0a7T59b25S4OQslclU2No1euv4l2XDQ=;
 b=LIt547Oz4Ah+rUGCg5r5JdUrtktoqlWEWrhatkFdocvTGaoZ0PAL1YVmQ4NLHPXO7kzCydgFO4OOTFoy6BLQuqR0MQrTEVrPLOhCThEFVBrKnLc1B2iDEzprZQcED0bxoD2aw1OOeXhzcp/8cLpjRb/69rfECOF9m+s8bdh5dg7t+6hC1sJYdZxG57t9PklNRRC3/XcpmbyV9xLSx0dtwnoaSPuiLGM9XcSVfpoZEQR/HTClYd59VEDfOD5BZirwk2p46jleTnBjiVRJUw6lV05W2X11HD+py/If12BhMjwEES8hie4gJMo9aSkqpnWsF/BOyecVZz2gePrVixKYhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <95b6cdcf-2ceb-6b38-3318-afbd3b985a68@suse.com>
Date: Thu, 19 Oct 2023 13:04:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 19/29] xen/asm-generic: introduce stub header hardirq.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <cb76190d2b0b056c6733c1f5cfc941d0201f6490.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cb76190d2b0b056c6733c1f5cfc941d0201f6490.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a1555c9-fa70-458f-344a-08dbd0933b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IUhTGJ2/dOkDzh1gv02IXfWTrrtnANkhI820c72a2SiCQmaRYESJSgxRh6m2qX77jN1lytgmNVuUHhCZNcgxsiBFJN17Asbm8qC0Mtc8qx3Dt1zLA82ll3eDBjRFKGDud+uX5qQS3VHTEhSKVly679530pS2P86aGeTQGLGrYR7kZJyhnOgkaUEgL6yDN0La8QCUPhMkhZ8IiyDgnqSQVU01aopAZRY70aG/4pQHVM4qqgUW/8EqgLdLPDZ88J4rFmYxQCFA8PwFsJHVjip0xl3fayu0UE9rzVuaNm8Zy5pz7QKBXnkBAoUmrrd2m2ItGnGbmhfPKkFGZDDKL2MT9JnjZIdxHIBpnQewOTZHT8xOtwUvT/77K1lmm9f87MnvXw/J6q8zCr4EUYoR1LpmuZ7pleF2wCPtPqzsLdVLcQowvRzQt14zinPwH9ENdzu+j+rUSNU6DkwbpQcGVvyko/bCepJFv56deJztFpVRHNuBTOUKqQnmoeSSiXMLIkW35fUpRp2zsW/6wyZtGHZyWJCkTvxKMg/rH3Q/BpbQPyFFu1z5KNb/rzY38C64SflHeYUDLPKjDSuQb1hxYvnQKIdLU6WRx2VFqFoBtYrzI6bObvRw/6WEYkmMv7PSz+RGqEgVyo6NBnHVz9nDZZDfmDBFmV2VZmW6R4Zes3LKDjw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6486002)(4326008)(8676002)(8936002)(4744005)(31696002)(38100700002)(2616005)(86362001)(478600001)(53546011)(5660300002)(6506007)(41300700001)(26005)(54906003)(2906002)(66476007)(6666004)(6512007)(66946007)(316002)(31686004)(66556008)(36756003)(6916009)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3RoVEwwY0YvaWdERWNFMXI5c0JyVmhtU2U1bGNxNjhOVlMvKzhOZGo1VEo3?=
 =?utf-8?B?bFI0VUh3Q0hXZUpsbWJkNnFxam9sRTFOZFlvcVA5cW5lQVFGcmVJbWlmSUUr?=
 =?utf-8?B?eEpoOFFzOGZzNGF4WnJpWVZ4Ym1va3J5VkJiOHREWDRVdXZQcTEyOUVlLzgw?=
 =?utf-8?B?WEZzc2QvQzR2Rk1CV096QWFyRnIrTTJHcGdWYmgwL3N5TjZvb3Z2RDI5eHF2?=
 =?utf-8?B?VG9mTGtXbFpuNDhBTzB4VnU5aGo5bzdEQ1JKMC8wNnI2TDlIR1NLeEVqQXdr?=
 =?utf-8?B?ZVFLcHMvdUtlUEM4dkk4ZnFsQmxYRVQ0Y3A1TTJZb0I3KzNxRGROL2tBcFd5?=
 =?utf-8?B?VzkzUjlEUWRJclIyYSt2TSsvRFY0UWhwclVFWG8zU09LLy8zVkttdE1PL2hH?=
 =?utf-8?B?YVJ0L0JYSUN4b1piT2hrcjVDU21keitsVWlWRzRlL05RN3Q4eWVrSjVLcEpH?=
 =?utf-8?B?a01yWUlBLzRsNnFzbWNodGIyMWRDVzErSjBFQlVRTWdYQlZ3SzZzakRVeWVq?=
 =?utf-8?B?VG80aHRKRENFVmlkcGRmclU0SEwwaVNoYW1RbXlXcXJXT2dzdFdraGkwK3NY?=
 =?utf-8?B?a0dLL3Aza3lZUDVSWTNKL3Y2d0lSUW1QTncwL0VkU2kvb1ZXMG1yby9rVm9S?=
 =?utf-8?B?US9nOTJ5OEJhVFJBbEQzT0pvM0J2dWhkS2lXQWZXUnc4RlFTVHFZYzJVczk0?=
 =?utf-8?B?YzlMSUlHd24wb1lvL2hNV2Uxem01bUhTQ3h0TC9jS1V2WUt2SURVSFNZaCtL?=
 =?utf-8?B?N0Fva0ozS2JIL2RJMk5RM2Uxa3FGUTR2RFMraTZDQUZXMlJUODdtQjl5ekFD?=
 =?utf-8?B?RVlPUEI4VnMrbVFuL0JZQURTaWpRWEJDelUzUlFvbUxORmNWV0VmV1ZweWp2?=
 =?utf-8?B?TVlneWRyVFo0SmZhcjdLRTZ5VDFObXhYcGd2MjU1NU1DbDZmZWpKTUk3ODVS?=
 =?utf-8?B?T1FpV0k1U0xPcTA4dXp3aFFSNE1LdUtHSkxrcUdsNFdlS0ZpZkx3YnBXeHZo?=
 =?utf-8?B?dHZhUE9EbHZ5b0wwZ3MzMmJYWi9jeUZKMzdWZURRRWJHMU1LTlk3andXQkxI?=
 =?utf-8?B?RXlVWXhpb29KSkFabTh5NGtRanAvMWZFWjc2Vk9kSVlzWWp2UnVnOFU4dGla?=
 =?utf-8?B?d0VqNk1xUU1GWHErcnJwZW5aWkN3eC8xYlJNNWdONmp3SUtianRzNjVSYWZQ?=
 =?utf-8?B?djAyczBtaW0valRMRS9PaGxXS1huYjJTelBSTXJuZmJJWUdSVmdGNGREWXdI?=
 =?utf-8?B?OXViNzRYbGJOalYwc0RHVUNUK3VJYzlvQm1iOVEwMmJwcDlJMW1YMTZvdU5y?=
 =?utf-8?B?S292KzJJMlZsQm9mR0JWckFDcllzTkRhRTU0aFhGNjE1dFhSVkVvenVZOU14?=
 =?utf-8?B?TjJITDdOMnRUSG9CMkE4eUZpWXdZVm1la05HUERIbkd6cWNlMGZnMjR6aEo1?=
 =?utf-8?B?dWJrVzZyU1BBdTkxbytzVkhsbEorZVhlWUw5ZUg1U0h5d05tVHhZSU5jZmdZ?=
 =?utf-8?B?VWdXd042TXp5VldmMG1yNldmMkg5WDNmdXc1dEMyNFFQeU05VzVUd280b1B1?=
 =?utf-8?B?Z2NwOFRsS0lFQ2JjQkR2TkJGUTBkTmxXelk4NGJqYnRpRkNFQ3gxM0FIdTRm?=
 =?utf-8?B?THhIZktGV0xzS1NFUHUvbDYxVi9Od01CcGh3SW9JM0JjaENLdzVBWXdDbUJk?=
 =?utf-8?B?L1QvUi82TVQ2WkdCNmxuMDhuWDJ2SE1HYmdXdElrRktYb2JKc2ZTOUtDNzRF?=
 =?utf-8?B?VWNjb1VaV0RPazVzbTd0V0tGMU1uZE5MczNOM0ZhTmdOOVRQcUloeWtsRXhk?=
 =?utf-8?B?Qm1ZeDl4RXlpQ20vWktJQ1gwRXh2S1RTUFNqeUhpSHhwbitBL2oxSk93R0VD?=
 =?utf-8?B?WnpkN0hxa1BvQldXeHZpYXMwK0I1VkZKSEluOTArTkpWTEljVHN2M1VqcGhZ?=
 =?utf-8?B?QVkvckNSTzFjRCtqQjRHY04xWVhhMTRDMmNmU2lRdUJTd0d0Z210SGF4Ymhl?=
 =?utf-8?B?azVZMTZnU05ndUtWV3lldDRWT0RrVEhHMGJWV2hnYnZxZm13Wkx2c3VQeHpP?=
 =?utf-8?B?ZTNmeWFmOTc3NGZETWpZNDdzL0E1ejhmbnRYWGNKMFJCdkZDbVVvUXdnU2cx?=
 =?utf-8?Q?a9tc3xky2k4qMAGb6mQykSHtV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1555c9-fa70-458f-344a-08dbd0933b94
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:04:58.3868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ri9c/JWu+1tOiVp1LjG0chK0v7lSDgj7nznUVxt62XURrunMlnU3ZwpnU2Qe7f2FOL4t4p7gB4CxVf63zt7bSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7016

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> The patch introduces header stub necessry for full Xen build.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I agree this one can be generalized from Arm's, but ...

> --- /dev/null
> +++ b/xen/include/asm-generic/hardirq.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_HARDIRQ_H
> +#define __ASM_GENERIC_HARDIRQ_H
> +
> +#include <xen/smp.h>
> +
> +typedef struct {
> +        unsigned long __softirq_pending;
> +        unsigned int __local_irq_count;
> +} __cacheline_aligned irq_cpustat_t;

... where is __cacheline_aligned going to come from without inclusion
of xen/cache.h (as Arm has it)?

Jan

