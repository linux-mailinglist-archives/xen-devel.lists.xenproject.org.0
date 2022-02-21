Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDDA4BD965
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 12:21:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276197.472301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6ks-0000o5-1G; Mon, 21 Feb 2022 11:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276197.472301; Mon, 21 Feb 2022 11:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6kr-0000mF-Tk; Mon, 21 Feb 2022 11:21:21 +0000
Received: by outflank-mailman (input) for mailman id 276197;
 Mon, 21 Feb 2022 11:21:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vyL6=TE=citrix.com=prvs=04447c275=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nM6kr-0000m9-1X
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 11:21:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cd1be96-9308-11ec-8539-5f4723681683;
 Mon, 21 Feb 2022 12:21:08 +0100 (CET)
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
X-Inumbo-ID: 5cd1be96-9308-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645442479;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+TEyrVTQXFBVSM1Q9QxpNpJdYRg8WDQgf3eo/EPZlB0=;
  b=RBmZKFFwFNR6vuXYi9E3IcFiZn/16NZlJ9V0lGU0JYmrDZMyA1MSY3v+
   wZfu7vBiUxovw2JSFl2Lw5TaGHSpa4JloCOryZGUL8W5yOx0q+2IaOfxO
   uP92zP5sYgza/sH0tNbb9WwQwL8SbQIC470JL3HSVS92nS/XdMaXFIR3c
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66885205
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Y6NuaK7luhaOQg0i7WS+bQxRtO3HchMFZxGqfqrLsTDasY5as4F+v
 jQfXG+GaK6KMWv8LoxxPI2ypEsG78SExoU2G1BtqSA8Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFx2XqPp8Zj2tQy2YLjWlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurTuQh55DvzotN4ZThhoAidPObFdqY7udC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQ6aOO
 pBBNFKDajzFXyJsfQYTJ6s/hd+wiSH5XDQHq3Ss8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u12bkBhAXMvSPxDzD9Wij7sfXlD7/cJIfEvu/7PECqEaI2mUZBRkSVF26ifq0kEizX5RYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL84hmbLngJSCZbb94rv9NwQiYlv
 nertd70AT1ksJWOVGmQsLyTqFuP1TM9dDFYI3VeFE1cvoel8NpbYg/zoshLTqWs3u2kPR3Kx
 y2LnDk4trEPlp86/vDulbzYuA6Eqp/MRw8zwwzYWGO58w90DLKYi5yUBUvztqgZctvAJrWVl
 D1dwpXFsrhSZX2YvHHVGI0w8KeVC+Fp2dE2qXpmBNEf+juk4BZPlqgAsWgldC+F3ivpEAIFg
 XM/WysMvve/31PwNMebhr5d7OxwkMDd+SzNDKy8Uza3SsEZmPW71C9vf1WM+GvmjVIhl6oyU
 b/CL5rxViZGWPk2kWDnLwv47VPM7npjrV4/uLihl0j3uVZgTCX9pUg53KumMblisfLsTPT9+
 NdDLcqaoyizo8WlChQ7BbU7dAhQRVBiXMieg5UOKoarf1o3cEl8WqS56e5wJORYc1F9y76gE
 oeVARQDljISRBTvdG23V5yUQOmxBc0m9SpjZ0TB/z+AghAeXGpm149GH7Mfdrg77u1zi/lyS
 vgOYcKbBfpTDD/A/lwggVPV9eSOqDzDadqyAheY
IronPort-HdrOrdr: A9a23:1aWSGK2oTSye30xDLy0MqQqjBV5yeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YcT0EcMqyPMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvoRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIF/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF8nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvWOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KNoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFrLA
 BXNrCT2B9qSyLaU5iA1VMfgOBEH05DVCtue3Jy9fB8iFNt7TNEJ0hx/r1rop5PzuN+d3B+3Z
 W1Dk1ZrsA+ciYoV9MPOA4ge7rBNoWfe2O7DIqtSW6XZp3vfUi97qLK3A==
X-IronPort-AV: E=Sophos;i="5.88,385,1635220800"; 
   d="scan'208";a="66885205"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihsyA9IwRqPkNIvD3sngqwPAhdcVP7WCjL3Ux07LzDs1rLrgadeYoIzkUTRHnUC2485arSMB+Vdcn9g4NMcWjCFH4p4+8WdCAsntH0fwjTUZuS0sF9B0PNJPZNzaqWnQ9J8yHMrnxDuKJE6knqntl9acz8/qskoisKmqxiDPNFAGr7OMSFW8gaGylUSsZL3vRA5YozNBTCMn/xOas9kGpZt6VRzsWP4IXZjhBzz0WMZI+VmlMptI5OqHVrAJNrKgux1zXqdrw4TILazx3rAFGD5rqfTKcKSXcoPV9La8IsGX3oQupK4F+fQYsyOMQgkAF532wf3zkt/ToCXkiu/BHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HJSCi6QRDFHBTnJs9UufTYNWmzrJqGJ4dR+pYk6nBI=;
 b=ZCgrRhx0Q8E7HrbWJTMqXs/scfu/4FA4DfY+wbI0cU6VP+S+xa3QqtovnIJr+H9mgPXDOcxxt16J7QWZq3+hif4DETLwdMMCII6d5UYxR/rUlVZdLBBgDUUckjMuGcAjHqvK5bVqDCMH21EWhlVjacI7MUQm7lRUj5HKK4NIa6AbCmyZHB7bowYxH17f8BNEdKQb+SDcNDvKYtBVrekMyphpRvNYivspbz5xjGQxUVFqTlsSQROliM/ir+PzgGZHEbLhaHkLPZSAS0E29fdtt0g/Vh8Y1PmdYw2lD32LVafuxP4KGXP+Nb8cstpRWp8veH1PPDbbaHDyrtmW1BCytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HJSCi6QRDFHBTnJs9UufTYNWmzrJqGJ4dR+pYk6nBI=;
 b=GEVx6KEdB+OlVflYtcG5jswBJaelS4Nfj3oliegg+rlMxiBik5FaEeVhGhq8ec1/4Oeiq+krf13wWU+i0pAu0wMevF1xJOqo+GyA9MfsnLka/hsW6eu2kPtn7zO/YvoM5IiORSFcrZemzYdFqGtbwiNxjnWEIkqZvXRpy75qnEY=
Date: Mon, 21 Feb 2022 12:21:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 2/3] xen: Rename asprintf() to xasprintf()
Message-ID: <YhN1pJIDIiJscvjF@Air-de-Roger>
References: <20220221100254.13661-1-andrew.cooper3@citrix.com>
 <20220221100254.13661-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220221100254.13661-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P123CA0504.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11b819c1-2634-4f0b-0a56-08d9f52c4503
X-MS-TrafficTypeDiagnostic: SN2PR03MB2238:EE_
X-Microsoft-Antispam-PRVS: <SN2PR03MB2238C4922A277DD655607B418F3A9@SN2PR03MB2238.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0cbXuIAYsO8kDFajU/piHyWVJtdeyhGcjzl85kZHJ6fp5+o9/rrhyj7x88nJL4mrnGj1R/tcrfWzkNl6BDZY9o502GCmKy+/T1kzc6dtAeVG6fjamoKaHa7qUjRpvIInOAbgFi+vutHUC4GiakR7P493FUvKVlnH64barzP5I4skzSvqhqLeU4ERR8WfVNUA/csyj0CqhFSThZWVDoXx9HUwGTOLycO2PwYdaSQz+/CSnXF4Cd2Wb+Ku1rZRG7rUpTHhbnpQroQ8oYED5+U45xAtSqqkFTonI1RJyKexAXUjDvg4Gi9Cf6GdR3BN6iFZ+YjGVIR9ejgpe+VxQoAvVnbby+UtjLdcVD27Mvtx24rSYWc/CfF0LMkMpslRmPwT4DoHl/+dBbfm1iS/JI1hWgbphz9IhOsUtHS87fB0IvzPa44E1qnHUf77U81IKxhyr+3cN5qo1AkUdd/HYoQ2qBvVCbu+Kq0T4bq2C3TBmfT3Y0g4shoycuwnDstDAzdAcrcuuIjy4ewuxKdG8A8fh2kf1LgNECOZZSy1mSdUhC+ETsrSscY4f+J+PJq0HgfyWdBVCiJxt/3ehHM2gWZJh6KOKkzDo8NJe7oZJ9eiFjAlqgNFU6pGX0ac6NRVfkmixkknF1Y2sdqoXhX/etCgcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(6666004)(54906003)(6506007)(4744005)(8936002)(85182001)(6636002)(5660300002)(186003)(508600001)(6486002)(8676002)(26005)(4326008)(6862004)(66476007)(66556008)(66946007)(38100700002)(9686003)(6512007)(82960400001)(86362001)(316002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVhaUWVjL2lrOEZ3Tyt0RXRTYnB0eGc3WkVjTVhOa0J0ZDR4ZDVVUDR5S2Va?=
 =?utf-8?B?RUJnV2ZzQ0w3WjE5TVo2eHpuTUNjQ3M0UWlaUWEwU2RVMUJJeFl4MzVwSFh2?=
 =?utf-8?B?VkcyVVBxZlNRNkIwSzRWZFJzeXVIQXJwK2lsTWxrNUZKSEtrMCtVQjdDeStN?=
 =?utf-8?B?U2c1Wi9CZlRTQWhSYllMU2Z3MzdZT3ZWbWhqZXMwdmhVOHBvRGtMWkhvb240?=
 =?utf-8?B?NjdxSjZwMDY2Y295SUJ4blNJRDhYY3RWYmZzVGFLUnh0L2gzWUp6b3I1YlVt?=
 =?utf-8?B?ZVpvS0NvTWlJa3ZRWmpNU3Q0UUZudnVMbkhsVjNhQWtQd29vckFKa2Q4NlEw?=
 =?utf-8?B?ZmtraGxUWk8rdS9QblRsMEJNTnJLLy9XVlpQdC8rTVZHSnA0VkZVSWdoazVh?=
 =?utf-8?B?UnNjdGxCNE93d04zMlU0K0d1V25sbjBpTWpmSUVDRmtNUUhkVURCeHhLSkk1?=
 =?utf-8?B?S1ZsNE43VTZ3N1d0a3g5U0F0TzNEL01FMVJRbjY1TDZpam9LTGVOeVNTV1pQ?=
 =?utf-8?B?Z1NMd3Q4aEVWYmhjYU9YM3RHOHRIRjhQVTdHWkhIdWZDcndBWFJmOHBubDQv?=
 =?utf-8?B?cWEzbnEzUXR5T2xSMkZyT0RDaDBSaXY1akR2Yzd4MGFlTWJZQ2VyeFhYQXln?=
 =?utf-8?B?SkF3dVV0dTFLMnV2c1FmeUdZTmxtaWM2Vkd5WU9XOTFUZ0gwSDJyTVFBdGZ2?=
 =?utf-8?B?azhyWXpSQmRLWmF4c3YvdzA2YjJ0a245T0dRWjVrV1ZSdDNxMFcyc3JKYnJw?=
 =?utf-8?B?T0pBeDhYZThyUTVzWFAzckF0VkxCME54Y1dVM3dsSXg0YmhuandMT0VPbHk2?=
 =?utf-8?B?TVBMZTdOUnhCeldLQldHRG1vYzZicFpnMDlwOG1aVUQvV0gzakFPL2NwbTNY?=
 =?utf-8?B?bmFQL3gvWEFhRTZ6dVNIMndGV0Rka2h5c1EvL3RJNGpBMTRyOTc2ZEErRE16?=
 =?utf-8?B?ZFBJQVlkcjk2Zk9nNG9lYXhzTXJCZ1VuRHgrSW8vekswRS9JZWZ4WDlTK0Rx?=
 =?utf-8?B?RTUzNllLTm5qS3BYQzVrN2ZobmpERk5hMUNKSVJGQk5nTkFSSW43MDNHa0tm?=
 =?utf-8?B?UkxkUUpuMGEyUXliVHpycHJyWStqT0JsK3dxdEVUMXhyakd1ZVRieU1QcUw4?=
 =?utf-8?B?MWRZT1pyQXdRZDloZ3UvZE1xRGQvSGJIVFJGbnp3dzZxUU52Mm9GTFZncy9Y?=
 =?utf-8?B?amZJU2N1VkNrNElvNGphQW5vN201UU14emxIN0NySGsvVmx3NllTVUUzV3BG?=
 =?utf-8?B?Y2JwNkxCeW1mdVNKdDBlS2E0RmMyUXEyem9Bc1ZKYnNFditBblVJM1AxdG5y?=
 =?utf-8?B?RWR2SkdKanBpbGVZQ3hzTU9jYmdEWVRKcm1JMitKM3o3NFRIdlRHWmtNWWpK?=
 =?utf-8?B?MlFOWm5sRkY4RUd6QmV4L2VaQUhkRlY3SCtDT3lsVktxdG4vM1VHWUNxUHcw?=
 =?utf-8?B?TEV5b2J2K0pLQUxIc2JrSVFtb1ZvVUVOY3VTdEtBVGRKNmk4WWZRbDV1V0RU?=
 =?utf-8?B?S1pIZ2EyNE9Id0Nad2xPcVBjRlFTLytPSElMcENHMlNYWWc2VzNmcXh2WXV5?=
 =?utf-8?B?c2htS0c0NnlyN0xJcjYxVDJYN0hzUXhyNU5OZ2l2U2NXVG0xTllNNHVURzZ0?=
 =?utf-8?B?d3NoZHNlY3k4Y294QVYwRDMzclczaTQrWUtvTHpKem94NUZiMlgzRWc5RnlE?=
 =?utf-8?B?QUU0b0M2VzNGUTlmZDZQY1VGcU1kRDMreGVNSTZWbWFLazBTcENIUS9ITTNo?=
 =?utf-8?B?anpFUkJMSzlodE1xWXhpbzJNOGdFcDVMdjd0WFBmbS9xR0MwVTloY1Jvd3Y0?=
 =?utf-8?B?M2NNdUk5ZXZBT21RdkVRVGVDaytzRS9vaTBLMnF5STRmb2hNVzRBV2VSdjA2?=
 =?utf-8?B?VTkyY2tIUmdwMzBObnd4cG95bmJQZkVVZ2ZNQU1UTTVDcmhYd1dEWktoY0NO?=
 =?utf-8?B?TXl0WDkyWjV6L0FrTzRHeXJzNXF0ZEU4RTBDTGxxaHB6YWpNS3hkUDFnSjlE?=
 =?utf-8?B?T0tVT2x5QkdQYm12em13VE40NHZlZ1pqTTlwdW85MVF1Ni95NUV2ZnEwYnZL?=
 =?utf-8?B?OVkreE5LQ3hCSHNtNkx2YjZyd0RFeHIreWJWYVpaRkYvM0lhdm1XbFhIVy9V?=
 =?utf-8?B?VmJ1bUV5aDlJckVpSDF6OUZyUEt0eWtIWVBGdGtOcnRKQTBVNVZRcW5zWEJT?=
 =?utf-8?Q?w5BKK5gdczdzlpWqZLNrHIE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b819c1-2634-4f0b-0a56-08d9f52c4503
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 11:21:13.5922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8zAVZNyj8rnxsa+fz/202y9LJZpaJCaGEvpGDuHm/Q0fWxH0JtpCcyGk/TfzMHOBH3Jg9JkZ8f+cTvWYNNOGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2238
X-OriginatorOrg: citrix.com

On Mon, Feb 21, 2022 at 10:02:53AM +0000, Andrew Cooper wrote:
> Coverity reports that there is a memory leak in
> ioreq_server_alloc_rangesets().  This would be true if Xen's implementation of
> asprintf() had glibc's return semantics, but it doesn't.
> 
> Rename to xasprintf() to reduce confusion for Coverity and other developers.

It would seem more natural to me to rename to asprintk. I assume
there's no way for Coverity to prevent overrides with builtin models?

I've been searching, but there doesn't seem to be any option to
prevent overrides by builtin models?

Thanks, Roger.

