Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070145AF70D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400219.641904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgIF-0004vD-FJ; Tue, 06 Sep 2022 21:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400219.641904; Tue, 06 Sep 2022 21:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgIE-0004jp-MN; Tue, 06 Sep 2022 21:39:38 +0000
Received: by outflank-mailman (input) for mailman id 400219;
 Tue, 06 Sep 2022 21:39:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVgGl-0000Cs-0K
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:38:07 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00087.outbound.protection.outlook.com [40.107.0.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 930a3132-2dc5-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 11:23:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4893.eurprd04.prod.outlook.com (2603:10a6:803:5c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Tue, 6 Sep
 2022 09:23:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 09:23:34 +0000
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
X-Inumbo-ID: 930a3132-2dc5-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFWbR77luFoFB1moDkvx7RG2MTpRoXKQOpfXG5kdNppOF6fOw/nQGeKQub0L5fJ1ick1JsyfwR7uNJpDr4mnxNTkyz9vp32bxOHTwyGLCdI3kbP3IsOoJNodKvjTwytsCJXaZV4Hz6FCX4fJfrdDRFZ9I/dFW2GqQJ2x/Fr9dkWOByqcVM9SurrLsMYtfZVhESggGw2WiTlkZhzpKl8DxrjkJ3vQcBJzNaXLoyzBOLYtk2sGgrDonYLugPr7xGa6KEmJrOYSXRIQh0IUDMmMmxD5lqUJTZvkknCUy+YF/daqCCrrmtjD+dAEmIqDNkDXg+dyuLpaU+L/fIZiJh60KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57/bYk9q+8WaTm2K+86JZhQVBKn50AlbT9LrSB7MjhA=;
 b=ahdW7lEI/MivnvHD2rEZPi7nKQEVm3SgudmSocf+JkHuDusF+GYUuV+q3zpOeG4IFPln1ZuruSZNQekMWHWJ+BKazWCFibVtfFjRQupxoEH2iztmxhl/tbueRCSEKHJINKhgqWBvDHE2qG0VEQnXCdyA+mFkFX/KOqcT2WTfTOMB0HIlHKQ4NVFYUxlkocqz2MbYO519NIqJ15hfRvqTkgt6AQu7p2ByvZgiUVsXkjcB/0Eo9OoEVlniFqWIGiPyMgSMlXGEyTBy6Y24ZrTTuWdUwHWybbuZV9d1N/zfddbaCP1bsddf7bfQZR7ebvFI2ROzQ94CyFMpOT8ndBrzBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57/bYk9q+8WaTm2K+86JZhQVBKn50AlbT9LrSB7MjhA=;
 b=W3URmduITWsAaApIdxtaJ1Mfq42hhtLbfGOEYGafZCORxC4+HiKZOCkAif1wHkFGMF1Hp2ovBUngT7T3bnn8uCyJ5VO+nGYdRnSc4WBu9IOqg17JxPDpFmxpa5CCFYS+ZmtWW23ZH6z+FUkvwHxwYRpPa4vnjA62hkyQHsHlR/e5O6FlxUikHEGIQZSb5HTxWEgayJhwZpAYOK1JYU9HZxdH6UA6ZnIVFiXbFkZzu0HmXSKMyIO+gYOTSCOftVHPO4q3EButoc0HHsywW4inEx7okoxJik78G9fYWf9le25yePzGZhPUtxbkwSGzSkF84iWeHR9kpTlN8uTkr7lCZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed4ab251-2961-e2f8-3e65-edc1cc7bbfaa@suse.com>
Date: Tue, 6 Sep 2022 11:23:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 10/10] drivers/char: use smp barriers in xhci driver
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
 <992c6512e54435a006c6de28515d1242518cb974.1662124370.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <992c6512e54435a006c6de28515d1242518cb974.1662124370.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29c0b282-a13d-4461-c99d-08da8fe9788d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4893:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uQWAngC7X5P+tkdi9cuBb7Jt0JnNfawY7s3AEcdSaJ8SyDoRDH3xu61jIzLTmmax4ihE1onjFqFb9NVSMQx5oK/d3NROtTyH+HPXE3tDnZJN8LT6bBn4VZoMMWP+dFo5fRN4D1nD+Qq3I7Nb/GU4Gckj7VObs9KtM6rzYtyDAHx7CVqcuXhqhGRvr8JdNXDrp/+fp/3eRwnpKEsE2fsXxc7KkJ8sqITaQvWzvvu4Y/jY8EEAD4Qlpinso3DMSiJn1V6XZMMbMlWbKfwxAiaFHdPy0dz5qCe7Nr864n+0xebhZEWkNw8NV68dXtLanl3ihmNjRRPiLRk9VjyYVHYXl4dV3xfvoOCRdjmaP4wVUnt6FBFcIs45arFC3WtElsDBoLHrlT9Gl2FhLCoZUo1jgJuIXjooA7aRdEyR5ma4TGHdR5VObwm9ZHIjehewvzrArhLn/M2A5vnQZ/x0N6NxQMfa7VeIwYrUDV4o3mLIsDQKwwdr7oYVu1/o863t2HD0ewANdE7e8yQT1MAV210D3mvtVjQbRpL2AQa884zOzyq9Fe+toICP3TEno1GZgcgDg6DBdJopeaXm8jKfPSrvise8azsimOOH3UAv17wAHYx3wxYW2+gz8xyE+lBZITn0dO/WSH25xJ0qz7kxQzAXkGQH2/FMaTZSmmqAwoA88uofWFD2OHWMRj/7BBj7Ns4WVjSrrHoZmcE6t2YoWYzThusPPNNz2ude6Fn1o8/x80FBmv7uVa0p2xUSC4yn5XruJYnFur/8J5Uhi0asxlAQgxP8QAcOuR0V9d/MTmXosZM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(136003)(39860400002)(366004)(478600001)(83380400001)(2616005)(186003)(4326008)(8676002)(66476007)(66556008)(66946007)(6512007)(31686004)(36756003)(6486002)(41300700001)(53546011)(6506007)(26005)(31696002)(86362001)(8936002)(6916009)(2906002)(54906003)(5660300002)(4744005)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU1McG1NVzh3c0UweExRVWNPd29Yc0dkelM2ZC9ucHZoUW51ekFCN1BCemE4?=
 =?utf-8?B?ZzVWT0pEbFd6SVRUNk9nM25aL0ZRcjI0UjdOaDdUUEYwWnNBaTlyZUlLckZJ?=
 =?utf-8?B?VnRlYitMWmlyOENKY3FpQjlHdkFwSWM0UGZZclRCbXJiY2k3ek93M1A2NzdY?=
 =?utf-8?B?azhldG5yTEdmTVdyUW9xd2F4Y0Y3TzJ5TzBYcUJ4ZmZIc0lad0QzbVZyei8x?=
 =?utf-8?B?d2Y2L21PZTlUYXhCSENQNk5HMFMwVXJDNHJtMUtUWXdpZXNhVFJ6T01HWVh3?=
 =?utf-8?B?N1dsdzlNT1d5R1lyblA2dC96Y05QRmlrdC83ajlETkFTWlA5TFdpaUc0cmIx?=
 =?utf-8?B?REJRVUNZYncxbk1zakE3VTRHUWE5YmZualJqd2FyQ0dvUkRDSG1WKy9OMkxE?=
 =?utf-8?B?bjRuVWpNbEpabGJZNGRCRjE1Z0hJUlZoRk44QnQ2b3E0RG10RjZjelZMMytJ?=
 =?utf-8?B?ODE4QWtRS1Z0cVoxeVBnL1VOOUw5V1VQakhTMDU2N1pBQzJhcDhRV0taRGli?=
 =?utf-8?B?NVdIeGNwVk5Qa044WFloeU54bEhmOTdvb2VUSzROMFdVY1g5dVN4VkhOZVRt?=
 =?utf-8?B?VS9DZ25GMWZXLzc1UGd4RTNZcVZycEZNM0JxUXREbllKK2Zqdm9aZDlHN0xm?=
 =?utf-8?B?SGtkbjY2WG05R2ZlTU9JLzJDK3YvYUQ1NWZGUUZRUmx6c0JUVHQxcTBaSlN0?=
 =?utf-8?B?YmxKNXFENHRYcVYrL2VKemgybk4yWXh5TVZVa0VkMERSaUVMUFpXUzhwQStJ?=
 =?utf-8?B?MFBxNXlNQjNYb0FrMUhIeDJZV3dFYkxHNXQxNWxyY2lzZVc2NDgrQmVSS2Zr?=
 =?utf-8?B?THB3bnJmKzJubG5aOXZkcWE4djhDb0dWbFk3NmdBTmJjZ2xHVWhZR1ZrVFVo?=
 =?utf-8?B?Nm9lVjdqdStoNDYyTUdZL3l1YldHbGRJMFlpUmEzZGlLbXV2Tzd5SWNPRDBL?=
 =?utf-8?B?aURRdmgyeWs0OUh4UU5mdkdiellLeCtGWTFIZUprSWFmSitBKzMvRmNrM0w0?=
 =?utf-8?B?NDlFTlpsNDlRU0lJTUJSMGFvanp0c1FFeXRKSkR2bVFZSlNRbmhWZWFEb3NK?=
 =?utf-8?B?OEI0cmxaN0xkUm11Vk40a3hqLzFlZE5VVkhiR2F2cjRrNi9KRVk3R3E4STNB?=
 =?utf-8?B?cTE1eDc3WEVhdEZXUkRWYXpqczJxZmxGeG9HM2xnZElPM0ZrdzJmTVlka2Uy?=
 =?utf-8?B?Nkk2VnRXcUtYVmFZeDRmbHZZOEN2cUhGK1k1L2tLTTkvRUdZd0VnSlhTMHFI?=
 =?utf-8?B?RW9rd2h2NXdRalRnUTMzZlVkc2RrV2UvMjJLYnZtanYwQlF6bXFkamw1bHMw?=
 =?utf-8?B?b1FkSmFwanVDb05HdVVVa2tlbmRJR1hENFJ3cXdmMG9DUU9HcnZnVHlKK2F3?=
 =?utf-8?B?T1ZNaHh0bkZZcFdzV25XN050NDk4TGx4RllGV1BWRW4wUHl5czdhZHlRVnhW?=
 =?utf-8?B?bm1ScHMxTDV3emQ0R1R3bktZSS9OTnpJcWoyTmphR28yN1BvS3loRWw1anFS?=
 =?utf-8?B?dG9aejJMZ21DMnIrY0k3THBQc2VHd2l0b1lsS3lxUXhCbXRjL3Juc2FRbFZo?=
 =?utf-8?B?akRXbEROZ1lUc3E3bVNSWkVzTU0yZ2FBbXhHUDdJMTd3RU5UMUpDZ3ZqR3h4?=
 =?utf-8?B?WkExaTFQUUoyMW0vYk1WWXRYakkyVVB4Wk5oSmNvRlBIdlUvZ0tqMlJmTHg3?=
 =?utf-8?B?Um1tSi9acUl2b25DRE91NithaGw0M2xOTFpYWGwwR1pyODBpQVlFRTBLRWJI?=
 =?utf-8?B?SlI0QTVSalFEZmZHd2ZwYlFvK2Y2Vll4NWJwNlYrMUlKV3R2STJaQ21IYkFI?=
 =?utf-8?B?U0dKYThKSjhMTGhoSlE0dUFCclk3eklOOUtXSjBiVUU5SHVpZ3lxakd0cnU5?=
 =?utf-8?B?Y3VGeEJnSEVTWHh1NDVLLzRWN3ZpSmtMUXN4TXhpZS9TakJlSXJoYkp2bWI5?=
 =?utf-8?B?aUxFbVFRTUhjM1pKemRyM2xBK29JYSs5ellpMTlZbmdzMTUvMWlvOGkra29r?=
 =?utf-8?B?KzBDdnJJcktJQnZwSllOdWJxVFVzTnRYU2dNUm03MkcxQk5WVVRvaHVtMWNv?=
 =?utf-8?B?QzFXd0hCVE1wV2V6Z1JvZlpDNDlienF1OG0zZi8zTU9EcVNTbmdiMnNhSnFE?=
 =?utf-8?Q?jUq2D6mGyaJF9MxF83bh7+vYe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c0b282-a13d-4461-c99d-08da8fe9788d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 09:23:34.0618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxhzbGuhzZk46zHVbxO+mXvwaAIUjLk3h/2lM66KaNMyGQ0WzGK1MfvHsGfbAUTecHV9Em9aiW9CkQ9o79iTKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4893

On 02.09.2022 15:17, Marek Marczykowski-Górecki wrote:
> All (interesting) data is in plain WB cached memory, and the few BAR
> register that are configured have a UC mapping, which orders properly
> WRT other writes on x86.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

As said in reply to Andrew's comment: What about non-x86? Drivers like
this one, even if presently depending on X86 in Kconfig, shouldn't be
making assumptions like this. Such is imo only appropriate when a
driver conceivably would only ever be useful on x86.

Jan

