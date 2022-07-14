Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742B574CA6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 13:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367632.598711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBxUF-000628-Tm; Thu, 14 Jul 2022 11:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367632.598711; Thu, 14 Jul 2022 11:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBxUF-0005zN-Qp; Thu, 14 Jul 2022 11:58:31 +0000
Received: by outflank-mailman (input) for mailman id 367632;
 Thu, 14 Jul 2022 11:58:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBxUE-0005zH-JM
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 11:58:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 462cbe32-036c-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 13:58:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB3PR0402MB3676.eurprd04.prod.outlook.com (2603:10a6:8:d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 11:58:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 11:58:27 +0000
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
X-Inumbo-ID: 462cbe32-036c-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkkfeTlANHevIDBzX2kP62nBjz3l5atPi1AHzaZLyDG6gcIZ/LUtrQSiub5pkosiJk8/QMi0Xe7DO53S+E1sQhMoGWtRq3w382U29U5OImNEPG743arObIovkiO4XNzPYo8azKctb3/ghI7fskDwrjDsRljqzHiL+Z+5FRKB/4HtNGmJCDzgc4RV/MqLsg0tlmjwti4O8KGmMxDEdwGs08zoXnUaVzHtvasxaaAAI0G9ewdxL0jJP1gV+sCE9LqxON7W7CpfE9K/k31XYjiD5slmpf+qdceQkusyoWoTKD5H0l9KpOrcu7LeegDJ/Sqxam6+LrDz8uUtm6B0Srr7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11unytSiLs678PrZ8sc7YV1Xvo4MxclbMNsP2wJRGwI=;
 b=Lh5h87BDt62MPCm91iLYhVFwtmbtram3VFCqcwXZN+Xiv6oXW4w6GrDpggdkbPkTbkxLZRX2Ji8UWT+ZGC/dridWuShigpph/eIgfmq9D4VLYPWzcxl73+O+/dLUmURxu88D+oCa1cFU4w3cTS5OFX8Eia/mFNt7+0m+GlR828bhzCK10oWZ6Env6V5c45l45Pdfa59GJ7aVfjHsNOeh0AbrPDuT/DULnPJivt4avvEYEruzTh19KxCwDuYDJZmljliszzNHEvn8UqE1G7PncQb5p1KbAyg9SjRT5FY9G+sa9r5b6VISwgkqXtMEEzjEkJjYeIx89abF+n/ZCQMwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11unytSiLs678PrZ8sc7YV1Xvo4MxclbMNsP2wJRGwI=;
 b=io8GNxrl5Qiz80bcb00md+FatEC7hZzuud5gee6Xkt0EMolKEb/LMhZ8KqS4nJFGyE+7gA7IGX2MxxSke7RROyCQ5sSZaWKT9ALVNk/RremY1SPTZvyxefgt5pKpSPxHVr1nWxKn7tn1Spvo2R/0EIqq4orQL9p0RhkjY27CrbzOU0uOOebMlHtzVD2Aojz9oC1goWRoEIcdBd8F8YpjVXQGI3Nd3XiYv1k9t2snrwOznPLovTcUn9siafwdBVEr6kOEbIE6RBeDZ0eTdStxpZrqP/2/SbAvvGLoaGHaIDot+plKr6ZeKpGHg6f2oealF8o+J2ekIrdrQKYcL9H0VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc195aca-79e1-7faa-d29a-ea0626e257ad@suse.com>
Date: Thu, 14 Jul 2022 13:58:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/9] drivers/char: Add support for Xue USB3 debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Connor Davis <connojdavis@gmail.com>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79c96960-3951-4505-4de5-08da65902948
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3676:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8rCj+LVeaL/12v+7CFyW3m/bgTd/glICzSNHnFwnDANu0ucKYSaoQ1lVaNpXT5eqiaDj/Nsl4wQneYXd82piE34vODSaZ0+C73/qbQYChqrb6VZDlQnIsYOPMr3s1q0CBXnhfTiYh8M0IjS9aCKNCBUOWmkdCeTAejwUJxLPbDHjUpA3wS/a0YcnFM8sXlrMcuVnow72ZNqefI8j7LA9tIbSgkSY2jHeDeaKAuXfF/Iecy5zvJ7CSSWfMA/wGNw395xikoI1jwg1k6jxQOVrYXpVoB5KvRN9b2H1GaCnUBJqAeBiz1jfEewwpgFr4Ynxy6gEZT6pcSSY67gfbyPBv6FgOzFFDCrDm12v/KEtMuXVJnBvmIc6f2AsLmP8PdpYRCHYnplwpA4Hq/0jqAi6ybEAnPRZDrhuZwjF/P5jrSwCDGQgLtvd6QImHETE5BqvpQYFzlJ6LMI16fllQJYTcqoQHzYHrjkLrxEmi+6+7+bXavyZizulQFtqFH3HkessvKceqjuOqzuMsSE2zWrBEu8BzRNlffl3RNVBcYXTxH65Kyq9dvL0rUJ2f0hDSRlMRKaqiYzMwumLJShVj2BgePC7A3m0coDtkKtRIf1JmUF47I9ACZbeAhNZXbAEJalfZKkHqiiLUrfOTr9dhsK8ifyJlnP5zpsEQguEarV1RalJ0QhYAaXTa9MSwJQ2FbEB5PpC3O55qe3UludCTcwIutiJSHNGEDfxSeiyWva2VakxwxZp81B8/5KAJQZ9zpoQVozZ0IGA3I84grNIKkrCymSFrNeNVLS08/4UsZJMdPotKrCUOE9pLIW2ps5rFjA50JPTDKB0tgLKwzEXfkuq8pPBFj8i19ZRaV08NLtRF5Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(39860400002)(366004)(346002)(396003)(186003)(2616005)(38100700002)(2906002)(31686004)(5660300002)(36756003)(8676002)(54906003)(6512007)(41300700001)(66946007)(8936002)(478600001)(66556008)(66476007)(6506007)(6486002)(26005)(53546011)(4326008)(31696002)(86362001)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEZ3MWFvMS8vd3B1T01kL2FVMHM3RUYvcE8zYkw1MEk3SVF2WElFcklHR2o5?=
 =?utf-8?B?OThTRXU5RGlIZld4NU1oeEM0VENKRHU0YjlNaEpsaVVCbFExWk1qQ0hyRmFT?=
 =?utf-8?B?eHoxT3MyMFZIek15OVh2RkVlRWNZV2lENGh0c2JVcE5tZG01RlBFSFBnaDla?=
 =?utf-8?B?TmhueHgyTTVCZWIvblBJRVVFeU1EQkcvWXVNNFNpekJBVTZQYnBFZElKSmJZ?=
 =?utf-8?B?YmNnTm9oWUNuUGVlWTEycGg2NmVYMVZjWldjZ1hPdFZWRDJkWWJSODMxOGJr?=
 =?utf-8?B?MEhFdkE3a3RSSXNUdGFiUEdUSlhtMUNCeXpzWEQ3YThGQ3lIbVYvYXc1d2dL?=
 =?utf-8?B?NG9VNll2Uzdkb3RvalFVTUF1TVFPNDFaSTRMdUZBQTZNRXpJRXU2Rk5PNmNx?=
 =?utf-8?B?R3gyQXZESk9mWTFYR2JoYjFRN1U1V1QzcWU1Z0dmUThOUDR4ellscmVUSzFV?=
 =?utf-8?B?T0JjK0ZhUFJRZmpoeEpESE5QMmxPTDUzbmFBMDVqUjRQWkNlcWFNbS9jelJ1?=
 =?utf-8?B?Vmg2OGZKRUZCcGFLNGE5Ri9BRGo3d0xJQmIvQzcreXJ5TnZCU0xWN0ZNbzV2?=
 =?utf-8?B?cHk3TmVMK3NNSkVOS3FRRUxCUEhucnpLZVJkK3djTm9MNHN1dzhrcGFHbWNK?=
 =?utf-8?B?bDFrdFg2WXBtOFBBMEo5anBKWkJUNXpSZlRCWWlFLzlSMWkwbHhpZVd5cFVj?=
 =?utf-8?B?S3RLeEVneTRkTzB2K2FKMWdwYXBHTlpWYXNtem5mMVhWTi9lb2RaTTlINlcy?=
 =?utf-8?B?Z3RselpCcUQyRy9mRnpPY1R1Wm80QmNZTnVxV0t5TTZCZEZ6SE1Db3VYNmZ2?=
 =?utf-8?B?cjY0aXU3Uk51YVQycERpR0tKK3R0NnAwMnU2eUZJWWZVYlJya3did0ZQZEIw?=
 =?utf-8?B?c2doblVESDBVRHhoM0tVTUVaSysvTDJSMDRINS9TRzg2VnBwVnpUWDMraUtj?=
 =?utf-8?B?YTVEci9tMFhaSlVjaEVQb1R2dmJyZ1laQ09ueWgycVExSlZTV08ybHZkdEpM?=
 =?utf-8?B?QmVkWjBPeUpGUWxpK2FGTGR4SHc2anVlS3lvMHdVenRDK0g1a2ZhMk8zQ05s?=
 =?utf-8?B?eGpqTmhtUFFqdEVNalBvc1d0MktodWxNOWFkMS90VFFqWitNeHRlUlFkc2t5?=
 =?utf-8?B?a3pGSkZrclUrNkkxS0ZYclIyMEY5NVBpZ3g1V2I5VTdaVXhnQWZ2K0lNQUNN?=
 =?utf-8?B?TENjcm1JdU5mbnl6L0RmbVExc2VTVU8vcncraEQzQlNJenBsc0dGWXp4V3dq?=
 =?utf-8?B?UjJKQmZ3WWJITklZVWxHY2lodGU4MHNkSEREWHcwNCtIVTRhRFdYWUkwL2RH?=
 =?utf-8?B?eGYyQnU3S3U3VTZ5VGFwWWptaGlxSGFaYlVSRjNYaGZuU2VQa0dta3dxRVB4?=
 =?utf-8?B?TjVhRTRKMnVDNmJuVFlZUUtSeWgvS0lxbk9xbzIwck1uamtPNnNDTmVHM2Vp?=
 =?utf-8?B?WUFUSFJxS2M3QWNyRHR3RytuU1RKdW94S3k5ZUorTCs0NHUwYmsxR1EycHAy?=
 =?utf-8?B?V1ZhVzRrYzZ5ZmhYNW9aMERlT25TK2hxYW9ub2FrbHpwM3BWdTd1MTN5VG5N?=
 =?utf-8?B?MkdnZnpKenR4bnpQY1dHckczblFUamR6REJDNFk4RHl2U1dLeTYvY0Y2ZW9X?=
 =?utf-8?B?Ni8xLytYdC9ReFA5MkdEUzRvMFJjRXZCam5ybVcvU2FjWS9UbzZLdGxkditI?=
 =?utf-8?B?T0FhRVYwV3V2bzhmNVlvd3VXR1JvZzhTZ293cTJZSlR1NzN4WVBKSUdBWXor?=
 =?utf-8?B?d0RkZVgxN0lQU2lVeTdnOU5DaEVkS1FwaUxvMWJ4bWdENUVLYkpvMi9QNkVI?=
 =?utf-8?B?Tkc1NmlEbUM3RXpsZWk1ekpBb3JTSVoxTm1wZktMU1NEaXR6RHZkbmpFcHV0?=
 =?utf-8?B?SEJUd3JxQWdSSlltWTRiUzBWWWxyRGVjTEFuTXlXTFkwcEI5L25aR1lhRDNU?=
 =?utf-8?B?anMxK05tVkhJK2hkSHBwOUYvdU14TXpyaHFCZTlhZGJwZWZhMVFxVURFTHNp?=
 =?utf-8?B?emdocHFwZE9aM2lObms5TVZXcTlqNW1na1FpMEF2UER0b0pkZ0ZSeGhGamp5?=
 =?utf-8?B?NGRmTnEzbXlzbGVnUVlweXVXa2pWekNKODR4cUx3QTZFMW4xWVljYTJlTlRa?=
 =?utf-8?Q?MTjSmIt7NDvnT3u2dY0j8/Jfq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c96960-3951-4505-4de5-08da65902948
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 11:58:26.9896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5N2ejT+/OeDuqLGIIWQH2fOZUZthDIqcxQ6YJyrd/d4IyljUD0U0FXBK6LU1/OEgcocbVxyDXv/KI9wWf9i9Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3676

On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
> +static int xue_init_dbc(struct xue *xue)
> +{
> +    uint64_t erdp = 0;
> +    uint64_t out = 0;
> +    uint64_t in = 0;
> +    uint64_t mbs = 0;
> +    struct xue_dbc_reg *reg = xue_find_dbc(xue);
> +
> +    if ( !reg )
> +        return 0;
> +
> +    xue->dbc_reg = reg;
> +    xue_disable_dbc(xue);
> +
> +    xue_trb_ring_init(xue, &xue->dbc_ering, 0, XUE_DB_INVAL);
> +    xue_trb_ring_init(xue, &xue->dbc_oring, 1, XUE_DB_OUT);
> +    xue_trb_ring_init(xue, &xue->dbc_iring, 1, XUE_DB_IN);
> +
> +    erdp = virt_to_maddr(xue->dbc_ering.trb);
> +    if ( !erdp )
> +        return 0;
> +
> +    memset(xue->dbc_erst, 0, sizeof(*xue->dbc_erst));
> +    xue->dbc_erst->base = erdp;
> +    xue->dbc_erst->size = XUE_TRB_RING_CAP;
> +
> +    mbs = (reg->ctrl & 0xFF0000) >> 16;
> +    out = virt_to_maddr(xue->dbc_oring.trb);
> +    in = virt_to_maddr(xue->dbc_iring.trb);
> +
> +    memset(xue->dbc_ctx, 0, sizeof(*xue->dbc_ctx));
> +    xue_init_strings(xue, xue->dbc_ctx->info);
> +    xue_init_ep(xue->dbc_ctx->ep_out, mbs, xue_ep_bulk_out, out);
> +    xue_init_ep(xue->dbc_ctx->ep_in, mbs, xue_ep_bulk_in, in);
> +
> +    reg->erstsz = 1;
> +    reg->erstba = virt_to_maddr(xue->dbc_erst);
> +    reg->erdp = erdp;
> +    reg->cp = virt_to_maddr(xue->dbc_ctx);

The only place this field is read looks to be xue_dump().

> +static struct xue_trb evt_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
> +static struct xue_trb out_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
> +static struct xue_trb in_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
> +static struct xue_erst_segment erst __aligned(64);
> +static struct xue_dbc_ctx ctx __aligned(64);
> +static uint8_t wrk_buf[XUE_WORK_RING_CAP] __aligned(XUE_PAGE_SIZE);
> +static char str_buf[XUE_PAGE_SIZE] __aligned(64);

While I think I can see the point of the page-size alignment, can you
please clarify the need for the three instances of 64-byte alignment?

Jan

