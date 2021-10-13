Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 663B242BEB2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 13:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208248.364307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1macB1-0001s5-W3; Wed, 13 Oct 2021 11:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208248.364307; Wed, 13 Oct 2021 11:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1macB1-0001p7-Sq; Wed, 13 Oct 2021 11:12:03 +0000
Received: by outflank-mailman (input) for mailman id 208248;
 Wed, 13 Oct 2021 11:12:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFKL=PB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1macB0-0001p1-1A
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 11:12:02 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 627386fa-2c16-11ec-816b-12813bfff9fa;
 Wed, 13 Oct 2021 11:12:00 +0000 (UTC)
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
X-Inumbo-ID: 627386fa-2c16-11ec-816b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634123519;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=GBE5d2K/zjOBjfvTSkFIyrLUsnp5VAa23PxNGKDpGVE=;
  b=Sk9/SYE94LShZ3Y/+XEkKv5PQQ4IOCaAQD1fCIV9/myebpOWFg5FGJvi
   ytUYkoZHg7NNCkG5Fg+u59tvUO3Aw5+HyM8bSjjLkMvddwT0sWzCtY6Kh
   ydffqI9JZfXkHlC0S6EUf68PYOC2Rx9+CZ6s7JXypyXrHP6S8oyo/38fh
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dx/HC7w/qIsp5F7+hx8aUqRQH3Ka1swsBAdkskY4Oq13s4Az6LrB/1dW5P8/vOxkwSDb1mqi0p
 WmiMsWQj7sJqtF8D7B9jO3/t/1FJ0IeLFZuXNHcn3q2X0LJ/dUy7xob7zgX3H+AQDgrx3KUFp8
 647FDpslMZtkE/M2SmqlLG1HbQMtgut7WmD6CYjGCHRDpaQCr0aNaJsPRSeiSU4aiq2qilmodh
 OtNVE545f5c6hgn+YarLHI4yEKhjJt5f4tBp6EDf4jfND57/0oMzaEstqliS/B8FDlhinqrfq/
 mjQjLNULZ15W3gE7WWIl6JKM
X-SBRS: 5.1
X-MesageID: 56953482
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Xp/oRaJBTYwPHGMUFE+RHJMlxSXFcZb7ZxGr2PjKsXjdYENS1TZSz
 zdMCmnUaP+MN2X9edh0YIuz/UkDu5/Rz98yT1NlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140Eo6wLZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB27p+x09
 vJy66b3biUCGqqVgtYXCylxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Xu44Fh2tg3KiiG97ad
 /c1OAdPYijtIEYfOQc2Jch5ltmB0yyXnzpw9wvO+PtfD3Lo5AZ8yqT3OdzZPNmDX9xIn12wr
 3jDuW/+B3kyNtaS1D6E+XKEnfLUkGXwX4d6PJSi6vNvt3iCyWUSBQM+WEOypL+yjUvWc9deI
 Ewd/mwpt7o/8GSiVNy7VBq9yFaDuhMfQNNWH/cN4QeB0LfP4w2ZC24HSRZMcNUj8sQxQFQCz
 FaJgtevHj1pv729QGiYsLyTqFuaOzURLGIETT8JS00C+daLiJE+iFfDQ8huFIaxj8bpAnfgz
 jaSti88ir4Py8kR2M2T9FbLmWj0/sDhQQs85wGRVWWghitnY4qia52t+ELs5/9KJ4aETXGMp
 HEB3cOZ6YgmCpWAlzeERukXK624/PaOMDDagllHEoEo8nKm/HvLVZtL/Dh0KUNtM8AFUTzke
 knevUVW/pA7AZexRfYpOcTrUZ1slPW+U4S+PhzJUjZQSqpJSAq52x4wXwm3/UvJlxE2o6tnC
 b7OJK5AEk0mIahgyTO3QcIU3rkq2j0yyAvveHzr8/i0+eHBPCDNGN/pJHPLN7pjtPrV/2055
 v4Gb5PSoyizRtESdcU+HWQ7FlsNMWQgTa7/r8haZ4ZvySI3RTl/VZc9LV4nErGJfpi5dM+Uo
 BlRuWcCkTITYEErzy3RNRiPj5u1DP5CQYoTZ3BEALpR8yFLjXyTxKkebYArWrIs6fZuy/V5J
 9FcJZ7cWqoTEGydp29BBXUYkGCEXE/07e5pF3D0CAXTgrY6H1CZkjMaVlqHGNYy4tqf6pJl/
 uzIOvLzSpsfXQVyZPs6m9r0p25dSUM1wbooN2ORe4E7UBy1rOBCdnyg5tdqcppkAUiSmVOnO
 /O+XE5wSR/l+NRurrEkRMms8u+ULgeJNhMCRTeEtuzqaXCyE6jK6dYobdtktAv1DQvc0K6je
 f9U37f7NvgGl0xNqI1yD/BgyqdW2jclj+IyIt1MECqZYlK1JKlnJ3Xaj8BDurcUnu1SuBesW
 1LJ8d5fYO3bNMTgGV8XBQwkcuXciq1ExmiMtaw4cBfg+St63LubSkEObROCvzNQceluO4Q/z
 OZ/5MNPs16jigAnO8qthzxP8zjeNWQJVqgq78lIAILihgcx5EtFZJjQVn3/7J2VMo0eOUg2O
 D6EwqHFgu0ElEbFdnMyE1nL3PZc2stS6EwbkgdaKg3QyNTfh/Ix0BlAyhgNT1xYnkddzuZ+G
 ml3LEkpd6+AyChl2ZpYVGe2FgAfWBDAoh7ty0EEnXHyRlWzUjCfN3U0POuA8RxL829YeTQHr
 riUxHy8DGTvdcD1mCAzRVRku7roStkorl/On8WuHsKkGZgmYGW63v/yNDRQ8xa3U9ksgEDnp
 PVx+LciYKL2AiccvqknBtTIzr8XUh2FeDRPTPwJEHnlxo0AlOVeAQSzFn0=
IronPort-HdrOrdr: A9a23:BIT84agjL9DrFRog5I4qbB0cf3BQXzx13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkDNDSSNykKsS+Z2njBLz9I+rDum8rE9ISurQYccegpUdAa0+4QMHfkLqQcfng+OXNWLu
 v62iIRzADQBkj/I/7LTEUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13zDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3e
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0IXEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fi1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqsq+SWnqLEwxg1MfguBFBh8Ib1K7qwk5y4OoOgFt7TBEJxBy/r1aop8CnKhNPaWsqd
 60dZiAr4s+PPP+W5gNc9vpcfHHeVAlfii8RV56AW6XXJ3vaEi94KIe3t0OlZWXkdozvd0PpK
 g=
X-IronPort-AV: E=Sophos;i="5.85,370,1624334400"; 
   d="scan'208";a="56953482"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfGYgkozpzMVVPTEfNc8aNzNN9Qn+Xfjr8a+zCNUdaAWOlJh7XnOer/t8vkAKtHweBMUE430ij1wp/AzZ5V2qSuQNDPE79EtMT5TK7Bw74n4JaWlKrKKQ1fqm1DOUClUMWlPTpEcMJyOtnjqoy5Sa9V7OYnVj2HrOB35alog3tsDX5L2z7wFC3QHa5PgVaylYCCLm3cAlVLNgU2pFfQGpmml6a6MkhVOurCPZaxxLh8rsCdrDna+e1cYyylWkW8nh4FG8IXIs1sm0K0pMq+xgunTo3mdenC7D/Hiq6Yvv4x/GahJsMkQFuTUtr/xiOs8M2DVgztwYfKhkXnS6NwlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7OQN7BI/Pam2ZgJKQI4eQX42gLcyydSXTJrvLWaQEY=;
 b=T98yJItHVzeVRboQoqbpg0UfzDuYJ9OL3rF3M+pWXDu+jqvKeCrMLGW7LbcjrjIZkeU5kDgFE8+oS2RVWqLQwD+4D1Z03mYRI7KCoBR6wcb2CHniznUS5rn6LUfnvba9xNBAEj3mHn9q6cFXR9gHOKWWP3rU5lsG1wrzP12WMz+FQejzaVOpGU0bTkCsyv1RqJ29nfIs33HnE/C/HUp+e+1uQzxcGuXwV5pJvGpaImKECX5oJfRFXckvS8GwTA4pxhJFn3l9FGYvK7yTCrztqGHLgd9ITfiSITVk7VSGGhJtbgfFn5OijwEUbDLC6WHISEk3PPna1wUqliP4HGUhKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7OQN7BI/Pam2ZgJKQI4eQX42gLcyydSXTJrvLWaQEY=;
 b=ac6UwGUjHa64Q4DWUyDlohmEWM5Rp4V8IO/ftMZoXhaNAOWtVdQtJgb+LCTN7NQ8WVA7yVuXbPnwDfItD7ubkMhlNentOjgI2RI18becnXMjP9Vxrmw0zDPOCmiirMKLGRaxjEL6Ek+3pyji5RWQWvXZSlPobLLLDTMyEpdGDRE=
Date: Wed, 13 Oct 2021 13:11:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v3 01/11] vpci: Make vpci registers removal a dedicated
 function
Message-ID: <YWa+4hsaOxuX4tWJ@MacBook-Air-de-Roger.local>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-2-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930075223.860329-2-andr2000@gmail.com>
X-ClientProxiedBy: LO4P123CA0379.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71e51602-4e99-4119-36cd-08d98e3a3817
X-MS-TrafficTypeDiagnostic: DM6PR03MB5273:
X-Microsoft-Antispam-PRVS: <DM6PR03MB52735BB6A240413D9FFBFB018FB79@DM6PR03MB5273.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ArjVHeH0qheoi/uWNDwL439KzxiAQV05rQk8fsXVIH18VoUdfxi4+BmjEld7BmHXeIt2CAkTeehxOLP5THgSMG75pKof/xRlWroWpPEyanlRLubrq9FKw8FI9ekr8CL49g3Yt/Fv4pIRv95JFdVdLHkjy0EWvU6GY09B87B/uZI+vUmNzrEvooPDcdHjJfu/3jGw8+JDm4WsFlRSGklFQpBOtCNgbgt33jnUZyxZT++Q/VbktwVSD34KD0m07F5SOy4omHgCKypo6877iUu8m1zO4ZjaVfNQHa130HSJUjmvaNniunnQdlNbvjx35Jr/uf0ss2lLUn86JhMchz3/LyhX3rtLOuMkUjWXed9pHI1BIj9WYcvKHozrtDWlrN0wdutXJ1qMyeBxe85RNhGK5AgVcymgqotb1DRGUx/EliESMeV3hUt/2c1OYR5/4SPw3FhASa7lxfu+tU71t/Y2ac1gWTRAcO/EFc4e8ORPddIxP7Pe+Nimr+y1DKnDcymWaVMzv+Y+Rbj5nTlA4/xw2cEXgB9OrbggRAh2LvTAE0j+PwmALbG9yDYebqBreeFKHnKINURqOHxT8VdGGW1PiJ9g6lnxaDQAett3appkVqeqrd9rWin5e4Jnz+0Kjb8srH19tlYIeTqRaYpLSM4wgStS/bg7qWL/cMVs1z77Akqp0HQz5EkITFvejfXKc2OTmn4R2WZRDwq147WbLAfcIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(6496006)(54906003)(26005)(4326008)(86362001)(186003)(85182001)(2906002)(6916009)(316002)(7416002)(83380400001)(508600001)(956004)(8676002)(66476007)(66556008)(6486002)(8936002)(38100700002)(82960400001)(9686003)(6666004)(66946007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFI0alJ5c3k1Ni9jUVQzemJZRzZBd2h3b1E2WWp2NlpFVTFTclg0K0FHM1BM?=
 =?utf-8?B?dVBaRkorckZaM0kxa2VSQzgrd3JlL01hZGdlREcxOHVaU2s4UUhVZCt1U1lv?=
 =?utf-8?B?ZStvMU1vU2xRTVViaTRoa01SSCtaMnhIcTZmWFJSVE5HWDd0SHNCUlVWeHdv?=
 =?utf-8?B?S3RvM1BONy9DY3hReSsrcHB1OE0zR25mYU9oY0IyTStEVUlQbG1CSTBTTzM0?=
 =?utf-8?B?MVFEYUZyUlY4Ky9nZnVpK2VReUtEUHFMbkFJQ0Q4WHZ6THJsSVBKN3BVSFdy?=
 =?utf-8?B?QmYrSEh4ckQ5WU9vbFpxc0s4NkVVNjlWYjNpTHZCeXBzWklNNHNpT0I4SDZ5?=
 =?utf-8?B?VGlMS3oycFZhL1EybGhiYUY3OURXamhoQzEzUllGeDV2ZXRGM0UyRnV0bmxM?=
 =?utf-8?B?VkFnck5jeWFWTG12ZUVqdjFXWHJ6bHpMUWw2Q3JSWkZiZURmV1g5aTlBbHpz?=
 =?utf-8?B?Z2FhdkNkSVBYa1lPNjlZUHkvVzRHMG1uU0tGTGwxV1dYMmNhZ00zYW1CYWVj?=
 =?utf-8?B?Szc5S2pyaVZPTDIvOC8vMXAzRVpaM1dlUXRLUDhqNHUxNGVQeE5lQkRoMmR1?=
 =?utf-8?B?SVIvdGhicnQwZGkvMXRRdlc5OU1GZVlSMmMvNXFXVjdueG1LLytiZ0VER3Ru?=
 =?utf-8?B?b09CanM0UStyRXJOZ01sU3lWV1dXM1ZrNnExY29xL3dSNmUrYlZoZjZKVGVQ?=
 =?utf-8?B?c0N3Wk5xTmV5bUJaSmdyeGFDZVIzT2FjYjVlU25vdkZQSkhXaVVJNytQdGRw?=
 =?utf-8?B?eUV0VzNEMC9LZ3N5S0QzSE9yMXFUUTNOZkRJUFRGckluR1lDRUJ6a3J3WmRp?=
 =?utf-8?B?MUR5OWZLdHN6RlBMUmhIU2NrbTluTVU0c29hSmNzYmZZYnFLd0Y3VXdwbmJG?=
 =?utf-8?B?UWJVTVZqZkZ4NVdKZFBjRlFiRnFaSW83OVNCZ0RVeThhNDVud3hHVVV3MnpT?=
 =?utf-8?B?NnJCMGpNQURjZkkrS3V0ZERpeWF2a2hPSms5dzkrbm1yYmRCd3V2TXdFUWUr?=
 =?utf-8?B?TVRsOGZ5czNMMi8xSlNSaDkwOHM2MVU2blI4UkpGMVZXbjRhR29lSWhmaG5D?=
 =?utf-8?B?ZEI0Y1N0LzhDVnZMa25HL2kwY0pCakFPSkxqMGpjRVk0TWh3b081eG1rdTZQ?=
 =?utf-8?B?RUVnN3hvQWxoeW05TUZiY29Na1ZmK2d6QW1FQWVOS04vMHRXcWUvems1ZzBB?=
 =?utf-8?B?UEpqbFRoU3NOUmhMUjIzL0lmWG1kZ3ZYUThic2owMjJwdjM5bmtod2xLL3A2?=
 =?utf-8?B?NXhLQzdyNTJZUHY1SXJnU1lsVlRRWGxzejc3cExpS2RiQXZORURJbkVEcjR1?=
 =?utf-8?B?d0VVK1loZmJiSUhSUXJMd2xLMHhKbk9nWnVkbGYwblFqV0RmcytXSlVDV3E4?=
 =?utf-8?B?ZmJlR2thQXFjbE0vWjBBd3hJYWxPQ2lvWDJTWU52dWJONHhhUW9nellpOURO?=
 =?utf-8?B?K3hLOXBFU2YrcERQZlQyU0t0NUpySTA0b2lxYU84cnZOWWpva2x3akxNQW44?=
 =?utf-8?B?aW1CUDVSTHZDMmxZU1k4SXZ2aDJhUERXb3ZCQnVvTXE3Q0RiREJzNGlrK1JM?=
 =?utf-8?B?ZlV5bEtwYkpieGRmMWM3YlFOOW1qbmwwWjFlZVAzRWVxUEFNbGtBaXYwNFMr?=
 =?utf-8?B?M1c1OVJUcWl6bU5ISFM1MS9DVTBzRmY5MjVkSFg3OFlZNzJzRmJMV1N4TDVZ?=
 =?utf-8?B?RXpXeGdCc21mZk8xMWxMZ3BDK2ZidjlXVFgrNk5TQUgxMlNIczZ2SDRnbEg4?=
 =?utf-8?Q?MTsfdgOQhFKMlM2HqK6VXqFKW6SmiooZHQ22rL/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e51602-4e99-4119-36cd-08d98e3a3817
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 11:11:35.1252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jofsfhuQJ8LV/CB7xx1SHH4y3db++1ZJ38uuV3BmPEeqcR6qAb1vfJJ3rH8W6wf11eLt5Itr+LY4vm+oz1rew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5273
X-OriginatorOrg: citrix.com

On Thu, Sep 30, 2021 at 10:52:13AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> This is in preparation for dynamic assignment of the vpci register
> handlers depending on the domain: hwdom or guest.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>
> ---
> Since v1:
>  - constify struct pci_dev where possible
> ---
>  xen/drivers/vpci/vpci.c | 7 ++++++-
>  xen/include/xen/vpci.h  | 2 ++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index cbd1bac7fc33..1666402d55b8 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -35,7 +35,7 @@ extern vpci_register_init_t *const __start_vpci_array[];
>  extern vpci_register_init_t *const __end_vpci_array[];
>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>  
> -void vpci_remove_device(struct pci_dev *pdev)
> +void vpci_remove_device_registers(const struct pci_dev *pdev)

Making this const is kind of misleading, as you end up modifying
contents of the pdev, is just that vpci data is stored as a pointer
inside the struct so you avoid the effects of the constification.

>  {
>      spin_lock(&pdev->vpci->lock);
>      while ( !list_empty(&pdev->vpci->handlers) )
> @@ -48,6 +48,11 @@ void vpci_remove_device(struct pci_dev *pdev)
>          xfree(r);
>      }
>      spin_unlock(&pdev->vpci->lock);
> +}
> +
> +void vpci_remove_device(struct pci_dev *pdev)
> +{
> +    vpci_remove_device_registers(pdev);
>      xfree(pdev->vpci->msix);
>      xfree(pdev->vpci->msi);
>      xfree(pdev->vpci);
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 9f5b5d52e159..2e910d0b1f90 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -28,6 +28,8 @@ int __must_check vpci_add_handlers(struct pci_dev *dev);
>  
>  /* Remove all handlers and free vpci related structures. */
>  void vpci_remove_device(struct pci_dev *pdev);
> +/* Remove all handlers for the device given. */

I would drop the 'given' form the end of the sentence...

> +void vpci_remove_device_registers(const struct pci_dev *pdev);

...and maybe name this vpci_remove_device_handlers as it's clearer
IMO.

Thanks, Roger.

