Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EF957202B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 18:01:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365821.596157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBIK2-0006iU-F3; Tue, 12 Jul 2022 16:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365821.596157; Tue, 12 Jul 2022 16:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBIK2-0006gO-Bj; Tue, 12 Jul 2022 16:01:14 +0000
Received: by outflank-mailman (input) for mailman id 365821;
 Tue, 12 Jul 2022 16:01:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBIK1-0006gD-6R
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 16:01:13 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150044.outbound.protection.outlook.com [40.107.15.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d94973d6-01fb-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 18:01:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5307.eurprd04.prod.outlook.com (2603:10a6:10:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 12 Jul
 2022 15:59:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 15:59:53 +0000
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
X-Inumbo-ID: d94973d6-01fb-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnS64xHVpTAul5sAVwjCsNnt5lDjlPdW+mV/UNMc+YRG0pjVe9SwQHZAYH4XQrref5jVJGxkNmvW26SxTSct+4yq4WjC1A+hRzHGC7RU3TiuP0CgAD0yl8xaiKrf6eaBD5ov+Hz+9tENSsxZIItJblT1Sw/vx9sYrx/7Z753o60zqOfFpbrLMxzisamnMuVELBfXNdkEnP5JFSj7XaHzcQdmsQJBXEkqa4QLAi54V1I68UA+7KqNOx9b4mFBqYNUoN8O55dPGiFiEXGyLJl90eUk5gsyL55JZ3AXNc2QFKBcPGtBTJdglv+RP+gVyGvLyivlgsu9P4knAUdWH0yWYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wj8tH/MkcC//oMymMAko5DXtK5jIHlMBTrH3qemSKE=;
 b=A7deI0cbAvN/tUrEsM4uM8uL/5xMYzMiCNsi/8uKeJKZ+JIPfvj9YpXsIkb7rbj18qZsUSSTg/WISMjEeJalAtXEqzrgPbw9w3iEuCzu07vcseuSN5vOLpN8dUL8P/ZgIEjaBVzoSMOQ0eUH98He8BOl9558XIa19NiFOaQTxLVVHLcp9xNV2zFj3IbsoH6/x8EApUS2hy2VWgdi903g5RVYKIo/RAosnaQlw6e2QlLKkxc35jrKZXuHWPHgJKsNBB/NPQBBAZ8HcR/lrXBO21Uusjz9iCwvD0iHIyC9InAu2GQm9s2VkvD59CTolzAA3oX2kH+oQvqWBqqLMlSAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wj8tH/MkcC//oMymMAko5DXtK5jIHlMBTrH3qemSKE=;
 b=JNNl95/VQCHzPiPNQdlnE6FZCA7pjlkwpdxcDK5s3+tGJhIMgOd3Spi3AYtpjwimlIenKqV1Hs+hkrHMinPt/a3We01lFmpFw2h+/lG7iubZUX8cD6VCgWbtYQHl/GCAzGVzbUQH+20SEq6KX758V7ih2LJ6Ugi3Gj56eRAT2VAE5xbO7XqO67dIxPL7eXaVnrJSTKu3RXpQXLNbvDxwRebJXB24sPJeBioBYnEymTswwL7C8Y9CEftoULe6Ro3YZoSOpe5qev0J7fCGR2PsapOHc1GsZREreLP7frUQn0qWdJkxOI36u6KmeLKI1sWgoN0QahjT0XfXODUugzsNyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a283b4d-8d1a-52cf-d863-350e2ff39566@suse.com>
Date: Tue, 12 Jul 2022 17:59:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/9] drivers/char: Add support for Xue USB3 debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Connor Davis <davisc@ainfosec.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b0ececa-9569-49ab-5884-08da641f8f38
X-MS-TrafficTypeDiagnostic: DB7PR04MB5307:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3XundPErXqffta4YEKGXRAbQgPj8i3mgQtMFU3w+YQ4RaeeOuNCyrCVtLnv9LM6rnGLCmDChgnBhawsj7UpM+cKt0hUUCb10Oav/ibEY2nzQ08l+AyyUbw5ao6o79yZvhbGUHhhs8jdThjZUPXzvZeVhU6pMPP3ruQfeZ3j7bQX1onJxcjZoyXcFUDNU4MK1IbHKQoWIGQNdMVykkbSNOzq3K43QIrfoe2mn8Nxd2FNuo7onoGYY39w1qzmB1+H6CaeIbSEy73n9fqkAVlx+GENwTQKa9z6g/bCHBE6O/hwWAqUCok22kL1CdbTWqrKmE1yk7UyBgkOFPf1YgDtvYkNuaXYcUNt1Rb+wpQB+d7j3riCoCN0m4wN4csLYY5lHnNe8tIoh6qXif0TAzRCUBaZr2WEf4uHlK5m7zRHR2U7ukxricopVsm+F3A48sLgYq5/8iiGueMKIyfXQQhNFaBNh5ZuoMNGnk+jhL66EsNy4sfZjVtYXDRKLVPeaT7Bjib+K5FNRfIYIH4y5YRN7bxHcmvLVi+ik/fjNC7pGqXc0gxZYHMQvuJkGnb+R7enq9gwuBEKMKf/JP6r6Eqt9J5XSri/+gYOzRhuboFJvDCQDm0ciSt2piG2NliIjU0FFNjsXvvA8jk5HdKzvX53lBzGdXqeIdDylwoI9YdH8rAdKgoq11Mx0D5JUuxAlqfLBziCXKnGv80umtoz/EOtgUP360sYPHsJJYrCJuc27bMwd5+w/0CmdhOZZLGtXsJPc+qNqg6YJF+piPterqFKRBv1uMc9EPfLAWzF9CQZBpvdqWUvr3072Pffdk+DeuLDR2SuP/FOQnR0mskRpMh9zZazoSSWtwUrzqEfL4VpTcQx2dRZzTu6BsvBQW6pfITPcu1KiyTtakNd+4t4vmaYpOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(376002)(366004)(39860400002)(83380400001)(316002)(41300700001)(2616005)(2906002)(186003)(31686004)(8676002)(66574015)(8936002)(6506007)(66946007)(26005)(53546011)(66556008)(66476007)(6486002)(36756003)(38100700002)(5660300002)(86362001)(54906003)(6512007)(31696002)(6916009)(478600001)(4326008)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkVLWllFWXhZS0hFOTN1L2gzMGk5UTJJN1RtdnkzUGQ0cGlnMEV5K3lLbHdi?=
 =?utf-8?B?R2RFN3RIL2lOTWdDZm5VSnFWZVNHamdWT3VuLzVwZVI1aDFHekp2MzJGUi9Q?=
 =?utf-8?B?bU14VzF5Q2JyMXpGcVlBcUR3UDVmVWhVcUhZL1l1TFBSVDcxQzRPNWNUMmxa?=
 =?utf-8?B?Yms5ZThKbE54emcyWjBtSGxnZVJhT0d3VzM4cjNPRzVERVRCbHY4Y0JkclQ0?=
 =?utf-8?B?dTRMdzVkK3RXQ0JOb2dITFhrSlZ3NjJnQUpZbTJRUzJRejk3bkd1djRPYWFZ?=
 =?utf-8?B?Sk9DOEMvaWt0aFhXTysvbWdLNUpzbmY0cjZ3RVdDN0xudzBZSHRUdkVpY2V0?=
 =?utf-8?B?NzBPeU9RZWtiYk5VNXIwV0JxM2JKNWlzd3dVNVJoWm5IWFZIOUtBckFXQ1R5?=
 =?utf-8?B?Um55Z2NrR2FaVXM0K2RwWmVMc1owUjJzNTVjVW5qTDZXeG50cWpjNmhscDNU?=
 =?utf-8?B?U0IyR2RhclhwUlpQenVNWnRCMkpIUEpHOVU1YmxXRVE3dnVBdm1HUm51dStR?=
 =?utf-8?B?RzM1YUFteEIvZ0VMRXkza3ZWdkRCcVJISzQyY1hKNnZQSVhCdStabVg3V3RF?=
 =?utf-8?B?M2V1VGE1Q0R0SGJoVmFsczh3Y0lVUW1HR0ZlWTdOYW5iczQyZnhyR3prNnVO?=
 =?utf-8?B?Y2Z0ZVNsbTA2WTBJUVljWFcvSGZQYytraVRmN0hrelRWb0JUTWRNUGxYY00w?=
 =?utf-8?B?bVpaV2Y0WmhpbW81L3Z3UThlTm9iTDdUb3QwRTc4M1F1elJac1NGdjdGUHF0?=
 =?utf-8?B?RmxsMEtwYWFMaEZyVS9uanJnV2I1Y2NWNUtjMHh2d0xJSCsrWHRldWowVnJF?=
 =?utf-8?B?eGkyU1d3MHhsbDdZZVN5Y3hWY3VkSU1GUTJ4Z01IaW1EWW0vL2tJQ3NtVGdr?=
 =?utf-8?B?UDhlT3ZxZUYwL1J3Q3ZXdlJBTjRkNkRJNktLalJ2RGZFZDEvbTBsWHNYZUJU?=
 =?utf-8?B?eUx3ZTNJSUU5RGR2V1hzQnBCNG9iVkRaUlJ3NW53bG5ZWlkrK3o3M1ZiT0tF?=
 =?utf-8?B?RTNtTXJlUUhwYzZ6bGNWWGk2ODJCN3dGMHlteHlvYXplTFdJWTJPVldSZ2Ev?=
 =?utf-8?B?NERLMUhSNTlQb0NBR3MyOWdjdjkxemxsMEZrRnZtTnRkMlVGSlczckNaOVhr?=
 =?utf-8?B?bHNoWkd2aXAxblFsRnJ2VTNrL3czVTRXMGhPSnorOFFVWk1RVFNRQlNtNUJZ?=
 =?utf-8?B?OU1kZXk3ZDRVWlRabVlHK2x1MFVSeGdxZThLV01ZcFVFRWhXZlMyVmNrc005?=
 =?utf-8?B?b1AxNDl0WXl4YjgzUWc2bFhFV3EwdDZEN0dkK0x2dVNqb3Q1ODZDRXZiekhM?=
 =?utf-8?B?dFlETXk2aUVxUG1oWVMrWWdZaWpRS05vMUJzWDJGeVlFWW1pU2dISWtCNGxX?=
 =?utf-8?B?ZXA0U0lUSUh2UWdER0lONmtJV282ZlJ3Y0VwU0U5NXpNVTZXZHBiaDFMeDRB?=
 =?utf-8?B?V1B1dnZ5WDJrcjUrczNYdHAvbndRb2FDR2xVSG1LdFpDNnJLaVpWL2hOMng3?=
 =?utf-8?B?R1lkLzBOd3ppbTZxaFEzTlFxOHZOaVNvS3phcTJGYmdyb1lpNVllbzNNdzBK?=
 =?utf-8?B?aWYxZ2ZScHR6bzZlZzZFdEc1cUFEdUZFSWIrSWhPdUVQb1EyZU1aU0h1QmNG?=
 =?utf-8?B?aW5VMTB4aWhtb2NucldpN0R6LzhWV1o4cEoxSlFFMXl4WjRsMnkwTmFCS1Zv?=
 =?utf-8?B?ZGkzR0RQTXIzTGNlL1NPQnhBTk9ZR3JlalVoMThRNVJ1R1p2Rmg1YUtHM2N4?=
 =?utf-8?B?WVY5azQvemdGd1F5TTMxY2pPVmxxWWN2K2NCTHFEUHdKN1JEQjZlK1pKb2ti?=
 =?utf-8?B?TVBKU3lyRmNYaU5iS3htK1hjTkFZN2txTC9xRTZqNjd2d05ERTQ4SEFzeEpZ?=
 =?utf-8?B?MU02TE5nWjZVeFNCNHVvWkNsMHBjN3RhK3NxQjJoTWltMlVnYklnS3dVYm1Y?=
 =?utf-8?B?d0hkb3F6ZVJRSmxNZ0xtcHNjeFhwNXBPWjAxMEgwWmRiTENrSEFZWTZPaks0?=
 =?utf-8?B?WmdBVmlEMnVBZWxVcjgyNStITkZmUVJDRXZCMkw3OGdwTlJzbjB5SUlmZTJw?=
 =?utf-8?B?Z1pmbi9udkN4UC9hdUlEcTdxODdmdDFxNzhlQ1h4ZnpFeDJpNjNwZzlKZ2Jj?=
 =?utf-8?Q?/9H+Cnu14S5S6JzFvJbkxfvhW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0ececa-9569-49ab-5884-08da641f8f38
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 15:59:53.7194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZePU9c2z2pzE/fu3eTh92kFzHcNpcD5tOF2Ke2Opp1/3ME+KY6cIW15B397YgOtPaG94uvbhg6VkWsbiQr6H+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5307

On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -721,10 +721,15 @@ Available alternatives, with their meaning, are:
>  
>  ### dbgp
>  > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
> +> `= xue`
>  
>  Specify the USB controller to use, either by instance number (when going
>  over the PCI busses sequentially) or by PCI device (must be on segment 0).
>  
> +Use `ehci` for EHCI debug port, use `xue` for XHCI debug capability.
> +Xue driver will wait indefinitely for the debug host to connect - make sure the
> +cable is connected.

Especially without it being clear what "xue" stands for, I wonder
whether "xhci" would be the better (more commonly known) token to
use here.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -946,6 +946,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>      ns16550.irq     = 3;
>      ns16550_init(1, &ns16550);
>      ehci_dbgp_init();
> +#ifdef CONFIG_HAS_XHCI
> +    xue_uart_init();
> +#endif

Can you make an empty inline stub to avoid the #ifdef here?

> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -74,3 +74,12 @@ config HAS_EHCI
>  	help
>  	  This selects the USB based EHCI debug port to be used as a UART. If
>  	  you have an x86 based system with USB, say Y.
> +
> +config HAS_XHCI
> +	bool "XHCI DbC UART driver"

I'm afraid I consider most of the other options here wrong in
starting with HAS_: Such named options should have no prompt, and
be exclusively engaged by "select". Hence I'd like to ask to drop
the HAS_ here.

> +	depends on X86
> +	help
> +	  This selects the USB based XHCI debug capability to be used as a UART.

s/used/usable/?

> --- /dev/null
> +++ b/xen/drivers/char/xue.c
> @@ -0,0 +1,933 @@
> +/*
> + * drivers/char/xue.c
> + *
> + * Xen port for the xue debugger
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
> + * Copyright (c) 2019 Assured Information Security.
> + */
> +
> +#include <xen/delay.h>
> +#include <xen/types.h>
> +#include <asm/string.h>
> +#include <asm/system.h>
> +#include <xen/serial.h>
> +#include <xen/timer.h>
> +#include <xen/param.h>
> +#include <asm/fixmap.h>
> +#include <asm/io.h>
> +#include <xen/mm.h>

Please sort xen/ before asm/ and alphabetically within each group.

> +/* uncomment to have xue_uart_dump() debug function */
> +/* #define XUE_DEBUG 1 */
> +
> +#define XUE_POLL_INTERVAL 100 /* us */
> +
> +#define XUE_PAGE_SIZE 4096ULL

I think I had asked before - why this odd suffix?

> +static void xue_sys_pause(void)
> +{
> +    asm volatile("pause" ::: "memory");
> +}

I wonder whether the open-coded inline assembly is really needed
here: Can't you use cpu_relax()? If not, style nit: Several blanks
missing.

> +static bool __init xue_init_xhc(struct xue *xue)
> +{
> +    uint32_t bar0;
> +    uint64_t bar1;
> +    uint64_t devfn;
> +
> +    /*
> +     * Search PCI bus 0 for the xHC. All the host controllers supported so far
> +     * are part of the chipset and are on bus 0.
> +     */
> +    for ( devfn = 0; devfn < 256; devfn++ )
> +    {
> +        pci_sbdf_t sbdf = PCI_SBDF(0, 0, devfn);
> +        uint32_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
> +
> +        if ( hdr == 0 || hdr == 0x80 )
> +        {
> +            if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) == XUE_XHC_CLASSC )
> +            {
> +                xue->sbdf = sbdf;
> +                break;
> +            }
> +        }
> +    }
> +
> +    if ( !xue->sbdf.sbdf )
> +    {
> +        xue_error("Compatible xHC not found on bus 0\n");
> +        return false;
> +    }
> +
> +    /* ...we found it, so parse the BAR and map the registers */
> +    bar0 = pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_0);
> +    bar1 = pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_1);
> +
> +    /* IO BARs not allowed; BAR must be 64-bit */
> +    if ( (bar0 & PCI_BASE_ADDRESS_SPACE) != PCI_BASE_ADDRESS_SPACE_MEMORY ||
> +         (bar0 & PCI_BASE_ADDRESS_MEM_TYPE_MASK) != PCI_BASE_ADDRESS_MEM_TYPE_64 )
> +        return false;
> +
> +    pci_conf_write32(xue->sbdf, PCI_BASE_ADDRESS_0, 0xFFFFFFFF);
> +    xue->xhc_mmio_size = ~(pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_0) & 0xFFFFFFF0) + 1;
> +    pci_conf_write32(xue->sbdf, PCI_BASE_ADDRESS_0, bar0);

Why is a 64-bit BAR required when you size only the low 32 bits?
Also you need to disable memory decoding around this (and
somewhere you also need to explicitly enable it, assuming here
you would afterwards restore the original value of the command
register). Further you're still open-coding
PCI_BASE_ADDRESS_MEM_MASK here.

> +/**
> + * The first register of the debug capability is found by traversing the
> + * host controller's capability list (xcap) until a capability
> + * with ID = 0xA is found. The xHCI capability list begins at address
> + * mmio + (HCCPARAMS1[31:16] << 2)
> + */
> +static struct xue_dbc_reg *xue_find_dbc(struct xue *xue)
> +{
> +    uint32_t *xcap;
> +    uint32_t next;
> +    uint32_t id;
> +    uint8_t *mmio = (uint8_t *)xue->xhc_mmio;
> +    uint32_t *hccp1 = (uint32_t *)(mmio + 0x10);
> +    const uint32_t DBC_ID = 0xA;
> +
> +    /**
> +     * Paranoid check against a zero value. The spec mandates that
> +     * at least one "supported protocol" capability must be implemented,
> +     * so this should always be false.
> +     */
> +    if ( (*hccp1 & 0xFFFF0000) == 0 )
> +        return NULL;
> +
> +    xcap = (uint32_t *)(mmio + (((*hccp1 & 0xFFFF0000) >> 16) << 2));

Why not either

    xcap = (uint32_t *)(mmio + ((*hccp1 >> 16) << 2));

or

    xcap = (uint32_t *)(mmio + ((*hccp1 & 0xFFFF0000) >> 14));

?

> +    next = (*xcap & 0xFF00) >> 8;
> +    id = *xcap & 0xFF;
> +
> +    /**
> +     * Table 7-1 states that 'next' is relative to
> +     * the current value of xcap and is a dword offset.
> +     */
> +    while ( id != DBC_ID && next ) {

Nit: Brace placement.

> +        xcap += next;
> +        id = *xcap & 0xFF;
> +        next = (*xcap & 0xFF00) >> 8;
> +    }

Is this loop guaranteed to terminate? See drivers/pci/pci.c where
circular chains are being dealt with in a similar situation.

> +/* Initialize the DbC info with USB string descriptor addresses */
> +static void xue_init_strings(struct xue *xue, uint32_t *info)
> +{
> +    uint64_t *sda;
> +
> +    /* clang-format off */

What's this?

> +    const char strings[] = {

static?

> +        6,  3, 9, 0, 4, 0,
> +        8,  3, 'A', 0, 'I', 0, 'S', 0,
> +        30, 3, 'X', 0, 'u', 0, 'e', 0, ' ', 0,
> +               'D', 0, 'b', 0, 'C', 0, ' ', 0,
> +               'D', 0, 'e', 0, 'v', 0, 'i', 0, 'c', 0, 'e', 0,
> +        4, 3, '0', 0
> +    };
> +    /* clang-format on */
> +
> +    memcpy(xue->dbc_str, strings, sizeof(strings));

Can't you simply assign to xue->dbc_str? I don't see this being used
elsewhere, so it might even be possible to omit the field altogether
(and with it the str_buf static variable consuming an entire page).

> +    sda = (uint64_t *)&info[0];
> +    sda[0] = virt_to_maddr(xue->dbc_str);
> +    sda[1] = sda[0] + 6;
> +    sda[2] = sda[0] + 6 + 8;
> +    sda[3] = sda[0] + 6 + 8 + 30;
> +    info[8] = (4 << 24) | (30 << 16) | (8 << 8) | 6;

Wow, magic numbers. And, apparently, some used several times.

Jan

