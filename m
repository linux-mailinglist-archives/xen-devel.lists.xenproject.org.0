Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6265AFDB6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 09:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400862.642485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVpg1-0008ME-8h; Wed, 07 Sep 2022 07:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400862.642485; Wed, 07 Sep 2022 07:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVpg1-0008JN-5s; Wed, 07 Sep 2022 07:40:49 +0000
Received: by outflank-mailman (input) for mailman id 400862;
 Wed, 07 Sep 2022 07:40:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVpfy-0008J7-UB
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 07:40:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2072.outbound.protection.outlook.com [40.107.104.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61c24ba8-2e80-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 09:40:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6053.eurprd04.prod.outlook.com (2603:10a6:20b:b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 07:40:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 07:40:43 +0000
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
X-Inumbo-ID: 61c24ba8-2e80-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAsudtBTvSXvkdsH1ymdjxlOxUo/2O416qS8PhTseDdOlh6zlihZMaQ+yc0ToF6mvCOzMFeSF/l8GIY/oPoPkmNb5X+inBbYPv/ul/lS+Vt6cC3escwxQVF+uSvHrhBToSu8mhm2/tsBuZ5aqXyMvRiG6lMEHNL5E+BIzEP+DuEjcyJlnQmqxp9OSi3ftziHGI+0AvoQWdnYDlM4c31MSdW5/oxwhkD0b12sU5ARRHq2y12pj4Qtb3z5zwq3ej+PWeKR/pGhTb9CkqK3AGyTXeghHN9QTfAZHQlCshcfO/VpsPV/4Gxvgl5M8ki/pAvnvWWwqf5xXe5bK1XvWo/sWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WixJyynWc/r512BygQzcQt+HqqYCwdWSrFx73zK/n4=;
 b=N5U+szF9m+3UU4jupm7lTRZ8iKaROR9ERo/amq1Gykme6gtICExp9l+U6VGf2hwWtMhPbHNf/Gm3RYIgpoP+bp0pIVMPJKPGRHNWlAdEvvnF2uQ8/m9qjLX5heav+sAMOLSRNdoFzHTfju7QOAUCaBF22cy1feidmhESb80Jm9V7Or6oaQddZHY94njM8prO07hC6KkWmWTrdZmJdj3Wj9eo6G3IhwmmmDUxrvSs/LRZP04VLFdHcc5qyfnlMTqtKbwoMPgmoKdLPojxZTq/at4U7ov/kH9h8ZJ8x6uPzTgcJxhKfJpma568fNUoRhu3xBmsIQoBmzvw2tep3Smi0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WixJyynWc/r512BygQzcQt+HqqYCwdWSrFx73zK/n4=;
 b=SpC4mHIcg6W+5WpC2N6rLjrYf/FszLXjp+rXsJn5pSMEosQ6okCnWeDtsQ5pS5oCBMQnC4Mk+MboF0VZGdoKfl/bj5hnDdUbCmlZKMWJroWuT81SKItXZUz7O0t1iZPFikKKeM9UdEhMPiE4IK0zwhDZXKBXZpe5BpIbcqHN/+onXPjiE/aznPcWD6j88sjmj1y/vkgRQi1Fi1cd6nK/POzT9eDn2uN6tB69teivsMU4nciRqfyqVlTaJf6wbWKQvfnGfrXVheSc+uhrahvDu1CFFPcf/OCoJsylCoGWl+tyF0wqDiM8GaayzlDUXqBMiTGtzvgUa24kKjeQpyvr+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c21d6f74-a05f-e121-3b3c-c8c7fd08bb58@suse.com>
Date: Wed, 7 Sep 2022 09:40:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 2/2] live migration: use superpages for physmap
 population on restore when possible
Content-Language: en-US
To: Andrei Semenov <andrei.semenov@vates.fr>, Olaf Hering <olaf@aepfle.de>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1662457291.git.andrei.semenov@vates.fr>
 <657d6dad39f4ab87569470c94afb4cc6d005e829.1662457291.git.andrei.semenov@vates.fr>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <657d6dad39f4ab87569470c94afb4cc6d005e829.1662457291.git.andrei.semenov@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM6PR04MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 531d7a45-e1ce-450a-7804-08da90a444e9
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y0E0Ked9kAvkTrnNdvaNm9eH2X4QVngzunmhMHaBKbFH16YHaK/hX06AaUqQ9NMUAU1qDy4vnQHKSNjAWp/277iOBzeuSMpbLSHKfshM6TwcFbcLdzDgoxuDPloeCbdKdA6Pktb2T9r3T4MPNifr8hvb43+YYNa//+xFqr19I1t+hle4BGFY3D4vslDo/1aVIdbZ2Q5zePtAtZQXR3tBPnjaAvzL5VR6Jy+a6XrGwjDWINBv4X6w8jcLsrg3wCt7PzF7elhH8TitStu9AHJMURwxKAI6bLbQnhiFU4xvdjwu3imay9e/Ycqv1OXXprJu1Dr14X8j27ZGjCBDAMr89KWurmXoxeyVJKLZXFy8B6Gr4GKPwOBPL5OAWkNh+2pSdVRwfMWYJC5+PSdq3oRMbFwPqMf101gnd9xZI3ppPm7Pw1zgZYa9ABYEm0tTe5V8svztxfnIcCDxiAZdR/Ew0waGx3VhsbX8aZ8BlarSy/RNgi+jzT3ruC0onHo4PUA4Z/TpHDHC4gEcEAXT+0i3CSresc9cyk+VBDRGmhQZf1kXQO1h4Xf/iai2dDHNLBVCL1uYYGf2cuo9QkIf32xde7lsKOJebxmyurPkE5XyUpa5IWvZXWrWjZ8uQmZZmkikVsSQbNkGEu5vqHmwbaSpoS+mOEoulr2UbQysgEsXx7oMnG8T1fGOfqx7gbkAMdBirgR+1FAgq2U1HliS5S7cdrORh6AcNwMOcUuRqnZFz3STcBKmwEWnh5vx+YMfEC7C7+muzmGoYJWTHGlLYos7IkwU4s3OtZj4e5qY+e1CZgM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(346002)(376002)(136003)(366004)(478600001)(66946007)(66476007)(66556008)(8676002)(4326008)(41300700001)(8936002)(5660300002)(30864003)(6486002)(6512007)(2906002)(26005)(31696002)(53546011)(6506007)(38100700002)(86362001)(31686004)(110136005)(2616005)(83380400001)(54906003)(186003)(316002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEcyVmZXTHZvTkdXWUNwTy9Qc3BoVFpla2s1czgrcSsxQzFqQ3dkNGwxVDBS?=
 =?utf-8?B?UXN6U3hEVHVCdFZyUjJnOXl2VysxaktUOEZTQkgveCt4K0txekhkK1IwM2U1?=
 =?utf-8?B?cUxqMnNxaklrYk9Rdmo3UlNNR3piU1lLVks1K3c3Q3pES2k2OGdxMDc2TXlw?=
 =?utf-8?B?KzBCczdQRlVsVnRWMXBWMlJ3N1ZBenFHVlByOE1lUGhneEQ0SUxvbEVJUk04?=
 =?utf-8?B?TnFGNlNtUVZmOGhEckpoaU8yM1ZTVyt6bGJBd0FuMjBIdUgzWkpZeGJUNmt6?=
 =?utf-8?B?ZGdqRzczN053d1piRCtDOXNQSVFnR0lJWVI1REE4V1BMWjhuOThSSHFoVFFI?=
 =?utf-8?B?NlNMU0kvaXY2UUxZRHA2WjY3RjRRSHJpZTlDOVlUTDkwSkZuSVNXOGhwTzV4?=
 =?utf-8?B?TVo5aVhCd3ZqN0I2WiszT1ZEQUhoQk9KWDVmZlh1bk45OVIxakNhbmIvZVlD?=
 =?utf-8?B?NVZwcWFsZVpvdGcxR3ExK2ZidWd1aHZhL1ZsMytoM1JBMk13dERPdmNybDRn?=
 =?utf-8?B?bkpBL0k5ZU45SUNyMlRpZVZGTDNua3ZIMGtob1FXT01TMkl6b0U5NkxUUmhC?=
 =?utf-8?B?a0NFQ3hBQi9ROUkyYkI0T3huRU9aT1I5M05RaGVzcGhvUHZzd0E4Q3ppcEpv?=
 =?utf-8?B?SlRyM2ZocU1aNHc0dDlwOG91VkVyTTB6RjlYOFhBQWdoY3hDVC9LL2hNcDly?=
 =?utf-8?B?UndlcVhOa29QR3BaSnFRL1lWRS9mem9vNXdFOUMxUGh3WnhuY3pxb2ZOTHZ1?=
 =?utf-8?B?SzM2OE9wdWlHY3VYamVoMW4yS1BqdlRvcW1vb1VNTW05dUJXMFNmU3JKeXlN?=
 =?utf-8?B?UnNDcDh6eFJqWTJIR1oxREtaZ05FU0pTQnhHL3Z5YXhZd3dxK0pXbGdubUZv?=
 =?utf-8?B?OXpOajNmVWZ6WE9UZUY3QWc1ZGhCOUQ5RUVyWnRJNHB6Z3lCSkZUUzNuY2hK?=
 =?utf-8?B?NDJzMzZzT0V4RkRNRGpQMEFBckhmOGF4Y1JaNHJFd09UclEwUHdmRWo3U3pi?=
 =?utf-8?B?L0xlWFV3NkhPQUhPZ0hLbGtBakNvUm5pRnllQk82TDJMRjlrQzlmMmhDU0R2?=
 =?utf-8?B?Z01STU43bzdueFdpWDM0cmMvNjcwZ0F4bVptWGI3TFhhWTJIa2FONEdOc1RE?=
 =?utf-8?B?QWFNUGpmMVNnSU1hR2ZBdS9oak1hb2JaeUQyay9RQUM0eVBUZ1N0Y1NqYThS?=
 =?utf-8?B?NmxHdkNNejFIZm9xZXlRVVV6Z2N6TVpScmwxS1g5MENzUmJsNGtlQldxUHZm?=
 =?utf-8?B?OURLMWI3V1dNZ1ZxNG45dFlpMVRHWDVzdHhDYkg4aVNVdEFoMFpMZGIwVHhR?=
 =?utf-8?B?OHVpQnh3MDUyaVR4RnhacDRSa2ZQQjFEa1pqcFR4MXFKLzRDc0h6aDNRajBZ?=
 =?utf-8?B?ZEgyMnVjcitvUmFRTU01cTMvRnh2K2hDQ3hybUJ5YTNYZjBXclhUSEFvVGR4?=
 =?utf-8?B?RE00NUZNdmdGMXJleTVzdU1zcmpnOTlaZmI5YWduZkpnR1NnNjcreUpvQnA3?=
 =?utf-8?B?TWFFNEZTNDdVbmQyd2ZmZVloVGZVYlZxZXFNcldMZnI1ZVFqbUlTaC9tM2tX?=
 =?utf-8?B?WjZFTDRoVGxLajM0QUt5WkRoL2E1K2d6R3JoVW05OURvQjR4S0prRFFhQmkv?=
 =?utf-8?B?dFU3eE91L3NDajBtd2JEVlB1dUQ3eXhPbW5jQXdrdXF0OXduVjlJdk52WXg3?=
 =?utf-8?B?Q0hycUdTSkMxeFBXeWErOXZGek1DZXR2Wkhkc3RrSFNDa0ozYXdVWXByd01u?=
 =?utf-8?B?eVFHV24xRjdIT1l5SmVPMUxPemVtYkllN3Q4ZXE4dXI5NHgzL3I5MEJhbTZt?=
 =?utf-8?B?RVZyVXVBN0NnTmVXbnV6RFFrM3lRVmVSRTRZaEJwQ2NrQjM2WC9ZSCtBendE?=
 =?utf-8?B?alZmN0Naa0h6OFFmbmZMdE1tMUh6UzB6NWNvNW5zYmVBM2Fkc1Z5dFpSUHJ3?=
 =?utf-8?B?bldPL2NIeEk1Z3FKd3Izb3ZhZkFyV3VxS0w3aDJrbDlJSEFtWnNFT3RvY3E5?=
 =?utf-8?B?UnlBOUMvWkJDdFpBZUxvYWZSL29WV20ycmNGUHBKMXozZ0Ztc1ZTU2IySW9i?=
 =?utf-8?B?ZVlRdm56L20xUzJkcUlraVlpRHlXL29UYTViTE8vRGZQMWF3QThwVThpVUpK?=
 =?utf-8?Q?Id1PArVgU3OBMZ9prngArk3M4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 531d7a45-e1ce-450a-7804-08da90a444e9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 07:40:43.3096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0eTkisKvkQJHD1awmpyG4VSlW6y1F3aBpp/I5086CnvSkM4kpPp23AVpp+Le1X8pLZPk39noNuF3YWRXJdtHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6053

On 06.09.2022 11:54, Andrei Semenov wrote:
> Implement an heuristic for X86 HVM guests which tries to use superpages while
> populating guest physmap on live migration. This should impove memory accesses
> performances for these guests.
> 
> Signed-off-by: Andrei Semenov <andrei.semenov@vates.fr>

Olaf - I recall you've done some similar work before. Do you have any
thoughts here, perhaps going as far as merging your and Andrei's work?

Jan

> ---
>  tools/include/xen-tools/libs.h           |  4 ++
>  tools/libs/guest/xg_private.h            |  3 +
>  tools/libs/guest/xg_sr_common.h          | 18 ++++-
>  tools/libs/guest/xg_sr_restore.c         | 60 +++++++---------
>  tools/libs/guest/xg_sr_restore_x86_hvm.c | 88 +++++++++++++++++++++++-
>  tools/libs/guest/xg_sr_restore_x86_pv.c  | 22 +++++-
>  6 files changed, 154 insertions(+), 41 deletions(-)
> 
> diff --git a/tools/include/xen-tools/libs.h b/tools/include/xen-tools/libs.h
> index a16e0c3807..bdd903eb7b 100644
> --- a/tools/include/xen-tools/libs.h
> +++ b/tools/include/xen-tools/libs.h
> @@ -63,4 +63,8 @@
>  #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
>  #endif
>  
> +#ifndef ROUNDDOWN
> +#define ROUNDDOWN(_x,_w) ((unsigned long)(_x) & (-1UL << (_w)))
> +#endif
> +
>  #endif	/* __XEN_TOOLS_LIBS__ */
> diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
> index 09e24f1227..dcf63b5188 100644
> --- a/tools/libs/guest/xg_private.h
> +++ b/tools/libs/guest/xg_private.h
> @@ -134,6 +134,9 @@ typedef uint64_t x86_pgentry_t;
>  #define PAGE_SIZE_X86           (1UL << PAGE_SHIFT_X86)
>  #define PAGE_MASK_X86           (~(PAGE_SIZE_X86-1))
>  
> +#define S_PAGE_1GB_ORDER        18
> +#define S_PAGE_2MB_ORDER         9
> +
>  #define NRPAGES(x) (ROUNDUP(x, PAGE_SHIFT) >> PAGE_SHIFT)
>  
>  static inline xen_pfn_t xc_pfn_to_mfn(xen_pfn_t pfn, xen_pfn_t *p2m,
> diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
> index 941e24d7b7..96365e05a8 100644
> --- a/tools/libs/guest/xg_sr_common.h
> +++ b/tools/libs/guest/xg_sr_common.h
> @@ -137,7 +137,8 @@ struct xc_sr_restore_ops
>      bool (*pfn_is_valid)(const struct xc_sr_context *ctx, xen_pfn_t pfn);
>  
>      /* Set the GFN of a PFN. */
> -    void (*set_gfn)(struct xc_sr_context *ctx, xen_pfn_t pfn, xen_pfn_t gfn);
> +    void (*set_gfn)(struct xc_sr_context *ctx, xen_pfn_t pfn, xen_pfn_t gfn,
> +                    unsigned int order);
>  
>      /* Set the type of a PFN. */
>      void (*set_page_type)(struct xc_sr_context *ctx, xen_pfn_t pfn,
> @@ -175,6 +176,17 @@ struct xc_sr_restore_ops
>  #define BROKEN_CHANNEL 2
>      int (*process_record)(struct xc_sr_context *ctx, struct xc_sr_record *rec);
>  
> +    /**
> +     * Guest physmap population order is based on heuristic which is family
> +     * dependant. X86 HVM  heuristic is interested in observing the whole
> +     * record (the first) in order to guess how the physmap should be populated.
> +     */
> +    void (*guess_physmap)(struct xc_sr_context *ctx, unsigned int count,
> +                          const xen_pfn_t *pfns, const uint32_t *types);
> +
> +    /* Get the physmap population order for given PFN */
> +    int (*get_physmap_order)(const struct xc_sr_context *ctx, xen_pfn_t pfn);
> +
>      /**
>       * Perform any actions required after the static data has arrived.  Called
>       * when the STATIC_DATA_COMPLETE record has been recieved/inferred.
> @@ -404,6 +416,10 @@ struct xc_sr_context
>                      {
>                          /* HVM context blob. */
>                          struct xc_sr_blob context;
> +
> +                        /* Set guest type (based on the first record) */
> +                        bool set_guest_type;
> +                        bool pvh_guest;
>                      } restore;
>                  };
>              } hvm;
> diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
> index 074b56d263..af864bd5ea 100644
> --- a/tools/libs/guest/xg_sr_restore.c
> +++ b/tools/libs/guest/xg_sr_restore.c
> @@ -86,18 +86,21 @@ static bool pfn_is_populated(const struct xc_sr_context *ctx, xen_pfn_t pfn)
>   * avoid realloc()ing too excessively, the size increased to the nearest power
>   * of two large enough to contain the required pfn.
>   */
> -static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
> +static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn,
> +                             unsigned int order)
>  {
>      xc_interface *xch = ctx->xch;
> +    xen_pfn_t start_pfn = ROUNDDOWN(pfn, order),
> +        end_pfn = (ROUNDUP(pfn + 1, order) - 1);
>  
> -    if ( pfn > ctx->restore.max_populated_pfn )
> +    if ( end_pfn > ctx->restore.max_populated_pfn )
>      {
>          xen_pfn_t new_max;
>          size_t old_sz, new_sz;
>          unsigned long *p;
>  
>          /* Round up to the nearest power of two larger than pfn, less 1. */
> -        new_max = pfn;
> +        new_max = end_pfn;
>          new_max |= new_max >> 1;
>          new_max |= new_max >> 2;
>          new_max |= new_max >> 4;
> @@ -123,8 +126,11 @@ static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
>          ctx->restore.max_populated_pfn = new_max;
>      }
>  
> -    assert(!test_bit(pfn, ctx->restore.populated_pfns));
> -    set_bit(pfn, ctx->restore.populated_pfns);
> +    for ( pfn = start_pfn; pfn <= end_pfn; ++pfn )
> +    {
> +        assert(!test_bit(pfn, ctx->restore.populated_pfns));
> +        set_bit(pfn, ctx->restore.populated_pfns);
> +    }
>  
>      return 0;
>  }
> @@ -138,60 +144,40 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
>                    const xen_pfn_t *original_pfns, const uint32_t *types)
>  {
>      xc_interface *xch = ctx->xch;
> -    xen_pfn_t *mfns = malloc(count * sizeof(*mfns)),
> -        *pfns = malloc(count * sizeof(*pfns));
> -    unsigned int i, nr_pfns = 0;
> +    xen_pfn_t mfn, pfn;
> +    unsigned int i, order;
>      int rc = -1;
>  
> -    if ( !mfns || !pfns )
> -    {
> -        ERROR("Failed to allocate %zu bytes for populating the physmap",
> -              2 * count * sizeof(*mfns));
> -        goto err;
> -    }
> +    /* Feed this record for family dependant heuristic to guess the physmap */
> +    ctx->restore.ops.guess_physmap(ctx, count, original_pfns, types);
>  
>      for ( i = 0; i < count; ++i )
>      {
>          if ( (!types || page_type_to_populate(types[i])) &&
>               !pfn_is_populated(ctx, original_pfns[i]) )
>          {
> -            rc = pfn_set_populated(ctx, original_pfns[i]);
> +            order = ctx->restore.ops.get_physmap_order(ctx, original_pfns[i]);
> +            rc = pfn_set_populated(ctx, original_pfns[i], order);
>              if ( rc )
>                  goto err;
> -            pfns[nr_pfns] = mfns[nr_pfns] = original_pfns[i];
> -            ++nr_pfns;
> -        }
> -    }
> -
> -    if ( nr_pfns )
> -    {
> -        rc = xc_domain_populate_physmap_exact(
> -            xch, ctx->domid, nr_pfns, 0, 0, mfns);
> -        if ( rc )
> -        {
> -            PERROR("Failed to populate physmap");
> -            goto err;
> -        }
>  
> -        for ( i = 0; i < nr_pfns; ++i )
> -        {
> -            if ( mfns[i] == INVALID_MFN )
> +            pfn = mfn = ROUNDDOWN(original_pfns[i], order);
> +            rc = xc_domain_populate_physmap_exact(xch, ctx->domid, 1, order, 0,
> +                                                  &mfn);
> +            if ( rc || (mfn == INVALID_MFN) )
>              {
> -                ERROR("Populate physmap failed for pfn %u", i);
> +                ERROR("Failed to populate physmap for pfn %lu (%u)", pfn, order);
>                  rc = -1;
>                  goto err;
>              }
>  
> -            ctx->restore.ops.set_gfn(ctx, pfns[i], mfns[i]);
> +            ctx->restore.ops.set_gfn(ctx, pfn, mfn, order);
>          }
>      }
>  
>      rc = 0;
>  
>   err:
> -    free(pfns);
> -    free(mfns);
> -
>      return rc;
>  }
>  
> diff --git a/tools/libs/guest/xg_sr_restore_x86_hvm.c b/tools/libs/guest/xg_sr_restore_x86_hvm.c
> index d6ea6f3012..2e525443ab 100644
> --- a/tools/libs/guest/xg_sr_restore_x86_hvm.c
> +++ b/tools/libs/guest/xg_sr_restore_x86_hvm.c
> @@ -110,7 +110,7 @@ static xen_pfn_t x86_hvm_pfn_to_gfn(const struct xc_sr_context *ctx,
>  
>  /* restore_ops function. */
>  static void x86_hvm_set_gfn(struct xc_sr_context *ctx, xen_pfn_t pfn,
> -                            xen_pfn_t gfn)
> +                            xen_pfn_t gfn, unsigned int order)
>  {
>      /* no op */
>  }
> @@ -161,6 +161,8 @@ static int x86_hvm_setup(struct xc_sr_context *ctx)
>      }
>  #endif
>  
> +    ctx->x86.hvm.restore.set_guest_type = true;
> +
>      return 0;
>  }
>  
> @@ -192,6 +194,88 @@ static int x86_hvm_process_record(struct xc_sr_context *ctx,
>      }
>  }
>  
> +/*
> + * We consider that PVH guest physmap starts from 0 and coninugiously cover the
> + * pysical memory space for the first GB of memory.  HVM guest will have I/0
> + * holes in the first 2MB of memory space (at least for VGA). Therefore we
> + * should observe the very first record (wich comes in physmap order) to find
> + * out how we should map this first GB.
> + * To map the rest of the memory space in both cases (PVH or HVM) we will use
> + * the maximum available order (up to 1GB), except for forth GB wich holds the
> + * low MMIO hole (at least for LAPIC MMIO window and for potential passthroughed
> + * or emulated PCI devices BARs).
> + */
> +static void x86_hvm_guess_physmap(struct xc_sr_context *ctx, unsigned int count,
> +                         const xen_pfn_t *pfns, const uint32_t *types)
> +{
> +    xen_pfn_t prev;
> +    unsigned int i;
> +
> +
> +    if ( !ctx->x86.hvm.restore.set_guest_type )
> +        return;
> +
> +    for ( i = 0, prev = INVALID_PFN; i < count; ++i )
> +    {
> +        if ( !types || page_type_to_populate(types[i]) )
> +        {
> +            if ( prev == INVALID_MFN )
> +            {
> +                if (pfns[i] != 0)
> +                    break;
> +            }
> +            else
> +            {
> +                if ( pfns[i] != (prev + 1) )
> +                    break;
> +            }
> +            prev = pfns[i];
> +        }
> +    }
> +
> +    ctx->x86.hvm.restore.pvh_guest = (i == count) ? true : false;
> +    ctx->x86.hvm.restore.set_guest_type = false;
> +}
> +
> +/*
> + *
> + */
> +static int x86_hvm_get_physmap_order(const struct xc_sr_context *ctx,
> +                                      xen_pfn_t pfn)
> +{
> +    int order;
> +
> +    if ( pfn >= ctx->restore.p2m_size )
> +        return 0;
> +
> +    switch (pfn >> S_PAGE_1GB_ORDER)
> +    {
> +    case 3:
> +        /* The forth GB of memory is mapped with 2MB superpages */
> +        order = S_PAGE_2MB_ORDER;
> +        break;
> +    case 0:
> +        if (!ctx->x86.hvm.restore.pvh_guest)
> +        {
> +            /* First 2MB are mapped as 4K for HVM guest */
> +            order = (pfn > 0x1ff) ? S_PAGE_2MB_ORDER : 0;
> +            break;
> +        }
> +    default:
> +        order = S_PAGE_1GB_ORDER;
> +    }
> +
> +    if ( ((ROUNDUP(pfn + 1, S_PAGE_1GB_ORDER) - 1) >= ctx->restore.p2m_size) &&
> +         order == S_PAGE_1GB_ORDER )
> +        order = S_PAGE_2MB_ORDER;
> +
> +    if ( ((ROUNDUP(pfn + 1, S_PAGE_2MB_ORDER) - 1) >= ctx->restore.p2m_size) &&
> +         order == S_PAGE_2MB_ORDER )
> +        order = 0;
> +
> +    return order;
> +}
> +
>  /*
>   * restore_ops function.  Sets extra hvm parameters and seeds the grant table.
>   */
> @@ -258,6 +342,8 @@ struct xc_sr_restore_ops restore_ops_x86_hvm =
>      .localise_page   = x86_hvm_localise_page,
>      .setup           = x86_hvm_setup,
>      .process_record  = x86_hvm_process_record,
> +    .guess_physmap   = x86_hvm_guess_physmap,
> +    .get_physmap_order = x86_hvm_get_physmap_order,
>      .static_data_complete = x86_static_data_complete,
>      .stream_complete = x86_hvm_stream_complete,
>      .cleanup         = x86_hvm_cleanup,
> diff --git a/tools/libs/guest/xg_sr_restore_x86_pv.c b/tools/libs/guest/xg_sr_restore_x86_pv.c
> index dc50b0f5a8..f8545f941a 100644
> --- a/tools/libs/guest/xg_sr_restore_x86_pv.c
> +++ b/tools/libs/guest/xg_sr_restore_x86_pv.c
> @@ -59,7 +59,7 @@ static int expand_p2m(struct xc_sr_context *ctx, unsigned long max_pfn)
>      ctx->x86.pv.max_pfn = max_pfn;
>      for ( i = (old_max ? old_max + 1 : 0); i <= max_pfn; ++i )
>      {
> -        ctx->restore.ops.set_gfn(ctx, i, INVALID_MFN);
> +        ctx->restore.ops.set_gfn(ctx, i, INVALID_MFN, 0);
>          ctx->restore.ops.set_page_type(ctx, i, 0);
>      }
>  
> @@ -947,9 +947,10 @@ static void x86_pv_set_page_type(struct xc_sr_context *ctx, xen_pfn_t pfn,
>  
>  /* restore_ops function. */
>  static void x86_pv_set_gfn(struct xc_sr_context *ctx, xen_pfn_t pfn,
> -                           xen_pfn_t mfn)
> +                           xen_pfn_t mfn, unsigned int order)
>  {
>      assert(pfn <= ctx->x86.pv.max_pfn);
> +    assert(!order);
>  
>      if ( ctx->x86.pv.width == sizeof(uint64_t) )
>          /* 64 bit guest.  Need to expand INVALID_MFN for 32 bit toolstacks. */
> @@ -1113,6 +1114,21 @@ static int x86_pv_process_record(struct xc_sr_context *ctx,
>      }
>  }
>  
> +/*
> + * There's no reliable heuristic which can predict the PV guest physmap.
> + * Therefore the 0 order always will be used.
> + */
> +static void x86_pv_guess_physmap(struct xc_sr_context *ctx, unsigned int count,
> +                                 const xen_pfn_t *pfns, const uint32_t *types)
> +{
> +}
> +
> +static int x86_pv_get_physmap_order(const struct xc_sr_context *ctx,
> +                                    xen_pfn_t pfn)
> +{
> +    return 0;
> +}
> +
>  /*
>   * restore_ops function.  Update the vcpu context in Xen, pin the pagetables,
>   * rewrite the p2m and seed the grant table.
> @@ -1194,6 +1210,8 @@ struct xc_sr_restore_ops restore_ops_x86_pv =
>      .localise_page   = x86_pv_localise_page,
>      .setup           = x86_pv_setup,
>      .process_record  = x86_pv_process_record,
> +    .guess_physmap   = x86_pv_guess_physmap,
> +    .get_physmap_order = x86_pv_get_physmap_order,
>      .static_data_complete = x86_static_data_complete,
>      .stream_complete = x86_pv_stream_complete,
>      .cleanup         = x86_pv_cleanup,


