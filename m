Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EC875F684
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 14:41:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568902.889006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNusO-0001bg-RP; Mon, 24 Jul 2023 12:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568902.889006; Mon, 24 Jul 2023 12:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNusO-0001a2-Np; Mon, 24 Jul 2023 12:41:24 +0000
Received: by outflank-mailman (input) for mailman id 568902;
 Mon, 24 Jul 2023 12:41:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNusN-0001Zu-7l
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:41:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2044.outbound.protection.outlook.com [40.107.13.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4927508b-2a1f-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 14:40:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9087.eurprd04.prod.outlook.com (2603:10a6:150:22::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 12:40:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 12:40:50 +0000
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
X-Inumbo-ID: 4927508b-2a1f-11ee-8612-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4bVXjDc5rPGBdNhLSWV+7Bjk634o5d3MKpVwfl3m/b6WZs3pCEPVhlbBeUcyGvNNzhmXOu14d6aghEXT4P5Fgr+IEAmepDXejbGPo2WPL9abwr2QX9YAxMxc40/WlbAQiP038lVhTgsnQ4w/Lu1h51RzDWGVp1wtuCCHuvAmFAfyVvDFr6v/ccEsMtG5gXGuxjY56VywN0WvfOti7L6ag4EaPzzhQrA9yO+m2IxtOqAFe3U4lNo0C8SBGZa+Zm8TtuFal43nYSu8f21yo+OZNR4FZ5BW43knkUhF9/eQWIvq0PFeRmym2puOB64KbSd/R11ZZPvvSDV6Z+Ah50vqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVOX9FdgZF/IwQDGOJfYw+KizAFkLui8caafB7SZ8Z8=;
 b=XxrCVEJu1p/48P3eXzmBS1YlgNsj2CL2RBdNhgksr5eoe3PfNEfANg7IS11AlJkyxOEXJbbW39nserHz2rHy65b0e3RT+nxMWKwDsbffF15W/WBfL8Wa2KPkziZFTb1c1gE7jxTFGOZvVhxjsKKYeqxwMi8m7zYNGtz5Q3yMuxw/TjzIzYtReVPYPcu+Ba6nuxFX4T6yV+8wBWdQVnXEfo1grfAjM2tbzW6VSQxnpTMlsVwtlgsh6iG1qWt8YDahUluNBgXWy1bEMxXROQzsmGfRLPGevX9S1arRA0hYpEsWj5yYkBvW0BaY57Lrr+p4f2UMQOJdUYQHiwUEYma7xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVOX9FdgZF/IwQDGOJfYw+KizAFkLui8caafB7SZ8Z8=;
 b=uTnaEvYqvnZMGiZxuDzLuuw+ho/mPeC7qDfzRf+f4MvW6seklHRklTQHnzRLdoc7tzetHl86EXkVh0UkCGa9y2YNTYVEuSOOsj0VAK0IOYZYdsFdGQmi8R5jkiMEWtwHlJsMuVDkK+7Si0s4xdHVAOyfRBKWLfeux83I7Ve/wy+qJ8M51Lk79YfSWVZ/gK5Mamuk+KvSzuU8OX0rdMOfHd3jjr+eY1mJBYe6hc7pE2/g6zmOeWhdG+hbyP9WCxkf6kj1e6x3aoVkVDffk27npciK758eeoBgpmbPhF62w5YOp1gm3AHq/Dw2Ohmt8oTgcIxcLtvbVV6hi4Mli7RNbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <019914c7-c6ca-70b9-6c90-e1891f4201c4@suse.com>
Date: Mon, 24 Jul 2023 14:40:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1689958538.git.sanastasio@raptorengineering.com>
 <f326168638ae05f5f387e4fa018ac2ed057bac8c.1689958538.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f326168638ae05f5f387e4fa018ac2ed057bac8c.1689958538.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: b06b042d-0ae7-48d7-dcb6-08db8c433621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IYRKwqu9NKIKEsnoxM++capR2nOWs7ffI4AjfMpdilZW5j9y4o66A0Uiw9clCDmbfrWPQMi/q01oTyyA6e9nIC5rA9h9VmfRoVB9Lj3abylAPo3u5aY8aloeNQ0WpZdrk8weJ5wVm9YOtuuk+EomtOeM8rzXxX4vjOjqV9oxkIJBuZ827Lpop8BIUMGRMGJFzFXUoKelG1FJacCx7mbEvhlzD3yyOPgfLb3f/yKd+HdBppiAb/35wKxMU1hheCHvkt5Xs8PVIJWOl/PNlNYZRVF607OhJdk4CZYXJ2BiARw2TnUJM+uZioj6e5lo8oZxg4AahO7m1dYaIQioU3etR1J1JyrZsukbt7ZeoujFiQ6yQX7cKIMO/C8d9xqBI6EP71VBMh9eO2MphkUp0B8VspZhmBf5LRyjUIrTANoO6KgkzE7wL49ApKplfsAjNhhsJ51WwpPRJQNz3WV8DbUMO6Bg1VvQWZggEcEumvZ2IhfAshJHFt483+BqPs0gs+ag9bO7aL+DArx0CkFCmKcwPDPEVaDwaxGGn59yu0HXNYYAn2hnHx3J87mtbSN+FLl0qDH/gTuEa9QKfqrnSJDrJOSrR66yS5zE+98fEcinSTC/BJu+x9DcHncVLcsiQ42cvejjkwoWXqJonI+ABuKPmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199021)(478600001)(6486002)(6512007)(6666004)(6916009)(4326008)(316002)(38100700002)(66476007)(66946007)(66556008)(41300700001)(83380400001)(54906003)(31686004)(36756003)(8676002)(8936002)(6506007)(26005)(186003)(5660300002)(31696002)(53546011)(86362001)(2616005)(4744005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWd2OHZndmFmcWFWSm9LOEdIM0hzcW9WNlF0bHMvN2NPS083RVh5YUZuOW5m?=
 =?utf-8?B?UjlRTzVuWUNXek1hOWJLZ1c5MHpMVzJLeWR5aXdNb2x5amtKcGt0UzFzTVMr?=
 =?utf-8?B?WU9PVWd0WngzamE3R2FldDl0S3FhNFU5R3UxNzQvQTlGZGRPTUNScEQ0SSt5?=
 =?utf-8?B?WndPNDkzemhISnFWK0VuSlQwRitZeW1YdlhQREVSQ3I4RGNnMjBYYmVpNWl2?=
 =?utf-8?B?cTdMNCt0M3lkTy8rMkxKb0U4R1lzUkUwMVlOWmF2ajl6WWE5M2VpQk1CdDBS?=
 =?utf-8?B?UnpSb3YweDB6YUsrTExsRlNGRXBURW1YZkFEQlh2dnEzZERtRWxNWWc1WUp5?=
 =?utf-8?B?dlFKTUMwT0lKeXM0RiszNDFCWHlYUUx2aCs3WUtFTExBVkVLWWl2SzJtWHRy?=
 =?utf-8?B?bkdpT1JUdFZFZkJpMjBIS0xqYzJXQ0tmZUl5UFppaE5XRG1tdzZVVktQUXlq?=
 =?utf-8?B?bFE2Y2loN3pyNlQxUmtjZ1hxZ3NlSDVKOUJZZGoxWHBmTjBVVE9VbWFZQ3Nj?=
 =?utf-8?B?cUFVRFh5b0xPekVScm94OHZTdnNOWFNFd3pHWTBETjZOWWhNWjd5bFlpanhB?=
 =?utf-8?B?Y3IwbmpmVThvWDRYWFJKR1N0Vm1wNTV4ZlE1Yi9rWVl1VHFWNG1KMU8rMTdK?=
 =?utf-8?B?TGNVZXJGL25XMEdCOFdYc0VKWS9ZakNXdmNMYUgvaUZjd3FQQWtNNEdkK2do?=
 =?utf-8?B?S0J1OW1QR09yRUJCRWR2K3ZQc05WOWQ5WGJCc1FVQUpaeTZGbzBpejN6UG1R?=
 =?utf-8?B?NzdFSU9rOFN6UjdpUkNIRkh6SWYyOE5KNElQNjJNV1hHdlhvUU92TVZzQ3E5?=
 =?utf-8?B?OHVabm5pSC9DTnhVREJRM0lnNzJmcXFTT05rVHphTTdTcmpKMm9UcjBLb1pE?=
 =?utf-8?B?OHl3cHlFcklPblVIWlVlVmtrRUc4K3hVaXdhbWtwVXdmNFlFdS8xaks5NlRH?=
 =?utf-8?B?dEp1MFVldVB6TUVOVkF3VW1ucFF0NDNQd0Z3MldXaG1NVm0yQ2UxdFVBRXM3?=
 =?utf-8?B?eWdKTitIbHVYbTBWS0NjR05yUHFrekI2dHZJYUgwMmJXQjk0dHVpbHdhK1l6?=
 =?utf-8?B?S0NvREtuL2dMZzc4Nk01QnRzMkxvYTJra3pVVHZKbG5RdmhXUmpoRGZCbnU0?=
 =?utf-8?B?TnB5bmorZlFlRVJFRnVQWVI4bCtpS2NURlZPTFl3T1NualRoNkFDK3FZb0pq?=
 =?utf-8?B?VGVab0JqWC8vRExnbCtNRU5kSlJqZ1NpQ3ZJSnlhVGxOUExzUGNNeW41Nis5?=
 =?utf-8?B?a3ZpOTdlZGFMRTlPM1RmVHpRWGRCZkxqSDZGTUFyR2lpRFlISytZTFJsc3Nx?=
 =?utf-8?B?c3pmUjAzVUJGUll3TnY1SzRZbU1UT0MrcUUvQTJpWW5LaUk1dm5lanV1ajFv?=
 =?utf-8?B?TmtvdUdFaGwrYXRjOVBpSFFiUXhKQWtWRkN4eGluaTNhY0dJcnJxR1lDMEVr?=
 =?utf-8?B?RjZwQTV0TVVWYkJqV1pZMENaRXlFQWRlbHRyKzFta1haT0VJOVgrQ0puZkxt?=
 =?utf-8?B?VWpkMFFxc09WblhHc2thNlFjMUtJbjQ4N0lRL0dIZFoxVTZkQU5nZHZyUk00?=
 =?utf-8?B?ZW9EOFBlaWNkTDRHakFXREw0VTVSdDM5cGZUY1NNM2ltV1J6SVVRQWdMY3Fu?=
 =?utf-8?B?SnRQUHN4bDU2akk0cmhILy92ZzUxcVJSbHpycEs3c0RRQmtYQUZXTHFHenBl?=
 =?utf-8?B?bm9YYzhBVkwrcG1BRGR0M1JDZmhiSXJZMDNFR0o3UWRhMVY2SHZDbkZsOHYw?=
 =?utf-8?B?ZjFhb2NLZjdBK3kvSDVDRFk5dlRSK0VmVFpod3lJaUhrdWJOWmFRUmlUSHNv?=
 =?utf-8?B?Ykd2Y0Q5ZVV1RE1xQTFkVDNWNSt3UXU5UkpTZGxlNThuK3lHLzFpWWtIUGYx?=
 =?utf-8?B?QlQ5bjFRdWhQR0hPSnhCSkdvUk9STk1mZHNoUXlEUnFjdEozZVRTcXVpNjA5?=
 =?utf-8?B?dUpsRWdRWUgyQkZCTWNucHdSNC9mT3I2dUNrUys3dW9NSEpzTXR2ZEFEa0pp?=
 =?utf-8?B?T0diVjFFNkJBV21OM1g2bURmbjUwcXpyWm1zQjlnL1RsR09ra2hPWWRKSjl1?=
 =?utf-8?B?ME82QVRiOGVXUzkzeldWU2tEZUJSYytyOGw2U3pISkZxMHh0S2VpZUh2cHlZ?=
 =?utf-8?Q?pbPMdQ1kOD9EflQ/AXT7gsgY7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06b042d-0ae7-48d7-dcb6-08db8c433621
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 12:40:50.2995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQboF7La1IlXpdH9Uv2JuQQtWgz5ZbwPruhuvGw/bQlmpQZ2T1OVcL6E5GOwBp7S5++PfVMA4p0rYoyWv6ydDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9087

On 21.07.2023 19:02, Shawn Anastasio wrote:
> On typical Power VMs (e.g. QEMU's -M pseries), a variety of services
> including an early serial console are provided by Open Firmware.
> Implement the required interfaces to call into Open Firmware and write
> to the serial console.
> 
> Since Open Firmware runs in 32-bit Big Endian mode and Xen runs in
> 64-bit Little Endian mode, a thunk is required to save/restore
> any potentially-clobbered registers as well as to perform the
> required endianness switch. Thankfully, linux already has such
> a routine, which was imported into ppc64/of-call.S.
> 
> Support for bare metal (PowerNV) will be implemented in a future
> patch.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

While I've committed the earlier two patches, I had to back out this
one. In my environment (gcc13) the build fails due an unresolved
reference to memset() out of boot-of.c (supposedly from of_call()).

Jan

