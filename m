Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BADD9589BFE
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 14:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380314.614420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJaQH-0000Dg-UQ; Thu, 04 Aug 2022 12:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380314.614420; Thu, 04 Aug 2022 12:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJaQH-0000BF-RA; Thu, 04 Aug 2022 12:57:57 +0000
Received: by outflank-mailman (input) for mailman id 380314;
 Thu, 04 Aug 2022 12:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ntlx=YI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJaQG-0000B9-R3
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 12:57:57 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150083.outbound.protection.outlook.com [40.107.15.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0deb4618-13f5-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 14:57:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7671.eurprd04.prod.outlook.com (2603:10a6:20b:299::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 4 Aug
 2022 12:57:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 12:57:52 +0000
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
X-Inumbo-ID: 0deb4618-13f5-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTsV/O230l/kAycvpcOiQLo43ItRPZbAusDPMMLdr+9XHpf745Kw/wz24i8H+6Olf6q87Uy3BZp9H13RZtITNVYk0dg0Oom6Glw9YkGTQmledEyvzxs4ucZNaO6TgN/r0ZGYc43G7VaSm5OtU6gzcHRYiUHPtn54r7lYkZArdJTcMpzpRFAS5hbCjRTKi14ZJJDH+QZkGBd3aGzIDOwwDf9KR7avwhVoFGgrsWB8DTRP3R23HCojNtz52RFYvxvBFTb1gJ+mCpDUZNQQQD/SCThj7L8/mHSO0Hgi3TnjGM2XUEEVTQ1kgqdUUyaczhpIbks5cLRTcBiYobUm7Mq8gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GX863cdnPMGRfoePH0UbtwPVNoWdonpfCfVzTBXZXQQ=;
 b=TAMtmBuGKAOAAF7rLdsjaX1KkPscbpnKupv/GUTXIYMNC8G3dCKWIupnw8IshpdUbBDMlqGJu+oagGK8JiqfImbSE17YuDJpdwurxCFl3gj6xCVoxjLEywyESI3FLRnYS9bjwRi3ZsyzyuAMr0tISWXz2bcz0MAZPPrrlx1mtiRWffLhjEnZKxHXndTVVYQBornswoLAJXsg0uAR2ksILSM1LCAQUWmCREWzrPqaFnMJx63nSiTObRFysiQ36xDJN4QUSmKKIt1Q5PDEkqViLLpkC0QuWVGgeMlM2dnCQTGDB6lFhFs9g4r4qsUWeJA35qYLPQ9IfZEQuKYVUeUqSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GX863cdnPMGRfoePH0UbtwPVNoWdonpfCfVzTBXZXQQ=;
 b=d9MZ2R/9Yq6L34R5UpKdXltM4iAhxB64aLOdkdUV5CZimN30nj2D2JL8SnGe7euOlsmxMO21spwSnMCs/ZB3VKJyxaBVumXO446UelAdKE59ERZsRXCBDoPRqBID0HutRYKjzTnmPGNi2/1Q1yXsMkr1vhwVkfOZXS3JIdW+v+aXrGtiWkcwpLu6rhhpvweufw/XDYETXtEwFx7X0AUHOsXkiMUHuIalg8FhvnqLOCZf8g0CBGdo2wEvH1Gfh95kmOFENUr2DI3YAXytKkPNIbgfJoNpMK2cO9xikdvHzozPtkk5yuneT75U1W5hd8ninDT8mHA1aCpP9H+ZVcIcjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3bd56b9d-023b-1991-90bf-bc44d3c75bc8@suse.com>
Date: Thu, 4 Aug 2022 14:57:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0106.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::47) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6872a1d6-f9bb-4bcd-2b3d-08da7618f0de
X-MS-TrafficTypeDiagnostic: AS8PR04MB7671:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UCd9aoDKgdNH6oinhJvddJm8za3SmgUXBXp3s0juUa8Kusw95FiSggIUttVTBmoQhM0INmP/GtU2wK/34FFyVdNHzRoUBIj/gLy/lUDILug0mgUm69fR+/NEWyfZgUOYg76f9xqjIVIZRGpRr8T1y0RVZr+FNQ2FUroz+9ev/Wfek4J/QlhUVEleEcY+gmYX/Zbx7qWoaoPedcJ7m5USVEBI5k2rapMWotH1kv7NGgl1/Kq6OBz0RT0CM7+X40dAHFjBR4TgQ0rfv0GjoMVULTRpdWQ0jzJsF+IvAonkFl4ambfAjNlMnE889dOROju74SFl5kJSQOII9OWGyqVcSDwPH2M2carwTgvZW9nkhjywA2gt7U5+TmkDnMqrQZ4L7wAZn7UXVSktIcmlhEnXz9ikuk4wr+PRdsJwqDgvFFURaAsBxuCw5irbDdyG4sz8L7nuIsZkw9z7xygFhkMEfMUdEYDCRrVHPsMketogFZ/GkaxmZSCZrTFprvl68CO2JeOBlHesQmEea4wGSvwPNpUhTU8kdF8gMBP3OYNW5OsCRuHIJKVC84hfyG89qFiRBqrk91oLRS5mvkqhLkOOBaxJRiyJ7+PQU2TyNYsujjr3u7PgTIF4dqvoYZBb4/n7z0Zo3F+fWUh4wwoZrCMjyx3zqi6c77YhLkGvsEmBzF3zRzkFs6qPwip9Ze4ko4ZcUsWtn9IkJlaDyVxhz/AKca71HSBoOT9am01gHWXRDiMdOnkFk1b/hN1Zm/Ad9iF6ylm9jaLK/qwbTPNMkebqAWNJ/aXguY9C57bxgpklToMr4dHJPNE8lEmBta1qXkDdXRTVaiGnav5E4JEUNJMGMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(346002)(396003)(366004)(136003)(316002)(36756003)(38100700002)(6486002)(6916009)(54906003)(31696002)(86362001)(31686004)(2616005)(83380400001)(186003)(26005)(6512007)(478600001)(6506007)(53546011)(6666004)(41300700001)(8936002)(2906002)(5660300002)(66574015)(8676002)(4326008)(66556008)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnZZS2ZlS0lQWjgzWDFISHJPYlJrZ29lZUJPcHVzMmxuT3BndyszWTZpUGVG?=
 =?utf-8?B?Tno2QkcxOUJIM3ozSUwrYWhBUG9SQk9uVWJQU041RCtnc1psTDFQYXQvQ25u?=
 =?utf-8?B?NENyaGdwMWxzbzhyZzcvemttQm1SZEVEdkdLTTJ5WEVMbURJUFlmNlJ6VjJC?=
 =?utf-8?B?UlIxNkJzNnloU1hGemJaQnFkVURKY0FhK1dCTnZVNkM0Nko2U0tQeHBtUEJJ?=
 =?utf-8?B?UlNwYlFBVGlUZENRYWVaVGVQUkVLdTNvSm81QU1EOGlXRUl1ZUJVRHgrRjdU?=
 =?utf-8?B?eUYreDNWNXNaNExrU1c0YVVSbEUvZ2RraTJtMmRBam5QdzQ5cGh5REFaOXhF?=
 =?utf-8?B?L291aEVBajNJdlI1SE5uZkt1VG5vOHZPSU41VTJxVk9Ya1ZxblU4WEdEL0FW?=
 =?utf-8?B?bnFJd2ZsTGk3OStyQzFJcWI1cFBpZ1BnNmY0cW1NbFBvZWptUlZUTys4enIv?=
 =?utf-8?B?enlMb2p4VGo5czdyaGQ5MzZ6bUMvQkVtdk85UG5XVDRraDJNa043K1kzaXNR?=
 =?utf-8?B?bXlFSnRJS3JWRy92UjNpendKcjZUNEJmbmJDcVIzTS9QbHJWRGIzc3FMcUx6?=
 =?utf-8?B?SW04eWhCalY1SUVGUlNzV2JTTFVhbDhmTEhxcEtDa0NRak45b1o2eWVuakhC?=
 =?utf-8?B?bWp0SGRiSnEySUN2U2tveUNKV0lnY2JEaWRFeW0rOVNuVDBiWWtMSEFRYWpx?=
 =?utf-8?B?c3ZyeTYvUjNJcGZhUGh4VUF5WVpQaEw1UE5iakdFMDAyb2lyV0JYUzJVcm9R?=
 =?utf-8?B?RFNWaGZ0Q3ZtZTViRW1qSkYxK09nbGxWb1ZmVXdMSUtrajhEZmJqZUdRM05n?=
 =?utf-8?B?RTZJZmI0UEk5cVUvbXZHck1kb3FMaUdSVldhODR6eGRpb29xcHFFSHR1T2hz?=
 =?utf-8?B?WXdHckI5QnVSZzVUQzhUcU9jck1SM3E4WUtxTFg1a3RSMGk2Z2c2N2lKcm9a?=
 =?utf-8?B?RjVnaiswVW8rNmdPaWV0clpiYk1RTkVmMGFhNVZIaVFnN1ZpT1ZiRjIwdmZD?=
 =?utf-8?B?M1I4T1BCZjZXdzRxWXBHQTFaWEFDSkxscENOTXBHd1Yxa0s1cENNWGx3VHNZ?=
 =?utf-8?B?SnVLWHEvQWZPc0xtUzVLOE5sTjN4ekJEazZnRUVFQkRRV2l4L1ErNVB0NkQr?=
 =?utf-8?B?TjRrcHJtbnpQMExxbmwvSDJCbUI2ajBlTkMwMHRaYnM1NmZ0dlJyc2JiNElF?=
 =?utf-8?B?T3pJcVJ4d1NuaXB5NXJ6Mk5ieXlzc3REUGs0WlYveFphUExPVHZQaHdHeUFh?=
 =?utf-8?B?WDNNOS9maE5IWnlxbTJjeERjc0ZINW4xa3AvTnpzV1VYUmtSMmRmQUhSSUdq?=
 =?utf-8?B?anpzdGlTams5ZWFkTFM0ZC9oajZrT2NOZ3VneTQzZEFLeHBCMldPVzV5anJk?=
 =?utf-8?B?aXdDMmREVk1aZzhWUG5oNkd2YjNSVHNHL1J0SzkyTmFmeVlzdGNwaTA5NUVT?=
 =?utf-8?B?ZFlHMDJIV1FqRmNEdS9Gd0w4ZjZnQlB3QjhIZ0hOcUovWGtmc1dsWWhwNi95?=
 =?utf-8?B?c3dRVDJYN0pLMjhsZ3FMZnVyeUJBd3RxK1ArOE92N29vWjhvb3J3Si9xQzJL?=
 =?utf-8?B?U203R1BIMCtCK1lTZ0dZRFVEU0tpUmt3cEZzcG9saloxNnc5NmZCSjdVVHA5?=
 =?utf-8?B?dCtmaFhTQnFGb2ZzOVp0dnh6enlXL0cyWTgrN3crcFkzb0xwd3YrUmxjeG1Z?=
 =?utf-8?B?eWFPRWdldFNLRTlsK3JHeE1VR3JLWGxtc20zSGtVWDZGMXZ4emJmcTNJc3Iy?=
 =?utf-8?B?SWh0ZUdYRVI5NUFkNHI2TWVQVnVlUzZGb3JhZitYL2VyaUNFU3NyQStmWGU0?=
 =?utf-8?B?S2FzdkphdGkwcmdnV1Aybk0vYzNFYXAybENscUlNQk5uMm42OXhQU1lZRk1S?=
 =?utf-8?B?enpaZFRGaEZHSlJ5OTBrU3BvbVZzMHJmckdYbWhRV1k4cFBsNnRHNEFyd2xU?=
 =?utf-8?B?UmNyWEloVTVRclNDSThPVjlZQlo2WmFlWkhSSGg0cDJ3OUJJZk9oTHdadjBw?=
 =?utf-8?B?K1BUb0tIK3E3a0hiMmIxQWZJWnB6VjFTK05COUZ4cDZEZDA0YVVLNHNRMkJn?=
 =?utf-8?B?Z0lwZ3dSNUtvdjhrdlJoUks3Umxna2ZUOGNjTFlTa2tiVGtYRk1BZ2IvcmN6?=
 =?utf-8?Q?G9NiRb3yq13utzp7fbqjnvMHw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6872a1d6-f9bb-4bcd-2b3d-08da7618f0de
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 12:57:52.0918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuUCpsHMetjr3iW6/sTw1Gbx+WaVDrfhC4PPeQ3OEAJg8y6tTS7Ou4vEk9WXate/WwlQd06A3OCnncSaglVymQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7671

On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
> +/* Defines the size in bytes of TRB rings as 2^DBC_TRB_RING_ORDER * 4096 */
> +#ifndef DBC_TRB_RING_ORDER
> +#define DBC_TRB_RING_ORDER 4
> +#endif
> +#define DBC_TRB_RING_CAP (DBC_TRB_PER_PAGE * (1 << DBC_TRB_RING_ORDER))

I have to admit that I'm always puzzled when seeing such - why not

#define DBC_TRB_RING_CAP (DBC_TRB_PER_PAGE << DBC_TRB_RING_ORDER)

?

> +struct dbc {
> +    struct dbc_reg __iomem *dbc_reg;
> +    struct xhci_dbc_ctx *dbc_ctx;
> +    struct xhci_erst_segment *dbc_erst;
> +    struct xhci_trb_ring dbc_ering;
> +    struct xhci_trb_ring dbc_oring;
> +    struct xhci_trb_ring dbc_iring;
> +    struct dbc_work_ring dbc_owork;
> +    struct xhci_string_descriptor *dbc_str;

I'm afraid I still don't see why the static page this field is being
initialized with is necessary. Can't you have a static variable (of
some struct type) all pre-filled at build time, which you then apply
virt_to_maddr() to in order to fill the respective dbc_ctx fields?
That struct will be quite a bit less than a page's worth in size.

If you build the file with -fshort-wchar, you may even be able to
use easy to read string literals for the initializer.

> +static void *dbc_sys_map_xhc(uint64_t phys, size_t size)
> +{
> +    size_t i;
> +
> +    if ( size != MAX_XHCI_PAGES * DBC_PAGE_SIZE )
> +        return NULL;
> +
> +    for ( i = FIX_XHCI_END; i >= FIX_XHCI_BEGIN; i-- )
> +    {
> +        set_fixmap_nocache(i, phys);
> +        phys += DBC_PAGE_SIZE;

While there may be an assumption of DBC_PAGE_SIZE == PAGE_SIZE, the
constant used here clearly needs to be PAGE_SIZE, as that's the unit
set_fixmap_nocache() deals with.

> +static bool __init dbc_init_xhc(struct dbc *dbc)
> +{
> +    uint32_t bar0;
> +    uint64_t bar1;
> +    uint64_t bar_size;
> +    uint64_t devfn;
> +    uint16_t cmd;
> +    size_t xhc_mmio_size;
> +
> +    /*
> +     * Search PCI bus 0 for the xHC. All the host controllers supported so far
> +     * are part of the chipset and are on bus 0.
> +     */
> +    for ( devfn = 0; devfn < 256; devfn++ )
> +    {
> +        pci_sbdf_t sbdf = PCI_SBDF(0, 0, devfn);
> +        uint8_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
> +
> +        if ( hdr == 0 || hdr == 0x80 )
> +        {
> +            if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) == DBC_XHC_CLASSC )
> +            {
> +                dbc->sbdf = sbdf;
> +                break;
> +            }
> +        }
> +    }
> +
> +    if ( !dbc->sbdf.sbdf )
> +    {
> +        dbc_error("Compatible xHC not found on bus 0\n");
> +        return false;
> +    }
> +
> +    /* ...we found it, so parse the BAR and map the registers */
> +    bar0 = pci_conf_read32(dbc->sbdf, PCI_BASE_ADDRESS_0);
> +    bar1 = pci_conf_read32(dbc->sbdf, PCI_BASE_ADDRESS_1);
> +
> +    /* IO BARs not allowed; BAR must be 64-bit */
> +    if ( (bar0 & PCI_BASE_ADDRESS_SPACE) != PCI_BASE_ADDRESS_SPACE_MEMORY ||
> +         (bar0 & PCI_BASE_ADDRESS_MEM_TYPE_MASK) != PCI_BASE_ADDRESS_MEM_TYPE_64 )
> +        return false;
> +
> +    cmd = pci_conf_read16(dbc->sbdf, PCI_COMMAND);
> +    pci_conf_write16(dbc->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
> +
> +    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_0, 0xFFFFFFFF);
> +    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_1, 0xFFFFFFFF);
> +    bar_size = pci_conf_read32(dbc->sbdf, PCI_BASE_ADDRESS_0);
> +    bar_size |= (uint64_t)pci_conf_read32(dbc->sbdf, PCI_BASE_ADDRESS_1) << 32;
> +    xhc_mmio_size = ~(bar_size & PCI_BASE_ADDRESS_MEM_MASK) + 1;
> +    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_0, bar0);
> +    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_1, bar1);
> +
> +    pci_conf_write16(dbc->sbdf, PCI_COMMAND, cmd);
> +
> +    dbc->xhc_mmio_phys = (bar0 & PCI_BASE_ADDRESS_MEM_MASK) | (bar1 << 32);
> +    dbc->xhc_mmio = dbc_sys_map_xhc(dbc->xhc_mmio_phys, xhc_mmio_size);

Before actually using the address to map the MMIO you will want to make
somewhat sure firmware did initialize it: The EHCI driver checks for
all zeroes or all ones in the writable bits.

> +/**
> + * The first register of the debug capability is found by traversing the
> + * host controller's capability list (xcap) until a capability
> + * with ID = 0xA is found. The xHCI capability list begins at address
> + * mmio + (HCCPARAMS1[31:16] << 2).
> + */
> +static struct dbc_reg __iomem *xhci_find_dbc(struct dbc *dbc)
> +{
> +    uint32_t *xcap;

const?

> +    uint32_t xcap_val;
> +    uint32_t next;
> +    uint32_t id = 0;
> +    uint8_t *mmio = (uint8_t *)dbc->xhc_mmio;

Can't this be const void * (and probably wants to also use __iomem),
avoiding the cast here, ...

> +    uint32_t *hccp1 = (uint32_t *)(mmio + 0x10);

... here, ...

> +    const uint32_t DBC_ID = 0xA;
> +    int ttl = 48;
> +
> +    xcap = (uint32_t *)dbc->xhc_mmio;

... and here (if actually using the local variable you've got).

> +/*
> + * Note that if IN transfer support is added, then this
> + * will need to be changed; it assumes an OUT transfer ring only
> + */

Hmm, is this comment telling me that this driver is an output-only one?
Or is it simply that input doesn't use this code path?

> +static void dbc_init_string_single(struct xhci_string_descriptor *string,
> +                                   char *ascii_str,

If this function has to survive, then const please here and ...

> +                                   uint64_t *str_ptr,
> +                                   uint8_t *str_size_ptr)
> +{
> +    size_t i, len = strlen(ascii_str);
> +
> +    string->size = offsetof(typeof(*string), string) + len * 2;
> +    string->type = XHCI_DT_STRING;
> +    /* ASCII to UTF16 conversion */
> +    for (i = 0; i < len; i++)

... this missing blanks added here.

> +static struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
> +static struct xhci_trb out_trb[DBC_TRB_RING_CAP];
> +static struct xhci_trb in_trb[DBC_TRB_RING_CAP];
> +static struct xhci_erst_segment erst __aligned(64);
> +static struct xhci_dbc_ctx ctx __aligned(64);
> +static uint8_t out_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZE);
> +static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
> +static char __initdata opt_dbgp[30];
> +
> +string_param("dbgp", opt_dbgp);

This duplicates what ehci-dbgp.c already has. I guess we can live with
it for now and de-duplicate later, but it's still a little odd. In any
even please move the blank line up be a line, so that string_param()
and its referenced array are kept together.

> +void __init xhci_dbc_uart_init(void)
> +{
> +    struct dbc_uart *uart = &dbc_uart;
> +    struct dbc *dbc = &uart->dbc;
> +
> +    if ( strncmp(opt_dbgp, "xhci", 4) )
> +        return;
> +
> +    memset(dbc, 0, sizeof(*dbc));

Why? dbc_uart is a static variable, and hence already zero-initialized.

Jan

