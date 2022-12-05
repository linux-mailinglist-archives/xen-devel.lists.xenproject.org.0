Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D427642A6B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453736.711335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2CVw-00051E-5B; Mon, 05 Dec 2022 14:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453736.711335; Mon, 05 Dec 2022 14:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2CVw-0004yv-2K; Mon, 05 Dec 2022 14:32:12 +0000
Received: by outflank-mailman (input) for mailman id 453736;
 Mon, 05 Dec 2022 14:32:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Zgi=4D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2CVt-0004yk-PL
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:32:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9908ed1a-74a9-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 15:32:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7691.eurprd04.prod.outlook.com (2603:10a6:10:201::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 14:32:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 14:32:05 +0000
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
X-Inumbo-ID: 9908ed1a-74a9-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2YFS9Swmm0rfGOQ0DaSyiy5dbgVW0p2XlnnolVpN7VCqz0DDP0LRu6MiQoZiKcrmjLgxLq2KRG5Y6fpXPgEmJ8zAGzdxP0LnL4RulveNrilttxWCN2INioCRNbVh4QcZaA7HgBELHse/taAZpRCvf4PJZoOofXcXmH46M/iJsJy4lDRWZmhpJLnIFzbnCeaZVURxStXvCnK/tYgsxrevVr/5avd/xCbxNuVmLZmA/XIoA36sPryDyLElLiJYnqm2lzQVFHVxXzSAe2zbSx12tRUXZlphgMQy1xhd9mmwR/ydWUpF22R2NXcnOTtV1S6Zr6RtSJpFuxguj+Ujdfz8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcEqBOiY2VQUZ4juWC98x6PwggUQ0hDrYf1g+S46Q7M=;
 b=jrLMdRIRL5cc1hC+6wsNs3y+9O447XKSiVXOAXtRsUa5Acj8BMgg/iSXTeMBCYBWcd8pCKrWX92fouz/YE5bxOx9Jo+8vB+KYqG3ApkSJQ+CKIvRskNtz75K6+HtCdCibK7VvKihYFtLRqvw1Kp6kwTkmmWiJGC6jHSL8GbOQq2XJ6L27lprG9Pz6tg71ueYYnbQQRETNVgvMErJVZkiKvax+5/Mhg8YJ5wFpwQBI/l+VizfiA8ogPqY1WPG47dX00tdY/5ZRDOtL6Jq4MCNdMonDOs13O+vxHv38rwu+3HREIE5tiIEqmei+N+4S4qX+wwLNPt8QTDq6zR98SYyjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcEqBOiY2VQUZ4juWC98x6PwggUQ0hDrYf1g+S46Q7M=;
 b=lbKPRvTZVx6nlClb4UsoKssjvc7CF2HbPuA4MRgB4U5DP1YsSv5HuyvrbigtAVtV8M66ORV/WDk91714FT/Lx6vVPjTQ1yK3Dp9qtNUcrdKeHEbiRIvb62/t+3swp76R6bqXcCJl/UJyUF7sL0kjNzJuql45Y68mKxOMKdogwHL/TFtpoHpeUO3PLZ7DBhMmTnqS0UMn0q6Ew4XfhdxD7NeuBwzci0klxt8s8m+MOaV/i1VUQ+LnsSWU0fugaz7LikSPCMX0RrYheyL66Sj2zChoeAthVQDczvru1+viH6B1QwPoTmalwDs7f9KiLZQzttUa60gOSdwZ22OOFICBqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d3765fd-fe15-078f-89ff-5e5b9be633b2@suse.com>
Date: Mon, 5 Dec 2022 15:32:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/5] efi: try to use the currently set GOP mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: marmarek@invisiblethingslab.com, xen-devel@lists.xenproject.org
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221123154525.63068-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: 977894b0-0b37-4bef-bec9-08dad6cd7ba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7NEvcxhUofBAJLfmyU4QwKoGi/TR5vlqqzrV0n2VyCdwgdbkvPVN/228VESMqAefB41DJ7rHoP0isJXpW6foMdHkcjLZf9iR/iI1V03HRXptbCDA29K5zq/AQy7W498EuCnZYX6RQPK+Q1yI+ItGIJc2DhqQ+N5RMBshTdOuQl7xJeSi4enbpZ0BmoGSPReeeuQr4WFSRF2k3YpgP3njoGQUu8XTHRSlxcnwoxQZsU6m3B0x+Qd5FRyMstbUtnzjqmSVbX6CAk/ZtQLgm4AeAvMdIEMhQYUJYQF0h3bEeGv05a7PFEVxLkZiK7yc55lGNaVUf7v0cZBQSSTAXLIBqr+75/3V2biFMAeE3jdjBCfa26yDnezs5Y1O1eMAg4+2z07ysMCul/CBVUSmftsCpXfMoJ9TiBm+LS8Drje18BWr3x9sex/eoZ65Zg1Uvckab2HamnuVUZMkfNp9OSEdEHS3GN5mup39jvbBL9zCdZd0CAcdCDoNt6lWzVnsXJP8gNGyboDtYFmS/JI4OLUO80a8Pu+//KanBxbZd2x7Vmm2mdKK1Tx4VQ2mwDDRGCH55P1+3meE1vl/f9TFHRE58UHD8X50IlyWSFEhbccw2s5O0XcnL8qF2qfrWA8la8OKTKNJVWsiuM3/TTnh+WtPofBdGbFc5drbClRhDbt4HuXzzbIqITBMstoS8xdaGAP6NSUcBhweNuILdGugUc6I7RBUIkJcAjQfW2rvXJQ7Rhg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199015)(66556008)(66476007)(2906002)(8676002)(4326008)(31686004)(66946007)(6486002)(316002)(36756003)(5660300002)(6916009)(86362001)(31696002)(53546011)(2616005)(6506007)(6512007)(8936002)(186003)(26005)(478600001)(38100700002)(83380400001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlZlT2JQL25TMjU3SmFuSFlCTGxtU3IxaUdsRW1aY3Rlb1A5YmJDMVdNTG4y?=
 =?utf-8?B?WmdaTVNYTzJMTE9nc1NOK1FYUENCVCtSTmdOQ2hyTHYrcHR3RnRQS0ZUWDA3?=
 =?utf-8?B?MU9xaE1MeVZLWnhFRTN6YmRURWpHZUVON3MvVFhCRnE0YWh4TlRvN29NWEZh?=
 =?utf-8?B?S2VaWVVLYkROak9SNnZaNFMwa1IyVUZCV1hQTVhzYXJTWFFpMkFWNklrSVYx?=
 =?utf-8?B?NU1xNEFCcDJTaVF3VzFsMW9yc1FuS3RuSS93b3pFa3RzOTE0WS9jSExWb2di?=
 =?utf-8?B?aXhhNjFzMU00eVZrQndneVBSK3YwKzBDOFQ2ZkhGenVWbnZVU2l5WkZmVUJC?=
 =?utf-8?B?QzA3ODNvMkc0YjFyYmg1VUtNdTlUeHkvTElkYU9LRk5zVnVnb3JYN3FHRVdY?=
 =?utf-8?B?Y2c1eVo1akltSE1NczFTSTBQT1ZMUHdoWUJ1cDEzQ2QxNmlWQlQ4bitDODBy?=
 =?utf-8?B?Yk4rK0JFYmNjb2QyL2twaDZDK1lRQU9GenBYQ0JtcmsyQ25ITjdqNnpCRHhu?=
 =?utf-8?B?eDNlb0VxMGwwVjV2dXV5VHZML214UEZHUnpVdTBBbEtZRFJXYW94Tk0rR2lC?=
 =?utf-8?B?ZWZpVkhqNXNDR1hEeFFaTW9uNGF6amhROUgrOUlNOTRjQnRrWDdtMHZsMVpZ?=
 =?utf-8?B?b2xrZXZwUWZzTEh2MjY1NS9FRktoRERsbXhBQlM5NFNGOEt5enJWTm1TSHJT?=
 =?utf-8?B?RGU2UFBLVzMzYVhTRDkwSGM5R1NzQVg5ZFJ0UENMYldBS1daNWhKQlBnMG4r?=
 =?utf-8?B?cW55RHpCOW9HTTVRYW90UllBUjlhSURzV0pBU0wvRFFITElXMTdKQmdHdmlN?=
 =?utf-8?B?b3lVWVp6M20xSU1qd3dRYmdzUDZGV3RjOTZXQ1hGRjJSZUZiL3lUSzVRV2pj?=
 =?utf-8?B?OFNzVmFtanRjU3VOMDgxTHk4OERKQ3BCRHNpK0l4d3RDemRYUEpJalRKTHJy?=
 =?utf-8?B?VHJaT0kwZVI3T0ZKYVdEcE94dEtLNG56cHBpWUtoVmw1QVpDRHpBdEpEN2Z1?=
 =?utf-8?B?VlRoZXdCeXBIL0ZxeFE2Z3FJRHdOK3lvenR3cUoxOWczNUpQSno2K0l1YmRC?=
 =?utf-8?B?REQwYUQrQjdtMUtaSGFkRzl5UmhCYVJLeUJhZGZBZ2tkRWtZY2dlR0U5V3kz?=
 =?utf-8?B?ZGlBRTd2ZFppd3VsZ0EvNzF3YXljaUdBS2dyck9MSUlZUUtBUm5OOVZKaktV?=
 =?utf-8?B?ZHR2Nk02Ui8yejN2UTFTRnF4U01hRVo4UjA0bUg2VFROVmllQkVRcklDMDhz?=
 =?utf-8?B?aW5iSlBaWVZ4alI2Y1poT1l0OHh5bG1YWjl2UzllOHNiWWhuRjlORCtoaXcr?=
 =?utf-8?B?YzYydmxGMEN3WUVGZm9saTBhdnNaUWZQcHBCanhhbmR5eUhaaTBBU0J2azJ1?=
 =?utf-8?B?b0hkYlRGZDNSdEd1ZmpibkRBellhQlMrODZtNTRSTTNkcUpDNGdlTTcrdEtD?=
 =?utf-8?B?Mkk2N1E0VnZvWitTaUd6YmpOV1ZGTmxJc05HMmhlYTFXOTlYSnNvMmdYM1pt?=
 =?utf-8?B?ZDJMcWNRVGZsOHpSVDFwUzFCTGZmeFdNNGs1TmoySHAwd3dPWTBlUW9ITElp?=
 =?utf-8?B?QWxxRC9xTTV0NW1qUExvVlJBT2lyRXZjL3doNFVuQk1YM2J1dTNHeGtLbk9Q?=
 =?utf-8?B?RGVTL3hVbnhZNEpOOWRhSit3dW41Mit6L3BOSTNodlRKNXI4RDRWR1k1L05a?=
 =?utf-8?B?MXI3LzZqYi95d1FLYlRsZ0ZBdDR1eW84cmJERkpESkZpUnpJcVlPK3h1K1pF?=
 =?utf-8?B?SnRyOEplTzR5eEV4ZGJmUUZpRVFwSHdjemtPSXcveHZoRVUxcGZvZ2hTVW0y?=
 =?utf-8?B?TklPTk1hWDZEa0F1WU5IVkNseHVuTG9uR0ErbTlGSFVDU0JvT0s1VHBVYlcw?=
 =?utf-8?B?dXFMbGdNN1hINEpwWHF3QmM4dWo3R3M3djlCMUd0VldlSUtyQ1lBQ2pnNVgz?=
 =?utf-8?B?UkcyS2UrRW5wREpRdmtyaFhwYXdxN2VSVlFkMGloemFNUG5sNlFYY2tRTjVT?=
 =?utf-8?B?TDB0RHkzYW01MDk2OUJ4WWhkd2xhSzBEMGNRd01qdk9aSUlzZExseDJVTDFh?=
 =?utf-8?B?TU1xbVNjR09WdERCMjVFRmlPbXNPRllPL0xZcms1WHNZV2RIU3ZnVUNkMXQv?=
 =?utf-8?Q?U/asO9k5anJ1IeZdMda3o3F5i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 977894b0-0b37-4bef-bec9-08dad6cd7ba4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 14:32:05.8474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQ75c43nMPzpNxcJ9qX01ezAIUPbYtHEtvE1zU/T2E8Xo08FsvP+gejuL+RqzPZWCzuU9x5Mt6ckOKhzn6GrRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7691

On 23.11.2022 16:45, Roger Pau Monne wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -864,6 +864,26 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
>      UINTN gop_mode = ~0, info_size, size;
>      unsigned int i;
>  
> +    if ( (!cols || !rows) && gop->Mode->Mode < gop->Mode->MaxMode )
> +    {
> +        /* If no (valid) resolution suggested, try to use the current mode. */
> +        status = gop->QueryMode(gop, gop->Mode->Mode, &info_size, &mode_info);
> +        if ( EFI_ERROR(status) )
> +            PrintErr(L"Invalid current graphics mode\r\n");
> +        else if ( mode_info->PixelFormat < PixelBltOnly )
> +            return gop->Mode->Mode;
> +        else
> +        {
> +            /*
> +             * Try to find a mode with the same resolution and a valid pixel
> +             * format.
> +             */
> +            cols = mode_info->HorizontalResolution;
> +            rows = mode_info->VerticalResolution;

For these I think you want to replace cols and rows individually, i.e.

            if ( !cols )
                cols = mode_info->HorizontalResolution;
            if ( !rows )
                rows = mode_info->VerticalResolution;

whereas ...

> +            depth = 0;

... this case looks more complicated, as 0 is also already legitimate
as a value to come in. By zapping a non-zero incoming value you may end
up switching modes _just_ to alter depth, and then you may not fulfill
what was requested. For now I think depth simply wants leaving alone
here (and perhaps using the current mode's value if the incoming value
was zero, thus eliminating the need for a mode change in certain cases).

In a separate change we might then enhance this, e.g. by finding a
supported mode matching geometry but only coming close for "depth".

Jan

