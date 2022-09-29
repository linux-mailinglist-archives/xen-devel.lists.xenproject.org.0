Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6AE5EF81B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 16:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413837.657759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oduys-0000Yw-TV; Thu, 29 Sep 2022 14:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413837.657759; Thu, 29 Sep 2022 14:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oduys-0000Wn-Qa; Thu, 29 Sep 2022 14:57:42 +0000
Received: by outflank-mailman (input) for mailman id 413837;
 Thu, 29 Sep 2022 14:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRGE=2A=citrix.com=prvs=264d7c073=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oduyr-0000Wh-OH
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 14:57:41 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f00bdcf-4007-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 16:57:39 +0200 (CEST)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2022 10:57:26 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5679.namprd03.prod.outlook.com (2603:10b6:a03:2db::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 14:57:25 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 14:57:24 +0000
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
X-Inumbo-ID: 0f00bdcf-4007-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664463459;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9z4YDhr3dQB+hc/d1y800HmTu/KFahLn3u0qMIcv90Q=;
  b=hYdO3v3XnaDoqu45N+WQlb7aDXSbnFZAEhBCsC5uGYT+vY9A5S5EzDeh
   G1WJBLzOuUwhCPC/XrRssCqny1iRH5K7Yq0DIJqBmEHUxXtT8lDt7OQOs
   HzYe+JKjN8MZOTN/deOGR+judEN8b17aC++bFVhmEimcW6EzX5+qU5lhf
   8=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 80757216
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2VW29KvlDRvNFsOYZjouQkJwMufnVE1fMUV32f8akzHdYApBsoF/q
 tZmKT2POKncNmHyKdFzb4ji90sA75HQx9cxSQE6+C5hEiwX+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiefHgZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI01BjOkGlA5AZmNKoa5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkR+
 dICdSg9Xiq7pOecy6zgZtZvos0KeZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpj9ABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+Xwn6kAttMfFG+3t83owHUmlMcMz8Pdl2e+tnhu1GXR+sKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluP1TM9KGYDYWoISFUD6ty6+IUr1EuXEZBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:zv8IJK6aI6ayAD6eJQPXwVOBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0l9
 gsAp4Y6o2mcfVmHJ6VJN1xNfdfWVa9Ni7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.93,355,1654574400"; 
   d="scan'208";a="80757216"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jh3zgQU1UGG7Ueb2dPn/hoFRSLSuCw0APxOFdLbKzUb4SsX6ny1e/n4BnINEt3w1ya6L/Igfyw+Eo/NfB/4pcizKWRcNASJ01raAU8NZChbCA5BX521ds9EyC7umIr2lvcR7ndkB3097yfj0yQ3/YJ+NH3NgV0XjNopTSBtwgxXKVXB301zuDcJT0FGpVubkyMebW6shcozKQ4sG5NujEWeBsqUpyehKmfqxtl4vU+BOlxNQ7u70gy0U9xFAYdoAv+/Jn+SI5IffekG0oTZiC7SnOntE41obplKenNZIV0Ti/ai9O6gUg8ZFpPk3GUWFqOt8Rq97Lma8ySH2fvmk3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVQOwU8zTN9mB4zbEtBGlzQz2eWfvIeCIwyb0JHS7Ic=;
 b=BbEFJUCehlDsS2pkRlL2G7/QHjZYA0cCNXQVXIGviSvGXneTn1zwstR82Yfk37Xn7bOF25ua3MmZ/Uga7WvbRvvKTi/ViMPzJwr60TI6J7tFhzVtyO8Qoz5WiWZySiqftbJ6x2meHIDNnnn+YQBhxARAXlhOTssfMskbQcnhG1yD+igGdnLo8i5NQdgkO8qQnQnWI1+52jvQsaYDW6stu38a+oh3GNrxcour1LVzT9Si2hfg5K31ZrtSx0ZTSr7vAutGvbRhtesZ5QfBW9peJ5rSQ/2h7kip6Uxzai2UI11+laYU+5YnFLTySkd49YTeJmSmOlvi6enxqNQmAweRfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVQOwU8zTN9mB4zbEtBGlzQz2eWfvIeCIwyb0JHS7Ic=;
 b=dQktyZozoDtiZCLk9ifIAhmTViFsM3+vxWlNXSxckkvBZEgC4cfpfqMI+bgEebXD4IAikXxW3HDKtfbpnon2IEuNaqHQmlaYHCzDcjR94ut8GcjLETCCqyM1K0GL/wvejPku+tfABuZXeE9yHAymjyNlTelIu07U5NJhOCN2nSo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Sep 2022 16:57:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/NUMA: correct off-by-1 in node map size calculation
Message-ID: <YzWyTtkE3g7nmCwu@MacBook-Air-de-Roger.local>
References: <adb17b3a-f57d-0a34-73e5-6f32ec60ab5e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adb17b3a-f57d-0a34-73e5-6f32ec60ab5e@suse.com>
X-ClientProxiedBy: LO2P123CA0046.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::34)
 To SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e98f2d0-dba4-451b-c61e-08daa22aeac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v19eMwh/cNvnOEsB5tJCqKmcYeIlFbf0KaXSX4oTUa1vpd1krLo2k6PU2GKyyxdzTSM9mTJqSNhPxWhd2BHMwqWPaWDrVZ/bWW7RLYn65D/Sf8ZAWpRnvxN6oUt66hq6Ib7WCuBnsLSk6LQ4Vank23lRiBtYrwsN6UZCATMX+fTO4XDeci+DVHhmIMXuU8tU3BUSdO1w7zajTvXdSRXFxIP1Uk28JZRq+26KsCK4dGpzoJaMvoUUsQAj6Nh0GE+SnhFW20FGvwKWNBqKc/wf2VyU6HRR8J1ar2CUzAmw9Y4vZbj3VAAM5CDRryKrYlE3NfZEztkmz/zL3afwFVrAPO7ybGI30VcZ9aNed3OyIBaIJamil60pLnmxgR3w/7EgSn2040MnW1eeBqaXdbL2jvvaL/zrWBgf/7e8B5L8QoSaGtuiCntsvAHblBokNj51X0GMV1HYL4lNDwJzcJ51AHQhrCHRpVUxAxqGyawuqp2s20X1l6aFdsjtqHjXnyoEk68LQh9bf4aFE6xSJ0E8pNEZ55Uxbzj5y7QjuN95uy9zzKVTyNusbZkzWtjSjRK0EEyi1TdmVcKH244KDFWI9p/Yo8buVWeqtEMS3YqSeM8Nk91E5H6qXpLG7r7GDfp0oDiiAtA6rAG23/L3G9xBMTkFY048AdyGG+kN1CgrJRx64AS2E/Zy6YrP0il0dii2P7UXo7/Ra++LXzBuRHgIkA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199015)(6512007)(9686003)(83380400001)(66476007)(66946007)(8676002)(186003)(26005)(66556008)(6916009)(41300700001)(478600001)(38100700002)(316002)(2906002)(86362001)(4326008)(6486002)(8936002)(85182001)(6506007)(82960400001)(6666004)(5660300002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXFJZVV2bzJTUURTSFJ6b2tQNG9tUzVwend4N0xpMFhPRnYwYjl4aVNWRW1k?=
 =?utf-8?B?a0VuN25EMWFzb1VxUmpuS0RXdHhiOWlqcVlTeXlqOW1XRjlNQU9mbHFuWUZN?=
 =?utf-8?B?VGtKOHFFYmNQelVrVDNSYk9vTVRiMzc5aFVBYXBncWNnalRFT1pRRnZUUTZU?=
 =?utf-8?B?SkxJSXVKaWlkSTdRcnRNS1pVNU1IY0xCZGs5dDh5eDZTY0Q3RzVvU0prQWpT?=
 =?utf-8?B?Tm5TQTl3aXVxc0RZSE16MWp0OVBraGJSVXI4T1dnVVlxKzhFaS9aV2ZOUUFz?=
 =?utf-8?B?am9GeW8vaTBGNDR1Umx1SmIrTkFhMXg5K0J2Uy9vNnUxY0JLU0JaemtNYjBi?=
 =?utf-8?B?VjNQU2NvNVowRXluYXlxYlBGd29zU0Q2NWpWbTFzSzhzdHdkSVhFY3h6YnRv?=
 =?utf-8?B?bFVrNTVhQ2J1Y0JCVktrdWtjSnZmN0REVHlVbHFvWkd2L0xSZnhPbkJEVzRM?=
 =?utf-8?B?NWxGWUc5QU5IbTJpVEN3dnNmd2kvcmdOZmJWcWZjRnhJMk9MNC9jOUV0WUQ4?=
 =?utf-8?B?T3Qyb3lDaUk5YzEzeGg2ZjdOZ1RzVWREQUZtUnlSLzIyTS8xck0xcTkraFM4?=
 =?utf-8?B?aEtVa1F2V1BNRDhsYW9QQThTZHYyUWliaG9NTnh4emdBY0IzKzhhSDQvTHpy?=
 =?utf-8?B?a2huUFpoMit4YUhZSnkyUHZhb3ptV3VKMkVQVWlUZVBSM25YZzErdUkybXhQ?=
 =?utf-8?B?ZDVZYXcrUXV0YUJ0YjRBc3IybXk1WVdycWlOTk9pelQ0ZmFYSytpRXRpR2xQ?=
 =?utf-8?B?UlBUQnUyY0ZYMUtYV25nbHl4OUdvTzlSZytjTCtsckphd214NmlkQTI0YTU2?=
 =?utf-8?B?aktrTFF4am45ZERHNjdYMHJGTGxLWnNkSUhUalA2UmlzaHd1ODcydTRQM0dD?=
 =?utf-8?B?MUc5c2JxS2dQczJ1ZEQ4ZlRtNXFDWnBxdUpqVER2RHJtK1lHMCtxejZUOGlm?=
 =?utf-8?B?SGhobVozWnA2RVRoQmhvMUpDV2Z5RFZqOXRQZW44djQvUDBydVBvMmpTdXo1?=
 =?utf-8?B?ZDJNOExaM0xlcDJIaktOcXhOSEtKY2JQSGpuMzU3RlJjay9EaWhJQUUydk9Z?=
 =?utf-8?B?TjJkbUtkZTl3bjR6d2YrV1ovK2JlcXErcWhrdXNBTWJwYzRtM0hsZ1pCT29q?=
 =?utf-8?B?MGdoTHNrV2lGcXdVYkxtN0JiMXdmSGhpVDhzc1Q5M3ZKS0ViRVBjZWRkTy9O?=
 =?utf-8?B?dDM5eDAyZEw5SHJVUWxRQ21FTERwVG5OZTBMMVprNjcrMkt0RUxQRVZhMFBI?=
 =?utf-8?B?dG5vQ0hxcVpnMWUxSHJHOTVGajdCbjBMTlhSOGVlMkRBd0dodC9QbitpVFR2?=
 =?utf-8?B?Q3pVTjdQaXp5aGpJUjZPa3R2ZzBRckxKR3lQMTBveWRncks3bElWRG92c2dl?=
 =?utf-8?B?SStXMjYxQTFhc2phRzhQb1pVVzdsZ2xFNEpBWFdXMWE4V0tMSGxsKzg5Wk9X?=
 =?utf-8?B?eGRZaXhSc1ZHZmg4bVV3aFh0dEVFY0dsSndBejJ5TWpDOFBKbzNDbVZrc1lM?=
 =?utf-8?B?WERPTy9aMnVodEdVbG52T2ZGYWpuTEtLZEV3SHpITGkvdWJDQ3dvN2VaYXJ5?=
 =?utf-8?B?V3dDaGFhNWFWUDRwU1ljbktaelR6MVZrdFhuSnhtUVlQcmdXV0hJWVVmSTJD?=
 =?utf-8?B?a3RpeFY1OHVvSW1VbkczWnhxVE9KRnJXamNneGpoMFRjSWpkcTFGU0cwaU8x?=
 =?utf-8?B?elZaUUptL1prMGZBTWpOdENmb1NybUg0M2EyTWhneU9UcEVJeTlMTjlTdXZT?=
 =?utf-8?B?Y0hjSTA5cHdpc1JZRmZVakNya0xIRUEvQUt2cWJ3azcvVTRUakI3Yno0VXpx?=
 =?utf-8?B?THowa1BNNU5UbFd2Rm81VmNITEZXaEJ1V1BaZFVveW5BVEVKQlg5TldkN0VB?=
 =?utf-8?B?R2ZZd0J4VU9Rekgrblh6NDNsaFFUNTRXYXRYNW5QT0xJa09xclV1dWNmL1Rv?=
 =?utf-8?B?UmcrNWU0dldoN0RQNnpqMlZXTFo1cTh5Y3dsRGViY2pxNUFuMiszR1gya0lk?=
 =?utf-8?B?YXdWMFdpQnUyd3VqTVJ5ZnQ5QXNiZDVZQVM4YjRCc0NjR3QvbVFObUVvdGE1?=
 =?utf-8?B?d3dFOHZMdGpRUlptbHczd0ZtT1NqcjgzZ2dhMW1RMVJtcWw1MWcwcUR4K0Rw?=
 =?utf-8?Q?XPQ1JYxD7UQhx7jh/SQKOOHN/?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e98f2d0-dba4-451b-c61e-08daa22aeac0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 14:57:24.7263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r75pwLCbpuoTjaArs3NFVC4VGJ4Smx/ViKIDJ8lZWBlH415zLZ1L3XzaWYFFBDlITkDo4qOy6u4hE0l2GvMN/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5679

On Tue, Sep 27, 2022 at 04:14:21PM +0200, Jan Beulich wrote:
> extract_lsb_from_nodes() accumulates "memtop" from all PDXes one past
> the covered ranges. Hence the maximum address which can validly by used
> to index the node map is one below this value, and we may currently set
> up a node map with an unused (and never initialized) trailing entry. In
> boundary cases this may also mean we dynamically allocate a page when
> the static (64-entry) map would suffice.
> 
> While there also correct the comment ahead of the function, for it to
> match the actual code: Linux commit 54413927f022 ("x86-64:
> x86_64-make-the-numa-hash-function-nodemap-allocation fix fix") removed
> the ORing in of the end address before we actually cloned their code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Really the shift value may end up needlessly small when there's
> discontiguous memory. Within a gap, any address can be taken for the
> node boundary, and hence neither the end of the lower range nor the
> start of the higher range necessarily is the best address to use. For
> example with these two node ranges (numbers are frame addresses)
> 
> [10000,17fff]
> [28000,2ffff]
> 
> we'd calculate the shift as 15 when 16 or even 17 (because the start of
> the 1st range can also be ignored) would do. I haven't tried to properly
> prove it yet, but it looks to me as if the top bit of the XOR of lower
> range (inclusive) end and higher range start would be what would want
> accumulating (of course requiring the entries to be sorted, or to be
> processed in address order). This would then "naturally" exclude lowest
> range start and highest range end.

I'm not familiar with the logic in the NUMA code, seems like a
possible optimization.  It might be good to include in which way a
bigger shift is beneficial.

Thanks, Roger.

