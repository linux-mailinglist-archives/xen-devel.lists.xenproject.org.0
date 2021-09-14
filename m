Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA4B40A6F2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 08:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186158.334879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ2La-0001UP-4w; Tue, 14 Sep 2021 06:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186158.334879; Tue, 14 Sep 2021 06:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ2La-0001Rh-1o; Tue, 14 Sep 2021 06:55:14 +0000
Received: by outflank-mailman (input) for mailman id 186158;
 Tue, 14 Sep 2021 06:55:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K1wc=OE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQ2LZ-0001Rb-1S
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 06:55:13 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b428bd44-1528-11ec-b3ff-12813bfff9fa;
 Tue, 14 Sep 2021 06:55:11 +0000 (UTC)
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
X-Inumbo-ID: b428bd44-1528-11ec-b3ff-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631602511;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=P2t+bIunCdVFJ1eBQHXRxajT+xdHm1HFCzoc/FgzRPs=;
  b=ZlYkjaTfuBR+cogQeGjjRjeYv91YmBHtO2xWVwJMOnYQSKpI4Ciqf4uR
   MJnC/DMmEcTYACG0dOG72i/8X91Z7KaG0KvOq2iFM0PbQs9QJnuFL1MmD
   E+blRKa+hE3rFKiXqef54xFoDQkk+uaGipQkY8eLqSaG2DrOX0Fet85jA
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: k45HzrNVK9XlVF27Oj0HLc6o+xaJ1sBlYNbkp2++kraoqpoUCGLzINDYRBXTlNQ0ZHug6hEs/3
 9H53tJnr/m+m+fgBD2lTNNqmh6pGXF0lxTvf6LEdB8JVrRXxTxOzOwav42IsTbfWdF4piZ2cO1
 Uug8JjB8VYF5BYexjncD8CCNfKFKJwKZ5qcgLU0pM3S6H4H34JZP+H43lEzHbAYi7rIJsKQr9S
 VIF2KfwD10gw9OHv77mmxubJK1xOlViPhJYGAgP3oSGZxjH0cMtvu3jPsSwQ32KD2eUgOJAGsh
 CyayJQGHkfZSQkPKJNbbPmkT
X-SBRS: 5.1
X-MesageID: 53056487
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DQylUKDUSoV9zBVW/zfkw5YqxClBgxIJ4kV8jS/XYbTApDgn32AHx
 jceWWCAaauONmr8Kdp1Odzi909X7JDdmoJjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w0E47wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/qByihfdd9
 4h0sJWIWAkqN47jneckTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHv6SuIEEjGhYasZmIs7af
 tcJa2VWUjfQai1wIwksIoMGtbL97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcIAYGaC89/VqqEaO3WFVAxoTPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHedjaih1K74ycZUuJBHe4zyy6IyZPLtlPx6nc/ctJRVDA3nJZoHmVwj
 QLYw4yB6S9H6+LOGCnEnluAhXbrY3FEczVaDcMRZVZdu7HeTJcPYgUjpzqJOJW8iMH8URr0y
 iqDxMTVr+RO1ZNXv0lXEFauvt5NmnQrZlVujuk0djj8hu+cWGJCT9b0gWU3Fd4acO6koqCp5
 RDoYfRyCdwz4WylznTREI3h441FF97aaWaB0DaD7rEK9ii3+m7LQL28FApWfR8zWu5dIGeBS
 BaK5Wt5uc8CVFP3PPQfS9/gVKwXIV3ISI2Nugb8NYEVPPCctWavoUlTWKJn9zuxyRN9zf5mY
 s7znATFJS9yNJmLBQGeHo81+bQq2jo/1SXUQ5X6xA6gyr2QeDieTrJtDbdERrlRAHqsrFqH/
 tBBGdGNzhkDAuTybjOOqdwYLEwQLGh9Dpfz8pQFeumGKwtgOWcgF/6Onu9xJ907x/xYxrXS4
 3Wwek5E016j13fJHhqHNyJ4Y7T1UJch8X9iZX4wPUyl0mQIaJq06PtNbIM+eLQqrbQxzfN9Q
 /QfVd+HB/BDFmbO9zgHNMGvp41+bhW7wwmJOnP9MjQ4epdhQS3P+8PlIVSzpHVfUHLvuJJn8
 bO61w7dTZ4SfChYDZ7bOKC10le8nXkBg+YuDUHGFcZeJRf3+49wJi2v0vJue5MQKQ/Ozyex3
 hqNBUtKvvHEpoI4/YWbha2AqIv1QeJyElADQjve5LeycyLb4nCi0clLV+PRJWLRU2b9+aODY
 +RJzq6jbK1bzQgS64csQax2ya8e5sf0o+4IxwtpK3zHclC3B+4yOXKBx8RO6vVAy7IxVdFag
 a5TFg224Ym0Bf4=
IronPort-HdrOrdr: A9a23:QPM/3qNhWTTsEcBcTq+jsMiBIKoaSvp037BN7SFMoH1uHPBw+P
 rDoB1273XJYVUqM03I8OroUJVoKkmyyXca2+QsAYs=
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="53056487"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzBRiQl1nVyXINJyAtRFLvL8z4Q5q/sj1Tid39KJ7jmJl++mu3cupVhtDvNIIBega+QnJbOpy33FR67FR5wFbChLcJ52r/z2NU/K6DjF4Z2uTr+RGwBiESIolIofP9DWfaIYZ9KO0I4I+BEhuwSd1Q2UieujepJ7s735+p+iP68lEctpDjFJL0+9F5JzCvL9HDgc2KQXyijxt19DtPD7FS8kiCrguUF1ggfKl+9cvmg9xX+atSN5lydxgcPkBSWmufndR6TJQKhr2/UgR+QKaX6gJjXWo4yR8pULljVgaIWaVUTAUN3zD0MO0s2lOLZzpoGWMXwAVVbxJCFSWe9TVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cMmlJddhrJKH0sobqoQ4EX7wVdGnGn9RVUOEOYK1QW4=;
 b=S/3RPKZOyEjeWowXTD+O3u78Oqh7ESzucZFDwzYeW0fif2++xWuwwqKxkZE5PgmHTCGaioflsqzv32Y3rOBI489hEUiHXzLOyFCFwTzwtjGEY58/Nzz0Yl5z7ZTnCmEoB16yrVOBnLdBaaJR9aU8Dnj1/MbNE1Ogg88/qIC+d054hoiuNzbFFAJS29I8gZDHruAhBlWDjjqSZ9FdCHjguvubim//Yi3lNFKUvZjjh6kEY6bd+ivqvew1YA0sdSx5jenbQCCGLhZ/VwlJoMbAid27aD3sEu2omyxjpai7AMm13bq3/U4PaHZQhBiEFnGbg7Ui4akQcUZfVrx5G4LkdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMmlJddhrJKH0sobqoQ4EX7wVdGnGn9RVUOEOYK1QW4=;
 b=RIL+tvEcU4iBrLItRAaXPkPq47NbDWVo7DHiPK88B3mg8rG0mWMLHyFi3eQrsf6R9Z192zZaVEpB8W5+Pj7L1YoFtbfYSfa62I127JhHNfeoGg/Dz40XC4BVpHJGX0gVL7Pu70jBHaXP0PukjQINZYicyktJ4F26d1wQRuyZ7IM=
Date: Tue, 14 Sep 2021 08:55:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: conditionalize workaround for build issue with GNU
 ld 2.37
Message-ID: <YUBHRhfLDoEHH7k9@MacBook-Air-de-Roger.local>
References: <4efe38f8-16a7-ad66-04dd-d55aadd57166@suse.com>
 <YT9UADtkz00JJkuB@MacBook-Air-de-Roger.local>
 <7c97de87-9687-a088-406b-33faf037244a@suse.com>
 <YT9hHPpt+SRU/Cv0@MacBook-Air-de-Roger.local>
 <2959d91e-1048-a4dd-7f79-ec1d14b81d02@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2959d91e-1048-a4dd-7f79-ec1d14b81d02@suse.com>
X-ClientProxiedBy: LO4P123CA0502.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88cd08b4-3718-45ce-8c6d-08d9774c9681
X-MS-TrafficTypeDiagnostic: DM5PR03MB3372:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB33721358C7A4C5035C3B9FD78FDA9@DM5PR03MB3372.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3gQnfJaDu240E1UhhHwof9oq1Rf3ZYQZ0hRf+EJVJaKPiOUnrq8xjlsMQvoc+LjMaGSaZhUOa6Q6VxydD6mH4gXeX+MDvNpjFn7S6x5Jm7KXrfpFKzOqtJiErmpmVXJahgFnaiOFHtKNd70oZBcH5eFphgzE6HPylK0Qq/MLH0jWVbkCrfgV4OAzwFczgsV80DG4l5hzRnd6nUqCdblyLJ0O7bT+wvxr20srIv5JXph7IDTO9bWdfGkfdEnQhbyrtEkJZi03W6iSpdD6CNmKr0PCXgYbW0HzK+oGb3/+MF26bMpG+7LmU0YwEy/sGC+eH7/H5uGylyhO7Y6SWh6PFd0cDTNxJCKifUDg00bwBmFGL5cvHZUSzXtemtpHFhl1OW8neiUqqDetOqozIS1DhZ2dmiiLBXPABUByqEhqRhi+kBgq/FSlnvvI3YMp2+rS7jCN6tUYQG2vGJXC2XiAOgDV7LhSHBbphrkM7SUq+0GnOiux/gpOPqjzCRxy41hzkMb4GWS5ktUPymA4Zp/wC4Micc4KLPxh0GYMjE4sO2nTcc3uZ4/cUoth0g8DC+dGH9C8Ic2ox0xyWSRsKBUPt4ZPNl5Z89TABc9+rmKs/J4WgA+H+t2vy7JrYemjBVkVxWvExNeQTlCw1dME0YaxnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(6496006)(316002)(54906003)(8936002)(478600001)(85182001)(956004)(83380400001)(5660300002)(4326008)(26005)(38100700002)(86362001)(2906002)(53546011)(9686003)(8676002)(66946007)(66476007)(66556008)(6486002)(6916009)(6666004)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1UzMmV3akxvRFZ0MXNnTnhtSVp4aVFkR1Q4cFpHZmNISUc0SGxQY1hFQTlI?=
 =?utf-8?B?dUJWNVJBZC9ha2NUdlBjWEphcGlGTnhyQkFvdXVEcXlQS3hYR29lUmNVV1d1?=
 =?utf-8?B?WlUvMWRYM3lVZXpNNFUvK0FLVndMNHVPK1hQZDVPT3FsaXF3a0lvaG5HWWc3?=
 =?utf-8?B?VUZhbUFwTy95UVpFZFJNaWt3RDBNTXpKUksxWEZPSmNUZUczR2VDOVY4RHRI?=
 =?utf-8?B?d2ZKaUd4QnIvVitDcmt6UVZjc2NtR0RsaUd6emhzNldkQURlMkRFeXVPMDJt?=
 =?utf-8?B?SzYzeFVGTWFXeXkrVUl3bzRqdVBXQ3ljUEM2bkNiTG93VGZpcXRnamRGS0dq?=
 =?utf-8?B?Y1Z2aU8yaWRaNityT1ZPdUp0WCtRVGpvQ2hpMzBUN0Z3cFFQdk4vZ3dnbjQ0?=
 =?utf-8?B?T29QK2FtRExJQkxsTUZxbzloeFBoR2hTR1lFd0VIN0VEeXFaOFhIOFlXa0c4?=
 =?utf-8?B?OE9rdnU1NE5rekNRVWYwY09ZcjhqR0YzbXhTNVlNa3Y1TzYrSVIramZFcE1n?=
 =?utf-8?B?ZW9PY1NRUnlWdEdna2NBMUlHUU1LQ1pzMlZlL3l0VGpJYmdIeEJmRExNUXJI?=
 =?utf-8?B?T0VqbXdqZHdrdHpPNndlQU9rQk1zOFFoejcyRk1tZGZUU0lBWkt2VzRGTnZI?=
 =?utf-8?B?ay9rNVQ3TGloWXM3c0pVVlpKTnk0OXVod21TU3B1UnNuUDNJc05jczJLQTBl?=
 =?utf-8?B?RmJibXJWZVFUcEpsVkNTS3ljdlQ1V0JxQjN6QkxMdnpQS1NmMS8rYVdnL0N6?=
 =?utf-8?B?Y1FNVnJQdWs1RTlmVERBLzFCTUhTVllCZFhSejh0ZzYxV1grOG54cVltTzF5?=
 =?utf-8?B?ZGFNd2xDTVkwZXg1OHJyUjVuSldFYUN1NmppOWIvUmFPYk52OVBkMis0UEhs?=
 =?utf-8?B?MDV0ZG9WcnJTdEJ3REh5T1pJdkJaUk11WUU0WlhxNXo2dDM0emFxUGNNNjk0?=
 =?utf-8?B?eitLMGJBMk41RWFGUlQ0eXoxa0FMTzkvUUlaSTE3ek5Kcmh2c1pZYVFDdERn?=
 =?utf-8?B?TXlhY1FiTzg0VldYMEU2ZXRwZW13UW5BcDE0WFVWTkZVbnBuL0hvMEhnSnVw?=
 =?utf-8?B?ZWlEVmRRaXJJWW5Jc0RtOFhvaU9qTU9kdGlLVUp0bkVaRHdKMncwRUNORENG?=
 =?utf-8?B?RnNvbzZsSGlnSGFYTjhEYitHMytxdDh4SFN3cVZGbS90dDNoOUVZSGJ4TElR?=
 =?utf-8?B?YUpxSkNWakdjQmpPUElNNkZRVG1BbEZwYTEzTVpXM3YvY1ZPT1RNR2wxT2FN?=
 =?utf-8?B?VXlJU2VMVWNmdWtnVlQ5ZTJLU3h2RmdOQXE2SU9EWGt6azNPZjhzZjhxNVFp?=
 =?utf-8?B?cjliMnNORE9Ud0pzdmh2Q1JqWkEvL1ZiMC8rcFB1N3pjc3NTa3Z5REVlMCtp?=
 =?utf-8?B?MGxvZG1ZQ3duZmg4Q3Nia3Q5VUhydFd6Y1pSVEhzT2dncWczOXBRNzdqU3JW?=
 =?utf-8?B?WnhKWlFYMW55OFh0VjNFU2ZSK3Jtc2RrakVURW53TjBldURrRjBnTnJCb1Q0?=
 =?utf-8?B?R2xlbThnVUxYMHJuL3l3MzcvYmMxNFpPUlNaYkFzditmODRXMExGblNqSUpx?=
 =?utf-8?B?TzFWU20wbTB4ak81M21mRUZDUWRPYjU2bXMzMU40UTQrUzN0dURNZ2FvN1FR?=
 =?utf-8?B?UnB4SGgwUFU0YnRuMW02S0Jza1FaTHhWeks0U1d0WStLSVRmbGJ6UGpkSEJI?=
 =?utf-8?B?VlpSTEhGdWJJOHJSOEZYdVhTaWRKdmdmajBpaVpFQUdJVHYvUWk5ejFSVG1j?=
 =?utf-8?Q?isJdSang88exzPjRvxkWxGXDP7ye8uivQPbaSFZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cd08b4-3718-45ce-8c6d-08d9774c9681
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 06:55:07.8103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvBjAwuJGUc3XIg5tZROIsgdB0OSXlAiE4xvfF+8+JITOOzY4Pv/XhXDPlTo2ADUdakxTaJUBEno+SmHSYXKIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3372
X-OriginatorOrg: citrix.com

On Mon, Sep 13, 2021 at 05:10:54PM +0200, Jan Beulich wrote:
> On 13.09.2021 16:33, Roger Pau Monné wrote:
> > On Mon, Sep 13, 2021 at 04:05:15PM +0200, Jan Beulich wrote:
> >> On 13.09.2021 15:37, Roger Pau Monné wrote:
> >>>> --- a/xen/arch/x86/Makefile
> >>>> +++ b/xen/arch/x86/Makefile
> >>>> @@ -92,10 +92,16 @@ efi-$(CONFIG_PV_SHIM_EXCLUSIVE) :=
> >>>>  
> >>>>  ifneq ($(build_id_linker),)
> >>>>  notes_phdrs = --notes
> >>>> +# Determine whether to engage a workaround for GNU ld 2.37.
> >>>> +build-id-ld-good = $(shell echo 'void test(void) {}' \
> >>>> +                           | $(CC) $(XEN_CFLAGS) -o .check.o -c -x c - 2>.check.err \
> >>>> +                           && $(LD) -T check.lds -o .check.elf .check.o 2>>.check.err \
> >>>> +                           && echo y)
> >>>
> >>> Do we want to make this a Kconfig option (ie: LD_UNQUOTED_DASH) and
> >>> then use is here?
> >>>
> >>> We already have compiler and assembler checks in x86/Kconfig, so it
> >>> would seem more natural to place it there.
> >>
> >> The question of whether to record tool chain capabilities in .config
> >> is still pending. I'm not convinced this is a good idea, Andrew keeps
> >> shouting me out for that, and an actual discussion doesn't really
> >> happen. Yet unlike back at the time when I first raised my concern,
> >> Anthony meanwhile supports me in at least the question (to Andrew) of
> >> when such a discussion would have happened: Neither of us is aware,
> >> yet Andrew claims it did happen, but so far didn't point out where
> >> one could read about what was discussed and decided there.
> >>
> >> For the few uses we've accumulated I gave (if at all) an ack for
> >> things happening under some sort of pressure, with the request that
> >> aformentioned discussion would happen subsequently (and, depending on
> >> outcome, these would be converted to another approach if need be). I
> >> have meanwhile realized that it was a mistake to allow such things in
> >> on this basis - the more of them we gain, the more I'm hearing "we've
> >> already got some".
> > 
> > I see, that's not an ideal situation from a review PoV, as we don't
> > have a clear placement for those and that will just cause confusion
> > (and more work since there are potentially two places to check).
> > 
> > What's the benefit of placing the checks in Kconfig instead of the
> > Makefiles?
> > 
> > As I understand Kconfig is run only once, while the Makefile could run
> > the check multiple times.
> > 
> > The downfall of having them in .config is that .config could suddenly
> > change as tools are updated or as it's moved around different systems
> > (yet .config already contains specific compiler version information).
> 
> I should have added in the earlier reply: Besides the pros and cons
> there is, to me at least, also the abstract question of whether such
> information belongs in .config in the first place. To me this file
> has always been a record of build-meister decisions only. Quite
> different from the output of userland ./configure, where checking
> various aspects of the environment is the primary goal.

Well, userland ./configure is also used for setting build time options
for the tools (we have a bunch of --{disable/enable}-foo), so I think
the line is quite fuzzy there also.

I think it would be better if we could split Kconfig settings into
.config and .tools for example, to clearly differentiate between
user-selected options vs environment information, and then it would
also be fairly easy to regenerate .tools on every build. Sadly I don't
think Kconfig is capable of this in it's current state.

Thanks, Roger.

