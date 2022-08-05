Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E8A58A7E4
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 10:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380876.615293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJsV7-0003Fe-Uk; Fri, 05 Aug 2022 08:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380876.615293; Fri, 05 Aug 2022 08:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJsV7-0003CR-Rk; Fri, 05 Aug 2022 08:16:09 +0000
Received: by outflank-mailman (input) for mailman id 380876;
 Fri, 05 Aug 2022 08:16:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJsV6-0003CL-9G
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 08:16:08 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50052.outbound.protection.outlook.com [40.107.5.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d901b5ca-1496-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 10:16:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4281.eurprd04.prod.outlook.com (2603:10a6:5:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 08:16:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 08:16:01 +0000
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
X-Inumbo-ID: d901b5ca-1496-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqXUlpzuW38bCMafRGP0CE/EdFK8THcAJED7CPKe2oQQN3t9fVYhOzVCqbmCHKxUH5R5pTKgZ7RUc2NqIhwKgiKJ6AmwDdtnLgoYWtgjSrcnHIo4r9KO5goJ7e/4KSW3+2YaMHg66MIrV7cQ1WY/kRC3tmarWd7sOYh8IeAqnSeBo+G6qj9kqUGsaxy74A3WTdhOTB/+Ym5p9o/lFKvZyfvA5jddnQB3bBFOrqgWe6w48hjfJbVwtCWXj6ZHNThicOE+WJ3wC2Gt+Bw6H49cuOtoFF4c4eFxk2/PHEbvI3YIA+JVrWQArfgGao+jDIeGolY35KnCMW5ONzpLrZbwiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0sW4IdyWJFf38TTKrr/BTD50HxnU/Fwmd6ojQ+nOnM=;
 b=Da7AcX6jd3BB2XLFFZrh6TVd8pUWOmKDw45lCa5f8//nhd+WeViHt8wz6R8JiU8YLsJ/YQYYAAZlwyrJLn6bWxXqjW4akbK8bLYFWKPc/bEsPbYE8LW+HTtXdj9m6wlpjNOVF0j6f+3+ewLefXA/UQ57BVm9HGME6qElxWi4vdG14i1lozLFuU6wJwwfBxBU/e0FPKDwEfHjK6B7lvFCBcrbcbXN80wliTM7At9wOw58JzVbj4Crn4s0Ze1vwm0eNNhRU5KZWKNDs54SkpUqELOWD6PpAxSrB7ufjMr2PDGskXrJa/XDqOklbdn7qNFi37+02vU0TuRy/cdfdoP7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0sW4IdyWJFf38TTKrr/BTD50HxnU/Fwmd6ojQ+nOnM=;
 b=qJ4A4b810qT9lVDpwUd6XaS6cECcMS1CNHgqYYARbrfCkiJmt7ATlOIa6O4IzFwmcxJbLzFBVnEBoYvgws6RiSqBTDxQm/Ud4mWAtrIU8corqWvyBp4qkrPzIf5tR1fs2osgIQQx1ljPraPIVZKJ2grBUgtH7cVO0/Td9O0dWNDTn6+cB6YOqw5Kt1MsB16W6vl9+0uxCI8b3TF5mg80lcM2OnYwTnDB7Jyl3Sl7y8GA/6XWZ2PwXdSjkHKbx+mkeXwG+ZMMFcFJYDimaY4nRr4Q27T5fjBZNZM/3OC0KW8qL/0rMqDlZ2bAGPBOkMOKu3fw2Oa1snmNYXUJI4h02w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e98ca967-8ae5-3aad-6449-c3689e88bbe8@suse.com>
Date: Fri, 5 Aug 2022 10:15:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 09/10] drivers/char: allow driving the rest of XHCI by
 a domain while Xen uses DbC
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <dcbe3f53bd6d88fbf2a20970d4fdfe93479a5f59.1658804819.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dcbe3f53bd6d88fbf2a20970d4fdfe93479a5f59.1658804819.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0115.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 297f82d3-e336-49a4-128f-08da76babbc8
X-MS-TrafficTypeDiagnostic: DB7PR04MB4281:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s7ogNGIkxKH1c6GoWXtTjIpNDlR2btH/pDuD//JwCf+l9lscbBB9j2v5u/8VldRQhrd8/1LzUpMrs03xTzbhq6LcqhKPP/ao1aZcvFci43Ga8iIMusHSNq9t+w+HaN3fXb4ITi6JvOzhy/NW8VE60ngGMEPOSLBc+fwMQiBLANwm6RExA5bPG+Gjh2qWTG7iqsZ9XSkkySI4Ta4JdcKEHa/9wEuudORi5UeQyH0qtdroPokDELxMO9+XA/7WJa/XPtS0R/heRES/dvtSFmmp7qo7/WTSgNeU4PExekER4DJqI0HgQKFhTNz8nhq16Yhd1eJ+xYKdlWmWkZWEJUeKOjsYe5zrtdUJkmLt4+5Psd8FgSAARP3fvhYNM6f1uBJ5fbskUeiQg3Qq8tmvJRzzoH9TNb0wdPXGWupMKBewSrNm6yRleZkE7BtarwuSAlPEHbCxlTZliHu9u+DNccFGqqPK1D/4yfhn2BLr2/szElRtFXklpk/oqnyiURTps/hfu8x6i9kI+40KfaQfBmNaqSiV24NxUaOAUVHWHlq0MCwdJUzp1Troil0tf9SRFw5Fmjvqh2qnLVymruHHs5gHKIdHcQDx6iBZfJ1Wb9SbCsvrCmOlXdsi5R5c3gKhmtoP8UsbE87YCpmy7ym3SsW+AZIdmNvnUJ2eNh0naphN5YsXTGu1/Y5A4zm/gmaP8dcFHhIYNTvRpsi0+q6k2DY0ELb3fB8UQvXvUkMVXPIkoZ0H7cqQHqriRz2KCYiw7qktOLve0956g1CjwMTjPIFJHR5aGiZpWJ+hQeAcJV6kmHLLO4yx6nAs1ljRQ7pEue9/VB2gjcJ2DEYXnx80gVJ/3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(376002)(396003)(366004)(346002)(41300700001)(6512007)(31696002)(26005)(86362001)(6506007)(53546011)(38100700002)(83380400001)(66574015)(2616005)(186003)(31686004)(8936002)(5660300002)(66946007)(66556008)(66476007)(8676002)(4326008)(36756003)(2906002)(54906003)(6916009)(478600001)(6486002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFpIV3ByZFFmOTFFTWxEOVVSZDNEOFlvQjZkOFk4UlJEQkd1MmpIRDU3dXA4?=
 =?utf-8?B?UlloY3V3NXFuUUViWncyWXpaQjltRFdlZ0l1RWNPa2tIblZXMWVxbHpwNEhB?=
 =?utf-8?B?MHRhY2ZOTkFLcXkyRzFEc0MwQ2lHSDZhZGl0Mis2NEZjenFWVUFRTFVrRGZt?=
 =?utf-8?B?SGpTdFlWVWtCeENrTWlOYUVXNWlTS3BsSkhVWVVONWV6ZmxqNTdZbnJpYU5o?=
 =?utf-8?B?OU91WUtZUEcwc0tpajc3eTMrUzc5N1dmMnJDUWVJbnhmU0dxenBJNEtNSGY0?=
 =?utf-8?B?K2NyM1RyS21hSjRxb3RTR0FhUmxRS0VaR1gyWU0rakpIaVJla1lCaGFnakgv?=
 =?utf-8?B?NEg3emd1UzZOZGo2U2RnYXk4c0FaSmlJcFcwMjJqak04RWVKbURab2tGM1lx?=
 =?utf-8?B?V3NJT1VGVkVwVTMzTGN4K0QwR2JndkNlUWVJUnp4aGFsM0d0blk0VFZ0ekF4?=
 =?utf-8?B?VkZyODFLUEJ6L3NaTHpIOEdoSS9wZWltUmNSN2NYSmsyeit3aGRTdVpBT2Ju?=
 =?utf-8?B?dVlDK2pHc3QxLy9BeGFWNStYMWpLVUdsVUYweFVCdGNaS0ZEcGZBMzgveStp?=
 =?utf-8?B?N0hRbVB5S3BBWmlKb2FHTVpHK0ZYLzAvMVErNGlDeTloVWVIYnAwZG5YTlpv?=
 =?utf-8?B?VDJQWUd4MEZaaUNIT25BYUN2MjJxdCtTaWNPWTFCMlBscmwyQTdJY2I4S2Vz?=
 =?utf-8?B?NUZzYUtkdWNteVR2dEZNMTdIWU1UMWlNTTZGSE4wMFBLZHBpNFpGMkNqTVVW?=
 =?utf-8?B?ZmhxQmkxNzgwM3BlR3JNTE5zaWZZSlNVeEhpM0lMMkRPa2tBaWk4OXc5VzZz?=
 =?utf-8?B?TGNodHFRRTFUMzN3Ti9ldmhqaVZFckR6QUR2bFUxeEZPakdic1ZLQ0RMclpt?=
 =?utf-8?B?bkNUS0VtM2QrQ1FtNEp4MlJJY3VMM3czMFI1RGtQbGN0UTA0SW8xNFhXQkNN?=
 =?utf-8?B?VHJKdFNtYWlsMm5HYlFEczR3N21VRUQreThwM2RhejkzREpIcHJ3WjdUSmNZ?=
 =?utf-8?B?TmtaeGZObUYwaG9hT2J3SHRJRThmdUxRUjY0SjdhSzdnVHE1eVljSG96ekF1?=
 =?utf-8?B?MDFlV0l1QS9HMDZISEdYdzYySWZZamhSTkRZeDBHaW4wallLMlE2SDFTeFIy?=
 =?utf-8?B?WFZDV0tvMnpqdlh3ZDFicnA2dFNUVTR6MlF2Wjd2NTA2dzRSSyt2ckY2akN0?=
 =?utf-8?B?aGlvcVhwdEVoa3FjdjJiWWppYkZZOTRzckVVMEVRUmJqRmNISGc2c2Nldk5R?=
 =?utf-8?B?RlpYRGswbVZBNWUvNHk1YmZ5ems3YzZraVZJUmJWYzNtZnRNcVEwQUJrMSsy?=
 =?utf-8?B?cjJiVy9PL0l0cFQ5ZTFJQitSeUFaZ2pmSHdkOFlOelNWYWFrMnY4SkswbW01?=
 =?utf-8?B?T25CZlJ3VC9SWnk5b3BLaVIzV3BFdnpxVS96a0F1aGJKdWcwalA5Y0Q0ekVy?=
 =?utf-8?B?NGticG1sSlFObDN5bXdaaGZWNDA5djNtMzVRNW54NjFTZFdqeFhTWVl5SVFu?=
 =?utf-8?B?UzZlcU8yODlyU1oxR2RwVDlwd2pkMFMySy96RzdJTjVBOGtqUUZsM3RLbG55?=
 =?utf-8?B?d1RDSTVkOFRRNWdNZGp6MloyY3IrRHZqWVFxYTgrcmlpR1FDaFc2VDZkSmVw?=
 =?utf-8?B?bmJmTTFONUR3ZjRYajQ1cEhqbTJHSEt4TnRUZWRNTHB3Wm1LbXdkWjRWWmdM?=
 =?utf-8?B?WkRoRUVWckRKSUsxWWJIOEljYmIxVHdoR05GRlErOFR1YXFwMXhVUENVTDRh?=
 =?utf-8?B?SGhCTnhxd3M2eUtuRldmSmFKZjlqR2RuK3JoMzZRNzJtMjhJNTFUSm5CZkw2?=
 =?utf-8?B?YnVhb0lNeFlpZjNtYThjYWJPb0p2SFpEOTNWVXBDdThoZXdwWTJ1SjRtc3JZ?=
 =?utf-8?B?Y1h1S1VUQnN3dFcwbG1RZlNxdERSZ21kWUFvYmMvSWpZazAwcmNLb3EwVGVx?=
 =?utf-8?B?RkZ2SWlWWm0xZE1iNk9iL2lDN1VMeXRnWk1TYzdHc3NXVzNFbk1IdEFLN25U?=
 =?utf-8?B?VzhneDR2N3BMUWRWSWJ2SkRTc2RnSGRFWmIvSS83VHpVUVJNczluQjBTQVpI?=
 =?utf-8?B?V2pxc2RBVFJ6bDhpcFFTdTMxVGFHK3FBQ1BBTnVGemJBZGRaQVF6RnpNeDBx?=
 =?utf-8?Q?G3r6JqiMtDi6bmIvxTc9CPqdl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 297f82d3-e336-49a4-128f-08da76babbc8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 08:16:01.3729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZgTqaPHWgWnsAukb44Ys7nE6xUydhrNRN+1a4Pa8CFiIZYGLU5oSaR97/FdVaE3U7qdGw+FtZiMB1my/JxjQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4281

On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
> That's possible, because the capability was designed specifically to
> allow separate driver handle it, in parallel to unmodified xhci driver
> (separate set of registers, pretending the port is "disconnected" for
> the main xhci driver etc). It works with Linux dom0, although requires
> an awful hack - re-enabling bus mastering behind dom0's backs.

Which is one of the main reasons why I view DomU exposure as
going too far, despite recognizing the argument that this would only
be done if that DomU is fully trusted.

Furthermore - what's the effect of this? It would seem to me that
while bus mastering is off, the device will not function. What happens
to output occurring during that time window? Rather than needing to
re-enable bus mastering behind the owning domain's back, can't the
disabling of bus mastering be avoided in the driver there? As we can
see from the EHCI driver, there certainly can be communication
between Xen and Dom0 for functionality-impacting operations Dom0
might perform (there it's a device reset iirc).

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -724,7 +724,7 @@ Available alternatives, with their meaning, are:
>  
>  ### dbgp
>  > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
> -> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
> +> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ][,share=none|hwdom|any]`
>  
>  Specify the USB controller to use, either by instance number (when going
>  over the PCI busses sequentially) or by PCI device (must be on segment 0).
> @@ -732,6 +732,16 @@ over the PCI busses sequentially) or by PCI device (must be on segment 0).
>  Use `ehci` for EHCI debug port, use `xhci` for XHCI debug capability (output
>  only). XHCI driver will wait indefinitely for the debug host to connect - make
>  sure the cable is connected.
> +The `share` option for xhci controls who else can use the controller:
> +* `none`: use the controller exclusively for console, even hardware domain
> +  (dom0) cannot use it; this is the default
> +* `hwdom`: hardware domain may use the controller too, ports not used for debug
> +  console will be available for normal devices
> +* `any`: the controller can be assigned to any domain; it is not safe to assign
> +  the controller to untrusted domain

I'm sorry, upon looking here more closely, can we use proper boolean
here as we do elsewhere, i.e. share=no|yes|hwdom (or more generically
expressed share=<boolean>|hwdom)?

I also think 'hwdom' should be the default, like we do for EHCI (with,
at present, not even a way to override).

> +Choosing `share=hwdom` or `share=any` allows a domain to reset the controller,
> +which may cause small portion of the console output to be lost.

As said above - this ought to be avoidable if the period of time the
reset takes is bounded and if the controlling domain announces the
reset and its completion. See ehci-dbgp.c:dbgp_op().

In any event I'd like to ask that you add a statement to the effect of
"no security support when using 'any'".

> @@ -1005,10 +1050,32 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
>      init_timer(&uart->timer, dbc_uart_poll, port, 0);
>      set_timer(&uart->timer, NOW() + MILLISECS(1));
>  
> -    if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
> -        printk(XENLOG_WARNING
> -               "Failed to mark read-only %pp used for XHCI console\n",
> -               &uart->dbc.sbdf);
> +    switch ( uart->dbc.share )
> +    {
> +    case XHCI_SHARE_NONE:
> +        if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
> +            printk(XENLOG_WARNING
> +                   "Failed to mark read-only %pp used for XHCI console\n",
> +                   &uart->dbc.sbdf);
> +        break;
> +    case XHCI_SHARE_HWDOM:
> +        if ( pci_hide_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
> +            printk(XENLOG_WARNING
> +                   "Failed to hide %pp used for XHCI console\n",
> +                   &uart->dbc.sbdf);
> +        break;
> +    case XHCI_SHARE_ANY:
> +        /* Do not hide. */
> +        break;
> +    }
> +#ifdef CONFIG_X86
> +    if ( rangeset_add_range(mmio_ro_ranges,
> +                PFN_DOWN(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset),
> +                PFN_UP(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset +
> +                       sizeof(*uart->dbc.dbc_reg)) - 1) )
> +        printk(XENLOG_INFO
> +               "Error while adding MMIO range of device to mmio_ro_ranges\n");

How can this allow use of the device by a domain? Is there some sort of
guarantee that nothing else will live in the same 4k range? I can't
infer such from xhci_find_dbc().

> @@ -1085,7 +1153,7 @@ void __init xhci_dbc_uart_init(void)
>          unsigned int bus, slot, func;
>  
>          e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
> -        if ( !e || *e )
> +        if ( !e || (*e && *e != ',') )
>          {
>              printk(XENLOG_ERR
>                     "Invalid dbgp= PCI device spec: '%s'\n",
> @@ -1094,6 +1162,37 @@ void __init xhci_dbc_uart_init(void)
>          }
>          dbc->sbdf = PCI_SBDF(0, bus, slot, func);
>      }
> +    opt = e;

Looks like e (and hence opt) cannot be NULL here, ...

> +    /* other options */
> +    while ( opt && *opt == ',' )
> +    {
> +        opt++;
> +        e = strchr(opt, ',');
> +        if ( !e )
> +            e = strchr(opt, '\0');
> +
> +        if ( !strncmp(opt, "share=", 6) )
> +        {
> +            if ( !cmdline_strcmp(opt + 6, "none") )
> +                dbc->share = XHCI_SHARE_NONE;
> +            else if ( !cmdline_strcmp(opt + 6, "hwdom") )
> +                dbc->share = XHCI_SHARE_HWDOM;
> +            else if ( !cmdline_strcmp(opt + 6, "any") )
> +                dbc->share = XHCI_SHARE_ANY;
> +            else
> +                break;
> +        }
> +        else
> +            break;
> +
> +        opt = e;

... nor here. Hence I wonder why the while() and ...

> +    }
> +    if ( !opt || *opt )

... this if() check for it being (non-)NULL. At which point ...

> +    {
> +        printk(XENLOG_ERR "Invalid dbgp= parameters: '%s'\n", opt_dbgp);

... you could make the message here more specific by passing "opt"
instead of the full "opt_dbgp".

Jan

