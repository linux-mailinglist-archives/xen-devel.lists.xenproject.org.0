Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F18C40839
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 16:05:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157663.1486361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHO1Q-0007Zf-Kf; Fri, 07 Nov 2025 15:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157663.1486361; Fri, 07 Nov 2025 15:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHO1Q-0007Wl-HL; Fri, 07 Nov 2025 15:05:04 +0000
Received: by outflank-mailman (input) for mailman id 1157663;
 Fri, 07 Nov 2025 15:05:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qRNH=5P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vHO1P-0007Wa-89
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 15:05:03 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22b0990d-bbeb-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 16:05:02 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB7605.eurprd03.prod.outlook.com (2603:10a6:20b:419::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 15:04:59 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 15:04:59 +0000
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
X-Inumbo-ID: 22b0990d-bbeb-11f0-9d17-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rH87iHK389YV3KQJR/ByOpMwwbGgMWu6rz7WARhv0FWZQO2eeNBdk8OFjqCbEX/Pw4/cdq5lRDHdSDAjDKwz5yNlDrlaecaDMeohQdbtoRNqDdSSWtxMvxu0yeXNGsme+RocuBaxqUb0lwqb8IooFIpH1V3qfwJOBiWMfYjHSd+Ld6m1jygblyfw0DXZcg4pI9qbOIgVnlWy2xcJvwgUAvbmE8BqHLZZFZUHRHO3oivGpr994deHJ30oggbNuQMujdSB2X7HfPPHlJCkjjRN0opNiBzH6e5AoIn7sLg/fPSlkcyMv3vgJChRZbHmJQ+p1eAGtId5xUkUhdTQlhqTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avySyVoUNnEQXlDAooPk+JX3+HVzZzILNmAQk4gwOnc=;
 b=PvhErX/FxLTmp2BhRMQIEX+zrrgW0yoC6FqrT7P0bvW38MpqDjv3/Wj7lnMYhknC1HLzTdtbVoRDg+gN/gZIglkqEbeukh1WChaqjpf/r8Vj6FGzOkv0tZ95SIcIFPCTSzrAJwF5f5c9gpSGRU0JU3ub/W83/ywYdWwsKEY2CpOo40AsVdq+aZA4nYLzqwM82BlMCc3WOvpojSlxs+UvboXwCal7YlgIVeKHOzbBSLPzcMj5eVf4eXhzdKZov01pAAA9yGk0TG6VOv6d48ev8SAr1tTOVy85tVeuwvz+QdmOdyXLQZTbTVUM8rCCu06XKimGSEIYvYFP6TVWam54Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avySyVoUNnEQXlDAooPk+JX3+HVzZzILNmAQk4gwOnc=;
 b=ZNuMmb3ZVgRVy0LwBiHTCK70+PZY9whWq1KsWFsJYHbyJHfwqqwL25mRZd2MjlAVrjlRW/HizlvAMCK1YOvTMe9xx4KFLGIdoiAHJ6ZxVRIb2+FpMBM80h6v/mkt8kL8o+sE+WTgjjuv5HaHWhyzZJB5/P5jd/CZVnl66Qp/ZXdE3XDslKXUHRUpRZC6/EJWyTsUwGuoBSePxeThghLwKCw/iB/7isQ7A2Sy7naxgDpmyXMydQsSmDxF6iTQcWKw4zhd8xAkPZ56jvjkx8Yht7JGEv8eLjnMqZgQP5Vypo85LU1USNS6fGphTDsbdRQrp+2PUJ75B+OsLxF7aTkWZg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Tim Deegan
	<tim@xen.org>, Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [XEN][PATCH v2 0/3] x86/hvm: vmx: refactor cache disable mode code
Thread-Topic: [XEN][PATCH v2 0/3] x86/hvm: vmx: refactor cache disable mode
 code
Thread-Index: AQHcT/fi4fFafA7ovEOjKlx2k25ReA==
Date: Fri, 7 Nov 2025 15:04:59 +0000
Message-ID: <20251107150456.2965906-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AM9PR03MB7605:EE_
x-ms-office365-filtering-correlation-id: d2a6db04-9824-47b1-be94-08de1e0f0547
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+LNHg1p3tQg6hNvN3QWCkR8cstI+ykUu79F9y5Z81yc2xoLxjGqE1Q1Aq/?=
 =?iso-8859-1?Q?QhACNlDK54ogvLn8HcYTsf4N6dZEI9EFjl+M2bxQNW2RS0Isgrp5NuU3oU?=
 =?iso-8859-1?Q?ZSJFArNNroIEy3wCX5l7kT4t1X4ln/5HYheKMNB9dLLAd02be6DLv3NsJD?=
 =?iso-8859-1?Q?jsHIAp76GT8dHEVHWToUEecgNADKxQKzgh9ewgS95nvVQy5g6va5iFKLYX?=
 =?iso-8859-1?Q?0Hul67okS1wSNwPXCg3CYcfA+9oAgF49psCWtz90lFufBQkJcx3dawJg+g?=
 =?iso-8859-1?Q?ReBtVZd0F1oHO8L8lW+y2mQerICcbosdnKt6quIaDrBwerkdfmTffzAQ/k?=
 =?iso-8859-1?Q?HxBl+qtFDM1wKhfz8PvMJShGIXPZRNfKWqL1tpSiXn+WS2gbjeX4xhpvWF?=
 =?iso-8859-1?Q?RZ3BxriYxybtuMQT83hPIZt6WYEPshFhRsjPH+dwEgYDL1J3uF0GGNSVIR?=
 =?iso-8859-1?Q?0wpMul5ABou/EyOUfdwaVUz6R4mumo4ixPn8o79LHpUqEFC2E0hjQ1ZK7T?=
 =?iso-8859-1?Q?ibGcVBksJDbie0VjXAbcPLWwBki1RMBCoMZ8F47VktwQjrImCEy11XZSXV?=
 =?iso-8859-1?Q?fQVLiAPNttNZOXth8peDE6v9tyvujQ1ByHHGk9Aqwsr6ytMlYXjIv0j5Ku?=
 =?iso-8859-1?Q?J6c54ckhLeYKsue3P//xuD6IR9jAX8sjBNYQpRmrp7I9jEmmJLOSIBrP24?=
 =?iso-8859-1?Q?zj2slPl4E8gxexZ3oqHespuMq46dZ/T4HBrYuLhwl1iFdlygBbTLy7mgYb?=
 =?iso-8859-1?Q?EM1dxPSpdEIVBsspdVC80tLQwgdZ1yw9FwcGfsJVv3uhmT8Ik52bXut1Xc?=
 =?iso-8859-1?Q?6s1q3hw3lur4HD8B4PSNZaf1J1XXx9WFtNbSju3KiN8MLrJh1/tThJdGda?=
 =?iso-8859-1?Q?8YXyF03q53YHAUcwytZo4OEXungRGtf6qp90mnA8ibHDKx0qC8TqDJdE7U?=
 =?iso-8859-1?Q?d6LVGsjVN5n+PM7fmXMIRpsInX5WxJlOKduYgyZ7Wkpm4Xmkm5yDaDPZ6b?=
 =?iso-8859-1?Q?oFUtafZ+dB7D0UoqQtSCCWxUkocK4NtEz4QwXAMF1J9ehl//rDNPSbHZFO?=
 =?iso-8859-1?Q?mA3Stu/ZeARv4WJpnwswxYZmByUVgfb1k3FyK5/GcZY67H2YZ6JxKbjlbP?=
 =?iso-8859-1?Q?EJ8331AUa8QpJcpnECgppAiAOAZdHKb8WlEG+Rt1t1QQtinMSLgWRddMMe?=
 =?iso-8859-1?Q?YxbxpmRgE4KcWYlHHFIC9b2hepXfyuXUull4Z4bnXIhC61LpGDYvNhMXsX?=
 =?iso-8859-1?Q?1bv6arlU2zAT0qKMEoIq0GLlpB5mLRnG/WirxoYkSNhwlJ09Fe6nf5Mted?=
 =?iso-8859-1?Q?a1siZnC1K+31CV8I1xWF4AFB4od7gIxpMPixaflgWbpinqnNmqNN3YLb7j?=
 =?iso-8859-1?Q?MgpldGP/hcQvZQmkprpjY810/C/9s2ANUTyaa1jI4t8HCCDj4KyhBJHMlW?=
 =?iso-8859-1?Q?lazo3vkCP6DcnPiQHI7S8/HTsPy8iwLOLwxRv7ipcBZmnTMk+8Dgez8ov5?=
 =?iso-8859-1?Q?d78krlodD1pn0YxNLNyWpLhOERValMFig86Lo54mQY6BcDYyy59N6q9TdH?=
 =?iso-8859-1?Q?3sbeFWW/DzEOAblJ3zOdDyRub2Ol?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NFBokMmNp7ukpEnoK/wtsmYl1R+DV/4l3MdNuW++PMl+gErQceo5wtkFps?=
 =?iso-8859-1?Q?Q8QodZ04jl/cI+qJ1EmQt+TICZLZj5uX1u70XH5vPWgXhrMZgGfo98zK0m?=
 =?iso-8859-1?Q?acRSXCpN4WOt1gGscKL042sy0bGjgfiZdr+Pb5cCRRXdnmVCq6oxxsTXuo?=
 =?iso-8859-1?Q?hcXNZCqZWlXbpIF9LYghb38iSVHPbCdwaUOqdA9WDvxlbe7ZFdCxIg1eQ9?=
 =?iso-8859-1?Q?l/1BDft96PAR4jw7hVkQdlbIVXp24KZflHii+wU64ihLC22LjsS+0bwRe2?=
 =?iso-8859-1?Q?QRsGNLp2Ctq9L8mPgxb7LJvqkvcR2vVRY5SrxkZXr91Te+D4bmeSll0zNi?=
 =?iso-8859-1?Q?6DS+BRfuFb/IeNe9o5EXe8JYGT5bEpGVG5laaq9e2xV9CiXztlgAk2aBAF?=
 =?iso-8859-1?Q?5Je3dawm74y+CPooeE464Hy8VyfWObO6T8w9GQmXdOS34mZ3WVbUi84wqk?=
 =?iso-8859-1?Q?JvELCw22piiyWBi7DxlE6MC+vsZwfSqYu/qvV0NT+V2z87w+MU5VtnjGd6?=
 =?iso-8859-1?Q?IQvjB2YGN7jaK7CoVMbDAVkKXZ2L7QHgJI1/B8c+9jDbP/3PWIhsBFy5wJ?=
 =?iso-8859-1?Q?z0olwAGObalTO8u3klf66ObKm22yJAMo0i/l+oFqprFHO0ptIRLVClQ/OW?=
 =?iso-8859-1?Q?89K5mZeA628GZj8GqayM4JqIKf7OZKAkkiSnQEkIhY2g9asqr6p90n+1Ev?=
 =?iso-8859-1?Q?i2u3AwSQJIy6uOcgOnLVyVuBFfYmPAZk+5LAtDp+y5ouutfO7GEveVMGpW?=
 =?iso-8859-1?Q?vnCu0p4q9jKR29s1vKVbx1u6ndffIjBM90JVEBZOW5bZGC8KRNBfsaQMvE?=
 =?iso-8859-1?Q?3G9jIYgYWTQlJnX+3V2lo3zH4QUNkqiXEiF++U2dw5C95abv9eg4d1mXxg?=
 =?iso-8859-1?Q?eIdGHHh518QHl97J8ihPG/cMe/yxLIb8lZtdixxrPF5v15HeNtWYjIikRQ?=
 =?iso-8859-1?Q?0sv+LNYa5Mgmoow0bwZLpfMSU6qmg6PYEoPy9DzUUUlHQj15ljaRkN1piF?=
 =?iso-8859-1?Q?D4gQYJxrktml9BUEC9i+tjXTAywPVJt3gTnFdqjCSZ4qnia6OYcS5FPMIx?=
 =?iso-8859-1?Q?dUoYBLXutHNQWSDWQHELP95wSUfokDY34sLZzzcy7fT+OEV5Nz8tLSGc7i?=
 =?iso-8859-1?Q?3/awAIbbmQ+zQQs9sr+JUlGd4yRHhyf1E7lrG/7O8QWndjuOorRNckEeWL?=
 =?iso-8859-1?Q?K/OmfeY7GtJVvm00pL8FKP1T9qaqQEQqwtQ98dpaA37xwpT9NOkQl2A29o?=
 =?iso-8859-1?Q?+C6P1yOGypreevzdBEjH0L2X7MFixjbEb+2JwPlIeJhnRV41YUwcamItHI?=
 =?iso-8859-1?Q?olCo9KxlNLrkSDM2376fdAjI/HYyBYEBD0eAZYeDWfRnmyfEZZN/ZTb4Qy?=
 =?iso-8859-1?Q?lpg+EB7c+vwEOwVb4kYrJz/tx+4ZTocSPmpn77aB3CMSwbY3r5Fga1dNv4?=
 =?iso-8859-1?Q?W7nKkxSUpvqt7FMkXDi/QOpO/uLNvFaYPBgIjTLtlg3DNTaMmO5mZD8vBr?=
 =?iso-8859-1?Q?NN/tntUh6oBJ7cMUEb+cmhs/6nrPu7mBZMa76bBMCEE8z7cJG8PeaRs2/s?=
 =?iso-8859-1?Q?nQBk8Mdfqgz1ON6NbvNOEpQK9x+fDQ61JiG+wkGKhBP5HyK9L4ORR1h4iV?=
 =?iso-8859-1?Q?RUwdR0v7w90vZt1pBDPUp8dZMBpiDB+CH71cEWXCmR0mDJIBNymLvhPg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a6db04-9824-47b1-be94-08de1e0f0547
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 15:04:59.4622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zWdTWHlBxL/wiKu6m4mu1kMJMD6l1iaqH+qMxCVE3JShI4p2zu9Ka2Kxf15Gc7ZAvXE89XJ4CIctwbOyudDE2nMRi40PI66XiWDEXpIVw1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7605

From: Grygorii Strashko <grygorii_strashko@epam.com>

The cache disable mode code (hvm_shadow_handle_cd()) is relevant only for I=
ntel VT-x (VMX),
hence:
- move hvm_shadow_handle_cd()/ hvm_set_uc_mode()/domain_exit_uc_mode() in V=
MX code
- account for SHADOW_PAGING when use hvm_shadow_handle_cd()
- move cache disable mode data into VMX specific structures

Based on discussion [1].

[1] https://patchwork.kernel.org/project/xen-devel/patch/20251023151903.560=
947-1-grygorii_strashko@epam.com/

v1: https://patchwork.kernel.org/project/xen-devel/cover/20251029235448.602=
380-1-grygorii_strashko@epam.com/

Grygorii Strashko (3):
  x86/hvm: move hvm_shadow_handle_cd() to vmx code
  x86/hvm: vmx: account for SHADOW_PAGING when use
    hvm_shadow_handle_cd()
  x86/hvm: vmx: refactor cache disable mode data

 xen/arch/x86/hvm/hvm.c                  | 59 --------------------
 xen/arch/x86/hvm/vmx/vmx.c              | 73 +++++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/domain.h   |  6 --
 xen/arch/x86/include/asm/hvm/hvm.h      |  3 +
 xen/arch/x86/include/asm/hvm/support.h  |  2 -
 xen/arch/x86/include/asm/hvm/vcpu.h     |  3 -
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 13 +++++
 xen/arch/x86/include/asm/mtrr.h         |  3 -
 xen/arch/x86/mm/shadow/multi.c          |  2 +-
 9 files changed, 85 insertions(+), 79 deletions(-)

--=20
2.34.1

