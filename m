Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBEE5FDCC1
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 17:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422259.668160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oizhJ-0006y9-L0; Thu, 13 Oct 2022 15:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422259.668160; Thu, 13 Oct 2022 15:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oizhJ-0006vV-Hm; Thu, 13 Oct 2022 15:00:33 +0000
Received: by outflank-mailman (input) for mailman id 422259;
 Thu, 13 Oct 2022 15:00:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xhTA=2O=citrix.com=prvs=278783dfc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oizhI-0006vP-Pl
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 15:00:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6eca9aa-4b07-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 17:00:30 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 11:00:28 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5569.namprd03.prod.outlook.com (2603:10b6:208:287::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 15:00:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 15:00:20 +0000
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
X-Inumbo-ID: c6eca9aa-4b07-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665673231;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hIzasv3oIUd/MAb+jyBuxyPRM1xYyg9mJUItM2ggxvE=;
  b=T7Wz3qoa1WB0UlVP9MQM4IbnnGTvCVJRak2kAWzinlYrUpmBFDewZodn
   vWTN/FFwBpw0y5AhUERvzDnpI1++efYTYewTar9vX3X76o645uLDa9w8E
   HLmKvQ8ydCXcxd0nlmDsDGcHf9V3HSZShSaOQSb6FXo0M62LMu5HI1QAU
   Y=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 83086112
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sNa9vKJ5DTEwUwkDFE+R7ZQlxSXFcZb7ZxGr2PjKsXjdYENS0zcOz
 zBMWzvTO6mCYGL8c9wiPYrk9EtUuJPXmoJgGgRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4WhA5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05Fb0Gvb59Blpxz
 t0RLQIvLQmnpcfs3q3uH4GAhux7RCXqFKU2nyg6iBv/XbMhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9Q/T/PVpi4TQ5FUZPLzFGdzZYNGVA+5SmV6Vv
 Dnu9GXlGBAKcteYzFJp91r83befw3qiAur+EpWXsc9xgHCyxlAPESY9e2CjsNiryXSXDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsbjNHcs1gi8YwShQjz
 FrPlNTsbRR1t6afU3Wa9bG8oja7OCxTJmgHDQcbSSMV7t+lp5s85i8jVf5mGa+xy9fzSTf5x
 mnQqDBk3upNy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:4krwhKEl6FjJLT10pLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2PwqT+GLEXQI+llluhEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="83086112"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7D92FzVU5BaKWqblZJXioBxEqMFOl7FY85aXLHucVxnS2WZ4OgXNeZXsf8ylSpldyc0QQEkfu7D9AgbeqZsEh3aznrlfZ1VQTqcSVuASXaJ5SBVNN8er1ry+GFKNhY4fi5SFa6EsTcjCRARe2YQ9/4qHdx4qKh9nUXDCu1GlJ66H0rg4QYYkYuvNP7vg3mnhrw99lhpRuz1gdebmNRdl8le1tBgkGZ2or5Ra8omBp+ChGIkE6EmxLlQlvPakVh4N/bcBIxt/Y2SC3eqF78XjFjs6LFKbEElseC6IE2L1Ha1fBTpD5b/Gp97/iaNxv3a4Jk13jkUJzHoY7atHcw5RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIzasv3oIUd/MAb+jyBuxyPRM1xYyg9mJUItM2ggxvE=;
 b=IqV31rniVEJNiiOhrNr3lNZoMx1hHGMo5oWtZ9lrRHUL9pWgXynJDEoid1M2xvxm9sBoG6I22DAGUSH39y4fA/Z6qGTVj9cuSxDICqcRmipYc+DeaIDQLIKjqMzk+8Lcsfp/IHXjWF7VMkLJsotuJMYWVn3y7nFs+44M844LPVXrvdxWlSV7qThA9newabQKzK0bcwouRtbQpjtBGut1oQwivmiGsgbnnn3zF3MCwf2wS2nRbWiDTneC3YKue18wiP8vzpPmGUXMD9V6kI/pau++c7TG4xwKLZIlx2aKD+CiWexYILqOnSsfwKIeV7WIqPqlusdrQjaAyBeknRr1QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIzasv3oIUd/MAb+jyBuxyPRM1xYyg9mJUItM2ggxvE=;
 b=Kr5bIqzen+4bDGbNZoBP4HeZQa3+LS/G3EAqxlj4VsSZUr/wW3W+w5eXvt8KZgLRl3Q8SxgkJWMxIuKg4czt7BEIIOdIk0YGGd4vAvgU9f2bu3d028UEV1uZh6UntOPXFmzHmVmD+0FQoZbSq6/l/tY7X3F97pYACVNNO/QVsvg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, George Dunlap <George.Dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH for-4.17 v5 16/17] tools/golang/xenlight: Rework
 gengotypes.py and generation of *.gen.go
Thread-Topic: [XEN PATCH for-4.17 v5 16/17] tools/golang/xenlight: Rework
 gengotypes.py and generation of *.gen.go
Thread-Index: AQHY3wYExc++jpfrd0yvyakMPv5Mw64MavoA
Date: Thu, 13 Oct 2022 15:00:20 +0000
Message-ID: <3d5e662c-91b5-a390-c21e-90391961bd45@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <20221013130513.52440-17-anthony.perard@citrix.com>
In-Reply-To: <20221013130513.52440-17-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5569:EE_
x-ms-office365-filtering-correlation-id: 774804e9-8708-4bac-91ca-08daad2ba5ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0qt9dZjjlZNAjk0fCvfpzhEBjz6h9l2FUQfCRif6ibQkbYox4gjctaCvjlWdrh9AN5a7ycewOQuNKGUl9s1MhnU8Zx4AuckdM6g5U1Ehex0JR56EDsuKt9WcVTrKWoamaD9uSuCWkn8i5R1OwPGUCOtYAuWwn8Q6y8uTYiiDX0rWsuhsUqtl/ywdOHDiNxkmlMNGW0/QSC9Fvf6pikDC95zRXd1YiAvSitq4Rj/YhJ8hQWnPvx+ooRkwjSH+dSn7M35t3SZmR9mFK2tyOOCxjjeFNJJ8H9c+cOvGuu5kbUDAZd02b06wcb+FLRAPvPVCc1peBSxlu90paSooo8tIJa0EiFTbEX508nXWhcezjNvEScNWVwarw8D0paPiRJTS5ow97IY/DabfjRLChlLwpSWpqP+Gn0jgCSeDB+2tHjX527Uf/2+EsV7EFSev6hQfFnjDAJaMVtyleJLk4q4lXkirFXucW4p1njcN0VfShoy+39q3XItt8haapOXbgaUKPx/NmanrBSp/9FBGjN4FwNp2LS06C/cTIRoqnOS/yW4MaBG2YQO8zAppfMkgG/I/RX9OahKWclRrkut0JS8for7NCXV4peqEDWMThEnmy5giNIzWEju2ofUV+EPulqNf2I05P0yJMUfWX84rGT7V7SiB2OvCuUT9etmAu56M9YGVGUs6/FSM0/22w5kDRyNlVAPsFoeLM3VBjnM8PfxF0ZuM3IAvj2dvATP1jn0T7Vk90CiUdkmI/WBt+mJ8EnkKs0HZscY4OwcS2PtPibbV7WqBA9dqRSHJIMtH3pgZFCrh7Czfw9h4Eid3OtgjuOShSApIaZrlHSAVdfJ2oRoZ6w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199015)(36756003)(2616005)(186003)(26005)(6512007)(53546011)(91956017)(2906002)(122000001)(316002)(110136005)(66446008)(54906003)(41300700001)(66476007)(66946007)(31696002)(66556008)(86362001)(8936002)(8676002)(4326008)(64756008)(76116006)(38100700002)(82960400001)(478600001)(6506007)(71200400001)(5660300002)(38070700005)(6486002)(4744005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SWZQZFdrVWdBbVEydE52VXJ1MzFLUnJXZHZ4UjBuUVR0RkFkVDVDazNhbEpl?=
 =?utf-8?B?KzF4OXg5MnYxQTZzQ0QzQkwvdHBESy8xMzBJb2FYK0JOR1ZNTUl6SkNtRDJE?=
 =?utf-8?B?TkMvK0FWSjM5eHV0dzBUZHlpNEU4QnhmbktrQWZOLzFpYVkzdnJBVVJCM3By?=
 =?utf-8?B?ZDMwSEdxR0xGZUpKNVJGV2dtaU5wQ2lsbm00a0RnNnRGR0JlVktFd0ZwZ2ly?=
 =?utf-8?B?NE5RaU1ab3ppWFkzUEtGQUNtVzIrb3JlTEQxSytVUlpnUFNWcjBMa3NMSXZn?=
 =?utf-8?B?cXlEdnVQTmFIbE9YNUJuZTRSS3ZxT3l5MUU0MGVjbW81Z24xSG1lYXFUaXd1?=
 =?utf-8?B?ekRDS2pOMFBrWFFrMGVGU0xGT1ptM0lReFM3T2hDa3YxcXRwNHgvNjYzOGdi?=
 =?utf-8?B?Z0ttdEJ6TmlrbTVaMkJLSWFaNFd5R1EzNldRenRwdXZiRWMxcnp6RHMxeWx0?=
 =?utf-8?B?cjhidUlPNHZ5cXpIOWZWWVNhOGtNanduYU90TUF3TDJLQ2tqVGJrVnpWVE12?=
 =?utf-8?B?R09LSGR3bTFRcUEzTmEvbSs0QS9ZaHVTN1RjVjB1QlByQWJsc1dlYVNXUnMv?=
 =?utf-8?B?NGF6STROaUlMR1g5VjJkU0lHckRHNTVRYlNZb1Rub2lPYlZmVm5yalNqWnpJ?=
 =?utf-8?B?Q1Q0MHpFcDh3SStYN2FDZVozaXVOQk1WNEZzc3pwUEtGWDlXdXJVN0p4WW9G?=
 =?utf-8?B?NEtnczcxYUdPUFIxdzdtVFYrYmtYdUhvMUJxTVpXZW1aMTNGazBrUW5jaGtO?=
 =?utf-8?B?eXJKaXV0MkcwMlNYemM4d1hxY3BrV0QrTHYwdUZjU0JONllHRXJvQ3JMK1I0?=
 =?utf-8?B?bVhONHozbjJqeFNMMVZMZ2tBb0E5ZnE3czhZb3BnVVdPVVNRNjRWbU95YkI2?=
 =?utf-8?B?K2JraHJrcXUwMFF1M2YxUE8venV2VEMwc0tHRlBSblFJRjBSbEtXVUg0V3Ex?=
 =?utf-8?B?TlFOMENDTmpHVk5ML0FuRnNBb3JNN3FiSW5TNVNoa3loZG5ZOGxBVExwdWY3?=
 =?utf-8?B?bHVSbnVqWkRsUEJTd2tpL0dHYkdsa2ZZeHdWSWVKLzNzOWJKVFVNTkZQZHAz?=
 =?utf-8?B?MUx2R3pCY2lXWERTczFHTEpVVkN2WElSai8xUmphNHBGeW9renJneVM1VFRJ?=
 =?utf-8?B?VkpXQjR6dHpnNGljdkNEM3VUV1ZNM1NFK3NuK0Nna2tUS0lIN2FQSWxFbUQr?=
 =?utf-8?B?dXFvVVB4U1ltRTUyeWRseS95TEJXZUtjVEVmSlI5anpwVTZGeTlRdnUyT0V6?=
 =?utf-8?B?eU5rUi9BbXphN3BmNWhwSHNxY2RObkhiMmJFL2lySjFYb2ZTdTBSMHBxd1Nz?=
 =?utf-8?B?TUtiYWxoMi90Q21mTElQRjVCNFBZLzdoUTM3RGZkWkhRckVvOG5mQUdUUWhZ?=
 =?utf-8?B?ajJuYlFDcjZ2VmtldzNidENVcVVhc20zMGpUVFByQ3JLWnNtZDV0K3JYdHk4?=
 =?utf-8?B?b3pHbWhtUHJoRkEwendleGRpTUZQMFFIS2crWjJJeFdCNUlucEJFd3A0aDJh?=
 =?utf-8?B?eXpkTExtcFUzMG5aTXg0VllCTEwzSEcvcWZqeUF2UTkwMnAwSWdPWlBkSU1T?=
 =?utf-8?B?VDg3TSt5UzI3dUFUWHp3bjB5U2E0bE1DN09US1NOK3dGSW9FSDdyRW91ZHg0?=
 =?utf-8?B?QnA0ZnBKNEdPMC9FRE5OdHVXZHFBUVVCTzloMENBcFo0REN0NWVFRzZCS216?=
 =?utf-8?B?b2l4YTdnN3JiRGVTei91VUxZMkU0R05QNUZQUG04TEVzR2xJTXpvUllMYnhY?=
 =?utf-8?B?TUtvdjFXWWltWkZ2Z0w1Ykl6UUxSMVNYR1k5VytCL3dXV09MOTIxdktaZHpT?=
 =?utf-8?B?WHozd3RmMXM4bVR5N041cHZOQU53enIzc3dLdURleGNWOXZRNGRPdmk0M3Rx?=
 =?utf-8?B?LzYvUGlad2hYd0xuNkkxd1Y3M0xCUUJnTzFGUkNTTTFlYmVvNndxbm9QTCth?=
 =?utf-8?B?MWN0cUNHZWE2VTExQzYrSkJXUnVuRm5BN3NaWkhFakJyZU5TZ3d0Ty9tdVdK?=
 =?utf-8?B?V1NHVVpwODN4WjhIR3pyQXAyWVpDVEpTWThTZ0o4cEhRQXBiakI2US9LazJq?=
 =?utf-8?B?NEt4ODJ5SlpYQ2ZkTHVsY1ZIeXNqdi90aHNnZ2tIM05qSXhncWR3dlA5Zkpw?=
 =?utf-8?Q?mhO/oevYKN2BP2v/OsKes+xmi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <660E231B33CD8C499D43BB1F9A1521B6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 774804e9-8708-4bac-91ca-08daad2ba5ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 15:00:20.6066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UzuQvwoqPjclGXrBo3h/1xvZ4irVNp7J4ZJ80j6wywgXd+p83MftNKARtBciwdG4H4eZhwYUQdi8OTdUUS/yRJU5ieQt7i9zrHe59fcclsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5569

T24gMTMvMTAvMjAyMiAxNDowNSwgQW50aG9ueSBQZXJhcmQgd3JvdGU6DQo+IGRpZmYgLS1naXQg
YS90b29scy9nb2xhbmcveGVubGlnaHQvZ2VuZ290eXBlcy5weSBiL3Rvb2xzL2dvbGFuZy94ZW5s
aWdodC9nZW5nb3R5cGVzLnB5DQo+IGluZGV4IGFjMWNmMDYwZGQuLmZmNGMyYWQyMTYgMTAwNjQ0
DQo+IC0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9nZW5nb3R5cGVzLnB5DQo+ICsrKyBiL3Rv
b2xzL2dvbGFuZy94ZW5saWdodC9nZW5nb3R5cGVzLnB5DQo+IEBAIC03MjMsNyArNzIzLDEzIEBA
IGRlZiB4ZW5saWdodF9nb2xhbmdfZm10X25hbWUobmFtZSwgZXhwb3J0ZWQgPSBUcnVlKToNCj4g
ICAgICByZXR1cm4gd29yZHNbMF0gKyAnJy5qb2luKHgudGl0bGUoKSBmb3IgeCBpbiB3b3Jkc1sx
Ol0pDQo+ICANCj4gIGlmIF9fbmFtZV9fID09ICdfX21haW5fXyc6DQo+ICsgICAgaWYgbGVuKHN5
cy5hcmd2KSAhPSA0Og0KPiArICAgICAgICBwcmludCgiVXNhZ2U6IGdlbmdvdHlwZXMucHkgPGlk
bD4gPHR5cGVzLmdlbi5nbz4gPGhlbHBlcnMuZ2VuLmdvPiIsIGZpbGU9c3lzLnN0ZGVycikNCg0K
VGhpcyBicmVha3Mgd2l0aCBQeTIuNy7CoCBOZWVkcyBhDQoNCmZyb20gX19mdXR1cmVfXyBpbXBv
cnQgcHJpbnRfZnVuY3Rpb24NCg0KaW5zZXJ0aW5nIGF0IHRoZSB0b3AuDQoNCn5BbmRyZXcNCg==

