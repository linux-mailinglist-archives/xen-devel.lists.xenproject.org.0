Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E972688582
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 18:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488886.757178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNdUH-0006d0-2j; Thu, 02 Feb 2023 17:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488886.757178; Thu, 02 Feb 2023 17:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNdUG-0006aM-Te; Thu, 02 Feb 2023 17:35:04 +0000
Received: by outflank-mailman (input) for mailman id 488886;
 Thu, 02 Feb 2023 17:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LChx=56=citrix.com=prvs=3900541de=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pNdUE-0006aE-Tl
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 17:35:02 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e98dcc94-a31f-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 18:35:00 +0100 (CET)
Received: from mail-dm6nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Feb 2023 12:34:56 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7061.namprd03.prod.outlook.com (2603:10b6:510:2be::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Thu, 2 Feb
 2023 17:34:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6043.038; Thu, 2 Feb 2023
 17:34:52 +0000
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
X-Inumbo-ID: e98dcc94-a31f-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675359299;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D5f/0BLLLKz2PwhTm0VXKvlZl0Q4b67/vLFGb/u45kw=;
  b=JGPk09ip6gmxT4rr8hJdpxZahdtT3Yphk+FG9MW+ruA4EnwNlV5rhnAY
   cZMlDj0TdE/CVvkxBHcBJX669zNNlTndDGYVMmV3fXCmiZ326G6mRmWvU
   aWMGfj0xKsmlz5CDCMX8MJPYMLBdpcrQVOyse4/kUaX2EZgv3prxrdxuy
   0=;
X-IronPort-RemoteIP: 104.47.73.47
X-IronPort-MID: 95820048
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2niN5qpHI4izEx5MUHA9RafSWhJeBmIOZBIvgKrLsJaIsI4StFCzt
 garIBmFMq6OZWDxLt0gbIqx9E0F7cTdm9NkQFc/+3oyFS8W8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzyNNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAA8pTTak186c+ouUbbZygegACeTKOKpK7xmMzRmBZRonabbqZv2WoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+OrbIW9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzlpqQy2AHDroAVIBQaX1W7+NuBs1OzR+57N
 EFP1iEIgbdnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQ10
 neZktWvAiZg2IB5UlqY/7aQ6D+3Zy4cKDdeYTdeFVdapd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2ONo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:obaiMq1I4Ix7IWc9xsUWcgqjBI0kLtp133Aq2lEZdPWaSL3gqy
 nOpoVi6faQslwssR4b6LW90cW7MBHhHNtOkOos1NSZPTUO2lHYSL2KhLGKq1bd8m/FltK1vp
 0QFJSWZueAa2SSTvyX3OB7KbsdKRW8n5xATN2x80tQ
X-IronPort-AV: E=Sophos;i="5.97,268,1669093200"; 
   d="scan'208";a="95820048"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmV5Mi/P4xgv845sOxxf6TpliA6lKHr1fOIakMQGwbtp4ajhBN5Kpa8LPprvUhG18fMpcDFPRCVSaj4Wr6SYmB5icGf41aH6QK358pVgga6Bj035xXAsgAY2IViSMzHd1NqLpDixDGzA+uY5KAg69xZi5x9ODRBP+FNL3vKhASZPGwgc/nUO0yaf60tq5xf3m0QsFQbJGKvp0+NlLsDlulEgGCO59w0MC+1KLUrGbqwKRnbwlWpDoV5GPsX7stkLR49AMzTjoYCJXsQLHrKkyTBfVY+L6FxkEkkykxBwNg5isUyJWvDukZHoz9SSqLXLtJHBnxZ+xV/vI1UA9TIzcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5f/0BLLLKz2PwhTm0VXKvlZl0Q4b67/vLFGb/u45kw=;
 b=P8et/lJfVatSOoDHQ3L5iwac+jqSrfMzsz5eilGY7NxGGYMwQM8+QOhs85qLT4N6bNH2H8GzLUXvKFVc2yj5kr4OOhwENJSwBPpa+mEwYEawbYaHibGfLQR8+UdmCgG7EvHXbCv2SS4PIaBtZ8R95Mb8/IPjeaJ4laQsMcHNB+T8L/CD8Pv3qoSQAqL6rBvBdFEypRheCgkD+2BCmgQbvLAPsB0U9GzmfWsoZyyl2xww9SrW6I8EDrZAggkILggq0VxknecfipksiUzEw4Rt/+kMFljg4cLnOA6aJVH6sINjo0rgsnfS1jnbHJFxNe4RyvrSs8VUjUUajl75VeaSbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5f/0BLLLKz2PwhTm0VXKvlZl0Q4b67/vLFGb/u45kw=;
 b=F12V123AOEY7fg+jobL3VDFnDRkm0QbMmntMPXDA8f7azDIveX1rToQYDIMTTokqg/Sid8cQMP+mq9LVwWoNe8IBhNC07biWIpUgg+ULWbaY7NodmPRYxoV+Eci4q6LNKC8C9eYjU6M474zWY7BBITgp5cEZwAT1e1Zfu0akDjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dc998c29-6f21-b471-82a5-f64a80c0da4e@citrix.com>
Date: Thu, 2 Feb 2023 17:34:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH] tools/xenmon: Fix xenmon.py for with python3.x
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230202171319.285548-1-bernhard.kaindl@citrix.com>
 <3412a0d5-899b-4db8-b6bd-9c532e9f84eb@citrix.com>
In-Reply-To: <3412a0d5-899b-4db8-b6bd-9c532e9f84eb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0040.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::28)
 To BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: 35cf062e-5206-4eeb-adc7-08db0543ca3c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gVluNiM3mdZ61TimdX9HXNKQgp30fJsv688VEGJ6pDWDgRq/sU6I160M1PXXQSmcbiZUpvu40nU4NzvfCfeGryJ0eAIKtTjg/phntT3/YkYzX/HMop+I/mTwNqddyoa67Ty3au6v8r3p2PhK26zhT3MppTjjAyOP4FWgBYnnM42Hy9G1A+ZQDuNZbfLeQDeNloDQS1OyMAjLcEkCcoiYBA2eIF+KSAG8WOBN5EzVZt2cBG/OIspeWblF2x8hgBzcsklbPFgdC4+JRUEcCpVwmjv6Ac+K0f2Ngh7PhVaayPlKKhCmjzvei24vgBkKLn3K8oZ5ZFss0Gm4uiWk9FwaHxnm6F2e3EoGm4LLiaioSzBuJFTyEgeOXayqAx4O2k5K0nn6EkylPDUAN/GGTmN77D1dWmlMH2qJJ9hJrQFWZ3UGVGu+dn9Y5sDhG3yBNFhka/tzPYeucD8DA9XbiCJbwXCuWl0iu/nPjzmZ+hQp7jIZ46zLgNec4fJS0jfTkr/38T1OjtIg6+91/j29DdnlEes6HyTGPzqHvg6kVzKSSWcbjv7piRkghnWYBIC3vY7EyE6VOG3IAxThL8YW+Qq1YbiUNaKbCznqOV3XvZpyQG6bnGMc1r/BGPIKe6GlY3pRjDcXLgy2IAfWu11J727noJCvh1LMSwcKaGqkaz7JC2UER2BStmWm4hpAOUwVGHBoOSef4y928WlHtKoFB/PZ0KieBbbWUZbFrl6oH/746rE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199018)(86362001)(31686004)(2906002)(54906003)(4744005)(82960400001)(83380400001)(8936002)(6512007)(41300700001)(31696002)(36756003)(26005)(478600001)(186003)(53546011)(5660300002)(6666004)(6506007)(107886003)(66476007)(2616005)(4326008)(6486002)(38100700002)(66556008)(66946007)(316002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2t2QkxlOEJGQXlUTDFBNDZpVzJuamlPdkF2THFSaXRoWWJ6em1LTm5SYmlq?=
 =?utf-8?B?OUtZajRYZ1ptaE52Szk0UEtSNGRUWlVtY0J4dTV1YkVpeE5CK205OVRRVWl2?=
 =?utf-8?B?T05FUS95SGZFQjNMY2ZqRFM5Z2ZKWE54YlhLZHFSdmRURm9KUXNWUTNTVXR6?=
 =?utf-8?B?b2RFTEZEeG5MVmlaazg1eURQMVFlb2JiU2N4RmJFaWF1bEphQlE3WENIRU9k?=
 =?utf-8?B?QU9HWjMxbm9lOG5oQlQ3SmhuU25ET1FQUHFVeWgyZ2s3YmhuUmYyNHkrTnNX?=
 =?utf-8?B?OWkxd0lIZVN3aXFCNzREeWpnT0I5cmtNTGZUc2tmT0hvakh6SUc1TzBsNnRv?=
 =?utf-8?B?Vm5KQU1zdmNNTUs3MUErWTdsN3RTd0dWQkNsamNOVEZ1Zms3c3V0Z1MzMDFY?=
 =?utf-8?B?QlUzeUNiMTJ2eEdLUUNXTEJsZkhPRFAyMzFla3ozRzFkcXNrYlI0TGJxNzM2?=
 =?utf-8?B?eFJXb2RZdmdTazNYNGwrSkdBRklhMGs1bnh2QXFleVhlcEUyQVVHdk5IU2pM?=
 =?utf-8?B?K1Vicm91Z2ZEcE1wWVgyQTNXV1B4TjRxbUFqWlVOMytGWGpuRnk3ZHcyYmhp?=
 =?utf-8?B?NmZuTEwwZnBGVzhTUjdaUEhhb1JoTVVlUHpmWStub1M1WFcyTkdwd3psakhm?=
 =?utf-8?B?UC9MRzM2c2JvaWthVkYwV2lZYXc4bmk0WWdpa1UxOGlhanR2Rkx0eTlVbnFS?=
 =?utf-8?B?OUdwNDZXeVp0MHJDaFZidnIvZWtUSVlCR0R3SXVkYmVKalR2QTBJTDVtblY4?=
 =?utf-8?B?RHJJYWkrSmYzV0FhQ214Vzh0b0dadlErVG1ncTlFRGp3aHRIOUVhWlRldFlB?=
 =?utf-8?B?Si9wUVh6NmNMbFRNWHUvWkJQblNDNThqWG50eFpkMy8zMmRrR09DMk16OUlX?=
 =?utf-8?B?VEFxSC9JWFovRGxLZC84SUpNOENPV2ZTcEI1TnJYa0JYYW53Y3BXOTBjWG83?=
 =?utf-8?B?K1QwU0RuTlpKenpaM0FEeTVOTVp3WkdvQ0Z4SG1ZSjZlSlVOL20vVXl5a01s?=
 =?utf-8?B?ZkVUUE4rRnJIZnRLRkxPTnIzQ1M5M01aWTgrWHl1bUM4ZGZSb29GaTBTWVY4?=
 =?utf-8?B?djFDYkswZWVoYkViSGhzQ09ENXZXMFVMR2RPNjcrOTRIZUtsM3VmcUtzcHJB?=
 =?utf-8?B?OW5XRlVFMmRCNzZJdzdiVzM3VTh1QlVhNWQwRktITDI3S3BVNXdENjMrbEE5?=
 =?utf-8?B?WVVwWkl1RlEyanhmTDF4dGJ0a1pBVTFHTzR1eFc2STc0MytrRERLUWhMSHBr?=
 =?utf-8?B?RUloYm5QalFyLzVSUnlBRkJaVWttbWdYc0gxd2RTS3kyaVFkbldDcGJCbU1Q?=
 =?utf-8?B?Wjg1YW8rWFU1cHRtclJBdTNsQ3J6V05DTFZMZGVIMmV6SWFMOEMzUVpnenpN?=
 =?utf-8?B?MWJZek52QkM1YXVEQzdYNzAwREp3T0hxaWF6aUd0ZFZ4MWhDZEtEd0Q0QnhS?=
 =?utf-8?B?d0d0b1g4OVpjR3k0QS9RS2dpQW40N21kWjdjZXRjeGJKUTZRbnRPM1BRMkhD?=
 =?utf-8?B?SEpESWxuMlJlek9UdnpkZEMzQkE0dWlyNlk5MGVBMmpkZkMvZW1IUmQwcFJ4?=
 =?utf-8?B?N05CNWMzdHpZKzA0WUtSSC9TRVRkZVhNU0ZGUllWYUgxYktBblFXbHUxeDdr?=
 =?utf-8?B?NllEa1U5M29WdlVabFdHMkYwaGloSm5iTitiS2FKK1l0ckwrVHZML2o3a1Vh?=
 =?utf-8?B?Q09JN2hzOXB1VTNTK0xRbXRqSkhISVRTbitnTGpvb1ZuZktRVVRyUkM3VEQv?=
 =?utf-8?B?T1JvRWU5MzFXbFBTTSsxVm5MUWVaK0VCK29hZU5pUmRQak84NDJYU2U5Wkxr?=
 =?utf-8?B?RVNJNlBDbTRsRFR0VGsxSkpxcEU3R0dQN2VnU1BBaFg5SWtIb3dBVEN2N0pL?=
 =?utf-8?B?WmhtMjN4R2UydXhjMFoybkhqV1h0alBNLzVkbCtPRkkrUWkxYXVPRUJCQURV?=
 =?utf-8?B?QkwvWVhFTTBkL0xLVUppWE8rTzJKZDREKzVMUWFiTVRrT1IyNjIyNTVocVh5?=
 =?utf-8?B?TWVBMzBHMUFlRVdsaitaL3VEeVlHbWdacnh4M2pDcVUrM0RUNGZwbmxQODRi?=
 =?utf-8?B?MlRDT3FNQVJ4L3VTT0JjeU1EbE03eFl3SHVaZzk3MGpNOUVXdXZobE0zNkla?=
 =?utf-8?B?RmRTbWYrUUxxdExUZ1dRRWV0cTdMQ3poaFVkYXgwd09EZnVPenA5RlRzZnRU?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bdtoy1Mr7tCYbCwHtJ0jMWZdW5f9hvSMCoT/hAs8Lv68c8M49MrFx8azj9pNxqfeEwtNluEbAnfBKb/3aqyxFW5wfJCFWr1vM5XDBhj+d1KQc940C/rjiDZXOKXYrzBRjcgRUyAzu2HHWdWoodE6L6/tqv02sR82x93LkEMNsVyhkAweKS3wHfatNNfb5c7rXN6A7UQ58Bokif4ANqPfsCdO2qryrH/riFVwpoHILOcovLrshuiEucVQyXXeS+gcQemv0XjtmWCZ0oehLTTkio2HAzPUs5tkSiNw7N5S00qJvYEA74wlrZnrYL+rJzZKVIREJmRos3XF2waGBanO2QdU0a8CElpiewWXjul59Kwp7VvbfTUcZwTwCOOacDu7gnhrAKgHrEXuton76GrexZzQc+G8VQ7cybWHU0jnFFS7vkORg/QGNM3RIBUSBANjtEPKUTgCGgG04zWQ7J/MgVSSNXPs8fctn4gA4I+6lSKdk8+gYcJwFYGj8FWtIhacRwMIYvX+06mVaOaTqmQvVovknJ1uLUY4jS0De6aYbFyF5zHIcbhVDOlONT1Cqd2P4lIQk03h0GttTrHyXSTlSLJRl0lWoaeOPbrVb8Oct5o5kcUihZAGeUm7Vf54L9Y04u1Tqh3zPOsOVsJn4nk+1r2bn3rUR4+rVutUVstRXSNcSgwB/YQZ1KPa+89UYBfPDAzNmzrymVoTyY5C8DA8dJ3R5ea3f6GwNibYWhEZ7JOl0y8hAxiAQuSAV34siER47rx9T2+uwYL+DMsVowmazK95/4aghjekZuzPsJyE4e4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cf062e-5206-4eeb-adc7-08db0543ca3c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 17:34:51.9478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4khmc5ku9au014Nd/lNcIHqx7lllbcgTY++4hAyXGqjjA7MiiZha0x+hoo1+t36U48ZbOzp8w7IC6E40OWZnoZIK62dVcB2pPxX0MJJQh9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7061

On 02/02/2023 5:18 pm, Andrew Cooper wrote:
> On 02/02/2023 5:13 pm, Bernhard Kaindl wrote:
>> Fixes for Py3:
>> * class Delayed(): file not defined; also an error for pylint -E
>> * Inconsistent use of tabs and spaces for indentation (in one block)
>>
>> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> I'll add this to my pending queue while staging is blocked.

Actually, on second thoughts.  Class DomainInfo and Delayed need to
inherit from object for Py2 reasons.  Inheriting from file did this
previously.

I can fix up on commit, if you're happy.

~Andrew

