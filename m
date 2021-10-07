Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6BE425481
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 15:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203596.358739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYTgd-0007n3-Ne; Thu, 07 Oct 2021 13:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203596.358739; Thu, 07 Oct 2021 13:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYTgd-0007k5-KV; Thu, 07 Oct 2021 13:43:51 +0000
Received: by outflank-mailman (input) for mailman id 203596;
 Thu, 07 Oct 2021 13:43:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYTgc-0007jz-1V
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 13:43:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98db9870-2774-11ec-bfd1-12813bfff9fa;
 Thu, 07 Oct 2021 13:43:48 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-uSlgDG5EPXSl5NtP96TxTw-1; Thu, 07 Oct 2021 15:43:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3935.eurprd04.prod.outlook.com (2603:10a6:803:1f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 13:43:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 13:43:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0101CA0001.eurprd01.prod.exchangelabs.com (2603:10a6:206:16::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 7 Oct 2021 13:43:43 +0000
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
X-Inumbo-ID: 98db9870-2774-11ec-bfd1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633614227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5s0h5hS1J85jx+FyEr8gZjKVjTaTfQ2r300p16zpDM=;
	b=EGwNkyrfyHiWE5fLxFYmumfq7wKZfxS3Gi9NyRDwUIej0zexpoWEWxpmeWeKUnQGR1FGY+
	KWwJ0S/1YJel0Qyt+D085G5diGHKFn5lN5VwO0U1p9GQnIEHaLVhZn6NB6R8OpkVsdDTdT
	Qt08xtJiz1DQe0PBnA/XrAaDG8ZjbFE=
X-MC-Unique: uSlgDG5EPXSl5NtP96TxTw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAn/PArdvur86T+mdR+8dQmYh+6WiRY7niTEi0kgmTFwdH+q6UksslPwmJpEhwVwPxaNXIYtjLv5cdEYjAZGtp6gW6nmIGx0+34YXaqmkn04KObiorbVyBFJvjL2CT7kcSIngHCFi9kmGeDsY0Ht/nNDxXOlf7/VNYtHtk1/KysVw0G7FcQECJu0WTWEXKfyenE7O0Ak8bU2lZ+c/5LzJtjNNv/lUr21KwJUTkzRV5okF+GMju4sqG9EoWJB7h4X+IIxwrnBbVQhhHHVtbSW2zVfBc2D8exivPUi+ecZEbLL8lq+xYOAmvaCICqvyI8VV4pve6jvYqR5HTK1SRpyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5s0h5hS1J85jx+FyEr8gZjKVjTaTfQ2r300p16zpDM=;
 b=N8OSANLrr2PJDOrb954psfjXvFrhV8LjTswIldniNzSuma7Y+Y/YwsGWQRAf+4hwRE2WRR8A+zaM45akYzIisay2DS4TlaXQbvqz9Z0voTGOtEyN2rQY6dhLyW6FwmV3N3qMia3RzAVZ9zFgNaspAUdtERIEBGVoFqPkl2zsK8p6TwZN10SIyBgrwoqcPfMdYvMdRWm6kfZzjIiJSBZy4HnHLFdpG/jDL839cS4rLW7yJ9q915jcAGgK+EsbB4xK/wrQYbeTW5M5Iq8MDGfsr75cQ7QktvJZXQa8J3anbrvTO/VLAzmaa6ieztt7wmUz0r+ai7nbZWPH9W6j53gJPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andre.Przywara@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com>
Date: Thu, 7 Oct 2021 15:43:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0b7a4fe-95fc-45b2-52da-08d989987afa
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3935:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393591C0CCF7E2486795B6CDB3B19@VI1PR0402MB3935.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SjisXo/NXpczKRsTuD++vpHqe6iauz4DCNj5fuBzsSY0Am26H59aSmP2TS+OCy2/aSYEU66zfOLmQg3PsIM+DFT7GYy7lh9LNKMmb2Ui6PQGDzESgi5KhDSTUG72x2g0PnaAtfRkEaQMHUahqBWEPOjQYgP2W6u1dnUiwiT40T4WNQiUxHgY6Ans18FA9uPuFVBhTX0JXpLEbCw0pwczJjcXvYCBq9smFaGBHmChK0nHbjQ5CUkH2D4U7EN+19yZ76Jct43U40/rCdEM/u8cUM3ocQ3ihAKk7AHVN/BXLNMaNa38MjWtjcSLuvV8hUzxHXNfUGwu/deGTOLx6LxgKCh+T8jFidI54qV3QIImv0wv7xqINAfCgV7GjGqHVG3qRUK1tuXoVw+79/uHxf56iFi36huCFr6sJTse1VC5zjZR/Icyl8mZridu7HN0uismcjqi3ZLZdNVSDYWl3oefIFaZSSZF8lmy7x/ktn9Dgq4WFyd37+X3zSKd8Be1lUlnTUrU478KrAErOI8+F112iERfuyAVMQwqUwGiefIYdTsDDUvhgYsuL+H7hpkFLkcAmYFqhbu/LLgZ48wzr7yncyrwh8jM9+XPuB3fkQF7h6OZDFFawZTGwiqeCAWFoW8W/E/GoUB13SduYpKurgWl6R2b0HWM6N9S59RF5f8867hlN/anNN92hkE4BmaNvRzLdpTk8ztZhMBsk5MxXLjG4DwxP4vVFleggtunLavomHs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(16576012)(2906002)(83380400001)(6486002)(6916009)(54906003)(316002)(31686004)(36756003)(7416002)(31696002)(26005)(66556008)(66476007)(956004)(66946007)(508600001)(2616005)(4326008)(86362001)(8676002)(38100700002)(53546011)(5660300002)(8936002)(2004002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDBldlU3c2N4RFFTU3pjNysvbnZlZ0JjZFFQcXVtNUZXNER5WDNCVXM4SWE2?=
 =?utf-8?B?Rko3SFMvNEtZelBGck9lcEUyM2NUMW1FQUFqYmJpUktUZDF3VXovUEZzd0Jp?=
 =?utf-8?B?aVJqVWovaE9UeHEzcFg2THh3V0pDQVZBaU5uMXVkNjBob0s4Y3ZaTlVDdGph?=
 =?utf-8?B?N2VSRG0vZ3kyYkFsd2FmYjRZNW9KNG9SdmZTb0dKdlNKTkpQZDVZRURJQzhC?=
 =?utf-8?B?TElFZVNyTGNZa3dXK0Jhem15Z2RPM2g4cHBSaEYvSkZOZ05TekNjYXZ3cmcr?=
 =?utf-8?B?eGFPMlFvak5sOFcwYkk2WTh0b2l4MUV0dnJ5aHd0d1NCaUVlWld2S3laa0xG?=
 =?utf-8?B?OXJQNjJrby9DbVFpMnFuYTZZN0ppK1I5V0Z2SnVtbC9qeVB6MWV5TmVuT2xt?=
 =?utf-8?B?dlh6Zi8rZjBmbUxUc3lSSnF1azJ0UGNHcVBkM3hZTjlNMTI2azZza1I2UUNV?=
 =?utf-8?B?RUpnV2ttTVBhRnhtYTZaV0VrNC9vcWRvd1dYOVdGUVBTOERxejQwTnFhOXZ6?=
 =?utf-8?B?TldOOXE1dVF5QkxvVzNQTVYwdk8rclhZdW1ETWJLZU9rUGFMRlY0M0I3UVJY?=
 =?utf-8?B?dUkxalQ0dUpnbERnelR0Z2RYYjVMQWxtSG1uNkNDSEJSdWZnMFpnWS9NRU44?=
 =?utf-8?B?eERZaWY1bkdyWEVZVlFNZXR1eDJEaHFkVGozMGwwRXFtaGxkNW83SzJKdmdu?=
 =?utf-8?B?ZDJxaDBTcUlKSkU3TDNLQm9qM0RlenF1aWpxWENsaXUwR2F6ZTV4S2VEWVd3?=
 =?utf-8?B?c0NDR1hhSjJ6c3FKMDI4WUovdXZZT3dCbXZFSzczMEovSFNCRHU4dFFKbCsw?=
 =?utf-8?B?YlQxSG1Vc0FBdWk1NmgvYVNiczVyakthKzhpU2crdHpoYnFrb0VkOVJSV2xH?=
 =?utf-8?B?eXBPanRTVWw2ZGJMRStESG54Q0kyUjVMNEVyRjFZa3BRaWNscUhBSkJNL2FX?=
 =?utf-8?B?QU5DcTR1dW1qUHIrcGsrSVdXWU9ldUY4R3Jjb2NQdTFhYTFWd3kwSUVYY00w?=
 =?utf-8?B?TUFaTUNDVm9jRERQSXljeXZPMS9uUDNMZW5hQ2RYZHpaOWhaWWJvZGtIR3V5?=
 =?utf-8?B?OGp3b284NUhLMGFkWWg1VXB1bXpVUWVKMk9sbW9hUXJxVUd5WE0zeHptaGlJ?=
 =?utf-8?B?Z3I3SUlmRkNDNEwyMWlTUFJiTjJ3L0Q5eHNCcFdLRUY0UVNaQUN3cCt0Slkx?=
 =?utf-8?B?SzZkS1RnSU50RlV3WUJ1Q1l6Wnl6Y2w4WDhQMkZYZktyYjgrcFVXTXZxUnRG?=
 =?utf-8?B?V0ZTR0FPcGZYWEdWR0xqZjVDRXA4L2FMKzd1a1FJckMrM2VBQjIwWHNPRU1O?=
 =?utf-8?B?OEU5VklSYWhtbEVYSTRvVlB0L0JqcXJ5MjExOGFjU2w1VmdZWXgwVnc1VGRw?=
 =?utf-8?B?WFpQcHR6SVRIKzNiWWVneXMwdGg3ZDFhd0t4RWhYRm1xeUlWbXFnUWVRR2xu?=
 =?utf-8?B?MDk0NytQZXVkZS92UTBTVHJpRGxuSjk1cjVNUHBXUWUzaE5wMVBVQi9nQ3NR?=
 =?utf-8?B?ODI0QklJVEltaFQwY3pMTGNyY2ZhZGpoTGxIU3JkTkdDQ0FWTWRjNGNneTdJ?=
 =?utf-8?B?NTMwR2diWW9DVENYQmsrdGIyOVBGMUI3bEp1U3A0REFEVndQcjNMV0gyZ0xP?=
 =?utf-8?B?VVBQdEZOVksyUllOZ1ZUWllrbWFBMVdEYUQrWThCaEhOcUFiOWpMNlg3dTdr?=
 =?utf-8?B?WHpZZDRwMUlYSkthejAzVjk3T2YxUFlFZUxoWms4NVdZdjR0cE96cjNpQ1oz?=
 =?utf-8?Q?/j8FjCs/trb0x/chQJONqb3gUGgvosrV1mw8jjx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b7a4fe-95fc-45b2-52da-08d989987afa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 13:43:44.2145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krQRFlfXlI+XH1BYyfn6vkIcC3LZkBCz+mshjC6PhDQa7OebAE862KXWG1WFUTBKYrDdZ1+xaZK406cAJy9lxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3935

On 06.10.2021 19:40, Rahul Singh wrote:
> --- /dev/null
> +++ b/xen/arch/arm/vpci.c
> @@ -0,0 +1,102 @@
> +/*
> + * xen/arch/arm/vpci.c
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
> + */
> +#include <xen/sched.h>
> +
> +#include <asm/mmio.h>
> +
> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)

Nit: Stray blank (like you had in an earlier version for MMCFG_BDF()).
Also isn't this effectively part of the public interface (along with
MMCFG_BDF()), alongside GUEST_VPCI_ECAM_{BASE,SIZE}?

> +/* Do some sanity checks. */
> +static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len)
> +{
> +    /* Check access size. */
> +    if ( len > 8 )
> +        return false;

struct hsr_dabt's size field doesn't allow len to be above 8. I could
see that you may want to sanity check things, but that's not helpful
if done incompletely. Elsewhere you assume the value to be non-zero,
and ...

> +    /* Check that access is size aligned. */
> +    if ( (reg & (len - 1)) )

... right here you assume the value to be a power of 2. While I'm not
a maintainer, I'd still like to suggest consistency: Do all pertinent
checks or none of them (relying on the caller).

Independent of this - is bare metal Arm enforcing this same
alignment restriction (unconditionally)? Iirc on x86 we felt we'd
better synthesize misaligned accesses.

> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
> +                          register_t *r, void *p)
> +{
> +    unsigned int reg;
> +    pci_sbdf_t sbdf;
> +    unsigned long data = ~0UL;

What use is this initializer? The error path further down doesn't
forward the value into *r, and subsequently the value gets fully
overwritten.

> +    unsigned int size = 1U << info->dabt.size;
> +
> +    sbdf.sbdf = MMCFG_BDF(info->gpa);

This implies segment to be zero. While probably fine for now, I
wonder if this wouldn't warrant a comment.

> +    reg = REGISTER_OFFSET(info->gpa);
> +
> +    if ( !vpci_mmio_access_allowed(reg, size) )
> +        return 0;
> +
> +    data = vpci_read(sbdf, reg, min(4u, size));
> +    if ( size == 8 )
> +        data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;

Throughout this series I haven't been able to spot where the HAS_VPCI
Kconfig symbol would get selected. Hence I cannot tell whether all of
this is Arm64-specific. Otherwise I wonder whether size 8 actually
can occur on Arm32.

> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
> +                           register_t r, void *p)
> +{
> +    unsigned int reg;
> +    pci_sbdf_t sbdf;
> +    unsigned long data = r;

A little like in the read function - what use is this local variable?
Can't you use r directly?

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -766,6 +766,24 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      else
>          iommu_enable_device(pdev);

Please note the context above; ...

> +#ifdef CONFIG_ARM
> +    /*
> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci handler when
> +     * Dom0 inform XEN to add the PCI devices in XEN.
> +     */
> +    ret = vpci_add_handlers(pdev);
> +    if ( ret )
> +    {
> +        printk(XENLOG_ERR "setup of vPCI failed: %d\n", ret);
> +        pci_cleanup_msi(pdev);
> +        ret = iommu_remove_device(pdev);
> +        if ( pdev->domain )
> +            list_del(&pdev->domain_list);
> +        free_pdev(pseg, pdev);

... you unconditionally undo the if() part of the earlier conditional;
is there any guarantee that the other path can't ever be taken, now
and forever? If it can't be taken now (which I think is the case as
long as Dom0 wouldn't report the same device twice), then at least some
precaution wants taking. Maybe moving your addition into that if()
could be an option.

Furthermore I continue to wonder whether this ordering is indeed
preferable over doing software setup before hardware arrangements. This
would address the above issue as well as long as vpci_add_handlers() is
idempotent. And it would likely simplify error cleanup.

Jan


