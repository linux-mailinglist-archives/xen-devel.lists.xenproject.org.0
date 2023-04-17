Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 044006E4B0A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 16:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522188.811402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPaX-00009C-NG; Mon, 17 Apr 2023 14:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522188.811402; Mon, 17 Apr 2023 14:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPaX-00006t-JL; Mon, 17 Apr 2023 14:12:13 +0000
Received: by outflank-mailman (input) for mailman id 522188;
 Mon, 17 Apr 2023 14:12:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poPaW-00006j-Gf
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 14:12:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7d00::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d742a817-dd29-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 16:12:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7864.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 14:12:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 14:12:07 +0000
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
X-Inumbo-ID: d742a817-dd29-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juR63KWB6noZrYlfA8DzA4e/JkDHSlcjPoaKY64DV8uZ3aZJWHR9OOTMplV22JCpRdYnbSxh1H9ic4PwUTVbYQH8nIcsgcSOpF4Snrh0tJv7x2eT2R230zukr14ADONWjV00AwXRGhC0SzCmQDa2RqMOxo4//TshYVU1Rnd17++6JvE+0MJkzBaoBIpsDRXE4t156sVBAHUUqfL+dfEHeAbQwQzTehqdyuBtCJl73VKyB5ngB9bfqi47o9WEZxQ5eSoWx1xhwtR7EcPIBYxPW7xP5iMn5/oa4IEcx7Zd5aLQ0fcCODUyd4L+qmGnlg2ghKW5yp54pTMecqAKaE/6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoLyluOlNSAe8v9S6rj+i/CuSjeYOtj8gsgYT445rPE=;
 b=EcA6t5Dd+AH2q2X7Q9h1Fss1Z6NknkM1wHTjyFPysF8ED3dXOoTXEkmeBShGDZRjo+tum9Zyl7jDUpnjZEuZuMLJ9X3s6UNHwweo90IrKNSPU5rc58dycLXEMeLm6rrvsfMhd/zI411UEnTSOb6jKgYomn0HBqpr6lYU6pAh4toiGRJ5dM6ZDpSs2V/7mB/CHPNk0mm/vQde5sVO5WzCrFvLwc0Z/9qlya3L3u5Px/Lr8iEjIdjuExe/rT6OwYd5YURxb+i+VIQsMgH+s/lQi7CIeah2vknTd92BQgs/phHOCCRTiS7w0O6vtvm4GmViVHVIP2Eu8agZwXBhE1n8hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoLyluOlNSAe8v9S6rj+i/CuSjeYOtj8gsgYT445rPE=;
 b=YSMH+a93MRU2tIkVA9aVPFLXNxH2lbsXhDt7dADwov+EZ3kp5v3hreFfraNQOI+5US+EPre/9HUGWUL9pJLnlt59+zFRY/crMATDHWjv2/O205NVqRaD1/vbzf9hUPzHEHKMmKJ1E0z5vfS7W7rdlNjcPzT4D//QtLaK1LIIDLn49LphcCnDFE+nJLpgvBw+ouVAvf113BvwLiQyR7yX7cjlOFS2/LVbrUIuAbPy6EVJceMELyXI8Y3vosBGzQ0UXEyOaDbzjJvBgcUFLMtzPCU99rQ04EGO15UvZWuEPhRpEr+6kQXIvxf1qZP+fjSAT1Nv7x4g+H5kngejTNDrIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b343d8c3-b23b-c67b-76f6-c25d5892328b@suse.com>
Date: Mon, 17 Apr 2023 16:12:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 0/2] deal with GOT stuff for RISC-V
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1678970065.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1678970065.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bce2d28-2ec0-45e1-b80c-08db3f4dba06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SmumE2JFNrBvj06mwsy2lY5U7E2q278SrY7ndlDnDHZdq4dmwjllwmwPnhBIwoJzxc0X/etAh6K51KmwJX71Kjbw4KzYKoMSFCunFbewPLzMpUaHt3kcUzIB3ymhIA03kMMj45lefXdegDg9d9Sav7UnD2k0XMWK8HOclVNhE4Ml4NLv33b5RHTNQqQY7Bi7bfxVlnc2J+xCvzIGYO5PWxf/yp5blr7T0oZ2Wv/hwvDFg6zmnqy+Nw7/EDtsHAwPLmGu+2QO/8DV+rk+5J+W4B3+F80oY1DyeBC0pWuTlPvgg+FcGNfBe25G2QAZc6yZlFFFRqaew13VA62yRBHBC/DSuNoy+ZORNUA/yTc26kXMu24tU26Ti2Z0FOv6ByQ3QGkeEjWMBdyLCHcp0wH7gtLHpfD32g8wQtNqtbtoPpoYKAF3Nu9TeXjjkVTCResoS9VHX5RSyzROe0kOdxzorVZAUw+BQphiTVG6gfD4VxlU+3Vb0MhUqSDBat8NXBZzwQIGcEBdwaLUyMNn2XGhVu+w8Qn8bF5j8om3mrisAo861/aikgqytx3iurPuwZfGUU+Ic4muIqTX/X9J1x3b+zOSycvktYkEPLr/2+XkN64YNUmGBiQxzpV3PRTqnCCoytVYNxR3uHyA0UvbSutsjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199021)(54906003)(31686004)(38100700002)(66476007)(31696002)(478600001)(66946007)(66556008)(86362001)(6916009)(4326008)(316002)(41300700001)(2616005)(2906002)(4744005)(53546011)(6512007)(6506007)(8676002)(8936002)(36756003)(6486002)(186003)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEZKS0MySHFKSmo5TjJ2ZS9oN2hDa1ZleDZ1TCttaFhmVXB1Nm1HOVY4eWYw?=
 =?utf-8?B?TGZuNGY1aFdCeC9iemo1eE1zTUtaZ0k3Q25Sa1E4QXB0ZnNWOXBzQU12UUJn?=
 =?utf-8?B?RGpqYVJDZ1hMLzgxOUM5T0MyRFZ6R1QwZndhQU1BbDJRSlVMOVBEdlRYQzRz?=
 =?utf-8?B?ZiszK2hYL3RBQk5reTcyZ0YyWUQrZ0hWOWF5NmF1QmY4VWtkeUp4S1FBcmI3?=
 =?utf-8?B?bTFaRFNVR1drRDBnNTZCeGRpdFVLZndJcE00Sm5oWWVLUHo4a3RudmhjKzBO?=
 =?utf-8?B?Qzc0WFFVcVBWZDlyNWo5MWtQVmZRM0VSaHBlT2dUMkdKaXcveFIwNGhHdGxN?=
 =?utf-8?B?VDllU1ZHK3VkaUlnZ0Q4enBRWU9hSmFVSkIvVjRDd2VGN2UwR2RFRCs5c3Av?=
 =?utf-8?B?TEdxRDh2Q3o5d1VKZy9xMGRtS0Z1UmlSaTFSNDBOWitVekpXeWNXVnc3QWFX?=
 =?utf-8?B?MG4rdjd5MENxSUc2anhBMlFNQXYxSGlQd05WcnJYRzZoMThJUXQzc2ZvUHNG?=
 =?utf-8?B?N0Y0dlUwR2JlL0pyWk9CUkRDcmo3TGVETHRDWUdjVC9IVEpvMXArd08rQUpv?=
 =?utf-8?B?QVJjdmVENHRreTNRbFBXaUVrUlZkRFhiTEx1My9QV3lFZFpOWnhMMDdON3JK?=
 =?utf-8?B?ODlzME0zMjdrUEhraE44WGtmSW80Qzl1VFRjKzZDaEFDRWpOaURBSmg2UWdV?=
 =?utf-8?B?NXpGVVowK2F2SW1xeVdYWG9zak1xcHVqTXBxRDRabHlUYmY5TE9KUEF2Yi9H?=
 =?utf-8?B?MC8vMmFQcUhTYVgzVHdWdWo1dWVXYUdONHFQUUtBOVNHb3lvTkFBcXhrNitY?=
 =?utf-8?B?SnEyaGdJT0dpcTBYcjBlREtoQmZKQVR4bTdWQUd1eG1UeU5PU21GMDRQbWYr?=
 =?utf-8?B?cFBXOHpTWjZneEZtbTZpUXRpbGNyT3JvZUZyVFIvR0VRT0JYdU1wVXloVTBa?=
 =?utf-8?B?RG8zQmxVZURrWWEvWHkyZ3BtaWJvamVBejdnOXRxeGhQdmNpVnpidFRVZkMw?=
 =?utf-8?B?b2M5QklyZ2cwNGhlNXdrQi9kZmg4WXQ1djFORE9rbWhibjVXMGF0emJvQ0hw?=
 =?utf-8?B?M2lSYk5iOVI4aTRQQlZOTjVNL1ozSlR6MXJCcXU4ZmNaN3JKMUZNSFpXcDJs?=
 =?utf-8?B?SG5Uck9mYXdvcG9iVXRvTVludlVKL0ViSFUwTE1Kb2Z1VzVISTlsVmJna1FW?=
 =?utf-8?B?L1JxUmJpU0dVcmpHZFNlSVZUS0J2WVZxSDZIMEtScHJYMVZNUUNvaXBZQnk1?=
 =?utf-8?B?Vk1FUzdKSS92OUJvYVRBK1NPWmJDQXdCdTJPUHdhVTRuMUJPZHNJZGwxdDJw?=
 =?utf-8?B?SlNCNytvbENQeE1pRnUwbmhxMGJwSmEwZGVvenZBQkpadSsvaTBZSUx6dERt?=
 =?utf-8?B?RHRIZ0VXanYwRkRQMU9Rcm9URkVaR1JMeUpQKzBDeWU3eWVKWW1WdnN0d0tx?=
 =?utf-8?B?Vm52cjEvYWtLQW1RUUtsbXpWMVI5dnp4YjRqK1FDSHJEYWxUZ0ZqRFJ3MnhR?=
 =?utf-8?B?TWpkaEl6LzlweFp1M2lYVll2ZFpnb0ZUV2hDc1RxL1dNTDA4NDJJSEMyb2M4?=
 =?utf-8?B?SVUyKzJBbGpwVlA0Nzl6S1VOSFJ0MklTbUs0SGl6ZVNZbTA5OWVYdm9Sb0hX?=
 =?utf-8?B?NmhPOXJqMER0VkJINFV2eWMvNU1SSjNhTXdYc3FibGpyVEkyODJUK0ErYzE1?=
 =?utf-8?B?cGpNeXZQU09WS0FVRWY5aE9yTHZkVTc0VlRXaFU3a2hQaklKalRQNDVpT3pN?=
 =?utf-8?B?UHJWM1RKbG5ONVk1eGRBYVZUQWZpN3VXeVd2VnF1VTNpelZoN2Z2dFJGUUxq?=
 =?utf-8?B?b2IwZlBKQ1p1WXNLN24wNEkzMFR6ZklkSjU3ekQzZ1dBbGdYbk5YTjMyUzJE?=
 =?utf-8?B?MEhORk80eWFUa3FBUFJOTmx0UUhDMFVUWk8rQ0xRaVhuSlpJaFlFQVBaZzAz?=
 =?utf-8?B?Y1NHdlZwNVU3djd6NlI0RExWVWVxL2tyZGtqQTB1aDUvZEQrbzFOazcxc003?=
 =?utf-8?B?TktsMkowZGJVZzU4aW9Wd3llVWhhckoyWFgvWnQ0YmtRbmtqRVk4MFBhQ0Zw?=
 =?utf-8?B?cE5KOTNUOHQzWEhHUHg1MVZScVhzMS9TampzQlZId25ieVF3aGZpVThZNWlI?=
 =?utf-8?Q?Hwyu12nBO4vDDDRl+2ByJ3NaV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bce2d28-2ec0-45e1-b80c-08db3f4dba06
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 14:12:07.0981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHlLjc8iaecdk1vaZv9Q3jWymbFxdI5BdqLobPCTT3HonIDtP/mRrz/5LahvZflsH6LPKBwh4zX2yE99pGS3Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7864

On 16.03.2023 14:22, Oleksii Kurochko wrote:
> Oleksii Kurochko (2):
>   xen/riscv: add EMBEDDED_EXTRA_CFLAGS to CFLAGS
>   xen/riscv: add explicit check that .got{.plt} is empty
> 
>  xen/arch/riscv/arch.mk   |  2 ++
>  xen/arch/riscv/xen.lds.S | 13 +++++++++++++
>  2 files changed, 15 insertions(+)

Just to mention it in case you aren't aware: Hunting down the necessary acks
is your responsibility, not one of the committers. You may want to ping Bob
and Alistair (unless this response of mine is already enough of a ping).
Provided of course the patches still apply as-is ...

Jan

