Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E9C5EBD19
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 10:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412312.655564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od5oc-0001Dv-2a; Tue, 27 Sep 2022 08:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412312.655564; Tue, 27 Sep 2022 08:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od5ob-0001B2-Vl; Tue, 27 Sep 2022 08:19:41 +0000
Received: by outflank-mailman (input) for mailman id 412312;
 Tue, 27 Sep 2022 08:19:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1od5oZ-0001Aw-VF
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 08:19:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140084.outbound.protection.outlook.com [40.107.14.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 208e6d3e-3e3d-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 10:19:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7798.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 08:19:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 08:19:34 +0000
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
X-Inumbo-ID: 208e6d3e-3e3d-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeoXYerb3GnX++VCOmuPLmbwjOxBZLy/prI0844fc034yGTC+zeEE9iFwY8h6TuJrwXe5wUxpgEsM8eUB+n5s/dQdKl+pYBk2MTbys4PIoF0Za+8M6uSWU2IkyVAaNLFNHP6RrKLR334P/JOYmEEA86rOxAdtTogOGfOjkarV0e0KxusJ6oG8+EFyLCgabdFQ/9hOLp9pUstgDnhqJLCaEqOmf8liWv7cxF4ttr70wanpByBnOpqHCpbrO8/DMhM+gfCTaJvNtMwWk6M4c58qGpGvBchGLKuJyGolY0MziEPtGowg8GIbLdX8Fy0b/u6fHDIWvR+pyyUogcvYtlgUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAzkf1MsGwcWu9aN2ZBcnYe91RZZv8KzWyU2D+Ok9aU=;
 b=ZOprF2vt9J67FFI4iRXPaOghBKmebM20zttb+nQl4ySm3ABQtYBvtz5ZZIR6CUQP0OYPEUZlgRvHOxK9bAEqQljzM3TI9kC9WJ6HizndmLXS8oNrzndMkleNXW3EbAwLRklRcnFXMy0odkWqix3twtSvlXajh1SWUc+tDIdf9BzIA9OOnYSZGsqEJYPDoSD8pZoUJSWEspziFc9gnr3JuTzUU1D0l9Z0GhPcj/vHEW09oTnFsrK4mk3AmjeLBYadttAuWiysddU7Psar0z3qlxz3cvygfOf3Wej32sYsdxmjS0dsbbulz44QpdBkXZhc6lTJZ1UJ8QH3RZzyxg8mPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAzkf1MsGwcWu9aN2ZBcnYe91RZZv8KzWyU2D+Ok9aU=;
 b=n0bSmyxvlnQEOttZgnl0jp5kKOXooyXqYPRc1ohkyc5Rl9SfVcyKx29/aBqItwvtlc9s8ReXCqYTND9MpHVARJKpJ6cnj6qUa0hckczaqqwlBD62twXnyac8sUQ2iVmR5YVj41zxMgiTbijbikhFvqgWe2POUYD19l8Lp2X0gqK85tOcrZB+ySnRisf8RYkUiyDO7Y/fHQsBdb+4KDWuSV5vVrmgtCL0RaVw7S9jl93fSD3TMBEipEcq/WY15Z99wKizP0UbRsVmMk/pcCoID260Al2p6XhPT9hHHeqEFoYS/E2/kYGKo9jZ5DYgPg6tFKDl8FOTJGYsUs9TfB9ICg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <359e87d9-aec7-2198-86ab-1d0f76bf567d@suse.com>
Date: Tue, 27 Sep 2022 10:19:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-3-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220920091218.1208658-3-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0044.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: d21902ca-a4d3-45e0-cd5e-08daa06102be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ys/FRjrIPmVQIWAo0PyYQc4Y553Q1Wq6I/GsNTYwkl+1w+F0Suq+d+5PDcciBI3aKZXWoO80DsRVgVFAnjTF6RT/gvxhO2L5dKUlPmiwptiGHfjWNfihyf8NqptXiNB6J/49ANhjbsH/7Td8BgSKtHIKVeXxi/EL/jcvuufWjNWs6VYrGacWngtVlwpcHDCc3JSZyecHMQE58eUv7c9GEK3WKb2hmrt785GyjtflQnvBgNPbkT0JMEZJ3iQ7PiUWqpIR8i41xrU/J3dQvmXFRV9ktCTxEGv1omCBtMc+jwyksyZ1miPfGhOU2wLqDiRt7gu71UTdxMioLUUo/PAcafXz2C2gJCdFJaxhR79/8FA6CgYNZFZB3tNpJjN2amQFCrre7+pqarLL5CbyHo8851fcLMbV2Rp+68kYPhohL7jZwCzG4xFK84Dh39REOPrt2EaO6uco8XLsgXQJG4mZ/wBp+Br1BneYoHPgrhu1eMX5ceZRAdskAd5H8yOgp0PB6QVyLY5a807fThd5VTJ0/5I4tHaKgXonKZt1F/QgHw+8RtAPp72ztEe+K2sfEEDBsUk1DEwDjMkRuylSTKcULA0ZcbaOCRSmYdVWbarJyUXzNViHc97vefxkN/bRwW4Uec3JalsJNhKQ6S/os9NngqsM5d0Q/k+q36aMD1EZIeT07aZCWiyxtI0x/ga018e8XAcK/sUcZcLoSNdzw+yy4AOPUnwLaIGaMRTVyKZInsdtCNDNdm93TpjNGGp6DsdNEYZOsc3bG1+3G0MwFqZlKdiK3oohN34LwN8P7i76i5cziWUeRsQz9uX6ZzTi9Qvx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199015)(6916009)(54906003)(316002)(38100700002)(5660300002)(36756003)(86362001)(31696002)(8936002)(4326008)(66556008)(66476007)(66946007)(8676002)(26005)(6512007)(2906002)(2616005)(83380400001)(186003)(478600001)(41300700001)(53546011)(6506007)(6486002)(31686004)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXhlUG92ZjV4b3lFWnBzYVdza0RXR3d0bzJvbnNHYVI5WHlEU3VMZm9QYmpT?=
 =?utf-8?B?TG1pYVUweFlxdHRYSE1xNWJqQ2c2WmFWUzZtRkM1VUdxSUJaRnlOQ05BU01y?=
 =?utf-8?B?ekdyZGZCaThtNHkrZkdMRkw5TEZneWZDVE9Rbkw2Y2lIRDhDOFJkR1VjYnlB?=
 =?utf-8?B?M3czVGUzaDlwUEduQTR5cmZSeW0rR1hiTWlnMG1veFQ1YTM4VU8wSXQzb3Zr?=
 =?utf-8?B?TXBGc2dGZUh6Vi8xb21sbG5ZQllDbFRQNkh1ZU9wWE9KRklYa1VTS2dsbmQy?=
 =?utf-8?B?ekVpS1VueFBDcDVvNXVQNkI1ZXlsN3ZQRVFidXJSdVd6S2xUbUgyNHE5Q2lB?=
 =?utf-8?B?MFpwQXVFZHpmR2s4RGtxUTVZTEY1UHc1bVNBcjZOb1FsbXFkMFk2L3g5Yk8z?=
 =?utf-8?B?cjBqbVU2T1JWd0N5MEhYMGxDUngzb3l5OSswZlRvY3pETjBVOEhWaWRNOG11?=
 =?utf-8?B?TVBqRXRKSHdWd0xQSzhzQ1dyTEw1a2lhdm5NSjFodjMxMXhzcVpra0FFcU9U?=
 =?utf-8?B?ZkZ3NFBnKzl1YW1Ec2JNOGZlZDNtYlZ5WG9SS1JreUZYU1hUb1BLUmhRMEd1?=
 =?utf-8?B?eWFvN2tKcE5xc0NmRHlYV0hqaWZiaitwSE9saGtpVmhFTDc5MVVMMHlrdGhK?=
 =?utf-8?B?bmdPejduSk14ZGpNRXgxZWVYeDlaTlRNZ1lNaW96S05lREJLTC9EMlZ1eW8v?=
 =?utf-8?B?Vno0NTRGaGJvQ25FdlhSSnc0aW8yRnd0eFRRSmZpcHpIbE53eWpJT3Z0OGQv?=
 =?utf-8?B?UE00RklwUlhOVFhRSGwvUkYvNm5IM1locU9DVXhZdW5nY0ZYeVkrV3NIa1Rl?=
 =?utf-8?B?WDJtcGw1b295UzlobWJNYTB3NDloYXhzQ2t1NGVkdysyNDB1Qml5TFVrcTJq?=
 =?utf-8?B?UUJIM09Oek55anFEa28ybGRGYlZXLzJjTVY4Zis4dHRhdVJwd0dYMTZQNllY?=
 =?utf-8?B?dTlTVGFYZys5cHBWRlllTjdFY3o5UTZxaVN3Um5YVC8rSldBZ1JXOWNmVWZs?=
 =?utf-8?B?TFBHNmg5YXo5dHBJNUJSdE55YnJTdUZkempmTGJ0YldaT1lkNEZUbXBYUTd6?=
 =?utf-8?B?UWhteGJBZUMxYmZGZFN2ZU5QRGhtWXhvTTFkU2ZIRE0vbTNBOTJxOWg5b0c0?=
 =?utf-8?B?U0ZVTDFoSTVpanB4UGpwMHZyQWU3RXN3MFlQN3JMMk80YUdPVmZDWWJrSFpV?=
 =?utf-8?B?QzJnaXVZRldnc3FrNmhpZDdRYVM3cnFpbDFMOVJlNWNxdDdISWdveEVETUtN?=
 =?utf-8?B?RjRXUTRUU3oxMjh2eENLV3ZmeiszbStuUVkrQWtQUG1ka3NaUkJZRmEwWXgv?=
 =?utf-8?B?SkdhZlBlbWlLSVhML28xWUNNN2Q2bWxFSVl0L2ZtVDhQb2F5aE1ZVEZwcFN4?=
 =?utf-8?B?eUMyZ0s4ZThwdENYWkJsQXppeXNzeU92UUticGpMZW9tSzlXU0dWeUR1Zlh3?=
 =?utf-8?B?Mm1SUnlaUllocGs5NkRHcjYzS1diejZFaWpIa296aWo1WEkyVGJsZWg3VDR4?=
 =?utf-8?B?NURORUVCUEhXdjNlOVlISnU1Q0daL1BiOWxMWlVpdzJrTENPQ2laTGdZYkdv?=
 =?utf-8?B?ZXZEZjJ1QXhyWVRnYXhZSW5ybUN4VWhPWU83NHBCREdjZ2k0cFQycGdMeHha?=
 =?utf-8?B?NFZBM0NWWGc2Q0J2cFZtN2Z0YWRBNWduRE01S1Z4NGNVNU95VzQzeVpkY2FN?=
 =?utf-8?B?T0NPZVdENUJoRG1rdzdDalNuYk5BM3Z5Vy9TLzIvWitIMjhObXRZUGN0bmJx?=
 =?utf-8?B?MHNaVzFHTXNqeG1wczJRTEJvRS9WS1JleUFQY2xQaXlleVcwYzNVekIzMG5R?=
 =?utf-8?B?N3ZRaDVPNkVLQ3pvQ0xtY2NXZ0hoeENKVlU5RXFzb1dBeU54YXkwTC9EK2ND?=
 =?utf-8?B?U0Q3NFAvU01ObWk4R1RaN25hUlJRbmZRNlN1MVpXdXVac2FkaEhIZWlSNlNr?=
 =?utf-8?B?cDA3MU8zSmlDd24vcGRWL1gyemtmS1EraUFadFltdnZSbzlHMXQ1UGxoZGI3?=
 =?utf-8?B?djdCWS8yWFhnQlU1RGY3ZnlURE1ZL3VkWDBwOWpSd1NUbGUrdHQyU21mVUI2?=
 =?utf-8?B?R2x4QitkRjhta0t2SzNKMjFJcnBsOS9YU1N1bGw1enpJRHNUOWUzdVY2NlJT?=
 =?utf-8?Q?uOeKRAFW/a9Co/tMz7nnCbD/Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d21902ca-a4d3-45e0-cd5e-08daa06102be
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 08:19:34.6239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IASMdiOBKAMA/16F2cgrOjzI6nrCiWhO/1+s3amOq+ztteMbTrxAdaGNKuW6YKvZiKh0u3ZCY0CBhsGfuPrLYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7798

On 20.09.2022 11:12, Wei Chen wrote:
> There are some codes in x86/numa.c can be shared by common
> architectures to implememnt NUMA support. Just like some
> variables and functions to check and store NUMA memory map.
> And some variables and functions to do NUMA initialization.
> 
> In this patch, we move them to common/numa.c and xen/numa.h
> and use the CONFIG_NUMA to gate them for non-NUMA supported
> architectures. As the target header file is Xen-style, so
> we trim some spaces and replace tabs for the codes that has
> been moved to xen/numa.h at the same time.
> 
> As acpi_scan_nodes has been used in a common function, it
> doesn't make sense to use acpi_xxx in common code, so we
> rename it to numa_scan_nodes in this patch too. After that

numa_process_nodes() now?

> if we still use CONFIG_ACPI_NUMA in to gate numa_scan_nodes
> in numa_initmem_init, that doesn't make sense. As CONFIG_NUMA
> will be selected by CONFIG_ACPI_NUMA for x86. So, we replace
> CONFIG_ACPI_NUMA by CONFIG_NUMA to gate numa_scan_nodes.
> 
> As arch_numa_disabled has been implememnted for ACPI NUMA,
> we can rename srat_disabled to numa_disabled and move it
> to common code as well.

Please update the description: arch_numa_disabled() appears in patch 5
only. Of course if you follow the comments to patch 2, the wording here
would be correct again.

> +static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
> +                                                  nodeid_t numnodes)
> +{
> +    unsigned int i, nodes_used = 0;
> +    unsigned long spdx, epdx;
> +    unsigned long bitfield = 0, memtop = 0;
> +
> +    for ( i = 0; i < numnodes; i++ )
> +    {
> +        spdx = paddr_to_pdx(nodes[i].start);
> +        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
> +
> +        if ( spdx >= epdx )
> +            continue;
> +
> +        bitfield |= spdx;

Perhaps to be taken care of in a separate patch: We accumulate only
the bits from the start addresses here, contrary to what the comment
ahead of the function says (and I think it is the comment which is
putting things correctly).

> +        nodes_used++;
> +        if ( epdx > memtop )
> +            memtop = epdx;
> +    }
> +
> +    if ( nodes_used <= 1 )
> +        i = BITS_PER_LONG - 1;

Is this actually going to be correct for all architectures? Aiui
Arm64 has only up to 48 physical address bits, but what about an
architecture allowing the use of all 64 bits? I think at the very
least we want BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG) here.

> +    else
> +        i = find_first_bit(&bitfield, sizeof(unsigned long) * 8);
> +
> +    memnodemapsize = (memtop >> i) + 1;

Again perhaps the subject of a separate patch: Isn't there an off-by-1
mistake here? memtop is the maximum of all epdx-es, which are
calculated to be the first PDX following the region. Hence I'd expect

    memnodemapsize = ((memtop - 1) >> i) + 1;

here. I guess I'll make patches for both issues, which you may then
need to re-base over.

> +static int __init cf_check numa_setup(const char *opt)
> +{
> +    if ( !strncmp(opt, "off", 3) )
> +        numa_off = true;
> +    else if ( !strncmp(opt, "on", 2) )
> +        numa_off = false;
> +#ifdef CONFIG_NUMA_EMU
> +    else if ( !strncmp(opt, "fake=", 5) )
> +    {
> +        numa_off = false;
> +        numa_fake = simple_strtoul(opt + 5, NULL, 0);
> +        if ( numa_fake >= MAX_NUMNODES )
> +            numa_fake = MAX_NUMNODES;
> +    }
> +#endif
> +    else
> +        return arch_numa_setup(opt);
> +
> +    return 0;
> +}
> +custom_param("numa", numa_setup);

Note that with this moved here at some point during your work (when
allowing NUMA=y for Arm) you'll need to update the command line doc.

> +static void cf_check dump_numa(unsigned char key)
> +{
> +    s_time_t now = NOW();
> +    unsigned int i, j, n;
> +    struct domain *d;
> +    const struct page_info *page;
> +    unsigned int page_num_node[MAX_NUMNODES];
> +    const struct vnuma_info *vnuma;
> +
> +    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
> +           now);
> +
> +    for_each_online_node ( i )
> +    {
> +        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
> +
> +        printk("NODE%u start->%lu size->%lu free->%lu\n",
> +               i, node_start_pfn(i), node_spanned_pages(i),
> +               avail_node_heap_pages(i));
> +        /* Sanity check phys_to_nid() */
> +        if ( phys_to_nid(pa) != i )
> +            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
> +                   pa, phys_to_nid(pa), i);
> +    }
> +
> +    j = cpumask_first(&cpu_online_map);
> +    n = 0;
> +    for_each_online_cpu ( i )
> +    {
> +        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
> +        {
> +            if ( n > 1 )
> +                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
> +            else
> +                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
> +            j = i;
> +            n = 1;
> +        }
> +        else
> +            ++n;
> +    }
> +    if ( n > 1 )
> +        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
> +    else
> +        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
> +
> +    rcu_read_lock(&domlist_read_lock);
> +
> +    printk("Memory location of each domain:\n");
> +    for_each_domain ( d )
> +    {
> +        process_pending_softirqs();
> +
> +        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
> +
> +        for_each_online_node ( i )
> +            page_num_node[i] = 0;

I'd be inclined to suggest to use memset() here, but I won't insist
on you doing this "on the fly". Along with this would likely go the
request to limit the scope of page_num_node[] (and then perhaps also
vnuma and page).

> +        spin_lock(&d->page_alloc_lock);
> +        page_list_for_each ( page, &d->page_list )
> +        {
> +            i = phys_to_nid(page_to_maddr(page));
> +            page_num_node[i]++;
> +        }
> +        spin_unlock(&d->page_alloc_lock);
> +
> +        for_each_online_node ( i )
> +            printk("    Node %u: %u\n", i, page_num_node[i]);
> +
> +        if ( !read_trylock(&d->vnuma_rwlock) )
> +            continue;
> +
> +        if ( !d->vnuma )
> +        {
> +            read_unlock(&d->vnuma_rwlock);
> +            continue;
> +        }
> +
> +        vnuma = d->vnuma;
> +        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
> +               vnuma->nr_vnodes, d->max_vcpus);
> +        for ( i = 0; i < vnuma->nr_vnodes; i++ )
> +        {
> +            unsigned int start_cpu = ~0U;
> +
> +            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
> +                printk("       %3u: pnode ???,", i);
> +            else
> +                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
> +
> +            printk(" vcpus ");
> +
> +            for ( j = 0; j < d->max_vcpus; j++ )
> +            {
> +                if ( !(j & 0x3f) )
> +                    process_pending_softirqs();
> +
> +                if ( vnuma->vcpu_to_vnode[j] == i )
> +                {
> +                    if ( start_cpu == ~0U )
> +                    {
> +                        printk("%d", j);

j being "unsigned int", would you mind switching to %u here and below?

> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -18,4 +18,71 @@
>    (((d)->vcpu != NULL && (d)->vcpu[0] != NULL) \
>     ? vcpu_to_node((d)->vcpu[0]) : NUMA_NO_NODE)
>  
> +/* The following content can be used when NUMA feature is enabled */
> +#ifdef CONFIG_NUMA
> +
> +extern nodeid_t      cpu_to_node[NR_CPUS];
> +extern cpumask_t     node_to_cpumask[];
> +
> +#define cpu_to_node(cpu)        cpu_to_node[cpu]
> +#define parent_node(node)       (node)
> +#define node_to_first_cpu(node) __ffs(node_to_cpumask[node])

I can't spot a use of this - perhaps better drop than generalize (if
done right here then along with mentioning this in the description)?

Jan

