Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2850F6E42C2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 10:41:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521847.810787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poKQQ-0001rX-Ps; Mon, 17 Apr 2023 08:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521847.810787; Mon, 17 Apr 2023 08:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poKQQ-0001oh-N7; Mon, 17 Apr 2023 08:41:26 +0000
Received: by outflank-mailman (input) for mailman id 521847;
 Mon, 17 Apr 2023 08:41:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poKQP-0001ob-Co
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 08:41:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2080.outbound.protection.outlook.com [40.107.6.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1d29484-dcfb-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 10:41:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9087.eurprd04.prod.outlook.com (2603:10a6:150:22::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 08:40:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 08:40:53 +0000
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
X-Inumbo-ID: a1d29484-dcfb-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLSqiu/MAuOKOQFNbaXTxbspXVVKG5GyeYoNV4j7xRXcFX+mHtaIuyweWBKfd3XC5AntNeJYMAWaQd4OfrTwcygpVepBh0RP9abCf9Yhe6Ro2SiDDfeaP7alqboJeO4th6JYip7k7JqKHOlRsEuG5ShgQw0AtP/hSJ9fKe8lMd4zUyg8C+I6v0lcDSNy7Qe8N0rQhZ+NPyShf/+ktU7z1Ug7yTPKguhME8cq5Ghu1VeUs3Y9yp/58OZzcnr1hpQ/x53SLDCn7ecuW1brF/0geZAwKW3Kj6xBRjI27KoK4GaWQ2oGUwrbskb19SvBGfnnaUwp09TSC0H9PP/VdZSTuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xQLTxjkGweer8XTiy7zr0tqVBIDnHqVEj33+A0p7VY=;
 b=GW8NxJJY2Kd7ahPd3aXVesO5zjO+APcEzgRHyKb0QjDYBYld/oi0QGnqDCh+nEzisxAQfpBcBnZLGtQIX2xDCyri9nBqRhHDEniydkE5GNNtezpTt4EFlGOXpySixWzONv7I6vUMKGsxFKtPyIK+Y3jkQdoxbiZl6ulVsZ7VoIoLzKVBLCi67JinKLKvAwZQ1JoQ8eHlSqPX3iF3Xzf+yv6EFXbT8Yfht1J/SlkPLTCo026AgDvCJgQtqoW1AvNDmcMPJGHQqibhlWW+CePucjHh5TUz+8fDljuK7ArE4OgvKQkQ5T+VpMsZ3yHakU6HWkColktdcAFB2lZKXhi+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xQLTxjkGweer8XTiy7zr0tqVBIDnHqVEj33+A0p7VY=;
 b=kLPbX8UVx2Y2VLJLk3WeGq7LjE/ufTmi/j+HD1JatgpnOMInLBgbftkrvmNw3h6GH7wzbQpSEsIDKIPBEszPsA3ILvccAPyrCezdVZUJuw1L0hsqgVSQSgiBWWcOj03R/jQHHL4tNa+FINKW4v62mzeq25tPa1Ipd0TpJUoGBmWnmnldCnmwE6aot1y0pTgH/DSJQI9Ke+NLXhqkTve+y1gyq7cYYuCAWDQkaJahmUek+UiPOPTYPQpWAeimTqELLq66ueNn3MiCJPVP7xWkcvuv75ySRI1GijPYkUXBQWPZmNp1qUteiy1Pb6y1ed9a/BMVzmBfsFkZhKJ7Y1t/Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b0ea9cb-717e-8bcd-f08f-fd45d8993d95@suse.com>
Date: Mon, 17 Apr 2023 10:40:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/3] xen/efi: fix unitialized use warning
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20230414185714.292881-1-stewart.hildebrand@amd.com>
 <20230414185714.292881-3-stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230414185714.292881-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: 893c5ad4-409a-46ef-08de-08db3f1f7416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VoV0juDvrwPSFqKYmM8ggZhgS+nMG7B++3+LWDnYi9B94aet7NcBkR3lnrrsSGNPaXaf+a4SF8MIjx+x753FzZMRIpYCWrgbjxjAjCOMnSMbD+9NYMkvgik0jQ69ok4bfsz6TA5q6g0PmHGXSDvGIT08nhIePjvexoBYTZy9KCo7HLX9LcAaQyDGpUiRrtTrUK1YeGV4dd0IRrPGM7zCmBkTBSTCHAZQCCLUqHfvwVzIduLV1TDSwQGPTTOkDC7kR+lUOUytMKo5b3vTSJ5hdO2gHzWu19gZaQZvxWm9eWlL6GS1yT4n7H7hDhNINI5TFX1FwJDaD6WJc0hcHNEmxb6nIcXbOt6gxNkvqKSJQbgx5phJn/16naCo2MNHt3RIjOUMk65Kg2E5Chr1Z0aw5fvzhZItko/RIp+Cs3JKKlmGJf931/CrZV7HumsGztK+uYGaETzmzwfGkghTBR/Z441MnOb+eOsEydslH+zp+OebN6lqbnbhqLw/wRI/+9i1S6SKYOBxrdXknFI2Mj3untvY2BHuqGSFavxLsUUZCh185yn1/qyrwzbb9oADyeHVPObEbuOnRvrbtyuoR+5VyA5MnrxvjPY0jUYVO+hd/IRV3F694wwPgurpUi8KdpoxrIYVZX0BSbCFH7PrIgl/Bg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199021)(66476007)(66556008)(6916009)(66946007)(4744005)(2906002)(31686004)(4326008)(2616005)(5660300002)(8936002)(316002)(41300700001)(86362001)(36756003)(478600001)(6486002)(31696002)(186003)(53546011)(26005)(6506007)(6512007)(83380400001)(8676002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2VjaXVMbC9YMDdDK29yS2lNcGZOOHhVMWZTYTQ3Mnd0NENWZUJyRzBvaHNV?=
 =?utf-8?B?KzFaUVBzUFNJbkEvR1BKWmxlanMwRmd2M1ZxOHZYSFdqdThxb1h6N29rbU05?=
 =?utf-8?B?Q0Fob3RWeTFuMmJZVjAvTFlpZDBMSlRFb3VZeWZuVFRPMkYzTFZDb0kwRU9I?=
 =?utf-8?B?TEtUL3c0ak94NWJOQytlczMycHNHOFJaMWpvcWM5RmNwSGorMDh6b1hmNHVL?=
 =?utf-8?B?ZHY4RkZuNTZtS3c3WGE4OThoS1Fzbnk2b1B0R1Qxcm03MlRTT0FUU3ZoOWxr?=
 =?utf-8?B?RUZuZlFDM0xONmdPeHZXaktmaktUNzJzNzRnUVg3R2hTbG01Wnc3TzVDL2Ni?=
 =?utf-8?B?WmxTZ3ZlUGh2ZklFenVrejRsM2d5YlBuQVB0cjBzVFM5Z205L3F4TWYrcTRL?=
 =?utf-8?B?d3FTa1V6blFOSXBMNjNvYkkrSWFkVytYTlJYdjVTakRHUUkxcDdFQUQ3NlN2?=
 =?utf-8?B?TFdtaXJXZU9lZWVNaFR6Ukt5VlBjazJDb0RWT0RwcmM1OGhGL25oYktLaUxo?=
 =?utf-8?B?cWVmeHhuMEJ1ZGxkWTl0UG1uSDFieW53MnZiaDRYOWcyczdSNFBGS2w5SDlt?=
 =?utf-8?B?NDJ4OE9zSmhoaWRHbzliNlVPWU0zbFRSZGx1a0pFMVJJZkVkaEdRSWVNUkZu?=
 =?utf-8?B?eFBOdG84akljWlJpOFBPM3ZsYlNvVXRlTXJubFNXQzJaNytMUVBwU2UrN2xU?=
 =?utf-8?B?SGRsQ29jV3FlYkh5ZmtVRDZlUGppSTgxdEhsaHhwR1k0cEVoUTdOVWNHbUh4?=
 =?utf-8?B?cDRPWmRkR2k3Z0hPR2RXQ1BtU0FISE43Z0lva21TV3MxeG9nWHhqeVZIMjVZ?=
 =?utf-8?B?TTFFeGxrNVlFTDFrSUQ0WGFoMVhQMXMyaksvbnpRUnF0S1Z5SE5WeG51YlNW?=
 =?utf-8?B?VGpZNzU2L2NsTDhVN0JWQUpNL0ZMT21CVUpweTdkRkNVV3dPbTJ4ZnVwTjkx?=
 =?utf-8?B?UFl4d2c3N0FOODJLN2tSOUJzYS9sTUdjb0sxQ1ZuWGRvUldEMUNjNlJKSkRj?=
 =?utf-8?B?S3NsQkVOdG5TOXQ3WE5MNCt4MXZ0ak4zNGtEeGxrQjNtQy92UStjbU4rdkZ4?=
 =?utf-8?B?dDl2cnN3Z1FrSU15L0FjbWl5aURpWGNtSkpZMlZqRUFxZDB6eUwvWFZuaDFR?=
 =?utf-8?B?TmhheW1TSWJrL0xQbDNiS1U0bXpjbFg3VEtkM2FPRmNwRjNURWhpMUswVjdk?=
 =?utf-8?B?RzFRVWJrR3lWRFRtcTl1N05rTXhqYkFwY0hnRlRrSlY0K09DNjJrTDNOaTd6?=
 =?utf-8?B?bVpzc2ZxeDJqTTQyQ2RnNVpRMmk5cmdjUkR3U0sxNExNU0dycGtYSDBtMFVs?=
 =?utf-8?B?SjhYWmxtR3l0UkJ5SUlQZU9DMkhlcTRhbDhPUDNZVHFWNi9HT3hCR2IzQ204?=
 =?utf-8?B?TU5MVXZiN0c0MnRqSm4yc0N2NllwbElxZGw4N1oyVEdlNEJmRHZDMlhHTGZE?=
 =?utf-8?B?MGxTOGhUaDdXY0tla01FcUQwMWZIYzZNUTBEMGZPcTRHb0szd1E3Q01GaXBE?=
 =?utf-8?B?TllNM3pnVExzaEx0ZWlKeFlzRE5HZ1cxT2diSzQrbHpUU3RmU0ZNQ2RKMUpD?=
 =?utf-8?B?OXowREtacXlUQjhjeERPNktaNkhFL2RZRzhnc1NjclpqQzE0R3VDdkVyY2dM?=
 =?utf-8?B?eDZYQ2JRL3Brc0k0K1lBSW5nNGFsMkROR1R1aDU5M2E3cWo3cHIzTENuRXRj?=
 =?utf-8?B?Wmw0d1RlWVNmeDRuSmUzTzNwSGNQS0dMVk83ZjcyVVFzVEE0MnQ0eGtZbkp5?=
 =?utf-8?B?dlZ2RzVuZDBvbEdOc254VnRDYTZUbTNJamc1WkFHSVB5V1NTNFVpQUliNkdT?=
 =?utf-8?B?L0doL2Y1YlpLa2NQeVFiRXNENjZHczArVW81aVZYaVc5cy9mVUFXYXpNNFE5?=
 =?utf-8?B?QXM2YjZwVWFqWStwTHkyWmtDUTdSOWpxSjBYaTBDMTEwSUxTQWlXYXFxdlo3?=
 =?utf-8?B?THZja2V6WkNUQ1JONUpveGoxd0xRYmpxQUNhdVZqeXBuN3VXWmVzQUNvODIr?=
 =?utf-8?B?aktkS29UZEJ5YXFjcy8rd2lTLzAvaEJ6bW4yQnNSWWRxdlBwNmNaRzNtSjFG?=
 =?utf-8?B?bXZyN3pDVk5OcTA4RG5BUG9lSGFUMkhkNWtHOTkxNVhpOVUrdUdpMFAyaVZX?=
 =?utf-8?Q?hgZeKV98ADAZLy4XYa/OBXHu5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893c5ad4-409a-46ef-08de-08db3f1f7416
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 08:40:52.9388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+eHLkB7xtWTWlsfJDthLpJugFxpjRhM7MdfQCs6zXUfG/V902VlWwev/bhaFJFeMA4FLYb9HIfP9NbkcsI7Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9087

On 14.04.2023 20:57, Stewart Hildebrand wrote:
> When building the hypervisor for arm64 with -Og, we encounter a (false)
> uninitialized use warning:
> 
> arch/arm/efi/boot.c: In function ‘efi_start’:
> arch/arm/efi/boot.c:1468:9: error: ‘argc’ may be used uninitialized [-Werror=maybe-uninitialized]
>  1468 |         efi_arch_handle_cmdline(argc ? *argv : NULL, options, name.s);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/arm/efi/boot.c:1263:21: note: ‘argc’ was declared here
>  1263 |     unsigned int i, argc;
>       |                     ^~~~
> cc1: all warnings being treated as errors
> 
> Fix this by initializing argc. As a precaution, also initialize argv.

I'm not happy about this kind of change, and I also wonder whether we
wouldn't better use initializers for both variables if we already have
to work around compiler shortcomings like this one. Nevertheless I can
see the need, so ...

> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

