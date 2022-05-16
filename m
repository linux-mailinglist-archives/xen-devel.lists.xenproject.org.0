Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BAB5282EA
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 13:12:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329791.553054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqYeF-0003eO-Kl; Mon, 16 May 2022 11:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329791.553054; Mon, 16 May 2022 11:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqYeF-0003bU-HT; Mon, 16 May 2022 11:12:23 +0000
Received: by outflank-mailman (input) for mailman id 329791;
 Mon, 16 May 2022 11:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1taX=VY=citrix.com=prvs=128915162=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqYeE-0003bO-CI
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 11:12:22 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d2a79a8-d509-11ec-b8b8-f95467ff1ed0;
 Mon, 16 May 2022 13:12:20 +0200 (CEST)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 07:12:10 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DS7PR03MB5560.namprd03.prod.outlook.com (2603:10b6:5:2d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 11:12:08 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 11:12:08 +0000
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
X-Inumbo-ID: 0d2a79a8-d509-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652699540;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=qJZGoQtMUosnahodJXNGxNsVTEubzDhvaXimcToqeNY=;
  b=JmoN0/IIYVltE/mJTYl3Xnl8/4rzXJ8PZdciQUKVXWus2W63DSfOeVm7
   yXS5JQ8bWq1ThwnZ7ZcC9WbFf4uk/Y4c8W28SC93dJ3Ic4gv+J7KsHcGI
   saisptqMQ6w5xrsR2jujFms+khvV052xSaXVoYxFQrVWqO5EoiM9iiYpk
   I=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 71788102
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MjpUrKvq3Wo+yeAahq8cI7p3gefnVCFfMUV32f8akzHdYApBsoF/q
 tZmKT2EPqreYmb0eoojbou0phlSvZWHnYBiSFFs/ihkQitE+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17U5
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8XHoDrt7g4YyB5UBwlN6ZMwrLuC0iW5Jn7I03uKxMAwt1IJWRvZ8gy3LYyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IFmm5v2qiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3M+vpnujCJpOB3+L/sAfTbWNnQee9yg3uDg
 2ns7mnhUw5PYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQv3qsrhMaHd1KHIUHBBqlz6PV50OTADgCRzsYMtg+7pZpGXoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd14Cd9e3Yq
 9xSkBUDug==
IronPort-HdrOrdr: A9a23:CUnlHah3ToZWKsFK2SKBOqRErXBQXzx13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hoAV7CZniehILMFu1fBOTZslnd8kHFltK1tp
 0QDpSWdueAamSS5PySiGfYLz9J+qj8zEnCv5a6854Cd3AIV0k2hD0JcTpzX3cGMzVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP+xA+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlXAnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDxOIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ8e1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh57D3xHklX6voIRiKprzOSI
 JVfYDhDbdtABinhknizyVSKIfGZAVyIv+EKnJyyfB9nQIm30yR9HFou/D3rk1wiK7VdKM0md
 gsSp4Y8o2mbvVmGJ6VV91xNfdeNAT2MGPxGVPXB2jbP4c6HF+Ig6LLwdwOlZGXkdozvdMPpK
 g=
X-IronPort-AV: E=Sophos;i="5.91,229,1647316800"; 
   d="scan'208";a="71788102"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ty21+rlkdHzwrhvrYoW0pZl3NPk7vUcRBCx2k1pcbcDquVZ8ScVsP5Uh4VZEZqDTEBBVQf3koEqkMz9u+w1xI1B4nXXvnzTCUQX4CUQ3cFpja+p2PE1shGIj2XvEa9hIcuNKab0VFuL3j1UzGPPtP97r/63e77rcNVUeHf7Aiedbzg4t2NUspkKjsAcx9UJA1LE4HdI+k/ZqWOlUhjaGpSjWr2xyWnAXBV1ehSf3pTRrJ8hdmSQVWpEHalJ3L5BPbPO5kAkDLSE731BDFQ5V7llVTVS6VYLfqCiMytB/8e4/YF/A179sgZ9NFNKEG37wmGTgFivThqpyu/4T9dGpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhCkh1FZ1F5zJ5J/ndjap8DJe5PWS3yWzz3ngommb2g=;
 b=UUyelrA/DpS2Yd4+vanonIdwaE60/fBd0NESMSsIF2tlGcrwbN5dX7BpIDvGxk/vCCQWk9TqjQV1CXknaljZXVpDuRB6pPMifY21FEqXt2//R0qIEsIRbd4fIZDxVbcEvCSnXaI6GHtb/72gIbbg7yxeOy+axRxss8lCggIfVRhekMBt5xeRUX9jbkopXtY929CWQvhwh6M8lcpghbD31C00RJYMymW6hUriop/11g6yVveaFLDw5FPkv1iG49CtHHnX1KkeZawVEfY3cJIpulok6zMezW7ghr8Tf6gUaRKyEZRBc3pdnBZSYTvOJOE0K16Q/n+7tn3jpRAc7tIgMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhCkh1FZ1F5zJ5J/ndjap8DJe5PWS3yWzz3ngommb2g=;
 b=gGLjRKM470+dY3a95HbVfnrgoOpkIY4EjN9pZg3PrCv6iwCi10ay0Hp8yoqXJ04VpYq2Oc8Ud/6j2n2XmerMc1BywxB9VfpdNxX+hf6E4zD7e4Eg+4LADANInahXkO5dkMbNINb9jFUJhP/q2zrMBGzwdEpcswRiHGeEoVLj7C4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/setup: delay setting SYS_STATE_smp_boot
Date: Mon, 16 May 2022 13:12:03 +0200
Message-Id: <20220516111203.26463-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0070.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c6ecf28-500e-4804-6eda-08da372ceaa9
X-MS-TrafficTypeDiagnostic: DS7PR03MB5560:EE_
X-Microsoft-Antispam-PRVS:
	<DS7PR03MB5560C3EAEA56A6D6C46192968FCF9@DS7PR03MB5560.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y2N1RrSsZ/t7ZXwmH/naG/j2vMb9S1qZJFLXLNpGChCjVaTPkTKKb0caZzJ8aRe82ecgcKqNIfcX4uviSp9iiUgpHV9FPub5RcA0/3C5pR5ZR6PkMyz7u7+DWPzUyo/9wPBEOhbDC/GEp7I2YSgDWaNNjHKRmMEY9XNAsN3xT6XGQAsnevZEi801HrocQVYtgaa2yw/1mFEZ35o5cHbuYcybZTMHa9yOEX0nNywnNldsmqRyWlWdOiR0RvCBN4yaLasN1D8y8CYU6RSnGBHR/RTtSD8hZtbPAc5WYgE4tzoYnw0SRbrPdNwxkBzdYXxDVwelTyLnkAGgtEFz1K/HwWeuKxDS6+p33Gu16TkQlOAf6fazz1xx8vAWogvCgXMHkTO7XJllMgRIhKd6eQb8ykqnWP72bZz/aKEwhAGcj2EEzwVVJOkWShrMUhouX7rV2i6nIzxI+6FDk4cpNVDY4NX2kv3/PR/aHDyE5K+YEFH+YNguYOQe+sLEmCzSt5We5jSJ5Dm1wdgBtVyGmX3YRu0uANr/oJYXz5FVxImYh0Lnk9Esvbqk3pK+WqbCYZVn/8JLBpbM3vQMfCWnLkL7gLXq6o6w3nFqNe/Z67sHiNSK8fYYm+KjzWND2n9cFvzn0ozDb+vWCUqVem0XAbZqOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66476007)(8676002)(4326008)(66556008)(2616005)(6666004)(1076003)(86362001)(83380400001)(8936002)(5660300002)(38100700002)(316002)(186003)(6506007)(36756003)(6486002)(26005)(6512007)(82960400001)(508600001)(2906002)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHVLMmpLd3BlYmo5MXM0VHBwZVlkdmZqMlhYRHBQTEx3TGtORWViQm9zdDlk?=
 =?utf-8?B?VUNGMUNoUVhsZjJ0Mk1odXhINUp5VHBDTjQweTBVZ0Njd3FweG9raGI4UmtE?=
 =?utf-8?B?ckpNWGFXVnJBNGlUM3U4NC9oSVBlbFltT1liMmdFQ3VhVDZhc3l0RmtoMmhH?=
 =?utf-8?B?YmFiUHdVUkYvNmZlT1VUNFU3VVFCaTlSRkRBKyt1bk5XU2xzUmIwOUdaRk5k?=
 =?utf-8?B?dmZJdndrd1FHblVoNnNLK1VCUTB0SGZyUVdheXl5bnpBci9vR25pbUJPcDVz?=
 =?utf-8?B?eHRZc2IrejBGYjQ2UFVNMFAwZEJ1YVhkc09ESTZLSkJEL3BqNHpmUmN3SjdE?=
 =?utf-8?B?bzR6eEk2Y0o2MXh1YzNNYzZkZnpqRnpNdjdaeHJYbGhxYzhWQ3QzNm9KY1Vm?=
 =?utf-8?B?V3QxTlh4cEtocjI0WUF4bDZVeGJBMmx6bExJZ0l4dHhobzlPRE5OVFJEVElK?=
 =?utf-8?B?a0VueXgzcUsxUi9rOWJCVDhSTmVnZWlrQndLdzVqNnVLVW9RanpCUUplZTJy?=
 =?utf-8?B?c0VpR21RN1N4djFwa2tMWXBUZ1BVN004d3ErUWs5bzVzQ2E3alhvUGF2eis0?=
 =?utf-8?B?Q3FGNDVUNElBZk05bUd3OEtzMXppUWJFSUFmWkNwSHNiZ3pKL2puM0lWMzN2?=
 =?utf-8?B?WjdGdkM2U2xMTVZ6VVZIMENKalloRnViRittQ2pmTlZiVUw5UDJxdzlxa3NT?=
 =?utf-8?B?QjV3WUt4TW0zTllWYXBoc1FoOVY4eVAxNytyZVVUZVZmMmo5MWNQZzFFZGFE?=
 =?utf-8?B?OUNMOU83SE81a2tGcEZsT1JZeW1lUE5oUkc4ZDRES0NORkJqYkxtWm1mYi82?=
 =?utf-8?B?ZXg1MUFyMytzRWhCZkdRZitKUys2UFlKdmsxU2NuYkkvL0orUE9Mdm03Qk5B?=
 =?utf-8?B?cnZ2TFFsZXMxVG1aK0dJUUR4MGV4OXpuOE5qa0FpemJkWGhDUlFDbkl1NGtn?=
 =?utf-8?B?TTJXVm9ZckpUTkxGTSt1SXVqOFFORGZxT0JLY0ZJakRJK2UraGlDOXRqMklu?=
 =?utf-8?B?UFB0bURENnZ5YlpuUlZqSE5FUXNia0xNVGZuQnhQUEVxNU05WlU2ZW95NVkr?=
 =?utf-8?B?UGJXMk1uN2h2WXp3bnJSTnBmNnF1ZWI1SERsd2xMNk5SaWxwV3lYdjZpdXl4?=
 =?utf-8?B?cldwSWdWUi9jVC9jU1JnV0F0T1NtZHA1WmtNYjdYcllhTTNIMlB0V2RDdnVP?=
 =?utf-8?B?QkJ5N3VyOTRZYlJzcGg3SlB6cUlncC9hYU1nTUwzaGRPdUZDd0lNeEhKcDla?=
 =?utf-8?B?Y21jaExTQy9ydnVyR3FROWR6aXJGckFUcHN2eXExck4vQmtRUVZBWERxdlVE?=
 =?utf-8?B?YlJ0M2U5c3p5bXY3a1Nqd0QrMnJXQjNkZTJ5ZnFlR3FBd0NYeTNMNXZyM0NI?=
 =?utf-8?B?VnhUNTQ1YUV2dGRTWDVOcDhvSDM1UjdsUHAreU9kQmkzTWlkbE5IaGh6OENy?=
 =?utf-8?B?MXIrS3VweHNoRW9XbFF2ZFNnQnpKaFBnUi9VVGlKWWx4ajZDZDhvb1ZMa3pK?=
 =?utf-8?B?anl4UVA2NHIvcHh3U3FPOTIzTndvbit3ZDluYi8wTTRvZEdONkpnSG1xcEJl?=
 =?utf-8?B?elhJUVZMWmFUajBxaFd0ekU3NC84U1FuY0ZUOWludHBzVkd6QzlIMi9hUjFz?=
 =?utf-8?B?TlhCOVFmMWVzRmlFYzBBbWEzMXVVV1dFWnNKOUR5ai81Qk5tZnZmV0RGa0JP?=
 =?utf-8?B?eUM4aTRaRkZSS1VLazllT0FqZjhlQkJoS3VPMkRoRDVwa3ZWMWw5K3BiN1FK?=
 =?utf-8?B?dGlFaitIYVpvaXZWeC9GdWczd05GUWQvTTdpZ3pBTFBDMFowQzZZekRUQm5p?=
 =?utf-8?B?aUtPNCsvYUtDSkJmdXRhR1RnWDU2N0NJcEN1TmJRcnhtazkwbUtEMUJkQTEr?=
 =?utf-8?B?KzB2ME9xcWhTQ1hTN2thWkxJVXdoUWxwb2o1WUxTNEhXZlBsRlVVeUpjalhI?=
 =?utf-8?B?WkxIVjA1VVBDTEp5RzJZRjBmVGMxd3MyZkp0dHZoVWFIUVEzWi9ibGhwYWc1?=
 =?utf-8?B?dzlsSERzdWp1U3lVam4wOG9FQ3J6dnBidERpTFZYNnltaGR4bW1STHRyWHFO?=
 =?utf-8?B?NnYwQnNxYkRiQWR2cmFzUzRZNkJTUHZsVWc4M1FHY2dYOUJ3VVU4SjhMdGlU?=
 =?utf-8?B?UDZjU3dWYk9NY1RTUlE1Z3owOHlzUk5ZTFZCd055aGZTUzRLQ1c1eUN3OFJJ?=
 =?utf-8?B?dDY1QU52U1hKMGlBTmVGVE1uS2k1M051Q1IyMjk2MUp3N1cxS2lPN2NqcEhp?=
 =?utf-8?B?clhZR3JUUzN3WTBBYnp2dm9rQ0hwMFB1T2NhRFd3LytQNzZ3SEUwMm9CRHNG?=
 =?utf-8?B?cVRnaWF0VldZRW1oU2l4aU5YcnJOMkFucnRDeWZBSWZMRzU0YVE5OWVzNFhu?=
 =?utf-8?Q?arYzayVzLQTPkRMQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6ecf28-500e-4804-6eda-08da372ceaa9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 11:12:08.3594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRCiBdXwyoFr1uFBF8uXUJHVLMoV8X2lrhU1e/+GXvu8ESiLe1Rzuyo7fzTj31vHDPBiJ67HHN7EHguxzqWQSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5560

Booting with Shadow Stacks leads to the following assert on a debug
hypervisor:

(XEN) [   11.625166] Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
(XEN) [   11.629410] ----[ Xen-4.17.0-10.24-d  x86_64  debug=y  Not tainted ]----
(XEN) [   11.633679] CPU:    0
(XEN) [   11.637834] RIP:    e008:[<ffff82d040345300>] flush_area_mask+0x40/0x13e
[...]
(XEN) [   11.806158] Xen call trace:
(XEN) [   11.811255]    [<ffff82d040345300>] R flush_area_mask+0x40/0x13e
(XEN) [   11.816459]    [<ffff82d040338a40>] F modify_xen_mappings+0xc5/0x958
(XEN) [   11.821689]    [<ffff82d0404474f9>] F arch/x86/alternative.c#_alternative_instructions+0xb7/0xb9
(XEN) [   11.827053]    [<ffff82d0404476cc>] F alternative_branches+0xf/0x12
(XEN) [   11.832416]    [<ffff82d04044e37d>] F __start_xen+0x1ef4/0x2776
(XEN) [   11.837809]    [<ffff82d040203344>] F __high_start+0x94/0xa0

Fix this by switching to state SYS_STATE_smp_boot after alternatives
have been applied.

Fixes: (78e072bc37 'x86/mm: avoid inadvertently degrading a TLB flush to local only')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 53a73010e0..318f02f6ae 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1853,12 +1853,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     console_init_postirq();
 
-    system_state = SYS_STATE_smp_boot;
-
     do_presmp_initcalls();
 
     alternative_branches();
 
+    system_state = SYS_STATE_smp_boot;
+
     /*
      * NB: when running as a PV shim VCPUOP_up/down is wired to the shim
      * physical cpu_add/remove functions, so launch the guest with only
-- 
2.36.0


