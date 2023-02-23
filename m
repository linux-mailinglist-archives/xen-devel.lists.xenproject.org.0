Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AB86A07DD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 12:58:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500272.771576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVADl-0007dK-Ji; Thu, 23 Feb 2023 11:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500272.771576; Thu, 23 Feb 2023 11:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVADl-0007av-Go; Thu, 23 Feb 2023 11:57:09 +0000
Received: by outflank-mailman (input) for mailman id 500272;
 Thu, 23 Feb 2023 11:57:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fv/5=6T=citrix.com=prvs=411d40f12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVADj-0007ap-MI
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 11:57:07 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f3ade79-b371-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 12:57:04 +0100 (CET)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Feb 2023 06:57:00 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5119.namprd03.prod.outlook.com (2603:10b6:208:1b0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 11:56:53 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 11:56:53 +0000
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
X-Inumbo-ID: 2f3ade79-b371-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677153424;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DRGl8B0kmu0Vvtu5ILfofb4hljsO+C7pDdw33N4avWQ=;
  b=G2KVpeOb2nghgLhlMi6atEkBTN1ZDnGSA8ZAY5/edttndIgbmsRiJrGh
   u3Ft2cSwlvUjrknskichYWnHRQiOEmsBQt6Rqa5qxzu6WypUBr9U/S+YA
   qZ5fqrvOvPMpnChHUm/hWumMunfC8XEjULGEeXjonbtccOe644Y8OMBak
   Y=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 98617930
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0AJu9qOnoqgS8KDvrR1LlsFynXyQoLVcMsEvi/4bfWQNrUok1GBUn
 DNMC27VPquOamGkKd1yOt60oBkEsJWHm9dlTAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5AdmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vRbM3lv8
 OFIEToyczHdvP6EnJbiSeY506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/RxvzW7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6fw3qkCdlKfFG+3udykUbQyG49MiEfCUubruWCuBS9CvsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwAuQ0Ljd5wGVAXcNZjFEYd0i8sQxQFQC1
 EKP2dXgBjVtsbicYXOb6rqQ6zi1PEA9LmIcZClCUQoM5fHipp0+ilTESdMLOLGxps34H3f32
 T/ihDgzgfAfgNAG042//EvbmHS8q57RVAk36w7LGGW/4WtEiJWNYoWp7R3e8qxGJYPAFF2Z5
 iBYxo6Z8fwECoyLmGqVWuIREbq15vGDdjrBnVpoGJpn/DOok5K+Qb1tDPhFDB8BGq45lfXBO
 Sc/ZSs5CEdvAUaX
IronPort-HdrOrdr: A9a23:/5PGrKNfvRSiMcBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.97,320,1669093200"; 
   d="scan'208";a="98617930"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEO6A36CM1PjsZjdoHZjYVfKwmwt86Mh8hRt9QA1t+eqwzna9HurPcPqLKf64dCSHWMqqtGlEvH6GSDUW8uQvqwr9a8Q1UtY3f/Vi5GlJzK0zQF+mla0bYIfVRl32eoniet9hxwzGeRFPRhoUonO284A1gv1gK/iu2LciPga0abM55XuRVV5lkgZrb5VS7169/G8x9OnWz8KETnxOnxsv7RSanDmYTm13VgyzK64vZdLyxONQRlOF/3j6hQFRIsKTvuN0HQDfbmbrDJzwTRmq66VY8MWob3T590eWD7BS0EDTGA30qiykz8Nbjfb9gkdkmX9kfANdYJRXQlkWeDE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBukA0ASAWupIqjpJxDLVGd9kgtEAcQBaWJu58/XJ6Y=;
 b=WZvhf7a4jLBYCtF7JdQVwlBpJWARWdFcCw4dlsBF6IKe8t6+iS21LdKlMbxcyrUdKc0ksKAur0rD5HFIXcll/1C9lByMk/GsPo6QwuvEyQHhaIinarkOlbn5jwOC7uSn8zyWjUpvDkKljlejupUd6VrMofgPy/xCSzkmnl6w1dqLrGMjMLlDIk+wGvyKwDYeTyNuA1FWQhMDtQCucjeuo0yjLmZJuh2Gp9bUESGiyWyPlGy0TKd6vvdWtHhxjpiLioi+EbubGrt+brH9mBIgnP7c5Z3CDvoTfGAR6SaiE+dRxzIesp2D2zu+YTyYaKPAmAD4ASvY0u8TsnUAr9FjJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBukA0ASAWupIqjpJxDLVGd9kgtEAcQBaWJu58/XJ6Y=;
 b=aEz2A4dx2++uAzKWqJLSs/yAJK4RIO34ZoM8P0FRYAfUV9o1HV7wWevIlChy7iAH7JRZrUJ/MYKMy0iC4Jrkc+RHa65fIAavrtV4x4wgg/jwG3CG8yjAvGXHnrsVFbQSRHW9Lbu5399qbfSkcY0ubv7z797Ujlpf3XEPEyUD26g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <29f0b7e6-1a77-0b0b-0301-6abb25c9384b@citrix.com>
Date: Thu, 23 Feb 2023 11:56:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 6/9] x86/vmx: move declations used only by vmx code
 from vmx.h to private header
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-7-burzalodowa@gmail.com>
 <0f169088-53bc-afe5-8f10-970c17f261b7@suse.com>
In-Reply-To: <0f169088-53bc-afe5-8f10-970c17f261b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0569.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: 15762db3-18c7-4bc4-addb-08db15950d76
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dzs6CtikV50JmtCDYBoiItD9fuhfLc+ncuxbrb1UoRuSzwdc6ZnnB0TeS7fWTEuStz6Qu6S64d+Lf4wLR+H746K4Se0l6ui2byJV3fupm3ucxCbEvLWtNPj61ic0sQLK+En6ktYmDERepG7ewIuYrDxUbrK558Z1OGzTts6HEkej7uwLQkXqIt7IjW/XaibEWbaIjw/kdsaXjex9IJfBsHUmCoqgxqINpRTHHbXvCbP1ssRB4cZAyT04kxN6r96OVIkjA7pPz6yPSsnsjLWkzzQz822BLlZ5zLXpPsGi9NInIp6SPP6baD/OMImwGESpJM2mvi2p4XCkn8V9UVWXc5L7oGHoKu3C2TBF01jKW/jnlSBkkV+QTVMMgwEYfifzbbyppGCM2XjSQtarlFGvZXeLkWRjuuWSIu31arsVyVygqmK5Leg/9A3NDTErYFqi4jmIMz45J7g9rJLizJe29hUEgPkc4LqKCVYeSjhbMWJh3YKZARq1YhmB6gY+Y47UUdegqZcsELwNpmdAGVvz0i6DGqD17wdhJtfV02ISbDojKYrlThqdZJVHLlOVOEgrirGL5jGdtskRe84ApM+mRQAi80f8UGIaPXnXvaPYA11G+eEI8WIsAXSxFSRUdM0MqBzYktA7q3tKgPikO7WX4pkIG4FfJk4spWEV1s7EQ2WUvdvYTJ5IyK3GdVjWNoo2C1sHhzP6gvF+pkgwB8/7AhYOcvwzl2Da1oX2oJYpspg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(451199018)(31686004)(110136005)(478600001)(54906003)(66476007)(8676002)(66556008)(4326008)(41300700001)(66946007)(5660300002)(8936002)(36756003)(31696002)(86362001)(6512007)(6506007)(53546011)(26005)(6666004)(186003)(6486002)(82960400001)(2616005)(2906002)(316002)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QW1rNXFFcFdmOGpLRWwyNU5GQ3d5RXVCK3NtSHNZUFlEOUsyRHRCRmxpZGJO?=
 =?utf-8?B?cWc4aDZZWW5lTWVjenlTby8zZXpJeDlvcjlIeEViN1Y5TjhNdENBaElOSzVM?=
 =?utf-8?B?ODZHeU5RQmZXVVRlL2FTeWhLNE5DNytsUWwwQzBuQUdSaWlla3VMT01vcU53?=
 =?utf-8?B?SStmaDlSaDk2RU9mVkdsNGdSUERHdGV3dDRyVStoYUxrRGErQkJKd1NSTjRk?=
 =?utf-8?B?dXdmclJUNnhrdTNyajdqYmJ2MGJTM1JZenJXM0RjZkVpWHYwU0hTQ0w0dndl?=
 =?utf-8?B?YWRjMXFHdU1zK09oSWVmWE1teGpGMytFckhsUDVhdjh1SG1TMWR3cXVaSFhy?=
 =?utf-8?B?RStXUnNVajgvWUsyMWNxY2ZVQk1yQ3VxQlpiZ2Q5M0xPdThlOG1hM2EySzhG?=
 =?utf-8?B?VFJpSTlYaDU5WnB0YWUrNGxQZVpSVlJGckU5bGgzWjVXY2dPZGVEbzRjQTFH?=
 =?utf-8?B?eXIrTzFPY1hhdHhaNldBZkhldWFpSTltcmhKeFdrWTBtZDJqcW1PbGw2UWtG?=
 =?utf-8?B?RGQrM2lWSFBSdUVlMzhpY0xldzVUZzVBWEprbCtoU3pWcjZqalhIcGN1K045?=
 =?utf-8?B?R2x6SUlvc1R1S3lac3dsSjVaSTVNSEdDQmFJZW95bDBmZy9Pc0xkVUZaMTJr?=
 =?utf-8?B?K3MrSWJEM2FJelpSYjN2WEUrY3BvUDZyNjB2b2NtTG5GK1NoMmxGQTNXMk00?=
 =?utf-8?B?TGNLaUNFVnB5TnNKWVJtMlAwRmQwUEorcGQrVVR0KzlvVzJrbllBelBMdm12?=
 =?utf-8?B?RkRpU3BnWlp4R21CSkxNa0J0NVhJeERXOXRScDV3S0NCbHRZQ2lsODN1VXFt?=
 =?utf-8?B?dURnamdQOW92ZURnKysvQlhQaFBvZko0WnhLeVNpOG5QaXBSTkZSUFVIdm9j?=
 =?utf-8?B?Z01HL0VrRmJkUStMOWVpYWhXZ2l3d2hmVWFYRzFOR3dBZVpMeWZyb0lJeEdM?=
 =?utf-8?B?TTFpUGp5NGRVUmd5ak9CR1M4TTltcjFEM2UxQmdOTEVLMlRxNXFYVXJpc3E3?=
 =?utf-8?B?eHhHeWlRS2ZxZTU0cTg0RndqZERrRmlJYzdjVDl5RThIelMyWTROMDJtQlo3?=
 =?utf-8?B?Tm9nc1lTcEZ6MzBOT29nZEJIZURlM1B6T3paRTJDdXdBNG9KNDgxc3pQK0tG?=
 =?utf-8?B?cFpURnY2clFOTVJaSVlnRDdZRGpreFl2SCt5b3NrQmZtZWZhNXkwTGJjaGVT?=
 =?utf-8?B?SXdCUkxmaG54MnBJajlndUhua0FGWUNOeUpqZVZGQk1KZDU0eEhlVEd2ZWkr?=
 =?utf-8?B?TW9pWWdqak5qVGRGUFphOUxrSnIzUy9GVThuRkw3bEpzSlIxNmJUamw2Z2xo?=
 =?utf-8?B?M1NLc0tIUVdCbE1FWWxQR01FQ1dVTHgwTWF4WEVDU1ZyK1hENysxWnY4bG5u?=
 =?utf-8?B?eTJ4c25BcWg0eURNNk44eElreEYveWFUd2crbmtCbWRWNnViWm5YcGJIQUZm?=
 =?utf-8?B?ak1yaGUrcjVpcUJCQWV3bys5VDR3MXA0Z0Y2VEhDazdOZE1VV0xFQ3pHUEQv?=
 =?utf-8?B?Rjg0ZWZEclNxWHZnclRYN0tRQ3Y3aThtSUtVeWE3WGtJU0p5OVZlb0ZIRUVC?=
 =?utf-8?B?bDBmUFFFUjNTbCtGL0V3S2JsZVB0SExKc3ZsUnBlSkducWs4bzVGc3VOS3o2?=
 =?utf-8?B?cHpuT0FoOGg3L1cwMmxXQy85YVEvR05ZTnhGdU5aUm83SmZxaWRZK004NERT?=
 =?utf-8?B?d3hmZkExY21rNlBlajQxOHRjQXd6T2xFOVNnVmJFZjRWUDM2M21HQlR3ckJV?=
 =?utf-8?B?KzhNSUphYm5mZ3NlQ3I0WUFsbjFlbmRMLzNYTkFFUTZlR2U4VWNJVUJ3c2ta?=
 =?utf-8?B?bXNUc25idXFxTjRrNjVoZzZWNXNNYlVqUVh4dnlLZUFOa2ZFSUhCMVpUNEtT?=
 =?utf-8?B?NkkzNFRTVFMxUll5eFJ6bmliQ1h0anJyUWNOb1g1VWwvOStjNHp5QnlDV0lq?=
 =?utf-8?B?R1ZJeDJuYUhSQWlLd2U1c1FxOWZWVngzR2dLZE83aThXWnIzUk51Zm9OY2Q3?=
 =?utf-8?B?ZlJSeEhvcDQveDZZbXBZWHNXVCtzT09MOU11U1dqWGk1Q000dWV3NXZBV05j?=
 =?utf-8?B?ZWxKb2ZoRTJ1eTNXd0xKTmZyMWtpMFFOTDVseDFRQUhMWFNKWTIvWnFsZC93?=
 =?utf-8?B?R2pZMHlrUzVaWXVqYy9XcjFFVnBLQVhKV2JkS3B1RVF0TGljSDRnSCtiOFR6?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ykg2+orPty8aR5HjQByhjme3QxPaD/sSLrrqYqDxYhUzju8vN+QQcMCFoeGlokYHnx0NKl4nfvptfM6dWTh/4KUV5IP/NAC4/a55qflcdImZg3NSyVBaHMx5uMgHsV3Buq7MA6BhUPXTKgvjl+sB2VYklAwhtM90juXilSg2sjxU02r0yLAjtRSKhzyagakppLeK8EAySN9dXvOXyRbRFcnyIBbIthLEszGjIK/jaLIfpjA5XovWRa8fVbEot1Pj7yyHf1wQHDNRLfvPOIzpYNjnyvXg8scOe4S7MHuLOeftIweyC5gP84Ovrz4nu4uLZPY/SEYYjfROkFO+kD+NHZAi7CAbzKejNYuE99/6LTlVTKiKdEPGG9H0f3quVN+mUwXWmDjk1AiKG3bUxQ80ypRadmO7Huers2vck/4j/YRgAVtV1QvnJ4jltygf7IJKOp+XxaZlvCGL5FL8aiVSBhsJooTzkG3EI5JWRWtODyRbZ8FU49dXJSv/zf9IK7OX9acKvlhLa7yoRgETPEqyKNLHrZSbC/zbxop+Wc9c9InRvUlm0R93Vmh4H6x4ZDaNQRmpgqc7sPthNoLQMTi7SQhRTjzSCCMFB1yStLbIja9hwcrSHLU+xc+Huh0UB48pCrV0A+dTuw0DZjh0/fy6UbqWngZGonDohST0SH0K1d+fAzUcLoSjKVpruiRtsCn9YIoAQUWNKDWGkH48CXtbj0O48TkuEVb0RjV+qREmSxrlgWhRE2Ptk9lTPWTP2eXduhvh/hRf7cAqbuVaOeRIfBTmN3M5Xf1rh5P0I1jG4tiXUODsKBoksEM3qUOBopVtn7Cii9ENvxu9rrhcc71yv4TtYmyMBF2QEeyY1dC8ImcR3sz9VUswAsqxTkCajmQ5
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15762db3-18c7-4bc4-addb-08db15950d76
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 11:56:52.8092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlXNb/alICGz6vNZMy+wP+E9spmBC1n2O/QeqoEt6EhE47VyAV1KVcGYBgeIpSO+K6dkgrRy/aVK3ZHWoF0W9bkhxgRoCXZQQkeNageki9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5119

On 23/02/2023 10:47 am, Jan Beulich wrote:
> On 22.02.2023 13:00, Xenia Ragiadakou wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/hvm/vmx/vmx.h
>> @@ -0,0 +1,459 @@
>> +#include <xen/sched.h>

Like svm.h, SPDX tag and guards please.

>
>> +extern int8_t opt_ept_exec_sp;
>> +
>> +#define PI_xAPIC_NDST_MASK      0xFF00
>> +
>> +void vmx_asm_vmexit_handler(struct cpu_user_regs);
> Even if it was like this originally, this is bogus. This not-really-a-
> function doesn't take any parameters. It's declaration also looks to be
> missing cf_check - Andrew, was this deliberate?

Yes, it's deliberate.  As you identified, it's never called, and
therefore doesn't undergo any CFI typechecking.

It's an address written into the VMCS's HOST_RIP field, which also
explains why it has a bogus type and no-one's noticed in 18 years.  (Yup
really - c/s 9c3118a825, December 2004)


But it does bring us back to a general question which has come up a
couple of times recently - how to represent asm symbols in C.

This ought to be

void nocall vmx_asm_vmexit_handler(void);

to identify that it is a function-like thing without a normal calling
convention.  IMO i could live in vmcs.c rather than being declared publicly.

I see nothing in MISRA that objects to this.  Rule 8.5 states that an
external object or function shall be declared once, and only in one
file.  There is no mandate that this single file is a header file.

The point of moving this to a .c file is to indicate that the asm symbol
isn't legitimate to reference anywhere else.


Such a change probably wants backporting.  Let me do a specific fix, to
separate it from the cleanup.

~Andrew

