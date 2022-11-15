Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7F4629FED
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 18:05:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444037.698837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouzMe-0006dZ-7K; Tue, 15 Nov 2022 17:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444037.698837; Tue, 15 Nov 2022 17:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouzMe-0006bG-45; Tue, 15 Nov 2022 17:04:48 +0000
Received: by outflank-mailman (input) for mailman id 444037;
 Tue, 15 Nov 2022 17:04:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wxYI=3P=citrix.com=prvs=31178c1ec=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ouzMc-0006am-Gl
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 17:04:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97b0048c-6507-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 18:04:42 +0100 (CET)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2022 12:04:36 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SN4PR03MB6688.namprd03.prod.outlook.com (2603:10b6:806:21f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 17:04:34 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Tue, 15 Nov 2022
 17:04:33 +0000
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
X-Inumbo-ID: 97b0048c-6507-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668531882;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=udfP5mVpfBNkOoLDBwBJ991OfPMFZZzQ0L+VJpNpRtc=;
  b=dm6PNoQ47lIoy3hVC7fBy5He6PFwX0ciTkr2Qs3H4YFFzKuCzXumshGc
   z2/vuRqCpJVd21Tg9z7e+8SsiELAoikcMSP5RHqSkAOj3n+w/f4gHc1nw
   XjeEwk16JxQPqOpIAPmo2UvPSQSvCOLiO1xZyZR9cLviZ8hszeDzzSerU
   A=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 87413049
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5UW01qt3wnQEHGREVOdqf2l5K+fnVHFfMUV32f8akzHdYApBsoF/q
 tZmKWGHa/iJYmHwcotxbty19k4Fu5+HnIM1SAQ9rHpmFS0a+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaHyiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwKw8AfhCz192MnomhbthJhuB6HODAM9ZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60b4G9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAurB95LT+Xkp5aGhnWcyDMdUjBIa2CV+8nokRTkRfMHN
 xc9r39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTSoNTA9A6d+zpog210jLVow6T/XzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:2/GFXKvRXeZTkGDdqlzNNyec7skCHIAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YaT0EcMqyNMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPHxXgspbnmNE42igYy9LrF4sP+tCKH
 PQ3LsxmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX2z2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD8nTLdny3blBo+4X7rzlGVxVPlvMzCXTo/T+5Mn5hQfBf141cp+IgU6t
 MD40up875sST/QliX04NbFEzlsi0qPuHIn1coelWZWX4cyYKJY6aYf4ERWOpEdGz+S0vFQLM
 BeSOXnoNpGe1KTaH7U+kFp3dyXR3w2WiyLR0AT0/bloQR+rTRc9Q811cYflnAP+NYWUJ9f/d
 nJNaxuifVnUtIWRbgVPpZPfeKHTkj2BT7cOmObJlrqUIsdPWjWlpLx6LIpoMm3ZZ0zyocokp
 ipaiIViYcLQTOuNSSy5uwKzviUK1/NHggFi/suqqSRg4eMCoYCaka4ORITe8jJmYRtPiSUYY
 f3BHtsOY6TEYLfI/c34+TAYegtFZA/arxhhj9pYSP7nuv7bqvXi8f8TNH/YJLQLBdMYBKOPp
 JEZkm4GPl9
X-IronPort-AV: E=Sophos;i="5.96,166,1665460800"; 
   d="scan'208";a="87413049"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5kGh4jFeTXQihp26MUtMKzGhObvJY84YOYucRtumnGDOiH1kznQuNBzOpVVhh8FPd5riuoy00qZoTUQH7iTEt9m8TS5EcLaejGis44ZR2PH3Zp2DkjUAilyxPT+jsfbLepd+rPab/lXiW2ZlCCYJ4eD/nJ7ZIgDygpaMhe1zmtzDFA68Yt6UJ7E7rmyCSUaIZfCvcnBFDqicaGCFHetBvXSXHOLhpkZNolRwePEpr5QqrFm3gp80dTP+eNIIx3xlre9XRTQlQLM/eC9p7kLe7XE3MJpqWTT+rZ7cvPn44ey3qyF4Ae57DeAiUbrljjcVKnJoquEKJvdaOEnpsa1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM+DbkwcTP0ihV97RnOsi4nfOk3Q59+H/U4rqQjX5Qw=;
 b=U3qOefoZ0CMPCYL4wLiP/aDmpSF+VwsqJC8rUynUA/CcOVvTLoh5vI4zmdLQ0oIDwvGezYm0nPWMXPicfZO3Ank0tD/HNubXu5mYIpVpYPWfx/MW5dSfwc2KrqB1npm1hp1h4QhjIKZg+uEBOSQww13yYQ1GZ4735L07Dcc37b6R57eRKzilHO8WoR5vM/xV/GiYgUawYOipTckFgqCKP8FXXB61C0BfT2y9A2e/0rJ34pU04dLPZRO0tnDYBH1NUhRITQhR+PeL4nd3g3pgmWAgit0G8KhctmQVTsLlr9sdmZtoeBU9z+hmyrUzUlx02x04qHXuoLV1UTB3B8TejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM+DbkwcTP0ihV97RnOsi4nfOk3Q59+H/U4rqQjX5Qw=;
 b=Vci4yHh4drcV2aLmmzqHFK0ZbL3elXoCCn9z25LkNlQYPgZUWsos+vMGNmwsir94nydvfvt/aNwzjwz/Htq7Ywc5IwIGujt4ya4pLv/p2ZMMWGrir1IlgrV6mC7NSnCNnRGwMCSUqkC0GPKFkXyXYkOv6i5mnFsvGRyMCVJe8a4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 15 Nov 2022 18:04:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/irq: do not release irq until all cleanup is done
Message-ID: <Y3PGnLiPZYiK1J4k@Air-de-Roger>
References: <20221115123500.97114-1-roger.pau@citrix.com>
 <6ba69073-3c58-2791-9572-c5c2e433db07@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6ba69073-3c58-2791-9572-c5c2e433db07@suse.com>
X-ClientProxiedBy: LO4P265CA0203.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SN4PR03MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: e7733b25-ef17-46de-79dd-08dac72b77f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KiQ7ueNyLcmuKbPVMQp5ss3QjsfCwIzb5pLEzbLUX6w1P6tYF/CvK3UoqG5uzKocKydq+SIRn15Uh3l+B9hFTzXHRqTuLDD8y9OuQWM4v04bs0+B3NUAFlGIFKuVMwYSr/YMTLegGJB+QWYIm+53c8E3Z1XYg6a3zpP45x4hEK2JX7/Qb7R0IDHjpr6Bnsj0oPQW8kD5MNhu4vkiUI8xADflBLhSa0xhEnHYtrXBAolM9Oz5Ci+ZFs2yMfDPbOJ9juSOJ8Rmzfdq+GWjz/XK6WKS2adqOQYT+9EtDY4OaYmQ+uBL3LkloswIAdbwe1ayecyM4uOO9xZmSRSvZ3loJias5R6+zAZcODC8Y3Zh/u0Xfv3SN8fZw3gg/L+725wCPmLtJuL28GtTyzEyVTl0epcfcGDl9rqG+bCd5Vzvm0zjv+u19RfDCeUJppcPBagDMFEt3yFxjlGoDGEBkQ/5YMswA+FCPDHljxczj+S/EqYPpN8BqFkX2dlP/dVaB6r216iWzFviT1OG0B9cQin3vW8nIcef8zL426VZrSs8e7hnbCzD9WA02iizZaisEQs0O67PrX/aHBSULokXTmAW/egRJ1TpShMsS/dmPzQUTXBkzEvK4+V6XwmhnAJC4hxjvU6pZbiRRfwnLwy2r6ylA4h1go6hBJxVqMTvzURRVmxJ4wtYsFJ4GavpmZYGq8Dh5YnpZQHvU4Eh4UTWDArN1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199015)(9686003)(6512007)(26005)(86362001)(38100700002)(66476007)(66946007)(66556008)(8676002)(4326008)(316002)(53546011)(478600001)(33716001)(5660300002)(186003)(82960400001)(2906002)(41300700001)(6486002)(8936002)(83380400001)(85182001)(6666004)(6506007)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek9uWTZ2Y05QODliWm9EMGtIS2RFejI0d0dtUXE4ZDJoR1BzZkpWMWdvbCtI?=
 =?utf-8?B?d1lPcUcyVWRwb1E4R3NMMm1nRSsrUFN4czhORlF1ZTM4czNieGlHNEZlSHpp?=
 =?utf-8?B?L25tcExXd3BmdUdpdTY5UG85Mktwd1lVbE91cVAraXZ4YkY2Yzl1QVJvYjF0?=
 =?utf-8?B?ZXhQV3ByTmJBZk9rNlUvQkVJek1SWHViNjlFYis5amFUQXZ1aVRzd1JaenY3?=
 =?utf-8?B?QmhJUGRmMVRGQmV2QlBNNyttRm5MNmIrbUxLTmxLYXhwQWY3UnZBRmZPOHJ1?=
 =?utf-8?B?cE1SRTlTWkZpMmJNeHhIbHNhMlY5cDN4c2FSb1NDaWFMNFhyeURwWTNkQVhZ?=
 =?utf-8?B?OU9sTTQ3ZUNGQ1lZSUcvYlRGSnFkMWxHSnF3YjdvSi95bTlxNDI0N2ZkNVAx?=
 =?utf-8?B?RkYxMXNKdUUycVdvdmk3V0lKVmhwS09kUWNsSTNDbUdoVWhudUlQYkxnWEZq?=
 =?utf-8?B?ZWZNVGROL3UzeEFpWHN0SDMvRHNkVFYydE9NRlVDL0dWY3owWTdGcWFUWlVB?=
 =?utf-8?B?Qk1zcGY1WHE3WXkzL2plZjVrYmtaZitsTnpBUkhkeDNDaC9HRkNLTEV4RlVW?=
 =?utf-8?B?ZlJBaE5aZGVOMWJ5MEhTVjVPRTN0d3FZMERVQWFqOFRtM0dsUkNkd0JzaGF6?=
 =?utf-8?B?R09YMEJSK1lRN1BHSEFuNGR2Y1NGUDY1bG9MbXdVZ01PQWxhR2lZaUZOamgx?=
 =?utf-8?B?eUFKcE9uLzZvMlZrcEVuQWtaK2tkTzgyLzVibE9PQ3N5ems3c1RpRHJFNkk1?=
 =?utf-8?B?RWJBdlpsenRRVzIxcVQ0Rjdib0w1RjZwUTBkRVErK2RQZXBTNmdGK2ZmNTd6?=
 =?utf-8?B?dHFVbEtNUzdLM1ZhL2ZCZFZGRmtHbVJuT3N0b2YzSE0rK3M0MGllM3ZUWngz?=
 =?utf-8?B?MEJkUjJ0bEtDQnNiMTJGdmt6RjBtYnVURlB4RGpDRXVqTTBEaGJCdDZ3bXMx?=
 =?utf-8?B?OFdHdzV1eW5RTWd2RTA2a01Cb0llaEhVbFRCQjdhQXhhdHVEZHVxMW84aXkw?=
 =?utf-8?B?aGFRUXpvVUNESWdjNGFDVEQxSTFEck8zK0l0VW1pdE5IUHRuaFcwTVlvM3ZG?=
 =?utf-8?B?ZDR0YUpBZ2d1Zmg4RUovREhHYkE2Q01qcWRjNUZjejZ5VWNlWVZ2Vk9HZ2RL?=
 =?utf-8?B?L21CMXZUNEV0NkNJWHhSWlFQNDFzUDB0NnYrdVpENzhIT2hpUUhVbWpyMHFT?=
 =?utf-8?B?d3JudEwreUV5Y2Y0QS9jTFBtL3pvUnlzQ1FTalhkbjVpdEZudTVSTmRmbnNr?=
 =?utf-8?B?L0YzYXBxVDVaSVc2NFJESjMxRmgyQW1EZi8rTjMyTEFwWENGeHpSWmFwT0F0?=
 =?utf-8?B?NGN0SUYwaG1EL0ttMXlrMFhCc3JTVmVsaFF2bStLYjVJMnl3eHQvcmR6dFJC?=
 =?utf-8?B?QzFQRkJNeDdCZWhHTzZoRmVFRXRkUk5CbW8xaG1tWnVhWHZaTjRCbVQzNVd6?=
 =?utf-8?B?cWtHdnB1Y3FGVU1EMW4xYXFubWNmWEZYVHNCSTkyUVlubE00bG9xSHdEWTFk?=
 =?utf-8?B?SGtDQ1dMWEYrSTBJNHpheWs4SmoyeW5SQ3JvM3RjWkp0OUt0dTRZbFFUR2l1?=
 =?utf-8?B?RGJjNUtRQXVpWm5uR0lzMEFQVlM2VHkyekU3TXJXaEhRMnA5ZUhpOGZXSkc2?=
 =?utf-8?B?WVJ5aG1TZ09zcUNISmNMV3dXZzRMcUFwYXBCY01oOE1qWE9yMlJnaE5RbG1Y?=
 =?utf-8?B?K0pQNkxmRVcrb2Q5MnpuL29QR05mUjBVekV4QWZZRTgyMTE3ajJUSVpvNS9I?=
 =?utf-8?B?QkVNdGYwRC9QT0pZMWVoV2VGaEJoVWNwOGZKSDNTanBHYUhpZVRBemkreWU2?=
 =?utf-8?B?QWxVSDA5M3dmbkpUeUR6UHZtRmU5NDRCUS9IK3JkNldHZUMyTTVKK3NPTnkx?=
 =?utf-8?B?THlZNko5M1oxWWxuWWlyZTNoTG1wQzQ1aXpKSEhJWUpHQXZSUm9Ma09lL0N4?=
 =?utf-8?B?d042bDdiUkhINmEyUlRtd3VKMDc0SEpIbTYreU5QbDdGblp1TDZ3ellZN3ND?=
 =?utf-8?B?eTQ2YUpKSUJSdXVYa3IvRUovY1BtTFE1VGpjdVJRUjNtdi9TbkhxdEg5M1BW?=
 =?utf-8?B?NHNSczY3Vmxpc282ZjAvd1c5Z1A5SkkvQ2Erd1JpVTVaQzFjdWtibSs1WndH?=
 =?utf-8?Q?s6bX7RHYewnjE98/R1sJpC2+X?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ODzMT/tD2kgT85zfTKLdGebr8dsQjirM/T/kQ3+TxRFhesLuWD8PeCl+254zh8RGodTJSyPxiAgZJl0Lsw+Wxd8I+wgkTsgKCrgbzI4PelPJTh0lwwgF4yskGXPtk34oN3Se9nEqnkDeZ3bHvbxSDrY7XvPWQX+/mIdUO2dAGuU/jYEN0Sk1uv+xxP5AuU9/sZ8lbICDq9CELmc1lW9I6eFTcDmSGZvcl8CoXaD6ydfd7hlU/xaZdQMvwEvq9qCg/O4G3apCjsEgD5gvKUU0l8sJl5pLimBQuHHx4/Czr+4p9/V7TkevEesW8VvWcKY0YvTcrwYO4LAr4JMRP+2rjsYLlmNaQ5Zwz/vLpDhRfQ00uai4cu7iUEkO9eI60jZeOGjDLW1Hi+p0g0Yl6wTW2OY7iWDcoWexpJ3Ks7PpJfXtLZaKMJMSZbga6HdnB3FOdZUB/6cd8LZHJ70sS2LAz8b8IjlszZHvkpv1fuVMySLKWDVIloYhAPi6//vBNEsN6Go9fiky0c1M2MXvhvKNXG5f6Me+rI4dEv+SUZoG6e+DyCLpdaGc8lkzrtudPUrEXX4a9ZiuSKGTYcYPfNhrM/2I/nnIXYoAhqa51CbXipxAFF/Wo1ancvCFL2uHsjMmeXJqqsCJi/WZC780eezLcFcL1wFq2YHaQ84kyQ8cUDIGCoCeTt7OcqdUegRtACwtycqcm39J/SAPuAgxNvfQyjESCFao7ZSJK3STDj6ISsGNBiI6ePamH2BAzZklQiBbeHxxC8Y46X0llkSa0bTUlSh3rV26+FFzTRjWQT+BaRen8uFxguIAWe5mQs8tfH6r3LYjtEukxkk7qK/RfLGp2Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7733b25-ef17-46de-79dd-08dac72b77f3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 17:04:33.8968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofplXNLQtEieuG8zJhjiHndHMOKGVdBCfk200n/Iub0V/Ux3tR5lz0Gk6KPMtEen39pAY5CCzIn+i2xOWfh1BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6688

On Tue, Nov 15, 2022 at 05:29:47PM +0100, Jan Beulich wrote:
> On 15.11.2022 13:35, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -220,27 +220,27 @@ static void _clear_irq_vector(struct irq_desc *desc)
> >          clear_bit(vector, desc->arch.used_vectors);
> >      }
> >  
> > -    desc->arch.used = IRQ_UNUSED;
> > -
> > -    trace_irq_mask(TRC_HW_IRQ_CLEAR_VECTOR, irq, vector, tmp_mask);
> 
> The use of tmp_mask here was ...
> 
> > +    if ( unlikely(desc->arch.move_in_progress) )
> > +    {
> > +        /* If we were in motion, also clear desc->arch.old_vector */
> > +        old_vector = desc->arch.old_vector;
> > +        cpumask_and(tmp_mask, desc->arch.old_cpu_mask, &cpu_online_map);
> 
> .. before the variable was updated here. Now you move it past this
> update (to the very end of the function). I wonder whether, to keep
> things simple in this change, it would be tolerable to leave the
> trace_irq_mask() invocation where it was, despite cleanup not having
> completed yet at that point. (The alternative would look to be to
> act directly on desc->arch.old_cpu_mask in the code you re-indent,
> leaving tmp_mask alone. I think that ought to be okay since nothing
> else should access that mask anymore. We could even avoid altering
> the field, by going from cpumask_and() to a cpu_online() check in
> the for_each_cpu() body.)

Hm, I was thinking we should print the old vector mask (since that's
the one still in use because migration hasn't happened yet) but then
we would also need to print the old vector instead of the new one, but
maybe that's too much change given the current behavior.

I think it's fine to set the trace here, before IRQ_UNUSED gets set
(in fact it might be better, as then the trace should be more
coherent).

> >  
> > -    if ( likely(!desc->arch.move_in_progress) )
> > -        return;
> > +        for_each_cpu(cpu, tmp_mask)
> > +        {
> > +            ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
> > +            TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
> > +            per_cpu(vector_irq, cpu)[old_vector] = ~irq;
> > +        }
> >  
> > -    /* If we were in motion, also clear desc->arch.old_vector */
> > -    old_vector = desc->arch.old_vector;
> > -    cpumask_and(tmp_mask, desc->arch.old_cpu_mask, &cpu_online_map);
> > +        release_old_vec(desc);
> >  
> > -    for_each_cpu(cpu, tmp_mask)
> > -    {
> > -        ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
> > -        TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
> > -        per_cpu(vector_irq, cpu)[old_vector] = ~irq;
> > +        desc->arch.move_in_progress = 0;
> >      }
> >  
> > -    release_old_vec(desc);
> > +    write_atomic(&desc->arch.used, IRQ_UNUSED);
> 
> Now that there is an ordering requirement between these last two writes,
> I think you want to add smp_wmb() after the first one (still inside the
> inner scope). write_atomic() is only a volatile asm() (which the compiler
> may move under certain conditions) and an access through a volatile
> pointer (which isn't ordered with non-volatile memory accesses), but it
> is specifically not a memory barrier.

Right, sorry - I always get confused and assume that a volatile asm
can't be reordered.  I was about to add the write barrier but didn't
do it because of the volatile in the asm.

I would like to request a backport for this, but I think it's now too
late for the patch to be accepted to 4.17.

Thanks, Roger.

