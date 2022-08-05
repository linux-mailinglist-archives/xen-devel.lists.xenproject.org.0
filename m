Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD8358A9AB
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 12:50:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381040.615535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJutn-0002tV-SB; Fri, 05 Aug 2022 10:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381040.615535; Fri, 05 Aug 2022 10:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJutn-0002r2-PA; Fri, 05 Aug 2022 10:49:47 +0000
Received: by outflank-mailman (input) for mailman id 381040;
 Fri, 05 Aug 2022 10:49:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJutm-0002qr-85
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 10:49:46 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10081.outbound.protection.outlook.com [40.107.1.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51449988-14ac-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 12:49:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9005.eurprd04.prod.outlook.com (2603:10a6:102:210::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Fri, 5 Aug
 2022 10:49:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 10:49:43 +0000
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
X-Inumbo-ID: 51449988-14ac-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjudNiKWHfHPLbFJz3gYTzj/n3ZP5AfdEA4OYAzIqRyYgujN8PH34OAerykrk3o4iUhvKSwZqjG7+93P/KXE6p2frbkj4J9WUaIBvEKifdJNpvNH92DariNMrqMaSWWBS+qveqd+OnvNejGixqFObL9tQ2tmYMN/iVE61Br9ulEaHGSte+Za72547pu+Es6OKjWByF11pLC9gZoYcYqGMS3EN9XjIoSeiaHtJ1b7YW8txC0n69cZPXkatVf40yKl6M/k8HgawuUu9fKtPgepob8q+jWBa0R04kfw3gaIH+ZN0ChEJnTu+Eqrf84f5JZlvwO11OAC7O9XBleAcn1HvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFhSKgS0YU2BSbGbqtSHBOUUm+kibVkvmZTipaDwR6Q=;
 b=ZYW23ofAoskmupXZ2h8EusLoMqieO1z4XPZ1rDP1i88i2u8hBs8TrqOgm5v7S0mrlq4dHDWh05iz9KRk9oRgDu06UJvX+XsSW1LH+R37jXxw1usIXnq4UnXjoJFrSmR3xKiZhGx95tV1jXTcTTCJaTcFT1BDDPAcHTAMh4FWadHyv5WYEA37MjtqxcIXPQogLkrQnRmEbi76VoBEES8Zi42DvGJ0v14vjp2N1Bwgsj7kwsQlr2l6rsncbdBDPy0xPVUi9EqKulops/k20Lo089z+gaDZvTqtbnGucTx43vtLFMI+AbhENuygDnZTS4oriKbUn64XrQrlyNAXtve6eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFhSKgS0YU2BSbGbqtSHBOUUm+kibVkvmZTipaDwR6Q=;
 b=MzwI6I8Fff5IchrKjlkT7Q3P8m7TnvqXfq8BzxZm1ChtUl5dtPDbxa9zJHEZAo0y29pOh7ppQ3nHbNQcP2bEP3RGYa9nJMgMssfQuLC5VpoEFEN7asOr+g5Lunub26Si9b2owUw+M1+z5bvsY8JicuB5bnJ6vjWM3fn2yUm0sfzAyuaoKZ/mfss/wg/G5+BrEEx3shubHgmtuUTFfr5GYPaPCNhRi07k2uOpJ7py/Co8jFCVGcBi/SeJFouX6Hjq/HQcP1vFg6bQv43G6JDTzkWlLBgrWLVXIxbhLZDjadNzLaCIaVgaG43S0Z7rPiWGkAs1Ry/Uqa1xmLirACDPGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab786545-6cd8-ab89-7b94-0fa3cda464ae@suse.com>
Date: Fri, 5 Aug 2022 12:49:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86/spec-ctrl: Use IST RSB protection for !SVM systems
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220805103814.23032-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220805103814.23032-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0001.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c79c448-83d1-43a1-d2ca-08da76d0345f
X-MS-TrafficTypeDiagnostic: PAXPR04MB9005:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V+jZOyqpjragnjgJk2vGSfBZB5tC6bnZfgqbtCGP/FNhA7BfHwKbydxdOw2drmhwHVGvW0h5NuzuL1XXSqJbFm01qDAq++Gj+J31CkR+5a85/C15YjIysAluuxaYJsvrYnMgUBNuLeQkSTD537ec9EDBgdaNqK28cjU7t8G1uLyoO9fbX+lQt13X1iPJ9Q+aOC2ZmEKHl3AZm/UUYIRSLnsUK8L0qivlaUONkqupqAFnB6xRHB4m5fy0j/waUYNoMoPze3e1kt81mufR1W9wtfsBthSOdnUE4WaBKB2jP/O54NG2Jw9QDgrYgzKzxeOToGbrpWsvStHsXfg8W0PfvonFw1IjhY/8nBX72FAkhsKzl4UxTjAyc4hFPnvnYQMSyC9J3zih2H7ofR4W55DTDehit/8HAMEjXMeB73vobLLppZDJw5JovLVf/QXniZ17q+e27OSLRQRWzjLOfqGPZmNnb1p9fb5EO3h1yT4ml9ublfiRJkEWUcW9JrS1ykeO9FTwmFkzoAoPwIUkQW9Rz0NCGrIkX1ud5mhz2Z1gRjUnuYckoWyI5wLavXhfSqmAcCyaWcOr1k38WU43wFvjeeVekq/dQGfZoqI5RHIFllZKCy1RgtQj2MhBUoFXUpiLUfmX4VeAQbkJua8qpSC8CVEMa9Jl+uKvVELsMixgUrtmZsCkxDqgjvdDQBgBMfSfhNvxAOUNrlRuDlCLUq3Q8OyqWOhBjtASnqDURGpiOSYRpNzXvOBkwBq8XTp9JEQU/NaKvewWno6El2DNzzC0AfO7GYChgTtAZymefqo4DPLE1RHMzNSNnGdtjADf7kCDUHb+4iSzIUh1yo83i9l1YQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(346002)(396003)(39860400002)(136003)(53546011)(26005)(6506007)(186003)(2906002)(6512007)(2616005)(38100700002)(8936002)(8676002)(5660300002)(4326008)(4744005)(66556008)(66946007)(66476007)(6486002)(41300700001)(31686004)(478600001)(86362001)(54906003)(6916009)(316002)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTkvTXl2K25NalR1V1MvaTN5M3RneE5BUGJnUlFGMmRDbWFEYUJ1bGdGcFVu?=
 =?utf-8?B?Z3dQb3hGbTVGNG9POU9FaXNCTkJrczg0bWtwRS9LWXpyWmR5SE0ySSt0eWQ3?=
 =?utf-8?B?Rm9jUDE2dDlqUmd5R0U0Q1FNOHdCZjRyTTBRMkhhY0MwM0E1Z0R1RnBMTWUw?=
 =?utf-8?B?ODFwSlpvbDJlUVpQTmFSVk8xNGtCbEJiV3NONjhyU2RKaHU0dHp6c3pYd3Ra?=
 =?utf-8?B?NXhRbkxoRWxUQml0K0czUVFYYjNqMmJHbjdhZlZNMC9zdE5OVXVSeVg0dnc0?=
 =?utf-8?B?VlV4dmd4VGJhcFVVL2dMbTZDVUdMcnZRRUk1UkM2K1JBNHptelJkTVF3UWpO?=
 =?utf-8?B?dkR0TkVDVVB0a01UNGY4MjhMb3o0UGVSNGN0anBFRUo1cUQvek1Nc0NIa2JJ?=
 =?utf-8?B?MHk5RFRxOGtJTUVRYmorZXNkQjBISDZFSnVFSWFYTGRtWWNodVZzWTJEdHJK?=
 =?utf-8?B?Z2NsYjJhWTRJNnZJQzRjZStHWGd5L1NCV1pxMEVRbzh4NEpZSVRFajFDaGlX?=
 =?utf-8?B?M3hQbzVFWE1ZTUVrSm1qcXJqUnhOQTNhbTU1ZGJnWlJQMWxuK2t2bnkxUlJB?=
 =?utf-8?B?cWpRMzI3Rmp0cUJCMTM3NTBhZEg1WW1vUWxpbUltKzRQbGdEMHI3VFhuL05w?=
 =?utf-8?B?NGxCSWxadEEwUkd2by9VNnN1VUlTbmtxZllBQUtmeVFZN2taRDcxWlJIczE1?=
 =?utf-8?B?MDlrTFFybS9tMmJQdXQ3VkZyWDRRdnFJSEVIMlFQYXVxZXRqUFBtc21KYjJ6?=
 =?utf-8?B?ZjRQUGFTZEpEUXBTNFVqSTVqSzlTODNTc2J1MENuUEdoSk1YV21ZcU96S1l6?=
 =?utf-8?B?eGxIb241Z3ZnbE1ZVkxJVnBDSWYra0hFRzE3QzdFdTk0SW9namdRSEc1UmhQ?=
 =?utf-8?B?ZFVjaVRSbklWdGtGbkxYWnlkS3dNN1RwWFRyT0lOcmlEV2J2bERqWStlUW1h?=
 =?utf-8?B?YXNGZlI1ZnFhaHZvdXcwaExoS3RSMzhrZzVFS0RLajcwVXBmTE9XRTYyM3hW?=
 =?utf-8?B?K3MyV2lTWFVoeFhWdmlDTDJMMVhESzdlTlFpcGZQWjEzWDVDZS9UTXRyMU1u?=
 =?utf-8?B?akE5aENXSXJVQXZVTHpoeGZZWS9zZStTTnBoVnpmQjZWVDVxMENmUDVhTnp0?=
 =?utf-8?B?bWhUMzhqSkVFODlRaG51SCtGc29nVGdMTnhNemJlM1RiQ3VJOGVXY01OeEV6?=
 =?utf-8?B?VkNJNm5VWVkxbGEwQzFWZkw2eHI4Qkp2N2tEdmFDRGhaeFhaVDhCNkIrcHFC?=
 =?utf-8?B?VFJqS2xrL3doRUl4TG9temJWQytoanUyaWRGTVdIWmpCMmJXRlZhSWQzNU5S?=
 =?utf-8?B?a2xwekljTHlWbXRxYVZ5UXl0MG5XVm42RGE4QUh3L0gvRE5CRm9ZSjdjelFh?=
 =?utf-8?B?SWd2SFJRMm9iVFlHYkZaMUFndkVoUXZBcWJEdmZnQ3ZxRmtaZkNSZUZwc21G?=
 =?utf-8?B?QzJUcW1sSkFpc1QrZUNsYUNOY01tcUdBQXdEa09ySW4rSXc0NXFHclpKWDdv?=
 =?utf-8?B?THFaOWxGallnTjdRZ3IyYXhlUnM0N2gwTzlLd2FkOXAzeWJ6ZWNzZEdpS2gr?=
 =?utf-8?B?R1p2R0tJU1dxdTI1V2d1ZnlOQ0RIOHJwbDdtVFVibFBObmh6ZlY3eE9hSm5v?=
 =?utf-8?B?T2FNNDVSN2tDZmxwMm94VjdLNW1HMjdkckorb1NUUmU3YzlMcTdtQjV3OXhC?=
 =?utf-8?B?eENUZTdBYmZreDZsaVhMdHVHWWhHRDdmNUpFZlFYTlA1NlJrNnV2bVJoejBK?=
 =?utf-8?B?aFZxZFBvbFZuaFpaRUxOV2UxeUdvVHUxMjFhVXMxL3J3VkIwdjlkMmhobnJ0?=
 =?utf-8?B?Vk5BSjNmTmEwRDFhUm5VQWRCWU4yZzVyVzU2VkdadHlLUWM3c3kyS0d4ODNt?=
 =?utf-8?B?eEVGZkpBMmtpakphWTdsd2pEanBmOExrT2hHWjlOcFFNdTFYWmdZU3ZjN3J5?=
 =?utf-8?B?d1ZZdmcvb1E5UkN1Yjk4c2FTbnhPS2lrblNvTW0ySlgxbzJGR21ORnBrcGVK?=
 =?utf-8?B?bzN1YWNma3lzNmhVSXhaVXFoK2h5aWtsaXhDb1FRV29ESVl2bWsyRktKMnJa?=
 =?utf-8?B?QmpwQzl5RW9HTDNPTk5DdysyUTQ1Z2JHcFhWaC93aTFnajlvay9CTlNPa1RT?=
 =?utf-8?Q?9/h8zRZ7QzXHogEbvhFnfpDGO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c79c448-83d1-43a1-d2ca-08da76d0345f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 10:49:43.2504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQD06uXePHE7NNjuXj//6ZyXsrITuoRsdFM4pb3BJYrNgPOOkBaZHAPlSe9IRD65ZJrQuHiZLDDZDDpali9ifg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9005

On 05.08.2022 12:38, Andrew Cooper wrote:
> There is a corner case where a VT-x guest which manages to reliably trigger
> non-fatal #MC's could evade the rogue RSB speculation protections that were
> supposed to be in place.
> 
> This is a lack of defence in depth; Xen does not architecturally execute more
> RET than CALL instructions, so an attacker would have to locate a different
> gadget (e.g. SpectreRSB) first to execute a transient path of excess RET
> instructions.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


