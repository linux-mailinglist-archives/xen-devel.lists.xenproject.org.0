Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FE26D79D9
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518451.805031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Vl-00053a-FH; Wed, 05 Apr 2023 10:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518451.805031; Wed, 05 Apr 2023 10:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Vl-00050i-Be; Wed, 05 Apr 2023 10:37:05 +0000
Received: by outflank-mailman (input) for mailman id 518451;
 Wed, 05 Apr 2023 10:37:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pk0Vk-00050a-6o
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 10:37:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7d00::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccbf2377-d39d-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 12:37:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8395.eurprd04.prod.outlook.com (2603:10a6:10:247::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 10:37:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 10:36:57 +0000
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
X-Inumbo-ID: ccbf2377-d39d-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGXqNsWaiCWBsLGXCHtB9NVu7xQfSwFyFtWPTySNrymtykz1/+WdsRug7SxjuBRlF3TsT9TDBEEEPkwL//RBILfvDt3E2lPF7anKERPEYrIHn5HZdKPJVk6sHRqx2/AqQY+m6wopXEpRrPPeykSQz6b1jQgwLfVVc9VhGJTwGvMiBLvi6IkkxR/gxFSuLUhMFori1qBC62z/nZIRdrLyarZR8e9NJn6Y+Id/kJcnY6ylFn9/4kvfSAfrKhwp52RpYmaBHd/qg4fP74qNhNxnjdAMWWynpuHUU+e/PY+zh4C7+QzZys+x3CvLo9w3NY/wtq5O8xs+cQaTkgSv3JlBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuyqy/r8c07AnJqD3GHmViiudIVOTpE8t2D0DhGIOh4=;
 b=iPRtFEsJ/uwPPijUhRg9/SdbqBfJwLjReIhYm1w9gZBjH7qUOmY2RC+evVR8bKpyBTPXqFzkA2l+/KvsoOdfTgJkcNN4dr2jwUVC2EDITK0UHkZCvHHjGne0bVJyCt7sxORTL/ltslG1P8OYzEMPrd7+6+ITZ+bFvEbfjFGEe1GxdAEWHlwA5hdAlmEh8ZlcCOcNuKV8avxtEt2EiR5Canw4vYWVkdJQGWScm8A3zDujIpUZVewk6td5lq7zN1LoenWDqvfn2F75BRHeKo/Xsla2NpKlvnHusJ3UkpsXiz5IP1gfZDFJWksJb8pCHOvZmM38xESyCfFLPMovJDhf7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuyqy/r8c07AnJqD3GHmViiudIVOTpE8t2D0DhGIOh4=;
 b=qLrD/PpETL/SfonJsHIntiQuT4NtENzH+AslF9NUw1txvptkdHuFPVlcKF8Vfz8JX0Iy7fLHfHFk5oHrZ4XFsfGJOuMXPauklZF3FbtFdLtIjdYBG/nZpGbhRjnEI9ZHAgKPBvwC5vKN5ZE1qElARPSK2zALg/4E3+4mBFecDVbqCOuK3P5fhUGZ9Y7acMli9AhC+Z9pmhpvFjELJIaIFuVGYzjCM5GCQulv+0G22qDFIyUpPBPLfXRUzYQnTtmVzfvJIGDWUezZpS19TZeYsHnAPEZLsxpWGsTeFq9jniRnMvE+NFo37R2pvubp5mGAz7r7feKZg2CVduwTgJacmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9bd819d-93ad-d511-4602-8e3f4f515546@suse.com>
Date: Wed, 5 Apr 2023 12:36:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 3/3] multiboot2: do not set StdOut mode unconditionally
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230331095946.45024-1-roger.pau@citrix.com>
 <20230331095946.45024-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230331095946.45024-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: 49e671e3-8bc6-48d8-689f-08db35c1ae55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y4qAoOVY9WyhXGl1mNe/YN26Xi9fe5zmsejsCFHRnDvDHdOtHAuYLkSkS8sxCQiPUZTbGfr2fV1T69pZ/6uRHXRyEXFRYFuJT9N0Ii2dbxJl6qFsFX5s73IVvqZiO72qZ6stLRQCMWWjcsFGsQhAN2rhC9aaq2IBCJauGKW1r4Xf6OPuDSDnQ61+R4FZYA4cfeYdVQ36ukaVhvt09o5821L9DSlWalLSKbAQfhVvTKWQSxYCDN6s86zsMSm8BtvWteEfW+hLzGIBo6KLEH9sDQIbUXbeEo25Do7v2r37g1QGtLGPtIA6cofNvDZa3imZM3xg7WbaBH6zjL7eU2fFA/The4C95+Cr6xAiJmsLMM89VGcMYSi1Vzi4H1WT9oE3ZjJXDVpNrpcGdsCtAW+mS6B0W22Na4YxOk3nlQWW6Jbh4eZ2hovFbBV4PXL7HvZfosiYuzhRVyqPK7FuuNkrLi7Pq3LACd+/aoQHqPgslHdUtJOMEutZZ1qjXPnHjSzfGEgKsQvadowehFd+0bKuaBRhH3LCbXZFn0ZLyKiD5bchj7VLo7RHOH+REESgfjwPxlA0/5Pk/9Cq0tKk2yZedq6i/obqHsRHD7BTNODiA/g5DtvjR4oxyhf2OqNtM5oO1IRP4SwhVRitHLXSvSCs+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(31686004)(6486002)(54906003)(41300700001)(66556008)(66476007)(66946007)(6916009)(8676002)(36756003)(478600001)(316002)(86362001)(4326008)(31696002)(53546011)(6506007)(38100700002)(186003)(6512007)(2616005)(2906002)(5660300002)(26005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejZNY2NkRjdUdEtPdDlndmk2MFZxeFFmOHMyWGdtemd5TElsaUNIUWFFSXE1?=
 =?utf-8?B?NitQVlRwRFVRYWJPV1BLV0N2bFljMmZPT2dVanA4cEQ4RGRFeno5NExxem1G?=
 =?utf-8?B?aEFDbVJQQ25rdUl0OGRLMVc0ZnN1Q2JLSVIwaWRONWo4bU5ScTZqUm8wMkwz?=
 =?utf-8?B?SEpFSGNHNTkreVpxUUlIVlhESXNCa0VxTUN6QkdQVVRIbUJueko0RkRyL0Fa?=
 =?utf-8?B?RG1QSVkyTWJLODJydHc4dDVFU0l6NVVQUSsrcS9HU2hvZUtkUnh5T2xmUmY5?=
 =?utf-8?B?N0VkejBZdEgvN2xJbW9wb1hDWm1hbVRTVzlqYWV6RnZhNGM3MVNvTk9sdHZ3?=
 =?utf-8?B?NWVsWDdtYi9mVFNkRlMwMHEvRTVhb0VUd2JtcmZRRzk2Y0tFTHljajFDbXlr?=
 =?utf-8?B?ZTBRL3lGdDVnZ0NveUp4d3NqNThIdVhYbTNRNzhoK1ltUW1udTNPWm0vcGk5?=
 =?utf-8?B?d1BVY2p4WnpJSWx3dmJvYjYxS1ZOWlV1aXdhUE0wNTNvaEIrQzlTNHo5NEpw?=
 =?utf-8?B?aXlEUTJia0VFbE5hemdEamdCK2ZwS21ycVA2YzZSaEMxUlBtQU5seWt4WXlZ?=
 =?utf-8?B?QWZzTHMwVHJrd2tnK2FZbCtYS1RiRXgrVElmTlY2OFZqbzBKazh3dzBrVDEv?=
 =?utf-8?B?ZjVzOGJOMFloTmFMZ1ZpbDVqdjRoRzhGay9Ya2RadWdSejUyZi92cjBSMTNS?=
 =?utf-8?B?ZHZaZWkwUGpaVlZjSnFJeGpJNnJ6enkvdW9vR1BJQmhxZVh5bGo2QmdKUTF5?=
 =?utf-8?B?LzFBM29yR1JTUWpHckFKR2gwaW11clpaVmZSV3F0cHFBTmczUHkycUZIMW8y?=
 =?utf-8?B?MHVxK0JLdGJrQUdRVDR0QjVmZzc3Q0QwNjBuZlFTV1RpN0IvSUpuYTU5V0pt?=
 =?utf-8?B?RDNKV0IxY2Z6Q0tLejY3SUhUYnFzcElJOHFjVGZtMGZ0dFRHdUlNMFhNVnl6?=
 =?utf-8?B?WSs5UFM3U2J6TDJTZDlYTFByZWRySVUxMGxPT0U4dFdreDJVM0R2aExZdXNt?=
 =?utf-8?B?dWZST2srOWEzdlR4UGtSZUNjWERkS0pSbXNhRHJVaDMwbEl2cTI0ZnU5SXQw?=
 =?utf-8?B?Z1hjajBaMTRTV1ZWRmJhQ1RCZDV3YXNoMmFsZ2RGck9NUXlScHhHek1aa3VM?=
 =?utf-8?B?SEtObGN4MUhyVHB6QXRrQSswdEdGWUJaMnFBUlp4b1dKa1BpTnJrVko4ZWhh?=
 =?utf-8?B?VTk3QXk4aytLTHpuMXIxY1Y2VVJkM2xPVC9aeE1VN2dEcnpUR0lSNjZ4akZo?=
 =?utf-8?B?VERMdmRhTi9SVG1TMFFOQTl2MnBKR05kWWo3OEdSc05sczdKZnlwNUl1bXhT?=
 =?utf-8?B?dUFwZHhIb1B1Y2htV01hcGhtbFdZbEtBZStCZk93TDNlRzdBVFhXZkx5dkE4?=
 =?utf-8?B?TEVsZDBxd2ZhaEIrNVR3YWlNdTNWRVpyeHczc0tsOUFGdm1GZytsTHlvVVZD?=
 =?utf-8?B?ajdpaDgwSGZtZXg4aGtIZlg0SHc3V3dDa3U5UEFLcnZuYS9FMlQzQ3FkV1NT?=
 =?utf-8?B?R241OXZpZk4wMFZ5dXV5aTRScTh2MnpOaWZuY3RFd0dJc2hNemdmR0V5aHBM?=
 =?utf-8?B?UUlIdUlWcFFVQ0xoSklPN3Nub1VPVTJQYnBjVE1ZUDB1dGxDbW01b3l0ZmVR?=
 =?utf-8?B?N3JRUElVRy8vbTJKZjVkMjQ2T2liZlhZVTZKbEJYck9RRE0wbmVmZ0IrSGR1?=
 =?utf-8?B?N0xhWGQ2ZCtkSmdvbWxRemlYaGNGdUZGVVkrZXh3UUFpODVSZ0hhWlc2T0tu?=
 =?utf-8?B?RmtsTUtKeGJnRVlKeGlxTjduTys5NS9WWDVLcnJ3QWlLRlRTcExVejNOaExF?=
 =?utf-8?B?ZlQ2S0dQOG5aTXpmVThYUkx5Snk1cFpuTmYyUkpBSlBXdERZd05mUDJsMDN4?=
 =?utf-8?B?cnh4TVhBcVhhTzZwcUhUU05JUi9QSzlzTzZlZU85elNKNUZiV1FRSDhEbVpS?=
 =?utf-8?B?ZWdpdnBYS0RIamo3SThJQlJZYm1HUUswbzZsSE9HQjBKbks4UTZleG9lOXpW?=
 =?utf-8?B?Y3JvRDZaM28rNktiT0xLTXhvMUZzOUR2bGtTUTdZTVV5QW5aL3dEaTFSS2Zs?=
 =?utf-8?B?SStrMU9lQ05rMVZzV29iazJjOEk1NzZpNEtndW9XeVVtZUh4V1JVbUd5Yk16?=
 =?utf-8?Q?/gj0gRiKLF7swI0MiYUduigvI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e671e3-8bc6-48d8-689f-08db35c1ae55
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 10:36:57.4231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fala2Nt6iCUE+kr5I+Y2PhXZQ7K4/lpN9bYc0HCvlji2b3XGVO48EzpdFU4ehG9M0g/5GO18aPex2EQ6OCzZKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8395

On 31.03.2023 11:59, Roger Pau Monne wrote:
> @@ -887,6 +881,15 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
>  
>          efi_arch_edid(gop_handle);
>      }
> +    else
> +    {
> +        /* If no GOP, init ConOut (StdOut) to the max supported size. */
> +        efi_console_set_mode();
> +
> +        if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
> +                               &cols, &rows) == EFI_SUCCESS )
> +            efi_arch_console_init(cols, rows);
> +    }

Instead of making this an "else", wouldn't you better check that a
valid gop_mode was found? efi_find_gop_mode() can return ~0 after all.

Furthermore, what if the active mode doesn't support text output? (I
consider the spec unclear in regard to whether this is possible, but
maybe I simply didn't find the right place stating it.)

Finally I think efi_arch_console_init() wants calling nevertheless.

So altogether maybe

    if ( gop_mode == ~0 ||
         StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
                           &cols, &rows) != EFI_SUCCESS )
        /* If no usable GOP mode, init ConOut (StdOut) to the max supported size. */
        efi_console_set_mode();

    if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
                           &cols, &rows) == EFI_SUCCESS )
        efi_arch_console_init(cols, rows);

?

Jan

