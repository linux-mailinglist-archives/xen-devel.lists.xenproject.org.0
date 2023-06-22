Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66642739927
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 10:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553360.863864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFV7-0005Ib-P4; Thu, 22 Jun 2023 08:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553360.863864; Thu, 22 Jun 2023 08:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFV7-0005GD-M6; Thu, 22 Jun 2023 08:17:09 +0000
Received: by outflank-mailman (input) for mailman id 553360;
 Thu, 22 Jun 2023 08:17:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCFV6-0003FY-Iy
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 08:17:08 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe16::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dc7e234-10d5-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 10:17:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8728.eurprd04.prod.outlook.com (2603:10a6:10:2df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 08:17:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 08:17:05 +0000
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
X-Inumbo-ID: 2dc7e234-10d5-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUjfVVRLMsTw3gA4qH3SbdYVlw6V3jtkj+A7rzsSTAQU7Gjsy+RPZxLiBCWmHfnHumcC6eP4auIeuwW88LSREqTiNkyPDe9cf1D2KeA7DniSa5urnN6ca/woZjuaAGPwiucAzpgQG9xVsUkVEsHvhBr8dKDm5V44BA3iCJUUgXhTiFWlwZxbTaSmbxKx0WTxFvdrmWoKIb/Em78+0BzQuYcamTB5zrfMnZpQ7qiwX47UgTnv4+wuX781exNAOAp1D8V8WZ07x4FhNQbKg4P3xTdF1mFIm435HlChG26WlX1d6NB6eJDggicD7sxoRUP4kHIu8XldVqH3mdAwCkYxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=924bBjvstlUDj5nQJHHIkHTBe5gt4rXp8wJGJbMjjkA=;
 b=k9drUCoZhZxJsxqyHEr5Lf/u2jvhKBQRjM9wRYUfT2njdBUBkJTTAonWtk0Ru/h5mvnyIDSbkKdoOCH+NkdnErwiN9vMITLo2UX08yZpy1n93cGg4BffmknSBBC4mgh92TyfjagrpA0gbDO+ZARltsNJ+c/ZJxwlAlFLh6TS+vkaODwLhikMU5GFEq4Y9VXgg3rfsiSyCjTvx2fLA/25zjJM3zlG1I7MLrl66pqc77cThytR7ITNsM3RXHe+Eg6kznTu9vam6DXt4/Cy4SNkc0u59DxTHdMGLWpjx0JBV/xpGOUUXXSNGeOfs+2ey5YRxBrgC7oEfO9w1CBsW1Rpig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=924bBjvstlUDj5nQJHHIkHTBe5gt4rXp8wJGJbMjjkA=;
 b=o20o3hrelaUgdtKwLxsVE+xHn+cETkHkj6dFFZE8Gf9IihLec6GxwwXa2vUwcFWPa258eKBhAIZUAVQQNaAPBnd1JzUpeQvYadadXK0iQ+xEg97dujSWXrOL5ysP7XLInkssofjgVprcMVQPEobe08DClaOCBUYgL8h+d6M08oDYEDKezAHmFcSFtOL7fFpEvkBNnI0+6opSBOUb+nwWxmZGuj1Yh9N1b7SvKT3X5wl71y/fUVXfs5JHZZBdbnEsLN5SfRAWS0+2yyM3ZGH43ZlhwOB2lEaiXBNN7hBLtXpa5kSyp9ma80DOkH0uOJ0u+5c0iqpwmNpkC5B/8+aYGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3b166a3-6ab0-3f6e-73b5-8e5111507779@suse.com>
Date: Thu, 22 Jun 2023 10:17:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 1/3] build: define ARCH and SRCARCH later
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230621161959.1061178-1-anthony.perard@citrix.com>
 <20230621161959.1061178-2-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230621161959.1061178-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad8c6ac-bfa0-4c43-6397-08db72f910ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/32VguE71dx9YzFm9rlnBXlo//DdmJNbHqQT1r+yDbalv3u/sZA3gi0wr2BIfELXIndN3x6tWzfZ5AxGsVgMKaz9ORc4/h2YA2iBa3oMl9wmeoU8oY8cKFUbRGcIA4yZ21s+h2xLXGe8UL0x07xXQDUdJY/Celsjgtr8tREONiFeXwKeKzv2DZ72pE8hZ+w1hhj42MhGEStYgF5s5o5Hv3RAeEUYmXzMPWVqWNVW/jMDmzi5VCL9cBhQHJCzVmYRE3dKfeaWp9Pm0/tSFlQkCzbxyg0gTAz65I5DzhcnK7bcFVn4DNUzh/EaCuu4ptfwJOtqQf126WiEA88AvAhD9tkiZ+TN5sSvx2xRh+RmVUZR8K7d1NVRon5pnpS/UxYy0WnOQQtj6raBGxnFrXUvaDsQcwXeWScbmca3fQKpgJRt6o8ANvYTngk5gRppvaoRp4rMK1JyNYz6Hk1VuweQwDsWMN3LQ4IKMEubJPHaSYLq7JyYJSoBvwzN39gL+br8xilQhJyoYi+Qu86MekMpx+O3FzdYFiANZuyy7vbpaP9L35sO5yMLX+K0G9gtZtL+vkYeVWEEhreAGF9sxVbd/x4hWFTb5ukj9Ip1Caaqulz+9NcTXbq8OAiRFT8qsqLm+XK+eu1Fbew5OLYNA0LN1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199021)(8936002)(41300700001)(6486002)(8676002)(2906002)(36756003)(66556008)(66476007)(6916009)(54906003)(86362001)(4326008)(31696002)(66946007)(316002)(38100700002)(478600001)(2616005)(4744005)(5660300002)(26005)(6512007)(6506007)(31686004)(53546011)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXNwNFpLUlZBUHV2UjdMbSthNmZ0amgyMFphVkZSNTJHRXVINGZocXcyTkxq?=
 =?utf-8?B?Y3BCczBhcC9WVk4wTzk2MFU0V3ZucjUvdDduUXFxTzlnR3ZxcWJRdHNpeFNT?=
 =?utf-8?B?dlM3d0doL3ZmOVZXSWJLRXMwbjZreEd6ZUpObitWZ1FGcU13aUVBTDBSOTZr?=
 =?utf-8?B?a0dpZFJZYXAzRFNHaWxiemdob0Q2UWZsOUt2QUxvKzB0bHRVSnV6djFGK2hC?=
 =?utf-8?B?MW1HMWRXSERla0EzYU9kZDlEdFJpM0wxalVITlRtMExGSkNmUS9UVUFOV0ow?=
 =?utf-8?B?TW52MjA1MGRhRStCeGpIK2h5ZHZPMHJOOUNJelNjQTd6Y1cyQTdrazJ6VU9y?=
 =?utf-8?B?S0NaZUt4K3FpdWN2THRVS1NtdWpzaUpydkhRVHl6RDZOalA2TjJnTWozcFZz?=
 =?utf-8?B?RFkwSmd4aWZjZXhvaFVYM3ZKOFFxbllqZm5aSHRyeVZMaXdMV28wRStLTXcx?=
 =?utf-8?B?Ry9lREZ5K0pTNEgzSjVEWTRNbzRWRTVJRCs1cmF2b29YTzI5MDYyYktIUlht?=
 =?utf-8?B?ZjJpTWN4bXlNZ0FSZmtkWDkrYk15SjFxTkNJeEdOczY0UzJzMXBZcW9LTkFy?=
 =?utf-8?B?bVBpTnJuTzY1REFlUVplVmliZ05jWmRpTzE2Nk1sa1FxM0grN1ZaT0Z6bWlp?=
 =?utf-8?B?WGYyYzVISUJaR1ZMZUMzbk1hLzJYNjdrSnpRMGEwbENmVkNYS0pldjRmRmw5?=
 =?utf-8?B?TzBzZVRlNG1qZnc0Y2EzaWZMMDBXNHFGUG81NFpJcVBzRmI5RW5PREsyMHpV?=
 =?utf-8?B?enduMk0xNm5NREJFeC9vM3k2TzJ2K3U2RjZ2K2o4djRMak5zd0tKbHoydUNz?=
 =?utf-8?B?c09vOFlrUEF3aFZYK2tYQzJuR054RlV0bmZXd2J6RUpUWFJPbjY3QWhiTWla?=
 =?utf-8?B?OHVYOGJBaEYvMzdMUDVBMENoTktPUlFCTFhnRVcxWHpISXFuOGlLSlNybXNV?=
 =?utf-8?B?UUZ1RWVkMFpFTlB6ZXZSUkk3UVRqa0dSanRXaUwzM0Z2ZEZJZXdhVnFZVWpX?=
 =?utf-8?B?bGFPMzNBN2JGd1pOSkU5dFY4bUdzdWJlZ0dZWFhpelFJZEI5WklrOGVzVzYz?=
 =?utf-8?B?Vk5EakdtVkR0akhWVmhjYXVvNUtUVGdaZHU4L01TZ01Od2RpdFpsUmZPMExU?=
 =?utf-8?B?OHJ2bEZSR1c2RFF6S1lxbWZ6ekVuMnRnSmdsc3JCTzdjN2xFdTB2THJ3RlQ4?=
 =?utf-8?B?Qi92eWpUczJVTUs1L0d4ZjB6OW1mb2FWNlpXREtDOU9mU3NoS2tsMVcvamVy?=
 =?utf-8?B?YkkxOW1na0hiM1VTbU8rQkFJa1dKellHMnkra2doQjcvR3VvcU5OTHNlWmh4?=
 =?utf-8?B?RUFqUmcrdzB5MGIwWjZjOUZUUy9zLzFKOWJEamJrKzFtbVZ2Q2UwTzQvZE90?=
 =?utf-8?B?SnU1ZFl2VVovdTFrM0hzQ3Bubk1XejRPcXdxYzY3L3JyTTdjQWdxRTAyV0Zh?=
 =?utf-8?B?OGFpM2NTYWRPTTNsSkd2MlFJckYvQ3FlMmxpajR6S25ic2ZYM2htdDI5NURM?=
 =?utf-8?B?bng0Umw3K3hUaGR0Nm5Yeld2czFUK05ubnN3OEE4SnJrbXFsZW9zUnVrREg5?=
 =?utf-8?B?QVU1MGFGYXdGME9BUS9wbURpa0xGWFZZZW5sU3BzOWFiV0xSSHpGckRkMEF4?=
 =?utf-8?B?RjFONG93YWZDSEhNY0U1Y2RVSHJvTUZoN3VtQk5xUm5OYjc1bG54TkdoNDJy?=
 =?utf-8?B?a0xTSnBxb0R3SmlIdi94U3AxMkp2bDFjYzZBQkFjYzQ0M1NqenR6dDJBeUFx?=
 =?utf-8?B?MVM0dGVlMmxTSHVldnZXUk1ENmducTFlM2puR25MWlhqRXgxN2hWZGsxcXVG?=
 =?utf-8?B?Wm1NanQ0TXVmZVl3d1BYMGUxQWx6d2pTck05Z3BZbDJnWWt4K3pMSUFWQmhU?=
 =?utf-8?B?aENvMEJSRjZCR2xUSHRkRTNKR3ZiQTRjZ0NYZktaa1JON2gvV1M3MGsySjV5?=
 =?utf-8?B?d21DR2htamNPSkpFNlhiSjNpbGlpaXpQM1hwMjR2QTRiQUJpNmZ5Z2kwYlIz?=
 =?utf-8?B?QmZQMERZbThQN2ZzUnFDVDUwTnBvdFE2LzFvaWhXRjU4SWJNWUh1TW1TZE5N?=
 =?utf-8?B?UVlIdXZndUU2LzZGOVI1NHloa3Y5LzZsS29qdmc0azhORnZUd2I4ZU1OR2cw?=
 =?utf-8?Q?jMDi9e/YdYBr7S0Ulk5CEfcXo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad8c6ac-bfa0-4c43-6397-08db72f910ad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 08:17:05.6766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKxZaG9yjA4dzkrwyAJZebVEc6s9CbyCwdNa4JU+Az0PPrAceaUQQwisGymaq8qGwpxaiCDsYCGCTo0+V1vwfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8728

On 21.06.2023 18:19, Anthony PERARD wrote:
> @@ -241,6 +235,13 @@ include scripts/Kbuild.include
>  include $(XEN_ROOT)/Config.mk
>  
>  # Set ARCH/SUBARCH appropriately.
> +
> +ARCH := $(XEN_TARGET_ARCH)
> +SRCARCH := $(shell echo $(ARCH) | \
> +          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> +              -e s'/riscv.*/riscv/g')

Could you take the opportunity and get quoting consistent in this
construct, while you move it?

Jan

