Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFF363EF7F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450571.707908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hmJ-0005gk-3t; Thu, 01 Dec 2022 11:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450571.707908; Thu, 01 Dec 2022 11:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hmJ-0005cf-12; Thu, 01 Dec 2022 11:30:55 +0000
Received: by outflank-mailman (input) for mailman id 450571;
 Thu, 01 Dec 2022 11:30:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lVjU=37=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0hmH-0005cV-Dn
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:30:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c88a754-716b-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 12:30:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6959.eurprd04.prod.outlook.com (2603:10a6:803:139::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Thu, 1 Dec
 2022 11:30:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 11:30:50 +0000
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
X-Inumbo-ID: 9c88a754-716b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uh1tvMiCNVVKVTG9cfqTlLu+2NK7tVgJtAF1IY9Gmxj0CtD0pog3nGglTU+7cRHpFRsI+drGKBCMqLMJ9lnsJwc0L4HbHwnAL8hTi7CkTOvqKyiHDXP8KHxjfNTc/RAfLQ4/rT81G6MsUKdti8SypgAtn1pvi5kA+cGTwhuSUB2PbpyDJG0kxQ6BRaO3npkcpdsjnwRr9FGpc029zvRKL6i/0+zvb5QwPe+0zx7IpWHPNJB/YfZrnVzmjbVeff5VImbh3CcHgrRuD8w2qs2RFLipwLakQAoGDbOFNHZCXbA7ZgS6XbXhzszUWWpCqqTxwp7MrDj3Spm47mYEneNiIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwb3uX4sUeJ5o8ahgE0HGFG8O33cOjJdcpKtqkABOTE=;
 b=VKAAs0GmnE9qwl5W9EYVniV5l9fbz1eurNGeUNG4IXadBTcx7RJ6CAjreZHkpckEqYpUzIYq08D/M9NcWs384zcnrYcB5ejNIC/Asfo5PeMhJipKIhTHCUEpxZxITd7VkHUuSo/hZe9fwXUyRIa4LMWa88PvX7vPAAXxQtaBSI+bMKQ80p+hRP7zjAWIHjdFTf+jRuIZ6vCvMYK8+gtsssuNO7O7atyMbsTTcXL9XVXRRNGq3k/4ARkayIecTWhtW0k2OeVVGmyviG5QdIwRnbD78j85EYz3wP8XYwl1VHB5hYordxTgrfrhHo/6PU9IcCw0MQARYhcHKwmLTBVqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwb3uX4sUeJ5o8ahgE0HGFG8O33cOjJdcpKtqkABOTE=;
 b=nClZFLP0whuZraZzFQqzFDN7uKTIBWjrPfxl2911foAje0DvU64Y8jXNeLyW7TwmgqFR2cSLgbZeEW298UiNN3E2kk+08kEzGNo+9K43Xt7C+Qcp5dS3ywG7hqo3DzJSQAfrjKn4AxPzT5eAKM91f/KfHNojcQUQt+16A3MyKL3x73fP/XED7DGwq9BYZbjwRnD8JlWsyiGwSOCvGzZ9zZjalWhGRFCLhJb5AjWbj0Hj9+VSULkEB6snq+9HsSc7yPGU/5ivZI+0djvbIPkM3jQQy+YD4Dx6gOvX8f9/OsmzFqV4uM3+nMBhsKRdJNhJpESH+Gp1WlL+xNNtY55eIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3eb81135-0cd5-1788-3569-0db7d68541b8@suse.com>
Date: Thu, 1 Dec 2022 12:30:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 5/5] CODING_STYLE: add .clang-format
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Edwin Torok <edvin.torok@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <bf4013cdb5f3e66693551b5e45b3f975b5a48795.1669829264.git.edvin.torok@citrix.com>
 <7e6b8e69-70d2-8178-205d-8c20b993162d@xen.org>
 <7DF6F06F-A65A-4F1F-8FDA-BF0E8977F99B@citrix.com>
 <c3af2730-d503-e139-644a-480a506c94d1@xen.org>
 <99df302d-8bc5-55a7-a97e-dcc8eee41d2c@suse.com>
 <3e6e6948-7852-751e-a025-9fe36e9cfb82@xen.org>
 <82bdfded-6271-d262-136d-57b4b1a92a9b@suse.com>
 <6a5af398-270b-f57c-091c-78ebea8630ec@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6a5af398-270b-f57c-091c-78ebea8630ec@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 543d8b37-3a38-48fc-5a3b-08dad38f7fcf
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rg3sdxq19K5WxZVRPnU8qld/PvRZnpofVphRkKFN9C/JdVqnSob5Cbfiw2qkQVBz/4r56Sp1m2bKt2l5lyW+xtycQP8DKU+Ih7uWyvk/FKu6NH1KkS9PSxqfYm0i2CAkVJDhjbQUr+TMIPN3Fv7PtqSYZEGSivwnGQkksFNIks3Y/NInfc8327zCDgKM4Kqwgk9FnHypAn1arEN8r+PTNsiQqUmKa6S0p+D5SIn/NCatC2V/Fcwv/GCjAAga/+syp+lU+w1117QtmtHKFxDVgHUaeAGjP+OyMM8Cnwxigxl+WwGCY5M+AuwFGous91YN9o+6CW34uPKRgBStbrGZ5HEwuOoLy+SUBSFp7tjvh94RTb0mxEWI33FyLPLy7azVmRYiSd5L+NJ0PVu0MTIrhoZWvqZwQpBwXjyoVxiBsXo63yM+SB8xnQxv1knmI3S2EDuvojyW8iW/yecWU7/2a1MJlMvGt5EixQuepfrnJxMndPhjqN2/6Q3J2dp5tLMh7D3AwOyAr1oDV8ZiMYqvAqs0KAu1Ai80V+1bGYBLrkyjuJS8iHZ66gQgs6Q3PPfmwNs+3bygoLaa+janBvAL7ltjNQjAYWDna5JF0LFVoCiX8OZaz4MGeca3fXV8bbqJ/otf3w+97OYzOgNHohv0KxZRWnt2+EiSU/+papoZ3ZaIItGQ1EUVDagWLMzLJxfN85jMuQhMTx0ijFopry2iA8JnqzuPO/NNiBRCPeFRk43RNDPTG8Sb+1Xa9HnH3AJw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199015)(316002)(66556008)(8676002)(26005)(2616005)(38100700002)(8936002)(66476007)(6512007)(186003)(5660300002)(4326008)(54906003)(36756003)(41300700001)(7416002)(2906002)(6916009)(31696002)(86362001)(478600001)(83380400001)(66946007)(6486002)(31686004)(6506007)(53546011)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjNHLzZtZEdjK3p4aTB0eXFQY1YrYXJIa3B3S0xtMVlIZTZSWUEza1dGaU9X?=
 =?utf-8?B?SlZTVHpNTGtwNVVJaDl1bGZjMVpmbEp5UXRoUHdGNHcxclRreUJxdGJKZnYw?=
 =?utf-8?B?SGR0SFp5eXowNDZYcEVndHR2YVFXeHI1NnpZNzgrSmZLelM5VEdKWmYwakZF?=
 =?utf-8?B?WXI1ZTArdkttN3BXVm11Rm90OXk0NkdGMHIxbThNcWFxc3BWVXhUR0Fpa2FL?=
 =?utf-8?B?NFlHb21MYmVEcmttOTdBZi80ei9veng2alJSVVZrNkpFcG1zTGZJR21PMnFE?=
 =?utf-8?B?Vmk5SkN5L0tnS0dER0V4QThpM1FOOHR6TWlTWEdyNCtRNWpSYmNZQkJ3VURV?=
 =?utf-8?B?OVpGVXhVVm5NcXpSeE9CN1dUOHZNMnhFV1Y0R3FaZUlXWDZYbWhDUElHaG9o?=
 =?utf-8?B?MHBRQi9wQXR6UmNRVjFWZGZhbFNyVERrdk9YemxxSkxMY2FiSktlWEpxNU9a?=
 =?utf-8?B?TU1qVDBDL1BqNXRUSTB6UDk1S1hlMG1jSlBmUVkyMDR0Z0hEOS9ROWpTRlVQ?=
 =?utf-8?B?VXpPTWVhVWNnSDRULzRPR0VpUWphMnQ4clRVbVRaWEQ0MnR3ckxlOFp4SmpN?=
 =?utf-8?B?UGpsWWNWaUN2ZWVyeVJJWk9nNmg5U0RLRTRGV1RhQlhId3A4OW5BWUNvMnJ5?=
 =?utf-8?B?cUxHZFpSUUJxdHVYTzZHNWtUcmg0RGZPQkZkL1ZtMDhCTnBNY0pyR2VnMm1F?=
 =?utf-8?B?anNGSjdPYmpCWGlPL0Q5c1BqTS82djFsemZPQ0dBU1h2K0s0YUZRV2E4ZStC?=
 =?utf-8?B?dHgyWXd0UW92TnRDM3NhZm1ITEVGdk10RUd1VG40bUNXU2o0V0Vxc0NVamkr?=
 =?utf-8?B?WEpGVUs3b0F5eVlhK21mWUJ6TnBlN1o1UFYrN0xXd2dYYUlEbHljUk1lMmxJ?=
 =?utf-8?B?bmxRUDRXT1VHYW9CZU5lTzNFa0QzaldjbFBNTzd3MUo1aDUrelV6SHVqQitH?=
 =?utf-8?B?VWlhY1NERGNhcE1rWE9BSFh0ZnlPZ3FtWEh2Vlh0cXZ2OFJyM2ptbGcra3Z0?=
 =?utf-8?B?dzVoUVFOdUhieGJZUDNVWVYzM0JmS2QrQllHTVA1bHBBdWVRK2xhYUNIN3F2?=
 =?utf-8?B?RHB2OTJDUEY3NVoxZ0owL0ZsVk5mY3ZtTk1iRkx6Y2lVS2ZOQytLb2dqVE9Z?=
 =?utf-8?B?K0JLWEZPMU1ybE1CbXVpRXJ5cG16VHMwelk4SU5vRStsc1lvZFI2b0FDWVM5?=
 =?utf-8?B?c01kZCtUUmhOd1JyOFhFTHU4OTRxU1FuaWVmNWJDc25VM3NBMFQzRHhRN2Zu?=
 =?utf-8?B?TFNSMGRTTzRiREwwQmlrdkhMMmZhUk1VMk0wL2loRTZXTmxGbjJ2NmFlRlAr?=
 =?utf-8?B?c3dBdHNLM2d5YUhYSTFwTnUzVHYzbDlOTUQwN045OWpSWGRnK01UUzFIRlRE?=
 =?utf-8?B?cDlhTWM5TlN6RTFIMEZIRDJrZm5Dc3J5UzNEQXdmVkUySEd3QTFDbzVpNERT?=
 =?utf-8?B?L0pMSGNOQ2d6QzMyK0hRUGxRdUwzNnUvbmcrK0lRL3lpNXROQW5ZelBHY0do?=
 =?utf-8?B?eEdJSVlTalVqRDlyaloxclhpN0dRTWtyaXRyS04yZWJvSVM2UGF6TG1CVEFn?=
 =?utf-8?B?bFZJTHdudVZCamo0QUo3MDNVZjBNdjNFVEczdDB2T3BOQTdmVkxWa1FoSm1P?=
 =?utf-8?B?Nk5YbE1QWm5VS3dQMGl4c2FpdFdJeEhhcE0vczFKbEs5bW5iMzJnUlcyRnJu?=
 =?utf-8?B?cERjNml0bGNJdUFRMHJuRGxqWGliSzdGRWhMTVg2RXJsUzNaYVFhSi9qbFd0?=
 =?utf-8?B?UDJiaE9ldmlJTEhIOU9mNytLVDBMdEYxdVFydG9QdEhScnVMaXhnZDY3WExL?=
 =?utf-8?B?UlIybnFTRWxhQm5mQkpJSDU1RFo5a2lwUWFMR1FKREtyVjB0d0tuc0lpdC9m?=
 =?utf-8?B?N3RxTTZ6MDZmZkJINU94c0VINlVaWU4xUEFFRkFNQ0tZWkl3c0J6d2NsMjBH?=
 =?utf-8?B?ZUlLbGNrR1QwamJtOU50cUpyMXVMZTNDcllyUkhhSE9wVHZGZktzNmVTb011?=
 =?utf-8?B?REkrQUpvKzl5R01tTDAzNlJSUGU4SE9xdGIyKy9mZ2x0QlRUQWxsOGZOMUp2?=
 =?utf-8?B?dzNQdFRRVXIwa3loalQrRk8zWlRIKy9Ka280UDVKaS80VVNHV0ltVS91SXlu?=
 =?utf-8?Q?E+URIy/OMx6FLAB+iIMFmnDmm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543d8b37-3a38-48fc-5a3b-08dad38f7fcf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 11:30:50.5519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9ZOjoyAufhIUbgg+9xx4iRzGs37pc3fJCtcwHbDm5ipVbexT1x7+GWSDKF9iXnrTpIoww8qQ6w5VOStf8CagQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6959

On 01.12.2022 11:47, Julien Grall wrote:
> 
> 
> On 01/12/2022 10:44, Juergen Gross wrote:
>> On 01.12.22 11:12, Julien Grall wrote:
>>>> We might want to add a comment to xs_wire.h like the one in ring.h in 
>>>> order to
>>>> document the requirement of the type definition of uint32_t.
>>>
>>> The problem with this approach is you made more difficult for any 
>>> userspace application to use the headers. So I would argue that the 
>>> Linux copy can remove "stdint.h" if needed.
>>
>> Today there is exactly one public header including stdint.h, and I'd argue
>> that this was a mistake.

I think so, too.

>> xs_wire.h is especially rather uninteresting for any user space application
>> but a Xenstore implementation. All consumers of xs_wire.h are probably
>> either in the Xen tree, or operating system kernels. User space 
>> applications
>> should use libxenstore for accessing the Xenstore, so I don't see an
>> advantage in breaking the usual philosophy of the Xen public headers NOT
>> including external headers like stdint.h.
> 
> I think Edwin example is a pretty good justification for including 
> stdint.h.

I disagree. The intention has always been for consumers to provide the
basic C99 types by whatever suitable means they have. Note that in Xen
we also have no stdint.h.

> If you have a coding style requiring to order header alphabetically, 
> then the developer may not even be able to include stdint.h without any 
> hackery (e.g. introducing a header that will always be before the Xen 
> public headers).

Just to indicate that commonly style requirements may be weaker than
"fully alphabetic" - we don't request full ordering. What we request is
that groups (xen/, asm/, public/) be ordered within any group, but we
do not (afaia) demand ordering across groups (and indeed commonly we
have asm/ after xen/).

Jan

