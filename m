Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3667A77CE10
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 16:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583971.914340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVv27-0000Da-8w; Tue, 15 Aug 2023 14:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583971.914340; Tue, 15 Aug 2023 14:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVv27-0000BY-6J; Tue, 15 Aug 2023 14:28:31 +0000
Received: by outflank-mailman (input) for mailman id 583971;
 Tue, 15 Aug 2023 14:28:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTNg=EA=citrix.com=prvs=584bb2eab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qVv25-0000AJ-L7
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 14:28:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff866a88-3b77-11ee-8775-cb3800f73035;
 Tue, 15 Aug 2023 16:28:28 +0200 (CEST)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Aug 2023 10:28:22 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ2PR03MB7500.namprd03.prod.outlook.com (2603:10b6:a03:559::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Tue, 15 Aug
 2023 14:28:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 14:28:17 +0000
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
X-Inumbo-ID: ff866a88-3b77-11ee-8775-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692109708;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=op7fmsKIY4P+WA7qkSZjCTP8AaRLx3zFQv6rLJXz8uQ=;
  b=Mqyi86NejDSZ4iBymbopdRZ2+fIiL0Z+Z5VFfTqM1im9fibVSfMRI8kg
   GbNYxL9WDdOpE+nD/GE/S3sDnr/UjacPsBwrzG2M2mLMg6O/XxdbvYVXG
   qd4SL7PO1MllnIb9fgczT7kxP2wKcURndRwyhpI46Co6jjIV30Z9yRlYJ
   Y=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 118218342
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5otITakCMgT42K4FhZSLl07o5gy8J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeW2HUb/3eZGGgeop0b9i1pBkF6sSDndNkGlE6pSE2EyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgb5QKGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dZBNSAwfiGNvOf14r66TuUrvf84Dta+aevzulk4pd3YJdAPZMmZBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVklI3jOaF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLROfhpqU22jV/wEQ2US8NTmCEj8Kymw2Sau8EJ
 H0U6nEx+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqTS0LVwwe+PH4vZo+yBnIS75e/LWdi9T0HXT13
 GqMpS1n3bEL15ZXieO84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComVPlhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:BWiSXq3lNzo3NYFsU8uBngqjBJkkLtp133Aq2lEZdPU1SL38qy
 nKpp536faaslossR0b9uxoQZPwOE80lqQFg7X5X43DYOCOggLBEGgF1+XfKlbbak7DH4BmtJ
 uIRJIObOEYXWIQsS8j2njCLz/7+qjgzEl0v5a4856wd3ATV0i/1XYCNjqm
X-Talos-CUID: 9a23:mofFHWHB28N1b4tlqmJNrVMEJ9AUfEbYj1XcIku0Tl1SU5+KHAo=
X-Talos-MUID: 9a23:zCOJxAqFZ2kLDzWDokQezxQ7Btxz2JuAM0sc0rk3hpKLBCxgYCjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,174,1684814400"; 
   d="scan'208";a="118218342"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLrPrEa+TdJUD4CqT5LZaL4vTGvJARzUe4EcoLrA1L8aPI3vQKuRO5b2/ugXPMTkGTPNH48PmPR/rYyOJYhnbgmDFJWPnCPbXSHqJjJEQ5dOgVxTrt9ssOeydtBkZFuEAlKUshZWd/FItmp+MANvSEGPCOSCEJk2AtGlASbhQnIb8xHOIJJMWNfLcsMmDLGO8WezjIf3ZIjrVKoQbrA9fmLUlsG5jKV0cxMoY6VME+qoRY7th27g0IQc+LbmZGSViolml4+WlJ6lDIktI+kB8h0Pac4e5y7IaqGPqpt6lbP48pq5Z7vhcOuuICpx7z4zHDtz+o+XVxUOJu++ld4isA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=op7fmsKIY4P+WA7qkSZjCTP8AaRLx3zFQv6rLJXz8uQ=;
 b=YS45AawA7T4TdrwZI3KK/63h9RzdULXOgU88rOsq/N8R9lKqYZ4tsjWzg1Xm7aX8/ISKainnro3X9nO3zx5HDtCeL0K1BXmeYWXeC4br73EvL7CLUu4d+qdbXeDcU+HMNfJD7Q4FdL71rTvZQyb4Um6nXn4W9O0aZ1LkZJSPXpyKACF0Dk+C8W2/tS2BBn6WSkPSjo9JNXwUZtRxiwkfWUZ5tyqOFKD0Hf60pMHl0YRqfLuTfav7/fJvkftsDtrxtMLOw3jCNhtvNe6LvYWbC5w3GEPvuwizTZrkc5mcEq8MmxsTKjj6JfoMUQnaV58Dvp5kNIXNpGh5mUSUHVUYCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=op7fmsKIY4P+WA7qkSZjCTP8AaRLx3zFQv6rLJXz8uQ=;
 b=PlvR48o+33J/Zhwnv5nLAz/27ZPZjRWUCo0Qm3p/bMWq7nb1+dRz5c4VqukH0lNaQxNdwz9Kz8+ZcI6uxzSPB32Od1Jq5A9LG3NYDvcCftRKp8bfUV/JrhNUStMT0Bk9/73B6VsHwH/30vmTb2EeyOEecZBgmYZnxHQWar91uGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8400abdc-83bf-81b8-b2de-b80329afc629@citrix.com>
Date: Tue, 15 Aug 2023 15:28:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] libxl: slightly correct JSON generation of CPU policy
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c3fee3c8-c808-e2ae-b885-d24e785989f6@suse.com>
 <ec211f2b-7952-4944-89b5-302d9775cb4c@perard>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ec211f2b-7952-4944-89b5-302d9775cb4c@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ2PR03MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: c60fad27-eb3c-4cb0-c3ef-08db9d9bdd8e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+nRebXXh3/Hmjuofi+SV2nPm/D9v8GW4tCBZhq/zhcrmWmm2SbzFO5yb+MRH+U6cpmMEHfVl5dBYisPFPqiTzDJ/LRMVvYiYp5LBTd1ieqCZLPLK9/p+/XmJ5KsKt5vV0GEMUTAXtoYwPjsQi60dSASNV3+9Dtjy0i7lofFEwkM9MiBL518k03MA6TdXX/dN0Ag0BA7nVHMefMDoFQkyCHExp5VCLMbDl1QNnAxsEwKrUWO/W4XIo+BLUAYGZjI1K6gT9xHzN7/L3gkhbZIQFJ8WSMirBd8qX+bwU9DobjkRuxy2N/mYuUddDrcM5DuhO7CccldgclZ3cNFWcRN8rLo6ke6yaWBhV3I9W4fj9O+9m+m6HFWmffWIjl6BQD8YjKWe695J7VN/PBPH51HoICJOnlTP7QJGFKvSLHZkxHKtAj+A/grEE/8452NWgr0r6bacG62L7l/zL5/B1QtyMEl3xmJGBuozcJnevZZZjaH28ZqMjoahIaHdEEbAPzj+w/79BhrEXubvBmfqrEsQSM+U+uspgUKu/L5oltCFv/a9F4jKrBi6IHTw85jUFp9hRbQVOQHx67KYKxZgquX3n02ZwaS8fDk5ZC6Q3BN4RdCbO/L4sXfHAQ0r7X8sO0azOudFBvG4Z+/tMEocdVU1yA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199024)(1800799009)(186009)(5660300002)(53546011)(4744005)(2906002)(66476007)(8676002)(110136005)(478600001)(38100700002)(86362001)(6512007)(54906003)(31696002)(31686004)(36756003)(2616005)(6666004)(41300700001)(26005)(6506007)(316002)(107886003)(6486002)(82960400001)(4326008)(83380400001)(66946007)(66556008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0ttd2xLS1hSY1ZMamhkc0JnR1dOdmgrUkEwN0lHVmFJUUg1WHZKakJzcG5B?=
 =?utf-8?B?cVAwL20zbnM1U2lQNGFnQXdnT3R6ZHh6Mlg3VStrR1BkdS82c3JGMlU1NS9u?=
 =?utf-8?B?UG50YlpYT1U2NHJabE1kRkJEWTBWYVVIblhZdmZGT0JNU2RxdWNFTEJiS1dJ?=
 =?utf-8?B?SitYcytoanRJVENtLzFybGZscnpabExNSFVqUkhDNnBlVENDTzhURm1OZlAr?=
 =?utf-8?B?SENudXQxdGlDMVhLaVJzclZMSXY2YTE5bGxuY1hzcHY2VmNkcFNsQTZxa25x?=
 =?utf-8?B?dkJibWVHZXJjanB4ODBKLzBtdlIyVkthdkZHaE5aeGpMTUxHeWlXcUxzRis3?=
 =?utf-8?B?TW1DNHpRTHgxZDcxcWxtbnZUR0dMNGVmcjN6SmNSSjJXR2FJS1dZY1dTcUtJ?=
 =?utf-8?B?dXVVU1pNUVRvM2lYYTI1clRlcno4cUJpTXV0T0dWT3k1R3J5azVqRmd1Nnh0?=
 =?utf-8?B?VEhudHJERnBVNWkzOG9rcnBSMUMwc04wQU1ZMWFiMnhNQUYwK0FDeUhkTjZl?=
 =?utf-8?B?NFBsY3dSSUZUb0RiOXFHcnVJdTBYdGg5OTBVaFJPSUNsdHBXcUY2b0lYLzlz?=
 =?utf-8?B?OE5DOXZReTJGdkt4Z0MvQlhDRXRCUVA3VVowL2c0VndZZkRIUU90TlI2UTFi?=
 =?utf-8?B?aGZsWng3eFNpNnhieTQ3WTdJb3BRZUZVQ0VwM09qb09UamtIdytSc1pUZyt5?=
 =?utf-8?B?WjJWSk9hZDRMdG5WYlV3N3luYUFmZ1FWcHpxT3lzeGtPaUdvSEhtb3BpT3NN?=
 =?utf-8?B?akZKcis3WS80WHhRZUd3MG1SUjRSeEJsWjYvQXRwMHptc0plODlzTEF6aENZ?=
 =?utf-8?B?WmU2aUZlZHNVblQxaWJrNHAvYTVOd2FESGlNQlFmM29HbnRqbllyZnl0UUp4?=
 =?utf-8?B?OSs3RWovTDRPQW52elR5SW5MU01HeisvSGdjWno1Nm5wQi9lNU9vMEtDbVBJ?=
 =?utf-8?B?NURmRnJYdU0xWGhMV2lUQXU1OENKM1dnenFJY1F3aUorRFd4eHRXeS8rVzlY?=
 =?utf-8?B?TGZyMW1SdUdKQk9lNDBBdGYxS2MxSGR6ZGFtZmJqSHVRemd2UWJxK0xZVU42?=
 =?utf-8?B?KzV2RTBWV0JCQ3RRYnZvcm5Bc3FUdysxU3JDWXJQaVNHeEZ0QW90blVsSEUv?=
 =?utf-8?B?MVZRL0llVGFUSG9jbVFvOENnTi8rNkxzRFFseVVYRWVBTFZhZE5GTFNWdyti?=
 =?utf-8?B?cTRSRDgwOWNBeE8wWm1VaUsyd2VTU2dYTFlsbERmNm5rT2luVzY0eUV2ZEVm?=
 =?utf-8?B?NjhTWVlIQVVreC83VEZMV2JjbjBSRU8xQXUvWkxoUkhPQURza0pudDBJcjBC?=
 =?utf-8?B?NDFTWUJoNHZQc0pQSGd3OVhWWjl6NDNQY3JlWlFjR0xjRFk5Y3lCeHQ5andZ?=
 =?utf-8?B?MC81eEhPWGZMV01ocjhscWpWWi94eHdwWVhINTJqR1kyZDR1UU5ZUVVpWHla?=
 =?utf-8?B?aWMydWYzRmNRQzMzR01qVi84a0YzRUJSeWt4VUEzMkJseVI0NVczYWJDNjFo?=
 =?utf-8?B?VjQwVDZUK2JxaTdYbmowVCtzQkdEQUxpK0xZQzhYYzgyRlFCVTcwU3FEbDZr?=
 =?utf-8?B?Rkxvd3hyaTdxL2pORGE5ckhwbVRXVzk0THlhZkUvU05LaGJTNDRDM2h2NHM1?=
 =?utf-8?B?M2FSMTBjbWIxSTVkOThudDMwM0VEM3B6cGVDdHBITnRWdXVKdGZoaStKWlI5?=
 =?utf-8?B?ZFA4OGpsZEtXd2dCY2hqcitWckUrckJsR3k4WXJUalI1Z2xPRjRzV1BxSkJ5?=
 =?utf-8?B?VHlTbWk3eE1GSERJSWV3VjZ2MUVhZ1I0WFR4RDBDTExlRFQzdiszT1N4STJ2?=
 =?utf-8?B?RGdJTjdGRlcyTTIvTWFJd1RNR3N6NHVpcGN4a0tWQWdHeHNLYU1HSGJqdFdC?=
 =?utf-8?B?WWozR0s5SkcyTDRRRWk5bmR1TFFnYXVmcjZqaGJqcEcweFVOaDh5STlHc2ZW?=
 =?utf-8?B?VHBHMlZSTTVCUzJiUzN3YndRUnF0SDQxeVRNU1NaV0JoZHArZEx4WjNPV0lm?=
 =?utf-8?B?c1RMeHFVSHJvaHlEaTVCbEs1Ympid08xZnprMW01S1JRNVo4Wlp4dmZwdUVD?=
 =?utf-8?B?K3pOcklkY2UwcVJIZXdqLzRKTmErVEpiK3hHL3A0REtEc04wVUh6akdqY1Q1?=
 =?utf-8?B?REJaWWFnSnY3RUhZdTNXMFRwVHp4TmJ4Qkszd0NSbGY0ZEorODFyWERrZEVh?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b6FiF7Am42Wexuaw79ltJRWm5xAiHwL9RRjLU6bdw6f62tVr4fmJHl0QyUDWG8e8ALopHzmFEtV+dUBbDcOGXs33RoTmfV0KC4l2r8IDSXvd6b2esbuabXHtQ7Q6Z+p6uPIC85RmzSpgs2w6o0QnnpABZf1gSZH8egbb8WSnBwjBu1ubXiSG78OMgT5F36by4GrM0bLA3wzMFeflBiutGSrCk6u0tgGfsdo1QxRLbWGdWekw1hR4faVs/Yo/XxMmIEynK84H88+Wc02v14CtH/QxhkppAk9AO1Bz0Q204XAfwKhnLKm1klXWPYmVayZfBYN3cv0/YlnCTxGxuf8abhsIP8HMSqATUjOvCf3fari0nyh5uVHSOYUMa8erB0dc0zkXMvqr6Td0Fwmhv6067pLe1peypOinEucqJonoOKAtp+PTm2P0/0XjLliWck+PqG4R9rO90BJNprGFLVeFPMEQruQHGxldTS6obIRUskPf1IGGnkcLyT3jXES95cFKWWql6iV63fX6IpNb16fi0Vi2KDbIo3nBkjAWbg1rOZU8XdXxPwbXy8QK9QQto5Ju85pzwl/ZsMBbjqMmq337BMrhMkKwrJKjIHlgqSgtUz7jtRjJ1yZ3FDTe8ZpDklD+TSBNzAlM2ZyHxRzJBSwOQfCS7Vl2rYUKwSItFVRMj6D/eWrqI48BOJuylQgnHL59Uth4gfsdRZOMyqAlrOvCO7eHQe5yzV9/w73IWOewgDlhOhH/Yc4qZB8npOFlEzdQGKaKY9kRHv2JQJy5nFsDea3eZQ8olanimpO2WyRyxyuurUniyi+mzyG4mftn0zsm
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c60fad27-eb3c-4cb0-c3ef-08db9d9bdd8e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 14:28:16.9267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FogyE5rGfOblfIdJfMZd13UXNgpgTotSmOC0h215ty64tSGBPkbk3nCufxoVAvTMiFDpBwtYM4rIpjvKDwtnPcSh+yvYqh6ZjH0gT7WbVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7500

On 15/08/2023 3:26 pm, Anthony PERARD wrote:
> On Tue, Aug 15, 2023 at 02:35:55PM +0200, Jan Beulich wrote:
>> The "cpuid_empty" label is also (in principle; maybe only for rubbish
>> input) reachable in the "cpuid_only" case. Hence the label needs to live
>> ahead of the check of the variable.
>>
>> Fixes: 5b80cecb747b ("libxl: introduce MSR data in libxl_cpuid_policy")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Hmm - this was included in the security backports.  I guess it ought to
go back to 4.15 (now that 4.14 is properly dead).

~Andrew

