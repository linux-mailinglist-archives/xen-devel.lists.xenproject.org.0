Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FE3325A18
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 00:15:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89999.170125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFPqw-00085n-MT; Thu, 25 Feb 2021 23:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89999.170125; Thu, 25 Feb 2021 23:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFPqw-00085O-Ii; Thu, 25 Feb 2021 23:15:26 +0000
Received: by outflank-mailman (input) for mailman id 89999;
 Thu, 25 Feb 2021 23:15:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3W+l=H3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFPqv-00085J-G9
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 23:15:25 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ff15e28-a158-464a-b93e-90ff139074d5;
 Thu, 25 Feb 2021 23:15:24 +0000 (UTC)
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
X-Inumbo-ID: 5ff15e28-a158-464a-b93e-90ff139074d5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614294924;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R10X9M1b0GBXkPrm7zHmbiYNEWQ49Xj8LQbQMY/Ungk=;
  b=Pu3ya1CnvTvoDxAr6/ZzPlc1nvDweUAxCvwylaBs61g2NDtohMvzmqBj
   UNBJed30TjE6KHZ9vVgLbVXXaywc3LK2J4CLM4+Y578sxd8Y3S136ALg3
   4d50nfC3rdwoK3LrL29BAdow5s689vT3YToUZ/55SJ2bTUSk81ejO+wcT
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RcA/4aZsQLkKV5IyqIhyU8SxcfoGrv7hOo4OoyFGs360lv21b//ZXoJTkJq9oLmalQE30gLMo1
 ghjePXEyRGh+0fS6Da1YuBdIt+2FokK77HNFhU8ORXkc48kGvCnhqVix9CXkCicD8Bmead4FKt
 +O/wI0XofRFDdDWE7cC5bjSvA6NH1LoJ4NMhEXGQyrCdRtwG9JVLow1og9Eu8CfFEUyGgYtQwg
 kl5fEnmTclyAiNW7gqDKFWGdbu/7H2dezXvXdUOef6rUMEmAV4YM2O+NA7eU0CF4CyVbakqsIn
 Rns=
X-SBRS: 5.2
X-MesageID: 39461986
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,207,1610427600"; 
   d="scan'208";a="39461986"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AckXllqC29DG4hA2nAeGGje9HsewVmQJJS0GLP7ajbGT8blpWrnPdLKMzsN0k88UQPUX4y+h5hasUFgmZE0Qlpj4B/zGegMCG1eURdWjMS224xJFzGifq6nHcmmPPoE+UIPr/T34GW1zDKJbfPa6ip5rkmlsZ0Jd3vJFaN3g/URXj3oxcrbpuOT7bvpp+PgWt1hMr6ZjYoH/87Ub+YpCorqZN7e2msyeO1EYj2y2mn9RBGUjF8BX80XEAgP0tef0YnPPvMyXwy+JotwocWkFfTxQHyiZjs609/T9o3AdWYz4AUO5YfoVdYejOuiDKexant5auSWdzWy63TXM3sGl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iS4d3V536nQHSLVDQ4f2Rad+5QcRgjHc9Atug2YiTxQ=;
 b=UH7uPkgTFDu+PuPSAFXbXzXJSoStclX91yKSw27c0u9RTJmVYMeFvFvM5IavlHgiSqSwhupz+3ibnNpMjILXhFnMOVt+FQwB8C9777UsgIhRUqxSoqo5SY1uEyjtDg0vVV27G+bD6DrlRwDV66bAeb7qJVwJgkHWsIN5AqwaSDJE/UlOnA+kqs4MTg22Ly5/OQiG6eZoSUHk4WPTS2B75FEOOc+xNbpC5Iw3UTWJI3niCpkgORPyvOHHJRdkfOKCjov7a7bh23zH6aUHJ55jdBA+6Wz/N9XD4IsDiD0YBdebiqaecM8/lplF4dd3BEsIz+nZtQeIOqHB1fRrcxGddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iS4d3V536nQHSLVDQ4f2Rad+5QcRgjHc9Atug2YiTxQ=;
 b=PF0x05R9u3S/uOLguJoyyrvsfwrp9TH10x/V5z6Qe1ZRIiaaoT5ItcV1uWSivNKlutVUOu9Oc/6NG+hgWcdbx2NxW35zo5FsNiXIVQlF7qC0GlJwFoHY8dD+iIyHERbm81Y+vCGRx9LApk5CzM1ZmBkIegQBM1PBQqReO3MV7qc=
Subject: Re: [PATCH for-next 5/6] xen: Add files needed for minimal riscv
 build
To: Connor Davis <connojdavis@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Bobby Eshleman <bobbyeshleman@gmail.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <7652ce3486c026a3a9f7d850170ea81ba8a18bdb.1614265718.git.connojdavis@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9b441529-c5a4-4299-1155-869bcdab06b0@citrix.com>
Date: Thu, 25 Feb 2021 23:14:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <7652ce3486c026a3a9f7d850170ea81ba8a18bdb.1614265718.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0449.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24421eee-5b93-4f70-dfea-08d8d9e336b1
X-MS-TrafficTypeDiagnostic: BYAPR03MB3862:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB38620941D34AA3E44D824D89BA9E9@BYAPR03MB3862.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t0Y3b4i61eQ3cIAozsIZT1fMSMdh5A47ISmqYFf1+agZjhd/zHBv9ticC3rmrpcqbdOGRROIIA7alU/jFIFvUwwJDp/BYBAPXjSvpqbgf2AfvAFKnr+eIuppdyao3Zoi4ipg8uS8tCI2loHKMihy34tSpqIvc+IiUs4BYvvDgFHVSk2zi5+XJIwk/WsLz9RPL6Qivu8wx0QIiPn60y62iyJA1484ZQflKYLo43UUbJgs0UN7pI0gt4lCxrD4sKtJ4SVqXzbLwQktwh4yhttivbvKEej1PRxGSGC0K+Knn1oreUNEFd+/UVpd1sr717K0fAUiee+jvfZ4JXsslQyjYUqfTtsBv5QaZ9Zo39kZOLb9PWGQzKBgf/ANKICTRhW+IdUV8C3pVMUoDQWNPydN6rbT3p4sbWr3GWtukngOqGOR5QhoUR6gyaAqa6lGQGlCsFJ9BLNpnFSn1NCDOASmJ0dlL6NXGA9BpgK3g65wmE1unjGOI4/uTXX1n/UWVPW5t8cy7P7WU5C+k5q0VrzWLsFWatLibq76haY1InwPrKgbpecbY5/o+05RLeRNMl52H1ufWvqSvX2Yc50Op0SCd+FlfTBbSYkDS/pfl0LYd04=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(54906003)(478600001)(66476007)(2616005)(6666004)(16526019)(53546011)(26005)(31696002)(31686004)(186003)(7416002)(16576012)(86362001)(4326008)(2906002)(83380400001)(6486002)(8676002)(956004)(316002)(8936002)(66946007)(36756003)(5660300002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OEYzMEdLNDQ5RElvUjkxamZqK291TU4rem5wNGVXa0lseVc4WjEyWXkyS200?=
 =?utf-8?B?MExmN0Q3b21hYTZOeG1HRUFvMGVwU3VzNGVxelcybGVsYTFHSHEzNndEbHNk?=
 =?utf-8?B?Y0dnTDhFclVvdC9jWlN6MkdSZ0JwWFc5c1dlTlBYNDVtT3l2dTRxRTQzc2Mw?=
 =?utf-8?B?a2pjT2ltV1BHNlRrQ3lSV2RsZmtVRjM5NFBaQXQ0eDhUQzVBTlF3Z3ZzMUhG?=
 =?utf-8?B?R2lCZEdWSVNsclZMdHh4Si9MV1ZTUVF3NlFzWW1JTVh4RjZCZFQyOXZKMmFw?=
 =?utf-8?B?NjRLY2xIUzVhRFNiSVdpZEREVXdPMTl2TC9JLyt4SDJJaDdndDVQM0pkWFpj?=
 =?utf-8?B?K3Q3b2NHVlo5elJ5Tit0SWs3NUZ6VVoxZ1c5SmFuRlBWWWdGc1doTk9ZRHhM?=
 =?utf-8?B?SFpEUElFZjNCVTgyaDBmR2FQNFE4ME5QdlZjUEZvR25PRXN3UTRHY0RiY2JU?=
 =?utf-8?B?T2RKb21xalZneVVuc2twNkFDKzQ1dUxveWVxdVEzY2xEb1A1eVkxY2lER0N2?=
 =?utf-8?B?VE9XSjlKTXFFampXZVlLYmJSeWlxNkZ6aWhyK2JQZEl0b2JJN00zTWVDYVl5?=
 =?utf-8?B?WU8wVDBXMHU0NG1YU0V6YXljeGlzWlhGMWFaVW9Kc0JacGt4Snl1RWVOTUVr?=
 =?utf-8?B?L2psdHA0Q0s0R0ZNQnFLcVczVG9WcnpKNlVqTlR3aUhyYXlVVmRGblVqSU80?=
 =?utf-8?B?YnZVa2lHWTI2ZityQWN4NEY2SWh2WWY4NzlNc3FRODFvTFUrSm84aE9xcksx?=
 =?utf-8?B?U0xEREorU2FabTRZRE5Remd4K2hsbzRQODlWaElIZ1Z0d3Q1bmtpK3pnVEJ6?=
 =?utf-8?B?SGZQb1Y1RlhPUDVLRVhBRUd0U0p2TmR6MjVwY3A3MVpzb3g5WFFXeDRNcVJX?=
 =?utf-8?B?b0hXcnBNcnRDK2c0djVMR1l3cGpWWnhZSXUzOUd6UXk4Y1JnMXJMOWJyUWNy?=
 =?utf-8?B?UzV6dzNhc2hZUW9OZWZINXlaaEJ1eG9zaDYvRFlWMHhGQ3U0TFFPVkNSYnhi?=
 =?utf-8?B?alUzWC9USUMxOHhjRkU1MWZvbUtsOU9rYjJIU1J1eE9qL2hvNFdUNXFjVm8w?=
 =?utf-8?B?QUh0WVBGdEFQVGQveFJudXF4WFV0elZ4b0w3TW5nMlNIMlRlVGVHK3E5Z2lM?=
 =?utf-8?B?eE9ROUlDZTk0aDFrODQvdDJpd0FNYXc1QktzQlV2dlRKdVJHc29xRE1YaXdO?=
 =?utf-8?B?dE94TFQvb2pHZzMvOWxsS0Frb0VNMTJLZGswRk5kY0tEUVc0RXdHQjJwcENn?=
 =?utf-8?B?UWpEa3hVemhCYlJFSjVKcnJCRTRSc3VLdGRjK1R4T0lCa1RDMmU2OGxoRTlQ?=
 =?utf-8?B?UDJMSmkwb1FwdkdvQW1QblBkazdKanMrN0JVS3RvMWpJaVFMT0JIV2M3U2hT?=
 =?utf-8?B?STBVWE9XT1dxR0ZuSVN0cEdUY0pSVmVDamkreENTQ0NTWEJNaVJzQ01hSTc3?=
 =?utf-8?B?ZlJVbENNUngyNzBMVXZqQVdySnFkT2YwTTAzZ1ZncHNqNjBlU21UWlJIbXNh?=
 =?utf-8?B?TEQrMTFRT3lSUFZmU24zemt0ZTNFWlpUVGtlU1pzdUJxSXp2TGJWNmUvZEoy?=
 =?utf-8?B?d2xRN25RZ3U5TlZYTGh5aDNEMzVxZTNlRUtpTUE4Y3phRWc0M3Y0YUdJb2ht?=
 =?utf-8?B?Y2c4ODhpYWVxaWQ4YTZuZWJYZzZqQ09VQnBHVjkrOXZ6SmkwVnA0QUM1Ukxn?=
 =?utf-8?B?WXNlbmhlUEphS0MrK1ZJbzJDUjhwRzVVOU0zbE9Ba1h3ckJlK3A1MktRUFN5?=
 =?utf-8?Q?7hpM0B1dxibgWjBvqvEU92V5IPT4PIskyF03Kw+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24421eee-5b93-4f70-dfea-08d8d9e336b1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 23:15:17.4503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCtia5cu2otTdreFXOSuAluM5qlOaThOBCtbAKk9eXpvsUM4Ik9qmbHYGKcG9MWMoWyjqhF1NCufmD5OZGSmdEYu5l2UvmvQqKXRzN84P0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3862
X-OriginatorOrg: citrix.com

On 25/02/2021 15:24, Connor Davis wrote:
> Add the minimum code required to get xen to build with
> XEN_TARGET_ARCH=riscv64. It is minimal in the sense that every file and
> function added is required for a successful build, given the .config
> generated from riscv64_defconfig. The function implementations are just
> stubs; actual implmentations will need to be added later.
>
> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> ---
>  config/riscv64.mk                        |   7 +
>  xen/Makefile                             |   8 +-
>  xen/arch/riscv/Kconfig                   |  54 ++++
>  xen/arch/riscv/Kconfig.debug             |   0
>  xen/arch/riscv/Makefile                  |  57 ++++
>  xen/arch/riscv/README.source             |  19 ++
>  xen/arch/riscv/Rules.mk                  |  13 +
>  xen/arch/riscv/arch.mk                   |   7 +
>  xen/arch/riscv/configs/riscv64_defconfig |  12 +
>  xen/arch/riscv/delay.c                   |  16 +
>  xen/arch/riscv/domain.c                  | 144 +++++++++
>  xen/arch/riscv/domctl.c                  |  36 +++
>  xen/arch/riscv/guestcopy.c               |  57 ++++
>  xen/arch/riscv/head.S                    |   6 +
>  xen/arch/riscv/irq.c                     |  78 +++++
>  xen/arch/riscv/lib/Makefile              |   1 +
>  xen/arch/riscv/lib/find_next_bit.c       | 284 +++++++++++++++++
>  xen/arch/riscv/mm.c                      |  93 ++++++
>  xen/arch/riscv/p2m.c                     | 150 +++++++++
>  xen/arch/riscv/percpu.c                  |  17 +
>  xen/arch/riscv/platforms/Kconfig         |  31 ++
>  xen/arch/riscv/riscv64/asm-offsets.c     |  31 ++
>  xen/arch/riscv/setup.c                   |  27 ++
>  xen/arch/riscv/shutdown.c                |  28 ++
>  xen/arch/riscv/smp.c                     |  35 +++
>  xen/arch/riscv/smpboot.c                 |  34 ++
>  xen/arch/riscv/sysctl.c                  |  33 ++
>  xen/arch/riscv/time.c                    |  35 +++
>  xen/arch/riscv/traps.c                   |  35 +++
>  xen/arch/riscv/vm_event.c                |  39 +++
>  xen/arch/riscv/xen.lds.S                 | 113 +++++++
>  xen/drivers/char/serial.c                |   1 +
>  xen/include/asm-riscv/altp2m.h           |  39 +++
>  xen/include/asm-riscv/asm.h              |  77 +++++
>  xen/include/asm-riscv/asm_defns.h        |  24 ++
>  xen/include/asm-riscv/atomic.h           | 204 ++++++++++++
>  xen/include/asm-riscv/bitops.h           | 331 ++++++++++++++++++++
>  xen/include/asm-riscv/bug.h              |  54 ++++
>  xen/include/asm-riscv/byteorder.h        |  16 +
>  xen/include/asm-riscv/cache.h            |  24 ++
>  xen/include/asm-riscv/cmpxchg.h          | 382 +++++++++++++++++++++++
>  xen/include/asm-riscv/compiler_types.h   |  32 ++
>  xen/include/asm-riscv/config.h           | 110 +++++++
>  xen/include/asm-riscv/cpufeature.h       |  17 +
>  xen/include/asm-riscv/csr.h              | 219 +++++++++++++
>  xen/include/asm-riscv/current.h          |  47 +++
>  xen/include/asm-riscv/debugger.h         |  15 +
>  xen/include/asm-riscv/delay.h            |  15 +
>  xen/include/asm-riscv/desc.h             |  12 +
>  xen/include/asm-riscv/device.h           |  15 +
>  xen/include/asm-riscv/div64.h            |  23 ++
>  xen/include/asm-riscv/domain.h           |  50 +++
>  xen/include/asm-riscv/event.h            |  42 +++
>  xen/include/asm-riscv/fence.h            |  12 +
>  xen/include/asm-riscv/flushtlb.h         |  34 ++
>  xen/include/asm-riscv/grant_table.h      |  12 +
>  xen/include/asm-riscv/guest_access.h     |  41 +++
>  xen/include/asm-riscv/guest_atomics.h    |  60 ++++
>  xen/include/asm-riscv/hardirq.h          |  27 ++
>  xen/include/asm-riscv/hypercall.h        |  12 +
>  xen/include/asm-riscv/init.h             |  42 +++
>  xen/include/asm-riscv/io.h               | 283 +++++++++++++++++
>  xen/include/asm-riscv/iocap.h            |  13 +
>  xen/include/asm-riscv/iommu.h            |  46 +++
>  xen/include/asm-riscv/irq.h              |  58 ++++
>  xen/include/asm-riscv/mem_access.h       |   4 +
>  xen/include/asm-riscv/mm.h               | 246 +++++++++++++++
>  xen/include/asm-riscv/monitor.h          |  65 ++++
>  xen/include/asm-riscv/nospec.h           |  25 ++
>  xen/include/asm-riscv/numa.h             |  41 +++
>  xen/include/asm-riscv/p2m.h              | 218 +++++++++++++
>  xen/include/asm-riscv/page-bits.h        |  11 +
>  xen/include/asm-riscv/page.h             |  73 +++++
>  xen/include/asm-riscv/paging.h           |  15 +
>  xen/include/asm-riscv/pci.h              |  31 ++
>  xen/include/asm-riscv/percpu.h           |  33 ++
>  xen/include/asm-riscv/processor.h        |  59 ++++
>  xen/include/asm-riscv/random.h           |   9 +
>  xen/include/asm-riscv/regs.h             |  23 ++
>  xen/include/asm-riscv/setup.h            |  14 +
>  xen/include/asm-riscv/smp.h              |  46 +++
>  xen/include/asm-riscv/softirq.h          |  16 +
>  xen/include/asm-riscv/spinlock.h         |  12 +
>  xen/include/asm-riscv/string.h           |  28 ++
>  xen/include/asm-riscv/sysregs.h          |  16 +
>  xen/include/asm-riscv/system.h           |  99 ++++++
>  xen/include/asm-riscv/time.h             |  31 ++
>  xen/include/asm-riscv/trace.h            |  12 +
>  xen/include/asm-riscv/types.h            |  60 ++++
>  xen/include/asm-riscv/vm_event.h         |  55 ++++
>  xen/include/asm-riscv/xenoprof.h         |  12 +
>  xen/include/public/arch-riscv.h          | 183 +++++++++++
>  xen/include/public/arch-riscv/hvm/save.h |  39 +++
>  xen/include/public/hvm/save.h            |   2 +
>  xen/include/public/pmu.h                 |   2 +
>  xen/include/public/xen.h                 |   2 +
>  xen/include/xen/domain.h                 |   1 +

Well - this is orders of magnitude more complicated than it ought to
be.  An empty head.S doesn't (well - shouldn't) need the overwhelming
majority of this.

Do you know how all of this is being pulled in?  Is it from attempting
to compile common/ by any chance?

Now is also an excellent opportunity to nuke the x86isms which have
escaped into common code (debugger and xenoprof in particular), and
rethink some of our common/arch split.

When it comes to header files specifically, I want to start using
xen/arch/$ARCH/include/asm/ and retrofit this to x86 and ARM.  It has
two important properties - first, that you don't need to symlink the
tree to make compilation work, and second that patches touching multiple
architectures have hunks ordered in a more logical way.

~Andrew

