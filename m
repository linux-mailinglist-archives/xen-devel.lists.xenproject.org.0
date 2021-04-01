Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987F43515C4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:56:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104589.200225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyjj-00081Z-43; Thu, 01 Apr 2021 14:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104589.200225; Thu, 01 Apr 2021 14:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyjj-00081A-0g; Thu, 01 Apr 2021 14:55:55 +0000
Received: by outflank-mailman (input) for mailman id 104589;
 Thu, 01 Apr 2021 14:55:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRyjh-00080h-Q8
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:55:53 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c087b886-7b28-4698-af1b-be56ee064a42;
 Thu, 01 Apr 2021 14:55:49 +0000 (UTC)
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
X-Inumbo-ID: c087b886-7b28-4698-af1b-be56ee064a42
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617288949;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GNiFq6gfJoTHlrSodqaQhCyBrF/F4z/pUy32GVXeWdU=;
  b=HZUMuhdMs9AugCRHYGjriwDjAE7v5c0pM+Wum7tlm1OSwT5/ktjgJUZE
   PmjMKnqC3blDgdyrl/t5LphGrExwPm0tvPAo+lJc4U23vqtxUy4PuZyjO
   Xev2wondilASp0Y22xCRcs/vB0XLTzGFn1mP/duaVxHDQctcDn8qT2CKE
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JXuiZUcm8xyHmhfQEOQxQF1GX2B7x/aVj84rkPowYORxD1l7PeAPKZcGqKHgAwaDjDyLRVSL3A
 nJ1T9oHfht/fAmzV1ghqSAUQR/+ocCePkyzCYbMRbZoszsjK88u8uK9f3qEV04YC9Jfv/7yQhV
 NmFQuxHicOijo99ClOApve1FD60AMPlHwynF+xNkHfZmo6Z59YCVoRuJo1xUyGXlxvmoQsxwLH
 RgTAaVGjJOSD4LMkoPsx0YCANfBxAvjAFqkG/2manbitkukbL08SCfZDaRQHrnJCFVYwSxkcFd
 0oA=
X-SBRS: 5.2
X-MesageID: 40709139
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:U6ZuO6C0sqyK7LTlHegBtMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmJEIyycFVB7QxQDIJI/Go
 aV6MYvnUveRV08aMOnCn4ZG9XZr9rQm578JTIADRgr6A6B5AnYlILSOR6ewxsYTndz0a4vmF
 K17jDRy4eCl7WAyhHa33LO9Jg+orXc4/ZKGcDksLlsFhzCkQCtDb4RPIGqnDdwm+237UZvrd
 +kmWZbA+1Wy1f8Ol64ugHs3Q6I6kdc11bHxUWDiXXu5ezVLQhKcvZpvo5SfhvH50dIhrgVu8
 gqrgHpwqZ/Nh/OkD/w4NLFTXhR5y6JiEEvjPIJiDhnWZYeAYUh3bA3xl9fE5sLAUvBmeYaOd
 RpZfushsp+TUmXdDTwsGVp3bWXLw8ONybDaE0DtsuJ6iNRjXB0wmAJrfZv70soxdYTTYJJ6P
 /DNbktvLZSTtUOZaY4P+sZR9CrY1a9Di7kASa3GxDKBasHM3XCp9re56g03vijfNgtwIEpkJ
 rMfVtEvQcJCgzTIPzL+KcO3gHGQW27Uzio4NpZ/YJFtrr1Q6euGTGfSXg1+vHQ4Mk3M4n+Yb
 KeKZhWC/jsIS/FAoBSxTDzXJFUND03TNAVgNAmQFiDy/i7arHCh6j+SrL+NbDtGTErVifUGX
 0YRgX+I81G8wSFQXn9rB/NW278W0D28J5qeZKqutQ7+cwoDMlhowIVgVO26oWgMjtZqJE7e0
 N4PffGn8qA1C2L1FeNy18sFgtWD05T7rmleWhNvxU2P0T9dqtGn92efGtVzUaWPxMXdbKQLC
 dv43BMvY6nJZ2Zwi4vT/i9NHiBsncVrHWWC7ARh7OE/sWgXp8jFJ4pVOhQGGzwZl1IsDcvjF
 0GRB4PR0fZGD+ro76iloYoCObWcMQ5phyqL85SoXf2rl6duskre3seU1eVIIyqqDdrYwARqk
 x68qcZjrbFsy2oM3EDjOMxN0AJVH6aG4tcDAOOZJxdn5fifA0YdxbNuRWqzzUIPkb6/UQbgW
 LsaQmZY+vCDFZmtndE6ary619vemKBf0V/V2BiveRGZBb7k0c29dXOSru40mOXZFdH+O0bPT
 3fSRY5Iw9lxbmMpVSosQfHMU9j6oQlP+TbArhmTqra3Wm1LpaU0YscGeVPwZpjPNfyk+MCXO
 6FYTWJJDfgB+5B4X3Nml8VfA1P7FU0m/Lh3xPoqFWi1HkkGPzIPRBIQaoYL9z01Rmse9+4lL
 FCyfQ7suu7Pj+vNpqoyaTLYyVCLR2Wi2isVO0soY1Vu6V3lLYbJeitbRL4kFV8mDM5J4PIsW
 lbZoJRyrXIIJVucMwfYDgxxCtjqP2/aG8Q9jXrCeo/d2w3h3DVP9m186PFwIBfdnGplU/VAx
 2j6CVT8PfOYjub2ZMbA6w2J35KaEJU0gUVwMqyM6nRAh6tbedN4R6TNWK8aqZUTMG+aPgthy
 c/x9GDhOmMcSXknCjWoDtgO6pLt0KqW9m7Dg7JOelG9bWBSBixq5rvxM64lzHsTzSnL2wemI
 1ebEQVKv15tQNKtvx+7gGCDortokwklFNC4TZo0n7Vs7LWnlvzLAVhKg3WgpJfQD9JFGOH5P
 61qdSl6A==
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40709139"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPOlaiP07uarOc2BD7xHcdyKQSFAw2aV6ieXKmk7ZgIJw8y+VLtN4XcYT5G+nHh3jKYUtFq7Re2SdeShIBd6WnWLVqFZHDjZl7DFkphnRvreT/3GujE66aA40hMo5StLKR8gUn3FfVmsLwDgiHn1eMzzmDbBt6u7ZUS9oeXIRC6WH3H4CDOPQxUGJBpA8YPtwjE5qfDbDATLUmZ1nCb9L0+OXAtQfAjFwZq7q1emk/Tcu7nl4z965hCieM1dWWYYMz29hIYqC8BPOx2JKTeQRDiz9d4JBzYBCOzw9gb9mWmdHLSuCH5/mTop7jXeqsfjB36lv6lLCoWQjANKJynqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gX4/P1sEkNtez5H5Jn1w49A21JyqnDvXYw72qVzBVU=;
 b=aivdR7Sgl8Thuo+AZcPjxIAZhnmvrF+CmMxUDL4Q1ZzyjfVRZOL9RBwP+g2+s877KPezxHsTFAy8MbR/z0S3rc48qdyOOfj40Zgdz8uaGOisjr6XNYm6NVEjf08B+BQ+eWDdeFr+0mmuzvbnwhgOJbjTQugaRtGKccDKjJy5dweHXmuiOl/eJ6K6LrsLaZum7/7PxB+dqYvD+7M5KoJ9H8wdB6nIJS8crwXZWlIlGCA8akIgh6prj6gvWWdLY7tiERS3OGcrXhUP/XGCOI4BDDERrl3Gn3UX+iog13+Vwi5wXZ6dAHjvAP3N65ZCiCXYF2tCkjvOWuj8JbX6Kr+hBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gX4/P1sEkNtez5H5Jn1w49A21JyqnDvXYw72qVzBVU=;
 b=sbSV7pOmSvcf1qPkyvAlGd5Ngkm3SYJMd9YU/r4M3AJ5f84/uF2TboN696ljAotWs+VrV+dRnKlZ97DLtYZWFDCVJn52vNYwJRM5NadsW8YRobrL/sVj//0zPcl8h3rpb+DiY4vxVEIzQyLnASXtIUZnWICCRKirv9DhCHa1OZg=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-12-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 11/21] libs/guest: allow updating a cpu policy CPUID data
Message-ID: <d8121f7e-c8bc-24b0-a089-96a7bf19b480@citrix.com>
Date: Thu, 1 Apr 2021 15:55:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323095849.37858-12-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0134.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::13) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63cd3859-1663-4876-c1e1-08d8f51e3ba7
X-MS-TrafficTypeDiagnostic: BN7PR03MB3731:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB37311574C088F1A4BDFAB298BA7B9@BN7PR03MB3731.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /B35zz3iZ+E7rg4NplHJ/nklrKp57j5mpFTwAKxsjkX9Vg9XeNw123I2MjQqXPoHDnOB4JrnWg+/JioVRitFPtP0FBhAT/s1rEEL1IiMW37RfdGk94lDZZRo3EC58E2lcs3BPzuHR9jL75SHRz7kRt4b6oeiKEQBqrOBy4SEjgQm19fzvsETn9oHIQFl1HzQKex3QoS8Eyu5zlvjJdeB3DzvDG8qDR+5xVq+Yy7Nj7cgSPxXtLbfZhB9/V3myMm1ZLfFhlkUyVlNbBJDBR76wLp4tRy41q0gbhEIYbckFJNxbcLgfWRuKgB20sL4JbXpGOr9JrwrnhVWeiipsVW6dyieu/JKgxCpeiiq1gKxy53JnRQO3xt8UUsedZSiae4ykg372RL1iYu1HT/FKD51Zw+R3cB31i+nbW7txwpunUOjcVl4BZwOThxJhArDZEumCyQQxGJqKEcFQvmVSoCTwgYzQsGlSVhMatxPmD/lIDAXMoQWoIok4AEA4595asem+Z0+/Z0pv8IxjVWn8CbD+zhbDUSVtvxMRlSP+50+QGFCUjTg7m7fzkQgEYYkkGjYE2Zhmh3lShV2gJ2VvzfPYS+bxe3nGsAikX+TWcF7Uv9aOK/Y2BrbMdIMQrSIpLtiCUiSep43dEo7ODtoTHQAJXs6fow4WkxJk6dvRXi95o/92pA0xrbYIZLlVz2DSr4NFXyRw5v762AlWVRGWr6Oo/s7LFQbrBysOTcPQqkOzqs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(2906002)(186003)(66946007)(53546011)(6486002)(66556008)(16526019)(316002)(5660300002)(478600001)(31696002)(36756003)(86362001)(66476007)(54906003)(6666004)(8676002)(956004)(16576012)(26005)(83380400001)(4326008)(8936002)(31686004)(2616005)(38100700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dlhIMUlGL1pZc0JtYnJXN2ZONE5SbktVamxsWjZDaks3MTVDY1pHTlhVcHI3?=
 =?utf-8?B?ZkZXY0ZGa3lOQTQ5TmZmNndmMTFIQlBsWHZrTzFtQ0luaGlNYXdPY0RFcC9q?=
 =?utf-8?B?OXY3MGV3aXVZWlZncmErTTFPenRCRzJtcWJpUnpLMUtla0huektUbEhodit5?=
 =?utf-8?B?ZzlIcnBwUVhXanl4V21DWXVVaEVlKzNyM1Y5cmtFVjhranRSbTJ0OThrNmc2?=
 =?utf-8?B?VjhQZG5EekVvK0thMXdEVTFLTTZnTlVhMTRodWV2MlQweGxacnFnaTY1c1ll?=
 =?utf-8?B?WVVvbjJZbXFubjhFT2VuOVhkSm9TdjlGd3ZNZXhmMVNSeUdodjBTSkxVWW1u?=
 =?utf-8?B?cnlyMm1SQkpTZzEwYkNxUlNwV04xTk81VkRlUkxXTjVNZ2o1QktnUllERzE1?=
 =?utf-8?B?MmFneTNPNmI0YUdYUFlEb2NDbEszdmhTdyswbEFSY0RSUkJlR2N6bkdvdStT?=
 =?utf-8?B?cERJQXFDSW5odEd6N0dBR1paUFRzWnNHa01aQ2E5WE5velF5SElLOVh6b1ph?=
 =?utf-8?B?bWhGVkMxeUwzYmRoelZ5TStwMWNCblptNVpwY0RteSt4cnB5ZjUvSndiRTEy?=
 =?utf-8?B?Q3phb0R2UEhLdnF2VVZOazVvZmtaWXNqeS85MFZaZGx4ckR6TXpGRVNKY1dG?=
 =?utf-8?B?MytTNXNxNDZCVTRvcmFMNEE5MXRkNnRYQmdxNnlHc1FWRWR0VFZsSy9KSWFW?=
 =?utf-8?B?TDd1RTlsNEtOMm1qaGJYMkw5TGVMUXRKdFJ0L3o4cFJlM3ZGMElQODBvT2gr?=
 =?utf-8?B?YmRpWGpsODNJaitTbFp0Qm5xcHBrWGYrb2ZMZDhUWjM1VE4zS3RvdWZUbFYv?=
 =?utf-8?B?NXFQQTk1ZHplWmoxcnJ5Q1htRkRxeTJCVmlSYjAzVGtST2plVW1UcmVlQUt1?=
 =?utf-8?B?OFhlYUU5Qkd1V2gxV1NwYXcxQ2ptTE5jTFdpV1Q5VnhudDM5OVdtSHY0Nmdt?=
 =?utf-8?B?OGRTMHpwUkpDMkI4bzZ0Y0xpekNNdEpwdmluVmNTZnk1bFBVOW1Gc1ZXWjFG?=
 =?utf-8?B?Rlh5Y1ArbDgvcmNpM1hEYklaRkEvSmVQdkpWR2tkUGtkZXpBL0RVMnFKRkJP?=
 =?utf-8?B?LzlrUHFsVnQwSVNBbUNqSFBGVzYyUTFZb0hnUklYUkZhWDJ0V3FPSUpRbUd3?=
 =?utf-8?B?b2hZaXhrRUJraW5sUWxjUEUvMkZQNytTMG1URXZIVFk3S0dlbzg4ZXd2cTdu?=
 =?utf-8?B?MlZHMzBRSE9jaDh4c1ZDUjRWU3IxV1RqNWJQOHdZUzFEYVZ3ZUo4NkhmVzVl?=
 =?utf-8?B?eWpjeW5DK0g1TVpWZE1wdFJXSHFGZFN2eURRZ3BaRk1kckY3anVSVkk2VXhN?=
 =?utf-8?B?c0RzNnBIbncwaHFiMUI3cU1DVnI4WEdNZjhvd2draG1kR3YrcWp5OW40cVVz?=
 =?utf-8?B?aU5NeWNCeDNiejhMb3daSkZ0VFhFMjdnVTBJUTNnQmhjczVWU2FMWGkyVzZG?=
 =?utf-8?B?d24xREQyckxZOW1KNGNhcGlvQlBycElKbTZmeThRU0FwclhWeTBvbWg3V3BL?=
 =?utf-8?B?dlNrdXgwZGIvQTBIYXl4NVpnam1HRTVDQlMzMXVsZWZxNXJWSWZuVjRSWDBk?=
 =?utf-8?B?ZXhKM1owbHFyOGI2SmlWWFZzcUNwQXdKZWtVZjhZTHZRNjYrTlRMVVpUTllB?=
 =?utf-8?B?WVhEekx2bUJFb3hMYm15V2tLbjRNYmZwcFVCZDlJZTMzOFIyZk5EK2xuSXN2?=
 =?utf-8?B?TmREN0F5OWRRbXhLVklKZjA3bVhOS0lON1JtcFltWE1vZW0wTHdtZm5IdnFV?=
 =?utf-8?Q?h0yNycuFtMdWRq6EOPrQzLbL+dfYPaeU1mwEKqj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cd3859-1663-4876-c1e1-08d8f51e3ba7
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 14:55:47.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rf/XOa30StKwdqSe+SplVLFbekEALShaPcnmVxyjVrZQMLoX6ts+4pLhdrYtHpmnnY3eOEMnDecXKUYHOgeDy3DsqO0xBir43V55NFOf/o0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3731
X-OriginatorOrg: citrix.com

On 23/03/2021 09:58, Roger Pau Monne wrote:
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_=
x86.c
> index 091aeb70c9c..13c2972ccd3 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -966,3 +966,70 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const x=
c_cpu_policy_t policy,
>      free(msrs);
>      return rc;
>  }
> +
> +int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy=
,
> +                               const xen_cpuid_leaf_t *leaves,
> +                               uint32_t nr)
> +{
> +    unsigned int err_leaf =3D -1, err_subleaf =3D -1;
> +    unsigned int nr_leaves, nr_msrs, i, j;
> +    xen_cpuid_leaf_t *current;
> +    int rc =3D xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
> +
> +    if ( rc )
> +    {
> +        PERROR("Failed to obtain policy info size");
> +        return -1;
> +    }
> +
> +    current =3D calloc(nr_leaves, sizeof(*current));
> +    if ( !current )
> +    {
> +        PERROR("Failed to allocate resources");
> +        errno =3D ENOMEM;
> +        return -1;
> +    }
> +
> +    rc =3D xc_cpu_policy_serialise(xch, policy, current, &nr_leaves, NUL=
L, 0);
> +    if ( rc )
> +        goto out;
> +
> +    for ( i =3D 0; i < nr; i++ )
> +    {
> +        const xen_cpuid_leaf_t *update =3D &leaves[i];
> +
> +        for ( j =3D 0; j < nr_leaves; j++ )
> +            if ( current[j].leaf =3D=3D update->leaf &&
> +                 current[j].subleaf =3D=3D update->subleaf )
> +            {
> +                /*
> +                 * NB: cannot use an assignation because of the const vs
> +                 * non-const difference.
> +                 */
> +                memcpy(&current[j], update, sizeof(*update));
> +                break;
> +            }
> +
> +        if ( j =3D=3D nr_leaves )
> +        {
> +            /* Failed to find a matching leaf, append to the end. */
> +            current =3D realloc(current, (nr_leaves + 1) * sizeof(*curre=
nt));
> +            memcpy(&current[nr_leaves], update, sizeof(*update));
> +            nr_leaves++;
> +        }
> +    }
> +
> +    rc =3D x86_cpuid_copy_from_buffer(policy->cpuid, current, nr_leaves,
> +                                    &err_leaf, &err_subleaf);

Why do you need any earlier logic?=C2=A0 x86_cpuid_copy_from_buffer() alrea=
dy
does exactly this operation.

~Andrew


