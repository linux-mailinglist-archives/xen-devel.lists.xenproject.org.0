Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CD1762EA1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 09:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570161.891703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOZGi-000812-Ie; Wed, 26 Jul 2023 07:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570161.891703; Wed, 26 Jul 2023 07:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOZGi-0007xk-Fj; Wed, 26 Jul 2023 07:49:12 +0000
Received: by outflank-mailman (input) for mailman id 570161;
 Wed, 26 Jul 2023 07:49:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CD/9=DM=citrix.com=prvs=564dce665=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOZGh-0007xa-80
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 07:49:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e62af5ea-2b88-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 09:49:09 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2023 03:49:02 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6796.namprd03.prod.outlook.com (2603:10b6:a03:40f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 07:48:56 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 07:48:55 +0000
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
X-Inumbo-ID: e62af5ea-2b88-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690357749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=SE47op0HEEDrmbHoTDRhu/OoehIb5+HBrV+++AapGUw=;
  b=bJ1g+sdHHWVisF2Vq13xvGBYOspY9pKiNR5JqUTw1NS2ioS8l40zmI52
   7GoUKuKiw8c0u9lbJXoqVzlLn2XqJFFBNLfSYtbyfbt308IwE72Bt/t3H
   ReKbsAmjYqZqhWgGG5Vc3JvwKkhIPQB1jKXZu32jp1kycWWsUqngpexIb
   I=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 116760279
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Qwp1JaOiqmjUh2fvrR2BlsFynXyQoLVcMsEvi/4bfWQNrUoqhmcOn
 zROCj/UMviJYmDxLYp/O4zgoEIFu57VyoJjHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5AFmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rxeXEJJr
 cdbEQEQQE7Yhr2GzImgU9A506zPLOGzVG8ekldJ6GiASNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujaDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyvy2bGXx3yqMG4UPPqC1MZHo3TU/zceDVotagO4h9y+yVHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAbShZRZdpgs9U5LRQo2
 UWOhMjBHiF0vfueTnf1y1uPhTa7OCxQJ2lSYyYBFFIB+4O6/tF1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:UndslqE8vA4KWb/vpLqEHseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV86faQslwssR4b9uxoVJPvfZqYz+8W3WBzB8bEYOCFghrKEGgK1+KLrwEIWReOk9K1vZ
 0KT0EUMqyVMbEVt6fHCAnTKade/DGEmprY+9s3GR1WPHBXg6IL1XYINu6CeHcGPTWvnfACZe
 ehDswsnUvZRV0nKv6VK1MiROb5q9jChPvdEGI7705O0nj0sduwgoSKaSSl4g==
X-Talos-CUID: 9a23:WBMAm2D8SQF0fwv6E3NOqW0TQvtmS0zA4imLIhCIBV1yUYTAHA==
X-Talos-MUID: 9a23:zaeTtQTkTH8wNeoJRXSrvhNaGeRBpJ31BUVKqqpeuO+hMm9vbmI=
X-IronPort-AV: E=Sophos;i="6.01,231,1684814400"; 
   d="scan'208";a="116760279"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4LFjwx1O5JSwgBCPPMrxtpxAGQ5yQE8P+QELwe252mbJSw8dt+7JTZISkHeRdqaAofMb+Ral4B9nJBfwY6QJfU6ZIY/yMS6JnCyBMwmNCoAWadfV6Mk7aqREWYSvtD31a2iIlJnG73SNFMi617Dl5vVlxAQ+sMYKJeSRB2iMDKhvQ47Kz3JaD1KtKtKkLq0XXy3oMTnZGemUsAdsjgrbned0I1gJyraSBFpGulw0cTzcuYfVP1d0eXqNv5jGbK5ZKcLM+utbjksL6y6O5ndVXPRdThvCwqQBwDcMbP2zDUi1RiBkgJjy3aIS7izYIdedrczJbNsAcgWOLpSPsR74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+MWjzVZzTsodB8oBO+0pO3Mr9z7FxPsIv/eUC+lvc8=;
 b=A+M1C7TIYRai3oK0HnwnzkWGq9ApAMPvWbHXvvC7vYSivezoMTByrOhML1xMr1UKAixbLQHnd4NNPP7tx5hsgdkYefrc0AU0HW70v9gYZCU7jIvKGUyGYH+0xPWNI2I3nmDOtlcejWYDvjuCPbag6gMzEkMbumgn5l1+9UZCHCaX4b8hUMW0GGxtiiDAp4ao9x1UOE34PAJNodaR3vcvOPwKjrFVV/LX6SbSvfBmrmPXu+krheSpp3B09FX3JQlMNVak5cdhO+hH2cvKct/nT7JF/QN+twZ4qVyiUZB2yQsU2f0UUIpHtGPVpPBpMTM5L0SNVU0KZalNZZ5aeTgkuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+MWjzVZzTsodB8oBO+0pO3Mr9z7FxPsIv/eUC+lvc8=;
 b=Y/40WiJOfLA25Zi0fJJ7n/BQHMxpaA6F2ORU4afADk0hdnOUz6TNp3GqHhtn3BS3H/2rintL7fbJqy760+x1H0b/zetNw0XjlMz404IrHbCI9hbsHF0AswQ2vrgcWCvWRcCZstAPBy9gs+iHqDsFub5ymn+M3nodTW54ecc7BEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 3/6] libxl: introduce MSR data in libxl_cpuid_policy
Date: Wed, 26 Jul 2023 09:47:53 +0200
Message-ID: <20230726074753.74934-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725130558.58094-4-roger.pau@citrix.com>
References: <20230725130558.58094-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0072.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::36) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: e212396e-6658-4858-5805-08db8dacc36c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g/0qPe0RP7VxlJqpdhhdgvqkUnKfibmBDQquzwFc5WoRMIAORETuPCsRj/WvOCG/YTK45r4gx7Wfx6we0hZRKkVBbuxfpfARrMjhCCOnybyHLC/O4Ksbi59dftmSgrravbzTemtcUOFK1yyFXnHF543ZgRaRYTN0+/AbabxaEQkG547EF6OrGanr/0ooJwY5px0ls0exWf2XBOsB2Hrz+0gNO3Fvv/6w/1jtrVdGWY7Y+lvubvshiA/cJrssY38q5TLSkzcHlmlNrUWhIFmoyyIq2/K5K5DdwdFYL0pYeKM7uyMFrUZ3HXLzNJFL7mSSXG+s0FbNFLQVy2101OsgMzwYbFmbSSAyKrGrgTwhIToXAL+XYv4gkf3VvdGxOHGy7k+agIshmnEoD3GuH2LUYp2l6Mr3gyzw0OIhirNC8APezf0C9nFKT8YcgOYvdsmtrCQK941E8P9CELHej2ogvc0KG2IGu0HPlzcrON8SVPBXpU9VUJOeNwotRUtvi9G1yUIwmrH9Gm/hQAWkjidXpu12NuC8jKR4HAbqyT0JF7ntMiv/Z7T+EHbUNky27jeu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(66946007)(2616005)(66476007)(83380400001)(82960400001)(38100700002)(41300700001)(36756003)(86362001)(8936002)(5660300002)(8676002)(6486002)(478600001)(54906003)(66556008)(316002)(6916009)(4326008)(2906002)(6512007)(186003)(6506007)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWFRTm5qc1RPOFdUR3FPV29GY0RkWnAwU2d0OVd3NEdLOERDN0dndE5UaUpo?=
 =?utf-8?B?QVRscEhINkxtaWtJZFp4Zm1XOFQzUnE5VmlPbDFCYkxWRmhRWktDZm9ocGlj?=
 =?utf-8?B?NHNRY2E4OCtMY2hFdUNMbFd0MDBSdkJYUmF0cEFrZGIxb1orWVVmZXlaY0Vj?=
 =?utf-8?B?dFkwNFVkRXFzdVVtNWZKWU43bHgvdmNiK2s5bFBsSDY0L3psczZ3OGVhMk5n?=
 =?utf-8?B?QUExS3dCZTZBZzFzODBiVkhJMlIzSzBJZ0gyRUJKZE1jYkdOZnVERVBZS3p2?=
 =?utf-8?B?U0FITjFHZFF6VUtFYXY1VEJmSXlsbEYwUlRaK2dqYU0xK3Jmb21LRmhMTkFF?=
 =?utf-8?B?dkd1NXlvbXZFUU90ZlZ1ZGkrb1gvZk50alloMS9WVzZNcVMvbUVnOVQwTlp0?=
 =?utf-8?B?OFhCVGdkM2RWMklObWFVQ1dsVE1mdStHWW0waDRUaU1QTXR4eHZ5bGtWOEFQ?=
 =?utf-8?B?Y0tFcElzTTUyUEdyUmh2Z3F1WXJBaVFhbU54Rmw5MDVLR3dpcTlaSXUrT0tq?=
 =?utf-8?B?OFVLejIzanFLZnNWZTE4OUJ5cTQ5TCtZUTVMeVozZTZIUm90LzdzU2FLZ3Bp?=
 =?utf-8?B?NlNHNkpXVFNlTm1QREl4MEJsNW5VakxIQ3oyTDdQZGVaQUtUNzJ0YmZLcnhs?=
 =?utf-8?B?WlU4ZG1vQnhvdmJUTnoweHJsalFaK0RvcVBZTnZ6UURnNCtQUzVkYmNmUyt2?=
 =?utf-8?B?Vnp1L0pnUkw5T29VeE1zYU1ZbHVnSHh5RGFNd0ROSDdua2V0dUU4QUNOSlFS?=
 =?utf-8?B?STFPZXFEOWt1Y2JzTkRjQ2VxOG0wK3NvNUpiRmJhNVk0dVc0WWN3VWNTWm9T?=
 =?utf-8?B?a0QyZ1ZhdHlIRzlKRXBuSFJaelpkVWluaStXejBGMU93d0RqUkFiaHdZVzVC?=
 =?utf-8?B?SjNTbm4rU0J4YVVLZm8ra21ETUI2QWxKYmRlVWFNZFU1QzgrM2JMR01nN1c3?=
 =?utf-8?B?bC80a1hsT2xoK3NqTnMveUpzZ011SWdnZTJ0V01MblE0bjFXZU5ob3Vqd3pr?=
 =?utf-8?B?SmNnSnBRUUZ3RWF5TkxFYlZkSEdMcEJUKzUwTDVBcFQxY0dzQjF1RGFZZEpO?=
 =?utf-8?B?SEFCWHMvbkU1OTRxUE04N1JCUy8wNk9uRC9IVEtrekhkTkhFaDlncm1EY2R1?=
 =?utf-8?B?eHl3SVpSMWliQ3BsTnJWaTdrMzRhdVE4Q0pSUGZWbytjV2k0NGxvdEVBMENP?=
 =?utf-8?B?WEN2bGJRUGtvRk1UZEh4QjhiRzdmL1VaaXl2L1B2QkROTHFtU3RZaTVUZHdn?=
 =?utf-8?B?NDR4OVVMcys2QmlSZTFiNnQ3SjQ3S1l4UzA5dzFJRkwzUjV1OXozeStVR3lq?=
 =?utf-8?B?UmlGNlIwQXcwRmpmeXVQOGhOazZaSGJCUWpTY0VGYnVDcWpKbUw0b1hZNVlU?=
 =?utf-8?B?UzlZTE5BWXVmcjdVWGdIWktVN0llQU1NaVc4RzRmOVZtcGM1eGpUWjZkc29n?=
 =?utf-8?B?TlRpdGNHZmJKL1VxbmJLN0Y5QWRNRkFDTVRGN0hBTUJwOUdSNi9CQkZwc21Q?=
 =?utf-8?B?bStZWEErdTdHYmJIZHI5aGN6aW1naElPajJxc0l2V3QvN0ZiZUl0VzRlcGpx?=
 =?utf-8?B?dU1XVmNZUHNHbFFJODhWZnE4UzB1c0IyS3FReG9EdndGWlRQWTdTalVoeVZQ?=
 =?utf-8?B?Q2JYWEJvZUs2M3k2UW1mZHc3bHV6elk3RzJRdWIvTW5QT2d6MmYwTmgydWVR?=
 =?utf-8?B?dkNQemNBbVVqdGJPejRuVHU2RkJSSU0ySnZoc0sxWXc4NVNaUjJ4OE00S0Iw?=
 =?utf-8?B?N2ZWY2VsdXJlV1pFdk5DZm1EQi8vOG56QUswMk1LR1NDRDlVa0ZETzBZelFD?=
 =?utf-8?B?WTNhTTh6R1NpWk5DMTlNRU5pT0ZVRDhmVlBndi9YSVQ3UFNmdG9WSDdJakdD?=
 =?utf-8?B?K0ZiT3JXL0dHTlNpUjc3MzdzTjloVURwakJCSDZSQWE2aFQxVEVHb0RPalc1?=
 =?utf-8?B?RDJLdDZyNGZBYWRhUEpUVm53bkp5bEpKYW8wLyt0TC9aU1BCTjBydU1EYWFo?=
 =?utf-8?B?TGVtUHROTFJjOXVUaGtZRHI3dlluejBVL2t0T1NWRFQ4cGprNjBLeFlJS1Qy?=
 =?utf-8?B?M3hPUWlXempkajVHK3VoNTdaYkFaem1HVjYvdWMwM3ZpQVJrNldDMkIrMUll?=
 =?utf-8?B?VTRnZFBNQlZJY3VSdEFRQm4vdnAwRkM4UVkwQU1Fb2lQWENycE5EM3dBYStj?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ty9KLOHc1xTqpMeu/0hkOYeC4+fXsjCeB/N78UaX/xDEjyX7C5kppjVZVC2CkuDcJOC88qs7I66eLODrqRrpccg3KXmP3gvj5r/UMQG5dAQOmpC3yIa5zvg9kqvpzXzyAV/qJdULkoiqwiTF5yQQMpOVNGUrmIsigIsg2XpUgN4qfgLocK4TQ0Jo3hQfW1WlCu/MMI7D7vi5g+DwueCNd+dls4Btmce3hgY70jClUe79N/ENUnzOgCQ7j8DcWg2Fe0P+3ueimqsQvxGvpj4Ld9antLp6LhFTLtqISwHy3FECJowba0upwCj9TpugoitZaawtqqE8yKvh1Ghm7TwZFg2222FAuBjVcdXqGkty6e6qHUOIQj60Pf5tyx7qOmEzqeL7kn3asuiFudg9+0CX1buPbSl2deVy90SUjRWuWV51PFW9Px3bKMfzYHc3WwhQXw+cvTSbGWu6LkiX52GoHiSAlicH3IUIBjKTOgw4KHLpQorylYCDKHGelTKFP+bg3ErCbs8Gz9gscXrt+dNIK2DrVhDu/mqrnTuAAyIiZgj/ZtQQFr04mESQS5v23EMmzJtBzUbKoumQqDARkIgVIxnu28cVld75bADjGH0yFnA1Ve8IvFyb03kH12u8BIkl4CXE/s/piWFVH3ZsGVPdSXP5VPKyvcGJ++bbiBJ8ecslY9KGOIBSx6RV1/SXA3E1RaJz3QbbZ5rEDcx7RTmSYwkemIYHj/rU0n9L5Z9dDxObm2kla76tCgYAljf8VDW6SOZtyTyLDdcrIIo+GR94D/8bJrOcQdV1pQ2+EUHaXluCEkiNEmAUp30tWNNPZatn
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e212396e-6658-4858-5805-08db8dacc36c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 07:48:55.8953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOgZ0j07XhmOuFXdjiTZ4gcp9z+HH+Am9+e/bh2HYryE6HDPqe6DRydUYRxsemV9E02UGJEWX5h/uE1lACOYzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6796

Add a new array field to libxl_cpuid_policy in order to store the MSR
policies.

Adding the MSR data in the libxl_cpuid_policy_list type is done so
that existing users can seamlessly pass MSR features as part of the
CPUID data, without requiring the introduction of a separate
domain_build_info field, and a new set of handlers functions.

Note that support for parsing the old JSON format is kept, as that's
required in order to restore domains or received migrations from
previous tool versions.  Differentiation between the old and the new
formats is done based on whether the contents of the 'cpuid' field is
an array or a map JSON object.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v4:
 - Add comment.

Changes since v3:
 - Keep support for the old json format in the parse function.

Changes since v2:
 - Unconditionally call free().
 - Implement the JSON marshaling functions.
---
 tools/libs/light/libxl_cpuid.c    | 160 +++++++++++++++++++++++++++---
 tools/libs/light/libxl_internal.h |   1 +
 tools/libs/light/libxl_types.idl  |   2 +-
 3 files changed, 146 insertions(+), 17 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 3c8b2a72c0b8..2b53637e8a54 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -16,7 +16,7 @@
 
 int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
 {
-    return !libxl_cpuid_policy_list_length(pl);
+    return !*pl || (!libxl_cpuid_policy_list_length(pl) && !(*pl)->msr);
 }
 
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
@@ -40,6 +40,8 @@ void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
         free(policy->cpuid);
     }
 
+    free(policy->msr);
+
     free(policy);
     *pl = NULL;
     return;
@@ -516,7 +518,8 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
 
     r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
                               pae, itsc, nested_virt,
-                              info->cpuid ? info->cpuid->cpuid : NULL, NULL);
+                              info->cpuid ? info->cpuid->cpuid : NULL,
+                              info->cpuid ? info->cpuid->msr : NULL);
     if (r)
         LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
 
@@ -528,16 +531,22 @@ static const char *input_names[2] = { "leaf", "subleaf" };
 static const char *policy_names[4] = { "eax", "ebx", "ecx", "edx" };
 /*
  * Aiming for:
- * [
- *     { 'leaf':    'val-eax',
- *       'subleaf': 'val-ecx',
- *       'eax':     'filter',
- *       'ebx':     'filter',
- *       'ecx':     'filter',
- *       'edx':     'filter' },
- *     { 'leaf':    'val-eax', ..., 'eax': 'filter', ... },
- *     ... etc ...
- * ]
+ * {   'cpuid': [
+ *              { 'leaf':    'val-eax',
+ *                'subleaf': 'val-ecx',
+ *                'eax':     'filter',
+ *                'ebx':     'filter',
+ *                'ecx':     'filter',
+ *                'edx':     'filter' },
+ *              { 'leaf':    'val-eax', ..., 'eax': 'filter', ... },
+ *              ... etc ...
+ *     ],
+ *     'msr': [
+ *            { 'index': 'val-index',
+ *              'policy': 'filter', },
+ *              ... etc ...
+ *     ],
+ * }
  */
 
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
@@ -545,9 +554,16 @@ yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
 {
     libxl_cpuid_policy_list policy = *pl;
     struct xc_xend_cpuid *cpuid;
+    const struct xc_msr *msr;
     yajl_gen_status s;
     int i, j;
 
+    s = yajl_gen_map_open(hand);
+    if (s != yajl_gen_status_ok) goto out;
+
+    s = libxl__yajl_gen_asciiz(hand, "cpuid");
+    if (s != yajl_gen_status_ok) goto out;
+
     s = yajl_gen_array_open(hand);
     if (s != yajl_gen_status_ok) goto out;
 
@@ -582,6 +598,39 @@ yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
 
 empty:
     s = yajl_gen_array_close(hand);
+    if (s != yajl_gen_status_ok) goto out;
+
+    s = libxl__yajl_gen_asciiz(hand, "msr");
+    if (s != yajl_gen_status_ok) goto out;
+
+    s = yajl_gen_array_open(hand);
+    if (s != yajl_gen_status_ok) goto out;
+
+    if (!policy || !policy->msr) goto done;
+    msr = policy->msr;
+
+    for (i = 0; msr[i].index != XC_MSR_INPUT_UNUSED; i++) {
+        s = yajl_gen_map_open(hand);
+        if (s != yajl_gen_status_ok) goto out;
+
+        s = libxl__yajl_gen_asciiz(hand, "index");
+        if (s != yajl_gen_status_ok) goto out;
+        s = yajl_gen_integer(hand, msr[i].index);
+        if (s != yajl_gen_status_ok) goto out;
+        s = libxl__yajl_gen_asciiz(hand, "policy");
+        if (s != yajl_gen_status_ok) goto out;
+        s = yajl_gen_string(hand,
+                            (const unsigned char *)msr[i].policy, 64);
+        if (s != yajl_gen_status_ok) goto out;
+
+        s = yajl_gen_map_close(hand);
+        if (s != yajl_gen_status_ok) goto out;
+    }
+
+done:
+    s = yajl_gen_array_close(hand);
+    if (s != yajl_gen_status_ok) goto out;
+    s = yajl_gen_map_close(hand);
 out:
     return s;
 }
@@ -592,17 +641,40 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
 {
     int i, size;
     struct xc_xend_cpuid *l;
+    struct xc_msr *msr;
+    const libxl__json_object *co;
     flexarray_t *array;
+    bool cpuid_only = false;
+
+    /*
+     * Old JSON field was an array with just the CPUID data.  With the addition
+     * of MSRs the object is now a map with two array fields.
+     *
+     * Use the object format to detect whether the passed data contains just
+     * CPUID leafs and thus is an array, or does also contain MSRs and is a
+     * map.
+     */
+    if (libxl__json_object_is_array(o)) {
+        co = o;
+        cpuid_only = true;
+        goto parse_cpuid;
+    }
 
-    if (!libxl__json_object_is_array(o))
+    if (!libxl__json_object_is_map(o))
         return ERROR_FAIL;
 
-    array = libxl__json_object_get_array(o);
+    co = libxl__json_map_get("cpuid", o, JSON_ARRAY);
+    if (!libxl__json_object_is_array(co))
+        return ERROR_FAIL;
+
+parse_cpuid:
+    *p = libxl__calloc(NOGC, 1, sizeof(**p));
+
+    array = libxl__json_object_get_array(co);
     if (!array->count)
-        return 0;
+        goto cpuid_empty;
 
     size = array->count;
-    *p = libxl__calloc(NOGC, 1, sizeof(**p));
     /* need one extra slot as sentinel */
     l = (*p)->cpuid = libxl__calloc(NOGC, size + 1,
                                     sizeof(struct xc_xend_cpuid));
@@ -641,6 +713,42 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
                     libxl__strdup(NOGC, libxl__json_object_get_string(r));
         }
     }
+    if (cpuid_only)
+        return 0;
+
+cpuid_empty:
+    co = libxl__json_map_get("msr", o, JSON_ARRAY);
+    if (!libxl__json_object_is_array(co))
+        return ERROR_FAIL;
+
+    array = libxl__json_object_get_array(co);
+    if (!array->count)
+        return 0;
+    size = array->count;
+    /* need one extra slot as sentinel */
+    msr = (*p)->msr = libxl__calloc(NOGC, size + 1, sizeof(struct xc_msr));
+
+    msr[size].index = XC_MSR_INPUT_UNUSED;
+
+    for (i = 0; i < size; i++) {
+        const libxl__json_object *t, *r;
+
+        if (flexarray_get(array, i, (void**)&t) != 0)
+            return ERROR_FAIL;
+
+        if (!libxl__json_object_is_map(t))
+            return ERROR_FAIL;
+
+        r = libxl__json_map_get("index", t, JSON_INTEGER);
+        if (!r) return ERROR_FAIL;
+        msr[i].index = libxl__json_object_get_integer(r);
+        r = libxl__json_map_get("policy", t, JSON_STRING);
+        if (!r) return ERROR_FAIL;
+        if (strlen(libxl__json_object_get_string(r)) !=
+            ARRAY_SIZE(msr[i].policy) - 1)
+            return ERROR_FAIL;
+        strcpy(msr[i].policy, libxl__json_object_get_string(r));
+    }
 
     return 0;
 }
@@ -677,6 +785,10 @@ void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
     }
 
     *pdst = libxl__calloc(NOGC, 1, sizeof(**pdst));
+
+    if (!(*psrc)->cpuid)
+        goto copy_msr;
+
     dst = &(*pdst)->cpuid;
     src = &(*psrc)->cpuid;
     len = libxl_cpuid_policy_list_length(psrc);
@@ -696,6 +808,22 @@ void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
                 (*dst)[i].policy[j] = NULL;
     }
 
+copy_msr:
+    if ((*psrc)->msr) {
+        const struct xc_msr *msr = (*psrc)->msr;
+
+        for (i = 0; msr[i].index != XC_MSR_INPUT_UNUSED; i++)
+            ;
+        len = i;
+        (*pdst)->msr = libxl__calloc(NOGC, len + 1, sizeof(struct xc_msr));
+        (*pdst)->msr[len].index = XC_MSR_INPUT_UNUSED;
+
+        for (i = 0; i < len; i++) {
+            (*pdst)->msr[i].index = msr[i].index;
+            strcpy((*pdst)->msr[i].policy, msr[i].policy);
+        }
+    }
+
 out:
     GC_FREE;
 }
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index ef882cff3912..b1a7cd9f615b 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4871,6 +4871,7 @@ _hidden int libxl__domain_set_paging_mempool_size(
 
 struct libxl__cpu_policy {
     struct xc_xend_cpuid *cpuid;
+    struct xc_msr *msr;
 };
 
 #endif
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9e48bb772646..fd2f3f6e485f 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -19,7 +19,7 @@ libxl_mac = Builtin("mac", json_parse_type="JSON_STRING", passby=PASS_BY_REFEREN
 libxl_bitmap = Builtin("bitmap", json_parse_type="JSON_ARRAY", dispose_fn="libxl_bitmap_dispose", passby=PASS_BY_REFERENCE,
                        check_default_fn="libxl_bitmap_is_empty", copy_fn="libxl_bitmap_copy_alloc")
 libxl_cpuid_policy_list = Builtin("cpuid_policy_list", dispose_fn="libxl_cpuid_dispose", passby=PASS_BY_REFERENCE,
-                                  json_parse_type="JSON_ARRAY", check_default_fn="libxl__cpuid_policy_is_empty",
+                                  json_parse_type="JSON_ANY", check_default_fn="libxl__cpuid_policy_is_empty",
                                   copy_fn="libxl_cpuid_policy_list_copy")
 
 libxl_string_list = Builtin("string_list", dispose_fn="libxl_string_list_dispose", passby=PASS_BY_REFERENCE,
-- 
2.41.0


