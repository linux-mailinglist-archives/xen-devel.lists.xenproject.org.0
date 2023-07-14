Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E2E753DFA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 16:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563684.881079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKK3r-0001IA-QA; Fri, 14 Jul 2023 14:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563684.881079; Fri, 14 Jul 2023 14:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKK3r-0001GN-NM; Fri, 14 Jul 2023 14:46:23 +0000
Received: by outflank-mailman (input) for mailman id 563684;
 Fri, 14 Jul 2023 14:46:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIDz=DA=citrix.com=prvs=552896509=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qKK3q-0001Fy-El
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 14:46:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31ca7842-2255-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 16:46:21 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jul 2023 10:46:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6069.namprd03.prod.outlook.com (2603:10b6:208:309::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:46:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::f3c4:948d:a70a:de2a]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::f3c4:948d:a70a:de2a%5]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:46:12 +0000
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
X-Inumbo-ID: 31ca7842-2255-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689345980;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AVzWvFh2eoCjjatEGajZeLavM49u+k9b6UNzsRribCQ=;
  b=DhPDlaXd0n8SHTaSdtH4+1jB2IFvpffGLj/EmCNyysJvmExj3DwSpND0
   9fD+5N56SH6pMVYhl4YS0/iTnCS9XJ8Wdd2fauXuoyrSB4JnC9fE7ccPc
   3e8PZEPpcbWp4nE2x/9En59o8BGnw2Tn/+44zOHd+b+bvLgoFqEa/vtsz
   A=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 115541256
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jfeCo6yCr2NhyFv7V8l6t+fLxyrEfRIJ4+MujC+fZmUNrF6WrkUPz
 2pND2qCOaveMzahedklOYW1pEoP6sPQn9RjSAJlpCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPKwT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVwS8
 PlFcS8dUk2ClcyS8rW5Uu903f12eaEHPKtH0p1h5RfwKK9/BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVlVMpuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAd9PSOTiq6ACbFu7+3Y8BQYEfH+ChvzgqELned9uE
 RUP5X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO0cSCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vXvHjv92
 SyN6iI3iLMal8cj3bi05l3BjHSnoZ2hZgg07QLTVyS74x9jZYikT4a15kPW6/kGJ4GcJmRtp
 1ABksmaqewLU5eEkXXURP1XRe7xofGYLDfbnFhjWYE78Cig8GKieoYW5yxiIEBuMYAPfjqBj
 FLvhD69LaR7ZBOCBZKbqaroYyj25cAMzejYa80=
IronPort-HdrOrdr: A9a23:yNBikaG9bG24PrB9pLqE4MeALOsnbusQ8zAXPiFKOHlom6mj/K
 qTdZsgpHzJYVoqOE3I4OrgBEDiewK/yXcW2+Us1N6ZNWHbUQ2TQ72KhrGO/9SPIUPDHso379
 YFT5RD
X-Talos-CUID: 9a23:F9hycGz6gmDpBGpocM9wBgUpRsUgLyTC3EuNIl2WLVRuSqWTUQSprfY=
X-Talos-MUID: 9a23:XZexIgo0ZRPf2aeq5tUezwx4G8pz8Y2KMWcIyLcK4uuJBBYpICjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,205,1684814400"; 
   d="scan'208";a="115541256"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvHv3GTU7UGTUjW3khkjGRmEt2J1lxHgphuS9NSqXtu7JG8pde2+EdZiJ0iekjynTf692sjV54LylHqop/JJV0Yc7/XMABl5Q0+v3S4oH9Iz9bs2fdr1wtgQbnmEti1IMpG+jtRRGa3WBDjrL6cDYL+e8rSZnW33u/C7mfcl+JMX0I30Fq307JI8zquuGkHADJceAtBPoitGdzAvZtTN+d7GF+HeFQ0fj7dv4s7buQz73fZvMT8WNgYqEcwyngbsD1YTfKUU3lfbkCxqBLdBv/22XCiqWgtJT/8wj+2LZ16vxBGnmbFzmoxqe1OCsNodtYuMy5M4gT8htOYnkCg2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVzWvFh2eoCjjatEGajZeLavM49u+k9b6UNzsRribCQ=;
 b=FYDx7xWKm/KvzdnFk9B+k+ECIUbqCRAuzuIcwSNF17qiik57+mY9XTso/Q8tdAStSj1qtW4GiCaXPw1fqrLYJrKToBvtKqbLh0reO4wPAX9Smft7az+csWIZKRXvSU6d5Ws9VHKly4naEsQcyYEqG/kmMxlWQwmmWpP1VrhuTcUrJo5891r3x44ZZ9iGUgI6i8/PEYXMVHO6pwIkeMTlph8lSxM1AgbhXRkrthrf8PaSvrdzJwlAWkdE1QK4A6nUQoQMsgxjwfda2ysL1GZl0hvQ2h77F3/ZLzSVlzx1FMmstzW79ydMtaRYQT6JW9TYw8yVlSRudLVd0fWSZgYY8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVzWvFh2eoCjjatEGajZeLavM49u+k9b6UNzsRribCQ=;
 b=Jm8DIuFb7sGM/Fxe09l6cpzTZohbjRHXQl2SnQlQXv25zCTjzXg9WQcJ3VyI6J/9Pt3rHYT1sL0PyX9/8pPyG2WIFnMWrSsyrZbFNnEgiLe2Q97FUOlN+lqSc7Nc+AkEsZ0heaUaQHIEnOdaT1aTth4w6YRip+E6hT5vdedyPdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <77dffcb7-242c-0a4e-9ad0-b541105f2c4a@citrix.com>
Date: Fri, 14 Jul 2023 15:46:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/common: Use const char * for string literals
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20230714110009.3004073-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230714110009.3004073-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0646.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d1fff6-8757-48be-7c90-08db8479111c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7uFLDExtHIDeHadcvkkF4ULiDLYn072Ib7QgHW2MrAc7SsauClUR415Y8k14VFHPQhlyjJIp+qceUCjG9l7V5acAwFTf/zn8oK/FNF9U5Dc+sdlHUdQRkyCTJkOVtHmzuPAjyG7U4ey17xa/FaMiP6n4JRqwlAjP5CkOCP6dgLt+JwGHbTjzryYyPcapobJmY64tA5ORW4oCvTOqkVTR5Sl8jMVaiqIQ3PrFoAOkd2Bm8mfwdPs2JG5493JH2x9/n6OGWYiMfvgwl6R5pLXYQhh5wGnMbPcxFe1oGHcu5j8I1fJQtcjvKTPf2Ujwmjwa/p8LHB4iltS1BgNclLdDnjxot2Ms/izYX5k6F1eDWBZvB0otahf/kVkRM8D8C+zgPnbWZFDk98bLCnqUWqwi2P32jSgmCz3vA5BY63Otl+2zY/UQGHha5i7vzOPrF4JLMfBIv65E+Z8rG+lSh0eChKlwUuLPm1K+oGRhpzZ1KO2M3oDHGIKekbax36BaGE/XNOROAZVSwgDSvU2BGOck5xzxxqYlSx8Fo9xEnv3/MovGvWjuvluvXPmNRgcwKFM8BZKG2MjAGh3/0FZF8wOenzwCulcuXf/yh7Sbh91DTGvVJsNShZsJ2C6MB6K1Ttn+DVIElkuYge02JvrbK74/EQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199021)(86362001)(558084003)(31696002)(36756003)(82960400001)(38100700002)(478600001)(2906002)(6486002)(6666004)(6506007)(26005)(6512007)(6916009)(8676002)(8936002)(316002)(41300700001)(66946007)(66556008)(54906003)(5660300002)(4326008)(31686004)(66476007)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDM1NTR2OTBVbHJicENWeE9MT3B6ZURxNmhIaUJ3RURWSDVEWnQwa0o4bS9Q?=
 =?utf-8?B?S3pmbXFwM1QvSDhzODdNZkpYYlFOUkM2ZUZwMDhBWVRPTHFtMHgyQnBUeEVR?=
 =?utf-8?B?MVdrNXB5cG9FaHNpdlorWVBoMVE4b0RTUXlYY1Z1eEdMWVJIUFdjeit2YjA5?=
 =?utf-8?B?VXVzVHpQYk96dGlyZTFDUUhPU01TRlErMHh5cnk3ajlkckVURnB6VGdTOTha?=
 =?utf-8?B?ZHM5emRObVdnSUsrZk5jaXNZaWNMM0hvQjU5djNRUUZSUDAxNkFUdk5UQ05P?=
 =?utf-8?B?UTVNenlCNDBUTFd6aDhyc2pZbFJCWkJ3aWZxbWdoVnNHd1Fub0NKeUdadFUx?=
 =?utf-8?B?K2tIR1AvV0FsMWFZbEhoYmRJUjRBQUNWZXQ0MUNselVWc3o2WWhYRFV6UVZT?=
 =?utf-8?B?by93NWphTnoxVjNuYlRJZ2FQRDNPZEFwd1RNUUFIekRIWU9GWkdNZkF6SGFE?=
 =?utf-8?B?bFB1TndmTmd1VFRKc3hTREFyelhTUkFZSUJFUHRWZkp1a28raWFCZXNDcHBQ?=
 =?utf-8?B?R0JtK1lnTHh6ejBzSHBUK25pRHBJK0JCa1BIcW80emoxT3NPWUVMOURJelpS?=
 =?utf-8?B?TEVEOVdnQkcxL2xOK01HN3k4WG1FQ1RnL2U4eUZNRHVBcWMyTmpUSUp5ZmRI?=
 =?utf-8?B?Ny9mbjZOSXo1QkFwOTJwSGJCc3M2K3M4SHF1SVZ5LzY2MkYxZGpxVmtIUmdl?=
 =?utf-8?B?ZUFuaGpoT3BhdHp2WFJtdHZyanhLL3pmaG41bGxMY3hwWmlFM3FNQVZRK1Zs?=
 =?utf-8?B?Ti9IMFV4U3AwZGVBYkpNRjNaT2JlVEtueElNWmdwSzBpWmJXdXlTK0RjTXA5?=
 =?utf-8?B?cjJERFFGZS91NWlrMGhsdThNUVFydWN3SGh0UVRGRUlsMW4rRlpMVjIydUt5?=
 =?utf-8?B?TzZLNk9LNTFTR0J1VTMxUWJLNmRoTW9FdER6bWdIb0o0ZUVnaytidnZOdU44?=
 =?utf-8?B?TzY2OHJ5RzdwaWdrMmJZUW0rSjVnNk9aOEh3RG00NzArZHVGSG1ick0xelFi?=
 =?utf-8?B?UU1kSjE2SkZ2MHpLL1k4dElhUE82bGl1VzZtbHF6c0Ria0Q3alh6N3ZjcVps?=
 =?utf-8?B?ZHY2L04xT3lEeHJVVW8vcUJGWmVRZnkyNUVkQTNmbHd4TVo4dGM4VFFjZVl5?=
 =?utf-8?B?L3lxM09XS3J1WXVwZ25hNTFSWWdETktXaVVlTm83aFduVWlhaDIrYlkvaExQ?=
 =?utf-8?B?SnNIUDhYVlBldmtMODU2UzVNNCtlR3dpRFN5VTJnTDA4TEwzeHVWOGhUbEZp?=
 =?utf-8?B?eGxwOUdZYVZqc201MlZGYXRTZ0NaZ2xNK1hqNHN6MVBVSHdtYnVQTXZGTXFD?=
 =?utf-8?B?T1ZnUkpYMVErRW1NVHdOeFRrTHNrQnZMLzlCRWh1UFZWR1A5ZkFOaWY0bitu?=
 =?utf-8?B?bDhOMWVvNllwd2ZhNmVRTEEzaHlOZTE2a0VQdWxBWlFOQmIrWUNMbHhpRkZN?=
 =?utf-8?B?MDNDT3NyVFpKb2lVUkU1SXZqTDBaRVpVVnpBM3FaRW8xbVZuSFo3RWNzelVx?=
 =?utf-8?B?aXh2MVhIdUhscXUzSlYzcStINXNHSDBPRTRIaEhKejk2ODliUkhXdVNINnZw?=
 =?utf-8?B?aks4aHlQWXd3aEJMNVRrb041UEFhZm9oUzNYODl4b0lLMnRiY1QvRW5MbCtC?=
 =?utf-8?B?SVdhT05KWTBKWVRXMjJvdnppRmp2MnJ0SmVtL0VuaituMy82cjZzSXFhQWcw?=
 =?utf-8?B?eU04ZndNWnM2WVUrekxQSkkxTWxrK2J6MjQ1cnI5VUhJZmtjeFVDOTg4R2Y4?=
 =?utf-8?B?aUFJU2JialJvdDdFSmhpNzhmVi9xcUpYNnhMZmlrU093WTlEYzJoUlpaRmxn?=
 =?utf-8?B?V09UOEZ3dXJnYnVOWDhaSzhtYVJOQXNmVlh2SXdNNnFqQ3IxM1QyTDkrQ3hQ?=
 =?utf-8?B?NjNyTXFJWnROdjZaU0pWdmlwWTU5WE9aWm1nUU5JbkhIR0JsdkNkWExoYllM?=
 =?utf-8?B?UmZOWXhxV053K240MG5VOVprbXVZcGhqbkgvVjVCUlVDaGNrK1dqU1huT1lS?=
 =?utf-8?B?bHBMMVJBNVU3dWY5QkVwSXBXVldONVpkamlhNnRxRllCbHZWcHNZc2RqVEhI?=
 =?utf-8?B?ai8vZFowL1hKdVBMMlJXamgxaTR5Y1ZESGNFa1dRbW96MDFSaWEveFBtdXJU?=
 =?utf-8?B?RkY3cDJNbnYra3RQZ3hneDMzeDlmbHlMZHZtc3hzQmpsaHJNTVpwcDRoNFZJ?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	31tnwB3t85/RruSeE3j1VXthn0Ympe1Af0AuwqfBiUxNbh9GRtyaJk6yBbx3ExAVY2yJdha0ww67acQCTxwF6nFrTpgsW7KwpbOk2zsp1Eo1dbgcOh2Y3NFI+HZUx4tetbjwveIQ37TlYlrWB077WO/L5me4NmNfVQ7Pk/4pbKbe/rrBovLr7BqRLDvOkJzb8R1A0/YOhGq0vxI0yFC3xOtuBYuT2Zmpp/8XuajuExsGi5Bo01hjhxe7tFFM1bHzSF/jlS/cmwZDDCX8Be+znTG4cXuEukywQxaVRPFBRLLAxZUAPO7/YETPvjwio+jcJ6+1FpuST34k9v6ltO72dvDKyMo7iw4NWOATdgOEjj+eYlYejLCjBzPYeoydfa6uGz6h/05eB+oTXgowVgnA+/gZn2i6oIzvwsJyWBPslP6zicFwY74rj7TbToR5uE6ihJkxYHoBvHMAyqNGHMZIw6hN6cG2Q3syU9b9/mc/8Azh4zj7yl+aRPVdruQ8U0hP6/lClL+MUV+e+VNKjXv/Kvpq0TcDUvyvWXeZJO5IYb79c4b8tEjvIl5r2QKWCiduzaiDWR2yJ+ah2yK0o5uF29zP+lI66F7CUg+QN9LaHhHrpEvoXjAxhuN+0QZpCO1b+XNDld+6CkHHUVHu/xXFbfmH/Lz6dAtwJfIYl3TARYrrxPfls+izho30K0njfXJd+BXOapQ6xzdCEMAuxPrL5d0nwMDk6RxyCidQoZtJWcc3GrtAAl8QISO46NLjX2nrlxjsxWJEZi77cVRlfzH2HoedHXoY5rxEc+eTKzbWnAkd+a2T6zvFKeytamazhhP/hKtsZHd4vtiIihgNFYIBi7qSXGYSY/0+FncBl/Ufbyzlg3F6UIyTnzBhvotrRsay
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d1fff6-8757-48be-7c90-08db8479111c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:46:11.9982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2BhxMq5VQvM2O3ND9+TM3Jxf2S3XNGTZyQhFRswz7O7CjMy0jTUJM/v4jAkKJNKoe996NBMnkpKg2zilhuqz20w28uFjv32Udw0VrHze3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6069

Hmm, I intended this to be xen/x86: as a subject.

Fixed locally, but I won't resend for just this.

~Andrew

