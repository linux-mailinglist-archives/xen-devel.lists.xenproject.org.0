Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9889A5B756C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 17:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406472.648867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY82Z-0007Xe-Rf; Tue, 13 Sep 2022 15:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406472.648867; Tue, 13 Sep 2022 15:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY82Z-0007Uy-Ow; Tue, 13 Sep 2022 15:41:35 +0000
Received: by outflank-mailman (input) for mailman id 406472;
 Tue, 13 Sep 2022 15:41:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lgvl=ZQ=citrix.com=prvs=24889d1cb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oY82Y-0007Us-Tb
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 15:41:35 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 884b9c77-337a-11ed-a31c-8f8a9ae3403f;
 Tue, 13 Sep 2022 17:41:32 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Sep 2022 11:41:19 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN9PR03MB6012.namprd03.prod.outlook.com (2603:10b6:408:135::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Tue, 13 Sep
 2022 15:41:16 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 15:41:16 +0000
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
X-Inumbo-ID: 884b9c77-337a-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663083692;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Gzi+YsXN5uS/ov0zoXvbasJxi/PBOGpTh+thdcn4ucM=;
  b=HxraF27HjkBdEQD1iVcQpH58/UQ9GGRBx8NsqucKiEOFUq0RzL+av1zV
   lIooXGaLJZxITf6puE0yChsF6IDGv6k4PJC9nxTpIFg212Fa2eglgXG+a
   fFu3oLI26ySB0/sJG/9j5oaHG910wx3GwUgNLo/1kINmdsI7vhttJFDo0
   U=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 82929062
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VwOXWKsAWTEq32uj8bTtA45Yu+fnVERfMUV32f8akzHdYApBsoF/q
 tZmKW6OM/yNYGDxKd50OYqz9UpX75TXmNBhSABtrngxFi9G+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyj4WhA5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FYYb9PR0Xntqz
 P0JJig8a0uAqcip/b3uH4GAhux7RCXqFKU2nyg5iBv/XbMhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9QLT/PRni4TQ5FUZPLzFKt3ad8bMXcxItk2Zu
 njH7yLyBRRy2Nm3mWDUqCP02LWncSXTetkuCLqbq/RTpliQmGIiFEcuZ2WBrqzs4qK5c5cFQ
 6AOwQIsp6Uv8E2gTvHmQga15nWDu3Y0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neWm/v5CDopt6eaIU9x7Z+RpDK2fCITfWkLYHZdSRNfuoez5oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr/hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:xK0xeqG9RymDbmxwpLqFDZHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHP9OkPAs1NKZMDUO11HJEGgP1/qA/9SkIVyEygc/79
 YdT0EdMqyWMbESt6+TjmiF+pQbsb+6GciT9JrjJhxWPGVXgs9bnmVE4lHxKDwNeOAKP+tPKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+yLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHffWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdqTXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MH40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIeLH45JlO01GkbKp
 ghMCmFj8wmMG9yLkqp9VWH+ebcEkjaRXy9Mwg/Us/86UkkoJk29Tpa+CUlpAZwyHsMceg62w
 36CNUXqFhvdL5iUUsvPpZ0feKHTkrwfDnrDEW+ZXzaKYBvAQO8l3ew2sR82N2X
X-IronPort-AV: E=Sophos;i="5.93,313,1654574400"; 
   d="scan'208";a="82929062"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EruD3GtNEKiKgI6ZaVfzuF0c/KPM4ye35EuSprgL7pe0Em3rAoSSO5DP4Tontn1pQaJAosg/VPFoEgnZ4pkwdFyFGxY99s+NEVMZ/7fy7VwQD3J/Ig/1ekugLsng++EyIQcLRD4PXVTcRaBgXyGpexEEuGCOqasPqG0hVzpYURRW5rZEPySnq+6c9QKQeYyXrKWGTKP+Ozsv+kvz36c+dB2cCnHs8TNq+swlSd3IylXqySlpwrhs7MgZAHcxcZa7QSu4CvqbKX5Q5kwXzHum8fopqLbBssUzOcIEW56NcDg0VVf6Ty16gzwTKhgNaNISgm60ekF5sLKqy7frpGV5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiGZopffOrsqHm6hSKlZXobArX9sGqYV8e5b0TiaAT8=;
 b=IjtIwsqKiB7PLB1n738Y5A/2tANL/auiowlU0I1CQwuCoTZcfzKbIQDIxEz5FtUfguXG7PfsE3qXeBVyYtzv3D3JZhXWyoy19I6mgp0lojeKGbJfTu66/V6Jee6kT3JIU0WgvqVY5mOMF/8S1zdD3faQjNeTXBL7xFiLnabpGnvHq0Ma6rvkP/n4wHa8XB8EjvttD4AeDcUxRj3g27Seuia6v5wYM2QSZFhbQ5hG81lkU7NweLCQlCZY37EXUToTPd8p/9Tc5yx74NweZgOCBBLiEQ/axNF/EVKwijTXQ6LIHaMDhoPyTcXXTCCr5U/HB56IdpYU6iTKA5ZY5VdEjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiGZopffOrsqHm6hSKlZXobArX9sGqYV8e5b0TiaAT8=;
 b=vhZ38WS0XunQnAJaF/EbDxRvf9VL69jRwYtgs15rMGamu7V3/AKBxjFv4iybBW+XGibLZumTtwZgc390/NTB2gxwR0IJtMjl53AmL0K/YyppcBV4caQpYhLnIPSnRG0CGsdGjzn4ispU7ggsqWzK+eNNo3BvnLRkfCoCWlpEeEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Sep 2022 17:41:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/PV: issue branch prediction barrier when
 switching 64-bit guest to kernel mode
Message-ID: <YyCkmGq5UQPwqAsX@MacBook-Air-de-Roger.local>
References: <e687a2ef-780d-edb9-938c-7cfa4237dde4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e687a2ef-780d-edb9-938c-7cfa4237dde4@suse.com>
X-ClientProxiedBy: MR2P264CA0159.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|BN9PR03MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: 291a2766-c9ae-4eac-6fb1-08da959e654e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aS7KiRJUT4bmLCuMU4KTXjFOn+z2DO2L97m2VtaAxbct/rY/kwSud1gWcH/1yPhS1XQuxwvSajewZJwQTNulPhq1IpmfSDdGd2B/SdjdWmnoNdgmpBMFlTriwxwopSGZICwHLqBRNWSOBJO/sL4XuV9iGXrt4ZjupjE5lt4ON2dnCr7nfeJBh1DI7z5k05nMYy0E85J+LuCJfl4f3krHJYmtjhtIEHXyT7FuEa1yjqlr0TncwG25zmotOBpdTpuwOYcBZ1axu1OR/n+9U2+gQRB954plOfTQCfuP+M2Whjs+TPrtKjBW7qOB69L6uzL0Ensv+XJMstnqavtAtJKpxVWDO/YxAEo6UBWuM2fUNykBdNKMzRbRq8sG4Gc9v+CMwlyOZa6KkrCL1gWJtI3SMq07IOqXjSwD6lZqYcGbm9PHrUjn9YVOux9tytUt0C83FXJatHneGep7oZZX/VmQx9cUqI6N+xeQ7YO0AGFhr0RxWf5ngnvXyv0Tu90nR62o7J5vnSCZMW1CMVDNeDEHaZ4hz+r2+Fg/RZmOhAmOLofd9gioMJzkRA4cMuvXU/iW1ycOz8HL1z4Cg7BzCn3mESvjShAtpjYRZ52625/V/uikObU3mvJjcH4SqLG+2esGO3dyGN0FRr+bS+SUfWObURnImEWnVd93l6Cd/81fWXn5jE+YR0dQscb244eLum1ygR3CtTZzNYk80cglL+jzVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199015)(66476007)(26005)(6506007)(6666004)(66946007)(316002)(6916009)(82960400001)(38100700002)(8936002)(41300700001)(6486002)(2906002)(478600001)(9686003)(8676002)(66556008)(4326008)(54906003)(85182001)(186003)(86362001)(6512007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXNoZlpsb1BkYnUrVDBnYXdJUEdhUjdFOWk2TUU0aDF6eEZLOURQaDZhSVJD?=
 =?utf-8?B?UlJZWUZzcWEyRlJSRlBJSFc1MDZaaVhuR1JMYlFQd3I2Z1F4VXBOMHVxVTJT?=
 =?utf-8?B?MHUzalZZczRxRnlYYk1sTmwzcVhxb0dkb2IyODFHZENJS0pDM2g5MnNyaytn?=
 =?utf-8?B?MkdyWE55cncyRGt0YnZGdG45K2grYnFZVm1sWlBWeWdSdC9lSDNKUlhVVlhl?=
 =?utf-8?B?N1ZGemx1bFIwWWxYajhNVlNna1Z2a2t2cVdsZWRkMTNDNDdHQmsrOHBmajYx?=
 =?utf-8?B?ak95MGdzMHFacWRHQmlxaHQ3V0daM3hEdG5oTENmb1hGNzFPNStEdHF2U01T?=
 =?utf-8?B?QjRjRmNjdldLZFIzdEREUHk4SythU0pMdytjRmFmRWc1L21Uckl3RmFsTlBz?=
 =?utf-8?B?aVR1Wk8yNTI5dFpjN3JZVUVOWDRtYUNxWHBmakZGZUMzRnJYSEsxMVNldlRm?=
 =?utf-8?B?NUd5amdJa3BlaG1qK0ZjYTJQenVIVHU3Si9jNm5aWWw5UHIrSG1ncXhOSkJX?=
 =?utf-8?B?WUw5WjRPQS9HR1FpZW1nbG9sKzNwNXg0U2ZWZkkrdllHVDd6Z0YralVTNWZN?=
 =?utf-8?B?aVlSeGV2b0lnLzJ6RTZDejNXUnMxbnVhUEw0KzJ2dHFlbHBETVVLdGJUYnAw?=
 =?utf-8?B?eTRCRU1YYXp0NWhyNFVUcXZldXU0ODRJTFZJYW5ZZnVwZlprT0RKd0l5U0Zt?=
 =?utf-8?B?cXhPU1pHNGNHa1cxOFNpcXZXckp4UnN1T3pQaUp5bFdtemVVU0lZT0RLUWtG?=
 =?utf-8?B?KzhhcTBhVjVPMTV0NEZIdFQzcEtYaWNvME93TXJMYUlkYmJ6REV3UWtPbGlF?=
 =?utf-8?B?aWQza0ZQb05LbHJ2VEx6dnAram1ka0toM003M0VVV1lLblNQUVFWSXFGM1k0?=
 =?utf-8?B?NWpuKzk3M2ttWmRZcHJBVmUxQ1VLS0ZQRm1wK3BqUlVmQm1aS0Z1MEtUaHdP?=
 =?utf-8?B?ZTM5QWtRWk1Gc1ZxQTZ4SlJHWWd6YjlUODJIbVdFK1h0QnVqL2tsbVRIMG9Z?=
 =?utf-8?B?RDkwc21ZRzdjbDRCZ3lqQjlZdFV0RTJwak1KZHVsbEpOMWcrWUs0cGVRNi9Y?=
 =?utf-8?B?VFVCRS9YN08va0QxTWhjQVRBeldZelppellnWCtMQVZOb3JiaG1URHpoaGVy?=
 =?utf-8?B?bnhIS0RCUEQ0T0FwY2Y3MGNVWFhCVS9BVWFCbVI4UUpZUkMrYVpITzc1aFhm?=
 =?utf-8?B?OXZPSXI1Ui9QbWJjU0dldzh6RkJXZWJ1MGRLT2xZdlhBSFRJV3I0dG1hSm8w?=
 =?utf-8?B?SmJZR1FZL2RlSCs1ZkluQzhpRlF6VWs1RlQyQVhtdEJtSzNDSVNXTXFpQmlS?=
 =?utf-8?B?b0tqV24xS2J4ZXdRSjdRaDRYZEhnV1laNUJaeUROZ3d1TFE4VTdZakF6bFl2?=
 =?utf-8?B?dlpXWDhRemhEMjVTZkkrbGlaT3hhT2VwYzZkUmhuSEE0WXhQdS9RSENYcDc3?=
 =?utf-8?B?WU0rQmlGZFl6eE1Tcml1dEZ3UVhoTDRyTGFIN0VoWW1uNzU3SjRsZUZZOEdj?=
 =?utf-8?B?MGZ5RnVxbmRlNlJpTG9FaXEycVA4Z01weVo4T3pQWXJrNU9PaS85UDErb0lO?=
 =?utf-8?B?RXEwdXROTW0vWDVwSFRaazZyVnZCVXNBQUQ1Nlg3eUo1dDhrbk00UjdIL3pX?=
 =?utf-8?B?eExlaStxd0xWajg5bnpRRkpBWG82L2gwTDFhL2RsOUt2b3F1aTlmcStjSXRN?=
 =?utf-8?B?Y2lEZk1IZERwY2w0eERqOW1BNTJpc3liVy9QTTZ6TUZVaWV6dHduWGhscmZU?=
 =?utf-8?B?WHd2aXh4M0VyR0FjU2hWeHJSR29ITnB3aHUwb1pZNEFJSFlkOHpBbFlHK0R0?=
 =?utf-8?B?SXRsTjlVZkdjWTBQWXdnNHd2VzRST0VCLzBkN2phbEpoWTJGbExIeWRiL2xt?=
 =?utf-8?B?Umlyb2lzaEs5TytnY3dJOC94TFA4OHB5MWd0L2dMOXhiRktINVROY2s2NjZi?=
 =?utf-8?B?OWx4YytBeUV1NlBZTmFIY0p6aU9peFF4dGVxanN5aWRxbHVLd0poK2NxdndJ?=
 =?utf-8?B?ZTFERURUellXVjJVc1NZMFE3c2lLdEhUZlRVMmcrdTdCMWF2M3RtbXA5SWJN?=
 =?utf-8?B?MXZ2TkRMbDNrU1lFZ1BkOGNOUE5jWE1GNGI0RDhQQW9qREVHY1dDbDBHQmxP?=
 =?utf-8?B?NWdLaFlCS0lKSDlTOW1vQjUyQ2ZabmtoSFNiQVE5L3pRTWFqTitmZjdjYWwz?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291a2766-c9ae-4eac-6fb1-08da959e654e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 15:41:16.6026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5ASK1ZdODmmIkynsjNTtxmjVE7IBG+MFBsPRTZ3N2ZzzFi9GOrfTgD5XeKR3SU5cjhPCiyOOYBWj8OxZ/cF4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6012

On Tue, Jul 19, 2022 at 02:55:17PM +0200, Jan Beulich wrote:
> Since both kernel and user mode run in ring 3, they run in the same
> "predictor mode". While the kernel could take care of this itself, doing
> so would be yet another item distinguishing PV from native. Additionally
> we're in a much better position to issue the barrier command, and we can
> save a #GP (for privileged instruction emulation) this way.
> 
> To allow to recover performance, introduce a new VM assist allowing the guest
> kernel to suppress this barrier.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Leverage entry-IBPB. Add VM assist. Re-base.
> ---
> I'm not entirely happy with re-using opt_ibpb_ctxt_switch here (it's a
> mode switch after all, but v1 used opt_ibpb here), but it also didn't
> seem very reasonable to introduce yet another command line option. The
> only feasible alternative I would see is to check the CPUID bits directly.

Likely needs a mention in xen-command-line.md that the `ibpb` option
also controls whether a barrier is executed by Xen in PV vCPU context
switches from user-space to kernel.  The current text only mentions
vCPU context switches.

The rest LGTM.

Thanks, Roger.

