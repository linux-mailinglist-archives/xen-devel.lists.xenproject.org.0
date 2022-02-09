Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AFF4AF5DB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 16:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269357.463419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHpKi-0000xu-2K; Wed, 09 Feb 2022 15:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269357.463419; Wed, 09 Feb 2022 15:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHpKh-0000vT-UR; Wed, 09 Feb 2022 15:56:39 +0000
Received: by outflank-mailman (input) for mailman id 269357;
 Wed, 09 Feb 2022 15:56:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/P6=SY=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHpKg-0000vN-53
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 15:56:38 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db482beb-89c0-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 16:56:36 +0100 (CET)
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
X-Inumbo-ID: db482beb-89c0-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644422196;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=oApr4AAO9tH9pjl+EhZ07NUVuyn8e71fAYojDm3f+0U=;
  b=Bj69LQV0HYAJviuOUUgtF/ChJfh/hMRNj20LBqzagRhP462Giqi+jydP
   aN41/sVpHJDpmmF7fSoA1SIAugwZpNZXTLgPCpXR4uQs2HDscRWTUxNCe
   dJzw/hdMISVfQRyPAP7oJf4c9Y3CUCLDezOOdlYAI8IPwHNJLL57PNTqu
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6x8+wNC5vQ+f/eOAdS11W40BjAAMnPBR/YWMpvMtsCo2OmcplRWVr0lEmYfJkjHbeTbkNBlar1
 nJwM1QBe4WQ6wx7FEKHk4VJFD1JviWgMYxGO2ICQ8g5oNdt5yijiztdEizvpApQYHycjTjZLx6
 RJc4rUZnb/B3Vxt5dXx7XfGS3quKuQrb9nPiyf6hxxl5BJMhvVNX5vsibwO+W0VBszNBTOfBuR
 Yf8uVw4pAH2jRk1q/oxm/EVmxKksENNtfvwRKbI3B5htB28BJBykpySroKkAFk1Rz4uohq0UL8
 BNh3ZB8VT9wHbFzkHIywh9I7
X-SBRS: 5.1
X-MesageID: 64246028
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yqol16l8cgYAD1Pi7e5QGEDo5gxeIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdUW+OO63fYWvxLtl3bY3joxgGup7Szt9jHAprqiszEyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2NY52YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Pprp7ieSTwIB7KWguYGciQIDxlGZ5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gls3JwQRayOD
 yYfQWJhMCjjYRZkAVg0KKIRufeXpySkLiIN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfDnCX7Xo0VH/uk69ZrmlyPgGIJYCD6TnPi/6P/0BTnHYsCd
 QpEoULCsJTe6mSEaMvZcR2DgUeb5AQeQPttQ/EC0Fu0n/+8DxmiOkAISTtIadoDvcAwRCA32
 lLho+4FFQCDo5XOFyvDq+78QSeafHFMcDRcPXNsoR4tvoG7yLzfmC4jWTqK/ESdqtTuUQ/9z
 DmRxMTVr+VC1JVbv0lXEL2uvt5NmnQrZlNsjuk0djj8hu+cWGJDT9b1gbQ8xawfRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxQ8V6q2nxqifzJN04DNRCyKFBaJtsldjBO
 hC7hO+szMULYCvCgVFfP+pd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrUuNHsqT50r8jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid9408HD7SlP3KHqNV7wJJjBSFTOK0aYvd/L4arCgFnBHsgG7nWx7YgcJZihKNbiqHD+
 XTVZ6OS4ACl7ZEeAQnVOH1ldp31WpNz8SAyMSA2ZA760Hk/e4e/qqwYcsJvL7Ug8eViy99yT
 uUEJJrcUqgeFGyf9mRPd4T5oaxjaA+v2VCEMR26bWVtZJVnXQHIpIPpJ1O96CkUAyOrnsIiu
 Ln8hBjDSJ8OSl06XsbbYf6i1X2run0ZlL4gVkfEOIALKk7t7JJrO2r6ifpue5MALhDKxz270
 QeKAEhH+bmR8tFtqNSQ3PKKtYakFed6D3F2JWiD4ObkLzTe80qi3ZREDLSCcwfCWT6m466lf
 +hUka3xaaVVgFZQvoNgOL931qZitcD3rrpXwwk4TnXGa1OnVuFpLnWchJQds6RMwvlSuBesW
 1LJ8d5fYO3bNMTgGV8XBQwkcuXciq1ExmiMtaw4cBfg+St63LubSkEDbRCDhRtUIKZxLI54k
 /wqv9Qb6lDnhxcnWjpcYvu4K4hYwqQ8bpga
IronPort-HdrOrdr: A9a23:YqhjeqnS1IEbHNut+XvYIcXvib7pDfPOimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdeEYbmIK8/oSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYHNu/xKDwReOApP+tcKH
 LKjfA32wZINE5nJviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wgK7VBaM0ot
 gsCZ4Y5I2mePVmGJ6VNN1xMPdfNVa9Mi4kEFjiV2gPR5t3ck4klfbMkccIDaeRCdg18Kc=
X-IronPort-AV: E=Sophos;i="5.88,356,1635220800"; 
   d="scan'208";a="64246028"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8UylR1qoGW7d67DNapky+3i9LkTDDtPxPrC8XSvQKSSGmZZXtia45AixiuuqkJj1SibB1lIARetKrg0uIZSGnKK36Oj68hZJz9qNIRD6kDA/XqfVt3P/l5K9gWLP0igyFTIqOWMWb6PlMvlQ8eaJCuGLnzw22zDZ1SccspVXCJJAu0upAXZ7GbcAr+UavPMprB4HfK+ZxQQe3dBz5mFGR1MSMwgdhxg9VQN96rKVayUNY8dlojWfvZu+mfiO6hdFqTWtqxRh7UkJN3tYNTEC72VdkH4qlQCSpR4ZLDw8oxKd/M/cUwvK5iuh+72IeZKNuJmgCrY1lbQ/nWZNK4mMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcrIWe5kGyPvapn39UImlpfu4qEuHx+mmBhUcAMUlq4=;
 b=bLhXK/iydQOW88M6Dx7HZs4dbC/ibflX0Qq2ksJ7fqbWq0dRY02CNZMOj/HIkzunfqQsZVFjhUYC/jxOiFXm1HvH2wdATjhaQNYxIkeGqkexq04gbFnCqf3JmWGEEAK4fEknP9qMXxSRSODkyTJ1hNV4xcyye2zMmovSYTDjKdTVJyexF8Dm5HxUeUKWmX5Qe1HiZ2jg/YyeBVa0OQL1Asz60Vyeh0V/jzTA+D8xC4zRxsyCz392vySE8irS0h6OKC6OiZ81csRSxNTcHJNd9PndNhZgwW/LjiLe1qYXDkRlE+nkan8qbTCz+FL9Fam9Kn39zivaQ09Ss1TWPuarKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcrIWe5kGyPvapn39UImlpfu4qEuHx+mmBhUcAMUlq4=;
 b=ucpmkzPGXc0mw+7im9X2IyUI9OdF6IE+jdgHdJPGg14I0xb+XZ6P3AFZ+xJlhnGM8/ZUaWTRJ6gtW6dN5rwb4G854UEfWEqlqK5M5L3bpZ74ttc7dSQIkUu0KWCKCS6PJGWnVQwulhx08MU7i78u6pFENakslLw20Ma69GIXcD4=
Date: Wed, 9 Feb 2022 16:56:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86: Use low memory size directly from Multiboot
Message-ID: <YgPkJkNz6JMoubti@Air-de-Roger>
References: <fe2e94e8-9e46-82be-6e83-391f4709ef75@suse.com>
 <20220209131251.387-1-dinhngoc.tu@irit.fr>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220209131251.387-1-dinhngoc.tu@irit.fr>
X-ClientProxiedBy: LNXP265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74f491bc-f0c2-46c5-3281-08d9ebe4bae6
X-MS-TrafficTypeDiagnostic: BYAPR03MB3959:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB3959F31EC570A528EA7E7A3D8F2E9@BYAPR03MB3959.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tTCtsfWjdlJJVlLA/gaFxBZDqoHXWklxeJbqeCH9tajLZz8EC2R2EJImaV3fXQkfUULWd6nwFt8s30GTG/lAgVuXAW3h06weIa0ORwyaEoTGt+G096CrkPL6AzPmNBwokIlEMQr4a+/pCZS/P5PXjXfuCcDIJrEIvP53HLxSMo1NnTp+MDDCRFmyTWo5C6nqM+efl7dwi/j1PjrLTFqPG4p3BgADA0yX134bVBoVFSTz2N1vowIr/yofvcaiGJu9THcihNp8fV+I+o3UkZxSYqHksXsTDQJkUFWPWKAYPDaH5s+ZIpoQAerbftHiMEyIWCYn4MiqazsDix1ScRutGJ32OSpPUbY2xEa4ySd7m8brJiFP5BsN2eUj8UomHkE9E4GYQgYXuQ53mmdWTcLx37pZyTrzkmIkIZ3bFtPxQxDvSa6M7ry1BuWj+zmMPvU1ynYjKZIewMIJbnuzHRqF41UK4V0ffiR070IVtdm0jLlSCFWgGSSCxjhTO9WuNuqGoOZAiEVWXgrdo0RcoaHeAqjGRv03wvv55ctC18xZfgB7MHVfttEX79JmwTD77VpisYq9e90J+SYhS6Q0iEpAKOQy7BscTqK7wv5e4ygOUt7FllrVNnma6uPrn1rN7JLeziWAnCLdYM3O0g8uTs0clTBtM7ZWNfGJrUFOj9oLTNaWi0NZp/O87+kYKgUj06bF0wA4yuRDjsHVk+3tWpDY8rpUYVUscnXDP/km6ozApn4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(82960400001)(186003)(2906002)(33716001)(38100700002)(26005)(508600001)(9686003)(6486002)(6512007)(966005)(85182001)(83380400001)(66556008)(6506007)(6916009)(8676002)(4744005)(6666004)(66946007)(66476007)(86362001)(4326008)(5660300002)(316002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2hpODJvTGV3RTR6UXR0UWdmd2NzMDdSUHg3dlVIemJKS091V290Rk5Hc2xx?=
 =?utf-8?B?eEpXYjdZemQvdElxOG1pSnVRMFh5SzBrRDVxdlpsZXJHdzZlRXl2cldCVmNF?=
 =?utf-8?B?aU5sTUZ0SFA0b0srZ0xTU21MOFBBVjBHU3lualJSdEJDRzM2eHNaZjFwL0ho?=
 =?utf-8?B?d1dld1A1Q1lmck5EZlBEMm5wUm5SZXNubWpOU2g5TkU2U1kvVFlIOFJQV01X?=
 =?utf-8?B?MVN2S05PQlVlRTFZS0VxSXZybWZUQnFXWTJTS01MVWpBTGEyVm5iSG5nNUpt?=
 =?utf-8?B?cUlFM1Ewd3VQTnhoZEU5bXRwSkF2U3Y2UytQQld1aDVwZEM3QkkzZTJsL1ZU?=
 =?utf-8?B?akZSeVpSSk9oMktmb0ZKajJFTU9ZdGRpeExHOUtxa0RPdUZjRTN0T09hb0hr?=
 =?utf-8?B?a0JhMHFZbUQ4Sk5BNFpGV1lnem0wUzhWamt3TTIrSzY4R3BHWTREN3RRTlZ5?=
 =?utf-8?B?MW9TMGRIb3Z6OENabjlDK3doYjFkN3JMclY4ZjhNbUVKc3hkTGUyN2VFMGx0?=
 =?utf-8?B?YjhpekRuMWRGSFo0VFN6TXJPZXBmWXhJS0lhd0dnV0pyS1hha2hjYjdMNElZ?=
 =?utf-8?B?b3p3THBwNjI5Y2hwN1ZtZnUyZ0JuWEg2amZPVk1HeDlCbE5ENkQxWVRmeGI3?=
 =?utf-8?B?RnhYdjdBV1pIbnRJL2RrdmFkZXd0SWxYSWFkeWEyNWhQc1A3UENrYjFZTkNj?=
 =?utf-8?B?ZjZRejcrSHdJdEllckRvMmVSbzJKZkpqTXRueTk3aUZuL2VWcmRFaDJvYmdL?=
 =?utf-8?B?WmYwRmtLdWVXdlhUYWs3eGNBZUEzUTZvb2tMRGRIWGgxTTdqV29QeTRLZkxD?=
 =?utf-8?B?L3ZFRERLY2xtOEQxR2x3VmZna1R2NTZrU096TFpLbjUxZ3libDVaMlBSRXB1?=
 =?utf-8?B?ZzY2RFVWd2J4czMzTkdodE5HSklGZk9zTTBtUTZyd254WVpzVStXeWhweW5L?=
 =?utf-8?B?NlcwMTViM3dYWWxxOTN6Sjk4anVNbjAyWXZmaFMvMWd0THFBVjRjeXM1aVU1?=
 =?utf-8?B?T1J5U2pSRitsekU2MVVSR1VjbEpmZjIwQit3a3BybnAwMTZKNmhkY2w0Y0wv?=
 =?utf-8?B?VW5pd2E3d0RaZ1JxSXFXbE9yRE0wbXA1ekJNU0lwSDlmVFl6R3BHbnRweWpI?=
 =?utf-8?B?MTlzZjYzMmpncmE1dXloLy9xZUxoWDVVWGdpZGJFeGs0Y1E2UkNzVG1oRDNw?=
 =?utf-8?B?V2NabnR0bEczeXMrUnMwTDVtV3AwUW8ybDFWN1ErQ1FndzlJeHVWMVlTbzRu?=
 =?utf-8?B?bllRT0RrMk9aSm9YUytBSCt6UXM4dlR4dFpjaWQ1dStWZ1owZzl2b000b0FL?=
 =?utf-8?B?c3ZuZkkwWGdsNzJkRWM3WkoyRm9nMTU5M25UbmVGalAvM3drZnhNQ21vVjBS?=
 =?utf-8?B?ZHNsblFJNFBQSnFDNHc0VEh5bnh3bXUydjVPdjZZWEZOT3YwVzhaa1VVajJE?=
 =?utf-8?B?ZWxZaDRvMnl1VW44TklFayt6MzU4WDhjMys4T2NSUDg1WFVUQTIvSTU3WW9T?=
 =?utf-8?B?ZmorZitmWHhmY3RSbUVNTTNERUxYYllkSEoxcnZ5a2FZdUhOcExrZElkQ3ln?=
 =?utf-8?B?VGl4eXhtRzdFS04xd0xuYmpqVnh3TXJwWGRINUZNNlZHNUI0YmpSd1phTmpG?=
 =?utf-8?B?VkZxREpUZEcvMjFCUmNid09ROVcwdTZFSHU0cEsyMGswSnlncTlObW53dVlE?=
 =?utf-8?B?VVN1bFNJZU1iR21LRzRDaFArazhYQVdGR2thLzVHR3ZVd1FuMzd4aGlSTEVZ?=
 =?utf-8?B?akdzbkczTWhFaThLcWZIVDQycXZmQUgyL1lrbjcvbHRRZEtVMzhuOXdKVzNl?=
 =?utf-8?B?L0pRRllJZWg0dnhjMmg4ZURpdkE0U2RUbkJlNElVN0d1WE1CdmhxVmN0eFhv?=
 =?utf-8?B?bStHdSs2dFhXUFI1ZDE2SUhlSnVkSnBoMWRLcnpOVGc0dlVGb0VZNDRhOEs1?=
 =?utf-8?B?QThTdEdoSjdjSWUxaWVZc1BPT2FFWDZpdUMzdElZMi9YYWZ0cTdrdTZmNlo0?=
 =?utf-8?B?Nzl5VUp5dUlxb1ZVYXErMjlNdnExRFc0R0duYldPcUxoQmhBQjlDVlEvVzR6?=
 =?utf-8?B?VEk1N3R2b3lDcnNGOFJ6TjhGQ2NmNlRMWHhZSUtMYyt6QkpDZVh1ZzRXaEhV?=
 =?utf-8?B?S2ZJLytjYkIrbjlRVUJ1cW9GYnhVaHlIWVlMTC9JZ2pXRXFwS2gvV1RJTzNi?=
 =?utf-8?Q?C/N3qTtb+qX/3FoKa3p+u1Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f491bc-f0c2-46c5-3281-08d9ebe4bae6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 15:56:27.2712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llYmSu99lN3T64wA1IIHsgr6wIvIpIcNSd41zbmUGuG87SlH4vKQEzdSFGIqGBu50YOSFMaOvjDoqp2EcLHp+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3959
X-OriginatorOrg: citrix.com

On Wed, Feb 09, 2022 at 02:12:51PM +0100, Tu Dinh Ngoc wrote:
> Previously, Xen used information from the BDA to detect the amount of
> available low memory. This does not work on some scenarios such as
> Coreboot, or when booting from Kexec on a UEFI system without CSM.
> 
> Use the information directly supplied by Multiboot boot information
> instead.

This is missing a SoB, see:

https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Signed-off-by

Thanks, Roger.

