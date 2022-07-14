Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58531574A67
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 12:18:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367266.598343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvux-00015J-5f; Thu, 14 Jul 2022 10:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367266.598343; Thu, 14 Jul 2022 10:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvux-00012Y-2y; Thu, 14 Jul 2022 10:17:59 +0000
Received: by outflank-mailman (input) for mailman id 367266;
 Thu, 14 Jul 2022 10:17:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBvuv-00012L-U4
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 10:17:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ac18a05-035e-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 12:17:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7133.eurprd04.prod.outlook.com (2603:10a6:800:126::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 10:17:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 10:17:54 +0000
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
X-Inumbo-ID: 3ac18a05-035e-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeJIulJ56Nb2dkf7rqk5rSd7PQHHLsemaHpwr1Md+PczuAdlOFldmH95SjTe1qwX02IUNEgfCXzAqijKm9oMPS0tEY62+c/SqwKDwBJCRr6VcvqlbQEi12NBIGg8TuoLNkNG6MFVv+6KPOBnFYGXDEDOH1Ca4Rg+eddIxw9nOpUGL5QUoLfbihI5vv8szVoyaHpx6c+DfNMVzIRxArhp8makvdhqapGXn3QUjLV6HaxBqPptZWMMOQYu+pNmwnIhUyRsehpT0W2EOcnITpEodOCLwD/Lkpop3RX1udKZDPH/R0F68980mheIjUncqWVwYuMnIegkQL5h5Z2fIoxLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j03mID6bl8/6lDw0QEjHD4R/1oGOPe96nOda6mrupuE=;
 b=FjunMJUG/SwllBqhSYtp9DK0r+CJitRIXPADwM9plcwHhhvUPtE1V95wl72dMISt2Wh26Y+DjlNK0I7A/ZXlqccW2lXGBWKqyy2zT1oG232nymekqM6jb8cVbvsRLJu42lwa7Ys09ztlQ/q57EWE+u60UjLWZ5+f4B4dK96R3D8JNN/6DPJ+X6Vniy7xvPdNadJuqjQozgzsdFvlgRL8qlgpgJapn1iTvmYp1cWojmlG2KJvoBsY0PEYW7DMciwRjQ3beSph2SSebiiyDmfrfFD5wJ/g651xuks6i9gligUN9Sw0MobcuIRcDEZ65qywtbiJF1t3WkhBRea1JrsweQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j03mID6bl8/6lDw0QEjHD4R/1oGOPe96nOda6mrupuE=;
 b=ZUG/ZInIQPuf6zKjOgW+ca6qvrAIo700hhaXM4DelS7QWe1upDHySa9jAYmFYTcySNLZO9oasfGLs7Zi6fTGXLODQBEcUyw3IzvPhcG8X6HPXIyqTazLc1/YT+Zcb54RG+vTHm0eprrUN8kgCwsaiyEDffXXh3ySsuE1ESVZDNJ5UQsQv7wsFVPEPkyj9MwH3YQwSurxAFD0qpG9Lqctj74+/PiP/8S52VYOUQS0Q276tGdg4ux6YJKQk07XhVijkm2d1rhweeI6rab9doVACyBvnmY8aktviuIxoRjuImEieVBQsIOyU//Hb8uqXhUFzVGyo1ygBazjdZloA0AVqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <38020a5e-121a-932e-691b-6eaf435be7d2@suse.com>
Date: Thu, 14 Jul 2022 12:17:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/9] IOMMU: add common API for device reserved memory
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <2538c56f6881e4e2a3e5cee3cbdeebb88a59ccb5.1657121519.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2538c56f6881e4e2a3e5cee3cbdeebb88a59ccb5.1657121519.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e6ba117-6816-40a7-c74a-08da65821da9
X-MS-TrafficTypeDiagnostic: VI1PR04MB7133:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3UBQREBIYXukoMHEw9EBN3HVqWBfNsFeygWOUM264TPCXIhHprwiM2c3Gce8BdBH8V87HK0OEtYbAhhoaSbASI/hE8rTde+NwHTAj7pNJFusmu1DzmB2FFL1kTYFcD8WFPjFwPJ75Cwr17JyJad5r4zUJg8He4EKX52iWKRwLaYeRDcEkpTvUgjCCO2tmnRro5Un8oEJIFZ9Mn3NnHaBVFHyQyUoruCO7KNYfwDg/puSBcGx4/ZcC4Lw5EP30B6D4sM+DjlARO37c60HboDP17V7LRaxT5OCxUvOa3gksdOWy/cocMnL/6A7S0Ak7SuB1uzTpDBnTNCwxwvJwKVByaJd446ZKhGzxfyEiLNApS1vbLKCA0O8JiIjywSQhVpgdojpuNbaK2FkiLORWWdjHodao6Wjxy5ahWTBdDpENJUfNrc4eae/74UoiB379qq7RkTCniil3WsGgbUIUhfSZUdw892kDJWPVT7WaUchjFW0yGRkwSjBWUEIKx37B8c3cLYbT1kP44N6hspo08Gdw8IHOdnun28Zo/AohBZTpqR4tvWCWUW581mscWO+ArP91E5YWEmjt9XugC+3N2eqqeI1n+pyBWJMPl7fm3QbJ/iRAUmeiFBWsA+R+1X9xJedpN9LsY1KHtMzJyMzbfs8PFeNlwhJJPjw9S8YbMo9TUylXN2DCt6oPhN/Brflvuj4mjOhjguBFV+GO1KKn20zQyhnsaOhoBf82jWq4Lc5WEyo6JZ3h2iWKMp7eiNQ8X6aeU5KsN6cYs4Ff7wUMT+AHx+nL8LP7hd9YeLa7mxoU3W/qb2vrFH7DQwNrqTmze8kw/kgbB45PaFyun10YSn58BbxNdLmYNu8GFVHP+xykak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(376002)(366004)(396003)(136003)(36756003)(5660300002)(186003)(31686004)(66946007)(4326008)(8676002)(2906002)(66476007)(8936002)(66556008)(41300700001)(6486002)(478600001)(86362001)(6506007)(53546011)(316002)(26005)(6512007)(31696002)(54906003)(2616005)(6916009)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3dtbGNMbWRWRThiSUxpdXhiWkJvTkc5bWlFSU8rdk4wTHFJVlpidElIVTI0?=
 =?utf-8?B?clBsOWpTRmdOZnNhdlA2ZFdFc0VpcXllNWhRcy9yd2MwRmZXbENWM29GTDFQ?=
 =?utf-8?B?UFhOS3JoL1BsZnpqYlhGUit2QmVDRjdtRitGS0taalhLTk82RUl1ZCtvYjhI?=
 =?utf-8?B?anVrVW1lRFBnUVVDdVpjSVM2emNmRnR5N1FJZHdHcHNPbmpsa3ZkbnA4T0Jo?=
 =?utf-8?B?SEJUaXI2WDU2UFlUaW5rMXFLM3VKczFXOElRdWxvTGp0OTVkNEhmdm8zRGFy?=
 =?utf-8?B?Ny9ieElQZHVZQWU0NC8xWkk1d2dWblc1a3dmREkxSldpK1dCSmR0QVZQNUI0?=
 =?utf-8?B?V1Jnc1A1Y2FqdjVpaEgyaWNHSWNNMUg2a0U0SlJwTlFlWkI1VzR6czFzeTc2?=
 =?utf-8?B?UDlLcU83eGhhSEkyUW92NWtwajBtdndSYytNRWF3N3Z6eENVTnhpNEord3Fj?=
 =?utf-8?B?OGpGd3FlTHZjQnFFQlVJdUNyQjQ0azd5V0JWdzBySFlGcWh3S3ZHL0RTS1hi?=
 =?utf-8?B?VEI2TDRlTTc3LzJkNTA0ek5sVjlZVkxzWGYvVHY4TXRneXNiQ05zS1V6ZExP?=
 =?utf-8?B?dkRxTDd5NHpMWWlQNFlWQXhtQkdtOSsvOXlHcXNJZ1RDSTJ4dlRkdEs3eDJF?=
 =?utf-8?B?QmN5Q2psWXlDWW9rVXg5OExTWGZlMmQwNThuOVpXRWo3cG8renRDeTk3dHNG?=
 =?utf-8?B?ZkRTSkJQdzBpQ01PVEZtSkZhajVNQWhad3o2dUFCRUliMjRlN0F0TkRYbllj?=
 =?utf-8?B?WXo3dldqVUVQMUU5ZlpvUjdsckVKbzRzZUMrT01sck9sVUlYQ2lZLzUvdGYy?=
 =?utf-8?B?UUJIVXZxQ3c1dGIyZGNWM2FtWmwybDhTUCs0TS9sc0hVbHc1N1BEdVdPRG42?=
 =?utf-8?B?WWZwY1dsUjZ4VDQrQ2p2N2xCaWEvV05UZlZteEFhMmYwNWhZUDc5a205bEpp?=
 =?utf-8?B?amd1TVBiL1phLzE3VmhqdUppUENkbHJ6RzJhWnhKU21GNnBIQktxS3hGS0JY?=
 =?utf-8?B?U2M1VGJwZEN5MlVNTTM2S1dCdkVTV0hZY05hVWJMYzVlVDBROS9VSEg2VzEx?=
 =?utf-8?B?SWU3V1E3VTZaY2dyTTBtYzlSS0ZZMFRIRGp3cXo0bDdVMkc3SjFPbmo2S0dk?=
 =?utf-8?B?b1VLUVlsWStYcVp5M2R2cWJhTTVhbEpoTVB0RnFOY0pXVWYzbzI1RlZPcitE?=
 =?utf-8?B?ZUVHUklHTFEreFJOaHZCK09LUVZSU2FsalNWTzh5WUdoTW9ZNThwQld1SGs3?=
 =?utf-8?B?anZTWW5Bekp3MTFFMEFaSm84eWJlcXlHSFNya3hnMU8reWZaVW5YN1EzdC9G?=
 =?utf-8?B?aGJ3RFg5UU9rT1ZCR2h2RFNCdnVscVN3SUhOQUlhU0dyNFB1Z09Sd0ZwaTMx?=
 =?utf-8?B?UUVxbWRMQ1dzVkZZc0JNMzI1STRTcXNOSko1eXp4MUYxQnh1MmpQVHQreDJq?=
 =?utf-8?B?STEyc3g4SnlObHVpWnE0alhaT2lhYkxLSWkzYk9xWHpvL3VwVkxxTEljbnpZ?=
 =?utf-8?B?WW5sMWNxcDI0djYrcUtuRU9BQ0F3TGtISjBkWGFRb29vOFJNbXQwZGRVSmpw?=
 =?utf-8?B?T3lmT2tiUy9WQ1NLQ2FZc3ZVVWYySE5GSFR6d2VQUmRESkViUXdaVUt2Szlu?=
 =?utf-8?B?ei8yZ2tQUTNPOVBXaXFYSnB5WmtwTFVoQUMwMHdTeThzMWhBSlFFc3ZzelNs?=
 =?utf-8?B?R3pJSHREZjlFc2crM3BxMkIrL1JXUVlWNUpUOCtxcXhtcWxMczZTMWxHY1B4?=
 =?utf-8?B?VXVmQ2VuRUo2VCtMVXZXeTh4d2RINDNnbFRZM0Z0SzhHVFJyc2ZMdEFEaXlY?=
 =?utf-8?B?UjJMMGtQN0Q5andISVUxZStFdWlKYS9nWFJZSkhjVllhMWhNL1hhSm5kM1h3?=
 =?utf-8?B?Zmh6VXZSU3JyVENPTi85R2VzeVFobFQzUk9FeUsrcmF0SkRzMVFxT0VQSVNp?=
 =?utf-8?B?UEE2amF2U0pzMk5wa2x2N0xIcnFiVzNqSzczTkpoVDRheUZWZDB4TDJ0V3Jh?=
 =?utf-8?B?Vys5eXUwL1NMckI2UzRoYkJScXJBV3pHVE9TMW9JUlAwL3FONmN6cUUwdWw0?=
 =?utf-8?B?ZEdFMVVYQkU2UmRtQ3FqclFBSDBVWm5PbHNUdzhGSWRwVTlkMzI5VVBwSGFJ?=
 =?utf-8?Q?Fz9Cc5cWKl29E5/Ek4JgTdage?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6ba117-6816-40a7-c74a-08da65821da9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 10:17:54.5416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7eidlcfmqJVk3KwplgHaqcjv3wV9sJGZEfi1pmUCH0wPJ4xWOg8OgpJvjJPxfOVZ6E4g/DoYkM82z5DixAsNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7133

On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
> Add API similar to rmrr= and ivmd= arguments, but in a common code. This
> will allow drivers to register reserved memory regardless of the IOMMU
> vendor.
> The direct reason for this API is xhci-dbc console driver (aka xue),
> that needs to use DMA. But future change may unify command line
> arguments for user-supplied reserved memory, and it may be useful for
> other drivers in the future too.

I take it that I'll understand the purpose of this when making it to
later patches.

> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -651,6 +651,46 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
>      return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
>  }
>  
> +#define MAX_EXTRA_RESERVED_RANGES 20
> +struct extra_reserved_range {
> +    xen_pfn_t start;

Why not unsigned long?

> +    xen_ulong_t nr;

Why not unsigned int or unsigned long?

> +    u32 sbdf;

uint32_t please.

All these type related remarks apply elsewhere as well; others
below also apply wherever else applicable.

> +};
> +static unsigned int __initdata nr_extra_reserved_ranges;
> +static struct extra_reserved_range __initdata extra_reserved_ranges[MAX_EXTRA_RESERVED_RANGES];

Overly long line.

> +int iommu_add_extra_reserved_device_memory(xen_pfn_t start, xen_ulong_t nr, u32 sbdf)
> +{
> +    unsigned int idx;
> +
> +    if ( nr_extra_reserved_ranges >= MAX_EXTRA_RESERVED_RANGES )
> +        return -ENOMEM;
> +
> +    idx = nr_extra_reserved_ranges++;
> +    extra_reserved_ranges[idx].start = start;
> +    extra_reserved_ranges[idx].nr = nr;
> +    extra_reserved_ranges[idx].sbdf = sbdf;
> +    return 0;
> +}

Blank line please before final return statement.

Jan

