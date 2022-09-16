Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E105BA98E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 11:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407876.650535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ7nJ-0003ZB-Ns; Fri, 16 Sep 2022 09:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407876.650535; Fri, 16 Sep 2022 09:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ7nJ-0003Vk-Kc; Fri, 16 Sep 2022 09:37:57 +0000
Received: by outflank-mailman (input) for mailman id 407876;
 Fri, 16 Sep 2022 09:37:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHCK=ZT=citrix.com=prvs=251a9f4e5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oZ7nH-0003VL-PT
 for xen-devel@lists.xen.org; Fri, 16 Sep 2022 09:37:56 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b95474f-35a3-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 11:37:53 +0200 (CEST)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Sep 2022 05:37:44 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN9PR03MB6107.namprd03.prod.outlook.com (2603:10b6:408:11c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 09:37:43 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%4]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 09:37:42 +0000
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
X-Inumbo-ID: 3b95474f-35a3-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663321072;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mc2nJ1snMab3RF5GejHaik3NRr7ALviPop4XuGC8W1g=;
  b=AYh9qsUlXthcv33I/RtuDrJxTyYA2HF79S0hyot5MU8icpAmUsyTOJvd
   Opgq0U1Ie3PP501/YYEwk4JSVnZ8esBbjdCMv4azSRE/GuNpy+dCjMOB1
   tEaWghRLLV9rVHUKtjS1cnPCJV3H1LGNOsrGAsqZWSsykHWAZbZiDS7b0
   U=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 79817449
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mjSygK2soeuVd3Zo+/bD5dJwkn2cJEfYwER7XKvMYLTBsI5bpzAGy
 2YXXjuHbv7Za2ukedh+Od6zoR5X68fQyoIwTFFppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQTNNwJcaDpOsfrS8U035ZwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6/g+I3hqZY09xqV6JX0Xt
 vE7MncvTR/W0opawJrjIgVtruIKCZCxeaYg4DRnxzyfCus6S5feRamM/cVfwDo7msFJG7DZe
 tYdbj1sKh/HZnWjOH9OUM54wLju2Ce5L2MwRFG9/MLb50DJywN8yv71Ocf9cd2WX8RF2E2fo
 woq+kymU0FDa4DDmFJp9FqererKuDj9dr4eBaCg18Bq20aKyn46XUh+uVyT5KPRZlSFc8lNJ
 lMf4S0ohac3/U2vCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5UCeHGdsc9JaQNkvtctzQCNw0
 FaMxontHWY37OPTTm+B/LCJqz/0ITISMWIJeS4DS00C/sXnp4YwyBnIS76PDZKIszE8Ihmoq
 xjikcT0r+x7YRIjv0ljwW36vg==
IronPort-HdrOrdr: A9a23:YvOEqa7ac/HpqAlD8wPXwS2BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcV2/hpAV7GZmXbUQSTTL2KgbGSoAEIXheOjdK1tp
 0QD5SWaueAamSS5PySiGfYLz9j+qjgzEnBv5ai854Hd3APV0gP1XYaNu7NeXcGPjWuSKBJY6
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWiSw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYErhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqnvd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7kl6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklWqvoJBiKp7zPLd
 MeQv01vJ1tABKnhjHizyJSKeWXLzgO9kzseDlDhiSXuwIm70yRgXFoh/D3pU1wha7Ve6M0mN
 gsDZ4Y6o2mbvVmGJ6VV91xNfefOyjqfS/mFl60DBDOKJwnUki926Ifpo9FrN2XRA==
X-IronPort-AV: E=Sophos;i="5.93,320,1654574400"; 
   d="scan'208";a="79817449"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CU6SuHzhW34mDfzZprCNJqm0KthFcLA3bZS25FtawgQod+W2dOL2CoL8UuPblARQaraTYevUIiAa3DUXCbucoAwkhCxCGpDSqozRiuT5Eq2FOLfAMv4MCURYeDiEEj3o38KdezCE+n+zbKtrSFaG///LcWiPhbR6NL7emDW0bxI3Bv8fgJfJg0e9TIvHFXMriRbIb5TTQCOUHbxzkVVJ450nhCO6D4DC/y80Jb8NAFt/35V07p1Q4JZ4W+yN5hPXh1nisjV2KYgrSmrBhjWWHEvMkZ40sHpCzjWOHwJfjkVqb4ZgOFbPGTCk3WzCHrpx7N1hGnKpAfvf2G8ChF5kGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47SEWiMq5Kg7lanT8g2K8KCV0HeDgSQYEYpcOst/oUk=;
 b=di9jGT5Q9NnGZzlPJXgiG1kSNTbH26PdN0npJEF4uj6Yx2PTG7G+0G7kg1/0MxWJ0e/zB8+VeP7NrP8J1p13tUhBQ1HTH/kBPsLZIJBRHZn8HozGDBEOF+mwY/t4pPaO3452ZN+boP0+I9geNEt6lg6ykSj99snMhmaaoz/K+btrKPQCecB3gvjjOYLFjSe7+FzgHhumtaikabp3ib1QmdPofowsd+ZCrYL7hk5dYfYLiJB8TTI7iMRIHcYEEDykwiJrTnrtB8zekiPCtmqOoh/qIr7L8QNb34nz1f74G22NX7w1Uuro7bRUb9ENGC0IhdsN/aCy/WVUFdS7XTFHMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47SEWiMq5Kg7lanT8g2K8KCV0HeDgSQYEYpcOst/oUk=;
 b=V4KeQ6BTrJsmv3iD27W8CuYtjdjYqxJXhMLV8skqRdI3ViiLo5Sn4nD3Lu+5gGXbyy/APNN2yLrCD3fXURtMSrbBlCeAve9FEfRWL2obE99l1G21P0epqTZ1KDqThprMgSYyoOCqpX2QaMwK/DRM7SYmIG0apmsp2yWxjA4O2ZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 16 Sep 2022 11:37:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Adam Szewczyk <szewcson@gmail.com>
Cc: xen-devel@lists.xen.org
Subject: Re: [BUG] problems with NICs pass through to OpenBSD guest
Message-ID: <YyRD4Zq9XSusFM9W@MacBook-Air-de-Roger.local>
References: <CAHsotTjE_n8XcCkVFTbynCYVw_LdM2oyiAAH2KCxh9MELxq-YA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHsotTjE_n8XcCkVFTbynCYVw_LdM2oyiAAH2KCxh9MELxq-YA@mail.gmail.com>
X-ClientProxiedBy: LO2P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|BN9PR03MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd2c10f-876b-4659-cbc4-08da97c71a97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PPm0IARsMspBsaQdUP1K578L2s19eC+RFRwoV6P+SvaQ6xfbkEwOETLMgSE/vKS26xo0NGiRTeq6SBmWcYI9xqbc8vdnllm4nj7JGZ8BgmK/iU3Hd5HMM2rqkK5NE9MI1VypBsU/Ne8erCCE9VYP/JGUlcW+2xU1413P6Fqk1D+xSpZOHsKUHmFxPKX3fubX5sBmMQ1wENAUh5ylnz4z9IL0oldaUkuXd6qi7tnrNR8koBqfxor96Znw6wf9SfkmTgwBSkoaIe19Rvckimoym5bSQACGA9A18m88Wvjpmmck/k9B0OfSSsontp05leLSG36ZZuj0KyTQpnkD2ex48/RaJi6AT40ZWfpbUkld+EdRQzrqZmm7cbfumQ/ekCHOWpByN3y2xU0tEolOosIBtVS2eiPEhoOvZrvXFd4f2rOTMWagniBEUtl21ipvUWaI+W2Jw3ObdjCQcOCsFeIyuxw1PYWQw1INgDvlPVqUk0VDiXLginzmyhFnxa6u7EKEK81g2u40FTbxRfxf7rofrCpN/MkiHjitdKsA5ZLIo+F4D34aZFSrJSXuzurTVLqUUPfGj96jGrd7N3uR+ZaZigbf4t7rVFcv6Rj00CAvMmJ9zySBCqwPx3NIa07ffmKfKyM+L8oMY/P+ATxtwZMETtNAlHbfhOqrAoHgB+Lg8GE9B2X0w7a041vkNJa/gw8ZYA7WB/pcJq3sl33e9pur+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199015)(85182001)(38100700002)(8936002)(26005)(6512007)(9686003)(86362001)(6666004)(6486002)(41300700001)(478600001)(186003)(6506007)(83380400001)(4326008)(8676002)(66476007)(6916009)(66556008)(66946007)(316002)(82960400001)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qld4NTJia3lWaDc2MU5LVGJobnFiR0YxV0d0SnhIUk50NUVnL3lGbzUydDNS?=
 =?utf-8?B?bnY0SVJSYmtUYkRtYkRaTTVHUXp5TE5wdjhOVEJkd2pCT3BHRkxDUkE1c2NI?=
 =?utf-8?B?THd6WG5KclM5N1dlcmt3SmprZUJHNGhWZC9hNTU1WEswUUpFOEFybUQzUmRz?=
 =?utf-8?B?WkJHM1dFOWZZYkRTTlFyVTFBbUJhK1RwbXJqU3huenNtOERsNFZpOFRhWGlO?=
 =?utf-8?B?Qm9Cc3lRK2tWQ1dPbjdFSWtUL3k0dURDTUFaZUtSTHNHTFZLVHFzSkJacUpI?=
 =?utf-8?B?eFBBa1lXUEtuUkx3RVJlaWRvclFCRU5lcVlwSHFEVWhDWnF5S1lCRFFpQS9q?=
 =?utf-8?B?dFBvNW96OHZJa0Zwb2cxNklGTG00a3ByV0ZjSnVPMmhpNnZPU1VURlpWTnZp?=
 =?utf-8?B?ekhzc2x0OHFXeVRaeGVTSDc4MlNJSlBBTG9vU3pWY0VOVXoyeXh2djd3eS9R?=
 =?utf-8?B?ME5sQzhEMURFREp5OU5MRHJqRXVla0Jub0NmUERId25KSVVZMjNQNUx6dy9E?=
 =?utf-8?B?Q3JyQkg0d3E4UWVHQ082dGhNNzdjWGhLRzU2bEgxdjY3UmlzMk5RNmluT0Fm?=
 =?utf-8?B?Nk82UUJJaXpUNUNCenNjQkZOOW9mV0R1S1UvSHNCdFBUa213MGM1SnR0akN6?=
 =?utf-8?B?VXczUGZIN2o5cmFsZitrR3BUQmkvbXJpUU1UUEJjbzdZZDNYK3pYSVdPSDRP?=
 =?utf-8?B?M2s1RWVaMEZyWEpNYm52MzhYa2owUkY5d3JxbDdQTUJyVjVUcXgxampJTG0z?=
 =?utf-8?B?KzkxVjZDR1NUTW9taXRyRFVjNjV2UjZncmR0ODVtRHQxZ294cTZFaXgzQzNj?=
 =?utf-8?B?U05BVWtHb29LYytic2dqeVVWZFdrWHpvMEI1bUNvZTZTdEo1WHBFaDBDTk0w?=
 =?utf-8?B?QnFyd0NJZXM2OGxHSW04UEdBS09vRDJBYjdDNlF3bmtRY3dCbWIzRFJ1RDFS?=
 =?utf-8?B?dERtZm9tVzZlWmxoYTBocUozWm1ramNJc1NPdUpIV2lqYkpKeFRiVmFUWXJp?=
 =?utf-8?B?ZVRQRVBnYUk5TEZUSjBPeGtVd0VjY3dSZjd4dFB0Tm9BR3BFVlk5a01PU0FP?=
 =?utf-8?B?eXhXNkM4bWN5cm5MeUlpS2w4NCsyOGZrZldkVlVjTEVhdmxNOG9RVWx0VTNK?=
 =?utf-8?B?WTJSYkdRenRKczF2R2hWQnBzRU9YTm5LM1FGL290S1Q1L2Y1YjhBYVlaV0RZ?=
 =?utf-8?B?N0ozNTJRMGdWT1R1ZGY1TGlubDhOTllLRzcrQXpvUEZJTjJSRjI2cXh1NExN?=
 =?utf-8?B?ZVptcllWa0piRW9HZmFSY3NjODZ1QWIrcjU5YlFBT0p3WHkxSEIzZjliWTJy?=
 =?utf-8?B?YkZqYnQ3SDBUUXg4ZEc2ZjBDSGRGOUpORTNuN29ienNlVGp0UU5WamdyZWlw?=
 =?utf-8?B?Rkx6dUhaeFVWbWh4cFpwRTZJeGxBd3lWOWlFWU1zOW9qTDlHRm5JdGhsMzNN?=
 =?utf-8?B?NC8rdUx1MGx0WG83UEtRYi9uc0hnUkZjVFJ0S0k5NFhmajVEZndxL0xvVExh?=
 =?utf-8?B?RXN1MXNsbEZnMzJSR25VY3daVlpYVm1KdUppNS9GVFRnaStISlA0Z04vVDVX?=
 =?utf-8?B?MWdXZVpMV1hNNkRLTHlXaVBzNHQyZlpIZmVsbGJCTlJvYU0rVWNZVTRWUUNL?=
 =?utf-8?B?L1Fqd1pJdlpTSVZYR0JJalZINlJJYk9sZ0ZqSTdJVCs5d1BtenBPTEFENU1a?=
 =?utf-8?B?L3F6NTAveEp2QXdZT28vbzFjUytzWGZCaHdEYkpOTFJaUTJFdVNPV1lPVTJM?=
 =?utf-8?B?WW94VDJiQU4yL0R0OGNNVUQ5UThTdGdXSG4vbjAveWtIS0hyMzY2cmJ6dUtG?=
 =?utf-8?B?WVRmSzByNWI4Y25hSUxrUnMvS1QvYnFHK05aaEN3OXlKZzlVeXAzcVlMSDZs?=
 =?utf-8?B?bzM5MHVTMnRSRkk2dG1sLzhxMzB6ZFlJZVprdTFHaGV1dmF5akpXWlg2RGVP?=
 =?utf-8?B?WUQwQ1plc1ZSQU9SYmJwd2J0d0FDVlFJbVkrbmVtZ2pMaUtuQjQwMFRjMkJw?=
 =?utf-8?B?cllWOWdwL0NVa3djdEViRzltV0gycnNlODZJZ3pkUm50RVFKVXhjc0hZZ0ZM?=
 =?utf-8?B?RHFlZ1pYazJRV3BMNjBucGdzckkyZEtIYUs3cnpHZDUvTWVycTBMQjVwc2pq?=
 =?utf-8?B?SDZyWGx1RG1SZ2I3cHVwTmNnbEUwK3Y4aGVhZEZVWTU3dERuUTlTeXkyMnM3?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd2c10f-876b-4659-cbc4-08da97c71a97
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 09:37:42.9131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UE6pfnZKbC3r0caTUaqDgy9PY+00ST+DWMgL3ALReEF9P2jGaAMOxJtzy/rfnaOj7a8jXLe/dkk7HYH2/HYVow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6107

On Fri, Sep 16, 2022 at 08:22:43AM +0200, Adam Szewczyk wrote:
> I have QubesOS 4.1.1 with Xen 4.14.5 hypervisor system on which I want to
> install OpenBSD as a HVM and pass through my NICs to it (Intel Wireless
> AC-9560 and Realtek 8168 rev 0x15: RTL8168H/8111H). I tested that when
> installing OpenBSD on actual hardware both NICs seems to working properly.
> But on hvm ethernet spamming me with: re0: watchdog timeout messages and
> not working. Wireless causing OpenBSD Panic!

Can you also paste the panic message?

> first throwing errors like
> this: iwm0: fw chunk addr 0x404000 len 712 failed to load.

So you tested with two different devices, and both failed to
passthrough.

We need to analyze the issues separately I think.

AFAICT, for Intel Wireless AC-9560 you get:

iwm0: fw chunk addr 0x404000 len 712 failed to load.

For this, could you get the output of `pcidump -v` from inside the
guest?

And for Realtek 8168 rev 0x15:

re0: watchdog timeout

For this one, does disabling msi fix the issue? I've been looking,
but have no idea how to prevent OpenBSD from using MSI interrupts,
either for the re interface only or globally.

With MSI enabled, and the guest running, can you paste the output of
the 'M' and 'i' Xen debug keys?  You can do that on the serial
console, or alternatively:

# xl debug-keys 'Mi'
# xl dmesg

You will see the output of the debug keys in the `xl dmesg` command.

Regards, Roger.

