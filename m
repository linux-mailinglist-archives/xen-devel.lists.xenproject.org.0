Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B3F4E74CC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 15:06:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294762.501347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkZW-0005w5-LX; Fri, 25 Mar 2022 14:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294762.501347; Fri, 25 Mar 2022 14:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkZW-0005sj-Ha; Fri, 25 Mar 2022 14:05:46 +0000
Received: by outflank-mailman (input) for mailman id 294762;
 Fri, 25 Mar 2022 14:05:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+r7I=UE=citrix.com=prvs=076f4df05=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nXkZU-0005rQ-Ur
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 14:05:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6b0a1f0-ac44-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 15:05:41 +0100 (CET)
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
X-Inumbo-ID: a6b0a1f0-ac44-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648217140;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=edYyeS72PhfZ6v0flBZ8h6zYD7zZUNINVTn5poqERww=;
  b=W5xUDz71UK9vin4A1mLTQWx9ZVbJb3SGRHqt1MhBQi1ecWStbvvUXh2y
   ta9xp1BGvlNaR5rj++Qr9VGd0tGodzo7mBV8M5teDzkB3VKQ82kYz5ATP
   rScrg81m7ZeIsk8GyJIm5vs6v5zeLXQaQp6VW/squFC6f1bTnpz6XVCpz
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69555818
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8oMVya8ZWqvpyBmczWDHDrUDj36TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GEWWWyOPauPazb0e99wat/jpEgFvMWHyIMwTwA+rHs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oLkW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbXrGCB0Y63dpL82ECZyIhF1FqAZw7CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4fQKuDN
 5NJAdZpRDfSQDsUJ0otNKIjkb6UuHPvTGBCtGvA8MLb5ECMlVcsgdABKuH9eduMX8xZ2FmZo
 mHu+H7wCRUXcteYzFKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTWR+y+j40McSuYLOK4FwjC9wYHZvD2WUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P82rsZHF9wXsqIHZdEFBbu4WLTJQb1Eqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AzrNAuBRPtfNi2mUBb7ztKcowGGxFAXpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxqyf+IN0OsWokfy+F1/ronxewM
 Sc/XisLufdu0IaCN/crM+pd9ex0pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4DaJrQl0QOCrGWj+u+2dd7EG3m5EMTXPjeg8dWavSCMkxhHmQgAOXW2rQvZ8pumKE9qwsC1
 ivVtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:rH3Y/KzSrehI68NbJoa7KrPwT71zdoMgy1knxilNoH1uEvBw8v
 rEoB1173LJYVoqMk3I+urgBED/exzhHPdOiOEs1NyZMDUO1lHHEL1f
X-IronPort-AV: E=Sophos;i="5.90,209,1643691600"; 
   d="scan'208";a="69555818"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5ohlRKGmXmU7Y686SxHq1wIFuqjZNV9T8XYd3aC2ezLVGg0KrwNoCoVYovpe+3WiVeBueuPsQ8Xhx6oh0YTMcEdR/76KzIlZyYGnMhj3b8bYMSngynrK2KwM7dqS3SPnxNvN0Qy6ih344lMcMlWfxZarmvVg2ZOfSScazpPgwB8U8lmeN4/hKIgQp317lixHKsUfOQjJu3e7sbOKxLWtv8IixjS0+AAU6rVRBROeWn7UVTSl7bG5ktsPGfczYu4NBnHR15ZXh+89Uc1CEhucyS1/4yK6q0IB2EX7aOSZX/EHUZCMcPYoqOoEimcv6KsoS1Hg6AFBx8CJdOMl0LdlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gC6EtQXmTr4vaY/nIowHOx+tpWpQqzUShU1wYIXc9qA=;
 b=Eor54+OTfPH6997FjyF2HZtITpKV8SAXvWUiGkrL2BgxnR0jLp7DO9agJwI9kkcudPvNUc3KL9I3YZJG3JgzvEWGospmdmHywwP0yDAYQSCHX8OmRPphXtrkP76PLxnZbOdc5q6/Dtve1MuFShX43VA6q4H7sUH93kb6PSPx8p8uw8TaTaSiZZ4oZfB3HLTbJsMs58JzJHM9POH7phl3uMAkqOOX0oVz/lq34HxAtqgUb02t4KBBe6t7yM/oYrx9Jldn3gciRIbz/5OFJRxwTHnSZUyVZba9HIuHfMbGcw93ktvU7Hq7rbs8+J+6pWgdaQSjNpfZSsg0o91sDZskQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gC6EtQXmTr4vaY/nIowHOx+tpWpQqzUShU1wYIXc9qA=;
 b=Oy4taRJjBTP7nNUY0kC81tO7KKDK3EZxvxmfcm/l/x2YSdmvpDpZUlebmfhU8zJt7W1MwgQG/7ZNBRvtorqKIRJds44NSxYsdJHf8HEe+WzmccD6Bv/stw41PSdUWXiy42KiGxEt00TOLfdrYlchYxaLqblyuMQQAjfkSRPTIzU=
Date: Fri, 25 Mar 2022 15:05:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH 1/2] livepatch: do not ignore sections with 0 size
Message-ID: <Yj3MKvqpqRUd2nIS@Air-de-Roger>
References: <20220317110854.39050-1-roger.pau@citrix.com>
 <20220317110854.39050-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220317110854.39050-2-roger.pau@citrix.com>
X-ClientProxiedBy: LNXP265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1df07f24-5069-45a8-dcc6-08da0e6888a9
X-MS-TrafficTypeDiagnostic: CO1PR03MB5858:EE_
X-Microsoft-Antispam-PRVS: <CO1PR03MB58580F0E273B339E8A6EE56E8F1A9@CO1PR03MB5858.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tvyZJMSUAvKIb1DXTi1kcves4kf+DTM22/SC0gYqeAXbx15AQcRdgZLTs1nikJTttHLi0CSvBt91G1ns8wHwyPUwCr+GwgzZsgUYIEuWjul61RnPWCtJ4aDCrS5XCqUGFQ2/tyX0BzpNAIGTSHtDJpL8/hTjvzi6mDOTDi0b1hkRYGuchWDSB+6OVtVvBDQw3NLKDvKbbsJrNPRmpQpVPof1Atl9Z5zm2IvZd5a9jYQ8Rqd45vduqJwQK5d8HzRECqIqcBpby6VjghLEM+7+9v+cg1sgLriWadsCefRKSCYVPdRqmMNQeJ9F/U/hb8XtIf7WZ6RORB1kQD6cOMdFtwnf2axbfauywg7FjDg0rLFqiAx/UkwozdOf0htOA5g+GcbCLB3xjnQrupnnFUi5BuBJJySHFsFREBOYER9YAnt8VEnbm2DTRN5btBHWV2as79qdWDvhtRvBW9wLbeOGIGZMp6hiRhG3ERmRjKypfyvuqilVe+tTaGXyt7RI42IU+PIJeHca/iRTV43CWnMT8rg01yXNkin/uo/XuZjPoEvUm9/P7yXKtYQKKeM5NH0aqfXDCnOyEVMcLD7H8dFxF7nUenzKdIpU/0gLqfHu/G1KMUefn/jc/kD6m08/NjM+xkAQJrpEyIO4z6UijYhhbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6862004)(6666004)(5660300002)(66946007)(66476007)(26005)(6512007)(186003)(107886003)(8936002)(9686003)(66556008)(508600001)(6486002)(82960400001)(6506007)(38100700002)(8676002)(316002)(86362001)(4326008)(54906003)(85182001)(2906002)(83380400001)(6200100001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3ZFc2NRdFViejVpM3AwbTg4ZlFoRVpSS29ITFk5UnlaM1hUczQweVpHVFBH?=
 =?utf-8?B?Nk9ISVRRUDV2NUpWS29zK3doeTdLbjhtN2tCTW1ndHRVcDdFZUtoL0ZXRmll?=
 =?utf-8?B?ZGhNeVVRVFVxQ3VDZ0R3Tjhvdzhsc2llVTdKMk9IdklCWmhBa1FucU5MVXhv?=
 =?utf-8?B?SHI1b0ROZFp5b1FGcmpSRDJmM0FMSU9abTVIV0VmZGlZWEIwNUdjSFllNEVj?=
 =?utf-8?B?dHB2ZXp4ZVRJOEhGSUk4MW56M2FnQ3N0aXRvaVRqMy9yWWtPZFNWRXhGeCt5?=
 =?utf-8?B?Z3dKMi9SOHQwR0RGZjVON1NONU54QmtuSzhkcHRzZUtsejQ0dHVHanFEa0FN?=
 =?utf-8?B?dkRZM3RFcWw3cmFDby94SEpDOGtNRUNldFRWRzlLd2tzSjBIOWVWSFlqdlpk?=
 =?utf-8?B?c3pxVGpYV2VYNytIRStsY2RGdUxIRmhHaHpXWElObmJmTTFiak1jVVM1VmZz?=
 =?utf-8?B?ZlN0dlFaZ0tZbmZ5Wk02TSs3WXdDQmMvZUx4Q0xvczgyYmFub09lbnRnS2Vx?=
 =?utf-8?B?TVNxa3I3UkU0TmJHVE9lSGxJV21EZUx5T2JxcE9rclNvOXNMT3oxTnRtMGJa?=
 =?utf-8?B?SnJTZnZDTklDN3NER1d1bjBhdllTSGVndENjTE9uVG1SYjd2Y09wa1BDMTM2?=
 =?utf-8?B?SzFNVDhpK2h2WVRnSzh6QTh6WTdsWVF4U0RjOGpab3IvcEZ1ak43RkV5SC9J?=
 =?utf-8?B?QkhUeTU5eU14TGVVekFhOWkwZmJpRU9QQmt3R2UzcDV0SEYzekRCNUNZV0JO?=
 =?utf-8?B?TVJtVjBLbEc4c1c5V3VOdXA2cm00S1hIMldKZXNvYVZoMFJ4L0tmdnc5MWc2?=
 =?utf-8?B?ZTkxWjFreUgwSlY0Tk1Nb3NKQ0g2czVkNXZtV1dYRkRKeHRhVytzdG9iYTZD?=
 =?utf-8?B?eHoyZnV2VlNST3JwYy9IY0pHZHhJS0s4cjhWc3VjUVhOSkJ2cTNtd1dzWXg5?=
 =?utf-8?B?SDVLSlBKNjhUWDJKLzJtSkNhcU1OeXlmYzN3cWE4bWxyKzJYUHh0TVBUQXMw?=
 =?utf-8?B?ajlSa043WjRoSmIxMkRQNGUxbVhRc3NxUDlOYXBzekl4NnJOcndZR3k2UUV4?=
 =?utf-8?B?OGNIUWlNZi8xV2tQM2ZPSWk0c1UrTWw5YmsrYkQ3dWdDME1BU3JieWd3RUZx?=
 =?utf-8?B?amorYmpFMXNHN1d4WEorcXovT3RjemVCeWtaM2VQOVJIYzZILzZaQXFRbzdw?=
 =?utf-8?B?UXNWUU9NdTRRVDNSNjhzRWdaVWlDNVZDZUpmTHhMalJFWU8vVklwVlBERmRG?=
 =?utf-8?B?alUwRk9hTlhwMnVHREhnK1NKZDZJTXp0M3RySklkd2JocDVaOXVLWm13b2tQ?=
 =?utf-8?B?bW1EanFsUlFHaVVUU1VFUHM4V0dzYUtxUWRiWDZ5YTBtQ2Y3ek5zaGEzamha?=
 =?utf-8?B?REV3Z0xMNnIxT1FFWTFiMitlMTIyWkVENWpxNjlHNWxrSSt3WS9UMjZZUENS?=
 =?utf-8?B?bFpXYXJ2UVJIRGNKK3B5TllZSGpXQjZDNElIeHJzU0VVcE5VVWhjbDJrczYv?=
 =?utf-8?B?U1p5R3pCb3NyczNZbk55YWxxRU0vOFFqMEptdThuZ2V1dXJHd3BDaVQ2eThD?=
 =?utf-8?B?bk81M1hrSFhsbjNhUThMVUdoLzJna2tROTlDa1N0NVh1VE5sRFNha1NycmhE?=
 =?utf-8?B?dEhzUGdBdVZHVzhITVM0MjJCK2FMaXE4TmVOcHpGM2d2WnVYcXRKcXhOUENk?=
 =?utf-8?B?SVRIM2tPQmo1bUFIbnNmcmppM2lpUHQxL1k2eTVzNkF1S3JCeHhTcUFFS0Y4?=
 =?utf-8?B?WGdkQlhxWklaWU5wOXNoNUpXNUkzaytrUi9EYUpSSm9jSFp6TG9FZXU4dlZs?=
 =?utf-8?B?bmJiTVVPcDJuR1owV01IQ282N3BvRUtIK2xSL2FiVkpDNUc5Y0UvLzZ4TFZM?=
 =?utf-8?B?ZVN6UlFTc1NtUk5MeEVoaitrdGloYWRMblY2c0JYL2ZDeVBvM0gzcDVjWGtW?=
 =?utf-8?B?Zmlaa2RscVAxaCsvS2luNTZOVXZUNW53MHU5eVl3bENxZXozT1dCOWNtbVEx?=
 =?utf-8?B?WGExb1htY1hrdEVSU1pTRGNZdURZS2VaaE5aczlWNWNrN01qS0RzLzdyWUlJ?=
 =?utf-8?B?MDEyQlZBTWU2RW1rcnFjYjVLUVpSczIremczOFUxbXlMT2krUzd2RzVIV2Jm?=
 =?utf-8?B?NlY0a1lKNjM1b0hYUGhNVXdMeWl6UzJJck5wRHB0SjNOSERXbkhsdXZ3OG9H?=
 =?utf-8?B?ZCtJdTZVL05YOFljMnpYZnN5YkZrOGRMWkxoOGdrVGJ4cDdJS1g5UHpuRXhD?=
 =?utf-8?B?SlVaSHFMUUJuNnVhSk8rMjJCQ0pHTEE1eUtFaXJpNU1HSEVQZGNMZnAwR2wy?=
 =?utf-8?B?b2p3aUNpQXoxYUVCQlo1dFMyMEZnbVdvU2x0V0ZpK1BqVjZqWnZMVWFUVmZk?=
 =?utf-8?Q?95NcYsb7CwxsS2TQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df07f24-5069-45a8-dcc6-08da0e6888a9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 14:05:36.1379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzLpZ+faEM8CyFd3AEyUWRleLBr6G7L9UqVxktuM0TJ1iHW0Kb5uw8AljUfzNB8/6RcbCDkWo2HxT/Xv9UVHaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5858
X-OriginatorOrg: citrix.com

Ping?

There was some discussion on whether we need to handle such empty
sections, but I think we settled that it's necessary.

Thanks, Roger.

On Thu, Mar 17, 2022 at 12:08:53PM +0100, Roger Pau Monne wrote:
> A side effect of ignoring such sections is that symbols belonging to
> them won't be resolved, and that could make relocations belonging to
> other sections that reference those symbols fail.
> 
> For example it's likely to have an empty .altinstr_replacement with
> symbols pointing to it, and marking the section as ignored will
> prevent the symbols from being resolved, which in turn will cause any
> relocations against them to fail.
> 
> In order to solve this do not ignore sections with 0 size, only ignore
> sections that don't have the SHF_ALLOC flag set.
> 
> Special case such empty sections in move_payload so they are not taken
> into account in order to decide whether a livepatch can be safely
> re-applied after a revert.
> 
> Fixes: 98b728a7b2 ('livepatch: Disallow applying after an revert')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/common/livepatch.c          | 16 +++++++++++-----
>  xen/include/xen/livepatch_elf.h |  2 +-
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index be2cf75c2d..abc1cae136 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -300,9 +300,6 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
>           * and .shstrtab. For the non-relocate we allocate and copy these
>           * via other means - and the .rel we can ignore as we only use it
>           * once during loading.
> -         *
> -         * Also ignore sections with zero size. Those can be for example:
> -         * data, or .bss.
>           */
>          if ( livepatch_elf_ignore_section(elf->sec[i].sec) )
>              offset[i] = UINT_MAX;
> @@ -361,8 +358,17 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
>              else if ( elf->sec[i].sec->sh_flags & SHF_WRITE )
>              {
>                  buf = rw_buf;
> -                rw_buf_sec = i;
> -                rw_buf_cnt++;
> +                if ( elf->sec[i].sec->sh_size )
> +                {
> +                    /*
> +                     * Special handling of RW empty regions: do not account for
> +                     * them in order to decide whether a patch can safely be
> +                     * re-applied, but assign them a load address so symbol
> +                     * resolution and relocations work.
> +                     */
> +                    rw_buf_sec = i;
> +                    rw_buf_cnt++;
> +                }
>              }
>              else
>                  buf = ro_buf;
> diff --git a/xen/include/xen/livepatch_elf.h b/xen/include/xen/livepatch_elf.h
> index 9ad499ee8b..5b1ec469da 100644
> --- a/xen/include/xen/livepatch_elf.h
> +++ b/xen/include/xen/livepatch_elf.h
> @@ -48,7 +48,7 @@ int livepatch_elf_perform_relocs(struct livepatch_elf *elf);
>  
>  static inline bool livepatch_elf_ignore_section(const Elf_Shdr *sec)
>  {
> -    return !(sec->sh_flags & SHF_ALLOC) || sec->sh_size == 0;
> +    return !(sec->sh_flags & SHF_ALLOC);
>  }
>  #endif /* __XEN_LIVEPATCH_ELF_H__ */
>  
> -- 
> 2.34.1
> 

