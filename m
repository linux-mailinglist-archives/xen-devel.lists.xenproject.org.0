Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8CE71595D
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540948.843122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vK7-0004MQ-7K; Tue, 30 May 2023 09:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540948.843122; Tue, 30 May 2023 09:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vK7-0004Ka-4Q; Tue, 30 May 2023 09:07:23 +0000
Received: by outflank-mailman (input) for mailman id 540948;
 Tue, 30 May 2023 09:07:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3vK5-0004KU-2I
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:07:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6162a4eb-fec9-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 11:07:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS5PR04MB9972.eurprd04.prod.outlook.com (2603:10a6:20b:682::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 09:07:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 09:07:17 +0000
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
X-Inumbo-ID: 6162a4eb-fec9-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQSAlHXlVeJmNKNRjOYxQeCuD7VQ4lhiUk8wckrfWCvyxqvUvn3aFo75SmLQJIqqQaL04jvYs1awg44uV+PmklRT5KBHBHsW2958l8YCvsAVK0d6w1rksH4d8ANU1LaXr5cOnPuKMf43lXUbv6r79zTwEKtwcjlMbrOUtvUZttjlTkjy79p9jQyKzCLhp8/3RcGQMUD61H1ADlij2QEjDQhgYsrSnVn4+aNkclibMym5O1MAevbhlWzweF4L+IEZgZjEsPu2kYl8LiymrZcKtkw2DM7n41F079QrsoDUxtfpwwj3s5uNGEHqXcAgc7iNw1X9AnZc3oLqExVtRqVHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6j4RpVJk8+FiiDqdSbxE0XZO+TpLAYBU5hXPOIP34A=;
 b=FhP4QvB7R9Zyf2ZTsXBOVKg5rfY+u4HRN7E/UeDEVTmAGPPp2PyW1m8hEcFbNAFb3/cthnTDC0Ub6RnNX9bWQ+RtvPz6UAnL31ratf2APpjI4R6Jnw9efLIJdvTbFB1ABe1q1MzuLAMm+R4SYRykOQD/ogxfJXr25mqNWsa5VtffrEtp0331JrJBwBXRxb/WsIiYtG7tA3/v/QSJpcTOIzZJRHBtDVRQP/BPL9TNDup+4tbwRdv4ApjObzDesw4dMloUZxKxdMd8muPUgfoZL4wqjWm8ETKA5A0m+1UzZ7da3GR0G4FX46SW/OyyiEt19rxy/r/M/EvdPNqV9UHJ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6j4RpVJk8+FiiDqdSbxE0XZO+TpLAYBU5hXPOIP34A=;
 b=xP9L72voP9PSs86AdCjAC0yZRl76XPPO2zQjTluN0WrpC/i1LOTfUNVYoDfUBuUjgg2gGCnrTzkgb2tvsp7vnBFpZkAzkyuGWSxRVCJIT/QZxqdfnlSkfsPd8EsTn8vMJdqMgNLxvL3AIUEpsuklddQwHbPw7XAmzr6fUoddOy+8eJaY+4yhBn7vk7DkiHuqlkGjuUh/58DGPrp/AxF0xarc3M7nIbhk0VfICbjpppnr8xMvHz0VY6cgw/0InEIf+uC/4u4RMvjhcA+gA1PvP9tQUtjSSpyeuSHD3Os9/YGLqZ6qijmOpe7QyJv5DtSZu8ambQLihHKYa5Xwnj4Bbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <859c2409-f0ee-8fc7-5348-fd1678e91b4e@suse.com>
Date: Tue, 30 May 2023 11:07:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] x86/spec-ctrl: Rename retpoline_safe() to
 retpoline_calculations()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
 <20230526110656.4018711-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230526110656.4018711-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS5PR04MB9972:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e10683-654c-4e47-2e75-08db60ed441c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	of5/jPwlTCoCvc/K/kFk3A2VSOAOGkxYaUuF2yc/y7kyLTnjcVwtS5mIw6JY8A1rDd/uSpcxcjKp/S3L7QfrdB00QShLzrhHcjp8m3b/3w8Piakx6pn5fdWxeHocG2hzij65Yorqaq/bg8urDp8077GKqxLgUXG++PyLYt0z43wVVjvU3NlFocqPPk3dBco1JCTWfHGqozdy1lmPluqOJV/tzazRg80JhP+NhztehGaWKfWfEhiCONTYQBDCq37JYaaxCbeE+Oq53ZNr+o+90c8C6sNGlvsnm1DbLZtqAI9s31QDFaTuYhrmEWzI3X0mtv4AnU2KDSk2mt3lZwHFC3wB5aPvXS2beM0MOm1THXLz8MWYpxaHP8wNptkg8HNXMzrLPDCQfX+IDXu/41TnYoEz+E7EckqspJdsO9PTP6KRb/OBUin1Qj8YImnyeeKpj3kuXk5dEjL8plD64BUHf9+l9Y3bQRCt9tM5A7RNHV7K2XlhZU/RnGnNa9XxE3mOkNt4Y2w0v1djW6naomkMOZd/S1DQf1ab0Q8Cz1t/37R/10m7cR4oAxNRfD89ptPLK30KoiPvIEBCk/AUzlgCLiwQnSPLN1osoXF8ma4Vl3LFI/zHfcQx0ERsYr7NGcmNciQlZgoCr7EwOgyjqq0Kbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199021)(478600001)(5660300002)(186003)(6916009)(4326008)(4744005)(8676002)(86362001)(8936002)(6486002)(2906002)(41300700001)(31686004)(38100700002)(31696002)(316002)(6512007)(6506007)(26005)(66946007)(2616005)(54906003)(53546011)(66476007)(66556008)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUF0M29TcEZ6TXZLNTBtVDFTWEdWWm42WmVjcCs3aDc1REFYQ3FXWTlPUXY5?=
 =?utf-8?B?RlB6RHF1bk9rY2JXVGU5Sk40eEZuNERHa1hUait6VHN5cFZoK0cxRUg2bWor?=
 =?utf-8?B?MnN1TWx2K1RSNXl5QjF2cmxwbnhYUVN0cTFncFJleUViT1ZSaUQ0ZFpkUmJz?=
 =?utf-8?B?WEJ6TDZURnZKQktQWFpqQ3pTSnVoblZScmk5TG8xcU1yQnR1emlxMWVuTGg2?=
 =?utf-8?B?a0NGTFVTeHo0SVpoYjMvVmpsM3FBNnNmcHZFdmlUUEZVWHFKKzhVSGtDa1Jn?=
 =?utf-8?B?RGR4YlBUWmtWYW1YV0RSNllvMWNEV0tmeUM2OGZCek1ReEVUcXh4bndCc3dN?=
 =?utf-8?B?bW5zK2c5N0NUbEE1YnBEMmxaYUtvdXJORVFkMU5FQ0NEMld5czN1TEFoSkdN?=
 =?utf-8?B?TXZuZlZhY1NVdTBDNUpURm9IL04wN0dua3ZlbURzOXd2bjB3cGY2cUJ6M1c0?=
 =?utf-8?B?TnQvL2YvY1pxTUZDWFUyd3pLVGR5Y25CbUJrMmJOTUFWOWRyKzh2SDFRb2o5?=
 =?utf-8?B?dlFXK2pITzBuQXB2WVZqNjcxck1VYnd4ZzdJbG1MRk9OU0xQcmxra1RoTUhU?=
 =?utf-8?B?RTZ0SGJxMVBSTSswUCtOZ3BPdTN5Tlc2TmJlQ1pUWTRpRmdFRVlWczlvR05O?=
 =?utf-8?B?UUUxbzlHOHhoTmtYci83WEpJWmtEbEpjL3lwWStaUDJQR0FtbTVvR29oRjlz?=
 =?utf-8?B?cHRwd1crL29hemViV3VKaHUwVitSbU1kNDN1b3hjWEhuVE9mU0ErNFdEcjlC?=
 =?utf-8?B?TUxCUmRoN2xSWnpuTWJ5a011SDY4VlVWaE1vSU9JMkZMOWVZQ1BqeldXek9F?=
 =?utf-8?B?dGdrQU5mL011eGFxS2NycWpyRkI5KzY3c2dkS0RXQ3lENnJ0bmRxN1NZd0ZQ?=
 =?utf-8?B?MTFObnZvc2JkQVhMVVFMMUI2cEFJWVc3UVJhUUJXRkY4MTIzRGhHMk5sRVo1?=
 =?utf-8?B?bm4rNm1BbEZVcEp5SnNoZTN4cVhCUXpqbm1RSms0NXczZGlia01yV3RGTDJS?=
 =?utf-8?B?UmtzRHZsQjFYdVN1MUI5WTdGcUU1MmVmblNzTW91VDVRU3luSURoZHFOVy9D?=
 =?utf-8?B?bXBwK296ZER1cTkrbUxEcU8vdURJWW1CWGt3K1Z6clg1SzR4eXU5a29OM012?=
 =?utf-8?B?ZFZCY2hvOE1mb3MrUG01ZWRxRnZPenIyQ2N0QzVhK2cvK2JnK29STXIzcGpm?=
 =?utf-8?B?WERKTm9OUXcxNk12cFJYeDd0aVlldlFGaDFVbnJBSzQwb3g1OVYvSlZwTXhm?=
 =?utf-8?B?RGdpbFpqTHVZUGNuMzlocitINTFrRFF1YlJkNkdpcEQ0NTVwM1NzRXJmYXJH?=
 =?utf-8?B?WEFBWXZoNHBDUEVJb3dkVGJtNHdwejVvY3NCMjZkU1F0VTlQa1pkQWpjQ3Aw?=
 =?utf-8?B?ZVZLVkJHbnNEWUxYMG4vNTRoRzhhKzJ5V2E2c3BZaTdYNDRVYndmUStQQTBm?=
 =?utf-8?B?aE1tUTlnT2RXRDB3d1BIUjFpL1VjTXJGU1ZJVjFUR0Z0QXU2cHdQLzMzSWVk?=
 =?utf-8?B?a0ZiQlNhaElQY2Nhak1jMmFkL3k0WVFPMXozUUlhd3lIaDFFNXNVekJyUGE0?=
 =?utf-8?B?eTNtNlBGNU9Ya1FVelpqazg2a3hyVTJKakk3cGxDYmM1ZXVucnIzVUozQ1pj?=
 =?utf-8?B?bE9la0hhOFVvdXB1cGlBV1N2WlhKR3RRcm1PV1JINllJeUwrTlJEZHpxUWFx?=
 =?utf-8?B?RXBxaEcxODB0ZVBKVkdwL1pXellPTkhoSEJtRXBLUklRZWxYZUxPMzRNMUtv?=
 =?utf-8?B?bnU0dHdDV2lTVk1Lek1ZY0VQeU55Yy96MUZvUi9aRGdUbzNEc3JpVGpJeDlX?=
 =?utf-8?B?RERUZC80cnRYODhPajJFRHB6Q1ExQzF4UGlmYWozQVJCSnd6S2NaUkcvZmo3?=
 =?utf-8?B?WnVHdUhMa2d5SU9xSkhNY0RsZ09EeEdYWnRoOE93V3hSb3Y3SWh1dWsyQk5O?=
 =?utf-8?B?b2E5MlRJT29ZcWZoZ1RJcFRLM0pPQmpRQVdvSW9xS2hlVnNRY2M5UGJkY2lx?=
 =?utf-8?B?dGhzT2xsNWhvTXVKcmdSdHJwRFhZSCsrbkpJQTJuNWlERzlyZVRYa2xaMnF0?=
 =?utf-8?B?RmhDcDRCQkNiSXJSRWpoQXROMEdOb0VPak1BUkxUT3lrQTVLNHFzZ1o0S01G?=
 =?utf-8?Q?KXSriB+P+Ir9gcIIZR2vkw6iJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e10683-654c-4e47-2e75-08db60ed441c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 09:07:17.0836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uMFd5boXy5lnIqkOZPMkvyhrc+ehd4hAZrqqHS4FOVYt+58IaEy7AfuIUiKX++0XfxPEhRYwJfgWkfRo2c1XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9972

On 26.05.2023 13:06, Andrew Cooper wrote:
> This is prep work, split out to simply the diff on the following change.
> 
>  * Rename to retpoline_calculations(), and call unconditionally.  It is
>    shortly going to synthesize missing enumerations required for guest safety.
>  * For Broadwell, store the ucode revision calculation in a variable and fall
>    out of the bottom of the switch statement.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I guess subsequent patches will teach me why ...

> @@ -681,6 +682,12 @@ static bool __init retpoline_safe(void)
>                 boot_cpu_data.x86_model);
>          return false;
>      }
> +
> +    /* Only Broadwell gets here. */
> +    if ( safe )
> +        return true;
> +
> +    return false;

... this isn't just "return safe;".

Jan

