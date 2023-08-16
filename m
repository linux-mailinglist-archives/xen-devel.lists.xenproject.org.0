Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC577E6BB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 18:42:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584827.915670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWJa7-0006Fy-8f; Wed, 16 Aug 2023 16:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584827.915670; Wed, 16 Aug 2023 16:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWJa7-0006Dh-55; Wed, 16 Aug 2023 16:41:15 +0000
Received: by outflank-mailman (input) for mailman id 584827;
 Wed, 16 Aug 2023 16:41:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wzLC=EB=citrix.com=prvs=585ac1913=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWJa5-0006Db-Vm
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 16:41:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2c2d666-3c53-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 18:41:09 +0200 (CEST)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Aug 2023 12:41:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5930.namprd03.prod.outlook.com (2603:10b6:806:111::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 16:41:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 16:41:02 +0000
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
X-Inumbo-ID: b2c2d666-3c53-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692204069;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1I/oa+HA8alMNa5YamCPESHe8lAmuHeV1fV6o41DL1c=;
  b=czrB83hsdtHqqaNocCI1YK8yhS3Eeel4KikroJTE/UZ5ZF37nXmOzCVJ
   FOYu2gme80IJ7B+gGzDcArDBvIkIWppdwlzweIvNxOm/tgdlWPXN2nnEO
   pXTDkZ5Mfx8Yx8So3IBUBAq9sJ4K6tnLfa9Cd5DftKKFLj31glAjaaqbb
   8=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 119551495
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Wr0OP6MOEjUDTqDvrR2SlsFynXyQoLVcMsEvi/4bfWQNrUol1TQFn
 WYaDWHTPavcY2Cgco0kbti29h8P65DTz4BnGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tI5wJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rZ8Cm5J9
 fUBEmAMUSyY3Oaa65W2bMA506zPLOGzVG8ekldJ6GiASNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxujeMpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxHKmBdtOReDQGvhCu2OD6UojVDkqEny2juWFjm/nfdsYN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWWRGyc8PGIrDq0ESkTMWIGIyQDSGM4D8LLpYgyilfDS4hlGavs19ntQ2ivn
 HaNsTQ0gKgVgYgTzaKn8FvbgjWq4J/UUgoy4QaRVWWghu9kWLOYi0WTwQCzxZ59wEyxFzFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:TtftwKHnphHs4UXCpLqE5seALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5OktBpTnwAsi9qBrnnPYejLX5Vo3SPzUO1lHYSb1K3M/PxCDhBj271sM179
 YFT0GmMqyTMWRH
X-Talos-CUID: 9a23:xK2uuW5PDFT9UOqus9sspEUfFccle2TnnHbvH1TjDUpCb7CzYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AL5Mlmg5H/Bh8NZTIDB2J5zwPxoxT3bSBLnBRtal?=
 =?us-ascii?q?BnMSrKRB0Gm67hXOoF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,177,1684814400"; 
   d="scan'208";a="119551495"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Coy9L3xvnh0Pb0HHEQW1w/aR7O+MiY7CPS9ZRhoufeTpbg/n9rgjISPK/zoBXGiNGsYJcL7Zfa4mqkDNo/qTXgIvL4ckOAGgJcBgRYcW0a4RmvotY65R9gfoihK66XovuukHUuTO7jR10nJ9U7Ftb+nrYLPHnl50SrZb2iQ4dZxOL/fTB7seTAB7NjD3UfMdUWUp0FlbsPy++0pmFYdC4idejaZMNvEmuw3avBe/HgcZZ0JVZ7Yq0brnv04qKS9codRKJ6AYqbq+Fjj3S9d4pnlKEQLVDkiMe+F7a50NHjVRnSoLtmnaWCtN+q7aQcDHdY+5oCcNaQI6EJ7dLs/kuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FS2bbKXyDp42lV0RI7bXU1c7JdM1KgxAv1nTGVl/wU=;
 b=TTjdie5Z6+pGYTkunxbg8yB/eH2Y6WbCMXkBymE++z5ubgetefNOAPqhBS4o3U+F4mQ1PTrP6G1fqOAUn/zzR9wLiY6+R7p8W/7chmQ4fP4wzX4QPraSHS2gcgpt/Z+LhbmXab0gT3fGRbONhdhjfqfFIiN5rSVThpc1eIHu2yBdeMQrj4U60uEh9UhysPOO4zrm9WsoatETnRml42cPW18+3ZNpaDQ5Mn9L9Y8KOjNypcq5s/hwpZX4PTD7iRCKnILIhOMV0ij6vQBUc6vao0KriYmuFHso8GgFJjOjVZOCH1JaG14fhroj8Oahv2jpj51sY+7Pb6qn2BMZEKCmFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FS2bbKXyDp42lV0RI7bXU1c7JdM1KgxAv1nTGVl/wU=;
 b=FTqXqUC4d4H5lm5TcmSRR3pscXSC+GKynOrb0s8owrUQR7NrmhgR5tUr2NkcsYWCfcvGYvFQ7l1XARbQVCPN7TvXXAFKkQBcns8gCmJdVdZW6Mgtt8MVPY4imX46YMWBiS9KWLDnxppVW+8taRud991xqe3wUJor/XK73XkYVug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6413e634-62a1-b2b3-47d7-6467926db392@citrix.com>
Date: Wed, 16 Aug 2023 17:40:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] IOMMU/x86: fix build with old gcc after IO-APIC RTE
 changes
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <bf497b79-7661-8fa8-6979-90f9951c8735@suse.com>
Content-Language: en-GB
In-Reply-To: <bf497b79-7661-8fa8-6979-90f9951c8735@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: d9aefb61-9feb-4c3e-0c43-08db9e779368
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nwVryYOF4Y2+g9umgzBv+YrtrIBJxrGJWdTH2QckRYpjvIuwGtYQgdHoxB8lRbyKG8qqSQlFUyclu/YzV58MUY4xgA85uNtz/v07Mk1d9gYdhRb4gIjAkPx1q90kHWtByB0W9apWnD5jsuCOSEOgNWvh5dmTssJh7hXmbAitLRCcmSxbf+MlejDilY7hHrN5J+XfJRQenIheGjIARvBCMOhwQrhfgMKWpDPu9JIuhkiJovVwsCZjIK6sTKTSnGjMCkzgWuNUsZCPbtCMNovqVwJTDszVDBy1k0WqvWzyCpGrxlqxXpUN1GrxVKTXQNY2ZIQiQNr1S2AhSJ3v9SHEk/H0ZEhdkKLX48ZJXdnly4r/qqYYX+Ffzx7+Sz6qj37bV9AG/0HI9MnYvBI0aOUtRM4pP4YFvMUOj7Hbmp8UaGAEyveUowUZbXFYLFQ/27NgcWIu6alI/b0GBRjbRwxhVTmaZsMEi1rUVV2JmkAh5EV/rOBmuxfRMinvLyt3nwIQfRzcSapjZXstqQwKtjtBTl4CMv+ijBwDpSkp3EHWiCUn0UOMPpDvB9HcXVr7qoVk0qk735OFORjqLdU/BUb87KkDMeHLFY+GFycVcwn5dqWDFMgNKKmAZZ5U7xfF33fathjr/+gjuiuBTY2StWMNRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(54906003)(66946007)(110136005)(66476007)(66556008)(41300700001)(5660300002)(38100700002)(31686004)(8676002)(4326008)(8936002)(82960400001)(2906002)(4744005)(83380400001)(26005)(478600001)(86362001)(31696002)(6512007)(53546011)(107886003)(6506007)(36756003)(6666004)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rll6Kzd0OFZzZUo4Tm5zTVFnRjUvdTNpNndYWFZGemRzOHpCTHBEbllrNlpV?=
 =?utf-8?B?QlFJZnhYV0psNWxMN09WTUlISzBwc0Z5cEg3S0F0SmZKMzh6V0xpYnhoMHdM?=
 =?utf-8?B?dVp0OHlBeW9wQS9jZXp4NFM2aEprRU5iUm5sL0N1YUp0aTY1SDJQWnhPQzln?=
 =?utf-8?B?OHN1bUdFaTMxOTZ0bkE2WXdxTFVkaFZDVTd3bEhyZjJXNDEwQ3BkcS93UnAv?=
 =?utf-8?B?N1VkeEN6b0lJN2cwTDB1MExIdWFwMHV2d2tEN3pkS1ZHUzJoOEluZDNpREww?=
 =?utf-8?B?NkVLUGFvUjFUd0E2bE9mNzFxc1QvSEdNS3puOGl3WnJnL2VXQ255Rk9wSjUy?=
 =?utf-8?B?Q0JEbG5wZ21ZdkprVXgxUGRRcGorMlYrazJ4elVZTVY1YWZpa2drQlRzaVJ3?=
 =?utf-8?B?NlNwVmNqS1p3dTZCK2hWa1NyODNOMXA0elVzNzF3Z0RCRmlNMlBqNmtna0o3?=
 =?utf-8?B?SGJqQ25UdFJudGVnRk04TG81UCtOWGNKQ1NoWHcydExHRFhaeTJYd2RCdndo?=
 =?utf-8?B?eVdIbnhFTHF6QWhJdHF4TkYxZ1BmUkw0M1VKbXZjalFSaXZiZ1hVWFByUUkr?=
 =?utf-8?B?L3FiSnc2ZTQ2eDRSajMrcXl3QVNYb2psRG9iL1J2V3FBVU00RS9UYk9oV2lv?=
 =?utf-8?B?ZWhpdDVmQmVOT3hmNE9PNHBuUFc2N0t0TkRLemR2VnBvbmVYblJPK1RJdzNa?=
 =?utf-8?B?cFpOTUMza2UvN0hacVhjVURkQzYwdXpvQ2hITVZLM3lzcnBXT3d0VGFmWDhN?=
 =?utf-8?B?RjVMWmZXd3AxU05Mb0owZCtkSkdtVUhPYUN3NDJiK0hrekh6clpoaHBZczQx?=
 =?utf-8?B?RDFTeFFzWTRnMmQ1YlFIanIxM1pPSkFQWm5tOFdsc2xva2o4cjM2clE0MUpm?=
 =?utf-8?B?S0ZjY3VpZnZ3cHk4MTZ1TUJHQWJDbW84WUp5NzNpK0lPd3cwNlF4QmJ1THpF?=
 =?utf-8?B?ajQ4VzdkOFNNRTJ6Mm4vNXY3U1ovUDJidUIzTGp1a3cxampkSE1IY1V3d3di?=
 =?utf-8?B?R0JwSHRndTBjeDhsc3MrZ0JxeFcwNks2MERGY1kwSXJFeERQTVUzamkrMHJU?=
 =?utf-8?B?dWFXZ1ZLb1d5UWNMSGdTQ3pOQ1BxaGtyS1hsaUxUOTlZbEVCZmp5N2FIb1pP?=
 =?utf-8?B?azFjRG01YWlwbkkxTHpOeVhpbjYzNncrWWFmVlBQKzc5eFlFL2pvWEpqU0pW?=
 =?utf-8?B?bXlNbWYxSzhSbWxwZWozbDJkemlhUjVQVmt4d2E3aTFEb3Q3eTRmSXJHcWpl?=
 =?utf-8?B?V1FJT2hWRnRHbjZ1c0pTVXNvR3FEb1R5L0FpQlZBY1pGZGE1cXJrQVJ2U2Vt?=
 =?utf-8?B?MkJ5cTJyRjg5TFBGU0p4ZitWVjgyOTFCRUV4cGxiakpWM1BDYXdyVXhWM3pZ?=
 =?utf-8?B?RTFaRTJjNS9HcWljY21PVXpRd2J5YXI2c2xmMGVTdXhQTnJhSk1lQUVOTzRr?=
 =?utf-8?B?ZndYbzdJd2tJQlZnYWdnWHRSaGtvdEFNcnEwUThmZGs2L0xRbHVVWit4eHRJ?=
 =?utf-8?B?d1JsWXl4djBMK3duNmU0VkNaMjFIYXYvNnRkd1UyVEg3akh1Z3M5WXdDS0s3?=
 =?utf-8?B?UE9ZazQzbncwQXU0d29JdTk3VlE4STVZaHdQc2JmQWVDc3ovcjREWWMrSS9B?=
 =?utf-8?B?S1ZUaTFlOUZaN0RQT0R4L2J0QUwzZm9qRFl3aTJOVHIyMkdzUTNPdXBCbXBM?=
 =?utf-8?B?djN3RWlRSXIrSXlXU2JBdjJmelEzWmI3VUx4T2s0anpLdHp2U2tQak5rQ2x2?=
 =?utf-8?B?MkFNOTd5Q29IRnhGVHdPSzk0NEw3Nnk1ai9qYWZ1eGdSa09Sa1hLZjJMeEZB?=
 =?utf-8?B?R1pSZDlDYnIvdnNWbFk1dWkzVU5WVVNXb1NvWmRZeHJoYzBXNFpHV2N4TTZl?=
 =?utf-8?B?YW94U1h1K3RwN0RaZE84MWJzV0g4SkxzT2Q5ZGVmZ3l2enB6bGZSem94aVNB?=
 =?utf-8?B?dVNlNXN2MG9yQTd0MDh2OGw2d3ovN0tQOUJRWDZkR2dLZDFkNXJnY2VzbWls?=
 =?utf-8?B?SU5FTVJtRlRMSWZ1VjdqamE5eldrWmRhMHRYL2QvTFdxY3YyMlUzdHZRYUEw?=
 =?utf-8?B?RU4yQSt1b21HN3AxSU9wRHUxRlJzOC9MNVZYNDZhNTI3SmtnUmY0TWx4QzJO?=
 =?utf-8?B?cXNFUnFhenhWYmtPT1J6TlJHT2h4d0VDb0RBM2wrR1I0QXltdGI3ZWVmdUND?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/QupLGnsSJEJG5l9woJofl5LJ1sN94ycb8RKtP0OhbKk0VI9pSQlwVFI0htMnG0ugRUrsQmhPXsf7RLzbGo3Xz1fjZ2+7Eaj1qAuS5VLEf3qudjauXSsaVPbUcnOE2MrFFpkEhII9UYsqW6dW0bs33e1HbjUUzJIdSxIi4r1xZ1I39JLlsISXCgaSJ4sdzd9BNS+Xr3OtM4AQgR7Wf1NKgtJTUpfVOR4iLsbYyIiIxAcLOx3GMpQ4tLpM5aN5ZmzSCzCVbi5ctmIdNA5ME58TpcsKQlnoOZ8qcnAfvVjApkXRPYzYJizM5hrEXL6Rskjz5scETH8jFHybrsFIy77EE+gxWRyKyixMuC+EdQsmk1fdoW31MI8Ebu7v6j3qZr1ce6ILBFcl/5CBiTa441jYGB3ZABUw7oAaplIu+VWJQcCESAigS3uGXrkGmt0BuajuAkgQFwSf8AUDGycjHRTb2J4IcUATWQq8sfCe4T9F+BnNzrNfEx+qTJmPGLA+Ukt7+EK2VC4JykEyHpfx7GsrXHWXeFKd3x0u8DWbecxYdRfXBNqrpE71KQOXELmqbAbxY6400ypy8g8Uq4gb6eGf5YNCwsuvjs0dXAy51yBhfPrLfD8rI8Ljo/5qm8ZHVz9QEk0XwlVBH1nmfsx0UNoBWl89Lo/RU1D0tkqPEM/e7+GNLIwdvRwg/6atfys5Dam0cqdI3UvkcQ3lRArFIHi7ler/pG64/XYvMk+nYxjGs0vAsSOMlfScgrFH4UpQDH7DTM+5tJZ1v1CbkihDLwohM3O/s3sopmt5oax2i3maCCbm2AM4GQS8hV29L+03nxc8SqHPZv95WM+JgTS+kyGzw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9aefb61-9feb-4c3e-0c43-08db9e779368
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 16:41:01.8457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jij9Hg9PoFqizYfY55Y4poq1crB3He32dzonJv2iWHRuFatKNp55nO98eLBdeCiA1I9wPo78Q/UPONzZGh/KRD/HrcbcbupKZxwUun+VRx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5930

On 16/08/2023 10:51 am, Jan Beulich wrote:
> Old gcc won't cope with initializers involving unnamed struct/union
> fields.
>
> Fixes: 3e033172b025 ("x86/iommu: pass full IO-APIC RTE for remapping table update")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although

> --- a/xen/drivers/passthrough/vtd/intremap.c
> +++ b/xen/drivers/passthrough/vtd/intremap.c
> @@ -432,8 +432,7 @@ unsigned int cf_check io_apic_read_remap
>  void cf_check io_apic_write_remap_rte(
>      unsigned int apic, unsigned int pin, uint64_t rte)
>  {
> -    struct IO_xAPIC_route_entry new_rte = { .raw = rte };
> -    struct IO_xAPIC_route_entry old_rte = { };
> +    struct IO_xAPIC_route_entry old_rte = { }, new_rte;

Any chance we can make this = {} while at it?

~Andrew

