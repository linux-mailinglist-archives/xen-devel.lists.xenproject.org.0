Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BA5546378
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 12:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346355.572135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzbnR-0004KE-2S; Fri, 10 Jun 2022 10:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346355.572135; Fri, 10 Jun 2022 10:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzbnQ-0004HP-Ur; Fri, 10 Jun 2022 10:23:16 +0000
Received: by outflank-mailman (input) for mailman id 346355;
 Fri, 10 Jun 2022 10:23:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LSau=WR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzbnP-0004Fi-2h
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 10:23:15 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5583b2bb-e8a7-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 12:23:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8397.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 10:23:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 10:23:11 +0000
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
X-Inumbo-ID: 5583b2bb-e8a7-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+//Bycmsicfi7hiUMe4gw9oORTQfoLBRIK3REaemV/2om+nWvQHFxHUmeLyuWhU2gLkoF6okmdbLuT4jusL8YjQzDc5/AqKwlUSRvAbz3h/NNQsXAUbypQLdirWrs2ZkB9J9oHXCmR5jJ5nntEZu+rQMj9rZLKbpLcFMqbzrxQF21WzbR1pcvjhipeIpUmfwhP5YylvLx/JFu5H0+xbml/ndI9136v1BysukTrGL1gUJt1Hp1w4G2NaiK3P76QXD7eKJoN4FlRl6hq7gvbop7JbEDtGM9lhPWMdxiQJSDiMNeWPo0Y/VYg5VupRqwmTfv7RxTgXrqGrjnkmOpB82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HsS90DI+RX+hBh9tqd3dEkYH5Jd/Gq7vTcCXRSzz/c=;
 b=f7VziVLi8roURD9+W0e0YTZFfQ8H9KDAPB1v9S1lKU3oVZfAbubVvubfB1OQ/AJDAN/3/+fEdVq91soK89yAxkZh9AzQo7E3PAzY/KR1FyJcLW7oAx164wl1ByZJ3zwxTCxkyu6un1QhgUBagApljHTEseIqsaJuc5jRH8zq6u2QRtt/dXNfMzg8dNEkuQEjGh+Aejh9B9Hy4krzhhZHchePtpS1kGxxlVeQSdmQPEoL231Y5EfUMF8AacxfMERGUZpFl7Rr+nnqUj/3dfLHRPzQAGkknXX0Uyp2tmoqdH0O7tnBMyL+pZ1nSjeYiy0rv6aIGSZnaPdIynzZSrdpxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HsS90DI+RX+hBh9tqd3dEkYH5Jd/Gq7vTcCXRSzz/c=;
 b=s5D73DrumqqqzeEpvSsTeDHr4LoaiB7H6WTnZc9b5YTRzBW0RSIYm5SEBCX5m9OtujcuU+Da7fz3U/SG8X1i1GIb33xwlWaHPIRw3iX7Wd4nPJ7UbctWP+Ld5wIlQEVri23hIsSO/gttLXQ43amsIDKvOytkLxzDPOs+Xn2pGK5Z5zhaHqF5dvyEDf/oe1llcRQathSvQF8t0AT24WWLCzvcyUHDvUDixGlXNacXnJOhvjKE6xcZqKB5XNWkpAv/7292+4v/fxP00JXauh07LP6lOyqmtwpxRwY0TNWjeB+Kk2BVSD9/ZIYWbo9tR/P0ogHk6mT8ZUiKQuQWnnxexQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c61f607b-bfdd-3162-7b26-b4681b4cce59@suse.com>
Date: Fri, 10 Jun 2022 12:23:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] add more MISRA C rules to docs/misra/rules.rst
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: George.Dunlap@citrix.com, roger.pau@citrix.com, Artem_Mygaiev@epam.com,
 Andrew.Cooper3@citrix.com, julien@xen.org, Bertrand.Marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2206091748210.756493@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2206091748210.756493@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0040.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fca9ffb-b65f-498c-fb74-08da4acb387f
X-MS-TrafficTypeDiagnostic: AM9PR04MB8397:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8397A3A730A3ADA85FD9742AB3A69@AM9PR04MB8397.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dEJcHXKYoiAKq5J3Idcukxa8KPafyt8nF2ifv5FXjO008qnbE5AnLlcLh1iQnn1dkjkkwn9D7sbzPFf/efeYFxnUCYZiYN7XQODjTRexiWTaUrmtr6/C0fplft/UuRa3vASqN/ra98aSgO8Sv9Jw3lQziXMSjC4z8n+QTgMjfd1iA8WZRW5/UOGnd0kd9Fv+onLCHAdGNuhyxSOA5e/7ONfERbX2Ly3JpE+Hea+a3LziFRvdnwURC8Y84cBUdkX1UHE6ZsJU0uBbKnXXsDFJAPGavd1I6VCXzhAcUHW/FSeAvF4knhmfdSdSmZLgDmGEri1idJxohHCtp+Q4881UVcfXVOxFtlSOVB8ng2QVburjFMb0T3rAMCOeVr7xSWULIeumezDCY5BQh6t+u7Xw/khY1EPrwQ7xQu6Wz+3dtDFjpbQcN1FS60Z3UY9jidv9P7LjD+5f6xFWqL1jvXW45mH9tBb58HKOwZhmJ4enKWa8sZNjOvoNyIcC8g6Nm9MCXFw+yACtINhMBDISnERG571gHfbKv9BtjgZmSWSDEWuiII9QJFgpEj97RT4nqP/tONHMioUGc2iEuxD/8he8l+hunx58rjg9WNcps24YtiNyHf/u6bNsPyhr9lbYychcRxcOCwXrSa3/EhPsD9RF/lqZP1XVkh9Jdbngwoln1sNE3vcMKjLZPOCrGJmSJQ/2gIHIsC1NF3F9+CNtHZdT/OIvfI6jYEWcHnBercJ4Kxn9wSB2GoAULrCZOpoRzpG9QF8qe7MOaMy+7DZ6AQ5dYBj7cnau+ZKEiH+bskmDkHoEeyerWm/q/G5hrrG2fH0nYX4FYlWDg/CWo3iwsDY+FJg4RfTLKJvZFxTt6wC9EUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66476007)(26005)(6512007)(4326008)(8676002)(66556008)(186003)(4744005)(5660300002)(8936002)(508600001)(6486002)(53546011)(2906002)(2616005)(36756003)(38100700002)(316002)(31686004)(86362001)(6916009)(31696002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlB4OVJ0akNYL3FXb1JrUU93RGNveVh2SG1PbnFQR2J2Rjk5TlJNZENtRHht?=
 =?utf-8?B?UUt6c0thcUIyVE9qMTJUOWU4ek42dkFrckJaYk5XSG5iS2ZaRnNuSUJYV1da?=
 =?utf-8?B?ck85SkNvZ1pkM09iYWZpUExOYTRmWnRjQ1AydkZadFVodFM3WVg0RTVldjJH?=
 =?utf-8?B?ME9jN05NSDhhejlHUUZ2RmlsN2MwYi96eG1vQWdYZVQyZWE5SFl1NTRQcGpS?=
 =?utf-8?B?dW1TZVVFWnJXMndtSnNHaFF4djljbnFBK0dSMC91RmFVaDA2SzUyZWlHdUtt?=
 =?utf-8?B?QVd4ajd2QW5kUU40WmdVdk9hdkFRVEdsN1o0ZThLR2dKb01MT29sTERqTk4w?=
 =?utf-8?B?S3NHMDB1VTZTMG93L1JhZWlhRlhONlNDKzk3NGM1ZVgwbkFYNnpSUkFwYzYx?=
 =?utf-8?B?RTgzd2k1ZXVyY054MjlkMStHYzNUMjNmV0pqZVFrTU5HQnowOHRyMWtSem1p?=
 =?utf-8?B?N0VocHVxY0tQNnBHaXdFRFpMWDdKMCs4ekFkUkNFMzVTWGxhaEh2NmRLVkVR?=
 =?utf-8?B?MVQ3NmQ4SDFvUGV0YlIwU01sZ29rOWtYMGxKZksvQmN2ck9rekRUQXVpK2V0?=
 =?utf-8?B?S3JjSXA2OGRkM2tBUGxMWjV6NlV1YTl3R1ZDejNvNFBCTWJud2JFTVdGdUZv?=
 =?utf-8?B?bm1lcEYwUmdOaXZ0MmZvdFZhRTRQVFRxOXZIaWhPK0U3NGF0YUF4Qzk0bktZ?=
 =?utf-8?B?SUp3MFV1YU0veHo1N2tna0d2ZTdxRjF6K0RWSnMwSlVwMklUY1VkbmhmQ1NG?=
 =?utf-8?B?Q0FTQ0dmaTJ4U3B0RFYxMDFJTTRZeUFldXpvNXNrc2pBSXZBMVp1MGRTNEh2?=
 =?utf-8?B?ZWZ1MWNDV0x1QVcvRlpXcFlUODBOMC9NTjZrOGVmRFRXMExsdHRGZ2Z4a1RE?=
 =?utf-8?B?RFRvbVUvZDhHUmk0Z1Rqam9RT2srLzNwRThKbC9GaFg4aEQyMFk3TmJTTG5l?=
 =?utf-8?B?Sm9zVm0zeU9wTVRsSUMrZDI5ZmxtZW5XN291UHBEUnV0bFQxZDFDeUluOXhL?=
 =?utf-8?B?UForSW81cFpzK1hFU2FlcjJKWWo3S1RTNlIzT1VtbFRON2RVb2pmQUJqR0NW?=
 =?utf-8?B?TGlPVnpBcm1QRlg4MnRuRWcxUFNDZFNXeEpoT0g5Mm9ibngrWUQ0TU92ZzJZ?=
 =?utf-8?B?QWVzck5zc1VvM2RTWEw2L0NhTjRHQzh2MXlFSHVGYVlVcC9hMDJQMU1UUlpw?=
 =?utf-8?B?bDJoOFd4MEhCMmlFZlpKZnpXVTRCYjVBUVppNThtaUQzV3VRU0ZUbTRET3Zy?=
 =?utf-8?B?M29uU0kzVXNBN3A5cWdnUU1VWDB0UEVGWUsrMzFLRGlOUiszNzk1SGUvR1lj?=
 =?utf-8?B?aXltajdmVG9pS1JMMUdnK2dpaVpkeXh0OG91a1R2RVFxMDM3WlpTcFlMWFFU?=
 =?utf-8?B?d1ZNYm1rbjk5b2U1d2RIWFlNd0h0QTcxUVZvWDFTY2lDMXZkOUNDMmVqaTQw?=
 =?utf-8?B?WU1lUnVOOElMb2JTYVdmcXVVK2taWTgwSGxpRVlMWDRoWVViM0g3d1pFTm1K?=
 =?utf-8?B?WTdsMUQ3MkVXUm00N1ljZ0RtYUlqaWNVOVhYeGFJWkJIamxkQUVkN2g5VzZX?=
 =?utf-8?B?TTF3YUZQeHNHTDlTdzRjaUF2M3VvZHg1THRkUUR0ZUdnYjJCcit4b0k2b1hv?=
 =?utf-8?B?Y3NELzlheE4zUmw3UmlYNG5BVUJjYVk1TklqSVhKRVFGbFlLZWVhdEtSc0s0?=
 =?utf-8?B?eDFFbDh2Mm5keXFPMU1IRWJ4bVUrZWM1TlcwNG80WktrMjVibS95Z0Z3RnhV?=
 =?utf-8?B?dUovVFdJU0J1NFQ1U2FERFJDUkpiT056UU5EKzEwRzFUUkxkS00va0gvTWFB?=
 =?utf-8?B?U0NPK01aVlMrUVJMWk1ibmRob0hLTzVldTN2aEtpZU9SUnlvZ0NTd2JrdHYx?=
 =?utf-8?B?WUJwWjFvVXBnRXFZVFNzcnBCM1dqTVVudzdaeHhvMWhTTjVlb29wV1cxL0N4?=
 =?utf-8?B?S1ZKcjk5UFJKa0p6R3hNTUw3TmFvS2JNdHNXaVlKRmFqV3llNTdDa3VaRWha?=
 =?utf-8?B?SFphNjNUMTJJQ3FIczVTK29UTHdaKzJ5eTNrSFBrK2tkUjdFb29ZTU5OT0Z5?=
 =?utf-8?B?bi9Gc3ppRTJzTWZ2UGJUL0dPNU1hQXdsZUJwa1B2N0xCbWtWbWVxK2JlQ3RH?=
 =?utf-8?B?Mmk1RVAzbWZmSjFkM1hIODBWNFFFVkFjYjRXMnZ5Y1oxRW14K2IzVUxtZXRD?=
 =?utf-8?B?UHE3THZlQzg3Y2ZWNTdTdE5KeXZuTnNMRUMwb2kzcHlEQUVnOTlvN3U0c0hO?=
 =?utf-8?B?UkFTMnQ0czVGTUM4Qk5YSGpTdWZ0c3JOcWFvZHU0M0R0RUswTzlINGU2b2xK?=
 =?utf-8?B?ZWoxd2lLdU9PYjREYjNwNnRSWlUrRzFGUGxKdmI3Qm9NcWNkdDRBQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fca9ffb-b65f-498c-fb74-08da4acb387f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 10:23:11.4011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FeJZitsp1kWXhwKMBhF5bQ8Y6MyXH5cQk5DV5nO85lqCPA3X4atK/9CVRvW74wYbHKRuLaI3S8eFfXmDsskMUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8397

On 10.06.2022 02:48, Stefano Stabellini wrote:
> +   * - `Rule 5.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_03.c>`_
> +     - Required
> +     - An identifier declared in an inner scope shall not hide an
> +       identifier declared in an outer scope
> +     - Using macros as macro parameters at invocation time is allowed,
> +       e.g. MAX(var0, MIN(var1, var2))

I think the connection between the example and the rule could be made more
clear, e.g. by adding "... even if both macros use identically named local
variables".

> +   * - `Rule 14.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_01.c>`_
> +     - Required
> +     - A loop counter shall not have essentially floating type

This looks to be missing "point"?

Jan

