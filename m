Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728FA5828B4
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 16:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376228.608860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGi3n-0007rW-Cb; Wed, 27 Jul 2022 14:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376228.608860; Wed, 27 Jul 2022 14:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGi3n-0007o5-9p; Wed, 27 Jul 2022 14:30:51 +0000
Received: by outflank-mailman (input) for mailman id 376228;
 Wed, 27 Jul 2022 14:30:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGi3l-0007nz-VT
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 14:30:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4ba0fc0-0db8-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 16:30:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7254.eurprd04.prod.outlook.com (2603:10a6:10:1a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 14:30:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 14:30:45 +0000
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
X-Inumbo-ID: b4ba0fc0-0db8-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFAdwMIRl79b06CYB0FVzB9HZxVgtBnmt1YCmuoAAzciSty9LlgM/+5AQK0rtHbSO91X6GiuRosc8rVpoUfN+I/tLHx0Re+iyd6bv2cB7KGy/f73iJCGbpPKtcIFYWXRa5GsAIS2wbFoKKy2vy84lLlluV7HF3G1DPvbZXLkn5Zgs5DDLjAR/q+Ua6dq+01Jt4TtBzOaYeZmmqKKE+aG7ntVO9taf6jomDKH2potFfIs/RTX1r6CM5q79Z419zSU1k/Yp7RRp9x2TtrDWIzIwUa+6K/0/4HHua8cbKsiB4ud8z5fBiKeaid+0za+x2YgSWKPj2sZV4SC8zlMMFpLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axuX18RS7W5qUjIfqjMh+CQO5ugvudP9Jor8Vpxq43E=;
 b=f03jcYRo2gcmtJjxD44vJTOEq3ziFdJkgeZajdS7mW6xmqn6KqHv3QRzMtb6JCV2aHrXaubJLQbf9xbM0jpZrtV8FvzdDZa7Xi8f2TL5FoSa3xmx+KPQVz9vXImFfHgOZWjgayHubfvXe6vPSjmLxh1XvPtI+Gv6c8FniXP5Pp4QIxd7ZjgMuLgSz6SrmD9FI1JPtI9pqYdRSwBT/imaETUoI+hWU/GDaBdc1tT9QQfpYMr1Oz3m0gJkvs1iQ/t5fh7ablkBbuRn0qIA/+jWZrQqR12swUE8tzIaifmMt6owUXqfLYbDH3HmWl4rDkMDatY6ZpjV/OGFLhs9A1aMNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axuX18RS7W5qUjIfqjMh+CQO5ugvudP9Jor8Vpxq43E=;
 b=ihYYgb2pwa6Ju7aBwHGCgmTSXooIrO2k0FSbJgr4mKPGb4hqYg0d/wml6yHZbhDyo2WFybRfCcdEYjPBT+V4AeNO2hQ2DMn5CntOSLN/5je1nHZmWca3/eoaLi8IX90lZOB1NTvoDTjfpe8Zg1U78KZchs+Xzi6Ozp5XZxBnA0gfThI4PymePzMvHddAFYcLhSJBhRHDyzyNHw8OFw/P3u6maZZSQ4wdItMC1gEzf4R5YfYkkuUIld9LpM6UjazBfZ0n9Mh4C0Wo7qFsupWuEzOXGs8xkTdSQgf4AD8TPWW1/eLGq3gdshLwxZZMTooHmAFmF+BFeIUPi09rVhAP3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e7a01a13-9a0d-d6eb-d348-f62952f93bc9@suse.com>
Date: Wed, 27 Jul 2022 16:30:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 17/18] builder: introduce domain builder hypfs tree
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-18-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-18-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0046.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3553e971-fe71-4d6c-4e97-08da6fdc97b0
X-MS-TrafficTypeDiagnostic: DBAPR04MB7254:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v/E3ReGc8YA+oZBteGjS4A0Cf0obIZSS+3B93dtA1eU2cjvvN0tu5VLxsbqs+i+brpbiGr8eKfZoh6Zh2HXD4vHZmnN14urnKXKf3nyykEl9mA5nDtwcpcWlgAayIoOqMwaMfdLlByQEQzCaRnTHuUweQ+yHwaooYwdLRcaq5Ts4lmkBYOVJcmofE52t8PQEk7dWoH9jS1s60y+Su9EU3Hsg9LS/GKEUKqLBZ1te9QEC4DqApyEWousi0VFD1Lk8lHHZgMRsS2bIk8QD0OdHISHJB0D3Hg4Gn1kSaW0zSS5rBTXvRMbSu0ZKWHUHBWEd/nY+7UOZAvCdwfkUGbtTtDTtNIdK1XjHN4HHLE/po3SWzDcntm9lSkrPGUebqte5PL8h4M2a7Re4puU1B5k/CbDRfApr7d43bNOlkGDcfYzIQhdZF8BksuaQDMgmqQHAScksG1WAW98FkPt+xv/e8xCLNvnnA5N2EYk97nXL4Ba+Vr2WI63pU9/hwtoUS7HYC+POgzjfDZvCSAx4LaBxPww2TSfH2Vgw3ZmP/BeFhrgHkyPQUuho6fm/NNdCSq5nAu+GG9GY9OAkGsU3uvUQnsaUCW63kR8JnubaQvbw0/6VGSefMlJFg4U53ZmmG+T9MyW5d+BJJNCn3Ubmmxn32Ph8yPI3kb2LOr2LgmTD1VjXlVM+r956OSAQIE//AQvW8Gw1oJ6jRFGd0qyrxPFcIZcxo69RYTP05AmwNkQUBNCiKWa368miy8zbEC2+WD+A8J+wpDeGpzA5TQymRkuZ97WvldiQCkP1rp73KBOlkW0sKuyW90QRrboRGzAyMK2b+lIj5LivZm5y31IOWvufUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(366004)(396003)(136003)(39860400002)(31696002)(478600001)(6486002)(38100700002)(8936002)(86362001)(5660300002)(66476007)(186003)(66946007)(8676002)(316002)(2616005)(66556008)(6916009)(83380400001)(2906002)(53546011)(41300700001)(26005)(6512007)(31686004)(4326008)(54906003)(36756003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1lDM0pVR2kyWVVSQ0tHeDkwSmFxdzNIZUdiRU5MR3BMSVpCWktnMnJOMEx4?=
 =?utf-8?B?c203TDNHdWtHSk1pd1JSMGhQNXBNT1ZuOTYxVHVJS05xRHZUUStWTmoxdFJa?=
 =?utf-8?B?VUZSV1Z4MVZ2NXJyd2xrVWhQY3E0WUkyZHhac3oyME5hQjRQSk9laHRwMHR6?=
 =?utf-8?B?R1dpL1p2djZlRGJkWVFGTTlXbXJXekUyK015WDhseG9FZVRpY3E2VVJBcU1q?=
 =?utf-8?B?WnRqQUkxcGt0RlB1OHM3YkM0U2cvaERDWkJCWHU3YjYyTThMWE5YWUIxbFhC?=
 =?utf-8?B?QUNKQmJDOTQ0Qm90aW9ORmtEM0p4NVV3QTREajlMZEhROWI3TlpveDJkRFVI?=
 =?utf-8?B?RWYrSVAwUUpzUC9BUW5lMHRYaEwvRXFlenlzWlNDQjRtM1gwcGtDb202dXRZ?=
 =?utf-8?B?NHExdWhZZ2tPTW5wblZUcUQrV2ZZTlN4LzdTUy83YkdMcmh5cy95RkNhWmx6?=
 =?utf-8?B?TWE0SWROOW5ET25RQ0FKWjlEUWFiOW5zSTFFNHFlMWhLVFRwR2VPUU9KQi9y?=
 =?utf-8?B?NDN6ZDY4T2kxQTZPTFVqdlAwUlhIYUxlQ3N1eXIyMnJvV2x4ZHVVUFVMTC83?=
 =?utf-8?B?d2hFcG4yTTdSVmkyZkd6RTBvaWYrQUJzbEdmVmk5RmhCc1J0Sk5TQTcwVWRK?=
 =?utf-8?B?YjBrVEt4TnhMODI4SVpVV3J3VnVqRi9Vb0lhTStMQUFSeGk3bGM2MFRQaXg1?=
 =?utf-8?B?S09mSHdnRWl6a3VvVDl6N1NGemZuaUlEU2d6RkxSNzJFcWc2U0hiMXRmMkZ3?=
 =?utf-8?B?WFZoUUlyT3ZySlBCRUNoSFJYc21KNUx6eDBSazJwN0FoTkIvZnVHS1h6bGo4?=
 =?utf-8?B?WndkWmgzcTdJWU0vN3FjTVhxQU9PK0VDRExWS2MyMGxrZ1VLMjdNY3FTbHhq?=
 =?utf-8?B?WFZUdFJqWlRRcll2VFlqaU9VYVRwL1JWZG5Fa2ZQNWhkb0pNTVdCdzJnTzVp?=
 =?utf-8?B?T0hVamM4WEFYVmJPR0dTaGx3RHY4VEFJYVFzYVVycnNLdURJMW5veGRuc0J0?=
 =?utf-8?B?QjBxZXVYNHNYaWFoSXJVTHdoak5SWHRTbjFwd0hPRzU5bHNaWU5pQVlWRmFk?=
 =?utf-8?B?Q1gyQi9aOHJ3Sk1YdkUrSVdQS05ycit1NytsOThwL2NaZzBxWURXSHdONkRn?=
 =?utf-8?B?Q2EvT1B4cnp3ejFTMjhpRWlOeTdFSWhYWTlDTHNkT1pNQkE3WGJ4RExhZVdz?=
 =?utf-8?B?UkxhZVIrR0NacWkxNGJRbzdLY0pWcWthK1RkTkJUdjRXOXV5b1Q3djdWaGxL?=
 =?utf-8?B?ekhsMkp5ZzljRzg1OFFUNEc4UXlzVjhCVWhVa2FrTXIvMUZiMDFvczBhcDhI?=
 =?utf-8?B?WUlaS3doZDdYaGhHRFJnVFVnVStjdlhRQUdOMFNFcFIrMW9KVXRlbkErTVJN?=
 =?utf-8?B?aVI4R0ZaRG1xZWZuSEJGbFBpclBsdmZDdmtEYjVoV0RXOTFnUCtKd0JveEhK?=
 =?utf-8?B?TElKY3JGN1ByZTJMSjBFK0tURkZaSlJtRktQWE52ajk3b2NhTjlzcmQveTN6?=
 =?utf-8?B?NnhoU1oyK2ZMM0NPelI4c0lNdllLTzNBSTdlNk5uR01OV1RsOXA0K0pkQlNy?=
 =?utf-8?B?ZWRsVHgxUDc1dmdxemRFQ1hIUlNvaERkRGR6UDFQL1NnY0t2UHVmZ3VEQ3FT?=
 =?utf-8?B?aWpqMENyejR6eHQ4VVdoNmNqU0pueHVvWXd6d2NUZjh2R0N4MmRpcDV1cTN0?=
 =?utf-8?B?ZkM3d0lLVTRuZVU5NTBwbTFaZzU1Q3dUQStCMVRjb3JPaFBFUER5a1NoUFpZ?=
 =?utf-8?B?czVuUER4d0lvYkhNbVhjZnhIL0dWU2xZSkJKQjRhMVZaY3I2Q0RtUDAzUllt?=
 =?utf-8?B?akF2cFRWSVNZSmM3SmY4S0p3MHYvWHZ1dUs2UitMdW1PbnVKeEhWOHFyMjgr?=
 =?utf-8?B?YlRGenhhbldvaVJzQWRDV0VueGVoZzNjVUE3Mm42MEJxVzY3bWVHV3J1aXp0?=
 =?utf-8?B?TEwzTnAxcGJxeTcxb1lJNGtvQkxPSFF4eCszM0d1OFpHc09vdmNZZXJXdEYw?=
 =?utf-8?B?TWEyQUw2Q1Q4ak5vVGYyakt6TGlCb3FlZGxjYWwxVVhZQnNjdDQySjFDb0RR?=
 =?utf-8?B?K05FM3ZvazVHaFNlcXNuTm81UnQ0dWpmRW5NT1RWcFN3cU5jSW1xR0dKcnND?=
 =?utf-8?Q?+pT3NKX8638bxopgv7x2Db0L8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3553e971-fe71-4d6c-4e97-08da6fdc97b0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 14:30:45.7092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81z8q5BWDE/WaNe5PCFhxhcO8yWsaHHuZNTEndubGK/kMwMjqRsTXRVe4UQAjj0bQo+042d/kFAjU0xZvVRmtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7254

On 06.07.2022 23:04, Daniel P. Smith wrote:
> --- a/xen/common/domain-builder/core.c
> +++ b/xen/common/domain-builder/core.c
> @@ -134,6 +134,9 @@ uint32_t __init builder_create_domains(struct boot_info *info)
>          /* Free temporary buffers. */
>          discard_initial_images();
>  
> +    if ( IS_ENABLED(CONFIG_BUILDER_HYPFS) )
> +        builder_hypfs(info);

No need for the if() here when you provide a stub in the header file.
Just that of course the stub vs prototype there needs to depend on
CONFIG_BUILDER_HYPFS, not CONFIG_HYPFS.

> +static int __init alloc_hypfs(struct boot_info *info)
> +{
> +    if ( !(builder_dir = (struct hypfs_entry_dir *)xmalloc_bytes(
> +                        sizeof(struct hypfs_entry_dir))) )

Why not xmalloc() (or xzalloc()), which specifically exists to avoid
open-coded casts like the one here?

> +    {
> +        printk(XENLOG_WARNING "%s: unable to allocate hypfs dir\n", __func__);
> +        return -ENOMEM;
> +    }
> +
> +    builder_dir->e.type = XEN_HYPFS_TYPE_DIR;
> +    builder_dir->e.encoding = XEN_HYPFS_ENC_PLAIN;
> +    builder_dir->e.name = "builder";
> +    builder_dir->e.size = 0;
> +    builder_dir->e.max_size = 0;
> +    INIT_LIST_HEAD(&builder_dir->e.list);
> +    builder_dir->e.funcs = &hypfs_dir_funcs;
> +    INIT_LIST_HEAD(&builder_dir->dirlist);
> +
> +    if ( !(entries = (struct domain_node *)xmalloc_bytes(
> +                        sizeof(struct domain_node) * info->builder->nr_doms)) )

xmalloc_array()?

> +    {
> +        printk(XENLOG_WARNING "%s: unable to allocate hypfs nodes\n", __func__);
> +        return -ENOMEM;
> +    }
> +
> +    return 0;
> +}
> +
> +void __init builder_hypfs(struct boot_info *info)
> +{
> +    int i;
> +
> +    printk("Domain Builder: creating hypfs nodes\n");

If at all, then dprintk().

> +    if ( alloc_hypfs(info) != 0 )
> +        return;
> +
> +    for ( i = 0; i < info->builder->nr_doms; i++ )
> +    {
> +        struct domain_node *e = &entries[i];
> +        struct boot_domain *bd = &info->builder->domains[i];
> +        uint8_t *uuid = bd->uuid;
> +
> +        snprintf(e->dir_name, sizeof(e->dir_name), "%d", bd->domid);
> +
> +        snprintf(e->uuid, sizeof(e->uuid), "%08x-%04x-%04x-%04x-%04x%08x",
> +                 *(uint32_t *)uuid, *(uint16_t *)(uuid+4),
> +                 *(uint16_t *)(uuid+6), *(uint16_t *)(uuid+8),
> +                 *(uint16_t *)(uuid+10), *(uint32_t *)(uuid+12));

Perhaps better introduce a properly typed structure? Endian-ness-wise
I'm also unsure about the last 12 nibbles: Isn't this an array of bytes
really? Actually the second-to-last 16-bit item is an array of two
bytes as well, if Linux'es %pU vsprintf() formatting is to be trusted.

> +        e->functions = bd->functions;
> +        e->constructed = bd->constructed;
> +
> +        e->ncpus = bd->ncpus;
> +        e->mem_size = (bd->meminfo.mem_size.nr_pages * PAGE_SIZE)/1024;
> +        e->mem_max = (bd->meminfo.mem_max.nr_pages * PAGE_SIZE)/1024;

Nit: Blanks around / please.

> +        e->xs.evtchn = bd->store.evtchn;
> +        e->xs.mfn = bd->store.mfn;
> +
> +        e->con_dev.evtchn = bd->console.evtchn;
> +        e->con_dev.mfn = bd->console.mfn;
> +
> +        /* Initialize and construct builder hypfs tree */
> +        INIT_HYPFS_DIR(e->dir, e->dir_name);
> +        INIT_HYPFS_DIR(e->xs.dir, "xenstore");
> +        INIT_HYPFS_DIR(e->dev_dir, "devices");
> +        INIT_HYPFS_DIR(e->con_dev.dir, "console");
> +
> +        INIT_HYPFS_STRING(e->uuid_leaf, "uuid");
> +        hypfs_string_set_reference(&e->uuid_leaf, e->uuid);
> +        INIT_HYPFS_UINT(e->func_leaf, "functions", e->functions);
> +        INIT_HYPFS_UINT(e->ncpus_leaf, "ncpus", e->ncpus);
> +        INIT_HYPFS_UINT(e->mem_sz_leaf, "mem_size", e->mem_size);
> +        INIT_HYPFS_UINT(e->mem_mx_leaf, "mem_max", e->mem_max);

May I suggest to prefer - over _ in node names?

> --- a/xen/include/xen/domain_builder.h
> +++ b/xen/include/xen/domain_builder.h
> @@ -72,4 +72,17 @@ int alloc_system_evtchn(
>      const struct boot_info *info, struct boot_domain *bd);
>  void arch_create_dom(const struct boot_info *bi, struct boot_domain *bd);
>  
> +#ifdef CONFIG_HYPFS
> +
> +void builder_hypfs(struct boot_info *info);
> +
> +#else
> +
> +static inline void builder_hypfs(struct boot_info *info)
> +{
> +    return;
> +}
> +
> +#endif

This would better go in a private header in xen/common/domain-builder/.

Jan

