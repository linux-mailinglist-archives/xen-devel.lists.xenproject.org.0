Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDE478D367
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 08:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592692.925485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbEyP-0008MB-0h; Wed, 30 Aug 2023 06:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592692.925485; Wed, 30 Aug 2023 06:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbEyO-0008Jg-SX; Wed, 30 Aug 2023 06:46:40 +0000
Received: by outflank-mailman (input) for mailman id 592692;
 Wed, 30 Aug 2023 06:46:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbEyN-0008Ja-47
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 06:46:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f75d54dd-4700-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 08:46:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7857.eurprd04.prod.outlook.com (2603:10a6:20b:24e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 06:46:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 06:46:35 +0000
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
X-Inumbo-ID: f75d54dd-4700-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8mBS3e+z8VZalxz6I/dLVLQ2PpB/Ojf6ddKRWt/m3CBa2M7efCfwOklAlNaYYWPJyZfYaO9Z+mn/Ydnk97FnoHsKbpHOvas3y2QgMB3yxxyfg92z0vaRGBnyCsYPWy7rWw1zo6nmJzFjEQ7VJCDiJRsPhHSWsi95EHRc5S07Azds9LNmeEaXtN3pUhmCTjiYL98r6vasqaKMmxhN1Cui/wHIFrspAqrzwCEg6nNiHHpZK0NhR7AnTs9RqZoJFO8Buc3jh1su90JWg4xDGs9o1Z/z3+NNGdBEBuQf2t9WqOel27EOM0yMzFAr/uSblfrzm6Vtp4iQ/9c/DgR5A7Ijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2uLSCX/srOm42XJ877ZZdC+w15vCDc8KMxDxQXE464=;
 b=f2xASKSlqapSB8KL95/O9A50Ljt+cCLCGEvaHvdPP4cc5mMHTGmkMsyhfRI4MAW7HdOchZBnN9a2vL9jgLS88ZwZKAoJdhPTNMiXYbzqwufLS8kM3TPC97BUATwOvO9Ofn5uKeUfP7XuA5G+vZoVqO+qci0cSDToQ/45V2aEbzWP85+AtLHBsvxjh3tXmJTqZhqBo1gK6osO7AizPUsT0I2hx7Md3u1sFUHZYlc71gtISJzjUK33dP4wV5AMi8gYVX6iENYvc7YnvJT4ny2u7RxXjoadfgFlDylS3p+UDGsEO6P3oxNnU+XTgIWbaYXZmace9vxC8LVYReEqXwXyOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2uLSCX/srOm42XJ877ZZdC+w15vCDc8KMxDxQXE464=;
 b=0t7ZJpp5NP89iiDS6Zau8AZCaGsscE4ASRP83dnx+feUdrMmB17mpWfJITvyC/D23s1b9xLtLA4aRREQ/DBQtPhiyD87yYPziKIZWn/lxyDycQGuyQhb7EWG1g9+qQHS9gWFR+i3NCPLiD4xGv2GaY2DUYNL6E71f7bQ0IOwxQTR2E57NSGr/+dwwkLcXvHjIljKH+ZGZbv1MGktsz6H0zBt/M08xeLZK7FezaJKzLXMJ8CYJ5IiCA64pPZEyswAyCk0kS8rWyhEH9LpmKUMcG8k2NW+Op4rgssPQIU/KnDcHOQ8l9ggGLiEyZ7rt9SILo5+dtlWUJ1qLAqiko8uyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <457bd388-afc3-af34-eb4e-755359bf4772@suse.com>
Date: Wed, 30 Aug 2023 08:46:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] x86: Reject bad %dr6/%dr7 values when loading guest
 state
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
 <20230829134333.3551243-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230829134333.3551243-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: c63ce9cd-8dc3-4904-821c-08dba924da63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p8dvhSxcgfePd446aujKEUZtt2X2Vuih99krhgBfYXpjMgpFVn/8gQ3UXR3fjskcHOI3STUHDd8LjSuyujI2ni9locpiIe4pfACAYThz+QZihx09XGXL1RP7dxPBez7yRkKWIznu5+bFNmNHPhxSqKXRfGMtNMJVWBHa9kPzxNkHcu4nSaMTS+U1KcLnd1qi4nvmzgz9q+l+kojplaTOIoIt4Ksd99SCmMl5JA2lVpZZO+BeuGwoBtwK5lvTrRXJGVN0qGmVrykY17mMXfYh7KJCfh4QoK94dxlMU+25ukuUA+x++U3I7HSgbQA8G5oyVEM2McLxCseJ03Y4Rd5oP7z0WaNQlaonJmeOzD+p80mhHdTqLngrPZvXFfU6aN1sj7oNjd7bxB4KkyitJIVtDqKOnFOLH4fcOEeiV4uFzarPpTZ11bMbgF9LQOCCv4F5sk0XyzgnJJW3wkazL0pf5FxWWer4IrrfrhxJr2YGq/BDCbTUbPhUkDMTizKa65FdONmMZmMvvQjwOQQq6WatuQBenTWlK45u/gY//rmanZXLJJ0cvoU7Gg3ldDzCv0I699suE8pHbs0VtXDZz4Tu2yH1YKNyMjZqLSAZgsyXRpGD5U8xqkzATyKKIc1xeu/kLN7fhCD/PbYgJ9QCawD3lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(39860400002)(376002)(346002)(186009)(451199024)(1800799009)(31686004)(6512007)(6486002)(6506007)(86362001)(36756003)(38100700002)(31696002)(83380400001)(26005)(53546011)(41300700001)(8936002)(5660300002)(66476007)(4326008)(8676002)(66946007)(2906002)(478600001)(2616005)(316002)(6916009)(54906003)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlJmd1ZYNlQ5T1B3Vll0RHg2T1ArOFV0M1h6ODBXMTVHSXVTSTBTaXNmOTND?=
 =?utf-8?B?QkkvY3V3ZHNtVFpPK05VeitCYnZyWHdDT2xrdGxzT0hvRGYrVDhkWlkyUk9D?=
 =?utf-8?B?azROdXRCWmcxckpCZ2hyUTIrT3ZoM1FkT3d2NzZXaVhjRi9pamF1bDM1NGll?=
 =?utf-8?B?V0RBZ2JxQTRWa1p4a1BUL0t0dXY4NGVSK21mdFEwTFJXdldZVlVEdlFjK2xv?=
 =?utf-8?B?MHd6YXoxdnZPOURRVEE4ME1pQmdrazJIbExmVmtWdHlLU1JmNnBMODZNNmpu?=
 =?utf-8?B?TXdjRGpTMEl1T2htMmJOSVJJaEl3aTdDNFc4V0tBWU9DMTdnbVZFYVZma2Np?=
 =?utf-8?B?ZkN3S0kxU3UvZXVhNUdxY21pRVZyNmtOM3pGck93S2Z0OXFEajd0b2hleURh?=
 =?utf-8?B?cDJEbWVHcUt6bXVBaUJyQ2NKWlVKZEJKWWg1K1VSYVQ0dE1EVTRSdlVHUlJW?=
 =?utf-8?B?TlRDMy9BaFRYcDEyYXRWOEtoWmZVMXlmVkZsaU5OSnhvZWk1Mk1XR2xuQjZQ?=
 =?utf-8?B?TVBYN1M3WjRWRjRYZHY0MFcya29VREFLMUxJVmFRRlZjaDZHaWQ0WFJBTnJH?=
 =?utf-8?B?U1RpdUdNaE9TRml6NkhVU2UwWXltbzBZblpteDJzOWh6ME9jbDdqbGV5UHJy?=
 =?utf-8?B?VlQ3eFNUdVlmNDIyL24zRXdIWFZKRjQrUVlkR3JDS0pWSzNCYTcyYUEwUDNF?=
 =?utf-8?B?U05yR2M5OWFiTmMxVEZxcHVRVFFBV25ob0l4bDVrSXhubi9vcURmRk9nb1BC?=
 =?utf-8?B?WVpET3JPaU1QdzdweERsdEJlakVwVFNBNmJpRGhZM0dZclU2OHNXWXVYb20y?=
 =?utf-8?B?NUo1Mmo3bTFiYVIzVDBPVElkblR3bjhJbU5BTmJQQnh5dTBqL01rZDRGZGh0?=
 =?utf-8?B?clMzU3JXbm5meGFnTDNJNU4yY2lkTGhPVXh5OUNMdStiNlkyeTJaN0ZRaExB?=
 =?utf-8?B?UWtOempQWkRVTzlCWVZGTXlnbm94MTN2bHdCU1FsUFdTRFErcmJLSmRyYXZ0?=
 =?utf-8?B?aEloYWpJK053WG5CR0tTSmJ0Rnl2aE8zWnZURzdiRlAwL2l2NVFRTktwaUw2?=
 =?utf-8?B?MlJjTWtDeFBiRTNlSWVPdVVja2xYdXJsTHVIRXc0U0xJM1Vac0VlY2JEMzNT?=
 =?utf-8?B?Q3pvSGFqdUtuQkNqM2pDQisxN2dBT3EvNDJLN2M1T0ZTZFBJWXltaGovQzlQ?=
 =?utf-8?B?bVdReWVUYkZrYVd0RmU4MzN6VHVUNmljcWxaeEZHSmF5WWc0V0FxcTc2N2J2?=
 =?utf-8?B?d1hITkJjaHdxZHNwM1Era1NrS0wzZGZLcmhmckJLTlhmRlVqNkNNQWQ1U1VB?=
 =?utf-8?B?K1hpZHNMdnl1d0ZwWVZCTjM5OE1xL0tkSlQzN2oya1RJbkd4aFNzU0d0VElp?=
 =?utf-8?B?RnpYVmVqTFhWbkxXamttOEZSVzJjd3k1NGtseFNXRWpkZjFCR2hqdG5kY1RH?=
 =?utf-8?B?VnNxalB1RlVPQUhNOHBiZDFXb3cwdG11R3o0UW9CcTYrRnBpczBDWXVob0pk?=
 =?utf-8?B?Z1l1eUNJRHZMTEJtaHI1VWY2YmFGdFpZY1h6MHgxMGg3N3VQQnhlaUs0QnVV?=
 =?utf-8?B?Ymk4UzlzTUsraGhVM3VhU2Q5QlB0Y1FiVGpCWHNNc2cxZGVGUVhJaFJXNFQ0?=
 =?utf-8?B?bm8yOEdtZnhVNUFEajAvTW5rcEM4Nkx1OUlZS2V3ZHU1SUlzYlBGRlhsSG1T?=
 =?utf-8?B?cjU0MUM1bGRBYlozNHRmc1AzWFZVb3dEK0ZwSnFoQngvSnN5Vm5vZ0g5OFRF?=
 =?utf-8?B?ZmtTa3ZOQi95ZkRQV3pmRWljK3JlVnZCa0JSSVFwOHV1SjJFSWpVWU9YejhM?=
 =?utf-8?B?UmdKSVU3M0FsSU83WGVZazRTRWJpb2NLQ0lyeVFCWEZva2xBL1RmUW8rM1pQ?=
 =?utf-8?B?d2dvWU45dS9NSTAybVE1RDNqYUMzd1BoWDdGTDhSUUJhZVFEMUVIcy9GT1Ro?=
 =?utf-8?B?K1UzODdqRXNwMC9WanZhQ1A3NjVaelYxWHFmQ0RRQmlvODZNaEpjdVROVUk5?=
 =?utf-8?B?eFp4emxlM052V250N3I1dStvMHZUcm5lMGhEMWxtRDZJQittaVRmeEd4TEd6?=
 =?utf-8?B?N3lNRGNLc1Mwdi9CZWp6TURkZUtMOVpHYU14MXBFWnU2L0tzSmRURVg0QUdW?=
 =?utf-8?Q?Hq2KzCO+Y0pIeovaCSTrpQgdH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c63ce9cd-8dc3-4904-821c-08dba924da63
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 06:46:35.2399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tVU+DdUoJTWj+NY+phLNRpYDZRQtNH9bqnRCC8D8VUhh24NEcI6ZAKCUml5lPgL+xN1Zqr8p7K/Xw6m1HEZMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7857

On 29.08.2023 15:43, Andrew Cooper wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1074,8 +1074,27 @@ int arch_set_info_guest(
>  #endif
>      flags = c(flags);
>  
> +    if ( !compat )
> +    {
> +        if ( c(debugreg[6]) != (uint32_t)c(debugreg[6]) ||
> +             c(debugreg[7]) != (uint32_t)c(debugreg[7]) )
> +            return -EINVAL;
> +    }
> +
>      if ( is_pv_domain(d) )
>      {
> +        /*
> +         * Prior to Xen 4.11, dr5 was used to hold the emulated-only
> +         * subset of dr7, and dr4 was unused.
> +         *
> +         * In Xen 4.11 and later, dr4/5 are written as zero, ignored for
> +         * backwards compatibility, and dr7 emulation is handled
> +         * internally.
> +         */
> +        for ( i = 0; i < ARRAY_SIZE(v->arch.dr); i++ )
> +            if ( !access_ok(c(debugreg[i]), sizeof(long)) )
> +                return -EINVAL;
> +
>          if ( !compat )
>          {
>              if ( !is_canonical_address(c.nat->user_regs.rip) ||

One more thing here: v->arch.dr is an array of 4 elements, i.e. doesn't
cover %dr4 and up. That's not directly visible here, though, so the
comment ahead of the loop talking about those other 4 registers is a
little misleading. Would you mind moving it below the loop?

Jan

