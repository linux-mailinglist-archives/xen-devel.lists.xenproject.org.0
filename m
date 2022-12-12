Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE07464A578
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 18:05:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459873.717654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4mE9-0005fm-VT; Mon, 12 Dec 2022 17:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459873.717654; Mon, 12 Dec 2022 17:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4mE9-0005cy-Sd; Mon, 12 Dec 2022 17:04:29 +0000
Received: by outflank-mailman (input) for mailman id 459873;
 Mon, 12 Dec 2022 17:04:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8fsB=4K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p4mE8-0005cs-2I
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 17:04:28 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2059.outbound.protection.outlook.com [40.107.105.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 083c5fe8-7a3f-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 18:04:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7862.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Mon, 12 Dec
 2022 17:04:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 17:04:24 +0000
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
X-Inumbo-ID: 083c5fe8-7a3f-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGU/ca6AZNYuSRxlh0ap7eDCcbfy7zAODC/WaolCLEHNHm2Cq6w8oiFI7lu/4GPzmpp4g1bvXKR5K/16xROQKh2PCdK9F7iCyqwUdDujddbYZziUj+KSIAleg4MUaTcjpsaTSOYEFUnHWVnP8hDmk/JClyN27wsHuqES4fJ59I/6TWQ4poA7O/Hqcb649qzdv507tu8x1ziD43voFyFFkuPF99A99JWylRMD2500oyuWKD+LaCWbsaYjboI0e9FFEtdLDvMoinrBrOvju/dM0Kviz2D3++3kX1U4MaDg0XVbt4ke8DNhweKM7U2ZNKa3vMQFNDqL4TaMvrcRj8tMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAef7jgG5HuSLH7kh4g4SB4CLihc+yHiqlE1uVmyxfM=;
 b=FShIP0YGl5rnXXN9xDQqCq+ym5yHobzhuI5IMgumWE5CqZd6u6cgIrwkYi+UEaYu+7bW/GZ47HjevdpBRb6wiKDivkfsuhi9GZuXR4Fhs1ZILBy6SWxLbX+HjwmGZ3PjVqmz6HE7+6NJdIOGIlhLuQB3FYK1rBqnmNT+T1Rl6JqUZ2rNLnXKEfkZXRNX4Warzemi4oA/vKqZy5pQRlyFMRFbd6arLR7qqNLlq+QSdeNe+MMcyXPLHvTJUOQ/PH2gwZT/nrDkp/wsnxkes9jlLNYfd2gcYZCy/QNNDSCSmwLwNDX/ObS1jAmoJPfWbDVRmvCSG83TX6ErtzbMVFEI0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAef7jgG5HuSLH7kh4g4SB4CLihc+yHiqlE1uVmyxfM=;
 b=0/ldxSpEayD99/HVfp9VSXwFIAPWWCu9dHTzQLqR6lPKD2CFYBavEbQsDN3c4XBjX5viD0oUQRPWosj3jvW3XfOcQrw1QCjDSRapxL1Zl+yfniVVVYsa7SRfpfQh8Yg1ACTnbUjILg7Lic2Y5JOxDNMn6c/t43MonIw/ZzsWA/GdZSqz6yDVD31LMXPY0K+yAhmHZ75s6m7U5pEJtJRXvYDjZMniRGHE5R3o5tN9xqQKIcZjd7G19p1XlfNPDj+QUFXVw6AdMgPUYqY4C0130ZI5oBe/1ZEVXCH0bdW4FiQVcOReMz7Aj3JAme5oQ040SKlk4okRn8//nCmYGexfxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <641a5905-3a1a-e128-788d-e907297aa213@suse.com>
Date: Mon, 12 Dec 2022 18:04:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/3] x86/pci: Fix racy accesses to MSI-X Control register
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20221110165935.106376-1-dvrabel@amazon.co.uk>
 <20221110165935.106376-4-dvrabel@amazon.co.uk>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221110165935.106376-4-dvrabel@amazon.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: c885281d-c036-42ba-1365-08dadc62eb8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zIdkIVfCqAXQmHShnlwgzyAQEnk+hAon77cu953C6zukYbfClKUfwYttXhzbnufcDGW2VRtVXH9hYw+4zAsmfaJEI2u2QsPJQ9AHLxAHe+ccFczH+OitKF892GR7U8AmKOquyiWjh7Uy0peaaqNDJLK/e0uS8YD+9JmUcBsMKeIg0AFEJwG17Ec8WRU1/Y2mG5dLGANe/xT6XoIo1sfkKSjkeDnqImQTyB4yPDE74SLIcvPzGU+KeXD8XNWxCxfwiHx4d3C2dTl33J+aENwb+1AeU4OrLPovayVPZ9oBfNBgKqZI/DLkc7Nuc4VnukqaYpyuvAVI+jq5MiuoL6RL4sI2f3bqqVT6QQXgMztK6Oajy7g/eohdgpdMFASPdhRWao19cc0zUMlG0iIOgow1q9xY+5pXcm2+MeLSRdL8M+exQAbAX+/TVvGz3W5qnGRSy2ED+GXJf4F2f6NgKRgS8TiWk/+ttop4NSp2PuN5LXVvMnHIHPf+jmNOsJ2YR1Uow0LKza52ZJJvd8INVoN4JAAsTzdp7Wwmkn43OAcUQKovPvFkwbLYY9/MP8ZODL6Iznl7rleTSTW+YiMKcOfAK3j4GbnbXejUYdwiqa8t2IIAVvoJTftAig9428OddH3rjYw4yE6z+k9Mk0FitA87o8w9uUPsN9yOjhx6Iss6RbAQLTx+r5dYzH1Fs1O6WtZG57a8UJeLoY8GbyzzG9tNjj4x2SHkDUrEnZAw/7/ZPBqWA/AiTbAzz5ZsF07yFLCq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199015)(38100700002)(41300700001)(66556008)(66946007)(31686004)(8936002)(4326008)(8676002)(66476007)(5660300002)(2906002)(83380400001)(186003)(316002)(6916009)(54906003)(36756003)(6506007)(478600001)(53546011)(26005)(6486002)(966005)(6512007)(31696002)(86362001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlpWNUhyMWtuVSs0TGhYZGNYbXJLRnhlY21YNU0zcmFPVE4vRm1tL1hoTzZw?=
 =?utf-8?B?VmdrMC9BSHVIM3E1dW0xbUc5aERRNmVWb2E0V1ZHanAyYVhvTlZ3UEdFam1i?=
 =?utf-8?B?bGFlUzIwSSt0QU1XNFR0SDNPWXRXVncwR2tPQnRmZVZiVWZRbDl1ckpGU0xE?=
 =?utf-8?B?TDFSeldEZUlLd3JQMEhxcXFhTDgwdmljcWlNK2F3anc0T2J4WHFGbmVteGhw?=
 =?utf-8?B?ZUZlK2RxMkIzZlNRWGlyWmpGeHJralllb2FaZFV1bDNIam5JUGxobHpnQVU0?=
 =?utf-8?B?aUR5Vmx2Sk1zdnNTWXM0TU54VTl6L3EzcHJTQTdNM3pPUTB2OEFqOHE0OXlG?=
 =?utf-8?B?OWMvUTl5UHJ6Qktsb25ubVplWkcvaE1YVlU0aHI2TDY1My9HNlFRZk1yWGhn?=
 =?utf-8?B?dWxyVTVwU3YyUWVRSW5GSWRLVEFGMDN1MDJqa1ZLaHYzQmxzUk5kUmJkTS9M?=
 =?utf-8?B?U0MwTWp1eEFMRzk4bWU0ckRPdXNxN3VjQWpqVThmb2NvZ1ZUQnJMRzkrUnVh?=
 =?utf-8?B?NWQrWUd2Nno3TVdjZXZkMDRUYUFUZ3FRd0RNcjl4VDZBbFdVWHB4c1NkeFJt?=
 =?utf-8?B?WVBncVI2STFoU1M3UTg5K05MV3czSVMzK1ErWWRDNDN3VFJ5SHNGdlpwcWpW?=
 =?utf-8?B?c0Q5VmZ6NTYwOTZHcmVSOVhlTytnSCtDNEJYT0p3TUhkK2MzSmRYamE2a1BW?=
 =?utf-8?B?Mjl6eURBaVh1ZFFGYUN0T2F5SStPa1VORkJjU1ZlWXlGOTBXdlo0ODcrTlJV?=
 =?utf-8?B?bnBnblNjaVlVdHM5T2FQeW9RSVlPc3pJbENHKzVqL09OVUxDZDQrdk0xZFlY?=
 =?utf-8?B?bjZvcjcrRlBCYkhWclJrNlgzSXlMbnZsWUpJN2dQeURvRkZXU29OU0g4eVVZ?=
 =?utf-8?B?WXF0UFJveGNiNk9kQ05xRU5LNkpiNHdHZ2ZuZG1pUUx0THVkait0VEt2YXFj?=
 =?utf-8?B?VnRrOHBMUWxjTWF0Wi9SUTZYQmV1NTBpTXNJcE1YUE9zRTZtYTZUSytUL2Jj?=
 =?utf-8?B?MTBDb0tMSUY0TDJOVVRGNHZUbTM0S2RXWE4zOGY0dWNRcytDL2k1MlNGSVJX?=
 =?utf-8?B?K3pxd1Qrdzh0RmhJWFVWbzBGbTlPOWZqSndyWlNqOFdoU1JOODdDdU1jSENh?=
 =?utf-8?B?ZnBsRmRzLzFLS0kzYUdOa085eEtnRHBobi9QanRZMHl2UUZQR25Oc3JYaDRK?=
 =?utf-8?B?UkIxZ1dSV3N2S3ZlRFNtdS9wTHloZFZVWXpyV2xYUnFCUG11eUlqczJiRkJR?=
 =?utf-8?B?N0dzRGhISy9CRDRNWkhpbjhTV2huYjc1LzZ4OHVnUTBSNVFhZWozYTkyMklM?=
 =?utf-8?B?M2lDYUxJcnV1UEluV3h3ekZZK3ZNRElwNUNQMGJFY1BKUkV5WnVnZXF1bHZK?=
 =?utf-8?B?U2N1dGc3dUZ4YzdhRXFRV0kxTHBYdDFsVzY3ak1YekRMZUJRMXFsK2J5VFY3?=
 =?utf-8?B?alFxenFSWi81SUE1T2xydWlTSU9OWlhYbjBJRmNPZGpXczF4VXNtMEU5SnM4?=
 =?utf-8?B?TFlFTmtSQjg1NGh6QnVMWTcvRXNEOUlhTEFoZnEyOU9hQ2hlOTIxby9JVlVk?=
 =?utf-8?B?WG5BbEtFYnpMVG8rMlI3T05ya2Z4TUhIWFNCRkJsOTFWUmhTK0h3N2xRUHVj?=
 =?utf-8?B?MmFtZUc5SmRzWkpNbVlFT0V3UTFSTnZCc0hNWm8vMHloQzdzL0ovZG9HcFc4?=
 =?utf-8?B?THVvd2tlNVJ4N1c4Rm0ycWV6ZGxQSEdoVXdNcUFWNnJWUUo0cVBkeFFnVUxh?=
 =?utf-8?B?Y2Jya080U2s4RnJ3VUN2UkhmdkVTMjV2M00raWcrNHFVNDFSaytwSU5EVmFy?=
 =?utf-8?B?OGxjQVBGYlpnSEVrbDVzTXBnSlZ5TjV1WjhjOVJ4OWt4bzB1MTlqYXdTNGRm?=
 =?utf-8?B?eEhweDI2MUIwM0lhMVU0RmJ5cWFqMDl0bERCUDI3S08xTXRzOUtBY3FqMytQ?=
 =?utf-8?B?RmdrZGhyaWhTcFBqelF5UUlWYzNWK2xkcnp1SlI3VGhjKzRrVUV4cFVSZkFj?=
 =?utf-8?B?dVJLY2hPT3ZxU2x5Vjg4MW54cC9YRHR0MDdDblorbGtUQmREZzFhdkNPRzVu?=
 =?utf-8?B?blpKbUVPbzluVHJKcWtUbWxkOGVBWHdiSXp2SGRQL1ZxMlo3MUE0WUtRNlRB?=
 =?utf-8?Q?kv9UaKS44aLzHprFwSvnRfj7u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c885281d-c036-42ba-1365-08dadc62eb8a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 17:04:24.4509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +53rR5VfFkkxMBTb587JyA61ac5sdn48Ariumn4tIcuVTAHhT0MqogzSChugVnq/q3wyukYBzn+hBrwxC3z0oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7862

On 10.11.2022 17:59, David Vrabel wrote:
> Concurrent access the the MSI-X control register are not serialized
> with a suitable lock. For example, in msix_capability_init() access
> use the pcidevs_lock() but some calls to msi_set_mask_bit() use the
> interrupt descriptor lock.
> 
> This can lead to MSI-X being incorrectly disabled and subsequent
> failures due to msix_memory_decoded() calls that check for MSI-X being
> enabled.
> 
> This was seen with some non-compliant hardware that gated MSI-X
> messages on the per-vector mask bit only (i.e., the MSI-X Enable bit
> and Function Mask bits in the MSI-X Control register were ignored). An
> interrupt (with a pending move) for vector 0 would occur while vector
> 1 was being initialized in msix_capability_init(). Updates the the
> Control register would race and the vector 1 initialization would
> intermittently fail with -ENXIO.
> 
> Typically a race between initializing a vector and another vector
> being moved doesn't occur because:
> 
> 1. Racy Control accesses only occur when MSI-X is (guest) disabled
> 
> 2  Hardware should only raise interrupts when MSI-X is enabled and unmasked.
> 
> 3. Xen always sets Function Mask when temporarily enabling MSI-X.
> 
> But there may be other race conditions depending on hardware and guest
> driver behaviour (e.g., disabling MSI-X when a IRQ has a pending move
> on another PCPU).
> 
> Fix this by:
> 
> 1. Tracking the host and guest enable state in a similar way to the
>    host and guest maskall state. Note that since multiple CPUs can be
>    updating different vectors concurrently, a counter is needed for
>    the host enable state.
> 
> 2. Add a new lock for serialize the Control read/modify/write
>    sequence.
> 
> 3. Wrap the above in two helper functions (msix_update_lock(), and
>    msix_update_unlock()), which bracket any MSI-X register updates
>    that require MSI-X to be (temporarily) enabled.
> 
> Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>

Just a couple of mechanical / style comments, at least for now:

> SIM: https://t.corp.amazon.com/P63914633
> 
> CR: https://code.amazon.com/reviews/CR-79020945

These tags shouldn't be here, unless they have a meaning in the
"upstream" context.

> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -237,7 +237,10 @@ struct arch_msix {
>      int table_refcnt[MAX_MSIX_TABLE_PAGES];
>      int table_idx[MAX_MSIX_TABLE_PAGES];
>      spinlock_t table_lock;
> +    spinlock_t control_lock;
>      bool host_maskall, guest_maskall;
> +    uint16_t host_enable;

If you want to keep this more narrow than "unsigned int", then please
add a BUILD_BUG_ON() against NR_CPUS, so the need to update the field
can be easily noticed (in some perhaps distant future).

> +static void msix_update_unlock(struct pci_dev *dev, unsigned int pos, uint16_t control)
> +{
> +    uint16_t new_control;
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&dev->msix->control_lock, flags);
> +
> +    dev->msix->host_enable--;
> +
> +    new_control = control & ~(PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL);
> +
> +    if ( dev->msix->host_enable || dev->msix->guest_enable )
> +        new_control |= PCI_MSIX_FLAGS_ENABLE;
> +    if ( dev->msix->host_maskall || dev->msix->guest_maskall || dev->msix->host_enable )
> +        new_control |= PCI_MSIX_FLAGS_MASKALL;

In particular this use of "host_enable" suggests the field wants to be
named differently: It makes no sense to derive MASKALL from ENABLE
without it being clear (from the name) that the field is an init-time
override only.

> @@ -299,11 +350,16 @@ static void msix_set_enable(struct pci_dev *dev, int enable)
>      pos = pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSIX);
>      if ( pos )
>      {
> +        spin_lock_irq(&dev->msix->control_lock);
> +
> +        dev->msix->host_enable = false;

You explicitly say this isn't a boolean, so the initializer would better
be 0.

Jan

