Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7A447BEEB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 12:29:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250328.431191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzdK5-0000kG-Fs; Tue, 21 Dec 2021 11:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250328.431191; Tue, 21 Dec 2021 11:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzdK5-0000hf-Cq; Tue, 21 Dec 2021 11:28:49 +0000
Received: by outflank-mailman (input) for mailman id 250328;
 Tue, 21 Dec 2021 11:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzdK4-0000hZ-41
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 11:28:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28989931-6251-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 12:28:45 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-6keOC0OeMUCN6evPefqd6Q-1; Tue, 21 Dec 2021 12:28:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.18; Tue, 21 Dec
 2021 11:28:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 11:28:42 +0000
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
X-Inumbo-ID: 28989931-6251-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640086125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sT3TvE82UfBbXPgmY2Lq9j7gaWly0mkiUokPnRGLFPQ=;
	b=EPUmB5xjWJhZlqIvbBStu3HzlqYKFL5HFIqqnRe82eZA4CN/DmLH3OQZFOsOxkTbJs3ona
	N9cDov2gBsPYZZCqSnA43Vo19L2MxUAuu1uQA7WkwRYUIFclt+dQKSu+6pjxCia/EmrLOA
	26GAg8eg7ujhifk9EmKW2aST6bbM5VQ=
X-MC-Unique: 6keOC0OeMUCN6evPefqd6Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H85w3GVF4s2o9ttxIxfB1VH4cl5VWjaezCdMmHcdl1ARqLfTFWbC07FZoFFFvpcXty3NRbWtsn9ZX8qEwyCIGeKXa1xdJNauxQi0HDy+3dSy1Iogu3dnPNg3P2/zjfMpsBpHKxR5NRndIlZWgbBTfnxhgTjYTcuMHOGzRBsCMLJNIh1/nUuNK+j8Db0hS+7lK+IuJvUHCAxs1NVq5EuISsEQutJpS0Y7XVt4VfahYDA/OupHjucZWiFjV9E+5S8isJnGzIuAWGfHkUqnoAh2tl3ikoS4d7Vk0qXTN2gPdbFn3GOwTZxH1G8u3zFqp4XY/hObP3/+eL85QeDSyrSEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sT3TvE82UfBbXPgmY2Lq9j7gaWly0mkiUokPnRGLFPQ=;
 b=hki4VNYJ0u7+cVCzzWOIYuFRblVRTb+qnTgXHWJ3H3vrR49dOPJPAq43L8l5KCeuhnjZWn/8Y3IA9g5zi8+eUfn0hd8T5fRfrSui4rMBQxYb7UnEP1DQhUnJU5dcUwpNwDTLgFmYhHnBsVTm2JOGvumuHNjMlsu3MMdSIeitumegjY0Gq7VwChWsUZfyQkH38iahO7i/cvk9+fvPzb1syPITlgsUDrhKZnU+7GNnfm9zcWcBeP4pvXmIjJd1eaoru7A7u7tdYILtFPOmboxoUW+xzHIrBp6g3X2cPti/Kc8XUwHlqIj4KtuVT2+bkOCcF/1qMG1ZkD/OJs1ezRBH+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <427dc257-b318-de55-7126-0446264401f8@suse.com>
Date: Tue, 21 Dec 2021 12:28:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/6] x86/prot-key: Split PKRU infrastructure out of
 asm/processor.h
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
 <20211216095421.12871-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211216095421.12871-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0060.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16f4f3ff-7e9d-42fe-1adb-08d9c4750aaa
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23357EB5DDD690F86DEDF0FCB37C9@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LPMhrn3TGb3ghUVo8LGBkNElOiSSCb1IwjKgrsC7NCUYIxuAZYeKyzCS4ivYmK7DxfTWqLgqR16ydGSeJPxqUkbbpv5PI/7b8Iw4zIt+6xzNFVWIBv62IAEgHaVBRrvqrAKgYnOd4HSkFAIz8x5mLv9xwtqYg4GyJ2Bw0QJEhTs+jmjOKk9QgQTVNLQTXP0OcH9z8qGwH8i1m5pO0Z27ckyNkeSGWMoe4PdiKARNwK5XFLdZS+jdK2hj28Rbpkn6a5DAcv9lnV0S7ZcFtYZjQGUDXRW7D0Zb/FFDb++dxwTI+xLKQGadLcLdGKL2xWbZ4xQ/T7+IFddjVCOHwWOSERsJRjBEI4BuElOAzUaGkTvu+8CB0KJEj2rT24y6OobFBSjDPP35iildM2Q/FqMRSO3jkWu7vdK99xlUKXYRiUWURQ435u6X65t9YQ0lmjeUyeAgV6UIAIBMJg3is6lYo2EgzJIG/IzLrlE71+eqHBCLVHpdX4bq1DluPGrHAbmtulFVcyrrU5uBdJmH8mu/EZ2fkFlMw8xFwU9Zev5vUEKNFDqc1YZXc/cq7DNHNxUEqfvqEE7Tzzbq21ZQ3t1eNxwTTyseHRH7e4/2xdv01oWEzhV0azzS29YKjpU0QjI9mO8mROrqjp2Kh2ijLYFYCvhPklxJzBfAKs9RxO9UzqvIPhPPqyF1qPUAnCqzeiCT/B9lBdaTOcrg6wQayD+hJovFVTaFV5HvxNI4Y8Mw/idKqAeETnN4hXeBXVfM64Cr1TghFpcGky0Y1N4XbUf2ynVjpzbHcnrT2nauI5nAopSfONziWnfr7WupkOYsS1zPnFyzPIRuN4zdwnH/s9Kn1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(26005)(31696002)(6512007)(4326008)(66946007)(508600001)(2906002)(36756003)(66476007)(38100700002)(66556008)(8676002)(186003)(86362001)(54906003)(6506007)(316002)(5660300002)(6916009)(8936002)(31686004)(2616005)(83380400001)(53546011)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTdBbFBKOTk0VXd3U1dtbWhJbmRDdjVQRE04Nklib0NWOWNKNFJ5OTJoUWdC?=
 =?utf-8?B?RWVGVVdVQ0JnZWw4R3dWczlITVFLcnl1Mndhd1gyR3Jwcm43dld6U1hBNW1O?=
 =?utf-8?B?cHFhc0JSVjFDdlRGUzIyZ1U3dkUrUmx6M2VITWhzbzBFd0dVaFlSUjF4RGFj?=
 =?utf-8?B?QnFlVHNyNkJuS2lDZGw3Qlk3bXhzWEhDditMVFVqSEc5T1pzY0laM1pxWHQ3?=
 =?utf-8?B?a0xsTFRsbllNNHJjb3ozaWUzNWR2Q2hWOU1QVFBqU1RibVVic3dzQmRkSkZO?=
 =?utf-8?B?MFRuRC9aTUNhdXMzTUUrU3dnT2h0eEUwWnFBWkRxZEQyR3N1VllMRUp0TGRq?=
 =?utf-8?B?ekNwTnUvc29jdjRGYnJsbmM4TTBPTllmZURJUzFxOHZPR2drbkQ5eDk3eXBB?=
 =?utf-8?B?VklpSUdFTlJUWVNYdHR2ZWZhVU9oZ2RQaXNhM3p4cmRVVE8vcVZSTkUrK21l?=
 =?utf-8?B?cy9MclpmV1Y2WWgwZTJNb2NWVUlCODdtZTUwY1l6Y2dtei8vYmEwQy94Z1lu?=
 =?utf-8?B?S0s0ZFFrY1pSR0diNTNsOXJRTnJDZkpEai92YU9iYmlZSW1EV09TdGlDV2M3?=
 =?utf-8?B?VnZUemVwZUw0aWhOckQ0aUk1WGZyMWlZVnhRdElnTy9rQ3ZMQ25EOVRXL0pI?=
 =?utf-8?B?MTI2dHg5ZWJCUmF4WUJFTjBOQ1FiaENXWEFrY1EwejFwMkdqSnBHbkRNaFJ4?=
 =?utf-8?B?VHRlRGt6bXNVRVRyZGJjSXdSUCttaHU2akZGMVZuZDUwbjJkS0tEZEJmK0lv?=
 =?utf-8?B?VU9zbCtjODBGZVBZNnlFNC96dnVlbldlZWlGR21TRTIvUWRMbkJHcG5CT29m?=
 =?utf-8?B?SnU4U1ExZjRrY1pCeWRuclRicW1QNVIrNUt5b2VUeHFRU0dGclNycjRGajhH?=
 =?utf-8?B?S05zZlhNUjJrZVYyS1dFYWZyaDFidFE1OWFlNzhlMVBxbzdrR2tzTGcyMDZM?=
 =?utf-8?B?TTJGZEtFOWlPT2JvUUtBSXJ3anNYUmVld1oxV1N6bjlQQmh6NVRIZ0NwUTVI?=
 =?utf-8?B?aEdBUnl0dUJRWjc3VlBvY3d3YzJ4K3J3Yk5haTQ5WEhiS3NhdjNIWUZJbFds?=
 =?utf-8?B?RnMrd0ROVXhJckc2bWkvdW1sSzhoakVXVURNUWxzZHQyYzYyekxNRjF1TlhR?=
 =?utf-8?B?aVNGSEIxa3RFTlBvYThZcVVnZWtlUEhNSmxmQkFicW1SaHphTGVKN1VOcWQx?=
 =?utf-8?B?YUtyWXpYa1ZINEFXZGpmUFpDblhHc1gyZCt1TFY4Y29QRy9jZ3M1MG9xVXhy?=
 =?utf-8?B?Y3JVdm5IQUZYU3ZmKzhMay9yYVBndnhLZWFMRGwrZDVKMk5BQVBpOFBJQzZm?=
 =?utf-8?B?KzJoaGJjZDAzNHlTdm5DcDZSQlExMEJoSFgwYm0xRThaeko1cUlEeUxUUTJt?=
 =?utf-8?B?R2hoTTBNdTVJdW5GUExlakNkYnhkMXU4RlJ1YVVMaGlDOVgyTGl2aEhqeWhx?=
 =?utf-8?B?SG03eDM0SG1USVAvTWNoM0hBL1gzNzc4SGtaekNZdFFLWHR5bUxhWm1LREVW?=
 =?utf-8?B?YmRwRUJzWUFvY056TmIyc0NxK0NRUS9oOVdMRHNDYmJUMnBNWFhzN2VWYkF4?=
 =?utf-8?B?dVd6SEpHY2k3NDBOWGhBYnY2Nk9xeW1qVENNRkFPa2xFZzUybnFodnBtbXNo?=
 =?utf-8?B?LzBDZ0JtVXJ6YTJ5aWYwOVFQRUE0VXdVNVY1OGpkbW5ja2dOVkVzTGhqN2pW?=
 =?utf-8?B?VDl0WnFnZWk4c2VmWUFRQkNRemRwSG5WcGErMUI4UUdDV0hTM21UTDczU2lM?=
 =?utf-8?B?L2tsWDZJZmpyVkFNTldCeFp3ZkhFcEZwa3U2ZEM0MmErZWpGWU5UZ2RXZzMv?=
 =?utf-8?B?OWR6WTBzcVdheGM0WVQxSTFXaFFaTjdqSEFSbE5VY2dxTWJiOHdaUmNzSDNu?=
 =?utf-8?B?K1RMSU5ZS05SaUZ4cnkybXBQWWFOVHpDbTRwNDBLdlF4Q2N1dzRSYXBIMDYv?=
 =?utf-8?B?UFN1cE1CcTY2Zmd0cmwyc3d1allzMWFzd0pTc0hHWmZJMThndE1SbzJSeUtv?=
 =?utf-8?B?ZXh3c0xLdndFK1dENmt6ZE1GdkJCSHU5TWxkTlRSRVVVYWtpWnJtVTFBWU9V?=
 =?utf-8?B?b0Y5bWQvS1RtUU1QL21OZ3Q2ODZSYmk0eWUzRittM0Q3dFJYazVsZGdRZ0xX?=
 =?utf-8?B?N3VsQiszQmVENDBJWW5tYnJTekZoejJvNDJ4UC9jbkRFeDdNMjVIT1dwOGRz?=
 =?utf-8?Q?Ya0UvKm68vsNIFealnUCsPE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f4f3ff-7e9d-42fe-1adb-08d9c4750aaa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 11:28:42.0482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3Cx6aj8Fp/lb7bI07gxXVds/i59W+z74vjaXgetzPgiC/kJ63f/5imqmgplguqxvJoNEjFQSONpjkacJ5cbow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 16.12.2021 10:54, Andrew Cooper wrote:
> asm/processor.h is in desperate need of splitting up, and protection key
> functionality in only used in the emulator and pagewalk.  Introduce a new
> asm/prot-key.h and move the relevant content over.
> 
> Rename the PKRU_* constants to drop the user part and to use the architectural
> terminology.
> 
> Drop the read_pkru_{ad,wd}() helpers entirely.  The pkru infix is about to
> become wrong, and the sole user is shorter and easier to follow without the
> helpers.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

This looks functionally correct, so in principle
Reviewed-by: Jan Beulich <jbeulich@suse.com>
But I have two remarks:

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/prot-key.h
> @@ -0,0 +1,45 @@
> +/******************************************************************************
> + * arch/x86/include/asm/spec_ctrl.h
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
> + *
> + * Copyright (c) 2021 Citrix Systems Ltd.
> + */
> +#ifndef ASM_PROT_KEY_H
> +#define ASM_PROT_KEY_H
> +
> +#include <xen/types.h>
> +
> +#define PKEY_AD 1 /* Access Disable */
> +#define PKEY_WD 2 /* Write Disable */
> +
> +#define PKEY_WIDTH 2 /* Two bits per protection key */
> +
> +static inline uint32_t rdpkru(void)
> +{
> +    uint32_t pkru;

I agree this wants to be uint32_t (i.e. unlike the original function),
but I don't see why the function's return type needs to be, the more
that the sole caller also uses unsigned int for the variable to store
the result in.

> +    asm volatile ( ".byte 0x0f,0x01,0xee"
> +                   : "=a" (pkru) : "c" (0) : "dx" );
> +
> +    return pkru;
> +}
> +
> +static inline void wrpkru(uint32_t pkru)

(To avoid an intermediate local variable, I can agree with using
uint32_t for the parameter type directly here.)

> --- a/xen/arch/x86/mm/guest_walk.c
> +++ b/xen/arch/x86/mm/guest_walk.c
> @@ -26,7 +26,9 @@
>  #include <xen/paging.h>
>  #include <xen/domain_page.h>
>  #include <xen/sched.h>
> +
>  #include <asm/page.h>
> +#include <asm/prot-key.h>
>  #include <asm/guest_pt.h>
>  #include <asm/hvm/emulate.h>
>  
> @@ -413,10 +415,11 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>           guest_pku_enabled(v) )
>      {
>          unsigned int pkey = guest_l1e_get_pkey(gw->l1e);
> -        unsigned int pkru = rdpkru();
> +        unsigned int pkr = rdpkru();
> +        unsigned int pk_ar = pkr >> (pkey * PKEY_WIDTH);

This is correct only because below you only inspect the low two bits.
Since I don't think masking off the upper bits is really useful here,
I'd like to suggest to not call the variable "pk_ar". Perhaps
something as generic as "temp"?

Jan


