Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0C677B39D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 10:14:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583479.913699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVShA-0000OG-Qf; Mon, 14 Aug 2023 08:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583479.913699; Mon, 14 Aug 2023 08:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVShA-0000Me-KV; Mon, 14 Aug 2023 08:13:00 +0000
Received: by outflank-mailman (input) for mailman id 583479;
 Mon, 14 Aug 2023 08:12:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVSh8-0000MY-7A
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 08:12:58 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2078.outbound.protection.outlook.com [40.107.13.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fabef3d-3a7a-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 10:12:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9000.eurprd04.prod.outlook.com (2603:10a6:10:2e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 08:12:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 08:12:27 +0000
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
X-Inumbo-ID: 5fabef3d-3a7a-11ee-b288-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0HUthNGrPKj/0sv9V5I941dR4dNaDMbqqtGj7mOSEyG+n7e28Vyk+y0GvRseg0zVYJDqkNVJ0GwUMwshgAXGxLB767lqysG49k25E6PWbAzPjaAxBEItOT5eR7XspgRteVruPTi63mHjzrCEiPT2bvyFIrMvnbB54HAJ8dshcsqxe7Kr/yaTZCUwOb0sAwduIUbSWkNdhcDX/wyzlotLs1mxFpQFR4e/TtlsZ4hBQwabcd7kjJ9mjeUxC92Jt8fkNvhUPQj/xLxyBdqfuoLlCAMJwg1XtsC5vueubJSIuFJj7fBuDjC9cWed1j/9AyK9c0dbRoLeqAqns+K5lrFLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+lz7iz1mLjgFVXCKycP+9u0HBGICLNhuwosAPgaU5g=;
 b=aLry7Yfpu8y+Bfgs5MVKRQnvhLHqZnmVF1PWs2pnb/4OHEJINjOEef6nl9WH9Oi4G1OjjBaNlRFMoGYMHt6YwgQQCDQP82e3i+5uouxBFpOIA3cAocoIkvyphgwWaBrq1JjvmrkgIRaRyQfy8ILdG6C1WYgo2eI7zXtst82ijC0WXSdb8rJJRaMRyqE/A9l3/CJjbwnq+dqgrKfyRwQdU6WQg7gb4r3sS+3LMttMtcZkgkMPYOAfpAge3ucIiW4/w+U4LEGNbsUPkNbxmx+e23LSEkGwUmkMd/VH8+CPRn+WBtNIpWdhM9ywq7b2Ijb/tm1DWRLPzQPZqInEIRhNOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+lz7iz1mLjgFVXCKycP+9u0HBGICLNhuwosAPgaU5g=;
 b=uqSZ8nUSsBka23TK4agz8WXbEhHKLd6G7WA3e9ezvSoGH3QNdmFfUftU4cx9ldXmJM704Oe89tu36IWadzggJ7ypmMkoNq2D+jegjcex9FvLsiACS3v1t8g2pUuAHv1iuDQf6a5KET9f3COvezQMEdo6M0zwDJhZapX5WnrLhS+vT1HnBT5CqB2ganvAI82PlsHsSyZTT05IwcL0icGVeJIoGCTvSA/nVfQSVyUTCkPAPFNewOoof4fzDX+pMzNFVPvtHRvxATsVSF51mnA4iGpVfLpzF2OVLt4mYjIa1nUD4YLsQJcrQQkA8UPJvNgb2ozmN1nju81+04/qL6rOyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <71a796d3-6808-460f-7abf-10adc07f4329@suse.com>
Date: Mon, 14 Aug 2023 10:12:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 6/6] drivers/video: make declarations of defined
 functions available
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <a50cc0f60c536554591834da660c540fcb77faf8.1691676251.git.nicola.vetrini@bugseng.com>
 <d021c6a0-6826-351b-1613-82ec9ad85868@suse.com>
 <fe1c5eeeb01cb2690d80acec2bfdf721@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fe1c5eeeb01cb2690d80acec2bfdf721@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9000:EE_
X-MS-Office365-Filtering-Correlation-Id: d62bae7c-1a60-4a70-6d77-08db9c9e32cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hmv90O7pfj9p3PnMbYoVhBIPTRAsj2lHa9R1RYz+Yepa0hsN2sAQnTItmEQspIWWgDxprNypofCKLk0lfDz0NF3YdlAN8zM+XieBaRfPfRQyDTrd72ymZDRL2JhlaDFyHSchLfzJsJmThbsODKOVRLZ8kJ1BDTjvg3Mx/ccmcZMFI5Ccz4nnrsTh7WRQHgXmQRpikLgEK8avWDYI4KSoMPC0PtgyxVFnh4kE85MBvMbvBijQnz/C5F7gb+ZzYyFthdriQr9oDQWHSdnAmZ6V6fvAo31NNhw/oZea5aqiY3LRD0MXoh6OukqAej1Fdi/KvLciAB9EErbHC9FToA/lZ61PNz7HDw1a7QEgwfYvT48NGfSjzFl/mrzV2NSgXOJFGUEKIz2+EhpAoz+PTEjvapypbX2Y1cvwtQJ6Al5nvKvFGawhjx2A9CeRPUZEf++vVa8VKBV4aCeEZ3AMNEpGTRucqL5Pi4rdT76uzGMOkIDAGxBma8IieoPk8sd7vhRyldpMCHOLDQl2780b5gPm4z3wMu4LRvfQVJB7iuWhlP4XvNFseXaq9nGJqouwNHhIJ+gYmdltIq29IJNJ1K8w0WlOdfq4LGGPLYpViRZ/XU5vRy5S346PR0Ycr8XnMIn7xdyEZDyo96j0YsV0LEU9iw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(346002)(39850400004)(136003)(186006)(1800799006)(451199021)(478600001)(8676002)(8936002)(4326008)(316002)(66556008)(6916009)(41300700001)(66946007)(66476007)(38100700002)(83380400001)(53546011)(6486002)(6506007)(26005)(2616005)(6512007)(86362001)(4744005)(31696002)(2906002)(5660300002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?di9EblpzVGxqakNtR0poNm1HY3NwaCtvOTNpQ0tablJkMjUvWVBXV0lReE5M?=
 =?utf-8?B?dXhGSHZ1ZFdGcmpuS2J1UkdKMXRHU0ljU2N5aEJZVTBKclZSZVhMYVgwRXpJ?=
 =?utf-8?B?Nmw2V2JPeEFPRXg0Skl6Sm42OHFsc2RVRUhybUxYNmNlemJXanppcDdjaW9N?=
 =?utf-8?B?QW5DWFJnTTFkYjhPK2d6ek51MStadEtRYjZscHAxbVpHcjFuYlArNXk5Mm9I?=
 =?utf-8?B?dFVPU1o3RldyMGs4MU1qZURUV3dYaXA4K2Fsc0VCa0ZiNGU0c3NOc1hBamk1?=
 =?utf-8?B?OExCYWlSM3l3RlVDM1REbFpyMWkrWWYzelVkNC9ZOThDM2VTZzg4eHA1S3px?=
 =?utf-8?B?bUtQK3dUWXVHN216OVE3bGd5K2FPL3JBVitid0d2VTE2b0hOSStmZitud014?=
 =?utf-8?B?YmZMeFgzWFVMNi9GbllScDRLTzJKSU9Nb1QyVjQ1MWJnRGx2em9Dc0FVUERB?=
 =?utf-8?B?NDJGdXA5M1lVQmh3bmpaOGNRaTZWRDNtOFpLT0dHeW9VSkh1ekNhc3pNRkRr?=
 =?utf-8?B?WjBxTEtJQVp4cHB6OUdmQjZkWXhhSjN5Ulk4VEVVWUpzaUdlVk1VaGJ5dG1M?=
 =?utf-8?B?anBxMUlHN3E1Q2FmR3RENDZFYkEybFl5bFo4RkdzZUUrVXpiS1hMYjlRVEt6?=
 =?utf-8?B?OVpLVWg0QnBjNHV5MHFwcHZnNEN4NjFGNGZkUmNhejdYL0FuclJ5TklvSllB?=
 =?utf-8?B?Znd3ai8zbGpkSTBSbVZQS0ovL2htUy9vYXpMSHlHOGJXaUN5NTB0MmYxc1Zx?=
 =?utf-8?B?bXdML1k4ZkhkZzFsU0lvRDE2QnRFa3N4Mk5RNjJVRHo1emxQbVMzSkFXby9a?=
 =?utf-8?B?RHdMMFFTL2U1VWRzRWErRjRMdkN1aHc4Y25iUlNUbDRoQm15UER2cEgwUURk?=
 =?utf-8?B?UXFFR2tsQ0RmeEdSa3ZlRTNqa2tXbkVkVFlyZzBUS25YeFJCcm5RcFdqQ3k5?=
 =?utf-8?B?YmVSYm1taEhCWFpwVFFra21RNmhxSnVwUFFwQnBuRDg5d2psdnNNeDVzWGE4?=
 =?utf-8?B?YXZTTjc5bG4wK3ZaN3E5WWVHRUo2bkU5RkRiZW82bkp0SzMwWTMvaU51Mllu?=
 =?utf-8?B?UU5JN2lHR2NkNVpHU3RKOVorMWp2Z2MwUVJ5SG1pQ1JMb3JCeUtaM0crb2Jo?=
 =?utf-8?B?SjJXVkMwY1liaHVVc3NnNCtXR281SndWdExJYXp6dHY3OGZUUGJleEpYREJi?=
 =?utf-8?B?anFCSWtFQXlvSEIvcVFqS0lNYmxOUGhmZ3NsM3J5d1AzR3lCK3RYTW1CTDBO?=
 =?utf-8?B?M3NtY2xmQmZhK0ltRmVUcmorSmFSZ1ljb0tka3NhQXpTWUVhN1NkUkNORytT?=
 =?utf-8?B?Wk9EQ2tOL3o2V3I5aWt0RTc1ZGs4QVFUMWJGL0lXZG9NbEp0cnFUZ0s2SXZi?=
 =?utf-8?B?UGhxbEQ3V09NVHVxYXpiajNnWkZQN3ZoUjV1aUV4dUl5Smo1NjNEdXZLYXcv?=
 =?utf-8?B?WHdvbktKVUpqU2JvUUNJUUdLekVFUTQ3MDlWQ3JyR2R1aEcrMG9DV0ZwU21M?=
 =?utf-8?B?RVRLNDBXcjByMjZsU1FjcDU4ckU1cC9uQTB2bmo5V2NuV24rNnZmMkxRWURM?=
 =?utf-8?B?aGtVMjhPRlNpTjZtSUhObkZWM1FzZnVENVRDYnFjK3JVbXB6Y1pLYjdZVFZs?=
 =?utf-8?B?bllpZTkyWVVQVzE3cWQrN0l1VGVFZWVWV1NjK3NDR2JlK0Z6Z3NKNkYrVFNE?=
 =?utf-8?B?U0ovbUxGR2IvaHdpZmkyUmk0N3VVdXdNR1d5VzE2R294NVRwSjlXOUZ1VkFR?=
 =?utf-8?B?bDFZZlpuUUN5TGgzU01PZE83bGlvajZUOXlOdnQ0L2ZjS3VTVjlIWlQzaDFF?=
 =?utf-8?B?dVhoNS9TNzdKeXhGZzZUNXl1UVkzVTYrT0NxTFRDajF3dGJlNGJka1NzWUlU?=
 =?utf-8?B?azg1SEN3ZUtkR3FkVUtxYldjL0tYWHNwbHliNjNBSU5ZYzFKZ1AwQUxXbFll?=
 =?utf-8?B?dmRPZnRYUWpkaDJ6L2l4clFuMFZOaU1yRnFzeW1kdFBzd095em1aTVJrZHBv?=
 =?utf-8?B?RE1UNmI0VmJqK2tiYnlhaVU3QmREZGdtUkpMbVNVUktjeXlBa2EveHhaUTFG?=
 =?utf-8?B?Z3BrYlBidW94ZmljcWl6TnptcHBPOHZjckg2MmI5dUNOYnQvcmhzdldkbi96?=
 =?utf-8?Q?mGu5S7PkT7DDhAy9ZscFn6Mk0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62bae7c-1a60-4a70-6d77-08db9c9e32cb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 08:12:27.5039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rprGlap4+NIzyXcN4FTkdHuKiP7kbbB5TG9/YpKgUeqj9mPNabEN1eF8zrGx1vksVe70gsFkxA5sIqRrYWUZlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9000

On 14.08.2023 09:56, Nicola Vetrini wrote:
> On 14/08/2023 09:47, Jan Beulich wrote:
>> On 11.08.2023 09:19, Nicola Vetrini wrote:
>>> --- a/xen/drivers/video/vga.c
>>> +++ b/xen/drivers/video/vga.c
>>> @@ -9,6 +9,7 @@
>>>  #include <xen/mm.h>
>>>  #include <xen/param.h>
>>>  #include <xen/vga.h>
>>> +#include <xen/console.h>
>>
>> xen/vga.h, which you move the declarations to, is already included 
>> here.
>> Why the need for xen/console.h?
> 
> vga.c needs a declaration for fill_console_start_info, which is declared 
> in console.h, as
> stated in the commit message (it could be clarified perhaps).

Ah, I see. It's not very fortunate mixing of two separate adjustments.
But then I'm inclined to ask: When fill_console_start_info() is
defined in vga.c, wouldn't it make sense to move its declaration to
vga.h? The more considering the type of its parameter?

Jan

