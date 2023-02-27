Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9856A41B4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 13:31:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502496.774335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcf0-0001T6-RH; Mon, 27 Feb 2023 12:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502496.774335; Mon, 27 Feb 2023 12:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcf0-0001Pv-Oa; Mon, 27 Feb 2023 12:31:18 +0000
Received: by outflank-mailman (input) for mailman id 502496;
 Mon, 27 Feb 2023 12:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWcey-0001Po-GD
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 12:31:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0529c80-b69a-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 13:31:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6848.eurprd04.prod.outlook.com (2603:10a6:803:13c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 12:31:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 12:31:11 +0000
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
X-Inumbo-ID: a0529c80-b69a-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1qlpLZ8rEyz9DB8byEOguHhF7THqyGQw2PK5OJLNqAbWcsiAWlc5TF4e+AHaiI+mXezD/MWZD/Ppynlo/Es4BldacBsrvKJQLp1XFbw6aLCZFdYdpG16o5cX/1B2x8oCqnkveno9lk5T17FRfMNjD7S/FO1cfbWmrEFq79nJHj4O7hZLMyuzim77LS/DNzwjbt5m38Hj0DOn40a/U6M/EUrYE+/dugmqksB39mZ6pVCAIdFAdf8PmodHiX1owSgaxxszOwDbPNwXhZqRKdykvgpdwcDVtsO9yWCwxQvHF5wqjxZ8SE4zzo+5yd/oHaprdv594yk00U/o8UhFecDXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HV7PqWQSzHcfNqI/zrUSn1mT7H2bAdoGk7sR4Shd2oA=;
 b=R7p5YXnCP4Vg22ZkRhqbqgu7f2Tx+1Vr+SeF717x+kfloLF0/Cclk4O1zS32P1rhASyoPHm54r2ts8j5Ur3RaUr2c1uBHtG5odOsCIOs1/eBwg44xxjuAx5sjaAm2W/ATb50u3zs7CDqklyEwY4wxPmU1TBTUzntdq38x0o4JPZAxB6uuLXCJ8yYBnww2nI0tGfT2hj0YTb1MeM0g4CJWunYraV8P7g5oq4lLQOBcXvbVEXQcRMChIu5mm1fYMXgp+rVndv5xbGgCnVAkXPA2fj62PVgwtw48F6DJa9iw72qr4qL18rog9LeRvFO2HRC2/VHXahGhYRWs41cziXN7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HV7PqWQSzHcfNqI/zrUSn1mT7H2bAdoGk7sR4Shd2oA=;
 b=HJaKiOtA/IQsL5JDNQbxfX3i8faoeO4AUmWemxEsZ9dzapYYy4uWk/f0sljW+HCy1ZXX4KimBRsxxDaIISviKMQRXwSlPxFrOFev6IfN280VUmXg/6nXdKF9TnorUmvUFTP9Cl7Gy8geO7iyguHEXZZEeGKCfFE3d+Hln6/2srjVPIgo63nKb4+Im+MuXQUHdozLg1wQl8uFtYzW/OM5taXOIRqKg7XIjyKWccqFrXWeIWaDHe4P8a7M1BiHXWqhJrLChSaIykUGrP2cnjN0V4AZlX3dPCOgbSUoB+iKD/BTA7nCPZEfGz99/9IehRPB1YP1lxYrPWFHJ2qCxD/KfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8865a525-b55d-9b4f-ad2c-fe1f70afd0ba@suse.com>
Date: Mon, 27 Feb 2023 13:31:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] tools: add offsetof() to xen-tools/libs.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230227120957.10037-1-jgross@suse.com>
 <20230227120957.10037-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230227120957.10037-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ad1304-38ce-4d7b-c154-08db18be8283
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ozHfvPq+NgEB3u6eGwFn58Qwk0Y+w1pIFpCC5ZQv5KM0VFdDew660t+PREqoMjLr/a3WmWpqzcYqomV3OaL9nauE8906XVicqwOLslFgE9kDyuNopee0titobF4lbVcC8bqWTzKYhKbq9i83wjEwiVU9aPA94sMApHPJxv474WDoeB5JLnjc0oqyqlsbTp2zGBz+QyLZPH9gKhZouDlHHk4vEz7TqKudSc1fTELlLXpkk820PZH2eGrfg06eU6LJRuRbvbHZdaHIzTHmx8GuXB979r1WWIfggTqNETk2oBin2etxO7ni4uvObI9MnEIYburcN8ZsUzgWKJOWxkEnidAvKK2kgWY0ZmY+4wGj2qxGrWzViwXMIorGLXK9CXHVI+ryOFwTYf6mHi4+y3Q4dyXHvwtSHGeZe/NtPI3wKt02FZQt46yAazVIM+H/XF3s96ZaYpYI092mheWuqh/PFazCfTGTxQwOHi42cQ/vO7ow8caj2zeVntMzq8u2uKvnmCIqvnUuoEHfOmfAjxxWfmCyEkFsHoDJ1/4e6VLmUdJAFKMLUR4+RuzY1XmSYVo+YjPpYCn9G9SiNTYPuLd0dRBStAQwfwiWv+kNX3kT0AL0tgWnksE7Z2aHDy8PdKd8kE9cml9SMCSvP396y7DFrO2J0IT69MG8xAvGgEklUiMm0CTPXOGWYEWIeNW2zwdVyQxNH867tukU0DTJxcyCb9co4uyluOOFaXyRLHe9cX0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(136003)(346002)(39850400004)(376002)(451199018)(316002)(37006003)(2906002)(31686004)(31696002)(6862004)(36756003)(5660300002)(4744005)(8936002)(86362001)(66946007)(6512007)(6506007)(53546011)(26005)(186003)(4326008)(8676002)(66476007)(54906003)(6636002)(38100700002)(66556008)(41300700001)(2616005)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHlQVkp0TUdBc0RIdlJwNHA1RTBzWjllZWlHUVRXdWNjalBFcjNXSGo1aUNv?=
 =?utf-8?B?QUhpQk4zeWZzVi80UFJzVVVqTzJ1UkFSSlc4bzQybkVGTzF3VXpiempFYnEr?=
 =?utf-8?B?QTBKeGoxbUpKUlpGK3dCb3V5bnJWS043akR1MXR2UnRETjFjOStPOHBPY3NC?=
 =?utf-8?B?RVJkL1p4dEhhWXY4aERsOStGbFFZcy96VjJvTDZHMXhhUjU4bVRZYjNvQ1Uz?=
 =?utf-8?B?TElRSGk3ZThHdWc1VGdJS2hQT1NWMGw5UVhIWERtQ3NlTTZQRUNJMkJmQkxW?=
 =?utf-8?B?S2FvamVJSmZNZFcrK2hydUhGQmU1Um4vVUwwZ3d2TEs0dW5oQjlDQzhhTU11?=
 =?utf-8?B?Skp0SjcvbkVkWkw2eVUrWDh0ZkxOT1pzQ3J1QUVFcEFtTzN3Z08rQWZyMito?=
 =?utf-8?B?eWZ3M295ci94TXlZMTNvbHVPRVZndll1WWhYcDlURFBkY2J3SWxVQ2ZHbmxT?=
 =?utf-8?B?M3JjZUhOMXMyeGFSRXo3NDZJM1BQWXJ5eTJIazdieDZkZTdLRXVhdnVjTTI4?=
 =?utf-8?B?TVk2Y2V2RTVTUVh6ZEd4L3lyQmM3RDZrU1VnZ3JwMktsZ0FhVEtXRkpONldj?=
 =?utf-8?B?a0d6K1hWbWpYT3ZZUGZMMGJJTEFva3oyY3JZRGtESHZ1d2Z6UVVFbHUyR0xM?=
 =?utf-8?B?T1pudW9Jcy8zU2RDUVpiVWdIS3I2elI5UEdYWXVDVDBmeDUzcEtOaVgrVTlM?=
 =?utf-8?B?eGozTG1MOXBYaHhKVWhIcDQ5YjcyeXZxS05KWVhrQUE4V1NpMHJQbTBJWHhE?=
 =?utf-8?B?ckovZ21Ybk1CdnVIaXJ4VHFqckJWMHhjUGtMN0xXaFZLL0hXQ2RXTC9vVjdx?=
 =?utf-8?B?djRYMTB6RHN3ajgyNlJxZHNHNHpoYmErVWhXRVN2dldQc2taQVJDVWxUb3lM?=
 =?utf-8?B?YXd2L0hXbDlYNDVMakF2S0d3TFhhaFBDZzlkanhJU3ZRT0ZaM1VXdEo2L05K?=
 =?utf-8?B?NlROYUxwR1cxY0xuc0h1OUJ6Q1VjbW5RZ0srWnMxeU5CTFNnK3dHNWpncllK?=
 =?utf-8?B?alRPQ1ExT1BvbnBEejRRQlNzdTZUNks1WDJpZUIwM1F3YlYwVURKVTBLdzh5?=
 =?utf-8?B?bEVMbmdWcldVZm1NekRJQkNpTS9qSlJsQmx0a1hCUU40cHVuNjZxclhCYkJm?=
 =?utf-8?B?Mmt6a1ltN2Fzb3pHbVo1bWgzalRHUzFFL1JGVHY3SXVDbWVzTGppTGlPd2tR?=
 =?utf-8?B?cngySDNydzhOVjR1MVA1WWZDTTRGVWtpRWxEZjNybWhzYndJZmUwOGFyV2xs?=
 =?utf-8?B?Vm9teWlaTXlITWhmbGJvMm1yOWhXVUpVRFBOSFJHUlJ4bzJPZk84Sm5kaGFI?=
 =?utf-8?B?WE9iT0V6a0RUUWt6d3hOdkVWYkhmOWd0cUlISjNpeU5QTE02RytZa2VTejBv?=
 =?utf-8?B?T1BEbit6N0M3Y01PMG05aFR5eWRyd1F1dEhlMUMxV2hwNDVsaWs4N1NQUXpG?=
 =?utf-8?B?QzJTTkJmbHQvWU5FemFEN3hvVC9TalJxSzB5Vk9xdG9sdFFEVithczI4UDR6?=
 =?utf-8?B?ZWlzNlNSTDJtaktqdFkzRlAvUGNVOUVzeXI0VE5mWC9KQzI2SmwvU3dhbStK?=
 =?utf-8?B?SDFNU0hkWXE4L1RPek1WVjFvMFhsUXJHTjNVUG15UFJXZ29FTWlKT3JtMnh1?=
 =?utf-8?B?bnRSMGY4dlBmbG11UHJ6SWM1MlVuRGRkdjBEY3l6TVRYNEJKcVh2elpmeUx3?=
 =?utf-8?B?QWlydHpKMld4UWs0WHhLU1ZXeG5XTFJBUTVSWDR3YmlIcHVtQXFhYTFBbm5h?=
 =?utf-8?B?dWw0a09yY21KQzBHWDA2RUR5eDhEbFdubStTbVFQUEdlU2R2eDZGeWQ4UDNq?=
 =?utf-8?B?VDl3M3gwaExHajQ3NTkrcThHZVJCK2JNZVdjU2dEQTNvWFBTVUNvRlZHTGVt?=
 =?utf-8?B?eWZMdDZYZTRHNFczVFVtU09yOXJCSTFrcllNclRpNVk3MXFJa1lkQnhXZ0xT?=
 =?utf-8?B?REkxeC9EcTNMQllNOGtZY3hVZThta0EySXkydmNKTEIyRFhaVFpjeGQwcE1E?=
 =?utf-8?B?OVRRM2VnajJSQXV5cnczOXQ0eVVGVlFxbUFpU01OQ0d6U1pzT3NrQWtLa0FG?=
 =?utf-8?B?Y09RZThLaXdvMk9VZUNyRVNPOFBXbXlHZ3hEclJadzE5WDFIT1dqcWh4SEsx?=
 =?utf-8?Q?WJ6aXpje44E8pRu4pTted96ze?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ad1304-38ce-4d7b-c154-08db18be8283
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 12:31:11.7145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YW5QoBw4LLTV05ZBAKfGlQylvHZ573oB8ocKN6zO/tnsfnij95TtYJof96N8IGUufPjo7IdjP3yw2GAed+/Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6848

On 27.02.2023 13:09, Juergen Gross wrote:
> --- a/tools/firmware/hvmloader/util.h
> +++ b/tools/firmware/hvmloader/util.h
> @@ -30,9 +30,6 @@ enum {
>  #define SEL_DATA32          0x0020
>  #define SEL_CODE64          0x0028
>  
> -#undef offsetof
> -#define offsetof(t, m) ((unsigned long)&((t *)0)->m)
> -
>  #undef NULL
>  #define NULL ((void*)0)
>  
> diff --git a/tools/firmware/include/stddef.h b/tools/firmware/include/stddef.h
> index c7f974608a..926ae12fa5 100644
> --- a/tools/firmware/include/stddef.h
> +++ b/tools/firmware/include/stddef.h
> @@ -1,10 +1,10 @@
>  #ifndef _STDDEF_H_
>  #define _STDDEF_H_
>  
> +#include <xen-tools/libs.h>

I'm not convinced firmware/ files can validly include this header.

Jan


