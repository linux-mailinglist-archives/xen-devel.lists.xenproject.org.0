Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CA76FAF57
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 13:56:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531426.827108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzTO-00028w-Td; Mon, 08 May 2023 11:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531426.827108; Mon, 08 May 2023 11:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzTO-00026A-Qc; Mon, 08 May 2023 11:56:10 +0000
Received: by outflank-mailman (input) for mailman id 531426;
 Mon, 08 May 2023 11:56:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvzTN-000264-98
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 11:56:09 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe13::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5079e5b5-ed97-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 13:56:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7844.eurprd04.prod.outlook.com (2603:10a6:20b:236::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 11:56:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 11:56:03 +0000
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
X-Inumbo-ID: 5079e5b5-ed97-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpGmM0UUgZrEV38xVmJtBOIR1PduVJ8W/4cqJNJJ2yRxzoLt5BVR9G0KuDz5QaFio8W192vv57CghefcYc+VstJ9/DoK1e4XlV6TlyVCrJpp9uyFBjLH5tcMpYZsui1wyVqMvwL+YpOUFTYEalpR3w1LlpELLkcOdazHtdNeQsctxjvDluelwZghRnIWTEPb57bttyyJcAbeOxK+dp/SBSellWFpNJXZIFsVGWIZHexttqsRkCmD697ikUr4376OCmRB4Fn0nPQBdmIetyTSlNegyDzGPkVPqGguJY8WyPYVXvvkEMPrFpDSnSsX3ccUPVs5rjcKLT5XinYju5x4gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9NBcAHi0ygGzgQqrKQSGrRdSqMpi5l15+rO1KHm1tQ=;
 b=cF5aTCjasSGNb1cTTw9s+E/t3Y7dCAey7lgOvWHuHFG4T998Hpk40IvM2OQSLbHBQGaRsjTQp4UXu0upRlOHjT6YpPG0BNc/DwhlDWIAx322PULxBE2CvjJ+iMbkKA2P9mE1pfSHeTBMEccf8mo1R520qSmI9VqNw3QdXGMLLlX0YKEWqzrcT9Bdk1y1z7sGgRoSUaFQYTdQqAs6MYQ8eKKHmS+5ME+S8GkA4rjv3KXZ3gt8DLYjn7eFIQeGmlg/nAfFWLo19F+7hYb2N2idaTTIFghTr4IWuFKheW1yTx6lzwdIxdEZ+nftppoetN6YBxlGL+GD0OT49iAuXvfAIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9NBcAHi0ygGzgQqrKQSGrRdSqMpi5l15+rO1KHm1tQ=;
 b=AKHQT4cq39zSYN/n9aAcs3dFIzneUR9/09tRzw1rH0vvj0htoG5cWjAzeyz4pa3EexQRu/rdMOfXEkQvkGkc6/Knjf5Jq5rnKQNKyyHH3QVmT8/zwwHd4acbGoo7K/OO5RWBgkLhhKnvEG6gSZzSBYgKSmYAEqYx/LgudKaKRwhHubCYZKLittipHrHn3M6ea/M09qWdJcDQqQCYU5S3i+18+Bvi5EWr2UnKf4p//KRySFA9K3jFbL89L15wo2ijfyLr5FcKwYgpKFVJ6Emo/KP8//4eatc3afzkXaH6cqKo6J5PvrjsyEwyCafep93KhoOKVa4fzWpdajbHCW7p/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46c46e0b-0fba-2f3f-6289-f68737a3d8d9@suse.com>
Date: Mon, 8 May 2023 13:56:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 13/14 RESEND] xenpm: Add set-cpufreq-hwp subcommand
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-14-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230501193034.88575-14-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: fee3b09a-2cee-4c02-c211-08db4fbb32d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+gY3tpuhIroDVaoODJKH2Q2vh6Nb4En5Uyt2KtoO0x8iAuUxnk3+cyQlBGwUxexAeeuNfA7MdwNMoZ+l38kSbq9AixIP+pdi9cKrbtoZeDXqnAzxLIvw+UM7pphLJ5rqTp7BZRX0smjI1BeRxY/a7ITz1nJ04uxJ2f2F44MgPz7e28qcdKBiBtPdDjrllWHR8WPFxWT9zZCrPJTGbnkjFe9J0nTiv1DvQtTk/mtMu1Tm3VfQOluqaJMgrgZPtmvJ+1G4m4xyHMuTxSz9LtXX/qzIz/mTfc3RK729cDG3a9RpiDAoBBmxxkS32EWIhRsJRLZS7jW2SRpjohbAMyuyUrb2aQirpFGDci2O/Hc8dSNSH2WL5vPZ4Kmg9sRO4t5YJowhyO3PC7Zt8lDuMd21E5vnI1QTMLfKo0jwbWep2rW2ptw/Iqh6lBDq9AR55DkbTUI/5yUGNrWUC/ZrU1KLSAs+WX1A9UQZGzJVQ9MUGu6qeh87Y0h3ChvpCjWjEYWEfTLt3qlLiagWuttJ+jNWEIiX8MN9yv3ATkZU3CcG4rdZYPq3DHPD61+PQpxHQKKFC+E9dsH0eCLpn50TjBxlqO6nWCJe0Liy2XusQaF+Qs7sE+gSJfiVnNy4X7V8ROQa7lIs5RVN2l/5AR8Vd9FySw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(6506007)(6512007)(26005)(53546011)(6486002)(83380400001)(66574015)(36756003)(2616005)(38100700002)(86362001)(31696002)(186003)(6916009)(5660300002)(4326008)(66476007)(54906003)(66946007)(2906002)(478600001)(8676002)(8936002)(66556008)(31686004)(41300700001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmRJVXdJVTNjWFlBTlFsN094MFQvUmRseFM3aHNjVDZWUUFEMGlCTllFQW9Z?=
 =?utf-8?B?dzIwVGpWRUtuMTgxd1RnZXpxem1VZW5Wejd3M2d4WmQ5RlVCalZiNTdxZnFZ?=
 =?utf-8?B?MXN4YUlZWXdWRlBwSEp2YThBWDVBRXpET01SUmpMbGVZZng2NGo5UWxTeWdB?=
 =?utf-8?B?bG9BNnMrdVBDbnNESG01R2J4WXh2SnZ3d1FPNXpNbWUwUTBONTNwc29hOGw5?=
 =?utf-8?B?WlpwNHJWSkJRSFZJUVJubHk2c2E1TEcwL2FiMFRBc0FkZ1laZW9LU1Y2Q3d4?=
 =?utf-8?B?NENpQzZRdkM5VTJ3dk1HWURFTXI4V21PWmhPeWVudjQ0U1FDa0xFckFtS0E4?=
 =?utf-8?B?SUNHVURzcS96OTFScXhYREdlOGJ1LzNJZlFpVVd0SWFqb1pDc0xsc3VYZ2tr?=
 =?utf-8?B?c0hUcS95TEZaaHBXTG5BTXZhV2liZjFpSFUyaUJuS0x0OGJIbVNma2dBV3Vk?=
 =?utf-8?B?dHRFZ0E2Mjd3dVo3RlphYUlqTmlNbGMyVmpxa29TR0x0SEQzRXR5YUQyQnNT?=
 =?utf-8?B?dUFjMDM0WnRyeUo5ZTJmRkp4Y3JpR1d1SVg3MVNLYmNwa0Z4dHpiTVRVaUFw?=
 =?utf-8?B?SVd2dUNndzJmQ09POTFkdkV0TXVZTXJpQWZZVmx1R2g1bkFHQ3FmZXZDc250?=
 =?utf-8?B?SXVPS1FlbERlQU5MNVN5a2I4N1h3WmRBbFZoM0Rja3dZTnhxcTRWNDkyeWxo?=
 =?utf-8?B?cWlUSUVFNGVrS3ByTnE1a3p3emduNVJlMWZGUGZjLzdFek5PUWdsQ28wYlpv?=
 =?utf-8?B?T0JRbXBIOThVWEdrMWUrZjhzV2hoalFIaWc1WEtlZ3JTRzc3VXRwc1E2c0Jr?=
 =?utf-8?B?THI0b1MyY0hjQWNIbyt6WDA3K3lGV2dsZ0pWWFFYbGZPL2JGeTV4R0MxZmZm?=
 =?utf-8?B?VnU1ZGdSekRUUVE2OS9PVmd6cUUxREdKR20ybXhyNmxFQmcrUktJL1hqc2x2?=
 =?utf-8?B?TTRjY0l3TlhrTWlrNUJJM2NJNnYzeXZDRHlndlI5VkVDdXdDWkl1QU1DOC9l?=
 =?utf-8?B?Uy9tZTJPNVdabXlvbnBYM0VBN2xzRk9iN0U3cHdyVmhFcGx4cmF3RkRwK2wv?=
 =?utf-8?B?Q1VZSWQvbWxjaWZMY29Cdm01K1Y1cVU3dWYxaVZjdXlCeWIyQ01UdXhvbTN4?=
 =?utf-8?B?NGxaOXlwRE1IMyt5Rk1YQWdsbWJxbVQ0cHJmWWZnVG1OaU1ORXRHVG4vWmgr?=
 =?utf-8?B?US9DclN0MUM1d1R6Z0Z6VEJ4ZzB0RGlkcjB4NER3RzR0MlBObks1NmZBTWtq?=
 =?utf-8?B?TEhyYXZOK1dkUFlpSHgzbGlwK1RHaDJ2L25URWNVcUhqWjBzRlZZeENoMFRN?=
 =?utf-8?B?QWFsQytJSy81ZzJJb2JSd2RBcTlsWmorWTlHTnZNUmNCcWZXQ1pPSldiN1lY?=
 =?utf-8?B?dEE4ZlhEMkRRUW1DUXdVcW90M2luT2VDYnhNcjFBRTF4MElpdDUybzVOUHFu?=
 =?utf-8?B?RERWay9iQlFXZ0FQb0pydk90dGlsck9DRGxsRy9ERWUyOUVkMmNJalR0MnRm?=
 =?utf-8?B?OG1PUEsvMDVPaTdiQmw3RVJtV20vZEhlNDZXbkp3dG5ZUTZjUE52ek51VThV?=
 =?utf-8?B?MEJyaXlHd0J5ZEZMWHNNSmZyak90RkUwQm05bHd0NHZSSHZ6K0ZjTjljay9t?=
 =?utf-8?B?elh1ZzVZREpZRVdZblAxNU9jL0VHZjhFRG43N3B0OW8wT0xHcitoWk4xc2I2?=
 =?utf-8?B?RVZLaG1JZ0dzSTJkbUFGRk1qL3RndWJlUEVvbGp0eDN4cS9YSFJWRldqSEZv?=
 =?utf-8?B?WjJOekRnZk9qeXVYWHJHZHU1MzhSWngrd3Y5eGMzaEduM2FETzRFNjN1aWY3?=
 =?utf-8?B?ditKUUErN3BWWUJzUS9iZWROMDVGUkhOOFRzY1JaVFFjaGdvcEh0bWhnOWNU?=
 =?utf-8?B?QXp0S3dNaGdZN3gyYThOOFRLNlE2RTkyOFBHTFlXbS9FV29YOWs3bGcvK0Fh?=
 =?utf-8?B?SkI5c1UrWlhRamVTdFF6Y2dVL0wrdCtCdUUyTXYrUGl3V1JpQVNzWklnSEdU?=
 =?utf-8?B?Z2F5MS9KaTVMV2JHUWVlRGpWM1JGRnliUXkyNm5jRWRhTFBBclpnbzZFVEZN?=
 =?utf-8?B?ck5oVXA5a0YrOVd2Uno4cEdjLzI1bis2UmZudFFtVW55ZGtRajNQOVVPcytC?=
 =?utf-8?Q?I6taH1HKawKBuishngmytKhfi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee3b09a-2cee-4c02-c211-08db4fbb32d0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 11:56:03.5553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/a0WTVx6eRfsXY8CGCX4ygE797Cnps5lKZ5h0JzGKXbATqV5YNUbVyRO9fS5z8PkCH5qhlOzSIaoEydiZe+7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7844

On 01.05.2023 21:30, Jason Andryuk wrote:
> @@ -67,6 +68,27 @@ void show_help(void)
>              " set-max-cstate        <num>|'unlimited' [<num2>|'unlimited']\n"
>              "                                     set the C-State limitation (<num> >= 0) and\n"
>              "                                     optionally the C-sub-state limitation (<num2> >= 0)\n"
> +            " set-cpufreq-hwp       [cpuid] [balance|performance|powersave] <param:val>*\n"
> +            "                                     set Hardware P-State (HWP) parameters\n"
> +            "                                     optionally a preset of one of\n"
> +            "                                       balance|performance|powersave\n"
> +            "                                     an optional list of param:val arguments\n"
> +            "                                       minimum:N  lowest ... highest\n"
> +            "                                       maximum:N  lowest ... highest\n"
> +            "                                       desired:N  lowest ... highest\n"

Personally I consider these three uses of "lowest ... highest" confusing:
It's not clear at all whether they're part of the option or merely mean
to express the allowable range for N (which I think they do). Perhaps ...

> +            "                                           Set explicit performance target.\n"
> +            "                                           non-zero disables auto-HWP mode.\n"
> +            "                                       energy-perf:0-255 (or 0-15)\n"

..., also taking this into account:

            "                                       energy-perf:N (0-255 or 0-15)\n"

and then use parentheses as well for the earlier value range explanations
(and again below)?

Also up from here you suddenly start having full stops on the lines. I
guess you also want to be consistent in your use of capital letters at
the start of lines (I didn't go check how consistent pre-existing code
is in this regard).

> @@ -1299,6 +1321,213 @@ void disable_turbo_mode(int argc, char *argv[])
>                  errno, strerror(errno));
>  }
>  
> +/*
> + * Parse activity_window:NNN{us,ms,s} and validate range.
> + *
> + * Activity window is a 7bit mantissa (0-127) with a 3bit exponent (0-7) base
> + * 10 in microseconds.  So the range is 1 microsecond to 1270 seconds.  A value
> + * of 0 lets the hardware autonomously select the window.
> + *
> + * Return 0 on success
> + *       -1 on error
> + */
> +static int parse_activity_window(xc_set_hwp_para_t *set_hwp, unsigned long u,
> +                                 const char *suffix)
> +{
> +    unsigned int exponent = 0;
> +    unsigned int multiplier = 1;
> +
> +    if ( suffix && suffix[0] )
> +    {
> +        if ( strcasecmp(suffix, "s") == 0 )
> +        {
> +            multiplier = 1000 * 1000;
> +            exponent = 6;
> +        }
> +        else if ( strcasecmp(suffix, "ms") == 0 )
> +        {
> +            multiplier = 1000;
> +            exponent = 3;
> +        }
> +        else if ( strcasecmp(suffix, "us") == 0 )
> +        {
> +            multiplier = 1;
> +            exponent = 0;
> +        }

Considering the initializers, this "else if" body isn't really needed,
and ...

> +        else

... instead this could become "else if ( strcmp() != 0 )".

Note also that I use strcmp() there - none of s, ms, or us are commonly
expressed by capital letters. (I wonder though whether μs shouldn't also
be recognized.)

> +        {
> +            fprintf(stderr, "invalid activity window units: \"%s\"\n", suffix);
> +
> +            return -1;
> +        }
> +    }
> +
> +    /* u * multipler > 1270 * 1000 * 1000 transformed to avoid overflow. */
> +    if ( u > 1270 * 1000 * 1000 / multiplier )
> +    {
> +        fprintf(stderr, "activity window is too large\n");
> +
> +        return -1;
> +    }
> +
> +    /* looking for 7 bits of mantissa and 3 bits of exponent */
> +    while ( u > 127 )
> +    {
> +        u += 5; /* Round up to mitigate truncation rounding down
> +                   e.g. 128 -> 120 vs 128 -> 130. */
> +        u /= 10;
> +        exponent += 1;
> +    }
> +
> +    set_hwp->activity_window = (exponent & HWP_ACT_WINDOW_EXPONENT_MASK) <<
> +                                   HWP_ACT_WINDOW_EXPONENT_SHIFT |

The shift wants parenthesizing against the | and the shift amount wants
indenting slightly less. (Really this would want to be MASK_INSR().)

> +                               (u & HWP_ACT_WINDOW_MANTISSA_MASK);
> +    set_hwp->set_params |= XEN_SYSCTL_HWP_SET_ACT_WINDOW;
> +
> +    return 0;
> +}
> +
> +static int parse_hwp_opts(xc_set_hwp_para_t *set_hwp, int *cpuid,
> +                          int argc, char *argv[])
> +{
> +    int i = 0;
> +
> +    if ( argc < 1 ) {
> +        fprintf(stderr, "Missing arguments\n");
> +        return -1;
> +    }
> +
> +    if ( parse_cpuid_non_fatal(argv[i], cpuid) == 0 )
> +    {
> +        i++;
> +    }

I don't think you need the earlier patch and the separate helper:
Whether a CPU number is present can be told by checking
isdigit(argv[i][0]).

Also (nit) note how you're mixing brace placement throughout this
function.

Jan

