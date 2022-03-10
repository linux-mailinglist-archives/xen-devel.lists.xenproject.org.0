Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D44D4F80
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 17:42:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288499.489215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSLrf-0006v0-6l; Thu, 10 Mar 2022 16:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288499.489215; Thu, 10 Mar 2022 16:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSLrf-0006sU-3U; Thu, 10 Mar 2022 16:42:11 +0000
Received: by outflank-mailman (input) for mailman id 288499;
 Thu, 10 Mar 2022 16:42:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VYsB=TV=citrix.com=prvs=061b0cdbb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSLrd-0006sO-4u
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 16:42:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0260698c-a091-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 17:42:06 +0100 (CET)
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
X-Inumbo-ID: 0260698c-a091-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646930526;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vTeSG5qpwFJWZhNshpkLO0h2G6lwdQp6zkK35UIt9tM=;
  b=a5wRUpNNv9CZgV59WZYXpn9K5QJcXkQlnKSgFOUZJnzw3e55Vu+9uZFM
   tkH6pyagC0ak/mp203k3g+tvkzOPZ8MLUhamnL96PycQEGpkmwT6DBpMj
   NtLScUvRGtCiS4wnPu0ngSoyOnIdaQICu8qU1lF+SWVUu51/j0pAsGXQC
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65409551
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4gEcjKBHTdByGxVW/zjjw5YqxClBgxIJ4kV8jS/XYbTApGwh0zxTx
 zZMXGCDPq6CYWbzfoxxPY7l8hxU7MWGm9VrQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vg2tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhP6
 s9g5Me8Tzw2ZLHghqcbfgcGMx9XaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgWto150TRJ4yY
 eIiNBF0MSuffSZoHQo0Cr45xNevol7WJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEmevnjS79HoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiECmpDNNANZWKPJg9C2Tiaz5/Vi5OEFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodtjxor6p5
 iRspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/I9ANuWolfBk5bK7onAMFh
 meJ6Wu9A7cJYBOXgVJfOdrtW6zGM4C8fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPRkkQBCrKiOneLmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcEkjITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:H7xXBKPoJ6w0MMBcTy3155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080lKQFmrX5WI3NYOCIghrLEGgP1/qG/9SkIVyCygc/79
 YfT0EdMqyIMbESt6+Ti2PZYrUdKZu8gdiVbI/lvghQpGpRGsddBmlCe2Km+hocfng7OXN1Lu
 vU2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnS4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUoZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpAoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPUi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZMIMvD0vFoLA
 BSNrCc2B4PGmnqL0wx/1MfiuBEZ05DUStvGSM5y4+oOzs/pgEN86JX/r1cop46zuNMd3B13Z
 W0Dk1WrsA8ciY3V9MLOA5Te7rANoTyKSi8Ql56Z26XUZ06Bw==
X-IronPort-AV: E=Sophos;i="5.90,171,1643691600"; 
   d="scan'208";a="65409551"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUI0BV7ORAph5E9GggMSUCDqHOCzlni7y9mDZINmyRRUe0n4+TGyV229ou6q/ZeLYporymByNeIMMSxKhgXbMtiwpQs3s9IrPVGGR1k8RrvDax3PqAR3C/Wb2u8Qopdc5Z8j1NQDMTL1q94n54BVa+AgSdFhJwJw4Nlhlcz8M3d2nfVFrOc2KSKlWo4JPxTndUrVFlqkdKU8H4Rn6SmEbKJ0ks7ui8vfSiPT6U72f43tI3uE9lqGaFv4uQouAkiUOPIQluEBk8+JQUZ38OQWvtTbzdGh7/dyUv6RiLgpgt8h+hS0QUjlmpZpQemeZkASctr0af19ygxnnYkr6Inugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1GROqNbzLR92M0X8QnrmNGlycl5GeJ7Kk749jNgCNk=;
 b=Hq/li9dLKPjcYpMaqjWGKC9vfvdbO3scYb3pQct+Vn3xMnabfwvdy9AK/10UWmCtCXzXEs4mMUsNCxHsfWY7sP7apZUjAXYklBdLDNucP4cqCrBQ18l55INwMf+KM2jk5yOqcpru2RNHSV67hytjlf7MYIazdcWhfiPyi3j7TIxOBfyzLGTEmZuyCwSCa7sa8sJaILjNZW8biyAPjQtYbvvD7Uv6AwiIuzRyGwBp0Qq/IvitWKX/ok47APj5RyXZ5eVgUzC+xrmELs4A54BJ9HiT0R4Ems3ifa7j6B0KGmnSsgUA1oBwhS7crDT6mIkZ7hKHE4MyBm0Ek+VKRyaTzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1GROqNbzLR92M0X8QnrmNGlycl5GeJ7Kk749jNgCNk=;
 b=GOG3EY1yIauyCLMgTQWnu0OebF54QwoaQXOaB9z/bKBq8HxnPB8LW5vm667z2ZgzeGCYGGypx4NzVC4tJ1O+pjHBXfykZHWxI3Xratlno4k4bFsdP1y7CCBS0T+Cyq9SH2jHCPPe5e7krqHkc1TerNnoF8dJskU0iG/lL2bvWAQ=
Date: Thu, 10 Mar 2022 17:41:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM
 guests
Message-ID: <YioqL+CcQHiwyRwi@Air-de-Roger>
References: <20220201164651.6369-1-roger.pau@citrix.com>
 <20220201164651.6369-3-roger.pau@citrix.com>
 <ea9c7232-a98b-7fb4-a151-0c1e3ce1e1db@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ea9c7232-a98b-7fb4-a151-0c1e3ce1e1db@suse.com>
X-ClientProxiedBy: LO4P123CA0383.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9810c045-445e-4d99-4693-08da02b4d0f7
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6630:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6630700503D64A51F257E31D8F0B9@SJ0PR03MB6630.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n/tqS4XikSBAanGV4VjfWCkOSG82bmE8/7eTOEtaGdKqvFSWkm4K73SNAiHB2dU+zP+u+WrtSHVNzoV5hkun7oPDFz57gTqgNtgwmNqTPTgCTH5TNbo39W8GyTfgMhy/jEA6tLr35nQxlJhbdJCIAm4qfAxDBsISYK9HTKQikGs/mjeXj3Rhp1Q2z5zQx1pLorE16y5q857HouD06V2LatzxJqTSyOPwyNyNQBuD4cSNwmxgQKCaskmFffDlTLkdkVd0h2JkNk3vradkBNR2Cy4eRFugg0dw6hYcjTp+b8TEaZILkK8nWYcllpiV9CaCbcimga23tEMvkziPoT9shJkd+SCzu0PRfyrnFsAlEOUpcPK57IFKPcHpuBUtzsadXTa5ufvLB2DlwLLQ9+vHJj5cP4G+17U6qgiWBxPRr/zFhmZ6pvXj9TdKQny4sY6PCMmbz5x54P6v3QEK+I0XjqmYJNYzbTsiz0sHhK+boGxzalu2VgHNNCQa206lbUDQYw7RZuUOjyYELmO1ds/SYzZRxo5YVFHfuGO18gHhLTp1mcxY0xSP4Mnzyw8buSgL+MPMUMAoxhxM+4hmtzs1XLjM8Sy2BCX8v5CBRqJ/c0FoCnOAh2tILaY1VREoVQ2yhBLVtTW13YwlN7asC+jjvcA5DKLInzLLmplONlhCtunBq/Xq/8MDGqCsKOvf2gRfEXym/Dg7WY3oN7UTJwoWJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6916009)(508600001)(66556008)(66476007)(54906003)(6486002)(316002)(38100700002)(8676002)(4326008)(66946007)(86362001)(82960400001)(186003)(85182001)(6666004)(26005)(6512007)(6506007)(53546011)(9686003)(2906002)(8936002)(33716001)(5660300002)(83380400001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTFtRUtJb1AwRTBROTVEd1lmaWZxUEh4TkxUTnpJVFBBZEVQZEVPQ0tYOHVY?=
 =?utf-8?B?VE1EL2k2NWxvNUI2dGU2L2JMbnpFZ1UxUi9SdGZUS0VhSHhQc1dQQTJvUklG?=
 =?utf-8?B?citwb0E0b2lIcG5zNlBzU0h4cjBjVWI4blJ3b21oSTMrbnRkcGtQOXdwd2ww?=
 =?utf-8?B?YlVwQlEwV0pWMmZxRm54U1ZXVC93L3JCMEFWQjdKUkxmNGFYRUo0bExBQTZy?=
 =?utf-8?B?cHFxaGpPcXpnMEYyNXlyNVpMdmxXK3FQeXBWby8yOU5saVNuVjU3T201TnEr?=
 =?utf-8?B?NjdnQm0yTnd1cHNFZUtnNzZrMG9hMG1vRmhZdkU4ajZweGd1UVpNeUhYaW9w?=
 =?utf-8?B?R1JmNm5mNE0vdzZBZ1NiWnFveC9TbXI2RnB0T0VRUE9DcTQ0Si8wRnhhRjVP?=
 =?utf-8?B?V3JsTUhCNUxJUmx2MThsY25ZWE9PeklRVW9oL1lnM095UFJQcGxrQnZVVDU5?=
 =?utf-8?B?bnlVcUlHSWVMUWxITWJUUVdPaTI1Y3NEUDhxU0RzK0xUQkt6K25UaVdxbmNa?=
 =?utf-8?B?c0NWK3ZQY3gvck8wRkJLdWw4bk5Vb1o1b0FMZG1WMlZHZlhHbEF5MUJrRUZk?=
 =?utf-8?B?ZlhURGt0SVhUeGt1QUI0QkJqNFhrbHM5UEtIZnZQeml2RkdxdU5zNjl2TFc0?=
 =?utf-8?B?OExXR1daMlpsUzZhbG54eUQzT2VMYnBDRS8yTFh1UmdaRFI4MHRQRmpadDZK?=
 =?utf-8?B?TExLOE5XMkJ5elNlVUI4Y2lpT2dXSVoxaVUzS21EQXRSTFA5NEQzUVB6Nlgw?=
 =?utf-8?B?OHh5N2ZvYU9TMGl4QmRBbE50TXIxd1ErMEhoT1Bud0orbWZ6U0JFYnpvVXJL?=
 =?utf-8?B?NHordUsrMUZhSFZOTVpCQ0FIZWhDVGp5cVM5QU15R3YxOXdwWDBPK0k0YXZH?=
 =?utf-8?B?TDI3aUhlZzFaMHVUZVl5aU9tbFpJYkM5dUNMc1dMMmlUQ01SN3BEb0VmRnpy?=
 =?utf-8?B?SkRJMW10Um5ieXJLZ05RUEpVYTNlRkMwWTlKVVlTZmtKajVieTZKWTVObURR?=
 =?utf-8?B?Vm9HQk0rVTJOaHJjTUFac1dDVW5URXFLdGg0TlM3c2s5amRWUFI1K2xwWWZK?=
 =?utf-8?B?VzBLQTF1cjBNaTZEWnI0bUh2WldpMUVKbmUwR0FQbEMxSlZWd1hUT1cyUFla?=
 =?utf-8?B?cVQrK24xNG1ZNlJyeGhLM0VoZGwxNExGUXlmSEpHQlJKUGtCUlNiZXlpb1Zk?=
 =?utf-8?B?cmdTVmg2ekhEZkN0SnNXVGoxbGs2eUlLMGRVRHY1TUU2U095SVNEd1FCSHo1?=
 =?utf-8?B?ZHBtdWVxU0tKdUFxb05WUi9STi9vLzdMdDB5N3pMRWFiS01WR1U1N3pvdit3?=
 =?utf-8?B?c0tJVmtjZHZwZ0RMclU0Y3NvU1o2bHhjSVMwWFNNbGRhbDZWcXZwWGlRZEp4?=
 =?utf-8?B?bFdkc3ZzREk5ZGdvOTJrY21NMjQrWHBobHNPRE9NL1VaTjByWVoyajFrMjg3?=
 =?utf-8?B?WE5jdHB3cXpiMWNCMXFNRzNiUGQ2eDVwTUxCMzdPSGJtQnovYThFSlpPOE5B?=
 =?utf-8?B?Zk9XMWp1eWFIaklUSm9rNXQwMWs3WWtTU2xmLzJBZVJldzNGZXJYVmpaQzlx?=
 =?utf-8?B?c0dRelJ3M2VuQXR5dVM1cldvenI4eHdJcVh5RmxsRkpzdlpxYkdqd0NMZXYv?=
 =?utf-8?B?QTRycHd4Y0FJVGE2ZlBveHc5NGVFaG9TYnBMVlArTDFwTmJQd2RnaFB5M1Zn?=
 =?utf-8?B?ZjVFbHpoNmV4L1grK0t6bGhxdTVNajJvUmF5ZjhXdE9DNnNTaXcvUjRYd0hM?=
 =?utf-8?B?a0p0ZmR3VjlhVHFtSk9yWUd1WVpKNjU3cHBNRzhhdUZtaFQ1WThXN2hkNHJL?=
 =?utf-8?B?RStNUDlPNXp0TWM2WUMxV1RSc0dmRjdhQVVMUktiUmo4d3hoVmI2c3ZuNE9U?=
 =?utf-8?B?a3AyVFNlZzJXOHlRc0Jtemw5dmxqWEdtNU9nYWkwai9uUEpSWHJKdk9rdUtT?=
 =?utf-8?B?ejk0OWp2RkJhTjRRYjdNenJJYkRBSlZnNi96L0hRM1h1dENJSWV1Z2JsNXNu?=
 =?utf-8?B?NU1sOWVXZnJBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9810c045-445e-4d99-4693-08da02b4d0f7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 16:41:25.2237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctzhMdtmcsN15Fd2kObvV2/KYRPGeM+PZ0XuCPqAwHpnfbpvoLPXhKKUrHHPCJDa9jWtFLXssa+3TwmJCotahw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6630
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 05:02:52PM +0100, Jan Beulich wrote:
> On 01.02.2022 17:46, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/svm/entry.S
> > +++ b/xen/arch/x86/hvm/svm/entry.S
> > @@ -71,7 +71,9 @@ __UNLIKELY_END(nsvm_hap)
> >              mov    %al, CPUINFO_last_spec_ctrl(%rsp)
> >  1:          /* No Spectre v1 concerns.  Execution will hit VMRUN imminently. */
> >          .endm
> > -        ALTERNATIVE "", svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
> > +        ALTERNATIVE_2 "", STR(call vmentry_virt_spec_ctrl), \
> 
> I'm afraid this violates the "ret" part of the warning a few lines up,
> while ...
> 
> > +                          X86_FEATURE_VIRT_SC_MSR_HVM, \
> > +                      svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
> >  
> >          pop  %r15
> >          pop  %r14
> > @@ -111,7 +113,9 @@ __UNLIKELY_END(nsvm_hap)
> >              wrmsr
> >              mov    %al, CPUINFO_last_spec_ctrl(%rsp)
> >          .endm
> > -        ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
> > +        ALTERNATIVE_2 "", STR(call vmexit_virt_spec_ctrl), \
> 
> ... this violates ...
> 
> > +                          X86_FEATURE_VIRT_SC_MSR_HVM, \
> > +                      svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
> >          /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
> 
> ... the "ret" part of this warning.

Hm, so while I could load VIRT_SPEC_CTRL easily from assembly, loading
of the legacy non-architectural setting of SSBD for Fam18h and earlier
it's likely not doable from assembly.

Since those helpers would only set SSBD, isn't it fine to execute a
`ret` after either having set or clear SSBD?

AFAICT the requirement would be to either have loaded SPEC_CTRL first
(if present) in the VM exit path, or to set SSBD before setting
SPEC_CTRL in the VM entry path.

> Furthermore, opposite to what the change to amd_init_ssbd() suggests,
> the ordering of the alternatives here means you prefer SPEC_CTRL over
> VIRT_SPEC_CTRL; see the comment near the top of _apply_alternatives().
> Unless I've missed logic guaranteeing that both of the keyed to
> features can't be active at the same time.

Xen itself will only use a single one (either SPEC_CTRL.SSBD or
VIRT_SPEC_CTRL.SSBD) in order to implement support on behalf of the
guest. amd_init_ssbd already prefer to use SPEC_CTRL.SSBD over
VIRT_SPEC_CTRL.SSBD when both are available, so we aim to do the same
here.

I think part of the confusion steams from using info->{last_spec_ctrl,
xen_spec_ctrl} even when SPEC_CTRL MSR is not used by Xen, I need to
clarify this somehow, maybe by not using those fields in the first
place.

Thanks, Roger.

