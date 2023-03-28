Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA12D6CC18B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515877.799183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9q8-0003mk-VW; Tue, 28 Mar 2023 13:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515877.799183; Tue, 28 Mar 2023 13:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9q8-0003kj-Sh; Tue, 28 Mar 2023 13:58:20 +0000
Received: by outflank-mailman (input) for mailman id 515877;
 Tue, 28 Mar 2023 13:58:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UojI=7U=citrix.com=prvs=444182d81=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ph9q6-0003kR-Li
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:58:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9172e7d7-cd70-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 15:58:15 +0200 (CEST)
Received: from mail-dm3nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 09:57:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5289.namprd03.prod.outlook.com (2603:10b6:5:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 13:57:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 13:57:57 +0000
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
X-Inumbo-ID: 9172e7d7-cd70-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680011895;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=k7k7NuRV5ZjnSIvUj+MJbGfjGfDJ5vttmoAbJQ1o/lY=;
  b=JwU0fH+Et32o23SeSO5VGMRh3/708V+qIYh2nobk0wJbr//19KTfVB00
   XSsZt9WjZ8XSosHoMmwSPzAW45X9Fix8Ad/c6TL3bwwbAKR/oP16zvhJI
   S80IAc7+Tql/SpwpkZ6wwwUp5GEVJ7pd7p34n9BP/mP8wswN8yCWW+ii7
   c=;
X-IronPort-RemoteIP: 104.47.56.43
X-IronPort-MID: 105771565
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gJOTFKqdJdIdhN3h4rlTdcjNZHReBmIpZBIvgKrLsJaIsI4StFCzt
 garIBmPaPmNZmHyetFwaNu28E1VupDTytVhGwdopSlmEisX85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzSlNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGoxYh2frM+Q+YiQFOZBj+QcPsfJZKpK7xmMzRmBZRonabbqZv2QoPN9h3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearbIG9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgq6E12QDNmwT/DjUPXnmZp8Ogl3eiXpF8E
 1UJ5gAngqwboRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ21
 1qhj97vQzt1v9W9WX+bs7uZsz62ESwUNnMZIz8JSxMf5Nvuq511iQjAJuuPC4awh9zxXD31m
 DaDqXBkg61J1ZJQkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshUZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:/e3PUa6IZ3sFLjSK0wPXwA/XdLJyesId70hD6qhwISYlFPBw9v
 rPoB1/73TJYVkqOU3I9erwXZVoIkmsjKKdg7NhRYtKNTOO0ATHEGgL1/qY/9SKIVybygcy79
 YGT4FOTPDLIBxdq+2S2mWF+tAbquWvweSTqd2b5VFLYiFFV5pJ0ideLUKgPnAefngkObMJUJ
 Wd48ZcpymtYx0sA/iTDGUeQu7Gq8bqufvdEHw7OyI=
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="105771565"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izn0JYV0M0148WPEOH4hmLICUkECxzT0GaOs3nZvw9ExFqW+MZmtY8rmsg/N4oxEFL5qmiTdaqhJD00jPN3JrdOExUMVjm7dqJFR09MaC+2UUh0Ad9M0eRfYFN8i96vN0J4bsvdV2JIdh1R2tZHb+ptv6cYErgTUEJMRkR+bW/tfDaammuHFhDPH0hmF5MUJKzNOCykAw93UZHFEYUvcBOoUXRPpJfLl2NUJwFX5HLIv17c7stWW4dge3bcJ+5O++YB9t0MMoxDZ+gRBWxipqOGw1mgMRABJx5HsP3k+aO1i5E+ivsVuRS8Xa4vJLZX8DSheLu1sGgZMbyXE3WxEMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbCikyANWzYPrnlxVeMzdao1CjUOcM/u5LBLhCFDbwE=;
 b=GzToB6KCbtnTXVpzxFmehBOXoLGtA+Mf7L+HuUi2GtJOu2WhDxp9Y7zrzCdUDJ+/2jrATHMW/V5/u0xn27ZQ4eFSS1OiMoiyP0JTEgcD4xxhAiiscKQTioXmZ8X2lrKuQCKWz0GLXxhoUGtUnY1MvOxrSDuLNwa4cF6DKbrNjRD8T//qVnLS9nPd9AqXl2XwglQGVimST0czQMdTKXgX2O4vXZQ00EJyi5ceL+TZUEo7iNcgsXvL+j4CjJn/v5AnCQ8FdmHfupohsuIJj4MtDj9leUyPRlbs67SR8vyk+LQJU7Ww+pjNOYlpOCVkfE0IRSfty5cnR+FwnmWQvNKpDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbCikyANWzYPrnlxVeMzdao1CjUOcM/u5LBLhCFDbwE=;
 b=gHsm3qsCMmkMVBLgw3a7TPM7K1Q0WeUGOBgy19yQZTcWpdcKX3MY8Dl68Dn3faPKZomOM1qJePTyGw5EwMXIpnHxnPYQb/0IHFoliddjbmj/2NPuGHCwIun7vRA0kvLwKAPrQik9vJ4S3IGRx/Kdi84Rd7ie2Tt2k+RNzCSYG/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <68c0196a-966e-8d87-52ae-367b3c05d107@citrix.com>
Date: Tue, 28 Mar 2023 14:57:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 11/16] x86/shadow: drop is_hvm_...() where easily possible
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <5944a3ea-cddf-7ddb-d167-a0a0aa9b4967@suse.com>
 <97c3fe74-89f3-fd26-f8bf-69113df1dc12@citrix.com>
 <2f148fc2-04c4-5411-2931-8dde4ed9bc97@suse.com>
In-Reply-To: <2f148fc2-04c4-5411-2931-8dde4ed9bc97@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0060.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: a5fe9542-8a84-422c-c007-08db2f946f37
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hSVOaZBZJ/1zl1x0v55wPmAlEc7mGgFsfF0HTqiDnx4vm4bjSJE2m5+tP9MWGa7LjO2Z0tNAWeAyDib9ReqZ05bmPHEtq62PICBwpjTJy2aTbfGel+SLDcCHd1UQsjAdOSIZ1EuUJxVeOsU6qiOBoZDQkxuqLYszglkaFbv5mjBa/R9fepnnpzAZUv+xfoHW1NzlbiDD8hyQ/FTffP7GGHd6KP28ZQuqYQsLhFN6eoe5i1kz9PbjTZr7TnQaCbrSb/NLLAL4OAgQKZl/NLxTTfCTOew7bmccC/XH1W+RfqNWJq6mptfV/J2CGbvzK/4H0sO1i6hsF3MvC5joLpFUU2RZJMysIGqUvDYAGXmPQbB70IvBAOfKcFeut4Z+dE7S6kUVUQaDH4tubTnCUl+JSpey/GYHasTyYjCVuu0CQj5FQC0Y0trnTGjTh3+3/sDqroX8pd1fTv8kTFsOjge6ePAwknr+RdteHyu0VV6/8slIX06IHa3QlWCFl3vMpCAueWjDTxiieT54YXUhGGHvorY2cqTuJ4DtzA0orcpuXbk5R58Nv1DYrFJdXmkcSAxSIP6MKUF2g+3hE5KfinwDoaLCnJm8SbYX2/zpUhywf8/lveYtjmKgri36ob+zSmqugJovDFsVvZVxIpRyV+oLZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(53546011)(26005)(6512007)(6506007)(41300700001)(186003)(6666004)(6486002)(83380400001)(2616005)(31686004)(478600001)(54906003)(316002)(38100700002)(4326008)(66476007)(66946007)(66556008)(8676002)(6916009)(2906002)(31696002)(36756003)(86362001)(82960400001)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QW51Qm9sMXpOOXRwaFBBdFBjM1hJUlN5eGVjdlJDTHNjT1JhRksrZEFtcC9q?=
 =?utf-8?B?eUFrS2ZkOTdMUEVJY2tMR0Q4cnMzNmpQWEEwWXYrdDRiMHVuOUZObThqUXFS?=
 =?utf-8?B?NU5jRkQyc0ZjejBreFNTN0NYOWtPdTdGRU1XeHNnQ3RiMGF0M0pXVTlDVGEy?=
 =?utf-8?B?NEJTeEkxd3g5L0dJbU1wUlU5emtqRXQrMVJqN0pMbWhFKzNhRXB1SGd5eFFM?=
 =?utf-8?B?K3pudlFxUDYvdW0vWVA0TkNZK3FHZTBjcHlsTE9HdzRZZE55WVhGZnJleHZV?=
 =?utf-8?B?MnJWTFJ6WWwrcEVqd2JOMUMrQnNnRUpKNmJhQ0lPVisyajJTcFdQb3UyV1du?=
 =?utf-8?B?N1VWYkZ5MVBwRHpuTVR5YXBITUQzMDhaNm9TT2tGRXlNblVUSlptNjVMM05u?=
 =?utf-8?B?cWQ4ZlcxQmJrU3FlQUREeEtRNmdkVlkrc1BHRU92VE9kQlp4UUp5TUFCVWtE?=
 =?utf-8?B?b2ZTSXVKVnFZdG5rcldnUHRVajdscmtjV1JhbUpieVByanZRTFRkaWNCdnZi?=
 =?utf-8?B?U3BibmNONFA4OG5rZUt3TUg1MWFna1dZaWJKVy9BS0pmazBQdDBKaHo3ejR2?=
 =?utf-8?B?eDVwRGlOR2dLK3lQYmxwa0gvVDRmMzJVYURuQmNSRmJEcUJaN3ZOZ3l0ZTZh?=
 =?utf-8?B?NXNuZzBUZWYxRExtaXJxWlBKYk00ZklkeU03cGZFUFVTOGw5bTZoK1RGZzMy?=
 =?utf-8?B?WFc4WjRrVmI0bitRcWZiY05CZngyNS8zYjZIbWFWKzJpRjBjSDFLUGtDNjd4?=
 =?utf-8?B?cWJrZzdwdHpoOVhBbVlZYUZKSnRpVWJGUW1XbGNFaDZMVVZDVnVMb0hNUUoz?=
 =?utf-8?B?VSsvMk85ek9BZnZTRmdscGErcGNCZUVMZHFSQjI5MEI3N3lZOWU4Uk1paWcy?=
 =?utf-8?B?MHhWQmpROE9EL3JSNlZwY3pTTzdRcEZweEVDYytVMnFwek5NS2FjbzJhTTlq?=
 =?utf-8?B?dDFzUlZBYjJyb05SNHRVelZyOElYNWp6Z2ZKeHB0R2FWUUNOcm5lbFRpTlJM?=
 =?utf-8?B?WS9BeTQ5SHhpNFh6WGNwQm1teitCc0JJOURwU0FrcXRTWEZ4TFZvWGZBY3Bj?=
 =?utf-8?B?RWRMV3M4dUhVV3ZjMEszRys0Nk5GZk83MWVNS2JobHR6WTFkYnVZTi9IUVZk?=
 =?utf-8?B?VzJqMkJhbnZLa3hHZzcrZWNDS0toYXRTKzZ5My9Hem9rVHUycWExbFppSml2?=
 =?utf-8?B?NUZ0b3phVWZMWEh0dFBja1M0MVIzS2ZhK1JKeGxzbnI4b0xDTGJlSkxKOUZM?=
 =?utf-8?B?Y1BVVTBQamF2NEUxN1dPc1dwOFFIa1NjS05neGkyRmVWUmlYdW53aWMvRVhl?=
 =?utf-8?B?ZWFKTy9iWFNVc3lVL2RxS0VsTjI0WkxWSVNlTzMxbk1EVkU0bzlYRmp1QkRQ?=
 =?utf-8?B?dCtCUkJ4a0tyRkhtMWFRY1JnN1hObHFiTTdQTEhVdzRxVnNFY0J3dkRRRFZj?=
 =?utf-8?B?ajBmN0c5Z0pPMk1IWDJFOWZndUJ2OFhidGU2UWluOWJpbEhjZ3RsRXBXU0Ex?=
 =?utf-8?B?Wm9TWENiZk5rQlFEcHBpQkNHT2Z2QlIzWEduREVSNVFYUDdCMmp1cW4zOWpH?=
 =?utf-8?B?YVIwb01RN3VoMmRrbUpMTFdnY2VJMGRwODhEbTNGaXFNaXFVUEpVZW1SWjFu?=
 =?utf-8?B?ZXVVdyt6bldNanU1WFF2SUFRSVFKM04vb3J4MzVkOXBRNk1Zc1o5OEllaWVp?=
 =?utf-8?B?VXZjL0FqbXh4OUxzSmo3RityZERnVUV2Q0RpUXYwdWlyRWV0Rlpkbkt4SXF0?=
 =?utf-8?B?NGhKaWwvamd0M09SL3JuRlB0WGRHem1KY2pZZ0djTTNlY0NOaUNuVWJRelN5?=
 =?utf-8?B?YzBJOTVhTHNqVUd2aGkxV1dJYXVNV1pxUHA1WGVpeUsvRkFWNlZDTkEzYzd4?=
 =?utf-8?B?V3hTclFYSkZOQmxMQ21WWFcxQlJzZitpWjlZb1RyUjNnV2c1RUFOdUdRc3hr?=
 =?utf-8?B?czhEakRaWjdsUXdJTkZVVWE3MWRaWlNrVGdOOXJSdlcyZVJXUEJaNTZCWmVx?=
 =?utf-8?B?dzJTUWIvcWFTeDdOUmR6RlVxT056UzFUZDdOR0ZIc2QrZ0dwbWRnR1dMOEJy?=
 =?utf-8?B?UUZyUVZxRUJheXZYMm9Lc1VvSTlyM1IrTG14djJ0aVFPUUFHbTJwaGREazFm?=
 =?utf-8?B?Mi9ObnhEcVlZM21QemV3M0lGNGpreWNyK09qSTYzQkxkcE8zVEl4MURzVTNS?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b0Sh4SGCA6Csi+tqxvozYv+4zuFbX9TCRu1s+alf/SoJCBSjHxcldxqexUni5kr86CVPPnWkoIvrDuVqd9ykprheAXIRDiIDqa6cTtSkEpFvtTqcEDO0uVLY+gIx6Fqg5+ZmLolPAeulYnVHvzLYjaLyvboXYsPlFArEZayQ891JCVNMH8Z9rYP1Bp3aubmvi5T0PkvVSJi8oUmIqAMNKq9aWSNpSckTKqCyh/8v4Atrq8P0hc70N6jLj//ymGBPx6QTCpVld2OR0jWeF1gEDhee5qn4f8IykIDEIap7Jru8UfLnuRvyMkn3dHS/Ly/8r5ZceqbUAqFRvr1UoXBZ2iIJsEXK1izp7qCNsUQTJ+MQ4hrg02ZVjRZnHjxQ/4PyD/rCdmenUg+wTGhj8SJ1SUp3Jo9/HfZ1VxMDr2VQNedADuzD5GTGabke0UswoayPxsG/ynZgWlkdnUzzKuqUmoyKj+Y+VqMQPx3J1+ofmBfDbk0D+A5gJNbm+ZOrctnuHeD8GSlzrkdRImwPZKEFuZliYgr87sfmfgYU21eKyzPjX8WuH0I4PFmA/vhTttpf9mJvbuKkBEWSj29zicdB0UtD7l1swYZH1WLLgD/TKDrAoKm4xiyT67MOLkd1GN5q7ewJ6MN9fLvvXDKNjKmxWENbmGtOp+xiBj+PBsl8uflwmWitLg9pxlc7aXwDM3qkhLevejDSEcSpzVIr9SBBDjhUhXMFbNad/VN8M6Fm+e+KAKPqRudRzj0J+W6HZHTiZe3vWqx0/k1IUHPaAOygHVSdeFtHXl/5A9KnIztWEgUA7TCeQGQ8/9RLTxSMks1+
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fe9542-8a84-422c-c007-08db2f946f37
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 13:57:57.3523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsScuQuzA/jx9iy2tV5e1KyElYYCUkg6483ViHRORBE7+plq0wjbwGUBZYAc7YxVhiMBuf0XuHcc7wiJzkkhyR7igt3hQv17GCR7lYCVVos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289

On 24/03/2023 7:38 am, Jan Beulich wrote:
> On 23.03.2023 19:18, Andrew Cooper wrote:
>> On 22/03/2023 9:35 am, Jan Beulich wrote:
>>> Emulation related functions are involved in HVM handling only, and in
>>> some cases they even invoke such checks after having already done things
>>> which are valid for HVM domains only. OOS active also implies HVM. In
>>> sh_remove_all_mappings() one of the two checks is redundant with an
>>> earlier paging_mode_external() one (the other, however, needs to stay).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/x86/mm/shadow/common.c
>>> +++ b/xen/arch/x86/mm/shadow/common.c
>>> @@ -1522,7 +1522,7 @@ int sh_remove_all_mappings(struct domain
>>>                 && (page->count_info & PGC_count_mask) <= 3
>>>                 && ((page->u.inuse.type_info & PGT_count_mask)
>>>                     == (is_special_page(page) ||
>>> -                       (is_hvm_domain(d) && is_ioreq_server_page(d, page))))) )
>>> +                       is_ioreq_server_page(d, page)))) )
>>>              printk(XENLOG_G_ERR "can't find all mappings of mfn %"PRI_mfn
>>>                     " (gfn %"PRI_gfn"): c=%lx t=%lx s=%d i=%d\n",
>>>                     mfn_x(gmfn), gfn_x(gfn),
>> Out of context here needs an equivalent adjustment.
> I'm afraid I don't seen any further is_hvm_*() in this function.

Final parameter to the printk(), calculating the i=%d diagnostic.

>> But in this case, I'm not sure the commit message covers the relevant
>> details.  ioreq servers have been made fully common since this code was
>> written, and *that* is a better reason for dropping the predicates IMO
>> than the redundancy with paging_mode_external().
> How does "fully common" matter? It's still a HVM-only thing,

ioreq server info used to be in d->arch.hvm.ioreq.

The is_hvm_domain() was guarding against speculative type confusion in
the HVM union, and should have been removed by the ARM work that made it
common.

This isn't really related to the outer paging_mode_external().

>> That said...  I'm not sure the logic here is correct any more.  It used
>> to be the case that ioreq pages were in the p2m, but they're outside of
>> the p2m these days, so don't see how there can be any interaction with
>> unexpected refcounts any more.
>>
>> I suspect that one way or another, this change wants to be in a separate
>> patch.
> I think that if there are further adjustments to make (like dropping
> is_ioreq_server_page() altogether, as you appear to suggest), that would
> want to be in a separate patch, but the change as done fully fits the
> given justification. (Of course in such a patch both _could_ also be
> dropped at the same time.)

I'd still suggest doing it all separately.  It's sufficiently unrelated
to the justification for the other hunks of the patch.

>>> --- a/xen/arch/x86/mm/shadow/oos.c
>>> +++ b/xen/arch/x86/mm/shadow/oos.c
>>> @@ -577,7 +577,6 @@ int sh_unsync(struct vcpu *v, mfn_t gmfn
>>>      if ( pg->shadow_flags &
>>>           ((SHF_page_type_mask & ~SHF_L1_ANY) | SHF_out_of_sync)
>>>           || sh_page_has_multiple_shadows(pg)
>>> -         || !is_hvm_vcpu(v)
>>>           || !v->domain->arch.paging.shadow.oos_active )
>> This is reachable for PV guests as far as I can see.  What am I missing ?
> Well, the footnote in patch 1 ("x86/shadow: fix and improve
> sh_page_has_multiple_shadows()") kind of explains this wrt the safety
> of the sh_page_has_multiple_shadows() use here: Since PV guests can't
> have OOS pages, there's no way SHF_out_of_sync could be set.

Hmm, I suppose.  We enter sh_unsync() directly from a demand write, but
it is only meaningful when OOS is active to begin with.

Although having looked through this, there ought to be an early exit for
oos_active even ahead of the SHADOW_PRINTK(), and the single caller of
this function doesn't check the return value.  (This appears to be a
common theme...)

~Andrew

