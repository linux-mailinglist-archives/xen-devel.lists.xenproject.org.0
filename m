Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA496F4323
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 13:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528547.821857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptoaV-00049y-AO; Tue, 02 May 2023 11:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528547.821857; Tue, 02 May 2023 11:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptoaV-00047g-7d; Tue, 02 May 2023 11:54:31 +0000
Received: by outflank-mailman (input) for mailman id 528547;
 Tue, 02 May 2023 11:54:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptoaT-00047a-Qw
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 11:54:29 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2064.outbound.protection.outlook.com [40.107.247.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16d09ade-e8e0-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 13:54:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9066.eurprd04.prod.outlook.com (2603:10a6:10:2f1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 11:53:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 11:53:58 +0000
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
X-Inumbo-ID: 16d09ade-e8e0-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiGR+Kn7niNo8TaNJwOseoCdTInLhvHtyqhSW/Kho6TYp8rB3GDWB5unsDBXlW+4/+KMaSDR1vVodJ3ugcUmy00uKkeik5dRoq6uy7n4oZd7iKXGifGiYBE2GjYj3le2WSXR0yp5g+U28YzLCB3fTzqpafRX2yJoSwutohIk5zqEc0z9s4bPIj/rBMmkJvUXaKHBX3FABQ8VyoQ8RNr7wF0cc1ti5Y9ZS440R29J/mkO+NIlEzQSZgSS6ql3mGLnO4723vlyhcdNTxCwA555ajhrNq1XopH7VctesS69b0KdWSAOuKhAWc5nunRJsQBA8YJFFzjB/3jV6kq3Z9OykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bT7wUUqaHwxjkzXfncf8KWA9QpevS2EclWSY0d65XTo=;
 b=fZ6Ugvc1+pJLSyNnE8qvQ+FeSiCqq3OsRWHhB+yq7XvFeViSTS72/qyOlHWh/tq1Bi+Kfshb6qbhDH+oALBxYWwXFaS+i5wrqwfOY7BW7JTRPwoHZQX2ggeUxcXXNBa1Jdnqz5aLNcR1kZLt+j6MJGFLheAsNY4LqCBsQ5gJz7ZohEL/IVz6agabE//fF9uJsv6Za3d/uUk+uXLCoZbLlJvXyeGgDy1EV8iyIsJ9tFbJAgTzmH2uqN1VZiotaQjOFDTSwBaUa4KOcYSw+XmAKiH3w90Kb8Ie1hR29Onat5wJycoGPWq4FBbddMvrh5QEkBLBnuV1ygDGSH/AYq5iIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bT7wUUqaHwxjkzXfncf8KWA9QpevS2EclWSY0d65XTo=;
 b=CJWz4+mLeT+IbrvTeMLxHO2t3lPArD5xSilsc8NKdcQ7uHtlgZapFvdq+KvahxISJueU8RVnmbQsRyKwiRnu87k+hir+ReOtyQciAdjuIt91hYYOfbWEIzlnO6pf8+uT8kR05F0zti8SUZ+ht4pK0KEs544gnk5l6+ghZd8tTxyizUKuyawuyY2kAiks53pQqd8pmEOSyUoR3GYeIYTZW8/f6zkiFs9OdMIDipfSpqAww0Vs33bcYW4q32Q8ADVrMZveNkwhJGVbMPbCfd9EAnZK6D0HFMUn+cPx8BvW+purV22qYK3cQNoJg1geZ6S+xL7Sa6IJxmZv6iEffL2Kaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5516fbf5-dbfc-dcd5-0465-e4757fdc16de@suse.com>
Date: Tue, 2 May 2023 13:54:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 1/2] acpi: Make TPM version configurable.
Content-Language: en-US
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230425174733.795961-1-jennifer.herbert@citrix.com>
 <20230425174733.795961-2-jennifer.herbert@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230425174733.795961-2-jennifer.herbert@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: 1179ff0f-d307-4ea2-0caa-08db4b03e9d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WQt7RqRLwTMZs79gAnBEk52FNMKuHMin8+MxlxbKFoEdgOL+8axAiAtpjo5l2Z045mCXkk5PdAMktQhOJMCyxMeoVD9aTIKyp1fAl0mfVk4bo0X4KVcFD1mWCz5F+DRRmIn07yWSaW+RI59nHOgozH+VTt7Vqhykx5DlTf+qr7x9n8x3Z2FAJSpaYINXEMOpsvfGcy4wA/8wWo8f72ngIPk6UBf3tBEWQ/6wMf380IMIehqUJ/I4OSgIZkXPNxLG06oHBF8QLActoFgS1taVYYRzP1+7/Xv12rDvM/R5B5oGzxXmVEJAzHVO6Nln/TSY5ad4H0A0dm6/pKwyI+6uiYUGqnxE2AvGPpNQkb+vnauK9cP9UWRswZhzCJzxlvxRqB56qGoreq0GCGDScq9IFMqvNU2E5j1VHxKFg05IpL3tDGki7GIZ9NvIC+jFyeiwNsOaVj5trIQemc6htYwOJArJvvXcg9gzLYyR/LoC7lXryYdhnAJHwWVNuc5yjXaZcaYg96Zvq7dQXDVTd35SiKci1EvJspn0xHV/UMFx51S5x5/QCRmLgUXKG/6Yz8/aMxj0eURuyPNMNxR3+p/Egcm6VAtj1HL5gUoXUdAU6xZTcgRRyQmC6kfEvlNnxCXt4UYOI+YFIZB3Bs8a5UVsZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(346002)(39850400004)(366004)(451199021)(478600001)(316002)(6916009)(66476007)(66946007)(66556008)(4326008)(38100700002)(8936002)(8676002)(41300700001)(36756003)(5660300002)(86362001)(31696002)(2906002)(6486002)(6512007)(6506007)(53546011)(26005)(6666004)(186003)(2616005)(31686004)(83380400001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azk5b1pKQS9ZSHo4LytjbzhvMnpMeXBUNllqMTFybnZ0N3d2WlN6eTdlOTAx?=
 =?utf-8?B?aTFDMTBkSlliKzNqYmFaZW9YWWVXV2xxMGV5aENia0tnWVRzVmFqMmFCMUxu?=
 =?utf-8?B?MnlEUTNpeXQ5RGZsL3pnMXJuYWJ1OHErN0V1Y1ZzdENHeFRCZVBkRWFRRlJJ?=
 =?utf-8?B?MEtMU1VVaE55OU9iMGpCbkNseldxbkw2VzFKbndaVmxIVVkrVVlsdE9ORHZV?=
 =?utf-8?B?ZVhzZnBqU0RTNC9UMlpPS1VBV1VPMmpKNW5MZkRsRGxZV2RrdGFXd0tDUW9q?=
 =?utf-8?B?Q0VHbXkxSTNSOVFyMVZQNk11Qyt0dElwcjA2Y0V0QWRqcVlqMlMvaDZ2RUM5?=
 =?utf-8?B?WllNNmFFUzZZcHUzYUZkT2RoSitIVWlTa0Q3eDV0bXphS0hZa1VhOFh4NjQ2?=
 =?utf-8?B?Q094elZzbFRXN04vNmVvS1pkVkdPYmw3TDkvUzRtV0VaTXplTUR2elAvOCtG?=
 =?utf-8?B?MTMxU2FKMHpHZnhiT3dCaEhlaDF0RkJISzV1dzlwODFQMzcycms2a0swWnIw?=
 =?utf-8?B?NzY3b0RORzZhM0o2cXVNZEtlRWtqcTNuMmJYTmFvaHJ6d3JyRGl2WVcrRStI?=
 =?utf-8?B?WnI5aDhqWG5wWE1DY3N6QWRTNC9kWnNHcUwya1UvRHJ4OUFXRnl0eitIcmhB?=
 =?utf-8?B?QWp6SSsyOWdqbnZoUENsTklGSDc4eWR4QUhRR0ZHV0dGUzIyL1V2QVlBMjdC?=
 =?utf-8?B?aHQyYzcxU2tFVXFDU00rUDNzZFV3STI4L0hoOHdxd09jRDV1QXRzajcwckx1?=
 =?utf-8?B?YjVjYVJUekc0ZW5zdWZ0RjdxQVRyTlpGdVNieGVITU5ZN1JVSVErSmlGdHFL?=
 =?utf-8?B?dFNIQis0OGFIdzhMUWpXd1hQUStMVWhKV3UyZkdUMHVXZXk4NjJjMW9aWVR4?=
 =?utf-8?B?M3ZPOGdHZW52RkQ0NlhJVjVUNDVkaG93cWJoYythUVdoVmdKbXRaQXVaQ3Fp?=
 =?utf-8?B?UUlkV3VEWk5WY2xKM1pvTHpaNlZseWI0NldIZkxhSUZESXJhM1JaRHJlSlc0?=
 =?utf-8?B?QmdlNXllOWpEUFo3QUVJWGxTZnVNSThFSXZVSzZxeVNCalhtYkR3QjFSNlJm?=
 =?utf-8?B?MXNhaE1aUWw2WWltVFRuS05lR0E0RUNlSTlET0cyWjdZbitEN0NSZHJ5cE1H?=
 =?utf-8?B?UmV3QnBqOUZWUWs4N3Nsd2lqNmZ2THZ5dzVrcUN4TFBaQ1E5cDdxK3ZKeDRo?=
 =?utf-8?B?c1MrZEtvMWlsQmhQL1VSOFNkVDFqYmVZZ0xTanZPMjFGRU4xcEVZQk5DRU5X?=
 =?utf-8?B?ZERtZk5hN2dWUGs0dnp3ZzdCVFRKUzNpT1NNRVBRb25BRWd6TzUrYkxtYVMv?=
 =?utf-8?B?VTNWWEViZ0s0cVRIV1lHVWMyNGJmc2hRK0NIclJRR29pcHpTTWpyUTU3a1F0?=
 =?utf-8?B?eUtYbi9PdG5JSDEzMEw3WEZpNlZ0a0VLVk1tRjA1ZzZmUitkZitVbFFVbHRn?=
 =?utf-8?B?b0xBcGVXSDZsN3Fqd202YkRSZUNVVlhyb1ZxVUFMTnlBMnByMGRsTHZQQ1ov?=
 =?utf-8?B?RDJlU2dOdGE3MWZSNE04c3Y3YjVLdkR1RUJ6ZmRkcnJSeERVYVJRRmd3cUt4?=
 =?utf-8?B?N3Y0Q3hXcER5dUhmeGJxUUV0b1hwc1FJeFprWDRLM3dha0dBdGtEeFVhU1dY?=
 =?utf-8?B?YVIwaVVRSzJxeHRkYlBVYXRZUmxVc1h2d3ZFVWVua2RiY3NhNzdvVzBCcElk?=
 =?utf-8?B?YUJRRDA1WitVeGc1VXpQNjRCOTZmOXhvQmt4alo1NmVuQXdvRXoxZy9SQ0do?=
 =?utf-8?B?b1dOU0NTK3pqd1Q5aHltbTVzS21IRm83NlV5OGdteFp5bE1XQ1dyOU9KVERa?=
 =?utf-8?B?bVVOWUNzVUJuYWtPUUpvd2FnQld0dTcwNTljZWYxQzVTazR4bHkzcGdCT2sv?=
 =?utf-8?B?Mmo3bjVxRUY1SENwZmMvbDV6YjNWVnJCUGVwRXZzREpUamNuOGI0anZSeWdJ?=
 =?utf-8?B?Q1l6RkNFM2RSSXFVVGVJRUZWcmhGQWNMVm82Slo0QURWNmhNSDBkM09zaDVJ?=
 =?utf-8?B?SDZPOEV6VHNMLzB5QzNVVGNFUlkyTjQ0aG5GY3ltd24rUVlpanhuSXN3R0h1?=
 =?utf-8?B?ZUV1VWVGelQyWnQ2K28xVU9oWXpzZ0xuYUFsejZVbUxpY3p5Zy9rcE9VQmRm?=
 =?utf-8?Q?XnetBPfPzIjQvbsYlt4WWD3Xd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1179ff0f-d307-4ea2-0caa-08db4b03e9d8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 11:53:58.4639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Sdj6afygbv1f3YZMtMfKvSDPVa/a5YB7pY5bcmhNJOYKdorGtyutwrvxYCI5VfZp8Oy2MJlrqWiSGZIT8q/Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9066

On 25.04.2023 19:47, Jennifer Herbert wrote:
> This patch makes the TPM version, for which the ACPI libary probes, configurable.
> If acpi_config.tpm_verison is set to 1, it indicates that 1.2 (TCPA) should be probed.
> I have also added to hvmloader an option to allow setting this new config, which can
> be triggered by setting the platform/tpm_version xenstore key.
> 
> Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
> ---
>  docs/misc/xenstore-paths.pandoc |  9 +++++
>  tools/firmware/hvmloader/util.c | 19 ++++++---
>  tools/libacpi/build.c           | 69 +++++++++++++++++++--------------
>  tools/libacpi/libacpi.h         |  3 +-
>  4 files changed, 64 insertions(+), 36 deletions(-)

Please can you get used to providing a brief rev log somewhere here?

> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -994,13 +994,22 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>      if ( !strncmp(xenstore_read("platform/acpi_laptop_slate", "0"), "1", 1)  )
>          config->table_flags |= ACPI_HAS_SSDT_LAPTOP_SLATE;
>  
> -    config->table_flags |= (ACPI_HAS_TCPA | ACPI_HAS_IOAPIC |
> -                            ACPI_HAS_WAET | ACPI_HAS_PMTIMER |
> -                            ACPI_HAS_BUTTONS | ACPI_HAS_VGA |
> -                            ACPI_HAS_8042 | ACPI_HAS_CMOS_RTC);
> +    config->table_flags |= (ACPI_HAS_IOAPIC | ACPI_HAS_WAET |
> +                            ACPI_HAS_PMTIMER | ACPI_HAS_BUTTONS |
> +                            ACPI_HAS_VGA | ACPI_HAS_8042 |
> +                            ACPI_HAS_CMOS_RTC);
>      config->acpi_revision = 4;
>  
> -    config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
> +    s = xenstore_read("platform/tpm_version", "1");
> +    config->tpm_version = strtoll(s, NULL, 0);

Due to field width, someone specifying 257 will also get a 1.2 TPM,
if I'm not mistaken.

> +    switch( config->tpm_version )

Nit: Style (missing blank).

> --- a/tools/libacpi/build.c
> +++ b/tools/libacpi/build.c
> @@ -409,38 +409,47 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>          memcpy(ssdt, ssdt_laptop_slate, sizeof(ssdt_laptop_slate));
>          table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
>      }
> -
> -    /* TPM TCPA and SSDT. */
> -    if ( (config->table_flags & ACPI_HAS_TCPA) &&
> -         (config->tis_hdr[0] != 0 && config->tis_hdr[0] != 0xffff) &&
> -         (config->tis_hdr[1] != 0 && config->tis_hdr[1] != 0xffff) )
> +    /* TPM and its SSDT. */
> +    if ( config->table_flags & ACPI_HAS_TPM )
>      {
> -        ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm), 16);
> -        if (!ssdt) return -1;
> -        memcpy(ssdt, ssdt_tpm, sizeof(ssdt_tpm));
> -        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
> -
> -        tcpa = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_tcpa), 16);
> -        if (!tcpa) return -1;
> -        memset(tcpa, 0, sizeof(*tcpa));
> -        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, tcpa);
> -
> -        tcpa->header.signature = ACPI_2_0_TCPA_SIGNATURE;
> -        tcpa->header.length    = sizeof(*tcpa);
> -        tcpa->header.revision  = ACPI_2_0_TCPA_REVISION;
> -        fixed_strcpy(tcpa->header.oem_id, ACPI_OEM_ID);
> -        fixed_strcpy(tcpa->header.oem_table_id, ACPI_OEM_TABLE_ID);
> -        tcpa->header.oem_revision = ACPI_OEM_REVISION;
> -        tcpa->header.creator_id   = ACPI_CREATOR_ID;
> -        tcpa->header.creator_revision = ACPI_CREATOR_REVISION;
> -        if ( (lasa = ctxt->mem_ops.alloc(ctxt, ACPI_2_0_TCPA_LAML_SIZE, 16)) != NULL )
> +        switch ( config->tpm_version )
>          {
> -            tcpa->lasa = ctxt->mem_ops.v2p(ctxt, lasa);
> -            tcpa->laml = ACPI_2_0_TCPA_LAML_SIZE;
> -            memset(lasa, 0, tcpa->laml);
> -            set_checksum(tcpa,
> -                         offsetof(struct acpi_header, checksum),
> -                         tcpa->header.length);
> +        case 0: /* Assume legacy code wanted tpm 1.2 */

Along the lines of what Jason said: Unless this is known to be needed for
anything, I'd prefer if it was omitted.

Jan

