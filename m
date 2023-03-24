Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CD46C8015
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 15:40:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514336.796464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfiae-0005gD-Ui; Fri, 24 Mar 2023 14:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514336.796464; Fri, 24 Mar 2023 14:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfiae-0005dw-RP; Fri, 24 Mar 2023 14:40:24 +0000
Received: by outflank-mailman (input) for mailman id 514336;
 Fri, 24 Mar 2023 14:40:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfiad-0005dq-RC
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 14:40:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd720667-ca51-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 15:40:22 +0100 (CET)
Received: from mail-bn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Mar 2023 10:40:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB5954.namprd03.prod.outlook.com (2603:10b6:610:e1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.40; Fri, 24 Mar
 2023 14:40:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 14:40:09 +0000
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
X-Inumbo-ID: cd720667-ca51-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679668822;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gT0bYj5k2GcZSQ76d4PpQEnfQLUlmVolK1Tz/ZW7cWs=;
  b=RFlcuQVwE7KtHOgucoIoxJuACRyiwkLzKb1t9ONaBtXN36A7+gcqqfjU
   ucvb/5vcnsMHIx6HAFR8tLODQVj79Itz+m+v7Wu3/TRVHLwckeeWUjGCe
   2G54LFq6hA6i27HqEzPYgtyXLeYorJlKe3uMihh6Cc7Bt3oi/GineGxl6
   8=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 104618921
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IktT+6y07ZEjo3zhEAl6t+cVxyrEfRIJ4+MujC+fZmUNrF6WrkUAz
 mQWXWHSPa6CYjDweNF/PNm19E8B6MCBz99iTgdv/yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6wT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVwX1
 tMoJ20PUiugnceT2763ZrYyhP12eaEHPKtH0p1h5RfwKK58BLrlGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjGVkFMZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjBNxLROzir5aGhnWh92Y1KhhIXmegqPuYoH+RVdADF
 HUbr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTSoNTA9A6d+6pog21kjLVow7TPHzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:SLNKRq1k2GsgHuo7LBg+vwqjBHUkLtp133Aq2lEZdPRUGvbo8f
 xG/c566faQsl0ssR4b+OxoVJPwJE80lqQFmLX5X43SJDUO0VHARO4N0WKL+UyaJ8SUzJ846U
 4PSdkYNPTASXVBoILdxiLQKbodKd+8mpyAtKPl400oZydMRIFP0zxQNya8NQlNaDQuP+tbKL
 OsosVGoja7eWcadK2Aa0UtVfTYutvOmInHTHc9dnwa1DU=
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; 
   d="scan'208";a="104618921"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHveL29O0MSuPDwQTdWCrlqcFJi8jkrELHB88dCcOqII+zrasU6ee9XB8NUiYFkjIaO8RNK7ggo1OuC7bIrqVfrkHSuQITGBN6e5lYe6xQ2zVkJQvGvLSd7m981AXVlXqFGJWkBvFkcYkRR/wY9RCB6JVA2Ltn8hCUkkKjbWsUgN2pA5HDmqdGg+5LSVnPyQuIX1sA0QhioGuxn9ybwm7m/TQsfq4xbUaVnOqpu3dtmSj4tHATZ4Vvz3xyU3WS31zuaW0wfVsWxB4s2UrSOjrm2IMaPyS/fieWnbhaCypyY0/bKoJRDX9D2r5g1UYGWNOTRGn5gdf1QiazIFlUxRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gT0bYj5k2GcZSQ76d4PpQEnfQLUlmVolK1Tz/ZW7cWs=;
 b=P+cJ/H1T4F4dKkg/Qmfd5OaqQ9wHhnILr9CZmBeQADinQYfR6Rr5Ezg2Dh5BHKn8eiFghZwuecTwYzLU9hXH/IJVt5SmOTrUSqgR9pSfYFehEG22LFsRAnvFwUkwMtflBHrN0fC9k26r+NoS/IqBG7jjmqfCs67tXMi4eJ5CTb6pQjFMxiNI1ydI8PzpD0Yj51wx1u70jxpb1TSnOXDSD7ZEdULTeZBd51XU3iw9AwQsbChMikHvDPrPSLgR/sf7g0ue/rx+FIfTSqsFKeoUDtX5YjJ/XSHK+CUoHOqBKrkeB+1gyHsoaL3Zhc1SPgltKFHXLt3/KW+1XWkZphOEuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gT0bYj5k2GcZSQ76d4PpQEnfQLUlmVolK1Tz/ZW7cWs=;
 b=ukqmc0Sno73GYlIdOsxrV42R9juo2SPznkgH3B8pmHy0TBirnTbAhMSwvMqme5CdBDrU9lpAKLmIwib2A0doGpKBxsbBsQmykv/t/4xsi/KYGTm2zyllSFGvN3bEJQEda0fnbCvSvZU/l563buhnZMoXcEWWSeAMZR/jXpgTw+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <92bb621c-46b9-1871-a9ed-13fada8cfc56@citrix.com>
Date: Fri, 24 Mar 2023 14:40:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/boot: Restrict directmap permissions for
 .text/.rodata
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211206130855.15372-1-andrew.cooper3@citrix.com>
 <9ac98bc7-5b39-3c88-556b-53a5fdeb2445@suse.com>
 <211f1b19-5f36-3153-bdc3-d904193b3643@srcf.net>
 <b0932fc9-b55c-59d2-29cf-e0ce76dedcc0@suse.com>
In-Reply-To: <b0932fc9-b55c-59d2-29cf-e0ce76dedcc0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0295.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: b34d537b-89fd-4ec2-8dfa-08db2c75aab1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wopVwgXeuMamx75sXXkVGR5hupT3K0qOafdYos8YnBi9a3Lu8cspg5iBDnCxHeP4iWdFMHEEX1RwZOw+ZIieaQrlw/4LEWY1xhwE4RvwfJW4PFN42tIzXPgA0GL4h99btMSpqYWOIBEAv6I706t0hsdtAbwtSzlgnJc/p6aV1qlg6U9uayvePXxQh43COr5jqCZEdHFO3h7qXWxhfvhO89ze2PnRe+tgjhf5PgwsIdssTC1g3m05rBuSlmH1BQwszxQmPXBLG1shu6dwem92WRMnOf/glwSpAf1XQRxcKQWp/8InoS++Gcjsyy6riLv16ltl0RVASTVYsRAGC9iR5J3KBxFEI5mLxemJJ4VOyqpceq5ZtcSjy/Lv/nIvlHrI7WJ0dJ6pGqMAtvFSAisY2xBmxEA0GSQhwI/3tPInxuT4Fvx1ig3YFLLUjcS+iPwoTaeEKPmxoyEARVIOUnDU1EKWb+dM5Vp/E4ofnidrLJQKYK9Fg2YmKt8FvIUK0jj6Z5AQfWoPfAniCMpgHjaXiJzP8xyDWPTgclcvV/01STIPdWP7ZPhFY7cVRZjYPyOa8HuD3cF3JGp1y+jmCbhGkR1xKPhLh7hZxUqmMqIvjSKZKe+AZwOJwoulWVBb9fpl6k0pOfZ+QB/Tz2RfEakYigSpTbR8woq81nZSZNcXgpXWhqQgyKj9IZhCKR0ymcg7bHYIft41zhgIDQjoMJRrjKks8JkueU4gb81BV8PJXL7jPQTom197ELSq72Vi2G2VCJnf9Wz6g18kLhyXvvRvSw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199018)(82960400001)(38100700002)(2906002)(8936002)(5660300002)(41300700001)(31696002)(86362001)(36756003)(6486002)(83380400001)(6666004)(54906003)(478600001)(26005)(186003)(2616005)(6512007)(6506007)(53546011)(31686004)(66946007)(66476007)(66556008)(6916009)(4326008)(8676002)(316002)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVZocEdLMk15VUdyd21OaHRBNWV1NDVOUGhOK2ZwV2ZrakRqK21SZlVqVUox?=
 =?utf-8?B?dHNMS3YwL3Q3eDRoNEhhU1hqL094TDRIcXBKVlNiYWluMkJMRFVxZXJKUXdi?=
 =?utf-8?B?QThoMDFBRHoySjFkYkhOZ0krV3lUUFBlQlVtN0dxNzBZbjliL3lWTmZTZ3Bk?=
 =?utf-8?B?TENiYS9pSzhnNWpjUjdNZTFvZEtEQ01GbHU1NFJoTEJkS041N3hUM3JJZG1Z?=
 =?utf-8?B?OXVYOUFkTXJUdzBzR0R6VlN5ckFQd2RIdm5vaUJMTmkxZXRFRTZrekwrVnZD?=
 =?utf-8?B?RlIrTUdyN1JXNEJrdHV2dVo4TWJZOFlvY1FkQmpvRXNtbFJhc0tadllNNjRT?=
 =?utf-8?B?YVhiMzNDYkRUM1dzUTY1cHFCb3NMdVNuZnVWc2dEOVVVYlRyckNOM3BDM2x1?=
 =?utf-8?B?bG9JRExHajBSTW91NDFnbnB0V2VBRWFRNnVVREVFT2FVL1hueGRidG5FL25s?=
 =?utf-8?B?SFhzTU8zOFU3aUJBOGVFTW5wVCtLdFJnYllZbUY5enNYQm0yRldiMncvT1p4?=
 =?utf-8?B?SXlHWkgvQ2pSNi9uZGQ1UUFiWkhwY3RDVTFZOHVteGlxZUUxdG9PNDczc1hS?=
 =?utf-8?B?QkplRmhxZjk0K1Z6a3R0M3ZwWkRVcDRMdGM2cmtlaFdoc3h5T1pMSDg1ZUhu?=
 =?utf-8?B?Z0RkN3p3R2RMK095VE1aMldsUWhkeFZYVGNsaEorcG1mYkR4bjBsQW82Y0Vv?=
 =?utf-8?B?WFZ6amdjc0p6eTBZOG5wcjZvL1hjS3ZQYmVtYjhYMWR6cG5iLzhsb1NSTXVv?=
 =?utf-8?B?YkVtZkhYQkFFd1lELzdRZG1LYjUzT0t2dEkvOHcwY3M0Q3ZaWFdaR0ZJYUdK?=
 =?utf-8?B?TkJRTjhqMHdKdGx2T3lXUVN0ejIzWWdnK0lxQVhTS3gxN2hPWkhLMk5Vc2tl?=
 =?utf-8?B?REl0TjlWSFZZY0RCS0RPYjJNbWt4cXhVbHhjTjBKUmZUUk05ckhoSnFRcnIw?=
 =?utf-8?B?OHJiS2ljcGJpR3FSZEIveFF5bnd6NjFtQkZSUVJlYmIwNlRHTnZRcVJYSE5v?=
 =?utf-8?B?TmJBT2xwbDJuYnpuZURTOUY5Q2dzWmgxSmtPcFZuT054MFQxYWxKZzdBLzg2?=
 =?utf-8?B?YzZiYW5tcDIxVXV0UDluMkM3RngzMy9VYlZ5RElvRXJ4S2IrenVSUWtxeUVT?=
 =?utf-8?B?eC9MSkVlditTYlZPWkpMSXFvaXlvTmtjeHYxSmROWlQ2a2NMempYdy9GWmxT?=
 =?utf-8?B?d1h5S3FXWnpXczFhanEzN1ZUUDBkS2dNUzlmUlkyaTUvOEdiT0FhLzYvK1c1?=
 =?utf-8?B?L1NRRmcvRGlJL3p3S1dGSEFPeldqRERWMnhQMHpDcmRRZEZ1K1p4S3k2amZO?=
 =?utf-8?B?eXpYdkRSMTdzYnBhbHJoQ1pYSnh5VVp4Y0FFSk13SjQ0RjFLNHlFbGVrNGxE?=
 =?utf-8?B?cXd4dWtVbGJjZUhUY01rVU5CNmdnYzdHZGVxcnRHbWZNZGIxdUtOTU5JQXla?=
 =?utf-8?B?U1llRE42RktOd3ZmSHYwamxTdE92bE1uTFBLVVdSZnZlZjU2ck1raDErNG9U?=
 =?utf-8?B?SXUwYXJRRy9vcXhjWEdBU0dZUHVsVHFaSXNQOGFWVkhqeWswMU9iRnlXTkFr?=
 =?utf-8?B?SWp1b0Z1eEdIMVdYUmNTZUxkZEJuMUJaeW84MWFlUFY5RUVtbHJFK05LQnM1?=
 =?utf-8?B?MEpGUi8wNTU3TWpLbGE2N2h3cDk3eGlic1c3QjBEYk05NUpFbjM0MGRQWSto?=
 =?utf-8?B?dWxOUk02b0JJYllnb1VKK1hKcVkxdE14aE0zY3NkSi9ra0NJN1pPTFdseVNz?=
 =?utf-8?B?NTlKUzBLMlcvWDNhMXpSRDdrbEpyL2RVK2lrbXZsM3MwNFdNcjVpbUx6Y2dy?=
 =?utf-8?B?Y01KNDBqL1d4NGZFRkhyV201dXFGQlgrYUt1cnJFTHBzVjB2VEFrcm41em05?=
 =?utf-8?B?c0Q4RDBXNzAwczBVZUFIbERKbGhNZVAxb3J4Z21nNFYwQkgxeEpPOGtDV3pu?=
 =?utf-8?B?TFdxQ29nT0duS2NXbVhXaU4xVk1vVWtWQmtDbUhRSFpWWE1HdU0zMzRlTWR5?=
 =?utf-8?B?TFpSN3Y2OWU5b1UrbUkzeWZZZXFadGpHWHBNcWt2TFFPWUFBQm9MZkh3LzFo?=
 =?utf-8?B?R05SQ1J5eDJ5R25TQ1pKcUM3QjV3WUtUcU9mMG4xdFlSaTI0b3Nxb1RNalAy?=
 =?utf-8?B?U1ZLK3JhTGQza0taNVpGN0pZd3EzaWR5MEZlRWhnWlpJaklHTXRpYUx1dkFT?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wFmyLiFI+k26AJAcGj1SejPzb36TrhXRbw/e9QL7rzDAqCLYpHtRBVdRqPdGzSPDzKrPWNd7GRB8kxrStaqUT+ln8fyuKZ6Q1YD1otZN0K2Y7T9qaRHGSlQwOpVTo2Vb+F7L9VdHfQ2q7u8GymdU7udwmEmDa9rEvg8GoM8t+pPk+p40JBNBM4viI9IdfbWyLXiOFH/Xo1r+2zD7Iii4sutiZIqYJIHs7SdoRoompfRH83DmYAym1wiHjZHZCtag4cTBzuYDO4HtTR7X4tquWfALqGS4hBut0wAhYpb50LSKW8j9/ZoAqUBl6gPtOHRF9vE1i8H8DFG5Z5GkmkzZ64mfpBowYSSSmKbeXJ1nFBy8b9kFGGAVXgBCmnJW/uAWCjKgAk8/WhJV+OVjVb8MFH+mDrUKX0358b9mKdPSN1FcoiO+nD/mUCuGwoSMwqttbIIPRXRnz/1ia3PD2bcNX6dOnMray6eRF/p6tY7LutOwIh7kdM9sXsse95pqVXxuhMOuZaBCXBWpEQ6oTLIzEuo3YqQuU51tmptUdlF7jVfqwhW9FuxMpOc440EOC3UqWe2mwagB0CqqSsCX/skf47mLuzzwt8GmI6sXjIx40IqtLjrLSOZjrVSUWyUYnGT8C5OwxD9pD2djSJWSWCQa0aRZsW3jaXbk41Kiy6iqAoivtzU+5vmPT7iCd211tOqJnIqJ4DQudMnV2MeaX3C4ZEfM1/3zklUgdyucJiOnJRODD9XBUXiFYZmzgppCtvorBoueCcgmSYkk5PWQtgHWZnzsSuNNxiRphewtbVOb6j84Wl8xbJP+MeZfgYseFeVF
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34d537b-89fd-4ec2-8dfa-08db2c75aab1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 14:40:09.2425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+y2spLa6si41JHfYP0GAMYqMlIzCjCtXM4wkdxvV4faeqs2F8sVg5pmSxOhhN9/lMC4XHGKgFZWHrLddQNWK4bziz7Y3mLzeRrUS7pD6CQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5954

On 06/12/2021 3:21 pm, Jan Beulich wrote:
> On 06.12.2021 16:11, Andrew Cooper wrote:
>> On 06/12/2021 13:58, Jan Beulich wrote:
>>> On 06.12.2021 14:08, Andrew Cooper wrote:
>>>> While we've been diligent to ensure that the main text/data/rodata
>>>> mappings
>>>> have suitable restrictions, their aliases via the directmap were
>>>> left fully
>>>> RW.  Worse, we even had pieces of code making use of this as a
>>>> feature.
>>>>
>>>> Restrict the permissions, as we have no legitimate need for
>>>> writeability of
>>>> these areas via the directmap alias.
>>> Where do we end up reading .text and/or .rodata through the
>>> directmap? Can't
>>> we zap the mappings altogether?
>>
>> I felt it was safer to keep readability via the directmap.
>>
>> I'm not aware of any logic we have which reads the directmap in order,
>> but it ought to be possible.
>
> Could you add a sentence to this effect to this description, please?

Ok.  The commit message a rewrite anyway, given changes to the boot cpu
stack.

>
>>> As to superpage shattering - I understand this is not deemed to be
>>> an issue
>>> in the common case since, with Xen moved as high up below 4G as
>>> possible,
>>> it wouldn't normally live inside a 1G mapping anyway? This may want
>>> calling
>>> out here. Plus, in non-EFI, non-XEN_ALIGN_2M builds isn't this going to
>>> shatter a 2M page at the tail of .rodata?
>>
>> cpu0_stack has already shattered down to 4k, which is likely in the same
>> superpage as rodata in a non-2M build.
>>
>> But at the end of the day, it is a security/performance tradeoff.
>>
>> memcpy(__va(__pa(divide_error)), "\x0f\x0b", 2);
>> asm ("div %ecx" :: "c" (0));
>>
>> is an especially low barrier for an attacker who has a partial write
>> gadget.
>>
>> The security benefits are substantial, and the perf downsides are a
>> handful of extra pagetables, and a handful of pagewalks taking extra
>> steps, in non-fast paths (i.e. distinctly marginal).
>
> How do you easily know what paths there are accessing data on the same
> (potential) superpage? However, thinking about it, with the directmap
> mapping presumably not getting used at all, how the mapping is arranged
> doesn't really matter (except for the extra memory needed, but as you
> say that's probably marginal).

Indeed.  Any path which requires Xen to reach into guest state via the
directmap isn't a fastpath in the first place.

~Andrew

