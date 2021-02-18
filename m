Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7D231E7BF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 10:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86508.162476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCfB7-0000jn-7H; Thu, 18 Feb 2021 09:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86508.162476; Thu, 18 Feb 2021 09:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCfB7-0000jO-3H; Thu, 18 Feb 2021 09:00:53 +0000
Received: by outflank-mailman (input) for mailman id 86508;
 Thu, 18 Feb 2021 09:00:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXm/=HU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lCfB5-0000jI-T5
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 09:00:52 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d0f4040-f5d8-472e-b868-d48073333d2c;
 Thu, 18 Feb 2021 09:00:50 +0000 (UTC)
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
X-Inumbo-ID: 3d0f4040-f5d8-472e-b868-d48073333d2c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613638850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MmZPfkgR5G4XryRQNLK3h4HyNlDR4RLco8Ob7NtogyI=;
  b=Bjk2vVvr4rxoIRXWxxlz2EyGfgFKwaTCjYw1YmB+3edsSZ5TVqxaGL8f
   3TEBsQH1vUL0qP2g0Gkutw8C8qNYCHFhTPEqWB3vBamkttkFXtFiwz+Ve
   fCZAmGH8KP1CG6ry2SjPazZfTogepk25FNW98urNMClesc9UPlowOaBC9
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XbL8nlMAD1sJX9/0ud0JhejpkKfCucXoRvCOpWSYQBna13hTMiD3hddgIV593OCUqBZ9dyfd0B
 3EgAHMv/xJPs8CqtJFvIUNeLTb/ssH8J1MiL2PukCEZBwk4zjx/fkdYxLbtLWZjErdC8PyaQ9A
 7vUDf5DOMu+Ez+dU6Fix2CefgCyUqkEJKxfbMLoZ8Z+AzCaxVcGM5wJDrZzxOfrn965ggymUTN
 TGJihfUMciauqmFd+JBs4AgpWZNmgk0NXTupYbLAprUClmUu+XEAkgv0HKNVplFpHppq2IHHYZ
 vzo=
X-SBRS: 5.2
X-MesageID: 38868723
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,186,1610427600"; 
   d="scan'208";a="38868723"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZuSr0j+LKrj7I78kFoNvkev6mhp7rWXoD7884EC+P8JRZfAxRaVgvXSz1EdW+hJY5ySvFhRjqZ1Ij5J34IPPlFopfMtcPtjHZJPKmm1OJrp8kk+kH7RJ17E80ynZSAC0RMK4TJ2DNgJuF5ai8D9tGX/+Bw1caaCvi0jf47pnWmrHjZEEfdASUJH57JdlzMhAAzpnOcx5uirHbcI/dvqnRpndW1ynEIjh87eDDwvIB35NtH844uh1Q3BMrtVrCbWKngwBzBQBBCxLHRYCau1OxfrhDgebmL2nLWsUWLahpU8EifhqpDzyhiYxa99zUgGTa4/jQX2whiuHxfv86RSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmZPfkgR5G4XryRQNLK3h4HyNlDR4RLco8Ob7NtogyI=;
 b=gyUkihzWaaMLtqSQjnRL3BAqpwKpVmnVr1u6vGa7dQs47Iinjk0iHV1uVKaBVTQqX9AaR/vmqhLwWWn0TCY7n+tCe25uO9ig9sbr3iQMBMilOa+vJIInBWrstixXIEYWbrkNgagvCnGyWHNB0Ey5mTjkHLe1L+J6k6k/HcVg7hawTsUWyZf9uqiFxy3fl7fQPYWQwnsBhGqXJ/O06q8JDeh5+OOtLVMywjSovxvy217NMBL2VSPKQTjjb3fyxu67wZ4yNtNZyE67Q0nrAQCo0vnH5axWT9aF49f5SvsAjXb5iDE+M3YSEpTd6iMmnJKZMD5UahFU8B+JsTVWVX+okA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmZPfkgR5G4XryRQNLK3h4HyNlDR4RLco8Ob7NtogyI=;
 b=NZsfKAH+AbpYaf+saFTkDaGm/OvAxgabnXVo8nptU8mP9z88aaeXQImbLkQgvQYLUZL4O1QviJxdnflrlbqbxIR1ELisrkb58W9J7z2o2mlMsPduRQnQVy8QcTBJQJY90xxCm1PK73n5EmxC7ivKxfWvbW5Wr2CSmo+d+TKD3bc=
Date: Thu, 18 Feb 2021 10:00:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <freebsd-xen@freebsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: HEADS UP: FreeBSD/Xen dom0 UEFI support
Message-ID: <YC4suFy4awWuaSz1@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: PR1P264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c13ceea-669a-4be7-41fc-08d8d3ebad2b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4217:
X-Microsoft-Antispam-PRVS: <DM6PR03MB42175BFFC363FD864F7204C98F859@DM6PR03MB4217.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s7aISYvz0YHB05o3x+EH+GEOktwTAvVkVWJumjppTpl0vFrokr85QqjVVGHoRhzOdacAgQPNpy9tDnSNXpvV8N/2PB062lFUaEVbivvUSMwMLCD/UMTZE6SDZiUcZPPPo6MCof7RY/ys186Lzd0ScHufoQxybO3F1KAa9v3TJ9wjAoMjgHY2D4RNWrcEpR5MNK/0tMRiQ7bZvJf0iAwRxkM0erdNZx4E7ieJUcQEeG11eyvZwynYH5ww3mVgburu6ARfqgn1EZONfWdU5cXOtiBzOxbWErKaCgmr25UG9Q+9+wFWuScQvA86fUd3yfUZ223iX3ZhNZjMdPgLEUmBeqdstTEeT4pm/gSOxWn3gkrai3rDyCZ2smaurkr6/V20PiGH+lcm0ctkXRP1U+tFXXcQiCExZe4A4KWtYhYvMbKKFmZsYDyy2Uys5C2ViDW1znAMC9vYmmtwc0/ePAiPF9EfuTE1qe7Iy50CXAeFP5QzXf4IHkfKnGkzON7WCpWN2TBNhAUt75omRNt7axTqjZcO6VwtBZ+jvO0BcM9oZ3vYqm4/LzAN/xjRAqq2M6cQzEPfTYCfhedBUrvHI9jJeGq46DDpRC+I2xW/iNMEpcg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(8676002)(2906002)(85182001)(26005)(6486002)(16526019)(186003)(33716001)(5660300002)(6666004)(8936002)(66556008)(6916009)(6496006)(478600001)(9686003)(316002)(966005)(86362001)(4744005)(4326008)(66946007)(66476007)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Um1vbkt6TkdhOTVnckFsTnEyWUFubWdiUllNRDlxUytneWR5ZVJRelBGUnZR?=
 =?utf-8?B?NzVONTdTWUhpZlVaZzdRSHU5b0tHbjRsZi9WUU1RZWRER2k2QyszQXlVRFlj?=
 =?utf-8?B?NlRNNmczUGpTZkkrbUJkL2tJbU5tS2phU3o2M1h2OFoxWmZrVk9VdFBHVzRH?=
 =?utf-8?B?SG40QzJKS3JZRkR6NWlidWVOK1ZYUmh3MFJia010emxHOHJQUnl3akVzc0lQ?=
 =?utf-8?B?Yzk0WjA4VjBqNUc4M21nR3dFa1I3ZnpoSEwwRlVlTlJqWUk1MkJQYmQxZHNG?=
 =?utf-8?B?dlRGcWtEcXplV2pqRTFtUW12NE9KcWw1dmd1Qys2U2tiSUx5QjZRLzVqYnBS?=
 =?utf-8?B?dkNzY1RKYUhDRHNyaTlOR21yclFLRk1YZW5GaDU4RHFLelpOV2NRSXd2SzFF?=
 =?utf-8?B?bTFyanFnak12cHM4K3ZTWnJ6eWhWRERFMmR1L1Z6U1NHWnpKZTBMdWsyRUor?=
 =?utf-8?B?Y2pLeWpIWWRUZ0lmRGkxWWVWaFo1NXo2VG5QZ1NFVkNrc3p2N3d5R3gyR2kz?=
 =?utf-8?B?TWJjVE95MUJtWEhqSGZpUUc3UXN0SWJEWE9TQ3VzQ0FsOXY4SVZ1WEZRT2xS?=
 =?utf-8?B?a1NCcUhHdUxha2ppaDJ6MlpTTXdCd25zeXB0MzloNWtQTk1IRWpmM2lRMDV2?=
 =?utf-8?B?bHBZaDVqRE0rK24xRTh6WEo2SkJkdmtMYWMxZXRvc25TV2RtaVBkcS9KOWJH?=
 =?utf-8?B?RElLeW9vWXJEREcvZHRrQWJCYmRWcHI3a1I4MExXSzg3SVBsZVlEbHZyeCtR?=
 =?utf-8?B?Z3NWampaZHE5UG1sdW50SjhNZ3lSL2plUC92SDdiSDRDb0RsWmRjMldLOXgz?=
 =?utf-8?B?TmhZVUNmTXBpaEUyUTNJLzRxKzFLVFZjbXJDR2pYSk1BeXMwcjFjLytXVHhl?=
 =?utf-8?B?ZTJSUU0zN29JdnpYZXB3SjVlR3YzTkZjamVOZ3FJdjBEUmh5WktLUUFxUDQz?=
 =?utf-8?B?RVpUeWxqTy9GNnNtYXNOZ0E1RzR0S29CZ2Y2ZUIvU1lpcDkraVJFeVM1Z25u?=
 =?utf-8?B?YU43Y2tZVXkyMklCQTd1dGlDR0xFL1QybkNRQ3JCZStjemFYcmdYTEplWGNt?=
 =?utf-8?B?YzhqZ1RyUW1UcnpIT1J6UVdBL0p6NWt1NlJmRHZweVVHOHpiNXNydEU4Njl3?=
 =?utf-8?B?MkNaSmcyZXNNamJsdWd5eHRWK1RxTHpHU2tiQU9LR25ONmtLSitnR0ZUcThK?=
 =?utf-8?B?aGMwaWZ2ZGFFSXZ4K0l6QlpqQ2Rkc0NZTHNBdHpjd3oydFFiWFVOVk43WEp0?=
 =?utf-8?B?bnFYR0pmU3JudUdCOUNCUVpnQyt6WGVubXc2SSszTzdDTGVqMlA5Y1A0SlRz?=
 =?utf-8?B?a0tVYW9rOUFaSUdONitubEVrM2dsd2xpWkdnQ3ZDN2ZGRGpHZHFoTWpPYnFL?=
 =?utf-8?B?Q1dRZ2hXTnBmc0pwZEw0ODNOS3BlWUVkWkp5aFhZNGhMcXF2MjBIMEVSdkZ4?=
 =?utf-8?B?UnlLcTdoRDlsbFhQdjluazl1UUw0NHB1OFM5amg0N3Y5QmhtaG5RcDdQbmhL?=
 =?utf-8?B?Ty9xcXg2eFNXTWYxNHVpWVRzV0hqdWJXWmE3ekxKZ1o3SUs5UlB1QmpINlhK?=
 =?utf-8?B?R2lYd21PMGRxSXlMZ0kybytVSlZGaEpwaU04aTVtRitRSUpSRS9ITGpNS0NF?=
 =?utf-8?B?UDkzamRVaUFMT1FDbFRSakErbmtqYzE0Q3VlakVSZ0JoQVlVcVF5Mm5LcUN6?=
 =?utf-8?B?cDViaHAvMVFRTGE1cG9HVzZrcDA0dEFtOXh3ZlFpZjhBR09nVExUZ2ZhNGNN?=
 =?utf-8?Q?Wu1c90+ETMyc+gld/+RBQpu2DJjl82Aw6d6My0z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c13ceea-669a-4be7-41fc-08d8d3ebad2b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 09:00:45.0029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ae8E3e9zBfc1kcxTG3trOHTbs80TxGvBjBFfcM575JoF5Ya82WnuynRgasFyEbnphJZgHtLeqTx6W9wwVOmVww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4217
X-OriginatorOrg: citrix.com

Hello,

Since commit 97527e9c4fd37140 on main branch FreeBSD should be able to
boot and work as a Xen dom0 from UEFI.

Booting from UEFI also requires the usage of xen-kernel 4.14.1_1,
previous versions of xen-kernel won't boot correctly under UEFI.

The way to setup the system is exactly the same as when using BIOS,
xen_kernel and xen_cmdline options should be set in loader.conf, see:

https://docs.freebsd.org/en_US.ISO8859-1/books/handbook/virtualization-host-xen.html

I don't have plans to backport for 13.0, but will consider backporting
to stable/13 at a later point if there are no issues, so the
functionality could be used in 13.1.

This has been tested on a single Intel box with UEFI, some wider
testing would be appreciated.

Thanks to tsoome, imp and kib for the reviews.

Roger.

