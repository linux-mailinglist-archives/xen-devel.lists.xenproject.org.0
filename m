Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F840511C07
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 17:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315198.533632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjst-0006Tl-4l; Wed, 27 Apr 2022 15:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315198.533632; Wed, 27 Apr 2022 15:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjst-0006R9-0S; Wed, 27 Apr 2022 15:47:19 +0000
Received: by outflank-mailman (input) for mailman id 315198;
 Wed, 27 Apr 2022 15:47:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njjss-0006R1-Fn
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 15:47:18 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f7e5ddb-c641-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 17:47:16 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 11:47:14 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB2957.namprd03.prod.outlook.com (2603:10b6:300:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 15:47:12 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 15:47:12 +0000
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
X-Inumbo-ID: 4f7e5ddb-c641-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651074437;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=m8rPRt5THtYNJBlROCeNE8vtXEzP8FuWFMXOMasodM4=;
  b=H3cmvUbJiGOlosyZm83UwUiH5hBFUBIjtWyEItqUoISgh4kDkRkgoM6H
   AFKdJv9HH07jAsHgzbpJOmj2Nf6aFTg4bTnqERiKTqdxdjDtWcmfVj6j3
   OGoNIN/j5aRkFR2nR9uFqkz/CVFTTVQXR0pZhSR3JSXESgrr3ZgQrkCgH
   Y=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 70055435
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sxMfG66FFxjfaTr040Sr1wxRtDnGchMFZxGqfqrLsTDasY5as4F+v
 mVOXz+DOvzcZ2Khfd91YYjk/B4D7JTVnYVjG1Nlr3g3Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTjXFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSeUEArZ4P0gtgtdDJlKgNbMq5d05TYdC3XXcy7lyUqclPK6tA3VAQTAtdd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YAjV/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IA8A/I+fFqi4TV5Cpu0YDzL+HVRo2xbIJOwU+9/
 kLc32usV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJ4Huw88wWA4rLU+xqDB3hCQjMpVTA9nMo/RDhv0
 0DTmdrsXGRrqOfMESPb8aqIpzSvPyRTNXUFeSIPUQoC5Z/kvZ03iRXMCN1kFcZZk+HIJN05+
 BjSxABWulnZpZRjO3mTlbwfvw+Rmw==
IronPort-HdrOrdr: A9a23:yevEta/VeaWTsTCe0YJuk+E+db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsjaKdgLNhRItKOTOLhILGFvAH0WKP+V3d8k7Fh5NgPN
 lbAs9D4bTLZDAV7PoSiDPIaerIq+P3lZxA692urEuEGmpRGtpdBkpCe3GmO3wzYDMDKYsyFZ
 Ka6MYCjz28eU4PZsD+InUeReDMq/DCiZqjOHc9dlcawTjLqQntxK/xEhCe0BtbezRTwY06+W
 yAtwDi/K2sv9yy1xeZ/W7O6JZ9nsfn17J4dbqxo/lQDg+pphejZYxnVbHHlDcpoNu34FJvq9
 XIqwdIBbUA11rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA1bkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkIMEjgYdq3MMiFX5uYdk99HqQ0vFnLA
 AuNrCW2B9uSyLXU5iD1VMfgOBFXRwIb2S7qwY5y4+oOgNt7Q9EJnsjtbAid0g7hewAouF/lo
 L524RT5cRzp5wtHNZA7Nloe7rHNkX9BTTxDUm1HXPLUIk6BlOlke+G3Fxy3pDjRKA1
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="70055435"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEoWjckPRwNkMhZ7Wzk5zK/H+O8jlF01g3miLpAiXOZbHJQ87dad4UuwQta7HmTAPa3jRjzHmLY6QMI+8Cwn5UdnKz5VAB7LVxChapDJddgFVxetks6Q7qzVphnn6lci8pH5oJf3L+hORCdAWXGzPQPuVRdRcMvvEXJ5RTQhGU6cm/SnHiLHuBFV1J1fYRE0WfV7RKfqmAqy7VK1Gud4U+cFCtp82SkO39LcB3QPoJqDuuQXu9z4f01jOmdM5G6c/VLGvG/P+bGSNWnSwaGVbGKlYTZOanTPno+UuQewTF3KVbcuIujhMWCXhU3iI4vlbLsZJ2mMv/bHVBXC8tsusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unVUOTMEiGDOnk056OLERWvD7aIsW3mOlXPAuysFbsQ=;
 b=h0JMvSb8ybH6GpcsKus89Askc4ALb9Vket0+x3DT7BmEh7c9YDB1L8evB7KHR4EjEX2gLLLtwpUM+j8TXDO77Jdpanx9qO0euZFxd7iOo+I1jOj8T+e1ScjLstaXpb7heV5WX4e1TIQS07c/X08uu+uhaxSlyGRpcje9FPkEIHjlNtOvZxuEJhfNeWjEG6pnG0dQBKMMfOleszqvC7IKx6bmu4z65/PsWUCHGavI4z90Zp81ealYzppsCNq3N9Bm8Jx+ilxuZ7bDwklMqoezMA2S0jcpGQTspZTsWzaHrdBs85OGOSpDwxo5W+yRTv4+TbkL6rc4mIptSpe9EgD94Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unVUOTMEiGDOnk056OLERWvD7aIsW3mOlXPAuysFbsQ=;
 b=iw/2ElKCchijxcgfJDeb4ggqupfFL1JFAu2gUqfZEwCsH0odezSFNCJT2aoqzUQXUULB+92pz2IOXR4KCPlSEP6xXcf5GAsy1fLZcIKt6efZWpCfeNiDL4jAitEnMK6YhInh8OELKky3/jBbbmy1kaH5Iq+D5MixROw4IexCdTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Steffen Einsle <einsle@phptrix.de>
Subject: [PATCH] x86/msr: handle reads to MSR_P5_MC_ADDR
Date: Wed, 27 Apr 2022 17:47:01 +0200
Message-Id: <20220427154701.84315-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0057.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77ebc2d9-5d82-44ed-8321-08da28653220
X-MS-TrafficTypeDiagnostic: MWHPR03MB2957:EE_
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB295724FD31783BB145A907408FFA9@MWHPR03MB2957.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mKFo0nf3echJIToXYcgYJMnBvkkSiZcebtgLwO3YfG4bauTmHpxNm995mb4CXspXqo1FUiXm+JD7r/j7IEeu8yzui8hRnrnqAPKzGyIIlMqwHHuE8WEXx7714iZm4HYVrsc+9TBwEOhbGlJu500adZ/tTQU4eVPkvSxtN79CUwaZGTWlljR1LJn484Y4vzsl2Ov5yetcObFxv2caBwHoESUhJWxrcgUk2irmRot+Vo6ScV+kNhP8r5E23yyYiddjop2Sn/T5+n+ZwWMKVbcZem/+xMxWL3d+4h8tETd7DE9Lql475NKmGqKLJGLc/BO/mgdQdcd2rNPQFm1o+hUHzGxO7miUDwlUf6Gr58fviJ5v4kgk/jXpxgLdd/n9LwzwIpNG1bkJrIQFZDCpfn2Aq896JXH6KeuOFkNr2OixhI+7cLUdtHu7+k7qq1Wrn1/UzXQJKQsMkGuTKpGeKhT4PttW6SlOa+28iXy8vWPh/lqHlFPRJJdek8wWOLZMDHHINiZhBSfsb9HIXbGbI9/FDfKJ01yUx9liwBK2Q+gIKMpb7kEo087So40LzY1pPEHjUSdLTjnhRVbqi3s/oNZhOjh6YiYVAI0+83EbBKWsOpXArGOFbU0TJZAcybJGKI0CYKX7MNNvzlIUFXM+Usdqvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(186003)(86362001)(1076003)(6512007)(508600001)(6666004)(6506007)(38100700002)(2616005)(8936002)(8676002)(36756003)(4326008)(5660300002)(2906002)(82960400001)(316002)(66556008)(66946007)(26005)(66476007)(54906003)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXBYS2ptU1ljQ1lPZHJ4RkRpNVliZXZtMldMZ0ljaUoxTmh1VnNCejBKZ3N1?=
 =?utf-8?B?Wm15MGxRZllZOHNZcWpTNDVJVm9TNS81T0h5Z2JjRGxiTFFYc2RoYzkxMzRB?=
 =?utf-8?B?aXZhSWY2M1hRbGNYN3pESHJQc0MvbkFPalBBY0JtVkRwVE5yRE8vUVN2RnJ6?=
 =?utf-8?B?ZmxOc2dqL2lDWVFmOW9uRFV5L0h2dWdlSlBxYitVVitjMGwydGZJOFB4aWIr?=
 =?utf-8?B?NGVucjVLT3JkWnFKZEgvbFYxSHBUR2k4bkVkWnNpODhrK1pTREloNXdiaEdj?=
 =?utf-8?B?bzJUbVpEYmxZVlJyOVpUUFRhRlFTd29pSUZUOWJua1N1NytCWThXTzFRUDZP?=
 =?utf-8?B?U3UvMi9zK1RqaWJpenlSZVZMSis2M1NkTkFMQVJsZWQxTW04SDROdFRCUC85?=
 =?utf-8?B?YVRqSzI1NDJIUGxGQldmTU9OajlycUtxTFp5akNiQU1PUVNvSTRSZThtV0lk?=
 =?utf-8?B?Vmx4ZzNWWkpxV3p3TlN4Z0VTS3Y0RE5PcnJYcTkvcmRTSXlsWjM1b3dhWjRs?=
 =?utf-8?B?OWRrQXhVV05mdDZVbnNqVGcya21XamRacVRhUGRvdHJOQVV4d0NFM2RwclZ4?=
 =?utf-8?B?YjlTL1BpTE9EaVBZc1c0M3A0Q2tlVklMQjJ1ZWZpTktBRm1Jem1QZVNURml6?=
 =?utf-8?B?SkpNL3k5V3JTWUo3NnVxVXltdld0UU1UaVhNTGdHTkJkckRsTnZLZkt6REhw?=
 =?utf-8?B?ei9sR0Q5STZVM2c3MGZIa0dud3Y1MCtTZit6TlRoOVdFV0tCemJLeXAzT1FC?=
 =?utf-8?B?NWZlMUxhL2hkVFBiZkFWZWl1Y1dibFY3bU9rQ21xS0JqTHlzZ1BQZW1Iclov?=
 =?utf-8?B?cVRPY2VmbmRVUnBMZDN3VXFDd2dhTEovK3FXS2tGVGVLTXNjT2FmM1Q2RzBz?=
 =?utf-8?B?c2svcU1nM3dBTU9CZXhUTHFScDVINTRnMm4yRTRiODBoRjRPamlveEdWNy8w?=
 =?utf-8?B?UzJNUnlPam5IeUxWTVBBN0FvaEdrZFR0UU51aXN0VEU0ZU1BUExGeGJwWWRy?=
 =?utf-8?B?UnVRanpJOWFRZjBobDhkakpqSzM3Q3pRM3k2ZlNQbnlTS0JNMmtkMW52OVpk?=
 =?utf-8?B?S0RqTitLMDNjakVibW5PeWlVZlRReEhEbUlKTFdLVGROUDg4YmV6U2YwRjVu?=
 =?utf-8?B?S0gyQlVMZWtWVVVoRG5XVkNDS1llZ0xXNDd0aktXc2x4WGxJS0pCY2RPdlZj?=
 =?utf-8?B?dzl0empJaEVRZkFJdlhZUnhTM3k0SEJQeUxyRzJpZmxCNUgrcmZ0MHgxS0Zk?=
 =?utf-8?B?TEwwc3BSSXZSU0J1TVZjZzBqaHdNVDNuU3piWDZucVdZUkR4THRWalRiL29P?=
 =?utf-8?B?eGxiQjZONFN0cEp5QUhEM096UDhDT3JLMnliMXZJSGxkREd1UThvRDQ0UUxT?=
 =?utf-8?B?aTFFNGVVS2Z6dUxMT0tSQ0k4WjF1dFNwYlZKQ0paL1JydUxUR3FLaUwrQTc5?=
 =?utf-8?B?NGs3Q3NUb2pXbXNXcHFnRTBuNVJaUmJmQnh6clhLNS9XZk1PN21xR2VGSVBv?=
 =?utf-8?B?MHZpWjllUW9oTEpER3ZxNDdGY2J3SVA4WVF3bGN2ZTAvbUJ5NThkenYrSFRn?=
 =?utf-8?B?QmJpMW1YdFg1RUtSTXhzQkVNVE1VcmlYTmNwS1pFcmMzVFd4d1Z2VXVneWF4?=
 =?utf-8?B?QkswU2crVGRXdDMraW1BV3MrM3NiY0xPT2g1Um53aURSRjM5K1ljbEhwSFpk?=
 =?utf-8?B?dmVGME1PeE5tcjVYbzRPZzNmQXJjU0hmUytQNEw5UnBXTS9EaUlpM21KQlBI?=
 =?utf-8?B?NGpWeEllZ01wbTZkKzFzTE1nRm5EWnVJSzAwei9UNnA3NjlDL293eHgvM2Y2?=
 =?utf-8?B?TlpFTWYwamZFakFjR3B4WEFIeHZJQ25ia2VRRjRkbmllaXo0MFpycEhwQ3ZC?=
 =?utf-8?B?eE5kdDNiYUdDem9wUUtXU1czZjJLRWNmeHdqYTNZVjRYaEpqN1FhaEkyUjJ2?=
 =?utf-8?B?a0VJZDNwZlo0R0hVTUtQQStweEhBZEF5TGliRC9lUkp6ZFFPTGcvUnBhMEFH?=
 =?utf-8?B?WnlhR1lMcEdsN0Q3TktjQUQwN0JQbStXekdtOThtOTlEcGxEZ2xtbGxReEhF?=
 =?utf-8?B?VjROYU9ldlcwZjJsYytlWVdDUWhvRTNQdDF4SWlHdXpzN0hoZWhTdGQ5SDd0?=
 =?utf-8?B?VE9LQzJ2dFZQTVVXNys5SlN4Ync2R1ZVSUxjWkhRYmp4dDdFdklORythdk1S?=
 =?utf-8?B?WngveXZ0NXlNRWZYUkZvZnhVV3NHR284eFQ4MkpXVUhqckFaWXRuRlgxVHph?=
 =?utf-8?B?NzhCU1VnQm9ydTEyQVQvWjk3ekp3YlUzWFIxeDlabW8rY3Q1ZU9NcHR2ME5a?=
 =?utf-8?B?U21VOCtUZzByNUNHOUJPZDRUUExZM05Kd2g0aTdxUFZRbC9EM1JEVGxRSzgy?=
 =?utf-8?Q?hN8Cyf5fYOeflygo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ebc2d9-5d82-44ed-8321-08da28653220
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 15:47:12.6173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5NMb/vlkKHmBLJ3YOLEDbEhc8jY84s1s5/4i1hVOrcSSPNMQ76t9nTrSgpG0PuoXZFgoU6MGk//6clXurZs2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2957

Windows Server 2019 Essentials will unconditionally attempt to read
P5_MC_ADDR MSR at boot and throw a BSOD if injected a #GP.

Fix this by adding dummy handling that returns 0 for reads of
P5_MC_ADDR.  This seems to be enough to make Windows happy.

Reported-by: Steffen Einsle <einsle@phptrix.de>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I've added it for CENTAUR and SHANGHAI because the MSR is there since
Pentium, so likely to be implemented by those vendors also, but have
no way to check.

I wonder how long it will take for Windows to also start poking at
MSR_IA32_MC0_ADDR or other MCE related registers.  For now this seems
to be enough.
---
 xen/arch/x86/include/asm/msr-index.h |  2 ++
 xen/arch/x86/msr.c                   | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 3e038db618..02af9dc039 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -15,6 +15,8 @@
  * abbreviated name.  Exceptions will be considered on a case-by-case basis.
  */
 
+#define MSR_P5_MC_ADDR                      0
+
 #define MSR_APIC_BASE                       0x0000001b
 #define  APIC_BASE_BSP                      (_AC(1, ULL) <<  8)
 #define  APIC_BASE_EXTD                     (_AC(1, ULL) << 10)
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index a1e268eea9..e50bbf466a 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -216,6 +216,19 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_AMD_PPIN:
         goto gp_fault;
 
+    case MSR_P5_MC_ADDR:
+        /*
+         * Windows Server 2019 Essentials will attempt to read the MSR and
+         * throw a BSOD if a #GP is raised, so just return 0 in order to make
+         * Windows happy.
+         */
+        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR |
+                                 X86_VENDOR_SHANGHAI)) )
+            goto gp_fault;
+
+        *val = 0;
+        break;
+
     case MSR_IA32_FEATURE_CONTROL:
         /*
          * Architecturally, availability of this MSR is enumerated by the
-- 
2.35.1


