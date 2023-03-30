Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AA16D0461
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 14:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516689.801225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phr5L-00041a-7k; Thu, 30 Mar 2023 12:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516689.801225; Thu, 30 Mar 2023 12:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phr5L-0003ye-4e; Thu, 30 Mar 2023 12:08:55 +0000
Received: by outflank-mailman (input) for mailman id 516689;
 Thu, 30 Mar 2023 12:08:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVKM=7W=citrix.com=prvs=44691dd15=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phr5I-0003yU-Kn
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 12:08:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fe4297b-cef3-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 14:08:50 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 08:08:37 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB6969.namprd03.prod.outlook.com (2603:10b6:510:12c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Thu, 30 Mar
 2023 12:08:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 12:08:34 +0000
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
X-Inumbo-ID: 9fe4297b-cef3-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680178129;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WbjLea21fFYE/GAxcYB0Z74lz8qagGQjCUVOG6Jto9Y=;
  b=ScDtDvt54BnqPgJyPwB9YxguGwFJiHd3FyN9dt/Qsan22L1ms+MjOJp8
   WjolRBxw7duh2rohVCvtxsCW7BkAobtkeqfngyBvfZ1Xp7DsDxZRA8q14
   rPFJ2RDqoYajTW1qW3vC3/cM1iAuh48qFk5rtizah4hbpkkuplTjOpvBy
   U=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 102471724
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tvn2lqCNd4uERhVW/wTiw5YqxClBgxIJ4kV8jS/XYbTApDsghmMAn
 2dLW2iDafaPNmGjL9h+a4vk9U1U75fRyYQ2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhD5gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw2ugsJmxPx
 9kkJRcxcCuNo7O92e+ZRbw57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDK7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXx3+kAd1ISNVU8NZ1ulyO5VcoIyYtTHCBnPyw2m2dA892f
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBRw1V5dDm+ds3lkiWEYwlF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:Jtki76Bv21Yfl2LlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="102471724"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcI9ShkpbutKDwzE8HCNU1l1P75OsffpFISVIzYPm0dNDuVMTLUdSrN5x0arkcd21LUsHCH0RDRO1AxXoE92fTqGlamg3xpBg7B5WcXHwxFye/WsSg27rMQRQ9771Dh9WSvyDU5dVgA69RJh9V51X/cu/Ju6hiuTUeoB1rkQY4Dsk/5orGjKmR6Yk3Sue35agGNmEQrzo8AVt/DGQj9NZghQzM0OkvzmWEkY+hm8H2EetwOPR9lAN9LM5BXhvr8xavXTYMiZy5+bN3/uI/UwU9daHl1H1JaVKyBqLUwpretOxohgLw8JIqUySPLKWQe4x8SPrCEnIwhsOeR/XX2vbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPm+fUSf7zrx2HT+5FqrMCYov7zaLCvKcAaLlQOHq9U=;
 b=Xukqh311UtmkmrZZdTzWlRaDRJXIfoDJeCfCRL+q8CFaEt2Ar+9e2qMcBj1tixeFpamdi7E5jF5rwV/JOuraW/s9yqma/vK1natee5+Qp/HONUgs8bbGAyQ3hif0qROVDyGkPaLjFDkBQcVXG3yrDKeyPujTvwBL4XXQJL20WTCt8VbnqD1UmHpA/qstVys98HQtzsQufqI77FlPsDvzus3STZjsl5QAMY/HN17nzpjoIqeP5P+Qt3/kwUiXTgsIlrSZg4pchXo/pTVuuw9ooc5NYii/5ha6TWwE289MBL1y9rJlQWvpwxLcsscfREJfgdqRSoBwJzOkS8EUjgufwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPm+fUSf7zrx2HT+5FqrMCYov7zaLCvKcAaLlQOHq9U=;
 b=KwZiEOVzlGRD8jvFK5ILSeh8EEgFZ8yxApqs2nl3+sHjk4Jzg5tWXnG636D8V/KKIF/M6/og4Wt7ZFA/c/kFkTQpN03OPzKKduLiDcIpHrTpR1NnBt37RUkhIYGt8eodnDiiZ3bNhIsVTgpjdzaXWjgyBBzrxqBvnn7pdlc0b6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4bf348ca-60ea-10ba-d0ac-17ca220e8759@citrix.com>
Date: Thu, 30 Mar 2023 13:08:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC 0/9] x86: Merge cpuid and msr policy
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <75fe2fea-1ffc-b23c-373f-10dd21fe53ff@suse.com>
In-Reply-To: <75fe2fea-1ffc-b23c-373f-10dd21fe53ff@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0276.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ad3487-9575-449e-1c0a-08db31177c5c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a4aXGCXeHK9nF+pmH+S2ChBwGB+6tNJ2kCssfkVxY3o8HqE0r264FnQy/AzbtBHUiCA52a3MxHpghuZkFl9p+ecbOG6kourBI3nP1OHN0++/bg7T8A2MD+OlQbAO8v6QrJuL28yJ0G4Zir7kuuPsggNxE3KmKYZd0bOPuOM47LOuOxpQPOWqpd+utZYQRpwAZ97mIKD28ejoMYLv5AH4C9ucAY/0hFXyLa5W9PuT4z4/HJNtcb5in7fitXtOWDHTyJoH2Zea2D/f9kXjXz8VtskfvO0dP+/IjoypmrzcW4FemAlhx5uxsr3J3ezjIjvF0gA3kD8kHRjXLJPMg0UW879t7Y3taE04ZSVkTVG78TBNiI3UqLcoqFSIXJYA8WTYvqwhXvsTUj7B1Z0vcFQIg08HVqwGmX70ZWBBuIlsuuoe8J7QVyQmnA/K20VGfsF+La/6Kts8ZBC/FSwGVmbtiJeK4IQQwK9WMdBhscOmSqmRUFmkdhtRnHIpelO3Y9xy06ZGq6L3Ma/bP2tso3IEcr99ef4ZnqG5FzRRa5NqoYftBKq6bthW7nSGYYmw+IWRjuaDynoVQp+PG5e6FEHbWxUEOVCWzXMGJMLFHXRGX+AkOgHbvMKvMEWz5eHJPe9Sdfoq/XPXD8mjfc8uHY9imw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199021)(6512007)(2906002)(2616005)(6916009)(66946007)(54906003)(8676002)(66476007)(4326008)(478600001)(66556008)(26005)(53546011)(316002)(6506007)(6666004)(186003)(36756003)(38100700002)(31696002)(86362001)(6486002)(82960400001)(5660300002)(41300700001)(31686004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlQvZFBxSlZCZ1hpeStTaDE4TXFpNFN5L2dPVHhpRythaWRvR1NEb1hGQmc3?=
 =?utf-8?B?bVc1SE1hYlJDNXlNWUlSelU5SWRHRWFuTi9CRmNnMmJJeGh0Y1l1RXIzK0Zn?=
 =?utf-8?B?TUdpNDRKbmFYS20yTFpFeGlxZjZkL29aTlR3WnUyQ0xyR1A0MEtqR3JPOStH?=
 =?utf-8?B?dDdLOFAyN1BTbGhLVGljeG4zcFNXOEVkTG5uTVhxMzcwOW5ZZnFDY0plcVR2?=
 =?utf-8?B?RThGRU8yc2N3SFoyUEExM0I0RTdRaW85bkRyQW9WTnYwU0pMWUVBczl3VUhl?=
 =?utf-8?B?UHZySmJmSTVIaStQOEp4ZnVzVDZ6TitjQVJET3RoWlJwUjNGRWxxU0l4Y0s5?=
 =?utf-8?B?L2tnNmFrTkdnNGNoOHVpNTZiV2IzUFhNaXVHR25rZERSSkY5dndHa2psOHlJ?=
 =?utf-8?B?by91enFwREo2RmxQTmxMQzErTkorazkyQzlmQzNsdTd3TXh3L2dJQjlRR2tO?=
 =?utf-8?B?aVoyWGY2a0xhOWQ2L1FFNWVFelNmcnZEWlE1Q2ZSWTgwd1M5MzI1cVUxa1Aw?=
 =?utf-8?B?ZEJJbzNNeWJwN0pSWHV5cGZndkdlRm5XeVRvV3JnMFRJRmJraWs0MTdjbXF6?=
 =?utf-8?B?RlRvSHU4SG5VQngyQTV6Mkd5SFN6azE2d0xHbGtMMVhWOFdnRDlvZU93L2Q2?=
 =?utf-8?B?T2NydWcwN0huNk9nSlZJbVVKN0RwNVVnUGxLcTd4RTM1ZVVtWmVyUWllN3hl?=
 =?utf-8?B?ZkI0a2xVZVZYUFU1WWhBM3FpdjRNNjFKUDg4QzNMY2p2bGd6eFc4bzNOOUZZ?=
 =?utf-8?B?NVI3ZnQ5YThXb3lhUW1aVTd4MWxXWmxHbDNqV3NDZythNXQxRW9VZlZmSyth?=
 =?utf-8?B?Z1IrNE5acWpMaWtTemNBV085KzZ1QWtrTXNkNTRxeTVOQlJGRTBFanlZVTI5?=
 =?utf-8?B?ZjBDQ1dTUXVVUXJqb2VqTWF3dUlGWEFzMDQrOTNaUFRuU3YvUlN0VVo3QTZY?=
 =?utf-8?B?SzR5RGZpamN1SGg3UWQ2L25uU1ZuN2NWamJJR0RvNlBEWGJRdVFJZmJyVE1L?=
 =?utf-8?B?U0hScG0xWUxvQTZ2OTNraU96L1R2SmxiSkU0V2VYcUR2bndpUFdKSVY2dmJ2?=
 =?utf-8?B?RVYrK1hncjdIdjJiTW83UXczUE4xcW9vNmM5MjBlejRvSHpBQnBuNlM3Tjgx?=
 =?utf-8?B?WkNtUzRsSUF3QnhUZFNiNXJNMkdjZ29DSE1EMk15MEdwMXM0N1FReDlOR3dS?=
 =?utf-8?B?MVNDbHN1OC9jZ29xSnE5RlRmTG55dTJhSWZERUdDT3pYeGVjS3FkZ1NJZHpT?=
 =?utf-8?B?dTNMcnRUY0EvckdDS2d0V1BZWXk1WHVNZkdtQmlwemNlbmdCbmZhcjdVRXZB?=
 =?utf-8?B?Ly81UjQrWXNWQ29OcC9YMC9UbExzaHB4WUZpc1NCNmdkMXFrZDg5cGg3RXNl?=
 =?utf-8?B?aXQwUWNrU2VoempxaytQVWFoY2xoa3RmOGlEclpYL1ZnYkhtVDZkbjNON0tR?=
 =?utf-8?B?MDRXNE9Ia1pHZ3pOSXBubFMwbWlLM0JRL202U3ZCWGdsSm1samNXTEtFTVM2?=
 =?utf-8?B?QVJwWkllSzJ5WnJ3U1hQUU1PTm1oRUFrOVNzUVZTTzcxZGt2djRhNXFUVUtB?=
 =?utf-8?B?RHM4eVA2YUpkWWdRVENOOCs0cFJGSyt3cEs0dE04QjRiMUJCL3Rmci83RkNq?=
 =?utf-8?B?cjljcGtKUi9wOWRLSlU4dWtvNEJ1Z2FLc1hxSXkzc3hXYzNsU1FPUm1CaHcw?=
 =?utf-8?B?NS90TmRVWHYxOWRMZ1BPT1lqZGJRNnJaNHNNclJLYWhzaXZXZ0ZBRFUzbmE4?=
 =?utf-8?B?dWxiOHdIZ2tRYlM1T0ZERTVGazdaYVZSNTQrUFJkM1FsNGlYSmNqS21id3p4?=
 =?utf-8?B?YmRaTy9tMW1yRDhReFJaVGRhVzM0NlduQ2VZR3pHZ1pueC94YUZyUmx6aExN?=
 =?utf-8?B?emxGcmZkOTdHdkJuVWZZbkduWkxhWXh0RWV4Q091VmhLOE4zUnNRWm5FL2lY?=
 =?utf-8?B?SVZLR1lZRkZzM3pnbUx6NDRDdGtTUkxWbVVmN0hObi9ORUNRK0ZpY1NyUFI0?=
 =?utf-8?B?dXRBbkZWc0JMazJqVFVMc3ZiaVdBa1FhR0xrWnRDMXVTdStWODJRNHNFVWVt?=
 =?utf-8?B?L0tDdE8zRmJWYWtWSCtvVmJRY0g1eEo2VVpobCtCNnEwdE9DT2xidUsrYmlx?=
 =?utf-8?B?N2VNbDBubzh2eXFOOGZnUnBUbGJjaGFDSmpFc0tyYTI1eXc0RVhFVHhrU1pP?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	//mVpIN818BnbkEonNrPwMEKRXTocDe6Lit5gJxRw2mA3kkv/L3HggqZw0zNRj8vBpayuEogQekkn3GsvwUj8SYVytxs4YXp7OK9bgUsCJ/VxbBrSu9+nXrb54nqXRbt+RD1+1ORXe0nSVZetX50JrcPCbAbcpzAGhFgVy/wExjhCVGtbzmeVBSIAX1ELox+x/GjlJMHxgGvMXmPUo/dVfGjKXUj166aZGAN+9Cgdh186HswSSm6cnwuZn/8id+lKmcURKVdZvgENkGmeKPE22qzLBBZvVvHwg9AIiPgRLqPN9ONaT/dpCg39YtHuiJ7ipCmWLMaKZuFVi+y5i+nTftLc5MOR8AWoIL1u/Jt4Ft9gtpXhEtUdvrZihqAuyAyklzAqF6DL48iLhNWzIYi2LJtm77Qj7GGNg8YUzWd0Ni56h1w4/NtaceNtcAGIFPeOLmxoCI5qCcoG3GPeu4cyeBoHBGkgw23VhtarVoxxZ6hAIHPTlPLNHMgGGI+OPUhNAVrCCk9yqHBA+dnrjKR7vK8sPsrd4bBEKZu2ieAwc/QBSABp8brgBKKNyg6Cei6zK2n9rEr4GFKw8C0f+7L6tNvQhCxmLwBmN1eSJys5yK53J4EIuSEBlmOR0DAy2S2YB7x1uquh1A3BH4jdhaDkpJVS6kB+S/+4DJaMFaTZFaBUxi9x6nq/FepnL9KpM/sKQoTz+6w0I+7vjzUz8jiK1xYCPofpfjJMuwYDYBAOgFG2K2bADLggDAXCkYJCa7EHJ5Vly/45TDMF+f0BifjqcLQGIa1QfZ+JqpOCtARGv6yrTC5/8vHpYsL9s12eUMFPfnBXqN92yMqx5/UFaVyqQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ad3487-9575-449e-1c0a-08db31177c5c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 12:08:34.6089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROLCx43fuDzmqvK4d/4k+gz5pykrwMOIzNBi2L90chFgAHD4FgLf+qaahIN6zZHjqBibfjzcj5yFc2uM07dJYPqxQMlhC5KhVu5WWD8057o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6969

On 30/03/2023 11:18 am, Jan Beulich wrote:
> On 29.03.2023 22:51, Andrew Cooper wrote:
>> Andrew Cooper (9):
>>   x86: Rename struct cpu_policy to struct old_cpuid_policy
>>   x86: Rename {domctl,sysctl}.cpu_policy.{cpuid,msr_policy} fields
> Nit: I guess the last closing brace wants moving forward a little.

Oops yes.

>>   x86: Rename struct cpuid_policy to struct cpu_policy
>>   x86: Merge struct msr_policy into struct cpu_policy
>>   x86: Merge the system {cpuid,msr} policy objects
>>   x86: Merge a domain's {cpuid,msr} policy objects
>>   x86: Merge xc_cpu_policy's cpuid and msr objects
>>   x86: Drop struct old_cpu_policy
> With the small comments on individual patches taken care of one way or
> another, up to here:
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.  I'll fold this in on these patches, but I don't intend to
commit anything until I've got the full series together.

Right now there's still a lot of shuffling of minor things (comments)
between patches, and not-so-minor things (deciding to split things
differently).

~Andrew

