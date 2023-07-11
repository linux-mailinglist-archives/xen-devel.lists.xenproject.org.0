Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9705574EFCA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 15:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561760.878276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJD0p-0000MB-Ee; Tue, 11 Jul 2023 13:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561760.878276; Tue, 11 Jul 2023 13:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJD0p-0000Jg-AW; Tue, 11 Jul 2023 13:02:39 +0000
Received: by outflank-mailman (input) for mailman id 561760;
 Tue, 11 Jul 2023 13:02:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rRYD=C5=citrix.com=prvs=54940d4e9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qJD0n-0000Ja-Jk
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 13:02:37 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32f1bf32-1feb-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 15:02:34 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2023 09:02:23 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH0PR03MB5969.namprd03.prod.outlook.com (2603:10b6:610:e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 13:02:20 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 13:02:19 +0000
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
X-Inumbo-ID: 32f1bf32-1feb-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689080554;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GbzrxSEQN5Nktv2P0azVvj9xFD78cTllJWv+xgoLEWY=;
  b=PizUfnO+Pz4NyLoYtaGRGAPZnEQvMOn0xtAcDVcSbZGJSnGtgmEHpXJ8
   iVh5Iz6PWGUWFVLnvlSm+E48gNFAuOfuA5bpaBgw1SSqQP2lBQVb1Ym9Q
   Rkf2X3SN/HazjHliwN/OiDVfkXEnqyTqnFasQZIWqV2MWsAbGrlbg/3eT
   s=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 115123952
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OCFDEaDjQiuahBVW/w/iw5YqxClBgxIJ4kV8jS/XYbTApG8mhjwDx
 2ZMCmCGP62IajOmfop+Oo+18R5VuJbdnNBiQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxB5wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw27tvDkMQp
 NskFCkqbUCHqseK5p6iRbw57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvTm7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqy/13LSewHmTtIQ6BKaI68dv2wWo220TFRkRUkOd+fy5hRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4DOkS+AyLjK3O7G6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnop4thu3MCkRaGUENSkNSFJf58G5+d9iyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:V1eNCKpxOjDkXps7HENaaHQaV5oMeYIsimQD101hICG9E/bo7/
 xG+c5x6faaslgssR0b9OxpFsG7IE80tqQFhLX5Xo3SPzUO2lHYVb2KhLGKq1fd8kvFh4xgPM
 xbHJSWZuedMbE0t7ef3OAUKadG/PCXtIqTraP1yXN1SAFjbKttqz1+Fh2QHiRNJDWuQaBJcq
 ah2g==
X-Talos-CUID: =?us-ascii?q?9a23=3A4zydoWuCsp8f/wOcQjFX3RP06IsEL2XS7imBBHO?=
 =?us-ascii?q?EEEFqGLm4bGO21Lprxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A0tLERw9FOzbNEsbgt7XNceKQf9dz07mXDRtVqog?=
 =?us-ascii?q?Hu9SAMitoHW+YjDviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,196,1684814400"; 
   d="scan'208";a="115123952"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y61AyWRNiHKmeNeZv7qLw/O7cnPbIlf3wp/J6mVxJDur+D91Sn6u1foPsaZKjenwVKsYuZH1oEAzMmasfJfKVpLvFcN/g/7TCcrpGLAyDE9KKrdIvjVknyMERoWBcEFX2dhrzdLz0pL9AybyjUg22X76uuGEkJyQkMV8mBEvZJpCqlmWpMpG7WJf7I90NX+Ishr8uIyncKdeSWYajfnWy73Qn7HcWOP9Ir5BayLjQHQy6r0WvVRwTQu6vJtoMByqtKF7BpHSin5EUMXv+C3cwXaWloHTzf0F3jU5ygCG0LmsTmDDsZNiTxLoddkhphLCaszmbMgUvL1pJj9IlAxYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3U/MC3s1bATOC1m3p28D0fmyspNQvfKwMStXKvWIuSY=;
 b=B43fnfCDAuUcdg4TIciSiVd/y6TkK39kPOwyd2TRvqiSQ/iYIFSP6P0xD6lbZvI1PfbMoBAwfiSU2eRMrCPlrcC+vNcS04WK3/mk0m8sWY2Il4GQungh1pjOcaw7nFgMdIsGB4Hbf5JiPH7Psdq7cybFtki0dMaTQf9MDBxM32iAoWSEuC/jZ1pjFB9aQ6kNzSNjP9714N+ThCh1rkQ464I5zDwR/crnf+C0SM5OyAaN5jX15Kr2KzHrSOnJNxzNlFY41pfqAZn5gImCmv/24Hf/sI5UslSBrnBK4P2sbAL6JlMxchzqxH/whP0XiMw3/o/xemNIH21guZdQM8UIzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3U/MC3s1bATOC1m3p28D0fmyspNQvfKwMStXKvWIuSY=;
 b=ucOgXjGC7Zc6vj1nvpoTqf3sGxgT2qLjJZ3U3ogFbXW9Rze/Swl4hRCsRLNQkfI6PWmRBub57FUWMyUvGhiW8v8SBWJDrNh+tSUVifJP3GApJfNTH4YhuYhmc8N8ARp028Puu+6aoZLziTycrjP1UZqv8EGOD7BSQTHzgNQb0JY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 11 Jul 2023 15:02:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the
 local APIC
Message-ID: <ZK1S1V71ZUIPjKqZ@MacBook-Air-de-Roger.local>
References: <20230707095338.44244-1-roger.pau@citrix.com>
 <92d16012-ff9f-693b-07c6-d45fe07a00a0@suse.com>
 <ZKwZBQ_0Z2c7NJNL@MacBook-Air-de-Roger.local>
 <1f79491a-46f5-5293-e92f-0e2b0b3efb62@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f79491a-46f5-5293-e92f-0e2b0b3efb62@suse.com>
X-ClientProxiedBy: LO6P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH0PR03MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: fa9ec487-c22c-4be6-80c1-08db820f0f36
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	34PLRaZf86PX2xvATS1ag+4whZsWMxh9bny0FFKX6nb0on+B6rQ6pSLSUApmhRdH7bx7bVuSvzADl8XQa2v5g4G60LeW+NF/CF4Fw8xm+s/+CRzw8YojTMDjrKWusONtjVjMtTmWnKkPQq6gqmSy+KlgAMunExLgV5gOYQi2S5+BpiRxnQ11qF0az8TubpO5GIZubuZp+rfUlBAvKk+3JoFAljQdTBojKxmGK2skH4Wrf+Tjlg/Qwv24N2xf47vole7syYA0/WXhWkCuXWDlKMwFt8dTNA/O2peJPVb1q5brKpZ2T2aDcqcmPMGf8UqXY3XgYrdAbVM2XOabW52uN4Byr9OsVEsYffxwwj/RwdjwX9/QG2hpE3QBQOrRHdfSY+XYJIOJHgKmRIRs8mbi65zNlFlwKX40TziEEiRkTj94yliwYUbC0zzmtU4jCtAajj6kKQR2XLwiSyKoSNzUkAii03/OF2WiZcvEkzkv/+HPUMKac1uWZLNp2+MPeM6kkT8C/Xp/YWAX35eKMF8E615oatDFhOxfEUuQh1AhMbzBkvv7ZSr0pPVFovSVYPW0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(451199021)(8676002)(8936002)(5660300002)(83380400001)(186003)(26005)(53546011)(6506007)(86362001)(41300700001)(66899021)(6666004)(6486002)(316002)(6512007)(9686003)(66476007)(66556008)(2906002)(66946007)(82960400001)(6916009)(85182001)(4326008)(54906003)(478600001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amtPQjBid0NNS0JnZ0cvNHFZV3dnc2E3cHc0OENtWlNwL1pHTmtlaDZENUhR?=
 =?utf-8?B?NVRjYXV5cjFNU2JLcDIycTdXTmRxcHRHTjNrVy90c1JSNUxTWFhnU3BORHpQ?=
 =?utf-8?B?NEVwcHQ3T2tpS3AyY3pBNU9QZVlCYUg3SmxQTXRyNVBiUFMyMFlnc1BlVDF6?=
 =?utf-8?B?dmxHN0hrbmFYUklqcjFReFhxd2JKOXE3Q0EwZGRNMjFYTXJGOTZnUm51YXRs?=
 =?utf-8?B?cmFBUXNSYUdqRlorUGc3S0kwSU5VOExxOVNEaENPMXZiZGYxYmxPRjVRSzIv?=
 =?utf-8?B?K2RlWXh0SWt2OVdlUTUrUFNQemtIOFFJWUp3TU9MRFlURDVjK0J0N2lJeEE5?=
 =?utf-8?B?S3FrV2dQVlRXSm1LbkJWWTRkOHk0MGZDY0UzeFU3NUFwOWlwTTU1Tkp0QThs?=
 =?utf-8?B?Wk1jaFVsaU1kakZFTjhadUZUNjlqa090bmdMMFhubE8xQno3Uk9NMzQvVkJP?=
 =?utf-8?B?YldWVmpjRUFSeVJWOFlTSWoxYlprZU1uUHpKeVNDcU92RDNtT2R6c0dYOUdY?=
 =?utf-8?B?NElzdmdQYzAxMDhnOEtNendjSzhEUEpSbmduTXRnL28rblJwWWhuaUdHaTJI?=
 =?utf-8?B?NFRoV3l0a2tQNTFtYTlRVElCQ09sTmdrdzlKSDVEdnJsMVNxQUNZRTc4eVVp?=
 =?utf-8?B?Z0lLbmJrR0I0Nkt1VXRiZWYxalQvU2RuRU40WDB1R3N5MnBXVmRzNjZ6SWo1?=
 =?utf-8?B?Q0tWODBKREh6b293VnZjTFZ2QndVdWh4Njk1Zk1QQkgxSk1yM3QzNkhnVVpv?=
 =?utf-8?B?RXRsQ0xuMGh2aENXSmhic2ZHZSsybXhBczArZHJ4MW0rbFNQMUw0cDlrSnlP?=
 =?utf-8?B?UFJiS3RhbUNEckpsZ2t2UUpvcDJlUjYwbXN0N1htQm1ZelZXUUM1bWVWZGNO?=
 =?utf-8?B?L2t3YTM4Szd4QTVHSmFhSnZYU2FUSTA2OURzckxpSzRYY0pDV2JRSVBBZSto?=
 =?utf-8?B?dzBrb0RmNC9vWVZsUEwraHlLVEthdVN0TXZmZ3NDdDhrZ2dUUy95WDJhWXFv?=
 =?utf-8?B?UlRnSGY2WThhRDdtZGxSNjljamNkY281YmE5WC9JTTY3MGZkajJHbFA1Yld2?=
 =?utf-8?B?bmRpNmRLTmJJUks2V2RSQVR0Q1Rha0RFZnJweUpyTXkyOC9BalQvUHU1c29K?=
 =?utf-8?B?M3BKMkNkWWo1dTJmSGQvZUgwVS9OMFZyem5VdE5pVld6ZUM3S1NHd2dPWk1E?=
 =?utf-8?B?UFVkckRHY3FZWDRFdThDdXhWWC92dld2QXhkZE5SbHlOVWh0dkZPTGRqdE10?=
 =?utf-8?B?TW5MV2xGcDdqekpCZkpwTUtlVDR0aW5laC9qMFJKcWVuVGd2S2VURC9Rbi9j?=
 =?utf-8?B?dG42N29jTHBIR2RhTFprRFJ2bE5MMjh2TUkyYWNxTHlCbDlmTnN3RnN3bm9l?=
 =?utf-8?B?OUdOeW0vUnpVdkFBT1pDczk3WUNFUFc1MS9qWXJOdXNjU0tvb1pGSGlsckdp?=
 =?utf-8?B?VXZBaDR0OHQvVGp5VVNpK1Njc29ZZy9hR2E0Kys2Y3YzSFBqTGxMZS93MHRO?=
 =?utf-8?B?UmdqTWg3L0NZSll1aERrSWw5dStXY0krWVd5UmR2OUFreEhJUWcvalRFdERo?=
 =?utf-8?B?WlRYS0VtU0ROVERSb2NreG5BeWpSTXZ6N2VqcGc5NmpOWWdpOUJwUllmei9t?=
 =?utf-8?B?a0U1S0VoUnA5aXVJN2xzOU1jR1puVThjQVFwVWhmOStxeW1nbGlYaU5pVGdt?=
 =?utf-8?B?TWYyY1JBQkhsbjg3ZStYTmdVT3BuNHppOWVFWnZ5ZGRTUG5Ed2dIQ3U0RWts?=
 =?utf-8?B?aWNGdHZ5SmttRzM5YlZvaXV0VFhMUVh0RWgvRWtvZUNyODB6MjJ4czR5L2lN?=
 =?utf-8?B?SDUyZTFDSFphQWRhMlZTbTlTNHZ6RjdrQnBDVVdacCtEb0RldDdqcy9mdTJj?=
 =?utf-8?B?OU1DTFpveFVTOHptREtoeGd4RnU4YXEyYS9ndXNQT08ra1A5d0ZRTG9TOGZV?=
 =?utf-8?B?eUFVaWMxcS9LZitaV0VTMHUzS0s0blpYYk9KcFBrK0ltWlk2eTQwODltUWxu?=
 =?utf-8?B?WGljajFpdTFCYVcxcGlmaUZEeCtHTnIwc2NucExNQ3E4RFc1ckdkZWtkZUtz?=
 =?utf-8?B?eXFxZkpOQWdFbXFhbFRKNkE5bmlsd2J4QzFqRjRLNDJYL0sySWZ4NTdQa2F6?=
 =?utf-8?B?eDFsU3cyaVB3ZVViRFNOb1N1eTlQVmdZS2MyTVA3SlJuMWhmRzlaWjBpMU5Z?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jnlZWfQevJ1ztswidgTmlpdGf287XZMJ6yBLTYomyJhktfNDmOiv4RAElRo40a6ZLW9W1mn+lbtskzPcrO92PAi7pCaglyuTiMqByodPrx1nVBToTi3MEhzvStdhMsHIQEWTdy2s00BjLm4Cxqy6qF7Bhb1J7EBmUg/D5d0CuuQg5VhC5x4v8/FgqI+ExKmL4KMVQ+EblQkTiTMF1rwbRw/AaL01UFscEEsW94YTGcNrQTvW9FcjYVjWptUsyG02hZSh4Nmw5kEcjsOhS7zw1h387/2EAN/RWPX3Hd3KxWx4+LMedlFrSRUgOaaH0U1F460ZiX+5/C/Co7NulJMJaSCvsTitwdfHntqWUQGCTkOtIUSN5pPss0z83XNQ1z6l4us68C8q2pBBEHukPNJn+c3SuCdUdj2q25fBtMtr4K3nZjv2u0X0CPEuXyT6AE/zvTjAEl8pIk9Bt4aQSBA44gjzWvzjygNJMNnr603tzCsMY6wPXY/hHeoLPhQGLzjo3WNuSZVNPEu2UlYKFq9K+BPouSoIr7Rngmhq1IZEael/pdZe3FFfPnbUQB+nJmw8kru+FO9X3uIgMxEK0w6qAAcVLAGNTJQwRhII4K2NsabyGREDCRUby6+dn6L7J6OkAFaEePMRXoFsxiYSKlHGPzNMA7ve4W9hCBaWopXXzQ/iSdoCCC/mItoG+Yb2sbLYbyFbJpO/c896byuvXJYZkHJyFmvi8079eKyc77iN5O7IKT3HOWDWertI+zRLWQlHChf0hpWTmwH167W4KLR/LATaiMg5HobuX14StV1K7OyJS3Lcskr0HwLUVa//SsoC
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9ec487-c22c-4be6-80c1-08db820f0f36
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 13:02:19.7391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0aolR2M1YJzskoF6rvLrhmpG7nJIYJRIExHNNBqNPjpFrNfWzrCxstVUk+1Bntg8jQfVwM3jX7mH4YzqjnsH0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5969

On Tue, Jul 11, 2023 at 12:53:31PM +0200, Jan Beulich wrote:
> On 10.07.2023 16:43, Roger Pau Monné wrote:
> > On Mon, Jul 10, 2023 at 12:56:27PM +0200, Jan Beulich wrote:
> >> On 07.07.2023 11:53, Roger Pau Monne wrote:
> >>> The current logic to init the local APIC and the IO-APIC does init the
> >>> former first before doing any kind of sanitation on the IO-APIC pin
> >>> configuration.  It's already noted on enable_IO_APIC() that Xen
> >>> shouldn't trust the IO-APIC being empty at bootup.
> >>>
> >>> At XenServer we have a system where the IO-APIC 0 is handed to Xen
> >>> with pin 0 unmasked, set to Fixed delivery mode, edge triggered and
> >>> with a vector of 0 (all fields of the RTE are zeroed).  Once the local
> >>> APIC is enabled periodic injections from such pin cause a storm of
> >>> errors:
> >>>
> >>> APIC error on CPU0: 00(40), Received illegal vector
> >>> APIC error on CPU0: 40(40), Received illegal vector
> >>> APIC error on CPU0: 40(40), Received illegal vector
> >>> APIC error on CPU0: 40(40), Received illegal vector
> >>> APIC error on CPU0: 40(40), Received illegal vector
> >>> APIC error on CPU0: 40(40), Received illegal vector
> >>>
> >>> That prevents Xen from booting.
> >>
> >> And I expect no RTE is in ExtInt mode, so one might conclude that
> >> firmware meant to set up RTE 0 that way. Mainly as a remark, albeit
> >> of course there's then the question whether to change the RTE
> >> rather than masking it. What do ACPI tables say?
> > 
> > There's one relevant override:
> > 
> > [668h 1640   1]                Subtable Type : 02 [Interrupt Source Override]
> > [669h 1641   1]                       Length : 0A
> > [66Ah 1642   1]                          Bus : 00
> > [66Bh 1643   1]                       Source : 00
> > [66Ch 1644   4]                    Interrupt : 00000002
> > [670h 1648   2]        Flags (decoded below) : 0000
> >                                     Polarity : 0
> >                                 Trigger Mode : 0
> > 
> > So IRQ 0 -> GSI 2, so it's likely pin 0 is the one the i8259 is
> > connected to.
> 
> Then wouldn't we be better off converting that RTE to ExtInt? That
> would allow PIC IRQs (not likely to exist, but still) to work
> (without undue other side effects afaics), whereas masking this RTE
> would not.

I'm kind of worry of trying to automate this logic.  Should we always
convert pin 0 to ExtInt if it's found unmasked, with and invalid
vector and there's a source override entry for the IRQ?

It seems weird to infer this just from the fact that pin 0 is all
zeroed out.

> >>> --- a/xen/arch/x86/apic.c
> >>> +++ b/xen/arch/x86/apic.c
> >>> @@ -1476,6 +1476,10 @@ int __init APIC_init_uniprocessor (void)
> >>>          return -1;
> >>>      }
> >>>  
> >>> +    if ( smp_found_config && !skip_ioapic_setup && nr_ioapics )
> >>> +        /* Sanitize the IO-APIC pins before enabling the local APIC. */
> >>> +        sanitize_IO_APIC();
> >>
> >> I'm a little puzzled by the smp_found_config part of the check here,
> >> but not in smp_prepare_cpus(). What's the reason for (a) the check
> >> and (b) the difference?
> > 
> > This just mimics what gates the call to setup_IO_APIC() in that same
> > function.  It makes no sense to call sanitize_IO_APIC() if
> > setup_IO_APIC() is not called, and I wasn't planning on changing the
> > logic that gates the call setup_IO_APIC() in this patch.
> > 
> > I did note the difference with smp_prepare_cpus(), and I think we
> > should look at unifying those paths, but didn't want to do it as part
> > of this fix.
> 
> Well, consistency is one valid goal. But masking RTEs may need to be
> done more aggressively than setting up the IO-APICs. In particular
> if we're not to use them, we still want to mask all RTEs. Otherwise
> we're likely to observe each IRQ to arrive via two separate routes
> (once through the 8259 and once from an unmasked IO-APIC pin).

So avoid the smp_found_config check here and use the same condition as in
smp_prepare_cpus(), I will adjust the patch to that effect.

I do wonder why we don't simply mandate IO-APIC usage and get rid of
the code to handle the 8259.  Is it only to cope with systems that
have a broken IO-APIC configuration?  Because I don't think there are
x86 64bit systems without an IO-APIC?

> >> Isn't checking nr_ioapics sufficient in this
> >> regard? (b) probably could be addressed by moving the code to the
> >> beginning of verify_local_APIC(), immediately ahead of which you
> >> insert both call sites. (At which point the function may want naming
> >> verify_IO_APIC() for consistency, but that's surely minor.)
> > 
> > I wanted the call to sanitize_IO_APIC() to be done at the same level
> > where the call to setup_IO_APIC() is done, because it makes the logic
> > clearer.
> 
> Hmm, I see.
> 
> >> As to also checking skip_ioapic_setup - wouldn't the unmasked pin be
> >> similarly troublesome in that case?
> > 
> > skip_ioapic_setup is set when the IO-APIC address in the MADT is
> > invalid, so in that case attempting to access IO-APIC registers in
> > that case won't lead to anything good.
> 
> Of course, as I did say as well. Still if for some IO-APICs we know
> their addresses, we would still be able to deal with those (if we
> were to stick to this mask-all-RTEs-early model).

The issue is that ioapic_init_mappings() will refuse to process
further IO-APIC entries once an entry with address 0 is found.  We
could change that, but I would likely do it as an improvement rather
than tie it to this change.

Thanks, Roger.

