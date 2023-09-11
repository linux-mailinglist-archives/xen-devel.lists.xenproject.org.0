Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DC979A608
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 10:35:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599150.934430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfcNu-0008R3-2l; Mon, 11 Sep 2023 08:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599150.934430; Mon, 11 Sep 2023 08:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfcNu-0008OM-0A; Mon, 11 Sep 2023 08:35:06 +0000
Received: by outflank-mailman (input) for mailman id 599150;
 Mon, 11 Sep 2023 08:35:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfcNt-0008OG-7W
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 08:35:05 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a1ee3a1-507e-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 10:35:03 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PA4PR04MB9392.eurprd04.prod.outlook.com (2603:10a6:102:2ab::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 08:34:59 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 08:34:59 +0000
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
X-Inumbo-ID: 1a1ee3a1-507e-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UazsRBfqTx8cr1eK99X+pTCIyoxEaU4IujXvPNtgUocieQNouixEUWboFoFmMK7xR44LNSyfx40xI6spYpSJB3360ctN4c0iJB85tLG2Px+xUeftvKUzCgssb7e0uI+wxN6IqD2PL4Zbo4q0odTJqAgQrfME+4CCnxHr/sfXK8rBaNVmb5dwBw2rkk+H72LbaTBWDZ/9TZi/4dgH9RdT4BQpb/ZumDUJfy6i7EyskJFsnc86QU6gcb3rHjRWwfzw1+MLf6prajdFKHNtWdqyLPaM1kHjiVP7n61pGC7zKCoIreVoORbE2aK0K5sfjJJ3aKO7BpZzMlWas2uRfZ1evw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USJP1EGdkS7jLRZmFKRSVJ4N5PvGk7QFE6TLLArRbR8=;
 b=cVTemBeoxyPNBdQzvC4PenakFfJS6M2GPzcU2C2/CgLpNQtDt9pIPc7nRZBEPimGJ/chLEQMxlRK2X17IXgoisfZuppeZ93R2I22iimhUkmKQdBBjB5B80qrHE03Qk3AymxNwPzHpOLJzK5pSSOCTuTTUsp4K1ZU4uuE38v3LTmvXb3x9ZjfO+C8mctApEJN6HngtbzAp/fOxSHIFBScN/DfOCd5djJR7orTnVuJmzrMCziduoNXSrypoFybrf6vt1VCaOCiJN2ArIKReuzkTWPe1Ffdn4DrwJiCz8kxmIcRVE5w5FoFII7b0A+HKQP0FzphXjEM4ordwsghxmUWRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USJP1EGdkS7jLRZmFKRSVJ4N5PvGk7QFE6TLLArRbR8=;
 b=0V6vrQUm0+3e4xJ0FZqx5UHZNX4kLUF8iLoGgSOwzQ2gjIk/JWYHRlAcJtWDMAzCV8Mdnl/u+n/KjFqDPC6o0PkdRrIVQAhPvEJGvfYk2T4kWKPEQE2abqieiOh4o3cXn0ksLjW5/7HAIDsZPJ9+pQtVCHt1ZC79gn7r4y+nMiaklpBXbtwzBMLgf6LRdmOcMGgDiF0OU9OzER1+K14nASAM80HGw5TIifzsrTT0NSBRvMPntMR9R16+42bH4l7sHHBiSHB21qjCa66YMz8oQ1p1yaKf+AIjcK8SqBqHe511S99YXc3MIv2ByEW+7Xiu96+GzchwLn7dWn7N/Nu37g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ddcdc075-9d03-f510-8548-058afaffa6aa@suse.com>
Date: Mon, 11 Sep 2023 10:34:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: xen | Failed pipeline for staging | 35949b8c
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <64fed00079054_28a431c94791@gitlab-sidekiq-catchall-v2-85b644cb8c-qlhp6.mail>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64fed00079054_28a431c94791@gitlab-sidekiq-catchall-v2-85b644cb8c-qlhp6.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::18) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PA4PR04MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 875e7b5f-2a2e-4be7-8921-08dbb2a1fc43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pdp7znnOaK/K/e7mgP4Y4KqN7JB1NaKEFeNrf+gTi8SS3hs/aUeMxbqxe9okhQtDwQ0pNZ9wEVC3P5U+MiDiIj/3OMjaJwSXMXW/BGBLGK3ezPty+nsCBC4S6kNecJpMxPc4dXGKpmXaIM5EvGQIQpenXZ4KwM8N2zV7zRVSKKVTqPQ9ScNJs582KAURsJkvGGMdyJJjeRxwFeoJmftB9tty2v0bNtfn45Eoo+QIrtPVhohkL6s3e8gSW7NxV4kGdBQ+GEbYKUTkhgaq/QImZG3b+0zp5dy1BQo2GUtlMz3u4f7rws3v535vvpkrZLOuahS802pgaUTJN2Rxt5oeGpkC15hg97kLbFMqN7Rexh1hbJ6noMFE4M84GGcuu/q++tEoioH9uGmfGIl7VorQAyv1cfr0R+2AvnjuCgKdaQqoxfgbDooqipgXFwv4IFEz+1DNBAHt4NcSDlVMb6aDYtghLemdXwXJVkHKziPbmNVXDED3xooZJs7D9rUfLp08i1hFYZYMqrNIpRNWPYEWV9aBsQMv3xoG/z4VPsbrC+ne4vbeqQ3jgvxA+zpmpfJVZm1oTsPUXDThcYWdZNmVu1FfEIDusvV5/hnDGyxAFzisWY2H7wviUdk4uuonfId1odorG57rML8r6Ze1Esk7pQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199024)(186009)(1800799009)(2906002)(26005)(6916009)(41300700001)(316002)(66556008)(66476007)(66946007)(478600001)(5660300002)(966005)(8676002)(8936002)(31686004)(53546011)(6486002)(6506007)(6512007)(36756003)(2616005)(83380400001)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2gxMXBkUEs0UEFsL2hQZkNBNFVjanhEd3FEcXl2QlRadDVrZmV6S3ZoZ2Mx?=
 =?utf-8?B?VGlJOXBENXE0WnF2Vmg3YTRuTklRS1U4aWJoeW02aFBIVGY2YysvQnZPcmc4?=
 =?utf-8?B?azZBZERMNTRDVjZDazhweERpVmp4VmkwWWxUSkJRWVh6U3paM3JJZHF4TFZO?=
 =?utf-8?B?YnhZQlBLeHI5UjlNN0FlSDNXMGtjOGNGWFk2Q1FjTjg4SVhSclFyTTE3Zi9O?=
 =?utf-8?B?YWpMRWsrSDUyaDNTQ3hYU0ZnRnpXSDAxMmI3eUpPTVFnZmM2NytWWXhTdUM5?=
 =?utf-8?B?azlocGQrWURmZ1JKdS9ubEpXenVjVFZkdVRIK1JBbGJyL0MvcGllRllLODd4?=
 =?utf-8?B?STdkRGRrSXFyc1FienBNYUNTaFIxMGc1WTJhL3Z5eFBvVE5VRXkvNGM3UkJL?=
 =?utf-8?B?L3p6dDV0K3BYV1Y2bjlVUjJvVTBMMkdUQ3l5WnprVWgrUnBvV2ZrYStqdU5a?=
 =?utf-8?B?VlBzUGc2QlJBZXNXOEJReHhBcnRKbE04cU40cGU1NU01SHZya3NqUTJtUFM1?=
 =?utf-8?B?bnQ5SSt1WDhZaDZLTm1Qa0VHRi82TkRSNUErZ3RvK3Y1bVVWYjA5RDlQdGF2?=
 =?utf-8?B?ZHBYN2h5ZVQvUXR1NUsvUEtQZ3BvMFlrVUdBOUc1cHV4aUhhZ3ZNZXBBN2kz?=
 =?utf-8?B?YWhVd0pEdldkWExWZmcySlZqUnNQOFNQRWsrRFllME9uc2dzRHA2dGhWV0hz?=
 =?utf-8?B?R1NNc0UwODV1THA4cFpEc3B0ellGbWdYNWpBZG5BR3FsQnQ2TFp6WDN6NEFT?=
 =?utf-8?B?VGVvdno4TllpOHFlMnlGcENscEVLVWhPK1dySlQwMVN0K0JSUUZlSE5qRm1a?=
 =?utf-8?B?b0Z1OGJrMUlrN0E1dGlmNHRWZW1wa2t4aVY3OTk4MkJhcXFtR1R5TFQrUHZ3?=
 =?utf-8?B?cFhFbVB1SGt5R2FLQUZvVDhTdUkvSGxNOXp5aHc0RkljQ0JkMEttWkw5Sm1W?=
 =?utf-8?B?TndIZzRTdmVPUnYrWmVEZHh3ZGFMcm53R29NK1JlVmlrZ1pYVlZRbXhsREQ4?=
 =?utf-8?B?cDgxcW5XOXhrNE5WazQ2N1BkV2hWVEIzQVpwWFJjYkdqSzA1Wll5VUxKbHhN?=
 =?utf-8?B?OUNhMTROM3RlVnpnTmVJbzVDOVg3Qk93b2YvbzFmdzBtT01Ra1hNWGU4djd0?=
 =?utf-8?B?Q2owWFlaaUFrbGJSd2pvQlF5aE83b1kyVVBWMWNUSnZuaVFOTk1vNmFtN1pB?=
 =?utf-8?B?cVY3SlduWXVDU1gycTJxUnhiQVdGNFhzOGhXbEtFamRIZkZaVWFVK2JlOUps?=
 =?utf-8?B?MkczWDhQck96ZXNHVENHVDJBM016aVJiclhkSEhFQnFHdFF1emtKdDhDdEJt?=
 =?utf-8?B?NXE4cHZkd25rSG1yN0FMTGRFMDVQNkNqQktGaE5RazZLQWVqcHZHNGh6YmUr?=
 =?utf-8?B?UTJDUXdiMXNscE5Sc1VYdTFwM21acndDWFdkbHU4U2Rra21jVHpBd1RFREFK?=
 =?utf-8?B?YTlIRDB6YlBqUEIzK1pDRU4wTm9zMzZOd25IRXYyQnNhQlFsdnpjaTlPclc3?=
 =?utf-8?B?bTMvTC9GeEZuMFk5dUNTS1FLekt1cHBWRXZsa3JQaWoyNkI1UUpkVEsrZi9t?=
 =?utf-8?B?VzJ0S3hYQWRScnAwWkVDR0tNTFZvMWI0SDBmZ1RxWkFSY0xkdUtmY1BLdHMy?=
 =?utf-8?B?VmFKQmJFanVMY2RGeFo4MUlIZ01GS3ZOZ1JqOEJ4U0tiNTdhOWJHUStXbVVp?=
 =?utf-8?B?anAvTzBCYnRhdGwwRnpGaWJLUDRmQ0tSVi9TNTIxYUNpajBJZ1ZnaGpRVlpW?=
 =?utf-8?B?YmdieDNPb3dVeEJVVEJ0dHhSVkdiUTVtR0JPbCtETzdKb3F6djZxNE5aK1Zx?=
 =?utf-8?B?ckpCMWtxVkV4V0tmVU5vaVlJdXV5N3liczRxdHgyWW05c3luaWhBYmx5aFBW?=
 =?utf-8?B?S0J0cmVpWnF3aGVya0QxVWxnUlgwZWI4alQ4VjdCaUVDVVREaXFaMGZaSyt1?=
 =?utf-8?B?aEVEUktaSXNIMUR4SkpWSzkyK1k4cWZxQkZjTVFJVVVPcGNySUxscEoxVit2?=
 =?utf-8?B?OU1VbG5EOGxZeFlia29oT0Jyd1RoOEtuUHMxb0xnVzdPWGx0UXV0ZXNzWDBs?=
 =?utf-8?B?YVI2aEkybkIrYWU1dlFnQ285TEdRck5JalJBWU9PK28yS2pMTDNyOVkxSzAy?=
 =?utf-8?Q?NV+XcxNMptT3wU6TcrbkPLOCt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 875e7b5f-2a2e-4be7-8921-08dbb2a1fc43
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 08:34:59.5995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOsf6AM0z9TFc3a970qjy+pGqagtP8DWvZs2Gt8HB0MNUeZUi/XiJpb9gfZcJizGeuVgw49S9Jr+dxk+s78VUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9392

On 11.09.2023 10:29, GitLab wrote:
> 
> 
> Pipeline #999254173 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
> 
> Commit: 35949b8c ( https://gitlab.com/xen-project/xen/-/commit/35949b8c58cb6c835da1fdd8843ed51727e654c0 )
> Commit Message: x86: change parameter name in {hap,shadow}_trac...
> Commit Author: Federico Serafini
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #999254173 ( https://gitlab.com/xen-project/xen/-/pipelines/999254173 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 7 failed jobs.
> 
> Job #5056039848 ( https://gitlab.com/xen-project/xen/-/jobs/5056039848/raw )
> 
> Stage: test
> Name: build-each-commit-gcc
> Job #5056039841 ( https://gitlab.com/xen-project/xen/-/jobs/5056039841/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-gcc
> Job #5056039844 ( https://gitlab.com/xen-project/xen/-/jobs/5056039844/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-gcc-debug
> Job #5056039915 ( https://gitlab.com/xen-project/xen/-/jobs/5056039915/raw )
> 
> Stage: test
> Name: qemu-smoke-x86-64-clang-pvh
> Job #5056039910 ( https://gitlab.com/xen-project/xen/-/jobs/5056039910/raw )
> 
> Stage: test
> Name: qemu-smoke-x86-64-gcc
> Job #5056039912 ( https://gitlab.com/xen-project/xen/-/jobs/5056039912/raw )
> 
> Stage: test
> Name: qemu-smoke-x86-64-clang
> Job #5056039913 ( https://gitlab.com/xen-project/xen/-/jobs/5056039913/raw )
> 
> Stage: test
> Name: qemu-smoke-x86-64-gcc-pvh

Network related errors as it seems, from peeking at some of the logs.

Jan

