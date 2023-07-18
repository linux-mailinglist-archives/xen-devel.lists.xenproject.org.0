Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C4C757FCC
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 16:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565336.883417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLlsi-0008Jq-IL; Tue, 18 Jul 2023 14:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565336.883417; Tue, 18 Jul 2023 14:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLlsi-0008HU-FL; Tue, 18 Jul 2023 14:40:52 +0000
Received: by outflank-mailman (input) for mailman id 565336;
 Tue, 18 Jul 2023 14:40:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLlsh-0008Gu-4d
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 14:40:51 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe12::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 162e0009-2579-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 16:40:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9579.eurprd04.prod.outlook.com (2603:10a6:10:306::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 14:40:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 14:40:47 +0000
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
X-Inumbo-ID: 162e0009-2579-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUvC+ZsOyBluH/SPQQew68tVJXrdRowdMK6XQnX2XZoQqr11+tyJ4zpJuBu4ztmb6dMuQXgNuumXl2Bo0W0wQa/BQGpMBsYjhVKhU3Wgq6LUxOe6tAUPd7yYdNtQ1UKQYeX9BCfTMO9dOuK1pgW06n6QmD/HkP82dQAwQvGgc4xiG1XYhUWDxhJ1ypKEqiHMprshW4A712mTW3Pk0rucPuxLs3U5A5zRWhJsjDiD1evrHBylAA+HbfG6MPoVdDs4f15gCYAuM3FR/Jd9yIq920E33JfjCBKEmg2E8b7RkYh1DxZMKULD5NYT3E45hn0qRul2kcZBneuCh/q+fE5J0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAAp/79gr9jTiL9SmfRndnx1mM9WxsdljfgrYyBExvA=;
 b=I5r09eyuGldvzNZcm9lgWBEpSgRy1PfBzGY1iSH66aaVC76i/zpytXVe+NbG+lGnkAYIMmDry0InrCUrQ1yb+Hdy+Qputj7yOgB3CxH4oudrXv84VZR2hYIzAUXr21iRjkomHe07AJiMIEeVL5H5mnZr5hnB1R5W5R4xbUOlqiqKBTz5pNHAHEKOMo8wn0g0pejqiYvF3ulnp9mvtyiGu3O3piu8wOqyrimtrSZ76TL2wORFNmhh4F6sgXVfyQo6GNCP4P1iPIgFl23NoHaJ1cIqxus0XaIGpxFWT/mZEn0scjefdqXfcWk8+3udn06N9w6xhkpK8XaPdpFElfXM1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAAp/79gr9jTiL9SmfRndnx1mM9WxsdljfgrYyBExvA=;
 b=MbcgrVtHDmEuZSabwWBU3DCxfERw4KntFdKJgebAp8doZNdB0IoSQ0hqzoOHv0KeJU7UMN/9SQpJ/7ues0sKXfVzjR5lotoSbowPooMtnbf1a9GFdEZjCT44JtBIv31YdEudGaDRJyA2cdbSMMA7N6cIMjd2+dqO6//txaFQXH+FIALvH3bB05LQ0HGNyUV6QgvIQABDBv7xBBvxJSySRgQhuibd06JGU6E7cMS3PWODITOlBP1DqCHkset4q+KReSo4dsVa7mTPNyajgWC1A5qUPfYCAUJEngoWLXpb/eZR2/suzkIXjvDYAIlt3E+vFvIBv1UFWO8rahQ7uYsoJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <449e1832-83f8-a8c6-6137-7d161ac60fe4@suse.com>
Date: Tue, 18 Jul 2023 16:40:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] ns16550: add support for polling mode when device tree
 is used
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <ce821c1c81ba69397047daae0b0e6d44893ec28d.1689689630.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ce821c1c81ba69397047daae0b0e6d44893ec28d.1689689630.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9579:EE_
X-MS-Office365-Filtering-Correlation-Id: e6769761-56d6-4b0b-5e7d-08db879cf916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R9k/AU3qQiIfbxHhYCGaNY8afwvsek4mbQWu6iCAkuLzYMIMJ8UYuheEVzYOhj4MrfB9P8KyzQQOAQw1vHKLtrU5l/Vl5aRx+mFsYLUaKDEP9M3J1UZ8ksBLok9sWqKfwGjsdZGiTT/a0mt5QJGTNdQzwTg0jot1Jtz54mRNM+kxYqT2RCE1jqI+52ZZ8dhaZYutOCWzNdeP86erLMhK75ILbt/QfIoL/Bbt0d1XO+/CnVOGKIKUu8oEAwc9Jc1ac5zpg1XXx6wu4Vm/L7t4Z9Y0jxTNkptArkqBnaEu64/xv38Y8VBaNwnhHW5YCsqbLwUkA18HXj0RYlIsHFFCWwA3c8pP+qBAvP9bkL+gZnz7aSsBYzPlVhgLta5XUeJtL0dppkHFxNyRRDtpDmc0HxtjqVS2Ue2Cgg9K8ahl1/rTLHzkyEC5CEIwA2MQu/qTLAyS05RyyBJZUKi/DcnxtowInLDYVV6G+t4+KiSeW83/kIRFXYNFvhohszRlqvSz4laNH/IFSWYYbuCfTR4b1n0unVElDbw3FG12sHNFHI+ipccC28LpAbmFu3jQTCVMixLzHHMlyftLdefaspZPVPXoME8cB8nu7Dqu+Ybd3XN+myMefYJN6HaZgQgFkEn8AsLQdzc2vFkTsLS9p2kOUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(86362001)(2906002)(31696002)(8676002)(83380400001)(4326008)(8936002)(6916009)(316002)(41300700001)(2616005)(5660300002)(54906003)(66946007)(66556008)(66476007)(38100700002)(36756003)(31686004)(186003)(26005)(6506007)(66899021)(6512007)(53546011)(478600001)(6666004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWsvSkpXUzBDaU0reUJLVEFpZGNUTlNRdUFtMGRGSThPSUpGcDI0dlFuTkli?=
 =?utf-8?B?Ukh2TkFrV2ZmblZnbWNubG1TVzl2N3lGV2Y2NytxaDBmSVdBUHlwV0pmWUxR?=
 =?utf-8?B?T2xtZ1VmMEhESkFTM3JwbE5NVDR1UkpaYWNCdk41TjROM2dYUGlVdi9DaEFi?=
 =?utf-8?B?VEFuV3o3aHl1OFB2NXlQdE5Bbk1vZTU4c3dFbS9zblVFbEpWVTllUlBjTEtx?=
 =?utf-8?B?d3Yyd0JlTlFwL0tXOWZtbkJ4bCtWaFhDYjVOUkNoUVRoR0p3WkdFYzNoWU1O?=
 =?utf-8?B?Mk94VUMzUlZOL2FiOHlQclMzTi9MOG84aHZLQ0l6NTRsNFp3NFBaL1Q1Z3Fl?=
 =?utf-8?B?UU1SNEJxRzF4R3lnMmNPNElTRUZ3QWtMZGFMQitVVXpDZjIwRHpYWlZ2bCtn?=
 =?utf-8?B?L0lJb3RIeG1UVko5aG5rczlHS0dkdWwxbks0dHV4dmxXbzlOMU9na2J4VWpu?=
 =?utf-8?B?cTdKMXBRSXhjUStIVzJPNFMwcm51YlJXNW85Mk56L25odFYxRDJNQTRGTGZ2?=
 =?utf-8?B?dWhUVnpxTVkzdXRyRVVOcGFxeGhiQXYxeTlLWHRnNXQyTDgzelQwYkhPSlNF?=
 =?utf-8?B?dmhFVENQV2FGT0xEcTRHQnZhRW9vRFFDajRKTGpLaE04MzlQS0lFMjNMdHpn?=
 =?utf-8?B?dzVWY1U5eGdWQ3Y3QWJta0JEaVY4V2p0T0xKWkx6R1JheHhGQUY1Q2RTNzRD?=
 =?utf-8?B?WGk3NHQ2ZFRUSHVpeUVDTlBDRVQrRFhiQm42bmJ2Qmd0N1h1UUVGczJVZDBa?=
 =?utf-8?B?TWZMemFYdGdSOTl1OVpiNkxtTml5dklxN0pnNTRqdnRvQ1k5RDdCWVZPK21Y?=
 =?utf-8?B?K1NhTnUxYzAraUdZLytSdmZ1Q1lKQUhkcVR1RGl4Wm9pYTNnT2x4TTB6dEpL?=
 =?utf-8?B?YTJ3a3BYNG5CaTFBWk5FNDY0d3ZGNXF6VVdUTVBYYzNaNGRHcklSdGRUeVJ4?=
 =?utf-8?B?L3lZUkF2QWhQbFE0ZmNaWVRDN1lxRTNlQ0laWGRtWms5QUU5aldwOTZVV3or?=
 =?utf-8?B?QWpuUE95Rzh1NXlKZ3RjYktkM3YvaGw5V0svY1BwK09JOWdlOXowVHd4eWpi?=
 =?utf-8?B?RHZtNDg5UElLWUJiYVRVUnZndk91NW90V3d1aG83ODJhUTkxQ0RTZWJmVTk5?=
 =?utf-8?B?L2VNMGNrTkxhOHdEWTNCenRSZk5wQXN6eENndGtLOTNqKzZGU2NrTFpKaUhV?=
 =?utf-8?B?SW1zQklmTjhqdkFkVkIvWFJUdGNlNkk5empDL2xIWmlHODVpWWc0NmF0RE9W?=
 =?utf-8?B?L2pVcld4dkkzcFRJRnFCdjNsaWppbWU4WHVlcFMyVFNWQ1M4TkRBUnJ6OWk0?=
 =?utf-8?B?YWx6cWhTbFFuemkveDZTbkNIR2ZHclc1WmdYTmJ2R2V6UG1NYzdieUIyOE9l?=
 =?utf-8?B?cGFiaDRCYUNiNkJqNERnaDhHdXh4YW9YNnVHNW0rM1FLY05GWUM1Y0QxTTJz?=
 =?utf-8?B?WjdUczgwNEFST1BzR09hL0V1aUhDcHkyT2tGTWNSakh5dXI1eDlJR3Y5NW1z?=
 =?utf-8?B?K1BIT3dwckVnb3VDVVU4UnZjTVc3UDRkQ0tBQ1NSbUhJK3Q5NTl5eVFPQ2lW?=
 =?utf-8?B?ajF6NEF4d1ozNUt6WjJRN05SdWhUQzk5ekNVb3JrRTQyZnA3RnJZWXQ2b1p4?=
 =?utf-8?B?M09BWWkxLzFCYkFva1JoWEZJRXNOcisvMjdIaHM5cTJyVnBic1ZaRW85VXhK?=
 =?utf-8?B?aUF3UVVWaWV3M1UwNFExYXdFZkxweGZvbXduMVZMZlNiTlNHc3RaSTVackFu?=
 =?utf-8?B?eklIRVlaSHlsZkE4Tzg3ZFVOQ1NUYll3akhydTFtVnJoRmJsbjgzdTN6R0pj?=
 =?utf-8?B?S3E1R21SbXNuZCtlYm9RRCttNk84TEhPV3lTd1ZVL2VYTlB0Z3M2QWNjZ1Vp?=
 =?utf-8?B?Tm8wTEg3cXRCTk9qcjNwcVY1bFRzVVVzZWN3eWJoVHlaWnFTTzEzd2RwbHh1?=
 =?utf-8?B?WnlOWW5OM21XQzFWV2NiVFR6L3lzbTVHdXVKYzZ4cDdNOThoNnNVMHpZRGhM?=
 =?utf-8?B?Szd1VWUzdFZGTk9pWmcyOU5oRERoUjBsQmpoWTNEcHI1cHNYTThUZmJlOFlj?=
 =?utf-8?B?b1lzZ1N4ZFNPMnRzZCt5dytZSjhnSlZrK2FjVFc5NGpzSFY2ZjN5bmk3aTdj?=
 =?utf-8?Q?AXqR5L+WjzaifowvMI7H7MdMa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6769761-56d6-4b0b-5e7d-08db879cf916
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 14:40:46.7769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCkPRPZaGDI8a6STR24CoIWluQl1TcOO+wTffDYvRsiUU4eT8BHqpv50Qs84OYjKRo69qey7uAzDLwEwe/F3+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9579

On 18.07.2023 16:13, Oleksii Kurochko wrote:
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -40,6 +40,8 @@
>  #include <asm/fixmap.h>
>  #endif
>  
> +#define NO_IRQ_POLL 0

Do you really need this? I ask because ...

> @@ -595,7 +603,9 @@ static void __init cf_check ns16550_endboot(struct serial_port *port)
>  static int __init cf_check ns16550_irq(struct serial_port *port)
>  {
>      struct ns16550 *uart = port->uart;
> -    return ((uart->irq > 0) ? uart->irq : -1);
> +
> +    return (((uart->intr_works != polling) && (uart->irq >= 0)) ?

... you now use >= here, which includes that special value. As long
as intr_works is always set to "polling", the particular value in
uart->irq shouldn't matter (and hence you wouldn't need to store
anywhere that or any other special value).

> @@ -1330,9 +1340,12 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>                   * as special only for X86.
>                   */
>                  if ( uart->irq == 0xff )
> -                    uart->irq = 0;
> +                {
> +                    uart->irq = NO_IRQ_POLL;
> +                    uart->intr_works = polling;
> +                }
>  #endif
> -                if ( !uart->irq )
> +                if ( uart->intr_works == polling )

Careful here - we may also have read 0 from PCI_INTERRUPT_LINE, or
forced 0 because we read 0 from PCI_INTERRUPT_PIN. All these cases,
unless provably broken, need to continue to function as they were.

Further you alter parse_positional(), but you leave alone
parse_namevalue_pairs(). I think you're changing the admin (command
line) interface that way, because so far "irq=0" was the way to
request polling. While it may be unavoidable to change that interface
(which will then need noting in ./CHANGELOG.md), you still need to
offer a way to forcibly set polling mode.

Jan

