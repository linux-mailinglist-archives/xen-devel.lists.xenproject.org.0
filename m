Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF42474493
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 15:16:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246783.425584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx8aj-0003eJ-P5; Tue, 14 Dec 2021 14:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246783.425584; Tue, 14 Dec 2021 14:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx8aj-0003bQ-LA; Tue, 14 Dec 2021 14:15:41 +0000
Received: by outflank-mailman (input) for mailman id 246783;
 Tue, 14 Dec 2021 14:15:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx8ah-0003bK-Qm
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 14:15:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f8b1814-5ce8-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 15:15:38 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-sGugHCXENSmaOOeuckITjA-1; Tue, 14 Dec 2021 15:15:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4944.eurprd04.prod.outlook.com (2603:10a6:803:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 14:15:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 14:15:33 +0000
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
X-Inumbo-ID: 4f8b1814-5ce8-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639491337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8zaD+wrF98sV2bkLjh0h3jn/wLVrDA+xd4/sIpuA/AY=;
	b=fmtlxRq4GZ3jZ8E7ow+mfxkBKnDXy1XVMKDg804/I2fsDuoxoXJizBY8kvSlWtoMvISh1R
	GPmhSWQ7DQXFiyLcL9w+jETL7KZJIdrIXrrx5iB9DeQ5nOXuHnk4Dy/zg8EW8m8FqIoL0A
	RnBO0awPPCqhf3GRbCa/ReTMGFKdDNs=
X-MC-Unique: sGugHCXENSmaOOeuckITjA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SE9wonCMOCVI4jxWV5RJyBIsRDRGYNVIbstWADanVgFXf34YmhUsoZiI8/Scga7Pay1H/wxnWBgB3fubJTkYxoRiUeVmhe+jnEdmIk7DHHIxWfIVoeKjDKXN4Q5smY2OtZG40YCykPwqiIQscYqwHDyjY2wepMYjLmFvMlbNP/Daug3v/MhYdz1v86n1SdcfHNPqAux07d2EoIU0j6Ylw56l8oVTjMdESCacE0qV463j6pocuUntlJV7ar85E9jfPqgZoGc5dpFhyR7IzGV3QoKvZFknga5ZoniUZCvWY7mi0P8lMXDvcoFrNjCRJabfJDnDW68dAQzL5J8Z4yCoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zaD+wrF98sV2bkLjh0h3jn/wLVrDA+xd4/sIpuA/AY=;
 b=TPC84Ha3/ZBkYoKGM5qnBug036NF+AgcYI5BKBIwJDxxGQPpbb0ZXNj0qnDxt8+LjeYJiI1bnYz4EGIhCo/o6bNO7jt1Cii2ULGZ66E3S8xSdxlIV2SApb6SWJ6CR9b3wCxze8UrVzQQg5eP4abfGGFH/Uz1AfdJo9k0bt/nTfENjXQnBzwONc+RVDjRmUMVRR3zjdQcIqoWwU2ST8zD+PwfY05WV7xPZveMXI2E1b/akYPWFkUfJERJBZnnwWTL6ApHcVpCV8UoPnTB7iMKWo21TS33wv23IPivF7KTDYde85chpYaFjDyW8HBTZ8e8E9mgejQJp9UforaeKxeLAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <90c66d68-4939-f203-de2a-caebd0d6fc6c@suse.com>
Date: Tue, 14 Dec 2021 15:15:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] xen/vpci: msix: move x86 specific code to x86 file
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
 <bfb2b7f282249cee8b6ff15d424a2b7d823ac743.1639478564.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bfb2b7f282249cee8b6ff15d424a2b7d823ac743.1639478564.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0216.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc27fc3e-2dd4-4abd-2e7a-08d9bf0c3139
X-MS-TrafficTypeDiagnostic: VI1PR04MB4944:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB49449DF1C1FF6EC101DABB4BB3759@VI1PR04MB4944.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fDc57fjTyEIHhCHBHPfd6IRzyxhqCJuDdnk5sdu32D+itW8rtR9eM6VVw3rl+GphGTDcGsvM2hLWPx1A+kVqyZyYqUzEOI42EVeC9n0w8NX9sGNuXxkWP2GznIZwqAjYUJhwHN+7guUX05TGqu+mTMI2B//TRBAfsAuJftxbNokLInhEYXE7I4RJL0lIrZW/r4UnSItUrxy/rmqI3S6+twquBrhwBX0xKmrGdoCQqw1YY70JRbqSwGdlwhht1yyw9Ln6QwApx/gvXkK7EfEHvjYAMRvENoh2Now4MIbQcG3aqOFXTMeQVHvFmt4+nXZgqpnl8d7dLwB+ZnsJf0NkIO1LAyFIAiPX481f0jYrTiehfKqwqreAIqB8pAkU4HyKRKkploU8mK8VH9pLHXdncpgwe3VDtZrpn9hoATk4t03XBQ85DJbPCfiPD2WRpzQZdJr896VsQugqSt+3VJIBzKYmYKXRN1EVpaMmOZIihHlxs1BrUfYE7nPN7MwR4YT3X96JOK6Gh/HuT7OlmdVfTy7e21Ak46hDoF+E8AjZH+IyYhVCpGk/Eu/vkqfkV+R3zpb/MYl8posVbE1Bwpdc8/2u6tLCvFsmPeE+RFrL/RFDQd7f2wxkiIKqFRljfrS3DwJNSwLXITKbbv+MTsHihMZ/t9V8JKaqf+NXFvFjAFy7SbRxGDFv/i+JksMCWwMjQ21x3x0UoJRUuujwZW3XJbJKtH4jzrMURihG9xzdgnJEwi4hsrUzV9+UCNQGAcAMnBJx8UQ0L6HKLmL25pCXipMv5UKAgtYrgnxG14orUjCBkYLnMhqCwJ+FxkfaqaObJtk0DTXlNoJcNs3zwmJoCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(66946007)(186003)(2616005)(8936002)(26005)(86362001)(5660300002)(31686004)(508600001)(6916009)(83380400001)(6512007)(38100700002)(36756003)(8676002)(53546011)(6506007)(54906003)(4326008)(2906002)(316002)(31696002)(6486002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjkvdTR2cG92ZWR4SWZzQUE1TkwycFpqdUJlbjJQSlpiQUxnMG83TTIvZGIy?=
 =?utf-8?B?eG9uUGNEZGtYdFZrOWJ3a1l2QUE1a1hyMGNRcU9hLzhWREllWTE3c2tKMHRB?=
 =?utf-8?B?eHhzVy9ZcmJpb0NQTndIbE5MV2V0dklXUnd2bHNMdWVKWHNMaHpBeTgrdFBR?=
 =?utf-8?B?eFRPZTROQ0JReVhjZ2pIUENvcW9oNWVKaXh3bnVxNmd0dFBKNjRXNU9jbndU?=
 =?utf-8?B?Mmg5Z2t2dkpiTnIyYmxYaHFEcmZtc1doUXJRditLR3B2dU83L1o2bUVaNFRX?=
 =?utf-8?B?Q3ZaR0dTMUp1dS9IeE85NWhsc3R2Tmp5VGRNNGNLM3dlRUlrYjRsb3doR0lT?=
 =?utf-8?B?ZFE3K3lqektMSHV6dkZKMTNFdDZlWG4wVEg3Z0lLYUxGd0NUYUltSmRqQlpm?=
 =?utf-8?B?eXZtaUNUT2xGRnh0aE5DOUtUTktaV1pnRUdFd0tKdEJnYUZITjlQOUszWi9Q?=
 =?utf-8?B?RFpwb0tadnRqY0Vsblltb3Z0bWc4YU5sZHAvQjhVOGY1RWhTVklpaDkyWWlX?=
 =?utf-8?B?cm9xYXZsSjBuQjJwTGxDSEl2QmJlTXg5R0w2K1J6MjRqbFJ5Zkc2VnYzNitj?=
 =?utf-8?B?YW1pYUNNakdGeXhrUUd2aU5OUThlY0J5R3ZYR1ZGR1pZZVZlTkk3amZVa2ZP?=
 =?utf-8?B?UUh3MFY2Qk5jc3c0RzlxcndOZkRoVy9kNE1yNVU5VFhjMUUrV2FPTXU5Y3VW?=
 =?utf-8?B?T3NFNVRFeDdMYytjR0RIT2lxUjV2ODczMHhPNGlaMEJ5Tm1RK013TThidU9E?=
 =?utf-8?B?STlpdktBdm94L09KdUhzcUF5anVjdlRjcE1qTlowem4zQzZpUFRDYXcreWRp?=
 =?utf-8?B?aW9oRFIrYUlreU9KVTdWelB0M3VKV2JCeENsSmtuMS9zQnkxaC9KYldveDQx?=
 =?utf-8?B?cUNBNU5VTGpQQS9zaWVuUUxUbnZMTWJ6QlZscVlaMjh4bVZ0SkU1ellxc1JZ?=
 =?utf-8?B?d0IrMFp2VVhJRGdGR1JBOHhPb2hMTXF4SEZOOEh6M3JuYUFwNWwzWmYxc3VI?=
 =?utf-8?B?VzRNakFuY0trSTl2bGgvTnZkV1h4bytReWZYSnlKbXNObElZWGhYUVZYL1kr?=
 =?utf-8?B?TGQ5WjBKVFZPaFg0YlhKTDd2MVdxWGwvc1FzNU0yYmJLNnl6ZmU1RWpSbHB0?=
 =?utf-8?B?UTRFYUFxTFhGc1ZsOVV4Z0VyL1RiZGpHR0hoWFlKazI2YWxWMXNSU283aEVT?=
 =?utf-8?B?ODA3Y2g3ZEUvaW5mQ1BmTEhvRDBGM29PTVhRa0xsUDZCdGpDZ3JiaGZ6cFJx?=
 =?utf-8?B?eDByMm1JNEI4dS9tTFBTYzdWSDRwK0FFbElaRmJCTUJNZ0hyZGRpc1JqL0dt?=
 =?utf-8?B?aC9oWEJKRFBlWVhJZWZmaEJIRlNYUnNhK29EUytDdVlsc3JNRVVBa1l2QU1h?=
 =?utf-8?B?bjk4VC91alUxRWlucWNZTUt4bWs2Tmtmam5TSnZuUUdHMHhHMFJKVzM1UFhF?=
 =?utf-8?B?WnpWRURXVm1HbDF0K2tEbmc3amZmcTIvejB4dGtBRFVYb3NyOUl1b1NYdnJt?=
 =?utf-8?B?TVJZYU9FenhEWE93QkNCR3pSMnNRZmtRcGVsRlY4QVVueUhxTm1rOFVpdnha?=
 =?utf-8?B?R0d6K2ZlWFBscUY5WWVnVDBERk5kUGZYL2ZFcWdHdjRjZlhmVjR3V1VIUnRX?=
 =?utf-8?B?YkhEdEdiQi8xTlJhQTNMNEF1NCtlejdhdHhoeDhqR04zdTdCYlBZa2RGdTFs?=
 =?utf-8?B?SU1tQ3J5TmhYbFhGS0swQVBxODE0SEJMMmRobzA4VmVMa3ZpbEtRdC8wVFV5?=
 =?utf-8?B?NHUvRHovRXplQjBlWGdwcDYxNGtLdHZDU0FPUjJ5QzlaMVIwVnlINlNpazMz?=
 =?utf-8?B?S3lRV3diSXZ6SlJpY2dKeFdGSTNRaVNJRXUxdVpVS0VpMUFTQVRqTGI5S2NC?=
 =?utf-8?B?aGMzQUdMeDI4Z1RrYlhJS3hwNlFVdUxITElyWE92aDY1KzJ5THUzNXl6OGxy?=
 =?utf-8?B?S2lPOXhucVRIUjUzd0ZhaDJ6UTZsYlFRaDROaWpoOCs2QlRPdmR2MVpiNWkv?=
 =?utf-8?B?N0NYYWhUNk56T3hzTzhWaTRpNitMZGtvOUNQRGFPNy8zRnBMM3k0QUg1Nm85?=
 =?utf-8?B?eWs3K2s0Wjh5ZWtyWFVGK2pSN2ljWWtoR29RVldORThtM3YvQnlXZ1V2UTkx?=
 =?utf-8?B?VGM3bUpxR2lrdEwwb3VNUXU0RThpdXVTeVNUcEMzQ0VhbnhKb0lSMm14YnZa?=
 =?utf-8?Q?nHT+ARRO4J4s9v/VJsugYtc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc27fc3e-2dd4-4abd-2e7a-08d9bf0c3139
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 14:15:33.7598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAu2CVFRT7xYA4hlffDPEsOhW0lmzrRSNU7fGH1wMqXqzVHOj3SkWgp6hMr+F229EzvES5izxURVb/xpFfJHmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4944

On 14.12.2021 11:45, Rahul Singh wrote:
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -17,15 +17,24 @@
>   * License along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <xen/msi.h>
>  #include <xen/sched.h>
>  #include <xen/vpci.h>
>  
> -#include <asm/msi.h>
>  #include <asm/p2m.h>
>  
> -#define VMSIX_ADDR_IN_RANGE(addr, vpci, nr)                               \
> -    ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
> -     (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
> +/*
> + * The return value is different for the MMIO handler on ARM and x86
> + * architecture. To make the code common for both architectures create
> + * generic return code with architecture dependent values.
> + */
> +#ifdef CONFIG_X86
> +#define VPCI_EMUL_OKAY      X86EMUL_OKAY
> +#define VPCI_EMUL_RETRY     X86EMUL_RETRY
> +#else
> +#define VPCI_EMUL_OKAY      1
> +#define VPCI_EMUL_RETRY     VPCI_EMUL_OKAY
> +#endif

In addition to what Roger has said, at the example of the above I think
you want to split this change. The change in return value naming could
likely quite well be a separate thing. And then it'll be easier to see
which other suggested changes are really movement of x86-specific stuff
(looking over it I wasn't convinced everything you move really is).

> @@ -472,11 +401,10 @@ static int init_msix(struct pci_dev *pdev)
>          vpci_msix_arch_init_entry(&msix->entries[i]);
>      }
>  
> -    if ( list_empty(&d->arch.hvm.msix_tables) )
> -        register_mmio_handler(d, &vpci_msix_table_ops);
> +    register_msix_mmio_handler(d);
> +    vpci_msix_add_to_msix_table(msix, d);
>  
>      pdev->vpci->msix = msix;
> -    list_add(&msix->next, &d->arch.hvm.msix_tables);
>  
>      return 0;

May I ask that you don't alter the order of operations? I take it that
vpci_msix_add_to_msix_table() is the replacement of the list_add().
That should occur only after pdev->vcpi has been updated. I could in
fact imagine that in cases like this one for Arm barriers may need
adding.

> --- /dev/null
> +++ b/xen/drivers/vpci/x86_msix.c
> @@ -0,0 +1,155 @@
> +/*
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms and conditions of the GNU General Public
> + * License, version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public
> + * License along with this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/sched.h>
> +#include <xen/vpci.h>
> +
> +#include <asm/msi.h>
> +#include <asm/p2m.h>
> +
> +u32 vpci_arch_readl(unsigned long addr)

Nit: No new uses of u<N> please; these are being phased out, with
uint<N>_t being the intended types.

> +{
> +    return readl(addr);
> +}
> +
> +u64 vpci_arch_readq(unsigned long addr)
> +{
> +    return readq(addr);
> +}
> +
> +void vpci_arch_writel(u32 data, unsigned long addr)
> +{
> +    writel(data, addr);
> +}
> +
> +void vpci_arch_writeq(u64 data, unsigned long addr)
> +{
> +    writeq(data, addr);
> +}

Functions like these (if, as Roger said, they need abstracting in the
first place) or ...

> +void register_msix_mmio_handler(struct domain *d)
> +{
> +    if ( list_empty(&d->arch.hvm.msix_tables) )
> +        register_mmio_handler(d, &vpci_msix_table_ops);
> +}
> +
> +void vpci_msix_add_to_msix_table(struct vpci_msix *msix,
> +                                 struct domain *d)
> +{
> +    list_add(&msix->next, &d->arch.hvm.msix_tables);
> +}

... these would imo better be inline helpers.

> --- a/xen/include/asm-x86/msi.h
> +++ b/xen/include/asm-x86/msi.h
> @@ -148,34 +148,6 @@ int msi_free_irq(struct msi_desc *entry);
>   */
>  #define NR_HP_RESERVED_VECTORS 	20
>  
> -#define msi_control_reg(base)		(base + PCI_MSI_FLAGS)
> -#define msi_lower_address_reg(base)	(base + PCI_MSI_ADDRESS_LO)
> -#define msi_upper_address_reg(base)	(base + PCI_MSI_ADDRESS_HI)
> -#define msi_data_reg(base, is64bit)	\
> -	( (is64bit == 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )
> -#define msi_mask_bits_reg(base, is64bit) \
> -	( (is64bit == 1) ? base+PCI_MSI_MASK_BIT : base+PCI_MSI_MASK_BIT-4)
> -#define msi_pending_bits_reg(base, is64bit) \
> -	((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
> -#define msi_disable(control)		control &= ~PCI_MSI_FLAGS_ENABLE
> -#define multi_msi_capable(control) \
> -	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
> -#define multi_msi_enable(control, num) \
> -	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
> -#define is_64bit_address(control)	(!!(control & PCI_MSI_FLAGS_64BIT))
> -#define is_mask_bit_support(control)	(!!(control & PCI_MSI_FLAGS_MASKBIT))
> -#define msi_enable(control, num) multi_msi_enable(control, num); \
> -	control |= PCI_MSI_FLAGS_ENABLE
> -
> -#define msix_control_reg(base)		(base + PCI_MSIX_FLAGS)
> -#define msix_table_offset_reg(base)	(base + PCI_MSIX_TABLE)
> -#define msix_pba_offset_reg(base)	(base + PCI_MSIX_PBA)
> -#define msix_enable(control)	 	control |= PCI_MSIX_FLAGS_ENABLE
> -#define msix_disable(control)	 	control &= ~PCI_MSIX_FLAGS_ENABLE
> -#define msix_table_size(control) 	((control & PCI_MSIX_FLAGS_QSIZE)+1)
> -#define msix_unmask(address)	 	(address & ~PCI_MSIX_VECTOR_BITMASK)
> -#define msix_mask(address)		(address | PCI_MSIX_VECTOR_BITMASK)
> -
>  /*
>   * MSI Defined Data Structures
>   */
> diff --git a/xen/include/xen/msi.h b/xen/include/xen/msi.h
> index c903d0050c..1c22c9a4a7 100644
> --- a/xen/include/xen/msi.h
> +++ b/xen/include/xen/msi.h
> @@ -3,6 +3,34 @@
>  
>  #include <xen/pci.h>
>  
> +#define msi_control_reg(base)       (base + PCI_MSI_FLAGS)
> +#define msi_lower_address_reg(base) (base + PCI_MSI_ADDRESS_LO)
> +#define msi_upper_address_reg(base) (base + PCI_MSI_ADDRESS_HI)
> +#define msi_data_reg(base, is64bit) \
> +	( (is64bit == 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )

As you move this code, please tidy is style-wise. For the construct
here, for example this would mean

#define msi_data_reg(base, is64bit) \
    ((is64bit) ? (base) + PCI_MSI_DATA_64 : (base) + PCI_MSI_DATA_32)

or perhaps even

#define msi_data_reg(base, is64bit) \
    ((base) + ((is64bit) ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32))

Further items would want similar adjustments.

Jan


