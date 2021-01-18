Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898722F9EE3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 12:58:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69629.124801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1TBD-0006Fa-N9; Mon, 18 Jan 2021 11:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69629.124801; Mon, 18 Jan 2021 11:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1TBD-0006FA-Jh; Mon, 18 Jan 2021 11:58:43 +0000
Received: by outflank-mailman (input) for mailman id 69629;
 Mon, 18 Jan 2021 11:58:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMBa=GV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1TBC-0006F4-D2
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 11:58:42 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80c6f93a-9c9d-4163-b9c7-7d4a283dae9a;
 Mon, 18 Jan 2021 11:58:41 +0000 (UTC)
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
X-Inumbo-ID: 80c6f93a-9c9d-4163-b9c7-7d4a283dae9a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610971121;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SdM0rYp8YYLqpoBjSUZZbjTNORqqHSV4r82hUdgKpI0=;
  b=BENnt6AAw/lLolhq34cGZd9evMWpMFynWgHwtLerQJHgvi2PqNm+Y71l
   VsN8Rf/7uz57fP7EzDzNa5G0k/91AQRT6VkzmLC7iKATgmLmTnU/3uV0M
   XDpUvh5/yXgU4SfHmgPorEEaXhrFNzJYvl3H+ZWxD0EaRUQNOT1ezpEiM
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: g0srzw0NpNe9sTNfETbDpMVn2HjR0TKn8Sf0VgCGn4J8ka/hM9RU6zIbQxgv+bDg9kWCjbG/Rg
 ao+VaKyNTWnqdUcmEJS3OujKRqpr89PDnT5sWMFmclH0SmF8yI1E0Nhm18rGdc3kSjMTKj8hFh
 HPyWXmgcSP76qk36Cz1H7QdTgQMP/1SYracnsCC5pjwdYuOshe16r5kEmFO6BW73hqMS3Su0Bk
 OLBE/gRAhAXrL6vipkOga4Tvi6fXtlC5ZwofJK7JcxT4SYIMOl9LE0ThZog5yzLgQcMZiVSV93
 cAY=
X-SBRS: 5.2
X-MesageID: 35284827
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35284827"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lseb9d0iZpII43oM/LxkvP0w9oL3SYYrH9xB8aIhW/QmEbRQIwCMF9C1AuXVohBJgYgy1YVJ1p11sjoXzbaY34NJ64g6D4URhcy5ELg+1Qzo/uOPWEzKQYvbUqoKoCqp5sW1uFPgO3w5ZdAUVanAbkVGxLIXNrRoXHg3BD9bAYRB9yOZH32rUNSNBiXuAoVt5xVunRduAWu1YpAGlk2/G/AYjKgSQuczHapWDee6h+TKlqR1/yxPaxQmAMnqunGoZiyNzUpcHq6a64sk4hkTajXlpoHTcCTgDzgEsK8hn51orzxmlXJdaF/7iIBgEqRVBZo7bFTo/aJt28j/Dr6H3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdM0rYp8YYLqpoBjSUZZbjTNORqqHSV4r82hUdgKpI0=;
 b=ZXbx5Cd7XiBzV4hMwvytH+nU0/0HzYWkv0NNycgzkYJSqW6bpHiS8rb/C5PXvmZKjB0s9TBQrqu2lZ3cVT7GRSJZZc8rUwXd4gE26EbLiQ+0sXytYR+1jrhoiopH38nf17BbpBNr1KD3pRzQ6s+FiHcYpsuggxy+oIhfjoc8dawBb3KhmRMIyspqCk7nwUXZfpK4wciOYVz2Wg80PYWegugKf675EhTE3rtNTRZmivUnIZu8b79tUtWB2uXhlWavVCv9dIvxqOUFfSsqDXOZjbIqON/dRJFNI7Jnnqj5xAD3EjZwtEzb8b42hmM/bBkCwzCQ7M3A8QZFJQbZGbHzKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdM0rYp8YYLqpoBjSUZZbjTNORqqHSV4r82hUdgKpI0=;
 b=HxTJGgRJEK7+CTxB9VrwaLvjJW/s48NbhNnDqSXjusNf4QfCHWEKV/g7W1IwjEQ5UXgncdCBI7LNK0w/mYVWMp7JafChqgXbAHw7vd7BQqa6a0xel3KmjtgSeXzCIIld/jOKvzgGbUo9JXBQ6TLfScI2aQwVixwiNG1N3t7knNM=
Subject: Re: [PATCH] xen/decompress: make helper symbols static
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <28f15465-bfcd-606b-eb24-42bfb990ae3d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b073d60c-9eb1-a161-8419-a0dfa11b4c91@citrix.com>
Date: Mon, 18 Jan 2021 11:58:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <28f15465-bfcd-606b-eb24-42bfb990ae3d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0380.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::7) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a149ebd8-3a93-404f-a1f4-08d8bba863cd
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5662:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5662164DB49695BA0235AB49BAA40@SJ0PR03MB5662.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o3IljF8gCF4Mgwj8/QayucS2yjfTxaQJO+u06nNqQLJHifd1D25jMWnjKFUT3dWM5YETMmtnGSSTATzEQNCz5iiJ7GTp5McRdwlHXEeIFQMiK9u+fTlIfhq9z7l0DLcYUOxzPjGiRA9Hvgwbtfei5+3fnS7fjqWh7iZW9yiGLvgRo/kCE5e6AUtsBfs3FWOViYIPsrBuM5ejvssQfy3Wb0gMOwvG8vohJPoUfOhh7ORedYYXCnHGdPsOoBSJdWs5tR36xB/8Zmf7nCQ3OVna6E/0TfvAaIbwe9vMK7i52X3TWjMmoAEc1u9n7eKa4uui1D4Jqqg99WFRzTp+4uh+ySqnPNm7WWu+vqQrYm7wnMi+RdTnTNDYoeqxiMztlEH9boBf2+iRcJexNrDsFfs6CQMs29uoamc8jR3n30TiL+PP7OniCuwbsbm4zPg/Q1TEalQIx7FvuwZ0BMn93Ye7Rd72BNUjjrNg/w8VEHuLedc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(86362001)(54906003)(110136005)(53546011)(26005)(316002)(6486002)(16576012)(6666004)(8936002)(31686004)(8676002)(4744005)(956004)(4326008)(478600001)(186003)(5660300002)(31696002)(16526019)(66556008)(66946007)(36756003)(66476007)(2906002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VGdmbklxZDRLY3lYaFl3QlFSWit3OW5ORHB0dGdWOHZLMHp1ejk1U3RuN3dQ?=
 =?utf-8?B?K3JuV24wSnd0cEh0MmtzRFFKVlNRSDN5OThJSlBNZ09ONmQ1NDFSYVpmSWMw?=
 =?utf-8?B?dVNTWmxuM0dMTUpqdTRwaHk1RGZXWk02OXZPM3Q2QWZ6WVhVYWtDWUl6RjhZ?=
 =?utf-8?B?SUp1NzVYR2pjMHFlSDU3bFVnZVdRRWdpQVB6WGRKRkltN0xhejgrcEh6UWEw?=
 =?utf-8?B?ZnRJRTNWUmxOb1BrcnFRUTRXdGdyeUNNWC9qTWoyN0VuQmg4RU9JcDY0WVAr?=
 =?utf-8?B?aC9CSE5zV0tEQy9QWnp4dStBN3ZKRjBxSTJhY05CUmpsL3RaNFp5clk5Szcz?=
 =?utf-8?B?RW02ZGNFZzRGL2EyY2l2VE44Y0t5NXZMNmpjMEVOQllNQVBDWis4azRZUm5N?=
 =?utf-8?B?c0tKcUJJRHFCY0J6bElXZUhGcFBOa2QyRVdBd2dHd1lJd0plR2dFcTFhc3p0?=
 =?utf-8?B?OFlUUk9ybnJyMmVLRFpWSGd3Y0V1ekV1V3FMWk5TZFUrd3ZMLy9zVjQrbXAv?=
 =?utf-8?B?SS9ZRGx5UmVMQ2xqZlJyTlFDblZBTHNOd21tYTBaektIVm1paTAwNnZvQmVG?=
 =?utf-8?B?VWZtMk5UN2YwYThJRUJiUUpqd0VveWVyMFE2VlE1ZlN1NDgrZkdxZEdOQ0tR?=
 =?utf-8?B?YXZrVUU2OEFuUmtqdGdWSlpmdTJrUHlhcVpkdHBOeVZlR2xyUFc0UUN5U3RM?=
 =?utf-8?B?THVZRmJnMVZHZ2lnV0lxVC9LTDc5S0VpTTJiTGltUGZzOUVyZ29iNXhtL01m?=
 =?utf-8?B?RDFTQzNGTkhiOUswMnMvWlgyK0FJcC9aN2Q0MjkyU2RvUUp3YUtrQjZQclI3?=
 =?utf-8?B?VC9VVE40djVIdGZBL3R4bkhsbExuVmZZZTVkMFFQQzhsOW95RHc1aGpsSlcv?=
 =?utf-8?B?ZjZFY0dqTm8vUGp1bEFlcllIZmdZSjBxbHJMS2pGVWZsQUR2dmxTKy9wYVUz?=
 =?utf-8?B?eHY4ZUF6VkNGcGd2UEt5MDUrMDJ1NElVN1l6NXY2OEl0em9uSXpSYy83dVpE?=
 =?utf-8?B?amtyNGZIZ3dnOFBZVE04b1ZEb204bDRwVWdjTzN4K3E0ZXhDUjR5RGl1c1M0?=
 =?utf-8?B?eE5TczFEN05zeUlwbjRSSTAvRkhZZEMrb0hwR29mYkhsRGdtdys0emptcjZS?=
 =?utf-8?B?aW1zK2lwa1lQdFExc0xadllBbVdGNUMyZ1ExblM4THhweCtOUmFqamlYMHRC?=
 =?utf-8?B?ZVRXbTllZXVQYXpHRGRwNkNuVXp6ZHIvcVJSZ0RPV3A5ajBSZFNPV2hqd0I5?=
 =?utf-8?B?NVVwUXVhMWh0Rk41UktMTVJHOUI5WWZack1SVGt0dVdOWnZqbTB0S0VtRWNO?=
 =?utf-8?Q?Ojp7L2NmRghVMis/9pOZmaLoLrUnHKkiDO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a149ebd8-3a93-404f-a1f4-08d8bba863cd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 11:58:37.7614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/rRIpW8FYY2Iv0HG7YoGJ0lV1pOg1+JmJc3CIJBk2YPde6+mzvxO+rM3rFoz85nfT4CGcyFIZQS4SGZzyRjC4bYVFgujlFp43BcYCZ26qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5662
X-OriginatorOrg: citrix.com

On 18/01/2021 11:19, Jan Beulich wrote:
> The individual decompression CUs need to only surface their top level
> functions to other code. Arrange for everything else to be static, to
> make sure no undue uses of that code exist or will appear without
> explicitly noticing. (In some cases this also results in code size
> reduction, but since this is all init-only code this probably doesn't
> matter very much.)
>
> In the LZO case also take the opportunity and convert u8 where lines
> get touched anyway.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The downside is that the top level functions will now be non-static
> in stubdom builds of libxenguest, but I think that's acceptable.

Yeah - not something to lose sleep over.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, but I really would
like to see the STATIC and INIT defines disappear eventually.

