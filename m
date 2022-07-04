Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891EA565152
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 11:51:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360085.589485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8IjV-0005hD-UO; Mon, 04 Jul 2022 09:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360085.589485; Mon, 04 Jul 2022 09:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8IjV-0005el-Qf; Mon, 04 Jul 2022 09:51:09 +0000
Received: by outflank-mailman (input) for mailman id 360085;
 Mon, 04 Jul 2022 09:51:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A6Xk=XJ=citrix.com=prvs=1776e108b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o8IjT-0005EP-Qo
 for xen-devel@lists.xen.org; Mon, 04 Jul 2022 09:51:08 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceb75969-fb7e-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 11:51:02 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2022 05:50:58 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6421.namprd03.prod.outlook.com (2603:10b6:a03:398::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Mon, 4 Jul
 2022 09:50:55 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 09:50:55 +0000
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
X-Inumbo-ID: ceb75969-fb7e-11ec-a8e4-439420d8e422
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656928263;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=wi6kw4uQTOZiKIGsDr8MfBIXbEdkA8GY+W10rc9D2Go=;
  b=dHw6qahfIvfB6mjDtw/eJKfD4nANxiAC4Q7f4mbHUKwfe/K7x25C8qnB
   NqMZjofTlpKVzUXbfzmDBuT6nz3IKf+ZmdmKutD3fv1KF2FH0PxG2u9pG
   gmBTcEAhrULfCzR+9Gwt0r0SKlKQsDiVXhDoUGhHSAncbZNE8djSX6JWe
   Q=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 75449540
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KPg83anxD6rGQxJsv0URmHPo5gyCJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOXGqHaP2Dajf8Kohyb4qx9k8PuZGHxtQyQQI9/ihgQyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EgLd9IR2NYy24DmW1jV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYYDoMJqfxwP4kUBBHLxFuI4Za2Y3HLi3q2SCT5xWun3rE5dxLVRtzF6tIv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXuJkBgmdYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH9Q7J9PdruwA/yiRj1LHjFtf/OeakQO5OnB+4/
 3qe/mHmV0Ry2Nu3jGDtHmiXruHOhy7+VZ4fE6eQ6+VnmkbV3WsOEhYbW1yhrvT/jEOiM/pPJ
 kpR5zEjt7Ma8E2wUsK7TxC+5nmesXY0S9dWVuE39gyJ4q7V+BqCQHgJSHhGctNOiSMtbTkj1
 1vMldW5AzVq6eeRUSjEqOfSqi6uMy8IK2NEfTUDUQYO/9jkpsc0kw7LSdFgVqWyi7UZBA3N/
 txDlwBm7517sCLB//zTEYzv6950mqX0cw==
IronPort-HdrOrdr: A9a23:daF2KKjS9hIcU94n5ZwghU0EyHBQXz913DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCJSWa+eAcWSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AWV0gK1XYcNu/0KDwVeOEQbqBJbq
 Z0q/A30AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9MofyygwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmg3f4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQC/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKorzPKN
 MeQ/002cwmP29zNxvizyhSKZ2XLz8O9y69MwQ/Upf/6UkXoJh7p3Fot/D30E1wt67VcKM0md
 gsAp4Y642mcfVmHJ6VJN1xNPdfWVa9NS7kASa1HWnNMp0hFjbkl6PXiY9FlN1CPqZ4hKcPpA
 ==
X-IronPort-AV: E=Sophos;i="5.92,243,1650945600"; 
   d="scan'208";a="75449540"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfqIFtq7S2KwGaoq7n4aFRze2/px+oLxpG+K0Q2o95GL5nDLsyjooG2n3Qcafejrn7fr1aqwVH0y5sAGQs2o5/nhYxSLDmZt1koEZ9UMgcMgMMO618YhIPjEkk34pGmVri45NinQ/sHRsTp/C6KtfIpqKkLLSXjI2LKej/YhOR11mm6EIgrkVXhSyfvwrqPfcIA9ed9B7jBBj+Zr9x4WBt5TqTaJ4Q3J0P2zelFi2J9URkEaN1Cpv/prks5+m5gZ8QLfVPS+w+xDGm5xuV4EJNqnzfSNZrwrLxO2WV/sKMIT2LmO8cjtFUs/1B25RA+Kqec+0XXzfu/9JhKAaejTKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rDluYUKcxAsQlmWWPBTm509lxxjiYLo8Seh9dxgoQU=;
 b=LDeV+mO9HcVINLVDvUKGoJz5Z3lpzWDo7v4Y8Xvv2wALcNlep4DX97FfxByHzKAdiijrwXd+lxgYWUMVgfE83ZqUvquX4Vr48PDgBeO/0WWO2a6a7c0G+Jzwr933Ky9fN13VgNspl3gf8j/n+AWFDMM4htkIl7Vk7qfHaeD6pYBdqL196XT5ayiVYUzpEwRDmZCX3d0f+gnqsoShWy8CDLlsyAwr9Fu3js+5QEQJGjPcVoLCCw/Zbr+n9DAuX5HNaUcaCr3nBE5vUTO6OSYWlVHYvd3h7FLUS/jex48Z00Cmd8RvajqT0v2z0bZp8TT98LwbTxSMkI6JlcWyULdi/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rDluYUKcxAsQlmWWPBTm509lxxjiYLo8Seh9dxgoQU=;
 b=YyZu7bs8rtBUVWkYxr+nuQsaQUEa6Xc9UR68FSr0jjqgqwIzB2q88ebLu3X4V4mHYOG8Pdf8vDhkzY5iusJ960Vv+KDR5JV3UY0Qmhs835eOX9B/JAv3mCQ1HXjGDJGlpHM80vjS8TkFvfv/O7CHT1LyI3+A9Czak++CBN2oZqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 4 Jul 2022 11:50:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "G.R." <firemeteor@users.sourceforge.net>
Cc: xen-users <xen-users@lists.xen.org>,
	xen-devel <xen-devel@lists.xen.org>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
Message-ID: <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local>
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
X-ClientProxiedBy: LNXP265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4041e4d2-508e-4505-a6fb-08da5da2b044
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6421:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D8Q6P7rkg5X4vLzAd2MrQqjqEnf+y1+ZM9la0cTrloBar+cWV3W7/9pDMwoUCiVRSMkxZ5xq9xP1WrH/w3Xbvmre1hAtP1sIgfWksbsAIJAcTW5CY+fFjogoJIHdxB/jSNMUrcDqbEBg8QPS3UI90b6Dh/rtaIVraZkID5A652EkiXGoSUFtq7K/jVLkvZ/hzFaXai+3nRwDHkhxpXJTgdA1/0JK7+RujjVJGKhoAEs4aLYsd+9pg+LtgImCFlPGUCIG7g80/EQpFdFbujvzaMEnKyFCkaMQD9Eef+l5sau6wH+brkojArUd4ZiX6ZHP0n6o7KouGeOIiN7mM7PN8EY6S4gsqJbd2xcHlnw563slvz8Iw55Ss8B16Cc7bff2BygFqsI5/qm0JBbDNBsxv21QW2J1ndnlZWrENMxMzAdlU6IAgJw1w6O+KIfeC+xa4LSr1fGBek1fzAuTqLe4fhKNJABStIsa07745Eif1GrEzspwhGnVH5hRLfDzd4mvQzvFW3NE+WtJ5KAmP47mc9/O+owMQAmvIDC5YYWfdfl0dN5FZIHSUw+I7JcopEYLNKL3c93QMa0bF7shQJpqOyjtp+EuS0SqwyQO4mZD8FWCxuyqdCIPIUZ2RukkbHrqdVwRkTOyXZodLOO1prjxMW9geNpZJhODZNnfsctP8gUHhtwpmINdgpL1G0RzDNBsmckfZy0GSbpypmAjgFIHN5CwHd9f3c4YuEd8EDt/1WnZWUyOC112t/wDgfrECtRqwJsbL/9yhLNn/pBIFnmZ28Zs6Ei6sXQRiXh6YE/FdpvBDaa2c8jk0a72//7jTU5tgTRqG8xVGnTnpUAQi2nj0XSwWAGcr+/iULkY9ZY4R6c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(478600001)(9686003)(6512007)(8936002)(86362001)(26005)(2906002)(6486002)(41300700001)(5660300002)(38100700002)(6506007)(83380400001)(4326008)(54906003)(66556008)(66476007)(6916009)(316002)(8676002)(85182001)(66946007)(186003)(82960400001)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVJHYyswWk43OGFyNkE4N0kwTjNOb1U3d0dTdjZZdWF6TDFTelFJSjU3SmFh?=
 =?utf-8?B?S3BybmM0d1V3dE5VdVpIT0JKaUN6OGF6SG1YVk1pN2xONjhzelhjNTl0Mkdi?=
 =?utf-8?B?WXJLNnJ1d1VpdUxFdnFEK1JPSkEzVW14WlJIZ1Q5NjRwM0ZhRE1NVklRMWYy?=
 =?utf-8?B?UFo3NU9EdTM5bU9oOUE1eGpPREg5UnRoY2kvRDJoUUdkamJGRDNORjZXVitN?=
 =?utf-8?B?ZXY0NTk5Y0hGM2ZIaHp6NE5Fb29KeDhCcmRGaEJnb2Z4QmVNNkI2MWFIdFlV?=
 =?utf-8?B?dW1ha3g4TkZWMUV0dnN5UzdLMGR5aXVncmo4YkZMYUZMUXdjMlNVOHJLbGxj?=
 =?utf-8?B?UDdJYlVtZklxek41bnhoRHhaVllnclNjbU12V09MaU9TM3dObFdOS3Z4NkZK?=
 =?utf-8?B?eXh3Zk5jN0dpTkZGeGdsOE1QZDl0NnZHZmZWcTNJbFlBV0lqbExtcnJKZjJ5?=
 =?utf-8?B?bFRLTjhiZnlLVGdjVHJUc1VEVzVyOTFwQ0djazUxNENScStLb0hTOG9Jd3VQ?=
 =?utf-8?B?aXFwY1NwUkVyK0YvNUJjczA2elZVWHcwTnBxbjczeDAxZkFkcy82SExLeitI?=
 =?utf-8?B?SmJ3V0NxK29HazROTVBXLytCNFVzVTBtbHBHSEpxbGUrcXNjajZDVXZjYk9a?=
 =?utf-8?B?VlkrUXJyQUpIc24rcGEyMUxwSGo4eE5mWnVOY096bDMvTzdIZGIzb1dTaFpF?=
 =?utf-8?B?eFBOanlJRTlwOHVwLzlBd1B5ZGp1aHFFN2N2eFh1a0FpVk9GdmNNTktMZ2Uz?=
 =?utf-8?B?QUkwcUJwNnh6MmRFVllqNkwwcHo4SUdTTmE2TmY5NzVkRkNTK3R0bWlGOTdM?=
 =?utf-8?B?b0VUYkpza3BJdThzUmNIU3VBUDR4T1JnMXpQMCtIa0JYUVVmUFNWNlJoUXZ5?=
 =?utf-8?B?Q2xYaDByVnY4SlNQdk9MV1RSeEhPRlYzd1g3QjVwUVYvZ3JqMmJ1NGI4MjNn?=
 =?utf-8?B?MmltNVRsckF3cGdmYjdONjZFaVNZemUrRlI5NmNyWi8xNnNHVG9MZVpUTzhM?=
 =?utf-8?B?TVcvSFQvRHMreURJTUtpbUY3cmoxRWNiVEdwTXZsQ2cvT250WldPRG9tMUhI?=
 =?utf-8?B?S3NoK3h0UWVEM1kzbmtoZ2NCa3hHN2dZRmpUdEk5aGY4M21LdmFqUXFlaFcr?=
 =?utf-8?B?MzRqdkJWb0VrcjJCdDh5YmM1clZLUTV0eHAyYXBqWk0wRjRnMUl5U2pnZjhR?=
 =?utf-8?B?Z2M2Nm56RXBZQ3U5OEp4MUkycWV4MkpmSVhXWUVOYWh1N0NZSWZJMURTdmlK?=
 =?utf-8?B?VVNUUk1jdC9jd3E0RldFQlhwK25qQlRpYmcvVXZSYzlDaWtFbUt3Mm1Oc3Yw?=
 =?utf-8?B?REdJUEYrKzZpczBLdzJTWXZ1Q0lXd2hndHpDWnZZdWdyK1gwQmtrVHVQU2d6?=
 =?utf-8?B?WEp6dzN6UDgwVmM0aE9sSkxqNkl3K3ByUzcvOERoeDhjeWx5WERoWDN1dlov?=
 =?utf-8?B?bmdGcXViUVRJa3ZOYjhBZmlyTzFxMTZNVm41aHh6ejZmb25OdWN6YTV4c0RE?=
 =?utf-8?B?ZkdnOWJOem5YYklrWHB4U2IvdUN4ODZGNGpjekdza0VneWJLNlhXbUNGeC9w?=
 =?utf-8?B?K28vQStHMENrN3U4SkVxVTFtbXdNNEVJdms0ZTVMS1IzSmIzanBScXJFQUJU?=
 =?utf-8?B?VnNtMWlYMU10S2tJL085c2xmTEgvS1lWcEZBWktqU2MvRXo0TGdCY0Y2eElp?=
 =?utf-8?B?bUdaTWVEMVZaL3J6Ui8xMGRjK3NpNHozNjBxdWUvVjJtdUZFVUpCL082NnpK?=
 =?utf-8?B?cGtnbG8zVFRyNHUzVnV6UEdyYUtUclJwaVd1Ui83ZE0xTVJaRGlMN3dzMGlP?=
 =?utf-8?B?bEw1a1BHK2dkdW9ycnBIK2hwQ2tPMUo5VTBWcUU5bGNSNXcrUHAvd1dRR3Jl?=
 =?utf-8?B?cytvRlJidmpyNGZ5SnFDRW8xZGxnSnJiYmpybjgxdWcxdzBVYXNtWFlXeFdX?=
 =?utf-8?B?WDFoRjhaWVRBZm1MNSs2Q200RGdMalpBYmhDZElsNlRDNllkZVo3TE8zdjNM?=
 =?utf-8?B?eFlkTmVudWYxVlkvY0M1UzBkdkRiaVJacG5Rb3l3dytFeUE3RWlMeU5ETnFY?=
 =?utf-8?B?dUtLc2w0V1M1cUNjTVFQRlZVNXR6TmxoWkhMNVAwbjdzQ1dUdittZXF0REQ1?=
 =?utf-8?Q?k7/Et4k2us5GLEn4iI7GeH4hS?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4041e4d2-508e-4505-a6fb-08da5da2b044
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 09:50:55.0814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEbNg3aSLf+cQ1YlHiwxlwzo2HlikTsaQ2QNboWV7x08A8kUTbaq6ofxkLbDdsnc7OcgT6F3SHqz+MDNjCgVwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6421

On Sun, Jul 03, 2022 at 01:43:11AM +0800, G.R. wrote:
> Hi everybody,
> 
> I run into problems passing through a SN570 NVME SSD to a HVM guest.
> So far I have no idea if the problem is with this specific SSD or with
> the CPU + motherboard combination or the SW stack.
> Looking for some suggestions on troubleshooting.
> 
> List of build info:
> CPU+motherboard: E-2146G + Gigabyte C246N-WU2
> XEN version: 4.14.3

Are you using a debug build of Xen? (if not it would be helpful to do
so).

> Dom0: Linux Kernel 5.10 (built from Debian 11.2 kernel source package)
> The SN570 SSD sits here in the PCI tree:
>            +-1d.0-[05]----00.0  Sandisk Corp Device 501a

Could be helpful to post the output with -vvv so we can see the
capabilities of the device.

> Syndromes observed:
> With ASPM enabled, pciback has problem seizing the device.
> 
> Jul  2 00:36:54 gaia kernel: [    1.648270] pciback 0000:05:00.0:
> xen_pciback: seizing device
> ...
> Jul  2 00:36:54 gaia kernel: [    1.768646] pcieport 0000:00:1d.0:
> AER: enabled with IRQ 150
> Jul  2 00:36:54 gaia kernel: [    1.768716] pcieport 0000:00:1d.0:
> DPC: enabled with IRQ 150
> Jul  2 00:36:54 gaia kernel: [    1.768717] pcieport 0000:00:1d.0:
> DPC: error containment capabilities: Int Msg #0, RPExt+ PoisonedTLP+
> SwTrigger+ RP PIO Log 4, DL_ActiveErr+

Is there a device reset involved here?  It's possible the device
doesn't reset properly and hence the Uncorrectable Error Status
Register ends up with inconsistent bits set.

> ...
> Jul  2 00:36:54 gaia kernel: [    1.770039] xen: registering gsi 16
> triggering 0 polarity 1
> Jul  2 00:36:54 gaia kernel: [    1.770041] Already setup the GSI :16
> Jul  2 00:36:54 gaia kernel: [    1.770314] pcieport 0000:00:1d.0:
> DPC: containment event, status:0x1f11 source:0x0000
> Jul  2 00:36:54 gaia kernel: [    1.770315] pcieport 0000:00:1d.0:
> DPC: unmasked uncorrectable error detected
> Jul  2 00:36:54 gaia kernel: [    1.770320] pcieport 0000:00:1d.0:
> PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction
> Layer, (Receiver ID)
> Jul  2 00:36:54 gaia kernel: [    1.770371] pcieport 0000:00:1d.0:
> device [8086:a330] error status/mask=00200000/00010000
> Jul  2 00:36:54 gaia kernel: [    1.770413] pcieport 0000:00:1d.0:
> [21] ACSViol                (First)
> Jul  2 00:36:54 gaia kernel: [    1.770466] pciback 0000:05:00.0:
> xen_pciback: device is not found/assigned
> Jul  2 00:36:54 gaia kernel: [    1.920195] pciback 0000:05:00.0:
> xen_pciback: device is not found/assigned
> Jul  2 00:36:54 gaia kernel: [    1.920260] pcieport 0000:00:1d.0:
> AER: device recovery successful
> Jul  2 00:36:54 gaia kernel: [    1.920263] pcieport 0000:00:1d.0:
> DPC: containment event, status:0x1f01 source:0x0000
> Jul  2 00:36:54 gaia kernel: [    1.920264] pcieport 0000:00:1d.0:
> DPC: unmasked uncorrectable error detected
> Jul  2 00:36:54 gaia kernel: [    1.920267] pciback 0000:05:00.0:
> xen_pciback: device is not found/assigned

That's from a different device (05:00.0).

> Jul  2 00:36:54 gaia kernel: [    1.938406] xen: registering gsi 16
> triggering 0 polarity 1
> Jul  2 00:36:54 gaia kernel: [    1.938408] Already setup the GSI :16
> Jul  2 00:36:54 gaia kernel: [    1.938666] xen_pciback: backend is vpci
> ...
> Jul  2 00:43:48 gaia kernel: [  420.231955] pcieport 0000:00:1d.0:
> DPC: containment event, status:0x1f01 source:0x0000
> Jul  2 00:43:48 gaia kernel: [  420.231961] pcieport 0000:00:1d.0:
> DPC: unmasked uncorrectable error detected
> Jul  2 00:43:48 gaia kernel: [  420.231993] pcieport 0000:00:1d.0:
> PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction
> Layer, (Requester ID)
> Jul  2 00:43:48 gaia kernel: [  420.235775] pcieport 0000:00:1d.0:
> device [8086:a330] error status/mask=00100000/00010000
> Jul  2 00:43:48 gaia kernel: [  420.235779] pcieport 0000:00:1d.0:
> [20] UnsupReq               (First)
> Jul  2 00:43:48 gaia kernel: [  420.235783] pcieport 0000:00:1d.0:
> AER:   TLP Header: 34000000 05000010 00000000 88458845
> Jul  2 00:43:48 gaia kernel: [  420.235819] pci 0000:05:00.0: AER:
> can't recover (no error_detected callback)
> Jul  2 00:43:48 gaia kernel: [  420.384349] pcieport 0000:00:1d.0:
> AER: device recovery successful
> ... // The following might relate to an attempt to assign the device
> to guest, not very sure...
> Jul  2 00:46:06 gaia kernel: [  559.147333] pciback 0000:05:00.0:
> xen_pciback: seizing device
> Jul  2 00:46:06 gaia kernel: [  559.147435] pciback 0000:05:00.0:
> enabling device (0000 -> 0002)
> Jul  2 00:46:06 gaia kernel: [  559.147508] xen: registering gsi 16
> triggering 0 polarity 1
> Jul  2 00:46:06 gaia kernel: [  559.147511] Already setup the GSI :16
> Jul  2 00:46:06 gaia kernel: [  559.147558] pciback 0000:05:00.0:
> xen_pciback: MSI-X preparation failed (-6)
> 
> 
> With pcie_aspm=off, the error log related to pciback goes away.
> But I suspect there are still some problems hidden -- since I don't
> see any AER enabled messages so errors may be hidden.
> I have the xen_pciback built directly into the kernel and assigned the
> SSD to it in the kernel command-line.
> However, the result from pci-assignable-xxx commands are not very consistent:
> 
> root@gaia:~# xl pci-assignable-list
> 0000:00:17.0
> 0000:05:00.0
> root@gaia:~# xl pci-assignable-remove 05:00.0
> libxl: error: libxl_pci.c:853:libxl__device_pci_assignable_remove:
> failed to de-quarantine 0000:05:00.0 <===== Here!!!
> root@gaia:~# xl pci-assignable-add 05:00.0
> libxl: warning: libxl_pci.c:794:libxl__device_pci_assignable_add:
> 0000:05:00.0 already assigned to pciback <==== Here!!!
> root@gaia:~# xl pci-assignable-remove 05:00.0
> root@gaia:~# xl pci-assignable-list
> 0000:00:17.0
> root@gaia:~# xl pci-assignable-add 05:00.0
> libxl: warning: libxl_pci.c:814:libxl__device_pci_assignable_add:
> 0000:05:00.0 not bound to a driver, will not be rebound.
> root@gaia:~# xl pci-assignable-list
> 0000:00:17.0
> 0000:05:00.0

I'm confused, the log above is mostly from a device at 0000:00:1d.0,
while here you only have 0000:00:17.0 and 0000:05:00.0. I assume
0000:00:1d.0 never gets to appear on the output of `xl
pci-assignable-list`?

Also you seem to be trying to assign 0000:05:00.0 which is not the
same device that's giving the errors above. From the text above I've
assumed 0000:00:1d.0 was the NVME that you wanted to assign to a
guest.

Could you attempt the same with only the single device that's causing
issues as assignable? (having other devices just makes the output
confusing).

> 
> After the 'xl pci-assignable-list' appears to be self-consistent,
> creating VM with the SSD assigned still leads to a guest crash:
> From qemu log:
> [00:06.0] xen_pt_region_update: Error: create new mem mapping failed! (err: 1)
> qemu-system-i386: terminating on signal 1 from pid 1192 (xl)
> 
> From the 'xl dmesg' output:
> (XEN) d1: GFN 0xf3078 (0xa2616,0,5,7) -> (0xa2504,0,5,7) not permitted

Seems like QEMU is attempting to remap a p2m_mmio_direct region.

Can you paste the full output of `xl dmesg`? (as that will contain the
memory map).

Would also be helpful if you could get the RMRR regions from that
box. Booting with `iommu=verbose` on the Xen command line should print
those.

> (XEN) domain_crash called from p2m.c:1301
> (XEN) Domain 1 reported crashed by domain 0 on cpu#4:
> (XEN) memory_map:fail: dom1 gfn=f3078 mfn=a2504 nr=1 ret:-1
> 
> 
> Which of the three syndromes are more fundamental?
> 1. The DPC / AER error log
> 2. The inconsistency in 'xl pci-assignable-list' state tracking
> 3. The GFN mapping failure on guest setup
> 
> Any suggestions for the next step?

I'm slightly confused by the fact that the DPC / AER errors seem to be
from a device that's different from what you attempt to passthrough?
(0000:00:1d.0 vs 0000:05:00.0)

Might be helpful to start by only attempting to passthrough the device
you are having issues with, and leaving any other device out.

Roger.

