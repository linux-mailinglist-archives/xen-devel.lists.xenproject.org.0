Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 145C948C6EB
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 16:16:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256703.440660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7fLl-0001Lw-8U; Wed, 12 Jan 2022 15:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256703.440660; Wed, 12 Jan 2022 15:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7fLl-0001Jz-4Z; Wed, 12 Jan 2022 15:15:45 +0000
Received: by outflank-mailman (input) for mailman id 256703;
 Wed, 12 Jan 2022 15:15:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBVB=R4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7fLi-0001Jt-Ni
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 15:15:43 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ef3470b-73ba-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 16:15:39 +0100 (CET)
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
X-Inumbo-ID: 7ef3470b-73ba-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642000539;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=eb2Ss/dz5YA6/xMiFTGcENxWmFyMZybHkCICj/uCabs=;
  b=DI5Tj2ar8Gj2qboehIoX/EgNVJ0aicKUAAOFFa2mWrkfdIWc4rGWnENk
   JBm6NW3pEB9tBQrOUPf9hnSL7l3fxelN6ZwcTdh6AQH0jPM3OyEU4MAQr
   k97kp1TD+YcobVwFR8PhwpVnMkcl/RWOb+GSr2Pv7RJXsaadgM/Lw61mr
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8a6ID/RtoIoOzSn8rQ1mzM72h2BfMzpStZ0K3T4hGGCc7df1SMbbJcVA31BqvrdTggXYUGJThP
 Wn/sSOv6FgSdDn8OEVhOcxXFGQuviNb+r+QaVmI+bu+lkGwVC/KxF5p5dz//TJuBVdl8388qg9
 0GFiiTWk021NpVMSd5Fa/dD8o4bZbVU+5saYQFsJIXVQvCwppQHqWPeJTdBC/E7CFrwy/MBSsK
 S+UXqZejYJkYVzbXdP1+LHzVl81mWolSMbVU43IdywQjgmhgty7hSLt4LXuMsut1J+2mK4DXER
 MoL7sEjcGQgaqiEGTZIaepXq
X-SBRS: 5.2
X-MesageID: 63962478
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QQ7NG67ysxd1Cd60oy+ZBgxRtPjBchMFZxGqfqrLsTDasY5as4F+v
 jcWCm2CM6mINzSjed9yO4++804G65KDzNFhHAA5rChkHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg29Qw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 o4U9sLzSwUSZ7DSnM0jYjgDNwZeFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmxh2JoSQqa2i
 8wxQhg2LxiQaD50HE4dFrcXzL+Q33KgWmgNwL6SjfVuuDWCpOBr65D1OcfRUsyHQ4NShEnwj
 mDM8nn9AxoaHMeC0jfD+XWp7sfmhz/2XbU3BbKx9/N0qFCLz2lVAxoTPXO8pfS6kUe4V8hoI
 koY4Dc1raMy+UqoSfHwRxS95nWDu3Y0QdNQDul88wCLxar86hycQGMDS1ZpYtE8qNU/QzBs0
 1aThs7oHhRmqrjTQnWYnp+WsDezNC49PWIEIygeQmMt89Tl5Y0+kB/LZtJiC7KuyM34Hynqx
 DKHpzR4gK8c5eYC0amhpwif2xqjo5HISkg+4QC/dnyi6gR1dYu0fbui4FLQ7etDBIuBR1zHt
 38B8+CZ6O0NFpiLmDa6XPQWHLqp6vCGNxXRmVdqWZIm8lyF4GW/dIpd5DV/IkZBMcsefzLtJ
 kjJtmtsCIR7ZSXwK/UtOsToVppsnfOI+cnZuu78aIEXIcYydg28pTxwYWeu7kG2tG8MuPRqU
 XuESvqEAXEfAKVh6TO5QeYBzLMmrhwDKXPvqYPTlEr+j+fHDJKBYfJcaQbVMLhlhE+RiFiNq
 75i2922JwKzuQEUSg3e6sYtIF8DNhDX7rim+pUMJoZvzueLcVzN6sM9I5t9KuSJfIwPz48kG
 01RvGcCmTITYlWdeG23hohLMu+HYHqGhStT0dYQFVipwWM/Ro2k8b0ScZA6FZF+qrA6nKQqE
 aldJJ7Rahiqdtgh025MBXUahNYzHClHeCrUZ3b1CNTBV8MIq/P1Fi/MIVK0qXhm4tufvsoiu
 bywvj43srJYLzmO+P3+Mar1p3vo5CB1sLsrAyPgf4cPEG2xrtkCA3Gh35cffpBXQT2el2Ty6
 upjKUpCzQU7i9VroIChaGHth9rBLtaS6WIBTjaLtujnZHCKlodhqKcZONu1kfnmfDqc0I2pZ
 PlPzuG6N/sCnV1QtJF7HaotxqU7j+YDbZcApui9NHmUPVmtFJ16JXyKgZtGuqFXn+cLsgqqQ
 EOfvNJdPOzRas/iFVcQIisjb/iCiq5IymWDs6xtLRWo/jJz8ZqGTV5WY0uGhhtCIeYnK4gi2
 +og5pIbslTtlhowP9+apSlI7GDQfGcYWqAqu8hCUo/mgwYm0H9YZpnYBnOk6Z2DcYwUYEIrP
 iWVlOzJgLEFnhjOdH86FH7s2+tBhMtR5EAWnQFaf1nQw4jLnP462hFV4A8bdAUNw0UVyf93N
 0hqK1ZxefeE8QB3iZURRGurAQxAWkGUoxSj11sTmWTFZEC0TWiRfnYlMOOA8U1FoWJRej9Xo
 OORxGr/CGu4ecjw2m05WFJ/quylRtt0r1WQlMeiFsWDPp87fTu63fP+OTtW80PqUZErmUnKh
 eh25+IhO6T0OBkZr7A/F4THh68bTwqJJTAaTPxslE/T8bowpN1mNeCyFn2M
IronPort-HdrOrdr: A9a23:slBkrK1EtCODWqIdVt/kfwqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YcT0EcMqyPMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W1Dk1frsA6ciYnV9MNOA4/e7rFNoXse2O7DIvAGyWvKEk4U0i92aIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.88,282,1635220800"; 
   d="scan'208";a="63962478"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+wdG8Fw6B1L4FCO9YemEs/Jr6yj1wi0XfcAajNyby+y8C7hNfM1xFLL0H4V6CnnKm8qhPS06Z5xNkEhRAA5HvQTJ8zwcDmuzqaNM6MAk6lcNIiHW95+7p+L4iTmnr/NIIWQNDyCoEv0WTyIfWLGP5xrh2ukGC9ZYwUs6Fydqzgp0vePpBHtBD7BWFUOxz+YMcR2IJ4zmUERMXWPmsu5n+f2CvmQAbIbqc4kvuU7pqTgt9TETRQJaQEu/wHsTsaaIpbQW3YG7ISRt0cFm1sSFh+gh8Bdp9fWDj2JfPM9VC4ZTYmDK2NxirR/i01SrfafmoNu10YtllnKByWRKrM6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVCba0zJ7UlTYRiuy5KwmBd3xgIl+xzJl+G4ivAuc1g=;
 b=AVqvLbljj+Uk8AedjMRJCy/yvk70FJ9pTg+EBAY19sfQbd+S1CWpBz/VlJUNQzfqWn/No2WkV+AbzjEWMOJnvB7Q5VqQ1wfmIzrRnqr6akKSya8XsDdPeC9o7HxDbcg4DwTwL52HwPOybQ5U2+tV2wM4vD1/UPgS2WaVfxTz7ZMvG9Q1oaqmvKCySaULMu40IGjnl2ROTGsrxc00G54a1ZsW/dCzCtWqHiXNYox+Y4Xiua9jmMRaO8Jbl3isWED3469MKmdfa/1ZCfAVgA2RzzEX4H8QlcqbrYzraScGhA+CqEi6X+bmpn6qF4onm20BYlcpwQPPi0Heu9q97EtSzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVCba0zJ7UlTYRiuy5KwmBd3xgIl+xzJl+G4ivAuc1g=;
 b=ilBF2LZJLF6LBM4X3jTbvC5wsNqmhsGu0ZoGgKYWv30iWx2/rrrvt4p+dmABjX28OYW71dzJ70pw7ROoaSwwBL6U8lho5Ob/YYNT4EAESz3svDeXtvl7j4yyliPi0YLYdMxAmOLO21NuqRpLTFbiygx/KDYXVUmseWJcr2MglGM=
Date: Wed, 12 Jan 2022 16:15:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 07/14] vpci/header: handle p2m range sets per BAR
Message-ID: <Yd7wjP8WLWQxzLbq@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-8-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211125110251.2877218-8-andr2000@gmail.com>
X-ClientProxiedBy: MR2P264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb7556a2-f19f-4ba6-2ab8-08d9d5de6017
X-MS-TrafficTypeDiagnostic: SN6PR03MB3598:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB359842C2D446A76ABC4063F08F529@SN6PR03MB3598.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fkiyYt6M46n0LGdMDoIwYF0a3ejGxMh2rFSGFzejpM9ZYbi4Nyeh6m9yOM2kaQ1G10l6uZ2IWqRycjg4pk6z4g0CXNVzG++wEna5Vv3bQbyOr2kFuLabnsXBNTPzh/wu5x+8BeKvv5QDZJc5i3LAxSxmZRNuISnsVDSIhu52QIEjt974KY1V9UPt0gc9cVIhRJnHQLA5Apd/mVh1w6ZlvaSE/DAFqHS2JQht6vTW5bOdWllzg/H4fn0cUeXbMgE2Xms3+ksnh/IztV+2XFjj/9Qjf5raettJfCPOFlR3jbMC5L/XUiujTictN0wgw2U9tg1aPot+hvDH/cm7cjQlix44/CXo5FjsYTB5wZfcFMBxwCVs/Z+Po1c34nr+FuaBWGNuab7mU0Iz5DEyEFIpxrqb0hyMUmXHxNYIR4qQjrTqnPT+hPb+RXa3PFDFDf+DZbO6QerGyy4XPA+x2MtVAriFQjp5D8aLnVB6sQsdPRluauk13lLCNRy8zmIW2AIk7qtb7PU0p27wWlLmAU4b72P162KK7s0G9Y5Ex8tLy2PzsrD/u8jU/lBLW4NN8acr8W3Vh7/Yje7Y7qTl3LIhP92eaPx//2m+vQBbOEpb93uAsrumWwjzBOt4yfC31Me7IWeV6QOCe4ISdcy2QHinxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(85182001)(30864003)(6666004)(66476007)(66946007)(7416002)(6486002)(8936002)(4326008)(5660300002)(66556008)(82960400001)(8676002)(316002)(6916009)(508600001)(2906002)(9686003)(6506007)(86362001)(6512007)(38100700002)(33716001)(186003)(26005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWNUdGREdXdOajNWdnZZdFlqTWh1Slo3cnZ5WExMSTdsRE1OdnRvM1d4ajlQ?=
 =?utf-8?B?VGxuZlZPb1F6VE00NkhZV0FHWVFRWmEvaUxqVHQ2S2JDWlRWbjM0c0htbUtx?=
 =?utf-8?B?dCs3aUxYMFFQRG9meGlSQWNNd2sza3MxUjBGWUcxYjJ2VzJjOW52YUZqWWNh?=
 =?utf-8?B?UG1SQ0kvbnFtNVdIdUFRU0lkNkN4dndvRlFhUG9SemxmS2paSmp1RjA0QmJE?=
 =?utf-8?B?cXlMZTNzaEhaQ1ZkbEJEK3pvendyMVRKQkswUTZ4T3ZRN3VIYmwvVjlLR1Q4?=
 =?utf-8?B?WnQwQ09weWFrNjhmS29OT3ZHK1ZxNlY4YnNDWUxsKytjc2JqWTZFaDVnVUF6?=
 =?utf-8?B?T0w1bUpTL05nejRWWUZxeTlRcldENi9jUVhaTmVVREI0MnZNbk9Gbm1BTHZw?=
 =?utf-8?B?NXVvbmZPODNhU3VkemtRZ25RVnkrU3BHU0psalR4S3JzdDBxWG5MRHYra1Fu?=
 =?utf-8?B?aDVnRE5QWE9SWHlleE4wY2RUQkZTdExSS203dXBRNjVkTTFYdWR3VDJLMVk5?=
 =?utf-8?B?eEZuU20zNlh1UHh1ZzZrNlpDRWFDYjA4WEVoaFdoR0Q0bWtVR2wzQWZBSUNi?=
 =?utf-8?B?MVVjdTBLRS9RL3BscUdDb2ZDQ1ordTFPNDFtMFJldTVzK1FZMjkxMTJKSG1U?=
 =?utf-8?B?emRuRitSQWFSUEJFNXlnS1VHOHpsT2tEYUFqTERac2RXYkthRGNPUWF6TmV2?=
 =?utf-8?B?WkRXYmRNSHBLRUcxSXJIUG5JRHRWUDZSb0ZJYXpCWFd5UEtkQkkxcFNVb0tM?=
 =?utf-8?B?b3VsWVA1S0pteUZxb0M3VXJBUVE3UUo4SkRBazdEcjNWUkJtZmkrZTk3K0pv?=
 =?utf-8?B?RU5CR2REd1BEOFNDMldrdHQybUo1T1hKTDRXc0xBdk5KYU1aOExGU2NPb0l1?=
 =?utf-8?B?a1pQUzNmcHhTNkpIZ1E5Y2Z6ay9HVTQ5WXRXYkd6b3JoZWN1ZEN1b3pSaEt0?=
 =?utf-8?B?b2FReGxsL25OV0FPc0xrdFVjOSsxUWZXcGxpb1FyYU5xS2NuTFZNRzczQ0Zk?=
 =?utf-8?B?SXlSSUpUb1pTSkRKRmFoZmJZZTZTaFhUdndTaUw0c0xpeVI3K0VVK0gxQW1a?=
 =?utf-8?B?YXBPOUdXYUViNGhlNkIwK2VhemhqK29HdjV3bEFyQWdveVptMDZxVXA4blVl?=
 =?utf-8?B?T2tMMnA4VDM2ZmNsUnl1cGxoV1pHOXc3R2tlVEVWVURyRjNMWlIvUXU3SXIw?=
 =?utf-8?B?WEpMdTFlZ1hoL0RjNVRGMXQ3N1ZwSlUwZElSaFpvSEo4UnpjMGNvZmc4ZmU3?=
 =?utf-8?B?ZVc0REpXaXNpY2NnbUhHSi9taTZwejNtblU2R1VCL0lab0YzK3dJTURzZHhY?=
 =?utf-8?B?VCsvM1h2TDAydVY5OGplSTFVS3J4UEdQSDNtcWxrend0WUVZMTJ3TDlzakow?=
 =?utf-8?B?VE9LcS91RlhhZFBkcGVXbmplOVF1bEhkYU5hVzVEMnY4WXhPWW1PL1pqRVgy?=
 =?utf-8?B?MlY2aHkyY1NGa3ZCbm5HcThZWlZhMFlLeXNHUGs3SkVqZ3FaekJ3L1NWNER3?=
 =?utf-8?B?aXVtNytQL2RIbGtjM2hyTVZ3VzV6c3Y0Yy9kSlBPbm1SREwrZ3gzYkl3TVhl?=
 =?utf-8?B?bjdBSGd4KzUxQW1UK3c1RTB3MzZRc2pwdEZRUXk1ODYvWkxvekhVZ2ovYXRl?=
 =?utf-8?B?bkxpeXdub1BhSEtud1hBS1Zwb3NLZFNPUC84SnlNbjdBWDNHYUxqcS8rVXRz?=
 =?utf-8?B?U29nMVpUUUhDMTY1UHBZT21mYnJ2OUUrL0NRdkpYTmNiSFlPd296TXRqdHFC?=
 =?utf-8?B?RWJKUmtJMWFreHBDTHVDOVR1T1V1WGw1em52T2NidWo5a2JOYTZmb3o1ODF1?=
 =?utf-8?B?S0lmTi9rTjY2Ry9Lem91Zjc2SHNSTU4xOGlPWldjeW1odzc1UjY1NEpRbUpX?=
 =?utf-8?B?azJCUjcwOXI4V1ZqREVoUEdxVENrb0dwVU9peHg5RXBOQlJlMXJscklKQ0h3?=
 =?utf-8?B?dVJ3Nk0yVkVDSjJLUFQzbWY2OEN6V2t2cHVHMjBDT3Y4a095Q0Zza3BZOGww?=
 =?utf-8?B?dHpQeXZLamljTkw0VTJVMnNPb1lFSVpOcnhlVjFuUHlFWlBGV29BUTZ0cGY5?=
 =?utf-8?B?aVRLdXhZWUlkam84cEFTaEJtRjNIV3h3YzZtdmlPMDM5Y2I0Z1RJYzFpeWtE?=
 =?utf-8?B?bVQ1N3lWdTdaYWtYOVZ5ZlVEbVcrZEtyRzdzN2R4TWd1cTRqNkFkVVVNZlo5?=
 =?utf-8?Q?AEV+tjMDNcOyXn9mqJ5F8Qw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7556a2-f19f-4ba6-2ab8-08d9d5de6017
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 15:15:32.4347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0eYMT7BQZ0HWl9EHrLeRMF6xaIGBgg/Z0AC16Z/8Dwd0dhayzrVVWxi7rqVe30/YxfWI2ICZmWR7whOuA6e5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3598
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 01:02:44PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Instead of handling a single range set, that contains all the memory
> regions of all the BARs and ROM, have them per BAR.
> As the range sets are now created when a PCI device is added and destroyed
> when it is removed so make them named and accounted.
> 
> Note that rangesets were chosen here despite there being only up to
> 3 separate ranges in each set (typically just 1). But rangeset per BAR
> was chosen for the ease of implementation and existing code re-usability.
> 
> This is in preparation of making non-identity mappings in p2m for the
> MMIOs/ROM.

I think we don't want to support ROM for guests (at least initially),
so no need to mention it here.

> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v4:
> - use named range sets for BARs (Jan)
> - changes required by the new locking scheme
> - updated commit message (Jan)
> Since v3:
> - re-work vpci_cancel_pending accordingly to the per-BAR handling
> - s/num_mem_ranges/map_pending and s/uint8_t/bool
> - ASSERT(bar->mem) in modify_bars
> - create and destroy the rangesets on add/remove
> ---
>  xen/drivers/vpci/header.c | 190 +++++++++++++++++++++++++++-----------
>  xen/drivers/vpci/vpci.c   |  30 +++++-
>  xen/include/xen/vpci.h    |   3 +-
>  3 files changed, 166 insertions(+), 57 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 8880d34ebf8e..cc49aa68886f 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -137,45 +137,86 @@ bool vpci_process_pending(struct vcpu *v)
>          return false;
>  
>      spin_lock(&pdev->vpci_lock);
> -    if ( !pdev->vpci_cancel_pending && v->vpci.mem )
> +    if ( !pdev->vpci )
> +    {
> +        spin_unlock(&pdev->vpci_lock);
> +        return false;
> +    }
> +
> +    if ( !pdev->vpci_cancel_pending && v->vpci.map_pending )
>      {
>          struct map_data data = {
>              .d = v->domain,
>              .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
>          };
> -        int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
> +        struct vpci_header *header = &pdev->vpci->header;
> +        unsigned int i;
>  
> -        if ( rc == -ERESTART )
> +        for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>          {
> -            spin_unlock(&pdev->vpci_lock);
> -            return true;
> -        }
> +            struct vpci_bar *bar = &header->bars[i];
> +            int rc;
> +

You should check bar->mem != NULL here, there's no need to allocate a
rangeset for non-mappable BARs.

> +            if ( rangeset_is_empty(bar->mem) )
> +                continue;
> +
> +            rc = rangeset_consume_ranges(bar->mem, map_range, &data);
> +
> +            if ( rc == -ERESTART )
> +            {
> +                spin_unlock(&pdev->vpci_lock);
> +                return true;
> +            }
>  
> -        if ( pdev->vpci )
>              /* Disable memory decoding unconditionally on failure. */
> -            modify_decoding(pdev,
> -                            rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
> +            modify_decoding(pdev, rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,

The above seems to be an unrelated change, and also exceeds the max
line length.

>                              !rc && v->vpci.rom_only);
>  
> -        if ( rc )
> -        {
> -            /*
> -             * FIXME: in case of failure remove the device from the domain.
> -             * Note that there might still be leftover mappings. While this is
> -             * safe for Dom0, for DomUs the domain needs to be killed in order
> -             * to avoid leaking stale p2m mappings on failure.
> -             */
> -            if ( is_hardware_domain(v->domain) )
> -                vpci_remove_device_locked(pdev);
> -            else
> -                domain_crash(v->domain);
> +            if ( rc )
> +            {
> +                /*
> +                 * FIXME: in case of failure remove the device from the domain.
> +                 * Note that there might still be leftover mappings. While this is
> +                 * safe for Dom0, for DomUs the domain needs to be killed in order
> +                 * to avoid leaking stale p2m mappings on failure.
> +                 */
> +                if ( is_hardware_domain(v->domain) )
> +                    vpci_remove_device_locked(pdev);
> +                else
> +                    domain_crash(v->domain);
> +
> +                break;
> +            }
>          }
> +
> +        v->vpci.map_pending = false;
>      }
>      spin_unlock(&pdev->vpci_lock);
>  
>      return false;
>  }
>  
> +static void vpci_bar_remove_ranges(const struct pci_dev *pdev)
> +{
> +    struct vpci_header *header = &pdev->vpci->header;
> +    unsigned int i;
> +    int rc;
> +
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +    {
> +        struct vpci_bar *bar = &header->bars[i];
> +
> +        if ( rangeset_is_empty(bar->mem) )
> +            continue;
> +
> +        rc = rangeset_remove_range(bar->mem, 0, ~0ULL);

Might be interesting to introduce a rangeset_reset function that
removes all ranges. That would never fail, and thus there would be no
need to check for rc.

Also I think the current rangeset_remove_range should never fail when
removing all ranges, as there's nothing to allocate. Hence you can add
an ASSERT_UNREACHABLE below.

> +        if ( !rc )
> +            printk(XENLOG_ERR
> +                   "%pd %pp failed to remove range set for BAR: %d\n",
> +                   pdev->domain, &pdev->sbdf, rc);
> +    }
> +}
> +
>  void vpci_cancel_pending_locked(struct pci_dev *pdev)
>  {
>      struct vcpu *v;
> @@ -185,23 +226,33 @@ void vpci_cancel_pending_locked(struct pci_dev *pdev)
>      /* Cancel any pending work now on all vCPUs. */
>      for_each_vcpu( pdev->domain, v )
>      {
> -        if ( v->vpci.mem && (v->vpci.pdev == pdev) )
> +        if ( v->vpci.map_pending && (v->vpci.pdev == pdev) )
>          {
> -            rangeset_destroy(v->vpci.mem);
> -            v->vpci.mem = NULL;
> +            vpci_bar_remove_ranges(pdev);
> +            v->vpci.map_pending = false;
>          }
>      }
>  }
>  
>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> -                            struct rangeset *mem, uint16_t cmd)
> +                            uint16_t cmd)
>  {
>      struct map_data data = { .d = d, .map = true };
> -    int rc;
> +    struct vpci_header *header = &pdev->vpci->header;
> +    int rc = 0;
> +    unsigned int i;
> +
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +    {
> +        struct vpci_bar *bar = &header->bars[i];
>  
> -    while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
> -        process_pending_softirqs();
> -    rangeset_destroy(mem);
> +        if ( rangeset_is_empty(bar->mem) )
> +            continue;
> +
> +        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
> +                                              &data)) == -ERESTART )
> +            process_pending_softirqs();
> +    }
>      if ( !rc )
>          modify_decoding(pdev, cmd, false);
>  
> @@ -209,7 +260,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>  }
>  
>  static void defer_map(struct domain *d, struct pci_dev *pdev,
> -                      struct rangeset *mem, uint16_t cmd, bool rom_only)
> +                      uint16_t cmd, bool rom_only)
>  {
>      struct vcpu *curr = current;
>  
> @@ -220,7 +271,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>       * started for the same device if the domain is not well-behaved.
>       */
>      curr->vpci.pdev = pdev;
> -    curr->vpci.mem = mem;
> +    curr->vpci.map_pending = true;
>      curr->vpci.cmd = cmd;
>      curr->vpci.rom_only = rom_only;
>      /*
> @@ -234,42 +285,40 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>  static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  {
>      struct vpci_header *header = &pdev->vpci->header;
> -    struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>      struct pci_dev *tmp, *dev = NULL;
>      const struct vpci_msix *msix = pdev->vpci->msix;
> -    unsigned int i;
> +    unsigned int i, j;
>      int rc;
> -
> -    if ( !mem )
> -        return -ENOMEM;
> +    bool map_pending;
>  
>      /*
> -     * Create a rangeset that represents the current device BARs memory region
> +     * Create a rangeset per BAR that represents the current device memory region
>       * and compare it against all the currently active BAR memory regions. If
>       * an overlap is found, subtract it from the region to be mapped/unmapped.
>       *
> -     * First fill the rangeset with all the BARs of this device or with the ROM
> +     * First fill the rangesets with all the BARs of this device or with the ROM
                                        ^ 'all' doesn't apply anymore.
>       * BAR only, depending on whether the guest is toggling the memory decode
>       * bit of the command register, or the enable bit of the ROM BAR register.
>       */
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
> -        const struct vpci_bar *bar = &header->bars[i];
> +        struct vpci_bar *bar = &header->bars[i];
>          unsigned long start = PFN_DOWN(bar->addr);
>          unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>  
> +        ASSERT(bar->mem);
> +
>          if ( !MAPPABLE_BAR(bar) ||
>               (rom_only ? bar->type != VPCI_BAR_ROM
>                         : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) )
>              continue;
>  
> -        rc = rangeset_add_range(mem, start, end);
> +        rc = rangeset_add_range(bar->mem, start, end);
>          if ( rc )
>          {
>              printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
>                     start, end, rc);
> -            rangeset_destroy(mem);
> -            return rc;
> +            goto fail;
>          }


I think you also need to check that BARs from the same device don't
overlap themselves. This wasn't needed before because all BARs shared
the same rangeset. It's not uncommon for BARs of the same device to
share a page.

So you would need something like the following added to the loop:

/* Check for overlap with the already setup BAR ranges. */
for ( j = 0; j < i; j++ )
    rangeset_remove_range(header->bars[j].mem, start, end);

>      }
>  
> @@ -280,14 +329,21 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>          unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
>                                       vmsix_table_size(pdev->vpci, i) - 1);
>  
> -        rc = rangeset_remove_range(mem, start, end);
> -        if ( rc )
> +        for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
>          {
> -            printk(XENLOG_G_WARNING
> -                   "Failed to remove MSIX table [%lx, %lx]: %d\n",
> -                   start, end, rc);
> -            rangeset_destroy(mem);
> -            return rc;
> +            const struct vpci_bar *bar = &header->bars[j];
> +
> +            if ( rangeset_is_empty(bar->mem) )
> +                continue;
> +
> +            rc = rangeset_remove_range(bar->mem, start, end);
> +            if ( rc )
> +            {
> +                printk(XENLOG_G_WARNING
> +                       "Failed to remove MSIX table [%lx, %lx]: %d\n",
> +                       start, end, rc);
> +                goto fail;
> +            }
>          }
>      }
>  
> @@ -325,7 +381,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              unsigned long start = PFN_DOWN(bar->addr);
>              unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>  
> -            if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end) ||
> +            if ( !bar->enabled ||
> +                 !rangeset_overlaps_range(bar->mem, start, end) ||
>                   /*
>                    * If only the ROM enable bit is toggled check against other
>                    * BARs in the same device for overlaps, but not against the
> @@ -334,14 +391,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                   (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
>                  continue;
>  
> -            rc = rangeset_remove_range(mem, start, end);
> +            rc = rangeset_remove_range(bar->mem, start, end);
>              if ( rc )
>              {
>                  spin_unlock(&tmp->vpci_lock);
>                  printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
>                         start, end, rc);
> -                rangeset_destroy(mem);
> -                return rc;
> +                goto fail;
>              }
>          }
>          spin_unlock(&tmp->vpci_lock);
> @@ -360,12 +416,36 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>           * will always be to establish mappings and process all the BARs.
>           */
>          ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
> -        return apply_map(pdev->domain, pdev, mem, cmd);
> +        return apply_map(pdev->domain, pdev, cmd);
>      }
>  
> -    defer_map(dev->domain, dev, mem, cmd, rom_only);
> +    /* Find out how many memory ranges has left after MSI and overlaps. */
> +    map_pending = false;
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +        if ( !rangeset_is_empty(header->bars[i].mem) )
> +        {
> +            map_pending = true;
> +            break;
> +        }
> +
> +    /*
> +     * There are cases when PCI device, root port for example, has neither
> +     * memory space nor IO. In this case PCI command register write is
> +     * missed resulting in the underlying PCI device not functional, so:
> +     *   - if there are no regions write the command register now
> +     *   - if there are regions then defer work and write later on

I would just say:

/* If there's no mapping work write the command register now. */

> +     */
> +    if ( !map_pending )
> +        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> +    else
> +        defer_map(dev->domain, dev, cmd, rom_only);
>  
>      return 0;
> +
> +fail:
> +    /* Destroy all the ranges we may have added. */
> +    vpci_bar_remove_ranges(pdev);
> +    return rc;
>  }
>  
>  static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index a9e9e8ec438c..98b12a61be6f 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -52,11 +52,16 @@ static void vpci_remove_device_handlers_locked(struct pci_dev *pdev)
>  
>  void vpci_remove_device_locked(struct pci_dev *pdev)
>  {
> +    struct vpci_header *header = &pdev->vpci->header;
> +    unsigned int i;
> +
>      ASSERT(spin_is_locked(&pdev->vpci_lock));
>  
>      pdev->vpci_cancel_pending = true;
>      vpci_remove_device_handlers_locked(pdev);
>      vpci_cancel_pending_locked(pdev);
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +        rangeset_destroy(header->bars[i].mem);
>      xfree(pdev->vpci->msix);
>      xfree(pdev->vpci->msi);
>      xfree(pdev->vpci);
> @@ -92,6 +97,8 @@ static int run_vpci_init(struct pci_dev *pdev)
>  int vpci_add_handlers(struct pci_dev *pdev)
>  {
>      struct vpci *vpci;
> +    struct vpci_header *header;
> +    unsigned int i;
>      int rc;
>  
>      if ( !has_vpci(pdev->domain) )
> @@ -108,11 +115,32 @@ int vpci_add_handlers(struct pci_dev *pdev)
>      pdev->vpci = vpci;
>      INIT_LIST_HEAD(&pdev->vpci->handlers);
>  
> +    header = &pdev->vpci->header;
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +    {
> +        struct vpci_bar *bar = &header->bars[i];
> +        char str[32];
> +
> +        snprintf(str, sizeof(str), "%pp:BAR%d", &pdev->sbdf, i);
> +        bar->mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
> +        if ( !bar->mem )
> +        {
> +            rc = -ENOMEM;
> +            goto fail;
> +        }
> +    }

You just need the ranges for the VPCI_BAR_MEM32, VPCI_BAR_MEM64_LO and
VPCI_BAR_ROM BAR types (see the MAPPABLE_BAR macro). Would it be
possible to only allocate the rangeset for those BAR types?

Also this should be done in init_bars rather than here, as you would
know the BAR types.

Thanks, Roger.

