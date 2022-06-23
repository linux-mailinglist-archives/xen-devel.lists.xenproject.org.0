Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A948C55755D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 10:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354580.581782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4I9V-0006O5-U6; Thu, 23 Jun 2022 08:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354580.581782; Thu, 23 Jun 2022 08:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4I9V-0006KU-QD; Thu, 23 Jun 2022 08:25:25 +0000
Received: by outflank-mailman (input) for mailman id 354580;
 Thu, 23 Jun 2022 08:25:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSRO=W6=citrix.com=prvs=166c34e93=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o4I9U-0005Uq-7v
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 08:25:24 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0654112a-f2ce-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 10:25:22 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 04:25:21 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 23 Jun
 2022 08:25:20 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 08:25:20 +0000
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
X-Inumbo-ID: 0654112a-f2ce-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655972722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=NjywiNvb5PqoOaAfnLLHWPA+CBvHvcnWE3RraIAqnd4=;
  b=Jlq173b3GqB4GPmrAAxdB+XgBjTIB6L5wRmFKBbHTjAFrvxOapW2keMu
   IWN1Tu5+665xt3mwCajw1YZtNTpFFvD4oNHpxHyJAkwarqASThxa7+Iee
   4j6IPwQ7oOsBcWwS2NuP97ev1EUzMIFIJtluQIAbboY1tFQHQrWYP3Wth
   Y=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 74257078
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jXkjVK77mnKEs5Nl/GGMKgxRtEzGchMFZxGqfqrLsTDasY5as4F+v
 mdNX27XPqmKZWT9ctl3bYzk8x9XuZCHmNVrTwFpr30yHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjWVvR0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSsTlt1JPXUkt8QdF5KMQdsBJQYyJLIdC3XXcy7lyUqclPK6tA3VgQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfibo4YHg1/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IE8g/K/fVni4TV5DZ18KfwDt7XQcSTb4J6ul6dh
 z6W82usV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJt//YS7QiMzu/Y5lifD21dFDpZMoV564kxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLT8ZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:kBSp9KN/xIpokcBcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBDpTnmAtj7fZq8z+8P3WB1B9uftWbdyQ+Vxe1ZjbcKhgeQYhEWldQtqp
 uIDZIOb+EYZGIS5aia3OD7KadZ/DDuytHVuQ609QYJcegFUdAC0+8vYTzrb3GeCTM2TKYRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYo4LSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+cwjqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0G/Q8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMn5
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvsH+9KK1wXR4S1bpXUN
 WHVKrnlbVrmBKhHj3kV1BUsZKRti9ZJGbFfqAA0vblpgS+0koJinfw//Zv70voxKhNNaWs2N
 60QpiA7Is+KPP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="scan'208";a="74257078"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iL8aIN3wJ7cPzXI8qHuc0KZdMsJ6gd5qgRwlmV3lLnmeluQrSx73IX4mUBP86RAXqS4tPRtShIAVczzS86jbaq7p3BbH/cH9vwgtyO12RWJ2rK5BjEIPXBH+DJdJdJ/q6eRh94PwzUK2sEtHSTWbyC+z+RQvwhjVIUj/OGLivVi/ZbJHQ5Bu6SYwKZfk7UZKPxvCakzT9p0yRNjwluF1Dfs/yxNE0yWx95b0vVAiN8OMB1MKhf36v7uQjM7ZXAR3HIO+VMqSso1ZdRf/dB5DOOfm4onlFiPra/JT3TWZkPliCDKzpr1cmQrKZynwEYQGB4wRPDe4hR5CvYlMm6HIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euzhKLQqaFSC2Ezhbo0Ek1xKzO4ctm4oHFntZFUVdLc=;
 b=GZEpsL9d8KrvWll+fUW/Z+Omgq152MKC2I5k3qFGSFoN5zrk3CG/r/3YxC5VvKX036SXbECGG7+JOzcT8PRP9NTouN431/oyUIZ4wMYwYorxTCkI9eqrTRJGcOmOVUQO1FrgI9pQd8wZPgRV2vSQf6jmIAAv5cKyIYbHf2rGskyAgSJXgynobOJLk6yS0zbXgu4IqpMT2bLTQmqsIHY+TM/xwACKEoPIwRiLMxptPbfbdfxE47CxpSXhf5JPTlB2GQRz2sIS8mRDRjrSAyDGDT4iGTCkxMjc/8JucV77PWG4tLmalBjptbmYb+GaddCkF7JhvfCyhJLJFabeC0+1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euzhKLQqaFSC2Ezhbo0Ek1xKzO4ctm4oHFntZFUVdLc=;
 b=hBt1RxWje6BWRx+Smhg5wy2IHoU6j/kb0Ae8BfFUxXv3BQWbry35R2Y+siRGqOhoF4UbMHEJf0hk5JpD9YzwiTpB97KrHvSA3i2f90DP2yKoNKwelMQnjigz38cWcX2GFvDTPSz6RBv/A1fmqkqrSrfVJ/oP28fy/+btVmbM/1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/6] x86/setup: init nr_irqs after having detected x2APIC support
Date: Thu, 23 Jun 2022 10:24:25 +0200
Message-Id: <20220623082428.28038-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623082428.28038-1-roger.pau@citrix.com>
References: <20220623082428.28038-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0099.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8378000c-f92a-4cc3-a2e5-08da54f1e91e
X-MS-TrafficTypeDiagnostic: MN2PR03MB5008:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB500872E9450990B5E0AD45DB8FB59@MN2PR03MB5008.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ApsOg2QddOPmUNEeQARYgbum+t93fL12wA2Oz9As92US6dqObtWYgd6wDJluA/LLk/h7SwN9j3q+xpu/cbxp+7J4tCRhyZLEa1N9FFCZvKJ8EKnOAD41mDlKNidUTAKhZ1Rzf4be9Rihem3Vb/kLBGjMdAxAldvg5Ya8PTVs5GlYXodH9+bSPFPhbfzO8aCsmtvQZ5ObBwn5N4E1Y4ZEhYvOHyMGkd1y2IEHTrkIduZlOFAV98t5dvsc7gL0sFWaNcKenl6Da2aj6jmnYfjaUiCXOlZUzQ8Eis04N+R9eTUONyj4RWXE+YBrSG5cG0Ll4cUe+jF2Vdt8vSSFDv8b5Rb9cK+6MWFsAOF+pCvcJJWqsL3sR5BGGGdCpuzBF0DA/0uiVhB4w7U9JbUfHxWplq8UfNc52xag39RfGHHxUZ50DJiJyFmjVklfAGf/yQM5AAKRSG1xdz6LlPNWrdSoRZ0yfKfvXlZ/vQo4MVUcDWMnT0hKNW2XHhgb3jl1Z9FGj8mtStu5Z+ekApxksnFQq+LIRt+m/WAILUUEc57NULSp23F4d/6Lk4I6xyiGXulKYESgJlLVWGB9wMeYuZ5Vm5n92pGjz5BSzSs8hI3fLMXwdgJXSM+gkXpj9ETFSkbp5Pch4sO1IGugJbIm/rFz37T2TCeYqO8exs9fAHZF124nSfpiDyH0nTq8fZNiwAP9AHvK0DVs8wQCpLm4OXKBPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(82960400001)(6916009)(2906002)(6486002)(38100700002)(5660300002)(316002)(86362001)(8936002)(6512007)(66556008)(8676002)(36756003)(54906003)(2616005)(4326008)(66946007)(6506007)(83380400001)(1076003)(26005)(41300700001)(478600001)(66476007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RThCSE03cHZ6WmVFVU1uTUZZY0pYQXhTc1I5ZGlyMlNTNHpHV3R1WXFFZ1pw?=
 =?utf-8?B?VFpmcHlEU2xvc3V1ZUgxc3k5VU1BVFp0ZkRmVWVOYzJ4TkorS1I5N3Q1TXMx?=
 =?utf-8?B?bE14ZjcvSnc4SWd0dGw3T0NOU04zMXdLSE16MXhvKy9jUUkxTi9BK2tOcDlG?=
 =?utf-8?B?WWRJQnR6bzIyYzdKdlpFdy9mTE1ROEs1NUJPSHJuUEp4c0dvVkRRMW5RdVM1?=
 =?utf-8?B?dnVPN2FBcWU4SnhKemJiSVowRXFvZmdzRFVOWWJVTXpwMU9ybnkzUHcray9k?=
 =?utf-8?B?UktIZG5vVjhpOWtqWmI5MzNjeThyU1ltb2w3dlhrbmcydVN3K2xCVGpxTFFq?=
 =?utf-8?B?SEhZa0pCTzVubFBqZXhFb0dDKzdqV1Rtblkyc1FRSmJFWlBmSzVsYmhTMUZV?=
 =?utf-8?B?bEpKRVVUMnd4dTJ5cG54aDA3WWFRYzFyNm01ZW84OUtzTEdXT3loN3RFTXZL?=
 =?utf-8?B?MHpZMy9ndmc5amZFWXlXb290QWZITklIV1dUNk1vZ1hLdTR3aC9vaG42dktq?=
 =?utf-8?B?ZUdzWVcyVUMrUGg1cC84NjJ2Yy9LUExCQllWc3NpbktQaElnVTQ1dE9hazZl?=
 =?utf-8?B?UStVRExnV0NWWGJzbU5WcnNleUNzS0JUNEF1WHdxK3NuK0JnY0kyc3ZTS2VO?=
 =?utf-8?B?bUJjNnFUQnc0Ni9ncldWMWFjaUxtOHZHamV1TmhrREdvaDNGNzgyQlluaSts?=
 =?utf-8?B?b2QvWjVLbE91U0pZVlY4OTY2ZVB4TWFuLzV0YWVKMHYzN2J2K2hYRFhXeEVi?=
 =?utf-8?B?RmcwdnN5QWhMd0lXd0dmbEQzQkZ6MGk3NFArQzNpdG5CbEV0TytYN0Vlb09y?=
 =?utf-8?B?aDJmVFZOREk0dndYNmthT3lUcWRHMzVMVXJtUmFVaUdGcmo3QUlHdStpTmJN?=
 =?utf-8?B?b0N5TU1LQjdPUnFDS3FDQVUrSE1Yck1mTklsblZsTWFraXp2WlhnUVpwbWtS?=
 =?utf-8?B?WUVsZ250QTdxNDNxTXRudktMMFhJSE1oZzN6OXdjRm1HZFBSWGc0UlhRSW5T?=
 =?utf-8?B?NEI5VDdxUEpWYXBVVktFbzBHYXcwZmUwWkJkeFJwQXRyMHAycmc1RC9OV1g0?=
 =?utf-8?B?U2dSS0JYOXVVVnlJZGlTRWJIbGVvY3hrSzk3d1BtWmUwbkFXWkNUM3VobEZ4?=
 =?utf-8?B?aEJZT1BLVU9ZeEJIeEZ1aUUxUzllbWZlY2JPVXpFSkQ0dHhQTzRYUlkvNHg2?=
 =?utf-8?B?SEZXVlZjNWhCTFF1bW1jdlA2Q1ZiZU5jbVlsbjhSZ3FBQ2EwV3haYTZVa3R2?=
 =?utf-8?B?eG1RdGtmdlY1blN0K0pWZDk2THFKcEc4andNZXFCWll2eXRUNWhONmltMkNS?=
 =?utf-8?B?cytZNWYyTzNXQXpOMEQ3MDhFT2g0UmZCQWtLbm01d2U4MTE3V0FuMW1OdWh2?=
 =?utf-8?B?ckFRWWR0VWFlcDZsOG5Vd2JFM0cvWFZvYm8wdnd3UmJ2QXZYRmpVWklVaXFR?=
 =?utf-8?B?RGVyK29COHo2bDlCcGZuVFNvR0JLZUpiVWRVYitwUVFGYlNscEZoVzlET05y?=
 =?utf-8?B?QTExdzBGZElZZzZWMnpiTUVXcWR3N1g1bXY4ZWl5eFhPT1d6azdLWjZhWlN3?=
 =?utf-8?B?VFBjRjBqM25DWlJBSTB4b2p4YWc3Y29LM3p0TDFWSE93RXhEeGlMOXhJbVlw?=
 =?utf-8?B?OE9xTTQyL3loQ1cvYUVPYzB1UmFCa0c5aTdhSFZyQU80RUE1SWVoeXdTMGVN?=
 =?utf-8?B?eWJsK1hkdko5bzd0MFhwQjRrbkdiZ2RWckxTWkR1UmRuVkxTbDNyUExrKzhp?=
 =?utf-8?B?L05HSE52Ukp4M2RNN1JrQTFFbXkwRWRuakE4SmxZenBpQVc5dGVGZi91RGt5?=
 =?utf-8?B?U2FTS01OS1BkcEtNZDhjeE9pQWxHM1Y3NVdTcUMyd0tXWTI1NXErY2ZBcjhj?=
 =?utf-8?B?NGF2SHVwczRGSCsrVmZ4UnNLSnlUQ2tTYzBCUFEwWTBsaC9INHZHbFVUZ082?=
 =?utf-8?B?ellEVlBNWXEzVjB3dk9iZGt1YVhFTy9mbncxZnBySlBXT1lORkdsRkVzazNV?=
 =?utf-8?B?dmtLcFJLVmM2VjdkWlRwM3BmdkIvOUk3MDZYSm4yTVRYZXNFQ0J4ejNDaWo2?=
 =?utf-8?B?eWttREovcHBOWWRnYm90Q0dNOG9aUFFtTkFvS1dzUXpWTEtFLzJvQVIzVG4v?=
 =?utf-8?Q?jGAT0priU7m4CGmBLjO2sAovB?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8378000c-f92a-4cc3-a2e5-08da54f1e91e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 08:25:20.3172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pbgpvk9SeTPA37xo3J6C3XwxNNra7TJPalWdwIETnmijAujHabhdsKJBtrExHW3NGc+SuoP3OMd2wD551g0cBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5008

Logic in ioapic_init() that sets the number of available vectors for
external interrupts requires knowing the x2APIC Destination Mode.  As
such move the call after x2APIC BSP setup.

Do it as part of init_irq_data(), which is called just after x2APIC
BSP init and also makes use of nr_irqs itself.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/io_apic.c | 10 ----------
 xen/arch/x86/irq.c     | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index c086f40f63..8d4923ba9a 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2653,16 +2653,6 @@ void __init ioapic_init(void)
                max_gsi_irqs, nr_irqs_gsi);
         nr_irqs_gsi = max_gsi_irqs;
     }
-
-    if ( nr_irqs == 0 )
-        nr_irqs = cpu_has_apic ?
-                  max(0U + num_present_cpus() * NR_DYNAMIC_VECTORS,
-                      8 * nr_irqs_gsi) :
-                  nr_irqs_gsi;
-    else if ( nr_irqs < 16 )
-        nr_irqs = 16;
-    printk(XENLOG_INFO "IRQ limits: %u GSI, %u MSI/MSI-X\n",
-           nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
 }
 
 unsigned int arch_hwdom_irqs(domid_t domid)
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index de30ee7779..b51e25f696 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -420,6 +420,16 @@ int __init init_irq_data(void)
     struct irq_desc *desc;
     int irq, vector;
 
+    if ( nr_irqs == 0 )
+        nr_irqs = cpu_has_apic ? max(0U + num_present_cpus() *
+                                     NR_DYNAMIC_VECTORS, 8 * nr_irqs_gsi)
+                               : nr_irqs_gsi;
+    else if ( nr_irqs < 16 )
+        nr_irqs = 16;
+
+    printk(XENLOG_INFO "IRQ limits: %u GSI, %u MSI/MSI-X\n",
+           nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
+
     for ( vector = 0; vector < X86_NR_VECTORS; ++vector )
         this_cpu(vector_irq)[vector] = INT_MIN;
 
-- 
2.36.1


