Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209CE6D0298
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516594.800966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phq8J-0000Fo-C1; Thu, 30 Mar 2023 11:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516594.800966; Thu, 30 Mar 2023 11:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phq8J-0000DY-7r; Thu, 30 Mar 2023 11:07:55 +0000
Received: by outflank-mailman (input) for mailman id 516594;
 Thu, 30 Mar 2023 11:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiWc=7W=citrix.com=prvs=446b09b9a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phq8H-0000DS-PG
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:07:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1af6a39e-ceeb-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 13:07:51 +0200 (CEST)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 07:07:41 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB6054.namprd03.prod.outlook.com (2603:10b6:208:312::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 11:07:39 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Thu, 30 Mar 2023
 11:07:36 +0000
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
X-Inumbo-ID: 1af6a39e-ceeb-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680174471;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ohSQm4dtYpRsyGDHEm/B1n+Yw/5Q8ORtjfSR3pJ0OWI=;
  b=AsRexCgl1uVsqwLPjohUgQaU7PP97MYKm+0gjeZzXGBxbRnAKzr+uI1i
   1mF2P0wuzbU2xwwblEurzS9jMFlV8MgQQ+DWtNz44aUpdUY2+FCYeFdbO
   G9BcVNDyVLSReQV/M+QOeKxrseZykLideXmOMiokfj0yF8RM2sJ50GQ9b
   E=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 102464085
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+Z3RHq3c2KZGBfNqEPbD5fVwkn2cJEfYwER7XKvMYLTBsI5bpzRVz
 GIbWG/XOf2NZjHwLopybIq+80kP65SAx4dkT1NspC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdlPagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJU913
 7tFDmw2dTvSq+6yxI2lT+9giZF2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1MZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13rWTw3+jCN96+LuQ5MJJoH3M40coBxQKV3WCmaCGjmKQVIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZhxrZcEitcQ2bSc3z
 VLPlNTsbRRwtJWFRHTb8a2bxQ5eIgAQJG4GICQDFA0M5oC6pJlp102QCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:/U2fEqOPmT0jhcBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="102464085"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5XDNVDQEJT7O61dswpRDW5XokIt0MEvYATM9I0cuoLPS1/81vU4sRgRb5bz6ea0CCUacR4OSzQ2rXYWJ9jihkJzTF8D2puV+J+AR1i9oog57NGIM7tZ4L0zKVq79MybgVwOzbhFKytkjLTJW/ZGMRDcXmWoZ1yoE1GGXmLXPPx0ftLoxIfcF0Axeu1gXkFWyCcOqDimdEFSGEkHsiMp9z5nBcHyUjLy23Tz1qVaV18wIKCSnJbkYuTIVJuJhHq2eqiP+fIz8zAWEJ53iM25fWk96T2dYBDQtmMR4CXV89y36lyqwzXljxMko3asQjC29rV7pkuyGRnSzTZUZx1REg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiZrw2W1Hr38wUeRuXjhdbDHN/AfPOdaPN12I3VGs7c=;
 b=WMeSYDcnkfT5cSwZgUm+Hvc+1uy2AwT9Gr7bw3XL5kRnRx5BEmLJc7wnY2YluBlmiQuDl3c3htqVYnLVE7xAmjpMQC9rNhrc7NZSnJd+E3nyw75kaW/9eypSrVh+yRAHinbtjMk4yNDEVIUm6JDFJ2i5ay+l0zldd5e6SZ7cx+hj93dteqRkRNVLFZB0vH/9asCAcgYgioJ9YE4Rh+b/NytGHvGWvhXcuOozKdw+GN4+pqD5l6oj1sH94whtBL4vZaPTUU6P2nV0HOFyNBpdwG5rAixdocCUax/yCgj6N07qvBQgyqGRe44kc9DVlQatW/Drk8ubgZiIYYXn0WSxqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiZrw2W1Hr38wUeRuXjhdbDHN/AfPOdaPN12I3VGs7c=;
 b=u1vA4/cZaYTzPHje/oCeeu+xmIRKcPfy8btc07GVTKD5mBW2A77bFpQ6uMTCVopirOi3MbgldkMaC6EIuMHSB84ciKyQ7jA0+ktVHw91tMWwCJTg3Nik6zVOy39R0upsdHp2q5INNGoLdfNOqfnBX5TY7sE34460sfUVj3MNKyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 30 Mar 2023 13:07:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH RFC 0/9] x86: Merge cpuid and msr policy
Message-ID: <ZCVtcR5u/14/WmCU@Air-de-Roger>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230329205137.323253-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO2P265CA0040.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::28) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd2e1fc-36de-4587-2809-08db310ef812
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YnRN9d5h7a11KN/XpFxLh8LlLSQd0KTktSqVY6MmVcJbXci30f4w1PprulPk+Q/Nj9e9ZJNiHPSrRRBtUHWh4xwMrPalLZ5Tkfsj/BiZ2+6fCsWIPWDzGsJa21iLobJYeCRRkgY+wmYjamLem87EpF0v6rGWpuvLRySj1AvfCgcoMLTcJzmC1HfPnaaM3CUeNz3epcy39/zMpXpZj6yLwEgKKTIwEkkK31d7giUd/gRATH/Nb9Ug9ayc1vJ+Yfa49T1jUBzUt7U1F6dZbLlnl+6eTTHPdPzu61BKUkoQ/Uhz/+6w2ikWPT7++IkkGUC3G1KfTIoisovkgsUHJZt2grMNGFyadIQLQCVCYRUasjlV7qBP0JTWk1yELpSeaSuaYoX7xjDHpCc+yzmakHhLY2B6qBNuNYbl0wLO+c5sOfiP/zFuK+fOyvOVKpwihFwz06Gx7q47cZlFLR3tYVHYfivkD0nwBraGduRPTKRYIElH0NxJR8n3/Hg8lLT4jod9aS9XiCdPfJROsIzvlsmybpcsm1RoPqrnb6DTt/bcjkS6wZMKr9cfjvI3xhBUvbRc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(6506007)(6512007)(9686003)(478600001)(6666004)(4326008)(6636002)(54906003)(26005)(316002)(186003)(66556008)(66476007)(8676002)(66946007)(2906002)(41300700001)(82960400001)(38100700002)(5660300002)(8936002)(85182001)(6862004)(33716001)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWZJR214TlZvckEyYXhTSUwwVmRiZGFRREtVV3MycE84V0JhaGRFWFMwbG9o?=
 =?utf-8?B?UXQ0NUtDb3d2K0Uxb0REbWc5V29hbXlPd1dnY1FBeHlJRHdMTHNxYWUvaFhn?=
 =?utf-8?B?N2FmbTZnRThoMERnV1hsR0VPVTRGK3ZTbVVpOE55YWFIcHJZczVIQmNqc29n?=
 =?utf-8?B?UDVrdUFYaHVXcWlQbE9EaUd1eTNxZXErcmxGVElhNDBtQUxld3IwaTRhOTAv?=
 =?utf-8?B?Q2VqaWdoL0RxbVk0Nm9lb0xyV1h2WG96OU9XYlNDTlFCU3VYZEFtZFNkcEY5?=
 =?utf-8?B?Z2RJYkFQTWdpSHRVTmpFb3U3QzRMZ0lYOTBESml3Umt2a2h4K2FRNjQ1TXp6?=
 =?utf-8?B?RmtaUXUvSTlIeWQxaUZabzRrUzlpK0lBVHdwTlplakIxRUJxZG9DZzJDSVlR?=
 =?utf-8?B?K1JnUHRyZTZZVDRJMytUMzh4U01UWS9JejJuZSs1SCt5VjloSTBwUW0xc2NH?=
 =?utf-8?B?T2tHYVhXd3pzUXNBNi92SGx0alFtMW41SVBXSUVNaStTaDlyVjNnTjlnZ1ZQ?=
 =?utf-8?B?YmtacE5LNlFzVXUrbVVzQVd5SUlyL0ZKV1pzRnlRQlVGbXBBbmpJS2JKaDZi?=
 =?utf-8?B?N3BDQ3lFYlFxVStLK3o3aHRXemtOQnZuQUZlalZPd3lWaDZTUk1tWVJCOEt5?=
 =?utf-8?B?U0c2MHJwc0VLRWR4aGlPM3VBNkxCaXRScFkrK0RoYit5eVc2SU1WMmZGM1cv?=
 =?utf-8?B?Qks2SEJRVFJRdmZuNitZQVVIVUF6cEVtR1ZRRTVqbWVFTzkrSHZ3cWluVktX?=
 =?utf-8?B?bU9jMHZaZk9VZmtmS2VmMkppZHFWenVEZFlVWHh4S2R0QlF3WnBNcU5WczRJ?=
 =?utf-8?B?QmY1WWNOd053U3FHY2JkbzJOaVRUdjVvSURaaU9TazBBQTROSUlteG0rNzBs?=
 =?utf-8?B?R0RFNEdQQmFvaTZIbThURyt4VzQvSFh6ZHVxMG5FcUJtUTI1elRkU2RaVERX?=
 =?utf-8?B?OE1USUZxZDl2ekk3RDRaYjJ0VS9aYVNySjFTQmxuRGh0QWF6aVBRU0M3cHBm?=
 =?utf-8?B?cmZhTTlBdkNpcHFaMWZNdHE4Z0JrVVkwUVk5N1dWSjBkTjJNOENLblRIdWtN?=
 =?utf-8?B?OWl1cVpiOFdqell4cnE2VWhtTkhIcEZubmhZeTdVNkwyVCtTdG02dE9aNE5F?=
 =?utf-8?B?T2p4dXA4dmQ5Vi9KajE5RFlOMGI4WlNQTS85dVBFck5yUE1wR05kRUJud2ZU?=
 =?utf-8?B?RTdzOHNzcS9FdVBZdWtaNm9DbzdaU3pJdXY4T0Q0T0k4eHdERHBvUWl2NmJK?=
 =?utf-8?B?MmxhbUlUek5yQktxaVdJMGc3YUEzeGdBVzdlUVowV2R5eGVsUU1sWEw1OXBL?=
 =?utf-8?B?bkRsVEFTSzRSQzR3SWQxR2Y3aUQrRzg0cjFPcHZMMmNVWTNqS3hHM3JORmkv?=
 =?utf-8?B?cDdXN0R2SkNhWXZlZkYyRnZtT25aTzNJUnhNRWZiTlkycm5sbytFV0ZHT0d5?=
 =?utf-8?B?N3VyUVhpQWtJRW9PcEFhc0N3MHJIZVZXY3dkV2kycVBvOG9UTVRLN0JWQnRn?=
 =?utf-8?B?SHFPd0swRVdnR3VINkNQWjVsV2ptWDNqdTE2SWtiNUZRR01QVVpCbXI0ejlB?=
 =?utf-8?B?UnlaeHV4R1MyTkgxVDVaUjRwbDRwVDJFemV2aHVhdmNLcmVIMHJFMmwvaHZ1?=
 =?utf-8?B?bUhKc1hJaXA1TTczNlJzNS8vSjdBUFFFcFJQbjd5U25qMWs5QUM2YlFQbkJR?=
 =?utf-8?B?QW9aZUdBTFYxUGU2WjIwRnM0S2N6MFlBaU16b1NTUG1kbnRlZFJ6ck9rb2d5?=
 =?utf-8?B?RlRlcll2VVpUYU56WDlSeElqUG95d0RIdWtyMXREUnBlZDdFNVYvYkhCR1N6?=
 =?utf-8?B?ZjVHVVVCcnV2NHFQTWpzazJJMWJ6eWc0cUhzMi94ZnBrY1VBb2U1TUtrYThC?=
 =?utf-8?B?Tkt3YlA3WXMyS2VWeitoazVTeWlMSWMyRGZGQ29ER21ZMHJFOXlOT1hsTHZK?=
 =?utf-8?B?NGpNbGgxRk0yTm5UMkhrY0pRdHVFODdXZ2g3eEZkakN5RXoxYllIVnBpMTkv?=
 =?utf-8?B?ZWgwd1NhYlJHK0VjTEp6cWU5OE82NGJURlRiaGU3K0lEQkNmMFE2MS9BeG44?=
 =?utf-8?B?Q2w4MFduTkZtWlM5QXNoOUg1VHQxWGNCQzlIMFkyQ0Z6bWVhWkgzYjhaajFX?=
 =?utf-8?Q?FgI1IMZyBA8tuXtSbcUKuVEp1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9T7f6nn453LpsKiJRxkMJouxrRDfdKeemPRWso5IfhZoCwAUUUQDPjEZsAM9grPMucNYvmZhz5Bxzbq6B1VFK+j8DcM/IvV6zNNMsLtbQMqJHro2NK0BEmewJAEd3ybumLYt5TB8UdLlrYDo6J55gZ5/31YAbnFm3GAd4dIdSc7Wb0suyRfQ8MDFUxalg9I8NOVg9K8NOknLZTSt8XlxnzDZgbhBQrNbnqJNb4jab1gVsDJciFmg5r8yJ6jF4FXr83y1jbZdwBcZVuTy475asRPMri/AVxk9FvrkStMhO6PiVyYs7MTlzSiQnh7xLcP87JwodZHMpsoeG/I5QMfaU4W2nNkPXDTpzYIsEA4rvz/428MHxooPtfCsq/O0KdD+Ox/dyJjH3TZGPPVNs27alwg3xFtnisgqspMF6K7+RhbMkgG1tHD2IsISA48hzjwktwTMK6aVrWm/tXyPDP0i69soJqkf/A6nrQknR7IFHBVekvMw36AA1DkbGmPz8PUJYN6EO2PdBJxn29m0I9qi/DhUSDrNbescf5atEaUZS5d3dspE72ITjtp8BePp35NOiDT5xMiSW0KxR1bEHzc3E6xHahk22LPM0T2ePo8ReDjS9V346HdqCMAHN8tummIAwEG4AYOjB3stEwlSrYFjhURZFMqAsqIpedv3wOe0W1cM5QSNyglAFCxabw9f5qncb+13JinHEkVZzjyPH9UcrEKEmEhKrnNBggCRbTf3LbY/f7k8I+JWg7Sz7RkJEuihPKEEkky/vlibDRfzbfdx4yDsyAlIKJxCkxw9BuHiZGkBflA7nWACRQCo9Qm7+DNLTcTNKAi43G99/P88XbrPNw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd2e1fc-36de-4587-2809-08db310ef812
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:07:36.6799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wI0jmPc6oQ/kPDvpwZuDNtRcsfkoaYBVy6cmDxyGW4T4LA1llxihnA5otn82v69wlW4gtE4+YACOIfnMgG1rqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6054

On Wed, Mar 29, 2023 at 09:51:28PM +0100, Andrew Cooper wrote:
> tl;dr to add MSR_ARCH_CAPS features sensibly, cpu_{featureset<->policy}() need
> to not operate on objects of differing lifetimes, so structs
> {cpuid,msr}_policy need merging and cpu_policy is the obvious name.

So the problem is that there's a chance we might get a cpu_policy
object that contains a valid (allocated) cpuid object, but not an msr
one?

Or the problem is rather with the domain struct containing separate
cpuid/msr fields not encapsulated in the cpu_policy struct?

I don't think the current set of cpu_policy operations permit you to
operate on incomplete objects anyway.

I assume you are worried about the usage of x86_msr_copy_from_buffer()
for example that could load data into the MSR_ARCH_CAPS field for the
msr object without checking that the corresponding CPUID bit is set?

> But this does mean that we now have
> 
>   cpu_policy->basic.$X
>   cpu_policy->feat.$Y
>   cpu_policy->arch_caps.$Z

I'm not sure I like the fact that we now can't differentiate between
policy fields related to MSRs or CPUID leafs.

Isn't there a chance we might in the future get some name space
collision by us having decided to unify both?

Thanks, Roger.

