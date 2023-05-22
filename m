Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F61A70BEB1
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 14:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537920.837565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14x9-0000AW-JQ; Mon, 22 May 2023 12:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537920.837565; Mon, 22 May 2023 12:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14x9-00007G-Fs; Mon, 22 May 2023 12:47:55 +0000
Received: by outflank-mailman (input) for mailman id 537920;
 Mon, 22 May 2023 12:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q14x8-00006t-CP
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 12:47:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de18e538-f89e-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 14:47:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 12:47:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 12:47:21 +0000
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
X-Inumbo-ID: de18e538-f89e-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMyhLW5FPHdzVKwP9Y0hoJc5Ex4IBHC8wirDur57vrNbMVKC9Eida5BcbhU31ZxPBwVjt3bKHz64ECKEEXLmCtARgPVXaCSUezGoaMX2yZlXgJpqdNMB6wj2qdloQaIXUhNkEdsQcNQwrjSOvimRRT+J9cqHo96ppEALj0CEXhOrpHxsjhSe4UuvjA/goGiVMzwkj7vQEvBNTJ5FF9fulemPJhGaKqgTlKpXBBCWhtRszyVOYdSNpQzTCdaVwf/ah1/6sSnJYkuNMuXthZrAhA6QgLChjJdc3dY/QYF66kVi2N0ksy6mdUz3+KchKK0lzaeqJuk8kSzdaCaqp1znew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2FCGoi/+NciEYZl0lxPf7LHht5l07ddO42XZV4xGlc=;
 b=HD74JDZVpufJAMzy1VTUI4/Ul0lsWoenmGvdLJ75c+v6zZb7ZFTizkcifuCvcrgD34iMbxtTSm7BOiXTTrqZUTr3evU8AQ63cthMtInKydzLWNgjLJF9oaUIyFZaK20Zk8vs+kWzucuEk7YTUrxaTZ5k5hNvLlt+54EhKw3vaMYhEAGzBVp+NzVZ4axVGw/gu5IBK+y5au0C+s3UzicjRtys8zsJL2kQQHT5T8KqNO2QdABSNiHtSBuPn38sGNg69jhl9p+7A7qrc8LB/XfLpI4HypDZGUQ+zXkOvzjPbCB6/GWP8UOD1WFnhNoeZycpQHAY3cmacsAjTRqjMWIRlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2FCGoi/+NciEYZl0lxPf7LHht5l07ddO42XZV4xGlc=;
 b=d7vL16yI46aEauzZ+6Q4yNb9Z8YAZhOYwQTMG2Od1QROu3CwwVaa2Jac0eXotIIlEQQwMF2frgGkUKHikNGe3MjiTjzpmG/WruqEwY9RYyG3I3N6x6iWItZQ4Wb3TohmUANTdKtvLZkxvCN/9SxkmmT1F+5cjuCHJJvdgseQIKA62cg+zr9jeRZ9NNZrBy+YxhWGHIEBF3gIem4iFLyPgIvtStlJScueX2k4WQpOJO0IGtq/C7ZpRvCSkKAziXfr4qvvcCTANKo6tl/FYG3PlkeyKejDXOC+374vTa5apsgZuOsatp5mWZ+0mUmcblHtqV97t31aHqgVhNtu4U9fbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <13494185-96c5-24ff-7ae6-a57d706420f2@suse.com>
Date: Mon, 22 May 2023 14:47:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 1/5] xen/riscv: add VM space layout
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1684757267.git.oleksii.kurochko@gmail.com>
 <bbdfbf59db6d329d65956839c79e6e42bbf13bb7.1684757267.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bbdfbf59db6d329d65956839c79e6e42bbf13bb7.1684757267.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: f615dea1-2a8b-419c-3579-08db5ac2af3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rJ0NlQ/DV6BjNKIkccsbcz+uXjlcxjvaLMgHO6cf4y/c4+xWBuaklHb12NtQX1k+TuhAqANx607LiKdQ8nCelqOahnBhsohL84gc+ebi3fHil51tRFgzoArkI+HoK0NU1w/CMnFeNtwW7W7Sohr0UBsF/2be9RCoxhGqTVbKYy3Pt/p5Jp3VZd/m9PVTSTmZxfZRQI3kZqwTgw+3txLk2LpQM+p/t+OIWMk7XWy+I8OyWXMBYUqFL4S8lqEakgLGwcTsmCEoNDxr/xELZi9IBm4H+HBDWrxZywxMUkpUXpjuUTInUxUIoAv2xJdjSHp/HzWjKKhQIakHXhZNz+e2S2tPy92vVL3gOd8ATt8W8AsoybA7wu1kPjlOJ5eppQM4mX7zSqsU9YNEV9Vc25lQSeERrPZjfBJBnhuGCUIuZ0wd5lw5y9k9vYQGVfH1ESPQyG5GhjrKCNGw8honjq9ZhVLYWdHHfyDhkveruN+NhcXD0oW0iNwXhLOwmlHk5ygW6/rcYWQGAhyvMlEp2lqBRZsQc59zACjdxu52FGsHTQQiZn7cZY4S2MuTR/7SKJiwTy2ZCJoKzRkOADZCyDTh0SXnanXj4pv2vemLVX5/usARZtk0YUqmW/vKPwPx9HrpOx+LRehlq+IEvZ7v+tUjug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(39850400004)(376002)(366004)(451199021)(478600001)(31686004)(54906003)(66476007)(5660300002)(26005)(41300700001)(6486002)(186003)(316002)(4326008)(6916009)(6512007)(6506007)(8936002)(8676002)(53546011)(2906002)(2616005)(83380400001)(66946007)(66556008)(38100700002)(66899021)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajlwOExhRGZUWGpvSGI1czcxcEkrY2RTdm56eDI0TGYzK2ZzS1JwWmNHY3Rz?=
 =?utf-8?B?VVpIcDQxU3FEellmRHZkSnlOS2M5SkUxdGhXcEtyenNtQlpOQ2pXaW4wUC8r?=
 =?utf-8?B?SGwxUXEzdWovaHdEVHZCTVdCOUc5eStQZ3JOZzN3WU9Hd2YzVkZTbWp1dmdX?=
 =?utf-8?B?eXk3eEdRcFd2V243RTgxSk1FR2tOQXY1OGd6R2RidkY1a2xTVEU3S2REOXk0?=
 =?utf-8?B?SE9CQ2ZoaGJlK08zV0V5cnI5aGhSbEFOMUg5ek9QZXpJOTdhU3lPd3lMbkt3?=
 =?utf-8?B?eWJ4TGZOZ2VSQVlnUUpDQUVmblk0d1RmUktBVEJ2RStmVzVzZmIySUFPSXRh?=
 =?utf-8?B?MUhrMEp3OXg1OGZ0VUwyMldKa0JwTHpyWlJxd0hEbVNzS0ZSNStoVEtTWkFj?=
 =?utf-8?B?OW50ZEEvR2U1NEhCVVErc1pSbjRweS8yd3NXVjk3TURTV3BZTXE0bVo0dTBP?=
 =?utf-8?B?bysrQU5TZUZUMDBhTGpmZ1NTY2l1cjNCTS9Vdks5cEViQmVpa1J4MkhnQ0U4?=
 =?utf-8?B?dzVkTlJGVmV2UUNWZnV4c2F2Y1RJR3k1Zk5Fd3R0cW9XL0lCRGN2ZmN0Ukdl?=
 =?utf-8?B?ZTFKbnV2OERCRDN6NHdWYTJBOHVqajlBd2hmbllaQTJKVU9VZjlFVmg5emxJ?=
 =?utf-8?B?c0ROMXJHVTlZc2NKQVBEcVA1QXRYQ05CRDJSZmt2Q3lMaTZDWm9YYllLTXoz?=
 =?utf-8?B?cmIwQnFoRmxqdHNYdVpnRXh4eG5rRmRtTEcyMndnUFVyNkZOSjNUaHE1NTFn?=
 =?utf-8?B?SFQvZDJhMThvUVdCL1lkTDRDWnNLSXBLcG5ubVRZVnRXUGpDQ0tMRklhc3hv?=
 =?utf-8?B?UnhsSU1jcW9PZnhmZ0JuOTltcVAvNmVzSS80MENoZXdiWWxCUmdCcXZaSUxz?=
 =?utf-8?B?MC9HdWRXTVhrTEVVby8wQnQ2MWFHRzROaWgrSm03Q0d0MWp4SUhsbTd1Snh5?=
 =?utf-8?B?VHRWWGlwNC8zQ1g1YkhERFlXclU3UjNWZXhURENhbG80ejhxSkVkWnJkTzdp?=
 =?utf-8?B?Q25kc1VxV3lxRWtZZXV1OUovL1g2eU02eEpkZ1FBSjRmS2N2dHpBY25GcjBu?=
 =?utf-8?B?UkVGNmdackVTdmhrckJNNEhBckJ5VDVlc0hRVlJqQmdwbEZHTnJjTzZ1d3A1?=
 =?utf-8?B?djI0Q2JWbmYrR2JXUUJTNTE2dldsYnJjbitheXhGWXRVSDhsVlNUZVlVWmtY?=
 =?utf-8?B?QmwwTEc1TzJ6a0wycy9JKzlQTnlIa2hOcXNuY3pieEU5TFh1VFFqaHdHb1NR?=
 =?utf-8?B?eWdSTUgzSkpxRXFlbXNVM2ZUanFBK3lUbmQ0Q1BZMHZDYUNneW1wZUNDZEcw?=
 =?utf-8?B?RG41anA2SHYwUDdLZWZjQWNibW9wcDlLM2RaSFF4TFgvd1dlR2EvekhXQ3FK?=
 =?utf-8?B?TGxQWmhObkEvS2J2M0RCS0JyNXZEY3d5MWpSZldPdHRrdTEzWDl4bzEyVk9W?=
 =?utf-8?B?bzkvZGFidStiMXZ3YlNKUm5LaUJJZXh0WlZJR3hBMkxtU2tWVHdCRnpTOWZX?=
 =?utf-8?B?aW4rTXZDOEJCRjdqQXZPV29xaUQ2OTNBcHRCTnVTamd0N09EYjlMcmx1ZURC?=
 =?utf-8?B?eE5ZcmJiaUpDQ3gxYmpiYUtTV04wQXFBaXdkeUo0NHcxZS8yQk1tbElpN2hN?=
 =?utf-8?B?Q0pMdUF3eFhHUm9GaUVpd0pBSHRmWnNraTBqWm1vTFJocGd5K3BVUUdyYTJ5?=
 =?utf-8?B?TERYQU9ZUEdoa0lXOWJGb3k0dXIvRXhjdSs4TzVOY3d4RzZYWkF0bzJYWXFL?=
 =?utf-8?B?eW9ydzBOeUU4dk80THlRY0hyaHBZMlYyWDVkVExRQWVOKzErTEFPVVZQdjRS?=
 =?utf-8?B?d0xuaDdLNFNNcTJTQlpXYzUzK3MvUG1sWXpZczZRZ2hkaVl0UGI5Q256MURM?=
 =?utf-8?B?bUE5YTM3cEtxUTU2YlVjTS9aRGhNTnpaSEVmOXlXRm1seDdrYVhkQlhXRml6?=
 =?utf-8?B?dUc0aWVLTW5MQjYyQlZxd2ZQMFNiRzFSR0Z0MExLcmtGNFBoaWE2dS9adnR6?=
 =?utf-8?B?SFZ2OTh5eHFZTlFBUXBoNXBlUFd0anZmUHQwRXFmcVRjUXdvck9nYnExdWx4?=
 =?utf-8?B?WHQ5NFNFSUY5NVpza2ZkTiswelJTb0N2aDJoSFdVVG1PcWVjMlJPR0poTjZW?=
 =?utf-8?Q?/K4tcrNZHqhxRtejNNmi6MFAK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f615dea1-2a8b-419c-3579-08db5ac2af3d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 12:47:21.4397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGcRfTKaiaeCXxE+g/z31GcF66pIhk3S3OLshqirtvBqjq0kLDbRvnlBEgx09IGYrhtY7LoNNNhbtFoWhaH2+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7135

On 22.05.2023 14:18, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -4,6 +4,42 @@
>  #include <xen/const.h>
>  #include <xen/page-size.h>
>  
> +/*
> + * RISC-V64 Layout:
> + *
> + * #ifdef RV_STAGE1_MODE == SATP_MODE_SV39

Nit: #if please, not #ifdef. Also may I stress again that ideally this
would be formatted such that when e.g. grep-ing for SATP_MODE_SV39, the
matching line here would _not_ give the impression of being "a comment
only" (making people possibly pay less attention)? My referral to the
x86 way of doing things remains.

> + * From the riscv-privileged doc:
> + *   When mapping between narrower and wider addresses,
> + *   RISC-V zero-extends a narrower physical address to a wider size.
> + *   The mapping between 64-bit virtual addresses and the 39-bit usable
> + *   address space of Sv39 is not based on zero-extension but instead
> + *   follows an entrenched convention that allows an OS to use one or
> + *   a few of the most-significant bits of a full-size (64-bit) virtual
> + *   address to quickly distinguish user and supervisor address regions.
> + *
> + * It means that:
> + *   top VA bits are simply ignored for the purpose of translating to PA.
> + *
> + * ============================================================================
> + *    Start addr    |   End addr        |  Size  | Slot       |area description
> + * ============================================================================
> + * FFFFFFFFC0800000 |  FFFFFFFFFFFFFFFF |1016 MB | L2 511     | Unused
> + * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | L2 511     | Fixmap
> + * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | L2 511     | FDT
> + * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | L2 511     | Xen
> + *                 ...                  |  1 GB  | L2 510     | Unused
> + * 0000003200000000 |  0000007f80000000 | 309 GB | L2 200-509 | Direct map

And another, yet more minor nit: Would be nice if all addresses here
were spelled uniformly, i.e. also with upper vs lower case of hex
digit letter consistent.

Jan

> + *                 ...                  |  1 GB  | L2 199     | Unused
> + * 0000003100000000 |  00000031C0000000 |  3 GB  | L2 196-198 | Frametable
> + *                 ...                  |  1 GB  | L2 195     | Unused
> + * 0000003080000000 |  00000030C0000000 |  1 GB  | L2 194     | VMAP
> + *                 ...                  | 194 GB | L2 0 - 193 | Unused
> + * ============================================================================
> + *
> + * #endif
> + */
> +
>  #if defined(CONFIG_RISCV_64)
>  # define LONG_BYTEORDER 3
>  # define ELFSIZE 64


