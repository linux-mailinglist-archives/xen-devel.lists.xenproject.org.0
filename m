Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 609587A5A26
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 08:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604407.941763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUWG-0001Lg-1d; Tue, 19 Sep 2023 06:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604407.941763; Tue, 19 Sep 2023 06:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUWF-0001J1-UW; Tue, 19 Sep 2023 06:47:35 +0000
Received: by outflank-mailman (input) for mailman id 604407;
 Tue, 19 Sep 2023 06:47:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiUWF-0001Iv-9S
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 06:47:35 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68e964de-56b8-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 08:47:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 06:47:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 06:47:30 +0000
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
X-Inumbo-ID: 68e964de-56b8-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKCs9UeDoRJvGOLy6CFw6P5rtLrJBH+no0iKHixdsj7PgKDHgEMaAaZV4UGayMqyOu22DBp5eQRjwQlUSQgsQvxYYVoxd3OS2+5E/P600ZfJIRf0CCq/0TNxe7W6STY/MAef6gkOvBerbso4It0L5v1rNdDjRfvZLOV67Bj/avL7nLXRurn1ipMpqEmcXR2b66hi0TuiZ0VDOw1us3M1Bn95EjAHy6y/Bah4dMfWheQ1NJ2VDixEEVcbFyxPR2zFCgfEeSoLhgRj0f4w76Epn2efCFnUPLfMAUCnUyi6m1crW8N5nd6Z1sM+7IXcgMWI2ndCKlVj+/yXclmKihsZsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79sXZoYBfnwKNFILBQD5fvtwPml9DKd9rKt1nKZ8gqY=;
 b=IkNdTqXIVP3l8A17Fp69WqY93lsU/Ubeiox/lbgx20il45vco+AumxNOVMwX8vFvIX8Y/vNpnhMrUEOM7rSeJVrnWNWNXQQmtVedot9cM+98rlvv1tRppUOfl24RKMGXZpRU9FXxFptCvGHJzdEqXiDU3Llc+i06WXc6d6Z2nsWxsy/IjfMsITljamVwznCz5+Srr+xAF4+gtY0QsDNfM+S6kwntcoov3cN+y6y4anR4UqWBBLwrBUIcP5ZGR++8N3bwJ3cgqmA0GEqXp3e/tD6JrS4kl52o9K1HT3E+wLK6SjdRVraxAVoebecfoTCfmx5yvmCViduayqoylqQfKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79sXZoYBfnwKNFILBQD5fvtwPml9DKd9rKt1nKZ8gqY=;
 b=jlW4r/KUPHhMxyPxbi14roCQ5i3skfc8DQycRqTiQE4ziPQ4wCbNgZQpZmEROW3bwUFhSyKN0yetDRyQ8eqWtVrNbhqgVo69r5o9TBx6OslKHvSCIlfjUwbWdOiBfZcXlJk8IZG6nO179RYXjDnoBZczUQxT52Uxidt60tjwJFsHP+z+VUMpOG4xC+oTTEBuvTYOsuv/ji2ATF/FRmwNpRVIJwDhFeCwuQ/i9d497daJpn37uewzIGsh2CszLQ7en809IiLUa2fNGof8tZB5KSFk5ncbeRNelIoptpkHUkrd7WHdEtqNj6sZf+Rc58rEtPhFlt+cfFCdgFbzhr1iPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa6416e2-330d-4112-5db3-8dea3f541020@suse.com>
Date: Tue, 19 Sep 2023 08:47:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: xl dmesg buffer too small for Xen 4.18?
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
References: <b20bdc7e-4c07-4bde-b206-4142310211d4.ref@netscape.net>
 <b20bdc7e-4c07-4bde-b206-4142310211d4@netscape.net>
 <9baf6bec-49c6-474b-a5e3-5f0473aaffc7@netscape.net>
 <640f5a9d-913e-494b-b2c6-c9b3694f7cd3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <640f5a9d-913e-494b-b2c6-c9b3694f7cd3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 0daaedb9-75ca-4bd4-4ad5-08dbb8dc4bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x6kbimtk3MEZ1olUhWfKqxIG9gy1f5rvQqPEds7XAYuWecUpiB8L+dsjHeg3a/prugNOzdIiIcW3kM8mp6XuXFHqY3q4YtaSfhDFKlsgm23TxDGZS0AOf1Mw1NTjBvUdv2QrKkbgj/yPdyZ72bCDKZ5FzzMUv3jrUeNVue1HuUeJDKK8M0WEY4VOnBoRJt5etGM/TtXW9jv6HGto/Gadj/cP24oZ6jKojhNWnK6av39W/CTELz9233cUkBXf8hQG4yUnA9s+zGuo/+HOQ07oglZxgLzmufdW7Bt73W4kKlyz+XUoBHX3vpp9sao717feJI6dtaiox9ODhBmE+GVspAXWPtMoTOi1o8ap1iFZIg05ZVzUFDcnM6rnsuEx7Wder1acz2aKCGZ2XpHdO0IF7h/8XIxDUCQty1naYC/AEysgSZXKxc+PsC+9Lar9lYS6SznDGI9HjqJ/AHDrx8L88KKaYYV31BIoRRK6zheeMZ0xegyMp/owCFI51ozNAnKdfIyvUe2g31mHJd7Lyzick4iSnRHBUia/T6jnqnSpwq+7v4xXL9Ku1HbKhIWqqq2HbaZFn20UL65YHgJRUatlGFUCTDhKQzgIINv/coXxVgGAbSvoQ5E08x4c0XEx9b1um20ksRTwzrBK1ZtOySxrxVqwwxIGyDlXuTguNNpa0F+XY0plJjbrsHlGy7YFflHn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(39860400002)(366004)(186009)(451199024)(1800799009)(316002)(41300700001)(54906003)(66476007)(66556008)(66946007)(6916009)(8676002)(8936002)(4326008)(6486002)(53546011)(6506007)(966005)(6512007)(478600001)(83380400001)(2616005)(26005)(31696002)(86362001)(2906002)(38100700002)(5660300002)(36756003)(31686004)(160913001)(15963001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUgzUUxUTjk0VmJNVWVteTE3d05LKzRUYnE4TTVXajN3bEdvM1Y5Q2lVVDls?=
 =?utf-8?B?TDNXdHpEL2Z3d0JtZFlCWTJCbzVtbmdieTBFQzNyb3hqS25Vczd5NTRVc1U2?=
 =?utf-8?B?MFZnYkE3Rk1UR21Telpjb3hycDY3azlrNEJidUMzK3VUYmg2QVFadlBWZjV3?=
 =?utf-8?B?MGcwTjVqVkJCWk80c0x2N2dJU0JoV1ZrVENSNWVOeTFMYmtGdEdMbnVXVDRu?=
 =?utf-8?B?MWFWSmVPd0FwMDJybUluT0R1QXY2c2xHdXF5aGRRRkJ1d0ZUMm16SUROK3pK?=
 =?utf-8?B?eGNTQkZhelVFc1ROTXdDMFJ3SytqV01yQmFJVW5pWGkzYzZMZUwyK093djl6?=
 =?utf-8?B?ejMvUjB4RlUxMFBFcDZXQTJZeUF1RjVsdGNkbGpsMnY0Q25aZUNycGVXREhm?=
 =?utf-8?B?MXUraktYUDkvWC8wWVFPWmxmV2N0ME5PRlREdkhwSVZQbUJJMHlDaytsZGtV?=
 =?utf-8?B?TzZVZC9VSkpZeFBrNVF6NXdPMnhiSk1Xb0FlNmNpRUhiem43NCtIZEVuZlNJ?=
 =?utf-8?B?Vk5zOUdOTExKSldXdzFCK25MYTFoenVaZU05bldqRTJxejVWZFY5RVZxRkoz?=
 =?utf-8?B?VEtEN3RnRnB5YVE2azdMTXRHZHNVN2dJVmhIYjBhTDduTEEyczFCRmludFZM?=
 =?utf-8?B?Yy9DSWhVYXpLYWRzNmtKZm12SkZTaFlQU3RCWXB3WDFmbExXUjFpcDEvcVE5?=
 =?utf-8?B?TU5wK1dBTUVHVDNXZHNLLzBuOFpFUDlKOVVwWDZiSEFOcmFwL1RNQTJWTXJW?=
 =?utf-8?B?Mm5LTmtxQ1hjWmRGYVRkY05nOFNuUGJ0V3hSOHVMUXAzVGpYb1BCdEVyUHJ2?=
 =?utf-8?B?czVrS3lnSG9MWndUdlUrU1ZuTTI4LzFucUIzbm1SeHZFVmNISnluZlBpT1lP?=
 =?utf-8?B?Sjd0V0Q0dEZ5ak1ZQSt0OFhaSE9GTEdaVW9GU2ZIRVR3akdvc29hODVWaWtk?=
 =?utf-8?B?eXhHYWIrWXBrVUhVTXpQSWFET2s4cU5jdzdab1pScFFRR0JLVnViSGZ0aW5V?=
 =?utf-8?B?aVovM2VsV3Bhejh3d1dyU3g5VHRjOXhZa3czVDR4eUlJdlhIK04raDZCN0Zk?=
 =?utf-8?B?NXhPNEIrUytMZkgrcS96VXU4YXVnbGZBSFprWkZDYlhoTUtIYWNXT3lKaGhK?=
 =?utf-8?B?bE5obmtaMkp0dXFDdndkNzQxa0loMFE3MXBQaWk5TmxUcXJKVE5CWUc5RjZT?=
 =?utf-8?B?SFNrUnAzRURkYnVYQjlLNzFEVFJHdjJueExIenhUU0ZEL2hCN2hZNENVRkx2?=
 =?utf-8?B?bHlVSyt3ZmNWY25SUE5wMWNmMFpoaW8xRlJ6WVlkSEhsV3pBL1c3QzQvMnpw?=
 =?utf-8?B?N0Y3SkRHNWNMSkVVUU1iMWVzaXE4V0xveXMvaytCYm9zOTVHODhqL29JMXU4?=
 =?utf-8?B?cEp1VCt1cElMcG9CQzZYVnR6WnVLN0lFZDgzQ1FaNTZsUDZHWms2eXlDRlBU?=
 =?utf-8?B?SXZobkdDRk1hUWl6L01aaERJY3hyRkhwNW5BbUhVMDdubmlnMjV4RUJSUkNp?=
 =?utf-8?B?bzhaalVKMTJOVG13RnZsSGlRVGZYNlY4aG93akhjRSs1a2hKTkZBWDVWQjhM?=
 =?utf-8?B?MlV5ZndnZmNWTU1RNEtzWGxXWVo3cHh1NHpyd0NuaFA2anM1VGp1MFZ6b0Iz?=
 =?utf-8?B?NmZKNmZMemxmNjhsVVc1ZGo5K3RqTjArYkFyRnd3bEplMnJjbjA4RTRtNXVq?=
 =?utf-8?B?QVNjSGp5Uzg0S0xhdnVEc0Fzb21NREE4TExFa3grQnJnazJEcUJsbHI1MDNZ?=
 =?utf-8?B?Tk9nNTRXSUEwMFdTdFNJTzk1cVFnQXZQSEh2V0ErdGNnbGZkR1BZYTNFVThV?=
 =?utf-8?B?cWlqUFplV1lRNzZER2M3NUZseU5vMW14S3grK3ZtbGJUbVlXQkdWakh6dUR0?=
 =?utf-8?B?Z2JGbjRWS1BRdzZxcWw4Q2VDRzB5aldOUHpTYlVxKzVQd2Y2bVpGbUY4TzUx?=
 =?utf-8?B?NXkza3FkQlNHYWZOdnFXRU83d3ZHNzNFV1hpdEV4cThYRlk4TGFSWm9XVlo4?=
 =?utf-8?B?MkI2YTFYcnNZYjRqSDVyRjQxTkNZYUhnSU84MlVKczlKQ1ZZaXI0R3JHWUgv?=
 =?utf-8?B?QmNHS1BtaUc2dlE5Qmk3SHRuOGtrbW9mdVpiM3Y4MVdXZmVMczJPOVpMOGYv?=
 =?utf-8?Q?oy7RQ49uXZphTisQSpF3yyjGI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0daaedb9-75ca-4bd4-4ad5-08dbb8dc4bb2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 06:47:30.7640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjWKbkQbaYRDISKVEioiuuu6287D+3Kvij4RAIsLJdIQCjgwXw/EQwjGXat6IA40YYwaOQFip/kZUC/wTlpfKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8825

On 18.09.2023 20:49, Julien Grall wrote:
> On 18/09/2023 19:17, Chuck Zmudzinski wrote:
>> On 9/18/2023 9:00 AM, Chuck Zmudzinski wrote:
>>> I tested Xen 4.18~rc0 on Alma Linux 9 and my first tests indicate it works fine for starting the guests I manage but I notice that immediately after boot and with only dom0 running on the system, I get:
>>>
>>> [user@Malmalinux ~]$ sudo xl dmesg
>>> 00bee72000-00000bee72fff type=7 attr=000000000000000f
>>> (XEN)  00000bee73000-00000bef49fff type=4 attr=000000000000000f
>>> (XEN)  00000bef4a000-00000bef4bfff type=7 attr=000000000000000f
>>> (XEN)  00000bef4c000-00000befbafff type=4 attr=000000000000000f
>>> (XEN)  00000befbb000-00000befbbfff type=7 attr=000000000000000f
>>> ...
>>>
>>> I have noticed the buffer fills up quickly on earlier Xen versions, but never have I seen it fill up during boot and with only dom0 running.
>>>
>>> Can increasing the buffer fix this? How would one do that?
>>>
>>> Thanks
>>>
>>
>> I see the setting is the command line option conring_size:
>>
>> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#conring_size
>>
>> The default is 16k, I tried 48k and that was big enough to capture all the messages at boot for 4.18 rc0. This is probably not an issue if the release candidate is being more verbose than the actual release will be. But if the release is still this verbose, maybe the default of 16k should be increased.

Just to mention it: Log-level defaults are different for debug and release builds,
which means release builds are typically less verbose.

Jan

