Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38B56BCDA8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 12:11:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510503.788257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pclW4-0000Mf-KQ; Thu, 16 Mar 2023 11:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510503.788257; Thu, 16 Mar 2023 11:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pclW4-0000JQ-HL; Thu, 16 Mar 2023 11:11:28 +0000
Received: by outflank-mailman (input) for mailman id 510503;
 Thu, 16 Mar 2023 11:11:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pclW2-0000JH-QB
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 11:11:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49a3b6b1-c3eb-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 12:11:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9647.eurprd04.prod.outlook.com (2603:10a6:10:30b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 11:11:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 11:11:22 +0000
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
X-Inumbo-ID: 49a3b6b1-c3eb-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=El/h0801GbGfaVpyl51bwkdrZsJQp5EEgHLefjvOueNnsvcjTFQxKZ46ExU+OleI9TA2tFjjb2FeK4QYjhW2T1zyQaqRBfy5gw7en8FcPNQ2u6Y6DKldqC5PYghUh89pO4ib2a44G4O5NZqSRrl3B4iMUH5Z3W14kFZCidixdCmEIXAWM13YzBqN51Rqj/84w2kQ04kd7PwoisJnLfPU97Um3zIvs/Lxw3sfbBhW5MXs+nob3L4qdtDq33YpQaL4+uqWwzd8zd+GgeEFoE8BRuHx4MJYdGBKvKLYiI2bCGc5pWW1Or5VZe7mFgCHFtLzCG40J0ptNSkqOy3ZLy5emw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCmINk3ZLz2jxe0JLs3TMpzTb4OO+6HOpzF2TJ//fQw=;
 b=OJTUBlpJagl8VC3Xi7KIGZad2ufpeZaKn/0ODxQmrnnGqWATjw4ad7Jm8X2MtxoHcTbv7YH0nbkc1O/StD4gtvkgg9fyMJmes5KMCW1JIQ/pUBbXOAon/ZTQJu23rFJuib/3D6HJaBGcNAkRLaVhoPL21pGKKLbeQzpw3sHULFsOxEl88v3eaLVamBv/jEctYWpznC/+eaU5yZNC1WnUYE05hHYnPNDIUAq0jQDTkO4XasLEt7roWxonNXrEZGk1Rlw43ptYCJokj+BEPVnN+8BSXTFEXa/Lm2FvxHGj2CF699oTpnAEkKlZKM2Atn9aZOoNCJM61/6Jy+hbdcrBjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCmINk3ZLz2jxe0JLs3TMpzTb4OO+6HOpzF2TJ//fQw=;
 b=SGlrzVXV3KIMFtElr2Hnh6f2fnUoB8f2J5WxveRDN4wLWvqc/Xh4wmeeFST9blbwDy7JKZWsdOe+Kwuj5IndGSJa3jp0XhQeDpePKb5PwSuy9N6PEC7Cm5wyuzTCCNl7MUlrZsmig48mDXszm2tNilpC+Vu0HoSD/ODTyllJh+1LYWd6pB+3QddCWwpCNKOMv5gu1wS7vD9vTkBE+qnRjDasUtHZddFYof0a0WP+ZSaj51hAva12GWrqnYuUF8tQzIIkAC/M+Ue0BPstWN3IHyGPsxMkJujkz7t5e9ujKjXBkXdE4K4Vn5mcslCUzTgMHPSC4Xs5z8lNNvN02mBvEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9654392-ce4b-07b6-9be0-7a6d4230c287@suse.com>
Date: Thu, 16 Mar 2023 12:11:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] xen/console: Skip switching serial input to non
 existing domains
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230316102635.6497-1-michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230316102635.6497-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: 930f2f5c-b2bb-4ca3-c611-08db260f2cd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ab1Um5vmN2wA4TrUQmK+mPT+TwZ+kcwvBukI3hdNIORWsg6poMpXBifU0GkADU15J5MzCriy+1fUcZZSsG1Glxw41XXt/EuNX5gczMdTThvOxrI/+FscaJJJ1OJyX43dUu6l5TgLHYNIAV0q341g+yEGThj+dHnuc5yojxuAjHTY1KLt9R5AbezdJyr6zdoOyeCrZ6ZePcfzWdBh/EdhJMOw9+xbbVx6XnmA52+oJVuZvLttOyx6SbNyPE6806MbaSb6UjuJEQ1ij78mCZ0O/1efDjT+oLzdJW31famDk6/2Mvnf4dEv4FLKaOPBtFFT7JE3iCLQFTtTI+vW1d/9tMYbp1EeVAQSqZ5bMd7hMDQ/bEBBw7o7PHxAbw7+rkygxOvBL7ayUTspgXByFxMwdcu9O7gX4+9KEuEHUvk7G+aMIxtzbuJpbNmW0OfNJapL0MQPGXTH2kVZrqHYp+nA/KVAkGoHhVNYY2jmvghE1u+MbKXpqWh0mOHLJr1N0gFpIIAIekipQHPLaFa7UO5EUXsVlCgZ4FOxVLH1rxuluUK9XFEtNMwhzCukf9PiUaLg/hIl7EmXfemT+8DD8SbgPPX17WNEa1Ri3phchImgYSP7zBf7mDSTworMGILWfH7oo1bmMZg4Xj3mvTGFqyxXoAZaKeEh3obM5rJ8v8yaKRV/GkLUctBPFIK8xL3VFLfLuXZfoyokFp3ww01KVFDUX4wZyDM0HOZlpnmqKUpu6yw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199018)(5660300002)(66946007)(36756003)(26005)(2616005)(6506007)(66476007)(478600001)(186003)(6486002)(6512007)(6666004)(53546011)(8676002)(54906003)(6916009)(4326008)(31696002)(66556008)(86362001)(38100700002)(83380400001)(316002)(8936002)(2906002)(31686004)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3lqTWR5QkNPRS81OG9iUm1ycXhPMFk5elNQMzl5cUZDYW9kOW1OSkVydWY4?=
 =?utf-8?B?VGFoUFA0dWxTWlU1ODE0WXdrMVRKNC92ZGFkaS93bDc5MmpiQ0dlcmIvekln?=
 =?utf-8?B?OGZ5eXpoV1oyNEVoQmNpblI3cmhvSHhETy9sSWs2MTBaMlc5Z1p2QXl3d29m?=
 =?utf-8?B?aHJxc3o5TDFnRGFUUEZZZ1lJaGFCVTBSZk1nSXhWQWVIZUNwSUJ6Rkt2U1R2?=
 =?utf-8?B?MXNRVEw4cU0vYk5EUUE4cHdkVkZyaUdjWkpYQ1dYTjhXcEJFSHl2V0dGd2Yy?=
 =?utf-8?B?ZzFTS1FhYVRXN3dEdURtZHB4dXRYRStLVDRORmZqMWJ5MTJJeS82NGwzcWVm?=
 =?utf-8?B?d3Y0a1JYOFRTTGNmTWZ5REpUcTY5Ync3SmJsNzBJZzVWZ3RxdFhtRHlWNllY?=
 =?utf-8?B?d0ZoWWlEUFhSY1BiaUYyaTZmQ2psU0o2c3NsNFVoNkd2RTNwdnc2cE00NGV1?=
 =?utf-8?B?WnVjU2kwcmU4bUJ1TGVqOUh3eEErMDcxNUJjdVJiaStKUkNVMEwvbGxEZ2p0?=
 =?utf-8?B?SndkRGZjU1VaY2pkM25IWjFodncyWTZKOUlzYVZkVnRzSDBiNDF4eXNDaURo?=
 =?utf-8?B?bnNQbmN6a21zVXBwc3Vaa0pmejdKUFVNZmdBWkorQXBRNEpwYTVZNmtYc0Vk?=
 =?utf-8?B?Zlh5MXAvRjZXY1lZdlVGanRiaW9Veit6R2RXR3ZFSVB6QVBSbmlmQVV0WFBX?=
 =?utf-8?B?MStTV0dJNW14ZjNYQUN6WW9nZDR1ZC9CMmYrelZWQnE2WHBVb3hVK2tPVU1L?=
 =?utf-8?B?dHM5cmxmNFkyMm96cStQK1NXY21ZWTR3YlEzTHV5cVR6T1AxWHRtT212K0x0?=
 =?utf-8?B?YXhaWWxEUGFnd3k1RFhZQytSZkJvM0ZYRDNhUkUxa0NGdFNlQURGVm8ySktj?=
 =?utf-8?B?YVJ5cTBwY2U4Yi8zaEFoTCtyRGp1TkJoS0FkSTlaU1B6OVQ3UUh0RDJiWlZ5?=
 =?utf-8?B?K09CZ3g2bXJZTGZ1aWg4aVlRSys4VU9Fcjd6Kys2c0VjOSs1VXlNd09MUmZn?=
 =?utf-8?B?WnM2c00rc09ZWWZpMU5UNGRwdVFLZkczOERscXNjKzdjTjRUb1ZIZCtKTkdF?=
 =?utf-8?B?ZnowVitsUVptNGdDNkROTTN5ZExLbHhOUzBPZzloOEY0bXpmMGtIcURUd3pB?=
 =?utf-8?B?TmU2RWdFOEcxTkJLZURJdlArb0FRQ25ZOEhIZW5Gb3RIQlFVY2hTUjdQZTRn?=
 =?utf-8?B?UEwwa3d1TXk0cVA4Vm4rdU1KK2cwZmY5TUVjWWJRU2owS0VWK3RDWTNXWENH?=
 =?utf-8?B?dzNjYVFEY3gzVnJqa1hCMlU4ZGdmaWhxeW1XdWdnRGtMSUtTSGJPMmhVaVNh?=
 =?utf-8?B?S0dkN055KzBCM3lPMjFqMFlRWjV0OG1GR3RtRXp5eUUxMWcwaWJMM3l2ckhV?=
 =?utf-8?B?WEY2SXRlL1ZRUWVUT2xSNklGa3J1bHJKcHpNTm10VldxMGxGZk93anNRUmdz?=
 =?utf-8?B?VnBpN2gyKzMrcng5UTNGazc3cmVER0haRmljeXZWc2NoNEZPdExXZGkyUWZ2?=
 =?utf-8?B?S0VaWFQ5akJnQjFrSys2NkRNa1BtTitFRXUwUmxWQTZFK092elFxaGY0Y1dN?=
 =?utf-8?B?RjQ3aHpEcTN4QkVrc1hSaUc5VHVsblprWEMrS0UvQkFWSXJRak5PUForK2dr?=
 =?utf-8?B?a0x0c01KRm5iOTNRdWFCOVd0QXJWT05tdzBpTGJvQ0JpS2VVZjBEUHdwMnpW?=
 =?utf-8?B?YThSNWN0ampOK0IxOEVaaDhpOFUrdWIzZjBwYmNIS2c0MTMrNm1GZWZ6ZXFl?=
 =?utf-8?B?QXoyK3lzdlJUWWF0a1d2ZVBuMFhWajF4VUdjVXdacmRPUUtOUnRFTCtpVGgz?=
 =?utf-8?B?UFVuWWdJdVZCM1Z3UFh5SDJFeW9iMyt5cCt4cDQ2aXVKb3c3Z1ZtZnlxR0Nl?=
 =?utf-8?B?VmdMTzl0b014a2NEK0NWT0oxZ3FjbHg4dHhEMlBEdVI0cjdTYk01azZCcU5x?=
 =?utf-8?B?MEtndTMzWEJKVWZGNlJ4b0h6akNUbGFmdi9ZMmw4MTI2dmNNbVY5akxQME5p?=
 =?utf-8?B?RFRERjVqT0xIcW9TZ2MvQmcvUy9mZUtIRm1SVGhtVnVPc0xOQll0bHQ2TStC?=
 =?utf-8?B?dzlUbHpMci9mVkE5S0g0SHZRMk5CR25JTFo3NDA0aWJwbkFRVm8rSkZmUWhk?=
 =?utf-8?Q?N0E9yUAQ28DMkKM9GYjvOyQri?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 930f2f5c-b2bb-4ca3-c611-08db260f2cd4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 11:11:22.2657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvKNcMA0ZzV9WEXM497q0UXiIYY3T6Pon38Eo51DfW7hoggpoHE8nTEWpAsDAP8MMKpHpGACC88nnzSY12gLjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9647

On 16.03.2023 11:26, Michal Orzel wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -490,7 +490,24 @@ static void switch_serial_input(void)
>      }
>      else
>      {
> -        console_rx++;
> +        unsigned int next_rx = console_rx + 1;
> +
> +        /* Skip switching serial input to non existing domains */
> +        while ( next_rx < max_init_domid + 1 )
> +        {
> +            struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
> +
> +            if ( d )
> +            {
> +                rcu_unlock_domain(d);
> +                break;
> +            }
> +
> +            next_rx++;
> +        }
> +
> +        console_rx = next_rx;
> +
>          printk("*** Serial input to DOM%d", console_rx - 1);
>      }

While at the first glance (when you sent it in reply to v1) it looked okay,
I'm afraid it really isn't: Please consider what happens when the last of
the DomU-s doesn't exist anymore. (You don't really check whether it still
exists, because the range check comes ahead of the existence one.) In that
case you want to move from second-to-last to Xen. I expect the entire
if/else construct wants to be inside the loop.

Jan

