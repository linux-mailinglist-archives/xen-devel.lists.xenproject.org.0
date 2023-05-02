Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704CA6F454D
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528651.822087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptqFr-0002zx-Sf; Tue, 02 May 2023 13:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528651.822087; Tue, 02 May 2023 13:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptqFr-0002xi-Pu; Tue, 02 May 2023 13:41:19 +0000
Received: by outflank-mailman (input) for mailman id 528651;
 Tue, 02 May 2023 13:41:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptqFp-0002xc-TK
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:41:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7d00::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0267da2a-e8ef-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 15:41:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8169.eurprd04.prod.outlook.com (2603:10a6:10:25d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 13:41:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 13:41:13 +0000
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
X-Inumbo-ID: 0267da2a-e8ef-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSycrKs8lQBKsfgyb991ekFsr2SrL15ZgbVkZ3jHHTdDClpyiKPhuyjagJB1kRquYw1WldgMrojryzDz8yrhJsZE1SyaKiqVHaaZ1OVU2WJkrNwE2H3XKEUFbIiA5zMOIenTKhlearc/b0CJTPq4XAHCHh1NHEQETom91+0WgQKM/yY1UlGKG/Jo7sROucHsEu+I4gaDQir0VocYthp02QB3iD7zw12UsvjYEa9tkraVYs5ikqe0Z81qdPKDWqBVyYsx61gsHqe58SQ7t0smHtFL5KtbwAN9UcDv5ZM6Q6VL9HXo6dBhAYZnzLBNMxaD0oMOsIyiWqu92JO0D1PWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1EDzMdMtmgMtrxFZhOwm06NyGinNaKMmyaW0YO/3FU=;
 b=J5viAt7NWkC8Syr5cuYg36snwqYtH+X2zwFtjEyY06ay6TQjLkbXhL+4ybMvw5GQ2xKM8WHAeM00cmgLX+O4j7GszJgAtBFlWERWDKeQUeHyILgDthFrgPW8/YXP5DdLnddI4UOFBI1lfO+o+F7phh3yCei8oFlOU0xig1zM0VGFgajjsNvCln309494znxEoraT1gMdKbuaELNpoEWvyju6KKwrHJgPh61jm2mq5/A9x1gr+U6s6ich1o9D5uMx4CM46gpN+dubw7/mPiyRH799IQGLIskYBeqeJWDaSU/C15rRaLjTjY6peAlM0uxTZeIRC0jU1FUbOoZZ/oga/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1EDzMdMtmgMtrxFZhOwm06NyGinNaKMmyaW0YO/3FU=;
 b=vDJfhpFAli1ubyMpk19O+7KuHYSRlTzSD7RVENtuMS0J3SLSj+bsUoBAdXKQI+VVeCZOzi2tgPXOZLAhz0e0aeg4Rab4GPB94v0XpMuHLihniCKmz7KJ+ABftbTqZy/foykUvn9t85FJjGllJNoA+9hfot/cnibYRbpyKUwmi2zwbErjzxz7hGRYQwfeMSdMAMRvWm65JwAs47drrTMYtt0ml3Nu7vFXlqBXN9NXMTl7KSb6DCP3x6FJbMx8M14XR1tI8dQ9EFWQ0WcNee0o5Ual9+xcboyptGeewLnEhoMYItwTWDIXL4PJ/3PsbuY7X0yuI7ig0DLuYlC65OM/rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f9e72c6c-9915-9995-06c0-0a0ac037bde1@suse.com>
Date: Tue, 2 May 2023 15:41:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 2/2] acpi: Add TPM2 interface definition.
Content-Language: en-US
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230425174733.795961-1-jennifer.herbert@citrix.com>
 <20230425174733.795961-3-jennifer.herbert@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230425174733.795961-3-jennifer.herbert@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 6102cd90-c77f-484b-0d21-08db4b12e594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nTwGzFc8XMcwwZecidSVWDlZEpEAa+fdr9SFYoUDciq2gDciM4IPAWFE1YM+BDmVrYYPB4pkRxNOlu/zLTMrpl+4POq88LxJuYswvKDptKsd8hWGQ9llnGSjdxhrxZtVxwdEPC2zAdvkvuy419ol3dzBjaOesSriJqE+pKtA/kIOBQIvohfUzJzfhQ08SDR5kZ1T+9LPH7a8Aom3OMMJJ1ctdfD2O9PaOx5asv1Ega0hVOIt9Zvb/KH7vDydMSzVDZe/4QdBETVJNhgddlSMiUAJWcL4frMrArvZkTr/ol6PqtzMhgPcC9qXo6tJzNwszP97zxfu1vQRkNuIanDAxerM2ZdFXyjjmsptN/NU+p7EDQJdmmj+QD69SRs1XspTCXj7arLVq/I0nIsixl/BFGfOKBIh32YN7hJGiy3c+66BzvyJxeqc8v5HVZlQB84joGAOdsq+fHCsV6EEQT+szDVA2XrN9o2NDWpgOLfNKk18rUuml/QHDjLdZ7mSBvSq5Ptyk/hQAW31TL3CM8aAWpY7azynd0Dn6bf6UbiRp56coLFA7ac1DAo2iEUrsrcWbKyetX91FaaIFMveJ9kAgnpDfZaXLyjSetuFN2HvQgs9LX6aIzgIEHDcFDoapjkymBCXsJxX/N/Wimv4kwv/8NqCav3OPO6DIhOo0GqLPZ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199021)(31686004)(54906003)(316002)(4326008)(6916009)(5660300002)(31696002)(478600001)(36756003)(6486002)(86362001)(41300700001)(66476007)(66556008)(66946007)(26005)(186003)(2616005)(6506007)(38100700002)(2906002)(8676002)(8936002)(6512007)(53546011)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnlibGwrdUFuRVZtMnNsd0plNDUxelRrVmJDV0taK3N5TDZ6NGd5eE5oTllL?=
 =?utf-8?B?NUVtaVlIZGU5YkFFTXZuTDNqOFg0YnA2T0NiS2ZMTldNV096ZWNCR3dQVjM4?=
 =?utf-8?B?dGdnM1VDL25jdXMxVWt5cjlKaExZNWM0MmRHV0t5U3pOMWk0YmY3bDBUSTRi?=
 =?utf-8?B?MUwrK3M5UkNGWEU3aW5WQ0N5VzY4YkUxNEJhQW42azMrV3dJSVIzd3dCV2do?=
 =?utf-8?B?WXJNK21VZ0QrRWZ4Z0FQK1l2TFIxNTFJcVNtQU5zUG45RnF4L1NFd01IV0Z5?=
 =?utf-8?B?OVJkRFNTVHdGaHlMdVAxZ3pLUEx3dDMzN1gxQTdkRU5uNXhDb0dRM2ZZbklC?=
 =?utf-8?B?WkVGVWkvTzlTcm5BSC9ReEJ1NktLT2ZJUURwTkVJM2U2MjJhT2cvM0FCY0V5?=
 =?utf-8?B?aHpub3ZrTWhvOGtuWUtIWmppNHRNV2kxNnFtTVRvSDBON1NZRG5TR01WeXRz?=
 =?utf-8?B?cE9ocFNKa1ZxbkFxYjZyU3NJSVdMelFHMVhJaG1BQkluTS90bHVRdE4rRmxt?=
 =?utf-8?B?dkxXUEVpallzZVhscFhPMVM1VWswc09mV3kxd0NlNUJMRXBOTEhsTng4aFgv?=
 =?utf-8?B?NUk4L0tVQjRqT2l2VituUE1FMU1TcDFtWkR3MGM2Qm8rOFZMS043bnlhU1I5?=
 =?utf-8?B?WEpud1ZBWnBrTkJEYWl2VmxhdGtwby9lYkYrcVE0R0R1TnhuV1BXaGt1bVE4?=
 =?utf-8?B?ZmtLcmlTVlRoc0NDaFdYRnJLcXJ2RDI2aDJvYURHL2NmN0VxRnhCRXY5a29D?=
 =?utf-8?B?TGE3VUh1UW5rdzR5anZVOXU0WmtKeC9tNGdrQU1HWVcxR3QxQXdmWC94cDd4?=
 =?utf-8?B?aWpZdkdiKy9yWFkwalRVemdiNXFicHdkMUFFWDRIb3dubmt0ejc4dG1ZVUtZ?=
 =?utf-8?B?eTlPNy9FVjRDemR1Q2lWU2VVaDFpZllsOHQ2ZExSMy90eVhTSnhiTS9ZRjBu?=
 =?utf-8?B?Tkx6QStSZ3BxWW90Q3FZbVFTN1lGSGJTblg1dWJPSnlNWTFOZ2NuYlhvY2Q1?=
 =?utf-8?B?UmkwbnU2NVg3cjdGV1U0VTk2dFhmSVFTWXhKU0hDSEM4NmZKNkI4NDJhM2V4?=
 =?utf-8?B?SitxMXdETXRiNm13STVNRkZSSmpTN3huTTJIVnd4dmFtNFY3UWZGdm1iOXFH?=
 =?utf-8?B?SVpSMzBnaElyakdUZFFsT0FYMWJ4YzhNenBZSnQwQzYrR2hndVMyUVUyM2tM?=
 =?utf-8?B?Qi9jVEg3QktjaHlXZ3B5NVBScjg3VG5QSzVCWFRQSEVSU0szNUorMmJtYUxz?=
 =?utf-8?B?RENhUU5LTnB3cDR5QTU0M09EUkhZWHFPRmNKOWZ2MHlTbmkrai8yVC9XTlhB?=
 =?utf-8?B?N1pPbEIxWlhtdHA5Z2xPNXNCRDFQWThuTXVVWXpVMml0OFUxdlFlOHN5Sk1v?=
 =?utf-8?B?OXFEQndxbSs4Wmp4T3g2NHpyTU9DL0lIREttTE5RZDRTMkVZbWducWt2c3g4?=
 =?utf-8?B?bUM0WVk2Umo0TjluWjZpazB3WC9iUENNNEFPZWptR01CNllHVTExbnUzdGVG?=
 =?utf-8?B?bnJ0WS9BRW5JSGc4V2VpRmxsdzk2VHdEdUloemhFWkNiZnFYUzA0U0UzWjBB?=
 =?utf-8?B?U3d1R091SUJJODdHOWxZL0NaNWNwUWRJaGdSa2VZNWVPeldhdkhoLzc1MFNS?=
 =?utf-8?B?ZXorWTNMT2Q0SVdpWHp3R3V0VTduSlA0L2hTRWl6R1JQVy9NcElTMy84WGlJ?=
 =?utf-8?B?Mis5a09TMzFyVzZQSXVhY1c4YTNDTHdTTzhHVzNLWUVES1UyLzZyVDFCanBX?=
 =?utf-8?B?UGtPRm0zTGVaK0picVl0clk3TDB5aFcvRi9Xbk5mV25JbVBYNmpWaEdIdlZY?=
 =?utf-8?B?ZHovek4zSUtiRkV5dXk4c2hHMFZycDZJcHh4MG9xdSt5bC9UT2RVS3REbzYz?=
 =?utf-8?B?K1JZbHRiWGo5VzNmekFmcWJIMDJQSWRuUUorNmZRQmIxMFN6UEx3UThTazNa?=
 =?utf-8?B?Sm5SNUl0RDl3L29PeXhhL0Z5RzVaQkRoMFdzMGdGTkx5WldmUXNudDV6TkhG?=
 =?utf-8?B?TTNWd3ZIcVo1ZG9xSFJCVnVuZXp3emdJMWlrSTB2cmQyODJGUzljTVpWcXlP?=
 =?utf-8?B?L041MXJCRktXYndoQnBvYWNDK0o2R2YrZXBzbTQ0aGFjb2VZNGdMNEQwcnhm?=
 =?utf-8?Q?VC8bocAvUh/8UBZZUoE11hMcj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6102cd90-c77f-484b-0d21-08db4b12e594
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 13:41:13.7821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tVatW8L8TKqLqPcSEIGrPBH3mXSJqj0FCvRx4IBYzYfM1/qW3ggdVOwvR/e9Gw6CETAFjL+seg27PdnxIk6hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8169

On 25.04.2023 19:47, Jennifer Herbert wrote:
> --- a/tools/libacpi/acpi2_0.h
> +++ b/tools/libacpi/acpi2_0.h
> @@ -121,6 +121,36 @@ struct acpi_20_tcpa {
>  };
>  #define ACPI_2_0_TCPA_LAML_SIZE (64*1024)
>  
> +/*
> + * TPM2
> + */

Nit: While I'm willing to accept the comment style violation here as
(apparently) intentional, ...

> +struct acpi_20_tpm2 {
> +    struct acpi_header header;
> +    uint16_t platform_class;
> +    uint16_t reserved;
> +    uint64_t control_area_address;
> +    uint32_t start_method;
> +    uint8_t start_method_params[12];
> +    uint32_t log_area_minimum_length;
> +    uint64_t log_area_start_address;
> +};
> +#define TPM2_ACPI_CLASS_CLIENT      0
> +#define TPM2_START_METHOD_CRB       7
> +
> +/* TPM register I/O Mapped region, location of which defined in the
> + * TCG PC Client Platform TPM Profile Specification for TPM 2.0.
> + * See table 9 - Only Locality 0 is used here. This is emulated by QEMU.
> + * Definition of Register space is found in table 12.
> + */

... this comment wants adjusting to hypervisor style (/* on its own line),
as that looks to be the aimed-at style in this file.

> @@ -352,6 +353,7 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>      struct acpi_20_tcpa *tcpa;
>      unsigned char *ssdt;
>      void *lasa;
> +    struct acpi_20_tpm2 *tpm2;

Could I talk you into moving this up by two lines, such that it'll be
adjacent to "tcpa"?

> @@ -450,6 +452,43 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>                               tcpa->header.length);
>              }
>              break;
> +
> +        case 2:
> +            /* Check VID stored in bits 37:32 (3rd 16 bit word) of CRB
> +             * identifier register.  See table 16 of TCG PC client platform
> +             * TPM profile specification for TPM 2.0.
> +             */

Nit: This comment again wants a style adjustment.

> --- /dev/null
> +++ b/tools/libacpi/ssdt_tpm2.asl
> @@ -0,0 +1,36 @@
> +/*
> + * ssdt_tpm2.asl
> + *
> + * Copyright (c) 2018-2022, Citrix Systems, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU Lesser General Public License as published
> + * by the Free Software Foundation; version 2.1 only. with the special
> + * exception on linking described in file LICENSE.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU Lesser General Public License for more details.
> + */

While the full conversion to SPDX was done in the hypervisor only so far,
I think new tool stack source files would better use the much shorter
SPDX equivalent, too.

Then on top of Jason's R-b,
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

