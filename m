Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E85F97A096B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602578.939235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoNW-0003id-VN; Thu, 14 Sep 2023 15:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602578.939235; Thu, 14 Sep 2023 15:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoNW-0003et-SJ; Thu, 14 Sep 2023 15:35:38 +0000
Received: by outflank-mailman (input) for mailman id 602578;
 Thu, 14 Sep 2023 15:35:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgoNU-0003eG-U8
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 15:35:37 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58715c1f-5314-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 17:35:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7370.eurprd04.prod.outlook.com (2603:10a6:102:92::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 15:35:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 15:35:32 +0000
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
X-Inumbo-ID: 58715c1f-5314-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCM1BMf55ToFI9fWvkSI6DyHaGY46v4Nr5RWZCXfqKlEGXIdBSOSOlcP+emq9oB8qSAJchRk2ML5Z+6vSxfRQteLKC6D2utIDWkydGVKIqfNXFzp7qLuT35dVCgrG8fZ3X4uiDRenQjQ8ap7AZ97N8+/IEPVMVH4qw4vUkkN3OsY6A1AXzaT3wV1UhsYAhNsN0xMP1y58LV4jAOuluE3/L6YuOVwK8ASHHrrVtWdxHpX40paU9RoJKyPwLTcjezm0ScpAorHy5vjxid+ONNfUwWuNP7hjd/Gc6ZiuNmL98g0yXDWmkqHDY2ue9A0mlCOdKRycGyyKdWBW8WEQxAAtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngWffglW8oAO1benmUgzFd5MqLRVCH4wCdIhgxMQ79w=;
 b=j+mxnx/b0F+fx9h1DwzVeN1S+qnh5tg/mbV0uofyKdatXGze2CiaD7PeNbcSKfg6TmJJAi1t+vWTij6SkshlnxFlzboilEDy64dBi2FOVf57L+9xgDS6OkC1L9v+o2Rmk5Kte5F7D5VS+4LlSlFXtmPjWPjRr13sh2Aj0jF3x2y4SYk754DNswL7GvH/dY/TBTix7WdABkfaGlISFHtdgIOBeEh0D+z5R6fN06YtJj/mRVn79IKn9tZ1sINvcdm0vUChnKdsTSC4Uj5HrPUG8lZjOOlJTeGxmjhnK3LdmYdHDIFraizAxdIe/GeI8MXnystGaTPsGSL7HsO/zTBrDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngWffglW8oAO1benmUgzFd5MqLRVCH4wCdIhgxMQ79w=;
 b=ncDcy/56HhZo7IYxFwPqRnu3n97cl5sAFbYHFPwlDkEFczHYsdpN5Np5s3/G9txWgiG9yeacs8YAnvURB93DH4aeAb7WTPiiGx7uC74K6DJlSrx2kXdZNkLTdFkaUaPZZIuN4OyEOQte1D4h8fL4a5B0N4PbgjdDuCE3cmdEuHPvxOd1PkZK56b5h7lsVcmeG6NjS7v9Ud6kEKpe47gTC7AaQV54g+PBeaJudo2H/r0nj2Rc7cDvQEJ+iitwvUxntx0drLLodT0XLpqdyQHuFyYpfIxuOTqNNN0qt8cNLUU/lCKIxht3/ZlM+zyRd2G6MOOv53WVqjmqfSMZm2Rh0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bffaf38c-551d-b9f4-5060-3803e73bee70@suse.com>
Date: Thu, 14 Sep 2023 17:35:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 01/29] xen/asm-generic: introduce stub header
 spinlock.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <30743e7391ad474724258441b7ec83affcf6b230.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <30743e7391ad474724258441b7ec83affcf6b230.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df006c6-2d00-4009-e966-08dbb5383b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VK5VYUqFl2bjvAzyCGZE5BDWG7R8zNZN3pFF3IM0UFHW8F0N5SipezcndQs7WgzHkbQLjZDsJWuu8a7Hi7xdCUmJt66mqPtHnf6vdtKTMYtlxQN66I4BL0xVvOblMkYSFwCuqHMw2qCr+MZpiIr5FKsl/kl5fXhj9fQU3mnxnXi6AiQnQxVBkRF43MczPDk06XDWp6JZQsqyU5wcLJ1HQJNJKEBMRlOSRWTmNqWI9PPMwZLeAztiOj1FHJKYj7RG1E0InVgHpnVnNZcmPN107LtFYzOa3eztTrDXdPzW6OeSqdf1uUWTwXTMUju+1KUqCPwO58dz1fpK3BO2tEmQv/V24V+0x7uPj216suCEvgUVKItzKOrtXPHgZnr+QlV1fNmC0hTRuf0bSjyDhvtyQF8aIUdn3xWNyC8ebLyHP8ItxBxDUtAwMhCyt2pvcF3rRT4/EjnWZWAlhoXjyGHCJXT/6XmLXEWk7tFYUGn8TLk4DfNBVdH5Te8WLiDXze9nlMoRrvbJA9nCEJzRUmQLfoBOpONFcnKXufGi8m1ZkKSqL7tD7gTrYGhW9kafQxUEpbrhY74N0SPVgjWk1qHModrAtQWkzA6C51sEhBwnQxjDt/5eRGnxHPY+qNtwMR7j5YXSKj7WfR8ocH1YniyfQEb1UyVGdY2ovmhdxZYzO18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199024)(1800799009)(186009)(31696002)(54906003)(6916009)(66476007)(316002)(66556008)(478600001)(66946007)(2906002)(38100700002)(4744005)(41300700001)(86362001)(4326008)(8936002)(8676002)(5660300002)(6506007)(26005)(83380400001)(6486002)(6512007)(6666004)(2616005)(53546011)(36756003)(31686004)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1VsWVc5UUIrTEJod0ZsMjNyZ3FBUjIzR1Bla3NPQzVVQnJ5VXdzL1ZrMkYr?=
 =?utf-8?B?U25WUGdnSG9aMDBOUGFSN1Bjb2tlSWtsaHUzUVM4Umw5SHFMcWFab0s1NjhR?=
 =?utf-8?B?NDM1NFN5WFdlUUY2Zi90QU9idWRFOTZZTi9sYU1YVTZxREU2NUhURytLVGEv?=
 =?utf-8?B?bkhUVVBCVzJSakVQOG14ZkxwdXBVQ3BoMFVyVGVsU3d6ajRlWmN5dEJDUWM5?=
 =?utf-8?B?dkh5bVROTStVamVncVNnMHZ3bW1FQXZrbjdLSzljZG1VQTlXTWVrVE9aT3p3?=
 =?utf-8?B?U2Y1VVpVc0UzbDlueVBKd25TLzlNTUhLQzRWMk5RenQ4eGFqZGhPUlAvc2VW?=
 =?utf-8?B?ZGpOM3hMM2krRVRiT242SG1uT3JxZGpvdTBzYU1mYlJGV0xlWlVXMjh6dmVy?=
 =?utf-8?B?RHpoUEJEY2svTXFBTDV0R05La2luUTBFMDg5MkJGemxjckM2OTNOQ0cxQlZU?=
 =?utf-8?B?WkxtSVFLUXc3NGhPdVdDQkVmTzlScW82SWQvV0toRXVCM1htS00wQWRkbkdo?=
 =?utf-8?B?bG9uSC9uMHBBSXZ0ZHlzbitoQ1l1QXY2VmVvWkNFUS9kVEpCMHNocnlIM0lP?=
 =?utf-8?B?elFyajJQdEhybHU5VG0yL251Vm0wcG1BUndNUlRDd2hqZDh5VVRET1pxU251?=
 =?utf-8?B?c1h3VmlGanNLSndZSk9oaG5UeHlLWU10S093S2ZHQWVDTFJROHoxQ1BxejNI?=
 =?utf-8?B?ZUt4cHBTOElWZUUvamt5K1FTQjEzeG1HYnJNUEFZT1hraGtHV3ZmWkpkSzlP?=
 =?utf-8?B?RkFUZTR0dXVSSDFGWTRnUURxRXduTWUzbTFuRjVVRHdzV2tEZnpVWXpDL0pH?=
 =?utf-8?B?RkFoai96WkZnTkNpbDdxcDNvTVVKdnRkcmVqSEJpS1hIV053WTdvcmtZcjNI?=
 =?utf-8?B?Y0JvSVBSRXRGWEtnTlF2TFN0QmhMQU9DaDV5aDhQZGNQSHljZDhNMVNYUTVk?=
 =?utf-8?B?S2JLUUlIbnB6RUJybEcrWVNaeUhranJLTERpYzZyVkY2NkRjT3FuSElObU5n?=
 =?utf-8?B?ODdaakZBakdrT3pCVFJBSkZ5cHcyT3hiQ0tueVFjak9DcDc1eis4Z08zelQ3?=
 =?utf-8?B?dUR0NDE5TVdlSWNnZmdTZ2NFWnhjd01oN3hXNEtsM1NKYkcwQWVCSWQ0WUV1?=
 =?utf-8?B?SzQvYVg1czAwN2pHeUtrekRkRWlTOGh1bEtRdEQ0MUJIMVhIenNpcDBvcHBh?=
 =?utf-8?B?cnVHcXA1UXpzVU0wTkxIcXBrWkZ2RjI0RGx5QU1aTFNnSGQ2YlZYZ0NQamla?=
 =?utf-8?B?dFp4eXJ0QUttaUZGWVNVNVg3OW1VUURnTkRIdDkwcHVsTkEwVVFseno0QVhy?=
 =?utf-8?B?NW9FZ3hkU2JQM2VabVhYaWduK3ZtMlJoaUo3djJpaFRIZit1NkFOdUZCQnVN?=
 =?utf-8?B?TmVQUFFhMUY3ZlVWQXRaZ2R4YlBvQ2VpNDJ3bW9oUmlVc3B0WDF2andxbW4r?=
 =?utf-8?B?SmZvRHJOcVRWTy9FbTNncGFOdFQzT3VIeFAvRHRPYTJKb1VjMWtHRGc2RTRn?=
 =?utf-8?B?RXlkbWFwTFJIY2FhZDdSMkY0cE1tZnVSOVQwLzFHaWc3NFJMdmdKazMxQ2du?=
 =?utf-8?B?SkpwdjVHK0lLeFlUUlNPdmR2c05TSjF1WW51QzN3NnVHVmo2UjdvZDlQTzdS?=
 =?utf-8?B?QXJBak9yaHZ2bTRQTnZmelZ2M2ttMlk4amJQb3F4ZkJXVWFzSVJ6L1E4SCtn?=
 =?utf-8?B?alBKQTR3djJsVWt6SGtMeEpyQzhablRidjhrK0FpZ1BNMEYxa2U4cmNhZHNY?=
 =?utf-8?B?MWpJSFpzTEtxK3FVbk5LTmwwUFpiQzg4TUxlcitvQmF3bEx6U2ZheW5XeGFa?=
 =?utf-8?B?a0RMeHU4Vy9LcjhHUXBBdUttblZGZ0VDVWtNeVd5TEJIbURpM3lMUkpJeFdW?=
 =?utf-8?B?cjFML1NvWGR5ZERkZWFadXYvRHpJNm9MZk1UYURRWEY5SEFIM3BwNzlMb3FM?=
 =?utf-8?B?NFlMRjhCNDBzM0F3U1RpdjllQ1NJMG4zc2NQOS8rZ2xQZ1dyR2ExMW96dkNk?=
 =?utf-8?B?TU9YdW5SMDVPR3l2Rm9UU2J4NDlSU1hnVEpvQkErem5HT0VaZEd5eFBPM0Ro?=
 =?utf-8?B?ZEFQakpDTXp2VnpSNXB2UDByRElwcmpxRGdSTUZrdTl6VDMxYndEVDJLNWNx?=
 =?utf-8?Q?+F9nbX6sJm5JR0BnCjx9KA9Kh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df006c6-2d00-4009-e966-08dbb5383b5e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 15:35:32.2939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOriaeusAv66enpEXHLYhADmxYAGJMc0/tU7fEFtmpm0DO81H2KHmrvL0MPRq4Zyfp174m73Itry6dCpjI2Ijw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7370

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> The patch introduces stub header needed for full Xen build.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Hmm, looking here I think I need to take back what I said in reply
to the cover letter, taking this as an example.

> --- /dev/null
> +++ b/xen/include/asm-generic/spinlock.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_SPINLOCK_H__
> +#define __ASM_GENERIC_SPINLOCK_H__
> +
> +#define arch_lock_acquire_barrier() smp_mb()
> +#define arch_lock_release_barrier() smp_mb()
> +
> +#define arch_lock_relax() cpu_relax()
> +#define arch_lock_signal() do { \
> +} while(0)

Slightly easier (and without style violation) as ((void)0)?

> +#define arch_lock_signal_wmb() arch_lock_signal()

How's the WMB aspect represented in here? I think you need the x86
variant as the generic fallback.


