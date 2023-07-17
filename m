Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BCE756639
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564627.882186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLP6A-0005nx-43; Mon, 17 Jul 2023 14:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564627.882186; Mon, 17 Jul 2023 14:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLP6A-0005ly-0s; Mon, 17 Jul 2023 14:21:14 +0000
Received: by outflank-mailman (input) for mailman id 564627;
 Mon, 17 Jul 2023 14:21:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVQe=DD=citrix.com=prvs=555fa4c0e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLP67-0005ls-VZ
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:21:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b5c9f4c-24ad-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 16:21:08 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jul 2023 10:20:58 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5383.namprd03.prod.outlook.com (2603:10b6:5:2ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 14:20:51 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 14:20:51 +0000
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
X-Inumbo-ID: 2b5c9f4c-24ad-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689603668;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ikubuGN4M/Jba5bb1Rky3BjPvDWYeDvUznTRsNfeVIc=;
  b=fZ8r17Lun812rSRVn90DYIe1zE+SAkzXw5FqQWhoniiB3QXs8QEtVv+x
   o3mZHYzBCDRca9awBCyMNb5NZ4zgyFR7mUqciIaYOXTZdn4OeMo/YiTeD
   UUE7hyCq2KvqCVz/myFXLa+kKXB78CkygEhslE3l8fPv/fTl69BOUc72W
   Y=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 115763255
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sPcfzK0jmca1trZaWPbD5fdwkn2cJEfYwER7XKvMYLTBsI5bp2EPn
 TQWXTvUb/7eYWP1e41wb4nloxlQsMXQzYNgGwdspC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNnOqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfOEwX+
 Ls1Jz83Yz+Itse0y4C6VbRyiZF2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6Kkl0ZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137KQw3ihBd96+LuQx+VnrXeP22UoMkMxUVCno/u2l2i4VIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZiFFQMwrsokxXzNC/
 l2GhdTyHhR0raaYD3ma89+pQSiaPCEUKSoIY38CRA5cut37+tht31TIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:CmK3qqO0iTU3EMBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-Talos-CUID: 9a23:phgy1m016cmwAQ7iinxjHrxfI+18fzrww3jqLmCzOENrQ4+UVgKO9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3APWNzSg6hNxgYtwixn81WYfi7xoxZ+KmDIlwQmK4?=
 =?us-ascii?q?85e6APjByOTiAqjK4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,211,1684814400"; 
   d="scan'208";a="115763255"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+ber1v6AJ1k7E8g6tZRvcXEXOFI1ikKzcJWF2M16ZEKvPskAwi+k6rk1HiSuffLRabMnBB69sqzl41aP6aYF8N04TJMV2sTmlAIPwKONY2aPK1hnF+DYVl0hFFr9Bnbl2Fv73MzHZnaxUYHMtdR845aCn06gSdHX+vkpScERE2FA3coYH+/rEp/Y5GMh/eH6q4uRhnnUDG4vzZtyQZc4w8C1qWv5meaUzKOx25o4rnI9e1gtNC3A2dU6FmpQyUFDKr126kWsAbWp2JVI5zIkSxFfHohPQe6RuLTvmUuNKNWEvZ42vCm91OqKWrZ0Yy0c66lYPnR0t7gMF4EC8WI/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXj86JbXyHsIAEWITJIySJ0bWw1hmjcuwe63E4Zzk+M=;
 b=CY8DMsDnkD9HajkTanOHXB+kV0YXSL1E+XxHw2/8u1c1GJ/VikPt9HsP9wqof0lzUmkkSGGRccLoIuC9XyrB2nMuldznPqGOOxJdxVL4bp37Tc4S2FkA4DTN8UoZhfCh3YyGz+k1yb9CRwOurs+DCRqqfAviARFCuadCG6H3ZsgCXrlMeK8ahqxzvYsLeplwVApD7QD01DcQjlDpBJPhgdPqO/91uvOKIaVA7iS+tpv/Wl7zUkz91vu8bNl2ZY+KYOZYEsQdP1M834stl8hksiZg9QISheGhIQ/tYWvAmwT/AGtD49cMNFCskGRG7dNyapxMVGhaFCbzz07yu7YSTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXj86JbXyHsIAEWITJIySJ0bWw1hmjcuwe63E4Zzk+M=;
 b=e3N5gpCK1DtB81K0kf97WQJXxl+xtCuJw1U1uq03/ZOHvqH8rMpBmVcvhxyzTqsRZ29dFLU6GSWRh2G6fFYlUk6ZPJG+DVFctDjY+4ZlmPKIiLtutMhcYIVwcV/VSW16mIp1IDR9bUcmNYsEc5WpqbRTQxnGS4Z6LQz5V2U99K8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 17 Jul 2023 16:20:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/6] libs/guest: introduce support for setting guest
 MSRs
Message-ID: <ZLVOPouSilDLdWFu@MacBook-Air-de-Roger.local>
References: <20230711092230.15408-1-roger.pau@citrix.com>
 <20230711092230.15408-2-roger.pau@citrix.com>
 <45c89e03-fe3d-43f0-9f2b-de11ae4fd539@perard>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <45c89e03-fe3d-43f0-9f2b-de11ae4fd539@perard>
X-ClientProxiedBy: LO4P265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5383:EE_
X-MS-Office365-Filtering-Correlation-Id: f15d82f4-7cc4-4ee6-1d4f-08db86d1061f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VlzNC8osIVKAXphoISbiSynGzrhhefk4ytt0o9zjWHc7TQOol1xmIFkm8p7XbaHr8oe3uMOpsPKSbZRvCJo7Z3KOvJAJjPEMThGF/4P/7BrG4io95fJfwEvFC5paqJuvOS2JZNWRL1fdhX1fb2XtBDqvr7QGJderLc06QXLV95c2mc+Ke4lgListoTWAFrzjqXQqpWz7JmF7Gxxh2clO1fKzwNTC0u4zyIXcZwJ1HmoUE/PC33JGCh5zHSu/+Liocwa3fwFhnRZVWUN2oI+0gJnGBp8lLuuqUVFlNgEIq55qIyrM/ijY2GK/lXYKMuyD4QlVwOjtq46IREaV+nYVjBZRiPVx2TWvYBvl0O9NaaNphDf1wPttGmYw6ETkGGz281hsiqcGYjpCQRxmjtLEUUys8YexydJ7x6VrXF44BLvzhZbjqc/1ogap2ehHM+RRLRZ83RXAoWI4UP2rnqr0vGgsn2YuJx+IJua9NNmshvJZn02LTeekWt9dz96Ig/i3vpD1/NFvkVEFP466SNG0AE3fiwgfye234E89jpCx90Yh+5hfAxC5bHCHNU1uSFSl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(478600001)(6666004)(6486002)(54906003)(6506007)(186003)(26005)(6512007)(316002)(9686003)(2906002)(41300700001)(6636002)(4326008)(66946007)(66476007)(5660300002)(6862004)(8936002)(8676002)(66556008)(38100700002)(82960400001)(86362001)(85182001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHZwaWprK0JHLzZzeUNMM012OCtEdDcxV1JncEVxWW41d2RZVGcyZVJNWEdC?=
 =?utf-8?B?N1BEbjJUVndQNDdWWU5FK3BUL3kzUXFBaWVvbjlQUlRWWHJTb1A4dTNoV3dG?=
 =?utf-8?B?aHpUL2xYdUxQUzh4THhiVzVTakoyM2xMZkMwTnlKNnBpL05BNHRyMC96a2ZU?=
 =?utf-8?B?d2pXUUdndy9QOTNIa0hFZ1FJYVhmVmxmUnBKRlJ4VTdJbjF5WnRiNC9JYWJW?=
 =?utf-8?B?MXI3NEQwemRQMzR4YlFkcmo1QUxiUEpUNzlpaXNVbmxuK0ZVeWhHaEVRVmxX?=
 =?utf-8?B?ZnlXVGVDVlEvNjNrRHRxb3FJNUVSWFFWZDYzY3Z0ZlBJdDB3MENVVUw1Q2tD?=
 =?utf-8?B?N3plekR4NDFucFFYR3ZzT3luMG9TWEJkT1N3VjgwSUlxb2xCOCtXZzUwYm5J?=
 =?utf-8?B?MDJKN3B4Nm12VHhtWVV5MUh5TXM1SmE4cEhtdHZpMnBGTUsxN1A0ZzdLNUtG?=
 =?utf-8?B?bCtDSnIrelRNMnpXZWpxa1RSOWQ2cHJYZjMzYUM2QXVXZTJTbWxyVWRtQ0t4?=
 =?utf-8?B?TWl0aWtid1pSOW9oTkI3bldWeTRLM0JyOHdjeTVtRFBvMmw1L1FuQXIwYnRF?=
 =?utf-8?B?c0c0cUZkUXhuK20zaGxUQkxsYzJLTlliUFVPMlJ5S0JsVFRTc3dCMnoyZzc1?=
 =?utf-8?B?UHpscWwzSjJocTFmK0V6N0s3SXN4blp6OG50YnpvYm9UYThJclFOc2pLNTNB?=
 =?utf-8?B?WGl1OStEZHR2YVJBeHVWejUyRUowbVBnVS9OQXhVZWlvckJQKzI4elJmVkta?=
 =?utf-8?B?aHZZMmhpUUFrMGlmb2tXUnZUdEErRFVuMW5NMGYxTU9JdWxUS3FHZzNELzlO?=
 =?utf-8?B?Rm5VMk9EOGVEeCtYS1V6bUF6b2FZRURjSEFRcitNSjR0cXFRRzBwMlkzYlJM?=
 =?utf-8?B?dCtQNGxuTCtHUkpzN2drNUxtdVYrNE5TTUYxNUZjOXJuVG9uWnpQeXUzRFZK?=
 =?utf-8?B?L2hDL2VZSThTUUNXbVpxNmZ3RmFOYVFFZkxYNThEVjBHUXhhZDk0bXFtcnpm?=
 =?utf-8?B?eXExd0VadDdtUVh5OHJBdUtTVHZYazl5VTFqTGJ6ZzVIMCsvRUdQWHd5MUow?=
 =?utf-8?B?c1VDM3ZsSVp2T3VwTnZzUTc0a0s1M1FydHlmcmY3MHd1biszb2gwdnhNR1FS?=
 =?utf-8?B?R0kzRU45ekNlZUlLMGVyMSt1cnFwcVkvYnd4Y0Fac09qRDdGTG9UT3pkVVdj?=
 =?utf-8?B?L2ovSnpka1ZoUmZ5S0hXaGpsb0Z4S1RNVWNhYzY5bW5IT3FiRENZalN1SGVU?=
 =?utf-8?B?M1pETDBWOHRIVXV5ZkVSSTNBK0ljWDNzRkpHUGc5SW15Z0xOUHc2VGdINXl1?=
 =?utf-8?B?aEVyM3FURWU1VUhLcHBnRnhXNEI0Yy84VkcyUXBnK1FRNitQVCtGSG1EclN5?=
 =?utf-8?B?UHdPRTBobDU0QnVNenhzTkdiUFFsM0tlOUdnU1g3QTJPUWlNN1pKNXFOK05P?=
 =?utf-8?B?Y3NnZ3U0WDJ1RFZMSktHNHByNzg2MC8wYXZoUGYxVWlraVZheTk0aTRXazRZ?=
 =?utf-8?B?RXZ5dFZoMlpjcWVaUzhHTEdhYXFvRE83R3hZcUlUN2F4Q3ZvZ2FXdG04ZzNO?=
 =?utf-8?B?b2FvQ0ZlSS83TzAxcnB2eVFkMGhNd1h1K1FGaWRrS01UMzAwMnBVS25LNGN3?=
 =?utf-8?B?TWZKNjR1TTRVREV4OUNnUHRKL0FwMEdzTFpSYncydUl2bjhDVk9GZUhYTGZB?=
 =?utf-8?B?bjVYU0VFSldPclhtTG9hZEg1N09ZQ0ZtYi82Z1kvUW9FYWkzd3ZlV3JVRm13?=
 =?utf-8?B?cGM1YS80M0tKd0pwL1Y2ZUJPWlhsTjl5UVlRcXQ0MUpYVXlBS016OHdBaytE?=
 =?utf-8?B?MnN3V3dxeGxnNnNnTm1JSjBObWxFT2RZZmdPTDRreHU4cU4xdE4wdHpwZzNJ?=
 =?utf-8?B?SEJ3MDhKRVJiT2R0aGJIeVJRYkVmNnJLbEdrS00yOEllVUJxVDlJby9xVDZF?=
 =?utf-8?B?QWtuTkJwNzQwRCt5VVp0eXF4eERiSUJtVS9IQ0pGa0VkMUdxakN0c00rRWgw?=
 =?utf-8?B?L0ZaQThGdERLSHY3QVd0RVVuSXJicEo3Z0NDQVVkcE5SQkFITVEzL0tydFZs?=
 =?utf-8?B?SC9Hc3greU0rOEExZUllYldqVzFSU1hMeHMrZmpma3JnTmxHeFRPM3lxR1NI?=
 =?utf-8?B?RTZNODNhNjY5d0dOa3dsTGppbVVwK2tTQ2UyRW5wd3VyZHd2eFZsc2RKZTJn?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PeP9YJqDwcZfthNm8HM9r3bUTTPBObAfwmM7js7edp9m8lHaoXogJGgGmqiybfDdAFyo9P1dpaMcjHYvesuCEQmXTVNybFRFzogaBIDJIXw/oZQNAP4ZDL+smv4Damzv7S1NvQ/1lt/Fk/zM/CtqZ6UppB3XG4f1lBmKGlCL6hFUQacpW7qLXj/V4oCkYy8axjh9A2J3EO6Dzr+7wRlSahnrMzqsYUX2JA+AkLPmdb2XBrhxXtNlOLH0UFnh3m+nQ3DT0OWNl1Bz1fjXUpk8ClPQc1kjKcTX8XMFUj4/zg9CJ9h8OYJ5yZT95FCYeCO22ptn1bzsysH0GhwkaMWELaGYgivTHUV7MquQa7eBThsgW/wfxGFz600aRdCAl7Hv6H5o0rfjl327I0cuyFvvvkiBLWOXj3S6hfKn8AS6oa2BnB9UGRaLRzUzy6qB8z4eczSieP7OukQTxkRTS073XpdH7PiuF0a05IT/f9Oqw//ASeaJJ0xo2FOLKcTwEzVsfill83/4gkSDlSD91ghysK/VRF7eD5yuQAnQng9HqyLRbAB6NC8/eQvlaJ1gQ+I672oOg2kTiO+AdQjO+pfSarDcGF6QXL1DP+OZ7JNjwoZr9ieWTjJ/DXJltar00OPZ9c//cWfRURg6rz04MABtOvbdEavKidcsb3ZoRPDQ5t37KpRMdLyAReLSmAC+QYrljT/1PVM6NbUv/hsRcGEdqj4L4X42QXUF9zyNLU8UDITNBM8DEm+BbGKHB4bFnFz4oM1NCJb2zMl2/5OMWziTbLXte8F75Jx5Bklvzcnb4y5/eExQpEOTvk07pAGWF0du
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15d82f4-7cc4-4ee6-1d4f-08db86d1061f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 14:20:51.4363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fK7b9Urmwx6LNVKYfQtY68UjeG4bH90uHYQQf1W/clpnylO6VsKZ/GH4GlcWUojl2b9kgAX/LgUNH+cYFlkJAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5383

On Wed, Jul 12, 2023 at 03:34:23PM +0100, Anthony PERARD wrote:
> On Tue, Jul 11, 2023 at 11:22:25AM +0200, Roger Pau Monne wrote:
> > diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> > index 5b035223f4f5..5e5c8124dd74 100644
> > --- a/tools/libs/guest/xg_cpuid_x86.c
> > +++ b/tools/libs/guest/xg_cpuid_x86.c
> > +static int xc_msr_policy(xc_interface *xch, domid_t domid,
> > +                         const struct xc_msr *msr)
> > +{
> [...]
> > +
> > +    rc = -ENOMEM;
> 
> This `rc' value looks unused, should it be moved to the if true block?

This is mostly copy&paste from the cpuid counterpart, some parts of
the code tend to use this kind of error assignation, but it only makes
sense when the if is the code block is a single line in order to avoid
the braces.  Since here the code block already requires braces, doing
the assign outside is pointless.

> > +    if ( (host = calloc(nr_msrs, sizeof(*host))) == NULL ||
> > +         (def  = calloc(nr_msrs, sizeof(*def)))  == NULL ||
> > +         (cur  = calloc(nr_msrs, sizeof(*cur)))  == NULL )
> > +    {
> > +        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
> > +        goto fail;
> > +    }
> > +
> > +    /* Get the domain's current policy. */
> > +    nr_leaves = 0;
> > +    nr_cur = nr_msrs;
> > +    rc = get_domain_cpu_policy(xch, domid, &nr_leaves, NULL, &nr_cur, cur);
> [...]
> > +    for ( ; msr->index != XC_MSR_INPUT_UNUSED; ++msr )
> > +    {
> > +        xen_msr_entry_t *cur_msr = find_msr(cur, nr_cur, msr->index);
> > +        const xen_msr_entry_t *def_msr = find_msr(def, nr_def, msr->index);
> > +        const xen_msr_entry_t *host_msr = find_msr(host, nr_host, msr->index);
> > +        unsigned int i;
> > +
> > +        if ( cur_msr == NULL || def_msr == NULL || host_msr == NULL )
> > +        {
> > +            ERROR("Missing MSR %#x", msr->index);
> > +            rc = -ENOENT;
> > +            goto fail;
> > +        }
> > +
> > +        for ( i = 0; i < ARRAY_SIZE(msr->policy) - 1; i++ )
> > +        {
> > +            bool val;
> > +
> > +            if ( msr->policy[i] == '1' )
> > +                val = true;
> > +            else if ( msr->policy[i] == '0' )
> > +                val = false;
> > +            else if ( msr->policy[i] == 'x' )
> > +                val = test_bit(63 - i, &def_msr->val);
> > +            else if ( msr->policy[i] == 'k' )
> > +                val = test_bit(63 - i, &host_msr->val);
> > +            else
> > +            {
> > +                ERROR("Bad character '%c' in policy string '%s'",
> > +                      msr->policy[i], msr->policy);
> 
> Would it be useful to also display msr->index?

Why not, will add it.

> > +                rc = -EINVAL;
> > +                goto fail;
> > +            }
> > +
> > +            clear_bit(63 - i, &cur_msr->val);
> > +            if ( val )
> > +                set_bit(63 - i, &cur_msr->val);
> 
> Does this need to be first clear then set? A opposed to just do one or
> the other.

Will adjust, I assume some people prefer 3 lines instead of 4 if you
use and if ... else ...?

> > +        }
> > +    }
> > +
> > +    /* Feed the transformed policy back up to Xen. */
> > +    rc = xc_set_domain_cpu_policy(xch, domid, 0, NULL, nr_cur, cur,
> > +                                  &err_leaf, &err_subleaf, &err_msr);
> > +    if ( rc )
> > +    {
> > +        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
> > +               domid, err_leaf, err_subleaf, err_msr);
> > +        rc = -errno;
> > +        goto fail;
> > +    }
> > +
> > +    /* Success! */
> > +
> > + fail:
> 
> Even if this label is only used on "fail", the code path is also use on
> success. So a label named "out" might be more appropriate.
> 
> > +    free(cur);
> > +    free(def);
> > +    free(host);
> > +
> > +    return rc;
> > +}
> > +
> 
> In any case, patch looks fine to me:
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Will make the adjustments requested.

Thanks, Roger.

